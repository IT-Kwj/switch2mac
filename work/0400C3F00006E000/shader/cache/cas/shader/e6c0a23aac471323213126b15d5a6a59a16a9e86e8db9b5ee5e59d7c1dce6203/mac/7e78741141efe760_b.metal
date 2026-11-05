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
    float _84 = _82 * 0.15915493667125701904296875;
    float _86 = _78 * _70;
    float _88 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _90 = _78 * _76;
    float _92 = _84 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_88, _94, _86);
    float _98 = fma(_88, _94, _90);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1245 = float2(_96, _98);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1245, float2(0.0), isnan(_1245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1245, float2(0.0), isnan(_1245))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1262 = float2(_100, _102);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1262, float2(0.0), isnan(_1262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1262, float2(0.0), isnan(_1262))).xyz;
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
    float _154 = _98;
    float _156 = _126;
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
    float _172 = _112;
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
    float _300 = in.m_46.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _294 * _294;
    float _308 = in.m_48.w;
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
    float _354 = _334 * _334;
    float _356 = fma(_346, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _358 = _350 * _350;
    float _360 = _78 * _312;
    float _362 = fma(_348, _348, _354);
    float _364 = _78 * _320;
    float _366 = fma(_352, _352, _358);
    float _368 = 1.0 / _360;
    float _370 = fma(_356, _356, _366);
    float _372 = _78 * _328;
    float _374 = sqrt(_362);
    float _376 = rsqrt(_370);
    float _378 = _364 * _368;
    float _380 = _372 * _368;
    float _382 = fma(_378, 0.5, 0.5);
    float _384 = fma(_380, -0.5, 0.5);
    float _386 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _388 = fma(_374, (*spvDescriptorSet0.fp_c4)._m0[1].x, _386);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _352 * _376;
    float _394 = _356 * _376;
    float _396 = -_392;
    float _398 = fma(_390, _396, _392);
    float _400 = -_394;
    float _402 = fma(_390, _400, _394);
    float _404 = fma(_398, 0.0199999995529651641845703125, _382);
    float _406 = fma(_402, 0.0199999995529651641845703125, _384);
    float2 _1693 = float2(_404, _406);
    float _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1693, float2(0.0), isnan(_1693))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1693, float2(0.0), isnan(_1693))).x;
    float _410 = in.m_46.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = -_348;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _420 = -_334;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _424 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _426 = _350 * _376;
    float _428 = _380 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _430 = _380 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _432 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _424);
    float _434 = _380 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _436 = _380 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _438 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[5].x, _430);
    float _440 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _432);
    float _442 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[6].x, _434);
    float _444 = rsqrt(_440);
    float _446 = _78 * _414;
    float _448 = -_446;
    float _450 = _448 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _452 = _444 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _454 = _444 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _456 = _444 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _458 = _450 * _450;
    float _460 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[4].x, _428);
    float _462 = -_426;
    float _464 = _462 + 1.0;
    float _466 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[7].x, _436);
    float _468 = fma(_418, _418, _458);
    float _470 = fma(_390, _464, _426);
    float _472 = fma(_422, _422, _468);
    float _474 = rsqrt(_472);
    float _476 = _450 * _474;
    float _478 = _418 * _474;
    float _480 = _422 * _474;
    float _482 = -_452;
    float _484 = _476 + _482;
    float _486 = -_454;
    float _488 = _478 + _486;
    float _490 = -_456;
    float _492 = _480 + _490;
    float _494 = _484 * _484;
    float _496 = fma(_488, _488, _494);
    float _498 = fma(_492, _492, _496);
    float _500 = rsqrt(_498);
    float _502 = _488 * _500;
    float _504 = _484 * _500;
    float _506 = _492 * _500;
    float _508 = fma(_408, 2.0, -1.0);
    float _510 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[7].z, _466);
    float _512 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[5].z, _438);
    float _514 = _510 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _516 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[4].z, _460);
    float _518 = _512 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _520 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[6].z, _442);
    float _522 = _516 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _524 = 1.0 / _514;
    float _526 = _520 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _528 = _518 * _524;
    float _530 = _522 * _524;
    float _532 = _526 * _524;
    float _534 = -_446;
    float _536 = _534 + _528;
    float _538 = -_348;
    float _540 = _538 + _530;
    float _542 = -_334;
    float _544 = _542 + _532;
    float _546 = _476 * _536;
    float _548 = fma(_478, _540, _546);
    float _550 = fma(_480, _544, _548);
    bool _552 = _550 > 0.0;
    float _554 = _526;
    float _556 = _550;
    float _558 = _518;
    float _560 = _466;
    float _562 = _438;
    float _564 = _460;
    float _566 = _442;
    float _568 = _446;
    float _570 = _348;
    float _572 = _334;
    if (_552)
    {
        float2 _1962 = float2(_382, _384);
        float3 _574 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1962, float2(0.0), isnan(_1962))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1962, float2(0.0), isnan(_1962))).xyz;
        float _576 = _574.x;
        float _578 = _574.y;
        float _580 = _574.z;
        _554 = _576;
        _556 = _578;
        _558 = _580;
    }
    float _582 = _554;
    float _584 = _556;
    float _586 = _558;
    float _588 = _384;
    if (_552)
    {
        float2 _1986 = float2(_382, _384);
        float _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1986, float2(0.0), isnan(_1986))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1986, float2(0.0), isnan(_1986))).x;
        _588 = _590;
    }
    float _592 = _588;
    float _594 = -_452;
    float _596 = _470 * _594;
    float _598 = -_476;
    float _600 = _470 * _598;
    float _602 = _470 * _504;
    float _604 = -_454;
    float _606 = fma(_398, _604, _596);
    float _608 = -_478;
    float _610 = fma(_398, _608, _600);
    float _612 = fma(_398, _502, _602);
    float _614 = _470 * _476;
    float _616 = -_456;
    float _618 = fma(_402, _616, _606);
    float _620 = -_480;
    float _622 = fma(_402, _620, _610);
    float _624 = fma(_402, _506, _612);
    float _626 = _622 + _622;
    float _628 = -_626;
    float _630 = -_476;
    float _632 = fma(_470, _628, _630);
    float _634 = -_626;
    float _636 = -_478;
    float _638 = fma(_398, _634, _636);
    float _640 = -_626;
    float _642 = -_480;
    float _644 = fma(_402, _640, _642);
    float _646 = abs(_638);
    float _648 = abs(_632);
    float _650 = precise::max(_646, _648);
    float _652 = abs(_644);
    float _654 = precise::max(_652, _650);
    float _656 = 1.0 / _654;
    float _658 = _638 * _656;
    float _660 = _632 * _656;
    float _662 = _644 * _656;
    float _664 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _2102 = float4(_658, _660, _662, float(0));
    float4 _2106 = select(_2102, float4(0.0), isnan(_2102));
    float3 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2106.xyz, uint(rint(_2106.w)), level(_664)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2106.xyz, uint(rint(_2106.w)), level(_664)).xyz;
    float _668 = _666.x;
    float _670 = _666.y;
    float _672 = _666.z;
    float _674 = _582;
    float _676 = _584;
    float _678 = _586;
    if (!_552)
    {
        float2 _2125 = float2(_404, _406);
        float3 _680 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2125, float2(0.0), isnan(_2125))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2125, float2(0.0), isnan(_2125))).xyz;
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
    float _696 = precise::max(_624, 9.9999999392252902907785028219223e-09);
    float _698 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _700 = fma(_398, _478, _614);
    float _702 = _694 * _694;
    float _704 = _702 * 0.5;
    float _706 = precise::max(_618, 9.9999999392252902907785028219223e-09);
    float _708 = fma(_698, _698, -1.0);
    float _710 = _696 * _696;
    float _712 = fma(_402, _480, _700);
    float _714 = -_704;
    float _716 = _714 + 1.0;
    float _718 = fma(_710, _708, 1.0);
    float _720 = sqrt(_472);
    float _722 = fma(_706, _716, _704);
    float _724 = 0.0 + _618;
    float _726 = precise::clamp(_724, 0.0, 1.0);
    float _728 = precise::max(_712, 9.9999999392252902907785028219223e-09);
    float _730 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _732 = 1.0 + _730;
    float _734 = precise::max(_718, 9.9999999392252902907785028219223e-09);
    float _736 = fma(_728, _716, _704);
    float _738 = 1.0 / _722;
    float _740 = fma(_728, -5.554729938507080078125, -6.9831600189208984375);
    float _742 = _728 * _740;
    bool _744 = _720 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _746 = isnan(_720);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _752 = _748 || _750;
    float _754 = 1.0 / _734;
    float _756 = 1.0 / _736;
    float _758 = _698 * _754;
    float _760 = exp2(_742);
    float _762 = _758 * _758;
    float _764 = _738 * _756;
    float _766 = _762 * 0.3183098733425140380859375;
    float _768 = _726 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _770 = _766 * _764;
    float _772 = _770 * 0.25;
    float _774 = fma(_732, _760, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _776 = _592;
    float _778 = _736;
    float _780 = _764;
    float _782 = _688;
    float _784 = _692;
    float _786 = _690;
    if (_552)
    {
        float _788 = fma(_592, 2.0, -1.0);
        _776 = _788;
    }
    float _790 = _776;
    if (_552)
    {
        float _792 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[7].z, _466);
        _560 = _792;
    }
    float _794 = _560;
    float _796 = _794;
    if (_552)
    {
        float _798 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[5].z, _438);
        _562 = _798;
    }
    float _800 = _562;
    float _802 = _800;
    if (_552)
    {
        float _804 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[4].z, _460);
        _564 = _804;
    }
    float _806 = _564;
    float _808 = _806;
    if (_552)
    {
        float _810 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[6].z, _442);
        _566 = _810;
    }
    float _812 = _566;
    float _814 = _812;
    if (_552)
    {
        float _816 = _794 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _796 = _816;
    }
    float _818 = _796;
    if (_552)
    {
        float _820 = _800 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _802 = _820;
    }
    float _822 = _802;
    if (_552)
    {
        float _824 = _806 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _778 = _824;
    }
    float _826 = _778;
    float _828 = _826;
    if (_552)
    {
        float _830 = _812 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _814 = _830;
    }
    float _832 = _814;
    float _834 = _818;
    if (_552)
    {
        float _836 = 1.0 / _818;
        _834 = _836;
    }
    float _838 = _834;
    if (_552)
    {
        float _840 = _822 * _838;
        _808 = _840;
    }
    float _842 = _808;
    float _844 = _842;
    if (_552)
    {
        float _846 = _826 * _838;
        _828 = _846;
    }
    float _848 = _828;
    float _850 = _848;
    if (_552)
    {
        float _852 = -_446;
        float _854 = _852 + _842;
        _780 = _854;
    }
    float _856 = _780;
    float _858 = _856;
    if (!_552)
    {
        _858 = _536;
    }
    float _860 = _858;
    if (_552)
    {
        float _862 = _832 * _838;
        _568 = _862;
    }
    float _864 = _568;
    float _866 = _864;
    if (_552)
    {
        float _868 = -_348;
        float _870 = _868 + _848;
        _570 = _870;
    }
    float _872 = _570;
    float _874 = _872;
    if (!_552)
    {
        _874 = _540;
    }
    float _876 = _874;
    float _878 = _860 * _860;
    if (_552)
    {
        float _880 = -_334;
        float _882 = _880 + _864;
        _572 = _882;
    }
    float _884 = _572;
    float _886 = _884;
    if (!_552)
    {
        _886 = _544;
    }
    float _888 = _886;
    float _890 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _892 = 1.0 + _890;
    float _894 = fma(_876, _876, _878);
    float _896 = _726 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    if (!_552)
    {
        _850 = _530;
    }
    float _898 = _850;
    float _900 = fma(_892, _760, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _902 = fma(_888, _888, _894);
    if (!_552)
    {
        _844 = _528;
    }
    float _904 = _844;
    float _906 = _900 * _772;
    if (!_552)
    {
        _866 = _532;
    }
    float _908 = _866;
    float _910 = sqrt(_902);
    float _912 = _768 * _906;
    float _914 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _916 = _910 + _914;
    float _918 = _916 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _920 = precise::clamp(_918, 0.0, 1.0);
    float _922 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _924 = 1.0 + _922;
    float _926 = fma(_924, _760, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _928 = abs(_920);
    float _930 = log2(_928);
    float _932 = _926 * _772;
    float _934 = _896 * _932;
    float _936 = _930 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _938 = _926 * _668;
    float _940 = _900 * _670;
    float _942 = exp2(_936);
    float _944 = fma(_938, (*spvDescriptorSet0.fp_c4)._m0[7].x, _934);
    float _946 = fma(_940, (*spvDescriptorSet0.fp_c4)._m0[7].y, _912);
    if (!_752)
    {
        float _948 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[3].y, _898);
        float _950 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[3].y, _908);
        float _952 = _948 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _954 = -_950;
        float _956 = fma(_954, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2576 = float2(_952, _956);
        float4 _959 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2576, float2(0.0), isnan(_2576)), int2(0), component::x).xyzw;
        float _961 = _959.x;
        float _963 = _959.y;
        float _965 = _959.z;
        float _967 = _959.w;
        float _969 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _971 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[2].x, _969);
        float _973 = precise::clamp(_971, 0.0, 1.0);
        float _975 = -_973;
        float _977 = _975 + 1.0;
        float _979 = _961 + _963;
        float _981 = -_977;
        float _983 = fma(_981, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _985 = precise::clamp(_983, 0.0, 1.0);
        float _987 = _965 + _979;
        float _989 = _967 + _987;
        float _991 = fma(_989, 0.25, 1.0);
        float _993 = _991 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _995 = _991 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _997 = _991 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _999 = _993 * _688;
        float _1001 = _995 * _690;
        float _1003 = _997 * _692;
        float _1005 = -_999;
        float _1007 = _1005 + _688;
        float _1009 = -_1001;
        float _1011 = _1009 + _690;
        float _1013 = -_1003;
        float _1015 = _1013 + _692;
        float _1017 = fma(_985, _1007, _999);
        float _1019 = fma(_985, _1011, _1001);
        float _1021 = fma(_985, _1015, _1003);
        _782 = _1017;
        _784 = _1021;
        _786 = _1019;
    }
    float _1023 = _782;
    float _1025 = _784;
    float _1027 = _786;
    float _1029 = _726 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1031 = _774 * _772;
    float _1033 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1035 = _1023 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1037 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1039 = _1025 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1041 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1043 = _1029 * _1031;
    float _1045 = _774 * _672;
    float _1047 = _1027 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1049 = -_1035;
    float _1051 = fma(_896, _1033, _1049);
    float _1053 = -_1039;
    float _1055 = fma(_1029, _1037, _1053);
    float _1057 = fma(_1045, (*spvDescriptorSet0.fp_c4)._m0[7].z, _1043);
    float _1059 = -_1047;
    float _1061 = fma(_768, _1041, _1059);
    float _1063 = fma(_942, _1051, _1035);
    float _1065 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _1067 = _910 + _1065;
    float _1069 = -_926;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_942, _1055, _1039);
    float _1075 = -_774;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_942, _1061, _1047);
    float _1081 = -_900;
    float _1083 = _1081 + 1.0;
    float _1085 = _1067 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1087 = precise::clamp(_1085, 0.0, 1.0);
    float _1089 = fma(_1063, _1071, _944);
    float _1091 = fma(_1073, _1077, _1057);
    float _1093 = fma(_1079, _1083, _946);
    float _1095 = _1087 * 3.0;
    float _1097 = precise::clamp(_1095, 0.0, 1.0);
    float _1099 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1101 = _1089 + _1099;
    float _1103 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1105 = _1091 + _1103;
    float _1107 = abs(_1087);
    float _1109 = log2(_1107);
    float _1111 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1113 = _1093 + _1111;
    float _1115 = fma(_1097, _1101, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1117 = fma(_1097, _1105, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1119 = -_1087;
    float _1121 = _1119 + 1.0;
    float _1123 = fma(_1097, _1113, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1125 = precise::max(_1115, 9.9999999392252902907785028219223e-09);
    float _1127 = precise::max(_1117, 9.9999999392252902907785028219223e-09);
    float _1129 = precise::max(_1123, 9.9999999392252902907785028219223e-09);
    float _1131 = sqrt(_1125);
    float _1133 = _1109 * 0.100000001490116119384765625;
    float _1135 = sqrt(_1129);
    float _1137 = sqrt(_1127);
    float _1139 = fma(_1121, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1131);
    float _1141 = -_1139;
    float _1143 = _1115 + _1141;
    float _1145 = exp2(_1133);
    float _1147 = fma(_1121, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1135);
    float _1149 = -_1147;
    float _1151 = _1123 + _1149;
    float _1153 = fma(_1121, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1137);
    float _1155 = _1087 * 5.0;
    float _1157 = -_1153;
    float _1159 = _1117 + _1157;
    float _1161 = fma(_1145, _1143, _1139);
    float _1163 = fma(_1145, _1151, _1147);
    float _1165 = fma(_1145, _1159, _1153);
    float _1167 = precise::min(_1155, 1.0);
    out.m_51.x = _1161;
    out.m_51.y = _1163;
    out.m_51.z = _1165;
    out.m_51.w = _1167;
    return out;
}

