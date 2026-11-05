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
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _2046, thread const int& _2047, thread const int& _2048, thread const int& _2049, thread int& _2050, thread int& _2051, thread int& _2052, thread int& _2053, thread int& _2054)
{
    float _2057 = as_type<float>(_2048) + 0.0;
    bool _2059 = _2057 != 0.0;
    bool _2061 = isnan(_2057);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan(0.0);
    bool _2067 = _2063 || _2065;
    int _2069 = as_type<int>(_2057);
    int _2071 = _2047;
    int _2073 = _2067 ? (-1) : 0;
    if (!_2067)
    {
        float _2075 = as_type<float>(_2048) * 1.0;
        _2069 = as_type<int>(_2075);
    }
    int _2077 = _2069;
    bool _2079 = !_2067;
    int _2081 = _2077;
    if (!_2079)
    {
        float _2083 = as_type<float>(_2048) + 0.0;
        bool _2085 = _2083 >= 0.0;
        bool _2087 = isnan(_2083);
        bool _2089 = _2085 || _2087;
        bool _2091 = isnan(0.0);
        bool _2093 = _2089 || _2091;
        int _2095 = as_type<int>(_2083);
        _2073 = _2093 ? (-1) : 0;
        if (!_2093)
        {
            _2095 = 2147483647;
        }
        int _2097 = _2095;
        bool _2099 = !_2093;
        _2081 = _2097;
        if (!_2099)
        {
            float _2101 = abs(as_type<float>(_2048));
            float _2103 = _2101 + 0.0;
            bool _2105 = _2103 > as_type<float>(0x7f800000u /* inf */);
            bool _2107 = isnan(_2103);
            bool _2109 = _2105 || _2107;
            bool _2111 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2113 = _2109 || _2111;
            int _2115 = as_type<int>(_2103);
            _2073 = _2113 ? (-1) : 0;
            if (_2113)
            {
                float _2117 = as_type<float>(_2048) + 1.0;
                _2115 = as_type<int>(_2117);
            }
            int _2119 = _2115;
            _2081 = _2119;
            if (!_2113)
            {
                float _2121 = abs(as_type<float>(_2048));
                float _2123 = _2121 + (-0.0);
                float _2125 = 0.0 + _2123;
                bool _2127 = _2125 != as_type<float>(0x7f800000u /* inf */);
                bool _2129 = isnan(_2125);
                bool _2131 = _2127 || _2129;
                bool _2133 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2135 = _2131 || _2133;
                int _2137 = as_type<int>(_2125);
                _2073 = _2135 ? (-1) : 0;
                if (!_2135)
                {
                    _2137 = _2048;
                }
                int _2139 = _2137;
                bool _2141 = !_2135;
                _2081 = _2139;
                if (!_2141)
                {
                    float _2143 = as_type<float>(_2048) * 18446744073709551616.0;
                    float _2145 = rsqrt(_2143);
                    float _2147 = _2143 * _2145;
                    float _2149 = _2145 * 0.5;
                    float _2151 = -_2147;
                    float _2153 = 0.0 + _2151;
                    float _2155 = fma(_2149, _2153, 0.5);
                    float _2157 = fma(_2147, _2155, _2147);
                    float _2159 = -_2157;
                    float _2161 = 0.0 + _2159;
                    float _2163 = fma(_2157, _2161, _2143);
                    float _2165 = fma(_2149, _2163, _2157);
                    float _2167 = _2165 * 2.3283064365386962890625e-10;
                    _2081 = as_type<int>(_2167);
                    _2071 = as_type<int>(_2157);
                }
            }
        }
    }
    int _2169 = _2081;
    int _2171 = _2071;
    int _2173 = _2073;
    _2050 = _2169;
    _2051 = _2049;
    _2052 = 0;
    _2053 = _2171;
    _2054 = _2173;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _244 = false;
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
    float _72 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _74 = precise::max(0.0, _72);
    float _76 = 1.0 / _52;
    float _78 = _76 * _58;
    float _80 = _76 * _64;
    float _82 = _76 * _70;
    float _84 = _78 * _78;
    float _86 = fma(_80, _80, _84);
    float _88 = fma(_82, _82, _86);
    float _90 = rsqrt(_88);
    float _92 = _80 * _90;
    float _94 = _82 * _90;
    float _96 = _78 * _90;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = -_96;
    float _104 = -_74;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].z, _104);
    float _108 = _98 * _98;
    float _110 = _100 * _100;
    float _112 = _108 + _110;
    float _114 = sqrt(_112);
    bool _118 = _114 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _120 = _90;
    float _122 = _74;
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
    float _242;
    if (!_222)
    {
        int _224 = 0;
        int _226 = 0;
        int _228 = as_type<int>(_210);
        int _230 = 1104;
        int _232;
        int _234;
        int _236;
        int _238;
        int _240;
        _48(_224, _226, _228, _230, _232, _234, _236, _238, _240);
        _242 = as_type<float>(_232);
        _244 = true;
    }
    else
    {
        float _246 = rsqrt(_210);
        float _248 = _210 * _246;
        float _250 = _246 * 0.5;
        float _252 = -_248;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, 0.5);
        float _258 = fma(_248, _256, _248);
        float _260 = -_258;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, _210);
        float _266 = fma(_250, _264, _258);
        _242 = _266;
    }
    _244 = false;
    float _268 = _242;
    bool _270 = _196 > 0.0;
    float _272 = _94 * _94;
    float _274 = _92 * _92;
    float _276 = _272 + _274;
    if (_270)
    {
        discard_fragment();
    }
    float _278 = rsqrt(_276);
    float _280 = _220 * _268;
    float _282 = _280 * 0.636619746685028076171875;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_284;
    float _288 = _286 + 1.0;
    float _290 = _94 * _278;
    float _292 = _92 * _278;
    if (_270)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float _294 = abs(_290);
    float _296 = abs(_292);
    float _298 = precise::max(_294, _296);
    float _300 = sqrt(_288);
    float _302 = in.m_42.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = precise::max(_298, 9.9999997473787516355514526367188e-05);
    float _310 = in.m_42.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = 1.0 / _308;
    float _318 = -_300;
    float _320 = _318 + 1.0;
    float _322 = _320 * 0.5;
    float _324 = -_316;
    float _326 = _290 * _324;
    float _328 = _292 * _316;
    float _330 = fma(_326, _322, 0.5);
    float _332 = fma(_328, _322, 0.5);
    float2 _1220;
    _1220.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_330, _332));
    _1220.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_330, _332));
    float _334 = _1220.x;
    float _336 = _334 * 256.0;
    int _338 = int(_336);
    float _340 = _76 * _306;
    float _342 = _76 * _314;
    float2 _1236 = float2(_340, _342);
    float2 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1236, float2(0.0), isnan(_1236))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1236, float2(0.0), isnan(_1236))).xy;
    float _348 = _346.x;
    float _350 = _346.y;
    float _352 = -_96;
    float _354 = _352 + 1.0;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _198 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _360 = fma(_196, -0.5, 0.5);
    float _362 = -_358;
    float _364 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[11].y, _362);
    float _366 = abs(_356);
    float _368 = log2(_366);
    float _370 = -_200;
    float _372 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[11].z, _364);
    float _374 = _368 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _376 = fma(_372, -0.5, 0.5);
    float _378 = fma(_372, 0.5, 0.5);
    float _380 = exp2(_374);
    float _382 = fma(_378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _384 = fma(_378, _382, -0.212114393711090087890625);
    float _386 = sqrt(_376);
    float _388 = fma(_378, _384, 1.570728778839111328125);
    float _390 = _196 + 1.0;
    float _392 = _380 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _394 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = -_396;
    float _400 = _398 + 1.0;
    float _402 = _386 * 0.636619746685028076171875;
    float _404 = -_388;
    float _406 = fma(_402, _404, 1.0);
    float _408 = abs(_400);
    float _410 = log2(_408);
    float _412 = _410 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _414 = exp2(_412);
    float _416 = -_196;
    float _418 = fma(_414, _390, _416);
    float _420 = fma(_418, 0.5, 0.5);
    float _422 = float(uint(_338));
    float _424 = _422 * 0.00390625;
    float2 _1353 = float2(_330, _332);
    float2 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1353, float2(0.0), isnan(_1353)), level(_424)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1353, float2(0.0), isnan(_1353)), level(_424)).xy;
    float _428 = _426.x;
    float _430 = _426.y;
    float2 _1366 = float2(_330, _332);
    float4 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1366, float2(0.0), isnan(_1366)), level(_424)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1366, float2(0.0), isnan(_1366)), level(_424)).xyzw;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = _433.w;
    float2 _1383 = float2(_406, _420);
    float3 _445 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1383, float2(0.0), isnan(_1383))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1383, float2(0.0), isnan(_1383))).xyz;
    float _447 = _445.x;
    float _449 = _445.y;
    float _451 = _445.z;
    float2 _1397 = float2(_406, _360);
    float3 _453 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1397, float2(0.0), isnan(_1397))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1397, float2(0.0), isnan(_1397))).xyz;
    float _455 = _453.x;
    float _457 = _453.y;
    float _459 = _453.z;
    float _461 = fma(_348, 2.0, -1.0);
    float _463 = fma(_350, 2.0, -1.0);
    float _465 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[22].x, _340);
    float _467 = fma(_463, (*spvDescriptorSet0.fp_c3)._m0[22].y, _342);
    float2 _1427 = float2(_465, _467);
    float4 _469 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1427, float2(0.0), isnan(_1427))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1427, float2(0.0), isnan(_1427))).xyzw;
    float _471 = _469.x;
    float _473 = _469.y;
    float _475 = _469.z;
    float _477 = _469.w;
    float _479 = _410 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _481 = -_96;
    float _483 = fma(_481, _96, _274);
    float _485 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _487 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _491 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _493 = _96 * _485;
    float _495 = _96 * _487;
    float _497 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _499 = _96 * _491;
    float _501 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _493);
    float _503 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _495);
    float _505 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _507 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _499);
    float _509 = -_94;
    float _511 = fma(_509, _489, _501);
    float _513 = fma(_94, _489, _501);
    float _515 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _517 = -_94;
    float _519 = fma(_517, _497, _503);
    float _521 = fma(_94, _497, _503);
    float _523 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _525 = -_92;
    float _527 = fma(_525, _515, _511);
    float _529 = fma(_92, _515, _513);
    float _531 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _533 = -_92;
    float _535 = fma(_533, _523, _519);
    float _537 = fma(_92, _523, _521);
    float _539 = -_96;
    float _541 = _92 * _539;
    float _543 = -_94;
    float _545 = fma(_543, _531, _507);
    float _547 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _549 = _92 * _96;
    float _551 = fma(_94, _531, _507);
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _555 = fma(_547, _541, _527);
    float _557 = fma(_547, _549, _529);
    float _559 = -_92;
    float _561 = fma(_559, _505, _545);
    float _563 = fma(_92, _505, _551);
    float _565 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _567 = fma(_553, _541, _535);
    float _569 = fma(_553, _549, _537);
    float _571 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _573 = fma(_565, _541, _561);
    float _575 = fma(_565, _549, _563);
    float _577 = _94 * (-3.0);
    float _579 = -_94;
    float _581 = _96 * _579;
    float _583 = _96 * _94;
    float _585 = exp2(_479);
    float _587 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _589 = _92 * _94;
    float _591 = -_94;
    float _593 = fma(_591, _577, -1.0);
    float _595 = fma(_272, 3.0, -1.0);
    float _597 = fma(_571, _583, _557);
    float _599 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _601 = fma(_587, _583, _569);
    float _603 = fma(_571, _581, _555);
    float _605 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _607 = fma(_599, _583, _575);
    float _609 = fma(_599, _581, _573);
    float _611 = fma(_587, _581, _567);
    float _613 = fma(_605, _589, _603);
    float _615 = fma(_605, _589, _597);
    float _617 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _619 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _621 = fma(_617, _589, _609);
    float _623 = fma(_617, _589, _607);
    float _625 = fma(_619, _589, _611);
    float _627 = fma(_619, _589, _601);
    float _629 = -_585;
    float _631 = _629 + 1.0;
    float _633 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _635 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _637 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _639 = fma(_633, _593, _613);
    float _641 = fma(_635, _593, _625);
    float _643 = fma(_637, _593, _621);
    float _645 = fma(_637, _595, _623);
    float _647 = fma(_633, _595, _615);
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _651 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _653 = fma(_635, _595, _627);
    float _655 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _657 = _631 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _659 = fma(_649, _483, _639);
    float _661 = fma(_649, _483, _647);
    float _663 = fma(_651, _483, _641);
    float _665 = fma(_651, _483, _653);
    float _667 = fma(_655, _483, _643);
    float _669 = fma(_655, _483, _645);
    float _671 = -_657;
    float _673 = _671 + 1.0;
    float _675 = -_657;
    float _677 = _675 + 1.0;
    float _679 = _657 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _681 = abs(_673);
    float _683 = log2(_681);
    float _685 = abs(_677);
    float _687 = log2(_685);
    float _689 = _430 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _691 = _428 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _693 = _683 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _695 = _687 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _697 = -_689;
    float _699 = _697 + 1.0;
    float _701 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _703 = _428 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _705 = _441 * _441;
    float _707 = exp2(_693);
    float _709 = _661 * _701;
    float _711 = _703 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _713 = _665 * _701;
    float _715 = _669 * _701;
    float _717 = _705 * _705;
    float _719 = fma(_659, _711, _709);
    float _721 = fma(_663, _711, _713);
    float _723 = abs(_699);
    float _725 = log2(_723);
    float _727 = fma(_667, _711, _715);
    float _729 = _717 * 16.0;
    float _731 = _721 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _733 = _719 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _735 = _727 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _737 = exp2(_695);
    float _739 = _707 * _729;
    float _741 = _437 * _739;
    float _743 = _435 * _739;
    float _745 = _439 * _739;
    float _747 = _725 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _749 = exp2(_747);
    float _751 = _737 * _731;
    float _753 = _737 * _733;
    float _755 = _737 * _735;
    float _757 = _751 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _759 = _755 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _761 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[27].y, _757);
    float _763 = _753 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _765 = fma(_745, (*spvDescriptorSet0.fp_c3)._m0[27].z, _759);
    float _767 = -_749;
    float _769 = spvFAdd(_767, 1.00010001659393310546875);
    float _771 = -_749;
    float _773 = _771 + 1.0;
    float _775 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[27].x, _763);
    float _777 = fma(_449, _679, _761);
    float _779 = 1.0 / _769;
    float _781 = -_689;
    float _783 = _781 + _773;
    float _785 = fma(_447, _679, _775);
    float _787 = fma(_451, _679, _765);
    float _789 = _783 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _791 = _457 * _789;
    float _793 = _455 * _789;
    float _795 = _459 * _789;
    float _797 = fma(_689, _777, _791);
    float _799 = fma(_689, _785, _793);
    float _801 = _779 * _797;
    float _803 = fma(_689, _787, _795);
    float _805 = _779 * _799;
    float _807 = _801 * 0.715200006961822509765625;
    float _809 = _779 * _803;
    float _811 = fma(_805, 0.2125999927520751953125, _807);
    float _813 = fma(_809, 0.072200000286102294921875, _811);
    float _815 = 1.0 / _813;
    float _817 = _815 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _819 = precise::clamp(_817, 0.0, 1.0);
    float _821 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _823 = _821 * _477;
    float _825 = fma(_805, _823, _471);
    float _827 = fma(_801, _823, _473);
    float _829 = fma(_809, _823, _475);
    out.m_40.x = _825;
    out.m_40.y = _827;
    out.m_40.z = _829;
    out.m_40.w = _773;
    return out;
}

