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
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_42.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _82 = _80 * 0.15915493667125701904296875;
    float _84 = _76 * _68;
    float _86 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _88 = _76 * _74;
    float _90 = _82 * 6.283185482025146484375;
    float _92 = sin(_90);
    float _94 = fma(_86, _92, _84);
    float _96 = fma(_86, _92, _88);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1108 = float2(_94, _96);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1108, float2(0.0), isnan(_1108))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1108, float2(0.0), isnan(_1108))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _1125 = float2(_98, _100);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1125, float2(0.0), isnan(_1125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1125, float2(0.0), isnan(_1125))).xyz;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _108 * _108;
    float _122 = fma(_106, _106, _120);
    float _124 = fma(_110, _110, _122);
    float _126 = rsqrt(_124);
    float _128 = _108 * _126;
    float _130 = _106 * _126;
    float _132 = _110 * _126;
    float _134 = _128 * _128;
    float _136 = fma(_130, _130, _134);
    float _138 = sqrt(_136);
    bool _142 = _138 >= 0.00999999977648258209228515625;
    bool _144 = isnan(_138);
    bool _146 = _142 || _144;
    bool _148 = isnan(0.00999999977648258209228515625);
    bool _150 = _146 || _148;
    float _152 = _96;
    float _154 = _124;
    float _156 = _134;
    float _158 = _138;
    if (!_150)
    {
        float _160 = fma(_132, _132, _134);
        _152 = _160;
    }
    float _162 = _152;
    float _164 = _130 * _116;
    float _166 = _128 * _116;
    if (!_150)
    {
        _154 = 0.0;
    }
    float _168 = _154;
    float _170 = _110;
    float _172 = _168;
    if (!_150)
    {
        float _174 = rsqrt(_162);
        _170 = _174;
    }
    float _176 = _170;
    float _178 = _176;
    if (!_150)
    {
        float _180 = _132 * _176;
        _156 = _180;
    }
    float _182 = _156;
    float _184 = _182;
    if (!_150)
    {
        float _186 = _128 * _176;
        _178 = _186;
    }
    float _188 = _178;
    float _190 = 0.0;
    float _192 = _188;
    if (!_150)
    {
        float _194 = _132 * _182;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = 0.0;
    float _200 = _196;
    if (!_150)
    {
        float _202 = fma(_130, _188, -0.0);
        _198 = _202;
    }
    float _204 = _198;
    float _206 = _204;
    if (!_150)
    {
        float _208 = _130 * _182;
        _158 = _208;
    }
    float _210 = _158;
    float _212 = _210;
    if (!_150)
    {
        float _214 = -_188;
        float _216 = -_196;
        float _218 = fma(_128, _214, _216);
        _200 = _218;
    }
    float _220 = _200;
    float _222 = _220;
    if (!_150)
    {
        float _224 = -_188;
        float _226 = (-0.0) + _224;
        _192 = _226;
    }
    float _228 = _192;
    bool _230 = !_150;
    float _232 = _228;
    if (!_230)
    {
        float _234 = rsqrt(_136);
        float _236 = _128 * _234;
        float _238 = -_234;
        float _240 = _130 * _238;
        float _242 = _132 * _236;
        float _244 = _130 * _240;
        float _246 = _132 * _240;
        float _248 = _242 * _242;
        float _250 = -_244;
        float _252 = fma(_128, _236, _250);
        float _254 = fma(_246, _246, _248);
        float _256 = fma(_252, _252, _254);
        float _258 = rsqrt(_256);
        float _260 = _246 * _258;
        float _262 = _252 * _258;
        float _264 = -_242;
        float _266 = fma(_264, _258, -0.0);
        _206 = _240;
        _222 = _236;
        _184 = _266;
        _172 = _260;
        _212 = 0.0;
        _232 = _262;
    }
    float _268 = _206;
    float _270 = _222;
    float _272 = _184;
    float _274 = _172;
    float _276 = _212;
    float _278 = _232;
    float _280 = fma(_114, _268, _166);
    float _282 = fma(_114, _270, _164);
    float _284 = _132 * _116;
    float _286 = in.m_44.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_118, _272, _280);
    float _294 = fma(_118, _274, _282);
    float _296 = fma(_114, _276, _284);
    float _298 = in.m_44.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _292 * _292;
    float _306 = in.m_46.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = fma(_118, _278, _296);
    float _314 = in.m_46.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = fma(_294, _294, _304);
    float _322 = in.m_46.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_312, _312, _320);
    float _330 = rsqrt(_328);
    float _332 = _76 * _290;
    float _334 = -_128;
    float _336 = fma(_292, _330, _334);
    float _338 = -_130;
    float _340 = fma(_294, _330, _338);
    float _342 = -_132;
    float _344 = fma(_312, _330, _342);
    float _346 = _76 * _302;
    float _348 = fma(_336, (*spvDescriptorSet0.fp_c4)._m0[0].z, _128);
    float _350 = fma(_340, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _352 = _332 * _332;
    float _354 = fma(_344, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _356 = _348 * _348;
    float _358 = _76 * _310;
    float _360 = fma(_346, _346, _352);
    float _362 = fma(_350, _350, _356);
    float _364 = 1.0 / _358;
    float _366 = _76 * _318;
    float _368 = fma(_354, _354, _362);
    float _370 = sqrt(_360);
    float _372 = _76 * _326;
    float _374 = rsqrt(_368);
    float _376 = _366 * _364;
    float _378 = _372 * _364;
    float _380 = fma(_376, 0.5, 0.5);
    float _382 = fma(_378, -0.5, 0.5);
    float _384 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _386 = fma(_370, (*spvDescriptorSet0.fp_c4)._m0[1].x, _384);
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _350 * _374;
    float _392 = _354 * _374;
    float _394 = -_390;
    float _396 = fma(_388, _394, _390);
    float _398 = -_392;
    float _400 = fma(_388, _398, _392);
    float _402 = fma(_396, 0.0199999995529651641845703125, _380);
    float _404 = fma(_400, 0.0199999995529651641845703125, _382);
    float2 _1556 = float2(_402, _404);
    float _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1556, float2(0.0), isnan(_1556))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1556, float2(0.0), isnan(_1556))).x;
    float _408 = in.m_44.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = -_346;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _418 = _378 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _420 = _378 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _422 = _378 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _424 = -_332;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _428 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[4].x, _418);
    float _430 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[6].x, _420);
    float _432 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[7].x, _422);
    float _434 = _76 * _412;
    float _436 = -_434;
    float _438 = _436 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _440 = _438 * _438;
    float _442 = fma(_416, _416, _440);
    float _444 = _378 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _446 = fma(_426, _426, _442);
    float _448 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[5].x, _444);
    float _450 = rsqrt(_446);
    float _452 = _438 * _450;
    float _454 = _416 * _450;
    float _456 = _426 * _450;
    float _458 = fma(_406, 2.0, -1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[7].z, _432);
    float _462 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].z, _448);
    float _464 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _428);
    float _468 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _470 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _430);
    float _472 = _466 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _474 = 1.0 / _464;
    float _476 = _470 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _478 = -_434;
    float _480 = fma(_468, _474, _478);
    float _482 = -_346;
    float _484 = fma(_472, _474, _482);
    float _486 = -_332;
    float _488 = fma(_476, _474, _486);
    float _490 = _452 * _480;
    float _492 = fma(_454, _484, _490);
    float _494 = fma(_456, _488, _492);
    bool _496 = _494 > 0.0;
    float _498 = _476;
    float _500 = _468;
    float _502 = _474;
    float _504 = 1.0;
    float _506 = _432;
    float _508 = _448;
    float _510 = _428;
    float _512 = _434;
    float _514 = _346;
    float _516 = _332;
    if (_496)
    {
        float2 _1739 = float2(_380, _382);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1739, float2(0.0), isnan(_1739))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1739, float2(0.0), isnan(_1739))).xyz;
        float _520 = _518.x;
        float _522 = _518.y;
        float _524 = _518.z;
        _498 = _520;
        _500 = _522;
        _502 = _524;
    }
    float _526 = _498;
    float _528 = _500;
    float _530 = _502;
    float _532 = _382;
    if (_496)
    {
        float2 _1763 = float2(_380, _382);
        float _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1763, float2(0.0), isnan(_1763))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1763, float2(0.0), isnan(_1763))).x;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _540 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _538);
    float _542 = _348 * _374;
    float _544 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _540);
    float _546 = -_542;
    float _548 = _546 + 1.0;
    float _550 = fma(_388, _548, _542);
    float _552 = rsqrt(_544);
    float _554 = -_452;
    float _556 = _550 * _554;
    float _558 = -_454;
    float _560 = fma(_396, _558, _556);
    float _562 = -_456;
    float _564 = fma(_400, _562, _560);
    float _566 = _564 + _564;
    float _568 = _552 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _570 = _552 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _572 = _552 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _574 = -_566;
    float _576 = -_452;
    float _578 = fma(_550, _574, _576);
    float _580 = -_568;
    float _582 = _452 + _580;
    float _584 = -_570;
    float _586 = _454 + _584;
    float _588 = -_572;
    float _590 = _456 + _588;
    float _592 = -_566;
    float _594 = -_454;
    float _596 = fma(_396, _592, _594);
    float _598 = _582 * _582;
    float _600 = fma(_586, _586, _598);
    float _602 = fma(_590, _590, _600);
    float _604 = rsqrt(_602);
    float _606 = _582 * _604;
    float _608 = -_566;
    float _610 = -_456;
    float _612 = fma(_400, _608, _610);
    float _614 = abs(_596);
    float _616 = abs(_578);
    float _618 = precise::max(_614, _616);
    float _620 = _586 * _604;
    float _622 = _550 * _606;
    float _624 = _590 * _604;
    float _626 = abs(_612);
    float _628 = precise::max(_626, _618);
    float _630 = fma(_396, _620, _622);
    float _632 = 1.0 / _628;
    float _634 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _636 = _596 * _632;
    float _638 = _578 * _632;
    float _640 = _612 * _632;
    float4 _1934 = float4(_636, _638, _640, float(0));
    float4 _1938 = select(_1934, float4(0.0), isnan(_1934));
    float3 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1938.xyz, uint(rint(_1938.w)), level(_634)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1938.xyz, uint(rint(_1938.w)), level(_634)).xyz;
    float _644 = _642.x;
    float _646 = _642.y;
    float _648 = _642.z;
    float _650 = _526;
    float _652 = _528;
    float _654 = _530;
    if (!_496)
    {
        float2 _1957 = float2(_402, _404);
        float3 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1957, float2(0.0), isnan(_1957))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1957, float2(0.0), isnan(_1957))).xyz;
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
    float _670 = fma(_400, _624, _630);
    float _672 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _674 = -_568;
    float _676 = _550 * _674;
    float _678 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _680 = _550 * _452;
    float _682 = precise::max(_670, 9.9999999392252902907785028219223e-09);
    float _684 = -_570;
    float _686 = fma(_396, _684, _676);
    float _688 = _672 * _672;
    float _690 = _688 * 0.5;
    float _692 = fma(_396, _454, _680);
    float _694 = fma(_678, _678, -1.0);
    float _696 = _682 * _682;
    float _698 = fma(_400, _456, _692);
    float _700 = -_572;
    float _702 = fma(_400, _700, _686);
    float _704 = fma(_696, _694, 1.0);
    float _706 = -_690;
    float _708 = _706 + 1.0;
    float _710 = precise::max(_702, 9.9999999392252902907785028219223e-09);
    float _712 = 0.0 + _702;
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = precise::max(_704, 9.9999999392252902907785028219223e-09);
    float _718 = precise::max(_698, 9.9999999392252902907785028219223e-09);
    float _720 = fma(_710, _708, _690);
    float _722 = 1.0 / _716;
    float _724 = fma(_718, -5.554729938507080078125, -6.9831600189208984375);
    float _726 = fma(_718, _708, _690);
    float _728 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _730 = 1.0 + _728;
    float _732 = _718 * _724;
    float _734 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _736 = 1.0 + _734;
    float _738 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _740 = 1.0 + _738;
    float _742 = 1.0 / _720;
    float _744 = _678 * _722;
    float _746 = exp2(_732);
    float _748 = _744 * _744;
    float _750 = _748 * 0.3183098733425140380859375;
    float _752 = 1.0 / _726;
    float _754 = fma(_730, _746, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _756 = fma(_736, _746, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _758 = fma(_740, _746, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _760 = _742 * _752;
    float _762 = _750 * _760;
    float _764 = _762 * 0.25;
    float _766 = _732;
    if (_496)
    {
        float _768 = fma(_536, 2.0, -1.0);
        _504 = _768;
    }
    float _770 = _504;
    float _772 = _770;
    if (_496)
    {
        float _774 = fma(_770, (*spvDescriptorSet0.fp_c3)._m0[7].z, _432);
        _506 = _774;
    }
    float _776 = _506;
    float _778 = _776;
    if (_496)
    {
        float _780 = fma(_770, (*spvDescriptorSet0.fp_c3)._m0[5].z, _448);
        _508 = _780;
    }
    float _782 = _508;
    float _784 = _782;
    if (_496)
    {
        float _786 = fma(_770, (*spvDescriptorSet0.fp_c3)._m0[4].z, _428);
        _510 = _786;
    }
    float _788 = _510;
    float _790 = _788;
    if (_496)
    {
        float _792 = fma(_770, (*spvDescriptorSet0.fp_c3)._m0[6].z, _430);
        _772 = _792;
    }
    float _794 = _772;
    if (_496)
    {
        float _796 = _776 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _778 = _796;
    }
    float _798 = _778;
    if (_496)
    {
        float _800 = _782 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _784 = _800;
    }
    float _802 = _784;
    if (_496)
    {
        float _804 = _788 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _766 = _804;
    }
    float _806 = _766;
    if (_496)
    {
        float _808 = _794 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _790 = _808;
    }
    float _810 = _790;
    float _812 = _798;
    if (_496)
    {
        float _814 = 1.0 / _798;
        _812 = _814;
    }
    float _816 = _812;
    if (_496)
    {
        float _818 = -_434;
        float _820 = fma(_802, _816, _818);
        _512 = _820;
    }
    float _822 = _512;
    float _824 = _822;
    if (!_496)
    {
        _824 = _480;
    }
    float _826 = _824;
    if (_496)
    {
        float _828 = -_346;
        float _830 = fma(_806, _816, _828);
        _514 = _830;
    }
    float _832 = _514;
    float _834 = _832;
    if (!_496)
    {
        _834 = _484;
    }
    float _836 = _834;
    if (_496)
    {
        float _838 = -_332;
        float _840 = fma(_810, _816, _838);
        _516 = _840;
    }
    float _842 = _516;
    float _844 = _842;
    if (!_496)
    {
        _844 = _488;
    }
    float _846 = _844;
    float _848 = _826 * _826;
    float _850 = _714 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _852 = _714 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _854 = _714 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _856 = fma(_836, _836, _848);
    float _858 = _756 * _764;
    float _860 = fma(_846, _846, _856);
    float _862 = sqrt(_860);
    float _864 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _866 = _862 + _864;
    float _868 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _870 = _862 + _868;
    float _872 = _866 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _874 = precise::clamp(_872, 0.0, 1.0);
    float _876 = _754 * _764;
    float _878 = _758 * _764;
    float _880 = _870 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _852 * _876;
    float _886 = abs(_874);
    float _888 = log2(_886);
    float _890 = _854 * _878;
    float _892 = _888 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _894 = exp2(_892);
    float _896 = _754 * _644;
    float _898 = _850 * _858;
    float _900 = _756 * _646;
    float _902 = _664 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _904 = fma(_896, (*spvDescriptorSet0.fp_c4)._m0[7].x, _884);
    float _906 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _908 = fma(_900, (*spvDescriptorSet0.fp_c4)._m0[7].y, _898);
    float _910 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _912 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _914 = _666 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _916 = _668 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _918 = -_902;
    float _920 = fma(_852, _910, _918);
    float _922 = _758 * _648;
    float _924 = -_914;
    float _926 = fma(_850, _906, _924);
    float _928 = -_916;
    float _930 = fma(_854, _912, _928);
    float _932 = fma(_894, _920, _902);
    float _934 = -_754;
    float _936 = _934 + 1.0;
    float _938 = fma(_922, (*spvDescriptorSet0.fp_c4)._m0[7].z, _890);
    float _940 = fma(_894, _926, _914);
    float _942 = fma(_894, _930, _916);
    float _944 = -_756;
    float _946 = _944 + 1.0;
    float _948 = -_758;
    float _950 = _948 + 1.0;
    float _952 = fma(_932, _936, _904);
    float _954 = _882 * 3.0;
    float _956 = precise::clamp(_954, 0.0, 1.0);
    float _958 = fma(_940, _946, _908);
    float _960 = fma(_942, _950, _938);
    float _962 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _964 = _952 + _962;
    float _966 = abs(_882);
    float _968 = log2(_966);
    float _970 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _972 = _958 + _970;
    float _974 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _976 = _960 + _974;
    float _978 = fma(_956, _964, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _980 = fma(_956, _972, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _982 = fma(_956, _976, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _984 = precise::max(_978, 9.9999999392252902907785028219223e-09);
    float _986 = precise::max(_980, 9.9999999392252902907785028219223e-09);
    float _988 = precise::max(_982, 9.9999999392252902907785028219223e-09);
    float _990 = sqrt(_984);
    float _992 = _968 * 0.100000001490116119384765625;
    float _994 = -_882;
    float _996 = _994 + 1.0;
    float _998 = sqrt(_986);
    float _1000 = sqrt(_988);
    float _1002 = fma(_996, (*spvDescriptorSet0.fp_c4)._m0[13].x, _990);
    float _1004 = -_1002;
    float _1006 = _978 + _1004;
    float _1008 = exp2(_992);
    float _1010 = fma(_996, (*spvDescriptorSet0.fp_c4)._m0[13].y, _998);
    float _1012 = fma(_996, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1000);
    float _1014 = _882 * 5.0;
    float _1016 = -_1010;
    float _1018 = _980 + _1016;
    float _1020 = -_1012;
    float _1022 = _982 + _1020;
    float _1024 = fma(_1008, _1006, _1002);
    float _1026 = fma(_1008, _1018, _1010);
    float _1028 = fma(_1008, _1022, _1012);
    float _1030 = precise::min(_1014, 1.0);
    out.m_49.x = _1024;
    out.m_49.y = _1026;
    out.m_49.z = _1028;
    out.m_49.w = _1030;
    return out;
}

