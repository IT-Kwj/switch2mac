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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_47 [[user(locn4), flat]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_43 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = in.m_37.y;
    float _65 = in.m_37.x;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = in.m_41.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = -_63;
    float _79 = _77 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _81 = -_65;
    float _83 = _81 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _85 = -_67;
    float _87 = _85 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _89 = 1.0 / _69;
    float _91 = _79 * _79;
    float _93 = fma(_83, _83, _91);
    float _95 = fma(_87, _87, _93);
    float _97 = sqrt(_95);
    float _99 = precise::max(_97, 46.0);
    float _101 = precise::min(_99, 65.0);
    float _103 = fma(_101, 0.052631579339504241943359375, -2.4210526943206787109375);
    float _105 = _89 * _75;
    float _107 = 0.0 + _103;
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = _109 * _105;
    bool _115 = _111 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _117 = isnan(_111);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _123 = _119 || _121;
    float _125 = in.m_43.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_43.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    if (!_123)
    {
        discard_fragment();
    }
    float _137 = _89 * _129;
    float _139 = _89 * _135;
    float _141 = fma(_137, 2.0, -1.0);
    float _143 = fma(_139, 2.0, -1.0);
    float _145 = fma(_141, -4.3711388286737928865477442741394e-08, _143);
    float _147 = -_141;
    float _149 = fma(_143, -4.3711388286737928865477442741394e-08, _147);
    float _151 = abs(_145);
    float _153 = abs(_149);
    float _155 = precise::max(_151, _153);
    bool _157 = _155 >= 16.0;
    float _159 = _149 * (-0.0625);
    float _161 = -_149;
    float _163 = _157 ? _159 : _161;
    float _165 = abs(_163);
    bool _167 = _165 != 0.0;
    bool _169 = isnan(_165);
    bool _171 = _167 || _169;
    bool _173 = isnan(0.0);
    bool _175 = _171 || _173;
    float _177 = _145;
    int _180 = as_type<int>(_139);
    if (_157)
    {
        float _182 = _145 * 0.0625;
        _177 = _182;
    }
    float _184 = _177;
    float _186 = abs(_184);
    bool _188 = _186 == 0.0;
    bool _190 = !_175;
    bool _192 = _188 && _190;
    float _194 = abs(_184);
    bool _196 = _194 == 0.0;
    bool _198 = false;
    if (_192)
    {
        bool _200 = as_type<int>(_184) >= 0;
        _198 = _200;
    }
    bool _202 = _198;
    int _204 = _202 ? (-1) : 0;
    if (_192)
    {
        int _206 = _202 ? 0 : 1078530011;
        _180 = _206;
    }
    int _208 = _180;
    int _210 = _208;
    if (_192)
    {
        int _212 = int(0x80000000) & as_type<int>(_163);
        int _214 = _208 | _212;
        _210 = _214;
    }
    int _216 = _210;
    bool _218 = !_175;
    bool _220 = _218 && _196;
    int _222 = _216;
    float _224 = as_type<float>(_216);
    if (!_220)
    {
        float _226 = abs(_163);
        bool _228 = _226 != as_type<float>(0x7f800000u /* inf */);
        bool _230 = isnan(_226);
        bool _232 = _228 || _230;
        bool _234 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _236 = _232 || _234;
        float _238 = abs(_184);
        bool _240 = _238 == as_type<float>(0x7f800000u /* inf */);
        float _242 = abs(_184);
        bool _244 = _242 == as_type<float>(0x7f800000u /* inf */);
        bool _246 = !_236;
        bool _248 = _244 && _246;
        if (_248)
        {
            bool _250 = as_type<int>(_184) >= 0;
            _204 = _250 ? (-1) : 0;
        }
        int _252 = _204;
        if (_248)
        {
            _222 = 1075235812;
        }
        int _254 = _222;
        int _256 = _254;
        if (_248)
        {
            int _258 = ~_252;
            int _260 = (_258 != 0) ? _254 : 1061752795;
            _256 = _260;
        }
        int _262 = _256;
        float _264 = as_type<float>(_262);
        if (_248)
        {
            int _266 = int(0x80000000) & as_type<int>(_163);
            int _268 = _262 | _266;
            _264 = as_type<float>(_268);
        }
        float _270 = _264;
        bool _272 = !_236;
        bool _274 = _272 && _240;
        _224 = _270;
        if (!_274)
        {
            float _276 = abs(_184);
            float _278 = abs(_163);
            float _280 = precise::max(_276, _278);
            float _282 = abs(_184);
            float _284 = abs(_163);
            float _286 = precise::min(_282, _284);
            float _288 = 1.0 / _280;
            float _290 = abs(_163);
            float _292 = abs(_184);
            bool _294 = _290 > _292;
            bool _296 = as_type<int>(_184) >= 0;
            float _298 = _286 * _288;
            float _300 = _298 * _298;
            float _302 = _300 + 11.33538818359375;
            float _304 = fma(_300, _302, 28.84246826171875);
            float _306 = fma(_300, _304, 19.6966705322265625);
            float _308 = fma(_300, -0.82336294651031494140625, -5.674867153167724609375);
            float _310 = fma(_300, _308, -6.565555095672607421875);
            float _312 = 1.0 / _306;
            float _314 = _300 * _310;
            float _316 = abs(_184);
            float _318 = abs(_163);
            float _320 = _316 + _318;
            float _322 = _298 * _314;
            bool _324 = _320 > as_type<float>(0x7f800000u /* inf */);
            bool _326 = isnan(_320);
            bool _328 = _324 || _326;
            bool _330 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _332 = _328 || _330;
            float _334 = fma(_322, _312, _298);
            int _336 = as_type<int>(_163) & int(0x80000000);
            float _338 = _334;
            _224 = _320;
            if (_294)
            {
                float _340 = -_334;
                float _342 = _340 + 1.57079637050628662109375;
                _338 = _342;
            }
            float _344 = _338;
            int _346 = as_type<int>(_344);
            if (!_296)
            {
                float _348 = -_344;
                float _350 = _348 + 3.1415927410125732421875;
                _346 = as_type<int>(_350);
            }
            int _352 = _346;
            if (!_332)
            {
                int _354 = _336 | _352;
                _224 = as_type<float>(_354);
            }
        }
    }
    float _356 = _224;
    float _358 = in.m_45.w;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_47.y;
    float _366 = in.m_45.y;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_45.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_49.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_49.w;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_49.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_49.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = _89 * _362;
    float _404 = _364 * 0.23000000417232513427734375;
    float _406 = _89 * _370;
    float _408 = _89 * _376;
    float _410 = 1.0 / _402;
    float _412 = _89 * _382;
    float _414 = _89 * _388;
    float _416 = fma(_402, 0.001000000047497451305389404296875, _406);
    float _418 = _89 * _400;
    float _420 = floor(_404);
    float _422 = _408 * _410;
    float _424 = _406 * _410;
    float _426 = _416 * _410;
    float _428 = fma(_420, 0.37999999523162841796875, _412);
    float _430 = fma(_420, 0.430000007152557373046875, _414);
    float _432 = fma(_402, 0.001000000047497451305389404296875, _408);
    float2 _1899 = float2(_422, _424);
    float _434 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1899, float2(0.0), isnan(_1899))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1899, float2(0.0), isnan(_1899))).x;
    float2 _1909 = float2(_422, _426);
    float _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1909, float2(0.0), isnan(_1909))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1909, float2(0.0), isnan(_1909))).x;
    float _438 = _89 * _394;
    float _440 = _432 * _410;
    float2 _1923 = float2(_440, _424);
    float _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1923, float2(0.0), isnan(_1923))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1923, float2(0.0), isnan(_1923))).x;
    float2 _1931 = float2(_438, _418);
    float _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1931, float2(0.0), isnan(_1931))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1931, float2(0.0), isnan(_1931))).w;
    float2 _1939 = float2(_428, _430);
    float _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1939, float2(0.0), isnan(_1939))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1939, float2(0.0), isnan(_1939))).w;
    float _448 = fma(_440, 2.0, -1.0);
    float _450 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _452 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _450;
    float _454 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _456 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _454;
    float _458 = _452 * _452;
    float _460 = (*spvDescriptorSet0.fp_c10)._m0[10].x * (*spvDescriptorSet0.fp_c10)._m0[10].x;
    float _462 = fma(_422, 2.0, -1.0);
    float _464 = fma(_456, _456, _458);
    float _466 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _468 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _466;
    float _470 = fma((*spvDescriptorSet0.fp_c10)._m0[8].x, (*spvDescriptorSet0.fp_c10)._m0[8].x, _460);
    float _472 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _474 = _472 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _476 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _478 = _476 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _480 = fma(_468, _468, _464);
    float _482 = _474 * _474;
    float _484 = rsqrt(_470);
    float _486 = fma(_424, 2.0, -1.0);
    float _488 = _462 * (*spvDescriptorSet0.fp_c8)._m0[18].x;
    float _490 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _492 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _490;
    float _494 = fma(_478, _478, _482);
    float _496 = (*spvDescriptorSet0.fp_c9)._m0[191].y + 7.0;
    float _498 = -(*spvDescriptorSet0.fp_c8)._m0[16].y;
    float _500 = _486 * _498;
    float _502 = -(*spvDescriptorSet0.fp_c8)._m0[19].y;
    float _504 = _486 * _502;
    float _506 = sqrt(_480);
    float _508 = 1.0 / _492;
    float _510 = precise::max(_506, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _512 = rsqrt(_494);
    float _514 = precise::min(_510, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _516 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _518 = _514 + _516;
    float _520 = _518 * _508;
    float _522 = _484 * (*spvDescriptorSet0.fp_c10)._m0[10].x;
    float _524 = _520 * 3.0;
    float _526 = _474 * _512;
    float _528 = _478 * _512;
    float _530 = in.m_45.z;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = floor(_524);
    float _538 = _526 * _522;
    float _540 = _484 * (*spvDescriptorSet0.fp_c10)._m0[8].x;
    float _542 = fma(_528, _540, _538);
    bool _544 = _496 >= _506;
    bool _546 = isnan(_496);
    bool _548 = _544 || _546;
    bool _550 = isnan(_506);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_536;
    float _558 = _524 + _556;
    bool _560 = _506 <= (*spvDescriptorSet0.fp_c9)._m0[191].y;
    bool _562 = isnan(_506);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.fp_c9)._m0[191].y);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = precise::max(_506, 60.0);
    float _574 = _558 * 2.0;
    float _576 = fma(_356, -0.31830990314483642578125, _574);
    float _578 = precise::max(_542, -0.20000000298023223876953125);
    float _580 = -_570;
    float _582 = _580 + 1.0;
    float _584 = precise::min(_578, 0.20000000298023223876953125);
    float _586 = _582 * _554;
    bool _588 = _576 <= 1.0;
    bool _590 = isnan(_576);
    bool _592 = _588 || _590;
    bool _594 = isnan(1.0);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = fma(_584, 2.5, 0.5);
    float _602 = _576 * _598;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = _600 * 0.60000002384185791015625;
    float _608 = _604 * _604;
    float _610 = -_586;
    float _612 = fma(_610, _606, 1.0);
    float _614 = _89 * _534;
    float _616 = _604 * _608;
    float _618 = _616 * 0.5;
    float _620 = fma(_570, -0.20000000298023223876953125, 0.20000000298023223876953125);
    float _622 = _614 * _410;
    float _624 = _618 * _600;
    float _626 = -_620;
    float _628 = _626 + 1.0;
    float _630 = -_624;
    float _632 = fma(_630, _570, 1.0);
    float _634 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _636 = fma(_622, (*spvDescriptorSet0.fp_c8)._m0[30].w, _634);
    float _638 = _628 * _612;
    float _640 = 1.0 / _636;
    float _642 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _644 = fma(_434, (*spvDescriptorSet0.fp_c8)._m0[30].w, _642);
    float _646 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _648 = fma(_436, (*spvDescriptorSet0.fp_c8)._m0[30].w, _646);
    float _650 = -(*spvDescriptorSet0.fp_c8)._m0[17].y;
    float _652 = _486 * _650;
    float _654 = 1.0 / _644;
    float _656 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _658 = fma(_442, (*spvDescriptorSet0.fp_c8)._m0[30].w, _656);
    float _660 = _462 * (*spvDescriptorSet0.fp_c8)._m0[19].x;
    float _662 = -_446;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _648;
    float _668 = _462 * (*spvDescriptorSet0.fp_c8)._m0[16].x;
    float _670 = _668 + _500;
    float _672 = fma(_448, (*spvDescriptorSet0.fp_c8)._m0[16].x, _500);
    float _674 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _676 = _654 * _674;
    float _678 = 1.0 / _658;
    float _680 = _676 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _682 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _684 = fma(_676, (*spvDescriptorSet0.fp_c8)._m0[30].y, _682);
    float _686 = fma(_640, (*spvDescriptorSet0.fp_c8)._m0[30].z, _676);
    float _688 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _690 = _666 * _688;
    float _692 = 1.0 / _680;
    float _694 = precise::max(0.0, _686);
    float _696 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _698 = fma(_690, (*spvDescriptorSet0.fp_c8)._m0[30].y, _696);
    float _700 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _702 = _678 * _700;
    float _704 = _462 * (*spvDescriptorSet0.fp_c8)._m0[17].x;
    float _706 = -(*spvDescriptorSet0.fp_c8)._m0[18].y;
    float _708 = _486 * _706;
    float _710 = _704 + _652;
    float _712 = _684 * _692;
    float _714 = fma(_426, 2.0, -1.0);
    float _716 = fma(_448, (*spvDescriptorSet0.fp_c8)._m0[17].x, _652);
    float _718 = fma(_448, (*spvDescriptorSet0.fp_c8)._m0[19].x, _504);
    float _720 = _660 + _504;
    float _722 = -_714;
    float _724 = fma(_722, (*spvDescriptorSet0.fp_c8)._m0[17].y, _704);
    float _726 = _488 + _708;
    float _728 = fma(_448, (*spvDescriptorSet0.fp_c8)._m0[18].x, _708);
    float _730 = fma(_712, 2.0, -1.0);
    float _732 = -_714;
    float _734 = fma(_732, (*spvDescriptorSet0.fp_c8)._m0[19].y, _660);
    float _736 = -_714;
    float _738 = fma(_736, (*spvDescriptorSet0.fp_c8)._m0[18].y, _488);
    float _740 = -_714;
    float _742 = fma(_740, (*spvDescriptorSet0.fp_c8)._m0[16].y, _668);
    float _744 = fma(_730, (*spvDescriptorSet0.fp_c8)._m0[17].z, _710);
    float _746 = fma(_730, (*spvDescriptorSet0.fp_c8)._m0[16].z, _670);
    float _748 = fma(_730, (*spvDescriptorSet0.fp_c8)._m0[18].z, _726);
    float _750 = fma(_730, (*spvDescriptorSet0.fp_c8)._m0[19].z, _720);
    float _752 = _744 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _754 = _746 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _756 = _690 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _758 = _748 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _760 = _752 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _762 = _702 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _764 = _750 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _766 = _752 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _768 = fma(_754, (*spvDescriptorSet0.fp_c8)._m0[15].x, _760);
    float _770 = 1.0 / _756;
    float _772 = _752 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _774 = fma(_754, (*spvDescriptorSet0.fp_c8)._m0[13].x, _766);
    float _776 = fma(_758, (*spvDescriptorSet0.fp_c8)._m0[15].z, _768);
    float _778 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _780 = fma(_702, (*spvDescriptorSet0.fp_c8)._m0[30].y, _778);
    float _782 = fma(_764, (*spvDescriptorSet0.fp_c8)._m0[15].w, _776);
    float _784 = 1.0 / _762;
    float _786 = _752 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _788 = fma(_754, (*spvDescriptorSet0.fp_c8)._m0[12].x, _786);
    float _790 = fma(_754, (*spvDescriptorSet0.fp_c8)._m0[14].x, _772);
    float _792 = fma(_758, (*spvDescriptorSet0.fp_c8)._m0[13].z, _774);
    float _794 = 1.0 / _782;
    float _796 = _698 * _770;
    float _798 = fma(_758, (*spvDescriptorSet0.fp_c8)._m0[12].z, _788);
    float _800 = fma(_758, (*spvDescriptorSet0.fp_c8)._m0[14].z, _790);
    float _802 = fma(_764, (*spvDescriptorSet0.fp_c8)._m0[13].w, _792);
    float _804 = fma(_796, 2.0, -1.0);
    float _806 = fma(_764, (*spvDescriptorSet0.fp_c8)._m0[12].w, _798);
    float _808 = fma(_764, (*spvDescriptorSet0.fp_c8)._m0[14].w, _800);
    float _810 = _780 * _784;
    float _812 = fma(_804, (*spvDescriptorSet0.fp_c8)._m0[16].z, _742);
    float _814 = fma(_804, (*spvDescriptorSet0.fp_c8)._m0[18].z, _738);
    float _816 = fma(_810, 2.0, -1.0);
    float _818 = _812 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _820 = _814 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _822 = _802 * _794;
    float _824 = fma(_804, (*spvDescriptorSet0.fp_c8)._m0[17].z, _724);
    float _826 = fma(_804, (*spvDescriptorSet0.fp_c8)._m0[19].z, _734);
    float _828 = fma(_816, (*spvDescriptorSet0.fp_c8)._m0[17].z, _716);
    float _830 = fma(_816, (*spvDescriptorSet0.fp_c8)._m0[16].z, _672);
    float _832 = _824 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _834 = fma(_816, (*spvDescriptorSet0.fp_c8)._m0[18].z, _728);
    float _836 = _828 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _838 = _830 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _840 = _832 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _842 = fma(_816, (*spvDescriptorSet0.fp_c8)._m0[19].z, _718);
    float _844 = _836 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _846 = _826 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _848 = fma(_818, (*spvDescriptorSet0.fp_c8)._m0[15].x, _840);
    float _850 = _834 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _852 = fma(_838, (*spvDescriptorSet0.fp_c8)._m0[15].x, _844);
    float _854 = _832 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _856 = fma(_820, (*spvDescriptorSet0.fp_c8)._m0[15].z, _848);
    float _858 = _832 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _860 = _832 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _862 = _842 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _864 = fma(_850, (*spvDescriptorSet0.fp_c8)._m0[15].z, _852);
    float _866 = fma(_818, (*spvDescriptorSet0.fp_c8)._m0[12].x, _854);
    float _868 = fma(_818, (*spvDescriptorSet0.fp_c8)._m0[13].x, _858);
    float _870 = fma(_818, (*spvDescriptorSet0.fp_c8)._m0[14].x, _860);
    float _872 = _806 * _794;
    float _874 = _836 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _876 = _808 * _794;
    float _878 = fma(_846, (*spvDescriptorSet0.fp_c8)._m0[15].w, _856);
    float _880 = fma(_862, (*spvDescriptorSet0.fp_c8)._m0[15].w, _864);
    float _882 = _836 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _884 = _836 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _886 = fma(_838, (*spvDescriptorSet0.fp_c8)._m0[12].x, _874);
    float _888 = 1.0 / _878;
    float _890 = fma(_838, (*spvDescriptorSet0.fp_c8)._m0[13].x, _882);
    float _892 = fma(_838, (*spvDescriptorSet0.fp_c8)._m0[14].x, _884);
    float _894 = fma(_820, (*spvDescriptorSet0.fp_c8)._m0[13].z, _868);
    float _896 = fma(_850, (*spvDescriptorSet0.fp_c8)._m0[12].z, _886);
    float _898 = fma(_850, (*spvDescriptorSet0.fp_c8)._m0[13].z, _890);
    float _900 = fma(_850, (*spvDescriptorSet0.fp_c8)._m0[14].z, _892);
    float _902 = fma(_846, (*spvDescriptorSet0.fp_c8)._m0[13].w, _894);
    float _904 = 1.0 / _880;
    float _906 = fma(_820, (*spvDescriptorSet0.fp_c8)._m0[12].z, _866);
    float _908 = fma(_820, (*spvDescriptorSet0.fp_c8)._m0[14].z, _870);
    float _910 = fma(_862, (*spvDescriptorSet0.fp_c8)._m0[14].w, _900);
    float _912 = fma(_862, (*spvDescriptorSet0.fp_c8)._m0[13].w, _898);
    float _914 = fma(_846, (*spvDescriptorSet0.fp_c8)._m0[12].w, _906);
    float _916 = fma(_846, (*spvDescriptorSet0.fp_c8)._m0[14].w, _908);
    float _918 = fma(_862, (*spvDescriptorSet0.fp_c8)._m0[12].w, _896);
    float _920 = -_822;
    float _922 = fma(_902, _888, _920);
    float _924 = -_872;
    float _926 = fma(_914, _888, _924);
    float _928 = -_876;
    float _930 = fma(_916, _888, _928);
    float _932 = precise::min(_572, 120.0);
    float _934 = -_876;
    float _936 = fma(_910, _904, _934);
    float _938 = -_872;
    float _940 = fma(_918, _904, _938);
    float _942 = -_822;
    float _944 = fma(_912, _904, _942);
    float _946 = fma(_932, -0.01666666753590106964111328125, 2.0);
    float _948 = _936 * _926;
    float _950 = _944 * _930;
    float _952 = -_948;
    float _954 = fma(_940, _930, _952);
    float _956 = _940 * _922;
    float _958 = -_950;
    float _960 = fma(_936, _922, _958);
    float _962 = _954 * _954;
    float _964 = -_956;
    float _966 = fma(_944, _926, _964);
    float _968 = fma(_960, _960, _962);
    float _970 = fma(_966, _966, _968);
    float _972 = rsqrt(_970);
    float _974 = _954 * _972;
    float _976 = _960 * _972;
    float _978 = _966 * _972;
    float _980 = _974 * 0.82956135272979736328125;
    float _982 = fma(_976, 0.518475830554962158203125, _980);
    float _984 = fma(_978, 0.2073903381824493408203125, _982);
    float _986 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.4000000059604644775390625;
    float _988 = precise::max(_984, -1.0);
    float _990 = _986 * 0.15915493667125701904296875;
    float _992 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.23000000417232513427734375;
    float _994 = precise::min(_988, -0.5);
    float _996 = precise::min(_694, 500.0);
    float _998 = _992 * 0.15915493667125701904296875;
    float _1000 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.75;
    float _1002 = fma(_994, -0.800000011920928955078125, 0.199999988079071044921875);
    float _1004 = _990 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _996 * 0.00200000009499490261077880859375;
    float _1010 = _1000 * 0.15915493667125701904296875;
    float _1012 = _1008 * _1002;
    float _1014 = _998 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = _1012 * 7.0;
    float _1020 = floor(_1018);
    float _1022 = _1010 * 6.283185482025146484375;
    float _1024 = sin(_1022);
    float _1026 = _1006 + _1016;
    float _1028 = -_444;
    float _1030 = _1028 + 1.0;
    float _1032 = _444 * _638;
    float _1034 = _1030 * _1030;
    float _1036 = _1020 * 0.14285714924335479736328125;
    float _1038 = precise::clamp(_1036, 0.0, 1.0);
    float _1040 = -_1038;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1024, 0.25, _1026);
    float _1046 = _1042 * _946;
    float _1048 = _1044 * 0.001000000047497451305389404296875;
    float _1050 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _1052 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _1050;
    float _1054 = fma(_1046, -0.89999997615814208984375, 1.0);
    float _1056 = _1034 * _1034;
    float _1058 = fma(_632, _1032, _1048);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _1064 = _1062 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _1066 = -_1056;
    float _1068 = fma(_1066, _664, 1.0);
    float _1070 = _1060 * _1054;
    float _1072 = 1.0 / _1052;
    float _1074 = fma(_584, 1.75, 0.64999997615814208984375);
    float _1076 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _1078 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _1076;
    float _1080 = _1070 * _1068;
    float _1082 = _1080 * _1074;
    float _1084 = 1.0 / _1064;
    float _1086 = 0.0 + _1082;
    float _1088 = precise::clamp(_1086, 0.0, 1.0);
    float _1090 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _1092 = _1088 + _1090;
    float _1094 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _1096 = _1088 + _1094;
    bool _1098 = _1088 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _1100 = isnan(_1088);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = in.m_51.y;
    float _1112 = gl_FragCoord.w;
    float _1114 = _1110 * _1112;
    float _1116 = _1092 * _1072;
    float _1118 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _1120 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _1118;
    float _1122 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _1124 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _1122;
    float _1126 = _1096 * _1084;
    float _1128 = fma(_1120, _1116, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _1130 = fma(_1124, _1116, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _1132 = fma(_1078, _1116, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _1134 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _1136 = _1134 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _1138 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _1140 = _1138 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _1142 = _1088 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _1144 = isnan(_1088);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1108;
    float _1156 = _1154 + 1.0;
    float _1158 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _1160 = _1158 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _1162 = fma(_1140, _1126, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    bool _1164 = _1088 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _1166 = isnan(_1088);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1152 * _1156;
    float _1178 = in.m_51.x;
    float _1180 = gl_FragCoord.w;
    float _1182 = _1178 * _1180;
    float _1184 = in.m_51.z;
    float _1186 = gl_FragCoord.w;
    float _1188 = _1184 * _1186;
    float _1190 = -_1152;
    float _1192 = _1190 + 1.0;
    float _1194 = _1128 * _1176;
    float _1196 = precise::max(_97, 100.0);
    float _1198 = -_1174;
    float _1200 = _1198 + 1.0;
    float _1202 = _1130 * _1176;
    float _1204 = _1132 * _1176;
    float _1206 = fma(_1160, _1126, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _1208 = _1108 * _1200;
    float _1210 = fma(_1136, _1126, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _1212 = fma(_1192, (*spvDescriptorSet0.fp_c9)._m0[107].x, _1194);
    float _1214 = fma(_1192, (*spvDescriptorSet0.fp_c9)._m0[107].y, _1202);
    float _1216 = fma(_1192, (*spvDescriptorSet0.fp_c9)._m0[107].z, _1204);
    float _1218 = precise::min(_1196, 250.0);
    float _1220 = fma(_1206, _1208, _1212);
    float _1222 = fma(_1210, _1208, _1214);
    float _1224 = fma(_1162, _1208, _1216);
    float _1226 = _1048 + _1082;
    float _1228 = fma(_1174, (*spvDescriptorSet0.fp_c9)._m0[109].x, _1220);
    float _1230 = fma(_1174, (*spvDescriptorSet0.fp_c9)._m0[109].y, _1222);
    float _1232 = fma(_1174, (*spvDescriptorSet0.fp_c9)._m0[109].z, _1224);
    float _1234 = _1068 * _1226;
    float _1236 = precise::clamp(_1234, 0.0, 1.0);
    float _1238 = fma(_1228, (*spvDescriptorSet0.fp_c9)._m0[106].x, _1048);
    float _1240 = fma(_1230, (*spvDescriptorSet0.fp_c9)._m0[106].x, _1048);
    float _1242 = fma(_1232, (*spvDescriptorSet0.fp_c9)._m0[106].x, _1048);
    float _1244 = fma(_1218, 0.006666666828095912933349609375, -0.666666686534881591796875);
    float _1246 = _1068 * _1238;
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = _1068 * _1240;
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = _1068 * _1242;
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = _1236 * _1244;
    float _1260 = _89 * _1114;
    float _1262 = _89 * _1182;
    float _1264 = _89 * _1188;
    float _1266 = fma(_1260, _1258, _1252);
    float _1268 = fma(_1262, _1258, _1248);
    float _1270 = fma(_1264, _1258, _1256);
    float _1272 = _1202;
    float _1274 = _640;
    if (!_123)
    {
        out.m_54.x = _1268;
        out.m_54.y = _1266;
        out.m_54.z = _1270;
        out.m_54.w = _103;
        return out;
    }
    float _1276 = _1266 * 0.715200006961822509765625;
    float _1278 = in.m_56.w;
    float _1280 = gl_FragCoord.w;
    float _1282 = _1278 * _1280;
    float _1284 = in.m_56.x;
    float _1286 = gl_FragCoord.w;
    float _1288 = _1284 * _1286;
    float _1290 = in.m_56.y;
    float _1292 = gl_FragCoord.w;
    float _1294 = _1290 * _1292;
    float _1296 = fma(_1268, 0.2125999927520751953125, _1276);
    float _1298 = in.m_56.z;
    float _1300 = gl_FragCoord.w;
    float _1302 = _1298 * _1300;
    float _1304 = fma(_1270, 0.072200000286102294921875, _1296);
    bool _1306 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1308 = 1.0 / _1304;
    if (_1306)
    {
        _1272 = (*spvDescriptorSet0.fp_c8)._m0[30].z;
    }
    float _1310 = _1272;
    float _1312 = _1308 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    if (_1306)
    {
        float _1316 = -_1310;
        float _1318 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1320 = fma(_640, _1316, _1318);
        _1274 = _1320;
    }
    float _1322 = _1274;
    float _1324 = fma(_1314, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1326 = _89 * _1282;
    float _1328 = _1322;
    if (_1306)
    {
        float _1330 = _1322 * 8.0;
        float _1332 = precise::clamp(_1330, 0.0, 1.0);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _89 * _1294;
    float _1338 = _1324 * _1326;
    float _1340 = 0.0 + _111;
    float _1342 = precise::clamp(_1340, 0.0, 1.0);
    float _1344 = _89 * _1288;
    float _1346 = _89 * _1302;
    float _1348 = fma(_1266, _1338, _1336);
    float _1350 = _1342;
    if (_1306)
    {
        float _1352 = _1342 * _1334;
        _1350 = _1352;
    }
    float _1354 = _1350;
    float _1356 = fma(_1268, _1338, _1344);
    float _1358 = fma(_1270, _1338, _1346);
    float _1360 = 0.0 + _1354;
    float _1362 = precise::clamp(_1360, 0.0, 1.0);
    out.m_54.x = _1356;
    out.m_54.y = _1348;
    out.m_54.z = _1358;
    out.m_54.w = _1362;
    return out;
}

