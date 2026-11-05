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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
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
void _52(thread const int& _2343, thread const int& _2344, thread const int& _2345, thread const int& _2346, thread int& _2347, thread int& _2348, thread int& _2349, thread int& _2350, thread int& _2351, thread int& _2352)
{
    float _2355 = as_type<float>(_2343) + 0.0;
    bool _2357 = _2355 != 0.0;
    bool _2359 = isnan(_2355);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan(0.0);
    bool _2365 = _2361 || _2363;
    int _2367 = as_type<int>(_2355);
    int _2369 = _2345;
    int _2371 = _2365 ? (-1) : 0;
    if (!_2365)
    {
        float _2373 = as_type<float>(_2343) * 1.0;
        _2367 = as_type<int>(_2373);
    }
    int _2375 = _2367;
    bool _2377 = !_2365;
    int _2379 = _2375;
    if (!_2377)
    {
        float _2381 = as_type<float>(_2343) + 0.0;
        bool _2383 = _2381 >= 0.0;
        bool _2385 = isnan(_2381);
        bool _2387 = _2383 || _2385;
        bool _2389 = isnan(0.0);
        bool _2391 = _2387 || _2389;
        int _2393 = as_type<int>(_2381);
        _2371 = _2391 ? (-1) : 0;
        if (!_2391)
        {
            _2393 = 2147483647;
        }
        int _2395 = _2393;
        bool _2397 = !_2391;
        _2379 = _2395;
        if (!_2397)
        {
            float _2399 = abs(as_type<float>(_2343));
            float _2401 = _2399 + 0.0;
            bool _2403 = _2401 > as_type<float>(0x7f800000u /* inf */);
            bool _2405 = isnan(_2401);
            bool _2407 = _2403 || _2405;
            bool _2409 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2411 = _2407 || _2409;
            int _2413 = as_type<int>(_2401);
            _2371 = _2411 ? (-1) : 0;
            if (_2411)
            {
                float _2415 = as_type<float>(_2343) + 1.0;
                _2413 = as_type<int>(_2415);
            }
            int _2417 = _2413;
            _2379 = _2417;
            if (!_2411)
            {
                float _2419 = abs(as_type<float>(_2343));
                float _2421 = _2419 + (-0.0);
                float _2423 = 0.0 + _2421;
                bool _2425 = _2423 != as_type<float>(0x7f800000u /* inf */);
                bool _2427 = isnan(_2423);
                bool _2429 = _2425 || _2427;
                bool _2431 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2433 = _2429 || _2431;
                int _2435 = as_type<int>(_2423);
                _2371 = _2433 ? (-1) : 0;
                if (!_2433)
                {
                    _2435 = _2343;
                }
                int _2437 = _2435;
                bool _2439 = !_2433;
                _2379 = _2437;
                if (!_2439)
                {
                    float _2441 = as_type<float>(_2343) * 18446744073709551616.0;
                    float _2443 = rsqrt(_2441);
                    float _2445 = _2441 * _2443;
                    float _2447 = _2443 * 0.5;
                    float _2449 = -_2445;
                    float _2451 = 0.0 + _2449;
                    float _2453 = fma(_2447, _2451, 0.5);
                    float _2455 = fma(_2445, _2453, _2445);
                    float _2457 = -_2455;
                    float _2459 = 0.0 + _2457;
                    float _2461 = fma(_2455, _2459, _2441);
                    float _2463 = fma(_2447, _2461, _2455);
                    float _2465 = _2463 * 2.3283064365386962890625e-10;
                    _2379 = as_type<int>(_2465);
                    _2369 = as_type<int>(_2455);
                }
            }
        }
    }
    int _2467 = _2379;
    int _2469 = _2369;
    int _2471 = _2371;
    _2347 = _2467;
    _2348 = _2467;
    _2349 = _2346;
    _2350 = 0;
    _2351 = _2469;
    _2352 = _2471;
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
    float2 _1322;
    _1322.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    _1322.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    float _328 = _1322.x;
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
    float _358 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _360 = _100 * _352;
    float _362 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _354);
    float _364 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _366 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _368 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _360);
    float _370 = -_98;
    float _372 = fma(_370, _356, _362);
    float _374 = fma(_98, _356, _362);
    float _376 = _202 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _378 = _346 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _380 = _100 * _350;
    float _382 = -_98;
    float _384 = fma(_382, _358, _368);
    float _386 = fma(_98, _358, _368);
    float _388 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _380);
    float _390 = exp2(_378);
    float _392 = -_98;
    float _394 = fma(_392, _364, _388);
    float _396 = fma(_98, _364, _388);
    float _398 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _400 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _402 = -_96;
    float _404 = fma(_402, _366, _394);
    float _406 = fma(_96, _366, _396);
    float _408 = -_96;
    float _410 = fma(_408, _398, _372);
    float _412 = fma(_96, _398, _374);
    float _414 = -_376;
    float _416 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[11].y, _414);
    float _418 = -_96;
    float _420 = fma(_418, _400, _384);
    float _422 = fma(_96, _400, _386);
    float _424 = in.m_46.y;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_46.x;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = _390 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _438 = -_204;
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[11].z, _416);
    float _442 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _444 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _446 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = fma(_440, -0.5, 0.5);
    float _452 = fma(_440, 0.5, 0.5);
    float _454 = fma(_442, _342, _410);
    float _456 = -_448;
    float _458 = _456 + 1.0;
    float _460 = _96 * _100;
    float _462 = fma(_452, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _464 = sqrt(_450);
    float _466 = fma(_442, _460, _412);
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _470 = fma(_444, _460, _422);
    float _472 = fma(_452, _462, -0.212114393711090087890625);
    float _474 = fma(_468, _342, _404);
    float _476 = abs(_458);
    float _478 = log2(_476);
    float _480 = fma(_468, _460, _406);
    float _482 = fma(_444, _342, _420);
    float _484 = -_98;
    float _486 = _100 * _484;
    float _488 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _490 = _100 * _98;
    float _492 = fma(_452, _472, 1.570728778839111328125);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _496 = fma(_488, _486, _454);
    float _498 = fma(_488, _490, _466);
    float _500 = _200 + 1.0;
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _504 = _464 * 0.636619746685028076171875;
    float _506 = fma(_494, _486, _474);
    float _508 = _80 * _428;
    float _510 = fma(_502, _486, _482);
    float _512 = _478 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _514 = fma(_494, _490, _480);
    float _516 = fma(_502, _490, _470);
    float _518 = exp2(_512);
    float _520 = -_200;
    float _522 = fma(_518, _500, _520);
    float _524 = -_492;
    float _526 = fma(_504, _524, 1.0);
    float _528 = _80 * _434;
    float _530 = fma(_522, 0.5, 0.5);
    float _532 = float(uint(_332));
    float _534 = _532 * 0.00390625;
    float2 _1651 = float2(_324, _326);
    float2 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1651, float2(0.0), isnan(_1651)), level(_534)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1651, float2(0.0), isnan(_1651)), level(_534)).xy;
    float _540 = _538.x;
    float _542 = _538.y;
    float2 _1666 = float2(_324, _326);
    float2 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1666, float2(0.0), isnan(_1666)), level(_534)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1666, float2(0.0), isnan(_1666)), level(_534)).xy;
    float _546 = _544.x;
    float _548 = _544.y;
    float2 _1679 = float2(_324, _326);
    float4 _551 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1679, float2(0.0), isnan(_1679)), level(_534)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1679, float2(0.0), isnan(_1679)), level(_534)).xyzw;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float _559 = _551.w;
    float2 _1696 = float2(_324, _326);
    float4 _561 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1696, float2(0.0), isnan(_1696)), level(_534)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1696, float2(0.0), isnan(_1696)), level(_534)).xyzw;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float _569 = _561.w;
    float2 _1713 = float2(_528, _508);
    float3 _573 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1713, float2(0.0), isnan(_1713))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1713, float2(0.0), isnan(_1713))).xyz;
    float _575 = _573.x;
    float _577 = _573.y;
    float _579 = _573.z;
    float2 _1727 = float2(_526, _530);
    float3 _581 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1727, float2(0.0), isnan(_1727))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1727, float2(0.0), isnan(_1727))).xyz;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _581.z;
    float _589 = _96 * _98;
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _593 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _595 = _478 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _597 = -_100;
    float _599 = fma(_597, _100, _280);
    float _601 = fma(_591, _589, _496);
    float _603 = fma(_591, _589, _498);
    float _605 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _607 = fma(_593, _589, _506);
    float _609 = fma(_593, _589, _514);
    float _611 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _613 = _200 * _611;
    float _615 = _98 * (-3.0);
    float _617 = _200 * (-10000.0);
    float _619 = fma(_605, _589, _510);
    float _621 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _613);
    float _623 = -_98;
    float _625 = fma(_623, _615, -1.0);
    float _627 = fma(_605, _589, _516);
    float _629 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].z, _621);
    float _631 = abs(_617);
    bool _633 = _631 > 0.00999999977648258209228515625;
    float _635 = fma(_278, 3.0, -1.0);
    float _637 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _641 = fma(_637, _625, _601);
    float _643 = fma(_637, _635, _603);
    float _645 = _633 ? _617 : 0.00999999977648258209228515625;
    float _647 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _649 = fma(_639, _625, _619);
    float _651 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _653 = fma(_639, _635, _627);
    float _655 = _645 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _657 = fma(_647, _625, _607);
    float _659 = -_651;
    float _661 = exp2(_659);
    float _663 = fma(_647, _635, _609);
    float _665 = precise::max(_655, -127.0);
    float _667 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _669 = -_665;
    float _671 = exp2(_669);
    float _673 = fma(_629, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _675 = fma(_667, _599, _641);
    float _677 = fma(_667, _599, _643);
    float _679 = fma(_673, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _681 = 1.0 / _665;
    float _683 = abs(_679);
    float _685 = log2(_683);
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = _661 * _689;
    float _693 = exp2(_595);
    float _695 = _691 * _681;
    float _697 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _699 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _701 = fma(_697, _599, _657);
    float _703 = fma(_697, _599, _663);
    float _705 = _685 * 1.5;
    float _707 = fma(_699, _599, _649);
    float _709 = fma(_699, _599, _653);
    float _711 = exp2(_705);
    float _713 = -_693;
    float _715 = _713 + 1.0;
    float _717 = _715 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _719 = -_717;
    float _721 = _719 + 1.0;
    float _723 = _711 * 12.56637096405029296875;
    float _725 = abs(_721);
    float _727 = log2(_725);
    float _729 = _540 * _542;
    float _731 = -_542;
    float _733 = _731 + _548;
    float _735 = 1.0 / _723;
    float _737 = _559 * _559;
    float _739 = -_729;
    float _741 = fma(_546, _548, _739);
    float _743 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _542);
    float _745 = _569 * _569;
    float _747 = _737 * _737;
    float _749 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _729);
    float _751 = _727 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _753 = precise::max(_743, 1.52587890625e-05);
    float _755 = _747 * 16.0;
    float _757 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _759 = fma(_757, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _761 = _745 * _745;
    float _763 = _727 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _765 = _542 * _755;
    float _767 = 1.0 / _753;
    float _769 = _759 * _735;
    float _771 = _553 * _765;
    float _773 = _555 * _765;
    float _775 = _557 * _765;
    float _777 = exp2(_751);
    float _779 = _749 * _767;
    float _781 = _779 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _783 = _779 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _785 = _781 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _787 = _783 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _789 = _777 * _767;
    float _791 = _703 * _785;
    float _793 = _709 * _785;
    float _795 = _677 * _785;
    float _797 = _761 * 16.0;
    float _799 = fma(_701, _787, _791);
    float _801 = fma(_707, _787, _793);
    float _803 = fma(_675, _787, _795);
    float _805 = _548 * _797;
    float _807 = _799 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _809 = exp2(_763);
    float _811 = _803 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _813 = _801 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _815 = _807 * 0.715200006961822509765625;
    float _817 = _575 * _577;
    float _819 = -_771;
    float _821 = fma(_563, _805, _819);
    float _823 = -_773;
    float _825 = fma(_565, _805, _823);
    float _827 = fma(_811, 0.2125999927520751953125, _815);
    float _829 = _817 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _831 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[0].x, _771);
    float _833 = -_775;
    float _835 = fma(_567, _805, _833);
    float _837 = fma(_813, 0.072200000286102294921875, _827);
    float _839 = fma(_825, (*spvDescriptorSet0.fp_c3)._m0[0].x, _773);
    float _841 = _831 * _789;
    float _843 = fma(_835, (*spvDescriptorSet0.fp_c3)._m0[0].x, _775);
    float _845 = -_807;
    float _847 = _845 + _837;
    float _849 = -_811;
    float _851 = _849 + _837;
    float _853 = -_813;
    float _855 = _853 + _837;
    float _857 = _839 * _789;
    float _859 = fma(_829, _847, _807);
    float _861 = fma(_829, _851, _811);
    float _863 = fma(_829, _855, _813);
    float _865 = _809 * _859;
    float _867 = _809 * _861;
    float _869 = _843 * _789;
    float _871 = _809 * _863;
    float _873 = _865 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _875 = _867 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _877 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _879 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _881 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[27].y, _873);
    float _883 = _871 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _885 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[27].x, _875);
    float _887 = _695 * _879;
    float _889 = fma(_585, _877, _881);
    float _891 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[27].z, _883);
    float _893 = fma(_583, _877, _885);
    float _895 = _889 * 0.715200006961822509765625;
    float _897 = fma(_587, _877, _891);
    float _899 = -_887;
    float _901 = exp2(_899);
    float _903 = fma(_893, 0.2125999927520751953125, _895);
    float _905 = fma(_897, 0.072200000286102294921875, _903);
    float _907 = -_579;
    float _909 = _907 + 1.0;
    float _911 = 1.0 / _905;
    float _913 = _743 * _909;
    float _915 = _913 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _917 = -_901;
    float _919 = _917 + 1.0;
    float _921 = _769 * _919;
    float _923 = _921 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _925 = _921 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _927 = _911 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _929 = precise::clamp(_927, 0.0, 1.0);
    float _931 = fma(_929, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _933 = _901 * _931;
    float _935 = _921 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _937 = fma(_893, _933, _923);
    float _939 = fma(_889, _933, _935);
    float _941 = fma(_897, _933, _925);
    out.m_42.x = _937;
    out.m_42.y = _939;
    out.m_42.z = _941;
    out.m_42.w = _915;
    out.m_44.x = _937;
    out.m_44.y = _939;
    out.m_44.z = _941;
    out.m_44.w = _915;
    return out;
}

