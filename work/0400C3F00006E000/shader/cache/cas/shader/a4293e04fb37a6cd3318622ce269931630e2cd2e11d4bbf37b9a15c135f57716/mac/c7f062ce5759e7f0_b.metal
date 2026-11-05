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
    float _80 = _76 * _74;
    float _82 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _82 * 0.15915493667125701904296875;
    float _88 = _76 * _68;
    float _90 = _86 * 6.283185482025146484375;
    float _92 = sin(_90);
    float _94 = fma(_84, _92, _88);
    float _96 = fma(_84, _92, _80);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1038 = float2(_94, _96);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1038, float2(0.0), isnan(_1038))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1038, float2(0.0), isnan(_1038))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _1055 = float2(_98, _100);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1055, float2(0.0), isnan(_1055))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1055, float2(0.0), isnan(_1055))).xyz;
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
    float _362 = _76 * _318;
    float _364 = fma(_350, _350, _356);
    float _366 = 1.0 / _358;
    float _368 = fma(_354, _354, _364);
    float _370 = sqrt(_360);
    float _372 = _76 * _326;
    float _374 = rsqrt(_368);
    float _376 = _362 * _366;
    float _378 = _372 * _366;
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
    float2 _1486 = float2(_402, _404);
    float _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1486, float2(0.0), isnan(_1486))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1486, float2(0.0), isnan(_1486))).x;
    float _408 = in.m_44.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = -_346;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _418 = -_332;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _422 = _378 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _424 = _378 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _426 = _378 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _428 = _378 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _430 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[4].x, _422);
    float _432 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[5].x, _424);
    float _434 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[6].x, _426);
    float _436 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[7].x, _428);
    float _438 = _76 * _412;
    float _440 = -_438;
    float _442 = _440 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _444 = _442 * _442;
    float _446 = fma(_416, _416, _444);
    float _448 = fma(_420, _420, _446);
    float _450 = rsqrt(_448);
    float _452 = _416 * _450;
    float _454 = _442 * _450;
    float _456 = _420 * _450;
    float _458 = fma(_406, 2.0, -1.0);
    float _460 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[7].z, _436);
    float _462 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
    float _464 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _466 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _430);
    float _468 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _470 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _434);
    float _472 = _466 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _474 = 1.0 / _464;
    float _476 = _470 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _478 = -_438;
    float _480 = fma(_468, _474, _478);
    float _482 = -_346;
    float _484 = fma(_472, _474, _482);
    float _486 = -_332;
    float _488 = fma(_476, _474, _486);
    float _490 = _454 * _480;
    float _492 = fma(_452, _484, _490);
    float _494 = fma(_456, _488, _492);
    bool _496 = _494 > 0.0;
    float _498 = _476;
    float _500 = _474;
    float _502 = _350;
    float _504 = _436;
    float _506 = _432;
    float _508 = _430;
    float _510 = _434;
    float _512 = _438;
    float _514 = _346;
    float _516 = _332;
    if (_496)
    {
        float2 _1670 = float2(_380, _382);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1670, float2(0.0), isnan(_1670))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1670, float2(0.0), isnan(_1670))).xyz;
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
    float _532 = _380;
    if (_496)
    {
        float2 _1694 = float2(_380, _382);
        float _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1694, float2(0.0), isnan(_1694))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1694, float2(0.0), isnan(_1694))).x;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = _348 * _374;
    float _540 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _542 = -_538;
    float _544 = _542 + 1.0;
    float _546 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _540);
    float _548 = fma(_388, _544, _538);
    float _550 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _546);
    float _552 = -_454;
    float _554 = _548 * _552;
    float _556 = -_452;
    float _558 = fma(_396, _556, _554);
    float _560 = rsqrt(_550);
    float _562 = -_456;
    float _564 = fma(_400, _562, _558);
    float _566 = _560 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _568 = _560 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _570 = _560 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _572 = -_566;
    float _574 = _454 + _572;
    float _576 = -_568;
    float _578 = _452 + _576;
    float _580 = -_570;
    float _582 = _456 + _580;
    float _584 = -_566;
    float _586 = _548 * _584;
    float _588 = _574 * _574;
    float _590 = -_568;
    float _592 = fma(_396, _590, _586);
    float _594 = fma(_578, _578, _588);
    float _596 = fma(_582, _582, _594);
    float _598 = rsqrt(_596);
    float _600 = _578 * _598;
    float _602 = _564 + _564;
    float _604 = _574 * _598;
    float _606 = _582 * _598;
    float _608 = -_602;
    float _610 = -_454;
    float _612 = fma(_548, _608, _610);
    float _614 = -_602;
    float _616 = -_452;
    float _618 = fma(_396, _614, _616);
    float _620 = -_602;
    float _622 = -_456;
    float _624 = fma(_400, _620, _622);
    float _626 = _548 * _604;
    float _628 = abs(_618);
    float _630 = abs(_612);
    float _632 = precise::max(_628, _630);
    float _634 = fma(_396, _600, _626);
    float _636 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _638 = abs(_624);
    float _640 = precise::max(_638, _632);
    float _642 = 1.0 / _640;
    float _644 = _618 * _642;
    float _646 = _612 * _642;
    float _648 = _624 * _642;
    float4 _1876 = float4(_644, _646, _648, float(0));
    float4 _1880 = select(_1876, float4(0.0), isnan(_1876));
    float3 _650 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1880.xyz, uint(rint(_1880.w)), level(_636)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1880.xyz, uint(rint(_1880.w)), level(_636)).xyz;
    float _652 = _650.x;
    float _654 = _650.y;
    float _656 = _650.z;
    float _658 = _526;
    float _660 = _528;
    float _662 = _530;
    if (!_496)
    {
        float2 _1899 = float2(_402, _404);
        float3 _664 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1899, float2(0.0), isnan(_1899))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1899, float2(0.0), isnan(_1899))).xyz;
        float _666 = _664.x;
        float _668 = _664.y;
        float _670 = _664.z;
        _658 = _666;
        _660 = _668;
        _662 = _670;
    }
    float _672 = _658;
    float _674 = _660;
    float _676 = _662;
    float _678 = fma(_400, _606, _634);
    float _680 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _682 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _684 = _548 * _454;
    float _686 = -_570;
    float _688 = fma(_400, _686, _592);
    float _690 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _692 = fma(_682, _682, -1.0);
    float _694 = fma(_396, _452, _684);
    float _696 = _680 * _680;
    float _698 = _696 * 0.5;
    float _700 = precise::max(_688, 9.9999999392252902907785028219223e-09);
    float _702 = _690 * _690;
    float _704 = fma(_400, _456, _694);
    float _706 = -_698;
    float _708 = _706 + 1.0;
    float _710 = fma(_702, _692, 1.0);
    float _712 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _714 = 1.0 + _712;
    float _716 = precise::max(_704, 9.9999999392252902907785028219223e-09);
    float _718 = fma(_700, _708, _698);
    float _720 = 0.0 + _688;
    float _722 = precise::clamp(_720, 0.0, 1.0);
    float _724 = precise::max(_710, 9.9999999392252902907785028219223e-09);
    float _726 = fma(_716, _708, _698);
    float _728 = fma(_716, -5.554729938507080078125, -6.9831600189208984375);
    float _730 = 1.0 / _718;
    float _732 = _716 * _728;
    float _734 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _736 = 1.0 + _734;
    float _738 = 1.0 / _724;
    float _740 = 1.0 / _726;
    float _742 = exp2(_732);
    float _744 = _682 * _738;
    float _746 = _730 * _740;
    float _748 = _744 * _744;
    float _750 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _752 = 1.0 + _750;
    float _754 = _748 * 0.3183098733425140380859375;
    float _756 = fma(_752, _742, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _758 = fma(_736, _742, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _760 = fma(_714, _742, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _762 = _754 * _746;
    float _764 = _762 * 0.25;
    float _766 = _758 * _764;
    float _768 = _536;
    float _770 = _754;
    if (_496)
    {
        float _772 = fma(_536, 2.0, -1.0);
        _768 = _772;
    }
    float _774 = _768;
    if (_496)
    {
        float _776 = fma(_774, (*spvDescriptorSet0.fp_c3)._m0[7].z, _436);
        _504 = _776;
    }
    float _778 = _504;
    float _780 = _778;
    if (_496)
    {
        float _782 = fma(_774, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
        _506 = _782;
    }
    float _784 = _506;
    float _786 = _784;
    if (_496)
    {
        float _788 = fma(_774, (*spvDescriptorSet0.fp_c3)._m0[4].z, _430);
        _508 = _788;
    }
    float _790 = _508;
    if (_496)
    {
        float _792 = fma(_774, (*spvDescriptorSet0.fp_c3)._m0[6].z, _434);
        _510 = _792;
    }
    float _794 = _510;
    float _796 = _794;
    if (_496)
    {
        float _798 = _778 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _780 = _798;
    }
    float _800 = _780;
    if (_496)
    {
        float _802 = _784 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _786 = _802;
    }
    float _804 = _786;
    if (_496)
    {
        float _806 = _790 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _770 = _806;
    }
    float _808 = _770;
    if (_496)
    {
        float _810 = _794 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _796 = _810;
    }
    float _812 = _796;
    float _814 = -(*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _816 = fma(_78, (*spvDescriptorSet0.fp_c4)._m0[1].z, _814);
    float _818 = _800;
    if (_496)
    {
        float _820 = 1.0 / _800;
        _818 = _820;
    }
    float _822 = _818;
    if (_496)
    {
        float _824 = -_438;
        float _826 = fma(_804, _822, _824);
        _512 = _826;
    }
    float _828 = _512;
    float _830 = _828;
    if (!_496)
    {
        _830 = _480;
    }
    float _832 = _830;
    if (_496)
    {
        float _834 = -_346;
        float _836 = fma(_808, _822, _834);
        _514 = _836;
    }
    float _838 = _514;
    float _840 = _838;
    if (!_496)
    {
        _840 = _484;
    }
    float _842 = _840;
    if (_496)
    {
        float _844 = -_332;
        float _846 = fma(_812, _822, _844);
        _516 = _846;
    }
    float _848 = _516;
    float _850 = _848;
    if (!_496)
    {
        _850 = _488;
    }
    float _852 = _850;
    float _854 = _832 * _832;
    float _856 = _722 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _858 = _722 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _860 = fma(_842, _842, _854);
    float _862 = fma(_852, _852, _860);
    float _864 = _756 * _764;
    float _866 = _760 * _764;
    float _868 = _856 * _864;
    float _870 = sqrt(_862);
    float _872 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _874 = _870 + _872;
    float _876 = _874 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _722 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _882 = _880 * _766;
    float _884 = abs(_878);
    float _886 = log2(_884);
    float _888 = _886 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _890 = exp2(_888);
    float _892 = _756 * _652;
    float _894 = _758 * _654;
    float _896 = _672 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _898 = _676 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _900 = fma(_892, (*spvDescriptorSet0.fp_c4)._m0[7].x, _868);
    float _902 = fma(_894, (*spvDescriptorSet0.fp_c4)._m0[7].y, _882);
    float _904 = _858 * _866;
    float _906 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _908 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _910 = _674 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _912 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _914 = _760 * _656;
    float _916 = -_896;
    float _918 = fma(_856, _906, _916);
    float _920 = -_910;
    float _922 = fma(_880, _908, _920);
    float _924 = -_898;
    float _926 = fma(_858, _912, _924);
    float _928 = fma(_914, (*spvDescriptorSet0.fp_c4)._m0[7].z, _904);
    float _930 = fma(_890, _918, _896);
    float _932 = fma(_890, _922, _910);
    float _934 = fma(_890, _926, _898);
    float _936 = -_756;
    float _938 = _936 + 1.0;
    float _940 = precise::max(0.0, _816);
    float _942 = -_758;
    float _944 = _942 + 1.0;
    float _946 = -_760;
    float _948 = _946 + 1.0;
    float _950 = fma(_930, _938, _900);
    float _952 = fma(_932, _944, _902);
    float _954 = fma(_934, _948, _928);
    float _956 = -_940;
    float _958 = _956 + 1.0;
    float _960 = precise::clamp(_958, 0.0, 1.0);
    out.m_49.x = _950;
    out.m_49.y = _952;
    out.m_49.z = _954;
    out.m_49.w = _960;
    return out;
}

