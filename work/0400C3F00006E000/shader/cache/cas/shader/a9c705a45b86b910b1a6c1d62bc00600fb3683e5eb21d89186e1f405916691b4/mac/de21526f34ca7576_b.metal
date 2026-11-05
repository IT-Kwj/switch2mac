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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    float2 _1125 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1125, float2(0.0), isnan(_1125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1125, float2(0.0), isnan(_1125))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_35.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.z;
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
    float _149 = _63 * _123;
    float _151 = _63 * _129;
    float _153 = _63 * _135;
    bool _157 = _75 > 0.0;
    float _159 = _63 * _117;
    int _162 = as_type<int>(_63);
    int _164 = as_type<int>(_129);
    int _166 = as_type<int>(_143);
    int _168 = as_type<int>(_111);
    int _170 = as_type<int>(_141);
    int _172 = as_type<int>(_159);
    float _174 = _117;
    int _176 = as_type<int>(_137);
    float _178 = _143;
    int _180 = as_type<int>(_73);
    float _182 = _153;
    int _184 = as_type<int>(_147);
    if (!_157)
    {
        _162 = 0;
        _164 = 0;
    }
    int _186 = _162;
    int _188 = _164;
    bool _190 = !_157;
    int _192 = _186;
    int _194 = _188;
    float _196 = 0.0;
    if (!_190)
    {
        float2 _1277 = float2(_151, _141);
        float2 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1277, float2(0.0), isnan(_1277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1277, float2(0.0), isnan(_1277))).xy;
        float _200 = _198.x;
        float _202 = _198.y;
        float2 _1289 = float2(_143, _137);
        float2 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1289, float2(0.0), isnan(_1289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1289, float2(0.0), isnan(_1289))).xy;
        float _206 = _204.x;
        float _208 = _204.y;
        float _210 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _151);
        float _212 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _143);
        bool _214 = _202 >= 0.800000011920928955078125;
        bool _216 = isnan(_202);
        bool _218 = _214 || _216;
        bool _220 = isnan(0.800000011920928955078125);
        bool _222 = _218 || _220;
        bool _224 = _208 > 0.800000011920928955078125;
        bool _226 = isnan(_208);
        bool _228 = _224 || _226;
        bool _230 = isnan(0.800000011920928955078125);
        bool _232 = _228 || _230;
        bool _234 = _200 != 0.0;
        bool _236 = isnan(_200);
        bool _238 = _234 || _236;
        bool _240 = isnan(0.0);
        bool _242 = _238 || _240;
        bool _244 = !_222;
        bool _246 = _242 || _244;
        bool _248 = _206 != 0.0;
        bool _250 = isnan(_206);
        bool _252 = _248 || _250;
        bool _254 = isnan(0.0);
        bool _256 = _252 || _254;
        bool _258 = !_232;
        bool _260 = _256 || _258;
        float _262 = _200;
        float _264 = _202;
        int _266 = as_type<int>(_210);
        float _268 = _212;
        if (!_246)
        {
            float2 _1376 = float2(_210, _141);
            float2 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376))).xy;
            float _272 = _270.x;
            float _274 = _270.y;
            _262 = _272;
            _264 = _274;
        }
        float _276 = _262;
        float _278 = _264;
        float _280 = _206;
        float _282 = _208;
        if (!_260)
        {
            float2 _1398 = float2(_212, _137);
            float2 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1398, float2(0.0), isnan(_1398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1398, float2(0.0), isnan(_1398))).xy;
            float _286 = _284.x;
            float _288 = _284.y;
            _280 = _286;
            _282 = _288;
        }
        float _290 = _280;
        float _292 = _282;
        if (_246)
        {
            _166 = 1;
        }
        int _294 = _166;
        int _296 = _294;
        if (!_246)
        {
            _296 = 0;
        }
        int _298 = _296;
        float _300 = 0.0;
        float _302 = as_type<float>(_298);
        if (_246)
        {
            _300 = _210;
        }
        float _304 = _300;
        float _306 = _304;
        if (!_246)
        {
            float _308 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _210);
            _306 = _308;
        }
        float _310 = _306;
        float _312 = _310;
        if (_260)
        {
            _168 = 1;
        }
        int _314 = _168;
        int _316 = _298 & 1;
        bool _318 = _316 != 0;
        int _320 = _314;
        if (!_260)
        {
            _320 = 0;
        }
        int _322 = _320;
        int _324 = _322 & 1;
        bool _326 = _324 != 0;
        float _328 = as_type<float>(_322);
        if (_318)
        {
            _266 = _298;
        }
        int _330 = _266;
        int _332 = _330;
        int _334 = _330;
        float _336 = _278;
        float _338 = _276;
        float _340 = _290;
        float _342 = _292;
        if (!_318)
        {
            bool _344 = _278 >= 0.800000011920928955078125;
            bool _346 = isnan(_278);
            bool _348 = _344 || _346;
            bool _350 = isnan(0.800000011920928955078125);
            bool _352 = _348 || _350;
            bool _354 = _276 != 0.0;
            bool _356 = isnan(_276);
            bool _358 = _354 || _356;
            bool _360 = isnan(0.0);
            bool _362 = _358 || _360;
            bool _364 = !_352;
            bool _366 = _362 || _364;
            if (_366)
            {
                _332 = 1;
            }
            int _368 = _332;
            _334 = _368;
            if (!_366)
            {
                float2 _1513 = float2(_310, _141);
                float2 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1513, float2(0.0), isnan(_1513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1513, float2(0.0), isnan(_1513))).xy;
                float _372 = _370.x;
                float _374 = _370.y;
                float _376 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _310);
                _334 = _298;
                _312 = _376;
                _336 = _374;
                _338 = _372;
            }
        }
        int _378 = _334;
        float _380 = _312;
        float _382 = _336;
        float _384 = _338;
        int _386 = _378 & 1;
        bool _388 = _386 != 0;
        float _390 = _384;
        float _392 = _382;
        float _394 = as_type<float>(_378);
        if (!_260)
        {
            float _396 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _212);
            _268 = _396;
        }
        float _398 = _268;
        float _400 = _398;
        if (_388)
        {
            _302 = _380;
        }
        float _402 = _302;
        float _404 = _402;
        float _406 = _402;
        if (!_388)
        {
            bool _408 = _382 >= 0.800000011920928955078125;
            bool _410 = isnan(_382);
            bool _412 = _408 || _410;
            bool _414 = isnan(0.800000011920928955078125);
            bool _416 = _412 || _414;
            bool _418 = _384 != 0.0;
            bool _420 = isnan(_384);
            bool _422 = _418 || _420;
            bool _424 = isnan(0.0);
            bool _426 = _422 || _424;
            bool _428 = !_416;
            bool _430 = _426 || _428;
            if (_430)
            {
                _404 = _380;
            }
            float _432 = _404;
            _406 = _432;
            if (!_430)
            {
                float2 _1604 = float2(_380, _141);
                float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1604, float2(0.0), isnan(_1604))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1604, float2(0.0), isnan(_1604))).xy;
                float _436 = _434.x;
                float _438 = _434.y;
                float _440 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _380);
                _390 = _436;
                _392 = _438;
                _406 = _440;
            }
        }
        float _442 = _390;
        float _444 = _392;
        float _446 = _406;
        if (_326)
        {
            _170 = _322;
        }
        int _448 = _170;
        int _450 = _448;
        int _452 = _448;
        if (!_326)
        {
            bool _454 = _292 > 0.800000011920928955078125;
            bool _456 = isnan(_292);
            bool _458 = _454 || _456;
            bool _460 = isnan(0.800000011920928955078125);
            bool _462 = _458 || _460;
            bool _464 = _290 != 0.0;
            bool _466 = isnan(_290);
            bool _468 = _464 || _466;
            bool _470 = isnan(0.0);
            bool _472 = _468 || _470;
            bool _474 = !_462;
            bool _476 = _472 || _474;
            if (_476)
            {
                _450 = 1;
            }
            int _478 = _450;
            _452 = _478;
            if (!_476)
            {
                float2 _1673 = float2(_398, _137);
                float2 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1673, float2(0.0), isnan(_1673))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1673, float2(0.0), isnan(_1673))).xy;
                float _482 = _480.x;
                float _484 = _480.y;
                float _486 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _398);
                _452 = _322;
                _340 = _482;
                _342 = _484;
                _400 = _486;
            }
        }
        int _488 = _452;
        float _490 = _340;
        float _492 = _342;
        float _494 = _400;
        int _496 = _488 & 1;
        bool _498 = _496 != 0;
        float _500 = _494;
        if (_498)
        {
            _394 = _490;
        }
        float _502 = _394;
        float _504 = _502;
        float _506 = _502;
        if (_498)
        {
            _328 = _492;
        }
        float _508 = _328;
        float _510 = _508;
        float _512 = _508;
        if (!_498)
        {
            bool _514 = _492 > 0.800000011920928955078125;
            bool _516 = isnan(_492);
            bool _518 = _514 || _516;
            bool _520 = isnan(0.800000011920928955078125);
            bool _522 = _518 || _520;
            bool _524 = _490 != 0.0;
            bool _526 = isnan(_490);
            bool _528 = _524 || _526;
            bool _530 = isnan(0.0);
            bool _532 = _528 || _530;
            bool _534 = !_522;
            bool _536 = _532 || _534;
            if (_536)
            {
                _504 = _490;
            }
            float _538 = _504;
            _506 = _538;
            if (_536)
            {
                _510 = _492;
            }
            float _540 = _510;
            _512 = _540;
            if (!_536)
            {
                float2 _1763 = float2(_494, _137);
                float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1763, float2(0.0), isnan(_1763))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1763, float2(0.0), isnan(_1763))).xy;
                float _544 = _542.x;
                float _546 = _542.y;
                float _548 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _494);
                _506 = _544;
                _512 = _546;
                _500 = _548;
            }
        }
        float _550 = _506;
        float _552 = _512;
        float _554 = _500;
        float _556 = fma(_550, 0.5, 0.5234375);
        float _558 = fma(_552, 2.0, 0.03125);
        float _560 = fma(_442, 0.5, 0.0078125);
        float _562 = fma(_444, 2.0, 0.03125);
        float2 _1799 = float2(_556, _558);
        float _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1799, float2(0.0), isnan(_1799))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1799, float2(0.0), isnan(_1799))).x;
        float2 _1807 = float2(_560, _562);
        float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1807, float2(0.0), isnan(_1807))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1807, float2(0.0), isnan(_1807))).x;
        float _568 = fma(_564, -2.007874011993408203125, 3.25);
        float _570 = fma(_566, -2.007874011993408203125, 3.25);
        float _572 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _574 = fma(_568, _572, _554);
        float _576 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[0].z, _446);
        float2 _1833 = float2(_574, _153);
        float _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1833, float2(0.0), isnan(_1833)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1833, float2(0.0), isnan(_1833)), int2(1, 0)).x;
        float2 _1843 = float2(_576, _153);
        float _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1843, float2(0.0), isnan(_1843))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1843, float2(0.0), isnan(_1843))).x;
        float _582 = -_159;
        float _584 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[0].x, _582);
        float _586 = -_159;
        float _588 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[0].x, _586);
        float _590 = rint(_584);
        float _592 = rint(_588);
        float _594 = abs(_590);
        float _596 = sqrt(_594);
        float _598 = abs(_592);
        float _600 = sqrt(_598);
        float _602 = _578 * 4.0;
        float _604 = _580 * 4.0;
        float _606 = rint(_602);
        float _608 = rint(_604);
        float _610 = fma(_606, 16.0, _600);
        float _612 = fma(_610, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _614 = fma(_608, 16.0, _596);
        float _616 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _612);
        float _618 = fma(_614, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _1906 = float2(_618, _616);
        float2 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1906, float2(0.0), isnan(_1906))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1906, float2(0.0), isnan(_1906))).xy;
        float _622 = _620.x;
        float _624 = _620.y;
        _192 = as_type<int>(_622);
        _194 = as_type<int>(_624);
        _172 = as_type<int>(_592);
        _196 = _576;
        _174 = _580;
        _176 = 1003277517;
        _178 = _602;
    }
    int _626 = _192;
    int _628 = _194;
    int _630 = _172;
    float _632 = _196;
    float _634 = _174;
    int _636 = _176;
    float _638 = _178;
    bool _640 = _73 > 0.0;
    int _642 = _630;
    float _644 = _632;
    float _646 = _634;
    int _648 = _636;
    float _650 = _638;
    if (!_640)
    {
        _180 = 0;
        _642 = 0;
    }
    int _652 = _180;
    int _654 = _642;
    if (!_640)
    {
        out.m_42.x = as_type<float>(_626);
        out.m_42.y = as_type<float>(_628);
        out.m_42.z = as_type<float>(_652);
        out.m_42.w = as_type<float>(_654);
        return out;
    }
    float2 _1966 = float2(_139, _153);
    float2 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1966, float2(0.0), isnan(_1966))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1966, float2(0.0), isnan(_1966))).xy;
    float _658 = _656.x;
    float _660 = _656.y;
    float2 _1978 = float2(_145, _147);
    float2 _662 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1978, float2(0.0), isnan(_1978))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1978, float2(0.0), isnan(_1978))).xy;
    float _664 = _662.x;
    float _666 = _662.y;
    float _668 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _153);
    float _670 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
    bool _672 = _658 > 0.800000011920928955078125;
    bool _674 = isnan(_658);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.800000011920928955078125);
    bool _680 = _676 || _678;
    bool _682 = _664 > 0.800000011920928955078125;
    bool _684 = isnan(_664);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.800000011920928955078125);
    bool _690 = _686 || _688;
    bool _692 = _660 != 0.0;
    bool _694 = isnan(_660);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    bool _702 = !_680;
    bool _704 = _700 || _702;
    bool _706 = _666 != 0.0;
    bool _708 = isnan(_666);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    bool _716 = !_690;
    bool _718 = _714 || _716;
    float _720 = _658;
    float _722 = _660;
    int _724 = as_type<int>(_668);
    float _726 = _670;
    if (_704)
    {
        _644 = _658;
    }
    float _728 = _644;
    if (_704)
    {
        _646 = _660;
    }
    float _730 = _646;
    if (_718)
    {
        _720 = _664;
    }
    float _732 = _720;
    if (_718)
    {
        _722 = _666;
    }
    float _734 = _722;
    float _736 = _728;
    float _738 = _730;
    if (!_704)
    {
        float2 _2082 = float2(_139, _668);
        float2 _740 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2082, float2(0.0), isnan(_2082))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2082, float2(0.0), isnan(_2082))).xy;
        float _742 = _740.x;
        float _744 = _740.y;
        _736 = _742;
        _738 = _744;
    }
    float _746 = _736;
    float _748 = _738;
    float _750 = _732;
    float _752 = _734;
    if (!_718)
    {
        float2 _2104 = float2(_145, _670);
        float2 _754 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2104, float2(0.0), isnan(_2104))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2104, float2(0.0), isnan(_2104))).xy;
        float _756 = _754.x;
        float _758 = _754.y;
        _750 = _756;
        _752 = _758;
    }
    float _760 = _750;
    float _762 = _752;
    if (_704)
    {
        _648 = 1;
    }
    int _764 = _648;
    int _766 = _764;
    if (!_704)
    {
        _766 = 0;
    }
    int _768 = _766;
    float _770 = as_type<float>(_768);
    if (_704)
    {
        _182 = _668;
    }
    float _772 = _182;
    float _774 = _772;
    if (!_704)
    {
        float _776 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _668);
        _774 = _776;
    }
    float _778 = _774;
    int _780 = _768 & 1;
    bool _782 = _780 != 0;
    float _784 = _778;
    if (_718)
    {
        _184 = 1;
    }
    int _786 = _184;
    int _788 = _786;
    if (!_718)
    {
        _788 = 0;
    }
    int _790 = _788;
    int _792 = _790 & 1;
    bool _794 = _792 != 0;
    if (_782)
    {
        _650 = _778;
    }
    float _796 = _650;
    float _798 = _796;
    float _800 = _796;
    if (_782)
    {
        _724 = _768;
    }
    int _802 = _724;
    int _804 = _802;
    int _806 = _802;
    float _808 = _746;
    float _810 = _748;
    float _812 = _760;
    float _814 = _762;
    if (!_782)
    {
        bool _816 = _746 > 0.800000011920928955078125;
        bool _818 = isnan(_746);
        bool _820 = _816 || _818;
        bool _822 = isnan(0.800000011920928955078125);
        bool _824 = _820 || _822;
        bool _826 = _748 != 0.0;
        bool _828 = isnan(_748);
        bool _830 = _826 || _828;
        bool _832 = isnan(0.0);
        bool _834 = _830 || _832;
        bool _836 = !_824;
        bool _838 = _834 || _836;
        if (_838)
        {
            _798 = _778;
        }
        float _840 = _798;
        _800 = _840;
        if (_838)
        {
            _804 = 1;
        }
        int _842 = _804;
        _806 = _842;
        if (!_838)
        {
            float2 _2230 = float2(_139, _778);
            float2 _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2230, float2(0.0), isnan(_2230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2230, float2(0.0), isnan(_2230))).xy;
            float _846 = _844.x;
            float _848 = _844.y;
            float _850 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _778);
            _806 = _768;
            _808 = _846;
            _810 = _848;
            _800 = _850;
        }
    }
    int _852 = _806;
    float _854 = _808;
    float _856 = _810;
    float _858 = _800;
    int _860 = _852 & 1;
    bool _862 = _860 != 0;
    float _864 = _858;
    int _866 = _852;
    if (!_718)
    {
        float _868 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _670);
        _726 = _868;
    }
    float _870 = _726;
    float _872 = _870;
    if (_862)
    {
        _770 = _854;
    }
    float _874 = _770;
    float _876 = _874;
    float _878 = _874;
    if (_862)
    {
        _784 = _856;
    }
    float _880 = _784;
    float _882 = _880;
    float _884 = _880;
    if (!_862)
    {
        bool _886 = _854 > 0.800000011920928955078125;
        bool _888 = isnan(_854);
        bool _890 = _886 || _888;
        bool _892 = isnan(0.800000011920928955078125);
        bool _894 = _890 || _892;
        bool _896 = _856 != 0.0;
        bool _898 = isnan(_856);
        bool _900 = _896 || _898;
        bool _902 = isnan(0.0);
        bool _904 = _900 || _902;
        bool _906 = !_894;
        bool _908 = _904 || _906;
        if (_908)
        {
            _876 = _854;
        }
        float _910 = _876;
        _878 = _910;
        if (_908)
        {
            _882 = _856;
        }
        float _912 = _882;
        _884 = _912;
        if (!_908)
        {
            float2 _2332 = float2(_139, _858);
            float2 _914 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2332, float2(0.0), isnan(_2332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2332, float2(0.0), isnan(_2332))).xy;
            float _916 = _914.x;
            float _918 = _914.y;
            float _920 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _858);
            _878 = _916;
            _884 = _918;
            _864 = _920;
        }
    }
    float _922 = _878;
    float _924 = _884;
    float _926 = _864;
    if (_794)
    {
        _866 = _790;
    }
    int _928 = _866;
    int _930 = _928;
    int _932 = _928;
    if (!_794)
    {
        bool _934 = _760 > 0.800000011920928955078125;
        bool _936 = isnan(_760);
        bool _938 = _934 || _936;
        bool _940 = isnan(0.800000011920928955078125);
        bool _942 = _938 || _940;
        bool _944 = _762 != 0.0;
        bool _946 = isnan(_762);
        bool _948 = _944 || _946;
        bool _950 = isnan(0.0);
        bool _952 = _948 || _950;
        bool _954 = !_942;
        bool _956 = _952 || _954;
        if (_956)
        {
            _930 = 1;
        }
        int _958 = _930;
        _932 = _958;
        if (!_956)
        {
            float2 _2401 = float2(_145, _870);
            float2 _960 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2401, float2(0.0), isnan(_2401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2401, float2(0.0), isnan(_2401))).xy;
            float _962 = _960.x;
            float _964 = _960.y;
            float _966 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _870);
            _932 = _790;
            _812 = _962;
            _814 = _964;
            _872 = _966;
        }
    }
    int _968 = _932;
    float _970 = _812;
    float _972 = _814;
    float _974 = _872;
    int _976 = _968 & 1;
    bool _978 = _976 != 0;
    float _980 = _972;
    float _982 = _970;
    float _984 = _974;
    if (!_978)
    {
        bool _986 = _970 > 0.800000011920928955078125;
        bool _988 = isnan(_970);
        bool _990 = _986 || _988;
        bool _992 = isnan(0.800000011920928955078125);
        bool _994 = _990 || _992;
        bool _996 = _972 != 0.0;
        bool _998 = isnan(_972);
        bool _1000 = _996 || _998;
        bool _1002 = isnan(0.0);
        bool _1004 = _1000 || _1002;
        bool _1006 = !_994;
        bool _1008 = _1004 || _1006;
        if (!_1008)
        {
            float2 _2467 = float2(_145, _974);
            float2 _1010 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2467, float2(0.0), isnan(_2467))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2467, float2(0.0), isnan(_2467))).xy;
            float _1012 = _1010.x;
            float _1014 = _1010.y;
            float _1016 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _974);
            _980 = _1014;
            _982 = _1012;
            _984 = _1016;
        }
    }
    float _1018 = _980;
    float _1020 = _982;
    float _1022 = _984;
    float _1024 = fma(_1018, 0.5, 0.5234375);
    float _1026 = fma(_1020, 2.0, 0.03125);
    float _1028 = fma(_922, 2.0, 0.03125);
    float _1030 = fma(_924, 0.5, 0.0078125);
    float2 _2499 = float2(_1024, _1026);
    float _1032 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2499, float2(0.0), isnan(_2499))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2499, float2(0.0), isnan(_2499))).x;
    float2 _2507 = float2(_1030, _1028);
    float _1034 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2507, float2(0.0), isnan(_2507))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2507, float2(0.0), isnan(_2507))).x;
    float _1036 = fma(_1032, -2.007874011993408203125, 3.25);
    float _1038 = fma(_1034, -2.007874011993408203125, 3.25);
    float _1040 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _1042 = fma(_1036, _1040, _1022);
    float _1044 = fma(_1038, (*spvDescriptorSet0.fp_c3)._m0[0].w, _926);
    float2 _2531 = float2(_151, _1042);
    float _1046 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2531, float2(0.0), isnan(_2531)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2531, float2(0.0), isnan(_2531)), int2(0, 1)).y;
    float2 _2540 = float2(_151, _1044);
    float _1048 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2540, float2(0.0), isnan(_2540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2540, float2(0.0), isnan(_2540))).y;
    float _1050 = -_149;
    float _1052 = fma(_1044, (*spvDescriptorSet0.fp_c3)._m0[0].y, _1050);
    float _1054 = -_149;
    float _1056 = fma(_1042, (*spvDescriptorSet0.fp_c3)._m0[0].y, _1054);
    float _1058 = rint(_1052);
    float _1060 = rint(_1056);
    float _1062 = abs(_1058);
    float _1064 = sqrt(_1062);
    float _1066 = abs(_1060);
    float _1068 = sqrt(_1066);
    float _1070 = _1046 * 4.0;
    float _1072 = _1048 * 4.0;
    float _1074 = rint(_1070);
    float _1076 = rint(_1072);
    float _1078 = fma(_1074, 16.0, _1068);
    float _1080 = fma(_1078, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
    float _1082 = fma(_1076, 16.0, _1064);
    float _1084 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _1080);
    float _1086 = fma(_1082, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
    float2 _2596 = float2(_1086, _1084);
    float2 _1088 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2596, float2(0.0), isnan(_2596))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2596, float2(0.0), isnan(_2596))).xy;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    out.m_42.x = as_type<float>(_626);
    out.m_42.y = as_type<float>(_628);
    out.m_42.z = _1090;
    out.m_42.w = _1092;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
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
    float2 _1125 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1125, float2(0.0), isnan(_1125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1125, float2(0.0), isnan(_1125))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_35.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.z;
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
    float _149 = _63 * _123;
    float _151 = _63 * _129;
    float _153 = _63 * _135;
    bool _157 = _75 > 0.0;
    float _159 = _63 * _117;
    int _162 = as_type<int>(_63);
    int _164 = as_type<int>(_129);
    int _166 = as_type<int>(_143);
    int _168 = as_type<int>(_111);
    int _170 = as_type<int>(_141);
    int _172 = as_type<int>(_159);
    float _174 = _117;
    int _176 = as_type<int>(_137);
    float _178 = _143;
    int _180 = as_type<int>(_73);
    float _182 = _153;
    int _184 = as_type<int>(_147);
    if (!_157)
    {
        _162 = 0;
        _164 = 0;
    }
    int _186 = _162;
    int _188 = _164;
    bool _190 = !_157;
    int _192 = _186;
    int _194 = _188;
    float _196 = 0.0;
    if (!_190)
    {
        float2 _1277 = float2(_151, _141);
        float2 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1277, float2(0.0), isnan(_1277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1277, float2(0.0), isnan(_1277))).xy;
        float _200 = _198.x;
        float _202 = _198.y;
        float2 _1289 = float2(_143, _137);
        float2 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1289, float2(0.0), isnan(_1289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1289, float2(0.0), isnan(_1289))).xy;
        float _206 = _204.x;
        float _208 = _204.y;
        float _210 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _151);
        float _212 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _143);
        bool _214 = _202 >= 0.800000011920928955078125;
        bool _216 = isnan(_202);
        bool _218 = _214 || _216;
        bool _220 = isnan(0.800000011920928955078125);
        bool _222 = _218 || _220;
        bool _224 = _208 > 0.800000011920928955078125;
        bool _226 = isnan(_208);
        bool _228 = _224 || _226;
        bool _230 = isnan(0.800000011920928955078125);
        bool _232 = _228 || _230;
        bool _234 = _200 != 0.0;
        bool _236 = isnan(_200);
        bool _238 = _234 || _236;
        bool _240 = isnan(0.0);
        bool _242 = _238 || _240;
        bool _244 = !_222;
        bool _246 = _242 || _244;
        bool _248 = _206 != 0.0;
        bool _250 = isnan(_206);
        bool _252 = _248 || _250;
        bool _254 = isnan(0.0);
        bool _256 = _252 || _254;
        bool _258 = !_232;
        bool _260 = _256 || _258;
        float _262 = _200;
        float _264 = _202;
        int _266 = as_type<int>(_210);
        float _268 = _212;
        if (!_246)
        {
            float2 _1376 = float2(_210, _141);
            float2 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376))).xy;
            float _272 = _270.x;
            float _274 = _270.y;
            _262 = _272;
            _264 = _274;
        }
        float _276 = _262;
        float _278 = _264;
        float _280 = _206;
        float _282 = _208;
        if (!_260)
        {
            float2 _1398 = float2(_212, _137);
            float2 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1398, float2(0.0), isnan(_1398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1398, float2(0.0), isnan(_1398))).xy;
            float _286 = _284.x;
            float _288 = _284.y;
            _280 = _286;
            _282 = _288;
        }
        float _290 = _280;
        float _292 = _282;
        if (_246)
        {
            _166 = 1;
        }
        int _294 = _166;
        int _296 = _294;
        if (!_246)
        {
            _296 = 0;
        }
        int _298 = _296;
        float _300 = 0.0;
        float _302 = as_type<float>(_298);
        if (_246)
        {
            _300 = _210;
        }
        float _304 = _300;
        float _306 = _304;
        if (!_246)
        {
            float _308 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _210);
            _306 = _308;
        }
        float _310 = _306;
        float _312 = _310;
        if (_260)
        {
            _168 = 1;
        }
        int _314 = _168;
        int _316 = _298 & 1;
        bool _318 = _316 != 0;
        int _320 = _314;
        if (!_260)
        {
            _320 = 0;
        }
        int _322 = _320;
        int _324 = _322 & 1;
        bool _326 = _324 != 0;
        float _328 = as_type<float>(_322);
        if (_318)
        {
            _266 = _298;
        }
        int _330 = _266;
        int _332 = _330;
        int _334 = _330;
        float _336 = _278;
        float _338 = _276;
        float _340 = _290;
        float _342 = _292;
        if (!_318)
        {
            bool _344 = _278 >= 0.800000011920928955078125;
            bool _346 = isnan(_278);
            bool _348 = _344 || _346;
            bool _350 = isnan(0.800000011920928955078125);
            bool _352 = _348 || _350;
            bool _354 = _276 != 0.0;
            bool _356 = isnan(_276);
            bool _358 = _354 || _356;
            bool _360 = isnan(0.0);
            bool _362 = _358 || _360;
            bool _364 = !_352;
            bool _366 = _362 || _364;
            if (_366)
            {
                _332 = 1;
            }
            int _368 = _332;
            _334 = _368;
            if (!_366)
            {
                float2 _1513 = float2(_310, _141);
                float2 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1513, float2(0.0), isnan(_1513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1513, float2(0.0), isnan(_1513))).xy;
                float _372 = _370.x;
                float _374 = _370.y;
                float _376 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _310);
                _334 = _298;
                _312 = _376;
                _336 = _374;
                _338 = _372;
            }
        }
        int _378 = _334;
        float _380 = _312;
        float _382 = _336;
        float _384 = _338;
        int _386 = _378 & 1;
        bool _388 = _386 != 0;
        float _390 = _384;
        float _392 = _382;
        float _394 = as_type<float>(_378);
        if (!_260)
        {
            float _396 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _212);
            _268 = _396;
        }
        float _398 = _268;
        float _400 = _398;
        if (_388)
        {
            _302 = _380;
        }
        float _402 = _302;
        float _404 = _402;
        float _406 = _402;
        if (!_388)
        {
            bool _408 = _382 >= 0.800000011920928955078125;
            bool _410 = isnan(_382);
            bool _412 = _408 || _410;
            bool _414 = isnan(0.800000011920928955078125);
            bool _416 = _412 || _414;
            bool _418 = _384 != 0.0;
            bool _420 = isnan(_384);
            bool _422 = _418 || _420;
            bool _424 = isnan(0.0);
            bool _426 = _422 || _424;
            bool _428 = !_416;
            bool _430 = _426 || _428;
            if (_430)
            {
                _404 = _380;
            }
            float _432 = _404;
            _406 = _432;
            if (!_430)
            {
                float2 _1604 = float2(_380, _141);
                float2 _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1604, float2(0.0), isnan(_1604))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1604, float2(0.0), isnan(_1604))).xy;
                float _436 = _434.x;
                float _438 = _434.y;
                float _440 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _380);
                _390 = _436;
                _392 = _438;
                _406 = _440;
            }
        }
        float _442 = _390;
        float _444 = _392;
        float _446 = _406;
        if (_326)
        {
            _170 = _322;
        }
        int _448 = _170;
        int _450 = _448;
        int _452 = _448;
        if (!_326)
        {
            bool _454 = _292 > 0.800000011920928955078125;
            bool _456 = isnan(_292);
            bool _458 = _454 || _456;
            bool _460 = isnan(0.800000011920928955078125);
            bool _462 = _458 || _460;
            bool _464 = _290 != 0.0;
            bool _466 = isnan(_290);
            bool _468 = _464 || _466;
            bool _470 = isnan(0.0);
            bool _472 = _468 || _470;
            bool _474 = !_462;
            bool _476 = _472 || _474;
            if (_476)
            {
                _450 = 1;
            }
            int _478 = _450;
            _452 = _478;
            if (!_476)
            {
                float2 _1673 = float2(_398, _137);
                float2 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1673, float2(0.0), isnan(_1673))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1673, float2(0.0), isnan(_1673))).xy;
                float _482 = _480.x;
                float _484 = _480.y;
                float _486 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _398);
                _452 = _322;
                _340 = _482;
                _342 = _484;
                _400 = _486;
            }
        }
        int _488 = _452;
        float _490 = _340;
        float _492 = _342;
        float _494 = _400;
        int _496 = _488 & 1;
        bool _498 = _496 != 0;
        float _500 = _494;
        if (_498)
        {
            _394 = _490;
        }
        float _502 = _394;
        float _504 = _502;
        float _506 = _502;
        if (_498)
        {
            _328 = _492;
        }
        float _508 = _328;
        float _510 = _508;
        float _512 = _508;
        if (!_498)
        {
            bool _514 = _492 > 0.800000011920928955078125;
            bool _516 = isnan(_492);
            bool _518 = _514 || _516;
            bool _520 = isnan(0.800000011920928955078125);
            bool _522 = _518 || _520;
            bool _524 = _490 != 0.0;
            bool _526 = isnan(_490);
            bool _528 = _524 || _526;
            bool _530 = isnan(0.0);
            bool _532 = _528 || _530;
            bool _534 = !_522;
            bool _536 = _532 || _534;
            if (_536)
            {
                _504 = _490;
            }
            float _538 = _504;
            _506 = _538;
            if (_536)
            {
                _510 = _492;
            }
            float _540 = _510;
            _512 = _540;
            if (!_536)
            {
                float2 _1763 = float2(_494, _137);
                float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1763, float2(0.0), isnan(_1763))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1763, float2(0.0), isnan(_1763))).xy;
                float _544 = _542.x;
                float _546 = _542.y;
                float _548 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _494);
                _506 = _544;
                _512 = _546;
                _500 = _548;
            }
        }
        float _550 = _506;
        float _552 = _512;
        float _554 = _500;
        float _556 = fma(_550, 0.5, 0.5234375);
        float _558 = fma(_552, 2.0, 0.03125);
        float _560 = fma(_442, 0.5, 0.0078125);
        float _562 = fma(_444, 2.0, 0.03125);
        float2 _1799 = float2(_556, _558);
        float _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1799, float2(0.0), isnan(_1799))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1799, float2(0.0), isnan(_1799))).x;
        float2 _1807 = float2(_560, _562);
        float _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1807, float2(0.0), isnan(_1807))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1807, float2(0.0), isnan(_1807))).x;
        float _568 = fma(_564, -2.007874011993408203125, 3.25);
        float _570 = fma(_566, -2.007874011993408203125, 3.25);
        float _572 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _574 = fma(_568, _572, _554);
        float _576 = fma(_570, (*spvDescriptorSet0.fp_c3)._m0[0].z, _446);
        float2 _1833 = float2(_574, _153);
        float _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1833, float2(0.0), isnan(_1833)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1833, float2(0.0), isnan(_1833)), int2(1, 0)).x;
        float2 _1843 = float2(_576, _153);
        float _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1843, float2(0.0), isnan(_1843))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1843, float2(0.0), isnan(_1843))).x;
        float _582 = -_159;
        float _584 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[0].x, _582);
        float _586 = -_159;
        float _588 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[0].x, _586);
        float _590 = rint(_584);
        float _592 = rint(_588);
        float _594 = abs(_590);
        float _596 = sqrt(_594);
        float _598 = abs(_592);
        float _600 = sqrt(_598);
        float _602 = _578 * 4.0;
        float _604 = _580 * 4.0;
        float _606 = rint(_602);
        float _608 = rint(_604);
        float _610 = fma(_606, 16.0, _600);
        float _612 = fma(_610, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _614 = fma(_608, 16.0, _596);
        float _616 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _612);
        float _618 = fma(_614, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _1906 = float2(_618, _616);
        float2 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1906, float2(0.0), isnan(_1906))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1906, float2(0.0), isnan(_1906))).xy;
        float _622 = _620.x;
        float _624 = _620.y;
        _192 = as_type<int>(_622);
        _194 = as_type<int>(_624);
        _172 = as_type<int>(_592);
        _196 = _576;
        _174 = _580;
        _176 = 1003277517;
        _178 = _602;
    }
    int _626 = _192;
    int _628 = _194;
    int _630 = _172;
    float _632 = _196;
    float _634 = _174;
    int _636 = _176;
    float _638 = _178;
    bool _640 = _73 > 0.0;
    int _642 = _630;
    float _644 = _632;
    float _646 = _634;
    int _648 = _636;
    float _650 = _638;
    if (!_640)
    {
        _180 = 0;
        _642 = 0;
    }
    int _652 = _180;
    int _654 = _642;
    if (!_640)
    {
        out.m_42.x = as_type<float>(_626);
        out.m_42.y = as_type<float>(_628);
        out.m_42.z = as_type<float>(_652);
        out.m_42.w = as_type<float>(_654);
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _1966 = float2(_139, _153);
    float2 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1966, float2(0.0), isnan(_1966))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1966, float2(0.0), isnan(_1966))).xy;
    float _658 = _656.x;
    float _660 = _656.y;
    float2 _1978 = float2(_145, _147);
    float2 _662 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1978, float2(0.0), isnan(_1978))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1978, float2(0.0), isnan(_1978))).xy;
    float _664 = _662.x;
    float _666 = _662.y;
    float _668 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _153);
    float _670 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
    bool _672 = _658 > 0.800000011920928955078125;
    bool _674 = isnan(_658);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.800000011920928955078125);
    bool _680 = _676 || _678;
    bool _682 = _664 > 0.800000011920928955078125;
    bool _684 = isnan(_664);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.800000011920928955078125);
    bool _690 = _686 || _688;
    bool _692 = _660 != 0.0;
    bool _694 = isnan(_660);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    bool _702 = !_680;
    bool _704 = _700 || _702;
    bool _706 = _666 != 0.0;
    bool _708 = isnan(_666);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    bool _716 = !_690;
    bool _718 = _714 || _716;
    float _720 = _658;
    float _722 = _660;
    int _724 = as_type<int>(_668);
    float _726 = _670;
    if (_704)
    {
        _644 = _658;
    }
    float _728 = _644;
    if (_704)
    {
        _646 = _660;
    }
    float _730 = _646;
    if (_718)
    {
        _720 = _664;
    }
    float _732 = _720;
    if (_718)
    {
        _722 = _666;
    }
    float _734 = _722;
    float _736 = _728;
    float _738 = _730;
    if (!_704)
    {
        float2 _2082 = float2(_139, _668);
        float2 _740 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2082, float2(0.0), isnan(_2082))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2082, float2(0.0), isnan(_2082))).xy;
        float _742 = _740.x;
        float _744 = _740.y;
        _736 = _742;
        _738 = _744;
    }
    float _746 = _736;
    float _748 = _738;
    float _750 = _732;
    float _752 = _734;
    if (!_718)
    {
        float2 _2104 = float2(_145, _670);
        float2 _754 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2104, float2(0.0), isnan(_2104))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2104, float2(0.0), isnan(_2104))).xy;
        float _756 = _754.x;
        float _758 = _754.y;
        _750 = _756;
        _752 = _758;
    }
    float _760 = _750;
    float _762 = _752;
    if (_704)
    {
        _648 = 1;
    }
    int _764 = _648;
    int _766 = _764;
    if (!_704)
    {
        _766 = 0;
    }
    int _768 = _766;
    float _770 = as_type<float>(_768);
    if (_704)
    {
        _182 = _668;
    }
    float _772 = _182;
    float _774 = _772;
    if (!_704)
    {
        float _776 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _668);
        _774 = _776;
    }
    float _778 = _774;
    int _780 = _768 & 1;
    bool _782 = _780 != 0;
    float _784 = _778;
    if (_718)
    {
        _184 = 1;
    }
    int _786 = _184;
    int _788 = _786;
    if (!_718)
    {
        _788 = 0;
    }
    int _790 = _788;
    int _792 = _790 & 1;
    bool _794 = _792 != 0;
    if (_782)
    {
        _650 = _778;
    }
    float _796 = _650;
    float _798 = _796;
    float _800 = _796;
    if (_782)
    {
        _724 = _768;
    }
    int _802 = _724;
    int _804 = _802;
    int _806 = _802;
    float _808 = _746;
    float _810 = _748;
    float _812 = _760;
    float _814 = _762;
    if (!_782)
    {
        bool _816 = _746 > 0.800000011920928955078125;
        bool _818 = isnan(_746);
        bool _820 = _816 || _818;
        bool _822 = isnan(0.800000011920928955078125);
        bool _824 = _820 || _822;
        bool _826 = _748 != 0.0;
        bool _828 = isnan(_748);
        bool _830 = _826 || _828;
        bool _832 = isnan(0.0);
        bool _834 = _830 || _832;
        bool _836 = !_824;
        bool _838 = _834 || _836;
        if (_838)
        {
            _798 = _778;
        }
        float _840 = _798;
        _800 = _840;
        if (_838)
        {
            _804 = 1;
        }
        int _842 = _804;
        _806 = _842;
        if (!_838)
        {
            float2 _2230 = float2(_139, _778);
            float2 _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2230, float2(0.0), isnan(_2230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2230, float2(0.0), isnan(_2230))).xy;
            float _846 = _844.x;
            float _848 = _844.y;
            float _850 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _778);
            _806 = _768;
            _808 = _846;
            _810 = _848;
            _800 = _850;
        }
    }
    int _852 = _806;
    float _854 = _808;
    float _856 = _810;
    float _858 = _800;
    int _860 = _852 & 1;
    bool _862 = _860 != 0;
    float _864 = _858;
    int _866 = _852;
    if (!_718)
    {
        float _868 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _670);
        _726 = _868;
    }
    float _870 = _726;
    float _872 = _870;
    if (_862)
    {
        _770 = _854;
    }
    float _874 = _770;
    float _876 = _874;
    float _878 = _874;
    if (_862)
    {
        _784 = _856;
    }
    float _880 = _784;
    float _882 = _880;
    float _884 = _880;
    if (!_862)
    {
        bool _886 = _854 > 0.800000011920928955078125;
        bool _888 = isnan(_854);
        bool _890 = _886 || _888;
        bool _892 = isnan(0.800000011920928955078125);
        bool _894 = _890 || _892;
        bool _896 = _856 != 0.0;
        bool _898 = isnan(_856);
        bool _900 = _896 || _898;
        bool _902 = isnan(0.0);
        bool _904 = _900 || _902;
        bool _906 = !_894;
        bool _908 = _904 || _906;
        if (_908)
        {
            _876 = _854;
        }
        float _910 = _876;
        _878 = _910;
        if (_908)
        {
            _882 = _856;
        }
        float _912 = _882;
        _884 = _912;
        if (!_908)
        {
            float2 _2332 = float2(_139, _858);
            float2 _914 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2332, float2(0.0), isnan(_2332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2332, float2(0.0), isnan(_2332))).xy;
            float _916 = _914.x;
            float _918 = _914.y;
            float _920 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _858);
            _878 = _916;
            _884 = _918;
            _864 = _920;
        }
    }
    float _922 = _878;
    float _924 = _884;
    float _926 = _864;
    if (_794)
    {
        _866 = _790;
    }
    int _928 = _866;
    int _930 = _928;
    int _932 = _928;
    if (!_794)
    {
        bool _934 = _760 > 0.800000011920928955078125;
        bool _936 = isnan(_760);
        bool _938 = _934 || _936;
        bool _940 = isnan(0.800000011920928955078125);
        bool _942 = _938 || _940;
        bool _944 = _762 != 0.0;
        bool _946 = isnan(_762);
        bool _948 = _944 || _946;
        bool _950 = isnan(0.0);
        bool _952 = _948 || _950;
        bool _954 = !_942;
        bool _956 = _952 || _954;
        if (_956)
        {
            _930 = 1;
        }
        int _958 = _930;
        _932 = _958;
        if (!_956)
        {
            float2 _2401 = float2(_145, _870);
            float2 _960 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2401, float2(0.0), isnan(_2401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2401, float2(0.0), isnan(_2401))).xy;
            float _962 = _960.x;
            float _964 = _960.y;
            float _966 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _870);
            _932 = _790;
            _812 = _962;
            _814 = _964;
            _872 = _966;
        }
    }
    int _968 = _932;
    float _970 = _812;
    float _972 = _814;
    float _974 = _872;
    int _976 = _968 & 1;
    bool _978 = _976 != 0;
    float _980 = _972;
    float _982 = _970;
    float _984 = _974;
    if (!_978)
    {
        bool _986 = _970 > 0.800000011920928955078125;
        bool _988 = isnan(_970);
        bool _990 = _986 || _988;
        bool _992 = isnan(0.800000011920928955078125);
        bool _994 = _990 || _992;
        bool _996 = _972 != 0.0;
        bool _998 = isnan(_972);
        bool _1000 = _996 || _998;
        bool _1002 = isnan(0.0);
        bool _1004 = _1000 || _1002;
        bool _1006 = !_994;
        bool _1008 = _1004 || _1006;
        if (!_1008)
        {
            float2 _2467 = float2(_145, _974);
            float2 _1010 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2467, float2(0.0), isnan(_2467))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2467, float2(0.0), isnan(_2467))).xy;
            float _1012 = _1010.x;
            float _1014 = _1010.y;
            float _1016 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _974);
            _980 = _1014;
            _982 = _1012;
            _984 = _1016;
        }
    }
    float _1018 = _980;
    float _1020 = _982;
    float _1022 = _984;
    float _1024 = fma(_1018, 0.5, 0.5234375);
    float _1026 = fma(_1020, 2.0, 0.03125);
    float _1028 = fma(_922, 2.0, 0.03125);
    float _1030 = fma(_924, 0.5, 0.0078125);
    float2 _2499 = float2(_1024, _1026);
    float _1032 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2499, float2(0.0), isnan(_2499))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2499, float2(0.0), isnan(_2499))).x;
    float2 _2507 = float2(_1030, _1028);
    float _1034 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2507, float2(0.0), isnan(_2507))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2507, float2(0.0), isnan(_2507))).x;
    float _1036 = fma(_1032, -2.007874011993408203125, 3.25);
    float _1038 = fma(_1034, -2.007874011993408203125, 3.25);
    float _1040 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _1042 = fma(_1036, _1040, _1022);
    float _1044 = fma(_1038, (*spvDescriptorSet0.fp_c3)._m0[0].w, _926);
    float2 _2531 = float2(_151, _1042);
    float _1046 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2531, float2(0.0), isnan(_2531)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2531, float2(0.0), isnan(_2531)), int2(0, 1)).y;
    float2 _2540 = float2(_151, _1044);
    float _1048 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2540, float2(0.0), isnan(_2540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2540, float2(0.0), isnan(_2540))).y;
    float _1050 = -_149;
    float _1052 = fma(_1044, (*spvDescriptorSet0.fp_c3)._m0[0].y, _1050);
    float _1054 = -_149;
    float _1056 = fma(_1042, (*spvDescriptorSet0.fp_c3)._m0[0].y, _1054);
    float _1058 = rint(_1052);
    float _1060 = rint(_1056);
    float _1062 = abs(_1058);
    float _1064 = sqrt(_1062);
    float _1066 = abs(_1060);
    float _1068 = sqrt(_1066);
    float _1070 = _1046 * 4.0;
    float _1072 = _1048 * 4.0;
    float _1074 = rint(_1070);
    float _1076 = rint(_1072);
    float _1078 = fma(_1074, 16.0, _1068);
    float _1080 = fma(_1078, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
    float _1082 = fma(_1076, 16.0, _1064);
    float _1084 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _1080);
    float _1086 = fma(_1082, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
    float2 _2596 = float2(_1086, _1084);
    float2 _1088 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2596, float2(0.0), isnan(_2596))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2596, float2(0.0), isnan(_2596))).xy;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    out.m_42.x = as_type<float>(_626);
    out.m_42.y = as_type<float>(_628);
    out.m_42.z = _1090;
    out.m_42.w = _1092;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

