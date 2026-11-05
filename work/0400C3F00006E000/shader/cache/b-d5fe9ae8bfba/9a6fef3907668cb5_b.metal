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
    float2 _989 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_989, float2(0.0), isnan(_989))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_989, float2(0.0), isnan(_989))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1006 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1006, float2(0.0), isnan(_1006))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1006, float2(0.0), isnan(_1006))).xyz;
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
    float _130 = _88;
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
        _170 = _238;
        _190 = 0.0;
        _210 = _240;
    }
    float _246 = _184;
    float _248 = _200;
    float _250 = _158;
    float _252 = _170;
    float _254 = _190;
    float _256 = _210;
    float _258 = fma(_92, _246, _150);
    float _260 = fma(_92, _248, _148);
    float _262 = _110 * _94;
    float _264 = in.m_42.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_96, _252, _260);
    float _274 = fma(_92, _254, _262);
    float _276 = in.m_42.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _270 * _270;
    float _284 = in.m_44.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_96, _256, _274);
    float _292 = in.m_44.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_272, _272, _282);
    float _300 = in.m_44.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_290, _290, _298);
    float _308 = rsqrt(_306);
    float _310 = _70 * _268;
    float _312 = -_106;
    float _314 = fma(_270, _308, _312);
    float _316 = -_108;
    float _318 = fma(_272, _308, _316);
    float _320 = -_110;
    float _322 = fma(_290, _308, _320);
    float _324 = _70 * _280;
    float _326 = fma(_314, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _328 = fma(_318, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _330 = _310 * _310;
    float _332 = fma(_322, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _334 = _326 * _326;
    float _336 = _70 * _288;
    float _338 = fma(_324, _324, _330);
    float _340 = fma(_328, _328, _334);
    float _342 = 1.0 / _336;
    float _344 = _70 * _296;
    float _346 = fma(_332, _332, _340);
    float _348 = sqrt(_338);
    float _350 = _70 * _304;
    float _352 = rsqrt(_346);
    float _354 = _344 * _342;
    float _356 = _350 * _342;
    float _358 = fma(_354, 0.5, 0.5);
    float _360 = fma(_356, -0.5, 0.5);
    float _362 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _364 = fma(_348, (*spvDescriptorSet0.fp_c4)._m0[1].x, _362);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _328 * _352;
    float _370 = _332 * _352;
    float _372 = -_368;
    float _374 = fma(_366, _372, _368);
    float _376 = -_370;
    float _378 = fma(_366, _376, _370);
    float _380 = fma(_374, 0.0199999995529651641845703125, _358);
    float _382 = fma(_378, 0.0199999995529651641845703125, _360);
    float2 _1438 = float2(_380, _382);
    float _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1438, float2(0.0), isnan(_1438))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1438, float2(0.0), isnan(_1438))).x;
    float _386 = in.m_42.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = -_324;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _396 = -_310;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _400 = _356 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _402 = _356 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _404 = _356 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _406 = _356 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _408 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[4].x, _400);
    float _410 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _402);
    float _412 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[6].x, _404);
    float _414 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[7].x, _406);
    float _416 = _70 * _390;
    float _418 = -_416;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _422 = _420 * _420;
    float _424 = fma(_394, _394, _422);
    float _426 = fma(_398, _398, _424);
    float _428 = rsqrt(_426);
    float _430 = _394 * _428;
    float _432 = _420 * _428;
    float _434 = _398 * _428;
    float _436 = fma(_384, 2.0, -1.0);
    float _438 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[7].z, _414);
    float _440 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[5].z, _410);
    float _442 = _438 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _444 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[4].z, _408);
    float _446 = _440 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _448 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[6].z, _412);
    float _450 = _444 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _452 = 1.0 / _442;
    float _454 = _448 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _456 = -_416;
    float _458 = fma(_446, _452, _456);
    float _460 = -_324;
    float _462 = fma(_450, _452, _460);
    float _464 = -_310;
    float _466 = fma(_454, _452, _464);
    float _468 = _432 * _458;
    float _470 = fma(_430, _462, _468);
    float _472 = fma(_434, _466, _470);
    bool _474 = _472 > 0.0;
    float _476 = _472;
    float _478 = _452;
    float _480 = _328;
    float _482 = 1.0;
    float _484 = _414;
    float _486 = _410;
    float _488 = _408;
    float _490 = _416;
    float _492 = _324;
    float _494 = _310;
    if (_474)
    {
        float2 _1621 = float2(_358, _360);
        float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1621, float2(0.0), isnan(_1621))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1621, float2(0.0), isnan(_1621))).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        _476 = _498;
        _478 = _500;
        _480 = _502;
    }
    float _504 = _476;
    float _506 = _478;
    float _508 = _480;
    float _510 = _360;
    if (_474)
    {
        float2 _1645 = float2(_358, _360);
        float _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1645, float2(0.0), isnan(_1645))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1645, float2(0.0), isnan(_1645))).x;
        _510 = _512;
    }
    float _514 = _510;
    float _516 = _326 * _352;
    float _518 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _520 = -_516;
    float _522 = _520 + 1.0;
    float _524 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _518);
    float _526 = fma(_366, _522, _516);
    float _528 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _524);
    float _530 = -_432;
    float _532 = _526 * _530;
    float _534 = -_430;
    float _536 = fma(_374, _534, _532);
    float _538 = rsqrt(_528);
    float _540 = _538 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _542 = _538 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _544 = _538 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _546 = -_540;
    float _548 = _432 + _546;
    float _550 = -_542;
    float _552 = _430 + _550;
    float _554 = -_544;
    float _556 = _434 + _554;
    float _558 = _548 * _548;
    float _560 = fma(_552, _552, _558);
    float _562 = fma(_556, _556, _560);
    float _564 = rsqrt(_562);
    float _566 = _548 * _564;
    float _568 = -_434;
    float _570 = fma(_378, _568, _536);
    float _572 = -_540;
    float _574 = _526 * _572;
    float _576 = _552 * _564;
    float _578 = _556 * _564;
    float _580 = _570 + _570;
    float _582 = -_542;
    float _584 = fma(_374, _582, _574);
    float _586 = _526 * _566;
    float _588 = -_580;
    float _590 = -_432;
    float _592 = fma(_526, _588, _590);
    float _594 = -_580;
    float _596 = -_430;
    float _598 = fma(_374, _594, _596);
    float _600 = -_580;
    float _602 = -_434;
    float _604 = fma(_378, _600, _602);
    float _606 = fma(_374, _576, _586);
    float _608 = abs(_598);
    float _610 = abs(_592);
    float _612 = precise::max(_608, _610);
    float _614 = abs(_604);
    float _616 = precise::max(_614, _612);
    float _618 = 1.0 / _616;
    float _620 = _598 * _618;
    float _622 = _592 * _618;
    float _624 = _604 * _618;
    float _626 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1827 = float4(_620, _622, _624, float(0));
    float4 _1831 = select(_1827, float4(0.0), isnan(_1827));
    float3 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1831.xyz, uint(rint(_1831.w)), level(_626)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1831.xyz, uint(rint(_1831.w)), level(_626)).xyz;
    float _630 = _628.x;
    float _632 = _628.y;
    float _634 = _628.z;
    float _636 = _504;
    float _638 = _506;
    float _640 = _508;
    if (!_474)
    {
        float2 _1850 = float2(_380, _382);
        float3 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1850, float2(0.0), isnan(_1850))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1850, float2(0.0), isnan(_1850))).xyz;
        float _644 = _642.x;
        float _646 = _642.y;
        float _648 = _642.z;
        _636 = _644;
        _638 = _646;
        _640 = _648;
    }
    float _650 = _636;
    float _652 = _638;
    float _654 = _640;
    float _656 = fma(_378, _578, _606);
    float _658 = -_544;
    float _660 = fma(_378, _658, _584);
    float _662 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _664 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _666 = precise::max(_656, 9.9999999392252902907785028219223e-09);
    float _668 = _526 * _432;
    float _670 = _662 * _662;
    float _672 = _670 * 0.5;
    float _674 = precise::max(_660, 9.9999999392252902907785028219223e-09);
    float _676 = 0.0 + _660;
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = fma(_374, _430, _668);
    float _682 = -_672;
    float _684 = _682 + 1.0;
    float _686 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _688 = 1.0 + _686;
    float _690 = fma(_378, _434, _680);
    float _692 = fma(_674, _684, _672);
    float _694 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _696 = 1.0 + _694;
    float _698 = fma(_664, _664, -1.0);
    float _700 = _666 * _666;
    float _702 = precise::max(_690, 9.9999999392252902907785028219223e-09);
    float _704 = fma(_700, _698, 1.0);
    float _706 = fma(_702, _684, _672);
    float _708 = fma(_702, -5.554729938507080078125, -6.9831600189208984375);
    float _710 = 1.0 / _692;
    float _712 = precise::max(_704, 9.9999999392252902907785028219223e-09);
    float _714 = _702 * _708;
    float _716 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _718 = 1.0 + _716;
    float _720 = 1.0 / _712;
    float _722 = 1.0 / _706;
    float _724 = exp2(_714);
    float _726 = _664 * _720;
    float _728 = _726 * _726;
    float _730 = _710 * _722;
    float _732 = _728 * 0.3183098733425140380859375;
    float _734 = fma(_688, _724, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _736 = fma(_718, _724, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _738 = fma(_696, _724, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _740 = _732 * _730;
    float _742 = _740 * 0.25;
    float _744 = in.m_46.x;
    float _746 = gl_FragCoord.w;
    float _748 = _744 * _746;
    float _750 = _70 * _748;
    float _752 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _754 = fma(_750, (*spvDescriptorSet0.fp_c4)._m0[1].z, _752);
    if (_474)
    {
        float _756 = fma(_514, 2.0, -1.0);
        _482 = _756;
    }
    float _758 = _482;
    float _760 = _758;
    if (_474)
    {
        float _762 = fma(_758, (*spvDescriptorSet0.fp_c3)._m0[7].z, _414);
        _484 = _762;
    }
    float _764 = _484;
    float _766 = _764;
    if (_474)
    {
        float _768 = fma(_758, (*spvDescriptorSet0.fp_c3)._m0[5].z, _410);
        _486 = _768;
    }
    float _770 = _486;
    float _772 = _770;
    if (_474)
    {
        float _774 = fma(_758, (*spvDescriptorSet0.fp_c3)._m0[4].z, _408);
        _488 = _774;
    }
    float _776 = _488;
    float _778 = _776;
    if (_474)
    {
        float _780 = fma(_758, (*spvDescriptorSet0.fp_c3)._m0[6].z, _412);
        _760 = _780;
    }
    float _782 = _760;
    float _784 = _782;
    if (_474)
    {
        float _786 = _764 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _766 = _786;
    }
    float _788 = _766;
    if (_474)
    {
        float _790 = _770 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _772 = _790;
    }
    float _792 = _772;
    if (_474)
    {
        float _794 = _776 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _778 = _794;
    }
    float _796 = _778;
    if (_474)
    {
        float _798 = _782 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _784 = _798;
    }
    float _800 = _784;
    float _802 = _788;
    if (_474)
    {
        float _804 = 1.0 / _788;
        _802 = _804;
    }
    float _806 = _802;
    if (_474)
    {
        float _808 = -_416;
        float _810 = fma(_792, _806, _808);
        _490 = _810;
    }
    float _812 = _490;
    float _814 = _812;
    if (!_474)
    {
        _814 = _458;
    }
    float _816 = _814;
    if (_474)
    {
        float _818 = -_324;
        float _820 = fma(_796, _806, _818);
        _492 = _820;
    }
    float _822 = _492;
    float _824 = _822;
    if (!_474)
    {
        _824 = _462;
    }
    float _826 = _824;
    if (_474)
    {
        float _828 = -_310;
        float _830 = fma(_800, _806, _828);
        _494 = _830;
    }
    float _832 = _494;
    float _834 = _832;
    if (!_474)
    {
        _834 = _466;
    }
    float _836 = _834;
    float _838 = _816 * _816;
    float _840 = _736 * _742;
    float _842 = _678 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _844 = fma(_826, _826, _838);
    float _846 = _678 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _848 = fma(_836, _836, _844);
    float _850 = _734 * _742;
    float _852 = _738 * _742;
    float _854 = _842 * _850;
    float _856 = sqrt(_848);
    float _858 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _860 = _856 + _858;
    float _862 = _860 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _864 = precise::clamp(_862, 0.0, 1.0);
    float _866 = _678 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _868 = _866 * _840;
    float _870 = abs(_864);
    float _872 = log2(_870);
    float _874 = _872 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _876 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _878 = exp2(_874);
    float _880 = _734 * _630;
    float _882 = _736 * _632;
    float _884 = _650 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _886 = _654 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _888 = fma(_880, (*spvDescriptorSet0.fp_c4)._m0[7].x, _854);
    float _890 = fma(_882, (*spvDescriptorSet0.fp_c4)._m0[7].y, _868);
    float _892 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _894 = _652 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _896 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _898 = _846 * _852;
    float _900 = _738 * _634;
    float _902 = -_884;
    float _904 = fma(_842, _892, _902);
    float _906 = -_894;
    float _908 = fma(_866, _876, _906);
    float _910 = -_886;
    float _912 = fma(_846, _896, _910);
    float _914 = fma(_900, (*spvDescriptorSet0.fp_c4)._m0[7].z, _898);
    float _916 = fma(_878, _904, _884);
    float _918 = fma(_878, _908, _894);
    float _920 = fma(_878, _912, _886);
    float _922 = -_734;
    float _924 = _922 + 1.0;
    float _926 = precise::max(0.0, _754);
    float _928 = -_736;
    float _930 = _928 + 1.0;
    float _932 = -_738;
    float _934 = _932 + 1.0;
    float _936 = fma(_916, _924, _888);
    float _938 = fma(_918, _930, _890);
    float _940 = fma(_920, _934, _914);
    float _942 = -_926;
    float _944 = _942 + 1.0;
    float _946 = precise::clamp(_944, 0.0, 1.0);
    out.m_49.x = _936;
    out.m_49.y = _938;
    out.m_49.z = _940;
    out.m_49.w = _946;
    return out;
}

