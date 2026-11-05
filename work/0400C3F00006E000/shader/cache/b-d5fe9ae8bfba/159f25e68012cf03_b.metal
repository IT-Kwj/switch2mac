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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _851 = float2(_104, _106);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_851, float2(0.0), isnan(_851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_851, float2(0.0), isnan(_851))).w;
    float2 _862 = float2(_108, _110);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_862, float2(0.0), isnan(_862))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_862, float2(0.0), isnan(_862))).xw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = in.m_46.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_50.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _102 * _126;
    float _142 = _102 * _132;
    float _144 = _102 * _138;
    float _146 = in.m_44.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _102 * _150;
    float _154 = _112 * _120;
    float _156 = -_154;
    float _158 = _120 + _156;
    float _160 = fma(_140, _158, _154);
    bool _164 = _160 >= _142;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan(_142);
    bool _172 = _168 || _170;
    float _174 = float(_172);
    float _176 = 0.0 + _174;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _178 * _144;
    bool _182 = _180 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_180);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_44.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_190)
    {
        discard_fragment();
    }
    float _198 = _102 * _196;
    float2 _981 = float2(_152, _198);
    float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_981, float2(0.0), isnan(_981))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_981, float2(0.0), isnan(_981))).xy;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = in.m_52.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_52.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_52.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_54.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_54.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_56.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_54.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_56.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_56.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_46.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_46.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_46.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _102 * _210;
    float _280 = _102 * _216;
    float _282 = _102 * _222;
    float _284 = _102 * _228;
    float _286 = _278 * _278;
    float _288 = _284 * _284;
    float _290 = fma(_280, _280, _286);
    float _292 = _102 * _246;
    float _294 = _102 * _258;
    float _296 = _102 * _276;
    float _298 = fma(_282, _282, _290);
    float _300 = _102 * _234;
    float _302 = _102 * _240;
    float _304 = fma(_300, _300, _288);
    float _306 = rsqrt(_298);
    float _308 = _102 * _252;
    float _310 = _302 * _302;
    float _312 = fma(_292, _292, _304);
    float _314 = fma(_308, _308, _310);
    float _316 = rsqrt(_312);
    float _318 = fma(_294, _294, _314);
    float _320 = _278 * _306;
    float _322 = _280 * _306;
    float _324 = _282 * _306;
    float _326 = rsqrt(_318);
    float _328 = _320 * _320;
    float _330 = fma(_322, _322, _328);
    float _332 = fma(_324, _324, _330);
    float _334 = rsqrt(_332);
    float _336 = _294 * _326;
    float _338 = _204 * _204;
    float _340 = _326 * _204;
    float _342 = _202 * _316;
    float _344 = fma(_202, _202, _338);
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = _302 * _340;
    float _350 = _308 * _340;
    float _352 = _204 * _336;
    float _354 = -_346;
    float _356 = _354 + 1.0;
    float _358 = fma(_284, _342, _348);
    float _360 = fma(_300, _342, _350);
    float _362 = fma(_292, _342, _352);
    float _364 = in.m_48.x;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_48.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = sqrt(_356);
    float _378 = in.m_48.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = _102 * _270;
    float _386 = _334 * _376;
    float _388 = fma(_320, _386, _358);
    float _390 = fma(_322, _386, _360);
    float _392 = fma(_324, _386, _362);
    float _394 = _388 * _388;
    float _396 = fma(_390, _390, _394);
    float _398 = _102 * _368;
    float _400 = _102 * _374;
    float _402 = fma(_392, _392, _396);
    float _404 = _102 * _382;
    float _406 = -_400;
    float _408 = _406 + _384;
    float _410 = -_404;
    float _412 = _410 + _296;
    float _414 = rsqrt(_402);
    float _416 = _388 * _414;
    float _418 = _392 * _414;
    float _420 = _416 * (-0.816474258899688720703125);
    float _422 = -_420;
    float _424 = fma(_418, 0.577381789684295654296875, _422);
    float _426 = _102 * _264;
    float _428 = fma(_424, 0.5, 0.5);
    float _430 = -_398;
    float _432 = _430 + _426;
    float _434 = _428 * _428;
    float _436 = fma(_434, _432, _398);
    float _438 = fma(_434, _408, _400);
    float _440 = fma(_434, _412, _404);
    if (!_190)
    {
        out.m_59.x = _436;
        out.m_59.y = _438;
        out.m_59.z = _440;
        out.m_59.w = _174;
        return out;
    }
    float _442 = in.m_61.w;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _450 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _448);
    float _452 = _102 * _446;
    bool _454 = _452 != 1.0;
    bool _456 = isnan(_452);
    bool _458 = _454 || _456;
    bool _460 = isnan(1.0);
    bool _462 = _458 || _460;
    bool _464 = !_462;
    if (!_464)
    {
        float _466 = gl_FragCoord.x;
        float _468 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _470 = _466 / _468;
        float _472 = gl_FragCoord.y;
        float _474 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _476 = _472 / _474;
        float _478 = _452 * 256.0;
        float _480 = trunc(_478);
        int _483 = int(_480);
        uint _486 = uint(int(uint(_483) >> uint(7)));
        int _488 = int(_486) + _483;
        float _490 = trunc(_470);
        int _492 = int(_490);
        float _494 = trunc(_476);
        int _496 = int(_494);
        int _498 = _492 + 2;
        int _500 = _498 >> 1;
        uint _502 = uint(int(uint(_496) >> uint(1)));
        int _504 = _500 ^ int(_502);
        int _506 = _504 << 16;
        int _508 = _506 ^ _500;
        int _510 = 983055 & _508;
        int _512 = _510 << 6;
        int _514 = _512 + _510;
        int _516 = _514 & 13369548;
        uint _518 = uint(int(uint(_516) >> uint(3)));
        int _520 = _516 | int(_518);
        int _522 = _520 & 5570560;
        int _524 = _520 & 85;
        uint _526 = uint(int(uint(_522) >> uint(15)));
        int _528 = int(_526) + _524;
        bool _530 = uint(_488) > uint(_528);
        if (!_530)
        {
            discard_fragment();
        }
        if (!_530)
        {
            out.m_59.x = _436;
            out.m_59.y = _438;
            out.m_59.z = _440;
            out.m_59.w = _180;
            return out;
        }
    }
    float _532 = fma(_320, _376, _358);
    float _534 = fma(_322, _376, _360);
    float _536 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _450);
    float _538 = fma(_324, _376, _362);
    float _540 = _532 * _532;
    float _542 = in.m_61.x;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = _390 * _414;
    float _550 = fma(_534, _534, _540);
    float _552 = rsqrt(_536);
    float _554 = -_434;
    float _556 = _554 + 1.0;
    float _558 = -_118;
    float _560 = _558 + 1.0;
    float _562 = fma(_538, _538, _550);
    float _564 = -_556;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _568 = rsqrt(_562);
    float _570 = _552 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _572 = _416 * _570;
    float _574 = _552 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _576 = _534 * _568;
    float _578 = _532 * _568;
    float _580 = fma(_548, _574, _572);
    float _582 = _538 * _568;
    float _584 = _552 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _586 = _102 * _546;
    float _588 = abs(_576);
    float _590 = abs(_578);
    float _592 = precise::max(_588, _590);
    float _594 = fma(_418, _584, _580);
    float _596 = abs(_582);
    float _598 = precise::max(_596, _592);
    float _600 = fma(_594, -0.5, 0.5);
    float _602 = 1.0 / _598;
    float _604 = fma(_600, (*spvDescriptorSet0.fp_c9)._m0[191].z, _566);
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = -_606;
    float _610 = _608 + 1.0;
    float _612 = fma(_560, (*spvDescriptorSet0.fp_c9)._m0[191].x, _610);
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _586 + _614;
    float _618 = _576 * _602;
    float _620 = _578 * _602;
    float _622 = -_602;
    float _624 = _582 * _622;
    float _626 = precise::min(_616, 1.0);
    float3 _1631 = float3(_618, _620, _624);
    float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1631, float3(0.0), isnan(_1631)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1631, float3(0.0), isnan(_1631)), level(_626)).xyz;
    float _632 = _630.x;
    float _634 = _630.y;
    float _636 = _630.z;
    float _638 = in.m_63.z;
    float _640 = gl_FragCoord.w;
    float _642 = _638 * _640;
    float _644 = in.m_63.x;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = in.m_63.y;
    float _652 = gl_FragCoord.w;
    float _654 = _650 * _652;
    float _656 = in.m_65.z;
    float _658 = gl_FragCoord.w;
    float _660 = _656 * _658;
    float _662 = in.m_65.x;
    float _664 = gl_FragCoord.w;
    float _666 = _662 * _664;
    float _668 = in.m_65.y;
    float _670 = gl_FragCoord.w;
    float _672 = _668 * _670;
    float _674 = in.m_67.x;
    float _676 = gl_FragCoord.w;
    float _678 = _674 * _676;
    float _680 = in.m_67.w;
    float _682 = gl_FragCoord.w;
    float _684 = _680 * _682;
    float _686 = in.m_67.y;
    float _688 = gl_FragCoord.w;
    float _690 = _686 * _688;
    float _692 = in.m_67.z;
    float _694 = gl_FragCoord.w;
    float _696 = _692 * _694;
    bool _698 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _700 = _102 * _642;
    float _702 = _102 * _648;
    float _704 = _102 * _654;
    float _706 = fma(_636, 0.20999999344348907470703125, _700);
    float _708 = fma(_632, 0.20999999344348907470703125, _702);
    float _710 = _102 * _660;
    float _712 = fma(_634, 0.20999999344348907470703125, _704);
    float _714 = _102 * _666;
    float _716 = _102 * _672;
    float _718 = _706 + _710;
    float _720 = _708 + _714;
    float _722 = _712 + _716;
    float _724 = _440 * _718;
    float _726 = 0.0 + _180;
    float _728 = precise::clamp(_726, 0.0, 1.0);
    float _730 = _436 * _720;
    float _732 = _102 * _678;
    float _734 = _102 * _684;
    float _736 = _438 * _722;
    float _738 = _102 * _690;
    float _740 = _102 * _696;
    float _742 = fma(_730, _734, _732);
    float _744 = _732;
    if (!_698)
    {
        _744 = _728;
    }
    float _746 = _744;
    float _748 = fma(_736, _734, _738);
    float _750 = fma(_724, _734, _740);
    bool _752 = !_698;
    float _754 = _746;
    if (!_752)
    {
        float _756 = in.m_69.w;
        float _758 = gl_FragCoord.w;
        float _760 = _756 * _758;
        float _762 = in.m_69.z;
        float _764 = gl_FragCoord.w;
        float _766 = _762 * _764;
        float _768 = _102 * _760;
        float _770 = _102 * _766;
        float _772 = 1.0 / _768;
        float _774 = _770 * _772;
        float _776 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _778 = fma(_774, (*spvDescriptorSet0.fp_c8)._m0[30].w, _776);
        float _780 = 1.0 / _778;
        float _782 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _784 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _786 = fma(_780, _782, _784);
        float _788 = _786 * 8.0;
        float _790 = precise::clamp(_788, 0.0, 1.0);
        float _792 = _728 * _790;
        _754 = _792;
    }
    float _794 = _754;
    float _796 = 0.0 + _794;
    float _798 = precise::clamp(_796, 0.0, 1.0);
    out.m_59.x = _742;
    out.m_59.y = _748;
    out.m_59.z = _750;
    out.m_59.w = _798;
    return out;
}

