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
    texture2d<float> fp_t_tcb_14 [[id(3)]];
    sampler fp_t_tcb_14Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_12 [[id(13)]];
    sampler fp_t_tcb_12Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_14Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_CSmplr_w [[id(22)]];
    sampler fp_t_tcb_12Smplr_w [[id(23)]];
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
void _54(thread const int& _2381, thread const int& _2382, thread const int& _2383, thread const int& _2384, thread int& _2385, thread int& _2386, thread int& _2387, thread int& _2388, thread int& _2389, thread int& _2390)
{
    float _2393 = as_type<float>(_2382) + 0.0;
    bool _2395 = _2393 != 0.0;
    bool _2397 = isnan(_2393);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan(0.0);
    bool _2403 = _2399 || _2401;
    int _2405 = as_type<int>(_2393);
    int _2407 = _2381;
    int _2409 = _2384;
    int _2411 = _2403 ? (-1) : 0;
    if (!_2403)
    {
        float _2413 = as_type<float>(_2382) * 1.0;
        _2405 = as_type<int>(_2413);
    }
    int _2415 = _2405;
    bool _2417 = !_2403;
    int _2419 = _2415;
    if (!_2417)
    {
        float _2421 = as_type<float>(_2382) + 0.0;
        bool _2423 = _2421 >= 0.0;
        bool _2425 = isnan(_2421);
        bool _2427 = _2423 || _2425;
        bool _2429 = isnan(0.0);
        bool _2431 = _2427 || _2429;
        int _2433 = as_type<int>(_2421);
        _2411 = _2431 ? (-1) : 0;
        if (!_2431)
        {
            _2433 = 2147483647;
        }
        int _2435 = _2433;
        bool _2437 = !_2431;
        _2419 = _2435;
        if (!_2437)
        {
            float _2439 = abs(as_type<float>(_2382));
            float _2441 = _2439 + 0.0;
            bool _2443 = _2441 > as_type<float>(0x7f800000u /* inf */);
            bool _2445 = isnan(_2441);
            bool _2447 = _2443 || _2445;
            bool _2449 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2451 = _2447 || _2449;
            int _2453 = as_type<int>(_2441);
            _2411 = _2451 ? (-1) : 0;
            if (_2451)
            {
                float _2455 = as_type<float>(_2382) + 1.0;
                _2453 = as_type<int>(_2455);
            }
            int _2457 = _2453;
            _2419 = _2457;
            if (!_2451)
            {
                float _2459 = abs(as_type<float>(_2382));
                float _2461 = _2459 + (-0.0);
                float _2463 = 0.0 + _2461;
                bool _2465 = _2463 != as_type<float>(0x7f800000u /* inf */);
                bool _2467 = isnan(_2463);
                bool _2469 = _2465 || _2467;
                bool _2471 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2473 = _2469 || _2471;
                int _2475 = as_type<int>(_2463);
                _2411 = _2473 ? (-1) : 0;
                if (!_2473)
                {
                    _2475 = _2382;
                }
                int _2477 = _2475;
                bool _2479 = !_2473;
                _2419 = _2477;
                if (!_2479)
                {
                    float _2481 = as_type<float>(_2382) * 18446744073709551616.0;
                    float _2483 = rsqrt(_2481);
                    float _2485 = _2481 * _2483;
                    float _2487 = _2483 * 0.5;
                    float _2489 = -_2485;
                    float _2491 = 0.0 + _2489;
                    float _2493 = fma(_2487, _2491, 0.5);
                    float _2495 = fma(_2485, _2493, _2485);
                    float _2497 = -_2495;
                    float _2499 = 0.0 + _2497;
                    float _2501 = fma(_2495, _2499, _2481);
                    float _2503 = fma(_2487, _2501, _2495);
                    float _2505 = _2503 * 2.3283064365386962890625e-10;
                    _2419 = as_type<int>(_2505);
                    _2407 = as_type<int>(_2481);
                    _2409 = as_type<int>(_2495);
                }
            }
        }
    }
    int _2507 = _2419;
    int _2509 = _2407;
    int _2511 = _2409;
    int _2513 = _2411;
    _2385 = _2507;
    _2386 = _2509;
    _2387 = _2383;
    _2388 = 0;
    _2389 = _2511;
    _2390 = _2513;
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
    float _126 = _96;
    float _128 = _94;
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
        int _234 = 1104;
        int _236 = 0;
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
    float _298 = _100 * _286;
    float _300 = _98 * _286;
    if (_278)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float _302 = abs(_298);
    float _304 = abs(_300);
    float _306 = precise::max(_302, _304);
    float _308 = in.m_48.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_48.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = sqrt(_296);
    float _322 = precise::max(_306, 9.9999997473787516355514526367188e-05);
    float _324 = 1.0 / _322;
    float _326 = -_320;
    float _328 = _326 + 1.0;
    float _330 = _328 * 0.5;
    float _332 = -_324;
    float _334 = _298 * _332;
    float _336 = _300 * _324;
    float _338 = fma(_334, _330, 0.5);
    float _340 = fma(_336, _330, 0.5);
    float _342 = _78 * _312;
    float _344 = _78 * _318;
    float2 _1360;
    _1360.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    _1360.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    float _346 = _1360.x;
    float _348 = _346 * 256.0;
    int _350 = int(_348);
    float2 _1370 = float2(_342, _344);
    float2 _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1370, float2(0.0), isnan(_1370))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1370, float2(0.0), isnan(_1370))).xy;
    float _356 = _354.x;
    float _358 = _354.y;
    float _360 = -_102;
    float _362 = _360 + 1.0;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _204 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _368 = _100 * (-3.0);
    float _370 = abs(_364);
    float _372 = log2(_370);
    float _374 = -_366;
    float _376 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[11].y, _374);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _380 = -_206;
    float _382 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _386 = fma(_280, 3.0, -1.0);
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _390 = _102 * _378;
    float _392 = _102 * _384;
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _396 = _102 * _388;
    float _398 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _390);
    float _400 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _392);
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _404 = _372 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _406 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _396);
    float _408 = -_100;
    float _410 = fma(_408, _394, _400);
    float _412 = fma(_100, _394, _400);
    float _414 = exp2(_404);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _418 = -_100;
    float _420 = fma(_418, _402, _398);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _424 = fma(_100, _402, _398);
    float _426 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _428 = -_100;
    float _430 = fma(_428, _416, _406);
    float _432 = -_98;
    float _434 = fma(_432, _422, _410);
    float _436 = fma(_100, _416, _406);
    float _438 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _440 = fma(_98, _422, _412);
    float _442 = -_98;
    float _444 = fma(_442, _426, _420);
    float _446 = fma(_98, _426, _424);
    float _448 = _98 * _100;
    float _450 = -_100;
    float _452 = _102 * _450;
    float _454 = -_100;
    float _456 = fma(_454, _368, -1.0);
    float _458 = _414 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _460 = -_102;
    float _462 = fma(_460, _102, _282);
    float _464 = _102 * _100;
    float _466 = -_102;
    float _468 = _98 * _466;
    float _470 = _98 * _102;
    float _472 = -_98;
    float _474 = fma(_472, _438, _430);
    float _476 = fma(_98, _438, _436);
    float _478 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _484 = fma(_382, -0.5, 0.5);
    float _486 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _488 = -_480;
    float _490 = _488 + 1.0;
    float _492 = fma(_482, _468, _434);
    float _494 = fma(_482, _470, _440);
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _498 = abs(_490);
    float _500 = log2(_498);
    float _502 = fma(_382, 0.5, 0.5);
    float _504 = fma(_486, _468, _444);
    float _506 = fma(_486, _470, _446);
    float _508 = fma(_496, _470, _476);
    float _510 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _512 = fma(_496, _468, _474);
    float _514 = sqrt(_484);
    float _516 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _518 = fma(_510, _452, _492);
    float _520 = fma(_510, _464, _494);
    float _522 = fma(_502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _526 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _528 = fma(_516, _452, _504);
    float _530 = fma(_516, _464, _506);
    float _532 = fma(_502, _522, -0.212114393711090087890625);
    float _534 = fma(_524, _452, _512);
    float _536 = fma(_526, _448, _518);
    float _538 = fma(_526, _448, _520);
    float _540 = _500 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _542 = fma(_502, _532, 1.570728778839111328125);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _546 = _514 * 0.636619746685028076171875;
    float _548 = fma(_524, _464, _508);
    float _550 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _552 = exp2(_540);
    float _554 = -_542;
    float _556 = fma(_546, _554, 1.0);
    float _558 = fma(_544, _448, _528);
    float _560 = fma(_550, _448, _534);
    float _562 = fma(_550, _448, _548);
    float _564 = fma(_544, _448, _530);
    float _566 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _568 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _570 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _572 = fma(_566, _456, _536);
    float _574 = fma(_566, _386, _538);
    float _576 = fma(_568, _456, _558);
    float _578 = fma(_568, _386, _564);
    float _580 = _202 + 1.0;
    float _582 = fma(_570, _386, _562);
    float _584 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _586 = fma(_570, _456, _560);
    float _588 = -_202;
    float _590 = fma(_552, _580, _588);
    float _592 = fma(_202, -0.5, 0.5);
    float _594 = fma(_584, _462, _576);
    float _596 = fma(_590, 0.5, 0.5);
    float _598 = fma(_584, _462, _578);
    float _600 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _602 = fma(_600, _462, _572);
    float _604 = fma(_600, _462, _574);
    float _606 = float(uint(_350));
    float _608 = fma(_358, 2.0, -1.0);
    float _610 = fma(_356, 2.0, -1.0);
    float _612 = _606 * 0.00390625;
    float _614 = fma(_608, (*spvDescriptorSet0.fp_c3)._m0[22].y, _344);
    float _616 = fma(_610, (*spvDescriptorSet0.fp_c3)._m0[22].x, _342);
    float2 _1813 = float2(_338, _340);
    float4 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1813, float2(0.0), isnan(_1813)), level(_612)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1813, float2(0.0), isnan(_1813)), level(_612)).xyzw;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _619.w;
    float2 _1830 = float2(_338, _340);
    float2 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1830, float2(0.0), isnan(_1830)), level(_612)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1830, float2(0.0), isnan(_1830)), level(_612)).xy;
    float _631 = _629.x;
    float _633 = _629.y;
    float2 _1843 = float2(_342, _344);
    float3 _637 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1843, float2(0.0), isnan(_1843))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1843, float2(0.0), isnan(_1843))).xyz;
    float _639 = _637.x;
    float _641 = _637.y;
    float _643 = _637.z;
    float2 _1857 = float2(_338, _340);
    float2 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1857, float2(0.0), isnan(_1857)), level(_612)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1857, float2(0.0), isnan(_1857)), level(_612)).xy;
    float _647 = _645.x;
    float _649 = _645.y;
    float2 _1870 = float2(_338, _340);
    float4 _651 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1870, float2(0.0), isnan(_1870)), level(_612)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1870, float2(0.0), isnan(_1870)), level(_612)).xyzw;
    float _653 = _651.x;
    float _655 = _651.y;
    float _657 = _651.z;
    float _659 = _651.w;
    float2 _1887 = float2(_556, _596);
    float3 _661 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1887, float2(0.0), isnan(_1887))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1887, float2(0.0), isnan(_1887))).xyz;
    float _663 = _661.x;
    float _665 = _661.y;
    float _667 = _661.z;
    float2 _1901 = float2(_556, _592);
    float3 _669 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1901, float2(0.0), isnan(_1901))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1901, float2(0.0), isnan(_1901))).xyz;
    float _671 = _669.x;
    float _673 = _669.y;
    float _675 = _669.z;
    float2 _1915 = float2(_616, _614);
    float4 _677 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1915, float2(0.0), isnan(_1915))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1915, float2(0.0), isnan(_1915))).xyzw;
    float _679 = _677.x;
    float _681 = _677.y;
    float _683 = _677.z;
    float _685 = _677.w;
    float _687 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _689 = fma(_687, _462, _586);
    float _691 = fma(_687, _462, _582);
    float _693 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _695 = _693 + 1.0;
    float _697 = _627 * _627;
    float _699 = _639 * _641;
    float _701 = _697 * _697;
    float _703 = _659 * _659;
    float _705 = _701 * 16.0;
    float _707 = _633 * _705;
    float _709 = _623 * _707;
    float _711 = _621 * _707;
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = _625 * _707;
    float _719 = _500 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _721 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _723 = _721 + 1.0;
    float _725 = fma(_715, _695, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _727 = _699 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _729 = exp2(_719);
    float _731 = fma(_715, _723, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _733 = -_633;
    float _735 = _733 + _649;
    float _737 = _647 * _725;
    float _739 = -_643;
    float _741 = _739 + 1.0;
    float _743 = fma(_639, _735, _633);
    float _745 = _631 * _633;
    float _747 = precise::max(_743, 1.52587890625e-05);
    float _749 = _743 * _741;
    float _751 = -_729;
    float _753 = _751 + 1.0;
    float _755 = 1.0 / _747;
    float _757 = -_745;
    float _759 = fma(_649, _737, _757);
    float _761 = _749 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _763 = _753 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _765 = fma(_639, _759, _745);
    float _767 = -_763;
    float _769 = _767 + 1.0;
    float _771 = abs(_769);
    float _773 = log2(_771);
    float _775 = _765 * _755;
    float _777 = _775 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _779 = _777 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _781 = _598 * _779;
    float _783 = _775 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _785 = _604 * _779;
    float _787 = _691 * _779;
    float _789 = _773 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _791 = _783 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _793 = _773 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _795 = fma(_594, _791, _781);
    float _797 = -_761;
    float _799 = _797 + 1.0;
    float _801 = fma(_602, _791, _785);
    float _803 = fma(_689, _791, _787);
    float _805 = _795 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _807 = _703 * _703;
    float _809 = _801 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _811 = abs(_799);
    float _813 = log2(_811);
    float _815 = _805 * 0.715200006961822509765625;
    float _817 = _803 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _819 = _807 * 16.0;
    float _821 = fma(_809, 0.2125999927520751953125, _815);
    float _823 = _731 * _819;
    float _825 = exp2(_789);
    float _827 = fma(_817, 0.072200000286102294921875, _821);
    float _829 = _657 * _823;
    float _831 = _813 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _833 = exp2(_793);
    float _835 = -_805;
    float _837 = _835 + _827;
    float _839 = fma(_727, _837, _805);
    float _841 = _825 * _755;
    float _843 = exp2(_831);
    float _845 = _649 * _823;
    float _847 = -_809;
    float _849 = _847 + _827;
    float _851 = -_717;
    float _853 = fma(_649, _829, _851);
    float _855 = -_711;
    float _857 = fma(_653, _845, _855);
    float _859 = -_709;
    float _861 = fma(_655, _845, _859);
    float _863 = fma(_727, _849, _809);
    float _865 = -_817;
    float _867 = _865 + _827;
    float _869 = fma(_639, _857, _711);
    float _871 = fma(_639, _861, _709);
    float _873 = fma(_639, _853, _717);
    float _875 = _833 * _839;
    float _877 = _869 * _841;
    float _879 = _871 * _841;
    float _881 = fma(_727, _867, _817);
    float _883 = -_843;
    float _885 = spvFAdd(_883, 1.00010001659393310546875);
    float _887 = -_843;
    float _889 = _887 + 1.0;
    float _891 = _875 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _893 = _873 * _841;
    float _895 = _833 * _863;
    float _897 = 1.0 / _885;
    float _899 = -_761;
    float _901 = _899 + _889;
    float _903 = _833 * _881;
    float _905 = fma(_879, (*spvDescriptorSet0.fp_c3)._m0[27].y, _891);
    float _907 = _895 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _909 = _763 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _911 = _901 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _913 = _903 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _915 = fma(_877, (*spvDescriptorSet0.fp_c3)._m0[27].x, _907);
    float _917 = fma(_665, _909, _905);
    float _919 = _673 * _911;
    float _921 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[27].z, _913);
    float _923 = fma(_663, _909, _915);
    float _925 = _671 * _911;
    float _927 = fma(_761, _917, _919);
    float _929 = fma(_667, _909, _921);
    float _931 = _675 * _911;
    float _933 = fma(_761, _923, _925);
    float _935 = _897 * _927;
    float _937 = fma(_761, _929, _931);
    float _939 = _897 * _933;
    float _941 = _935 * 0.715200006961822509765625;
    float _943 = _897 * _937;
    float _945 = fma(_939, 0.2125999927520751953125, _941);
    float _947 = fma(_943, 0.072200000286102294921875, _945);
    float _949 = 1.0 / _947;
    float _951 = _949 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _957 = _955 * _685;
    float _959 = fma(_939, _957, _679);
    float _961 = fma(_935, _957, _681);
    float _963 = fma(_943, _957, _683);
    out.m_46.x = _959;
    out.m_46.y = _961;
    out.m_46.z = _963;
    out.m_46.w = _889;
    return out;
}

