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
    texture2d<float> fp_t_tcb_1A [[id(4)]];
    sampler fp_t_tcb_1ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_16 [[id(10)]];
    sampler fp_t_tcb_16Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_14 [[id(12)]];
    sampler fp_t_tcb_14Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_E [[id(14)]];
    sampler fp_t_tcb_ESmplr [[id(15)]];
    texture2d<float> fp_t_tcb_18 [[id(16)]];
    sampler fp_t_tcb_18Smplr [[id(17)]];
    texture2d_array<float> fp_t_tcb_8 [[id(18)]];
    sampler fp_t_tcb_8Smplr [[id(19)]];
    texture2d<float> fp_t_tcb_1E [[id(20)]];
    sampler fp_t_tcb_1ESmplr [[id(21)]];
    texture2d_array<float> fp_t_tcb_C [[id(22)]];
    sampler fp_t_tcb_CSmplr [[id(23)]];
    texture2d<float> fp_t_tcb_22 [[id(24)]];
    sampler fp_t_tcb_22Smplr [[id(25)]];
    texture2d<float> fp_t_tcb_1C [[id(26)]];
    sampler fp_t_tcb_1CSmplr [[id(27)]];
    texture2d_array<float> fp_t_tcb_20 [[id(28)]];
    sampler fp_t_tcb_20Smplr [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    sampler fp_t_tcb_10Smplr_w [[id(31)]];
    sampler fp_t_tcb_12Smplr_w [[id(32)]];
    sampler fp_t_tcb_16Smplr_w [[id(33)]];
    sampler fp_t_tcb_14Smplr_w [[id(34)]];
    sampler fp_t_tcb_ESmplr_w [[id(35)]];
    sampler fp_t_tcb_18Smplr_w [[id(36)]];
    sampler fp_t_tcb_8Smplr_w [[id(37)]];
    sampler fp_t_tcb_1ESmplr_w [[id(38)]];
    sampler fp_t_tcb_CSmplr_w [[id(39)]];
    sampler fp_t_tcb_22Smplr_w [[id(40)]];
    sampler fp_t_tcb_1CSmplr_w [[id(41)]];
    sampler fp_t_tcb_20Smplr_w [[id(42)]];
    constant dm_border_t* dm_border [[id(43)]];
};

struct main0_out
{
    float4 m_77 [[color(0)]];
    float4 m_79 [[color(1)]];
};

struct main0_in
{
    float4 m_62 [[user(locn0)]];
    float4 m_72 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _86 = gl_FragCoord.w;
    float _88 = in.m_62.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_62.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _86;
    float _102 = _100 * _92;
    float _104 = _100 * _98;
    float2 _1385 = float2(_102, _104);
    float2 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1385, float2(0.0), isnan(_1385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1385, float2(0.0), isnan(_1385))).xy;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = in.m_64.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_66.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_64.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_66.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_64.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_66.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_68.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_68.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_68.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _100 * _118;
    float _170 = _100 * _124;
    float _172 = _100 * _130;
    float _174 = _100 * _136;
    float _176 = _168 * _168;
    float _178 = _170 * _170;
    float _180 = _100 * _142;
    float _182 = _100 * _148;
    float _184 = fma(_172, _172, _176);
    float _186 = fma(_174, _174, _178);
    float _188 = in.m_66.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _100 * _154;
    float _196 = fma(_180, _180, _184);
    float _198 = fma(_182, _182, _186);
    float _200 = _100 * _160;
    float _202 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _204 = _194 + _202;
    float _206 = _100 * _166;
    float _208 = rsqrt(_198);
    float _210 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _212 = _200 + _210;
    float _214 = _204 * _204;
    float _216 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _218 = _206 + _216;
    float _220 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _222 = _200 + _220;
    float _224 = fma(_212, _212, _214);
    float _226 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _228 = _206 + _226;
    float _230 = rsqrt(_196);
    float _232 = fma(_218, _218, _224);
    float _234 = _228 * _228;
    float _236 = fma(_222, _222, _234);
    float _238 = _182 * _208;
    float _240 = _174 * _208;
    float _242 = _170 * _208;
    float _244 = sqrt(_232);
    float _246 = _172 * _230;
    float _248 = _180 * _230;
    float _250 = _168 * _230;
    float _252 = _100 * _192;
    float _254 = _246 * _238;
    float _256 = _248 * _242;
    float _258 = _250 * _240;
    float _260 = sqrt(_236);
    float _262 = -_254;
    float _264 = fma(_248, _240, _262);
    float _266 = -_256;
    float _268 = fma(_250, _238, _266);
    float _270 = spvFAdd(_244, 9.9999997473787516355514526367188e-06);
    float _272 = _252 * _264;
    float _274 = -_258;
    float _276 = fma(_246, _242, _274);
    float _278 = _252 * _268;
    float _280 = 1.0 / _270;
    float _282 = _272 * _272;
    float _284 = _252 * _276;
    float _286 = fma(_278, _278, _282);
    bool _290 = _260 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _292 = fma(_284, _284, _286);
    float _294 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _296 = _260 + _294;
    float _298 = rsqrt(_292);
    float _300 = _204 * _280;
    float _302 = _212 * _280;
    float _304 = _218 * _280;
    float _306 = _240 * _302;
    float _308 = 0.0;
    float _310 = _296;
    if (_290)
    {
        float _312 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _308 = _312;
    }
    float _314 = _308;
    float _316 = -_300;
    float _318 = -_306;
    float _320 = fma(_242, _316, _318);
    float _322 = _272 * _298;
    float _324 = _278 * _298;
    float _326 = _284 * _298;
    float _328 = -_304;
    float _330 = fma(_238, _328, _320);
    float _332 = _300 * _322;
    float _334 = fma(_302, _324, _332);
    float _336 = _314;
    float _338 = _332;
    float _340 = _324;
    float _342 = _320;
    if (_290)
    {
        float _344 = _296 * _314;
        _336 = _344;
    }
    float _346 = _336;
    float _348 = fma(_304, _326, _334);
    float _350 = _330 * (-0.5);
    if (_290)
    {
        float _352 = _346 * 0.15915493667125701904296875;
        _338 = _352;
    }
    float _354 = _338;
    float _356 = _348 * (-0.5);
    float _358 = fma(_102, 2.5, _350);
    float _360 = fma(_104, 2.5, _356);
    float _362 = fma(_110, 0.25, _358);
    float _364 = fma(_112, 0.25, _360);
    float _366 = _358;
    if (_290)
    {
        float _368 = _354 * 6.283185482025146484375;
        float _370 = cos(_368);
        _366 = _370;
    }
    float _372 = _366;
    float2 _1773 = float2(_362, _364);
    float2 _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1773, float2(0.0), isnan(_1773))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1773, float2(0.0), isnan(_1773))).xy;
    float _376 = _374.x;
    float _378 = _374.y;
    float2 _1785 = float2(_102, _104);
    float _380 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1785, float2(0.0), isnan(_1785))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1785, float2(0.0), isnan(_1785))).x;
    if (_290)
    {
        float _382 = _194 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _310 = _382;
    }
    float _384 = _310;
    float _386 = _346;
    float _388 = _384;
    if (_290)
    {
        float _390 = _354 * 6.283185482025146484375;
        float _392 = sin(_390);
        _386 = _392;
    }
    float _394 = _386;
    if (!_290)
    {
        _340 = _194;
    }
    float _396 = _340;
    float _398 = _236;
    float _400 = _396;
    if (_290)
    {
        float _402 = rsqrt(_236);
        _398 = _402;
    }
    float _404 = _398;
    if (_290)
    {
        float _406 = _372 + (-1.0);
        _342 = _406;
    }
    float _408 = _342;
    float _410 = 0.0;
    float _412 = _408;
    if (_290)
    {
        float _414 = _408 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _410 = _414;
    }
    float _416 = _410;
    float _418 = _394;
    if (_290)
    {
        float _420 = fma(_394, _384, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _388 = _420;
    }
    float _422 = _388;
    float _424 = _422;
    if (_290)
    {
        float _426 = fma(_194, _372, _416);
        _400 = _426;
    }
    float _428 = _400;
    if (!_290)
    {
        _418 = _206;
    }
    float _430 = _418;
    float _432 = _430;
    if (_290)
    {
        float _434 = _404 * _422;
        _412 = _434;
    }
    float _436 = _412;
    if (!_290)
    {
        _424 = _200;
    }
    float _438 = _424;
    float _440 = _438;
    if (_290)
    {
        float _442 = fma(_222, _436, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _440 = _442;
    }
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _448 = _428 + _446;
    float _450 = _448;
    if (_290)
    {
        float _452 = fma(_228, _436, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _432 = _452;
    }
    float _454 = _432;
    float _456 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _458 = _444 + _456;
    float _460 = _448 * _448;
    float _462 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _464 = _454 + _462;
    float _466 = fma(_458, _458, _460);
    float _468 = fma(_464, _464, _466);
    float _470 = rsqrt(_468);
    float _472 = _470 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _474 = _458 * _472;
    float _476 = _464 * _472;
    float _478 = _474 * _474;
    float _480 = _476 * _476;
    float _482 = _478 + _480;
    float _484 = sqrt(_482);
    bool _486 = _484 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _488 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _490 = _484 + _488;
    float _492 = _354;
    float _494 = _482;
    float _496 = _490;
    float _498 = _472;
    float _500 = _474;
    float _502 = _476;
    float _504 = _478;
    float _506 = _480;
    if (_486)
    {
        float _508 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _492 = _508;
    }
    float _510 = _492;
    if (_486)
    {
        float _512 = rsqrt(_482);
        _494 = _512;
    }
    float _514 = _494;
    if (_486)
    {
        float _516 = _490 * _510;
        _496 = _516;
    }
    float _518 = _496;
    float _520 = 0.0;
    if (_486)
    {
        float _522 = _518 * 0.15915493667125701904296875;
        _520 = _522;
    }
    float _524 = _520;
    float _526 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _528 = _468;
    if (_486)
    {
        float _530 = _524 * 6.283185482025146484375;
        float _532 = sin(_530);
        _528 = _532;
    }
    float _534 = _528;
    float _536 = precise::max(0.0, _526);
    float _538 = _518;
    float _540 = _536;
    if (_486)
    {
        float _542 = _524 * 6.283185482025146484375;
        float _544 = cos(_542);
        _538 = _544;
    }
    float _546 = _538;
    float _548 = -_472;
    float _550 = -_536;
    float _552 = fma(_448, _548, _550);
    if (_486)
    {
        float _554 = _552 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _498 = _554;
    }
    float _556 = _498;
    float _558 = _534;
    float _560 = _556;
    if (_486)
    {
        float _562 = fma(_534, _556, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _558 = _562;
    }
    float _564 = _558;
    float _566 = _564;
    if (!_486)
    {
        _560 = _552;
    }
    float _568 = _560;
    float _570 = _568;
    if (_486)
    {
        float _572 = _514 * _564;
        _566 = _572;
    }
    float _574 = _566;
    if (_486)
    {
        float _576 = _546 + (-1.0);
        _450 = _576;
    }
    float _578 = _450;
    if (_486)
    {
        float _580 = _474 * _574;
        _500 = _580;
    }
    float _582 = _500;
    if (_486)
    {
        float _584 = _476 * _574;
        _502 = _584;
    }
    float _586 = _502;
    if (_486)
    {
        float _588 = _578 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _540 = _588;
    }
    float _590 = _540;
    if (_486)
    {
        float _592 = _582 * _582;
        _504 = _592;
    }
    float _594 = _504;
    if (_486)
    {
        float _596 = _586 * _586;
        _506 = _596;
    }
    float _598 = _506;
    if (_486)
    {
        float _600 = fma(_552, _546, _590);
        _570 = _600;
    }
    float _602 = _570;
    float _604 = fma(_602, _602, _594);
    float _606 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _608 = fma(_244, (*spvDescriptorSet0.fp_c9)._m0[63].x, _606);
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _604 + _598;
    float _614 = -_610;
    float _616 = _614 + 1.0;
    float _618 = rsqrt(_612);
    float _620 = abs(_616);
    float _622 = log2(_620);
    float _624 = _618 * _582;
    float _626 = _618 * _602;
    float _628 = _618 * _586;
    float _630 = _624 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _632 = _622 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _634 = -_630;
    float _636 = fma(_626, (*spvDescriptorSet0.fp_c9)._m0[69].y, _634);
    float _638 = exp2(_632);
    float _640 = -_628;
    float _642 = fma(_640, (*spvDescriptorSet0.fp_c9)._m0[69].z, _636);
    float _644 = fma(_378, 2.007874011993408203125, -1.007874011993408203125);
    float _646 = fma(_376, 2.007874011993408203125, -1.007874011993408203125);
    float _648 = _626 + 1.0;
    float _650 = _644 * _644;
    float _652 = _272 * _644;
    float _654 = -_626;
    float _656 = fma(_638, _648, _654);
    float _658 = fma(_646, _646, _650);
    float _660 = fma(_242, _646, _652);
    float _662 = -_658;
    float _664 = _662 + 1.0;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    float _668 = fma(_656, 0.5, 0.5);
    float _670 = fma(_642, 0.5, 0.5);
    float _672 = fma(_642, -0.5, 0.5);
    float _674 = _278 * _644;
    float _676 = _284 * _644;
    float _678 = sqrt(_666);
    float _680 = _250 * _300;
    float _682 = fma(_240, _646, _674);
    float _684 = fma(_238, _646, _676);
    float _686 = fma(_246, _302, _680);
    float _688 = in.m_70.x;
    float _690 = gl_FragCoord.w;
    float _692 = _688 * _690;
    float _694 = sqrt(_672);
    float _696 = fma(_248, _304, _686);
    float _698 = fma(_250, _678, _660);
    float _700 = fma(_246, _678, _682);
    float _702 = fma(_248, _678, _684);
    float _704 = fma(_670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _706 = _698 * _698;
    float _708 = in.m_62.w;
    float _710 = gl_FragCoord.w;
    float _712 = _708 * _710;
    float _714 = fma(_670, _704, -0.212114393711090087890625);
    float _716 = fma(_700, _700, _706);
    float _718 = _694 * 0.636619746685028076171875;
    float _720 = fma(_670, _714, 1.570728778839111328125);
    float _722 = fma(_702, _702, _716);
    float _724 = in.m_72.z;
    float _726 = gl_FragCoord.w;
    float _728 = _724 * _726;
    float _730 = in.m_62.z;
    float _732 = gl_FragCoord.w;
    float _734 = _730 * _732;
    float _736 = -_720;
    float _738 = fma(_718, _736, 1.0);
    float _740 = rsqrt(_722);
    float _742 = in.m_72.w;
    float _744 = gl_FragCoord.w;
    float _746 = _742 * _744;
    float _748 = _100 * _692;
    float _750 = _748 * (-0.25);
    float _752 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 1.6670000553131103515625, _104);
    float _754 = _698 * _740;
    float _756 = _700 * _740;
    float _758 = _702 * _740;
    float _760 = fma(_348, _750, _752);
    float _762 = _300 * _754;
    float _764 = fma(_302, _756, _762);
    float _766 = fma(_304, _758, _764);
    float _768 = fma(_330, _750, _102);
    float _770 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _380);
    float _772 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 6.66800022125244140625, _104);
    float _774 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _766);
    float _776 = _100 * _734;
    float _778 = _100 * _712;
    float2 _2412 = float2(_768, _760);
    float _780 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2412, float2(0.0), isnan(_2412))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2412, float2(0.0), isnan(_2412))).x;
    float2 _2420 = float2(_102, _752);
    float _782 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2420, float2(0.0), isnan(_2420))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2420, float2(0.0), isnan(_2420))).x;
    float _784 = _100 * _746;
    float _786 = _100 * _728;
    float2 _2434 = float2(_776, _778);
    float3 _790 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2434, float2(0.0), isnan(_2434))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2434, float2(0.0), isnan(_2434))).xyz;
    float _792 = _790.x;
    float _794 = _790.y;
    float _796 = _790.z;
    float2 _2447 = float2(_774, 0.0);
    float3 _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2447, float2(0.0), isnan(_2447))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2447, float2(0.0), isnan(_2447))).xyz;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float _806 = _696 + _770;
    float3 _2465 = float3(_786, _784, float(0));
    float3 _2469 = select(_2465, float3(0.0), isnan(_2465));
    float _808 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2469.xy, uint(rint(_2469.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2469.xy, uint(rint(_2469.z))).z;
    float2 _2475 = float2(_102, _772);
    float _810 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2475, float2(0.0), isnan(_2475))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2475, float2(0.0), isnan(_2475))).y;
    float3 _2484 = float3(_786, _784, float(0));
    float3 _2486 = select(_2484, float3(0.0), isnan(_2484));
    float3 _812 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2486.xy, uint(rint(_2486.z))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2486.xy, uint(rint(_2486.z))).xyz;
    float _814 = _812.x;
    float _816 = _812.y;
    float _818 = _812.z;
    float2 _2498 = float2(_738, _668);
    float3 _820 = dm_bs(spvDescriptorSet0.fp_t_tcb_22.sample(spvDescriptorSet0.fp_t_tcb_22Smplr, select(_2498, float2(0.0), isnan(_2498))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_22, spvDescriptorSet0.fp_t_tcb_22Smplr_w, select(_2498, float2(0.0), isnan(_2498))).xyz;
    float _822 = _820.x;
    float _824 = _820.y;
    float _826 = _820.z;
    float2 _2511 = float2(_806, 0.0);
    float3 _828 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2511, float2(0.0), isnan(_2511))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2511, float2(0.0), isnan(_2511))).xyz;
    float _830 = _828.x;
    float _832 = _828.y;
    float _834 = _828.z;
    float _836 = _194 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _838 = _194 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _840 = _300 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _842 = fma(_200, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _836);
    float _844 = fma(_200, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _838);
    float _846 = fma(_206, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _842);
    float _848 = fma(_206, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _844);
    float _850 = in.m_74.w;
    float _852 = gl_FragCoord.w;
    float _854 = _850 * _852;
    float _856 = fma(_302, (*spvDescriptorSet0.fp_c9)._m0[69].x, _840);
    float _858 = _846 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _860 = _848 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _862 = trunc(_858);
    int _865 = int(_862);
    float _867 = trunc(_860);
    int _869 = int(_867);
    int _871 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _873 = _865 + _871;
    int _875 = _873 + 1;
    bool _877 = _875 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _879 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _881 = _869 + _879;
    int _883 = _881 + 1;
    float _885 = _100 * _854;
    int _887 = _875 | _883;
    bool _889 = _887 < 0;
    bool _891 = _889 || _877;
    float _893 = fma(_304, (*spvDescriptorSet0.fp_c9)._m0[69].z, _856);
    bool _895 = _883 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _897 = _895 || _891;
    float _899 = _780 * 0.25;
    float _901 = precise::max(_782, _899);
    float _903 = fma(_800, 0.125, _792);
    float _905 = fma(_802, 0.125, _794);
    float _907 = fma(_804, 0.125, _796);
    float _909 = _800 + _901;
    float _911 = _802 + _901;
    float _913 = fma(_901, _909, _903);
    float _915 = _804 + _901;
    float _917 = fma(_901, _911, _905);
    float _919 = fma(_901, _915, _907);
    float _921 = _915;
    if (_897)
    {
        _921 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_897)
    {
        int _927 = _883 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _929 = _927 + _875;
        float _931 = floor(_858);
        int _933 = _929 << 2;
        int _935 = _929 >> 2;
        int _937 = 12 & _933;
        float _939 = floor(_860);
        int _941 = _935 << 4;
        int _943 = _941 + _937;
        int _945 = _943 + 16256;
        uint _948 = uint(int(uint(_945) >> uint(2)));
        uint _950 = uint(int(uint(int(_948)) >> uint(2)));
        int _952 = int(_948) & 3;
        float _954 = (*spvDescriptorSet0.fp_c9)._m0[int(_950)][_952];
        float _956 = -_931;
        float _958 = _858 + _956;
        float _960 = -_939;
        float _962 = _860 + _960;
        float _964 = rint(_954);
        float _966 = precise::max(_964, 0.0);
        uint _968 = uint(_966);
        uint _970 = clamp(_968, 0u, 65535u);
        float3 _2747 = float3(_958, _962, float(int(_970)));
        float3 _2749 = select(_2747, float3(0.0), isnan(_2747));
        float _972 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, _2749.xy, uint(rint(_2749.z))), spvDescriptorSet0.dm_border, 12u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, _2749.xy, uint(rint(_2749.z))).x;
        int _974 = _929 << 4;
        int _976 = _974 + 17904;
        int _978 = _943 + 24304;
        uint _980 = uint(int(uint(_978) >> uint(2)));
        uint _982 = uint(int(uint(int(_980)) >> uint(2)));
        int _984 = int(_980) & 3;
        float _986 = (*spvDescriptorSet0.fp_c9)._m0[int(_982)][_984];
        uint _988 = uint(int(uint(_976) >> uint(2)));
        uint _990 = uint(int(uint(int(_988)) >> uint(2)));
        int _992 = int(_988) & 3;
        float _994 = (*spvDescriptorSet0.fp_c9)._m0[int(_990)][_992];
        int _996 = int(_988) + 1;
        uint _998 = uint(int(uint(_996) >> uint(2)));
        int _1000 = _996 & 3;
        float _1002 = (*spvDescriptorSet0.fp_c9)._m0[int(_998)][_1000];
        int _1004 = _976 + 8;
        uint _1006 = uint(int(uint(_1004) >> uint(2)));
        uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
        int _1010 = int(_1006) & 3;
        float _1012 = (*spvDescriptorSet0.fp_c9)._m0[int(_1008)][_1010];
        int _1014 = int(_1006) + 1;
        uint _1016 = uint(int(uint(_1014) >> uint(2)));
        int _1018 = _1014 & 3;
        float _1020 = (*spvDescriptorSet0.fp_c9)._m0[int(_1016)][_1018];
        float _1022 = _194 * _1002;
        float _1024 = fma(_200, _994, _1022);
        float _1026 = 1.0 / _986;
        float _1028 = fma(_206, _1012, _1024);
        float _1030 = _1028 + _1020;
        float _1032 = precise::clamp(_1030, 0.0, 1.0);
        float _1034 = -_1032;
        float _1036 = _1034 + _972;
        float _1038 = _986 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1040 = fma(_1026, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1036);
        float _1042 = _1038 * _1040;
        float _1044 = exp2(_1042);
        float _1046 = 0.0 + _1044;
        float _1048 = precise::clamp(_1046, 0.0, 1.0);
        float _1050 = precise::min(_1048, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _925 = _1050;
    }
    float _1052 = _925;
    float _1054 = abs(_204);
    bool _1056 = _1054 > 0.00999999977648258209228515625;
    float _1058 = -_885;
    float _1060 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1062 = _1058 + _1060;
    float _1064 = -_1052;
    float _1066 = _1064 + 1.0;
    float _1068 = _1056 ? _204 : 0.00999999977648258209228515625;
    float _1070 = _1062 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1072 = precise::clamp(_1070, 0.0, 1.0);
    float _1074 = in.m_74.y;
    float _1076 = gl_FragCoord.w;
    float _1078 = _1074 * _1076;
    float _1080 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1082 = in.m_74.x;
    float _1084 = gl_FragCoord.w;
    float _1086 = _1082 * _1084;
    float _1088 = _1068 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1090 = fma(_1072, _1066, _1052);
    float _1092 = fma(_810, _800, _913);
    float _1094 = fma(_810, _802, _917);
    float _1096 = -_1080;
    float _1098 = exp2(_1096);
    float _1100 = precise::max(_1088, -127.0);
    float _1102 = fma(_810, _804, _919);
    float _1104 = _1094 * 0.17880000174045562744140625;
    float _1106 = in.m_74.z;
    float _1108 = gl_FragCoord.w;
    float _1110 = _1106 * _1108;
    float _1112 = _816 * 0.4774648249149322509765625;
    float _1114 = _818 * 0.4774648249149322509765625;
    float _1116 = -_1100;
    float _1118 = exp2(_1116);
    float _1120 = precise::min(_1090, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1122 = _832 * 0.0452399961650371551513671875;
    float _1124 = _830 * 0.0452399961650371551513671875;
    float _1126 = _834 * 0.0452399961650371551513671875;
    float _1128 = 1.0 / _1100;
    float _1130 = -_1118;
    float _1132 = _1130 + 1.0;
    float _1134 = _100 * _1078;
    float _1136 = _622 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1138 = _1098 * _1132;
    float _1140 = fma(_1092, 0.053149998188018798828125, _1104);
    float _1142 = _100 * _1086;
    float _1144 = _1134 * 0.18672408163547515869140625;
    float _1146 = _1138 * _1128;
    float _1148 = fma(_1102, 0.01805000007152557373046875, _1140);
    float _1150 = _100 * _1110;
    float _1152 = fma(_893, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1154 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1156 = fma(_1154, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1158 = 1.0 / _1148;
    float _1160 = fma(_1152, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1162 = abs(_1160);
    float _1164 = log2(_1162);
    float _1166 = exp2(_1136);
    float _1168 = _1158 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1170 = _1164 * 1.5;
    float _1172 = fma(_1142, 0.095146648585796356201171875, _1144);
    float _1174 = _244 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1176 = fma(_1150, 0.0364394821226596832275390625, _1172);
    float _1178 = exp2(_1170);
    float _1180 = _1146 * _1174;
    float _1182 = _814 * 0.4774648249149322509765625;
    float _1184 = -_1166;
    float _1186 = _1184 + 1.0;
    float _1188 = precise::max(_1176, 0.00999999977648258209228515625);
    float _1190 = _1186 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1192 = -_1180;
    float _1194 = exp2(_1192);
    float _1196 = _1178 * 12.56637096405029296875;
    float _1198 = 1.0 / _1196;
    float _1200 = _1156 * _1198;
    float _1202 = _808 * 0.2820948064327239990234375;
    float _1204 = _1202 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1206 = _1202 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1208 = fma(_1182, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1204);
    float _1210 = _1202 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1212 = fma(_1112, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1206);
    float _1214 = 1.0 / _1188;
    float _1216 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1218 = fma(_1114, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1210);
    float _1220 = _1212 * 0.586610972881317138671875;
    float _1222 = -_1194;
    float _1224 = _1222 + 1.0;
    float _1226 = _1216 * _1168;
    float _1228 = precise::clamp(_1226, 0.0, 1.0);
    float _1230 = fma(_1208, 0.298911988735198974609375, _1220);
    float _1232 = _1224 * _1200;
    float _1234 = fma(_1228, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1236 = -_1190;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_1218, 0.114477999508380889892578125, _1230);
    float _1242 = _1120 * _1232;
    float _1244 = precise::min(_1168, _1234);
    float _1246 = _1240 * _1214;
    float _1248 = _1244 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1250 = precise::min(_1246, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1252 = fma(_1234, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1248);
    float _1254 = _1190 * _1194;
    float _1256 = _1194 * _1238;
    float _1258 = _1250 * 0.31830990314483642578125;
    float _1260 = _1092 * _1252;
    float _1262 = _1260 * 0.25;
    float _1264 = _1094 * _1252;
    float _1266 = _1264 * 0.25;
    float _1268 = _1102 * _1252;
    float _1270 = _1268 * 0.25;
    float _1272 = _1134 * _1258;
    float _1274 = _1142 * _1258;
    float _1276 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1278 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1280 = _1122 * _1272;
    float _1282 = _1124 * _1274;
    float _1284 = fma(_822, _1254, _1276);
    float _1286 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1288 = _1150 * _1258;
    float _1290 = precise::max(0.0, _1280);
    float _1292 = fma(_824, _1254, _1278);
    float _1294 = _1262 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1296 = precise::max(0.0, _1282);
    float _1298 = _1266 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1300 = fma(_826, _1254, _1286);
    float _1302 = _1270 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1304 = _1126 * _1288;
    float _1306 = fma(_1256, _1290, _1292);
    float _1308 = precise::max(0.0, _1294);
    float _1310 = fma(_1256, _1296, _1284);
    float _1312 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1314 = _244 + _1312;
    float _1316 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1318 = _244 + _1316;
    float _1320 = precise::max(0.0, _1298);
    float _1322 = _1256 * _1308;
    float _1324 = precise::max(0.0, _1302);
    float _1326 = _1314 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1328 = precise::clamp(_1326, 0.0, 1.0);
    float _1330 = precise::max(0.0, _1304);
    float _1332 = _1318 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1334 = precise::clamp(_1332, 0.0, 1.0);
    float _1336 = _1256 * _1320;
    float _1338 = _1256 * _1324;
    float _1340 = fma(_1328, _1322, _1310);
    float _1342 = fma(_1256, _1330, _1300);
    float _1344 = fma(_1334, _1322, _1310);
    float _1346 = fma(_1328, _1336, _1306);
    float _1348 = fma(_1334, _1336, _1306);
    float _1350 = fma(_1328, _1338, _1342);
    float _1352 = fma(_1334, _1338, _1342);
    out.m_77.x = _1340;
    out.m_77.y = _1346;
    out.m_77.z = _1350;
    out.m_77.w = 1.0;
    out.m_79.x = _1344;
    out.m_79.y = _1348;
    out.m_79.z = _1352;
    out.m_79.w = 1.0;
    return out;
}

