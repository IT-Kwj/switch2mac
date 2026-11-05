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
int _42(thread const int& _1774, thread const int& _1775, constant _10& support_buffer)
{
    int _1778 = 1 + _1775;
    float _1780 = support_buffer._m5[_1778].x;
    float _1782 = abs(_1780);
    bool _1784 = _1782 == 1.0;
    if (_1784)
    {
        return _1774;
    }
    float _1786 = float(_1774);
    float _1788 = _1786 / _1782;
    int _1790 = int(_1788);
    return _1790;
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
    float2 _778 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_778, float2(0.0), isnan(_778))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_778, float2(0.0), isnan(_778))).x;
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
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _60 * _82;
    float _106 = _60 * _94;
    float _108 = precise::max(_98, _104);
    bool _110 = _108 != 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    float _120 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _60 * _88;
    float _126 = precise::min(_122, _102);
    bool _128 = !_118;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_108, _130, 1.0);
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
        float _200 = fma(_62, _198, -0.5);
        float _202 = floor(_194);
        float _204 = -_196;
        float _206 = _192 + _204;
        float _208 = floor(_200);
        float _210 = _196 + (-0.5);
        float _212 = -_206;
        float _214 = _212 + 1.0;
        float _216 = -_206;
        float _218 = _216 + 2.0;
        float _220 = _214 * _214;
        float _222 = -_202;
        float _224 = _194 + _222;
        float _226 = 1.0 / _188;
        float _228 = _214 * _220;
        float _230 = float(_184);
        float _232 = _218 * _218;
        float _234 = -_224;
        float _236 = _234 + 1.0;
        float _238 = _228 * 4.0;
        float _240 = -_224;
        float _242 = _240 + 2.0;
        float _244 = fma(_64, _230, -0.5);
        float _246 = -_228;
        float _248 = _246 + 6.0;
        float _250 = -_238;
        float _252 = fma(_218, _232, _250);
        float _254 = _236 * _236;
        float _256 = floor(_244);
        float _258 = _242 * _242;
        float _260 = -_252;
        float _262 = _260 + _248;
        float _264 = _236 * _254;
        float _266 = -_208;
        float _268 = _200 + _266;
        float _270 = _196 + 1.5;
        float _272 = _262 * 0.16666667163372039794921875;
        float _274 = _264 * 4.0;
        float _276 = _206 * _206;
        float _278 = -_268;
        float _280 = _278 + 1.0;
        float _282 = _224 * _224;
        float _284 = -_274;
        float _286 = fma(_242, _258, _284);
        float _288 = 1.0 / _272;
        float _290 = -_264;
        float _292 = _290 + 6.0;
        float _294 = _206 * _276;
        float _296 = _280 * _280;
        float _298 = -_256;
        float _300 = _244 + _298;
        float _302 = -_286;
        float _304 = _302 + _292;
        float _306 = _294 * 0.16666667163372039794921875;
        float _308 = _280 * _296;
        float _310 = -_300;
        float _312 = _310 + 1.0;
        float _314 = _304 * 0.16666667163372039794921875;
        float _316 = -_268;
        float _318 = _316 + 2.0;
        float _320 = 1.0 / _198;
        float _322 = _224 * _282;
        float _324 = fma(_306, _288, _270);
        float _326 = _312 * _312;
        float _328 = _228 + _252;
        float _330 = _318 * _318;
        float _332 = _308 * 4.0;
        float _334 = _312 * _326;
        float _336 = -_300;
        float _338 = _336 + 2.0;
        float _340 = _328 * 0.16666667163372039794921875;
        float _342 = -_332;
        float _344 = fma(_318, _330, _342);
        float _346 = _264 + _286;
        float _348 = _338 * _338;
        float _350 = _334 * 4.0;
        float _352 = 1.0 / _340;
        float _354 = -_308;
        float _356 = _354 + 6.0;
        float _358 = _346 * 0.16666667163372039794921875;
        float _360 = -_350;
        float _362 = fma(_338, _348, _360);
        float _364 = -_334;
        float _366 = _364 + 6.0;
        float _368 = -_344;
        float _370 = _368 + _356;
        float _372 = _308 + _344;
        float _374 = _252 * 0.16666667163372039794921875;
        float _376 = 1.0 / _314;
        float _378 = -_362;
        float _380 = _378 + _366;
        float _382 = _372 * 0.16666667163372039794921875;
        float _384 = _334 + _362;
        float _386 = _322 * 0.16666667163372039794921875;
        float _388 = _380 * 0.16666667163372039794921875;
        float _390 = _202 + (-0.5);
        float _392 = _286 * 0.16666667163372039794921875;
        float _394 = 1.0 / _358;
        float _396 = fma(_374, _352, _210);
        float _398 = _202 + 1.5;
        float _400 = _384 * 0.16666667163372039794921875;
        float _402 = _370 * 0.16666667163372039794921875;
        float _404 = _344 * 0.16666667163372039794921875;
        float _406 = _396 * _190;
        float _408 = _324 * _190;
        float _410 = 1.0 / _382;
        float _412 = fma(_386, _376, _398);
        float _414 = _300 * _300;
        float _416 = _300 * _414;
        float _418 = _208 + (-0.5);
        float _420 = 1.0 / _388;
        float _422 = fma(_392, _394, _390);
        float _424 = _268 * _268;
        float _426 = _256 + 1.5;
        float _428 = _422 * _226;
        float _430 = _268 * _424;
        float _432 = _208 + 1.5;
        float _434 = 1.0 / _230;
        float _436 = _416 * 0.16666667163372039794921875;
        float _438 = fma(_404, _410, _418);
        float _440 = _256 + (-0.5);
        float _442 = _362 * 0.16666667163372039794921875;
        float _444 = _412 * _226;
        float _446 = _430 * 0.16666667163372039794921875;
        float _448 = 1.0 / _400;
        float _450 = fma(_436, _420, _426);
        float _452 = _438 * _320;
        float _454 = 1.0 / _402;
        float _456 = _450 * _434;
        float _458 = fma(_442, _448, _440);
        float _460 = _458 * _434;
        float2 _1299 = float2(_406, _428);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1299, float2(0.0), isnan(_1299)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1299, float2(0.0), isnan(_1299)), level(_142)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1314 = float2(_408, _428);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1314, float2(0.0), isnan(_1314)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1314, float2(0.0), isnan(_1314)), level(_142)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1329 = float2(_406, _444);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1329, float2(0.0), isnan(_1329)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1329, float2(0.0), isnan(_1329)), level(_142)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float _488 = fma(_446, _454, _432);
        float2 _1348 = float2(_408, _444);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1348, float2(0.0), isnan(_1348)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1348, float2(0.0), isnan(_1348)), level(_142)).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float _498 = _488 * _320;
        float2 _1366 = float2(_452, _460);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1366, float2(0.0), isnan(_1366)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1366, float2(0.0), isnan(_1366)), level(_148)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1381 = float2(_498, _460);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1381, float2(0.0), isnan(_1381)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1381, float2(0.0), isnan(_1381)), level(_148)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1396 = float2(_452, _456);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1396, float2(0.0), isnan(_1396)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1396, float2(0.0), isnan(_1396)), level(_148)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1411 = float2(_498, _456);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1411, float2(0.0), isnan(_1411)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1411, float2(0.0), isnan(_1411)), level(_148)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float _532 = -_142;
        float _534 = _136 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = -_476;
        float _540 = _468 + _538;
        float _542 = -_474;
        float _544 = _466 + _542;
        float _546 = -_492;
        float _548 = _482 + _546;
        float _550 = fma(_340, _540, _476);
        float _552 = fma(_340, _544, _474);
        float _554 = -_478;
        float _556 = _470 + _554;
        float _558 = fma(_340, _548, _492);
        float _560 = -_494;
        float _562 = _484 + _560;
        float _564 = -_496;
        float _566 = _486 + _564;
        float _568 = fma(_340, _556, _478);
        float _570 = -_558;
        float _572 = _570 + _552;
        float _574 = fma(_340, _562, _494);
        float _576 = -_512;
        float _578 = _504 + _576;
        float _580 = -_510;
        float _582 = _502 + _580;
        float _584 = fma(_358, _572, _558);
        float _586 = -_528;
        float _588 = _520 + _586;
        float _590 = fma(_382, _578, _512);
        float _592 = -_526;
        float _594 = _518 + _592;
        float _596 = -_574;
        float _598 = _596 + _550;
        float _600 = fma(_382, _588, _528);
        float _602 = fma(_382, _582, _510);
        float _604 = -_514;
        float _606 = _506 + _604;
        float _608 = -_530;
        float _610 = _522 + _608;
        float _612 = fma(_382, _594, _526);
        float _614 = -_600;
        float _616 = _614 + _590;
        float _618 = fma(_340, _566, _496);
        float _620 = fma(_358, _598, _574);
        float _622 = fma(_382, _606, _514);
        float _624 = fma(_382, _610, _530);
        float _626 = -_612;
        float _628 = _626 + _602;
        float _630 = fma(_400, _616, _600);
        float _632 = -_618;
        float _634 = _632 + _568;
        float _636 = -_624;
        float _638 = _636 + _622;
        float _640 = fma(_400, _628, _612);
        float _642 = -_620;
        float _644 = _642 + _630;
        float _646 = fma(_358, _634, _618);
        float _648 = fma(_400, _638, _624);
        float _650 = -_584;
        float _652 = _650 + _640;
        float _654 = fma(_536, _644, _620);
        float _656 = _126 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _658 = -_646;
        float _660 = _658 + _648;
        float _662 = fma(_536, _652, _584);
        float _664 = _654 * 0.586600005626678466796875;
        float _666 = fma(_536, _660, _646);
        float _668 = fma(_662, 0.29890000820159912109375, _664);
        float _670 = fma(_666, 0.1143999993801116943359375, _668);
        float _672 = -_662;
        float _674 = _672 + _670;
        float _676 = -_654;
        float _678 = _676 + _670;
        float _680 = -_666;
        float _682 = _680 + _670;
        float _684 = fma(_656, _674, _662);
        float _686 = 0.0 + _134;
        float _688 = precise::clamp(_686, 0.0, 1.0);
        float _690 = fma(_656, _678, _654);
        float _692 = fma(_656, _682, _666);
        float _694 = -_684;
        float _696 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[13].x, _694);
        float _698 = fma(_106, _688, _124);
        float _700 = -_690;
        float _702 = fma(_690, (*spvDescriptorSet0.fp_c3)._m0[13].y, _700);
        float _704 = -_692;
        float _706 = fma(_692, (*spvDescriptorSet0.fp_c3)._m0[13].z, _704);
        float _708 = fma(_126, _696, _684);
        float _710 = 1.0 / _698;
        float _712 = fma(_126, _702, _690);
        float _714 = fma(_126, _706, _692);
        float _716 = _688 * _708;
        float _718 = _688 * _712;
        float _720 = _688 * _714;
        float _722 = -_716;
        float _724 = _722 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _726 = -_718;
        float _728 = _726 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _730 = -_720;
        float _732 = _730 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _734 = fma(_124, _724, _716);
        float _736 = fma(_124, _728, _718);
        float _738 = fma(_124, _732, _720);
        float _740 = _734 * _710;
        float _742 = _736 * _710;
        float _744 = _738 * _710;
        out.m_34.x = _740;
        out.m_34.y = _742;
        out.m_34.z = _744;
        out.m_34.w = _698;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _124;
    return out;
}

