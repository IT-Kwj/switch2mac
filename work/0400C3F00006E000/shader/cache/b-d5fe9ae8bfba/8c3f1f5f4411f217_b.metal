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
int _42(thread const int& _1706, thread const int& _1707, constant _10& support_buffer)
{
    int _1710 = 1 + _1707;
    float _1712 = support_buffer._m5[_1710].x;
    float _1714 = abs(_1712);
    bool _1716 = _1714 == 1.0;
    if (_1716)
    {
        return _1706;
    }
    float _1718 = float(_1706);
    float _1720 = _1718 / _1714;
    int _1722 = int(_1720);
    return _1722;
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
    float2 _752 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_752, float2(0.0), isnan(_752))).x;
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
    float _98 = precise::max(_92, _96);
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = precise::min(_102, _106);
    float _110 = _60 * _76;
    float _112 = _60 * _88;
    float _114 = precise::max(_98, _110);
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
        float _200 = fma(_62, _198, -0.5);
        float _202 = floor(_194);
        float _204 = -_196;
        float _206 = _192 + _204;
        float _208 = floor(_200);
        float _210 = _196 + 1.5;
        float _212 = _196 + (-0.5);
        float _214 = -_206;
        float _216 = _214 + 1.0;
        float _218 = -_206;
        float _220 = _218 + 2.0;
        float _222 = _216 * _216;
        float _224 = _220 * _220;
        float _226 = -_202;
        float _228 = _194 + _226;
        float _230 = 1.0 / _188;
        float _232 = _216 * _222;
        float _234 = float(_184);
        float _236 = -_228;
        float _238 = _236 + 1.0;
        float _240 = _228 * _228;
        float _242 = _232 * 4.0;
        float _244 = fma(_64, _234, -0.5);
        float _246 = -_232;
        float _248 = _246 + 6.0;
        float _250 = -_242;
        float _252 = fma(_220, _224, _250);
        float _254 = _238 * _238;
        float _256 = floor(_244);
        float _258 = -_228;
        float _260 = _258 + 2.0;
        float _262 = -_252;
        float _264 = _262 + _248;
        float _266 = _232 + _252;
        float _268 = _252 * 0.16666667163372039794921875;
        float _270 = _260 * _260;
        float _272 = _264 * 0.16666667163372039794921875;
        float _274 = _238 * _254;
        float _276 = _206 * _206;
        float _278 = -_208;
        float _280 = _200 + _278;
        float _282 = 1.0 / _272;
        float _284 = _274 * 4.0;
        float _286 = _206 * _276;
        float _288 = -_280;
        float _290 = _288 + 1.0;
        float _292 = _266 * 0.16666667163372039794921875;
        float _294 = -_284;
        float _296 = fma(_260, _270, _294);
        float _298 = _286 * 0.16666667163372039794921875;
        float _300 = -_256;
        float _302 = _244 + _300;
        float _304 = -_274;
        float _306 = _304 + 6.0;
        float _308 = _290 * _290;
        float _310 = 1.0 / _198;
        float _312 = _274 + _296;
        float _314 = -_296;
        float _316 = _314 + _306;
        float _318 = _290 * _308;
        float _320 = -_302;
        float _322 = _320 + 2.0;
        float _324 = _312 * 0.16666667163372039794921875;
        float _326 = fma(_298, _282, _210);
        float _328 = -_302;
        float _330 = _328 + 1.0;
        float _332 = _318 * 4.0;
        float _334 = -_280;
        float _336 = _334 + 2.0;
        float _338 = 1.0 / _292;
        float _340 = _330 * _330;
        float _342 = _316 * 0.16666667163372039794921875;
        float _344 = _336 * _336;
        float _346 = _228 * _240;
        float _348 = _330 * _340;
        float _350 = -_332;
        float _352 = fma(_336, _344, _350);
        float _354 = -_318;
        float _356 = _354 + 6.0;
        float _358 = 1.0 / _342;
        float _360 = _322 * _322;
        float _362 = _348 * 4.0;
        float _364 = _318 + _352;
        float _366 = _346 * 0.16666667163372039794921875;
        float _368 = -_362;
        float _370 = fma(_322, _360, _368);
        float _372 = -_348;
        float _374 = _372 + 6.0;
        float _376 = _364 * 0.16666667163372039794921875;
        float _378 = -_352;
        float _380 = _378 + _356;
        float _382 = _348 + _370;
        float _384 = 1.0 / _324;
        float _386 = -_370;
        float _388 = _386 + _374;
        float _390 = _380 * 0.16666667163372039794921875;
        float _392 = fma(_268, _338, _212);
        float _394 = _202 + (-0.5);
        float _396 = _202 + 1.5;
        float _398 = _388 * 0.16666667163372039794921875;
        float _400 = _382 * 0.16666667163372039794921875;
        float _402 = 1.0 / _390;
        float _404 = fma(_366, _358, _396);
        float _406 = _296 * 0.16666667163372039794921875;
        float _408 = _280 * _280;
        float _410 = _392 * _190;
        float _412 = _326 * _190;
        float _414 = _208 + 1.5;
        float _416 = _280 * _408;
        float _418 = 1.0 / _376;
        float _420 = fma(_406, _384, _394);
        float _422 = _302 * _302;
        float _424 = _256 + 1.5;
        float _426 = _352 * 0.16666667163372039794921875;
        float _428 = _420 * _230;
        float _430 = _302 * _422;
        float _432 = _208 + (-0.5);
        float _434 = 1.0 / _400;
        float _436 = _256 + (-0.5);
        float _438 = _416 * 0.16666667163372039794921875;
        float _440 = _370 * 0.16666667163372039794921875;
        float _442 = _430 * 0.16666667163372039794921875;
        float _444 = _404 * _230;
        float _446 = fma(_438, _402, _414);
        float _448 = 1.0 / _398;
        float _450 = fma(_426, _418, _432);
        float _452 = _446 * _310;
        float _454 = 1.0 / _234;
        float _456 = fma(_440, _434, _436);
        float _458 = fma(_442, _448, _424);
        float _460 = _450 * _310;
        float _462 = _456 * _454;
        float _464 = _458 * _454;
        float2 _1280 = float2(_410, _428);
        float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1280, float2(0.0), isnan(_1280)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1280, float2(0.0), isnan(_1280)), level(_142)).xyz;
        float _470 = _468.x;
        float _472 = _468.y;
        float _474 = _468.z;
        float2 _1295 = float2(_412, _428);
        float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1295, float2(0.0), isnan(_1295)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1295, float2(0.0), isnan(_1295)), level(_142)).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        float2 _1310 = float2(_410, _444);
        float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1310, float2(0.0), isnan(_1310)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1310, float2(0.0), isnan(_1310)), level(_142)).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        float2 _1325 = float2(_412, _444);
        float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1325, float2(0.0), isnan(_1325)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1325, float2(0.0), isnan(_1325)), level(_142)).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        float2 _1340 = float2(_460, _462);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1340, float2(0.0), isnan(_1340)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1340, float2(0.0), isnan(_1340)), level(_148)).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        float2 _1355 = float2(_452, _462);
        float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1355, float2(0.0), isnan(_1355)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1355, float2(0.0), isnan(_1355)), level(_148)).xyz;
        float _510 = _508.x;
        float _512 = _508.y;
        float _514 = _508.z;
        float2 _1370 = float2(_460, _464);
        float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1370, float2(0.0), isnan(_1370)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1370, float2(0.0), isnan(_1370)), level(_148)).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        float2 _1385 = float2(_452, _464);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1385, float2(0.0), isnan(_1385)), level(_148)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1385, float2(0.0), isnan(_1385)), level(_148)).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        float _532 = -_142;
        float _534 = _136 + _532;
        float _536 = precise::clamp(_534, 0.0, 1.0);
        float _538 = -_478;
        float _540 = _470 + _538;
        float _542 = -_480;
        float _544 = _472 + _542;
        float _546 = -_494;
        float _548 = _486 + _546;
        float _550 = -_498;
        float _552 = _490 + _550;
        float _554 = fma(_292, _540, _478);
        float _556 = -_482;
        float _558 = _474 + _556;
        float _560 = -_496;
        float _562 = _488 + _560;
        float _564 = fma(_292, _544, _480);
        float _566 = fma(_292, _548, _494);
        float _568 = -_510;
        float _570 = _502 + _568;
        float _572 = -_512;
        float _574 = _504 + _572;
        float _576 = -_514;
        float _578 = _506 + _576;
        float _580 = -_526;
        float _582 = _518 + _580;
        float _584 = fma(_376, _570, _510);
        float _586 = fma(_376, _574, _512);
        float _588 = -_528;
        float _590 = _520 + _588;
        float _592 = -_530;
        float _594 = _522 + _592;
        float _596 = fma(_292, _558, _482);
        float _598 = fma(_292, _562, _496);
        float _600 = fma(_292, _552, _498);
        float _602 = fma(_376, _582, _526);
        float _604 = fma(_376, _590, _528);
        float _606 = fma(_376, _578, _514);
        float _608 = fma(_376, _594, _530);
        float _610 = -_566;
        float _612 = _610 + _554;
        float _614 = -_598;
        float _616 = _614 + _564;
        float _618 = -_602;
        float _620 = _618 + _584;
        float _622 = -_604;
        float _624 = _622 + _586;
        float _626 = -_600;
        float _628 = _626 + _596;
        float _630 = -_608;
        float _632 = _630 + _606;
        float _634 = fma(_324, _612, _566);
        float _636 = fma(_324, _616, _598);
        float _638 = fma(_400, _620, _602);
        float _640 = fma(_400, _624, _604);
        float _642 = fma(_324, _628, _600);
        float _644 = fma(_400, _632, _608);
        float _646 = -_634;
        float _648 = _646 + _638;
        float _650 = -_636;
        float _652 = _650 + _640;
        float _654 = 0.0 + _134;
        float _656 = precise::clamp(_654, 0.0, 1.0);
        float _658 = -_642;
        float _660 = _658 + _644;
        float _662 = fma(_536, _648, _634);
        float _664 = fma(_536, _652, _636);
        float _666 = fma(_536, _660, _642);
        float _668 = -_662;
        float _670 = fma(_662, (*spvDescriptorSet0.fp_c3)._m0[13].x, _668);
        float _672 = fma(_112, _656, _116);
        float _674 = -_664;
        float _676 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[13].y, _674);
        float _678 = -_666;
        float _680 = fma(_666, (*spvDescriptorSet0.fp_c3)._m0[13].z, _678);
        float _682 = fma(_108, _670, _662);
        float _684 = 1.0 / _672;
        float _686 = fma(_108, _676, _664);
        float _688 = fma(_108, _680, _666);
        float _690 = _656 * _682;
        float _692 = _656 * _686;
        float _694 = _656 * _688;
        float _696 = -_690;
        float _698 = _696 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _700 = -_692;
        float _702 = _700 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _704 = -_694;
        float _706 = _704 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _708 = fma(_116, _698, _690);
        float _710 = fma(_116, _702, _692);
        float _712 = fma(_116, _706, _694);
        float _714 = _708 * _684;
        float _716 = _710 * _684;
        float _718 = _712 * _684;
        out.m_34.x = _714;
        out.m_34.y = _716;
        out.m_34.z = _718;
        out.m_34.w = _672;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _116;
    return out;
}

