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
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_12Smplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_ESmplr_w [[id(22)]];
    sampler fp_t_tcb_CSmplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _2487, thread const int& _2488, thread const int& _2489, thread const int& _2490, thread int& _2491, thread int& _2492, thread int& _2493, thread int& _2494, thread int& _2495, thread int& _2496)
{
    float _2499 = as_type<float>(_2488) + 0.0;
    bool _2501 = _2499 != 0.0;
    bool _2503 = isnan(_2499);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    int _2511 = as_type<int>(_2499);
    int _2513 = _2487;
    int _2515 = _2489;
    int _2517 = _2509 ? (-1) : 0;
    if (!_2509)
    {
        float _2519 = as_type<float>(_2488) * 1.0;
        _2511 = as_type<int>(_2519);
    }
    int _2521 = _2511;
    bool _2523 = !_2509;
    int _2525 = _2521;
    if (!_2523)
    {
        float _2527 = as_type<float>(_2488) + 0.0;
        bool _2529 = _2527 >= 0.0;
        bool _2531 = isnan(_2527);
        bool _2533 = _2529 || _2531;
        bool _2535 = isnan(0.0);
        bool _2537 = _2533 || _2535;
        int _2539 = as_type<int>(_2527);
        _2517 = _2537 ? (-1) : 0;
        if (!_2537)
        {
            _2539 = 2147483647;
        }
        int _2541 = _2539;
        bool _2543 = !_2537;
        _2525 = _2541;
        if (!_2543)
        {
            float _2545 = abs(as_type<float>(_2488));
            float _2547 = _2545 + 0.0;
            bool _2549 = _2547 > as_type<float>(0x7f800000u /* inf */);
            bool _2551 = isnan(_2547);
            bool _2553 = _2549 || _2551;
            bool _2555 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2557 = _2553 || _2555;
            int _2559 = as_type<int>(_2547);
            _2517 = _2557 ? (-1) : 0;
            if (_2557)
            {
                float _2561 = as_type<float>(_2488) + 1.0;
                _2559 = as_type<int>(_2561);
            }
            int _2563 = _2559;
            _2525 = _2563;
            if (!_2557)
            {
                float _2565 = abs(as_type<float>(_2488));
                float _2567 = _2565 + (-0.0);
                float _2569 = 0.0 + _2567;
                bool _2571 = _2569 != as_type<float>(0x7f800000u /* inf */);
                bool _2573 = isnan(_2569);
                bool _2575 = _2571 || _2573;
                bool _2577 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2579 = _2575 || _2577;
                int _2581 = as_type<int>(_2569);
                _2517 = _2579 ? (-1) : 0;
                if (!_2579)
                {
                    _2581 = _2488;
                }
                int _2583 = _2581;
                bool _2585 = !_2579;
                _2525 = _2583;
                if (!_2585)
                {
                    float _2587 = as_type<float>(_2488) * 18446744073709551616.0;
                    float _2589 = rsqrt(_2587);
                    float _2591 = _2587 * _2589;
                    float _2593 = _2589 * 0.5;
                    float _2595 = -_2591;
                    float _2597 = 0.0 + _2595;
                    float _2599 = fma(_2593, _2597, 0.5);
                    float _2601 = fma(_2591, _2599, _2591);
                    float _2603 = -_2601;
                    float _2605 = 0.0 + _2603;
                    float _2607 = fma(_2601, _2605, _2587);
                    float _2609 = fma(_2593, _2607, _2601);
                    float _2611 = _2609 * 2.3283064365386962890625e-10;
                    _2525 = as_type<int>(_2611);
                    _2513 = as_type<int>(_2587);
                    _2515 = as_type<int>(_2601);
                }
            }
        }
    }
    int _2613 = _2525;
    int _2615 = _2513;
    int _2617 = _2515;
    int _2619 = _2517;
    _2491 = _2613;
    _2492 = _2615;
    _2493 = _2490;
    _2494 = 0;
    _2495 = _2617;
    _2496 = _2619;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _252 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _58;
    float _80 = _78 * _64;
    float _82 = _78 * _70;
    float _84 = _78 * _76;
    float _86 = _80 * _80;
    float _88 = fma(_82, _82, _86);
    float _90 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _92 = fma(_84, _84, _88);
    float _94 = precise::max(0.0, _90);
    float _96 = rsqrt(_92);
    float _98 = _82 * _96;
    float _100 = _84 * _96;
    float _102 = _80 * _96;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _108 = -_102;
    float _110 = -_94;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[13].z, _110);
    float _114 = _104 * _104;
    float _116 = _106 * _106;
    float _118 = _114 + _116;
    float _120 = sqrt(_118);
    bool _124 = _120 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _126 = _94;
    float _128 = _96;
    float _130 = _112;
    float _132 = _104;
    float _134 = _106;
    if (!_124)
    {
        _126 = _116;
    }
    float _136 = _126;
    float _138 = _136;
    if (!_124)
    {
        _128 = _114;
    }
    float _140 = _128;
    bool _142 = !_124;
    float _144 = _140;
    if (!_142)
    {
        float _146 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _148 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _150 = _120 + _148;
        float _152 = _112 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _154 = rsqrt(_118);
        float _156 = _150 * _146;
        float _158 = _156 * 0.15915493667125701904296875;
        float _160 = _158 * 6.283185482025146484375;
        float _162 = sin(_160);
        float _164 = _158 * 6.283185482025146484375;
        float _166 = cos(_164);
        float _168 = fma(_162, _152, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _170 = _154 * _168;
        float _172 = _166 + (-1.0);
        float _174 = _104 * _170;
        float _176 = _106 * _170;
        float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = _176 * _176;
        float _182 = fma(_112, _166, _178);
        float _184 = _174 * _174;
        _130 = _182;
        _144 = _184;
        _138 = _180;
        _132 = _174;
        _134 = _176;
    }
    float _186 = _130;
    float _188 = _144;
    float _190 = _138;
    float _192 = _132;
    float _194 = _134;
    float _196 = fma(_186, _186, _188);
    float _198 = _196 + _190;
    float _200 = rsqrt(_198);
    float _202 = _200 * _186;
    float _204 = _200 * _192;
    float _206 = _200 * _194;
    float _208 = -_202;
    float _210 = precise::max(0.0, _208);
    float _212 = abs(_210);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = fma(_210, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _220 = as_type<int>(_216) + (-218103808);
    float _222 = fma(_210, _218, -0.212114393711090087890625);
    bool _224 = uint(_220) >= 1920991232u;
    float _226 = fma(_210, _222, 1.570728778839111328125);
    bool _228 = !_224;
    float _250;
    if (!_228)
    {
        int _230 = 0;
        int _232 = as_type<int>(_216);
        int _234 = 0;
        int _236 = 1104;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        _54(_230, _232, _234, _236, _238, _240, _242, _244, _246, _248);
        _250 = as_type<float>(_238);
        _252 = true;
    }
    else
    {
        float _254 = rsqrt(_216);
        float _256 = _216 * _254;
        float _258 = _254 * 0.5;
        float _260 = -_256;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, 0.5);
        float _266 = fma(_256, _264, _256);
        float _268 = -_266;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, _216);
        float _274 = fma(_258, _272, _266);
        _250 = _274;
    }
    _252 = false;
    float _276 = _250;
    bool _278 = _202 > 0.0;
    float _280 = _100 * _100;
    float _282 = _98 * _98;
    float _284 = _280 + _282;
    if (_278)
    {
        discard_fragment();
    }
    float _286 = rsqrt(_284);
    float _288 = _226 * _276;
    float _290 = _288 * 0.636619746685028076171875;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = -_292;
    float _296 = _294 + 1.0;
    float _298 = sqrt(_296);
    float _300 = _100 * _286;
    float _302 = _98 * _286;
    float _304 = abs(_300);
    float _306 = abs(_302);
    float _308 = precise::max(_304, _306);
    float _310 = precise::max(_308, 9.9999997473787516355514526367188e-05);
    float _312 = -_298;
    float _314 = _312 + 1.0;
    float _316 = 1.0 / _310;
    float _318 = _314 * 0.5;
    float _320 = -_316;
    float _322 = _300 * _320;
    float _324 = _302 * _316;
    float _326 = fma(_322, _318, 0.5);
    float _328 = fma(_324, _318, 0.5);
    if (_278)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float2 _1382;
    _1382.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_326, _328));
    _1382.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_326, _328));
    float _330 = _1382.x;
    float _332 = _330 * 256.0;
    int _334 = int(_332);
    float _336 = -_102;
    float _338 = _336 + 1.0;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _204 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _344 = -_102;
    float _346 = fma(_344, _102, _282);
    float _348 = abs(_340);
    float _350 = log2(_348);
    float _352 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _354 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _356 = -_342;
    float _358 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[11].y, _356);
    float _360 = fma(_280, 3.0, -1.0);
    float _362 = _102 * _352;
    float _364 = _102 * _354;
    float _366 = -_206;
    float _368 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
    float _370 = -_100;
    float _372 = _102 * _370;
    float _374 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _362);
    float _376 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _364);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _386 = -_100;
    float _388 = fma(_386, _378, _376);
    float _390 = fma(_100, _378, _376);
    float _392 = _102 * _380;
    float _394 = _350 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _396 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _398 = -_100;
    float _400 = fma(_398, _382, _374);
    float _402 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _392);
    float _404 = exp2(_394);
    float _406 = fma(_100, _382, _374);
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _410 = -_100;
    float _412 = fma(_410, _384, _402);
    float _414 = fma(_100, _384, _402);
    float _416 = -_98;
    float _418 = fma(_416, _396, _388);
    float _420 = fma(_98, _396, _390);
    float _422 = _100 * (-3.0);
    float _424 = -_98;
    float _426 = fma(_424, _408, _400);
    float _428 = fma(_98, _408, _406);
    float _430 = _98 * _100;
    float _432 = -_100;
    float _434 = fma(_432, _422, -1.0);
    float _436 = _102 * _100;
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _440 = -_102;
    float _442 = _98 * _440;
    float _444 = _404 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _446 = _98 * _102;
    float _448 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _450 = -_98;
    float _452 = fma(_450, _438, _412);
    float _454 = fma(_98, _438, _414);
    float _456 = fma(_448, _446, _428);
    float _458 = fma(_448, _442, _426);
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _462 = fma(_368, 0.5, 0.5);
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _466 = fma(_460, _446, _420);
    float _468 = fma(_462, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _472 = fma(_460, _442, _418);
    float _474 = fma(_464, _442, _452);
    float _476 = fma(_464, _446, _454);
    float _478 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _480 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _482 = fma(_462, _468, -0.212114393711090087890625);
    float _484 = fma(_470, _436, _456);
    float _486 = fma(_470, _372, _458);
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _490 = fma(_478, _436, _466);
    float _492 = fma(_480, _436, _476);
    float _494 = fma(_462, _482, 1.570728778839111328125);
    float _496 = fma(_478, _372, _472);
    float _498 = fma(_480, _372, _474);
    float _500 = fma(_488, _430, _486);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _504 = fma(_488, _430, _484);
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _508 = fma(_368, -0.5, 0.5);
    float _510 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _512 = fma(_502, _430, _496);
    float _514 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = fma(_502, _430, _490);
    float _520 = fma(_506, _430, _498);
    float _522 = fma(_506, _430, _492);
    float _524 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _526 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _528 = fma(_510, _434, _500);
    float _530 = sqrt(_508);
    float _532 = -_516;
    float _534 = _532 + 1.0;
    float _536 = fma(_510, _360, _504);
    float _538 = fma(_524, _434, _512);
    float _540 = fma(_524, _360, _518);
    float _542 = fma(_526, _360, _522);
    float _544 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _546 = abs(_534);
    float _548 = log2(_546);
    float _550 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _552 = fma(_526, _434, _520);
    float _554 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _556 = fma(_544, _346, _528);
    float _558 = fma(_550, _346, _538);
    float _560 = fma(_544, _346, _536);
    float _562 = fma(_550, _346, _540);
    float _564 = fma(_554, _346, _552);
    float _566 = fma(_554, _346, _542);
    float _568 = _530 * 0.636619746685028076171875;
    float _570 = in.m_48.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_48.y;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = _202 + 1.0;
    float _584 = -_494;
    float _586 = fma(_568, _584, 1.0);
    float _588 = _548 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _590 = exp2(_588);
    float _592 = -_202;
    float _594 = fma(_590, _582, _592);
    float _596 = fma(_202, -0.5, 0.5);
    float _598 = fma(_594, 0.5, 0.5);
    float _600 = _78 * _574;
    float _602 = _78 * _580;
    float _604 = float(uint(_334));
    float _606 = _604 * 0.00390625;
    float2 _1836 = float2(_326, _328);
    float4 _609 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1836, float2(0.0), isnan(_1836)), level(_606)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1836, float2(0.0), isnan(_1836)), level(_606)).xyzw;
    float _611 = _609.x;
    float _613 = _609.y;
    float _615 = _609.z;
    float _617 = _609.w;
    float2 _1855 = float2(_326, _328);
    float2 _621 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1855, float2(0.0), isnan(_1855)), level(_606)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1855, float2(0.0), isnan(_1855)), level(_606)).xy;
    float _623 = _621.x;
    float _625 = _621.y;
    float2 _1868 = float2(_326, _328);
    float2 _627 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1868, float2(0.0), isnan(_1868)), level(_606)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1868, float2(0.0), isnan(_1868)), level(_606)).xy;
    float _629 = _627.x;
    float _631 = _627.y;
    float2 _1881 = float2(_326, _328);
    float4 _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1881, float2(0.0), isnan(_1881)), level(_606)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1881, float2(0.0), isnan(_1881)), level(_606)).xyzw;
    float _635 = _633.x;
    float _637 = _633.y;
    float _639 = _633.z;
    float _641 = _633.w;
    float2 _1898 = float2(_600, _602);
    float3 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1898, float2(0.0), isnan(_1898))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1898, float2(0.0), isnan(_1898))).xyz;
    float _647 = _645.x;
    float _649 = _645.y;
    float _651 = _645.z;
    float2 _1912 = float2(_326, _328);
    float2 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1912, float2(0.0), isnan(_1912)), level(_606)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1912, float2(0.0), isnan(_1912)), level(_606)).xy;
    float _655 = _653.x;
    float _657 = _653.y;
    float2 _1925 = float2(_326, _328);
    float4 _659 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1925, float2(0.0), isnan(_1925)), level(_606)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1925, float2(0.0), isnan(_1925)), level(_606)).xyzw;
    float _661 = _659.x;
    float _663 = _659.y;
    float _665 = _659.z;
    float _667 = _659.w;
    float2 _1942 = float2(_586, _598);
    float3 _669 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1942, float2(0.0), isnan(_1942))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1942, float2(0.0), isnan(_1942))).xyz;
    float _671 = _669.x;
    float _673 = _669.y;
    float _675 = _669.z;
    float2 _1956 = float2(_586, _596);
    float3 _677 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1956, float2(0.0), isnan(_1956))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1956, float2(0.0), isnan(_1956))).xyz;
    float _679 = _677.x;
    float _681 = _677.y;
    float _683 = _677.z;
    float _685 = _617 * _617;
    float _687 = _685 * _685;
    float _689 = _687 * 16.0;
    float _691 = _625 * _689;
    float _693 = _641 * _641;
    float _695 = _647 * _649;
    float _697 = -_651;
    float _699 = _697 + 1.0;
    float _701 = _611 * _691;
    float _703 = _613 * _691;
    float _705 = _615 * _691;
    float _707 = -_625;
    float _709 = _707 + _631;
    float _711 = _693 * _693;
    float _713 = _667 * _667;
    float _715 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[0].x, _625);
    float _717 = _623 * _625;
    float _719 = _711 * 16.0;
    float _721 = _548 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _723 = precise::max(_715, 1.52587890625e-05);
    float _725 = -_717;
    float _727 = fma(_629, _631, _725);
    float _729 = _631 * _719;
    float _731 = exp2(_721);
    float _733 = fma(_727, (*spvDescriptorSet0.fp_c3)._m0[0].x, _717);
    float _735 = -_701;
    float _737 = fma(_635, _729, _735);
    float _739 = -_703;
    float _741 = fma(_637, _729, _739);
    float _743 = -_705;
    float _745 = fma(_639, _729, _743);
    float _747 = -_715;
    float _749 = _747 + _657;
    float _751 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _753 = 1.0 / _723;
    float _755 = fma(_647, _749, _715);
    float _757 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _703);
    float _759 = _755 * _699;
    float _761 = -_731;
    float _763 = _761 + 1.0;
    float _765 = _715 * _753;
    float _767 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _769 = _767 + 1.0;
    float _771 = precise::max(_755, 1.52587890625e-05);
    float _773 = -_695;
    float _775 = _773 + 1.0;
    float _777 = _757 * _765;
    float _779 = fma(_775, _769, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _781 = 1.0 / _771;
    float _783 = _763 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _785 = fma(_745, (*spvDescriptorSet0.fp_c3)._m0[0].x, _705);
    float _787 = _655 * _779;
    float _789 = _733 * _765;
    float _791 = -_783;
    float _793 = _791 + 1.0;
    float _795 = _751 * _765;
    float _797 = _785 * _765;
    float _799 = -_789;
    float _801 = fma(_657, _787, _799);
    float _803 = abs(_793);
    float _805 = log2(_803);
    float _807 = _783 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _809 = fma(_647, _801, _789);
    float _811 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _813 = _811 + 1.0;
    float _815 = _809 * _781;
    float _817 = fma(_775, _813, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _819 = _815 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _821 = _815 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _823 = _759 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _825 = _819 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _827 = _805 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _829 = -_823;
    float _831 = _829 + 1.0;
    float _833 = _821 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _835 = _562 * _825;
    float _837 = exp2(_827);
    float _839 = _560 * _825;
    float _841 = _566 * _825;
    float _843 = fma(_558, _833, _835);
    float _845 = fma(_556, _833, _839);
    float _847 = fma(_564, _833, _841);
    float _849 = _843 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _851 = abs(_831);
    float _853 = log2(_851);
    float _855 = _845 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _857 = _805 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _859 = _849 * 0.715200006961822509765625;
    float _861 = _847 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _863 = fma(_855, 0.2125999927520751953125, _859);
    float _865 = _713 * _713;
    float _867 = _837 * _781;
    float _869 = _695 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _871 = fma(_861, 0.072200000286102294921875, _863);
    float _873 = _865 * 16.0;
    float _875 = exp2(_857);
    float _877 = _853 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _879 = -_855;
    float _881 = _879 + _871;
    float _883 = _817 * _873;
    float _885 = -_849;
    float _887 = _885 + _871;
    float _889 = -_861;
    float _891 = _889 + _871;
    float _893 = exp2(_877);
    float _895 = fma(_869, _881, _855);
    float _897 = _657 * _883;
    float _899 = _665 * _883;
    float _901 = fma(_869, _887, _849);
    float _903 = fma(_869, _891, _861);
    float _905 = -_795;
    float _907 = fma(_661, _897, _905);
    float _909 = -_777;
    float _911 = fma(_663, _897, _909);
    float _913 = -_797;
    float _915 = fma(_657, _899, _913);
    float _917 = _875 * _901;
    float _919 = fma(_647, _907, _795);
    float _921 = fma(_647, _911, _777);
    float _923 = fma(_647, _915, _797);
    float _925 = _917 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _927 = _875 * _895;
    float _929 = _921 * _867;
    float _931 = -_893;
    float _933 = spvFAdd(_931, 1.00010001659393310546875);
    float _935 = -_893;
    float _937 = _935 + 1.0;
    float _939 = _875 * _903;
    float _941 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[27].y, _925);
    float _943 = _919 * _867;
    float _945 = -_823;
    float _947 = _945 + _937;
    float _949 = 1.0 / _933;
    float _951 = _927 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _953 = _923 * _867;
    float _955 = _947 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _957 = _939 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _959 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[27].x, _951);
    float _961 = fma(_673, _807, _941);
    float _963 = _681 * _955;
    float _965 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[27].z, _957);
    float _967 = fma(_671, _807, _959);
    float _969 = _679 * _955;
    float _971 = fma(_823, _961, _963);
    float _973 = fma(_675, _807, _965);
    float _975 = _683 * _955;
    float _977 = fma(_823, _967, _969);
    float _979 = _949 * _971;
    float _981 = fma(_823, _973, _975);
    float _983 = _949 * _977;
    float _985 = _979 * 0.715200006961822509765625;
    float _987 = _949 * _981;
    float _989 = fma(_983, 0.2125999927520751953125, _985);
    float _991 = fma(_987, 0.072200000286102294921875, _989);
    float _993 = 1.0 / _991;
    float _995 = _993 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _997 = precise::clamp(_995, 0.0, 1.0);
    float _999 = fma(_997, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1001 = _983 * _999;
    float _1003 = _979 * _999;
    float _1005 = _987 * _999;
    out.m_46.x = _1001;
    out.m_46.y = _1003;
    out.m_46.z = _1005;
    out.m_46.w = _937;
    return out;
}

