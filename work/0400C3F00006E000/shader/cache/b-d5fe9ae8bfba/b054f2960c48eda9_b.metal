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
    float2 _2081 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2081, float2(0.0), isnan(_2081))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2081, float2(0.0), isnan(_2081))).xy;
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
    float _172 = _117;
    int _174 = as_type<int>(_159);
    float _176 = _111;
    int _178 = as_type<int>(_143);
    int _180 = as_type<int>(_73);
    int _182 = as_type<int>(_147);
    float _184 = _153;
    int _186 = as_type<int>(_139);
    if (!_157)
    {
        _162 = 0;
        _164 = 0;
    }
    int _188 = _162;
    int _190 = _164;
    bool _192 = !_157;
    int _194 = _188;
    int _196 = _190;
    float _198 = 0.0;
    if (!_192)
    {
        float2 _2235 = float2(_151, _141);
        float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2235, float2(0.0), isnan(_2235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2235, float2(0.0), isnan(_2235))).xy;
        float _202 = _200.x;
        float _204 = _200.y;
        float2 _2247 = float2(_143, _137);
        float2 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2247, float2(0.0), isnan(_2247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2247, float2(0.0), isnan(_2247))).xy;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _151);
        float _214 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _143);
        bool _216 = _204 >= 0.800000011920928955078125;
        bool _218 = isnan(_204);
        bool _220 = _216 || _218;
        bool _222 = isnan(0.800000011920928955078125);
        bool _224 = _220 || _222;
        bool _226 = _210 > 0.800000011920928955078125;
        bool _228 = isnan(_210);
        bool _230 = _226 || _228;
        bool _232 = isnan(0.800000011920928955078125);
        bool _234 = _230 || _232;
        bool _236 = _202 != 0.0;
        bool _238 = isnan(_202);
        bool _240 = _236 || _238;
        bool _242 = isnan(0.0);
        bool _244 = _240 || _242;
        bool _246 = !_224;
        bool _248 = _244 || _246;
        bool _250 = _208 != 0.0;
        bool _252 = isnan(_208);
        bool _254 = _250 || _252;
        bool _256 = isnan(0.0);
        bool _258 = _254 || _256;
        bool _260 = !_234;
        bool _262 = _258 || _260;
        float _264 = _202;
        float _266 = _204;
        int _268 = as_type<int>(_212);
        float _270 = _214;
        if (!_248)
        {
            float2 _2334 = float2(_212, _141);
            float2 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2334, float2(0.0), isnan(_2334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2334, float2(0.0), isnan(_2334))).xy;
            float _274 = _272.x;
            float _276 = _272.y;
            _264 = _274;
            _266 = _276;
        }
        float _278 = _264;
        float _280 = _266;
        float _282 = _208;
        float _284 = _210;
        if (!_262)
        {
            float2 _2356 = float2(_214, _137);
            float2 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2356, float2(0.0), isnan(_2356))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2356, float2(0.0), isnan(_2356))).xy;
            float _288 = _286.x;
            float _290 = _286.y;
            _282 = _288;
            _284 = _290;
        }
        float _292 = _282;
        float _294 = _284;
        if (_248)
        {
            _166 = 1;
        }
        int _296 = _166;
        int _298 = _296;
        if (!_248)
        {
            _298 = 0;
        }
        int _300 = _298;
        float _302 = 0.0;
        int _304 = _300;
        if (_248)
        {
            _302 = _212;
        }
        float _306 = _302;
        float _308 = _306;
        if (!_248)
        {
            float _310 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _212);
            _308 = _310;
        }
        float _312 = _308;
        int _314 = _300 & 1;
        bool _316 = _314 != 0;
        float _318 = _312;
        if (_316)
        {
            _168 = _300;
        }
        int _320 = _168;
        int _322 = _320;
        int _324 = _320;
        float _326 = _280;
        float _328 = _278;
        float _330 = _294;
        float _332 = _292;
        if (!_316)
        {
            bool _334 = _280 >= 0.800000011920928955078125;
            bool _336 = isnan(_280);
            bool _338 = _334 || _336;
            bool _340 = isnan(0.800000011920928955078125);
            bool _342 = _338 || _340;
            bool _344 = _278 != 0.0;
            bool _346 = isnan(_278);
            bool _348 = _344 || _346;
            bool _350 = isnan(0.0);
            bool _352 = _348 || _350;
            bool _354 = !_342;
            bool _356 = _352 || _354;
            if (_356)
            {
                _322 = 1;
            }
            int _358 = _322;
            _324 = _358;
            if (!_356)
            {
                float2 _2454 = float2(_312, _141);
                float2 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2454, float2(0.0), isnan(_2454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2454, float2(0.0), isnan(_2454))).xy;
                float _362 = _360.x;
                float _364 = _360.y;
                float _366 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _312);
                _324 = _300;
                _326 = _364;
                _328 = _362;
                _318 = _366;
            }
        }
        int _368 = _324;
        float _370 = _326;
        float _372 = _328;
        float _374 = _318;
        int _376 = _368 & 1;
        bool _378 = _376 != 0;
        float _380 = _370;
        float _382 = _372;
        float _384 = _374;
        int _386 = _368;
        if (_378)
        {
            _304 = _368;
        }
        int _388 = _304;
        int _390 = _388;
        int _392 = _388;
        if (!_378)
        {
            bool _394 = _370 >= 0.800000011920928955078125;
            bool _396 = isnan(_370);
            bool _398 = _394 || _396;
            bool _400 = isnan(0.800000011920928955078125);
            bool _402 = _398 || _400;
            bool _404 = _372 != 0.0;
            bool _406 = isnan(_372);
            bool _408 = _404 || _406;
            bool _410 = isnan(0.0);
            bool _412 = _408 || _410;
            bool _414 = !_402;
            bool _416 = _412 || _414;
            if (_416)
            {
                _390 = 1;
            }
            int _418 = _390;
            _392 = _418;
            if (!_416)
            {
                float2 _2533 = float2(_374, _141);
                float2 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2533, float2(0.0), isnan(_2533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2533, float2(0.0), isnan(_2533))).xy;
                float _422 = _420.x;
                float _424 = _420.y;
                float _426 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _374);
                _392 = _368;
                _380 = _424;
                _382 = _422;
                _384 = _426;
            }
        }
        int _428 = _392;
        float _430 = _380;
        float _432 = _382;
        float _434 = _384;
        int _436 = _428 & 1;
        bool _438 = _436 != 0;
        float _440 = _430;
        float _442 = _432;
        float _444 = _434;
        int _446 = _428;
        if (_438)
        {
            _386 = _428;
        }
        int _448 = _386;
        int _450 = _448;
        int _452 = _448;
        if (!_438)
        {
            bool _454 = _430 >= 0.800000011920928955078125;
            bool _456 = isnan(_430);
            bool _458 = _454 || _456;
            bool _460 = isnan(0.800000011920928955078125);
            bool _462 = _458 || _460;
            bool _464 = _432 != 0.0;
            bool _466 = isnan(_432);
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
                float2 _2612 = float2(_434, _141);
                float2 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2612, float2(0.0), isnan(_2612))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2612, float2(0.0), isnan(_2612))).xy;
                float _482 = _480.x;
                float _484 = _480.y;
                float _486 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _434);
                _452 = _428;
                _440 = _484;
                _442 = _482;
                _444 = _486;
            }
        }
        int _488 = _452;
        float _490 = _440;
        float _492 = _442;
        float _494 = _444;
        int _496 = _488 & 1;
        bool _498 = _496 != 0;
        float _500 = _490;
        float _502 = _492;
        float _504 = _494;
        int _506 = _488;
        if (_498)
        {
            _446 = _488;
        }
        int _508 = _446;
        int _510 = _508;
        int _512 = _508;
        if (!_498)
        {
            bool _514 = _490 >= 0.800000011920928955078125;
            bool _516 = isnan(_490);
            bool _518 = _514 || _516;
            bool _520 = isnan(0.800000011920928955078125);
            bool _522 = _518 || _520;
            bool _524 = _492 != 0.0;
            bool _526 = isnan(_492);
            bool _528 = _524 || _526;
            bool _530 = isnan(0.0);
            bool _532 = _528 || _530;
            bool _534 = !_522;
            bool _536 = _532 || _534;
            if (_536)
            {
                _510 = 1;
            }
            int _538 = _510;
            _512 = _538;
            if (!_536)
            {
                float2 _2691 = float2(_494, _141);
                float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2691, float2(0.0), isnan(_2691))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2691, float2(0.0), isnan(_2691))).xy;
                float _542 = _540.x;
                float _544 = _540.y;
                float _546 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _494);
                _512 = _488;
                _500 = _544;
                _502 = _542;
                _504 = _546;
            }
        }
        int _548 = _512;
        float _550 = _500;
        float _552 = _502;
        float _554 = _504;
        int _556 = _548 & 1;
        bool _558 = _556 != 0;
        float _560 = _554;
        float _562 = _550;
        float _564 = _552;
        float _566 = as_type<float>(_548);
        if (_262)
        {
            _268 = 1;
        }
        int _568 = _268;
        int _570 = _568;
        if (!_262)
        {
            _570 = 0;
        }
        int _572 = _570;
        int _574 = _572 & 1;
        bool _576 = _574 != 0;
        float _578 = as_type<float>(_572);
        if (_558)
        {
            _506 = _548;
        }
        int _580 = _506;
        int _582 = _580;
        int _584 = _580;
        if (!_558)
        {
            bool _586 = _550 >= 0.800000011920928955078125;
            bool _588 = isnan(_550);
            bool _590 = _586 || _588;
            bool _592 = isnan(0.800000011920928955078125);
            bool _594 = _590 || _592;
            bool _596 = _552 != 0.0;
            bool _598 = isnan(_552);
            bool _600 = _596 || _598;
            bool _602 = isnan(0.0);
            bool _604 = _600 || _602;
            bool _606 = !_594;
            bool _608 = _604 || _606;
            if (_608)
            {
                _582 = 1;
            }
            int _610 = _582;
            _584 = _610;
            if (!_608)
            {
                float2 _2787 = float2(_554, _141);
                float2 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2787, float2(0.0), isnan(_2787))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2787, float2(0.0), isnan(_2787))).xy;
                float _614 = _612.x;
                float _616 = _612.y;
                float _618 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _554);
                _584 = _548;
                _560 = _618;
                _562 = _616;
                _564 = _614;
            }
        }
        int _620 = _584;
        float _622 = _560;
        float _624 = _562;
        float _626 = _564;
        int _628 = _620 & 1;
        bool _630 = _628 != 0;
        float _632 = _626;
        float _634 = _624;
        int _636 = _620;
        if (!_262)
        {
            float _638 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _214);
            _270 = _638;
        }
        float _640 = _270;
        float _642 = _640;
        if (_630)
        {
            _566 = _622;
        }
        float _644 = _566;
        float _646 = _644;
        float _648 = _644;
        if (!_630)
        {
            bool _650 = _624 >= 0.800000011920928955078125;
            bool _652 = isnan(_624);
            bool _654 = _650 || _652;
            bool _656 = isnan(0.800000011920928955078125);
            bool _658 = _654 || _656;
            bool _660 = _626 != 0.0;
            bool _662 = isnan(_626);
            bool _664 = _660 || _662;
            bool _666 = isnan(0.0);
            bool _668 = _664 || _666;
            bool _670 = !_658;
            bool _672 = _668 || _670;
            if (_672)
            {
                _646 = _622;
            }
            float _674 = _646;
            _648 = _674;
            if (!_672)
            {
                float2 _2877 = float2(_622, _141);
                float2 _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2877, float2(0.0), isnan(_2877))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2877, float2(0.0), isnan(_2877))).xy;
                float _678 = _676.x;
                float _680 = _676.y;
                float _682 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _622);
                _632 = _678;
                _634 = _680;
                _648 = _682;
            }
        }
        float _684 = _632;
        float _686 = _634;
        float _688 = _648;
        if (_576)
        {
            _170 = _572;
        }
        int _690 = _170;
        int _692 = _690;
        int _694 = _690;
        if (!_576)
        {
            bool _696 = _294 > 0.800000011920928955078125;
            bool _698 = isnan(_294);
            bool _700 = _696 || _698;
            bool _702 = isnan(0.800000011920928955078125);
            bool _704 = _700 || _702;
            bool _706 = _292 != 0.0;
            bool _708 = isnan(_292);
            bool _710 = _706 || _708;
            bool _712 = isnan(0.0);
            bool _714 = _710 || _712;
            bool _716 = !_704;
            bool _718 = _714 || _716;
            if (_718)
            {
                _692 = 1;
            }
            int _720 = _692;
            _694 = _720;
            if (!_718)
            {
                float2 _2946 = float2(_640, _137);
                float2 _722 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2946, float2(0.0), isnan(_2946))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2946, float2(0.0), isnan(_2946))).xy;
                float _724 = _722.x;
                float _726 = _722.y;
                float _728 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _640);
                _694 = _572;
                _330 = _726;
                _332 = _724;
                _642 = _728;
            }
        }
        int _730 = _694;
        float _732 = _330;
        float _734 = _332;
        float _736 = _642;
        int _738 = _730 & 1;
        bool _740 = _738 != 0;
        float _742 = _732;
        float _744 = _734;
        float _746 = _736;
        int _748 = _730;
        if (_740)
        {
            _636 = _730;
        }
        int _750 = _636;
        int _752 = _750;
        int _754 = _750;
        if (!_740)
        {
            bool _756 = _732 > 0.800000011920928955078125;
            bool _758 = isnan(_732);
            bool _760 = _756 || _758;
            bool _762 = isnan(0.800000011920928955078125);
            bool _764 = _760 || _762;
            bool _766 = _734 != 0.0;
            bool _768 = isnan(_734);
            bool _770 = _766 || _768;
            bool _772 = isnan(0.0);
            bool _774 = _770 || _772;
            bool _776 = !_764;
            bool _778 = _774 || _776;
            if (_778)
            {
                _752 = 1;
            }
            int _780 = _752;
            _754 = _780;
            if (!_778)
            {
                float2 _3025 = float2(_736, _137);
                float2 _782 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3025, float2(0.0), isnan(_3025))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3025, float2(0.0), isnan(_3025))).xy;
                float _784 = _782.x;
                float _786 = _782.y;
                float _788 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _736);
                _754 = _730;
                _742 = _786;
                _744 = _784;
                _746 = _788;
            }
        }
        int _790 = _754;
        float _792 = _742;
        float _794 = _744;
        float _796 = _746;
        int _798 = _790 & 1;
        bool _800 = _798 != 0;
        float _802 = _792;
        float _804 = _794;
        float _806 = _796;
        int _808 = _790;
        if (_800)
        {
            _748 = _790;
        }
        int _810 = _748;
        int _812 = _810;
        int _814 = _810;
        if (!_800)
        {
            bool _816 = _792 > 0.800000011920928955078125;
            bool _818 = isnan(_792);
            bool _820 = _816 || _818;
            bool _822 = isnan(0.800000011920928955078125);
            bool _824 = _820 || _822;
            bool _826 = _794 != 0.0;
            bool _828 = isnan(_794);
            bool _830 = _826 || _828;
            bool _832 = isnan(0.0);
            bool _834 = _830 || _832;
            bool _836 = !_824;
            bool _838 = _834 || _836;
            if (_838)
            {
                _812 = 1;
            }
            int _840 = _812;
            _814 = _840;
            if (!_838)
            {
                float2 _3104 = float2(_796, _137);
                float2 _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3104, float2(0.0), isnan(_3104))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3104, float2(0.0), isnan(_3104))).xy;
                float _844 = _842.x;
                float _846 = _842.y;
                float _848 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _796);
                _814 = _790;
                _802 = _846;
                _804 = _844;
                _806 = _848;
            }
        }
        int _850 = _814;
        float _852 = _802;
        float _854 = _804;
        float _856 = _806;
        int _858 = _850 & 1;
        bool _860 = _858 != 0;
        float _862 = _852;
        float _864 = _854;
        float _866 = _856;
        int _868 = _850;
        if (_860)
        {
            _808 = _850;
        }
        int _870 = _808;
        int _872 = _870;
        int _874 = _870;
        if (!_860)
        {
            bool _876 = _852 > 0.800000011920928955078125;
            bool _878 = isnan(_852);
            bool _880 = _876 || _878;
            bool _882 = isnan(0.800000011920928955078125);
            bool _884 = _880 || _882;
            bool _886 = _854 != 0.0;
            bool _888 = isnan(_854);
            bool _890 = _886 || _888;
            bool _892 = isnan(0.0);
            bool _894 = _890 || _892;
            bool _896 = !_884;
            bool _898 = _894 || _896;
            if (_898)
            {
                _872 = 1;
            }
            int _900 = _872;
            _874 = _900;
            if (!_898)
            {
                float2 _3183 = float2(_856, _137);
                float2 _902 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3183, float2(0.0), isnan(_3183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3183, float2(0.0), isnan(_3183))).xy;
                float _904 = _902.x;
                float _906 = _902.y;
                float _908 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _856);
                _874 = _850;
                _862 = _906;
                _864 = _904;
                _866 = _908;
            }
        }
        int _910 = _874;
        float _912 = _862;
        float _914 = _864;
        float _916 = _866;
        int _918 = _910 & 1;
        bool _920 = _918 != 0;
        float _922 = _916;
        float _924 = _914;
        float _926 = _912;
        if (_920)
        {
            _868 = _910;
        }
        int _928 = _868;
        int _930 = _928;
        int _932 = _928;
        if (!_920)
        {
            bool _934 = _912 > 0.800000011920928955078125;
            bool _936 = isnan(_912);
            bool _938 = _934 || _936;
            bool _940 = isnan(0.800000011920928955078125);
            bool _942 = _938 || _940;
            bool _944 = _914 != 0.0;
            bool _946 = isnan(_914);
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
                float2 _3261 = float2(_916, _137);
                float2 _960 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3261, float2(0.0), isnan(_3261))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3261, float2(0.0), isnan(_3261))).xy;
                float _962 = _960.x;
                float _964 = _960.y;
                float _966 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _916);
                _932 = _910;
                _922 = _966;
                _924 = _962;
                _926 = _964;
            }
        }
        int _968 = _932;
        float _970 = _922;
        float _972 = _924;
        float _974 = _926;
        int _976 = _968 & 1;
        bool _978 = _976 != 0;
        float _980 = as_type<float>(_968);
        if (_978)
        {
            _980 = _970;
        }
        float _982 = _980;
        float _984 = _982;
        float _986 = _982;
        if (_978)
        {
            _578 = _972;
        }
        float _988 = _578;
        float _990 = _988;
        float _992 = _988;
        if (_978)
        {
            _172 = _974;
        }
        float _994 = _172;
        float _996 = _994;
        float _998 = _994;
        if (!_978)
        {
            bool _1000 = _974 > 0.800000011920928955078125;
            bool _1002 = isnan(_974);
            bool _1004 = _1000 || _1002;
            bool _1006 = isnan(0.800000011920928955078125);
            bool _1008 = _1004 || _1006;
            bool _1010 = _972 != 0.0;
            bool _1012 = isnan(_972);
            bool _1014 = _1010 || _1012;
            bool _1016 = isnan(0.0);
            bool _1018 = _1014 || _1016;
            bool _1020 = !_1008;
            bool _1022 = _1018 || _1020;
            if (_1022)
            {
                _990 = _972;
            }
            float _1024 = _990;
            _992 = _1024;
            if (_1022)
            {
                _996 = _974;
            }
            float _1026 = _996;
            _998 = _1026;
            if (_1022)
            {
                _984 = _970;
            }
            float _1028 = _984;
            _986 = _1028;
            if (!_1022)
            {
                float2 _3365 = float2(_970, _137);
                float2 _1030 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3365, float2(0.0), isnan(_3365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3365, float2(0.0), isnan(_3365))).xy;
                float _1032 = _1030.x;
                float _1034 = _1030.y;
                float _1036 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _970);
                _992 = _1032;
                _998 = _1034;
                _986 = _1036;
            }
        }
        float _1038 = _992;
        float _1040 = _998;
        float _1042 = _986;
        float _1044 = fma(_1038, 0.5, 0.5234375);
        float _1046 = fma(_1040, 2.0, 0.03125);
        float _1048 = fma(_684, 0.5, 0.0078125);
        float _1050 = fma(_686, 2.0, 0.03125);
        float2 _3401 = float2(_1044, _1046);
        float _1052 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3401, float2(0.0), isnan(_3401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3401, float2(0.0), isnan(_3401))).x;
        float2 _3409 = float2(_1048, _1050);
        float _1054 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3409, float2(0.0), isnan(_3409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3409, float2(0.0), isnan(_3409))).x;
        float _1056 = fma(_1052, -2.007874011993408203125, 3.25);
        float _1058 = fma(_1054, -2.007874011993408203125, 3.25);
        float _1060 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1062 = fma(_1056, _1060, _1042);
        float _1064 = fma(_1058, (*spvDescriptorSet0.fp_c3)._m0[0].z, _688);
        float2 _3435 = float2(_1062, _153);
        float _1066 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3435, float2(0.0), isnan(_3435)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3435, float2(0.0), isnan(_3435)), int2(1, 0)).x;
        float2 _3445 = float2(_1064, _153);
        float _1068 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3445, float2(0.0), isnan(_3445))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3445, float2(0.0), isnan(_3445))).x;
        float _1070 = -_159;
        float _1072 = fma(_1064, (*spvDescriptorSet0.fp_c3)._m0[0].x, _1070);
        float _1074 = -_159;
        float _1076 = fma(_1062, (*spvDescriptorSet0.fp_c3)._m0[0].x, _1074);
        float _1078 = rint(_1072);
        float _1080 = rint(_1076);
        float _1082 = abs(_1078);
        float _1084 = sqrt(_1082);
        float _1086 = abs(_1080);
        float _1088 = sqrt(_1086);
        float _1090 = _1066 * 4.0;
        float _1092 = _1068 * 4.0;
        float _1094 = rint(_1090);
        float _1096 = rint(_1092);
        float _1098 = fma(_1094, 16.0, _1088);
        float _1100 = fma(_1098, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _1102 = fma(_1096, 16.0, _1084);
        float _1104 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _1100);
        float _1106 = fma(_1102, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _3508 = float2(_1106, _1104);
        float2 _1108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3508, float2(0.0), isnan(_3508))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3508, float2(0.0), isnan(_3508))).xy;
        float _1110 = _1108.x;
        float _1112 = _1108.y;
        _194 = as_type<int>(_1110);
        _196 = as_type<int>(_1112);
        _174 = as_type<int>(_1080);
        _198 = 0.001785714295692741870880126953125;
        _176 = 1.4012984643248170709237295832899e-45;
        _178 = as_type<int>(_1090);
    }
    int _1114 = _194;
    int _1116 = _196;
    int _1118 = _174;
    float _1120 = _198;
    float _1122 = _176;
    int _1124 = _178;
    bool _1126 = _73 > 0.0;
    int _1128 = _1118;
    float _1130 = _1120;
    float _1132 = _1122;
    int _1134 = _1124;
    if (!_1126)
    {
        _180 = 0;
        _1128 = 0;
    }
    int _1136 = _180;
    int _1138 = _1128;
    if (!_1126)
    {
        out.m_42.x = as_type<float>(_1114);
        out.m_42.y = as_type<float>(_1116);
        out.m_42.z = as_type<float>(_1136);
        out.m_42.w = as_type<float>(_1138);
        return out;
    }
    float2 _3565 = float2(_139, _153);
    float2 _1140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3565, float2(0.0), isnan(_3565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3565, float2(0.0), isnan(_3565))).xy;
    float _1142 = _1140.x;
    float _1144 = _1140.y;
    float2 _3577 = float2(_145, _147);
    float2 _1146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3577, float2(0.0), isnan(_3577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3577, float2(0.0), isnan(_3577))).xy;
    float _1148 = _1146.x;
    float _1150 = _1146.y;
    float _1152 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _153);
    float _1154 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
    bool _1156 = _1142 > 0.800000011920928955078125;
    bool _1158 = isnan(_1142);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.800000011920928955078125);
    bool _1164 = _1160 || _1162;
    bool _1166 = _1148 > 0.800000011920928955078125;
    bool _1168 = isnan(_1148);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.800000011920928955078125);
    bool _1174 = _1170 || _1172;
    bool _1176 = _1144 != 0.0;
    bool _1178 = isnan(_1144);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(0.0);
    bool _1184 = _1180 || _1182;
    bool _1186 = !_1164;
    bool _1188 = _1184 || _1186;
    bool _1190 = _1150 != 0.0;
    bool _1192 = isnan(_1150);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    bool _1200 = !_1174;
    bool _1202 = _1198 || _1200;
    float _1204 = _1142;
    float _1206 = _1144;
    int _1208 = as_type<int>(_1152);
    int _1210 = as_type<int>(_1150);
    int _1212 = as_type<int>(_1148);
    float _1214 = _1154;
    if (_1188)
    {
        _1130 = _1142;
    }
    float _1216 = _1130;
    if (_1188)
    {
        _1132 = _1144;
    }
    float _1218 = _1132;
    if (_1202)
    {
        _1204 = _1148;
    }
    float _1220 = _1204;
    if (_1202)
    {
        _1206 = _1150;
    }
    float _1222 = _1206;
    float _1224 = _1216;
    float _1226 = _1218;
    if (!_1188)
    {
        float2 _3685 = float2(_139, _1152);
        float2 _1228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3685, float2(0.0), isnan(_3685))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3685, float2(0.0), isnan(_3685))).xy;
        float _1230 = _1228.x;
        float _1232 = _1228.y;
        _1224 = _1230;
        _1226 = _1232;
    }
    float _1234 = _1224;
    float _1236 = _1226;
    float _1238 = _1220;
    float _1240 = _1222;
    if (!_1202)
    {
        float2 _3707 = float2(_145, _1154);
        float2 _1242 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3707, float2(0.0), isnan(_3707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3707, float2(0.0), isnan(_3707))).xy;
        float _1244 = _1242.x;
        float _1246 = _1242.y;
        _1238 = _1244;
        _1240 = _1246;
    }
    float _1248 = _1238;
    float _1250 = _1240;
    if (_1188)
    {
        _182 = 1;
    }
    int _1252 = _182;
    int _1254 = _1252;
    if (!_1188)
    {
        _1254 = 0;
    }
    int _1256 = _1254;
    int _1258 = _1256;
    if (_1188)
    {
        _184 = _1152;
    }
    float _1260 = _184;
    float _1262 = _1260;
    if (!_1188)
    {
        float _1264 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1152);
        _1262 = _1264;
    }
    float _1266 = _1262;
    int _1268 = _1256 & 1;
    bool _1270 = _1268 != 0;
    float _1272 = _1266;
    if (_1270)
    {
        _1134 = _1256;
    }
    int _1274 = _1134;
    int _1276 = _1274;
    int _1278 = _1274;
    float _1280 = _1234;
    float _1282 = _1236;
    float _1284 = _1248;
    float _1286 = _1250;
    if (!_1270)
    {
        bool _1288 = _1234 > 0.800000011920928955078125;
        bool _1290 = isnan(_1234);
        bool _1292 = _1288 || _1290;
        bool _1294 = isnan(0.800000011920928955078125);
        bool _1296 = _1292 || _1294;
        bool _1298 = _1236 != 0.0;
        bool _1300 = isnan(_1236);
        bool _1302 = _1298 || _1300;
        bool _1304 = isnan(0.0);
        bool _1306 = _1302 || _1304;
        bool _1308 = !_1296;
        bool _1310 = _1306 || _1308;
        if (_1310)
        {
            _1276 = 1;
        }
        int _1312 = _1276;
        _1278 = _1312;
        if (!_1310)
        {
            float2 _3805 = float2(_139, _1266);
            float2 _1314 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3805, float2(0.0), isnan(_3805))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3805, float2(0.0), isnan(_3805))).xy;
            float _1316 = _1314.x;
            float _1318 = _1314.y;
            float _1320 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1266);
            _1278 = _1256;
            _1280 = _1316;
            _1282 = _1318;
            _1272 = _1320;
        }
    }
    int _1322 = _1278;
    float _1324 = _1280;
    float _1326 = _1282;
    float _1328 = _1272;
    int _1330 = _1322 & 1;
    bool _1332 = _1330 != 0;
    float _1334 = _1324;
    float _1336 = _1326;
    float _1338 = _1328;
    float _1340 = as_type<float>(_1322);
    if (_1332)
    {
        _1208 = _1322;
    }
    int _1342 = _1208;
    int _1344 = _1342;
    int _1346 = _1342;
    if (!_1332)
    {
        bool _1348 = _1324 > 0.800000011920928955078125;
        bool _1350 = isnan(_1324);
        bool _1352 = _1348 || _1350;
        bool _1354 = isnan(0.800000011920928955078125);
        bool _1356 = _1352 || _1354;
        bool _1358 = _1326 != 0.0;
        bool _1360 = isnan(_1326);
        bool _1362 = _1358 || _1360;
        bool _1364 = isnan(0.0);
        bool _1366 = _1362 || _1364;
        bool _1368 = !_1356;
        bool _1370 = _1366 || _1368;
        if (_1370)
        {
            _1344 = 1;
        }
        int _1372 = _1344;
        _1346 = _1372;
        if (!_1370)
        {
            float2 _3885 = float2(_139, _1328);
            float2 _1374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3885, float2(0.0), isnan(_3885))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3885, float2(0.0), isnan(_3885))).xy;
            float _1376 = _1374.x;
            float _1378 = _1374.y;
            float _1380 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1328);
            _1346 = _1322;
            _1334 = _1376;
            _1336 = _1378;
            _1338 = _1380;
        }
    }
    int _1382 = _1346;
    float _1384 = _1334;
    float _1386 = _1336;
    float _1388 = _1338;
    int _1390 = _1382 & 1;
    bool _1392 = _1390 != 0;
    float _1394 = _1384;
    float _1396 = _1386;
    float _1398 = _1388;
    int _1400 = _1382;
    if (_1392)
    {
        _1258 = _1382;
    }
    int _1402 = _1258;
    int _1404 = _1402;
    int _1406 = _1402;
    if (!_1392)
    {
        bool _1408 = _1384 > 0.800000011920928955078125;
        bool _1410 = isnan(_1384);
        bool _1412 = _1408 || _1410;
        bool _1414 = isnan(0.800000011920928955078125);
        bool _1416 = _1412 || _1414;
        bool _1418 = _1386 != 0.0;
        bool _1420 = isnan(_1386);
        bool _1422 = _1418 || _1420;
        bool _1424 = isnan(0.0);
        bool _1426 = _1422 || _1424;
        bool _1428 = !_1416;
        bool _1430 = _1426 || _1428;
        if (_1430)
        {
            _1404 = 1;
        }
        int _1432 = _1404;
        _1406 = _1432;
        if (!_1430)
        {
            float2 _3964 = float2(_139, _1388);
            float2 _1434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3964, float2(0.0), isnan(_3964))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3964, float2(0.0), isnan(_3964))).xy;
            float _1436 = _1434.x;
            float _1438 = _1434.y;
            float _1440 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1388);
            _1406 = _1382;
            _1394 = _1436;
            _1396 = _1438;
            _1398 = _1440;
        }
    }
    int _1442 = _1406;
    float _1444 = _1394;
    float _1446 = _1396;
    float _1448 = _1398;
    int _1450 = _1442 & 1;
    bool _1452 = _1450 != 0;
    float _1454 = _1444;
    float _1456 = _1446;
    float _1458 = _1448;
    float _1460 = as_type<float>(_1442);
    if (_1452)
    {
        _1400 = _1442;
    }
    int _1462 = _1400;
    int _1464 = _1462;
    int _1466 = _1462;
    if (!_1452)
    {
        bool _1468 = _1444 > 0.800000011920928955078125;
        bool _1470 = isnan(_1444);
        bool _1472 = _1468 || _1470;
        bool _1474 = isnan(0.800000011920928955078125);
        bool _1476 = _1472 || _1474;
        bool _1478 = _1446 != 0.0;
        bool _1480 = isnan(_1446);
        bool _1482 = _1478 || _1480;
        bool _1484 = isnan(0.0);
        bool _1486 = _1482 || _1484;
        bool _1488 = !_1476;
        bool _1490 = _1486 || _1488;
        if (_1490)
        {
            _1464 = 1;
        }
        int _1492 = _1464;
        _1466 = _1492;
        if (!_1490)
        {
            float2 _4044 = float2(_139, _1448);
            float2 _1494 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4044, float2(0.0), isnan(_4044))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4044, float2(0.0), isnan(_4044))).xy;
            float _1496 = _1494.x;
            float _1498 = _1494.y;
            float _1500 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1448);
            _1466 = _1442;
            _1454 = _1496;
            _1456 = _1498;
            _1458 = _1500;
        }
    }
    int _1502 = _1466;
    float _1504 = _1454;
    float _1506 = _1456;
    float _1508 = _1458;
    int _1510 = _1502 & 1;
    bool _1512 = _1510 != 0;
    float _1514 = _1508;
    int _1516 = _1502;
    if (_1202)
    {
        _1210 = 1;
    }
    int _1518 = _1210;
    int _1520 = _1518;
    if (!_1202)
    {
        _1520 = 0;
    }
    int _1522 = _1520;
    int _1524 = _1522 & 1;
    bool _1526 = _1524 != 0;
    if (_1512)
    {
        _1212 = _1502;
    }
    int _1528 = _1212;
    int _1530 = _1528;
    int _1532 = _1528;
    if (_1512)
    {
        _1460 = _1504;
    }
    float _1534 = _1460;
    float _1536 = _1534;
    float _1538 = _1534;
    if (_1512)
    {
        _1340 = _1506;
    }
    float _1540 = _1340;
    float _1542 = _1540;
    float _1544 = _1540;
    if (!_1512)
    {
        bool _1546 = _1504 > 0.800000011920928955078125;
        bool _1548 = isnan(_1504);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan(0.800000011920928955078125);
        bool _1554 = _1550 || _1552;
        bool _1556 = _1506 != 0.0;
        bool _1558 = isnan(_1506);
        bool _1560 = _1556 || _1558;
        bool _1562 = isnan(0.0);
        bool _1564 = _1560 || _1562;
        bool _1566 = !_1554;
        bool _1568 = _1564 || _1566;
        if (_1568)
        {
            _1536 = _1504;
        }
        float _1570 = _1536;
        _1538 = _1570;
        if (_1568)
        {
            _1542 = _1506;
        }
        float _1572 = _1542;
        _1544 = _1572;
        if (_1568)
        {
            _1530 = 1;
        }
        int _1574 = _1530;
        _1532 = _1574;
        if (!_1568)
        {
            float2 _4161 = float2(_139, _1508);
            float2 _1576 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4161, float2(0.0), isnan(_4161))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4161, float2(0.0), isnan(_4161))).xy;
            float _1578 = _1576.x;
            float _1580 = _1576.y;
            float _1582 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1508);
            _1532 = _1502;
            _1538 = _1578;
            _1544 = _1580;
            _1514 = _1582;
        }
    }
    int _1584 = _1532;
    float _1586 = _1538;
    float _1588 = _1544;
    float _1590 = _1514;
    int _1592 = _1584 & 1;
    bool _1594 = _1592 != 0;
    float _1596 = _1586;
    float _1598 = _1588;
    float _1600 = _1590;
    if (!_1202)
    {
        float _1602 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1154);
        _1214 = _1602;
    }
    float _1604 = _1214;
    float _1606 = _1604;
    if (!_1594)
    {
        bool _1608 = _1586 > 0.800000011920928955078125;
        bool _1610 = isnan(_1586);
        bool _1612 = _1608 || _1610;
        bool _1614 = isnan(0.800000011920928955078125);
        bool _1616 = _1612 || _1614;
        bool _1618 = _1588 != 0.0;
        bool _1620 = isnan(_1588);
        bool _1622 = _1618 || _1620;
        bool _1624 = isnan(0.0);
        bool _1626 = _1622 || _1624;
        bool _1628 = !_1616;
        bool _1630 = _1626 || _1628;
        if (!_1630)
        {
            float2 _4238 = float2(_139, _1590);
            float2 _1632 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4238, float2(0.0), isnan(_4238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4238, float2(0.0), isnan(_4238))).xy;
            float _1634 = _1632.x;
            float _1636 = _1632.y;
            float _1638 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1590);
            _1596 = _1634;
            _1598 = _1636;
            _1600 = _1638;
        }
    }
    float _1640 = _1596;
    float _1642 = _1598;
    float _1644 = _1600;
    if (_1526)
    {
        _1516 = _1522;
    }
    int _1646 = _1516;
    int _1648 = _1646;
    int _1650 = _1646;
    if (!_1526)
    {
        bool _1652 = _1248 > 0.800000011920928955078125;
        bool _1654 = isnan(_1248);
        bool _1656 = _1652 || _1654;
        bool _1658 = isnan(0.800000011920928955078125);
        bool _1660 = _1656 || _1658;
        bool _1662 = _1250 != 0.0;
        bool _1664 = isnan(_1250);
        bool _1666 = _1662 || _1664;
        bool _1668 = isnan(0.0);
        bool _1670 = _1666 || _1668;
        bool _1672 = !_1660;
        bool _1674 = _1670 || _1672;
        if (_1674)
        {
            _1648 = 1;
        }
        int _1676 = _1648;
        _1650 = _1676;
        if (!_1674)
        {
            float2 _4307 = float2(_145, _1604);
            float2 _1678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4307, float2(0.0), isnan(_4307))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4307, float2(0.0), isnan(_4307))).xy;
            float _1680 = _1678.x;
            float _1682 = _1678.y;
            float _1684 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1604);
            _1650 = _1522;
            _1284 = _1680;
            _1286 = _1682;
            _1606 = _1684;
        }
    }
    int _1686 = _1650;
    float _1688 = _1284;
    float _1690 = _1286;
    float _1692 = _1606;
    int _1694 = _1686 & 1;
    bool _1696 = _1694 != 0;
    float _1698 = _1688;
    float _1700 = _1690;
    float _1702 = _1692;
    int _1704 = _1686;
    if (_1696)
    {
        _186 = _1686;
    }
    int _1706 = _186;
    int _1708 = _1706;
    int _1710 = _1706;
    if (!_1696)
    {
        bool _1712 = _1688 > 0.800000011920928955078125;
        bool _1714 = isnan(_1688);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan(0.800000011920928955078125);
        bool _1720 = _1716 || _1718;
        bool _1722 = _1690 != 0.0;
        bool _1724 = isnan(_1690);
        bool _1726 = _1722 || _1724;
        bool _1728 = isnan(0.0);
        bool _1730 = _1726 || _1728;
        bool _1732 = !_1720;
        bool _1734 = _1730 || _1732;
        if (_1734)
        {
            _1708 = 1;
        }
        int _1736 = _1708;
        _1710 = _1736;
        if (!_1734)
        {
            float2 _4386 = float2(_145, _1692);
            float2 _1738 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4386, float2(0.0), isnan(_4386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4386, float2(0.0), isnan(_4386))).xy;
            float _1740 = _1738.x;
            float _1742 = _1738.y;
            float _1744 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1692);
            _1710 = _1686;
            _1698 = _1740;
            _1700 = _1742;
            _1702 = _1744;
        }
    }
    int _1746 = _1710;
    float _1748 = _1698;
    float _1750 = _1700;
    float _1752 = _1702;
    int _1754 = _1746 & 1;
    bool _1756 = _1754 != 0;
    float _1758 = _1748;
    float _1760 = _1750;
    float _1762 = _1752;
    int _1764 = _1746;
    if (_1756)
    {
        _1704 = _1746;
    }
    int _1766 = _1704;
    int _1768 = _1766;
    int _1770 = _1766;
    if (!_1756)
    {
        bool _1772 = _1748 > 0.800000011920928955078125;
        bool _1774 = isnan(_1748);
        bool _1776 = _1772 || _1774;
        bool _1778 = isnan(0.800000011920928955078125);
        bool _1780 = _1776 || _1778;
        bool _1782 = _1750 != 0.0;
        bool _1784 = isnan(_1750);
        bool _1786 = _1782 || _1784;
        bool _1788 = isnan(0.0);
        bool _1790 = _1786 || _1788;
        bool _1792 = !_1780;
        bool _1794 = _1790 || _1792;
        if (_1794)
        {
            _1768 = 1;
        }
        int _1796 = _1768;
        _1770 = _1796;
        if (!_1794)
        {
            float2 _4465 = float2(_145, _1752);
            float2 _1798 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4465, float2(0.0), isnan(_4465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4465, float2(0.0), isnan(_4465))).xy;
            float _1800 = _1798.x;
            float _1802 = _1798.y;
            float _1804 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1752);
            _1770 = _1746;
            _1758 = _1800;
            _1760 = _1802;
            _1762 = _1804;
        }
    }
    int _1806 = _1770;
    float _1808 = _1758;
    float _1810 = _1760;
    float _1812 = _1762;
    int _1814 = _1806 & 1;
    bool _1816 = _1814 != 0;
    float _1818 = _1808;
    float _1820 = _1810;
    float _1822 = _1812;
    int _1824 = _1806;
    if (_1816)
    {
        _1764 = _1806;
    }
    int _1826 = _1764;
    int _1828 = _1826;
    int _1830 = _1826;
    if (!_1816)
    {
        bool _1832 = _1808 > 0.800000011920928955078125;
        bool _1834 = isnan(_1808);
        bool _1836 = _1832 || _1834;
        bool _1838 = isnan(0.800000011920928955078125);
        bool _1840 = _1836 || _1838;
        bool _1842 = _1810 != 0.0;
        bool _1844 = isnan(_1810);
        bool _1846 = _1842 || _1844;
        bool _1848 = isnan(0.0);
        bool _1850 = _1846 || _1848;
        bool _1852 = !_1840;
        bool _1854 = _1850 || _1852;
        if (_1854)
        {
            _1828 = 1;
        }
        int _1856 = _1828;
        _1830 = _1856;
        if (!_1854)
        {
            float2 _4544 = float2(_145, _1812);
            float2 _1858 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4544, float2(0.0), isnan(_4544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4544, float2(0.0), isnan(_4544))).xy;
            float _1860 = _1858.x;
            float _1862 = _1858.y;
            float _1864 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1812);
            _1830 = _1806;
            _1818 = _1860;
            _1820 = _1862;
            _1822 = _1864;
        }
    }
    int _1866 = _1830;
    float _1868 = _1818;
    float _1870 = _1820;
    float _1872 = _1822;
    int _1874 = _1866 & 1;
    bool _1876 = _1874 != 0;
    float _1878 = _1868;
    float _1880 = _1870;
    float _1882 = _1872;
    if (_1876)
    {
        _1824 = _1866;
    }
    int _1884 = _1824;
    int _1886 = _1884;
    int _1888 = _1884;
    if (!_1876)
    {
        bool _1890 = _1868 > 0.800000011920928955078125;
        bool _1892 = isnan(_1868);
        bool _1894 = _1890 || _1892;
        bool _1896 = isnan(0.800000011920928955078125);
        bool _1898 = _1894 || _1896;
        bool _1900 = _1870 != 0.0;
        bool _1902 = isnan(_1870);
        bool _1904 = _1900 || _1902;
        bool _1906 = isnan(0.0);
        bool _1908 = _1904 || _1906;
        bool _1910 = !_1898;
        bool _1912 = _1908 || _1910;
        if (_1912)
        {
            _1886 = 1;
        }
        int _1914 = _1886;
        _1888 = _1914;
        if (!_1912)
        {
            float2 _4622 = float2(_145, _1872);
            float2 _1916 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4622, float2(0.0), isnan(_4622))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4622, float2(0.0), isnan(_4622))).xy;
            float _1918 = _1916.x;
            float _1920 = _1916.y;
            float _1922 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1872);
            _1888 = _1866;
            _1878 = _1918;
            _1880 = _1920;
            _1882 = _1922;
        }
    }
    int _1924 = _1888;
    float _1926 = _1878;
    float _1928 = _1880;
    float _1930 = _1882;
    int _1932 = _1924 & 1;
    bool _1934 = _1932 != 0;
    float _1936 = _1928;
    float _1938 = _1926;
    float _1940 = _1930;
    if (!_1934)
    {
        bool _1942 = _1926 > 0.800000011920928955078125;
        bool _1944 = isnan(_1926);
        bool _1946 = _1942 || _1944;
        bool _1948 = isnan(0.800000011920928955078125);
        bool _1950 = _1946 || _1948;
        bool _1952 = _1928 != 0.0;
        bool _1954 = isnan(_1928);
        bool _1956 = _1952 || _1954;
        bool _1958 = isnan(0.0);
        bool _1960 = _1956 || _1958;
        bool _1962 = !_1950;
        bool _1964 = _1960 || _1962;
        if (!_1964)
        {
            float2 _4688 = float2(_145, _1930);
            float2 _1966 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4688, float2(0.0), isnan(_4688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4688, float2(0.0), isnan(_4688))).xy;
            float _1968 = _1966.x;
            float _1970 = _1966.y;
            float _1972 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1930);
            _1936 = _1970;
            _1938 = _1968;
            _1940 = _1972;
        }
    }
    float _1974 = _1936;
    float _1976 = _1938;
    float _1978 = _1940;
    float _1980 = fma(_1974, 0.5, 0.5234375);
    float _1982 = fma(_1976, 2.0, 0.03125);
    float _1984 = fma(_1640, 2.0, 0.03125);
    float _1986 = fma(_1642, 0.5, 0.0078125);
    float2 _4720 = float2(_1980, _1982);
    float _1988 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4720, float2(0.0), isnan(_4720))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4720, float2(0.0), isnan(_4720))).x;
    float2 _4728 = float2(_1986, _1984);
    float _1990 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4728, float2(0.0), isnan(_4728))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4728, float2(0.0), isnan(_4728))).x;
    float _1992 = fma(_1988, -2.007874011993408203125, 3.25);
    float _1994 = fma(_1990, -2.007874011993408203125, 3.25);
    float _1996 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _1998 = fma(_1992, _1996, _1978);
    float _2000 = fma(_1994, (*spvDescriptorSet0.fp_c3)._m0[0].w, _1644);
    float2 _4752 = float2(_151, _1998);
    float _2002 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4752, float2(0.0), isnan(_4752)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4752, float2(0.0), isnan(_4752)), int2(0, 1)).y;
    float2 _4761 = float2(_151, _2000);
    float _2004 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4761, float2(0.0), isnan(_4761))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4761, float2(0.0), isnan(_4761))).y;
    float _2006 = -_149;
    float _2008 = fma(_2000, (*spvDescriptorSet0.fp_c3)._m0[0].y, _2006);
    float _2010 = -_149;
    float _2012 = fma(_1998, (*spvDescriptorSet0.fp_c3)._m0[0].y, _2010);
    float _2014 = rint(_2008);
    float _2016 = rint(_2012);
    float _2018 = abs(_2014);
    float _2020 = sqrt(_2018);
    float _2022 = abs(_2016);
    float _2024 = sqrt(_2022);
    float _2026 = _2002 * 4.0;
    float _2028 = _2004 * 4.0;
    float _2030 = rint(_2026);
    float _2032 = rint(_2028);
    float _2034 = fma(_2030, 16.0, _2024);
    float _2036 = fma(_2034, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
    float _2038 = fma(_2032, 16.0, _2020);
    float _2040 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _2036);
    float _2042 = fma(_2038, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
    float2 _4817 = float2(_2042, _2040);
    float2 _2044 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4817, float2(0.0), isnan(_4817))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4817, float2(0.0), isnan(_4817))).xy;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    out.m_42.x = as_type<float>(_1114);
    out.m_42.y = as_type<float>(_1116);
    out.m_42.z = _2046;
    out.m_42.w = _2048;
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
    float2 _2081 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2081, float2(0.0), isnan(_2081))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2081, float2(0.0), isnan(_2081))).xy;
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
    float _172 = _117;
    int _174 = as_type<int>(_159);
    float _176 = _111;
    int _178 = as_type<int>(_143);
    int _180 = as_type<int>(_73);
    int _182 = as_type<int>(_147);
    float _184 = _153;
    int _186 = as_type<int>(_139);
    if (!_157)
    {
        _162 = 0;
        _164 = 0;
    }
    int _188 = _162;
    int _190 = _164;
    bool _192 = !_157;
    int _194 = _188;
    int _196 = _190;
    float _198 = 0.0;
    if (!_192)
    {
        float2 _2235 = float2(_151, _141);
        float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2235, float2(0.0), isnan(_2235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2235, float2(0.0), isnan(_2235))).xy;
        float _202 = _200.x;
        float _204 = _200.y;
        float2 _2247 = float2(_143, _137);
        float2 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2247, float2(0.0), isnan(_2247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2247, float2(0.0), isnan(_2247))).xy;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _151);
        float _214 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _143);
        bool _216 = _204 >= 0.800000011920928955078125;
        bool _218 = isnan(_204);
        bool _220 = _216 || _218;
        bool _222 = isnan(0.800000011920928955078125);
        bool _224 = _220 || _222;
        bool _226 = _210 > 0.800000011920928955078125;
        bool _228 = isnan(_210);
        bool _230 = _226 || _228;
        bool _232 = isnan(0.800000011920928955078125);
        bool _234 = _230 || _232;
        bool _236 = _202 != 0.0;
        bool _238 = isnan(_202);
        bool _240 = _236 || _238;
        bool _242 = isnan(0.0);
        bool _244 = _240 || _242;
        bool _246 = !_224;
        bool _248 = _244 || _246;
        bool _250 = _208 != 0.0;
        bool _252 = isnan(_208);
        bool _254 = _250 || _252;
        bool _256 = isnan(0.0);
        bool _258 = _254 || _256;
        bool _260 = !_234;
        bool _262 = _258 || _260;
        float _264 = _202;
        float _266 = _204;
        int _268 = as_type<int>(_212);
        float _270 = _214;
        if (!_248)
        {
            float2 _2334 = float2(_212, _141);
            float2 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2334, float2(0.0), isnan(_2334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2334, float2(0.0), isnan(_2334))).xy;
            float _274 = _272.x;
            float _276 = _272.y;
            _264 = _274;
            _266 = _276;
        }
        float _278 = _264;
        float _280 = _266;
        float _282 = _208;
        float _284 = _210;
        if (!_262)
        {
            float2 _2356 = float2(_214, _137);
            float2 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2356, float2(0.0), isnan(_2356))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2356, float2(0.0), isnan(_2356))).xy;
            float _288 = _286.x;
            float _290 = _286.y;
            _282 = _288;
            _284 = _290;
        }
        float _292 = _282;
        float _294 = _284;
        if (_248)
        {
            _166 = 1;
        }
        int _296 = _166;
        int _298 = _296;
        if (!_248)
        {
            _298 = 0;
        }
        int _300 = _298;
        float _302 = 0.0;
        int _304 = _300;
        if (_248)
        {
            _302 = _212;
        }
        float _306 = _302;
        float _308 = _306;
        if (!_248)
        {
            float _310 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _212);
            _308 = _310;
        }
        float _312 = _308;
        int _314 = _300 & 1;
        bool _316 = _314 != 0;
        float _318 = _312;
        if (_316)
        {
            _168 = _300;
        }
        int _320 = _168;
        int _322 = _320;
        int _324 = _320;
        float _326 = _280;
        float _328 = _278;
        float _330 = _294;
        float _332 = _292;
        if (!_316)
        {
            bool _334 = _280 >= 0.800000011920928955078125;
            bool _336 = isnan(_280);
            bool _338 = _334 || _336;
            bool _340 = isnan(0.800000011920928955078125);
            bool _342 = _338 || _340;
            bool _344 = _278 != 0.0;
            bool _346 = isnan(_278);
            bool _348 = _344 || _346;
            bool _350 = isnan(0.0);
            bool _352 = _348 || _350;
            bool _354 = !_342;
            bool _356 = _352 || _354;
            if (_356)
            {
                _322 = 1;
            }
            int _358 = _322;
            _324 = _358;
            if (!_356)
            {
                float2 _2454 = float2(_312, _141);
                float2 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2454, float2(0.0), isnan(_2454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2454, float2(0.0), isnan(_2454))).xy;
                float _362 = _360.x;
                float _364 = _360.y;
                float _366 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _312);
                _324 = _300;
                _326 = _364;
                _328 = _362;
                _318 = _366;
            }
        }
        int _368 = _324;
        float _370 = _326;
        float _372 = _328;
        float _374 = _318;
        int _376 = _368 & 1;
        bool _378 = _376 != 0;
        float _380 = _370;
        float _382 = _372;
        float _384 = _374;
        int _386 = _368;
        if (_378)
        {
            _304 = _368;
        }
        int _388 = _304;
        int _390 = _388;
        int _392 = _388;
        if (!_378)
        {
            bool _394 = _370 >= 0.800000011920928955078125;
            bool _396 = isnan(_370);
            bool _398 = _394 || _396;
            bool _400 = isnan(0.800000011920928955078125);
            bool _402 = _398 || _400;
            bool _404 = _372 != 0.0;
            bool _406 = isnan(_372);
            bool _408 = _404 || _406;
            bool _410 = isnan(0.0);
            bool _412 = _408 || _410;
            bool _414 = !_402;
            bool _416 = _412 || _414;
            if (_416)
            {
                _390 = 1;
            }
            int _418 = _390;
            _392 = _418;
            if (!_416)
            {
                float2 _2533 = float2(_374, _141);
                float2 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2533, float2(0.0), isnan(_2533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2533, float2(0.0), isnan(_2533))).xy;
                float _422 = _420.x;
                float _424 = _420.y;
                float _426 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _374);
                _392 = _368;
                _380 = _424;
                _382 = _422;
                _384 = _426;
            }
        }
        int _428 = _392;
        float _430 = _380;
        float _432 = _382;
        float _434 = _384;
        int _436 = _428 & 1;
        bool _438 = _436 != 0;
        float _440 = _430;
        float _442 = _432;
        float _444 = _434;
        int _446 = _428;
        if (_438)
        {
            _386 = _428;
        }
        int _448 = _386;
        int _450 = _448;
        int _452 = _448;
        if (!_438)
        {
            bool _454 = _430 >= 0.800000011920928955078125;
            bool _456 = isnan(_430);
            bool _458 = _454 || _456;
            bool _460 = isnan(0.800000011920928955078125);
            bool _462 = _458 || _460;
            bool _464 = _432 != 0.0;
            bool _466 = isnan(_432);
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
                float2 _2612 = float2(_434, _141);
                float2 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2612, float2(0.0), isnan(_2612))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2612, float2(0.0), isnan(_2612))).xy;
                float _482 = _480.x;
                float _484 = _480.y;
                float _486 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _434);
                _452 = _428;
                _440 = _484;
                _442 = _482;
                _444 = _486;
            }
        }
        int _488 = _452;
        float _490 = _440;
        float _492 = _442;
        float _494 = _444;
        int _496 = _488 & 1;
        bool _498 = _496 != 0;
        float _500 = _490;
        float _502 = _492;
        float _504 = _494;
        int _506 = _488;
        if (_498)
        {
            _446 = _488;
        }
        int _508 = _446;
        int _510 = _508;
        int _512 = _508;
        if (!_498)
        {
            bool _514 = _490 >= 0.800000011920928955078125;
            bool _516 = isnan(_490);
            bool _518 = _514 || _516;
            bool _520 = isnan(0.800000011920928955078125);
            bool _522 = _518 || _520;
            bool _524 = _492 != 0.0;
            bool _526 = isnan(_492);
            bool _528 = _524 || _526;
            bool _530 = isnan(0.0);
            bool _532 = _528 || _530;
            bool _534 = !_522;
            bool _536 = _532 || _534;
            if (_536)
            {
                _510 = 1;
            }
            int _538 = _510;
            _512 = _538;
            if (!_536)
            {
                float2 _2691 = float2(_494, _141);
                float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2691, float2(0.0), isnan(_2691))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2691, float2(0.0), isnan(_2691))).xy;
                float _542 = _540.x;
                float _544 = _540.y;
                float _546 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _494);
                _512 = _488;
                _500 = _544;
                _502 = _542;
                _504 = _546;
            }
        }
        int _548 = _512;
        float _550 = _500;
        float _552 = _502;
        float _554 = _504;
        int _556 = _548 & 1;
        bool _558 = _556 != 0;
        float _560 = _554;
        float _562 = _550;
        float _564 = _552;
        float _566 = as_type<float>(_548);
        if (_262)
        {
            _268 = 1;
        }
        int _568 = _268;
        int _570 = _568;
        if (!_262)
        {
            _570 = 0;
        }
        int _572 = _570;
        int _574 = _572 & 1;
        bool _576 = _574 != 0;
        float _578 = as_type<float>(_572);
        if (_558)
        {
            _506 = _548;
        }
        int _580 = _506;
        int _582 = _580;
        int _584 = _580;
        if (!_558)
        {
            bool _586 = _550 >= 0.800000011920928955078125;
            bool _588 = isnan(_550);
            bool _590 = _586 || _588;
            bool _592 = isnan(0.800000011920928955078125);
            bool _594 = _590 || _592;
            bool _596 = _552 != 0.0;
            bool _598 = isnan(_552);
            bool _600 = _596 || _598;
            bool _602 = isnan(0.0);
            bool _604 = _600 || _602;
            bool _606 = !_594;
            bool _608 = _604 || _606;
            if (_608)
            {
                _582 = 1;
            }
            int _610 = _582;
            _584 = _610;
            if (!_608)
            {
                float2 _2787 = float2(_554, _141);
                float2 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2787, float2(0.0), isnan(_2787))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2787, float2(0.0), isnan(_2787))).xy;
                float _614 = _612.x;
                float _616 = _612.y;
                float _618 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _554);
                _584 = _548;
                _560 = _618;
                _562 = _616;
                _564 = _614;
            }
        }
        int _620 = _584;
        float _622 = _560;
        float _624 = _562;
        float _626 = _564;
        int _628 = _620 & 1;
        bool _630 = _628 != 0;
        float _632 = _626;
        float _634 = _624;
        int _636 = _620;
        if (!_262)
        {
            float _638 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _214);
            _270 = _638;
        }
        float _640 = _270;
        float _642 = _640;
        if (_630)
        {
            _566 = _622;
        }
        float _644 = _566;
        float _646 = _644;
        float _648 = _644;
        if (!_630)
        {
            bool _650 = _624 >= 0.800000011920928955078125;
            bool _652 = isnan(_624);
            bool _654 = _650 || _652;
            bool _656 = isnan(0.800000011920928955078125);
            bool _658 = _654 || _656;
            bool _660 = _626 != 0.0;
            bool _662 = isnan(_626);
            bool _664 = _660 || _662;
            bool _666 = isnan(0.0);
            bool _668 = _664 || _666;
            bool _670 = !_658;
            bool _672 = _668 || _670;
            if (_672)
            {
                _646 = _622;
            }
            float _674 = _646;
            _648 = _674;
            if (!_672)
            {
                float2 _2877 = float2(_622, _141);
                float2 _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2877, float2(0.0), isnan(_2877))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2877, float2(0.0), isnan(_2877))).xy;
                float _678 = _676.x;
                float _680 = _676.y;
                float _682 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, -2.0, _622);
                _632 = _678;
                _634 = _680;
                _648 = _682;
            }
        }
        float _684 = _632;
        float _686 = _634;
        float _688 = _648;
        if (_576)
        {
            _170 = _572;
        }
        int _690 = _170;
        int _692 = _690;
        int _694 = _690;
        if (!_576)
        {
            bool _696 = _294 > 0.800000011920928955078125;
            bool _698 = isnan(_294);
            bool _700 = _696 || _698;
            bool _702 = isnan(0.800000011920928955078125);
            bool _704 = _700 || _702;
            bool _706 = _292 != 0.0;
            bool _708 = isnan(_292);
            bool _710 = _706 || _708;
            bool _712 = isnan(0.0);
            bool _714 = _710 || _712;
            bool _716 = !_704;
            bool _718 = _714 || _716;
            if (_718)
            {
                _692 = 1;
            }
            int _720 = _692;
            _694 = _720;
            if (!_718)
            {
                float2 _2946 = float2(_640, _137);
                float2 _722 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2946, float2(0.0), isnan(_2946))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2946, float2(0.0), isnan(_2946))).xy;
                float _724 = _722.x;
                float _726 = _722.y;
                float _728 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _640);
                _694 = _572;
                _330 = _726;
                _332 = _724;
                _642 = _728;
            }
        }
        int _730 = _694;
        float _732 = _330;
        float _734 = _332;
        float _736 = _642;
        int _738 = _730 & 1;
        bool _740 = _738 != 0;
        float _742 = _732;
        float _744 = _734;
        float _746 = _736;
        int _748 = _730;
        if (_740)
        {
            _636 = _730;
        }
        int _750 = _636;
        int _752 = _750;
        int _754 = _750;
        if (!_740)
        {
            bool _756 = _732 > 0.800000011920928955078125;
            bool _758 = isnan(_732);
            bool _760 = _756 || _758;
            bool _762 = isnan(0.800000011920928955078125);
            bool _764 = _760 || _762;
            bool _766 = _734 != 0.0;
            bool _768 = isnan(_734);
            bool _770 = _766 || _768;
            bool _772 = isnan(0.0);
            bool _774 = _770 || _772;
            bool _776 = !_764;
            bool _778 = _774 || _776;
            if (_778)
            {
                _752 = 1;
            }
            int _780 = _752;
            _754 = _780;
            if (!_778)
            {
                float2 _3025 = float2(_736, _137);
                float2 _782 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3025, float2(0.0), isnan(_3025))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3025, float2(0.0), isnan(_3025))).xy;
                float _784 = _782.x;
                float _786 = _782.y;
                float _788 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _736);
                _754 = _730;
                _742 = _786;
                _744 = _784;
                _746 = _788;
            }
        }
        int _790 = _754;
        float _792 = _742;
        float _794 = _744;
        float _796 = _746;
        int _798 = _790 & 1;
        bool _800 = _798 != 0;
        float _802 = _792;
        float _804 = _794;
        float _806 = _796;
        int _808 = _790;
        if (_800)
        {
            _748 = _790;
        }
        int _810 = _748;
        int _812 = _810;
        int _814 = _810;
        if (!_800)
        {
            bool _816 = _792 > 0.800000011920928955078125;
            bool _818 = isnan(_792);
            bool _820 = _816 || _818;
            bool _822 = isnan(0.800000011920928955078125);
            bool _824 = _820 || _822;
            bool _826 = _794 != 0.0;
            bool _828 = isnan(_794);
            bool _830 = _826 || _828;
            bool _832 = isnan(0.0);
            bool _834 = _830 || _832;
            bool _836 = !_824;
            bool _838 = _834 || _836;
            if (_838)
            {
                _812 = 1;
            }
            int _840 = _812;
            _814 = _840;
            if (!_838)
            {
                float2 _3104 = float2(_796, _137);
                float2 _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3104, float2(0.0), isnan(_3104))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3104, float2(0.0), isnan(_3104))).xy;
                float _844 = _842.x;
                float _846 = _842.y;
                float _848 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _796);
                _814 = _790;
                _802 = _846;
                _804 = _844;
                _806 = _848;
            }
        }
        int _850 = _814;
        float _852 = _802;
        float _854 = _804;
        float _856 = _806;
        int _858 = _850 & 1;
        bool _860 = _858 != 0;
        float _862 = _852;
        float _864 = _854;
        float _866 = _856;
        int _868 = _850;
        if (_860)
        {
            _808 = _850;
        }
        int _870 = _808;
        int _872 = _870;
        int _874 = _870;
        if (!_860)
        {
            bool _876 = _852 > 0.800000011920928955078125;
            bool _878 = isnan(_852);
            bool _880 = _876 || _878;
            bool _882 = isnan(0.800000011920928955078125);
            bool _884 = _880 || _882;
            bool _886 = _854 != 0.0;
            bool _888 = isnan(_854);
            bool _890 = _886 || _888;
            bool _892 = isnan(0.0);
            bool _894 = _890 || _892;
            bool _896 = !_884;
            bool _898 = _894 || _896;
            if (_898)
            {
                _872 = 1;
            }
            int _900 = _872;
            _874 = _900;
            if (!_898)
            {
                float2 _3183 = float2(_856, _137);
                float2 _902 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3183, float2(0.0), isnan(_3183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3183, float2(0.0), isnan(_3183))).xy;
                float _904 = _902.x;
                float _906 = _902.y;
                float _908 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _856);
                _874 = _850;
                _862 = _906;
                _864 = _904;
                _866 = _908;
            }
        }
        int _910 = _874;
        float _912 = _862;
        float _914 = _864;
        float _916 = _866;
        int _918 = _910 & 1;
        bool _920 = _918 != 0;
        float _922 = _916;
        float _924 = _914;
        float _926 = _912;
        if (_920)
        {
            _868 = _910;
        }
        int _928 = _868;
        int _930 = _928;
        int _932 = _928;
        if (!_920)
        {
            bool _934 = _912 > 0.800000011920928955078125;
            bool _936 = isnan(_912);
            bool _938 = _934 || _936;
            bool _940 = isnan(0.800000011920928955078125);
            bool _942 = _938 || _940;
            bool _944 = _914 != 0.0;
            bool _946 = isnan(_914);
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
                float2 _3261 = float2(_916, _137);
                float2 _960 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3261, float2(0.0), isnan(_3261))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3261, float2(0.0), isnan(_3261))).xy;
                float _962 = _960.x;
                float _964 = _960.y;
                float _966 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _916);
                _932 = _910;
                _922 = _966;
                _924 = _962;
                _926 = _964;
            }
        }
        int _968 = _932;
        float _970 = _922;
        float _972 = _924;
        float _974 = _926;
        int _976 = _968 & 1;
        bool _978 = _976 != 0;
        float _980 = as_type<float>(_968);
        if (_978)
        {
            _980 = _970;
        }
        float _982 = _980;
        float _984 = _982;
        float _986 = _982;
        if (_978)
        {
            _578 = _972;
        }
        float _988 = _578;
        float _990 = _988;
        float _992 = _988;
        if (_978)
        {
            _172 = _974;
        }
        float _994 = _172;
        float _996 = _994;
        float _998 = _994;
        if (!_978)
        {
            bool _1000 = _974 > 0.800000011920928955078125;
            bool _1002 = isnan(_974);
            bool _1004 = _1000 || _1002;
            bool _1006 = isnan(0.800000011920928955078125);
            bool _1008 = _1004 || _1006;
            bool _1010 = _972 != 0.0;
            bool _1012 = isnan(_972);
            bool _1014 = _1010 || _1012;
            bool _1016 = isnan(0.0);
            bool _1018 = _1014 || _1016;
            bool _1020 = !_1008;
            bool _1022 = _1018 || _1020;
            if (_1022)
            {
                _990 = _972;
            }
            float _1024 = _990;
            _992 = _1024;
            if (_1022)
            {
                _996 = _974;
            }
            float _1026 = _996;
            _998 = _1026;
            if (_1022)
            {
                _984 = _970;
            }
            float _1028 = _984;
            _986 = _1028;
            if (!_1022)
            {
                float2 _3365 = float2(_970, _137);
                float2 _1030 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3365, float2(0.0), isnan(_3365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3365, float2(0.0), isnan(_3365))).xy;
                float _1032 = _1030.x;
                float _1034 = _1030.y;
                float _1036 = fma((*spvDescriptorSet0.fp_c3)._m0[0].z, 2.0, _970);
                _992 = _1032;
                _998 = _1034;
                _986 = _1036;
            }
        }
        float _1038 = _992;
        float _1040 = _998;
        float _1042 = _986;
        float _1044 = fma(_1038, 0.5, 0.5234375);
        float _1046 = fma(_1040, 2.0, 0.03125);
        float _1048 = fma(_684, 0.5, 0.0078125);
        float _1050 = fma(_686, 2.0, 0.03125);
        float2 _3401 = float2(_1044, _1046);
        float _1052 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3401, float2(0.0), isnan(_3401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3401, float2(0.0), isnan(_3401))).x;
        float2 _3409 = float2(_1048, _1050);
        float _1054 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3409, float2(0.0), isnan(_3409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3409, float2(0.0), isnan(_3409))).x;
        float _1056 = fma(_1052, -2.007874011993408203125, 3.25);
        float _1058 = fma(_1054, -2.007874011993408203125, 3.25);
        float _1060 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1062 = fma(_1056, _1060, _1042);
        float _1064 = fma(_1058, (*spvDescriptorSet0.fp_c3)._m0[0].z, _688);
        float2 _3435 = float2(_1062, _153);
        float _1066 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3435, float2(0.0), isnan(_3435)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3435, float2(0.0), isnan(_3435)), int2(1, 0)).x;
        float2 _3445 = float2(_1064, _153);
        float _1068 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3445, float2(0.0), isnan(_3445))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3445, float2(0.0), isnan(_3445))).x;
        float _1070 = -_159;
        float _1072 = fma(_1064, (*spvDescriptorSet0.fp_c3)._m0[0].x, _1070);
        float _1074 = -_159;
        float _1076 = fma(_1062, (*spvDescriptorSet0.fp_c3)._m0[0].x, _1074);
        float _1078 = rint(_1072);
        float _1080 = rint(_1076);
        float _1082 = abs(_1078);
        float _1084 = sqrt(_1082);
        float _1086 = abs(_1080);
        float _1088 = sqrt(_1086);
        float _1090 = _1066 * 4.0;
        float _1092 = _1068 * 4.0;
        float _1094 = rint(_1090);
        float _1096 = rint(_1092);
        float _1098 = fma(_1094, 16.0, _1088);
        float _1100 = fma(_1098, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _1102 = fma(_1096, 16.0, _1084);
        float _1104 = fma((*spvDescriptorSet0.fp_c3)._m0[3].y, 0.14285714924335479736328125, _1100);
        float _1106 = fma(_1102, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _3508 = float2(_1106, _1104);
        float2 _1108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3508, float2(0.0), isnan(_3508))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3508, float2(0.0), isnan(_3508))).xy;
        float _1110 = _1108.x;
        float _1112 = _1108.y;
        _194 = as_type<int>(_1110);
        _196 = as_type<int>(_1112);
        _174 = as_type<int>(_1080);
        _198 = 0.001785714295692741870880126953125;
        _176 = 1.4012984643248170709237295832899e-45;
        _178 = as_type<int>(_1090);
    }
    int _1114 = _194;
    int _1116 = _196;
    int _1118 = _174;
    float _1120 = _198;
    float _1122 = _176;
    int _1124 = _178;
    bool _1126 = _73 > 0.0;
    int _1128 = _1118;
    float _1130 = _1120;
    float _1132 = _1122;
    int _1134 = _1124;
    if (!_1126)
    {
        _180 = 0;
        _1128 = 0;
    }
    int _1136 = _180;
    int _1138 = _1128;
    if (!_1126)
    {
        out.m_42.x = as_type<float>(_1114);
        out.m_42.y = as_type<float>(_1116);
        out.m_42.z = as_type<float>(_1136);
        out.m_42.w = as_type<float>(_1138);
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _3565 = float2(_139, _153);
    float2 _1140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3565, float2(0.0), isnan(_3565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3565, float2(0.0), isnan(_3565))).xy;
    float _1142 = _1140.x;
    float _1144 = _1140.y;
    float2 _3577 = float2(_145, _147);
    float2 _1146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3577, float2(0.0), isnan(_3577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3577, float2(0.0), isnan(_3577))).xy;
    float _1148 = _1146.x;
    float _1150 = _1146.y;
    float _1152 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _153);
    float _1154 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _147);
    bool _1156 = _1142 > 0.800000011920928955078125;
    bool _1158 = isnan(_1142);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.800000011920928955078125);
    bool _1164 = _1160 || _1162;
    bool _1166 = _1148 > 0.800000011920928955078125;
    bool _1168 = isnan(_1148);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.800000011920928955078125);
    bool _1174 = _1170 || _1172;
    bool _1176 = _1144 != 0.0;
    bool _1178 = isnan(_1144);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(0.0);
    bool _1184 = _1180 || _1182;
    bool _1186 = !_1164;
    bool _1188 = _1184 || _1186;
    bool _1190 = _1150 != 0.0;
    bool _1192 = isnan(_1150);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    bool _1200 = !_1174;
    bool _1202 = _1198 || _1200;
    float _1204 = _1142;
    float _1206 = _1144;
    int _1208 = as_type<int>(_1152);
    int _1210 = as_type<int>(_1150);
    int _1212 = as_type<int>(_1148);
    float _1214 = _1154;
    if (_1188)
    {
        _1130 = _1142;
    }
    float _1216 = _1130;
    if (_1188)
    {
        _1132 = _1144;
    }
    float _1218 = _1132;
    if (_1202)
    {
        _1204 = _1148;
    }
    float _1220 = _1204;
    if (_1202)
    {
        _1206 = _1150;
    }
    float _1222 = _1206;
    float _1224 = _1216;
    float _1226 = _1218;
    if (!_1188)
    {
        float2 _3685 = float2(_139, _1152);
        float2 _1228 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3685, float2(0.0), isnan(_3685))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3685, float2(0.0), isnan(_3685))).xy;
        float _1230 = _1228.x;
        float _1232 = _1228.y;
        _1224 = _1230;
        _1226 = _1232;
    }
    float _1234 = _1224;
    float _1236 = _1226;
    float _1238 = _1220;
    float _1240 = _1222;
    if (!_1202)
    {
        float2 _3707 = float2(_145, _1154);
        float2 _1242 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3707, float2(0.0), isnan(_3707))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3707, float2(0.0), isnan(_3707))).xy;
        float _1244 = _1242.x;
        float _1246 = _1242.y;
        _1238 = _1244;
        _1240 = _1246;
    }
    float _1248 = _1238;
    float _1250 = _1240;
    if (_1188)
    {
        _182 = 1;
    }
    int _1252 = _182;
    int _1254 = _1252;
    if (!_1188)
    {
        _1254 = 0;
    }
    int _1256 = _1254;
    int _1258 = _1256;
    if (_1188)
    {
        _184 = _1152;
    }
    float _1260 = _184;
    float _1262 = _1260;
    if (!_1188)
    {
        float _1264 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1152);
        _1262 = _1264;
    }
    float _1266 = _1262;
    int _1268 = _1256 & 1;
    bool _1270 = _1268 != 0;
    float _1272 = _1266;
    if (_1270)
    {
        _1134 = _1256;
    }
    int _1274 = _1134;
    int _1276 = _1274;
    int _1278 = _1274;
    float _1280 = _1234;
    float _1282 = _1236;
    float _1284 = _1248;
    float _1286 = _1250;
    if (!_1270)
    {
        bool _1288 = _1234 > 0.800000011920928955078125;
        bool _1290 = isnan(_1234);
        bool _1292 = _1288 || _1290;
        bool _1294 = isnan(0.800000011920928955078125);
        bool _1296 = _1292 || _1294;
        bool _1298 = _1236 != 0.0;
        bool _1300 = isnan(_1236);
        bool _1302 = _1298 || _1300;
        bool _1304 = isnan(0.0);
        bool _1306 = _1302 || _1304;
        bool _1308 = !_1296;
        bool _1310 = _1306 || _1308;
        if (_1310)
        {
            _1276 = 1;
        }
        int _1312 = _1276;
        _1278 = _1312;
        if (!_1310)
        {
            float2 _3805 = float2(_139, _1266);
            float2 _1314 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3805, float2(0.0), isnan(_3805))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3805, float2(0.0), isnan(_3805))).xy;
            float _1316 = _1314.x;
            float _1318 = _1314.y;
            float _1320 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1266);
            _1278 = _1256;
            _1280 = _1316;
            _1282 = _1318;
            _1272 = _1320;
        }
    }
    int _1322 = _1278;
    float _1324 = _1280;
    float _1326 = _1282;
    float _1328 = _1272;
    int _1330 = _1322 & 1;
    bool _1332 = _1330 != 0;
    float _1334 = _1324;
    float _1336 = _1326;
    float _1338 = _1328;
    float _1340 = as_type<float>(_1322);
    if (_1332)
    {
        _1208 = _1322;
    }
    int _1342 = _1208;
    int _1344 = _1342;
    int _1346 = _1342;
    if (!_1332)
    {
        bool _1348 = _1324 > 0.800000011920928955078125;
        bool _1350 = isnan(_1324);
        bool _1352 = _1348 || _1350;
        bool _1354 = isnan(0.800000011920928955078125);
        bool _1356 = _1352 || _1354;
        bool _1358 = _1326 != 0.0;
        bool _1360 = isnan(_1326);
        bool _1362 = _1358 || _1360;
        bool _1364 = isnan(0.0);
        bool _1366 = _1362 || _1364;
        bool _1368 = !_1356;
        bool _1370 = _1366 || _1368;
        if (_1370)
        {
            _1344 = 1;
        }
        int _1372 = _1344;
        _1346 = _1372;
        if (!_1370)
        {
            float2 _3885 = float2(_139, _1328);
            float2 _1374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3885, float2(0.0), isnan(_3885))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3885, float2(0.0), isnan(_3885))).xy;
            float _1376 = _1374.x;
            float _1378 = _1374.y;
            float _1380 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1328);
            _1346 = _1322;
            _1334 = _1376;
            _1336 = _1378;
            _1338 = _1380;
        }
    }
    int _1382 = _1346;
    float _1384 = _1334;
    float _1386 = _1336;
    float _1388 = _1338;
    int _1390 = _1382 & 1;
    bool _1392 = _1390 != 0;
    float _1394 = _1384;
    float _1396 = _1386;
    float _1398 = _1388;
    int _1400 = _1382;
    if (_1392)
    {
        _1258 = _1382;
    }
    int _1402 = _1258;
    int _1404 = _1402;
    int _1406 = _1402;
    if (!_1392)
    {
        bool _1408 = _1384 > 0.800000011920928955078125;
        bool _1410 = isnan(_1384);
        bool _1412 = _1408 || _1410;
        bool _1414 = isnan(0.800000011920928955078125);
        bool _1416 = _1412 || _1414;
        bool _1418 = _1386 != 0.0;
        bool _1420 = isnan(_1386);
        bool _1422 = _1418 || _1420;
        bool _1424 = isnan(0.0);
        bool _1426 = _1422 || _1424;
        bool _1428 = !_1416;
        bool _1430 = _1426 || _1428;
        if (_1430)
        {
            _1404 = 1;
        }
        int _1432 = _1404;
        _1406 = _1432;
        if (!_1430)
        {
            float2 _3964 = float2(_139, _1388);
            float2 _1434 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3964, float2(0.0), isnan(_3964))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3964, float2(0.0), isnan(_3964))).xy;
            float _1436 = _1434.x;
            float _1438 = _1434.y;
            float _1440 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1388);
            _1406 = _1382;
            _1394 = _1436;
            _1396 = _1438;
            _1398 = _1440;
        }
    }
    int _1442 = _1406;
    float _1444 = _1394;
    float _1446 = _1396;
    float _1448 = _1398;
    int _1450 = _1442 & 1;
    bool _1452 = _1450 != 0;
    float _1454 = _1444;
    float _1456 = _1446;
    float _1458 = _1448;
    float _1460 = as_type<float>(_1442);
    if (_1452)
    {
        _1400 = _1442;
    }
    int _1462 = _1400;
    int _1464 = _1462;
    int _1466 = _1462;
    if (!_1452)
    {
        bool _1468 = _1444 > 0.800000011920928955078125;
        bool _1470 = isnan(_1444);
        bool _1472 = _1468 || _1470;
        bool _1474 = isnan(0.800000011920928955078125);
        bool _1476 = _1472 || _1474;
        bool _1478 = _1446 != 0.0;
        bool _1480 = isnan(_1446);
        bool _1482 = _1478 || _1480;
        bool _1484 = isnan(0.0);
        bool _1486 = _1482 || _1484;
        bool _1488 = !_1476;
        bool _1490 = _1486 || _1488;
        if (_1490)
        {
            _1464 = 1;
        }
        int _1492 = _1464;
        _1466 = _1492;
        if (!_1490)
        {
            float2 _4044 = float2(_139, _1448);
            float2 _1494 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4044, float2(0.0), isnan(_4044))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4044, float2(0.0), isnan(_4044))).xy;
            float _1496 = _1494.x;
            float _1498 = _1494.y;
            float _1500 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1448);
            _1466 = _1442;
            _1454 = _1496;
            _1456 = _1498;
            _1458 = _1500;
        }
    }
    int _1502 = _1466;
    float _1504 = _1454;
    float _1506 = _1456;
    float _1508 = _1458;
    int _1510 = _1502 & 1;
    bool _1512 = _1510 != 0;
    float _1514 = _1508;
    int _1516 = _1502;
    if (_1202)
    {
        _1210 = 1;
    }
    int _1518 = _1210;
    int _1520 = _1518;
    if (!_1202)
    {
        _1520 = 0;
    }
    int _1522 = _1520;
    int _1524 = _1522 & 1;
    bool _1526 = _1524 != 0;
    if (_1512)
    {
        _1212 = _1502;
    }
    int _1528 = _1212;
    int _1530 = _1528;
    int _1532 = _1528;
    if (_1512)
    {
        _1460 = _1504;
    }
    float _1534 = _1460;
    float _1536 = _1534;
    float _1538 = _1534;
    if (_1512)
    {
        _1340 = _1506;
    }
    float _1540 = _1340;
    float _1542 = _1540;
    float _1544 = _1540;
    if (!_1512)
    {
        bool _1546 = _1504 > 0.800000011920928955078125;
        bool _1548 = isnan(_1504);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan(0.800000011920928955078125);
        bool _1554 = _1550 || _1552;
        bool _1556 = _1506 != 0.0;
        bool _1558 = isnan(_1506);
        bool _1560 = _1556 || _1558;
        bool _1562 = isnan(0.0);
        bool _1564 = _1560 || _1562;
        bool _1566 = !_1554;
        bool _1568 = _1564 || _1566;
        if (_1568)
        {
            _1536 = _1504;
        }
        float _1570 = _1536;
        _1538 = _1570;
        if (_1568)
        {
            _1542 = _1506;
        }
        float _1572 = _1542;
        _1544 = _1572;
        if (_1568)
        {
            _1530 = 1;
        }
        int _1574 = _1530;
        _1532 = _1574;
        if (!_1568)
        {
            float2 _4161 = float2(_139, _1508);
            float2 _1576 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4161, float2(0.0), isnan(_4161))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4161, float2(0.0), isnan(_4161))).xy;
            float _1578 = _1576.x;
            float _1580 = _1576.y;
            float _1582 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1508);
            _1532 = _1502;
            _1538 = _1578;
            _1544 = _1580;
            _1514 = _1582;
        }
    }
    int _1584 = _1532;
    float _1586 = _1538;
    float _1588 = _1544;
    float _1590 = _1514;
    int _1592 = _1584 & 1;
    bool _1594 = _1592 != 0;
    float _1596 = _1586;
    float _1598 = _1588;
    float _1600 = _1590;
    if (!_1202)
    {
        float _1602 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1154);
        _1214 = _1602;
    }
    float _1604 = _1214;
    float _1606 = _1604;
    if (!_1594)
    {
        bool _1608 = _1586 > 0.800000011920928955078125;
        bool _1610 = isnan(_1586);
        bool _1612 = _1608 || _1610;
        bool _1614 = isnan(0.800000011920928955078125);
        bool _1616 = _1612 || _1614;
        bool _1618 = _1588 != 0.0;
        bool _1620 = isnan(_1588);
        bool _1622 = _1618 || _1620;
        bool _1624 = isnan(0.0);
        bool _1626 = _1622 || _1624;
        bool _1628 = !_1616;
        bool _1630 = _1626 || _1628;
        if (!_1630)
        {
            float2 _4238 = float2(_139, _1590);
            float2 _1632 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4238, float2(0.0), isnan(_4238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4238, float2(0.0), isnan(_4238))).xy;
            float _1634 = _1632.x;
            float _1636 = _1632.y;
            float _1638 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _1590);
            _1596 = _1634;
            _1598 = _1636;
            _1600 = _1638;
        }
    }
    float _1640 = _1596;
    float _1642 = _1598;
    float _1644 = _1600;
    if (_1526)
    {
        _1516 = _1522;
    }
    int _1646 = _1516;
    int _1648 = _1646;
    int _1650 = _1646;
    if (!_1526)
    {
        bool _1652 = _1248 > 0.800000011920928955078125;
        bool _1654 = isnan(_1248);
        bool _1656 = _1652 || _1654;
        bool _1658 = isnan(0.800000011920928955078125);
        bool _1660 = _1656 || _1658;
        bool _1662 = _1250 != 0.0;
        bool _1664 = isnan(_1250);
        bool _1666 = _1662 || _1664;
        bool _1668 = isnan(0.0);
        bool _1670 = _1666 || _1668;
        bool _1672 = !_1660;
        bool _1674 = _1670 || _1672;
        if (_1674)
        {
            _1648 = 1;
        }
        int _1676 = _1648;
        _1650 = _1676;
        if (!_1674)
        {
            float2 _4307 = float2(_145, _1604);
            float2 _1678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4307, float2(0.0), isnan(_4307))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4307, float2(0.0), isnan(_4307))).xy;
            float _1680 = _1678.x;
            float _1682 = _1678.y;
            float _1684 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1604);
            _1650 = _1522;
            _1284 = _1680;
            _1286 = _1682;
            _1606 = _1684;
        }
    }
    int _1686 = _1650;
    float _1688 = _1284;
    float _1690 = _1286;
    float _1692 = _1606;
    int _1694 = _1686 & 1;
    bool _1696 = _1694 != 0;
    float _1698 = _1688;
    float _1700 = _1690;
    float _1702 = _1692;
    int _1704 = _1686;
    if (_1696)
    {
        _186 = _1686;
    }
    int _1706 = _186;
    int _1708 = _1706;
    int _1710 = _1706;
    if (!_1696)
    {
        bool _1712 = _1688 > 0.800000011920928955078125;
        bool _1714 = isnan(_1688);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan(0.800000011920928955078125);
        bool _1720 = _1716 || _1718;
        bool _1722 = _1690 != 0.0;
        bool _1724 = isnan(_1690);
        bool _1726 = _1722 || _1724;
        bool _1728 = isnan(0.0);
        bool _1730 = _1726 || _1728;
        bool _1732 = !_1720;
        bool _1734 = _1730 || _1732;
        if (_1734)
        {
            _1708 = 1;
        }
        int _1736 = _1708;
        _1710 = _1736;
        if (!_1734)
        {
            float2 _4386 = float2(_145, _1692);
            float2 _1738 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4386, float2(0.0), isnan(_4386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4386, float2(0.0), isnan(_4386))).xy;
            float _1740 = _1738.x;
            float _1742 = _1738.y;
            float _1744 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1692);
            _1710 = _1686;
            _1698 = _1740;
            _1700 = _1742;
            _1702 = _1744;
        }
    }
    int _1746 = _1710;
    float _1748 = _1698;
    float _1750 = _1700;
    float _1752 = _1702;
    int _1754 = _1746 & 1;
    bool _1756 = _1754 != 0;
    float _1758 = _1748;
    float _1760 = _1750;
    float _1762 = _1752;
    int _1764 = _1746;
    if (_1756)
    {
        _1704 = _1746;
    }
    int _1766 = _1704;
    int _1768 = _1766;
    int _1770 = _1766;
    if (!_1756)
    {
        bool _1772 = _1748 > 0.800000011920928955078125;
        bool _1774 = isnan(_1748);
        bool _1776 = _1772 || _1774;
        bool _1778 = isnan(0.800000011920928955078125);
        bool _1780 = _1776 || _1778;
        bool _1782 = _1750 != 0.0;
        bool _1784 = isnan(_1750);
        bool _1786 = _1782 || _1784;
        bool _1788 = isnan(0.0);
        bool _1790 = _1786 || _1788;
        bool _1792 = !_1780;
        bool _1794 = _1790 || _1792;
        if (_1794)
        {
            _1768 = 1;
        }
        int _1796 = _1768;
        _1770 = _1796;
        if (!_1794)
        {
            float2 _4465 = float2(_145, _1752);
            float2 _1798 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4465, float2(0.0), isnan(_4465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4465, float2(0.0), isnan(_4465))).xy;
            float _1800 = _1798.x;
            float _1802 = _1798.y;
            float _1804 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1752);
            _1770 = _1746;
            _1758 = _1800;
            _1760 = _1802;
            _1762 = _1804;
        }
    }
    int _1806 = _1770;
    float _1808 = _1758;
    float _1810 = _1760;
    float _1812 = _1762;
    int _1814 = _1806 & 1;
    bool _1816 = _1814 != 0;
    float _1818 = _1808;
    float _1820 = _1810;
    float _1822 = _1812;
    int _1824 = _1806;
    if (_1816)
    {
        _1764 = _1806;
    }
    int _1826 = _1764;
    int _1828 = _1826;
    int _1830 = _1826;
    if (!_1816)
    {
        bool _1832 = _1808 > 0.800000011920928955078125;
        bool _1834 = isnan(_1808);
        bool _1836 = _1832 || _1834;
        bool _1838 = isnan(0.800000011920928955078125);
        bool _1840 = _1836 || _1838;
        bool _1842 = _1810 != 0.0;
        bool _1844 = isnan(_1810);
        bool _1846 = _1842 || _1844;
        bool _1848 = isnan(0.0);
        bool _1850 = _1846 || _1848;
        bool _1852 = !_1840;
        bool _1854 = _1850 || _1852;
        if (_1854)
        {
            _1828 = 1;
        }
        int _1856 = _1828;
        _1830 = _1856;
        if (!_1854)
        {
            float2 _4544 = float2(_145, _1812);
            float2 _1858 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4544, float2(0.0), isnan(_4544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4544, float2(0.0), isnan(_4544))).xy;
            float _1860 = _1858.x;
            float _1862 = _1858.y;
            float _1864 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1812);
            _1830 = _1806;
            _1818 = _1860;
            _1820 = _1862;
            _1822 = _1864;
        }
    }
    int _1866 = _1830;
    float _1868 = _1818;
    float _1870 = _1820;
    float _1872 = _1822;
    int _1874 = _1866 & 1;
    bool _1876 = _1874 != 0;
    float _1878 = _1868;
    float _1880 = _1870;
    float _1882 = _1872;
    if (_1876)
    {
        _1824 = _1866;
    }
    int _1884 = _1824;
    int _1886 = _1884;
    int _1888 = _1884;
    if (!_1876)
    {
        bool _1890 = _1868 > 0.800000011920928955078125;
        bool _1892 = isnan(_1868);
        bool _1894 = _1890 || _1892;
        bool _1896 = isnan(0.800000011920928955078125);
        bool _1898 = _1894 || _1896;
        bool _1900 = _1870 != 0.0;
        bool _1902 = isnan(_1870);
        bool _1904 = _1900 || _1902;
        bool _1906 = isnan(0.0);
        bool _1908 = _1904 || _1906;
        bool _1910 = !_1898;
        bool _1912 = _1908 || _1910;
        if (_1912)
        {
            _1886 = 1;
        }
        int _1914 = _1886;
        _1888 = _1914;
        if (!_1912)
        {
            float2 _4622 = float2(_145, _1872);
            float2 _1916 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4622, float2(0.0), isnan(_4622))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4622, float2(0.0), isnan(_4622))).xy;
            float _1918 = _1916.x;
            float _1920 = _1916.y;
            float _1922 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1872);
            _1888 = _1866;
            _1878 = _1918;
            _1880 = _1920;
            _1882 = _1922;
        }
    }
    int _1924 = _1888;
    float _1926 = _1878;
    float _1928 = _1880;
    float _1930 = _1882;
    int _1932 = _1924 & 1;
    bool _1934 = _1932 != 0;
    float _1936 = _1928;
    float _1938 = _1926;
    float _1940 = _1930;
    if (!_1934)
    {
        bool _1942 = _1926 > 0.800000011920928955078125;
        bool _1944 = isnan(_1926);
        bool _1946 = _1942 || _1944;
        bool _1948 = isnan(0.800000011920928955078125);
        bool _1950 = _1946 || _1948;
        bool _1952 = _1928 != 0.0;
        bool _1954 = isnan(_1928);
        bool _1956 = _1952 || _1954;
        bool _1958 = isnan(0.0);
        bool _1960 = _1956 || _1958;
        bool _1962 = !_1950;
        bool _1964 = _1960 || _1962;
        if (!_1964)
        {
            float2 _4688 = float2(_145, _1930);
            float2 _1966 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4688, float2(0.0), isnan(_4688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4688, float2(0.0), isnan(_4688))).xy;
            float _1968 = _1966.x;
            float _1970 = _1966.y;
            float _1972 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _1930);
            _1936 = _1970;
            _1938 = _1968;
            _1940 = _1972;
        }
    }
    float _1974 = _1936;
    float _1976 = _1938;
    float _1978 = _1940;
    float _1980 = fma(_1974, 0.5, 0.5234375);
    float _1982 = fma(_1976, 2.0, 0.03125);
    float _1984 = fma(_1640, 2.0, 0.03125);
    float _1986 = fma(_1642, 0.5, 0.0078125);
    float2 _4720 = float2(_1980, _1982);
    float _1988 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4720, float2(0.0), isnan(_4720))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4720, float2(0.0), isnan(_4720))).x;
    float2 _4728 = float2(_1986, _1984);
    float _1990 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4728, float2(0.0), isnan(_4728))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4728, float2(0.0), isnan(_4728))).x;
    float _1992 = fma(_1988, -2.007874011993408203125, 3.25);
    float _1994 = fma(_1990, -2.007874011993408203125, 3.25);
    float _1996 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _1998 = fma(_1992, _1996, _1978);
    float _2000 = fma(_1994, (*spvDescriptorSet0.fp_c3)._m0[0].w, _1644);
    float2 _4752 = float2(_151, _1998);
    float _2002 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4752, float2(0.0), isnan(_4752)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4752, float2(0.0), isnan(_4752)), int2(0, 1)).y;
    float2 _4761 = float2(_151, _2000);
    float _2004 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4761, float2(0.0), isnan(_4761))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4761, float2(0.0), isnan(_4761))).y;
    float _2006 = -_149;
    float _2008 = fma(_2000, (*spvDescriptorSet0.fp_c3)._m0[0].y, _2006);
    float _2010 = -_149;
    float _2012 = fma(_1998, (*spvDescriptorSet0.fp_c3)._m0[0].y, _2010);
    float _2014 = rint(_2008);
    float _2016 = rint(_2012);
    float _2018 = abs(_2014);
    float _2020 = sqrt(_2018);
    float _2022 = abs(_2016);
    float _2024 = sqrt(_2022);
    float _2026 = _2002 * 4.0;
    float _2028 = _2004 * 4.0;
    float _2030 = rint(_2026);
    float _2032 = rint(_2028);
    float _2034 = fma(_2030, 16.0, _2024);
    float _2036 = fma(_2034, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
    float _2038 = fma(_2032, 16.0, _2020);
    float _2040 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, 0.14285714924335479736328125, _2036);
    float _2042 = fma(_2038, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
    float2 _4817 = float2(_2042, _2040);
    float2 _2044 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_4817, float2(0.0), isnan(_4817))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_4817, float2(0.0), isnan(_4817))).xy;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    out.m_42.x = as_type<float>(_1114);
    out.m_42.y = as_type<float>(_1116);
    out.m_42.z = _2046;
    out.m_42.w = _2048;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

