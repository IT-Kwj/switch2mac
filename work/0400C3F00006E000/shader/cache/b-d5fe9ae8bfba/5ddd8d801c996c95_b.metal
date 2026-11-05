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
    texture2d<float> fp_t_tcb_18 [[id(5)]];
    sampler fp_t_tcb_18Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_14 [[id(11)]];
    sampler fp_t_tcb_14Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texture2d<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_16 [[id(17)]];
    sampler fp_t_tcb_16Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_ASmplr_w [[id(22)]];
    sampler fp_t_tcb_18Smplr_w [[id(23)]];
    sampler fp_t_tcb_10Smplr_w [[id(24)]];
    sampler fp_t_tcb_12Smplr_w [[id(25)]];
    sampler fp_t_tcb_14Smplr_w [[id(26)]];
    sampler fp_t_tcb_ESmplr_w [[id(27)]];
    sampler fp_t_tcb_CSmplr_w [[id(28)]];
    sampler fp_t_tcb_16Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
    float4 m_52 [[color(1)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _60(thread const int& _2437, thread const int& _2438, thread int& _2439, thread int& _2440, thread int& _2441, thread int& _2442, thread int& _2443)
{
    float _2446 = as_type<float>(_2437) + 0.0;
    bool _2448 = _2446 != 0.0;
    bool _2450 = isnan(_2446);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan(0.0);
    bool _2456 = _2452 || _2454;
    int _2458 = as_type<int>(_2446);
    int _2460 = _2438;
    int _2462 = _2456 ? (-1) : 0;
    if (!_2456)
    {
        float _2464 = as_type<float>(_2437) * 1.0;
        _2458 = as_type<int>(_2464);
    }
    int _2466 = _2458;
    bool _2468 = !_2456;
    int _2470 = _2466;
    if (!_2468)
    {
        float _2472 = as_type<float>(_2437) + 0.0;
        bool _2474 = _2472 >= 0.0;
        bool _2476 = isnan(_2472);
        bool _2478 = _2474 || _2476;
        bool _2480 = isnan(0.0);
        bool _2482 = _2478 || _2480;
        int _2484 = as_type<int>(_2472);
        _2462 = _2482 ? (-1) : 0;
        if (!_2482)
        {
            _2484 = 2147483647;
        }
        int _2486 = _2484;
        bool _2488 = !_2482;
        _2470 = _2486;
        if (!_2488)
        {
            float _2490 = abs(as_type<float>(_2437));
            float _2492 = _2490 + 0.0;
            bool _2494 = _2492 > as_type<float>(0x7f800000u /* inf */);
            bool _2496 = isnan(_2492);
            bool _2498 = _2494 || _2496;
            bool _2500 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2502 = _2498 || _2500;
            int _2504 = as_type<int>(_2492);
            _2462 = _2502 ? (-1) : 0;
            if (_2502)
            {
                float _2506 = as_type<float>(_2437) + 1.0;
                _2504 = as_type<int>(_2506);
            }
            int _2508 = _2504;
            _2470 = _2508;
            if (!_2502)
            {
                float _2510 = abs(as_type<float>(_2437));
                float _2512 = _2510 + (-0.0);
                float _2514 = 0.0 + _2512;
                bool _2516 = _2514 != as_type<float>(0x7f800000u /* inf */);
                bool _2518 = isnan(_2514);
                bool _2520 = _2516 || _2518;
                bool _2522 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2524 = _2520 || _2522;
                int _2526 = as_type<int>(_2514);
                _2462 = _2524 ? (-1) : 0;
                if (!_2524)
                {
                    _2526 = _2437;
                }
                int _2528 = _2526;
                bool _2530 = !_2524;
                _2470 = _2528;
                if (!_2530)
                {
                    float _2532 = as_type<float>(_2437) * 18446744073709551616.0;
                    float _2534 = rsqrt(_2532);
                    float _2536 = _2532 * _2534;
                    float _2538 = _2534 * 0.5;
                    float _2540 = -_2536;
                    float _2542 = 0.0 + _2540;
                    float _2544 = fma(_2538, _2542, 0.5);
                    float _2546 = fma(_2536, _2544, _2536);
                    float _2548 = -_2546;
                    float _2550 = 0.0 + _2548;
                    float _2552 = fma(_2546, _2550, _2532);
                    float _2554 = fma(_2538, _2552, _2546);
                    float _2556 = _2554 * 2.3283064365386962890625e-10;
                    _2470 = as_type<int>(_2556);
                    _2460 = as_type<int>(_2552);
                }
            }
        }
    }
    int _2558 = _2470;
    int _2560 = _2460;
    int _2562 = _2462;
    _2439 = _2558;
    _2440 = _2558;
    _2441 = _2560;
    _2442 = 0;
    _2443 = _2562;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _252 = false;
    float _64 = gl_FragCoord.w;
    float _66 = in.m_47.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_47.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_47.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _64;
    float _86 = _84 * _70;
    float _88 = _84 * _76;
    float _90 = _84 * _82;
    float _92 = _86 * _86;
    float _94 = fma(_88, _88, _92);
    float _96 = fma(_90, _90, _94);
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _100 = rsqrt(_96);
    float _102 = precise::max(0.0, _98);
    float _104 = _88 * _100;
    float _106 = _90 * _100;
    float _108 = _86 * _100;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _112 = _106 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _114 = -_108;
    float _116 = -_102;
    float _118 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[13].z, _116);
    float _120 = _110 * _110;
    float _122 = _112 * _112;
    float _124 = _120 + _122;
    float _126 = sqrt(_124);
    bool _130 = _126 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _132 = _100;
    float _134 = _98;
    float _136 = _118;
    float _138 = _110;
    float _140 = _112;
    if (!_130)
    {
        _132 = _122;
    }
    float _142 = _132;
    float _144 = _142;
    if (!_130)
    {
        _134 = _120;
    }
    float _146 = _134;
    bool _148 = !_130;
    float _150 = _146;
    if (!_148)
    {
        float _152 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _154 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _156 = _126 + _154;
        float _158 = _118 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _160 = rsqrt(_124);
        float _162 = _156 * _152;
        float _164 = _162 * 0.15915493667125701904296875;
        float _166 = _164 * 6.283185482025146484375;
        float _168 = sin(_166);
        float _170 = _164 * 6.283185482025146484375;
        float _172 = cos(_170);
        float _174 = fma(_168, _158, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _176 = _160 * _174;
        float _178 = _172 + (-1.0);
        float _180 = _110 * _176;
        float _182 = _112 * _176;
        float _184 = _178 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _186 = _182 * _182;
        float _188 = fma(_118, _172, _184);
        float _190 = _180 * _180;
        _136 = _188;
        _150 = _190;
        _144 = _186;
        _138 = _180;
        _140 = _182;
    }
    float _192 = _136;
    float _194 = _150;
    float _196 = _144;
    float _198 = _138;
    float _200 = _140;
    float _202 = fma(_192, _192, _194);
    float _204 = _202 + _196;
    float _206 = rsqrt(_204);
    float _208 = _206 * _192;
    float _210 = _206 * _198;
    float _212 = _206 * _200;
    float _214 = -_208;
    float _216 = precise::max(0.0, _214);
    float _218 = abs(_216);
    float _220 = -_218;
    float _222 = _220 + 1.0;
    float _224 = fma(_216, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _226 = as_type<int>(_222) + (-218103808);
    float _228 = fma(_216, _224, -0.212114393711090087890625);
    bool _230 = uint(_226) >= 1920991232u;
    float _232 = fma(_216, _228, 1.570728778839111328125);
    bool _234 = !_230;
    float _250;
    if (!_234)
    {
        int _236 = as_type<int>(_222);
        int _238 = 0;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        _60(_236, _238, _240, _242, _244, _246, _248);
        _250 = as_type<float>(_240);
        _252 = true;
    }
    else
    {
        float _254 = rsqrt(_222);
        float _256 = _222 * _254;
        float _258 = _254 * 0.5;
        float _260 = -_256;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, 0.5);
        float _266 = fma(_256, _264, _256);
        float _268 = -_266;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, _222);
        float _274 = fma(_258, _272, _266);
        _250 = _274;
    }
    _252 = false;
    float _276 = _250;
    bool _278 = _208 > 0.0;
    float _280 = _106 * _106;
    float _282 = _104 * _104;
    float _284 = _280 + _282;
    if (_278)
    {
        discard_fragment();
    }
    float _286 = rsqrt(_284);
    float _288 = _232 * _276;
    float _290 = _288 * 0.636619746685028076171875;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = -_292;
    float _296 = _294 + 1.0;
    float _298 = sqrt(_296);
    float _300 = _106 * _286;
    float _302 = _104 * _286;
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
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        out.m_52.x = 0.0;
        out.m_52.y = 0.0;
        out.m_52.z = 0.0;
        out.m_52.w = 0.0;
        return out;
    }
    float2 _1355;
    _1355.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_326, _328));
    _1355.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_326, _328));
    float _330 = _1355.x;
    float _332 = _330 * 256.0;
    int _334 = int(_332);
    float _336 = in.m_54.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_54.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = _84 * _340;
    float _350 = _84 * _346;
    float _352 = float(uint(_334));
    float _354 = _352 * 0.00390625;
    float2 _1391 = float2(_326, _328);
    float4 _357 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1391, float2(0.0), isnan(_1391)), level(_354)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1391, float2(0.0), isnan(_1391)), level(_354)).xyzw;
    float _359 = _357.x;
    float _361 = _357.y;
    float _363 = _357.z;
    float _365 = _357.w;
    float2 _1410 = float2(_326, _328);
    float2 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1410, float2(0.0), isnan(_1410)), level(_354)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1410, float2(0.0), isnan(_1410)), level(_354)).xy;
    float _371 = _369.x;
    float _373 = _369.y;
    float2 _1423 = float2(_348, _350);
    float2 _375 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_1423, float2(0.0), isnan(_1423))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_1423, float2(0.0), isnan(_1423))).xy;
    float _377 = _375.x;
    float _379 = _375.y;
    float _381 = _210 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _383 = -_381;
    float _385 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[11].y, _383);
    float _387 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _389 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _391 = -_212;
    float _393 = fma(_391, (*spvDescriptorSet0.fp_c3)._m0[11].z, _385);
    float _395 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _397 = _108 * _387;
    float _399 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _401 = _108 * _389;
    float _403 = _108 * _395;
    float _405 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _397);
    float _407 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _409 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _401);
    float _411 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _403);
    float _413 = -_106;
    float _415 = fma(_413, _399, _405);
    float _417 = fma(_106, _399, _405);
    float _419 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _421 = -_108;
    float _423 = _421 + 1.0;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _429 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _431 = -_106;
    float _433 = fma(_431, _419, _409);
    float _435 = fma(_106, _419, _409);
    float _437 = -_106;
    float _439 = fma(_437, _427, _411);
    float _441 = abs(_425);
    float _443 = log2(_441);
    float _445 = fma(_106, _427, _411);
    float _447 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _449 = -_104;
    float _451 = fma(_449, _407, _415);
    float _453 = -_104;
    float _455 = fma(_453, _429, _439);
    float _457 = fma(_104, _407, _417);
    float _459 = fma(_104, _429, _445);
    float _461 = -_108;
    float _463 = _104 * _461;
    float _465 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _467 = _104 * _108;
    float _469 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _471 = -_104;
    float _473 = fma(_471, _447, _433);
    float _475 = fma(_465, _463, _451);
    float _477 = fma(_465, _467, _457);
    float _479 = fma(_469, _463, _455);
    float _481 = _443 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _483 = fma(_469, _467, _459);
    float _485 = fma(_104, _447, _435);
    float _487 = fma(_393, 0.5, 0.5);
    float _489 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _491 = exp2(_481);
    float _493 = fma(_393, -0.5, 0.5);
    float _495 = fma(_487, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _497 = fma(_489, _463, _473);
    float _499 = fma(_489, _467, _485);
    float _501 = -_108;
    float _503 = fma(_501, _108, _282);
    float _505 = fma(_487, _495, -0.212114393711090087890625);
    float _507 = -_106;
    float _509 = _108 * _507;
    float _511 = sqrt(_493);
    float _513 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _515 = fma(_487, _505, 1.570728778839111328125);
    float _517 = _108 * _106;
    float _519 = fma(_513, _509, _475);
    float _521 = _104 * _106;
    float _523 = _491 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _525 = fma(_513, _517, _477);
    float _527 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _529 = fma(_523, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _531 = precise::clamp(_529, 0.0, 1.0);
    float _533 = fma(_527, _509, _479);
    float _535 = fma(_527, _517, _483);
    float _537 = -_531;
    float _539 = _537 + 1.0;
    float _541 = _106 * (-3.0);
    float _543 = fma(_280, 3.0, -1.0);
    float _545 = _511 * 0.636619746685028076171875;
    float _547 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _549 = -_106;
    float _551 = fma(_549, _541, -1.0);
    float _553 = abs(_539);
    float _555 = log2(_553);
    float _557 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _559 = -_515;
    float _561 = fma(_545, _559, 1.0);
    float _563 = fma(_547, _521, _525);
    float _565 = fma(_557, _517, _499);
    float _567 = fma(_547, _521, _519);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _571 = fma(_557, _509, _497);
    float _573 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _575 = fma(_569, _521, _533);
    float _577 = fma(_569, _521, _535);
    float _579 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _581 = fma(_573, _521, _565);
    float _583 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _585 = _555 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _587 = fma(_579, _543, _563);
    float _589 = fma(_573, _521, _571);
    float _591 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _593 = exp2(_585);
    float _595 = fma(_579, _551, _567);
    float _597 = fma(_583, _551, _575);
    float _599 = fma(_591, _551, _589);
    float _601 = _208 + 1.0;
    float _603 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _605 = fma(_583, _543, _577);
    float _607 = fma(_591, _543, _581);
    float _609 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _611 = fma(_603, _503, _595);
    float _613 = fma(_603, _503, _587);
    float _615 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _617 = fma(_609, _503, _597);
    float _619 = fma(_609, _503, _605);
    float _621 = -_208;
    float _623 = fma(_593, _601, _621);
    float _625 = fma(_615, _503, _599);
    float _627 = fma(_615, _503, _607);
    float _629 = fma(_623, 0.5, 0.5);
    float _631 = _365 * _365;
    float _633 = _631 * _631;
    float _635 = _633 * 16.0;
    float _637 = fma(_377, 2.0, -1.0);
    float _639 = fma(_379, 2.0, -1.0);
    float _641 = _373 * _635;
    float _643 = _359 * _641;
    float _645 = _361 * _641;
    float _647 = _363 * _641;
    float _649 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[22].x, _348);
    float _651 = fma(_639, (*spvDescriptorSet0.fp_c3)._m0[22].y, _350);
    float2 _1888 = float2(_326, _328);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1888, float2(0.0), isnan(_1888)), level(_354)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1888, float2(0.0), isnan(_1888)), level(_354)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _1905 = float2(_326, _328);
    float2 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1905, float2(0.0), isnan(_1905)), level(_354)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1905, float2(0.0), isnan(_1905)), level(_354)).xy;
    float _665 = _663.x;
    float _667 = _663.y;
    float2 _1918 = float2(_348, _350);
    float3 _671 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1918, float2(0.0), isnan(_1918))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1918, float2(0.0), isnan(_1918))).xyz;
    float _673 = _671.x;
    float _675 = _671.y;
    float _677 = _671.z;
    float2 _1932 = float2(_326, _328);
    float2 _679 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1932, float2(0.0), isnan(_1932)), level(_354)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1932, float2(0.0), isnan(_1932)), level(_354)).xy;
    float _681 = _679.x;
    float _683 = _679.y;
    float2 _1945 = float2(_326, _328);
    float4 _685 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1945, float2(0.0), isnan(_1945)), level(_354)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1945, float2(0.0), isnan(_1945)), level(_354)).xyzw;
    float _687 = _685.x;
    float _689 = _685.y;
    float _691 = _685.z;
    float _693 = _685.w;
    float2 _1962 = float2(_561, _629);
    float3 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1962, float2(0.0), isnan(_1962))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1962, float2(0.0), isnan(_1962))).xyz;
    float _697 = _695.x;
    float _699 = _695.y;
    float _701 = _695.z;
    float2 _1976 = float2(_649, _651);
    float4 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1976, float2(0.0), isnan(_1976))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1976, float2(0.0), isnan(_1976))).xyzw;
    float _705 = _703.x;
    float _707 = _703.y;
    float _709 = _703.z;
    float _711 = _703.w;
    float _713 = _555 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _715 = _661 * _661;
    float _717 = -_373;
    float _719 = _717 + _667;
    float _721 = _673 * _675;
    float _723 = _715 * _715;
    float _725 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[0].x, _373);
    float _727 = _371 * _373;
    float _729 = _693 * _693;
    float _731 = _723 * 16.0;
    float _733 = -_725;
    float _735 = _733 + _683;
    float _737 = precise::max(_725, 1.52587890625e-05);
    float _739 = -_727;
    float _741 = fma(_665, _667, _739);
    float _743 = _667 * _731;
    float _745 = _729 * _729;
    float _747 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _749 = 1.0 / _737;
    float _751 = -_643;
    float _753 = fma(_655, _743, _751);
    float _755 = -_645;
    float _757 = fma(_657, _743, _755);
    float _759 = -_647;
    float _761 = fma(_659, _743, _759);
    float _763 = fma(_753, (*spvDescriptorSet0.fp_c3)._m0[0].x, _643);
    float _765 = fma(_757, (*spvDescriptorSet0.fp_c3)._m0[0].x, _645);
    float _767 = exp2(_713);
    float _769 = fma(_761, (*spvDescriptorSet0.fp_c3)._m0[0].x, _647);
    float _771 = _725 * _749;
    float _773 = fma(_673, _735, _725);
    float _775 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _777 = _775 + 1.0;
    float _779 = -_721;
    float _781 = _779 + 1.0;
    float _783 = _747 * _771;
    float _785 = _765 * _771;
    float _787 = precise::max(_773, 1.52587890625e-05);
    float _789 = fma(_781, _777, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = _721 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _797 = _763 * _771;
    float _799 = _681 * _789;
    float _801 = 1.0 / _787;
    float _803 = _793 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _805 = _769 * _771;
    float _807 = -_783;
    float _809 = fma(_683, _799, _807);
    float _811 = -_803;
    float _813 = _811 + 1.0;
    float _815 = fma(_673, _809, _783);
    float _817 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _819 = _817 + 1.0;
    float _821 = _745 * 16.0;
    float _823 = abs(_813);
    float _825 = log2(_823);
    float _827 = fma(_781, _819, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _829 = _815 * _801;
    float _831 = _827 * _821;
    float _833 = _829 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _835 = _829 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _837 = _691 * _831;
    float _839 = _833 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _841 = _835 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _843 = -_805;
    float _845 = fma(_683, _837, _843);
    float _847 = _825 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _849 = _619 * _839;
    float _851 = _613 * _839;
    float _853 = _627 * _839;
    float _855 = _825 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _857 = fma(_617, _841, _849);
    float _859 = fma(_611, _841, _851);
    float _861 = exp2(_847);
    float _863 = _683 * _831;
    float _865 = _857 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _867 = fma(_625, _841, _853);
    float _869 = _859 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _871 = -_785;
    float _873 = fma(_689, _863, _871);
    float _875 = _865 * 0.715200006961822509765625;
    float _877 = _867 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _879 = exp2(_855);
    float _881 = -_797;
    float _883 = fma(_687, _863, _881);
    float _885 = fma(_869, 0.2125999927520751953125, _875);
    float _887 = fma(_673, _845, _805);
    float _889 = fma(_673, _883, _797);
    float _891 = fma(_877, 0.072200000286102294921875, _885);
    float _893 = _861 * _801;
    float _895 = _803 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _897 = -_865;
    float _899 = _897 + _891;
    float _901 = -_869;
    float _903 = _901 + _891;
    float _905 = -_877;
    float _907 = _905 + _891;
    float _909 = _889 * _893;
    float _911 = fma(_795, _899, _865);
    float _913 = fma(_673, _873, _785);
    float _915 = fma(_795, _903, _869);
    float _917 = fma(_795, _907, _877);
    float _919 = _879 * _911;
    float _921 = _913 * _893;
    float _923 = _879 * _915;
    float _925 = _879 * _917;
    float _927 = _919 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _929 = _887 * _893;
    float _931 = _923 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _933 = _925 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _935 = fma(_921, (*spvDescriptorSet0.fp_c3)._m0[27].y, _927);
    float _937 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[27].x, _931);
    float _939 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[27].z, _933);
    float _941 = fma(_699, _895, _935);
    float _943 = fma(_697, _895, _937);
    float _945 = fma(_701, _895, _939);
    float _947 = _941 * 0.715200006961822509765625;
    float _949 = fma(_943, 0.2125999927520751953125, _947);
    float _951 = fma(_945, 0.072200000286102294921875, _949);
    float _953 = -_677;
    float _955 = _953 + 1.0;
    float _957 = _773 * _955;
    float _959 = 1.0 / _951;
    float _961 = _959 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _963 = precise::clamp(_961, 0.0, 1.0);
    float _965 = fma(_963, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _967 = _965 * _711;
    float _969 = _957 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _971 = fma(_943, _967, _705);
    float _973 = fma(_941, _967, _707);
    float _975 = fma(_945, _967, _709);
    out.m_50.x = _971;
    out.m_50.y = _973;
    out.m_50.z = _975;
    out.m_50.w = _969;
    out.m_52.x = _971;
    out.m_52.y = _973;
    out.m_52.z = _975;
    out.m_52.w = _969;
    return out;
}

