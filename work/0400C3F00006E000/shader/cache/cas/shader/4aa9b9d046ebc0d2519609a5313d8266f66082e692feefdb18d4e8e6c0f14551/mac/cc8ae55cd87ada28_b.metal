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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _2319, thread const int& _2320, thread const int& _2321, thread const int& _2322, thread int& _2323, thread int& _2324, thread int& _2325, thread int& _2326, thread int& _2327)
{
    float _2330 = as_type<float>(_2321) + 0.0;
    bool _2332 = _2330 != 0.0;
    bool _2334 = isnan(_2330);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(0.0);
    bool _2340 = _2336 || _2338;
    int _2342 = as_type<int>(_2330);
    int _2344 = _2320;
    int _2346 = _2340 ? (-1) : 0;
    if (!_2340)
    {
        float _2348 = as_type<float>(_2321) * 1.0;
        _2342 = as_type<int>(_2348);
    }
    int _2350 = _2342;
    bool _2352 = !_2340;
    int _2354 = _2350;
    if (!_2352)
    {
        float _2356 = as_type<float>(_2321) + 0.0;
        bool _2358 = _2356 >= 0.0;
        bool _2360 = isnan(_2356);
        bool _2362 = _2358 || _2360;
        bool _2364 = isnan(0.0);
        bool _2366 = _2362 || _2364;
        int _2368 = as_type<int>(_2356);
        _2346 = _2366 ? (-1) : 0;
        if (!_2366)
        {
            _2368 = 2147483647;
        }
        int _2370 = _2368;
        bool _2372 = !_2366;
        _2354 = _2370;
        if (!_2372)
        {
            float _2374 = abs(as_type<float>(_2321));
            float _2376 = _2374 + 0.0;
            bool _2378 = _2376 > as_type<float>(0x7f800000u /* inf */);
            bool _2380 = isnan(_2376);
            bool _2382 = _2378 || _2380;
            bool _2384 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2386 = _2382 || _2384;
            int _2388 = as_type<int>(_2376);
            _2346 = _2386 ? (-1) : 0;
            if (_2386)
            {
                float _2390 = as_type<float>(_2321) + 1.0;
                _2388 = as_type<int>(_2390);
            }
            int _2392 = _2388;
            _2354 = _2392;
            if (!_2386)
            {
                float _2394 = abs(as_type<float>(_2321));
                float _2396 = _2394 + (-0.0);
                float _2398 = 0.0 + _2396;
                bool _2400 = _2398 != as_type<float>(0x7f800000u /* inf */);
                bool _2402 = isnan(_2398);
                bool _2404 = _2400 || _2402;
                bool _2406 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2408 = _2404 || _2406;
                int _2410 = as_type<int>(_2398);
                _2346 = _2408 ? (-1) : 0;
                if (!_2408)
                {
                    _2410 = _2321;
                }
                int _2412 = _2410;
                bool _2414 = !_2408;
                _2354 = _2412;
                if (!_2414)
                {
                    float _2416 = as_type<float>(_2321) * 18446744073709551616.0;
                    float _2418 = rsqrt(_2416);
                    float _2420 = _2416 * _2418;
                    float _2422 = _2418 * 0.5;
                    float _2424 = -_2420;
                    float _2426 = 0.0 + _2424;
                    float _2428 = fma(_2422, _2426, 0.5);
                    float _2430 = fma(_2420, _2428, _2420);
                    float _2432 = -_2430;
                    float _2434 = 0.0 + _2432;
                    float _2436 = fma(_2430, _2434, _2416);
                    float _2438 = fma(_2422, _2436, _2430);
                    float _2440 = _2438 * 2.3283064365386962890625e-10;
                    _2354 = as_type<int>(_2440);
                    _2344 = as_type<int>(_2430);
                }
            }
        }
    }
    int _2442 = _2354;
    int _2444 = _2344;
    int _2446 = _2346;
    _2323 = _2442;
    _2324 = _2322;
    _2325 = 0;
    _2326 = _2444;
    _2327 = _2446;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _242 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_37.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_37.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_37.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _72;
    float _80 = fma(_74, _74, _78);
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _84 = fma(_76, _76, _80);
    float _86 = precise::max(0.0, _82);
    float _88 = rsqrt(_84);
    float _90 = _74 * _88;
    float _92 = _76 * _88;
    float _94 = _72 * _88;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_86;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _86;
    float _120 = _88;
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
    float _240;
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
        _46(_222, _224, _226, _228, _230, _232, _234, _236, _238);
        _240 = as_type<float>(_230);
        _242 = true;
    }
    else
    {
        float _244 = rsqrt(_208);
        float _246 = _208 * _244;
        float _248 = _244 * 0.5;
        float _250 = -_246;
        float _252 = 0.0 + _250;
        float _254 = fma(_248, _252, 0.5);
        float _256 = fma(_246, _254, _246);
        float _258 = -_256;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, _208);
        float _264 = fma(_248, _262, _256);
        _240 = _264;
    }
    _242 = false;
    float _266 = _240;
    bool _268 = _194 > 0.0;
    float _270 = _92 * _92;
    float _272 = _90 * _90;
    float _274 = _270 + _272;
    if (_268)
    {
        discard_fragment();
    }
    float _276 = rsqrt(_274);
    float _278 = _218 * _266;
    float _280 = _278 * 0.636619746685028076171875;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = -_282;
    float _286 = _284 + 1.0;
    float _288 = sqrt(_286);
    float _290 = _92 * _276;
    float _292 = _90 * _276;
    float _294 = abs(_290);
    float _296 = abs(_292);
    float _298 = precise::max(_294, _296);
    float _300 = precise::max(_298, 9.9999997473787516355514526367188e-05);
    float _302 = -_288;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _300;
    float _308 = _304 * 0.5;
    float _310 = -_306;
    float _312 = _290 * _310;
    float _314 = _292 * _306;
    float _316 = fma(_312, _308, 0.5);
    float _318 = fma(_314, _308, 0.5);
    if (_268)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float2 _1308;
    _1308.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    _1308.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    float _320 = _1308.x;
    float _322 = _320 * 256.0;
    int _324 = int(_322);
    float _326 = -_94;
    float _328 = _326 + 1.0;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = -_92;
    float _334 = _94 * _332;
    float _336 = _94 * _92;
    float _338 = abs(_330);
    float _340 = log2(_338);
    float _342 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _344 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _346 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _348 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _350 = _94 * _342;
    float _352 = _94 * _344;
    float _354 = _94 * _346;
    float _356 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _350);
    float _358 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _360 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _354);
    float _362 = -_92;
    float _364 = fma(_362, _348, _356);
    float _366 = fma(_92, _348, _356);
    float _368 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _370 = _340 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _372 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _352);
    float _374 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _376 = -_92;
    float _378 = fma(_376, _368, _360);
    float _380 = fma(_92, _368, _360);
    float _382 = -_92;
    float _384 = fma(_382, _358, _372);
    float _386 = exp2(_370);
    float _388 = fma(_92, _358, _372);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _394 = -_90;
    float _396 = fma(_394, _374, _384);
    float _398 = fma(_90, _374, _388);
    float _400 = -_90;
    float _402 = fma(_400, _390, _364);
    float _404 = fma(_90, _390, _366);
    float _406 = _196 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _408 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _410 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _412 = -_406;
    float _414 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[11].y, _412);
    float _416 = _90 * _94;
    float _418 = _386 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _420 = -_198;
    float _422 = fma(_420, (*spvDescriptorSet0.fp_c3)._m0[11].z, _414);
    float _424 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = -_90;
    float _430 = fma(_428, _392, _378);
    float _432 = fma(_90, _392, _380);
    float _434 = -_94;
    float _436 = _90 * _434;
    float _438 = -_426;
    float _440 = _438 + 1.0;
    float _442 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _444 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _446 = fma(_408, _436, _430);
    float _448 = fma(_442, _436, _402);
    float _450 = abs(_440);
    float _452 = log2(_450);
    float _454 = fma(_442, _416, _404);
    float _456 = fma(_422, -0.5, 0.5);
    float _458 = fma(_422, 0.5, 0.5);
    float _460 = fma(_444, _436, _396);
    float _462 = fma(_444, _416, _398);
    float _464 = fma(_458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _466 = fma(_408, _416, _432);
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _470 = sqrt(_456);
    float _472 = fma(_458, _464, -0.212114393711090087890625);
    float _474 = fma(_468, _334, _448);
    float _476 = fma(_468, _336, _454);
    float _478 = fma(_458, _472, 1.570728778839111328125);
    float _480 = _452 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _482 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _484 = fma(_482, _334, _460);
    float _486 = exp2(_480);
    float _488 = _194 + 1.0;
    float _490 = fma(_482, _336, _462);
    float _492 = fma(_410, _334, _446);
    float _494 = fma(_410, _336, _466);
    float _496 = _470 * 0.636619746685028076171875;
    float _498 = -_478;
    float _500 = fma(_496, _498, 1.0);
    float _502 = -_194;
    float _504 = fma(_486, _488, _502);
    float _506 = fma(_504, 0.5, 0.5);
    float _508 = fma(_194, -0.5, 0.5);
    float _510 = float(uint(_324));
    float _512 = _510 * 0.00390625;
    float2 _1619 = float2(_316, _318);
    float2 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1619, float2(0.0), isnan(_1619)), level(_512)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1619, float2(0.0), isnan(_1619)), level(_512)).xy;
    float _518 = _516.x;
    float _520 = _516.y;
    float2 _1634 = float2(_316, _318);
    float2 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1634, float2(0.0), isnan(_1634)), level(_512)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1634, float2(0.0), isnan(_1634)), level(_512)).xy;
    float _524 = _522.x;
    float _526 = _522.y;
    float2 _1647 = float2(_316, _318);
    float4 _529 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1647, float2(0.0), isnan(_1647)), level(_512)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1647, float2(0.0), isnan(_1647)), level(_512)).xyzw;
    float _531 = _529.x;
    float _533 = _529.y;
    float _535 = _529.z;
    float _537 = _529.w;
    float2 _1664 = float2(_316, _318);
    float4 _539 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1664, float2(0.0), isnan(_1664)), level(_512)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1664, float2(0.0), isnan(_1664)), level(_512)).xyzw;
    float _541 = _539.x;
    float _543 = _539.y;
    float _545 = _539.z;
    float _547 = _539.w;
    float2 _1681 = float2(_500, _506);
    float3 _551 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1681, float2(0.0), isnan(_1681))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1681, float2(0.0), isnan(_1681))).xyz;
    float _553 = _551.x;
    float _555 = _551.y;
    float _557 = _551.z;
    float2 _1695 = float2(_500, _508);
    float3 _559 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1695, float2(0.0), isnan(_1695))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1695, float2(0.0), isnan(_1695))).xyz;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _90 * _92;
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _571 = _452 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _573 = -_94;
    float _575 = fma(_573, _94, _272);
    float _577 = fma(_569, _567, _476);
    float _579 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _581 = fma(_569, _567, _474);
    float _583 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _585 = exp2(_571);
    float _587 = fma(_579, _567, _494);
    float _589 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _591 = _194 * _589;
    float _593 = fma(_579, _567, _492);
    float _595 = fma(_583, _567, _484);
    float _597 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[26].x, _591);
    float _599 = _92 * (-3.0);
    float _601 = fma(_583, _567, _490);
    float _603 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _605 = -_92;
    float _607 = fma(_605, _599, -1.0);
    float _609 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].z, _597);
    float _611 = fma(_603, _607, _595);
    float _613 = -_585;
    float _615 = _613 + 1.0;
    float _617 = fma(_270, 3.0, -1.0);
    float _619 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _621 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _623 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _625 = fma(_603, _617, _601);
    float _627 = fma(_619, _607, _581);
    float _629 = fma(_619, _617, _577);
    float _631 = _194 * (-10000.0);
    float _633 = fma(_621, _607, _593);
    float _635 = -_623;
    float _637 = exp2(_635);
    float _639 = fma(_621, _617, _587);
    float _641 = abs(_631);
    bool _643 = _641 > 0.00999999977648258209228515625;
    float _645 = fma(_609, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _647 = _643 ? _631 : 0.00999999977648258209228515625;
    float _649 = fma(_645, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _651 = _647 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _653 = abs(_649);
    float _655 = log2(_653);
    float _657 = precise::max(_651, -127.0);
    float _659 = -_657;
    float _661 = exp2(_659);
    float _663 = 1.0 / _657;
    float _665 = _655 * 1.5;
    float _667 = -_661;
    float _669 = _667 + 1.0;
    float _671 = exp2(_665);
    float _673 = _637 * _669;
    float _675 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _677 = _673 * _663;
    float _679 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _683 = fma(_675, _575, _627);
    float _685 = fma(_675, _575, _629);
    float _687 = fma(_679, _575, _611);
    float _689 = fma(_679, _575, _625);
    float _691 = _615 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _693 = fma(_681, _575, _633);
    float _695 = _671 * 12.56637096405029296875;
    float _697 = fma(_681, _575, _639);
    float _699 = -_691;
    float _701 = _699 + 1.0;
    float _703 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _705 = 1.0 / _695;
    float _707 = abs(_701);
    float _709 = log2(_707);
    float _711 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _713 = fma(_711, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _715 = _713 * _705;
    float _717 = _709 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _719 = _518 * _520;
    float _721 = -_520;
    float _723 = _721 + _526;
    float _725 = _537 * _537;
    float _727 = _547 * _547;
    float _729 = -_719;
    float _731 = fma(_524, _526, _729);
    float _733 = fma(_723, (*spvDescriptorSet0.fp_c3)._m0[0].x, _520);
    float _735 = _725 * _725;
    float _737 = _727 * _727;
    float _739 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[0].x, _719);
    float _741 = precise::max(_733, 1.52587890625e-05);
    float _743 = _733 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _745 = _735 * 16.0;
    float _747 = exp2(_717);
    float _749 = -_743;
    float _751 = _749 + 1.0;
    float _753 = _520 * _745;
    float _755 = _533 * _753;
    float _757 = 1.0 / _741;
    float _759 = _531 * _753;
    float _761 = _535 * _753;
    float _763 = _709 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _765 = _737 * 16.0;
    float _767 = abs(_751);
    float _769 = log2(_767);
    float _771 = _526 * _765;
    float _773 = -_755;
    float _775 = fma(_543, _771, _773);
    float _777 = -_759;
    float _779 = fma(_541, _771, _777);
    float _781 = -_761;
    float _783 = fma(_545, _771, _781);
    float _785 = _739 * _757;
    float _787 = exp2(_763);
    float _789 = _747 * _757;
    float _791 = fma(_775, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _793 = _785 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _795 = _785 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _797 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[0].x, _759);
    float _799 = _791 * _789;
    float _801 = _793 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _803 = _795 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _805 = _769 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _807 = fma(_783, (*spvDescriptorSet0.fp_c3)._m0[0].x, _761);
    float _809 = _685 * _801;
    float _811 = _689 * _801;
    float _813 = _697 * _801;
    float _815 = _797 * _789;
    float _817 = fma(_683, _803, _809);
    float _819 = fma(_687, _803, _811);
    float _821 = exp2(_805);
    float _823 = fma(_693, _803, _813);
    float _825 = _817 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _827 = _819 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _829 = _807 * _789;
    float _831 = _823 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _833 = _787 * _825;
    float _835 = _787 * _827;
    float _837 = _787 * _831;
    float _839 = _833 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _841 = _835 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _843 = _837 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _845 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[27].x, _839);
    float _847 = fma(_799, (*spvDescriptorSet0.fp_c3)._m0[27].y, _841);
    float _849 = -_821;
    float _851 = spvFAdd(_849, 1.00010001659393310546875);
    float _853 = -_821;
    float _855 = _853 + 1.0;
    float _857 = fma(_555, _703, _847);
    float _859 = 1.0 / _851;
    float _861 = -_743;
    float _863 = _861 + _855;
    float _865 = fma(_829, (*spvDescriptorSet0.fp_c3)._m0[27].z, _843);
    float _867 = fma(_553, _703, _845);
    float _869 = _863 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _871 = fma(_557, _703, _865);
    float _873 = _563 * _869;
    float _875 = _561 * _869;
    float _877 = fma(_743, _857, _873);
    float _879 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _881 = _565 * _869;
    float _883 = fma(_743, _867, _875);
    float _885 = _859 * _877;
    float _887 = _677 * _879;
    float _889 = fma(_743, _871, _881);
    float _891 = _859 * _883;
    float _893 = _885 * 0.715200006961822509765625;
    float _895 = -_887;
    float _897 = exp2(_895);
    float _899 = _859 * _889;
    float _901 = fma(_891, 0.2125999927520751953125, _893);
    float _903 = fma(_899, 0.072200000286102294921875, _901);
    float _905 = 1.0 / _903;
    float _907 = -_897;
    float _909 = _907 + 1.0;
    float _911 = _715 * _909;
    float _913 = _911 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _915 = _905 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _917 = precise::clamp(_915, 0.0, 1.0);
    float _919 = fma(_917, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _921 = _911 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _923 = _897 * _919;
    float _925 = _911 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _927 = fma(_891, _923, _913);
    float _929 = fma(_885, _923, _925);
    float _931 = fma(_899, _923, _921);
    out.m_40.x = _927;
    out.m_40.y = _929;
    out.m_40.z = _931;
    out.m_40.w = _855;
    return out;
}

