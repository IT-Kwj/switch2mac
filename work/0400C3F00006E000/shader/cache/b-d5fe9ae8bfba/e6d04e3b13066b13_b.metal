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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _2516, thread const int& _2517, thread const int& _2518, thread const int& _2519, thread int& _2520, thread int& _2521, thread int& _2522, thread int& _2523, thread int& _2524, thread int& _2525)
{
    float _2528 = as_type<float>(_2517) + 0.0;
    bool _2530 = _2528 != 0.0;
    bool _2532 = isnan(_2528);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(0.0);
    bool _2538 = _2534 || _2536;
    int _2540 = as_type<int>(_2528);
    int _2542 = _2517;
    int _2544 = _2519;
    int _2546 = _2538 ? (-1) : 0;
    if (!_2538)
    {
        float _2548 = as_type<float>(_2517) * 1.0;
        _2540 = as_type<int>(_2548);
    }
    int _2550 = _2540;
    bool _2552 = !_2538;
    int _2554 = _2550;
    if (!_2552)
    {
        float _2556 = as_type<float>(_2517) + 0.0;
        bool _2558 = _2556 >= 0.0;
        bool _2560 = isnan(_2556);
        bool _2562 = _2558 || _2560;
        bool _2564 = isnan(0.0);
        bool _2566 = _2562 || _2564;
        int _2568 = as_type<int>(_2556);
        _2546 = _2566 ? (-1) : 0;
        if (!_2566)
        {
            _2568 = 2147483647;
        }
        int _2570 = _2568;
        bool _2572 = !_2566;
        _2554 = _2570;
        if (!_2572)
        {
            float _2574 = abs(as_type<float>(_2517));
            float _2576 = _2574 + 0.0;
            bool _2578 = _2576 > as_type<float>(0x7f800000u /* inf */);
            bool _2580 = isnan(_2576);
            bool _2582 = _2578 || _2580;
            bool _2584 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2586 = _2582 || _2584;
            int _2588 = as_type<int>(_2576);
            _2546 = _2586 ? (-1) : 0;
            if (_2586)
            {
                float _2590 = as_type<float>(_2517) + 1.0;
                _2588 = as_type<int>(_2590);
            }
            int _2592 = _2588;
            _2554 = _2592;
            if (!_2586)
            {
                float _2594 = abs(as_type<float>(_2517));
                float _2596 = _2594 + (-0.0);
                float _2598 = 0.0 + _2596;
                bool _2600 = _2598 != as_type<float>(0x7f800000u /* inf */);
                bool _2602 = isnan(_2598);
                bool _2604 = _2600 || _2602;
                bool _2606 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2608 = _2604 || _2606;
                int _2610 = as_type<int>(_2598);
                _2546 = _2608 ? (-1) : 0;
                if (!_2608)
                {
                    _2610 = _2517;
                }
                int _2612 = _2610;
                bool _2614 = !_2608;
                _2554 = _2612;
                if (!_2614)
                {
                    float _2616 = as_type<float>(_2517) * 18446744073709551616.0;
                    float _2618 = rsqrt(_2616);
                    float _2620 = _2616 * _2618;
                    float _2622 = _2618 * 0.5;
                    float _2624 = -_2620;
                    float _2626 = 0.0 + _2624;
                    float _2628 = fma(_2622, _2626, 0.5);
                    float _2630 = fma(_2620, _2628, _2620);
                    float _2632 = -_2630;
                    float _2634 = 0.0 + _2632;
                    float _2636 = fma(_2630, _2634, _2616);
                    float _2638 = fma(_2622, _2636, _2630);
                    float _2640 = _2638 * 2.3283064365386962890625e-10;
                    _2554 = as_type<int>(_2640);
                    _2542 = as_type<int>(_2626);
                    _2544 = as_type<int>(_2630);
                }
            }
        }
    }
    int _2642 = _2554;
    int _2644 = _2542;
    int _2646 = _2544;
    int _2648 = _2546;
    _2520 = _2642;
    _2521 = _2518;
    _2522 = 0;
    _2523 = _2644;
    _2524 = _2646;
    _2525 = _2648;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _248 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _54;
    float _76 = _74 * _60;
    float _78 = _74 * _66;
    float _80 = _74 * _72;
    float _82 = _76 * _76;
    float _84 = fma(_78, _78, _82);
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _88 = fma(_80, _80, _84);
    float _90 = precise::max(0.0, _86);
    float _92 = rsqrt(_88);
    float _94 = _78 * _92;
    float _96 = _80 * _92;
    float _98 = _76 * _92;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = -_98;
    float _106 = -_90;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _110 = _100 * _100;
    float _112 = _102 * _102;
    float _114 = _110 + _112;
    float _116 = sqrt(_114);
    bool _120 = _116 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _122 = _92;
    float _124 = _90;
    float _126 = _108;
    float _128 = _100;
    float _130 = _102;
    if (!_120)
    {
        _122 = _112;
    }
    float _132 = _122;
    float _134 = _132;
    if (!_120)
    {
        _124 = _110;
    }
    float _136 = _124;
    bool _138 = !_120;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _146 = _116 + _144;
        float _148 = _108 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _150 = rsqrt(_114);
        float _152 = _146 * _142;
        float _154 = _152 * 0.15915493667125701904296875;
        float _156 = _154 * 6.283185482025146484375;
        float _158 = sin(_156);
        float _160 = _154 * 6.283185482025146484375;
        float _162 = cos(_160);
        float _164 = fma(_158, _148, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _166 = _150 * _164;
        float _168 = _162 + (-1.0);
        float _170 = _100 * _166;
        float _172 = _102 * _166;
        float _174 = _168 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _176 = _172 * _172;
        float _178 = fma(_108, _162, _174);
        float _180 = _170 * _170;
        _126 = _178;
        _140 = _180;
        _134 = _176;
        _128 = _170;
        _130 = _172;
    }
    float _182 = _126;
    float _184 = _140;
    float _186 = _134;
    float _188 = _128;
    float _190 = _130;
    float _192 = fma(_182, _182, _184);
    float _194 = _192 + _186;
    float _196 = rsqrt(_194);
    float _198 = _196 * _182;
    float _200 = _196 * _188;
    float _202 = _196 * _190;
    float _204 = -_198;
    float _206 = precise::max(0.0, _204);
    float _208 = abs(_206);
    float _210 = -_208;
    float _212 = _210 + 1.0;
    float _214 = fma(_206, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _216 = as_type<int>(_212) + (-218103808);
    float _218 = fma(_206, _214, -0.212114393711090087890625);
    bool _220 = uint(_216) >= 1920991232u;
    float _222 = fma(_206, _218, 1.570728778839111328125);
    bool _224 = !_220;
    float _246;
    if (!_224)
    {
        int _226 = 0;
        int _228 = as_type<int>(_212);
        int _230 = 1104;
        int _232 = 0;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        _50(_226, _228, _230, _232, _234, _236, _238, _240, _242, _244);
        _246 = as_type<float>(_234);
        _248 = true;
    }
    else
    {
        float _250 = rsqrt(_212);
        float _252 = _212 * _250;
        float _254 = _250 * 0.5;
        float _256 = -_252;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, 0.5);
        float _262 = fma(_252, _260, _252);
        float _264 = -_262;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, _212);
        float _270 = fma(_254, _268, _262);
        _246 = _270;
    }
    _248 = false;
    float _272 = _246;
    bool _274 = _198 > 0.0;
    float _276 = _96 * _96;
    float _278 = _94 * _94;
    float _280 = _276 + _278;
    if (_274)
    {
        discard_fragment();
    }
    float _282 = rsqrt(_280);
    float _284 = _222 * _272;
    float _286 = _284 * 0.636619746685028076171875;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_288;
    float _292 = _290 + 1.0;
    float _294 = sqrt(_292);
    float _296 = _96 * _282;
    float _298 = _94 * _282;
    float _300 = abs(_296);
    float _302 = abs(_298);
    float _304 = precise::max(_300, _302);
    float _306 = precise::max(_304, 9.9999997473787516355514526367188e-05);
    float _308 = -_294;
    float _310 = _308 + 1.0;
    float _312 = 1.0 / _306;
    float _314 = _310 * 0.5;
    float _316 = -_312;
    float _318 = _296 * _316;
    float _320 = _298 * _312;
    float _322 = fma(_318, _314, 0.5);
    float _324 = fma(_320, _314, 0.5);
    if (_274)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float2 _1394;
    _1394.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _1394.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _326 = _1394.x;
    float _328 = _326 * 256.0;
    int _330 = int(_328);
    float _332 = -_98;
    float _334 = _332 + 1.0;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _94 * _98;
    float _340 = abs(_336);
    float _342 = log2(_340);
    float _344 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _346 = fma(_276, 3.0, -1.0);
    float _348 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _350 = _98 * _344;
    float _352 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _354 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _356 = _98 * _348;
    float _358 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _350);
    float _360 = _98 * _352;
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _364 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _356);
    float _366 = -_96;
    float _368 = fma(_366, _354, _358);
    float _370 = fma(_96, _354, _358);
    float _372 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _360);
    float _374 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _376 = _342 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _378 = -_96;
    float _380 = fma(_378, _362, _364);
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _384 = fma(_96, _362, _364);
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _388 = -_96;
    float _390 = fma(_388, _374, _372);
    float _392 = fma(_96, _374, _372);
    float _394 = -_94;
    float _396 = fma(_394, _382, _368);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _400 = fma(_94, _382, _370);
    float _402 = _200 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _404 = exp2(_376);
    float _406 = -_94;
    float _408 = fma(_406, _386, _380);
    float _410 = fma(_94, _386, _384);
    float _412 = -_94;
    float _414 = fma(_412, _398, _390);
    float _416 = fma(_94, _398, _392);
    float _418 = -_402;
    float _420 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[11].y, _418);
    float _422 = -_98;
    float _424 = _94 * _422;
    float _426 = -_202;
    float _428 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[11].z, _420);
    float _430 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _432 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _434 = fma(_428, 0.5, 0.5);
    float _436 = fma(_428, -0.5, 0.5);
    float _438 = fma(_430, _424, _396);
    float _440 = fma(_430, _338, _400);
    float _442 = fma(_434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _444 = _404 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _446 = fma(_432, _424, _408);
    float _448 = sqrt(_436);
    float _450 = fma(_434, _442, -0.212114393711090087890625);
    float _452 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _458 = fma(_432, _338, _410);
    float _460 = fma(_434, _450, 1.570728778839111328125);
    float _462 = _96 * (-3.0);
    float _464 = -_454;
    float _466 = _464 + 1.0;
    float _468 = fma(_456, _424, _414);
    float _470 = _94 * _96;
    float _472 = -_96;
    float _474 = _98 * _472;
    float _476 = -_96;
    float _478 = fma(_476, _462, -1.0);
    float _480 = _98 * _96;
    float _482 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _484 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _486 = abs(_466);
    float _488 = log2(_486);
    float _490 = fma(_456, _338, _416);
    float _492 = fma(_482, _474, _438);
    float _494 = fma(_482, _480, _440);
    float _496 = fma(_484, _474, _446);
    float _498 = fma(_484, _480, _458);
    float _500 = in.m_44.x;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_44.y;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = _448 * 0.636619746685028076171875;
    float _514 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _516 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _518 = -_460;
    float _520 = fma(_512, _518, 1.0);
    float _522 = fma(_514, _470, _492);
    float _524 = fma(_514, _470, _494);
    float _526 = fma(_516, _474, _468);
    float _528 = _488 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _530 = fma(_516, _480, _490);
    float _532 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _536 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _538 = exp2(_528);
    float _540 = fma(_532, _470, _496);
    float _542 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _544 = fma(_532, _470, _498);
    float _546 = fma(_534, _470, _526);
    float _548 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _550 = fma(_542, _478, _540);
    float _552 = fma(_536, _478, _522);
    float _554 = fma(_542, _346, _544);
    float _556 = fma(_548, _478, _546);
    float _558 = _198 + 1.0;
    float _560 = fma(_534, _470, _530);
    float _562 = fma(_536, _346, _524);
    float _564 = -_198;
    float _566 = fma(_538, _558, _564);
    float _568 = _74 * _504;
    float _570 = _74 * _510;
    float _572 = fma(_566, 0.5, 0.5);
    float _574 = fma(_198, -0.5, 0.5);
    float _576 = float(uint(_330));
    float _578 = _576 * 0.00390625;
    float2 _1803 = float2(_322, _324);
    float4 _581 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1803, float2(0.0), isnan(_1803)), level(_578)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1803, float2(0.0), isnan(_1803)), level(_578)).xyzw;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _581.z;
    float _589 = _581.w;
    float2 _1822 = float2(_322, _324);
    float2 _593 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1822, float2(0.0), isnan(_1822)), level(_578)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1822, float2(0.0), isnan(_1822)), level(_578)).xy;
    float _595 = _593.x;
    float _597 = _593.y;
    float2 _1835 = float2(_568, _570);
    float3 _601 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1835, float2(0.0), isnan(_1835))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1835, float2(0.0), isnan(_1835))).xyz;
    float _603 = _601.x;
    float _605 = _601.y;
    float _607 = _601.z;
    float2 _1849 = float2(_322, _324);
    float2 _609 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1849, float2(0.0), isnan(_1849)), level(_578)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1849, float2(0.0), isnan(_1849)), level(_578)).xy;
    float _611 = _609.x;
    float _613 = _609.y;
    float2 _1862 = float2(_322, _324);
    float4 _615 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1862, float2(0.0), isnan(_1862)), level(_578)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1862, float2(0.0), isnan(_1862)), level(_578)).xyzw;
    float _617 = _615.x;
    float _619 = _615.y;
    float _621 = _615.z;
    float _623 = _615.w;
    float2 _1879 = float2(_520, _572);
    float3 _625 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1879, float2(0.0), isnan(_1879))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1879, float2(0.0), isnan(_1879))).xyz;
    float _627 = _625.x;
    float _629 = _625.y;
    float _631 = _625.z;
    float2 _1893 = float2(_520, _574);
    float3 _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1893, float2(0.0), isnan(_1893))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1893, float2(0.0), isnan(_1893))).xyz;
    float _635 = _633.x;
    float _637 = _633.y;
    float _639 = _633.z;
    float _641 = fma(_548, _346, _560);
    float _643 = _198 * (-10000.0);
    float _645 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _647 = _198 * _645;
    float _649 = -_98;
    float _651 = fma(_649, _98, _278);
    float _653 = abs(_643);
    bool _655 = _653 > 0.00999999977648258209228515625;
    float _657 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].x, _647);
    float _659 = _655 ? _643 : 0.00999999977648258209228515625;
    float _661 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].z, _657);
    float _663 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _665 = _659 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _667 = fma(_663, _651, _552);
    float _669 = fma(_663, _651, _562);
    float _671 = fma(_661, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _673 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _675 = precise::max(_665, -127.0);
    float _677 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _679 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _681 = fma(_673, _651, _550);
    float _683 = fma(_673, _651, _554);
    float _685 = -_677;
    float _687 = exp2(_685);
    float _689 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _691 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _693 = fma(_691, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _695 = fma(_689, _651, _556);
    float _697 = fma(_689, _651, _641);
    float _699 = -_675;
    float _701 = exp2(_699);
    float _703 = abs(_679);
    float _705 = log2(_703);
    float _707 = 1.0 / _675;
    float _709 = -_701;
    float _711 = _709 + 1.0;
    float _713 = _687 * _711;
    float _715 = _488 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _717 = _705 * 1.5;
    float _719 = exp2(_717);
    float _721 = _713 * _707;
    float _723 = exp2(_715);
    float _725 = _589 * _589;
    float _727 = _595 * _597;
    float _729 = _603 * _605;
    float _731 = -_597;
    float _733 = _731 + _613;
    float _735 = _725 * _725;
    float _737 = _735 * 16.0;
    float _739 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _741 = _739 + 1.0;
    float _743 = -_729;
    float _745 = _743 + 1.0;
    float _747 = _597 * _737;
    float _749 = fma(_603, _733, _597);
    float _751 = _719 * 12.56637096405029296875;
    float _753 = fma(_745, _741, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _755 = -_723;
    float _757 = _755 + 1.0;
    float _759 = _585 * _747;
    float _761 = _587 * _747;
    float _763 = _611 * _753;
    float _765 = precise::max(_749, 1.52587890625e-05);
    float _767 = _757 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _769 = 1.0 / _751;
    float _771 = -_727;
    float _773 = fma(_613, _763, _771);
    float _775 = -_767;
    float _777 = _775 + 1.0;
    float _779 = _767 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _781 = fma(_603, _773, _727);
    float _783 = _583 * _747;
    float _785 = -_607;
    float _787 = _785 + 1.0;
    float _789 = 1.0 / _765;
    float _791 = _749 * _787;
    float _793 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _795 = _793 + 1.0;
    float _797 = abs(_777);
    float _799 = log2(_797);
    float _801 = _693 * _769;
    float _803 = fma(_745, _795, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _805 = _781 * _789;
    float _807 = _805 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _809 = _805 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _811 = _791 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _813 = _807 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _815 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _817 = -_811;
    float _819 = _817 + 1.0;
    float _821 = _799 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _823 = _683 * _813;
    float _825 = _669 * _813;
    float _827 = _697 * _813;
    float _829 = _799 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _831 = fma(_681, _815, _823);
    float _833 = abs(_819);
    float _835 = log2(_833);
    float _837 = fma(_667, _815, _825);
    float _839 = fma(_695, _815, _827);
    float _841 = _831 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _843 = _623 * _623;
    float _845 = _837 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _847 = _839 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _849 = _841 * 0.715200006961822509765625;
    float _851 = exp2(_821);
    float _853 = _843 * _843;
    float _855 = fma(_845, 0.2125999927520751953125, _849);
    float _857 = fma(_847, 0.072200000286102294921875, _855);
    float _859 = exp2(_829);
    float _861 = _853 * 16.0;
    float _863 = _835 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _865 = -_845;
    float _867 = _865 + _857;
    float _869 = _803 * _861;
    float _871 = -_841;
    float _873 = _871 + _857;
    float _875 = -_847;
    float _877 = _875 + _857;
    float _879 = _851 * _789;
    float _881 = _729 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _883 = _621 * _869;
    float _885 = exp2(_863);
    float _887 = fma(_881, _867, _845);
    float _889 = _613 * _869;
    float _891 = fma(_881, _873, _841);
    float _893 = -_761;
    float _895 = fma(_613, _883, _893);
    float _897 = fma(_881, _877, _847);
    float _899 = -_759;
    float _901 = fma(_619, _889, _899);
    float _903 = -_783;
    float _905 = fma(_617, _889, _903);
    float _907 = _859 * _891;
    float _909 = fma(_603, _895, _761);
    float _911 = fma(_603, _901, _759);
    float _913 = fma(_603, _905, _783);
    float _915 = _907 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _917 = _909 * _879;
    float _919 = _911 * _879;
    float _921 = -_885;
    float _923 = spvFAdd(_921, 1.00010001659393310546875);
    float _925 = -_885;
    float _927 = _925 + 1.0;
    float _929 = _913 * _879;
    float _931 = _859 * _897;
    float _933 = fma(_919, (*spvDescriptorSet0.fp_c3)._m0[27].y, _915);
    float _935 = _859 * _887;
    float _937 = 1.0 / _923;
    float _939 = -_811;
    float _941 = _939 + _927;
    float _943 = _931 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _945 = _935 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _947 = _941 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _949 = fma(_917, (*spvDescriptorSet0.fp_c3)._m0[27].z, _943);
    float _951 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[27].x, _945);
    float _953 = fma(_629, _779, _933);
    float _955 = _637 * _947;
    float _957 = fma(_631, _779, _949);
    float _959 = fma(_627, _779, _951);
    float _961 = _635 * _947;
    float _963 = fma(_811, _953, _955);
    float _965 = _639 * _947;
    float _967 = fma(_811, _959, _961);
    float _969 = _937 * _963;
    float _971 = fma(_811, _957, _965);
    float _973 = _937 * _967;
    float _975 = _969 * 0.715200006961822509765625;
    float _977 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _979 = _937 * _971;
    float _981 = fma(_973, 0.2125999927520751953125, _975);
    float _983 = _721 * _977;
    float _985 = fma(_979, 0.072200000286102294921875, _981);
    float _987 = -_983;
    float _989 = exp2(_987);
    float _991 = 1.0 / _985;
    float _993 = -_989;
    float _995 = _993 + 1.0;
    float _997 = _801 * _995;
    float _999 = _991 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1001 = precise::clamp(_999, 0.0, 1.0);
    float _1003 = fma(_1001, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1005 = _997 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1007 = _997 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1009 = _997 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1011 = _989 * _1003;
    float _1013 = fma(_973, _1011, _1005);
    float _1015 = fma(_969, _1011, _1007);
    float _1017 = fma(_979, _1011, _1009);
    out.m_42.x = _1013;
    out.m_42.y = _1015;
    out.m_42.z = _1017;
    out.m_42.w = _927;
    return out;
}

