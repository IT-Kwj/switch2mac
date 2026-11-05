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
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
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
void _52(thread const int& _2128, thread const int& _2129, thread const int& _2130, thread const int& _2131, thread int& _2132, thread int& _2133, thread int& _2134, thread int& _2135, thread int& _2136, thread int& _2137)
{
    float _2140 = as_type<float>(_2128) + 0.0;
    bool _2142 = _2140 != 0.0;
    bool _2144 = isnan(_2140);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.0);
    bool _2150 = _2146 || _2148;
    int _2152 = as_type<int>(_2140);
    int _2154 = _2129;
    int _2156 = _2130;
    int _2158 = _2150 ? (-1) : 0;
    if (!_2150)
    {
        float _2160 = as_type<float>(_2128) * 1.0;
        _2152 = as_type<int>(_2160);
    }
    int _2162 = _2152;
    bool _2164 = !_2150;
    int _2166 = _2162;
    if (!_2164)
    {
        float _2168 = as_type<float>(_2128) + 0.0;
        bool _2170 = _2168 >= 0.0;
        bool _2172 = isnan(_2168);
        bool _2174 = _2170 || _2172;
        bool _2176 = isnan(0.0);
        bool _2178 = _2174 || _2176;
        int _2180 = as_type<int>(_2168);
        _2158 = _2178 ? (-1) : 0;
        if (!_2178)
        {
            _2180 = 2147483647;
        }
        int _2182 = _2180;
        bool _2184 = !_2178;
        _2166 = _2182;
        if (!_2184)
        {
            float _2186 = abs(as_type<float>(_2128));
            float _2188 = _2186 + 0.0;
            bool _2190 = _2188 > as_type<float>(0x7f800000u /* inf */);
            bool _2192 = isnan(_2188);
            bool _2194 = _2190 || _2192;
            bool _2196 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2198 = _2194 || _2196;
            int _2200 = as_type<int>(_2188);
            _2158 = _2198 ? (-1) : 0;
            if (_2198)
            {
                float _2202 = as_type<float>(_2128) + 1.0;
                _2200 = as_type<int>(_2202);
            }
            int _2204 = _2200;
            _2166 = _2204;
            if (!_2198)
            {
                float _2206 = abs(as_type<float>(_2128));
                float _2208 = _2206 + (-0.0);
                float _2210 = 0.0 + _2208;
                bool _2212 = _2210 != as_type<float>(0x7f800000u /* inf */);
                bool _2214 = isnan(_2210);
                bool _2216 = _2212 || _2214;
                bool _2218 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2220 = _2216 || _2218;
                int _2222 = as_type<int>(_2210);
                _2158 = _2220 ? (-1) : 0;
                if (!_2220)
                {
                    _2222 = _2128;
                }
                int _2224 = _2222;
                bool _2226 = !_2220;
                _2166 = _2224;
                if (!_2226)
                {
                    float _2228 = as_type<float>(_2128) * 18446744073709551616.0;
                    float _2230 = rsqrt(_2228);
                    float _2232 = _2228 * _2230;
                    float _2234 = _2230 * 0.5;
                    float _2236 = -_2232;
                    float _2238 = 0.0 + _2236;
                    float _2240 = fma(_2234, _2238, 0.5);
                    float _2242 = fma(_2232, _2240, _2232);
                    float _2244 = -_2242;
                    float _2246 = 0.0 + _2244;
                    float _2248 = fma(_2242, _2246, _2228);
                    float _2250 = fma(_2234, _2248, _2242);
                    float _2252 = _2250 * 2.3283064365386962890625e-10;
                    _2166 = as_type<int>(_2252);
                    _2154 = as_type<int>(_2242);
                    _2156 = as_type<int>(_2238);
                }
            }
        }
    }
    int _2254 = _2166;
    int _2256 = _2154;
    int _2258 = _2156;
    int _2260 = _2158;
    _2132 = _2254;
    _2133 = _2131;
    _2134 = 0;
    _2135 = _2256;
    _2136 = _2258;
    _2137 = _2260;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _250 = false;
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
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _76 * _68;
    float _82 = _76 * _74;
    float _84 = _78 * _78;
    float _86 = fma(_80, _80, _84);
    float _88 = fma(_82, _82, _86);
    float _90 = rsqrt(_88);
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _94 = precise::max(0.0, _92);
    float _96 = _80 * _90;
    float _98 = _82 * _90;
    float _100 = _78 * _90;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _106 = -_100;
    float _108 = -_94;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _108);
    float _112 = _102 * _102;
    float _114 = _104 * _104;
    float _116 = _112 + _114;
    float _118 = sqrt(_116);
    bool _122 = _118 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _124 = _90;
    float _126 = _92;
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
    float _248;
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
        _52(_228, _230, _232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_236);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_214);
        float _254 = _214 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _214);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    bool _276 = _200 > 0.0;
    float _278 = _98 * _98;
    float _280 = _96 * _96;
    float _282 = _278 + _280;
    if (_276)
    {
        discard_fragment();
    }
    float _284 = rsqrt(_282);
    float _286 = _224 * _274;
    float _288 = _286 * 0.636619746685028076171875;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = -_290;
    float _294 = _292 + 1.0;
    float _296 = sqrt(_294);
    float _298 = _98 * _284;
    float _300 = _96 * _284;
    float _302 = abs(_298);
    float _304 = abs(_300);
    float _306 = precise::max(_302, _304);
    float _308 = precise::max(_306, 9.9999997473787516355514526367188e-05);
    float _310 = -_296;
    float _312 = _310 + 1.0;
    float _314 = 1.0 / _308;
    float _316 = _312 * 0.5;
    float _318 = -_314;
    float _320 = _298 * _318;
    float _322 = _300 * _314;
    float _324 = fma(_320, _316, 0.5);
    float _326 = fma(_322, _316, 0.5);
    if (_276)
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
    float2 _1238;
    _1238.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    _1238.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_324, _326));
    float _328 = _1238.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = -_100;
    float _336 = _334 + 1.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _202 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _342 = in.m_46.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_46.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = abs(_338);
    float _356 = log2(_354);
    float _358 = -_340;
    float _360 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[11].y, _358);
    float _362 = -_204;
    float _364 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[11].z, _360);
    float _366 = _356 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _368 = exp2(_366);
    float _370 = _76 * _346;
    float _372 = _76 * _352;
    float _374 = _368 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _376 = fma(_374, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = fma(_364, -0.5, 0.5);
    float _382 = fma(_364, 0.5, 0.5);
    float _384 = -_378;
    float _386 = _384 + 1.0;
    float _388 = sqrt(_380);
    float _390 = abs(_386);
    float _392 = log2(_390);
    float _394 = _388 * 0.636619746685028076171875;
    float _396 = fma(_382, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _398 = fma(_382, _396, -0.212114393711090087890625);
    float _400 = _200 + 1.0;
    float _402 = _392 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _404 = fma(_382, _398, 1.570728778839111328125);
    float _406 = exp2(_402);
    float _408 = -_404;
    float _410 = fma(_394, _408, 1.0);
    float _412 = -_200;
    float _414 = fma(_406, _400, _412);
    float _416 = fma(_414, 0.5, 0.5);
    float _418 = float(uint(_332));
    float _420 = _418 * 0.00390625;
    float2 _1369 = float2(_324, _326);
    float2 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1369, float2(0.0), isnan(_1369)), level(_420)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1369, float2(0.0), isnan(_1369)), level(_420)).xy;
    float _426 = _424.x;
    float _428 = _424.y;
    float2 _1384 = float2(_324, _326);
    float2 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1384, float2(0.0), isnan(_1384)), level(_420)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1384, float2(0.0), isnan(_1384)), level(_420)).xy;
    float _432 = _430.x;
    float _434 = _430.y;
    float2 _1397 = float2(_324, _326);
    float4 _437 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1397, float2(0.0), isnan(_1397)), level(_420)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1397, float2(0.0), isnan(_1397)), level(_420)).xyzw;
    float _439 = _437.x;
    float _441 = _437.y;
    float _443 = _437.z;
    float _445 = _437.w;
    float2 _1414 = float2(_324, _326);
    float4 _447 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1414, float2(0.0), isnan(_1414)), level(_420)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1414, float2(0.0), isnan(_1414)), level(_420)).xyzw;
    float _449 = _447.x;
    float _451 = _447.y;
    float _453 = _447.z;
    float _455 = _447.w;
    float2 _1431 = float2(_370, _372);
    float3 _459 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1431, float2(0.0), isnan(_1431))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1431, float2(0.0), isnan(_1431))).xyz;
    float _461 = _459.x;
    float _463 = _459.y;
    float _465 = _459.z;
    float2 _1445 = float2(_410, _416);
    float3 _467 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1445, float2(0.0), isnan(_1445))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1445, float2(0.0), isnan(_1445))).xyz;
    float _469 = _467.x;
    float _471 = _467.y;
    float _473 = _467.z;
    float _475 = -_100;
    float _477 = fma(_475, _100, _280);
    float _479 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _481 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _483 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _485 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _487 = _100 * _479;
    float _489 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _491 = _100 * _483;
    float _493 = _100 * _485;
    float _495 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _487);
    float _497 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _499 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _491);
    float _501 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _493);
    float _503 = -_98;
    float _505 = fma(_503, _489, _495);
    float _507 = fma(_98, _489, _495);
    float _509 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _511 = -_98;
    float _513 = fma(_511, _497, _499);
    float _515 = fma(_98, _497, _499);
    float _517 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _519 = -_98;
    float _521 = fma(_519, _509, _501);
    float _523 = fma(_98, _509, _501);
    float _525 = -_96;
    float _527 = fma(_525, _481, _505);
    float _529 = fma(_96, _481, _507);
    float _531 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _533 = -_96;
    float _535 = fma(_533, _517, _513);
    float _537 = fma(_96, _517, _515);
    float _539 = -_96;
    float _541 = fma(_539, _531, _521);
    float _543 = fma(_96, _531, _523);
    float _545 = -_100;
    float _547 = _96 * _545;
    float _549 = _96 * _100;
    float _551 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _555 = _96 * _98;
    float _557 = fma(_551, _547, _535);
    float _559 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _561 = fma(_551, _549, _537);
    float _563 = fma(_553, _547, _541);
    float _565 = fma(_553, _549, _543);
    float _567 = fma(_559, _547, _527);
    float _569 = fma(_559, _549, _529);
    float _571 = -_98;
    float _573 = _100 * _571;
    float _575 = _100 * _98;
    float _577 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _579 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _581 = _98 * (-3.0);
    float _583 = fma(_577, _573, _567);
    float _585 = fma(_577, _575, _569);
    float _587 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _589 = fma(_579, _573, _557);
    float _591 = fma(_579, _575, _561);
    float _593 = -_98;
    float _595 = fma(_593, _581, -1.0);
    float _597 = fma(_587, _573, _563);
    float _599 = fma(_587, _575, _565);
    float _601 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _603 = fma(_278, 3.0, -1.0);
    float _605 = fma(_601, _555, _589);
    float _607 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _609 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _611 = fma(_601, _555, _591);
    float _613 = fma(_607, _555, _583);
    float _615 = fma(_609, _555, _597);
    float _617 = fma(_607, _555, _585);
    float _619 = fma(_609, _555, _599);
    float _621 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _623 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _625 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _627 = fma(_621, _595, _605);
    float _629 = fma(_621, _603, _611);
    float _631 = fma(_623, _595, _613);
    float _633 = fma(_625, _595, _615);
    float _635 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _637 = fma(_623, _603, _617);
    float _639 = fma(_625, _603, _619);
    float _641 = _392 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _643 = fma(_635, _477, _627);
    float _645 = fma(_635, _477, _629);
    float _647 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _649 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _651 = exp2(_641);
    float _653 = fma(_647, _477, _631);
    float _655 = fma(_647, _477, _637);
    float _657 = fma(_649, _477, _633);
    float _659 = fma(_649, _477, _639);
    float _661 = -_651;
    float _663 = _661 + 1.0;
    float _665 = _663 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _667 = _426 * _428;
    float _669 = -_428;
    float _671 = _669 + _434;
    float _673 = -_665;
    float _675 = _673 + 1.0;
    float _677 = _445 * _445;
    float _679 = -_667;
    float _681 = fma(_432, _434, _679);
    float _683 = fma(_671, (*spvDescriptorSet0.fp_c3)._m0[0].x, _428);
    float _685 = _455 * _455;
    float _687 = _677 * _677;
    float _689 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[0].x, _667);
    float _691 = abs(_675);
    float _693 = log2(_691);
    float _695 = precise::max(_683, 1.52587890625e-05);
    float _697 = _685 * _685;
    float _699 = _461 * _463;
    float _701 = _665 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _703 = 1.0 / _695;
    float _705 = _689 * _703;
    float _707 = _687 * 16.0;
    float _709 = _705 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _711 = _705 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _713 = _428 * _707;
    float _715 = _693 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _717 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _719 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _721 = _655 * _717;
    float _723 = _645 * _717;
    float _725 = _659 * _717;
    float _727 = exp2(_715);
    float _729 = fma(_653, _719, _721);
    float _731 = _693 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _733 = fma(_643, _719, _723);
    float _735 = fma(_657, _719, _725);
    float _737 = _729 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _739 = _697 * 16.0;
    float _741 = _733 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _743 = _439 * _713;
    float _745 = _737 * 0.715200006961822509765625;
    float _747 = _441 * _713;
    float _749 = _735 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _751 = exp2(_731);
    float _753 = fma(_741, 0.2125999927520751953125, _745);
    float _755 = _443 * _713;
    float _757 = _434 * _739;
    float _759 = _699 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _761 = fma(_749, 0.072200000286102294921875, _753);
    float _763 = _727 * _703;
    float _765 = -_747;
    float _767 = fma(_451, _757, _765);
    float _769 = -_743;
    float _771 = fma(_449, _757, _769);
    float _773 = -_737;
    float _775 = _773 + _761;
    float _777 = -_755;
    float _779 = fma(_453, _757, _777);
    float _781 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[0].x, _747);
    float _783 = fma(_771, (*spvDescriptorSet0.fp_c3)._m0[0].x, _743);
    float _785 = fma(_759, _775, _737);
    float _787 = -_741;
    float _789 = _787 + _761;
    float _791 = -_749;
    float _793 = _791 + _761;
    float _795 = _781 * _763;
    float _797 = _751 * _785;
    float _799 = fma(_759, _789, _741);
    float _801 = fma(_759, _793, _749);
    float _803 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _805 = _797 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _807 = _751 * _799;
    float _809 = _751 * _801;
    float _811 = _783 * _763;
    float _813 = fma(_795, (*spvDescriptorSet0.fp_c3)._m0[27].y, _805);
    float _815 = _807 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _817 = _803 * _763;
    float _819 = _809 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _821 = fma(_471, _701, _813);
    float _823 = fma(_811, (*spvDescriptorSet0.fp_c3)._m0[27].x, _815);
    float _825 = fma(_817, (*spvDescriptorSet0.fp_c3)._m0[27].z, _819);
    float _827 = _821 * 0.715200006961822509765625;
    float _829 = fma(_469, _701, _823);
    float _831 = -_465;
    float _833 = _831 + 1.0;
    float _835 = fma(_473, _701, _825);
    float _837 = fma(_829, 0.2125999927520751953125, _827);
    float _839 = _683 * _833;
    float _841 = fma(_835, 0.072200000286102294921875, _837);
    float _843 = _839 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _845 = 1.0 / _841;
    float _847 = _845 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _849 = precise::clamp(_847, 0.0, 1.0);
    float _851 = fma(_849, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _853 = _829 * _851;
    float _855 = _821 * _851;
    float _857 = _835 * _851;
    out.m_42.x = _853;
    out.m_42.y = _855;
    out.m_42.z = _857;
    out.m_42.w = _843;
    out.m_44.x = _853;
    out.m_44.y = _855;
    out.m_44.z = _857;
    out.m_44.w = _843;
    return out;
}

