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
void _42(thread const int& _1914, thread const int& _1915, thread const int& _1916, thread const int& _1917, thread int& _1918, thread int& _1919, thread int& _1920, thread int& _1921, thread int& _1922, thread int& _1923)
{
    float _1926 = as_type<float>(_1916) + 0.0;
    bool _1928 = _1926 != 0.0;
    bool _1930 = isnan(_1926);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    int _1938 = _1914;
    int _1940 = _1915;
    int _1942 = _1916;
    int _1944 = _1936 ? (-1) : 0;
    if (!_1936)
    {
        float _1946 = as_type<float>(_1916) * 1.0;
        _1938 = as_type<int>(_1946);
    }
    int _1948 = _1938;
    bool _1950 = !_1936;
    int _1952 = _1948;
    int _1954 = _1948;
    if (!_1950)
    {
        float _1956 = as_type<float>(_1916) + 0.0;
        bool _1958 = _1956 >= 0.0;
        bool _1960 = isnan(_1956);
        bool _1962 = _1958 || _1960;
        bool _1964 = isnan(0.0);
        bool _1966 = _1962 || _1964;
        _1944 = _1966 ? (-1) : 0;
        if (!_1966)
        {
            _1952 = 2147483647;
        }
        int _1968 = _1952;
        bool _1970 = !_1966;
        int _1972 = _1968;
        _1954 = _1968;
        if (!_1970)
        {
            float _1974 = abs(as_type<float>(_1916));
            float _1976 = _1974 + 0.0;
            bool _1978 = _1976 > as_type<float>(0x7f800000u /* inf */);
            bool _1980 = isnan(_1976);
            bool _1982 = _1978 || _1980;
            bool _1984 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1986 = _1982 || _1984;
            _1944 = _1986 ? (-1) : 0;
            if (_1986)
            {
                float _1988 = as_type<float>(_1916) + 1.0;
                _1972 = as_type<int>(_1988);
            }
            int _1990 = _1972;
            int _1992 = _1990;
            _1954 = _1990;
            if (!_1986)
            {
                float _1994 = abs(as_type<float>(_1916));
                float _1996 = _1994 + (-0.0);
                float _1998 = 0.0 + _1996;
                bool _2000 = _1998 != as_type<float>(0x7f800000u /* inf */);
                bool _2002 = isnan(_1998);
                bool _2004 = _2000 || _2002;
                bool _2006 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2008 = _2004 || _2006;
                _1944 = _2008 ? (-1) : 0;
                if (!_2008)
                {
                    _1992 = _1916;
                }
                int _2010 = _1992;
                bool _2012 = !_2008;
                _1954 = _2010;
                if (!_2012)
                {
                    float _2014 = as_type<float>(_1916) * 18446744073709551616.0;
                    float _2016 = rsqrt(_2014);
                    float _2018 = _2014 * _2016;
                    float _2020 = _2016 * 0.5;
                    float _2022 = -_2018;
                    float _2024 = 0.0 + _2022;
                    float _2026 = fma(_2020, _2024, 0.5);
                    float _2028 = fma(_2018, _2026, _2018);
                    float _2030 = -_2028;
                    float _2032 = 0.0 + _2030;
                    float _2034 = fma(_2028, _2032, _2014);
                    float _2036 = fma(_2020, _2034, _2028);
                    float _2038 = _2036 * 2.3283064365386962890625e-10;
                    _1954 = as_type<int>(_2038);
                    _1940 = as_type<int>(_2028);
                    _1942 = as_type<int>(_2024);
                }
            }
        }
    }
    int _2040 = _1954;
    int _2042 = _1940;
    int _2044 = _1942;
    int _2046 = _1944;
    _1918 = _1917;
    _1919 = 0;
    _1920 = _2040;
    _1921 = _2042;
    _1922 = _2044;
    _1923 = _2046;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _240 = false;
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
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _80 = fma(_72, _72, _76);
    float _82 = precise::max(0.0, _78);
    float _84 = rsqrt(_80);
    float _86 = _70 * _84;
    float _88 = _72 * _84;
    float _90 = _68 * _84;
    float _92 = _86 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = -_90;
    float _98 = -_82;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[13].z, _98);
    float _102 = _92 * _92;
    float _104 = _94 * _94;
    float _106 = _102 + _104;
    float _108 = sqrt(_106);
    bool _112 = _108 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _114 = _84;
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
    float _238;
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
        int _236;
        _42(_218, _220, _222, _224, _226, _228, _230, _232, _234, _236);
        _238 = as_type<float>(_230);
        _240 = true;
    }
    else
    {
        float _242 = rsqrt(_204);
        float _244 = _204 * _242;
        float _246 = _242 * 0.5;
        float _248 = -_244;
        float _250 = 0.0 + _248;
        float _252 = fma(_246, _250, 0.5);
        float _254 = fma(_244, _252, _244);
        float _256 = -_254;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, _204);
        float _262 = fma(_246, _260, _254);
        _238 = _262;
    }
    _240 = false;
    float _264 = _238;
    bool _266 = _190 > 0.0;
    float _268 = _88 * _88;
    float _270 = _86 * _86;
    float _272 = _268 + _270;
    if (_266)
    {
        discard_fragment();
    }
    float _274 = rsqrt(_272);
    float _276 = _214 * _264;
    float _278 = _276 * 0.636619746685028076171875;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = -_280;
    float _284 = _282 + 1.0;
    float _286 = sqrt(_284);
    float _288 = _88 * _274;
    float _290 = _86 * _274;
    float _292 = abs(_288);
    float _294 = abs(_290);
    float _296 = precise::max(_292, _294);
    float _298 = precise::max(_296, 9.9999997473787516355514526367188e-05);
    float _300 = -_286;
    float _302 = _300 + 1.0;
    float _304 = 1.0 / _298;
    float _306 = _302 * 0.5;
    float _308 = -_304;
    float _310 = _288 * _308;
    float _312 = _290 * _304;
    float _314 = fma(_310, _306, 0.5);
    float _316 = fma(_312, _306, 0.5);
    if (_266)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float2 _1152;
    _1152.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_314, _316));
    _1152.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_314, _316));
    float _318 = _1152.x;
    float _320 = _318 * 256.0;
    int _322 = int(_320);
    float _324 = -_90;
    float _326 = _324 + 1.0;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _192 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _332 = abs(_328);
    float _334 = log2(_332);
    float _336 = -_330;
    float _338 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[11].y, _336);
    float _340 = -_194;
    float _342 = fma(_340, (*spvDescriptorSet0.fp_c3)._m0[11].z, _338);
    float _344 = fma(_342, -0.5, 0.5);
    float _346 = fma(_342, 0.5, 0.5);
    float _348 = fma(_346, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _350 = sqrt(_344);
    float _352 = _334 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _354 = exp2(_352);
    float _356 = _354 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_346, _348, -0.212114393711090087890625);
    float _364 = _190 + 1.0;
    float _366 = -_360;
    float _368 = _366 + 1.0;
    float _370 = fma(_346, _362, 1.570728778839111328125);
    float _372 = _350 * 0.636619746685028076171875;
    float _374 = abs(_368);
    float _376 = log2(_374);
    float _378 = -_370;
    float _380 = fma(_372, _378, 1.0);
    float _382 = _376 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _384 = exp2(_382);
    float _386 = -_190;
    float _388 = fma(_384, _364, _386);
    float _390 = fma(_190, -0.5, 0.5);
    float _392 = fma(_388, 0.5, 0.5);
    float _394 = float(uint(_322));
    float _396 = _394 * 0.00390625;
    float2 _1265 = float2(_314, _316);
    float2 _400 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1265, float2(0.0), isnan(_1265)), level(_396)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1265, float2(0.0), isnan(_1265)), level(_396)).xy;
    float _402 = _400.x;
    float _404 = _400.y;
    float2 _1280 = float2(_314, _316);
    float4 _407 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1280, float2(0.0), isnan(_1280)), level(_396)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1280, float2(0.0), isnan(_1280)), level(_396)).xyzw;
    float _409 = _407.x;
    float _411 = _407.y;
    float _413 = _407.z;
    float _415 = _407.w;
    float2 _1297 = float2(_380, _392);
    float3 _419 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1297, float2(0.0), isnan(_1297))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1297, float2(0.0), isnan(_1297))).xyz;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float2 _1311 = float2(_380, _390);
    float3 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1311, float2(0.0), isnan(_1311))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1311, float2(0.0), isnan(_1311))).xyz;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _376 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _437 = fma(_268, 3.0, -1.0);
    float _439 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _441 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _443 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _445 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _447 = _90 * _439;
    float _449 = _90 * _441;
    float _451 = _90 * _443;
    float _453 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _455 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _447);
    float _457 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _449);
    float _459 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _451);
    float _461 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _463 = -_88;
    float _465 = fma(_463, _453, _455);
    float _467 = fma(_88, _453, _455);
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _471 = -_88;
    float _473 = fma(_471, _445, _459);
    float _475 = -_88;
    float _477 = fma(_475, _461, _457);
    float _479 = fma(_88, _461, _457);
    float _481 = fma(_88, _445, _459);
    float _483 = -_86;
    float _485 = fma(_483, _469, _465);
    float _487 = fma(_86, _469, _467);
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _491 = -_90;
    float _493 = fma(_491, _90, _270);
    float _495 = _88 * (-3.0);
    float _497 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _499 = -_86;
    float _501 = fma(_499, _489, _477);
    float _503 = fma(_86, _489, _479);
    float _505 = _86 * _88;
    float _507 = -_88;
    float _509 = _90 * _507;
    float _511 = -_88;
    float _513 = fma(_511, _495, -1.0);
    float _515 = _90 * _88;
    float _517 = -_90;
    float _519 = _86 * _517;
    float _521 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _523 = _86 * _90;
    float _525 = -_86;
    float _527 = fma(_525, _497, _473);
    float _529 = fma(_86, _497, _481);
    float _531 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _533 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _535 = fma(_521, _519, _485);
    float _537 = fma(_521, _523, _487);
    float _539 = fma(_531, _519, _501);
    float _541 = fma(_531, _523, _503);
    float _543 = fma(_533, _519, _527);
    float _545 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _547 = fma(_533, _523, _529);
    float _549 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _551 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _553 = exp2(_435);
    float _555 = fma(_545, _515, _537);
    float _557 = fma(_549, _515, _541);
    float _559 = fma(_551, _515, _547);
    float _561 = fma(_545, _509, _535);
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _565 = fma(_551, _509, _543);
    float _567 = fma(_549, _509, _539);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _571 = fma(_563, _505, _561);
    float _573 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _575 = fma(_569, _505, _567);
    float _577 = fma(_563, _505, _555);
    float _579 = fma(_569, _505, _557);
    float _581 = fma(_573, _505, _565);
    float _583 = fma(_573, _505, _559);
    float _585 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _587 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _589 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _591 = -_553;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _513, _571);
    float _597 = fma(_585, _437, _577);
    float _599 = fma(_587, _513, _575);
    float _601 = fma(_589, _513, _581);
    float _603 = fma(_587, _437, _579);
    float _605 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _607 = _593 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _609 = fma(_589, _437, _583);
    float _611 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _613 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _615 = fma(_605, _493, _599);
    float _617 = fma(_605, _493, _603);
    float _619 = -_607;
    float _621 = _619 + 1.0;
    float _623 = fma(_611, _493, _601);
    float _625 = fma(_611, _493, _609);
    float _627 = fma(_613, _493, _595);
    float _629 = fma(_613, _493, _597);
    float _631 = _607 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _633 = abs(_621);
    float _635 = log2(_633);
    float _637 = _635 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _639 = _635 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _641 = exp2(_639);
    float _643 = exp2(_637);
    float _645 = _404 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _647 = _402 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _649 = _402 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _651 = _415 * _415;
    float _653 = -_645;
    float _655 = _653 + 1.0;
    float _657 = _647 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _659 = _649 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _661 = _651 * _651;
    float _663 = _617 * _657;
    float _665 = abs(_655);
    float _667 = log2(_665);
    float _669 = _629 * _657;
    float _671 = _661 * 16.0;
    float _673 = fma(_615, _659, _663);
    float _675 = _625 * _657;
    float _677 = fma(_627, _659, _669);
    float _679 = _643 * _671;
    float _681 = _673 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _683 = fma(_623, _659, _675);
    float _685 = _677 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _687 = _411 * _679;
    float _689 = _641 * _681;
    float _691 = _683 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _693 = _641 * _685;
    float _695 = _409 * _679;
    float _697 = _689 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _699 = _667 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _701 = _641 * _691;
    float _703 = _693 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _705 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[27].y, _697);
    float _707 = _413 * _679;
    float _709 = _701 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _711 = exp2(_699);
    float _713 = fma(_695, (*spvDescriptorSet0.fp_c3)._m0[27].x, _703);
    float _715 = fma(_423, _631, _705);
    float _717 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[27].z, _709);
    float _719 = fma(_421, _631, _713);
    float _721 = fma(_425, _631, _717);
    float _723 = -_711;
    float _725 = spvFAdd(_723, 1.00010001659393310546875);
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = -_645;
    float _733 = _731 + _729;
    float _735 = 1.0 / _725;
    float _737 = _733 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _739 = _431 * _737;
    float _741 = _429 * _737;
    float _743 = _433 * _737;
    float _745 = fma(_645, _715, _739);
    float _747 = fma(_645, _719, _741);
    float _749 = fma(_645, _721, _743);
    float _751 = _735 * _745;
    float _753 = _735 * _747;
    float _755 = _735 * _749;
    float _757 = _751 * 0.715200006961822509765625;
    float _759 = fma(_753, 0.2125999927520751953125, _757);
    float _761 = fma(_755, 0.072200000286102294921875, _759);
    float _763 = 1.0 / _761;
    float _765 = _763 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _767 = precise::clamp(_765, 0.0, 1.0);
    float _769 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _771 = _753 * _769;
    float _773 = _751 * _769;
    float _775 = _755 * _769;
    out.m_36.x = _771;
    out.m_36.y = _773;
    out.m_36.z = _775;
    out.m_36.w = _729;
    return out;
}

