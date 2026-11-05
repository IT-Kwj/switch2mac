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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _44(thread const int& _2002, thread const int& _2003, thread const int& _2004, thread int& _2005, thread int& _2006, thread int& _2007, thread int& _2008, thread int& _2009)
{
    float _2012 = as_type<float>(_2002) + 0.0;
    bool _2014 = _2012 != 0.0;
    bool _2016 = isnan(_2012);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.0);
    bool _2022 = _2018 || _2020;
    int _2024 = as_type<int>(_2012);
    int _2026 = _2022 ? (-1) : 0;
    if (!_2022)
    {
        float _2028 = as_type<float>(_2002) * 1.0;
        _2024 = as_type<int>(_2028);
    }
    int _2030 = _2024;
    bool _2032 = !_2022;
    int _2034 = _2030;
    if (!_2032)
    {
        float _2036 = as_type<float>(_2002) + 0.0;
        bool _2038 = _2036 >= 0.0;
        bool _2040 = isnan(_2036);
        bool _2042 = _2038 || _2040;
        bool _2044 = isnan(0.0);
        bool _2046 = _2042 || _2044;
        int _2048 = as_type<int>(_2036);
        _2026 = _2046 ? (-1) : 0;
        if (!_2046)
        {
            _2048 = 2147483647;
        }
        int _2050 = _2048;
        bool _2052 = !_2046;
        _2034 = _2050;
        if (!_2052)
        {
            float _2054 = abs(as_type<float>(_2002));
            float _2056 = _2054 + 0.0;
            bool _2058 = _2056 > as_type<float>(0x7f800000u /* inf */);
            bool _2060 = isnan(_2056);
            bool _2062 = _2058 || _2060;
            bool _2064 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2066 = _2062 || _2064;
            int _2068 = as_type<int>(_2056);
            _2026 = _2066 ? (-1) : 0;
            if (_2066)
            {
                float _2070 = as_type<float>(_2002) + 1.0;
                _2068 = as_type<int>(_2070);
            }
            int _2072 = _2068;
            _2034 = _2072;
            if (!_2066)
            {
                float _2074 = abs(as_type<float>(_2002));
                float _2076 = _2074 + (-0.0);
                float _2078 = 0.0 + _2076;
                bool _2080 = _2078 != as_type<float>(0x7f800000u /* inf */);
                bool _2082 = isnan(_2078);
                bool _2084 = _2080 || _2082;
                bool _2086 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2088 = _2084 || _2086;
                int _2090 = as_type<int>(_2078);
                _2026 = _2088 ? (-1) : 0;
                if (!_2088)
                {
                    _2090 = _2002;
                }
                int _2092 = _2090;
                bool _2094 = !_2088;
                _2034 = _2092;
                if (!_2094)
                {
                    float _2096 = as_type<float>(_2002) * 18446744073709551616.0;
                    float _2098 = rsqrt(_2096);
                    float _2100 = _2096 * _2098;
                    float _2102 = _2098 * 0.5;
                    float _2104 = -_2100;
                    float _2106 = 0.0 + _2104;
                    float _2108 = fma(_2102, _2106, 0.5);
                    float _2110 = fma(_2100, _2108, _2100);
                    float _2112 = -_2110;
                    float _2114 = 0.0 + _2112;
                    float _2116 = fma(_2110, _2114, _2096);
                    float _2118 = fma(_2102, _2116, _2110);
                    float _2120 = _2118 * 2.3283064365386962890625e-10;
                    _2034 = as_type<int>(_2120);
                }
            }
        }
    }
    int _2122 = _2034;
    int _2124 = _2026;
    _2005 = _2122;
    _2006 = _2122;
    _2007 = _2004;
    _2008 = 0;
    _2009 = _2124;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _238 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_33.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _48;
    float _70 = _68 * _54;
    float _72 = _68 * _60;
    float _74 = _68 * _66;
    float _76 = _70 * _70;
    float _78 = fma(_72, _72, _76);
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = fma(_74, _74, _78);
    float _84 = precise::max(0.0, _80);
    float _86 = rsqrt(_82);
    float _88 = _72 * _86;
    float _90 = _74 * _86;
    float _92 = _70 * _86;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = -_92;
    float _100 = -_84;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _104 = _94 * _94;
    float _106 = _96 * _96;
    float _108 = _104 + _106;
    float _110 = sqrt(_108);
    bool _114 = _110 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _116 = _86;
    float _118 = _84;
    float _120 = _102;
    float _122 = _94;
    float _124 = _96;
    if (!_114)
    {
        _116 = _106;
    }
    float _126 = _116;
    float _128 = _126;
    if (!_114)
    {
        _118 = _104;
    }
    float _130 = _118;
    bool _132 = !_114;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _110 + _138;
        float _142 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_108);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _94 * _160;
        float _166 = _96 * _160;
        float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = _166 * _166;
        float _172 = fma(_102, _156, _168);
        float _174 = _164 * _164;
        _120 = _172;
        _134 = _174;
        _128 = _170;
        _122 = _164;
        _124 = _166;
    }
    float _176 = _120;
    float _178 = _134;
    float _180 = _128;
    float _182 = _122;
    float _184 = _124;
    float _186 = fma(_176, _176, _178);
    float _188 = _186 + _180;
    float _190 = rsqrt(_188);
    float _192 = _190 * _176;
    float _194 = _190 * _182;
    float _196 = _190 * _184;
    float _198 = -_192;
    float _200 = precise::max(0.0, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = fma(_200, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _210 = as_type<int>(_206) + (-218103808);
    float _212 = fma(_200, _208, -0.212114393711090087890625);
    bool _214 = uint(_210) >= 1920991232u;
    float _216 = fma(_200, _212, 1.570728778839111328125);
    bool _218 = !_214;
    float _236;
    if (!_218)
    {
        int _220 = as_type<int>(_206);
        int _222 = 0;
        int _224 = 1136;
        int _226;
        int _228;
        int _230;
        int _232;
        int _234;
        _44(_220, _222, _224, _226, _228, _230, _232, _234);
        _236 = as_type<float>(_226);
        _238 = true;
    }
    else
    {
        float _240 = rsqrt(_206);
        float _242 = _206 * _240;
        float _244 = _240 * 0.5;
        float _246 = -_242;
        float _248 = 0.0 + _246;
        float _250 = fma(_244, _248, 0.5);
        float _252 = fma(_242, _250, _242);
        float _254 = -_252;
        float _256 = 0.0 + _254;
        float _258 = fma(_252, _256, _206);
        float _260 = fma(_244, _258, _252);
        _236 = _260;
    }
    _238 = false;
    float _262 = _236;
    bool _264 = _192 > 0.0;
    float _266 = _90 * _90;
    float _268 = _88 * _88;
    float _270 = _266 + _268;
    if (_264)
    {
        discard_fragment();
    }
    float _272 = rsqrt(_270);
    float _274 = _216 * _262;
    float _276 = _274 * 0.636619746685028076171875;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = -_278;
    float _282 = _280 + 1.0;
    float _284 = sqrt(_282);
    float _286 = _90 * _272;
    float _288 = _88 * _272;
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
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    float2 _1182;
    _1182.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_312, _314));
    _1182.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_312, _314));
    float _316 = _1182.x;
    float _318 = _316 * 256.0;
    int _320 = int(_318);
    float _322 = -_92;
    float _324 = _322 + 1.0;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _194 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _330 = abs(_326);
    float _332 = log2(_330);
    float _334 = _332 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _336 = exp2(_334);
    float _338 = _336 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _340 = _192 + 1.0;
    float _342 = fma(_338, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_328;
    float _348 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[11].y, _346);
    float _350 = -_344;
    float _352 = _350 + 1.0;
    float _354 = -_196;
    float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[11].z, _348);
    float _358 = abs(_352);
    float _360 = log2(_358);
    float _362 = fma(_356, -0.5, 0.5);
    float _364 = fma(_356, 0.5, 0.5);
    float _366 = fma(_364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _368 = sqrt(_362);
    float _370 = fma(_364, _366, -0.212114393711090087890625);
    float _372 = fma(_364, _370, 1.570728778839111328125);
    float _374 = _360 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _376 = exp2(_374);
    float _378 = _368 * 0.636619746685028076171875;
    float _380 = -_372;
    float _382 = fma(_378, _380, 1.0);
    float _384 = -_192;
    float _386 = fma(_376, _340, _384);
    float _388 = fma(_386, 0.5, 0.5);
    float _390 = float(uint(_320));
    float _392 = _390 * 0.00390625;
    float2 _1293 = float2(_312, _314);
    float2 _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1293, float2(0.0), isnan(_1293)), level(_392)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1293, float2(0.0), isnan(_1293)), level(_392)).xy;
    float _398 = _396.x;
    float _400 = _396.y;
    float2 _1308 = float2(_312, _314);
    float4 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1308, float2(0.0), isnan(_1308)), level(_392)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1308, float2(0.0), isnan(_1308)), level(_392)).xyzw;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = _403.w;
    float2 _1325 = float2(_382, _388);
    float3 _415 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1325, float2(0.0), isnan(_1325))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1325, float2(0.0), isnan(_1325))).xyz;
    float _417 = _415.x;
    float _419 = _415.y;
    float _421 = _415.z;
    float _423 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _425 = _192 * _423;
    float _427 = _88 * _92;
    float _429 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].x, _425);
    float _431 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _433 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _435 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[26].z, _429);
    float _437 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _439 = _92 * _431;
    float _441 = _92 * _433;
    float _443 = _92 * _437;
    float _445 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _447 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _439);
    float _449 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _441);
    float _451 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _443);
    float _453 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _455 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _457 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _459 = -_90;
    float _461 = fma(_459, _445, _451);
    float _463 = -_90;
    float _465 = fma(_463, _453, _447);
    float _467 = fma(_90, _453, _447);
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _471 = fma(_90, _445, _451);
    float _473 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _475 = -_90;
    float _477 = fma(_475, _455, _449);
    float _479 = -_88;
    float _481 = fma(_479, _469, _461);
    float _483 = _192 * (-10000.0);
    float _485 = fma(_88, _469, _471);
    float _487 = _90 * (-3.0);
    float _489 = fma(_90, _455, _449);
    float _491 = -_88;
    float _493 = fma(_491, _473, _465);
    float _495 = abs(_483);
    bool _497 = _495 > 0.00999999977648258209228515625;
    float _499 = fma(_88, _473, _467);
    float _501 = -_92;
    float _503 = fma(_501, _92, _268);
    float _505 = _88 * _90;
    float _507 = _497 ? _483 : 0.00999999977648258209228515625;
    float _509 = -_90;
    float _511 = _92 * _509;
    float _513 = -_90;
    float _515 = fma(_513, _487, -1.0);
    float _517 = _92 * _90;
    float _519 = -_92;
    float _521 = _88 * _519;
    float _523 = _507 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _525 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _527 = fma(_435, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _529 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _531 = precise::max(_523, -127.0);
    float _533 = -_88;
    float _535 = fma(_533, _457, _477);
    float _537 = -_525;
    float _539 = exp2(_537);
    float _541 = fma(_88, _457, _489);
    float _543 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _545 = fma(_527, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _547 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _549 = fma(_529, _521, _493);
    float _551 = fma(_543, _521, _481);
    float _553 = fma(_543, _427, _485);
    float _555 = -_531;
    float _557 = exp2(_555);
    float _559 = fma(_529, _427, _499);
    float _561 = _360 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _565 = fma(_547, _521, _535);
    float _567 = fma(_547, _427, _541);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _571 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _573 = abs(_545);
    float _575 = log2(_573);
    float _577 = fma(_563, _511, _551);
    float _579 = fma(_563, _517, _553);
    float _581 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _583 = fma(_569, _517, _559);
    float _585 = fma(_571, _517, _567);
    float _587 = fma(_569, _511, _549);
    float _589 = fma(_581, _505, _579);
    float _591 = exp2(_561);
    float _593 = -_557;
    float _595 = _593 + 1.0;
    float _597 = fma(_581, _505, _577);
    float _599 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _601 = fma(_571, _511, _565);
    float _603 = _539 * _595;
    float _605 = fma(_599, _505, _587);
    float _607 = _575 * 1.5;
    float _609 = 1.0 / _531;
    float _611 = fma(_266, 3.0, -1.0);
    float _613 = fma(_599, _505, _583);
    float _615 = -_591;
    float _617 = _615 + 1.0;
    float _619 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _621 = exp2(_607);
    float _623 = _617 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _625 = fma(_619, _505, _585);
    float _627 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _629 = fma(_619, _505, _601);
    float _631 = -_623;
    float _633 = _631 + 1.0;
    float _635 = _603 * _609;
    float _637 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _639 = fma(_627, _611, _589);
    float _641 = abs(_633);
    float _643 = log2(_641);
    float _645 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _647 = fma(_627, _515, _597);
    float _649 = fma(_637, _515, _605);
    float _651 = fma(_637, _611, _613);
    float _653 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _655 = _621 * 12.56637096405029296875;
    float _657 = fma(_645, _515, _629);
    float _659 = fma(_645, _611, _625);
    float _661 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _663 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _665 = fma(_653, _503, _647);
    float _667 = 1.0 / _655;
    float _669 = fma(_653, _503, _639);
    float _671 = fma(_661, _503, _649);
    float _673 = _643 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _675 = fma(_661, _503, _651);
    float _677 = fma(_663, _503, _657);
    float _679 = fma(_663, _503, _659);
    float _681 = _643 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _683 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _685 = fma(_683, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _687 = exp2(_673);
    float _689 = _685 * _667;
    float _691 = _398 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _693 = _398 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _695 = _411 * _411;
    float _697 = _400 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _699 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _701 = _693 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _703 = exp2(_681);
    float _705 = _695 * _695;
    float _707 = _675 * _699;
    float _709 = _669 * _699;
    float _711 = _679 * _699;
    float _713 = _705 * 16.0;
    float _715 = fma(_671, _701, _707);
    float _717 = fma(_665, _701, _709);
    float _719 = fma(_677, _701, _711);
    float _721 = _715 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _723 = _717 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _725 = _719 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _727 = _687 * _721;
    float _729 = _687 * _723;
    float _731 = _703 * _713;
    float _733 = _727 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _735 = _687 * _725;
    float _737 = _407 * _731;
    float _739 = _405 * _731;
    float _741 = _409 * _731;
    float _743 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[27].y, _733);
    float _745 = _729 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _747 = _623 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _751 = _735 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _753 = fma(_739, (*spvDescriptorSet0.fp_c3)._m0[27].x, _745);
    float _755 = fma(_419, _747, _743);
    float _757 = _635 * _749;
    float _759 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[27].z, _751);
    float _761 = fma(_417, _747, _753);
    float _763 = _755 * 0.715200006961822509765625;
    float _765 = fma(_421, _747, _759);
    float _767 = -_757;
    float _769 = exp2(_767);
    float _771 = fma(_761, 0.2125999927520751953125, _763);
    float _773 = fma(_765, 0.072200000286102294921875, _771);
    float _775 = 1.0 / _773;
    float _777 = -_769;
    float _779 = _777 + 1.0;
    float _781 = _689 * _779;
    float _783 = _781 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _785 = _775 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _789 = fma(_787, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _791 = _781 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _793 = _781 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _795 = _769 * _789;
    float _797 = fma(_761, _795, _791);
    float _799 = fma(_755, _795, _783);
    float _801 = fma(_765, _795, _793);
    out.m_36.x = _797;
    out.m_36.y = _799;
    out.m_36.z = _801;
    out.m_36.w = _697;
    out.m_38.x = _797;
    out.m_38.y = _799;
    out.m_38.z = _801;
    out.m_38.w = _697;
    return out;
}

