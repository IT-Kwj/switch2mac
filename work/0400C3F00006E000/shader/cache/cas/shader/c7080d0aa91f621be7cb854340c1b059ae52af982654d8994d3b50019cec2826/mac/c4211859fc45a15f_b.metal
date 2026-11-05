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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_34 [[id(4)]];
    sampler fp_t_tcb_34Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_75 [[user(locn12)]];
    float4 m_61 [[user(locn13)]];
    float4 m_77 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _86 = gl_FragCoord.w;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_44.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = 1.0 / _86;
    float _114 = _112 * _92;
    float _116 = _112 * _98;
    float _118 = _112 * _104;
    float _120 = _112 * _110;
    float2 _839 = float2(_114, _120);
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_839, float2(0.0), isnan(_839))).w;
    float2 _850 = float2(_116, _118);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_850, float2(0.0), isnan(_850))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float _135 = in.m_48.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_50.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_52.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = _112 * _139;
    float _155 = _112 * _145;
    float _157 = in.m_54.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_54.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _112 * _161;
    float _171 = _112 * _167;
    float _173 = _133 * _122;
    float _175 = _173 * _153;
    float _177 = _112 * _151;
    float _179 = _155 * _175;
    float _181 = 0.0 + _179;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _183 * _177;
    bool _188 = _185 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _190 = isnan(_185);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _196 = _192 || _194;
    float _198 = in.m_46.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    if (!_196)
    {
        discard_fragment();
    }
    float _204 = in.m_46.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _112 * _202;
    float2 _972 = float2(_169, _171);
    float3 _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_972, float2(0.0), isnan(_972))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_972, float2(0.0), isnan(_972))).xyz;
    float _216 = _214.x;
    float _218 = _214.y;
    float _220 = _214.z;
    float _222 = _112 * _208;
    float2 _989 = float2(_210, _222);
    float2 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_989, float2(0.0), isnan(_989))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_989, float2(0.0), isnan(_989))).xy;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = in.m_50.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_50.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_56.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_56.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_50.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_56.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_48.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_48.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_48.z;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = _112 * _236;
    float _288 = _112 * _242;
    float _290 = _112 * _260;
    float _292 = _112 * _266;
    float _294 = -_292;
    float _296 = _290 + _294;
    float _298 = _127 * _216;
    float _300 = _129 * _218;
    float _302 = _112 * _248;
    float _304 = _112 * _254;
    float _306 = _131 * _220;
    float _308 = -_302;
    float _310 = _288 + _308;
    float _312 = -_304;
    float _314 = _286 + _312;
    float _316 = fma(_306, _296, _292);
    float _318 = fma(_300, _310, _302);
    float _320 = fma(_298, _314, _304);
    float _322 = _112 * _272;
    float _324 = _112 * _278;
    float _326 = _112 * _284;
    float _328 = _320 * _322;
    float _330 = _318 * _324;
    float _332 = _316 * _326;
    if (!_196)
    {
        out.m_59.x = _328;
        out.m_59.y = _330;
        out.m_59.z = _332;
        out.m_59.w = _179;
        return out;
    }
    float _334 = in.m_61.w;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = _112 * _338;
    bool _342 = _340 != 1.0;
    bool _344 = isnan(_340);
    bool _346 = _342 || _344;
    bool _348 = isnan(1.0);
    bool _350 = _346 || _348;
    bool _352 = !_350;
    if (!_352)
    {
        float _354 = gl_FragCoord.x;
        float _356 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _358 = _354 / _356;
        float _360 = gl_FragCoord.y;
        float _362 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _364 = _360 / _362;
        float _366 = _340 * 256.0;
        float _368 = trunc(_366);
        int _371 = int(_368);
        uint _374 = uint(int(uint(_371) >> uint(7)));
        int _376 = int(_374) + _371;
        float _378 = trunc(_358);
        int _380 = int(_378);
        float _382 = trunc(_364);
        int _384 = int(_382);
        int _386 = _380 + 2;
        int _388 = _386 >> 1;
        uint _390 = uint(int(uint(_384) >> uint(1)));
        int _392 = _388 ^ int(_390);
        int _394 = _392 << 16;
        int _396 = _394 ^ _388;
        int _398 = 983055 & _396;
        int _400 = _398 << 6;
        int _402 = _400 + _398;
        int _404 = _402 & 13369548;
        uint _406 = uint(int(uint(_404) >> uint(3)));
        int _408 = _404 | int(_406);
        int _410 = _408 & 5570560;
        int _412 = _408 & 85;
        uint _414 = uint(int(uint(_410) >> uint(15)));
        int _416 = int(_414) + _412;
        bool _418 = uint(_376) > uint(_416);
        if (!_418)
        {
            discard_fragment();
        }
        if (!_418)
        {
            out.m_59.x = _328;
            out.m_59.y = _330;
            out.m_59.z = _332;
            out.m_59.w = _185;
            return out;
        }
    }
    float _420 = in.m_63.y;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = in.m_65.z;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_63.x;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_65.y;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = in.m_63.z;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_65.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_67.y;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = in.m_67.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = in.m_67.z;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = _230 * _230;
    float _476 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _478 = fma(_228, _228, _474);
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = -_480;
    float _484 = _482 + 1.0;
    float _486 = sqrt(_484);
    float _488 = _112 * _424;
    float _490 = _112 * _430;
    float _492 = _112 * _436;
    float _494 = _112 * _442;
    float _496 = _488 * _488;
    float _498 = _112 * _448;
    float _500 = _112 * _454;
    float _502 = _494 * _494;
    float _504 = fma(_492, _492, _496);
    float _506 = _112 * _460;
    float _508 = _112 * _466;
    float _510 = fma(_500, _500, _502);
    float _512 = fma(_498, _498, _504);
    float _514 = _506 * _506;
    float _516 = _112 * _472;
    float _518 = fma(_490, _490, _510);
    bool _520 = as_type<int>(_476) != 0;
    float _522 = fma(_508, _508, _514);
    float _524 = rsqrt(_512);
    float _526 = fma(_516, _516, _522);
    float _528 = rsqrt(_518);
    float _530 = rsqrt(_526);
    float _532 = _524 * _230;
    float _534 = _488 * _532;
    float _536 = _528 * _228;
    float _538 = _492 * _532;
    float _540 = fma(_494, _536, _534);
    float _542 = fma(_500, _536, _538);
    float _544 = _530 * _486;
    float _546 = _498 * _532;
    float _548 = fma(_506, _544, _540);
    float _550 = fma(_490, _536, _546);
    float _552 = fma(_508, _544, _542);
    float _554 = in.m_61.x;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    bool _560 = !_520;
    float _562 = -_548;
    float _564 = _560 ? _562 : _548;
    float _566 = fma(_516, _544, _550);
    bool _568 = !_520;
    float _570 = -_552;
    float _572 = _568 ? _570 : _552;
    float _574 = _564 * _564;
    bool _576 = !_520;
    float _578 = -_566;
    float _580 = _576 ? _578 : _566;
    float _582 = fma(_572, _572, _574);
    float _584 = fma(_580, _580, _582);
    float _586 = rsqrt(_584);
    float _588 = _572 * _586;
    float _590 = _564 * _586;
    float _592 = _580 * _586;
    float _594 = abs(_588);
    float _596 = abs(_590);
    float _598 = precise::max(_594, _596);
    float _600 = abs(_592);
    float _602 = precise::max(_600, _598);
    float _604 = _112 * _558;
    float _606 = 1.0 / _602;
    float _608 = precise::min(_604, 1.0);
    float _610 = _588 * _606;
    float _612 = _590 * _606;
    float _614 = -_606;
    float _616 = _592 * _614;
    float3 _1562 = float3(_610, _612, _616);
    float3 _618 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1562, float3(0.0), isnan(_1562)), level(_608)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1562, float3(0.0), isnan(_1562)), level(_608)).xyz;
    float _620 = _618.x;
    float _622 = _618.y;
    float _624 = _618.z;
    float _626 = in.m_73.y;
    float _628 = gl_FragCoord.w;
    float _630 = _626 * _628;
    float _632 = in.m_75.y;
    float _634 = gl_FragCoord.w;
    float _636 = _632 * _634;
    float _638 = in.m_73.z;
    float _640 = gl_FragCoord.w;
    float _642 = _638 * _640;
    float _644 = in.m_73.x;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = in.m_75.z;
    float _652 = gl_FragCoord.w;
    float _654 = _650 * _652;
    float _656 = in.m_75.x;
    float _658 = gl_FragCoord.w;
    float _660 = _656 * _658;
    float _662 = in.m_77.x;
    float _664 = gl_FragCoord.w;
    float _666 = _662 * _664;
    float _668 = in.m_77.w;
    float _670 = gl_FragCoord.w;
    float _672 = _668 * _670;
    float _674 = in.m_77.y;
    float _676 = gl_FragCoord.w;
    float _678 = _674 * _676;
    float _680 = in.m_77.z;
    float _682 = gl_FragCoord.w;
    float _684 = _680 * _682;
    float _686 = _112 * _630;
    float _688 = _112 * _642;
    float _690 = _112 * _648;
    float _692 = fma(_622, 0.20999999344348907470703125, _686);
    float _694 = _112 * _636;
    float _696 = fma(_624, 0.20999999344348907470703125, _688);
    float _698 = fma(_620, 0.20999999344348907470703125, _690);
    float _700 = _112 * _654;
    bool _702 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _704 = _112 * _660;
    float _706 = _692 + _694;
    float _708 = _696 + _700;
    float _710 = 0.0 + _185;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = _698 + _704;
    float _716 = _112 * _672;
    float _718 = _332 * _708;
    float _720 = _112 * _666;
    float _722 = _328 * _714;
    float _724 = _330 * _706;
    float _726 = _112 * _678;
    float _728 = _112 * _684;
    float _730 = fma(_722, _716, _720);
    float _732 = _720;
    if (!_702)
    {
        _732 = _712;
    }
    float _734 = _732;
    float _736 = fma(_724, _716, _726);
    float _738 = fma(_718, _716, _728);
    bool _740 = !_702;
    float _742 = _734;
    if (!_740)
    {
        float _744 = in.m_79.w;
        float _746 = gl_FragCoord.w;
        float _748 = _744 * _746;
        float _750 = in.m_79.z;
        float _752 = gl_FragCoord.w;
        float _754 = _750 * _752;
        float _756 = _112 * _748;
        float _758 = _112 * _754;
        float _760 = 1.0 / _756;
        float _762 = _758 * _760;
        float _764 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _766 = fma(_762, (*spvDescriptorSet0.fp_c8)._m0[30].w, _764);
        float _768 = 1.0 / _766;
        float _770 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _772 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _774 = fma(_768, _770, _772);
        float _776 = _774 * 8.0;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        float _780 = _712 * _778;
        _742 = _780;
    }
    float _782 = _742;
    float _784 = 0.0 + _782;
    float _786 = precise::clamp(_784, 0.0, 1.0);
    out.m_59.x = _730;
    out.m_59.y = _736;
    out.m_59.z = _738;
    out.m_59.w = _786;
    return out;
}

