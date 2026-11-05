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
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_40.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float _76 = _72 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _78 = _74 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _839 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_839, float2(0.0), isnan(_839))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _856 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_856, float2(0.0), isnan(_856))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_856, float2(0.0), isnan(_856))).xyz;
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
    float _142 = _108 * _94;
    float _144 = _106 * _94;
    float _146 = 0.0;
    if (!_128)
    {
        _146 = 0.0;
    }
    float _148 = _146;
    float _150 = _112;
    float _152 = _148;
    if (!_128)
    {
        float _154 = rsqrt(_140);
        _150 = _154;
    }
    float _156 = _150;
    float _158 = _156;
    if (!_128)
    {
        float _160 = _110 * _156;
        _132 = _160;
    }
    float _162 = _132;
    float _164 = _162;
    if (!_128)
    {
        float _166 = _106 * _156;
        _134 = _166;
    }
    float _168 = _134;
    float _170 = 0.0;
    float _172 = _168;
    if (!_128)
    {
        float _174 = _110 * _162;
        _170 = _174;
    }
    float _176 = _170;
    float _178 = _176;
    if (!_128)
    {
        float _180 = fma(_108, _168, -0.0);
        _158 = _180;
    }
    float _182 = _158;
    float _184 = _182;
    if (!_128)
    {
        float _186 = -_168;
        float _188 = (-0.0) + _186;
        _136 = _188;
    }
    float _190 = _136;
    float _192 = _190;
    if (!_128)
    {
        float _194 = -_168;
        float _196 = -_176;
        float _198 = fma(_106, _194, _196);
        _178 = _198;
    }
    float _200 = _178;
    float _202 = _200;
    if (!_128)
    {
        float _204 = _108 * _162;
        _172 = _204;
    }
    float _206 = _172;
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
        float _238 = _230 * _236;
        float _240 = _224 * _236;
        float _242 = -_220;
        float _244 = fma(_242, _236, -0.0);
        _184 = _218;
        _202 = _214;
        _164 = _244;
        _210 = 0.0;
        _152 = _240;
        _192 = _238;
    }
    float _246 = _184;
    float _248 = _202;
    float _250 = _164;
    float _252 = _210;
    float _254 = _152;
    float _256 = _192;
    float _258 = fma(_92, _246, _144);
    float _260 = _110 * _94;
    float _262 = fma(_92, _248, _142);
    float _264 = in.m_42.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_92, _252, _260);
    float _274 = fma(_96, _254, _262);
    float _276 = in.m_42.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _270 * _270;
    float _284 = fma(_96, _256, _272);
    float _286 = in.m_44.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_44.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_274, _274, _282);
    float _300 = in.m_44.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_284, _284, _298);
    float _308 = rsqrt(_306);
    float _310 = _70 * _268;
    float _312 = -_106;
    float _314 = fma(_270, _308, _312);
    float _316 = -_108;
    float _318 = fma(_274, _308, _316);
    float _320 = -_110;
    float _322 = fma(_284, _308, _320);
    float _324 = _70 * _280;
    float _326 = fma(_314, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _328 = fma(_318, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _330 = _310 * _310;
    float _332 = fma(_322, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _334 = _326 * _326;
    float _336 = _70 * _290;
    float _338 = fma(_324, _324, _330);
    float _340 = fma(_328, _328, _334);
    float _342 = 1.0 / _336;
    float _344 = _70 * _296;
    float _346 = fma(_332, _332, _340);
    float _348 = _70 * _304;
    float _350 = sqrt(_338);
    float _352 = rsqrt(_346);
    float _354 = _344 * _342;
    float _356 = _348 * _342;
    float _358 = fma(_356, -0.5, 0.5);
    float _360 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _362 = fma(_350, (*spvDescriptorSet0.fp_c4)._m0[1].x, _360);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _328 * _352;
    float _368 = _332 * _352;
    float _370 = fma(_354, 0.5, 0.5);
    float _372 = -_366;
    float _374 = fma(_364, _372, _366);
    float _376 = -_368;
    float _378 = fma(_364, _376, _368);
    float _380 = fma(_374, 0.0199999995529651641845703125, _370);
    float _382 = fma(_378, 0.0199999995529651641845703125, _358);
    float2 _1287 = float2(_380, _382);
    float _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1287, float2(0.0), isnan(_1287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1287, float2(0.0), isnan(_1287))).x;
    float _386 = in.m_42.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = -_324;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _396 = _356 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _398 = -_310;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _402 = _356 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _404 = _356 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _406 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[7].x, _396);
    float _408 = _356 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _410 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _402);
    float _412 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[4].x, _404);
    float _414 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[6].x, _408);
    float _416 = _70 * _390;
    float _418 = -_416;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _422 = _420 * _420;
    float _424 = fma(_394, _394, _422);
    float _426 = fma(_400, _400, _424);
    float _428 = rsqrt(_426);
    float _430 = _420 * _428;
    float _432 = _394 * _428;
    float _434 = _400 * _428;
    float _436 = fma(_384, 2.0, -1.0);
    float _438 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[7].z, _406);
    float _440 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[5].z, _410);
    float _442 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[4].z, _412);
    float _444 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[6].z, _414);
    float _446 = _438 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _448 = _440 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _450 = _442 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _452 = 1.0 / _446;
    float _454 = -_416;
    float _456 = fma(_448, _452, _454);
    float _458 = -_324;
    float _460 = fma(_450, _452, _458);
    float _462 = _444 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _464 = _430 * _456;
    float _466 = -_310;
    float _468 = fma(_462, _452, _466);
    float _470 = fma(_432, _460, _464);
    float _472 = fma(_434, _468, _470);
    bool _474 = _472 > 0.0;
    float _476 = _370;
    float _478 = _460;
    float _480 = _470;
    if (_474)
    {
        float2 _1464 = float2(_370, _358);
        float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1464, float2(0.0), isnan(_1464))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1464, float2(0.0), isnan(_1464))).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        _476 = _484;
        _478 = _486;
        _480 = _488;
    }
    float _490 = _476;
    float _492 = _478;
    float _494 = _480;
    float _496 = _326 * _352;
    float _498 = -_496;
    float _500 = _498 + 1.0;
    float _502 = fma(_364, _500, _496);
    float _504 = -_430;
    float _506 = _502 * _504;
    float _508 = -_432;
    float _510 = fma(_374, _508, _506);
    float _512 = -_434;
    float _514 = fma(_378, _512, _510);
    float _516 = _514 + _514;
    float _518 = -_516;
    float _520 = -_430;
    float _522 = fma(_502, _518, _520);
    float _524 = -_516;
    float _526 = -_432;
    float _528 = fma(_374, _524, _526);
    float _530 = -_516;
    float _532 = -_434;
    float _534 = fma(_378, _530, _532);
    float _536 = abs(_528);
    float _538 = abs(_522);
    float _540 = precise::max(_536, _538);
    float _542 = abs(_534);
    float _544 = precise::max(_542, _540);
    float _546 = 1.0 / _544;
    float _548 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _550 = _534 * _546;
    float _552 = _528 * _546;
    float _554 = _522 * _546;
    float4 _1570 = float4(_552, _554, _550, float(0));
    float4 _1574 = select(_1570, float4(0.0), isnan(_1570));
    float3 _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1574.xyz, uint(rint(_1574.w)), level(_548)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1574.xyz, uint(rint(_1574.w)), level(_548)).xyz;
    float _558 = _556.x;
    float _560 = _556.y;
    float _562 = _556.z;
    float _564 = _490;
    float _566 = _492;
    float _568 = _494;
    if (!_474)
    {
        float2 _1593 = float2(_380, _382);
        float3 _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1593, float2(0.0), isnan(_1593))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1593, float2(0.0), isnan(_1593))).xyz;
        float _572 = _570.x;
        float _574 = _570.y;
        float _576 = _570.z;
        _564 = _572;
        _566 = _574;
        _568 = _576;
    }
    float _578 = _564;
    float _580 = _566;
    float _582 = _568;
    float _584 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _586 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _588 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _590 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _588);
    float _592 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _590);
    float _594 = rsqrt(_592);
    float _596 = _594 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _598 = _594 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _600 = -_596;
    float _602 = _430 + _600;
    float _604 = _594 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _606 = -_598;
    float _608 = _432 + _606;
    float _610 = -_596;
    float _612 = _502 * _610;
    float _614 = _602 * _602;
    float _616 = -_604;
    float _618 = _434 + _616;
    float _620 = -_598;
    float _622 = fma(_374, _620, _612);
    float _624 = fma(_608, _608, _614);
    float _626 = in.m_46.x;
    float _628 = gl_FragCoord.w;
    float _630 = _626 * _628;
    float _632 = -_604;
    float _634 = fma(_378, _632, _622);
    float _636 = fma(_618, _618, _624);
    float _638 = rsqrt(_636);
    float _640 = _602 * _638;
    float _642 = _608 * _638;
    float _644 = _618 * _638;
    float _646 = fma(_586, _586, -1.0);
    float _648 = _502 * _640;
    float _650 = _502 * _430;
    float _652 = fma(_374, _642, _648);
    float _654 = fma(_374, _432, _650);
    float _656 = fma(_378, _644, _652);
    float _658 = _584 * _584;
    float _660 = _658 * 0.5;
    float _662 = precise::max(_634, 9.9999999392252902907785028219223e-09);
    float _664 = fma(_378, _434, _654);
    float _666 = 0.0 + _634;
    float _668 = precise::clamp(_666, 0.0, 1.0);
    float _670 = precise::max(_656, 9.9999999392252902907785028219223e-09);
    float _672 = -_660;
    float _674 = _672 + 1.0;
    float _676 = precise::max(_664, 9.9999999392252902907785028219223e-09);
    float _678 = _670 * _670;
    float _680 = fma(_662, _674, _660);
    float _682 = fma(_676, _674, _660);
    float _684 = fma(_678, _646, 1.0);
    float _686 = _70 * _630;
    float _688 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _690 = 1.0 + _688;
    float _692 = fma(_676, -5.554729938507080078125, -6.9831600189208984375);
    float _694 = 1.0 / _680;
    float _696 = precise::max(_684, 9.9999999392252902907785028219223e-09);
    float _698 = _676 * _692;
    float _700 = 1.0 / _696;
    float _702 = 1.0 / _682;
    float _704 = exp2(_698);
    float _706 = _586 * _700;
    float _708 = _706 * _706;
    float _710 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _712 = 1.0 + _710;
    float _714 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _716 = 1.0 + _714;
    float _718 = _694 * _702;
    float _720 = _708 * 0.3183098733425140380859375;
    float _722 = _720 * _718;
    float _724 = _722 * 0.25;
    float _726 = fma(_716, _704, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _728 = fma(_690, _704, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _730 = fma(_712, _704, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _732 = _668 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _734 = _668 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _736 = _668 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _738 = _726 * _724;
    float _740 = _728 * _724;
    float _742 = _730 * _724;
    float _744 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _746 = fma(_686, (*spvDescriptorSet0.fp_c4)._m0[1].z, _744);
    float _748 = _736 * _738;
    float _750 = _732 * _740;
    float _752 = _734 * _742;
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = _726 * _562;
    float _760 = _728 * _558;
    float _762 = _730 * _560;
    float _764 = _578 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _766 = fma(_758, (*spvDescriptorSet0.fp_c4)._m0[7].z, _748);
    float _768 = fma(_760, (*spvDescriptorSet0.fp_c4)._m0[7].x, _750);
    float _770 = fma(_762, (*spvDescriptorSet0.fp_c4)._m0[7].y, _752);
    float _772 = precise::max(0.0, _746);
    float _774 = -_730;
    float _776 = _774 + 1.0;
    float _778 = -_726;
    float _780 = _778 + 1.0;
    float _782 = _580 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _784 = _582 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _786 = fma(_764, _756, _768);
    float _788 = -_772;
    float _790 = _788 + 1.0;
    float _792 = precise::clamp(_790, 0.0, 1.0);
    float _794 = fma(_782, _776, _770);
    float _796 = fma(_784, _780, _766);
    out.m_49.x = _786;
    out.m_49.y = _794;
    out.m_49.z = _796;
    out.m_49.w = _792;
    return out;
}

