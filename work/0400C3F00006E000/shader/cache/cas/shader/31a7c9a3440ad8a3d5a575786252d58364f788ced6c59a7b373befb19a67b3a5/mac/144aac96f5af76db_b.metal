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
    texture2d<float> fp_t_tcb_14 [[id(3)]];
    sampler fp_t_tcb_14Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_12 [[id(13)]];
    sampler fp_t_tcb_12Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_14Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_ESmplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_12Smplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
    float4 m_48 [[color(1)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _56(thread const int& _2213, thread const int& _2214, thread const int& _2215, thread const int& _2216, thread int& _2217, thread int& _2218, thread int& _2219, thread int& _2220, thread int& _2221, thread int& _2222)
{
    float _2225 = as_type<float>(_2213) + 0.0;
    bool _2227 = _2225 != 0.0;
    bool _2229 = isnan(_2225);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    int _2237 = as_type<int>(_2225);
    int _2239 = _2214;
    int _2241 = _2215;
    int _2243 = _2235 ? (-1) : 0;
    if (!_2235)
    {
        float _2245 = as_type<float>(_2213) * 1.0;
        _2237 = as_type<int>(_2245);
    }
    int _2247 = _2237;
    bool _2249 = !_2235;
    int _2251 = _2247;
    if (!_2249)
    {
        float _2253 = as_type<float>(_2213) + 0.0;
        bool _2255 = _2253 >= 0.0;
        bool _2257 = isnan(_2253);
        bool _2259 = _2255 || _2257;
        bool _2261 = isnan(0.0);
        bool _2263 = _2259 || _2261;
        int _2265 = as_type<int>(_2253);
        _2243 = _2263 ? (-1) : 0;
        if (!_2263)
        {
            _2265 = 2147483647;
        }
        int _2267 = _2265;
        bool _2269 = !_2263;
        _2251 = _2267;
        if (!_2269)
        {
            float _2271 = abs(as_type<float>(_2213));
            float _2273 = _2271 + 0.0;
            bool _2275 = _2273 > as_type<float>(0x7f800000u /* inf */);
            bool _2277 = isnan(_2273);
            bool _2279 = _2275 || _2277;
            bool _2281 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2283 = _2279 || _2281;
            int _2285 = as_type<int>(_2273);
            _2243 = _2283 ? (-1) : 0;
            if (_2283)
            {
                float _2287 = as_type<float>(_2213) + 1.0;
                _2285 = as_type<int>(_2287);
            }
            int _2289 = _2285;
            _2251 = _2289;
            if (!_2283)
            {
                float _2291 = abs(as_type<float>(_2213));
                float _2293 = _2291 + (-0.0);
                float _2295 = 0.0 + _2293;
                bool _2297 = _2295 != as_type<float>(0x7f800000u /* inf */);
                bool _2299 = isnan(_2295);
                bool _2301 = _2297 || _2299;
                bool _2303 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _2305 = _2301 || _2303;
                int _2307 = as_type<int>(_2295);
                _2243 = _2305 ? (-1) : 0;
                if (!_2305)
                {
                    _2307 = _2213;
                }
                int _2309 = _2307;
                bool _2311 = !_2305;
                _2251 = _2309;
                if (!_2311)
                {
                    float _2313 = as_type<float>(_2213) * 18446744073709551616.0;
                    float _2315 = rsqrt(_2313);
                    float _2317 = _2313 * _2315;
                    float _2319 = _2315 * 0.5;
                    float _2321 = -_2317;
                    float _2323 = 0.0 + _2321;
                    float _2325 = fma(_2319, _2323, 0.5);
                    float _2327 = fma(_2317, _2325, _2317);
                    float _2329 = -_2327;
                    float _2331 = 0.0 + _2329;
                    float _2333 = fma(_2327, _2331, _2313);
                    float _2335 = fma(_2319, _2333, _2327);
                    float _2337 = _2335 * 2.3283064365386962890625e-10;
                    _2251 = as_type<int>(_2337);
                    _2239 = as_type<int>(_2327);
                    _2241 = as_type<int>(_2323);
                }
            }
        }
    }
    int _2339 = _2251;
    int _2341 = _2239;
    int _2343 = _2241;
    int _2345 = _2243;
    _2217 = _2339;
    _2218 = _2216;
    _2219 = 0;
    _2220 = _2341;
    _2221 = _2343;
    _2222 = _2345;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _254 = false;
    float _60 = gl_FragCoord.w;
    float _62 = in.m_43.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_43.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_43.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _82 = precise::max(0.0, _80);
    float _84 = 1.0 / _60;
    float _86 = _84 * _66;
    float _88 = _84 * _72;
    float _90 = _84 * _78;
    float _92 = _86 * _86;
    float _94 = fma(_88, _88, _92);
    float _96 = fma(_90, _90, _94);
    float _98 = rsqrt(_96);
    float _100 = _88 * _98;
    float _102 = _90 * _98;
    float _104 = _86 * _98;
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _110 = -_104;
    float _112 = -_82;
    float _114 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[13].z, _112);
    float _116 = _106 * _106;
    float _118 = _108 * _108;
    float _120 = _116 + _118;
    float _122 = sqrt(_120);
    bool _126 = _122 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _128 = _98;
    float _130 = _82;
    float _132 = _114;
    float _134 = _106;
    float _136 = _108;
    if (!_126)
    {
        _128 = _118;
    }
    float _138 = _128;
    float _140 = _138;
    if (!_126)
    {
        _130 = _116;
    }
    float _142 = _130;
    bool _144 = !_126;
    float _146 = _142;
    if (!_144)
    {
        float _148 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _150 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _152 = _122 + _150;
        float _154 = _114 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _156 = rsqrt(_120);
        float _158 = _152 * _148;
        float _160 = _158 * 0.15915493667125701904296875;
        float _162 = _160 * 6.283185482025146484375;
        float _164 = sin(_162);
        float _166 = _160 * 6.283185482025146484375;
        float _168 = cos(_166);
        float _170 = fma(_164, _154, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _172 = _156 * _170;
        float _174 = _168 + (-1.0);
        float _176 = _106 * _172;
        float _178 = _108 * _172;
        float _180 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _182 = _178 * _178;
        float _184 = fma(_114, _168, _180);
        float _186 = _176 * _176;
        _132 = _184;
        _146 = _186;
        _140 = _182;
        _134 = _176;
        _136 = _178;
    }
    float _188 = _132;
    float _190 = _146;
    float _192 = _140;
    float _194 = _134;
    float _196 = _136;
    float _198 = fma(_188, _188, _190);
    float _200 = _198 + _192;
    float _202 = rsqrt(_200);
    float _204 = _202 * _188;
    float _206 = _202 * _194;
    float _208 = _202 * _196;
    float _210 = -_204;
    float _212 = precise::max(0.0, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = fma(_212, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _222 = as_type<int>(_218) + (-218103808);
    float _224 = fma(_212, _220, -0.212114393711090087890625);
    bool _226 = uint(_222) >= 1920991232u;
    float _228 = fma(_212, _224, 1.570728778839111328125);
    bool _230 = !_226;
    float _252;
    if (!_230)
    {
        int _232 = as_type<int>(_218);
        int _234 = 0;
        int _236 = 0;
        int _238 = 1136;
        int _240;
        int _242;
        int _244;
        int _246;
        int _248;
        int _250;
        _56(_232, _234, _236, _238, _240, _242, _244, _246, _248, _250);
        _252 = as_type<float>(_240);
        _254 = true;
    }
    else
    {
        float _256 = rsqrt(_218);
        float _258 = _218 * _256;
        float _260 = _256 * 0.5;
        float _262 = -_258;
        float _264 = 0.0 + _262;
        float _266 = fma(_260, _264, 0.5);
        float _268 = fma(_258, _266, _258);
        float _270 = -_268;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, _218);
        float _276 = fma(_260, _274, _268);
        _252 = _276;
    }
    _254 = false;
    float _278 = _252;
    bool _280 = _204 > 0.0;
    float _282 = _102 * _102;
    float _284 = _100 * _100;
    float _286 = _282 + _284;
    if (_280)
    {
        discard_fragment();
    }
    float _288 = rsqrt(_286);
    float _290 = _228 * _278;
    float _292 = _290 * 0.636619746685028076171875;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = -_294;
    float _298 = _296 + 1.0;
    float _300 = _102 * _288;
    float _302 = _100 * _288;
    if (_280)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        out.m_48.x = 0.0;
        out.m_48.y = 0.0;
        out.m_48.z = 0.0;
        out.m_48.w = 0.0;
        return out;
    }
    float _304 = abs(_300);
    float _306 = abs(_302);
    float _308 = precise::max(_304, _306);
    float _310 = in.m_50.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_50.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = sqrt(_298);
    float _324 = precise::max(_308, 9.9999997473787516355514526367188e-05);
    float _326 = 1.0 / _324;
    float _328 = -_322;
    float _330 = _328 + 1.0;
    float _332 = _330 * 0.5;
    float _334 = -_326;
    float _336 = _300 * _334;
    float _338 = _302 * _326;
    float _340 = fma(_336, _332, 0.5);
    float _342 = fma(_338, _332, 0.5);
    float _344 = _84 * _314;
    float _346 = _84 * _320;
    float2 _1290;
    _1290.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    _1290.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_340, _342));
    float _348 = _1290.x;
    float _350 = _348 * 256.0;
    int _352 = int(_350);
    float2 _1300 = float2(_344, _346);
    float2 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1300, float2(0.0), isnan(_1300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1300, float2(0.0), isnan(_1300))).xy;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = -_104;
    float _364 = _362 + 1.0;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _206 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _370 = _104 * _102;
    float _372 = -_368;
    float _374 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[11].y, _372);
    float _376 = abs(_366);
    float _378 = log2(_376);
    float _380 = fma(_282, 3.0, -1.0);
    float _382 = -_208;
    float _384 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
    float _386 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _388 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _390 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _392 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _394 = fma(_384, 0.5, 0.5);
    float _396 = _104 * _390;
    float _398 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].z, _396);
    float _400 = _378 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _402 = _104 * _388;
    float _404 = _104 * _386;
    float _406 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].y, _402);
    float _408 = exp2(_400);
    float _410 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _412 = fma(0.88622701168060302734375, (*spvDescriptorSet0.fp_c3)._m0[4].x, _404);
    float _414 = -_102;
    float _416 = fma(_414, _392, _406);
    float _418 = fma(_102, _392, _406);
    float _420 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _422 = -_102;
    float _424 = fma(_422, _410, _412);
    float _426 = fma(_102, _410, _412);
    float _428 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _430 = -_100;
    float _432 = fma(_430, _420, _416);
    float _434 = fma(_100, _420, _418);
    float _436 = _100 * _104;
    float _438 = -_102;
    float _440 = fma(_438, _428, _398);
    float _442 = fma(_102, _428, _398);
    float _444 = _408 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _446 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _452 = -_100;
    float _454 = fma(_452, _450, _424);
    float _456 = fma(_100, _450, _426);
    float _458 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _460 = -_104;
    float _462 = _100 * _460;
    float _464 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _466 = fma(_100, _458, _442);
    float _468 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _470 = -_100;
    float _472 = fma(_470, _458, _440);
    float _474 = fma(_464, _462, _454);
    float _476 = fma(_464, _436, _456);
    float _478 = fma(_384, -0.5, 0.5);
    float _480 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _482 = fma(_468, _462, _432);
    float _484 = fma(_468, _436, _434);
    float _486 = -_448;
    float _488 = _486 + 1.0;
    float _490 = fma(_480, _462, _472);
    float _492 = sqrt(_478);
    float _494 = fma(_480, _436, _466);
    float _496 = -_102;
    float _498 = _104 * _496;
    float _500 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _502 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _504 = fma(_500, _498, _474);
    float _506 = abs(_488);
    float _508 = log2(_506);
    float _510 = fma(_500, _370, _476);
    float _512 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _514 = fma(_502, _498, _482);
    float _516 = fma(_394, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _518 = fma(_502, _370, _484);
    float _520 = fma(_512, _498, _490);
    float _522 = fma(_512, _370, _494);
    float _524 = _492 * 0.636619746685028076171875;
    float _526 = fma(_394, _516, -0.212114393711090087890625);
    float _528 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _530 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _532 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _534 = fma(_394, _526, 1.570728778839111328125);
    float _536 = _102 * (-3.0);
    float _538 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _540 = _508 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _542 = -_534;
    float _544 = fma(_524, _542, 1.0);
    float _546 = -_102;
    float _548 = fma(_546, _536, -1.0);
    float _550 = _100 * _102;
    float _552 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _554 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _556 = exp2(_540);
    float _558 = fma(_532, _550, _520);
    float _560 = fma(_532, _550, _522);
    float _562 = _204 + 1.0;
    float _564 = fma(_528, _550, _504);
    float _566 = fma(_530, _550, _514);
    float _568 = fma(_528, _550, _510);
    float _570 = fma(_530, _550, _518);
    float _572 = fma(_538, _548, _564);
    float _574 = fma(_552, _548, _566);
    float _576 = fma(_538, _380, _568);
    float _578 = fma(_554, _548, _558);
    float _580 = -_204;
    float _582 = fma(_556, _562, _580);
    float _584 = fma(_582, 0.5, 0.5);
    float _586 = float(uint(_352));
    float _588 = fma(_358, 2.0, -1.0);
    float _590 = fma(_360, 2.0, -1.0);
    float _592 = _586 * 0.00390625;
    float _594 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[22].x, _344);
    float _596 = fma(_590, (*spvDescriptorSet0.fp_c3)._m0[22].y, _346);
    float2 _1703 = float2(_340, _342);
    float2 _598 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1703, float2(0.0), isnan(_1703)), level(_592)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1703, float2(0.0), isnan(_1703)), level(_592)).xy;
    float _600 = _598.x;
    float _602 = _598.y;
    float2 _1716 = float2(_340, _342);
    float2 _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1716, float2(0.0), isnan(_1716)), level(_592)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1716, float2(0.0), isnan(_1716)), level(_592)).xy;
    float _606 = _604.x;
    float _608 = _604.y;
    float2 _1729 = float2(_340, _342);
    float4 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1729, float2(0.0), isnan(_1729)), level(_592)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1729, float2(0.0), isnan(_1729)), level(_592)).xyzw;
    float _613 = _611.x;
    float _615 = _611.y;
    float _617 = _611.z;
    float _619 = _611.w;
    float2 _1746 = float2(_340, _342);
    float4 _621 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1746, float2(0.0), isnan(_1746)), level(_592)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1746, float2(0.0), isnan(_1746)), level(_592)).xyzw;
    float _623 = _621.x;
    float _625 = _621.y;
    float _627 = _621.z;
    float _629 = _621.w;
    float2 _1763 = float2(_344, _346);
    float3 _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1763, float2(0.0), isnan(_1763))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1763, float2(0.0), isnan(_1763))).xyz;
    float _635 = _633.x;
    float _637 = _633.y;
    float _639 = _633.z;
    float2 _1777 = float2(_544, _584);
    float3 _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1777, float2(0.0), isnan(_1777))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1777, float2(0.0), isnan(_1777))).xyz;
    float _643 = _641.x;
    float _645 = _641.y;
    float _647 = _641.z;
    float2 _1791 = float2(_594, _596);
    float4 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1791, float2(0.0), isnan(_1791))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1791, float2(0.0), isnan(_1791))).xyzw;
    float _651 = _649.x;
    float _653 = _649.y;
    float _655 = _649.z;
    float _657 = _649.w;
    float _659 = fma(_552, _380, _570);
    float _661 = fma(_554, _380, _560);
    float _663 = _100 * _100;
    float _665 = _508 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _667 = -_104;
    float _669 = fma(_667, _104, _663);
    float _671 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _673 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _675 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _677 = fma(_671, _669, _572);
    float _679 = fma(_671, _669, _576);
    float _681 = fma(_673, _669, _574);
    float _683 = fma(_673, _669, _659);
    float _685 = fma(_675, _669, _578);
    float _687 = fma(_675, _669, _661);
    float _689 = exp2(_665);
    float _691 = -_689;
    float _693 = _691 + 1.0;
    float _695 = _693 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _697 = -_602;
    float _699 = _697 + _608;
    float _701 = _600 * _602;
    float _703 = -_695;
    float _705 = _703 + 1.0;
    float _707 = fma(_699, (*spvDescriptorSet0.fp_c3)._m0[0].x, _602);
    float _709 = -_701;
    float _711 = fma(_606, _608, _709);
    float _713 = _619 * _619;
    float _715 = abs(_705);
    float _717 = log2(_715);
    float _719 = precise::max(_707, 1.52587890625e-05);
    float _721 = fma(_711, (*spvDescriptorSet0.fp_c3)._m0[0].x, _701);
    float _723 = _713 * _713;
    float _725 = _723 * 16.0;
    float _727 = 1.0 / _719;
    float _729 = _629 * _629;
    float _731 = _602 * _725;
    float _733 = _729 * _729;
    float _735 = _717 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _737 = _733 * 16.0;
    float _739 = _717 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _741 = _635 * _637;
    float _743 = _608 * _737;
    float _745 = exp2(_735);
    float _747 = _741 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _749 = _721 * _727;
    float _751 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _753 = _749 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _755 = exp2(_739);
    float _757 = _751 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _759 = _753 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _761 = _683 * _757;
    float _763 = _679 * _757;
    float _765 = _687 * _757;
    float _767 = _615 * _731;
    float _769 = fma(_681, _759, _761);
    float _771 = fma(_677, _759, _763);
    float _773 = fma(_685, _759, _765);
    float _775 = _613 * _731;
    float _777 = _769 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _779 = _771 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _781 = _773 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _783 = _617 * _731;
    float _785 = _777 * 0.715200006961822509765625;
    float _787 = -_767;
    float _789 = fma(_625, _743, _787);
    float _791 = -_775;
    float _793 = fma(_623, _743, _791);
    float _795 = _745 * _727;
    float _797 = fma(_779, 0.2125999927520751953125, _785);
    float _799 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[0].x, _767);
    float _801 = -_783;
    float _803 = fma(_627, _743, _801);
    float _805 = fma(_793, (*spvDescriptorSet0.fp_c3)._m0[0].x, _775);
    float _807 = fma(_781, 0.072200000286102294921875, _797);
    float _809 = _799 * _795;
    float _811 = fma(_803, (*spvDescriptorSet0.fp_c3)._m0[0].x, _783);
    float _813 = _805 * _795;
    float _815 = -_777;
    float _817 = _815 + _807;
    float _819 = _695 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _821 = _811 * _795;
    float _823 = fma(_747, _817, _777);
    float _825 = -_779;
    float _827 = _825 + _807;
    float _829 = -_781;
    float _831 = _829 + _807;
    float _833 = _755 * _823;
    float _835 = fma(_747, _827, _779);
    float _837 = fma(_747, _831, _781);
    float _839 = -_639;
    float _841 = _839 + 1.0;
    float _843 = _833 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _845 = _755 * _835;
    float _847 = _755 * _837;
    float _849 = fma(_809, (*spvDescriptorSet0.fp_c3)._m0[27].y, _843);
    float _851 = _845 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _853 = _847 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _855 = fma(_645, _819, _849);
    float _857 = fma(_813, (*spvDescriptorSet0.fp_c3)._m0[27].x, _851);
    float _859 = fma(_821, (*spvDescriptorSet0.fp_c3)._m0[27].z, _853);
    float _861 = fma(_643, _819, _857);
    float _863 = _855 * 0.715200006961822509765625;
    float _865 = fma(_647, _819, _859);
    float _867 = fma(_861, 0.2125999927520751953125, _863);
    float _869 = fma(_865, 0.072200000286102294921875, _867);
    float _871 = 1.0 / _869;
    float _873 = _871 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _875 = precise::clamp(_873, 0.0, 1.0);
    float _877 = fma(_875, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _879 = _707 * _841;
    float _881 = _877 * _657;
    float _883 = _879 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _885 = fma(_861, _881, _651);
    float _887 = fma(_855, _881, _653);
    float _889 = fma(_865, _881, _655);
    out.m_46.x = _885;
    out.m_46.y = _887;
    out.m_46.z = _889;
    out.m_46.w = _883;
    out.m_48.x = _885;
    out.m_48.y = _887;
    out.m_48.z = _889;
    out.m_48.w = _883;
    return out;
}

