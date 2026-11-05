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
void _48(thread const int& _2203, thread const int& _2204, thread const int& _2205, thread const int& _2206, thread int& _2207, thread int& _2208, thread int& _2209, thread int& _2210, thread int& _2211, thread int& _2212)
{
    float _2215 = as_type<float>(_2203) + 0.0;
    bool _2217 = _2215 != 0.0;
    bool _2219 = isnan(_2215);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.0);
    bool _2225 = _2221 || _2223;
    int _2227 = as_type<int>(_2215);
    int _2229 = _2204;
    int _2231 = _2205;
    int _2233 = _2225 ? (-1) : 0;
    if (!_2225)
    {
        float _2235 = as_type<float>(_2203) * 1.0;
        _2227 = as_type<int>(_2235);
    }
    int _2237 = _2227;
    bool _2239 = !_2225;
    int _2241 = _2237;
    if (!_2239)
    {
        float _2243 = as_type<float>(_2203) + 0.0;
        bool _2245 = _2243 >= 0.0;
        bool _2247 = isnan(_2243);
        bool _2249 = _2245 || _2247;
        bool _2251 = isnan(0.0);
        bool _2253 = _2249 || _2251;
        int _2255 = as_type<int>(_2243);
        _2233 = _2253 ? (-1) : 0;
        if (!_2253)
        {
            _2255 = 2147483647;
        }
        int _2257 = _2255;
        bool _2259 = !_2253;
        _2241 = _2257;
        if (!_2259)
        {
            float _2261 = abs(as_type<float>(_2203));
            float _2263 = _2261 + 0.0;
            bool _2265 = _2263 > as_type<float>(0x7f800000u /* inf */);
            bool _2267 = isnan(_2263);
            bool _2269 = _2265 || _2267;
            bool _2271 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2273 = _2269 || _2271;
            int _2275 = as_type<int>(_2263);
            _2233 = _2273 ? (-1) : 0;
            if (_2273)
            {
                float _2277 = as_type<float>(_2203) + 1.0;
                _2275 = as_type<int>(_2277);
            }
            int _2279 = _2275;
            _2241 = _2279;
            if (!_2273)
            {
                float _2281 = abs(as_type<float>(_2203));
                float _2283 = _2281 + (-0.0);
                float _2285 = 0.0 + _2283;
                bool _2287 = _2285 != as_type<float>(0x7f800000u /* inf */);
                bool _2289 = isnan(_2285);
                bool _2291 = _2287 || _2289;
                bool _2293 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2295 = _2291 || _2293;
                int _2297 = as_type<int>(_2285);
                _2233 = _2295 ? (-1) : 0;
                if (!_2295)
                {
                    _2297 = _2203;
                }
                int _2299 = _2297;
                bool _2301 = !_2295;
                _2241 = _2299;
                if (!_2301)
                {
                    float _2303 = as_type<float>(_2203) * 18446744073709551616.0;
                    float _2305 = rsqrt(_2303);
                    float _2307 = _2303 * _2305;
                    float _2309 = _2305 * 0.5;
                    float _2311 = -_2307;
                    float _2313 = 0.0 + _2311;
                    float _2315 = fma(_2309, _2313, 0.5);
                    float _2317 = fma(_2307, _2315, _2307);
                    float _2319 = -_2317;
                    float _2321 = 0.0 + _2319;
                    float _2323 = fma(_2317, _2321, _2303);
                    float _2325 = fma(_2309, _2323, _2317);
                    float _2327 = _2325 * 2.3283064365386962890625e-10;
                    _2241 = as_type<int>(_2327);
                    _2229 = as_type<int>(_2317);
                    _2231 = as_type<int>(_2313);
                }
            }
        }
    }
    int _2329 = _2241;
    int _2331 = _2229;
    int _2333 = _2231;
    int _2335 = _2233;
    _2207 = _2329;
    _2208 = _2206;
    _2209 = 0;
    _2210 = _2331;
    _2211 = _2333;
    _2212 = _2335;
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
    float _120 = _90;
    float _122 = _88;
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
    float2 _1262;
    _1262.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    _1262.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_320, _322));
    float _324 = _1262.x;
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
    float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma(_348, -0.5, 0.5);
    float _362 = fma(_348, 0.5, 0.5);
    float _364 = -_358;
    float _366 = _364 + 1.0;
    float _368 = fma(_362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _370 = sqrt(_360);
    float _372 = fma(_362, _368, -0.212114393711090087890625);
    float _374 = _196 + 1.0;
    float _376 = fma(_362, _372, 1.570728778839111328125);
    float _378 = abs(_366);
    float _380 = log2(_378);
    float _382 = _370 * 0.636619746685028076171875;
    float _384 = -_376;
    float _386 = fma(_382, _384, 1.0);
    float _388 = _380 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _390 = exp2(_388);
    float _392 = -_196;
    float _394 = fma(_390, _374, _392);
    float _396 = fma(_394, 0.5, 0.5);
    float _398 = float(uint(_328));
    float _400 = _398 * 0.00390625;
    float2 _1373 = float2(_320, _322);
    float2 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1373, float2(0.0), isnan(_1373)), level(_400)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1373, float2(0.0), isnan(_1373)), level(_400)).xy;
    float _406 = _404.x;
    float _408 = _404.y;
    float2 _1388 = float2(_320, _322);
    float2 _410 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1388, float2(0.0), isnan(_1388)), level(_400)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1388, float2(0.0), isnan(_1388)), level(_400)).xy;
    float _412 = _410.x;
    float _414 = _410.y;
    float2 _1401 = float2(_320, _322);
    float4 _417 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1401, float2(0.0), isnan(_1401)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1401, float2(0.0), isnan(_1401)), level(_400)).xyzw;
    float _419 = _417.x;
    float _421 = _417.y;
    float _423 = _417.z;
    float _425 = _417.w;
    float2 _1418 = float2(_320, _322);
    float4 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1418, float2(0.0), isnan(_1418)), level(_400)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1418, float2(0.0), isnan(_1418)), level(_400)).xyzw;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _427.w;
    float2 _1435 = float2(_386, _396);
    float3 _439 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1435, float2(0.0), isnan(_1435))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1435, float2(0.0), isnan(_1435))).xyz;
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    float _447 = _92 * _96;
    float _449 = _380 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _451 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _453 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _455 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _457 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _459 = _96 * _451;
    float _461 = _96 * _453;
    float _463 = _96 * _455;
    float _465 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _467 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _459);
    float _469 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _461);
    float _471 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _473 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _463);
    float _475 = -_94;
    float _477 = fma(_475, _465, _467);
    float _479 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _481 = fma(_94, _465, _467);
    float _483 = -_94;
    float _485 = fma(_483, _471, _469);
    float _487 = fma(_94, _471, _469);
    float _489 = -_92;
    float _491 = fma(_489, _479, _477);
    float _493 = -_94;
    float _495 = fma(_493, _457, _473);
    float _497 = fma(_92, _479, _481);
    float _499 = fma(_94, _457, _473);
    float _501 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _503 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _505 = exp2(_449);
    float _507 = -_92;
    float _509 = fma(_507, _501, _485);
    float _511 = -_92;
    float _513 = fma(_511, _503, _495);
    float _515 = fma(_92, _503, _499);
    float _517 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _519 = fma(_92, _501, _487);
    float _521 = -_96;
    float _523 = _92 * _521;
    float _525 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _527 = fma(_517, _447, _497);
    float _529 = fma(_517, _523, _491);
    float _531 = fma(_525, _523, _509);
    float _533 = fma(_525, _447, _519);
    float _535 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _537 = -_94;
    float _539 = _96 * _537;
    float _541 = _92 * _92;
    float _543 = _92 * _94;
    float _545 = fma(_535, _523, _513);
    float _547 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _549 = fma(_535, _447, _515);
    float _551 = _96 * _94;
    float _553 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _555 = fma(_547, _539, _529);
    float _557 = _196 * (-10000.0);
    float _559 = fma(_547, _551, _527);
    float _561 = fma(_553, _539, _531);
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _565 = fma(_553, _551, _533);
    float _567 = abs(_557);
    bool _569 = _567 > 0.00999999977648258209228515625;
    float _571 = -_96;
    float _573 = fma(_571, _96, _541);
    float _575 = fma(_563, _539, _545);
    float _577 = -_505;
    float _579 = _577 + 1.0;
    float _581 = _569 ? _557 : 0.00999999977648258209228515625;
    float _583 = _581 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _585 = fma(_563, _551, _549);
    float _587 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _589 = _196 * _587;
    float _591 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _593 = precise::max(_583, -127.0);
    float _595 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].x, _589);
    float _597 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _599 = -_593;
    float _601 = exp2(_599);
    float _603 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].z, _595);
    float _605 = fma(_591, _543, _555);
    float _607 = fma(_591, _543, _559);
    float _609 = fma(_603, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _611 = -_597;
    float _613 = exp2(_611);
    float _615 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _617 = 1.0 / _593;
    float _619 = -_601;
    float _621 = _619 + 1.0;
    float _623 = abs(_615);
    float _625 = log2(_623);
    float _627 = _613 * _621;
    float _629 = _94 * (-3.0);
    float _631 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _633 = -_94;
    float _635 = fma(_633, _629, -1.0);
    float _637 = fma(_274, 3.0, -1.0);
    float _639 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _641 = fma(_631, _543, _565);
    float _643 = _627 * _617;
    float _645 = fma(_639, _543, _575);
    float _647 = fma(_639, _543, _585);
    float _649 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _651 = _625 * 1.5;
    float _653 = fma(_631, _543, _561);
    float _655 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _657 = exp2(_651);
    float _659 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _661 = fma(_649, _637, _607);
    float _663 = fma(_655, _635, _645);
    float _665 = fma(_649, _635, _605);
    float _667 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _669 = fma(_659, _635, _653);
    float _671 = fma(_659, _637, _641);
    float _673 = fma(_655, _637, _647);
    float _675 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _677 = fma(_667, _573, _665);
    float _679 = fma(_667, _573, _661);
    float _681 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _683 = fma(_675, _573, _671);
    float _685 = fma(_675, _573, _669);
    float _687 = _579 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _689 = _657 * 12.56637096405029296875;
    float _691 = fma(_681, _573, _663);
    float _693 = fma(_681, _573, _673);
    float _695 = -_687;
    float _697 = _695 + 1.0;
    float _699 = 1.0 / _689;
    float _701 = _687 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _703 = abs(_697);
    float _705 = log2(_703);
    float _707 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _709 = fma(_707, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _711 = _705 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _713 = _705 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _715 = _406 * _408;
    float _717 = -_408;
    float _719 = _717 + _414;
    float _721 = _425 * _425;
    float _723 = _435 * _435;
    float _725 = -_715;
    float _727 = fma(_412, _414, _725);
    float _729 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[0].x, _408);
    float _731 = _721 * _721;
    float _733 = _723 * _723;
    float _735 = fma(_727, (*spvDescriptorSet0.fp_c3)._m0[0].x, _715);
    float _737 = precise::max(_729, 1.52587890625e-05);
    float _739 = _731 * 16.0;
    float _741 = _709 * _699;
    float _743 = _729 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _745 = exp2(_711);
    float _747 = _408 * _739;
    float _749 = _733 * 16.0;
    float _751 = _419 * _747;
    float _753 = _421 * _747;
    float _755 = _423 * _747;
    float _757 = 1.0 / _737;
    float _759 = _414 * _749;
    float _761 = -_753;
    float _763 = fma(_431, _759, _761);
    float _765 = -_751;
    float _767 = fma(_429, _759, _765);
    float _769 = -_755;
    float _771 = fma(_433, _759, _769);
    float _773 = fma(_763, (*spvDescriptorSet0.fp_c3)._m0[0].x, _753);
    float _775 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[0].x, _751);
    float _777 = fma(_771, (*spvDescriptorSet0.fp_c3)._m0[0].x, _755);
    float _779 = _735 * _757;
    float _781 = _745 * _757;
    float _783 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _785 = _779 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _787 = _779 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _789 = _773 * _781;
    float _791 = _775 * _781;
    float _793 = _785 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _795 = _787 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _797 = exp2(_713);
    float _799 = _777 * _781;
    float _801 = _683 * _793;
    float _803 = _679 * _793;
    float _805 = _693 * _793;
    float _807 = _643 * _783;
    float _809 = fma(_685, _795, _801);
    float _811 = fma(_677, _795, _803);
    float _813 = fma(_691, _795, _805);
    float _815 = _809 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _817 = _811 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _819 = _813 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _821 = _797 * _815;
    float _823 = _797 * _817;
    float _825 = _797 * _819;
    float _827 = _821 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _829 = _823 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _831 = _825 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _833 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[27].y, _827);
    float _835 = fma(_791, (*spvDescriptorSet0.fp_c3)._m0[27].x, _829);
    float _837 = fma(_799, (*spvDescriptorSet0.fp_c3)._m0[27].z, _831);
    float _839 = fma(_443, _701, _833);
    float _841 = fma(_441, _701, _835);
    float _843 = fma(_445, _701, _837);
    float _845 = -_807;
    float _847 = exp2(_845);
    float _849 = _839 * 0.715200006961822509765625;
    float _851 = fma(_841, 0.2125999927520751953125, _849);
    float _853 = fma(_843, 0.072200000286102294921875, _851);
    float _855 = 1.0 / _853;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = _741 * _859;
    float _863 = _861 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _865 = _855 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _867 = precise::clamp(_865, 0.0, 1.0);
    float _869 = fma(_867, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _871 = _861 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _873 = _847 * _869;
    float _875 = _861 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _877 = fma(_841, _873, _863);
    float _879 = fma(_839, _873, _875);
    float _881 = fma(_843, _873, _871);
    out.m_40.x = _877;
    out.m_40.y = _879;
    out.m_40.z = _881;
    out.m_40.w = _743;
    out.m_42.x = _877;
    out.m_42.y = _879;
    out.m_42.z = _881;
    out.m_42.w = _743;
    return out;
}

