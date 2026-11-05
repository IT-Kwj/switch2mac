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
void _48(thread const int& _1936, thread const int& _1937, thread const int& _1938, thread const int& _1939, thread int& _1940, thread int& _1941, thread int& _1942, thread int& _1943, thread int& _1944, thread int& _1945)
{
    float _1948 = as_type<float>(_1936) + 0.0;
    bool _1950 = _1948 != 0.0;
    bool _1952 = isnan(_1948);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(0.0);
    bool _1958 = _1954 || _1956;
    int _1960 = as_type<int>(_1948);
    int _1962 = _1938;
    int _1964 = _1958 ? (-1) : 0;
    if (!_1958)
    {
        float _1966 = as_type<float>(_1936) * 1.0;
        _1960 = as_type<int>(_1966);
    }
    int _1968 = _1960;
    bool _1970 = !_1958;
    int _1972 = _1968;
    if (!_1970)
    {
        float _1974 = as_type<float>(_1936) + 0.0;
        bool _1976 = _1974 >= 0.0;
        bool _1978 = isnan(_1974);
        bool _1980 = _1976 || _1978;
        bool _1982 = isnan(0.0);
        bool _1984 = _1980 || _1982;
        int _1986 = as_type<int>(_1974);
        _1964 = _1984 ? (-1) : 0;
        if (!_1984)
        {
            _1986 = 2147483647;
        }
        int _1988 = _1986;
        bool _1990 = !_1984;
        _1972 = _1988;
        if (!_1990)
        {
            float _1992 = abs(as_type<float>(_1936));
            float _1994 = _1992 + 0.0;
            bool _1996 = _1994 > as_type<float>(0x7f800000u /* inf */);
            bool _1998 = isnan(_1994);
            bool _2000 = _1996 || _1998;
            bool _2002 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2004 = _2000 || _2002;
            int _2006 = as_type<int>(_1994);
            _1964 = _2004 ? (-1) : 0;
            if (_2004)
            {
                float _2008 = as_type<float>(_1936) + 1.0;
                _2006 = as_type<int>(_2008);
            }
            int _2010 = _2006;
            _1972 = _2010;
            if (!_2004)
            {
                float _2012 = abs(as_type<float>(_1936));
                float _2014 = _2012 + (-0.0);
                float _2016 = 0.0 + _2014;
                bool _2018 = _2016 != as_type<float>(0x7f800000u /* inf */);
                bool _2020 = isnan(_2016);
                bool _2022 = _2018 || _2020;
                bool _2024 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2026 = _2022 || _2024;
                int _2028 = as_type<int>(_2016);
                _1964 = _2026 ? (-1) : 0;
                if (!_2026)
                {
                    _2028 = _1936;
                }
                int _2030 = _2028;
                bool _2032 = !_2026;
                _1972 = _2030;
                if (!_2032)
                {
                    float _2034 = as_type<float>(_1936) * 18446744073709551616.0;
                    float _2036 = rsqrt(_2034);
                    float _2038 = _2034 * _2036;
                    float _2040 = _2036 * 0.5;
                    float _2042 = -_2038;
                    float _2044 = 0.0 + _2042;
                    float _2046 = fma(_2040, _2044, 0.5);
                    float _2048 = fma(_2038, _2046, _2038);
                    float _2050 = -_2048;
                    float _2052 = 0.0 + _2050;
                    float _2054 = fma(_2048, _2052, _2034);
                    float _2056 = fma(_2040, _2054, _2048);
                    float _2058 = _2056 * 2.3283064365386962890625e-10;
                    _1972 = as_type<int>(_2058);
                    _1962 = as_type<int>(_2048);
                }
            }
        }
    }
    int _2060 = _1972;
    int _2062 = _1962;
    int _2064 = _1964;
    _1940 = _2060;
    _1941 = _2060;
    _1942 = _1939;
    _1943 = 0;
    _1944 = _2062;
    _1945 = _2064;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _246 = false;
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
    float2 _1164;
    _1164.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _1164.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _324 = _1164.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = -_96;
    float _332 = _330 + 1.0;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = in.m_42.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_42.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = abs(_334);
    float _350 = log2(_348);
    float _352 = _350 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _354 = _196 + 1.0;
    float _356 = exp2(_352);
    float _358 = _356 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _360 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _198 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _366 = -_362;
    float _368 = _366 + 1.0;
    float _370 = -_364;
    float _372 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[11].y, _370);
    float _374 = abs(_368);
    float _376 = log2(_374);
    float _378 = -_200;
    float _380 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
    float _382 = _72 * _346;
    float _384 = fma(_380, -0.5, 0.5);
    float _386 = fma(_380, 0.5, 0.5);
    float _388 = fma(_386, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _390 = sqrt(_384);
    float _392 = fma(_386, _388, -0.212114393711090087890625);
    float _394 = _376 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _396 = fma(_386, _392, 1.570728778839111328125);
    float _398 = exp2(_394);
    float _400 = _390 * 0.636619746685028076171875;
    float _402 = -_396;
    float _404 = fma(_400, _402, 1.0);
    float _406 = -_196;
    float _408 = fma(_398, _354, _406);
    float _410 = _72 * _340;
    float _412 = fma(_408, 0.5, 0.5);
    float _414 = float(uint(_328));
    float _416 = _414 * 0.00390625;
    float2 _1295 = float2(_320, _322);
    float2 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1295, float2(0.0), isnan(_1295)), level(_416)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1295, float2(0.0), isnan(_1295)), level(_416)).xy;
    float _422 = _420.x;
    float _424 = _420.y;
    float2 _1310 = float2(_410, _382);
    float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1310, float2(0.0), isnan(_1310))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1310, float2(0.0), isnan(_1310))).xyz;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float2 _1324 = float2(_320, _322);
    float4 _437 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1324, float2(0.0), isnan(_1324)), level(_416)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1324, float2(0.0), isnan(_1324)), level(_416)).xyzw;
    float _439 = _437.x;
    float _441 = _437.y;
    float _443 = _437.z;
    float _445 = _437.w;
    float2 _1341 = float2(_404, _412);
    float3 _447 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1341, float2(0.0), isnan(_1341))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1341, float2(0.0), isnan(_1341))).xyz;
    float _449 = _447.x;
    float _451 = _447.y;
    float _453 = _447.z;
    float _455 = -_96;
    float _457 = fma(_455, _96, _276);
    float _459 = fma(_274, 3.0, -1.0);
    float _461 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _463 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _465 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _467 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _469 = _96 * _461;
    float _471 = _96 * _463;
    float _473 = _96 * _465;
    float _475 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _477 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _469);
    float _479 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _471);
    float _481 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _473);
    float _483 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _485 = -_94;
    float _487 = fma(_485, _475, _477);
    float _489 = fma(_94, _475, _477);
    float _491 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _493 = -_94;
    float _495 = fma(_493, _483, _479);
    float _497 = fma(_94, _483, _479);
    float _499 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _501 = -_94;
    float _503 = fma(_501, _467, _481);
    float _505 = fma(_94, _467, _481);
    float _507 = fma(_92, _491, _489);
    float _509 = -_92;
    float _511 = fma(_509, _499, _495);
    float _513 = fma(_92, _499, _497);
    float _515 = _94 * (-3.0);
    float _517 = -_92;
    float _519 = fma(_517, _491, _487);
    float _521 = _92 * _94;
    float _523 = -_94;
    float _525 = _96 * _523;
    float _527 = -_94;
    float _529 = fma(_527, _515, -1.0);
    float _531 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _533 = _96 * _94;
    float _535 = -_96;
    float _537 = _92 * _535;
    float _539 = _92 * _96;
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _543 = -_92;
    float _545 = fma(_543, _531, _503);
    float _547 = fma(_92, _531, _505);
    float _549 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _551 = fma(_541, _539, _507);
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _555 = fma(_541, _537, _519);
    float _557 = fma(_549, _539, _513);
    float _559 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _561 = fma(_553, _539, _547);
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _565 = fma(_549, _537, _511);
    float _567 = _376 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _569 = fma(_553, _537, _545);
    float _571 = fma(_559, _525, _555);
    float _573 = fma(_563, _525, _565);
    float _575 = fma(_563, _533, _557);
    float _577 = fma(_559, _533, _551);
    float _579 = exp2(_567);
    float _581 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _583 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _585 = fma(_581, _525, _569);
    float _587 = fma(_581, _533, _561);
    float _589 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _593 = fma(_583, _521, _571);
    float _595 = fma(_583, _521, _577);
    float _597 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _599 = fma(_589, _521, _573);
    float _601 = fma(_589, _521, _575);
    float _603 = fma(_591, _521, _585);
    float _605 = fma(_591, _521, _587);
    float _607 = -_579;
    float _609 = _607 + 1.0;
    float _611 = fma(_597, _529, _593);
    float _613 = fma(_597, _459, _595);
    float _615 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _617 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _619 = _609 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _621 = fma(_615, _529, _599);
    float _623 = fma(_617, _529, _603);
    float _625 = -_619;
    float _627 = _625 + 1.0;
    float _629 = fma(_615, _459, _601);
    float _631 = fma(_617, _459, _605);
    float _633 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _635 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _637 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _639 = abs(_627);
    float _641 = log2(_639);
    float _643 = fma(_633, _457, _621);
    float _645 = fma(_633, _457, _629);
    float _647 = fma(_635, _457, _611);
    float _649 = fma(_635, _457, _613);
    float _651 = fma(_637, _457, _631);
    float _653 = fma(_637, _457, _623);
    float _655 = _422 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _657 = _422 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _659 = _430 * _432;
    float _661 = _445 * _445;
    float _663 = _655 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _665 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _667 = _641 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _669 = _641 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _671 = _645 * _663;
    float _673 = _649 * _663;
    float _675 = _659 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _677 = _661 * _661;
    float _679 = fma(_643, _665, _671);
    float _681 = _651 * _663;
    float _683 = fma(_647, _665, _673);
    float _685 = exp2(_667);
    float _687 = _679 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _689 = fma(_653, _665, _681);
    float _691 = _683 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _693 = _677 * 16.0;
    float _695 = _687 * 0.715200006961822509765625;
    float _697 = _689 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _699 = -_434;
    float _701 = _699 + 1.0;
    float _703 = exp2(_669);
    float _705 = fma(_691, 0.2125999927520751953125, _695);
    float _707 = _424 * _701;
    float _709 = fma(_697, 0.072200000286102294921875, _705);
    float _711 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _713 = _685 * _693;
    float _715 = -_687;
    float _717 = _715 + _709;
    float _719 = _619 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _721 = _441 * _713;
    float _723 = fma(_675, _717, _687);
    float _725 = -_691;
    float _727 = _725 + _709;
    float _729 = -_697;
    float _731 = _729 + _709;
    float _733 = _439 * _713;
    float _735 = _703 * _723;
    float _737 = fma(_675, _727, _691);
    float _739 = fma(_675, _731, _697);
    float _741 = _443 * _713;
    float _743 = _735 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _745 = _703 * _737;
    float _747 = _703 * _739;
    float _749 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[27].y, _743);
    float _751 = _745 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _753 = _747 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _755 = fma(_451, _719, _749);
    float _757 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[27].x, _751);
    float _759 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[27].z, _753);
    float _761 = fma(_449, _719, _757);
    float _763 = _755 * 0.715200006961822509765625;
    float _765 = fma(_453, _719, _759);
    float _767 = fma(_761, 0.2125999927520751953125, _763);
    float _769 = fma(_765, 0.072200000286102294921875, _767);
    float _771 = 1.0 / _769;
    float _773 = _771 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _775 = precise::clamp(_773, 0.0, 1.0);
    float _777 = fma(_775, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _779 = _761 * _777;
    float _781 = _755 * _777;
    float _783 = _765 * _777;
    out.m_38.x = _779;
    out.m_38.y = _781;
    out.m_38.z = _783;
    out.m_38.w = _711;
    out.m_40.x = _779;
    out.m_40.y = _781;
    out.m_40.z = _783;
    out.m_40.w = _711;
    return out;
}

