#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    texture2d<float> fp_t_tcb_16 [[id(4)]];
    sampler fp_t_tcb_16Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_E [[id(12)]];
    sampler fp_t_tcb_ESmplr [[id(13)]];
    texture2d<float> fp_t_tcb_10 [[id(14)]];
    sampler fp_t_tcb_10Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_1A [[id(16)]];
    sampler fp_t_tcb_1ASmplr [[id(17)]];
    texture2d<float> fp_t_tcb_8 [[id(18)]];
    sampler fp_t_tcb_8Smplr [[id(19)]];
    texture2d<float> fp_t_tcb_1E [[id(20)]];
    sampler fp_t_tcb_1ESmplr [[id(21)]];
    texture2d<float> fp_t_tcb_14 [[id(22)]];
    sampler fp_t_tcb_14Smplr [[id(23)]];
    texture2d<float> fp_t_tcb_18 [[id(24)]];
    sampler fp_t_tcb_18Smplr [[id(25)]];
    texture2d_array<float> fp_t_tcb_1C [[id(26)]];
    sampler fp_t_tcb_1CSmplr [[id(27)]];
    sampler fp_t_tcb_16Smplr_w [[id(28)]];
    sampler fp_t_tcb_ASmplr_w [[id(29)]];
    sampler fp_t_tcb_CSmplr_w [[id(30)]];
    sampler fp_t_tcb_12Smplr_w [[id(31)]];
    sampler fp_t_tcb_ESmplr_w [[id(32)]];
    sampler fp_t_tcb_10Smplr_w [[id(33)]];
    sampler fp_t_tcb_1ASmplr_w [[id(34)]];
    sampler fp_t_tcb_8Smplr_w [[id(35)]];
    sampler fp_t_tcb_1ESmplr_w [[id(36)]];
    sampler fp_t_tcb_14Smplr_w [[id(37)]];
    sampler fp_t_tcb_18Smplr_w [[id(38)]];
    sampler fp_t_tcb_1CSmplr_w [[id(39)]];
    constant dm_border_t* dm_border [[id(40)]];
};

struct main0_out
{
    float4 m_73 [[color(0)]];
    float4 m_75 [[color(1)]];
};

struct main0_in
{
    float4 m_60 [[user(locn0)]];
    float4 m_68 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_60.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_60.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _82;
    float _98 = _96 * _88;
    float _100 = _96 * _94;
    float2 _1335 = float2(_98, _100);
    float2 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1335, float2(0.0), isnan(_1335))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1335, float2(0.0), isnan(_1335))).xy;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = in.m_62.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_62.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_64.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_64.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_62.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_64.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_66.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_66.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_66.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _96 * _114;
    float _166 = _96 * _120;
    float _168 = _96 * _126;
    float _170 = _96 * _132;
    float _172 = _164 * _164;
    float _174 = _96 * _138;
    float _176 = _168 * _168;
    float _178 = _96 * _144;
    float _180 = fma(_166, _166, _172);
    float _182 = _96 * _150;
    float _184 = fma(_170, _170, _176);
    float _186 = _96 * _156;
    float _188 = fma(_174, _174, _180);
    float _190 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _192 = _182 + _190;
    float _194 = in.m_64.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = fma(_178, _178, _184);
    float _202 = rsqrt(_188);
    float _204 = _96 * _162;
    float _206 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _208 = _186 + _206;
    float _210 = _192 * _192;
    float _212 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _214 = _204 + _212;
    float _216 = fma(_208, _208, _210);
    float _218 = rsqrt(_200);
    float _220 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _222 = _186 + _220;
    float _224 = fma(_214, _214, _216);
    float _226 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _228 = _204 + _226;
    float _230 = _166 * _202;
    float _232 = _174 * _202;
    float _234 = _164 * _202;
    float _236 = sqrt(_224);
    float _238 = _228 * _228;
    float _240 = _178 * _218;
    float _242 = _170 * _218;
    float _244 = _168 * _218;
    float _246 = fma(_222, _222, _238);
    float _248 = _230 * _240;
    float _250 = _234 * _242;
    float _252 = _232 * _244;
    float _254 = _96 * _198;
    float _256 = -_248;
    float _258 = fma(_232, _242, _256);
    float _260 = -_250;
    float _262 = fma(_230, _244, _260);
    float _264 = -_252;
    float _266 = fma(_234, _240, _264);
    float _268 = spvFAdd(_236, 9.9999997473787516355514526367188e-06);
    float _270 = _254 * _258;
    float _272 = _254 * _262;
    float _274 = _254 * _266;
    float _276 = 1.0 / _268;
    float _278 = _270 * _270;
    float _280 = fma(_274, _274, _278);
    float _282 = sqrt(_246);
    float _284 = fma(_272, _272, _280);
    float _286 = rsqrt(_284);
    float _288 = _192 * _276;
    float _290 = _208 * _276;
    float _292 = _214 * _276;
    float _294 = _242 * _290;
    bool _298 = _282 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _300 = _270 * _286;
    float _302 = _274 * _286;
    float _304 = _272 * _286;
    float _306 = _288 * _300;
    float _308 = _262;
    float _310 = _306;
    float _312 = _276;
    if (_298)
    {
        float _314 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _308 = _314;
    }
    float _316 = _308;
    float _318 = fma(_290, _302, _306);
    float _320 = -_288;
    float _322 = -_294;
    float _324 = fma(_244, _320, _322);
    float _326 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _328 = _282 + _326;
    float _330 = fma(_292, _304, _318);
    float _332 = -_292;
    float _334 = fma(_240, _332, _324);
    float _336 = _330 * (-0.5);
    float _338 = _334 * (-0.5);
    float _340 = fma(_100, 2.5, _336);
    float _342 = fma(_98, 2.5, _338);
    float _344 = _316;
    float _346 = _318;
    float _348 = _340;
    if (_298)
    {
        float _350 = _328 * _316;
        _344 = _350;
    }
    float _352 = _344;
    float _354 = 0.0;
    if (_298)
    {
        float _356 = _352 * 0.15915493667125701904296875;
        _354 = _356;
    }
    float _358 = _354;
    float _360 = _328;
    if (_298)
    {
        float _362 = _358 * 6.283185482025146484375;
        float _364 = cos(_362);
        _360 = _364;
    }
    float _366 = _360;
    float _368 = fma(_106, 0.25, _342);
    float _370 = fma(_108, 0.25, _340);
    float2 _1724 = float2(_368, _370);
    float2 _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1724, float2(0.0), isnan(_1724))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1724, float2(0.0), isnan(_1724))).xy;
    float _374 = _372.x;
    float _376 = _372.y;
    float2 _1736 = float2(_98, _100);
    float _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1736, float2(0.0), isnan(_1736))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1736, float2(0.0), isnan(_1736))).x;
    float _380 = _352;
    if (_298)
    {
        float _382 = _358 * 6.283185482025146484375;
        float _384 = sin(_382);
        _380 = _384;
    }
    float _386 = _380;
    if (_298)
    {
        float _388 = _182 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _310 = _388;
    }
    float _390 = _310;
    float _392 = _390;
    if (_298)
    {
        float _394 = _366 + (-1.0);
        _346 = _394;
    }
    float _396 = _346;
    float _398 = _396;
    if (!_298)
    {
        _348 = _182;
    }
    float _400 = _348;
    float _402 = _400;
    if (_298)
    {
        float _404 = _396 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _312 = _404;
    }
    float _406 = _312;
    float _408 = _246;
    if (_298)
    {
        float _410 = rsqrt(_246);
        _408 = _410;
    }
    float _412 = _408;
    if (_298)
    {
        float _414 = fma(_182, _366, _406);
        _402 = _414;
    }
    float _416 = _402;
    float _418 = _386;
    if (_298)
    {
        float _420 = fma(_386, _390, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _418 = _420;
    }
    float _422 = _418;
    float _424 = _422;
    if (!_298)
    {
        _392 = _186;
    }
    float _426 = _392;
    float _428 = _426;
    if (_298)
    {
        float _430 = _412 * _422;
        _398 = _430;
    }
    float _432 = _398;
    if (!_298)
    {
        _424 = _204;
    }
    float _434 = _424;
    float _436 = _434;
    if (_298)
    {
        float _438 = fma(_222, _432, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _428 = _438;
    }
    float _440 = _428;
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _444 = _416 + _442;
    float _446 = _444;
    if (_298)
    {
        float _448 = fma(_228, _432, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _436 = _448;
    }
    float _450 = _436;
    float _452 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _454 = _440 + _452;
    float _456 = _444 * _444;
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _460 = _450 + _458;
    float _462 = fma(_454, _454, _456);
    float _464 = fma(_460, _460, _462);
    float _466 = rsqrt(_464);
    float _468 = _466 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _470 = _454 * _468;
    float _472 = _460 * _468;
    float _474 = _470 * _470;
    float _476 = _472 * _472;
    float _478 = _474 + _476;
    float _480 = sqrt(_478);
    bool _482 = _480 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _484 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _486 = _480 + _484;
    float _488 = _358;
    float _490 = _478;
    float _492 = _464;
    float _494 = _468;
    float _496 = _470;
    float _498 = _472;
    float _500 = _474;
    float _502 = _476;
    if (_482)
    {
        float _504 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _488 = _504;
    }
    float _506 = _488;
    if (_482)
    {
        float _508 = rsqrt(_478);
        _490 = _508;
    }
    float _510 = _490;
    if (_482)
    {
        float _512 = _486 * _506;
        _492 = _512;
    }
    float _514 = _492;
    float _516 = 0.0;
    if (_482)
    {
        float _518 = _514 * 0.15915493667125701904296875;
        _516 = _518;
    }
    float _520 = _516;
    float _522 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _524 = _486;
    if (_482)
    {
        float _526 = _520 * 6.283185482025146484375;
        float _528 = sin(_526);
        _524 = _528;
    }
    float _530 = _524;
    float _532 = precise::max(0.0, _522);
    float _534 = _514;
    float _536 = _532;
    if (_482)
    {
        float _538 = _520 * 6.283185482025146484375;
        float _540 = cos(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = -_468;
    float _546 = -_532;
    float _548 = fma(_444, _544, _546);
    if (_482)
    {
        float _550 = _548 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _494 = _550;
    }
    float _552 = _494;
    float _554 = _530;
    float _556 = _552;
    if (_482)
    {
        float _558 = fma(_530, _552, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _554 = _558;
    }
    float _560 = _554;
    float _562 = _560;
    if (!_482)
    {
        _556 = _548;
    }
    float _564 = _556;
    float _566 = _564;
    if (_482)
    {
        float _568 = _510 * _560;
        _562 = _568;
    }
    float _570 = _562;
    if (_482)
    {
        float _572 = _542 + (-1.0);
        _446 = _572;
    }
    float _574 = _446;
    if (_482)
    {
        float _576 = _470 * _570;
        _496 = _576;
    }
    float _578 = _496;
    if (_482)
    {
        float _580 = _472 * _570;
        _498 = _580;
    }
    float _582 = _498;
    if (_482)
    {
        float _584 = _574 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _536 = _584;
    }
    float _586 = _536;
    if (_482)
    {
        float _588 = _578 * _578;
        _500 = _588;
    }
    float _590 = _500;
    if (_482)
    {
        float _592 = _582 * _582;
        _502 = _592;
    }
    float _594 = _502;
    if (_482)
    {
        float _596 = fma(_548, _542, _586);
        _566 = _596;
    }
    float _598 = _566;
    float _600 = fma(_598, _598, _590);
    float _602 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _604 = fma(_236, (*spvDescriptorSet0.fp_c9)._m0[63].x, _602);
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = _600 + _594;
    float _610 = -_606;
    float _612 = _610 + 1.0;
    float _614 = rsqrt(_608);
    float _616 = abs(_612);
    float _618 = log2(_616);
    float _620 = _614 * _582;
    float _622 = _614 * _578;
    float _624 = _614 * _598;
    float _626 = _622 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _628 = _618 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _630 = -_626;
    float _632 = fma(_624, (*spvDescriptorSet0.fp_c9)._m0[69].y, _630);
    float _634 = exp2(_628);
    float _636 = -_620;
    float _638 = fma(_636, (*spvDescriptorSet0.fp_c9)._m0[69].z, _632);
    float _640 = fma(_376, 2.007874011993408203125, -1.007874011993408203125);
    float _642 = fma(_374, 2.007874011993408203125, -1.007874011993408203125);
    float _644 = _640 * _640;
    float _646 = _270 * _640;
    float _648 = _274 * _640;
    float _650 = _272 * _640;
    float _652 = fma(_642, _642, _644);
    float _654 = fma(_244, _642, _646);
    float _656 = fma(_242, _642, _648);
    float _658 = _234 * _288;
    float _660 = -_652;
    float _662 = _660 + 1.0;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    float _666 = _624 + 1.0;
    float _668 = fma(_230, _290, _658);
    float _670 = fma(_240, _642, _650);
    float _672 = -_624;
    float _674 = fma(_634, _666, _672);
    float _676 = sqrt(_664);
    float _678 = fma(_232, _292, _668);
    float _680 = fma(_674, 0.5, 0.5);
    float _682 = fma(_638, 0.5, 0.5);
    float _684 = fma(_638, -0.5, 0.5);
    float _686 = sqrt(_684);
    float _688 = fma(_234, _676, _654);
    float _690 = fma(_230, _676, _656);
    float _692 = fma(_232, _676, _670);
    float _694 = _688 * _688;
    float _696 = in.m_60.z;
    float _698 = gl_FragCoord.w;
    float _700 = _696 * _698;
    float _702 = fma(_682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_690, _690, _694);
    float _706 = _686 * 0.636619746685028076171875;
    float _708 = fma(_682, _702, -0.212114393711090087890625);
    float _710 = fma(_692, _692, _704);
    float _712 = fma(_682, _708, 1.570728778839111328125);
    float _714 = in.m_68.w;
    float _716 = gl_FragCoord.w;
    float _718 = _714 * _716;
    float _720 = rsqrt(_710);
    float _722 = in.m_60.w;
    float _724 = gl_FragCoord.w;
    float _726 = _722 * _724;
    float _728 = -_712;
    float _730 = fma(_706, _728, 1.0);
    float _732 = in.m_68.z;
    float _734 = gl_FragCoord.w;
    float _736 = _732 * _734;
    float _738 = _688 * _720;
    float _740 = _690 * _720;
    float _742 = _692 * _720;
    float _744 = _288 * _738;
    float _746 = fma(_290, _740, _744);
    float _748 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 1.6670000553131103515625, _100);
    float _750 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 6.66800022125244140625, _100);
    float _752 = fma(_292, _742, _746);
    float _754 = fma(_334, -0.25, _98);
    float _756 = fma(_330, -0.25, _748);
    float _758 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _378);
    float _760 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _752);
    float _762 = _96 * _700;
    float _764 = _96 * _726;
    float2 _2349 = float2(_754, _756);
    float _766 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2349, float2(0.0), isnan(_2349))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2349, float2(0.0), isnan(_2349))).x;
    float _768 = _96 * _736;
    float _770 = _96 * _718;
    float _772 = _678 + _758;
    float2 _2366 = float2(_98, _748);
    float _774 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2366, float2(0.0), isnan(_2366))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2366, float2(0.0), isnan(_2366))).x;
    float2 _2374 = float2(_768, _770);
    float _776 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2374, float2(0.0), isnan(_2374))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2374, float2(0.0), isnan(_2374))).x;
    float2 _2382 = float2(_98, _750);
    float _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2382, float2(0.0), isnan(_2382))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2382, float2(0.0), isnan(_2382))).y;
    float2 _2390 = float2(_762, _764);
    float3 _782 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2390, float2(0.0), isnan(_2390))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2390, float2(0.0), isnan(_2390))).xyz;
    float _784 = _782.x;
    float _786 = _782.y;
    float _788 = _782.z;
    float2 _2404 = float2(_730, _680);
    float3 _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2404, float2(0.0), isnan(_2404))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2404, float2(0.0), isnan(_2404))).xyz;
    float _792 = _790.x;
    float _794 = _790.y;
    float _796 = _790.z;
    float2 _2417 = float2(_760, 0.0);
    float3 _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2417, float2(0.0), isnan(_2417))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2417, float2(0.0), isnan(_2417))).xyz;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float2 _2430 = float2(_772, 0.0);
    float3 _806 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2430, float2(0.0), isnan(_2430))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2430, float2(0.0), isnan(_2430))).xyz;
    float _808 = _806.x;
    float _810 = _806.y;
    float _812 = _806.z;
    float _814 = _182 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _816 = _182 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _818 = abs(_192);
    bool _820 = _818 > 0.00999999977648258209228515625;
    float _822 = _288 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _824 = fma(_186, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _814);
    float _826 = fma(_186, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _816);
    float _828 = in.m_70.y;
    float _830 = gl_FragCoord.w;
    float _832 = _828 * _830;
    float _834 = in.m_70.z;
    float _836 = gl_FragCoord.w;
    float _838 = _834 * _836;
    float _840 = fma(_204, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _824);
    float _842 = in.m_70.x;
    float _844 = gl_FragCoord.w;
    float _846 = _842 * _844;
    float _848 = in.m_70.w;
    float _850 = gl_FragCoord.w;
    float _852 = _848 * _850;
    float _854 = _820 ? _192 : 0.00999999977648258209228515625;
    float _856 = _840 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _858 = fma(_204, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _826);
    float _860 = fma(_290, (*spvDescriptorSet0.fp_c9)._m0[69].x, _822);
    float _862 = trunc(_856);
    int _865 = int(_862);
    float _867 = _858 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _869 = trunc(_867);
    int _871 = int(_869);
    int _873 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _875 = _865 + _873;
    int _877 = _875 + 1;
    bool _879 = _877 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _881 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _883 = _871 + _881;
    int _885 = _883 + 1;
    int _887 = _877 | _885;
    bool _889 = _887 < 0;
    bool _891 = _889 || _879;
    bool _893 = _885 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _895 = _893 || _891;
    float _897 = _766 * 0.25;
    float _899 = fma(_292, (*spvDescriptorSet0.fp_c9)._m0[69].z, _860);
    float _901 = precise::max(_774, _897);
    float _903 = _854 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _905 = _854;
    if (_895)
    {
        _905 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _907 = _905;
    float _909 = _907;
    if (!_895)
    {
        int _911 = _885 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _913 = _911 + _877;
        float _915 = floor(_856);
        int _917 = _913 << 2;
        int _919 = _913 >> 2;
        int _921 = 12 & _917;
        int _923 = _919 << 4;
        int _925 = _923 + _921;
        float _927 = floor(_867);
        int _929 = _925 + 16256;
        uint _932 = uint(int(uint(_929) >> uint(2)));
        uint _934 = uint(int(uint(int(_932)) >> uint(2)));
        int _936 = int(_932) & 3;
        float _938 = (*spvDescriptorSet0.fp_c9)._m0[int(_934)][_936];
        float _940 = -_915;
        float _942 = _856 + _940;
        float _944 = -_927;
        float _946 = _867 + _944;
        float _948 = rint(_938);
        float _950 = precise::max(_948, 0.0);
        uint _952 = uint(_950);
        uint _954 = clamp(_952, 0u, 65535u);
        float3 _2666 = float3(_942, _946, float(int(_954)));
        float3 _2670 = select(_2666, float3(0.0), isnan(_2666));
        float _956 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, _2670.xy, uint(rint(_2670.z))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, _2670.xy, uint(rint(_2670.z))).x;
        int _958 = _913 << 4;
        int _960 = _958 + 17904;
        int _962 = _925 + 24304;
        uint _964 = uint(int(uint(_962) >> uint(2)));
        uint _966 = uint(int(uint(int(_964)) >> uint(2)));
        int _968 = int(_964) & 3;
        float _970 = (*spvDescriptorSet0.fp_c9)._m0[int(_966)][_968];
        uint _972 = uint(int(uint(_960) >> uint(2)));
        uint _974 = uint(int(uint(int(_972)) >> uint(2)));
        int _976 = int(_972) & 3;
        float _978 = (*spvDescriptorSet0.fp_c9)._m0[int(_974)][_976];
        int _980 = int(_972) + 1;
        uint _982 = uint(int(uint(_980) >> uint(2)));
        int _984 = _980 & 3;
        float _986 = (*spvDescriptorSet0.fp_c9)._m0[int(_982)][_984];
        int _988 = _960 + 8;
        uint _990 = uint(int(uint(_988) >> uint(2)));
        uint _992 = uint(int(uint(int(_990)) >> uint(2)));
        int _994 = int(_990) & 3;
        float _996 = (*spvDescriptorSet0.fp_c9)._m0[int(_992)][_994];
        int _998 = int(_990) + 1;
        uint _1000 = uint(int(uint(_998) >> uint(2)));
        int _1002 = _998 & 3;
        float _1004 = (*spvDescriptorSet0.fp_c9)._m0[int(_1000)][_1002];
        float _1006 = _182 * _986;
        float _1008 = fma(_186, _978, _1006);
        float _1010 = 1.0 / _970;
        float _1012 = fma(_204, _996, _1008);
        float _1014 = _1012 + _1004;
        float _1016 = precise::clamp(_1014, 0.0, 1.0);
        float _1018 = _970 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1020 = -_1016;
        float _1022 = _1020 + _956;
        float _1024 = fma(_1010, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1022);
        float _1026 = _1018 * _1024;
        float _1028 = exp2(_1026);
        float _1030 = 0.0 + _1028;
        float _1032 = precise::clamp(_1030, 0.0, 1.0);
        float _1034 = precise::min(_1032, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _909 = _1034;
    }
    float _1036 = _909;
    float _1038 = _96 * _846;
    float _1040 = _96 * _832;
    float _1042 = precise::max(_903, -127.0);
    float _1044 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1046 = fma(_899, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1048 = -_1042;
    float _1050 = exp2(_1048);
    float _1052 = _96 * _838;
    float _1054 = precise::min((*spvDescriptorSet0.fp_c9)._m0[27].w, 1.0);
    float _1056 = fma(_1046, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1058 = _96 * _852;
    float _1060 = fma(_804, 0.125, _788);
    float _1062 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1064 = fma(_1062, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1066 = _1054 * 0.31830990314483642578125;
    float _1068 = -_1044;
    float _1070 = exp2(_1068);
    float _1072 = -_1058;
    float _1074 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1076 = _1072 + _1074;
    float _1078 = _618 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1080 = _1040 * _1066;
    float _1082 = _1052 * _1066;
    float _1084 = _1076 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1086 = precise::clamp(_1084, 0.0, 1.0);
    float _1088 = precise::min(_776, 1.0);
    float _1090 = _812 * 0.0452399961650371551513671875;
    float _1092 = 1.0 / _1042;
    float _1094 = -_1050;
    float _1096 = _1094 + 1.0;
    float _1098 = _1090 * _1082;
    float _1100 = abs(_1056);
    float _1102 = log2(_1100);
    float _1104 = _1070 * _1096;
    float _1106 = _1038 * _1066;
    float _1108 = fma(_802, 0.125, _786);
    float _1110 = -_1036;
    float _1112 = _1110 + 1.0;
    float _1114 = _1104 * _1092;
    float _1116 = _802 + _901;
    float _1118 = fma(_1086, _1112, _1036);
    float _1120 = exp2(_1078);
    float _1122 = fma(_901, _1116, _1108);
    float _1124 = fma(_800, 0.125, _784);
    float _1126 = _800 + _901;
    float _1128 = _1102 * 1.5;
    float _1130 = fma(_778, _802, _1122);
    float _1132 = _804 + _901;
    float _1134 = fma(_901, _1126, _1124);
    float _1136 = _1130 * 0.17880000174045562744140625;
    float _1138 = exp2(_1128);
    float _1140 = fma(_901, _1132, _1060);
    float _1142 = fma(_778, _800, _1134);
    float _1144 = _236 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1146 = fma(_778, _804, _1140);
    float _1148 = fma(_1142, 0.053149998188018798828125, _1136);
    float _1150 = _1114 * _1144;
    float _1152 = fma(_1146, 0.01805000007152557373046875, _1148);
    float _1154 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1156 = -_1150;
    float _1158 = exp2(_1156);
    float _1160 = _1138 * 12.56637096405029296875;
    float _1162 = 1.0 / _1160;
    float _1164 = 1.0 / _1152;
    float _1166 = _1064 * _1162;
    float _1168 = _1164 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1170 = precise::min(_1118, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1172 = _1154 * _1168;
    float _1174 = precise::clamp(_1172, 0.0, 1.0);
    float _1176 = fma(_1174, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1178 = -_1158;
    float _1180 = _1178 + 1.0;
    float _1182 = -_1120;
    float _1184 = _1182 + 1.0;
    float _1186 = precise::min(_1168, _1176);
    float _1188 = _1180 * _1166;
    float _1190 = _1184 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1192 = _1186 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1194 = _1170 * _1188;
    float _1196 = -_1190;
    float _1198 = _1196 + 1.0;
    float _1200 = _1190 * _1158;
    float _1202 = fma(_1176, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1192);
    float _1204 = _1158 * _1198;
    float _1206 = _1142 * _1202;
    float _1208 = _1206 * 0.25;
    float _1210 = _1130 * _1202;
    float _1212 = _1210 * 0.25;
    float _1214 = _1146 * _1202;
    float _1216 = _1214 * 0.25;
    float _1218 = _808 * 0.0452399961650371551513671875;
    float _1220 = _810 * 0.0452399961650371551513671875;
    float _1222 = precise::min(_1088, 1.0);
    float _1224 = _1212 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1226 = _1218 * _1106;
    float _1228 = _1220 * _1080;
    float _1230 = _1194 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1232 = _1216 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1234 = _1226 * _1222;
    float _1236 = _1228 * _1222;
    float _1238 = fma(_792, _1200, _1230);
    float _1240 = _1194 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1242 = _1194 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1244 = precise::max(0.0, _1234);
    float _1246 = _1098 * _1222;
    float _1248 = precise::max(0.0, _1236);
    float _1250 = fma(_794, _1200, _1240);
    float _1252 = fma(_796, _1200, _1242);
    float _1254 = fma(_1204, _1244, _1238);
    float _1256 = _1208 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1258 = fma(_1204, _1248, _1250);
    float _1260 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1262 = _236 + _1260;
    float _1264 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1266 = _236 + _1264;
    float _1268 = precise::max(0.0, _1224);
    float _1270 = precise::max(0.0, _1256);
    float _1272 = _1262 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = precise::max(0.0, _1232);
    float _1278 = _1266 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1280 = precise::clamp(_1278, 0.0, 1.0);
    float _1282 = precise::max(0.0, _1246);
    float _1284 = _1204 * _1270;
    float _1286 = _1204 * _1268;
    float _1288 = _1204 * _1276;
    float _1290 = fma(_1204, _1282, _1252);
    float _1292 = fma(_1274, _1284, _1254);
    float _1294 = fma(_1280, _1284, _1254);
    float _1296 = fma(_1274, _1286, _1258);
    float _1298 = fma(_1280, _1286, _1258);
    float _1300 = fma(_1274, _1288, _1290);
    float _1302 = fma(_1280, _1288, _1290);
    out.m_73.x = _1292;
    out.m_73.y = _1296;
    out.m_73.z = _1300;
    out.m_73.w = 1.0;
    out.m_75.x = _1294;
    out.m_75.y = _1298;
    out.m_75.z = _1302;
    out.m_75.w = 1.0;
    return out;
}

