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
    texture2d<float> fp_t_tcb_12 [[id(3)]];
    sampler fp_t_tcb_12Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_12Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_ESmplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _52(thread const int& _2226, thread const int& _2227, thread const int& _2228, thread const int& _2229, thread const int& _2230, thread int& _2231, thread int& _2232, thread int& _2233, thread int& _2234, thread int& _2235, thread int& _2236)
{
    float _2239 = as_type<float>(_2229) + 0.0;
    bool _2241 = _2239 != 0.0;
    bool _2243 = isnan(_2239);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    int _2251 = as_type<int>(_2239);
    int _2253 = 0;
    int _2255 = _2226;
    int _2257 = _2249 ? (-1) : 0;
    if (!_2249)
    {
        float _2259 = as_type<float>(_2229) * 1.0;
        _2251 = as_type<int>(_2259);
    }
    int _2261 = _2251;
    bool _2263 = !_2249;
    int _2265 = _2261;
    if (!_2263)
    {
        float _2267 = as_type<float>(_2229) + 0.0;
        bool _2269 = _2267 >= 0.0;
        bool _2271 = isnan(_2267);
        bool _2273 = _2269 || _2271;
        bool _2275 = isnan(0.0);
        bool _2277 = _2273 || _2275;
        int _2279 = as_type<int>(_2267);
        _2257 = _2277 ? (-1) : 0;
        if (!_2277)
        {
            _2279 = 2147483647;
        }
        int _2281 = _2279;
        bool _2283 = !_2277;
        _2265 = _2281;
        if (!_2283)
        {
            float _2285 = abs(as_type<float>(_2229));
            float _2287 = _2285 + 0.0;
            bool _2289 = _2287 > as_type<float>(0x7f800000u /* inf */);
            bool _2291 = isnan(_2287);
            bool _2293 = _2289 || _2291;
            bool _2295 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2297 = _2293 || _2295;
            int _2299 = as_type<int>(_2287);
            _2253 = 2139095040;
            _2257 = _2297 ? (-1) : 0;
            if (_2297)
            {
                float _2301 = as_type<float>(_2229) + 1.0;
                _2299 = as_type<int>(_2301);
            }
            int _2303 = _2299;
            _2265 = _2303;
            if (!_2297)
            {
                float _2305 = abs(as_type<float>(_2229));
                float _2307 = _2305 + (-0.0);
                float _2309 = 0.0 + _2307;
                bool _2311 = _2309 != as_type<float>(0x7f800000u /* inf */);
                bool _2313 = isnan(_2309);
                bool _2315 = _2311 || _2313;
                bool _2317 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2319 = _2315 || _2317;
                int _2321 = as_type<int>(_2309);
                _2257 = _2319 ? (-1) : 0;
                if (!_2319)
                {
                    _2321 = _2229;
                }
                int _2323 = _2321;
                bool _2325 = !_2319;
                _2265 = _2323;
                if (!_2325)
                {
                    float _2327 = as_type<float>(_2229) * 18446744073709551616.0;
                    float _2329 = rsqrt(_2327);
                    float _2331 = _2327 * _2329;
                    float _2333 = _2329 * 0.5;
                    float _2335 = -_2331;
                    float _2337 = 0.0 + _2335;
                    float _2339 = fma(_2333, _2337, 0.5);
                    float _2341 = fma(_2331, _2339, _2331);
                    float _2343 = -_2341;
                    float _2345 = 0.0 + _2343;
                    float _2347 = fma(_2341, _2345, _2327);
                    float _2349 = fma(_2333, _2347, _2341);
                    float _2351 = _2349 * 2.3283064365386962890625e-10;
                    _2265 = as_type<int>(_2351);
                    _2253 = as_type<int>(_2327);
                    _2255 = as_type<int>(_2347);
                }
            }
        }
    }
    int _2353 = _2265;
    int _2355 = _2253;
    int _2357 = _2255;
    int _2359 = _2257;
    _2231 = _2353;
    _2232 = _2355;
    _2233 = _2357;
    _2234 = _2230;
    _2235 = 0;
    _2236 = _2359;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _252 = false;
    float _56 = gl_FragCoord.w;
    float _58 = in.m_41.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_41.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_41.z;
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
    float _124 = _78;
    float _126 = _94;
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
    float _250;
    if (!_226)
    {
        int _228 = 0;
        int _230 = 0;
        int _232 = 0;
        int _234 = as_type<int>(_214);
        int _236 = 1104;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        _52(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246, _248);
        _250 = as_type<float>(_238);
        _252 = true;
    }
    else
    {
        float _254 = rsqrt(_214);
        float _256 = _214 * _254;
        float _258 = _254 * 0.5;
        float _260 = -_256;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, 0.5);
        float _266 = fma(_256, _264, _256);
        float _268 = -_266;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, _214);
        float _274 = fma(_258, _272, _266);
        _250 = _274;
    }
    _252 = false;
    float _276 = _250;
    bool _278 = _200 > 0.0;
    float _280 = _224 * _276;
    float _282 = _98 * _98;
    float _284 = _96 * _96;
    float _286 = _280 * 0.636619746685028076171875;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    if (_278)
    {
        discard_fragment();
    }
    float _290 = -_288;
    float _292 = _290 + 1.0;
    float _294 = _282 + _284;
    float _296 = sqrt(_292);
    float _298 = rsqrt(_294);
    float _300 = -_296;
    float _302 = _300 + 1.0;
    float _304 = _302 * 0.5;
    float _306 = _98 * _298;
    float _308 = _96 * _298;
    float _310 = abs(_306);
    float _312 = abs(_308);
    float _314 = precise::max(_310, _312);
    if (_278)
    {
        out.m_44.x = 0.0;
        out.m_44.y = 0.0;
        out.m_44.z = 0.0;
        out.m_44.w = 0.0;
        return out;
    }
    float _316 = precise::max(_314, 9.9999997473787516355514526367188e-05);
    float _318 = in.m_46.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_46.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = 1.0 / _316;
    float _332 = -_330;
    float _334 = _306 * _332;
    float _336 = _308 * _330;
    float _338 = fma(_334, _304, 0.5);
    float _340 = fma(_336, _304, 0.5);
    float2 _1290;
    _1290.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    _1290.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    float _342 = _1290.x;
    float _344 = _342 * 256.0;
    int _346 = int(_344);
    float _348 = _80 * _322;
    float _350 = _80 * _328;
    float2 _1306 = float2(_348, _350);
    float2 _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1306, float2(0.0), isnan(_1306))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1306, float2(0.0), isnan(_1306))).xy;
    float _356 = _354.x;
    float _358 = _354.y;
    float _360 = _202 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _362 = -_100;
    float _364 = _362 + 1.0;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _98 * (-3.0);
    float _370 = -_360;
    float _372 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[11].y, _370);
    float _374 = abs(_366);
    float _376 = log2(_374);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _380 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _382 = -_204;
    float _384 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
    float _386 = _100 * _378;
    float _388 = fma(_282, 3.0, -1.0);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _392 = _100 * _380;
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _396 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _386);
    float _398 = _100 * _390;
    float _400 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _392);
    float _402 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _404 = _376 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _406 = -_98;
    float _408 = fma(_406, _394, _396);
    float _410 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _398);
    float _412 = fma(_98, _394, _396);
    float _414 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _416 = -_98;
    float _418 = fma(_416, _402, _400);
    float _420 = exp2(_404);
    float _422 = fma(_98, _402, _400);
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _426 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _428 = -_98;
    float _430 = fma(_428, _414, _410);
    float _432 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _434 = fma(_98, _414, _410);
    float _436 = fma(_96, _424, _412);
    float _438 = -_96;
    float _440 = fma(_438, _426, _418);
    float _442 = -_96;
    float _444 = fma(_442, _424, _408);
    float _446 = fma(_96, _426, _422);
    float _448 = -_96;
    float _450 = fma(_448, _432, _430);
    float _452 = fma(_96, _432, _434);
    float _454 = -_100;
    float _456 = _96 * _454;
    float _458 = _420 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _460 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _462 = _96 * _100;
    float _464 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _470 = fma(_384, -0.5, 0.5);
    float _472 = fma(_384, 0.5, 0.5);
    float _474 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _476 = fma(_460, _456, _444);
    float _478 = fma(_460, _462, _436);
    float _480 = -_466;
    float _482 = _480 + 1.0;
    float _484 = fma(_474, _456, _440);
    float _486 = fma(_474, _462, _446);
    float _488 = sqrt(_470);
    float _490 = fma(_468, _462, _452);
    float _492 = fma(_472, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _494 = fma(_468, _456, _450);
    float _496 = -_98;
    float _498 = _100 * _496;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _502 = fma(_472, _492, -0.212114393711090087890625);
    float _504 = _96 * _98;
    float _506 = abs(_482);
    float _508 = log2(_506);
    float _510 = fma(_500, _498, _476);
    float _512 = fma(_472, _502, 1.570728778839111328125);
    float _514 = _100 * _98;
    float _516 = -_98;
    float _518 = fma(_516, _368, -1.0);
    float _520 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _522 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _524 = fma(_500, _514, _478);
    float _526 = _488 * 0.636619746685028076171875;
    float _528 = fma(_520, _498, _484);
    float _530 = fma(_520, _514, _486);
    float _532 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _534 = fma(_522, _498, _494);
    float _536 = fma(_522, _514, _490);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _540 = fma(_532, _504, _510);
    float _542 = _508 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _544 = fma(_532, _504, _524);
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _548 = _200 + 1.0;
    float _550 = fma(_538, _504, _528);
    float _552 = exp2(_542);
    float _554 = fma(_546, _504, _534);
    float _556 = fma(_546, _504, _536);
    float _558 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _560 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _562 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _564 = fma(_538, _504, _530);
    float _566 = fma(_558, _518, _540);
    float _568 = fma(_560, _518, _550);
    float _570 = fma(_562, _518, _554);
    float _572 = -_512;
    float _574 = fma(_526, _572, 1.0);
    float _576 = fma(_558, _388, _544);
    float _578 = -_200;
    float _580 = fma(_552, _548, _578);
    float _582 = fma(_200, -0.5, 0.5);
    float _584 = fma(_580, 0.5, 0.5);
    float _586 = float(uint(_346));
    float _588 = _586 * 0.00390625;
    float2 _1695 = float2(_338, _340);
    float2 _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1695, float2(0.0), isnan(_1695)), level(_588)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1695, float2(0.0), isnan(_1695)), level(_588)).xy;
    float _592 = _590.x;
    float _594 = _590.y;
    float2 _1708 = float2(_338, _340);
    float2 _596 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1708, float2(0.0), isnan(_1708)), level(_588)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1708, float2(0.0), isnan(_1708)), level(_588)).xy;
    float _598 = _596.x;
    float _600 = _596.y;
    float2 _1721 = float2(_338, _340);
    float4 _603 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1721, float2(0.0), isnan(_1721)), level(_588)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1721, float2(0.0), isnan(_1721)), level(_588)).xyzw;
    float _605 = _603.x;
    float _607 = _603.y;
    float _609 = _603.z;
    float _611 = _603.w;
    float _613 = fma(_356, 2.0, -1.0);
    float _615 = fma(_358, 2.0, -1.0);
    float2 _1743 = float2(_338, _340);
    float4 _617 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1743, float2(0.0), isnan(_1743)), level(_588)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1743, float2(0.0), isnan(_1743)), level(_588)).xyzw;
    float _619 = _617.x;
    float _621 = _617.y;
    float _623 = _617.z;
    float _625 = _617.w;
    float2 _1760 = float2(_574, _584);
    float3 _629 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1760, float2(0.0), isnan(_1760))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1760, float2(0.0), isnan(_1760))).xyz;
    float _631 = _629.x;
    float _633 = _629.y;
    float _635 = _629.z;
    float _637 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[22].x, _348);
    float _639 = fma(_615, (*spvDescriptorSet0.fp_c3)._m0[22].y, _350);
    float2 _1785 = float2(_574, _582);
    float3 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1785, float2(0.0), isnan(_1785))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1785, float2(0.0), isnan(_1785))).xyz;
    float _643 = _641.x;
    float _645 = _641.y;
    float _647 = _641.z;
    float2 _1799 = float2(_637, _639);
    float4 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1799, float2(0.0), isnan(_1799))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1799, float2(0.0), isnan(_1799))).xyzw;
    float _651 = _649.x;
    float _653 = _649.y;
    float _655 = _649.z;
    float _657 = _649.w;
    float _659 = fma(_560, _388, _564);
    float _661 = _508 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _663 = fma(_562, _388, _556);
    float _665 = -_100;
    float _667 = fma(_665, _100, _284);
    float _669 = exp2(_661);
    float _671 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _673 = fma(_671, _667, _566);
    float _675 = fma(_671, _667, _576);
    float _677 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _679 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _681 = fma(_677, _667, _568);
    float _683 = fma(_679, _667, _570);
    float _685 = fma(_679, _667, _663);
    float _687 = fma(_677, _667, _659);
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = _691 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _695 = -_693;
    float _697 = _695 + 1.0;
    float _699 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _701 = abs(_697);
    float _703 = log2(_701);
    float _705 = _592 * _594;
    float _707 = -_594;
    float _709 = _707 + _600;
    float _711 = _611 * _611;
    float _713 = -_705;
    float _715 = fma(_598, _600, _713);
    float _717 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[0].x, _594);
    float _719 = _711 * _711;
    float _721 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[0].x, _705);
    float _723 = _703 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _725 = precise::max(_717, 1.52587890625e-05);
    float _727 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _729 = _719 * 16.0;
    float _731 = _703 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _733 = -_727;
    float _735 = _733 + 1.0;
    float _737 = 1.0 / _725;
    float _739 = _594 * _729;
    float _741 = _625 * _625;
    float _743 = _605 * _739;
    float _745 = _607 * _739;
    float _747 = _741 * _741;
    float _749 = abs(_735);
    float _751 = log2(_749);
    float _753 = _609 * _739;
    float _755 = _747 * 16.0;
    float _757 = _600 * _755;
    float _759 = _721 * _737;
    float _761 = exp2(_723);
    float _763 = -_743;
    float _765 = fma(_619, _757, _763);
    float _767 = _759 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _769 = _759 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _771 = -_745;
    float _773 = fma(_621, _757, _771);
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _743);
    float _777 = _767 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _779 = _769 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _781 = _751 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _783 = exp2(_731);
    float _785 = _687 * _777;
    float _787 = _675 * _777;
    float _789 = _685 * _777;
    float _791 = -_753;
    float _793 = fma(_623, _757, _791);
    float _795 = fma(_681, _779, _785);
    float _797 = fma(_673, _779, _787);
    float _799 = fma(_683, _779, _789);
    float _801 = exp2(_781);
    float _803 = _795 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _805 = _761 * _737;
    float _807 = _797 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _809 = fma(_773, (*spvDescriptorSet0.fp_c3)._m0[0].x, _745);
    float _811 = _799 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _813 = fma(_793, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _815 = _775 * _805;
    float _817 = _783 * _803;
    float _819 = _783 * _807;
    float _821 = _809 * _805;
    float _823 = _783 * _811;
    float _825 = _817 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _827 = _819 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _829 = _813 * _805;
    float _831 = _823 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _833 = -_801;
    float _835 = spvFAdd(_833, 1.00010001659393310546875);
    float _837 = -_801;
    float _839 = _837 + 1.0;
    float _841 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[27].y, _825);
    float _843 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[27].x, _827);
    float _845 = fma(_829, (*spvDescriptorSet0.fp_c3)._m0[27].z, _831);
    float _847 = -_727;
    float _849 = _847 + _839;
    float _851 = 1.0 / _835;
    float _853 = _849 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _855 = fma(_633, _699, _841);
    float _857 = fma(_631, _699, _843);
    float _859 = fma(_635, _699, _845);
    float _861 = _645 * _853;
    float _863 = _643 * _853;
    float _865 = _647 * _853;
    float _867 = fma(_727, _855, _861);
    float _869 = fma(_727, _857, _863);
    float _871 = _851 * _867;
    float _873 = fma(_727, _859, _865);
    float _875 = _851 * _869;
    float _877 = _871 * 0.715200006961822509765625;
    float _879 = _851 * _873;
    float _881 = fma(_875, 0.2125999927520751953125, _877);
    float _883 = fma(_879, 0.072200000286102294921875, _881);
    float _885 = 1.0 / _883;
    float _887 = _885 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _889 = precise::clamp(_887, 0.0, 1.0);
    float _891 = fma(_889, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _893 = _891 * _657;
    float _895 = fma(_875, _893, _651);
    float _897 = fma(_871, _893, _653);
    float _899 = fma(_879, _893, _655);
    out.m_44.x = _895;
    out.m_44.y = _897;
    out.m_44.z = _899;
    out.m_44.w = _839;
    return out;
}

