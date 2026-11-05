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
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c10 [[id(4)]];
    constant _16* fp_c15 [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_8 [[id(10)]];
    sampler fp_t_tcb_8Smplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    texturecube<float> fp_t_tcb_1E [[id(14)]];
    sampler fp_t_tcb_1ESmplr [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_1ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_80 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_71 [[user(locn6), flat]];
    float4 m_84 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_73 [[user(locn10), flat]];
    float4 m_55 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
    float4 m_67 [[user(locn13), flat]];
    float4 m_59 [[user(locn14), flat]];
    float4 m_77 [[user(locn15)]];
    float4 m_69 [[user(locn16)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _95 = gl_FragCoord.w;
    float _97 = in.m_53.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_53.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _95;
    float _111 = _109 * _101;
    float _113 = _109 * _107;
    float2 _1009 = float2(_111, _113);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1009, float2(0.0), isnan(_1009))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1009, float2(0.0), isnan(_1009))).w;
    float _117 = in.m_55.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_55.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_55.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_57.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_57.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_59.x;
    float _149 = _109 * _121;
    float _151 = _109 * _127;
    float _153 = _109 * _133;
    float _155 = _109 * _139;
    float _157 = 1.0 / _149;
    float _159 = _109 * _145;
    float _161 = _153 * _157;
    float _163 = fma(_115, 0.100000001490116119384765625, -0.0500000007450580596923828125);
    float _165 = _151 * _157;
    float _167 = _155 + _163;
    float _169 = _159 + _163;
    float2 _1091 = float2(_165, _161);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1091, float2(0.0), isnan(_1091))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1091, float2(0.0), isnan(_1091))).x;
    float _173 = rint(_147);
    float _175 = precise::max(_173, 0.0);
    uint _178 = uint(_175);
    uint _180 = clamp(_178, 0u, 65535u);
    float3 _1112 = float3(_169, _167, float(int(_180)));
    float3 _1116 = select(_1112, float3(0.0), isnan(_1112));
    float2 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1116.xy, uint(rint(_1116.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1116.xy, uint(rint(_1116.z))).xw;
    float _186 = _184.x;
    float _188 = _184.y;
    float _190 = in.m_55.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_61.w;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_63.w;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = _109 * _194;
    float _210 = _208 * _157;
    float _212 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _214 = fma(_210, (*spvDescriptorSet0.fp_c8)._m0[30].w, _212);
    float _216 = 1.0 / _214;
    float _218 = _109 * _200;
    float _220 = in.m_65.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = fma(_218, 2.0, -1.0);
    float _228 = _109 * _206;
    float _230 = _115 + _226;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _236 = fma(_171, (*spvDescriptorSet0.fp_c8)._m0[30].w, _234);
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = _216 * _238;
    float _242 = 1.0 / _228;
    float _244 = 1.0 / _236;
    float _246 = -_186;
    float _248 = _246 + 1.0;
    float _250 = _232 * _188;
    float _252 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _254 = -_240;
    float _256 = fma(_244, _252, _254);
    float _258 = precise::max(0.0, _250);
    float _260 = fma(_256, 0.00999999977648258209228515625, _248);
    float _262 = precise::min(_228, _258);
    float _264 = precise::max(_260, 1.0);
    float _266 = _262 * _242;
    float _268 = precise::min(_264, 1.5);
    float _270 = fma(_268, 2.0, -2.0);
    float _272 = _266 * _270;
    float _274 = _109 * _224;
    float _276 = 0.0 + _272;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _278 * _274;
    bool _284 = _280 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _286 = isnan(_280);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _292 = _288 || _290;
    float _294 = in.m_59.y;
    float _296 = _240;
    if (!_292)
    {
        discard_fragment();
    }
    float _298 = rint(_294);
    float _300 = precise::max(_298, 0.0);
    uint _302 = uint(_300);
    uint _304 = clamp(_302, 0u, 65535u);
    float3 _1289 = float3(_169, _167, float(int(_304)));
    float3 _1291 = select(_1289, float3(0.0), isnan(_1289));
    float2 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1291.xy, uint(rint(_1291.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1291.xy, uint(rint(_1291.z))).xy;
    float _308 = _306.x;
    float _310 = _306.y;
    bool _312 = 0.0 < (*spvDescriptorSet0.fp_c11)._m0[21].z;
    float _314 = in.m_67.x;
    float _316 = in.m_69.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_69.x;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_69.z;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = (*spvDescriptorSet0.fp_c11)._m0[21].x * (*spvDescriptorSet0.fp_c11)._m0[21].y;
    float _336 = 0.0;
    if (_312)
    {
        float _338 = in.m_71.y;
        _336 = _338;
    }
    float _340 = _336;
    float _342 = 0.0;
    if (_312)
    {
        float _344 = 1.0 / (*spvDescriptorSet0.fp_c11)._m0[21].z;
        _342 = _344;
    }
    float _346 = _342;
    float _348 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 19.9999237060546875, -96.666290283203125);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 20.00030517578125, -416.6729736328125);
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 20.00030517578125, -376.67236328125);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 19.9999237060546875, -98.9996185302734375);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 20.00030517578125, -419.00640869140625);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = -_350;
    float _370 = _368 + 1.0;
    float _372 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 20.00030517578125, -379.00579833984375);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 20.000019073486328125, -56.666713714599609375);
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 20.000019073486328125, -59.000057220458984375);
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = -_354;
    float _386 = _384 + 1.0;
    float _388 = -_358;
    float _390 = _388 + 1.0;
    float _392 = in.m_73.y;
    bool _394 = 0.0 < (*spvDescriptorSet0.fp_c11)._m0[21].y;
    float _396 = -_378;
    float _398 = _396 + 1.0;
    float _400 = precise::max(_386, _366);
    float _402 = -_334;
    float _404 = fma(_314, _402, (*spvDescriptorSet0.fp_c11)._m0[21].x);
    float _406 = _109 * _320;
    float _408 = _109 * _326;
    float _410 = _109 * _332;
    float _412 = in.m_75.y;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = _406 * _406;
    float _420 = in.m_73.z;
    float _422 = in.m_75.z;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = precise::max(_390, _374);
    float _430 = fma(_408, _408, _418);
    float _432 = 0.0 + _400;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = in.m_77.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = _340;
    if (_312)
    {
        float _444 = _340 * _346;
        _442 = _444;
    }
    float _446 = _442;
    float _448 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _450 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _452 = _434 * _434;
    float _454 = 0.0 + _428;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _448);
    float _460 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _450);
    float _462 = precise::max(_370, _362);
    float _464 = in.m_73.x;
    float _466 = _446;
    if (_312)
    {
        float _468 = precise::min(_446, 1.0);
        _466 = _468;
    }
    float _470 = _466;
    float _472 = in.m_75.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = 0.0 + _462;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = fma(_410, _410, _430);
    float _484 = _394 ? _404 : (*spvDescriptorSet0.fp_c11)._m0[21].x;
    float _486 = in.m_77.x;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = _480 * _480;
    float _494 = precise::max(_398, _382);
    float _496 = _484;
    if (_312)
    {
        float _498 = _484 * _470;
        _496 = _498;
    }
    float _500 = _496;
    float _502 = rsqrt(_482);
    float _504 = in.m_77.z;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = _492 * _452;
    float _512 = _500 * 80.0;
    float _514 = _456 * _456;
    float _516 = _109 * _416;
    float _518 = fma(_512, (*spvDescriptorSet0.fp_c8)._m0[32].y, _392);
    float _520 = _510 * _514;
    float _522 = fma(_512, (*spvDescriptorSet0.fp_c8)._m0[32].z, _420);
    float _524 = _109 * _426;
    float _526 = _518 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _528 = _109 * _440;
    float _530 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _460);
    float _532 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _458);
    float _534 = 0.0 + _494;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = _408 * _502;
    float _540 = _406 * _502;
    float _542 = _410 * _502;
    float _544 = _518 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _546 = _516 * _516;
    float _548 = fma(_512, (*spvDescriptorSet0.fp_c8)._m0[32].x, _464);
    float _550 = _528 * _528;
    float _552 = _109 * _476;
    float _554 = _530 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _556 = fma(_548, (*spvDescriptorSet0.fp_c8)._m0[1].x, _526);
    float _558 = fma(_548, (*spvDescriptorSet0.fp_c8)._m0[0].x, _544);
    float _560 = fma(_552, _552, _546);
    float _562 = _109 * _490;
    float _564 = fma(_522, (*spvDescriptorSet0.fp_c8)._m0[1].z, _556);
    float _566 = fma(_522, (*spvDescriptorSet0.fp_c8)._m0[0].z, _558);
    float _568 = fma(_524, _524, _560);
    float _570 = fma(_562, _562, _550);
    float _572 = _109 * _508;
    float _574 = _564 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _576 = _532 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _578 = _566 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _580 = fma(_572, _572, _570);
    float _582 = -_554;
    float _584 = _574 + _582;
    float _586 = _536 * _536;
    float _588 = -_576;
    float _590 = _578 + _588;
    float _592 = rsqrt(_568);
    float _594 = in.m_61.y;
    float _596 = gl_FragCoord.w;
    float _598 = _594 * _596;
    float _600 = _520 * _586;
    float _602 = _540 * _540;
    float _604 = in.m_61.x;
    float _606 = gl_FragCoord.w;
    float _608 = _604 * _606;
    float _610 = fma(_538, _538, _602);
    float _612 = rsqrt(_580);
    float _614 = fma(_542, _542, _610);
    float _616 = rsqrt(_614);
    float _618 = fma(_584, -0.00999999977648258209228515625, _310);
    float _620 = fma(_590, -0.00999999977648258209228515625, _308);
    float _622 = in.m_61.z;
    float _624 = gl_FragCoord.w;
    float _626 = _622 * _624;
    float _628 = _618 * _618;
    float _630 = _618 * _612;
    float _632 = fma(_620, _620, _628);
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = _620 * _592;
    float _638 = _562 * _630;
    float _640 = -_634;
    float _642 = _640 + 1.0;
    float _644 = _572 * _612;
    float _646 = _528 * _630;
    float _648 = fma(_552, _636, _638);
    float _650 = sqrt(_642);
    float _652 = _618 * _644;
    float _654 = fma(_516, _636, _646);
    float _656 = fma(_524, _636, _652);
    float _658 = _616 * _650;
    float _660 = fma(_540, _658, _654);
    float _662 = fma(_538, _658, _648);
    float _664 = fma(_542, _658, _656);
    float _666 = _109 * _608;
    float _668 = _660 * (*spvDescriptorSet0.fp_c15)._m0[21].y;
    float _670 = _664 * (-0.577381789684295654296875);
    float _672 = fma(_662, (*spvDescriptorSet0.fp_c15)._m0[21].x, _668);
    float _674 = _109 * _598;
    float _676 = _109 * _626;
    float _678 = fma(_660, -0.816474258899688720703125, _670);
    float _680 = fma(_664, (*spvDescriptorSet0.fp_c15)._m0[21].z, _672);
    if (!_292)
    {
        out.m_80.x = _666;
        out.m_80.y = _674;
        out.m_80.z = _676;
        out.m_80.w = _272;
        return out;
    }
    float _682 = abs(_538);
    float _684 = abs(_540);
    float _686 = precise::max(_682, _684);
    float _688 = -_678;
    float _690 = _688 + _680;
    float _692 = abs(_542);
    float _694 = precise::max(_692, _686);
    float _696 = fma(_600, _690, _678);
    float _698 = fma(_696, 0.625, 0.625);
    float _700 = precise::clamp(_698, 0.0, 1.0);
    float _702 = 1.0 / _694;
    float _704 = fma(_700, -2.0, 3.0);
    float _706 = _700 * _700;
    float _708 = _704 * _706;
    float _710 = _708 * 0.699999988079071044921875;
    float _712 = _540 * _702;
    float _714 = -_702;
    float _716 = _542 * _714;
    float _718 = precise::min(_710, 1.0);
    float _720 = _538 * _702;
    float3 _1936 = float3(_720, _712, _716);
    float3 _724 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1936, float3(0.0), isnan(_1936)), level(_718)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1936, float3(0.0), isnan(_1936)), level(_718)).xyz;
    float _726 = _724.x;
    float _728 = _724.y;
    float _730 = _724.z;
    float _732 = in.m_82.y;
    float _734 = gl_FragCoord.w;
    float _736 = _732 * _734;
    float _738 = in.m_82.x;
    float _740 = gl_FragCoord.w;
    float _742 = _738 * _740;
    float _744 = in.m_82.z;
    float _746 = gl_FragCoord.w;
    float _748 = _744 * _746;
    float _750 = in.m_84.x;
    float _752 = gl_FragCoord.w;
    float _754 = _750 * _752;
    float _756 = in.m_84.z;
    float _758 = gl_FragCoord.w;
    float _760 = _756 * _758;
    float _762 = in.m_84.y;
    float _764 = gl_FragCoord.w;
    float _766 = _762 * _764;
    float _768 = in.m_86.z;
    float _770 = gl_FragCoord.w;
    float _772 = _768 * _770;
    float _774 = in.m_86.x;
    float _776 = gl_FragCoord.w;
    float _778 = _774 * _776;
    float _780 = in.m_88.y;
    float _782 = gl_FragCoord.w;
    float _784 = _780 * _782;
    float _786 = _115 * _248;
    float _788 = _109 * _736;
    float _790 = _109 * _742;
    float _792 = fma(_512, (*spvDescriptorSet0.fp_c8)._m0[32].y, _788);
    float _794 = _109 * _748;
    float _796 = fma(_512, (*spvDescriptorSet0.fp_c8)._m0[32].x, _790);
    float _798 = in.m_86.y;
    float _800 = gl_FragCoord.w;
    float _802 = _798 * _800;
    float _804 = _792 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _806 = fma(_512, (*spvDescriptorSet0.fp_c8)._m0[32].z, _794);
    float _808 = _792 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _810 = fma(_796, (*spvDescriptorSet0.fp_c8)._m0[1].x, _804);
    float _812 = in.m_88.z;
    float _814 = gl_FragCoord.w;
    float _816 = _812 * _814;
    float _818 = fma(_796, (*spvDescriptorSet0.fp_c8)._m0[0].x, _808);
    float _820 = _109 * _760;
    float _822 = fma(_806, (*spvDescriptorSet0.fp_c8)._m0[1].z, _810);
    float _824 = _109 * _778;
    float _826 = fma(_806, (*spvDescriptorSet0.fp_c8)._m0[0].z, _818);
    float _828 = _822 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _830 = _826 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _832 = -_554;
    float _834 = _832 + _828;
    float _836 = -_576;
    float _838 = _836 + _830;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = precise::max(_186, 0.5);
    float _846 = precise::min(_844, 0.89999997615814208984375);
    float _848 = sqrt(_842);
    float _850 = fma(_846, 2.5000002384185791015625, -1.25000011920928955078125);
    float _852 = fma(_848, 0.0333333350718021392822265625, -1.0);
    float _854 = precise::clamp(_852, 0.0, 1.0);
    float _856 = fma(_854, -2.0, 3.0);
    float _858 = _854 * _854;
    float _860 = in.m_88.x;
    float _862 = gl_FragCoord.w;
    float _864 = _860 * _862;
    float _866 = _856 * _858;
    float _868 = in.m_88.w;
    float _870 = gl_FragCoord.w;
    float _872 = _868 * _870;
    float _874 = _866 * _850;
    float _876 = _186 * _866;
    float _878 = -_786;
    float _880 = _878 + 1.0;
    float _882 = _874 * 0.100000001490116119384765625;
    float _884 = _109 * _754;
    bool _886 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _888 = _109 * _766;
    float _890 = 1.0 / _882;
    float _892 = _884 * _880;
    float _894 = _820 * _880;
    float _896 = _888 * _880;
    float _898 = _109 * _816;
    if (_886)
    {
        float _900 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _902 = _240 + _900;
        _296 = _902;
    }
    float _904 = _296;
    float _906 = _904;
    if (_886)
    {
        float _908 = _904 * 8.0;
        float _910 = precise::clamp(_908, 0.0, 1.0);
        _906 = _910;
    }
    float _912 = _906;
    float _914 = _890 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _916 = precise::clamp(_914, 0.0, 1.0);
    float _918 = _109 * _864;
    float _920 = fma(_916, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _922 = _882 * _920;
    float _924 = _109 * _772;
    float _926 = fma(_726, 0.20999999344348907470703125, _892);
    float _928 = fma(_730, 0.20999999344348907470703125, _894);
    float _930 = _876 * 0.02624999918043613433837890625;
    float _932 = fma(_728, 0.20999999344348907470703125, _896);
    float _934 = _109 * _802;
    float _936 = _109 * _784;
    float _938 = fma(_930, (*spvDescriptorSet0.fp_c15)._m0[17].z, _928);
    float _940 = fma(_930, (*spvDescriptorSet0.fp_c15)._m0[17].x, _926);
    float _942 = fma(_930, (*spvDescriptorSet0.fp_c15)._m0[17].y, _932);
    float _944 = _109 * _872;
    float _946 = _938 + _924;
    float _948 = _940 + _824;
    float _950 = _942 + _934;
    float _952 = 0.0 + _280;
    float _954 = precise::clamp(_952, 0.0, 1.0);
    float _956 = fma(_676, _946, _922);
    float _958 = fma(_666, _948, _922);
    float _960 = fma(_674, _950, _922);
    float _962 = _954;
    if (_886)
    {
        float _964 = _954 * _912;
        _962 = _964;
    }
    float _966 = _962;
    float _968 = fma(_956, _944, _898);
    float _970 = fma(_958, _944, _918);
    float _972 = fma(_960, _944, _936);
    float _974 = 0.0 + _966;
    float _976 = precise::clamp(_974, 0.0, 1.0);
    out.m_80.x = _970;
    out.m_80.y = _972;
    out.m_80.z = _968;
    out.m_80.w = _976;
    return out;
}

