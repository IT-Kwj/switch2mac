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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _54 = gl_FragCoord.w;
    float _56 = in.m_40.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_40.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float _74 = _70 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _76 = _72 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1009 = float2(_70, _72);
    float3 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1009, float2(0.0), isnan(_1009))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1009, float2(0.0), isnan(_1009))).xyz;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float2 _1026 = float2(_74, _76);
    float3 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1026, float2(0.0), isnan(_1026))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1026, float2(0.0), isnan(_1026))).xyz;
    float _90 = _88.x;
    float _92 = _88.y;
    float _94 = _88.z;
    float _96 = _84 * _84;
    float _98 = fma(_82, _82, _96);
    float _100 = fma(_86, _86, _98);
    float _102 = rsqrt(_100);
    float _104 = _84 * _102;
    float _106 = _82 * _102;
    float _108 = _86 * _102;
    float _110 = _104 * _104;
    float _112 = fma(_106, _106, _110);
    float _114 = sqrt(_112);
    bool _118 = _114 >= 0.00999999977648258209228515625;
    bool _120 = isnan(_114);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.00999999977648258209228515625);
    bool _126 = _122 || _124;
    float _128 = _86;
    float _130 = _84;
    float _132 = _102;
    float _134 = _114;
    if (!_126)
    {
        float _136 = fma(_108, _108, _110);
        _128 = _136;
    }
    float _138 = _128;
    float _140 = _110;
    if (!_126)
    {
        float _142 = rsqrt(_138);
        _140 = _142;
    }
    float _144 = _140;
    float _146 = _106 * _92;
    float _148 = _104 * _92;
    float _150 = _144;
    if (!_126)
    {
        float _152 = _108 * _144;
        _130 = _152;
    }
    float _154 = _130;
    float _156 = _154;
    if (!_126)
    {
        float _158 = _104 * _144;
        _132 = _158;
    }
    float _160 = _132;
    float _162 = _160;
    if (!_126)
    {
        _150 = 0.0;
    }
    float _164 = _150;
    float _166 = 0.0;
    float _168 = _164;
    if (!_126)
    {
        float _170 = _108 * _154;
        _166 = _170;
    }
    float _172 = _166;
    float _174 = 0.0;
    float _176 = _172;
    if (!_126)
    {
        float _178 = fma(_106, _160, -0.0);
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _180;
    if (!_126)
    {
        float _184 = _106 * _154;
        _134 = _184;
    }
    float _186 = _134;
    float _188 = _186;
    if (!_126)
    {
        float _190 = -_160;
        float _192 = -_172;
        float _194 = fma(_104, _190, _192);
        _176 = _194;
    }
    float _196 = _176;
    float _198 = _196;
    if (!_126)
    {
        float _200 = -_160;
        float _202 = (-0.0) + _200;
        _162 = _202;
    }
    float _204 = _162;
    bool _206 = !_126;
    float _208 = _204;
    if (!_206)
    {
        float _210 = rsqrt(_112);
        float _212 = _104 * _210;
        float _214 = -_210;
        float _216 = _106 * _214;
        float _218 = _108 * _212;
        float _220 = _106 * _216;
        float _222 = _108 * _216;
        float _224 = _218 * _218;
        float _226 = -_220;
        float _228 = fma(_104, _212, _226);
        float _230 = fma(_222, _222, _224);
        float _232 = fma(_228, _228, _230);
        float _234 = rsqrt(_232);
        float _236 = _222 * _234;
        float _238 = _228 * _234;
        float _240 = -_218;
        float _242 = fma(_240, _234, -0.0);
        _182 = _216;
        _198 = _212;
        _156 = _242;
        _168 = _236;
        _188 = 0.0;
        _208 = _238;
    }
    float _244 = _182;
    float _246 = _198;
    float _248 = _156;
    float _250 = _168;
    float _252 = _188;
    float _254 = _208;
    float _256 = fma(_90, _244, _148);
    float _258 = fma(_90, _246, _146);
    float _260 = _108 * _92;
    float _262 = in.m_42.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_94, _248, _256);
    float _270 = fma(_94, _250, _258);
    float _272 = fma(_90, _252, _260);
    float _274 = in.m_42.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = _268 * _268;
    float _282 = in.m_44.w;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = fma(_94, _254, _272);
    float _290 = in.m_44.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = fma(_270, _270, _280);
    float _298 = in.m_44.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = fma(_288, _288, _296);
    float _306 = rsqrt(_304);
    float _308 = _68 * _266;
    float _310 = -_104;
    float _312 = fma(_268, _306, _310);
    float _314 = -_106;
    float _316 = fma(_270, _306, _314);
    float _318 = -_108;
    float _320 = fma(_288, _306, _318);
    float _322 = _68 * _278;
    float _324 = fma(_312, (*spvDescriptorSet0.fp_c4)._m0[0].z, _104);
    float _326 = fma(_316, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _328 = _308 * _308;
    float _330 = fma(_320, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _332 = _324 * _324;
    float _334 = _68 * _286;
    float _336 = fma(_322, _322, _328);
    float _338 = _68 * _294;
    float _340 = fma(_326, _326, _332);
    float _342 = 1.0 / _334;
    float _344 = fma(_330, _330, _340);
    float _346 = sqrt(_336);
    float _348 = _68 * _302;
    float _350 = rsqrt(_344);
    float _352 = _338 * _342;
    float _354 = _348 * _342;
    float _356 = fma(_352, 0.5, 0.5);
    float _358 = fma(_354, -0.5, 0.5);
    float _360 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _362 = fma(_346, (*spvDescriptorSet0.fp_c4)._m0[1].x, _360);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _326 * _350;
    float _368 = _330 * _350;
    float _370 = -_366;
    float _372 = fma(_364, _370, _366);
    float _374 = -_368;
    float _376 = fma(_364, _374, _368);
    float _378 = fma(_372, 0.0199999995529651641845703125, _356);
    float _380 = fma(_376, 0.0199999995529651641845703125, _358);
    float2 _1458 = float2(_378, _380);
    float _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1458, float2(0.0), isnan(_1458))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1458, float2(0.0), isnan(_1458))).x;
    float _384 = in.m_42.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = -_322;
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _394 = -_308;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _398 = _354 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _400 = _354 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _402 = _354 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _404 = _354 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _406 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[4].x, _398);
    float _408 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[5].x, _400);
    float _410 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[6].x, _402);
    float _412 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[7].x, _404);
    float _414 = _68 * _388;
    float _416 = -_414;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _420 = _418 * _418;
    float _422 = fma(_392, _392, _420);
    float _424 = fma(_396, _396, _422);
    float _426 = rsqrt(_424);
    float _428 = _392 * _426;
    float _430 = _418 * _426;
    float _432 = _396 * _426;
    float _434 = fma(_382, 2.0, -1.0);
    float _436 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[7].z, _412);
    float _438 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[5].z, _408);
    float _440 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[6].z, _410);
    float _442 = _436 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _444 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[4].z, _406);
    float _446 = _438 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _448 = _440 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _450 = _444 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _452 = 1.0 / _442;
    float _454 = -_414;
    float _456 = fma(_446, _452, _454);
    float _458 = -_322;
    float _460 = fma(_450, _452, _458);
    float _462 = -_308;
    float _464 = fma(_448, _452, _462);
    float _466 = _430 * _456;
    float _468 = fma(_428, _460, _466);
    float _470 = fma(_432, _464, _468);
    bool _472 = _470 > 0.0;
    float _474 = _446;
    float _476 = _440;
    float _478 = _452;
    float _480 = 1.0;
    float _482 = _412;
    float _484 = _408;
    float _486 = _406;
    float _488 = _414;
    float _490 = _322;
    float _492 = _308;
    if (_472)
    {
        float2 _1641 = float2(_356, _358);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1641, float2(0.0), isnan(_1641))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1641, float2(0.0), isnan(_1641))).xyz;
        float _496 = _494.x;
        float _498 = _494.y;
        float _500 = _494.z;
        _474 = _496;
        _476 = _498;
        _478 = _500;
    }
    float _502 = _474;
    float _504 = _476;
    float _506 = _478;
    float _508 = _356;
    if (_472)
    {
        float2 _1665 = float2(_356, _358);
        float _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1665, float2(0.0), isnan(_1665))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1665, float2(0.0), isnan(_1665))).x;
        _508 = _510;
    }
    float _512 = _508;
    float _514 = _324 * _350;
    float _516 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _518 = -_514;
    float _520 = _518 + 1.0;
    float _522 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _516);
    float _524 = fma(_364, _520, _514);
    float _526 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _522);
    float _528 = -_430;
    float _530 = _524 * _528;
    float _532 = -_428;
    float _534 = fma(_372, _532, _530);
    float _536 = rsqrt(_526);
    float _538 = -_432;
    float _540 = fma(_376, _538, _534);
    float _542 = _540 + _540;
    float _544 = -_542;
    float _546 = -_430;
    float _548 = fma(_524, _544, _546);
    float _550 = _536 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _552 = _536 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _554 = _536 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _556 = -_550;
    float _558 = _430 + _556;
    float _560 = -_552;
    float _562 = _428 + _560;
    float _564 = -_554;
    float _566 = _432 + _564;
    float _568 = _558 * _558;
    float _570 = fma(_562, _562, _568);
    float _572 = fma(_566, _566, _570);
    float _574 = -_542;
    float _576 = -_428;
    float _578 = fma(_372, _574, _576);
    float _580 = rsqrt(_572);
    float _582 = _558 * _580;
    float _584 = _562 * _580;
    float _586 = _566 * _580;
    float _588 = -_542;
    float _590 = -_432;
    float _592 = fma(_376, _588, _590);
    float _594 = abs(_578);
    float _596 = abs(_548);
    float _598 = precise::max(_594, _596);
    float _600 = _524 * _582;
    float _602 = abs(_592);
    float _604 = precise::max(_602, _598);
    float _606 = fma(_372, _584, _600);
    float _608 = 1.0 / _604;
    float _610 = _578 * _608;
    float _612 = _548 * _608;
    float _614 = _592 * _608;
    float _616 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1836 = float4(_610, _612, _614, float(0));
    float4 _1840 = select(_1836, float4(0.0), isnan(_1836));
    float3 _618 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1840.xyz, uint(rint(_1840.w)), level(_616)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1840.xyz, uint(rint(_1840.w)), level(_616)).xyz;
    float _620 = _618.x;
    float _622 = _618.y;
    float _624 = _618.z;
    float _626 = _502;
    float _628 = _504;
    float _630 = _506;
    if (!_472)
    {
        float2 _1859 = float2(_378, _380);
        float3 _632 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1859, float2(0.0), isnan(_1859))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1859, float2(0.0), isnan(_1859))).xyz;
        float _634 = _632.x;
        float _636 = _632.y;
        float _638 = _632.z;
        _626 = _634;
        _628 = _636;
        _630 = _638;
    }
    float _640 = _626;
    float _642 = _628;
    float _644 = _630;
    float _646 = fma(_376, _586, _606);
    float _648 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _650 = -_550;
    float _652 = _524 * _650;
    float _654 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _656 = _524 * _430;
    float _658 = precise::max(_646, 9.9999999392252902907785028219223e-09);
    float _660 = -_552;
    float _662 = fma(_372, _660, _652);
    float _664 = _648 * _648;
    float _666 = _664 * 0.5;
    float _668 = fma(_372, _428, _656);
    float _670 = _658 * _658;
    float _672 = -_554;
    float _674 = fma(_376, _672, _662);
    float _676 = fma(_376, _432, _668);
    float _678 = -_666;
    float _680 = _678 + 1.0;
    float _682 = fma(_654, _654, -1.0);
    float _684 = precise::max(_674, 9.9999999392252902907785028219223e-09);
    float _686 = 0.0 + _674;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = precise::max(_676, 9.9999999392252902907785028219223e-09);
    float _692 = fma(_670, _682, 1.0);
    float _694 = fma(_684, _680, _666);
    float _696 = fma(_690, _680, _666);
    float _698 = precise::max(_692, 9.9999999392252902907785028219223e-09);
    float _700 = 1.0 / _694;
    float _702 = fma(_690, -5.554729938507080078125, -6.9831600189208984375);
    float _704 = 1.0 / _698;
    float _706 = _690 * _702;
    float _708 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _710 = 1.0 + _708;
    float _712 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _714 = 1.0 + _712;
    float _716 = 1.0 / _696;
    float _718 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _720 = 1.0 + _718;
    float _722 = exp2(_706);
    float _724 = _654 * _704;
    float _726 = _724 * _724;
    float _728 = _700 * _716;
    float _730 = _726 * 0.3183098733425140380859375;
    float _732 = _688 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _734 = _730 * _728;
    float _736 = _734 * 0.25;
    float _738 = _688 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _740 = fma(_710, _722, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _742 = fma(_714, _722, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _744 = fma(_720, _722, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _746 = _688 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _748 = _740 * _736;
    float _750 = _742 * _736;
    float _752 = _744 * _736;
    float _754 = _746 * _748;
    float _756 = _738 * _750;
    float _758 = _732 * _752;
    float _760 = _748;
    if (_472)
    {
        float _762 = fma(_512, 2.0, -1.0);
        _480 = _762;
    }
    float _764 = _480;
    float _766 = _764;
    if (_472)
    {
        float _768 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[7].z, _412);
        _482 = _768;
    }
    float _770 = _482;
    float _772 = _770;
    if (_472)
    {
        float _774 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[5].z, _408);
        _484 = _774;
    }
    float _776 = _484;
    float _778 = _776;
    if (_472)
    {
        float _780 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[4].z, _406);
        _486 = _780;
    }
    float _782 = _486;
    float _784 = _782;
    if (_472)
    {
        float _786 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[6].z, _410);
        _766 = _786;
    }
    float _788 = _766;
    if (_472)
    {
        float _790 = _770 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _760 = _790;
    }
    float _792 = _760;
    if (_472)
    {
        float _794 = _776 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _778 = _794;
    }
    float _796 = _778;
    if (_472)
    {
        float _798 = _782 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _784 = _798;
    }
    float _800 = _784;
    if (_472)
    {
        float _802 = _788 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _772 = _802;
    }
    float _804 = _772;
    float _806 = _792;
    if (_472)
    {
        float _808 = 1.0 / _792;
        _806 = _808;
    }
    float _810 = _806;
    if (_472)
    {
        float _812 = -_414;
        float _814 = fma(_796, _810, _812);
        _488 = _814;
    }
    float _816 = _488;
    float _818 = _816;
    if (!_472)
    {
        _818 = _456;
    }
    float _820 = _818;
    if (_472)
    {
        float _822 = -_322;
        float _824 = fma(_800, _810, _822);
        _490 = _824;
    }
    float _826 = _490;
    float _828 = _826;
    if (!_472)
    {
        _828 = _460;
    }
    float _830 = _828;
    if (_472)
    {
        float _832 = -_308;
        float _834 = fma(_804, _810, _832);
        _492 = _834;
    }
    float _836 = _492;
    float _838 = _836;
    if (!_472)
    {
        _838 = _464;
    }
    float _840 = _838;
    float _842 = _820 * _820;
    float _844 = fma(_830, _830, _842);
    float _846 = fma(_840, _840, _844);
    float _848 = sqrt(_846);
    float _850 = _740 * _620;
    float _852 = _742 * _622;
    float _854 = -_740;
    float _856 = _854 + 1.0;
    float _858 = _640 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _860 = fma(_850, (*spvDescriptorSet0.fp_c4)._m0[7].x, _754);
    float _862 = fma(_852, (*spvDescriptorSet0.fp_c4)._m0[7].y, _756);
    float _864 = _744 * _624;
    float _866 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _868 = _848 + _866;
    float _870 = fma(_858, _856, _860);
    float _872 = -_742;
    float _874 = _872 + 1.0;
    float _876 = _642 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _878 = fma(_864, (*spvDescriptorSet0.fp_c4)._m0[7].z, _758);
    float _880 = -_744;
    float _882 = _880 + 1.0;
    float _884 = _868 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _886 = precise::clamp(_884, 0.0, 1.0);
    float _888 = _644 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _890 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _892 = _870 + _890;
    float _894 = fma(_876, _874, _862);
    float _896 = _886 * 3.0;
    float _898 = precise::clamp(_896, 0.0, 1.0);
    float _900 = fma(_888, _882, _878);
    float _902 = -_886;
    float _904 = _902 + 1.0;
    float _906 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _908 = _894 + _906;
    float _910 = fma(_898, _892, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _912 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _914 = _900 + _912;
    float _916 = abs(_886);
    float _918 = log2(_916);
    float _920 = fma(_898, _908, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _922 = fma(_898, _914, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _924 = precise::max(_910, 9.9999999392252902907785028219223e-09);
    float _926 = precise::max(_920, 9.9999999392252902907785028219223e-09);
    float _928 = precise::max(_922, 9.9999999392252902907785028219223e-09);
    float _930 = _886 * 5.0;
    float _932 = sqrt(_924);
    float _934 = _918 * 0.100000001490116119384765625;
    float _936 = sqrt(_926);
    float _938 = sqrt(_928);
    float _940 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[13].x, _932);
    float _942 = -_940;
    float _944 = _910 + _942;
    float _946 = exp2(_934);
    float _948 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[13].y, _936);
    float _950 = -_948;
    float _952 = _920 + _950;
    float _954 = fma(_904, (*spvDescriptorSet0.fp_c4)._m0[13].z, _938);
    float _956 = -_954;
    float _958 = _922 + _956;
    float _960 = fma(_946, _944, _940);
    float _962 = fma(_946, _952, _948);
    float _964 = fma(_946, _958, _954);
    float _966 = precise::min(_930, 1.0);
    out.m_47.x = _960;
    out.m_47.y = _962;
    out.m_47.z = _964;
    out.m_47.w = _966;
    return out;
}

