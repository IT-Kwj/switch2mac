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
    float2 _791 = float2(_70, _72);
    float3 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_791, float2(0.0), isnan(_791))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_791, float2(0.0), isnan(_791))).xyz;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float2 _808 = float2(_74, _76);
    float3 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_808, float2(0.0), isnan(_808))).xyz;
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
    float _140 = _106 * _92;
    float _142 = _104 * _92;
    float _144 = 0.0;
    if (!_126)
    {
        _144 = 0.0;
    }
    float _146 = _144;
    float _148 = _110;
    float _150 = _146;
    if (!_126)
    {
        float _152 = rsqrt(_138);
        _148 = _152;
    }
    float _154 = _148;
    float _156 = _154;
    if (!_126)
    {
        float _158 = _108 * _154;
        _130 = _158;
    }
    float _160 = _130;
    float _162 = _160;
    if (!_126)
    {
        float _164 = _104 * _154;
        _132 = _164;
    }
    float _166 = _132;
    float _168 = 0.0;
    float _170 = _166;
    if (!_126)
    {
        float _172 = _108 * _160;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _174;
    if (!_126)
    {
        float _178 = fma(_106, _166, -0.0);
        _156 = _178;
    }
    float _180 = _156;
    float _182 = _180;
    if (!_126)
    {
        float _184 = -_166;
        float _186 = (-0.0) + _184;
        _134 = _186;
    }
    float _188 = _134;
    float _190 = _188;
    if (!_126)
    {
        float _192 = -_166;
        float _194 = -_174;
        float _196 = fma(_104, _192, _194);
        _176 = _196;
    }
    float _198 = _176;
    float _200 = _198;
    if (!_126)
    {
        float _202 = _106 * _160;
        _170 = _202;
    }
    float _204 = _170;
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
        float _236 = _228 * _234;
        float _238 = _222 * _234;
        float _240 = -_218;
        float _242 = fma(_240, _234, -0.0);
        _182 = _216;
        _200 = _212;
        _162 = _242;
        _208 = 0.0;
        _150 = _238;
        _190 = _236;
    }
    float _244 = _182;
    float _246 = _200;
    float _248 = _162;
    float _250 = _208;
    float _252 = _150;
    float _254 = _190;
    float _256 = fma(_90, _244, _142);
    float _258 = _108 * _92;
    float _260 = fma(_90, _246, _140);
    float _262 = in.m_42.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_94, _248, _256);
    float _270 = fma(_90, _250, _258);
    float _272 = fma(_94, _252, _260);
    float _274 = in.m_42.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = _268 * _268;
    float _282 = fma(_94, _254, _270);
    float _284 = in.m_42.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_272, _272, _280);
    float _292 = fma(_282, _282, _290);
    float _294 = rsqrt(_292);
    float _296 = -_104;
    float _298 = fma(_268, _294, _296);
    float _300 = -_106;
    float _302 = fma(_272, _294, _300);
    float _304 = -_108;
    float _306 = fma(_282, _294, _304);
    float _308 = _68 * _266;
    float _310 = fma(_298, (*spvDescriptorSet0.fp_c4)._m0[0].z, _104);
    float _312 = fma(_302, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _314 = _68 * _288;
    float _316 = fma(_306, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _318 = _310 * _310;
    float _320 = _68 * _278;
    float _322 = fma(_312, _312, _318);
    float _324 = 1.0 / _314;
    float _326 = fma(_316, _316, _322);
    float _328 = rsqrt(_326);
    float _330 = _308 * _324;
    float _332 = _320 * _324;
    float _334 = fma(_330, 0.5, 0.5);
    float _336 = fma(_332, -0.5, 0.5);
    float _338 = _312 * _328;
    float _340 = _316 * _328;
    float _342 = fma(_338, 0.0199999995529651641845703125, _334);
    float _344 = fma(_340, 0.0199999995529651641845703125, _336);
    float2 _1188 = float2(_342, _344);
    float _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1188, float2(0.0), isnan(_1188))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1188, float2(0.0), isnan(_1188))).x;
    float _348 = in.m_44.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_44.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_44.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _332 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _368 = _332 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _370 = _332 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _372 = _332 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _374 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[7].x, _366);
    float _376 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[5].x, _368);
    float _378 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[4].x, _370);
    float _380 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[6].x, _372);
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
    float _420 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[4].z, _378);
    float _422 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[6].z, _380);
    float _424 = _416 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _426 = _418 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _428 = _420 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _430 = 1.0 / _424;
    float _432 = -_382;
    float _434 = fma(_426, _430, _432);
    float _436 = -_384;
    float _438 = fma(_428, _430, _436);
    float _440 = _422 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _442 = _410 * _434;
    float _444 = -_386;
    float _446 = fma(_440, _430, _444);
    float _448 = fma(_408, _438, _442);
    float _450 = fma(_412, _446, _448);
    bool _452 = _450 > 0.0;
    float _454 = _336;
    float _456 = _448;
    float _458 = _334;
    if (_452)
    {
        float2 _1385 = float2(_334, _336);
        float3 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1385, float2(0.0), isnan(_1385))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1385, float2(0.0), isnan(_1385))).xyz;
        float _462 = _460.x;
        float _464 = _460.y;
        float _466 = _460.z;
        _454 = _462;
        _456 = _464;
        _458 = _466;
    }
    float _468 = _454;
    float _470 = _456;
    float _472 = _458;
    float _474 = _310 * _328;
    float _476 = -_410;
    float _478 = _474 * _476;
    float _480 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _482 = -_408;
    float _484 = fma(_338, _482, _478);
    float _486 = -_412;
    float _488 = fma(_340, _486, _484);
    float _490 = _488 + _488;
    float _492 = -_490;
    float _494 = -_410;
    float _496 = fma(_474, _492, _494);
    float _498 = -_490;
    float _500 = -_408;
    float _502 = fma(_338, _498, _500);
    float _504 = -_490;
    float _506 = -_412;
    float _508 = fma(_340, _504, _506);
    float _510 = abs(_502);
    float _512 = abs(_496);
    float _514 = precise::max(_510, _512);
    float _516 = abs(_508);
    float _518 = precise::max(_516, _514);
    float _520 = 1.0 / _518;
    float _522 = _508 * _520;
    float _524 = _502 * _520;
    float _526 = _496 * _520;
    float4 _1483 = float4(_524, _526, _522, float(0));
    float4 _1487 = select(_1483, float4(0.0), isnan(_1483));
    float3 _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1487.xyz, uint(rint(_1487.w)), level(_480)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1487.xyz, uint(rint(_1487.w)), level(_480)).xyz;
    float _530 = _528.x;
    float _532 = _528.y;
    float _534 = _528.z;
    float _536 = _468;
    float _538 = _470;
    float _540 = _472;
    if (!_452)
    {
        float2 _1506 = float2(_342, _344);
        float3 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1506, float2(0.0), isnan(_1506))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1506, float2(0.0), isnan(_1506))).xyz;
        float _544 = _542.x;
        float _546 = _542.y;
        float _548 = _542.z;
        _536 = _544;
        _538 = _546;
        _540 = _548;
    }
    float _550 = _536;
    float _552 = _538;
    float _554 = _540;
    float _556 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _558 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _560 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _562 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _560);
    float _564 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _562);
    float _566 = rsqrt(_564);
    float _568 = _566 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _570 = _566 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _572 = -_568;
    float _574 = _410 + _572;
    float _576 = _566 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _578 = -_570;
    float _580 = _408 + _578;
    float _582 = -_568;
    float _584 = _474 * _582;
    float _586 = _574 * _574;
    float _588 = -_576;
    float _590 = _412 + _588;
    float _592 = -_570;
    float _594 = fma(_338, _592, _584);
    float _596 = fma(_580, _580, _586);
    float _598 = -_576;
    float _600 = fma(_340, _598, _594);
    float _602 = fma(_590, _590, _596);
    float _604 = rsqrt(_602);
    float _606 = _574 * _604;
    float _608 = _580 * _604;
    float _610 = _590 * _604;
    float _612 = _556 * _556;
    float _614 = _612 * 0.5;
    float _616 = _474 * _606;
    float _618 = _474 * _410;
    float _620 = fma(_558, _558, -1.0);
    float _622 = precise::max(_600, 9.9999999392252902907785028219223e-09);
    float _624 = fma(_338, _608, _616);
    float _626 = fma(_338, _408, _618);
    float _628 = -_614;
    float _630 = _628 + 1.0;
    float _632 = fma(_340, _610, _624);
    float _634 = fma(_340, _412, _626);
    float _636 = fma(_622, _630, _614);
    float _638 = 0.0 + _600;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = precise::max(_632, 9.9999999392252902907785028219223e-09);
    float _644 = precise::max(_634, 9.9999999392252902907785028219223e-09);
    float _646 = 1.0 / _636;
    float _648 = _642 * _642;
    float _650 = fma(_644, _630, _614);
    float _652 = fma(_644, -5.554729938507080078125, -6.9831600189208984375);
    float _654 = fma(_648, _620, 1.0);
    float _656 = _644 * _652;
    float _658 = 1.0 / _650;
    float _660 = precise::max(_654, 9.9999999392252902907785028219223e-09);
    float _662 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _664 = 1.0 + _662;
    float _666 = 1.0 / _660;
    float _668 = exp2(_656);
    float _670 = _558 * _666;
    float _672 = _646 * _658;
    float _674 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _676 = 1.0 + _674;
    float _678 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _680 = 1.0 + _678;
    float _682 = _670 * _670;
    float _684 = _682 * 0.3183098733425140380859375;
    float _686 = fma(_664, _668, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _688 = fma(_676, _668, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _690 = fma(_680, _668, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _692 = _684 * _672;
    float _694 = _692 * 0.25;
    float _696 = _640 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _698 = _640 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _700 = _640 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _702 = _686 * _694;
    float _704 = _688 * _694;
    float _706 = _690 * _694;
    float _708 = _696 * _702;
    float _710 = _698 * _704;
    float _712 = _700 * _706;
    float _714 = -_688;
    float _716 = _714 + 1.0;
    float _718 = -_690;
    float _720 = _718 + 1.0;
    float _722 = _686 * _530;
    float _724 = _690 * _534;
    float _726 = _688 * _532;
    float _728 = fma(_722, (*spvDescriptorSet0.fp_c4)._m0[7].x, _708);
    float _730 = fma(_724, (*spvDescriptorSet0.fp_c4)._m0[7].z, _712);
    float _732 = fma(_726, (*spvDescriptorSet0.fp_c4)._m0[7].y, _710);
    float _734 = -_686;
    float _736 = _734 + 1.0;
    float _738 = _550 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _740 = _552 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _742 = _554 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _744 = fma(_738, _736, _728);
    float _746 = fma(_740, _716, _732);
    float _748 = fma(_742, _720, _730);
    out.m_47.x = _744;
    out.m_47.y = _746;
    out.m_47.z = _748;
    out.m_47.w = 1.0;
    return out;
}

