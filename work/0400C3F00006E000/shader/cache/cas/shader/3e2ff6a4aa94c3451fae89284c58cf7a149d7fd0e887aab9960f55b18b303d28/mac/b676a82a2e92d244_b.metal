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
    float2 _1120 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1120, float2(0.0), isnan(_1120))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1120, float2(0.0), isnan(_1120))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1137 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1137, float2(0.0), isnan(_1137))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1137, float2(0.0), isnan(_1137))).xyz;
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
    float _264 = in.m_44.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_92, _252, _260);
    float _274 = fma(_96, _254, _262);
    float _276 = _270 * _270;
    float _278 = fma(_96, _256, _272);
    float _280 = in.m_44.w;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = fma(_274, _274, _276);
    float _288 = in.m_44.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_278, _278, _286);
    float _296 = rsqrt(_294);
    float _298 = -_106;
    float _300 = fma(_270, _296, _298);
    float _302 = -_108;
    float _304 = fma(_274, _296, _302);
    float _306 = -_110;
    float _308 = fma(_278, _296, _306);
    float _310 = fma(_300, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _312 = fma(_304, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _314 = _70 * _284;
    float _316 = fma(_308, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _318 = _310 * _310;
    float _320 = _70 * _292;
    float _322 = _70 * _268;
    float _324 = fma(_312, _312, _318);
    float _326 = 1.0 / _314;
    float _328 = fma(_316, _316, _324);
    float _330 = rsqrt(_328);
    float _332 = _320 * _326;
    float _334 = _322 * _326;
    float _336 = fma(_332, 0.5, 0.5);
    float _338 = fma(_334, -0.5, 0.5);
    float _340 = _312 * _330;
    float _342 = _316 * _330;
    float _344 = fma(_340, 0.0199999995529651641845703125, _336);
    float _346 = fma(_342, 0.0199999995529651641845703125, _338);
    float2 _1517 = float2(_344, _346);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1517, float2(0.0), isnan(_1517))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1517, float2(0.0), isnan(_1517))).x;
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
    float _372 = _334 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _374 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _376 = _310 * _330;
    float _378 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _374);
    float _380 = _70 * _354;
    float _382 = _70 * _360;
    float _384 = _70 * _366;
    float _386 = -_380;
    float _388 = _386 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _390 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _378);
    float _392 = -_382;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _396 = _388 * _388;
    float _398 = -_384;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _402 = fma(_394, _394, _396);
    float _404 = rsqrt(_390);
    float _406 = fma(_400, _400, _402);
    float _408 = rsqrt(_406);
    float _410 = _404 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _412 = _404 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _414 = _404 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _416 = _388 * _408;
    float _418 = _394 * _408;
    float _420 = _400 * _408;
    float _422 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[6].x, _370);
    float _424 = -_410;
    float _426 = _416 + _424;
    float _428 = -_412;
    float _430 = _418 + _428;
    float _432 = -_414;
    float _434 = _420 + _432;
    float _436 = _426 * _426;
    float _438 = fma(_430, _430, _436);
    float _440 = fma(_434, _434, _438);
    float _442 = _334 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _444 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[4].x, _442);
    float _446 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[5].x, _368);
    float _448 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[7].x, _372);
    float _450 = rsqrt(_440);
    float _452 = _430 * _450;
    float _454 = _426 * _450;
    float _456 = _434 * _450;
    float _458 = fma(_348, 2.0, -1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[7].z, _448);
    float _462 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].z, _446);
    float _464 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _444);
    float _468 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _470 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _422);
    float _472 = _466 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _474 = 1.0 / _464;
    float _476 = _470 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _478 = _468 * _474;
    float _480 = _472 * _474;
    float _482 = _476 * _474;
    float _484 = -_380;
    float _486 = _484 + _478;
    float _488 = -_382;
    float _490 = _488 + _480;
    float _492 = -_384;
    float _494 = _492 + _482;
    float _496 = _416 * _486;
    float _498 = fma(_418, _490, _496);
    float _500 = fma(_420, _494, _498);
    bool _502 = _500 > 0.0;
    float _504 = _500;
    float _506 = _496;
    float _508 = _468;
    float _510 = _448;
    float _512 = _446;
    float _514 = _444;
    float _516 = _380;
    float _518 = _382;
    float _520 = _384;
    if (_502)
    {
        float2 _1797 = float2(_336, _338);
        float3 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1797, float2(0.0), isnan(_1797))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1797, float2(0.0), isnan(_1797))).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        _504 = _524;
        _506 = _526;
        _508 = _528;
    }
    float _530 = _504;
    float _532 = _506;
    float _534 = _508;
    float _536 = _336;
    if (_502)
    {
        float2 _1821 = float2(_336, _338);
        float _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1821, float2(0.0), isnan(_1821))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1821, float2(0.0), isnan(_1821))).x;
        _536 = _538;
    }
    float _540 = _536;
    float _542 = -_416;
    float _544 = _376 * _542;
    float _546 = -_410;
    float _548 = _376 * _546;
    float _550 = _376 * _454;
    float _552 = _376 * _416;
    float _554 = -_418;
    float _556 = fma(_340, _554, _544);
    float _558 = -_412;
    float _560 = fma(_340, _558, _548);
    float _562 = fma(_340, _452, _550);
    float _564 = -_420;
    float _566 = fma(_342, _564, _556);
    float _568 = -_414;
    float _570 = fma(_342, _568, _560);
    float _572 = fma(_342, _456, _562);
    float _574 = _566 + _566;
    float _576 = -_574;
    float _578 = -_416;
    float _580 = fma(_376, _576, _578);
    float _582 = -_574;
    float _584 = -_418;
    float _586 = fma(_340, _582, _584);
    float _588 = -_574;
    float _590 = -_420;
    float _592 = fma(_342, _588, _590);
    float _594 = abs(_586);
    float _596 = abs(_580);
    float _598 = precise::max(_594, _596);
    float _600 = abs(_592);
    float _602 = precise::max(_600, _598);
    float _604 = 1.0 / _602;
    float _606 = _586 * _604;
    float _608 = _580 * _604;
    float _610 = _592 * _604;
    float _612 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1937 = float4(_606, _608, _610, float(0));
    float4 _1941 = select(_1937, float4(0.0), isnan(_1937));
    float3 _614 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1941.xyz, uint(rint(_1941.w)), level(_612)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1941.xyz, uint(rint(_1941.w)), level(_612)).xyz;
    float _616 = _614.x;
    float _618 = _614.y;
    float _620 = _614.z;
    float _622 = _530;
    float _624 = _532;
    float _626 = _534;
    if (!_502)
    {
        float2 _1960 = float2(_344, _346);
        float3 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1960, float2(0.0), isnan(_1960))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1960, float2(0.0), isnan(_1960))).xyz;
        float _630 = _628.x;
        float _632 = _628.y;
        float _634 = _628.z;
        _622 = _630;
        _624 = _632;
        _626 = _634;
    }
    float _636 = _622;
    float _638 = _624;
    float _640 = _626;
    float _642 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _644 = precise::max(_572, 9.9999999392252902907785028219223e-09);
    float _646 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _648 = fma(_340, _418, _552);
    float _650 = _642 * _642;
    float _652 = _650 * 0.5;
    float _654 = precise::max(_570, 9.9999999392252902907785028219223e-09);
    float _656 = fma(_646, _646, -1.0);
    float _658 = _644 * _644;
    float _660 = fma(_342, _420, _648);
    float _662 = -_652;
    float _664 = _662 + 1.0;
    float _666 = fma(_658, _656, 1.0);
    float _668 = 0.0 + _570;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = precise::max(_660, 9.9999999392252902907785028219223e-09);
    float _674 = sqrt(_406);
    float _676 = precise::max(_666, 9.9999999392252902907785028219223e-09);
    float _678 = fma(_654, _664, _652);
    float _680 = fma(_672, _664, _652);
    float _682 = fma(_672, -5.554729938507080078125, -6.9831600189208984375);
    float _684 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _686 = 1.0 + _684;
    float _688 = 1.0 / _676;
    float _690 = _672 * _682;
    float _692 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _694 = 1.0 + _692;
    float _696 = 1.0 / _678;
    bool _698 = _674 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _700 = isnan(_674);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _706 = _702 || _704;
    float _708 = 1.0 / _680;
    float _710 = _646 * _688;
    float _712 = _710 * _710;
    float _714 = exp2(_690);
    float _716 = _712 * 0.3183098733425140380859375;
    float _718 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _720 = _696 * _708;
    float _722 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _724 = 1.0 + _722;
    float _726 = _716 * _720;
    float _728 = _726 * 0.25;
    float _730 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _732 = fma(_724, _714, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _734 = fma(_694, _714, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _736 = fma(_686, _714, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _738 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _740 = _732 * _728;
    float _742 = _734 * _728;
    float _744 = _736 * _728;
    float _746 = _730 * _740;
    float _748 = _738 * _742;
    float _750 = _718 * _744;
    float _752 = _740;
    float _754 = _744;
    float _756 = _636;
    float _758 = _638;
    float _760 = _640;
    if (_502)
    {
        float _762 = fma(_540, 2.0, -1.0);
        _752 = _762;
    }
    float _764 = _752;
    float _766 = _764;
    if (_502)
    {
        float _768 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[7].z, _448);
        _510 = _768;
    }
    float _770 = _510;
    float _772 = _770;
    if (_502)
    {
        float _774 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[5].z, _446);
        _512 = _774;
    }
    float _776 = _512;
    float _778 = _776;
    if (_502)
    {
        float _780 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[4].z, _444);
        _514 = _780;
    }
    float _782 = _514;
    float _784 = _782;
    if (_502)
    {
        float _786 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[6].z, _422);
        _766 = _786;
    }
    float _788 = _766;
    float _790 = _788;
    if (_502)
    {
        float _792 = _770 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _772 = _792;
    }
    float _794 = _772;
    if (_502)
    {
        float _796 = _776 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _778 = _796;
    }
    float _798 = _778;
    float _800 = _798;
    if (_502)
    {
        float _802 = _782 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _784 = _802;
    }
    float _804 = _784;
    float _806 = _742;
    float _808 = _804;
    if (_502)
    {
        float _810 = 1.0 / _794;
        _806 = _810;
    }
    float _812 = _806;
    if (_502)
    {
        float _814 = _798 * _812;
        _754 = _814;
    }
    float _816 = _754;
    float _818 = _816;
    if (_502)
    {
        float _820 = _788 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _800 = _820;
    }
    float _822 = _800;
    if (_502)
    {
        float _824 = _804 * _812;
        _790 = _824;
    }
    float _826 = _790;
    float _828 = _826;
    if (_502)
    {
        float _830 = -_380;
        float _832 = _830 + _816;
        _516 = _832;
    }
    float _834 = _516;
    float _836 = _834;
    if (!_502)
    {
        _836 = _486;
    }
    float _838 = _836;
    if (_502)
    {
        float _840 = _822 * _812;
        _808 = _840;
    }
    float _842 = _808;
    float _844 = _842;
    if (_502)
    {
        float _846 = -_382;
        float _848 = _846 + _826;
        _518 = _848;
    }
    float _850 = _518;
    float _852 = _850;
    if (!_502)
    {
        _852 = _490;
    }
    float _854 = _852;
    float _856 = _838 * _838;
    if (_502)
    {
        float _858 = -_384;
        float _860 = _858 + _842;
        _520 = _860;
    }
    float _862 = _520;
    float _864 = _862;
    if (!_502)
    {
        _864 = _494;
    }
    float _866 = _864;
    float _868 = fma(_854, _854, _856);
    if (!_502)
    {
        _828 = _480;
    }
    float _870 = _828;
    if (!_502)
    {
        _818 = _478;
    }
    float _872 = _818;
    float _874 = fma(_866, _866, _868);
    if (!_502)
    {
        _844 = _482;
    }
    float _876 = _844;
    float _878 = sqrt(_874);
    float _880 = _732 * _616;
    float _882 = fma(_880, (*spvDescriptorSet0.fp_c4)._m0[7].x, _746);
    if (!_706)
    {
        float _884 = fma(_872, (*spvDescriptorSet0.fp_c4)._m0[3].y, _876);
        float _886 = fma(_872, (*spvDescriptorSet0.fp_c4)._m0[3].y, _870);
        float _888 = -_884;
        float _890 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float _892 = _886 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float2 _2390 = float2(_892, _890);
        float4 _895 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2390, float2(0.0), isnan(_2390)), int2(0), component::x).xyzw;
        float _897 = _895.x;
        float _899 = _895.y;
        float _901 = _895.z;
        float _903 = _895.w;
        float _905 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _907 = fma(_674, (*spvDescriptorSet0.fp_c4)._m0[2].x, _905);
        float _909 = precise::clamp(_907, 0.0, 1.0);
        float _911 = -_909;
        float _913 = _911 + 1.0;
        float _915 = -_913;
        float _917 = fma(_915, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _919 = precise::clamp(_917, 0.0, 1.0);
        float _921 = _897 + _899;
        float _923 = _901 + _921;
        float _925 = _903 + _923;
        float _927 = fma(_925, 0.25, 1.0);
        float _929 = _927 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _931 = _927 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _933 = _927 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _935 = _929 * _636;
        float _937 = _931 * _638;
        float _939 = _933 * _640;
        float _941 = -_935;
        float _943 = _941 + _636;
        float _945 = -_937;
        float _947 = _945 + _638;
        float _949 = -_939;
        float _951 = _949 + _640;
        float _953 = fma(_919, _943, _935);
        float _955 = fma(_919, _947, _937);
        float _957 = fma(_919, _951, _939);
        _756 = _953;
        _758 = _955;
        _760 = _957;
    }
    float _959 = _756;
    float _961 = _758;
    float _963 = _760;
    float _965 = -_732;
    float _967 = _965 + 1.0;
    float _969 = _959 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _971 = _734 * _618;
    float _973 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _975 = _878 + _973;
    float _977 = _736 * _620;
    float _979 = fma(_969, _967, _882);
    float _981 = fma(_971, (*spvDescriptorSet0.fp_c4)._m0[7].y, _748);
    float _983 = -_734;
    float _985 = _983 + 1.0;
    float _987 = _975 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _989 = precise::clamp(_987, 0.0, 1.0);
    float _991 = _961 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _993 = fma(_977, (*spvDescriptorSet0.fp_c4)._m0[7].z, _750);
    float _995 = -_736;
    float _997 = _995 + 1.0;
    float _999 = _963 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1001 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1003 = _979 + _1001;
    float _1005 = _989 * 3.0;
    float _1007 = precise::clamp(_1005, 0.0, 1.0);
    float _1009 = fma(_991, _985, _981);
    float _1011 = fma(_999, _997, _993);
    float _1013 = abs(_989);
    float _1015 = log2(_1013);
    float _1017 = fma(_1007, _1003, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1019 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1021 = _1009 + _1019;
    float _1023 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1025 = _1011 + _1023;
    float _1027 = -_989;
    float _1029 = _1027 + 1.0;
    float _1031 = fma(_1007, _1021, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1033 = fma(_1007, _1025, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1035 = precise::max(_1017, 9.9999999392252902907785028219223e-09);
    float _1037 = precise::max(_1031, 9.9999999392252902907785028219223e-09);
    float _1039 = precise::max(_1033, 9.9999999392252902907785028219223e-09);
    float _1041 = sqrt(_1035);
    float _1043 = _1015 * 0.100000001490116119384765625;
    float _1045 = sqrt(_1037);
    float _1047 = sqrt(_1039);
    float _1049 = fma(_1029, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1041);
    float _1051 = -_1049;
    float _1053 = _1017 + _1051;
    float _1055 = exp2(_1043);
    float _1057 = fma(_1029, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1045);
    float _1059 = -_1057;
    float _1061 = _1031 + _1059;
    float _1063 = fma(_1029, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1047);
    float _1065 = _989 * 5.0;
    float _1067 = -_1063;
    float _1069 = _1033 + _1067;
    float _1071 = fma(_1055, _1053, _1049);
    float _1073 = fma(_1055, _1061, _1057);
    float _1075 = fma(_1055, _1069, _1063);
    float _1077 = precise::min(_1065, 1.0);
    out.m_49.x = _1071;
    out.m_49.y = _1073;
    out.m_49.z = _1075;
    out.m_49.w = _1077;
    return out;
}

