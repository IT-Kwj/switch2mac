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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_37 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _63;
    float _91 = _89 * _69;
    float _93 = _89 * _75;
    float _95 = _89 * _81;
    float _97 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _99 = _91 + _97;
    float _101 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _103 = _93 + _101;
    float _105 = _99 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _107 = _99 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _109 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _111 = _95 + _109;
    float _113 = fma(_103, (*spvDescriptorSet0.fp_c10)._m0[8].y, _105);
    float _115 = fma(_103, (*spvDescriptorSet0.fp_c10)._m0[8].x, _107);
    float _117 = fma(_111, (*spvDescriptorSet0.fp_c10)._m0[10].y, _113);
    float _119 = fma(_111, (*spvDescriptorSet0.fp_c10)._m0[10].x, _115);
    float _121 = abs(_117);
    float _123 = abs(_119);
    float _125 = precise::max(_121, _123);
    bool _129 = _125 >= 16.0;
    float _131 = _117;
    float _133 = _119;
    int _136 = as_type<int>(_115);
    int _138 = as_type<int>(_105);
    int _140 = as_type<int>(_125);
    if (_129)
    {
        float _142 = _117 * 0.0625;
        _131 = _142;
    }
    float _144 = _131;
    if (_129)
    {
        float _146 = _119 * 0.0625;
        _133 = _146;
    }
    float _148 = _133;
    float _150 = abs(_144);
    bool _152 = _150 != 0.0;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan(0.0);
    bool _160 = _156 || _158;
    float _162 = abs(_148);
    bool _164 = _162 == 0.0;
    float _166 = abs(_148);
    bool _168 = _166 == 0.0;
    bool _170 = !_160;
    bool _172 = _168 && _170;
    float _174 = abs(_148);
    bool _176 = _174 == 0.0;
    bool _178 = false;
    if (_172)
    {
        bool _180 = as_type<int>(_148) >= 0;
        _178 = _180;
    }
    bool _182 = _178;
    int _184 = _182 ? (-1) : 0;
    bool _186 = _182;
    if (_172)
    {
        int _188 = as_type<int>(_144) & int(0x80000000);
        _136 = _188;
    }
    int _190 = _136;
    int _192 = _190;
    int _194 = _190;
    if (_172)
    {
        int _196 = _182 ? 0 : 1078530011;
        _138 = _196;
    }
    int _198 = _138;
    int _200 = _198;
    if (_172)
    {
        int _202 = _198 | _190;
        _200 = _202;
    }
    int _204 = _200;
    bool _206 = !_160;
    bool _208 = _206 && _164;
    int _210 = _204;
    int _212 = 0;
    float _214 = as_type<float>(_204);
    if (!_208)
    {
        float _216 = abs(_144);
        bool _218 = _216 != as_type<float>(0x7f800000u /* inf */);
        bool _220 = isnan(_216);
        bool _222 = _218 || _220;
        bool _224 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _226 = _222 || _224;
        float _228 = abs(_148);
        bool _230 = _228 == as_type<float>(0x7f800000u /* inf */);
        float _232 = abs(_148);
        bool _234 = _232 == as_type<float>(0x7f800000u /* inf */);
        bool _236 = !_226;
        bool _238 = _234 && _236;
        if (_238)
        {
            bool _240 = as_type<int>(_148) >= 0;
            _184 = _240 ? (-1) : 0;
        }
        int _242 = _184;
        _186 = _242 != 0;
        if (_238)
        {
            _210 = 1075235812;
        }
        int _244 = _210;
        int _246 = _244;
        if (_238)
        {
            int _248 = as_type<int>(_144) & int(0x80000000);
            _192 = _248;
        }
        int _250 = _192;
        _194 = _250;
        if (_238)
        {
            int _252 = ~_242;
            int _254 = (_252 != 0) ? _244 : 1061752795;
            _246 = _254;
        }
        int _256 = _246;
        float _258 = as_type<float>(_256);
        if (_238)
        {
            int _260 = _256 | _250;
            _258 = as_type<float>(_260);
        }
        float _262 = _258;
        bool _264 = !_226;
        bool _266 = _264 && _230;
        _212 = 0;
        _214 = _262;
        if (!_266)
        {
            float _268 = abs(_144);
            float _270 = abs(_148);
            float _272 = precise::max(_268, _270);
            float _274 = abs(_144);
            float _276 = abs(_148);
            float _278 = precise::min(_274, _276);
            float _280 = 1.0 / _272;
            float _282 = abs(_144);
            float _284 = abs(_148);
            bool _286 = _282 > _284;
            bool _288 = as_type<int>(_148) >= 0;
            float _290 = _278 * _280;
            float _292 = _290 * _290;
            float _294 = _292 + 11.33538818359375;
            float _296 = fma(_292, _294, 28.84246826171875);
            float _298 = fma(_292, _296, 19.6966705322265625);
            float _300 = fma(_292, -0.82336294651031494140625, -5.674867153167724609375);
            float _302 = fma(_292, _300, -6.565555095672607421875);
            float _304 = 1.0 / _298;
            float _306 = _292 * _302;
            float _308 = abs(_144);
            float _310 = abs(_148);
            float _312 = _308 + _310;
            int _314 = as_type<int>(_144) & int(0x80000000);
            float _316 = _290 * _306;
            bool _318 = _312 > as_type<float>(0x7f800000u /* inf */);
            bool _320 = isnan(_312);
            bool _322 = _318 || _320;
            bool _324 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _326 = _322 || _324;
            float _328 = fma(_316, _304, _290);
            float _330 = _328;
            _186 = _288;
            _212 = as_type<int>(_272);
            _194 = _314;
            _140 = as_type<int>(_290);
            _214 = _312;
            if (_286)
            {
                float _332 = -_328;
                float _334 = _332 + 1.57079637050628662109375;
                _330 = _334;
            }
            float _336 = _330;
            int _338 = as_type<int>(_336);
            if (!_288)
            {
                float _340 = -_336;
                float _342 = _340 + 3.1415927410125732421875;
                _338 = as_type<int>(_342);
            }
            int _344 = _338;
            if (!_326)
            {
                int _346 = _314 | _344;
                _214 = as_type<float>(_346);
            }
        }
    }
    bool _348 = _186;
    int _350 = _212;
    int _352 = _194;
    int _354 = _140;
    float _356 = _214;
    int _358 = _350;
    int _360 = _354;
    if (_172)
    {
        int _362 = _348 ? 0 : 1078530011;
        _358 = _362;
    }
    int _364 = _358;
    int _366 = _364;
    if (_172)
    {
        int _368 = _364 | _352;
        _360 = _368;
    }
    int _370 = _360;
    bool _372 = !_160;
    bool _374 = _372 && _176;
    int _376 = _370;
    float _378 = as_type<float>(_370);
    if (!_374)
    {
        float _380 = abs(_144);
        bool _382 = _380 != as_type<float>(0x7f800000u /* inf */);
        bool _384 = isnan(_380);
        bool _386 = _382 || _384;
        bool _388 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _390 = _386 || _388;
        float _392 = abs(_148);
        bool _394 = _392 == as_type<float>(0x7f800000u /* inf */);
        float _396 = abs(_148);
        bool _398 = _396 == as_type<float>(0x7f800000u /* inf */);
        bool _400 = !_390;
        bool _402 = _398 && _400;
        if (_402)
        {
            _376 = 1075235812;
        }
        int _404 = _376;
        float _406 = as_type<float>(_404);
        if (_402)
        {
            bool _408 = !_348;
            int _410 = _408 ? _404 : 1061752795;
            _366 = _410;
        }
        int _412 = _366;
        if (_402)
        {
            int _414 = _412 | _352;
            _406 = as_type<float>(_414);
        }
        float _416 = _406;
        bool _418 = !_390;
        bool _420 = _418 && _394;
        _378 = _416;
        if (!_420)
        {
            float _422 = abs(_144);
            float _424 = abs(_148);
            float _426 = precise::max(_422, _424);
            float _428 = abs(_144);
            float _430 = abs(_148);
            float _432 = precise::min(_428, _430);
            float _434 = 1.0 / _426;
            float _436 = abs(_144);
            float _438 = abs(_148);
            bool _440 = _436 > _438;
            float _442 = abs(_144);
            float _444 = abs(_148);
            float _446 = _442 + _444;
            bool _448 = _446 > as_type<float>(0x7f800000u /* inf */);
            bool _450 = isnan(_446);
            bool _452 = _448 || _450;
            bool _454 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _456 = _452 || _454;
            float _458 = _432 * _434;
            float _460 = _458 * _458;
            float _462 = _460 + 11.33538818359375;
            float _464 = fma(_460, _462, 28.84246826171875);
            float _466 = fma(_460, _464, 19.6966705322265625);
            float _468 = fma(_460, -0.82336294651031494140625, -5.674867153167724609375);
            float _470 = 1.0 / _466;
            float _472 = fma(_460, _468, -6.565555095672607421875);
            float _474 = _460 * _472;
            float _476 = _458 * _474;
            float _478 = fma(_476, _470, _458);
            float _480 = _478;
            _378 = _446;
            if (_440)
            {
                float _482 = -_478;
                float _484 = _482 + 1.57079637050628662109375;
                _480 = _484;
            }
            float _486 = _480;
            int _488 = as_type<int>(_486);
            if (!_348)
            {
                float _490 = -_486;
                float _492 = _490 + 3.1415927410125732421875;
                _488 = as_type<int>(_492);
            }
            int _494 = _488;
            if (!_456)
            {
                int _496 = _352 | _494;
                _378 = as_type<float>(_496);
            }
        }
    }
    float _498 = _378;
    float _500 = fma(_498, 0.15915493667125701904296875, 0.5);
    float _502 = _89 * _87;
    float _504 = _500 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float2 _1968 = float2(_504, _502);
    float _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1968, float2(0.0), isnan(_1968))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1968, float2(0.0), isnan(_1968))).w;
    float2 _1977 = float2(0.5, _502);
    float2 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1977, float2(0.0), isnan(_1977))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1977, float2(0.0), isnan(_1977))).xw;
    float _512 = _510.x;
    float _514 = _510.y;
    float _516 = in.m_41.x;
    float _518 = floor(_504);
    float _520 = -_93;
    float _522 = _520 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _524 = -_95;
    float _526 = _524 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _528 = in.m_43.w;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_45.x;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _542 = _516 * 78.233001708984375;
    float _544 = fma(_518, 12.98980045318603515625, _542);
    float _546 = _89 * _532;
    float _548 = _544 * 0.15915493667125701904296875;
    float _550 = _548 * 6.283185482025146484375;
    float _552 = sin(_550);
    float _554 = _552 * 43758.546875;
    float _556 = _518 * _540;
    float _558 = floor(_554);
    float _560 = _556 * 251.327423095703125;
    float _562 = _556 * 56.54866790771484375;
    float _564 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.23000000417232513427734375, _560);
    float _566 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.20999999344348907470703125, _562);
    float _568 = _564 * 0.15915493667125701904296875;
    float _570 = _568 * 6.283185482025146484375;
    float _572 = sin(_570);
    float _574 = -_558;
    float _576 = _554 + _574;
    float _578 = fma(_356, 0.15915493667125701904296875, 0.5);
    float _580 = in.m_47.x;
    float _582 = gl_FragCoord.w;
    float _584 = _580 * _582;
    float _586 = fma(_576, 6.283185482025146484375, _566);
    float _588 = _586 * 0.15915493667125701904296875;
    float _590 = -_91;
    float _592 = _590 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _594 = _588 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = _592 * _592;
    float _600 = fma(_522, _522, _598);
    float _602 = fma(_526, _526, _600);
    float _604 = fma(_502, 2.0, -1.0);
    float _606 = sqrt(_602);
    float _608 = fma(_572, 0.25, _596);
    float _610 = (*spvDescriptorSet0.fp_c10)._m0[2].x * (-0.0005000000237487256526947021484375);
    float _612 = fma(_608, 0.23999999463558197021484375, 0.39999997615814208984375);
    float _614 = fma(_608, 0.1599999964237213134765625, 0.800000011920928955078125);
    float _616 = fma(_578, (*spvDescriptorSet0.fp_c9)._m0[191].x, _610);
    float _618 = in.m_49.w;
    float _620 = gl_FragCoord.w;
    float _622 = _618 * _620;
    float _624 = precise::max(_612, 0.100000001490116119384765625);
    float _626 = abs(_604);
    float _628 = fma(_626, 0.006000000052154064178466796875, _616);
    float _630 = precise::max(_614, 0.60000002384185791015625);
    float _632 = precise::min(_624, 0.699999988079071044921875);
    float _634 = _628 * 40.0;
    float _636 = precise::min(_630, 1.0);
    float _638 = precise::max(_502, _632);
    float _640 = floor(_634);
    float _642 = precise::max(_606, 15.0);
    float _644 = -_632;
    float _646 = _644 + _636;
    float _648 = precise::min(_636, _638);
    float _650 = precise::min(_642, 30.0);
    float _652 = 1.0 / _646;
    float _654 = -_632;
    float _656 = _654 + _648;
    float _658 = _89 * _584;
    float _660 = -_640;
    float _662 = _634 + _660;
    bool _664 = _662 >= _546;
    bool _666 = isnan(_662);
    bool _668 = _664 || _666;
    bool _670 = isnan(_546);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -_658;
    float _678 = _676 + 1.0;
    float _680 = _656 * _652;
    float _682 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.00999999977648258209228515625, _500);
    float _684 = floor(_682);
    float _686 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _688 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _686;
    float _690 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _692 = _690 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _694 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _696 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _694;
    float _698 = _506 * _680;
    float _700 = _514 * _678;
    float _702 = fma(_650, 0.066666670143604278564453125, -1.0);
    float _704 = fma(_658, _698, _700);
    float _706 = _704 * _702;
    float _708 = _89 * _622;
    float _710 = _706 * _708;
    float _712 = _89 * _538;
    float _714 = 0.0 + _710;
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = _716 * _712;
    bool _720 = _718 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _722 = isnan(_718);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _732 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _730;
    if (!_728)
    {
        discard_fragment();
    }
    float _734 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _736 = _734 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _738 = 1.0 / _732;
    float _740 = -_684;
    float _742 = _682 + _740;
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _748 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _746;
    float _750 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _752 = _750 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _754 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _756 = _744 + _754;
    float _758 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _760 = _744 + _758;
    float _762 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _764 = _744 + _762;
    float _766 = 1.0 / _736;
    float _768 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _770 = _744 + _768;
    float _772 = _514 * 0.5;
    bool _774 = _500 <= 0.999000012874603271484375;
    bool _776 = isnan(_500);
    bool _778 = _774 || _776;
    bool _780 = isnan(0.999000012874603271484375);
    bool _782 = _778 || _780;
    float _784 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _786 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _784;
    float _788 = _756 * _738;
    float _790 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _792 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _790;
    float _794 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _796 = _794 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _798 = _500 >= 0.001000000047497451305389404296875;
    bool _800 = isnan(_500);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.001000000047497451305389404296875);
    bool _806 = _802 || _804;
    bool _808 = _806 && _782;
    float _810 = float(_808);
    float _812 = fma(_688, _788, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _814 = fma(_748, _788, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _816 = fma(_792, _788, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _818 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _820 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _818;
    float _822 = _760 * _766;
    float _824 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _826 = _744 + _824;
    float _828 = fma(_692, _822, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _830 = fma(_752, _822, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _832 = fma(_796, _822, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _834 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _836 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _834;
    float _838 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _840 = _838 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _842 = 1.0 / _840;
    float _844 = 1.0 / _836;
    float _846 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _848 = _846 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _850 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _850;
    float _854 = _764 * _842;
    float _856 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _858 = _856 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _860 = fma(_848, _854, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _862 = fma(_858, _854, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _864 = 1.0 / _852;
    float _866 = _826 * _844;
    float _868 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _870 = _868 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _872 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _874 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _872;
    float _876 = fma(_696, _866, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _878 = fma(_870, _854, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _880 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _882 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _880;
    float _884 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _886 = _884 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _888 = fma(_874, _866, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _890 = fma(_820, _866, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _892 = 1.0 / _882;
    float _894 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _896 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _894;
    float _898 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _900 = _898 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _902 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _904 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _902;
    float _906 = 1.0 / _886;
    float _908 = _770 * _892;
    float _910 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _912 = _744 + _910;
    float _914 = fma(_786, _908, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _916 = fma(_896, _908, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _918 = _912 * _906;
    float _920 = _512 * _512;
    float _922 = fma(_904, _908, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    bool _924 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _926 = isnan(_744);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = fma(_674, _920, _772);
    float _938 = precise::clamp(_936, 0.0, 1.0);
    float _940 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _942 = _940 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _944 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _946 = _944 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _948 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _950 = _938 + _948;
    float _952 = fma(_942, _918, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _954 = fma(_946, _918, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _956 = _950 * _864;
    float _958 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _960 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _958;
    float _962 = fma(_900, _918, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _964 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _966 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _964;
    bool _968 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _970 = isnan(_744);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = fma(_960, _956, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _982 = fma(_966, _956, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    bool _984 = _938 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _986 = isnan(_938);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -_978;
    float _998 = _996 + 1.0;
    bool _1000 = _938 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _1002 = isnan(_938);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _1014 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _1012;
    float _1016 = -_994;
    float _1018 = _1016 + 1.0;
    float _1020 = _934 * _998;
    float _1022 = fma(_1014, _956, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _1024 = -_934;
    float _1026 = _1024 + 1.0;
    float _1028 = _1010 * _1018;
    float _1030 = _816 * _1020;
    float _1032 = _814 * _1020;
    float _1034 = -_1010;
    float _1036 = _1034 + 1.0;
    float _1038 = _980 * _1028;
    float _1040 = _982 * _1028;
    float _1042 = _1022 * _1028;
    float _1044 = _812 * _1020;
    float _1046 = fma(_1026, (*spvDescriptorSet0.fp_c9)._m0[107].z, _1030);
    bool _1048 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _1050 = isnan(_744);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = fma(_1026, (*spvDescriptorSet0.fp_c9)._m0[107].y, _1032);
    float _1062 = fma(_1026, (*spvDescriptorSet0.fp_c9)._m0[107].x, _1044);
    float _1064 = fma(_1036, (*spvDescriptorSet0.fp_c9)._m0[123].x, _1038);
    float _1066 = fma(_1036, (*spvDescriptorSet0.fp_c9)._m0[123].z, _1042);
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = _978 * _1070;
    float _1074 = fma(_828, _1072, _1062);
    bool _1076 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _1078 = isnan(_744);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = fma(_832, _1072, _1046);
    float _1090 = fma(_830, _1072, _1060);
    float _1092 = -_1086;
    float _1094 = _1092 + 1.0;
    float _1096 = _1058 * _1094;
    bool _1098 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _1100 = isnan(_744);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_888, _1096, _1074);
    float _1112 = fma(_890, _1096, _1088);
    float _1114 = -_1108;
    float _1116 = _1114 + 1.0;
    float _1118 = fma(_876, _1096, _1090);
    float _1120 = _1086 * _1116;
    float _1122 = fma(_878, _1120, _1110);
    bool _1124 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _1126 = isnan(_744);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = fma(_860, _1120, _1112);
    bool _1138 = _744 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _1140 = isnan(_744);
    bool _1142 = _1138 || _1140;
    bool _1144 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _1146 = _1142 || _1144;
    float _1148 = float(_1146);
    float _1150 = fma(_862, _1120, _1118);
    float _1152 = -_1134;
    float _1154 = _1152 + 1.0;
    float _1156 = _1108 * _1154;
    float _1158 = _502 * _502;
    float _1160 = fma(_916, _1156, _1136);
    float _1162 = -_1148;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_922, _1156, _1122);
    float _1168 = fma(_914, _1156, _1150);
    float _1170 = _502 * _1158;
    float _1172 = _1134 * _1164;
    float _1174 = fma(_954, _1172, _1166);
    float _1176 = fma(_952, _1172, _1168);
    float _1178 = fma(_962, _1172, _1160);
    float _1180 = fma(_1148, (*spvDescriptorSet0.fp_c9)._m0[113].x, _1174);
    float _1182 = fma(_1148, (*spvDescriptorSet0.fp_c9)._m0[113].y, _1176);
    float _1184 = fma(_1148, (*spvDescriptorSet0.fp_c9)._m0[113].z, _1178);
    float _1186 = fma(_1170, 4.0, 1.0);
    float _1188 = _810 * _1186;
    float _1190 = fma(_1036, (*spvDescriptorSet0.fp_c9)._m0[123].y, _1040);
    float _1192 = _1184 * _1188;
    float _1194 = _658 * _1188;
    float _1196 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[124].y, _1190);
    float _1198 = _658 * _1192;
    float _1200 = _1180 * _1194;
    float _1202 = _1182 * _1194;
    float _1204 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[124].x, _1064);
    float _1206 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[124].z, _1066);
    float _1208 = fma(_1196, _678, _1202);
    float _1210 = fma(_1204, _678, _1200);
    float _1212 = fma(_1206, _678, _1198);
    if (!_728)
    {
        out.m_52.x = _1210;
        out.m_52.y = _1208;
        out.m_52.z = _1212;
        out.m_52.w = _710;
        return out;
    }
    float _1214 = _1208 * 0.715200006961822509765625;
    float _1216 = in.m_54.w;
    float _1218 = gl_FragCoord.w;
    float _1220 = _1216 * _1218;
    float _1222 = in.m_54.z;
    float _1224 = gl_FragCoord.w;
    float _1226 = _1222 * _1224;
    float _1228 = in.m_54.x;
    float _1230 = gl_FragCoord.w;
    float _1232 = _1228 * _1230;
    float _1234 = fma(_1210, 0.2125999927520751953125, _1214);
    float _1236 = in.m_54.y;
    float _1238 = gl_FragCoord.w;
    float _1240 = _1236 * _1238;
    float _1242 = 0.0 + _718;
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = fma(_1212, 0.072200000286102294921875, _1234);
    bool _1248 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1250 = 1.0 / _1246;
    float _1252 = _1250 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = _89 * _1220;
    float _1258 = fma(_1254, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1260 = _89 * _1226;
    float _1262 = _1258 * _1256;
    float _1264 = _89 * _1232;
    float _1266 = _89 * _1240;
    float _1268 = fma(_1212, _1262, _1260);
    float _1270 = fma(_1210, _1262, _1264);
    float _1272 = fma(_1208, _1262, _1266);
    float _1274 = _1260;
    if (!_1248)
    {
        _1274 = _1244;
    }
    float _1276 = _1274;
    bool _1278 = !_1248;
    float _1280 = _1276;
    if (!_1278)
    {
        float _1282 = in.m_56.w;
        float _1284 = gl_FragCoord.w;
        float _1286 = _1282 * _1284;
        float _1288 = in.m_56.z;
        float _1290 = gl_FragCoord.w;
        float _1292 = _1288 * _1290;
        float _1294 = _89 * _1286;
        float _1296 = _89 * _1292;
        float _1298 = 1.0 / _1294;
        float _1300 = _1296 * _1298;
        float _1302 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1304 = fma(_1300, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1302);
        float _1306 = 1.0 / _1304;
        float _1308 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1310 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1312 = fma(_1306, _1308, _1310);
        float _1314 = _1312 * 8.0;
        float _1316 = precise::clamp(_1314, 0.0, 1.0);
        float _1318 = _1244 * _1316;
        _1280 = _1318;
    }
    float _1320 = _1280;
    float _1322 = 0.0 + _1320;
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    out.m_52.x = _1270;
    out.m_52.y = _1272;
    out.m_52.z = _1268;
    out.m_52.w = _1324;
    return out;
}

