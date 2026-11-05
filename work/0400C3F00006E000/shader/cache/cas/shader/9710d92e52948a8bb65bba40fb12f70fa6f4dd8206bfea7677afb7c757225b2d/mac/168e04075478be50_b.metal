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
    float _82 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _84 = _76 * _74;
    float _86 = _80 * 0.15915493667125701904296875;
    float _88 = _76 * _68;
    float _90 = _86 * 6.283185482025146484375;
    float _92 = sin(_90);
    float _94 = fma(_82, _92, _88);
    float _96 = fma(_82, _92, _84);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1068 = float2(_94, _96);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1068, float2(0.0), isnan(_1068))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1068, float2(0.0), isnan(_1068))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _1085 = float2(_98, _100);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1085, float2(0.0), isnan(_1085))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1085, float2(0.0), isnan(_1085))).xyz;
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
    float2 _1516 = float2(_402, _404);
    float _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1516, float2(0.0), isnan(_1516))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1516, float2(0.0), isnan(_1516))).x;
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
    float _464 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[6].z, _434);
    float _466 = _460 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _468 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[4].z, _430);
    float _470 = _462 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _472 = _464 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _474 = _468 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _476 = 1.0 / _466;
    float _478 = -_438;
    float _480 = fma(_470, _476, _478);
    float _482 = -_346;
    float _484 = fma(_474, _476, _482);
    float _486 = -_332;
    float _488 = fma(_472, _476, _486);
    float _490 = _454 * _480;
    float _492 = fma(_452, _484, _490);
    float _494 = fma(_456, _488, _492);
    bool _496 = _494 > 0.0;
    float _498 = _470;
    float _500 = _464;
    float _502 = _476;
    float _504 = 1.0;
    float _506 = _436;
    float _508 = _432;
    float _510 = _430;
    float _512 = _438;
    float _514 = _346;
    float _516 = _332;
    if (_496)
    {
        float2 _1699 = float2(_380, _382);
        float3 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1699, float2(0.0), isnan(_1699))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1699, float2(0.0), isnan(_1699))).xyz;
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
        float2 _1723 = float2(_380, _382);
        float _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1723, float2(0.0), isnan(_1723))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1723, float2(0.0), isnan(_1723))).x;
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
    float _566 = _564 + _564;
    float _568 = -_566;
    float _570 = -_454;
    float _572 = fma(_548, _568, _570);
    float _574 = _560 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _576 = _560 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _578 = _560 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _580 = -_574;
    float _582 = _454 + _580;
    float _584 = -_576;
    float _586 = _452 + _584;
    float _588 = -_578;
    float _590 = _456 + _588;
    float _592 = _582 * _582;
    float _594 = fma(_586, _586, _592);
    float _596 = fma(_590, _590, _594);
    float _598 = -_566;
    float _600 = -_452;
    float _602 = fma(_396, _598, _600);
    float _604 = rsqrt(_596);
    float _606 = _582 * _604;
    float _608 = _586 * _604;
    float _610 = _590 * _604;
    float _612 = -_566;
    float _614 = -_456;
    float _616 = fma(_400, _612, _614);
    float _618 = abs(_602);
    float _620 = abs(_572);
    float _622 = precise::max(_618, _620);
    float _624 = _548 * _606;
    float _626 = abs(_616);
    float _628 = precise::max(_626, _622);
    float _630 = fma(_396, _608, _624);
    float _632 = 1.0 / _628;
    float _634 = _602 * _632;
    float _636 = _572 * _632;
    float _638 = _616 * _632;
    float _640 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1894 = float4(_634, _636, _638, float(0));
    float4 _1898 = select(_1894, float4(0.0), isnan(_1894));
    float3 _642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1898.xyz, uint(rint(_1898.w)), level(_640)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1898.xyz, uint(rint(_1898.w)), level(_640)).xyz;
    float _644 = _642.x;
    float _646 = _642.y;
    float _648 = _642.z;
    float _650 = _526;
    float _652 = _528;
    float _654 = _530;
    if (!_496)
    {
        float2 _1917 = float2(_402, _404);
        float3 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1917, float2(0.0), isnan(_1917))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1917, float2(0.0), isnan(_1917))).xyz;
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
    float _670 = fma(_400, _610, _630);
    float _672 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _674 = -_574;
    float _676 = _548 * _674;
    float _678 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _680 = _548 * _454;
    float _682 = precise::max(_670, 9.9999999392252902907785028219223e-09);
    float _684 = -_576;
    float _686 = fma(_396, _684, _676);
    float _688 = _672 * _672;
    float _690 = _688 * 0.5;
    float _692 = fma(_396, _452, _680);
    float _694 = _682 * _682;
    float _696 = -_578;
    float _698 = fma(_400, _696, _686);
    float _700 = fma(_400, _456, _692);
    float _702 = -_690;
    float _704 = _702 + 1.0;
    float _706 = fma(_678, _678, -1.0);
    float _708 = precise::max(_698, 9.9999999392252902907785028219223e-09);
    float _710 = 0.0 + _698;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = precise::max(_700, 9.9999999392252902907785028219223e-09);
    float _716 = fma(_694, _706, 1.0);
    float _718 = fma(_708, _704, _690);
    float _720 = fma(_714, _704, _690);
    float _722 = precise::max(_716, 9.9999999392252902907785028219223e-09);
    float _724 = 1.0 / _718;
    float _726 = fma(_714, -5.554729938507080078125, -6.9831600189208984375);
    float _728 = 1.0 / _722;
    float _730 = _714 * _726;
    float _732 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _734 = 1.0 + _732;
    float _736 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _738 = 1.0 + _736;
    float _740 = 1.0 / _720;
    float _742 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _744 = 1.0 + _742;
    float _746 = exp2(_730);
    float _748 = _678 * _728;
    float _750 = _748 * _748;
    float _752 = _724 * _740;
    float _754 = _750 * 0.3183098733425140380859375;
    float _756 = _712 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _758 = _754 * _752;
    float _760 = _758 * 0.25;
    float _762 = _712 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _764 = fma(_734, _746, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _766 = fma(_738, _746, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _768 = fma(_744, _746, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _770 = _712 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _772 = _764 * _760;
    float _774 = _766 * _760;
    float _776 = _768 * _760;
    float _778 = _770 * _772;
    float _780 = _762 * _774;
    float _782 = _756 * _776;
    float _784 = _772;
    if (_496)
    {
        float _786 = fma(_536, 2.0, -1.0);
        _504 = _786;
    }
    float _788 = _504;
    float _790 = _788;
    if (_496)
    {
        float _792 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[7].z, _436);
        _506 = _792;
    }
    float _794 = _506;
    float _796 = _794;
    if (_496)
    {
        float _798 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
        _508 = _798;
    }
    float _800 = _508;
    float _802 = _800;
    if (_496)
    {
        float _804 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[4].z, _430);
        _510 = _804;
    }
    float _806 = _510;
    float _808 = _806;
    if (_496)
    {
        float _810 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[6].z, _434);
        _790 = _810;
    }
    float _812 = _790;
    if (_496)
    {
        float _814 = _794 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _784 = _814;
    }
    float _816 = _784;
    if (_496)
    {
        float _818 = _800 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _802 = _818;
    }
    float _820 = _802;
    if (_496)
    {
        float _822 = _806 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _808 = _822;
    }
    float _824 = _808;
    if (_496)
    {
        float _826 = _812 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _796 = _826;
    }
    float _828 = _796;
    float _830 = _816;
    if (_496)
    {
        float _832 = 1.0 / _816;
        _830 = _832;
    }
    float _834 = _830;
    if (_496)
    {
        float _836 = -_438;
        float _838 = fma(_820, _834, _836);
        _512 = _838;
    }
    float _840 = _512;
    float _842 = _840;
    if (!_496)
    {
        _842 = _480;
    }
    float _844 = _842;
    if (_496)
    {
        float _846 = -_346;
        float _848 = fma(_824, _834, _846);
        _514 = _848;
    }
    float _850 = _514;
    float _852 = _850;
    if (!_496)
    {
        _852 = _484;
    }
    float _854 = _852;
    if (_496)
    {
        float _856 = -_332;
        float _858 = fma(_828, _834, _856);
        _516 = _858;
    }
    float _860 = _516;
    float _862 = _860;
    if (!_496)
    {
        _862 = _488;
    }
    float _864 = _862;
    float _866 = _844 * _844;
    float _868 = fma(_854, _854, _866);
    float _870 = fma(_864, _864, _868);
    float _872 = sqrt(_870);
    float _874 = _764 * _644;
    float _876 = _766 * _646;
    float _878 = -_764;
    float _880 = _878 + 1.0;
    float _882 = _664 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _884 = fma(_874, (*spvDescriptorSet0.fp_c4)._m0[7].x, _778);
    float _886 = fma(_876, (*spvDescriptorSet0.fp_c4)._m0[7].y, _780);
    float _888 = _768 * _648;
    float _890 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _892 = _872 + _890;
    float _894 = fma(_882, _880, _884);
    float _896 = -_766;
    float _898 = _896 + 1.0;
    float _900 = _666 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _902 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[7].z, _782);
    float _904 = -_768;
    float _906 = _904 + 1.0;
    float _908 = _892 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _910 = precise::clamp(_908, 0.0, 1.0);
    float _912 = _668 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _914 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _916 = _894 + _914;
    float _918 = fma(_900, _898, _886);
    float _920 = _910 * 3.0;
    float _922 = precise::clamp(_920, 0.0, 1.0);
    float _924 = fma(_912, _906, _902);
    float _926 = -_910;
    float _928 = _926 + 1.0;
    float _930 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _932 = _918 + _930;
    float _934 = fma(_922, _916, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _936 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _938 = _924 + _936;
    float _940 = abs(_910);
    float _942 = log2(_940);
    float _944 = fma(_922, _932, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _946 = fma(_922, _938, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _948 = precise::max(_934, 9.9999999392252902907785028219223e-09);
    float _950 = precise::max(_944, 9.9999999392252902907785028219223e-09);
    float _952 = precise::max(_946, 9.9999999392252902907785028219223e-09);
    float _954 = _910 * 5.0;
    float _956 = sqrt(_948);
    float _958 = _942 * 0.100000001490116119384765625;
    float _960 = sqrt(_950);
    float _962 = sqrt(_952);
    float _964 = fma(_928, (*spvDescriptorSet0.fp_c4)._m0[13].x, _956);
    float _966 = -_964;
    float _968 = _934 + _966;
    float _970 = exp2(_958);
    float _972 = fma(_928, (*spvDescriptorSet0.fp_c4)._m0[13].y, _960);
    float _974 = -_972;
    float _976 = _944 + _974;
    float _978 = fma(_928, (*spvDescriptorSet0.fp_c4)._m0[13].z, _962);
    float _980 = -_978;
    float _982 = _946 + _980;
    float _984 = fma(_970, _968, _964);
    float _986 = fma(_970, _976, _972);
    float _988 = fma(_970, _982, _978);
    float _990 = precise::min(_954, 1.0);
    out.m_49.x = _984;
    out.m_49.y = _986;
    out.m_49.z = _988;
    out.m_49.w = _990;
    return out;
}

