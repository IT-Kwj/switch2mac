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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_70 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_51 [[user(locn7), flat]];
    float4 m_65 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
    float4 m_80 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _87 = gl_FragCoord.w;
    float _89 = in.m_49.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_49.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_51.x;
    float _109 = in.m_53.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_53.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_55.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_55.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = 1.0 / _87;
    float _135 = rint(_107);
    float _137 = precise::max(_135, 0.0);
    uint _140 = uint(_137);
    uint _142 = clamp(_140, 0u, 65535u);
    float _144 = _133 * _93;
    float _146 = _133 * _99;
    float _148 = _133 * _105;
    float _150 = _133 * _113;
    float _152 = 1.0 / _144;
    float _154 = _133 * _125;
    float _156 = _146 * _152;
    float _158 = _148 * _152;
    float _160 = _133 * _119;
    float _162 = _133 * _131;
    float2 _941 = float2(_156, _158);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_941, float2(0.0), isnan(_941))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_941, float2(0.0), isnan(_941))).x;
    float3 _954 = float3(_160, _150, float(int(_142)));
    float3 _958 = select(_954, float3(0.0), isnan(_954));
    float2 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _958.xy, uint(rint(_958.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _958.xy, uint(rint(_958.z))).xw;
    float _170 = _168.x;
    float _172 = _168.y;
    float2 _968 = float2(_162, _154);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_968, float2(0.0), isnan(_968))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_968, float2(0.0), isnan(_968))).w;
    float _176 = in.m_49.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_57.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_59.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _133 * _180;
    float _196 = _133 * _186;
    float _198 = in.m_61.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _194 * _152;
    float _206 = -_196;
    float _208 = spvFAdd(_206, 1.0);
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _212 = fma(_204, (*spvDescriptorSet0.fp_c8)._m0[30].w, _210);
    float _214 = 1.0 / _208;
    float _216 = 1.0 / _212;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _220 = _216 * _218;
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _224 = fma(_164, (*spvDescriptorSet0.fp_c8)._m0[30].w, _222);
    float _226 = precise::max(0.0, _172);
    float _228 = -_170;
    float _230 = _228 + 1.0;
    float _232 = 1.0 / _224;
    float _234 = precise::min(_208, _226);
    float _236 = _230 * _230;
    float _238 = _133 * _192;
    float _240 = _234 * _214;
    float _242 = fma(_238, 2.0, -1.0);
    float _244 = -_238;
    float _246 = _244 + 2.0;
    float _248 = _174 + _242;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _240 * _250;
    float _254 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _256 = -_220;
    float _258 = fma(_232, _254, _256);
    float _260 = _252 * _246;
    float _262 = fma(_258, 0.5, _236);
    float _264 = precise::max(_262, 1.10000002384185791015625);
    float _266 = precise::min(_264, 1.39999997615814208984375);
    float _268 = fma(_266, 3.3333339691162109375, -3.666667461395263671875);
    float _270 = _133 * _202;
    float _272 = _260 * _268;
    float _274 = 0.0 + _272;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _276 * _270;
    bool _282 = _278 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _284 = isnan(_278);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _290 = _286 || _288;
    float _292 = in.m_51.y;
    float _294 = in.m_53.w;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = _220;
    float _302 = _133;
    if (!_290)
    {
        discard_fragment();
    }
    float _304 = in.m_53.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = rint(_292);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    uint _316 = clamp(_314, 0u, 65535u);
    float _318 = _133 * _298;
    float _320 = _133 * _308;
    float3 _1176 = float3(_320, _318, float(int(_316)));
    float3 _1178 = select(_1176, float3(0.0), isnan(_1176));
    float2 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1178.xy, uint(rint(_1178.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1178.xy, uint(rint(_1178.z))).xy;
    float _324 = _322.x;
    float _326 = _322.y;
    float _328 = in.m_63.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_63.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_65.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_63.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_65.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_67.y;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_65.z;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_67.x;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_67.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_59.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_59.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = _133 * _332;
    float _396 = _133 * _338;
    float _398 = _133 * _344;
    float _400 = _133 * _350;
    float _402 = _394 * _394;
    float _404 = _133 * _356;
    float _406 = _398 * _398;
    float _408 = _133 * _362;
    float _410 = fma(_396, _396, _402);
    float _412 = _133 * _368;
    float _414 = fma(_404, _404, _406);
    float _416 = _133 * _374;
    float _418 = fma(_400, _400, _410);
    float _420 = _408 * _408;
    float _422 = fma(_412, _412, _414);
    float _424 = in.m_59.z;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = _133 * _380;
    float _432 = fma(_416, _416, _420);
    float _434 = rsqrt(_418);
    float _436 = fma(_430, _430, _432);
    float _438 = rsqrt(_422);
    float _440 = rsqrt(_436);
    float _442 = _396 * _434;
    float _444 = _394 * _434;
    float _446 = _400 * _434;
    float _448 = _412 * _438;
    float _450 = _326 * _326;
    float _452 = _324 * _440;
    float _454 = _326 * _448;
    float _456 = fma(_324, _324, _450);
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = _326 * _438;
    float _462 = _133 * _386;
    float _464 = _133 * _392;
    float _466 = -_458;
    float _468 = _466 + 1.0;
    float _470 = _404 * _460;
    float _472 = _398 * _460;
    float _474 = _133 * _428;
    float _476 = sqrt(_468);
    float _478 = fma(_416, _452, _470);
    float _480 = fma(_408, _452, _472);
    if (!_290)
    {
        out.m_70.x = _462;
        out.m_70.y = _464;
        out.m_70.z = _474;
        out.m_70.w = _272;
        return out;
    }
    float _482 = fma(_444, _476, _480);
    float _484 = fma(_430, _452, _454);
    float _486 = fma(_442, _476, _478);
    float _488 = in.m_72.x;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = _482 * _482;
    float _496 = fma(_446, _476, _484);
    float _498 = fma(_486, _486, _494);
    float _500 = fma(_496, _496, _498);
    float _502 = rsqrt(_500);
    float _504 = _486 * _502;
    float _506 = _482 * _502;
    float _508 = _496 * _502;
    float _510 = _133 * _492;
    float _512 = abs(_504);
    float _514 = abs(_506);
    float _516 = precise::max(_512, _514);
    float _518 = precise::min(_510, 1.0);
    float _520 = abs(_508);
    float _522 = precise::max(_520, _516);
    float _524 = 1.0 / _522;
    float _526 = _504 * _524;
    float _528 = _506 * _524;
    float _530 = -_524;
    float _532 = _508 * _530;
    float3 _1486 = float3(_526, _528, _532);
    float3 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1486, float3(0.0), isnan(_1486)), level(_518)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1486, float3(0.0), isnan(_1486)), level(_518)).xyz;
    float _538 = _536.x;
    float _540 = _536.y;
    float _542 = _536.z;
    float _544 = in.m_74.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = in.m_74.x;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_74.z;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_76.z;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_76.x;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _576 = (*spvDescriptorSet0.fp_c10)._m0[9].y + _574;
    float _578 = in.m_76.y;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _586 = (*spvDescriptorSet0.fp_c10)._m0[8].y + _584;
    float _588 = in.m_78.x;
    float _590 = gl_FragCoord.w;
    float _592 = _588 * _590;
    float _594 = _444 * _444;
    float _596 = fma(_442, _442, _594);
    float _598 = fma(_446, _446, _596);
    float _600 = _133 * _548;
    float _602 = _133 * _554;
    float _604 = _600 + _576;
    float _606 = _602 + _586;
    float _608 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _610 = (*spvDescriptorSet0.fp_c10)._m0[10].y + _608;
    float _612 = _133 * _560;
    float _614 = _604 * _604;
    float _616 = in.m_57.x;
    float _618 = gl_FragCoord.w;
    float _620 = _616 * _618;
    float _622 = _612 + _610;
    float _624 = fma(_606, _606, _614);
    float _626 = rsqrt(_598);
    float _628 = fma(_622, _622, _624);
    float _630 = rsqrt(_628);
    float _632 = _626 * _476;
    float _634 = in.m_57.y;
    float _636 = gl_FragCoord.w;
    float _638 = _634 * _636;
    float _640 = fma(_442, _632, _478);
    float _642 = fma(_444, _632, _480);
    float _644 = in.m_57.z;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = fma(_446, _632, _484);
    float _652 = _606 * _630;
    float _654 = _604 * _630;
    float _656 = _622 * _630;
    float _658 = in.m_80.y;
    float _660 = gl_FragCoord.w;
    float _662 = _658 * _660;
    float _664 = _640 * _652;
    float _666 = -_654;
    float _668 = -_664;
    float _670 = fma(_642, _666, _668);
    float _672 = in.m_78.z;
    float _674 = gl_FragCoord.w;
    float _676 = _672 * _674;
    float _678 = in.m_80.x;
    float _680 = gl_FragCoord.w;
    float _682 = _678 * _680;
    float _684 = -_656;
    float _686 = fma(_650, _684, _670);
    float _688 = fma(_236, -0.699999988079071044921875, 1.0);
    bool _690 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _692 = _133 * _566;
    float _694 = precise::max(_686, -0.60000002384185791015625);
    float _696 = -_510;
    float _698 = _696 + 1.0;
    float _700 = _133 * _582;
    float _702 = _692 * _688;
    float _704 = precise::min(_694, 0.60000002384185791015625);
    float _706 = _170 * _698;
    float _708 = _700 * _688;
    float _710 = _133 * _592;
    float _712 = fma(_704, 0.833333313465118408203125, 0.5);
    float _714 = _133 * _638;
    float _716 = _133 * _620;
    float _718 = in.m_80.z;
    float _720 = gl_FragCoord.w;
    float _722 = _718 * _720;
    float _724 = _133 * _648;
    float _726 = _714 * _712;
    float _728 = _716 * _712;
    float _730 = in.m_78.y;
    float _732 = gl_FragCoord.w;
    float _734 = _730 * _732;
    float _736 = _724 * _712;
    float _738 = _726 * 0.715200006961822509765625;
    float _740 = in.m_80.w;
    float _742 = gl_FragCoord.w;
    float _744 = _740 * _742;
    if (_690)
    {
        float _746 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _748 = _220 + _746;
        _300 = _748;
    }
    float _750 = _300;
    float _752 = fma(_728, 0.2125999927520751953125, _738);
    float _754 = fma(_736, 0.072200000286102294921875, _752);
    float _756 = 1.0 / _754;
    float _758 = _756 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float _762 = _133 * _734;
    float _764 = _133 * _744;
    float _766 = fma(_760, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _768 = _133 * _572;
    float _770 = _728 * _766;
    float _772 = _768 * _688;
    float _774 = _133 * _676;
    float _776 = _726 * _766;
    float _778 = _736 * _766;
    float _780 = fma(_542, 0.20999999344348907470703125, _702);
    float _782 = _706 * 0.02624999918043613433837890625;
    float _784 = fma(_538, 0.20999999344348907470703125, _772);
    float _786 = fma(_540, 0.20999999344348907470703125, _708);
    float _788 = _133 * _682;
    float _790 = fma(_782, (*spvDescriptorSet0.fp_c15)._m0[17].z, _780);
    float _792 = fma(_782, (*spvDescriptorSet0.fp_c15)._m0[17].x, _784);
    float _794 = fma(_782, (*spvDescriptorSet0.fp_c15)._m0[17].y, _786);
    float _796 = _133 * _662;
    float _798 = _133 * _722;
    float _800 = _790 + _774;
    float _802 = _792 + _710;
    float _804 = _794 + _762;
    float _806 = 0.0 + _278;
    float _808 = precise::clamp(_806, 0.0, 1.0);
    float _810 = _808;
    if (_690)
    {
        float _812 = _750 * 8.0;
        float _814 = precise::clamp(_812, 0.0, 1.0);
        _302 = _814;
    }
    float _816 = _302;
    float _818 = fma(_462, _802, _770);
    float _820 = fma(_464, _804, _776);
    float _822 = fma(_474, _800, _778);
    if (_690)
    {
        float _824 = _808 * _816;
        _810 = _824;
    }
    float _826 = _810;
    float _828 = fma(_818, _764, _788);
    float _830 = fma(_820, _764, _796);
    float _832 = fma(_822, _764, _798);
    float _834 = 0.0 + _826;
    float _836 = precise::clamp(_834, 0.0, 1.0);
    out.m_70.x = _828;
    out.m_70.y = _830;
    out.m_70.z = _832;
    out.m_70.w = _836;
    return out;
}

