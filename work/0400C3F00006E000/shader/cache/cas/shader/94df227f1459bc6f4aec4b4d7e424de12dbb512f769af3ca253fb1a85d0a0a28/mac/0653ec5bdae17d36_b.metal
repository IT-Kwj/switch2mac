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
    float4 m_48 [[color(1)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _56(thread const int& _2263, thread const int& _2264, thread const int& _2265, thread const int& _2266, thread int& _2267, thread int& _2268, thread int& _2269, thread int& _2270, thread int& _2271, thread int& _2272)
{
    float _2275 = as_type<float>(_2263) + 0.0;
    bool _2277 = _2275 != 0.0;
    bool _2279 = isnan(_2275);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.0);
    bool _2285 = _2281 || _2283;
    int _2287 = as_type<int>(_2275);
    int _2289 = _2264;
    int _2291 = _2265;
    int _2293 = _2285 ? (-1) : 0;
    if (!_2285)
    {
        float _2295 = as_type<float>(_2263) * 1.0;
        _2287 = as_type<int>(_2295);
    }
    int _2297 = _2287;
    bool _2299 = !_2285;
    int _2301 = _2297;
    if (!_2299)
    {
        float _2303 = as_type<float>(_2263) + 0.0;
        bool _2305 = _2303 >= 0.0;
        bool _2307 = isnan(_2303);
        bool _2309 = _2305 || _2307;
        bool _2311 = isnan(0.0);
        bool _2313 = _2309 || _2311;
        int _2315 = as_type<int>(_2303);
        _2293 = _2313 ? (-1) : 0;
        if (!_2313)
        {
            _2315 = 2147483647;
        }
        int _2317 = _2315;
        bool _2319 = !_2313;
        _2301 = _2317;
        if (!_2319)
        {
            float _2321 = abs(as_type<float>(_2263));
            float _2323 = _2321 + 0.0;
            bool _2325 = _2323 > as_type<float>(0x7f800000u /* inf */);
            bool _2327 = isnan(_2323);
            bool _2329 = _2325 || _2327;
            bool _2331 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2333 = _2329 || _2331;
            int _2335 = as_type<int>(_2323);
            _2293 = _2333 ? (-1) : 0;
            if (_2333)
            {
                float _2337 = as_type<float>(_2263) + 1.0;
                _2335 = as_type<int>(_2337);
            }
            int _2339 = _2335;
            _2301 = _2339;
            if (!_2333)
            {
                float _2341 = abs(as_type<float>(_2263));
                float _2343 = _2341 + (-0.0);
                float _2345 = 0.0 + _2343;
                bool _2347 = _2345 != as_type<float>(0x7f800000u /* inf */);
                bool _2349 = isnan(_2345);
                bool _2351 = _2347 || _2349;
                bool _2353 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2355 = _2351 || _2353;
                int _2357 = as_type<int>(_2345);
                _2293 = _2355 ? (-1) : 0;
                if (!_2355)
                {
                    _2357 = _2263;
                }
                int _2359 = _2357;
                bool _2361 = !_2355;
                _2301 = _2359;
                if (!_2361)
                {
                    float _2363 = as_type<float>(_2263) * 18446744073709551616.0;
                    float _2365 = rsqrt(_2363);
                    float _2367 = _2363 * _2365;
                    float _2369 = _2365 * 0.5;
                    float _2371 = -_2367;
                    float _2373 = 0.0 + _2371;
                    float _2375 = fma(_2369, _2373, 0.5);
                    float _2377 = fma(_2367, _2375, _2367);
                    float _2379 = -_2377;
                    float _2381 = 0.0 + _2379;
                    float _2383 = fma(_2377, _2381, _2363);
                    float _2385 = fma(_2369, _2383, _2377);
                    float _2387 = _2385 * 2.3283064365386962890625e-10;
                    _2301 = as_type<int>(_2387);
                    _2289 = as_type<int>(_2377);
                    _2291 = as_type<int>(_2373);
                }
            }
        }
    }
    int _2389 = _2301;
    int _2391 = _2289;
    int _2393 = _2291;
    int _2395 = _2293;
    _2267 = _2389;
    _2268 = _2266;
    _2269 = 0;
    _2270 = _2391;
    _2271 = _2393;
    _2272 = _2395;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _254 = false;
    float _60 = gl_FragCoord.w;
    float _62 = in.m_43.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_43.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_43.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _60;
    float _82 = _80 * _66;
    float _84 = _80 * _72;
    float _86 = _80 * _78;
    float _88 = _82 * _82;
    float _90 = fma(_84, _84, _88);
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _94 = fma(_86, _86, _90);
    float _96 = precise::max(0.0, _92);
    float _98 = rsqrt(_94);
    float _100 = _84 * _98;
    float _102 = _86 * _98;
    float _104 = _82 * _98;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _110 = -_104;
    float _112 = -_96;
    float _114 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[13].z, _112);
    float _116 = _106 * _106;
    float _118 = _108 * _108;
    float _120 = _116 + _118;
    float _122 = sqrt(_120);
    bool _126 = _122 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _128 = _98;
    float _130 = _96;
    float _132 = _114;
    float _134 = _106;
    float _136 = _108;
    if (!_126)
    {
        _128 = _118;
    }
    float _138 = _128;
    float _140 = _138;
    if (!_126)
    {
        _130 = _116;
    }
    float _142 = _130;
    bool _144 = !_126;
    float _146 = _142;
    if (!_144)
    {
        float _148 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _150 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _152 = _122 + _150;
        float _154 = _114 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _156 = rsqrt(_120);
        float _158 = _152 * _148;
        float _160 = _158 * 0.15915493667125701904296875;
        float _162 = _160 * 6.283185482025146484375;
        float _164 = sin(_162);
        float _166 = _160 * 6.283185482025146484375;
        float _168 = cos(_166);
        float _170 = fma(_164, _154, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _172 = _156 * _170;
        float _174 = _168 + (-1.0);
        float _176 = _106 * _172;
        float _178 = _108 * _172;
        float _180 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _182 = _178 * _178;
        float _184 = fma(_114, _168, _180);
        float _186 = _176 * _176;
        _132 = _184;
        _146 = _186;
        _140 = _182;
        _134 = _176;
        _136 = _178;
    }
    float _188 = _132;
    float _190 = _146;
    float _192 = _140;
    float _194 = _134;
    float _196 = _136;
    float _198 = fma(_188, _188, _190);
    float _200 = _198 + _192;
    float _202 = rsqrt(_200);
    float _204 = _202 * _188;
    float _206 = _202 * _194;
    float _208 = _202 * _196;
    float _210 = -_204;
    float _212 = precise::max(0.0, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = fma(_212, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _222 = as_type<int>(_218) + (-218103808);
    float _224 = fma(_212, _220, -0.212114393711090087890625);
    bool _226 = uint(_222) >= 1920991232u;
    float _228 = fma(_212, _224, 1.570728778839111328125);
    bool _230 = !_226;
    float _252;
    if (!_230)
    {
        int _232 = as_type<int>(_218);
        int _234 = 0;
        int _236 = 0;
        int _238 = 1136;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        int _250;
        _56(_232, _234, _236, _238, _240, _242, _244, _246, _248, _250);
        _252 = as_type<float>(_240);
        _254 = true;
    }
    else
    {
        float _256 = rsqrt(_218);
        float _258 = _218 * _256;
        float _260 = _256 * 0.5;
        float _262 = -_258;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, 0.5);
        float _268 = fma(_258, _266, _258);
        float _270 = -_268;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, _218);
        float _276 = fma(_260, _274, _268);
        _252 = _276;
    }
    _254 = false;
    float _278 = _252;
    bool _280 = _204 > 0.0;
    float _282 = _102 * _102;
    float _284 = _100 * _100;
    float _286 = _282 + _284;
    if (_280)
    {
        discard_fragment();
    }
    float _288 = rsqrt(_286);
    float _290 = _228 * _278;
    float _292 = _290 * 0.636619746685028076171875;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = -_294;
    float _298 = _296 + 1.0;
    float _300 = _102 * _288;
    float _302 = _100 * _288;
    if (_280)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        out.m_48.x = 0.0;
        out.m_48.y = 0.0;
        out.m_48.z = 0.0;
        out.m_48.w = 0.0;
        return out;
    }
    float _304 = abs(_300);
    float _306 = abs(_302);
    float _308 = precise::max(_304, _306);
    float _310 = in.m_50.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_50.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = sqrt(_298);
    float _324 = precise::max(_308, 9.9999997473787516355514526367188e-05);
    float _326 = 1.0 / _324;
    float _328 = -_322;
    float _330 = _328 + 1.0;
    float _332 = _330 * 0.5;
    float _334 = -_326;
    float _336 = _300 * _334;
    float _338 = _302 * _326;
    float _340 = fma(_336, _332, 0.5);
    float _342 = fma(_338, _332, 0.5);
    float _344 = _80 * _314;
    float _346 = _80 * _320;
    float2 _1312;
    _1312.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1312.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _348 = _1312.x;
    float _350 = _348 * 256.0;
    int _352 = int(_350);
    float2 _1322 = float2(_344, _346);
    float2 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1322, float2(0.0), isnan(_1322))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1322, float2(0.0), isnan(_1322))).xy;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = -_104;
    float _364 = _362 + 1.0;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _206 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _370 = _102 * (-3.0);
    float _372 = abs(_366);
    float _374 = log2(_372);
    float _376 = fma(_282, 3.0, -1.0);
    float _378 = -_368;
    float _380 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[11].y, _378);
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _384 = -_102;
    float _386 = fma(_384, _370, -1.0);
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _392 = -_208;
    float _394 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[11].z, _380);
    float _396 = _104 * _382;
    float _398 = _104 * _388;
    float _400 = _104 * _390;
    float _402 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _398);
    float _404 = _374 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _406 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _408 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _410 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _400);
    float _412 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _396);
    float _414 = -_102;
    float _416 = fma(_414, _406, _402);
    float _418 = exp2(_404);
    float _420 = fma(_102, _406, _402);
    float _422 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _424 = -_102;
    float _426 = fma(_424, _408, _410);
    float _428 = fma(_102, _408, _410);
    float _430 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _432 = -_102;
    float _434 = fma(_432, _422, _412);
    float _436 = fma(_102, _422, _412);
    float _438 = fma(_100, _430, _428);
    float _440 = -_100;
    float _442 = fma(_440, _430, _426);
    float _444 = -_104;
    float _446 = _100 * _444;
    float _448 = _100 * _104;
    float _450 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _452 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _454 = _418 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _456 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _458 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = -_100;
    float _464 = fma(_462, _456, _416);
    float _466 = fma(_100, _456, _420);
    float _468 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _470 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _472 = -_460;
    float _474 = _472 + 1.0;
    float _476 = fma(_394, -0.5, 0.5);
    float _478 = -_100;
    float _480 = fma(_478, _468, _434);
    float _482 = fma(_100, _468, _436);
    float _484 = fma(_470, _446, _464);
    float _486 = fma(_470, _448, _466);
    float _488 = fma(_394, 0.5, 0.5);
    float _490 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _492 = sqrt(_476);
    float _494 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _496 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _498 = fma(_490, _446, _442);
    float _500 = fma(_490, _448, _438);
    float _502 = fma(_488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _504 = fma(_494, _446, _480);
    float _506 = fma(_494, _448, _482);
    float _508 = abs(_474);
    float _510 = log2(_508);
    float _512 = fma(_488, _502, -0.212114393711090087890625);
    float _514 = -_102;
    float _516 = _104 * _514;
    float _518 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _520 = _104 * _102;
    float _522 = fma(_488, _512, 1.570728778839111328125);
    float _524 = _100 * _102;
    float _526 = fma(_518, _516, _484);
    float _528 = fma(_518, _520, _486);
    float _530 = _492 * 0.636619746685028076171875;
    float _532 = fma(_450, _516, _504);
    float _534 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _536 = fma(_450, _520, _506);
    float _538 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _540 = fma(_534, _524, _526);
    float _542 = _510 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _544 = fma(_538, _524, _532);
    float _546 = fma(_538, _524, _536);
    float _548 = _204 + 1.0;
    float _550 = fma(_496, _516, _498);
    float _552 = fma(_496, _520, _500);
    float _554 = exp2(_542);
    float _556 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _558 = fma(_452, _524, _550);
    float _560 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _562 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _564 = fma(_556, _386, _540);
    float _566 = fma(_534, _524, _528);
    float _568 = fma(_560, _386, _558);
    float _570 = fma(_452, _524, _552);
    float _572 = fma(_562, _386, _544);
    float _574 = -_522;
    float _576 = fma(_530, _574, 1.0);
    float _578 = fma(_556, _376, _566);
    float _580 = -_204;
    float _582 = fma(_554, _548, _580);
    float _584 = fma(_582, 0.5, 0.5);
    float _586 = float(uint(_352));
    float _588 = fma(_358, 2.0, -1.0);
    float _590 = fma(_360, 2.0, -1.0);
    float _592 = _586 * 0.00390625;
    float _594 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[22].x, _344);
    float _596 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[22].y, _346);
    float2 _1725 = float2(_340, _342);
    float2 _598 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1725, float2(0.0), isnan(_1725)), level(_592)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1725, float2(0.0), isnan(_1725)), level(_592)).xy;
    float _600 = _598.x;
    float _602 = _598.y;
    float2 _1738 = float2(_340, _342);
    float2 _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1738, float2(0.0), isnan(_1738)), level(_592)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1738, float2(0.0), isnan(_1738)), level(_592)).xy;
    float _606 = _604.x;
    float _608 = _604.y;
    float2 _1751 = float2(_344, _346);
    float3 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1751, float2(0.0), isnan(_1751))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1751, float2(0.0), isnan(_1751))).xyz;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float2 _1765 = float2(_340, _342);
    float4 _621 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1765, float2(0.0), isnan(_1765)), level(_592)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1765, float2(0.0), isnan(_1765)), level(_592)).xyzw;
    float _623 = _621.x;
    float _625 = _621.y;
    float _627 = _621.z;
    float _629 = _621.w;
    float2 _1782 = float2(_340, _342);
    float4 _631 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1782, float2(0.0), isnan(_1782)), level(_592)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1782, float2(0.0), isnan(_1782)), level(_592)).xyzw;
    float _633 = _631.x;
    float _635 = _631.y;
    float _637 = _631.z;
    float _639 = _631.w;
    float2 _1799 = float2(_576, _584);
    float3 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1799, float2(0.0), isnan(_1799))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1799, float2(0.0), isnan(_1799))).xyz;
    float _643 = _641.x;
    float _645 = _641.y;
    float _647 = _641.z;
    float2 _1813 = float2(_594, _596);
    float4 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1813, float2(0.0), isnan(_1813))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1813, float2(0.0), isnan(_1813))).xyzw;
    float _651 = _649.x;
    float _653 = _649.y;
    float _655 = _649.z;
    float _657 = _649.w;
    float _659 = fma(_560, _376, _570);
    float _661 = fma(_562, _376, _546);
    float _663 = _100 * _100;
    float _665 = _510 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _667 = -_104;
    float _669 = fma(_667, _104, _663);
    float _671 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _673 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _675 = exp2(_665);
    float _677 = fma(_671, _669, _564);
    float _679 = fma(_671, _669, _578);
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _683 = fma(_673, _669, _572);
    float _685 = fma(_673, _669, _661);
    float _687 = fma(_681, _669, _568);
    float _689 = fma(_681, _669, _659);
    float _691 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _693 = _691 + 1.0;
    float _695 = -_675;
    float _697 = _695 + 1.0;
    float _699 = -_602;
    float _701 = _699 + _608;
    float _703 = _614 * _616;
    float _705 = _629 * _629;
    float _707 = _639 * _639;
    float _709 = fma(_614, _701, _602);
    float _711 = -_703;
    float _713 = _711 + 1.0;
    float _715 = _705 * _705;
    float _717 = precise::max(_709, 1.52587890625e-05);
    float _719 = fma(_713, _693, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _721 = 1.0 / _717;
    float _723 = _606 * _719;
    float _725 = _600 * _602;
    float _727 = _697 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _729 = _715 * 16.0;
    float _731 = -_725;
    float _733 = fma(_608, _723, _731);
    float _735 = -_727;
    float _737 = _735 + 1.0;
    float _739 = fma(_614, _733, _725);
    float _741 = _602 * _729;
    float _743 = abs(_737);
    float _745 = log2(_743);
    float _747 = _623 * _741;
    float _749 = _739 * _721;
    float _751 = _625 * _741;
    float _753 = _627 * _741;
    float _755 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _757 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _759 = _755 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _761 = _757 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _763 = _689 * _759;
    float _765 = _745 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _767 = _679 * _759;
    float _769 = _685 * _759;
    float _771 = fma(_687, _761, _763);
    float _773 = fma(_677, _761, _767);
    float _775 = exp2(_765);
    float _777 = fma(_683, _761, _769);
    float _779 = _771 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _781 = _745 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _783 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _785 = _783 + 1.0;
    float _787 = _707 * _707;
    float _789 = _773 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _791 = _779 * 0.715200006961822509765625;
    float _793 = fma(_713, _785, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _795 = _787 * 16.0;
    float _797 = _777 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _799 = fma(_789, 0.2125999927520751953125, _791);
    float _801 = exp2(_781);
    float _803 = _793 * _795;
    float _805 = _703 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _807 = fma(_797, 0.072200000286102294921875, _799);
    float _809 = _775 * _721;
    float _811 = _608 * _803;
    float _813 = _637 * _803;
    float _815 = -_779;
    float _817 = _815 + _807;
    float _819 = -_789;
    float _821 = _819 + _807;
    float _823 = -_751;
    float _825 = fma(_635, _811, _823);
    float _827 = -_797;
    float _829 = _827 + _807;
    float _831 = fma(_805, _817, _779);
    float _833 = fma(_805, _821, _789);
    float _835 = -_747;
    float _837 = fma(_633, _811, _835);
    float _839 = fma(_614, _825, _751);
    float _841 = fma(_805, _829, _797);
    float _843 = _801 * _831;
    float _845 = -_753;
    float _847 = fma(_608, _813, _845);
    float _849 = fma(_614, _837, _747);
    float _851 = _801 * _833;
    float _853 = _839 * _809;
    float _855 = _843 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _857 = _801 * _841;
    float _859 = fma(_614, _847, _753);
    float _861 = _849 * _809;
    float _863 = _851 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _865 = fma(_853, (*spvDescriptorSet0.fp_c3)._m0[27].y, _855);
    float _867 = _727 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _869 = _859 * _809;
    float _871 = fma(_861, (*spvDescriptorSet0.fp_c3)._m0[27].x, _863);
    float _873 = _857 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _875 = fma(_645, _867, _865);
    float _877 = fma(_643, _867, _871);
    float _879 = fma(_869, (*spvDescriptorSet0.fp_c3)._m0[27].z, _873);
    float _881 = _875 * 0.715200006961822509765625;
    float _883 = fma(_647, _867, _879);
    float _885 = fma(_877, 0.2125999927520751953125, _881);
    float _887 = -_618;
    float _889 = _887 + 1.0;
    float _891 = fma(_883, 0.072200000286102294921875, _885);
    float _893 = _709 * _889;
    float _895 = 1.0 / _891;
    float _897 = _895 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _899 = precise::clamp(_897, 0.0, 1.0);
    float _901 = fma(_899, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _903 = _901 * _657;
    float _905 = _893 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _907 = fma(_877, _903, _651);
    float _909 = fma(_875, _903, _653);
    float _911 = fma(_883, _903, _655);
    out.m_46.x = _907;
    out.m_46.y = _909;
    out.m_46.z = _911;
    out.m_46.w = _905;
    out.m_48.x = _907;
    out.m_48.y = _909;
    out.m_48.z = _911;
    out.m_48.w = _905;
    return out;
}

