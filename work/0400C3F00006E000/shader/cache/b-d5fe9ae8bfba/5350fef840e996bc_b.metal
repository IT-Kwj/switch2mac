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
    float4 m_44 [[color(1)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _52(thread const int& _2393, thread const int& _2394, thread const int& _2395, thread const int& _2396, thread int& _2397, thread int& _2398, thread int& _2399, thread int& _2400, thread int& _2401, thread int& _2402)
{
    float _2405 = as_type<float>(_2393) + 0.0;
    bool _2407 = _2405 != 0.0;
    bool _2409 = isnan(_2405);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    int _2417 = as_type<int>(_2405);
    int _2419 = _2395;
    int _2421 = _2415 ? (-1) : 0;
    if (!_2415)
    {
        float _2423 = as_type<float>(_2393) * 1.0;
        _2417 = as_type<int>(_2423);
    }
    int _2425 = _2417;
    bool _2427 = !_2415;
    int _2429 = _2425;
    if (!_2427)
    {
        float _2431 = as_type<float>(_2393) + 0.0;
        bool _2433 = _2431 >= 0.0;
        bool _2435 = isnan(_2431);
        bool _2437 = _2433 || _2435;
        bool _2439 = isnan(0.0);
        bool _2441 = _2437 || _2439;
        int _2443 = as_type<int>(_2431);
        _2421 = _2441 ? (-1) : 0;
        if (!_2441)
        {
            _2443 = 2147483647;
        }
        int _2445 = _2443;
        bool _2447 = !_2441;
        _2429 = _2445;
        if (!_2447)
        {
            float _2449 = abs(as_type<float>(_2393));
            float _2451 = _2449 + 0.0;
            bool _2453 = _2451 > as_type<float>(0x7f800000u /* inf */);
            bool _2455 = isnan(_2451);
            bool _2457 = _2453 || _2455;
            bool _2459 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2461 = _2457 || _2459;
            int _2463 = as_type<int>(_2451);
            _2421 = _2461 ? (-1) : 0;
            if (_2461)
            {
                float _2465 = as_type<float>(_2393) + 1.0;
                _2463 = as_type<int>(_2465);
            }
            int _2467 = _2463;
            _2429 = _2467;
            if (!_2461)
            {
                float _2469 = abs(as_type<float>(_2393));
                float _2471 = _2469 + (-0.0);
                float _2473 = 0.0 + _2471;
                bool _2475 = _2473 != as_type<float>(0x7f800000u /* inf */);
                bool _2477 = isnan(_2473);
                bool _2479 = _2475 || _2477;
                bool _2481 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2483 = _2479 || _2481;
                int _2485 = as_type<int>(_2473);
                _2421 = _2483 ? (-1) : 0;
                if (!_2483)
                {
                    _2485 = _2393;
                }
                int _2487 = _2485;
                bool _2489 = !_2483;
                _2429 = _2487;
                if (!_2489)
                {
                    float _2491 = as_type<float>(_2393) * 18446744073709551616.0;
                    float _2493 = rsqrt(_2491);
                    float _2495 = _2491 * _2493;
                    float _2497 = _2493 * 0.5;
                    float _2499 = -_2495;
                    float _2501 = 0.0 + _2499;
                    float _2503 = fma(_2497, _2501, 0.5);
                    float _2505 = fma(_2495, _2503, _2495);
                    float _2507 = -_2505;
                    float _2509 = 0.0 + _2507;
                    float _2511 = fma(_2505, _2509, _2491);
                    float _2513 = fma(_2497, _2511, _2505);
                    float _2515 = _2513 * 2.3283064365386962890625e-10;
                    _2429 = as_type<int>(_2515);
                    _2419 = as_type<int>(_2505);
                }
            }
        }
    }
    int _2517 = _2429;
    int _2519 = _2419;
    int _2521 = _2421;
    _2397 = _2517;
    _2398 = _2517;
    _2399 = _2396;
    _2400 = 0;
    _2401 = _2519;
    _2402 = _2521;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _250 = false;
    float _56 = gl_FragCoord.w;
    float _58 = in.m_39.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_39.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_39.z;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _78 = precise::max(0.0, _76);
    float _80 = 1.0 / _56;
    float _82 = _80 * _62;
    float _84 = _80 * _68;
    float _86 = _80 * _74;
    float _88 = _82 * _82;
    float _90 = fma(_84, _84, _88);
    float _92 = fma(_86, _86, _90);
    float _94 = rsqrt(_92);
    float _96 = _84 * _94;
    float _98 = _86 * _94;
    float _100 = _82 * _94;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = -_100;
    float _108 = -_78;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _108);
    float _112 = _102 * _102;
    float _114 = _104 * _104;
    float _116 = _112 + _114;
    float _118 = sqrt(_116);
    bool _122 = _118 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _124 = _94;
    float _126 = _78;
    float _128 = _110;
    float _130 = _102;
    float _132 = _104;
    if (!_122)
    {
        _124 = _114;
    }
    float _134 = _124;
    float _136 = _134;
    if (!_122)
    {
        _126 = _112;
    }
    float _138 = _126;
    bool _140 = !_122;
    float _142 = _138;
    if (!_140)
    {
        float _144 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _146 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _148 = _118 + _146;
        float _150 = _110 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _152 = rsqrt(_116);
        float _154 = _148 * _144;
        float _156 = _154 * 0.15915493667125701904296875;
        float _158 = _156 * 6.283185482025146484375;
        float _160 = sin(_158);
        float _162 = _156 * 6.283185482025146484375;
        float _164 = cos(_162);
        float _166 = fma(_160, _150, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _168 = _152 * _166;
        float _170 = _164 + (-1.0);
        float _172 = _102 * _168;
        float _174 = _104 * _168;
        float _176 = _170 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = _174 * _174;
        float _180 = fma(_110, _164, _176);
        float _182 = _172 * _172;
        _128 = _180;
        _142 = _182;
        _136 = _178;
        _130 = _172;
        _132 = _174;
    }
    float _184 = _128;
    float _186 = _142;
    float _188 = _136;
    float _190 = _130;
    float _192 = _132;
    float _194 = fma(_184, _184, _186);
    float _196 = _194 + _188;
    float _198 = rsqrt(_196);
    float _200 = _198 * _184;
    float _202 = _198 * _190;
    float _204 = _198 * _192;
    float _206 = -_200;
    float _208 = precise::max(0.0, _206);
    float _210 = abs(_208);
    float _212 = -_210;
    float _214 = _212 + 1.0;
    float _216 = fma(_208, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _218 = as_type<int>(_214) + (-218103808);
    float _220 = fma(_208, _216, -0.212114393711090087890625);
    bool _222 = uint(_218) >= 1920991232u;
    float _224 = fma(_208, _220, 1.570728778839111328125);
    bool _226 = !_222;
    float _248;
    if (!_226)
    {
        int _228 = as_type<int>(_214);
        int _230 = 0;
        int _232 = 0;
        int _234 = 1136;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        _52(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_236);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_214);
        float _254 = _214 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _214);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    bool _276 = _200 > 0.0;
    float _278 = _98 * _98;
    float _280 = _96 * _96;
    float _282 = _278 + _280;
    if (_276)
    {
        discard_fragment();
    }
    float _284 = rsqrt(_282);
    float _286 = _224 * _274;
    float _288 = _286 * 0.636619746685028076171875;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = -_290;
    float _294 = _292 + 1.0;
    float _296 = sqrt(_294);
    float _298 = _98 * _284;
    float _300 = _96 * _284;
    float _302 = abs(_298);
    float _304 = abs(_300);
    float _306 = precise::max(_302, _304);
    float _308 = precise::max(_306, 9.9999997473787516355514526367188e-05);
    float _310 = -_296;
    float _312 = _310 + 1.0;
    float _314 = 1.0 / _308;
    float _316 = _312 * 0.5;
    float _318 = -_314;
    float _320 = _298 * _318;
    float _322 = _300 * _314;
    float _324 = fma(_320, _316, 0.5);
    float _326 = fma(_322, _316, 0.5);
    if (_276)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        out.m_44.x = 0.0;
        out.m_44.y = 0.0;
        out.m_44.z = 0.0;
        out.m_44.w = 0.0;
        return out;
    }
    float2 _1344;
    _1344.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    _1344.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    float _328 = _1344.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = -_100;
    float _336 = _334 + 1.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = -_100;
    float _342 = _96 * _340;
    float _344 = abs(_338);
    float _346 = log2(_344);
    float _348 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _352 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _354 = _100 * _348;
    float _356 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _358 = _100 * _352;
    float _360 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _354);
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _364 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _358);
    float _366 = -_98;
    float _368 = fma(_366, _356, _360);
    float _370 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _372 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _374 = _346 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _376 = _100 * _350;
    float _378 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _376);
    float _380 = exp2(_374);
    float _382 = fma(_98, _356, _360);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _386 = -_98;
    float _388 = fma(_386, _362, _378);
    float _390 = fma(_98, _362, _378);
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _394 = -_98;
    float _396 = fma(_394, _384, _364);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _400 = fma(_98, _384, _364);
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _404 = -_96;
    float _406 = fma(_404, _392, _368);
    float _408 = fma(_96, _392, _382);
    float _410 = -_96;
    float _412 = fma(_410, _398, _388);
    float _414 = fma(_96, _398, _390);
    float _416 = -_96;
    float _418 = fma(_416, _402, _396);
    float _420 = _202 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _422 = _380 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _424 = _96 * _100;
    float _426 = fma(_370, _342, _406);
    float _428 = -_420;
    float _430 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[11].y, _428);
    float _432 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = fma(_370, _424, _408);
    float _438 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _440 = -_204;
    float _442 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[11].z, _430);
    float _444 = -_434;
    float _446 = _444 + 1.0;
    float _448 = fma(_96, _402, _400);
    float _450 = fma(_438, _342, _412);
    float _452 = in.m_46.x;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_46.y;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = fma(_438, _424, _414);
    float _466 = abs(_446);
    float _468 = log2(_466);
    float _470 = fma(_442, -0.5, 0.5);
    float _472 = fma(_442, 0.5, 0.5);
    float _474 = fma(_372, _342, _418);
    float _476 = fma(_372, _424, _448);
    float _478 = -_98;
    float _480 = _100 * _478;
    float _482 = fma(_472, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _484 = sqrt(_470);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _488 = _200 + 1.0;
    float _490 = fma(_472, _482, -0.212114393711090087890625);
    float _492 = _100 * _98;
    float _494 = fma(_486, _480, _426);
    float _496 = fma(_472, _490, 1.570728778839111328125);
    float _498 = _468 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _500 = fma(_486, _492, _436);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _506 = exp2(_498);
    float _508 = fma(_502, _492, _464);
    float _510 = fma(_504, _492, _476);
    float _512 = fma(_502, _480, _450);
    float _514 = _484 * 0.636619746685028076171875;
    float _516 = fma(_504, _480, _474);
    float _518 = -_496;
    float _520 = fma(_514, _518, 1.0);
    float _522 = _80 * _462;
    float _524 = -_200;
    float _526 = fma(_506, _488, _524);
    float _528 = fma(_526, 0.5, 0.5);
    float _530 = _80 * _456;
    float _532 = float(uint(_332));
    float _534 = _532 * 0.00390625;
    float2 _1673 = float2(_324, _326);
    float2 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1673, float2(0.0), isnan(_1673)), level(_534)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1673, float2(0.0), isnan(_1673)), level(_534)).xy;
    float _540 = _538.x;
    float _542 = _538.y;
    float2 _1688 = float2(_324, _326);
    float2 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1688, float2(0.0), isnan(_1688)), level(_534)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1688, float2(0.0), isnan(_1688)), level(_534)).xy;
    float _546 = _544.x;
    float _548 = _544.y;
    float2 _1701 = float2(_530, _522);
    float3 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1701, float2(0.0), isnan(_1701))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1701, float2(0.0), isnan(_1701))).xyz;
    float _554 = _552.x;
    float _556 = _552.y;
    float _558 = _552.z;
    float2 _1715 = float2(_324, _326);
    float4 _561 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1715, float2(0.0), isnan(_1715)), level(_534)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1715, float2(0.0), isnan(_1715)), level(_534)).xyzw;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float _569 = _561.w;
    float2 _1732 = float2(_324, _326);
    float4 _571 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1732, float2(0.0), isnan(_1732)), level(_534)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1732, float2(0.0), isnan(_1732)), level(_534)).xyzw;
    float _573 = _571.x;
    float _575 = _571.y;
    float _577 = _571.z;
    float _579 = _571.w;
    float2 _1749 = float2(_520, _528);
    float3 _581 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1749, float2(0.0), isnan(_1749))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1749, float2(0.0), isnan(_1749))).xyz;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _581.z;
    float _589 = _96 * _98;
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _593 = fma(_591, _589, _494);
    float _595 = fma(_591, _589, _500);
    float _597 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _599 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _601 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _603 = _200 * _601;
    float _605 = _200 * (-10000.0);
    float _607 = fma(_599, _589, _516);
    float _609 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _603);
    float _611 = _98 * (-3.0);
    float _613 = fma(_278, 3.0, -1.0);
    float _615 = abs(_605);
    bool _617 = _615 > 0.00999999977648258209228515625;
    float _619 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].z, _609);
    float _621 = -_98;
    float _623 = fma(_621, _611, -1.0);
    float _625 = fma(_599, _589, _510);
    float _627 = fma(_597, _589, _512);
    float _629 = fma(_597, _589, _508);
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _635 = fma(_631, _623, _593);
    float _637 = fma(_631, _613, _595);
    float _639 = _617 ? _605 : 0.00999999977648258209228515625;
    float _641 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _643 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _645 = fma(_633, _623, _607);
    float _647 = fma(_633, _613, _625);
    float _649 = _639 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _651 = fma(_641, _623, _627);
    float _653 = fma(_641, _613, _629);
    float _655 = -_643;
    float _657 = exp2(_655);
    float _659 = precise::max(_649, -127.0);
    float _661 = -_659;
    float _663 = exp2(_661);
    float _665 = fma(_619, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _667 = fma(_665, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _669 = 1.0 / _659;
    float _671 = abs(_667);
    float _673 = log2(_671);
    float _675 = -_663;
    float _677 = _675 + 1.0;
    float _679 = _657 * _677;
    float _681 = -_100;
    float _683 = fma(_681, _100, _280);
    float _685 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _687 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _689 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _691 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _693 = _691 + 1.0;
    float _695 = fma(_685, _683, _635);
    float _697 = fma(_685, _683, _637);
    float _699 = fma(_689, _683, _645);
    float _701 = fma(_689, _683, _647);
    float _703 = _468 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _705 = _673 * 1.5;
    float _707 = fma(_687, _683, _651);
    float _709 = fma(_687, _683, _653);
    float _711 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _713 = fma(_711, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _715 = _679 * _669;
    float _717 = exp2(_703);
    float _719 = exp2(_705);
    float _721 = -_717;
    float _723 = _721 + 1.0;
    float _725 = -_542;
    float _727 = _725 + _548;
    float _729 = _554 * _556;
    float _731 = _569 * _569;
    float _733 = fma(_554, _727, _542);
    float _735 = -_729;
    float _737 = _735 + 1.0;
    float _739 = _731 * _731;
    float _741 = _729 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _743 = precise::max(_733, 1.52587890625e-05);
    float _745 = fma(_737, _693, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _747 = _719 * 12.56637096405029296875;
    float _749 = _546 * _745;
    float _751 = 1.0 / _743;
    float _753 = _540 * _542;
    float _755 = -_753;
    float _757 = fma(_548, _749, _755);
    float _759 = _723 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _761 = 1.0 / _747;
    float _763 = fma(_554, _757, _753);
    float _765 = -_759;
    float _767 = _765 + 1.0;
    float _769 = abs(_767);
    float _771 = log2(_769);
    float _773 = _763 * _751;
    float _775 = _739 * 16.0;
    float _777 = _773 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _779 = _773 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _781 = _542 * _775;
    float _783 = _713 * _761;
    float _785 = _777 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _787 = _779 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _789 = _563 * _781;
    float _791 = _565 * _781;
    float _793 = _709 * _785;
    float _795 = _697 * _785;
    float _797 = _701 * _785;
    float _799 = _771 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _801 = fma(_707, _787, _793);
    float _803 = _567 * _781;
    float _805 = fma(_695, _787, _795);
    float _807 = _801 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _809 = exp2(_799);
    float _811 = _579 * _579;
    float _813 = _771 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _815 = fma(_699, _787, _797);
    float _817 = _805 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _819 = _807 * 0.715200006961822509765625;
    float _821 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _823 = _821 + 1.0;
    float _825 = _811 * _811;
    float _827 = _815 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _829 = fma(_817, 0.2125999927520751953125, _819);
    float _831 = fma(_737, _823, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _833 = _825 * 16.0;
    float _835 = exp2(_813);
    float _837 = fma(_827, 0.072200000286102294921875, _829);
    float _839 = _831 * _833;
    float _841 = _809 * _751;
    float _843 = -_807;
    float _845 = _843 + _837;
    float _847 = -_817;
    float _849 = _847 + _837;
    float _851 = _548 * _839;
    float _853 = _577 * _839;
    float _855 = fma(_741, _845, _807);
    float _857 = fma(_741, _849, _817);
    float _859 = -_791;
    float _861 = fma(_575, _851, _859);
    float _863 = -_789;
    float _865 = fma(_573, _851, _863);
    float _867 = -_803;
    float _869 = fma(_548, _853, _867);
    float _871 = -_827;
    float _873 = _871 + _837;
    float _875 = fma(_554, _861, _791);
    float _877 = _835 * _855;
    float _879 = fma(_554, _865, _789);
    float _881 = fma(_554, _869, _803);
    float _883 = _875 * _841;
    float _885 = _877 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _887 = _835 * _857;
    float _889 = fma(_741, _873, _827);
    float _891 = _879 * _841;
    float _893 = fma(_883, (*spvDescriptorSet0.fp_c3)._m0[27].y, _885);
    float _895 = _887 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _897 = _835 * _889;
    float _899 = _759 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _901 = _881 * _841;
    float _903 = fma(_891, (*spvDescriptorSet0.fp_c3)._m0[27].x, _895);
    float _905 = _897 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _907 = fma(_585, _899, _893);
    float _909 = fma(_583, _899, _903);
    float _911 = fma(_901, (*spvDescriptorSet0.fp_c3)._m0[27].z, _905);
    float _913 = _907 * 0.715200006961822509765625;
    float _915 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _917 = fma(_587, _899, _911);
    float _919 = fma(_909, 0.2125999927520751953125, _913);
    float _921 = _715 * _915;
    float _923 = fma(_917, 0.072200000286102294921875, _919);
    float _925 = -_921;
    float _927 = exp2(_925);
    float _929 = 1.0 / _923;
    float _931 = -_927;
    float _933 = _931 + 1.0;
    float _935 = _783 * _933;
    float _937 = -_558;
    float _939 = _937 + 1.0;
    float _941 = _929 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _943 = precise::clamp(_941, 0.0, 1.0);
    float _945 = _733 * _939;
    float _947 = _935 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _949 = _935 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _951 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _953 = _935 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _955 = _945 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _957 = _927 * _951;
    float _959 = fma(_909, _957, _953);
    float _961 = fma(_907, _957, _947);
    float _963 = fma(_917, _957, _949);
    out.m_42.x = _959;
    out.m_42.y = _961;
    out.m_42.z = _963;
    out.m_42.w = _955;
    out.m_44.x = _959;
    out.m_44.y = _961;
    out.m_44.z = _963;
    out.m_44.w = _955;
    return out;
}

