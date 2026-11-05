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
    float4 m_75 [[color(0)]];
    float4 m_77 [[color(1)]];
};

struct main0_in
{
    float4 m_62 [[user(locn0)]];
    float4 m_70 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _84 = gl_FragCoord.w;
    float _86 = in.m_62.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_62.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = 1.0 / _84;
    float _100 = _98 * _90;
    float _102 = _98 * _96;
    float2 _1369 = float2(_100, _102);
    float2 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1369, float2(0.0), isnan(_1369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1369, float2(0.0), isnan(_1369))).xy;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = in.m_64.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_64.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_66.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_64.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_66.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_66.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_68.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_68.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_68.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _98 * _116;
    float _168 = _98 * _122;
    float _170 = _98 * _128;
    float _172 = _98 * _134;
    float _174 = _166 * _166;
    float _176 = _98 * _140;
    float _178 = _170 * _170;
    float _180 = _98 * _146;
    float _182 = fma(_168, _168, _174);
    float _184 = _98 * _152;
    float _186 = fma(_176, _176, _178);
    float _188 = _98 * _158;
    float _190 = fma(_172, _172, _182);
    float _192 = _98 * _164;
    float _194 = in.m_66.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = fma(_180, _180, _186);
    float _202 = rsqrt(_190);
    float _204 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _206 = _188 + _204;
    float _208 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _210 = _192 + _208;
    float _212 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _214 = _184 + _212;
    float _216 = _206 * _206;
    float _218 = rsqrt(_200);
    float _220 = fma(_210, _210, _216);
    float _222 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _224 = _184 + _222;
    float _226 = fma(_214, _214, _220);
    float _228 = _224 * _224;
    float _230 = _168 * _202;
    float _232 = _172 * _202;
    float _234 = _166 * _202;
    float _236 = sqrt(_226);
    float _238 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _240 = _192 + _238;
    float _242 = _180 * _218;
    float _244 = _176 * _218;
    float _246 = _170 * _218;
    float _248 = fma(_240, _240, _228);
    float _250 = _230 * _242;
    float _252 = _234 * _244;
    float _254 = _98 * _198;
    float _256 = _232 * _246;
    float _258 = -_250;
    float _260 = fma(_232, _244, _258);
    float _262 = -_252;
    float _264 = fma(_230, _246, _262);
    float _266 = sqrt(_248);
    float _268 = -_256;
    float _270 = fma(_234, _242, _268);
    float _272 = _254 * _260;
    float _274 = _254 * _264;
    float _276 = spvFAdd(_236, 9.9999997473787516355514526367188e-06);
    float _278 = _254 * _270;
    float _280 = _272 * _272;
    float _282 = fma(_278, _278, _280);
    float _284 = 1.0 / _276;
    float _286 = fma(_274, _274, _282);
    bool _290 = _266 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _292 = rsqrt(_286);
    float _294 = _210 * _284;
    float _296 = _206 * _284;
    float _298 = _282;
    if (_290)
    {
        float _300 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _298 = _300;
    }
    float _302 = _298;
    float _304 = _214 * _284;
    float _306 = _244 * _294;
    float _308 = -_296;
    float _310 = -_306;
    float _312 = fma(_246, _308, _310);
    float _314 = _272 * _292;
    float _316 = _278 * _292;
    float _318 = _274 * _292;
    float _320 = -_304;
    float _322 = fma(_242, _320, _312);
    float _324 = _296 * _314;
    float _326 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _328 = _266 + _326;
    float _330 = fma(_294, _316, _324);
    float _332 = _322 * (-0.5);
    float _334 = _328;
    float _336 = _324;
    float _338 = _330;
    if (_290)
    {
        float _340 = _328 * _302;
        _334 = _340;
    }
    float _342 = _334;
    float _344 = fma(_304, _318, _330);
    float _346 = fma(_100, 2.5, _332);
    float _348 = _342;
    if (_290)
    {
        float _350 = _342 * 0.15915493667125701904296875;
        _336 = _350;
    }
    float _352 = _336;
    float _354 = _344 * (-0.5);
    float _356 = fma(_102, 2.5, _354);
    float _358 = fma(_108, 0.25, _346);
    float _360 = fma(_110, 0.25, _356);
    float _362 = _346;
    if (_290)
    {
        float _364 = _352 * 6.283185482025146484375;
        float _366 = cos(_364);
        _362 = _366;
    }
    float _368 = _362;
    float2 _1757 = float2(_358, _360);
    float2 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1757, float2(0.0), isnan(_1757))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1757, float2(0.0), isnan(_1757))).xy;
    float _372 = _370.x;
    float _374 = _370.y;
    float2 _1769 = float2(_100, _102);
    float _376 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1769, float2(0.0), isnan(_1769))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1769, float2(0.0), isnan(_1769))).x;
    if (_290)
    {
        float _378 = _188 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _338 = _378;
    }
    float _380 = _338;
    float _382 = _356;
    float _384 = _380;
    if (_290)
    {
        float _386 = _352 * 6.283185482025146484375;
        float _388 = sin(_386);
        _382 = _388;
    }
    float _390 = _382;
    float _392 = _248;
    if (_290)
    {
        float _394 = rsqrt(_248);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = _368;
    if (_290)
    {
        float _400 = _368 + (-1.0);
        _348 = _400;
    }
    float _402 = _348;
    float _404 = 0.0;
    float _406 = _390;
    float _408 = _402;
    if (_290)
    {
        float _410 = fma(_390, _380, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _404 = _410;
    }
    float _412 = _404;
    float _414 = _412;
    if (_290)
    {
        float _416 = _402 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _384 = _416;
    }
    float _418 = _384;
    if (!_290)
    {
        _406 = _188;
    }
    float _420 = _406;
    float _422 = _420;
    if (!_290)
    {
        _408 = _192;
    }
    float _424 = _408;
    float _426 = _424;
    if (_290)
    {
        float _428 = fma(_188, _368, _418);
        _422 = _428;
    }
    float _430 = _422;
    if (!_290)
    {
        _398 = _184;
    }
    float _432 = _398;
    float _434 = _432;
    if (_290)
    {
        float _436 = _396 * _412;
        _414 = _436;
    }
    float _438 = _414;
    if (_290)
    {
        float _440 = fma(_240, _438, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _426 = _440;
    }
    float _442 = _426;
    float _444 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _446 = _430 + _444;
    float _448 = _446;
    if (_290)
    {
        float _450 = fma(_224, _438, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _434 = _450;
    }
    float _452 = _434;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _456 = _442 + _454;
    float _458 = _446 * _446;
    float _460 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _462 = _452 + _460;
    float _464 = fma(_456, _456, _458);
    float _466 = fma(_462, _462, _464);
    float _468 = rsqrt(_466);
    float _470 = _468 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _472 = _456 * _470;
    float _474 = _462 * _470;
    float _476 = _472 * _472;
    float _478 = _474 * _474;
    float _480 = _476 + _478;
    float _482 = sqrt(_480);
    bool _484 = _482 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _488 = _482 + _486;
    float _490 = 0.0;
    float _492 = _480;
    float _494 = _468;
    float _496 = _472;
    float _498 = _474;
    float _500 = _476;
    float _502 = _478;
    if (_484)
    {
        float _504 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _490 = _504;
    }
    float _506 = _490;
    if (_484)
    {
        float _508 = rsqrt(_480);
        _492 = _508;
    }
    float _510 = _492;
    if (_484)
    {
        float _512 = _488 * _506;
        _494 = _512;
    }
    float _514 = _494;
    float _516 = 0.0;
    if (_484)
    {
        float _518 = _514 * 0.15915493667125701904296875;
        _516 = _518;
    }
    float _520 = _516;
    float _522 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _524 = _488;
    if (_484)
    {
        float _526 = _520 * 6.283185482025146484375;
        float _528 = sin(_526);
        _524 = _528;
    }
    float _530 = _524;
    float _532 = precise::max(0.0, _522);
    float _534 = _514;
    float _536 = _532;
    if (_484)
    {
        float _538 = _520 * 6.283185482025146484375;
        float _540 = cos(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = -_470;
    float _546 = -_532;
    float _548 = fma(_446, _544, _546);
    float _550 = _548;
    if (_484)
    {
        float _552 = _548 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _448 = _552;
    }
    float _554 = _448;
    float _556 = _554;
    float _558 = _530;
    if (_484)
    {
        float _560 = fma(_530, _554, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _536 = _560;
    }
    float _562 = _536;
    float _564 = _562;
    if (_484)
    {
        float _566 = _510 * _562;
        _564 = _566;
    }
    float _568 = _564;
    if (_484)
    {
        float _570 = _542 + (-1.0);
        _556 = _570;
    }
    float _572 = _556;
    if (_484)
    {
        float _574 = _472 * _568;
        _496 = _574;
    }
    float _576 = _496;
    if (_484)
    {
        float _578 = _474 * _568;
        _498 = _578;
    }
    float _580 = _498;
    if (_484)
    {
        float _582 = _572 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _558 = _582;
    }
    float _584 = _558;
    if (_484)
    {
        float _586 = _576 * _576;
        _500 = _586;
    }
    float _588 = _500;
    if (_484)
    {
        float _590 = _580 * _580;
        _502 = _590;
    }
    float _592 = _502;
    if (_484)
    {
        float _594 = fma(_548, _542, _584);
        _550 = _594;
    }
    float _596 = _550;
    float _598 = fma(_596, _596, _588);
    float _600 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _602 = fma(_236, (*spvDescriptorSet0.fp_c9)._m0[63].x, _600);
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = _598 + _592;
    float _608 = -_604;
    float _610 = _608 + 1.0;
    float _612 = rsqrt(_606);
    float _614 = abs(_610);
    float _616 = log2(_614);
    float _618 = _612 * _576;
    float _620 = _612 * _596;
    float _622 = _612 * _580;
    float _624 = _618 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _626 = _616 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _628 = -_624;
    float _630 = fma(_620, (*spvDescriptorSet0.fp_c9)._m0[69].y, _628);
    float _632 = -_622;
    float _634 = fma(_632, (*spvDescriptorSet0.fp_c9)._m0[69].z, _630);
    float _636 = exp2(_626);
    float _638 = fma(_374, 2.007874011993408203125, -1.007874011993408203125);
    float _640 = fma(_372, 2.007874011993408203125, -1.007874011993408203125);
    float _642 = _620 + 1.0;
    float _644 = _638 * _638;
    float _646 = _278 * _638;
    float _648 = -_620;
    float _650 = fma(_636, _642, _648);
    float _652 = _272 * _638;
    float _654 = fma(_640, _640, _644);
    float _656 = _274 * _638;
    float _658 = fma(_244, _640, _646);
    float _660 = fma(_246, _640, _652);
    float _662 = -_654;
    float _664 = _662 + 1.0;
    float _666 = precise::clamp(_664, 0.0, 1.0);
    float _668 = _234 * _296;
    float _670 = fma(_242, _640, _656);
    float _672 = fma(_634, -0.5, 0.5);
    float _674 = sqrt(_666);
    float _676 = fma(_230, _294, _668);
    float _678 = fma(_650, 0.5, 0.5);
    float _680 = fma(_634, 0.5, 0.5);
    float _682 = in.m_70.w;
    float _684 = gl_FragCoord.w;
    float _686 = _682 * _684;
    float _688 = in.m_70.z;
    float _690 = gl_FragCoord.w;
    float _692 = _688 * _690;
    float _694 = sqrt(_672);
    float _696 = fma(_232, _304, _676);
    float _698 = fma(_234, _674, _660);
    float _700 = fma(_230, _674, _658);
    float _702 = fma(_232, _674, _670);
    float _704 = fma(_680, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _706 = _698 * _698;
    float _708 = in.m_62.w;
    float _710 = gl_FragCoord.w;
    float _712 = _708 * _710;
    float _714 = in.m_62.z;
    float _716 = gl_FragCoord.w;
    float _718 = _714 * _716;
    float _720 = fma(_680, _704, -0.212114393711090087890625);
    float _722 = fma(_700, _700, _706);
    float _724 = fma(_680, _720, 1.570728778839111328125);
    float _726 = fma(_702, _702, _722);
    float _728 = _694 * 0.636619746685028076171875;
    float _730 = -_724;
    float _732 = fma(_728, _730, 1.0);
    float _734 = rsqrt(_726);
    float _736 = _98 * _686;
    float _738 = _98 * _692;
    float _740 = _698 * _734;
    float _742 = _700 * _734;
    float _744 = _702 * _734;
    float _746 = _296 * _740;
    float _748 = _98 * _718;
    float _750 = fma(_294, _742, _746);
    float _752 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 1.6670000553131103515625, _102);
    float _754 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _376);
    float _756 = fma(_322, -0.25, _100);
    float _758 = fma(_304, _744, _750);
    float _760 = fma(_344, -0.25, _752);
    float _762 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 6.66800022125244140625, _102);
    float _764 = _696 + _754;
    float _766 = _98 * _712;
    float2 _2380 = float2(_756, _760);
    float _768 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2380, float2(0.0), isnan(_2380))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2380, float2(0.0), isnan(_2380))).x;
    float2 _2388 = float2(_100, _752);
    float _770 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2388, float2(0.0), isnan(_2388))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2388, float2(0.0), isnan(_2388))).x;
    float _772 = fma((*spvDescriptorSet0.fp_c9)._m0[983].y, 0.416750013828277587890625, _758);
    float2 _2400 = float2(_748, _766);
    float3 _776 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2400, float2(0.0), isnan(_2400))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2400, float2(0.0), isnan(_2400))).xyz;
    float _778 = _776.x;
    float _780 = _776.y;
    float _782 = _776.z;
    float2 _2413 = float2(_772, 0.0);
    float3 _784 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2413, float2(0.0), isnan(_2413))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2413, float2(0.0), isnan(_2413))).xyz;
    float _786 = _784.x;
    float _788 = _784.y;
    float _790 = _784.z;
    float3 _2428 = float3(_738, _736, float(0));
    float3 _2432 = select(_2428, float3(0.0), isnan(_2428));
    float _792 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2432.xy, uint(rint(_2432.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2432.xy, uint(rint(_2432.z))).z;
    float2 _2438 = float2(_100, _762);
    float _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2438, float2(0.0), isnan(_2438))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2438, float2(0.0), isnan(_2438))).y;
    float3 _2447 = float3(_738, _736, float(0));
    float3 _2449 = select(_2447, float3(0.0), isnan(_2447));
    float3 _796 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2449.xy, uint(rint(_2449.z))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2449.xy, uint(rint(_2449.z))).xyz;
    float _798 = _796.x;
    float _800 = _796.y;
    float _802 = _796.z;
    float2 _2461 = float2(_732, _678);
    float3 _804 = dm_bs(spvDescriptorSet0.fp_t_tcb_22.sample(spvDescriptorSet0.fp_t_tcb_22Smplr, select(_2461, float2(0.0), isnan(_2461))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_22, spvDescriptorSet0.fp_t_tcb_22Smplr_w, select(_2461, float2(0.0), isnan(_2461))).xyz;
    float _806 = _804.x;
    float _808 = _804.y;
    float _810 = _804.z;
    float2 _2474 = float2(_764, 0.0);
    float3 _812 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2474, float2(0.0), isnan(_2474))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2474, float2(0.0), isnan(_2474))).xyz;
    float _814 = _812.x;
    float _816 = _812.y;
    float _818 = _812.z;
    float _820 = _188 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _822 = _188 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _824 = fma(_192, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _820);
    float _826 = fma(_192, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _822);
    float _828 = fma(_184, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _824);
    float _830 = fma(_184, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _826);
    float _832 = _296 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _834 = _828 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _836 = _830 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _838 = in.m_72.w;
    float _840 = gl_FragCoord.w;
    float _842 = _838 * _840;
    float _844 = trunc(_834);
    int _847 = int(_844);
    float _849 = trunc(_836);
    int _851 = int(_849);
    float _853 = fma(_294, (*spvDescriptorSet0.fp_c9)._m0[69].x, _832);
    float _855 = fma(_304, (*spvDescriptorSet0.fp_c9)._m0[69].z, _853);
    int _857 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _859 = _847 + _857;
    int _861 = _859 + 1;
    bool _863 = _861 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _865 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _867 = _851 + _865;
    int _869 = _867 + 1;
    float _871 = _768 * 0.25;
    float _873 = precise::max(_770, _871);
    int _875 = _861 | _869;
    float _877 = fma(_786, 0.125, _778);
    float _879 = fma(_788, 0.125, _780);
    bool _881 = _875 < 0;
    bool _883 = _881 || _863;
    float _885 = _786 + _873;
    float _887 = _788 + _873;
    float _889 = fma(_790, 0.125, _782);
    bool _891 = _869 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _893 = _891 || _883;
    float _895 = fma(_873, _885, _877);
    float _897 = _790 + _873;
    float _899 = fma(_873, _887, _879);
    float _901 = _98 * _842;
    float _903 = fma(_873, _897, _889);
    float _905 = _778;
    if (_893)
    {
        _905 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _907 = _905;
    float _909 = _907;
    if (!_893)
    {
        int _911 = _869 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _913 = _911 + _861;
        float _915 = floor(_834);
        int _917 = _913 << 2;
        int _919 = _913 >> 2;
        int _921 = 12 & _917;
        float _923 = floor(_836);
        int _925 = _919 << 4;
        int _927 = _925 + _921;
        int _929 = _927 + 16256;
        uint _932 = uint(int(uint(_929) >> uint(2)));
        uint _934 = uint(int(uint(int(_932)) >> uint(2)));
        int _936 = int(_932) & 3;
        float _938 = (*spvDescriptorSet0.fp_c9)._m0[int(_934)][_936];
        float _940 = -_915;
        float _942 = _834 + _940;
        float _944 = -_923;
        float _946 = _836 + _944;
        float _948 = rint(_938);
        float _950 = precise::max(_948, 0.0);
        uint _952 = uint(_950);
        uint _954 = clamp(_952, 0u, 65535u);
        float3 _2710 = float3(_942, _946, float(int(_954)));
        float3 _2712 = select(_2710, float3(0.0), isnan(_2710));
        float _956 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, _2712.xy, uint(rint(_2712.z))), spvDescriptorSet0.dm_border, 12u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, _2712.xy, uint(rint(_2712.z))).x;
        int _958 = _913 << 4;
        int _960 = _958 + 17904;
        int _962 = _927 + 24304;
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
        float _1006 = _188 * _986;
        float _1008 = fma(_192, _978, _1006);
        float _1010 = 1.0 / _970;
        float _1012 = fma(_184, _996, _1008);
        float _1014 = _1012 + _1004;
        float _1016 = precise::clamp(_1014, 0.0, 1.0);
        float _1018 = -_1016;
        float _1020 = _1018 + _956;
        float _1022 = _970 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1024 = fma(_1010, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1020);
        float _1026 = _1022 * _1024;
        float _1028 = exp2(_1026);
        float _1030 = 0.0 + _1028;
        float _1032 = precise::clamp(_1030, 0.0, 1.0);
        float _1034 = precise::min(_1032, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _909 = _1034;
    }
    float _1036 = _909;
    float _1038 = abs(_206);
    bool _1040 = _1038 > 0.00999999977648258209228515625;
    float _1042 = -_901;
    float _1044 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1046 = _1042 + _1044;
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_794, _786, _895);
    float _1054 = _1040 ? _206 : 0.00999999977648258209228515625;
    float _1056 = _1046 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1058 = precise::clamp(_1056, 0.0, 1.0);
    float _1060 = in.m_72.y;
    float _1062 = gl_FragCoord.w;
    float _1064 = _1060 * _1062;
    float _1066 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1068 = fma(_794, _788, _899);
    float _1070 = _1054 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1072 = fma(_1058, _1050, _1036);
    float _1074 = fma(_794, _790, _903);
    float _1076 = -_1066;
    float _1078 = exp2(_1076);
    float _1080 = precise::max(_1070, -127.0);
    float _1082 = in.m_72.z;
    float _1084 = gl_FragCoord.w;
    float _1086 = _1082 * _1084;
    float _1088 = _800 * 0.4774648249149322509765625;
    float _1090 = _802 * 0.4774648249149322509765625;
    float _1092 = _816 * 0.0452399961650371551513671875;
    float _1094 = precise::min(_1072, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1096 = -_1080;
    float _1098 = exp2(_1096);
    float _1100 = _814 * 0.0452399961650371551513671875;
    float _1102 = _818 * 0.0452399961650371551513671875;
    float _1104 = -_1098;
    float _1106 = _1104 + 1.0;
    float _1108 = _98 * _1064;
    float _1110 = _1078 * _1106;
    float _1112 = 1.0 / _1080;
    float _1114 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1116 = fma(_1114, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1118 = _616 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1120 = _1068 * 0.17880000174045562744140625;
    float _1122 = fma(_1052, 0.053149998188018798828125, _1120);
    float _1124 = _1110 * _1112;
    float _1126 = fma(_855, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1128 = fma(_1074, 0.01805000007152557373046875, _1122);
    float _1130 = in.m_72.x;
    float _1132 = gl_FragCoord.w;
    float _1134 = _1130 * _1132;
    float _1136 = fma(_1126, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1138 = exp2(_1118);
    float _1140 = abs(_1136);
    float _1142 = log2(_1140);
    float _1144 = 1.0 / _1128;
    float _1146 = -_1138;
    float _1148 = _1146 + 1.0;
    float _1150 = _1148 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1152 = _1142 * 1.5;
    float _1154 = _1108 * 0.18672408163547515869140625;
    float _1156 = _98 * _1134;
    float _1158 = _98 * _1086;
    float _1160 = exp2(_1152);
    float _1162 = fma(_1156, 0.095146648585796356201171875, _1154);
    float _1164 = _1144 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1166 = _1160 * 12.56637096405029296875;
    float _1168 = _792 * 0.2820948064327239990234375;
    float _1170 = _1168 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1172 = 1.0 / _1166;
    float _1174 = _1116 * _1172;
    float _1176 = _236 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1178 = fma(_1158, 0.0364394821226596832275390625, _1162);
    float _1180 = _1168 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1182 = _1124 * _1176;
    float _1184 = _798 * 0.4774648249149322509765625;
    float _1186 = precise::max(_1178, 0.00999999977648258209228515625);
    float _1188 = fma(_1088, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1180);
    float _1190 = -_1182;
    float _1192 = exp2(_1190);
    float _1194 = fma(_1184, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1170);
    float _1196 = _1168 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1198 = _1188 * 0.586610972881317138671875;
    float _1200 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1202 = fma(_1090, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1196);
    float _1204 = fma(_1194, 0.298911988735198974609375, _1198);
    float _1206 = 1.0 / _1186;
    float _1208 = _1200 * _1164;
    float _1210 = precise::clamp(_1208, 0.0, 1.0);
    float _1212 = fma(_1202, 0.114477999508380889892578125, _1204);
    float _1214 = fma(_1210, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1216 = -_1192;
    float _1218 = _1216 + 1.0;
    float _1220 = precise::min(_1164, _1214);
    float _1222 = _1218 * _1174;
    float _1224 = -_1150;
    float _1226 = _1224 + 1.0;
    float _1228 = _1220 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1230 = _1212 * _1206;
    float _1232 = _1094 * _1222;
    float _1234 = _1150 * _1192;
    float _1236 = fma(_1214, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1228);
    float _1238 = _1192 * _1226;
    float _1240 = precise::min(_1230, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1242 = _1232 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1244 = _1052 * _1236;
    float _1246 = _1244 * 0.25;
    float _1248 = _1068 * _1236;
    float _1250 = _1248 * 0.25;
    float _1252 = _1074 * _1236;
    float _1254 = _1252 * 0.25;
    float _1256 = _1240 * 0.31830990314483642578125;
    float _1258 = fma(_806, _1234, _1242);
    float _1260 = _1246 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1262 = _1232 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1264 = _1108 * _1256;
    float _1266 = _1156 * _1256;
    float _1268 = _1158 * _1256;
    float _1270 = _1250 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1272 = _1092 * _1264;
    float _1274 = _1100 * _1266;
    float _1276 = _1232 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1278 = _1254 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1280 = _1102 * _1268;
    float _1282 = precise::max(0.0, _1272);
    float _1284 = fma(_808, _1234, _1276);
    float _1286 = precise::max(0.0, _1274);
    float _1288 = fma(_810, _1234, _1262);
    float _1290 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1292 = _236 + _1290;
    float _1294 = fma(_1238, _1282, _1284);
    float _1296 = precise::max(0.0, _1260);
    float _1298 = fma(_1238, _1286, _1258);
    float _1300 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1302 = _236 + _1300;
    float _1304 = precise::max(0.0, _1270);
    float _1306 = _1292 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1308 = precise::clamp(_1306, 0.0, 1.0);
    float _1310 = precise::max(0.0, _1278);
    float _1312 = _1238 * _1296;
    float _1314 = precise::max(0.0, _1280);
    float _1316 = _1302 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1318 = precise::clamp(_1316, 0.0, 1.0);
    float _1320 = _1238 * _1304;
    float _1322 = _1238 * _1310;
    float _1324 = fma(_1238, _1314, _1288);
    float _1326 = fma(_1308, _1312, _1298);
    float _1328 = fma(_1318, _1312, _1298);
    float _1330 = fma(_1308, _1320, _1294);
    float _1332 = fma(_1318, _1320, _1294);
    float _1334 = fma(_1308, _1322, _1324);
    float _1336 = fma(_1318, _1322, _1324);
    out.m_75.x = _1326;
    out.m_75.y = _1330;
    out.m_75.z = _1334;
    out.m_75.w = 1.0;
    out.m_77.x = _1328;
    out.m_77.y = _1332;
    out.m_77.z = _1336;
    out.m_77.w = 1.0;
    return out;
}

