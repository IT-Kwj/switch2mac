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
    float _96 = fma(_88, _94, _90);
    float _98 = fma(_88, _94, _86);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1137 = float2(_98, _96);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1137, float2(0.0), isnan(_1137))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1137, float2(0.0), isnan(_1137))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1154 = float2(_102, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1154, float2(0.0), isnan(_1154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1154, float2(0.0), isnan(_1154))).xyz;
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
    float _288 = in.m_46.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_116, _276, _284);
    float _298 = fma(_120, _278, _286);
    float _300 = in.m_46.w;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _294 * _294;
    float _308 = fma(_120, _280, _296);
    float _310 = in.m_46.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_298, _298, _306);
    float _318 = fma(_308, _308, _316);
    float _320 = rsqrt(_318);
    float _322 = _78 * _292;
    float _324 = -_130;
    float _326 = fma(_294, _320, _324);
    float _328 = -_132;
    float _330 = fma(_298, _320, _328);
    float _332 = _78 * _304;
    float _334 = -_134;
    float _336 = fma(_308, _320, _334);
    float _338 = fma(_326, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _340 = fma(_330, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _342 = _78 * _314;
    float _344 = fma(_336, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _346 = _338 * _338;
    float _348 = 1.0 / _332;
    float _350 = fma(_340, _340, _346);
    float _352 = fma(_344, _344, _350);
    float _354 = rsqrt(_352);
    float _356 = _322 * _348;
    float _358 = _342 * _348;
    float _360 = fma(_356, 0.5, 0.5);
    float _362 = fma(_358, -0.5, 0.5);
    float _364 = _340 * _354;
    float _366 = _344 * _354;
    float _368 = fma(_364, 0.0199999995529651641845703125, _360);
    float _370 = fma(_366, 0.0199999995529651641845703125, _362);
    float2 _1533 = float2(_368, _370);
    float _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1533, float2(0.0), isnan(_1533))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1533, float2(0.0), isnan(_1533))).x;
    float _374 = in.m_48.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_48.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_48.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = _358 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _394 = _358 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _396 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _398 = _358 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _400 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[4].x, _392);
    float _402 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[6].x, _394);
    float _404 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _396);
    float _406 = _338 * _354;
    float _408 = _78 * _378;
    float _410 = _78 * _384;
    float _412 = _78 * _390;
    float _414 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _404);
    float _416 = -_408;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _420 = -_410;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _424 = -_412;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _428 = _418 * _418;
    float _430 = rsqrt(_414);
    float _432 = fma(_422, _422, _428);
    float _434 = fma(_426, _426, _432);
    float _436 = rsqrt(_434);
    float _438 = _430 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _440 = _430 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _442 = _430 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _444 = _418 * _436;
    float _446 = _422 * _436;
    float _448 = _426 * _436;
    float _450 = -_438;
    float _452 = _444 + _450;
    float _454 = -_440;
    float _456 = _446 + _454;
    float _458 = -_442;
    float _460 = _448 + _458;
    float _462 = _452 * _452;
    float _464 = fma(_456, _456, _462);
    float _466 = _358 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _468 = fma(_460, _460, _464);
    float _470 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[5].x, _466);
    float _472 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[7].x, _398);
    float _474 = rsqrt(_468);
    float _476 = _452 * _474;
    float _478 = _456 * _474;
    float _480 = _460 * _474;
    float _482 = fma(_372, 2.0, -1.0);
    float _484 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[7].z, _472);
    float _486 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[5].z, _470);
    float _488 = _484 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _490 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[4].z, _400);
    float _492 = _486 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _494 = fma(_482, (*spvDescriptorSet0.fp_c3)._m0[6].z, _402);
    float _496 = _490 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _498 = 1.0 / _488;
    float _500 = _494 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _502 = _492 * _498;
    float _504 = _496 * _498;
    float _506 = _500 * _498;
    float _508 = -_408;
    float _510 = _508 + _502;
    float _512 = -_410;
    float _514 = _512 + _504;
    float _516 = -_412;
    float _518 = _516 + _506;
    float _520 = _444 * _510;
    float _522 = fma(_446, _514, _520);
    float _524 = fma(_448, _518, _522);
    bool _526 = _524 > 0.0;
    float _528 = _520;
    float _530 = _524;
    float _532 = _492;
    float _534 = _472;
    float _536 = _470;
    float _538 = _400;
    float _540 = _402;
    float _542 = _408;
    float _544 = _410;
    float _546 = _412;
    if (_526)
    {
        float2 _1814 = float2(_360, _362);
        float3 _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1814, float2(0.0), isnan(_1814))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1814, float2(0.0), isnan(_1814))).xyz;
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
    float _562 = _362;
    if (_526)
    {
        float2 _1838 = float2(_360, _362);
        float _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1838, float2(0.0), isnan(_1838))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1838, float2(0.0), isnan(_1838))).x;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = -_444;
    float _570 = _406 * _568;
    float _572 = -_438;
    float _574 = _406 * _572;
    float _576 = _406 * _476;
    float _578 = -_446;
    float _580 = fma(_364, _578, _570);
    float _582 = -_440;
    float _584 = fma(_364, _582, _574);
    float _586 = fma(_364, _478, _576);
    float _588 = _406 * _444;
    float _590 = -_448;
    float _592 = fma(_366, _590, _580);
    float _594 = -_442;
    float _596 = fma(_366, _594, _584);
    float _598 = fma(_366, _480, _586);
    float _600 = _592 + _592;
    float _602 = -_600;
    float _604 = -_444;
    float _606 = fma(_406, _602, _604);
    float _608 = -_600;
    float _610 = -_446;
    float _612 = fma(_364, _608, _610);
    float _614 = -_600;
    float _616 = -_448;
    float _618 = fma(_366, _614, _616);
    float _620 = abs(_612);
    float _622 = abs(_606);
    float _624 = precise::max(_620, _622);
    float _626 = abs(_618);
    float _628 = precise::max(_626, _624);
    float _630 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _632 = 1.0 / _628;
    float _634 = _612 * _632;
    float _636 = _618 * _632;
    float _638 = _606 * _632;
    float4 _1954 = float4(_634, _638, _636, float(0));
    float4 _1958 = select(_1954, float4(0.0), isnan(_1954));
    float3 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1958.xyz, uint(rint(_1958.w)), level(_630)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1958.xyz, uint(rint(_1958.w)), level(_630)).xyz;
    float _642 = _640.x;
    float _644 = _640.y;
    float _646 = _640.z;
    float _648 = _556;
    float _650 = _558;
    float _652 = _560;
    if (!_526)
    {
        float2 _1977 = float2(_368, _370);
        float3 _654 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1977, float2(0.0), isnan(_1977))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1977, float2(0.0), isnan(_1977))).xyz;
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
    float _670 = precise::max(_598, 9.9999999392252902907785028219223e-09);
    float _672 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _674 = fma(_364, _446, _588);
    float _676 = _668 * _668;
    float _678 = _676 * 0.5;
    float _680 = precise::max(_596, 9.9999999392252902907785028219223e-09);
    float _682 = fma(_672, _672, -1.0);
    float _684 = _670 * _670;
    float _686 = fma(_366, _448, _674);
    float _688 = -_678;
    float _690 = _688 + 1.0;
    float _692 = fma(_684, _682, 1.0);
    float _694 = sqrt(_434);
    float _696 = precise::max(_686, 9.9999999392252902907785028219223e-09);
    float _698 = fma(_680, _690, _678);
    float _700 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _702 = 1.0 + _700;
    float _704 = precise::max(_692, 9.9999999392252902907785028219223e-09);
    float _706 = 0.0 + _596;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = fma(_696, _690, _678);
    float _712 = fma(_696, -5.554729938507080078125, -6.9831600189208984375);
    float _714 = 1.0 / _698;
    float _716 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _718 = 1.0 + _716;
    float _720 = _696 * _712;
    float _722 = 1.0 / _704;
    bool _724 = _694 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _726 = isnan(_694);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _732 = _728 || _730;
    float _734 = 1.0 / _710;
    float _736 = _672 * _722;
    float _738 = _736 * _736;
    float _740 = _714 * _734;
    float _742 = _738 * 0.3183098733425140380859375;
    float _744 = _742 * _740;
    float _746 = _744 * 0.25;
    float _748 = _566;
    float _750 = _740;
    float _752 = _734;
    float _754 = _710;
    float _756 = _662;
    float _758 = _664;
    float _760 = _666;
    if (_526)
    {
        float _762 = fma(_566, 2.0, -1.0);
        _748 = _762;
    }
    float _764 = _748;
    if (_526)
    {
        float _766 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[7].z, _472);
        _534 = _766;
    }
    float _768 = _534;
    float _770 = _768;
    if (_526)
    {
        float _772 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[5].z, _470);
        _536 = _772;
    }
    float _774 = _536;
    float _776 = _774;
    if (_526)
    {
        float _778 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[4].z, _400);
        _538 = _778;
    }
    float _780 = _538;
    float _782 = _780;
    if (_526)
    {
        float _784 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[6].z, _402);
        _540 = _784;
    }
    float _786 = _540;
    float _788 = _786;
    if (_526)
    {
        float _790 = _768 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _770 = _790;
    }
    float _792 = _770;
    if (_526)
    {
        float _794 = _774 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _776 = _794;
    }
    float _796 = _776;
    if (_526)
    {
        float _798 = _780 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _782 = _798;
    }
    float _800 = _782;
    if (_526)
    {
        float _802 = _786 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _788 = _802;
    }
    float _804 = _788;
    float _806 = _792;
    if (_526)
    {
        float _808 = 1.0 / _792;
        _806 = _808;
    }
    float _810 = _806;
    if (_526)
    {
        float _812 = _796 * _810;
        _750 = _812;
    }
    float _814 = _750;
    float _816 = _814;
    if (_526)
    {
        float _818 = _800 * _810;
        _752 = _818;
    }
    float _820 = _752;
    float _822 = exp2(_720);
    float _824 = _820;
    if (_526)
    {
        float _826 = -_408;
        float _828 = _826 + _814;
        _754 = _828;
    }
    float _830 = _754;
    float _832 = _830;
    if (!_526)
    {
        _832 = _510;
    }
    float _834 = _832;
    if (_526)
    {
        float _836 = _804 * _810;
        _542 = _836;
    }
    float _838 = _542;
    float _840 = _838;
    if (_526)
    {
        float _842 = -_410;
        float _844 = _842 + _820;
        _544 = _844;
    }
    float _846 = _544;
    float _848 = _846;
    if (!_526)
    {
        _848 = _514;
    }
    float _850 = _848;
    float _852 = _834 * _834;
    if (_526)
    {
        float _854 = -_412;
        float _856 = _854 + _838;
        _546 = _856;
    }
    float _858 = _546;
    float _860 = _858;
    if (!_526)
    {
        _860 = _518;
    }
    float _862 = _860;
    float _864 = fma(_850, _850, _852);
    if (!_526)
    {
        _816 = _502;
    }
    float _866 = _816;
    if (!_526)
    {
        _824 = _504;
    }
    float _868 = _824;
    float _870 = fma(_862, _862, _864);
    float _872 = fma(_702, _822, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _874 = _708 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    if (!_526)
    {
        _840 = _506;
    }
    float _876 = _840;
    float _878 = sqrt(_870);
    float _880 = _872 * _746;
    float _882 = _872 * _644;
    float _884 = _708 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _886 = _884 * _880;
    float _888 = fma(_718, _822, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _890 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _892 = _878 + _890;
    float _894 = fma(_882, (*spvDescriptorSet0.fp_c4)._m0[7].y, _886);
    float _896 = _892 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _898 = precise::clamp(_896, 0.0, 1.0);
    float _900 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _902 = 1.0 + _900;
    float _904 = fma(_902, _822, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _906 = abs(_898);
    float _908 = log2(_906);
    float _910 = _904 * _746;
    float _912 = _904 * _642;
    float _914 = _874 * _910;
    float _916 = fma(_912, (*spvDescriptorSet0.fp_c4)._m0[7].x, _914);
    float _918 = _908 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _920 = exp2(_918);
    if (!_732)
    {
        float _922 = fma(_866, (*spvDescriptorSet0.fp_c4)._m0[3].y, _868);
        float _924 = fma(_866, (*spvDescriptorSet0.fp_c4)._m0[3].y, _876);
        float _926 = _922 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _928 = -_924;
        float _930 = fma(_928, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2428 = float2(_926, _930);
        float4 _933 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2428, float2(0.0), isnan(_2428)), int2(0), component::x).xyzw;
        float _935 = _933.x;
        float _937 = _933.y;
        float _939 = _933.z;
        float _941 = _933.w;
        float _943 = _935 + _937;
        float _945 = _939 + _943;
        float _947 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _949 = fma(_694, (*spvDescriptorSet0.fp_c4)._m0[2].x, _947);
        float _951 = precise::clamp(_949, 0.0, 1.0);
        float _953 = _941 + _945;
        float _955 = -_951;
        float _957 = _955 + 1.0;
        float _959 = fma(_953, 0.25, 1.0);
        float _961 = -_957;
        float _963 = fma(_961, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _965 = precise::clamp(_963, 0.0, 1.0);
        float _967 = _959 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _969 = _959 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _971 = _959 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _973 = _967 * _662;
        float _975 = _969 * _664;
        float _977 = _971 * _666;
        float _979 = -_973;
        float _981 = _979 + _662;
        float _983 = -_975;
        float _985 = _983 + _664;
        float _987 = -_977;
        float _989 = _987 + _666;
        float _991 = fma(_965, _981, _973);
        float _993 = fma(_965, _985, _975);
        float _995 = fma(_965, _989, _977);
        _756 = _991;
        _758 = _993;
        _760 = _995;
    }
    float _997 = _756;
    float _999 = _758;
    float _1001 = _760;
    float _1003 = _708 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1005 = _888 * _746;
    float _1007 = _997 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1009 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1011 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1013 = _999 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1015 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1017 = _1001 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1019 = _1003 * _1005;
    float _1021 = _888 * _646;
    float _1023 = -_1013;
    float _1025 = fma(_884, _1011, _1023);
    float _1027 = -_1017;
    float _1029 = fma(_1003, _1015, _1027);
    float _1031 = -_1007;
    float _1033 = fma(_874, _1009, _1031);
    float _1035 = fma(_1021, (*spvDescriptorSet0.fp_c4)._m0[7].z, _1019);
    float _1037 = fma(_920, _1025, _1013);
    float _1039 = fma(_920, _1029, _1017);
    float _1041 = fma(_920, _1033, _1007);
    float _1043 = -_904;
    float _1045 = _1043 + 1.0;
    float _1047 = -_872;
    float _1049 = _1047 + 1.0;
    float _1051 = -_888;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_1041, _1045, _916);
    float _1057 = fma(_1037, _1049, _894);
    float _1059 = fma(_1039, _1053, _1035);
    out.m_51.x = _1055;
    out.m_51.y = _1057;
    out.m_51.z = _1059;
    out.m_51.w = 1.0;
    return out;
}

