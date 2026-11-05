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
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_44.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _78 * _70;
    float _88 = _82 * 0.15915493667125701904296875;
    float _90 = _78 * _76;
    float _92 = _88 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_84, _94, _86);
    float _98 = fma(_84, _94, _90);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1219 = float2(_98, _96);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1219, float2(0.0), isnan(_1219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1219, float2(0.0), isnan(_1219))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1236 = float2(_102, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1236, float2(0.0), isnan(_1236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1236, float2(0.0), isnan(_1236))).xyz;
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
        _214 = 0.0;
        _174 = _262;
        _234 = _264;
    }
    float _270 = _208;
    float _272 = _224;
    float _274 = _186;
    float _276 = _214;
    float _278 = _174;
    float _280 = _234;
    float _282 = fma(_116, _270, _168);
    float _284 = _134 * _118;
    float _286 = fma(_116, _272, _166);
    float _288 = in.m_46.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_116, _276, _284);
    float _298 = fma(_120, _278, _286);
    float _300 = _294 * _294;
    float _302 = fma(_120, _280, _296);
    float _304 = in.m_46.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = fma(_298, _298, _300);
    float _312 = in.m_46.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = fma(_302, _302, _310);
    float _320 = rsqrt(_318);
    float _322 = _78 * _292;
    float _324 = -_130;
    float _326 = fma(_294, _320, _324);
    float _328 = -_132;
    float _330 = fma(_298, _320, _328);
    float _332 = -_134;
    float _334 = fma(_302, _320, _332);
    float _336 = fma(_326, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _338 = fma(_330, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _340 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _342 = 1.0 / _322;
    float _344 = _336 * _336;
    float _346 = _78 * _308;
    float _348 = fma(_338, _338, _344);
    float _350 = fma(_340, _340, _348);
    float _352 = _78 * _316;
    float _354 = rsqrt(_350);
    float _356 = _346 * _342;
    float _358 = _352 * _342;
    float _360 = fma(_356, 0.5, 0.5);
    float _362 = fma(_358, -0.5, 0.5);
    float _364 = _338 * _354;
    float _366 = _340 * _354;
    float _368 = fma(_364, 0.0199999995529651641845703125, _360);
    float _370 = fma(_366, 0.0199999995529651641845703125, _362);
    float2 _1615 = float2(_368, _370);
    float _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1615, float2(0.0), isnan(_1615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1615, float2(0.0), isnan(_1615))).x;
    float _374 = in.m_48.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_48.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_48.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = _358 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _394 = _358 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _396 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _398 = _358 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _400 = _336 * _354;
    float _402 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _396);
    float _404 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _402);
    float _406 = rsqrt(_404);
    float _408 = _78 * _378;
    float _410 = _78 * _384;
    float _412 = _78 * _390;
    float _414 = -_408;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _418 = -_410;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _422 = -_412;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _426 = _406 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _428 = _416 * _416;
    float _430 = _406 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _432 = fma(_420, _420, _428);
    float _434 = fma(_424, _424, _432);
    float _436 = _406 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _438 = rsqrt(_434);
    float _440 = _416 * _438;
    float _442 = _420 * _438;
    float _444 = _424 * _438;
    float _446 = -_426;
    float _448 = _440 + _446;
    float _450 = -_436;
    float _452 = _442 + _450;
    float _454 = -_430;
    float _456 = _444 + _454;
    float _458 = _448 * _448;
    float _460 = fma(_452, _452, _458);
    float _462 = fma(_456, _456, _460);
    float _464 = _358 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _466 = rsqrt(_462);
    float _468 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[4].x, _464);
    float _470 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[5].x, _392);
    float _472 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[6].x, _394);
    float _474 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[7].x, _398);
    float _476 = _456 * _466;
    float _478 = _452 * _466;
    float _480 = _448 * _466;
    float _482 = fma(_372, 2.0, -1.0);
    float _484 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[7].z, _474);
    float _486 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[5].z, _470);
    float _488 = _484 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _490 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[4].z, _468);
    float _492 = _486 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _494 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[6].z, _472);
    float _496 = 1.0 / _488;
    float _498 = _490 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _500 = _494 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _502 = _492 * _496;
    float _504 = _498 * _496;
    float _506 = _500 * _496;
    float _508 = -_408;
    float _510 = _508 + _502;
    float _512 = -_410;
    float _514 = _512 + _504;
    float _516 = -_412;
    float _518 = _516 + _506;
    float _520 = _440 * _510;
    float _522 = fma(_442, _514, _520);
    float _524 = fma(_444, _518, _522);
    bool _526 = _524 > 0.0;
    float _528 = _524;
    float _530 = _498;
    float _532 = _492;
    float _534 = _474;
    float _536 = _470;
    float _538 = _468;
    float _540 = _472;
    float _542 = _408;
    float _544 = _410;
    float _546 = _412;
    if (_526)
    {
        float2 _1896 = float2(_360, _362);
        float3 _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1896, float2(0.0), isnan(_1896))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1896, float2(0.0), isnan(_1896))).xyz;
        float _550 = _548.x;
        float _552 = _548.y;
        float _554 = _548.z;
        _528 = _550;
        _530 = _552;
        _532 = _554;
    }
    float _556 = _528;
    float _558 = _530;
    float _560 = _532;
    float _562 = -_440;
    float _564 = _400 * _562;
    float _566 = -_426;
    float _568 = _400 * _566;
    float _570 = _400 * _480;
    float _572 = -_442;
    float _574 = fma(_364, _572, _564);
    float _576 = -_436;
    float _578 = fma(_364, _576, _568);
    float _580 = fma(_364, _478, _570);
    float _582 = _400 * _440;
    float _584 = -_444;
    float _586 = fma(_366, _584, _574);
    float _588 = -_430;
    float _590 = fma(_366, _588, _578);
    float _592 = fma(_366, _476, _580);
    float _594 = _586 + _586;
    float _596 = -_594;
    float _598 = -_440;
    float _600 = fma(_400, _596, _598);
    float _602 = -_594;
    float _604 = -_442;
    float _606 = fma(_364, _602, _604);
    float _608 = -_594;
    float _610 = -_444;
    float _612 = fma(_366, _608, _610);
    float _614 = abs(_606);
    float _616 = abs(_600);
    float _618 = precise::max(_614, _616);
    float _620 = abs(_612);
    float _622 = precise::max(_620, _618);
    float _624 = 1.0 / _622;
    float _626 = _612 * _624;
    float _628 = _606 * _624;
    float _630 = _612;
    if (_526)
    {
        float2 _2015 = float2(_360, _362);
        float _632 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2015, float2(0.0), isnan(_2015))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2015, float2(0.0), isnan(_2015))).x;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = _600 * _624;
    float _638 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _2036 = float4(_628, _636, _626, float(0));
    float4 _2040 = select(_2036, float4(0.0), isnan(_2036));
    float3 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2040.xyz, uint(rint(_2040.w)), level(_638)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2040.xyz, uint(rint(_2040.w)), level(_638)).xyz;
    float _642 = _640.x;
    float _644 = _640.y;
    float _646 = _640.z;
    float _648 = _556;
    float _650 = _558;
    float _652 = _560;
    if (!_526)
    {
        float2 _2059 = float2(_368, _370);
        float3 _654 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2059, float2(0.0), isnan(_2059))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2059, float2(0.0), isnan(_2059))).xyz;
        float _656 = _654.x;
        float _658 = _654.y;
        float _660 = _654.z;
        _648 = _656;
        _650 = _658;
        _652 = _660;
    }
    float _662 = _648;
    float _664 = _650;
    float _666 = _652;
    float _668 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _670 = precise::max(_592, 9.9999999392252902907785028219223e-09);
    float _672 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _674 = fma(_364, _442, _582);
    float _676 = _668 * _668;
    float _678 = _676 * 0.5;
    float _680 = precise::max(_590, 9.9999999392252902907785028219223e-09);
    float _682 = fma(_672, _672, -1.0);
    float _684 = _670 * _670;
    float _686 = fma(_366, _444, _674);
    float _688 = -_678;
    float _690 = _688 + 1.0;
    float _692 = fma(_684, _682, 1.0);
    float _694 = sqrt(_434);
    float _696 = precise::max(_686, 9.9999999392252902907785028219223e-09);
    float _698 = fma(_680, _690, _678);
    float _700 = 0.0 + _590;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = precise::max(_692, 9.9999999392252902907785028219223e-09);
    float _706 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _708 = 1.0 + _706;
    float _710 = fma(_696, _690, _678);
    float _712 = fma(_696, -5.554729938507080078125, -6.9831600189208984375);
    float _714 = 1.0 / _698;
    float _716 = _702 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _718 = _696 * _712;
    float _720 = 1.0 / _704;
    bool _722 = _694 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _724 = isnan(_694);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _730 = _726 || _728;
    float _732 = 1.0 / _710;
    float _734 = _672 * _720;
    float _736 = _734 * _734;
    float _738 = _714 * _732;
    float _740 = _736 * 0.3183098733425140380859375;
    float _742 = _740 * _738;
    float _744 = _742 * 0.25;
    float _746 = _634;
    float _748 = _710;
    float _750 = _690;
    float _752 = _662;
    float _754 = _666;
    float _756 = _664;
    if (_526)
    {
        float _758 = fma(_634, 2.0, -1.0);
        _746 = _758;
    }
    float _760 = _746;
    if (_526)
    {
        float _762 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[7].z, _474);
        _534 = _762;
    }
    float _764 = _534;
    float _766 = _764;
    if (_526)
    {
        float _768 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[5].z, _470);
        _536 = _768;
    }
    float _770 = _536;
    float _772 = _770;
    if (_526)
    {
        float _774 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[4].z, _468);
        _538 = _774;
    }
    float _776 = _538;
    float _778 = _776;
    if (_526)
    {
        float _780 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[6].z, _472);
        _540 = _780;
    }
    float _782 = _540;
    float _784 = _782;
    if (_526)
    {
        float _786 = _764 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _766 = _786;
    }
    float _788 = _766;
    if (_526)
    {
        float _790 = _770 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _772 = _790;
    }
    float _792 = _772;
    if (_526)
    {
        float _794 = _776 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _748 = _794;
    }
    float _796 = _748;
    float _798 = _796;
    if (_526)
    {
        float _800 = _782 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _784 = _800;
    }
    float _802 = _784;
    float _804 = _788;
    if (_526)
    {
        float _806 = 1.0 / _788;
        _804 = _806;
    }
    float _808 = _804;
    if (_526)
    {
        float _810 = _792 * _808;
        _778 = _810;
    }
    float _812 = _778;
    float _814 = _812;
    if (_526)
    {
        float _816 = _796 * _808;
        _798 = _816;
    }
    float _818 = _798;
    float _820 = exp2(_718);
    float _822 = _818;
    if (_526)
    {
        float _824 = -_408;
        float _826 = _824 + _812;
        _750 = _826;
    }
    float _828 = _750;
    float _830 = _828;
    if (!_526)
    {
        _830 = _510;
    }
    float _832 = _830;
    if (_526)
    {
        float _834 = _802 * _808;
        _542 = _834;
    }
    float _836 = _542;
    float _838 = _836;
    if (_526)
    {
        float _840 = -_410;
        float _842 = _840 + _818;
        _544 = _842;
    }
    float _844 = _544;
    float _846 = _844;
    if (!_526)
    {
        _846 = _514;
    }
    float _848 = _846;
    float _850 = _832 * _832;
    if (_526)
    {
        float _852 = -_412;
        float _854 = _852 + _836;
        _546 = _854;
    }
    float _856 = _546;
    float _858 = _856;
    if (!_526)
    {
        _858 = _518;
    }
    float _860 = _858;
    float _862 = _702 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _864 = fma(_848, _848, _850);
    if (!_526)
    {
        _822 = _504;
    }
    float _866 = _822;
    if (!_526)
    {
        _814 = _502;
    }
    float _868 = _814;
    float _870 = fma(_860, _860, _864);
    float _872 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _874 = 1.0 + _872;
    float _876 = fma(_708, _820, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    if (!_526)
    {
        _838 = _506;
    }
    float _878 = _838;
    float _880 = fma(_874, _820, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _882 = sqrt(_870);
    float _884 = _880 * _744;
    float _886 = _862 * _884;
    float _888 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _890 = _882 + _888;
    float _892 = _890 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _898 = 1.0 + _896;
    float _900 = fma(_898, _820, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _902 = abs(_894);
    float _904 = log2(_902);
    float _906 = _900 * _744;
    float _908 = _716 * _906;
    float _910 = _904 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _912 = _900 * _642;
    float _914 = _880 * _644;
    float _916 = exp2(_910);
    float _918 = fma(_912, (*spvDescriptorSet0.fp_c4)._m0[7].x, _908);
    float _920 = fma(_914, (*spvDescriptorSet0.fp_c4)._m0[7].y, _886);
    if (!_730)
    {
        float _922 = fma(_868, (*spvDescriptorSet0.fp_c4)._m0[3].y, _866);
        float _924 = fma(_868, (*spvDescriptorSet0.fp_c4)._m0[3].y, _878);
        float _926 = _922 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _928 = -_924;
        float _930 = fma(_928, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2510 = float2(_926, _930);
        float4 _933 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2510, float2(0.0), isnan(_2510)), int2(0), component::x).xyzw;
        float _935 = _933.x;
        float _937 = _933.y;
        float _939 = _933.z;
        float _941 = _933.w;
        float _943 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _945 = fma(_694, (*spvDescriptorSet0.fp_c4)._m0[2].x, _943);
        float _947 = precise::clamp(_945, 0.0, 1.0);
        float _949 = -_947;
        float _951 = _949 + 1.0;
        float _953 = -_951;
        float _955 = fma(_953, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _957 = precise::clamp(_955, 0.0, 1.0);
        float _959 = _935 + _937;
        float _961 = _939 + _959;
        float _963 = _941 + _961;
        float _965 = fma(_963, 0.25, 1.0);
        float _967 = _965 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _969 = _965 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _971 = _965 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _973 = _967 * _662;
        float _975 = _969 * _664;
        float _977 = _971 * _666;
        float _979 = -_973;
        float _981 = _979 + _662;
        float _983 = -_975;
        float _985 = _983 + _664;
        float _987 = -_977;
        float _989 = _987 + _666;
        float _991 = fma(_957, _981, _973);
        float _993 = fma(_957, _985, _975);
        float _995 = fma(_957, _989, _977);
        _752 = _991;
        _754 = _995;
        _756 = _993;
    }
    float _997 = _752;
    float _999 = _754;
    float _1001 = _756;
    float _1003 = _702 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1005 = _876 * _744;
    float _1007 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1009 = _997 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1011 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1013 = _999 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1015 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1017 = _1003 * _1005;
    float _1019 = _876 * _646;
    float _1021 = _1001 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1023 = -_1009;
    float _1025 = fma(_716, _1007, _1023);
    float _1027 = -_1013;
    float _1029 = fma(_1003, _1011, _1027);
    float _1031 = fma(_1019, (*spvDescriptorSet0.fp_c4)._m0[7].z, _1017);
    float _1033 = -_1021;
    float _1035 = fma(_862, _1015, _1033);
    float _1037 = fma(_916, _1025, _1009);
    float _1039 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _1041 = _882 + _1039;
    float _1043 = -_900;
    float _1045 = _1043 + 1.0;
    float _1047 = fma(_916, _1029, _1013);
    float _1049 = -_876;
    float _1051 = _1049 + 1.0;
    float _1053 = fma(_916, _1035, _1021);
    float _1055 = -_880;
    float _1057 = _1055 + 1.0;
    float _1059 = _1041 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = fma(_1037, _1045, _918);
    float _1065 = fma(_1047, _1051, _1031);
    float _1067 = fma(_1053, _1057, _920);
    float _1069 = _1061 * 3.0;
    float _1071 = precise::clamp(_1069, 0.0, 1.0);
    float _1073 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1075 = _1063 + _1073;
    float _1077 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1079 = _1065 + _1077;
    float _1081 = abs(_1061);
    float _1083 = log2(_1081);
    float _1085 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1087 = _1067 + _1085;
    float _1089 = fma(_1071, _1075, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1091 = fma(_1071, _1079, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1093 = -_1061;
    float _1095 = _1093 + 1.0;
    float _1097 = fma(_1071, _1087, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1099 = precise::max(_1089, 9.9999999392252902907785028219223e-09);
    float _1101 = precise::max(_1091, 9.9999999392252902907785028219223e-09);
    float _1103 = precise::max(_1097, 9.9999999392252902907785028219223e-09);
    float _1105 = sqrt(_1099);
    float _1107 = _1083 * 0.100000001490116119384765625;
    float _1109 = sqrt(_1103);
    float _1111 = sqrt(_1101);
    float _1113 = fma(_1095, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1105);
    float _1115 = -_1113;
    float _1117 = _1089 + _1115;
    float _1119 = exp2(_1107);
    float _1121 = fma(_1095, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1109);
    float _1123 = -_1121;
    float _1125 = _1097 + _1123;
    float _1127 = fma(_1095, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1111);
    float _1129 = _1061 * 5.0;
    float _1131 = -_1127;
    float _1133 = _1091 + _1131;
    float _1135 = fma(_1119, _1117, _1113);
    float _1137 = fma(_1119, _1125, _1121);
    float _1139 = fma(_1119, _1133, _1127);
    float _1141 = precise::min(_1129, 1.0);
    out.m_51.x = _1135;
    out.m_51.y = _1137;
    out.m_51.z = _1139;
    out.m_51.w = _1141;
    return out;
}

