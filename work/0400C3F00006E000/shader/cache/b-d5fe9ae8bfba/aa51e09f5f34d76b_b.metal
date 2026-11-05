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
    float _94 = fma(_86, _92, _88);
    float _96 = fma(_86, _92, _84);
    float _98 = _94 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1042 = float2(_96, _94);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1042, float2(0.0), isnan(_1042))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1042, float2(0.0), isnan(_1042))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _1059 = float2(_100, _98);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1059, float2(0.0), isnan(_1059))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1059, float2(0.0), isnan(_1059))).xyz;
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
    float _298 = in.m_44.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _292 * _292;
    float _306 = fma(_118, _278, _294);
    float _308 = in.m_44.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_296, _296, _304);
    float _316 = fma(_306, _306, _314);
    float _318 = rsqrt(_316);
    float _320 = _76 * _290;
    float _322 = -_128;
    float _324 = fma(_292, _318, _322);
    float _326 = -_130;
    float _328 = fma(_296, _318, _326);
    float _330 = -_132;
    float _332 = fma(_306, _318, _330);
    float _334 = 1.0 / _320;
    float _336 = fma(_324, (*spvDescriptorSet0.fp_c4)._m0[0].z, _128);
    float _338 = fma(_328, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _340 = fma(_332, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _342 = _76 * _302;
    float _344 = _336 * _336;
    float _346 = _76 * _312;
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
    float2 _1438 = float2(_366, _368);
    float _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1438, float2(0.0), isnan(_1438))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1438, float2(0.0), isnan(_1438))).x;
    float _372 = in.m_46.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_46.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_46.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = _354 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _392 = _354 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _394 = _354 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _396 = _354 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _398 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[7].x, _390);
    float _400 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[5].x, _392);
    float _402 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[4].x, _394);
    float _404 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[6].x, _396);
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
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[7].z, _398);
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[5].z, _400);
    float _444 = _440 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _446 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[4].z, _402);
    float _448 = _442 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _450 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[6].z, _404);
    float _452 = _446 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _454 = 1.0 / _444;
    float _456 = _450 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _458 = -_406;
    float _460 = fma(_448, _454, _458);
    float _462 = -_408;
    float _464 = fma(_452, _454, _462);
    float _466 = -_410;
    float _468 = fma(_456, _454, _466);
    float _470 = _434 * _460;
    float _472 = fma(_432, _464, _470);
    float _474 = fma(_436, _468, _472);
    bool _476 = _474 > 0.0;
    float _478 = _448;
    float _480 = _454;
    float _482 = _394;
    float _484 = 1.0;
    float _486 = _398;
    float _488 = _400;
    float _490 = _402;
    float _492 = _406;
    float _494 = _408;
    float _496 = _410;
    if (_476)
    {
        float2 _1641 = float2(_358, _360);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1641, float2(0.0), isnan(_1641))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1641, float2(0.0), isnan(_1641))).xyz;
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
    float _512 = _358;
    if (_476)
    {
        float2 _1665 = float2(_358, _360);
        float _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1665, float2(0.0), isnan(_1665))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1665, float2(0.0), isnan(_1665))).x;
        _512 = _514;
    }
    float _516 = _512;
    float _518 = _336 * _356;
    float _520 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _522 = -_434;
    float _524 = _518 * _522;
    float _526 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _520);
    float _528 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _526);
    float _530 = rsqrt(_528);
    float _532 = _530 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _534 = _530 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _536 = _530 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _538 = -_432;
    float _540 = fma(_362, _538, _524);
    float _542 = -_532;
    float _544 = _434 + _542;
    float _546 = -_534;
    float _548 = _432 + _546;
    float _550 = -_536;
    float _552 = _436 + _550;
    float _554 = -_436;
    float _556 = fma(_364, _554, _540);
    float _558 = _544 * _544;
    float _560 = _556 + _556;
    float _562 = fma(_548, _548, _558);
    float _564 = -_560;
    float _566 = -_434;
    float _568 = fma(_518, _564, _566);
    float _570 = fma(_552, _552, _562);
    float _572 = -_560;
    float _574 = -_432;
    float _576 = fma(_362, _572, _574);
    float _578 = -_560;
    float _580 = -_436;
    float _582 = fma(_364, _578, _580);
    float _584 = rsqrt(_570);
    float _586 = abs(_576);
    float _588 = abs(_568);
    float _590 = precise::max(_586, _588);
    float _592 = abs(_582);
    float _594 = precise::max(_592, _590);
    float _596 = 1.0 / _594;
    float _598 = _544 * _584;
    float _600 = _548 * _584;
    float _602 = _552 * _584;
    float _604 = _518 * _598;
    float _606 = fma(_362, _600, _604);
    float _608 = _576 * _596;
    float _610 = _568 * _596;
    float _612 = _582 * _596;
    float _614 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1828 = float4(_608, _610, _612, float(0));
    float4 _1832 = select(_1828, float4(0.0), isnan(_1828));
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1832.xyz, uint(rint(_1832.w)), level(_614)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1832.xyz, uint(rint(_1832.w)), level(_614)).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = _506;
    float _626 = _508;
    float _628 = _510;
    if (!_476)
    {
        float2 _1851 = float2(_366, _368);
        float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1851, float2(0.0), isnan(_1851))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1851, float2(0.0), isnan(_1851))).xyz;
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
    float _644 = fma(_364, _602, _606);
    float _646 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _648 = -_532;
    float _650 = _518 * _648;
    float _652 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _654 = _518 * _434;
    float _656 = precise::max(_644, 9.9999999392252902907785028219223e-09);
    float _658 = -_534;
    float _660 = fma(_362, _658, _650);
    float _662 = _646 * _646;
    float _664 = _662 * 0.5;
    float _666 = fma(_362, _432, _654);
    float _668 = _656 * _656;
    float _670 = -_536;
    float _672 = fma(_364, _670, _660);
    float _674 = fma(_364, _436, _666);
    float _676 = -_664;
    float _678 = _676 + 1.0;
    float _680 = fma(_652, _652, -1.0);
    float _682 = precise::max(_672, 9.9999999392252902907785028219223e-09);
    float _684 = 0.0 + _672;
    float _686 = precise::clamp(_684, 0.0, 1.0);
    float _688 = precise::max(_674, 9.9999999392252902907785028219223e-09);
    float _690 = fma(_668, _680, 1.0);
    float _692 = fma(_682, _678, _664);
    float _694 = fma(_688, _678, _664);
    float _696 = precise::max(_690, 9.9999999392252902907785028219223e-09);
    float _698 = 1.0 / _692;
    float _700 = fma(_688, -5.554729938507080078125, -6.9831600189208984375);
    float _702 = 1.0 / _696;
    float _704 = _688 * _700;
    float _706 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _708 = 1.0 + _706;
    float _710 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _712 = 1.0 + _710;
    float _714 = 1.0 / _694;
    float _716 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _718 = 1.0 + _716;
    float _720 = exp2(_704);
    float _722 = _652 * _702;
    float _724 = _722 * _722;
    float _726 = _698 * _714;
    float _728 = _724 * 0.3183098733425140380859375;
    float _730 = _686 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _732 = _728 * _726;
    float _734 = _732 * 0.25;
    float _736 = _686 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _738 = fma(_708, _720, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _740 = fma(_712, _720, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _742 = fma(_718, _720, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _744 = _686 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _746 = _738 * _734;
    float _748 = _740 * _734;
    float _750 = _742 * _734;
    float _752 = _744 * _746;
    float _754 = _736 * _748;
    float _756 = _730 * _750;
    float _758 = _746;
    if (_476)
    {
        float _760 = fma(_516, 2.0, -1.0);
        _484 = _760;
    }
    float _762 = _484;
    float _764 = _762;
    if (_476)
    {
        float _766 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[7].z, _398);
        _486 = _766;
    }
    float _768 = _486;
    float _770 = _768;
    if (_476)
    {
        float _772 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[5].z, _400);
        _488 = _772;
    }
    float _774 = _488;
    float _776 = _774;
    if (_476)
    {
        float _778 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[4].z, _402);
        _490 = _778;
    }
    float _780 = _490;
    if (_476)
    {
        float _782 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[6].z, _404);
        _764 = _782;
    }
    float _784 = _764;
    float _786 = _784;
    if (_476)
    {
        float _788 = _768 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _758 = _788;
    }
    float _790 = _758;
    if (_476)
    {
        float _792 = _774 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _776 = _792;
    }
    float _794 = _776;
    if (_476)
    {
        float _796 = _780 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _770 = _796;
    }
    float _798 = _770;
    if (_476)
    {
        float _800 = _784 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _786 = _800;
    }
    float _802 = _786;
    float _804 = _790;
    if (_476)
    {
        float _806 = 1.0 / _790;
        _804 = _806;
    }
    float _808 = _804;
    if (_476)
    {
        float _810 = -_406;
        float _812 = fma(_794, _808, _810);
        _492 = _812;
    }
    float _814 = _492;
    float _816 = _814;
    if (!_476)
    {
        _816 = _460;
    }
    float _818 = _816;
    if (_476)
    {
        float _820 = -_408;
        float _822 = fma(_798, _808, _820);
        _494 = _822;
    }
    float _824 = _494;
    float _826 = _824;
    if (!_476)
    {
        _826 = _464;
    }
    float _828 = _826;
    if (_476)
    {
        float _830 = -_410;
        float _832 = fma(_802, _808, _830);
        _496 = _832;
    }
    float _834 = _496;
    float _836 = _834;
    if (!_476)
    {
        _836 = _468;
    }
    float _838 = _836;
    float _840 = _818 * _818;
    float _842 = fma(_828, _828, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = sqrt(_844);
    float _848 = _738 * _618;
    float _850 = _740 * _620;
    float _852 = -_738;
    float _854 = _852 + 1.0;
    float _856 = _638 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _858 = fma(_848, (*spvDescriptorSet0.fp_c4)._m0[7].x, _752);
    float _860 = fma(_850, (*spvDescriptorSet0.fp_c4)._m0[7].y, _754);
    float _862 = _742 * _622;
    float _864 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _866 = _846 + _864;
    float _868 = fma(_856, _854, _858);
    float _870 = -_740;
    float _872 = _870 + 1.0;
    float _874 = _640 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _876 = fma(_862, (*spvDescriptorSet0.fp_c4)._m0[7].z, _756);
    float _878 = -_742;
    float _880 = _878 + 1.0;
    float _882 = _866 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _884 = precise::clamp(_882, 0.0, 1.0);
    float _886 = _642 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _888 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _890 = _868 + _888;
    float _892 = fma(_874, _872, _860);
    float _894 = _884 * 3.0;
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = fma(_886, _880, _876);
    float _900 = -_884;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _906 = _892 + _904;
    float _908 = fma(_896, _890, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _910 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _912 = _898 + _910;
    float _914 = abs(_884);
    float _916 = log2(_914);
    float _918 = fma(_896, _906, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _920 = fma(_896, _912, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _922 = precise::max(_908, 9.9999999392252902907785028219223e-09);
    float _924 = precise::max(_918, 9.9999999392252902907785028219223e-09);
    float _926 = precise::max(_920, 9.9999999392252902907785028219223e-09);
    float _928 = sqrt(_922);
    float _930 = _916 * 0.100000001490116119384765625;
    float _932 = sqrt(_924);
    float _934 = sqrt(_926);
    float _936 = fma(_902, (*spvDescriptorSet0.fp_c4)._m0[13].x, _928);
    float _938 = exp2(_930);
    float _940 = fma(_902, (*spvDescriptorSet0.fp_c4)._m0[13].y, _932);
    float _942 = -_940;
    float _944 = _918 + _942;
    float _946 = fma(_902, (*spvDescriptorSet0.fp_c4)._m0[13].z, _934);
    float _948 = _884 * 5.0;
    float _950 = -_936;
    float _952 = _908 + _950;
    float _954 = -_946;
    float _956 = _920 + _954;
    float _958 = fma(_938, _952, _936);
    float _960 = fma(_938, _944, _940);
    float _962 = fma(_938, _956, _946);
    float _964 = precise::min(_948, 1.0);
    out.m_49.x = _958;
    out.m_49.y = _960;
    out.m_49.z = _962;
    out.m_49.w = _964;
    return out;
}

