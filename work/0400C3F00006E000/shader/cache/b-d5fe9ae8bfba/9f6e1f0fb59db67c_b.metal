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
    constant _16* fp_c24 [[id(0)]];
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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _1939 = float2(_67, _69);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1939, float2(0.0), isnan(_1939))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1939, float2(0.0), isnan(_1939))).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = in.m_35.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_37.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_35.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_39.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_39.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_39.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_41.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_37.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_35.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _65 * _83;
    float _165 = _65 * _89;
    float _167 = _65 * _95;
    float _169 = _65 * _101;
    float _171 = _65 * _107;
    float _173 = _65 * _113;
    float _175 = _65 * _119;
    float _177 = _65 * _125;
    float _179 = _65 * _131;
    float _181 = _65 * _137;
    float _183 = _65 * _143;
    float _185 = _65 * _149;
    float _187 = _65 * _155;
    float _189 = _65 * _161;
    bool _193 = _77 > 0.0;
    int _196 = as_type<int>(_65);
    int _198 = as_type<int>(_155);
    float _200 = _137;
    float _202 = _119;
    float _204 = _169;
    float _206 = _169;
    int _208 = as_type<int>(_165);
    int _210 = as_type<int>(_183);
    float _212 = _189;
    float _214 = _189;
    float _216 = _167;
    float _218 = _167;
    if (!_193)
    {
        _196 = 0;
        _198 = 0;
    }
    int _220 = _196;
    int _222 = _198;
    float _224 = 0.0;
    int _226 = _220;
    int _228 = _222;
    if (!_193)
    {
        _224 = _75;
    }
    float _230 = _224;
    bool _232 = !_193;
    float _234 = _230;
    if (!_232)
    {
        bool _236 = _75 > 0.0;
        float _238 = 0.0;
        if (!_236)
        {
            _238 = 0.0;
        }
        float _240 = _238;
        float _242 = _240;
        if (!_236)
        {
            _200 = 0.0;
        }
        float _244 = _200;
        bool _246 = !_236;
        float _248 = _244;
        if (!_246)
        {
            float _250 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _252 = _67 + _250;
            float _254 = _69 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
            float2 _2163 = float2(_252, _254);
            float2 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2163, float2(0.0), isnan(_2163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2163, float2(0.0), isnan(_2163)), level(0.0)).xy;
            float _258 = _256.x;
            float _260 = _256.y;
            float _262 = _258 + _260;
            float _264 = _262 * 0.5;
            bool _266 = _264 > 0.89999997615814208984375;
            bool _268 = !_266;
            float _270 = _260;
            float _272 = 0.0;
            float _274 = _264;
            if (!_268)
            {
                float _276 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _278 = _252 + _276;
                float _280 = _254 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                float2 _2201 = float2(_278, _280);
                float2 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2201, float2(0.0), isnan(_2201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2201, float2(0.0), isnan(_2201)), level(0.0)).xy;
                float _284 = _282.x;
                float _286 = _282.y;
                float _288 = _286 + _284;
                float _290 = _288 * 0.5;
                bool _292 = _290 > 0.89999997615814208984375;
                bool _294 = !_292;
                _270 = _286;
                _272 = 1.0;
                _274 = _290;
                if (!_294)
                {
                    float _296 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _298 = _278 + _296;
                    float _300 = _280 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float2 _2237 = float2(_298, _300);
                    float2 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2237, float2(0.0), isnan(_2237)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2237, float2(0.0), isnan(_2237)), level(0.0)).xy;
                    float _304 = _302.x;
                    float _306 = _302.y;
                    float _308 = _306 + _304;
                    float _310 = _308 * 0.5;
                    bool _312 = _310 > 0.89999997615814208984375;
                    bool _314 = !_312;
                    _270 = _306;
                    _272 = 2.0;
                    _274 = _310;
                    if (!_314)
                    {
                        float _316 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _318 = _298 + _316;
                        float _320 = _300 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float2 _2274 = float2(_318, _320);
                        float2 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2274, float2(0.0), isnan(_2274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2274, float2(0.0), isnan(_2274)), level(0.0)).xy;
                        float _324 = _322.x;
                        float _326 = _322.y;
                        float _328 = _326 + _324;
                        float _330 = _328 * 0.5;
                        bool _332 = _330 > 0.89999997615814208984375;
                        bool _334 = !_332;
                        _270 = _326;
                        _272 = 3.0;
                        _274 = _330;
                        if (!_334)
                        {
                            float _336 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _338 = _318 + _336;
                            float _340 = _320 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float2 _2311 = float2(_338, _340);
                            float2 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2311, float2(0.0), isnan(_2311)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2311, float2(0.0), isnan(_2311)), level(0.0)).xy;
                            float _344 = _342.x;
                            float _346 = _342.y;
                            float _348 = _346 + _344;
                            float _350 = _348 * 0.5;
                            bool _352 = _350 > 0.89999997615814208984375;
                            bool _354 = !_352;
                            _270 = _346;
                            _272 = 4.0;
                            _274 = _350;
                            if (!_354)
                            {
                                float _356 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _358 = _338 + _356;
                                float _360 = _340 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float2 _2348 = float2(_358, _360);
                                float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2348, float2(0.0), isnan(_2348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2348, float2(0.0), isnan(_2348)), level(0.0)).xy;
                                float _364 = _362.x;
                                float _366 = _362.y;
                                float _368 = _366 + _364;
                                float _370 = _368 * 0.5;
                                bool _372 = _370 > 0.89999997615814208984375;
                                bool _374 = !_372;
                                _270 = _366;
                                _272 = 5.0;
                                _274 = _370;
                                if (!_374)
                                {
                                    float _376 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _378 = _358 + _376;
                                    float _380 = _360 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float2 _2385 = float2(_378, _380);
                                    float2 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2385, float2(0.0), isnan(_2385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2385, float2(0.0), isnan(_2385)), level(0.0)).xy;
                                    float _384 = _382.x;
                                    float _386 = _382.y;
                                    float _388 = _386 + _384;
                                    float _390 = _388 * 0.5;
                                    bool _392 = _390 > 0.89999997615814208984375;
                                    bool _394 = !_392;
                                    _270 = _386;
                                    _272 = 6.0;
                                    _274 = _390;
                                    if (!_394)
                                    {
                                        float _396 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                        float _398 = _378 + _396;
                                        float _400 = _380 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                        float2 _2422 = float2(_398, _400);
                                        float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2422, float2(0.0), isnan(_2422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2422, float2(0.0), isnan(_2422)), level(0.0)).xy;
                                        float _404 = _402.x;
                                        float _406 = _402.y;
                                        float _408 = _406 + _404;
                                        float _410 = _408 * 0.5;
                                        _270 = _406;
                                        _272 = 7.0;
                                        _274 = _410;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _412 = _270;
            float _414 = _272;
            float _416 = _274;
            bool _418 = _412 > 0.89999997615814208984375;
            float _420 = float(_418);
            float _422 = _420 + _414;
            _242 = _422;
            _248 = _416;
        }
        float _424 = _242;
        float _426 = _248;
        float _428 = _67 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
        float _430 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
        float _432 = _69 + _430;
        float2 _2474 = float2(_428, _432);
        float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2474, float2(0.0), isnan(_2474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2474, float2(0.0), isnan(_2474)), level(0.0)).xy;
        float _436 = _434.x;
        float _438 = _434.y;
        float _440 = _436 + _438;
        float _442 = _440 * 0.5;
        bool _444 = _442 > 0.89999997615814208984375;
        bool _446 = !_444;
        float _448 = 0.0;
        float _450 = _442;
        float _452 = _424;
        float _454 = _432;
        if (!_446)
        {
            float _456 = _428 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _458 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
            float _460 = _432 + _458;
            float2 _2511 = float2(_456, _460);
            float2 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2511, float2(0.0), isnan(_2511)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2511, float2(0.0), isnan(_2511)), level(0.0)).xy;
            float _464 = _462.x;
            float _466 = _462.y;
            float _468 = _466 + _464;
            float _470 = _468 * 0.5;
            bool _472 = _470 > 0.89999997615814208984375;
            bool _474 = !_472;
            _448 = 1.0;
            _450 = _470;
            if (!_474)
            {
                float _476 = _456 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _478 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                float _480 = _460 + _478;
                float2 _2546 = float2(_476, _480);
                float2 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2546, float2(0.0), isnan(_2546)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2546, float2(0.0), isnan(_2546)), level(0.0)).xy;
                float _484 = _482.x;
                float _486 = _482.y;
                float _488 = _486 + _484;
                float _490 = _488 * 0.5;
                bool _492 = _490 > 0.89999997615814208984375;
                bool _494 = !_492;
                _448 = 2.0;
                _450 = _490;
                if (!_494)
                {
                    float _496 = _476 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _498 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float _500 = _480 + _498;
                    float2 _2581 = float2(_496, _500);
                    float2 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2581, float2(0.0), isnan(_2581)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2581, float2(0.0), isnan(_2581)), level(0.0)).xy;
                    float _504 = _502.x;
                    float _506 = _502.y;
                    float _508 = _506 + _504;
                    float _510 = _508 * 0.5;
                    bool _512 = _510 > 0.89999997615814208984375;
                    bool _514 = !_512;
                    _448 = 3.0;
                    _450 = _510;
                    if (!_514)
                    {
                        float _516 = _496 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _518 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float _520 = _500 + _518;
                        float2 _2616 = float2(_516, _520);
                        float2 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2616, float2(0.0), isnan(_2616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2616, float2(0.0), isnan(_2616)), level(0.0)).xy;
                        float _524 = _522.x;
                        float _526 = _522.y;
                        float _528 = _526 + _524;
                        float _530 = _528 * 0.5;
                        bool _532 = _530 > 0.89999997615814208984375;
                        bool _534 = !_532;
                        _448 = 4.0;
                        _450 = _530;
                        if (!_534)
                        {
                            float _536 = _516 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _538 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float _540 = _520 + _538;
                            float2 _2651 = float2(_536, _540);
                            float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2651, float2(0.0), isnan(_2651)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2651, float2(0.0), isnan(_2651)), level(0.0)).xy;
                            float _544 = _542.x;
                            float _546 = _542.y;
                            float _548 = _546 + _544;
                            float _550 = _548 * 0.5;
                            bool _552 = _550 > 0.89999997615814208984375;
                            bool _554 = !_552;
                            _448 = 5.0;
                            _450 = _550;
                            if (!_554)
                            {
                                float _556 = _536 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _558 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float _560 = _540 + _558;
                                float2 _2686 = float2(_556, _560);
                                float2 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2686, float2(0.0), isnan(_2686)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2686, float2(0.0), isnan(_2686)), level(0.0)).xy;
                                float _564 = _562.x;
                                float _566 = _562.y;
                                float _568 = _566 + _564;
                                float _570 = _568 * 0.5;
                                bool _572 = _570 > 0.89999997615814208984375;
                                bool _574 = !_572;
                                _448 = 6.0;
                                _450 = _570;
                                if (!_574)
                                {
                                    float _576 = _556 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _578 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float _580 = _560 + _578;
                                    float2 _2721 = float2(_576, _580);
                                    float2 _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2721, float2(0.0), isnan(_2721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2721, float2(0.0), isnan(_2721)), level(0.0)).xy;
                                    float _584 = _582.x;
                                    float _586 = _582.y;
                                    float _588 = _586 + _584;
                                    float _590 = _588 * 0.5;
                                    _448 = 7.0;
                                    _450 = _590;
                                }
                            }
                        }
                    }
                }
            }
        }
        float _592 = _448;
        float _594 = _450;
        float _596 = fma((*spvDescriptorSet0.fp_c24)._m0[0].x, 0.25, _67);
        float _598 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
        float _600 = _596 + _598;
        float2 _2760 = float2(_600, _432);
        float2 _602 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2760, float2(0.0), isnan(_2760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2760, float2(0.0), isnan(_2760)), level(0.0)).xy;
        float _604 = _602.x;
        float _606 = _602.y;
        float _608 = _592 + _424;
        bool _610 = _608 > 2.0;
        float _612 = _608;
        float _614 = _600;
        if (!_610)
        {
            _202 = 0.0;
            _612 = 0.0;
        }
        float _616 = _202;
        float _618 = _612;
        bool _620 = !_610;
        float _622 = _616;
        float _624 = _618;
        float _626 = _606;
        if (!_620)
        {
            float _628 = -_424;
            float _630 = _628 + 0.25;
            float _632 = fma(_424, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float _634 = -_592;
            float _636 = _634 + (-0.25);
            float _638 = fma(_630, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _640 = fma(_592, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _642 = fma(_636, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float2 _2822 = float2(_638, _632);
            float2 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2822, float2(0.0), isnan(_2822)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2822, float2(0.0), isnan(_2822)), level(0.0), int2(-1, 0)).xy;
            float _646 = _644.x;
            float _648 = _644.y;
            float2 _2837 = float2(_640, _642);
            float2 _650 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2837, float2(0.0), isnan(_2837)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2837, float2(0.0), isnan(_2837)), level(0.0), int2(1, 0)).xy;
            float _652 = _650.x;
            float _654 = _650.y;
            bool _656 = _426 >= 0.89999997615814208984375;
            bool _658 = isnan(_426);
            bool _660 = _656 || _658;
            bool _662 = isnan(0.89999997615814208984375);
            bool _664 = _660 || _662;
            bool _666 = _594 >= 0.89999997615814208984375;
            bool _668 = isnan(_594);
            bool _670 = _666 || _668;
            bool _672 = isnan(0.89999997615814208984375);
            bool _674 = _670 || _672;
            float _676 = fma(_646, 5.0, -3.75);
            float _678 = rint(_648);
            float _680 = abs(_676);
            float _682 = _646 * _680;
            float _684 = fma(_652, 5.0, -3.75);
            float _686 = abs(_684);
            float _688 = _652 * _686;
            float _690 = rint(_682);
            float _692 = rint(_654);
            float _694 = rint(_688);
            float _696 = fma(_678, 2.0, _690);
            bool _698 = !_664;
            float _700 = _698 ? _696 : 0.0;
            float _702 = fma(_700, 20.0, _424);
            float _704 = fma(_702, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _706 = fma(_692, 2.0, _694);
            float _708 = _704 + 0.5;
            bool _710 = !_674;
            float _712 = _710 ? _706 : 0.0;
            float _714 = fma(_712, 20.0, _592);
            float _716 = fma(_714, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float2 _2928 = float2(_708, _716);
            float2 _718 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2928, float2(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2928, float2(0.0), isnan(_2928)), level(0.0)).xy;
            float _720 = _718.x;
            float _722 = _718.y;
            _622 = _722;
            _624 = _720;
        }
        float _724 = _622;
        float _726 = _624;
        float _728 = fma(_604, 5.0, -3.75);
        float _730 = rint(_606);
        float _732 = abs(_728);
        float _734 = _604 * _732;
        float _736 = rint(_734);
        float _738 = _736 + _730;
        float _740 = _738 * 0.5;
        bool _742 = _740 > 0.89999997615814208984375;
        bool _744 = !_742;
        float _746 = 0.0;
        float _748 = _740;
        float _750 = _726;
        float _752 = _724;
        if (!_744)
        {
            float _754 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _756 = _600 + _754;
            float _758 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
            float _760 = _432 + _758;
            float2 _2983 = float2(_756, _760);
            float2 _762 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2983, float2(0.0), isnan(_2983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2983, float2(0.0), isnan(_2983)), level(0.0)).xy;
            float _764 = _762.x;
            float _766 = _762.y;
            float _768 = fma(_764, 5.0, -3.75);
            float _770 = rint(_766);
            float _772 = abs(_768);
            float _774 = _764 * _772;
            float _776 = rint(_774);
            float _778 = _776 + _770;
            float _780 = _778 * 0.5;
            bool _782 = _780 > 0.89999997615814208984375;
            bool _784 = !_782;
            _626 = _766;
            _746 = 1.0;
            _614 = _756;
            _454 = _760;
            _748 = _780;
            if (!_784)
            {
                float _786 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _788 = _756 + _786;
                float _790 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                float _792 = _760 + _790;
                float2 _3034 = float2(_788, _792);
                float2 _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3034, float2(0.0), isnan(_3034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3034, float2(0.0), isnan(_3034)), level(0.0)).xy;
                float _796 = _794.x;
                float _798 = _794.y;
                float _800 = fma(_796, 5.0, -3.75);
                float _802 = rint(_798);
                float _804 = abs(_800);
                float _806 = _796 * _804;
                float _808 = rint(_806);
                float _810 = _808 + _802;
                float _812 = _810 * 0.5;
                bool _814 = _812 > 0.89999997615814208984375;
                bool _816 = !_814;
                _626 = _798;
                _746 = 2.0;
                _614 = _788;
                _454 = _792;
                _748 = _812;
                if (!_816)
                {
                    float _818 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _820 = _788 + _818;
                    float _822 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float _824 = _792 + _822;
                    float2 _3085 = float2(_820, _824);
                    float2 _826 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3085, float2(0.0), isnan(_3085)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3085, float2(0.0), isnan(_3085)), level(0.0)).xy;
                    float _828 = _826.x;
                    float _830 = _826.y;
                    float _832 = fma(_828, 5.0, -3.75);
                    float _834 = rint(_830);
                    float _836 = abs(_832);
                    float _838 = _828 * _836;
                    float _840 = rint(_838);
                    float _842 = _840 + _834;
                    float _844 = _842 * 0.5;
                    bool _846 = _844 > 0.89999997615814208984375;
                    bool _848 = !_846;
                    _626 = _830;
                    _746 = 3.0;
                    _614 = _820;
                    _454 = _824;
                    _748 = _844;
                    if (!_848)
                    {
                        float _850 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _852 = _820 + _850;
                        float _854 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float _856 = _824 + _854;
                        float2 _3136 = float2(_852, _856);
                        float2 _858 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3136, float2(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3136, float2(0.0), isnan(_3136)), level(0.0)).xy;
                        float _860 = _858.x;
                        float _862 = _858.y;
                        float _864 = fma(_860, 5.0, -3.75);
                        float _866 = rint(_862);
                        float _868 = abs(_864);
                        float _870 = _860 * _868;
                        float _872 = rint(_870);
                        float _874 = _872 + _866;
                        float _876 = _874 * 0.5;
                        bool _878 = _876 > 0.89999997615814208984375;
                        bool _880 = !_878;
                        _626 = _862;
                        _746 = 4.0;
                        _614 = _852;
                        _454 = _856;
                        _748 = _876;
                        if (!_880)
                        {
                            float _882 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _884 = _852 + _882;
                            float _886 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float _888 = _856 + _886;
                            float2 _3187 = float2(_884, _888);
                            float2 _890 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3187, float2(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3187, float2(0.0), isnan(_3187)), level(0.0)).xy;
                            float _892 = _890.x;
                            float _894 = _890.y;
                            float _896 = fma(_892, 5.0, -3.75);
                            float _898 = rint(_894);
                            float _900 = abs(_896);
                            float _902 = _892 * _900;
                            float _904 = rint(_902);
                            float _906 = _904 + _898;
                            float _908 = _906 * 0.5;
                            bool _910 = _908 > 0.89999997615814208984375;
                            bool _912 = !_910;
                            _626 = _894;
                            _746 = 5.0;
                            _614 = _884;
                            _454 = _888;
                            _748 = _908;
                            if (!_912)
                            {
                                float _914 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _916 = _884 + _914;
                                float _918 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float _920 = _888 + _918;
                                float2 _3238 = float2(_916, _920);
                                float2 _922 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3238, float2(0.0), isnan(_3238)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3238, float2(0.0), isnan(_3238)), level(0.0)).xy;
                                float _924 = _922.x;
                                float _926 = _922.y;
                                float _928 = fma(_924, 5.0, -3.75);
                                float _930 = rint(_926);
                                float _932 = abs(_928);
                                float _934 = _924 * _932;
                                float _936 = rint(_934);
                                float _938 = _936 + _930;
                                float _940 = _938 * 0.5;
                                bool _942 = _940 > 0.89999997615814208984375;
                                float _944 = _938;
                                float _946 = _928;
                                float _948 = _930;
                                _614 = _916;
                                _454 = _920;
                                _748 = _940;
                                if (_942)
                                {
                                    float _950 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _952 = _916 + _950;
                                    _944 = _952;
                                }
                                float _954 = _944;
                                if (_942)
                                {
                                    float _956 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float _958 = _920 + _956;
                                    _946 = _958;
                                }
                                float _960 = _946;
                                float _962 = _954;
                                float _964 = _960;
                                if (_942)
                                {
                                    float2 _3300 = float2(_954, _960);
                                    float2 _966 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3300, float2(0.0), isnan(_3300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3300, float2(0.0), isnan(_3300)), level(0.0)).xy;
                                    float _968 = _966.x;
                                    float _970 = _966.y;
                                    _962 = _968;
                                    _964 = _970;
                                }
                                float _972 = _962;
                                float _974 = _964;
                                float _976 = 6.0;
                                if (_942)
                                {
                                    _976 = 7.0;
                                }
                                float _978 = _976;
                                _746 = _978;
                                if (_942)
                                {
                                    float _980 = fma(_972, 5.0, -3.75);
                                    _948 = _980;
                                }
                                float _982 = _948;
                                float _984 = _982;
                                if (_942)
                                {
                                    float _986 = rint(_974);
                                    _452 = _986;
                                }
                                float _988 = _452;
                                float _990 = _988;
                                if (_942)
                                {
                                    float _992 = abs(_982);
                                    float _994 = _972 * _992;
                                    _984 = _994;
                                }
                                float _996 = _984;
                                float _998 = _996;
                                if (_942)
                                {
                                    float _1000 = rint(_996);
                                    _998 = _1000;
                                }
                                float _1002 = _998;
                                _626 = _1002;
                                if (_942)
                                {
                                    float _1004 = _1002 + _988;
                                    _990 = _1004;
                                }
                                float _1006 = _990;
                                if (_942)
                                {
                                    float _1008 = _1006 * 0.5;
                                    _748 = _1008;
                                }
                            }
                        }
                    }
                }
            }
        }
        float _1010 = _626;
        float _1012 = _746;
        float _1014 = _614;
        float _1016 = _454;
        float _1018 = _748;
        float2 _3382 = float2(_67, _69);
        float _1020 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3382, float2(0.0), isnan(_3382)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3382, float2(0.0), isnan(_3382)), level(0.0), int2(1, 0)).x;
        bool _1022 = _1020 > 0.0;
        float _1024 = _1014;
        float _1026 = _1016;
        float _1028 = _1010;
        if (!_1022)
        {
            _1024 = 0.0;
        }
        float _1030 = _1024;
        float _1032 = _1030;
        if (!_1022)
        {
            _1026 = 0.0;
        }
        float _1034 = _1026;
        bool _1036 = !_1022;
        float _1038 = _1034;
        if (!_1036)
        {
            float _1040 = _596 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _1042 = _69 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
            float2 _3420 = float2(_1040, _1042);
            float2 _1044 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3420, float2(0.0), isnan(_3420)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3420, float2(0.0), isnan(_3420)), level(0.0)).xy;
            float _1046 = _1044.x;
            float _1048 = _1044.y;
            float _1050 = fma(_1046, 5.0, -3.75);
            float _1052 = rint(_1048);
            float _1054 = abs(_1050);
            float _1056 = _1046 * _1054;
            float _1058 = rint(_1056);
            float _1060 = _1058 + _1052;
            float _1062 = _1060 * 0.5;
            bool _1064 = _1062 > 0.89999997615814208984375;
            bool _1066 = !_1064;
            float _1068 = _1052;
            float _1070 = 0.0;
            float _1072 = _1062;
            if (!_1066)
            {
                float _1074 = _1040 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _1076 = _1042 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                float2 _3465 = float2(_1074, _1076);
                float2 _1078 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3465, float2(0.0), isnan(_3465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3465, float2(0.0), isnan(_3465)), level(0.0)).xy;
                float _1080 = _1078.x;
                float _1082 = _1078.y;
                float _1084 = fma(_1080, 5.0, -3.75);
                float _1086 = rint(_1082);
                float _1088 = abs(_1084);
                float _1090 = _1080 * _1088;
                float _1092 = rint(_1090);
                float _1094 = _1092 + _1086;
                float _1096 = _1094 * 0.5;
                bool _1098 = _1096 > 0.89999997615814208984375;
                bool _1100 = !_1098;
                _1068 = _1086;
                _1070 = 1.0;
                _1072 = _1096;
                if (!_1100)
                {
                    float _1102 = _1074 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _1104 = _1076 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float2 _3510 = float2(_1102, _1104);
                    float2 _1106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3510, float2(0.0), isnan(_3510)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3510, float2(0.0), isnan(_3510)), level(0.0)).xy;
                    float _1108 = _1106.x;
                    float _1110 = _1106.y;
                    float _1112 = fma(_1108, 5.0, -3.75);
                    float _1114 = rint(_1110);
                    float _1116 = abs(_1112);
                    float _1118 = _1108 * _1116;
                    float _1120 = rint(_1118);
                    float _1122 = _1120 + _1114;
                    float _1124 = _1122 * 0.5;
                    bool _1126 = _1124 > 0.89999997615814208984375;
                    bool _1128 = !_1126;
                    _1068 = _1114;
                    _1070 = 2.0;
                    _1072 = _1124;
                    if (!_1128)
                    {
                        float _1130 = _1102 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _1132 = _1104 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float2 _3555 = float2(_1130, _1132);
                        float2 _1134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3555, float2(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3555, float2(0.0), isnan(_3555)), level(0.0)).xy;
                        float _1136 = _1134.x;
                        float _1138 = _1134.y;
                        float _1140 = fma(_1136, 5.0, -3.75);
                        float _1142 = rint(_1138);
                        float _1144 = abs(_1140);
                        float _1146 = _1136 * _1144;
                        float _1148 = rint(_1146);
                        float _1150 = _1148 + _1142;
                        float _1152 = _1150 * 0.5;
                        bool _1154 = _1152 > 0.89999997615814208984375;
                        bool _1156 = !_1154;
                        _1068 = _1142;
                        _1070 = 3.0;
                        _1072 = _1152;
                        if (!_1156)
                        {
                            float _1158 = _1130 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _1160 = _1132 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float2 _3600 = float2(_1158, _1160);
                            float2 _1162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3600, float2(0.0), isnan(_3600)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3600, float2(0.0), isnan(_3600)), level(0.0)).xy;
                            float _1164 = _1162.x;
                            float _1166 = _1162.y;
                            float _1168 = fma(_1164, 5.0, -3.75);
                            float _1170 = rint(_1166);
                            float _1172 = abs(_1168);
                            float _1174 = _1164 * _1172;
                            float _1176 = rint(_1174);
                            float _1178 = _1176 + _1170;
                            float _1180 = _1178 * 0.5;
                            bool _1182 = _1180 > 0.89999997615814208984375;
                            bool _1184 = !_1182;
                            _1068 = _1170;
                            _1070 = 4.0;
                            _1072 = _1180;
                            if (!_1184)
                            {
                                float _1186 = _1158 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _1188 = _1160 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float2 _3645 = float2(_1186, _1188);
                                float2 _1190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3645, float2(0.0), isnan(_3645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3645, float2(0.0), isnan(_3645)), level(0.0)).xy;
                                float _1192 = _1190.x;
                                float _1194 = _1190.y;
                                float _1196 = fma(_1192, 5.0, -3.75);
                                float _1198 = rint(_1194);
                                float _1200 = abs(_1196);
                                float _1202 = _1192 * _1200;
                                float _1204 = rint(_1202);
                                float _1206 = _1204 + _1198;
                                float _1208 = _1206 * 0.5;
                                bool _1210 = _1208 > 0.89999997615814208984375;
                                bool _1212 = !_1210;
                                _1068 = _1198;
                                _1070 = 5.0;
                                _1072 = _1208;
                                if (!_1212)
                                {
                                    float _1214 = _1186 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _1216 = _1188 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float2 _3690 = float2(_1214, _1216);
                                    float2 _1218 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3690, float2(0.0), isnan(_3690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3690, float2(0.0), isnan(_3690)), level(0.0)).xy;
                                    float _1220 = _1218.x;
                                    float _1222 = _1218.y;
                                    float _1224 = fma(_1220, 5.0, -3.75);
                                    float _1226 = rint(_1222);
                                    float _1228 = abs(_1224);
                                    float _1230 = _1220 * _1228;
                                    float _1232 = rint(_1230);
                                    float _1234 = _1232 + _1226;
                                    float _1236 = _1234 * 0.5;
                                    bool _1238 = _1236 > 0.89999997615814208984375;
                                    bool _1240 = !_1238;
                                    _1068 = _1226;
                                    _1070 = 6.0;
                                    _1072 = _1236;
                                    if (!_1240)
                                    {
                                        float _1242 = _1214 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                        float _1244 = _1216 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                        float2 _3735 = float2(_1242, _1244);
                                        float2 _1246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3735, float2(0.0), isnan(_3735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3735, float2(0.0), isnan(_3735)), level(0.0)).xy;
                                        float _1248 = _1246.x;
                                        float _1250 = _1246.y;
                                        float _1252 = fma(_1248, 5.0, -3.75);
                                        float _1254 = rint(_1250);
                                        float _1256 = abs(_1252);
                                        float _1258 = _1248 * _1256;
                                        float _1260 = rint(_1258);
                                        float _1262 = _1260 + _1254;
                                        float _1264 = _1262 * 0.5;
                                        _1068 = _1254;
                                        _1070 = 7.0;
                                        _1072 = _1264;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _1266 = _1068;
            float _1268 = _1070;
            float _1270 = _1072;
            bool _1272 = _1266 > 0.89999997615814208984375;
            float _1274 = float(_1272);
            float _1276 = _1274 + _1268;
            _1032 = _1276;
            _1038 = _1270;
            _1028 = _1266;
        }
        float _1278 = _1032;
        float _1280 = _1038;
        float _1282 = _1028;
        float _1284 = _1012 + _1278;
        bool _1286 = _1284 > 2.0;
        float _1288 = _1282;
        float _1290 = _1284;
        if (!_1286)
        {
            _1288 = _724;
        }
        float _1292 = _1288;
        bool _1294 = !_1286;
        float _1296 = _1292;
        if (!_1294)
        {
            float _1298 = -_1012;
            float _1300 = fma(_1298, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _1302 = -_1012;
            float _1304 = fma(_1302, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float _1306 = fma(_1278, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _1308 = fma(_1278, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float2 _3832 = float2(_1300, _1304);
            float _1310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3832, float2(0.0), isnan(_3832)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3832, float2(0.0), isnan(_3832)), level(0.0), int2(-1, 0)).y;
            float2 _3840 = float2(_1300, _1304);
            float _1312 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3840, float2(0.0), isnan(_3840)), level(0.0), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3840, float2(0.0), isnan(_3840)), level(0.0), int2(0, -1)).x;
            float2 _3849 = float2(_1306, _1308);
            float2 _1314 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3849, float2(0.0), isnan(_3849)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3849, float2(0.0), isnan(_3849)), level(0.0), int2(1, 0)).xy;
            float _1316 = _1314.x;
            float _1318 = _1314.y;
            bool _1320 = _1280 >= 0.89999997615814208984375;
            bool _1322 = isnan(_1280);
            bool _1324 = _1320 || _1322;
            bool _1326 = isnan(0.89999997615814208984375);
            bool _1328 = _1324 || _1326;
            bool _1330 = _1018 >= 0.89999997615814208984375;
            bool _1332 = isnan(_1018);
            bool _1334 = _1330 || _1332;
            bool _1336 = isnan(0.89999997615814208984375);
            bool _1338 = _1334 || _1336;
            float _1340 = fma(_1310, 2.0, _1312);
            float _1342 = fma(_1318, 2.0, _1316);
            bool _1344 = !_1338;
            float _1346 = _1344 ? _1340 : 0.0;
            bool _1348 = !_1328;
            float _1350 = _1348 ? _1342 : 0.0;
            float _1352 = fma(_1346, 20.0, _1012);
            float _1354 = fma(_1350, 20.0, _1278);
            float _1356 = fma(_1352, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _1358 = fma(_1354, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _1360 = _1356 + 0.5;
            float2 _3911 = float2(_1360, _1358);
            float2 _1362 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3911, float2(0.0), isnan(_3911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3911, float2(0.0), isnan(_3911)), level(0.0)).xy;
            float _1364 = _1362.x;
            float _1366 = _1362.y;
            float _1368 = _1366 + _726;
            float _1370 = _1364 + _724;
            _1296 = _1370;
            _750 = _1368;
            _1290 = _1364;
        }
        float _1372 = _1296;
        float _1374 = _750;
        float _1376 = _1290;
        float _1378 = -_1372;
        bool _1380 = _1374 != _1378;
        bool _1382 = isnan(_1374);
        bool _1384 = _1380 || _1382;
        bool _1386 = isnan(_1378);
        bool _1388 = _1384 || _1386;
        float _1390 = _1376;
        float _1392 = _1374;
        float _1394 = _1372;
        _228 = as_type<int>(_1372);
        if (_1388)
        {
            _1390 = _1374;
        }
        float _1396 = _1390;
        float _1398 = _1396;
        _226 = as_type<int>(_1396);
        if (_1388)
        {
            _1392 = 0.0;
        }
        float _1400 = _1392;
        float _1402 = _1400;
        _234 = _1400;
        if (!_1388)
        {
            bool _1404 = _187 > _175;
            if (!_1404)
            {
                _1402 = _187;
            }
            float _1406 = _1402;
            float _1408 = _1406;
            if (!_1404)
            {
                _1398 = 0.0;
            }
            float _1410 = _1398;
            float _1412 = _1410;
            if (!_1404)
            {
                _1394 = 1.0;
            }
            float _1414 = _1394;
            bool _1416 = !_1404;
            float _1418 = _1414;
            if (!_1416)
            {
                float _1420 = _187;
                bool _1422;
                do
                {
                    float _1424 = _1420;
                    float2 _4004 = float2(_1424, _165);
                    float2 _1426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4004, float2(0.0), isnan(_4004)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4004, float2(0.0), isnan(_4004)), level(0.0)).xy;
                    float _1428 = _1426.x;
                    float _1430 = _1426.y;
                    float _1432 = fma((*spvDescriptorSet0.fp_c24)._m0[0].x, -2.0, _1424);
                    bool _1434 = _1432 > _175;
                    bool _1436 = _1428 == 0.0;
                    bool _1438 = _1430 > 0.828100025653839111328125;
                    bool _1440 = _1438 && _1434;
                    _1422 = _1440 && _1436;
                    _1420 = _1432;
                    _1418 = _1430;
                    _1412 = _1428;
                    _1408 = _1432;
                } while (_1422);
            }
            float _1442 = _1418;
            float _1444 = _1412;
            float _1446 = _1408;
            float _1448 = fma(_1442, -2.0, 2.03125);
            float _1450 = fma(_1444, 0.5, 0.0078125);
            float2 _4052 = float2(_1450, _1448);
            float _1452 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4052, float2(0.0), isnan(_4052)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4052, float2(0.0), isnan(_4052)), level(0.0)).x;
            float _1454 = fma(_1452, -2.007874011993408203125, 3.25);
            float _1456 = fma(_1454, (*spvDescriptorSet0.fp_c24)._m0[0].x, _1446);
            float2 _4069 = float2(_1456, _189);
            float _1458 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4069, float2(0.0), isnan(_4069)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4069, float2(0.0), isnan(_4069)), level(0.0)).x;
            bool _1460 = _169 >= _177;
            bool _1462 = isnan(_169);
            bool _1464 = _1460 || _1462;
            bool _1466 = isnan(_177);
            bool _1468 = _1464 || _1466;
            float _1470 = _1446;
            if (_1468)
            {
                _1470 = 0.0;
            }
            float _1472 = _1470;
            float _1474 = _1472;
            if (_1468)
            {
                _752 = 1.0;
            }
            float _1476 = _752;
            float _1478 = _1476;
            if (!_1468)
            {
                bool _1480;
                do
                {
                    float _1482 = _204;
                    float2 _4107 = float2(_1482, _171);
                    float2 _1484 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4107, float2(0.0), isnan(_4107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4107, float2(0.0), isnan(_4107)), level(0.0)).xy;
                    float _1486 = _1484.x;
                    float _1488 = _1484.y;
                    float _1490 = fma(2.0, (*spvDescriptorSet0.fp_c24)._m0[0].x, _1482);
                    bool _1492 = _1490 >= _177;
                    bool _1494 = isnan(_1490);
                    bool _1496 = _1492 || _1494;
                    bool _1498 = isnan(_177);
                    bool _1500 = _1496 || _1498;
                    bool _1502 = _1486 == 0.0;
                    bool _1504 = _1488 > 0.828100025653839111328125;
                    bool _1506 = !_1500;
                    bool _1508 = _1504 && _1506;
                    _1480 = _1508 && _1502;
                    _204 = _1490;
                    _1474 = _1486;
                    _1478 = _1488;
                    _206 = _1490;
                } while (_1480);
            }
            float _1510 = _1474;
            float _1512 = _1478;
            float _1514 = _206;
            float _1516 = fma(_1510, 0.5, 0.5234375);
            float _1518 = fma(_1512, -2.0, 2.03125);
            float2 _4164 = float2(_1516, _1518);
            float _1520 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4164, float2(0.0), isnan(_4164)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4164, float2(0.0), isnan(_4164)), level(0.0)).x;
            float _1522 = fma(_1520, -2.007874011993408203125, 3.25);
            float _1524 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _1526 = fma(_1522, _1524, _1514);
            float2 _4181 = float2(_1526, _189);
            float _1528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4181, float2(0.0), isnan(_4181)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4181, float2(0.0), isnan(_4181)), level(0.0), int2(1, 0)).x;
            float _1530 = -_183;
            float _1532 = fma(_1456, (*spvDescriptorSet0.fp_c24)._m0[0].z, _1530);
            float _1534 = -_183;
            float _1536 = fma(_1526, (*spvDescriptorSet0.fp_c24)._m0[0].z, _1534);
            float _1538 = _1458 * 4.0;
            float _1540 = rint(_1532);
            float _1542 = rint(_1536);
            float _1544 = rint(_1538);
            float _1546 = abs(_1540);
            float _1548 = sqrt(_1546);
            float _1550 = abs(_1542);
            float _1552 = sqrt(_1550);
            float _1554 = fma(_1544, 16.0, _1548);
            float _1556 = fma(_1554, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float2 _4225 = float2(_1456, _69);
            float _1558 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4225, float2(0.0), isnan(_4225)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4225, float2(0.0), isnan(_4225)), level(0.0), int2(0, 1)).x;
            float2 _4234 = float2(_1456, _69);
            float _1560 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4234, float2(0.0), isnan(_4234)), level(0.0), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4234, float2(0.0), isnan(_4234)), level(0.0), int2(0, -2)).x;
            float _1562 = _1528 * 4.0;
            float _1564 = rint(_1562);
            float2 _4248 = float2(_1526, _69);
            float _1566 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4248, float2(0.0), isnan(_4248)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4248, float2(0.0), isnan(_4248)), level(0.0), int2(1)).x;
            float _1568 = fma(_1564, 16.0, _1552);
            float _1570 = fma(_1568, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float2 _4262 = float2(_1526, _69);
            float _1572 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4262, float2(0.0), isnan(_4262)), level(0.0), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4262, float2(0.0), isnan(_4262)), level(0.0), int2(1, -2)).x;
            float2 _4271 = float2(_1556, _1570);
            float2 _1574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4271, float2(0.0), isnan(_4271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4271, float2(0.0), isnan(_4271)), level(0.0)).xy;
            float _1576 = _1574.x;
            float _1578 = _1574.y;
            float _1580 = abs(_1542);
            float _1582 = abs(_1540);
            bool _1584 = _1580 >= _1582;
            bool _1586 = isnan(_1580);
            bool _1588 = _1584 || _1586;
            bool _1590 = isnan(_1582);
            bool _1592 = _1588 || _1590;
            float _1594 = float(_1592);
            float _1596 = abs(_1540);
            float _1598 = abs(_1542);
            bool _1600 = _1596 >= _1598;
            bool _1602 = isnan(_1596);
            bool _1604 = _1600 || _1602;
            bool _1606 = isnan(_1598);
            bool _1608 = _1604 || _1606;
            float _1610 = float(_1608);
            float _1612 = _1594 + _1610;
            float _1614 = 1.0 / _1612;
            float _1616 = _1614 * 0.75;
            float _1618 = _1594 * _1616;
            float _1620 = _1610 * _1616;
            float _1622 = -_1618;
            float _1624 = fma(_1622, _1558, 1.0);
            float _1626 = -_1618;
            float _1628 = fma(_1626, _1560, 1.0);
            float _1630 = -_1620;
            float _1632 = fma(_1630, _1566, _1624);
            float _1634 = precise::clamp(_1632, 0.0, 1.0);
            float _1636 = -_1620;
            float _1638 = fma(_1636, _1572, _1628);
            float _1640 = precise::clamp(_1638, 0.0, 1.0);
            float _1642 = _1576 * _1634;
            float _1644 = _1578 * _1640;
            _234 = _75;
            _226 = as_type<int>(_1642);
            _228 = as_type<int>(_1644);
            _208 = as_type<int>(_1576);
            _210 = as_type<int>(_1578);
        }
    }
    float _1646 = _234;
    int _1648 = _226;
    int _1650 = _228;
    int _1652 = _208;
    int _1654 = _210;
    bool _1656 = _1646 > 0.0;
    int _1658 = _1652;
    int _1660 = _1654;
    if (!_1656)
    {
        _1658 = 0;
        _1660 = 0;
    }
    int _1662 = _1658;
    int _1664 = _1660;
    float _1666 = as_type<float>(_1664);
    float _1668 = as_type<float>(_1662);
    if (!_1656)
    {
        out.m_44.x = as_type<float>(_1648);
        out.m_44.y = as_type<float>(_1650);
        out.m_44.z = as_type<float>(_1662);
        out.m_44.w = as_type<float>(_1664);
        return out;
    }
    bool _1670 = _189 > _179;
    if (!_1670)
    {
        _1666 = 1.0;
    }
    float _1672 = _1666;
    float _1674 = _1672;
    if (!_1670)
    {
        _1668 = 0.0;
    }
    float _1676 = _1668;
    bool _1678 = !_1670;
    float _1680 = _1676;
    if (!_1678)
    {
        bool _1682;
        float _1688;
        float _1690;
        do
        {
            float _1684 = _212;
            float2 _4437 = float2(_173, _1684);
            float2 _1686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4437, float2(0.0), isnan(_4437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4437, float2(0.0), isnan(_4437)), level(0.0)).xy;
            _1688 = _1686.x;
            _1690 = _1686.y;
            float _1692 = fma((*spvDescriptorSet0.fp_c24)._m0[0].y, -2.0, _1684);
            bool _1694 = _1692 > _179;
            bool _1696 = _1690 == 0.0;
            bool _1698 = _1688 > 0.828100025653839111328125;
            bool _1700 = _1698 && _1694;
            _1682 = _1700 && _1696;
            _212 = _1692;
            _214 = _1692;
        } while (_1682);
        _1680 = _1690;
        _1674 = _1688;
    }
    float _1702 = _1680;
    float _1704 = _1674;
    float _1706 = _214;
    float _1708 = fma(_1702, 0.5, 0.0078125);
    float _1710 = fma(_1704, -2.0, 2.03125);
    float2 _4481 = float2(_1708, _1710);
    float _1712 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4481, float2(0.0), isnan(_4481)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4481, float2(0.0), isnan(_4481)), level(0.0)).x;
    float _1714 = fma(_1712, -2.007874011993408203125, 3.25);
    float _1716 = fma(_1714, (*spvDescriptorSet0.fp_c24)._m0[0].y, _1706);
    float2 _4496 = float2(_187, _1716);
    float _1718 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4496, float2(0.0), isnan(_4496)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4496, float2(0.0), isnan(_4496)), level(0.0)).y;
    bool _1720 = _167 >= _181;
    bool _1722 = isnan(_167);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(_181);
    bool _1728 = _1724 || _1726;
    float _1730 = _1704;
    float _1732 = _1714;
    if (_1728)
    {
        _1730 = 1.0;
    }
    float _1734 = _1730;
    float _1736 = _1734;
    if (_1728)
    {
        _1732 = 0.0;
    }
    float _1738 = _1732;
    float _1740 = _1738;
    if (!_1728)
    {
        bool _1742;
        float _1748;
        float _1750;
        do
        {
            float _1744 = _216;
            float2 _4535 = float2(_163, _1744);
            float2 _1746 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4535, float2(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4535, float2(0.0), isnan(_4535)), level(0.0)).xy;
            _1748 = _1746.x;
            _1750 = _1746.y;
            float _1752 = fma(2.0, (*spvDescriptorSet0.fp_c24)._m0[0].y, _1744);
            bool _1754 = _1752 >= _181;
            bool _1756 = isnan(_1752);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan(_181);
            bool _1762 = _1758 || _1760;
            bool _1764 = _1750 == 0.0;
            bool _1766 = _1748 > 0.828100025653839111328125;
            bool _1768 = !_1762;
            bool _1770 = _1766 && _1768;
            _1742 = _1770 && _1764;
            _216 = _1752;
            _218 = _1752;
        } while (_1742);
        _1740 = _1750;
        _1736 = _1748;
    }
    float _1772 = _1740;
    float _1774 = _1736;
    float _1776 = _218;
    float _1778 = fma(_1772, 0.5, 0.5234375);
    float _1780 = fma(_1774, -2.0, 2.03125);
    float2 _4591 = float2(_1778, _1780);
    float _1782 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).x;
    float _1784 = fma(_1782, -2.007874011993408203125, 3.25);
    float _1786 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
    float _1788 = fma(_1784, _1786, _1776);
    float2 _4608 = float2(_187, _1788);
    float _1790 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4608, float2(0.0), isnan(_4608)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4608, float2(0.0), isnan(_4608)), level(0.0), int2(0, 1)).y;
    float _1792 = -_185;
    float _1794 = fma(_1716, (*spvDescriptorSet0.fp_c24)._m0[0].w, _1792);
    float _1796 = _1718 * 4.0;
    float _1798 = -_185;
    float _1800 = fma(_1788, (*spvDescriptorSet0.fp_c24)._m0[0].w, _1798);
    float _1802 = rint(_1796);
    float _1804 = rint(_1794);
    float _1806 = rint(_1800);
    float _1808 = abs(_1804);
    float _1810 = sqrt(_1808);
    float _1812 = abs(_1806);
    float _1814 = sqrt(_1812);
    float _1816 = fma(_1802, 16.0, _1810);
    float2 _4649 = float2(_67, _1716);
    float _1818 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4649, float2(0.0), isnan(_4649)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4649, float2(0.0), isnan(_4649)), level(0.0), int2(1, 0)).y;
    float2 _4657 = float2(_67, _1716);
    float _1820 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4657, float2(0.0), isnan(_4657)), level(0.0), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4657, float2(0.0), isnan(_4657)), level(0.0), int2(-2, 0)).y;
    float2 _4666 = float2(_67, _1788);
    float _1822 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4666, float2(0.0), isnan(_4666)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4666, float2(0.0), isnan(_4666)), level(0.0), int2(1)).y;
    float _1824 = fma(_1816, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
    float _1826 = _1790 * 4.0;
    float _1828 = rint(_1826);
    float2 _4680 = float2(_67, _1788);
    float _1830 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4680, float2(0.0), isnan(_4680)), level(0.0), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4680, float2(0.0), isnan(_4680)), level(0.0), int2(-2, 1)).y;
    float _1832 = fma(_1828, 16.0, _1814);
    float _1834 = fma(_1832, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
    float2 _4694 = float2(_1824, _1834);
    float2 _1836 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).xy;
    float _1838 = _1836.x;
    float _1840 = _1836.y;
    float _1842 = abs(_1806);
    float _1844 = abs(_1804);
    bool _1846 = _1842 >= _1844;
    bool _1848 = isnan(_1842);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(_1844);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = abs(_1804);
    float _1860 = abs(_1806);
    bool _1862 = _1858 >= _1860;
    bool _1864 = isnan(_1858);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan(_1860);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = _1856 + _1872;
    float _1876 = 1.0 / _1874;
    float _1878 = _1876 * 0.75;
    float _1880 = _1856 * _1878;
    float _1882 = _1872 * _1878;
    float _1884 = -_1880;
    float _1886 = fma(_1884, _1818, 1.0);
    float _1888 = -_1880;
    float _1890 = fma(_1888, _1820, 1.0);
    float _1892 = -_1882;
    float _1894 = fma(_1892, _1822, _1886);
    float _1896 = precise::clamp(_1894, 0.0, 1.0);
    float _1898 = -_1882;
    float _1900 = fma(_1898, _1830, _1890);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    float _1904 = _1838 * _1896;
    float _1906 = _1840 * _1902;
    out.m_44.x = as_type<float>(_1648);
    out.m_44.y = as_type<float>(_1650);
    out.m_44.z = _1904;
    out.m_44.w = _1906;
    return out;
}


struct main0_out_u
{
    uint4 m_44 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _1939 = float2(_67, _69);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1939, float2(0.0), isnan(_1939))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1939, float2(0.0), isnan(_1939))).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = in.m_35.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_37.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_35.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_39.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_39.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_39.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_41.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_37.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_35.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _65 * _83;
    float _165 = _65 * _89;
    float _167 = _65 * _95;
    float _169 = _65 * _101;
    float _171 = _65 * _107;
    float _173 = _65 * _113;
    float _175 = _65 * _119;
    float _177 = _65 * _125;
    float _179 = _65 * _131;
    float _181 = _65 * _137;
    float _183 = _65 * _143;
    float _185 = _65 * _149;
    float _187 = _65 * _155;
    float _189 = _65 * _161;
    bool _193 = _77 > 0.0;
    int _196 = as_type<int>(_65);
    int _198 = as_type<int>(_155);
    float _200 = _137;
    float _202 = _119;
    float _204 = _169;
    float _206 = _169;
    int _208 = as_type<int>(_165);
    int _210 = as_type<int>(_183);
    float _212 = _189;
    float _214 = _189;
    float _216 = _167;
    float _218 = _167;
    if (!_193)
    {
        _196 = 0;
        _198 = 0;
    }
    int _220 = _196;
    int _222 = _198;
    float _224 = 0.0;
    int _226 = _220;
    int _228 = _222;
    if (!_193)
    {
        _224 = _75;
    }
    float _230 = _224;
    bool _232 = !_193;
    float _234 = _230;
    if (!_232)
    {
        bool _236 = _75 > 0.0;
        float _238 = 0.0;
        if (!_236)
        {
            _238 = 0.0;
        }
        float _240 = _238;
        float _242 = _240;
        if (!_236)
        {
            _200 = 0.0;
        }
        float _244 = _200;
        bool _246 = !_236;
        float _248 = _244;
        if (!_246)
        {
            float _250 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _252 = _67 + _250;
            float _254 = _69 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
            float2 _2163 = float2(_252, _254);
            float2 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2163, float2(0.0), isnan(_2163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2163, float2(0.0), isnan(_2163)), level(0.0)).xy;
            float _258 = _256.x;
            float _260 = _256.y;
            float _262 = _258 + _260;
            float _264 = _262 * 0.5;
            bool _266 = _264 > 0.89999997615814208984375;
            bool _268 = !_266;
            float _270 = _260;
            float _272 = 0.0;
            float _274 = _264;
            if (!_268)
            {
                float _276 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _278 = _252 + _276;
                float _280 = _254 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                float2 _2201 = float2(_278, _280);
                float2 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2201, float2(0.0), isnan(_2201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2201, float2(0.0), isnan(_2201)), level(0.0)).xy;
                float _284 = _282.x;
                float _286 = _282.y;
                float _288 = _286 + _284;
                float _290 = _288 * 0.5;
                bool _292 = _290 > 0.89999997615814208984375;
                bool _294 = !_292;
                _270 = _286;
                _272 = 1.0;
                _274 = _290;
                if (!_294)
                {
                    float _296 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _298 = _278 + _296;
                    float _300 = _280 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float2 _2237 = float2(_298, _300);
                    float2 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2237, float2(0.0), isnan(_2237)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2237, float2(0.0), isnan(_2237)), level(0.0)).xy;
                    float _304 = _302.x;
                    float _306 = _302.y;
                    float _308 = _306 + _304;
                    float _310 = _308 * 0.5;
                    bool _312 = _310 > 0.89999997615814208984375;
                    bool _314 = !_312;
                    _270 = _306;
                    _272 = 2.0;
                    _274 = _310;
                    if (!_314)
                    {
                        float _316 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _318 = _298 + _316;
                        float _320 = _300 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float2 _2274 = float2(_318, _320);
                        float2 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2274, float2(0.0), isnan(_2274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2274, float2(0.0), isnan(_2274)), level(0.0)).xy;
                        float _324 = _322.x;
                        float _326 = _322.y;
                        float _328 = _326 + _324;
                        float _330 = _328 * 0.5;
                        bool _332 = _330 > 0.89999997615814208984375;
                        bool _334 = !_332;
                        _270 = _326;
                        _272 = 3.0;
                        _274 = _330;
                        if (!_334)
                        {
                            float _336 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _338 = _318 + _336;
                            float _340 = _320 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float2 _2311 = float2(_338, _340);
                            float2 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2311, float2(0.0), isnan(_2311)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2311, float2(0.0), isnan(_2311)), level(0.0)).xy;
                            float _344 = _342.x;
                            float _346 = _342.y;
                            float _348 = _346 + _344;
                            float _350 = _348 * 0.5;
                            bool _352 = _350 > 0.89999997615814208984375;
                            bool _354 = !_352;
                            _270 = _346;
                            _272 = 4.0;
                            _274 = _350;
                            if (!_354)
                            {
                                float _356 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _358 = _338 + _356;
                                float _360 = _340 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float2 _2348 = float2(_358, _360);
                                float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2348, float2(0.0), isnan(_2348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2348, float2(0.0), isnan(_2348)), level(0.0)).xy;
                                float _364 = _362.x;
                                float _366 = _362.y;
                                float _368 = _366 + _364;
                                float _370 = _368 * 0.5;
                                bool _372 = _370 > 0.89999997615814208984375;
                                bool _374 = !_372;
                                _270 = _366;
                                _272 = 5.0;
                                _274 = _370;
                                if (!_374)
                                {
                                    float _376 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _378 = _358 + _376;
                                    float _380 = _360 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float2 _2385 = float2(_378, _380);
                                    float2 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2385, float2(0.0), isnan(_2385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2385, float2(0.0), isnan(_2385)), level(0.0)).xy;
                                    float _384 = _382.x;
                                    float _386 = _382.y;
                                    float _388 = _386 + _384;
                                    float _390 = _388 * 0.5;
                                    bool _392 = _390 > 0.89999997615814208984375;
                                    bool _394 = !_392;
                                    _270 = _386;
                                    _272 = 6.0;
                                    _274 = _390;
                                    if (!_394)
                                    {
                                        float _396 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                        float _398 = _378 + _396;
                                        float _400 = _380 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                        float2 _2422 = float2(_398, _400);
                                        float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2422, float2(0.0), isnan(_2422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2422, float2(0.0), isnan(_2422)), level(0.0)).xy;
                                        float _404 = _402.x;
                                        float _406 = _402.y;
                                        float _408 = _406 + _404;
                                        float _410 = _408 * 0.5;
                                        _270 = _406;
                                        _272 = 7.0;
                                        _274 = _410;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _412 = _270;
            float _414 = _272;
            float _416 = _274;
            bool _418 = _412 > 0.89999997615814208984375;
            float _420 = float(_418);
            float _422 = _420 + _414;
            _242 = _422;
            _248 = _416;
        }
        float _424 = _242;
        float _426 = _248;
        float _428 = _67 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
        float _430 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
        float _432 = _69 + _430;
        float2 _2474 = float2(_428, _432);
        float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2474, float2(0.0), isnan(_2474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2474, float2(0.0), isnan(_2474)), level(0.0)).xy;
        float _436 = _434.x;
        float _438 = _434.y;
        float _440 = _436 + _438;
        float _442 = _440 * 0.5;
        bool _444 = _442 > 0.89999997615814208984375;
        bool _446 = !_444;
        float _448 = 0.0;
        float _450 = _442;
        float _452 = _424;
        float _454 = _432;
        if (!_446)
        {
            float _456 = _428 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _458 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
            float _460 = _432 + _458;
            float2 _2511 = float2(_456, _460);
            float2 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2511, float2(0.0), isnan(_2511)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2511, float2(0.0), isnan(_2511)), level(0.0)).xy;
            float _464 = _462.x;
            float _466 = _462.y;
            float _468 = _466 + _464;
            float _470 = _468 * 0.5;
            bool _472 = _470 > 0.89999997615814208984375;
            bool _474 = !_472;
            _448 = 1.0;
            _450 = _470;
            if (!_474)
            {
                float _476 = _456 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _478 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                float _480 = _460 + _478;
                float2 _2546 = float2(_476, _480);
                float2 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2546, float2(0.0), isnan(_2546)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2546, float2(0.0), isnan(_2546)), level(0.0)).xy;
                float _484 = _482.x;
                float _486 = _482.y;
                float _488 = _486 + _484;
                float _490 = _488 * 0.5;
                bool _492 = _490 > 0.89999997615814208984375;
                bool _494 = !_492;
                _448 = 2.0;
                _450 = _490;
                if (!_494)
                {
                    float _496 = _476 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _498 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float _500 = _480 + _498;
                    float2 _2581 = float2(_496, _500);
                    float2 _502 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2581, float2(0.0), isnan(_2581)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2581, float2(0.0), isnan(_2581)), level(0.0)).xy;
                    float _504 = _502.x;
                    float _506 = _502.y;
                    float _508 = _506 + _504;
                    float _510 = _508 * 0.5;
                    bool _512 = _510 > 0.89999997615814208984375;
                    bool _514 = !_512;
                    _448 = 3.0;
                    _450 = _510;
                    if (!_514)
                    {
                        float _516 = _496 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _518 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float _520 = _500 + _518;
                        float2 _2616 = float2(_516, _520);
                        float2 _522 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2616, float2(0.0), isnan(_2616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2616, float2(0.0), isnan(_2616)), level(0.0)).xy;
                        float _524 = _522.x;
                        float _526 = _522.y;
                        float _528 = _526 + _524;
                        float _530 = _528 * 0.5;
                        bool _532 = _530 > 0.89999997615814208984375;
                        bool _534 = !_532;
                        _448 = 4.0;
                        _450 = _530;
                        if (!_534)
                        {
                            float _536 = _516 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _538 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float _540 = _520 + _538;
                            float2 _2651 = float2(_536, _540);
                            float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2651, float2(0.0), isnan(_2651)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2651, float2(0.0), isnan(_2651)), level(0.0)).xy;
                            float _544 = _542.x;
                            float _546 = _542.y;
                            float _548 = _546 + _544;
                            float _550 = _548 * 0.5;
                            bool _552 = _550 > 0.89999997615814208984375;
                            bool _554 = !_552;
                            _448 = 5.0;
                            _450 = _550;
                            if (!_554)
                            {
                                float _556 = _536 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _558 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float _560 = _540 + _558;
                                float2 _2686 = float2(_556, _560);
                                float2 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2686, float2(0.0), isnan(_2686)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2686, float2(0.0), isnan(_2686)), level(0.0)).xy;
                                float _564 = _562.x;
                                float _566 = _562.y;
                                float _568 = _566 + _564;
                                float _570 = _568 * 0.5;
                                bool _572 = _570 > 0.89999997615814208984375;
                                bool _574 = !_572;
                                _448 = 6.0;
                                _450 = _570;
                                if (!_574)
                                {
                                    float _576 = _556 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _578 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float _580 = _560 + _578;
                                    float2 _2721 = float2(_576, _580);
                                    float2 _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2721, float2(0.0), isnan(_2721)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2721, float2(0.0), isnan(_2721)), level(0.0)).xy;
                                    float _584 = _582.x;
                                    float _586 = _582.y;
                                    float _588 = _586 + _584;
                                    float _590 = _588 * 0.5;
                                    _448 = 7.0;
                                    _450 = _590;
                                }
                            }
                        }
                    }
                }
            }
        }
        float _592 = _448;
        float _594 = _450;
        float _596 = fma((*spvDescriptorSet0.fp_c24)._m0[0].x, 0.25, _67);
        float _598 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
        float _600 = _596 + _598;
        float2 _2760 = float2(_600, _432);
        float2 _602 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2760, float2(0.0), isnan(_2760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2760, float2(0.0), isnan(_2760)), level(0.0)).xy;
        float _604 = _602.x;
        float _606 = _602.y;
        float _608 = _592 + _424;
        bool _610 = _608 > 2.0;
        float _612 = _608;
        float _614 = _600;
        if (!_610)
        {
            _202 = 0.0;
            _612 = 0.0;
        }
        float _616 = _202;
        float _618 = _612;
        bool _620 = !_610;
        float _622 = _616;
        float _624 = _618;
        float _626 = _606;
        if (!_620)
        {
            float _628 = -_424;
            float _630 = _628 + 0.25;
            float _632 = fma(_424, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float _634 = -_592;
            float _636 = _634 + (-0.25);
            float _638 = fma(_630, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _640 = fma(_592, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _642 = fma(_636, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float2 _2822 = float2(_638, _632);
            float2 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2822, float2(0.0), isnan(_2822)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2822, float2(0.0), isnan(_2822)), level(0.0), int2(-1, 0)).xy;
            float _646 = _644.x;
            float _648 = _644.y;
            float2 _2837 = float2(_640, _642);
            float2 _650 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2837, float2(0.0), isnan(_2837)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2837, float2(0.0), isnan(_2837)), level(0.0), int2(1, 0)).xy;
            float _652 = _650.x;
            float _654 = _650.y;
            bool _656 = _426 >= 0.89999997615814208984375;
            bool _658 = isnan(_426);
            bool _660 = _656 || _658;
            bool _662 = isnan(0.89999997615814208984375);
            bool _664 = _660 || _662;
            bool _666 = _594 >= 0.89999997615814208984375;
            bool _668 = isnan(_594);
            bool _670 = _666 || _668;
            bool _672 = isnan(0.89999997615814208984375);
            bool _674 = _670 || _672;
            float _676 = fma(_646, 5.0, -3.75);
            float _678 = rint(_648);
            float _680 = abs(_676);
            float _682 = _646 * _680;
            float _684 = fma(_652, 5.0, -3.75);
            float _686 = abs(_684);
            float _688 = _652 * _686;
            float _690 = rint(_682);
            float _692 = rint(_654);
            float _694 = rint(_688);
            float _696 = fma(_678, 2.0, _690);
            bool _698 = !_664;
            float _700 = _698 ? _696 : 0.0;
            float _702 = fma(_700, 20.0, _424);
            float _704 = fma(_702, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _706 = fma(_692, 2.0, _694);
            float _708 = _704 + 0.5;
            bool _710 = !_674;
            float _712 = _710 ? _706 : 0.0;
            float _714 = fma(_712, 20.0, _592);
            float _716 = fma(_714, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float2 _2928 = float2(_708, _716);
            float2 _718 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2928, float2(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2928, float2(0.0), isnan(_2928)), level(0.0)).xy;
            float _720 = _718.x;
            float _722 = _718.y;
            _622 = _722;
            _624 = _720;
        }
        float _724 = _622;
        float _726 = _624;
        float _728 = fma(_604, 5.0, -3.75);
        float _730 = rint(_606);
        float _732 = abs(_728);
        float _734 = _604 * _732;
        float _736 = rint(_734);
        float _738 = _736 + _730;
        float _740 = _738 * 0.5;
        bool _742 = _740 > 0.89999997615814208984375;
        bool _744 = !_742;
        float _746 = 0.0;
        float _748 = _740;
        float _750 = _726;
        float _752 = _724;
        if (!_744)
        {
            float _754 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _756 = _600 + _754;
            float _758 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
            float _760 = _432 + _758;
            float2 _2983 = float2(_756, _760);
            float2 _762 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2983, float2(0.0), isnan(_2983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2983, float2(0.0), isnan(_2983)), level(0.0)).xy;
            float _764 = _762.x;
            float _766 = _762.y;
            float _768 = fma(_764, 5.0, -3.75);
            float _770 = rint(_766);
            float _772 = abs(_768);
            float _774 = _764 * _772;
            float _776 = rint(_774);
            float _778 = _776 + _770;
            float _780 = _778 * 0.5;
            bool _782 = _780 > 0.89999997615814208984375;
            bool _784 = !_782;
            _626 = _766;
            _746 = 1.0;
            _614 = _756;
            _454 = _760;
            _748 = _780;
            if (!_784)
            {
                float _786 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _788 = _756 + _786;
                float _790 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                float _792 = _760 + _790;
                float2 _3034 = float2(_788, _792);
                float2 _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3034, float2(0.0), isnan(_3034)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3034, float2(0.0), isnan(_3034)), level(0.0)).xy;
                float _796 = _794.x;
                float _798 = _794.y;
                float _800 = fma(_796, 5.0, -3.75);
                float _802 = rint(_798);
                float _804 = abs(_800);
                float _806 = _796 * _804;
                float _808 = rint(_806);
                float _810 = _808 + _802;
                float _812 = _810 * 0.5;
                bool _814 = _812 > 0.89999997615814208984375;
                bool _816 = !_814;
                _626 = _798;
                _746 = 2.0;
                _614 = _788;
                _454 = _792;
                _748 = _812;
                if (!_816)
                {
                    float _818 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _820 = _788 + _818;
                    float _822 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float _824 = _792 + _822;
                    float2 _3085 = float2(_820, _824);
                    float2 _826 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3085, float2(0.0), isnan(_3085)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3085, float2(0.0), isnan(_3085)), level(0.0)).xy;
                    float _828 = _826.x;
                    float _830 = _826.y;
                    float _832 = fma(_828, 5.0, -3.75);
                    float _834 = rint(_830);
                    float _836 = abs(_832);
                    float _838 = _828 * _836;
                    float _840 = rint(_838);
                    float _842 = _840 + _834;
                    float _844 = _842 * 0.5;
                    bool _846 = _844 > 0.89999997615814208984375;
                    bool _848 = !_846;
                    _626 = _830;
                    _746 = 3.0;
                    _614 = _820;
                    _454 = _824;
                    _748 = _844;
                    if (!_848)
                    {
                        float _850 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _852 = _820 + _850;
                        float _854 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float _856 = _824 + _854;
                        float2 _3136 = float2(_852, _856);
                        float2 _858 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3136, float2(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3136, float2(0.0), isnan(_3136)), level(0.0)).xy;
                        float _860 = _858.x;
                        float _862 = _858.y;
                        float _864 = fma(_860, 5.0, -3.75);
                        float _866 = rint(_862);
                        float _868 = abs(_864);
                        float _870 = _860 * _868;
                        float _872 = rint(_870);
                        float _874 = _872 + _866;
                        float _876 = _874 * 0.5;
                        bool _878 = _876 > 0.89999997615814208984375;
                        bool _880 = !_878;
                        _626 = _862;
                        _746 = 4.0;
                        _614 = _852;
                        _454 = _856;
                        _748 = _876;
                        if (!_880)
                        {
                            float _882 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _884 = _852 + _882;
                            float _886 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float _888 = _856 + _886;
                            float2 _3187 = float2(_884, _888);
                            float2 _890 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3187, float2(0.0), isnan(_3187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3187, float2(0.0), isnan(_3187)), level(0.0)).xy;
                            float _892 = _890.x;
                            float _894 = _890.y;
                            float _896 = fma(_892, 5.0, -3.75);
                            float _898 = rint(_894);
                            float _900 = abs(_896);
                            float _902 = _892 * _900;
                            float _904 = rint(_902);
                            float _906 = _904 + _898;
                            float _908 = _906 * 0.5;
                            bool _910 = _908 > 0.89999997615814208984375;
                            bool _912 = !_910;
                            _626 = _894;
                            _746 = 5.0;
                            _614 = _884;
                            _454 = _888;
                            _748 = _908;
                            if (!_912)
                            {
                                float _914 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _916 = _884 + _914;
                                float _918 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float _920 = _888 + _918;
                                float2 _3238 = float2(_916, _920);
                                float2 _922 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3238, float2(0.0), isnan(_3238)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3238, float2(0.0), isnan(_3238)), level(0.0)).xy;
                                float _924 = _922.x;
                                float _926 = _922.y;
                                float _928 = fma(_924, 5.0, -3.75);
                                float _930 = rint(_926);
                                float _932 = abs(_928);
                                float _934 = _924 * _932;
                                float _936 = rint(_934);
                                float _938 = _936 + _930;
                                float _940 = _938 * 0.5;
                                bool _942 = _940 > 0.89999997615814208984375;
                                float _944 = _938;
                                float _946 = _928;
                                float _948 = _930;
                                _614 = _916;
                                _454 = _920;
                                _748 = _940;
                                if (_942)
                                {
                                    float _950 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _952 = _916 + _950;
                                    _944 = _952;
                                }
                                float _954 = _944;
                                if (_942)
                                {
                                    float _956 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float _958 = _920 + _956;
                                    _946 = _958;
                                }
                                float _960 = _946;
                                float _962 = _954;
                                float _964 = _960;
                                if (_942)
                                {
                                    float2 _3300 = float2(_954, _960);
                                    float2 _966 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3300, float2(0.0), isnan(_3300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3300, float2(0.0), isnan(_3300)), level(0.0)).xy;
                                    float _968 = _966.x;
                                    float _970 = _966.y;
                                    _962 = _968;
                                    _964 = _970;
                                }
                                float _972 = _962;
                                float _974 = _964;
                                float _976 = 6.0;
                                if (_942)
                                {
                                    _976 = 7.0;
                                }
                                float _978 = _976;
                                _746 = _978;
                                if (_942)
                                {
                                    float _980 = fma(_972, 5.0, -3.75);
                                    _948 = _980;
                                }
                                float _982 = _948;
                                float _984 = _982;
                                if (_942)
                                {
                                    float _986 = rint(_974);
                                    _452 = _986;
                                }
                                float _988 = _452;
                                float _990 = _988;
                                if (_942)
                                {
                                    float _992 = abs(_982);
                                    float _994 = _972 * _992;
                                    _984 = _994;
                                }
                                float _996 = _984;
                                float _998 = _996;
                                if (_942)
                                {
                                    float _1000 = rint(_996);
                                    _998 = _1000;
                                }
                                float _1002 = _998;
                                _626 = _1002;
                                if (_942)
                                {
                                    float _1004 = _1002 + _988;
                                    _990 = _1004;
                                }
                                float _1006 = _990;
                                if (_942)
                                {
                                    float _1008 = _1006 * 0.5;
                                    _748 = _1008;
                                }
                            }
                        }
                    }
                }
            }
        }
        float _1010 = _626;
        float _1012 = _746;
        float _1014 = _614;
        float _1016 = _454;
        float _1018 = _748;
        float2 _3382 = float2(_67, _69);
        float _1020 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3382, float2(0.0), isnan(_3382)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3382, float2(0.0), isnan(_3382)), level(0.0), int2(1, 0)).x;
        bool _1022 = _1020 > 0.0;
        float _1024 = _1014;
        float _1026 = _1016;
        float _1028 = _1010;
        if (!_1022)
        {
            _1024 = 0.0;
        }
        float _1030 = _1024;
        float _1032 = _1030;
        if (!_1022)
        {
            _1026 = 0.0;
        }
        float _1034 = _1026;
        bool _1036 = !_1022;
        float _1038 = _1034;
        if (!_1036)
        {
            float _1040 = _596 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _1042 = _69 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
            float2 _3420 = float2(_1040, _1042);
            float2 _1044 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3420, float2(0.0), isnan(_3420)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3420, float2(0.0), isnan(_3420)), level(0.0)).xy;
            float _1046 = _1044.x;
            float _1048 = _1044.y;
            float _1050 = fma(_1046, 5.0, -3.75);
            float _1052 = rint(_1048);
            float _1054 = abs(_1050);
            float _1056 = _1046 * _1054;
            float _1058 = rint(_1056);
            float _1060 = _1058 + _1052;
            float _1062 = _1060 * 0.5;
            bool _1064 = _1062 > 0.89999997615814208984375;
            bool _1066 = !_1064;
            float _1068 = _1052;
            float _1070 = 0.0;
            float _1072 = _1062;
            if (!_1066)
            {
                float _1074 = _1040 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                float _1076 = _1042 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                float2 _3465 = float2(_1074, _1076);
                float2 _1078 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3465, float2(0.0), isnan(_3465)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3465, float2(0.0), isnan(_3465)), level(0.0)).xy;
                float _1080 = _1078.x;
                float _1082 = _1078.y;
                float _1084 = fma(_1080, 5.0, -3.75);
                float _1086 = rint(_1082);
                float _1088 = abs(_1084);
                float _1090 = _1080 * _1088;
                float _1092 = rint(_1090);
                float _1094 = _1092 + _1086;
                float _1096 = _1094 * 0.5;
                bool _1098 = _1096 > 0.89999997615814208984375;
                bool _1100 = !_1098;
                _1068 = _1086;
                _1070 = 1.0;
                _1072 = _1096;
                if (!_1100)
                {
                    float _1102 = _1074 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                    float _1104 = _1076 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                    float2 _3510 = float2(_1102, _1104);
                    float2 _1106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3510, float2(0.0), isnan(_3510)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3510, float2(0.0), isnan(_3510)), level(0.0)).xy;
                    float _1108 = _1106.x;
                    float _1110 = _1106.y;
                    float _1112 = fma(_1108, 5.0, -3.75);
                    float _1114 = rint(_1110);
                    float _1116 = abs(_1112);
                    float _1118 = _1108 * _1116;
                    float _1120 = rint(_1118);
                    float _1122 = _1120 + _1114;
                    float _1124 = _1122 * 0.5;
                    bool _1126 = _1124 > 0.89999997615814208984375;
                    bool _1128 = !_1126;
                    _1068 = _1114;
                    _1070 = 2.0;
                    _1072 = _1124;
                    if (!_1128)
                    {
                        float _1130 = _1102 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                        float _1132 = _1104 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                        float2 _3555 = float2(_1130, _1132);
                        float2 _1134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3555, float2(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3555, float2(0.0), isnan(_3555)), level(0.0)).xy;
                        float _1136 = _1134.x;
                        float _1138 = _1134.y;
                        float _1140 = fma(_1136, 5.0, -3.75);
                        float _1142 = rint(_1138);
                        float _1144 = abs(_1140);
                        float _1146 = _1136 * _1144;
                        float _1148 = rint(_1146);
                        float _1150 = _1148 + _1142;
                        float _1152 = _1150 * 0.5;
                        bool _1154 = _1152 > 0.89999997615814208984375;
                        bool _1156 = !_1154;
                        _1068 = _1142;
                        _1070 = 3.0;
                        _1072 = _1152;
                        if (!_1156)
                        {
                            float _1158 = _1130 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                            float _1160 = _1132 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                            float2 _3600 = float2(_1158, _1160);
                            float2 _1162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3600, float2(0.0), isnan(_3600)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3600, float2(0.0), isnan(_3600)), level(0.0)).xy;
                            float _1164 = _1162.x;
                            float _1166 = _1162.y;
                            float _1168 = fma(_1164, 5.0, -3.75);
                            float _1170 = rint(_1166);
                            float _1172 = abs(_1168);
                            float _1174 = _1164 * _1172;
                            float _1176 = rint(_1174);
                            float _1178 = _1176 + _1170;
                            float _1180 = _1178 * 0.5;
                            bool _1182 = _1180 > 0.89999997615814208984375;
                            bool _1184 = !_1182;
                            _1068 = _1170;
                            _1070 = 4.0;
                            _1072 = _1180;
                            if (!_1184)
                            {
                                float _1186 = _1158 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                float _1188 = _1160 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                float2 _3645 = float2(_1186, _1188);
                                float2 _1190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3645, float2(0.0), isnan(_3645)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3645, float2(0.0), isnan(_3645)), level(0.0)).xy;
                                float _1192 = _1190.x;
                                float _1194 = _1190.y;
                                float _1196 = fma(_1192, 5.0, -3.75);
                                float _1198 = rint(_1194);
                                float _1200 = abs(_1196);
                                float _1202 = _1192 * _1200;
                                float _1204 = rint(_1202);
                                float _1206 = _1204 + _1198;
                                float _1208 = _1206 * 0.5;
                                bool _1210 = _1208 > 0.89999997615814208984375;
                                bool _1212 = !_1210;
                                _1068 = _1198;
                                _1070 = 5.0;
                                _1072 = _1208;
                                if (!_1212)
                                {
                                    float _1214 = _1186 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                    float _1216 = _1188 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                    float2 _3690 = float2(_1214, _1216);
                                    float2 _1218 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3690, float2(0.0), isnan(_3690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3690, float2(0.0), isnan(_3690)), level(0.0)).xy;
                                    float _1220 = _1218.x;
                                    float _1222 = _1218.y;
                                    float _1224 = fma(_1220, 5.0, -3.75);
                                    float _1226 = rint(_1222);
                                    float _1228 = abs(_1224);
                                    float _1230 = _1220 * _1228;
                                    float _1232 = rint(_1230);
                                    float _1234 = _1232 + _1226;
                                    float _1236 = _1234 * 0.5;
                                    bool _1238 = _1236 > 0.89999997615814208984375;
                                    bool _1240 = !_1238;
                                    _1068 = _1226;
                                    _1070 = 6.0;
                                    _1072 = _1236;
                                    if (!_1240)
                                    {
                                        float _1242 = _1214 + (*spvDescriptorSet0.fp_c24)._m0[0].x;
                                        float _1244 = _1216 + (*spvDescriptorSet0.fp_c24)._m0[0].y;
                                        float2 _3735 = float2(_1242, _1244);
                                        float2 _1246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3735, float2(0.0), isnan(_3735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3735, float2(0.0), isnan(_3735)), level(0.0)).xy;
                                        float _1248 = _1246.x;
                                        float _1250 = _1246.y;
                                        float _1252 = fma(_1248, 5.0, -3.75);
                                        float _1254 = rint(_1250);
                                        float _1256 = abs(_1252);
                                        float _1258 = _1248 * _1256;
                                        float _1260 = rint(_1258);
                                        float _1262 = _1260 + _1254;
                                        float _1264 = _1262 * 0.5;
                                        _1068 = _1254;
                                        _1070 = 7.0;
                                        _1072 = _1264;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            float _1266 = _1068;
            float _1268 = _1070;
            float _1270 = _1072;
            bool _1272 = _1266 > 0.89999997615814208984375;
            float _1274 = float(_1272);
            float _1276 = _1274 + _1268;
            _1032 = _1276;
            _1038 = _1270;
            _1028 = _1266;
        }
        float _1278 = _1032;
        float _1280 = _1038;
        float _1282 = _1028;
        float _1284 = _1012 + _1278;
        bool _1286 = _1284 > 2.0;
        float _1288 = _1282;
        float _1290 = _1284;
        if (!_1286)
        {
            _1288 = _724;
        }
        float _1292 = _1288;
        bool _1294 = !_1286;
        float _1296 = _1292;
        if (!_1294)
        {
            float _1298 = -_1012;
            float _1300 = fma(_1298, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _1302 = -_1012;
            float _1304 = fma(_1302, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float _1306 = fma(_1278, (*spvDescriptorSet0.fp_c24)._m0[0].x, _67);
            float _1308 = fma(_1278, (*spvDescriptorSet0.fp_c24)._m0[0].y, _69);
            float2 _3832 = float2(_1300, _1304);
            float _1310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3832, float2(0.0), isnan(_3832)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3832, float2(0.0), isnan(_3832)), level(0.0), int2(-1, 0)).y;
            float2 _3840 = float2(_1300, _1304);
            float _1312 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3840, float2(0.0), isnan(_3840)), level(0.0), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3840, float2(0.0), isnan(_3840)), level(0.0), int2(0, -1)).x;
            float2 _3849 = float2(_1306, _1308);
            float2 _1314 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3849, float2(0.0), isnan(_3849)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3849, float2(0.0), isnan(_3849)), level(0.0), int2(1, 0)).xy;
            float _1316 = _1314.x;
            float _1318 = _1314.y;
            bool _1320 = _1280 >= 0.89999997615814208984375;
            bool _1322 = isnan(_1280);
            bool _1324 = _1320 || _1322;
            bool _1326 = isnan(0.89999997615814208984375);
            bool _1328 = _1324 || _1326;
            bool _1330 = _1018 >= 0.89999997615814208984375;
            bool _1332 = isnan(_1018);
            bool _1334 = _1330 || _1332;
            bool _1336 = isnan(0.89999997615814208984375);
            bool _1338 = _1334 || _1336;
            float _1340 = fma(_1310, 2.0, _1312);
            float _1342 = fma(_1318, 2.0, _1316);
            bool _1344 = !_1338;
            float _1346 = _1344 ? _1340 : 0.0;
            bool _1348 = !_1328;
            float _1350 = _1348 ? _1342 : 0.0;
            float _1352 = fma(_1346, 20.0, _1012);
            float _1354 = fma(_1350, 20.0, _1278);
            float _1356 = fma(_1352, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _1358 = fma(_1354, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _1360 = _1356 + 0.5;
            float2 _3911 = float2(_1360, _1358);
            float2 _1362 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3911, float2(0.0), isnan(_3911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3911, float2(0.0), isnan(_3911)), level(0.0)).xy;
            float _1364 = _1362.x;
            float _1366 = _1362.y;
            float _1368 = _1366 + _726;
            float _1370 = _1364 + _724;
            _1296 = _1370;
            _750 = _1368;
            _1290 = _1364;
        }
        float _1372 = _1296;
        float _1374 = _750;
        float _1376 = _1290;
        float _1378 = -_1372;
        bool _1380 = _1374 != _1378;
        bool _1382 = isnan(_1374);
        bool _1384 = _1380 || _1382;
        bool _1386 = isnan(_1378);
        bool _1388 = _1384 || _1386;
        float _1390 = _1376;
        float _1392 = _1374;
        float _1394 = _1372;
        _228 = as_type<int>(_1372);
        if (_1388)
        {
            _1390 = _1374;
        }
        float _1396 = _1390;
        float _1398 = _1396;
        _226 = as_type<int>(_1396);
        if (_1388)
        {
            _1392 = 0.0;
        }
        float _1400 = _1392;
        float _1402 = _1400;
        _234 = _1400;
        if (!_1388)
        {
            bool _1404 = _187 > _175;
            if (!_1404)
            {
                _1402 = _187;
            }
            float _1406 = _1402;
            float _1408 = _1406;
            if (!_1404)
            {
                _1398 = 0.0;
            }
            float _1410 = _1398;
            float _1412 = _1410;
            if (!_1404)
            {
                _1394 = 1.0;
            }
            float _1414 = _1394;
            bool _1416 = !_1404;
            float _1418 = _1414;
            if (!_1416)
            {
                float _1420 = _187;
                bool _1422;
                do
                {
                    float _1424 = _1420;
                    float2 _4004 = float2(_1424, _165);
                    float2 _1426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4004, float2(0.0), isnan(_4004)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4004, float2(0.0), isnan(_4004)), level(0.0)).xy;
                    float _1428 = _1426.x;
                    float _1430 = _1426.y;
                    float _1432 = fma((*spvDescriptorSet0.fp_c24)._m0[0].x, -2.0, _1424);
                    bool _1434 = _1432 > _175;
                    bool _1436 = _1428 == 0.0;
                    bool _1438 = _1430 > 0.828100025653839111328125;
                    bool _1440 = _1438 && _1434;
                    _1422 = _1440 && _1436;
                    _1420 = _1432;
                    _1418 = _1430;
                    _1412 = _1428;
                    _1408 = _1432;
                } while (_1422);
            }
            float _1442 = _1418;
            float _1444 = _1412;
            float _1446 = _1408;
            float _1448 = fma(_1442, -2.0, 2.03125);
            float _1450 = fma(_1444, 0.5, 0.0078125);
            float2 _4052 = float2(_1450, _1448);
            float _1452 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4052, float2(0.0), isnan(_4052)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4052, float2(0.0), isnan(_4052)), level(0.0)).x;
            float _1454 = fma(_1452, -2.007874011993408203125, 3.25);
            float _1456 = fma(_1454, (*spvDescriptorSet0.fp_c24)._m0[0].x, _1446);
            float2 _4069 = float2(_1456, _189);
            float _1458 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4069, float2(0.0), isnan(_4069)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4069, float2(0.0), isnan(_4069)), level(0.0)).x;
            bool _1460 = _169 >= _177;
            bool _1462 = isnan(_169);
            bool _1464 = _1460 || _1462;
            bool _1466 = isnan(_177);
            bool _1468 = _1464 || _1466;
            float _1470 = _1446;
            if (_1468)
            {
                _1470 = 0.0;
            }
            float _1472 = _1470;
            float _1474 = _1472;
            if (_1468)
            {
                _752 = 1.0;
            }
            float _1476 = _752;
            float _1478 = _1476;
            if (!_1468)
            {
                bool _1480;
                do
                {
                    float _1482 = _204;
                    float2 _4107 = float2(_1482, _171);
                    float2 _1484 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4107, float2(0.0), isnan(_4107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4107, float2(0.0), isnan(_4107)), level(0.0)).xy;
                    float _1486 = _1484.x;
                    float _1488 = _1484.y;
                    float _1490 = fma(2.0, (*spvDescriptorSet0.fp_c24)._m0[0].x, _1482);
                    bool _1492 = _1490 >= _177;
                    bool _1494 = isnan(_1490);
                    bool _1496 = _1492 || _1494;
                    bool _1498 = isnan(_177);
                    bool _1500 = _1496 || _1498;
                    bool _1502 = _1486 == 0.0;
                    bool _1504 = _1488 > 0.828100025653839111328125;
                    bool _1506 = !_1500;
                    bool _1508 = _1504 && _1506;
                    _1480 = _1508 && _1502;
                    _204 = _1490;
                    _1474 = _1486;
                    _1478 = _1488;
                    _206 = _1490;
                } while (_1480);
            }
            float _1510 = _1474;
            float _1512 = _1478;
            float _1514 = _206;
            float _1516 = fma(_1510, 0.5, 0.5234375);
            float _1518 = fma(_1512, -2.0, 2.03125);
            float2 _4164 = float2(_1516, _1518);
            float _1520 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4164, float2(0.0), isnan(_4164)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4164, float2(0.0), isnan(_4164)), level(0.0)).x;
            float _1522 = fma(_1520, -2.007874011993408203125, 3.25);
            float _1524 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
            float _1526 = fma(_1522, _1524, _1514);
            float2 _4181 = float2(_1526, _189);
            float _1528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4181, float2(0.0), isnan(_4181)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4181, float2(0.0), isnan(_4181)), level(0.0), int2(1, 0)).x;
            float _1530 = -_183;
            float _1532 = fma(_1456, (*spvDescriptorSet0.fp_c24)._m0[0].z, _1530);
            float _1534 = -_183;
            float _1536 = fma(_1526, (*spvDescriptorSet0.fp_c24)._m0[0].z, _1534);
            float _1538 = _1458 * 4.0;
            float _1540 = rint(_1532);
            float _1542 = rint(_1536);
            float _1544 = rint(_1538);
            float _1546 = abs(_1540);
            float _1548 = sqrt(_1546);
            float _1550 = abs(_1542);
            float _1552 = sqrt(_1550);
            float _1554 = fma(_1544, 16.0, _1548);
            float _1556 = fma(_1554, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float2 _4225 = float2(_1456, _69);
            float _1558 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4225, float2(0.0), isnan(_4225)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4225, float2(0.0), isnan(_4225)), level(0.0), int2(0, 1)).x;
            float2 _4234 = float2(_1456, _69);
            float _1560 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4234, float2(0.0), isnan(_4234)), level(0.0), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4234, float2(0.0), isnan(_4234)), level(0.0), int2(0, -2)).x;
            float _1562 = _1528 * 4.0;
            float _1564 = rint(_1562);
            float2 _4248 = float2(_1526, _69);
            float _1566 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4248, float2(0.0), isnan(_4248)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4248, float2(0.0), isnan(_4248)), level(0.0), int2(1)).x;
            float _1568 = fma(_1564, 16.0, _1552);
            float _1570 = fma(_1568, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float2 _4262 = float2(_1526, _69);
            float _1572 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4262, float2(0.0), isnan(_4262)), level(0.0), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4262, float2(0.0), isnan(_4262)), level(0.0), int2(1, -2)).x;
            float2 _4271 = float2(_1556, _1570);
            float2 _1574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4271, float2(0.0), isnan(_4271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4271, float2(0.0), isnan(_4271)), level(0.0)).xy;
            float _1576 = _1574.x;
            float _1578 = _1574.y;
            float _1580 = abs(_1542);
            float _1582 = abs(_1540);
            bool _1584 = _1580 >= _1582;
            bool _1586 = isnan(_1580);
            bool _1588 = _1584 || _1586;
            bool _1590 = isnan(_1582);
            bool _1592 = _1588 || _1590;
            float _1594 = float(_1592);
            float _1596 = abs(_1540);
            float _1598 = abs(_1542);
            bool _1600 = _1596 >= _1598;
            bool _1602 = isnan(_1596);
            bool _1604 = _1600 || _1602;
            bool _1606 = isnan(_1598);
            bool _1608 = _1604 || _1606;
            float _1610 = float(_1608);
            float _1612 = _1594 + _1610;
            float _1614 = 1.0 / _1612;
            float _1616 = _1614 * 0.75;
            float _1618 = _1594 * _1616;
            float _1620 = _1610 * _1616;
            float _1622 = -_1618;
            float _1624 = fma(_1622, _1558, 1.0);
            float _1626 = -_1618;
            float _1628 = fma(_1626, _1560, 1.0);
            float _1630 = -_1620;
            float _1632 = fma(_1630, _1566, _1624);
            float _1634 = precise::clamp(_1632, 0.0, 1.0);
            float _1636 = -_1620;
            float _1638 = fma(_1636, _1572, _1628);
            float _1640 = precise::clamp(_1638, 0.0, 1.0);
            float _1642 = _1576 * _1634;
            float _1644 = _1578 * _1640;
            _234 = _75;
            _226 = as_type<int>(_1642);
            _228 = as_type<int>(_1644);
            _208 = as_type<int>(_1576);
            _210 = as_type<int>(_1578);
        }
    }
    float _1646 = _234;
    int _1648 = _226;
    int _1650 = _228;
    int _1652 = _208;
    int _1654 = _210;
    bool _1656 = _1646 > 0.0;
    int _1658 = _1652;
    int _1660 = _1654;
    if (!_1656)
    {
        _1658 = 0;
        _1660 = 0;
    }
    int _1662 = _1658;
    int _1664 = _1660;
    float _1666 = as_type<float>(_1664);
    float _1668 = as_type<float>(_1662);
    if (!_1656)
    {
        out.m_44.x = as_type<float>(_1648);
        out.m_44.y = as_type<float>(_1650);
        out.m_44.z = as_type<float>(_1662);
        out.m_44.w = as_type<float>(_1664);
        return main0_out_u{as_type<uint4>(out.m_44)};
    }
    bool _1670 = _189 > _179;
    if (!_1670)
    {
        _1666 = 1.0;
    }
    float _1672 = _1666;
    float _1674 = _1672;
    if (!_1670)
    {
        _1668 = 0.0;
    }
    float _1676 = _1668;
    bool _1678 = !_1670;
    float _1680 = _1676;
    if (!_1678)
    {
        bool _1682;
        float _1688;
        float _1690;
        do
        {
            float _1684 = _212;
            float2 _4437 = float2(_173, _1684);
            float2 _1686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4437, float2(0.0), isnan(_4437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4437, float2(0.0), isnan(_4437)), level(0.0)).xy;
            _1688 = _1686.x;
            _1690 = _1686.y;
            float _1692 = fma((*spvDescriptorSet0.fp_c24)._m0[0].y, -2.0, _1684);
            bool _1694 = _1692 > _179;
            bool _1696 = _1690 == 0.0;
            bool _1698 = _1688 > 0.828100025653839111328125;
            bool _1700 = _1698 && _1694;
            _1682 = _1700 && _1696;
            _212 = _1692;
            _214 = _1692;
        } while (_1682);
        _1680 = _1690;
        _1674 = _1688;
    }
    float _1702 = _1680;
    float _1704 = _1674;
    float _1706 = _214;
    float _1708 = fma(_1702, 0.5, 0.0078125);
    float _1710 = fma(_1704, -2.0, 2.03125);
    float2 _4481 = float2(_1708, _1710);
    float _1712 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4481, float2(0.0), isnan(_4481)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4481, float2(0.0), isnan(_4481)), level(0.0)).x;
    float _1714 = fma(_1712, -2.007874011993408203125, 3.25);
    float _1716 = fma(_1714, (*spvDescriptorSet0.fp_c24)._m0[0].y, _1706);
    float2 _4496 = float2(_187, _1716);
    float _1718 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4496, float2(0.0), isnan(_4496)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4496, float2(0.0), isnan(_4496)), level(0.0)).y;
    bool _1720 = _167 >= _181;
    bool _1722 = isnan(_167);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(_181);
    bool _1728 = _1724 || _1726;
    float _1730 = _1704;
    float _1732 = _1714;
    if (_1728)
    {
        _1730 = 1.0;
    }
    float _1734 = _1730;
    float _1736 = _1734;
    if (_1728)
    {
        _1732 = 0.0;
    }
    float _1738 = _1732;
    float _1740 = _1738;
    if (!_1728)
    {
        bool _1742;
        float _1748;
        float _1750;
        do
        {
            float _1744 = _216;
            float2 _4535 = float2(_163, _1744);
            float2 _1746 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4535, float2(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4535, float2(0.0), isnan(_4535)), level(0.0)).xy;
            _1748 = _1746.x;
            _1750 = _1746.y;
            float _1752 = fma(2.0, (*spvDescriptorSet0.fp_c24)._m0[0].y, _1744);
            bool _1754 = _1752 >= _181;
            bool _1756 = isnan(_1752);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan(_181);
            bool _1762 = _1758 || _1760;
            bool _1764 = _1750 == 0.0;
            bool _1766 = _1748 > 0.828100025653839111328125;
            bool _1768 = !_1762;
            bool _1770 = _1766 && _1768;
            _1742 = _1770 && _1764;
            _216 = _1752;
            _218 = _1752;
        } while (_1742);
        _1740 = _1750;
        _1736 = _1748;
    }
    float _1772 = _1740;
    float _1774 = _1736;
    float _1776 = _218;
    float _1778 = fma(_1772, 0.5, 0.5234375);
    float _1780 = fma(_1774, -2.0, 2.03125);
    float2 _4591 = float2(_1778, _1780);
    float _1782 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).x;
    float _1784 = fma(_1782, -2.007874011993408203125, 3.25);
    float _1786 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
    float _1788 = fma(_1784, _1786, _1776);
    float2 _4608 = float2(_187, _1788);
    float _1790 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4608, float2(0.0), isnan(_4608)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4608, float2(0.0), isnan(_4608)), level(0.0), int2(0, 1)).y;
    float _1792 = -_185;
    float _1794 = fma(_1716, (*spvDescriptorSet0.fp_c24)._m0[0].w, _1792);
    float _1796 = _1718 * 4.0;
    float _1798 = -_185;
    float _1800 = fma(_1788, (*spvDescriptorSet0.fp_c24)._m0[0].w, _1798);
    float _1802 = rint(_1796);
    float _1804 = rint(_1794);
    float _1806 = rint(_1800);
    float _1808 = abs(_1804);
    float _1810 = sqrt(_1808);
    float _1812 = abs(_1806);
    float _1814 = sqrt(_1812);
    float _1816 = fma(_1802, 16.0, _1810);
    float2 _4649 = float2(_67, _1716);
    float _1818 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4649, float2(0.0), isnan(_4649)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4649, float2(0.0), isnan(_4649)), level(0.0), int2(1, 0)).y;
    float2 _4657 = float2(_67, _1716);
    float _1820 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4657, float2(0.0), isnan(_4657)), level(0.0), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4657, float2(0.0), isnan(_4657)), level(0.0), int2(-2, 0)).y;
    float2 _4666 = float2(_67, _1788);
    float _1822 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4666, float2(0.0), isnan(_4666)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4666, float2(0.0), isnan(_4666)), level(0.0), int2(1)).y;
    float _1824 = fma(_1816, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
    float _1826 = _1790 * 4.0;
    float _1828 = rint(_1826);
    float2 _4680 = float2(_67, _1788);
    float _1830 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4680, float2(0.0), isnan(_4680)), level(0.0), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4680, float2(0.0), isnan(_4680)), level(0.0), int2(-2, 1)).y;
    float _1832 = fma(_1828, 16.0, _1814);
    float _1834 = fma(_1832, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
    float2 _4694 = float2(_1824, _1834);
    float2 _1836 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4694, float2(0.0), isnan(_4694)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4694, float2(0.0), isnan(_4694)), level(0.0)).xy;
    float _1838 = _1836.x;
    float _1840 = _1836.y;
    float _1842 = abs(_1806);
    float _1844 = abs(_1804);
    bool _1846 = _1842 >= _1844;
    bool _1848 = isnan(_1842);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(_1844);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = abs(_1804);
    float _1860 = abs(_1806);
    bool _1862 = _1858 >= _1860;
    bool _1864 = isnan(_1858);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan(_1860);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = _1856 + _1872;
    float _1876 = 1.0 / _1874;
    float _1878 = _1876 * 0.75;
    float _1880 = _1856 * _1878;
    float _1882 = _1872 * _1878;
    float _1884 = -_1880;
    float _1886 = fma(_1884, _1818, 1.0);
    float _1888 = -_1880;
    float _1890 = fma(_1888, _1820, 1.0);
    float _1892 = -_1882;
    float _1894 = fma(_1892, _1822, _1886);
    float _1896 = precise::clamp(_1894, 0.0, 1.0);
    float _1898 = -_1882;
    float _1900 = fma(_1898, _1830, _1890);
    float _1902 = precise::clamp(_1900, 0.0, 1.0);
    float _1904 = _1838 * _1896;
    float _1906 = _1840 * _1902;
    out.m_44.x = as_type<float>(_1648);
    out.m_44.y = as_type<float>(_1650);
    out.m_44.z = _1904;
    out.m_44.w = _1906;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

