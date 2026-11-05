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
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_42.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float _76 = _72 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _78 = _74 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1078 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1078, float2(0.0), isnan(_1078))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1078, float2(0.0), isnan(_1078))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1095 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1095, float2(0.0), isnan(_1095))).xyz;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _86 * _86;
    float _100 = fma(_84, _84, _98);
    float _102 = fma(_88, _88, _100);
    float _104 = rsqrt(_102);
    float _106 = _86 * _104;
    float _108 = _84 * _104;
    float _110 = _88 * _104;
    float _112 = _106 * _106;
    float _114 = fma(_108, _108, _112);
    float _116 = sqrt(_114);
    bool _120 = _116 >= 0.00999999977648258209228515625;
    bool _122 = isnan(_116);
    bool _124 = _120 || _122;
    bool _126 = isnan(0.00999999977648258209228515625);
    bool _128 = _124 || _126;
    float _130 = 0.0;
    float _132 = _86;
    float _134 = _104;
    float _136 = _116;
    if (!_128)
    {
        float _138 = fma(_110, _110, _112);
        _130 = _138;
    }
    float _140 = _130;
    float _142 = _112;
    if (!_128)
    {
        float _144 = rsqrt(_140);
        _142 = _144;
    }
    float _146 = _142;
    float _148 = _108 * _94;
    float _150 = _106 * _94;
    float _152 = _146;
    if (!_128)
    {
        float _154 = _110 * _146;
        _132 = _154;
    }
    float _156 = _132;
    float _158 = _156;
    if (!_128)
    {
        float _160 = _106 * _146;
        _134 = _160;
    }
    float _162 = _134;
    float _164 = _162;
    if (!_128)
    {
        _152 = 0.0;
    }
    float _166 = _152;
    float _168 = 0.0;
    float _170 = _166;
    if (!_128)
    {
        float _172 = _110 * _156;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = 0.0;
    float _178 = _174;
    if (!_128)
    {
        float _180 = fma(_108, _162, -0.0);
        _176 = _180;
    }
    float _182 = _176;
    float _184 = _182;
    if (!_128)
    {
        float _186 = _108 * _156;
        _136 = _186;
    }
    float _188 = _136;
    float _190 = _188;
    if (!_128)
    {
        float _192 = -_162;
        float _194 = -_174;
        float _196 = fma(_106, _192, _194);
        _178 = _196;
    }
    float _198 = _178;
    float _200 = _198;
    if (!_128)
    {
        float _202 = -_162;
        float _204 = (-0.0) + _202;
        _164 = _204;
    }
    float _206 = _164;
    bool _208 = !_128;
    float _210 = _206;
    if (!_208)
    {
        float _212 = rsqrt(_114);
        float _214 = _106 * _212;
        float _216 = -_212;
        float _218 = _108 * _216;
        float _220 = _110 * _214;
        float _222 = _108 * _218;
        float _224 = _110 * _218;
        float _226 = _220 * _220;
        float _228 = -_222;
        float _230 = fma(_106, _214, _228);
        float _232 = fma(_224, _224, _226);
        float _234 = fma(_230, _230, _232);
        float _236 = rsqrt(_234);
        float _238 = _224 * _236;
        float _240 = _230 * _236;
        float _242 = -_220;
        float _244 = fma(_242, _236, -0.0);
        _184 = _218;
        _200 = _214;
        _158 = _244;
        _190 = 0.0;
        _170 = _238;
        _210 = _240;
    }
    float _246 = _184;
    float _248 = _200;
    float _250 = _158;
    float _252 = _190;
    float _254 = _170;
    float _256 = _210;
    float _258 = fma(_92, _246, _150);
    float _260 = _110 * _94;
    float _262 = fma(_92, _248, _148);
    float _264 = in.m_44.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_92, _252, _260);
    float _274 = fma(_96, _254, _262);
    float _276 = in.m_44.w;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _270 * _270;
    float _284 = fma(_96, _256, _272);
    float _286 = in.m_44.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_274, _274, _282);
    float _294 = fma(_284, _284, _292);
    float _296 = rsqrt(_294);
    float _298 = _70 * _268;
    float _300 = -_106;
    float _302 = fma(_270, _296, _300);
    float _304 = -_108;
    float _306 = fma(_274, _296, _304);
    float _308 = _70 * _280;
    float _310 = -_110;
    float _312 = fma(_284, _296, _310);
    float _314 = fma(_302, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _316 = fma(_306, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _318 = _70 * _290;
    float _320 = fma(_312, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _322 = _314 * _314;
    float _324 = 1.0 / _308;
    float _326 = fma(_316, _316, _322);
    float _328 = fma(_320, _320, _326);
    float _330 = rsqrt(_328);
    float _332 = _298 * _324;
    float _334 = _318 * _324;
    float _336 = fma(_332, 0.5, 0.5);
    float _338 = fma(_334, -0.5, 0.5);
    float _340 = _316 * _330;
    float _342 = _320 * _330;
    float _344 = fma(_340, 0.0199999995529651641845703125, _336);
    float _346 = fma(_342, 0.0199999995529651641845703125, _338);
    float2 _1475 = float2(_344, _346);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1475, float2(0.0), isnan(_1475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1475, float2(0.0), isnan(_1475))).x;
    float _350 = in.m_46.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_46.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_46.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _334 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _370 = _334 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _372 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _374 = _334 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _376 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[4].x, _368);
    float _378 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[6].x, _370);
    float _380 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _372);
    float _382 = _314 * _330;
    float _384 = _70 * _354;
    float _386 = _70 * _360;
    float _388 = _70 * _366;
    float _390 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _380);
    float _392 = -_384;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _396 = -_386;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _400 = -_388;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _404 = _394 * _394;
    float _406 = rsqrt(_390);
    float _408 = fma(_398, _398, _404);
    float _410 = fma(_402, _402, _408);
    float _412 = rsqrt(_410);
    float _414 = _406 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _416 = _406 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _418 = _406 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _420 = _394 * _412;
    float _422 = _398 * _412;
    float _424 = _402 * _412;
    float _426 = -_414;
    float _428 = _420 + _426;
    float _430 = -_416;
    float _432 = _422 + _430;
    float _434 = -_418;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _444 = fma(_436, _436, _440);
    float _446 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[5].x, _442);
    float _448 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[7].x, _374);
    float _450 = rsqrt(_444);
    float _452 = _428 * _450;
    float _454 = _432 * _450;
    float _456 = _436 * _450;
    float _458 = fma(_348, 2.0, -1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[7].z, _448);
    float _462 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].z, _446);
    float _464 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _376);
    float _468 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _470 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _378);
    float _472 = _466 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _474 = 1.0 / _464;
    float _476 = _470 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _478 = _468 * _474;
    float _480 = _472 * _474;
    float _482 = _476 * _474;
    float _484 = -_384;
    float _486 = _484 + _478;
    float _488 = -_386;
    float _490 = _488 + _480;
    float _492 = -_388;
    float _494 = _492 + _482;
    float _496 = _420 * _486;
    float _498 = fma(_422, _490, _496);
    float _500 = fma(_424, _494, _498);
    bool _502 = _500 > 0.0;
    float _504 = _496;
    float _506 = _500;
    float _508 = _468;
    float _510 = _448;
    float _512 = _446;
    float _514 = _376;
    float _516 = _378;
    float _518 = _384;
    float _520 = _386;
    float _522 = _388;
    if (_502)
    {
        float2 _1756 = float2(_336, _338);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1756, float2(0.0), isnan(_1756))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1756, float2(0.0), isnan(_1756))).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        _504 = _526;
        _506 = _528;
        _508 = _530;
    }
    float _532 = _504;
    float _534 = _506;
    float _536 = _508;
    float _538 = _338;
    if (_502)
    {
        float2 _1780 = float2(_336, _338);
        float _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1780, float2(0.0), isnan(_1780))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1780, float2(0.0), isnan(_1780))).x;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = -_420;
    float _546 = _382 * _544;
    float _548 = -_414;
    float _550 = _382 * _548;
    float _552 = _382 * _452;
    float _554 = -_422;
    float _556 = fma(_340, _554, _546);
    float _558 = -_416;
    float _560 = fma(_340, _558, _550);
    float _562 = fma(_340, _454, _552);
    float _564 = _382 * _420;
    float _566 = -_424;
    float _568 = fma(_342, _566, _556);
    float _570 = -_418;
    float _572 = fma(_342, _570, _560);
    float _574 = fma(_342, _456, _562);
    float _576 = _568 + _568;
    float _578 = -_576;
    float _580 = -_420;
    float _582 = fma(_382, _578, _580);
    float _584 = -_576;
    float _586 = -_422;
    float _588 = fma(_340, _584, _586);
    float _590 = -_576;
    float _592 = -_424;
    float _594 = fma(_342, _590, _592);
    float _596 = abs(_588);
    float _598 = abs(_582);
    float _600 = precise::max(_596, _598);
    float _602 = abs(_594);
    float _604 = precise::max(_602, _600);
    float _606 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _608 = 1.0 / _604;
    float _610 = _588 * _608;
    float _612 = _594 * _608;
    float _614 = _582 * _608;
    float4 _1896 = float4(_610, _614, _612, float(0));
    float4 _1900 = select(_1896, float4(0.0), isnan(_1896));
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1900.xyz, uint(rint(_1900.w)), level(_606)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1900.xyz, uint(rint(_1900.w)), level(_606)).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = _532;
    float _626 = _534;
    float _628 = _536;
    if (!_502)
    {
        float2 _1919 = float2(_344, _346);
        float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1919, float2(0.0), isnan(_1919))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1919, float2(0.0), isnan(_1919))).xyz;
        float _632 = _630.x;
        float _634 = _630.y;
        float _636 = _630.z;
        _624 = _632;
        _626 = _634;
        _628 = _636;
    }
    float _638 = _624;
    float _640 = _626;
    float _642 = _628;
    float _644 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _646 = precise::max(_574, 9.9999999392252902907785028219223e-09);
    float _648 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _650 = fma(_340, _422, _564);
    float _652 = _644 * _644;
    float _654 = _652 * 0.5;
    float _656 = precise::max(_572, 9.9999999392252902907785028219223e-09);
    float _658 = fma(_648, _648, -1.0);
    float _660 = _646 * _646;
    float _662 = fma(_342, _424, _650);
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = fma(_660, _658, 1.0);
    float _670 = sqrt(_410);
    float _672 = precise::max(_662, 9.9999999392252902907785028219223e-09);
    float _674 = fma(_656, _666, _654);
    float _676 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _678 = 1.0 + _676;
    float _680 = precise::max(_668, 9.9999999392252902907785028219223e-09);
    float _682 = 0.0 + _572;
    float _684 = precise::clamp(_682, 0.0, 1.0);
    float _686 = fma(_672, _666, _654);
    float _688 = fma(_672, -5.554729938507080078125, -6.9831600189208984375);
    float _690 = 1.0 / _674;
    float _692 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _694 = 1.0 + _692;
    float _696 = _672 * _688;
    float _698 = 1.0 / _680;
    bool _700 = _670 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _702 = isnan(_670);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _708 = _704 || _706;
    float _710 = 1.0 / _686;
    float _712 = _648 * _698;
    float _714 = _712 * _712;
    float _716 = _690 * _710;
    float _718 = _714 * 0.3183098733425140380859375;
    float _720 = _718 * _716;
    float _722 = _720 * 0.25;
    float _724 = _542;
    float _726 = _716;
    float _728 = _710;
    float _730 = _686;
    float _732 = _638;
    float _734 = _640;
    float _736 = _642;
    if (_502)
    {
        float _738 = fma(_542, 2.0, -1.0);
        _724 = _738;
    }
    float _740 = _724;
    if (_502)
    {
        float _742 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[7].z, _448);
        _510 = _742;
    }
    float _744 = _510;
    float _746 = _744;
    if (_502)
    {
        float _748 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[5].z, _446);
        _512 = _748;
    }
    float _750 = _512;
    float _752 = _750;
    if (_502)
    {
        float _754 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[4].z, _376);
        _514 = _754;
    }
    float _756 = _514;
    float _758 = _756;
    if (_502)
    {
        float _760 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[6].z, _378);
        _516 = _760;
    }
    float _762 = _516;
    float _764 = _762;
    if (_502)
    {
        float _766 = _744 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _746 = _766;
    }
    float _768 = _746;
    if (_502)
    {
        float _770 = _750 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _752 = _770;
    }
    float _772 = _752;
    if (_502)
    {
        float _774 = _756 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _758 = _774;
    }
    float _776 = _758;
    if (_502)
    {
        float _778 = _762 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _764 = _778;
    }
    float _780 = _764;
    float _782 = _768;
    if (_502)
    {
        float _784 = 1.0 / _768;
        _782 = _784;
    }
    float _786 = _782;
    if (_502)
    {
        float _788 = _772 * _786;
        _726 = _788;
    }
    float _790 = _726;
    float _792 = _790;
    if (_502)
    {
        float _794 = _776 * _786;
        _728 = _794;
    }
    float _796 = _728;
    float _798 = exp2(_696);
    float _800 = _796;
    if (_502)
    {
        float _802 = -_384;
        float _804 = _802 + _790;
        _730 = _804;
    }
    float _806 = _730;
    float _808 = _806;
    if (!_502)
    {
        _808 = _486;
    }
    float _810 = _808;
    if (_502)
    {
        float _812 = _780 * _786;
        _518 = _812;
    }
    float _814 = _518;
    float _816 = _814;
    if (_502)
    {
        float _818 = -_386;
        float _820 = _818 + _796;
        _520 = _820;
    }
    float _822 = _520;
    float _824 = _822;
    if (!_502)
    {
        _824 = _490;
    }
    float _826 = _824;
    float _828 = _810 * _810;
    if (_502)
    {
        float _830 = -_388;
        float _832 = _830 + _814;
        _522 = _832;
    }
    float _834 = _522;
    float _836 = _834;
    if (!_502)
    {
        _836 = _494;
    }
    float _838 = _836;
    float _840 = fma(_826, _826, _828);
    if (!_502)
    {
        _792 = _478;
    }
    float _842 = _792;
    if (!_502)
    {
        _800 = _480;
    }
    float _844 = _800;
    float _846 = fma(_838, _838, _840);
    float _848 = fma(_678, _798, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _850 = _684 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    if (!_502)
    {
        _816 = _482;
    }
    float _852 = _816;
    float _854 = sqrt(_846);
    float _856 = _848 * _722;
    float _858 = _848 * _620;
    float _860 = _684 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _862 = _860 * _856;
    float _864 = fma(_694, _798, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _866 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _868 = _854 + _866;
    float _870 = fma(_858, (*spvDescriptorSet0.fp_c4)._m0[7].y, _862);
    float _872 = _868 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _874 = precise::clamp(_872, 0.0, 1.0);
    float _876 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _878 = 1.0 + _876;
    float _880 = fma(_878, _798, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _882 = abs(_874);
    float _884 = log2(_882);
    float _886 = _880 * _722;
    float _888 = _880 * _618;
    float _890 = _850 * _886;
    float _892 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[7].x, _890);
    float _894 = _884 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _896 = exp2(_894);
    if (!_708)
    {
        float _898 = fma(_842, (*spvDescriptorSet0.fp_c4)._m0[3].y, _844);
        float _900 = fma(_842, (*spvDescriptorSet0.fp_c4)._m0[3].y, _852);
        float _902 = _898 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _904 = -_900;
        float _906 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2370 = float2(_902, _906);
        float4 _909 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2370, float2(0.0), isnan(_2370)), int2(0), component::x).xyzw;
        float _911 = _909.x;
        float _913 = _909.y;
        float _915 = _909.z;
        float _917 = _909.w;
        float _919 = _911 + _913;
        float _921 = _915 + _919;
        float _923 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _925 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[2].x, _923);
        float _927 = precise::clamp(_925, 0.0, 1.0);
        float _929 = _917 + _921;
        float _931 = -_927;
        float _933 = _931 + 1.0;
        float _935 = fma(_929, 0.25, 1.0);
        float _937 = -_933;
        float _939 = fma(_937, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _941 = precise::clamp(_939, 0.0, 1.0);
        float _943 = _935 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _945 = _935 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _947 = _935 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _949 = _943 * _638;
        float _951 = _945 * _640;
        float _953 = _947 * _642;
        float _955 = -_949;
        float _957 = _955 + _638;
        float _959 = -_951;
        float _961 = _959 + _640;
        float _963 = -_953;
        float _965 = _963 + _642;
        float _967 = fma(_941, _957, _949);
        float _969 = fma(_941, _961, _951);
        float _971 = fma(_941, _965, _953);
        _732 = _967;
        _734 = _969;
        _736 = _971;
    }
    float _973 = _732;
    float _975 = _734;
    float _977 = _736;
    float _979 = _684 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _981 = _864 * _722;
    float _983 = _973 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _985 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _987 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _989 = _975 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _991 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _993 = _977 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _995 = _979 * _981;
    float _997 = _864 * _622;
    float _999 = -_989;
    float _1001 = fma(_860, _987, _999);
    float _1003 = -_993;
    float _1005 = fma(_979, _991, _1003);
    float _1007 = -_983;
    float _1009 = fma(_850, _985, _1007);
    float _1011 = fma(_997, (*spvDescriptorSet0.fp_c4)._m0[7].z, _995);
    float _1013 = fma(_896, _1001, _989);
    float _1015 = fma(_896, _1005, _993);
    float _1017 = fma(_896, _1009, _983);
    float _1019 = -_880;
    float _1021 = _1019 + 1.0;
    float _1023 = -_848;
    float _1025 = _1023 + 1.0;
    float _1027 = -_864;
    float _1029 = _1027 + 1.0;
    float _1031 = fma(_1017, _1021, _892);
    float _1033 = fma(_1013, _1025, _870);
    float _1035 = fma(_1015, _1029, _1011);
    out.m_49.x = _1031;
    out.m_49.y = _1033;
    out.m_49.z = _1035;
    out.m_49.w = 1.0;
    return out;
}

