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
void _50(thread const int& _2249, thread const int& _2250, thread const int& _2251, thread const int& _2252, thread int& _2253, thread int& _2254, thread int& _2255, thread int& _2256, thread int& _2257)
{
    float _2260 = as_type<float>(_2251) + 0.0;
    bool _2262 = _2260 != 0.0;
    bool _2264 = isnan(_2260);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    int _2272 = as_type<int>(_2260);
    int _2274 = _2250;
    int _2276 = _2270 ? (-1) : 0;
    if (!_2270)
    {
        float _2278 = as_type<float>(_2251) * 1.0;
        _2272 = as_type<int>(_2278);
    }
    int _2280 = _2272;
    bool _2282 = !_2270;
    int _2284 = _2280;
    if (!_2282)
    {
        float _2286 = as_type<float>(_2251) + 0.0;
        bool _2288 = _2286 >= 0.0;
        bool _2290 = isnan(_2286);
        bool _2292 = _2288 || _2290;
        bool _2294 = isnan(0.0);
        bool _2296 = _2292 || _2294;
        int _2298 = as_type<int>(_2286);
        _2276 = _2296 ? (-1) : 0;
        if (!_2296)
        {
            _2298 = 2147483647;
        }
        int _2300 = _2298;
        bool _2302 = !_2296;
        _2284 = _2300;
        if (!_2302)
        {
            float _2304 = abs(as_type<float>(_2251));
            float _2306 = _2304 + 0.0;
            bool _2308 = _2306 > as_type<float>(0x7f800000u /* inf */);
            bool _2310 = isnan(_2306);
            bool _2312 = _2308 || _2310;
            bool _2314 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2316 = _2312 || _2314;
            int _2318 = as_type<int>(_2306);
            _2276 = _2316 ? (-1) : 0;
            if (_2316)
            {
                float _2320 = as_type<float>(_2251) + 1.0;
                _2318 = as_type<int>(_2320);
            }
            int _2322 = _2318;
            _2284 = _2322;
            if (!_2316)
            {
                float _2324 = abs(as_type<float>(_2251));
                float _2326 = _2324 + (-0.0);
                float _2328 = 0.0 + _2326;
                bool _2330 = _2328 != as_type<float>(0x7f800000u /* inf */);
                bool _2332 = isnan(_2328);
                bool _2334 = _2330 || _2332;
                bool _2336 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2338 = _2334 || _2336;
                int _2340 = as_type<int>(_2328);
                _2276 = _2338 ? (-1) : 0;
                if (!_2338)
                {
                    _2340 = _2251;
                }
                int _2342 = _2340;
                bool _2344 = !_2338;
                _2284 = _2342;
                if (!_2344)
                {
                    float _2346 = as_type<float>(_2251) * 18446744073709551616.0;
                    float _2348 = rsqrt(_2346);
                    float _2350 = _2346 * _2348;
                    float _2352 = _2348 * 0.5;
                    float _2354 = -_2350;
                    float _2356 = 0.0 + _2354;
                    float _2358 = fma(_2352, _2356, 0.5);
                    float _2360 = fma(_2350, _2358, _2350);
                    float _2362 = -_2360;
                    float _2364 = 0.0 + _2362;
                    float _2366 = fma(_2360, _2364, _2346);
                    float _2368 = fma(_2352, _2366, _2360);
                    float _2370 = _2368 * 2.3283064365386962890625e-10;
                    _2284 = as_type<int>(_2370);
                    _2274 = as_type<int>(_2360);
                }
            }
        }
    }
    int _2372 = _2284;
    int _2374 = _2274;
    int _2376 = _2276;
    _2253 = _2372;
    _2254 = _2252;
    _2255 = 0;
    _2256 = _2374;
    _2257 = _2376;
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
    float2 _1286;
    _1286.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _1286.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _324 = _1286.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = -_98;
    float _332 = _330 + 1.0;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _200 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _338 = -_98;
    float _340 = _94 * _338;
    float _342 = abs(_334);
    float _344 = log2(_342);
    float _346 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _348 = -_336;
    float _350 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[11].y, _348);
    float _352 = -_202;
    float _354 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[11].z, _350);
    float _356 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _358 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _360 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _362 = _98 * _356;
    float _364 = _344 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _366 = _98 * _346;
    float _368 = _98 * _358;
    float _370 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _372 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _362);
    float _374 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _366);
    float _376 = exp2(_364);
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _380 = -_96;
    float _382 = fma(_380, _370, _372);
    float _384 = fma(_96, _370, _372);
    float _386 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _368);
    float _388 = -_96;
    float _390 = fma(_388, _378, _374);
    float _392 = fma(_96, _378, _374);
    float _394 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _396 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _398 = -_94;
    float _400 = fma(_398, _394, _382);
    float _402 = -_96;
    float _404 = fma(_402, _396, _386);
    float _406 = fma(_96, _396, _386);
    float _408 = fma(_94, _394, _384);
    float _410 = _376 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _412 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _414 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = -_94;
    float _420 = fma(_418, _412, _390);
    float _422 = fma(_94, _412, _392);
    float _424 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _426 = -_416;
    float _428 = _426 + 1.0;
    float _430 = _94 * _98;
    float _432 = fma(_360, _340, _420);
    float _434 = -_94;
    float _436 = fma(_434, _424, _404);
    float _438 = fma(_94, _424, _406);
    float _440 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _442 = abs(_428);
    float _444 = log2(_442);
    float _446 = fma(_360, _430, _422);
    float _448 = fma(_440, _340, _400);
    float _450 = fma(_440, _430, _408);
    float _452 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _454 = fma(_354, 0.5, 0.5);
    float _456 = fma(_354, -0.5, 0.5);
    float _458 = fma(_452, _340, _436);
    float _460 = in.m_44.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_44.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = fma(_454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _474 = sqrt(_456);
    float _476 = fma(_452, _430, _438);
    float _478 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _480 = _444 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _482 = fma(_454, _472, -0.212114393711090087890625);
    float _484 = _98 * _96;
    float _486 = _198 + 1.0;
    float _488 = exp2(_480);
    float _490 = -_96;
    float _492 = _98 * _490;
    float _494 = fma(_454, _482, 1.570728778839111328125);
    float _496 = fma(_478, _484, _446);
    float _498 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _500 = fma(_478, _492, _432);
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _504 = fma(_498, _484, _450);
    float _506 = fma(_498, _492, _448);
    float _508 = fma(_502, _484, _476);
    float _510 = fma(_502, _492, _458);
    float _512 = _474 * 0.636619746685028076171875;
    float _514 = -_198;
    float _516 = fma(_488, _486, _514);
    float _518 = fma(_198, -0.5, 0.5);
    float _520 = -_494;
    float _522 = fma(_512, _520, 1.0);
    float _524 = fma(_516, 0.5, 0.5);
    float _526 = _74 * _464;
    float _528 = _74 * _470;
    float _530 = float(uint(_328));
    float _532 = _530 * 0.00390625;
    float2 _1617 = float2(_320, _322);
    float2 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1617, float2(0.0), isnan(_1617)), level(_532)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1617, float2(0.0), isnan(_1617)), level(_532)).xy;
    float _538 = _536.x;
    float _540 = _536.y;
    float2 _1632 = float2(_320, _322);
    float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1632, float2(0.0), isnan(_1632)), level(_532)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1632, float2(0.0), isnan(_1632)), level(_532)).xy;
    float _544 = _542.x;
    float _546 = _542.y;
    float2 _1645 = float2(_526, _528);
    float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1645, float2(0.0), isnan(_1645))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1645, float2(0.0), isnan(_1645))).xyz;
    float _552 = _550.x;
    float _554 = _550.y;
    float _556 = _550.z;
    float2 _1659 = float2(_320, _322);
    float4 _559 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1659, float2(0.0), isnan(_1659)), level(_532)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1659, float2(0.0), isnan(_1659)), level(_532)).xyzw;
    float _561 = _559.x;
    float _563 = _559.y;
    float _565 = _559.z;
    float _567 = _559.w;
    float2 _1676 = float2(_320, _322);
    float4 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1676, float2(0.0), isnan(_1676)), level(_532)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1676, float2(0.0), isnan(_1676)), level(_532)).xyzw;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _569.w;
    float2 _1693 = float2(_522, _524);
    float3 _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1693, float2(0.0), isnan(_1693))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1693, float2(0.0), isnan(_1693))).xyz;
    float _581 = _579.x;
    float _583 = _579.y;
    float _585 = _579.z;
    float2 _1707 = float2(_522, _518);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1707, float2(0.0), isnan(_1707))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1707, float2(0.0), isnan(_1707))).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float _595 = _94 * _96;
    float _597 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _599 = -_98;
    float _601 = fma(_599, _98, _276);
    float _603 = fma(_597, _595, _500);
    float _605 = fma(_597, _595, _496);
    float _607 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _609 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _611 = _96 * (-3.0);
    float _613 = fma(_607, _595, _506);
    float _615 = fma(_609, _595, _510);
    float _617 = fma(_609, _595, _508);
    float _619 = fma(_607, _595, _504);
    float _621 = -_96;
    float _623 = fma(_621, _611, -1.0);
    float _625 = _444 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _627 = fma(_274, 3.0, -1.0);
    float _629 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _633 = exp2(_625);
    float _635 = fma(_629, _623, _603);
    float _637 = fma(_629, _627, _605);
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _641 = fma(_631, _623, _615);
    float _643 = fma(_631, _627, _617);
    float _645 = fma(_639, _627, _619);
    float _647 = fma(_639, _623, _613);
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _651 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _655 = fma(_649, _601, _641);
    float _657 = fma(_651, _601, _635);
    float _659 = -_633;
    float _661 = _659 + 1.0;
    float _663 = fma(_653, _601, _647);
    float _665 = fma(_653, _601, _645);
    float _667 = fma(_649, _601, _643);
    float _669 = fma(_651, _601, _637);
    float _671 = _661 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _673 = -_671;
    float _675 = _673 + 1.0;
    float _677 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _679 = abs(_675);
    float _681 = log2(_679);
    float _683 = _538 * _540;
    float _685 = -_540;
    float _687 = _685 + _546;
    float _689 = -_556;
    float _691 = _689 + 1.0;
    float _693 = _567 * _567;
    float _695 = -_683;
    float _697 = fma(_544, _546, _695);
    float _699 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[0].x, _540);
    float _701 = _577 * _577;
    float _703 = _693 * _693;
    float _705 = fma(_697, (*spvDescriptorSet0.fp_c3)._m0[0].x, _683);
    float _707 = precise::max(_699, 1.52587890625e-05);
    float _709 = _703 * 16.0;
    float _711 = _701 * _701;
    float _713 = _681 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _715 = _681 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _717 = _540 * _709;
    float _719 = 1.0 / _707;
    float _721 = _699 * _691;
    float _723 = _561 * _717;
    float _725 = _563 * _717;
    float _727 = _721 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _729 = _565 * _717;
    float _731 = exp2(_713);
    float _733 = -_727;
    float _735 = _733 + 1.0;
    float _737 = _705 * _719;
    float _739 = _737 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _741 = _737 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _743 = _739 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _745 = _741 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _747 = _731 * _719;
    float _749 = _669 * _743;
    float _751 = _665 * _743;
    float _753 = abs(_735);
    float _755 = log2(_753);
    float _757 = _667 * _743;
    float _759 = fma(_657, _745, _749);
    float _761 = fma(_663, _745, _751);
    float _763 = fma(_655, _745, _757);
    float _765 = _711 * 16.0;
    float _767 = _761 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _769 = _759 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _771 = _546 * _765;
    float _773 = _767 * 0.715200006961822509765625;
    float _775 = _552 * _554;
    float _777 = _763 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _779 = exp2(_715);
    float _781 = fma(_769, 0.2125999927520751953125, _773);
    float _783 = _755 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _785 = _775 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _787 = -_725;
    float _789 = fma(_573, _771, _787);
    float _791 = fma(_777, 0.072200000286102294921875, _781);
    float _793 = -_723;
    float _795 = fma(_571, _771, _793);
    float _797 = -_729;
    float _799 = fma(_575, _771, _797);
    float _801 = exp2(_783);
    float _803 = -_767;
    float _805 = _803 + _791;
    float _807 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[0].x, _725);
    float _809 = fma(_795, (*spvDescriptorSet0.fp_c3)._m0[0].x, _723);
    float _811 = fma(_799, (*spvDescriptorSet0.fp_c3)._m0[0].x, _729);
    float _813 = fma(_785, _805, _767);
    float _815 = -_769;
    float _817 = _815 + _791;
    float _819 = -_777;
    float _821 = _819 + _791;
    float _823 = _807 * _747;
    float _825 = _779 * _813;
    float _827 = fma(_785, _817, _769);
    float _829 = fma(_785, _821, _777);
    float _831 = _809 * _747;
    float _833 = _825 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _835 = _779 * _827;
    float _837 = _779 * _829;
    float _839 = -_801;
    float _841 = spvFAdd(_839, 1.00010001659393310546875);
    float _843 = -_801;
    float _845 = _843 + 1.0;
    float _847 = _835 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _849 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[27].y, _833);
    float _851 = _811 * _747;
    float _853 = -_727;
    float _855 = _853 + _845;
    float _857 = 1.0 / _841;
    float _859 = _837 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _861 = fma(_831, (*spvDescriptorSet0.fp_c3)._m0[27].x, _847);
    float _863 = _855 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _865 = fma(_583, _677, _849);
    float _867 = fma(_851, (*spvDescriptorSet0.fp_c3)._m0[27].z, _859);
    float _869 = fma(_581, _677, _861);
    float _871 = _591 * _863;
    float _873 = _589 * _863;
    float _875 = fma(_585, _677, _867);
    float _877 = _593 * _863;
    float _879 = fma(_727, _865, _871);
    float _881 = fma(_727, _869, _873);
    float _883 = _857 * _879;
    float _885 = fma(_727, _875, _877);
    float _887 = _857 * _881;
    float _889 = _883 * 0.715200006961822509765625;
    float _891 = _857 * _885;
    float _893 = fma(_887, 0.2125999927520751953125, _889);
    float _895 = fma(_891, 0.072200000286102294921875, _893);
    float _897 = 1.0 / _895;
    float _899 = _897 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _901 = precise::clamp(_899, 0.0, 1.0);
    float _903 = fma(_901, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _905 = _887 * _903;
    float _907 = _883 * _903;
    float _909 = _891 * _903;
    out.m_42.x = _905;
    out.m_42.y = _907;
    out.m_42.z = _909;
    out.m_42.w = _845;
    return out;
}

