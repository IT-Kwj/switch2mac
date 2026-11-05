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
void _46(thread const int& _2057, thread const int& _2058, thread const int& _2059, thread const int& _2060, thread int& _2061, thread int& _2062, thread int& _2063, thread int& _2064, thread int& _2065)
{
    float _2068 = as_type<float>(_2059) + 0.0;
    bool _2070 = _2068 != 0.0;
    bool _2072 = isnan(_2068);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    int _2080 = as_type<int>(_2068);
    int _2082 = _2058;
    int _2084 = _2078 ? (-1) : 0;
    if (!_2078)
    {
        float _2086 = as_type<float>(_2059) * 1.0;
        _2080 = as_type<int>(_2086);
    }
    int _2088 = _2080;
    bool _2090 = !_2078;
    int _2092 = _2088;
    if (!_2090)
    {
        float _2094 = as_type<float>(_2059) + 0.0;
        bool _2096 = _2094 >= 0.0;
        bool _2098 = isnan(_2094);
        bool _2100 = _2096 || _2098;
        bool _2102 = isnan(0.0);
        bool _2104 = _2100 || _2102;
        int _2106 = as_type<int>(_2094);
        _2084 = _2104 ? (-1) : 0;
        if (!_2104)
        {
            _2106 = 2147483647;
        }
        int _2108 = _2106;
        bool _2110 = !_2104;
        _2092 = _2108;
        if (!_2110)
        {
            float _2112 = abs(as_type<float>(_2059));
            float _2114 = _2112 + 0.0;
            bool _2116 = _2114 > as_type<float>(0x7f800000u /* inf */);
            bool _2118 = isnan(_2114);
            bool _2120 = _2116 || _2118;
            bool _2122 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2124 = _2120 || _2122;
            int _2126 = as_type<int>(_2114);
            _2084 = _2124 ? (-1) : 0;
            if (_2124)
            {
                float _2128 = as_type<float>(_2059) + 1.0;
                _2126 = as_type<int>(_2128);
            }
            int _2130 = _2126;
            _2092 = _2130;
            if (!_2124)
            {
                float _2132 = abs(as_type<float>(_2059));
                float _2134 = _2132 + (-0.0);
                float _2136 = 0.0 + _2134;
                bool _2138 = _2136 != as_type<float>(0x7f800000u /* inf */);
                bool _2140 = isnan(_2136);
                bool _2142 = _2138 || _2140;
                bool _2144 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2146 = _2142 || _2144;
                int _2148 = as_type<int>(_2136);
                _2084 = _2146 ? (-1) : 0;
                if (!_2146)
                {
                    _2148 = _2059;
                }
                int _2150 = _2148;
                bool _2152 = !_2146;
                _2092 = _2150;
                if (!_2152)
                {
                    float _2154 = as_type<float>(_2059) * 18446744073709551616.0;
                    float _2156 = rsqrt(_2154);
                    float _2158 = _2154 * _2156;
                    float _2160 = _2156 * 0.5;
                    float _2162 = -_2158;
                    float _2164 = 0.0 + _2162;
                    float _2166 = fma(_2160, _2164, 0.5);
                    float _2168 = fma(_2158, _2166, _2158);
                    float _2170 = -_2168;
                    float _2172 = 0.0 + _2170;
                    float _2174 = fma(_2168, _2172, _2154);
                    float _2176 = fma(_2160, _2174, _2168);
                    float _2178 = _2176 * 2.3283064365386962890625e-10;
                    _2092 = as_type<int>(_2178);
                    _2082 = as_type<int>(_2168);
                }
            }
        }
    }
    int _2180 = _2092;
    int _2182 = _2082;
    int _2184 = _2084;
    _2061 = _2180;
    _2062 = _2060;
    _2063 = 0;
    _2064 = _2182;
    _2065 = _2184;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _242 = false;
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
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    float2 _1212;
    _1212.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    _1212.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    float _320 = _1212.x;
    float _322 = _320 * 256.0;
    int _324 = int(_322);
    float _326 = -_94;
    float _328 = _326 + 1.0;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = in.m_40.y;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = _196 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _340 = abs(_330);
    float _342 = log2(_340);
    float _344 = -_338;
    float _346 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[11].y, _344);
    float _348 = -_198;
    float _350 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[11].z, _346);
    float _352 = fma(_350, -0.5, 0.5);
    float _354 = fma(_350, 0.5, 0.5);
    float _356 = fma(_354, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _358 = sqrt(_352);
    float _360 = _342 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _362 = fma(_354, _356, -0.212114393711090087890625);
    float _364 = fma(_354, _362, 1.570728778839111328125);
    float _366 = exp2(_360);
    float _368 = _74 * _336;
    float _370 = _358 * 0.636619746685028076171875;
    float _372 = -_364;
    float _374 = fma(_370, _372, 1.0);
    float _376 = _366 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _378 = _194 + 1.0;
    float _380 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = in.m_40.x;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = -_382;
    float _392 = _390 + 1.0;
    float _394 = abs(_392);
    float _396 = log2(_394);
    float _398 = _396 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _400 = exp2(_398);
    float _402 = _74 * _388;
    float2 _1329 = float2(_402, _368);
    float3 _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1329, float2(0.0), isnan(_1329))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1329, float2(0.0), isnan(_1329))).xyz;
    float _408 = _406.x;
    float _410 = _406.y;
    float _412 = _406.z;
    float _414 = -_194;
    float _416 = fma(_400, _378, _414);
    float _418 = fma(_194, -0.5, 0.5);
    float _420 = fma(_416, 0.5, 0.5);
    float _422 = float(uint(_324));
    float _424 = _422 * 0.00390625;
    float2 _1361 = float2(_316, _318);
    float2 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1361, float2(0.0), isnan(_1361)), level(_424)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1361, float2(0.0), isnan(_1361)), level(_424)).xy;
    float _430 = _428.x;
    float _432 = _428.y;
    float2 _1374 = float2(_316, _318);
    float4 _435 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1374, float2(0.0), isnan(_1374)), level(_424)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1374, float2(0.0), isnan(_1374)), level(_424)).xyzw;
    float _437 = _435.x;
    float _439 = _435.y;
    float _441 = _435.z;
    float _443 = _435.w;
    float2 _1391 = float2(_374, _420);
    float3 _445 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1391, float2(0.0), isnan(_1391))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1391, float2(0.0), isnan(_1391))).xyz;
    float _447 = _445.x;
    float _449 = _445.y;
    float _451 = _445.z;
    float2 _1405 = float2(_374, _418);
    float3 _453 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1405, float2(0.0), isnan(_1405))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1405, float2(0.0), isnan(_1405))).xyz;
    float _455 = _453.x;
    float _457 = _453.y;
    float _459 = _453.z;
    float _461 = _396 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _463 = -_94;
    float _465 = fma(_463, _94, _272);
    float _467 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _471 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _473 = exp2(_461);
    float _475 = _94 * _467;
    float _477 = _94 * _469;
    float _479 = _94 * _471;
    float _481 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _483 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _475);
    float _485 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _477);
    float _487 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _479);
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _491 = -_92;
    float _493 = fma(_491, _481, _483);
    float _495 = fma(_92, _481, _483);
    float _497 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _499 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _501 = -_92;
    float _503 = fma(_501, _489, _485);
    float _505 = fma(_92, _489, _485);
    float _507 = -_92;
    float _509 = fma(_507, _497, _487);
    float _511 = fma(_92, _497, _487);
    float _513 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _515 = -_90;
    float _517 = fma(_515, _499, _493);
    float _519 = fma(_90, _499, _495);
    float _521 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _523 = -_90;
    float _525 = fma(_523, _513, _503);
    float _527 = fma(_90, _513, _505);
    float _529 = -_90;
    float _531 = fma(_529, _521, _509);
    float _533 = fma(_90, _521, _511);
    float _535 = -_94;
    float _537 = _90 * _535;
    float _539 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _541 = _90 * _94;
    float _543 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _545 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _547 = fma(_539, _537, _517);
    float _549 = fma(_539, _541, _519);
    float _551 = fma(_543, _541, _527);
    float _553 = _92 * (-3.0);
    float _555 = fma(_543, _537, _525);
    float _557 = -_92;
    float _559 = _94 * _557;
    float _561 = _90 * _92;
    float _563 = _94 * _92;
    float _565 = -_92;
    float _567 = fma(_565, _553, -1.0);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _571 = fma(_545, _541, _533);
    float _573 = fma(_545, _537, _531);
    float _575 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _577 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _579 = fma(_569, _559, _547);
    float _581 = fma(_569, _563, _549);
    float _583 = fma(_575, _559, _573);
    float _585 = fma(_575, _563, _571);
    float _587 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _589 = fma(_577, _559, _555);
    float _591 = fma(_577, _563, _551);
    float _593 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _595 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _597 = fma(_587, _561, _579);
    float _599 = fma(_587, _561, _581);
    float _601 = fma(_593, _561, _589);
    float _603 = fma(_593, _561, _591);
    float _605 = fma(_595, _561, _583);
    float _607 = fma(_595, _561, _585);
    float _609 = fma(_270, 3.0, -1.0);
    float _611 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _613 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _615 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _617 = fma(_611, _567, _597);
    float _619 = fma(_611, _609, _599);
    float _621 = -_473;
    float _623 = _621 + 1.0;
    float _625 = fma(_613, _567, _601);
    float _627 = fma(_615, _567, _605);
    float _629 = fma(_613, _609, _603);
    float _631 = fma(_615, _609, _607);
    float _633 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _635 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _637 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _639 = _623 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _641 = -_412;
    float _643 = _641 + 1.0;
    float _645 = fma(_633, _465, _617);
    float _647 = fma(_633, _465, _619);
    float _649 = fma(_635, _465, _625);
    float _651 = fma(_635, _465, _629);
    float _653 = fma(_637, _465, _627);
    float _655 = fma(_637, _465, _631);
    float _657 = -_639;
    float _659 = _657 + 1.0;
    float _661 = _408 * _410;
    float _663 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _665 = _661 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _667 = abs(_659);
    float _669 = log2(_667);
    float _671 = _432 * _643;
    float _673 = _430 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _675 = _430 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _677 = _443 * _443;
    float _679 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _681 = _673 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _683 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _685 = _669 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _687 = -_679;
    float _689 = _687 + 1.0;
    float _691 = _651 * _681;
    float _693 = _647 * _681;
    float _695 = _655 * _681;
    float _697 = _669 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _699 = fma(_649, _683, _691);
    float _701 = abs(_689);
    float _703 = log2(_701);
    float _705 = fma(_645, _683, _693);
    float _707 = fma(_653, _683, _695);
    float _709 = _699 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _711 = _677 * _677;
    float _713 = _705 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _715 = _707 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _717 = _709 * 0.715200006961822509765625;
    float _719 = exp2(_685);
    float _721 = _711 * 16.0;
    float _723 = _703 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _725 = exp2(_697);
    float _727 = fma(_713, 0.2125999927520751953125, _717);
    float _729 = fma(_715, 0.072200000286102294921875, _727);
    float _731 = _719 * _721;
    float _733 = exp2(_723);
    float _735 = -_709;
    float _737 = _735 + _729;
    float _739 = -_713;
    float _741 = _739 + _729;
    float _743 = -_715;
    float _745 = _743 + _729;
    float _747 = _439 * _731;
    float _749 = fma(_665, _737, _709);
    float _751 = fma(_665, _741, _713);
    float _753 = fma(_665, _745, _715);
    float _755 = _437 * _731;
    float _757 = _725 * _749;
    float _759 = _725 * _751;
    float _761 = _441 * _731;
    float _763 = _725 * _753;
    float _765 = _757 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _767 = -_733;
    float _769 = spvFAdd(_767, 1.00010001659393310546875);
    float _771 = -_733;
    float _773 = _771 + 1.0;
    float _775 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[27].y, _765);
    float _777 = _759 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _779 = 1.0 / _769;
    float _781 = -_679;
    float _783 = _781 + _773;
    float _785 = fma(_449, _663, _775);
    float _787 = fma(_755, (*spvDescriptorSet0.fp_c3)._m0[27].x, _777);
    float _789 = _783 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _791 = _763 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _793 = fma(_447, _663, _787);
    float _795 = _457 * _789;
    float _797 = fma(_761, (*spvDescriptorSet0.fp_c3)._m0[27].z, _791);
    float _799 = _455 * _789;
    float _801 = _459 * _789;
    float _803 = fma(_679, _785, _795);
    float _805 = fma(_451, _663, _797);
    float _807 = fma(_679, _793, _799);
    float _809 = _779 * _803;
    float _811 = fma(_679, _805, _801);
    float _813 = _779 * _807;
    float _815 = _809 * 0.715200006961822509765625;
    float _817 = _779 * _811;
    float _819 = fma(_813, 0.2125999927520751953125, _815);
    float _821 = fma(_817, 0.072200000286102294921875, _819);
    float _823 = 1.0 / _821;
    float _825 = _823 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _827 = precise::clamp(_825, 0.0, 1.0);
    float _829 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _831 = _813 * _829;
    float _833 = _809 * _829;
    float _835 = _817 * _829;
    out.m_38.x = _831;
    out.m_38.y = _833;
    out.m_38.z = _835;
    out.m_38.w = _773;
    return out;
}

