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
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_12 [[id(13)]];
    sampler fp_t_tcb_12Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_14Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_ESmplr_w [[id(20)]];
    sampler fp_t_tcb_10Smplr_w [[id(21)]];
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
void _54(thread const int& _2333, thread const int& _2334, thread const int& _2335, thread const int& _2336, thread const int& _2337, thread int& _2338, thread int& _2339, thread int& _2340, thread int& _2341, thread int& _2342, thread int& _2343)
{
    float _2346 = as_type<float>(_2336) + 0.0;
    bool _2348 = _2346 != 0.0;
    bool _2350 = isnan(_2346);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(0.0);
    bool _2356 = _2352 || _2354;
    int _2358 = as_type<int>(_2346);
    int _2360 = 0;
    int _2362 = _2335;
    int _2364 = _2356 ? (-1) : 0;
    if (!_2356)
    {
        float _2366 = as_type<float>(_2336) * 1.0;
        _2358 = as_type<int>(_2366);
    }
    int _2368 = _2358;
    bool _2370 = !_2356;
    int _2372 = _2368;
    if (!_2370)
    {
        float _2374 = as_type<float>(_2336) + 0.0;
        bool _2376 = _2374 >= 0.0;
        bool _2378 = isnan(_2374);
        bool _2380 = _2376 || _2378;
        bool _2382 = isnan(0.0);
        bool _2384 = _2380 || _2382;
        int _2386 = as_type<int>(_2374);
        _2364 = _2384 ? (-1) : 0;
        if (!_2384)
        {
            _2386 = 2147483647;
        }
        int _2388 = _2386;
        bool _2390 = !_2384;
        _2372 = _2388;
        if (!_2390)
        {
            float _2392 = abs(as_type<float>(_2336));
            float _2394 = _2392 + 0.0;
            bool _2396 = _2394 > as_type<float>(0x7f800000u /* inf */);
            bool _2398 = isnan(_2394);
            bool _2400 = _2396 || _2398;
            bool _2402 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2404 = _2400 || _2402;
            int _2406 = as_type<int>(_2394);
            _2360 = 2139095040;
            _2364 = _2404 ? (-1) : 0;
            if (_2404)
            {
                float _2408 = as_type<float>(_2336) + 1.0;
                _2406 = as_type<int>(_2408);
            }
            int _2410 = _2406;
            _2372 = _2410;
            if (!_2404)
            {
                float _2412 = abs(as_type<float>(_2336));
                float _2414 = _2412 + (-0.0);
                float _2416 = 0.0 + _2414;
                bool _2418 = _2416 != as_type<float>(0x7f800000u /* inf */);
                bool _2420 = isnan(_2416);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2426 = _2422 || _2424;
                int _2428 = as_type<int>(_2416);
                _2364 = _2426 ? (-1) : 0;
                if (!_2426)
                {
                    _2428 = _2336;
                }
                int _2430 = _2428;
                bool _2432 = !_2426;
                _2372 = _2430;
                if (!_2432)
                {
                    float _2434 = as_type<float>(_2336) * 18446744073709551616.0;
                    float _2436 = rsqrt(_2434);
                    float _2438 = _2434 * _2436;
                    float _2440 = _2436 * 0.5;
                    float _2442 = -_2438;
                    float _2444 = 0.0 + _2442;
                    float _2446 = fma(_2440, _2444, 0.5);
                    float _2448 = fma(_2438, _2446, _2438);
                    float _2450 = -_2448;
                    float _2452 = 0.0 + _2450;
                    float _2454 = fma(_2448, _2452, _2434);
                    float _2456 = fma(_2440, _2454, _2448);
                    float _2458 = _2456 * 2.3283064365386962890625e-10;
                    _2372 = as_type<int>(_2458);
                    _2360 = as_type<int>(_2434);
                    _2362 = as_type<int>(_2444);
                }
            }
        }
    }
    int _2460 = _2372;
    int _2462 = _2360;
    int _2464 = _2362;
    int _2466 = _2364;
    _2338 = _2460;
    _2339 = _2462;
    _2340 = _2337;
    _2341 = 0;
    _2342 = _2464;
    _2343 = _2466;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _254 = false;
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
    float _252;
    if (!_228)
    {
        int _230 = 0;
        int _232 = 0;
        int _234 = 0;
        int _236 = as_type<int>(_216);
        int _238 = 1104;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        int _250;
        _54(_230, _232, _234, _236, _238, _240, _242, _244, _246, _248, _250);
        _252 = as_type<float>(_240);
        _254 = true;
    }
    else
    {
        float _256 = rsqrt(_216);
        float _258 = _216 * _256;
        float _260 = _256 * 0.5;
        float _262 = -_258;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, 0.5);
        float _268 = fma(_258, _266, _258);
        float _270 = -_268;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, _216);
        float _276 = fma(_260, _274, _268);
        _252 = _276;
    }
    _254 = false;
    float _278 = _252;
    bool _280 = _202 > 0.0;
    float _282 = _100 * _100;
    float _284 = _98 * _98;
    float _286 = _282 + _284;
    if (_280)
    {
        discard_fragment();
    }
    float _288 = rsqrt(_286);
    float _290 = _226 * _278;
    float _292 = _290 * 0.636619746685028076171875;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = -_294;
    float _298 = _296 + 1.0;
    float _300 = _100 * _288;
    float _302 = _98 * _288;
    if (_280)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float _304 = abs(_300);
    float _306 = abs(_302);
    float _308 = precise::max(_304, _306);
    float _310 = sqrt(_298);
    float _312 = in.m_48.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_48.y;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = precise::max(_308, 9.9999997473787516355514526367188e-05);
    float _326 = 1.0 / _324;
    float _328 = -_310;
    float _330 = _328 + 1.0;
    float _332 = _330 * 0.5;
    float _334 = -_326;
    float _336 = _300 * _334;
    float _338 = _302 * _326;
    float _340 = fma(_336, _332, 0.5);
    float _342 = fma(_338, _332, 0.5);
    float _344 = _78 * _316;
    float2 _1337;
    _1337.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1337.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _346 = _1337.x;
    float _348 = _346 * 256.0;
    int _350 = int(_348);
    float _352 = _78 * _322;
    float2 _1350 = float2(_344, _352);
    float2 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1350, float2(0.0), isnan(_1350))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1350, float2(0.0), isnan(_1350))).xy;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = -_102;
    float _364 = _362 + 1.0;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _204 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _370 = -_102;
    float _372 = fma(_370, _102, _284);
    float _374 = -_368;
    float _376 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[11].y, _374);
    float _378 = abs(_366);
    float _380 = log2(_378);
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _384 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _386 = -_206;
    float _388 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _392 = fma(_282, 3.0, -1.0);
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _396 = _102 * _390;
    float _398 = _102 * _382;
    float _400 = _102 * _384;
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _404 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _396);
    float _406 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _398);
    float _408 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _400);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _412 = _380 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _414 = -_100;
    float _416 = fma(_414, _394, _404);
    float _418 = fma(_100, _394, _404);
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _422 = -_100;
    float _424 = fma(_422, _410, _406);
    float _426 = fma(_100, _410, _406);
    float _428 = exp2(_412);
    float _430 = -_98;
    float _432 = fma(_430, _420, _416);
    float _434 = _100 * (-3.0);
    float _436 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _438 = -_100;
    float _440 = fma(_438, _402, _408);
    float _442 = fma(_100, _402, _408);
    float _444 = -_100;
    float _446 = fma(_444, _434, -1.0);
    float _448 = -_98;
    float _450 = fma(_448, _436, _424);
    float _452 = fma(_98, _420, _418);
    float _454 = fma(_98, _436, _426);
    float _456 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _458 = _98 * _100;
    float _460 = -_100;
    float _462 = _102 * _460;
    float _464 = _102 * _100;
    float _466 = _428 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _468 = -_102;
    float _470 = _98 * _468;
    float _472 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _474 = _98 * _102;
    float _476 = fma(_466, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = -_98;
    float _482 = fma(_480, _456, _440);
    float _484 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _486 = fma(_98, _456, _442);
    float _488 = -_478;
    float _490 = _488 + 1.0;
    float _492 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _494 = fma(_472, _470, _432);
    float _496 = fma(_472, _474, _452);
    float _498 = abs(_490);
    float _500 = log2(_498);
    float _502 = fma(_484, _470, _450);
    float _504 = fma(_388, -0.5, 0.5);
    float _506 = fma(_484, _474, _454);
    float _508 = fma(_492, _474, _486);
    float _510 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _512 = fma(_388, 0.5, 0.5);
    float _514 = fma(_492, _470, _482);
    float _516 = sqrt(_504);
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _520 = fma(_510, _464, _496);
    float _522 = fma(_518, _464, _506);
    float _524 = fma(_518, _462, _502);
    float _526 = fma(_512, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _528 = fma(_510, _462, _494);
    float _530 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _532 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _534 = fma(_512, _526, -0.212114393711090087890625);
    float _536 = fma(_530, _462, _514);
    float _538 = fma(_530, _464, _508);
    float _540 = fma(_532, _458, _528);
    float _542 = fma(_532, _458, _520);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _546 = _500 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _548 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _550 = fma(_544, _458, _524);
    float _552 = fma(_544, _458, _522);
    float _554 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _556 = fma(_548, _458, _538);
    float _558 = exp2(_546);
    float _560 = fma(_512, _534, 1.570728778839111328125);
    float _562 = _516 * 0.636619746685028076171875;
    float _564 = fma(_548, _458, _536);
    float _566 = fma(_554, _392, _542);
    float _568 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _570 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _572 = -_560;
    float _574 = fma(_562, _572, 1.0);
    float _576 = fma(_554, _446, _540);
    float _578 = fma(_568, _446, _550);
    float _580 = fma(_570, _372, _566);
    float _582 = fma(_568, _392, _552);
    float _584 = _202 + 1.0;
    float _586 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _588 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _590 = fma(_570, _372, _576);
    float _592 = -_202;
    float _594 = fma(_558, _584, _592);
    float _596 = fma(_586, _372, _578);
    float _598 = fma(_586, _372, _582);
    float _600 = fma(_202, -0.5, 0.5);
    float _602 = fma(_594, 0.5, 0.5);
    float _604 = fma(_588, _446, _564);
    float _606 = fma(_588, _392, _556);
    float _608 = float(uint(_350));
    float _610 = _608 * 0.00390625;
    float2 _1777 = float2(_340, _342);
    float4 _613 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1777, float2(0.0), isnan(_1777)), level(_610)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1777, float2(0.0), isnan(_1777)), level(_610)).xyzw;
    float _615 = _613.x;
    float _617 = _613.y;
    float _619 = _613.z;
    float _621 = _613.w;
    float2 _1794 = float2(_340, _342);
    float2 _623 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1794, float2(0.0), isnan(_1794)), level(_610)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1794, float2(0.0), isnan(_1794)), level(_610)).xy;
    float _625 = _623.x;
    float _627 = _623.y;
    float _629 = fma(_360, 2.0, -1.0);
    float _631 = fma(_358, 2.0, -1.0);
    float _633 = fma(_629, (*spvDescriptorSet0.fp_c3)._m0[22].y, _352);
    float _635 = fma(_631, (*spvDescriptorSet0.fp_c3)._m0[22].x, _344);
    float2 _1823 = float2(_340, _342);
    float2 _637 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1823, float2(0.0), isnan(_1823)), level(_610)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1823, float2(0.0), isnan(_1823)), level(_610)).xy;
    float _639 = _637.x;
    float _641 = _637.y;
    float2 _1836 = float2(_344, _352);
    float3 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1836, float2(0.0), isnan(_1836))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1836, float2(0.0), isnan(_1836))).xyz;
    float _647 = _645.x;
    float _649 = _645.y;
    float _651 = _645.z;
    float2 _1850 = float2(_340, _342);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1850, float2(0.0), isnan(_1850)), level(_610)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1850, float2(0.0), isnan(_1850)), level(_610)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _1867 = float2(_574, _602);
    float3 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1867, float2(0.0), isnan(_1867))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1867, float2(0.0), isnan(_1867))).xyz;
    float _665 = _663.x;
    float _667 = _663.y;
    float _669 = _663.z;
    float2 _1881 = float2(_574, _600);
    float3 _671 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1881, float2(0.0), isnan(_1881))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1881, float2(0.0), isnan(_1881))).xyz;
    float _673 = _671.x;
    float _675 = _671.y;
    float _677 = _671.z;
    float2 _1895 = float2(_635, _633);
    float4 _679 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1895, float2(0.0), isnan(_1895))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1895, float2(0.0), isnan(_1895))).xyzw;
    float _681 = _679.x;
    float _683 = _679.y;
    float _685 = _679.z;
    float _687 = _679.w;
    float _689 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _691 = fma(_689, _372, _604);
    float _693 = fma(_689, _372, _606);
    float _695 = _500 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _697 = exp2(_695);
    float _699 = _621 * _621;
    float _701 = _625 * _627;
    float _703 = _699 * _699;
    float _705 = _703 * 16.0;
    float _707 = -_701;
    float _709 = fma(_639, _641, _707);
    float _711 = _647 * _649;
    float _713 = _627 * _705;
    float _715 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _717 = -_651;
    float _719 = _717 + 1.0;
    float _721 = _711 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _723 = _615 * _713;
    float _725 = _617 * _713;
    float _727 = _619 * _713;
    float _729 = -_627;
    float _731 = _729 + _641;
    float _733 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[0].x, _627);
    float _735 = -_697;
    float _737 = _735 + 1.0;
    float _739 = _737 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _741 = precise::max(_733, 1.52587890625e-05);
    float _743 = -_739;
    float _745 = _743 + 1.0;
    float _747 = _739 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _749 = 1.0 / _741;
    float _751 = abs(_745);
    float _753 = log2(_751);
    float _755 = _715 * _749;
    float _757 = _733 * _719;
    float _759 = _755 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _761 = _755 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _763 = _757 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _765 = _753 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _767 = _759 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _769 = _661 * _661;
    float _771 = _580 * _767;
    float _773 = exp2(_765);
    float _775 = _693 * _767;
    float _777 = _761 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _779 = -_763;
    float _781 = _779 + 1.0;
    float _783 = _598 * _767;
    float _785 = _769 * _769;
    float _787 = fma(_590, _777, _771);
    float _789 = fma(_691, _777, _775);
    float _791 = abs(_781);
    float _793 = log2(_791);
    float _795 = fma(_596, _777, _783);
    float _797 = _785 * 16.0;
    float _799 = _753 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _801 = _787 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _803 = _789 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _805 = _641 * _797;
    float _807 = _773 * _749;
    float _809 = _795 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _811 = exp2(_799);
    float _813 = -_723;
    float _815 = fma(_655, _805, _813);
    float _817 = -_725;
    float _819 = fma(_657, _805, _817);
    float _821 = _809 * 0.715200006961822509765625;
    float _823 = -_727;
    float _825 = fma(_659, _805, _823);
    float _827 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[0].x, _723);
    float _829 = _793 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _831 = fma(_801, 0.2125999927520751953125, _821);
    float _833 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[0].x, _725);
    float _835 = fma(_825, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _837 = _827 * _807;
    float _839 = fma(_803, 0.072200000286102294921875, _831);
    float _841 = _833 * _807;
    float _843 = exp2(_829);
    float _845 = _835 * _807;
    float _847 = -_809;
    float _849 = _847 + _839;
    float _851 = -_801;
    float _853 = _851 + _839;
    float _855 = -_803;
    float _857 = _855 + _839;
    float _859 = fma(_721, _849, _809);
    float _861 = fma(_721, _853, _801);
    float _863 = fma(_721, _857, _803);
    float _865 = _811 * _859;
    float _867 = _811 * _861;
    float _869 = _811 * _863;
    float _871 = _865 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _873 = _867 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _875 = -_843;
    float _877 = spvFAdd(_875, 1.00010001659393310546875);
    float _879 = -_843;
    float _881 = _879 + 1.0;
    float _883 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[27].y, _871);
    float _885 = fma(_837, (*spvDescriptorSet0.fp_c3)._m0[27].x, _873);
    float _887 = 1.0 / _877;
    float _889 = -_763;
    float _891 = _889 + _881;
    float _893 = _891 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _895 = _869 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _897 = fma(_667, _747, _883);
    float _899 = fma(_665, _747, _885);
    float _901 = _675 * _893;
    float _903 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[27].z, _895);
    float _905 = _673 * _893;
    float _907 = _677 * _893;
    float _909 = fma(_763, _897, _901);
    float _911 = fma(_669, _747, _903);
    float _913 = fma(_763, _899, _905);
    float _915 = _887 * _909;
    float _917 = fma(_763, _911, _907);
    float _919 = _887 * _913;
    float _921 = _915 * 0.715200006961822509765625;
    float _923 = _887 * _917;
    float _925 = fma(_919, 0.2125999927520751953125, _921);
    float _927 = fma(_923, 0.072200000286102294921875, _925);
    float _929 = 1.0 / _927;
    float _931 = _929 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _933 = precise::clamp(_931, 0.0, 1.0);
    float _935 = fma(_933, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _937 = _935 * _687;
    float _939 = fma(_919, _937, _681);
    float _941 = fma(_915, _937, _683);
    float _943 = fma(_923, _937, _685);
    out.m_46.x = _939;
    out.m_46.y = _941;
    out.m_46.z = _943;
    out.m_46.w = _881;
    return out;
}

