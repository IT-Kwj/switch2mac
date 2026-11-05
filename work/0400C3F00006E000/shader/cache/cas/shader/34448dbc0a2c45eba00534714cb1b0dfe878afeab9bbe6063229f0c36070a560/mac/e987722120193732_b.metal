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
int _42(thread const int& _1612, thread const int& _1613, constant _10& support_buffer)
{
    int _1616 = 1 + _1613;
    float _1618 = support_buffer._m5[_1616].x;
    float _1620 = abs(_1618);
    bool _1622 = _1620 == 1.0;
    if (_1622)
    {
        return _1612;
    }
    float _1624 = float(_1612);
    float _1626 = _1624 / _1620;
    int _1628 = int(_1626);
    return _1628;
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
    float2 _720 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_720, float2(0.0), isnan(_720))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_720, float2(0.0), isnan(_720))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _60 * _82;
    float _102 = precise::max(_98, _100);
    float _104 = _60 * _88;
    float _106 = _60 * _94;
    bool _108 = _102 != 0.0;
    bool _110 = isnan(_102);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    float _118 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = precise::min(_120, _124);
    bool _128 = !_116;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_102, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        float _142 = float(_140);
        float _144 = trunc(_142);
        int _146 = int(_144);
        float _148 = _142 + 1.0;
        float _150 = trunc(_148);
        int _152 = int(_150);
        int _154 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).x;
        int _156 = _154;
        int _158 = 1;
        int _160 = _42(_156, _158, (*spvDescriptorSet0.support_buffer));
        int _162 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_146), spvDescriptorSet0.fp_t_tcb_A.get_height(_146)).y;
        int _164 = _162;
        int _166 = 1;
        int _168 = _42(_164, _166, (*spvDescriptorSet0.support_buffer));
        int _170 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).x;
        int _172 = _170;
        int _174 = 1;
        int _176 = _42(_172, _174, (*spvDescriptorSet0.support_buffer));
        int _178 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_152), spvDescriptorSet0.fp_t_tcb_A.get_height(_152)).y;
        int _180 = _178;
        int _182 = 1;
        int _184 = _42(_180, _182, (*spvDescriptorSet0.support_buffer));
        float _186 = float(_160);
        float _188 = float(_168);
        float _190 = 1.0 / _186;
        float _192 = fma(_62, _186, -0.5);
        float _194 = fma(_64, _188, -0.5);
        float _196 = floor(_192);
        float _198 = float(_176);
        float _200 = float(_184);
        float _202 = fma(_62, _198, -0.5);
        float _204 = floor(_194);
        float _206 = -_196;
        float _208 = _192 + _206;
        float _210 = 1.0 / _188;
        float _212 = _196 + (-0.5);
        float _214 = -_208;
        float _216 = _214 + 1.0;
        float _218 = -_208;
        float _220 = _218 + 2.0;
        float _222 = _216 * _216;
        float _224 = _220 * _220;
        float _226 = -_204;
        float _228 = _194 + _226;
        float _230 = floor(_202);
        float _232 = _216 * _222;
        float _234 = fma(_64, _200, -0.5);
        float _236 = -_228;
        float _238 = _236 + 1.0;
        float _240 = _208 * _208;
        float _242 = _232 * 4.0;
        float _244 = -_232;
        float _246 = _244 + 6.0;
        float _248 = _238 * _238;
        float _250 = 1.0 / _200;
        float _252 = -_242;
        float _254 = fma(_220, _224, _252);
        float _256 = -_228;
        float _258 = _256 + 2.0;
        float _260 = _238 * _248;
        float _262 = -_254;
        float _264 = _262 + _246;
        float _266 = _258 * _258;
        float _268 = _260 * 4.0;
        float _270 = floor(_234);
        float _272 = _264 * 0.16666667163372039794921875;
        float _274 = _208 * _240;
        float _276 = -_230;
        float _278 = _202 + _276;
        float _280 = -_268;
        float _282 = fma(_258, _266, _280);
        float _284 = -_260;
        float _286 = _284 + 6.0;
        float _288 = _196 + 1.5;
        float _290 = -_278;
        float _292 = _290 + 1.0;
        float _294 = 1.0 / _272;
        float _296 = _274 * 0.16666667163372039794921875;
        float _298 = -_282;
        float _300 = _298 + _286;
        float _302 = -_270;
        float _304 = _234 + _302;
        float _306 = _292 * _292;
        float _308 = 1.0 / _198;
        float _310 = -_304;
        float _312 = _310 + 2.0;
        float _314 = _292 * _306;
        float _316 = _300 * 0.16666667163372039794921875;
        float _318 = fma(_296, _294, _288);
        float _320 = -_304;
        float _322 = _320 + 1.0;
        float _324 = -_278;
        float _326 = _324 + 2.0;
        float _328 = _314 * 4.0;
        float _330 = _232 + _254;
        float _332 = _322 * _322;
        float _334 = _326 * _326;
        float _336 = 1.0 / _316;
        float _338 = _330 * 0.16666667163372039794921875;
        float _340 = _322 * _332;
        float _342 = -_328;
        float _344 = fma(_326, _334, _342);
        float _346 = _260 + _282;
        float _348 = _312 * _312;
        float _350 = _340 * 4.0;
        float _352 = -_314;
        float _354 = _352 + 6.0;
        float _356 = 1.0 / _338;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = -_350;
        float _362 = fma(_312, _348, _360);
        float _364 = -_340;
        float _366 = _364 + 6.0;
        float _368 = _314 + _344;
        float _370 = _254 * 0.16666667163372039794921875;
        float _372 = -_344;
        float _374 = _372 + _354;
        float _376 = -_362;
        float _378 = _376 + _366;
        float _380 = 1.0 / _358;
        float _382 = _340 + _362;
        float _384 = _374 * 0.16666667163372039794921875;
        float _386 = _378 * 0.16666667163372039794921875;
        float _388 = _228 * _228;
        float _390 = _282 * 0.16666667163372039794921875;
        float _392 = _344 * 0.16666667163372039794921875;
        float _394 = _228 * _388;
        float _396 = _368 * 0.16666667163372039794921875;
        float _398 = fma(_370, _356, _212);
        float _400 = _204 + (-0.5);
        float _402 = _204 + 1.5;
        float _404 = 1.0 / _396;
        float _406 = _382 * 0.16666667163372039794921875;
        float _408 = _394 * 0.16666667163372039794921875;
        float _410 = fma(_390, _380, _400);
        float _412 = _278 * _278;
        float _414 = _398 * _190;
        float _416 = fma(_408, _336, _402);
        float _418 = _304 * _304;
        float _420 = 1.0 / _406;
        float _422 = _318 * _190;
        float _424 = _278 * _412;
        float _426 = _410 * _210;
        float _428 = _230 + (-0.5);
        float _430 = _304 * _418;
        float _432 = _416 * _210;
        float _434 = _230 + 1.5;
        float _436 = 1.0 / _384;
        float _438 = _270 + (-0.5);
        float _440 = _362 * 0.16666667163372039794921875;
        float _442 = fma(_392, _404, _428);
        float _444 = _270 + 1.5;
        float _446 = _424 * 0.16666667163372039794921875;
        float _448 = _430 * 0.16666667163372039794921875;
        float _450 = 1.0 / _386;
        float _452 = fma(_440, _420, _438);
        float _454 = _442 * _308;
        float2 _1231 = float2(_414, _426);
        float3 _458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1231, float2(0.0), isnan(_1231)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1231, float2(0.0), isnan(_1231)), level(_142)).xyz;
        float _460 = _458.x;
        float _462 = _458.y;
        float _464 = _458.z;
        float2 _1246 = float2(_422, _426);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1246, float2(0.0), isnan(_1246)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1246, float2(0.0), isnan(_1246)), level(_142)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float _474 = fma(_446, _436, _434);
        float _476 = _474 * _308;
        float _478 = fma(_448, _450, _444);
        float _480 = _452 * _250;
        float _482 = _478 * _250;
        float2 _1278 = float2(_414, _432);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1278, float2(0.0), isnan(_1278)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1278, float2(0.0), isnan(_1278)), level(_142)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1293 = float2(_422, _432);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_142)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1308 = float2(_454, _480);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1308, float2(0.0), isnan(_1308)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_148)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1323 = float2(_476, _480);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1323, float2(0.0), isnan(_1323)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1323, float2(0.0), isnan(_1323)), level(_148)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1338 = float2(_454, _482);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1338, float2(0.0), isnan(_1338)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1338, float2(0.0), isnan(_1338)), level(_148)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1353 = float2(_476, _482);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1353, float2(0.0), isnan(_1353)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1353, float2(0.0), isnan(_1353)), level(_148)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float _532 = 0.0 + _134;
        float _534 = precise::clamp(_532, 0.0, 1.0);
        float _536 = fma(_106, _534, _104);
        float _538 = -_468;
        float _540 = _460 + _538;
        float _542 = -_470;
        float _544 = _462 + _542;
        float _546 = -_472;
        float _548 = _464 + _546;
        float _550 = fma(_338, _540, _468);
        float _552 = fma(_338, _544, _470);
        float _554 = fma(_338, _548, _472);
        float _556 = -_496;
        float _558 = _488 + _556;
        float _560 = -_494;
        float _562 = _486 + _560;
        float _564 = -_498;
        float _566 = _490 + _564;
        float _568 = fma(_338, _558, _496);
        float _570 = fma(_338, _562, _494);
        float _572 = -_142;
        float _574 = _136 + _572;
        float _576 = precise::clamp(_574, 0.0, 1.0);
        float _578 = -_512;
        float _580 = _504 + _578;
        float _582 = -_568;
        float _584 = _582 + _552;
        float _586 = -_510;
        float _588 = _502 + _586;
        float _590 = -_514;
        float _592 = _506 + _590;
        float _594 = fma(_396, _580, _512);
        float _596 = fma(_358, _584, _568);
        float _598 = -_526;
        float _600 = _518 + _598;
        float _602 = -_528;
        float _604 = _520 + _602;
        float _606 = -_530;
        float _608 = _522 + _606;
        float _610 = fma(_396, _588, _510);
        float _612 = fma(_396, _600, _526);
        float _614 = fma(_396, _604, _528);
        float _616 = fma(_338, _566, _498);
        float _618 = fma(_396, _592, _514);
        float _620 = fma(_396, _608, _530);
        float _622 = -_570;
        float _624 = _622 + _550;
        float _626 = -_612;
        float _628 = _626 + _610;
        float _630 = -_614;
        float _632 = _630 + _594;
        float _634 = -_616;
        float _636 = _634 + _554;
        float _638 = -_620;
        float _640 = _638 + _618;
        float _642 = fma(_358, _624, _570);
        float _644 = fma(_406, _628, _612);
        float _646 = fma(_406, _632, _614);
        float _648 = fma(_358, _636, _616);
        float _650 = fma(_406, _640, _620);
        float _652 = -_642;
        float _654 = _652 + _644;
        float _656 = -_596;
        float _658 = _656 + _646;
        float _660 = -_648;
        float _662 = _660 + _650;
        float _664 = fma(_576, _654, _642);
        float _666 = fma(_576, _658, _596);
        float _668 = fma(_576, _662, _648);
        float _670 = -_664;
        float _672 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].x, _670);
        float _674 = -_666;
        float _676 = fma(_666, (*spvDescriptorSet0.fp_c3)._m0[13].y, _674);
        float _678 = -_668;
        float _680 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[13].z, _678);
        float _682 = fma(_126, _672, _664);
        float _684 = fma(_126, _676, _666);
        float _686 = fma(_126, _680, _668);
        out.m_34.x = _682;
        out.m_34.y = _684;
        out.m_34.z = _686;
        out.m_34.w = _536;
        return out;
    }
    discard_fragment();
    return out;
}

