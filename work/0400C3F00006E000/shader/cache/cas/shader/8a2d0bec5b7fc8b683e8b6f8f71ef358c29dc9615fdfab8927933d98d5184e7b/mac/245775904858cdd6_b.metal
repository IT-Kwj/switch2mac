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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _1736 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1736, float2(0.0), isnan(_1736)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _1751 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1751, float2(0.0), isnan(_1751)), int2(0), component::x).xzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = precise::max(_81, _83);
    float _97 = precise::max(_89, _91);
    float _99 = precise::min(_81, _83);
    float _101 = precise::min(_89, _91);
    float _103 = precise::max(_95, _97);
    float _105 = precise::min(_99, _101);
    float _107 = precise::max(_93, _103);
    float _109 = precise::min(_93, _105);
    float _111 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = -_109;
    float _115 = _107 + _113;
    float _117 = precise::max(_111, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _121 = _115 >= _117;
    bool _123 = isnan(_115);
    bool _125 = _121 || _123;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    int _132 = as_type<int>(_111);
    if (!_129)
    {
        _132 = 0;
    }
    int _134 = _132;
    bool _136 = !_129;
    int _138 = _134;
    if (!_136)
    {
        float2 _1830 = float2(_73, _75);
        float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1830, float2(0.0), isnan(_1830)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1830, float2(0.0), isnan(_1830)), int2(1, -1)).x;
        float2 _1841 = float2(_73, _75);
        float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1841, float2(0.0), isnan(_1841)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1841, float2(0.0), isnan(_1841)), int2(-1, 1)).x;
        float _144 = _91 + _81;
        float _146 = _89 + _83;
        float _148 = fma(_93, -2.0, _144);
        float _150 = fma(_93, -2.0, _146);
        float _152 = _81 + _140;
        float _154 = _91 + _140;
        float _156 = _81 + _142;
        float _158 = _91 + _142;
        float _160 = fma(_83, -2.0, _152);
        float _162 = fma(_91, -2.0, _154);
        float _164 = fma(_81, -2.0, _156);
        float _166 = fma(_89, -2.0, _158);
        float _168 = abs(_148);
        float _170 = abs(_160);
        float _172 = fma(_168, 2.0, _170);
        float _174 = abs(_150);
        float _176 = abs(_164);
        float _178 = fma(_174, 2.0, _176);
        float _180 = abs(_166);
        float _182 = _180 + _172;
        float _184 = abs(_162);
        float _186 = _184 + _178;
        bool _188 = _186 >= _182;
        float _190 = float(_188);
        bool _192 = _186 < _182;
        bool _194 = isnan(_186);
        bool _196 = _192 || _194;
        bool _198 = isnan(_182);
        bool _200 = _196 || _198;
        float _202 = float(_200);
        float _204 = _83 * _190;
        float _206 = _89 * _190;
        float _208 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _212 = fma(_81, _202, _204);
        float _214 = fma(_91, _202, _206);
        float _216 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].x, _208);
        float _218 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _220 = -_93;
        float _222 = _220 + _212;
        float _224 = -_93;
        float _226 = _224 + _214;
        float _228 = abs(_222);
        float _230 = abs(_226);
        bool _232 = _228 >= _230;
        float _234 = -_216;
        float _236 = _232 ? _234 : _216;
        float _238 = _236 * 0.5;
        float _240 = fma(_202, _238, _73);
        float _242 = fma(_190, _238, _75);
        float _244 = -_218;
        float _246 = _244 + _240;
        float _248 = -_210;
        float _250 = _248 + _242;
        float _252 = _218 + _240;
        float _254 = _210 + _242;
        float2 _2013 = float2(_246, _250);
        float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2013, float2(0.0), isnan(_2013))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2013, float2(0.0), isnan(_2013))).xyz;
        float _258 = _256.x;
        float _260 = _256.y;
        float _262 = _256.z;
        float2 _2027 = float2(_252, _254);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2027, float2(0.0), isnan(_2027))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2027, float2(0.0), isnan(_2027))).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float _272 = 1.0 / _115;
        float _274 = _146 + _144;
        float _276 = _154 + _156;
        float _278 = _232 ? _212 : _214;
        float _280 = abs(_222);
        float _282 = abs(_226);
        float _284 = _232 ? _280 : _282;
        float _286 = fma(_274, 2.0, _276);
        float _288 = fma(_286, -0.083333335816860198974609375, _93);
        float _290 = abs(_288);
        float _292 = _290 * _272;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = fma(_294, 6.0, -15.0);
        float _298 = _294 * _294;
        float _300 = fma(_294, _296, 10.0);
        float _302 = _300 * _298;
        float _304 = _294 * _302;
        float _306 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _308 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
        float _310 = _93 + _278;
        float _312 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _314 = _284 * 0.25;
        float _316 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
        float _318 = _310 * 0.5;
        float _320 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _312);
        float _322 = -_318;
        float _324 = _322 + _316;
        float _326 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _320);
        float _328 = abs(_324);
        bool _330 = _328 >= _314;
        float _332 = -_318;
        float _334 = _332 + _326;
        float _336 = abs(_334);
        bool _338 = _336 >= _314;
        bool _340 = !_338;
        int _342 = _340 ? 0 : 1;
        int _344 = as_type<int>(_308);
        float _346 = _324;
        float _348 = _246;
        float _350 = _250;
        int _352 = _342;
        float _354 = _252;
        float _356 = _254;
        float _358 = _334;
        float _360 = _144;
        int _362 = as_type<int>(_326);
        int _364 = _338 ? (-1) : 0;
        if (_330)
        {
            bool _366 = !_330;
            int _368 = _366 ? 0 : 1;
            _344 = _368;
        }
        int _370 = _344;
        int _372 = _370;
        if (!_330)
        {
            float _374 = -_218;
            float _376 = _374 + _246;
            float _378 = -_210;
            float _380 = _378 + _250;
            float2 _2189 = float2(_376, _380);
            float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2189, float2(0.0), isnan(_2189))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2189, float2(0.0), isnan(_2189))).xyz;
            float _384 = _382.x;
            float _386 = _382.y;
            float _388 = _382.z;
            float _390 = _386 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _392 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[2].x, _390);
            float _394 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[2].z, _392);
            float _396 = -_318;
            float _398 = _396 + _394;
            float _400 = abs(_398);
            bool _402 = _400 >= _314;
            bool _404 = !_402;
            int _406 = _404 ? 0 : 1;
            _372 = _406;
            _346 = _398;
            _348 = _376;
            _350 = _380;
        }
        int _408 = _372;
        float _410 = _346;
        float _412 = _348;
        float _414 = _350;
        int _416 = _408;
        float _418 = _412;
        float _420 = _414;
        if (!_338)
        {
            float _422 = _218 + _252;
            float _424 = _210 + _254;
            float2 _2252 = float2(_422, _424);
            float3 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2252, float2(0.0), isnan(_2252))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2252, float2(0.0), isnan(_2252))).xyz;
            float _428 = _426.x;
            float _430 = _426.y;
            float _432 = _426.z;
            float _434 = _430 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _436 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[2].x, _434);
            float _438 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[2].z, _436);
            float _440 = -_318;
            float _442 = _440 + _438;
            float _444 = abs(_442);
            bool _446 = _444 >= _314;
            bool _448 = !_446;
            int _450 = _448 ? 0 : 1;
            _352 = _450;
            _354 = _422;
            _356 = _424;
            _358 = _442;
        }
        int _452 = _352;
        float _454 = _354;
        float _456 = _356;
        float _458 = _358;
        int _460 = _408 & 1;
        bool _462 = _460 != 0;
        float _464 = _454;
        float _466 = _456;
        float _468 = _458;
        if (_462)
        {
            _360 = _410;
        }
        float _470 = _360;
        float _472 = _470;
        if (!_462)
        {
            float _474 = -_218;
            float _476 = _474 + _412;
            float _478 = -_210;
            float _480 = _478 + _414;
            float2 _2329 = float2(_476, _480);
            float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2329, float2(0.0), isnan(_2329))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2329, float2(0.0), isnan(_2329))).xyz;
            float _484 = _482.x;
            float _486 = _482.y;
            float _488 = _482.z;
            float _490 = _486 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _492 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[2].x, _490);
            float _494 = fma(_488, (*spvDescriptorSet0.fp_c3)._m0[2].z, _492);
            float _496 = -_318;
            float _498 = _496 + _494;
            float _500 = abs(_498);
            bool _502 = _500 >= _314;
            bool _504 = !_502;
            int _506 = _504 ? 0 : 1;
            _416 = _506;
            _418 = _476;
            _420 = _480;
            _472 = _498;
        }
        int _508 = _416;
        float _510 = _418;
        float _512 = _420;
        float _514 = _472;
        int _516 = _452 & 1;
        bool _518 = _516 != 0;
        int _520 = _508;
        float _522 = _510;
        float _524 = _512;
        float _526 = _514;
        if (_518)
        {
            _362 = _452;
        }
        int _528 = _362;
        int _530 = _528;
        if (!_518)
        {
            float _532 = _218 + _454;
            float _534 = _210 + _456;
            float2 _2403 = float2(_532, _534);
            float3 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2403, float2(0.0), isnan(_2403))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2403, float2(0.0), isnan(_2403))).xyz;
            float _538 = _536.x;
            float _540 = _536.y;
            float _542 = _536.z;
            float _544 = _540 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _546 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[2].x, _544);
            float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].z, _546);
            float _550 = -_318;
            float _552 = _550 + _548;
            float _554 = abs(_552);
            bool _556 = _554 >= _314;
            bool _558 = !_556;
            int _560 = _558 ? 0 : 1;
            _530 = _560;
            _464 = _532;
            _466 = _534;
            _468 = _552;
        }
        int _562 = _530;
        float _564 = _464;
        float _566 = _466;
        float _568 = _468;
        int _570 = _508 & 1;
        bool _572 = _570 != 0;
        int _574 = _562;
        float _576 = _564;
        float _578 = _566;
        float _580 = _568;
        if (!_572)
        {
            float _582 = -_218;
            float _584 = _582 + _510;
            float _586 = -_210;
            float _588 = _586 + _512;
            float2 _2475 = float2(_584, _588);
            float3 _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2475, float2(0.0), isnan(_2475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2475, float2(0.0), isnan(_2475))).xyz;
            float _592 = _590.x;
            float _594 = _590.y;
            float _596 = _590.z;
            float _598 = _594 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _600 = fma(_592, (*spvDescriptorSet0.fp_c3)._m0[2].x, _598);
            float _602 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[2].z, _600);
            float _604 = -_318;
            float _606 = _604 + _602;
            float _608 = abs(_606);
            bool _610 = _608 >= _314;
            bool _612 = !_610;
            int _614 = _612 ? 0 : 1;
            _520 = _614;
            _522 = _584;
            _524 = _588;
            _526 = _606;
        }
        int _616 = _520;
        float _618 = _522;
        float _620 = _524;
        float _622 = _526;
        int _624 = _562 & 1;
        bool _626 = _624 != 0;
        int _628 = _616;
        float _630 = _618;
        float _632 = _620;
        float _634 = _622;
        if (!_626)
        {
            float _636 = _218 + _564;
            float _638 = _210 + _566;
            float2 _2543 = float2(_636, _638);
            float3 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2543, float2(0.0), isnan(_2543))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2543, float2(0.0), isnan(_2543))).xyz;
            float _642 = _640.x;
            float _644 = _640.y;
            float _646 = _640.z;
            float _648 = _644 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _650 = fma(_642, (*spvDescriptorSet0.fp_c3)._m0[2].x, _648);
            float _652 = fma(_646, (*spvDescriptorSet0.fp_c3)._m0[2].z, _650);
            float _654 = -_318;
            float _656 = _654 + _652;
            float _658 = abs(_656);
            bool _660 = _658 >= _314;
            bool _662 = !_660;
            int _664 = _662 ? 0 : 1;
            _574 = _664;
            _576 = _636;
            _578 = _638;
            _580 = _656;
        }
        int _666 = _574;
        float _668 = _576;
        float _670 = _578;
        float _672 = _580;
        int _674 = _616 & 1;
        bool _676 = _674 != 0;
        int _678 = _666;
        float _680 = _668;
        float _682 = _670;
        float _684 = _672;
        if (!_676)
        {
            float _686 = -_218;
            float _688 = _686 + _618;
            float _690 = -_210;
            float _692 = _690 + _620;
            float2 _2615 = float2(_688, _692);
            float3 _694 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2615, float2(0.0), isnan(_2615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2615, float2(0.0), isnan(_2615))).xyz;
            float _696 = _694.x;
            float _698 = _694.y;
            float _700 = _694.z;
            float _702 = _698 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _704 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[2].x, _702);
            float _706 = fma(_700, (*spvDescriptorSet0.fp_c3)._m0[2].z, _704);
            float _708 = -_318;
            float _710 = _708 + _706;
            float _712 = abs(_710);
            bool _714 = _712 >= _314;
            bool _716 = !_714;
            int _718 = _716 ? 0 : 1;
            _628 = _718;
            _630 = _688;
            _632 = _692;
            _634 = _710;
        }
        int _720 = _628;
        float _722 = _630;
        float _724 = _632;
        float _726 = _634;
        int _728 = _666 & 1;
        bool _730 = _728 != 0;
        int _732 = _720;
        float _734 = _722;
        float _736 = _724;
        float _738 = _726;
        if (!_730)
        {
            float _740 = _218 + _668;
            float _742 = _210 + _670;
            float2 _2683 = float2(_740, _742);
            float3 _744 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2683, float2(0.0), isnan(_2683))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2683, float2(0.0), isnan(_2683))).xyz;
            float _746 = _744.x;
            float _748 = _744.y;
            float _750 = _744.z;
            float _752 = _748 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _754 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[2].x, _752);
            float _756 = fma(_750, (*spvDescriptorSet0.fp_c3)._m0[2].z, _754);
            float _758 = -_318;
            float _760 = _758 + _756;
            float _762 = abs(_760);
            bool _764 = _762 >= _314;
            bool _766 = !_764;
            int _768 = _766 ? 0 : 1;
            _678 = _768;
            _680 = _740;
            _682 = _742;
            _684 = _760;
        }
        int _770 = _678;
        float _772 = _680;
        float _774 = _682;
        float _776 = _684;
        int _778 = _720 & 1;
        bool _780 = _778 != 0;
        int _782 = _770;
        float _784 = _772;
        float _786 = _774;
        float _788 = _776;
        if (!_780)
        {
            float _790 = -_218;
            float _792 = _790 + _722;
            float _794 = -_210;
            float _796 = _794 + _724;
            float2 _2755 = float2(_792, _796);
            float3 _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2755, float2(0.0), isnan(_2755))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2755, float2(0.0), isnan(_2755))).xyz;
            float _800 = _798.x;
            float _802 = _798.y;
            float _804 = _798.z;
            float _806 = _802 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _808 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[2].x, _806);
            float _810 = fma(_804, (*spvDescriptorSet0.fp_c3)._m0[2].z, _808);
            float _812 = -_318;
            float _814 = _812 + _810;
            float _816 = abs(_814);
            bool _818 = _816 >= _314;
            bool _820 = !_818;
            int _822 = _820 ? 0 : 1;
            _732 = _822;
            _734 = _792;
            _736 = _796;
            _738 = _814;
        }
        int _824 = _732;
        float _826 = _734;
        float _828 = _736;
        float _830 = _738;
        int _832 = _770 & 1;
        bool _834 = _832 != 0;
        int _836 = _824;
        float _838 = _826;
        float _840 = _828;
        float _842 = _830;
        if (!_834)
        {
            float _844 = _218 + _772;
            float _846 = _210 + _774;
            float2 _2823 = float2(_844, _846);
            float3 _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2823, float2(0.0), isnan(_2823))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2823, float2(0.0), isnan(_2823))).xyz;
            float _850 = _848.x;
            float _852 = _848.y;
            float _854 = _848.z;
            float _856 = _852 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _858 = fma(_850, (*spvDescriptorSet0.fp_c3)._m0[2].x, _856);
            float _860 = fma(_854, (*spvDescriptorSet0.fp_c3)._m0[2].z, _858);
            float _862 = -_318;
            float _864 = _862 + _860;
            float _866 = abs(_864);
            bool _868 = _866 >= _314;
            bool _870 = !_868;
            int _872 = _870 ? 0 : 1;
            _782 = _872;
            _784 = _844;
            _786 = _846;
            _788 = _864;
        }
        int _874 = _782;
        float _876 = _784;
        float _878 = _786;
        float _880 = _788;
        int _882 = _824 & 1;
        bool _884 = _882 != 0;
        int _886 = _874;
        float _888 = _876;
        float _890 = _878;
        float _892 = _880;
        if (!_884)
        {
            float _894 = fma(_218, -1.5, _826);
            float _896 = fma(_210, -1.5, _828);
            float2 _2892 = float2(_894, _896);
            float3 _898 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2892, float2(0.0), isnan(_2892))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2892, float2(0.0), isnan(_2892))).xyz;
            float _900 = _898.x;
            float _902 = _898.y;
            float _904 = _898.z;
            float _906 = _902 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _908 = fma(_900, (*spvDescriptorSet0.fp_c3)._m0[2].x, _906);
            float _910 = fma(_904, (*spvDescriptorSet0.fp_c3)._m0[2].z, _908);
            float _912 = -_318;
            float _914 = _912 + _910;
            float _916 = abs(_914);
            bool _918 = _916 >= _314;
            bool _920 = !_918;
            int _922 = _920 ? 0 : 1;
            _836 = _922;
            _838 = _894;
            _840 = _896;
            _842 = _914;
        }
        int _924 = _836;
        float _926 = _838;
        float _928 = _840;
        float _930 = _842;
        int _932 = _874 & 1;
        bool _934 = _932 != 0;
        int _936 = _924;
        float _938 = _926;
        float _940 = _928;
        float _942 = _930;
        if (!_934)
        {
            float _944 = fma(_218, 1.5, _876);
            float _946 = fma(_210, 1.5, _878);
            float2 _2961 = float2(_944, _946);
            float3 _948 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2961, float2(0.0), isnan(_2961))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2961, float2(0.0), isnan(_2961))).xyz;
            float _950 = _948.x;
            float _952 = _948.y;
            float _954 = _948.z;
            float _956 = _952 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _958 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[2].x, _956);
            float _960 = fma(_954, (*spvDescriptorSet0.fp_c3)._m0[2].z, _958);
            float _962 = -_318;
            float _964 = _962 + _960;
            float _966 = abs(_964);
            bool _968 = _966 >= _314;
            bool _970 = !_968;
            int _972 = _970 ? 0 : 1;
            _886 = _972;
            _888 = _944;
            _890 = _946;
            _892 = _964;
        }
        int _974 = _886;
        float _976 = _888;
        float _978 = _890;
        float _980 = _892;
        int _982 = _924 & 1;
        bool _984 = _982 != 0;
        int _986 = _974;
        float _988 = _976;
        float _990 = _978;
        float _992 = _980;
        if (!_984)
        {
            float _994 = fma(_218, -2.0, _926);
            float _996 = fma(_210, -2.0, _928);
            float2 _3029 = float2(_994, _996);
            float3 _998 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3029, float2(0.0), isnan(_3029))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3029, float2(0.0), isnan(_3029))).xyz;
            float _1000 = _998.x;
            float _1002 = _998.y;
            float _1004 = _998.z;
            float _1006 = _1002 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1008 = fma(_1000, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1006);
            float _1010 = fma(_1004, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1008);
            float _1012 = -_318;
            float _1014 = _1012 + _1010;
            float _1016 = abs(_1014);
            bool _1018 = _1016 >= _314;
            bool _1020 = !_1018;
            int _1022 = _1020 ? 0 : 1;
            _936 = _1022;
            _938 = _994;
            _940 = _996;
            _942 = _1014;
        }
        int _1024 = _936;
        float _1026 = _938;
        float _1028 = _940;
        float _1030 = _942;
        int _1032 = _974 & 1;
        bool _1034 = _1032 != 0;
        int _1036 = _1024;
        float _1038 = _1026;
        float _1040 = _1028;
        float _1042 = _1030;
        if (!_1034)
        {
            float _1044 = fma(_218, 2.0, _976);
            float _1046 = fma(_210, 2.0, _978);
            float2 _3097 = float2(_1044, _1046);
            float3 _1048 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3097, float2(0.0), isnan(_3097))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3097, float2(0.0), isnan(_3097))).xyz;
            float _1050 = _1048.x;
            float _1052 = _1048.y;
            float _1054 = _1048.z;
            float _1056 = _1052 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1058 = fma(_1050, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1056);
            float _1060 = fma(_1054, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1058);
            float _1062 = -_318;
            float _1064 = _1062 + _1060;
            float _1066 = abs(_1064);
            bool _1068 = _1066 >= _314;
            bool _1070 = !_1068;
            int _1072 = _1070 ? 0 : 1;
            _986 = _1072;
            _988 = _1044;
            _990 = _1046;
            _992 = _1064;
        }
        int _1074 = _986;
        float _1076 = _988;
        float _1078 = _990;
        float _1080 = _992;
        int _1082 = _1024 & 1;
        bool _1084 = _1082 != 0;
        int _1086 = _1074;
        float _1088 = _1076;
        float _1090 = _1078;
        float _1092 = _1080;
        if (!_1084)
        {
            float _1094 = fma(_218, -2.0, _1026);
            float _1096 = fma(_210, -2.0, _1028);
            float2 _3165 = float2(_1094, _1096);
            float3 _1098 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3165, float2(0.0), isnan(_3165))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3165, float2(0.0), isnan(_3165))).xyz;
            float _1100 = _1098.x;
            float _1102 = _1098.y;
            float _1104 = _1098.z;
            float _1106 = _1102 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1108 = fma(_1100, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1106);
            float _1110 = fma(_1104, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1108);
            float _1112 = -_318;
            float _1114 = _1112 + _1110;
            float _1116 = abs(_1114);
            bool _1118 = _1116 >= _314;
            bool _1120 = !_1118;
            int _1122 = _1120 ? 0 : 1;
            _1036 = _1122;
            _1038 = _1094;
            _1040 = _1096;
            _1042 = _1114;
        }
        int _1124 = _1036;
        float _1126 = _1038;
        float _1128 = _1040;
        float _1130 = _1042;
        int _1132 = _1074 & 1;
        bool _1134 = _1132 != 0;
        int _1136 = _1124;
        float _1138 = _1126;
        float _1140 = _1128;
        float _1142 = _1130;
        if (!_1134)
        {
            float _1144 = fma(_218, 2.0, _1076);
            float _1146 = fma(_210, 2.0, _1078);
            float2 _3233 = float2(_1144, _1146);
            float3 _1148 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3233, float2(0.0), isnan(_3233))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3233, float2(0.0), isnan(_3233))).xyz;
            float _1150 = _1148.x;
            float _1152 = _1148.y;
            float _1154 = _1148.z;
            float _1156 = _1152 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1158 = fma(_1150, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1156);
            float _1160 = fma(_1154, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1158);
            float _1162 = -_318;
            float _1164 = _1162 + _1160;
            float _1166 = abs(_1164);
            bool _1168 = _1166 >= _314;
            bool _1170 = !_1168;
            int _1172 = _1170 ? 0 : 1;
            _1086 = _1172;
            _1088 = _1144;
            _1090 = _1146;
            _1092 = _1164;
        }
        int _1174 = _1086;
        float _1176 = _1088;
        float _1178 = _1090;
        float _1180 = _1092;
        int _1182 = _1124 & 1;
        bool _1184 = _1182 != 0;
        int _1186 = _1174;
        float _1188 = _1176;
        float _1190 = _1178;
        float _1192 = _1180;
        if (!_1184)
        {
            float _1194 = fma(_218, -2.0, _1126);
            float _1196 = fma(_210, -2.0, _1128);
            float2 _3301 = float2(_1194, _1196);
            float3 _1198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3301, float2(0.0), isnan(_3301))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3301, float2(0.0), isnan(_3301))).xyz;
            float _1200 = _1198.x;
            float _1202 = _1198.y;
            float _1204 = _1198.z;
            float _1206 = _1202 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1208 = fma(_1200, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1206);
            float _1210 = fma(_1204, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1208);
            float _1212 = -_318;
            float _1214 = _1212 + _1210;
            float _1216 = abs(_1214);
            bool _1218 = _1216 >= _314;
            bool _1220 = !_1218;
            int _1222 = _1220 ? 0 : 1;
            _1136 = _1222;
            _1138 = _1194;
            _1140 = _1196;
            _1142 = _1214;
        }
        int _1224 = _1136;
        float _1226 = _1138;
        float _1228 = _1140;
        float _1230 = _1142;
        int _1232 = _1174 & 1;
        bool _1234 = _1232 != 0;
        int _1236 = _1224;
        float _1238 = _1226;
        float _1240 = _1228;
        float _1242 = _1230;
        if (!_1234)
        {
            float _1244 = fma(_218, 2.0, _1176);
            float _1246 = fma(_210, 2.0, _1178);
            float2 _3369 = float2(_1244, _1246);
            float3 _1248 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3369, float2(0.0), isnan(_3369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3369, float2(0.0), isnan(_3369))).xyz;
            float _1250 = _1248.x;
            float _1252 = _1248.y;
            float _1254 = _1248.z;
            float _1256 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1258 = fma(_1250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1256);
            float _1260 = fma(_1254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1258);
            float _1262 = -_318;
            float _1264 = _1262 + _1260;
            float _1266 = abs(_1264);
            bool _1268 = _1266 >= _314;
            bool _1270 = !_1268;
            int _1272 = _1270 ? 0 : 1;
            _1186 = _1272;
            _1188 = _1244;
            _1190 = _1246;
            _1192 = _1264;
        }
        int _1274 = _1186;
        float _1276 = _1188;
        float _1278 = _1190;
        float _1280 = _1192;
        int _1282 = _1224 & 1;
        bool _1284 = _1282 != 0;
        int _1286 = _1274;
        float _1288 = _1276;
        float _1290 = _1278;
        float _1292 = _1280;
        if (!_1284)
        {
            float _1294 = fma(_218, -2.0, _1226);
            float _1296 = fma(_210, -2.0, _1228);
            float2 _3437 = float2(_1294, _1296);
            float3 _1298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3437, float2(0.0), isnan(_3437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3437, float2(0.0), isnan(_3437))).xyz;
            float _1300 = _1298.x;
            float _1302 = _1298.y;
            float _1304 = _1298.z;
            float _1306 = _1302 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1308 = fma(_1300, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1306);
            float _1310 = fma(_1304, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1308);
            float _1312 = -_318;
            float _1314 = _1312 + _1310;
            float _1316 = abs(_1314);
            bool _1318 = _1316 >= _314;
            bool _1320 = !_1318;
            int _1322 = _1320 ? 0 : 1;
            _1236 = _1322;
            _1238 = _1294;
            _1240 = _1296;
            _1242 = _1314;
        }
        int _1324 = _1236;
        float _1326 = _1238;
        float _1328 = _1240;
        float _1330 = _1242;
        int _1332 = _1274 & 1;
        bool _1334 = _1332 != 0;
        int _1336 = _1324;
        float _1338 = _1330;
        float _1340 = _1326;
        float _1342 = _1328;
        if (!_1334)
        {
            float _1344 = fma(_218, 2.0, _1276);
            float _1346 = fma(_210, 2.0, _1278);
            float2 _3505 = float2(_1344, _1346);
            float3 _1348 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3505, float2(0.0), isnan(_3505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3505, float2(0.0), isnan(_3505))).xyz;
            float _1350 = _1348.x;
            float _1352 = _1348.y;
            float _1354 = _1348.z;
            float _1356 = _1352 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1358 = fma(_1350, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1356);
            float _1360 = fma(_1354, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1358);
            float _1362 = -_318;
            float _1364 = _1362 + _1360;
            float _1366 = abs(_1364);
            bool _1368 = _1366 >= _314;
            bool _1370 = !_1368;
            int _1372 = _1370 ? 0 : 1;
            _1286 = _1372;
            _1288 = _1344;
            _1290 = _1346;
            _1292 = _1364;
        }
        int _1374 = _1286;
        float _1376 = _1288;
        float _1378 = _1290;
        float _1380 = _1292;
        int _1382 = _1324 & 1;
        bool _1384 = _1382 != 0;
        int _1386 = _1374;
        float _1388 = _1380;
        float _1390 = _1376;
        float _1392 = _1378;
        if (!_1384)
        {
            float _1394 = fma(_218, -4.0, _1326);
            float _1396 = fma(_210, -4.0, _1328);
            float2 _3574 = float2(_1394, _1396);
            float3 _1398 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3574, float2(0.0), isnan(_3574))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3574, float2(0.0), isnan(_3574))).xyz;
            float _1400 = _1398.x;
            float _1402 = _1398.y;
            float _1404 = _1398.z;
            float _1406 = _1402 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1408 = fma(_1400, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1406);
            float _1410 = fma(_1404, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1408);
            float _1412 = -_318;
            float _1414 = _1412 + _1410;
            float _1416 = abs(_1414);
            bool _1418 = _1416 >= _314;
            bool _1420 = !_1418;
            int _1422 = _1420 ? 0 : 1;
            _1336 = _1422;
            _1338 = _1414;
            _1340 = _1394;
            _1342 = _1396;
        }
        int _1424 = _1336;
        float _1426 = _1338;
        float _1428 = _1340;
        float _1430 = _1342;
        int _1432 = _1374 & 1;
        bool _1434 = _1432 != 0;
        float _1436 = _1430;
        float _1438 = _1428;
        if (!_1434)
        {
            float _1440 = fma(_218, 4.0, _1376);
            float _1442 = fma(_210, 4.0, _1378);
            float2 _3641 = float2(_1440, _1442);
            float3 _1444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3641, float2(0.0), isnan(_3641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3641, float2(0.0), isnan(_3641))).xyz;
            float _1446 = _1444.x;
            float _1448 = _1444.y;
            float _1450 = _1444.z;
            float _1452 = _1448 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1454 = fma(_1446, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1452);
            float _1456 = fma(_1450, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1454);
            float _1458 = -_318;
            float _1460 = _1458 + _1456;
            float _1462 = abs(_1460);
            bool _1464 = _1462 >= _314;
            bool _1466 = !_1464;
            int _1468 = _1466 ? 0 : 1;
            _1386 = _1468;
            _1388 = _1460;
            _1390 = _1440;
            _1392 = _1442;
        }
        int _1470 = _1386;
        float _1472 = _1388;
        float _1474 = _1390;
        float _1476 = _1392;
        int _1478 = _1424 & 1;
        bool _1480 = _1478 != 0;
        int _1482 = _1480 ? (-1) : 0;
        float _1484 = _1476;
        float _1486 = _1474;
        if (_1480)
        {
            bool _1488 = _1426 >= 0.0;
            bool _1490 = isnan(_1426);
            bool _1492 = _1488 || _1490;
            bool _1494 = isnan(0.0);
            bool _1496 = _1492 || _1494;
            _364 = _1496 ? (-1) : 0;
        }
        int _1498 = _364;
        int _1500 = _1498;
        if (!_1480)
        {
            float _1502 = fma(_218, -8.0, _1428);
            float _1504 = fma(_210, -8.0, _1430);
            float2 _3728 = float2(_1502, _1504);
            float3 _1506 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3728, float2(0.0), isnan(_3728))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3728, float2(0.0), isnan(_3728))).xyz;
            float _1508 = _1506.x;
            float _1510 = _1506.y;
            float _1512 = _1506.z;
            float _1514 = _1510 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1516 = fma(_1508, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1514);
            float _1518 = fma(_1512, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1516);
            float _1520 = -_318;
            float _1522 = _1520 + _1518;
            bool _1524 = _1522 >= 0.0;
            bool _1526 = isnan(_1522);
            bool _1528 = _1524 || _1526;
            bool _1530 = isnan(0.0);
            bool _1532 = _1528 || _1530;
            _1436 = _1504;
            _1438 = _1502;
            _1500 = _1532 ? (-1) : 0;
        }
        float _1534 = _1436;
        float _1536 = _1438;
        int _1538 = _1500;
        int _1540 = _1470 & 1;
        bool _1542 = _1540 != 0;
        if (_1542)
        {
            bool _1544 = _1472 >= 0.0;
            bool _1546 = isnan(_1472);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan(0.0);
            bool _1552 = _1548 || _1550;
            _1482 = _1552 ? (-1) : 0;
        }
        int _1554 = _1482;
        int _1556 = _1554;
        if (!_1542)
        {
            float _1558 = fma(_218, 8.0, _1474);
            float _1560 = fma(_210, 8.0, _1476);
            float2 _3812 = float2(_1558, _1560);
            float3 _1562 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3812, float2(0.0), isnan(_3812))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3812, float2(0.0), isnan(_3812))).xyz;
            float _1564 = _1562.x;
            float _1566 = _1562.y;
            float _1568 = _1562.z;
            float _1570 = _1566 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1572 = fma(_1564, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1570);
            float _1574 = fma(_1568, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1572);
            float _1576 = -_318;
            float _1578 = _1576 + _1574;
            bool _1580 = _1578 >= 0.0;
            bool _1582 = isnan(_1578);
            bool _1584 = _1580 || _1582;
            bool _1586 = isnan(0.0);
            bool _1588 = _1584 || _1586;
            _1484 = _1560;
            _1486 = _1558;
            _1556 = _1588 ? (-1) : 0;
        }
        float _1590 = _1484;
        float _1592 = _1486;
        int _1594 = _1556;
        float _1596 = -_1534;
        float _1598 = _75 + _1596;
        float _1600 = -_75;
        float _1602 = _1600 + _1590;
        float _1604 = -_1536;
        float _1606 = _73 + _1604;
        float _1608 = -_73;
        float _1610 = _1608 + _1592;
        float _1612 = _202 * _1598;
        float _1614 = _202 * _1602;
        float _1616 = _218 + _210;
        float _1618 = _304 * 0.75;
        float _1620 = fma(_190, _1606, _1612);
        float _1622 = fma(_190, _1610, _1614);
        float _1624 = 1.0 / _1616;
        float _1626 = _1620 + _1622;
        bool _1628 = _1620 < _1622;
        int _1630 = ~_1538;
        int _1632 = (_1628 ? (-1) : 0) & _1630;
        bool _1634 = _1620 >= _1622;
        bool _1636 = isnan(_1620);
        bool _1638 = _1634 || _1636;
        bool _1640 = isnan(_1622);
        bool _1642 = _1638 || _1640;
        int _1644 = ~_1594;
        int _1646 = (_1642 ? (-1) : 0) & _1644;
        float _1648 = precise::min(_1620, _1622);
        float _1650 = 1.0 / _1626;
        int _1652 = ~_1632;
        int _1654 = _1652 & _1646;
        int _1656 = ~_1646;
        int _1658 = _1632 & _1656;
        int _1660 = _1654 | _1658;
        int _1662 = _1632 & _1646;
        int _1664 = _1660 | _1662;
        bool _1666 = _93 < _318;
        int _1668 = (_1666 ? (-1) : 0) ^ _1664;
        float _1670 = -_1648;
        float _1672 = fma(_1670, _1650, 0.5);
        float _1674 = (_1668 != 0) ? _1672 : 0.0;
        float _1676 = precise::max(_1618, _1674);
        float _1678 = _236 * _1676;
        float _1680 = _1678 * _1624;
        _138 = as_type<int>(_1680);
    }
    int _1682 = _138;
    out.m_34.x = as_type<float>(_1682);
    out.m_34.y = as_type<float>(_1682);
    out.m_34.z = as_type<float>(_1682);
    out.m_34.w = as_type<float>(_1682);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _1736 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1736, float2(0.0), isnan(_1736)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _1751 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1751, float2(0.0), isnan(_1751)), int2(0), component::x).xzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = precise::max(_81, _83);
    float _97 = precise::max(_89, _91);
    float _99 = precise::min(_81, _83);
    float _101 = precise::min(_89, _91);
    float _103 = precise::max(_95, _97);
    float _105 = precise::min(_99, _101);
    float _107 = precise::max(_93, _103);
    float _109 = precise::min(_93, _105);
    float _111 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = -_109;
    float _115 = _107 + _113;
    float _117 = precise::max(_111, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _121 = _115 >= _117;
    bool _123 = isnan(_115);
    bool _125 = _121 || _123;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    int _132 = as_type<int>(_111);
    if (!_129)
    {
        _132 = 0;
    }
    int _134 = _132;
    bool _136 = !_129;
    int _138 = _134;
    if (!_136)
    {
        float2 _1830 = float2(_73, _75);
        float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1830, float2(0.0), isnan(_1830)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1830, float2(0.0), isnan(_1830)), int2(1, -1)).x;
        float2 _1841 = float2(_73, _75);
        float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1841, float2(0.0), isnan(_1841)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1841, float2(0.0), isnan(_1841)), int2(-1, 1)).x;
        float _144 = _91 + _81;
        float _146 = _89 + _83;
        float _148 = fma(_93, -2.0, _144);
        float _150 = fma(_93, -2.0, _146);
        float _152 = _81 + _140;
        float _154 = _91 + _140;
        float _156 = _81 + _142;
        float _158 = _91 + _142;
        float _160 = fma(_83, -2.0, _152);
        float _162 = fma(_91, -2.0, _154);
        float _164 = fma(_81, -2.0, _156);
        float _166 = fma(_89, -2.0, _158);
        float _168 = abs(_148);
        float _170 = abs(_160);
        float _172 = fma(_168, 2.0, _170);
        float _174 = abs(_150);
        float _176 = abs(_164);
        float _178 = fma(_174, 2.0, _176);
        float _180 = abs(_166);
        float _182 = _180 + _172;
        float _184 = abs(_162);
        float _186 = _184 + _178;
        bool _188 = _186 >= _182;
        float _190 = float(_188);
        bool _192 = _186 < _182;
        bool _194 = isnan(_186);
        bool _196 = _192 || _194;
        bool _198 = isnan(_182);
        bool _200 = _196 || _198;
        float _202 = float(_200);
        float _204 = _83 * _190;
        float _206 = _89 * _190;
        float _208 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _212 = fma(_81, _202, _204);
        float _214 = fma(_91, _202, _206);
        float _216 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].x, _208);
        float _218 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _220 = -_93;
        float _222 = _220 + _212;
        float _224 = -_93;
        float _226 = _224 + _214;
        float _228 = abs(_222);
        float _230 = abs(_226);
        bool _232 = _228 >= _230;
        float _234 = -_216;
        float _236 = _232 ? _234 : _216;
        float _238 = _236 * 0.5;
        float _240 = fma(_202, _238, _73);
        float _242 = fma(_190, _238, _75);
        float _244 = -_218;
        float _246 = _244 + _240;
        float _248 = -_210;
        float _250 = _248 + _242;
        float _252 = _218 + _240;
        float _254 = _210 + _242;
        float2 _2013 = float2(_246, _250);
        float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2013, float2(0.0), isnan(_2013))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2013, float2(0.0), isnan(_2013))).xyz;
        float _258 = _256.x;
        float _260 = _256.y;
        float _262 = _256.z;
        float2 _2027 = float2(_252, _254);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2027, float2(0.0), isnan(_2027))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2027, float2(0.0), isnan(_2027))).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float _272 = 1.0 / _115;
        float _274 = _146 + _144;
        float _276 = _154 + _156;
        float _278 = _232 ? _212 : _214;
        float _280 = abs(_222);
        float _282 = abs(_226);
        float _284 = _232 ? _280 : _282;
        float _286 = fma(_274, 2.0, _276);
        float _288 = fma(_286, -0.083333335816860198974609375, _93);
        float _290 = abs(_288);
        float _292 = _290 * _272;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = fma(_294, 6.0, -15.0);
        float _298 = _294 * _294;
        float _300 = fma(_294, _296, 10.0);
        float _302 = _300 * _298;
        float _304 = _294 * _302;
        float _306 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _308 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
        float _310 = _93 + _278;
        float _312 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _314 = _284 * 0.25;
        float _316 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
        float _318 = _310 * 0.5;
        float _320 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _312);
        float _322 = -_318;
        float _324 = _322 + _316;
        float _326 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _320);
        float _328 = abs(_324);
        bool _330 = _328 >= _314;
        float _332 = -_318;
        float _334 = _332 + _326;
        float _336 = abs(_334);
        bool _338 = _336 >= _314;
        bool _340 = !_338;
        int _342 = _340 ? 0 : 1;
        int _344 = as_type<int>(_308);
        float _346 = _324;
        float _348 = _246;
        float _350 = _250;
        int _352 = _342;
        float _354 = _252;
        float _356 = _254;
        float _358 = _334;
        float _360 = _144;
        int _362 = as_type<int>(_326);
        int _364 = _338 ? (-1) : 0;
        if (_330)
        {
            bool _366 = !_330;
            int _368 = _366 ? 0 : 1;
            _344 = _368;
        }
        int _370 = _344;
        int _372 = _370;
        if (!_330)
        {
            float _374 = -_218;
            float _376 = _374 + _246;
            float _378 = -_210;
            float _380 = _378 + _250;
            float2 _2189 = float2(_376, _380);
            float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2189, float2(0.0), isnan(_2189))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2189, float2(0.0), isnan(_2189))).xyz;
            float _384 = _382.x;
            float _386 = _382.y;
            float _388 = _382.z;
            float _390 = _386 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _392 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[2].x, _390);
            float _394 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[2].z, _392);
            float _396 = -_318;
            float _398 = _396 + _394;
            float _400 = abs(_398);
            bool _402 = _400 >= _314;
            bool _404 = !_402;
            int _406 = _404 ? 0 : 1;
            _372 = _406;
            _346 = _398;
            _348 = _376;
            _350 = _380;
        }
        int _408 = _372;
        float _410 = _346;
        float _412 = _348;
        float _414 = _350;
        int _416 = _408;
        float _418 = _412;
        float _420 = _414;
        if (!_338)
        {
            float _422 = _218 + _252;
            float _424 = _210 + _254;
            float2 _2252 = float2(_422, _424);
            float3 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2252, float2(0.0), isnan(_2252))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2252, float2(0.0), isnan(_2252))).xyz;
            float _428 = _426.x;
            float _430 = _426.y;
            float _432 = _426.z;
            float _434 = _430 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _436 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[2].x, _434);
            float _438 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[2].z, _436);
            float _440 = -_318;
            float _442 = _440 + _438;
            float _444 = abs(_442);
            bool _446 = _444 >= _314;
            bool _448 = !_446;
            int _450 = _448 ? 0 : 1;
            _352 = _450;
            _354 = _422;
            _356 = _424;
            _358 = _442;
        }
        int _452 = _352;
        float _454 = _354;
        float _456 = _356;
        float _458 = _358;
        int _460 = _408 & 1;
        bool _462 = _460 != 0;
        float _464 = _454;
        float _466 = _456;
        float _468 = _458;
        if (_462)
        {
            _360 = _410;
        }
        float _470 = _360;
        float _472 = _470;
        if (!_462)
        {
            float _474 = -_218;
            float _476 = _474 + _412;
            float _478 = -_210;
            float _480 = _478 + _414;
            float2 _2329 = float2(_476, _480);
            float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2329, float2(0.0), isnan(_2329))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2329, float2(0.0), isnan(_2329))).xyz;
            float _484 = _482.x;
            float _486 = _482.y;
            float _488 = _482.z;
            float _490 = _486 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _492 = fma(_484, (*spvDescriptorSet0.fp_c3)._m0[2].x, _490);
            float _494 = fma(_488, (*spvDescriptorSet0.fp_c3)._m0[2].z, _492);
            float _496 = -_318;
            float _498 = _496 + _494;
            float _500 = abs(_498);
            bool _502 = _500 >= _314;
            bool _504 = !_502;
            int _506 = _504 ? 0 : 1;
            _416 = _506;
            _418 = _476;
            _420 = _480;
            _472 = _498;
        }
        int _508 = _416;
        float _510 = _418;
        float _512 = _420;
        float _514 = _472;
        int _516 = _452 & 1;
        bool _518 = _516 != 0;
        int _520 = _508;
        float _522 = _510;
        float _524 = _512;
        float _526 = _514;
        if (_518)
        {
            _362 = _452;
        }
        int _528 = _362;
        int _530 = _528;
        if (!_518)
        {
            float _532 = _218 + _454;
            float _534 = _210 + _456;
            float2 _2403 = float2(_532, _534);
            float3 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2403, float2(0.0), isnan(_2403))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2403, float2(0.0), isnan(_2403))).xyz;
            float _538 = _536.x;
            float _540 = _536.y;
            float _542 = _536.z;
            float _544 = _540 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _546 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[2].x, _544);
            float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].z, _546);
            float _550 = -_318;
            float _552 = _550 + _548;
            float _554 = abs(_552);
            bool _556 = _554 >= _314;
            bool _558 = !_556;
            int _560 = _558 ? 0 : 1;
            _530 = _560;
            _464 = _532;
            _466 = _534;
            _468 = _552;
        }
        int _562 = _530;
        float _564 = _464;
        float _566 = _466;
        float _568 = _468;
        int _570 = _508 & 1;
        bool _572 = _570 != 0;
        int _574 = _562;
        float _576 = _564;
        float _578 = _566;
        float _580 = _568;
        if (!_572)
        {
            float _582 = -_218;
            float _584 = _582 + _510;
            float _586 = -_210;
            float _588 = _586 + _512;
            float2 _2475 = float2(_584, _588);
            float3 _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2475, float2(0.0), isnan(_2475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2475, float2(0.0), isnan(_2475))).xyz;
            float _592 = _590.x;
            float _594 = _590.y;
            float _596 = _590.z;
            float _598 = _594 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _600 = fma(_592, (*spvDescriptorSet0.fp_c3)._m0[2].x, _598);
            float _602 = fma(_596, (*spvDescriptorSet0.fp_c3)._m0[2].z, _600);
            float _604 = -_318;
            float _606 = _604 + _602;
            float _608 = abs(_606);
            bool _610 = _608 >= _314;
            bool _612 = !_610;
            int _614 = _612 ? 0 : 1;
            _520 = _614;
            _522 = _584;
            _524 = _588;
            _526 = _606;
        }
        int _616 = _520;
        float _618 = _522;
        float _620 = _524;
        float _622 = _526;
        int _624 = _562 & 1;
        bool _626 = _624 != 0;
        int _628 = _616;
        float _630 = _618;
        float _632 = _620;
        float _634 = _622;
        if (!_626)
        {
            float _636 = _218 + _564;
            float _638 = _210 + _566;
            float2 _2543 = float2(_636, _638);
            float3 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2543, float2(0.0), isnan(_2543))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2543, float2(0.0), isnan(_2543))).xyz;
            float _642 = _640.x;
            float _644 = _640.y;
            float _646 = _640.z;
            float _648 = _644 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _650 = fma(_642, (*spvDescriptorSet0.fp_c3)._m0[2].x, _648);
            float _652 = fma(_646, (*spvDescriptorSet0.fp_c3)._m0[2].z, _650);
            float _654 = -_318;
            float _656 = _654 + _652;
            float _658 = abs(_656);
            bool _660 = _658 >= _314;
            bool _662 = !_660;
            int _664 = _662 ? 0 : 1;
            _574 = _664;
            _576 = _636;
            _578 = _638;
            _580 = _656;
        }
        int _666 = _574;
        float _668 = _576;
        float _670 = _578;
        float _672 = _580;
        int _674 = _616 & 1;
        bool _676 = _674 != 0;
        int _678 = _666;
        float _680 = _668;
        float _682 = _670;
        float _684 = _672;
        if (!_676)
        {
            float _686 = -_218;
            float _688 = _686 + _618;
            float _690 = -_210;
            float _692 = _690 + _620;
            float2 _2615 = float2(_688, _692);
            float3 _694 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2615, float2(0.0), isnan(_2615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2615, float2(0.0), isnan(_2615))).xyz;
            float _696 = _694.x;
            float _698 = _694.y;
            float _700 = _694.z;
            float _702 = _698 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _704 = fma(_696, (*spvDescriptorSet0.fp_c3)._m0[2].x, _702);
            float _706 = fma(_700, (*spvDescriptorSet0.fp_c3)._m0[2].z, _704);
            float _708 = -_318;
            float _710 = _708 + _706;
            float _712 = abs(_710);
            bool _714 = _712 >= _314;
            bool _716 = !_714;
            int _718 = _716 ? 0 : 1;
            _628 = _718;
            _630 = _688;
            _632 = _692;
            _634 = _710;
        }
        int _720 = _628;
        float _722 = _630;
        float _724 = _632;
        float _726 = _634;
        int _728 = _666 & 1;
        bool _730 = _728 != 0;
        int _732 = _720;
        float _734 = _722;
        float _736 = _724;
        float _738 = _726;
        if (!_730)
        {
            float _740 = _218 + _668;
            float _742 = _210 + _670;
            float2 _2683 = float2(_740, _742);
            float3 _744 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2683, float2(0.0), isnan(_2683))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2683, float2(0.0), isnan(_2683))).xyz;
            float _746 = _744.x;
            float _748 = _744.y;
            float _750 = _744.z;
            float _752 = _748 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _754 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[2].x, _752);
            float _756 = fma(_750, (*spvDescriptorSet0.fp_c3)._m0[2].z, _754);
            float _758 = -_318;
            float _760 = _758 + _756;
            float _762 = abs(_760);
            bool _764 = _762 >= _314;
            bool _766 = !_764;
            int _768 = _766 ? 0 : 1;
            _678 = _768;
            _680 = _740;
            _682 = _742;
            _684 = _760;
        }
        int _770 = _678;
        float _772 = _680;
        float _774 = _682;
        float _776 = _684;
        int _778 = _720 & 1;
        bool _780 = _778 != 0;
        int _782 = _770;
        float _784 = _772;
        float _786 = _774;
        float _788 = _776;
        if (!_780)
        {
            float _790 = -_218;
            float _792 = _790 + _722;
            float _794 = -_210;
            float _796 = _794 + _724;
            float2 _2755 = float2(_792, _796);
            float3 _798 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2755, float2(0.0), isnan(_2755))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2755, float2(0.0), isnan(_2755))).xyz;
            float _800 = _798.x;
            float _802 = _798.y;
            float _804 = _798.z;
            float _806 = _802 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _808 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[2].x, _806);
            float _810 = fma(_804, (*spvDescriptorSet0.fp_c3)._m0[2].z, _808);
            float _812 = -_318;
            float _814 = _812 + _810;
            float _816 = abs(_814);
            bool _818 = _816 >= _314;
            bool _820 = !_818;
            int _822 = _820 ? 0 : 1;
            _732 = _822;
            _734 = _792;
            _736 = _796;
            _738 = _814;
        }
        int _824 = _732;
        float _826 = _734;
        float _828 = _736;
        float _830 = _738;
        int _832 = _770 & 1;
        bool _834 = _832 != 0;
        int _836 = _824;
        float _838 = _826;
        float _840 = _828;
        float _842 = _830;
        if (!_834)
        {
            float _844 = _218 + _772;
            float _846 = _210 + _774;
            float2 _2823 = float2(_844, _846);
            float3 _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2823, float2(0.0), isnan(_2823))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2823, float2(0.0), isnan(_2823))).xyz;
            float _850 = _848.x;
            float _852 = _848.y;
            float _854 = _848.z;
            float _856 = _852 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _858 = fma(_850, (*spvDescriptorSet0.fp_c3)._m0[2].x, _856);
            float _860 = fma(_854, (*spvDescriptorSet0.fp_c3)._m0[2].z, _858);
            float _862 = -_318;
            float _864 = _862 + _860;
            float _866 = abs(_864);
            bool _868 = _866 >= _314;
            bool _870 = !_868;
            int _872 = _870 ? 0 : 1;
            _782 = _872;
            _784 = _844;
            _786 = _846;
            _788 = _864;
        }
        int _874 = _782;
        float _876 = _784;
        float _878 = _786;
        float _880 = _788;
        int _882 = _824 & 1;
        bool _884 = _882 != 0;
        int _886 = _874;
        float _888 = _876;
        float _890 = _878;
        float _892 = _880;
        if (!_884)
        {
            float _894 = fma(_218, -1.5, _826);
            float _896 = fma(_210, -1.5, _828);
            float2 _2892 = float2(_894, _896);
            float3 _898 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2892, float2(0.0), isnan(_2892))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2892, float2(0.0), isnan(_2892))).xyz;
            float _900 = _898.x;
            float _902 = _898.y;
            float _904 = _898.z;
            float _906 = _902 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _908 = fma(_900, (*spvDescriptorSet0.fp_c3)._m0[2].x, _906);
            float _910 = fma(_904, (*spvDescriptorSet0.fp_c3)._m0[2].z, _908);
            float _912 = -_318;
            float _914 = _912 + _910;
            float _916 = abs(_914);
            bool _918 = _916 >= _314;
            bool _920 = !_918;
            int _922 = _920 ? 0 : 1;
            _836 = _922;
            _838 = _894;
            _840 = _896;
            _842 = _914;
        }
        int _924 = _836;
        float _926 = _838;
        float _928 = _840;
        float _930 = _842;
        int _932 = _874 & 1;
        bool _934 = _932 != 0;
        int _936 = _924;
        float _938 = _926;
        float _940 = _928;
        float _942 = _930;
        if (!_934)
        {
            float _944 = fma(_218, 1.5, _876);
            float _946 = fma(_210, 1.5, _878);
            float2 _2961 = float2(_944, _946);
            float3 _948 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2961, float2(0.0), isnan(_2961))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2961, float2(0.0), isnan(_2961))).xyz;
            float _950 = _948.x;
            float _952 = _948.y;
            float _954 = _948.z;
            float _956 = _952 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _958 = fma(_950, (*spvDescriptorSet0.fp_c3)._m0[2].x, _956);
            float _960 = fma(_954, (*spvDescriptorSet0.fp_c3)._m0[2].z, _958);
            float _962 = -_318;
            float _964 = _962 + _960;
            float _966 = abs(_964);
            bool _968 = _966 >= _314;
            bool _970 = !_968;
            int _972 = _970 ? 0 : 1;
            _886 = _972;
            _888 = _944;
            _890 = _946;
            _892 = _964;
        }
        int _974 = _886;
        float _976 = _888;
        float _978 = _890;
        float _980 = _892;
        int _982 = _924 & 1;
        bool _984 = _982 != 0;
        int _986 = _974;
        float _988 = _976;
        float _990 = _978;
        float _992 = _980;
        if (!_984)
        {
            float _994 = fma(_218, -2.0, _926);
            float _996 = fma(_210, -2.0, _928);
            float2 _3029 = float2(_994, _996);
            float3 _998 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3029, float2(0.0), isnan(_3029))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3029, float2(0.0), isnan(_3029))).xyz;
            float _1000 = _998.x;
            float _1002 = _998.y;
            float _1004 = _998.z;
            float _1006 = _1002 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1008 = fma(_1000, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1006);
            float _1010 = fma(_1004, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1008);
            float _1012 = -_318;
            float _1014 = _1012 + _1010;
            float _1016 = abs(_1014);
            bool _1018 = _1016 >= _314;
            bool _1020 = !_1018;
            int _1022 = _1020 ? 0 : 1;
            _936 = _1022;
            _938 = _994;
            _940 = _996;
            _942 = _1014;
        }
        int _1024 = _936;
        float _1026 = _938;
        float _1028 = _940;
        float _1030 = _942;
        int _1032 = _974 & 1;
        bool _1034 = _1032 != 0;
        int _1036 = _1024;
        float _1038 = _1026;
        float _1040 = _1028;
        float _1042 = _1030;
        if (!_1034)
        {
            float _1044 = fma(_218, 2.0, _976);
            float _1046 = fma(_210, 2.0, _978);
            float2 _3097 = float2(_1044, _1046);
            float3 _1048 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3097, float2(0.0), isnan(_3097))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3097, float2(0.0), isnan(_3097))).xyz;
            float _1050 = _1048.x;
            float _1052 = _1048.y;
            float _1054 = _1048.z;
            float _1056 = _1052 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1058 = fma(_1050, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1056);
            float _1060 = fma(_1054, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1058);
            float _1062 = -_318;
            float _1064 = _1062 + _1060;
            float _1066 = abs(_1064);
            bool _1068 = _1066 >= _314;
            bool _1070 = !_1068;
            int _1072 = _1070 ? 0 : 1;
            _986 = _1072;
            _988 = _1044;
            _990 = _1046;
            _992 = _1064;
        }
        int _1074 = _986;
        float _1076 = _988;
        float _1078 = _990;
        float _1080 = _992;
        int _1082 = _1024 & 1;
        bool _1084 = _1082 != 0;
        int _1086 = _1074;
        float _1088 = _1076;
        float _1090 = _1078;
        float _1092 = _1080;
        if (!_1084)
        {
            float _1094 = fma(_218, -2.0, _1026);
            float _1096 = fma(_210, -2.0, _1028);
            float2 _3165 = float2(_1094, _1096);
            float3 _1098 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3165, float2(0.0), isnan(_3165))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3165, float2(0.0), isnan(_3165))).xyz;
            float _1100 = _1098.x;
            float _1102 = _1098.y;
            float _1104 = _1098.z;
            float _1106 = _1102 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1108 = fma(_1100, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1106);
            float _1110 = fma(_1104, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1108);
            float _1112 = -_318;
            float _1114 = _1112 + _1110;
            float _1116 = abs(_1114);
            bool _1118 = _1116 >= _314;
            bool _1120 = !_1118;
            int _1122 = _1120 ? 0 : 1;
            _1036 = _1122;
            _1038 = _1094;
            _1040 = _1096;
            _1042 = _1114;
        }
        int _1124 = _1036;
        float _1126 = _1038;
        float _1128 = _1040;
        float _1130 = _1042;
        int _1132 = _1074 & 1;
        bool _1134 = _1132 != 0;
        int _1136 = _1124;
        float _1138 = _1126;
        float _1140 = _1128;
        float _1142 = _1130;
        if (!_1134)
        {
            float _1144 = fma(_218, 2.0, _1076);
            float _1146 = fma(_210, 2.0, _1078);
            float2 _3233 = float2(_1144, _1146);
            float3 _1148 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3233, float2(0.0), isnan(_3233))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3233, float2(0.0), isnan(_3233))).xyz;
            float _1150 = _1148.x;
            float _1152 = _1148.y;
            float _1154 = _1148.z;
            float _1156 = _1152 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1158 = fma(_1150, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1156);
            float _1160 = fma(_1154, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1158);
            float _1162 = -_318;
            float _1164 = _1162 + _1160;
            float _1166 = abs(_1164);
            bool _1168 = _1166 >= _314;
            bool _1170 = !_1168;
            int _1172 = _1170 ? 0 : 1;
            _1086 = _1172;
            _1088 = _1144;
            _1090 = _1146;
            _1092 = _1164;
        }
        int _1174 = _1086;
        float _1176 = _1088;
        float _1178 = _1090;
        float _1180 = _1092;
        int _1182 = _1124 & 1;
        bool _1184 = _1182 != 0;
        int _1186 = _1174;
        float _1188 = _1176;
        float _1190 = _1178;
        float _1192 = _1180;
        if (!_1184)
        {
            float _1194 = fma(_218, -2.0, _1126);
            float _1196 = fma(_210, -2.0, _1128);
            float2 _3301 = float2(_1194, _1196);
            float3 _1198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3301, float2(0.0), isnan(_3301))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3301, float2(0.0), isnan(_3301))).xyz;
            float _1200 = _1198.x;
            float _1202 = _1198.y;
            float _1204 = _1198.z;
            float _1206 = _1202 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1208 = fma(_1200, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1206);
            float _1210 = fma(_1204, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1208);
            float _1212 = -_318;
            float _1214 = _1212 + _1210;
            float _1216 = abs(_1214);
            bool _1218 = _1216 >= _314;
            bool _1220 = !_1218;
            int _1222 = _1220 ? 0 : 1;
            _1136 = _1222;
            _1138 = _1194;
            _1140 = _1196;
            _1142 = _1214;
        }
        int _1224 = _1136;
        float _1226 = _1138;
        float _1228 = _1140;
        float _1230 = _1142;
        int _1232 = _1174 & 1;
        bool _1234 = _1232 != 0;
        int _1236 = _1224;
        float _1238 = _1226;
        float _1240 = _1228;
        float _1242 = _1230;
        if (!_1234)
        {
            float _1244 = fma(_218, 2.0, _1176);
            float _1246 = fma(_210, 2.0, _1178);
            float2 _3369 = float2(_1244, _1246);
            float3 _1248 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3369, float2(0.0), isnan(_3369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3369, float2(0.0), isnan(_3369))).xyz;
            float _1250 = _1248.x;
            float _1252 = _1248.y;
            float _1254 = _1248.z;
            float _1256 = _1252 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1258 = fma(_1250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1256);
            float _1260 = fma(_1254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1258);
            float _1262 = -_318;
            float _1264 = _1262 + _1260;
            float _1266 = abs(_1264);
            bool _1268 = _1266 >= _314;
            bool _1270 = !_1268;
            int _1272 = _1270 ? 0 : 1;
            _1186 = _1272;
            _1188 = _1244;
            _1190 = _1246;
            _1192 = _1264;
        }
        int _1274 = _1186;
        float _1276 = _1188;
        float _1278 = _1190;
        float _1280 = _1192;
        int _1282 = _1224 & 1;
        bool _1284 = _1282 != 0;
        int _1286 = _1274;
        float _1288 = _1276;
        float _1290 = _1278;
        float _1292 = _1280;
        if (!_1284)
        {
            float _1294 = fma(_218, -2.0, _1226);
            float _1296 = fma(_210, -2.0, _1228);
            float2 _3437 = float2(_1294, _1296);
            float3 _1298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3437, float2(0.0), isnan(_3437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3437, float2(0.0), isnan(_3437))).xyz;
            float _1300 = _1298.x;
            float _1302 = _1298.y;
            float _1304 = _1298.z;
            float _1306 = _1302 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1308 = fma(_1300, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1306);
            float _1310 = fma(_1304, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1308);
            float _1312 = -_318;
            float _1314 = _1312 + _1310;
            float _1316 = abs(_1314);
            bool _1318 = _1316 >= _314;
            bool _1320 = !_1318;
            int _1322 = _1320 ? 0 : 1;
            _1236 = _1322;
            _1238 = _1294;
            _1240 = _1296;
            _1242 = _1314;
        }
        int _1324 = _1236;
        float _1326 = _1238;
        float _1328 = _1240;
        float _1330 = _1242;
        int _1332 = _1274 & 1;
        bool _1334 = _1332 != 0;
        int _1336 = _1324;
        float _1338 = _1330;
        float _1340 = _1326;
        float _1342 = _1328;
        if (!_1334)
        {
            float _1344 = fma(_218, 2.0, _1276);
            float _1346 = fma(_210, 2.0, _1278);
            float2 _3505 = float2(_1344, _1346);
            float3 _1348 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3505, float2(0.0), isnan(_3505))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3505, float2(0.0), isnan(_3505))).xyz;
            float _1350 = _1348.x;
            float _1352 = _1348.y;
            float _1354 = _1348.z;
            float _1356 = _1352 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1358 = fma(_1350, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1356);
            float _1360 = fma(_1354, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1358);
            float _1362 = -_318;
            float _1364 = _1362 + _1360;
            float _1366 = abs(_1364);
            bool _1368 = _1366 >= _314;
            bool _1370 = !_1368;
            int _1372 = _1370 ? 0 : 1;
            _1286 = _1372;
            _1288 = _1344;
            _1290 = _1346;
            _1292 = _1364;
        }
        int _1374 = _1286;
        float _1376 = _1288;
        float _1378 = _1290;
        float _1380 = _1292;
        int _1382 = _1324 & 1;
        bool _1384 = _1382 != 0;
        int _1386 = _1374;
        float _1388 = _1380;
        float _1390 = _1376;
        float _1392 = _1378;
        if (!_1384)
        {
            float _1394 = fma(_218, -4.0, _1326);
            float _1396 = fma(_210, -4.0, _1328);
            float2 _3574 = float2(_1394, _1396);
            float3 _1398 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3574, float2(0.0), isnan(_3574))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3574, float2(0.0), isnan(_3574))).xyz;
            float _1400 = _1398.x;
            float _1402 = _1398.y;
            float _1404 = _1398.z;
            float _1406 = _1402 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1408 = fma(_1400, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1406);
            float _1410 = fma(_1404, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1408);
            float _1412 = -_318;
            float _1414 = _1412 + _1410;
            float _1416 = abs(_1414);
            bool _1418 = _1416 >= _314;
            bool _1420 = !_1418;
            int _1422 = _1420 ? 0 : 1;
            _1336 = _1422;
            _1338 = _1414;
            _1340 = _1394;
            _1342 = _1396;
        }
        int _1424 = _1336;
        float _1426 = _1338;
        float _1428 = _1340;
        float _1430 = _1342;
        int _1432 = _1374 & 1;
        bool _1434 = _1432 != 0;
        float _1436 = _1430;
        float _1438 = _1428;
        if (!_1434)
        {
            float _1440 = fma(_218, 4.0, _1376);
            float _1442 = fma(_210, 4.0, _1378);
            float2 _3641 = float2(_1440, _1442);
            float3 _1444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3641, float2(0.0), isnan(_3641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3641, float2(0.0), isnan(_3641))).xyz;
            float _1446 = _1444.x;
            float _1448 = _1444.y;
            float _1450 = _1444.z;
            float _1452 = _1448 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1454 = fma(_1446, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1452);
            float _1456 = fma(_1450, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1454);
            float _1458 = -_318;
            float _1460 = _1458 + _1456;
            float _1462 = abs(_1460);
            bool _1464 = _1462 >= _314;
            bool _1466 = !_1464;
            int _1468 = _1466 ? 0 : 1;
            _1386 = _1468;
            _1388 = _1460;
            _1390 = _1440;
            _1392 = _1442;
        }
        int _1470 = _1386;
        float _1472 = _1388;
        float _1474 = _1390;
        float _1476 = _1392;
        int _1478 = _1424 & 1;
        bool _1480 = _1478 != 0;
        int _1482 = _1480 ? (-1) : 0;
        float _1484 = _1476;
        float _1486 = _1474;
        if (_1480)
        {
            bool _1488 = _1426 >= 0.0;
            bool _1490 = isnan(_1426);
            bool _1492 = _1488 || _1490;
            bool _1494 = isnan(0.0);
            bool _1496 = _1492 || _1494;
            _364 = _1496 ? (-1) : 0;
        }
        int _1498 = _364;
        int _1500 = _1498;
        if (!_1480)
        {
            float _1502 = fma(_218, -8.0, _1428);
            float _1504 = fma(_210, -8.0, _1430);
            float2 _3728 = float2(_1502, _1504);
            float3 _1506 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3728, float2(0.0), isnan(_3728))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3728, float2(0.0), isnan(_3728))).xyz;
            float _1508 = _1506.x;
            float _1510 = _1506.y;
            float _1512 = _1506.z;
            float _1514 = _1510 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1516 = fma(_1508, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1514);
            float _1518 = fma(_1512, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1516);
            float _1520 = -_318;
            float _1522 = _1520 + _1518;
            bool _1524 = _1522 >= 0.0;
            bool _1526 = isnan(_1522);
            bool _1528 = _1524 || _1526;
            bool _1530 = isnan(0.0);
            bool _1532 = _1528 || _1530;
            _1436 = _1504;
            _1438 = _1502;
            _1500 = _1532 ? (-1) : 0;
        }
        float _1534 = _1436;
        float _1536 = _1438;
        int _1538 = _1500;
        int _1540 = _1470 & 1;
        bool _1542 = _1540 != 0;
        if (_1542)
        {
            bool _1544 = _1472 >= 0.0;
            bool _1546 = isnan(_1472);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan(0.0);
            bool _1552 = _1548 || _1550;
            _1482 = _1552 ? (-1) : 0;
        }
        int _1554 = _1482;
        int _1556 = _1554;
        if (!_1542)
        {
            float _1558 = fma(_218, 8.0, _1474);
            float _1560 = fma(_210, 8.0, _1476);
            float2 _3812 = float2(_1558, _1560);
            float3 _1562 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3812, float2(0.0), isnan(_3812))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3812, float2(0.0), isnan(_3812))).xyz;
            float _1564 = _1562.x;
            float _1566 = _1562.y;
            float _1568 = _1562.z;
            float _1570 = _1566 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1572 = fma(_1564, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1570);
            float _1574 = fma(_1568, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1572);
            float _1576 = -_318;
            float _1578 = _1576 + _1574;
            bool _1580 = _1578 >= 0.0;
            bool _1582 = isnan(_1578);
            bool _1584 = _1580 || _1582;
            bool _1586 = isnan(0.0);
            bool _1588 = _1584 || _1586;
            _1484 = _1560;
            _1486 = _1558;
            _1556 = _1588 ? (-1) : 0;
        }
        float _1590 = _1484;
        float _1592 = _1486;
        int _1594 = _1556;
        float _1596 = -_1534;
        float _1598 = _75 + _1596;
        float _1600 = -_75;
        float _1602 = _1600 + _1590;
        float _1604 = -_1536;
        float _1606 = _73 + _1604;
        float _1608 = -_73;
        float _1610 = _1608 + _1592;
        float _1612 = _202 * _1598;
        float _1614 = _202 * _1602;
        float _1616 = _218 + _210;
        float _1618 = _304 * 0.75;
        float _1620 = fma(_190, _1606, _1612);
        float _1622 = fma(_190, _1610, _1614);
        float _1624 = 1.0 / _1616;
        float _1626 = _1620 + _1622;
        bool _1628 = _1620 < _1622;
        int _1630 = ~_1538;
        int _1632 = (_1628 ? (-1) : 0) & _1630;
        bool _1634 = _1620 >= _1622;
        bool _1636 = isnan(_1620);
        bool _1638 = _1634 || _1636;
        bool _1640 = isnan(_1622);
        bool _1642 = _1638 || _1640;
        int _1644 = ~_1594;
        int _1646 = (_1642 ? (-1) : 0) & _1644;
        float _1648 = precise::min(_1620, _1622);
        float _1650 = 1.0 / _1626;
        int _1652 = ~_1632;
        int _1654 = _1652 & _1646;
        int _1656 = ~_1646;
        int _1658 = _1632 & _1656;
        int _1660 = _1654 | _1658;
        int _1662 = _1632 & _1646;
        int _1664 = _1660 | _1662;
        bool _1666 = _93 < _318;
        int _1668 = (_1666 ? (-1) : 0) ^ _1664;
        float _1670 = -_1648;
        float _1672 = fma(_1670, _1650, 0.5);
        float _1674 = (_1668 != 0) ? _1672 : 0.0;
        float _1676 = precise::max(_1618, _1674);
        float _1678 = _236 * _1676;
        float _1680 = _1678 * _1624;
        _138 = as_type<int>(_1680);
    }
    int _1682 = _138;
    out.m_34.x = as_type<float>(_1682);
    out.m_34.y = as_type<float>(_1682);
    out.m_34.z = as_type<float>(_1682);
    out.m_34.w = as_type<float>(_1682);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

