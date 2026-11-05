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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
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
    float2 _1146 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1146, float2(0.0), isnan(_1146))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1146, float2(0.0), isnan(_1146))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1163 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1163, float2(0.0), isnan(_1163))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1163, float2(0.0), isnan(_1163))).xyz;
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
    float _264 = in.m_44.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_96, _252, _260);
    float _274 = fma(_92, _254, _262);
    float _276 = in.m_44.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _270 * _270;
    float _284 = in.m_46.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_96, _256, _274);
    float _292 = in.m_46.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_272, _272, _282);
    float _300 = in.m_46.y;
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
    float _342 = _70 * _296;
    float _344 = _70 * _304;
    float _346 = 1.0 / _336;
    float _348 = fma(_332, _332, _340);
    float _350 = sqrt(_338);
    float _352 = rsqrt(_348);
    float _354 = _342 * _346;
    float _356 = _344 * _346;
    float _358 = fma(_354, 0.5, 0.5);
    float _360 = fma(_356, -0.5, 0.5);
    float _362 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _364 = fma(_350, (*spvDescriptorSet0.fp_c4)._m0[1].x, _362);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _328 * _352;
    float _370 = _332 * _352;
    float _372 = -_368;
    float _374 = fma(_366, _372, _368);
    float _376 = -_370;
    float _378 = fma(_366, _376, _370);
    float _380 = fma(_374, 0.0199999995529651641845703125, _358);
    float _382 = fma(_378, 0.0199999995529651641845703125, _360);
    float2 _1595 = float2(_380, _382);
    float _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1595, float2(0.0), isnan(_1595))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1595, float2(0.0), isnan(_1595))).x;
    float _386 = in.m_44.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = -_324;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _396 = -_310;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _400 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _402 = _356 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _404 = _356 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _406 = _356 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _408 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _400);
    float _410 = _326 * _352;
    float _412 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _408);
    float _414 = rsqrt(_412);
    float _416 = _70 * _390;
    float _418 = -_416;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _422 = _414 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _424 = _414 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _426 = _420 * _420;
    float _428 = fma(_394, _394, _426);
    float _430 = _414 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _432 = fma(_398, _398, _428);
    float _434 = rsqrt(_432);
    float _436 = _420 * _434;
    float _438 = _394 * _434;
    float _440 = _398 * _434;
    float _442 = -_430;
    float _444 = _436 + _442;
    float _446 = -_422;
    float _448 = _438 + _446;
    float _450 = -_424;
    float _452 = _440 + _450;
    float _454 = _444 * _444;
    float _456 = fma(_448, _448, _454);
    float _458 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[6].x, _404);
    float _460 = fma(_452, _452, _456);
    float _462 = _356 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _464 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[4].x, _462);
    float _466 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _402);
    float _468 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[7].x, _406);
    float _470 = -_410;
    float _472 = _470 + 1.0;
    float _474 = rsqrt(_460);
    float _476 = fma(_366, _472, _410);
    float _478 = _448 * _474;
    float _480 = _444 * _474;
    float _482 = _452 * _474;
    float _484 = fma(_384, 2.0, -1.0);
    float _486 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[7].z, _468);
    float _488 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[5].z, _466);
    float _490 = _486 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _492 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[4].z, _464);
    float _494 = _488 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _496 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[6].z, _458);
    float _498 = _492 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _500 = 1.0 / _490;
    float _502 = _496 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _504 = _494 * _500;
    float _506 = _498 * _500;
    float _508 = _502 * _500;
    float _510 = -_416;
    float _512 = _510 + _504;
    float _514 = -_324;
    float _516 = _514 + _506;
    float _518 = -_310;
    float _520 = _518 + _508;
    float _522 = _436 * _512;
    float _524 = fma(_438, _516, _522);
    float _526 = fma(_440, _520, _524);
    bool _528 = _526 > 0.0;
    float _530 = _526;
    float _532 = _522;
    float _534 = _494;
    float _536 = _468;
    float _538 = _466;
    float _540 = _464;
    float _542 = _416;
    float _544 = _324;
    float _546 = _310;
    if (_528)
    {
        float2 _1863 = float2(_358, _360);
        float3 _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1863, float2(0.0), isnan(_1863))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1863, float2(0.0), isnan(_1863))).xyz;
        float _550 = _548.x;
        float _552 = _548.y;
        float _554 = _548.z;
        _530 = _550;
        _532 = _552;
        _534 = _554;
    }
    float _556 = _530;
    float _558 = _532;
    float _560 = _534;
    float _562 = _358;
    if (_528)
    {
        float2 _1887 = float2(_358, _360);
        float _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1887, float2(0.0), isnan(_1887))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1887, float2(0.0), isnan(_1887))).x;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = -_436;
    float _570 = _476 * _568;
    float _572 = -_430;
    float _574 = _476 * _572;
    float _576 = _476 * _480;
    float _578 = -_438;
    float _580 = fma(_374, _578, _570);
    float _582 = -_422;
    float _584 = fma(_374, _582, _574);
    float _586 = fma(_374, _478, _576);
    float _588 = _476 * _436;
    float _590 = -_440;
    float _592 = fma(_378, _590, _580);
    float _594 = -_424;
    float _596 = fma(_378, _594, _584);
    float _598 = fma(_378, _482, _586);
    float _600 = _592 + _592;
    float _602 = -_600;
    float _604 = -_436;
    float _606 = fma(_476, _602, _604);
    float _608 = -_600;
    float _610 = -_438;
    float _612 = fma(_374, _608, _610);
    float _614 = -_600;
    float _616 = -_440;
    float _618 = fma(_378, _614, _616);
    float _620 = abs(_612);
    float _622 = abs(_606);
    float _624 = precise::max(_620, _622);
    float _626 = abs(_618);
    float _628 = precise::max(_626, _624);
    float _630 = 1.0 / _628;
    float _632 = _612 * _630;
    float _634 = _606 * _630;
    float _636 = _618 * _630;
    float _638 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _2003 = float4(_632, _634, _636, float(0));
    float4 _2007 = select(_2003, float4(0.0), isnan(_2003));
    float3 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2007.xyz, uint(rint(_2007.w)), level(_638)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2007.xyz, uint(rint(_2007.w)), level(_638)).xyz;
    float _642 = _640.x;
    float _644 = _640.y;
    float _646 = _640.z;
    float _648 = _556;
    float _650 = _558;
    float _652 = _560;
    if (!_528)
    {
        float2 _2026 = float2(_380, _382);
        float3 _654 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2026, float2(0.0), isnan(_2026))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2026, float2(0.0), isnan(_2026))).xyz;
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
    float _674 = fma(_374, _438, _588);
    float _676 = _668 * _668;
    float _678 = _676 * 0.5;
    float _680 = precise::max(_596, 9.9999999392252902907785028219223e-09);
    float _682 = fma(_672, _672, -1.0);
    float _684 = _670 * _670;
    float _686 = fma(_378, _440, _674);
    float _688 = -_678;
    float _690 = _688 + 1.0;
    float _692 = fma(_684, _682, 1.0);
    float _694 = 0.0 + _596;
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = precise::max(_686, 9.9999999392252902907785028219223e-09);
    float _700 = sqrt(_432);
    float _702 = precise::max(_692, 9.9999999392252902907785028219223e-09);
    float _704 = fma(_680, _690, _678);
    float _706 = fma(_698, _690, _678);
    float _708 = fma(_698, -5.554729938507080078125, -6.9831600189208984375);
    float _710 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _712 = 1.0 + _710;
    float _714 = 1.0 / _702;
    float _716 = _698 * _708;
    float _718 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _720 = 1.0 + _718;
    float _722 = 1.0 / _704;
    bool _724 = _700 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _726 = isnan(_700);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _732 = _728 || _730;
    float _734 = 1.0 / _706;
    float _736 = _672 * _714;
    float _738 = _736 * _736;
    float _740 = exp2(_716);
    float _742 = _738 * 0.3183098733425140380859375;
    float _744 = _696 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _746 = _722 * _734;
    float _748 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _750 = 1.0 + _748;
    float _752 = _742 * _746;
    float _754 = _752 * 0.25;
    float _756 = _696 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _758 = fma(_750, _740, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _760 = fma(_720, _740, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _762 = fma(_712, _740, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _764 = _696 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _766 = _758 * _754;
    float _768 = _760 * _754;
    float _770 = _762 * _754;
    float _772 = _756 * _766;
    float _774 = _764 * _768;
    float _776 = _744 * _770;
    float _778 = _766;
    float _780 = _770;
    float _782 = _662;
    float _784 = _664;
    float _786 = _666;
    if (_528)
    {
        float _788 = fma(_566, 2.0, -1.0);
        _778 = _788;
    }
    float _790 = _778;
    float _792 = _790;
    if (_528)
    {
        float _794 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[7].z, _468);
        _536 = _794;
    }
    float _796 = _536;
    float _798 = _796;
    if (_528)
    {
        float _800 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[5].z, _466);
        _538 = _800;
    }
    float _802 = _538;
    float _804 = _802;
    if (_528)
    {
        float _806 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[4].z, _464);
        _540 = _806;
    }
    float _808 = _540;
    float _810 = _808;
    if (_528)
    {
        float _812 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[6].z, _458);
        _792 = _812;
    }
    float _814 = _792;
    float _816 = _814;
    if (_528)
    {
        float _818 = _796 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _798 = _818;
    }
    float _820 = _798;
    if (_528)
    {
        float _822 = _802 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _804 = _822;
    }
    float _824 = _804;
    float _826 = _824;
    if (_528)
    {
        float _828 = _808 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _810 = _828;
    }
    float _830 = _810;
    float _832 = _768;
    float _834 = _830;
    if (_528)
    {
        float _836 = 1.0 / _820;
        _832 = _836;
    }
    float _838 = _832;
    if (_528)
    {
        float _840 = _824 * _838;
        _780 = _840;
    }
    float _842 = _780;
    float _844 = _842;
    if (_528)
    {
        float _846 = _814 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _826 = _846;
    }
    float _848 = _826;
    if (_528)
    {
        float _850 = _830 * _838;
        _816 = _850;
    }
    float _852 = _816;
    float _854 = _852;
    if (_528)
    {
        float _856 = -_416;
        float _858 = _856 + _842;
        _542 = _858;
    }
    float _860 = _542;
    float _862 = _860;
    if (!_528)
    {
        _862 = _512;
    }
    float _864 = _862;
    if (_528)
    {
        float _866 = _848 * _838;
        _834 = _866;
    }
    float _868 = _834;
    float _870 = _868;
    if (_528)
    {
        float _872 = -_324;
        float _874 = _872 + _852;
        _544 = _874;
    }
    float _876 = _544;
    float _878 = _876;
    if (!_528)
    {
        _878 = _516;
    }
    float _880 = _878;
    float _882 = _864 * _864;
    if (_528)
    {
        float _884 = -_310;
        float _886 = _884 + _868;
        _546 = _886;
    }
    float _888 = _546;
    float _890 = _888;
    if (!_528)
    {
        _890 = _520;
    }
    float _892 = _890;
    float _894 = fma(_880, _880, _882);
    if (!_528)
    {
        _854 = _506;
    }
    float _896 = _854;
    if (!_528)
    {
        _844 = _504;
    }
    float _898 = _844;
    float _900 = fma(_892, _892, _894);
    if (!_528)
    {
        _870 = _508;
    }
    float _902 = _870;
    float _904 = sqrt(_900);
    float _906 = _758 * _642;
    float _908 = fma(_906, (*spvDescriptorSet0.fp_c4)._m0[7].x, _772);
    if (!_732)
    {
        float _910 = fma(_898, (*spvDescriptorSet0.fp_c4)._m0[3].y, _902);
        float _912 = fma(_898, (*spvDescriptorSet0.fp_c4)._m0[3].y, _896);
        float _914 = -_910;
        float _916 = fma(_914, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float _918 = _912 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float2 _2456 = float2(_918, _916);
        float4 _921 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2456, float2(0.0), isnan(_2456)), int2(0), component::x).xyzw;
        float _923 = _921.x;
        float _925 = _921.y;
        float _927 = _921.z;
        float _929 = _921.w;
        float _931 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _933 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[2].x, _931);
        float _935 = precise::clamp(_933, 0.0, 1.0);
        float _937 = -_935;
        float _939 = _937 + 1.0;
        float _941 = -_939;
        float _943 = fma(_941, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _945 = precise::clamp(_943, 0.0, 1.0);
        float _947 = _923 + _925;
        float _949 = _927 + _947;
        float _951 = _929 + _949;
        float _953 = fma(_951, 0.25, 1.0);
        float _955 = _953 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _957 = _953 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _959 = _953 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _961 = _955 * _662;
        float _963 = _957 * _664;
        float _965 = _959 * _666;
        float _967 = -_961;
        float _969 = _967 + _662;
        float _971 = -_963;
        float _973 = _971 + _664;
        float _975 = -_965;
        float _977 = _975 + _666;
        float _979 = fma(_945, _969, _961);
        float _981 = fma(_945, _973, _963);
        float _983 = fma(_945, _977, _965);
        _782 = _979;
        _784 = _981;
        _786 = _983;
    }
    float _985 = _782;
    float _987 = _784;
    float _989 = _786;
    float _991 = -_758;
    float _993 = _991 + 1.0;
    float _995 = _985 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _997 = _760 * _644;
    float _999 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _1001 = _904 + _999;
    float _1003 = _762 * _646;
    float _1005 = fma(_995, _993, _908);
    float _1007 = fma(_997, (*spvDescriptorSet0.fp_c4)._m0[7].y, _774);
    float _1009 = -_760;
    float _1011 = _1009 + 1.0;
    float _1013 = _1001 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = _987 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1019 = fma(_1003, (*spvDescriptorSet0.fp_c4)._m0[7].z, _776);
    float _1021 = -_762;
    float _1023 = _1021 + 1.0;
    float _1025 = _989 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1027 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1029 = _1005 + _1027;
    float _1031 = _1015 * 3.0;
    float _1033 = precise::clamp(_1031, 0.0, 1.0);
    float _1035 = fma(_1017, _1011, _1007);
    float _1037 = fma(_1025, _1023, _1019);
    float _1039 = abs(_1015);
    float _1041 = log2(_1039);
    float _1043 = fma(_1033, _1029, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1045 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1047 = _1035 + _1045;
    float _1049 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1051 = _1037 + _1049;
    float _1053 = -_1015;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1033, _1047, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1059 = fma(_1033, _1051, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1061 = precise::max(_1043, 9.9999999392252902907785028219223e-09);
    float _1063 = precise::max(_1057, 9.9999999392252902907785028219223e-09);
    float _1065 = precise::max(_1059, 9.9999999392252902907785028219223e-09);
    float _1067 = sqrt(_1061);
    float _1069 = _1041 * 0.100000001490116119384765625;
    float _1071 = sqrt(_1063);
    float _1073 = sqrt(_1065);
    float _1075 = fma(_1055, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1067);
    float _1077 = -_1075;
    float _1079 = _1043 + _1077;
    float _1081 = exp2(_1069);
    float _1083 = fma(_1055, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1071);
    float _1085 = -_1083;
    float _1087 = _1057 + _1085;
    float _1089 = fma(_1055, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1073);
    float _1091 = _1015 * 5.0;
    float _1093 = -_1089;
    float _1095 = _1059 + _1093;
    float _1097 = fma(_1081, _1079, _1075);
    float _1099 = fma(_1081, _1087, _1083);
    float _1101 = fma(_1081, _1095, _1089);
    float _1103 = precise::min(_1091, 1.0);
    out.m_49.x = _1097;
    out.m_49.y = _1099;
    out.m_49.z = _1101;
    out.m_49.w = _1103;
    return out;
}

