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
    bool _982 = false;
    bool _794 = false;
    bool _482 = false;
    bool _340 = false;
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
    float2 _5076 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5076, float2(0.0), isnan(_5076))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5076, float2(0.0), isnan(_5076))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_35.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_35.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_37.x;
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
    int _172 = as_type<int>(_135);
    float _174 = _117;
    float _176 = _111;
    float _178 = _139;
    int _180 = as_type<int>(_137);
    float _182 = _111;
    float _184 = _139;
    int _186 = as_type<int>(_149);
    float _188 = _137;
    float _190 = _155;
    float _192 = _147;
    int _194 = _166;
    int _196 = as_type<int>(_143);
    if (!_159)
    {
        _168 = 0;
        _170 = 0;
    }
    int _198 = _168;
    int _200 = _170;
    int _202 = _198;
    int _204 = _200;
    if (!_159)
    {
        _172 = _166;
    }
    int _206 = _172;
    bool _208 = !_159;
    int _210 = _206;
    float _212 = 0.0;
    if (!_208)
    {
        if (!_161)
        {
            _174 = 0.0;
        }
        float _214 = _174;
        float _216 = _214;
        if (!_161)
        {
            _176 = 0.0;
        }
        float _218 = _176;
        bool _220 = !_161;
        float _222 = _218;
        if (!_220)
        {
            float _224 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _226 = _65 + _224;
            float _228 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _5269 = float2(_226, _228);
            float2 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5269, float2(0.0), isnan(_5269))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5269, float2(0.0), isnan(_5269))).xy;
            float _232 = _230.x;
            float _234 = _230.y;
            float _236 = _232 + _234;
            float _238 = _236 * 0.5;
            bool _240 = _238 >= 0.89999997615814208984375;
            bool _242 = isnan(_238);
            bool _244 = _240 || _242;
            bool _246 = isnan(0.89999997615814208984375);
            bool _248 = _244 || _246;
            bool _250 = !_248;
            float _252 = _234;
            float _254 = 0.0;
            float _256 = _238;
            if (!_250)
            {
                float _258 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _260 = _226 + _258;
                float _262 = _228 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _5316 = float2(_260, _262);
                float2 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5316, float2(0.0), isnan(_5316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5316, float2(0.0), isnan(_5316))).xy;
                float _266 = _264.x;
                float _268 = _264.y;
                float _270 = _268 + _266;
                float _272 = _270 * 0.5;
                bool _274 = _272 >= 0.89999997615814208984375;
                bool _276 = isnan(_272);
                bool _278 = _274 || _276;
                bool _280 = isnan(0.89999997615814208984375);
                bool _282 = _278 || _280;
                bool _284 = !_282;
                _252 = _268;
                _254 = 1.0;
                _256 = _272;
                if (!_284)
                {
                    float _286 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _288 = _260 + _286;
                    float _290 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _5361 = float2(_288, _290);
                    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5361, float2(0.0), isnan(_5361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5361, float2(0.0), isnan(_5361))).xy;
                    float _294 = _292.x;
                    float _296 = _292.y;
                    float _298 = _296 + _294;
                    float _300 = _298 * 0.5;
                    bool _302 = _300 >= 0.89999997615814208984375;
                    bool _304 = isnan(_300);
                    bool _306 = _302 || _304;
                    bool _308 = isnan(0.89999997615814208984375);
                    bool _310 = _306 || _308;
                    bool _312 = !_310;
                    _252 = _296;
                    _254 = 2.0;
                    _256 = _300;
                    if (!_312)
                    {
                        float _314 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _316 = _288 + _314;
                        float _318 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _5407 = float2(_316, _318);
                        float2 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5407, float2(0.0), isnan(_5407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5407, float2(0.0), isnan(_5407))).xy;
                        float _322 = _320.x;
                        float _324 = _320.y;
                        float _326 = _324 + _322;
                        float _328 = _326 * 0.5;
                        bool _330 = _328 >= 0.89999997615814208984375;
                        bool _332 = isnan(_328);
                        bool _334 = _330 || _332;
                        bool _336 = isnan(0.89999997615814208984375);
                        bool _338 = _334 || _336;
                        _252 = _324;
                        _256 = _328;
                        if (!_338)
                        {
                            _254 = 3.0;
                            _340 = true;
                        }
                        else
                        {
                            _254 = 3.0;
                        }
                    }
                }
            }
            _340 = false;
            float _342 = _252;
            float _344 = _254;
            float _346 = _256;
            bool _348 = _342 >= 0.89999997615814208984375;
            bool _350 = isnan(_342);
            bool _352 = _348 || _350;
            bool _354 = isnan(0.89999997615814208984375);
            bool _356 = _352 || _354;
            float _358 = float(_356);
            float _360 = _358 + _344;
            _216 = _360;
            _222 = _346;
        }
        float _362 = _216;
        float _364 = _222;
        float _366 = _65 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _368 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _370 = _67 + _368;
        float2 _5481 = float2(_366, _370);
        float2 _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5481, float2(0.0), isnan(_5481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5481, float2(0.0), isnan(_5481))).xy;
        float _374 = _372.x;
        float _376 = _372.y;
        float _378 = _374 + _376;
        float _380 = _378 * 0.5;
        bool _382 = _380 >= 0.89999997615814208984375;
        bool _384 = isnan(_380);
        bool _386 = _382 || _384;
        bool _388 = isnan(0.89999997615814208984375);
        bool _390 = _386 || _388;
        bool _392 = !_390;
        float _394 = 0.0;
        float _396 = _380;
        float _398 = _376;
        if (!_392)
        {
            float _400 = _366 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _402 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _404 = _370 + _402;
            float2 _5526 = float2(_400, _404);
            float2 _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5526, float2(0.0), isnan(_5526))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5526, float2(0.0), isnan(_5526))).xy;
            float _408 = _406.x;
            float _410 = _406.y;
            float _412 = _410 + _408;
            float _414 = _412 * 0.5;
            bool _416 = _414 >= 0.89999997615814208984375;
            bool _418 = isnan(_414);
            bool _420 = _416 || _418;
            bool _422 = isnan(0.89999997615814208984375);
            bool _424 = _420 || _422;
            bool _426 = !_424;
            _394 = 1.0;
            _396 = _414;
            _398 = _404;
            if (!_426)
            {
                float _428 = _400 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _430 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _432 = _404 + _430;
                float2 _5571 = float2(_428, _432);
                float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5571, float2(0.0), isnan(_5571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5571, float2(0.0), isnan(_5571))).xy;
                float _436 = _434.x;
                float _438 = _434.y;
                float _440 = _438 + _436;
                float _442 = _440 * 0.5;
                bool _444 = _442 >= 0.89999997615814208984375;
                bool _446 = isnan(_442);
                bool _448 = _444 || _446;
                bool _450 = isnan(0.89999997615814208984375);
                bool _452 = _448 || _450;
                bool _454 = !_452;
                _394 = 2.0;
                _396 = _442;
                _398 = _432;
                if (!_454)
                {
                    float _456 = _428 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _458 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _460 = _432 + _458;
                    float2 _5616 = float2(_456, _460);
                    float2 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5616, float2(0.0), isnan(_5616))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5616, float2(0.0), isnan(_5616))).xy;
                    float _464 = _462.x;
                    float _466 = _462.y;
                    float _468 = _466 + _464;
                    float _470 = _468 * 0.5;
                    bool _472 = _470 >= 0.89999997615814208984375;
                    bool _474 = isnan(_470);
                    bool _476 = _472 || _474;
                    bool _478 = isnan(0.89999997615814208984375);
                    bool _480 = _476 || _478;
                    _396 = _470;
                    _398 = _466;
                    if (!_480)
                    {
                        _394 = 3.0;
                        _482 = true;
                    }
                    else
                    {
                        _394 = 3.0;
                    }
                }
            }
        }
        _482 = false;
        float _484 = _394;
        float _486 = _396;
        float _488 = _398;
        float _490 = _362 + _484;
        bool _492 = _490 > 2.0;
        float _494 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 0.25, _65);
        float _496 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _498 = _494 + _496;
        float _500 = _490;
        float _502 = _488;
        float _504 = _486;
        if (!_492)
        {
            _500 = 0.0;
            _502 = 0.0;
        }
        float _506 = _500;
        float _508 = _502;
        bool _510 = !_492;
        float _512 = _506;
        float _514 = _508;
        if (!_510)
        {
            float _516 = -_362;
            float _518 = _516 + 0.25;
            float _520 = -_484;
            float _522 = _520 + (-0.25);
            float _524 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _526 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _528 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _530 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _5719 = float2(_528, _524);
            float2 _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5719, float2(0.0), isnan(_5719)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5719, float2(0.0), isnan(_5719)), int2(-1, 0)).xy;
            float _534 = _532.x;
            float _536 = _532.y;
            float2 _5734 = float2(_526, _530);
            float2 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5734, float2(0.0), isnan(_5734)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5734, float2(0.0), isnan(_5734)), int2(1, 0)).xy;
            float _540 = _538.x;
            float _542 = _538.y;
            bool _544 = _486 <= 0.89999997615814208984375;
            bool _546 = isnan(_486);
            bool _548 = _544 || _546;
            bool _550 = isnan(0.89999997615814208984375);
            bool _552 = _548 || _550;
            float _554 = float(_552);
            float _556 = fma(_540, 5.0, -3.75);
            float _558 = rint(_536);
            float _560 = abs(_556);
            float _562 = _540 * _560;
            float _564 = fma(_534, 5.0, -3.75);
            float _566 = abs(_564);
            float _568 = _534 * _566;
            float _570 = rint(_542);
            bool _572 = _364 <= 0.89999997615814208984375;
            bool _574 = isnan(_364);
            bool _576 = _572 || _574;
            bool _578 = isnan(0.89999997615814208984375);
            bool _580 = _576 || _578;
            float _582 = float(_580);
            float _584 = rint(_562);
            float _586 = rint(_568);
            float _588 = fma(_570, 2.0, _584);
            float _590 = _588 * _554;
            float _592 = fma(_558, 2.0, _586);
            float _594 = fma(_590, 20.0, _484);
            float _596 = _592 * _582;
            float _598 = fma(_594, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _600 = fma(_596, 20.0, _362);
            float _602 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 0.14285714924335479736328125, _598);
            float _604 = fma(_600, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _606 = _604 + 0.5;
            float2 _5831 = float2(_606, _602);
            float2 _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_5831, float2(0.0), isnan(_5831))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_5831, float2(0.0), isnan(_5831))).xy;
            float _610 = _608.x;
            float _612 = _608.y;
            _504 = _602;
            _512 = _610;
            _514 = _612;
        }
        float _614 = _504;
        float _616 = _512;
        float _618 = _514;
        float2 _5850 = float2(_498, _370);
        float2 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5850, float2(0.0), isnan(_5850))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5850, float2(0.0), isnan(_5850))).xy;
        float _622 = _620.x;
        float _624 = _620.y;
        float _626 = fma(_622, 5.0, -3.75);
        float _628 = rint(_624);
        float _630 = abs(_626);
        float _632 = _622 * _630;
        float _634 = rint(_632);
        float _636 = _634 + _628;
        float _638 = _636 * 0.5;
        bool _640 = _638 >= 0.89999997615814208984375;
        bool _642 = isnan(_638);
        bool _644 = _640 || _642;
        bool _646 = isnan(0.89999997615814208984375);
        bool _648 = _644 || _646;
        bool _650 = !_648;
        float _652 = 0.0;
        float _654 = _634;
        float _656 = _638;
        float _658 = _636;
        float _660 = _614;
        int _662 = 1084227584;
        int _664 = 1084227584;
        float _666 = _618;
        float _668 = _616;
        float _750;
        float _790;
        float _792;
        if (!_650)
        {
            float _670 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _672 = _498 + _670;
            float _674 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _676 = _370 + _674;
            float2 _5913 = float2(_672, _676);
            float2 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5913, float2(0.0), isnan(_5913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5913, float2(0.0), isnan(_5913))).xy;
            float _680 = _678.x;
            float _682 = _678.y;
            float _684 = fma(_680, 5.0, -3.75);
            float _686 = rint(_682);
            float _688 = abs(_684);
            float _690 = _680 * _688;
            float _692 = rint(_690);
            float _694 = _692 + _686;
            float _696 = _694 * 0.5;
            bool _698 = _696 >= 0.89999997615814208984375;
            bool _700 = isnan(_696);
            bool _702 = _698 || _700;
            bool _704 = isnan(0.89999997615814208984375);
            bool _706 = _702 || _704;
            bool _708 = !_706;
            _652 = 1.0;
            _654 = _692;
            _656 = _696;
            _658 = _676;
            if (!_708)
            {
                float _710 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _712 = _672 + _710;
                float _714 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _716 = _676 + _714;
                float2 _5972 = float2(_712, _716);
                float2 _718 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5972, float2(0.0), isnan(_5972))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5972, float2(0.0), isnan(_5972))).xy;
                float _720 = _718.x;
                float _722 = _718.y;
                float _724 = fma(_720, 5.0, -3.75);
                float _726 = rint(_722);
                float _728 = abs(_724);
                float _730 = _720 * _728;
                float _732 = rint(_730);
                float _734 = _732 + _726;
                float _736 = _734 * 0.5;
                bool _738 = _736 >= 0.89999997615814208984375;
                bool _740 = isnan(_736);
                bool _742 = _738 || _740;
                bool _744 = isnan(0.89999997615814208984375);
                bool _746 = _742 || _744;
                bool _748 = !_746;
                _652 = 2.0;
                _654 = _732;
                _656 = _736;
                _658 = _716;
                _750 = _732;
                if (!_748)
                {
                    float _752 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _754 = _712 + _752;
                    float _756 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _758 = _716 + _756;
                    float2 _6032 = float2(_754, _758);
                    float2 _760 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6032, float2(0.0), isnan(_6032))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6032, float2(0.0), isnan(_6032))).xy;
                    float _762 = _760.x;
                    float _764 = _760.y;
                    float _766 = fma(_762, 5.0, -3.75);
                    float _768 = rint(_764);
                    float _770 = abs(_766);
                    float _772 = _762 * _770;
                    float _774 = rint(_772);
                    float _776 = _774 + _768;
                    float _778 = _776 * 0.5;
                    bool _780 = _778 >= 0.89999997615814208984375;
                    bool _782 = isnan(_778);
                    bool _784 = _780 || _782;
                    bool _786 = isnan(0.89999997615814208984375);
                    bool _788 = _784 || _786;
                    _656 = _778;
                    _658 = _758;
                    _790 = _778;
                    _792 = _758;
                    _794 = _788;
                    if (!_794)
                    {
                        _652 = 3.0;
                    }
                }
            }
        }
        float _804;
        if (!_794)
        {
            float _796 = _652;
            float _798 = _654;
            float _800 = _656;
            float _802 = _658;
            _804 = _796;
            _750 = _798;
            _790 = _800;
            _792 = _802;
        }
        if (false || _794)
        {
            _794 = false;
            _804 = 3.0;
        }
        float _806 = _804;
        float _808 = _750;
        float _810 = _790;
        float _812 = _792;
        float2 _6103 = float2(_65, _67);
        float _814 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6103, float2(0.0), isnan(_6103)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6103, float2(0.0), isnan(_6103)), int2(1, 0)).x;
        bool _816 = _814 > 0.0;
        float _818 = _808;
        float _820 = _812;
        int _822 = as_type<int>(_810);
        if (!_816)
        {
            _818 = 0.0;
            _660 = 0.0;
        }
        float _824 = _818;
        float _826 = _660;
        bool _828 = !_816;
        float _830 = _824;
        float _832 = _826;
        if (!_828)
        {
            float _834 = _494 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _836 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _6138 = float2(_834, _836);
            float2 _838 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6138, float2(0.0), isnan(_6138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6138, float2(0.0), isnan(_6138))).xy;
            float _840 = _838.x;
            float _842 = _838.y;
            float _844 = fma(_840, 5.0, -3.75);
            float _846 = rint(_842);
            float _848 = abs(_844);
            float _850 = _840 * _848;
            float _852 = rint(_850);
            float _854 = _852 + _846;
            float _856 = _854 * 0.5;
            bool _858 = _856 >= 0.89999997615814208984375;
            bool _860 = isnan(_856);
            bool _862 = _858 || _860;
            bool _864 = isnan(0.89999997615814208984375);
            bool _866 = _862 || _864;
            bool _868 = !_866;
            float _870 = _846;
            float _872 = 0.0;
            float _874 = _856;
            _820 = _834;
            if (!_868)
            {
                float _876 = _834 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _878 = _836 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _6193 = float2(_876, _878);
                float2 _880 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6193, float2(0.0), isnan(_6193))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6193, float2(0.0), isnan(_6193))).xy;
                float _882 = _880.x;
                float _884 = _880.y;
                float _886 = fma(_882, 5.0, -3.75);
                float _888 = rint(_884);
                float _890 = abs(_886);
                float _892 = _882 * _890;
                float _894 = rint(_892);
                float _896 = _894 + _888;
                float _898 = _896 * 0.5;
                bool _900 = _898 >= 0.89999997615814208984375;
                bool _902 = isnan(_898);
                bool _904 = _900 || _902;
                bool _906 = isnan(0.89999997615814208984375);
                bool _908 = _904 || _906;
                bool _910 = !_908;
                _870 = _888;
                _872 = 1.0;
                _874 = _898;
                if (!_910)
                {
                    float _912 = _876 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _914 = _878 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _6247 = float2(_912, _914);
                    float2 _916 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6247, float2(0.0), isnan(_6247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6247, float2(0.0), isnan(_6247))).xy;
                    float _918 = _916.x;
                    float _920 = _916.y;
                    float _922 = fma(_918, 5.0, -3.75);
                    float _924 = rint(_920);
                    float _926 = abs(_922);
                    float _928 = _918 * _926;
                    float _930 = rint(_928);
                    float _932 = _930 + _924;
                    float _934 = _932 * 0.5;
                    bool _936 = _934 >= 0.89999997615814208984375;
                    bool _938 = isnan(_934);
                    bool _940 = _936 || _938;
                    bool _942 = isnan(0.89999997615814208984375);
                    bool _944 = _940 || _942;
                    bool _946 = !_944;
                    _870 = _924;
                    _872 = 2.0;
                    _874 = _934;
                    if (!_946)
                    {
                        float _948 = _912 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _950 = _914 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _6301 = float2(_948, _950);
                        float2 _952 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6301, float2(0.0), isnan(_6301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6301, float2(0.0), isnan(_6301))).xy;
                        float _954 = _952.x;
                        float _956 = _952.y;
                        float _958 = fma(_954, 5.0, -3.75);
                        float _960 = rint(_956);
                        float _962 = abs(_958);
                        float _964 = _954 * _962;
                        float _966 = rint(_964);
                        float _968 = _966 + _960;
                        float _970 = _968 * 0.5;
                        bool _972 = _970 >= 0.89999997615814208984375;
                        bool _974 = isnan(_970);
                        bool _976 = _972 || _974;
                        bool _978 = isnan(0.89999997615814208984375);
                        bool _980 = _976 || _978;
                        _870 = _960;
                        _874 = _970;
                        _662 = as_type<int>(_966);
                        if (!_980)
                        {
                            _872 = 3.0;
                            _982 = true;
                        }
                        else
                        {
                            _872 = 3.0;
                        }
                    }
                }
            }
            _982 = false;
            float _984 = _870;
            float _986 = _872;
            float _988 = _874;
            int _990 = _662;
            bool _992 = _984 >= 0.89999997615814208984375;
            bool _994 = isnan(_984);
            bool _996 = _992 || _994;
            bool _998 = isnan(0.89999997615814208984375);
            bool _1000 = _996 || _998;
            float _1002 = float(_1000);
            float _1004 = _1002 + _986;
            _830 = _1004;
            _832 = _988;
            _664 = _990;
        }
        float _1006 = _830;
        float _1008 = _832;
        int _1010 = _664;
        float _1012 = _820;
        float _1014 = _806 + _1006;
        bool _1016 = _1014 > 2.0;
        bool _1018 = !_1016;
        int _1020 = _1010;
        int _1022 = as_type<int>(_1014);
        float _1024 = _1012;
        if (!_1018)
        {
            float _1026 = fma(_1006, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1028 = fma(_1006, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _1030 = -_806;
            float _1032 = fma(_1030, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1034 = -_806;
            float _1036 = fma(_1034, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _6418 = float2(_1026, _1028);
            float2 _1038 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6418, float2(0.0), isnan(_6418)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6418, float2(0.0), isnan(_6418)), int2(1, 0)).xy;
            float _1040 = _1038.x;
            float _1042 = _1038.y;
            float2 _6430 = float2(_1032, _1036);
            float _1044 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6430, float2(0.0), isnan(_6430)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6430, float2(0.0), isnan(_6430)), int2(-1, 0)).y;
            float2 _6438 = float2(_1032, _1036);
            float _1046 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6438, float2(0.0), isnan(_6438)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6438, float2(0.0), isnan(_6438)), int2(0, -1)).x;
            bool _1048 = _1008 >= 0.89999997615814208984375;
            bool _1050 = isnan(_1008);
            bool _1052 = _1048 || _1050;
            bool _1054 = isnan(0.89999997615814208984375);
            bool _1056 = _1052 || _1054;
            float _1058 = float(_1056);
            bool _1060 = _810 >= 0.89999997615814208984375;
            bool _1062 = isnan(_810);
            bool _1064 = _1060 || _1062;
            bool _1066 = isnan(0.89999997615814208984375);
            bool _1068 = _1064 || _1066;
            float _1070 = float(_1068);
            float _1072 = fma(_1042, 2.0, _1040);
            float _1074 = fma(_1044, 2.0, _1046);
            float _1076 = _1072 * _1058;
            float _1078 = _1074 * _1070;
            float _1080 = fma(_1076, 20.0, _1006);
            float _1082 = fma(_1078, 20.0, _806);
            float _1084 = fma(_1080, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _1086 = fma(_1082, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _1088 = fma((*spvDescriptorSet0.fp_c3)._m0[3].w, 0.14285714924335479736328125, _1084);
            float _1090 = _1086 + 0.5;
            float2 _6501 = float2(_1090, _1088);
            float2 _1092 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_6501, float2(0.0), isnan(_6501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_6501, float2(0.0), isnan(_6501))).xy;
            float _1094 = _1092.x;
            float _1096 = _1092.y;
            float _1098 = _1096 + _616;
            float _1100 = _1094 + _618;
            _666 = _1100;
            _668 = _1098;
            _1020 = 1011666125;
            _1022 = as_type<int>(_1090);
            _1024 = _1040;
        }
        float _1102 = _666;
        float _1104 = _668;
        int _1106 = _1020;
        int _1108 = _1022;
        float _1110 = _1024;
        float _1112 = -_1102;
        bool _1114 = _1104 != _1112;
        bool _1116 = isnan(_1104);
        bool _1118 = _1114 || _1116;
        bool _1120 = isnan(_1112);
        bool _1122 = _1118 || _1120;
        int _1124 = _1108;
        int _1126 = _1106;
        _182 = _1110;
        _212 = as_type<float>(_1106);
        _202 = as_type<int>(_1104);
        _204 = as_type<int>(_1102);
        if (_1122)
        {
            _1124 = 0;
        }
        int _1128 = _1124;
        _210 = _1128;
        if (!_1122)
        {
            float2 _6563 = float2(_153, _137);
            float2 _1130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6563, float2(0.0), isnan(_6563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6563, float2(0.0), isnan(_6563))).xy;
            float _1132 = _1130.x;
            float _1134 = _1130.y;
            float2 _6575 = float2(_139, _141);
            float2 _1136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6575, float2(0.0), isnan(_6575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6575, float2(0.0), isnan(_6575))).xy;
            float _1138 = _1136.x;
            float _1140 = _1136.y;
            float _1142 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _153);
            float _1144 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _139);
            bool _1146 = _1134 >= 0.800000011920928955078125;
            bool _1148 = isnan(_1134);
            bool _1150 = _1146 || _1148;
            bool _1152 = isnan(0.800000011920928955078125);
            bool _1154 = _1150 || _1152;
            bool _1156 = _1140 > 0.800000011920928955078125;
            bool _1158 = isnan(_1140);
            bool _1160 = _1156 || _1158;
            bool _1162 = isnan(0.800000011920928955078125);
            bool _1164 = _1160 || _1162;
            bool _1166 = _1132 != 0.0;
            bool _1168 = isnan(_1132);
            bool _1170 = _1166 || _1168;
            bool _1172 = isnan(0.0);
            bool _1174 = _1170 || _1172;
            bool _1176 = !_1154;
            bool _1178 = _1174 || _1176;
            bool _1180 = _1138 != 0.0;
            bool _1182 = isnan(_1138);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan(0.0);
            bool _1188 = _1184 || _1186;
            bool _1190 = !_1164;
            bool _1192 = _1188 || _1190;
            float _1194 = _1132;
            float _1196 = _1134;
            int _1198 = as_type<int>(_1142);
            float _1200 = _1144;
            if (!_1178)
            {
                float2 _6659 = float2(_1142, _137);
                float2 _1202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6659, float2(0.0), isnan(_6659))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6659, float2(0.0), isnan(_6659))).xy;
                float _1204 = _1202.x;
                float _1206 = _1202.y;
                _1194 = _1204;
                _1196 = _1206;
            }
            float _1208 = _1194;
            float _1210 = _1196;
            float _1212 = _1138;
            float _1214 = _1140;
            if (!_1192)
            {
                float2 _6681 = float2(_1144, _141);
                float2 _1216 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6681, float2(0.0), isnan(_6681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6681, float2(0.0), isnan(_6681))).xy;
                float _1218 = _1216.x;
                float _1220 = _1216.y;
                _1212 = _1218;
                _1214 = _1220;
            }
            float _1222 = _1212;
            float _1224 = _1214;
            if (_1178)
            {
                _1126 = 1;
            }
            int _1226 = _1126;
            int _1228 = _1226;
            if (!_1178)
            {
                _1228 = 0;
            }
            int _1230 = _1228;
            int _1232 = _1230;
            if (_1178)
            {
                _178 = _1142;
            }
            float _1234 = _178;
            float _1236 = _1234;
            if (!_1178)
            {
                float _1238 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1142);
                _1236 = _1238;
            }
            float _1240 = _1236;
            int _1242 = _1230 & 1;
            bool _1244 = _1242 != 0;
            float _1246 = _1240;
            if (_1244)
            {
                _822 = _1230;
            }
            int _1248 = _822;
            int _1250 = _1248;
            int _1252 = _1248;
            float _1254 = _1210;
            float _1256 = _1208;
            float _1258 = _1224;
            float _1260 = _1222;
            if (!_1244)
            {
                bool _1262 = _1210 >= 0.800000011920928955078125;
                bool _1264 = isnan(_1210);
                bool _1266 = _1262 || _1264;
                bool _1268 = isnan(0.800000011920928955078125);
                bool _1270 = _1266 || _1268;
                bool _1272 = _1208 != 0.0;
                bool _1274 = isnan(_1208);
                bool _1276 = _1272 || _1274;
                bool _1278 = isnan(0.0);
                bool _1280 = _1276 || _1278;
                bool _1282 = !_1270;
                bool _1284 = _1280 || _1282;
                if (_1284)
                {
                    _1250 = 1;
                }
                int _1286 = _1250;
                _1252 = _1286;
                if (!_1284)
                {
                    float2 _6779 = float2(_1240, _137);
                    float2 _1288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6779, float2(0.0), isnan(_6779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6779, float2(0.0), isnan(_6779))).xy;
                    float _1290 = _1288.x;
                    float _1292 = _1288.y;
                    float _1294 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1240);
                    _1252 = _1230;
                    _1254 = _1292;
                    _1256 = _1290;
                    _1246 = _1294;
                }
            }
            int _1296 = _1252;
            float _1298 = _1254;
            float _1300 = _1256;
            float _1302 = _1246;
            int _1304 = _1296 & 1;
            bool _1306 = _1304 != 0;
            float _1308 = _1298;
            float _1310 = _1300;
            float _1312 = _1302;
            int _1314 = _1296;
            if (_1306)
            {
                _1198 = _1296;
            }
            int _1316 = _1198;
            int _1318 = _1316;
            int _1320 = _1316;
            if (!_1306)
            {
                bool _1322 = _1298 >= 0.800000011920928955078125;
                bool _1324 = isnan(_1298);
                bool _1326 = _1322 || _1324;
                bool _1328 = isnan(0.800000011920928955078125);
                bool _1330 = _1326 || _1328;
                bool _1332 = _1300 != 0.0;
                bool _1334 = isnan(_1300);
                bool _1336 = _1332 || _1334;
                bool _1338 = isnan(0.0);
                bool _1340 = _1336 || _1338;
                bool _1342 = !_1330;
                bool _1344 = _1340 || _1342;
                if (_1344)
                {
                    _1318 = 1;
                }
                int _1346 = _1318;
                _1320 = _1346;
                if (!_1344)
                {
                    float2 _6858 = float2(_1302, _137);
                    float2 _1348 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6858, float2(0.0), isnan(_6858))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6858, float2(0.0), isnan(_6858))).xy;
                    float _1350 = _1348.x;
                    float _1352 = _1348.y;
                    float _1354 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1302);
                    _1320 = _1296;
                    _1308 = _1352;
                    _1310 = _1350;
                    _1312 = _1354;
                }
            }
            int _1356 = _1320;
            float _1358 = _1308;
            float _1360 = _1310;
            float _1362 = _1312;
            int _1364 = _1356 & 1;
            bool _1366 = _1364 != 0;
            float _1368 = _1358;
            float _1370 = _1360;
            float _1372 = _1362;
            int _1374 = _1356;
            if (_1366)
            {
                _1232 = _1356;
            }
            int _1376 = _1232;
            int _1378 = _1376;
            int _1380 = _1376;
            if (!_1366)
            {
                bool _1382 = _1358 >= 0.800000011920928955078125;
                bool _1384 = isnan(_1358);
                bool _1386 = _1382 || _1384;
                bool _1388 = isnan(0.800000011920928955078125);
                bool _1390 = _1386 || _1388;
                bool _1392 = _1360 != 0.0;
                bool _1394 = isnan(_1360);
                bool _1396 = _1392 || _1394;
                bool _1398 = isnan(0.0);
                bool _1400 = _1396 || _1398;
                bool _1402 = !_1390;
                bool _1404 = _1400 || _1402;
                if (_1404)
                {
                    _1378 = 1;
                }
                int _1406 = _1378;
                _1380 = _1406;
                if (!_1404)
                {
                    float2 _6937 = float2(_1362, _137);
                    float2 _1408 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6937, float2(0.0), isnan(_6937))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6937, float2(0.0), isnan(_6937))).xy;
                    float _1410 = _1408.x;
                    float _1412 = _1408.y;
                    float _1414 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1362);
                    _1380 = _1356;
                    _1368 = _1412;
                    _1370 = _1410;
                    _1372 = _1414;
                }
            }
            int _1416 = _1380;
            float _1418 = _1368;
            float _1420 = _1370;
            float _1422 = _1372;
            int _1424 = _1416 & 1;
            bool _1426 = _1424 != 0;
            float _1428 = _1418;
            float _1430 = _1420;
            float _1432 = _1422;
            int _1434 = _1416;
            if (_1426)
            {
                _1374 = _1416;
            }
            int _1436 = _1374;
            int _1438 = _1436;
            int _1440 = _1436;
            if (!_1426)
            {
                bool _1442 = _1418 >= 0.800000011920928955078125;
                bool _1444 = isnan(_1418);
                bool _1446 = _1442 || _1444;
                bool _1448 = isnan(0.800000011920928955078125);
                bool _1450 = _1446 || _1448;
                bool _1452 = _1420 != 0.0;
                bool _1454 = isnan(_1420);
                bool _1456 = _1452 || _1454;
                bool _1458 = isnan(0.0);
                bool _1460 = _1456 || _1458;
                bool _1462 = !_1450;
                bool _1464 = _1460 || _1462;
                if (_1464)
                {
                    _1438 = 1;
                }
                int _1466 = _1438;
                _1440 = _1466;
                if (!_1464)
                {
                    float2 _7016 = float2(_1422, _137);
                    float2 _1468 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7016, float2(0.0), isnan(_7016))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7016, float2(0.0), isnan(_7016))).xy;
                    float _1470 = _1468.x;
                    float _1472 = _1468.y;
                    float _1474 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1422);
                    _1440 = _1416;
                    _1428 = _1472;
                    _1430 = _1470;
                    _1432 = _1474;
                }
            }
            int _1476 = _1440;
            float _1478 = _1428;
            float _1480 = _1430;
            float _1482 = _1432;
            int _1484 = _1476 & 1;
            bool _1486 = _1484 != 0;
            float _1488 = _1478;
            float _1490 = _1480;
            float _1492 = _1482;
            int _1494 = _1476;
            if (_1486)
            {
                _1434 = _1476;
            }
            int _1496 = _1434;
            int _1498 = _1496;
            int _1500 = _1496;
            if (!_1486)
            {
                bool _1502 = _1478 >= 0.800000011920928955078125;
                bool _1504 = isnan(_1478);
                bool _1506 = _1502 || _1504;
                bool _1508 = isnan(0.800000011920928955078125);
                bool _1510 = _1506 || _1508;
                bool _1512 = _1480 != 0.0;
                bool _1514 = isnan(_1480);
                bool _1516 = _1512 || _1514;
                bool _1518 = isnan(0.0);
                bool _1520 = _1516 || _1518;
                bool _1522 = !_1510;
                bool _1524 = _1520 || _1522;
                if (_1524)
                {
                    _1498 = 1;
                }
                int _1526 = _1498;
                _1500 = _1526;
                if (!_1524)
                {
                    float2 _7095 = float2(_1482, _137);
                    float2 _1528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7095, float2(0.0), isnan(_7095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7095, float2(0.0), isnan(_7095))).xy;
                    float _1530 = _1528.x;
                    float _1532 = _1528.y;
                    float _1534 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1482);
                    _1500 = _1476;
                    _1488 = _1532;
                    _1490 = _1530;
                    _1492 = _1534;
                }
            }
            int _1536 = _1500;
            float _1538 = _1488;
            float _1540 = _1490;
            float _1542 = _1492;
            int _1544 = _1536 & 1;
            bool _1546 = _1544 != 0;
            float _1548 = _1538;
            float _1550 = _1540;
            float _1552 = _1542;
            int _1554 = _1536;
            if (_1546)
            {
                _1494 = _1536;
            }
            int _1556 = _1494;
            int _1558 = _1556;
            int _1560 = _1556;
            if (!_1546)
            {
                bool _1562 = _1538 >= 0.800000011920928955078125;
                bool _1564 = isnan(_1538);
                bool _1566 = _1562 || _1564;
                bool _1568 = isnan(0.800000011920928955078125);
                bool _1570 = _1566 || _1568;
                bool _1572 = _1540 != 0.0;
                bool _1574 = isnan(_1540);
                bool _1576 = _1572 || _1574;
                bool _1578 = isnan(0.0);
                bool _1580 = _1576 || _1578;
                bool _1582 = !_1570;
                bool _1584 = _1580 || _1582;
                if (_1584)
                {
                    _1558 = 1;
                }
                int _1586 = _1558;
                _1560 = _1586;
                if (!_1584)
                {
                    float2 _7174 = float2(_1542, _137);
                    float2 _1588 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7174, float2(0.0), isnan(_7174))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7174, float2(0.0), isnan(_7174))).xy;
                    float _1590 = _1588.x;
                    float _1592 = _1588.y;
                    float _1594 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1542);
                    _1560 = _1536;
                    _1548 = _1592;
                    _1550 = _1590;
                    _1552 = _1594;
                }
            }
            int _1596 = _1560;
            float _1598 = _1548;
            float _1600 = _1550;
            float _1602 = _1552;
            int _1604 = _1596 & 1;
            bool _1606 = _1604 != 0;
            float _1608 = _1598;
            float _1610 = _1600;
            float _1612 = _1602;
            int _1614 = _1596;
            if (_1606)
            {
                _1554 = _1596;
            }
            int _1616 = _1554;
            int _1618 = _1616;
            int _1620 = _1616;
            if (!_1606)
            {
                bool _1622 = _1598 >= 0.800000011920928955078125;
                bool _1624 = isnan(_1598);
                bool _1626 = _1622 || _1624;
                bool _1628 = isnan(0.800000011920928955078125);
                bool _1630 = _1626 || _1628;
                bool _1632 = _1600 != 0.0;
                bool _1634 = isnan(_1600);
                bool _1636 = _1632 || _1634;
                bool _1638 = isnan(0.0);
                bool _1640 = _1636 || _1638;
                bool _1642 = !_1630;
                bool _1644 = _1640 || _1642;
                if (_1644)
                {
                    _1618 = 1;
                }
                int _1646 = _1618;
                _1620 = _1646;
                if (!_1644)
                {
                    float2 _7253 = float2(_1602, _137);
                    float2 _1648 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7253, float2(0.0), isnan(_7253))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7253, float2(0.0), isnan(_7253))).xy;
                    float _1650 = _1648.x;
                    float _1652 = _1648.y;
                    float _1654 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1602);
                    _1620 = _1596;
                    _1608 = _1652;
                    _1610 = _1650;
                    _1612 = _1654;
                }
            }
            int _1656 = _1620;
            float _1658 = _1608;
            float _1660 = _1610;
            float _1662 = _1612;
            int _1664 = _1656 & 1;
            bool _1666 = _1664 != 0;
            float _1668 = _1658;
            float _1670 = _1660;
            float _1672 = _1662;
            int _1674 = _1656;
            if (_1666)
            {
                _1614 = _1656;
            }
            int _1676 = _1614;
            int _1678 = _1676;
            int _1680 = _1676;
            if (!_1666)
            {
                bool _1682 = _1658 >= 0.800000011920928955078125;
                bool _1684 = isnan(_1658);
                bool _1686 = _1682 || _1684;
                bool _1688 = isnan(0.800000011920928955078125);
                bool _1690 = _1686 || _1688;
                bool _1692 = _1660 != 0.0;
                bool _1694 = isnan(_1660);
                bool _1696 = _1692 || _1694;
                bool _1698 = isnan(0.0);
                bool _1700 = _1696 || _1698;
                bool _1702 = !_1690;
                bool _1704 = _1700 || _1702;
                if (_1704)
                {
                    _1678 = 1;
                }
                int _1706 = _1678;
                _1680 = _1706;
                if (!_1704)
                {
                    float2 _7332 = float2(_1662, _137);
                    float2 _1708 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7332, float2(0.0), isnan(_7332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7332, float2(0.0), isnan(_7332))).xy;
                    float _1710 = _1708.x;
                    float _1712 = _1708.y;
                    float _1714 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1662);
                    _1680 = _1656;
                    _1668 = _1712;
                    _1670 = _1710;
                    _1672 = _1714;
                }
            }
            int _1716 = _1680;
            float _1718 = _1668;
            float _1720 = _1670;
            float _1722 = _1672;
            int _1724 = _1716 & 1;
            bool _1726 = _1724 != 0;
            float _1728 = _1718;
            float _1730 = _1720;
            float _1732 = _1722;
            int _1734 = _1716;
            if (_1726)
            {
                _1674 = _1716;
            }
            int _1736 = _1674;
            int _1738 = _1736;
            int _1740 = _1736;
            if (!_1726)
            {
                bool _1742 = _1718 >= 0.800000011920928955078125;
                bool _1744 = isnan(_1718);
                bool _1746 = _1742 || _1744;
                bool _1748 = isnan(0.800000011920928955078125);
                bool _1750 = _1746 || _1748;
                bool _1752 = _1720 != 0.0;
                bool _1754 = isnan(_1720);
                bool _1756 = _1752 || _1754;
                bool _1758 = isnan(0.0);
                bool _1760 = _1756 || _1758;
                bool _1762 = !_1750;
                bool _1764 = _1760 || _1762;
                if (_1764)
                {
                    _1738 = 1;
                }
                int _1766 = _1738;
                _1740 = _1766;
                if (!_1764)
                {
                    float2 _7411 = float2(_1722, _137);
                    float2 _1768 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7411, float2(0.0), isnan(_7411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7411, float2(0.0), isnan(_7411))).xy;
                    float _1770 = _1768.x;
                    float _1772 = _1768.y;
                    float _1774 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1722);
                    _1740 = _1716;
                    _1728 = _1772;
                    _1730 = _1770;
                    _1732 = _1774;
                }
            }
            int _1776 = _1740;
            float _1778 = _1728;
            float _1780 = _1730;
            float _1782 = _1732;
            int _1784 = _1776 & 1;
            bool _1786 = _1784 != 0;
            float _1788 = _1778;
            float _1790 = _1780;
            float _1792 = _1782;
            int _1794 = _1776;
            if (_1786)
            {
                _1734 = _1776;
            }
            int _1796 = _1734;
            int _1798 = _1796;
            int _1800 = _1796;
            if (!_1786)
            {
                bool _1802 = _1778 >= 0.800000011920928955078125;
                bool _1804 = isnan(_1778);
                bool _1806 = _1802 || _1804;
                bool _1808 = isnan(0.800000011920928955078125);
                bool _1810 = _1806 || _1808;
                bool _1812 = _1780 != 0.0;
                bool _1814 = isnan(_1780);
                bool _1816 = _1812 || _1814;
                bool _1818 = isnan(0.0);
                bool _1820 = _1816 || _1818;
                bool _1822 = !_1810;
                bool _1824 = _1820 || _1822;
                if (_1824)
                {
                    _1798 = 1;
                }
                int _1826 = _1798;
                _1800 = _1826;
                if (!_1824)
                {
                    float2 _7490 = float2(_1782, _137);
                    float2 _1828 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7490, float2(0.0), isnan(_7490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7490, float2(0.0), isnan(_7490))).xy;
                    float _1830 = _1828.x;
                    float _1832 = _1828.y;
                    float _1834 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1782);
                    _1800 = _1776;
                    _1788 = _1832;
                    _1790 = _1830;
                    _1792 = _1834;
                }
            }
            int _1836 = _1800;
            float _1838 = _1788;
            float _1840 = _1790;
            float _1842 = _1792;
            int _1844 = _1836 & 1;
            bool _1846 = _1844 != 0;
            float _1848 = _1838;
            float _1850 = _1840;
            float _1852 = _1842;
            int _1854 = _1836;
            if (_1846)
            {
                _1794 = _1836;
            }
            int _1856 = _1794;
            int _1858 = _1856;
            int _1860 = _1856;
            if (!_1846)
            {
                bool _1862 = _1838 >= 0.800000011920928955078125;
                bool _1864 = isnan(_1838);
                bool _1866 = _1862 || _1864;
                bool _1868 = isnan(0.800000011920928955078125);
                bool _1870 = _1866 || _1868;
                bool _1872 = _1840 != 0.0;
                bool _1874 = isnan(_1840);
                bool _1876 = _1872 || _1874;
                bool _1878 = isnan(0.0);
                bool _1880 = _1876 || _1878;
                bool _1882 = !_1870;
                bool _1884 = _1880 || _1882;
                if (_1884)
                {
                    _1858 = 1;
                }
                int _1886 = _1858;
                _1860 = _1886;
                if (!_1884)
                {
                    float2 _7569 = float2(_1842, _137);
                    float2 _1888 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7569, float2(0.0), isnan(_7569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7569, float2(0.0), isnan(_7569))).xy;
                    float _1890 = _1888.x;
                    float _1892 = _1888.y;
                    float _1894 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1842);
                    _1860 = _1836;
                    _1848 = _1892;
                    _1850 = _1890;
                    _1852 = _1894;
                }
            }
            int _1896 = _1860;
            float _1898 = _1848;
            float _1900 = _1850;
            float _1902 = _1852;
            int _1904 = _1896 & 1;
            bool _1906 = _1904 != 0;
            float _1908 = _1898;
            float _1910 = _1900;
            float _1912 = _1902;
            int _1914 = _1896;
            if (_1906)
            {
                _1854 = _1896;
            }
            int _1916 = _1854;
            int _1918 = _1916;
            int _1920 = _1916;
            if (!_1906)
            {
                bool _1922 = _1898 >= 0.800000011920928955078125;
                bool _1924 = isnan(_1898);
                bool _1926 = _1922 || _1924;
                bool _1928 = isnan(0.800000011920928955078125);
                bool _1930 = _1926 || _1928;
                bool _1932 = _1900 != 0.0;
                bool _1934 = isnan(_1900);
                bool _1936 = _1932 || _1934;
                bool _1938 = isnan(0.0);
                bool _1940 = _1936 || _1938;
                bool _1942 = !_1930;
                bool _1944 = _1940 || _1942;
                if (_1944)
                {
                    _1918 = 1;
                }
                int _1946 = _1918;
                _1920 = _1946;
                if (!_1944)
                {
                    float2 _7648 = float2(_1902, _137);
                    float2 _1948 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7648, float2(0.0), isnan(_7648))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7648, float2(0.0), isnan(_7648))).xy;
                    float _1950 = _1948.x;
                    float _1952 = _1948.y;
                    float _1954 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1902);
                    _1920 = _1896;
                    _1908 = _1952;
                    _1910 = _1950;
                    _1912 = _1954;
                }
            }
            int _1956 = _1920;
            float _1958 = _1908;
            float _1960 = _1910;
            float _1962 = _1912;
            int _1964 = _1956 & 1;
            bool _1966 = _1964 != 0;
            float _1968 = _1962;
            float _1970 = _1958;
            float _1972 = _1960;
            float _1974 = as_type<float>(_1956);
            if (_1192)
            {
                _1314 = 1;
            }
            int _1976 = _1314;
            int _1978 = _1976;
            if (!_1192)
            {
                _1978 = 0;
            }
            int _1980 = _1978;
            int _1982 = _1980 & 1;
            bool _1984 = _1982 != 0;
            if (_1966)
            {
                _1914 = _1956;
            }
            int _1986 = _1914;
            int _1988 = _1986;
            int _1990 = _1986;
            if (!_1966)
            {
                bool _1992 = _1958 >= 0.800000011920928955078125;
                bool _1994 = isnan(_1958);
                bool _1996 = _1992 || _1994;
                bool _1998 = isnan(0.800000011920928955078125);
                bool _2000 = _1996 || _1998;
                bool _2002 = _1960 != 0.0;
                bool _2004 = isnan(_1960);
                bool _2006 = _2002 || _2004;
                bool _2008 = isnan(0.0);
                bool _2010 = _2006 || _2008;
                bool _2012 = !_2000;
                bool _2014 = _2010 || _2012;
                if (_2014)
                {
                    _1988 = 1;
                }
                int _2016 = _1988;
                _1990 = _2016;
                if (!_2014)
                {
                    float2 _7742 = float2(_1962, _137);
                    float2 _2018 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7742, float2(0.0), isnan(_7742))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7742, float2(0.0), isnan(_7742))).xy;
                    float _2020 = _2018.x;
                    float _2022 = _2018.y;
                    float _2024 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1962);
                    _1990 = _1956;
                    _1968 = _2024;
                    _1970 = _2022;
                    _1972 = _2020;
                }
            }
            int _2026 = _1990;
            float _2028 = _1968;
            float _2030 = _1970;
            float _2032 = _1972;
            int _2034 = _2026 & 1;
            bool _2036 = _2034 != 0;
            float _2038 = _2032;
            float _2040 = _2030;
            int _2042 = as_type<int>(_2028);
            if (_1192)
            {
                _1974 = _1144;
            }
            float _2044 = _1974;
            float _2046 = _2044;
            if (!_1192)
            {
                float _2048 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _1144);
                _2046 = _2048;
            }
            float _2050 = _2046;
            float _2052 = _2050;
            if (_2036)
            {
                _1200 = _2028;
            }
            float _2054 = _1200;
            float _2056 = _2054;
            float _2058 = _2054;
            if (!_2036)
            {
                bool _2060 = _2030 >= 0.800000011920928955078125;
                bool _2062 = isnan(_2030);
                bool _2064 = _2060 || _2062;
                bool _2066 = isnan(0.800000011920928955078125);
                bool _2068 = _2064 || _2066;
                bool _2070 = _2032 != 0.0;
                bool _2072 = isnan(_2032);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan(0.0);
                bool _2078 = _2074 || _2076;
                bool _2080 = !_2068;
                bool _2082 = _2078 || _2080;
                if (_2082)
                {
                    _2056 = _2028;
                }
                float _2084 = _2056;
                _2058 = _2084;
                if (!_2082)
                {
                    float2 _7839 = float2(_2028, _137);
                    float2 _2086 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7839, float2(0.0), isnan(_7839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7839, float2(0.0), isnan(_7839))).xy;
                    float _2088 = _2086.x;
                    float _2090 = _2086.y;
                    float _2092 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2028);
                    _2038 = _2088;
                    _2040 = _2090;
                    _2058 = _2092;
                }
            }
            float _2094 = _2038;
            float _2096 = _2040;
            float _2098 = _2058;
            if (_1984)
            {
                _2042 = _1980;
            }
            int _2100 = _2042;
            int _2102 = _2100;
            int _2104 = _2100;
            if (!_1984)
            {
                bool _2106 = _1224 > 0.800000011920928955078125;
                bool _2108 = isnan(_1224);
                bool _2110 = _2106 || _2108;
                bool _2112 = isnan(0.800000011920928955078125);
                bool _2114 = _2110 || _2112;
                bool _2116 = _1222 != 0.0;
                bool _2118 = isnan(_1222);
                bool _2120 = _2116 || _2118;
                bool _2122 = isnan(0.0);
                bool _2124 = _2120 || _2122;
                bool _2126 = !_2114;
                bool _2128 = _2124 || _2126;
                if (_2128)
                {
                    _2102 = 1;
                }
                int _2130 = _2102;
                _2104 = _2130;
                if (!_2128)
                {
                    float2 _7908 = float2(_2050, _141);
                    float2 _2132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7908, float2(0.0), isnan(_7908))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7908, float2(0.0), isnan(_7908))).xy;
                    float _2134 = _2132.x;
                    float _2136 = _2132.y;
                    float _2138 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2050);
                    _2104 = _1980;
                    _1258 = _2136;
                    _1260 = _2134;
                    _2052 = _2138;
                }
            }
            int _2140 = _2104;
            float _2142 = _1258;
            float _2144 = _1260;
            float _2146 = _2052;
            int _2148 = _2140 & 1;
            bool _2150 = _2148 != 0;
            float _2152 = _2142;
            float _2154 = _2144;
            float _2156 = _2146;
            int _2158 = _2140;
            if (_2150)
            {
                _180 = _2140;
            }
            int _2160 = _180;
            int _2162 = _2160;
            int _2164 = _2160;
            if (!_2150)
            {
                bool _2166 = _2142 > 0.800000011920928955078125;
                bool _2168 = isnan(_2142);
                bool _2170 = _2166 || _2168;
                bool _2172 = isnan(0.800000011920928955078125);
                bool _2174 = _2170 || _2172;
                bool _2176 = _2144 != 0.0;
                bool _2178 = isnan(_2144);
                bool _2180 = _2176 || _2178;
                bool _2182 = isnan(0.0);
                bool _2184 = _2180 || _2182;
                bool _2186 = !_2174;
                bool _2188 = _2184 || _2186;
                if (_2188)
                {
                    _2162 = 1;
                }
                int _2190 = _2162;
                _2164 = _2190;
                if (!_2188)
                {
                    float2 _7987 = float2(_2146, _141);
                    float2 _2192 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7987, float2(0.0), isnan(_7987))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7987, float2(0.0), isnan(_7987))).xy;
                    float _2194 = _2192.x;
                    float _2196 = _2192.y;
                    float _2198 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2146);
                    _2164 = _2140;
                    _2152 = _2196;
                    _2154 = _2194;
                    _2156 = _2198;
                }
            }
            int _2200 = _2164;
            float _2202 = _2152;
            float _2204 = _2154;
            float _2206 = _2156;
            int _2208 = _2200 & 1;
            bool _2210 = _2208 != 0;
            float _2212 = _2202;
            float _2214 = _2204;
            float _2216 = _2206;
            int _2218 = _2200;
            if (_2210)
            {
                _2158 = _2200;
            }
            int _2220 = _2158;
            int _2222 = _2220;
            int _2224 = _2220;
            if (!_2210)
            {
                bool _2226 = _2202 > 0.800000011920928955078125;
                bool _2228 = isnan(_2202);
                bool _2230 = _2226 || _2228;
                bool _2232 = isnan(0.800000011920928955078125);
                bool _2234 = _2230 || _2232;
                bool _2236 = _2204 != 0.0;
                bool _2238 = isnan(_2204);
                bool _2240 = _2236 || _2238;
                bool _2242 = isnan(0.0);
                bool _2244 = _2240 || _2242;
                bool _2246 = !_2234;
                bool _2248 = _2244 || _2246;
                if (_2248)
                {
                    _2222 = 1;
                }
                int _2250 = _2222;
                _2224 = _2250;
                if (!_2248)
                {
                    float2 _8066 = float2(_2206, _141);
                    float2 _2252 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8066, float2(0.0), isnan(_8066))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8066, float2(0.0), isnan(_8066))).xy;
                    float _2254 = _2252.x;
                    float _2256 = _2252.y;
                    float _2258 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2206);
                    _2224 = _2200;
                    _2212 = _2256;
                    _2214 = _2254;
                    _2216 = _2258;
                }
            }
            int _2260 = _2224;
            float _2262 = _2212;
            float _2264 = _2214;
            float _2266 = _2216;
            int _2268 = _2260 & 1;
            bool _2270 = _2268 != 0;
            float _2272 = _2262;
            float _2274 = _2264;
            float _2276 = _2266;
            int _2278 = _2260;
            if (_2270)
            {
                _2218 = _2260;
            }
            int _2280 = _2218;
            int _2282 = _2280;
            int _2284 = _2280;
            if (!_2270)
            {
                bool _2286 = _2262 > 0.800000011920928955078125;
                bool _2288 = isnan(_2262);
                bool _2290 = _2286 || _2288;
                bool _2292 = isnan(0.800000011920928955078125);
                bool _2294 = _2290 || _2292;
                bool _2296 = _2264 != 0.0;
                bool _2298 = isnan(_2264);
                bool _2300 = _2296 || _2298;
                bool _2302 = isnan(0.0);
                bool _2304 = _2300 || _2302;
                bool _2306 = !_2294;
                bool _2308 = _2304 || _2306;
                if (_2308)
                {
                    _2282 = 1;
                }
                int _2310 = _2282;
                _2284 = _2310;
                if (!_2308)
                {
                    float2 _8145 = float2(_2266, _141);
                    float2 _2312 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8145, float2(0.0), isnan(_8145))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8145, float2(0.0), isnan(_8145))).xy;
                    float _2314 = _2312.x;
                    float _2316 = _2312.y;
                    float _2318 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2266);
                    _2284 = _2260;
                    _2272 = _2316;
                    _2274 = _2314;
                    _2276 = _2318;
                }
            }
            int _2320 = _2284;
            float _2322 = _2272;
            float _2324 = _2274;
            float _2326 = _2276;
            int _2328 = _2320 & 1;
            bool _2330 = _2328 != 0;
            float _2332 = _2322;
            float _2334 = _2324;
            float _2336 = _2326;
            int _2338 = _2320;
            if (_2330)
            {
                _2278 = _2320;
            }
            int _2340 = _2278;
            int _2342 = _2340;
            int _2344 = _2340;
            if (!_2330)
            {
                bool _2346 = _2322 > 0.800000011920928955078125;
                bool _2348 = isnan(_2322);
                bool _2350 = _2346 || _2348;
                bool _2352 = isnan(0.800000011920928955078125);
                bool _2354 = _2350 || _2352;
                bool _2356 = _2324 != 0.0;
                bool _2358 = isnan(_2324);
                bool _2360 = _2356 || _2358;
                bool _2362 = isnan(0.0);
                bool _2364 = _2360 || _2362;
                bool _2366 = !_2354;
                bool _2368 = _2364 || _2366;
                if (_2368)
                {
                    _2342 = 1;
                }
                int _2370 = _2342;
                _2344 = _2370;
                if (!_2368)
                {
                    float2 _8224 = float2(_2326, _141);
                    float2 _2372 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8224, float2(0.0), isnan(_8224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8224, float2(0.0), isnan(_8224))).xy;
                    float _2374 = _2372.x;
                    float _2376 = _2372.y;
                    float _2378 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2326);
                    _2344 = _2320;
                    _2332 = _2376;
                    _2334 = _2374;
                    _2336 = _2378;
                }
            }
            int _2380 = _2344;
            float _2382 = _2332;
            float _2384 = _2334;
            float _2386 = _2336;
            int _2388 = _2380 & 1;
            bool _2390 = _2388 != 0;
            float _2392 = _2382;
            float _2394 = _2384;
            float _2396 = _2386;
            int _2398 = _2380;
            if (_2390)
            {
                _2338 = _2380;
            }
            int _2400 = _2338;
            int _2402 = _2400;
            int _2404 = _2400;
            if (!_2390)
            {
                bool _2406 = _2382 > 0.800000011920928955078125;
                bool _2408 = isnan(_2382);
                bool _2410 = _2406 || _2408;
                bool _2412 = isnan(0.800000011920928955078125);
                bool _2414 = _2410 || _2412;
                bool _2416 = _2384 != 0.0;
                bool _2418 = isnan(_2384);
                bool _2420 = _2416 || _2418;
                bool _2422 = isnan(0.0);
                bool _2424 = _2420 || _2422;
                bool _2426 = !_2414;
                bool _2428 = _2424 || _2426;
                if (_2428)
                {
                    _2402 = 1;
                }
                int _2430 = _2402;
                _2404 = _2430;
                if (!_2428)
                {
                    float2 _8303 = float2(_2386, _141);
                    float2 _2432 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8303, float2(0.0), isnan(_8303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8303, float2(0.0), isnan(_8303))).xy;
                    float _2434 = _2432.x;
                    float _2436 = _2432.y;
                    float _2438 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2386);
                    _2404 = _2380;
                    _2392 = _2436;
                    _2394 = _2434;
                    _2396 = _2438;
                }
            }
            int _2440 = _2404;
            float _2442 = _2392;
            float _2444 = _2394;
            float _2446 = _2396;
            int _2448 = _2440 & 1;
            bool _2450 = _2448 != 0;
            float _2452 = _2442;
            float _2454 = _2444;
            float _2456 = _2446;
            int _2458 = _2440;
            if (_2450)
            {
                _2398 = _2440;
            }
            int _2460 = _2398;
            int _2462 = _2460;
            int _2464 = _2460;
            if (!_2450)
            {
                bool _2466 = _2442 > 0.800000011920928955078125;
                bool _2468 = isnan(_2442);
                bool _2470 = _2466 || _2468;
                bool _2472 = isnan(0.800000011920928955078125);
                bool _2474 = _2470 || _2472;
                bool _2476 = _2444 != 0.0;
                bool _2478 = isnan(_2444);
                bool _2480 = _2476 || _2478;
                bool _2482 = isnan(0.0);
                bool _2484 = _2480 || _2482;
                bool _2486 = !_2474;
                bool _2488 = _2484 || _2486;
                if (_2488)
                {
                    _2462 = 1;
                }
                int _2490 = _2462;
                _2464 = _2490;
                if (!_2488)
                {
                    float2 _8382 = float2(_2446, _141);
                    float2 _2492 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8382, float2(0.0), isnan(_8382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8382, float2(0.0), isnan(_8382))).xy;
                    float _2494 = _2492.x;
                    float _2496 = _2492.y;
                    float _2498 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2446);
                    _2464 = _2440;
                    _2452 = _2496;
                    _2454 = _2494;
                    _2456 = _2498;
                }
            }
            int _2500 = _2464;
            float _2502 = _2452;
            float _2504 = _2454;
            float _2506 = _2456;
            int _2508 = _2500 & 1;
            bool _2510 = _2508 != 0;
            float _2512 = _2502;
            float _2514 = _2504;
            float _2516 = _2506;
            int _2518 = _2500;
            if (_2510)
            {
                _2458 = _2500;
            }
            int _2520 = _2458;
            int _2522 = _2520;
            int _2524 = _2520;
            if (!_2510)
            {
                bool _2526 = _2502 > 0.800000011920928955078125;
                bool _2528 = isnan(_2502);
                bool _2530 = _2526 || _2528;
                bool _2532 = isnan(0.800000011920928955078125);
                bool _2534 = _2530 || _2532;
                bool _2536 = _2504 != 0.0;
                bool _2538 = isnan(_2504);
                bool _2540 = _2536 || _2538;
                bool _2542 = isnan(0.0);
                bool _2544 = _2540 || _2542;
                bool _2546 = !_2534;
                bool _2548 = _2544 || _2546;
                if (_2548)
                {
                    _2522 = 1;
                }
                int _2550 = _2522;
                _2524 = _2550;
                if (!_2548)
                {
                    float2 _8461 = float2(_2506, _141);
                    float2 _2552 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8461, float2(0.0), isnan(_8461))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8461, float2(0.0), isnan(_8461))).xy;
                    float _2554 = _2552.x;
                    float _2556 = _2552.y;
                    float _2558 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2506);
                    _2524 = _2500;
                    _2512 = _2556;
                    _2514 = _2554;
                    _2516 = _2558;
                }
            }
            int _2560 = _2524;
            float _2562 = _2512;
            float _2564 = _2514;
            float _2566 = _2516;
            int _2568 = _2560 & 1;
            bool _2570 = _2568 != 0;
            float _2572 = _2562;
            float _2574 = _2564;
            float _2576 = _2566;
            int _2578 = _2560;
            if (_2570)
            {
                _2518 = _2560;
            }
            int _2580 = _2518;
            int _2582 = _2580;
            int _2584 = _2580;
            if (!_2570)
            {
                bool _2586 = _2562 > 0.800000011920928955078125;
                bool _2588 = isnan(_2562);
                bool _2590 = _2586 || _2588;
                bool _2592 = isnan(0.800000011920928955078125);
                bool _2594 = _2590 || _2592;
                bool _2596 = _2564 != 0.0;
                bool _2598 = isnan(_2564);
                bool _2600 = _2596 || _2598;
                bool _2602 = isnan(0.0);
                bool _2604 = _2600 || _2602;
                bool _2606 = !_2594;
                bool _2608 = _2604 || _2606;
                if (_2608)
                {
                    _2582 = 1;
                }
                int _2610 = _2582;
                _2584 = _2610;
                if (!_2608)
                {
                    float2 _8540 = float2(_2566, _141);
                    float2 _2612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8540, float2(0.0), isnan(_8540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8540, float2(0.0), isnan(_8540))).xy;
                    float _2614 = _2612.x;
                    float _2616 = _2612.y;
                    float _2618 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2566);
                    _2584 = _2560;
                    _2572 = _2616;
                    _2574 = _2614;
                    _2576 = _2618;
                }
            }
            int _2620 = _2584;
            float _2622 = _2572;
            float _2624 = _2574;
            float _2626 = _2576;
            int _2628 = _2620 & 1;
            bool _2630 = _2628 != 0;
            float _2632 = _2622;
            float _2634 = _2624;
            float _2636 = _2626;
            int _2638 = _2620;
            if (_2630)
            {
                _2578 = _2620;
            }
            int _2640 = _2578;
            int _2642 = _2640;
            int _2644 = _2640;
            if (!_2630)
            {
                bool _2646 = _2622 > 0.800000011920928955078125;
                bool _2648 = isnan(_2622);
                bool _2650 = _2646 || _2648;
                bool _2652 = isnan(0.800000011920928955078125);
                bool _2654 = _2650 || _2652;
                bool _2656 = _2624 != 0.0;
                bool _2658 = isnan(_2624);
                bool _2660 = _2656 || _2658;
                bool _2662 = isnan(0.0);
                bool _2664 = _2660 || _2662;
                bool _2666 = !_2654;
                bool _2668 = _2664 || _2666;
                if (_2668)
                {
                    _2642 = 1;
                }
                int _2670 = _2642;
                _2644 = _2670;
                if (!_2668)
                {
                    float2 _8619 = float2(_2626, _141);
                    float2 _2672 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8619, float2(0.0), isnan(_8619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8619, float2(0.0), isnan(_8619))).xy;
                    float _2674 = _2672.x;
                    float _2676 = _2672.y;
                    float _2678 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2626);
                    _2644 = _2620;
                    _2632 = _2676;
                    _2634 = _2674;
                    _2636 = _2678;
                }
            }
            int _2680 = _2644;
            float _2682 = _2632;
            float _2684 = _2634;
            float _2686 = _2636;
            int _2688 = _2680 & 1;
            bool _2690 = _2688 != 0;
            float _2692 = _2682;
            float _2694 = _2684;
            float _2696 = _2686;
            int _2698 = _2680;
            if (_2690)
            {
                _2638 = _2680;
            }
            int _2700 = _2638;
            int _2702 = _2700;
            int _2704 = _2700;
            if (!_2690)
            {
                bool _2706 = _2682 > 0.800000011920928955078125;
                bool _2708 = isnan(_2682);
                bool _2710 = _2706 || _2708;
                bool _2712 = isnan(0.800000011920928955078125);
                bool _2714 = _2710 || _2712;
                bool _2716 = _2684 != 0.0;
                bool _2718 = isnan(_2684);
                bool _2720 = _2716 || _2718;
                bool _2722 = isnan(0.0);
                bool _2724 = _2720 || _2722;
                bool _2726 = !_2714;
                bool _2728 = _2724 || _2726;
                if (_2728)
                {
                    _2702 = 1;
                }
                int _2730 = _2702;
                _2704 = _2730;
                if (!_2728)
                {
                    float2 _8698 = float2(_2686, _141);
                    float2 _2732 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8698, float2(0.0), isnan(_8698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8698, float2(0.0), isnan(_8698))).xy;
                    float _2734 = _2732.x;
                    float _2736 = _2732.y;
                    float _2738 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2686);
                    _2704 = _2680;
                    _2692 = _2736;
                    _2694 = _2734;
                    _2696 = _2738;
                }
            }
            int _2740 = _2704;
            float _2742 = _2692;
            float _2744 = _2694;
            float _2746 = _2696;
            int _2748 = _2740 & 1;
            bool _2750 = _2748 != 0;
            float _2752 = _2742;
            float _2754 = _2744;
            float _2756 = _2746;
            int _2758 = _2740;
            if (_2750)
            {
                _2698 = _2740;
            }
            int _2760 = _2698;
            int _2762 = _2760;
            int _2764 = _2760;
            if (!_2750)
            {
                bool _2766 = _2742 > 0.800000011920928955078125;
                bool _2768 = isnan(_2742);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan(0.800000011920928955078125);
                bool _2774 = _2770 || _2772;
                bool _2776 = _2744 != 0.0;
                bool _2778 = isnan(_2744);
                bool _2780 = _2776 || _2778;
                bool _2782 = isnan(0.0);
                bool _2784 = _2780 || _2782;
                bool _2786 = !_2774;
                bool _2788 = _2784 || _2786;
                if (_2788)
                {
                    _2762 = 1;
                }
                int _2790 = _2762;
                _2764 = _2790;
                if (!_2788)
                {
                    float2 _8777 = float2(_2746, _141);
                    float2 _2792 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8777, float2(0.0), isnan(_8777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8777, float2(0.0), isnan(_8777))).xy;
                    float _2794 = _2792.x;
                    float _2796 = _2792.y;
                    float _2798 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2746);
                    _2764 = _2740;
                    _2752 = _2796;
                    _2754 = _2794;
                    _2756 = _2798;
                }
            }
            int _2800 = _2764;
            float _2802 = _2752;
            float _2804 = _2754;
            float _2806 = _2756;
            int _2808 = _2800 & 1;
            bool _2810 = _2808 != 0;
            float _2812 = _2802;
            float _2814 = _2804;
            float _2816 = _2806;
            if (_2810)
            {
                _2758 = _2800;
            }
            int _2818 = _2758;
            int _2820 = _2818;
            int _2822 = _2818;
            if (!_2810)
            {
                bool _2824 = _2802 > 0.800000011920928955078125;
                bool _2826 = isnan(_2802);
                bool _2828 = _2824 || _2826;
                bool _2830 = isnan(0.800000011920928955078125);
                bool _2832 = _2828 || _2830;
                bool _2834 = _2804 != 0.0;
                bool _2836 = isnan(_2804);
                bool _2838 = _2834 || _2836;
                bool _2840 = isnan(0.0);
                bool _2842 = _2838 || _2840;
                bool _2844 = !_2832;
                bool _2846 = _2842 || _2844;
                if (_2846)
                {
                    _2820 = 1;
                }
                int _2848 = _2820;
                _2822 = _2848;
                if (!_2846)
                {
                    float2 _8855 = float2(_2806, _141);
                    float2 _2850 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8855, float2(0.0), isnan(_8855))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8855, float2(0.0), isnan(_8855))).xy;
                    float _2852 = _2850.x;
                    float _2854 = _2850.y;
                    float _2856 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2806);
                    _2822 = _2800;
                    _2812 = _2854;
                    _2814 = _2852;
                    _2816 = _2856;
                }
            }
            int _2858 = _2822;
            float _2860 = _2812;
            float _2862 = _2814;
            float _2864 = _2816;
            int _2866 = _2858 & 1;
            bool _2868 = _2866 != 0;
            float _2870 = _2862;
            float _2872 = _2860;
            float _2874 = _2864;
            if (!_2868)
            {
                bool _2876 = _2860 > 0.800000011920928955078125;
                bool _2878 = isnan(_2860);
                bool _2880 = _2876 || _2878;
                bool _2882 = isnan(0.800000011920928955078125);
                bool _2884 = _2880 || _2882;
                bool _2886 = _2862 != 0.0;
                bool _2888 = isnan(_2862);
                bool _2890 = _2886 || _2888;
                bool _2892 = isnan(0.0);
                bool _2894 = _2890 || _2892;
                bool _2896 = !_2884;
                bool _2898 = _2894 || _2896;
                if (!_2898)
                {
                    float2 _8921 = float2(_2864, _141);
                    float2 _2900 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8921, float2(0.0), isnan(_8921))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8921, float2(0.0), isnan(_8921))).xy;
                    float _2902 = _2900.x;
                    float _2904 = _2900.y;
                    float _2906 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2864);
                    _2870 = _2902;
                    _2872 = _2904;
                    _2874 = _2906;
                }
            }
            float _2908 = _2870;
            float _2910 = _2872;
            float _2912 = _2874;
            float _2914 = fma(_2908, 0.5, 0.5234375);
            float _2916 = fma(_2094, 0.5, 0.0078125);
            float _2918 = fma(_2910, 2.0, 0.03125);
            float _2920 = fma(_2096, 2.0, 0.03125);
            float2 _8956 = float2(_2914, _2918);
            float _2922 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_8956, float2(0.0), isnan(_8956))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_8956, float2(0.0), isnan(_8956))).x;
            float2 _8964 = float2(_2916, _2920);
            float _2924 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_8964, float2(0.0), isnan(_8964))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_8964, float2(0.0), isnan(_8964))).x;
            float _2926 = fma(_2922, -2.007874011993408203125, 3.25);
            float _2928 = fma(_2924, -2.007874011993408203125, 3.25);
            float _2930 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _2932 = fma(_2926, _2930, _2912);
            float _2934 = fma(_2928, (*spvDescriptorSet0.fp_c3)._m0[0].z, _2098);
            float2 _8990 = float2(_2932, _155);
            float _2936 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8990, float2(0.0), isnan(_8990)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8990, float2(0.0), isnan(_8990)), int2(1, 0)).x;
            float2 _8998 = float2(_2934, _155);
            float _2938 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8998, float2(0.0), isnan(_8998))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8998, float2(0.0), isnan(_8998))).x;
            float _2940 = -_149;
            float _2942 = fma(_2934, (*spvDescriptorSet0.fp_c3)._m0[0].x, _2940);
            float _2944 = -_149;
            float _2946 = fma(_2932, (*spvDescriptorSet0.fp_c3)._m0[0].x, _2944);
            float _2948 = rint(_2946);
            float _2950 = rint(_2942);
            float _2952 = abs(_2948);
            float _2954 = sqrt(_2952);
            float _2956 = abs(_2950);
            float _2958 = sqrt(_2956);
            float _2960 = _2936 * 4.0;
            float _2962 = _2938 * 4.0;
            float _2964 = rint(_2960);
            float _2966 = rint(_2962);
            float _2968 = fma(_2964, 16.0, _2954);
            float _2970 = fma(_2968, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _2972 = fma(_2966, 16.0, _2958);
            float _2974 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _2970);
            float2 _9054 = float2(_2934, _67);
            float _2976 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9054, float2(0.0), isnan(_9054)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9054, float2(0.0), isnan(_9054)), int2(0, 1)).x;
            float2 _9063 = float2(_2934, _67);
            float _2978 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9063, float2(0.0), isnan(_9063)), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9063, float2(0.0), isnan(_9063)), int2(0, -2)).x;
            float _2980 = fma(_2972, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float2 _9075 = float2(_2932, _67);
            float _2982 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9075, float2(0.0), isnan(_9075)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9075, float2(0.0), isnan(_9075)), int2(1)).x;
            float2 _9084 = float2(_2932, _67);
            float _2984 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9084, float2(0.0), isnan(_9084)), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9084, float2(0.0), isnan(_9084)), int2(1, -2)).x;
            float2 _9093 = float2(_2980, _2974);
            float2 _2986 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_9093, float2(0.0), isnan(_9093))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_9093, float2(0.0), isnan(_9093))).xy;
            float _2988 = _2986.x;
            float _2990 = _2986.y;
            float _2992 = abs(_2948);
            float _2994 = abs(_2950);
            bool _2996 = _2992 >= _2994;
            bool _2998 = isnan(_2992);
            bool _3000 = _2996 || _2998;
            bool _3002 = isnan(_2994);
            bool _3004 = _3000 || _3002;
            float _3006 = float(_3004);
            float _3008 = abs(_2950);
            float _3010 = abs(_2948);
            bool _3012 = _3008 >= _3010;
            bool _3014 = isnan(_3008);
            bool _3016 = _3012 || _3014;
            bool _3018 = isnan(_3010);
            bool _3020 = _3016 || _3018;
            float _3022 = float(_3020);
            float _3024 = _3006 + _3022;
            float _3026 = 1.0 / _3024;
            float _3028 = _3026 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
            float _3030 = _3006 * _3028;
            float _3032 = _3022 * _3028;
            float _3034 = -_3030;
            float _3036 = fma(_3034, _2976, 1.0);
            float _3038 = -_3030;
            float _3040 = fma(_3038, _2978, 1.0);
            float _3042 = -_3032;
            float _3044 = fma(_3042, _2982, _3036);
            float _3046 = precise::clamp(_3044, 0.0, 1.0);
            float _3048 = -_3032;
            float _3050 = fma(_3048, _2984, _3040);
            float _3052 = precise::clamp(_3050, 0.0, 1.0);
            float _3054 = _2988 * _3046;
            float _3056 = _2990 * _3052;
            _210 = _166;
            _182 = _2982;
            _212 = _67;
            _184 = _3052;
            _186 = as_type<int>(_3046);
            _188 = _3032;
            _202 = as_type<int>(_3054);
            _204 = as_type<int>(_3056);
        }
    }
    int _3058 = _210;
    float _3060 = _182;
    float _3062 = _212;
    float _3064 = _184;
    int _3066 = _186;
    float _3068 = _188;
    int _3070 = _202;
    int _3072 = _204;
    int _3074 = _3058 & 1;
    bool _3076 = _3074 != 0;
    bool _3078 = !_3076;
    float _3080 = _3060;
    float _3082 = _3062;
    float _3084 = _3064;
    int _3086 = _3066;
    float _3088 = _3068;
    if (!_3078)
    {
        float2 _9225 = float2(_143, _155);
        float2 _3090 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9225, float2(0.0), isnan(_9225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9225, float2(0.0), isnan(_9225))).xy;
        float _3092 = _3090.x;
        float _3094 = _3090.y;
        float2 _9237 = float2(_145, _147);
        float2 _3096 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9237, float2(0.0), isnan(_9237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9237, float2(0.0), isnan(_9237))).xy;
        float _3098 = _3096.x;
        float _3100 = _3096.y;
        float _3102 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _155);
        bool _3104 = _3092 > 0.800000011920928955078125;
        bool _3106 = isnan(_3092);
        bool _3108 = _3104 || _3106;
        bool _3110 = isnan(0.800000011920928955078125);
        bool _3112 = _3108 || _3110;
        bool _3114 = _3098 > 0.800000011920928955078125;
        bool _3116 = isnan(_3098);
        bool _3118 = _3114 || _3116;
        bool _3120 = isnan(0.800000011920928955078125);
        bool _3122 = _3118 || _3120;
        bool _3124 = _3094 != 0.0;
        bool _3126 = isnan(_3094);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan(0.0);
        bool _3132 = _3128 || _3130;
        bool _3134 = !_3112;
        bool _3136 = _3132 || _3134;
        bool _3138 = _3100 != 0.0;
        bool _3140 = isnan(_3100);
        bool _3142 = _3138 || _3140;
        bool _3144 = isnan(0.0);
        bool _3146 = _3142 || _3144;
        bool _3148 = !_3122;
        bool _3150 = _3146 || _3148;
        int _3152 = as_type<int>(_3094);
        float _3154 = _3102;
        if (_3136)
        {
            _3080 = _3092;
        }
        float _3156 = _3080;
        if (_3136)
        {
            _3082 = _3094;
        }
        float _3158 = _3082;
        if (_3150)
        {
            _3084 = _3098;
        }
        float _3160 = _3084;
        float _3162 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
        float _3164 = _3162;
        if (_3150)
        {
            _190 = _3100;
        }
        float _3166 = _190;
        float _3168 = _3156;
        float _3170 = _3158;
        if (!_3136)
        {
            float2 _9340 = float2(_143, _3102);
            float2 _3172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9340, float2(0.0), isnan(_9340))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9340, float2(0.0), isnan(_9340))).xy;
            float _3174 = _3172.x;
            float _3176 = _3172.y;
            _3168 = _3174;
            _3170 = _3176;
        }
        float _3178 = _3168;
        float _3180 = _3170;
        float _3182 = _3160;
        float _3184 = _3166;
        if (!_3150)
        {
            float2 _9362 = float2(_145, _3162);
            float2 _3186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9362, float2(0.0), isnan(_9362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9362, float2(0.0), isnan(_9362))).xy;
            float _3188 = _3186.x;
            float _3190 = _3186.y;
            _3182 = _3188;
            _3184 = _3190;
        }
        float _3192 = _3182;
        float _3194 = _3184;
        if (_3136)
        {
            _3086 = 1;
        }
        int _3196 = _3086;
        int _3198 = _3196;
        if (!_3136)
        {
            _3198 = 0;
        }
        int _3200 = _3198;
        int _3202 = _3200;
        if (_3136)
        {
            _192 = _3102;
        }
        float _3204 = _192;
        float _3206 = _3204;
        if (!_3136)
        {
            float _3208 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3102);
            _3206 = _3208;
        }
        float _3210 = _3206;
        int _3212 = _3200 & 1;
        bool _3214 = _3212 != 0;
        float _3216 = _3210;
        if (_3214)
        {
            _194 = _3200;
        }
        int _3218 = _194;
        int _3220 = _3218;
        int _3222 = _3218;
        float _3224 = _3178;
        float _3226 = _3180;
        float _3228 = _3192;
        float _3230 = _3194;
        if (!_3214)
        {
            bool _3232 = _3178 > 0.800000011920928955078125;
            bool _3234 = isnan(_3178);
            bool _3236 = _3232 || _3234;
            bool _3238 = isnan(0.800000011920928955078125);
            bool _3240 = _3236 || _3238;
            bool _3242 = _3180 != 0.0;
            bool _3244 = isnan(_3180);
            bool _3246 = _3242 || _3244;
            bool _3248 = isnan(0.0);
            bool _3250 = _3246 || _3248;
            bool _3252 = !_3240;
            bool _3254 = _3250 || _3252;
            if (_3254)
            {
                _3220 = 1;
            }
            int _3256 = _3220;
            _3222 = _3256;
            if (!_3254)
            {
                float2 _9460 = float2(_143, _3210);
                float2 _3258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9460, float2(0.0), isnan(_9460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9460, float2(0.0), isnan(_9460))).xy;
                float _3260 = _3258.x;
                float _3262 = _3258.y;
                float _3264 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3210);
                _3222 = _3200;
                _3224 = _3260;
                _3226 = _3262;
                _3216 = _3264;
            }
        }
        int _3266 = _3222;
        float _3268 = _3224;
        float _3270 = _3226;
        float _3272 = _3216;
        int _3274 = _3266 & 1;
        bool _3276 = _3274 != 0;
        float _3278 = _3268;
        float _3280 = _3270;
        float _3282 = _3272;
        int _3284 = _3266;
        if (_3276)
        {
            _3202 = _3266;
        }
        int _3286 = _3202;
        int _3288 = _3286;
        int _3290 = _3286;
        if (!_3276)
        {
            bool _3292 = _3268 > 0.800000011920928955078125;
            bool _3294 = isnan(_3268);
            bool _3296 = _3292 || _3294;
            bool _3298 = isnan(0.800000011920928955078125);
            bool _3300 = _3296 || _3298;
            bool _3302 = _3270 != 0.0;
            bool _3304 = isnan(_3270);
            bool _3306 = _3302 || _3304;
            bool _3308 = isnan(0.0);
            bool _3310 = _3306 || _3308;
            bool _3312 = !_3300;
            bool _3314 = _3310 || _3312;
            if (_3314)
            {
                _3288 = 1;
            }
            int _3316 = _3288;
            _3290 = _3316;
            if (!_3314)
            {
                float2 _9539 = float2(_143, _3272);
                float2 _3318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9539, float2(0.0), isnan(_9539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9539, float2(0.0), isnan(_9539))).xy;
                float _3320 = _3318.x;
                float _3322 = _3318.y;
                float _3324 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3272);
                _3290 = _3266;
                _3278 = _3320;
                _3280 = _3322;
                _3282 = _3324;
            }
        }
        int _3326 = _3290;
        float _3328 = _3278;
        float _3330 = _3280;
        float _3332 = _3282;
        int _3334 = _3326 & 1;
        bool _3336 = _3334 != 0;
        float _3338 = _3328;
        float _3340 = _3330;
        float _3342 = _3332;
        int _3344 = _3326;
        if (_3336)
        {
            _3284 = _3326;
        }
        int _3346 = _3284;
        int _3348 = _3346;
        int _3350 = _3346;
        if (!_3336)
        {
            bool _3352 = _3328 > 0.800000011920928955078125;
            bool _3354 = isnan(_3328);
            bool _3356 = _3352 || _3354;
            bool _3358 = isnan(0.800000011920928955078125);
            bool _3360 = _3356 || _3358;
            bool _3362 = _3330 != 0.0;
            bool _3364 = isnan(_3330);
            bool _3366 = _3362 || _3364;
            bool _3368 = isnan(0.0);
            bool _3370 = _3366 || _3368;
            bool _3372 = !_3360;
            bool _3374 = _3370 || _3372;
            if (_3374)
            {
                _3348 = 1;
            }
            int _3376 = _3348;
            _3350 = _3376;
            if (!_3374)
            {
                float2 _9618 = float2(_143, _3332);
                float2 _3378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9618, float2(0.0), isnan(_9618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9618, float2(0.0), isnan(_9618))).xy;
                float _3380 = _3378.x;
                float _3382 = _3378.y;
                float _3384 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3332);
                _3350 = _3326;
                _3338 = _3380;
                _3340 = _3382;
                _3342 = _3384;
            }
        }
        int _3386 = _3350;
        float _3388 = _3338;
        float _3390 = _3340;
        float _3392 = _3342;
        int _3394 = _3386 & 1;
        bool _3396 = _3394 != 0;
        float _3398 = _3388;
        float _3400 = _3390;
        float _3402 = _3392;
        int _3404 = _3386;
        if (_3396)
        {
            _3344 = _3386;
        }
        int _3406 = _3344;
        int _3408 = _3406;
        int _3410 = _3406;
        if (!_3396)
        {
            bool _3412 = _3388 > 0.800000011920928955078125;
            bool _3414 = isnan(_3388);
            bool _3416 = _3412 || _3414;
            bool _3418 = isnan(0.800000011920928955078125);
            bool _3420 = _3416 || _3418;
            bool _3422 = _3390 != 0.0;
            bool _3424 = isnan(_3390);
            bool _3426 = _3422 || _3424;
            bool _3428 = isnan(0.0);
            bool _3430 = _3426 || _3428;
            bool _3432 = !_3420;
            bool _3434 = _3430 || _3432;
            if (_3434)
            {
                _3408 = 1;
            }
            int _3436 = _3408;
            _3410 = _3436;
            if (!_3434)
            {
                float2 _9697 = float2(_143, _3392);
                float2 _3438 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9697, float2(0.0), isnan(_9697))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9697, float2(0.0), isnan(_9697))).xy;
                float _3440 = _3438.x;
                float _3442 = _3438.y;
                float _3444 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3392);
                _3410 = _3386;
                _3398 = _3440;
                _3400 = _3442;
                _3402 = _3444;
            }
        }
        int _3446 = _3410;
        float _3448 = _3398;
        float _3450 = _3400;
        float _3452 = _3402;
        int _3454 = _3446 & 1;
        bool _3456 = _3454 != 0;
        float _3458 = _3448;
        float _3460 = _3450;
        float _3462 = _3452;
        int _3464 = _3446;
        if (_3456)
        {
            _3404 = _3446;
        }
        int _3466 = _3404;
        int _3468 = _3466;
        int _3470 = _3466;
        if (!_3456)
        {
            bool _3472 = _3448 > 0.800000011920928955078125;
            bool _3474 = isnan(_3448);
            bool _3476 = _3472 || _3474;
            bool _3478 = isnan(0.800000011920928955078125);
            bool _3480 = _3476 || _3478;
            bool _3482 = _3450 != 0.0;
            bool _3484 = isnan(_3450);
            bool _3486 = _3482 || _3484;
            bool _3488 = isnan(0.0);
            bool _3490 = _3486 || _3488;
            bool _3492 = !_3480;
            bool _3494 = _3490 || _3492;
            if (_3494)
            {
                _3468 = 1;
            }
            int _3496 = _3468;
            _3470 = _3496;
            if (!_3494)
            {
                float2 _9776 = float2(_143, _3452);
                float2 _3498 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9776, float2(0.0), isnan(_9776))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9776, float2(0.0), isnan(_9776))).xy;
                float _3500 = _3498.x;
                float _3502 = _3498.y;
                float _3504 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3452);
                _3470 = _3446;
                _3458 = _3500;
                _3460 = _3502;
                _3462 = _3504;
            }
        }
        int _3506 = _3470;
        float _3508 = _3458;
        float _3510 = _3460;
        float _3512 = _3462;
        int _3514 = _3506 & 1;
        bool _3516 = _3514 != 0;
        float _3518 = _3508;
        float _3520 = _3510;
        float _3522 = _3512;
        int _3524 = _3506;
        if (_3516)
        {
            _3464 = _3506;
        }
        int _3526 = _3464;
        int _3528 = _3526;
        int _3530 = _3526;
        if (!_3516)
        {
            bool _3532 = _3508 > 0.800000011920928955078125;
            bool _3534 = isnan(_3508);
            bool _3536 = _3532 || _3534;
            bool _3538 = isnan(0.800000011920928955078125);
            bool _3540 = _3536 || _3538;
            bool _3542 = _3510 != 0.0;
            bool _3544 = isnan(_3510);
            bool _3546 = _3542 || _3544;
            bool _3548 = isnan(0.0);
            bool _3550 = _3546 || _3548;
            bool _3552 = !_3540;
            bool _3554 = _3550 || _3552;
            if (_3554)
            {
                _3528 = 1;
            }
            int _3556 = _3528;
            _3530 = _3556;
            if (!_3554)
            {
                float2 _9855 = float2(_143, _3512);
                float2 _3558 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9855, float2(0.0), isnan(_9855))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9855, float2(0.0), isnan(_9855))).xy;
                float _3560 = _3558.x;
                float _3562 = _3558.y;
                float _3564 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3512);
                _3530 = _3506;
                _3518 = _3560;
                _3520 = _3562;
                _3522 = _3564;
            }
        }
        int _3566 = _3530;
        float _3568 = _3518;
        float _3570 = _3520;
        float _3572 = _3522;
        int _3574 = _3566 & 1;
        bool _3576 = _3574 != 0;
        float _3578 = _3568;
        float _3580 = _3570;
        float _3582 = _3572;
        int _3584 = _3566;
        if (_3576)
        {
            _3524 = _3566;
        }
        int _3586 = _3524;
        int _3588 = _3586;
        int _3590 = _3586;
        if (!_3576)
        {
            bool _3592 = _3568 > 0.800000011920928955078125;
            bool _3594 = isnan(_3568);
            bool _3596 = _3592 || _3594;
            bool _3598 = isnan(0.800000011920928955078125);
            bool _3600 = _3596 || _3598;
            bool _3602 = _3570 != 0.0;
            bool _3604 = isnan(_3570);
            bool _3606 = _3602 || _3604;
            bool _3608 = isnan(0.0);
            bool _3610 = _3606 || _3608;
            bool _3612 = !_3600;
            bool _3614 = _3610 || _3612;
            if (_3614)
            {
                _3588 = 1;
            }
            int _3616 = _3588;
            _3590 = _3616;
            if (!_3614)
            {
                float2 _9934 = float2(_143, _3572);
                float2 _3618 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9934, float2(0.0), isnan(_9934))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9934, float2(0.0), isnan(_9934))).xy;
                float _3620 = _3618.x;
                float _3622 = _3618.y;
                float _3624 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3572);
                _3590 = _3566;
                _3578 = _3620;
                _3580 = _3622;
                _3582 = _3624;
            }
        }
        int _3626 = _3590;
        float _3628 = _3578;
        float _3630 = _3580;
        float _3632 = _3582;
        int _3634 = _3626 & 1;
        bool _3636 = _3634 != 0;
        float _3638 = _3628;
        float _3640 = _3630;
        float _3642 = _3632;
        int _3644 = _3626;
        if (_3636)
        {
            _3584 = _3626;
        }
        int _3646 = _3584;
        int _3648 = _3646;
        int _3650 = _3646;
        if (!_3636)
        {
            bool _3652 = _3628 > 0.800000011920928955078125;
            bool _3654 = isnan(_3628);
            bool _3656 = _3652 || _3654;
            bool _3658 = isnan(0.800000011920928955078125);
            bool _3660 = _3656 || _3658;
            bool _3662 = _3630 != 0.0;
            bool _3664 = isnan(_3630);
            bool _3666 = _3662 || _3664;
            bool _3668 = isnan(0.0);
            bool _3670 = _3666 || _3668;
            bool _3672 = !_3660;
            bool _3674 = _3670 || _3672;
            if (_3674)
            {
                _3648 = 1;
            }
            int _3676 = _3648;
            _3650 = _3676;
            if (!_3674)
            {
                float2 _10013 = float2(_143, _3632);
                float2 _3678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10013, float2(0.0), isnan(_10013))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10013, float2(0.0), isnan(_10013))).xy;
                float _3680 = _3678.x;
                float _3682 = _3678.y;
                float _3684 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3632);
                _3650 = _3626;
                _3638 = _3680;
                _3640 = _3682;
                _3642 = _3684;
            }
        }
        int _3686 = _3650;
        float _3688 = _3638;
        float _3690 = _3640;
        float _3692 = _3642;
        int _3694 = _3686 & 1;
        bool _3696 = _3694 != 0;
        float _3698 = _3688;
        float _3700 = _3690;
        float _3702 = _3692;
        int _3704 = _3686;
        if (_3696)
        {
            _3644 = _3686;
        }
        int _3706 = _3644;
        int _3708 = _3706;
        int _3710 = _3706;
        if (!_3696)
        {
            bool _3712 = _3688 > 0.800000011920928955078125;
            bool _3714 = isnan(_3688);
            bool _3716 = _3712 || _3714;
            bool _3718 = isnan(0.800000011920928955078125);
            bool _3720 = _3716 || _3718;
            bool _3722 = _3690 != 0.0;
            bool _3724 = isnan(_3690);
            bool _3726 = _3722 || _3724;
            bool _3728 = isnan(0.0);
            bool _3730 = _3726 || _3728;
            bool _3732 = !_3720;
            bool _3734 = _3730 || _3732;
            if (_3734)
            {
                _3708 = 1;
            }
            int _3736 = _3708;
            _3710 = _3736;
            if (!_3734)
            {
                float2 _10092 = float2(_143, _3692);
                float2 _3738 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10092, float2(0.0), isnan(_10092))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10092, float2(0.0), isnan(_10092))).xy;
                float _3740 = _3738.x;
                float _3742 = _3738.y;
                float _3744 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3692);
                _3710 = _3686;
                _3698 = _3740;
                _3700 = _3742;
                _3702 = _3744;
            }
        }
        int _3746 = _3710;
        float _3748 = _3698;
        float _3750 = _3700;
        float _3752 = _3702;
        int _3754 = _3746 & 1;
        bool _3756 = _3754 != 0;
        float _3758 = _3748;
        float _3760 = _3750;
        float _3762 = _3752;
        int _3764 = _3746;
        if (_3756)
        {
            _3704 = _3746;
        }
        int _3766 = _3704;
        int _3768 = _3766;
        int _3770 = _3766;
        if (!_3756)
        {
            bool _3772 = _3748 > 0.800000011920928955078125;
            bool _3774 = isnan(_3748);
            bool _3776 = _3772 || _3774;
            bool _3778 = isnan(0.800000011920928955078125);
            bool _3780 = _3776 || _3778;
            bool _3782 = _3750 != 0.0;
            bool _3784 = isnan(_3750);
            bool _3786 = _3782 || _3784;
            bool _3788 = isnan(0.0);
            bool _3790 = _3786 || _3788;
            bool _3792 = !_3780;
            bool _3794 = _3790 || _3792;
            if (_3794)
            {
                _3768 = 1;
            }
            int _3796 = _3768;
            _3770 = _3796;
            if (!_3794)
            {
                float2 _10171 = float2(_143, _3752);
                float2 _3798 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10171, float2(0.0), isnan(_10171))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10171, float2(0.0), isnan(_10171))).xy;
                float _3800 = _3798.x;
                float _3802 = _3798.y;
                float _3804 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3752);
                _3770 = _3746;
                _3758 = _3800;
                _3760 = _3802;
                _3762 = _3804;
            }
        }
        int _3806 = _3770;
        float _3808 = _3758;
        float _3810 = _3760;
        float _3812 = _3762;
        int _3814 = _3806 & 1;
        bool _3816 = _3814 != 0;
        float _3818 = _3808;
        float _3820 = _3810;
        float _3822 = _3812;
        int _3824 = _3806;
        if (_3816)
        {
            _3764 = _3806;
        }
        int _3826 = _3764;
        int _3828 = _3826;
        int _3830 = _3826;
        if (!_3816)
        {
            bool _3832 = _3808 > 0.800000011920928955078125;
            bool _3834 = isnan(_3808);
            bool _3836 = _3832 || _3834;
            bool _3838 = isnan(0.800000011920928955078125);
            bool _3840 = _3836 || _3838;
            bool _3842 = _3810 != 0.0;
            bool _3844 = isnan(_3810);
            bool _3846 = _3842 || _3844;
            bool _3848 = isnan(0.0);
            bool _3850 = _3846 || _3848;
            bool _3852 = !_3840;
            bool _3854 = _3850 || _3852;
            if (_3854)
            {
                _3828 = 1;
            }
            int _3856 = _3828;
            _3830 = _3856;
            if (!_3854)
            {
                float2 _10250 = float2(_143, _3812);
                float2 _3858 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10250, float2(0.0), isnan(_10250))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10250, float2(0.0), isnan(_10250))).xy;
                float _3860 = _3858.x;
                float _3862 = _3858.y;
                float _3864 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3812);
                _3830 = _3806;
                _3818 = _3860;
                _3820 = _3862;
                _3822 = _3864;
            }
        }
        int _3866 = _3830;
        float _3868 = _3818;
        float _3870 = _3820;
        float _3872 = _3822;
        int _3874 = _3866 & 1;
        bool _3876 = _3874 != 0;
        float _3878 = _3872;
        float _3880 = _3868;
        float _3882 = _3870;
        int _3884 = _3866;
        if (_3876)
        {
            _3824 = _3866;
        }
        int _3886 = _3824;
        int _3888 = _3886;
        int _3890 = _3886;
        if (!_3876)
        {
            bool _3892 = _3868 > 0.800000011920928955078125;
            bool _3894 = isnan(_3868);
            bool _3896 = _3892 || _3894;
            bool _3898 = isnan(0.800000011920928955078125);
            bool _3900 = _3896 || _3898;
            bool _3902 = _3870 != 0.0;
            bool _3904 = isnan(_3870);
            bool _3906 = _3902 || _3904;
            bool _3908 = isnan(0.0);
            bool _3910 = _3906 || _3908;
            bool _3912 = !_3900;
            bool _3914 = _3910 || _3912;
            if (_3914)
            {
                _3888 = 1;
            }
            int _3916 = _3888;
            _3890 = _3916;
            if (!_3914)
            {
                float2 _10329 = float2(_143, _3872);
                float2 _3918 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10329, float2(0.0), isnan(_10329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10329, float2(0.0), isnan(_10329))).xy;
                float _3920 = _3918.x;
                float _3922 = _3918.y;
                float _3924 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3872);
                _3890 = _3866;
                _3878 = _3924;
                _3880 = _3920;
                _3882 = _3922;
            }
        }
        int _3926 = _3890;
        float _3928 = _3878;
        float _3930 = _3880;
        float _3932 = _3882;
        int _3934 = _3926 & 1;
        bool _3936 = _3934 != 0;
        float _3938 = _3932;
        float _3940 = _3930;
        float _3942 = as_type<float>(_3926);
        float _3944 = _3928;
        if (_3150)
        {
            _3152 = 1;
        }
        int _3946 = _3152;
        int _3948 = _3946;
        if (!_3150)
        {
            _3948 = 0;
        }
        int _3950 = _3948;
        int _3952 = _3950 & 1;
        bool _3954 = _3952 != 0;
        if (_3936)
        {
            _3154 = _3928;
        }
        float _3956 = _3154;
        float _3958 = _3956;
        float _3960 = _3956;
        if (_3936)
        {
            _3884 = _3926;
        }
        int _3962 = _3884;
        int _3964 = _3962;
        int _3966 = _3962;
        if (!_3936)
        {
            bool _3968 = _3930 > 0.800000011920928955078125;
            bool _3970 = isnan(_3930);
            bool _3972 = _3968 || _3970;
            bool _3974 = isnan(0.800000011920928955078125);
            bool _3976 = _3972 || _3974;
            bool _3978 = _3932 != 0.0;
            bool _3980 = isnan(_3932);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan(0.0);
            bool _3986 = _3982 || _3984;
            bool _3988 = !_3976;
            bool _3990 = _3986 || _3988;
            if (_3990)
            {
                _3958 = _3928;
            }
            float _3992 = _3958;
            _3960 = _3992;
            if (_3990)
            {
                _3964 = 1;
            }
            int _3994 = _3964;
            _3966 = _3994;
            if (!_3990)
            {
                float2 _10436 = float2(_143, _3928);
                float2 _3996 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10436, float2(0.0), isnan(_10436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10436, float2(0.0), isnan(_10436))).xy;
                float _3998 = _3996.x;
                float _4000 = _3996.y;
                float _4002 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3928);
                _3966 = _3926;
                _3960 = _4002;
                _3938 = _4000;
                _3940 = _3998;
            }
        }
        int _4004 = _3966;
        float _4006 = _3960;
        float _4008 = _3938;
        float _4010 = _3940;
        int _4012 = _4004 & 1;
        bool _4014 = _4012 != 0;
        int _4016 = _4004;
        if (!_3150)
        {
            float _4018 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _3162);
            _3164 = _4018;
        }
        float _4020 = _3164;
        float _4022 = _4020;
        if (_4014)
        {
            _3942 = _4006;
        }
        float _4024 = _3942;
        float _4026 = _4024;
        float _4028 = _4024;
        if (_4014)
        {
            _3088 = _4008;
        }
        float _4030 = _3088;
        float _4032 = _4030;
        float _4034 = _4030;
        if (_4014)
        {
            _3944 = _4010;
        }
        float _4036 = _3944;
        float _4038 = _4036;
        float _4040 = _4036;
        if (!_4014)
        {
            bool _4042 = _4010 > 0.800000011920928955078125;
            bool _4044 = isnan(_4010);
            bool _4046 = _4042 || _4044;
            bool _4048 = isnan(0.800000011920928955078125);
            bool _4050 = _4046 || _4048;
            bool _4052 = _4008 != 0.0;
            bool _4054 = isnan(_4008);
            bool _4056 = _4052 || _4054;
            bool _4058 = isnan(0.0);
            bool _4060 = _4056 || _4058;
            bool _4062 = !_4050;
            bool _4064 = _4060 || _4062;
            if (_4064)
            {
                _4038 = _4010;
            }
            float _4066 = _4038;
            _4040 = _4066;
            if (_4064)
            {
                _4026 = _4006;
            }
            float _4068 = _4026;
            _4028 = _4068;
            if (_4064)
            {
                _4032 = _4008;
            }
            float _4070 = _4032;
            _4034 = _4070;
            if (!_4064)
            {
                float2 _10550 = float2(_143, _4006);
                float2 _4072 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10550, float2(0.0), isnan(_10550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10550, float2(0.0), isnan(_10550))).xy;
                float _4074 = _4072.x;
                float _4076 = _4072.y;
                float _4078 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4006);
                _4040 = _4074;
                _4034 = _4076;
                _4028 = _4078;
            }
        }
        float _4080 = _4040;
        float _4082 = _4034;
        float _4084 = _4028;
        if (_3954)
        {
            _196 = _3950;
        }
        int _4086 = _196;
        int _4088 = _4086;
        int _4090 = _4086;
        if (!_3954)
        {
            bool _4092 = _3192 > 0.800000011920928955078125;
            bool _4094 = isnan(_3192);
            bool _4096 = _4092 || _4094;
            bool _4098 = isnan(0.800000011920928955078125);
            bool _4100 = _4096 || _4098;
            bool _4102 = _3194 != 0.0;
            bool _4104 = isnan(_3194);
            bool _4106 = _4102 || _4104;
            bool _4108 = isnan(0.0);
            bool _4110 = _4106 || _4108;
            bool _4112 = !_4100;
            bool _4114 = _4110 || _4112;
            if (_4114)
            {
                _4088 = 1;
            }
            int _4116 = _4088;
            _4090 = _4116;
            if (!_4114)
            {
                float2 _10619 = float2(_145, _4020);
                float2 _4118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10619, float2(0.0), isnan(_10619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10619, float2(0.0), isnan(_10619))).xy;
                float _4120 = _4118.x;
                float _4122 = _4118.y;
                float _4124 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4020);
                _4090 = _3950;
                _3228 = _4120;
                _3230 = _4122;
                _4022 = _4124;
            }
        }
        int _4126 = _4090;
        float _4128 = _3228;
        float _4130 = _3230;
        float _4132 = _4022;
        int _4134 = _4126 & 1;
        bool _4136 = _4134 != 0;
        float _4138 = _4128;
        float _4140 = _4130;
        float _4142 = _4132;
        int _4144 = _4126;
        if (_4136)
        {
            _4016 = _4126;
        }
        int _4146 = _4016;
        int _4148 = _4146;
        int _4150 = _4146;
        if (!_4136)
        {
            bool _4152 = _4128 > 0.800000011920928955078125;
            bool _4154 = isnan(_4128);
            bool _4156 = _4152 || _4154;
            bool _4158 = isnan(0.800000011920928955078125);
            bool _4160 = _4156 || _4158;
            bool _4162 = _4130 != 0.0;
            bool _4164 = isnan(_4130);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan(0.0);
            bool _4170 = _4166 || _4168;
            bool _4172 = !_4160;
            bool _4174 = _4170 || _4172;
            if (_4174)
            {
                _4148 = 1;
            }
            int _4176 = _4148;
            _4150 = _4176;
            if (!_4174)
            {
                float2 _10698 = float2(_145, _4132);
                float2 _4178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10698, float2(0.0), isnan(_10698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10698, float2(0.0), isnan(_10698))).xy;
                float _4180 = _4178.x;
                float _4182 = _4178.y;
                float _4184 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4132);
                _4150 = _4126;
                _4138 = _4180;
                _4140 = _4182;
                _4142 = _4184;
            }
        }
        int _4186 = _4150;
        float _4188 = _4138;
        float _4190 = _4140;
        float _4192 = _4142;
        int _4194 = _4186 & 1;
        bool _4196 = _4194 != 0;
        float _4198 = _4188;
        float _4200 = _4190;
        float _4202 = _4192;
        int _4204 = _4186;
        if (_4196)
        {
            _4144 = _4186;
        }
        int _4206 = _4144;
        int _4208 = _4206;
        int _4210 = _4206;
        if (!_4196)
        {
            bool _4212 = _4188 > 0.800000011920928955078125;
            bool _4214 = isnan(_4188);
            bool _4216 = _4212 || _4214;
            bool _4218 = isnan(0.800000011920928955078125);
            bool _4220 = _4216 || _4218;
            bool _4222 = _4190 != 0.0;
            bool _4224 = isnan(_4190);
            bool _4226 = _4222 || _4224;
            bool _4228 = isnan(0.0);
            bool _4230 = _4226 || _4228;
            bool _4232 = !_4220;
            bool _4234 = _4230 || _4232;
            if (_4234)
            {
                _4208 = 1;
            }
            int _4236 = _4208;
            _4210 = _4236;
            if (!_4234)
            {
                float2 _10777 = float2(_145, _4192);
                float2 _4238 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10777, float2(0.0), isnan(_10777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10777, float2(0.0), isnan(_10777))).xy;
                float _4240 = _4238.x;
                float _4242 = _4238.y;
                float _4244 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4192);
                _4210 = _4186;
                _4198 = _4240;
                _4200 = _4242;
                _4202 = _4244;
            }
        }
        int _4246 = _4210;
        float _4248 = _4198;
        float _4250 = _4200;
        float _4252 = _4202;
        int _4254 = _4246 & 1;
        bool _4256 = _4254 != 0;
        float _4258 = _4248;
        float _4260 = _4250;
        float _4262 = _4252;
        int _4264 = _4246;
        if (_4256)
        {
            _4204 = _4246;
        }
        int _4266 = _4204;
        int _4268 = _4266;
        int _4270 = _4266;
        if (!_4256)
        {
            bool _4272 = _4248 > 0.800000011920928955078125;
            bool _4274 = isnan(_4248);
            bool _4276 = _4272 || _4274;
            bool _4278 = isnan(0.800000011920928955078125);
            bool _4280 = _4276 || _4278;
            bool _4282 = _4250 != 0.0;
            bool _4284 = isnan(_4250);
            bool _4286 = _4282 || _4284;
            bool _4288 = isnan(0.0);
            bool _4290 = _4286 || _4288;
            bool _4292 = !_4280;
            bool _4294 = _4290 || _4292;
            if (_4294)
            {
                _4268 = 1;
            }
            int _4296 = _4268;
            _4270 = _4296;
            if (!_4294)
            {
                float2 _10856 = float2(_145, _4252);
                float2 _4298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10856, float2(0.0), isnan(_10856))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10856, float2(0.0), isnan(_10856))).xy;
                float _4300 = _4298.x;
                float _4302 = _4298.y;
                float _4304 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4252);
                _4270 = _4246;
                _4258 = _4300;
                _4260 = _4302;
                _4262 = _4304;
            }
        }
        int _4306 = _4270;
        float _4308 = _4258;
        float _4310 = _4260;
        float _4312 = _4262;
        int _4314 = _4306 & 1;
        bool _4316 = _4314 != 0;
        float _4318 = _4308;
        float _4320 = _4310;
        float _4322 = _4312;
        int _4324 = _4306;
        if (_4316)
        {
            _4264 = _4306;
        }
        int _4326 = _4264;
        int _4328 = _4326;
        int _4330 = _4326;
        if (!_4316)
        {
            bool _4332 = _4308 > 0.800000011920928955078125;
            bool _4334 = isnan(_4308);
            bool _4336 = _4332 || _4334;
            bool _4338 = isnan(0.800000011920928955078125);
            bool _4340 = _4336 || _4338;
            bool _4342 = _4310 != 0.0;
            bool _4344 = isnan(_4310);
            bool _4346 = _4342 || _4344;
            bool _4348 = isnan(0.0);
            bool _4350 = _4346 || _4348;
            bool _4352 = !_4340;
            bool _4354 = _4350 || _4352;
            if (_4354)
            {
                _4328 = 1;
            }
            int _4356 = _4328;
            _4330 = _4356;
            if (!_4354)
            {
                float2 _10935 = float2(_145, _4312);
                float2 _4358 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10935, float2(0.0), isnan(_10935))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10935, float2(0.0), isnan(_10935))).xy;
                float _4360 = _4358.x;
                float _4362 = _4358.y;
                float _4364 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4312);
                _4330 = _4306;
                _4318 = _4360;
                _4320 = _4362;
                _4322 = _4364;
            }
        }
        int _4366 = _4330;
        float _4368 = _4318;
        float _4370 = _4320;
        float _4372 = _4322;
        int _4374 = _4366 & 1;
        bool _4376 = _4374 != 0;
        float _4378 = _4368;
        float _4380 = _4370;
        float _4382 = _4372;
        int _4384 = _4366;
        if (_4376)
        {
            _4324 = _4366;
        }
        int _4386 = _4324;
        int _4388 = _4386;
        int _4390 = _4386;
        if (!_4376)
        {
            bool _4392 = _4368 > 0.800000011920928955078125;
            bool _4394 = isnan(_4368);
            bool _4396 = _4392 || _4394;
            bool _4398 = isnan(0.800000011920928955078125);
            bool _4400 = _4396 || _4398;
            bool _4402 = _4370 != 0.0;
            bool _4404 = isnan(_4370);
            bool _4406 = _4402 || _4404;
            bool _4408 = isnan(0.0);
            bool _4410 = _4406 || _4408;
            bool _4412 = !_4400;
            bool _4414 = _4410 || _4412;
            if (_4414)
            {
                _4388 = 1;
            }
            int _4416 = _4388;
            _4390 = _4416;
            if (!_4414)
            {
                float2 _11014 = float2(_145, _4372);
                float2 _4418 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11014, float2(0.0), isnan(_11014))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11014, float2(0.0), isnan(_11014))).xy;
                float _4420 = _4418.x;
                float _4422 = _4418.y;
                float _4424 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4372);
                _4390 = _4366;
                _4378 = _4420;
                _4380 = _4422;
                _4382 = _4424;
            }
        }
        int _4426 = _4390;
        float _4428 = _4378;
        float _4430 = _4380;
        float _4432 = _4382;
        int _4434 = _4426 & 1;
        bool _4436 = _4434 != 0;
        float _4438 = _4428;
        float _4440 = _4430;
        float _4442 = _4432;
        int _4444 = _4426;
        if (_4436)
        {
            _4384 = _4426;
        }
        int _4446 = _4384;
        int _4448 = _4446;
        int _4450 = _4446;
        if (!_4436)
        {
            bool _4452 = _4428 > 0.800000011920928955078125;
            bool _4454 = isnan(_4428);
            bool _4456 = _4452 || _4454;
            bool _4458 = isnan(0.800000011920928955078125);
            bool _4460 = _4456 || _4458;
            bool _4462 = _4430 != 0.0;
            bool _4464 = isnan(_4430);
            bool _4466 = _4462 || _4464;
            bool _4468 = isnan(0.0);
            bool _4470 = _4466 || _4468;
            bool _4472 = !_4460;
            bool _4474 = _4470 || _4472;
            if (_4474)
            {
                _4448 = 1;
            }
            int _4476 = _4448;
            _4450 = _4476;
            if (!_4474)
            {
                float2 _11093 = float2(_145, _4432);
                float2 _4478 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11093, float2(0.0), isnan(_11093))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11093, float2(0.0), isnan(_11093))).xy;
                float _4480 = _4478.x;
                float _4482 = _4478.y;
                float _4484 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4432);
                _4450 = _4426;
                _4438 = _4480;
                _4440 = _4482;
                _4442 = _4484;
            }
        }
        int _4486 = _4450;
        float _4488 = _4438;
        float _4490 = _4440;
        float _4492 = _4442;
        int _4494 = _4486 & 1;
        bool _4496 = _4494 != 0;
        float _4498 = _4488;
        float _4500 = _4490;
        float _4502 = _4492;
        int _4504 = _4486;
        if (_4496)
        {
            _4444 = _4486;
        }
        int _4506 = _4444;
        int _4508 = _4506;
        int _4510 = _4506;
        if (!_4496)
        {
            bool _4512 = _4488 > 0.800000011920928955078125;
            bool _4514 = isnan(_4488);
            bool _4516 = _4512 || _4514;
            bool _4518 = isnan(0.800000011920928955078125);
            bool _4520 = _4516 || _4518;
            bool _4522 = _4490 != 0.0;
            bool _4524 = isnan(_4490);
            bool _4526 = _4522 || _4524;
            bool _4528 = isnan(0.0);
            bool _4530 = _4526 || _4528;
            bool _4532 = !_4520;
            bool _4534 = _4530 || _4532;
            if (_4534)
            {
                _4508 = 1;
            }
            int _4536 = _4508;
            _4510 = _4536;
            if (!_4534)
            {
                float2 _11172 = float2(_145, _4492);
                float2 _4538 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11172, float2(0.0), isnan(_11172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11172, float2(0.0), isnan(_11172))).xy;
                float _4540 = _4538.x;
                float _4542 = _4538.y;
                float _4544 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4492);
                _4510 = _4486;
                _4498 = _4540;
                _4500 = _4542;
                _4502 = _4544;
            }
        }
        int _4546 = _4510;
        float _4548 = _4498;
        float _4550 = _4500;
        float _4552 = _4502;
        int _4554 = _4546 & 1;
        bool _4556 = _4554 != 0;
        float _4558 = _4548;
        float _4560 = _4550;
        float _4562 = _4552;
        int _4564 = _4546;
        if (_4556)
        {
            _4504 = _4546;
        }
        int _4566 = _4504;
        int _4568 = _4566;
        int _4570 = _4566;
        if (!_4556)
        {
            bool _4572 = _4548 > 0.800000011920928955078125;
            bool _4574 = isnan(_4548);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan(0.800000011920928955078125);
            bool _4580 = _4576 || _4578;
            bool _4582 = _4550 != 0.0;
            bool _4584 = isnan(_4550);
            bool _4586 = _4582 || _4584;
            bool _4588 = isnan(0.0);
            bool _4590 = _4586 || _4588;
            bool _4592 = !_4580;
            bool _4594 = _4590 || _4592;
            if (_4594)
            {
                _4568 = 1;
            }
            int _4596 = _4568;
            _4570 = _4596;
            if (!_4594)
            {
                float2 _11251 = float2(_145, _4552);
                float2 _4598 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11251, float2(0.0), isnan(_11251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11251, float2(0.0), isnan(_11251))).xy;
                float _4600 = _4598.x;
                float _4602 = _4598.y;
                float _4604 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4552);
                _4570 = _4546;
                _4558 = _4600;
                _4560 = _4602;
                _4562 = _4604;
            }
        }
        int _4606 = _4570;
        float _4608 = _4558;
        float _4610 = _4560;
        float _4612 = _4562;
        int _4614 = _4606 & 1;
        bool _4616 = _4614 != 0;
        float _4618 = _4608;
        float _4620 = _4610;
        float _4622 = _4612;
        int _4624 = _4606;
        if (_4616)
        {
            _4564 = _4606;
        }
        int _4626 = _4564;
        int _4628 = _4626;
        int _4630 = _4626;
        if (!_4616)
        {
            bool _4632 = _4608 > 0.800000011920928955078125;
            bool _4634 = isnan(_4608);
            bool _4636 = _4632 || _4634;
            bool _4638 = isnan(0.800000011920928955078125);
            bool _4640 = _4636 || _4638;
            bool _4642 = _4610 != 0.0;
            bool _4644 = isnan(_4610);
            bool _4646 = _4642 || _4644;
            bool _4648 = isnan(0.0);
            bool _4650 = _4646 || _4648;
            bool _4652 = !_4640;
            bool _4654 = _4650 || _4652;
            if (_4654)
            {
                _4628 = 1;
            }
            int _4656 = _4628;
            _4630 = _4656;
            if (!_4654)
            {
                float2 _11330 = float2(_145, _4612);
                float2 _4658 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11330, float2(0.0), isnan(_11330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11330, float2(0.0), isnan(_11330))).xy;
                float _4660 = _4658.x;
                float _4662 = _4658.y;
                float _4664 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4612);
                _4630 = _4606;
                _4618 = _4660;
                _4620 = _4662;
                _4622 = _4664;
            }
        }
        int _4666 = _4630;
        float _4668 = _4618;
        float _4670 = _4620;
        float _4672 = _4622;
        int _4674 = _4666 & 1;
        bool _4676 = _4674 != 0;
        float _4678 = _4668;
        float _4680 = _4670;
        float _4682 = _4672;
        int _4684 = _4666;
        if (_4676)
        {
            _4624 = _4666;
        }
        int _4686 = _4624;
        int _4688 = _4686;
        int _4690 = _4686;
        if (!_4676)
        {
            bool _4692 = _4668 > 0.800000011920928955078125;
            bool _4694 = isnan(_4668);
            bool _4696 = _4692 || _4694;
            bool _4698 = isnan(0.800000011920928955078125);
            bool _4700 = _4696 || _4698;
            bool _4702 = _4670 != 0.0;
            bool _4704 = isnan(_4670);
            bool _4706 = _4702 || _4704;
            bool _4708 = isnan(0.0);
            bool _4710 = _4706 || _4708;
            bool _4712 = !_4700;
            bool _4714 = _4710 || _4712;
            if (_4714)
            {
                _4688 = 1;
            }
            int _4716 = _4688;
            _4690 = _4716;
            if (!_4714)
            {
                float2 _11409 = float2(_145, _4672);
                float2 _4718 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11409, float2(0.0), isnan(_11409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11409, float2(0.0), isnan(_11409))).xy;
                float _4720 = _4718.x;
                float _4722 = _4718.y;
                float _4724 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4672);
                _4690 = _4666;
                _4678 = _4720;
                _4680 = _4722;
                _4682 = _4724;
            }
        }
        int _4726 = _4690;
        float _4728 = _4678;
        float _4730 = _4680;
        float _4732 = _4682;
        int _4734 = _4726 & 1;
        bool _4736 = _4734 != 0;
        float _4738 = _4728;
        float _4740 = _4730;
        float _4742 = _4732;
        int _4744 = _4726;
        if (_4736)
        {
            _4684 = _4726;
        }
        int _4746 = _4684;
        int _4748 = _4746;
        int _4750 = _4746;
        if (!_4736)
        {
            bool _4752 = _4728 > 0.800000011920928955078125;
            bool _4754 = isnan(_4728);
            bool _4756 = _4752 || _4754;
            bool _4758 = isnan(0.800000011920928955078125);
            bool _4760 = _4756 || _4758;
            bool _4762 = _4730 != 0.0;
            bool _4764 = isnan(_4730);
            bool _4766 = _4762 || _4764;
            bool _4768 = isnan(0.0);
            bool _4770 = _4766 || _4768;
            bool _4772 = !_4760;
            bool _4774 = _4770 || _4772;
            if (_4774)
            {
                _4748 = 1;
            }
            int _4776 = _4748;
            _4750 = _4776;
            if (!_4774)
            {
                float2 _11488 = float2(_145, _4732);
                float2 _4778 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11488, float2(0.0), isnan(_11488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11488, float2(0.0), isnan(_11488))).xy;
                float _4780 = _4778.x;
                float _4782 = _4778.y;
                float _4784 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4732);
                _4750 = _4726;
                _4738 = _4780;
                _4740 = _4782;
                _4742 = _4784;
            }
        }
        int _4786 = _4750;
        float _4788 = _4738;
        float _4790 = _4740;
        float _4792 = _4742;
        int _4794 = _4786 & 1;
        bool _4796 = _4794 != 0;
        float _4798 = _4788;
        float _4800 = _4790;
        float _4802 = _4792;
        if (_4796)
        {
            _4744 = _4786;
        }
        int _4804 = _4744;
        int _4806 = _4804;
        int _4808 = _4804;
        if (!_4796)
        {
            bool _4810 = _4788 > 0.800000011920928955078125;
            bool _4812 = isnan(_4788);
            bool _4814 = _4810 || _4812;
            bool _4816 = isnan(0.800000011920928955078125);
            bool _4818 = _4814 || _4816;
            bool _4820 = _4790 != 0.0;
            bool _4822 = isnan(_4790);
            bool _4824 = _4820 || _4822;
            bool _4826 = isnan(0.0);
            bool _4828 = _4824 || _4826;
            bool _4830 = !_4818;
            bool _4832 = _4828 || _4830;
            if (_4832)
            {
                _4806 = 1;
            }
            int _4834 = _4806;
            _4808 = _4834;
            if (!_4832)
            {
                float2 _11566 = float2(_145, _4792);
                float2 _4836 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11566, float2(0.0), isnan(_11566))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11566, float2(0.0), isnan(_11566))).xy;
                float _4838 = _4836.x;
                float _4840 = _4836.y;
                float _4842 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4792);
                _4808 = _4786;
                _4798 = _4838;
                _4800 = _4840;
                _4802 = _4842;
            }
        }
        int _4844 = _4808;
        float _4846 = _4798;
        float _4848 = _4800;
        float _4850 = _4802;
        int _4852 = _4844 & 1;
        bool _4854 = _4852 != 0;
        float _4856 = _4848;
        float _4858 = _4846;
        float _4860 = _4850;
        if (!_4854)
        {
            bool _4862 = _4846 > 0.800000011920928955078125;
            bool _4864 = isnan(_4846);
            bool _4866 = _4862 || _4864;
            bool _4868 = isnan(0.800000011920928955078125);
            bool _4870 = _4866 || _4868;
            bool _4872 = _4848 != 0.0;
            bool _4874 = isnan(_4848);
            bool _4876 = _4872 || _4874;
            bool _4878 = isnan(0.0);
            bool _4880 = _4876 || _4878;
            bool _4882 = !_4870;
            bool _4884 = _4880 || _4882;
            if (!_4884)
            {
                float2 _11632 = float2(_145, _4850);
                float2 _4886 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11632, float2(0.0), isnan(_11632))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11632, float2(0.0), isnan(_11632))).xy;
                float _4888 = _4886.x;
                float _4890 = _4886.y;
                float _4892 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4850);
                _4856 = _4890;
                _4858 = _4888;
                _4860 = _4892;
            }
        }
        float _4894 = _4856;
        float _4896 = _4858;
        float _4898 = _4860;
        float _4900 = fma(_4894, 0.5, 0.5234375);
        float _4902 = fma(_4080, 2.0, 0.03125);
        float _4904 = fma(_4896, 2.0, 0.03125);
        float _4906 = fma(_4082, 0.5, 0.0078125);
        float2 _11664 = float2(_4900, _4904);
        float _4908 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_11664, float2(0.0), isnan(_11664))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_11664, float2(0.0), isnan(_11664))).x;
        float2 _11672 = float2(_4906, _4902);
        float _4910 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_11672, float2(0.0), isnan(_11672))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_11672, float2(0.0), isnan(_11672))).x;
        float _4912 = fma(_4908, -2.007874011993408203125, 3.25);
        float _4914 = fma(_4910, -2.007874011993408203125, 3.25);
        float _4916 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _4918 = fma(_4912, _4916, _4898);
        float _4920 = fma(_4914, (*spvDescriptorSet0.fp_c3)._m0[0].w, _4084);
        float2 _11696 = float2(_153, _4918);
        float _4922 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11696, float2(0.0), isnan(_11696)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11696, float2(0.0), isnan(_11696)), int2(0, 1)).y;
        float2 _11704 = float2(_153, _4920);
        float _4924 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11704, float2(0.0), isnan(_11704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11704, float2(0.0), isnan(_11704))).y;
        float _4926 = -_151;
        float _4928 = fma(_4920, (*spvDescriptorSet0.fp_c3)._m0[0].y, _4926);
        float _4930 = -_151;
        float _4932 = fma(_4918, (*spvDescriptorSet0.fp_c3)._m0[0].y, _4930);
        float _4934 = rint(_4928);
        float _4936 = rint(_4932);
        float _4938 = abs(_4934);
        float _4940 = sqrt(_4938);
        float _4942 = abs(_4936);
        float _4944 = sqrt(_4942);
        float _4946 = _4922 * 4.0;
        float _4948 = _4924 * 4.0;
        float _4950 = rint(_4946);
        float _4952 = rint(_4948);
        float _4954 = fma(_4950, 16.0, _4944);
        float _4956 = fma(_4954, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _4958 = fma(_4952, 16.0, _4940);
        float2 _11754 = float2(_65, _4920);
        float _4960 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11754, float2(0.0), isnan(_11754)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11754, float2(0.0), isnan(_11754)), int2(1, 0)).y;
        float2 _11762 = float2(_65, _4920);
        float _4962 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11762, float2(0.0), isnan(_11762)), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11762, float2(0.0), isnan(_11762)), int2(-2, 0)).y;
        float _4964 = fma(_4958, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float _4966 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _4956);
        float2 _11777 = float2(_65, _4918);
        float _4968 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11777, float2(0.0), isnan(_11777)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11777, float2(0.0), isnan(_11777)), int2(1)).y;
        float2 _11785 = float2(_65, _4918);
        float _4970 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11785, float2(0.0), isnan(_11785)), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11785, float2(0.0), isnan(_11785)), int2(-2, 1)).y;
        float2 _11794 = float2(_4964, _4966);
        float2 _4972 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_11794, float2(0.0), isnan(_11794))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_11794, float2(0.0), isnan(_11794))).xy;
        float _4974 = _4972.x;
        float _4976 = _4972.y;
        float _4978 = abs(_4936);
        float _4980 = abs(_4934);
        bool _4982 = _4978 >= _4980;
        bool _4984 = isnan(_4978);
        bool _4986 = _4982 || _4984;
        bool _4988 = isnan(_4980);
        bool _4990 = _4986 || _4988;
        float _4992 = float(_4990);
        float _4994 = abs(_4934);
        float _4996 = abs(_4936);
        bool _4998 = _4994 >= _4996;
        bool _5000 = isnan(_4994);
        bool _5002 = _4998 || _5000;
        bool _5004 = isnan(_4996);
        bool _5006 = _5002 || _5004;
        float _5008 = float(_5006);
        float _5010 = _4992 + _5008;
        float _5012 = 1.0 / _5010;
        float _5014 = _5012 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
        float _5016 = _4992 * _5014;
        float _5018 = _5008 * _5014;
        float _5020 = -_5016;
        float _5022 = fma(_5020, _4960, 1.0);
        float _5024 = -_5016;
        float _5026 = fma(_5024, _4962, 1.0);
        float _5028 = -_5018;
        float _5030 = fma(_5028, _4968, _5022);
        float _5032 = precise::clamp(_5030, 0.0, 1.0);
        float _5034 = -_5018;
        float _5036 = fma(_5034, _4970, _5026);
        float _5038 = precise::clamp(_5036, 0.0, 1.0);
        float _5040 = _4974 * _5032;
        float _5042 = _4976 * _5038;
        out.m_42.x = as_type<float>(_3070);
        out.m_42.y = as_type<float>(_3072);
        out.m_42.z = _5040;
        out.m_42.w = _5042;
        return out;
    }
    out.m_42.x = as_type<float>(_3070);
    out.m_42.y = as_type<float>(_3072);
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
    bool _982 = false;
    bool _794 = false;
    bool _482 = false;
    bool _340 = false;
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
    float2 _5076 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5076, float2(0.0), isnan(_5076))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5076, float2(0.0), isnan(_5076))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_35.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_35.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_37.x;
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
    int _172 = as_type<int>(_135);
    float _174 = _117;
    float _176 = _111;
    float _178 = _139;
    int _180 = as_type<int>(_137);
    float _182 = _111;
    float _184 = _139;
    int _186 = as_type<int>(_149);
    float _188 = _137;
    float _190 = _155;
    float _192 = _147;
    int _194 = _166;
    int _196 = as_type<int>(_143);
    if (!_159)
    {
        _168 = 0;
        _170 = 0;
    }
    int _198 = _168;
    int _200 = _170;
    int _202 = _198;
    int _204 = _200;
    if (!_159)
    {
        _172 = _166;
    }
    int _206 = _172;
    bool _208 = !_159;
    int _210 = _206;
    float _212 = 0.0;
    if (!_208)
    {
        if (!_161)
        {
            _174 = 0.0;
        }
        float _214 = _174;
        float _216 = _214;
        if (!_161)
        {
            _176 = 0.0;
        }
        float _218 = _176;
        bool _220 = !_161;
        float _222 = _218;
        if (!_220)
        {
            float _224 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _226 = _65 + _224;
            float _228 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _5269 = float2(_226, _228);
            float2 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5269, float2(0.0), isnan(_5269))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5269, float2(0.0), isnan(_5269))).xy;
            float _232 = _230.x;
            float _234 = _230.y;
            float _236 = _232 + _234;
            float _238 = _236 * 0.5;
            bool _240 = _238 >= 0.89999997615814208984375;
            bool _242 = isnan(_238);
            bool _244 = _240 || _242;
            bool _246 = isnan(0.89999997615814208984375);
            bool _248 = _244 || _246;
            bool _250 = !_248;
            float _252 = _234;
            float _254 = 0.0;
            float _256 = _238;
            if (!_250)
            {
                float _258 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _260 = _226 + _258;
                float _262 = _228 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _5316 = float2(_260, _262);
                float2 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5316, float2(0.0), isnan(_5316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5316, float2(0.0), isnan(_5316))).xy;
                float _266 = _264.x;
                float _268 = _264.y;
                float _270 = _268 + _266;
                float _272 = _270 * 0.5;
                bool _274 = _272 >= 0.89999997615814208984375;
                bool _276 = isnan(_272);
                bool _278 = _274 || _276;
                bool _280 = isnan(0.89999997615814208984375);
                bool _282 = _278 || _280;
                bool _284 = !_282;
                _252 = _268;
                _254 = 1.0;
                _256 = _272;
                if (!_284)
                {
                    float _286 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _288 = _260 + _286;
                    float _290 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _5361 = float2(_288, _290);
                    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5361, float2(0.0), isnan(_5361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5361, float2(0.0), isnan(_5361))).xy;
                    float _294 = _292.x;
                    float _296 = _292.y;
                    float _298 = _296 + _294;
                    float _300 = _298 * 0.5;
                    bool _302 = _300 >= 0.89999997615814208984375;
                    bool _304 = isnan(_300);
                    bool _306 = _302 || _304;
                    bool _308 = isnan(0.89999997615814208984375);
                    bool _310 = _306 || _308;
                    bool _312 = !_310;
                    _252 = _296;
                    _254 = 2.0;
                    _256 = _300;
                    if (!_312)
                    {
                        float _314 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _316 = _288 + _314;
                        float _318 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _5407 = float2(_316, _318);
                        float2 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5407, float2(0.0), isnan(_5407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5407, float2(0.0), isnan(_5407))).xy;
                        float _322 = _320.x;
                        float _324 = _320.y;
                        float _326 = _324 + _322;
                        float _328 = _326 * 0.5;
                        bool _330 = _328 >= 0.89999997615814208984375;
                        bool _332 = isnan(_328);
                        bool _334 = _330 || _332;
                        bool _336 = isnan(0.89999997615814208984375);
                        bool _338 = _334 || _336;
                        _252 = _324;
                        _256 = _328;
                        if (!_338)
                        {
                            _254 = 3.0;
                            _340 = true;
                        }
                        else
                        {
                            _254 = 3.0;
                        }
                    }
                }
            }
            _340 = false;
            float _342 = _252;
            float _344 = _254;
            float _346 = _256;
            bool _348 = _342 >= 0.89999997615814208984375;
            bool _350 = isnan(_342);
            bool _352 = _348 || _350;
            bool _354 = isnan(0.89999997615814208984375);
            bool _356 = _352 || _354;
            float _358 = float(_356);
            float _360 = _358 + _344;
            _216 = _360;
            _222 = _346;
        }
        float _362 = _216;
        float _364 = _222;
        float _366 = _65 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _368 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _370 = _67 + _368;
        float2 _5481 = float2(_366, _370);
        float2 _372 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5481, float2(0.0), isnan(_5481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5481, float2(0.0), isnan(_5481))).xy;
        float _374 = _372.x;
        float _376 = _372.y;
        float _378 = _374 + _376;
        float _380 = _378 * 0.5;
        bool _382 = _380 >= 0.89999997615814208984375;
        bool _384 = isnan(_380);
        bool _386 = _382 || _384;
        bool _388 = isnan(0.89999997615814208984375);
        bool _390 = _386 || _388;
        bool _392 = !_390;
        float _394 = 0.0;
        float _396 = _380;
        float _398 = _376;
        if (!_392)
        {
            float _400 = _366 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _402 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _404 = _370 + _402;
            float2 _5526 = float2(_400, _404);
            float2 _406 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5526, float2(0.0), isnan(_5526))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5526, float2(0.0), isnan(_5526))).xy;
            float _408 = _406.x;
            float _410 = _406.y;
            float _412 = _410 + _408;
            float _414 = _412 * 0.5;
            bool _416 = _414 >= 0.89999997615814208984375;
            bool _418 = isnan(_414);
            bool _420 = _416 || _418;
            bool _422 = isnan(0.89999997615814208984375);
            bool _424 = _420 || _422;
            bool _426 = !_424;
            _394 = 1.0;
            _396 = _414;
            _398 = _404;
            if (!_426)
            {
                float _428 = _400 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _430 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _432 = _404 + _430;
                float2 _5571 = float2(_428, _432);
                float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5571, float2(0.0), isnan(_5571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5571, float2(0.0), isnan(_5571))).xy;
                float _436 = _434.x;
                float _438 = _434.y;
                float _440 = _438 + _436;
                float _442 = _440 * 0.5;
                bool _444 = _442 >= 0.89999997615814208984375;
                bool _446 = isnan(_442);
                bool _448 = _444 || _446;
                bool _450 = isnan(0.89999997615814208984375);
                bool _452 = _448 || _450;
                bool _454 = !_452;
                _394 = 2.0;
                _396 = _442;
                _398 = _432;
                if (!_454)
                {
                    float _456 = _428 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _458 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _460 = _432 + _458;
                    float2 _5616 = float2(_456, _460);
                    float2 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5616, float2(0.0), isnan(_5616))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5616, float2(0.0), isnan(_5616))).xy;
                    float _464 = _462.x;
                    float _466 = _462.y;
                    float _468 = _466 + _464;
                    float _470 = _468 * 0.5;
                    bool _472 = _470 >= 0.89999997615814208984375;
                    bool _474 = isnan(_470);
                    bool _476 = _472 || _474;
                    bool _478 = isnan(0.89999997615814208984375);
                    bool _480 = _476 || _478;
                    _396 = _470;
                    _398 = _466;
                    if (!_480)
                    {
                        _394 = 3.0;
                        _482 = true;
                    }
                    else
                    {
                        _394 = 3.0;
                    }
                }
            }
        }
        _482 = false;
        float _484 = _394;
        float _486 = _396;
        float _488 = _398;
        float _490 = _362 + _484;
        bool _492 = _490 > 2.0;
        float _494 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 0.25, _65);
        float _496 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _498 = _494 + _496;
        float _500 = _490;
        float _502 = _488;
        float _504 = _486;
        if (!_492)
        {
            _500 = 0.0;
            _502 = 0.0;
        }
        float _506 = _500;
        float _508 = _502;
        bool _510 = !_492;
        float _512 = _506;
        float _514 = _508;
        if (!_510)
        {
            float _516 = -_362;
            float _518 = _516 + 0.25;
            float _520 = -_484;
            float _522 = _520 + (-0.25);
            float _524 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _526 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _528 = fma(_518, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _530 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _5719 = float2(_528, _524);
            float2 _532 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5719, float2(0.0), isnan(_5719)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5719, float2(0.0), isnan(_5719)), int2(-1, 0)).xy;
            float _534 = _532.x;
            float _536 = _532.y;
            float2 _5734 = float2(_526, _530);
            float2 _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5734, float2(0.0), isnan(_5734)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5734, float2(0.0), isnan(_5734)), int2(1, 0)).xy;
            float _540 = _538.x;
            float _542 = _538.y;
            bool _544 = _486 <= 0.89999997615814208984375;
            bool _546 = isnan(_486);
            bool _548 = _544 || _546;
            bool _550 = isnan(0.89999997615814208984375);
            bool _552 = _548 || _550;
            float _554 = float(_552);
            float _556 = fma(_540, 5.0, -3.75);
            float _558 = rint(_536);
            float _560 = abs(_556);
            float _562 = _540 * _560;
            float _564 = fma(_534, 5.0, -3.75);
            float _566 = abs(_564);
            float _568 = _534 * _566;
            float _570 = rint(_542);
            bool _572 = _364 <= 0.89999997615814208984375;
            bool _574 = isnan(_364);
            bool _576 = _572 || _574;
            bool _578 = isnan(0.89999997615814208984375);
            bool _580 = _576 || _578;
            float _582 = float(_580);
            float _584 = rint(_562);
            float _586 = rint(_568);
            float _588 = fma(_570, 2.0, _584);
            float _590 = _588 * _554;
            float _592 = fma(_558, 2.0, _586);
            float _594 = fma(_590, 20.0, _484);
            float _596 = _592 * _582;
            float _598 = fma(_594, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _600 = fma(_596, 20.0, _362);
            float _602 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 0.14285714924335479736328125, _598);
            float _604 = fma(_600, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _606 = _604 + 0.5;
            float2 _5831 = float2(_606, _602);
            float2 _608 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_5831, float2(0.0), isnan(_5831))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_5831, float2(0.0), isnan(_5831))).xy;
            float _610 = _608.x;
            float _612 = _608.y;
            _504 = _602;
            _512 = _610;
            _514 = _612;
        }
        float _614 = _504;
        float _616 = _512;
        float _618 = _514;
        float2 _5850 = float2(_498, _370);
        float2 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5850, float2(0.0), isnan(_5850))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5850, float2(0.0), isnan(_5850))).xy;
        float _622 = _620.x;
        float _624 = _620.y;
        float _626 = fma(_622, 5.0, -3.75);
        float _628 = rint(_624);
        float _630 = abs(_626);
        float _632 = _622 * _630;
        float _634 = rint(_632);
        float _636 = _634 + _628;
        float _638 = _636 * 0.5;
        bool _640 = _638 >= 0.89999997615814208984375;
        bool _642 = isnan(_638);
        bool _644 = _640 || _642;
        bool _646 = isnan(0.89999997615814208984375);
        bool _648 = _644 || _646;
        bool _650 = !_648;
        float _652 = 0.0;
        float _654 = _634;
        float _656 = _638;
        float _658 = _636;
        float _660 = _614;
        int _662 = 1084227584;
        int _664 = 1084227584;
        float _666 = _618;
        float _668 = _616;
        float _750;
        float _790;
        float _792;
        if (!_650)
        {
            float _670 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _672 = _498 + _670;
            float _674 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _676 = _370 + _674;
            float2 _5913 = float2(_672, _676);
            float2 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5913, float2(0.0), isnan(_5913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5913, float2(0.0), isnan(_5913))).xy;
            float _680 = _678.x;
            float _682 = _678.y;
            float _684 = fma(_680, 5.0, -3.75);
            float _686 = rint(_682);
            float _688 = abs(_684);
            float _690 = _680 * _688;
            float _692 = rint(_690);
            float _694 = _692 + _686;
            float _696 = _694 * 0.5;
            bool _698 = _696 >= 0.89999997615814208984375;
            bool _700 = isnan(_696);
            bool _702 = _698 || _700;
            bool _704 = isnan(0.89999997615814208984375);
            bool _706 = _702 || _704;
            bool _708 = !_706;
            _652 = 1.0;
            _654 = _692;
            _656 = _696;
            _658 = _676;
            if (!_708)
            {
                float _710 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _712 = _672 + _710;
                float _714 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                float _716 = _676 + _714;
                float2 _5972 = float2(_712, _716);
                float2 _718 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_5972, float2(0.0), isnan(_5972))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_5972, float2(0.0), isnan(_5972))).xy;
                float _720 = _718.x;
                float _722 = _718.y;
                float _724 = fma(_720, 5.0, -3.75);
                float _726 = rint(_722);
                float _728 = abs(_724);
                float _730 = _720 * _728;
                float _732 = rint(_730);
                float _734 = _732 + _726;
                float _736 = _734 * 0.5;
                bool _738 = _736 >= 0.89999997615814208984375;
                bool _740 = isnan(_736);
                bool _742 = _738 || _740;
                bool _744 = isnan(0.89999997615814208984375);
                bool _746 = _742 || _744;
                bool _748 = !_746;
                _652 = 2.0;
                _654 = _732;
                _656 = _736;
                _658 = _716;
                _750 = _732;
                if (!_748)
                {
                    float _752 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _754 = _712 + _752;
                    float _756 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float _758 = _716 + _756;
                    float2 _6032 = float2(_754, _758);
                    float2 _760 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6032, float2(0.0), isnan(_6032))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6032, float2(0.0), isnan(_6032))).xy;
                    float _762 = _760.x;
                    float _764 = _760.y;
                    float _766 = fma(_762, 5.0, -3.75);
                    float _768 = rint(_764);
                    float _770 = abs(_766);
                    float _772 = _762 * _770;
                    float _774 = rint(_772);
                    float _776 = _774 + _768;
                    float _778 = _776 * 0.5;
                    bool _780 = _778 >= 0.89999997615814208984375;
                    bool _782 = isnan(_778);
                    bool _784 = _780 || _782;
                    bool _786 = isnan(0.89999997615814208984375);
                    bool _788 = _784 || _786;
                    _656 = _778;
                    _658 = _758;
                    _790 = _778;
                    _792 = _758;
                    _794 = _788;
                    if (!_794)
                    {
                        _652 = 3.0;
                    }
                }
            }
        }
        float _804;
        if (!_794)
        {
            float _796 = _652;
            float _798 = _654;
            float _800 = _656;
            float _802 = _658;
            _804 = _796;
            _750 = _798;
            _790 = _800;
            _792 = _802;
        }
        if (false || _794)
        {
            _794 = false;
            _804 = 3.0;
        }
        float _806 = _804;
        float _808 = _750;
        float _810 = _790;
        float _812 = _792;
        float2 _6103 = float2(_65, _67);
        float _814 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6103, float2(0.0), isnan(_6103)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6103, float2(0.0), isnan(_6103)), int2(1, 0)).x;
        bool _816 = _814 > 0.0;
        float _818 = _808;
        float _820 = _812;
        int _822 = as_type<int>(_810);
        if (!_816)
        {
            _818 = 0.0;
            _660 = 0.0;
        }
        float _824 = _818;
        float _826 = _660;
        bool _828 = !_816;
        float _830 = _824;
        float _832 = _826;
        if (!_828)
        {
            float _834 = _494 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _836 = _67 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float2 _6138 = float2(_834, _836);
            float2 _838 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6138, float2(0.0), isnan(_6138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6138, float2(0.0), isnan(_6138))).xy;
            float _840 = _838.x;
            float _842 = _838.y;
            float _844 = fma(_840, 5.0, -3.75);
            float _846 = rint(_842);
            float _848 = abs(_844);
            float _850 = _840 * _848;
            float _852 = rint(_850);
            float _854 = _852 + _846;
            float _856 = _854 * 0.5;
            bool _858 = _856 >= 0.89999997615814208984375;
            bool _860 = isnan(_856);
            bool _862 = _858 || _860;
            bool _864 = isnan(0.89999997615814208984375);
            bool _866 = _862 || _864;
            bool _868 = !_866;
            float _870 = _846;
            float _872 = 0.0;
            float _874 = _856;
            _820 = _834;
            if (!_868)
            {
                float _876 = _834 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _878 = _836 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                float2 _6193 = float2(_876, _878);
                float2 _880 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6193, float2(0.0), isnan(_6193))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6193, float2(0.0), isnan(_6193))).xy;
                float _882 = _880.x;
                float _884 = _880.y;
                float _886 = fma(_882, 5.0, -3.75);
                float _888 = rint(_884);
                float _890 = abs(_886);
                float _892 = _882 * _890;
                float _894 = rint(_892);
                float _896 = _894 + _888;
                float _898 = _896 * 0.5;
                bool _900 = _898 >= 0.89999997615814208984375;
                bool _902 = isnan(_898);
                bool _904 = _900 || _902;
                bool _906 = isnan(0.89999997615814208984375);
                bool _908 = _904 || _906;
                bool _910 = !_908;
                _870 = _888;
                _872 = 1.0;
                _874 = _898;
                if (!_910)
                {
                    float _912 = _876 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                    float _914 = _878 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                    float2 _6247 = float2(_912, _914);
                    float2 _916 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6247, float2(0.0), isnan(_6247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6247, float2(0.0), isnan(_6247))).xy;
                    float _918 = _916.x;
                    float _920 = _916.y;
                    float _922 = fma(_918, 5.0, -3.75);
                    float _924 = rint(_920);
                    float _926 = abs(_922);
                    float _928 = _918 * _926;
                    float _930 = rint(_928);
                    float _932 = _930 + _924;
                    float _934 = _932 * 0.5;
                    bool _936 = _934 >= 0.89999997615814208984375;
                    bool _938 = isnan(_934);
                    bool _940 = _936 || _938;
                    bool _942 = isnan(0.89999997615814208984375);
                    bool _944 = _940 || _942;
                    bool _946 = !_944;
                    _870 = _924;
                    _872 = 2.0;
                    _874 = _934;
                    if (!_946)
                    {
                        float _948 = _912 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
                        float _950 = _914 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
                        float2 _6301 = float2(_948, _950);
                        float2 _952 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6301, float2(0.0), isnan(_6301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6301, float2(0.0), isnan(_6301))).xy;
                        float _954 = _952.x;
                        float _956 = _952.y;
                        float _958 = fma(_954, 5.0, -3.75);
                        float _960 = rint(_956);
                        float _962 = abs(_958);
                        float _964 = _954 * _962;
                        float _966 = rint(_964);
                        float _968 = _966 + _960;
                        float _970 = _968 * 0.5;
                        bool _972 = _970 >= 0.89999997615814208984375;
                        bool _974 = isnan(_970);
                        bool _976 = _972 || _974;
                        bool _978 = isnan(0.89999997615814208984375);
                        bool _980 = _976 || _978;
                        _870 = _960;
                        _874 = _970;
                        _662 = as_type<int>(_966);
                        if (!_980)
                        {
                            _872 = 3.0;
                            _982 = true;
                        }
                        else
                        {
                            _872 = 3.0;
                        }
                    }
                }
            }
            _982 = false;
            float _984 = _870;
            float _986 = _872;
            float _988 = _874;
            int _990 = _662;
            bool _992 = _984 >= 0.89999997615814208984375;
            bool _994 = isnan(_984);
            bool _996 = _992 || _994;
            bool _998 = isnan(0.89999997615814208984375);
            bool _1000 = _996 || _998;
            float _1002 = float(_1000);
            float _1004 = _1002 + _986;
            _830 = _1004;
            _832 = _988;
            _664 = _990;
        }
        float _1006 = _830;
        float _1008 = _832;
        int _1010 = _664;
        float _1012 = _820;
        float _1014 = _806 + _1006;
        bool _1016 = _1014 > 2.0;
        bool _1018 = !_1016;
        int _1020 = _1010;
        int _1022 = as_type<int>(_1014);
        float _1024 = _1012;
        if (!_1018)
        {
            float _1026 = fma(_1006, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1028 = fma(_1006, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float _1030 = -_806;
            float _1032 = fma(_1030, (*spvDescriptorSet0.fp_c3)._m0[0].z, _65);
            float _1034 = -_806;
            float _1036 = fma(_1034, (*spvDescriptorSet0.fp_c3)._m0[0].w, _67);
            float2 _6418 = float2(_1026, _1028);
            float2 _1038 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6418, float2(0.0), isnan(_6418)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6418, float2(0.0), isnan(_6418)), int2(1, 0)).xy;
            float _1040 = _1038.x;
            float _1042 = _1038.y;
            float2 _6430 = float2(_1032, _1036);
            float _1044 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6430, float2(0.0), isnan(_6430)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6430, float2(0.0), isnan(_6430)), int2(-1, 0)).y;
            float2 _6438 = float2(_1032, _1036);
            float _1046 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6438, float2(0.0), isnan(_6438)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6438, float2(0.0), isnan(_6438)), int2(0, -1)).x;
            bool _1048 = _1008 >= 0.89999997615814208984375;
            bool _1050 = isnan(_1008);
            bool _1052 = _1048 || _1050;
            bool _1054 = isnan(0.89999997615814208984375);
            bool _1056 = _1052 || _1054;
            float _1058 = float(_1056);
            bool _1060 = _810 >= 0.89999997615814208984375;
            bool _1062 = isnan(_810);
            bool _1064 = _1060 || _1062;
            bool _1066 = isnan(0.89999997615814208984375);
            bool _1068 = _1064 || _1066;
            float _1070 = float(_1068);
            float _1072 = fma(_1042, 2.0, _1040);
            float _1074 = fma(_1044, 2.0, _1046);
            float _1076 = _1072 * _1058;
            float _1078 = _1074 * _1070;
            float _1080 = fma(_1076, 20.0, _1006);
            float _1082 = fma(_1078, 20.0, _806);
            float _1084 = fma(_1080, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _1086 = fma(_1082, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _1088 = fma((*spvDescriptorSet0.fp_c3)._m0[3].w, 0.14285714924335479736328125, _1084);
            float _1090 = _1086 + 0.5;
            float2 _6501 = float2(_1090, _1088);
            float2 _1092 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_6501, float2(0.0), isnan(_6501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_6501, float2(0.0), isnan(_6501))).xy;
            float _1094 = _1092.x;
            float _1096 = _1092.y;
            float _1098 = _1096 + _616;
            float _1100 = _1094 + _618;
            _666 = _1100;
            _668 = _1098;
            _1020 = 1011666125;
            _1022 = as_type<int>(_1090);
            _1024 = _1040;
        }
        float _1102 = _666;
        float _1104 = _668;
        int _1106 = _1020;
        int _1108 = _1022;
        float _1110 = _1024;
        float _1112 = -_1102;
        bool _1114 = _1104 != _1112;
        bool _1116 = isnan(_1104);
        bool _1118 = _1114 || _1116;
        bool _1120 = isnan(_1112);
        bool _1122 = _1118 || _1120;
        int _1124 = _1108;
        int _1126 = _1106;
        _182 = _1110;
        _212 = as_type<float>(_1106);
        _202 = as_type<int>(_1104);
        _204 = as_type<int>(_1102);
        if (_1122)
        {
            _1124 = 0;
        }
        int _1128 = _1124;
        _210 = _1128;
        if (!_1122)
        {
            float2 _6563 = float2(_153, _137);
            float2 _1130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6563, float2(0.0), isnan(_6563))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6563, float2(0.0), isnan(_6563))).xy;
            float _1132 = _1130.x;
            float _1134 = _1130.y;
            float2 _6575 = float2(_139, _141);
            float2 _1136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6575, float2(0.0), isnan(_6575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6575, float2(0.0), isnan(_6575))).xy;
            float _1138 = _1136.x;
            float _1140 = _1136.y;
            float _1142 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _153);
            float _1144 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _139);
            bool _1146 = _1134 >= 0.800000011920928955078125;
            bool _1148 = isnan(_1134);
            bool _1150 = _1146 || _1148;
            bool _1152 = isnan(0.800000011920928955078125);
            bool _1154 = _1150 || _1152;
            bool _1156 = _1140 > 0.800000011920928955078125;
            bool _1158 = isnan(_1140);
            bool _1160 = _1156 || _1158;
            bool _1162 = isnan(0.800000011920928955078125);
            bool _1164 = _1160 || _1162;
            bool _1166 = _1132 != 0.0;
            bool _1168 = isnan(_1132);
            bool _1170 = _1166 || _1168;
            bool _1172 = isnan(0.0);
            bool _1174 = _1170 || _1172;
            bool _1176 = !_1154;
            bool _1178 = _1174 || _1176;
            bool _1180 = _1138 != 0.0;
            bool _1182 = isnan(_1138);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan(0.0);
            bool _1188 = _1184 || _1186;
            bool _1190 = !_1164;
            bool _1192 = _1188 || _1190;
            float _1194 = _1132;
            float _1196 = _1134;
            int _1198 = as_type<int>(_1142);
            float _1200 = _1144;
            if (!_1178)
            {
                float2 _6659 = float2(_1142, _137);
                float2 _1202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6659, float2(0.0), isnan(_6659))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6659, float2(0.0), isnan(_6659))).xy;
                float _1204 = _1202.x;
                float _1206 = _1202.y;
                _1194 = _1204;
                _1196 = _1206;
            }
            float _1208 = _1194;
            float _1210 = _1196;
            float _1212 = _1138;
            float _1214 = _1140;
            if (!_1192)
            {
                float2 _6681 = float2(_1144, _141);
                float2 _1216 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6681, float2(0.0), isnan(_6681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6681, float2(0.0), isnan(_6681))).xy;
                float _1218 = _1216.x;
                float _1220 = _1216.y;
                _1212 = _1218;
                _1214 = _1220;
            }
            float _1222 = _1212;
            float _1224 = _1214;
            if (_1178)
            {
                _1126 = 1;
            }
            int _1226 = _1126;
            int _1228 = _1226;
            if (!_1178)
            {
                _1228 = 0;
            }
            int _1230 = _1228;
            int _1232 = _1230;
            if (_1178)
            {
                _178 = _1142;
            }
            float _1234 = _178;
            float _1236 = _1234;
            if (!_1178)
            {
                float _1238 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1142);
                _1236 = _1238;
            }
            float _1240 = _1236;
            int _1242 = _1230 & 1;
            bool _1244 = _1242 != 0;
            float _1246 = _1240;
            if (_1244)
            {
                _822 = _1230;
            }
            int _1248 = _822;
            int _1250 = _1248;
            int _1252 = _1248;
            float _1254 = _1210;
            float _1256 = _1208;
            float _1258 = _1224;
            float _1260 = _1222;
            if (!_1244)
            {
                bool _1262 = _1210 >= 0.800000011920928955078125;
                bool _1264 = isnan(_1210);
                bool _1266 = _1262 || _1264;
                bool _1268 = isnan(0.800000011920928955078125);
                bool _1270 = _1266 || _1268;
                bool _1272 = _1208 != 0.0;
                bool _1274 = isnan(_1208);
                bool _1276 = _1272 || _1274;
                bool _1278 = isnan(0.0);
                bool _1280 = _1276 || _1278;
                bool _1282 = !_1270;
                bool _1284 = _1280 || _1282;
                if (_1284)
                {
                    _1250 = 1;
                }
                int _1286 = _1250;
                _1252 = _1286;
                if (!_1284)
                {
                    float2 _6779 = float2(_1240, _137);
                    float2 _1288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6779, float2(0.0), isnan(_6779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6779, float2(0.0), isnan(_6779))).xy;
                    float _1290 = _1288.x;
                    float _1292 = _1288.y;
                    float _1294 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1240);
                    _1252 = _1230;
                    _1254 = _1292;
                    _1256 = _1290;
                    _1246 = _1294;
                }
            }
            int _1296 = _1252;
            float _1298 = _1254;
            float _1300 = _1256;
            float _1302 = _1246;
            int _1304 = _1296 & 1;
            bool _1306 = _1304 != 0;
            float _1308 = _1298;
            float _1310 = _1300;
            float _1312 = _1302;
            int _1314 = _1296;
            if (_1306)
            {
                _1198 = _1296;
            }
            int _1316 = _1198;
            int _1318 = _1316;
            int _1320 = _1316;
            if (!_1306)
            {
                bool _1322 = _1298 >= 0.800000011920928955078125;
                bool _1324 = isnan(_1298);
                bool _1326 = _1322 || _1324;
                bool _1328 = isnan(0.800000011920928955078125);
                bool _1330 = _1326 || _1328;
                bool _1332 = _1300 != 0.0;
                bool _1334 = isnan(_1300);
                bool _1336 = _1332 || _1334;
                bool _1338 = isnan(0.0);
                bool _1340 = _1336 || _1338;
                bool _1342 = !_1330;
                bool _1344 = _1340 || _1342;
                if (_1344)
                {
                    _1318 = 1;
                }
                int _1346 = _1318;
                _1320 = _1346;
                if (!_1344)
                {
                    float2 _6858 = float2(_1302, _137);
                    float2 _1348 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6858, float2(0.0), isnan(_6858))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6858, float2(0.0), isnan(_6858))).xy;
                    float _1350 = _1348.x;
                    float _1352 = _1348.y;
                    float _1354 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1302);
                    _1320 = _1296;
                    _1308 = _1352;
                    _1310 = _1350;
                    _1312 = _1354;
                }
            }
            int _1356 = _1320;
            float _1358 = _1308;
            float _1360 = _1310;
            float _1362 = _1312;
            int _1364 = _1356 & 1;
            bool _1366 = _1364 != 0;
            float _1368 = _1358;
            float _1370 = _1360;
            float _1372 = _1362;
            int _1374 = _1356;
            if (_1366)
            {
                _1232 = _1356;
            }
            int _1376 = _1232;
            int _1378 = _1376;
            int _1380 = _1376;
            if (!_1366)
            {
                bool _1382 = _1358 >= 0.800000011920928955078125;
                bool _1384 = isnan(_1358);
                bool _1386 = _1382 || _1384;
                bool _1388 = isnan(0.800000011920928955078125);
                bool _1390 = _1386 || _1388;
                bool _1392 = _1360 != 0.0;
                bool _1394 = isnan(_1360);
                bool _1396 = _1392 || _1394;
                bool _1398 = isnan(0.0);
                bool _1400 = _1396 || _1398;
                bool _1402 = !_1390;
                bool _1404 = _1400 || _1402;
                if (_1404)
                {
                    _1378 = 1;
                }
                int _1406 = _1378;
                _1380 = _1406;
                if (!_1404)
                {
                    float2 _6937 = float2(_1362, _137);
                    float2 _1408 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6937, float2(0.0), isnan(_6937))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6937, float2(0.0), isnan(_6937))).xy;
                    float _1410 = _1408.x;
                    float _1412 = _1408.y;
                    float _1414 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1362);
                    _1380 = _1356;
                    _1368 = _1412;
                    _1370 = _1410;
                    _1372 = _1414;
                }
            }
            int _1416 = _1380;
            float _1418 = _1368;
            float _1420 = _1370;
            float _1422 = _1372;
            int _1424 = _1416 & 1;
            bool _1426 = _1424 != 0;
            float _1428 = _1418;
            float _1430 = _1420;
            float _1432 = _1422;
            int _1434 = _1416;
            if (_1426)
            {
                _1374 = _1416;
            }
            int _1436 = _1374;
            int _1438 = _1436;
            int _1440 = _1436;
            if (!_1426)
            {
                bool _1442 = _1418 >= 0.800000011920928955078125;
                bool _1444 = isnan(_1418);
                bool _1446 = _1442 || _1444;
                bool _1448 = isnan(0.800000011920928955078125);
                bool _1450 = _1446 || _1448;
                bool _1452 = _1420 != 0.0;
                bool _1454 = isnan(_1420);
                bool _1456 = _1452 || _1454;
                bool _1458 = isnan(0.0);
                bool _1460 = _1456 || _1458;
                bool _1462 = !_1450;
                bool _1464 = _1460 || _1462;
                if (_1464)
                {
                    _1438 = 1;
                }
                int _1466 = _1438;
                _1440 = _1466;
                if (!_1464)
                {
                    float2 _7016 = float2(_1422, _137);
                    float2 _1468 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7016, float2(0.0), isnan(_7016))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7016, float2(0.0), isnan(_7016))).xy;
                    float _1470 = _1468.x;
                    float _1472 = _1468.y;
                    float _1474 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1422);
                    _1440 = _1416;
                    _1428 = _1472;
                    _1430 = _1470;
                    _1432 = _1474;
                }
            }
            int _1476 = _1440;
            float _1478 = _1428;
            float _1480 = _1430;
            float _1482 = _1432;
            int _1484 = _1476 & 1;
            bool _1486 = _1484 != 0;
            float _1488 = _1478;
            float _1490 = _1480;
            float _1492 = _1482;
            int _1494 = _1476;
            if (_1486)
            {
                _1434 = _1476;
            }
            int _1496 = _1434;
            int _1498 = _1496;
            int _1500 = _1496;
            if (!_1486)
            {
                bool _1502 = _1478 >= 0.800000011920928955078125;
                bool _1504 = isnan(_1478);
                bool _1506 = _1502 || _1504;
                bool _1508 = isnan(0.800000011920928955078125);
                bool _1510 = _1506 || _1508;
                bool _1512 = _1480 != 0.0;
                bool _1514 = isnan(_1480);
                bool _1516 = _1512 || _1514;
                bool _1518 = isnan(0.0);
                bool _1520 = _1516 || _1518;
                bool _1522 = !_1510;
                bool _1524 = _1520 || _1522;
                if (_1524)
                {
                    _1498 = 1;
                }
                int _1526 = _1498;
                _1500 = _1526;
                if (!_1524)
                {
                    float2 _7095 = float2(_1482, _137);
                    float2 _1528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7095, float2(0.0), isnan(_7095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7095, float2(0.0), isnan(_7095))).xy;
                    float _1530 = _1528.x;
                    float _1532 = _1528.y;
                    float _1534 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1482);
                    _1500 = _1476;
                    _1488 = _1532;
                    _1490 = _1530;
                    _1492 = _1534;
                }
            }
            int _1536 = _1500;
            float _1538 = _1488;
            float _1540 = _1490;
            float _1542 = _1492;
            int _1544 = _1536 & 1;
            bool _1546 = _1544 != 0;
            float _1548 = _1538;
            float _1550 = _1540;
            float _1552 = _1542;
            int _1554 = _1536;
            if (_1546)
            {
                _1494 = _1536;
            }
            int _1556 = _1494;
            int _1558 = _1556;
            int _1560 = _1556;
            if (!_1546)
            {
                bool _1562 = _1538 >= 0.800000011920928955078125;
                bool _1564 = isnan(_1538);
                bool _1566 = _1562 || _1564;
                bool _1568 = isnan(0.800000011920928955078125);
                bool _1570 = _1566 || _1568;
                bool _1572 = _1540 != 0.0;
                bool _1574 = isnan(_1540);
                bool _1576 = _1572 || _1574;
                bool _1578 = isnan(0.0);
                bool _1580 = _1576 || _1578;
                bool _1582 = !_1570;
                bool _1584 = _1580 || _1582;
                if (_1584)
                {
                    _1558 = 1;
                }
                int _1586 = _1558;
                _1560 = _1586;
                if (!_1584)
                {
                    float2 _7174 = float2(_1542, _137);
                    float2 _1588 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7174, float2(0.0), isnan(_7174))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7174, float2(0.0), isnan(_7174))).xy;
                    float _1590 = _1588.x;
                    float _1592 = _1588.y;
                    float _1594 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1542);
                    _1560 = _1536;
                    _1548 = _1592;
                    _1550 = _1590;
                    _1552 = _1594;
                }
            }
            int _1596 = _1560;
            float _1598 = _1548;
            float _1600 = _1550;
            float _1602 = _1552;
            int _1604 = _1596 & 1;
            bool _1606 = _1604 != 0;
            float _1608 = _1598;
            float _1610 = _1600;
            float _1612 = _1602;
            int _1614 = _1596;
            if (_1606)
            {
                _1554 = _1596;
            }
            int _1616 = _1554;
            int _1618 = _1616;
            int _1620 = _1616;
            if (!_1606)
            {
                bool _1622 = _1598 >= 0.800000011920928955078125;
                bool _1624 = isnan(_1598);
                bool _1626 = _1622 || _1624;
                bool _1628 = isnan(0.800000011920928955078125);
                bool _1630 = _1626 || _1628;
                bool _1632 = _1600 != 0.0;
                bool _1634 = isnan(_1600);
                bool _1636 = _1632 || _1634;
                bool _1638 = isnan(0.0);
                bool _1640 = _1636 || _1638;
                bool _1642 = !_1630;
                bool _1644 = _1640 || _1642;
                if (_1644)
                {
                    _1618 = 1;
                }
                int _1646 = _1618;
                _1620 = _1646;
                if (!_1644)
                {
                    float2 _7253 = float2(_1602, _137);
                    float2 _1648 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7253, float2(0.0), isnan(_7253))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7253, float2(0.0), isnan(_7253))).xy;
                    float _1650 = _1648.x;
                    float _1652 = _1648.y;
                    float _1654 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1602);
                    _1620 = _1596;
                    _1608 = _1652;
                    _1610 = _1650;
                    _1612 = _1654;
                }
            }
            int _1656 = _1620;
            float _1658 = _1608;
            float _1660 = _1610;
            float _1662 = _1612;
            int _1664 = _1656 & 1;
            bool _1666 = _1664 != 0;
            float _1668 = _1658;
            float _1670 = _1660;
            float _1672 = _1662;
            int _1674 = _1656;
            if (_1666)
            {
                _1614 = _1656;
            }
            int _1676 = _1614;
            int _1678 = _1676;
            int _1680 = _1676;
            if (!_1666)
            {
                bool _1682 = _1658 >= 0.800000011920928955078125;
                bool _1684 = isnan(_1658);
                bool _1686 = _1682 || _1684;
                bool _1688 = isnan(0.800000011920928955078125);
                bool _1690 = _1686 || _1688;
                bool _1692 = _1660 != 0.0;
                bool _1694 = isnan(_1660);
                bool _1696 = _1692 || _1694;
                bool _1698 = isnan(0.0);
                bool _1700 = _1696 || _1698;
                bool _1702 = !_1690;
                bool _1704 = _1700 || _1702;
                if (_1704)
                {
                    _1678 = 1;
                }
                int _1706 = _1678;
                _1680 = _1706;
                if (!_1704)
                {
                    float2 _7332 = float2(_1662, _137);
                    float2 _1708 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7332, float2(0.0), isnan(_7332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7332, float2(0.0), isnan(_7332))).xy;
                    float _1710 = _1708.x;
                    float _1712 = _1708.y;
                    float _1714 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1662);
                    _1680 = _1656;
                    _1668 = _1712;
                    _1670 = _1710;
                    _1672 = _1714;
                }
            }
            int _1716 = _1680;
            float _1718 = _1668;
            float _1720 = _1670;
            float _1722 = _1672;
            int _1724 = _1716 & 1;
            bool _1726 = _1724 != 0;
            float _1728 = _1718;
            float _1730 = _1720;
            float _1732 = _1722;
            int _1734 = _1716;
            if (_1726)
            {
                _1674 = _1716;
            }
            int _1736 = _1674;
            int _1738 = _1736;
            int _1740 = _1736;
            if (!_1726)
            {
                bool _1742 = _1718 >= 0.800000011920928955078125;
                bool _1744 = isnan(_1718);
                bool _1746 = _1742 || _1744;
                bool _1748 = isnan(0.800000011920928955078125);
                bool _1750 = _1746 || _1748;
                bool _1752 = _1720 != 0.0;
                bool _1754 = isnan(_1720);
                bool _1756 = _1752 || _1754;
                bool _1758 = isnan(0.0);
                bool _1760 = _1756 || _1758;
                bool _1762 = !_1750;
                bool _1764 = _1760 || _1762;
                if (_1764)
                {
                    _1738 = 1;
                }
                int _1766 = _1738;
                _1740 = _1766;
                if (!_1764)
                {
                    float2 _7411 = float2(_1722, _137);
                    float2 _1768 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7411, float2(0.0), isnan(_7411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7411, float2(0.0), isnan(_7411))).xy;
                    float _1770 = _1768.x;
                    float _1772 = _1768.y;
                    float _1774 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1722);
                    _1740 = _1716;
                    _1728 = _1772;
                    _1730 = _1770;
                    _1732 = _1774;
                }
            }
            int _1776 = _1740;
            float _1778 = _1728;
            float _1780 = _1730;
            float _1782 = _1732;
            int _1784 = _1776 & 1;
            bool _1786 = _1784 != 0;
            float _1788 = _1778;
            float _1790 = _1780;
            float _1792 = _1782;
            int _1794 = _1776;
            if (_1786)
            {
                _1734 = _1776;
            }
            int _1796 = _1734;
            int _1798 = _1796;
            int _1800 = _1796;
            if (!_1786)
            {
                bool _1802 = _1778 >= 0.800000011920928955078125;
                bool _1804 = isnan(_1778);
                bool _1806 = _1802 || _1804;
                bool _1808 = isnan(0.800000011920928955078125);
                bool _1810 = _1806 || _1808;
                bool _1812 = _1780 != 0.0;
                bool _1814 = isnan(_1780);
                bool _1816 = _1812 || _1814;
                bool _1818 = isnan(0.0);
                bool _1820 = _1816 || _1818;
                bool _1822 = !_1810;
                bool _1824 = _1820 || _1822;
                if (_1824)
                {
                    _1798 = 1;
                }
                int _1826 = _1798;
                _1800 = _1826;
                if (!_1824)
                {
                    float2 _7490 = float2(_1782, _137);
                    float2 _1828 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7490, float2(0.0), isnan(_7490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7490, float2(0.0), isnan(_7490))).xy;
                    float _1830 = _1828.x;
                    float _1832 = _1828.y;
                    float _1834 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1782);
                    _1800 = _1776;
                    _1788 = _1832;
                    _1790 = _1830;
                    _1792 = _1834;
                }
            }
            int _1836 = _1800;
            float _1838 = _1788;
            float _1840 = _1790;
            float _1842 = _1792;
            int _1844 = _1836 & 1;
            bool _1846 = _1844 != 0;
            float _1848 = _1838;
            float _1850 = _1840;
            float _1852 = _1842;
            int _1854 = _1836;
            if (_1846)
            {
                _1794 = _1836;
            }
            int _1856 = _1794;
            int _1858 = _1856;
            int _1860 = _1856;
            if (!_1846)
            {
                bool _1862 = _1838 >= 0.800000011920928955078125;
                bool _1864 = isnan(_1838);
                bool _1866 = _1862 || _1864;
                bool _1868 = isnan(0.800000011920928955078125);
                bool _1870 = _1866 || _1868;
                bool _1872 = _1840 != 0.0;
                bool _1874 = isnan(_1840);
                bool _1876 = _1872 || _1874;
                bool _1878 = isnan(0.0);
                bool _1880 = _1876 || _1878;
                bool _1882 = !_1870;
                bool _1884 = _1880 || _1882;
                if (_1884)
                {
                    _1858 = 1;
                }
                int _1886 = _1858;
                _1860 = _1886;
                if (!_1884)
                {
                    float2 _7569 = float2(_1842, _137);
                    float2 _1888 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7569, float2(0.0), isnan(_7569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7569, float2(0.0), isnan(_7569))).xy;
                    float _1890 = _1888.x;
                    float _1892 = _1888.y;
                    float _1894 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1842);
                    _1860 = _1836;
                    _1848 = _1892;
                    _1850 = _1890;
                    _1852 = _1894;
                }
            }
            int _1896 = _1860;
            float _1898 = _1848;
            float _1900 = _1850;
            float _1902 = _1852;
            int _1904 = _1896 & 1;
            bool _1906 = _1904 != 0;
            float _1908 = _1898;
            float _1910 = _1900;
            float _1912 = _1902;
            int _1914 = _1896;
            if (_1906)
            {
                _1854 = _1896;
            }
            int _1916 = _1854;
            int _1918 = _1916;
            int _1920 = _1916;
            if (!_1906)
            {
                bool _1922 = _1898 >= 0.800000011920928955078125;
                bool _1924 = isnan(_1898);
                bool _1926 = _1922 || _1924;
                bool _1928 = isnan(0.800000011920928955078125);
                bool _1930 = _1926 || _1928;
                bool _1932 = _1900 != 0.0;
                bool _1934 = isnan(_1900);
                bool _1936 = _1932 || _1934;
                bool _1938 = isnan(0.0);
                bool _1940 = _1936 || _1938;
                bool _1942 = !_1930;
                bool _1944 = _1940 || _1942;
                if (_1944)
                {
                    _1918 = 1;
                }
                int _1946 = _1918;
                _1920 = _1946;
                if (!_1944)
                {
                    float2 _7648 = float2(_1902, _137);
                    float2 _1948 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7648, float2(0.0), isnan(_7648))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7648, float2(0.0), isnan(_7648))).xy;
                    float _1950 = _1948.x;
                    float _1952 = _1948.y;
                    float _1954 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1902);
                    _1920 = _1896;
                    _1908 = _1952;
                    _1910 = _1950;
                    _1912 = _1954;
                }
            }
            int _1956 = _1920;
            float _1958 = _1908;
            float _1960 = _1910;
            float _1962 = _1912;
            int _1964 = _1956 & 1;
            bool _1966 = _1964 != 0;
            float _1968 = _1962;
            float _1970 = _1958;
            float _1972 = _1960;
            float _1974 = as_type<float>(_1956);
            if (_1192)
            {
                _1314 = 1;
            }
            int _1976 = _1314;
            int _1978 = _1976;
            if (!_1192)
            {
                _1978 = 0;
            }
            int _1980 = _1978;
            int _1982 = _1980 & 1;
            bool _1984 = _1982 != 0;
            if (_1966)
            {
                _1914 = _1956;
            }
            int _1986 = _1914;
            int _1988 = _1986;
            int _1990 = _1986;
            if (!_1966)
            {
                bool _1992 = _1958 >= 0.800000011920928955078125;
                bool _1994 = isnan(_1958);
                bool _1996 = _1992 || _1994;
                bool _1998 = isnan(0.800000011920928955078125);
                bool _2000 = _1996 || _1998;
                bool _2002 = _1960 != 0.0;
                bool _2004 = isnan(_1960);
                bool _2006 = _2002 || _2004;
                bool _2008 = isnan(0.0);
                bool _2010 = _2006 || _2008;
                bool _2012 = !_2000;
                bool _2014 = _2010 || _2012;
                if (_2014)
                {
                    _1988 = 1;
                }
                int _2016 = _1988;
                _1990 = _2016;
                if (!_2014)
                {
                    float2 _7742 = float2(_1962, _137);
                    float2 _2018 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7742, float2(0.0), isnan(_7742))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7742, float2(0.0), isnan(_7742))).xy;
                    float _2020 = _2018.x;
                    float _2022 = _2018.y;
                    float _2024 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _1962);
                    _1990 = _1956;
                    _1968 = _2024;
                    _1970 = _2022;
                    _1972 = _2020;
                }
            }
            int _2026 = _1990;
            float _2028 = _1968;
            float _2030 = _1970;
            float _2032 = _1972;
            int _2034 = _2026 & 1;
            bool _2036 = _2034 != 0;
            float _2038 = _2032;
            float _2040 = _2030;
            int _2042 = as_type<int>(_2028);
            if (_1192)
            {
                _1974 = _1144;
            }
            float _2044 = _1974;
            float _2046 = _2044;
            if (!_1192)
            {
                float _2048 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _1144);
                _2046 = _2048;
            }
            float _2050 = _2046;
            float _2052 = _2050;
            if (_2036)
            {
                _1200 = _2028;
            }
            float _2054 = _1200;
            float _2056 = _2054;
            float _2058 = _2054;
            if (!_2036)
            {
                bool _2060 = _2030 >= 0.800000011920928955078125;
                bool _2062 = isnan(_2030);
                bool _2064 = _2060 || _2062;
                bool _2066 = isnan(0.800000011920928955078125);
                bool _2068 = _2064 || _2066;
                bool _2070 = _2032 != 0.0;
                bool _2072 = isnan(_2032);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan(0.0);
                bool _2078 = _2074 || _2076;
                bool _2080 = !_2068;
                bool _2082 = _2078 || _2080;
                if (_2082)
                {
                    _2056 = _2028;
                }
                float _2084 = _2056;
                _2058 = _2084;
                if (!_2082)
                {
                    float2 _7839 = float2(_2028, _137);
                    float2 _2086 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7839, float2(0.0), isnan(_7839))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7839, float2(0.0), isnan(_7839))).xy;
                    float _2088 = _2086.x;
                    float _2090 = _2086.y;
                    float _2092 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _2028);
                    _2038 = _2088;
                    _2040 = _2090;
                    _2058 = _2092;
                }
            }
            float _2094 = _2038;
            float _2096 = _2040;
            float _2098 = _2058;
            if (_1984)
            {
                _2042 = _1980;
            }
            int _2100 = _2042;
            int _2102 = _2100;
            int _2104 = _2100;
            if (!_1984)
            {
                bool _2106 = _1224 > 0.800000011920928955078125;
                bool _2108 = isnan(_1224);
                bool _2110 = _2106 || _2108;
                bool _2112 = isnan(0.800000011920928955078125);
                bool _2114 = _2110 || _2112;
                bool _2116 = _1222 != 0.0;
                bool _2118 = isnan(_1222);
                bool _2120 = _2116 || _2118;
                bool _2122 = isnan(0.0);
                bool _2124 = _2120 || _2122;
                bool _2126 = !_2114;
                bool _2128 = _2124 || _2126;
                if (_2128)
                {
                    _2102 = 1;
                }
                int _2130 = _2102;
                _2104 = _2130;
                if (!_2128)
                {
                    float2 _7908 = float2(_2050, _141);
                    float2 _2132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7908, float2(0.0), isnan(_7908))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7908, float2(0.0), isnan(_7908))).xy;
                    float _2134 = _2132.x;
                    float _2136 = _2132.y;
                    float _2138 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2050);
                    _2104 = _1980;
                    _1258 = _2136;
                    _1260 = _2134;
                    _2052 = _2138;
                }
            }
            int _2140 = _2104;
            float _2142 = _1258;
            float _2144 = _1260;
            float _2146 = _2052;
            int _2148 = _2140 & 1;
            bool _2150 = _2148 != 0;
            float _2152 = _2142;
            float _2154 = _2144;
            float _2156 = _2146;
            int _2158 = _2140;
            if (_2150)
            {
                _180 = _2140;
            }
            int _2160 = _180;
            int _2162 = _2160;
            int _2164 = _2160;
            if (!_2150)
            {
                bool _2166 = _2142 > 0.800000011920928955078125;
                bool _2168 = isnan(_2142);
                bool _2170 = _2166 || _2168;
                bool _2172 = isnan(0.800000011920928955078125);
                bool _2174 = _2170 || _2172;
                bool _2176 = _2144 != 0.0;
                bool _2178 = isnan(_2144);
                bool _2180 = _2176 || _2178;
                bool _2182 = isnan(0.0);
                bool _2184 = _2180 || _2182;
                bool _2186 = !_2174;
                bool _2188 = _2184 || _2186;
                if (_2188)
                {
                    _2162 = 1;
                }
                int _2190 = _2162;
                _2164 = _2190;
                if (!_2188)
                {
                    float2 _7987 = float2(_2146, _141);
                    float2 _2192 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7987, float2(0.0), isnan(_7987))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7987, float2(0.0), isnan(_7987))).xy;
                    float _2194 = _2192.x;
                    float _2196 = _2192.y;
                    float _2198 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2146);
                    _2164 = _2140;
                    _2152 = _2196;
                    _2154 = _2194;
                    _2156 = _2198;
                }
            }
            int _2200 = _2164;
            float _2202 = _2152;
            float _2204 = _2154;
            float _2206 = _2156;
            int _2208 = _2200 & 1;
            bool _2210 = _2208 != 0;
            float _2212 = _2202;
            float _2214 = _2204;
            float _2216 = _2206;
            int _2218 = _2200;
            if (_2210)
            {
                _2158 = _2200;
            }
            int _2220 = _2158;
            int _2222 = _2220;
            int _2224 = _2220;
            if (!_2210)
            {
                bool _2226 = _2202 > 0.800000011920928955078125;
                bool _2228 = isnan(_2202);
                bool _2230 = _2226 || _2228;
                bool _2232 = isnan(0.800000011920928955078125);
                bool _2234 = _2230 || _2232;
                bool _2236 = _2204 != 0.0;
                bool _2238 = isnan(_2204);
                bool _2240 = _2236 || _2238;
                bool _2242 = isnan(0.0);
                bool _2244 = _2240 || _2242;
                bool _2246 = !_2234;
                bool _2248 = _2244 || _2246;
                if (_2248)
                {
                    _2222 = 1;
                }
                int _2250 = _2222;
                _2224 = _2250;
                if (!_2248)
                {
                    float2 _8066 = float2(_2206, _141);
                    float2 _2252 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8066, float2(0.0), isnan(_8066))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8066, float2(0.0), isnan(_8066))).xy;
                    float _2254 = _2252.x;
                    float _2256 = _2252.y;
                    float _2258 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2206);
                    _2224 = _2200;
                    _2212 = _2256;
                    _2214 = _2254;
                    _2216 = _2258;
                }
            }
            int _2260 = _2224;
            float _2262 = _2212;
            float _2264 = _2214;
            float _2266 = _2216;
            int _2268 = _2260 & 1;
            bool _2270 = _2268 != 0;
            float _2272 = _2262;
            float _2274 = _2264;
            float _2276 = _2266;
            int _2278 = _2260;
            if (_2270)
            {
                _2218 = _2260;
            }
            int _2280 = _2218;
            int _2282 = _2280;
            int _2284 = _2280;
            if (!_2270)
            {
                bool _2286 = _2262 > 0.800000011920928955078125;
                bool _2288 = isnan(_2262);
                bool _2290 = _2286 || _2288;
                bool _2292 = isnan(0.800000011920928955078125);
                bool _2294 = _2290 || _2292;
                bool _2296 = _2264 != 0.0;
                bool _2298 = isnan(_2264);
                bool _2300 = _2296 || _2298;
                bool _2302 = isnan(0.0);
                bool _2304 = _2300 || _2302;
                bool _2306 = !_2294;
                bool _2308 = _2304 || _2306;
                if (_2308)
                {
                    _2282 = 1;
                }
                int _2310 = _2282;
                _2284 = _2310;
                if (!_2308)
                {
                    float2 _8145 = float2(_2266, _141);
                    float2 _2312 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8145, float2(0.0), isnan(_8145))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8145, float2(0.0), isnan(_8145))).xy;
                    float _2314 = _2312.x;
                    float _2316 = _2312.y;
                    float _2318 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2266);
                    _2284 = _2260;
                    _2272 = _2316;
                    _2274 = _2314;
                    _2276 = _2318;
                }
            }
            int _2320 = _2284;
            float _2322 = _2272;
            float _2324 = _2274;
            float _2326 = _2276;
            int _2328 = _2320 & 1;
            bool _2330 = _2328 != 0;
            float _2332 = _2322;
            float _2334 = _2324;
            float _2336 = _2326;
            int _2338 = _2320;
            if (_2330)
            {
                _2278 = _2320;
            }
            int _2340 = _2278;
            int _2342 = _2340;
            int _2344 = _2340;
            if (!_2330)
            {
                bool _2346 = _2322 > 0.800000011920928955078125;
                bool _2348 = isnan(_2322);
                bool _2350 = _2346 || _2348;
                bool _2352 = isnan(0.800000011920928955078125);
                bool _2354 = _2350 || _2352;
                bool _2356 = _2324 != 0.0;
                bool _2358 = isnan(_2324);
                bool _2360 = _2356 || _2358;
                bool _2362 = isnan(0.0);
                bool _2364 = _2360 || _2362;
                bool _2366 = !_2354;
                bool _2368 = _2364 || _2366;
                if (_2368)
                {
                    _2342 = 1;
                }
                int _2370 = _2342;
                _2344 = _2370;
                if (!_2368)
                {
                    float2 _8224 = float2(_2326, _141);
                    float2 _2372 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8224, float2(0.0), isnan(_8224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8224, float2(0.0), isnan(_8224))).xy;
                    float _2374 = _2372.x;
                    float _2376 = _2372.y;
                    float _2378 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2326);
                    _2344 = _2320;
                    _2332 = _2376;
                    _2334 = _2374;
                    _2336 = _2378;
                }
            }
            int _2380 = _2344;
            float _2382 = _2332;
            float _2384 = _2334;
            float _2386 = _2336;
            int _2388 = _2380 & 1;
            bool _2390 = _2388 != 0;
            float _2392 = _2382;
            float _2394 = _2384;
            float _2396 = _2386;
            int _2398 = _2380;
            if (_2390)
            {
                _2338 = _2380;
            }
            int _2400 = _2338;
            int _2402 = _2400;
            int _2404 = _2400;
            if (!_2390)
            {
                bool _2406 = _2382 > 0.800000011920928955078125;
                bool _2408 = isnan(_2382);
                bool _2410 = _2406 || _2408;
                bool _2412 = isnan(0.800000011920928955078125);
                bool _2414 = _2410 || _2412;
                bool _2416 = _2384 != 0.0;
                bool _2418 = isnan(_2384);
                bool _2420 = _2416 || _2418;
                bool _2422 = isnan(0.0);
                bool _2424 = _2420 || _2422;
                bool _2426 = !_2414;
                bool _2428 = _2424 || _2426;
                if (_2428)
                {
                    _2402 = 1;
                }
                int _2430 = _2402;
                _2404 = _2430;
                if (!_2428)
                {
                    float2 _8303 = float2(_2386, _141);
                    float2 _2432 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8303, float2(0.0), isnan(_8303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8303, float2(0.0), isnan(_8303))).xy;
                    float _2434 = _2432.x;
                    float _2436 = _2432.y;
                    float _2438 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2386);
                    _2404 = _2380;
                    _2392 = _2436;
                    _2394 = _2434;
                    _2396 = _2438;
                }
            }
            int _2440 = _2404;
            float _2442 = _2392;
            float _2444 = _2394;
            float _2446 = _2396;
            int _2448 = _2440 & 1;
            bool _2450 = _2448 != 0;
            float _2452 = _2442;
            float _2454 = _2444;
            float _2456 = _2446;
            int _2458 = _2440;
            if (_2450)
            {
                _2398 = _2440;
            }
            int _2460 = _2398;
            int _2462 = _2460;
            int _2464 = _2460;
            if (!_2450)
            {
                bool _2466 = _2442 > 0.800000011920928955078125;
                bool _2468 = isnan(_2442);
                bool _2470 = _2466 || _2468;
                bool _2472 = isnan(0.800000011920928955078125);
                bool _2474 = _2470 || _2472;
                bool _2476 = _2444 != 0.0;
                bool _2478 = isnan(_2444);
                bool _2480 = _2476 || _2478;
                bool _2482 = isnan(0.0);
                bool _2484 = _2480 || _2482;
                bool _2486 = !_2474;
                bool _2488 = _2484 || _2486;
                if (_2488)
                {
                    _2462 = 1;
                }
                int _2490 = _2462;
                _2464 = _2490;
                if (!_2488)
                {
                    float2 _8382 = float2(_2446, _141);
                    float2 _2492 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8382, float2(0.0), isnan(_8382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8382, float2(0.0), isnan(_8382))).xy;
                    float _2494 = _2492.x;
                    float _2496 = _2492.y;
                    float _2498 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2446);
                    _2464 = _2440;
                    _2452 = _2496;
                    _2454 = _2494;
                    _2456 = _2498;
                }
            }
            int _2500 = _2464;
            float _2502 = _2452;
            float _2504 = _2454;
            float _2506 = _2456;
            int _2508 = _2500 & 1;
            bool _2510 = _2508 != 0;
            float _2512 = _2502;
            float _2514 = _2504;
            float _2516 = _2506;
            int _2518 = _2500;
            if (_2510)
            {
                _2458 = _2500;
            }
            int _2520 = _2458;
            int _2522 = _2520;
            int _2524 = _2520;
            if (!_2510)
            {
                bool _2526 = _2502 > 0.800000011920928955078125;
                bool _2528 = isnan(_2502);
                bool _2530 = _2526 || _2528;
                bool _2532 = isnan(0.800000011920928955078125);
                bool _2534 = _2530 || _2532;
                bool _2536 = _2504 != 0.0;
                bool _2538 = isnan(_2504);
                bool _2540 = _2536 || _2538;
                bool _2542 = isnan(0.0);
                bool _2544 = _2540 || _2542;
                bool _2546 = !_2534;
                bool _2548 = _2544 || _2546;
                if (_2548)
                {
                    _2522 = 1;
                }
                int _2550 = _2522;
                _2524 = _2550;
                if (!_2548)
                {
                    float2 _8461 = float2(_2506, _141);
                    float2 _2552 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8461, float2(0.0), isnan(_8461))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8461, float2(0.0), isnan(_8461))).xy;
                    float _2554 = _2552.x;
                    float _2556 = _2552.y;
                    float _2558 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2506);
                    _2524 = _2500;
                    _2512 = _2556;
                    _2514 = _2554;
                    _2516 = _2558;
                }
            }
            int _2560 = _2524;
            float _2562 = _2512;
            float _2564 = _2514;
            float _2566 = _2516;
            int _2568 = _2560 & 1;
            bool _2570 = _2568 != 0;
            float _2572 = _2562;
            float _2574 = _2564;
            float _2576 = _2566;
            int _2578 = _2560;
            if (_2570)
            {
                _2518 = _2560;
            }
            int _2580 = _2518;
            int _2582 = _2580;
            int _2584 = _2580;
            if (!_2570)
            {
                bool _2586 = _2562 > 0.800000011920928955078125;
                bool _2588 = isnan(_2562);
                bool _2590 = _2586 || _2588;
                bool _2592 = isnan(0.800000011920928955078125);
                bool _2594 = _2590 || _2592;
                bool _2596 = _2564 != 0.0;
                bool _2598 = isnan(_2564);
                bool _2600 = _2596 || _2598;
                bool _2602 = isnan(0.0);
                bool _2604 = _2600 || _2602;
                bool _2606 = !_2594;
                bool _2608 = _2604 || _2606;
                if (_2608)
                {
                    _2582 = 1;
                }
                int _2610 = _2582;
                _2584 = _2610;
                if (!_2608)
                {
                    float2 _8540 = float2(_2566, _141);
                    float2 _2612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8540, float2(0.0), isnan(_8540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8540, float2(0.0), isnan(_8540))).xy;
                    float _2614 = _2612.x;
                    float _2616 = _2612.y;
                    float _2618 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2566);
                    _2584 = _2560;
                    _2572 = _2616;
                    _2574 = _2614;
                    _2576 = _2618;
                }
            }
            int _2620 = _2584;
            float _2622 = _2572;
            float _2624 = _2574;
            float _2626 = _2576;
            int _2628 = _2620 & 1;
            bool _2630 = _2628 != 0;
            float _2632 = _2622;
            float _2634 = _2624;
            float _2636 = _2626;
            int _2638 = _2620;
            if (_2630)
            {
                _2578 = _2620;
            }
            int _2640 = _2578;
            int _2642 = _2640;
            int _2644 = _2640;
            if (!_2630)
            {
                bool _2646 = _2622 > 0.800000011920928955078125;
                bool _2648 = isnan(_2622);
                bool _2650 = _2646 || _2648;
                bool _2652 = isnan(0.800000011920928955078125);
                bool _2654 = _2650 || _2652;
                bool _2656 = _2624 != 0.0;
                bool _2658 = isnan(_2624);
                bool _2660 = _2656 || _2658;
                bool _2662 = isnan(0.0);
                bool _2664 = _2660 || _2662;
                bool _2666 = !_2654;
                bool _2668 = _2664 || _2666;
                if (_2668)
                {
                    _2642 = 1;
                }
                int _2670 = _2642;
                _2644 = _2670;
                if (!_2668)
                {
                    float2 _8619 = float2(_2626, _141);
                    float2 _2672 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8619, float2(0.0), isnan(_8619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8619, float2(0.0), isnan(_8619))).xy;
                    float _2674 = _2672.x;
                    float _2676 = _2672.y;
                    float _2678 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2626);
                    _2644 = _2620;
                    _2632 = _2676;
                    _2634 = _2674;
                    _2636 = _2678;
                }
            }
            int _2680 = _2644;
            float _2682 = _2632;
            float _2684 = _2634;
            float _2686 = _2636;
            int _2688 = _2680 & 1;
            bool _2690 = _2688 != 0;
            float _2692 = _2682;
            float _2694 = _2684;
            float _2696 = _2686;
            int _2698 = _2680;
            if (_2690)
            {
                _2638 = _2680;
            }
            int _2700 = _2638;
            int _2702 = _2700;
            int _2704 = _2700;
            if (!_2690)
            {
                bool _2706 = _2682 > 0.800000011920928955078125;
                bool _2708 = isnan(_2682);
                bool _2710 = _2706 || _2708;
                bool _2712 = isnan(0.800000011920928955078125);
                bool _2714 = _2710 || _2712;
                bool _2716 = _2684 != 0.0;
                bool _2718 = isnan(_2684);
                bool _2720 = _2716 || _2718;
                bool _2722 = isnan(0.0);
                bool _2724 = _2720 || _2722;
                bool _2726 = !_2714;
                bool _2728 = _2724 || _2726;
                if (_2728)
                {
                    _2702 = 1;
                }
                int _2730 = _2702;
                _2704 = _2730;
                if (!_2728)
                {
                    float2 _8698 = float2(_2686, _141);
                    float2 _2732 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8698, float2(0.0), isnan(_8698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8698, float2(0.0), isnan(_8698))).xy;
                    float _2734 = _2732.x;
                    float _2736 = _2732.y;
                    float _2738 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2686);
                    _2704 = _2680;
                    _2692 = _2736;
                    _2694 = _2734;
                    _2696 = _2738;
                }
            }
            int _2740 = _2704;
            float _2742 = _2692;
            float _2744 = _2694;
            float _2746 = _2696;
            int _2748 = _2740 & 1;
            bool _2750 = _2748 != 0;
            float _2752 = _2742;
            float _2754 = _2744;
            float _2756 = _2746;
            int _2758 = _2740;
            if (_2750)
            {
                _2698 = _2740;
            }
            int _2760 = _2698;
            int _2762 = _2760;
            int _2764 = _2760;
            if (!_2750)
            {
                bool _2766 = _2742 > 0.800000011920928955078125;
                bool _2768 = isnan(_2742);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan(0.800000011920928955078125);
                bool _2774 = _2770 || _2772;
                bool _2776 = _2744 != 0.0;
                bool _2778 = isnan(_2744);
                bool _2780 = _2776 || _2778;
                bool _2782 = isnan(0.0);
                bool _2784 = _2780 || _2782;
                bool _2786 = !_2774;
                bool _2788 = _2784 || _2786;
                if (_2788)
                {
                    _2762 = 1;
                }
                int _2790 = _2762;
                _2764 = _2790;
                if (!_2788)
                {
                    float2 _8777 = float2(_2746, _141);
                    float2 _2792 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8777, float2(0.0), isnan(_8777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8777, float2(0.0), isnan(_8777))).xy;
                    float _2794 = _2792.x;
                    float _2796 = _2792.y;
                    float _2798 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2746);
                    _2764 = _2740;
                    _2752 = _2796;
                    _2754 = _2794;
                    _2756 = _2798;
                }
            }
            int _2800 = _2764;
            float _2802 = _2752;
            float _2804 = _2754;
            float _2806 = _2756;
            int _2808 = _2800 & 1;
            bool _2810 = _2808 != 0;
            float _2812 = _2802;
            float _2814 = _2804;
            float _2816 = _2806;
            if (_2810)
            {
                _2758 = _2800;
            }
            int _2818 = _2758;
            int _2820 = _2818;
            int _2822 = _2818;
            if (!_2810)
            {
                bool _2824 = _2802 > 0.800000011920928955078125;
                bool _2826 = isnan(_2802);
                bool _2828 = _2824 || _2826;
                bool _2830 = isnan(0.800000011920928955078125);
                bool _2832 = _2828 || _2830;
                bool _2834 = _2804 != 0.0;
                bool _2836 = isnan(_2804);
                bool _2838 = _2834 || _2836;
                bool _2840 = isnan(0.0);
                bool _2842 = _2838 || _2840;
                bool _2844 = !_2832;
                bool _2846 = _2842 || _2844;
                if (_2846)
                {
                    _2820 = 1;
                }
                int _2848 = _2820;
                _2822 = _2848;
                if (!_2846)
                {
                    float2 _8855 = float2(_2806, _141);
                    float2 _2850 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8855, float2(0.0), isnan(_8855))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8855, float2(0.0), isnan(_8855))).xy;
                    float _2852 = _2850.x;
                    float _2854 = _2850.y;
                    float _2856 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2806);
                    _2822 = _2800;
                    _2812 = _2854;
                    _2814 = _2852;
                    _2816 = _2856;
                }
            }
            int _2858 = _2822;
            float _2860 = _2812;
            float _2862 = _2814;
            float _2864 = _2816;
            int _2866 = _2858 & 1;
            bool _2868 = _2866 != 0;
            float _2870 = _2862;
            float _2872 = _2860;
            float _2874 = _2864;
            if (!_2868)
            {
                bool _2876 = _2860 > 0.800000011920928955078125;
                bool _2878 = isnan(_2860);
                bool _2880 = _2876 || _2878;
                bool _2882 = isnan(0.800000011920928955078125);
                bool _2884 = _2880 || _2882;
                bool _2886 = _2862 != 0.0;
                bool _2888 = isnan(_2862);
                bool _2890 = _2886 || _2888;
                bool _2892 = isnan(0.0);
                bool _2894 = _2890 || _2892;
                bool _2896 = !_2884;
                bool _2898 = _2894 || _2896;
                if (!_2898)
                {
                    float2 _8921 = float2(_2864, _141);
                    float2 _2900 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8921, float2(0.0), isnan(_8921))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8921, float2(0.0), isnan(_8921))).xy;
                    float _2902 = _2900.x;
                    float _2904 = _2900.y;
                    float _2906 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _2864);
                    _2870 = _2902;
                    _2872 = _2904;
                    _2874 = _2906;
                }
            }
            float _2908 = _2870;
            float _2910 = _2872;
            float _2912 = _2874;
            float _2914 = fma(_2908, 0.5, 0.5234375);
            float _2916 = fma(_2094, 0.5, 0.0078125);
            float _2918 = fma(_2910, 2.0, 0.03125);
            float _2920 = fma(_2096, 2.0, 0.03125);
            float2 _8956 = float2(_2914, _2918);
            float _2922 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_8956, float2(0.0), isnan(_8956))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_8956, float2(0.0), isnan(_8956))).x;
            float2 _8964 = float2(_2916, _2920);
            float _2924 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_8964, float2(0.0), isnan(_8964))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_8964, float2(0.0), isnan(_8964))).x;
            float _2926 = fma(_2922, -2.007874011993408203125, 3.25);
            float _2928 = fma(_2924, -2.007874011993408203125, 3.25);
            float _2930 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _2932 = fma(_2926, _2930, _2912);
            float _2934 = fma(_2928, (*spvDescriptorSet0.fp_c3)._m0[0].z, _2098);
            float2 _8990 = float2(_2932, _155);
            float _2936 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8990, float2(0.0), isnan(_8990)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8990, float2(0.0), isnan(_8990)), int2(1, 0)).x;
            float2 _8998 = float2(_2934, _155);
            float _2938 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8998, float2(0.0), isnan(_8998))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8998, float2(0.0), isnan(_8998))).x;
            float _2940 = -_149;
            float _2942 = fma(_2934, (*spvDescriptorSet0.fp_c3)._m0[0].x, _2940);
            float _2944 = -_149;
            float _2946 = fma(_2932, (*spvDescriptorSet0.fp_c3)._m0[0].x, _2944);
            float _2948 = rint(_2946);
            float _2950 = rint(_2942);
            float _2952 = abs(_2948);
            float _2954 = sqrt(_2952);
            float _2956 = abs(_2950);
            float _2958 = sqrt(_2956);
            float _2960 = _2936 * 4.0;
            float _2962 = _2938 * 4.0;
            float _2964 = rint(_2960);
            float _2966 = rint(_2962);
            float _2968 = fma(_2964, 16.0, _2954);
            float _2970 = fma(_2968, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _2972 = fma(_2966, 16.0, _2958);
            float _2974 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _2970);
            float2 _9054 = float2(_2934, _67);
            float _2976 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9054, float2(0.0), isnan(_9054)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9054, float2(0.0), isnan(_9054)), int2(0, 1)).x;
            float2 _9063 = float2(_2934, _67);
            float _2978 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9063, float2(0.0), isnan(_9063)), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9063, float2(0.0), isnan(_9063)), int2(0, -2)).x;
            float _2980 = fma(_2972, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float2 _9075 = float2(_2932, _67);
            float _2982 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9075, float2(0.0), isnan(_9075)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9075, float2(0.0), isnan(_9075)), int2(1)).x;
            float2 _9084 = float2(_2932, _67);
            float _2984 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9084, float2(0.0), isnan(_9084)), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9084, float2(0.0), isnan(_9084)), int2(1, -2)).x;
            float2 _9093 = float2(_2980, _2974);
            float2 _2986 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_9093, float2(0.0), isnan(_9093))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_9093, float2(0.0), isnan(_9093))).xy;
            float _2988 = _2986.x;
            float _2990 = _2986.y;
            float _2992 = abs(_2948);
            float _2994 = abs(_2950);
            bool _2996 = _2992 >= _2994;
            bool _2998 = isnan(_2992);
            bool _3000 = _2996 || _2998;
            bool _3002 = isnan(_2994);
            bool _3004 = _3000 || _3002;
            float _3006 = float(_3004);
            float _3008 = abs(_2950);
            float _3010 = abs(_2948);
            bool _3012 = _3008 >= _3010;
            bool _3014 = isnan(_3008);
            bool _3016 = _3012 || _3014;
            bool _3018 = isnan(_3010);
            bool _3020 = _3016 || _3018;
            float _3022 = float(_3020);
            float _3024 = _3006 + _3022;
            float _3026 = 1.0 / _3024;
            float _3028 = _3026 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
            float _3030 = _3006 * _3028;
            float _3032 = _3022 * _3028;
            float _3034 = -_3030;
            float _3036 = fma(_3034, _2976, 1.0);
            float _3038 = -_3030;
            float _3040 = fma(_3038, _2978, 1.0);
            float _3042 = -_3032;
            float _3044 = fma(_3042, _2982, _3036);
            float _3046 = precise::clamp(_3044, 0.0, 1.0);
            float _3048 = -_3032;
            float _3050 = fma(_3048, _2984, _3040);
            float _3052 = precise::clamp(_3050, 0.0, 1.0);
            float _3054 = _2988 * _3046;
            float _3056 = _2990 * _3052;
            _210 = _166;
            _182 = _2982;
            _212 = _67;
            _184 = _3052;
            _186 = as_type<int>(_3046);
            _188 = _3032;
            _202 = as_type<int>(_3054);
            _204 = as_type<int>(_3056);
        }
    }
    int _3058 = _210;
    float _3060 = _182;
    float _3062 = _212;
    float _3064 = _184;
    int _3066 = _186;
    float _3068 = _188;
    int _3070 = _202;
    int _3072 = _204;
    int _3074 = _3058 & 1;
    bool _3076 = _3074 != 0;
    bool _3078 = !_3076;
    float _3080 = _3060;
    float _3082 = _3062;
    float _3084 = _3064;
    int _3086 = _3066;
    float _3088 = _3068;
    if (!_3078)
    {
        float2 _9225 = float2(_143, _155);
        float2 _3090 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9225, float2(0.0), isnan(_9225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9225, float2(0.0), isnan(_9225))).xy;
        float _3092 = _3090.x;
        float _3094 = _3090.y;
        float2 _9237 = float2(_145, _147);
        float2 _3096 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9237, float2(0.0), isnan(_9237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9237, float2(0.0), isnan(_9237))).xy;
        float _3098 = _3096.x;
        float _3100 = _3096.y;
        float _3102 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _155);
        bool _3104 = _3092 > 0.800000011920928955078125;
        bool _3106 = isnan(_3092);
        bool _3108 = _3104 || _3106;
        bool _3110 = isnan(0.800000011920928955078125);
        bool _3112 = _3108 || _3110;
        bool _3114 = _3098 > 0.800000011920928955078125;
        bool _3116 = isnan(_3098);
        bool _3118 = _3114 || _3116;
        bool _3120 = isnan(0.800000011920928955078125);
        bool _3122 = _3118 || _3120;
        bool _3124 = _3094 != 0.0;
        bool _3126 = isnan(_3094);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan(0.0);
        bool _3132 = _3128 || _3130;
        bool _3134 = !_3112;
        bool _3136 = _3132 || _3134;
        bool _3138 = _3100 != 0.0;
        bool _3140 = isnan(_3100);
        bool _3142 = _3138 || _3140;
        bool _3144 = isnan(0.0);
        bool _3146 = _3142 || _3144;
        bool _3148 = !_3122;
        bool _3150 = _3146 || _3148;
        int _3152 = as_type<int>(_3094);
        float _3154 = _3102;
        if (_3136)
        {
            _3080 = _3092;
        }
        float _3156 = _3080;
        if (_3136)
        {
            _3082 = _3094;
        }
        float _3158 = _3082;
        if (_3150)
        {
            _3084 = _3098;
        }
        float _3160 = _3084;
        float _3162 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
        float _3164 = _3162;
        if (_3150)
        {
            _190 = _3100;
        }
        float _3166 = _190;
        float _3168 = _3156;
        float _3170 = _3158;
        if (!_3136)
        {
            float2 _9340 = float2(_143, _3102);
            float2 _3172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9340, float2(0.0), isnan(_9340))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9340, float2(0.0), isnan(_9340))).xy;
            float _3174 = _3172.x;
            float _3176 = _3172.y;
            _3168 = _3174;
            _3170 = _3176;
        }
        float _3178 = _3168;
        float _3180 = _3170;
        float _3182 = _3160;
        float _3184 = _3166;
        if (!_3150)
        {
            float2 _9362 = float2(_145, _3162);
            float2 _3186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9362, float2(0.0), isnan(_9362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9362, float2(0.0), isnan(_9362))).xy;
            float _3188 = _3186.x;
            float _3190 = _3186.y;
            _3182 = _3188;
            _3184 = _3190;
        }
        float _3192 = _3182;
        float _3194 = _3184;
        if (_3136)
        {
            _3086 = 1;
        }
        int _3196 = _3086;
        int _3198 = _3196;
        if (!_3136)
        {
            _3198 = 0;
        }
        int _3200 = _3198;
        int _3202 = _3200;
        if (_3136)
        {
            _192 = _3102;
        }
        float _3204 = _192;
        float _3206 = _3204;
        if (!_3136)
        {
            float _3208 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3102);
            _3206 = _3208;
        }
        float _3210 = _3206;
        int _3212 = _3200 & 1;
        bool _3214 = _3212 != 0;
        float _3216 = _3210;
        if (_3214)
        {
            _194 = _3200;
        }
        int _3218 = _194;
        int _3220 = _3218;
        int _3222 = _3218;
        float _3224 = _3178;
        float _3226 = _3180;
        float _3228 = _3192;
        float _3230 = _3194;
        if (!_3214)
        {
            bool _3232 = _3178 > 0.800000011920928955078125;
            bool _3234 = isnan(_3178);
            bool _3236 = _3232 || _3234;
            bool _3238 = isnan(0.800000011920928955078125);
            bool _3240 = _3236 || _3238;
            bool _3242 = _3180 != 0.0;
            bool _3244 = isnan(_3180);
            bool _3246 = _3242 || _3244;
            bool _3248 = isnan(0.0);
            bool _3250 = _3246 || _3248;
            bool _3252 = !_3240;
            bool _3254 = _3250 || _3252;
            if (_3254)
            {
                _3220 = 1;
            }
            int _3256 = _3220;
            _3222 = _3256;
            if (!_3254)
            {
                float2 _9460 = float2(_143, _3210);
                float2 _3258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9460, float2(0.0), isnan(_9460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9460, float2(0.0), isnan(_9460))).xy;
                float _3260 = _3258.x;
                float _3262 = _3258.y;
                float _3264 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3210);
                _3222 = _3200;
                _3224 = _3260;
                _3226 = _3262;
                _3216 = _3264;
            }
        }
        int _3266 = _3222;
        float _3268 = _3224;
        float _3270 = _3226;
        float _3272 = _3216;
        int _3274 = _3266 & 1;
        bool _3276 = _3274 != 0;
        float _3278 = _3268;
        float _3280 = _3270;
        float _3282 = _3272;
        int _3284 = _3266;
        if (_3276)
        {
            _3202 = _3266;
        }
        int _3286 = _3202;
        int _3288 = _3286;
        int _3290 = _3286;
        if (!_3276)
        {
            bool _3292 = _3268 > 0.800000011920928955078125;
            bool _3294 = isnan(_3268);
            bool _3296 = _3292 || _3294;
            bool _3298 = isnan(0.800000011920928955078125);
            bool _3300 = _3296 || _3298;
            bool _3302 = _3270 != 0.0;
            bool _3304 = isnan(_3270);
            bool _3306 = _3302 || _3304;
            bool _3308 = isnan(0.0);
            bool _3310 = _3306 || _3308;
            bool _3312 = !_3300;
            bool _3314 = _3310 || _3312;
            if (_3314)
            {
                _3288 = 1;
            }
            int _3316 = _3288;
            _3290 = _3316;
            if (!_3314)
            {
                float2 _9539 = float2(_143, _3272);
                float2 _3318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9539, float2(0.0), isnan(_9539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9539, float2(0.0), isnan(_9539))).xy;
                float _3320 = _3318.x;
                float _3322 = _3318.y;
                float _3324 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3272);
                _3290 = _3266;
                _3278 = _3320;
                _3280 = _3322;
                _3282 = _3324;
            }
        }
        int _3326 = _3290;
        float _3328 = _3278;
        float _3330 = _3280;
        float _3332 = _3282;
        int _3334 = _3326 & 1;
        bool _3336 = _3334 != 0;
        float _3338 = _3328;
        float _3340 = _3330;
        float _3342 = _3332;
        int _3344 = _3326;
        if (_3336)
        {
            _3284 = _3326;
        }
        int _3346 = _3284;
        int _3348 = _3346;
        int _3350 = _3346;
        if (!_3336)
        {
            bool _3352 = _3328 > 0.800000011920928955078125;
            bool _3354 = isnan(_3328);
            bool _3356 = _3352 || _3354;
            bool _3358 = isnan(0.800000011920928955078125);
            bool _3360 = _3356 || _3358;
            bool _3362 = _3330 != 0.0;
            bool _3364 = isnan(_3330);
            bool _3366 = _3362 || _3364;
            bool _3368 = isnan(0.0);
            bool _3370 = _3366 || _3368;
            bool _3372 = !_3360;
            bool _3374 = _3370 || _3372;
            if (_3374)
            {
                _3348 = 1;
            }
            int _3376 = _3348;
            _3350 = _3376;
            if (!_3374)
            {
                float2 _9618 = float2(_143, _3332);
                float2 _3378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9618, float2(0.0), isnan(_9618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9618, float2(0.0), isnan(_9618))).xy;
                float _3380 = _3378.x;
                float _3382 = _3378.y;
                float _3384 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3332);
                _3350 = _3326;
                _3338 = _3380;
                _3340 = _3382;
                _3342 = _3384;
            }
        }
        int _3386 = _3350;
        float _3388 = _3338;
        float _3390 = _3340;
        float _3392 = _3342;
        int _3394 = _3386 & 1;
        bool _3396 = _3394 != 0;
        float _3398 = _3388;
        float _3400 = _3390;
        float _3402 = _3392;
        int _3404 = _3386;
        if (_3396)
        {
            _3344 = _3386;
        }
        int _3406 = _3344;
        int _3408 = _3406;
        int _3410 = _3406;
        if (!_3396)
        {
            bool _3412 = _3388 > 0.800000011920928955078125;
            bool _3414 = isnan(_3388);
            bool _3416 = _3412 || _3414;
            bool _3418 = isnan(0.800000011920928955078125);
            bool _3420 = _3416 || _3418;
            bool _3422 = _3390 != 0.0;
            bool _3424 = isnan(_3390);
            bool _3426 = _3422 || _3424;
            bool _3428 = isnan(0.0);
            bool _3430 = _3426 || _3428;
            bool _3432 = !_3420;
            bool _3434 = _3430 || _3432;
            if (_3434)
            {
                _3408 = 1;
            }
            int _3436 = _3408;
            _3410 = _3436;
            if (!_3434)
            {
                float2 _9697 = float2(_143, _3392);
                float2 _3438 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9697, float2(0.0), isnan(_9697))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9697, float2(0.0), isnan(_9697))).xy;
                float _3440 = _3438.x;
                float _3442 = _3438.y;
                float _3444 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3392);
                _3410 = _3386;
                _3398 = _3440;
                _3400 = _3442;
                _3402 = _3444;
            }
        }
        int _3446 = _3410;
        float _3448 = _3398;
        float _3450 = _3400;
        float _3452 = _3402;
        int _3454 = _3446 & 1;
        bool _3456 = _3454 != 0;
        float _3458 = _3448;
        float _3460 = _3450;
        float _3462 = _3452;
        int _3464 = _3446;
        if (_3456)
        {
            _3404 = _3446;
        }
        int _3466 = _3404;
        int _3468 = _3466;
        int _3470 = _3466;
        if (!_3456)
        {
            bool _3472 = _3448 > 0.800000011920928955078125;
            bool _3474 = isnan(_3448);
            bool _3476 = _3472 || _3474;
            bool _3478 = isnan(0.800000011920928955078125);
            bool _3480 = _3476 || _3478;
            bool _3482 = _3450 != 0.0;
            bool _3484 = isnan(_3450);
            bool _3486 = _3482 || _3484;
            bool _3488 = isnan(0.0);
            bool _3490 = _3486 || _3488;
            bool _3492 = !_3480;
            bool _3494 = _3490 || _3492;
            if (_3494)
            {
                _3468 = 1;
            }
            int _3496 = _3468;
            _3470 = _3496;
            if (!_3494)
            {
                float2 _9776 = float2(_143, _3452);
                float2 _3498 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9776, float2(0.0), isnan(_9776))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9776, float2(0.0), isnan(_9776))).xy;
                float _3500 = _3498.x;
                float _3502 = _3498.y;
                float _3504 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3452);
                _3470 = _3446;
                _3458 = _3500;
                _3460 = _3502;
                _3462 = _3504;
            }
        }
        int _3506 = _3470;
        float _3508 = _3458;
        float _3510 = _3460;
        float _3512 = _3462;
        int _3514 = _3506 & 1;
        bool _3516 = _3514 != 0;
        float _3518 = _3508;
        float _3520 = _3510;
        float _3522 = _3512;
        int _3524 = _3506;
        if (_3516)
        {
            _3464 = _3506;
        }
        int _3526 = _3464;
        int _3528 = _3526;
        int _3530 = _3526;
        if (!_3516)
        {
            bool _3532 = _3508 > 0.800000011920928955078125;
            bool _3534 = isnan(_3508);
            bool _3536 = _3532 || _3534;
            bool _3538 = isnan(0.800000011920928955078125);
            bool _3540 = _3536 || _3538;
            bool _3542 = _3510 != 0.0;
            bool _3544 = isnan(_3510);
            bool _3546 = _3542 || _3544;
            bool _3548 = isnan(0.0);
            bool _3550 = _3546 || _3548;
            bool _3552 = !_3540;
            bool _3554 = _3550 || _3552;
            if (_3554)
            {
                _3528 = 1;
            }
            int _3556 = _3528;
            _3530 = _3556;
            if (!_3554)
            {
                float2 _9855 = float2(_143, _3512);
                float2 _3558 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9855, float2(0.0), isnan(_9855))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9855, float2(0.0), isnan(_9855))).xy;
                float _3560 = _3558.x;
                float _3562 = _3558.y;
                float _3564 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3512);
                _3530 = _3506;
                _3518 = _3560;
                _3520 = _3562;
                _3522 = _3564;
            }
        }
        int _3566 = _3530;
        float _3568 = _3518;
        float _3570 = _3520;
        float _3572 = _3522;
        int _3574 = _3566 & 1;
        bool _3576 = _3574 != 0;
        float _3578 = _3568;
        float _3580 = _3570;
        float _3582 = _3572;
        int _3584 = _3566;
        if (_3576)
        {
            _3524 = _3566;
        }
        int _3586 = _3524;
        int _3588 = _3586;
        int _3590 = _3586;
        if (!_3576)
        {
            bool _3592 = _3568 > 0.800000011920928955078125;
            bool _3594 = isnan(_3568);
            bool _3596 = _3592 || _3594;
            bool _3598 = isnan(0.800000011920928955078125);
            bool _3600 = _3596 || _3598;
            bool _3602 = _3570 != 0.0;
            bool _3604 = isnan(_3570);
            bool _3606 = _3602 || _3604;
            bool _3608 = isnan(0.0);
            bool _3610 = _3606 || _3608;
            bool _3612 = !_3600;
            bool _3614 = _3610 || _3612;
            if (_3614)
            {
                _3588 = 1;
            }
            int _3616 = _3588;
            _3590 = _3616;
            if (!_3614)
            {
                float2 _9934 = float2(_143, _3572);
                float2 _3618 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_9934, float2(0.0), isnan(_9934))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_9934, float2(0.0), isnan(_9934))).xy;
                float _3620 = _3618.x;
                float _3622 = _3618.y;
                float _3624 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3572);
                _3590 = _3566;
                _3578 = _3620;
                _3580 = _3622;
                _3582 = _3624;
            }
        }
        int _3626 = _3590;
        float _3628 = _3578;
        float _3630 = _3580;
        float _3632 = _3582;
        int _3634 = _3626 & 1;
        bool _3636 = _3634 != 0;
        float _3638 = _3628;
        float _3640 = _3630;
        float _3642 = _3632;
        int _3644 = _3626;
        if (_3636)
        {
            _3584 = _3626;
        }
        int _3646 = _3584;
        int _3648 = _3646;
        int _3650 = _3646;
        if (!_3636)
        {
            bool _3652 = _3628 > 0.800000011920928955078125;
            bool _3654 = isnan(_3628);
            bool _3656 = _3652 || _3654;
            bool _3658 = isnan(0.800000011920928955078125);
            bool _3660 = _3656 || _3658;
            bool _3662 = _3630 != 0.0;
            bool _3664 = isnan(_3630);
            bool _3666 = _3662 || _3664;
            bool _3668 = isnan(0.0);
            bool _3670 = _3666 || _3668;
            bool _3672 = !_3660;
            bool _3674 = _3670 || _3672;
            if (_3674)
            {
                _3648 = 1;
            }
            int _3676 = _3648;
            _3650 = _3676;
            if (!_3674)
            {
                float2 _10013 = float2(_143, _3632);
                float2 _3678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10013, float2(0.0), isnan(_10013))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10013, float2(0.0), isnan(_10013))).xy;
                float _3680 = _3678.x;
                float _3682 = _3678.y;
                float _3684 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3632);
                _3650 = _3626;
                _3638 = _3680;
                _3640 = _3682;
                _3642 = _3684;
            }
        }
        int _3686 = _3650;
        float _3688 = _3638;
        float _3690 = _3640;
        float _3692 = _3642;
        int _3694 = _3686 & 1;
        bool _3696 = _3694 != 0;
        float _3698 = _3688;
        float _3700 = _3690;
        float _3702 = _3692;
        int _3704 = _3686;
        if (_3696)
        {
            _3644 = _3686;
        }
        int _3706 = _3644;
        int _3708 = _3706;
        int _3710 = _3706;
        if (!_3696)
        {
            bool _3712 = _3688 > 0.800000011920928955078125;
            bool _3714 = isnan(_3688);
            bool _3716 = _3712 || _3714;
            bool _3718 = isnan(0.800000011920928955078125);
            bool _3720 = _3716 || _3718;
            bool _3722 = _3690 != 0.0;
            bool _3724 = isnan(_3690);
            bool _3726 = _3722 || _3724;
            bool _3728 = isnan(0.0);
            bool _3730 = _3726 || _3728;
            bool _3732 = !_3720;
            bool _3734 = _3730 || _3732;
            if (_3734)
            {
                _3708 = 1;
            }
            int _3736 = _3708;
            _3710 = _3736;
            if (!_3734)
            {
                float2 _10092 = float2(_143, _3692);
                float2 _3738 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10092, float2(0.0), isnan(_10092))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10092, float2(0.0), isnan(_10092))).xy;
                float _3740 = _3738.x;
                float _3742 = _3738.y;
                float _3744 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3692);
                _3710 = _3686;
                _3698 = _3740;
                _3700 = _3742;
                _3702 = _3744;
            }
        }
        int _3746 = _3710;
        float _3748 = _3698;
        float _3750 = _3700;
        float _3752 = _3702;
        int _3754 = _3746 & 1;
        bool _3756 = _3754 != 0;
        float _3758 = _3748;
        float _3760 = _3750;
        float _3762 = _3752;
        int _3764 = _3746;
        if (_3756)
        {
            _3704 = _3746;
        }
        int _3766 = _3704;
        int _3768 = _3766;
        int _3770 = _3766;
        if (!_3756)
        {
            bool _3772 = _3748 > 0.800000011920928955078125;
            bool _3774 = isnan(_3748);
            bool _3776 = _3772 || _3774;
            bool _3778 = isnan(0.800000011920928955078125);
            bool _3780 = _3776 || _3778;
            bool _3782 = _3750 != 0.0;
            bool _3784 = isnan(_3750);
            bool _3786 = _3782 || _3784;
            bool _3788 = isnan(0.0);
            bool _3790 = _3786 || _3788;
            bool _3792 = !_3780;
            bool _3794 = _3790 || _3792;
            if (_3794)
            {
                _3768 = 1;
            }
            int _3796 = _3768;
            _3770 = _3796;
            if (!_3794)
            {
                float2 _10171 = float2(_143, _3752);
                float2 _3798 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10171, float2(0.0), isnan(_10171))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10171, float2(0.0), isnan(_10171))).xy;
                float _3800 = _3798.x;
                float _3802 = _3798.y;
                float _3804 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3752);
                _3770 = _3746;
                _3758 = _3800;
                _3760 = _3802;
                _3762 = _3804;
            }
        }
        int _3806 = _3770;
        float _3808 = _3758;
        float _3810 = _3760;
        float _3812 = _3762;
        int _3814 = _3806 & 1;
        bool _3816 = _3814 != 0;
        float _3818 = _3808;
        float _3820 = _3810;
        float _3822 = _3812;
        int _3824 = _3806;
        if (_3816)
        {
            _3764 = _3806;
        }
        int _3826 = _3764;
        int _3828 = _3826;
        int _3830 = _3826;
        if (!_3816)
        {
            bool _3832 = _3808 > 0.800000011920928955078125;
            bool _3834 = isnan(_3808);
            bool _3836 = _3832 || _3834;
            bool _3838 = isnan(0.800000011920928955078125);
            bool _3840 = _3836 || _3838;
            bool _3842 = _3810 != 0.0;
            bool _3844 = isnan(_3810);
            bool _3846 = _3842 || _3844;
            bool _3848 = isnan(0.0);
            bool _3850 = _3846 || _3848;
            bool _3852 = !_3840;
            bool _3854 = _3850 || _3852;
            if (_3854)
            {
                _3828 = 1;
            }
            int _3856 = _3828;
            _3830 = _3856;
            if (!_3854)
            {
                float2 _10250 = float2(_143, _3812);
                float2 _3858 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10250, float2(0.0), isnan(_10250))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10250, float2(0.0), isnan(_10250))).xy;
                float _3860 = _3858.x;
                float _3862 = _3858.y;
                float _3864 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3812);
                _3830 = _3806;
                _3818 = _3860;
                _3820 = _3862;
                _3822 = _3864;
            }
        }
        int _3866 = _3830;
        float _3868 = _3818;
        float _3870 = _3820;
        float _3872 = _3822;
        int _3874 = _3866 & 1;
        bool _3876 = _3874 != 0;
        float _3878 = _3872;
        float _3880 = _3868;
        float _3882 = _3870;
        int _3884 = _3866;
        if (_3876)
        {
            _3824 = _3866;
        }
        int _3886 = _3824;
        int _3888 = _3886;
        int _3890 = _3886;
        if (!_3876)
        {
            bool _3892 = _3868 > 0.800000011920928955078125;
            bool _3894 = isnan(_3868);
            bool _3896 = _3892 || _3894;
            bool _3898 = isnan(0.800000011920928955078125);
            bool _3900 = _3896 || _3898;
            bool _3902 = _3870 != 0.0;
            bool _3904 = isnan(_3870);
            bool _3906 = _3902 || _3904;
            bool _3908 = isnan(0.0);
            bool _3910 = _3906 || _3908;
            bool _3912 = !_3900;
            bool _3914 = _3910 || _3912;
            if (_3914)
            {
                _3888 = 1;
            }
            int _3916 = _3888;
            _3890 = _3916;
            if (!_3914)
            {
                float2 _10329 = float2(_143, _3872);
                float2 _3918 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10329, float2(0.0), isnan(_10329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10329, float2(0.0), isnan(_10329))).xy;
                float _3920 = _3918.x;
                float _3922 = _3918.y;
                float _3924 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3872);
                _3890 = _3866;
                _3878 = _3924;
                _3880 = _3920;
                _3882 = _3922;
            }
        }
        int _3926 = _3890;
        float _3928 = _3878;
        float _3930 = _3880;
        float _3932 = _3882;
        int _3934 = _3926 & 1;
        bool _3936 = _3934 != 0;
        float _3938 = _3932;
        float _3940 = _3930;
        float _3942 = as_type<float>(_3926);
        float _3944 = _3928;
        if (_3150)
        {
            _3152 = 1;
        }
        int _3946 = _3152;
        int _3948 = _3946;
        if (!_3150)
        {
            _3948 = 0;
        }
        int _3950 = _3948;
        int _3952 = _3950 & 1;
        bool _3954 = _3952 != 0;
        if (_3936)
        {
            _3154 = _3928;
        }
        float _3956 = _3154;
        float _3958 = _3956;
        float _3960 = _3956;
        if (_3936)
        {
            _3884 = _3926;
        }
        int _3962 = _3884;
        int _3964 = _3962;
        int _3966 = _3962;
        if (!_3936)
        {
            bool _3968 = _3930 > 0.800000011920928955078125;
            bool _3970 = isnan(_3930);
            bool _3972 = _3968 || _3970;
            bool _3974 = isnan(0.800000011920928955078125);
            bool _3976 = _3972 || _3974;
            bool _3978 = _3932 != 0.0;
            bool _3980 = isnan(_3932);
            bool _3982 = _3978 || _3980;
            bool _3984 = isnan(0.0);
            bool _3986 = _3982 || _3984;
            bool _3988 = !_3976;
            bool _3990 = _3986 || _3988;
            if (_3990)
            {
                _3958 = _3928;
            }
            float _3992 = _3958;
            _3960 = _3992;
            if (_3990)
            {
                _3964 = 1;
            }
            int _3994 = _3964;
            _3966 = _3994;
            if (!_3990)
            {
                float2 _10436 = float2(_143, _3928);
                float2 _3996 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10436, float2(0.0), isnan(_10436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10436, float2(0.0), isnan(_10436))).xy;
                float _3998 = _3996.x;
                float _4000 = _3996.y;
                float _4002 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _3928);
                _3966 = _3926;
                _3960 = _4002;
                _3938 = _4000;
                _3940 = _3998;
            }
        }
        int _4004 = _3966;
        float _4006 = _3960;
        float _4008 = _3938;
        float _4010 = _3940;
        int _4012 = _4004 & 1;
        bool _4014 = _4012 != 0;
        int _4016 = _4004;
        if (!_3150)
        {
            float _4018 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _3162);
            _3164 = _4018;
        }
        float _4020 = _3164;
        float _4022 = _4020;
        if (_4014)
        {
            _3942 = _4006;
        }
        float _4024 = _3942;
        float _4026 = _4024;
        float _4028 = _4024;
        if (_4014)
        {
            _3088 = _4008;
        }
        float _4030 = _3088;
        float _4032 = _4030;
        float _4034 = _4030;
        if (_4014)
        {
            _3944 = _4010;
        }
        float _4036 = _3944;
        float _4038 = _4036;
        float _4040 = _4036;
        if (!_4014)
        {
            bool _4042 = _4010 > 0.800000011920928955078125;
            bool _4044 = isnan(_4010);
            bool _4046 = _4042 || _4044;
            bool _4048 = isnan(0.800000011920928955078125);
            bool _4050 = _4046 || _4048;
            bool _4052 = _4008 != 0.0;
            bool _4054 = isnan(_4008);
            bool _4056 = _4052 || _4054;
            bool _4058 = isnan(0.0);
            bool _4060 = _4056 || _4058;
            bool _4062 = !_4050;
            bool _4064 = _4060 || _4062;
            if (_4064)
            {
                _4038 = _4010;
            }
            float _4066 = _4038;
            _4040 = _4066;
            if (_4064)
            {
                _4026 = _4006;
            }
            float _4068 = _4026;
            _4028 = _4068;
            if (_4064)
            {
                _4032 = _4008;
            }
            float _4070 = _4032;
            _4034 = _4070;
            if (!_4064)
            {
                float2 _10550 = float2(_143, _4006);
                float2 _4072 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10550, float2(0.0), isnan(_10550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10550, float2(0.0), isnan(_10550))).xy;
                float _4074 = _4072.x;
                float _4076 = _4072.y;
                float _4078 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _4006);
                _4040 = _4074;
                _4034 = _4076;
                _4028 = _4078;
            }
        }
        float _4080 = _4040;
        float _4082 = _4034;
        float _4084 = _4028;
        if (_3954)
        {
            _196 = _3950;
        }
        int _4086 = _196;
        int _4088 = _4086;
        int _4090 = _4086;
        if (!_3954)
        {
            bool _4092 = _3192 > 0.800000011920928955078125;
            bool _4094 = isnan(_3192);
            bool _4096 = _4092 || _4094;
            bool _4098 = isnan(0.800000011920928955078125);
            bool _4100 = _4096 || _4098;
            bool _4102 = _3194 != 0.0;
            bool _4104 = isnan(_3194);
            bool _4106 = _4102 || _4104;
            bool _4108 = isnan(0.0);
            bool _4110 = _4106 || _4108;
            bool _4112 = !_4100;
            bool _4114 = _4110 || _4112;
            if (_4114)
            {
                _4088 = 1;
            }
            int _4116 = _4088;
            _4090 = _4116;
            if (!_4114)
            {
                float2 _10619 = float2(_145, _4020);
                float2 _4118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10619, float2(0.0), isnan(_10619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10619, float2(0.0), isnan(_10619))).xy;
                float _4120 = _4118.x;
                float _4122 = _4118.y;
                float _4124 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4020);
                _4090 = _3950;
                _3228 = _4120;
                _3230 = _4122;
                _4022 = _4124;
            }
        }
        int _4126 = _4090;
        float _4128 = _3228;
        float _4130 = _3230;
        float _4132 = _4022;
        int _4134 = _4126 & 1;
        bool _4136 = _4134 != 0;
        float _4138 = _4128;
        float _4140 = _4130;
        float _4142 = _4132;
        int _4144 = _4126;
        if (_4136)
        {
            _4016 = _4126;
        }
        int _4146 = _4016;
        int _4148 = _4146;
        int _4150 = _4146;
        if (!_4136)
        {
            bool _4152 = _4128 > 0.800000011920928955078125;
            bool _4154 = isnan(_4128);
            bool _4156 = _4152 || _4154;
            bool _4158 = isnan(0.800000011920928955078125);
            bool _4160 = _4156 || _4158;
            bool _4162 = _4130 != 0.0;
            bool _4164 = isnan(_4130);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan(0.0);
            bool _4170 = _4166 || _4168;
            bool _4172 = !_4160;
            bool _4174 = _4170 || _4172;
            if (_4174)
            {
                _4148 = 1;
            }
            int _4176 = _4148;
            _4150 = _4176;
            if (!_4174)
            {
                float2 _10698 = float2(_145, _4132);
                float2 _4178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10698, float2(0.0), isnan(_10698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10698, float2(0.0), isnan(_10698))).xy;
                float _4180 = _4178.x;
                float _4182 = _4178.y;
                float _4184 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4132);
                _4150 = _4126;
                _4138 = _4180;
                _4140 = _4182;
                _4142 = _4184;
            }
        }
        int _4186 = _4150;
        float _4188 = _4138;
        float _4190 = _4140;
        float _4192 = _4142;
        int _4194 = _4186 & 1;
        bool _4196 = _4194 != 0;
        float _4198 = _4188;
        float _4200 = _4190;
        float _4202 = _4192;
        int _4204 = _4186;
        if (_4196)
        {
            _4144 = _4186;
        }
        int _4206 = _4144;
        int _4208 = _4206;
        int _4210 = _4206;
        if (!_4196)
        {
            bool _4212 = _4188 > 0.800000011920928955078125;
            bool _4214 = isnan(_4188);
            bool _4216 = _4212 || _4214;
            bool _4218 = isnan(0.800000011920928955078125);
            bool _4220 = _4216 || _4218;
            bool _4222 = _4190 != 0.0;
            bool _4224 = isnan(_4190);
            bool _4226 = _4222 || _4224;
            bool _4228 = isnan(0.0);
            bool _4230 = _4226 || _4228;
            bool _4232 = !_4220;
            bool _4234 = _4230 || _4232;
            if (_4234)
            {
                _4208 = 1;
            }
            int _4236 = _4208;
            _4210 = _4236;
            if (!_4234)
            {
                float2 _10777 = float2(_145, _4192);
                float2 _4238 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10777, float2(0.0), isnan(_10777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10777, float2(0.0), isnan(_10777))).xy;
                float _4240 = _4238.x;
                float _4242 = _4238.y;
                float _4244 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4192);
                _4210 = _4186;
                _4198 = _4240;
                _4200 = _4242;
                _4202 = _4244;
            }
        }
        int _4246 = _4210;
        float _4248 = _4198;
        float _4250 = _4200;
        float _4252 = _4202;
        int _4254 = _4246 & 1;
        bool _4256 = _4254 != 0;
        float _4258 = _4248;
        float _4260 = _4250;
        float _4262 = _4252;
        int _4264 = _4246;
        if (_4256)
        {
            _4204 = _4246;
        }
        int _4266 = _4204;
        int _4268 = _4266;
        int _4270 = _4266;
        if (!_4256)
        {
            bool _4272 = _4248 > 0.800000011920928955078125;
            bool _4274 = isnan(_4248);
            bool _4276 = _4272 || _4274;
            bool _4278 = isnan(0.800000011920928955078125);
            bool _4280 = _4276 || _4278;
            bool _4282 = _4250 != 0.0;
            bool _4284 = isnan(_4250);
            bool _4286 = _4282 || _4284;
            bool _4288 = isnan(0.0);
            bool _4290 = _4286 || _4288;
            bool _4292 = !_4280;
            bool _4294 = _4290 || _4292;
            if (_4294)
            {
                _4268 = 1;
            }
            int _4296 = _4268;
            _4270 = _4296;
            if (!_4294)
            {
                float2 _10856 = float2(_145, _4252);
                float2 _4298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10856, float2(0.0), isnan(_10856))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10856, float2(0.0), isnan(_10856))).xy;
                float _4300 = _4298.x;
                float _4302 = _4298.y;
                float _4304 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4252);
                _4270 = _4246;
                _4258 = _4300;
                _4260 = _4302;
                _4262 = _4304;
            }
        }
        int _4306 = _4270;
        float _4308 = _4258;
        float _4310 = _4260;
        float _4312 = _4262;
        int _4314 = _4306 & 1;
        bool _4316 = _4314 != 0;
        float _4318 = _4308;
        float _4320 = _4310;
        float _4322 = _4312;
        int _4324 = _4306;
        if (_4316)
        {
            _4264 = _4306;
        }
        int _4326 = _4264;
        int _4328 = _4326;
        int _4330 = _4326;
        if (!_4316)
        {
            bool _4332 = _4308 > 0.800000011920928955078125;
            bool _4334 = isnan(_4308);
            bool _4336 = _4332 || _4334;
            bool _4338 = isnan(0.800000011920928955078125);
            bool _4340 = _4336 || _4338;
            bool _4342 = _4310 != 0.0;
            bool _4344 = isnan(_4310);
            bool _4346 = _4342 || _4344;
            bool _4348 = isnan(0.0);
            bool _4350 = _4346 || _4348;
            bool _4352 = !_4340;
            bool _4354 = _4350 || _4352;
            if (_4354)
            {
                _4328 = 1;
            }
            int _4356 = _4328;
            _4330 = _4356;
            if (!_4354)
            {
                float2 _10935 = float2(_145, _4312);
                float2 _4358 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_10935, float2(0.0), isnan(_10935))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_10935, float2(0.0), isnan(_10935))).xy;
                float _4360 = _4358.x;
                float _4362 = _4358.y;
                float _4364 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4312);
                _4330 = _4306;
                _4318 = _4360;
                _4320 = _4362;
                _4322 = _4364;
            }
        }
        int _4366 = _4330;
        float _4368 = _4318;
        float _4370 = _4320;
        float _4372 = _4322;
        int _4374 = _4366 & 1;
        bool _4376 = _4374 != 0;
        float _4378 = _4368;
        float _4380 = _4370;
        float _4382 = _4372;
        int _4384 = _4366;
        if (_4376)
        {
            _4324 = _4366;
        }
        int _4386 = _4324;
        int _4388 = _4386;
        int _4390 = _4386;
        if (!_4376)
        {
            bool _4392 = _4368 > 0.800000011920928955078125;
            bool _4394 = isnan(_4368);
            bool _4396 = _4392 || _4394;
            bool _4398 = isnan(0.800000011920928955078125);
            bool _4400 = _4396 || _4398;
            bool _4402 = _4370 != 0.0;
            bool _4404 = isnan(_4370);
            bool _4406 = _4402 || _4404;
            bool _4408 = isnan(0.0);
            bool _4410 = _4406 || _4408;
            bool _4412 = !_4400;
            bool _4414 = _4410 || _4412;
            if (_4414)
            {
                _4388 = 1;
            }
            int _4416 = _4388;
            _4390 = _4416;
            if (!_4414)
            {
                float2 _11014 = float2(_145, _4372);
                float2 _4418 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11014, float2(0.0), isnan(_11014))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11014, float2(0.0), isnan(_11014))).xy;
                float _4420 = _4418.x;
                float _4422 = _4418.y;
                float _4424 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4372);
                _4390 = _4366;
                _4378 = _4420;
                _4380 = _4422;
                _4382 = _4424;
            }
        }
        int _4426 = _4390;
        float _4428 = _4378;
        float _4430 = _4380;
        float _4432 = _4382;
        int _4434 = _4426 & 1;
        bool _4436 = _4434 != 0;
        float _4438 = _4428;
        float _4440 = _4430;
        float _4442 = _4432;
        int _4444 = _4426;
        if (_4436)
        {
            _4384 = _4426;
        }
        int _4446 = _4384;
        int _4448 = _4446;
        int _4450 = _4446;
        if (!_4436)
        {
            bool _4452 = _4428 > 0.800000011920928955078125;
            bool _4454 = isnan(_4428);
            bool _4456 = _4452 || _4454;
            bool _4458 = isnan(0.800000011920928955078125);
            bool _4460 = _4456 || _4458;
            bool _4462 = _4430 != 0.0;
            bool _4464 = isnan(_4430);
            bool _4466 = _4462 || _4464;
            bool _4468 = isnan(0.0);
            bool _4470 = _4466 || _4468;
            bool _4472 = !_4460;
            bool _4474 = _4470 || _4472;
            if (_4474)
            {
                _4448 = 1;
            }
            int _4476 = _4448;
            _4450 = _4476;
            if (!_4474)
            {
                float2 _11093 = float2(_145, _4432);
                float2 _4478 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11093, float2(0.0), isnan(_11093))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11093, float2(0.0), isnan(_11093))).xy;
                float _4480 = _4478.x;
                float _4482 = _4478.y;
                float _4484 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4432);
                _4450 = _4426;
                _4438 = _4480;
                _4440 = _4482;
                _4442 = _4484;
            }
        }
        int _4486 = _4450;
        float _4488 = _4438;
        float _4490 = _4440;
        float _4492 = _4442;
        int _4494 = _4486 & 1;
        bool _4496 = _4494 != 0;
        float _4498 = _4488;
        float _4500 = _4490;
        float _4502 = _4492;
        int _4504 = _4486;
        if (_4496)
        {
            _4444 = _4486;
        }
        int _4506 = _4444;
        int _4508 = _4506;
        int _4510 = _4506;
        if (!_4496)
        {
            bool _4512 = _4488 > 0.800000011920928955078125;
            bool _4514 = isnan(_4488);
            bool _4516 = _4512 || _4514;
            bool _4518 = isnan(0.800000011920928955078125);
            bool _4520 = _4516 || _4518;
            bool _4522 = _4490 != 0.0;
            bool _4524 = isnan(_4490);
            bool _4526 = _4522 || _4524;
            bool _4528 = isnan(0.0);
            bool _4530 = _4526 || _4528;
            bool _4532 = !_4520;
            bool _4534 = _4530 || _4532;
            if (_4534)
            {
                _4508 = 1;
            }
            int _4536 = _4508;
            _4510 = _4536;
            if (!_4534)
            {
                float2 _11172 = float2(_145, _4492);
                float2 _4538 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11172, float2(0.0), isnan(_11172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11172, float2(0.0), isnan(_11172))).xy;
                float _4540 = _4538.x;
                float _4542 = _4538.y;
                float _4544 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4492);
                _4510 = _4486;
                _4498 = _4540;
                _4500 = _4542;
                _4502 = _4544;
            }
        }
        int _4546 = _4510;
        float _4548 = _4498;
        float _4550 = _4500;
        float _4552 = _4502;
        int _4554 = _4546 & 1;
        bool _4556 = _4554 != 0;
        float _4558 = _4548;
        float _4560 = _4550;
        float _4562 = _4552;
        int _4564 = _4546;
        if (_4556)
        {
            _4504 = _4546;
        }
        int _4566 = _4504;
        int _4568 = _4566;
        int _4570 = _4566;
        if (!_4556)
        {
            bool _4572 = _4548 > 0.800000011920928955078125;
            bool _4574 = isnan(_4548);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan(0.800000011920928955078125);
            bool _4580 = _4576 || _4578;
            bool _4582 = _4550 != 0.0;
            bool _4584 = isnan(_4550);
            bool _4586 = _4582 || _4584;
            bool _4588 = isnan(0.0);
            bool _4590 = _4586 || _4588;
            bool _4592 = !_4580;
            bool _4594 = _4590 || _4592;
            if (_4594)
            {
                _4568 = 1;
            }
            int _4596 = _4568;
            _4570 = _4596;
            if (!_4594)
            {
                float2 _11251 = float2(_145, _4552);
                float2 _4598 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11251, float2(0.0), isnan(_11251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11251, float2(0.0), isnan(_11251))).xy;
                float _4600 = _4598.x;
                float _4602 = _4598.y;
                float _4604 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4552);
                _4570 = _4546;
                _4558 = _4600;
                _4560 = _4602;
                _4562 = _4604;
            }
        }
        int _4606 = _4570;
        float _4608 = _4558;
        float _4610 = _4560;
        float _4612 = _4562;
        int _4614 = _4606 & 1;
        bool _4616 = _4614 != 0;
        float _4618 = _4608;
        float _4620 = _4610;
        float _4622 = _4612;
        int _4624 = _4606;
        if (_4616)
        {
            _4564 = _4606;
        }
        int _4626 = _4564;
        int _4628 = _4626;
        int _4630 = _4626;
        if (!_4616)
        {
            bool _4632 = _4608 > 0.800000011920928955078125;
            bool _4634 = isnan(_4608);
            bool _4636 = _4632 || _4634;
            bool _4638 = isnan(0.800000011920928955078125);
            bool _4640 = _4636 || _4638;
            bool _4642 = _4610 != 0.0;
            bool _4644 = isnan(_4610);
            bool _4646 = _4642 || _4644;
            bool _4648 = isnan(0.0);
            bool _4650 = _4646 || _4648;
            bool _4652 = !_4640;
            bool _4654 = _4650 || _4652;
            if (_4654)
            {
                _4628 = 1;
            }
            int _4656 = _4628;
            _4630 = _4656;
            if (!_4654)
            {
                float2 _11330 = float2(_145, _4612);
                float2 _4658 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11330, float2(0.0), isnan(_11330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11330, float2(0.0), isnan(_11330))).xy;
                float _4660 = _4658.x;
                float _4662 = _4658.y;
                float _4664 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4612);
                _4630 = _4606;
                _4618 = _4660;
                _4620 = _4662;
                _4622 = _4664;
            }
        }
        int _4666 = _4630;
        float _4668 = _4618;
        float _4670 = _4620;
        float _4672 = _4622;
        int _4674 = _4666 & 1;
        bool _4676 = _4674 != 0;
        float _4678 = _4668;
        float _4680 = _4670;
        float _4682 = _4672;
        int _4684 = _4666;
        if (_4676)
        {
            _4624 = _4666;
        }
        int _4686 = _4624;
        int _4688 = _4686;
        int _4690 = _4686;
        if (!_4676)
        {
            bool _4692 = _4668 > 0.800000011920928955078125;
            bool _4694 = isnan(_4668);
            bool _4696 = _4692 || _4694;
            bool _4698 = isnan(0.800000011920928955078125);
            bool _4700 = _4696 || _4698;
            bool _4702 = _4670 != 0.0;
            bool _4704 = isnan(_4670);
            bool _4706 = _4702 || _4704;
            bool _4708 = isnan(0.0);
            bool _4710 = _4706 || _4708;
            bool _4712 = !_4700;
            bool _4714 = _4710 || _4712;
            if (_4714)
            {
                _4688 = 1;
            }
            int _4716 = _4688;
            _4690 = _4716;
            if (!_4714)
            {
                float2 _11409 = float2(_145, _4672);
                float2 _4718 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11409, float2(0.0), isnan(_11409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11409, float2(0.0), isnan(_11409))).xy;
                float _4720 = _4718.x;
                float _4722 = _4718.y;
                float _4724 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4672);
                _4690 = _4666;
                _4678 = _4720;
                _4680 = _4722;
                _4682 = _4724;
            }
        }
        int _4726 = _4690;
        float _4728 = _4678;
        float _4730 = _4680;
        float _4732 = _4682;
        int _4734 = _4726 & 1;
        bool _4736 = _4734 != 0;
        float _4738 = _4728;
        float _4740 = _4730;
        float _4742 = _4732;
        int _4744 = _4726;
        if (_4736)
        {
            _4684 = _4726;
        }
        int _4746 = _4684;
        int _4748 = _4746;
        int _4750 = _4746;
        if (!_4736)
        {
            bool _4752 = _4728 > 0.800000011920928955078125;
            bool _4754 = isnan(_4728);
            bool _4756 = _4752 || _4754;
            bool _4758 = isnan(0.800000011920928955078125);
            bool _4760 = _4756 || _4758;
            bool _4762 = _4730 != 0.0;
            bool _4764 = isnan(_4730);
            bool _4766 = _4762 || _4764;
            bool _4768 = isnan(0.0);
            bool _4770 = _4766 || _4768;
            bool _4772 = !_4760;
            bool _4774 = _4770 || _4772;
            if (_4774)
            {
                _4748 = 1;
            }
            int _4776 = _4748;
            _4750 = _4776;
            if (!_4774)
            {
                float2 _11488 = float2(_145, _4732);
                float2 _4778 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11488, float2(0.0), isnan(_11488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11488, float2(0.0), isnan(_11488))).xy;
                float _4780 = _4778.x;
                float _4782 = _4778.y;
                float _4784 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4732);
                _4750 = _4726;
                _4738 = _4780;
                _4740 = _4782;
                _4742 = _4784;
            }
        }
        int _4786 = _4750;
        float _4788 = _4738;
        float _4790 = _4740;
        float _4792 = _4742;
        int _4794 = _4786 & 1;
        bool _4796 = _4794 != 0;
        float _4798 = _4788;
        float _4800 = _4790;
        float _4802 = _4792;
        if (_4796)
        {
            _4744 = _4786;
        }
        int _4804 = _4744;
        int _4806 = _4804;
        int _4808 = _4804;
        if (!_4796)
        {
            bool _4810 = _4788 > 0.800000011920928955078125;
            bool _4812 = isnan(_4788);
            bool _4814 = _4810 || _4812;
            bool _4816 = isnan(0.800000011920928955078125);
            bool _4818 = _4814 || _4816;
            bool _4820 = _4790 != 0.0;
            bool _4822 = isnan(_4790);
            bool _4824 = _4820 || _4822;
            bool _4826 = isnan(0.0);
            bool _4828 = _4824 || _4826;
            bool _4830 = !_4818;
            bool _4832 = _4828 || _4830;
            if (_4832)
            {
                _4806 = 1;
            }
            int _4834 = _4806;
            _4808 = _4834;
            if (!_4832)
            {
                float2 _11566 = float2(_145, _4792);
                float2 _4836 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11566, float2(0.0), isnan(_11566))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11566, float2(0.0), isnan(_11566))).xy;
                float _4838 = _4836.x;
                float _4840 = _4836.y;
                float _4842 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4792);
                _4808 = _4786;
                _4798 = _4838;
                _4800 = _4840;
                _4802 = _4842;
            }
        }
        int _4844 = _4808;
        float _4846 = _4798;
        float _4848 = _4800;
        float _4850 = _4802;
        int _4852 = _4844 & 1;
        bool _4854 = _4852 != 0;
        float _4856 = _4848;
        float _4858 = _4846;
        float _4860 = _4850;
        if (!_4854)
        {
            bool _4862 = _4846 > 0.800000011920928955078125;
            bool _4864 = isnan(_4846);
            bool _4866 = _4862 || _4864;
            bool _4868 = isnan(0.800000011920928955078125);
            bool _4870 = _4866 || _4868;
            bool _4872 = _4848 != 0.0;
            bool _4874 = isnan(_4848);
            bool _4876 = _4872 || _4874;
            bool _4878 = isnan(0.0);
            bool _4880 = _4876 || _4878;
            bool _4882 = !_4870;
            bool _4884 = _4880 || _4882;
            if (!_4884)
            {
                float2 _11632 = float2(_145, _4850);
                float2 _4886 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11632, float2(0.0), isnan(_11632))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11632, float2(0.0), isnan(_11632))).xy;
                float _4888 = _4886.x;
                float _4890 = _4886.y;
                float _4892 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _4850);
                _4856 = _4890;
                _4858 = _4888;
                _4860 = _4892;
            }
        }
        float _4894 = _4856;
        float _4896 = _4858;
        float _4898 = _4860;
        float _4900 = fma(_4894, 0.5, 0.5234375);
        float _4902 = fma(_4080, 2.0, 0.03125);
        float _4904 = fma(_4896, 2.0, 0.03125);
        float _4906 = fma(_4082, 0.5, 0.0078125);
        float2 _11664 = float2(_4900, _4904);
        float _4908 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_11664, float2(0.0), isnan(_11664))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_11664, float2(0.0), isnan(_11664))).x;
        float2 _11672 = float2(_4906, _4902);
        float _4910 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_11672, float2(0.0), isnan(_11672))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_11672, float2(0.0), isnan(_11672))).x;
        float _4912 = fma(_4908, -2.007874011993408203125, 3.25);
        float _4914 = fma(_4910, -2.007874011993408203125, 3.25);
        float _4916 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _4918 = fma(_4912, _4916, _4898);
        float _4920 = fma(_4914, (*spvDescriptorSet0.fp_c3)._m0[0].w, _4084);
        float2 _11696 = float2(_153, _4918);
        float _4922 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11696, float2(0.0), isnan(_11696)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11696, float2(0.0), isnan(_11696)), int2(0, 1)).y;
        float2 _11704 = float2(_153, _4920);
        float _4924 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11704, float2(0.0), isnan(_11704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11704, float2(0.0), isnan(_11704))).y;
        float _4926 = -_151;
        float _4928 = fma(_4920, (*spvDescriptorSet0.fp_c3)._m0[0].y, _4926);
        float _4930 = -_151;
        float _4932 = fma(_4918, (*spvDescriptorSet0.fp_c3)._m0[0].y, _4930);
        float _4934 = rint(_4928);
        float _4936 = rint(_4932);
        float _4938 = abs(_4934);
        float _4940 = sqrt(_4938);
        float _4942 = abs(_4936);
        float _4944 = sqrt(_4942);
        float _4946 = _4922 * 4.0;
        float _4948 = _4924 * 4.0;
        float _4950 = rint(_4946);
        float _4952 = rint(_4948);
        float _4954 = fma(_4950, 16.0, _4944);
        float _4956 = fma(_4954, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _4958 = fma(_4952, 16.0, _4940);
        float2 _11754 = float2(_65, _4920);
        float _4960 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11754, float2(0.0), isnan(_11754)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11754, float2(0.0), isnan(_11754)), int2(1, 0)).y;
        float2 _11762 = float2(_65, _4920);
        float _4962 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11762, float2(0.0), isnan(_11762)), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11762, float2(0.0), isnan(_11762)), int2(-2, 0)).y;
        float _4964 = fma(_4958, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float _4966 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _4956);
        float2 _11777 = float2(_65, _4918);
        float _4968 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11777, float2(0.0), isnan(_11777)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11777, float2(0.0), isnan(_11777)), int2(1)).y;
        float2 _11785 = float2(_65, _4918);
        float _4970 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_11785, float2(0.0), isnan(_11785)), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_11785, float2(0.0), isnan(_11785)), int2(-2, 1)).y;
        float2 _11794 = float2(_4964, _4966);
        float2 _4972 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_11794, float2(0.0), isnan(_11794))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_11794, float2(0.0), isnan(_11794))).xy;
        float _4974 = _4972.x;
        float _4976 = _4972.y;
        float _4978 = abs(_4936);
        float _4980 = abs(_4934);
        bool _4982 = _4978 >= _4980;
        bool _4984 = isnan(_4978);
        bool _4986 = _4982 || _4984;
        bool _4988 = isnan(_4980);
        bool _4990 = _4986 || _4988;
        float _4992 = float(_4990);
        float _4994 = abs(_4934);
        float _4996 = abs(_4936);
        bool _4998 = _4994 >= _4996;
        bool _5000 = isnan(_4994);
        bool _5002 = _4998 || _5000;
        bool _5004 = isnan(_4996);
        bool _5006 = _5002 || _5004;
        float _5008 = float(_5006);
        float _5010 = _4992 + _5008;
        float _5012 = 1.0 / _5010;
        float _5014 = _5012 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
        float _5016 = _4992 * _5014;
        float _5018 = _5008 * _5014;
        float _5020 = -_5016;
        float _5022 = fma(_5020, _4960, 1.0);
        float _5024 = -_5016;
        float _5026 = fma(_5024, _4962, 1.0);
        float _5028 = -_5018;
        float _5030 = fma(_5028, _4968, _5022);
        float _5032 = precise::clamp(_5030, 0.0, 1.0);
        float _5034 = -_5018;
        float _5036 = fma(_5034, _4970, _5026);
        float _5038 = precise::clamp(_5036, 0.0, 1.0);
        float _5040 = _4974 * _5032;
        float _5042 = _4976 * _5038;
        out.m_42.x = as_type<float>(_3070);
        out.m_42.y = as_type<float>(_3072);
        out.m_42.z = _5040;
        out.m_42.w = _5042;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    out.m_42.x = as_type<float>(_3070);
    out.m_42.y = as_type<float>(_3072);
    out.m_42.z = 0.0;
    out.m_42.w = 0.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

