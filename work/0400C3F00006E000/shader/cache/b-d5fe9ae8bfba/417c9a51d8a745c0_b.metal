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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
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
void _52(thread const int& _2023, thread const int& _2024, thread const int& _2025, thread const int& _2026, thread int& _2027, thread int& _2028, thread int& _2029, thread int& _2030, thread int& _2031, thread int& _2032, thread int& _2033)
{
    float _2036 = as_type<float>(_2023) + 0.0;
    bool _2038 = _2036 != 0.0;
    bool _2040 = isnan(_2036);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    int _2048 = as_type<int>(_2036);
    int _2050 = 0;
    int _2052 = _2024;
    int _2054 = _2046 ? (-1) : 0;
    if (!_2046)
    {
        float _2056 = as_type<float>(_2023) * 1.0;
        _2048 = as_type<int>(_2056);
    }
    int _2058 = _2048;
    bool _2060 = !_2046;
    int _2062 = _2058;
    if (!_2060)
    {
        float _2064 = as_type<float>(_2023) + 0.0;
        bool _2066 = _2064 >= 0.0;
        bool _2068 = isnan(_2064);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan(0.0);
        bool _2074 = _2070 || _2072;
        int _2076 = as_type<int>(_2064);
        _2054 = _2074 ? (-1) : 0;
        if (!_2074)
        {
            _2076 = 2147483647;
        }
        int _2078 = _2076;
        bool _2080 = !_2074;
        _2062 = _2078;
        if (!_2080)
        {
            float _2082 = abs(as_type<float>(_2023));
            float _2084 = _2082 + 0.0;
            bool _2086 = _2084 > as_type<float>(0x7f800000u /* inf */);
            bool _2088 = isnan(_2084);
            bool _2090 = _2086 || _2088;
            bool _2092 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2094 = _2090 || _2092;
            int _2096 = as_type<int>(_2084);
            _2050 = 2139095040;
            _2054 = _2094 ? (-1) : 0;
            if (_2094)
            {
                float _2098 = as_type<float>(_2023) + 1.0;
                _2096 = as_type<int>(_2098);
            }
            int _2100 = _2096;
            _2062 = _2100;
            if (!_2094)
            {
                float _2102 = abs(as_type<float>(_2023));
                float _2104 = _2102 + (-0.0);
                float _2106 = 0.0 + _2104;
                bool _2108 = _2106 != as_type<float>(0x7f800000u /* inf */);
                bool _2110 = isnan(_2106);
                bool _2112 = _2108 || _2110;
                bool _2114 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2116 = _2112 || _2114;
                int _2118 = as_type<int>(_2106);
                _2054 = _2116 ? (-1) : 0;
                if (!_2116)
                {
                    _2118 = _2023;
                }
                int _2120 = _2118;
                bool _2122 = !_2116;
                _2062 = _2120;
                if (!_2122)
                {
                    float _2124 = as_type<float>(_2023) * 18446744073709551616.0;
                    float _2126 = rsqrt(_2124);
                    float _2128 = _2124 * _2126;
                    float _2130 = _2126 * 0.5;
                    float _2132 = -_2128;
                    float _2134 = 0.0 + _2132;
                    float _2136 = fma(_2130, _2134, 0.5);
                    float _2138 = fma(_2128, _2136, _2128);
                    float _2140 = -_2138;
                    float _2142 = 0.0 + _2140;
                    float _2144 = fma(_2138, _2142, _2124);
                    float _2146 = fma(_2130, _2144, _2138);
                    float _2148 = _2146 * 2.3283064365386962890625e-10;
                    _2062 = as_type<int>(_2148);
                    _2050 = as_type<int>(_2144);
                    _2052 = as_type<int>(_2134);
                }
            }
        }
    }
    int _2150 = _2062;
    int _2152 = _2050;
    int _2154 = _2052;
    int _2156 = _2054;
    _2027 = _2150;
    _2028 = _2150;
    _2029 = _2152;
    _2030 = _2154;
    _2031 = _2026;
    _2032 = 0;
    _2033 = _2156;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _252 = false;
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
    float _76 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _78 = precise::max(0.0, _76);
    float _80 = 1.0 / _56;
    float _82 = _80 * _62;
    float _84 = _80 * _68;
    float _86 = _80 * _74;
    float _88 = _82 * _82;
    float _90 = fma(_84, _84, _88);
    float _92 = fma(_86, _86, _90);
    float _94 = rsqrt(_92);
    float _96 = _84 * _94;
    float _98 = _86 * _94;
    float _100 = _82 * _94;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = -_100;
    float _108 = -_78;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _108);
    float _112 = _102 * _102;
    float _114 = _104 * _104;
    float _116 = _112 + _114;
    float _118 = sqrt(_116);
    bool _122 = _118 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _124 = _94;
    float _126 = _78;
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
    float _250;
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
        int _248;
        _52(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246, _248);
        _250 = as_type<float>(_236);
        _252 = true;
    }
    else
    {
        float _254 = rsqrt(_214);
        float _256 = _214 * _254;
        float _258 = _254 * 0.5;
        float _260 = -_256;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, 0.5);
        float _266 = fma(_256, _264, _256);
        float _268 = -_266;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, _214);
        float _274 = fma(_258, _272, _266);
        _250 = _274;
    }
    _252 = false;
    float _276 = _250;
    bool _278 = _200 > 0.0;
    float _280 = _98 * _98;
    float _282 = _96 * _96;
    float _284 = _280 + _282;
    if (_278)
    {
        discard_fragment();
    }
    float _286 = rsqrt(_284);
    float _288 = _224 * _276;
    float _290 = _288 * 0.636619746685028076171875;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = -_292;
    float _296 = _294 + 1.0;
    float _298 = _98 * _286;
    float _300 = _96 * _286;
    if (_278)
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
    float _302 = abs(_298);
    float _304 = abs(_300);
    float _306 = precise::max(_302, _304);
    float _308 = in.m_46.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = sqrt(_296);
    float _316 = in.m_46.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = precise::max(_306, 9.9999997473787516355514526367188e-05);
    float _324 = 1.0 / _322;
    float _326 = -_314;
    float _328 = _326 + 1.0;
    float _330 = _328 * 0.5;
    float _332 = -_324;
    float _334 = _298 * _332;
    float _336 = _300 * _324;
    float _338 = fma(_334, _330, 0.5);
    float _340 = fma(_336, _330, 0.5);
    float _342 = _80 * _312;
    float2 _1215;
    _1215.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    _1215.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_338, _340));
    float _344 = _1215.x;
    float _346 = _344 * 256.0;
    int _348 = int(_346);
    float _350 = _80 * _320;
    float2 _1228 = float2(_350, _342);
    float2 _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1228, float2(0.0), isnan(_1228))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1228, float2(0.0), isnan(_1228))).xy;
    float _356 = _354.x;
    float _358 = _354.y;
    float _360 = -_100;
    float _362 = _360 + 1.0;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _202 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _368 = abs(_364);
    float _370 = log2(_368);
    float _372 = -_366;
    float _374 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[11].y, _372);
    float _376 = -_204;
    float _378 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
    float _380 = _370 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _382 = exp2(_380);
    float _384 = _382 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _386 = _200 + 1.0;
    float _388 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = fma(_378, -0.5, 0.5);
    float _394 = fma(_378, 0.5, 0.5);
    float _396 = -_390;
    float _398 = _396 + 1.0;
    float _400 = fma(_394, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _402 = sqrt(_392);
    float _404 = fma(_394, _400, -0.212114393711090087890625);
    float _406 = fma(_394, _404, 1.570728778839111328125);
    float _408 = abs(_398);
    float _410 = log2(_408);
    float _412 = _402 * 0.636619746685028076171875;
    float _414 = -_406;
    float _416 = fma(_412, _414, 1.0);
    float _418 = _410 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _420 = exp2(_418);
    float _422 = -_200;
    float _424 = fma(_420, _386, _422);
    float _426 = fma(_424, 0.5, 0.5);
    float _428 = float(uint(_348));
    float _430 = _428 * 0.00390625;
    float2 _1343 = float2(_338, _340);
    float2 _432 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1343, float2(0.0), isnan(_1343)), level(_430)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1343, float2(0.0), isnan(_1343)), level(_430)).xy;
    float _434 = _432.x;
    float _436 = _432.y;
    float _438 = fma(_356, 2.0, -1.0);
    float _440 = fma(_358, 2.0, -1.0);
    float _442 = fma(_438, (*spvDescriptorSet0.fp_c3)._m0[22].x, _350);
    float _444 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[22].y, _342);
    float2 _1372 = float2(_350, _342);
    float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1372, float2(0.0), isnan(_1372))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1372, float2(0.0), isnan(_1372))).xyz;
    float _450 = _448.x;
    float _452 = _448.y;
    float _454 = _448.z;
    float2 _1386 = float2(_338, _340);
    float4 _457 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1386, float2(0.0), isnan(_1386)), level(_430)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1386, float2(0.0), isnan(_1386)), level(_430)).xyzw;
    float _459 = _457.x;
    float _461 = _457.y;
    float _463 = _457.z;
    float _465 = _457.w;
    float2 _1403 = float2(_416, _426);
    float3 _467 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1403, float2(0.0), isnan(_1403))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1403, float2(0.0), isnan(_1403))).xyz;
    float _469 = _467.x;
    float _471 = _467.y;
    float _473 = _467.z;
    float2 _1417 = float2(_442, _444);
    float4 _475 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1417, float2(0.0), isnan(_1417))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1417, float2(0.0), isnan(_1417))).xyzw;
    float _477 = _475.x;
    float _479 = _475.y;
    float _481 = _475.z;
    float _483 = _475.w;
    float _485 = _96 * _100;
    float _487 = _410 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _491 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _493 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _495 = _100 * _489;
    float _497 = _100 * _491;
    float _499 = _100 * _493;
    float _501 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _503 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _495);
    float _505 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _497);
    float _507 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _499);
    float _509 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _511 = -_98;
    float _513 = fma(_511, _501, _503);
    float _515 = fma(_98, _501, _503);
    float _517 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _519 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _521 = -_98;
    float _523 = fma(_521, _509, _507);
    float _525 = fma(_98, _509, _507);
    float _527 = -_98;
    float _529 = fma(_527, _517, _505);
    float _531 = fma(_98, _517, _505);
    float _533 = -_96;
    float _535 = fma(_533, _519, _513);
    float _537 = fma(_96, _519, _515);
    float _539 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _541 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _543 = -_100;
    float _545 = _96 * _543;
    float _547 = -_96;
    float _549 = fma(_547, _539, _523);
    float _551 = fma(_96, _539, _525);
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _555 = -_96;
    float _557 = fma(_555, _541, _529);
    float _559 = fma(_96, _541, _531);
    float _561 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _563 = fma(_553, _545, _535);
    float _565 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _567 = fma(_553, _485, _537);
    float _569 = fma(_561, _545, _557);
    float _571 = fma(_561, _485, _559);
    float _573 = _96 * _96;
    float _575 = fma(_565, _545, _549);
    float _577 = fma(_565, _485, _551);
    float _579 = _98 * (-3.0);
    float _581 = _96 * _98;
    float _583 = -_98;
    float _585 = _100 * _583;
    float _587 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _589 = -_100;
    float _591 = fma(_589, _100, _573);
    float _593 = exp2(_487);
    float _595 = _100 * _98;
    float _597 = -_98;
    float _599 = fma(_597, _579, -1.0);
    float _601 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _603 = fma(_587, _585, _563);
    float _605 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _607 = fma(_587, _595, _567);
    float _609 = fma(_601, _595, _571);
    float _611 = fma(_605, _585, _575);
    float _613 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _615 = fma(_605, _595, _577);
    float _617 = fma(_601, _585, _569);
    float _619 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _621 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _623 = fma(_280, 3.0, -1.0);
    float _625 = fma(_613, _581, _603);
    float _627 = fma(_613, _581, _607);
    float _629 = fma(_619, _581, _617);
    float _631 = fma(_621, _581, _611);
    float _633 = fma(_621, _581, _615);
    float _635 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _637 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _639 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _641 = -_593;
    float _643 = _641 + 1.0;
    float _645 = fma(_619, _581, _609);
    float _647 = fma(_635, _599, _625);
    float _649 = _643 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _651 = fma(_637, _599, _629);
    float _653 = fma(_639, _599, _631);
    float _655 = fma(_635, _623, _627);
    float _657 = fma(_637, _623, _645);
    float _659 = fma(_639, _623, _633);
    float _661 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _663 = -_649;
    float _665 = _663 + 1.0;
    float _667 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _669 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _671 = fma(_661, _591, _647);
    float _673 = fma(_661, _591, _655);
    float _675 = fma(_667, _591, _651);
    float _677 = abs(_665);
    float _679 = log2(_677);
    float _681 = fma(_667, _591, _657);
    float _683 = fma(_669, _591, _653);
    float _685 = fma(_669, _591, _659);
    float _687 = _649 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _689 = _434 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _691 = _434 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _693 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _695 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _697 = _679 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _699 = _679 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _701 = _681 * _693;
    float _703 = _673 * _693;
    float _705 = _450 * _452;
    float _707 = _465 * _465;
    float _709 = fma(_675, _695, _701);
    float _711 = _685 * _693;
    float _713 = fma(_671, _695, _703);
    float _715 = exp2(_697);
    float _717 = _709 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _719 = fma(_683, _695, _711);
    float _721 = _713 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _723 = _705 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _725 = _717 * 0.715200006961822509765625;
    float _727 = _719 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _729 = _707 * _707;
    float _731 = exp2(_699);
    float _733 = fma(_721, 0.2125999927520751953125, _725);
    float _735 = _729 * 16.0;
    float _737 = fma(_727, 0.072200000286102294921875, _733);
    float _739 = _715 * _735;
    float _741 = -_717;
    float _743 = _741 + _737;
    float _745 = _461 * _739;
    float _747 = fma(_723, _743, _717);
    float _749 = -_721;
    float _751 = _749 + _737;
    float _753 = -_727;
    float _755 = _753 + _737;
    float _757 = _459 * _739;
    float _759 = _731 * _747;
    float _761 = fma(_723, _751, _721);
    float _763 = fma(_723, _755, _727);
    float _765 = _463 * _739;
    float _767 = _759 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _769 = _731 * _761;
    float _771 = _731 * _763;
    float _773 = fma(_745, (*spvDescriptorSet0.fp_c3)._m0[27].y, _767);
    float _775 = _769 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _777 = _771 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _779 = fma(_757, (*spvDescriptorSet0.fp_c3)._m0[27].x, _775);
    float _781 = fma(_471, _687, _773);
    float _783 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[27].z, _777);
    float _785 = fma(_469, _687, _779);
    float _787 = _781 * 0.715200006961822509765625;
    float _789 = fma(_473, _687, _783);
    float _791 = fma(_785, 0.2125999927520751953125, _787);
    float _793 = fma(_789, 0.072200000286102294921875, _791);
    float _795 = -_454;
    float _797 = _795 + 1.0;
    float _799 = _436 * _797;
    float _801 = 1.0 / _793;
    float _803 = _801 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _805 = precise::clamp(_803, 0.0, 1.0);
    float _807 = fma(_805, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _809 = _807 * _483;
    float _811 = _799 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _813 = fma(_785, _809, _477);
    float _815 = fma(_781, _809, _479);
    float _817 = fma(_789, _809, _481);
    out.m_42.x = _813;
    out.m_42.y = _815;
    out.m_42.z = _817;
    out.m_42.w = _811;
    out.m_44.x = _813;
    out.m_44.y = _815;
    out.m_44.z = _817;
    out.m_44.w = _811;
    return out;
}

