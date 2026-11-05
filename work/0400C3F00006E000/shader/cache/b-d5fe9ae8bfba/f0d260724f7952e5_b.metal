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
int _42(thread const int& _1651, thread const int& _1652, constant _10& support_buffer)
{
    int _1655 = 1 + _1652;
    float _1657 = support_buffer._m5[_1655].x;
    float _1659 = abs(_1657);
    bool _1661 = _1659 == 1.0;
    if (_1661)
    {
        return _1651;
    }
    float _1663 = float(_1651);
    float _1665 = _1663 / _1659;
    int _1667 = int(_1665);
    return _1667;
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
    float2 _734 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_734, float2(0.0), isnan(_734))).x;
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
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::max(_92, _96);
    float _104 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::min(_100, _106);
    float _110 = _60 * _76;
    float _112 = _60 * _88;
    float _114 = precise::max(_102, _110);
    float _116 = _60 * _82;
    bool _118 = _114 != 0.0;
    bool _120 = isnan(_114);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    bool _128 = !_126;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_114, _130, 1.0);
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
        float _210 = floor(_202);
        float _212 = _196 + (-0.5);
        float _214 = -_208;
        float _216 = _214 + 1.0;
        float _218 = -_208;
        float _220 = _218 + 2.0;
        float _222 = _216 * _216;
        float _224 = _220 * _220;
        float _226 = -_204;
        float _228 = _194 + _226;
        float _230 = 1.0 / _188;
        float _232 = _216 * _222;
        float _234 = _232 * 4.0;
        float _236 = -_234;
        float _238 = fma(_220, _224, _236);
        float _240 = fma(_64, _200, -0.5);
        float _242 = -_232;
        float _244 = _242 + 6.0;
        float _246 = -_228;
        float _248 = _246 + 1.0;
        float _250 = -_228;
        float _252 = _250 + 2.0;
        float _254 = floor(_240);
        float _256 = -_238;
        float _258 = _256 + _244;
        float _260 = _248 * _248;
        float _262 = _252 * _252;
        float _264 = _258 * 0.16666667163372039794921875;
        float _266 = _208 * _208;
        float _268 = _248 * _260;
        float _270 = 1.0 / _200;
        float _272 = _208 * _266;
        float _274 = -_210;
        float _276 = _202 + _274;
        float _278 = _268 * 4.0;
        float _280 = _196 + 1.5;
        float _282 = -_276;
        float _284 = _282 + 1.0;
        float _286 = 1.0 / _264;
        float _288 = -_278;
        float _290 = fma(_252, _262, _288);
        float _292 = -_268;
        float _294 = _292 + 6.0;
        float _296 = _284 * _284;
        float _298 = _272 * 0.16666667163372039794921875;
        float _300 = -_254;
        float _302 = _240 + _300;
        float _304 = -_290;
        float _306 = _304 + _294;
        float _308 = _284 * _296;
        float _310 = 1.0 / _198;
        float _312 = -_302;
        float _314 = _312 + 1.0;
        float _316 = _308 * 4.0;
        float _318 = fma(_298, _286, _280);
        float _320 = -_276;
        float _322 = _320 + 2.0;
        float _324 = _232 + _238;
        float _326 = _306 * 0.16666667163372039794921875;
        float _328 = _314 * _314;
        float _330 = _322 * _322;
        float _332 = _324 * 0.16666667163372039794921875;
        float _334 = _238 * 0.16666667163372039794921875;
        float _336 = _314 * _328;
        float _338 = -_316;
        float _340 = fma(_322, _330, _338);
        float _342 = _268 + _290;
        float _344 = -_308;
        float _346 = _344 + 6.0;
        float _348 = -_302;
        float _350 = _348 + 2.0;
        float _352 = 1.0 / _332;
        float _354 = _342 * 0.16666667163372039794921875;
        float _356 = _336 * 4.0;
        float _358 = _350 * _350;
        float _360 = -_340;
        float _362 = _360 + _346;
        float _364 = _308 + _340;
        float _366 = _340 * 0.16666667163372039794921875;
        float _368 = -_356;
        float _370 = fma(_350, _358, _368);
        float _372 = 1.0 / _354;
        float _374 = _228 * _228;
        float _376 = -_336;
        float _378 = _376 + 6.0;
        float _380 = _336 + _370;
        float _382 = _204 + 1.5;
        float _384 = _228 * _374;
        float _386 = _364 * 0.16666667163372039794921875;
        float _388 = _204 + (-0.5);
        float _390 = 1.0 / _326;
        float _392 = fma(_334, _352, _212);
        float _394 = _290 * 0.16666667163372039794921875;
        float _396 = _384 * 0.16666667163372039794921875;
        float _398 = -_370;
        float _400 = _398 + _378;
        float _402 = _380 * 0.16666667163372039794921875;
        float _404 = _362 * 0.16666667163372039794921875;
        float _406 = _392 * _190;
        float _408 = 1.0 / _386;
        float _410 = fma(_394, _372, _388);
        float _412 = _400 * 0.16666667163372039794921875;
        float _414 = _302 * _302;
        float _416 = _318 * _190;
        float _418 = _410 * _230;
        float _420 = _302 * _414;
        float _422 = 1.0 / _402;
        float _424 = fma(_396, _390, _382);
        float _426 = _276 * _276;
        float _428 = _210 + (-0.5);
        float _430 = _210 + 1.5;
        float _432 = _424 * _230;
        float _434 = _276 * _426;
        float _436 = _254 + (-0.5);
        float _438 = 1.0 / _404;
        float _440 = _254 + 1.5;
        float _442 = _370 * 0.16666667163372039794921875;
        float _444 = fma(_366, _408, _428);
        float _446 = _434 * 0.16666667163372039794921875;
        float _448 = _420 * 0.16666667163372039794921875;
        float _450 = _444 * _310;
        float _452 = 1.0 / _412;
        float _454 = fma(_442, _422, _436);
        float _456 = _454 * _270;
        float _458 = fma(_446, _438, _430);
        float _460 = _458 * _310;
        float _462 = fma(_448, _452, _440);
        float2 _1259 = float2(_406, _418);
        float3 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1259, float2(0.0), isnan(_1259)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1259, float2(0.0), isnan(_1259)), level(_142)).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        float2 _1274 = float2(_416, _418);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1274, float2(0.0), isnan(_1274)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1274, float2(0.0), isnan(_1274)), level(_142)).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        float _482 = _462 * _270;
        float2 _1292 = float2(_406, _432);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1292, float2(0.0), isnan(_1292)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1292, float2(0.0), isnan(_1292)), level(_142)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1307 = float2(_416, _432);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1307, float2(0.0), isnan(_1307)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1307, float2(0.0), isnan(_1307)), level(_142)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1322 = float2(_450, _456);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1322, float2(0.0), isnan(_1322)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1322, float2(0.0), isnan(_1322)), level(_148)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1337 = float2(_460, _456);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1337, float2(0.0), isnan(_1337)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1337, float2(0.0), isnan(_1337)), level(_148)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1352 = float2(_450, _482);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1352, float2(0.0), isnan(_1352)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1352, float2(0.0), isnan(_1352)), level(_148)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1367 = float2(_460, _482);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1367, float2(0.0), isnan(_1367)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1367, float2(0.0), isnan(_1367)), level(_148)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float _532 = -_142;
        float _534 = _136 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = 0.0 + _134;
        float _540 = precise::clamp(_538, 0.0, 1.0);
        float _542 = fma(_112, _540, _116);
        float _544 = _540 * _112;
        float _546 = -_476;
        float _548 = _468 + _546;
        float _550 = -_478;
        float _552 = _470 + _550;
        float _554 = -_480;
        float _556 = _472 + _554;
        float _558 = fma(_332, _548, _476);
        float _560 = -_510;
        float _562 = _502 + _560;
        float _564 = -_512;
        float _566 = _504 + _564;
        float _568 = -_494;
        float _570 = _486 + _568;
        float _572 = -_496;
        float _574 = _488 + _572;
        float _576 = -_498;
        float _578 = _490 + _576;
        float _580 = fma(_386, _562, _510);
        float _582 = -_514;
        float _584 = _506 + _582;
        float _586 = -_530;
        float _588 = _522 + _586;
        float _590 = fma(_386, _566, _512);
        float _592 = -_526;
        float _594 = _518 + _592;
        float _596 = fma(_332, _552, _478);
        float _598 = fma(_332, _556, _480);
        float _600 = fma(_332, _570, _494);
        float _602 = fma(_332, _574, _496);
        float _604 = -_528;
        float _606 = _520 + _604;
        float _608 = fma(_332, _578, _498);
        float _610 = fma(_386, _584, _514);
        float _612 = fma(_386, _588, _530);
        float _614 = fma(_386, _594, _526);
        float _616 = fma(_386, _606, _528);
        float _618 = -_608;
        float _620 = _618 + _598;
        float _622 = -_612;
        float _624 = _622 + _610;
        float _626 = -_600;
        float _628 = _626 + _558;
        float _630 = -_614;
        float _632 = _630 + _580;
        float _634 = -_616;
        float _636 = _634 + _590;
        float _638 = -_602;
        float _640 = _638 + _596;
        float _642 = fma(_354, _620, _608);
        float _644 = fma(_402, _624, _612);
        float _646 = fma(_354, _628, _600);
        float _648 = fma(_402, _632, _614);
        float _650 = fma(_402, _636, _616);
        float _652 = 1.0 / _542;
        float _654 = fma(_354, _640, _602);
        float _656 = -_642;
        float _658 = _656 + _644;
        float _660 = -_646;
        float _662 = _660 + _648;
        float _664 = -_654;
        float _666 = _664 + _650;
        float _668 = fma(_536, _658, _642);
        float _670 = fma(_536, _662, _646);
        float _672 = fma(_536, _666, _654);
        float _674 = -_668;
        float _676 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[13].z, _674);
        float _678 = -_670;
        float _680 = fma(_670, (*spvDescriptorSet0.fp_c3)._m0[13].x, _678);
        float _682 = -_672;
        float _684 = fma(_672, (*spvDescriptorSet0.fp_c3)._m0[13].y, _682);
        float _686 = fma(_108, _676, _668);
        float _688 = fma(_108, _680, _670);
        float _690 = _652 * _544;
        float _692 = fma(_108, _684, _672);
        float _694 = _686 * _544;
        float _696 = _688 * _690;
        float _698 = _692 * _690;
        float _700 = _694 * _652;
        out.m_34.x = _696;
        out.m_34.y = _698;
        out.m_34.z = _700;
        out.m_34.w = _542;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _116;
    return out;
}

