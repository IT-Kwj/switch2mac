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
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_12Smplr_w [[id(19)]];
    sampler fp_t_tcb_14Smplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_CSmplr_w [[id(23)]];
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
void _56(thread const int& _2364, thread const int& _2365, thread const int& _2366, thread const int& _2367, thread int& _2368, thread int& _2369, thread int& _2370, thread int& _2371, thread int& _2372, thread int& _2373)
{
    float _2376 = as_type<float>(_2364) + 0.0;
    bool _2378 = _2376 != 0.0;
    bool _2380 = isnan(_2376);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan(0.0);
    bool _2386 = _2382 || _2384;
    int _2388 = as_type<int>(_2376);
    int _2390 = _2366;
    int _2392 = _2386 ? (-1) : 0;
    if (!_2386)
    {
        float _2394 = as_type<float>(_2364) * 1.0;
        _2388 = as_type<int>(_2394);
    }
    int _2396 = _2388;
    bool _2398 = !_2386;
    int _2400 = _2396;
    if (!_2398)
    {
        float _2402 = as_type<float>(_2364) + 0.0;
        bool _2404 = _2402 >= 0.0;
        bool _2406 = isnan(_2402);
        bool _2408 = _2404 || _2406;
        bool _2410 = isnan(0.0);
        bool _2412 = _2408 || _2410;
        int _2414 = as_type<int>(_2402);
        _2392 = _2412 ? (-1) : 0;
        if (!_2412)
        {
            _2414 = 2147483647;
        }
        int _2416 = _2414;
        bool _2418 = !_2412;
        _2400 = _2416;
        if (!_2418)
        {
            float _2420 = abs(as_type<float>(_2364));
            float _2422 = _2420 + 0.0;
            bool _2424 = _2422 > as_type<float>(0x7f800000u /* inf */);
            bool _2426 = isnan(_2422);
            bool _2428 = _2424 || _2426;
            bool _2430 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2432 = _2428 || _2430;
            int _2434 = as_type<int>(_2422);
            _2392 = _2432 ? (-1) : 0;
            if (_2432)
            {
                float _2436 = as_type<float>(_2364) + 1.0;
                _2434 = as_type<int>(_2436);
            }
            int _2438 = _2434;
            _2400 = _2438;
            if (!_2432)
            {
                float _2440 = abs(as_type<float>(_2364));
                float _2442 = _2440 + (-0.0);
                float _2444 = 0.0 + _2442;
                bool _2446 = _2444 != as_type<float>(0x7f800000u /* inf */);
                bool _2448 = isnan(_2444);
                bool _2450 = _2446 || _2448;
                bool _2452 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2454 = _2450 || _2452;
                int _2456 = as_type<int>(_2444);
                _2392 = _2454 ? (-1) : 0;
                if (!_2454)
                {
                    _2456 = _2364;
                }
                int _2458 = _2456;
                bool _2460 = !_2454;
                _2400 = _2458;
                if (!_2460)
                {
                    float _2462 = as_type<float>(_2364) * 18446744073709551616.0;
                    float _2464 = rsqrt(_2462);
                    float _2466 = _2462 * _2464;
                    float _2468 = _2464 * 0.5;
                    float _2470 = -_2466;
                    float _2472 = 0.0 + _2470;
                    float _2474 = fma(_2468, _2472, 0.5);
                    float _2476 = fma(_2466, _2474, _2466);
                    float _2478 = -_2476;
                    float _2480 = 0.0 + _2478;
                    float _2482 = fma(_2476, _2480, _2462);
                    float _2484 = fma(_2468, _2482, _2476);
                    float _2486 = _2484 * 2.3283064365386962890625e-10;
                    _2400 = as_type<int>(_2486);
                    _2390 = as_type<int>(_2476);
                }
            }
        }
    }
    int _2488 = _2400;
    int _2490 = _2390;
    int _2492 = _2392;
    _2368 = _2488;
    _2369 = _2488;
    _2370 = _2367;
    _2371 = 0;
    _2372 = _2490;
    _2373 = _2492;
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
    float _128 = _96;
    float _130 = _98;
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
    float _300 = sqrt(_298);
    float _302 = _102 * _288;
    float _304 = _100 * _288;
    float _306 = abs(_302);
    float _308 = abs(_304);
    float _310 = precise::max(_306, _308);
    float _312 = precise::max(_310, 9.9999997473787516355514526367188e-05);
    float _314 = -_300;
    float _316 = _314 + 1.0;
    float _318 = 1.0 / _312;
    float _320 = _316 * 0.5;
    float _322 = -_318;
    float _324 = _302 * _322;
    float _326 = _304 * _318;
    float _328 = fma(_324, _320, 0.5);
    float _330 = fma(_326, _320, 0.5);
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
    float2 _1332;
    _1332.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_328, _330));
    _1332.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_328, _330));
    float _332 = _1332.x;
    float _334 = _332 * 256.0;
    int _336 = int(_334);
    float _338 = -_104;
    float _340 = _338 + 1.0;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = _206 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _346 = -_344;
    float _348 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[11].y, _346);
    float _350 = abs(_342);
    float _352 = log2(_350);
    float _354 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _356 = -_208;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[11].z, _348);
    float _360 = fma(_282, 3.0, -1.0);
    float _362 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _364 = _104 * _354;
    float _366 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _368 = _104 * _362;
    float _370 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _372 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _364);
    float _374 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _368);
    float _376 = -_102;
    float _378 = fma(_376, _366, _372);
    float _380 = _352 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _382 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _384 = fma(_102, _366, _372);
    float _386 = -_102;
    float _388 = fma(_386, _370, _374);
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _392 = _104 * _382;
    float _394 = exp2(_380);
    float _396 = -_100;
    float _398 = fma(_396, _390, _388);
    float _400 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _392);
    float _402 = fma(_102, _370, _374);
    float _404 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _406 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _408 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _410 = fma(_100, _390, _402);
    float _412 = -_102;
    float _414 = fma(_412, _404, _400);
    float _416 = fma(_102, _404, _400);
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _422 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _424 = _394 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _426 = fma(_100, _418, _384);
    float _428 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _430 = _100 * _104;
    float _432 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = -_104;
    float _438 = _100 * _436;
    float _440 = -_100;
    float _442 = fma(_440, _420, _414);
    float _444 = fma(_100, _420, _416);
    float _446 = fma(_358, -0.5, 0.5);
    float _448 = -_100;
    float _450 = fma(_448, _418, _378);
    float _452 = -_434;
    float _454 = _452 + 1.0;
    float _456 = fma(_428, _438, _398);
    float _458 = fma(_428, _430, _410);
    float _460 = fma(_358, 0.5, 0.5);
    float _462 = sqrt(_446);
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _466 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _468 = fma(_460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _470 = _100 * _102;
    float _472 = fma(_464, _438, _450);
    float _474 = fma(_466, _438, _442);
    float _476 = fma(_460, _468, -0.212114393711090087890625);
    float _478 = abs(_454);
    float _480 = log2(_478);
    float _482 = _102 * (-3.0);
    float _484 = fma(_466, _430, _444);
    float _486 = fma(_460, _476, 1.570728778839111328125);
    float _488 = -_102;
    float _490 = _104 * _488;
    float _492 = -_102;
    float _494 = fma(_492, _482, -1.0);
    float _496 = _104 * _102;
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _500 = fma(_464, _430, _426);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _504 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _506 = fma(_498, _490, _474);
    float _508 = fma(_498, _496, _484);
    float _510 = _462 * 0.636619746685028076171875;
    float _512 = fma(_502, _496, _458);
    float _514 = fma(_504, _490, _472);
    float _516 = _480 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _518 = in.m_50.x;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = fma(_504, _496, _500);
    float _526 = fma(_502, _490, _456);
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _530 = in.m_50.y;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = exp2(_516);
    float _538 = -_486;
    float _540 = fma(_510, _538, 1.0);
    float _542 = fma(_528, _470, _526);
    float _544 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _546 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _548 = _204 + 1.0;
    float _550 = fma(_406, _494, _542);
    float _552 = fma(_544, _470, _514);
    float _554 = fma(_546, _470, _506);
    float _556 = fma(_546, _470, _508);
    float _558 = fma(_528, _470, _512);
    float _560 = fma(_408, _494, _552);
    float _562 = fma(_422, _494, _554);
    float _564 = fma(_544, _470, _524);
    float _566 = fma(_406, _360, _558);
    float _568 = -_204;
    float _570 = fma(_536, _548, _568);
    float _572 = fma(_408, _360, _564);
    float _574 = fma(_570, 0.5, 0.5);
    float _576 = _80 * _522;
    float _578 = _80 * _534;
    float _580 = float(uint(_336));
    float _582 = _580 * 0.00390625;
    float2 _1739 = float2(_328, _330);
    float4 _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1739, float2(0.0), isnan(_1739)), level(_582)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1739, float2(0.0), isnan(_1739)), level(_582)).xyzw;
    float _587 = _585.x;
    float _589 = _585.y;
    float _591 = _585.z;
    float _593 = _585.w;
    float2 _1758 = float2(_328, _330);
    float2 _597 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1758, float2(0.0), isnan(_1758)), level(_582)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1758, float2(0.0), isnan(_1758)), level(_582)).xy;
    float _599 = _597.x;
    float _601 = _597.y;
    float2 _1771 = float2(_328, _330);
    float2 _603 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1771, float2(0.0), isnan(_1771)), level(_582)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1771, float2(0.0), isnan(_1771)), level(_582)).xy;
    float _605 = _603.x;
    float _607 = _603.y;
    float2 _1784 = float2(_576, _578);
    float3 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1784, float2(0.0), isnan(_1784))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1784, float2(0.0), isnan(_1784))).xyz;
    float _613 = _611.x;
    float _615 = _611.y;
    float _617 = _611.z;
    float2 _1798 = float2(_328, _330);
    float2 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1798, float2(0.0), isnan(_1798)), level(_582)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1798, float2(0.0), isnan(_1798)), level(_582)).xy;
    float _621 = _619.x;
    float _623 = _619.y;
    float2 _1811 = float2(_328, _330);
    float4 _625 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1811, float2(0.0), isnan(_1811)), level(_582)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1811, float2(0.0), isnan(_1811)), level(_582)).xyzw;
    float _627 = _625.x;
    float _629 = _625.y;
    float _631 = _625.z;
    float _633 = _625.w;
    float2 _1828 = float2(_328, _330);
    float4 _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1828, float2(0.0), isnan(_1828)), level(_582)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1828, float2(0.0), isnan(_1828)), level(_582)).xyzw;
    float _637 = _635.x;
    float _639 = _635.y;
    float _641 = _635.z;
    float _643 = _635.w;
    float2 _1845 = float2(_540, _574);
    float3 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1845, float2(0.0), isnan(_1845))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1845, float2(0.0), isnan(_1845))).xyz;
    float _647 = _645.x;
    float _649 = _645.y;
    float _651 = _645.z;
    float _653 = fma(_422, _360, _556);
    float _655 = -_104;
    float _657 = fma(_655, _104, _284);
    float _659 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _661 = fma(_659, _657, _550);
    float _663 = fma(_659, _657, _566);
    float _665 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _667 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _669 = fma(_665, _657, _560);
    float _671 = fma(_665, _657, _572);
    float _673 = fma(_667, _657, _562);
    float _675 = fma(_667, _657, _653);
    float _677 = _593 * _593;
    float _679 = _613 * _615;
    float _681 = _677 * _677;
    float _683 = _633 * _633;
    float _685 = _643 * _643;
    float _687 = _681 * 16.0;
    float _689 = _683 * _683;
    float _691 = _685 * _685;
    float _693 = _601 * _687;
    float _695 = _480 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _697 = _691 * 16.0;
    float _699 = _587 * _693;
    float _701 = _589 * _693;
    float _703 = _591 * _693;
    float _705 = -_601;
    float _707 = _705 + _607;
    float _709 = exp2(_695);
    float _711 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[0].x, _601);
    float _713 = _599 * _601;
    float _715 = -_679;
    float _717 = _715 + 1.0;
    float _719 = _679 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _721 = -_711;
    float _723 = _721 + _623;
    float _725 = precise::max(_711, 1.52587890625e-05);
    float _727 = -_713;
    float _729 = fma(_605, _607, _727);
    float _731 = fma(_613, _723, _711);
    float _733 = fma(_729, (*spvDescriptorSet0.fp_c3)._m0[0].x, _713);
    float _735 = 1.0 / _725;
    float _737 = -_709;
    float _739 = _737 + 1.0;
    float _741 = precise::max(_731, 1.52587890625e-05);
    float _743 = _689 * 16.0;
    float _745 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _747 = _745 + 1.0;
    float _749 = _607 * _743;
    float _751 = fma(_717, _747, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _753 = -_699;
    float _755 = fma(_627, _749, _753);
    float _757 = -_703;
    float _759 = fma(_631, _749, _757);
    float _761 = _621 * _751;
    float _763 = -_701;
    float _765 = fma(_629, _749, _763);
    float _767 = _711 * _735;
    float _769 = 1.0 / _741;
    float _771 = fma(_755, (*spvDescriptorSet0.fp_c3)._m0[0].x, _699);
    float _773 = fma(_759, (*spvDescriptorSet0.fp_c3)._m0[0].x, _703);
    float _775 = _733 * _767;
    float _777 = _739 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _779 = _771 * _767;
    float _781 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _783 = -_775;
    float _785 = fma(_623, _761, _783);
    float _787 = -_777;
    float _789 = _787 + 1.0;
    float _791 = _781 * _767;
    float _793 = fma(_613, _785, _775);
    float _795 = _773 * _767;
    float _797 = abs(_789);
    float _799 = log2(_797);
    float _801 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _803 = _801 + 1.0;
    float _805 = _793 * _769;
    float _807 = _805 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _809 = _805 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _811 = _807 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _813 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _815 = _671 * _811;
    float _817 = _663 * _811;
    float _819 = _675 * _811;
    float _821 = _799 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _823 = fma(_669, _813, _815);
    float _825 = fma(_661, _813, _817);
    float _827 = fma(_673, _813, _819);
    float _829 = exp2(_821);
    float _831 = _823 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _833 = _825 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _835 = _799 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _837 = _827 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _839 = _831 * 0.715200006961822509765625;
    float _841 = fma(_717, _803, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _843 = fma(_833, 0.2125999927520751953125, _839);
    float _845 = exp2(_835);
    float _847 = _841 * _697;
    float _849 = fma(_837, 0.072200000286102294921875, _843);
    float _851 = _829 * _769;
    float _853 = _623 * _847;
    float _855 = -_831;
    float _857 = _855 + _849;
    float _859 = -_833;
    float _861 = _859 + _849;
    float _863 = -_837;
    float _865 = _863 + _849;
    float _867 = -_791;
    float _869 = fma(_639, _853, _867);
    float _871 = fma(_719, _857, _831);
    float _873 = _641 * _847;
    float _875 = fma(_719, _861, _833);
    float _877 = fma(_613, _869, _791);
    float _879 = -_779;
    float _881 = fma(_637, _853, _879);
    float _883 = _845 * _871;
    float _885 = fma(_719, _865, _837);
    float _887 = -_795;
    float _889 = fma(_623, _873, _887);
    float _891 = _877 * _851;
    float _893 = _883 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _895 = fma(_613, _881, _779);
    float _897 = _845 * _875;
    float _899 = _845 * _885;
    float _901 = fma(_613, _889, _795);
    float _903 = fma(_891, (*spvDescriptorSet0.fp_c3)._m0[27].y, _893);
    float _905 = _895 * _851;
    float _907 = _897 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _909 = _777 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _911 = _901 * _851;
    float _913 = _899 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _915 = fma(_905, (*spvDescriptorSet0.fp_c3)._m0[27].x, _907);
    float _917 = fma(_649, _909, _903);
    float _919 = fma(_911, (*spvDescriptorSet0.fp_c3)._m0[27].z, _913);
    float _921 = fma(_647, _909, _915);
    float _923 = _917 * 0.715200006961822509765625;
    float _925 = -_617;
    float _927 = _925 + 1.0;
    float _929 = fma(_651, _909, _919);
    float _931 = fma(_921, 0.2125999927520751953125, _923);
    float _933 = _731 * _927;
    float _935 = fma(_929, 0.072200000286102294921875, _931);
    float _937 = _933 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _939 = 1.0 / _935;
    float _941 = _939 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _943 = precise::clamp(_941, 0.0, 1.0);
    float _945 = fma(_943, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _947 = _921 * _945;
    float _949 = _917 * _945;
    float _951 = _929 * _945;
    out.m_46.x = _947;
    out.m_46.y = _949;
    out.m_46.z = _951;
    out.m_46.w = _937;
    out.m_48.x = _947;
    out.m_48.y = _949;
    out.m_48.z = _951;
    out.m_48.w = _937;
    return out;
}

