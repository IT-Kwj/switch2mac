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
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_42.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_42.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float _76 = _72 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _78 = _74 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float2 _998 = float2(_72, _74);
    float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_998, float2(0.0), isnan(_998))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_998, float2(0.0), isnan(_998))).xyz;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float2 _1015 = float2(_76, _78);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1015, float2(0.0), isnan(_1015))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1015, float2(0.0), isnan(_1015))).xyz;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _86 * _86;
    float _100 = fma(_84, _84, _98);
    float _102 = fma(_88, _88, _100);
    float _104 = rsqrt(_102);
    float _106 = _86 * _104;
    float _108 = _84 * _104;
    float _110 = _88 * _104;
    float _112 = _106 * _106;
    float _114 = fma(_108, _108, _112);
    float _116 = sqrt(_114);
    bool _120 = _116 >= 0.00999999977648258209228515625;
    bool _122 = isnan(_116);
    bool _124 = _120 || _122;
    bool _126 = isnan(0.00999999977648258209228515625);
    bool _128 = _124 || _126;
    float _130 = 0.0;
    float _132 = _86;
    float _134 = _104;
    float _136 = _116;
    if (!_128)
    {
        float _138 = fma(_110, _110, _112);
        _130 = _138;
    }
    float _140 = _130;
    float _142 = _108 * _94;
    float _144 = _106 * _94;
    float _146 = 0.0;
    if (!_128)
    {
        _146 = 0.0;
    }
    float _148 = _146;
    float _150 = _112;
    float _152 = _148;
    if (!_128)
    {
        float _154 = rsqrt(_140);
        _150 = _154;
    }
    float _156 = _150;
    float _158 = _156;
    if (!_128)
    {
        float _160 = _110 * _156;
        _132 = _160;
    }
    float _162 = _132;
    float _164 = _162;
    if (!_128)
    {
        float _166 = _106 * _156;
        _134 = _166;
    }
    float _168 = _134;
    float _170 = 0.0;
    float _172 = _168;
    if (!_128)
    {
        float _174 = _110 * _162;
        _170 = _174;
    }
    float _176 = _170;
    float _178 = _176;
    if (!_128)
    {
        float _180 = fma(_108, _168, -0.0);
        _158 = _180;
    }
    float _182 = _158;
    float _184 = _182;
    if (!_128)
    {
        float _186 = -_168;
        float _188 = (-0.0) + _186;
        _136 = _188;
    }
    float _190 = _136;
    float _192 = _190;
    if (!_128)
    {
        float _194 = -_168;
        float _196 = -_176;
        float _198 = fma(_106, _194, _196);
        _178 = _198;
    }
    float _200 = _178;
    float _202 = _200;
    if (!_128)
    {
        float _204 = _108 * _162;
        _172 = _204;
    }
    float _206 = _172;
    bool _208 = !_128;
    float _210 = _206;
    if (!_208)
    {
        float _212 = rsqrt(_114);
        float _214 = _106 * _212;
        float _216 = -_212;
        float _218 = _108 * _216;
        float _220 = _110 * _214;
        float _222 = _108 * _218;
        float _224 = _110 * _218;
        float _226 = _220 * _220;
        float _228 = -_222;
        float _230 = fma(_106, _214, _228);
        float _232 = fma(_224, _224, _226);
        float _234 = fma(_230, _230, _232);
        float _236 = rsqrt(_234);
        float _238 = _230 * _236;
        float _240 = _224 * _236;
        float _242 = -_220;
        float _244 = fma(_242, _236, -0.0);
        _184 = _218;
        _202 = _214;
        _164 = _244;
        _210 = 0.0;
        _152 = _240;
        _192 = _238;
    }
    float _246 = _184;
    float _248 = _202;
    float _250 = _164;
    float _252 = _210;
    float _254 = _152;
    float _256 = _192;
    float _258 = fma(_92, _246, _144);
    float _260 = _110 * _94;
    float _262 = fma(_92, _248, _142);
    float _264 = in.m_44.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_96, _250, _258);
    float _272 = fma(_92, _252, _260);
    float _274 = fma(_96, _254, _262);
    float _276 = in.m_44.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _270 * _270;
    float _284 = fma(_96, _256, _272);
    float _286 = in.m_44.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_274, _274, _282);
    float _294 = fma(_284, _284, _292);
    float _296 = rsqrt(_294);
    float _298 = -_106;
    float _300 = fma(_270, _296, _298);
    float _302 = -_108;
    float _304 = fma(_274, _296, _302);
    float _306 = -_110;
    float _308 = fma(_284, _296, _306);
    float _310 = _70 * _268;
    float _312 = fma(_300, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _314 = fma(_304, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _316 = _70 * _290;
    float _318 = fma(_308, (*spvDescriptorSet0.fp_c4)._m0[0].z, _110);
    float _320 = _312 * _312;
    float _322 = _70 * _280;
    float _324 = fma(_314, _314, _320);
    float _326 = 1.0 / _316;
    float _328 = fma(_318, _318, _324);
    float _330 = rsqrt(_328);
    float _332 = _310 * _326;
    float _334 = _322 * _326;
    float _336 = fma(_332, 0.5, 0.5);
    float _338 = fma(_334, -0.5, 0.5);
    float _340 = _314 * _330;
    float _342 = _318 * _330;
    float _344 = fma(_340, 0.0199999995529651641845703125, _336);
    float _346 = fma(_342, 0.0199999995529651641845703125, _338);
    float2 _1395 = float2(_344, _346);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1395, float2(0.0), isnan(_1395))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1395, float2(0.0), isnan(_1395))).x;
    float _350 = in.m_46.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_46.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_46.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _334 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _370 = _334 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _372 = _334 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _374 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[7].x, _368);
    float _376 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[4].x, _370);
    float _378 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[6].x, _372);
    float _380 = _70 * _354;
    float _382 = _70 * _360;
    float _384 = _70 * _366;
    float _386 = -_380;
    float _388 = _386 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _390 = -_382;
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _394 = -_384;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _398 = _388 * _388;
    float _400 = fma(_392, _392, _398);
    float _402 = fma(_396, _396, _400);
    float _404 = _334 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _406 = rsqrt(_402);
    float _408 = fma(_332, (*spvDescriptorSet0.fp_c3)._m0[5].x, _404);
    float _410 = _388 * _406;
    float _412 = _392 * _406;
    float _414 = _396 * _406;
    float _416 = fma(_348, 2.0, -1.0);
    float _418 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[7].z, _374);
    float _420 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[5].z, _408);
    float _422 = _418 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _424 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[4].z, _376);
    float _426 = _420 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _428 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[6].z, _378);
    float _430 = 1.0 / _422;
    float _432 = _424 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _434 = _428 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _436 = _426 * _430;
    float _438 = _432 * _430;
    float _440 = _434 * _430;
    float _442 = -_380;
    float _444 = _442 + _436;
    float _446 = -_382;
    float _448 = _446 + _438;
    float _450 = -_384;
    float _452 = _450 + _440;
    float _454 = _410 * _444;
    float _456 = fma(_412, _448, _454);
    float _458 = fma(_414, _452, _456);
    bool _460 = _458 > 0.0;
    float _462 = _384;
    float _464 = _456;
    float _466 = _432;
    float _468 = _374;
    float _470 = _376;
    float _472 = _378;
    float _474 = _408;
    float _476 = _440;
    if (_460)
    {
        float2 _1603 = float2(_336, _338);
        float3 _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1603, float2(0.0), isnan(_1603))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1603, float2(0.0), isnan(_1603))).xyz;
        float _480 = _478.x;
        float _482 = _478.y;
        float _484 = _478.z;
        _462 = _480;
        _464 = _482;
        _466 = _484;
    }
    float _486 = _462;
    float _488 = _464;
    float _490 = _466;
    float _492 = _336;
    if (_460)
    {
        float2 _1627 = float2(_336, _338);
        float _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1627, float2(0.0), isnan(_1627))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1627, float2(0.0), isnan(_1627))).x;
        _492 = _494;
    }
    float _496 = _492;
    float _498 = _312 * _330;
    float _500 = -_410;
    float _502 = _498 * _500;
    float _504 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _506 = -_412;
    float _508 = fma(_340, _506, _502);
    float _510 = -_414;
    float _512 = fma(_342, _510, _508);
    float _514 = _512 + _512;
    float _516 = -_514;
    float _518 = -_410;
    float _520 = fma(_498, _516, _518);
    float _522 = -_514;
    float _524 = -_412;
    float _526 = fma(_340, _522, _524);
    float _528 = -_514;
    float _530 = -_414;
    float _532 = fma(_342, _528, _530);
    float _534 = abs(_526);
    float _536 = abs(_520);
    float _538 = precise::max(_534, _536);
    float _540 = abs(_532);
    float _542 = precise::max(_540, _538);
    float _544 = 1.0 / _542;
    float _546 = _526 * _544;
    float _548 = _520 * _544;
    float _550 = _532 * _544;
    float4 _1715 = float4(_546, _548, _550, float(0));
    float4 _1719 = select(_1715, float4(0.0), isnan(_1715));
    float3 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1719.xyz, uint(rint(_1719.w)), level(_504)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1719.xyz, uint(rint(_1719.w)), level(_504)).xyz;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = _552.z;
    float _560 = _486;
    float _562 = _488;
    float _564 = _490;
    if (!_460)
    {
        float2 _1738 = float2(_344, _346);
        float3 _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1738, float2(0.0), isnan(_1738))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1738, float2(0.0), isnan(_1738))).xyz;
        float _568 = _566.x;
        float _570 = _566.y;
        float _572 = _566.z;
        _560 = _568;
        _562 = _570;
        _564 = _572;
    }
    float _574 = _560;
    float _576 = _562;
    float _578 = _564;
    float _580 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _582 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _584 = sqrt(_402);
    float _586 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _588 = _580 * _580;
    float _590 = _588 * 0.5;
    float _592 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _586);
    float _594 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _592);
    float _596 = rsqrt(_594);
    bool _598 = _584 >= (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _600 = isnan(_584);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.fp_c4)._m0[2].z);
    bool _606 = _602 || _604;
    float _608 = _596 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _610 = _596 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _612 = -_608;
    float _614 = _410 + _612;
    float _616 = _596 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _618 = -_610;
    float _620 = _412 + _618;
    float _622 = -_608;
    float _624 = _498 * _622;
    float _626 = _614 * _614;
    float _628 = -_616;
    float _630 = _414 + _628;
    float _632 = -_610;
    float _634 = fma(_340, _632, _624);
    float _636 = fma(_620, _620, _626);
    float _638 = -_616;
    float _640 = fma(_342, _638, _634);
    float _642 = fma(_630, _630, _636);
    float _644 = rsqrt(_642);
    float _646 = _614 * _644;
    float _648 = _620 * _644;
    float _650 = _630 * _644;
    float _652 = fma(_582, _582, -1.0);
    float _654 = _498 * _646;
    float _656 = _498 * _410;
    float _658 = fma(_340, _648, _654);
    float _660 = fma(_340, _412, _656);
    float _662 = fma(_342, _650, _658);
    float _664 = fma(_342, _414, _660);
    float _666 = precise::max(_640, 9.9999999392252902907785028219223e-09);
    float _668 = 0.0 + _640;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = precise::max(_662, 9.9999999392252902907785028219223e-09);
    float _674 = -_590;
    float _676 = _674 + 1.0;
    float _678 = precise::max(_664, 9.9999999392252902907785028219223e-09);
    float _680 = _672 * _672;
    float _682 = fma(_666, _676, _590);
    float _684 = fma(_678, -5.554729938507080078125, -6.9831600189208984375);
    float _686 = fma(_678, _676, _590);
    float _688 = fma(_680, _652, 1.0);
    float _690 = _678 * _684;
    float _692 = 1.0 / _682;
    float _694 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _696 = 1.0 + _694;
    float _698 = precise::max(_688, 9.9999999392252902907785028219223e-09);
    float _700 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _702 = 1.0 + _700;
    float _704 = 1.0 / _698;
    float _706 = 1.0 / _686;
    float _708 = exp2(_690);
    float _710 = _582 * _704;
    float _712 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _714 = 1.0 + _712;
    float _716 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _718 = _710 * _710;
    float _720 = _692 * _706;
    float _722 = _718 * 0.3183098733425140380859375;
    float _724 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _726 = _722 * _720;
    float _728 = _726 * 0.25;
    float _730 = fma(_696, _708, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _732 = fma(_702, _708, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _734 = fma(_714, _708, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _736 = _670 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _738 = _730 * _728;
    float _740 = _732 * _728;
    float _742 = _734 * _728;
    float _744 = _736 * _738;
    float _746 = _724 * _740;
    float _748 = _716 * _742;
    float _750 = _724;
    float _752 = _716;
    float _754 = _556;
    float _756 = _574;
    float _758 = _576;
    if (_460)
    {
        float _760 = fma(_496, 2.0, -1.0);
        _750 = _760;
    }
    float _762 = _750;
    if (_460)
    {
        float _764 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[7].z, _374);
        _468 = _764;
    }
    float _766 = _468;
    if (_460)
    {
        float _768 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[4].z, _376);
        _470 = _768;
    }
    float _770 = _470;
    float _772 = _770;
    if (_460)
    {
        float _774 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[6].z, _378);
        _472 = _774;
    }
    float _776 = _472;
    float _778 = _776;
    if (_460)
    {
        float _780 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[5].z, _408);
        _474 = _780;
    }
    float _782 = _474;
    float _784 = _782;
    if (_460)
    {
        float _786 = _766 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _752 = _786;
    }
    float _788 = _752;
    if (_460)
    {
        float _790 = _770 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _772 = _790;
    }
    float _792 = _772;
    float _794 = _792;
    if (_460)
    {
        float _796 = _782 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _784 = _796;
    }
    float _798 = _784;
    float _800 = _698;
    float _802 = _798;
    if (_460)
    {
        float _804 = 1.0 / _788;
        _800 = _804;
    }
    float _806 = _800;
    if (_460)
    {
        float _808 = _798 * _806;
        _802 = _808;
    }
    float _810 = _802;
    float _812 = _810;
    if (!_460)
    {
        _812 = _436;
    }
    float _814 = _812;
    float _816 = _730 * _554;
    float _818 = _732 * _556;
    if (_460)
    {
        float _820 = _776 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _754 = _820;
    }
    float _822 = _754;
    if (_460)
    {
        float _824 = _792 * _806;
        _778 = _824;
    }
    float _826 = _778;
    float _828 = fma(_816, (*spvDescriptorSet0.fp_c4)._m0[7].x, _744);
    float _830 = _734 * _558;
    float _832 = _826;
    if (_460)
    {
        float _834 = _822 * _806;
        _794 = _834;
    }
    float _836 = _794;
    float _838 = _836;
    if (!_460)
    {
        _838 = _440;
    }
    float _840 = _838;
    float _842 = fma(_818, (*spvDescriptorSet0.fp_c4)._m0[7].y, _746);
    float _844 = fma(_830, (*spvDescriptorSet0.fp_c4)._m0[7].z, _748);
    if (!_460)
    {
        _832 = _438;
    }
    float _846 = _832;
    if (_606)
    {
        _476 = _578;
    }
    float _848 = _476;
    float _850 = _848;
    if (!_606)
    {
        float _852 = fma(_814, (*spvDescriptorSet0.fp_c4)._m0[3].y, _846);
        float _854 = fma(_814, (*spvDescriptorSet0.fp_c4)._m0[3].y, _840);
        float _856 = _852 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
        float _858 = -_854;
        float _860 = fma(_858, (*spvDescriptorSet0.fp_c4)._m0[3].x, -0.0);
        float2 _2223 = float2(_856, _860);
        float4 _863 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2223, float2(0.0), isnan(_2223)), int2(0), component::x).xyzw;
        float _865 = _863.x;
        float _867 = _863.y;
        float _869 = _863.z;
        float _871 = _863.w;
        float _873 = -(*spvDescriptorSet0.fp_c4)._m0[2].y;
        float _875 = fma(_584, (*spvDescriptorSet0.fp_c4)._m0[2].x, _873);
        float _877 = precise::clamp(_875, 0.0, 1.0);
        float _879 = _865 + _867;
        float _881 = _869 + _879;
        float _883 = -_877;
        float _885 = _883 + 1.0;
        float _887 = _871 + _881;
        float _889 = -_885;
        float _891 = fma(_889, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
        float _893 = precise::clamp(_891, 0.0, 1.0);
        float _895 = fma(_887, 0.25, 1.0);
        float _897 = _895 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
        float _899 = _895 * (*spvDescriptorSet0.fp_c4)._m0[14].y;
        float _901 = _895 * (*spvDescriptorSet0.fp_c4)._m0[14].z;
        float _903 = _897 * _574;
        float _905 = _899 * _576;
        float _907 = _901 * _578;
        float _909 = -_903;
        float _911 = _909 + _574;
        float _913 = -_905;
        float _915 = _913 + _576;
        float _917 = -_907;
        float _919 = _917 + _578;
        float _921 = fma(_893, _911, _903);
        float _923 = fma(_893, _915, _905);
        float _925 = fma(_893, _919, _907);
        _756 = _921;
        _758 = _923;
        _850 = _925;
    }
    float _927 = _756;
    float _929 = _758;
    float _931 = _850;
    float _933 = _927 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _935 = -_730;
    float _937 = _935 + 1.0;
    float _939 = _929 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _941 = -_732;
    float _943 = _941 + 1.0;
    float _945 = -_734;
    float _947 = _945 + 1.0;
    float _949 = _931 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _951 = fma(_933, _937, _828);
    float _953 = fma(_939, _943, _842);
    float _955 = fma(_949, _947, _844);
    out.m_49.x = _951;
    out.m_49.y = _953;
    out.m_49.z = _955;
    out.m_49.w = 1.0;
    return out;
}

