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
    texture2d<float> fp_t_tcb_10 [[id(1)]];
    sampler fp_t_tcb_10Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
    sampler fp_t_tcb_12Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _2157, thread const int& _2158, thread const int& _2159, thread const int& _2160, thread const int& _2161, thread int& _2162, thread int& _2163, thread int& _2164, thread int& _2165, thread int& _2166, thread int& _2167)
{
    float _2170 = as_type<float>(_2161) + 0.0;
    bool _2172 = _2170 != 0.0;
    bool _2174 = isnan(_2170);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(0.0);
    bool _2180 = _2176 || _2178;
    int _2182 = as_type<int>(_2170);
    int _2184 = 0;
    int _2186 = _2157;
    int _2188 = _2180 ? (-1) : 0;
    if (!_2180)
    {
        float _2190 = as_type<float>(_2161) * 1.0;
        _2182 = as_type<int>(_2190);
    }
    int _2192 = _2182;
    bool _2194 = !_2180;
    int _2196 = _2192;
    if (!_2194)
    {
        float _2198 = as_type<float>(_2161) + 0.0;
        bool _2200 = _2198 >= 0.0;
        bool _2202 = isnan(_2198);
        bool _2204 = _2200 || _2202;
        bool _2206 = isnan(0.0);
        bool _2208 = _2204 || _2206;
        int _2210 = as_type<int>(_2198);
        _2188 = _2208 ? (-1) : 0;
        if (!_2208)
        {
            _2210 = 2147483647;
        }
        int _2212 = _2210;
        bool _2214 = !_2208;
        _2196 = _2212;
        if (!_2214)
        {
            float _2216 = abs(as_type<float>(_2161));
            float _2218 = _2216 + 0.0;
            bool _2220 = _2218 > as_type<float>(0x7f800000u /* inf */);
            bool _2222 = isnan(_2218);
            bool _2224 = _2220 || _2222;
            bool _2226 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2228 = _2224 || _2226;
            int _2230 = as_type<int>(_2218);
            _2184 = 2139095040;
            _2188 = _2228 ? (-1) : 0;
            if (_2228)
            {
                float _2232 = as_type<float>(_2161) + 1.0;
                _2230 = as_type<int>(_2232);
            }
            int _2234 = _2230;
            _2196 = _2234;
            if (!_2228)
            {
                float _2236 = abs(as_type<float>(_2161));
                float _2238 = _2236 + (-0.0);
                float _2240 = 0.0 + _2238;
                bool _2242 = _2240 != as_type<float>(0x7f800000u /* inf */);
                bool _2244 = isnan(_2240);
                bool _2246 = _2242 || _2244;
                bool _2248 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2250 = _2246 || _2248;
                int _2252 = as_type<int>(_2240);
                _2188 = _2250 ? (-1) : 0;
                if (!_2250)
                {
                    _2252 = _2161;
                }
                int _2254 = _2252;
                bool _2256 = !_2250;
                _2196 = _2254;
                if (!_2256)
                {
                    float _2258 = as_type<float>(_2161) * 18446744073709551616.0;
                    float _2260 = rsqrt(_2258);
                    float _2262 = _2258 * _2260;
                    float _2264 = _2260 * 0.5;
                    float _2266 = -_2262;
                    float _2268 = 0.0 + _2266;
                    float _2270 = fma(_2264, _2268, 0.5);
                    float _2272 = fma(_2262, _2270, _2262);
                    float _2274 = -_2272;
                    float _2276 = 0.0 + _2274;
                    float _2278 = fma(_2272, _2276, _2258);
                    float _2280 = fma(_2264, _2278, _2272);
                    float _2282 = _2280 * 2.3283064365386962890625e-10;
                    _2196 = as_type<int>(_2282);
                    _2184 = as_type<int>(_2258);
                    _2186 = as_type<int>(_2278);
                }
            }
        }
    }
    int _2284 = _2196;
    int _2286 = _2184;
    int _2288 = _2186;
    int _2290 = _2188;
    _2162 = _2284;
    _2163 = _2286;
    _2164 = _2288;
    _2165 = _2160;
    _2166 = 0;
    _2167 = _2290;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _250 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _76 = precise::max(0.0, _74);
    float _78 = 1.0 / _54;
    float _80 = _78 * _60;
    float _82 = _78 * _66;
    float _84 = _78 * _72;
    float _86 = _80 * _80;
    float _88 = fma(_82, _82, _86);
    float _90 = fma(_84, _84, _88);
    float _92 = rsqrt(_90);
    float _94 = _82 * _92;
    float _96 = _84 * _92;
    float _98 = _80 * _92;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = -_98;
    float _106 = -_76;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _110 = _100 * _100;
    float _112 = _102 * _102;
    float _114 = _110 + _112;
    float _116 = sqrt(_114);
    bool _120 = _116 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _122 = _76;
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
    float _248;
    if (!_224)
    {
        int _226 = 0;
        int _228 = 0;
        int _230 = 0;
        int _232 = 1104;
        int _234 = as_type<int>(_212);
        int _236;
        int _238;
        int _240;
        int _242;
        int _244;
        int _246;
        _50(_226, _228, _230, _232, _234, _236, _238, _240, _242, _244, _246);
        _248 = as_type<float>(_236);
        _250 = true;
    }
    else
    {
        float _252 = rsqrt(_212);
        float _254 = _212 * _252;
        float _256 = _252 * 0.5;
        float _258 = -_254;
        float _260 = 0.0 + _258;
        float _262 = fma(_256, _260, 0.5);
        float _264 = fma(_254, _262, _254);
        float _266 = -_264;
        float _268 = 0.0 + _266;
        float _270 = fma(_264, _268, _212);
        float _272 = fma(_256, _270, _264);
        _248 = _272;
    }
    _250 = false;
    float _274 = _248;
    bool _276 = _198 > 0.0;
    float _278 = _96 * _96;
    float _280 = _94 * _94;
    float _282 = _278 + _280;
    if (_276)
    {
        discard_fragment();
    }
    float _284 = rsqrt(_282);
    float _286 = _222 * _274;
    float _288 = _286 * 0.636619746685028076171875;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = -_290;
    float _294 = _292 + 1.0;
    float _296 = _96 * _284;
    if (_276)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float _298 = _94 * _284;
    float _300 = in.m_44.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_44.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = sqrt(_294);
    float _314 = abs(_296);
    float _316 = abs(_298);
    float _318 = precise::max(_314, _316);
    float _320 = precise::max(_318, 9.9999997473787516355514526367188e-05);
    float _322 = 1.0 / _320;
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _326 * 0.5;
    float _330 = -_322;
    float _332 = _296 * _330;
    float _334 = _298 * _322;
    float _336 = _78 * _304;
    float _338 = _78 * _310;
    float _340 = fma(_332, _328, 0.5);
    float _342 = fma(_334, _328, 0.5);
    float2 _1273 = float2(_336, _338);
    float2 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1273, float2(0.0), isnan(_1273))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1273, float2(0.0), isnan(_1273))).xy;
    float _348 = _346.x;
    float _350 = _346.y;
    float2 _1288;
    _1288.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1288.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _352 = _1288.x;
    float _354 = _352 * 256.0;
    int _356 = int(_354);
    float _358 = -_98;
    float _360 = _358 + 1.0;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _200 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _366 = -_96;
    float _368 = _98 * _366;
    float _370 = abs(_362);
    float _372 = log2(_370);
    float _374 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _376 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _378 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _380 = -_364;
    float _382 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[11].y, _380);
    float _384 = _98 * _374;
    float _386 = _98 * _376;
    float _388 = _98 * _378;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _392 = -_202;
    float _394 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
    float _396 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _386);
    float _398 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _388);
    float _400 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _402 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _404 = _372 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _406 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _384);
    float _408 = -_96;
    float _410 = fma(_408, _390, _406);
    float _412 = exp2(_404);
    float _414 = fma(_96, _390, _406);
    float _416 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _418 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _420 = -_96;
    float _422 = fma(_420, _416, _396);
    float _424 = fma(_96, _416, _396);
    float _426 = fma(_96, _418, _398);
    float _428 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _430 = -_98;
    float _432 = _94 * _430;
    float _434 = -_94;
    float _436 = fma(_434, _428, _410);
    float _438 = fma(_94, _428, _414);
    float _440 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _442 = _412 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _444 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _446 = fma(_440, _432, _436);
    float _448 = fma(_442, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = -_96;
    float _454 = fma(_452, _418, _398);
    float _456 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _460 = -_450;
    float _462 = _460 + 1.0;
    float _464 = -_94;
    float _466 = fma(_464, _456, _422);
    float _468 = fma(_94, _456, _424);
    float _470 = abs(_462);
    float _472 = log2(_470);
    float _474 = -_94;
    float _476 = fma(_474, _458, _454);
    float _478 = fma(_94, _458, _426);
    float _480 = fma(_394, -0.5, 0.5);
    float _482 = _94 * _98;
    float _484 = fma(_400, _432, _476);
    float _486 = fma(_444, _432, _466);
    float _488 = fma(_400, _482, _478);
    float _490 = fma(_394, 0.5, 0.5);
    float _492 = fma(_440, _482, _438);
    float _494 = sqrt(_480);
    float _496 = fma(_444, _482, _468);
    float _498 = fma(_490, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _502 = _98 * _96;
    float _504 = _472 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _506 = fma(_490, _498, -0.212114393711090087890625);
    float _508 = _198 + 1.0;
    float _510 = fma(_500, _368, _446);
    float _512 = fma(_500, _502, _492);
    float _514 = fma(_490, _506, 1.570728778839111328125);
    float _516 = exp2(_504);
    float _518 = _494 * 0.636619746685028076171875;
    float _520 = -_514;
    float _522 = fma(_518, _520, 1.0);
    float _524 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _526 = fma(_524, _368, _486);
    float _528 = fma(_402, _368, _484);
    float _530 = -_198;
    float _532 = fma(_516, _508, _530);
    float _534 = fma(_198, -0.5, 0.5);
    float _536 = fma(_524, _502, _496);
    float _538 = fma(_532, 0.5, 0.5);
    float _540 = fma(_348, 2.0, -1.0);
    float _542 = fma(_350, 2.0, -1.0);
    float _544 = float(uint(_356));
    float _546 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[22].x, _336);
    float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[22].y, _338);
    float _550 = _544 * 0.00390625;
    float2 _1611 = float2(_336, _338);
    float3 _554 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1611, float2(0.0), isnan(_1611))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1611, float2(0.0), isnan(_1611))).xyz;
    float _556 = _554.x;
    float _558 = _554.y;
    float _560 = _554.z;
    float2 _1625 = float2(_340, _342);
    float2 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1625, float2(0.0), isnan(_1625)), level(_550)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1625, float2(0.0), isnan(_1625)), level(_550)).xy;
    float _564 = _562.x;
    float _566 = _562.y;
    float2 _1638 = float2(_340, _342);
    float4 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1638, float2(0.0), isnan(_1638)), level(_550)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1638, float2(0.0), isnan(_1638)), level(_550)).xyzw;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _569.w;
    float2 _1655 = float2(_522, _538);
    float3 _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1655, float2(0.0), isnan(_1655))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1655, float2(0.0), isnan(_1655))).xyz;
    float _581 = _579.x;
    float _583 = _579.y;
    float _585 = _579.z;
    float2 _1669 = float2(_522, _534);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1669, float2(0.0), isnan(_1669))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1669, float2(0.0), isnan(_1669))).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float2 _1683 = float2(_546, _548);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1683, float2(0.0), isnan(_1683))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1683, float2(0.0), isnan(_1683))).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = fma(_402, _502, _488);
    float _607 = _94 * _96;
    float _609 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _611 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _613 = -_98;
    float _615 = fma(_613, _98, _280);
    float _617 = fma(_609, _607, _510);
    float _619 = fma(_609, _607, _512);
    float _621 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _623 = _472 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _625 = fma(_611, _607, _526);
    float _627 = fma(_611, _607, _536);
    float _629 = fma(_621, _607, _528);
    float _631 = fma(_621, _607, _605);
    float _633 = _96 * (-3.0);
    float _635 = exp2(_623);
    float _637 = -_96;
    float _639 = fma(_637, _633, -1.0);
    float _641 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _643 = fma(_278, 3.0, -1.0);
    float _645 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _647 = fma(_641, _639, _617);
    float _649 = fma(_641, _643, _619);
    float _651 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _653 = fma(_645, _639, _629);
    float _655 = fma(_645, _643, _631);
    float _657 = -_635;
    float _659 = _657 + 1.0;
    float _661 = fma(_651, _639, _625);
    float _663 = fma(_651, _643, _627);
    float _665 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _667 = _659 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _669 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _671 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _673 = fma(_665, _615, _647);
    float _675 = fma(_665, _615, _649);
    float _677 = -_667;
    float _679 = _677 + 1.0;
    float _681 = fma(_669, _615, _661);
    float _683 = fma(_669, _615, _663);
    float _685 = fma(_671, _615, _653);
    float _687 = fma(_671, _615, _655);
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = abs(_679);
    float _695 = log2(_693);
    float _697 = _667 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _699 = abs(_691);
    float _701 = log2(_699);
    float _703 = _695 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _705 = -_560;
    float _707 = _705 + 1.0;
    float _709 = _556 * _558;
    float _711 = _564 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _713 = _566 * _707;
    float _715 = _564 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _717 = _709 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _719 = _711 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _721 = _713 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _723 = _715 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _725 = _683 * _719;
    float _727 = -_721;
    float _729 = _727 + 1.0;
    float _731 = _675 * _719;
    float _733 = _687 * _719;
    float _735 = fma(_681, _723, _725);
    float _737 = abs(_729);
    float _739 = log2(_737);
    float _741 = fma(_673, _723, _731);
    float _743 = _701 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _745 = _735 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _747 = fma(_685, _723, _733);
    float _749 = _741 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _751 = _577 * _577;
    float _753 = _747 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _755 = _745 * 0.715200006961822509765625;
    float _757 = exp2(_743);
    float _759 = _751 * _751;
    float _761 = fma(_749, 0.2125999927520751953125, _755);
    float _763 = _759 * 16.0;
    float _765 = _739 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _767 = fma(_753, 0.072200000286102294921875, _761);
    float _769 = exp2(_703);
    float _771 = -_745;
    float _773 = _771 + _767;
    float _775 = fma(_717, _773, _745);
    float _777 = exp2(_765);
    float _779 = -_749;
    float _781 = _779 + _767;
    float _783 = -_753;
    float _785 = _783 + _767;
    float _787 = _757 * _775;
    float _789 = fma(_717, _781, _749);
    float _791 = fma(_717, _785, _753);
    float _793 = _769 * _763;
    float _795 = _787 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _797 = _757 * _789;
    float _799 = _757 * _791;
    float _801 = _573 * _793;
    float _803 = _571 * _793;
    float _805 = _797 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _807 = _575 * _793;
    float _809 = -_777;
    float _811 = spvFAdd(_809, 1.00010001659393310546875);
    float _813 = -_777;
    float _815 = _813 + 1.0;
    float _817 = fma(_801, (*spvDescriptorSet0.fp_c3)._m0[27].y, _795);
    float _819 = _799 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _821 = fma(_803, (*spvDescriptorSet0.fp_c3)._m0[27].x, _805);
    float _823 = -_721;
    float _825 = _823 + _815;
    float _827 = 1.0 / _811;
    float _829 = fma(_583, _697, _817);
    float _831 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[27].z, _819);
    float _833 = _825 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _835 = fma(_581, _697, _821);
    float _837 = fma(_585, _697, _831);
    float _839 = _591 * _833;
    float _841 = _589 * _833;
    float _843 = _593 * _833;
    float _845 = fma(_721, _829, _839);
    float _847 = fma(_721, _835, _841);
    float _849 = _827 * _845;
    float _851 = fma(_721, _837, _843);
    float _853 = _827 * _847;
    float _855 = _849 * 0.715200006961822509765625;
    float _857 = _827 * _851;
    float _859 = fma(_853, 0.2125999927520751953125, _855);
    float _861 = fma(_857, 0.072200000286102294921875, _859);
    float _863 = 1.0 / _861;
    float _865 = _863 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _867 = precise::clamp(_865, 0.0, 1.0);
    float _869 = fma(_867, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _871 = _869 * _603;
    float _873 = fma(_853, _871, _597);
    float _875 = fma(_849, _871, _599);
    float _877 = fma(_857, _871, _601);
    out.m_42.x = _873;
    out.m_42.y = _875;
    out.m_42.z = _877;
    out.m_42.w = _815;
    return out;
}

