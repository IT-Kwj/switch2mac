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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _2274, thread const int& _2275, thread const int& _2276, thread const int& _2277, thread int& _2278, thread int& _2279, thread int& _2280, thread int& _2281, thread int& _2282, thread int& _2283)
{
    float _2286 = as_type<float>(_2276) + 0.0;
    bool _2288 = _2286 != 0.0;
    bool _2290 = isnan(_2286);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan(0.0);
    bool _2296 = _2292 || _2294;
    int _2298 = _2274;
    int _2300 = _2275;
    int _2302 = _2276;
    int _2304 = _2296 ? (-1) : 0;
    if (!_2296)
    {
        float _2306 = as_type<float>(_2276) * 1.0;
        _2298 = as_type<int>(_2306);
    }
    int _2308 = _2298;
    bool _2310 = !_2296;
    int _2312 = _2308;
    int _2314 = _2308;
    if (!_2310)
    {
        float _2316 = as_type<float>(_2276) + 0.0;
        bool _2318 = _2316 >= 0.0;
        bool _2320 = isnan(_2316);
        bool _2322 = _2318 || _2320;
        bool _2324 = isnan(0.0);
        bool _2326 = _2322 || _2324;
        _2304 = _2326 ? (-1) : 0;
        if (!_2326)
        {
            _2312 = 2147483647;
        }
        int _2328 = _2312;
        bool _2330 = !_2326;
        int _2332 = _2328;
        _2314 = _2328;
        if (!_2330)
        {
            float _2334 = abs(as_type<float>(_2276));
            float _2336 = _2334 + 0.0;
            bool _2338 = _2336 > as_type<float>(0x7f800000u /* inf */);
            bool _2340 = isnan(_2336);
            bool _2342 = _2338 || _2340;
            bool _2344 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2346 = _2342 || _2344;
            _2304 = _2346 ? (-1) : 0;
            if (_2346)
            {
                float _2348 = as_type<float>(_2276) + 1.0;
                _2332 = as_type<int>(_2348);
            }
            int _2350 = _2332;
            int _2352 = _2350;
            _2314 = _2350;
            if (!_2346)
            {
                float _2354 = abs(as_type<float>(_2276));
                float _2356 = _2354 + (-0.0);
                float _2358 = 0.0 + _2356;
                bool _2360 = _2358 != as_type<float>(0x7f800000u /* inf */);
                bool _2362 = isnan(_2358);
                bool _2364 = _2360 || _2362;
                bool _2366 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2368 = _2364 || _2366;
                _2304 = _2368 ? (-1) : 0;
                if (!_2368)
                {
                    _2352 = _2276;
                }
                int _2370 = _2352;
                bool _2372 = !_2368;
                _2314 = _2370;
                if (!_2372)
                {
                    float _2374 = as_type<float>(_2276) * 18446744073709551616.0;
                    float _2376 = rsqrt(_2374);
                    float _2378 = _2374 * _2376;
                    float _2380 = _2376 * 0.5;
                    float _2382 = -_2378;
                    float _2384 = 0.0 + _2382;
                    float _2386 = fma(_2380, _2384, 0.5);
                    float _2388 = fma(_2378, _2386, _2378);
                    float _2390 = -_2388;
                    float _2392 = 0.0 + _2390;
                    float _2394 = fma(_2388, _2392, _2374);
                    float _2396 = fma(_2380, _2394, _2388);
                    float _2398 = _2396 * 2.3283064365386962890625e-10;
                    _2314 = as_type<int>(_2398);
                    _2300 = as_type<int>(_2388);
                    _2302 = as_type<int>(_2384);
                }
            }
        }
    }
    int _2400 = _2314;
    int _2402 = _2300;
    int _2404 = _2302;
    int _2406 = _2304;
    _2278 = _2277;
    _2279 = 0;
    _2280 = _2400;
    _2281 = _2402;
    _2282 = _2404;
    _2283 = _2406;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _244 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _72 = precise::max(0.0, _70);
    float _74 = 1.0 / _50;
    float _76 = _74 * _56;
    float _78 = _74 * _62;
    float _80 = _74 * _68;
    float _82 = _76 * _76;
    float _84 = fma(_78, _78, _82);
    float _86 = fma(_80, _80, _84);
    float _88 = rsqrt(_86);
    float _90 = _78 * _88;
    float _92 = _80 * _88;
    float _94 = _76 * _88;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_72;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _88;
    float _120 = _72;
    float _122 = _104;
    float _124 = _96;
    float _126 = _98;
    if (!_116)
    {
        _118 = _108;
    }
    float _128 = _118;
    float _130 = _128;
    if (!_116)
    {
        _120 = _106;
    }
    float _132 = _120;
    bool _134 = !_116;
    float _136 = _132;
    if (!_134)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _140 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _142 = _112 + _140;
        float _144 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _146 = rsqrt(_110);
        float _148 = _142 * _138;
        float _150 = _148 * 0.15915493667125701904296875;
        float _152 = _150 * 6.283185482025146484375;
        float _154 = sin(_152);
        float _156 = _150 * 6.283185482025146484375;
        float _158 = cos(_156);
        float _160 = fma(_154, _144, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _162 = _146 * _160;
        float _164 = _158 + (-1.0);
        float _166 = _96 * _162;
        float _168 = _98 * _162;
        float _170 = _164 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _172 = _168 * _168;
        float _174 = fma(_104, _158, _170);
        float _176 = _166 * _166;
        _122 = _174;
        _136 = _176;
        _130 = _172;
        _124 = _166;
        _126 = _168;
    }
    float _178 = _122;
    float _180 = _136;
    float _182 = _130;
    float _184 = _124;
    float _186 = _126;
    float _188 = fma(_178, _178, _180);
    float _190 = _188 + _182;
    float _192 = rsqrt(_190);
    float _194 = _192 * _178;
    float _196 = _192 * _184;
    float _198 = _192 * _186;
    float _200 = -_194;
    float _202 = precise::max(0.0, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = fma(_202, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _212 = as_type<int>(_208) + (-218103808);
    float _214 = fma(_202, _210, -0.212114393711090087890625);
    bool _216 = uint(_212) >= 1920991232u;
    float _218 = fma(_202, _214, 1.570728778839111328125);
    bool _220 = !_216;
    float _242;
    if (!_220)
    {
        int _222 = 0;
        int _224 = 0;
        int _226 = as_type<int>(_208);
        int _228 = 1104;
        int _230;
        int _232;
        int _234;
        int _236;
        int _238;
        int _240;
        _46(_222, _224, _226, _228, _230, _232, _234, _236, _238, _240);
        _242 = as_type<float>(_234);
        _244 = true;
    }
    else
    {
        float _246 = rsqrt(_208);
        float _248 = _208 * _246;
        float _250 = _246 * 0.5;
        float _252 = -_248;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, 0.5);
        float _258 = fma(_248, _256, _248);
        float _260 = -_258;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, _208);
        float _266 = fma(_250, _264, _258);
        _242 = _266;
    }
    _244 = false;
    float _268 = _242;
    bool _270 = _194 > 0.0;
    float _272 = _92 * _92;
    float _274 = _90 * _90;
    float _276 = _272 + _274;
    if (_270)
    {
        discard_fragment();
    }
    float _278 = rsqrt(_276);
    float _280 = _218 * _268;
    float _282 = _280 * 0.636619746685028076171875;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_284;
    float _288 = _286 + 1.0;
    float _290 = sqrt(_288);
    float _292 = _92 * _278;
    float _294 = _90 * _278;
    float _296 = abs(_292);
    float _298 = abs(_294);
    float _300 = precise::max(_296, _298);
    float _302 = precise::max(_300, 9.9999997473787516355514526367188e-05);
    float _304 = -_290;
    float _306 = _304 + 1.0;
    float _308 = 1.0 / _302;
    float _310 = _306 * 0.5;
    float _312 = -_308;
    float _314 = _292 * _312;
    float _316 = _294 * _308;
    float _318 = fma(_314, _310, 0.5);
    float _320 = fma(_316, _310, 0.5);
    if (_270)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    float2 _1298;
    _1298.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    _1298.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    float _322 = _1298.x;
    float _324 = _322 * 256.0;
    int _326 = int(_324);
    float _328 = -_94;
    float _330 = _328 + 1.0;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _196 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _336 = in.m_40.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_40.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = abs(_332);
    float _350 = log2(_348);
    float _352 = _350 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _354 = exp2(_352);
    float _356 = _354 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = -_334;
    float _364 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[11].y, _362);
    float _366 = -_360;
    float _368 = _366 + 1.0;
    float _370 = -_198;
    float _372 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[11].z, _364);
    float _374 = fma(_372, -0.5, 0.5);
    float _376 = abs(_368);
    float _378 = log2(_376);
    float _380 = fma(_372, 0.5, 0.5);
    float _382 = fma(_380, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _384 = sqrt(_374);
    float _386 = fma(_380, _382, -0.212114393711090087890625);
    float _388 = fma(_380, _386, 1.570728778839111328125);
    float _390 = _74 * _340;
    float _392 = _194 + 1.0;
    float _394 = _378 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _396 = exp2(_394);
    float _398 = _384 * 0.636619746685028076171875;
    float _400 = _74 * _346;
    float _402 = -_388;
    float _404 = fma(_398, _402, 1.0);
    float2 _1415 = float2(_390, _400);
    float3 _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1415, float2(0.0), isnan(_1415))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1415, float2(0.0), isnan(_1415))).xyz;
    float _410 = _408.x;
    float _412 = _408.y;
    float _414 = _408.z;
    float _416 = -_194;
    float _418 = fma(_396, _392, _416);
    float _420 = fma(_418, 0.5, 0.5);
    float _422 = fma(_194, -0.5, 0.5);
    float _424 = float(uint(_326));
    float _426 = _424 * 0.00390625;
    float2 _1447 = float2(_318, _320);
    float2 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1447, float2(0.0), isnan(_1447)), level(_426)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1447, float2(0.0), isnan(_1447)), level(_426)).xy;
    float _432 = _430.x;
    float _434 = _430.y;
    float2 _1460 = float2(_318, _320);
    float4 _437 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1460, float2(0.0), isnan(_1460)), level(_426)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1460, float2(0.0), isnan(_1460)), level(_426)).xyzw;
    float _439 = _437.x;
    float _441 = _437.y;
    float _443 = _437.z;
    float _445 = _437.w;
    float2 _1477 = float2(_404, _420);
    float3 _447 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1477, float2(0.0), isnan(_1477))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1477, float2(0.0), isnan(_1477))).xyz;
    float _449 = _447.x;
    float _451 = _447.y;
    float _453 = _447.z;
    float2 _1491 = float2(_404, _422);
    float3 _455 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1491, float2(0.0), isnan(_1491))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1491, float2(0.0), isnan(_1491))).xyz;
    float _457 = _455.x;
    float _459 = _455.y;
    float _461 = _455.z;
    float _463 = _378 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _465 = -_94;
    float _467 = fma(_465, _94, _274);
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _471 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _473 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _475 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _477 = _94 * _469;
    float _479 = _94 * _471;
    float _481 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _483 = _94 * _473;
    float _485 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _477);
    float _487 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _479);
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _491 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _483);
    float _493 = -_92;
    float _495 = fma(_493, _481, _485);
    float _497 = fma(_92, _481, _485);
    float _499 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _501 = -_92;
    float _503 = fma(_501, _475, _487);
    float _505 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _507 = fma(_92, _475, _487);
    float _509 = -_90;
    float _511 = fma(_509, _499, _495);
    float _513 = fma(_90, _499, _497);
    float _515 = -_90;
    float _517 = fma(_515, _489, _503);
    float _519 = -_92;
    float _521 = fma(_519, _505, _491);
    float _523 = fma(_90, _489, _507);
    float _525 = fma(_92, _505, _491);
    float _527 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _529 = -_94;
    float _531 = _90 * _529;
    float _533 = _90 * _94;
    float _535 = -_90;
    float _537 = fma(_535, _527, _521);
    float _539 = fma(_90, _527, _525);
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _543 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _545 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _547 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _549 = fma(_541, _531, _511);
    float _551 = fma(_541, _533, _513);
    float _553 = fma(_543, _531, _517);
    float _555 = fma(_545, _531, _537);
    float _557 = _194 * (-10000.0);
    float _559 = fma(_543, _533, _523);
    float _561 = fma(_545, _533, _539);
    float _563 = -_92;
    float _565 = _94 * _563;
    float _567 = _94 * _92;
    float _569 = abs(_557);
    bool _571 = _569 > 0.00999999977648258209228515625;
    float _573 = exp2(_463);
    float _575 = fma(_547, _565, _549);
    float _577 = fma(_547, _567, _551);
    float _579 = _571 ? _557 : 0.00999999977648258209228515625;
    float _581 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _583 = fma(_581, _565, _553);
    float _585 = fma(_581, _567, _559);
    float _587 = _579 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _589 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _591 = fma(_589, _567, _561);
    float _593 = precise::max(_587, -127.0);
    float _595 = fma(_589, _565, _555);
    float _597 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _599 = _194 * _597;
    float _601 = -_593;
    float _603 = exp2(_601);
    float _605 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _607 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[26].x, _599);
    float _609 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _611 = -_414;
    float _613 = _611 + 1.0;
    float _615 = -_605;
    float _617 = exp2(_615);
    float _619 = _410 * _412;
    float _621 = -_603;
    float _623 = _621 + 1.0;
    float _625 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].z, _607);
    float _627 = _90 * _92;
    float _629 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _631 = fma(_609, _627, _595);
    float _633 = fma(_609, _627, _591);
    float _635 = fma(_625, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _637 = _617 * _623;
    float _639 = fma(_629, _627, _575);
    float _641 = fma(_629, _627, _577);
    float _643 = fma(_635, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _645 = 1.0 / _593;
    float _647 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _649 = _92 * (-3.0);
    float _651 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _653 = fma(_651, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _655 = fma(_647, _627, _583);
    float _657 = fma(_647, _627, _585);
    float _659 = abs(_643);
    float _661 = log2(_659);
    float _663 = -_92;
    float _665 = fma(_663, _649, -1.0);
    float _667 = fma(_272, 3.0, -1.0);
    float _669 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _671 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _673 = fma(_669, _665, _639);
    float _675 = fma(_669, _667, _641);
    float _677 = _637 * _645;
    float _679 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _681 = fma(_671, _665, _631);
    float _683 = fma(_671, _667, _633);
    float _685 = fma(_679, _665, _655);
    float _687 = _661 * 1.5;
    float _689 = -_573;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, _667, _657);
    float _695 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _697 = exp2(_687);
    float _699 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _701 = _691 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _703 = fma(_695, _467, _685);
    float _705 = fma(_695, _467, _693);
    float _707 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _709 = -_701;
    float _711 = _709 + 1.0;
    float _713 = fma(_699, _467, _673);
    float _715 = fma(_699, _467, _675);
    float _717 = fma(_707, _467, _681);
    float _719 = fma(_707, _467, _683);
    float _721 = abs(_711);
    float _723 = log2(_721);
    float _725 = _697 * 12.56637096405029296875;
    float _727 = _434 * _613;
    float _729 = _432 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _731 = _432 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _733 = _723 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _735 = _727 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _737 = _729 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _739 = _731 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _741 = _723 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _743 = -_735;
    float _745 = _743 + 1.0;
    float _747 = _705 * _737;
    float _749 = _715 * _737;
    float _751 = _719 * _737;
    float _753 = exp2(_733);
    float _755 = fma(_703, _739, _747);
    float _757 = fma(_713, _739, _749);
    float _759 = fma(_717, _739, _751);
    float _761 = _445 * _445;
    float _763 = _755 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _765 = _757 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _767 = _759 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _769 = abs(_745);
    float _771 = log2(_769);
    float _773 = _763 * 0.715200006961822509765625;
    float _775 = _619 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _777 = _761 * _761;
    float _779 = fma(_765, 0.2125999927520751953125, _773);
    float _781 = _777 * 16.0;
    float _783 = exp2(_741);
    float _785 = fma(_767, 0.072200000286102294921875, _779);
    float _787 = _753 * _781;
    float _789 = -_765;
    float _791 = _789 + _785;
    float _793 = _441 * _787;
    float _795 = _771 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _797 = -_763;
    float _799 = _797 + _785;
    float _801 = fma(_775, _791, _765);
    float _803 = -_767;
    float _805 = _803 + _785;
    float _807 = _439 * _787;
    float _809 = fma(_775, _799, _763);
    float _811 = exp2(_795);
    float _813 = fma(_775, _805, _767);
    float _815 = _783 * _801;
    float _817 = _783 * _809;
    float _819 = _443 * _787;
    float _821 = _783 * _813;
    float _823 = _815 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _825 = _817 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _827 = _701 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _829 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[27].x, _823);
    float _831 = fma(_793, (*spvDescriptorSet0.fp_c3)._m0[27].y, _825);
    float _833 = _821 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _835 = 1.0 / _725;
    float _837 = fma(_449, _827, _829);
    float _839 = fma(_451, _827, _831);
    float _841 = -_811;
    float _843 = spvFAdd(_841, 1.00010001659393310546875);
    float _845 = -_811;
    float _847 = _845 + 1.0;
    float _849 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[27].z, _833);
    float _851 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _853 = -_735;
    float _855 = _853 + _847;
    float _857 = 1.0 / _843;
    float _859 = fma(_453, _827, _849);
    float _861 = _677 * _851;
    float _863 = _855 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _865 = _459 * _863;
    float _867 = _457 * _863;
    float _869 = _461 * _863;
    float _871 = -_861;
    float _873 = exp2(_871);
    float _875 = fma(_735, _839, _865);
    float _877 = fma(_735, _837, _867);
    float _879 = fma(_735, _859, _869);
    float _881 = _653 * _835;
    float _883 = _857 * _875;
    float _885 = _857 * _877;
    float _887 = _857 * _879;
    float _889 = _883 * 0.715200006961822509765625;
    float _891 = fma(_885, 0.2125999927520751953125, _889);
    float _893 = -_873;
    float _895 = _893 + 1.0;
    float _897 = fma(_887, 0.072200000286102294921875, _891);
    float _899 = _881 * _895;
    float _901 = 1.0 / _897;
    float _903 = _899 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _905 = _899 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _907 = _901 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _909 = precise::clamp(_907, 0.0, 1.0);
    float _911 = fma(_909, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _913 = _899 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _915 = _873 * _911;
    float _917 = fma(_885, _915, _913);
    float _919 = fma(_883, _915, _903);
    float _921 = fma(_887, _915, _905);
    out.m_38.x = _917;
    out.m_38.y = _919;
    out.m_38.z = _921;
    out.m_38.w = _847;
    return out;
}

