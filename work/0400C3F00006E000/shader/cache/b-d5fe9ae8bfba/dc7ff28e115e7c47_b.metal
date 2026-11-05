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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texturecube_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_44.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _82 * 0.15915493667125701904296875;
    float _88 = _78 * _70;
    float _90 = _78 * _76;
    float _92 = _86 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_84, _94, _90);
    float _98 = fma(_84, _94, _88);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1175 = float2(_98, _96);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1175, float2(0.0), isnan(_1175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1175, float2(0.0), isnan(_1175))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1192 = float2(_102, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1192, float2(0.0), isnan(_1192))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1192, float2(0.0), isnan(_1192))).xyz;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _110 * _110;
    float _124 = fma(_108, _108, _122);
    float _126 = fma(_112, _112, _124);
    float _128 = rsqrt(_126);
    float _130 = _110 * _128;
    float _132 = _108 * _128;
    float _134 = _112 * _128;
    float _136 = _130 * _130;
    float _138 = fma(_132, _132, _136);
    float _140 = sqrt(_138);
    bool _144 = _140 >= 0.00999999977648258209228515625;
    bool _146 = isnan(_140);
    bool _148 = _144 || _146;
    bool _150 = isnan(0.00999999977648258209228515625);
    bool _152 = _148 || _150;
    float _154 = 0.0;
    float _156 = _128;
    float _158 = _136;
    float _160 = _140;
    if (!_152)
    {
        float _162 = fma(_134, _134, _136);
        _154 = _162;
    }
    float _164 = _154;
    float _166 = _132 * _118;
    float _168 = _130 * _118;
    if (!_152)
    {
        _156 = 0.0;
    }
    float _170 = _156;
    float _172 = _98;
    float _174 = _170;
    if (!_152)
    {
        float _176 = rsqrt(_164);
        _172 = _176;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_152)
    {
        float _182 = _134 * _178;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = _184;
    if (!_152)
    {
        float _188 = _130 * _178;
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    float _194 = _190;
    if (!_152)
    {
        float _196 = _134 * _184;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = 0.0;
    float _202 = _198;
    if (!_152)
    {
        float _204 = fma(_132, _190, -0.0);
        _200 = _204;
    }
    float _206 = _200;
    float _208 = _206;
    if (!_152)
    {
        float _210 = _132 * _184;
        _160 = _210;
    }
    float _212 = _160;
    float _214 = _212;
    if (!_152)
    {
        float _216 = -_190;
        float _218 = -_198;
        float _220 = fma(_130, _216, _218);
        _202 = _220;
    }
    float _222 = _202;
    float _224 = _222;
    if (!_152)
    {
        float _226 = -_190;
        float _228 = (-0.0) + _226;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_152;
    float _234 = _230;
    if (!_232)
    {
        float _236 = rsqrt(_138);
        float _238 = _130 * _236;
        float _240 = -_236;
        float _242 = _132 * _240;
        float _244 = _134 * _238;
        float _246 = _132 * _242;
        float _248 = _134 * _242;
        float _250 = _244 * _244;
        float _252 = -_246;
        float _254 = fma(_130, _238, _252);
        float _256 = fma(_248, _248, _250);
        float _258 = fma(_254, _254, _256);
        float _260 = rsqrt(_258);
        float _262 = _248 * _260;
        float _264 = _254 * _260;
        float _266 = -_244;
        float _268 = fma(_266, _260, -0.0);
        _208 = _242;
        _224 = _238;
        _186 = _268;
        _174 = _262;
        _214 = 0.0;
        _234 = _264;
    }
    float _270 = _208;
    float _272 = _224;
    float _274 = _186;
    float _276 = _174;
    float _278 = _214;
    float _280 = _234;
    float _282 = fma(_116, _270, _168);
    float _284 = fma(_116, _272, _166);
    float _286 = _134 * _118;
    float _288 = in.m_46.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_120, _276, _284);
    float _298 = fma(_116, _278, _286);
    float _300 = in.m_48.w;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _294 * _294;
    float _308 = in.m_46.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_120, _280, _298);
    float _316 = in.m_48.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_296, _296, _306);
    float _324 = in.m_48.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = fma(_314, _314, _322);
    float _332 = rsqrt(_330);
    float _334 = _78 * _292;
    float _336 = -_130;
    float _338 = fma(_294, _332, _336);
    float _340 = -_132;
    float _342 = fma(_296, _332, _340);
    float _344 = -_134;
    float _346 = fma(_314, _332, _344);
    float _348 = _78 * _304;
    float _350 = fma(_338, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _352 = fma(_342, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _354 = _78 * _312;
    float _356 = _334 * _334;
    float _358 = _350 * _350;
    float _360 = fma(_346, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _362 = 1.0 / _348;
    float _364 = fma(_354, _354, _356);
    float _366 = fma(_352, _352, _358);
    float _368 = _78 * _320;
    float _370 = fma(_360, _360, _366);
    float _372 = sqrt(_364);
    float _374 = _78 * _328;
    float _376 = rsqrt(_370);
    float _378 = _368 * _362;
    float _380 = _374 * _362;
    float _382 = fma(_378, 0.5, 0.5);
    float _384 = fma(_380, -0.5, 0.5);
    float _386 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _388 = fma(_372, (*spvDescriptorSet0.fp_c4)._m0[1].x, _386);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _352 * _376;
    float _394 = _360 * _376;
    float _396 = -_392;
    float _398 = fma(_390, _396, _392);
    float _400 = -_394;
    float _402 = fma(_390, _400, _394);
    float _404 = fma(_398, 0.0199999995529651641845703125, _382);
    float _406 = fma(_402, 0.0199999995529651641845703125, _384);
    float2 _1622 = float2(_404, _406);
    float _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1622, float2(0.0), isnan(_1622))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1622, float2(0.0), isnan(_1622))).x;
    float _410 = in.m_46.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = -_334;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _420 = _350 * _376;
    float _422 = _380 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _424 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _426 = _380 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _428 = -_420;
    float _430 = _428 + 1.0;
    float _432 = _380 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _434 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _424);
    float _436 = -_354;
    float _438 = _436 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _440 = fma(_390, _430, _420);
    float _442 = _380 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _444 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[5].x, _422);
    float _446 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[6].x, _426);
    float _448 = _78 * _414;
    float _450 = -_448;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _454 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _434);
    float _456 = _452 * _452;
    float _458 = fma(_438, _438, _456);
    float _460 = rsqrt(_454);
    float _462 = fma(_418, _418, _458);
    float _464 = rsqrt(_462);
    float _466 = _460 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _468 = _460 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _470 = _460 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _472 = _452 * _464;
    float _474 = _438 * _464;
    float _476 = _418 * _464;
    float _478 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[4].x, _442);
    float _480 = -_466;
    float _482 = _472 + _480;
    float _484 = -_468;
    float _486 = _474 + _484;
    float _488 = -_470;
    float _490 = _476 + _488;
    float _492 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[7].x, _432);
    float _494 = _482 * _482;
    float _496 = -_466;
    float _498 = _440 * _496;
    float _500 = fma(_486, _486, _494);
    float _502 = -_468;
    float _504 = fma(_398, _502, _498);
    float _506 = fma(_490, _490, _500);
    float _508 = rsqrt(_506);
    float _510 = _482 * _508;
    float _512 = _486 * _508;
    float _514 = _440 * _510;
    float _516 = fma(_398, _512, _514);
    float _518 = -_472;
    float _520 = _440 * _518;
    float _522 = fma(_408, 2.0, -1.0);
    float _524 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[7].z, _492);
    float _526 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[5].z, _444);
    float _528 = _524 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _530 = -_474;
    float _532 = fma(_398, _530, _520);
    float _534 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[4].z, _478);
    float _536 = _526 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _538 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[6].z, _446);
    float _540 = -_476;
    float _542 = fma(_402, _540, _532);
    float _544 = 1.0 / _528;
    float _546 = _534 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _548 = _542 + _542;
    float _550 = -_548;
    float _552 = -_472;
    float _554 = fma(_440, _550, _552);
    float _556 = -_548;
    float _558 = -_474;
    float _560 = fma(_398, _556, _558);
    float _562 = _536 * _544;
    float _564 = _538 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _566 = _546 * _544;
    float _568 = _440 * _472;
    float _570 = -_448;
    float _572 = _570 + _562;
    float _574 = _564 * _544;
    float _576 = -_354;
    float _578 = _576 + _566;
    float _580 = fma(_398, _474, _568);
    float _582 = _472 * _572;
    float _584 = -_334;
    float _586 = _584 + _574;
    float _588 = fma(_474, _578, _582);
    float _590 = fma(_476, _586, _588);
    bool _592 = _590 > 0.0;
    float _594 = _398;
    float _596 = _440;
    float _598 = _582;
    float _600 = _492;
    float _602 = _444;
    float _604 = _478;
    float _606 = _446;
    float _608 = _406;
    float _610 = _448;
    float _612 = _354;
    float _614 = _334;
    if (_592)
    {
        float2 _1950 = float2(_382, _384);
        float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1950, float2(0.0), isnan(_1950))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1950, float2(0.0), isnan(_1950))).xyz;
        float _618 = _616.x;
        float _620 = _616.y;
        float _622 = _616.z;
        _594 = _618;
        _596 = _620;
        _598 = _622;
    }
    float _624 = _594;
    float _626 = _596;
    float _628 = _598;
    float _630 = _384;
    if (_592)
    {
        float2 _1974 = float2(_382, _384);
        float _632 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1974, float2(0.0), isnan(_1974))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1974, float2(0.0), isnan(_1974))).x;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = -_548;
    float _638 = -_476;
    float _640 = fma(_402, _636, _638);
    float _642 = abs(_560);
    float _644 = abs(_554);
    float _646 = precise::max(_642, _644);
    float _648 = _490 * _508;
    float _650 = abs(_640);
    float _652 = precise::max(_650, _646);
    float _654 = fma(_402, _648, _516);
    float _656 = 1.0 / _652;
    float _658 = _560 * _656;
    float _660 = _640 * _656;
    float _662 = _554 * _656;
    float _664 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _2030 = float4(_658, _662, _660, float(0));
    float4 _2034 = select(_2030, float4(0.0), isnan(_2030));
    float3 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2034.xyz, uint(rint(_2034.w)), level(_664)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2034.xyz, uint(rint(_2034.w)), level(_664)).xyz;
    float _668 = _666.x;
    float _670 = _666.y;
    float _672 = _666.z;
    float _674 = _624;
    float _676 = _626;
    float _678 = _628;
    if (!_592)
    {
        float2 _2053 = float2(_404, _406);
        float3 _680 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2053, float2(0.0), isnan(_2053))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2053, float2(0.0), isnan(_2053))).xyz;
        float _682 = _680.x;
        float _684 = _680.y;
        float _686 = _680.z;
        _674 = _682;
        _676 = _684;
        _678 = _686;
    }
    float _688 = _674;
    float _690 = _676;
    float _692 = _678;
    float _694 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _696 = precise::max(_654, 9.9999999392252902907785028219223e-09);
    float _698 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _700 = -_470;
    float _702 = fma(_402, _700, _504);
    float _704 = fma(_402, _476, _580);
    float _706 = _694 * _694;
    float _708 = _706 * 0.5;
    float _710 = fma(_698, _698, -1.0);
    float _712 = _696 * _696;
    float _714 = precise::max(_702, 9.9999999392252902907785028219223e-09);
    float _716 = -_708;
    float _718 = _716 + 1.0;
    float _720 = precise::max(_704, 9.9999999392252902907785028219223e-09);
    float _722 = fma(_712, _710, 1.0);
    float _724 = sqrt(_462);
    float _726 = fma(_714, _718, _708);
    float _728 = 0.0 + _702;
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = fma(_720, _718, _708);
    float _734 = precise::max(_722, 9.9999999392252902907785028219223e-09);
    float _736 = fma(_720, -5.554729938507080078125, -6.9831600189208984375);
    float _738 = 1.0 / _726;
    float _740 = _720 * _736;
    bool _742 = _724 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _744 = isnan(_724);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _750 = _746 || _748;
    float _752 = 1.0 / _734;
    float _754 = 1.0 / _732;
    float _756 = _698 * _752;
    float _758 = exp2(_740);
    float _760 = _756 * _756;
    float _762 = _738 * _754;
    float _764 = _760 * 0.3183098733425140380859375;
    float _766 = _764 * _762;
    float _768 = _766 * 0.25;
    float _770 = _634;
    float _772 = _736;
    float _774 = _688;
    float _776 = _690;
    float _778 = _692;
    if (_592)
    {
        float _780 = fma(_634, 2.0, -1.0);
        _770 = _780;
    }
    float _782 = _770;
    if (_592)
    {
        float _784 = fma(_782, (*spvDescriptorSet0.fp_c3)._m0[7].z, _492);
        _600 = _784;
    }
    float _786 = _600;
    float _788 = _786;
    if (_592)
    {
        float _790 = fma(_782, (*spvDescriptorSet0.fp_c3)._m0[5].z, _444);
        _602 = _790;
    }
    float _792 = _602;
    float _794 = _792;
    if (_592)
    {
        float _796 = fma(_782, (*spvDescriptorSet0.fp_c3)._m0[4].z, _478);
        _604 = _796;
    }
    float _798 = _604;
    float _800 = _798;
    if (_592)
    {
        float _802 = fma(_782, (*spvDescriptorSet0.fp_c3)._m0[6].z, _446);
        _606 = _802;
    }
    float _804 = _606;
    float _806 = _804;
    if (_592)
    {
        float _808 = _786 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _788 = _808;
    }
    float _810 = _788;
    if (_592)
    {
        float _812 = _792 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _794 = _812;
    }
    float _814 = _794;
    if (_592)
    {
        float _816 = _798 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _772 = _816;
    }
    float _818 = _772;
    float _820 = _818;
    if (_592)
    {
        float _822 = _804 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _806 = _822;
    }
    float _824 = _806;
    float _826 = _810;
    if (_592)
    {
        float _828 = 1.0 / _810;
        _826 = _828;
    }
    float _830 = _826;
    if (_592)
    {
        float _832 = _814 * _830;
        _800 = _832;
    }
    float _834 = _800;
    float _836 = _834;
    if (_592)
    {
        float _838 = _818 * _830;
        _820 = _838;
    }
    float _840 = _820;
    float _842 = _840;
    if (_592)
    {
        float _844 = -_448;
        float _846 = _844 + _834;
        _608 = _846;
    }
    float _848 = _608;
    float _850 = _848;
    if (!_592)
    {
        _850 = _572;
    }
    float _852 = _850;
    if (_592)
    {
        float _854 = _824 * _830;
        _610 = _854;
    }
    float _856 = _610;
    float _858 = _856;
    if (_592)
    {
        float _860 = -_354;
        float _862 = _860 + _840;
        _612 = _862;
    }
    float _864 = _612;
    float _866 = _864;
    if (!_592)
    {
        _866 = _578;
    }
    float _868 = _866;
    float _870 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _872 = 1.0 + _870;
    float _874 = _852 * _852;
    if (_592)
    {
        float _876 = -_334;
        float _878 = _876 + _856;
        _614 = _878;
    }
    float _880 = _614;
    float _882 = _880;
    if (!_592)
    {
        _882 = _586;
    }
    float _884 = _882;
    float _886 = fma(_868, _868, _874);
    float _888 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _890 = 1.0 + _888;
    if (!_592)
    {
        _836 = _562;
    }
    float _892 = _836;
    float _894 = fma(_884, _884, _886);
    if (!_592)
    {
        _842 = _566;
    }
    float _896 = _842;
    float _898 = sqrt(_894);
    if (!_592)
    {
        _858 = _574;
    }
    float _900 = _858;
    float _902 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _904 = fma(_80, (*spvDescriptorSet0.fp_c4)._m0[1].z, _902);
    float _906 = _730 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _908 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _910 = _898 + _908;
    float _912 = _910 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _914 = precise::clamp(_912, 0.0, 1.0);
    float _916 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _918 = 1.0 + _916;
    float _920 = abs(_914);
    float _922 = log2(_920);
    float _924 = fma(_918, _758, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _926 = fma(_890, _758, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _928 = _730 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _930 = fma(_872, _758, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _932 = _924 * _768;
    float _934 = _924 * _668;
    float _936 = _926 * _670;
    float _938 = _926 * _768;
    float _940 = _928 * _932;
    float _942 = fma(_934, (*spvDescriptorSet0.fp_c4)._m0[7].x, _940);
    float _944 = _922 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _946 = _906 * _938;
    float _948 = exp2(_944);
    float _950 = fma(_936, (*spvDescriptorSet0.fp_c4)._m0[7].y, _946);
    if (!_750)
    {
        float _952 = fma(_892, (*spvDescriptorSet0.fp_c4)._m0[3].y, _896);
        float _954 = fma(_892, (*spvDescriptorSet0.fp_c4)._m0[3].y, _900);
        float _956 = _952 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _958 = -_954;
        float _960 = fma(_958, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2513 = float2(_956, _960);
        float4 _963 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2513, float2(0.0), isnan(_2513)), int2(0), component::x).xyzw;
        float _965 = _963.x;
        float _967 = _963.y;
        float _969 = _963.z;
        float _971 = _963.w;
        float _973 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _975 = fma(_724, (*spvDescriptorSet0.fp_c4)._m0[2].x, _973);
        float _977 = precise::clamp(_975, 0.0, 1.0);
        float _979 = -_977;
        float _981 = _979 + 1.0;
        float _983 = _965 + _967;
        float _985 = -_981;
        float _987 = fma(_985, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _989 = precise::clamp(_987, 0.0, 1.0);
        float _991 = _969 + _983;
        float _993 = _971 + _991;
        float _995 = fma(_993, 0.25, 1.0);
        float _997 = _995 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _999 = _995 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _1001 = _995 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _1003 = _997 * _688;
        float _1005 = _999 * _690;
        float _1007 = _1001 * _692;
        float _1009 = -_1003;
        float _1011 = _1009 + _688;
        float _1013 = -_1005;
        float _1015 = _1013 + _690;
        float _1017 = -_1007;
        float _1019 = _1017 + _692;
        float _1021 = fma(_989, _1011, _1003);
        float _1023 = fma(_989, _1015, _1005);
        float _1025 = fma(_989, _1019, _1007);
        _774 = _1021;
        _776 = _1023;
        _778 = _1025;
    }
    float _1027 = _774;
    float _1029 = _776;
    float _1031 = _778;
    float _1033 = _730 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1035 = _930 * _768;
    float _1037 = _1027 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1039 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1041 = _1029 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1043 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1045 = _1031 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1047 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1049 = _1033 * _1035;
    float _1051 = _930 * _672;
    float _1053 = -_1041;
    float _1055 = fma(_906, _1039, _1053);
    float _1057 = -_1045;
    float _1059 = fma(_1033, _1043, _1057);
    float _1061 = -_1037;
    float _1063 = fma(_928, _1047, _1061);
    float _1065 = fma(_1051, (*spvDescriptorSet0.fp_c4)._m0[7].z, _1049);
    float _1067 = fma(_948, _1055, _1041);
    float _1069 = fma(_948, _1059, _1045);
    float _1071 = fma(_948, _1063, _1037);
    float _1073 = precise::max(0.0, _904);
    float _1075 = -_924;
    float _1077 = _1075 + 1.0;
    float _1079 = -_926;
    float _1081 = _1079 + 1.0;
    float _1083 = -_930;
    float _1085 = _1083 + 1.0;
    float _1087 = fma(_1071, _1077, _942);
    float _1089 = fma(_1067, _1081, _950);
    float _1091 = fma(_1069, _1085, _1065);
    float _1093 = -_1073;
    float _1095 = _1093 + 1.0;
    float _1097 = precise::clamp(_1095, 0.0, 1.0);
    out.m_51.x = _1087;
    out.m_51.y = _1089;
    out.m_51.z = _1091;
    out.m_51.w = _1097;
    return out;
}

