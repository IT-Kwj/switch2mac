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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _2153, thread const int& _2154, thread const int& _2155, thread const int& _2156, thread int& _2157, thread int& _2158, thread int& _2159, thread int& _2160, thread int& _2161, thread int& _2162, thread int& _2163)
{
    float _2166 = as_type<float>(_2153) + 0.0;
    bool _2168 = _2166 != 0.0;
    bool _2170 = isnan(_2166);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.0);
    bool _2176 = _2172 || _2174;
    int _2178 = as_type<int>(_2166);
    int _2180 = _2154;
    int _2182 = 0;
    int _2184 = _2176 ? (-1) : 0;
    if (!_2176)
    {
        float _2186 = as_type<float>(_2153) * 1.0;
        _2178 = as_type<int>(_2186);
    }
    int _2188 = _2178;
    bool _2190 = !_2176;
    int _2192 = _2188;
    if (!_2190)
    {
        float _2194 = as_type<float>(_2153) + 0.0;
        bool _2196 = _2194 >= 0.0;
        bool _2198 = isnan(_2194);
        bool _2200 = _2196 || _2198;
        bool _2202 = isnan(0.0);
        bool _2204 = _2200 || _2202;
        int _2206 = as_type<int>(_2194);
        _2184 = _2204 ? (-1) : 0;
        if (!_2204)
        {
            _2206 = 2147483647;
        }
        int _2208 = _2206;
        bool _2210 = !_2204;
        _2192 = _2208;
        if (!_2210)
        {
            float _2212 = abs(as_type<float>(_2153));
            float _2214 = _2212 + 0.0;
            bool _2216 = _2214 > as_type<float>(0x7f800000u /* inf */);
            bool _2218 = isnan(_2214);
            bool _2220 = _2216 || _2218;
            bool _2222 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2224 = _2220 || _2222;
            int _2226 = as_type<int>(_2214);
            _2182 = 2139095040;
            _2184 = _2224 ? (-1) : 0;
            if (_2224)
            {
                float _2228 = as_type<float>(_2153) + 1.0;
                _2226 = as_type<int>(_2228);
            }
            int _2230 = _2226;
            _2192 = _2230;
            if (!_2224)
            {
                float _2232 = abs(as_type<float>(_2153));
                float _2234 = _2232 + (-0.0);
                float _2236 = 0.0 + _2234;
                bool _2238 = _2236 != as_type<float>(0x7f800000u /* inf */);
                bool _2240 = isnan(_2236);
                bool _2242 = _2238 || _2240;
                bool _2244 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2246 = _2242 || _2244;
                int _2248 = as_type<int>(_2236);
                _2184 = _2246 ? (-1) : 0;
                if (!_2246)
                {
                    _2248 = _2153;
                }
                int _2250 = _2248;
                bool _2252 = !_2246;
                _2192 = _2250;
                if (!_2252)
                {
                    float _2254 = as_type<float>(_2153) * 18446744073709551616.0;
                    float _2256 = rsqrt(_2254);
                    float _2258 = _2254 * _2256;
                    float _2260 = _2256 * 0.5;
                    float _2262 = -_2258;
                    float _2264 = 0.0 + _2262;
                    float _2266 = fma(_2260, _2264, 0.5);
                    float _2268 = fma(_2258, _2266, _2258);
                    float _2270 = -_2268;
                    float _2272 = 0.0 + _2270;
                    float _2274 = fma(_2268, _2272, _2254);
                    float _2276 = fma(_2260, _2274, _2268);
                    float _2278 = _2276 * 2.3283064365386962890625e-10;
                    _2192 = as_type<int>(_2278);
                    _2180 = as_type<int>(_2264);
                    _2182 = as_type<int>(_2260);
                }
            }
        }
    }
    int _2280 = _2192;
    int _2282 = _2180;
    int _2284 = _2182;
    int _2286 = _2184;
    _2157 = _2280;
    _2158 = _2280;
    _2159 = _2282;
    _2160 = _2284;
    _2161 = _2156;
    _2162 = 0;
    _2163 = _2286;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _248 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_35.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_35.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_35.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _52;
    float _74 = _72 * _58;
    float _76 = _72 * _64;
    float _78 = _72 * _70;
    float _80 = _74 * _74;
    float _82 = fma(_76, _76, _80);
    float _84 = fma(_78, _78, _82);
    float _86 = rsqrt(_84);
    float _88 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _90 = precise::max(0.0, _88);
    float _92 = _76 * _86;
    float _94 = _78 * _86;
    float _96 = _74 * _86;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = -_96;
    float _104 = -_90;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].z, _104);
    float _108 = _98 * _98;
    float _110 = _100 * _100;
    float _112 = _108 + _110;
    float _114 = sqrt(_112);
    bool _118 = _114 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _120 = _86;
    float _122 = _88;
    float _124 = _106;
    float _126 = _98;
    float _128 = _100;
    if (!_118)
    {
        _120 = _110;
    }
    float _130 = _120;
    float _132 = _130;
    if (!_118)
    {
        _122 = _108;
    }
    float _134 = _122;
    bool _136 = !_118;
    float _138 = _134;
    if (!_136)
    {
        float _140 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _142 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _144 = _114 + _142;
        float _146 = _106 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _148 = rsqrt(_112);
        float _150 = _144 * _140;
        float _152 = _150 * 0.15915493667125701904296875;
        float _154 = _152 * 6.283185482025146484375;
        float _156 = sin(_154);
        float _158 = _152 * 6.283185482025146484375;
        float _160 = cos(_158);
        float _162 = fma(_156, _146, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _164 = _148 * _162;
        float _166 = _160 + (-1.0);
        float _168 = _98 * _164;
        float _170 = _100 * _164;
        float _172 = _166 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = _170 * _170;
        float _176 = fma(_106, _160, _172);
        float _178 = _168 * _168;
        _124 = _176;
        _138 = _178;
        _132 = _174;
        _126 = _168;
        _128 = _170;
    }
    float _180 = _124;
    float _182 = _138;
    float _184 = _132;
    float _186 = _126;
    float _188 = _128;
    float _190 = fma(_180, _180, _182);
    float _192 = _190 + _184;
    float _194 = rsqrt(_192);
    float _196 = _194 * _180;
    float _198 = _194 * _186;
    float _200 = _194 * _188;
    float _202 = -_196;
    float _204 = precise::max(0.0, _202);
    float _206 = abs(_204);
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = fma(_204, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _214 = as_type<int>(_210) + (-218103808);
    float _216 = fma(_204, _212, -0.212114393711090087890625);
    bool _218 = uint(_214) >= 1920991232u;
    float _220 = fma(_204, _216, 1.570728778839111328125);
    bool _222 = !_218;
    float _246;
    if (!_222)
    {
        int _224 = as_type<int>(_210);
        int _226 = 0;
        int _228 = 0;
        int _230 = 1136;
        int _232;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        _48(_224, _226, _228, _230, _232, _234, _236, _238, _240, _242, _244);
        _246 = as_type<float>(_232);
        _248 = true;
    }
    else
    {
        float _250 = rsqrt(_210);
        float _252 = _210 * _250;
        float _254 = _250 * 0.5;
        float _256 = -_252;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, 0.5);
        float _262 = fma(_252, _260, _252);
        float _264 = -_262;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, _210);
        float _270 = fma(_254, _268, _262);
        _246 = _270;
    }
    _248 = false;
    float _272 = _246;
    bool _274 = _196 > 0.0;
    float _276 = _94 * _94;
    float _278 = _92 * _92;
    float _280 = _276 + _278;
    if (_274)
    {
        discard_fragment();
    }
    float _282 = rsqrt(_280);
    float _284 = _220 * _272;
    float _286 = _284 * 0.636619746685028076171875;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_288;
    float _292 = _290 + 1.0;
    float _294 = sqrt(_292);
    float _296 = _94 * _282;
    float _298 = _92 * _282;
    float _300 = abs(_296);
    float _302 = abs(_298);
    float _304 = precise::max(_300, _302);
    float _306 = precise::max(_304, 9.9999997473787516355514526367188e-05);
    float _308 = -_294;
    float _310 = _308 + 1.0;
    float _312 = 1.0 / _306;
    float _314 = _310 * 0.5;
    float _316 = -_312;
    float _318 = _296 * _316;
    float _320 = _298 * _312;
    float _322 = fma(_318, _314, 0.5);
    float _324 = fma(_320, _314, 0.5);
    if (_274)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float2 _1250;
    _1250.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _1250.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _326 = _1250.x;
    float _328 = _326 * 256.0;
    int _330 = int(_328);
    float _332 = -_96;
    float _334 = _332 + 1.0;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _198 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _340 = in.m_42.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = -_338;
    float _348 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[11].y, _346);
    float _350 = abs(_336);
    float _352 = log2(_350);
    float _354 = in.m_42.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = _352 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _362 = exp2(_360);
    float _364 = _72 * _358;
    float _366 = _362 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _368 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = -_200;
    float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[11].z, _348);
    float _376 = -_370;
    float _378 = _376 + 1.0;
    float _380 = fma(_374, -0.5, 0.5);
    float _382 = fma(_374, 0.5, 0.5);
    float _384 = abs(_378);
    float _386 = log2(_384);
    float _388 = sqrt(_380);
    float _390 = fma(_382, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _392 = fma(_382, _390, -0.212114393711090087890625);
    float _394 = _196 + 1.0;
    float _396 = _386 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _398 = fma(_382, _392, 1.570728778839111328125);
    float _400 = exp2(_396);
    float _402 = _388 * 0.636619746685028076171875;
    float _404 = -_398;
    float _406 = fma(_402, _404, 1.0);
    float _408 = -_196;
    float _410 = fma(_400, _394, _408);
    float _412 = _72 * _344;
    float _414 = fma(_410, 0.5, 0.5);
    float _416 = float(uint(_330));
    float _418 = _416 * 0.00390625;
    float2 _1381 = float2(_322, _324);
    float2 _422 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1381, float2(0.0), isnan(_1381)), level(_418)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1381, float2(0.0), isnan(_1381)), level(_418)).xy;
    float _424 = _422.x;
    float _426 = _422.y;
    float2 _1396 = float2(_412, _364);
    float3 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1396, float2(0.0), isnan(_1396))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1396, float2(0.0), isnan(_1396))).xyz;
    float _432 = _430.x;
    float _434 = _430.y;
    float _436 = _430.z;
    float2 _1410 = float2(_322, _324);
    float4 _439 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1410, float2(0.0), isnan(_1410)), level(_418)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1410, float2(0.0), isnan(_1410)), level(_418)).xyzw;
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    float _447 = _439.w;
    float2 _1427 = float2(_406, _414);
    float3 _449 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1427, float2(0.0), isnan(_1427))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1427, float2(0.0), isnan(_1427))).xyz;
    float _451 = _449.x;
    float _453 = _449.y;
    float _455 = _449.z;
    float _457 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _459 = _196 * _457;
    float _461 = _196 * (-10000.0);
    float _463 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].x, _459);
    float _465 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _467 = abs(_461);
    bool _469 = _467 > 0.00999999977648258209228515625;
    float _471 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].z, _463);
    float _473 = -_96;
    float _475 = _92 * _473;
    float _477 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _479 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _481 = _96 * _465;
    float _483 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _485 = _96 * _477;
    float _487 = _96 * _479;
    float _489 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _481);
    float _491 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _493 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _485);
    float _495 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _487);
    float _497 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _499 = fma(_94, _491, _489);
    float _501 = -_94;
    float _503 = fma(_501, _483, _493);
    float _505 = fma(_94, _483, _493);
    float _507 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _509 = -_94;
    float _511 = fma(_509, _491, _489);
    float _513 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _515 = _469 ? _461 : 0.00999999977648258209228515625;
    float _517 = -_94;
    float _519 = fma(_517, _507, _495);
    float _521 = fma(_94, _507, _495);
    float _523 = -_92;
    float _525 = fma(_523, _513, _511);
    float _527 = fma(_92, _513, _499);
    float _529 = -_92;
    float _531 = fma(_529, _497, _503);
    float _533 = fma(_92, _497, _505);
    float _535 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _537 = _515 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _539 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _543 = -_92;
    float _545 = fma(_543, _535, _519);
    float _547 = fma(_92, _535, _521);
    float _549 = _92 * _96;
    float _551 = fma(_539, _475, _525);
    float _553 = precise::max(_537, -127.0);
    float _555 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _557 = fma(_539, _549, _527);
    float _559 = -_553;
    float _561 = exp2(_559);
    float _563 = fma(_541, _549, _533);
    float _565 = fma(_555, _475, _545);
    float _567 = fma(_555, _549, _547);
    float _569 = -_96;
    float _571 = fma(_569, _96, _278);
    float _573 = -_94;
    float _575 = _96 * _573;
    float _577 = _96 * _94;
    float _579 = fma(_541, _475, _531);
    float _581 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _583 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _585 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _587 = fma(_581, _575, _551);
    float _589 = fma(_581, _577, _557);
    float _591 = fma(_471, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _593 = -_583;
    float _595 = exp2(_593);
    float _597 = fma(_585, _575, _579);
    float _599 = fma(_585, _577, _563);
    float _601 = _94 * (-3.0);
    float _603 = _92 * _94;
    float _605 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _607 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _609 = -_94;
    float _611 = fma(_609, _601, -1.0);
    float _613 = -_561;
    float _615 = _613 + 1.0;
    float _617 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _619 = fma(_607, _575, _565);
    float _621 = _386 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _623 = abs(_605);
    float _625 = log2(_623);
    float _627 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _629 = fma(_607, _577, _567);
    float _631 = _595 * _615;
    float _633 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _635 = fma(_276, 3.0, -1.0);
    float _637 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _639 = exp2(_621);
    float _641 = fma(_633, _603, _587);
    float _643 = fma(_633, _603, _589);
    float _645 = fma(_617, _603, _597);
    float _647 = fma(_617, _603, _599);
    float _649 = fma(_627, _603, _619);
    float _651 = fma(_627, _603, _629);
    float _653 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _655 = fma(_637, _611, _641);
    float _657 = fma(_637, _635, _643);
    float _659 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _661 = _625 * 1.5;
    float _663 = fma(_653, _611, _645);
    float _665 = fma(_659, _611, _649);
    float _667 = fma(_653, _635, _647);
    float _669 = -_639;
    float _671 = _669 + 1.0;
    float _673 = exp2(_661);
    float _675 = fma(_659, _635, _651);
    float _677 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _679 = _671 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _683 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _685 = fma(_677, _571, _655);
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = fma(_677, _571, _657);
    float _693 = fma(_681, _571, _663);
    float _695 = fma(_681, _571, _667);
    float _697 = fma(_683, _571, _665);
    float _699 = fma(_683, _571, _675);
    float _701 = abs(_689);
    float _703 = log2(_701);
    float _705 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _707 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _709 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _711 = _673 * 12.56637096405029296875;
    float _713 = 1.0 / _553;
    float _715 = _631 * _713;
    float _717 = _424 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _719 = _424 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _721 = _432 * _434;
    float _723 = 1.0 / _711;
    float _725 = _717 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _727 = _719 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _729 = _703 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _731 = _703 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _733 = _695 * _725;
    float _735 = _691 * _725;
    float _737 = _699 * _725;
    float _739 = _447 * _447;
    float _741 = fma(_693, _727, _733);
    float _743 = fma(_685, _727, _735);
    float _745 = fma(_697, _727, _737);
    float _747 = exp2(_729);
    float _749 = _741 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _751 = _743 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _753 = _745 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _755 = _707 * _723;
    float _757 = _749 * 0.715200006961822509765625;
    float _759 = _721 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _761 = _739 * _739;
    float _763 = exp2(_731);
    float _765 = fma(_751, 0.2125999927520751953125, _757);
    float _767 = -_436;
    float _769 = _767 + 1.0;
    float _771 = _761 * 16.0;
    float _773 = fma(_753, 0.072200000286102294921875, _765);
    float _775 = _426 * _769;
    float _777 = _747 * _771;
    float _779 = -_749;
    float _781 = _779 + _773;
    float _783 = -_751;
    float _785 = _783 + _773;
    float _787 = -_753;
    float _789 = _787 + _773;
    float _791 = _443 * _777;
    float _793 = fma(_759, _781, _749);
    float _795 = fma(_759, _785, _751);
    float _797 = fma(_759, _789, _753);
    float _799 = _441 * _777;
    float _801 = _763 * _793;
    float _803 = _763 * _795;
    float _805 = _763 * _797;
    float _807 = _445 * _777;
    float _809 = _801 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _811 = _803 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _813 = _805 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _815 = fma(_791, (*spvDescriptorSet0.fp_c3)._m0[27].y, _809);
    float _817 = fma(_799, (*spvDescriptorSet0.fp_c3)._m0[27].x, _811);
    float _819 = _775 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _821 = fma(_453, _709, _815);
    float _823 = fma(_451, _709, _817);
    float _825 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[27].z, _813);
    float _827 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _829 = _821 * 0.715200006961822509765625;
    float _831 = fma(_455, _709, _825);
    float _833 = _715 * _827;
    float _835 = fma(_823, 0.2125999927520751953125, _829);
    float _837 = -_833;
    float _839 = exp2(_837);
    float _841 = fma(_831, 0.072200000286102294921875, _835);
    float _843 = 1.0 / _841;
    float _845 = -_839;
    float _847 = _845 + 1.0;
    float _849 = _755 * _847;
    float _851 = _843 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _853 = precise::clamp(_851, 0.0, 1.0);
    float _855 = _849 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _857 = _849 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _859 = fma(_853, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _861 = _849 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _863 = _839 * _859;
    float _865 = fma(_823, _863, _861);
    float _867 = fma(_821, _863, _855);
    float _869 = fma(_831, _863, _857);
    out.m_38.x = _865;
    out.m_38.y = _867;
    out.m_38.z = _869;
    out.m_38.w = _819;
    out.m_40.x = _865;
    out.m_40.y = _867;
    out.m_40.z = _869;
    out.m_40.w = _819;
    return out;
}

