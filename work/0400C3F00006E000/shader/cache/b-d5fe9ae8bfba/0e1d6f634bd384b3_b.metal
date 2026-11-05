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
    float2 _1049 = float2(_70, _72);
    float3 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1049, float2(0.0), isnan(_1049))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1049, float2(0.0), isnan(_1049))).xyz;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float2 _1066 = float2(_74, _76);
    float3 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1066, float2(0.0), isnan(_1066))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1066, float2(0.0), isnan(_1066))).xyz;
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
    float _338 = fma(_326, _326, _332);
    float _340 = 1.0 / _334;
    float _342 = _68 * _294;
    float _344 = fma(_330, _330, _338);
    float _346 = sqrt(_336);
    float _348 = _68 * _302;
    float _350 = rsqrt(_344);
    float _352 = _342 * _340;
    float _354 = _348 * _340;
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
    float2 _1498 = float2(_378, _380);
    float _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1498, float2(0.0), isnan(_1498))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1498, float2(0.0), isnan(_1498))).x;
    float _384 = in.m_42.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = -_322;
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _394 = _354 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _396 = _354 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _398 = _354 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _400 = -_308;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _404 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[4].x, _394);
    float _406 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[6].x, _396);
    float _408 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[7].x, _398);
    float _410 = _68 * _388;
    float _412 = -_410;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _416 = _414 * _414;
    float _418 = fma(_392, _392, _416);
    float _420 = _354 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _422 = fma(_402, _402, _418);
    float _424 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[5].x, _420);
    float _426 = rsqrt(_422);
    float _428 = _414 * _426;
    float _430 = _392 * _426;
    float _432 = _402 * _426;
    float _434 = fma(_382, 2.0, -1.0);
    float _436 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[7].z, _408);
    float _438 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[5].z, _424);
    float _440 = _436 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _442 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[4].z, _404);
    float _444 = _438 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _446 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[6].z, _406);
    float _448 = _442 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _450 = 1.0 / _440;
    float _452 = _446 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _454 = -_410;
    float _456 = fma(_444, _450, _454);
    float _458 = -_322;
    float _460 = fma(_448, _450, _458);
    float _462 = -_308;
    float _464 = fma(_452, _450, _462);
    float _466 = _428 * _456;
    float _468 = fma(_430, _460, _466);
    float _470 = fma(_432, _464, _468);
    bool _472 = _470 > 0.0;
    float _474 = _452;
    float _476 = _444;
    float _478 = _450;
    float _480 = 1.0;
    float _482 = _408;
    float _484 = _424;
    float _486 = _404;
    float _488 = _410;
    float _490 = _322;
    float _492 = _308;
    if (_472)
    {
        float2 _1681 = float2(_356, _358);
        float3 _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1681, float2(0.0), isnan(_1681))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1681, float2(0.0), isnan(_1681))).xyz;
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
    float _508 = _358;
    if (_472)
    {
        float2 _1705 = float2(_356, _358);
        float _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1705, float2(0.0), isnan(_1705))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1705, float2(0.0), isnan(_1705))).x;
        _508 = _510;
    }
    float _512 = _508;
    float _514 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _516 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _514);
    float _518 = _324 * _350;
    float _520 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _516);
    float _522 = -_518;
    float _524 = _522 + 1.0;
    float _526 = fma(_364, _524, _518);
    float _528 = rsqrt(_520);
    float _530 = -_428;
    float _532 = _526 * _530;
    float _534 = -_430;
    float _536 = fma(_372, _534, _532);
    float _538 = -_432;
    float _540 = fma(_376, _538, _536);
    float _542 = _540 + _540;
    float _544 = _528 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _546 = _528 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _548 = _528 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _550 = -_542;
    float _552 = -_428;
    float _554 = fma(_526, _550, _552);
    float _556 = -_544;
    float _558 = _428 + _556;
    float _560 = -_546;
    float _562 = _430 + _560;
    float _564 = -_548;
    float _566 = _432 + _564;
    float _568 = -_542;
    float _570 = -_430;
    float _572 = fma(_372, _568, _570);
    float _574 = _558 * _558;
    float _576 = fma(_562, _562, _574);
    float _578 = fma(_566, _566, _576);
    float _580 = rsqrt(_578);
    float _582 = _558 * _580;
    float _584 = -_542;
    float _586 = -_432;
    float _588 = fma(_376, _584, _586);
    float _590 = abs(_572);
    float _592 = abs(_554);
    float _594 = precise::max(_590, _592);
    float _596 = _562 * _580;
    float _598 = _526 * _582;
    float _600 = _566 * _580;
    float _602 = abs(_588);
    float _604 = precise::max(_602, _594);
    float _606 = fma(_372, _596, _598);
    float _608 = 1.0 / _604;
    float _610 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _612 = _572 * _608;
    float _614 = _554 * _608;
    float _616 = _588 * _608;
    float4 _1876 = float4(_612, _614, _616, float(0));
    float4 _1880 = select(_1876, float4(0.0), isnan(_1876));
    float3 _618 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1880.xyz, uint(rint(_1880.w)), level(_610)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1880.xyz, uint(rint(_1880.w)), level(_610)).xyz;
    float _620 = _618.x;
    float _622 = _618.y;
    float _624 = _618.z;
    float _626 = _502;
    float _628 = _504;
    float _630 = _506;
    if (!_472)
    {
        float2 _1899 = float2(_378, _380);
        float3 _632 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1899, float2(0.0), isnan(_1899))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1899, float2(0.0), isnan(_1899))).xyz;
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
    float _646 = fma(_376, _600, _606);
    float _648 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _650 = -_544;
    float _652 = _526 * _650;
    float _654 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _656 = _526 * _428;
    float _658 = precise::max(_646, 9.9999999392252902907785028219223e-09);
    float _660 = -_546;
    float _662 = fma(_372, _660, _652);
    float _664 = _648 * _648;
    float _666 = _664 * 0.5;
    float _668 = fma(_372, _430, _656);
    float _670 = fma(_654, _654, -1.0);
    float _672 = _658 * _658;
    float _674 = fma(_376, _432, _668);
    float _676 = -_548;
    float _678 = fma(_376, _676, _662);
    float _680 = fma(_672, _670, 1.0);
    float _682 = -_666;
    float _684 = _682 + 1.0;
    float _686 = precise::max(_678, 9.9999999392252902907785028219223e-09);
    float _688 = 0.0 + _678;
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = precise::max(_680, 9.9999999392252902907785028219223e-09);
    float _694 = precise::max(_674, 9.9999999392252902907785028219223e-09);
    float _696 = fma(_686, _684, _666);
    float _698 = 1.0 / _692;
    float _700 = fma(_694, -5.554729938507080078125, -6.9831600189208984375);
    float _702 = fma(_694, _684, _666);
    float _704 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _706 = 1.0 + _704;
    float _708 = _694 * _700;
    float _710 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _712 = 1.0 + _710;
    float _714 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _716 = 1.0 + _714;
    float _718 = 1.0 / _696;
    float _720 = _654 * _698;
    float _722 = exp2(_708);
    float _724 = _720 * _720;
    float _726 = _724 * 0.3183098733425140380859375;
    float _728 = 1.0 / _702;
    float _730 = fma(_706, _722, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _732 = fma(_712, _722, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _734 = fma(_716, _722, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _736 = _718 * _728;
    float _738 = _726 * _736;
    float _740 = _738 * 0.25;
    float _742 = _708;
    if (_472)
    {
        float _744 = fma(_512, 2.0, -1.0);
        _480 = _744;
    }
    float _746 = _480;
    float _748 = _746;
    if (_472)
    {
        float _750 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[7].z, _408);
        _482 = _750;
    }
    float _752 = _482;
    float _754 = _752;
    if (_472)
    {
        float _756 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[5].z, _424);
        _484 = _756;
    }
    float _758 = _484;
    float _760 = _758;
    if (_472)
    {
        float _762 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[4].z, _404);
        _486 = _762;
    }
    float _764 = _486;
    float _766 = _764;
    if (_472)
    {
        float _768 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[6].z, _406);
        _748 = _768;
    }
    float _770 = _748;
    if (_472)
    {
        float _772 = _752 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _754 = _772;
    }
    float _774 = _754;
    if (_472)
    {
        float _776 = _758 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _760 = _776;
    }
    float _778 = _760;
    if (_472)
    {
        float _780 = _764 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _742 = _780;
    }
    float _782 = _742;
    if (_472)
    {
        float _784 = _770 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _766 = _784;
    }
    float _786 = _766;
    float _788 = _774;
    if (_472)
    {
        float _790 = 1.0 / _774;
        _788 = _790;
    }
    float _792 = _788;
    if (_472)
    {
        float _794 = -_410;
        float _796 = fma(_778, _792, _794);
        _488 = _796;
    }
    float _798 = _488;
    float _800 = _798;
    if (!_472)
    {
        _800 = _456;
    }
    float _802 = _800;
    if (_472)
    {
        float _804 = -_322;
        float _806 = fma(_782, _792, _804);
        _490 = _806;
    }
    float _808 = _490;
    float _810 = _808;
    if (!_472)
    {
        _810 = _460;
    }
    float _812 = _810;
    if (_472)
    {
        float _814 = -_308;
        float _816 = fma(_786, _792, _814);
        _492 = _816;
    }
    float _818 = _492;
    float _820 = _818;
    if (!_472)
    {
        _820 = _464;
    }
    float _822 = _820;
    float _824 = _802 * _802;
    float _826 = _690 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _828 = _690 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _830 = _690 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _832 = fma(_812, _812, _824);
    float _834 = _732 * _740;
    float _836 = fma(_822, _822, _832);
    float _838 = sqrt(_836);
    float _840 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _842 = _838 + _840;
    float _844 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _846 = _838 + _844;
    float _848 = _842 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _850 = precise::clamp(_848, 0.0, 1.0);
    float _852 = _730 * _740;
    float _854 = _734 * _740;
    float _856 = _846 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _858 = precise::clamp(_856, 0.0, 1.0);
    float _860 = _828 * _852;
    float _862 = abs(_850);
    float _864 = log2(_862);
    float _866 = _830 * _854;
    float _868 = _864 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _870 = exp2(_868);
    float _872 = _730 * _620;
    float _874 = _826 * _834;
    float _876 = _732 * _622;
    float _878 = _640 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _880 = fma(_872, (*spvDescriptorSet0.fp_c4)._m0[7].x, _860);
    float _882 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _884 = fma(_876, (*spvDescriptorSet0.fp_c4)._m0[7].y, _874);
    float _886 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _888 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _890 = _642 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _892 = _644 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _894 = -_878;
    float _896 = fma(_828, _886, _894);
    float _898 = _734 * _624;
    float _900 = -_890;
    float _902 = fma(_826, _882, _900);
    float _904 = -_892;
    float _906 = fma(_830, _888, _904);
    float _908 = fma(_870, _896, _878);
    float _910 = -_730;
    float _912 = _910 + 1.0;
    float _914 = fma(_898, (*spvDescriptorSet0.fp_c4)._m0[7].z, _866);
    float _916 = fma(_870, _902, _890);
    float _918 = fma(_870, _906, _892);
    float _920 = -_732;
    float _922 = _920 + 1.0;
    float _924 = -_734;
    float _926 = _924 + 1.0;
    float _928 = fma(_908, _912, _880);
    float _930 = _858 * 3.0;
    float _932 = precise::clamp(_930, 0.0, 1.0);
    float _934 = fma(_916, _922, _884);
    float _936 = fma(_918, _926, _914);
    float _938 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _940 = _928 + _938;
    float _942 = abs(_858);
    float _944 = log2(_942);
    float _946 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _948 = _934 + _946;
    float _950 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _952 = _936 + _950;
    float _954 = fma(_932, _940, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _956 = fma(_932, _948, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _958 = fma(_932, _952, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _960 = precise::max(_954, 9.9999999392252902907785028219223e-09);
    float _962 = precise::max(_956, 9.9999999392252902907785028219223e-09);
    float _964 = precise::max(_958, 9.9999999392252902907785028219223e-09);
    float _966 = sqrt(_960);
    float _968 = _944 * 0.100000001490116119384765625;
    float _970 = -_858;
    float _972 = _970 + 1.0;
    float _974 = sqrt(_962);
    float _976 = sqrt(_964);
    float _978 = fma(_972, (*spvDescriptorSet0.fp_c4)._m0[13].x, _966);
    float _980 = -_978;
    float _982 = _954 + _980;
    float _984 = exp2(_968);
    float _986 = fma(_972, (*spvDescriptorSet0.fp_c4)._m0[13].y, _974);
    float _988 = fma(_972, (*spvDescriptorSet0.fp_c4)._m0[13].z, _976);
    float _990 = _858 * 5.0;
    float _992 = -_986;
    float _994 = _956 + _992;
    float _996 = -_988;
    float _998 = _958 + _996;
    float _1000 = fma(_984, _982, _978);
    float _1002 = fma(_984, _994, _986);
    float _1004 = fma(_984, _998, _988);
    float _1006 = precise::min(_990, 1.0);
    out.m_47.x = _1000;
    out.m_47.y = _1002;
    out.m_47.z = _1004;
    out.m_47.w = _1006;
    return out;
}

