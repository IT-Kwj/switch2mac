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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _42(thread const int& _2127, thread const int& _2128, thread const int& _2129, thread const int& _2130, thread int& _2131, thread int& _2132, thread int& _2133, thread int& _2134, thread int& _2135)
{
    float _2138 = as_type<float>(_2129) + 0.0;
    bool _2140 = _2138 != 0.0;
    bool _2142 = isnan(_2138);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    int _2150 = as_type<int>(_2138);
    int _2152 = _2128;
    int _2154 = _2148 ? (-1) : 0;
    if (!_2148)
    {
        float _2156 = as_type<float>(_2129) * 1.0;
        _2150 = as_type<int>(_2156);
    }
    int _2158 = _2150;
    bool _2160 = !_2148;
    int _2162 = _2158;
    if (!_2160)
    {
        float _2164 = as_type<float>(_2129) + 0.0;
        bool _2166 = _2164 >= 0.0;
        bool _2168 = isnan(_2164);
        bool _2170 = _2166 || _2168;
        bool _2172 = isnan(0.0);
        bool _2174 = _2170 || _2172;
        int _2176 = as_type<int>(_2164);
        _2154 = _2174 ? (-1) : 0;
        if (!_2174)
        {
            _2176 = 2147483647;
        }
        int _2178 = _2176;
        bool _2180 = !_2174;
        _2162 = _2178;
        if (!_2180)
        {
            float _2182 = abs(as_type<float>(_2129));
            float _2184 = _2182 + 0.0;
            bool _2186 = _2184 > as_type<float>(0x7f800000u /* inf */);
            bool _2188 = isnan(_2184);
            bool _2190 = _2186 || _2188;
            bool _2192 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2194 = _2190 || _2192;
            int _2196 = as_type<int>(_2184);
            _2154 = _2194 ? (-1) : 0;
            if (_2194)
            {
                float _2198 = as_type<float>(_2129) + 1.0;
                _2196 = as_type<int>(_2198);
            }
            int _2200 = _2196;
            _2162 = _2200;
            if (!_2194)
            {
                float _2202 = abs(as_type<float>(_2129));
                float _2204 = _2202 + (-0.0);
                float _2206 = 0.0 + _2204;
                bool _2208 = _2206 != as_type<float>(0x7f800000u /* inf */);
                bool _2210 = isnan(_2206);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2216 = _2212 || _2214;
                int _2218 = as_type<int>(_2206);
                _2154 = _2216 ? (-1) : 0;
                if (!_2216)
                {
                    _2218 = _2129;
                }
                int _2220 = _2218;
                bool _2222 = !_2216;
                _2162 = _2220;
                if (!_2222)
                {
                    float _2224 = as_type<float>(_2129) * 18446744073709551616.0;
                    float _2226 = rsqrt(_2224);
                    float _2228 = _2224 * _2226;
                    float _2230 = _2226 * 0.5;
                    float _2232 = -_2228;
                    float _2234 = 0.0 + _2232;
                    float _2236 = fma(_2230, _2234, 0.5);
                    float _2238 = fma(_2228, _2236, _2228);
                    float _2240 = -_2238;
                    float _2242 = 0.0 + _2240;
                    float _2244 = fma(_2238, _2242, _2224);
                    float _2246 = fma(_2230, _2244, _2238);
                    float _2248 = _2246 * 2.3283064365386962890625e-10;
                    _2162 = as_type<int>(_2248);
                    _2152 = as_type<int>(_2238);
                }
            }
        }
    }
    int _2250 = _2162;
    int _2252 = _2152;
    int _2254 = _2154;
    _2131 = _2250;
    _2132 = _2130;
    _2133 = 0;
    _2134 = _2252;
    _2135 = _2254;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _238 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_33.z;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _46;
    float _68 = _66 * _52;
    float _70 = _66 * _58;
    float _72 = _66 * _64;
    float _74 = _68 * _68;
    float _76 = fma(_70, _70, _74);
    float _78 = fma(_72, _72, _76);
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = rsqrt(_78);
    float _84 = precise::max(0.0, _80);
    float _86 = _70 * _82;
    float _88 = _72 * _82;
    float _90 = _68 * _82;
    float _92 = _86 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = -_90;
    float _98 = -_84;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[13].z, _98);
    float _102 = _92 * _92;
    float _104 = _94 * _94;
    float _106 = _102 + _104;
    float _108 = sqrt(_106);
    bool _112 = _108 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _114 = _80;
    float _116 = _82;
    float _118 = _100;
    float _120 = _92;
    float _122 = _94;
    if (!_112)
    {
        _114 = _104;
    }
    float _124 = _114;
    float _126 = _124;
    if (!_112)
    {
        _116 = _102;
    }
    float _128 = _116;
    bool _130 = !_112;
    float _132 = _128;
    if (!_130)
    {
        float _134 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _136 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _138 = _108 + _136;
        float _140 = _100 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _142 = rsqrt(_106);
        float _144 = _138 * _134;
        float _146 = _144 * 0.15915493667125701904296875;
        float _148 = _146 * 6.283185482025146484375;
        float _150 = sin(_148);
        float _152 = _146 * 6.283185482025146484375;
        float _154 = cos(_152);
        float _156 = fma(_150, _140, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _158 = _142 * _156;
        float _160 = _154 + (-1.0);
        float _162 = _92 * _158;
        float _164 = _94 * _158;
        float _166 = _160 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _164 * _164;
        float _170 = fma(_100, _154, _166);
        float _172 = _162 * _162;
        _118 = _170;
        _132 = _172;
        _126 = _168;
        _120 = _162;
        _122 = _164;
    }
    float _174 = _118;
    float _176 = _132;
    float _178 = _126;
    float _180 = _120;
    float _182 = _122;
    float _184 = fma(_174, _174, _176);
    float _186 = _184 + _178;
    float _188 = rsqrt(_186);
    float _190 = _188 * _174;
    float _192 = _188 * _180;
    float _194 = _188 * _182;
    float _196 = -_190;
    float _198 = precise::max(0.0, _196);
    float _200 = abs(_198);
    float _202 = -_200;
    float _204 = _202 + 1.0;
    float _206 = fma(_198, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _208 = as_type<int>(_204) + (-218103808);
    float _210 = fma(_198, _206, -0.212114393711090087890625);
    bool _212 = uint(_208) >= 1920991232u;
    float _214 = fma(_198, _210, 1.570728778839111328125);
    bool _216 = !_212;
    float _236;
    if (!_216)
    {
        int _218 = 0;
        int _220 = 0;
        int _222 = as_type<int>(_204);
        int _224 = 1104;
        int _226;
        int _228;
        int _230;
        int _232;
        int _234;
        _42(_218, _220, _222, _224, _226, _228, _230, _232, _234);
        _236 = as_type<float>(_226);
        _238 = true;
    }
    else
    {
        float _240 = rsqrt(_204);
        float _242 = _204 * _240;
        float _244 = _240 * 0.5;
        float _246 = -_242;
        float _248 = 0.0 + _246;
        float _250 = fma(_244, _248, 0.5);
        float _252 = fma(_242, _250, _242);
        float _254 = -_252;
        float _256 = 0.0 + _254;
        float _258 = fma(_252, _256, _204);
        float _260 = fma(_244, _258, _252);
        _236 = _260;
    }
    _238 = false;
    float _262 = _236;
    bool _264 = _190 > 0.0;
    float _266 = _88 * _88;
    float _268 = _86 * _86;
    float _270 = _266 + _268;
    if (_264)
    {
        discard_fragment();
    }
    float _272 = rsqrt(_270);
    float _274 = _214 * _262;
    float _276 = _274 * 0.636619746685028076171875;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = -_278;
    float _282 = _280 + 1.0;
    float _284 = sqrt(_282);
    float _286 = _88 * _272;
    float _288 = _86 * _272;
    float _290 = abs(_286);
    float _292 = abs(_288);
    float _294 = precise::max(_290, _292);
    float _296 = precise::max(_294, 9.9999997473787516355514526367188e-05);
    float _298 = -_284;
    float _300 = _298 + 1.0;
    float _302 = 1.0 / _296;
    float _304 = _300 * 0.5;
    float _306 = -_302;
    float _308 = _286 * _306;
    float _310 = _288 * _302;
    float _312 = fma(_308, _304, 0.5);
    float _314 = fma(_310, _304, 0.5);
    if (_264)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float2 _1234;
    _1234.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_312, _314));
    _1234.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_312, _314));
    float _316 = _1234.x;
    float _318 = _316 * 256.0;
    int _320 = int(_318);
    float _322 = -_90;
    float _324 = _322 + 1.0;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = abs(_326);
    float _330 = log2(_328);
    float _332 = _330 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _334 = exp2(_332);
    float _336 = _334 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _192 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _344 = -_340;
    float _346 = _344 + 1.0;
    float _348 = -_342;
    float _350 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[11].y, _348);
    float _352 = -_194;
    float _354 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[11].z, _350);
    float _356 = abs(_346);
    float _358 = log2(_356);
    float _360 = fma(_354, -0.5, 0.5);
    float _362 = fma(_354, 0.5, 0.5);
    float _364 = fma(_362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _366 = sqrt(_360);
    float _368 = fma(_362, _364, -0.212114393711090087890625);
    float _370 = _358 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _372 = fma(_362, _368, 1.570728778839111328125);
    float _374 = exp2(_370);
    float _376 = _366 * 0.636619746685028076171875;
    float _378 = -_372;
    float _380 = fma(_376, _378, 1.0);
    float _382 = _190 + 1.0;
    float _384 = -_190;
    float _386 = fma(_374, _382, _384);
    float _388 = fma(_386, 0.5, 0.5);
    float _390 = fma(_190, -0.5, 0.5);
    float _392 = float(uint(_320));
    float _394 = _392 * 0.00390625;
    float2 _1347 = float2(_312, _314);
    float2 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1347, float2(0.0), isnan(_1347)), level(_394)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1347, float2(0.0), isnan(_1347)), level(_394)).xy;
    float _400 = _398.x;
    float _402 = _398.y;
    float2 _1362 = float2(_312, _314);
    float4 _405 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1362, float2(0.0), isnan(_1362)), level(_394)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1362, float2(0.0), isnan(_1362)), level(_394)).xyzw;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = _405.w;
    float2 _1379 = float2(_380, _388);
    float3 _417 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1379, float2(0.0), isnan(_1379))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1379, float2(0.0), isnan(_1379))).xyz;
    float _419 = _417.x;
    float _421 = _417.y;
    float _423 = _417.z;
    float2 _1393 = float2(_380, _390);
    float3 _425 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1393, float2(0.0), isnan(_1393))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1393, float2(0.0), isnan(_1393))).xyz;
    float _427 = _425.x;
    float _429 = _425.y;
    float _431 = _425.z;
    float _433 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _435 = _190 * _433;
    float _437 = _190 * (-10000.0);
    float _439 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].x, _435);
    float _441 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _439);
    float _443 = abs(_437);
    bool _445 = _443 > 0.00999999977648258209228515625;
    float _447 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _449 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _451 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _453 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _455 = _90 * _447;
    float _457 = _90 * _449;
    float _459 = _90 * _451;
    float _461 = _445 ? _437 : 0.00999999977648258209228515625;
    float _463 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _455);
    float _465 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _457);
    float _467 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _469 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _459);
    float _471 = -_88;
    float _473 = fma(_471, _453, _463);
    float _475 = fma(_88, _453, _463);
    float _477 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _479 = -_88;
    float _481 = fma(_479, _467, _465);
    float _483 = fma(_88, _467, _465);
    float _485 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _487 = -_88;
    float _489 = fma(_487, _477, _469);
    float _491 = fma(_88, _477, _469);
    float _493 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _495 = -_86;
    float _497 = fma(_495, _485, _473);
    float _499 = fma(_86, _485, _475);
    float _501 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _503 = -_86;
    float _505 = fma(_503, _493, _481);
    float _507 = fma(_86, _493, _483);
    float _509 = -_86;
    float _511 = fma(_509, _501, _489);
    float _513 = fma(_86, _501, _491);
    float _515 = -_90;
    float _517 = _86 * _515;
    float _519 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _521 = _86 * _90;
    float _523 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _525 = _461 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _527 = fma(_519, _517, _511);
    float _529 = fma(_519, _521, _513);
    float _531 = -_90;
    float _533 = fma(_531, _90, _268);
    float _535 = fma(_523, _517, _497);
    float _537 = fma(_523, _521, _499);
    float _539 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _543 = precise::max(_525, -127.0);
    float _545 = fma(_539, _521, _507);
    float _547 = fma(_441, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _549 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _551 = fma(_539, _517, _505);
    float _553 = -_543;
    float _555 = exp2(_553);
    float _557 = -_88;
    float _559 = _90 * _557;
    float _561 = _90 * _88;
    float _563 = fma(_547, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _565 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _567 = _86 * _88;
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _571 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _573 = -_549;
    float _575 = exp2(_573);
    float _577 = abs(_563);
    float _579 = log2(_577);
    float _581 = fma(_541, _559, _535);
    float _583 = fma(_541, _561, _537);
    float _585 = _88 * (-3.0);
    float _587 = fma(_565, _559, _551);
    float _589 = fma(_565, _561, _545);
    float _591 = -_555;
    float _593 = _591 + 1.0;
    float _595 = -_88;
    float _597 = fma(_595, _585, -1.0);
    float _599 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _601 = _575 * _593;
    float _603 = 1.0 / _543;
    float _605 = fma(_599, _559, _527);
    float _607 = fma(_599, _561, _529);
    float _609 = _358 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _611 = fma(_266, 3.0, -1.0);
    float _613 = fma(_569, _567, _581);
    float _615 = fma(_569, _567, _583);
    float _617 = exp2(_609);
    float _619 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _621 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _623 = _579 * 1.5;
    float _625 = fma(_571, _567, _587);
    float _627 = fma(_619, _567, _605);
    float _629 = fma(_619, _567, _607);
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _635 = fma(_621, _597, _613);
    float _637 = fma(_621, _611, _615);
    float _639 = fma(_571, _567, _589);
    float _641 = exp2(_623);
    float _643 = fma(_631, _597, _625);
    float _645 = fma(_633, _597, _627);
    float _647 = -_617;
    float _649 = _647 + 1.0;
    float _651 = fma(_633, _611, _629);
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _655 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _657 = _649 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _659 = fma(_631, _611, _639);
    float _661 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _663 = _601 * _603;
    float _665 = -_657;
    float _667 = _665 + 1.0;
    float _669 = fma(_653, _533, _635);
    float _671 = fma(_653, _533, _637);
    float _673 = fma(_655, _533, _643);
    float _675 = _641 * 12.56637096405029296875;
    float _677 = fma(_655, _533, _659);
    float _679 = fma(_661, _533, _645);
    float _681 = fma(_661, _533, _651);
    float _683 = abs(_667);
    float _685 = log2(_683);
    float _687 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _689 = 1.0 / _675;
    float _691 = _685 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _693 = _685 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _695 = exp2(_691);
    float _697 = exp2(_693);
    float _699 = _402 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _701 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _703 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _705 = _400 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _707 = _400 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _709 = -_699;
    float _711 = _709 + 1.0;
    float _713 = _703 * _689;
    float _715 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _717 = _413 * _413;
    float _719 = abs(_711);
    float _721 = log2(_719);
    float _723 = _677 * _715;
    float _725 = _717 * _717;
    float _727 = _671 * _715;
    float _729 = _725 * 16.0;
    float _731 = _695 * _729;
    float _733 = _409 * _731;
    float _735 = _411 * _731;
    float _737 = _721 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _739 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _741 = _681 * _715;
    float _743 = _407 * _731;
    float _745 = exp2(_737);
    float _747 = fma(_673, _739, _723);
    float _749 = fma(_679, _739, _741);
    float _751 = fma(_669, _739, _727);
    float _753 = _747 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _755 = _749 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _757 = _751 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _759 = _697 * _753;
    float _761 = _697 * _755;
    float _763 = _697 * _757;
    float _765 = _759 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _767 = _761 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _769 = _763 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _771 = -_745;
    float _773 = spvFAdd(_771, 1.00010001659393310546875);
    float _775 = -_745;
    float _777 = _775 + 1.0;
    float _779 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[27].y, _765);
    float _781 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[27].x, _769);
    float _783 = 1.0 / _773;
    float _785 = -_699;
    float _787 = _785 + _777;
    float _789 = fma(_421, _687, _779);
    float _791 = fma(_735, (*spvDescriptorSet0.fp_c3)._m0[27].z, _767);
    float _793 = fma(_419, _687, _781);
    float _795 = _787 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _797 = fma(_423, _687, _791);
    float _799 = _429 * _795;
    float _801 = _427 * _795;
    float _803 = _431 * _795;
    float _805 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _807 = fma(_699, _789, _799);
    float _809 = fma(_699, _793, _801);
    float _811 = fma(_699, _797, _803);
    float _813 = _663 * _805;
    float _815 = _783 * _807;
    float _817 = _783 * _809;
    float _819 = _783 * _811;
    float _821 = _815 * 0.715200006961822509765625;
    float _823 = -_813;
    float _825 = exp2(_823);
    float _827 = fma(_817, 0.2125999927520751953125, _821);
    float _829 = fma(_819, 0.072200000286102294921875, _827);
    float _831 = 1.0 / _829;
    float _833 = -_825;
    float _835 = _833 + 1.0;
    float _837 = _713 * _835;
    float _839 = _837 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _841 = _837 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _843 = _831 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _845 = precise::clamp(_843, 0.0, 1.0);
    float _847 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _849 = _837 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _851 = _825 * _847;
    float _853 = fma(_817, _851, _849);
    float _855 = fma(_815, _851, _839);
    float _857 = fma(_819, _851, _841);
    out.m_36.x = _853;
    out.m_36.y = _855;
    out.m_36.z = _857;
    out.m_36.w = _777;
    return out;
}

