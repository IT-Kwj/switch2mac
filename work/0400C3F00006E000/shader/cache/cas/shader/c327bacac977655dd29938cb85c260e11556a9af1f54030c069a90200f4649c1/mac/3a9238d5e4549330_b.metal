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
    float4 m_44 [[color(1)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _52(thread const int& _2178, thread const int& _2179, thread const int& _2180, thread const int& _2181, thread int& _2182, thread int& _2183, thread int& _2184, thread int& _2185, thread int& _2186, thread int& _2187)
{
    float _2190 = as_type<float>(_2178) + 0.0;
    bool _2192 = _2190 != 0.0;
    bool _2194 = isnan(_2190);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    int _2202 = as_type<int>(_2190);
    int _2204 = _2179;
    int _2206 = _2180;
    int _2208 = _2200 ? (-1) : 0;
    if (!_2200)
    {
        float _2210 = as_type<float>(_2178) * 1.0;
        _2202 = as_type<int>(_2210);
    }
    int _2212 = _2202;
    bool _2214 = !_2200;
    int _2216 = _2212;
    if (!_2214)
    {
        float _2218 = as_type<float>(_2178) + 0.0;
        bool _2220 = _2218 >= 0.0;
        bool _2222 = isnan(_2218);
        bool _2224 = _2220 || _2222;
        bool _2226 = isnan(0.0);
        bool _2228 = _2224 || _2226;
        int _2230 = as_type<int>(_2218);
        _2208 = _2228 ? (-1) : 0;
        if (!_2228)
        {
            _2230 = 2147483647;
        }
        int _2232 = _2230;
        bool _2234 = !_2228;
        _2216 = _2232;
        if (!_2234)
        {
            float _2236 = abs(as_type<float>(_2178));
            float _2238 = _2236 + 0.0;
            bool _2240 = _2238 > as_type<float>(0x7f800000u /* inf */);
            bool _2242 = isnan(_2238);
            bool _2244 = _2240 || _2242;
            bool _2246 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2248 = _2244 || _2246;
            int _2250 = as_type<int>(_2238);
            _2208 = _2248 ? (-1) : 0;
            if (_2248)
            {
                float _2252 = as_type<float>(_2178) + 1.0;
                _2250 = as_type<int>(_2252);
            }
            int _2254 = _2250;
            _2216 = _2254;
            if (!_2248)
            {
                float _2256 = abs(as_type<float>(_2178));
                float _2258 = _2256 + (-0.0);
                float _2260 = 0.0 + _2258;
                bool _2262 = _2260 != as_type<float>(0x7f800000u /* inf */);
                bool _2264 = isnan(_2260);
                bool _2266 = _2262 || _2264;
                bool _2268 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2270 = _2266 || _2268;
                int _2272 = as_type<int>(_2260);
                _2208 = _2270 ? (-1) : 0;
                if (!_2270)
                {
                    _2272 = _2178;
                }
                int _2274 = _2272;
                bool _2276 = !_2270;
                _2216 = _2274;
                if (!_2276)
                {
                    float _2278 = as_type<float>(_2178) * 18446744073709551616.0;
                    float _2280 = rsqrt(_2278);
                    float _2282 = _2278 * _2280;
                    float _2284 = _2280 * 0.5;
                    float _2286 = -_2282;
                    float _2288 = 0.0 + _2286;
                    float _2290 = fma(_2284, _2288, 0.5);
                    float _2292 = fma(_2282, _2290, _2282);
                    float _2294 = -_2292;
                    float _2296 = 0.0 + _2294;
                    float _2298 = fma(_2292, _2296, _2278);
                    float _2300 = fma(_2284, _2298, _2292);
                    float _2302 = _2300 * 2.3283064365386962890625e-10;
                    _2216 = as_type<int>(_2302);
                    _2204 = as_type<int>(_2292);
                    _2206 = as_type<int>(_2288);
                }
            }
        }
    }
    int _2304 = _2216;
    int _2306 = _2204;
    int _2308 = _2206;
    int _2310 = _2208;
    _2182 = _2304;
    _2183 = _2181;
    _2184 = 0;
    _2185 = _2306;
    _2186 = _2308;
    _2187 = _2310;
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
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _76 * _68;
    float _82 = _76 * _74;
    float _84 = _78 * _78;
    float _86 = fma(_80, _80, _84);
    float _88 = fma(_82, _82, _86);
    float _90 = rsqrt(_88);
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _94 = precise::max(0.0, _92);
    float _96 = _80 * _90;
    float _98 = _82 * _90;
    float _100 = _78 * _90;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = -_100;
    float _108 = -_94;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _108);
    float _112 = _102 * _102;
    float _114 = _104 * _104;
    float _116 = _112 + _114;
    float _118 = sqrt(_116);
    bool _122 = _118 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _124 = _90;
    float _126 = _92;
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
    float2 _1260;
    _1260.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    _1260.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    float _328 = _1260.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = -_100;
    float _336 = _334 + 1.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _202 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _342 = in.m_46.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = abs(_338);
    float _350 = log2(_348);
    float _352 = -_340;
    float _354 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[11].y, _352);
    float _356 = -_204;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[11].z, _354);
    float _360 = in.m_46.y;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _350 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _368 = exp2(_366);
    float _370 = _368 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _372 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = fma(_358, -0.5, 0.5);
    float _378 = fma(_358, 0.5, 0.5);
    float _380 = -_374;
    float _382 = _380 + 1.0;
    float _384 = sqrt(_376);
    float _386 = abs(_382);
    float _388 = log2(_386);
    float _390 = _384 * 0.636619746685028076171875;
    float _392 = fma(_378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _394 = fma(_378, _392, -0.212114393711090087890625);
    float _396 = _200 + 1.0;
    float _398 = _388 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _400 = fma(_378, _394, 1.570728778839111328125);
    float _402 = exp2(_398);
    float _404 = -_400;
    float _406 = fma(_390, _404, 1.0);
    float _408 = _76 * _364;
    float _410 = -_200;
    float _412 = fma(_402, _396, _410);
    float _414 = fma(_412, 0.5, 0.5);
    float _416 = float(uint(_332));
    float _418 = _416 * 0.00390625;
    float _420 = _76 * _346;
    float2 _1391 = float2(_324, _326);
    float2 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1391, float2(0.0), isnan(_1391)), level(_418)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1391, float2(0.0), isnan(_1391)), level(_418)).xy;
    float _426 = _424.x;
    float _428 = _424.y;
    float2 _1406 = float2(_324, _326);
    float2 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1406, float2(0.0), isnan(_1406)), level(_418)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1406, float2(0.0), isnan(_1406)), level(_418)).xy;
    float _432 = _430.x;
    float _434 = _430.y;
    float2 _1419 = float2(_420, _408);
    float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1419, float2(0.0), isnan(_1419))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1419, float2(0.0), isnan(_1419))).xyz;
    float _440 = _438.x;
    float _442 = _438.y;
    float _444 = _438.z;
    float2 _1433 = float2(_324, _326);
    float4 _447 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1433, float2(0.0), isnan(_1433)), level(_418)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1433, float2(0.0), isnan(_1433)), level(_418)).xyzw;
    float _449 = _447.x;
    float _451 = _447.y;
    float _453 = _447.z;
    float _455 = _447.w;
    float2 _1450 = float2(_324, _326);
    float4 _457 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1450, float2(0.0), isnan(_1450)), level(_418)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1450, float2(0.0), isnan(_1450)), level(_418)).xyzw;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = _457.w;
    float2 _1467 = float2(_406, _414);
    float3 _467 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1467, float2(0.0), isnan(_1467))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1467, float2(0.0), isnan(_1467))).xyz;
    float _469 = _467.x;
    float _471 = _467.y;
    float _473 = _467.z;
    float _475 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _477 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _479 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _481 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _483 = _100 * _475;
    float _485 = _100 * _479;
    float _487 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _489 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _483);
    float _491 = _100 * _481;
    float _493 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _485);
    float _495 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _497 = -_98;
    float _499 = fma(_497, _487, _489);
    float _501 = fma(_98, _487, _489);
    float _503 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _491);
    float _505 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _507 = -_98;
    float _509 = fma(_507, _495, _493);
    float _511 = fma(_98, _495, _493);
    float _513 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _515 = -_98;
    float _517 = fma(_515, _505, _503);
    float _519 = fma(_98, _505, _503);
    float _521 = -_96;
    float _523 = fma(_521, _477, _499);
    float _525 = fma(_96, _477, _501);
    float _527 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _529 = -_96;
    float _531 = fma(_529, _513, _509);
    float _533 = fma(_96, _513, _511);
    float _535 = -_96;
    float _537 = fma(_535, _527, _517);
    float _539 = fma(_96, _527, _519);
    float _541 = -_100;
    float _543 = _96 * _541;
    float _545 = _96 * _100;
    float _547 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _549 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _551 = _96 * _98;
    float _553 = fma(_278, 3.0, -1.0);
    float _555 = fma(_547, _543, _531);
    float _557 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _559 = fma(_547, _545, _533);
    float _561 = fma(_549, _545, _539);
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _565 = fma(_557, _543, _523);
    float _567 = fma(_557, _545, _525);
    float _569 = -_98;
    float _571 = _100 * _569;
    float _573 = _100 * _98;
    float _575 = -_100;
    float _577 = fma(_575, _100, _280);
    float _579 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _581 = fma(_563, _571, _555);
    float _583 = fma(_563, _573, _559);
    float _585 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _587 = fma(_579, _571, _565);
    float _589 = fma(_579, _573, _567);
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _593 = fma(_549, _543, _537);
    float _595 = fma(_591, _573, _561);
    float _597 = _98 * (-3.0);
    float _599 = fma(_591, _571, _593);
    float _601 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _603 = -_98;
    float _605 = fma(_603, _597, -1.0);
    float _607 = fma(_585, _551, _581);
    float _609 = fma(_585, _551, _583);
    float _611 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _613 = fma(_601, _551, _587);
    float _615 = fma(_601, _551, _589);
    float _617 = fma(_611, _551, _599);
    float _619 = fma(_611, _551, _595);
    float _621 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _623 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _625 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _627 = fma(_621, _605, _607);
    float _629 = fma(_621, _553, _609);
    float _631 = fma(_623, _605, _613);
    float _633 = fma(_625, _605, _617);
    float _635 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _637 = fma(_623, _553, _615);
    float _639 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _641 = fma(_625, _553, _619);
    float _643 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _645 = fma(_635, _577, _627);
    float _647 = fma(_635, _577, _629);
    float _649 = _388 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _651 = fma(_643, _577, _641);
    float _653 = fma(_639, _577, _631);
    float _655 = fma(_639, _577, _637);
    float _657 = fma(_643, _577, _633);
    float _659 = exp2(_649);
    float _661 = -_659;
    float _663 = _661 + 1.0;
    float _665 = -_428;
    float _667 = _665 + _434;
    float _669 = _440 * _442;
    float _671 = _455 * _455;
    float _673 = fma(_440, _667, _428);
    float _675 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _677 = _675 + 1.0;
    float _679 = -_669;
    float _681 = _679 + 1.0;
    float _683 = _671 * _671;
    float _685 = _669 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _687 = precise::max(_673, 1.52587890625e-05);
    float _689 = fma(_681, _677, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _691 = -_444;
    float _693 = _691 + 1.0;
    float _695 = 1.0 / _687;
    float _697 = _432 * _689;
    float _699 = _426 * _428;
    float _701 = _663 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _703 = -_699;
    float _705 = fma(_434, _697, _703);
    float _707 = -_701;
    float _709 = _707 + 1.0;
    float _711 = _701 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _713 = _683 * 16.0;
    float _715 = fma(_440, _705, _699);
    float _717 = abs(_709);
    float _719 = log2(_717);
    float _721 = _428 * _713;
    float _723 = _715 * _695;
    float _725 = _449 * _721;
    float _727 = _451 * _721;
    float _729 = _453 * _721;
    float _731 = _723 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _733 = _723 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _735 = _731 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _737 = _733 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _739 = _655 * _735;
    float _741 = _647 * _735;
    float _743 = _651 * _735;
    float _745 = _719 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _747 = fma(_653, _737, _739);
    float _749 = fma(_645, _737, _741);
    float _751 = _465 * _465;
    float _753 = _747 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _755 = fma(_657, _737, _743);
    float _757 = _751 * _751;
    float _759 = _749 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _761 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _763 = _761 + 1.0;
    float _765 = _753 * 0.715200006961822509765625;
    float _767 = _719 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _769 = _757 * 16.0;
    float _771 = exp2(_745);
    float _773 = _755 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _775 = fma(_759, 0.2125999927520751953125, _765);
    float _777 = fma(_681, _763, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _779 = fma(_773, 0.072200000286102294921875, _775);
    float _781 = _777 * _769;
    float _783 = exp2(_767);
    float _785 = -_753;
    float _787 = _785 + _779;
    float _789 = _434 * _781;
    float _791 = -_759;
    float _793 = _791 + _779;
    float _795 = _463 * _781;
    float _797 = fma(_685, _787, _753);
    float _799 = -_727;
    float _801 = fma(_461, _789, _799);
    float _803 = fma(_685, _793, _759);
    float _805 = -_725;
    float _807 = fma(_459, _789, _805);
    float _809 = _771 * _695;
    float _811 = -_773;
    float _813 = _811 + _779;
    float _815 = fma(_440, _801, _727);
    float _817 = -_729;
    float _819 = fma(_434, _795, _817);
    float _821 = fma(_440, _807, _725);
    float _823 = fma(_685, _813, _773);
    float _825 = _783 * _797;
    float _827 = _783 * _803;
    float _829 = _815 * _809;
    float _831 = fma(_440, _819, _729);
    float _833 = _825 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _835 = _821 * _809;
    float _837 = _827 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _839 = _783 * _823;
    float _841 = fma(_829, (*spvDescriptorSet0.fp_c3)._m0[27].y, _833);
    float _843 = _831 * _809;
    float _845 = fma(_835, (*spvDescriptorSet0.fp_c3)._m0[27].x, _837);
    float _847 = _839 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _849 = fma(_471, _711, _841);
    float _851 = _673 * _693;
    float _853 = fma(_469, _711, _845);
    float _855 = fma(_843, (*spvDescriptorSet0.fp_c3)._m0[27].z, _847);
    float _857 = _849 * 0.715200006961822509765625;
    float _859 = _851 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _861 = fma(_473, _711, _855);
    float _863 = fma(_853, 0.2125999927520751953125, _857);
    float _865 = fma(_861, 0.072200000286102294921875, _863);
    float _867 = 1.0 / _865;
    float _869 = _867 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _871 = precise::clamp(_869, 0.0, 1.0);
    float _873 = fma(_871, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _875 = _853 * _873;
    float _877 = _849 * _873;
    float _879 = _861 * _873;
    out.m_42.x = _875;
    out.m_42.y = _877;
    out.m_42.z = _879;
    out.m_42.w = _859;
    out.m_44.x = _875;
    out.m_44.y = _877;
    out.m_44.z = _879;
    out.m_44.w = _859;
    return out;
}

