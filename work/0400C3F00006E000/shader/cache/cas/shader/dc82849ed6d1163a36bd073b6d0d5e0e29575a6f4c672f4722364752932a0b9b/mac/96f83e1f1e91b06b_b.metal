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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _78;
    float _106 = _104 * _84;
    float _108 = _104 * _90;
    float _110 = _104 * _96;
    float _112 = _104 * _102;
    float2 _797 = float2(_106, _108);
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_797, float2(0.0), isnan(_797))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_797, float2(0.0), isnan(_797))).w;
    float2 _808 = float2(_110, _112);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_808, float2(0.0), isnan(_808))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float _127 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _129 = in.m_48.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_50.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_50.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_50.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_48.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_48.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_52.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    bool _172 = as_type<int>(_127) != 0;
    float _174 = _104 * _133;
    float _176 = _104 * _139;
    float _178 = _104 * _145;
    float _180 = _104 * _151;
    float _182 = _104 * _157;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _186 = _176 + _184;
    bool _188 = !_172;
    float _190 = -_174;
    float _192 = _188 ? _190 : _174;
    float _194 = _104 * _163;
    float _196 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _198 = _178 + _196;
    float _200 = _186 * _186;
    bool _202 = !_172;
    float _204 = -_182;
    float _206 = _202 ? _204 : _182;
    float _208 = _192 * _192;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _212 = _180 + _210;
    float _214 = fma(_198, _198, _200);
    bool _216 = !_172;
    float _218 = -_194;
    float _220 = _216 ? _218 : _194;
    float _222 = fma(_206, _206, _208);
    float _224 = fma(_212, _212, _214);
    float _226 = fma(_220, _220, _222);
    float _228 = rsqrt(_224);
    float _230 = rsqrt(_226);
    float _232 = _186 * _228;
    float _234 = _212 * _228;
    float _236 = _198 * _228;
    float _238 = _232 * _232;
    float _240 = _192 * _230;
    float _242 = _206 * _230;
    float _244 = fma(_236, _236, _238);
    float _246 = _220 * _230;
    float _248 = _240 * _240;
    float _250 = fma(_234, _234, _244);
    float _252 = fma(_242, _242, _248);
    float _254 = _104 * _169;
    float _256 = fma(_246, _246, _252);
    float _258 = rsqrt(_250);
    float _260 = fma(_254, 0.01745329238474369049072265625, 3.4906585216522216796875);
    float _262 = (*spvDescriptorSet0.fp_c7)._m0[2].y * (*spvDescriptorSet0.fp_c7)._m0[2].y;
    float _264 = _260 * 0.15915493667125701904296875;
    float _266 = fma((*spvDescriptorSet0.fp_c7)._m0[2].x, (*spvDescriptorSet0.fp_c7)._m0[2].x, _262);
    float _268 = rsqrt(_256);
    float _270 = in.m_54.w;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = fma((*spvDescriptorSet0.fp_c7)._m0[2].z, (*spvDescriptorSet0.fp_c7)._m0[2].z, _266);
    float _278 = _264 * 6.283185482025146484375;
    float _280 = sin(_278);
    float _282 = _232 * _258;
    float _284 = _240 * _268;
    float _286 = sqrt(_276);
    float _288 = _284 * _282;
    float _290 = _236 * _258;
    float _292 = _242 * _268;
    float _294 = _234 * _258;
    float _296 = _246 * _268;
    float _298 = fma(_292, _290, _288);
    float _300 = fma(_280, 0.199999988079071044921875, 0.800000011920928955078125);
    float _302 = fma(_296, _294, _298);
    float _304 = in.m_56.w;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = precise::max(0.0, _286);
    float _312 = abs(_302);
    float _314 = _312 * 2.0;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = precise::max(_300, 0.60000002384185791015625);
    float _320 = precise::min(_310, 2.0);
    float _322 = fma(_316, -2.0, 3.0);
    float _324 = precise::min(_318, 1.0);
    float _326 = _316 * _316;
    float _328 = _324 * _320;
    float _330 = _328 * 0.5;
    float _332 = _322 * _326;
    float _334 = in.m_58.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = fma(_114, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _342 = precise::max(_340, 0.20000000298023223876953125);
    float _344 = precise::min(_342, 1.0);
    float _346 = _104 * _274;
    float _348 = _125 * _344;
    float _350 = _104 * _308;
    float _352 = -_346;
    float _354 = fma(_348, _332, _352);
    float _356 = _104 * _338;
    float _358 = _350 * _354;
    float _360 = _358 * _330;
    float _362 = 0.0 + _360;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _364 * _356;
    bool _368 = _366 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _370 = isnan(_366);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _376 = _372 || _374;
    float _378 = abs(_242);
    float _380 = abs(_240);
    float _382 = precise::max(_378, _380);
    float _384 = abs(_246);
    float _386 = precise::max(_384, _382);
    if (!_376)
    {
        discard_fragment();
    }
    float _388 = 1.0 / _386;
    float _390 = _240 * _388;
    float _392 = _242 * _388;
    float _394 = in.m_60.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = -_388;
    float _402 = _246 * _400;
    float _404 = _104 * _398;
    float _406 = precise::min(_404, 1.0);
    float3 _1229 = float3(_392, _390, _402);
    float3 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1229, float3(0.0), isnan(_1229)), level(_406)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1229, float3(0.0), isnan(_1229)), level(_406)).xyz;
    float _412 = _410.x;
    float _414 = _410.y;
    float _416 = _410.z;
    float _418 = in.m_56.x;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_56.y;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_56.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_54.x;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_54.y;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_54.z;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = _119 * _119;
    float _456 = _121 * _121;
    float _458 = _123 * _123;
    float _460 = -_458;
    float _462 = _460 + 1.0;
    float _464 = -_454;
    float _466 = _464 + 1.0;
    float _468 = -_456;
    float _470 = _468 + 1.0;
    float _472 = _104 * _422;
    float _474 = _104 * _428;
    float _476 = _104 * _434;
    float _478 = _472 * _466;
    float _480 = _474 * _470;
    float _482 = _476 * _462;
    float _484 = _104 * _440;
    float _486 = _104 * _446;
    float _488 = _104 * _452;
    float _490 = fma(_454, _484, _478);
    float _492 = fma(_456, _486, _480);
    float _494 = fma(_458, _488, _482);
    if (!_376)
    {
        out.m_63.x = _490;
        out.m_63.y = _492;
        out.m_63.z = _494;
        out.m_63.w = _360;
        return out;
    }
    float _496 = in.m_60.w;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = _104 * _500;
    bool _504 = _502 != 1.0;
    bool _506 = isnan(_502);
    bool _508 = _504 || _506;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = !_512;
    if (!_514)
    {
        float _516 = gl_FragCoord.x;
        float _518 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _520 = _516 / _518;
        float _522 = gl_FragCoord.y;
        float _524 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _526 = _522 / _524;
        float _528 = _502 * 256.0;
        float _530 = trunc(_528);
        int _533 = int(_530);
        float _535 = trunc(_520);
        int _537 = int(_535);
        float _539 = trunc(_526);
        int _541 = int(_539);
        int _543 = _537 + 2;
        int _545 = _543 >> 1;
        uint _548 = uint(int(uint(_541) >> uint(1)));
        int _550 = _545 ^ int(_548);
        int _552 = _550 << 16;
        int _554 = _552 ^ _545;
        int _556 = 983055 & _554;
        int _558 = _556 << 6;
        int _560 = _558 + _556;
        int _562 = _560 & 13369548;
        uint _564 = uint(int(uint(_562) >> uint(3)));
        int _566 = _562 | int(_564);
        uint _568 = uint(int(uint(_533) >> uint(7)));
        int _570 = int(_568) + _533;
        int _572 = _566 & 5570560;
        int _574 = _566 & 85;
        uint _576 = uint(int(uint(_572) >> uint(15)));
        int _578 = int(_576) + _574;
        bool _580 = uint(_570) > uint(_578);
        if (!_580)
        {
            discard_fragment();
        }
        if (!_580)
        {
            out.m_63.x = _490;
            out.m_63.y = _492;
            out.m_63.z = _494;
            out.m_63.w = _366;
            return out;
        }
    }
    float _582 = in.m_65.y;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = in.m_65.x;
    float _590 = gl_FragCoord.w;
    float _592 = _588 * _590;
    float _594 = in.m_65.z;
    float _596 = gl_FragCoord.w;
    float _598 = _594 * _596;
    float _600 = in.m_67.x;
    float _602 = gl_FragCoord.w;
    float _604 = _600 * _602;
    float _606 = in.m_67.y;
    float _608 = gl_FragCoord.w;
    float _610 = _606 * _608;
    float _612 = in.m_67.z;
    float _614 = gl_FragCoord.w;
    float _616 = _612 * _614;
    float _618 = in.m_69.x;
    float _620 = gl_FragCoord.w;
    float _622 = _618 * _620;
    float _624 = in.m_69.w;
    float _626 = gl_FragCoord.w;
    float _628 = _624 * _626;
    float _630 = in.m_69.y;
    float _632 = gl_FragCoord.w;
    float _634 = _630 * _632;
    float _636 = in.m_69.z;
    float _638 = gl_FragCoord.w;
    float _640 = _636 * _638;
    float _642 = _104 * _586;
    float _644 = _104 * _592;
    float _646 = _104 * _598;
    float _648 = fma(_414, 0.20999999344348907470703125, _642);
    float _650 = fma(_412, 0.20999999344348907470703125, _644);
    bool _652 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _654 = _104 * _604;
    float _656 = fma(_416, 0.20999999344348907470703125, _646);
    float _658 = _104 * _610;
    float _660 = _104 * _616;
    float _662 = _650 + _654;
    float _664 = _104 * _628;
    float _666 = _648 + _658;
    float _668 = _656 + _660;
    float _670 = _490 * _662;
    float _672 = 0.0 + _366;
    float _674 = precise::clamp(_672, 0.0, 1.0);
    float _676 = _104 * _622;
    float _678 = _492 * _666;
    float _680 = _494 * _668;
    float _682 = _104 * _634;
    float _684 = _104 * _640;
    float _686 = fma(_670, _664, _676);
    float _688 = _676;
    if (!_652)
    {
        _688 = _674;
    }
    float _690 = _688;
    float _692 = fma(_678, _664, _682);
    float _694 = fma(_680, _664, _684);
    bool _696 = !_652;
    float _698 = _690;
    if (!_696)
    {
        float _700 = in.m_71.w;
        float _702 = gl_FragCoord.w;
        float _704 = _700 * _702;
        float _706 = in.m_71.z;
        float _708 = gl_FragCoord.w;
        float _710 = _706 * _708;
        float _712 = _104 * _704;
        float _714 = _104 * _710;
        float _716 = 1.0 / _712;
        float _718 = _714 * _716;
        float _720 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _722 = fma(_718, (*spvDescriptorSet0.fp_c8)._m0[30].w, _720);
        float _724 = 1.0 / _722;
        float _726 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _728 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _730 = fma(_724, _726, _728);
        float _732 = _730 * 8.0;
        float _734 = precise::clamp(_732, 0.0, 1.0);
        float _736 = _674 * _734;
        _698 = _736;
    }
    float _738 = _698;
    float _740 = 0.0 + _738;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    out.m_63.x = _686;
    out.m_63.y = _692;
    out.m_63.z = _694;
    out.m_63.w = _742;
    return out;
}

