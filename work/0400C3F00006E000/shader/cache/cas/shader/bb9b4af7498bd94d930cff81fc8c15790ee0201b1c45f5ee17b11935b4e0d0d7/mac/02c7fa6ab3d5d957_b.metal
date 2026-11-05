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
    float2 _1126 = float2(_74, _76);
    float3 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1126, float2(0.0), isnan(_1126))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1126, float2(0.0), isnan(_1126))).xyz;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float2 _1143 = float2(_78, _80);
    float3 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1143, float2(0.0), isnan(_1143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1143, float2(0.0), isnan(_1143))).xyz;
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
    float _278 = in.m_46.w;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _272 * _272;
    float _286 = in.m_44.x;
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
    float _322 = _72 * _282;
    float _324 = -_112;
    float _326 = fma(_292, _310, _324);
    float _328 = fma(_316, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _330 = fma(_320, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _332 = _72 * _290;
    float _334 = _312 * _312;
    float _336 = _328 * _328;
    float _338 = fma(_326, (*spvDescriptorSet0.fp_c4)._m0[0].z, _112);
    float _340 = 1.0 / _322;
    float _342 = fma(_332, _332, _334);
    float _344 = fma(_330, _330, _336);
    float _346 = _72 * _298;
    float _348 = fma(_338, _338, _344);
    float _350 = sqrt(_342);
    float _352 = _72 * _306;
    float _354 = rsqrt(_348);
    float _356 = _346 * _340;
    float _358 = _352 * _340;
    float _360 = fma(_356, 0.5, 0.5);
    float _362 = fma(_358, -0.5, 0.5);
    float _364 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _366 = fma(_350, (*spvDescriptorSet0.fp_c4)._m0[1].x, _364);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _330 * _354;
    float _372 = _338 * _354;
    float _374 = -_370;
    float _376 = fma(_368, _374, _370);
    float _378 = -_372;
    float _380 = fma(_368, _378, _372);
    float _382 = fma(_376, 0.0199999995529651641845703125, _360);
    float _384 = fma(_380, 0.0199999995529651641845703125, _362);
    float2 _1574 = float2(_382, _384);
    float _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1574, float2(0.0), isnan(_1574))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1574, float2(0.0), isnan(_1574))).x;
    float _388 = in.m_44.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = -_312;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _398 = _328 * _354;
    float _400 = _358 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _402 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _404 = _358 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _406 = -_398;
    float _408 = _406 + 1.0;
    float _410 = _358 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _412 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _402);
    float _414 = -_332;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _418 = fma(_368, _408, _398);
    float _420 = _358 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _422 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[5].x, _400);
    float _424 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[6].x, _404);
    float _426 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[4].x, _420);
    float _428 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[7].x, _410);
    float _430 = _72 * _392;
    float _432 = -_430;
    float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _436 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _412);
    float _438 = _434 * _434;
    float _440 = fma(_416, _416, _438);
    float _442 = rsqrt(_436);
    float _444 = fma(_396, _396, _440);
    float _446 = rsqrt(_444);
    float _448 = _442 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _450 = _442 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _452 = _442 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _454 = _434 * _446;
    float _456 = _416 * _446;
    float _458 = _396 * _446;
    float _460 = -_448;
    float _462 = _454 + _460;
    float _464 = -_450;
    float _466 = _456 + _464;
    float _468 = -_452;
    float _470 = _458 + _468;
    float _472 = -_448;
    float _474 = _418 * _472;
    float _476 = _462 * _462;
    float _478 = -_450;
    float _480 = fma(_376, _478, _474);
    float _482 = fma(_466, _466, _476);
    float _484 = fma(_470, _470, _482);
    float _486 = rsqrt(_484);
    float _488 = _462 * _486;
    float _490 = _466 * _486;
    float _492 = _418 * _488;
    float _494 = fma(_376, _490, _492);
    float _496 = -_454;
    float _498 = _418 * _496;
    float _500 = fma(_386, 2.0, -1.0);
    float _502 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[7].z, _428);
    float _504 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[5].z, _422);
    float _506 = _502 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _508 = -_456;
    float _510 = fma(_376, _508, _498);
    float _512 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[4].z, _426);
    float _514 = _504 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _516 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[6].z, _424);
    float _518 = -_458;
    float _520 = fma(_380, _518, _510);
    float _522 = 1.0 / _506;
    float _524 = _512 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _526 = _520 + _520;
    float _528 = -_526;
    float _530 = -_456;
    float _532 = fma(_376, _528, _530);
    float _534 = _514 * _522;
    float _536 = _516 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _538 = _524 * _522;
    float _540 = _418 * _454;
    float _542 = -_430;
    float _544 = _542 + _534;
    float _546 = _536 * _522;
    float _548 = -_332;
    float _550 = _548 + _538;
    float _552 = fma(_376, _456, _540);
    float _554 = _454 * _544;
    float _556 = -_312;
    float _558 = _556 + _546;
    float _560 = -_526;
    float _562 = -_454;
    float _564 = fma(_418, _560, _562);
    float _566 = fma(_456, _550, _554);
    float _568 = fma(_458, _558, _566);
    bool _570 = _568 > 0.0;
    float _572 = _376;
    float _574 = _454;
    float _576 = _554;
    float _578 = _428;
    float _580 = _422;
    float _582 = _426;
    float _584 = _424;
    float _586 = _430;
    float _588 = _332;
    float _590 = _312;
    if (_570)
    {
        float2 _1901 = float2(_360, _362);
        float3 _592 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1901, float2(0.0), isnan(_1901))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1901, float2(0.0), isnan(_1901))).xyz;
        float _594 = _592.x;
        float _596 = _592.y;
        float _598 = _592.z;
        _572 = _594;
        _574 = _596;
        _576 = _598;
    }
    float _600 = _572;
    float _602 = _574;
    float _604 = _576;
    float _606 = _362;
    if (_570)
    {
        float2 _1925 = float2(_360, _362);
        float _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1925, float2(0.0), isnan(_1925))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1925, float2(0.0), isnan(_1925))).x;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = -_526;
    float _614 = -_458;
    float _616 = fma(_380, _612, _614);
    float _618 = abs(_532);
    float _620 = abs(_564);
    float _622 = precise::max(_618, _620);
    float _624 = _470 * _486;
    float _626 = abs(_616);
    float _628 = precise::max(_626, _622);
    float _630 = fma(_380, _624, _494);
    float _632 = 1.0 / _628;
    float _634 = _532 * _632;
    float _636 = _616 * _632;
    float _638 = _564 * _632;
    float _640 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1981 = float4(_634, _638, _636, float(0));
    float4 _1985 = select(_1981, float4(0.0), isnan(_1981));
    float3 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1985.xyz, uint(rint(_1985.w)), level(_640)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1985.xyz, uint(rint(_1985.w)), level(_640)).xyz;
    float _644 = _642.x;
    float _646 = _642.y;
    float _648 = _642.z;
    float _650 = _600;
    float _652 = _602;
    float _654 = _604;
    if (!_570)
    {
        float2 _2004 = float2(_382, _384);
        float3 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2004, float2(0.0), isnan(_2004))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2004, float2(0.0), isnan(_2004))).xyz;
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
    float _672 = precise::max(_630, 9.9999999392252902907785028219223e-09);
    float _674 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _676 = -_452;
    float _678 = fma(_380, _676, _480);
    float _680 = fma(_380, _458, _552);
    float _682 = _670 * _670;
    float _684 = _682 * 0.5;
    float _686 = fma(_674, _674, -1.0);
    float _688 = _672 * _672;
    float _690 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _692 = -_684;
    float _694 = _692 + 1.0;
    float _696 = precise::max(_680, 9.9999999392252902907785028219223e-09);
    float _698 = fma(_688, _686, 1.0);
    float _700 = sqrt(_444);
    float _702 = fma(_690, _694, _684);
    float _704 = 0.0 + _678;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = fma(_696, _694, _684);
    float _710 = precise::max(_698, 9.9999999392252902907785028219223e-09);
    float _712 = 1.0 / _702;
    float _714 = 1.0 / _710;
    bool _716 = _700 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _718 = isnan(_700);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _724 = _720 || _722;
    float _726 = fma(_696, -5.554729938507080078125, -6.9831600189208984375);
    float _728 = 1.0 / _708;
    float _730 = _696 * _726;
    float _732 = _674 * _714;
    float _734 = exp2(_730);
    float _736 = _732 * _732;
    float _738 = _712 * _728;
    float _740 = _736 * 0.3183098733425140380859375;
    float _742 = _740 * _738;
    float _744 = _742 * 0.25;
    float _746 = _610;
    float _748 = _726;
    float _750 = _738;
    float _752 = _664;
    float _754 = _666;
    float _756 = _668;
    if (_570)
    {
        float _758 = fma(_610, 2.0, -1.0);
        _746 = _758;
    }
    float _760 = _746;
    if (_570)
    {
        float _762 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[7].z, _428);
        _578 = _762;
    }
    float _764 = _578;
    float _766 = _764;
    if (_570)
    {
        float _768 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[5].z, _422);
        _580 = _768;
    }
    float _770 = _580;
    float _772 = _770;
    if (_570)
    {
        float _774 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[4].z, _426);
        _582 = _774;
    }
    float _776 = _582;
    float _778 = _776;
    if (_570)
    {
        float _780 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[6].z, _424);
        _584 = _780;
    }
    float _782 = _584;
    float _784 = _782;
    if (_570)
    {
        float _786 = _764 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _766 = _786;
    }
    float _788 = _766;
    if (_570)
    {
        float _790 = _770 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _772 = _790;
    }
    float _792 = _772;
    if (_570)
    {
        float _794 = _776 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _748 = _794;
    }
    float _796 = _748;
    float _798 = _796;
    if (_570)
    {
        float _800 = _782 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _784 = _800;
    }
    float _802 = _784;
    float _804 = _788;
    if (_570)
    {
        float _806 = 1.0 / _788;
        _804 = _806;
    }
    float _808 = _804;
    if (_570)
    {
        float _810 = _792 * _808;
        _778 = _810;
    }
    float _812 = _778;
    float _814 = _812;
    if (_570)
    {
        float _816 = _796 * _808;
        _798 = _816;
    }
    float _818 = _798;
    float _820 = _818;
    if (_570)
    {
        float _822 = -_430;
        float _824 = _822 + _812;
        _750 = _824;
    }
    float _826 = _750;
    float _828 = _826;
    if (!_570)
    {
        _828 = _544;
    }
    float _830 = _828;
    if (_570)
    {
        float _832 = _802 * _808;
        _586 = _832;
    }
    float _834 = _586;
    float _836 = _834;
    if (_570)
    {
        float _838 = -_332;
        float _840 = _838 + _818;
        _588 = _840;
    }
    float _842 = _588;
    float _844 = _842;
    if (!_570)
    {
        _844 = _550;
    }
    float _846 = _844;
    float _848 = _830 * _830;
    if (_570)
    {
        float _850 = -_312;
        float _852 = _850 + _834;
        _590 = _852;
    }
    float _854 = _590;
    float _856 = _854;
    if (!_570)
    {
        _856 = _558;
    }
    float _858 = _856;
    float _860 = in.m_48.x;
    float _862 = gl_FragCoord.w;
    float _864 = _860 * _862;
    float _866 = fma(_846, _846, _848);
    float _868 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _870 = 1.0 + _868;
    if (!_570)
    {
        _814 = _534;
    }
    float _872 = _814;
    float _874 = fma(_858, _858, _866);
    if (!_570)
    {
        _820 = _538;
    }
    float _876 = _820;
    float _878 = sqrt(_874);
    if (!_570)
    {
        _836 = _546;
    }
    float _880 = _836;
    float _882 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _884 = 1.0 + _882;
    float _886 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _888 = _878 + _886;
    float _890 = _888 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _892 = precise::clamp(_890, 0.0, 1.0);
    float _894 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _896 = 1.0 + _894;
    float _898 = _72 * _864;
    float _900 = abs(_892);
    float _902 = log2(_900);
    float _904 = _706 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _906 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _908 = fma(_898, (*spvDescriptorSet0.fp_c4)._m0[1].z, _906);
    float _910 = fma(_896, _734, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _912 = fma(_870, _734, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _914 = _706 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _916 = fma(_884, _734, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _918 = _910 * _744;
    float _920 = _912 * _744;
    float _922 = _910 * _644;
    float _924 = _912 * _646;
    float _926 = _914 * _918;
    float _928 = _902 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _930 = _904 * _920;
    float _932 = fma(_922, (*spvDescriptorSet0.fp_c4)._m0[7].x, _926);
    float _934 = exp2(_928);
    float _936 = fma(_924, (*spvDescriptorSet0.fp_c4)._m0[7].y, _930);
    if (!_724)
    {
        float _938 = fma(_872, (*spvDescriptorSet0.fp_c4)._m0[3].y, _876);
        float _940 = fma(_872, (*spvDescriptorSet0.fp_c4)._m0[3].y, _880);
        float _942 = _938 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _944 = -_940;
        float _946 = fma(_944, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2475 = float2(_942, _946);
        float4 _949 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2475, float2(0.0), isnan(_2475)), int2(0), component::x).xyzw;
        float _951 = _949.x;
        float _953 = _949.y;
        float _955 = _949.z;
        float _957 = _949.w;
        float _959 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _961 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[2].x, _959);
        float _963 = precise::clamp(_961, 0.0, 1.0);
        float _965 = -_963;
        float _967 = _965 + 1.0;
        float _969 = _951 + _953;
        float _971 = -_967;
        float _973 = fma(_971, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _975 = precise::clamp(_973, 0.0, 1.0);
        float _977 = _955 + _969;
        float _979 = _957 + _977;
        float _981 = fma(_979, 0.25, 1.0);
        float _983 = _981 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _985 = _981 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _987 = _981 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _989 = _983 * _664;
        float _991 = _985 * _666;
        float _993 = _987 * _668;
        float _995 = -_989;
        float _997 = _995 + _664;
        float _999 = -_991;
        float _1001 = _999 + _666;
        float _1003 = -_993;
        float _1005 = _1003 + _668;
        float _1007 = fma(_975, _997, _989);
        float _1009 = fma(_975, _1001, _991);
        float _1011 = fma(_975, _1005, _993);
        _752 = _1007;
        _754 = _1009;
        _756 = _1011;
    }
    float _1013 = _752;
    float _1015 = _754;
    float _1017 = _756;
    float _1019 = _706 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _1021 = _916 * _744;
    float _1023 = _1013 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1025 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _1027 = _1015 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1029 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _1031 = _1017 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1033 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _1035 = _1019 * _1021;
    float _1037 = _916 * _648;
    float _1039 = -_1027;
    float _1041 = fma(_904, _1025, _1039);
    float _1043 = -_1031;
    float _1045 = fma(_1019, _1029, _1043);
    float _1047 = -_1023;
    float _1049 = fma(_914, _1033, _1047);
    float _1051 = fma(_1037, (*spvDescriptorSet0.fp_c4)._m0[7].z, _1035);
    float _1053 = fma(_934, _1041, _1027);
    float _1055 = fma(_934, _1045, _1031);
    float _1057 = fma(_934, _1049, _1023);
    float _1059 = precise::max(0.0, _908);
    float _1061 = -_910;
    float _1063 = _1061 + 1.0;
    float _1065 = -_912;
    float _1067 = _1065 + 1.0;
    float _1069 = -_916;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_1057, _1063, _932);
    float _1075 = fma(_1053, _1067, _936);
    float _1077 = fma(_1055, _1071, _1051);
    float _1079 = -_1059;
    float _1081 = _1079 + 1.0;
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    out.m_51.x = _1073;
    out.m_51.y = _1075;
    out.m_51.z = _1077;
    out.m_51.w = _1083;
    return out;
}

