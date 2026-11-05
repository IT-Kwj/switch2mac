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
void _50(thread const int& _2299, thread const int& _2300, thread const int& _2301, thread const int& _2302, thread int& _2303, thread int& _2304, thread int& _2305, thread int& _2306, thread int& _2307)
{
    float _2310 = as_type<float>(_2301) + 0.0;
    bool _2312 = _2310 != 0.0;
    bool _2314 = isnan(_2310);
    bool _2316 = _2312 || _2314;
    bool _2318 = isnan(0.0);
    bool _2320 = _2316 || _2318;
    int _2322 = as_type<int>(_2310);
    int _2324 = _2300;
    int _2326 = _2320 ? (-1) : 0;
    if (!_2320)
    {
        float _2328 = as_type<float>(_2301) * 1.0;
        _2322 = as_type<int>(_2328);
    }
    int _2330 = _2322;
    bool _2332 = !_2320;
    int _2334 = _2330;
    if (!_2332)
    {
        float _2336 = as_type<float>(_2301) + 0.0;
        bool _2338 = _2336 >= 0.0;
        bool _2340 = isnan(_2336);
        bool _2342 = _2338 || _2340;
        bool _2344 = isnan(0.0);
        bool _2346 = _2342 || _2344;
        int _2348 = as_type<int>(_2336);
        _2326 = _2346 ? (-1) : 0;
        if (!_2346)
        {
            _2348 = 2147483647;
        }
        int _2350 = _2348;
        bool _2352 = !_2346;
        _2334 = _2350;
        if (!_2352)
        {
            float _2354 = abs(as_type<float>(_2301));
            float _2356 = _2354 + 0.0;
            bool _2358 = _2356 > as_type<float>(0x7f800000u /* inf */);
            bool _2360 = isnan(_2356);
            bool _2362 = _2358 || _2360;
            bool _2364 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2366 = _2362 || _2364;
            int _2368 = as_type<int>(_2356);
            _2326 = _2366 ? (-1) : 0;
            if (_2366)
            {
                float _2370 = as_type<float>(_2301) + 1.0;
                _2368 = as_type<int>(_2370);
            }
            int _2372 = _2368;
            _2334 = _2372;
            if (!_2366)
            {
                float _2374 = abs(as_type<float>(_2301));
                float _2376 = _2374 + (-0.0);
                float _2378 = 0.0 + _2376;
                bool _2380 = _2378 != as_type<float>(0x7f800000u /* inf */);
                bool _2382 = isnan(_2378);
                bool _2384 = _2380 || _2382;
                bool _2386 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2388 = _2384 || _2386;
                int _2390 = as_type<int>(_2378);
                _2326 = _2388 ? (-1) : 0;
                if (!_2388)
                {
                    _2390 = _2301;
                }
                int _2392 = _2390;
                bool _2394 = !_2388;
                _2334 = _2392;
                if (!_2394)
                {
                    float _2396 = as_type<float>(_2301) * 18446744073709551616.0;
                    float _2398 = rsqrt(_2396);
                    float _2400 = _2396 * _2398;
                    float _2402 = _2398 * 0.5;
                    float _2404 = -_2400;
                    float _2406 = 0.0 + _2404;
                    float _2408 = fma(_2402, _2406, 0.5);
                    float _2410 = fma(_2400, _2408, _2400);
                    float _2412 = -_2410;
                    float _2414 = 0.0 + _2412;
                    float _2416 = fma(_2410, _2414, _2396);
                    float _2418 = fma(_2402, _2416, _2410);
                    float _2420 = _2418 * 2.3283064365386962890625e-10;
                    _2334 = as_type<int>(_2420);
                    _2324 = as_type<int>(_2410);
                }
            }
        }
    }
    int _2422 = _2334;
    int _2424 = _2324;
    int _2426 = _2326;
    _2303 = _2422;
    _2304 = _2302;
    _2305 = 0;
    _2306 = _2424;
    _2307 = _2426;
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
    float _86 = fma(_80, _80, _84);
    float _88 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _90 = rsqrt(_86);
    float _92 = precise::max(0.0, _88);
    float _94 = _78 * _90;
    float _96 = _80 * _90;
    float _98 = _76 * _90;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = -_98;
    float _106 = -_92;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _110 = _100 * _100;
    float _112 = _102 * _102;
    float _114 = _110 + _112;
    float _116 = sqrt(_114);
    bool _120 = _116 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _122 = _88;
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
        int _228 = 0;
        int _230 = as_type<int>(_212);
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
    float2 _1308;
    _1308.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _1308.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _324 = _1308.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = -_98;
    float _332 = _330 + 1.0;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _200 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _338 = -_98;
    float _340 = _94 * _338;
    float _342 = -_336;
    float _344 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[11].y, _342);
    float _346 = abs(_334);
    float _348 = log2(_346);
    float _350 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _352 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _354 = -_202;
    float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[11].z, _344);
    float _358 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _360 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _362 = _98 * _358;
    float _364 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _366 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _362);
    float _368 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _370 = _348 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _372 = _98 * _352;
    float _374 = _98 * _350;
    float _376 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _372);
    float _378 = exp2(_370);
    float _380 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _374);
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _384 = -_96;
    float _386 = fma(_384, _364, _376);
    float _388 = fma(_96, _364, _376);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _392 = -_96;
    float _394 = fma(_392, _382, _380);
    float _396 = fma(_96, _382, _380);
    float _398 = -_96;
    float _400 = fma(_398, _390, _366);
    float _402 = fma(_96, _390, _366);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _408 = _378 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _410 = -_94;
    float _412 = fma(_410, _360, _386);
    float _414 = fma(_94, _360, _388);
    float _416 = -_94;
    float _418 = fma(_416, _404, _394);
    float _420 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _426 = fma(_94, _404, _396);
    float _428 = -_94;
    float _430 = fma(_428, _406, _400);
    float _432 = -_422;
    float _434 = _432 + 1.0;
    float _436 = fma(_424, _340, _418);
    float _438 = fma(_94, _406, _402);
    float _440 = _94 * _98;
    float _442 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _444 = abs(_434);
    float _446 = log2(_444);
    float _448 = fma(_356, -0.5, 0.5);
    float _450 = fma(_356, 0.5, 0.5);
    float _452 = in.m_44.x;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_44.y;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = fma(_442, _340, _412);
    float _466 = fma(_442, _440, _414);
    float _468 = fma(_424, _440, _426);
    float _470 = sqrt(_448);
    float _472 = fma(_368, _340, _430);
    float _474 = fma(_368, _440, _438);
    float _476 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _478 = _98 * _96;
    float _480 = fma(_450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _482 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _484 = _446 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _486 = -_96;
    float _488 = _98 * _486;
    float _490 = fma(_450, _480, -0.212114393711090087890625);
    float _492 = fma(_476, _478, _468);
    float _494 = fma(_482, _478, _466);
    float _496 = fma(_476, _488, _436);
    float _498 = exp2(_484);
    float _500 = _198 + 1.0;
    float _502 = fma(_450, _490, 1.570728778839111328125);
    float _504 = _470 * 0.636619746685028076171875;
    float _506 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _508 = fma(_482, _488, _464);
    float _510 = -_502;
    float _512 = fma(_504, _510, 1.0);
    float _514 = fma(_506, _488, _472);
    float _516 = fma(_506, _478, _474);
    float _518 = _74 * _462;
    float _520 = -_198;
    float _522 = fma(_498, _500, _520);
    float _524 = fma(_198, -0.5, 0.5);
    float _526 = fma(_522, 0.5, 0.5);
    float _528 = _74 * _456;
    float _530 = float(uint(_328));
    float _532 = _530 * 0.00390625;
    float2 _1639 = float2(_320, _322);
    float2 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1639, float2(0.0), isnan(_1639)), level(_532)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1639, float2(0.0), isnan(_1639)), level(_532)).xy;
    float _538 = _536.x;
    float _540 = _536.y;
    float2 _1654 = float2(_320, _322);
    float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1654, float2(0.0), isnan(_1654)), level(_532)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1654, float2(0.0), isnan(_1654)), level(_532)).xy;
    float _544 = _542.x;
    float _546 = _542.y;
    float2 _1667 = float2(_528, _518);
    float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1667, float2(0.0), isnan(_1667))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1667, float2(0.0), isnan(_1667))).xyz;
    float _552 = _550.x;
    float _554 = _550.y;
    float _556 = _550.z;
    float2 _1681 = float2(_320, _322);
    float4 _559 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1681, float2(0.0), isnan(_1681)), level(_532)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1681, float2(0.0), isnan(_1681)), level(_532)).xyzw;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _559.w;
    float2 _1698 = float2(_320, _322);
    float4 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1698, float2(0.0), isnan(_1698)), level(_532)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1698, float2(0.0), isnan(_1698)), level(_532)).xyzw;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _569.w;
    float2 _1715 = float2(_512, _526);
    float3 _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1715, float2(0.0), isnan(_1715))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1715, float2(0.0), isnan(_1715))).xyz;
    float _581 = _579.x;
    float _583 = _579.y;
    float _585 = _579.z;
    float2 _1729 = float2(_512, _524);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1729, float2(0.0), isnan(_1729))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1729, float2(0.0), isnan(_1729))).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float _595 = _94 * _96;
    float _597 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _599 = -_98;
    float _601 = fma(_599, _98, _276);
    float _603 = _446 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _605 = fma(_597, _595, _496);
    float _607 = fma(_597, _595, _492);
    float _609 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _611 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _613 = fma(_609, _595, _508);
    float _615 = fma(_609, _595, _494);
    float _617 = _96 * (-3.0);
    float _619 = fma(_274, 3.0, -1.0);
    float _621 = fma(_611, _595, _514);
    float _623 = -_96;
    float _625 = fma(_623, _617, -1.0);
    float _627 = fma(_611, _595, _516);
    float _629 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _633 = fma(_629, _625, _605);
    float _635 = fma(_629, _619, _607);
    float _637 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _639 = fma(_631, _625, _621);
    float _641 = fma(_637, _625, _613);
    float _643 = fma(_637, _619, _615);
    float _645 = fma(_631, _619, _627);
    float _647 = exp2(_603);
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _651 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _655 = fma(_649, _601, _633);
    float _657 = fma(_649, _601, _635);
    float _659 = fma(_651, _601, _641);
    float _661 = fma(_651, _601, _643);
    float _663 = fma(_653, _601, _639);
    float _665 = fma(_653, _601, _645);
    float _667 = -_647;
    float _669 = _667 + 1.0;
    float _671 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _673 = _671 + 1.0;
    float _675 = _669 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _677 = -_675;
    float _679 = _677 + 1.0;
    float _681 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _683 = -_540;
    float _685 = _683 + _546;
    float _687 = _552 * _554;
    float _689 = _567 * _567;
    float _691 = -_556;
    float _693 = _691 + 1.0;
    float _695 = fma(_552, _685, _540);
    float _697 = -_687;
    float _699 = _697 + 1.0;
    float _701 = _689 * _689;
    float _703 = precise::max(_695, 1.52587890625e-05);
    float _705 = fma(_699, _673, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _707 = _544 * _705;
    float _709 = 1.0 / _703;
    float _711 = _538 * _540;
    float _713 = _701 * 16.0;
    float _715 = -_711;
    float _717 = fma(_546, _707, _715);
    float _719 = _540 * _713;
    float _721 = _695 * _693;
    float _723 = abs(_679);
    float _725 = log2(_723);
    float _727 = fma(_552, _717, _711);
    float _729 = _561 * _719;
    float _731 = _563 * _719;
    float _733 = _721 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _735 = _565 * _719;
    float _737 = _727 * _709;
    float _739 = -_733;
    float _741 = _739 + 1.0;
    float _743 = _737 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _745 = _737 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _747 = _743 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _749 = _725 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _751 = _745 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _753 = _725 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _755 = _661 * _747;
    float _757 = _657 * _747;
    float _759 = exp2(_749);
    float _761 = _665 * _747;
    float _763 = fma(_659, _751, _755);
    float _765 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _767 = _765 + 1.0;
    float _769 = fma(_655, _751, _757);
    float _771 = fma(_663, _751, _761);
    float _773 = _763 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _775 = fma(_699, _767, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _777 = abs(_741);
    float _779 = log2(_777);
    float _781 = _769 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _783 = _773 * 0.715200006961822509765625;
    float _785 = _577 * _577;
    float _787 = _771 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _789 = _687 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _791 = fma(_781, 0.2125999927520751953125, _783);
    float _793 = _785 * _785;
    float _795 = _759 * _709;
    float _797 = exp2(_753);
    float _799 = fma(_787, 0.072200000286102294921875, _791);
    float _801 = _793 * 16.0;
    float _803 = -_773;
    float _805 = _803 + _799;
    float _807 = _775 * _801;
    float _809 = _779 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _811 = -_781;
    float _813 = _811 + _799;
    float _815 = fma(_789, _805, _773);
    float _817 = _575 * _807;
    float _819 = exp2(_809);
    float _821 = fma(_789, _813, _781);
    float _823 = _546 * _807;
    float _825 = -_735;
    float _827 = fma(_546, _817, _825);
    float _829 = -_787;
    float _831 = _829 + _799;
    float _833 = _797 * _815;
    float _835 = -_729;
    float _837 = fma(_571, _823, _835);
    float _839 = -_731;
    float _841 = fma(_573, _823, _839);
    float _843 = fma(_789, _831, _787);
    float _845 = _797 * _821;
    float _847 = fma(_552, _837, _729);
    float _849 = fma(_552, _841, _731);
    float _851 = fma(_552, _827, _735);
    float _853 = _833 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _855 = _797 * _843;
    float _857 = _849 * _795;
    float _859 = -_819;
    float _861 = spvFAdd(_859, 1.00010001659393310546875);
    float _863 = -_819;
    float _865 = _863 + 1.0;
    float _867 = _847 * _795;
    float _869 = fma(_857, (*spvDescriptorSet0.fp_c3)._m0[27].y, _853);
    float _871 = 1.0 / _861;
    float _873 = -_733;
    float _875 = _873 + _865;
    float _877 = _845 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _879 = _851 * _795;
    float _881 = _855 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _883 = _875 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _885 = fma(_867, (*spvDescriptorSet0.fp_c3)._m0[27].x, _877);
    float _887 = fma(_583, _681, _869);
    float _889 = fma(_879, (*spvDescriptorSet0.fp_c3)._m0[27].z, _881);
    float _891 = _591 * _883;
    float _893 = fma(_581, _681, _885);
    float _895 = _589 * _883;
    float _897 = fma(_585, _681, _889);
    float _899 = fma(_733, _887, _891);
    float _901 = _593 * _883;
    float _903 = fma(_733, _893, _895);
    float _905 = _871 * _899;
    float _907 = fma(_733, _897, _901);
    float _909 = _871 * _903;
    float _911 = _905 * 0.715200006961822509765625;
    float _913 = _871 * _907;
    float _915 = fma(_909, 0.2125999927520751953125, _911);
    float _917 = fma(_913, 0.072200000286102294921875, _915);
    float _919 = 1.0 / _917;
    float _921 = _919 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _923 = precise::clamp(_921, 0.0, 1.0);
    float _925 = fma(_923, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _927 = _909 * _925;
    float _929 = _905 * _925;
    float _931 = _913 * _925;
    out.m_42.x = _927;
    out.m_42.y = _929;
    out.m_42.z = _931;
    out.m_42.w = _865;
    return out;
}

