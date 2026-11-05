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
    float2 _1160 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1160, float2(0.0), isnan(_1160))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1160, float2(0.0), isnan(_1160))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1177 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1177, float2(0.0), isnan(_1177))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1177, float2(0.0), isnan(_1177))).xyz;
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
    float _264 = in.m_44.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_92, _252, _260);
    float _274 = fma(_96, _254, _262);
    float _276 = _270 * _270;
    float _278 = fma(_96, _256, _272);
    float _280 = in.m_44.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = fma(_274, _274, _276);
    float _288 = in.m_44.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_278, _278, _286);
    float _296 = rsqrt(_294);
    float _298 = _70 * _268;
    float _300 = -_106;
    float _302 = fma(_270, _296, _300);
    float _304 = -_108;
    float _306 = fma(_274, _296, _304);
    float _308 = -_110;
    float _310 = fma(_278, _296, _308);
    float _312 = fma(_302, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _314 = fma(_306, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _316 = fma(_310, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _318 = 1.0 / _298;
    float _320 = _312 * _312;
    float _322 = _70 * _284;
    float _324 = fma(_314, _314, _320);
    float _326 = fma(_316, _316, _324);
    float _328 = _70 * _292;
    float _330 = rsqrt(_326);
    float _332 = _322 * _318;
    float _334 = _328 * _318;
    float _336 = fma(_332, 0.5, 0.5);
    float _338 = fma(_334, -0.5, 0.5);
    float _340 = _314 * _330;
    float _342 = _316 * _330;
    float _344 = fma(_340, 0.0199999995529651641845703125, _336);
    float _346 = fma(_342, 0.0199999995529651641845703125, _338);
    float2 _1557 = float2(_344, _346);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1557, float2(0.0), isnan(_1557))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1557, float2(0.0), isnan(_1557))).x;
    float _350 = in.m_46.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_46.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_46.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _370 = _334 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _372 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _374 = _334 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _376 = _312 * _330;
    float _378 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _372);
    float _380 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _378);
    float _382 = rsqrt(_380);
    float _384 = _70 * _354;
    float _386 = _70 * _360;
    float _388 = _70 * _366;
    float _390 = -_384;
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _394 = -_386;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _398 = -_388;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _402 = _382 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _404 = _392 * _392;
    float _406 = _382 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _408 = fma(_396, _396, _404);
    float _410 = fma(_400, _400, _408);
    float _412 = _382 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _414 = rsqrt(_410);
    float _416 = _392 * _414;
    float _418 = _396 * _414;
    float _420 = _400 * _414;
    float _422 = -_402;
    float _424 = _416 + _422;
    float _426 = -_412;
    float _428 = _418 + _426;
    float _430 = -_406;
    float _432 = _420 + _430;
    float _434 = _424 * _424;
    float _436 = fma(_428, _428, _434);
    float _438 = fma(_432, _432, _436);
    float _440 = _334 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _442 = rsqrt(_438);
    float _444 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[4].x, _440);
    float _446 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[5].x, _368);
    float _448 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[6].x, _370);
    float _450 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[7].x, _374);
    float _452 = _432 * _442;
    float _454 = _428 * _442;
    float _456 = _424 * _442;
    float _458 = fma(_348, 2.0, -1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[7].z, _450);
    float _462 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].z, _446);
    float _464 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _444);
    float _468 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _470 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _448);
    float _472 = 1.0 / _464;
    float _474 = _466 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _476 = _470 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _478 = _468 * _472;
    float _480 = _474 * _472;
    float _482 = _476 * _472;
    float _484 = -_384;
    float _486 = _484 + _478;
    float _488 = -_386;
    float _490 = _488 + _480;
    float _492 = -_388;
    float _494 = _492 + _482;
    float _496 = _416 * _486;
    float _498 = fma(_418, _490, _496);
    float _500 = fma(_420, _494, _498);
    bool _502 = _500 > 0.0;
    float _504 = _500;
    float _506 = _474;
    float _508 = _468;
    float _510 = _450;
    float _512 = _446;
    float _514 = _444;
    float _516 = _448;
    float _518 = _384;
    float _520 = _386;
    float _522 = _388;
    if (_502)
    {
        float2 _1838 = float2(_336, _338);
        float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1838, float2(0.0), isnan(_1838))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1838, float2(0.0), isnan(_1838))).xyz;
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
    float _538 = -_416;
    float _540 = _376 * _538;
    float _542 = -_402;
    float _544 = _376 * _542;
    float _546 = _376 * _456;
    float _548 = -_418;
    float _550 = fma(_340, _548, _540);
    float _552 = -_412;
    float _554 = fma(_340, _552, _544);
    float _556 = fma(_340, _454, _546);
    float _558 = _376 * _416;
    float _560 = -_420;
    float _562 = fma(_342, _560, _550);
    float _564 = -_406;
    float _566 = fma(_342, _564, _554);
    float _568 = fma(_342, _452, _556);
    float _570 = _562 + _562;
    float _572 = -_570;
    float _574 = -_416;
    float _576 = fma(_376, _572, _574);
    float _578 = -_570;
    float _580 = -_418;
    float _582 = fma(_340, _578, _580);
    float _584 = -_570;
    float _586 = -_420;
    float _588 = fma(_342, _584, _586);
    float _590 = abs(_582);
    float _592 = abs(_576);
    float _594 = precise::max(_590, _592);
    float _596 = abs(_588);
    float _598 = precise::max(_596, _594);
    float _600 = 1.0 / _598;
    float _602 = _588 * _600;
    float _604 = _582 * _600;
    float _606 = _588;
    if (_502)
    {
        float2 _1957 = float2(_336, _338);
        float _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1957, float2(0.0), isnan(_1957))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1957, float2(0.0), isnan(_1957))).x;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = _576 * _600;
    float _614 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1978 = float4(_604, _612, _602, float(0));
    float4 _1982 = select(_1978, float4(0.0), isnan(_1978));
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1982.xyz, uint(rint(_1982.w)), level(_614)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1982.xyz, uint(rint(_1982.w)), level(_614)).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = _532;
    float _626 = _534;
    float _628 = _536;
    if (!_502)
    {
        float2 _2001 = float2(_344, _346);
        float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2001, float2(0.0), isnan(_2001))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2001, float2(0.0), isnan(_2001))).xyz;
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
    float _646 = precise::max(_568, 9.9999999392252902907785028219223e-09);
    float _648 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _650 = fma(_340, _418, _558);
    float _652 = _644 * _644;
    float _654 = _652 * 0.5;
    float _656 = precise::max(_566, 9.9999999392252902907785028219223e-09);
    float _658 = fma(_648, _648, -1.0);
    float _660 = _646 * _646;
    float _662 = fma(_342, _420, _650);
    float _664 = -_654;
    float _666 = _664 + 1.0;
    float _668 = fma(_660, _658, 1.0);
    float _670 = sqrt(_410);
    float _672 = precise::max(_662, 9.9999999392252902907785028219223e-09);
    float _674 = fma(_656, _666, _654);
    float _676 = 0.0 + _566;
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = precise::max(_668, 9.9999999392252902907785028219223e-09);
    float _682 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _684 = 1.0 + _682;
    float _686 = fma(_672, _666, _654);
    float _688 = fma(_672, -5.554729938507080078125, -6.9831600189208984375);
    float _690 = 1.0 / _674;
    float _692 = _678 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _694 = _672 * _688;
    float _696 = 1.0 / _680;
    bool _698 = _670 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _700 = isnan(_670);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _706 = _702 || _704;
    float _708 = 1.0 / _686;
    float _710 = _648 * _696;
    float _712 = _710 * _710;
    float _714 = _690 * _708;
    float _716 = _712 * 0.3183098733425140380859375;
    float _718 = _716 * _714;
    float _720 = _718 * 0.25;
    float _722 = _610;
    float _724 = _686;
    float _726 = _666;
    float _728 = _638;
    float _730 = _642;
    float _732 = _640;
    if (_502)
    {
        float _734 = fma(_610, 2.0, -1.0);
        _722 = _734;
    }
    float _736 = _722;
    if (_502)
    {
        float _738 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[7].z, _450);
        _510 = _738;
    }
    float _740 = _510;
    float _742 = _740;
    if (_502)
    {
        float _744 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[5].z, _446);
        _512 = _744;
    }
    float _746 = _512;
    float _748 = _746;
    if (_502)
    {
        float _750 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[4].z, _444);
        _514 = _750;
    }
    float _752 = _514;
    float _754 = _752;
    if (_502)
    {
        float _756 = fma(_736, (*spvDescriptorSet0.fp_c3)._m0[6].z, _448);
        _516 = _756;
    }
    float _758 = _516;
    float _760 = _758;
    if (_502)
    {
        float _762 = _740 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _742 = _762;
    }
    float _764 = _742;
    if (_502)
    {
        float _766 = _746 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _748 = _766;
    }
    float _768 = _748;
    if (_502)
    {
        float _770 = _752 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _724 = _770;
    }
    float _772 = _724;
    float _774 = _772;
    if (_502)
    {
        float _776 = _758 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _760 = _776;
    }
    float _778 = _760;
    float _780 = _764;
    if (_502)
    {
        float _782 = 1.0 / _764;
        _780 = _782;
    }
    float _784 = _780;
    if (_502)
    {
        float _786 = _768 * _784;
        _754 = _786;
    }
    float _788 = _754;
    float _790 = _788;
    if (_502)
    {
        float _792 = _772 * _784;
        _774 = _792;
    }
    float _794 = _774;
    float _796 = exp2(_694);
    float _798 = _794;
    if (_502)
    {
        float _800 = -_384;
        float _802 = _800 + _788;
        _726 = _802;
    }
    float _804 = _726;
    float _806 = _804;
    if (!_502)
    {
        _806 = _486;
    }
    float _808 = _806;
    if (_502)
    {
        float _810 = _778 * _784;
        _518 = _810;
    }
    float _812 = _518;
    float _814 = _812;
    if (_502)
    {
        float _816 = -_386;
        float _818 = _816 + _794;
        _520 = _818;
    }
    float _820 = _520;
    float _822 = _820;
    if (!_502)
    {
        _822 = _490;
    }
    float _824 = _822;
    float _826 = _808 * _808;
    if (_502)
    {
        float _828 = -_388;
        float _830 = _828 + _812;
        _522 = _830;
    }
    float _832 = _522;
    float _834 = _832;
    if (!_502)
    {
        _834 = _494;
    }
    float _836 = _834;
    float _838 = _678 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _840 = fma(_824, _824, _826);
    if (!_502)
    {
        _798 = _480;
    }
    float _842 = _798;
    if (!_502)
    {
        _790 = _478;
    }
    float _844 = _790;
    float _846 = fma(_836, _836, _840);
    float _848 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _850 = 1.0 + _848;
    float _852 = fma(_684, _796, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    if (!_502)
    {
        _814 = _482;
    }
    float _854 = _814;
    float _856 = fma(_850, _796, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _858 = sqrt(_846);
    float _860 = _856 * _720;
    float _862 = _838 * _860;
    float _864 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _866 = _858 + _864;
    float _868 = _866 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _870 = precise::clamp(_868, 0.0, 1.0);
    float _872 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _874 = 1.0 + _872;
    float _876 = fma(_874, _796, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _878 = abs(_870);
    float _880 = log2(_878);
    float _882 = _876 * _720;
    float _884 = _692 * _882;
    float _886 = _880 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _888 = _876 * _618;
    float _890 = _856 * _620;
    float _892 = exp2(_886);
    float _894 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[7].x, _884);
    float _896 = fma(_890, (*spvDescriptorSet0.fp_c4)._m0[7].y, _862);
    if (!_706)
    {
        float _898 = fma(_844, (*spvDescriptorSet0.fp_c4)._m0[3].y, _842);
        float _900 = fma(_844, (*spvDescriptorSet0.fp_c4)._m0[3].y, _854);
        float _902 = _898 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _904 = -_900;
        float _906 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2452 = float2(_902, _906);
        float4 _909 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2452, float2(0.0), isnan(_2452)), int2(0), component::x).xyzw;
        float _911 = _909.x;
        float _913 = _909.y;
        float _915 = _909.z;
        float _917 = _909.w;
        float _919 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _921 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[2].x, _919);
        float _923 = precise::clamp(_921, 0.0, 1.0);
        float _925 = -_923;
        float _927 = _925 + 1.0;
        float _929 = -_927;
        float _931 = fma(_929, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _933 = precise::clamp(_931, 0.0, 1.0);
        float _935 = _911 + _913;
        float _937 = _915 + _935;
        float _939 = _917 + _937;
        float _941 = fma(_939, 0.25, 1.0);
        float _943 = _941 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _945 = _941 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _947 = _941 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _949 = _943 * _638;
        float _951 = _945 * _640;
        float _953 = _947 * _642;
        float _955 = -_949;
        float _957 = _955 + _638;
        float _959 = -_951;
        float _961 = _959 + _640;
        float _963 = -_953;
        float _965 = _963 + _642;
        float _967 = fma(_933, _957, _949);
        float _969 = fma(_933, _961, _951);
        float _971 = fma(_933, _965, _953);
        _728 = _967;
        _730 = _971;
        _732 = _969;
    }
    float _973 = _728;
    float _975 = _730;
    float _977 = _732;
    float _979 = _678 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _981 = _852 * _720;
    float _983 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _985 = _973 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _987 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _989 = _975 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _991 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _993 = _979 * _981;
    float _995 = _852 * _622;
    float _997 = _977 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _999 = -_985;
    float _1001 = fma(_692, _983, _999);
    float _1003 = -_989;
    float _1005 = fma(_979, _987, _1003);
    float _1007 = fma(_995, (*spvDescriptorSet0.fp_c4)._m0[7].z, _993);
    float _1009 = -_997;
    float _1011 = fma(_838, _991, _1009);
    float _1013 = fma(_892, _1001, _985);
    float _1015 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _1017 = _858 + _1015;
    float _1019 = -_876;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_892, _1005, _989);
    float _1025 = -_852;
    float _1027 = _1025 + 1.0;
    float _1029 = fma(_892, _1011, _997);
    float _1031 = -_856;
    float _1033 = _1031 + 1.0;
    float _1035 = _1017 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1037 = precise::clamp(_1035, 0.0, 1.0);
    float _1039 = fma(_1013, _1021, _894);
    float _1041 = fma(_1023, _1027, _1007);
    float _1043 = fma(_1029, _1033, _896);
    float _1045 = _1037 * 3.0;
    float _1047 = precise::clamp(_1045, 0.0, 1.0);
    float _1049 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1051 = _1039 + _1049;
    float _1053 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1055 = _1041 + _1053;
    float _1057 = abs(_1037);
    float _1059 = log2(_1057);
    float _1061 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1063 = _1043 + _1061;
    float _1065 = fma(_1047, _1051, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1067 = fma(_1047, _1055, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1069 = -_1037;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_1047, _1063, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1075 = precise::max(_1065, 9.9999999392252902907785028219223e-09);
    float _1077 = precise::max(_1067, 9.9999999392252902907785028219223e-09);
    float _1079 = precise::max(_1073, 9.9999999392252902907785028219223e-09);
    float _1081 = sqrt(_1075);
    float _1083 = _1059 * 0.100000001490116119384765625;
    float _1085 = sqrt(_1079);
    float _1087 = sqrt(_1077);
    float _1089 = fma(_1071, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1081);
    float _1091 = -_1089;
    float _1093 = _1065 + _1091;
    float _1095 = exp2(_1083);
    float _1097 = fma(_1071, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1085);
    float _1099 = -_1097;
    float _1101 = _1073 + _1099;
    float _1103 = fma(_1071, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1087);
    float _1105 = _1037 * 5.0;
    float _1107 = -_1103;
    float _1109 = _1067 + _1107;
    float _1111 = fma(_1095, _1093, _1089);
    float _1113 = fma(_1095, _1101, _1097);
    float _1115 = fma(_1095, _1109, _1103);
    float _1117 = precise::min(_1105, 1.0);
    out.m_49.x = _1111;
    out.m_49.y = _1113;
    out.m_49.z = _1115;
    out.m_49.w = _1117;
    return out;
}

