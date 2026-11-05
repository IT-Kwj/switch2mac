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
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_42.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float _78 = _74 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _80 = _76 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1046 = float2(_74, _76);
    float3 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1046, float2(0.0), isnan(_1046))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1046, float2(0.0), isnan(_1046))).xyz;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float2 _1063 = float2(_78, _80);
    float3 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1063, float2(0.0), isnan(_1063))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1063, float2(0.0), isnan(_1063))).xyz;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _88 * _88;
    float _102 = fma(_86, _86, _100);
    float _104 = fma(_90, _90, _102);
    float _106 = rsqrt(_104);
    float _108 = _88 * _106;
    float _110 = _86 * _106;
    float _112 = _90 * _106;
    float _114 = _108 * _108;
    float _116 = fma(_110, _110, _114);
    float _118 = sqrt(_116);
    bool _122 = _118 >= 0.00999999977648258209228515625;
    bool _124 = isnan(_118);
    bool _126 = _122 || _124;
    bool _128 = isnan(0.00999999977648258209228515625);
    bool _130 = _126 || _128;
    float _132 = 0.0;
    float _134 = _88;
    float _136 = _106;
    float _138 = _118;
    if (!_130)
    {
        float _140 = fma(_112, _112, _114);
        _132 = _140;
    }
    float _142 = _132;
    float _144 = _114;
    if (!_130)
    {
        float _146 = rsqrt(_142);
        _144 = _146;
    }
    float _148 = _144;
    float _150 = _110 * _96;
    float _152 = _108 * _96;
    float _154 = _148;
    if (!_130)
    {
        float _156 = _112 * _148;
        _134 = _156;
    }
    float _158 = _134;
    float _160 = _158;
    if (!_130)
    {
        float _162 = _108 * _148;
        _136 = _162;
    }
    float _164 = _136;
    float _166 = _164;
    if (!_130)
    {
        _154 = 0.0;
    }
    float _168 = _154;
    float _170 = 0.0;
    float _172 = _168;
    if (!_130)
    {
        float _174 = _112 * _158;
        _170 = _174;
    }
    float _176 = _170;
    float _178 = 0.0;
    float _180 = _176;
    if (!_130)
    {
        float _182 = fma(_110, _164, -0.0);
        _178 = _182;
    }
    float _184 = _178;
    float _186 = _184;
    if (!_130)
    {
        float _188 = _110 * _158;
        _138 = _188;
    }
    float _190 = _138;
    float _192 = _190;
    if (!_130)
    {
        float _194 = -_164;
        float _196 = -_176;
        float _198 = fma(_108, _194, _196);
        _180 = _198;
    }
    float _200 = _180;
    float _202 = _200;
    if (!_130)
    {
        float _204 = -_164;
        float _206 = (-0.0) + _204;
        _166 = _206;
    }
    float _208 = _166;
    bool _210 = !_130;
    float _212 = _208;
    if (!_210)
    {
        float _214 = rsqrt(_116);
        float _216 = _108 * _214;
        float _218 = -_214;
        float _220 = _110 * _218;
        float _222 = _112 * _216;
        float _224 = _110 * _220;
        float _226 = _112 * _220;
        float _228 = _222 * _222;
        float _230 = -_224;
        float _232 = fma(_108, _216, _230);
        float _234 = fma(_226, _226, _228);
        float _236 = fma(_232, _232, _234);
        float _238 = rsqrt(_236);
        float _240 = _226 * _238;
        float _242 = _232 * _238;
        float _244 = -_222;
        float _246 = fma(_244, _238, -0.0);
        _186 = _220;
        _202 = _216;
        _160 = _246;
        _172 = _240;
        _192 = 0.0;
        _212 = _242;
    }
    float _248 = _186;
    float _250 = _202;
    float _252 = _160;
    float _254 = _172;
    float _256 = _192;
    float _258 = _212;
    float _260 = fma(_94, _248, _152);
    float _262 = fma(_94, _250, _150);
    float _264 = _112 * _96;
    float _266 = in.m_44.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_98, _252, _260);
    float _274 = fma(_98, _254, _262);
    float _276 = fma(_94, _256, _264);
    float _278 = in.m_44.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _272 * _272;
    float _286 = in.m_46.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_98, _258, _276);
    float _294 = in.m_46.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = fma(_274, _274, _284);
    float _302 = in.m_46.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_292, _292, _300);
    float _310 = rsqrt(_308);
    float _312 = _72 * _270;
    float _314 = -_108;
    float _316 = fma(_272, _310, _314);
    float _318 = -_110;
    float _320 = fma(_274, _310, _318);
    float _322 = -_112;
    float _324 = fma(_292, _310, _322);
    float _326 = _72 * _282;
    float _328 = fma(_316, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _330 = fma(_320, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _332 = _312 * _312;
    float _334 = fma(_324, (*spvDescriptorSet0.fp_c4)._m0[0].z, _112);
    float _336 = _328 * _328;
    float _338 = _72 * _290;
    float _340 = fma(_326, _326, _332);
    float _342 = _72 * _298;
    float _344 = fma(_330, _330, _336);
    float _346 = 1.0 / _338;
    float _348 = fma(_334, _334, _344);
    float _350 = sqrt(_340);
    float _352 = _72 * _306;
    float _354 = rsqrt(_348);
    float _356 = _342 * _346;
    float _358 = _352 * _346;
    float _360 = fma(_356, 0.5, 0.5);
    float _362 = fma(_358, -0.5, 0.5);
    float _364 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _366 = fma(_350, (*spvDescriptorSet0.fp_c4)._m0[1].x, _364);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _330 * _354;
    float _372 = _334 * _354;
    float _374 = -_370;
    float _376 = fma(_368, _374, _370);
    float _378 = -_372;
    float _380 = fma(_368, _378, _372);
    float _382 = fma(_376, 0.0199999995529651641845703125, _360);
    float _384 = fma(_380, 0.0199999995529651641845703125, _362);
    float2 _1494 = float2(_382, _384);
    float _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1494, float2(0.0), isnan(_1494))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1494, float2(0.0), isnan(_1494))).x;
    float _388 = in.m_44.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = -_326;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _398 = _358 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _400 = _358 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _402 = _358 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _404 = -_312;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _408 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[4].x, _398);
    float _410 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[5].x, _400);
    float _412 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[7].x, _402);
    float _414 = _72 * _392;
    float _416 = -_414;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _420 = _418 * _418;
    float _422 = fma(_396, _396, _420);
    float _424 = _358 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _426 = fma(_406, _406, _422);
    float _428 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[6].x, _424);
    float _430 = rsqrt(_426);
    float _432 = _418 * _430;
    float _434 = _396 * _430;
    float _436 = _406 * _430;
    float _438 = fma(_386, 2.0, -1.0);
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[7].z, _412);
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[5].z, _410);
    float _444 = _440 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _446 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[4].z, _408);
    float _448 = _442 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _450 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[6].z, _428);
    float _452 = _446 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _454 = 1.0 / _444;
    float _456 = _450 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _458 = _448 * _454;
    float _460 = _452 * _454;
    float _462 = _456 * _454;
    float _464 = -_414;
    float _466 = _464 + _458;
    float _468 = -_326;
    float _470 = _468 + _460;
    float _472 = -_312;
    float _474 = _472 + _462;
    float _476 = _432 * _466;
    float _478 = fma(_434, _470, _476);
    float _480 = fma(_436, _474, _478);
    bool _482 = _480 > 0.0;
    float _484 = _476;
    float _486 = _478;
    float _488 = _448;
    float _490 = _380;
    float _492 = _412;
    float _494 = _408;
    float _496 = _428;
    float _498 = _462;
    if (_482)
    {
        float2 _1682 = float2(_360, _362);
        float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1682, float2(0.0), isnan(_1682))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1682, float2(0.0), isnan(_1682))).xyz;
        float _502 = _500.x;
        float _504 = _500.y;
        float _506 = _500.z;
        _484 = _502;
        _486 = _504;
        _488 = _506;
    }
    float _508 = _484;
    float _510 = _486;
    float _512 = _488;
    float _514 = _362;
    if (_482)
    {
        float2 _1706 = float2(_360, _362);
        float _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1706, float2(0.0), isnan(_1706))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1706, float2(0.0), isnan(_1706))).x;
        _514 = _516;
    }
    float _518 = _514;
    float _520 = _328 * _354;
    float _522 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _524 = -_520;
    float _526 = _524 + 1.0;
    float _528 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _522);
    float _530 = fma(_368, _526, _520);
    float _532 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _534 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _528);
    float _536 = -_432;
    float _538 = _530 * _536;
    float _540 = -_434;
    float _542 = fma(_376, _540, _538);
    float _544 = rsqrt(_534);
    float _546 = -_436;
    float _548 = fma(_380, _546, _542);
    float _550 = _548 + _548;
    float _552 = -_550;
    float _554 = -_434;
    float _556 = fma(_376, _552, _554);
    float _558 = _544 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _560 = _544 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _562 = _544 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _564 = -_550;
    float _566 = -_432;
    float _568 = fma(_530, _564, _566);
    float _570 = -_558;
    float _572 = _432 + _570;
    float _574 = -_560;
    float _576 = _434 + _574;
    float _578 = -_562;
    float _580 = _436 + _578;
    float _582 = -_550;
    float _584 = -_436;
    float _586 = fma(_380, _582, _584);
    float _588 = _572 * _572;
    float _590 = fma(_576, _576, _588);
    float _592 = fma(_580, _580, _590);
    float _594 = rsqrt(_592);
    float _596 = _576 * _594;
    float _598 = _572 * _594;
    float _600 = _580 * _594;
    float _602 = abs(_556);
    float _604 = abs(_568);
    float _606 = precise::max(_602, _604);
    float _608 = abs(_586);
    float _610 = precise::max(_608, _606);
    float _612 = 1.0 / _610;
    float _614 = _556 * _612;
    float _616 = _568 * _612;
    float _618 = _586 * _612;
    float4 _1870 = float4(_614, _616, _618, float(0));
    float4 _1874 = select(_1870, float4(0.0), isnan(_1870));
    float3 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1874.xyz, uint(rint(_1874.w)), level(_532)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1874.xyz, uint(rint(_1874.w)), level(_532)).xyz;
    float _622 = _620.x;
    float _624 = _620.y;
    float _626 = _620.z;
    float _628 = _508;
    float _630 = _510;
    float _632 = _512;
    if (!_482)
    {
        float2 _1893 = float2(_382, _384);
        float3 _634 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1893, float2(0.0), isnan(_1893))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1893, float2(0.0), isnan(_1893))).xyz;
        float _636 = _634.x;
        float _638 = _634.y;
        float _640 = _634.z;
        _628 = _636;
        _630 = _638;
        _632 = _640;
    }
    float _642 = _628;
    float _644 = _630;
    float _646 = _632;
    float _648 = _530 * _598;
    float _650 = -_558;
    float _652 = _530 * _650;
    float _654 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _656 = _530 * _432;
    float _658 = fma(_376, _596, _648);
    float _660 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _662 = -_560;
    float _664 = fma(_376, _662, _652);
    float _666 = fma(_376, _434, _656);
    float _668 = fma(_380, _600, _658);
    float _670 = _654 * _654;
    float _672 = _670 * 0.5;
    float _674 = -_562;
    float _676 = fma(_380, _674, _664);
    float _678 = fma(_380, _436, _666);
    float _680 = sqrt(_426);
    float _682 = precise::max(_668, 9.9999999392252902907785028219223e-09);
    float _684 = fma(_660, _660, -1.0);
    float _686 = precise::max(_676, 9.9999999392252902907785028219223e-09);
    float _688 = -_672;
    float _690 = _688 + 1.0;
    float _692 = _682 * _682;
    float _694 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _696 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _698 = 1.0 + _696;
    float _700 = fma(_686, _690, _672);
    float _702 = fma(_692, _684, 1.0);
    float _704 = 0.0 + _676;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = fma(_694, _690, _672);
    float _710 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _712 = 1.0 + _710;
    float _714 = in.m_48.x;
    float _716 = gl_FragCoord.w;
    float _718 = _714 * _716;
    float _720 = precise::max(_702, 9.9999999392252902907785028219223e-09);
    float _722 = 1.0 / _700;
    bool _724 = _680 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _726 = isnan(_680);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _732 = _728 || _730;
    float _734 = fma(_694, -5.554729938507080078125, -6.9831600189208984375);
    float _736 = 1.0 / _720;
    float _738 = _694 * _734;
    float _740 = 1.0 / _708;
    float _742 = exp2(_738);
    float _744 = _660 * _736;
    float _746 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _748 = 1.0 + _746;
    float _750 = _744 * _744;
    float _752 = _72 * _718;
    float _754 = _722 * _740;
    float _756 = _750 * 0.3183098733425140380859375;
    float _758 = _706 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _760 = _756 * _754;
    float _762 = _760 * 0.25;
    float _764 = _706 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _766 = _706 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _768 = fma(_698, _742, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _770 = fma(_748, _742, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _772 = fma(_712, _742, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _774 = _768 * _762;
    float _776 = _770 * _762;
    float _778 = _772 * _762;
    float _780 = _758 * _774;
    float _782 = _764 * _776;
    float _784 = _766 * _778;
    float _786 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _788 = fma(_752, (*spvDescriptorSet0.fp_c4)._m0[1].z, _786);
    float _790 = _718;
    float _792 = _624;
    float _794 = _642;
    float _796 = _644;
    if (_482)
    {
        float _798 = fma(_518, 2.0, -1.0);
        _490 = _798;
    }
    float _800 = _490;
    float _802 = _800;
    if (_482)
    {
        float _804 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[7].z, _412);
        _492 = _804;
    }
    float _806 = _492;
    float _808 = _806;
    if (_482)
    {
        float _810 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[4].z, _408);
        _494 = _810;
    }
    float _812 = _494;
    float _814 = _812;
    if (_482)
    {
        float _816 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[5].z, _410);
        _790 = _816;
    }
    float _818 = _790;
    if (_482)
    {
        float _820 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[6].z, _428);
        _802 = _820;
    }
    float _822 = _802;
    float _824 = _822;
    if (_482)
    {
        float _826 = _806 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _808 = _826;
    }
    float _828 = _808;
    if (_482)
    {
        float _830 = _818 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _496 = _830;
    }
    float _832 = _496;
    float _834 = _832;
    if (_482)
    {
        float _836 = _822 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _824 = _836;
    }
    float _838 = _824;
    float _840 = _828;
    if (_482)
    {
        float _842 = 1.0 / _828;
        _840 = _842;
    }
    float _844 = _840;
    float _846 = _844;
    if (_482)
    {
        float _848 = _832 * _844;
        _834 = _848;
    }
    float _850 = _834;
    float _852 = _850;
    if (!_482)
    {
        _852 = _458;
    }
    float _854 = _852;
    float _856 = _770 * _624;
    if (_482)
    {
        float _858 = _812 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _792 = _858;
    }
    float _860 = _792;
    float _862 = _768 * _622;
    float _864 = _772 * _626;
    if (_482)
    {
        float _866 = _860 * _844;
        _814 = _866;
    }
    float _868 = _814;
    float _870 = _868;
    if (_482)
    {
        float _872 = _838 * _844;
        _846 = _872;
    }
    float _874 = _846;
    float _876 = _874;
    if (!_482)
    {
        _876 = _462;
    }
    float _878 = _876;
    float _880 = fma(_862, (*spvDescriptorSet0.fp_c4)._m0[7].x, _780);
    float _882 = fma(_856, (*spvDescriptorSet0.fp_c4)._m0[7].y, _782);
    float _884 = fma(_864, (*spvDescriptorSet0.fp_c4)._m0[7].z, _784);
    if (!_482)
    {
        _870 = _460;
    }
    float _886 = _870;
    if (_732)
    {
        _498 = _646;
    }
    float _888 = _498;
    float _890 = _888;
    if (!_732)
    {
        float _892 = fma(_854, (*spvDescriptorSet0.fp_c4)._m0[3].y, _886);
        float _894 = fma(_854, (*spvDescriptorSet0.fp_c4)._m0[3].y, _878);
        float _896 = _892 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _898 = -_894;
        float _900 = fma(_898, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2328 = float2(_896, _900);
        float4 _903 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2328, float2(0.0), isnan(_2328)), int2(0), component::x).xyzw;
        float _905 = _903.x;
        float _907 = _903.y;
        float _909 = _903.z;
        float _911 = _903.w;
        float _913 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _915 = fma(_680, (*spvDescriptorSet0.fp_c4)._m0[2].x, _913);
        float _917 = precise::clamp(_915, 0.0, 1.0);
        float _919 = -_917;
        float _921 = _919 + 1.0;
        float _923 = -_921;
        float _925 = fma(_923, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _927 = precise::clamp(_925, 0.0, 1.0);
        float _929 = _905 + _907;
        float _931 = _909 + _929;
        float _933 = _911 + _931;
        float _935 = fma(_933, 0.25, 1.0);
        float _937 = _935 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _939 = _935 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _941 = _935 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _943 = _937 * _644;
        float _945 = _939 * _642;
        float _947 = _941 * _646;
        float _949 = -_943;
        float _951 = _949 + _644;
        float _953 = -_945;
        float _955 = _953 + _642;
        float _957 = -_947;
        float _959 = _957 + _646;
        float _961 = fma(_927, _951, _943);
        float _963 = fma(_927, _955, _945);
        float _965 = fma(_927, _959, _947);
        _794 = _963;
        _796 = _961;
        _890 = _965;
    }
    float _967 = _794;
    float _969 = _796;
    float _971 = _890;
    float _973 = _967 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _975 = precise::max(0.0, _788);
    float _977 = -_768;
    float _979 = _977 + 1.0;
    float _981 = _969 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _983 = -_770;
    float _985 = _983 + 1.0;
    float _987 = -_772;
    float _989 = _987 + 1.0;
    float _991 = _971 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _993 = fma(_973, _979, _880);
    float _995 = fma(_981, _985, _882);
    float _997 = -_975;
    float _999 = _997 + 1.0;
    float _1001 = precise::clamp(_999, 0.0, 1.0);
    float _1003 = fma(_991, _989, _884);
    out.m_51.x = _993;
    out.m_51.y = _995;
    out.m_51.z = _1003;
    out.m_51.w = _1001;
    return out;
}

