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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
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
    float4 m_44 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _1909, thread const int& _1910, thread const int& _1911, thread const int& _1912, thread int& _1913, thread int& _1914, thread int& _1915, thread int& _1916, thread int& _1917, thread int& _1918)
{
    float _1921 = as_type<float>(_1909) + 0.0;
    bool _1923 = _1921 != 0.0;
    bool _1925 = isnan(_1921);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(0.0);
    bool _1931 = _1927 || _1929;
    int _1933 = _1910;
    int _1935 = _1911;
    int _1937 = 0;
    int _1939 = _1931 ? (-1) : 0;
    if (!_1931)
    {
        float _1941 = as_type<float>(_1909) * 1.0;
        _1933 = as_type<int>(_1941);
    }
    int _1943 = _1933;
    bool _1945 = !_1931;
    int _1947 = _1943;
    int _1949 = _1943;
    if (!_1945)
    {
        float _1951 = as_type<float>(_1909) + 0.0;
        bool _1953 = _1951 >= 0.0;
        bool _1955 = isnan(_1951);
        bool _1957 = _1953 || _1955;
        bool _1959 = isnan(0.0);
        bool _1961 = _1957 || _1959;
        _1939 = _1961 ? (-1) : 0;
        if (!_1961)
        {
            _1947 = 2147483647;
        }
        int _1963 = _1947;
        bool _1965 = !_1961;
        int _1967 = _1963;
        _1949 = _1963;
        if (!_1965)
        {
            float _1969 = abs(as_type<float>(_1909));
            float _1971 = _1969 + 0.0;
            bool _1973 = _1971 > as_type<float>(0x7f800000u /* inf */);
            bool _1975 = isnan(_1971);
            bool _1977 = _1973 || _1975;
            bool _1979 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1981 = _1977 || _1979;
            _1937 = 2139095040;
            _1939 = _1981 ? (-1) : 0;
            if (_1981)
            {
                float _1983 = as_type<float>(_1909) + 1.0;
                _1967 = as_type<int>(_1983);
            }
            int _1985 = _1967;
            int _1987 = _1985;
            _1949 = _1985;
            if (!_1981)
            {
                float _1989 = abs(as_type<float>(_1909));
                float _1991 = _1989 + (-0.0);
                float _1993 = 0.0 + _1991;
                bool _1995 = _1993 != as_type<float>(0x7f800000u /* inf */);
                bool _1997 = isnan(_1993);
                bool _1999 = _1995 || _1997;
                bool _2001 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2003 = _1999 || _2001;
                _1939 = _2003 ? (-1) : 0;
                if (!_2003)
                {
                    _1987 = _1909;
                }
                int _2005 = _1987;
                bool _2007 = !_2003;
                _1949 = _2005;
                if (!_2007)
                {
                    float _2009 = as_type<float>(_1909) * 18446744073709551616.0;
                    float _2011 = rsqrt(_2009);
                    float _2013 = _2009 * _2011;
                    float _2015 = _2011 * 0.5;
                    float _2017 = -_2013;
                    float _2019 = 0.0 + _2017;
                    float _2021 = fma(_2015, _2019, 0.5);
                    float _2023 = fma(_2013, _2021, _2013);
                    float _2025 = -_2023;
                    float _2027 = 0.0 + _2025;
                    float _2029 = fma(_2023, _2027, _2009);
                    float _2031 = fma(_2015, _2029, _2023);
                    float _2033 = _2031 * 2.3283064365386962890625e-10;
                    _1949 = as_type<int>(_2033);
                    _1935 = as_type<int>(_2023);
                    _1937 = as_type<int>(_2019);
                }
            }
        }
    }
    int _2035 = _1949;
    int _2037 = _1935;
    int _2039 = _1937;
    int _2041 = _1939;
    _1913 = _1912;
    _1914 = 0;
    _1915 = _2035;
    _1916 = _2037;
    _1917 = _2039;
    _1918 = _2041;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _248 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_37.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_37.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_37.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _54;
    float _76 = _74 * _60;
    float _78 = _74 * _66;
    float _80 = _74 * _72;
    float _82 = _76 * _76;
    float _84 = fma(_78, _78, _82);
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _88 = fma(_80, _80, _84);
    float _90 = precise::max(0.0, _86);
    float _92 = rsqrt(_88);
    float _94 = _78 * _92;
    float _96 = _80 * _92;
    float _98 = _76 * _92;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = -_98;
    float _106 = -_90;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _110 = _100 * _100;
    float _112 = _102 * _102;
    float _114 = _110 + _112;
    float _116 = sqrt(_114);
    bool _120 = _116 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _122 = _90;
    float _124 = _92;
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
    float _246;
    if (!_224)
    {
        int _226 = as_type<int>(_212);
        int _228 = 0;
        int _230 = 0;
        int _232 = 1136;
        int _234;
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        _50(_226, _228, _230, _232, _234, _236, _238, _240, _242, _244);
        _246 = as_type<float>(_238);
        _248 = true;
    }
    else
    {
        float _250 = rsqrt(_212);
        float _252 = _212 * _250;
        float _254 = _250 * 0.5;
        float _256 = -_252;
        float _258 = 0.0 + _256;
        float _260 = fma(_254, _258, 0.5);
        float _262 = fma(_252, _260, _252);
        float _264 = -_262;
        float _266 = 0.0 + _264;
        float _268 = fma(_262, _266, _212);
        float _270 = fma(_254, _268, _262);
        _246 = _270;
    }
    _248 = false;
    float _272 = _246;
    bool _274 = _198 > 0.0;
    float _276 = _96 * _96;
    float _278 = _94 * _94;
    float _280 = _276 + _278;
    if (_274)
    {
        discard_fragment();
    }
    float _282 = rsqrt(_280);
    float _284 = _222 * _272;
    float _286 = _284 * 0.636619746685028076171875;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_288;
    float _292 = _290 + 1.0;
    float _294 = _96 * _282;
    float _296 = _94 * _282;
    if (_274)
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
    float _298 = abs(_294);
    float _300 = abs(_296);
    float _302 = precise::max(_298, _300);
    float _304 = in.m_44.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_44.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = sqrt(_292);
    float _318 = precise::max(_302, 9.9999997473787516355514526367188e-05);
    float _320 = 1.0 / _318;
    float _322 = -_316;
    float _324 = _322 + 1.0;
    float _326 = _324 * 0.5;
    float _328 = -_320;
    float _330 = _294 * _328;
    float _332 = _296 * _320;
    float _334 = fma(_330, _326, 0.5);
    float _336 = fma(_332, _326, 0.5);
    float _338 = _74 * _308;
    float _340 = _74 * _314;
    float2 _1170;
    _1170.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_334, _336));
    _1170.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_334, _336));
    float _342 = _1170.x;
    float _344 = _342 * 256.0;
    int _346 = int(_344);
    float2 _1180 = float2(_338, _340);
    float2 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1180, float2(0.0), isnan(_1180))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1180, float2(0.0), isnan(_1180))).xy;
    float _352 = _350.x;
    float _354 = _350.y;
    float _356 = -_98;
    float _358 = _356 + 1.0;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _200 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _364 = abs(_360);
    float _366 = log2(_364);
    float _368 = -_362;
    float _370 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[11].y, _368);
    float _372 = -_202;
    float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[11].z, _370);
    float _376 = fma(_374, -0.5, 0.5);
    float _378 = fma(_374, 0.5, 0.5);
    float _380 = sqrt(_376);
    float _382 = _366 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _384 = exp2(_382);
    float _386 = _384 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _388 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = -_390;
    float _394 = _392 + 1.0;
    float _396 = fma(_378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _398 = abs(_394);
    float _400 = log2(_398);
    float _402 = fma(_378, _396, -0.212114393711090087890625);
    float _404 = fma(_378, _402, 1.570728778839111328125);
    float _406 = _380 * 0.636619746685028076171875;
    float _408 = _198 + 1.0;
    float _410 = -_404;
    float _412 = fma(_406, _410, 1.0);
    float _414 = _400 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _416 = exp2(_414);
    float _418 = -_198;
    float _420 = fma(_416, _408, _418);
    float _422 = fma(_420, 0.5, 0.5);
    float _424 = float(uint(_346));
    float _426 = fma(_354, 2.0, -1.0);
    float _428 = fma(_352, 2.0, -1.0);
    float _430 = _424 * 0.00390625;
    float _432 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[22].y, _340);
    float _434 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[22].x, _338);
    float2 _1311 = float2(_334, _336);
    float2 _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1311, float2(0.0), isnan(_1311)), level(_430)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1311, float2(0.0), isnan(_1311)), level(_430)).xy;
    float _438 = _436.x;
    float _440 = _436.y;
    float2 _1324 = float2(_334, _336);
    float4 _443 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1324, float2(0.0), isnan(_1324)), level(_430)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1324, float2(0.0), isnan(_1324)), level(_430)).xyzw;
    float _445 = _443.x;
    float _447 = _443.y;
    float _449 = _443.z;
    float _451 = _443.w;
    float2 _1341 = float2(_412, _422);
    float3 _455 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1341, float2(0.0), isnan(_1341))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1341, float2(0.0), isnan(_1341))).xyz;
    float _457 = _455.x;
    float _459 = _455.y;
    float _461 = _455.z;
    float2 _1355 = float2(_434, _432);
    float4 _463 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1355, float2(0.0), isnan(_1355))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1355, float2(0.0), isnan(_1355))).xyzw;
    float _465 = _463.x;
    float _467 = _463.y;
    float _469 = _463.z;
    float _471 = _463.w;
    float _473 = fma(_276, 3.0, -1.0);
    float _475 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _477 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _479 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _481 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _483 = _98 * _475;
    float _485 = _98 * _477;
    float _487 = _98 * _479;
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _491 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _483);
    float _493 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _485);
    float _495 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _487);
    float _497 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _499 = -_96;
    float _501 = fma(_499, _489, _491);
    float _503 = fma(_96, _489, _491);
    float _505 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _507 = -_96;
    float _509 = fma(_507, _497, _493);
    float _511 = fma(_96, _497, _493);
    float _513 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _515 = -_96;
    float _517 = fma(_515, _481, _495);
    float _519 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _521 = -_94;
    float _523 = fma(_521, _505, _501);
    float _525 = fma(_96, _481, _495);
    float _527 = _96 * (-3.0);
    float _529 = fma(_94, _505, _503);
    float _531 = -_94;
    float _533 = fma(_531, _513, _509);
    float _535 = -_94;
    float _537 = fma(_535, _519, _517);
    float _539 = fma(_94, _513, _511);
    float _541 = -_98;
    float _543 = fma(_541, _98, _278);
    float _545 = _400 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _547 = _94 * _96;
    float _549 = -_96;
    float _551 = _98 * _549;
    float _553 = -_96;
    float _555 = fma(_553, _527, -1.0);
    float _557 = _98 * _96;
    float _559 = -_98;
    float _561 = _94 * _559;
    float _563 = _94 * _98;
    float _565 = fma(_94, _519, _525);
    float _567 = exp2(_545);
    float _569 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _571 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _573 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _575 = fma(_569, _561, _523);
    float _577 = fma(_569, _563, _529);
    float _579 = fma(_571, _563, _539);
    float _581 = fma(_573, _563, _565);
    float _583 = fma(_573, _561, _537);
    float _585 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _587 = fma(_571, _561, _533);
    float _589 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _597 = fma(_585, _551, _583);
    float _599 = fma(_585, _557, _581);
    float _601 = _593 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _603 = fma(_589, _551, _575);
    float _605 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _607 = fma(_589, _557, _577);
    float _609 = fma(_595, _551, _587);
    float _611 = fma(_595, _557, _579);
    float _613 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _615 = -_601;
    float _617 = _615 + 1.0;
    float _619 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _621 = fma(_605, _547, _609);
    float _623 = fma(_605, _547, _611);
    float _625 = fma(_613, _547, _603);
    float _627 = fma(_613, _547, _607);
    float _629 = abs(_617);
    float _631 = log2(_629);
    float _633 = fma(_619, _547, _597);
    float _635 = fma(_619, _547, _599);
    float _637 = _601 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _641 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _643 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _645 = fma(_639, _555, _625);
    float _647 = fma(_639, _473, _627);
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _651 = fma(_641, _555, _621);
    float _653 = fma(_643, _555, _633);
    float _655 = fma(_641, _473, _623);
    float _657 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _659 = fma(_649, _543, _645);
    float _661 = fma(_643, _473, _635);
    float _663 = _631 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _665 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _667 = _631 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _669 = fma(_657, _543, _651);
    float _671 = fma(_657, _543, _655);
    float _673 = fma(_649, _543, _647);
    float _675 = fma(_665, _543, _653);
    float _677 = fma(_665, _543, _661);
    float _679 = exp2(_663);
    float _681 = exp2(_667);
    float _683 = _438 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _685 = _438 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _687 = _451 * _451;
    float _689 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _691 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _693 = _687 * _687;
    float _695 = _671 * _689;
    float _697 = _673 * _689;
    float _699 = _693 * 16.0;
    float _701 = _677 * _689;
    float _703 = fma(_669, _691, _695);
    float _705 = fma(_659, _691, _697);
    float _707 = _681 * _699;
    float _709 = fma(_675, _691, _701);
    float _711 = _703 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _713 = _705 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _715 = _447 * _707;
    float _717 = _709 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _719 = _679 * _711;
    float _721 = _679 * _713;
    float _723 = _445 * _707;
    float _725 = _679 * _717;
    float _727 = _719 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _729 = _721 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _731 = _449 * _707;
    float _733 = _725 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _735 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[27].y, _727);
    float _737 = fma(_723, (*spvDescriptorSet0.fp_c3)._m0[27].x, _729);
    float _739 = fma(_459, _637, _735);
    float _741 = fma(_457, _637, _737);
    float _743 = fma(_731, (*spvDescriptorSet0.fp_c3)._m0[27].z, _733);
    float _745 = _739 * 0.715200006961822509765625;
    float _747 = fma(_461, _637, _743);
    float _749 = fma(_741, 0.2125999927520751953125, _745);
    float _751 = fma(_747, 0.072200000286102294921875, _749);
    float _753 = 1.0 / _751;
    float _755 = _753 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _757 = precise::clamp(_755, 0.0, 1.0);
    float _759 = fma(_757, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _761 = _759 * _471;
    float _763 = _440 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _765 = fma(_741, _761, _465);
    float _767 = fma(_739, _761, _467);
    float _769 = fma(_747, _761, _469);
    out.m_40.x = _765;
    out.m_40.y = _767;
    out.m_40.z = _769;
    out.m_40.w = _763;
    out.m_42.x = _765;
    out.m_42.y = _767;
    out.m_42.z = _769;
    out.m_42.w = _763;
    return out;
}

