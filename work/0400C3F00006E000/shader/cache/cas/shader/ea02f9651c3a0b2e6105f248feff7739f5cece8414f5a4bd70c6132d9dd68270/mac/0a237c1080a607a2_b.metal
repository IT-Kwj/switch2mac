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
    float4 m_42 [[color(1)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _1988, thread const int& _1989, thread const int& _1990, thread const int& _1991, thread int& _1992, thread int& _1993, thread int& _1994, thread int& _1995, thread int& _1996, thread int& _1997)
{
    float _2000 = as_type<float>(_1988) + 0.0;
    bool _2002 = _2000 != 0.0;
    bool _2004 = isnan(_2000);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan(0.0);
    bool _2010 = _2006 || _2008;
    int _2012 = as_type<int>(_2000);
    int _2014 = _1990;
    int _2016 = _2010 ? (-1) : 0;
    if (!_2010)
    {
        float _2018 = as_type<float>(_1988) * 1.0;
        _2012 = as_type<int>(_2018);
    }
    int _2020 = _2012;
    bool _2022 = !_2010;
    int _2024 = _2020;
    if (!_2022)
    {
        float _2026 = as_type<float>(_1988) + 0.0;
        bool _2028 = _2026 >= 0.0;
        bool _2030 = isnan(_2026);
        bool _2032 = _2028 || _2030;
        bool _2034 = isnan(0.0);
        bool _2036 = _2032 || _2034;
        int _2038 = as_type<int>(_2026);
        _2016 = _2036 ? (-1) : 0;
        if (!_2036)
        {
            _2038 = 2147483647;
        }
        int _2040 = _2038;
        bool _2042 = !_2036;
        _2024 = _2040;
        if (!_2042)
        {
            float _2044 = abs(as_type<float>(_1988));
            float _2046 = _2044 + 0.0;
            bool _2048 = _2046 > as_type<float>(0x7f800000u /* inf */);
            bool _2050 = isnan(_2046);
            bool _2052 = _2048 || _2050;
            bool _2054 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2056 = _2052 || _2054;
            int _2058 = as_type<int>(_2046);
            _2016 = _2056 ? (-1) : 0;
            if (_2056)
            {
                float _2060 = as_type<float>(_1988) + 1.0;
                _2058 = as_type<int>(_2060);
            }
            int _2062 = _2058;
            _2024 = _2062;
            if (!_2056)
            {
                float _2064 = abs(as_type<float>(_1988));
                float _2066 = _2064 + (-0.0);
                float _2068 = 0.0 + _2066;
                bool _2070 = _2068 != as_type<float>(0x7f800000u /* inf */);
                bool _2072 = isnan(_2068);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2078 = _2074 || _2076;
                int _2080 = as_type<int>(_2068);
                _2016 = _2078 ? (-1) : 0;
                if (!_2078)
                {
                    _2080 = _1988;
                }
                int _2082 = _2080;
                bool _2084 = !_2078;
                _2024 = _2082;
                if (!_2084)
                {
                    float _2086 = as_type<float>(_1988) * 18446744073709551616.0;
                    float _2088 = rsqrt(_2086);
                    float _2090 = _2086 * _2088;
                    float _2092 = _2088 * 0.5;
                    float _2094 = -_2090;
                    float _2096 = 0.0 + _2094;
                    float _2098 = fma(_2092, _2096, 0.5);
                    float _2100 = fma(_2090, _2098, _2090);
                    float _2102 = -_2100;
                    float _2104 = 0.0 + _2102;
                    float _2106 = fma(_2100, _2104, _2086);
                    float _2108 = fma(_2092, _2106, _2100);
                    float _2110 = _2108 * 2.3283064365386962890625e-10;
                    _2024 = as_type<int>(_2110);
                    _2014 = as_type<int>(_2100);
                }
            }
        }
    }
    int _2112 = _2024;
    int _2114 = _2014;
    int _2116 = _2016;
    _1992 = _2112;
    _1993 = _2112;
    _1994 = _1991;
    _1995 = 0;
    _1996 = _2114;
    _1997 = _2116;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _246 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_37.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_37.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_37.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _52;
    float _74 = _72 * _58;
    float _76 = _72 * _64;
    float _78 = _72 * _70;
    float _80 = _74 * _74;
    float _82 = fma(_76, _76, _80);
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _86 = fma(_78, _78, _82);
    float _88 = precise::max(0.0, _84);
    float _90 = rsqrt(_86);
    float _92 = _76 * _90;
    float _94 = _78 * _90;
    float _96 = _74 * _90;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = -_96;
    float _104 = -_88;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].z, _104);
    float _108 = _98 * _98;
    float _110 = _100 * _100;
    float _112 = _108 + _110;
    float _114 = sqrt(_112);
    bool _118 = _114 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _120 = _88;
    float _122 = _90;
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
    float _244;
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
        _48(_224, _226, _228, _230, _232, _234, _236, _238, _240, _242);
        _244 = as_type<float>(_232);
        _246 = true;
    }
    else
    {
        float _248 = rsqrt(_210);
        float _250 = _210 * _248;
        float _252 = _248 * 0.5;
        float _254 = -_250;
        float _256 = 0.0 + _254;
        float _258 = fma(_252, _256, 0.5);
        float _260 = fma(_250, _258, _250);
        float _262 = -_260;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, _210);
        float _268 = fma(_252, _266, _260);
        _244 = _268;
    }
    _246 = false;
    float _270 = _244;
    bool _272 = _196 > 0.0;
    float _274 = _94 * _94;
    float _276 = _92 * _92;
    float _278 = _274 + _276;
    if (_272)
    {
        discard_fragment();
    }
    float _280 = rsqrt(_278);
    float _282 = _220 * _270;
    float _284 = _282 * 0.636619746685028076171875;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = -_286;
    float _290 = _288 + 1.0;
    float _292 = sqrt(_290);
    float _294 = _94 * _280;
    float _296 = _92 * _280;
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
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float2 _1178;
    _1178.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _1178.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _324 = _1178.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = -_96;
    float _332 = _330 + 1.0;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _198 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _338 = abs(_334);
    float _340 = log2(_338);
    float _342 = -_336;
    float _344 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[11].y, _342);
    float _346 = -_200;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[11].z, _344);
    float _350 = _340 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _352 = exp2(_350);
    float _354 = _352 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _356 = _196 + 1.0;
    float _358 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_348, -0.5, 0.5);
    float _364 = fma(_348, 0.5, 0.5);
    float _366 = -_360;
    float _368 = _366 + 1.0;
    float _370 = fma(_364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _372 = sqrt(_362);
    float _374 = fma(_364, _370, -0.212114393711090087890625);
    float _376 = fma(_364, _374, 1.570728778839111328125);
    float _378 = abs(_368);
    float _380 = log2(_378);
    float _382 = _372 * 0.636619746685028076171875;
    float _384 = -_376;
    float _386 = fma(_382, _384, 1.0);
    float _388 = _380 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _390 = exp2(_388);
    float _392 = -_196;
    float _394 = fma(_390, _356, _392);
    float _396 = fma(_394, 0.5, 0.5);
    float _398 = float(uint(_328));
    float _400 = _398 * 0.00390625;
    float2 _1289 = float2(_320, _322);
    float2 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1289, float2(0.0), isnan(_1289)), level(_400)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1289, float2(0.0), isnan(_1289)), level(_400)).xy;
    float _406 = _404.x;
    float _408 = _404.y;
    float2 _1304 = float2(_320, _322);
    float2 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1304, float2(0.0), isnan(_1304)), level(_400)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1304, float2(0.0), isnan(_1304)), level(_400)).xy;
    float _412 = _410.x;
    float _414 = _410.y;
    float2 _1317 = float2(_320, _322);
    float4 _417 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1317, float2(0.0), isnan(_1317)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1317, float2(0.0), isnan(_1317)), level(_400)).xyzw;
    float _419 = _417.x;
    float _421 = _417.y;
    float _423 = _417.z;
    float _425 = _417.w;
    float2 _1334 = float2(_320, _322);
    float4 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1334, float2(0.0), isnan(_1334)), level(_400)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1334, float2(0.0), isnan(_1334)), level(_400)).xyzw;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _427.w;
    float2 _1351 = float2(_386, _396);
    float3 _439 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1351, float2(0.0), isnan(_1351))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1351, float2(0.0), isnan(_1351))).xyz;
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    float _447 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _449 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _451 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _453 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _455 = _96 * _447;
    float _457 = _96 * _449;
    float _459 = _96 * _451;
    float _461 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _463 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _455);
    float _465 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _457);
    float _467 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _459);
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _471 = -_94;
    float _473 = fma(_471, _461, _463);
    float _475 = -_94;
    float _477 = fma(_475, _453, _465);
    float _479 = fma(_94, _453, _465);
    float _481 = fma(_94, _461, _463);
    float _483 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _485 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _487 = -_94;
    float _489 = fma(_487, _469, _467);
    float _491 = fma(_94, _469, _467);
    float _493 = -_92;
    float _495 = fma(_493, _483, _477);
    float _497 = -_92;
    float _499 = fma(_497, _485, _473);
    float _501 = fma(_92, _485, _481);
    float _503 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _505 = fma(_92, _483, _479);
    float _507 = _92 * _96;
    float _509 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _511 = -_96;
    float _513 = _92 * _511;
    float _515 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _517 = fma(_92, _503, _491);
    float _519 = -_92;
    float _521 = fma(_519, _503, _489);
    float _523 = fma(_509, _507, _505);
    float _525 = fma(_509, _513, _495);
    float _527 = _92 * _92;
    float _529 = fma(_515, _513, _499);
    float _531 = fma(_515, _507, _501);
    float _533 = _94 * (-3.0);
    float _535 = -_94;
    float _537 = _96 * _535;
    float _539 = -_96;
    float _541 = fma(_539, _96, _527);
    float _543 = _92 * _94;
    float _545 = _96 * _94;
    float _547 = -_94;
    float _549 = fma(_547, _533, -1.0);
    float _551 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _555 = fma(_274, 3.0, -1.0);
    float _557 = fma(_551, _513, _521);
    float _559 = fma(_551, _507, _517);
    float _561 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _565 = fma(_553, _537, _525);
    float _567 = fma(_553, _545, _523);
    float _569 = fma(_561, _537, _557);
    float _571 = fma(_561, _545, _559);
    float _573 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _575 = fma(_563, _537, _529);
    float _577 = fma(_563, _545, _531);
    float _579 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _581 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _583 = _380 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _585 = fma(_579, _543, _575);
    float _587 = fma(_579, _543, _577);
    float _589 = fma(_573, _543, _565);
    float _591 = fma(_573, _543, _567);
    float _593 = fma(_581, _543, _569);
    float _595 = fma(_581, _543, _571);
    float _597 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _599 = exp2(_583);
    float _601 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _603 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _605 = fma(_597, _555, _591);
    float _607 = fma(_597, _549, _589);
    float _609 = fma(_601, _549, _585);
    float _611 = fma(_603, _549, _593);
    float _613 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _615 = fma(_601, _555, _587);
    float _617 = fma(_603, _555, _595);
    float _619 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _621 = fma(_613, _541, _607);
    float _623 = fma(_613, _541, _605);
    float _625 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _627 = fma(_619, _541, _609);
    float _629 = -_599;
    float _631 = _629 + 1.0;
    float _633 = fma(_619, _541, _615);
    float _635 = fma(_625, _541, _611);
    float _637 = fma(_625, _541, _617);
    float _639 = _631 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _641 = -_639;
    float _643 = _641 + 1.0;
    float _645 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _647 = _406 * _408;
    float _649 = -_408;
    float _651 = _649 + _414;
    float _653 = _425 * _425;
    float _655 = _435 * _435;
    float _657 = -_647;
    float _659 = fma(_412, _414, _657);
    float _661 = fma(_651, (*spvDescriptorSet0.fp_c3)._m0[0].x, _408);
    float _663 = _653 * _653;
    float _665 = abs(_643);
    float _667 = log2(_665);
    float _669 = fma(_659, (*spvDescriptorSet0.fp_c3)._m0[0].x, _647);
    float _671 = _655 * _655;
    float _673 = precise::max(_661, 1.52587890625e-05);
    float _675 = _663 * 16.0;
    float _677 = _661 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _679 = _408 * _675;
    float _681 = 1.0 / _673;
    float _683 = _419 * _679;
    float _685 = _421 * _679;
    float _687 = _423 * _679;
    float _689 = _667 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _691 = _667 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _693 = exp2(_689);
    float _695 = _669 * _681;
    float _697 = _695 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _699 = _695 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _701 = _697 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _703 = _699 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _705 = exp2(_691);
    float _707 = _693 * _681;
    float _709 = _623 * _701;
    float _711 = _671 * 16.0;
    float _713 = _633 * _701;
    float _715 = _637 * _701;
    float _717 = fma(_621, _703, _709);
    float _719 = _414 * _711;
    float _721 = fma(_627, _703, _713);
    float _723 = fma(_635, _703, _715);
    float _725 = -_683;
    float _727 = fma(_429, _719, _725);
    float _729 = -_685;
    float _731 = fma(_431, _719, _729);
    float _733 = _721 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _735 = -_687;
    float _737 = fma(_433, _719, _735);
    float _739 = fma(_727, (*spvDescriptorSet0.fp_c3)._m0[0].x, _683);
    float _741 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[0].x, _685);
    float _743 = _705 * _733;
    float _745 = _717 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _747 = _723 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _749 = _741 * _707;
    float _751 = _743 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _753 = _705 * _745;
    float _755 = _705 * _747;
    float _757 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _687);
    float _759 = fma(_749, (*spvDescriptorSet0.fp_c3)._m0[27].y, _751);
    float _761 = _739 * _707;
    float _763 = _753 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _765 = _757 * _707;
    float _767 = _755 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _769 = fma(_443, _645, _759);
    float _771 = fma(_761, (*spvDescriptorSet0.fp_c3)._m0[27].x, _763);
    float _773 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[27].z, _767);
    float _775 = _769 * 0.715200006961822509765625;
    float _777 = fma(_441, _645, _771);
    float _779 = fma(_445, _645, _773);
    float _781 = fma(_777, 0.2125999927520751953125, _775);
    float _783 = fma(_779, 0.072200000286102294921875, _781);
    float _785 = 1.0 / _783;
    float _787 = _785 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _793 = _777 * _791;
    float _795 = _769 * _791;
    float _797 = _779 * _791;
    out.m_40.x = _793;
    out.m_40.y = _795;
    out.m_40.z = _797;
    out.m_40.w = _677;
    out.m_42.x = _793;
    out.m_42.y = _795;
    out.m_42.z = _797;
    out.m_42.w = _677;
    return out;
}

