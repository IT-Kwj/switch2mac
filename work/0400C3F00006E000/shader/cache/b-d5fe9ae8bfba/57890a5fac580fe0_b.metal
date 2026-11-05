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
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_42.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _82 = _78 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _84 = _76 * _68;
    float _86 = _80 * 0.15915493667125701904296875;
    float _88 = _76 * _74;
    float _90 = _86 * 6.283185482025146484375;
    float _92 = sin(_90);
    float _94 = fma(_82, _92, _84);
    float _96 = fma(_82, _92, _88);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1082 = float2(_96, _94);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1082, float2(0.0), isnan(_1082))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1082, float2(0.0), isnan(_1082))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _1099 = float2(_100, _98);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1099, float2(0.0), isnan(_1099))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1099, float2(0.0), isnan(_1099))).xyz;
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
    float _152 = 0.0;
    float _154 = _126;
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
    float _170 = _96;
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
        _212 = 0.0;
        _172 = _260;
        _232 = _262;
    }
    float _268 = _206;
    float _270 = _222;
    float _272 = _184;
    float _274 = _212;
    float _276 = _172;
    float _278 = _232;
    float _280 = fma(_114, _268, _166);
    float _282 = _132 * _116;
    float _284 = fma(_114, _270, _164);
    float _286 = in.m_44.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_118, _272, _280);
    float _294 = fma(_114, _274, _282);
    float _296 = fma(_118, _276, _284);
    float _298 = _292 * _292;
    float _300 = fma(_118, _278, _294);
    float _302 = in.m_44.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_296, _296, _298);
    float _310 = in.m_44.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_300, _300, _308);
    float _318 = rsqrt(_316);
    float _320 = _76 * _290;
    float _322 = -_128;
    float _324 = fma(_292, _318, _322);
    float _326 = -_130;
    float _328 = fma(_296, _318, _326);
    float _330 = -_132;
    float _332 = fma(_300, _318, _330);
    float _334 = 1.0 / _320;
    float _336 = fma(_324, (*spvDescriptorSet0.fp_c4)._m0[0].z, _128);
    float _338 = fma(_328, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _340 = fma(_332, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _342 = _76 * _306;
    float _344 = _336 * _336;
    float _346 = _76 * _314;
    float _348 = fma(_338, _338, _344);
    float _350 = fma(_340, _340, _348);
    float _352 = _342 * _334;
    float _354 = _346 * _334;
    float _356 = rsqrt(_350);
    float _358 = fma(_352, 0.5, 0.5);
    float _360 = fma(_354, -0.5, 0.5);
    float _362 = _338 * _356;
    float _364 = _340 * _356;
    float _366 = fma(_362, 0.0199999995529651641845703125, _358);
    float _368 = fma(_364, 0.0199999995529651641845703125, _360);
    float2 _1478 = float2(_366, _368);
    float _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1478, float2(0.0), isnan(_1478))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1478, float2(0.0), isnan(_1478))).x;
    float _372 = in.m_46.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_46.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_46.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = _354 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _392 = _354 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _394 = _354 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _396 = _354 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _398 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[4].x, _390);
    float _400 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[5].x, _392);
    float _402 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[6].x, _394);
    float _404 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[7].x, _396);
    float _406 = _76 * _376;
    float _408 = _76 * _382;
    float _410 = _76 * _388;
    float _412 = -_406;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _416 = -_408;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _420 = -_410;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _424 = _414 * _414;
    float _426 = fma(_418, _418, _424);
    float _428 = fma(_422, _422, _426);
    float _430 = rsqrt(_428);
    float _432 = _418 * _430;
    float _434 = _414 * _430;
    float _436 = _422 * _430;
    float _438 = fma(_370, 2.0, -1.0);
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[7].z, _404);
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[5].z, _400);
    float _444 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[6].z, _402);
    float _446 = _440 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _448 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[4].z, _398);
    float _450 = _442 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _452 = _444 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _454 = _448 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _456 = 1.0 / _446;
    float _458 = -_406;
    float _460 = fma(_450, _456, _458);
    float _462 = -_408;
    float _464 = fma(_454, _456, _462);
    float _466 = -_410;
    float _468 = fma(_452, _456, _466);
    float _470 = _434 * _460;
    float _472 = fma(_432, _464, _470);
    float _474 = fma(_436, _468, _472);
    bool _476 = _474 > 0.0;
    float _478 = _452;
    float _480 = _456;
    float _482 = _394;
    float _484 = 1.0;
    float _486 = _404;
    float _488 = _400;
    float _490 = _398;
    float _492 = _406;
    float _494 = _408;
    float _496 = _410;
    if (_476)
    {
        float2 _1681 = float2(_358, _360);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1681, float2(0.0), isnan(_1681))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1681, float2(0.0), isnan(_1681))).xyz;
        float _500 = _498.x;
        float _502 = _498.y;
        float _504 = _498.z;
        _478 = _500;
        _480 = _502;
        _482 = _504;
    }
    float _506 = _478;
    float _508 = _480;
    float _510 = _482;
    float _512 = _336 * _356;
    float _514 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _516 = -_434;
    float _518 = _512 * _516;
    float _520 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _514);
    float _522 = -_432;
    float _524 = fma(_362, _522, _518);
    float _526 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _520);
    float _528 = -_436;
    float _530 = fma(_364, _528, _524);
    float _532 = _530 + _530;
    float _534 = rsqrt(_526);
    float _536 = _534 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _538 = _534 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _540 = _534 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _542 = -_532;
    float _544 = -_434;
    float _546 = fma(_512, _542, _544);
    float _548 = -_536;
    float _550 = _434 + _548;
    float _552 = -_538;
    float _554 = _432 + _552;
    float _556 = _550 * _550;
    float _558 = fma(_554, _554, _556);
    float _560 = -_540;
    float _562 = _436 + _560;
    float _564 = fma(_562, _562, _558);
    float _566 = rsqrt(_564);
    float _568 = _550 * _566;
    float _570 = _554 * _566;
    float _572 = _562 * _566;
    float _574 = -_532;
    float _576 = -_432;
    float _578 = fma(_362, _574, _576);
    float _580 = -_532;
    float _582 = -_436;
    float _584 = fma(_364, _580, _582);
    float _586 = _512 * _568;
    float _588 = _568;
    if (_476)
    {
        float2 _1823 = float2(_358, _360);
        float _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1823, float2(0.0), isnan(_1823))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1823, float2(0.0), isnan(_1823))).x;
        _588 = _590;
    }
    float _592 = _588;
    float _594 = abs(_578);
    float _596 = abs(_546);
    float _598 = precise::max(_594, _596);
    float _600 = fma(_362, _570, _586);
    float _602 = abs(_584);
    float _604 = precise::max(_602, _598);
    float _606 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _608 = 1.0 / _604;
    float _610 = _578 * _608;
    float _612 = _546 * _608;
    float _614 = _584 * _608;
    float4 _1868 = float4(_610, _612, _614, float(0));
    float4 _1872 = select(_1868, float4(0.0), isnan(_1868));
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1872.xyz, uint(rint(_1872.w)), level(_606)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1872.xyz, uint(rint(_1872.w)), level(_606)).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = _506;
    float _626 = _508;
    float _628 = _510;
    if (!_476)
    {
        float2 _1891 = float2(_366, _368);
        float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1891, float2(0.0), isnan(_1891))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1891, float2(0.0), isnan(_1891))).xyz;
        float _632 = _630.x;
        float _634 = _630.y;
        float _636 = _630.z;
        _624 = _632;
        _626 = _634;
        _628 = _636;
    }
    float _638 = _624;
    float _640 = _626;
    float _642 = _628;
    float _644 = fma(_364, _572, _600);
    float _646 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _648 = -_536;
    float _650 = _512 * _648;
    float _652 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _654 = _512 * _434;
    float _656 = precise::max(_644, 9.9999999392252902907785028219223e-09);
    float _658 = -_538;
    float _660 = fma(_362, _658, _650);
    float _662 = _646 * _646;
    float _664 = _662 * 0.5;
    float _666 = fma(_362, _432, _654);
    float _668 = fma(_652, _652, -1.0);
    float _670 = _656 * _656;
    float _672 = fma(_364, _436, _666);
    float _674 = -_540;
    float _676 = fma(_364, _674, _660);
    float _678 = fma(_670, _668, 1.0);
    float _680 = -_664;
    float _682 = _680 + 1.0;
    float _684 = precise::max(_672, 9.9999999392252902907785028219223e-09);
    float _686 = precise::max(_676, 9.9999999392252902907785028219223e-09);
    float _688 = 0.0 + _676;
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _694 = fma(_684, _682, _664);
    float _696 = fma(_686, _682, _664);
    float _698 = 1.0 / _692;
    float _700 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _702 = 1.0 + _700;
    float _704 = fma(_684, -5.554729938507080078125, -6.9831600189208984375);
    float _706 = _684 * _704;
    float _708 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _710 = 1.0 + _708;
    float _712 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _714 = 1.0 + _712;
    float _716 = 1.0 / _696;
    float _718 = _652 * _698;
    float _720 = 1.0 / _694;
    float _722 = _718 * _718;
    float _724 = _722 * 0.3183098733425140380859375;
    float _726 = exp2(_706);
    float _728 = _716 * _720;
    float _730 = fma(_702, _726, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _732 = fma(_710, _726, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _734 = fma(_714, _726, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _736 = _724 * _728;
    float _738 = _736 * 0.25;
    float _740 = _724;
    float _742 = _694;
    if (_476)
    {
        float _744 = fma(_592, 2.0, -1.0);
        _484 = _744;
    }
    float _746 = _484;
    float _748 = _746;
    if (_476)
    {
        float _750 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[7].z, _404);
        _486 = _750;
    }
    float _752 = _486;
    float _754 = _752;
    if (_476)
    {
        float _756 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[5].z, _400);
        _488 = _756;
    }
    float _758 = _488;
    if (_476)
    {
        float _760 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[4].z, _398);
        _490 = _760;
    }
    float _762 = _490;
    float _764 = _762;
    if (_476)
    {
        float _766 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[6].z, _402);
        _748 = _766;
    }
    float _768 = _748;
    if (_476)
    {
        float _770 = _752 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _754 = _770;
    }
    float _772 = _754;
    if (_476)
    {
        float _774 = _758 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _740 = _774;
    }
    float _776 = _740;
    if (_476)
    {
        float _778 = _762 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _742 = _778;
    }
    float _780 = _742;
    if (_476)
    {
        float _782 = _768 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _764 = _782;
    }
    float _784 = _764;
    float _786 = _690 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _788 = _772;
    if (_476)
    {
        float _790 = 1.0 / _772;
        _788 = _790;
    }
    float _792 = _788;
    if (_476)
    {
        float _794 = -_406;
        float _796 = fma(_776, _792, _794);
        _492 = _796;
    }
    float _798 = _492;
    float _800 = _798;
    if (!_476)
    {
        _800 = _460;
    }
    float _802 = _800;
    if (_476)
    {
        float _804 = -_408;
        float _806 = fma(_780, _792, _804);
        _494 = _806;
    }
    float _808 = _494;
    float _810 = _808;
    if (!_476)
    {
        _810 = _464;
    }
    float _812 = _810;
    if (_476)
    {
        float _814 = -_410;
        float _816 = fma(_784, _792, _814);
        _496 = _816;
    }
    float _818 = _496;
    float _820 = _818;
    if (!_476)
    {
        _820 = _468;
    }
    float _822 = _820;
    float _824 = _802 * _802;
    float _826 = _732 * _738;
    float _828 = _730 * _618;
    float _830 = _732 * _620;
    float _832 = fma(_812, _812, _824);
    float _834 = _786 * _826;
    float _836 = _638 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _838 = _640 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _840 = fma(_822, _822, _832);
    float _842 = _690 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _844 = fma(_830, (*spvDescriptorSet0.fp_c4)._m0[7].y, _834);
    float _846 = _690 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _848 = _642 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _850 = -_732;
    float _852 = _850 + 1.0;
    float _854 = sqrt(_840);
    float _856 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _858 = _854 + _856;
    float _860 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _862 = _854 + _860;
    float _864 = _858 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _866 = precise::clamp(_864, 0.0, 1.0);
    float _868 = _730 * _738;
    float _870 = _734 * _738;
    float _872 = -_730;
    float _874 = _872 + 1.0;
    float _876 = _862 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _842 * _868;
    float _882 = abs(_866);
    float _884 = log2(_882);
    float _886 = _846 * _870;
    float _888 = fma(_828, (*spvDescriptorSet0.fp_c4)._m0[7].x, _880);
    float _890 = _734 * _622;
    float _892 = -_734;
    float _894 = _892 + 1.0;
    float _896 = fma(_890, (*spvDescriptorSet0.fp_c4)._m0[7].z, _886);
    float _898 = abs(_878);
    float _900 = log2(_898);
    float _902 = _884 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _904 = exp2(_902);
    float _906 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _908 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _910 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _912 = -_836;
    float _914 = fma(_842, _906, _912);
    float _916 = -_838;
    float _918 = fma(_786, _908, _916);
    float _920 = -_848;
    float _922 = fma(_846, _910, _920);
    float _924 = fma(_904, _914, _836);
    float _926 = fma(_904, _918, _838);
    float _928 = fma(_904, _922, _848);
    float _930 = fma(_924, _874, _888);
    float _932 = fma(_926, _852, _844);
    float _934 = fma(_928, _894, _896);
    float _936 = _878 * 3.0;
    float _938 = precise::clamp(_936, 0.0, 1.0);
    float _940 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _942 = _930 + _940;
    float _944 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _946 = _932 + _944;
    float _948 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _950 = _934 + _948;
    float _952 = fma(_938, _942, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _954 = fma(_938, _946, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _956 = fma(_938, _950, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _958 = _900 * 0.100000001490116119384765625;
    float _960 = -_878;
    float _962 = _960 + 1.0;
    float _964 = precise::max(_952, 9.9999999392252902907785028219223e-09);
    float _966 = precise::max(_954, 9.9999999392252902907785028219223e-09);
    float _968 = precise::max(_956, 9.9999999392252902907785028219223e-09);
    float _970 = sqrt(_964);
    float _972 = sqrt(_966);
    float _974 = sqrt(_968);
    float _976 = fma(_962, (*spvDescriptorSet0.fp_c4)._m0[13].x, _970);
    float _978 = -_976;
    float _980 = _952 + _978;
    float _982 = exp2(_958);
    float _984 = fma(_962, (*spvDescriptorSet0.fp_c4)._m0[13].y, _972);
    float _986 = -_984;
    float _988 = _954 + _986;
    float _990 = fma(_962, (*spvDescriptorSet0.fp_c4)._m0[13].z, _974);
    float _992 = _878 * 5.0;
    float _994 = -_990;
    float _996 = _956 + _994;
    float _998 = fma(_982, _980, _976);
    float _1000 = fma(_982, _988, _984);
    float _1002 = fma(_982, _996, _990);
    float _1004 = precise::min(_992, 1.0);
    out.m_49.x = _998;
    out.m_49.y = _1000;
    out.m_49.z = _1002;
    out.m_49.w = _1004;
    return out;
}

