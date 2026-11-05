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
    float2 _1023 = float2(_70, _72);
    float3 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1023, float2(0.0), isnan(_1023))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1023, float2(0.0), isnan(_1023))).xyz;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float2 _1040 = float2(_74, _76);
    float3 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1040, float2(0.0), isnan(_1040))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1040, float2(0.0), isnan(_1040))).xyz;
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
    float _274 = _268 * _268;
    float _276 = fma(_94, _254, _270);
    float _278 = in.m_42.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = fma(_272, _272, _274);
    float _286 = in.m_42.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_276, _276, _284);
    float _294 = rsqrt(_292);
    float _296 = _68 * _266;
    float _298 = -_104;
    float _300 = fma(_268, _294, _298);
    float _302 = -_106;
    float _304 = fma(_272, _294, _302);
    float _306 = -_108;
    float _308 = fma(_276, _294, _306);
    float _310 = 1.0 / _296;
    float _312 = fma(_300, (*spvDescriptorSet0.fp_c4)._m0[0].z, _104);
    float _314 = fma(_304, (*spvDescriptorSet0.fp_c4)._m0[0].z, _106);
    float _316 = fma(_308, (*spvDescriptorSet0.fp_c4)._m0[0].z, _108);
    float _318 = _68 * _282;
    float _320 = _312 * _312;
    float _322 = _68 * _290;
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
    float2 _1420 = float2(_342, _344);
    float _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1420, float2(0.0), isnan(_1420))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1420, float2(0.0), isnan(_1420))).x;
    float _348 = in.m_44.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_44.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_44.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _330 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _368 = _330 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _370 = _330 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _372 = _330 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _374 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[4].x, _366);
    float _376 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[5].x, _368);
    float _378 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[6].x, _370);
    float _380 = fma(_328, (*spvDescriptorSet0.fp_c3)._m0[7].x, _372);
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
    float _416 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[7].z, _380);
    float _418 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[5].z, _376);
    float _420 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[6].z, _378);
    float _422 = _416 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _424 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[4].z, _374);
    float _426 = _418 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _428 = _420 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _430 = _424 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _432 = 1.0 / _422;
    float _434 = -_382;
    float _436 = fma(_426, _432, _434);
    float _438 = -_384;
    float _440 = fma(_430, _432, _438);
    float _442 = -_386;
    float _444 = fma(_428, _432, _442);
    float _446 = _410 * _436;
    float _448 = fma(_408, _440, _446);
    float _450 = fma(_412, _444, _448);
    bool _452 = _450 > 0.0;
    float _454 = _428;
    float _456 = _432;
    float _458 = _370;
    float _460 = 1.0;
    float _462 = _380;
    float _464 = _376;
    float _466 = _374;
    float _468 = _382;
    float _470 = _384;
    float _472 = _386;
    if (_452)
    {
        float2 _1623 = float2(_334, _336);
        float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1623, float2(0.0), isnan(_1623))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1623, float2(0.0), isnan(_1623))).xyz;
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
    float _488 = _312 * _332;
    float _490 = (*spvDescriptorSet0.fp_c4)._m0[8].y * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _492 = -_410;
    float _494 = _488 * _492;
    float _496 = fma((*spvDescriptorSet0.fp_c4)._m0[8].x, (*spvDescriptorSet0.fp_c4)._m0[8].x, _490);
    float _498 = -_408;
    float _500 = fma(_338, _498, _494);
    float _502 = fma((*spvDescriptorSet0.fp_c4)._m0[8].z, (*spvDescriptorSet0.fp_c4)._m0[8].z, _496);
    float _504 = -_412;
    float _506 = fma(_340, _504, _500);
    float _508 = _506 + _506;
    float _510 = rsqrt(_502);
    float _512 = _510 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _514 = _510 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _516 = _510 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    float _518 = -_508;
    float _520 = -_410;
    float _522 = fma(_488, _518, _520);
    float _524 = -_512;
    float _526 = _410 + _524;
    float _528 = -_514;
    float _530 = _408 + _528;
    float _532 = _526 * _526;
    float _534 = fma(_530, _530, _532);
    float _536 = -_516;
    float _538 = _412 + _536;
    float _540 = fma(_538, _538, _534);
    float _542 = rsqrt(_540);
    float _544 = _526 * _542;
    float _546 = _530 * _542;
    float _548 = _538 * _542;
    float _550 = -_508;
    float _552 = -_408;
    float _554 = fma(_338, _550, _552);
    float _556 = -_508;
    float _558 = -_412;
    float _560 = fma(_340, _556, _558);
    float _562 = _488 * _544;
    float _564 = _544;
    if (_452)
    {
        float2 _1765 = float2(_334, _336);
        float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1765, float2(0.0), isnan(_1765))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1765, float2(0.0), isnan(_1765))).x;
        _564 = _566;
    }
    float _568 = _564;
    float _570 = abs(_554);
    float _572 = abs(_522);
    float _574 = precise::max(_570, _572);
    float _576 = fma(_338, _546, _562);
    float _578 = abs(_560);
    float _580 = precise::max(_578, _574);
    float _582 = (*spvDescriptorSet0.fp_c4)._m0[10].y * 11.0;
    float _584 = 1.0 / _580;
    float _586 = _554 * _584;
    float _588 = _522 * _584;
    float _590 = _560 * _584;
    float4 _1810 = float4(_586, _588, _590, float(0));
    float4 _1814 = select(_1810, float4(0.0), isnan(_1810));
    float3 _592 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1814.xyz, uint(rint(_1814.w)), level(_582)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1814.xyz, uint(rint(_1814.w)), level(_582)).xyz;
    float _594 = _592.x;
    float _596 = _592.y;
    float _598 = _592.z;
    float _600 = _482;
    float _602 = _484;
    float _604 = _486;
    if (!_452)
    {
        float2 _1833 = float2(_342, _344);
        float3 _606 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1833, float2(0.0), isnan(_1833))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1833, float2(0.0), isnan(_1833))).xyz;
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
    float _620 = fma(_340, _548, _576);
    float _622 = fma((*spvDescriptorSet0.fp_c4)._m0[10].y, 0.5, 0.5);
    float _624 = -_512;
    float _626 = _488 * _624;
    float _628 = (*spvDescriptorSet0.fp_c4)._m0[10].y * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _630 = _488 * _410;
    float _632 = precise::max(_620, 9.9999999392252902907785028219223e-09);
    float _634 = -_514;
    float _636 = fma(_338, _634, _626);
    float _638 = _622 * _622;
    float _640 = _638 * 0.5;
    float _642 = fma(_338, _408, _630);
    float _644 = fma(_628, _628, -1.0);
    float _646 = _632 * _632;
    float _648 = fma(_340, _412, _642);
    float _650 = -_516;
    float _652 = fma(_340, _650, _636);
    float _654 = fma(_646, _644, 1.0);
    float _656 = -_640;
    float _658 = _656 + 1.0;
    float _660 = precise::max(_648, 9.9999999392252902907785028219223e-09);
    float _662 = precise::max(_652, 9.9999999392252902907785028219223e-09);
    float _664 = 0.0 + _652;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    float _668 = precise::max(_654, 9.9999999392252902907785028219223e-09);
    float _670 = fma(_660, _658, _640);
    float _672 = fma(_662, _658, _640);
    float _674 = 1.0 / _668;
    float _676 = -(*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _678 = 1.0 + _676;
    float _680 = fma(_660, -5.554729938507080078125, -6.9831600189208984375);
    float _682 = _660 * _680;
    float _684 = -(*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _686 = 1.0 + _684;
    float _688 = -(*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _690 = 1.0 + _688;
    float _692 = 1.0 / _672;
    float _694 = _628 * _674;
    float _696 = 1.0 / _670;
    float _698 = _694 * _694;
    float _700 = _698 * 0.3183098733425140380859375;
    float _702 = exp2(_682);
    float _704 = _692 * _696;
    float _706 = fma(_678, _702, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _708 = fma(_686, _702, (*spvDescriptorSet0.fp_c4)._m0[5].y);
    float _710 = fma(_690, _702, (*spvDescriptorSet0.fp_c4)._m0[5].z);
    float _712 = _700 * _704;
    float _714 = _712 * 0.25;
    float _716 = _700;
    float _718 = _670;
    if (_452)
    {
        float _720 = fma(_568, 2.0, -1.0);
        _460 = _720;
    }
    float _722 = _460;
    float _724 = _722;
    if (_452)
    {
        float _726 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[7].z, _380);
        _462 = _726;
    }
    float _728 = _462;
    float _730 = _728;
    if (_452)
    {
        float _732 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[5].z, _376);
        _464 = _732;
    }
    float _734 = _464;
    if (_452)
    {
        float _736 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[4].z, _374);
        _466 = _736;
    }
    float _738 = _466;
    float _740 = _738;
    if (_452)
    {
        float _742 = fma(_722, (*spvDescriptorSet0.fp_c3)._m0[6].z, _378);
        _724 = _742;
    }
    float _744 = _724;
    if (_452)
    {
        float _746 = _728 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
        _730 = _746;
    }
    float _748 = _730;
    if (_452)
    {
        float _750 = _734 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _716 = _750;
    }
    float _752 = _716;
    if (_452)
    {
        float _754 = _738 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        _718 = _754;
    }
    float _756 = _718;
    if (_452)
    {
        float _758 = _744 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        _740 = _758;
    }
    float _760 = _740;
    float _762 = _666 * (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _764 = _748;
    if (_452)
    {
        float _766 = 1.0 / _748;
        _764 = _766;
    }
    float _768 = _764;
    if (_452)
    {
        float _770 = -_382;
        float _772 = fma(_752, _768, _770);
        _468 = _772;
    }
    float _774 = _468;
    float _776 = _774;
    if (!_452)
    {
        _776 = _436;
    }
    float _778 = _776;
    if (_452)
    {
        float _780 = -_384;
        float _782 = fma(_756, _768, _780);
        _470 = _782;
    }
    float _784 = _470;
    float _786 = _784;
    if (!_452)
    {
        _786 = _440;
    }
    float _788 = _786;
    if (_452)
    {
        float _790 = -_386;
        float _792 = fma(_760, _768, _790);
        _472 = _792;
    }
    float _794 = _472;
    float _796 = _794;
    if (!_452)
    {
        _796 = _444;
    }
    float _798 = _796;
    float _800 = _778 * _778;
    float _802 = _708 * _714;
    float _804 = _706 * _594;
    float _806 = _708 * _596;
    float _808 = fma(_788, _788, _800);
    float _810 = _762 * _802;
    float _812 = _614 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _814 = _616 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _816 = fma(_798, _798, _808);
    float _818 = _666 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _820 = fma(_806, (*spvDescriptorSet0.fp_c4)._m0[7].y, _810);
    float _822 = _666 * (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _824 = _618 * (*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _826 = -_708;
    float _828 = _826 + 1.0;
    float _830 = sqrt(_816);
    float _832 = -(*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _834 = _830 + _832;
    float _836 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _838 = _830 + _836;
    float _840 = _834 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _842 = precise::clamp(_840, 0.0, 1.0);
    float _844 = _706 * _714;
    float _846 = _710 * _714;
    float _848 = -_706;
    float _850 = _848 + 1.0;
    float _852 = _838 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _854 = precise::clamp(_852, 0.0, 1.0);
    float _856 = _818 * _844;
    float _858 = abs(_842);
    float _860 = log2(_858);
    float _862 = _822 * _846;
    float _864 = fma(_804, (*spvDescriptorSet0.fp_c4)._m0[7].x, _856);
    float _866 = _710 * _598;
    float _868 = -_710;
    float _870 = _868 + 1.0;
    float _872 = fma(_866, (*spvDescriptorSet0.fp_c4)._m0[7].z, _862);
    float _874 = abs(_854);
    float _876 = log2(_874);
    float _878 = _860 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _880 = exp2(_878);
    float _882 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _884 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _886 = 0.3183098733425140380859375 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _888 = -_812;
    float _890 = fma(_818, _882, _888);
    float _892 = -_814;
    float _894 = fma(_762, _884, _892);
    float _896 = -_824;
    float _898 = fma(_822, _886, _896);
    float _900 = fma(_880, _890, _812);
    float _902 = fma(_880, _894, _814);
    float _904 = fma(_880, _898, _824);
    float _906 = fma(_900, _850, _864);
    float _908 = fma(_902, _828, _820);
    float _910 = fma(_904, _870, _872);
    float _912 = _854 * 3.0;
    float _914 = precise::clamp(_912, 0.0, 1.0);
    float _916 = -(*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _918 = _906 + _916;
    float _920 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _922 = _908 + _920;
    float _924 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _926 = _910 + _924;
    float _928 = fma(_914, _918, (*spvDescriptorSet0.fp_c4)._m0[13].x);
    float _930 = fma(_914, _922, (*spvDescriptorSet0.fp_c4)._m0[13].y);
    float _932 = fma(_914, _926, (*spvDescriptorSet0.fp_c4)._m0[13].z);
    float _934 = _876 * 0.100000001490116119384765625;
    float _936 = -_854;
    float _938 = _936 + 1.0;
    float _940 = precise::max(_928, 9.9999999392252902907785028219223e-09);
    float _942 = precise::max(_930, 9.9999999392252902907785028219223e-09);
    float _944 = precise::max(_932, 9.9999999392252902907785028219223e-09);
    float _946 = sqrt(_940);
    float _948 = sqrt(_942);
    float _950 = sqrt(_944);
    float _952 = fma(_938, (*spvDescriptorSet0.fp_c4)._m0[13].x, _946);
    float _954 = -_952;
    float _956 = _928 + _954;
    float _958 = exp2(_934);
    float _960 = fma(_938, (*spvDescriptorSet0.fp_c4)._m0[13].y, _948);
    float _962 = -_960;
    float _964 = _930 + _962;
    float _966 = fma(_938, (*spvDescriptorSet0.fp_c4)._m0[13].z, _950);
    float _968 = _854 * 5.0;
    float _970 = -_966;
    float _972 = _932 + _970;
    float _974 = fma(_958, _956, _952);
    float _976 = fma(_958, _964, _960);
    float _978 = fma(_958, _972, _966);
    float _980 = precise::min(_968, 1.0);
    out.m_47.x = _974;
    out.m_47.y = _976;
    out.m_47.z = _978;
    out.m_47.w = _980;
    return out;
}

