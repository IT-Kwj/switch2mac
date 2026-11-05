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
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _2111, thread const int& _2112, thread const int& _2113, thread const int& _2114, thread int& _2115, thread int& _2116, thread int& _2117, thread int& _2118, thread int& _2119, thread int& _2120)
{
    float _2123 = as_type<float>(_2113) + 0.0;
    bool _2125 = _2123 != 0.0;
    bool _2127 = isnan(_2123);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(0.0);
    bool _2133 = _2129 || _2131;
    int _2135 = _2111;
    int _2137 = _2112;
    int _2139 = _2113;
    int _2141 = _2133 ? (-1) : 0;
    if (!_2133)
    {
        float _2143 = as_type<float>(_2113) * 1.0;
        _2135 = as_type<int>(_2143);
    }
    int _2145 = _2135;
    bool _2147 = !_2133;
    int _2149 = _2145;
    int _2151 = _2145;
    if (!_2147)
    {
        float _2153 = as_type<float>(_2113) + 0.0;
        bool _2155 = _2153 >= 0.0;
        bool _2157 = isnan(_2153);
        bool _2159 = _2155 || _2157;
        bool _2161 = isnan(0.0);
        bool _2163 = _2159 || _2161;
        _2141 = _2163 ? (-1) : 0;
        if (!_2163)
        {
            _2149 = 2147483647;
        }
        int _2165 = _2149;
        bool _2167 = !_2163;
        int _2169 = _2165;
        _2151 = _2165;
        if (!_2167)
        {
            float _2171 = abs(as_type<float>(_2113));
            float _2173 = _2171 + 0.0;
            bool _2175 = _2173 > as_type<float>(0x7f800000u /* inf */);
            bool _2177 = isnan(_2173);
            bool _2179 = _2175 || _2177;
            bool _2181 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2183 = _2179 || _2181;
            _2141 = _2183 ? (-1) : 0;
            if (_2183)
            {
                float _2185 = as_type<float>(_2113) + 1.0;
                _2169 = as_type<int>(_2185);
            }
            int _2187 = _2169;
            int _2189 = _2187;
            _2151 = _2187;
            if (!_2183)
            {
                float _2191 = abs(as_type<float>(_2113));
                float _2193 = _2191 + (-0.0);
                float _2195 = 0.0 + _2193;
                bool _2197 = _2195 != as_type<float>(0x7f800000u /* inf */);
                bool _2199 = isnan(_2195);
                bool _2201 = _2197 || _2199;
                bool _2203 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2205 = _2201 || _2203;
                _2141 = _2205 ? (-1) : 0;
                if (!_2205)
                {
                    _2189 = _2113;
                }
                int _2207 = _2189;
                bool _2209 = !_2205;
                _2151 = _2207;
                if (!_2209)
                {
                    float _2211 = as_type<float>(_2113) * 18446744073709551616.0;
                    float _2213 = rsqrt(_2211);
                    float _2215 = _2211 * _2213;
                    float _2217 = _2213 * 0.5;
                    float _2219 = -_2215;
                    float _2221 = 0.0 + _2219;
                    float _2223 = fma(_2217, _2221, 0.5);
                    float _2225 = fma(_2215, _2223, _2215);
                    float _2227 = -_2225;
                    float _2229 = 0.0 + _2227;
                    float _2231 = fma(_2225, _2229, _2211);
                    float _2233 = fma(_2217, _2231, _2225);
                    float _2235 = _2233 * 2.3283064365386962890625e-10;
                    _2151 = as_type<int>(_2235);
                    _2137 = as_type<int>(_2225);
                    _2139 = as_type<int>(_2221);
                }
            }
        }
    }
    int _2237 = _2151;
    int _2239 = _2137;
    int _2241 = _2139;
    int _2243 = _2141;
    _2115 = _2114;
    _2116 = 0;
    _2117 = _2237;
    _2118 = _2239;
    _2119 = _2241;
    _2120 = _2243;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _244 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_37.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_37.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_37.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _72;
    float _80 = fma(_74, _74, _78);
    float _82 = fma(_76, _76, _80);
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _86 = rsqrt(_82);
    float _88 = precise::max(0.0, _84);
    float _90 = _74 * _86;
    float _92 = _76 * _86;
    float _94 = _72 * _86;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_88;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _84;
    float _120 = _86;
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
    float _242;
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
        int _240;
        _46(_222, _224, _226, _228, _230, _232, _234, _236, _238, _240);
        _242 = as_type<float>(_234);
        _244 = true;
    }
    else
    {
        float _246 = rsqrt(_208);
        float _248 = _208 * _246;
        float _250 = _246 * 0.5;
        float _252 = -_248;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, 0.5);
        float _258 = fma(_248, _256, _248);
        float _260 = -_258;
        float _262 = 0.0 + _260;
        float _264 = fma(_258, _262, _208);
        float _266 = fma(_250, _264, _258);
        _242 = _266;
    }
    _244 = false;
    float _268 = _242;
    bool _270 = _194 > 0.0;
    float _272 = _92 * _92;
    float _274 = _90 * _90;
    float _276 = _272 + _274;
    if (_270)
    {
        discard_fragment();
    }
    float _278 = rsqrt(_276);
    float _280 = _218 * _268;
    float _282 = _280 * 0.636619746685028076171875;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_284;
    float _288 = _286 + 1.0;
    float _290 = sqrt(_288);
    float _292 = _92 * _278;
    float _294 = _90 * _278;
    float _296 = abs(_292);
    float _298 = abs(_294);
    float _300 = precise::max(_296, _298);
    float _302 = precise::max(_300, 9.9999997473787516355514526367188e-05);
    float _304 = -_290;
    float _306 = _304 + 1.0;
    float _308 = 1.0 / _302;
    float _310 = _306 * 0.5;
    float _312 = -_308;
    float _314 = _292 * _312;
    float _316 = _294 * _308;
    float _318 = fma(_314, _310, 0.5);
    float _320 = fma(_316, _310, 0.5);
    if (_270)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    float2 _1228;
    _1228.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    _1228.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    float _322 = _1228.x;
    float _324 = _322 * 256.0;
    int _326 = int(_324);
    float _328 = -_94;
    float _330 = _328 + 1.0;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _196 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _336 = abs(_332);
    float _338 = log2(_336);
    float _340 = -_334;
    float _342 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[11].y, _340);
    float _344 = -_198;
    float _346 = fma(_344, (*spvDescriptorSet0.fp_c3)._m0[11].z, _342);
    float _348 = fma(_346, -0.5, 0.5);
    float _350 = fma(_346, 0.5, 0.5);
    float _352 = fma(_350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _354 = sqrt(_348);
    float _356 = _338 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _358 = exp2(_356);
    float _360 = _358 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _362 = fma(_360, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = fma(_350, _352, -0.212114393711090087890625);
    float _368 = _194 + 1.0;
    float _370 = -_364;
    float _372 = _370 + 1.0;
    float _374 = fma(_350, _366, 1.570728778839111328125);
    float _376 = _354 * 0.636619746685028076171875;
    float _378 = abs(_372);
    float _380 = log2(_378);
    float _382 = -_374;
    float _384 = fma(_376, _382, 1.0);
    float _386 = _380 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _388 = exp2(_386);
    float _390 = -_194;
    float _392 = fma(_388, _368, _390);
    float _394 = fma(_194, -0.5, 0.5);
    float _396 = fma(_392, 0.5, 0.5);
    float _398 = float(uint(_326));
    float _400 = _398 * 0.00390625;
    float2 _1341 = float2(_318, _320);
    float2 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1341, float2(0.0), isnan(_1341)), level(_400)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1341, float2(0.0), isnan(_1341)), level(_400)).xy;
    float _406 = _404.x;
    float _408 = _404.y;
    float2 _1356 = float2(_318, _320);
    float2 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1356, float2(0.0), isnan(_1356)), level(_400)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1356, float2(0.0), isnan(_1356)), level(_400)).xy;
    float _412 = _410.x;
    float _414 = _410.y;
    float2 _1369 = float2(_318, _320);
    float4 _417 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1369, float2(0.0), isnan(_1369)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1369, float2(0.0), isnan(_1369)), level(_400)).xyzw;
    float _419 = _417.x;
    float _421 = _417.y;
    float _423 = _417.z;
    float _425 = _417.w;
    float2 _1386 = float2(_318, _320);
    float4 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1386, float2(0.0), isnan(_1386)), level(_400)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1386, float2(0.0), isnan(_1386)), level(_400)).xyzw;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _427.w;
    float2 _1403 = float2(_384, _396);
    float3 _439 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1403, float2(0.0), isnan(_1403))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1403, float2(0.0), isnan(_1403))).xyz;
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    float2 _1417 = float2(_384, _394);
    float3 _447 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1417, float2(0.0), isnan(_1417))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1417, float2(0.0), isnan(_1417))).xyz;
    float _449 = _447.x;
    float _451 = _447.y;
    float _453 = _447.z;
    float _455 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _457 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _459 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _461 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _463 = _94 * _455;
    float _465 = _94 * _457;
    float _467 = _94 * _459;
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _471 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _463);
    float _473 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _465);
    float _475 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _467);
    float _477 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _479 = -_92;
    float _481 = fma(_479, _469, _471);
    float _483 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _485 = fma(_92, _469, _471);
    float _487 = -_92;
    float _489 = fma(_487, _477, _475);
    float _491 = fma(_92, _477, _475);
    float _493 = -_92;
    float _495 = fma(_493, _483, _473);
    float _497 = fma(_92, _483, _473);
    float _499 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _501 = -_90;
    float _503 = fma(_501, _461, _481);
    float _505 = fma(_90, _461, _485);
    float _507 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _509 = fma(_90, _499, _491);
    float _511 = -_90;
    float _513 = fma(_511, _499, _489);
    float _515 = -_90;
    float _517 = fma(_515, _507, _495);
    float _519 = fma(_90, _507, _497);
    float _521 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _523 = _90 * _94;
    float _525 = -_94;
    float _527 = _90 * _525;
    float _529 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _531 = fma(_521, _523, _505);
    float _533 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _535 = fma(_521, _527, _503);
    float _537 = fma(_529, _527, _517);
    float _539 = fma(_529, _523, _519);
    float _541 = fma(_533, _527, _513);
    float _543 = fma(_533, _523, _509);
    float _545 = -_92;
    float _547 = _94 * _545;
    float _549 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _551 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _553 = _94 * _92;
    float _555 = _90 * _90;
    float _557 = fma(_549, _547, _535);
    float _559 = fma(_551, _547, _537);
    float _561 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _563 = fma(_549, _553, _531);
    float _565 = fma(_551, _553, _539);
    float _567 = -_94;
    float _569 = fma(_567, _94, _555);
    float _571 = fma(_561, _547, _541);
    float _573 = fma(_561, _553, _543);
    float _575 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _577 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _579 = _92 * (-3.0);
    float _581 = fma(_272, 3.0, -1.0);
    float _583 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _585 = _380 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _587 = _90 * _92;
    float _589 = -_92;
    float _591 = fma(_589, _579, -1.0);
    float _593 = fma(_583, _587, _559);
    float _595 = exp2(_585);
    float _597 = fma(_583, _587, _565);
    float _599 = fma(_575, _587, _557);
    float _601 = fma(_575, _587, _563);
    float _603 = fma(_577, _587, _571);
    float _605 = fma(_577, _587, _573);
    float _607 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _609 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _611 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _613 = fma(_607, _591, _599);
    float _615 = fma(_609, _591, _593);
    float _617 = fma(_611, _591, _603);
    float _619 = fma(_607, _581, _601);
    float _621 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _623 = fma(_609, _581, _597);
    float _625 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _627 = fma(_611, _581, _605);
    float _629 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _631 = fma(_621, _569, _619);
    float _633 = fma(_621, _569, _613);
    float _635 = -_595;
    float _637 = _635 + 1.0;
    float _639 = fma(_625, _569, _615);
    float _641 = fma(_625, _569, _623);
    float _643 = fma(_629, _569, _617);
    float _645 = fma(_629, _569, _627);
    float _647 = _637 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _649 = -_647;
    float _651 = _649 + 1.0;
    float _653 = _647 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _655 = abs(_651);
    float _657 = log2(_655);
    float _659 = _657 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _661 = _406 * _408;
    float _663 = -_408;
    float _665 = _663 + _414;
    float _667 = _425 * _425;
    float _669 = _435 * _435;
    float _671 = -_661;
    float _673 = fma(_412, _414, _671);
    float _675 = fma(_665, (*spvDescriptorSet0.fp_c3)._m0[0].x, _408);
    float _677 = _667 * _667;
    float _679 = _669 * _669;
    float _681 = fma(_673, (*spvDescriptorSet0.fp_c3)._m0[0].x, _661);
    float _683 = precise::max(_675, 1.52587890625e-05);
    float _685 = _675 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _687 = _677 * 16.0;
    float _689 = exp2(_659);
    float _691 = -_685;
    float _693 = _691 + 1.0;
    float _695 = _408 * _687;
    float _697 = _421 * _695;
    float _699 = 1.0 / _683;
    float _701 = _419 * _695;
    float _703 = _423 * _695;
    float _705 = _657 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _707 = _679 * 16.0;
    float _709 = abs(_693);
    float _711 = log2(_709);
    float _713 = _414 * _707;
    float _715 = -_697;
    float _717 = fma(_431, _713, _715);
    float _719 = -_701;
    float _721 = fma(_429, _713, _719);
    float _723 = -_703;
    float _725 = fma(_433, _713, _723);
    float _727 = _681 * _699;
    float _729 = exp2(_705);
    float _731 = fma(_717, (*spvDescriptorSet0.fp_c3)._m0[0].x, _697);
    float _733 = _689 * _699;
    float _735 = _727 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _737 = _727 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _739 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _741 = _731 * _733;
    float _743 = _735 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _745 = _711 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _747 = _737 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _749 = fma(_725, (*spvDescriptorSet0.fp_c3)._m0[0].x, _703);
    float _751 = _631 * _743;
    float _753 = _641 * _743;
    float _755 = _645 * _743;
    float _757 = _739 * _733;
    float _759 = exp2(_745);
    float _761 = fma(_639, _747, _753);
    float _763 = fma(_633, _747, _751);
    float _765 = fma(_643, _747, _755);
    float _767 = _749 * _733;
    float _769 = _761 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _771 = _763 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _773 = _765 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _775 = _729 * _769;
    float _777 = _729 * _771;
    float _779 = _729 * _773;
    float _781 = _775 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _783 = _777 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _785 = _779 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _787 = -_759;
    float _789 = spvFAdd(_787, 1.00010001659393310546875);
    float _791 = -_759;
    float _793 = _791 + 1.0;
    float _795 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[27].y, _781);
    float _797 = fma(_757, (*spvDescriptorSet0.fp_c3)._m0[27].x, _783);
    float _799 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[27].z, _785);
    float _801 = -_685;
    float _803 = _801 + _793;
    float _805 = 1.0 / _789;
    float _807 = fma(_443, _653, _795);
    float _809 = fma(_441, _653, _797);
    float _811 = _803 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _813 = fma(_445, _653, _799);
    float _815 = _451 * _811;
    float _817 = _449 * _811;
    float _819 = _453 * _811;
    float _821 = fma(_685, _807, _815);
    float _823 = fma(_685, _809, _817);
    float _825 = fma(_685, _813, _819);
    float _827 = _805 * _821;
    float _829 = _805 * _823;
    float _831 = _805 * _825;
    float _833 = _827 * 0.715200006961822509765625;
    float _835 = fma(_829, 0.2125999927520751953125, _833);
    float _837 = fma(_831, 0.072200000286102294921875, _835);
    float _839 = 1.0 / _837;
    float _841 = _839 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _843 = precise::clamp(_841, 0.0, 1.0);
    float _845 = fma(_843, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _847 = _829 * _845;
    float _849 = _827 * _845;
    float _851 = _831 * _845;
    out.m_40.x = _847;
    out.m_40.y = _849;
    out.m_40.z = _851;
    out.m_40.w = _793;
    return out;
}

