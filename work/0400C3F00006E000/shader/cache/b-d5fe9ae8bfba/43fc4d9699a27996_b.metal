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
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_44.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _84 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _86 = _78 * _76;
    float _88 = _82 * 0.15915493667125701904296875;
    float _90 = _78 * _70;
    float _92 = _88 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_84, _94, _90);
    float _98 = fma(_84, _94, _86);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1205 = float2(_96, _98);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1205, float2(0.0), isnan(_1205))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1205, float2(0.0), isnan(_1205))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1222 = float2(_100, _102);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1222, float2(0.0), isnan(_1222))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1222, float2(0.0), isnan(_1222))).xyz;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _110 * _110;
    float _124 = fma(_108, _108, _122);
    float _126 = fma(_112, _112, _124);
    float _128 = rsqrt(_126);
    float _130 = _110 * _128;
    float _132 = _108 * _128;
    float _134 = _112 * _128;
    float _136 = _130 * _130;
    float _138 = fma(_132, _132, _136);
    float _140 = sqrt(_138);
    bool _144 = _140 >= 0.00999999977648258209228515625;
    bool _146 = isnan(_140);
    bool _148 = _144 || _146;
    bool _150 = isnan(0.00999999977648258209228515625);
    bool _152 = _148 || _150;
    float _154 = _98;
    float _156 = _126;
    float _158 = _136;
    float _160 = _140;
    if (!_152)
    {
        float _162 = fma(_134, _134, _136);
        _154 = _162;
    }
    float _164 = _154;
    float _166 = _132 * _118;
    float _168 = _130 * _118;
    if (!_152)
    {
        _156 = 0.0;
    }
    float _170 = _156;
    float _172 = _112;
    float _174 = _170;
    if (!_152)
    {
        float _176 = rsqrt(_164);
        _172 = _176;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_152)
    {
        float _182 = _134 * _178;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = _184;
    if (!_152)
    {
        float _188 = _130 * _178;
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    float _194 = _190;
    if (!_152)
    {
        float _196 = _134 * _184;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = 0.0;
    float _202 = _198;
    if (!_152)
    {
        float _204 = fma(_132, _190, -0.0);
        _200 = _204;
    }
    float _206 = _200;
    float _208 = _206;
    if (!_152)
    {
        float _210 = _132 * _184;
        _160 = _210;
    }
    float _212 = _160;
    float _214 = _212;
    if (!_152)
    {
        float _216 = -_190;
        float _218 = -_198;
        float _220 = fma(_130, _216, _218);
        _202 = _220;
    }
    float _222 = _202;
    float _224 = _222;
    if (!_152)
    {
        float _226 = -_190;
        float _228 = (-0.0) + _226;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_152;
    float _234 = _230;
    if (!_232)
    {
        float _236 = rsqrt(_138);
        float _238 = _130 * _236;
        float _240 = -_236;
        float _242 = _132 * _240;
        float _244 = _134 * _238;
        float _246 = _132 * _242;
        float _248 = _134 * _242;
        float _250 = _244 * _244;
        float _252 = -_246;
        float _254 = fma(_130, _238, _252);
        float _256 = fma(_248, _248, _250);
        float _258 = fma(_254, _254, _256);
        float _260 = rsqrt(_258);
        float _262 = _248 * _260;
        float _264 = _254 * _260;
        float _266 = -_244;
        float _268 = fma(_266, _260, -0.0);
        _208 = _242;
        _224 = _238;
        _186 = _268;
        _174 = _262;
        _214 = 0.0;
        _234 = _264;
    }
    float _270 = _208;
    float _272 = _224;
    float _274 = _186;
    float _276 = _174;
    float _278 = _214;
    float _280 = _234;
    float _282 = fma(_116, _270, _168);
    float _284 = fma(_116, _272, _166);
    float _286 = _134 * _118;
    float _288 = in.m_46.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_120, _276, _284);
    float _298 = fma(_116, _278, _286);
    float _300 = in.m_46.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _294 * _294;
    float _308 = in.m_48.w;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_120, _280, _298);
    float _316 = in.m_48.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_296, _296, _306);
    float _324 = in.m_48.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = fma(_314, _314, _322);
    float _332 = rsqrt(_330);
    float _334 = _78 * _292;
    float _336 = -_130;
    float _338 = fma(_294, _332, _336);
    float _340 = -_132;
    float _342 = fma(_296, _332, _340);
    float _344 = -_134;
    float _346 = fma(_314, _332, _344);
    float _348 = _78 * _304;
    float _350 = fma(_338, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _352 = fma(_342, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _354 = _334 * _334;
    float _356 = fma(_346, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _358 = _350 * _350;
    float _360 = _78 * _312;
    float _362 = fma(_348, _348, _354);
    float _364 = fma(_352, _352, _358);
    float _366 = _78 * _320;
    float _368 = _78 * _328;
    float _370 = 1.0 / _360;
    float _372 = fma(_356, _356, _364);
    float _374 = sqrt(_362);
    float _376 = rsqrt(_372);
    float _378 = _366 * _370;
    float _380 = _368 * _370;
    float _382 = fma(_378, 0.5, 0.5);
    float _384 = fma(_380, -0.5, 0.5);
    float _386 = -(*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _388 = fma(_374, (*spvDescriptorSet0.fp_c4)._m0[1].x, _386);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _352 * _376;
    float _394 = _356 * _376;
    float _396 = -_392;
    float _398 = fma(_390, _396, _392);
    float _400 = -_394;
    float _402 = fma(_390, _400, _394);
    float _404 = fma(_398, 0.0199999995529651641845703125, _382);
    float _406 = fma(_402, 0.0199999995529651641845703125, _384);
    float2 _1653 = float2(_404, _406);
    float _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1653, float2(0.0), isnan(_1653))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1653, float2(0.0), isnan(_1653))).x;
    float _410 = in.m_46.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = -_348;
    float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _420 = -_334;
    float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _424 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _426 = _380 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _428 = _380 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _430 = _380 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _432 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _424);
    float _434 = _350 * _376;
    float _436 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _432);
    float _438 = rsqrt(_436);
    float _440 = _78 * _414;
    float _442 = -_440;
    float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _446 = _438 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _448 = _438 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _450 = _444 * _444;
    float _452 = fma(_418, _418, _450);
    float _454 = _438 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _456 = fma(_422, _422, _452);
    float _458 = rsqrt(_456);
    float _460 = _444 * _458;
    float _462 = _418 * _458;
    float _464 = _422 * _458;
    float _466 = -_454;
    float _468 = _460 + _466;
    float _470 = -_446;
    float _472 = _462 + _470;
    float _474 = -_448;
    float _476 = _464 + _474;
    float _478 = _468 * _468;
    float _480 = fma(_472, _472, _478);
    float _482 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[6].x, _428);
    float _484 = fma(_476, _476, _480);
    float _486 = _380 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _488 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[4].x, _486);
    float _490 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[5].x, _426);
    float _492 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[7].x, _430);
    float _494 = -_434;
    float _496 = _494 + 1.0;
    float _498 = rsqrt(_484);
    float _500 = fma(_390, _496, _434);
    float _502 = _472 * _498;
    float _504 = _468 * _498;
    float _506 = _476 * _498;
    float _508 = fma(_408, 2.0, -1.0);
    float _510 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[7].z, _492);
    float _512 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[5].z, _490);
    float _514 = _510 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _516 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[4].z, _488);
    float _518 = _512 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _520 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[6].z, _482);
    float _522 = _516 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _524 = 1.0 / _514;
    float _526 = _520 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _528 = _518 * _524;
    float _530 = _522 * _524;
    float _532 = _526 * _524;
    float _534 = -_440;
    float _536 = _534 + _528;
    float _538 = -_348;
    float _540 = _538 + _530;
    float _542 = -_334;
    float _544 = _542 + _532;
    float _546 = _460 * _536;
    float _548 = fma(_462, _540, _546);
    float _550 = fma(_464, _544, _548);
    bool _552 = _550 > 0.0;
    float _554 = _550;
    float _556 = _546;
    float _558 = _518;
    float _560 = _492;
    float _562 = _490;
    float _564 = _488;
    float _566 = _440;
    float _568 = _348;
    float _570 = _334;
    if (_552)
    {
        float2 _1921 = float2(_382, _384);
        float3 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1921, float2(0.0), isnan(_1921))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1921, float2(0.0), isnan(_1921))).xyz;
        float _574 = _572.x;
        float _576 = _572.y;
        float _578 = _572.z;
        _554 = _574;
        _556 = _576;
        _558 = _578;
    }
    float _580 = _554;
    float _582 = _556;
    float _584 = _558;
    float _586 = _382;
    if (_552)
    {
        float2 _1945 = float2(_382, _384);
        float _588 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1945, float2(0.0), isnan(_1945))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1945, float2(0.0), isnan(_1945))).x;
        _586 = _588;
    }
    float _590 = _586;
    float _592 = -_460;
    float _594 = _500 * _592;
    float _596 = -_454;
    float _598 = _500 * _596;
    float _600 = _500 * _504;
    float _602 = -_462;
    float _604 = fma(_398, _602, _594);
    float _606 = -_446;
    float _608 = fma(_398, _606, _598);
    float _610 = fma(_398, _502, _600);
    float _612 = _500 * _460;
    float _614 = -_464;
    float _616 = fma(_402, _614, _604);
    float _618 = -_448;
    float _620 = fma(_402, _618, _608);
    float _622 = fma(_402, _506, _610);
    float _624 = _616 + _616;
    float _626 = -_624;
    float _628 = -_460;
    float _630 = fma(_500, _626, _628);
    float _632 = -_624;
    float _634 = -_462;
    float _636 = fma(_398, _632, _634);
    float _638 = -_624;
    float _640 = -_464;
    float _642 = fma(_402, _638, _640);
    float _644 = abs(_636);
    float _646 = abs(_630);
    float _648 = precise::max(_644, _646);
    float _650 = abs(_642);
    float _652 = precise::max(_650, _648);
    float _654 = 1.0 / _652;
    float _656 = _636 * _654;
    float _658 = _630 * _654;
    float _660 = _642 * _654;
    float _662 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float4 _2061 = float4(_656, _658, _660, float(0));
    float4 _2065 = select(_2061, float4(0.0), isnan(_2061));
    float3 _664 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2065.xyz, uint(rint(_2065.w)), level(_662)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2065.xyz, uint(rint(_2065.w)), level(_662)).xyz;
    float _666 = _664.x;
    float _668 = _664.y;
    float _670 = _664.z;
    float _672 = _580;
    float _674 = _582;
    float _676 = _584;
    if (!_552)
    {
        float2 _2084 = float2(_404, _406);
        float3 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2084, float2(0.0), isnan(_2084))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2084, float2(0.0), isnan(_2084))).xyz;
        float _680 = _678.x;
        float _682 = _678.y;
        float _684 = _678.z;
        _672 = _680;
        _674 = _682;
        _676 = _684;
    }
    float _686 = _672;
    float _688 = _674;
    float _690 = _676;
    float _692 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _694 = precise::max(_622, 9.9999999392252902907785028219223e-09);
    float _696 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _698 = fma(_398, _462, _612);
    float _700 = _692 * _692;
    float _702 = _700 * 0.5;
    float _704 = precise::max(_620, 9.9999999392252902907785028219223e-09);
    float _706 = fma(_696, _696, -1.0);
    float _708 = _694 * _694;
    float _710 = fma(_402, _464, _698);
    float _712 = -_702;
    float _714 = _712 + 1.0;
    float _716 = fma(_708, _706, 1.0);
    float _718 = 0.0 + _620;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = precise::max(_710, 9.9999999392252902907785028219223e-09);
    float _724 = sqrt(_456);
    float _726 = precise::max(_716, 9.9999999392252902907785028219223e-09);
    float _728 = fma(_704, _714, _702);
    float _730 = fma(_722, _714, _702);
    float _732 = fma(_722, -5.554729938507080078125, -6.9831600189208984375);
    float _734 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _736 = 1.0 + _734;
    float _738 = 1.0 / _726;
    float _740 = _722 * _732;
    float _742 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _744 = 1.0 + _742;
    float _746 = 1.0 / _728;
    bool _748 = _724 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _750 = isnan(_724);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _756 = _752 || _754;
    float _758 = 1.0 / _730;
    float _760 = _696 * _738;
    float _762 = _760 * _760;
    float _764 = exp2(_740);
    float _766 = _762 * 0.3183098733425140380859375;
    float _768 = _720 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _770 = _746 * _758;
    float _772 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _774 = 1.0 + _772;
    float _776 = _766 * _770;
    float _778 = _776 * 0.25;
    float _780 = _720 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _782 = fma(_774, _764, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _784 = fma(_744, _764, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _786 = fma(_736, _764, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _788 = _720 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _790 = _782 * _778;
    float _792 = _784 * _778;
    float _794 = _786 * _778;
    float _796 = _780 * _790;
    float _798 = _788 * _792;
    float _800 = _768 * _794;
    float _802 = _790;
    float _804 = _794;
    float _806 = _686;
    float _808 = _688;
    float _810 = _690;
    if (_552)
    {
        float _812 = fma(_590, 2.0, -1.0);
        _802 = _812;
    }
    float _814 = _802;
    float _816 = _814;
    if (_552)
    {
        float _818 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[7].z, _492);
        _560 = _818;
    }
    float _820 = _560;
    float _822 = _820;
    if (_552)
    {
        float _824 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[5].z, _490);
        _562 = _824;
    }
    float _826 = _562;
    float _828 = _826;
    if (_552)
    {
        float _830 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[4].z, _488);
        _564 = _830;
    }
    float _832 = _564;
    float _834 = _832;
    if (_552)
    {
        float _836 = fma(_814, (*spvDescriptorSet0.fp_c3)._m0[6].z, _482);
        _816 = _836;
    }
    float _838 = _816;
    float _840 = _838;
    if (_552)
    {
        float _842 = _820 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _822 = _842;
    }
    float _844 = _822;
    if (_552)
    {
        float _846 = _826 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _828 = _846;
    }
    float _848 = _828;
    float _850 = _848;
    if (_552)
    {
        float _852 = _832 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _834 = _852;
    }
    float _854 = _834;
    float _856 = _792;
    float _858 = _854;
    if (_552)
    {
        float _860 = 1.0 / _844;
        _856 = _860;
    }
    float _862 = _856;
    if (_552)
    {
        float _864 = _848 * _862;
        _804 = _864;
    }
    float _866 = _804;
    float _868 = _866;
    if (_552)
    {
        float _870 = _838 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _850 = _870;
    }
    float _872 = _850;
    if (_552)
    {
        float _874 = _854 * _862;
        _840 = _874;
    }
    float _876 = _840;
    float _878 = _876;
    if (_552)
    {
        float _880 = -_440;
        float _882 = _880 + _866;
        _566 = _882;
    }
    float _884 = _566;
    float _886 = _884;
    if (!_552)
    {
        _886 = _536;
    }
    float _888 = _886;
    if (_552)
    {
        float _890 = _872 * _862;
        _858 = _890;
    }
    float _892 = _858;
    float _894 = _892;
    if (_552)
    {
        float _896 = -_348;
        float _898 = _896 + _876;
        _568 = _898;
    }
    float _900 = _568;
    float _902 = _900;
    if (!_552)
    {
        _902 = _540;
    }
    float _904 = _902;
    float _906 = _888 * _888;
    if (_552)
    {
        float _908 = -_334;
        float _910 = _908 + _892;
        _570 = _910;
    }
    float _912 = _570;
    float _914 = _912;
    if (!_552)
    {
        _914 = _544;
    }
    float _916 = _914;
    float _918 = fma(_904, _904, _906);
    if (!_552)
    {
        _878 = _530;
    }
    float _920 = _878;
    if (!_552)
    {
        _868 = _528;
    }
    float _922 = _868;
    float _924 = fma(_916, _916, _918);
    if (!_552)
    {
        _894 = _532;
    }
    float _926 = _894;
    float _928 = sqrt(_924);
    float _930 = _782 * _666;
    float _932 = fma(_930, (*spvDescriptorSet0.fp_c4)._m0[7].x, _796);
    if (!_756)
    {
        float _934 = fma(_922, (*spvDescriptorSet0.fp_c4)._m0[3].y, _926);
        float _936 = fma(_922, (*spvDescriptorSet0.fp_c4)._m0[3].y, _920);
        float _938 = -_934;
        float _940 = fma(_938, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float _942 = _936 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float2 _2514 = float2(_942, _940);
        float4 _945 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2514, float2(0.0), isnan(_2514)), int2(0), component::x).xyzw;
        float _947 = _945.x;
        float _949 = _945.y;
        float _951 = _945.z;
        float _953 = _945.w;
        float _955 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _957 = fma(_724, (*spvDescriptorSet0.fp_c4)._m0[2].x, _955);
        float _959 = precise::clamp(_957, 0.0, 1.0);
        float _961 = -_959;
        float _963 = _961 + 1.0;
        float _965 = -_963;
        float _967 = fma(_965, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _969 = precise::clamp(_967, 0.0, 1.0);
        float _971 = _947 + _949;
        float _973 = _951 + _971;
        float _975 = _953 + _973;
        float _977 = fma(_975, 0.25, 1.0);
        float _979 = _977 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _981 = _977 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _983 = _977 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _985 = _979 * _686;
        float _987 = _981 * _688;
        float _989 = _983 * _690;
        float _991 = -_985;
        float _993 = _991 + _686;
        float _995 = -_987;
        float _997 = _995 + _688;
        float _999 = -_989;
        float _1001 = _999 + _690;
        float _1003 = fma(_969, _993, _985);
        float _1005 = fma(_969, _997, _987);
        float _1007 = fma(_969, _1001, _989);
        _806 = _1003;
        _808 = _1005;
        _810 = _1007;
    }
    float _1009 = _806;
    float _1011 = _808;
    float _1013 = _810;
    float _1015 = -_782;
    float _1017 = _1015 + 1.0;
    float _1019 = _1009 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _1021 = _784 * _668;
    float _1023 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _1025 = _928 + _1023;
    float _1027 = _786 * _670;
    float _1029 = fma(_1019, _1017, _932);
    float _1031 = fma(_1021, (*spvDescriptorSet0.fp_c4)._m0[7].y, _798);
    float _1033 = -_784;
    float _1035 = _1033 + 1.0;
    float _1037 = _1025 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = _1011 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _1043 = fma(_1027, (*spvDescriptorSet0.fp_c4)._m0[7].z, _800);
    float _1045 = -_786;
    float _1047 = _1045 + 1.0;
    float _1049 = _1013 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _1051 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _1053 = _1029 + _1051;
    float _1055 = _1039 * 3.0;
    float _1057 = precise::clamp(_1055, 0.0, 1.0);
    float _1059 = fma(_1041, _1035, _1031);
    float _1061 = fma(_1049, _1047, _1043);
    float _1063 = abs(_1039);
    float _1065 = log2(_1063);
    float _1067 = fma(_1057, _1053, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _1069 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _1071 = _1059 + _1069;
    float _1073 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _1075 = _1061 + _1073;
    float _1077 = -_1039;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_1057, _1071, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _1083 = fma(_1057, _1075, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _1085 = precise::max(_1067, 9.9999999392252902907785028219223e-09);
    float _1087 = precise::max(_1081, 9.9999999392252902907785028219223e-09);
    float _1089 = precise::max(_1083, 9.9999999392252902907785028219223e-09);
    float _1091 = sqrt(_1085);
    float _1093 = _1065 * 0.100000001490116119384765625;
    float _1095 = sqrt(_1087);
    float _1097 = sqrt(_1089);
    float _1099 = fma(_1079, (*spvDescriptorSet0.fp_c4)._m0[13].x, _1091);
    float _1101 = -_1099;
    float _1103 = _1067 + _1101;
    float _1105 = exp2(_1093);
    float _1107 = fma(_1079, (*spvDescriptorSet0.fp_c4)._m0[13].y, _1095);
    float _1109 = -_1107;
    float _1111 = _1081 + _1109;
    float _1113 = fma(_1079, (*spvDescriptorSet0.fp_c4)._m0[13].z, _1097);
    float _1115 = _1039 * 5.0;
    float _1117 = -_1113;
    float _1119 = _1083 + _1117;
    float _1121 = fma(_1105, _1103, _1099);
    float _1123 = fma(_1105, _1111, _1107);
    float _1125 = fma(_1105, _1119, _1113);
    float _1127 = precise::min(_1115, 1.0);
    out.m_51.x = _1121;
    out.m_51.y = _1123;
    out.m_51.z = _1125;
    out.m_51.w = _1127;
    return out;
}

