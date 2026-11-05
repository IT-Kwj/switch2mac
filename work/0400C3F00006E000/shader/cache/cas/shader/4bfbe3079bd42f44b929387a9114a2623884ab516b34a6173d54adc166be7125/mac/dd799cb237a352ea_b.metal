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
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
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
    float _84 = _82 * 0.15915493667125701904296875;
    float _86 = _78 * _70;
    float _88 = _80 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _90 = _78 * _76;
    float _92 = _84 * 6.283185482025146484375;
    float _94 = sin(_92);
    float _96 = fma(_88, _94, _90);
    float _98 = fma(_88, _94, _86);
    float _100 = _96 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _102 = _98 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _1057 = float2(_98, _96);
    float3 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1057, float2(0.0), isnan(_1057))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1057, float2(0.0), isnan(_1057))).xyz;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float2 _1074 = float2(_102, _100);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1074, float2(0.0), isnan(_1074))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1074, float2(0.0), isnan(_1074))).xyz;
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
    float _154 = 0.0;
    float _156 = _136;
    float _158 = _128;
    float _160 = _140;
    if (!_152)
    {
        float _162 = fma(_134, _134, _136);
        _154 = _162;
    }
    float _164 = _154;
    float _166 = _132 * _118;
    float _168 = _130 * _118;
    float _170 = 0.0;
    if (!_152)
    {
        _170 = 0.0;
    }
    float _172 = _170;
    float _174 = _98;
    float _176 = _172;
    if (!_152)
    {
        float _178 = rsqrt(_164);
        _174 = _178;
    }
    float _180 = _174;
    float _182 = _180;
    if (!_152)
    {
        float _184 = _134 * _180;
        _156 = _184;
    }
    float _186 = _156;
    float _188 = _186;
    if (!_152)
    {
        float _190 = _130 * _180;
        _182 = _190;
    }
    float _192 = _182;
    float _194 = 0.0;
    float _196 = _192;
    if (!_152)
    {
        float _198 = _134 * _186;
        _194 = _198;
    }
    float _200 = _194;
    float _202 = _200;
    if (!_152)
    {
        float _204 = fma(_132, _192, -0.0);
        _158 = _204;
    }
    float _206 = _158;
    float _208 = _206;
    if (!_152)
    {
        float _210 = -_192;
        float _212 = (-0.0) + _210;
        _160 = _212;
    }
    float _214 = _160;
    float _216 = _214;
    if (!_152)
    {
        float _218 = -_192;
        float _220 = -_200;
        float _222 = fma(_130, _218, _220);
        _202 = _222;
    }
    float _224 = _202;
    float _226 = _224;
    if (!_152)
    {
        float _228 = _132 * _186;
        _196 = _228;
    }
    float _230 = _196;
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
        float _262 = _254 * _260;
        float _264 = _248 * _260;
        float _266 = -_244;
        float _268 = fma(_266, _260, -0.0);
        _208 = _242;
        _226 = _238;
        _188 = _268;
        _234 = 0.0;
        _176 = _264;
        _216 = _262;
    }
    float _270 = _208;
    float _272 = _226;
    float _274 = _188;
    float _276 = _234;
    float _278 = _176;
    float _280 = _216;
    float _282 = fma(_116, _270, _168);
    float _284 = _134 * _118;
    float _286 = fma(_116, _272, _166);
    float _288 = in.m_46.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_120, _274, _282);
    float _296 = fma(_116, _276, _284);
    float _298 = fma(_120, _278, _286);
    float _300 = in.m_46.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _294 * _294;
    float _308 = fma(_120, _280, _296);
    float _310 = in.m_46.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = fma(_298, _298, _306);
    float _318 = fma(_308, _308, _316);
    float _320 = rsqrt(_318);
    float _322 = _78 * _292;
    float _324 = -_130;
    float _326 = fma(_294, _320, _324);
    float _328 = -_132;
    float _330 = fma(_298, _320, _328);
    float _332 = -_134;
    float _334 = fma(_308, _320, _332);
    float _336 = 1.0 / _322;
    float _338 = fma(_326, (*spvDescriptorSet0.fp_c4)._m0[0].z, _130);
    float _340 = fma(_330, (*spvDescriptorSet0.fp_c4)._m0[0].z, _132);
    float _342 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[0].z, _134);
    float _344 = _78 * _314;
    float _346 = _338 * _338;
    float _348 = _78 * _304;
    float _350 = fma(_340, _340, _346);
    float _352 = fma(_342, _342, _350);
    float _354 = _344 * _336;
    float _356 = _348 * _336;
    float _358 = rsqrt(_352);
    float _360 = fma(_354, 0.5, 0.5);
    float _362 = fma(_356, -0.5, 0.5);
    float _364 = _340 * _358;
    float _366 = _342 * _358;
    float _368 = fma(_364, 0.0199999995529651641845703125, _360);
    float _370 = fma(_366, 0.0199999995529651641845703125, _362);
    float2 _1453 = float2(_368, _370);
    float _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1453, float2(0.0), isnan(_1453))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1453, float2(0.0), isnan(_1453))).x;
    float _374 = in.m_48.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_48.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_48.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = _356 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _394 = _356 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _396 = _356 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _398 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[7].x, _392);
    float _400 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[4].x, _394);
    float _402 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[6].x, _396);
    float _404 = _78 * _378;
    float _406 = _78 * _384;
    float _408 = _78 * _390;
    float _410 = -_404;
    float _412 = _410 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _414 = -_406;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _418 = -_408;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _422 = _412 * _412;
    float _424 = fma(_416, _416, _422);
    float _426 = fma(_420, _420, _424);
    float _428 = _356 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _430 = rsqrt(_426);
    float _432 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[5].x, _428);
    float _434 = _412 * _430;
    float _436 = _416 * _430;
    float _438 = _420 * _430;
    float _440 = fma(_372, 2.0, -1.0);
    float _442 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[7].z, _398);
    float _444 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
    float _446 = _442 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _448 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[4].z, _400);
    float _450 = _444 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _452 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[6].z, _402);
    float _454 = 1.0 / _446;
    float _456 = _448 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _458 = _452 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _460 = _450 * _454;
    float _462 = _456 * _454;
    float _464 = _458 * _454;
    float _466 = -_404;
    float _468 = _466 + _460;
    float _470 = -_406;
    float _472 = _470 + _462;
    float _474 = -_408;
    float _476 = _474 + _464;
    float _478 = _434 * _468;
    float _480 = fma(_436, _472, _478);
    float _482 = fma(_438, _476, _480);
    bool _484 = _482 > 0.0;
    float _486 = _472;
    float _488 = _480;
    float _490 = _456;
    float _492 = _398;
    float _494 = _400;
    float _496 = _402;
    float _498 = _432;
    float _500 = _464;
    if (_484)
    {
        float2 _1661 = float2(_360, _362);
        float3 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1661, float2(0.0), isnan(_1661))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1661, float2(0.0), isnan(_1661))).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        _486 = _504;
        _488 = _506;
        _490 = _508;
    }
    float _510 = _486;
    float _512 = _488;
    float _514 = _490;
    float _516 = _360;
    if (_484)
    {
        float2 _1685 = float2(_360, _362);
        float _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1685, float2(0.0), isnan(_1685))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1685, float2(0.0), isnan(_1685))).x;
        _516 = _518;
    }
    float _520 = _516;
    float _522 = _338 * _358;
    float _524 = -_434;
    float _526 = _522 * _524;
    float _528 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _530 = -_436;
    float _532 = fma(_364, _530, _526);
    float _534 = -_438;
    float _536 = fma(_366, _534, _532);
    float _538 = _536 + _536;
    float _540 = -_538;
    float _542 = -_434;
    float _544 = fma(_522, _540, _542);
    float _546 = -_538;
    float _548 = -_436;
    float _550 = fma(_364, _546, _548);
    float _552 = -_538;
    float _554 = -_438;
    float _556 = fma(_366, _552, _554);
    float _558 = abs(_550);
    float _560 = abs(_544);
    float _562 = precise::max(_558, _560);
    float _564 = abs(_556);
    float _566 = precise::max(_564, _562);
    float _568 = 1.0 / _566;
    float _570 = _550 * _568;
    float _572 = _544 * _568;
    float _574 = _556 * _568;
    float4 _1773 = float4(_570, _572, _574, float(0));
    float4 _1777 = select(_1773, float4(0.0), isnan(_1773));
    float3 _576 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1777.xyz, uint(rint(_1777.w)), level(_528)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1777.xyz, uint(rint(_1777.w)), level(_528)).xyz;
    float _578 = _576.x;
    float _580 = _576.y;
    float _582 = _576.z;
    float _584 = _510;
    float _586 = _512;
    float _588 = _514;
    if (!_484)
    {
        float2 _1796 = float2(_368, _370);
        float3 _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1796, float2(0.0), isnan(_1796))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1796, float2(0.0), isnan(_1796))).xyz;
        float _592 = _590.x;
        float _594 = _590.y;
        float _596 = _590.z;
        _584 = _592;
        _586 = _594;
        _588 = _596;
    }
    float _598 = _584;
    float _600 = _586;
    float _602 = _588;
    float _604 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _606 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _608 = sqrt(_426);
    float _610 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _612 = _604 * _604;
    float _614 = _612 * 0.5;
    float _616 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _610);
    float _618 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _616);
    float _620 = rsqrt(_618);
    bool _622 = _608 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _624 = isnan(_608);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _630 = _626 || _628;
    float _632 = _620 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _634 = _620 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _636 = -_632;
    float _638 = _434 + _636;
    float _640 = _620 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _642 = -_634;
    float _644 = _436 + _642;
    float _646 = -_632;
    float _648 = _522 * _646;
    float _650 = _638 * _638;
    float _652 = -_640;
    float _654 = _438 + _652;
    float _656 = -_634;
    float _658 = fma(_364, _656, _648);
    float _660 = fma(_644, _644, _650);
    float _662 = -_640;
    float _664 = fma(_366, _662, _658);
    float _666 = fma(_654, _654, _660);
    float _668 = rsqrt(_666);
    float _670 = _638 * _668;
    float _672 = _644 * _668;
    float _674 = _654 * _668;
    float _676 = fma(_606, _606, -1.0);
    float _678 = _522 * _670;
    float _680 = _522 * _434;
    float _682 = fma(_364, _672, _678);
    float _684 = fma(_364, _436, _680);
    float _686 = fma(_366, _674, _682);
    float _688 = fma(_366, _438, _684);
    float _690 = precise::max(_664, 9.9999999392252902907785028219223e-09);
    float _692 = 0.0 + _664;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = precise::max(_686, 9.9999999392252902907785028219223e-09);
    float _698 = -_614;
    float _700 = _698 + 1.0;
    float _702 = precise::max(_688, 9.9999999392252902907785028219223e-09);
    float _704 = _696 * _696;
    float _706 = fma(_690, _700, _614);
    float _708 = fma(_702, -5.554729938507080078125, -6.9831600189208984375);
    float _710 = fma(_702, _700, _614);
    float _712 = fma(_704, _676, 1.0);
    float _714 = _702 * _708;
    float _716 = 1.0 / _706;
    float _718 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _720 = 1.0 + _718;
    float _722 = precise::max(_712, 9.9999999392252902907785028219223e-09);
    float _724 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _726 = 1.0 + _724;
    float _728 = 1.0 / _722;
    float _730 = 1.0 / _710;
    float _732 = exp2(_714);
    float _734 = _606 * _728;
    float _736 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _738 = 1.0 + _736;
    float _740 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _742 = _734 * _734;
    float _744 = _716 * _730;
    float _746 = _742 * 0.3183098733425140380859375;
    float _748 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _750 = _746 * _744;
    float _752 = _750 * 0.25;
    float _754 = fma(_720, _732, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _756 = fma(_726, _732, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _758 = fma(_738, _732, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _760 = _694 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _762 = _754 * _752;
    float _764 = _756 * _752;
    float _766 = _758 * _752;
    float _768 = _760 * _762;
    float _770 = _748 * _764;
    float _772 = _740 * _766;
    float _774 = _748;
    float _776 = _740;
    float _778 = _580;
    float _780 = _598;
    float _782 = _600;
    if (_484)
    {
        float _784 = fma(_520, 2.0, -1.0);
        _774 = _784;
    }
    float _786 = _774;
    if (_484)
    {
        float _788 = fma(_786, (*spvDescriptorSet0.fp_c3)._m0[7].z, _398);
        _492 = _788;
    }
    float _790 = _492;
    if (_484)
    {
        float _792 = fma(_786, (*spvDescriptorSet0.fp_c3)._m0[4].z, _400);
        _494 = _792;
    }
    float _794 = _494;
    float _796 = _794;
    if (_484)
    {
        float _798 = fma(_786, (*spvDescriptorSet0.fp_c3)._m0[6].z, _402);
        _496 = _798;
    }
    float _800 = _496;
    float _802 = _800;
    if (_484)
    {
        float _804 = fma(_786, (*spvDescriptorSet0.fp_c3)._m0[5].z, _432);
        _498 = _804;
    }
    float _806 = _498;
    float _808 = _806;
    if (_484)
    {
        float _810 = _790 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _776 = _810;
    }
    float _812 = _776;
    if (_484)
    {
        float _814 = _794 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _796 = _814;
    }
    float _816 = _796;
    float _818 = _816;
    if (_484)
    {
        float _820 = _806 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _808 = _820;
    }
    float _822 = _808;
    float _824 = _722;
    float _826 = _822;
    if (_484)
    {
        float _828 = 1.0 / _812;
        _824 = _828;
    }
    float _830 = _824;
    if (_484)
    {
        float _832 = _822 * _830;
        _826 = _832;
    }
    float _834 = _826;
    float _836 = _834;
    if (!_484)
    {
        _836 = _460;
    }
    float _838 = _836;
    float _840 = _754 * _578;
    float _842 = _756 * _580;
    if (_484)
    {
        float _844 = _800 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _778 = _844;
    }
    float _846 = _778;
    if (_484)
    {
        float _848 = _816 * _830;
        _802 = _848;
    }
    float _850 = _802;
    float _852 = fma(_840, (*spvDescriptorSet0.fp_c4)._m0[7].x, _768);
    float _854 = _758 * _582;
    float _856 = _850;
    if (_484)
    {
        float _858 = _846 * _830;
        _818 = _858;
    }
    float _860 = _818;
    float _862 = _860;
    if (!_484)
    {
        _862 = _464;
    }
    float _864 = _862;
    float _866 = fma(_842, (*spvDescriptorSet0.fp_c4)._m0[7].y, _770);
    float _868 = fma(_854, (*spvDescriptorSet0.fp_c4)._m0[7].z, _772);
    if (!_484)
    {
        _856 = _462;
    }
    float _870 = _856;
    if (_630)
    {
        _500 = _602;
    }
    float _872 = _500;
    float _874 = _872;
    if (!_630)
    {
        float _876 = fma(_838, (*spvDescriptorSet0.fp_c4)._m0[3].y, _870);
        float _878 = fma(_838, (*spvDescriptorSet0.fp_c4)._m0[3].y, _864);
        float _880 = _876 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _882 = -_878;
        float _884 = fma(_882, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2281 = float2(_880, _884);
        float4 _887 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2281, float2(0.0), isnan(_2281)), int2(0), component::x).xyzw;
        float _889 = _887.x;
        float _891 = _887.y;
        float _893 = _887.z;
        float _895 = _887.w;
        float _897 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _899 = fma(_608, (*spvDescriptorSet0.fp_c4)._m0[2].x, _897);
        float _901 = precise::clamp(_899, 0.0, 1.0);
        float _903 = _889 + _891;
        float _905 = _893 + _903;
        float _907 = -_901;
        float _909 = _907 + 1.0;
        float _911 = _895 + _905;
        float _913 = -_909;
        float _915 = fma(_913, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _917 = precise::clamp(_915, 0.0, 1.0);
        float _919 = fma(_911, 0.25, 1.0);
        float _921 = _919 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _923 = _919 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _925 = _919 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _927 = _921 * _598;
        float _929 = _923 * _600;
        float _931 = _925 * _602;
        float _933 = -_927;
        float _935 = _933 + _598;
        float _937 = -_929;
        float _939 = _937 + _600;
        float _941 = -_931;
        float _943 = _941 + _602;
        float _945 = fma(_917, _935, _927);
        float _947 = fma(_917, _939, _929);
        float _949 = fma(_917, _943, _931);
        _780 = _945;
        _782 = _947;
        _874 = _949;
    }
    float _951 = _780;
    float _953 = _782;
    float _955 = _874;
    float _957 = _951 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _959 = -_754;
    float _961 = _959 + 1.0;
    float _963 = _953 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _965 = -_756;
    float _967 = _965 + 1.0;
    float _969 = -_758;
    float _971 = _969 + 1.0;
    float _973 = _955 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _975 = fma(_957, _961, _852);
    float _977 = fma(_963, _967, _866);
    float _979 = fma(_973, _971, _868);
    out.m_51.x = _975;
    out.m_51.y = _977;
    out.m_51.z = _979;
    out.m_51.w = 1.0;
    return out;
}

