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
    constant _16* fp_c10 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _815 = float2(_90, _92);
    float2 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_815, float2(0.0), isnan(_815))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_815, float2(0.0), isnan(_815))).xw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = in.m_44.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_42.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _88 * _106;
    float _116 = _88 * _112;
    float _118 = 0.0 + _100;
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _120 * _114;
    bool _126 = _122 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _128 = isnan(_122);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _134 = _130 || _132;
    float _136 = in.m_42.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    if (!_134)
    {
        discard_fragment();
    }
    float _142 = _88 * _140;
    float2 _890 = float2(_142, _116);
    float2 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_890, float2(0.0), isnan(_890))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_890, float2(0.0), isnan(_890))).xy;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = in.m_46.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_46.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_46.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_48.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_48.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_50.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_48.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_50.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = _88 * _154;
    float _200 = _88 * _160;
    float _202 = _88 * _166;
    float _204 = _88 * _172;
    float _206 = _198 * _198;
    float _208 = in.m_50.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = fma(_200, _200, _206);
    float _216 = fma(_202, _202, _214);
    float _218 = rsqrt(_216);
    float _220 = _200 * _218;
    float _222 = _198 * _218;
    float _224 = _202 * _218;
    if (!_134)
    {
        out.m_53.x = 0.0500000007450580596923828125;
        out.m_53.y = 0.02999999932944774627685546875;
        out.m_53.z = 0.0199999995529651641845703125;
        out.m_53.w = _100;
        return out;
    }
    float _226 = in.m_55.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _88 * _178;
    float _234 = _204 * _204;
    float _236 = _88 * _212;
    float _238 = _88 * _190;
    float _240 = _88 * _184;
    float _242 = fma(_232, _232, _234);
    float _244 = _236 * _236;
    float _246 = _148 * _148;
    float _248 = _88 * _196;
    float _250 = fma(_238, _238, _242);
    float _252 = fma(_240, _240, _244);
    float _254 = fma(_146, _146, _246);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = fma(_248, _248, _252);
    float _260 = rsqrt(_250);
    float _262 = -_256;
    float _264 = _262 + 1.0;
    float _266 = rsqrt(_258);
    float _268 = _88 * _230;
    float _270 = _238 * _260;
    float _272 = _260 * _148;
    float _274 = sqrt(_264);
    bool _276 = _268 != 1.0;
    bool _278 = isnan(_268);
    bool _280 = _276 || _278;
    bool _282 = isnan(1.0);
    bool _284 = _280 || _282;
    float _286 = _232 * _272;
    float _288 = _204 * _272;
    float _290 = _266 * _146;
    float _292 = _148 * _270;
    float _294 = fma(_240, _290, _286);
    float _296 = fma(_236, _290, _288);
    bool _298 = !_284;
    if (!_298)
    {
        float _300 = gl_FragCoord.x;
        float _302 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _304 = _300 / _302;
        float _306 = gl_FragCoord.y;
        float _308 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _310 = _306 / _308;
        float _312 = _268 * 256.0;
        float _314 = trunc(_312);
        int _317 = int(_314);
        uint _320 = uint(int(uint(_317) >> uint(7)));
        int _322 = int(_320) + _317;
        float _324 = trunc(_304);
        int _326 = int(_324);
        float _328 = trunc(_310);
        int _330 = int(_328);
        int _332 = _326 + 2;
        int _334 = _332 >> 1;
        uint _336 = uint(int(uint(_330) >> uint(1)));
        int _338 = _334 ^ int(_336);
        int _340 = _338 << 16;
        int _342 = _340 ^ _334;
        int _344 = 983055 & _342;
        int _346 = _344 << 6;
        int _348 = _346 + _344;
        int _350 = _348 & 13369548;
        uint _352 = uint(int(uint(_350) >> uint(3)));
        int _354 = _350 | int(_352);
        int _356 = _354 & 5570560;
        int _358 = _354 & 85;
        uint _360 = uint(int(uint(_356) >> uint(15)));
        int _362 = int(_360) + _358;
        bool _364 = uint(_322) > uint(_362);
        if (!_364)
        {
            discard_fragment();
        }
        if (!_364)
        {
            out.m_53.x = 0.0500000007450580596923828125;
            out.m_53.y = 0.02999999932944774627685546875;
            out.m_53.z = 0.0199999995529651641845703125;
            out.m_53.w = _122;
            return out;
        }
    }
    float _366 = fma(_222, _274, _296);
    float _368 = fma(_248, _290, _292);
    float _370 = fma(_220, _274, _294);
    float _372 = _366 * _366;
    float _374 = fma(_224, _274, _368);
    float _376 = fma(_370, _370, _372);
    float _378 = fma(_374, _374, _376);
    float _380 = rsqrt(_378);
    float _382 = _370 * _380;
    float _384 = _366 * _380;
    float _386 = _374 * _380;
    float _388 = abs(_382);
    float _390 = abs(_384);
    float _392 = precise::max(_388, _390);
    float _394 = abs(_386);
    float _396 = precise::max(_394, _392);
    float _398 = 1.0 / _396;
    float _400 = -_398;
    float _402 = _386 * _400;
    float _404 = _382 * _398;
    float _406 = _384 * _398;
    float3 _1291 = float3(_404, _406, _402);
    float3 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1291, float3(0.0), isnan(_1291)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1291, float3(0.0), isnan(_1291)), level(0.0)).xyz;
    float _412 = _410.x;
    float _414 = _410.y;
    float _416 = _410.z;
    float _418 = in.m_57.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_57.x;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_57.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_59.z;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = _88 * _422;
    float _444 = _88 * _428;
    float _446 = _88 * _434;
    float _448 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _450 = _442 + _448;
    float _452 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _454 = _444 + _452;
    float _456 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _458 = _446 + _456;
    float _460 = _450 * _450;
    float _462 = fma(_454, _454, _460);
    float _464 = (*spvDescriptorSet0.fp_c10)._m0[9].w + 2.0;
    float _466 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _468 = _444 + _466;
    float _470 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _472 = _446 + _470;
    float _474 = fma(_458, _458, _462);
    float _476 = -_464;
    float _478 = _442 + _476;
    float _480 = rsqrt(_474);
    float _482 = _478 * _478;
    float _484 = fma(_468, _468, _482);
    float _486 = fma(_472, _472, _484);
    float _488 = _222 * _222;
    float _490 = rsqrt(_486);
    float _492 = fma(_220, _220, _488);
    float _494 = _450 * _480;
    float _496 = _454 * _480;
    float _498 = fma(_224, _224, _492);
    float _500 = _458 * _480;
    float _502 = _494 * _494;
    float _504 = rsqrt(_498);
    float _506 = in.m_59.y;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = fma(_496, _496, _502);
    float _514 = fma(_500, _500, _512);
    float _516 = _478 * _490;
    float _518 = in.m_61.z;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = rsqrt(_514);
    float _526 = _274 * _504;
    float _528 = _468 * _490;
    float _530 = _472 * _490;
    float _532 = in.m_63.z;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = fma(_222, _526, _296);
    float _540 = fma(_220, _526, _294);
    float _542 = fma(_224, _526, _368);
    float _544 = in.m_59.x;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = _494 * _524;
    float _552 = _496 * _524;
    float _554 = _500 * _524;
    float _556 = in.m_63.y;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = _538 * _550;
    float _564 = _538 * _516;
    float _566 = fma(_540, _552, _562);
    float _568 = fma(_540, _528, _564);
    float _570 = in.m_61.y;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = fma(_542, _554, _566);
    float _578 = in.m_61.x;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = fma(_542, _530, _568);
    float _586 = abs(_576);
    float _588 = fma(_586, 100.00009918212890625, -98.00009918212890625);
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = fma(_590, -2.0, 3.0);
    float _594 = _590 * _590;
    float _596 = fma(_584, -1.25, 0.24999998509883880615234375);
    float _598 = precise::clamp(_596, 0.0, 1.0);
    float _600 = _592 * _594;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = fma(_598, -2.0, 3.0);
    float _606 = _598 * _598;
    float _608 = fma(_602, -2.0, 3.0);
    float _610 = _602 * _602;
    float _612 = _604 * _606;
    float _614 = in.m_65.w;
    float _616 = gl_FragCoord.w;
    float _618 = _614 * _616;
    float _620 = _608 * _610;
    float _622 = fma(_620, 0.100000001490116119384765625, _612);
    float _624 = _98 * _622;
    float _626 = _88 * _574;
    float _628 = _88 * _522;
    float _630 = _88 * _582;
    float _632 = in.m_63.x;
    float _634 = gl_FragCoord.w;
    float _636 = _632 * _634;
    float _638 = _626 * _624;
    float _640 = _628 * _624;
    float _642 = _630 * _624;
    float _644 = in.m_65.x;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = _638 * 0.715200006961822509765625;
    float _652 = in.m_65.y;
    float _654 = gl_FragCoord.w;
    float _656 = _652 * _654;
    float _658 = fma(_642, 0.2125999927520751953125, _650);
    float _660 = fma(_640, 0.072200000286102294921875, _658);
    float _662 = in.m_65.z;
    float _664 = gl_FragCoord.w;
    float _666 = _662 * _664;
    float _668 = 1.0 / _660;
    float _670 = _88 * _618;
    float _672 = _88 * _636;
    float _674 = _668 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = _88 * _648;
    float _680 = fma(_676, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _682 = _88 * _560;
    float _684 = _88 * _536;
    float _686 = _642 * _680;
    float _688 = _638 * _680;
    float _690 = _640 * _680;
    float _692 = _88 * _548;
    float _694 = _88 * _510;
    float _696 = _88 * _666;
    float _698 = fma(_414, 0.20999999344348907470703125, _682);
    float _700 = fma(_412, 0.20999999344348907470703125, _672);
    float _702 = fma(_416, 0.20999999344348907470703125, _684);
    float _704 = _88 * _440;
    bool _706 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _708 = _700 + _692;
    float _710 = _698 + _694;
    float _712 = _702 + _704;
    float _714 = 0.0 + _122;
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = fma(_708, 0.0500000007450580596923828125, _686);
    float _720 = fma(_710, 0.02999999932944774627685546875, _688);
    float _722 = fma(_712, 0.0199999995529651641845703125, _690);
    float _724 = _88 * _656;
    float _726 = fma(_718, _670, _678);
    float _728 = fma(_722, _670, _696);
    float _730 = fma(_720, _670, _724);
    float _732 = _696;
    if (!_706)
    {
        _732 = _716;
    }
    float _734 = _732;
    bool _736 = !_706;
    float _738 = _734;
    if (!_736)
    {
        float _740 = in.m_67.w;
        float _742 = gl_FragCoord.w;
        float _744 = _740 * _742;
        float _746 = in.m_67.z;
        float _748 = gl_FragCoord.w;
        float _750 = _746 * _748;
        float _752 = _88 * _744;
        float _754 = _88 * _750;
        float _756 = 1.0 / _752;
        float _758 = _754 * _756;
        float _760 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _762 = fma(_758, (*spvDescriptorSet0.fp_c8)._m0[30].w, _760);
        float _764 = 1.0 / _762;
        float _766 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _768 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _770 = fma(_764, _766, _768);
        float _772 = _770 * 8.0;
        float _774 = precise::clamp(_772, 0.0, 1.0);
        float _776 = _716 * _774;
        _738 = _776;
    }
    float _778 = _738;
    float _780 = 0.0 + _778;
    float _782 = precise::clamp(_780, 0.0, 1.0);
    out.m_53.x = _726;
    out.m_53.y = _730;
    out.m_53.z = _728;
    out.m_53.w = _782;
    return out;
}

