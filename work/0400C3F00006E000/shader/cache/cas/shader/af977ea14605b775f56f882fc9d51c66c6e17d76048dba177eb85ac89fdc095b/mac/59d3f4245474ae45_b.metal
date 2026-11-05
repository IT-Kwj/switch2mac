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
    float2 _1000 = float2(_96, _94);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1000, float2(0.0), isnan(_1000))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1000, float2(0.0), isnan(_1000))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float2 _1017 = float2(_100, _98);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1017, float2(0.0), isnan(_1017))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1017, float2(0.0), isnan(_1017))).xyz;
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
    float2 _1396 = float2(_366, _368);
    float _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1396, float2(0.0), isnan(_1396))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1396, float2(0.0), isnan(_1396))).x;
    float _372 = in.m_46.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_46.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_46.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = _354 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _392 = _354 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _394 = _354 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _396 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[5].x, _390);
    float _398 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[6].x, _392);
    float _400 = _76 * _376;
    float _402 = _76 * _382;
    float _404 = _76 * _388;
    float _406 = -_400;
    float _408 = _406 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _410 = -_402;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _414 = -_404;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _418 = _408 * _408;
    float _420 = fma(_412, _412, _418);
    float _422 = _354 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _424 = fma(_416, _416, _420);
    float _426 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[4].x, _422);
    float _428 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[7].x, _394);
    float _430 = rsqrt(_424);
    float _432 = _412 * _430;
    float _434 = _408 * _430;
    float _436 = _416 * _430;
    float _438 = fma(_370, 2.0, -1.0);
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[7].z, _428);
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[5].z, _396);
    float _444 = _440 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _446 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[4].z, _426);
    float _448 = _442 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _450 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[6].z, _398);
    float _452 = _446 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _454 = 1.0 / _444;
    float _456 = _450 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _458 = -_400;
    float _460 = fma(_448, _454, _458);
    float _462 = -_402;
    float _464 = fma(_452, _454, _462);
    float _466 = -_404;
    float _468 = fma(_456, _454, _466);
    float _470 = _434 * _460;
    float _472 = fma(_432, _464, _470);
    float _474 = fma(_436, _468, _472);
    bool _476 = _474 > 0.0;
    float _478 = _454;
    float _480 = _394;
    float _482 = _370;
    float _484 = 1.0;
    float _486 = _428;
    float _488 = _396;
    float _490 = _426;
    float _492 = _400;
    float _494 = _402;
    float _496 = _404;
    if (_476)
    {
        float2 _1599 = float2(_358, _360);
        float3 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1599, float2(0.0), isnan(_1599))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1599, float2(0.0), isnan(_1599))).xyz;
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
        float2 _1623 = float2(_358, _360);
        float _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1623, float2(0.0), isnan(_1623))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1623, float2(0.0), isnan(_1623))).x;
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
    float _572 = rsqrt(_570);
    float _574 = _544 * _572;
    float _576 = -_560;
    float _578 = -_432;
    float _580 = fma(_362, _576, _578);
    float _582 = -_560;
    float _584 = -_436;
    float _586 = fma(_364, _582, _584);
    float _588 = _548 * _572;
    float _590 = _518 * _574;
    float _592 = _552 * _572;
    float _594 = abs(_580);
    float _596 = abs(_568);
    float _598 = precise::max(_594, _596);
    float _600 = fma(_362, _588, _590);
    float _602 = abs(_586);
    float _604 = precise::max(_602, _598);
    float _606 = 1.0 / _604;
    float _608 = _568 * _606;
    float _610 = _580 * _606;
    float _612 = _586 * _606;
    float _614 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1786 = float4(_610, _608, _612, float(0));
    float4 _1790 = select(_1786, float4(0.0), isnan(_1786));
    float3 _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1790.xyz, uint(rint(_1790.w)), level(_614)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1790.xyz, uint(rint(_1790.w)), level(_614)).xyz;
    float _618 = _616.x;
    float _620 = _616.y;
    float _622 = _616.z;
    float _624 = _506;
    float _626 = _508;
    float _628 = _510;
    if (!_476)
    {
        float2 _1809 = float2(_366, _368);
        float3 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1809, float2(0.0), isnan(_1809))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1809, float2(0.0), isnan(_1809))).xyz;
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
    float _644 = fma(_364, _592, _600);
    float _646 = -_532;
    float _648 = _518 * _646;
    float _650 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _652 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _654 = _518 * _434;
    float _656 = precise::max(_644, 9.9999999392252902907785028219223e-09);
    float _658 = -_534;
    float _660 = fma(_362, _658, _648);
    float _662 = fma(_652, _652, -1.0);
    float _664 = fma(_362, _432, _654);
    float _666 = _650 * _650;
    float _668 = _666 * 0.5;
    float _670 = _656 * _656;
    float _672 = -_536;
    float _674 = fma(_364, _672, _660);
    float _676 = fma(_364, _436, _664);
    float _678 = fma(_670, _662, 1.0);
    float _680 = precise::max(_676, 9.9999999392252902907785028219223e-09);
    float _682 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = precise::max(_674, 9.9999999392252902907785028219223e-09);
    float _690 = fma(_680, -5.554729938507080078125, -6.9831600189208984375);
    float _692 = 0.0 + _674;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = 1.0 / _682;
    float _698 = fma(_688, _686, _668);
    float _700 = fma(_680, _686, _668);
    float _702 = _680 * _690;
    float _704 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _706 = 1.0 + _704;
    float _708 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _710 = 1.0 + _708;
    float _712 = 1.0 / _698;
    float _714 = _652 * _696;
    float _716 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _718 = 1.0 + _716;
    float _720 = 1.0 / _700;
    float _722 = _714 * _714;
    float _724 = _722 * 0.3183098733425140380859375;
    float _726 = exp2(_702);
    float _728 = _712 * _720;
    float _730 = _724 * _728;
    float _732 = _730 * 0.25;
    float _734 = fma(_706, _726, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _736 = fma(_710, _726, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _738 = fma(_718, _726, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _740 = _700;
    float _742 = _728;
    float _744 = _726;
    if (_476)
    {
        float _746 = fma(_516, 2.0, -1.0);
        _484 = _746;
    }
    float _748 = _484;
    float _750 = _748;
    if (_476)
    {
        float _752 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[7].z, _428);
        _486 = _752;
    }
    float _754 = _486;
    float _756 = _754;
    if (_476)
    {
        float _758 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[5].z, _396);
        _488 = _758;
    }
    float _760 = _488;
    if (_476)
    {
        float _762 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[4].z, _426);
        _490 = _762;
    }
    float _764 = _490;
    if (_476)
    {
        float _766 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[6].z, _398);
        _750 = _766;
    }
    float _768 = _750;
    if (_476)
    {
        float _770 = _754 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _756 = _770;
    }
    float _772 = _756;
    if (_476)
    {
        float _774 = _760 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _740 = _774;
    }
    float _776 = _740;
    if (_476)
    {
        float _778 = _764 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _742 = _778;
    }
    float _780 = _742;
    if (_476)
    {
        float _782 = _768 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _744 = _782;
    }
    float _784 = _744;
    float _786 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _788 = _772;
    if (_476)
    {
        float _790 = 1.0 / _772;
        _788 = _790;
    }
    float _792 = _788;
    if (_476)
    {
        float _794 = -_400;
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
        float _804 = -_402;
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
        float _814 = -_404;
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
    float _826 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _828 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _830 = fma(_812, _812, _824);
    float _832 = _736 * _732;
    float _834 = fma(_822, _822, _830);
    float _836 = sqrt(_834);
    float _838 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _840 = _836 + _838;
    float _842 = _840 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _844 = precise::clamp(_842, 0.0, 1.0);
    float _846 = _734 * _732;
    float _848 = _738 * _732;
    float _850 = _826 * _846;
    float _852 = abs(_844);
    float _854 = log2(_852);
    float _856 = _854 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _858 = exp2(_856);
    float _860 = _734 * _618;
    float _862 = _786 * _832;
    float _864 = _736 * _620;
    float _866 = _638 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _868 = fma(_860, (*spvDescriptorSet0.fp_c4)._m0[7].x, _850);
    float _870 = _640 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _872 = fma(_864, (*spvDescriptorSet0.fp_c4)._m0[7].y, _862);
    float _874 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _876 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _878 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _880 = _642 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _882 = _828 * _848;
    float _884 = -_866;
    float _886 = fma(_826, _874, _884);
    float _888 = _738 * _622;
    float _890 = -_870;
    float _892 = fma(_786, _876, _890);
    float _894 = -_880;
    float _896 = fma(_828, _878, _894);
    float _898 = fma(_858, _886, _866);
    float _900 = fma(_888, (*spvDescriptorSet0.fp_c4)._m0[7].z, _882);
    float _902 = fma(_858, _892, _870);
    float _904 = -_734;
    float _906 = _904 + 1.0;
    float _908 = fma(_858, _896, _880);
    float _910 = -_736;
    float _912 = _910 + 1.0;
    float _914 = -_738;
    float _916 = _914 + 1.0;
    float _918 = fma(_898, _906, _868);
    float _920 = fma(_902, _912, _872);
    float _922 = fma(_908, _916, _900);
    out.m_49.x = _918;
    out.m_49.y = _920;
    out.m_49.z = _922;
    out.m_49.w = 1.0;
    return out;
}

