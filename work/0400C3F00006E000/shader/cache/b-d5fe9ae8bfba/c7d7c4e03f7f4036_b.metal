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
    float4 m_44 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
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
    float2 _983 = float2(_70, _72);
    float3 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_983, float2(0.0), isnan(_983))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_983, float2(0.0), isnan(_983))).xyz;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float2 _1000 = float2(_74, _76);
    float3 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1000, float2(0.0), isnan(_1000))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1000, float2(0.0), isnan(_1000))).xyz;
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
    float _128 = 0.0;
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
        _188 = 0.0;
        _168 = _236;
        _208 = _238;
    }
    float _244 = _182;
    float _246 = _198;
    float _248 = _156;
    float _250 = _188;
    float _252 = _168;
    float _254 = _208;
    float _256 = fma(_90, _244, _148);
    float _258 = _108 * _92;
    float _260 = fma(_90, _246, _146);
    float _262 = in.m_42.w;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_94, _248, _256);
    float _270 = fma(_90, _250, _258);
    float _272 = fma(_94, _252, _260);
    float _274 = in.m_42.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = _268 * _268;
    float _282 = fma(_94, _254, _270);
    float _284 = in.m_42.y;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_272, _272, _280);
    float _292 = fma(_282, _282, _290);
    float _294 = rsqrt(_292);
    float _296 = _68 * _266;
    float _298 = -_104;
    float _300 = fma(_268, _294, _298);
    float _302 = -_106;
    float _304 = fma(_272, _294, _302);
    float _306 = -_108;
    float _308 = fma(_282, _294, _306);
    float _310 = 1.0 / _296;
    float _312 = fma(_300, (*spvDescriptorSet0.fp_c4)._m0[0].z, _104);
    float _314 = fma(_304, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _316 = fma(_308, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _318 = _68 * _278;
    float _320 = _312 * _312;
    float _322 = _68 * _288;
    float _324 = fma(_314, _314, _320);
    float _326 = fma(_316, _316, _324);
    float _328 = _318 * _310;
    float _330 = _322 * _310;
    float _332 = rsqrt(_326);
    float _334 = fma(_328, 0.5, 0.5);
    float _336 = fma(_330, -0.5, 0.5);
    float _338 = _314 * _332;
    float _340 = _316 * _332;
    float _342 = fma(_338, 0.0199999995529651641845703125, _334);
    float _344 = fma(_340, 0.0199999995529651641845703125, _336);
    float2 _1380 = float2(_342, _344);
    float _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1380, float2(0.0), isnan(_1380))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1380, float2(0.0), isnan(_1380))).x;
    float _348 = in.m_44.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_44.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_44.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _330 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _368 = _330 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _370 = _330 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _372 = _330 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _374 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[7].x, _366);
    float _376 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[5].x, _368);
    float _378 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[4].x, _370);
    float _380 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[6].x, _372);
    float _382 = _68 * _352;
    float _384 = _68 * _358;
    float _386 = _68 * _364;
    float _388 = -_382;
    float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _392 = -_384;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _396 = -_386;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _400 = _390 * _390;
    float _402 = fma(_394, _394, _400);
    float _404 = fma(_398, _398, _402);
    float _406 = rsqrt(_404);
    float _408 = _394 * _406;
    float _410 = _390 * _406;
    float _412 = _398 * _406;
    float _414 = fma(_346, 2.0, -1.0);
    float _416 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[7].z, _374);
    float _418 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[5].z, _376);
    float _420 = _416 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _422 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[4].z, _378);
    float _424 = _418 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _426 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[6].z, _380);
    float _428 = _422 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _430 = 1.0 / _420;
    float _432 = _426 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _434 = -_382;
    float _436 = fma(_424, _430, _434);
    float _438 = -_384;
    float _440 = fma(_428, _430, _438);
    float _442 = -_386;
    float _444 = fma(_432, _430, _442);
    float _446 = _410 * _436;
    float _448 = fma(_408, _440, _446);
    float _450 = fma(_412, _444, _448);
    bool _452 = _450 > 0.0;
    float _454 = _424;
    float _456 = _430;
    float _458 = _370;
    float _460 = 1.0;
    float _462 = _374;
    float _464 = _376;
    float _466 = _378;
    float _468 = _382;
    float _470 = _384;
    float _472 = _386;
    if (_452)
    {
        float2 _1583 = float2(_334, _336);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1583, float2(0.0), isnan(_1583))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1583, float2(0.0), isnan(_1583))).xyz;
        float _476 = _474.x;
        float _478 = _474.y;
        float _480 = _474.z;
        _454 = _476;
        _456 = _478;
        _458 = _480;
    }
    float _482 = _454;
    float _484 = _456;
    float _486 = _458;
    float _488 = _334;
    if (_452)
    {
        float2 _1607 = float2(_334, _336);
        float _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1607, float2(0.0), isnan(_1607))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1607, float2(0.0), isnan(_1607))).x;
        _488 = _490;
    }
    float _492 = _488;
    float _494 = _312 * _332;
    float _496 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _498 = -_410;
    float _500 = _494 * _498;
    float _502 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _496);
    float _504 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _502);
    float _506 = rsqrt(_504);
    float _508 = _506 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _510 = _506 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _512 = _506 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _514 = -_408;
    float _516 = fma(_338, _514, _500);
    float _518 = -_508;
    float _520 = _410 + _518;
    float _522 = -_510;
    float _524 = _408 + _522;
    float _526 = -_512;
    float _528 = _412 + _526;
    float _530 = -_412;
    float _532 = fma(_340, _530, _516);
    float _534 = _520 * _520;
    float _536 = _532 + _532;
    float _538 = fma(_524, _524, _534);
    float _540 = -_536;
    float _542 = -_410;
    float _544 = fma(_494, _540, _542);
    float _546 = fma(_528, _528, _538);
    float _548 = -_536;
    float _550 = -_408;
    float _552 = fma(_338, _548, _550);
    float _554 = -_536;
    float _556 = -_412;
    float _558 = fma(_340, _554, _556);
    float _560 = rsqrt(_546);
    float _562 = abs(_552);
    float _564 = abs(_544);
    float _566 = precise::max(_562, _564);
    float _568 = abs(_558);
    float _570 = precise::max(_568, _566);
    float _572 = 1.0 / _570;
    float _574 = _520 * _560;
    float _576 = _524 * _560;
    float _578 = _528 * _560;
    float _580 = _494 * _574;
    float _582 = fma(_338, _576, _580);
    float _584 = _552 * _572;
    float _586 = _544 * _572;
    float _588 = _558 * _572;
    float _590 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _1770 = float4(_584, _586, _588, float(0));
    float4 _1774 = select(_1770, float4(0.0), isnan(_1770));
    float3 _592 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1774.xyz, uint(rint(_1774.w)), level(_590)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1774.xyz, uint(rint(_1774.w)), level(_590)).xyz;
    float _594 = _592.x;
    float _596 = _592.y;
    float _598 = _592.z;
    float _600 = _482;
    float _602 = _484;
    float _604 = _486;
    if (!_452)
    {
        float2 _1793 = float2(_342, _344);
        float3 _606 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1793, float2(0.0), isnan(_1793))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1793, float2(0.0), isnan(_1793))).xyz;
        float _608 = _606.x;
        float _610 = _606.y;
        float _612 = _606.z;
        _600 = _608;
        _602 = _610;
        _604 = _612;
    }
    float _614 = _600;
    float _616 = _602;
    float _618 = _604;
    float _620 = fma(_340, _578, _582);
    float _622 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _624 = -_508;
    float _626 = _494 * _624;
    float _628 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _630 = _494 * _410;
    float _632 = precise::max(_620, 9.9999999392252902907785028219223e-09);
    float _634 = -_510;
    float _636 = fma(_338, _634, _626);
    float _638 = _622 * _622;
    float _640 = _638 * 0.5;
    float _642 = fma(_338, _408, _630);
    float _644 = _632 * _632;
    float _646 = -_512;
    float _648 = fma(_340, _646, _636);
    float _650 = fma(_340, _412, _642);
    float _652 = -_640;
    float _654 = _652 + 1.0;
    float _656 = fma(_628, _628, -1.0);
    float _658 = precise::max(_648, 9.9999999392252902907785028219223e-09);
    float _660 = 0.0 + _648;
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = precise::max(_650, 9.9999999392252902907785028219223e-09);
    float _666 = fma(_644, _656, 1.0);
    float _668 = fma(_658, _654, _640);
    float _670 = fma(_664, _654, _640);
    float _672 = precise::max(_666, 9.9999999392252902907785028219223e-09);
    float _674 = 1.0 / _668;
    float _676 = fma(_664, -5.554729938507080078125, -6.9831600189208984375);
    float _678 = 1.0 / _672;
    float _680 = _664 * _676;
    float _682 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _684 = 1.0 + _682;
    float _686 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _688 = 1.0 + _686;
    float _690 = 1.0 / _670;
    float _692 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _694 = 1.0 + _692;
    float _696 = exp2(_680);
    float _698 = _628 * _678;
    float _700 = _698 * _698;
    float _702 = _674 * _690;
    float _704 = _700 * 0.3183098733425140380859375;
    float _706 = _662 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _708 = _704 * _702;
    float _710 = _708 * 0.25;
    float _712 = _662 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _714 = fma(_684, _696, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _716 = fma(_688, _696, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _718 = fma(_694, _696, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _720 = _662 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _722 = _714 * _710;
    float _724 = _716 * _710;
    float _726 = _718 * _710;
    float _728 = _720 * _722;
    float _730 = _712 * _724;
    float _732 = _706 * _726;
    float _734 = _722;
    if (_452)
    {
        float _736 = fma(_492, 2.0, -1.0);
        _460 = _736;
    }
    float _738 = _460;
    float _740 = _738;
    if (_452)
    {
        float _742 = fma(_738, (*spvDescriptorSet0.fp_c3)._m0[7].z, _374);
        _462 = _742;
    }
    float _744 = _462;
    float _746 = _744;
    if (_452)
    {
        float _748 = fma(_738, (*spvDescriptorSet0.fp_c3)._m0[5].z, _376);
        _464 = _748;
    }
    float _750 = _464;
    float _752 = _750;
    if (_452)
    {
        float _754 = fma(_738, (*spvDescriptorSet0.fp_c3)._m0[4].z, _378);
        _466 = _754;
    }
    float _756 = _466;
    if (_452)
    {
        float _758 = fma(_738, (*spvDescriptorSet0.fp_c3)._m0[6].z, _380);
        _740 = _758;
    }
    float _760 = _740;
    float _762 = _760;
    if (_452)
    {
        float _764 = _744 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _734 = _764;
    }
    float _766 = _734;
    if (_452)
    {
        float _768 = _750 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _752 = _768;
    }
    float _770 = _752;
    if (_452)
    {
        float _772 = _756 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _746 = _772;
    }
    float _774 = _746;
    if (_452)
    {
        float _776 = _760 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _762 = _776;
    }
    float _778 = _762;
    float _780 = _766;
    if (_452)
    {
        float _782 = 1.0 / _766;
        _780 = _782;
    }
    float _784 = _780;
    if (_452)
    {
        float _786 = -_382;
        float _788 = fma(_770, _784, _786);
        _468 = _788;
    }
    float _790 = _468;
    float _792 = _790;
    if (!_452)
    {
        _792 = _436;
    }
    float _794 = _792;
    if (_452)
    {
        float _796 = -_384;
        float _798 = fma(_774, _784, _796);
        _470 = _798;
    }
    float _800 = _470;
    float _802 = _800;
    if (!_452)
    {
        _802 = _440;
    }
    float _804 = _802;
    if (_452)
    {
        float _806 = -_386;
        float _808 = fma(_778, _784, _806);
        _472 = _808;
    }
    float _810 = _472;
    float _812 = _810;
    if (!_452)
    {
        _812 = _444;
    }
    float _814 = _812;
    float _816 = _794 * _794;
    float _818 = fma(_804, _804, _816);
    float _820 = fma(_814, _814, _818);
    float _822 = sqrt(_820);
    float _824 = _714 * _594;
    float _826 = _716 * _596;
    float _828 = -_714;
    float _830 = _828 + 1.0;
    float _832 = _614 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _834 = fma(_824, (*spvDescriptorSet0.fp_c4)._m0[7].x, _728);
    float _836 = fma(_826, (*spvDescriptorSet0.fp_c4)._m0[7].y, _730);
    float _838 = _718 * _598;
    float _840 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _842 = _822 + _840;
    float _844 = fma(_832, _830, _834);
    float _846 = -_716;
    float _848 = _846 + 1.0;
    float _850 = _616 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _852 = fma(_838, (*spvDescriptorSet0.fp_c4)._m0[7].z, _732);
    float _854 = -_718;
    float _856 = _854 + 1.0;
    float _858 = _842 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _860 = precise::clamp(_858, 0.0, 1.0);
    float _862 = _618 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _864 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _866 = _844 + _864;
    float _868 = fma(_850, _848, _836);
    float _870 = _860 * 3.0;
    float _872 = precise::clamp(_870, 0.0, 1.0);
    float _874 = fma(_862, _856, _852);
    float _876 = -_860;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _882 = _868 + _880;
    float _884 = fma(_872, _866, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _886 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _888 = _874 + _886;
    float _890 = abs(_860);
    float _892 = log2(_890);
    float _894 = fma(_872, _882, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _896 = fma(_872, _888, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _898 = precise::max(_884, 9.9999999392252902907785028219223e-09);
    float _900 = precise::max(_894, 9.9999999392252902907785028219223e-09);
    float _902 = precise::max(_896, 9.9999999392252902907785028219223e-09);
    float _904 = sqrt(_898);
    float _906 = _892 * 0.100000001490116119384765625;
    float _908 = sqrt(_900);
    float _910 = sqrt(_902);
    float _912 = fma(_878, (*spvDescriptorSet0.fp_c4)._m0[13].x, _904);
    float _914 = exp2(_906);
    float _916 = fma(_878, (*spvDescriptorSet0.fp_c4)._m0[13].y, _908);
    float _918 = -_916;
    float _920 = _894 + _918;
    float _922 = fma(_878, (*spvDescriptorSet0.fp_c4)._m0[13].z, _910);
    float _924 = _860 * 5.0;
    float _926 = -_912;
    float _928 = _884 + _926;
    float _930 = -_922;
    float _932 = _896 + _930;
    float _934 = fma(_914, _928, _912);
    float _936 = fma(_914, _920, _916);
    float _938 = fma(_914, _932, _922);
    float _940 = precise::min(_924, 1.0);
    out.m_47.x = _934;
    out.m_47.y = _936;
    out.m_47.z = _938;
    out.m_47.w = _940;
    return out;
}

