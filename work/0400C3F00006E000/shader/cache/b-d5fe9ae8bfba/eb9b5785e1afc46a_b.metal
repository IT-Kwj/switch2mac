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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
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
void _50(thread const int& _2464, thread const int& _2465, thread const int& _2466, thread const int& _2467, thread int& _2468, thread int& _2469, thread int& _2470, thread int& _2471, thread int& _2472)
{
    float _2475 = as_type<float>(_2465) + 0.0;
    bool _2477 = _2475 != 0.0;
    bool _2479 = isnan(_2475);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(0.0);
    bool _2485 = _2481 || _2483;
    int _2487 = as_type<int>(_2475);
    int _2489 = _2466;
    int _2491 = _2485 ? (-1) : 0;
    if (!_2485)
    {
        float _2493 = as_type<float>(_2465) * 1.0;
        _2487 = as_type<int>(_2493);
    }
    int _2495 = _2487;
    bool _2497 = !_2485;
    int _2499 = _2495;
    if (!_2497)
    {
        float _2501 = as_type<float>(_2465) + 0.0;
        bool _2503 = _2501 >= 0.0;
        bool _2505 = isnan(_2501);
        bool _2507 = _2503 || _2505;
        bool _2509 = isnan(0.0);
        bool _2511 = _2507 || _2509;
        int _2513 = as_type<int>(_2501);
        _2491 = _2511 ? (-1) : 0;
        if (!_2511)
        {
            _2513 = 2147483647;
        }
        int _2515 = _2513;
        bool _2517 = !_2511;
        _2499 = _2515;
        if (!_2517)
        {
            float _2519 = abs(as_type<float>(_2465));
            float _2521 = _2519 + 0.0;
            bool _2523 = _2521 > as_type<float>(0x7f800000u /* inf */);
            bool _2525 = isnan(_2521);
            bool _2527 = _2523 || _2525;
            bool _2529 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2531 = _2527 || _2529;
            int _2533 = as_type<int>(_2521);
            _2491 = _2531 ? (-1) : 0;
            if (_2531)
            {
                float _2535 = as_type<float>(_2465) + 1.0;
                _2533 = as_type<int>(_2535);
            }
            int _2537 = _2533;
            _2499 = _2537;
            if (!_2531)
            {
                float _2539 = abs(as_type<float>(_2465));
                float _2541 = _2539 + (-0.0);
                float _2543 = 0.0 + _2541;
                bool _2545 = _2543 != as_type<float>(0x7f800000u /* inf */);
                bool _2547 = isnan(_2543);
                bool _2549 = _2545 || _2547;
                bool _2551 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2553 = _2549 || _2551;
                int _2555 = as_type<int>(_2543);
                _2491 = _2553 ? (-1) : 0;
                if (!_2553)
                {
                    _2555 = _2465;
                }
                int _2557 = _2555;
                bool _2559 = !_2553;
                _2499 = _2557;
                if (!_2559)
                {
                    float _2561 = as_type<float>(_2465) * 18446744073709551616.0;
                    float _2563 = rsqrt(_2561);
                    float _2565 = _2561 * _2563;
                    float _2567 = _2563 * 0.5;
                    float _2569 = -_2565;
                    float _2571 = 0.0 + _2569;
                    float _2573 = fma(_2567, _2571, 0.5);
                    float _2575 = fma(_2565, _2573, _2565);
                    float _2577 = -_2575;
                    float _2579 = 0.0 + _2577;
                    float _2581 = fma(_2575, _2579, _2561);
                    float _2583 = fma(_2567, _2581, _2575);
                    float _2585 = _2583 * 2.3283064365386962890625e-10;
                    _2499 = as_type<int>(_2585);
                    _2489 = as_type<int>(_2575);
                }
            }
        }
    }
    int _2587 = _2499;
    int _2589 = _2489;
    int _2591 = _2491;
    _2468 = _2587;
    _2469 = _2467;
    _2470 = 0;
    _2471 = _2589;
    _2472 = _2591;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _246 = false;
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
    float _244;
    if (!_224)
    {
        int _226 = 0;
        int _228 = as_type<int>(_212);
        int _230 = 0;
        int _232 = 1104;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        _50(_226, _228, _230, _232, _234, _236, _238, _240, _242);
        _244 = as_type<float>(_234);
        _246 = true;
    }
    else
    {
        float _248 = rsqrt(_212);
        float _250 = _212 * _248;
        float _252 = _248 * 0.5;
        float _254 = -_250;
        float _256 = 0.0 + _254;
        float _258 = fma(_252, _256, 0.5);
        float _260 = fma(_250, _258, _250);
        float _262 = -_260;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, _212);
        float _268 = fma(_252, _266, _260);
        _244 = _268;
    }
    _246 = false;
    float _270 = _244;
    bool _272 = _198 > 0.0;
    float _274 = _96 * _96;
    float _276 = _94 * _94;
    float _278 = _274 + _276;
    if (_272)
    {
        discard_fragment();
    }
    float _280 = rsqrt(_278);
    float _282 = _222 * _270;
    float _284 = _282 * 0.636619746685028076171875;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = -_286;
    float _290 = _288 + 1.0;
    float _292 = sqrt(_290);
    float _294 = _96 * _280;
    float _296 = _94 * _280;
    float _298 = abs(_294);
    float _300 = abs(_296);
    float _302 = precise::max(_298, _300);
    float _304 = precise::max(_302, 9.9999997473787516355514526367188e-05);
    float _306 = -_292;
    float _308 = _306 + 1.0;
    float _310 = 1.0 / _304;
    float _312 = _308 * 0.5;
    float _314 = -_310;
    float _316 = _294 * _314;
    float _318 = _296 * _310;
    float _320 = fma(_316, _312, 0.5);
    float _322 = fma(_318, _312, 0.5);
    if (_272)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float2 _1370;
    _1370.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _1370.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _324 = _1370.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = -_98;
    float _332 = _330 + 1.0;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _94 * _98;
    float _338 = _94 * _96;
    float _340 = abs(_334);
    float _342 = log2(_340);
    float _344 = fma(_274, 3.0, -1.0);
    float _346 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _348 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _352 = _98 * _346;
    float _354 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _356 = _98 * _348;
    float _358 = _98 * _350;
    float _360 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _362 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _356);
    float _364 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _358);
    float _366 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _352);
    float _368 = _342 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _370 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _372 = -_96;
    float _374 = fma(_372, _354, _362);
    float _376 = fma(_96, _354, _362);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _380 = -_96;
    float _382 = fma(_380, _370, _364);
    float _384 = exp2(_368);
    float _386 = fma(_96, _370, _364);
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _390 = -_96;
    float _392 = fma(_390, _378, _366);
    float _394 = fma(_96, _378, _366);
    float _396 = -_94;
    float _398 = fma(_396, _360, _382);
    float _400 = fma(_94, _388, _376);
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _404 = _200 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _406 = -_94;
    float _408 = fma(_406, _388, _374);
    float _410 = -_94;
    float _412 = fma(_410, _402, _392);
    float _414 = fma(_94, _402, _394);
    float _416 = -_404;
    float _418 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[11].y, _416);
    float _420 = fma(_94, _360, _386);
    float _422 = _384 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _424 = -_202;
    float _426 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[11].z, _418);
    float _428 = -_98;
    float _430 = _94 * _428;
    float _432 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _438 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _440 = fma(_426, 0.5, 0.5);
    float _442 = -_434;
    float _444 = _442 + 1.0;
    float _446 = fma(_436, _430, _408);
    float _448 = fma(_436, _336, _400);
    float _450 = fma(_438, _430, _398);
    float _452 = fma(_438, _336, _420);
    float _454 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _456 = fma(_426, -0.5, 0.5);
    float _458 = abs(_444);
    float _460 = log2(_458);
    float _462 = _96 * (-3.0);
    float _464 = fma(_440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _466 = fma(_454, _430, _412);
    float _468 = fma(_454, _336, _414);
    float _470 = -_96;
    float _472 = fma(_470, _462, -1.0);
    float _474 = fma(_440, _464, -0.212114393711090087890625);
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _478 = _98 * _96;
    float _480 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _482 = fma(_440, _474, 1.570728778839111328125);
    float _484 = -_96;
    float _486 = _98 * _484;
    float _488 = fma(_476, _478, _448);
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _492 = sqrt(_456);
    float _494 = fma(_480, _478, _452);
    float _496 = fma(_476, _486, _446);
    float _498 = fma(_490, _486, _466);
    float _500 = fma(_490, _478, _468);
    float _502 = _460 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _504 = in.m_44.x;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = in.m_44.y;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = fma(_480, _486, _450);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _522 = exp2(_502);
    float _524 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _526 = fma(_518, _338, _496);
    float _528 = fma(_518, _338, _488);
    float _530 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _532 = _492 * 0.636619746685028076171875;
    float _534 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _536 = fma(_530, _472, _526);
    float _538 = -_482;
    float _540 = fma(_532, _538, 1.0);
    float _542 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _544 = _198 + 1.0;
    float _546 = fma(_530, _344, _528);
    float _548 = fma(_542, _338, _516);
    float _550 = fma(_542, _338, _494);
    float _552 = -_198;
    float _554 = fma(_522, _544, _552);
    float _556 = fma(_520, _338, _498);
    float _558 = fma(_524, _472, _548);
    float _560 = fma(_524, _344, _550);
    float _562 = fma(_554, 0.5, 0.5);
    float _564 = fma(_534, _472, _556);
    float _566 = fma(_520, _338, _500);
    float _568 = _74 * _508;
    float _570 = _74 * _514;
    float _572 = fma(_198, -0.5, 0.5);
    float _574 = float(uint(_328));
    float _576 = _574 * 0.00390625;
    float2 _1779 = float2(_320, _322);
    float2 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1779, float2(0.0), isnan(_1779)), level(_576)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1779, float2(0.0), isnan(_1779)), level(_576)).xy;
    float _582 = _580.x;
    float _584 = _580.y;
    float2 _1794 = float2(_320, _322);
    float2 _586 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1794, float2(0.0), isnan(_1794)), level(_576)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1794, float2(0.0), isnan(_1794)), level(_576)).xy;
    float _588 = _586.x;
    float _590 = _586.y;
    float2 _1807 = float2(_568, _570);
    float3 _594 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1807, float2(0.0), isnan(_1807))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1807, float2(0.0), isnan(_1807))).xyz;
    float _596 = _594.x;
    float _598 = _594.y;
    float _600 = _594.z;
    float2 _1821 = float2(_320, _322);
    float4 _603 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1821, float2(0.0), isnan(_1821)), level(_576)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1821, float2(0.0), isnan(_1821)), level(_576)).xyzw;
    float _605 = _603.x;
    float _607 = _603.y;
    float _609 = _603.z;
    float _611 = _603.w;
    float2 _1838 = float2(_320, _322);
    float4 _613 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1838, float2(0.0), isnan(_1838)), level(_576)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1838, float2(0.0), isnan(_1838)), level(_576)).xyzw;
    float _615 = _613.x;
    float _617 = _613.y;
    float _619 = _613.z;
    float _621 = _613.w;
    float2 _1855 = float2(_540, _562);
    float3 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1855, float2(0.0), isnan(_1855))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1855, float2(0.0), isnan(_1855))).xyz;
    float _625 = _623.x;
    float _627 = _623.y;
    float _629 = _623.z;
    float2 _1869 = float2(_540, _572);
    float3 _631 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1869, float2(0.0), isnan(_1869))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1869, float2(0.0), isnan(_1869))).xyz;
    float _633 = _631.x;
    float _635 = _631.y;
    float _637 = _631.z;
    float _639 = fma(_534, _344, _566);
    float _641 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _643 = _198 * _641;
    float _645 = -_98;
    float _647 = fma(_645, _98, _276);
    float _649 = _198 * (-10000.0);
    float _651 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].x, _643);
    float _653 = abs(_649);
    bool _655 = _653 > 0.00999999977648258209228515625;
    float _657 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].z, _651);
    float _659 = _655 ? _649 : 0.00999999977648258209228515625;
    float _661 = fma(_657, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _663 = _659 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _665 = fma(_661, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _667 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _669 = fma(_667, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _671 = abs(_665);
    float _673 = log2(_671);
    float _675 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _677 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _679 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _681 = fma(_677, _647, _558);
    float _683 = fma(_677, _647, _560);
    float _685 = -_675;
    float _687 = exp2(_685);
    float _689 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _691 = fma(_679, _647, _536);
    float _693 = fma(_679, _647, _546);
    float _695 = fma(_689, _647, _564);
    float _697 = fma(_689, _647, _639);
    float _699 = _673 * 1.5;
    float _701 = _460 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _703 = precise::max(_663, -127.0);
    float _705 = exp2(_699);
    float _707 = -_703;
    float _709 = exp2(_707);
    float _711 = 1.0 / _703;
    float _713 = _705 * 12.56637096405029296875;
    float _715 = exp2(_701);
    float _717 = -_709;
    float _719 = _717 + 1.0;
    float _721 = _687 * _719;
    float _723 = 1.0 / _713;
    float _725 = _721 * _711;
    float _727 = -_715;
    float _729 = _727 + 1.0;
    float _731 = _729 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _733 = -_731;
    float _735 = _733 + 1.0;
    float _737 = _731 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _739 = abs(_735);
    float _741 = log2(_739);
    float _743 = -_584;
    float _745 = _743 + _590;
    float _747 = -_600;
    float _749 = _747 + 1.0;
    float _751 = _611 * _611;
    float _753 = fma(_745, (*spvDescriptorSet0.fp_c3)._m0[0].x, _584);
    float _755 = _669 * _723;
    float _757 = _582 * _584;
    float _759 = _751 * _751;
    float _761 = precise::max(_753, 1.52587890625e-05);
    float _763 = -_757;
    float _765 = fma(_588, _590, _763);
    float _767 = _759 * 16.0;
    float _769 = _741 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _771 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _757);
    float _773 = 1.0 / _761;
    float _775 = _584 * _767;
    float _777 = _753 * _749;
    float _779 = _607 * _775;
    float _781 = _609 * _775;
    float _783 = _777 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _785 = _605 * _775;
    float _787 = exp2(_769);
    float _789 = _771 * _773;
    float _791 = _789 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _793 = _789 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _795 = _791 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _797 = _621 * _621;
    float _799 = -_783;
    float _801 = _799 + 1.0;
    float _803 = _793 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _805 = _683 * _795;
    float _807 = _693 * _795;
    float _809 = _697 * _795;
    float _811 = _797 * _797;
    float _813 = abs(_801);
    float _815 = log2(_813);
    float _817 = fma(_681, _803, _805);
    float _819 = fma(_691, _803, _807);
    float _821 = fma(_695, _803, _809);
    float _823 = _811 * 16.0;
    float _825 = _817 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _827 = _787 * _773;
    float _829 = _741 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _831 = _590 * _823;
    float _833 = _819 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _835 = _825 * 0.715200006961822509765625;
    float _837 = _596 * _598;
    float _839 = _821 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _841 = exp2(_829);
    float _843 = fma(_833, 0.2125999927520751953125, _835);
    float _845 = _837 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _847 = _815 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _849 = -_779;
    float _851 = fma(_617, _831, _849);
    float _853 = fma(_839, 0.072200000286102294921875, _843);
    float _855 = -_785;
    float _857 = fma(_615, _831, _855);
    float _859 = -_781;
    float _861 = fma(_619, _831, _859);
    float _863 = exp2(_847);
    float _865 = -_825;
    float _867 = _865 + _853;
    float _869 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[0].x, _779);
    float _871 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[0].x, _785);
    float _873 = fma(_861, (*spvDescriptorSet0.fp_c3)._m0[0].x, _781);
    float _875 = fma(_845, _867, _825);
    float _877 = -_833;
    float _879 = _877 + _853;
    float _881 = -_839;
    float _883 = _881 + _853;
    float _885 = _869 * _827;
    float _887 = _841 * _875;
    float _889 = fma(_845, _879, _833);
    float _891 = fma(_845, _883, _839);
    float _893 = _871 * _827;
    float _895 = _887 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _897 = _841 * _889;
    float _899 = _841 * _891;
    float _901 = -_863;
    float _903 = spvFAdd(_901, 1.00010001659393310546875);
    float _905 = -_863;
    float _907 = _905 + 1.0;
    float _909 = _897 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _911 = fma(_885, (*spvDescriptorSet0.fp_c3)._m0[27].y, _895);
    float _913 = _873 * _827;
    float _915 = -_783;
    float _917 = _915 + _907;
    float _919 = 1.0 / _903;
    float _921 = _899 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _923 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[27].x, _909);
    float _925 = _917 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _927 = fma(_627, _737, _911);
    float _929 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[27].z, _921);
    float _931 = fma(_625, _737, _923);
    float _933 = _635 * _925;
    float _935 = _633 * _925;
    float _937 = fma(_629, _737, _929);
    float _939 = _637 * _925;
    float _941 = fma(_783, _927, _933);
    float _943 = fma(_783, _931, _935);
    float _945 = fma(_783, _937, _939);
    float _947 = _919 * _941;
    float _949 = _919 * _943;
    float _951 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _953 = _919 * _945;
    float _955 = _947 * 0.715200006961822509765625;
    float _957 = _725 * _951;
    float _959 = fma(_949, 0.2125999927520751953125, _955);
    float _961 = fma(_953, 0.072200000286102294921875, _959);
    float _963 = -_957;
    float _965 = exp2(_963);
    float _967 = 1.0 / _961;
    float _969 = -_965;
    float _971 = _969 + 1.0;
    float _973 = _755 * _971;
    float _975 = _967 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _977 = precise::clamp(_975, 0.0, 1.0);
    float _979 = fma(_977, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _981 = _973 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _983 = _973 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _985 = _973 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _987 = _965 * _979;
    float _989 = fma(_949, _987, _981);
    float _991 = fma(_947, _987, _983);
    float _993 = fma(_953, _987, _985);
    out.m_42.x = _989;
    out.m_42.y = _991;
    out.m_42.z = _993;
    out.m_42.w = _907;
    return out;
}

