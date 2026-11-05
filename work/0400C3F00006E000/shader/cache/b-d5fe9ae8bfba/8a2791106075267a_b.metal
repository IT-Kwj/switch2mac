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
    float2 _1186 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1186, float2(0.0), isnan(_1186))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1186, float2(0.0), isnan(_1186))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1203 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1203, float2(0.0), isnan(_1203))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1203, float2(0.0), isnan(_1203))).xyz;
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
    float _340 = _70 * _296;
    float _342 = fma(_328, _328, _334);
    float _344 = 1.0 / _336;
    float _346 = fma(_332, _332, _342);
    float _348 = _70 * _304;
    float _350 = sqrt(_338);
    float _352 = rsqrt(_346);
    float _354 = _340 * _344;
    float _356 = _348 * _344;
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
    float2 _1635 = float2(_380, _382);
    float _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1635, float2(0.0), isnan(_1635))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1635, float2(0.0), isnan(_1635))).x;
    float _386 = in.m_44.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = -_324;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _396 = -_310;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _400 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _402 = _326 * _352;
    float _404 = _356 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _406 = _356 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _408 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _400);
    float _410 = _356 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _412 = _356 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _414 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _406);
    float _416 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _408);
    float _418 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[6].x, _410);
    float _420 = rsqrt(_416);
    float _422 = _70 * _390;
    float _424 = -_422;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _428 = _420 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _430 = _420 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _432 = _420 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _434 = _426 * _426;
    float _436 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[4].x, _404);
    float _438 = -_402;
    float _440 = _438 + 1.0;
    float _442 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[7].x, _412);
    float _444 = fma(_394, _394, _434);
    float _446 = fma(_366, _440, _402);
    float _448 = fma(_398, _398, _444);
    float _450 = rsqrt(_448);
    float _452 = _426 * _450;
    float _454 = _394 * _450;
    float _456 = _398 * _450;
    float _458 = -_428;
    float _460 = _452 + _458;
    float _462 = -_430;
    float _464 = _454 + _462;
    float _466 = -_432;
    float _468 = _456 + _466;
    float _470 = _460 * _460;
    float _472 = fma(_464, _464, _470);
    float _474 = fma(_468, _468, _472);
    float _476 = rsqrt(_474);
    float _478 = _464 * _476;
    float _480 = _460 * _476;
    float _482 = _468 * _476;
    float _484 = fma(_384, 2.0, -1.0);
    float _486 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[7].z, _442);
    float _488 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[5].z, _414);
    float _490 = _486 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _492 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[4].z, _436);
    float _494 = _488 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _496 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[6].z, _418);
    float _498 = _492 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _500 = 1.0 / _490;
    float _502 = _496 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _504 = _494 * _500;
    float _506 = _498 * _500;
    float _508 = _502 * _500;
    float _510 = -_422;
    float _512 = _510 + _504;
    float _514 = -_324;
    float _516 = _514 + _506;
    float _518 = -_310;
    float _520 = _518 + _508;
    float _522 = _452 * _512;
    float _524 = fma(_454, _516, _522);
    float _526 = fma(_456, _520, _524);
    bool _528 = _526 > 0.0;
    float _530 = _502;
    float _532 = _526;
    float _534 = _494;
    float _536 = _442;
    float _538 = _414;
    float _540 = _436;
    float _542 = _418;
    float _544 = _422;
    float _546 = _324;
    float _548 = _310;
    if (_528)
    {
        float2 _1904 = float2(_358, _360);
        float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1904, float2(0.0), isnan(_1904))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1904, float2(0.0), isnan(_1904))).xyz;
        float _552 = _550.x;
        float _554 = _550.y;
        float _556 = _550.z;
        _530 = _552;
        _532 = _554;
        _534 = _556;
    }
    float _558 = _530;
    float _560 = _532;
    float _562 = _534;
    float _564 = _360;
    if (_528)
    {
        float2 _1928 = float2(_358, _360);
        float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1928, float2(0.0), isnan(_1928))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1928, float2(0.0), isnan(_1928))).x;
        _564 = _566;
    }
    float _568 = _564;
    float _570 = -_428;
    float _572 = _446 * _570;
    float _574 = -_452;
    float _576 = _446 * _574;
    float _578 = _446 * _480;
    float _580 = -_430;
    float _582 = fma(_374, _580, _572);
    float _584 = -_454;
    float _586 = fma(_374, _584, _576);
    float _588 = fma(_374, _478, _578);
    float _590 = _446 * _452;
    float _592 = -_432;
    float _594 = fma(_378, _592, _582);
    float _596 = -_456;
    float _598 = fma(_378, _596, _586);
    float _600 = fma(_378, _482, _588);
    float _602 = _598 + _598;
    float _604 = -_602;
    float _606 = -_452;
    float _608 = fma(_446, _604, _606);
    float _610 = -_602;
    float _612 = -_454;
    float _614 = fma(_374, _610, _612);
    float _616 = -_602;
    float _618 = -_456;
    float _620 = fma(_378, _616, _618);
    float _622 = abs(_614);
    float _624 = abs(_608);
    float _626 = precise::max(_622, _624);
    float _628 = abs(_620);
    float _630 = precise::max(_628, _626);
    float _632 = 1.0 / _630;
    float _634 = _614 * _632;
    float _636 = _608 * _632;
    float _638 = _620 * _632;
    float _640 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _2044 = float4(_634, _636, _638, float(0));
    float4 _2048 = select(_2044, float4(0.0), isnan(_2044));
    float3 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2048.xyz, uint(rint(_2048.w)), level(_640)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2048.xyz, uint(rint(_2048.w)), level(_640)).xyz;
    float _644 = _642.x;
    float _646 = _642.y;
    float _648 = _642.z;
    float _650 = _558;
    float _652 = _560;
    float _654 = _562;
    if (!_528)
    {
        float2 _2067 = float2(_380, _382);
        float3 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2067, float2(0.0), isnan(_2067))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2067, float2(0.0), isnan(_2067))).xyz;
        float _658 = _656.x;
        float _660 = _656.y;
        float _662 = _656.z;
        _650 = _658;
        _652 = _660;
        _654 = _662;
    }
    float _664 = _650;
    float _666 = _652;
    float _668 = _654;
    float _670 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _672 = precise::max(_600, 9.9999999392252902907785028219223e-09);
    float _674 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _676 = fma(_374, _454, _590);
    float _678 = _670 * _670;
    float _680 = _678 * 0.5;
    float _682 = precise::max(_594, 9.9999999392252902907785028219223e-09);
    float _684 = fma(_674, _674, -1.0);
    float _686 = _672 * _672;
    float _688 = fma(_378, _456, _676);
    float _690 = -_680;
    float _692 = _690 + 1.0;
    float _694 = fma(_686, _684, 1.0);
    float _696 = sqrt(_448);
    float _698 = fma(_682, _692, _680);
    float _700 = 0.0 + _594;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = precise::max(_688, 9.9999999392252902907785028219223e-09);
    float _706 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _708 = 1.0 + _706;
    float _710 = precise::max(_694, 9.9999999392252902907785028219223e-09);
    float _712 = fma(_704, _692, _680);
    float _714 = 1.0 / _698;
    float _716 = fma(_704, -5.554729938507080078125, -6.9831600189208984375);
    float _718 = _704 * _716;
    bool _720 = _696 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _722 = isnan(_696);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _728 = _724 || _726;
    float _730 = 1.0 / _710;
    float _732 = 1.0 / _712;
    float _734 = _674 * _730;
    float _736 = exp2(_718);
    float _738 = _734 * _734;
    float _740 = _714 * _732;
    float _742 = _738 * 0.3183098733425140380859375;
    float _744 = _702 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _746 = _742 * _740;
    float _748 = _746 * 0.25;
    float _750 = fma(_708, _736, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _752 = _568;
    float _754 = _712;
    float _756 = _740;
    float _758 = _664;
    float _760 = _668;
    float _762 = _666;
    if (_528)
    {
        float _764 = fma(_568, 2.0, -1.0);
        _752 = _764;
    }
    float _766 = _752;
    if (_528)
    {
        float _768 = fma(_766, (*spvDescriptorSet0.fp_c3)._m0[7].z, _442);
        _536 = _768;
    }
    float _770 = _536;
    float _772 = _770;
    if (_528)
    {
        float _774 = fma(_766, (*spvDescriptorSet0.fp_c3)._m0[5].z, _414);
        _538 = _774;
    }
    float _776 = _538;
    float _778 = _776;
    if (_528)
    {
        float _780 = fma(_766, (*spvDescriptorSet0.fp_c3)._m0[4].z, _436);
        _540 = _780;
    }
    float _782 = _540;
    float _784 = _782;
    if (_528)
    {
        float _786 = fma(_766, (*spvDescriptorSet0.fp_c3)._m0[6].z, _418);
        _542 = _786;
    }
    float _788 = _542;
    float _790 = _788;
    if (_528)
    {
        float _792 = _770 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _772 = _792;
    }
    float _794 = _772;
    if (_528)
    {
        float _796 = _776 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _778 = _796;
    }
    float _798 = _778;
    if (_528)
    {
        float _800 = _782 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _754 = _800;
    }
    float _802 = _754;
    float _804 = _802;
    if (_528)
    {
        float _806 = _788 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _790 = _806;
    }
    float _808 = _790;
    float _810 = _794;
    if (_528)
    {
        float _812 = 1.0 / _794;
        _810 = _812;
    }
    float _814 = _810;
    if (_528)
    {
        float _816 = _798 * _814;
        _784 = _816;
    }
    float _818 = _784;
    float _820 = _818;
    if (_528)
    {
        float _822 = _802 * _814;
        _804 = _822;
    }
    float _824 = _804;
    float _826 = _824;
    if (_528)
    {
        float _828 = -_422;
        float _830 = _828 + _818;
        _756 = _830;
    }
    float _832 = _756;
    float _834 = _832;
    if (!_528)
    {
        _834 = _512;
    }
    float _836 = _834;
    if (_528)
    {
        float _838 = _808 * _814;
        _544 = _838;
    }
    float _840 = _544;
    float _842 = _840;
    if (_528)
    {
        float _844 = -_324;
        float _846 = _844 + _824;
        _546 = _846;
    }
    float _848 = _546;
    float _850 = _848;
    if (!_528)
    {
        _850 = _516;
    }
    float _852 = _850;
    float _854 = _836 * _836;
    if (_528)
    {
        float _856 = -_310;
        float _858 = _856 + _840;
        _548 = _858;
    }
    float _860 = _548;
    float _862 = _860;
    if (!_528)
    {
        _862 = _520;
    }
    float _864 = _862;
    float _866 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _868 = 1.0 + _866;
    float _870 = fma(_852, _852, _854);
    float _872 = _702 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    if (!_528)
    {
        _826 = _506;
    }
    float _874 = _826;
    float _876 = fma(_868, _736, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _878 = fma(_864, _864, _870);
    if (!_528)
    {
        _820 = _504;
    }
    float _880 = _820;
    float _882 = _876 * _748;
    if (!_528)
    {
        _842 = _508;
    }
    float _884 = _842;
    float _886 = sqrt(_878);
    float _888 = _744 * _882;
    float _890 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _892 = _886 + _890;
    float _894 = _892 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _900 = 1.0 + _898;
    float _902 = fma(_900, _736, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _904 = abs(_896);
    float _906 = log2(_904);
    float _908 = _902 * _748;
    float _910 = _872 * _908;
    float _912 = _906 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _914 = _902 * _644;
    float _916 = _876 * _646;
    float _918 = exp2(_912);
    float _920 = fma(_914, (*spvDescriptorSet0.fp_c4)._m0[7].x, _910);
    float _922 = fma(_916, (*spvDescriptorSet0.fp_c4)._m0[7].y, _888);
    if (!_728)
    {
        float _924 = fma(_880, (*spvDescriptorSet0.fp_c4)._m0[3].y, _874);
        float _926 = fma(_880, (*spvDescriptorSet0.fp_c4)._m0[3].y, _884);
        float _928 = _924 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _930 = -_926;
        float _932 = fma(_930, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2518 = float2(_928, _932);
        float4 _935 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2518, float2(0.0), isnan(_2518)), int2(0), component::x).xyzw;
        float _937 = _935.x;
        float _939 = _935.y;
        float _941 = _935.z;
        float _943 = _935.w;
        float _945 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _947 = fma(_696, (*spvDescriptorSet0.fp_c4)._m0[2].x, _945);
        float _949 = precise::clamp(_947, 0.0, 1.0);
        float _951 = -_949;
        float _953 = _951 + 1.0;
        float _955 = _937 + _939;
        float _957 = -_953;
        float _959 = fma(_957, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _961 = precise::clamp(_959, 0.0, 1.0);
        float _963 = _941 + _955;
        float _965 = _943 + _963;
        float _967 = fma(_965, 0.25, 1.0);
        float _969 = _967 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _971 = _967 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _973 = _967 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _975 = _969 * _664;
        float _977 = _971 * _666;
        float _979 = _973 * _668;
        float _981 = -_975;
        float _983 = _981 + _664;
        float _985 = -_977;
        float _987 = _985 + _666;
        float _989 = -_979;
        float _991 = _989 + _668;
        float _993 = fma(_961, _983, _975);
        float _995 = fma(_961, _987, _977);
        float _997 = fma(_961, _991, _979);
        _758 = _993;
        _760 = _997;
        _762 = _995;
    }
    float _999 = _758;
    float _1001 = _760;
    float _1003 = _762;
    float _1005 = _702 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1007 = _750 * _748;
    float _1009 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1011 = _999 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1013 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1015 = _1001 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1017 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1019 = _1005 * _1007;
    float _1021 = _750 * _648;
    float _1023 = _1003 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1025 = -_1011;
    float _1027 = fma(_872, _1009, _1025);
    float _1029 = -_1015;
    float _1031 = fma(_1005, _1013, _1029);
    float _1033 = fma(_1021, (*spvDescriptorSet0.fp_c4)._m0[7].z, _1019);
    float _1035 = -_1023;
    float _1037 = fma(_744, _1017, _1035);
    float _1039 = fma(_918, _1027, _1011);
    float _1041 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _1043 = _886 + _1041;
    float _1045 = -_902;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_918, _1031, _1015);
    float _1051 = -_750;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_918, _1037, _1023);
    float _1057 = -_876;
    float _1059 = _1057 + 1.0;
    float _1061 = _1043 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1063 = precise::clamp(_1061, 0.0, 1.0);
    float _1065 = fma(_1039, _1047, _920);
    float _1067 = fma(_1049, _1053, _1033);
    float _1069 = fma(_1055, _1059, _922);
    float _1071 = _1063 * 3.0;
    float _1073 = precise::clamp(_1071, 0.0, 1.0);
    float _1075 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1077 = _1065 + _1075;
    float _1079 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1081 = _1067 + _1079;
    float _1083 = abs(_1063);
    float _1085 = log2(_1083);
    float _1087 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1089 = _1069 + _1087;
    float _1091 = fma(_1073, _1077, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1093 = fma(_1073, _1081, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1095 = -_1063;
    float _1097 = _1095 + 1.0;
    float _1099 = fma(_1073, _1089, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1101 = precise::max(_1091, 9.9999999392252902907785028219223e-09);
    float _1103 = precise::max(_1093, 9.9999999392252902907785028219223e-09);
    float _1105 = precise::max(_1099, 9.9999999392252902907785028219223e-09);
    float _1107 = sqrt(_1101);
    float _1109 = _1085 * 0.100000001490116119384765625;
    float _1111 = sqrt(_1105);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1097, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1107);
    float _1117 = -_1115;
    float _1119 = _1091 + _1117;
    float _1121 = exp2(_1109);
    float _1123 = fma(_1097, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1111);
    float _1125 = -_1123;
    float _1127 = _1099 + _1125;
    float _1129 = fma(_1097, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1113);
    float _1131 = _1063 * 5.0;
    float _1133 = -_1129;
    float _1135 = _1093 + _1133;
    float _1137 = fma(_1121, _1119, _1115);
    float _1139 = fma(_1121, _1127, _1123);
    float _1141 = fma(_1121, _1135, _1129);
    float _1143 = precise::min(_1131, 1.0);
    out.m_49.x = _1137;
    out.m_49.y = _1139;
    out.m_49.z = _1141;
    out.m_49.w = _1143;
    return out;
}

