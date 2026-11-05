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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1520 = false;
    bool _1182 = false;
    bool _704 = false;
    bool _450 = false;
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _5640 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5640, float2(0.0), isnan(_5640))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5640, float2(0.0), isnan(_5640))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_37.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_39.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_35.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_37.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _63 * _81;
    float _139 = _63 * _87;
    float _141 = _63 * _93;
    float _143 = _63 * _99;
    float _145 = _63 * _105;
    float _147 = _63 * _111;
    float _149 = _63 * _117;
    float _151 = _63 * _123;
    float _153 = _63 * _129;
    float _155 = _63 * _135;
    bool _159 = _75 > 0.0;
    bool _161 = _73 > 0.0;
    bool _163 = !_161;
    int _166 = _163 ? 0 : 1;
    int _168 = as_type<int>(_73);
    int _170 = as_type<int>(_75);
    int _172 = as_type<int>(_99);
    float _174 = _117;
    float _176 = _105;
    float _178 = _139;
    int _180 = as_type<int>(_143);
    float _182 = _111;
    float _184 = _139;
    int _186 = as_type<int>(_149);
    float _188 = _155;
    float _190 = _147;
    int _192 = _166;
    int _194 = as_type<int>(_141);
    if (!_159)
    {
        _168 = 0;
        _170 = 0;
    }
    int _196 = _168;
    int _198 = _170;
    int _200 = _196;
    int _202 = _198;
    if (!_159)
    {
        _172 = _166;
    }
    int _204 = _172;
    bool _206 = !_159;
    int _208 = _204;
    float _210 = 0.0;
    if (!_206)
    {
        if (!_161)
        {
            _174 = 0.0;
        }
        float _212 = _174;
        float _214 = _212;
        if (!_161)
        {
            _176 = 0.0;
        }
        float _216 = _176;
        bool _218 = !_161;
        float _220 = _216;
        if (!_218)
        {
            float _222 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _224 = _65 + _222;
            float _226 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _5832 = float2(_224, _226);
            float2 _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5832, float2(0.0), isnan(_5832))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5832, float2(0.0), isnan(_5832))).xy;
            float _230 = _228.x;
            float _232 = _228.y;
            float _234 = _230 + _232;
            float _236 = _234 * 0.5;
            bool _238 = _236 >= 0.89999997615814208984375;
            bool _240 = isnan(_236);
            bool _242 = _238 || _240;
            bool _244 = isnan(0.89999997615814208984375);
            bool _246 = _242 || _244;
            bool _248 = !_246;
            float _250 = _232;
            float _252 = 0.0;
            float _254 = _236;
            if (!_248)
            {
                float _256 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _258 = _224 + _256;
                float _260 = _226 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _5879 = float2(_258, _260);
                float2 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5879, float2(0.0), isnan(_5879))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5879, float2(0.0), isnan(_5879))).xy;
                float _264 = _262.x;
                float _266 = _262.y;
                float _268 = _266 + _264;
                float _270 = _268 * 0.5;
                bool _272 = _270 >= 0.89999997615814208984375;
                bool _274 = isnan(_270);
                bool _276 = _272 || _274;
                bool _278 = isnan(0.89999997615814208984375);
                bool _280 = _276 || _278;
                bool _282 = !_280;
                _250 = _266;
                _252 = 1.0;
                _254 = _270;
                if (!_282)
                {
                    float _284 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _286 = _258 + _284;
                    float _288 = _260 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _5924 = float2(_286, _288);
                    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5924, float2(0.0), isnan(_5924))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5924, float2(0.0), isnan(_5924))).xy;
                    float _292 = _290.x;
                    float _294 = _290.y;
                    float _296 = _294 + _292;
                    float _298 = _296 * 0.5;
                    bool _300 = _298 >= 0.89999997615814208984375;
                    bool _302 = isnan(_298);
                    bool _304 = _300 || _302;
                    bool _306 = isnan(0.89999997615814208984375);
                    bool _308 = _304 || _306;
                    bool _310 = !_308;
                    _250 = _294;
                    _252 = 2.0;
                    _254 = _298;
                    if (!_310)
                    {
                        float _312 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _314 = _286 + _312;
                        float _316 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _5970 = float2(_314, _316);
                        float2 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5970, float2(0.0), isnan(_5970))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5970, float2(0.0), isnan(_5970))).xy;
                        float _320 = _318.x;
                        float _322 = _318.y;
                        float _324 = _322 + _320;
                        float _326 = _324 * 0.5;
                        bool _328 = _326 >= 0.89999997615814208984375;
                        bool _330 = isnan(_326);
                        bool _332 = _328 || _330;
                        bool _334 = isnan(0.89999997615814208984375);
                        bool _336 = _332 || _334;
                        bool _338 = !_336;
                        _250 = _322;
                        _252 = 3.0;
                        _254 = _326;
                        if (!_338)
                        {
                            float _340 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _342 = _314 + _340;
                            float _344 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float2 _6016 = float2(_342, _344);
                            float2 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6016, float2(0.0), isnan(_6016))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6016, float2(0.0), isnan(_6016))).xy;
                            float _348 = _346.x;
                            float _350 = _346.y;
                            float _352 = _350 + _348;
                            float _354 = _352 * 0.5;
                            bool _356 = _354 >= 0.89999997615814208984375;
                            bool _358 = isnan(_354);
                            bool _360 = _356 || _358;
                            bool _362 = isnan(0.89999997615814208984375);
                            bool _364 = _360 || _362;
                            bool _366 = !_364;
                            _250 = _350;
                            _252 = 4.0;
                            _254 = _354;
                            if (!_366)
                            {
                                float _368 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _370 = _342 + _368;
                                float _372 = _344 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float2 _6062 = float2(_370, _372);
                                float2 _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6062, float2(0.0), isnan(_6062))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6062, float2(0.0), isnan(_6062))).xy;
                                float _376 = _374.x;
                                float _378 = _374.y;
                                float _380 = _378 + _376;
                                float _382 = _380 * 0.5;
                                bool _384 = _382 >= 0.89999997615814208984375;
                                bool _386 = isnan(_382);
                                bool _388 = _384 || _386;
                                bool _390 = isnan(0.89999997615814208984375);
                                bool _392 = _388 || _390;
                                bool _394 = !_392;
                                _250 = _378;
                                _252 = 5.0;
                                _254 = _382;
                                if (!_394)
                                {
                                    float _396 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _398 = _370 + _396;
                                    float _400 = _372 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float2 _6108 = float2(_398, _400);
                                    float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6108, float2(0.0), isnan(_6108))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6108, float2(0.0), isnan(_6108))).xy;
                                    float _404 = _402.x;
                                    float _406 = _402.y;
                                    float _408 = _406 + _404;
                                    float _410 = _408 * 0.5;
                                    bool _412 = _410 >= 0.89999997615814208984375;
                                    bool _414 = isnan(_410);
                                    bool _416 = _412 || _414;
                                    bool _418 = isnan(0.89999997615814208984375);
                                    bool _420 = _416 || _418;
                                    bool _422 = !_420;
                                    _250 = _406;
                                    _252 = 6.0;
                                    _254 = _410;
                                    if (!_422)
                                    {
                                        float _424 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                        float _426 = _398 + _424;
                                        float _428 = _400 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                        float2 _6154 = float2(_426, _428);
                                        float2 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6154, float2(0.0), isnan(_6154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6154, float2(0.0), isnan(_6154))).xy;
                                        float _432 = _430.x;
                                        float _434 = _430.y;
                                        float _436 = _434 + _432;
                                        float _438 = _436 * 0.5;
                                        bool _440 = _438 >= 0.89999997615814208984375;
                                        bool _442 = isnan(_438);
                                        bool _444 = _440 || _442;
                                        bool _446 = isnan(0.89999997615814208984375);
                                        bool _448 = _444 || _446;
                                        _250 = _434;
                                        _254 = _438;
                                        if (!_448)
                                        {
                                            _252 = 7.0;
                                            _450 = true;
                                        }
                                        else
                                        {
                                            _252 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _450 = false;
            float _452 = _250;
            float _454 = _252;
            float _456 = _254;
            bool _458 = _452 >= 0.89999997615814208984375;
            bool _460 = isnan(_452);
            bool _462 = _458 || _460;
            bool _464 = isnan(0.89999997615814208984375);
            bool _466 = _462 || _464;
            float _468 = float(_466);
            float _470 = _468 + _454;
            _214 = _470;
            _220 = _456;
        }
        float _472 = _214;
        float _474 = _220;
        float _476 = _65 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _478 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _480 = _67 + _478;
        float2 _6232 = float2(_476, _480);
        float2 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6232, float2(0.0), isnan(_6232))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6232, float2(0.0), isnan(_6232))).xy;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _484 + _486;
        float _490 = _488 * 0.5;
        bool _492 = _490 >= 0.89999997615814208984375;
        bool _494 = isnan(_490);
        bool _496 = _492 || _494;
        bool _498 = isnan(0.89999997615814208984375);
        bool _500 = _496 || _498;
        bool _502 = !_500;
        float _504 = 0.0;
        float _506 = _490;
        float _508 = _486;
        if (!_502)
        {
            float _510 = _476 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _512 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _514 = _480 + _512;
            float2 _6277 = float2(_510, _514);
            float2 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6277, float2(0.0), isnan(_6277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6277, float2(0.0), isnan(_6277))).xy;
            float _518 = _516.x;
            float _520 = _516.y;
            float _522 = _520 + _518;
            float _524 = _522 * 0.5;
            bool _526 = _524 >= 0.89999997615814208984375;
            bool _528 = isnan(_524);
            bool _530 = _526 || _528;
            bool _532 = isnan(0.89999997615814208984375);
            bool _534 = _530 || _532;
            bool _536 = !_534;
            _504 = 1.0;
            _506 = _524;
            _508 = _514;
            if (!_536)
            {
                float _538 = _510 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _540 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _542 = _514 + _540;
                float2 _6322 = float2(_538, _542);
                float2 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6322, float2(0.0), isnan(_6322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6322, float2(0.0), isnan(_6322))).xy;
                float _546 = _544.x;
                float _548 = _544.y;
                float _550 = _548 + _546;
                float _552 = _550 * 0.5;
                bool _554 = _552 >= 0.89999997615814208984375;
                bool _556 = isnan(_552);
                bool _558 = _554 || _556;
                bool _560 = isnan(0.89999997615814208984375);
                bool _562 = _558 || _560;
                bool _564 = !_562;
                _504 = 2.0;
                _506 = _552;
                _508 = _542;
                if (!_564)
                {
                    float _566 = _538 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _568 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _570 = _542 + _568;
                    float2 _6367 = float2(_566, _570);
                    float2 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6367, float2(0.0), isnan(_6367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6367, float2(0.0), isnan(_6367))).xy;
                    float _574 = _572.x;
                    float _576 = _572.y;
                    float _578 = _576 + _574;
                    float _580 = _578 * 0.5;
                    bool _582 = _580 >= 0.89999997615814208984375;
                    bool _584 = isnan(_580);
                    bool _586 = _582 || _584;
                    bool _588 = isnan(0.89999997615814208984375);
                    bool _590 = _586 || _588;
                    bool _592 = !_590;
                    _504 = 3.0;
                    _506 = _580;
                    _508 = _570;
                    if (!_592)
                    {
                        float _594 = _566 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _596 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float _598 = _570 + _596;
                        float2 _6412 = float2(_594, _598);
                        float2 _600 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6412, float2(0.0), isnan(_6412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6412, float2(0.0), isnan(_6412))).xy;
                        float _602 = _600.x;
                        float _604 = _600.y;
                        float _606 = _604 + _602;
                        float _608 = _606 * 0.5;
                        bool _610 = _608 >= 0.89999997615814208984375;
                        bool _612 = isnan(_608);
                        bool _614 = _610 || _612;
                        bool _616 = isnan(0.89999997615814208984375);
                        bool _618 = _614 || _616;
                        bool _620 = !_618;
                        _504 = 4.0;
                        _506 = _608;
                        _508 = _598;
                        if (!_620)
                        {
                            float _622 = _594 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _624 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float _626 = _598 + _624;
                            float2 _6457 = float2(_622, _626);
                            float2 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6457, float2(0.0), isnan(_6457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6457, float2(0.0), isnan(_6457))).xy;
                            float _630 = _628.x;
                            float _632 = _628.y;
                            float _634 = _632 + _630;
                            float _636 = _634 * 0.5;
                            bool _638 = _636 >= 0.89999997615814208984375;
                            bool _640 = isnan(_636);
                            bool _642 = _638 || _640;
                            bool _644 = isnan(0.89999997615814208984375);
                            bool _646 = _642 || _644;
                            bool _648 = !_646;
                            _504 = 5.0;
                            _506 = _636;
                            _508 = _626;
                            if (!_648)
                            {
                                float _650 = _622 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _652 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float _654 = _626 + _652;
                                float2 _6502 = float2(_650, _654);
                                float2 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6502, float2(0.0), isnan(_6502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6502, float2(0.0), isnan(_6502))).xy;
                                float _658 = _656.x;
                                float _660 = _656.y;
                                float _662 = _660 + _658;
                                float _664 = _662 * 0.5;
                                bool _666 = _664 >= 0.89999997615814208984375;
                                bool _668 = isnan(_664);
                                bool _670 = _666 || _668;
                                bool _672 = isnan(0.89999997615814208984375);
                                bool _674 = _670 || _672;
                                bool _676 = !_674;
                                _504 = 6.0;
                                _506 = _664;
                                _508 = _654;
                                if (!_676)
                                {
                                    float _678 = _650 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _680 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float _682 = _654 + _680;
                                    float2 _6547 = float2(_678, _682);
                                    float2 _684 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6547, float2(0.0), isnan(_6547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6547, float2(0.0), isnan(_6547))).xy;
                                    float _686 = _684.x;
                                    float _688 = _684.y;
                                    float _690 = _688 + _686;
                                    float _692 = _690 * 0.5;
                                    bool _694 = _692 >= 0.89999997615814208984375;
                                    bool _696 = isnan(_692);
                                    bool _698 = _694 || _696;
                                    bool _700 = isnan(0.89999997615814208984375);
                                    bool _702 = _698 || _700;
                                    _506 = _692;
                                    _508 = _688;
                                    if (!_702)
                                    {
                                        _504 = 7.0;
                                        _704 = true;
                                    }
                                    else
                                    {
                                        _504 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _704 = false;
        float _706 = _504;
        float _708 = _506;
        float _710 = _508;
        float _712 = _472 + _706;
        bool _714 = _712 > 2.0;
        float _716 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 0.25, _65);
        float _718 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _720 = _716 + _718;
        float _722 = _712;
        float _724 = _710;
        float _726 = _708;
        float _728 = _716;
        if (!_714)
        {
            _722 = 0.0;
            _724 = 0.0;
        }
        float _730 = _722;
        float _732 = _724;
        bool _734 = !_714;
        float _736 = _730;
        float _738 = _732;
        if (!_734)
        {
            float _740 = -_472;
            float _742 = _740 + 0.25;
            float _744 = -_706;
            float _746 = _744 + (-0.25);
            float _748 = fma(_472, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _750 = fma(_706, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _752 = fma(_742, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _754 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _6655 = float2(_752, _748);
            float2 _756 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6655, float2(0.0), isnan(_6655)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6655, float2(0.0), isnan(_6655)), int2(-1, 0)).xy;
            float _758 = _756.x;
            float _760 = _756.y;
            float2 _6670 = float2(_750, _754);
            float2 _762 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6670, float2(0.0), isnan(_6670)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6670, float2(0.0), isnan(_6670)), int2(1, 0)).xy;
            float _764 = _762.x;
            float _766 = _762.y;
            bool _768 = _708 <= 0.89999997615814208984375;
            bool _770 = isnan(_708);
            bool _772 = _768 || _770;
            bool _774 = isnan(0.89999997615814208984375);
            bool _776 = _772 || _774;
            float _778 = float(_776);
            float _780 = fma(_764, 5.0, -3.75);
            float _782 = rint(_760);
            float _784 = abs(_780);
            float _786 = _764 * _784;
            float _788 = fma(_758, 5.0, -3.75);
            float _790 = abs(_788);
            float _792 = _758 * _790;
            float _794 = rint(_766);
            bool _796 = _474 <= 0.89999997615814208984375;
            bool _798 = isnan(_474);
            bool _800 = _796 || _798;
            bool _802 = isnan(0.89999997615814208984375);
            bool _804 = _800 || _802;
            float _806 = float(_804);
            float _808 = rint(_786);
            float _810 = rint(_792);
            float _812 = fma(_794, 2.0, _808);
            float _814 = _812 * _778;
            float _816 = fma(_782, 2.0, _810);
            float _818 = fma(_814, 20.0, _706);
            float _820 = _816 * _806;
            float _822 = fma(_818, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _824 = fma(_820, 20.0, _472);
            float _826 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 0.14285714924335479736328125, _822);
            float _828 = fma(_824, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _830 = _828 + 0.5;
            float2 _6766 = float2(_830, _826);
            float2 _832 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_6766, float2(0.0), isnan(_6766))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_6766, float2(0.0), isnan(_6766))).xy;
            float _834 = _832.x;
            float _836 = _832.y;
            _726 = _826;
            _736 = _834;
            _738 = _836;
        }
        float _838 = _726;
        float _840 = _736;
        float _842 = _738;
        float2 _6785 = float2(_720, _480);
        float2 _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6785, float2(0.0), isnan(_6785))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6785, float2(0.0), isnan(_6785))).xy;
        float _846 = _844.x;
        float _848 = _844.y;
        float _850 = fma(_846, 5.0, -3.75);
        float _852 = rint(_848);
        float _854 = abs(_850);
        float _856 = _846 * _854;
        float _858 = rint(_856);
        float _860 = _858 + _852;
        float _862 = _860 * 0.5;
        bool _864 = _862 >= 0.89999997615814208984375;
        bool _866 = isnan(_862);
        bool _868 = _864 || _866;
        bool _870 = isnan(0.89999997615814208984375);
        bool _872 = _868 || _870;
        bool _874 = !_872;
        float _876 = 0.0;
        int _878 = as_type<int>(_846);
        int _880 = as_type<int>(_848);
        float _882 = _858;
        float _884 = _862;
        float _886 = _838;
        int _888 = 1084227584;
        int _890 = 1084227584;
        float _892 = _842;
        float _894 = _840;
        int _1174;
        int _1176;
        float _1178;
        float _1180;
        if (!_874)
        {
            float _896 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _898 = _720 + _896;
            float _900 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _902 = _480 + _900;
            float2 _6851 = float2(_898, _902);
            float2 _904 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6851, float2(0.0), isnan(_6851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6851, float2(0.0), isnan(_6851))).xy;
            float _906 = _904.x;
            float _908 = _904.y;
            float _910 = fma(_906, 5.0, -3.75);
            float _912 = rint(_908);
            float _914 = abs(_910);
            float _916 = _906 * _914;
            float _918 = rint(_916);
            float _920 = _918 + _912;
            float _922 = _920 * 0.5;
            bool _924 = _922 >= 0.89999997615814208984375;
            bool _926 = isnan(_922);
            bool _928 = _924 || _926;
            bool _930 = isnan(0.89999997615814208984375);
            bool _932 = _928 || _930;
            bool _934 = !_932;
            _876 = 1.0;
            _878 = as_type<int>(_906);
            _880 = as_type<int>(_908);
            _882 = _918;
            _884 = _922;
            if (!_934)
            {
                float _936 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _938 = _898 + _936;
                float _940 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _942 = _902 + _940;
                float2 _6913 = float2(_938, _942);
                float2 _944 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6913, float2(0.0), isnan(_6913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6913, float2(0.0), isnan(_6913))).xy;
                float _946 = _944.x;
                float _948 = _944.y;
                float _950 = fma(_946, 5.0, -3.75);
                float _952 = rint(_948);
                float _954 = abs(_950);
                float _956 = _946 * _954;
                float _958 = rint(_956);
                float _960 = _958 + _952;
                float _962 = _960 * 0.5;
                bool _964 = _962 >= 0.89999997615814208984375;
                bool _966 = isnan(_962);
                bool _968 = _964 || _966;
                bool _970 = isnan(0.89999997615814208984375);
                bool _972 = _968 || _970;
                bool _974 = !_972;
                _876 = 2.0;
                _878 = as_type<int>(_946);
                _880 = as_type<int>(_948);
                _882 = _958;
                _884 = _962;
                if (!_974)
                {
                    float _976 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _978 = _938 + _976;
                    float _980 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _982 = _942 + _980;
                    float2 _6975 = float2(_978, _982);
                    float2 _984 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6975, float2(0.0), isnan(_6975))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6975, float2(0.0), isnan(_6975))).xy;
                    float _986 = _984.x;
                    float _988 = _984.y;
                    float _990 = fma(_986, 5.0, -3.75);
                    float _992 = rint(_988);
                    float _994 = abs(_990);
                    float _996 = _986 * _994;
                    float _998 = rint(_996);
                    float _1000 = _998 + _992;
                    float _1002 = _1000 * 0.5;
                    bool _1004 = _1002 >= 0.89999997615814208984375;
                    bool _1006 = isnan(_1002);
                    bool _1008 = _1004 || _1006;
                    bool _1010 = isnan(0.89999997615814208984375);
                    bool _1012 = _1008 || _1010;
                    bool _1014 = !_1012;
                    _876 = 3.0;
                    _878 = as_type<int>(_986);
                    _880 = as_type<int>(_988);
                    _882 = _998;
                    _884 = _1002;
                    if (!_1014)
                    {
                        float _1016 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _1018 = _978 + _1016;
                        float _1020 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float _1022 = _982 + _1020;
                        float2 _7037 = float2(_1018, _1022);
                        float2 _1024 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7037, float2(0.0), isnan(_7037))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7037, float2(0.0), isnan(_7037))).xy;
                        float _1026 = _1024.x;
                        float _1028 = _1024.y;
                        float _1030 = fma(_1026, 5.0, -3.75);
                        float _1032 = rint(_1028);
                        float _1034 = abs(_1030);
                        float _1036 = _1026 * _1034;
                        float _1038 = rint(_1036);
                        float _1040 = _1038 + _1032;
                        float _1042 = _1040 * 0.5;
                        bool _1044 = _1042 >= 0.89999997615814208984375;
                        bool _1046 = isnan(_1042);
                        bool _1048 = _1044 || _1046;
                        bool _1050 = isnan(0.89999997615814208984375);
                        bool _1052 = _1048 || _1050;
                        bool _1054 = !_1052;
                        _876 = 4.0;
                        _878 = as_type<int>(_1026);
                        _880 = as_type<int>(_1028);
                        _882 = _1038;
                        _884 = _1042;
                        if (!_1054)
                        {
                            float _1056 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _1058 = _1018 + _1056;
                            float _1060 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float _1062 = _1022 + _1060;
                            float2 _7099 = float2(_1058, _1062);
                            float2 _1064 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7099, float2(0.0), isnan(_7099))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7099, float2(0.0), isnan(_7099))).xy;
                            float _1066 = _1064.x;
                            float _1068 = _1064.y;
                            float _1070 = fma(_1066, 5.0, -3.75);
                            float _1072 = rint(_1068);
                            float _1074 = abs(_1070);
                            float _1076 = _1066 * _1074;
                            float _1078 = rint(_1076);
                            float _1080 = _1078 + _1072;
                            float _1082 = _1080 * 0.5;
                            bool _1084 = _1082 >= 0.89999997615814208984375;
                            bool _1086 = isnan(_1082);
                            bool _1088 = _1084 || _1086;
                            bool _1090 = isnan(0.89999997615814208984375);
                            bool _1092 = _1088 || _1090;
                            bool _1094 = !_1092;
                            _876 = 5.0;
                            _878 = as_type<int>(_1066);
                            _880 = as_type<int>(_1068);
                            _882 = _1078;
                            _884 = _1082;
                            if (!_1094)
                            {
                                float _1096 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _1098 = _1058 + _1096;
                                float _1100 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float _1102 = _1062 + _1100;
                                float2 _7161 = float2(_1098, _1102);
                                float2 _1104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7161, float2(0.0), isnan(_7161))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7161, float2(0.0), isnan(_7161))).xy;
                                float _1106 = _1104.x;
                                float _1108 = _1104.y;
                                float _1110 = fma(_1106, 5.0, -3.75);
                                float _1112 = rint(_1108);
                                float _1114 = abs(_1110);
                                float _1116 = _1106 * _1114;
                                float _1118 = rint(_1116);
                                float _1120 = _1118 + _1112;
                                float _1122 = _1120 * 0.5;
                                bool _1124 = _1122 >= 0.89999997615814208984375;
                                bool _1126 = isnan(_1122);
                                bool _1128 = _1124 || _1126;
                                bool _1130 = isnan(0.89999997615814208984375);
                                bool _1132 = _1128 || _1130;
                                bool _1134 = !_1132;
                                _876 = 6.0;
                                _878 = as_type<int>(_1106);
                                _880 = as_type<int>(_1108);
                                _882 = _1118;
                                _884 = _1122;
                                if (!_1134)
                                {
                                    float _1136 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float _1138 = _1102 + _1136;
                                    float _1140 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _1142 = _1098 + _1140;
                                    float2 _7223 = float2(_1142, _1138);
                                    float2 _1144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7223, float2(0.0), isnan(_7223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7223, float2(0.0), isnan(_7223))).xy;
                                    float _1146 = _1144.x;
                                    float _1148 = _1144.y;
                                    float _1150 = fma(_1146, 5.0, -3.75);
                                    float _1152 = rint(_1148);
                                    float _1154 = abs(_1150);
                                    float _1156 = _1146 * _1154;
                                    float _1158 = rint(_1156);
                                    float _1160 = _1158 + _1152;
                                    float _1162 = _1160 * 0.5;
                                    bool _1164 = _1162 >= 0.89999997615814208984375;
                                    bool _1166 = isnan(_1162);
                                    bool _1168 = _1164 || _1166;
                                    bool _1170 = isnan(0.89999997615814208984375);
                                    bool _1172 = _1168 || _1170;
                                    _878 = as_type<int>(_1146);
                                    _880 = as_type<int>(_1148);
                                    _882 = _1158;
                                    _884 = _1162;
                                    _1174 = as_type<int>(_1146);
                                    _1176 = as_type<int>(_1148);
                                    _1178 = _1158;
                                    _1180 = _1162;
                                    _1182 = _1172;
                                    if (!_1182)
                                    {
                                        _876 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        float _1194;
        if (!_1182)
        {
            float _1184 = _876;
            int _1186 = _878;
            int _1188 = _880;
            float _1190 = _882;
            float _1192 = _884;
            _1174 = _1186;
            _1176 = _1188;
            _1194 = _1184;
            _1178 = _1190;
            _1180 = _1192;
        }
        if (false || _1182)
        {
            _1182 = false;
            _1194 = 7.0;
        }
        int _1196 = _1174;
        int _1198 = _1176;
        float _1200 = _1194;
        float _1202 = _1178;
        float _1204 = _1180;
        float2 _7309 = float2(_65, _67);
        float _1206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7309, float2(0.0), isnan(_7309)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7309, float2(0.0), isnan(_7309)), int2(1, 0)).x;
        bool _1208 = _1206 > 0.0;
        float _1210 = _1202;
        int _1212 = _1196;
        int _1214 = _1198;
        _210 = _1200;
        if (!_1208)
        {
            _1210 = 0.0;
            _886 = 0.0;
        }
        float _1216 = _1210;
        float _1218 = _886;
        bool _1220 = !_1208;
        float _1222 = _1216;
        float _1224 = _1218;
        if (!_1220)
        {
            float _1226 = _716 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1228 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _7344 = float2(_1226, _1228);
            float2 _1230 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7344, float2(0.0), isnan(_7344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7344, float2(0.0), isnan(_7344))).xy;
            float _1232 = _1230.x;
            float _1234 = _1230.y;
            float _1236 = fma(_1232, 5.0, -3.75);
            float _1238 = rint(_1234);
            float _1240 = abs(_1236);
            float _1242 = _1232 * _1240;
            float _1244 = rint(_1242);
            float _1246 = _1244 + _1238;
            float _1248 = _1246 * 0.5;
            bool _1250 = _1248 >= 0.89999997615814208984375;
            bool _1252 = isnan(_1248);
            bool _1254 = _1250 || _1252;
            bool _1256 = isnan(0.89999997615814208984375);
            bool _1258 = _1254 || _1256;
            bool _1260 = !_1258;
            float _1262 = _1238;
            float _1264 = 0.0;
            float _1266 = _1248;
            int _1268 = as_type<int>(_1244);
            _728 = _1226;
            if (!_1260)
            {
                float _1270 = _1226 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _1272 = _1228 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _7401 = float2(_1270, _1272);
                float2 _1274 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7401, float2(0.0), isnan(_7401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7401, float2(0.0), isnan(_7401))).xy;
                float _1276 = _1274.x;
                float _1278 = _1274.y;
                float _1280 = fma(_1276, 5.0, -3.75);
                float _1282 = rint(_1278);
                float _1284 = abs(_1280);
                float _1286 = _1276 * _1284;
                float _1288 = rint(_1286);
                float _1290 = _1288 + _1282;
                float _1292 = _1290 * 0.5;
                bool _1294 = _1292 >= 0.89999997615814208984375;
                bool _1296 = isnan(_1292);
                bool _1298 = _1294 || _1296;
                bool _1300 = isnan(0.89999997615814208984375);
                bool _1302 = _1298 || _1300;
                bool _1304 = !_1302;
                _1262 = _1282;
                _1264 = 1.0;
                _1266 = _1292;
                _1268 = as_type<int>(_1288);
                if (!_1304)
                {
                    float _1306 = _1270 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _1308 = _1272 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _7457 = float2(_1306, _1308);
                    float2 _1310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7457, float2(0.0), isnan(_7457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7457, float2(0.0), isnan(_7457))).xy;
                    float _1312 = _1310.x;
                    float _1314 = _1310.y;
                    float _1316 = fma(_1312, 5.0, -3.75);
                    float _1318 = rint(_1314);
                    float _1320 = abs(_1316);
                    float _1322 = _1312 * _1320;
                    float _1324 = rint(_1322);
                    float _1326 = _1324 + _1318;
                    float _1328 = _1326 * 0.5;
                    bool _1330 = _1328 >= 0.89999997615814208984375;
                    bool _1332 = isnan(_1328);
                    bool _1334 = _1330 || _1332;
                    bool _1336 = isnan(0.89999997615814208984375);
                    bool _1338 = _1334 || _1336;
                    bool _1340 = !_1338;
                    _1262 = _1318;
                    _1264 = 2.0;
                    _1266 = _1328;
                    _1268 = as_type<int>(_1324);
                    if (!_1340)
                    {
                        float _1342 = _1306 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _1344 = _1308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _7513 = float2(_1342, _1344);
                        float2 _1346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7513, float2(0.0), isnan(_7513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7513, float2(0.0), isnan(_7513))).xy;
                        float _1348 = _1346.x;
                        float _1350 = _1346.y;
                        float _1352 = fma(_1348, 5.0, -3.75);
                        float _1354 = rint(_1350);
                        float _1356 = abs(_1352);
                        float _1358 = _1348 * _1356;
                        float _1360 = rint(_1358);
                        float _1362 = _1360 + _1354;
                        float _1364 = _1362 * 0.5;
                        bool _1366 = _1364 >= 0.89999997615814208984375;
                        bool _1368 = isnan(_1364);
                        bool _1370 = _1366 || _1368;
                        bool _1372 = isnan(0.89999997615814208984375);
                        bool _1374 = _1370 || _1372;
                        bool _1376 = !_1374;
                        _1262 = _1354;
                        _1264 = 3.0;
                        _1266 = _1364;
                        _1268 = as_type<int>(_1360);
                        if (!_1376)
                        {
                            float _1378 = _1342 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _1380 = _1344 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float2 _7569 = float2(_1378, _1380);
                            float2 _1382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7569, float2(0.0), isnan(_7569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7569, float2(0.0), isnan(_7569))).xy;
                            float _1384 = _1382.x;
                            float _1386 = _1382.y;
                            float _1388 = fma(_1384, 5.0, -3.75);
                            float _1390 = rint(_1386);
                            float _1392 = abs(_1388);
                            float _1394 = _1384 * _1392;
                            float _1396 = rint(_1394);
                            float _1398 = _1396 + _1390;
                            float _1400 = _1398 * 0.5;
                            bool _1402 = _1400 >= 0.89999997615814208984375;
                            bool _1404 = isnan(_1400);
                            bool _1406 = _1402 || _1404;
                            bool _1408 = isnan(0.89999997615814208984375);
                            bool _1410 = _1406 || _1408;
                            bool _1412 = !_1410;
                            _1262 = _1390;
                            _1264 = 4.0;
                            _1266 = _1400;
                            _1268 = as_type<int>(_1396);
                            if (!_1412)
                            {
                                float _1414 = _1378 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _1416 = _1380 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float2 _7625 = float2(_1414, _1416);
                                float2 _1418 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7625, float2(0.0), isnan(_7625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7625, float2(0.0), isnan(_7625))).xy;
                                float _1420 = _1418.x;
                                float _1422 = _1418.y;
                                float _1424 = fma(_1420, 5.0, -3.75);
                                float _1426 = rint(_1422);
                                float _1428 = abs(_1424);
                                float _1430 = _1420 * _1428;
                                float _1432 = rint(_1430);
                                float _1434 = _1432 + _1426;
                                float _1436 = _1434 * 0.5;
                                bool _1438 = _1436 >= 0.89999997615814208984375;
                                bool _1440 = isnan(_1436);
                                bool _1442 = _1438 || _1440;
                                bool _1444 = isnan(0.89999997615814208984375);
                                bool _1446 = _1442 || _1444;
                                bool _1448 = !_1446;
                                _1262 = _1426;
                                _1264 = 5.0;
                                _1266 = _1436;
                                _1268 = as_type<int>(_1432);
                                if (!_1448)
                                {
                                    float _1450 = _1414 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _1452 = _1416 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float2 _7681 = float2(_1450, _1452);
                                    float2 _1454 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7681, float2(0.0), isnan(_7681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7681, float2(0.0), isnan(_7681))).xy;
                                    float _1456 = _1454.x;
                                    float _1458 = _1454.y;
                                    float _1460 = fma(_1456, 5.0, -3.75);
                                    float _1462 = rint(_1458);
                                    float _1464 = abs(_1460);
                                    float _1466 = _1456 * _1464;
                                    float _1468 = rint(_1466);
                                    float _1470 = _1468 + _1462;
                                    float _1472 = _1470 * 0.5;
                                    bool _1474 = _1472 >= 0.89999997615814208984375;
                                    bool _1476 = isnan(_1472);
                                    bool _1478 = _1474 || _1476;
                                    bool _1480 = isnan(0.89999997615814208984375);
                                    bool _1482 = _1478 || _1480;
                                    bool _1484 = !_1482;
                                    _1262 = _1462;
                                    _1264 = 6.0;
                                    _1266 = _1472;
                                    _1268 = as_type<int>(_1468);
                                    if (!_1484)
                                    {
                                        float _1486 = _1450 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                        float _1488 = _1452 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                        float2 _7737 = float2(_1486, _1488);
                                        float2 _1490 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7737, float2(0.0), isnan(_7737))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7737, float2(0.0), isnan(_7737))).xy;
                                        float _1492 = _1490.x;
                                        float _1494 = _1490.y;
                                        float _1496 = fma(_1492, 5.0, -3.75);
                                        float _1498 = rint(_1494);
                                        float _1500 = abs(_1496);
                                        float _1502 = _1492 * _1500;
                                        float _1504 = rint(_1502);
                                        float _1506 = _1504 + _1498;
                                        float _1508 = _1506 * 0.5;
                                        bool _1510 = _1508 >= 0.89999997615814208984375;
                                        bool _1512 = isnan(_1508);
                                        bool _1514 = _1510 || _1512;
                                        bool _1516 = isnan(0.89999997615814208984375);
                                        bool _1518 = _1514 || _1516;
                                        _1262 = _1498;
                                        _1266 = _1508;
                                        _888 = as_type<int>(_1504);
                                        _1268 = as_type<int>(_1492);
                                        if (!_1518)
                                        {
                                            _1264 = 7.0;
                                            _1520 = true;
                                        }
                                        else
                                        {
                                            _1264 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _1520 = false;
            float _1522 = _1262;
            float _1524 = _1264;
            float _1526 = _1266;
            int _1528 = _888;
            int _1530 = _1268;
            bool _1532 = _1522 >= 0.89999997615814208984375;
            bool _1534 = isnan(_1522);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan(0.89999997615814208984375);
            bool _1540 = _1536 || _1538;
            float _1542 = float(_1540);
            float _1544 = _1542 + _1524;
            _1222 = _1544;
            _1224 = _1526;
            _890 = _1528;
            _1212 = _1530;
            _1214 = as_type<int>(_1522);
        }
        float _1546 = _1222;
        float _1548 = _1224;
        float _1550 = _728;
        int _1552 = _890;
        int _1554 = _1212;
        int _1556 = _1214;
        float _1558 = _1200 + _1546;
        bool _1560 = _1558 > 2.0;
        bool _1562 = !_1560;
        float _1564 = _1550;
        int _1566 = _1552;
        int _1568 = _1554;
        int _1570 = _1556;
        int _1572 = as_type<int>(_1558);
        if (!_1562)
        {
            float _1574 = fma(_1546, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1576 = fma(_1546, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _1578 = -_1200;
            float _1580 = fma(_1578, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1582 = -_1200;
            float _1584 = fma(_1582, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _7868 = float2(_1574, _1576);
            float2 _1586 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7868, float2(0.0), isnan(_7868)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7868, float2(0.0), isnan(_7868)), int2(1, 0)).xy;
            float _1588 = _1586.x;
            float _1590 = _1586.y;
            float2 _7880 = float2(_1580, _1584);
            float _1592 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7880, float2(0.0), isnan(_7880)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7880, float2(0.0), isnan(_7880)), int2(-1, 0)).y;
            float2 _7888 = float2(_1580, _1584);
            float _1594 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7888, float2(0.0), isnan(_7888)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7888, float2(0.0), isnan(_7888)), int2(0, -1)).x;
            bool _1596 = _1548 >= 0.89999997615814208984375;
            bool _1598 = isnan(_1548);
            bool _1600 = _1596 || _1598;
            bool _1602 = isnan(0.89999997615814208984375);
            bool _1604 = _1600 || _1602;
            float _1606 = float(_1604);
            bool _1608 = _1204 >= 0.89999997615814208984375;
            bool _1610 = isnan(_1204);
            bool _1612 = _1608 || _1610;
            bool _1614 = isnan(0.89999997615814208984375);
            bool _1616 = _1612 || _1614;
            float _1618 = float(_1616);
            float _1620 = fma(_1590, 2.0, _1588);
            float _1622 = fma(_1592, 2.0, _1594);
            float _1624 = _1620 * _1606;
            float _1626 = _1622 * _1618;
            float _1628 = fma(_1624, 20.0, _1546);
            float _1630 = fma(_1626, 20.0, _1200);
            float _1632 = fma(_1628, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _1634 = fma(_1630, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _1636 = fma((*spvDescriptorSet0.fp_c3)._m0[3].w, 0.14285714924335479736328125, _1632);
            float _1638 = _1634 + 0.5;
            float2 _7951 = float2(_1638, _1636);
            float2 _1640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_7951, float2(0.0), isnan(_7951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_7951, float2(0.0), isnan(_7951))).xy;
            float _1642 = _1640.x;
            float _1644 = _1640.y;
            float _1646 = _1644 + _840;
            float _1648 = _1642 + _842;
            _892 = _1648;
            _894 = _1646;
            _1564 = _1638;
            _1566 = as_type<int>(_1644);
            _1568 = as_type<int>(_1588);
            _1570 = 1011666125;
            _1572 = as_type<int>(_1642);
        }
        float _1650 = _892;
        float _1652 = _894;
        float _1654 = _1564;
        int _1656 = _1566;
        int _1658 = _1568;
        int _1660 = _1570;
        int _1662 = _1572;
        float _1664 = -_1650;
        bool _1666 = _1652 != _1664;
        bool _1668 = isnan(_1652);
        bool _1670 = _1666 || _1668;
        bool _1672 = isnan(_1664);
        bool _1674 = _1670 || _1672;
        int _1676 = _1662;
        int _1678 = _1656;
        int _1680 = _1658;
        int _1682 = _1660;
        _182 = _1654;
        _200 = as_type<int>(_1652);
        _202 = as_type<int>(_1650);
        if (_1674)
        {
            _1676 = 0;
        }
        int _1684 = _1676;
        _208 = _1684;
        if (!_1674)
        {
            float2 _8019 = float2(_153, _143);
            float2 _1686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8019, float2(0.0), isnan(_8019))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8019, float2(0.0), isnan(_8019))).xy;
            float _1688 = _1686.x;
            float _1690 = _1686.y;
            float2 _8031 = float2(_139, _137);
            float2 _1692 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8031, float2(0.0), isnan(_8031))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8031, float2(0.0), isnan(_8031))).xy;
            float _1694 = _1692.x;
            float _1696 = _1692.y;
            float _1698 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _153);
            float _1700 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _139);
            bool _1702 = _1690 >= 0.800000011920928955078125;
            bool _1704 = isnan(_1690);
            bool _1706 = _1702 || _1704;
            bool _1708 = isnan(0.800000011920928955078125);
            bool _1710 = _1706 || _1708;
            bool _1712 = _1696 > 0.800000011920928955078125;
            bool _1714 = isnan(_1696);
            bool _1716 = _1712 || _1714;
            bool _1718 = isnan(0.800000011920928955078125);
            bool _1720 = _1716 || _1718;
            bool _1722 = _1688 != 0.0;
            bool _1724 = isnan(_1688);
            bool _1726 = _1722 || _1724;
            bool _1728 = isnan(0.0);
            bool _1730 = _1726 || _1728;
            bool _1732 = !_1710;
            bool _1734 = _1730 || _1732;
            bool _1736 = _1694 != 0.0;
            bool _1738 = isnan(_1694);
            bool _1740 = _1736 || _1738;
            bool _1742 = isnan(0.0);
            bool _1744 = _1740 || _1742;
            bool _1746 = !_1720;
            bool _1748 = _1744 || _1746;
            float _1750 = _1688;
            float _1752 = _1690;
            int _1754 = as_type<int>(_1698);
            float _1756 = _1700;
            if (!_1734)
            {
                float2 _8115 = float2(_1698, _143);
                float2 _1758 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8115, float2(0.0), isnan(_8115))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8115, float2(0.0), isnan(_8115))).xy;
                float _1760 = _1758.x;
                float _1762 = _1758.y;
                _1750 = _1760;
                _1752 = _1762;
            }
            float _1764 = _1750;
            float _1766 = _1752;
            float _1768 = _1694;
            float _1770 = _1696;
            if (!_1748)
            {
                float2 _8137 = float2(_1700, _137);
                float2 _1772 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8137, float2(0.0), isnan(_8137))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8137, float2(0.0), isnan(_8137))).xy;
                float _1774 = _1772.x;
                float _1776 = _1772.y;
                _1768 = _1774;
                _1770 = _1776;
            }
            float _1778 = _1768;
            float _1780 = _1770;
            if (_1734)
            {
                _1678 = 1;
            }
            int _1782 = _1678;
            int _1784 = _1782;
            if (!_1734)
            {
                _1784 = 0;
            }
            int _1786 = _1784;
            int _1788 = _1786;
            if (_1734)
            {
                _178 = _1698;
            }
            float _1790 = _178;
            float _1792 = _1790;
            if (!_1734)
            {
                float _1794 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1698);
                _1792 = _1794;
            }
            float _1796 = _1792;
            int _1798 = _1786 & 1;
            bool _1800 = _1798 != 0;
            float _1802 = _1796;
            if (_1800)
            {
                _1680 = _1786;
            }
            int _1804 = _1680;
            int _1806 = _1804;
            int _1808 = _1804;
            float _1810 = _1766;
            float _1812 = _1764;
            float _1814 = _1780;
            float _1816 = _1778;
            if (!_1800)
            {
                bool _1818 = _1766 >= 0.800000011920928955078125;
                bool _1820 = isnan(_1766);
                bool _1822 = _1818 || _1820;
                bool _1824 = isnan(0.800000011920928955078125);
                bool _1826 = _1822 || _1824;
                bool _1828 = _1764 != 0.0;
                bool _1830 = isnan(_1764);
                bool _1832 = _1828 || _1830;
                bool _1834 = isnan(0.0);
                bool _1836 = _1832 || _1834;
                bool _1838 = !_1826;
                bool _1840 = _1836 || _1838;
                if (_1840)
                {
                    _1806 = 1;
                }
                int _1842 = _1806;
                _1808 = _1842;
                if (!_1840)
                {
                    float2 _8235 = float2(_1796, _143);
                    float2 _1844 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8235, float2(0.0), isnan(_8235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8235, float2(0.0), isnan(_8235))).xy;
                    float _1846 = _1844.x;
                    float _1848 = _1844.y;
                    float _1850 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1796);
                    _1808 = _1786;
                    _1810 = _1848;
                    _1812 = _1846;
                    _1802 = _1850;
                }
            }
            int _1852 = _1808;
            float _1854 = _1810;
            float _1856 = _1812;
            float _1858 = _1802;
            int _1860 = _1852 & 1;
            bool _1862 = _1860 != 0;
            float _1864 = _1854;
            float _1866 = _1856;
            float _1868 = _1858;
            float _1870 = as_type<float>(_1852);
            if (_1862)
            {
                _1788 = _1852;
            }
            int _1872 = _1788;
            int _1874 = _1872;
            int _1876 = _1872;
            if (!_1862)
            {
                bool _1878 = _1854 >= 0.800000011920928955078125;
                bool _1880 = isnan(_1854);
                bool _1882 = _1878 || _1880;
                bool _1884 = isnan(0.800000011920928955078125);
                bool _1886 = _1882 || _1884;
                bool _1888 = _1856 != 0.0;
                bool _1890 = isnan(_1856);
                bool _1892 = _1888 || _1890;
                bool _1894 = isnan(0.0);
                bool _1896 = _1892 || _1894;
                bool _1898 = !_1886;
                bool _1900 = _1896 || _1898;
                if (_1900)
                {
                    _1874 = 1;
                }
                int _1902 = _1874;
                _1876 = _1902;
                if (!_1900)
                {
                    float2 _8315 = float2(_1858, _143);
                    float2 _1904 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8315, float2(0.0), isnan(_8315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8315, float2(0.0), isnan(_8315))).xy;
                    float _1906 = _1904.x;
                    float _1908 = _1904.y;
                    float _1910 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1858);
                    _1876 = _1852;
                    _1864 = _1908;
                    _1866 = _1906;
                    _1868 = _1910;
                }
            }
            int _1912 = _1876;
            float _1914 = _1864;
            float _1916 = _1866;
            float _1918 = _1868;
            int _1920 = _1912 & 1;
            bool _1922 = _1920 != 0;
            float _1924 = _1914;
            float _1926 = _1916;
            float _1928 = _1918;
            int _1930 = _1912;
            if (_1922)
            {
                _1754 = _1912;
            }
            int _1932 = _1754;
            int _1934 = _1932;
            int _1936 = _1932;
            if (!_1922)
            {
                bool _1938 = _1914 >= 0.800000011920928955078125;
                bool _1940 = isnan(_1914);
                bool _1942 = _1938 || _1940;
                bool _1944 = isnan(0.800000011920928955078125);
                bool _1946 = _1942 || _1944;
                bool _1948 = _1916 != 0.0;
                bool _1950 = isnan(_1916);
                bool _1952 = _1948 || _1950;
                bool _1954 = isnan(0.0);
                bool _1956 = _1952 || _1954;
                bool _1958 = !_1946;
                bool _1960 = _1956 || _1958;
                if (_1960)
                {
                    _1934 = 1;
                }
                int _1962 = _1934;
                _1936 = _1962;
                if (!_1960)
                {
                    float2 _8394 = float2(_1918, _143);
                    float2 _1964 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8394, float2(0.0), isnan(_8394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8394, float2(0.0), isnan(_8394))).xy;
                    float _1966 = _1964.x;
                    float _1968 = _1964.y;
                    float _1970 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1918);
                    _1936 = _1912;
                    _1924 = _1968;
                    _1926 = _1966;
                    _1928 = _1970;
                }
            }
            int _1972 = _1936;
            float _1974 = _1924;
            float _1976 = _1926;
            float _1978 = _1928;
            int _1980 = _1972 & 1;
            bool _1982 = _1980 != 0;
            float _1984 = _1974;
            float _1986 = _1976;
            float _1988 = _1978;
            int _1990 = _1972;
            if (_1982)
            {
                _1930 = _1972;
            }
            int _1992 = _1930;
            int _1994 = _1992;
            int _1996 = _1992;
            if (!_1982)
            {
                bool _1998 = _1974 >= 0.800000011920928955078125;
                bool _2000 = isnan(_1974);
                bool _2002 = _1998 || _2000;
                bool _2004 = isnan(0.800000011920928955078125);
                bool _2006 = _2002 || _2004;
                bool _2008 = _1976 != 0.0;
                bool _2010 = isnan(_1976);
                bool _2012 = _2008 || _2010;
                bool _2014 = isnan(0.0);
                bool _2016 = _2012 || _2014;
                bool _2018 = !_2006;
                bool _2020 = _2016 || _2018;
                if (_2020)
                {
                    _1994 = 1;
                }
                int _2022 = _1994;
                _1996 = _2022;
                if (!_2020)
                {
                    float2 _8473 = float2(_1978, _143);
                    float2 _2024 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8473, float2(0.0), isnan(_8473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8473, float2(0.0), isnan(_8473))).xy;
                    float _2026 = _2024.x;
                    float _2028 = _2024.y;
                    float _2030 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1978);
                    _1996 = _1972;
                    _1984 = _2028;
                    _1986 = _2026;
                    _1988 = _2030;
                }
            }
            int _2032 = _1996;
            float _2034 = _1984;
            float _2036 = _1986;
            float _2038 = _1988;
            int _2040 = _2032 & 1;
            bool _2042 = _2040 != 0;
            float _2044 = _2034;
            float _2046 = _2036;
            float _2048 = _2038;
            int _2050 = _2032;
            if (_2042)
            {
                _1990 = _2032;
            }
            int _2052 = _1990;
            int _2054 = _2052;
            int _2056 = _2052;
            if (!_2042)
            {
                bool _2058 = _2034 >= 0.800000011920928955078125;
                bool _2060 = isnan(_2034);
                bool _2062 = _2058 || _2060;
                bool _2064 = isnan(0.800000011920928955078125);
                bool _2066 = _2062 || _2064;
                bool _2068 = _2036 != 0.0;
                bool _2070 = isnan(_2036);
                bool _2072 = _2068 || _2070;
                bool _2074 = isnan(0.0);
                bool _2076 = _2072 || _2074;
                bool _2078 = !_2066;
                bool _2080 = _2076 || _2078;
                if (_2080)
                {
                    _2054 = 1;
                }
                int _2082 = _2054;
                _2056 = _2082;
                if (!_2080)
                {
                    float2 _8552 = float2(_2038, _143);
                    float2 _2084 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8552, float2(0.0), isnan(_8552))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8552, float2(0.0), isnan(_8552))).xy;
                    float _2086 = _2084.x;
                    float _2088 = _2084.y;
                    float _2090 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2038);
                    _2056 = _2032;
                    _2044 = _2088;
                    _2046 = _2086;
                    _2048 = _2090;
                }
            }
            int _2092 = _2056;
            float _2094 = _2044;
            float _2096 = _2046;
            float _2098 = _2048;
            int _2100 = _2092 & 1;
            bool _2102 = _2100 != 0;
            float _2104 = _2094;
            float _2106 = _2096;
            float _2108 = _2098;
            int _2110 = _2092;
            if (_2102)
            {
                _2050 = _2092;
            }
            int _2112 = _2050;
            int _2114 = _2112;
            int _2116 = _2112;
            if (!_2102)
            {
                bool _2118 = _2094 >= 0.800000011920928955078125;
                bool _2120 = isnan(_2094);
                bool _2122 = _2118 || _2120;
                bool _2124 = isnan(0.800000011920928955078125);
                bool _2126 = _2122 || _2124;
                bool _2128 = _2096 != 0.0;
                bool _2130 = isnan(_2096);
                bool _2132 = _2128 || _2130;
                bool _2134 = isnan(0.0);
                bool _2136 = _2132 || _2134;
                bool _2138 = !_2126;
                bool _2140 = _2136 || _2138;
                if (_2140)
                {
                    _2114 = 1;
                }
                int _2142 = _2114;
                _2116 = _2142;
                if (!_2140)
                {
                    float2 _8631 = float2(_2098, _143);
                    float2 _2144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8631, float2(0.0), isnan(_8631))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8631, float2(0.0), isnan(_8631))).xy;
                    float _2146 = _2144.x;
                    float _2148 = _2144.y;
                    float _2150 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2098);
                    _2116 = _2092;
                    _2104 = _2148;
                    _2106 = _2146;
                    _2108 = _2150;
                }
            }
            int _2152 = _2116;
            float _2154 = _2104;
            float _2156 = _2106;
            float _2158 = _2108;
            int _2160 = _2152 & 1;
            bool _2162 = _2160 != 0;
            float _2164 = _2154;
            float _2166 = _2156;
            float _2168 = _2158;
            int _2170 = _2152;
            if (_2162)
            {
                _2110 = _2152;
            }
            int _2172 = _2110;
            int _2174 = _2172;
            int _2176 = _2172;
            if (!_2162)
            {
                bool _2178 = _2154 >= 0.800000011920928955078125;
                bool _2180 = isnan(_2154);
                bool _2182 = _2178 || _2180;
                bool _2184 = isnan(0.800000011920928955078125);
                bool _2186 = _2182 || _2184;
                bool _2188 = _2156 != 0.0;
                bool _2190 = isnan(_2156);
                bool _2192 = _2188 || _2190;
                bool _2194 = isnan(0.0);
                bool _2196 = _2192 || _2194;
                bool _2198 = !_2186;
                bool _2200 = _2196 || _2198;
                if (_2200)
                {
                    _2174 = 1;
                }
                int _2202 = _2174;
                _2176 = _2202;
                if (!_2200)
                {
                    float2 _8710 = float2(_2158, _143);
                    float2 _2204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8710, float2(0.0), isnan(_8710))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8710, float2(0.0), isnan(_8710))).xy;
                    float _2206 = _2204.x;
                    float _2208 = _2204.y;
                    float _2210 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2158);
                    _2176 = _2152;
                    _2164 = _2208;
                    _2166 = _2206;
                    _2168 = _2210;
                }
            }
            int _2212 = _2176;
            float _2214 = _2164;
            float _2216 = _2166;
            float _2218 = _2168;
            int _2220 = _2212 & 1;
            bool _2222 = _2220 != 0;
            float _2224 = _2214;
            float _2226 = _2216;
            float _2228 = _2218;
            int _2230 = _2212;
            if (_2222)
            {
                _2170 = _2212;
            }
            int _2232 = _2170;
            int _2234 = _2232;
            int _2236 = _2232;
            if (!_2222)
            {
                bool _2238 = _2214 >= 0.800000011920928955078125;
                bool _2240 = isnan(_2214);
                bool _2242 = _2238 || _2240;
                bool _2244 = isnan(0.800000011920928955078125);
                bool _2246 = _2242 || _2244;
                bool _2248 = _2216 != 0.0;
                bool _2250 = isnan(_2216);
                bool _2252 = _2248 || _2250;
                bool _2254 = isnan(0.0);
                bool _2256 = _2252 || _2254;
                bool _2258 = !_2246;
                bool _2260 = _2256 || _2258;
                if (_2260)
                {
                    _2234 = 1;
                }
                int _2262 = _2234;
                _2236 = _2262;
                if (!_2260)
                {
                    float2 _8789 = float2(_2218, _143);
                    float2 _2264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8789, float2(0.0), isnan(_8789))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8789, float2(0.0), isnan(_8789))).xy;
                    float _2266 = _2264.x;
                    float _2268 = _2264.y;
                    float _2270 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2218);
                    _2236 = _2212;
                    _2224 = _2268;
                    _2226 = _2266;
                    _2228 = _2270;
                }
            }
            int _2272 = _2236;
            float _2274 = _2224;
            float _2276 = _2226;
            float _2278 = _2228;
            int _2280 = _2272 & 1;
            bool _2282 = _2280 != 0;
            float _2284 = _2274;
            float _2286 = _2276;
            float _2288 = _2278;
            int _2290 = _2272;
            if (_2282)
            {
                _2230 = _2272;
            }
            int _2292 = _2230;
            int _2294 = _2292;
            int _2296 = _2292;
            if (!_2282)
            {
                bool _2298 = _2274 >= 0.800000011920928955078125;
                bool _2300 = isnan(_2274);
                bool _2302 = _2298 || _2300;
                bool _2304 = isnan(0.800000011920928955078125);
                bool _2306 = _2302 || _2304;
                bool _2308 = _2276 != 0.0;
                bool _2310 = isnan(_2276);
                bool _2312 = _2308 || _2310;
                bool _2314 = isnan(0.0);
                bool _2316 = _2312 || _2314;
                bool _2318 = !_2306;
                bool _2320 = _2316 || _2318;
                if (_2320)
                {
                    _2294 = 1;
                }
                int _2322 = _2294;
                _2296 = _2322;
                if (!_2320)
                {
                    float2 _8868 = float2(_2278, _143);
                    float2 _2324 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8868, float2(0.0), isnan(_8868))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8868, float2(0.0), isnan(_8868))).xy;
                    float _2326 = _2324.x;
                    float _2328 = _2324.y;
                    float _2330 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2278);
                    _2296 = _2272;
                    _2284 = _2328;
                    _2286 = _2326;
                    _2288 = _2330;
                }
            }
            int _2332 = _2296;
            float _2334 = _2284;
            float _2336 = _2286;
            float _2338 = _2288;
            int _2340 = _2332 & 1;
            bool _2342 = _2340 != 0;
            float _2344 = _2334;
            float _2346 = _2336;
            float _2348 = _2338;
            int _2350 = _2332;
            if (_2342)
            {
                _2290 = _2332;
            }
            int _2352 = _2290;
            int _2354 = _2352;
            int _2356 = _2352;
            if (!_2342)
            {
                bool _2358 = _2334 >= 0.800000011920928955078125;
                bool _2360 = isnan(_2334);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan(0.800000011920928955078125);
                bool _2366 = _2362 || _2364;
                bool _2368 = _2336 != 0.0;
                bool _2370 = isnan(_2336);
                bool _2372 = _2368 || _2370;
                bool _2374 = isnan(0.0);
                bool _2376 = _2372 || _2374;
                bool _2378 = !_2366;
                bool _2380 = _2376 || _2378;
                if (_2380)
                {
                    _2354 = 1;
                }
                int _2382 = _2354;
                _2356 = _2382;
                if (!_2380)
                {
                    float2 _8947 = float2(_2338, _143);
                    float2 _2384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8947, float2(0.0), isnan(_8947))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8947, float2(0.0), isnan(_8947))).xy;
                    float _2386 = _2384.x;
                    float _2388 = _2384.y;
                    float _2390 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2338);
                    _2356 = _2332;
                    _2344 = _2388;
                    _2346 = _2386;
                    _2348 = _2390;
                }
            }
            int _2392 = _2356;
            float _2394 = _2344;
            float _2396 = _2346;
            float _2398 = _2348;
            int _2400 = _2392 & 1;
            bool _2402 = _2400 != 0;
            float _2404 = _2394;
            float _2406 = _2396;
            float _2408 = _2398;
            int _2410 = _2392;
            if (_2402)
            {
                _2350 = _2392;
            }
            int _2412 = _2350;
            int _2414 = _2412;
            int _2416 = _2412;
            if (!_2402)
            {
                bool _2418 = _2394 >= 0.800000011920928955078125;
                bool _2420 = isnan(_2394);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan(0.800000011920928955078125);
                bool _2426 = _2422 || _2424;
                bool _2428 = _2396 != 0.0;
                bool _2430 = isnan(_2396);
                bool _2432 = _2428 || _2430;
                bool _2434 = isnan(0.0);
                bool _2436 = _2432 || _2434;
                bool _2438 = !_2426;
                bool _2440 = _2436 || _2438;
                if (_2440)
                {
                    _2414 = 1;
                }
                int _2442 = _2414;
                _2416 = _2442;
                if (!_2440)
                {
                    float2 _9026 = float2(_2398, _143);
                    float2 _2444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9026, float2(0.0), isnan(_9026))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9026, float2(0.0), isnan(_9026))).xy;
                    float _2446 = _2444.x;
                    float _2448 = _2444.y;
                    float _2450 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2398);
                    _2416 = _2392;
                    _2404 = _2448;
                    _2406 = _2446;
                    _2408 = _2450;
                }
            }
            int _2452 = _2416;
            float _2454 = _2404;
            float _2456 = _2406;
            float _2458 = _2408;
            int _2460 = _2452 & 1;
            bool _2462 = _2460 != 0;
            float _2464 = _2454;
            float _2466 = _2456;
            float _2468 = _2458;
            int _2470 = _2452;
            if (_2462)
            {
                _2410 = _2452;
            }
            int _2472 = _2410;
            int _2474 = _2472;
            int _2476 = _2472;
            if (!_2462)
            {
                bool _2478 = _2454 >= 0.800000011920928955078125;
                bool _2480 = isnan(_2454);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan(0.800000011920928955078125);
                bool _2486 = _2482 || _2484;
                bool _2488 = _2456 != 0.0;
                bool _2490 = isnan(_2456);
                bool _2492 = _2488 || _2490;
                bool _2494 = isnan(0.0);
                bool _2496 = _2492 || _2494;
                bool _2498 = !_2486;
                bool _2500 = _2496 || _2498;
                if (_2500)
                {
                    _2474 = 1;
                }
                int _2502 = _2474;
                _2476 = _2502;
                if (!_2500)
                {
                    float2 _9105 = float2(_2458, _143);
                    float2 _2504 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9105, float2(0.0), isnan(_9105))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9105, float2(0.0), isnan(_9105))).xy;
                    float _2506 = _2504.x;
                    float _2508 = _2504.y;
                    float _2510 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2458);
                    _2476 = _2452;
                    _2464 = _2508;
                    _2466 = _2506;
                    _2468 = _2510;
                }
            }
            int _2512 = _2476;
            float _2514 = _2464;
            float _2516 = _2466;
            float _2518 = _2468;
            int _2520 = _2512 & 1;
            bool _2522 = _2520 != 0;
            float _2524 = _2518;
            float _2526 = _2516;
            float _2528 = _2514;
            float _2530 = as_type<float>(_2512);
            if (_1748)
            {
                _1682 = 1;
            }
            int _2532 = _1682;
            int _2534 = _2532;
            if (!_1748)
            {
                _2534 = 0;
            }
            int _2536 = _2534;
            int _2538 = _2536 & 1;
            bool _2540 = _2538 != 0;
            if (_2522)
            {
                _2470 = _2512;
            }
            int _2542 = _2470;
            int _2544 = _2542;
            int _2546 = _2542;
            if (!_2522)
            {
                bool _2548 = _2514 >= 0.800000011920928955078125;
                bool _2550 = isnan(_2514);
                bool _2552 = _2548 || _2550;
                bool _2554 = isnan(0.800000011920928955078125);
                bool _2556 = _2552 || _2554;
                bool _2558 = _2516 != 0.0;
                bool _2560 = isnan(_2516);
                bool _2562 = _2558 || _2560;
                bool _2564 = isnan(0.0);
                bool _2566 = _2562 || _2564;
                bool _2568 = !_2556;
                bool _2570 = _2566 || _2568;
                if (_2570)
                {
                    _2544 = 1;
                }
                int _2572 = _2544;
                _2546 = _2572;
                if (!_2570)
                {
                    float2 _9199 = float2(_2518, _143);
                    float2 _2574 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9199, float2(0.0), isnan(_9199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9199, float2(0.0), isnan(_9199))).xy;
                    float _2576 = _2574.x;
                    float _2578 = _2574.y;
                    float _2580 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2518);
                    _2546 = _2512;
                    _2524 = _2580;
                    _2526 = _2576;
                    _2528 = _2578;
                }
            }
            int _2582 = _2546;
            float _2584 = _2524;
            float _2586 = _2526;
            float _2588 = _2528;
            int _2590 = _2582 & 1;
            bool _2592 = _2590 != 0;
            float _2594 = as_type<float>(_2582);
            int _2596 = as_type<int>(_2584);
            if (_1748)
            {
                _1870 = _1700;
            }
            float _2598 = _1870;
            float _2600 = _2598;
            if (!_1748)
            {
                float _2602 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _1700);
                _2600 = _2602;
            }
            float _2604 = _2600;
            float _2606 = _2604;
            if (_2592)
            {
                _2594 = _2584;
            }
            float _2608 = _2594;
            float _2610 = _2608;
            float _2612 = _2608;
            if (_2592)
            {
                _1756 = _2586;
            }
            float _2614 = _1756;
            float _2616 = _2614;
            float _2618 = _2614;
            if (_2592)
            {
                _2530 = _2588;
            }
            float _2620 = _2530;
            float _2622 = _2620;
            float _2624 = _2620;
            if (!_2592)
            {
                bool _2626 = _2588 >= 0.800000011920928955078125;
                bool _2628 = isnan(_2588);
                bool _2630 = _2626 || _2628;
                bool _2632 = isnan(0.800000011920928955078125);
                bool _2634 = _2630 || _2632;
                bool _2636 = _2586 != 0.0;
                bool _2638 = isnan(_2586);
                bool _2640 = _2636 || _2638;
                bool _2642 = isnan(0.0);
                bool _2644 = _2640 || _2642;
                bool _2646 = !_2634;
                bool _2648 = _2644 || _2646;
                if (_2648)
                {
                    _2616 = _2586;
                }
                float _2650 = _2616;
                _2618 = _2650;
                if (_2648)
                {
                    _2622 = _2588;
                }
                float _2652 = _2622;
                _2624 = _2652;
                if (_2648)
                {
                    _2610 = _2584;
                }
                float _2654 = _2610;
                _2612 = _2654;
                if (!_2648)
                {
                    float2 _9322 = float2(_2584, _143);
                    float2 _2656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9322, float2(0.0), isnan(_9322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9322, float2(0.0), isnan(_9322))).xy;
                    float _2658 = _2656.x;
                    float _2660 = _2656.y;
                    float _2662 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2584);
                    _2618 = _2658;
                    _2624 = _2660;
                    _2612 = _2662;
                }
            }
            float _2664 = _2618;
            float _2666 = _2624;
            float _2668 = _2612;
            if (_2540)
            {
                _2596 = _2536;
            }
            int _2670 = _2596;
            int _2672 = _2670;
            int _2674 = _2670;
            if (!_2540)
            {
                bool _2676 = _1780 > 0.800000011920928955078125;
                bool _2678 = isnan(_1780);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan(0.800000011920928955078125);
                bool _2684 = _2680 || _2682;
                bool _2686 = _1778 != 0.0;
                bool _2688 = isnan(_1778);
                bool _2690 = _2686 || _2688;
                bool _2692 = isnan(0.0);
                bool _2694 = _2690 || _2692;
                bool _2696 = !_2684;
                bool _2698 = _2694 || _2696;
                if (_2698)
                {
                    _2672 = 1;
                }
                int _2700 = _2672;
                _2674 = _2700;
                if (!_2698)
                {
                    float2 _9391 = float2(_2604, _137);
                    float2 _2702 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9391, float2(0.0), isnan(_9391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9391, float2(0.0), isnan(_9391))).xy;
                    float _2704 = _2702.x;
                    float _2706 = _2702.y;
                    float _2708 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2604);
                    _2674 = _2536;
                    _1814 = _2706;
                    _1816 = _2704;
                    _2606 = _2708;
                }
            }
            int _2710 = _2674;
            float _2712 = _1814;
            float _2714 = _1816;
            float _2716 = _2606;
            int _2718 = _2710 & 1;
            bool _2720 = _2718 != 0;
            float _2722 = _2712;
            float _2724 = _2714;
            float _2726 = _2716;
            int _2728 = _2710;
            if (_2720)
            {
                _180 = _2710;
            }
            int _2730 = _180;
            int _2732 = _2730;
            int _2734 = _2730;
            if (!_2720)
            {
                bool _2736 = _2712 > 0.800000011920928955078125;
                bool _2738 = isnan(_2712);
                bool _2740 = _2736 || _2738;
                bool _2742 = isnan(0.800000011920928955078125);
                bool _2744 = _2740 || _2742;
                bool _2746 = _2714 != 0.0;
                bool _2748 = isnan(_2714);
                bool _2750 = _2746 || _2748;
                bool _2752 = isnan(0.0);
                bool _2754 = _2750 || _2752;
                bool _2756 = !_2744;
                bool _2758 = _2754 || _2756;
                if (_2758)
                {
                    _2732 = 1;
                }
                int _2760 = _2732;
                _2734 = _2760;
                if (!_2758)
                {
                    float2 _9470 = float2(_2716, _137);
                    float2 _2762 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9470, float2(0.0), isnan(_9470))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9470, float2(0.0), isnan(_9470))).xy;
                    float _2764 = _2762.x;
                    float _2766 = _2762.y;
                    float _2768 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2716);
                    _2734 = _2710;
                    _2722 = _2766;
                    _2724 = _2764;
                    _2726 = _2768;
                }
            }
            int _2770 = _2734;
            float _2772 = _2722;
            float _2774 = _2724;
            float _2776 = _2726;
            int _2778 = _2770 & 1;
            bool _2780 = _2778 != 0;
            float _2782 = _2772;
            float _2784 = _2774;
            float _2786 = _2776;
            int _2788 = _2770;
            if (_2780)
            {
                _2728 = _2770;
            }
            int _2790 = _2728;
            int _2792 = _2790;
            int _2794 = _2790;
            if (!_2780)
            {
                bool _2796 = _2772 > 0.800000011920928955078125;
                bool _2798 = isnan(_2772);
                bool _2800 = _2796 || _2798;
                bool _2802 = isnan(0.800000011920928955078125);
                bool _2804 = _2800 || _2802;
                bool _2806 = _2774 != 0.0;
                bool _2808 = isnan(_2774);
                bool _2810 = _2806 || _2808;
                bool _2812 = isnan(0.0);
                bool _2814 = _2810 || _2812;
                bool _2816 = !_2804;
                bool _2818 = _2814 || _2816;
                if (_2818)
                {
                    _2792 = 1;
                }
                int _2820 = _2792;
                _2794 = _2820;
                if (!_2818)
                {
                    float2 _9549 = float2(_2776, _137);
                    float2 _2822 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9549, float2(0.0), isnan(_9549))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9549, float2(0.0), isnan(_9549))).xy;
                    float _2824 = _2822.x;
                    float _2826 = _2822.y;
                    float _2828 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2776);
                    _2794 = _2770;
                    _2782 = _2826;
                    _2784 = _2824;
                    _2786 = _2828;
                }
            }
            int _2830 = _2794;
            float _2832 = _2782;
            float _2834 = _2784;
            float _2836 = _2786;
            int _2838 = _2830 & 1;
            bool _2840 = _2838 != 0;
            float _2842 = _2832;
            float _2844 = _2834;
            float _2846 = _2836;
            int _2848 = _2830;
            if (_2840)
            {
                _2788 = _2830;
            }
            int _2850 = _2788;
            int _2852 = _2850;
            int _2854 = _2850;
            if (!_2840)
            {
                bool _2856 = _2832 > 0.800000011920928955078125;
                bool _2858 = isnan(_2832);
                bool _2860 = _2856 || _2858;
                bool _2862 = isnan(0.800000011920928955078125);
                bool _2864 = _2860 || _2862;
                bool _2866 = _2834 != 0.0;
                bool _2868 = isnan(_2834);
                bool _2870 = _2866 || _2868;
                bool _2872 = isnan(0.0);
                bool _2874 = _2870 || _2872;
                bool _2876 = !_2864;
                bool _2878 = _2874 || _2876;
                if (_2878)
                {
                    _2852 = 1;
                }
                int _2880 = _2852;
                _2854 = _2880;
                if (!_2878)
                {
                    float2 _9628 = float2(_2836, _137);
                    float2 _2882 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9628, float2(0.0), isnan(_9628))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9628, float2(0.0), isnan(_9628))).xy;
                    float _2884 = _2882.x;
                    float _2886 = _2882.y;
                    float _2888 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2836);
                    _2854 = _2830;
                    _2842 = _2886;
                    _2844 = _2884;
                    _2846 = _2888;
                }
            }
            int _2890 = _2854;
            float _2892 = _2842;
            float _2894 = _2844;
            float _2896 = _2846;
            int _2898 = _2890 & 1;
            bool _2900 = _2898 != 0;
            float _2902 = _2892;
            float _2904 = _2894;
            float _2906 = _2896;
            int _2908 = _2890;
            if (_2900)
            {
                _2848 = _2890;
            }
            int _2910 = _2848;
            int _2912 = _2910;
            int _2914 = _2910;
            if (!_2900)
            {
                bool _2916 = _2892 > 0.800000011920928955078125;
                bool _2918 = isnan(_2892);
                bool _2920 = _2916 || _2918;
                bool _2922 = isnan(0.800000011920928955078125);
                bool _2924 = _2920 || _2922;
                bool _2926 = _2894 != 0.0;
                bool _2928 = isnan(_2894);
                bool _2930 = _2926 || _2928;
                bool _2932 = isnan(0.0);
                bool _2934 = _2930 || _2932;
                bool _2936 = !_2924;
                bool _2938 = _2934 || _2936;
                if (_2938)
                {
                    _2912 = 1;
                }
                int _2940 = _2912;
                _2914 = _2940;
                if (!_2938)
                {
                    float2 _9707 = float2(_2896, _137);
                    float2 _2942 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9707, float2(0.0), isnan(_9707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9707, float2(0.0), isnan(_9707))).xy;
                    float _2944 = _2942.x;
                    float _2946 = _2942.y;
                    float _2948 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2896);
                    _2914 = _2890;
                    _2902 = _2946;
                    _2904 = _2944;
                    _2906 = _2948;
                }
            }
            int _2950 = _2914;
            float _2952 = _2902;
            float _2954 = _2904;
            float _2956 = _2906;
            int _2958 = _2950 & 1;
            bool _2960 = _2958 != 0;
            float _2962 = _2952;
            float _2964 = _2954;
            float _2966 = _2956;
            int _2968 = _2950;
            if (_2960)
            {
                _2908 = _2950;
            }
            int _2970 = _2908;
            int _2972 = _2970;
            int _2974 = _2970;
            if (!_2960)
            {
                bool _2976 = _2952 > 0.800000011920928955078125;
                bool _2978 = isnan(_2952);
                bool _2980 = _2976 || _2978;
                bool _2982 = isnan(0.800000011920928955078125);
                bool _2984 = _2980 || _2982;
                bool _2986 = _2954 != 0.0;
                bool _2988 = isnan(_2954);
                bool _2990 = _2986 || _2988;
                bool _2992 = isnan(0.0);
                bool _2994 = _2990 || _2992;
                bool _2996 = !_2984;
                bool _2998 = _2994 || _2996;
                if (_2998)
                {
                    _2972 = 1;
                }
                int _3000 = _2972;
                _2974 = _3000;
                if (!_2998)
                {
                    float2 _9786 = float2(_2956, _137);
                    float2 _3002 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9786, float2(0.0), isnan(_9786))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9786, float2(0.0), isnan(_9786))).xy;
                    float _3004 = _3002.x;
                    float _3006 = _3002.y;
                    float _3008 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2956);
                    _2974 = _2950;
                    _2962 = _3006;
                    _2964 = _3004;
                    _2966 = _3008;
                }
            }
            int _3010 = _2974;
            float _3012 = _2962;
            float _3014 = _2964;
            float _3016 = _2966;
            int _3018 = _3010 & 1;
            bool _3020 = _3018 != 0;
            float _3022 = _3012;
            float _3024 = _3014;
            float _3026 = _3016;
            int _3028 = _3010;
            if (_3020)
            {
                _2968 = _3010;
            }
            int _3030 = _2968;
            int _3032 = _3030;
            int _3034 = _3030;
            if (!_3020)
            {
                bool _3036 = _3012 > 0.800000011920928955078125;
                bool _3038 = isnan(_3012);
                bool _3040 = _3036 || _3038;
                bool _3042 = isnan(0.800000011920928955078125);
                bool _3044 = _3040 || _3042;
                bool _3046 = _3014 != 0.0;
                bool _3048 = isnan(_3014);
                bool _3050 = _3046 || _3048;
                bool _3052 = isnan(0.0);
                bool _3054 = _3050 || _3052;
                bool _3056 = !_3044;
                bool _3058 = _3054 || _3056;
                if (_3058)
                {
                    _3032 = 1;
                }
                int _3060 = _3032;
                _3034 = _3060;
                if (!_3058)
                {
                    float2 _9865 = float2(_3016, _137);
                    float2 _3062 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9865, float2(0.0), isnan(_9865))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9865, float2(0.0), isnan(_9865))).xy;
                    float _3064 = _3062.x;
                    float _3066 = _3062.y;
                    float _3068 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3016);
                    _3034 = _3010;
                    _3022 = _3066;
                    _3024 = _3064;
                    _3026 = _3068;
                }
            }
            int _3070 = _3034;
            float _3072 = _3022;
            float _3074 = _3024;
            float _3076 = _3026;
            int _3078 = _3070 & 1;
            bool _3080 = _3078 != 0;
            float _3082 = _3072;
            float _3084 = _3074;
            float _3086 = _3076;
            int _3088 = _3070;
            if (_3080)
            {
                _3028 = _3070;
            }
            int _3090 = _3028;
            int _3092 = _3090;
            int _3094 = _3090;
            if (!_3080)
            {
                bool _3096 = _3072 > 0.800000011920928955078125;
                bool _3098 = isnan(_3072);
                bool _3100 = _3096 || _3098;
                bool _3102 = isnan(0.800000011920928955078125);
                bool _3104 = _3100 || _3102;
                bool _3106 = _3074 != 0.0;
                bool _3108 = isnan(_3074);
                bool _3110 = _3106 || _3108;
                bool _3112 = isnan(0.0);
                bool _3114 = _3110 || _3112;
                bool _3116 = !_3104;
                bool _3118 = _3114 || _3116;
                if (_3118)
                {
                    _3092 = 1;
                }
                int _3120 = _3092;
                _3094 = _3120;
                if (!_3118)
                {
                    float2 _9944 = float2(_3076, _137);
                    float2 _3122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9944, float2(0.0), isnan(_9944))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9944, float2(0.0), isnan(_9944))).xy;
                    float _3124 = _3122.x;
                    float _3126 = _3122.y;
                    float _3128 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3076);
                    _3094 = _3070;
                    _3082 = _3126;
                    _3084 = _3124;
                    _3086 = _3128;
                }
            }
            int _3130 = _3094;
            float _3132 = _3082;
            float _3134 = _3084;
            float _3136 = _3086;
            int _3138 = _3130 & 1;
            bool _3140 = _3138 != 0;
            float _3142 = _3132;
            float _3144 = _3134;
            float _3146 = _3136;
            int _3148 = _3130;
            if (_3140)
            {
                _3088 = _3130;
            }
            int _3150 = _3088;
            int _3152 = _3150;
            int _3154 = _3150;
            if (!_3140)
            {
                bool _3156 = _3132 > 0.800000011920928955078125;
                bool _3158 = isnan(_3132);
                bool _3160 = _3156 || _3158;
                bool _3162 = isnan(0.800000011920928955078125);
                bool _3164 = _3160 || _3162;
                bool _3166 = _3134 != 0.0;
                bool _3168 = isnan(_3134);
                bool _3170 = _3166 || _3168;
                bool _3172 = isnan(0.0);
                bool _3174 = _3170 || _3172;
                bool _3176 = !_3164;
                bool _3178 = _3174 || _3176;
                if (_3178)
                {
                    _3152 = 1;
                }
                int _3180 = _3152;
                _3154 = _3180;
                if (!_3178)
                {
                    float2 _10023 = float2(_3136, _137);
                    float2 _3182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10023, float2(0.0), isnan(_10023))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10023, float2(0.0), isnan(_10023))).xy;
                    float _3184 = _3182.x;
                    float _3186 = _3182.y;
                    float _3188 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3136);
                    _3154 = _3130;
                    _3142 = _3186;
                    _3144 = _3184;
                    _3146 = _3188;
                }
            }
            int _3190 = _3154;
            float _3192 = _3142;
            float _3194 = _3144;
            float _3196 = _3146;
            int _3198 = _3190 & 1;
            bool _3200 = _3198 != 0;
            float _3202 = _3192;
            float _3204 = _3194;
            float _3206 = _3196;
            int _3208 = _3190;
            if (_3200)
            {
                _3148 = _3190;
            }
            int _3210 = _3148;
            int _3212 = _3210;
            int _3214 = _3210;
            if (!_3200)
            {
                bool _3216 = _3192 > 0.800000011920928955078125;
                bool _3218 = isnan(_3192);
                bool _3220 = _3216 || _3218;
                bool _3222 = isnan(0.800000011920928955078125);
                bool _3224 = _3220 || _3222;
                bool _3226 = _3194 != 0.0;
                bool _3228 = isnan(_3194);
                bool _3230 = _3226 || _3228;
                bool _3232 = isnan(0.0);
                bool _3234 = _3230 || _3232;
                bool _3236 = !_3224;
                bool _3238 = _3234 || _3236;
                if (_3238)
                {
                    _3212 = 1;
                }
                int _3240 = _3212;
                _3214 = _3240;
                if (!_3238)
                {
                    float2 _10102 = float2(_3196, _137);
                    float2 _3242 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10102, float2(0.0), isnan(_10102))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10102, float2(0.0), isnan(_10102))).xy;
                    float _3244 = _3242.x;
                    float _3246 = _3242.y;
                    float _3248 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3196);
                    _3214 = _3190;
                    _3202 = _3246;
                    _3204 = _3244;
                    _3206 = _3248;
                }
            }
            int _3250 = _3214;
            float _3252 = _3202;
            float _3254 = _3204;
            float _3256 = _3206;
            int _3258 = _3250 & 1;
            bool _3260 = _3258 != 0;
            float _3262 = _3252;
            float _3264 = _3254;
            float _3266 = _3256;
            int _3268 = _3250;
            if (_3260)
            {
                _3208 = _3250;
            }
            int _3270 = _3208;
            int _3272 = _3270;
            int _3274 = _3270;
            if (!_3260)
            {
                bool _3276 = _3252 > 0.800000011920928955078125;
                bool _3278 = isnan(_3252);
                bool _3280 = _3276 || _3278;
                bool _3282 = isnan(0.800000011920928955078125);
                bool _3284 = _3280 || _3282;
                bool _3286 = _3254 != 0.0;
                bool _3288 = isnan(_3254);
                bool _3290 = _3286 || _3288;
                bool _3292 = isnan(0.0);
                bool _3294 = _3290 || _3292;
                bool _3296 = !_3284;
                bool _3298 = _3294 || _3296;
                if (_3298)
                {
                    _3272 = 1;
                }
                int _3300 = _3272;
                _3274 = _3300;
                if (!_3298)
                {
                    float2 _10181 = float2(_3256, _137);
                    float2 _3302 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10181, float2(0.0), isnan(_10181))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10181, float2(0.0), isnan(_10181))).xy;
                    float _3304 = _3302.x;
                    float _3306 = _3302.y;
                    float _3308 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3256);
                    _3274 = _3250;
                    _3262 = _3306;
                    _3264 = _3304;
                    _3266 = _3308;
                }
            }
            int _3310 = _3274;
            float _3312 = _3262;
            float _3314 = _3264;
            float _3316 = _3266;
            int _3318 = _3310 & 1;
            bool _3320 = _3318 != 0;
            float _3322 = _3312;
            float _3324 = _3314;
            float _3326 = _3316;
            int _3328 = _3310;
            if (_3320)
            {
                _3268 = _3310;
            }
            int _3330 = _3268;
            int _3332 = _3330;
            int _3334 = _3330;
            if (!_3320)
            {
                bool _3336 = _3312 > 0.800000011920928955078125;
                bool _3338 = isnan(_3312);
                bool _3340 = _3336 || _3338;
                bool _3342 = isnan(0.800000011920928955078125);
                bool _3344 = _3340 || _3342;
                bool _3346 = _3314 != 0.0;
                bool _3348 = isnan(_3314);
                bool _3350 = _3346 || _3348;
                bool _3352 = isnan(0.0);
                bool _3354 = _3350 || _3352;
                bool _3356 = !_3344;
                bool _3358 = _3354 || _3356;
                if (_3358)
                {
                    _3332 = 1;
                }
                int _3360 = _3332;
                _3334 = _3360;
                if (!_3358)
                {
                    float2 _10260 = float2(_3316, _137);
                    float2 _3362 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10260, float2(0.0), isnan(_10260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10260, float2(0.0), isnan(_10260))).xy;
                    float _3364 = _3362.x;
                    float _3366 = _3362.y;
                    float _3368 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3316);
                    _3334 = _3310;
                    _3322 = _3366;
                    _3324 = _3364;
                    _3326 = _3368;
                }
            }
            int _3370 = _3334;
            float _3372 = _3322;
            float _3374 = _3324;
            float _3376 = _3326;
            int _3378 = _3370 & 1;
            bool _3380 = _3378 != 0;
            float _3382 = _3372;
            float _3384 = _3374;
            float _3386 = _3376;
            if (_3380)
            {
                _3328 = _3370;
            }
            int _3388 = _3328;
            int _3390 = _3388;
            int _3392 = _3388;
            if (!_3380)
            {
                bool _3394 = _3372 > 0.800000011920928955078125;
                bool _3396 = isnan(_3372);
                bool _3398 = _3394 || _3396;
                bool _3400 = isnan(0.800000011920928955078125);
                bool _3402 = _3398 || _3400;
                bool _3404 = _3374 != 0.0;
                bool _3406 = isnan(_3374);
                bool _3408 = _3404 || _3406;
                bool _3410 = isnan(0.0);
                bool _3412 = _3408 || _3410;
                bool _3414 = !_3402;
                bool _3416 = _3412 || _3414;
                if (_3416)
                {
                    _3390 = 1;
                }
                int _3418 = _3390;
                _3392 = _3418;
                if (!_3416)
                {
                    float2 _10338 = float2(_3376, _137);
                    float2 _3420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10338, float2(0.0), isnan(_10338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10338, float2(0.0), isnan(_10338))).xy;
                    float _3422 = _3420.x;
                    float _3424 = _3420.y;
                    float _3426 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3376);
                    _3392 = _3370;
                    _3382 = _3424;
                    _3384 = _3422;
                    _3386 = _3426;
                }
            }
            int _3428 = _3392;
            float _3430 = _3382;
            float _3432 = _3384;
            float _3434 = _3386;
            int _3436 = _3428 & 1;
            bool _3438 = _3436 != 0;
            float _3440 = _3432;
            float _3442 = _3430;
            float _3444 = _3434;
            if (!_3438)
            {
                bool _3446 = _3430 > 0.800000011920928955078125;
                bool _3448 = isnan(_3430);
                bool _3450 = _3446 || _3448;
                bool _3452 = isnan(0.800000011920928955078125);
                bool _3454 = _3450 || _3452;
                bool _3456 = _3432 != 0.0;
                bool _3458 = isnan(_3432);
                bool _3460 = _3456 || _3458;
                bool _3462 = isnan(0.0);
                bool _3464 = _3460 || _3462;
                bool _3466 = !_3454;
                bool _3468 = _3464 || _3466;
                if (!_3468)
                {
                    float2 _10404 = float2(_3434, _137);
                    float2 _3470 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10404, float2(0.0), isnan(_10404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10404, float2(0.0), isnan(_10404))).xy;
                    float _3472 = _3470.x;
                    float _3474 = _3470.y;
                    float _3476 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3434);
                    _3440 = _3472;
                    _3442 = _3474;
                    _3444 = _3476;
                }
            }
            float _3478 = _3440;
            float _3480 = _3442;
            float _3482 = _3444;
            float _3484 = fma(_3478, 0.5, 0.5234375);
            float _3486 = fma(_2664, 0.5, 0.0078125);
            float _3488 = fma(_3480, 2.0, 0.03125);
            float _3490 = fma(_2666, 2.0, 0.03125);
            float2 _10439 = float2(_3484, _3488);
            float _3492 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_10439, float2(0.0), isnan(_10439))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_10439, float2(0.0), isnan(_10439))).x;
            float2 _10447 = float2(_3486, _3490);
            float _3494 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_10447, float2(0.0), isnan(_10447))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_10447, float2(0.0), isnan(_10447))).x;
            float _3496 = fma(_3492, -2.007874011993408203125, 3.25);
            float _3498 = fma(_3494, -2.007874011993408203125, 3.25);
            float _3500 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _3502 = fma(_3496, _3500, _3482);
            float _3504 = fma(_3498, (*spvDescriptorSet0.fp_c3)._m0[0].z, _2668);
            float2 _10473 = float2(_3502, _155);
            float _3506 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10473, float2(0.0), isnan(_10473)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10473, float2(0.0), isnan(_10473)), int2(1, 0)).x;
            float2 _10481 = float2(_3504, _155);
            float _3508 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10481, float2(0.0), isnan(_10481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10481, float2(0.0), isnan(_10481))).x;
            float _3510 = -_149;
            float _3512 = fma(_3504, (*spvDescriptorSet0.fp_c3)._m0[0].x, _3510);
            float _3514 = -_149;
            float _3516 = fma(_3502, (*spvDescriptorSet0.fp_c3)._m0[0].x, _3514);
            float _3518 = rint(_3516);
            float _3520 = rint(_3512);
            float _3522 = abs(_3518);
            float _3524 = sqrt(_3522);
            float _3526 = abs(_3520);
            float _3528 = sqrt(_3526);
            float _3530 = _3508 * 4.0;
            float _3532 = _3506 * 4.0;
            float _3534 = rint(_3532);
            float _3536 = rint(_3530);
            float _3538 = fma(_3534, 16.0, _3524);
            float _3540 = fma(_3538, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _3542 = fma(_3536, 16.0, _3528);
            float _3544 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _3540);
            float _3546 = fma(_3542, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float2 _10538 = float2(_3504, _67);
            float _3548 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10538, float2(0.0), isnan(_10538)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10538, float2(0.0), isnan(_10538)), int2(0, 1)).x;
            float2 _10547 = float2(_3504, _67);
            float _3550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10547, float2(0.0), isnan(_10547)), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10547, float2(0.0), isnan(_10547)), int2(0, -2)).x;
            float2 _10557 = float2(_3502, _67);
            float _3552 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10557, float2(0.0), isnan(_10557)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10557, float2(0.0), isnan(_10557)), int2(1)).x;
            float2 _10566 = float2(_3502, _67);
            float _3554 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10566, float2(0.0), isnan(_10566)), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10566, float2(0.0), isnan(_10566)), int2(1, -2)).x;
            float2 _10575 = float2(_3546, _3544);
            float2 _3556 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_10575, float2(0.0), isnan(_10575))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_10575, float2(0.0), isnan(_10575))).xy;
            float _3558 = _3556.x;
            float _3560 = _3556.y;
            float _3562 = abs(_3518);
            float _3564 = abs(_3520);
            bool _3566 = _3562 >= _3564;
            bool _3568 = isnan(_3562);
            bool _3570 = _3566 || _3568;
            bool _3572 = isnan(_3564);
            bool _3574 = _3570 || _3572;
            float _3576 = float(_3574);
            float _3578 = abs(_3520);
            float _3580 = abs(_3518);
            bool _3582 = _3578 >= _3580;
            bool _3584 = isnan(_3578);
            bool _3586 = _3582 || _3584;
            bool _3588 = isnan(_3580);
            bool _3590 = _3586 || _3588;
            float _3592 = float(_3590);
            float _3594 = _3576 + _3592;
            float _3596 = 1.0 / _3594;
            float _3598 = _3596 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
            float _3600 = _3576 * _3598;
            float _3602 = _3592 * _3598;
            float _3604 = -_3600;
            float _3606 = fma(_3604, _3548, 1.0);
            float _3608 = -_3600;
            float _3610 = fma(_3608, _3550, 1.0);
            float _3612 = -_3602;
            float _3614 = fma(_3612, _3552, _3606);
            float _3616 = precise::clamp(_3614, 0.0, 1.0);
            float _3618 = -_3602;
            float _3620 = fma(_3618, _3554, _3610);
            float _3622 = precise::clamp(_3620, 0.0, 1.0);
            float _3624 = _3558 * _3616;
            float _3626 = _3560 * _3622;
            _208 = _166;
            _182 = _3552;
            _210 = _67;
            _184 = _3622;
            _186 = as_type<int>(_3616);
            _200 = as_type<int>(_3624);
            _202 = as_type<int>(_3626);
        }
    }
    int _3628 = _208;
    float _3630 = _182;
    float _3632 = _210;
    float _3634 = _184;
    int _3636 = _186;
    int _3638 = _200;
    int _3640 = _202;
    int _3642 = _3628 & 1;
    bool _3644 = _3642 != 0;
    bool _3646 = !_3644;
    float _3648 = _3630;
    float _3650 = _3632;
    float _3652 = _3634;
    int _3654 = _3636;
    if (!_3646)
    {
        float2 _10704 = float2(_141, _155);
        float2 _3656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10704, float2(0.0), isnan(_10704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10704, float2(0.0), isnan(_10704))).xy;
        float _3658 = _3656.x;
        float _3660 = _3656.y;
        float2 _10716 = float2(_145, _147);
        float2 _3662 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10716, float2(0.0), isnan(_10716))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10716, float2(0.0), isnan(_10716))).xy;
        float _3664 = _3662.x;
        float _3666 = _3662.y;
        float _3668 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _155);
        bool _3670 = _3658 > 0.800000011920928955078125;
        bool _3672 = isnan(_3658);
        bool _3674 = _3670 || _3672;
        bool _3676 = isnan(0.800000011920928955078125);
        bool _3678 = _3674 || _3676;
        bool _3680 = _3664 > 0.800000011920928955078125;
        bool _3682 = isnan(_3664);
        bool _3684 = _3680 || _3682;
        bool _3686 = isnan(0.800000011920928955078125);
        bool _3688 = _3684 || _3686;
        bool _3690 = _3660 != 0.0;
        bool _3692 = isnan(_3660);
        bool _3694 = _3690 || _3692;
        bool _3696 = isnan(0.0);
        bool _3698 = _3694 || _3696;
        bool _3700 = !_3678;
        bool _3702 = _3698 || _3700;
        bool _3704 = _3666 != 0.0;
        bool _3706 = isnan(_3666);
        bool _3708 = _3704 || _3706;
        bool _3710 = isnan(0.0);
        bool _3712 = _3708 || _3710;
        bool _3714 = !_3688;
        bool _3716 = _3712 || _3714;
        int _3718 = as_type<int>(_3660);
        float _3720 = _3668;
        if (_3702)
        {
            _3648 = _3658;
        }
        float _3722 = _3648;
        if (_3702)
        {
            _3650 = _3660;
        }
        float _3724 = _3650;
        if (_3716)
        {
            _188 = _3666;
        }
        float _3726 = _188;
        if (_3716)
        {
            _3652 = _3664;
        }
        float _3728 = _3652;
        float _3730 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
        float _3732 = _3722;
        float _3734 = _3724;
        float _3736 = _3730;
        if (!_3702)
        {
            float2 _10819 = float2(_141, _3668);
            float2 _3738 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10819, float2(0.0), isnan(_10819))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10819, float2(0.0), isnan(_10819))).xy;
            float _3740 = _3738.x;
            float _3742 = _3738.y;
            _3732 = _3740;
            _3734 = _3742;
        }
        float _3744 = _3732;
        float _3746 = _3734;
        float _3748 = _3728;
        float _3750 = _3726;
        if (!_3716)
        {
            float2 _10841 = float2(_145, _3730);
            float2 _3752 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10841, float2(0.0), isnan(_10841))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10841, float2(0.0), isnan(_10841))).xy;
            float _3754 = _3752.x;
            float _3756 = _3752.y;
            _3748 = _3754;
            _3750 = _3756;
        }
        float _3758 = _3748;
        float _3760 = _3750;
        if (_3702)
        {
            _3718 = 1;
        }
        int _3762 = _3718;
        int _3764 = _3762;
        if (!_3702)
        {
            _3764 = 0;
        }
        int _3766 = _3764;
        int _3768 = _3766;
        if (_3702)
        {
            _190 = _3668;
        }
        float _3770 = _190;
        float _3772 = _3770;
        if (!_3702)
        {
            float _3774 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3668);
            _3772 = _3774;
        }
        float _3776 = _3772;
        int _3778 = _3766 & 1;
        bool _3780 = _3778 != 0;
        float _3782 = _3776;
        if (_3780)
        {
            _3654 = _3766;
        }
        int _3784 = _3654;
        int _3786 = _3784;
        int _3788 = _3784;
        float _3790 = _3744;
        float _3792 = _3746;
        float _3794 = _3758;
        float _3796 = _3760;
        if (!_3780)
        {
            bool _3798 = _3744 > 0.800000011920928955078125;
            bool _3800 = isnan(_3744);
            bool _3802 = _3798 || _3800;
            bool _3804 = isnan(0.800000011920928955078125);
            bool _3806 = _3802 || _3804;
            bool _3808 = _3746 != 0.0;
            bool _3810 = isnan(_3746);
            bool _3812 = _3808 || _3810;
            bool _3814 = isnan(0.0);
            bool _3816 = _3812 || _3814;
            bool _3818 = !_3806;
            bool _3820 = _3816 || _3818;
            if (_3820)
            {
                _3786 = 1;
            }
            int _3822 = _3786;
            _3788 = _3822;
            if (!_3820)
            {
                float2 _10939 = float2(_141, _3776);
                float2 _3824 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10939, float2(0.0), isnan(_10939))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10939, float2(0.0), isnan(_10939))).xy;
                float _3826 = _3824.x;
                float _3828 = _3824.y;
                float _3830 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3776);
                _3788 = _3766;
                _3790 = _3826;
                _3792 = _3828;
                _3782 = _3830;
            }
        }
        int _3832 = _3788;
        float _3834 = _3790;
        float _3836 = _3792;
        float _3838 = _3782;
        int _3840 = _3832 & 1;
        bool _3842 = _3840 != 0;
        float _3844 = _3834;
        float _3846 = _3836;
        float _3848 = _3838;
        int _3850 = _3832;
        if (_3842)
        {
            _3768 = _3832;
        }
        int _3852 = _3768;
        int _3854 = _3852;
        int _3856 = _3852;
        if (!_3842)
        {
            bool _3858 = _3834 > 0.800000011920928955078125;
            bool _3860 = isnan(_3834);
            bool _3862 = _3858 || _3860;
            bool _3864 = isnan(0.800000011920928955078125);
            bool _3866 = _3862 || _3864;
            bool _3868 = _3836 != 0.0;
            bool _3870 = isnan(_3836);
            bool _3872 = _3868 || _3870;
            bool _3874 = isnan(0.0);
            bool _3876 = _3872 || _3874;
            bool _3878 = !_3866;
            bool _3880 = _3876 || _3878;
            if (_3880)
            {
                _3854 = 1;
            }
            int _3882 = _3854;
            _3856 = _3882;
            if (!_3880)
            {
                float2 _11018 = float2(_141, _3838);
                float2 _3884 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11018, float2(0.0), isnan(_11018))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11018, float2(0.0), isnan(_11018))).xy;
                float _3886 = _3884.x;
                float _3888 = _3884.y;
                float _3890 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3838);
                _3856 = _3832;
                _3844 = _3886;
                _3846 = _3888;
                _3848 = _3890;
            }
        }
        int _3892 = _3856;
        float _3894 = _3844;
        float _3896 = _3846;
        float _3898 = _3848;
        int _3900 = _3892 & 1;
        bool _3902 = _3900 != 0;
        float _3904 = _3894;
        float _3906 = _3896;
        float _3908 = _3898;
        int _3910 = _3892;
        if (_3902)
        {
            _3850 = _3892;
        }
        int _3912 = _3850;
        int _3914 = _3912;
        int _3916 = _3912;
        if (!_3902)
        {
            bool _3918 = _3894 > 0.800000011920928955078125;
            bool _3920 = isnan(_3894);
            bool _3922 = _3918 || _3920;
            bool _3924 = isnan(0.800000011920928955078125);
            bool _3926 = _3922 || _3924;
            bool _3928 = _3896 != 0.0;
            bool _3930 = isnan(_3896);
            bool _3932 = _3928 || _3930;
            bool _3934 = isnan(0.0);
            bool _3936 = _3932 || _3934;
            bool _3938 = !_3926;
            bool _3940 = _3936 || _3938;
            if (_3940)
            {
                _3914 = 1;
            }
            int _3942 = _3914;
            _3916 = _3942;
            if (!_3940)
            {
                float2 _11097 = float2(_141, _3898);
                float2 _3944 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11097, float2(0.0), isnan(_11097))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11097, float2(0.0), isnan(_11097))).xy;
                float _3946 = _3944.x;
                float _3948 = _3944.y;
                float _3950 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3898);
                _3916 = _3892;
                _3904 = _3946;
                _3906 = _3948;
                _3908 = _3950;
            }
        }
        int _3952 = _3916;
        float _3954 = _3904;
        float _3956 = _3906;
        float _3958 = _3908;
        int _3960 = _3952 & 1;
        bool _3962 = _3960 != 0;
        float _3964 = _3954;
        float _3966 = _3956;
        float _3968 = _3958;
        int _3970 = _3952;
        if (_3962)
        {
            _3910 = _3952;
        }
        int _3972 = _3910;
        int _3974 = _3972;
        int _3976 = _3972;
        if (!_3962)
        {
            bool _3978 = _3954 > 0.800000011920928955078125;
            bool _3980 = isnan(_3954);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan(0.800000011920928955078125);
            bool _3986 = _3982 || _3984;
            bool _3988 = _3956 != 0.0;
            bool _3990 = isnan(_3956);
            bool _3992 = _3988 || _3990;
            bool _3994 = isnan(0.0);
            bool _3996 = _3992 || _3994;
            bool _3998 = !_3986;
            bool _4000 = _3996 || _3998;
            if (_4000)
            {
                _3974 = 1;
            }
            int _4002 = _3974;
            _3976 = _4002;
            if (!_4000)
            {
                float2 _11176 = float2(_141, _3958);
                float2 _4004 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11176, float2(0.0), isnan(_11176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11176, float2(0.0), isnan(_11176))).xy;
                float _4006 = _4004.x;
                float _4008 = _4004.y;
                float _4010 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3958);
                _3976 = _3952;
                _3964 = _4006;
                _3966 = _4008;
                _3968 = _4010;
            }
        }
        int _4012 = _3976;
        float _4014 = _3964;
        float _4016 = _3966;
        float _4018 = _3968;
        int _4020 = _4012 & 1;
        bool _4022 = _4020 != 0;
        float _4024 = _4014;
        float _4026 = _4016;
        float _4028 = _4018;
        int _4030 = _4012;
        if (_4022)
        {
            _3970 = _4012;
        }
        int _4032 = _3970;
        int _4034 = _4032;
        int _4036 = _4032;
        if (!_4022)
        {
            bool _4038 = _4014 > 0.800000011920928955078125;
            bool _4040 = isnan(_4014);
            bool _4042 = _4038 || _4040;
            bool _4044 = isnan(0.800000011920928955078125);
            bool _4046 = _4042 || _4044;
            bool _4048 = _4016 != 0.0;
            bool _4050 = isnan(_4016);
            bool _4052 = _4048 || _4050;
            bool _4054 = isnan(0.0);
            bool _4056 = _4052 || _4054;
            bool _4058 = !_4046;
            bool _4060 = _4056 || _4058;
            if (_4060)
            {
                _4034 = 1;
            }
            int _4062 = _4034;
            _4036 = _4062;
            if (!_4060)
            {
                float2 _11255 = float2(_141, _4018);
                float2 _4064 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11255, float2(0.0), isnan(_11255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11255, float2(0.0), isnan(_11255))).xy;
                float _4066 = _4064.x;
                float _4068 = _4064.y;
                float _4070 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4018);
                _4036 = _4012;
                _4024 = _4066;
                _4026 = _4068;
                _4028 = _4070;
            }
        }
        int _4072 = _4036;
        float _4074 = _4024;
        float _4076 = _4026;
        float _4078 = _4028;
        int _4080 = _4072 & 1;
        bool _4082 = _4080 != 0;
        float _4084 = _4074;
        float _4086 = _4076;
        float _4088 = _4078;
        int _4090 = _4072;
        if (_4082)
        {
            _4030 = _4072;
        }
        int _4092 = _4030;
        int _4094 = _4092;
        int _4096 = _4092;
        if (!_4082)
        {
            bool _4098 = _4074 > 0.800000011920928955078125;
            bool _4100 = isnan(_4074);
            bool _4102 = _4098 || _4100;
            bool _4104 = isnan(0.800000011920928955078125);
            bool _4106 = _4102 || _4104;
            bool _4108 = _4076 != 0.0;
            bool _4110 = isnan(_4076);
            bool _4112 = _4108 || _4110;
            bool _4114 = isnan(0.0);
            bool _4116 = _4112 || _4114;
            bool _4118 = !_4106;
            bool _4120 = _4116 || _4118;
            if (_4120)
            {
                _4094 = 1;
            }
            int _4122 = _4094;
            _4096 = _4122;
            if (!_4120)
            {
                float2 _11334 = float2(_141, _4078);
                float2 _4124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11334, float2(0.0), isnan(_11334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11334, float2(0.0), isnan(_11334))).xy;
                float _4126 = _4124.x;
                float _4128 = _4124.y;
                float _4130 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4078);
                _4096 = _4072;
                _4084 = _4126;
                _4086 = _4128;
                _4088 = _4130;
            }
        }
        int _4132 = _4096;
        float _4134 = _4084;
        float _4136 = _4086;
        float _4138 = _4088;
        int _4140 = _4132 & 1;
        bool _4142 = _4140 != 0;
        float _4144 = _4134;
        float _4146 = _4136;
        float _4148 = _4138;
        int _4150 = _4132;
        if (_4142)
        {
            _4090 = _4132;
        }
        int _4152 = _4090;
        int _4154 = _4152;
        int _4156 = _4152;
        if (!_4142)
        {
            bool _4158 = _4134 > 0.800000011920928955078125;
            bool _4160 = isnan(_4134);
            bool _4162 = _4158 || _4160;
            bool _4164 = isnan(0.800000011920928955078125);
            bool _4166 = _4162 || _4164;
            bool _4168 = _4136 != 0.0;
            bool _4170 = isnan(_4136);
            bool _4172 = _4168 || _4170;
            bool _4174 = isnan(0.0);
            bool _4176 = _4172 || _4174;
            bool _4178 = !_4166;
            bool _4180 = _4176 || _4178;
            if (_4180)
            {
                _4154 = 1;
            }
            int _4182 = _4154;
            _4156 = _4182;
            if (!_4180)
            {
                float2 _11413 = float2(_141, _4138);
                float2 _4184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11413, float2(0.0), isnan(_11413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11413, float2(0.0), isnan(_11413))).xy;
                float _4186 = _4184.x;
                float _4188 = _4184.y;
                float _4190 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4138);
                _4156 = _4132;
                _4144 = _4186;
                _4146 = _4188;
                _4148 = _4190;
            }
        }
        int _4192 = _4156;
        float _4194 = _4144;
        float _4196 = _4146;
        float _4198 = _4148;
        int _4200 = _4192 & 1;
        bool _4202 = _4200 != 0;
        float _4204 = _4194;
        float _4206 = _4196;
        float _4208 = _4198;
        int _4210 = _4192;
        if (_4202)
        {
            _4150 = _4192;
        }
        int _4212 = _4150;
        int _4214 = _4212;
        int _4216 = _4212;
        if (!_4202)
        {
            bool _4218 = _4194 > 0.800000011920928955078125;
            bool _4220 = isnan(_4194);
            bool _4222 = _4218 || _4220;
            bool _4224 = isnan(0.800000011920928955078125);
            bool _4226 = _4222 || _4224;
            bool _4228 = _4196 != 0.0;
            bool _4230 = isnan(_4196);
            bool _4232 = _4228 || _4230;
            bool _4234 = isnan(0.0);
            bool _4236 = _4232 || _4234;
            bool _4238 = !_4226;
            bool _4240 = _4236 || _4238;
            if (_4240)
            {
                _4214 = 1;
            }
            int _4242 = _4214;
            _4216 = _4242;
            if (!_4240)
            {
                float2 _11492 = float2(_141, _4198);
                float2 _4244 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11492, float2(0.0), isnan(_11492))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11492, float2(0.0), isnan(_11492))).xy;
                float _4246 = _4244.x;
                float _4248 = _4244.y;
                float _4250 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4198);
                _4216 = _4192;
                _4204 = _4246;
                _4206 = _4248;
                _4208 = _4250;
            }
        }
        int _4252 = _4216;
        float _4254 = _4204;
        float _4256 = _4206;
        float _4258 = _4208;
        int _4260 = _4252 & 1;
        bool _4262 = _4260 != 0;
        float _4264 = _4254;
        float _4266 = _4256;
        float _4268 = _4258;
        int _4270 = _4252;
        if (_4262)
        {
            _4210 = _4252;
        }
        int _4272 = _4210;
        int _4274 = _4272;
        int _4276 = _4272;
        if (!_4262)
        {
            bool _4278 = _4254 > 0.800000011920928955078125;
            bool _4280 = isnan(_4254);
            bool _4282 = _4278 || _4280;
            bool _4284 = isnan(0.800000011920928955078125);
            bool _4286 = _4282 || _4284;
            bool _4288 = _4256 != 0.0;
            bool _4290 = isnan(_4256);
            bool _4292 = _4288 || _4290;
            bool _4294 = isnan(0.0);
            bool _4296 = _4292 || _4294;
            bool _4298 = !_4286;
            bool _4300 = _4296 || _4298;
            if (_4300)
            {
                _4274 = 1;
            }
            int _4302 = _4274;
            _4276 = _4302;
            if (!_4300)
            {
                float2 _11571 = float2(_141, _4258);
                float2 _4304 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11571, float2(0.0), isnan(_11571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11571, float2(0.0), isnan(_11571))).xy;
                float _4306 = _4304.x;
                float _4308 = _4304.y;
                float _4310 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4258);
                _4276 = _4252;
                _4264 = _4306;
                _4266 = _4308;
                _4268 = _4310;
            }
        }
        int _4312 = _4276;
        float _4314 = _4264;
        float _4316 = _4266;
        float _4318 = _4268;
        int _4320 = _4312 & 1;
        bool _4322 = _4320 != 0;
        float _4324 = _4314;
        float _4326 = _4316;
        float _4328 = _4318;
        int _4330 = _4312;
        if (_4322)
        {
            _4270 = _4312;
        }
        int _4332 = _4270;
        int _4334 = _4332;
        int _4336 = _4332;
        if (!_4322)
        {
            bool _4338 = _4314 > 0.800000011920928955078125;
            bool _4340 = isnan(_4314);
            bool _4342 = _4338 || _4340;
            bool _4344 = isnan(0.800000011920928955078125);
            bool _4346 = _4342 || _4344;
            bool _4348 = _4316 != 0.0;
            bool _4350 = isnan(_4316);
            bool _4352 = _4348 || _4350;
            bool _4354 = isnan(0.0);
            bool _4356 = _4352 || _4354;
            bool _4358 = !_4346;
            bool _4360 = _4356 || _4358;
            if (_4360)
            {
                _4334 = 1;
            }
            int _4362 = _4334;
            _4336 = _4362;
            if (!_4360)
            {
                float2 _11650 = float2(_141, _4318);
                float2 _4364 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11650, float2(0.0), isnan(_11650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11650, float2(0.0), isnan(_11650))).xy;
                float _4366 = _4364.x;
                float _4368 = _4364.y;
                float _4370 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4318);
                _4336 = _4312;
                _4324 = _4366;
                _4326 = _4368;
                _4328 = _4370;
            }
        }
        int _4372 = _4336;
        float _4374 = _4324;
        float _4376 = _4326;
        float _4378 = _4328;
        int _4380 = _4372 & 1;
        bool _4382 = _4380 != 0;
        float _4384 = _4374;
        float _4386 = _4376;
        float _4388 = _4378;
        int _4390 = _4372;
        if (_4382)
        {
            _4330 = _4372;
        }
        int _4392 = _4330;
        int _4394 = _4392;
        int _4396 = _4392;
        if (!_4382)
        {
            bool _4398 = _4374 > 0.800000011920928955078125;
            bool _4400 = isnan(_4374);
            bool _4402 = _4398 || _4400;
            bool _4404 = isnan(0.800000011920928955078125);
            bool _4406 = _4402 || _4404;
            bool _4408 = _4376 != 0.0;
            bool _4410 = isnan(_4376);
            bool _4412 = _4408 || _4410;
            bool _4414 = isnan(0.0);
            bool _4416 = _4412 || _4414;
            bool _4418 = !_4406;
            bool _4420 = _4416 || _4418;
            if (_4420)
            {
                _4394 = 1;
            }
            int _4422 = _4394;
            _4396 = _4422;
            if (!_4420)
            {
                float2 _11729 = float2(_141, _4378);
                float2 _4424 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11729, float2(0.0), isnan(_11729))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11729, float2(0.0), isnan(_11729))).xy;
                float _4426 = _4424.x;
                float _4428 = _4424.y;
                float _4430 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4378);
                _4396 = _4372;
                _4384 = _4426;
                _4386 = _4428;
                _4388 = _4430;
            }
        }
        int _4432 = _4396;
        float _4434 = _4384;
        float _4436 = _4386;
        float _4438 = _4388;
        int _4440 = _4432 & 1;
        bool _4442 = _4440 != 0;
        float _4444 = _4434;
        float _4446 = _4436;
        float _4448 = _4438;
        int _4450 = _4432;
        if (_4442)
        {
            _4390 = _4432;
        }
        int _4452 = _4390;
        int _4454 = _4452;
        int _4456 = _4452;
        if (!_4442)
        {
            bool _4458 = _4434 > 0.800000011920928955078125;
            bool _4460 = isnan(_4434);
            bool _4462 = _4458 || _4460;
            bool _4464 = isnan(0.800000011920928955078125);
            bool _4466 = _4462 || _4464;
            bool _4468 = _4436 != 0.0;
            bool _4470 = isnan(_4436);
            bool _4472 = _4468 || _4470;
            bool _4474 = isnan(0.0);
            bool _4476 = _4472 || _4474;
            bool _4478 = !_4466;
            bool _4480 = _4476 || _4478;
            if (_4480)
            {
                _4454 = 1;
            }
            int _4482 = _4454;
            _4456 = _4482;
            if (!_4480)
            {
                float2 _11808 = float2(_141, _4438);
                float2 _4484 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11808, float2(0.0), isnan(_11808))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11808, float2(0.0), isnan(_11808))).xy;
                float _4486 = _4484.x;
                float _4488 = _4484.y;
                float _4490 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4438);
                _4456 = _4432;
                _4444 = _4486;
                _4446 = _4488;
                _4448 = _4490;
            }
        }
        int _4492 = _4456;
        float _4494 = _4444;
        float _4496 = _4446;
        float _4498 = _4448;
        int _4500 = _4492 & 1;
        bool _4502 = _4500 != 0;
        float _4504 = _4498;
        float _4506 = _4496;
        float _4508 = _4494;
        float _4510 = as_type<float>(_4492);
        if (_3716)
        {
            _192 = 1;
        }
        int _4512 = _192;
        int _4514 = _4512;
        if (!_3716)
        {
            _4514 = 0;
        }
        int _4516 = _4514;
        int _4518 = _4516 & 1;
        bool _4520 = _4518 != 0;
        int _4522 = _4516;
        if (_4502)
        {
            _4450 = _4492;
        }
        int _4524 = _4450;
        int _4526 = _4524;
        int _4528 = _4524;
        if (!_4502)
        {
            bool _4530 = _4494 > 0.800000011920928955078125;
            bool _4532 = isnan(_4494);
            bool _4534 = _4530 || _4532;
            bool _4536 = isnan(0.800000011920928955078125);
            bool _4538 = _4534 || _4536;
            bool _4540 = _4496 != 0.0;
            bool _4542 = isnan(_4496);
            bool _4544 = _4540 || _4542;
            bool _4546 = isnan(0.0);
            bool _4548 = _4544 || _4546;
            bool _4550 = !_4538;
            bool _4552 = _4548 || _4550;
            if (_4552)
            {
                _4526 = 1;
            }
            int _4554 = _4526;
            _4528 = _4554;
            if (!_4552)
            {
                float2 _11903 = float2(_141, _4498);
                float2 _4556 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11903, float2(0.0), isnan(_11903))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11903, float2(0.0), isnan(_11903))).xy;
                float _4558 = _4556.x;
                float _4560 = _4556.y;
                float _4562 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4498);
                _4528 = _4492;
                _4504 = _4562;
                _4506 = _4560;
                _4508 = _4558;
            }
        }
        int _4564 = _4528;
        float _4566 = _4504;
        float _4568 = _4506;
        float _4570 = _4508;
        int _4572 = _4564 & 1;
        bool _4574 = _4572 != 0;
        float _4576 = as_type<float>(_4564);
        if (_3716)
        {
            _3720 = _3730;
        }
        float _4578 = _3720;
        float _4580 = _4578;
        if (!_3716)
        {
            float _4582 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _3730);
            _4580 = _4582;
        }
        float _4584 = _4580;
        float _4586 = _4584;
        if (_4574)
        {
            _4576 = _4566;
        }
        float _4588 = _4576;
        float _4590 = _4588;
        float _4592 = _4588;
        if (_4574)
        {
            _4510 = _4568;
        }
        float _4594 = _4510;
        float _4596 = _4594;
        float _4598 = _4594;
        if (_4574)
        {
            _3736 = _4570;
        }
        float _4600 = _3736;
        float _4602 = _4600;
        float _4604 = _4600;
        if (!_4574)
        {
            bool _4606 = _4570 > 0.800000011920928955078125;
            bool _4608 = isnan(_4570);
            bool _4610 = _4606 || _4608;
            bool _4612 = isnan(0.800000011920928955078125);
            bool _4614 = _4610 || _4612;
            bool _4616 = _4568 != 0.0;
            bool _4618 = isnan(_4568);
            bool _4620 = _4616 || _4618;
            bool _4622 = isnan(0.0);
            bool _4624 = _4620 || _4622;
            bool _4626 = !_4614;
            bool _4628 = _4624 || _4626;
            if (_4628)
            {
                _4602 = _4570;
            }
            float _4630 = _4602;
            _4604 = _4630;
            if (_4628)
            {
                _4596 = _4568;
            }
            float _4632 = _4596;
            _4598 = _4632;
            if (_4628)
            {
                _4590 = _4566;
            }
            float _4634 = _4590;
            _4592 = _4634;
            if (!_4628)
            {
                float2 _12024 = float2(_141, _4566);
                float2 _4636 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12024, float2(0.0), isnan(_12024))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12024, float2(0.0), isnan(_12024))).xy;
                float _4638 = _4636.x;
                float _4640 = _4636.y;
                float _4642 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4566);
                _4604 = _4638;
                _4598 = _4640;
                _4592 = _4642;
            }
        }
        float _4644 = _4604;
        float _4646 = _4598;
        float _4648 = _4592;
        if (_4520)
        {
            _194 = _4516;
        }
        int _4650 = _194;
        int _4652 = _4650;
        int _4654 = _4650;
        if (!_4520)
        {
            bool _4656 = _3758 > 0.800000011920928955078125;
            bool _4658 = isnan(_3758);
            bool _4660 = _4656 || _4658;
            bool _4662 = isnan(0.800000011920928955078125);
            bool _4664 = _4660 || _4662;
            bool _4666 = _3760 != 0.0;
            bool _4668 = isnan(_3760);
            bool _4670 = _4666 || _4668;
            bool _4672 = isnan(0.0);
            bool _4674 = _4670 || _4672;
            bool _4676 = !_4664;
            bool _4678 = _4674 || _4676;
            if (_4678)
            {
                _4652 = 1;
            }
            int _4680 = _4652;
            _4654 = _4680;
            if (!_4678)
            {
                float2 _12093 = float2(_145, _4584);
                float2 _4682 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12093, float2(0.0), isnan(_12093))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12093, float2(0.0), isnan(_12093))).xy;
                float _4684 = _4682.x;
                float _4686 = _4682.y;
                float _4688 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4584);
                _4654 = _4516;
                _3794 = _4684;
                _3796 = _4686;
                _4586 = _4688;
            }
        }
        int _4690 = _4654;
        float _4692 = _3794;
        float _4694 = _3796;
        float _4696 = _4586;
        int _4698 = _4690 & 1;
        bool _4700 = _4698 != 0;
        float _4702 = _4692;
        float _4704 = _4694;
        float _4706 = _4696;
        int _4708 = _4690;
        if (_4700)
        {
            _4522 = _4690;
        }
        int _4710 = _4522;
        int _4712 = _4710;
        int _4714 = _4710;
        if (!_4700)
        {
            bool _4716 = _4692 > 0.800000011920928955078125;
            bool _4718 = isnan(_4692);
            bool _4720 = _4716 || _4718;
            bool _4722 = isnan(0.800000011920928955078125);
            bool _4724 = _4720 || _4722;
            bool _4726 = _4694 != 0.0;
            bool _4728 = isnan(_4694);
            bool _4730 = _4726 || _4728;
            bool _4732 = isnan(0.0);
            bool _4734 = _4730 || _4732;
            bool _4736 = !_4724;
            bool _4738 = _4734 || _4736;
            if (_4738)
            {
                _4712 = 1;
            }
            int _4740 = _4712;
            _4714 = _4740;
            if (!_4738)
            {
                float2 _12172 = float2(_145, _4696);
                float2 _4742 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12172, float2(0.0), isnan(_12172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12172, float2(0.0), isnan(_12172))).xy;
                float _4744 = _4742.x;
                float _4746 = _4742.y;
                float _4748 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4696);
                _4714 = _4690;
                _4702 = _4744;
                _4704 = _4746;
                _4706 = _4748;
            }
        }
        int _4750 = _4714;
        float _4752 = _4702;
        float _4754 = _4704;
        float _4756 = _4706;
        int _4758 = _4750 & 1;
        bool _4760 = _4758 != 0;
        float _4762 = _4752;
        float _4764 = _4754;
        float _4766 = _4756;
        int _4768 = _4750;
        if (_4760)
        {
            _4708 = _4750;
        }
        int _4770 = _4708;
        int _4772 = _4770;
        int _4774 = _4770;
        if (!_4760)
        {
            bool _4776 = _4752 > 0.800000011920928955078125;
            bool _4778 = isnan(_4752);
            bool _4780 = _4776 || _4778;
            bool _4782 = isnan(0.800000011920928955078125);
            bool _4784 = _4780 || _4782;
            bool _4786 = _4754 != 0.0;
            bool _4788 = isnan(_4754);
            bool _4790 = _4786 || _4788;
            bool _4792 = isnan(0.0);
            bool _4794 = _4790 || _4792;
            bool _4796 = !_4784;
            bool _4798 = _4794 || _4796;
            if (_4798)
            {
                _4772 = 1;
            }
            int _4800 = _4772;
            _4774 = _4800;
            if (!_4798)
            {
                float2 _12251 = float2(_145, _4756);
                float2 _4802 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12251, float2(0.0), isnan(_12251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12251, float2(0.0), isnan(_12251))).xy;
                float _4804 = _4802.x;
                float _4806 = _4802.y;
                float _4808 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4756);
                _4774 = _4750;
                _4762 = _4804;
                _4764 = _4806;
                _4766 = _4808;
            }
        }
        int _4810 = _4774;
        float _4812 = _4762;
        float _4814 = _4764;
        float _4816 = _4766;
        int _4818 = _4810 & 1;
        bool _4820 = _4818 != 0;
        float _4822 = _4812;
        float _4824 = _4814;
        float _4826 = _4816;
        int _4828 = _4810;
        if (_4820)
        {
            _4768 = _4810;
        }
        int _4830 = _4768;
        int _4832 = _4830;
        int _4834 = _4830;
        if (!_4820)
        {
            bool _4836 = _4812 > 0.800000011920928955078125;
            bool _4838 = isnan(_4812);
            bool _4840 = _4836 || _4838;
            bool _4842 = isnan(0.800000011920928955078125);
            bool _4844 = _4840 || _4842;
            bool _4846 = _4814 != 0.0;
            bool _4848 = isnan(_4814);
            bool _4850 = _4846 || _4848;
            bool _4852 = isnan(0.0);
            bool _4854 = _4850 || _4852;
            bool _4856 = !_4844;
            bool _4858 = _4854 || _4856;
            if (_4858)
            {
                _4832 = 1;
            }
            int _4860 = _4832;
            _4834 = _4860;
            if (!_4858)
            {
                float2 _12330 = float2(_145, _4816);
                float2 _4862 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12330, float2(0.0), isnan(_12330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12330, float2(0.0), isnan(_12330))).xy;
                float _4864 = _4862.x;
                float _4866 = _4862.y;
                float _4868 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4816);
                _4834 = _4810;
                _4822 = _4864;
                _4824 = _4866;
                _4826 = _4868;
            }
        }
        int _4870 = _4834;
        float _4872 = _4822;
        float _4874 = _4824;
        float _4876 = _4826;
        int _4878 = _4870 & 1;
        bool _4880 = _4878 != 0;
        float _4882 = _4872;
        float _4884 = _4874;
        float _4886 = _4876;
        int _4888 = _4870;
        if (_4880)
        {
            _4828 = _4870;
        }
        int _4890 = _4828;
        int _4892 = _4890;
        int _4894 = _4890;
        if (!_4880)
        {
            bool _4896 = _4872 > 0.800000011920928955078125;
            bool _4898 = isnan(_4872);
            bool _4900 = _4896 || _4898;
            bool _4902 = isnan(0.800000011920928955078125);
            bool _4904 = _4900 || _4902;
            bool _4906 = _4874 != 0.0;
            bool _4908 = isnan(_4874);
            bool _4910 = _4906 || _4908;
            bool _4912 = isnan(0.0);
            bool _4914 = _4910 || _4912;
            bool _4916 = !_4904;
            bool _4918 = _4914 || _4916;
            if (_4918)
            {
                _4892 = 1;
            }
            int _4920 = _4892;
            _4894 = _4920;
            if (!_4918)
            {
                float2 _12409 = float2(_145, _4876);
                float2 _4922 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12409, float2(0.0), isnan(_12409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12409, float2(0.0), isnan(_12409))).xy;
                float _4924 = _4922.x;
                float _4926 = _4922.y;
                float _4928 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4876);
                _4894 = _4870;
                _4882 = _4924;
                _4884 = _4926;
                _4886 = _4928;
            }
        }
        int _4930 = _4894;
        float _4932 = _4882;
        float _4934 = _4884;
        float _4936 = _4886;
        int _4938 = _4930 & 1;
        bool _4940 = _4938 != 0;
        float _4942 = _4932;
        float _4944 = _4934;
        float _4946 = _4936;
        int _4948 = _4930;
        if (_4940)
        {
            _4888 = _4930;
        }
        int _4950 = _4888;
        int _4952 = _4950;
        int _4954 = _4950;
        if (!_4940)
        {
            bool _4956 = _4932 > 0.800000011920928955078125;
            bool _4958 = isnan(_4932);
            bool _4960 = _4956 || _4958;
            bool _4962 = isnan(0.800000011920928955078125);
            bool _4964 = _4960 || _4962;
            bool _4966 = _4934 != 0.0;
            bool _4968 = isnan(_4934);
            bool _4970 = _4966 || _4968;
            bool _4972 = isnan(0.0);
            bool _4974 = _4970 || _4972;
            bool _4976 = !_4964;
            bool _4978 = _4974 || _4976;
            if (_4978)
            {
                _4952 = 1;
            }
            int _4980 = _4952;
            _4954 = _4980;
            if (!_4978)
            {
                float2 _12488 = float2(_145, _4936);
                float2 _4982 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12488, float2(0.0), isnan(_12488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12488, float2(0.0), isnan(_12488))).xy;
                float _4984 = _4982.x;
                float _4986 = _4982.y;
                float _4988 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4936);
                _4954 = _4930;
                _4942 = _4984;
                _4944 = _4986;
                _4946 = _4988;
            }
        }
        int _4990 = _4954;
        float _4992 = _4942;
        float _4994 = _4944;
        float _4996 = _4946;
        int _4998 = _4990 & 1;
        bool _5000 = _4998 != 0;
        float _5002 = _4992;
        float _5004 = _4994;
        float _5006 = _4996;
        int _5008 = _4990;
        if (_5000)
        {
            _4948 = _4990;
        }
        int _5010 = _4948;
        int _5012 = _5010;
        int _5014 = _5010;
        if (!_5000)
        {
            bool _5016 = _4992 > 0.800000011920928955078125;
            bool _5018 = isnan(_4992);
            bool _5020 = _5016 || _5018;
            bool _5022 = isnan(0.800000011920928955078125);
            bool _5024 = _5020 || _5022;
            bool _5026 = _4994 != 0.0;
            bool _5028 = isnan(_4994);
            bool _5030 = _5026 || _5028;
            bool _5032 = isnan(0.0);
            bool _5034 = _5030 || _5032;
            bool _5036 = !_5024;
            bool _5038 = _5034 || _5036;
            if (_5038)
            {
                _5012 = 1;
            }
            int _5040 = _5012;
            _5014 = _5040;
            if (!_5038)
            {
                float2 _12567 = float2(_145, _4996);
                float2 _5042 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12567, float2(0.0), isnan(_12567))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12567, float2(0.0), isnan(_12567))).xy;
                float _5044 = _5042.x;
                float _5046 = _5042.y;
                float _5048 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4996);
                _5014 = _4990;
                _5002 = _5044;
                _5004 = _5046;
                _5006 = _5048;
            }
        }
        int _5050 = _5014;
        float _5052 = _5002;
        float _5054 = _5004;
        float _5056 = _5006;
        int _5058 = _5050 & 1;
        bool _5060 = _5058 != 0;
        float _5062 = _5052;
        float _5064 = _5054;
        float _5066 = _5056;
        int _5068 = _5050;
        if (_5060)
        {
            _5008 = _5050;
        }
        int _5070 = _5008;
        int _5072 = _5070;
        int _5074 = _5070;
        if (!_5060)
        {
            bool _5076 = _5052 > 0.800000011920928955078125;
            bool _5078 = isnan(_5052);
            bool _5080 = _5076 || _5078;
            bool _5082 = isnan(0.800000011920928955078125);
            bool _5084 = _5080 || _5082;
            bool _5086 = _5054 != 0.0;
            bool _5088 = isnan(_5054);
            bool _5090 = _5086 || _5088;
            bool _5092 = isnan(0.0);
            bool _5094 = _5090 || _5092;
            bool _5096 = !_5084;
            bool _5098 = _5094 || _5096;
            if (_5098)
            {
                _5072 = 1;
            }
            int _5100 = _5072;
            _5074 = _5100;
            if (!_5098)
            {
                float2 _12646 = float2(_145, _5056);
                float2 _5102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12646, float2(0.0), isnan(_12646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12646, float2(0.0), isnan(_12646))).xy;
                float _5104 = _5102.x;
                float _5106 = _5102.y;
                float _5108 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5056);
                _5074 = _5050;
                _5062 = _5104;
                _5064 = _5106;
                _5066 = _5108;
            }
        }
        int _5110 = _5074;
        float _5112 = _5062;
        float _5114 = _5064;
        float _5116 = _5066;
        int _5118 = _5110 & 1;
        bool _5120 = _5118 != 0;
        float _5122 = _5112;
        float _5124 = _5114;
        float _5126 = _5116;
        int _5128 = _5110;
        if (_5120)
        {
            _5068 = _5110;
        }
        int _5130 = _5068;
        int _5132 = _5130;
        int _5134 = _5130;
        if (!_5120)
        {
            bool _5136 = _5112 > 0.800000011920928955078125;
            bool _5138 = isnan(_5112);
            bool _5140 = _5136 || _5138;
            bool _5142 = isnan(0.800000011920928955078125);
            bool _5144 = _5140 || _5142;
            bool _5146 = _5114 != 0.0;
            bool _5148 = isnan(_5114);
            bool _5150 = _5146 || _5148;
            bool _5152 = isnan(0.0);
            bool _5154 = _5150 || _5152;
            bool _5156 = !_5144;
            bool _5158 = _5154 || _5156;
            if (_5158)
            {
                _5132 = 1;
            }
            int _5160 = _5132;
            _5134 = _5160;
            if (!_5158)
            {
                float2 _12725 = float2(_145, _5116);
                float2 _5162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12725, float2(0.0), isnan(_12725))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12725, float2(0.0), isnan(_12725))).xy;
                float _5164 = _5162.x;
                float _5166 = _5162.y;
                float _5168 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5116);
                _5134 = _5110;
                _5122 = _5164;
                _5124 = _5166;
                _5126 = _5168;
            }
        }
        int _5170 = _5134;
        float _5172 = _5122;
        float _5174 = _5124;
        float _5176 = _5126;
        int _5178 = _5170 & 1;
        bool _5180 = _5178 != 0;
        float _5182 = _5172;
        float _5184 = _5174;
        float _5186 = _5176;
        int _5188 = _5170;
        if (_5180)
        {
            _5128 = _5170;
        }
        int _5190 = _5128;
        int _5192 = _5190;
        int _5194 = _5190;
        if (!_5180)
        {
            bool _5196 = _5172 > 0.800000011920928955078125;
            bool _5198 = isnan(_5172);
            bool _5200 = _5196 || _5198;
            bool _5202 = isnan(0.800000011920928955078125);
            bool _5204 = _5200 || _5202;
            bool _5206 = _5174 != 0.0;
            bool _5208 = isnan(_5174);
            bool _5210 = _5206 || _5208;
            bool _5212 = isnan(0.0);
            bool _5214 = _5210 || _5212;
            bool _5216 = !_5204;
            bool _5218 = _5214 || _5216;
            if (_5218)
            {
                _5192 = 1;
            }
            int _5220 = _5192;
            _5194 = _5220;
            if (!_5218)
            {
                float2 _12804 = float2(_145, _5176);
                float2 _5222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12804, float2(0.0), isnan(_12804))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12804, float2(0.0), isnan(_12804))).xy;
                float _5224 = _5222.x;
                float _5226 = _5222.y;
                float _5228 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5176);
                _5194 = _5170;
                _5182 = _5224;
                _5184 = _5226;
                _5186 = _5228;
            }
        }
        int _5230 = _5194;
        float _5232 = _5182;
        float _5234 = _5184;
        float _5236 = _5186;
        int _5238 = _5230 & 1;
        bool _5240 = _5238 != 0;
        float _5242 = _5232;
        float _5244 = _5234;
        float _5246 = _5236;
        int _5248 = _5230;
        if (_5240)
        {
            _5188 = _5230;
        }
        int _5250 = _5188;
        int _5252 = _5250;
        int _5254 = _5250;
        if (!_5240)
        {
            bool _5256 = _5232 > 0.800000011920928955078125;
            bool _5258 = isnan(_5232);
            bool _5260 = _5256 || _5258;
            bool _5262 = isnan(0.800000011920928955078125);
            bool _5264 = _5260 || _5262;
            bool _5266 = _5234 != 0.0;
            bool _5268 = isnan(_5234);
            bool _5270 = _5266 || _5268;
            bool _5272 = isnan(0.0);
            bool _5274 = _5270 || _5272;
            bool _5276 = !_5264;
            bool _5278 = _5274 || _5276;
            if (_5278)
            {
                _5252 = 1;
            }
            int _5280 = _5252;
            _5254 = _5280;
            if (!_5278)
            {
                float2 _12883 = float2(_145, _5236);
                float2 _5282 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12883, float2(0.0), isnan(_12883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12883, float2(0.0), isnan(_12883))).xy;
                float _5284 = _5282.x;
                float _5286 = _5282.y;
                float _5288 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5236);
                _5254 = _5230;
                _5242 = _5284;
                _5244 = _5286;
                _5246 = _5288;
            }
        }
        int _5290 = _5254;
        float _5292 = _5242;
        float _5294 = _5244;
        float _5296 = _5246;
        int _5298 = _5290 & 1;
        bool _5300 = _5298 != 0;
        float _5302 = _5292;
        float _5304 = _5294;
        float _5306 = _5296;
        int _5308 = _5290;
        if (_5300)
        {
            _5248 = _5290;
        }
        int _5310 = _5248;
        int _5312 = _5310;
        int _5314 = _5310;
        if (!_5300)
        {
            bool _5316 = _5292 > 0.800000011920928955078125;
            bool _5318 = isnan(_5292);
            bool _5320 = _5316 || _5318;
            bool _5322 = isnan(0.800000011920928955078125);
            bool _5324 = _5320 || _5322;
            bool _5326 = _5294 != 0.0;
            bool _5328 = isnan(_5294);
            bool _5330 = _5326 || _5328;
            bool _5332 = isnan(0.0);
            bool _5334 = _5330 || _5332;
            bool _5336 = !_5324;
            bool _5338 = _5334 || _5336;
            if (_5338)
            {
                _5312 = 1;
            }
            int _5340 = _5312;
            _5314 = _5340;
            if (!_5338)
            {
                float2 _12962 = float2(_145, _5296);
                float2 _5342 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12962, float2(0.0), isnan(_12962))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12962, float2(0.0), isnan(_12962))).xy;
                float _5344 = _5342.x;
                float _5346 = _5342.y;
                float _5348 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5296);
                _5314 = _5290;
                _5302 = _5344;
                _5304 = _5346;
                _5306 = _5348;
            }
        }
        int _5350 = _5314;
        float _5352 = _5302;
        float _5354 = _5304;
        float _5356 = _5306;
        int _5358 = _5350 & 1;
        bool _5360 = _5358 != 0;
        float _5362 = _5352;
        float _5364 = _5354;
        float _5366 = _5356;
        if (_5360)
        {
            _5308 = _5350;
        }
        int _5368 = _5308;
        int _5370 = _5368;
        int _5372 = _5368;
        if (!_5360)
        {
            bool _5374 = _5352 > 0.800000011920928955078125;
            bool _5376 = isnan(_5352);
            bool _5378 = _5374 || _5376;
            bool _5380 = isnan(0.800000011920928955078125);
            bool _5382 = _5378 || _5380;
            bool _5384 = _5354 != 0.0;
            bool _5386 = isnan(_5354);
            bool _5388 = _5384 || _5386;
            bool _5390 = isnan(0.0);
            bool _5392 = _5388 || _5390;
            bool _5394 = !_5382;
            bool _5396 = _5392 || _5394;
            if (_5396)
            {
                _5370 = 1;
            }
            int _5398 = _5370;
            _5372 = _5398;
            if (!_5396)
            {
                float2 _13040 = float2(_145, _5356);
                float2 _5400 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13040, float2(0.0), isnan(_13040))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13040, float2(0.0), isnan(_13040))).xy;
                float _5402 = _5400.x;
                float _5404 = _5400.y;
                float _5406 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5356);
                _5372 = _5350;
                _5362 = _5402;
                _5364 = _5404;
                _5366 = _5406;
            }
        }
        int _5408 = _5372;
        float _5410 = _5362;
        float _5412 = _5364;
        float _5414 = _5366;
        int _5416 = _5408 & 1;
        bool _5418 = _5416 != 0;
        float _5420 = _5412;
        float _5422 = _5410;
        float _5424 = _5414;
        if (!_5418)
        {
            bool _5426 = _5410 > 0.800000011920928955078125;
            bool _5428 = isnan(_5410);
            bool _5430 = _5426 || _5428;
            bool _5432 = isnan(0.800000011920928955078125);
            bool _5434 = _5430 || _5432;
            bool _5436 = _5412 != 0.0;
            bool _5438 = isnan(_5412);
            bool _5440 = _5436 || _5438;
            bool _5442 = isnan(0.0);
            bool _5444 = _5440 || _5442;
            bool _5446 = !_5434;
            bool _5448 = _5444 || _5446;
            if (!_5448)
            {
                float2 _13106 = float2(_145, _5414);
                float2 _5450 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13106, float2(0.0), isnan(_13106))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13106, float2(0.0), isnan(_13106))).xy;
                float _5452 = _5450.x;
                float _5454 = _5450.y;
                float _5456 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5414);
                _5420 = _5454;
                _5422 = _5452;
                _5424 = _5456;
            }
        }
        float _5458 = _5420;
        float _5460 = _5422;
        float _5462 = _5424;
        float _5464 = fma(_5458, 0.5, 0.5234375);
        float _5466 = fma(_5460, 2.0, 0.03125);
        float _5468 = fma(_4644, 2.0, 0.03125);
        float _5470 = fma(_4646, 0.5, 0.0078125);
        float2 _13138 = float2(_5464, _5466);
        float _5472 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_13138, float2(0.0), isnan(_13138))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_13138, float2(0.0), isnan(_13138))).x;
        float2 _13146 = float2(_5470, _5468);
        float _5474 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_13146, float2(0.0), isnan(_13146))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_13146, float2(0.0), isnan(_13146))).x;
        float _5476 = fma(_5472, -2.007874011993408203125, 3.25);
        float _5478 = fma(_5474, -2.007874011993408203125, 3.25);
        float _5480 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _5482 = fma(_5476, _5480, _5462);
        float _5484 = fma(_5478, (*spvDescriptorSet0.fp_c3)._m0[0].w, _4648);
        float2 _13170 = float2(_153, _5482);
        float _5486 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13170, float2(0.0), isnan(_13170)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13170, float2(0.0), isnan(_13170)), int2(0, 1)).y;
        float2 _13178 = float2(_153, _5484);
        float _5488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13178, float2(0.0), isnan(_13178))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13178, float2(0.0), isnan(_13178))).y;
        float _5490 = -_151;
        float _5492 = fma(_5484, (*spvDescriptorSet0.fp_c3)._m0[0].y, _5490);
        float _5494 = -_151;
        float _5496 = fma(_5482, (*spvDescriptorSet0.fp_c3)._m0[0].y, _5494);
        float _5498 = rint(_5492);
        float _5500 = rint(_5496);
        float _5502 = abs(_5498);
        float _5504 = sqrt(_5502);
        float _5506 = abs(_5500);
        float _5508 = sqrt(_5506);
        float _5510 = _5486 * 4.0;
        float _5512 = _5488 * 4.0;
        float _5514 = rint(_5510);
        float _5516 = rint(_5512);
        float _5518 = fma(_5514, 16.0, _5508);
        float _5520 = fma(_5518, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _5522 = fma(_5516, 16.0, _5504);
        float2 _13228 = float2(_65, _5484);
        float _5524 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13228, float2(0.0), isnan(_13228)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13228, float2(0.0), isnan(_13228)), int2(1, 0)).y;
        float2 _13236 = float2(_65, _5484);
        float _5526 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13236, float2(0.0), isnan(_13236)), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13236, float2(0.0), isnan(_13236)), int2(-2, 0)).y;
        float _5528 = fma(_5522, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float _5530 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _5520);
        float2 _13251 = float2(_65, _5482);
        float _5532 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13251, float2(0.0), isnan(_13251)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13251, float2(0.0), isnan(_13251)), int2(1)).y;
        float2 _13259 = float2(_65, _5482);
        float _5534 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13259, float2(0.0), isnan(_13259)), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13259, float2(0.0), isnan(_13259)), int2(-2, 1)).y;
        float2 _13268 = float2(_5528, _5530);
        float2 _5536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_13268, float2(0.0), isnan(_13268))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_13268, float2(0.0), isnan(_13268))).xy;
        float _5538 = _5536.x;
        float _5540 = _5536.y;
        float _5542 = abs(_5500);
        float _5544 = abs(_5498);
        bool _5546 = _5542 >= _5544;
        bool _5548 = isnan(_5542);
        bool _5550 = _5546 || _5548;
        bool _5552 = isnan(_5544);
        bool _5554 = _5550 || _5552;
        float _5556 = float(_5554);
        float _5558 = abs(_5498);
        float _5560 = abs(_5500);
        bool _5562 = _5558 >= _5560;
        bool _5564 = isnan(_5558);
        bool _5566 = _5562 || _5564;
        bool _5568 = isnan(_5560);
        bool _5570 = _5566 || _5568;
        float _5572 = float(_5570);
        float _5574 = _5556 + _5572;
        float _5576 = 1.0 / _5574;
        float _5578 = _5576 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
        float _5580 = _5556 * _5578;
        float _5582 = _5572 * _5578;
        float _5584 = -_5580;
        float _5586 = fma(_5584, _5524, 1.0);
        float _5588 = -_5580;
        float _5590 = fma(_5588, _5526, 1.0);
        float _5592 = -_5582;
        float _5594 = fma(_5592, _5532, _5586);
        float _5596 = precise::clamp(_5594, 0.0, 1.0);
        float _5598 = -_5582;
        float _5600 = fma(_5598, _5534, _5590);
        float _5602 = precise::clamp(_5600, 0.0, 1.0);
        float _5604 = _5538 * _5596;
        float _5606 = _5540 * _5602;
        out.m_42.x = as_type<float>(_3638);
        out.m_42.y = as_type<float>(_3640);
        out.m_42.z = _5604;
        out.m_42.w = _5606;
        return out;
    }
    out.m_42.x = as_type<float>(_3638);
    out.m_42.y = as_type<float>(_3640);
    out.m_42.z = 0.0;
    out.m_42.w = 0.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1520 = false;
    bool _1182 = false;
    bool _704 = false;
    bool _450 = false;
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _5640 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5640, float2(0.0), isnan(_5640))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5640, float2(0.0), isnan(_5640))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_37.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_39.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_35.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_37.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _63 * _81;
    float _139 = _63 * _87;
    float _141 = _63 * _93;
    float _143 = _63 * _99;
    float _145 = _63 * _105;
    float _147 = _63 * _111;
    float _149 = _63 * _117;
    float _151 = _63 * _123;
    float _153 = _63 * _129;
    float _155 = _63 * _135;
    bool _159 = _75 > 0.0;
    bool _161 = _73 > 0.0;
    bool _163 = !_161;
    int _166 = _163 ? 0 : 1;
    int _168 = as_type<int>(_73);
    int _170 = as_type<int>(_75);
    int _172 = as_type<int>(_99);
    float _174 = _117;
    float _176 = _105;
    float _178 = _139;
    int _180 = as_type<int>(_143);
    float _182 = _111;
    float _184 = _139;
    int _186 = as_type<int>(_149);
    float _188 = _155;
    float _190 = _147;
    int _192 = _166;
    int _194 = as_type<int>(_141);
    if (!_159)
    {
        _168 = 0;
        _170 = 0;
    }
    int _196 = _168;
    int _198 = _170;
    int _200 = _196;
    int _202 = _198;
    if (!_159)
    {
        _172 = _166;
    }
    int _204 = _172;
    bool _206 = !_159;
    int _208 = _204;
    float _210 = 0.0;
    if (!_206)
    {
        if (!_161)
        {
            _174 = 0.0;
        }
        float _212 = _174;
        float _214 = _212;
        if (!_161)
        {
            _176 = 0.0;
        }
        float _216 = _176;
        bool _218 = !_161;
        float _220 = _216;
        if (!_218)
        {
            float _222 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _224 = _65 + _222;
            float _226 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _5832 = float2(_224, _226);
            float2 _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5832, float2(0.0), isnan(_5832))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5832, float2(0.0), isnan(_5832))).xy;
            float _230 = _228.x;
            float _232 = _228.y;
            float _234 = _230 + _232;
            float _236 = _234 * 0.5;
            bool _238 = _236 >= 0.89999997615814208984375;
            bool _240 = isnan(_236);
            bool _242 = _238 || _240;
            bool _244 = isnan(0.89999997615814208984375);
            bool _246 = _242 || _244;
            bool _248 = !_246;
            float _250 = _232;
            float _252 = 0.0;
            float _254 = _236;
            if (!_248)
            {
                float _256 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _258 = _224 + _256;
                float _260 = _226 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _5879 = float2(_258, _260);
                float2 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5879, float2(0.0), isnan(_5879))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5879, float2(0.0), isnan(_5879))).xy;
                float _264 = _262.x;
                float _266 = _262.y;
                float _268 = _266 + _264;
                float _270 = _268 * 0.5;
                bool _272 = _270 >= 0.89999997615814208984375;
                bool _274 = isnan(_270);
                bool _276 = _272 || _274;
                bool _278 = isnan(0.89999997615814208984375);
                bool _280 = _276 || _278;
                bool _282 = !_280;
                _250 = _266;
                _252 = 1.0;
                _254 = _270;
                if (!_282)
                {
                    float _284 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _286 = _258 + _284;
                    float _288 = _260 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _5924 = float2(_286, _288);
                    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5924, float2(0.0), isnan(_5924))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5924, float2(0.0), isnan(_5924))).xy;
                    float _292 = _290.x;
                    float _294 = _290.y;
                    float _296 = _294 + _292;
                    float _298 = _296 * 0.5;
                    bool _300 = _298 >= 0.89999997615814208984375;
                    bool _302 = isnan(_298);
                    bool _304 = _300 || _302;
                    bool _306 = isnan(0.89999997615814208984375);
                    bool _308 = _304 || _306;
                    bool _310 = !_308;
                    _250 = _294;
                    _252 = 2.0;
                    _254 = _298;
                    if (!_310)
                    {
                        float _312 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _314 = _286 + _312;
                        float _316 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _5970 = float2(_314, _316);
                        float2 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5970, float2(0.0), isnan(_5970))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5970, float2(0.0), isnan(_5970))).xy;
                        float _320 = _318.x;
                        float _322 = _318.y;
                        float _324 = _322 + _320;
                        float _326 = _324 * 0.5;
                        bool _328 = _326 >= 0.89999997615814208984375;
                        bool _330 = isnan(_326);
                        bool _332 = _328 || _330;
                        bool _334 = isnan(0.89999997615814208984375);
                        bool _336 = _332 || _334;
                        bool _338 = !_336;
                        _250 = _322;
                        _252 = 3.0;
                        _254 = _326;
                        if (!_338)
                        {
                            float _340 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _342 = _314 + _340;
                            float _344 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float2 _6016 = float2(_342, _344);
                            float2 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6016, float2(0.0), isnan(_6016))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6016, float2(0.0), isnan(_6016))).xy;
                            float _348 = _346.x;
                            float _350 = _346.y;
                            float _352 = _350 + _348;
                            float _354 = _352 * 0.5;
                            bool _356 = _354 >= 0.89999997615814208984375;
                            bool _358 = isnan(_354);
                            bool _360 = _356 || _358;
                            bool _362 = isnan(0.89999997615814208984375);
                            bool _364 = _360 || _362;
                            bool _366 = !_364;
                            _250 = _350;
                            _252 = 4.0;
                            _254 = _354;
                            if (!_366)
                            {
                                float _368 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _370 = _342 + _368;
                                float _372 = _344 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float2 _6062 = float2(_370, _372);
                                float2 _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6062, float2(0.0), isnan(_6062))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6062, float2(0.0), isnan(_6062))).xy;
                                float _376 = _374.x;
                                float _378 = _374.y;
                                float _380 = _378 + _376;
                                float _382 = _380 * 0.5;
                                bool _384 = _382 >= 0.89999997615814208984375;
                                bool _386 = isnan(_382);
                                bool _388 = _384 || _386;
                                bool _390 = isnan(0.89999997615814208984375);
                                bool _392 = _388 || _390;
                                bool _394 = !_392;
                                _250 = _378;
                                _252 = 5.0;
                                _254 = _382;
                                if (!_394)
                                {
                                    float _396 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _398 = _370 + _396;
                                    float _400 = _372 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float2 _6108 = float2(_398, _400);
                                    float2 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6108, float2(0.0), isnan(_6108))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6108, float2(0.0), isnan(_6108))).xy;
                                    float _404 = _402.x;
                                    float _406 = _402.y;
                                    float _408 = _406 + _404;
                                    float _410 = _408 * 0.5;
                                    bool _412 = _410 >= 0.89999997615814208984375;
                                    bool _414 = isnan(_410);
                                    bool _416 = _412 || _414;
                                    bool _418 = isnan(0.89999997615814208984375);
                                    bool _420 = _416 || _418;
                                    bool _422 = !_420;
                                    _250 = _406;
                                    _252 = 6.0;
                                    _254 = _410;
                                    if (!_422)
                                    {
                                        float _424 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                        float _426 = _398 + _424;
                                        float _428 = _400 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                        float2 _6154 = float2(_426, _428);
                                        float2 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6154, float2(0.0), isnan(_6154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6154, float2(0.0), isnan(_6154))).xy;
                                        float _432 = _430.x;
                                        float _434 = _430.y;
                                        float _436 = _434 + _432;
                                        float _438 = _436 * 0.5;
                                        bool _440 = _438 >= 0.89999997615814208984375;
                                        bool _442 = isnan(_438);
                                        bool _444 = _440 || _442;
                                        bool _446 = isnan(0.89999997615814208984375);
                                        bool _448 = _444 || _446;
                                        _250 = _434;
                                        _254 = _438;
                                        if (!_448)
                                        {
                                            _252 = 7.0;
                                            _450 = true;
                                        }
                                        else
                                        {
                                            _252 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _450 = false;
            float _452 = _250;
            float _454 = _252;
            float _456 = _254;
            bool _458 = _452 >= 0.89999997615814208984375;
            bool _460 = isnan(_452);
            bool _462 = _458 || _460;
            bool _464 = isnan(0.89999997615814208984375);
            bool _466 = _462 || _464;
            float _468 = float(_466);
            float _470 = _468 + _454;
            _214 = _470;
            _220 = _456;
        }
        float _472 = _214;
        float _474 = _220;
        float _476 = _65 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _478 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _480 = _67 + _478;
        float2 _6232 = float2(_476, _480);
        float2 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6232, float2(0.0), isnan(_6232))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6232, float2(0.0), isnan(_6232))).xy;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _484 + _486;
        float _490 = _488 * 0.5;
        bool _492 = _490 >= 0.89999997615814208984375;
        bool _494 = isnan(_490);
        bool _496 = _492 || _494;
        bool _498 = isnan(0.89999997615814208984375);
        bool _500 = _496 || _498;
        bool _502 = !_500;
        float _504 = 0.0;
        float _506 = _490;
        float _508 = _486;
        if (!_502)
        {
            float _510 = _476 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _512 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _514 = _480 + _512;
            float2 _6277 = float2(_510, _514);
            float2 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6277, float2(0.0), isnan(_6277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6277, float2(0.0), isnan(_6277))).xy;
            float _518 = _516.x;
            float _520 = _516.y;
            float _522 = _520 + _518;
            float _524 = _522 * 0.5;
            bool _526 = _524 >= 0.89999997615814208984375;
            bool _528 = isnan(_524);
            bool _530 = _526 || _528;
            bool _532 = isnan(0.89999997615814208984375);
            bool _534 = _530 || _532;
            bool _536 = !_534;
            _504 = 1.0;
            _506 = _524;
            _508 = _514;
            if (!_536)
            {
                float _538 = _510 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _540 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _542 = _514 + _540;
                float2 _6322 = float2(_538, _542);
                float2 _544 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6322, float2(0.0), isnan(_6322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6322, float2(0.0), isnan(_6322))).xy;
                float _546 = _544.x;
                float _548 = _544.y;
                float _550 = _548 + _546;
                float _552 = _550 * 0.5;
                bool _554 = _552 >= 0.89999997615814208984375;
                bool _556 = isnan(_552);
                bool _558 = _554 || _556;
                bool _560 = isnan(0.89999997615814208984375);
                bool _562 = _558 || _560;
                bool _564 = !_562;
                _504 = 2.0;
                _506 = _552;
                _508 = _542;
                if (!_564)
                {
                    float _566 = _538 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _568 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _570 = _542 + _568;
                    float2 _6367 = float2(_566, _570);
                    float2 _572 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6367, float2(0.0), isnan(_6367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6367, float2(0.0), isnan(_6367))).xy;
                    float _574 = _572.x;
                    float _576 = _572.y;
                    float _578 = _576 + _574;
                    float _580 = _578 * 0.5;
                    bool _582 = _580 >= 0.89999997615814208984375;
                    bool _584 = isnan(_580);
                    bool _586 = _582 || _584;
                    bool _588 = isnan(0.89999997615814208984375);
                    bool _590 = _586 || _588;
                    bool _592 = !_590;
                    _504 = 3.0;
                    _506 = _580;
                    _508 = _570;
                    if (!_592)
                    {
                        float _594 = _566 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _596 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float _598 = _570 + _596;
                        float2 _6412 = float2(_594, _598);
                        float2 _600 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6412, float2(0.0), isnan(_6412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6412, float2(0.0), isnan(_6412))).xy;
                        float _602 = _600.x;
                        float _604 = _600.y;
                        float _606 = _604 + _602;
                        float _608 = _606 * 0.5;
                        bool _610 = _608 >= 0.89999997615814208984375;
                        bool _612 = isnan(_608);
                        bool _614 = _610 || _612;
                        bool _616 = isnan(0.89999997615814208984375);
                        bool _618 = _614 || _616;
                        bool _620 = !_618;
                        _504 = 4.0;
                        _506 = _608;
                        _508 = _598;
                        if (!_620)
                        {
                            float _622 = _594 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _624 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float _626 = _598 + _624;
                            float2 _6457 = float2(_622, _626);
                            float2 _628 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6457, float2(0.0), isnan(_6457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6457, float2(0.0), isnan(_6457))).xy;
                            float _630 = _628.x;
                            float _632 = _628.y;
                            float _634 = _632 + _630;
                            float _636 = _634 * 0.5;
                            bool _638 = _636 >= 0.89999997615814208984375;
                            bool _640 = isnan(_636);
                            bool _642 = _638 || _640;
                            bool _644 = isnan(0.89999997615814208984375);
                            bool _646 = _642 || _644;
                            bool _648 = !_646;
                            _504 = 5.0;
                            _506 = _636;
                            _508 = _626;
                            if (!_648)
                            {
                                float _650 = _622 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _652 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float _654 = _626 + _652;
                                float2 _6502 = float2(_650, _654);
                                float2 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6502, float2(0.0), isnan(_6502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6502, float2(0.0), isnan(_6502))).xy;
                                float _658 = _656.x;
                                float _660 = _656.y;
                                float _662 = _660 + _658;
                                float _664 = _662 * 0.5;
                                bool _666 = _664 >= 0.89999997615814208984375;
                                bool _668 = isnan(_664);
                                bool _670 = _666 || _668;
                                bool _672 = isnan(0.89999997615814208984375);
                                bool _674 = _670 || _672;
                                bool _676 = !_674;
                                _504 = 6.0;
                                _506 = _664;
                                _508 = _654;
                                if (!_676)
                                {
                                    float _678 = _650 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _680 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float _682 = _654 + _680;
                                    float2 _6547 = float2(_678, _682);
                                    float2 _684 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6547, float2(0.0), isnan(_6547))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6547, float2(0.0), isnan(_6547))).xy;
                                    float _686 = _684.x;
                                    float _688 = _684.y;
                                    float _690 = _688 + _686;
                                    float _692 = _690 * 0.5;
                                    bool _694 = _692 >= 0.89999997615814208984375;
                                    bool _696 = isnan(_692);
                                    bool _698 = _694 || _696;
                                    bool _700 = isnan(0.89999997615814208984375);
                                    bool _702 = _698 || _700;
                                    _506 = _692;
                                    _508 = _688;
                                    if (!_702)
                                    {
                                        _504 = 7.0;
                                        _704 = true;
                                    }
                                    else
                                    {
                                        _504 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _704 = false;
        float _706 = _504;
        float _708 = _506;
        float _710 = _508;
        float _712 = _472 + _706;
        bool _714 = _712 > 2.0;
        float _716 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 0.25, _65);
        float _718 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _720 = _716 + _718;
        float _722 = _712;
        float _724 = _710;
        float _726 = _708;
        float _728 = _716;
        if (!_714)
        {
            _722 = 0.0;
            _724 = 0.0;
        }
        float _730 = _722;
        float _732 = _724;
        bool _734 = !_714;
        float _736 = _730;
        float _738 = _732;
        if (!_734)
        {
            float _740 = -_472;
            float _742 = _740 + 0.25;
            float _744 = -_706;
            float _746 = _744 + (-0.25);
            float _748 = fma(_472, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _750 = fma(_706, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _752 = fma(_742, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _754 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _6655 = float2(_752, _748);
            float2 _756 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6655, float2(0.0), isnan(_6655)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6655, float2(0.0), isnan(_6655)), int2(-1, 0)).xy;
            float _758 = _756.x;
            float _760 = _756.y;
            float2 _6670 = float2(_750, _754);
            float2 _762 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6670, float2(0.0), isnan(_6670)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6670, float2(0.0), isnan(_6670)), int2(1, 0)).xy;
            float _764 = _762.x;
            float _766 = _762.y;
            bool _768 = _708 <= 0.89999997615814208984375;
            bool _770 = isnan(_708);
            bool _772 = _768 || _770;
            bool _774 = isnan(0.89999997615814208984375);
            bool _776 = _772 || _774;
            float _778 = float(_776);
            float _780 = fma(_764, 5.0, -3.75);
            float _782 = rint(_760);
            float _784 = abs(_780);
            float _786 = _764 * _784;
            float _788 = fma(_758, 5.0, -3.75);
            float _790 = abs(_788);
            float _792 = _758 * _790;
            float _794 = rint(_766);
            bool _796 = _474 <= 0.89999997615814208984375;
            bool _798 = isnan(_474);
            bool _800 = _796 || _798;
            bool _802 = isnan(0.89999997615814208984375);
            bool _804 = _800 || _802;
            float _806 = float(_804);
            float _808 = rint(_786);
            float _810 = rint(_792);
            float _812 = fma(_794, 2.0, _808);
            float _814 = _812 * _778;
            float _816 = fma(_782, 2.0, _810);
            float _818 = fma(_814, 20.0, _706);
            float _820 = _816 * _806;
            float _822 = fma(_818, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _824 = fma(_820, 20.0, _472);
            float _826 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 0.14285714924335479736328125, _822);
            float _828 = fma(_824, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _830 = _828 + 0.5;
            float2 _6766 = float2(_830, _826);
            float2 _832 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_6766, float2(0.0), isnan(_6766))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_6766, float2(0.0), isnan(_6766))).xy;
            float _834 = _832.x;
            float _836 = _832.y;
            _726 = _826;
            _736 = _834;
            _738 = _836;
        }
        float _838 = _726;
        float _840 = _736;
        float _842 = _738;
        float2 _6785 = float2(_720, _480);
        float2 _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6785, float2(0.0), isnan(_6785))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6785, float2(0.0), isnan(_6785))).xy;
        float _846 = _844.x;
        float _848 = _844.y;
        float _850 = fma(_846, 5.0, -3.75);
        float _852 = rint(_848);
        float _854 = abs(_850);
        float _856 = _846 * _854;
        float _858 = rint(_856);
        float _860 = _858 + _852;
        float _862 = _860 * 0.5;
        bool _864 = _862 >= 0.89999997615814208984375;
        bool _866 = isnan(_862);
        bool _868 = _864 || _866;
        bool _870 = isnan(0.89999997615814208984375);
        bool _872 = _868 || _870;
        bool _874 = !_872;
        float _876 = 0.0;
        int _878 = as_type<int>(_846);
        int _880 = as_type<int>(_848);
        float _882 = _858;
        float _884 = _862;
        float _886 = _838;
        int _888 = 1084227584;
        int _890 = 1084227584;
        float _892 = _842;
        float _894 = _840;
        int _1174;
        int _1176;
        float _1178;
        float _1180;
        if (!_874)
        {
            float _896 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _898 = _720 + _896;
            float _900 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _902 = _480 + _900;
            float2 _6851 = float2(_898, _902);
            float2 _904 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6851, float2(0.0), isnan(_6851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6851, float2(0.0), isnan(_6851))).xy;
            float _906 = _904.x;
            float _908 = _904.y;
            float _910 = fma(_906, 5.0, -3.75);
            float _912 = rint(_908);
            float _914 = abs(_910);
            float _916 = _906 * _914;
            float _918 = rint(_916);
            float _920 = _918 + _912;
            float _922 = _920 * 0.5;
            bool _924 = _922 >= 0.89999997615814208984375;
            bool _926 = isnan(_922);
            bool _928 = _924 || _926;
            bool _930 = isnan(0.89999997615814208984375);
            bool _932 = _928 || _930;
            bool _934 = !_932;
            _876 = 1.0;
            _878 = as_type<int>(_906);
            _880 = as_type<int>(_908);
            _882 = _918;
            _884 = _922;
            if (!_934)
            {
                float _936 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _938 = _898 + _936;
                float _940 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _942 = _902 + _940;
                float2 _6913 = float2(_938, _942);
                float2 _944 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6913, float2(0.0), isnan(_6913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6913, float2(0.0), isnan(_6913))).xy;
                float _946 = _944.x;
                float _948 = _944.y;
                float _950 = fma(_946, 5.0, -3.75);
                float _952 = rint(_948);
                float _954 = abs(_950);
                float _956 = _946 * _954;
                float _958 = rint(_956);
                float _960 = _958 + _952;
                float _962 = _960 * 0.5;
                bool _964 = _962 >= 0.89999997615814208984375;
                bool _966 = isnan(_962);
                bool _968 = _964 || _966;
                bool _970 = isnan(0.89999997615814208984375);
                bool _972 = _968 || _970;
                bool _974 = !_972;
                _876 = 2.0;
                _878 = as_type<int>(_946);
                _880 = as_type<int>(_948);
                _882 = _958;
                _884 = _962;
                if (!_974)
                {
                    float _976 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _978 = _938 + _976;
                    float _980 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _982 = _942 + _980;
                    float2 _6975 = float2(_978, _982);
                    float2 _984 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6975, float2(0.0), isnan(_6975))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6975, float2(0.0), isnan(_6975))).xy;
                    float _986 = _984.x;
                    float _988 = _984.y;
                    float _990 = fma(_986, 5.0, -3.75);
                    float _992 = rint(_988);
                    float _994 = abs(_990);
                    float _996 = _986 * _994;
                    float _998 = rint(_996);
                    float _1000 = _998 + _992;
                    float _1002 = _1000 * 0.5;
                    bool _1004 = _1002 >= 0.89999997615814208984375;
                    bool _1006 = isnan(_1002);
                    bool _1008 = _1004 || _1006;
                    bool _1010 = isnan(0.89999997615814208984375);
                    bool _1012 = _1008 || _1010;
                    bool _1014 = !_1012;
                    _876 = 3.0;
                    _878 = as_type<int>(_986);
                    _880 = as_type<int>(_988);
                    _882 = _998;
                    _884 = _1002;
                    if (!_1014)
                    {
                        float _1016 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _1018 = _978 + _1016;
                        float _1020 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float _1022 = _982 + _1020;
                        float2 _7037 = float2(_1018, _1022);
                        float2 _1024 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7037, float2(0.0), isnan(_7037))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7037, float2(0.0), isnan(_7037))).xy;
                        float _1026 = _1024.x;
                        float _1028 = _1024.y;
                        float _1030 = fma(_1026, 5.0, -3.75);
                        float _1032 = rint(_1028);
                        float _1034 = abs(_1030);
                        float _1036 = _1026 * _1034;
                        float _1038 = rint(_1036);
                        float _1040 = _1038 + _1032;
                        float _1042 = _1040 * 0.5;
                        bool _1044 = _1042 >= 0.89999997615814208984375;
                        bool _1046 = isnan(_1042);
                        bool _1048 = _1044 || _1046;
                        bool _1050 = isnan(0.89999997615814208984375);
                        bool _1052 = _1048 || _1050;
                        bool _1054 = !_1052;
                        _876 = 4.0;
                        _878 = as_type<int>(_1026);
                        _880 = as_type<int>(_1028);
                        _882 = _1038;
                        _884 = _1042;
                        if (!_1054)
                        {
                            float _1056 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _1058 = _1018 + _1056;
                            float _1060 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float _1062 = _1022 + _1060;
                            float2 _7099 = float2(_1058, _1062);
                            float2 _1064 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7099, float2(0.0), isnan(_7099))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7099, float2(0.0), isnan(_7099))).xy;
                            float _1066 = _1064.x;
                            float _1068 = _1064.y;
                            float _1070 = fma(_1066, 5.0, -3.75);
                            float _1072 = rint(_1068);
                            float _1074 = abs(_1070);
                            float _1076 = _1066 * _1074;
                            float _1078 = rint(_1076);
                            float _1080 = _1078 + _1072;
                            float _1082 = _1080 * 0.5;
                            bool _1084 = _1082 >= 0.89999997615814208984375;
                            bool _1086 = isnan(_1082);
                            bool _1088 = _1084 || _1086;
                            bool _1090 = isnan(0.89999997615814208984375);
                            bool _1092 = _1088 || _1090;
                            bool _1094 = !_1092;
                            _876 = 5.0;
                            _878 = as_type<int>(_1066);
                            _880 = as_type<int>(_1068);
                            _882 = _1078;
                            _884 = _1082;
                            if (!_1094)
                            {
                                float _1096 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _1098 = _1058 + _1096;
                                float _1100 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float _1102 = _1062 + _1100;
                                float2 _7161 = float2(_1098, _1102);
                                float2 _1104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7161, float2(0.0), isnan(_7161))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7161, float2(0.0), isnan(_7161))).xy;
                                float _1106 = _1104.x;
                                float _1108 = _1104.y;
                                float _1110 = fma(_1106, 5.0, -3.75);
                                float _1112 = rint(_1108);
                                float _1114 = abs(_1110);
                                float _1116 = _1106 * _1114;
                                float _1118 = rint(_1116);
                                float _1120 = _1118 + _1112;
                                float _1122 = _1120 * 0.5;
                                bool _1124 = _1122 >= 0.89999997615814208984375;
                                bool _1126 = isnan(_1122);
                                bool _1128 = _1124 || _1126;
                                bool _1130 = isnan(0.89999997615814208984375);
                                bool _1132 = _1128 || _1130;
                                bool _1134 = !_1132;
                                _876 = 6.0;
                                _878 = as_type<int>(_1106);
                                _880 = as_type<int>(_1108);
                                _882 = _1118;
                                _884 = _1122;
                                if (!_1134)
                                {
                                    float _1136 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float _1138 = _1102 + _1136;
                                    float _1140 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _1142 = _1098 + _1140;
                                    float2 _7223 = float2(_1142, _1138);
                                    float2 _1144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7223, float2(0.0), isnan(_7223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7223, float2(0.0), isnan(_7223))).xy;
                                    float _1146 = _1144.x;
                                    float _1148 = _1144.y;
                                    float _1150 = fma(_1146, 5.0, -3.75);
                                    float _1152 = rint(_1148);
                                    float _1154 = abs(_1150);
                                    float _1156 = _1146 * _1154;
                                    float _1158 = rint(_1156);
                                    float _1160 = _1158 + _1152;
                                    float _1162 = _1160 * 0.5;
                                    bool _1164 = _1162 >= 0.89999997615814208984375;
                                    bool _1166 = isnan(_1162);
                                    bool _1168 = _1164 || _1166;
                                    bool _1170 = isnan(0.89999997615814208984375);
                                    bool _1172 = _1168 || _1170;
                                    _878 = as_type<int>(_1146);
                                    _880 = as_type<int>(_1148);
                                    _882 = _1158;
                                    _884 = _1162;
                                    _1174 = as_type<int>(_1146);
                                    _1176 = as_type<int>(_1148);
                                    _1178 = _1158;
                                    _1180 = _1162;
                                    _1182 = _1172;
                                    if (!_1182)
                                    {
                                        _876 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        float _1194;
        if (!_1182)
        {
            float _1184 = _876;
            int _1186 = _878;
            int _1188 = _880;
            float _1190 = _882;
            float _1192 = _884;
            _1174 = _1186;
            _1176 = _1188;
            _1194 = _1184;
            _1178 = _1190;
            _1180 = _1192;
        }
        if (false || _1182)
        {
            _1182 = false;
            _1194 = 7.0;
        }
        int _1196 = _1174;
        int _1198 = _1176;
        float _1200 = _1194;
        float _1202 = _1178;
        float _1204 = _1180;
        float2 _7309 = float2(_65, _67);
        float _1206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7309, float2(0.0), isnan(_7309)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7309, float2(0.0), isnan(_7309)), int2(1, 0)).x;
        bool _1208 = _1206 > 0.0;
        float _1210 = _1202;
        int _1212 = _1196;
        int _1214 = _1198;
        _210 = _1200;
        if (!_1208)
        {
            _1210 = 0.0;
            _886 = 0.0;
        }
        float _1216 = _1210;
        float _1218 = _886;
        bool _1220 = !_1208;
        float _1222 = _1216;
        float _1224 = _1218;
        if (!_1220)
        {
            float _1226 = _716 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1228 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _7344 = float2(_1226, _1228);
            float2 _1230 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7344, float2(0.0), isnan(_7344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7344, float2(0.0), isnan(_7344))).xy;
            float _1232 = _1230.x;
            float _1234 = _1230.y;
            float _1236 = fma(_1232, 5.0, -3.75);
            float _1238 = rint(_1234);
            float _1240 = abs(_1236);
            float _1242 = _1232 * _1240;
            float _1244 = rint(_1242);
            float _1246 = _1244 + _1238;
            float _1248 = _1246 * 0.5;
            bool _1250 = _1248 >= 0.89999997615814208984375;
            bool _1252 = isnan(_1248);
            bool _1254 = _1250 || _1252;
            bool _1256 = isnan(0.89999997615814208984375);
            bool _1258 = _1254 || _1256;
            bool _1260 = !_1258;
            float _1262 = _1238;
            float _1264 = 0.0;
            float _1266 = _1248;
            int _1268 = as_type<int>(_1244);
            _728 = _1226;
            if (!_1260)
            {
                float _1270 = _1226 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _1272 = _1228 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _7401 = float2(_1270, _1272);
                float2 _1274 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7401, float2(0.0), isnan(_7401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7401, float2(0.0), isnan(_7401))).xy;
                float _1276 = _1274.x;
                float _1278 = _1274.y;
                float _1280 = fma(_1276, 5.0, -3.75);
                float _1282 = rint(_1278);
                float _1284 = abs(_1280);
                float _1286 = _1276 * _1284;
                float _1288 = rint(_1286);
                float _1290 = _1288 + _1282;
                float _1292 = _1290 * 0.5;
                bool _1294 = _1292 >= 0.89999997615814208984375;
                bool _1296 = isnan(_1292);
                bool _1298 = _1294 || _1296;
                bool _1300 = isnan(0.89999997615814208984375);
                bool _1302 = _1298 || _1300;
                bool _1304 = !_1302;
                _1262 = _1282;
                _1264 = 1.0;
                _1266 = _1292;
                _1268 = as_type<int>(_1288);
                if (!_1304)
                {
                    float _1306 = _1270 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _1308 = _1272 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _7457 = float2(_1306, _1308);
                    float2 _1310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7457, float2(0.0), isnan(_7457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7457, float2(0.0), isnan(_7457))).xy;
                    float _1312 = _1310.x;
                    float _1314 = _1310.y;
                    float _1316 = fma(_1312, 5.0, -3.75);
                    float _1318 = rint(_1314);
                    float _1320 = abs(_1316);
                    float _1322 = _1312 * _1320;
                    float _1324 = rint(_1322);
                    float _1326 = _1324 + _1318;
                    float _1328 = _1326 * 0.5;
                    bool _1330 = _1328 >= 0.89999997615814208984375;
                    bool _1332 = isnan(_1328);
                    bool _1334 = _1330 || _1332;
                    bool _1336 = isnan(0.89999997615814208984375);
                    bool _1338 = _1334 || _1336;
                    bool _1340 = !_1338;
                    _1262 = _1318;
                    _1264 = 2.0;
                    _1266 = _1328;
                    _1268 = as_type<int>(_1324);
                    if (!_1340)
                    {
                        float _1342 = _1306 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _1344 = _1308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _7513 = float2(_1342, _1344);
                        float2 _1346 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7513, float2(0.0), isnan(_7513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7513, float2(0.0), isnan(_7513))).xy;
                        float _1348 = _1346.x;
                        float _1350 = _1346.y;
                        float _1352 = fma(_1348, 5.0, -3.75);
                        float _1354 = rint(_1350);
                        float _1356 = abs(_1352);
                        float _1358 = _1348 * _1356;
                        float _1360 = rint(_1358);
                        float _1362 = _1360 + _1354;
                        float _1364 = _1362 * 0.5;
                        bool _1366 = _1364 >= 0.89999997615814208984375;
                        bool _1368 = isnan(_1364);
                        bool _1370 = _1366 || _1368;
                        bool _1372 = isnan(0.89999997615814208984375);
                        bool _1374 = _1370 || _1372;
                        bool _1376 = !_1374;
                        _1262 = _1354;
                        _1264 = 3.0;
                        _1266 = _1364;
                        _1268 = as_type<int>(_1360);
                        if (!_1376)
                        {
                            float _1378 = _1342 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                            float _1380 = _1344 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                            float2 _7569 = float2(_1378, _1380);
                            float2 _1382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7569, float2(0.0), isnan(_7569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7569, float2(0.0), isnan(_7569))).xy;
                            float _1384 = _1382.x;
                            float _1386 = _1382.y;
                            float _1388 = fma(_1384, 5.0, -3.75);
                            float _1390 = rint(_1386);
                            float _1392 = abs(_1388);
                            float _1394 = _1384 * _1392;
                            float _1396 = rint(_1394);
                            float _1398 = _1396 + _1390;
                            float _1400 = _1398 * 0.5;
                            bool _1402 = _1400 >= 0.89999997615814208984375;
                            bool _1404 = isnan(_1400);
                            bool _1406 = _1402 || _1404;
                            bool _1408 = isnan(0.89999997615814208984375);
                            bool _1410 = _1406 || _1408;
                            bool _1412 = !_1410;
                            _1262 = _1390;
                            _1264 = 4.0;
                            _1266 = _1400;
                            _1268 = as_type<int>(_1396);
                            if (!_1412)
                            {
                                float _1414 = _1378 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                float _1416 = _1380 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                float2 _7625 = float2(_1414, _1416);
                                float2 _1418 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7625, float2(0.0), isnan(_7625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7625, float2(0.0), isnan(_7625))).xy;
                                float _1420 = _1418.x;
                                float _1422 = _1418.y;
                                float _1424 = fma(_1420, 5.0, -3.75);
                                float _1426 = rint(_1422);
                                float _1428 = abs(_1424);
                                float _1430 = _1420 * _1428;
                                float _1432 = rint(_1430);
                                float _1434 = _1432 + _1426;
                                float _1436 = _1434 * 0.5;
                                bool _1438 = _1436 >= 0.89999997615814208984375;
                                bool _1440 = isnan(_1436);
                                bool _1442 = _1438 || _1440;
                                bool _1444 = isnan(0.89999997615814208984375);
                                bool _1446 = _1442 || _1444;
                                bool _1448 = !_1446;
                                _1262 = _1426;
                                _1264 = 5.0;
                                _1266 = _1436;
                                _1268 = as_type<int>(_1432);
                                if (!_1448)
                                {
                                    float _1450 = _1414 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                    float _1452 = _1416 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                    float2 _7681 = float2(_1450, _1452);
                                    float2 _1454 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7681, float2(0.0), isnan(_7681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7681, float2(0.0), isnan(_7681))).xy;
                                    float _1456 = _1454.x;
                                    float _1458 = _1454.y;
                                    float _1460 = fma(_1456, 5.0, -3.75);
                                    float _1462 = rint(_1458);
                                    float _1464 = abs(_1460);
                                    float _1466 = _1456 * _1464;
                                    float _1468 = rint(_1466);
                                    float _1470 = _1468 + _1462;
                                    float _1472 = _1470 * 0.5;
                                    bool _1474 = _1472 >= 0.89999997615814208984375;
                                    bool _1476 = isnan(_1472);
                                    bool _1478 = _1474 || _1476;
                                    bool _1480 = isnan(0.89999997615814208984375);
                                    bool _1482 = _1478 || _1480;
                                    bool _1484 = !_1482;
                                    _1262 = _1462;
                                    _1264 = 6.0;
                                    _1266 = _1472;
                                    _1268 = as_type<int>(_1468);
                                    if (!_1484)
                                    {
                                        float _1486 = _1450 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                                        float _1488 = _1452 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                                        float2 _7737 = float2(_1486, _1488);
                                        float2 _1490 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7737, float2(0.0), isnan(_7737))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7737, float2(0.0), isnan(_7737))).xy;
                                        float _1492 = _1490.x;
                                        float _1494 = _1490.y;
                                        float _1496 = fma(_1492, 5.0, -3.75);
                                        float _1498 = rint(_1494);
                                        float _1500 = abs(_1496);
                                        float _1502 = _1492 * _1500;
                                        float _1504 = rint(_1502);
                                        float _1506 = _1504 + _1498;
                                        float _1508 = _1506 * 0.5;
                                        bool _1510 = _1508 >= 0.89999997615814208984375;
                                        bool _1512 = isnan(_1508);
                                        bool _1514 = _1510 || _1512;
                                        bool _1516 = isnan(0.89999997615814208984375);
                                        bool _1518 = _1514 || _1516;
                                        _1262 = _1498;
                                        _1266 = _1508;
                                        _888 = as_type<int>(_1504);
                                        _1268 = as_type<int>(_1492);
                                        if (!_1518)
                                        {
                                            _1264 = 7.0;
                                            _1520 = true;
                                        }
                                        else
                                        {
                                            _1264 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _1520 = false;
            float _1522 = _1262;
            float _1524 = _1264;
            float _1526 = _1266;
            int _1528 = _888;
            int _1530 = _1268;
            bool _1532 = _1522 >= 0.89999997615814208984375;
            bool _1534 = isnan(_1522);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan(0.89999997615814208984375);
            bool _1540 = _1536 || _1538;
            float _1542 = float(_1540);
            float _1544 = _1542 + _1524;
            _1222 = _1544;
            _1224 = _1526;
            _890 = _1528;
            _1212 = _1530;
            _1214 = as_type<int>(_1522);
        }
        float _1546 = _1222;
        float _1548 = _1224;
        float _1550 = _728;
        int _1552 = _890;
        int _1554 = _1212;
        int _1556 = _1214;
        float _1558 = _1200 + _1546;
        bool _1560 = _1558 > 2.0;
        bool _1562 = !_1560;
        float _1564 = _1550;
        int _1566 = _1552;
        int _1568 = _1554;
        int _1570 = _1556;
        int _1572 = as_type<int>(_1558);
        if (!_1562)
        {
            float _1574 = fma(_1546, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1576 = fma(_1546, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _1578 = -_1200;
            float _1580 = fma(_1578, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1582 = -_1200;
            float _1584 = fma(_1582, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _7868 = float2(_1574, _1576);
            float2 _1586 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7868, float2(0.0), isnan(_7868)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7868, float2(0.0), isnan(_7868)), int2(1, 0)).xy;
            float _1588 = _1586.x;
            float _1590 = _1586.y;
            float2 _7880 = float2(_1580, _1584);
            float _1592 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7880, float2(0.0), isnan(_7880)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7880, float2(0.0), isnan(_7880)), int2(-1, 0)).y;
            float2 _7888 = float2(_1580, _1584);
            float _1594 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7888, float2(0.0), isnan(_7888)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7888, float2(0.0), isnan(_7888)), int2(0, -1)).x;
            bool _1596 = _1548 >= 0.89999997615814208984375;
            bool _1598 = isnan(_1548);
            bool _1600 = _1596 || _1598;
            bool _1602 = isnan(0.89999997615814208984375);
            bool _1604 = _1600 || _1602;
            float _1606 = float(_1604);
            bool _1608 = _1204 >= 0.89999997615814208984375;
            bool _1610 = isnan(_1204);
            bool _1612 = _1608 || _1610;
            bool _1614 = isnan(0.89999997615814208984375);
            bool _1616 = _1612 || _1614;
            float _1618 = float(_1616);
            float _1620 = fma(_1590, 2.0, _1588);
            float _1622 = fma(_1592, 2.0, _1594);
            float _1624 = _1620 * _1606;
            float _1626 = _1622 * _1618;
            float _1628 = fma(_1624, 20.0, _1546);
            float _1630 = fma(_1626, 20.0, _1200);
            float _1632 = fma(_1628, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _1634 = fma(_1630, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _1636 = fma((*spvDescriptorSet0.fp_c3)._m0[3].w, 0.14285714924335479736328125, _1632);
            float _1638 = _1634 + 0.5;
            float2 _7951 = float2(_1638, _1636);
            float2 _1640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_7951, float2(0.0), isnan(_7951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_7951, float2(0.0), isnan(_7951))).xy;
            float _1642 = _1640.x;
            float _1644 = _1640.y;
            float _1646 = _1644 + _840;
            float _1648 = _1642 + _842;
            _892 = _1648;
            _894 = _1646;
            _1564 = _1638;
            _1566 = as_type<int>(_1644);
            _1568 = as_type<int>(_1588);
            _1570 = 1011666125;
            _1572 = as_type<int>(_1642);
        }
        float _1650 = _892;
        float _1652 = _894;
        float _1654 = _1564;
        int _1656 = _1566;
        int _1658 = _1568;
        int _1660 = _1570;
        int _1662 = _1572;
        float _1664 = -_1650;
        bool _1666 = _1652 != _1664;
        bool _1668 = isnan(_1652);
        bool _1670 = _1666 || _1668;
        bool _1672 = isnan(_1664);
        bool _1674 = _1670 || _1672;
        int _1676 = _1662;
        int _1678 = _1656;
        int _1680 = _1658;
        int _1682 = _1660;
        _182 = _1654;
        _200 = as_type<int>(_1652);
        _202 = as_type<int>(_1650);
        if (_1674)
        {
            _1676 = 0;
        }
        int _1684 = _1676;
        _208 = _1684;
        if (!_1674)
        {
            float2 _8019 = float2(_153, _143);
            float2 _1686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8019, float2(0.0), isnan(_8019))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8019, float2(0.0), isnan(_8019))).xy;
            float _1688 = _1686.x;
            float _1690 = _1686.y;
            float2 _8031 = float2(_139, _137);
            float2 _1692 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8031, float2(0.0), isnan(_8031))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8031, float2(0.0), isnan(_8031))).xy;
            float _1694 = _1692.x;
            float _1696 = _1692.y;
            float _1698 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _153);
            float _1700 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _139);
            bool _1702 = _1690 >= 0.800000011920928955078125;
            bool _1704 = isnan(_1690);
            bool _1706 = _1702 || _1704;
            bool _1708 = isnan(0.800000011920928955078125);
            bool _1710 = _1706 || _1708;
            bool _1712 = _1696 > 0.800000011920928955078125;
            bool _1714 = isnan(_1696);
            bool _1716 = _1712 || _1714;
            bool _1718 = isnan(0.800000011920928955078125);
            bool _1720 = _1716 || _1718;
            bool _1722 = _1688 != 0.0;
            bool _1724 = isnan(_1688);
            bool _1726 = _1722 || _1724;
            bool _1728 = isnan(0.0);
            bool _1730 = _1726 || _1728;
            bool _1732 = !_1710;
            bool _1734 = _1730 || _1732;
            bool _1736 = _1694 != 0.0;
            bool _1738 = isnan(_1694);
            bool _1740 = _1736 || _1738;
            bool _1742 = isnan(0.0);
            bool _1744 = _1740 || _1742;
            bool _1746 = !_1720;
            bool _1748 = _1744 || _1746;
            float _1750 = _1688;
            float _1752 = _1690;
            int _1754 = as_type<int>(_1698);
            float _1756 = _1700;
            if (!_1734)
            {
                float2 _8115 = float2(_1698, _143);
                float2 _1758 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8115, float2(0.0), isnan(_8115))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8115, float2(0.0), isnan(_8115))).xy;
                float _1760 = _1758.x;
                float _1762 = _1758.y;
                _1750 = _1760;
                _1752 = _1762;
            }
            float _1764 = _1750;
            float _1766 = _1752;
            float _1768 = _1694;
            float _1770 = _1696;
            if (!_1748)
            {
                float2 _8137 = float2(_1700, _137);
                float2 _1772 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8137, float2(0.0), isnan(_8137))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8137, float2(0.0), isnan(_8137))).xy;
                float _1774 = _1772.x;
                float _1776 = _1772.y;
                _1768 = _1774;
                _1770 = _1776;
            }
            float _1778 = _1768;
            float _1780 = _1770;
            if (_1734)
            {
                _1678 = 1;
            }
            int _1782 = _1678;
            int _1784 = _1782;
            if (!_1734)
            {
                _1784 = 0;
            }
            int _1786 = _1784;
            int _1788 = _1786;
            if (_1734)
            {
                _178 = _1698;
            }
            float _1790 = _178;
            float _1792 = _1790;
            if (!_1734)
            {
                float _1794 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1698);
                _1792 = _1794;
            }
            float _1796 = _1792;
            int _1798 = _1786 & 1;
            bool _1800 = _1798 != 0;
            float _1802 = _1796;
            if (_1800)
            {
                _1680 = _1786;
            }
            int _1804 = _1680;
            int _1806 = _1804;
            int _1808 = _1804;
            float _1810 = _1766;
            float _1812 = _1764;
            float _1814 = _1780;
            float _1816 = _1778;
            if (!_1800)
            {
                bool _1818 = _1766 >= 0.800000011920928955078125;
                bool _1820 = isnan(_1766);
                bool _1822 = _1818 || _1820;
                bool _1824 = isnan(0.800000011920928955078125);
                bool _1826 = _1822 || _1824;
                bool _1828 = _1764 != 0.0;
                bool _1830 = isnan(_1764);
                bool _1832 = _1828 || _1830;
                bool _1834 = isnan(0.0);
                bool _1836 = _1832 || _1834;
                bool _1838 = !_1826;
                bool _1840 = _1836 || _1838;
                if (_1840)
                {
                    _1806 = 1;
                }
                int _1842 = _1806;
                _1808 = _1842;
                if (!_1840)
                {
                    float2 _8235 = float2(_1796, _143);
                    float2 _1844 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8235, float2(0.0), isnan(_8235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8235, float2(0.0), isnan(_8235))).xy;
                    float _1846 = _1844.x;
                    float _1848 = _1844.y;
                    float _1850 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1796);
                    _1808 = _1786;
                    _1810 = _1848;
                    _1812 = _1846;
                    _1802 = _1850;
                }
            }
            int _1852 = _1808;
            float _1854 = _1810;
            float _1856 = _1812;
            float _1858 = _1802;
            int _1860 = _1852 & 1;
            bool _1862 = _1860 != 0;
            float _1864 = _1854;
            float _1866 = _1856;
            float _1868 = _1858;
            float _1870 = as_type<float>(_1852);
            if (_1862)
            {
                _1788 = _1852;
            }
            int _1872 = _1788;
            int _1874 = _1872;
            int _1876 = _1872;
            if (!_1862)
            {
                bool _1878 = _1854 >= 0.800000011920928955078125;
                bool _1880 = isnan(_1854);
                bool _1882 = _1878 || _1880;
                bool _1884 = isnan(0.800000011920928955078125);
                bool _1886 = _1882 || _1884;
                bool _1888 = _1856 != 0.0;
                bool _1890 = isnan(_1856);
                bool _1892 = _1888 || _1890;
                bool _1894 = isnan(0.0);
                bool _1896 = _1892 || _1894;
                bool _1898 = !_1886;
                bool _1900 = _1896 || _1898;
                if (_1900)
                {
                    _1874 = 1;
                }
                int _1902 = _1874;
                _1876 = _1902;
                if (!_1900)
                {
                    float2 _8315 = float2(_1858, _143);
                    float2 _1904 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8315, float2(0.0), isnan(_8315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8315, float2(0.0), isnan(_8315))).xy;
                    float _1906 = _1904.x;
                    float _1908 = _1904.y;
                    float _1910 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1858);
                    _1876 = _1852;
                    _1864 = _1908;
                    _1866 = _1906;
                    _1868 = _1910;
                }
            }
            int _1912 = _1876;
            float _1914 = _1864;
            float _1916 = _1866;
            float _1918 = _1868;
            int _1920 = _1912 & 1;
            bool _1922 = _1920 != 0;
            float _1924 = _1914;
            float _1926 = _1916;
            float _1928 = _1918;
            int _1930 = _1912;
            if (_1922)
            {
                _1754 = _1912;
            }
            int _1932 = _1754;
            int _1934 = _1932;
            int _1936 = _1932;
            if (!_1922)
            {
                bool _1938 = _1914 >= 0.800000011920928955078125;
                bool _1940 = isnan(_1914);
                bool _1942 = _1938 || _1940;
                bool _1944 = isnan(0.800000011920928955078125);
                bool _1946 = _1942 || _1944;
                bool _1948 = _1916 != 0.0;
                bool _1950 = isnan(_1916);
                bool _1952 = _1948 || _1950;
                bool _1954 = isnan(0.0);
                bool _1956 = _1952 || _1954;
                bool _1958 = !_1946;
                bool _1960 = _1956 || _1958;
                if (_1960)
                {
                    _1934 = 1;
                }
                int _1962 = _1934;
                _1936 = _1962;
                if (!_1960)
                {
                    float2 _8394 = float2(_1918, _143);
                    float2 _1964 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8394, float2(0.0), isnan(_8394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8394, float2(0.0), isnan(_8394))).xy;
                    float _1966 = _1964.x;
                    float _1968 = _1964.y;
                    float _1970 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1918);
                    _1936 = _1912;
                    _1924 = _1968;
                    _1926 = _1966;
                    _1928 = _1970;
                }
            }
            int _1972 = _1936;
            float _1974 = _1924;
            float _1976 = _1926;
            float _1978 = _1928;
            int _1980 = _1972 & 1;
            bool _1982 = _1980 != 0;
            float _1984 = _1974;
            float _1986 = _1976;
            float _1988 = _1978;
            int _1990 = _1972;
            if (_1982)
            {
                _1930 = _1972;
            }
            int _1992 = _1930;
            int _1994 = _1992;
            int _1996 = _1992;
            if (!_1982)
            {
                bool _1998 = _1974 >= 0.800000011920928955078125;
                bool _2000 = isnan(_1974);
                bool _2002 = _1998 || _2000;
                bool _2004 = isnan(0.800000011920928955078125);
                bool _2006 = _2002 || _2004;
                bool _2008 = _1976 != 0.0;
                bool _2010 = isnan(_1976);
                bool _2012 = _2008 || _2010;
                bool _2014 = isnan(0.0);
                bool _2016 = _2012 || _2014;
                bool _2018 = !_2006;
                bool _2020 = _2016 || _2018;
                if (_2020)
                {
                    _1994 = 1;
                }
                int _2022 = _1994;
                _1996 = _2022;
                if (!_2020)
                {
                    float2 _8473 = float2(_1978, _143);
                    float2 _2024 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8473, float2(0.0), isnan(_8473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8473, float2(0.0), isnan(_8473))).xy;
                    float _2026 = _2024.x;
                    float _2028 = _2024.y;
                    float _2030 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1978);
                    _1996 = _1972;
                    _1984 = _2028;
                    _1986 = _2026;
                    _1988 = _2030;
                }
            }
            int _2032 = _1996;
            float _2034 = _1984;
            float _2036 = _1986;
            float _2038 = _1988;
            int _2040 = _2032 & 1;
            bool _2042 = _2040 != 0;
            float _2044 = _2034;
            float _2046 = _2036;
            float _2048 = _2038;
            int _2050 = _2032;
            if (_2042)
            {
                _1990 = _2032;
            }
            int _2052 = _1990;
            int _2054 = _2052;
            int _2056 = _2052;
            if (!_2042)
            {
                bool _2058 = _2034 >= 0.800000011920928955078125;
                bool _2060 = isnan(_2034);
                bool _2062 = _2058 || _2060;
                bool _2064 = isnan(0.800000011920928955078125);
                bool _2066 = _2062 || _2064;
                bool _2068 = _2036 != 0.0;
                bool _2070 = isnan(_2036);
                bool _2072 = _2068 || _2070;
                bool _2074 = isnan(0.0);
                bool _2076 = _2072 || _2074;
                bool _2078 = !_2066;
                bool _2080 = _2076 || _2078;
                if (_2080)
                {
                    _2054 = 1;
                }
                int _2082 = _2054;
                _2056 = _2082;
                if (!_2080)
                {
                    float2 _8552 = float2(_2038, _143);
                    float2 _2084 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8552, float2(0.0), isnan(_8552))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8552, float2(0.0), isnan(_8552))).xy;
                    float _2086 = _2084.x;
                    float _2088 = _2084.y;
                    float _2090 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2038);
                    _2056 = _2032;
                    _2044 = _2088;
                    _2046 = _2086;
                    _2048 = _2090;
                }
            }
            int _2092 = _2056;
            float _2094 = _2044;
            float _2096 = _2046;
            float _2098 = _2048;
            int _2100 = _2092 & 1;
            bool _2102 = _2100 != 0;
            float _2104 = _2094;
            float _2106 = _2096;
            float _2108 = _2098;
            int _2110 = _2092;
            if (_2102)
            {
                _2050 = _2092;
            }
            int _2112 = _2050;
            int _2114 = _2112;
            int _2116 = _2112;
            if (!_2102)
            {
                bool _2118 = _2094 >= 0.800000011920928955078125;
                bool _2120 = isnan(_2094);
                bool _2122 = _2118 || _2120;
                bool _2124 = isnan(0.800000011920928955078125);
                bool _2126 = _2122 || _2124;
                bool _2128 = _2096 != 0.0;
                bool _2130 = isnan(_2096);
                bool _2132 = _2128 || _2130;
                bool _2134 = isnan(0.0);
                bool _2136 = _2132 || _2134;
                bool _2138 = !_2126;
                bool _2140 = _2136 || _2138;
                if (_2140)
                {
                    _2114 = 1;
                }
                int _2142 = _2114;
                _2116 = _2142;
                if (!_2140)
                {
                    float2 _8631 = float2(_2098, _143);
                    float2 _2144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8631, float2(0.0), isnan(_8631))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8631, float2(0.0), isnan(_8631))).xy;
                    float _2146 = _2144.x;
                    float _2148 = _2144.y;
                    float _2150 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2098);
                    _2116 = _2092;
                    _2104 = _2148;
                    _2106 = _2146;
                    _2108 = _2150;
                }
            }
            int _2152 = _2116;
            float _2154 = _2104;
            float _2156 = _2106;
            float _2158 = _2108;
            int _2160 = _2152 & 1;
            bool _2162 = _2160 != 0;
            float _2164 = _2154;
            float _2166 = _2156;
            float _2168 = _2158;
            int _2170 = _2152;
            if (_2162)
            {
                _2110 = _2152;
            }
            int _2172 = _2110;
            int _2174 = _2172;
            int _2176 = _2172;
            if (!_2162)
            {
                bool _2178 = _2154 >= 0.800000011920928955078125;
                bool _2180 = isnan(_2154);
                bool _2182 = _2178 || _2180;
                bool _2184 = isnan(0.800000011920928955078125);
                bool _2186 = _2182 || _2184;
                bool _2188 = _2156 != 0.0;
                bool _2190 = isnan(_2156);
                bool _2192 = _2188 || _2190;
                bool _2194 = isnan(0.0);
                bool _2196 = _2192 || _2194;
                bool _2198 = !_2186;
                bool _2200 = _2196 || _2198;
                if (_2200)
                {
                    _2174 = 1;
                }
                int _2202 = _2174;
                _2176 = _2202;
                if (!_2200)
                {
                    float2 _8710 = float2(_2158, _143);
                    float2 _2204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8710, float2(0.0), isnan(_8710))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8710, float2(0.0), isnan(_8710))).xy;
                    float _2206 = _2204.x;
                    float _2208 = _2204.y;
                    float _2210 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2158);
                    _2176 = _2152;
                    _2164 = _2208;
                    _2166 = _2206;
                    _2168 = _2210;
                }
            }
            int _2212 = _2176;
            float _2214 = _2164;
            float _2216 = _2166;
            float _2218 = _2168;
            int _2220 = _2212 & 1;
            bool _2222 = _2220 != 0;
            float _2224 = _2214;
            float _2226 = _2216;
            float _2228 = _2218;
            int _2230 = _2212;
            if (_2222)
            {
                _2170 = _2212;
            }
            int _2232 = _2170;
            int _2234 = _2232;
            int _2236 = _2232;
            if (!_2222)
            {
                bool _2238 = _2214 >= 0.800000011920928955078125;
                bool _2240 = isnan(_2214);
                bool _2242 = _2238 || _2240;
                bool _2244 = isnan(0.800000011920928955078125);
                bool _2246 = _2242 || _2244;
                bool _2248 = _2216 != 0.0;
                bool _2250 = isnan(_2216);
                bool _2252 = _2248 || _2250;
                bool _2254 = isnan(0.0);
                bool _2256 = _2252 || _2254;
                bool _2258 = !_2246;
                bool _2260 = _2256 || _2258;
                if (_2260)
                {
                    _2234 = 1;
                }
                int _2262 = _2234;
                _2236 = _2262;
                if (!_2260)
                {
                    float2 _8789 = float2(_2218, _143);
                    float2 _2264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8789, float2(0.0), isnan(_8789))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8789, float2(0.0), isnan(_8789))).xy;
                    float _2266 = _2264.x;
                    float _2268 = _2264.y;
                    float _2270 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2218);
                    _2236 = _2212;
                    _2224 = _2268;
                    _2226 = _2266;
                    _2228 = _2270;
                }
            }
            int _2272 = _2236;
            float _2274 = _2224;
            float _2276 = _2226;
            float _2278 = _2228;
            int _2280 = _2272 & 1;
            bool _2282 = _2280 != 0;
            float _2284 = _2274;
            float _2286 = _2276;
            float _2288 = _2278;
            int _2290 = _2272;
            if (_2282)
            {
                _2230 = _2272;
            }
            int _2292 = _2230;
            int _2294 = _2292;
            int _2296 = _2292;
            if (!_2282)
            {
                bool _2298 = _2274 >= 0.800000011920928955078125;
                bool _2300 = isnan(_2274);
                bool _2302 = _2298 || _2300;
                bool _2304 = isnan(0.800000011920928955078125);
                bool _2306 = _2302 || _2304;
                bool _2308 = _2276 != 0.0;
                bool _2310 = isnan(_2276);
                bool _2312 = _2308 || _2310;
                bool _2314 = isnan(0.0);
                bool _2316 = _2312 || _2314;
                bool _2318 = !_2306;
                bool _2320 = _2316 || _2318;
                if (_2320)
                {
                    _2294 = 1;
                }
                int _2322 = _2294;
                _2296 = _2322;
                if (!_2320)
                {
                    float2 _8868 = float2(_2278, _143);
                    float2 _2324 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8868, float2(0.0), isnan(_8868))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8868, float2(0.0), isnan(_8868))).xy;
                    float _2326 = _2324.x;
                    float _2328 = _2324.y;
                    float _2330 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2278);
                    _2296 = _2272;
                    _2284 = _2328;
                    _2286 = _2326;
                    _2288 = _2330;
                }
            }
            int _2332 = _2296;
            float _2334 = _2284;
            float _2336 = _2286;
            float _2338 = _2288;
            int _2340 = _2332 & 1;
            bool _2342 = _2340 != 0;
            float _2344 = _2334;
            float _2346 = _2336;
            float _2348 = _2338;
            int _2350 = _2332;
            if (_2342)
            {
                _2290 = _2332;
            }
            int _2352 = _2290;
            int _2354 = _2352;
            int _2356 = _2352;
            if (!_2342)
            {
                bool _2358 = _2334 >= 0.800000011920928955078125;
                bool _2360 = isnan(_2334);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan(0.800000011920928955078125);
                bool _2366 = _2362 || _2364;
                bool _2368 = _2336 != 0.0;
                bool _2370 = isnan(_2336);
                bool _2372 = _2368 || _2370;
                bool _2374 = isnan(0.0);
                bool _2376 = _2372 || _2374;
                bool _2378 = !_2366;
                bool _2380 = _2376 || _2378;
                if (_2380)
                {
                    _2354 = 1;
                }
                int _2382 = _2354;
                _2356 = _2382;
                if (!_2380)
                {
                    float2 _8947 = float2(_2338, _143);
                    float2 _2384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8947, float2(0.0), isnan(_8947))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8947, float2(0.0), isnan(_8947))).xy;
                    float _2386 = _2384.x;
                    float _2388 = _2384.y;
                    float _2390 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2338);
                    _2356 = _2332;
                    _2344 = _2388;
                    _2346 = _2386;
                    _2348 = _2390;
                }
            }
            int _2392 = _2356;
            float _2394 = _2344;
            float _2396 = _2346;
            float _2398 = _2348;
            int _2400 = _2392 & 1;
            bool _2402 = _2400 != 0;
            float _2404 = _2394;
            float _2406 = _2396;
            float _2408 = _2398;
            int _2410 = _2392;
            if (_2402)
            {
                _2350 = _2392;
            }
            int _2412 = _2350;
            int _2414 = _2412;
            int _2416 = _2412;
            if (!_2402)
            {
                bool _2418 = _2394 >= 0.800000011920928955078125;
                bool _2420 = isnan(_2394);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan(0.800000011920928955078125);
                bool _2426 = _2422 || _2424;
                bool _2428 = _2396 != 0.0;
                bool _2430 = isnan(_2396);
                bool _2432 = _2428 || _2430;
                bool _2434 = isnan(0.0);
                bool _2436 = _2432 || _2434;
                bool _2438 = !_2426;
                bool _2440 = _2436 || _2438;
                if (_2440)
                {
                    _2414 = 1;
                }
                int _2442 = _2414;
                _2416 = _2442;
                if (!_2440)
                {
                    float2 _9026 = float2(_2398, _143);
                    float2 _2444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9026, float2(0.0), isnan(_9026))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9026, float2(0.0), isnan(_9026))).xy;
                    float _2446 = _2444.x;
                    float _2448 = _2444.y;
                    float _2450 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2398);
                    _2416 = _2392;
                    _2404 = _2448;
                    _2406 = _2446;
                    _2408 = _2450;
                }
            }
            int _2452 = _2416;
            float _2454 = _2404;
            float _2456 = _2406;
            float _2458 = _2408;
            int _2460 = _2452 & 1;
            bool _2462 = _2460 != 0;
            float _2464 = _2454;
            float _2466 = _2456;
            float _2468 = _2458;
            int _2470 = _2452;
            if (_2462)
            {
                _2410 = _2452;
            }
            int _2472 = _2410;
            int _2474 = _2472;
            int _2476 = _2472;
            if (!_2462)
            {
                bool _2478 = _2454 >= 0.800000011920928955078125;
                bool _2480 = isnan(_2454);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan(0.800000011920928955078125);
                bool _2486 = _2482 || _2484;
                bool _2488 = _2456 != 0.0;
                bool _2490 = isnan(_2456);
                bool _2492 = _2488 || _2490;
                bool _2494 = isnan(0.0);
                bool _2496 = _2492 || _2494;
                bool _2498 = !_2486;
                bool _2500 = _2496 || _2498;
                if (_2500)
                {
                    _2474 = 1;
                }
                int _2502 = _2474;
                _2476 = _2502;
                if (!_2500)
                {
                    float2 _9105 = float2(_2458, _143);
                    float2 _2504 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9105, float2(0.0), isnan(_9105))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9105, float2(0.0), isnan(_9105))).xy;
                    float _2506 = _2504.x;
                    float _2508 = _2504.y;
                    float _2510 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2458);
                    _2476 = _2452;
                    _2464 = _2508;
                    _2466 = _2506;
                    _2468 = _2510;
                }
            }
            int _2512 = _2476;
            float _2514 = _2464;
            float _2516 = _2466;
            float _2518 = _2468;
            int _2520 = _2512 & 1;
            bool _2522 = _2520 != 0;
            float _2524 = _2518;
            float _2526 = _2516;
            float _2528 = _2514;
            float _2530 = as_type<float>(_2512);
            if (_1748)
            {
                _1682 = 1;
            }
            int _2532 = _1682;
            int _2534 = _2532;
            if (!_1748)
            {
                _2534 = 0;
            }
            int _2536 = _2534;
            int _2538 = _2536 & 1;
            bool _2540 = _2538 != 0;
            if (_2522)
            {
                _2470 = _2512;
            }
            int _2542 = _2470;
            int _2544 = _2542;
            int _2546 = _2542;
            if (!_2522)
            {
                bool _2548 = _2514 >= 0.800000011920928955078125;
                bool _2550 = isnan(_2514);
                bool _2552 = _2548 || _2550;
                bool _2554 = isnan(0.800000011920928955078125);
                bool _2556 = _2552 || _2554;
                bool _2558 = _2516 != 0.0;
                bool _2560 = isnan(_2516);
                bool _2562 = _2558 || _2560;
                bool _2564 = isnan(0.0);
                bool _2566 = _2562 || _2564;
                bool _2568 = !_2556;
                bool _2570 = _2566 || _2568;
                if (_2570)
                {
                    _2544 = 1;
                }
                int _2572 = _2544;
                _2546 = _2572;
                if (!_2570)
                {
                    float2 _9199 = float2(_2518, _143);
                    float2 _2574 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9199, float2(0.0), isnan(_9199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9199, float2(0.0), isnan(_9199))).xy;
                    float _2576 = _2574.x;
                    float _2578 = _2574.y;
                    float _2580 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2518);
                    _2546 = _2512;
                    _2524 = _2580;
                    _2526 = _2576;
                    _2528 = _2578;
                }
            }
            int _2582 = _2546;
            float _2584 = _2524;
            float _2586 = _2526;
            float _2588 = _2528;
            int _2590 = _2582 & 1;
            bool _2592 = _2590 != 0;
            float _2594 = as_type<float>(_2582);
            int _2596 = as_type<int>(_2584);
            if (_1748)
            {
                _1870 = _1700;
            }
            float _2598 = _1870;
            float _2600 = _2598;
            if (!_1748)
            {
                float _2602 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _1700);
                _2600 = _2602;
            }
            float _2604 = _2600;
            float _2606 = _2604;
            if (_2592)
            {
                _2594 = _2584;
            }
            float _2608 = _2594;
            float _2610 = _2608;
            float _2612 = _2608;
            if (_2592)
            {
                _1756 = _2586;
            }
            float _2614 = _1756;
            float _2616 = _2614;
            float _2618 = _2614;
            if (_2592)
            {
                _2530 = _2588;
            }
            float _2620 = _2530;
            float _2622 = _2620;
            float _2624 = _2620;
            if (!_2592)
            {
                bool _2626 = _2588 >= 0.800000011920928955078125;
                bool _2628 = isnan(_2588);
                bool _2630 = _2626 || _2628;
                bool _2632 = isnan(0.800000011920928955078125);
                bool _2634 = _2630 || _2632;
                bool _2636 = _2586 != 0.0;
                bool _2638 = isnan(_2586);
                bool _2640 = _2636 || _2638;
                bool _2642 = isnan(0.0);
                bool _2644 = _2640 || _2642;
                bool _2646 = !_2634;
                bool _2648 = _2644 || _2646;
                if (_2648)
                {
                    _2616 = _2586;
                }
                float _2650 = _2616;
                _2618 = _2650;
                if (_2648)
                {
                    _2622 = _2588;
                }
                float _2652 = _2622;
                _2624 = _2652;
                if (_2648)
                {
                    _2610 = _2584;
                }
                float _2654 = _2610;
                _2612 = _2654;
                if (!_2648)
                {
                    float2 _9322 = float2(_2584, _143);
                    float2 _2656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9322, float2(0.0), isnan(_9322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9322, float2(0.0), isnan(_9322))).xy;
                    float _2658 = _2656.x;
                    float _2660 = _2656.y;
                    float _2662 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2584);
                    _2618 = _2658;
                    _2624 = _2660;
                    _2612 = _2662;
                }
            }
            float _2664 = _2618;
            float _2666 = _2624;
            float _2668 = _2612;
            if (_2540)
            {
                _2596 = _2536;
            }
            int _2670 = _2596;
            int _2672 = _2670;
            int _2674 = _2670;
            if (!_2540)
            {
                bool _2676 = _1780 > 0.800000011920928955078125;
                bool _2678 = isnan(_1780);
                bool _2680 = _2676 || _2678;
                bool _2682 = isnan(0.800000011920928955078125);
                bool _2684 = _2680 || _2682;
                bool _2686 = _1778 != 0.0;
                bool _2688 = isnan(_1778);
                bool _2690 = _2686 || _2688;
                bool _2692 = isnan(0.0);
                bool _2694 = _2690 || _2692;
                bool _2696 = !_2684;
                bool _2698 = _2694 || _2696;
                if (_2698)
                {
                    _2672 = 1;
                }
                int _2700 = _2672;
                _2674 = _2700;
                if (!_2698)
                {
                    float2 _9391 = float2(_2604, _137);
                    float2 _2702 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9391, float2(0.0), isnan(_9391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9391, float2(0.0), isnan(_9391))).xy;
                    float _2704 = _2702.x;
                    float _2706 = _2702.y;
                    float _2708 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2604);
                    _2674 = _2536;
                    _1814 = _2706;
                    _1816 = _2704;
                    _2606 = _2708;
                }
            }
            int _2710 = _2674;
            float _2712 = _1814;
            float _2714 = _1816;
            float _2716 = _2606;
            int _2718 = _2710 & 1;
            bool _2720 = _2718 != 0;
            float _2722 = _2712;
            float _2724 = _2714;
            float _2726 = _2716;
            int _2728 = _2710;
            if (_2720)
            {
                _180 = _2710;
            }
            int _2730 = _180;
            int _2732 = _2730;
            int _2734 = _2730;
            if (!_2720)
            {
                bool _2736 = _2712 > 0.800000011920928955078125;
                bool _2738 = isnan(_2712);
                bool _2740 = _2736 || _2738;
                bool _2742 = isnan(0.800000011920928955078125);
                bool _2744 = _2740 || _2742;
                bool _2746 = _2714 != 0.0;
                bool _2748 = isnan(_2714);
                bool _2750 = _2746 || _2748;
                bool _2752 = isnan(0.0);
                bool _2754 = _2750 || _2752;
                bool _2756 = !_2744;
                bool _2758 = _2754 || _2756;
                if (_2758)
                {
                    _2732 = 1;
                }
                int _2760 = _2732;
                _2734 = _2760;
                if (!_2758)
                {
                    float2 _9470 = float2(_2716, _137);
                    float2 _2762 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9470, float2(0.0), isnan(_9470))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9470, float2(0.0), isnan(_9470))).xy;
                    float _2764 = _2762.x;
                    float _2766 = _2762.y;
                    float _2768 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2716);
                    _2734 = _2710;
                    _2722 = _2766;
                    _2724 = _2764;
                    _2726 = _2768;
                }
            }
            int _2770 = _2734;
            float _2772 = _2722;
            float _2774 = _2724;
            float _2776 = _2726;
            int _2778 = _2770 & 1;
            bool _2780 = _2778 != 0;
            float _2782 = _2772;
            float _2784 = _2774;
            float _2786 = _2776;
            int _2788 = _2770;
            if (_2780)
            {
                _2728 = _2770;
            }
            int _2790 = _2728;
            int _2792 = _2790;
            int _2794 = _2790;
            if (!_2780)
            {
                bool _2796 = _2772 > 0.800000011920928955078125;
                bool _2798 = isnan(_2772);
                bool _2800 = _2796 || _2798;
                bool _2802 = isnan(0.800000011920928955078125);
                bool _2804 = _2800 || _2802;
                bool _2806 = _2774 != 0.0;
                bool _2808 = isnan(_2774);
                bool _2810 = _2806 || _2808;
                bool _2812 = isnan(0.0);
                bool _2814 = _2810 || _2812;
                bool _2816 = !_2804;
                bool _2818 = _2814 || _2816;
                if (_2818)
                {
                    _2792 = 1;
                }
                int _2820 = _2792;
                _2794 = _2820;
                if (!_2818)
                {
                    float2 _9549 = float2(_2776, _137);
                    float2 _2822 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9549, float2(0.0), isnan(_9549))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9549, float2(0.0), isnan(_9549))).xy;
                    float _2824 = _2822.x;
                    float _2826 = _2822.y;
                    float _2828 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2776);
                    _2794 = _2770;
                    _2782 = _2826;
                    _2784 = _2824;
                    _2786 = _2828;
                }
            }
            int _2830 = _2794;
            float _2832 = _2782;
            float _2834 = _2784;
            float _2836 = _2786;
            int _2838 = _2830 & 1;
            bool _2840 = _2838 != 0;
            float _2842 = _2832;
            float _2844 = _2834;
            float _2846 = _2836;
            int _2848 = _2830;
            if (_2840)
            {
                _2788 = _2830;
            }
            int _2850 = _2788;
            int _2852 = _2850;
            int _2854 = _2850;
            if (!_2840)
            {
                bool _2856 = _2832 > 0.800000011920928955078125;
                bool _2858 = isnan(_2832);
                bool _2860 = _2856 || _2858;
                bool _2862 = isnan(0.800000011920928955078125);
                bool _2864 = _2860 || _2862;
                bool _2866 = _2834 != 0.0;
                bool _2868 = isnan(_2834);
                bool _2870 = _2866 || _2868;
                bool _2872 = isnan(0.0);
                bool _2874 = _2870 || _2872;
                bool _2876 = !_2864;
                bool _2878 = _2874 || _2876;
                if (_2878)
                {
                    _2852 = 1;
                }
                int _2880 = _2852;
                _2854 = _2880;
                if (!_2878)
                {
                    float2 _9628 = float2(_2836, _137);
                    float2 _2882 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9628, float2(0.0), isnan(_9628))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9628, float2(0.0), isnan(_9628))).xy;
                    float _2884 = _2882.x;
                    float _2886 = _2882.y;
                    float _2888 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2836);
                    _2854 = _2830;
                    _2842 = _2886;
                    _2844 = _2884;
                    _2846 = _2888;
                }
            }
            int _2890 = _2854;
            float _2892 = _2842;
            float _2894 = _2844;
            float _2896 = _2846;
            int _2898 = _2890 & 1;
            bool _2900 = _2898 != 0;
            float _2902 = _2892;
            float _2904 = _2894;
            float _2906 = _2896;
            int _2908 = _2890;
            if (_2900)
            {
                _2848 = _2890;
            }
            int _2910 = _2848;
            int _2912 = _2910;
            int _2914 = _2910;
            if (!_2900)
            {
                bool _2916 = _2892 > 0.800000011920928955078125;
                bool _2918 = isnan(_2892);
                bool _2920 = _2916 || _2918;
                bool _2922 = isnan(0.800000011920928955078125);
                bool _2924 = _2920 || _2922;
                bool _2926 = _2894 != 0.0;
                bool _2928 = isnan(_2894);
                bool _2930 = _2926 || _2928;
                bool _2932 = isnan(0.0);
                bool _2934 = _2930 || _2932;
                bool _2936 = !_2924;
                bool _2938 = _2934 || _2936;
                if (_2938)
                {
                    _2912 = 1;
                }
                int _2940 = _2912;
                _2914 = _2940;
                if (!_2938)
                {
                    float2 _9707 = float2(_2896, _137);
                    float2 _2942 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9707, float2(0.0), isnan(_9707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9707, float2(0.0), isnan(_9707))).xy;
                    float _2944 = _2942.x;
                    float _2946 = _2942.y;
                    float _2948 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2896);
                    _2914 = _2890;
                    _2902 = _2946;
                    _2904 = _2944;
                    _2906 = _2948;
                }
            }
            int _2950 = _2914;
            float _2952 = _2902;
            float _2954 = _2904;
            float _2956 = _2906;
            int _2958 = _2950 & 1;
            bool _2960 = _2958 != 0;
            float _2962 = _2952;
            float _2964 = _2954;
            float _2966 = _2956;
            int _2968 = _2950;
            if (_2960)
            {
                _2908 = _2950;
            }
            int _2970 = _2908;
            int _2972 = _2970;
            int _2974 = _2970;
            if (!_2960)
            {
                bool _2976 = _2952 > 0.800000011920928955078125;
                bool _2978 = isnan(_2952);
                bool _2980 = _2976 || _2978;
                bool _2982 = isnan(0.800000011920928955078125);
                bool _2984 = _2980 || _2982;
                bool _2986 = _2954 != 0.0;
                bool _2988 = isnan(_2954);
                bool _2990 = _2986 || _2988;
                bool _2992 = isnan(0.0);
                bool _2994 = _2990 || _2992;
                bool _2996 = !_2984;
                bool _2998 = _2994 || _2996;
                if (_2998)
                {
                    _2972 = 1;
                }
                int _3000 = _2972;
                _2974 = _3000;
                if (!_2998)
                {
                    float2 _9786 = float2(_2956, _137);
                    float2 _3002 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9786, float2(0.0), isnan(_9786))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9786, float2(0.0), isnan(_9786))).xy;
                    float _3004 = _3002.x;
                    float _3006 = _3002.y;
                    float _3008 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2956);
                    _2974 = _2950;
                    _2962 = _3006;
                    _2964 = _3004;
                    _2966 = _3008;
                }
            }
            int _3010 = _2974;
            float _3012 = _2962;
            float _3014 = _2964;
            float _3016 = _2966;
            int _3018 = _3010 & 1;
            bool _3020 = _3018 != 0;
            float _3022 = _3012;
            float _3024 = _3014;
            float _3026 = _3016;
            int _3028 = _3010;
            if (_3020)
            {
                _2968 = _3010;
            }
            int _3030 = _2968;
            int _3032 = _3030;
            int _3034 = _3030;
            if (!_3020)
            {
                bool _3036 = _3012 > 0.800000011920928955078125;
                bool _3038 = isnan(_3012);
                bool _3040 = _3036 || _3038;
                bool _3042 = isnan(0.800000011920928955078125);
                bool _3044 = _3040 || _3042;
                bool _3046 = _3014 != 0.0;
                bool _3048 = isnan(_3014);
                bool _3050 = _3046 || _3048;
                bool _3052 = isnan(0.0);
                bool _3054 = _3050 || _3052;
                bool _3056 = !_3044;
                bool _3058 = _3054 || _3056;
                if (_3058)
                {
                    _3032 = 1;
                }
                int _3060 = _3032;
                _3034 = _3060;
                if (!_3058)
                {
                    float2 _9865 = float2(_3016, _137);
                    float2 _3062 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9865, float2(0.0), isnan(_9865))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9865, float2(0.0), isnan(_9865))).xy;
                    float _3064 = _3062.x;
                    float _3066 = _3062.y;
                    float _3068 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3016);
                    _3034 = _3010;
                    _3022 = _3066;
                    _3024 = _3064;
                    _3026 = _3068;
                }
            }
            int _3070 = _3034;
            float _3072 = _3022;
            float _3074 = _3024;
            float _3076 = _3026;
            int _3078 = _3070 & 1;
            bool _3080 = _3078 != 0;
            float _3082 = _3072;
            float _3084 = _3074;
            float _3086 = _3076;
            int _3088 = _3070;
            if (_3080)
            {
                _3028 = _3070;
            }
            int _3090 = _3028;
            int _3092 = _3090;
            int _3094 = _3090;
            if (!_3080)
            {
                bool _3096 = _3072 > 0.800000011920928955078125;
                bool _3098 = isnan(_3072);
                bool _3100 = _3096 || _3098;
                bool _3102 = isnan(0.800000011920928955078125);
                bool _3104 = _3100 || _3102;
                bool _3106 = _3074 != 0.0;
                bool _3108 = isnan(_3074);
                bool _3110 = _3106 || _3108;
                bool _3112 = isnan(0.0);
                bool _3114 = _3110 || _3112;
                bool _3116 = !_3104;
                bool _3118 = _3114 || _3116;
                if (_3118)
                {
                    _3092 = 1;
                }
                int _3120 = _3092;
                _3094 = _3120;
                if (!_3118)
                {
                    float2 _9944 = float2(_3076, _137);
                    float2 _3122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9944, float2(0.0), isnan(_9944))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9944, float2(0.0), isnan(_9944))).xy;
                    float _3124 = _3122.x;
                    float _3126 = _3122.y;
                    float _3128 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3076);
                    _3094 = _3070;
                    _3082 = _3126;
                    _3084 = _3124;
                    _3086 = _3128;
                }
            }
            int _3130 = _3094;
            float _3132 = _3082;
            float _3134 = _3084;
            float _3136 = _3086;
            int _3138 = _3130 & 1;
            bool _3140 = _3138 != 0;
            float _3142 = _3132;
            float _3144 = _3134;
            float _3146 = _3136;
            int _3148 = _3130;
            if (_3140)
            {
                _3088 = _3130;
            }
            int _3150 = _3088;
            int _3152 = _3150;
            int _3154 = _3150;
            if (!_3140)
            {
                bool _3156 = _3132 > 0.800000011920928955078125;
                bool _3158 = isnan(_3132);
                bool _3160 = _3156 || _3158;
                bool _3162 = isnan(0.800000011920928955078125);
                bool _3164 = _3160 || _3162;
                bool _3166 = _3134 != 0.0;
                bool _3168 = isnan(_3134);
                bool _3170 = _3166 || _3168;
                bool _3172 = isnan(0.0);
                bool _3174 = _3170 || _3172;
                bool _3176 = !_3164;
                bool _3178 = _3174 || _3176;
                if (_3178)
                {
                    _3152 = 1;
                }
                int _3180 = _3152;
                _3154 = _3180;
                if (!_3178)
                {
                    float2 _10023 = float2(_3136, _137);
                    float2 _3182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10023, float2(0.0), isnan(_10023))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10023, float2(0.0), isnan(_10023))).xy;
                    float _3184 = _3182.x;
                    float _3186 = _3182.y;
                    float _3188 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3136);
                    _3154 = _3130;
                    _3142 = _3186;
                    _3144 = _3184;
                    _3146 = _3188;
                }
            }
            int _3190 = _3154;
            float _3192 = _3142;
            float _3194 = _3144;
            float _3196 = _3146;
            int _3198 = _3190 & 1;
            bool _3200 = _3198 != 0;
            float _3202 = _3192;
            float _3204 = _3194;
            float _3206 = _3196;
            int _3208 = _3190;
            if (_3200)
            {
                _3148 = _3190;
            }
            int _3210 = _3148;
            int _3212 = _3210;
            int _3214 = _3210;
            if (!_3200)
            {
                bool _3216 = _3192 > 0.800000011920928955078125;
                bool _3218 = isnan(_3192);
                bool _3220 = _3216 || _3218;
                bool _3222 = isnan(0.800000011920928955078125);
                bool _3224 = _3220 || _3222;
                bool _3226 = _3194 != 0.0;
                bool _3228 = isnan(_3194);
                bool _3230 = _3226 || _3228;
                bool _3232 = isnan(0.0);
                bool _3234 = _3230 || _3232;
                bool _3236 = !_3224;
                bool _3238 = _3234 || _3236;
                if (_3238)
                {
                    _3212 = 1;
                }
                int _3240 = _3212;
                _3214 = _3240;
                if (!_3238)
                {
                    float2 _10102 = float2(_3196, _137);
                    float2 _3242 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10102, float2(0.0), isnan(_10102))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10102, float2(0.0), isnan(_10102))).xy;
                    float _3244 = _3242.x;
                    float _3246 = _3242.y;
                    float _3248 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3196);
                    _3214 = _3190;
                    _3202 = _3246;
                    _3204 = _3244;
                    _3206 = _3248;
                }
            }
            int _3250 = _3214;
            float _3252 = _3202;
            float _3254 = _3204;
            float _3256 = _3206;
            int _3258 = _3250 & 1;
            bool _3260 = _3258 != 0;
            float _3262 = _3252;
            float _3264 = _3254;
            float _3266 = _3256;
            int _3268 = _3250;
            if (_3260)
            {
                _3208 = _3250;
            }
            int _3270 = _3208;
            int _3272 = _3270;
            int _3274 = _3270;
            if (!_3260)
            {
                bool _3276 = _3252 > 0.800000011920928955078125;
                bool _3278 = isnan(_3252);
                bool _3280 = _3276 || _3278;
                bool _3282 = isnan(0.800000011920928955078125);
                bool _3284 = _3280 || _3282;
                bool _3286 = _3254 != 0.0;
                bool _3288 = isnan(_3254);
                bool _3290 = _3286 || _3288;
                bool _3292 = isnan(0.0);
                bool _3294 = _3290 || _3292;
                bool _3296 = !_3284;
                bool _3298 = _3294 || _3296;
                if (_3298)
                {
                    _3272 = 1;
                }
                int _3300 = _3272;
                _3274 = _3300;
                if (!_3298)
                {
                    float2 _10181 = float2(_3256, _137);
                    float2 _3302 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10181, float2(0.0), isnan(_10181))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10181, float2(0.0), isnan(_10181))).xy;
                    float _3304 = _3302.x;
                    float _3306 = _3302.y;
                    float _3308 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3256);
                    _3274 = _3250;
                    _3262 = _3306;
                    _3264 = _3304;
                    _3266 = _3308;
                }
            }
            int _3310 = _3274;
            float _3312 = _3262;
            float _3314 = _3264;
            float _3316 = _3266;
            int _3318 = _3310 & 1;
            bool _3320 = _3318 != 0;
            float _3322 = _3312;
            float _3324 = _3314;
            float _3326 = _3316;
            int _3328 = _3310;
            if (_3320)
            {
                _3268 = _3310;
            }
            int _3330 = _3268;
            int _3332 = _3330;
            int _3334 = _3330;
            if (!_3320)
            {
                bool _3336 = _3312 > 0.800000011920928955078125;
                bool _3338 = isnan(_3312);
                bool _3340 = _3336 || _3338;
                bool _3342 = isnan(0.800000011920928955078125);
                bool _3344 = _3340 || _3342;
                bool _3346 = _3314 != 0.0;
                bool _3348 = isnan(_3314);
                bool _3350 = _3346 || _3348;
                bool _3352 = isnan(0.0);
                bool _3354 = _3350 || _3352;
                bool _3356 = !_3344;
                bool _3358 = _3354 || _3356;
                if (_3358)
                {
                    _3332 = 1;
                }
                int _3360 = _3332;
                _3334 = _3360;
                if (!_3358)
                {
                    float2 _10260 = float2(_3316, _137);
                    float2 _3362 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10260, float2(0.0), isnan(_10260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10260, float2(0.0), isnan(_10260))).xy;
                    float _3364 = _3362.x;
                    float _3366 = _3362.y;
                    float _3368 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3316);
                    _3334 = _3310;
                    _3322 = _3366;
                    _3324 = _3364;
                    _3326 = _3368;
                }
            }
            int _3370 = _3334;
            float _3372 = _3322;
            float _3374 = _3324;
            float _3376 = _3326;
            int _3378 = _3370 & 1;
            bool _3380 = _3378 != 0;
            float _3382 = _3372;
            float _3384 = _3374;
            float _3386 = _3376;
            if (_3380)
            {
                _3328 = _3370;
            }
            int _3388 = _3328;
            int _3390 = _3388;
            int _3392 = _3388;
            if (!_3380)
            {
                bool _3394 = _3372 > 0.800000011920928955078125;
                bool _3396 = isnan(_3372);
                bool _3398 = _3394 || _3396;
                bool _3400 = isnan(0.800000011920928955078125);
                bool _3402 = _3398 || _3400;
                bool _3404 = _3374 != 0.0;
                bool _3406 = isnan(_3374);
                bool _3408 = _3404 || _3406;
                bool _3410 = isnan(0.0);
                bool _3412 = _3408 || _3410;
                bool _3414 = !_3402;
                bool _3416 = _3412 || _3414;
                if (_3416)
                {
                    _3390 = 1;
                }
                int _3418 = _3390;
                _3392 = _3418;
                if (!_3416)
                {
                    float2 _10338 = float2(_3376, _137);
                    float2 _3420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10338, float2(0.0), isnan(_10338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10338, float2(0.0), isnan(_10338))).xy;
                    float _3422 = _3420.x;
                    float _3424 = _3420.y;
                    float _3426 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3376);
                    _3392 = _3370;
                    _3382 = _3424;
                    _3384 = _3422;
                    _3386 = _3426;
                }
            }
            int _3428 = _3392;
            float _3430 = _3382;
            float _3432 = _3384;
            float _3434 = _3386;
            int _3436 = _3428 & 1;
            bool _3438 = _3436 != 0;
            float _3440 = _3432;
            float _3442 = _3430;
            float _3444 = _3434;
            if (!_3438)
            {
                bool _3446 = _3430 > 0.800000011920928955078125;
                bool _3448 = isnan(_3430);
                bool _3450 = _3446 || _3448;
                bool _3452 = isnan(0.800000011920928955078125);
                bool _3454 = _3450 || _3452;
                bool _3456 = _3432 != 0.0;
                bool _3458 = isnan(_3432);
                bool _3460 = _3456 || _3458;
                bool _3462 = isnan(0.0);
                bool _3464 = _3460 || _3462;
                bool _3466 = !_3454;
                bool _3468 = _3464 || _3466;
                if (!_3468)
                {
                    float2 _10404 = float2(_3434, _137);
                    float2 _3470 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10404, float2(0.0), isnan(_10404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10404, float2(0.0), isnan(_10404))).xy;
                    float _3472 = _3470.x;
                    float _3474 = _3470.y;
                    float _3476 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _3434);
                    _3440 = _3472;
                    _3442 = _3474;
                    _3444 = _3476;
                }
            }
            float _3478 = _3440;
            float _3480 = _3442;
            float _3482 = _3444;
            float _3484 = fma(_3478, 0.5, 0.5234375);
            float _3486 = fma(_2664, 0.5, 0.0078125);
            float _3488 = fma(_3480, 2.0, 0.03125);
            float _3490 = fma(_2666, 2.0, 0.03125);
            float2 _10439 = float2(_3484, _3488);
            float _3492 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_10439, float2(0.0), isnan(_10439))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_10439, float2(0.0), isnan(_10439))).x;
            float2 _10447 = float2(_3486, _3490);
            float _3494 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_10447, float2(0.0), isnan(_10447))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_10447, float2(0.0), isnan(_10447))).x;
            float _3496 = fma(_3492, -2.007874011993408203125, 3.25);
            float _3498 = fma(_3494, -2.007874011993408203125, 3.25);
            float _3500 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _3502 = fma(_3496, _3500, _3482);
            float _3504 = fma(_3498, (*spvDescriptorSet0.fp_c3)._m0[0].z, _2668);
            float2 _10473 = float2(_3502, _155);
            float _3506 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10473, float2(0.0), isnan(_10473)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10473, float2(0.0), isnan(_10473)), int2(1, 0)).x;
            float2 _10481 = float2(_3504, _155);
            float _3508 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10481, float2(0.0), isnan(_10481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10481, float2(0.0), isnan(_10481))).x;
            float _3510 = -_149;
            float _3512 = fma(_3504, (*spvDescriptorSet0.fp_c3)._m0[0].x, _3510);
            float _3514 = -_149;
            float _3516 = fma(_3502, (*spvDescriptorSet0.fp_c3)._m0[0].x, _3514);
            float _3518 = rint(_3516);
            float _3520 = rint(_3512);
            float _3522 = abs(_3518);
            float _3524 = sqrt(_3522);
            float _3526 = abs(_3520);
            float _3528 = sqrt(_3526);
            float _3530 = _3508 * 4.0;
            float _3532 = _3506 * 4.0;
            float _3534 = rint(_3532);
            float _3536 = rint(_3530);
            float _3538 = fma(_3534, 16.0, _3524);
            float _3540 = fma(_3538, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _3542 = fma(_3536, 16.0, _3528);
            float _3544 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _3540);
            float _3546 = fma(_3542, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float2 _10538 = float2(_3504, _67);
            float _3548 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10538, float2(0.0), isnan(_10538)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10538, float2(0.0), isnan(_10538)), int2(0, 1)).x;
            float2 _10547 = float2(_3504, _67);
            float _3550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10547, float2(0.0), isnan(_10547)), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10547, float2(0.0), isnan(_10547)), int2(0, -2)).x;
            float2 _10557 = float2(_3502, _67);
            float _3552 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10557, float2(0.0), isnan(_10557)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10557, float2(0.0), isnan(_10557)), int2(1)).x;
            float2 _10566 = float2(_3502, _67);
            float _3554 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10566, float2(0.0), isnan(_10566)), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10566, float2(0.0), isnan(_10566)), int2(1, -2)).x;
            float2 _10575 = float2(_3546, _3544);
            float2 _3556 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_10575, float2(0.0), isnan(_10575))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_10575, float2(0.0), isnan(_10575))).xy;
            float _3558 = _3556.x;
            float _3560 = _3556.y;
            float _3562 = abs(_3518);
            float _3564 = abs(_3520);
            bool _3566 = _3562 >= _3564;
            bool _3568 = isnan(_3562);
            bool _3570 = _3566 || _3568;
            bool _3572 = isnan(_3564);
            bool _3574 = _3570 || _3572;
            float _3576 = float(_3574);
            float _3578 = abs(_3520);
            float _3580 = abs(_3518);
            bool _3582 = _3578 >= _3580;
            bool _3584 = isnan(_3578);
            bool _3586 = _3582 || _3584;
            bool _3588 = isnan(_3580);
            bool _3590 = _3586 || _3588;
            float _3592 = float(_3590);
            float _3594 = _3576 + _3592;
            float _3596 = 1.0 / _3594;
            float _3598 = _3596 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
            float _3600 = _3576 * _3598;
            float _3602 = _3592 * _3598;
            float _3604 = -_3600;
            float _3606 = fma(_3604, _3548, 1.0);
            float _3608 = -_3600;
            float _3610 = fma(_3608, _3550, 1.0);
            float _3612 = -_3602;
            float _3614 = fma(_3612, _3552, _3606);
            float _3616 = precise::clamp(_3614, 0.0, 1.0);
            float _3618 = -_3602;
            float _3620 = fma(_3618, _3554, _3610);
            float _3622 = precise::clamp(_3620, 0.0, 1.0);
            float _3624 = _3558 * _3616;
            float _3626 = _3560 * _3622;
            _208 = _166;
            _182 = _3552;
            _210 = _67;
            _184 = _3622;
            _186 = as_type<int>(_3616);
            _200 = as_type<int>(_3624);
            _202 = as_type<int>(_3626);
        }
    }
    int _3628 = _208;
    float _3630 = _182;
    float _3632 = _210;
    float _3634 = _184;
    int _3636 = _186;
    int _3638 = _200;
    int _3640 = _202;
    int _3642 = _3628 & 1;
    bool _3644 = _3642 != 0;
    bool _3646 = !_3644;
    float _3648 = _3630;
    float _3650 = _3632;
    float _3652 = _3634;
    int _3654 = _3636;
    if (!_3646)
    {
        float2 _10704 = float2(_141, _155);
        float2 _3656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10704, float2(0.0), isnan(_10704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10704, float2(0.0), isnan(_10704))).xy;
        float _3658 = _3656.x;
        float _3660 = _3656.y;
        float2 _10716 = float2(_145, _147);
        float2 _3662 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10716, float2(0.0), isnan(_10716))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10716, float2(0.0), isnan(_10716))).xy;
        float _3664 = _3662.x;
        float _3666 = _3662.y;
        float _3668 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _155);
        bool _3670 = _3658 > 0.800000011920928955078125;
        bool _3672 = isnan(_3658);
        bool _3674 = _3670 || _3672;
        bool _3676 = isnan(0.800000011920928955078125);
        bool _3678 = _3674 || _3676;
        bool _3680 = _3664 > 0.800000011920928955078125;
        bool _3682 = isnan(_3664);
        bool _3684 = _3680 || _3682;
        bool _3686 = isnan(0.800000011920928955078125);
        bool _3688 = _3684 || _3686;
        bool _3690 = _3660 != 0.0;
        bool _3692 = isnan(_3660);
        bool _3694 = _3690 || _3692;
        bool _3696 = isnan(0.0);
        bool _3698 = _3694 || _3696;
        bool _3700 = !_3678;
        bool _3702 = _3698 || _3700;
        bool _3704 = _3666 != 0.0;
        bool _3706 = isnan(_3666);
        bool _3708 = _3704 || _3706;
        bool _3710 = isnan(0.0);
        bool _3712 = _3708 || _3710;
        bool _3714 = !_3688;
        bool _3716 = _3712 || _3714;
        int _3718 = as_type<int>(_3660);
        float _3720 = _3668;
        if (_3702)
        {
            _3648 = _3658;
        }
        float _3722 = _3648;
        if (_3702)
        {
            _3650 = _3660;
        }
        float _3724 = _3650;
        if (_3716)
        {
            _188 = _3666;
        }
        float _3726 = _188;
        if (_3716)
        {
            _3652 = _3664;
        }
        float _3728 = _3652;
        float _3730 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
        float _3732 = _3722;
        float _3734 = _3724;
        float _3736 = _3730;
        if (!_3702)
        {
            float2 _10819 = float2(_141, _3668);
            float2 _3738 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10819, float2(0.0), isnan(_10819))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10819, float2(0.0), isnan(_10819))).xy;
            float _3740 = _3738.x;
            float _3742 = _3738.y;
            _3732 = _3740;
            _3734 = _3742;
        }
        float _3744 = _3732;
        float _3746 = _3734;
        float _3748 = _3728;
        float _3750 = _3726;
        if (!_3716)
        {
            float2 _10841 = float2(_145, _3730);
            float2 _3752 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10841, float2(0.0), isnan(_10841))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10841, float2(0.0), isnan(_10841))).xy;
            float _3754 = _3752.x;
            float _3756 = _3752.y;
            _3748 = _3754;
            _3750 = _3756;
        }
        float _3758 = _3748;
        float _3760 = _3750;
        if (_3702)
        {
            _3718 = 1;
        }
        int _3762 = _3718;
        int _3764 = _3762;
        if (!_3702)
        {
            _3764 = 0;
        }
        int _3766 = _3764;
        int _3768 = _3766;
        if (_3702)
        {
            _190 = _3668;
        }
        float _3770 = _190;
        float _3772 = _3770;
        if (!_3702)
        {
            float _3774 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3668);
            _3772 = _3774;
        }
        float _3776 = _3772;
        int _3778 = _3766 & 1;
        bool _3780 = _3778 != 0;
        float _3782 = _3776;
        if (_3780)
        {
            _3654 = _3766;
        }
        int _3784 = _3654;
        int _3786 = _3784;
        int _3788 = _3784;
        float _3790 = _3744;
        float _3792 = _3746;
        float _3794 = _3758;
        float _3796 = _3760;
        if (!_3780)
        {
            bool _3798 = _3744 > 0.800000011920928955078125;
            bool _3800 = isnan(_3744);
            bool _3802 = _3798 || _3800;
            bool _3804 = isnan(0.800000011920928955078125);
            bool _3806 = _3802 || _3804;
            bool _3808 = _3746 != 0.0;
            bool _3810 = isnan(_3746);
            bool _3812 = _3808 || _3810;
            bool _3814 = isnan(0.0);
            bool _3816 = _3812 || _3814;
            bool _3818 = !_3806;
            bool _3820 = _3816 || _3818;
            if (_3820)
            {
                _3786 = 1;
            }
            int _3822 = _3786;
            _3788 = _3822;
            if (!_3820)
            {
                float2 _10939 = float2(_141, _3776);
                float2 _3824 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10939, float2(0.0), isnan(_10939))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10939, float2(0.0), isnan(_10939))).xy;
                float _3826 = _3824.x;
                float _3828 = _3824.y;
                float _3830 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3776);
                _3788 = _3766;
                _3790 = _3826;
                _3792 = _3828;
                _3782 = _3830;
            }
        }
        int _3832 = _3788;
        float _3834 = _3790;
        float _3836 = _3792;
        float _3838 = _3782;
        int _3840 = _3832 & 1;
        bool _3842 = _3840 != 0;
        float _3844 = _3834;
        float _3846 = _3836;
        float _3848 = _3838;
        int _3850 = _3832;
        if (_3842)
        {
            _3768 = _3832;
        }
        int _3852 = _3768;
        int _3854 = _3852;
        int _3856 = _3852;
        if (!_3842)
        {
            bool _3858 = _3834 > 0.800000011920928955078125;
            bool _3860 = isnan(_3834);
            bool _3862 = _3858 || _3860;
            bool _3864 = isnan(0.800000011920928955078125);
            bool _3866 = _3862 || _3864;
            bool _3868 = _3836 != 0.0;
            bool _3870 = isnan(_3836);
            bool _3872 = _3868 || _3870;
            bool _3874 = isnan(0.0);
            bool _3876 = _3872 || _3874;
            bool _3878 = !_3866;
            bool _3880 = _3876 || _3878;
            if (_3880)
            {
                _3854 = 1;
            }
            int _3882 = _3854;
            _3856 = _3882;
            if (!_3880)
            {
                float2 _11018 = float2(_141, _3838);
                float2 _3884 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11018, float2(0.0), isnan(_11018))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11018, float2(0.0), isnan(_11018))).xy;
                float _3886 = _3884.x;
                float _3888 = _3884.y;
                float _3890 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3838);
                _3856 = _3832;
                _3844 = _3886;
                _3846 = _3888;
                _3848 = _3890;
            }
        }
        int _3892 = _3856;
        float _3894 = _3844;
        float _3896 = _3846;
        float _3898 = _3848;
        int _3900 = _3892 & 1;
        bool _3902 = _3900 != 0;
        float _3904 = _3894;
        float _3906 = _3896;
        float _3908 = _3898;
        int _3910 = _3892;
        if (_3902)
        {
            _3850 = _3892;
        }
        int _3912 = _3850;
        int _3914 = _3912;
        int _3916 = _3912;
        if (!_3902)
        {
            bool _3918 = _3894 > 0.800000011920928955078125;
            bool _3920 = isnan(_3894);
            bool _3922 = _3918 || _3920;
            bool _3924 = isnan(0.800000011920928955078125);
            bool _3926 = _3922 || _3924;
            bool _3928 = _3896 != 0.0;
            bool _3930 = isnan(_3896);
            bool _3932 = _3928 || _3930;
            bool _3934 = isnan(0.0);
            bool _3936 = _3932 || _3934;
            bool _3938 = !_3926;
            bool _3940 = _3936 || _3938;
            if (_3940)
            {
                _3914 = 1;
            }
            int _3942 = _3914;
            _3916 = _3942;
            if (!_3940)
            {
                float2 _11097 = float2(_141, _3898);
                float2 _3944 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11097, float2(0.0), isnan(_11097))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11097, float2(0.0), isnan(_11097))).xy;
                float _3946 = _3944.x;
                float _3948 = _3944.y;
                float _3950 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3898);
                _3916 = _3892;
                _3904 = _3946;
                _3906 = _3948;
                _3908 = _3950;
            }
        }
        int _3952 = _3916;
        float _3954 = _3904;
        float _3956 = _3906;
        float _3958 = _3908;
        int _3960 = _3952 & 1;
        bool _3962 = _3960 != 0;
        float _3964 = _3954;
        float _3966 = _3956;
        float _3968 = _3958;
        int _3970 = _3952;
        if (_3962)
        {
            _3910 = _3952;
        }
        int _3972 = _3910;
        int _3974 = _3972;
        int _3976 = _3972;
        if (!_3962)
        {
            bool _3978 = _3954 > 0.800000011920928955078125;
            bool _3980 = isnan(_3954);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan(0.800000011920928955078125);
            bool _3986 = _3982 || _3984;
            bool _3988 = _3956 != 0.0;
            bool _3990 = isnan(_3956);
            bool _3992 = _3988 || _3990;
            bool _3994 = isnan(0.0);
            bool _3996 = _3992 || _3994;
            bool _3998 = !_3986;
            bool _4000 = _3996 || _3998;
            if (_4000)
            {
                _3974 = 1;
            }
            int _4002 = _3974;
            _3976 = _4002;
            if (!_4000)
            {
                float2 _11176 = float2(_141, _3958);
                float2 _4004 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11176, float2(0.0), isnan(_11176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11176, float2(0.0), isnan(_11176))).xy;
                float _4006 = _4004.x;
                float _4008 = _4004.y;
                float _4010 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3958);
                _3976 = _3952;
                _3964 = _4006;
                _3966 = _4008;
                _3968 = _4010;
            }
        }
        int _4012 = _3976;
        float _4014 = _3964;
        float _4016 = _3966;
        float _4018 = _3968;
        int _4020 = _4012 & 1;
        bool _4022 = _4020 != 0;
        float _4024 = _4014;
        float _4026 = _4016;
        float _4028 = _4018;
        int _4030 = _4012;
        if (_4022)
        {
            _3970 = _4012;
        }
        int _4032 = _3970;
        int _4034 = _4032;
        int _4036 = _4032;
        if (!_4022)
        {
            bool _4038 = _4014 > 0.800000011920928955078125;
            bool _4040 = isnan(_4014);
            bool _4042 = _4038 || _4040;
            bool _4044 = isnan(0.800000011920928955078125);
            bool _4046 = _4042 || _4044;
            bool _4048 = _4016 != 0.0;
            bool _4050 = isnan(_4016);
            bool _4052 = _4048 || _4050;
            bool _4054 = isnan(0.0);
            bool _4056 = _4052 || _4054;
            bool _4058 = !_4046;
            bool _4060 = _4056 || _4058;
            if (_4060)
            {
                _4034 = 1;
            }
            int _4062 = _4034;
            _4036 = _4062;
            if (!_4060)
            {
                float2 _11255 = float2(_141, _4018);
                float2 _4064 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11255, float2(0.0), isnan(_11255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11255, float2(0.0), isnan(_11255))).xy;
                float _4066 = _4064.x;
                float _4068 = _4064.y;
                float _4070 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4018);
                _4036 = _4012;
                _4024 = _4066;
                _4026 = _4068;
                _4028 = _4070;
            }
        }
        int _4072 = _4036;
        float _4074 = _4024;
        float _4076 = _4026;
        float _4078 = _4028;
        int _4080 = _4072 & 1;
        bool _4082 = _4080 != 0;
        float _4084 = _4074;
        float _4086 = _4076;
        float _4088 = _4078;
        int _4090 = _4072;
        if (_4082)
        {
            _4030 = _4072;
        }
        int _4092 = _4030;
        int _4094 = _4092;
        int _4096 = _4092;
        if (!_4082)
        {
            bool _4098 = _4074 > 0.800000011920928955078125;
            bool _4100 = isnan(_4074);
            bool _4102 = _4098 || _4100;
            bool _4104 = isnan(0.800000011920928955078125);
            bool _4106 = _4102 || _4104;
            bool _4108 = _4076 != 0.0;
            bool _4110 = isnan(_4076);
            bool _4112 = _4108 || _4110;
            bool _4114 = isnan(0.0);
            bool _4116 = _4112 || _4114;
            bool _4118 = !_4106;
            bool _4120 = _4116 || _4118;
            if (_4120)
            {
                _4094 = 1;
            }
            int _4122 = _4094;
            _4096 = _4122;
            if (!_4120)
            {
                float2 _11334 = float2(_141, _4078);
                float2 _4124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11334, float2(0.0), isnan(_11334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11334, float2(0.0), isnan(_11334))).xy;
                float _4126 = _4124.x;
                float _4128 = _4124.y;
                float _4130 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4078);
                _4096 = _4072;
                _4084 = _4126;
                _4086 = _4128;
                _4088 = _4130;
            }
        }
        int _4132 = _4096;
        float _4134 = _4084;
        float _4136 = _4086;
        float _4138 = _4088;
        int _4140 = _4132 & 1;
        bool _4142 = _4140 != 0;
        float _4144 = _4134;
        float _4146 = _4136;
        float _4148 = _4138;
        int _4150 = _4132;
        if (_4142)
        {
            _4090 = _4132;
        }
        int _4152 = _4090;
        int _4154 = _4152;
        int _4156 = _4152;
        if (!_4142)
        {
            bool _4158 = _4134 > 0.800000011920928955078125;
            bool _4160 = isnan(_4134);
            bool _4162 = _4158 || _4160;
            bool _4164 = isnan(0.800000011920928955078125);
            bool _4166 = _4162 || _4164;
            bool _4168 = _4136 != 0.0;
            bool _4170 = isnan(_4136);
            bool _4172 = _4168 || _4170;
            bool _4174 = isnan(0.0);
            bool _4176 = _4172 || _4174;
            bool _4178 = !_4166;
            bool _4180 = _4176 || _4178;
            if (_4180)
            {
                _4154 = 1;
            }
            int _4182 = _4154;
            _4156 = _4182;
            if (!_4180)
            {
                float2 _11413 = float2(_141, _4138);
                float2 _4184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11413, float2(0.0), isnan(_11413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11413, float2(0.0), isnan(_11413))).xy;
                float _4186 = _4184.x;
                float _4188 = _4184.y;
                float _4190 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4138);
                _4156 = _4132;
                _4144 = _4186;
                _4146 = _4188;
                _4148 = _4190;
            }
        }
        int _4192 = _4156;
        float _4194 = _4144;
        float _4196 = _4146;
        float _4198 = _4148;
        int _4200 = _4192 & 1;
        bool _4202 = _4200 != 0;
        float _4204 = _4194;
        float _4206 = _4196;
        float _4208 = _4198;
        int _4210 = _4192;
        if (_4202)
        {
            _4150 = _4192;
        }
        int _4212 = _4150;
        int _4214 = _4212;
        int _4216 = _4212;
        if (!_4202)
        {
            bool _4218 = _4194 > 0.800000011920928955078125;
            bool _4220 = isnan(_4194);
            bool _4222 = _4218 || _4220;
            bool _4224 = isnan(0.800000011920928955078125);
            bool _4226 = _4222 || _4224;
            bool _4228 = _4196 != 0.0;
            bool _4230 = isnan(_4196);
            bool _4232 = _4228 || _4230;
            bool _4234 = isnan(0.0);
            bool _4236 = _4232 || _4234;
            bool _4238 = !_4226;
            bool _4240 = _4236 || _4238;
            if (_4240)
            {
                _4214 = 1;
            }
            int _4242 = _4214;
            _4216 = _4242;
            if (!_4240)
            {
                float2 _11492 = float2(_141, _4198);
                float2 _4244 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11492, float2(0.0), isnan(_11492))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11492, float2(0.0), isnan(_11492))).xy;
                float _4246 = _4244.x;
                float _4248 = _4244.y;
                float _4250 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4198);
                _4216 = _4192;
                _4204 = _4246;
                _4206 = _4248;
                _4208 = _4250;
            }
        }
        int _4252 = _4216;
        float _4254 = _4204;
        float _4256 = _4206;
        float _4258 = _4208;
        int _4260 = _4252 & 1;
        bool _4262 = _4260 != 0;
        float _4264 = _4254;
        float _4266 = _4256;
        float _4268 = _4258;
        int _4270 = _4252;
        if (_4262)
        {
            _4210 = _4252;
        }
        int _4272 = _4210;
        int _4274 = _4272;
        int _4276 = _4272;
        if (!_4262)
        {
            bool _4278 = _4254 > 0.800000011920928955078125;
            bool _4280 = isnan(_4254);
            bool _4282 = _4278 || _4280;
            bool _4284 = isnan(0.800000011920928955078125);
            bool _4286 = _4282 || _4284;
            bool _4288 = _4256 != 0.0;
            bool _4290 = isnan(_4256);
            bool _4292 = _4288 || _4290;
            bool _4294 = isnan(0.0);
            bool _4296 = _4292 || _4294;
            bool _4298 = !_4286;
            bool _4300 = _4296 || _4298;
            if (_4300)
            {
                _4274 = 1;
            }
            int _4302 = _4274;
            _4276 = _4302;
            if (!_4300)
            {
                float2 _11571 = float2(_141, _4258);
                float2 _4304 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11571, float2(0.0), isnan(_11571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11571, float2(0.0), isnan(_11571))).xy;
                float _4306 = _4304.x;
                float _4308 = _4304.y;
                float _4310 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4258);
                _4276 = _4252;
                _4264 = _4306;
                _4266 = _4308;
                _4268 = _4310;
            }
        }
        int _4312 = _4276;
        float _4314 = _4264;
        float _4316 = _4266;
        float _4318 = _4268;
        int _4320 = _4312 & 1;
        bool _4322 = _4320 != 0;
        float _4324 = _4314;
        float _4326 = _4316;
        float _4328 = _4318;
        int _4330 = _4312;
        if (_4322)
        {
            _4270 = _4312;
        }
        int _4332 = _4270;
        int _4334 = _4332;
        int _4336 = _4332;
        if (!_4322)
        {
            bool _4338 = _4314 > 0.800000011920928955078125;
            bool _4340 = isnan(_4314);
            bool _4342 = _4338 || _4340;
            bool _4344 = isnan(0.800000011920928955078125);
            bool _4346 = _4342 || _4344;
            bool _4348 = _4316 != 0.0;
            bool _4350 = isnan(_4316);
            bool _4352 = _4348 || _4350;
            bool _4354 = isnan(0.0);
            bool _4356 = _4352 || _4354;
            bool _4358 = !_4346;
            bool _4360 = _4356 || _4358;
            if (_4360)
            {
                _4334 = 1;
            }
            int _4362 = _4334;
            _4336 = _4362;
            if (!_4360)
            {
                float2 _11650 = float2(_141, _4318);
                float2 _4364 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11650, float2(0.0), isnan(_11650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11650, float2(0.0), isnan(_11650))).xy;
                float _4366 = _4364.x;
                float _4368 = _4364.y;
                float _4370 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4318);
                _4336 = _4312;
                _4324 = _4366;
                _4326 = _4368;
                _4328 = _4370;
            }
        }
        int _4372 = _4336;
        float _4374 = _4324;
        float _4376 = _4326;
        float _4378 = _4328;
        int _4380 = _4372 & 1;
        bool _4382 = _4380 != 0;
        float _4384 = _4374;
        float _4386 = _4376;
        float _4388 = _4378;
        int _4390 = _4372;
        if (_4382)
        {
            _4330 = _4372;
        }
        int _4392 = _4330;
        int _4394 = _4392;
        int _4396 = _4392;
        if (!_4382)
        {
            bool _4398 = _4374 > 0.800000011920928955078125;
            bool _4400 = isnan(_4374);
            bool _4402 = _4398 || _4400;
            bool _4404 = isnan(0.800000011920928955078125);
            bool _4406 = _4402 || _4404;
            bool _4408 = _4376 != 0.0;
            bool _4410 = isnan(_4376);
            bool _4412 = _4408 || _4410;
            bool _4414 = isnan(0.0);
            bool _4416 = _4412 || _4414;
            bool _4418 = !_4406;
            bool _4420 = _4416 || _4418;
            if (_4420)
            {
                _4394 = 1;
            }
            int _4422 = _4394;
            _4396 = _4422;
            if (!_4420)
            {
                float2 _11729 = float2(_141, _4378);
                float2 _4424 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11729, float2(0.0), isnan(_11729))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11729, float2(0.0), isnan(_11729))).xy;
                float _4426 = _4424.x;
                float _4428 = _4424.y;
                float _4430 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4378);
                _4396 = _4372;
                _4384 = _4426;
                _4386 = _4428;
                _4388 = _4430;
            }
        }
        int _4432 = _4396;
        float _4434 = _4384;
        float _4436 = _4386;
        float _4438 = _4388;
        int _4440 = _4432 & 1;
        bool _4442 = _4440 != 0;
        float _4444 = _4434;
        float _4446 = _4436;
        float _4448 = _4438;
        int _4450 = _4432;
        if (_4442)
        {
            _4390 = _4432;
        }
        int _4452 = _4390;
        int _4454 = _4452;
        int _4456 = _4452;
        if (!_4442)
        {
            bool _4458 = _4434 > 0.800000011920928955078125;
            bool _4460 = isnan(_4434);
            bool _4462 = _4458 || _4460;
            bool _4464 = isnan(0.800000011920928955078125);
            bool _4466 = _4462 || _4464;
            bool _4468 = _4436 != 0.0;
            bool _4470 = isnan(_4436);
            bool _4472 = _4468 || _4470;
            bool _4474 = isnan(0.0);
            bool _4476 = _4472 || _4474;
            bool _4478 = !_4466;
            bool _4480 = _4476 || _4478;
            if (_4480)
            {
                _4454 = 1;
            }
            int _4482 = _4454;
            _4456 = _4482;
            if (!_4480)
            {
                float2 _11808 = float2(_141, _4438);
                float2 _4484 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11808, float2(0.0), isnan(_11808))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11808, float2(0.0), isnan(_11808))).xy;
                float _4486 = _4484.x;
                float _4488 = _4484.y;
                float _4490 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4438);
                _4456 = _4432;
                _4444 = _4486;
                _4446 = _4488;
                _4448 = _4490;
            }
        }
        int _4492 = _4456;
        float _4494 = _4444;
        float _4496 = _4446;
        float _4498 = _4448;
        int _4500 = _4492 & 1;
        bool _4502 = _4500 != 0;
        float _4504 = _4498;
        float _4506 = _4496;
        float _4508 = _4494;
        float _4510 = as_type<float>(_4492);
        if (_3716)
        {
            _192 = 1;
        }
        int _4512 = _192;
        int _4514 = _4512;
        if (!_3716)
        {
            _4514 = 0;
        }
        int _4516 = _4514;
        int _4518 = _4516 & 1;
        bool _4520 = _4518 != 0;
        int _4522 = _4516;
        if (_4502)
        {
            _4450 = _4492;
        }
        int _4524 = _4450;
        int _4526 = _4524;
        int _4528 = _4524;
        if (!_4502)
        {
            bool _4530 = _4494 > 0.800000011920928955078125;
            bool _4532 = isnan(_4494);
            bool _4534 = _4530 || _4532;
            bool _4536 = isnan(0.800000011920928955078125);
            bool _4538 = _4534 || _4536;
            bool _4540 = _4496 != 0.0;
            bool _4542 = isnan(_4496);
            bool _4544 = _4540 || _4542;
            bool _4546 = isnan(0.0);
            bool _4548 = _4544 || _4546;
            bool _4550 = !_4538;
            bool _4552 = _4548 || _4550;
            if (_4552)
            {
                _4526 = 1;
            }
            int _4554 = _4526;
            _4528 = _4554;
            if (!_4552)
            {
                float2 _11903 = float2(_141, _4498);
                float2 _4556 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11903, float2(0.0), isnan(_11903))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11903, float2(0.0), isnan(_11903))).xy;
                float _4558 = _4556.x;
                float _4560 = _4556.y;
                float _4562 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4498);
                _4528 = _4492;
                _4504 = _4562;
                _4506 = _4560;
                _4508 = _4558;
            }
        }
        int _4564 = _4528;
        float _4566 = _4504;
        float _4568 = _4506;
        float _4570 = _4508;
        int _4572 = _4564 & 1;
        bool _4574 = _4572 != 0;
        float _4576 = as_type<float>(_4564);
        if (_3716)
        {
            _3720 = _3730;
        }
        float _4578 = _3720;
        float _4580 = _4578;
        if (!_3716)
        {
            float _4582 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _3730);
            _4580 = _4582;
        }
        float _4584 = _4580;
        float _4586 = _4584;
        if (_4574)
        {
            _4576 = _4566;
        }
        float _4588 = _4576;
        float _4590 = _4588;
        float _4592 = _4588;
        if (_4574)
        {
            _4510 = _4568;
        }
        float _4594 = _4510;
        float _4596 = _4594;
        float _4598 = _4594;
        if (_4574)
        {
            _3736 = _4570;
        }
        float _4600 = _3736;
        float _4602 = _4600;
        float _4604 = _4600;
        if (!_4574)
        {
            bool _4606 = _4570 > 0.800000011920928955078125;
            bool _4608 = isnan(_4570);
            bool _4610 = _4606 || _4608;
            bool _4612 = isnan(0.800000011920928955078125);
            bool _4614 = _4610 || _4612;
            bool _4616 = _4568 != 0.0;
            bool _4618 = isnan(_4568);
            bool _4620 = _4616 || _4618;
            bool _4622 = isnan(0.0);
            bool _4624 = _4620 || _4622;
            bool _4626 = !_4614;
            bool _4628 = _4624 || _4626;
            if (_4628)
            {
                _4602 = _4570;
            }
            float _4630 = _4602;
            _4604 = _4630;
            if (_4628)
            {
                _4596 = _4568;
            }
            float _4632 = _4596;
            _4598 = _4632;
            if (_4628)
            {
                _4590 = _4566;
            }
            float _4634 = _4590;
            _4592 = _4634;
            if (!_4628)
            {
                float2 _12024 = float2(_141, _4566);
                float2 _4636 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12024, float2(0.0), isnan(_12024))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12024, float2(0.0), isnan(_12024))).xy;
                float _4638 = _4636.x;
                float _4640 = _4636.y;
                float _4642 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4566);
                _4604 = _4638;
                _4598 = _4640;
                _4592 = _4642;
            }
        }
        float _4644 = _4604;
        float _4646 = _4598;
        float _4648 = _4592;
        if (_4520)
        {
            _194 = _4516;
        }
        int _4650 = _194;
        int _4652 = _4650;
        int _4654 = _4650;
        if (!_4520)
        {
            bool _4656 = _3758 > 0.800000011920928955078125;
            bool _4658 = isnan(_3758);
            bool _4660 = _4656 || _4658;
            bool _4662 = isnan(0.800000011920928955078125);
            bool _4664 = _4660 || _4662;
            bool _4666 = _3760 != 0.0;
            bool _4668 = isnan(_3760);
            bool _4670 = _4666 || _4668;
            bool _4672 = isnan(0.0);
            bool _4674 = _4670 || _4672;
            bool _4676 = !_4664;
            bool _4678 = _4674 || _4676;
            if (_4678)
            {
                _4652 = 1;
            }
            int _4680 = _4652;
            _4654 = _4680;
            if (!_4678)
            {
                float2 _12093 = float2(_145, _4584);
                float2 _4682 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12093, float2(0.0), isnan(_12093))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12093, float2(0.0), isnan(_12093))).xy;
                float _4684 = _4682.x;
                float _4686 = _4682.y;
                float _4688 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4584);
                _4654 = _4516;
                _3794 = _4684;
                _3796 = _4686;
                _4586 = _4688;
            }
        }
        int _4690 = _4654;
        float _4692 = _3794;
        float _4694 = _3796;
        float _4696 = _4586;
        int _4698 = _4690 & 1;
        bool _4700 = _4698 != 0;
        float _4702 = _4692;
        float _4704 = _4694;
        float _4706 = _4696;
        int _4708 = _4690;
        if (_4700)
        {
            _4522 = _4690;
        }
        int _4710 = _4522;
        int _4712 = _4710;
        int _4714 = _4710;
        if (!_4700)
        {
            bool _4716 = _4692 > 0.800000011920928955078125;
            bool _4718 = isnan(_4692);
            bool _4720 = _4716 || _4718;
            bool _4722 = isnan(0.800000011920928955078125);
            bool _4724 = _4720 || _4722;
            bool _4726 = _4694 != 0.0;
            bool _4728 = isnan(_4694);
            bool _4730 = _4726 || _4728;
            bool _4732 = isnan(0.0);
            bool _4734 = _4730 || _4732;
            bool _4736 = !_4724;
            bool _4738 = _4734 || _4736;
            if (_4738)
            {
                _4712 = 1;
            }
            int _4740 = _4712;
            _4714 = _4740;
            if (!_4738)
            {
                float2 _12172 = float2(_145, _4696);
                float2 _4742 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12172, float2(0.0), isnan(_12172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12172, float2(0.0), isnan(_12172))).xy;
                float _4744 = _4742.x;
                float _4746 = _4742.y;
                float _4748 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4696);
                _4714 = _4690;
                _4702 = _4744;
                _4704 = _4746;
                _4706 = _4748;
            }
        }
        int _4750 = _4714;
        float _4752 = _4702;
        float _4754 = _4704;
        float _4756 = _4706;
        int _4758 = _4750 & 1;
        bool _4760 = _4758 != 0;
        float _4762 = _4752;
        float _4764 = _4754;
        float _4766 = _4756;
        int _4768 = _4750;
        if (_4760)
        {
            _4708 = _4750;
        }
        int _4770 = _4708;
        int _4772 = _4770;
        int _4774 = _4770;
        if (!_4760)
        {
            bool _4776 = _4752 > 0.800000011920928955078125;
            bool _4778 = isnan(_4752);
            bool _4780 = _4776 || _4778;
            bool _4782 = isnan(0.800000011920928955078125);
            bool _4784 = _4780 || _4782;
            bool _4786 = _4754 != 0.0;
            bool _4788 = isnan(_4754);
            bool _4790 = _4786 || _4788;
            bool _4792 = isnan(0.0);
            bool _4794 = _4790 || _4792;
            bool _4796 = !_4784;
            bool _4798 = _4794 || _4796;
            if (_4798)
            {
                _4772 = 1;
            }
            int _4800 = _4772;
            _4774 = _4800;
            if (!_4798)
            {
                float2 _12251 = float2(_145, _4756);
                float2 _4802 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12251, float2(0.0), isnan(_12251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12251, float2(0.0), isnan(_12251))).xy;
                float _4804 = _4802.x;
                float _4806 = _4802.y;
                float _4808 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4756);
                _4774 = _4750;
                _4762 = _4804;
                _4764 = _4806;
                _4766 = _4808;
            }
        }
        int _4810 = _4774;
        float _4812 = _4762;
        float _4814 = _4764;
        float _4816 = _4766;
        int _4818 = _4810 & 1;
        bool _4820 = _4818 != 0;
        float _4822 = _4812;
        float _4824 = _4814;
        float _4826 = _4816;
        int _4828 = _4810;
        if (_4820)
        {
            _4768 = _4810;
        }
        int _4830 = _4768;
        int _4832 = _4830;
        int _4834 = _4830;
        if (!_4820)
        {
            bool _4836 = _4812 > 0.800000011920928955078125;
            bool _4838 = isnan(_4812);
            bool _4840 = _4836 || _4838;
            bool _4842 = isnan(0.800000011920928955078125);
            bool _4844 = _4840 || _4842;
            bool _4846 = _4814 != 0.0;
            bool _4848 = isnan(_4814);
            bool _4850 = _4846 || _4848;
            bool _4852 = isnan(0.0);
            bool _4854 = _4850 || _4852;
            bool _4856 = !_4844;
            bool _4858 = _4854 || _4856;
            if (_4858)
            {
                _4832 = 1;
            }
            int _4860 = _4832;
            _4834 = _4860;
            if (!_4858)
            {
                float2 _12330 = float2(_145, _4816);
                float2 _4862 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12330, float2(0.0), isnan(_12330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12330, float2(0.0), isnan(_12330))).xy;
                float _4864 = _4862.x;
                float _4866 = _4862.y;
                float _4868 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4816);
                _4834 = _4810;
                _4822 = _4864;
                _4824 = _4866;
                _4826 = _4868;
            }
        }
        int _4870 = _4834;
        float _4872 = _4822;
        float _4874 = _4824;
        float _4876 = _4826;
        int _4878 = _4870 & 1;
        bool _4880 = _4878 != 0;
        float _4882 = _4872;
        float _4884 = _4874;
        float _4886 = _4876;
        int _4888 = _4870;
        if (_4880)
        {
            _4828 = _4870;
        }
        int _4890 = _4828;
        int _4892 = _4890;
        int _4894 = _4890;
        if (!_4880)
        {
            bool _4896 = _4872 > 0.800000011920928955078125;
            bool _4898 = isnan(_4872);
            bool _4900 = _4896 || _4898;
            bool _4902 = isnan(0.800000011920928955078125);
            bool _4904 = _4900 || _4902;
            bool _4906 = _4874 != 0.0;
            bool _4908 = isnan(_4874);
            bool _4910 = _4906 || _4908;
            bool _4912 = isnan(0.0);
            bool _4914 = _4910 || _4912;
            bool _4916 = !_4904;
            bool _4918 = _4914 || _4916;
            if (_4918)
            {
                _4892 = 1;
            }
            int _4920 = _4892;
            _4894 = _4920;
            if (!_4918)
            {
                float2 _12409 = float2(_145, _4876);
                float2 _4922 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12409, float2(0.0), isnan(_12409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12409, float2(0.0), isnan(_12409))).xy;
                float _4924 = _4922.x;
                float _4926 = _4922.y;
                float _4928 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4876);
                _4894 = _4870;
                _4882 = _4924;
                _4884 = _4926;
                _4886 = _4928;
            }
        }
        int _4930 = _4894;
        float _4932 = _4882;
        float _4934 = _4884;
        float _4936 = _4886;
        int _4938 = _4930 & 1;
        bool _4940 = _4938 != 0;
        float _4942 = _4932;
        float _4944 = _4934;
        float _4946 = _4936;
        int _4948 = _4930;
        if (_4940)
        {
            _4888 = _4930;
        }
        int _4950 = _4888;
        int _4952 = _4950;
        int _4954 = _4950;
        if (!_4940)
        {
            bool _4956 = _4932 > 0.800000011920928955078125;
            bool _4958 = isnan(_4932);
            bool _4960 = _4956 || _4958;
            bool _4962 = isnan(0.800000011920928955078125);
            bool _4964 = _4960 || _4962;
            bool _4966 = _4934 != 0.0;
            bool _4968 = isnan(_4934);
            bool _4970 = _4966 || _4968;
            bool _4972 = isnan(0.0);
            bool _4974 = _4970 || _4972;
            bool _4976 = !_4964;
            bool _4978 = _4974 || _4976;
            if (_4978)
            {
                _4952 = 1;
            }
            int _4980 = _4952;
            _4954 = _4980;
            if (!_4978)
            {
                float2 _12488 = float2(_145, _4936);
                float2 _4982 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12488, float2(0.0), isnan(_12488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12488, float2(0.0), isnan(_12488))).xy;
                float _4984 = _4982.x;
                float _4986 = _4982.y;
                float _4988 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4936);
                _4954 = _4930;
                _4942 = _4984;
                _4944 = _4986;
                _4946 = _4988;
            }
        }
        int _4990 = _4954;
        float _4992 = _4942;
        float _4994 = _4944;
        float _4996 = _4946;
        int _4998 = _4990 & 1;
        bool _5000 = _4998 != 0;
        float _5002 = _4992;
        float _5004 = _4994;
        float _5006 = _4996;
        int _5008 = _4990;
        if (_5000)
        {
            _4948 = _4990;
        }
        int _5010 = _4948;
        int _5012 = _5010;
        int _5014 = _5010;
        if (!_5000)
        {
            bool _5016 = _4992 > 0.800000011920928955078125;
            bool _5018 = isnan(_4992);
            bool _5020 = _5016 || _5018;
            bool _5022 = isnan(0.800000011920928955078125);
            bool _5024 = _5020 || _5022;
            bool _5026 = _4994 != 0.0;
            bool _5028 = isnan(_4994);
            bool _5030 = _5026 || _5028;
            bool _5032 = isnan(0.0);
            bool _5034 = _5030 || _5032;
            bool _5036 = !_5024;
            bool _5038 = _5034 || _5036;
            if (_5038)
            {
                _5012 = 1;
            }
            int _5040 = _5012;
            _5014 = _5040;
            if (!_5038)
            {
                float2 _12567 = float2(_145, _4996);
                float2 _5042 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12567, float2(0.0), isnan(_12567))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12567, float2(0.0), isnan(_12567))).xy;
                float _5044 = _5042.x;
                float _5046 = _5042.y;
                float _5048 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4996);
                _5014 = _4990;
                _5002 = _5044;
                _5004 = _5046;
                _5006 = _5048;
            }
        }
        int _5050 = _5014;
        float _5052 = _5002;
        float _5054 = _5004;
        float _5056 = _5006;
        int _5058 = _5050 & 1;
        bool _5060 = _5058 != 0;
        float _5062 = _5052;
        float _5064 = _5054;
        float _5066 = _5056;
        int _5068 = _5050;
        if (_5060)
        {
            _5008 = _5050;
        }
        int _5070 = _5008;
        int _5072 = _5070;
        int _5074 = _5070;
        if (!_5060)
        {
            bool _5076 = _5052 > 0.800000011920928955078125;
            bool _5078 = isnan(_5052);
            bool _5080 = _5076 || _5078;
            bool _5082 = isnan(0.800000011920928955078125);
            bool _5084 = _5080 || _5082;
            bool _5086 = _5054 != 0.0;
            bool _5088 = isnan(_5054);
            bool _5090 = _5086 || _5088;
            bool _5092 = isnan(0.0);
            bool _5094 = _5090 || _5092;
            bool _5096 = !_5084;
            bool _5098 = _5094 || _5096;
            if (_5098)
            {
                _5072 = 1;
            }
            int _5100 = _5072;
            _5074 = _5100;
            if (!_5098)
            {
                float2 _12646 = float2(_145, _5056);
                float2 _5102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12646, float2(0.0), isnan(_12646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12646, float2(0.0), isnan(_12646))).xy;
                float _5104 = _5102.x;
                float _5106 = _5102.y;
                float _5108 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5056);
                _5074 = _5050;
                _5062 = _5104;
                _5064 = _5106;
                _5066 = _5108;
            }
        }
        int _5110 = _5074;
        float _5112 = _5062;
        float _5114 = _5064;
        float _5116 = _5066;
        int _5118 = _5110 & 1;
        bool _5120 = _5118 != 0;
        float _5122 = _5112;
        float _5124 = _5114;
        float _5126 = _5116;
        int _5128 = _5110;
        if (_5120)
        {
            _5068 = _5110;
        }
        int _5130 = _5068;
        int _5132 = _5130;
        int _5134 = _5130;
        if (!_5120)
        {
            bool _5136 = _5112 > 0.800000011920928955078125;
            bool _5138 = isnan(_5112);
            bool _5140 = _5136 || _5138;
            bool _5142 = isnan(0.800000011920928955078125);
            bool _5144 = _5140 || _5142;
            bool _5146 = _5114 != 0.0;
            bool _5148 = isnan(_5114);
            bool _5150 = _5146 || _5148;
            bool _5152 = isnan(0.0);
            bool _5154 = _5150 || _5152;
            bool _5156 = !_5144;
            bool _5158 = _5154 || _5156;
            if (_5158)
            {
                _5132 = 1;
            }
            int _5160 = _5132;
            _5134 = _5160;
            if (!_5158)
            {
                float2 _12725 = float2(_145, _5116);
                float2 _5162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12725, float2(0.0), isnan(_12725))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12725, float2(0.0), isnan(_12725))).xy;
                float _5164 = _5162.x;
                float _5166 = _5162.y;
                float _5168 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5116);
                _5134 = _5110;
                _5122 = _5164;
                _5124 = _5166;
                _5126 = _5168;
            }
        }
        int _5170 = _5134;
        float _5172 = _5122;
        float _5174 = _5124;
        float _5176 = _5126;
        int _5178 = _5170 & 1;
        bool _5180 = _5178 != 0;
        float _5182 = _5172;
        float _5184 = _5174;
        float _5186 = _5176;
        int _5188 = _5170;
        if (_5180)
        {
            _5128 = _5170;
        }
        int _5190 = _5128;
        int _5192 = _5190;
        int _5194 = _5190;
        if (!_5180)
        {
            bool _5196 = _5172 > 0.800000011920928955078125;
            bool _5198 = isnan(_5172);
            bool _5200 = _5196 || _5198;
            bool _5202 = isnan(0.800000011920928955078125);
            bool _5204 = _5200 || _5202;
            bool _5206 = _5174 != 0.0;
            bool _5208 = isnan(_5174);
            bool _5210 = _5206 || _5208;
            bool _5212 = isnan(0.0);
            bool _5214 = _5210 || _5212;
            bool _5216 = !_5204;
            bool _5218 = _5214 || _5216;
            if (_5218)
            {
                _5192 = 1;
            }
            int _5220 = _5192;
            _5194 = _5220;
            if (!_5218)
            {
                float2 _12804 = float2(_145, _5176);
                float2 _5222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12804, float2(0.0), isnan(_12804))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12804, float2(0.0), isnan(_12804))).xy;
                float _5224 = _5222.x;
                float _5226 = _5222.y;
                float _5228 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5176);
                _5194 = _5170;
                _5182 = _5224;
                _5184 = _5226;
                _5186 = _5228;
            }
        }
        int _5230 = _5194;
        float _5232 = _5182;
        float _5234 = _5184;
        float _5236 = _5186;
        int _5238 = _5230 & 1;
        bool _5240 = _5238 != 0;
        float _5242 = _5232;
        float _5244 = _5234;
        float _5246 = _5236;
        int _5248 = _5230;
        if (_5240)
        {
            _5188 = _5230;
        }
        int _5250 = _5188;
        int _5252 = _5250;
        int _5254 = _5250;
        if (!_5240)
        {
            bool _5256 = _5232 > 0.800000011920928955078125;
            bool _5258 = isnan(_5232);
            bool _5260 = _5256 || _5258;
            bool _5262 = isnan(0.800000011920928955078125);
            bool _5264 = _5260 || _5262;
            bool _5266 = _5234 != 0.0;
            bool _5268 = isnan(_5234);
            bool _5270 = _5266 || _5268;
            bool _5272 = isnan(0.0);
            bool _5274 = _5270 || _5272;
            bool _5276 = !_5264;
            bool _5278 = _5274 || _5276;
            if (_5278)
            {
                _5252 = 1;
            }
            int _5280 = _5252;
            _5254 = _5280;
            if (!_5278)
            {
                float2 _12883 = float2(_145, _5236);
                float2 _5282 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12883, float2(0.0), isnan(_12883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12883, float2(0.0), isnan(_12883))).xy;
                float _5284 = _5282.x;
                float _5286 = _5282.y;
                float _5288 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5236);
                _5254 = _5230;
                _5242 = _5284;
                _5244 = _5286;
                _5246 = _5288;
            }
        }
        int _5290 = _5254;
        float _5292 = _5242;
        float _5294 = _5244;
        float _5296 = _5246;
        int _5298 = _5290 & 1;
        bool _5300 = _5298 != 0;
        float _5302 = _5292;
        float _5304 = _5294;
        float _5306 = _5296;
        int _5308 = _5290;
        if (_5300)
        {
            _5248 = _5290;
        }
        int _5310 = _5248;
        int _5312 = _5310;
        int _5314 = _5310;
        if (!_5300)
        {
            bool _5316 = _5292 > 0.800000011920928955078125;
            bool _5318 = isnan(_5292);
            bool _5320 = _5316 || _5318;
            bool _5322 = isnan(0.800000011920928955078125);
            bool _5324 = _5320 || _5322;
            bool _5326 = _5294 != 0.0;
            bool _5328 = isnan(_5294);
            bool _5330 = _5326 || _5328;
            bool _5332 = isnan(0.0);
            bool _5334 = _5330 || _5332;
            bool _5336 = !_5324;
            bool _5338 = _5334 || _5336;
            if (_5338)
            {
                _5312 = 1;
            }
            int _5340 = _5312;
            _5314 = _5340;
            if (!_5338)
            {
                float2 _12962 = float2(_145, _5296);
                float2 _5342 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_12962, float2(0.0), isnan(_12962))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_12962, float2(0.0), isnan(_12962))).xy;
                float _5344 = _5342.x;
                float _5346 = _5342.y;
                float _5348 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5296);
                _5314 = _5290;
                _5302 = _5344;
                _5304 = _5346;
                _5306 = _5348;
            }
        }
        int _5350 = _5314;
        float _5352 = _5302;
        float _5354 = _5304;
        float _5356 = _5306;
        int _5358 = _5350 & 1;
        bool _5360 = _5358 != 0;
        float _5362 = _5352;
        float _5364 = _5354;
        float _5366 = _5356;
        if (_5360)
        {
            _5308 = _5350;
        }
        int _5368 = _5308;
        int _5370 = _5368;
        int _5372 = _5368;
        if (!_5360)
        {
            bool _5374 = _5352 > 0.800000011920928955078125;
            bool _5376 = isnan(_5352);
            bool _5378 = _5374 || _5376;
            bool _5380 = isnan(0.800000011920928955078125);
            bool _5382 = _5378 || _5380;
            bool _5384 = _5354 != 0.0;
            bool _5386 = isnan(_5354);
            bool _5388 = _5384 || _5386;
            bool _5390 = isnan(0.0);
            bool _5392 = _5388 || _5390;
            bool _5394 = !_5382;
            bool _5396 = _5392 || _5394;
            if (_5396)
            {
                _5370 = 1;
            }
            int _5398 = _5370;
            _5372 = _5398;
            if (!_5396)
            {
                float2 _13040 = float2(_145, _5356);
                float2 _5400 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13040, float2(0.0), isnan(_13040))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13040, float2(0.0), isnan(_13040))).xy;
                float _5402 = _5400.x;
                float _5404 = _5400.y;
                float _5406 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5356);
                _5372 = _5350;
                _5362 = _5402;
                _5364 = _5404;
                _5366 = _5406;
            }
        }
        int _5408 = _5372;
        float _5410 = _5362;
        float _5412 = _5364;
        float _5414 = _5366;
        int _5416 = _5408 & 1;
        bool _5418 = _5416 != 0;
        float _5420 = _5412;
        float _5422 = _5410;
        float _5424 = _5414;
        if (!_5418)
        {
            bool _5426 = _5410 > 0.800000011920928955078125;
            bool _5428 = isnan(_5410);
            bool _5430 = _5426 || _5428;
            bool _5432 = isnan(0.800000011920928955078125);
            bool _5434 = _5430 || _5432;
            bool _5436 = _5412 != 0.0;
            bool _5438 = isnan(_5412);
            bool _5440 = _5436 || _5438;
            bool _5442 = isnan(0.0);
            bool _5444 = _5440 || _5442;
            bool _5446 = !_5434;
            bool _5448 = _5444 || _5446;
            if (!_5448)
            {
                float2 _13106 = float2(_145, _5414);
                float2 _5450 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13106, float2(0.0), isnan(_13106))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13106, float2(0.0), isnan(_13106))).xy;
                float _5452 = _5450.x;
                float _5454 = _5450.y;
                float _5456 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _5414);
                _5420 = _5454;
                _5422 = _5452;
                _5424 = _5456;
            }
        }
        float _5458 = _5420;
        float _5460 = _5422;
        float _5462 = _5424;
        float _5464 = fma(_5458, 0.5, 0.5234375);
        float _5466 = fma(_5460, 2.0, 0.03125);
        float _5468 = fma(_4644, 2.0, 0.03125);
        float _5470 = fma(_4646, 0.5, 0.0078125);
        float2 _13138 = float2(_5464, _5466);
        float _5472 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_13138, float2(0.0), isnan(_13138))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_13138, float2(0.0), isnan(_13138))).x;
        float2 _13146 = float2(_5470, _5468);
        float _5474 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_13146, float2(0.0), isnan(_13146))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_13146, float2(0.0), isnan(_13146))).x;
        float _5476 = fma(_5472, -2.007874011993408203125, 3.25);
        float _5478 = fma(_5474, -2.007874011993408203125, 3.25);
        float _5480 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _5482 = fma(_5476, _5480, _5462);
        float _5484 = fma(_5478, (*spvDescriptorSet0.fp_c3)._m0[0].w, _4648);
        float2 _13170 = float2(_153, _5482);
        float _5486 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13170, float2(0.0), isnan(_13170)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13170, float2(0.0), isnan(_13170)), int2(0, 1)).y;
        float2 _13178 = float2(_153, _5484);
        float _5488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13178, float2(0.0), isnan(_13178))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13178, float2(0.0), isnan(_13178))).y;
        float _5490 = -_151;
        float _5492 = fma(_5484, (*spvDescriptorSet0.fp_c3)._m0[0].y, _5490);
        float _5494 = -_151;
        float _5496 = fma(_5482, (*spvDescriptorSet0.fp_c3)._m0[0].y, _5494);
        float _5498 = rint(_5492);
        float _5500 = rint(_5496);
        float _5502 = abs(_5498);
        float _5504 = sqrt(_5502);
        float _5506 = abs(_5500);
        float _5508 = sqrt(_5506);
        float _5510 = _5486 * 4.0;
        float _5512 = _5488 * 4.0;
        float _5514 = rint(_5510);
        float _5516 = rint(_5512);
        float _5518 = fma(_5514, 16.0, _5508);
        float _5520 = fma(_5518, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _5522 = fma(_5516, 16.0, _5504);
        float2 _13228 = float2(_65, _5484);
        float _5524 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13228, float2(0.0), isnan(_13228)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13228, float2(0.0), isnan(_13228)), int2(1, 0)).y;
        float2 _13236 = float2(_65, _5484);
        float _5526 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13236, float2(0.0), isnan(_13236)), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13236, float2(0.0), isnan(_13236)), int2(-2, 0)).y;
        float _5528 = fma(_5522, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float _5530 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _5520);
        float2 _13251 = float2(_65, _5482);
        float _5532 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13251, float2(0.0), isnan(_13251)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13251, float2(0.0), isnan(_13251)), int2(1)).y;
        float2 _13259 = float2(_65, _5482);
        float _5534 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_13259, float2(0.0), isnan(_13259)), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_13259, float2(0.0), isnan(_13259)), int2(-2, 1)).y;
        float2 _13268 = float2(_5528, _5530);
        float2 _5536 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_13268, float2(0.0), isnan(_13268))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_13268, float2(0.0), isnan(_13268))).xy;
        float _5538 = _5536.x;
        float _5540 = _5536.y;
        float _5542 = abs(_5500);
        float _5544 = abs(_5498);
        bool _5546 = _5542 >= _5544;
        bool _5548 = isnan(_5542);
        bool _5550 = _5546 || _5548;
        bool _5552 = isnan(_5544);
        bool _5554 = _5550 || _5552;
        float _5556 = float(_5554);
        float _5558 = abs(_5498);
        float _5560 = abs(_5500);
        bool _5562 = _5558 >= _5560;
        bool _5564 = isnan(_5558);
        bool _5566 = _5562 || _5564;
        bool _5568 = isnan(_5560);
        bool _5570 = _5566 || _5568;
        float _5572 = float(_5570);
        float _5574 = _5556 + _5572;
        float _5576 = 1.0 / _5574;
        float _5578 = _5576 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
        float _5580 = _5556 * _5578;
        float _5582 = _5572 * _5578;
        float _5584 = -_5580;
        float _5586 = fma(_5584, _5524, 1.0);
        float _5588 = -_5580;
        float _5590 = fma(_5588, _5526, 1.0);
        float _5592 = -_5582;
        float _5594 = fma(_5592, _5532, _5586);
        float _5596 = precise::clamp(_5594, 0.0, 1.0);
        float _5598 = -_5582;
        float _5600 = fma(_5598, _5534, _5590);
        float _5602 = precise::clamp(_5600, 0.0, 1.0);
        float _5604 = _5538 * _5596;
        float _5606 = _5540 * _5602;
        out.m_42.x = as_type<float>(_3638);
        out.m_42.y = as_type<float>(_3640);
        out.m_42.z = _5604;
        out.m_42.w = _5606;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    out.m_42.x = as_type<float>(_3638);
    out.m_42.y = as_type<float>(_3640);
    out.m_42.z = 0.0;
    out.m_42.w = 0.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

