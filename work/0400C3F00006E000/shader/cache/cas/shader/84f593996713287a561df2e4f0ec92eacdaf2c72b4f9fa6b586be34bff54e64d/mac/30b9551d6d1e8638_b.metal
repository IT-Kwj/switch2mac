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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    texture2d_array<float> vp_t_tcb_8 [[id(3)]];
    sampler vp_t_tcb_8Smplr [[id(4)]];
    sampler vp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_50 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_33 [[attribute(0)]];
    float4 m_35 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_39 [[attribute(8)]];
    float4 m_41 [[attribute(9)]];
    float4 m_31 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _632 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    uint _68 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].w)) >> uint(16)));
    int _71 = int(_68) & 65535;
    float _74 = in.m_31.x;
    uint _76 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(8)));
    float _78 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].x))).x;
    float _80 = (-0.0) + _78;
    int _82 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w) & 255;
    float _84 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].z))).x;
    float _86 = (-0.0) + _84;
    uint _88 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].x)) >> uint(16)));
    int _90 = int(_88) & 65535;
    int _92 = int(_76) & 255;
    uint _94 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(16)));
    float _96 = float(_82);
    uint _98 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(24)));
    float _100 = float(_92);
    uint _102 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].y)) >> uint(16)));
    int _104 = int(_102) & 65535;
    float _106 = _96 * 0.0039215688593685626983642578125;
    float _108 = float2(as_type<half2>(uint(_71))).x;
    float _110 = (-0.0) + _108;
    uint _112 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].z)) >> uint(16)));
    int _114 = int(_112) & 65535;
    float _116 = abs(_110);
    float _118 = precise::max(_116, 0.100000001490116119384765625);
    float _120 = float2(as_type<half2>(uint(_90))).x;
    float _122 = (-0.0) + _120;
    float _124 = precise::min(_118, 20.0);
    float _126 = _124 * 0.0500000007450580596923828125;
    float _128 = float2(as_type<half2>(uint(_104))).x;
    float _130 = (-0.0) + _128;
    bool _134 = _126 >= _74;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan(_74);
    bool _142 = _138 || _140;
    float _144 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].y))).x;
    float _146 = (-0.0) + _144;
    float _148 = float2(as_type<half2>(uint(_114))).x;
    float _150 = (-0.0) + _148;
    int _152 = 0;
    float _154 = _124;
    if (!_142)
    {
        _152 = -1;
    }
    int _156 = _152;
    float _158 = 0.0;
    int _160 = _156;
    int _162 = _156;
    if (!_142)
    {
        _158 = 1.0;
    }
    float _164 = _158;
    bool _166 = !_142;
    float _168 = _164;
    float _170 = _164;
    if (!_166)
    {
        float _172 = 1.0 / _124;
        float _174 = _172 * 20.0;
        float _176 = _174 * _74;
        float _178 = precise::clamp(_176, 0.0, 1.0);
        bool _180 = _178 > 0.20000000298023223876953125;
        bool _182 = isnan(_178);
        bool _184 = _180 || _182;
        bool _186 = isnan(0.20000000298023223876953125);
        bool _188 = _184 || _186;
        float _190 = _174;
        if (!_188)
        {
            float _192 = _178 * 5.0;
            _190 = _192;
        }
        float _194 = _190;
        float _196 = _194;
        if (!_188)
        {
            _160 = 0;
        }
        int _198 = _160;
        int _200 = _198;
        _162 = _198;
        if (!_188)
        {
            float _202 = _106 * _194;
            _168 = _202;
        }
        float _204 = _168;
        bool _206 = !_188;
        float _208 = _204;
        _170 = _204;
        if (!_206)
        {
            bool _210 = _178 > 0.4000000059604644775390625;
            bool _212 = isnan(_178);
            bool _214 = _210 || _212;
            bool _216 = isnan(0.4000000059604644775390625);
            bool _218 = _214 || _216;
            if (!_218)
            {
                _196 = 1.0;
            }
            float _220 = _196;
            if (!_218)
            {
                float _222 = -_96;
                float _224 = _222 + _100;
                _154 = _224;
            }
            float _226 = _154;
            float _228 = _226;
            if (!_218)
            {
                _200 = 0;
            }
            int _230 = _200;
            int _232 = _230;
            _162 = _230;
            if (!_218)
            {
                float _234 = -_220;
                float _236 = fma(_178, 5.0, _234);
                _208 = _236;
            }
            float _238 = _208;
            float _240 = _238;
            if (!_218)
            {
                float _242 = fma(_238, _226, _96);
                _240 = _242;
            }
            float _244 = _240;
            float _246 = _244;
            if (!_218)
            {
                float _248 = _244 * 0.0039215688593685626983642578125;
                _246 = _248;
            }
            float _250 = _246;
            bool _252 = !_218;
            float _254 = _250;
            _170 = _250;
            if (!_252)
            {
                bool _256 = _178 > 0.60000002384185791015625;
                bool _258 = isnan(_178);
                bool _260 = _256 || _258;
                bool _262 = isnan(0.60000002384185791015625);
                bool _264 = _260 || _262;
                int _266 = int(_94) & 255;
                float _268 = float(_266);
                float _270 = 0.0;
                float _272 = _268;
                if (!_264)
                {
                    _270 = 4.999999523162841796875;
                }
                float _274 = _270;
                float _276 = _274;
                if (!_264)
                {
                    float _278 = -_100;
                    float _280 = _278 + _268;
                    _254 = _280;
                }
                float _282 = _254;
                float _284 = _282;
                if (!_264)
                {
                    _232 = 0;
                }
                int _286 = _232;
                _162 = _286;
                if (!_264)
                {
                    float _288 = fma(_178, _274, -1.99999988079071044921875);
                    _276 = _288;
                }
                float _290 = _276;
                float _292 = _290;
                if (!_264)
                {
                    float _294 = fma(_290, _282, _100);
                    _284 = _294;
                }
                float _296 = _284;
                float _298 = _296;
                if (!_264)
                {
                    float _300 = _296 * 0.0039215688593685626983642578125;
                    _298 = _300;
                }
                float _302 = _298;
                bool _304 = !_264;
                _170 = _302;
                if (!_304)
                {
                    bool _306 = _178 > 0.800000011920928955078125;
                    bool _308 = isnan(_178);
                    bool _310 = _306 || _308;
                    bool _312 = isnan(0.800000011920928955078125);
                    bool _314 = _310 || _312;
                    float _316 = float(int(_98));
                    float _318 = _316;
                    _162 = 0;
                    if (!_314)
                    {
                        float _320 = fma(_178, 5.000000476837158203125, -3.000000476837158203125);
                        _228 = _320;
                    }
                    float _322 = _228;
                    float _324 = _322;
                    if (!_314)
                    {
                        float _326 = -_268;
                        float _328 = _326 + _316;
                        _292 = _328;
                    }
                    float _330 = _292;
                    float _332 = 0.0;
                    float _334 = _330;
                    if (_314)
                    {
                        float _336 = _316 * 0.0039215688593685626983642578125;
                        _332 = _336;
                    }
                    float _338 = _332;
                    if (!_314)
                    {
                        float _340 = fma(_322, _330, _268);
                        _334 = _340;
                    }
                    float _342 = _334;
                    if (_314)
                    {
                        float _344 = fma(_178, 5.000000476837158203125, -4.000000476837158203125);
                        _272 = _344;
                    }
                    float _346 = _272;
                    if (_314)
                    {
                        float _348 = -_338;
                        float _350 = _348 + 1.0;
                        _324 = _350;
                    }
                    float _352 = _324;
                    if (!_314)
                    {
                        float _354 = _342 * 0.0039215688593685626983642578125;
                        _318 = _354;
                    }
                    float _356 = _318;
                    _170 = _356;
                    if (_314)
                    {
                        float _358 = fma(_346, _352, _338);
                        _170 = _358;
                    }
                }
            }
        }
    }
    float _360 = _170;
    int _362 = _162;
    float _364 = -_96;
    float _366 = _364 + _100;
    float _368 = in.m_33.z;
    float _370 = fma(_366, 0.0019607846625149250030517578125, _106);
    float _372 = in.m_33.y;
    bool _374 = _360 >= _370;
    bool _376 = isnan(_360);
    bool _378 = _374 || _376;
    bool _380 = isnan(_370);
    bool _382 = _378 || _380;
    float _384 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
    bool _386 = 0.0 > _384;
    bool _388 = !_382;
    bool _390 = _386 && _388;
    float _392 = fma(_74, -20.0, _368);
    bool _394 = _372 >= 0.0;
    bool _396 = _394 && _390;
    bool _398 = !_396;
    float _400 = _372;
    float _402 = _392;
    float _608;
    float _610;
    float _612;
    float _614;
    float _616;
    float _618;
    float _620;
    float _622;
    float _624;
    float _626;
    float _628;
    float _630;
    if (!_398)
    {
        float _404 = _370 * _370;
        float _406 = -_370;
        float _408 = _406 + 1.0;
        float _410 = fma(_370, -3.0, 3.0);
        float _412 = _404 * 3.0;
        float _414 = _370 * _404;
        float _416 = _370 * _410;
        float _418 = _408 * _408;
        float _420 = _370 * _416;
        float _422 = _416 * 2.0;
        float _424 = _408 * _416;
        float _426 = 1.0 / _370;
        float _428 = _150 * _420;
        float _430 = -_412;
        float _432 = _430 + _422;
        float _434 = _122 * _420;
        float _436 = -_422;
        float _438 = fma(_418, 3.0, _436);
        float _440 = fma(_86, _424, _428);
        float _442 = _122 * _432;
        float _444 = _150 * _432;
        float _446 = _130 * _432;
        float _448 = fma(_80, _424, _434);
        float _450 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].z, _440);
        float _452 = fma(_80, _438, _442);
        float _454 = fma(_146, _438, _446);
        float _456 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].x, _448);
        float _458 = _450 * _450;
        float _460 = fma(_86, _438, _444);
        float _462 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].y, _454);
        float _464 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].x, _452);
        float _466 = fma(_456, _456, _458);
        float _468 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].z, _460);
        float _470 = _462 * _462;
        float _472 = _426 * _360;
        float _474 = _130 * _420;
        float _476 = sqrt(_466);
        float _478 = fma(_464, _464, _470);
        float _480 = fma(_472, -3.0, 3.0);
        float _482 = fma(_146, _424, _474);
        float _484 = _472 * _472;
        float _486 = fma(_468, _468, _478);
        float _488 = _472 * _480;
        float _490 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].y, _482);
        float _492 = -_472;
        float _494 = _492 + 1.0;
        float _496 = _484 * 3.0;
        float _498 = _488 * 2.0;
        float _500 = rsqrt(_486);
        float _502 = -_496;
        float _504 = _502 + _498;
        float _506 = _476 * 0.20000000298023223876953125;
        float _508 = precise::max(_506, 0.100000001490116119384765625);
        float _510 = _500 * _508;
        float _512 = _494 * _494;
        float _514 = _494 * _488;
        float _516 = -_510;
        float _518 = fma(_462, _516, _490);
        float _520 = -_498;
        float _522 = fma(_512, 3.0, _520);
        float _524 = -_510;
        float _526 = fma(_464, _524, _456);
        float _528 = -_510;
        float _530 = fma(_468, _528, _450);
        float _532 = _518 * _504;
        float _534 = fma(_522, 0.00999999977648258209228515625, _532);
        float _536 = _456 * _496;
        float _538 = fma(_490, _496, _534);
        float _540 = fma(_526, _504, _536);
        float _542 = _450 * _496;
        float _544 = _538 * _538;
        float _546 = fma(_530, _504, _542);
        float _548 = fma(_540, _540, _544);
        float _550 = fma(_546, _546, _548);
        float _552 = rsqrt(_550);
        float _554 = _538 * _552;
        float _556 = _546 * _552;
        float _558 = _554 * _554;
        float _560 = fma(_556, _556, _558);
        float _562 = _472 * _488;
        float _564 = _472 * _484;
        float _566 = rsqrt(_560);
        float _568 = _518 * _562;
        float _570 = _456 * _564;
        float _572 = _450 * _564;
        float _574 = fma(_514, 0.00999999977648258209228515625, _568);
        float _576 = _540 * _552;
        float _578 = fma(_526, _562, _570);
        float _580 = fma(_530, _562, _572);
        float _582 = fma(_490, _564, _574);
        float _584 = _554 * _566;
        float _586 = _556 * _566;
        float _588 = -_584;
        float _590 = _554 * _588;
        float _592 = -_584;
        float _594 = _576 * _592;
        float _596 = -_584;
        float _598 = (-0.0) + _596;
        float _600 = -_576;
        float _602 = fma(_600, _586, -0.0);
        float _604 = -_590;
        float _606 = fma(_556, _586, _604);
        _608 = _586;
        _610 = 0.0;
        _612 = _598;
        _614 = _594;
        _616 = _606;
        _618 = _602;
        _620 = _554;
        _622 = _576;
        _624 = _556;
        _626 = _582;
        _628 = _578;
        _630 = _580;
        _632 = true;
    }
    else
    {
        float _634 = _360 * _360;
        float _636 = fma(_360, -3.0, 3.0);
        float _638 = _634 * 3.0;
        float _640 = _636 * _360;
        float _642 = -_360;
        float _644 = _642 + 1.0;
        float _646 = _640 * 2.0;
        float _648 = _644 * _644;
        float _650 = -_638;
        float _652 = _650 + _646;
        float _654 = -_646;
        float _656 = fma(_648, 3.0, _654);
        float _658 = _130 * _652;
        float _660 = _122 * _652;
        float _662 = _150 * _652;
        float _664 = fma(_146, _656, _658);
        float _666 = fma(_80, _656, _660);
        float _668 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].y, _664);
        float _670 = fma(_86, _656, _662);
        float _672 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].x, _666);
        float _674 = _640 * _360;
        float _676 = _668 * _668;
        float _678 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].z, _670);
        float _680 = _644 * _640;
        float _682 = _122 * _674;
        float _684 = fma(_672, _672, _676);
        float _686 = _130 * _674;
        float _688 = _150 * _674;
        float _690 = fma(_80, _680, _682);
        float _692 = fma(_678, _678, _684);
        float _694 = _634 * _360;
        float _696 = fma(_146, _680, _686);
        float _698 = fma(_86, _680, _688);
        float _700 = rsqrt(_692);
        float _702 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].y, _696);
        float _704 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].z, _698);
        float _706 = _672 * _700;
        float _708 = _678 * _700;
        float _710 = _668 * _700;
        float _712 = _706 * _706;
        float _714 = fma(_708, _708, _712);
        float _716 = rsqrt(_714);
        float _718 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].x, _690);
        float _720 = _706 * _716;
        float _722 = _708 * _716;
        float _724 = -_720;
        float _726 = _706 * _724;
        float _728 = -_720;
        float _730 = _710 * _728;
        float _732 = -_720;
        float _734 = (-0.0) + _732;
        float _736 = -_710;
        float _738 = fma(_736, _722, -0.0);
        float _740 = -_726;
        float _742 = fma(_708, _722, _740);
        _608 = _742;
        _610 = _730;
        _612 = _738;
        _614 = 0.0;
        _616 = _722;
        _618 = _734;
        _620 = _710;
        _622 = _706;
        _624 = _708;
        _626 = _702;
        _628 = _718;
        _630 = _704;
    }
    _632 = false;
    float _744 = _608;
    float _746 = _610;
    float _748 = _612;
    float _750 = _614;
    float _752 = _616;
    float _754 = _618;
    float _756 = _620;
    float _758 = _622;
    float _760 = _624;
    float _762 = _626;
    float _764 = _628;
    float _766 = _630;
    float _768 = in.m_31.y;
    float _770 = in.m_35.x;
    float _772 = in.m_35.y;
    float _774 = in.m_35.z;
    float _776 = in.m_37.x;
    float _778 = in.m_37.y;
    float _780 = in.m_37.z;
    bool _782 = _768 > 0.0;
    float _784 = _768;
    if (!_782)
    {
        float _786 = in.m_33.x;
        _784 = _786;
    }
    float _788 = _784;
    bool _790 = !_782;
    float _792 = _788;
    if (!_790)
    {
        float _794 = in.m_33.x;
        float _796 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
        float _798 = (-0.0) + _796;
        float _800 = fma(_74, -20.0, _798);
        float _802 = fma(_800, 0.100000001490116119384765625, 1.0);
        float _804 = precise::clamp(_802, 0.0, 1.0);
        int _806 = ~_362;
        float _808 = (_806 != 0) ? _804 : 0.0;
        float _810 = _808 * _372;
        float _812 = _392 * _808;
        float _814 = _808 * _794;
        _400 = _810;
        _792 = _814;
        _402 = _812;
    }
    float _816 = _400;
    float _818 = _792;
    float _820 = _402;
    float _822 = _744 * _816;
    float _824 = _746 * _816;
    float _826 = _748 * _816;
    float _828 = fma(_750, _818, _822);
    float _830 = fma(_752, _818, _824);
    float _832 = fma(_754, _818, _826);
    float _834 = _746 * _772;
    float _836 = fma(_756, _820, _828);
    float _838 = fma(_758, _820, _830);
    float _840 = fma(_760, _820, _832);
    float _842 = _744 * _772;
    float _844 = _836 + _762;
    float _846 = _838 + _764;
    float _848 = _840 + _766;
    float _850 = _748 * _772;
    float _852 = _844 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _854 = _844 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _856 = _746 * _778;
    float _858 = _744 * _778;
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[2].x, _852);
    float _862 = fma(_752, _770, _834);
    float _864 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[0].x, _854);
    float _866 = fma(_750, _770, _842);
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[2].z, _860);
    float _870 = _748 * _778;
    float _872 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[0].z, _864);
    float _874 = fma(_752, _776, _856);
    float _876 = _868 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _878 = fma(_750, _776, _858);
    float _880 = _872 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _882 = fma(_754, _776, _870);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _886 = _876 + _884;
    float _888 = _844 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _892 = _880 + _890;
    float _894 = fma(_756, _774, _866);
    float _896 = _886 * _886;
    float _898 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[1].x, _888);
    float _900 = fma(_754, _770, _850);
    float _902 = fma(_758, _774, _862);
    float _904 = fma(_892, _892, _896);
    float _906 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[1].z, _898);
    float _908 = _894 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _910 = fma(_760, _774, _900);
    float _912 = sqrt(_904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _916 = fma(_756, _780, _878);
    float _918 = fma(_760, _780, _882);
    float _920 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[1].x, _908);
    float _922 = _914 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _924 = _894 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _926 = fma(_758, _780, _874);
    float _928 = _894 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _930 = fma(_880, (*spvDescriptorSet0.vp_c4)._m0[2].x, _922);
    float _932 = _916 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[1].z, _920);
    float _936 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[0].x, _924);
    float _938 = _916 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _940 = _916 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _942 = fma(_876, (*spvDescriptorSet0.vp_c4)._m0[2].z, _930);
    bool _944 = _912 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _946 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[2].x, _928);
    float _948 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[0].x, _932);
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[1].x, _938);
    float _952 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[2].x, _940);
    float _954 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[0].z, _936);
    float _956 = _934 * _934;
    float _958 = _942 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _960 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[2].z, _946);
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[0].z, _948);
    float _964 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[1].z, _950);
    float _966 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[2].z, _952);
    float _968 = fma(_954, _954, _956);
    float _970 = _952;
    float _972 = _898;
    float _974 = _950;
    float _976 = _956;
    if (!_944)
    {
        _970 = _958;
    }
    float _978 = _970;
    float _980 = _978;
    if (!_944)
    {
        _972 = _880;
    }
    float _982 = _972;
    float _984 = _982;
    if (!_944)
    {
        _974 = _914;
    }
    float _986 = _974;
    float _988 = _986;
    if (!_944)
    {
        _976 = _876;
    }
    float _990 = _976;
    bool _992 = !_944;
    float _994 = _990;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _998 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1000 = _912 + _998;
        float _1002 = _914 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1004 = rsqrt(_904);
        float _1006 = _1000 * _996;
        float _1008 = _1006 * 0.15915493667125701904296875;
        float _1010 = _1008 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        float _1014 = _1008 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 + (-1.0);
        float _1020 = fma(_1016, _1002, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1022 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1024 = _1004 * _1020;
        float _1026 = fma(_914, _1012, _1022);
        float _1028 = fma(_892, _1024, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1030 = _1026 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1032 = fma(_886, _1024, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1034 = fma(_1028, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1030);
        float _1036 = fma(_1032, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1034);
        float _1038 = _1036 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _988 = _1026;
        _984 = _1028;
        _994 = _1032;
        _980 = _1038;
    }
    float _1040 = _988;
    float _1042 = _984;
    float _1044 = _994;
    float _1046 = _980;
    float _1048 = _964 * _964;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1054 = fma(_960, _960, _968);
    float _1056 = fma(_962, _962, _1048);
    float _1058 = fma(_1042, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1050);
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1052);
    float _1062 = fma(_966, _966, _1056);
    float _1064 = rsqrt(_1054);
    float _1066 = fma(_1044, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1058);
    float _1068 = fma(_1044, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1060);
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _1072 = _1070 != 0;
    float _1074 = _1066 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1078 = rsqrt(_1062);
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1080);
    float _1090 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1082);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1084);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1086);
    float _1096 = _934 * _1064;
    float _1098 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1088);
    float _1100 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1090);
    float _1102 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1092);
    float _1104 = _960 * _1064;
    float _1106 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1094);
    float _1108 = _954 * _1064;
    float _1110 = _962 * _1078;
    float _1112 = _964 * _1078;
    float _1114 = _966 * _1078;
    float _1116 = _1098 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1118 = _1100 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1120 = _1102 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1122 = _1106 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1124 = !_1072;
    float _1126;
    float _1128;
    float _1130;
    int _1132;
    int _1134;
    int _1136;
    int _1138;
    int _1140;
    int _1142;
    int _1144;
    int _1146;
    int _1148;
    float _1150;
    float _1152;
    float _1154;
    float _1156;
    float _1158;
    float _1160;
    float _1162;
    float _1164;
    float _1166;
    float _1168;
    float _1170;
    float _1172;
    float _1174;
    float _1176;
    float _1178;
    float _1180;
    float _1182;
    float _1184;
    float _1186;
    float _1188;
    if (!_1124)
    {
        _1126 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _1128 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _1130 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _1150 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _1152 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _1154 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1156 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1158 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _1160 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1162 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1164 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1166 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1168 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1170 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1172 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1174 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1176 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1178 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1180 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1182 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1184 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1186 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1188 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1190 = true;
    }
    else
    {
        float _1192 = fma(_880, 6.2500002968590706586837768554688e-05, 0.5);
        float _1194 = fma(_876, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3351 = float3(_1192, _1194, float(0));
        float3 _3355 = select(_3351, float3(0.0), isnan(_3351));
        float4 _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3355.xy, uint(rint(_3355.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3355.xy, uint(rint(_3355.z)), level(0.0)).xyzw;
        float _1199 = _1197.x;
        float _1201 = _1197.y;
        float _1203 = _1197.z;
        float _1205 = _1197.w;
        float3 _3370 = float3(_1192, _1194, float(1));
        float3 _3372 = select(_3370, float3(0.0), isnan(_3370));
        float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3372.xy, uint(rint(_3372.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3372.xy, uint(rint(_3372.z)), level(0.0)).xyzw;
        float _1209 = _1207.x;
        float _1211 = _1207.y;
        float _1213 = _1207.z;
        float _1215 = _1207.w;
        float3 _3387 = float3(_1192, _1194, float(2));
        float3 _3389 = select(_3387, float3(0.0), isnan(_3387));
        float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3389.xy, uint(rint(_3389.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3389.xy, uint(rint(_3389.z)), level(0.0)).xyzw;
        float _1219 = _1217.x;
        float _1221 = _1217.y;
        float _1223 = _1217.z;
        float _1225 = _1217.w;
        float3 _3404 = float3(_1192, _1194, float(3));
        float3 _3406 = select(_3404, float3(0.0), isnan(_3404));
        float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3406.xy, uint(rint(_3406.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3406.xy, uint(rint(_3406.z)), level(0.0)).xyzw;
        float _1229 = _1227.x;
        float _1231 = _1227.y;
        float _1233 = _1227.z;
        float _1235 = _1227.w;
        float3 _3422 = float3(_1192, _1194, float(4));
        float3 _3424 = select(_3422, float3(0.0), isnan(_3422));
        float4 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3424.xy, uint(rint(_3424.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3424.xy, uint(rint(_3424.z)), level(0.0)).xyzw;
        float _1239 = _1237.x;
        float _1241 = _1237.y;
        float _1243 = _1237.z;
        float _1245 = _1237.w;
        float3 _3440 = float3(_1192, _1194, float(5));
        float3 _3442 = select(_3440, float3(0.0), isnan(_3440));
        float4 _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3442.xy, uint(rint(_3442.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3442.xy, uint(rint(_3442.z)), level(0.0)).xyzw;
        float _1249 = _1247.x;
        float _1251 = _1247.y;
        float _1253 = _1247.z;
        float _1255 = _1247.w;
        float3 _3458 = float3(_1192, _1194, float(6));
        float3 _3460 = select(_3458, float3(0.0), isnan(_3458));
        float4 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3460.xy, uint(rint(_3460.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3460.xy, uint(rint(_3460.z)), level(0.0)).xyzw;
        float _1259 = _1257.x;
        float _1261 = _1257.y;
        float _1263 = _1257.z;
        float _1265 = _1257.w;
        float3 _3475 = float3(_1192, _1194, float(7));
        float3 _3477 = select(_3475, float3(0.0), isnan(_3475));
        float4 _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3477.xy, uint(rint(_3477.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3477.xy, uint(rint(_3477.z)), level(0.0)).xyzw;
        float _1269 = _1267.x;
        float _1271 = _1267.y;
        float _1273 = _1267.z;
        float _1275 = _1267.w;
        _1126 = _1229;
        _1128 = _1231;
        _1130 = _1233;
        _1132 = as_type<int>(_1235);
        _1134 = as_type<int>(_1239);
        _1136 = as_type<int>(_1241);
        _1138 = as_type<int>(_1243);
        _1140 = as_type<int>(_1245);
        _1142 = as_type<int>(_1249);
        _1144 = as_type<int>(_1251);
        _1146 = as_type<int>(_1253);
        _1148 = as_type<int>(_1255);
        _1150 = _1261;
        _1152 = _1271;
        _1154 = _1259;
        _1156 = _1269;
        _1158 = _1205;
        _1160 = _1209;
        _1162 = _1263;
        _1164 = _1273;
        _1166 = _1211;
        _1168 = _1199;
        _1170 = _1265;
        _1172 = _1275;
        _1174 = _1201;
        _1176 = _1203;
        _1178 = _1213;
        _1180 = _1215;
        _1182 = _1219;
        _1184 = _1221;
        _1186 = _1223;
        _1188 = _1225;
    }
    _1190 = false;
    float _1277 = _1126;
    float _1279 = _1128;
    float _1281 = _1130;
    int _1283 = _1132;
    int _1285 = _1134;
    int _1287 = _1136;
    int _1289 = _1138;
    int _1291 = _1140;
    int _1293 = _1142;
    int _1295 = _1144;
    int _1297 = _1146;
    int _1299 = _1148;
    float _1301 = _1150;
    float _1303 = _1152;
    float _1305 = _1154;
    float _1307 = _1156;
    float _1309 = _1158;
    float _1311 = _1160;
    float _1313 = _1162;
    float _1315 = _1164;
    float _1317 = _1166;
    float _1319 = _1168;
    float _1321 = _1170;
    float _1323 = _1172;
    float _1325 = _1174;
    float _1327 = _1176;
    float _1329 = _1178;
    float _1331 = _1180;
    float _1333 = _1182;
    float _1335 = _1184;
    float _1337 = _1186;
    float _1339 = _1188;
    float _1341 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1343 = _914 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1347 = _880 + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1351 = _876 + _1349;
    float _1353 = in.m_39.x;
    float _1355 = _1343 * _1343;
    float _1357 = _1277 * 0.88622701168060302734375;
    float _1359 = _1279 * 0.88622701168060302734375;
    float _1361 = in.m_39.y;
    float _1363 = fma(_1347, _1347, _1355);
    float _1365 = _1281 * 0.88622701168060302734375;
    float _1367 = _1072 ? as_type<float>(_1283) : 0.0;
    float _1369 = in.m_41.y;
    float _1371 = fma(_1351, _1351, _1363);
    float _1373 = _1072 ? as_type<float>(_1285) : 0.0;
    float _1375 = in.m_37.w;
    float _1377 = _1072 ? as_type<float>(_1287) : 0.0;
    float _1379 = rsqrt(_1371);
    float _1381 = _1072 ? _1357 : 0.0;
    float _1383 = _1072 ? _1359 : 0.0;
    float _1385 = _1072 ? _1365 : 0.0;
    float _1387 = _1072 ? as_type<float>(_1289) : 0.0;
    float _1389 = _1072 ? as_type<float>(_1291) : 0.0;
    float _1391 = _1072 ? as_type<float>(_1293) : 0.0;
    float _1393 = _1072 ? as_type<float>(_1295) : 0.0;
    float _1395 = _1072 ? as_type<float>(_1297) : 0.0;
    float _1397 = _1343 * _1379;
    float _1399 = _1347 * _1379;
    float _1401 = _1351 * _1379;
    float _1403 = _1072 ? as_type<float>(_1299) : 0.0;
    float _1405 = _1096 * _1397;
    float _1407 = fma(_1108, _1399, _1405);
    float _1409 = in.m_41.x;
    float _1411 = fma(_1104, _1401, _1407);
    out.m_44.x = _1108;
    out.m_44.y = _1096;
    out.m_44.z = _1104;
    float _1413 = _1411 + _1411;
    out.m_46.x = _880;
    out.m_46.y = _914;
    out.m_46.z = _876;
    float _1415 = -_1413;
    float _1417 = fma(_1096, _1415, _1397);
    out.m_48.x = _1110;
    out.m_48.y = _1112;
    out.m_48.z = _1114;
    float _1419 = _1417 * 1.02332699298858642578125;
    float _1421 = -_1413;
    float _1423 = fma(_1104, _1421, _1401);
    float _1425 = -_1413;
    float _1427 = fma(_1108, _1425, _1399);
    float _1429 = _1419 * _1301;
    float _1431 = _1419 * _1303;
    float _1433 = _1423 * 1.02332699298858642578125;
    float _1435 = _1427 * 1.02332699298858642578125;
    float _1437 = fma(_1305, 0.88622701168060302734375, _1429);
    float _1439 = fma(_1307, 0.88622701168060302734375, _1431);
    float _1441 = _1419 * _1309;
    float _1443 = _1419 * _1311;
    float _1445 = fma(_1433, _1313, _1437);
    float _1447 = fma(_1433, _1315, _1439);
    float _1449 = _1419 * _1317;
    float _1451 = fma(_1319, 0.88622701168060302734375, _1441);
    float _1453 = fma(_1435, _1321, _1445);
    float _1455 = fma(_1435, _1323, _1447);
    float _1457 = fma(_1325, 0.88622701168060302734375, _1443);
    float _1459 = fma(_1327, 0.88622701168060302734375, _1449);
    float _1461 = fma(_1367, _1419, _1381);
    float _1463 = precise::max(0.0, _1453);
    float _1465 = fma(_1373, _1419, _1383);
    float _1467 = precise::max(0.0, _1455);
    float _1469 = fma(_1377, _1419, _1385);
    float _1471 = fma(_1433, _1329, _1451);
    float _1473 = fma(_1433, _1331, _1457);
    float _1475 = fma(_1433, _1333, _1459);
    float _1477 = _1463 * 0.31830990314483642578125;
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = _1467 * 0.31830990314483642578125;
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = fma(_1387, _1433, _1461);
    float _1487 = fma(_1389, _1433, _1465);
    float _1489 = fma(_1391, _1433, _1469);
    float _1491 = fma(_1435, _1335, _1471);
    float _1493 = fma(_1435, _1337, _1473);
    float _1495 = fma(_1435, _1339, _1475);
    float _1497 = _1479 * 0.88622701168060302734375;
    float _1499 = -_1483;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1393, _1435, _1485);
    float _1505 = fma(_1395, _1435, _1487);
    float _1507 = fma(_1403, _1435, _1489);
    float _1509 = precise::max(0.0, _1491);
    float _1511 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1513 = precise::max(0.0, _1493);
    float _1515 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1517 = precise::max(0.0, _1495);
    float _1519 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1483);
    float _1521 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1523 = precise::max(0.0, _1503);
    float _1525 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1511);
    float _1527 = precise::max(0.0, _1505);
    float _1529 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1515);
    float _1531 = precise::max(0.0, _1507);
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1535 = -_958;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1539 = _1535 + _1537;
    float _1541 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1521);
    out.gl_Position.x = _1116;
    out.gl_Position.y = _1118;
    out.gl_Position.z = _1120;
    out.gl_Position.w = _1122;
    float _1543 = fma(_1523, _1533, _1525);
    float _1545 = fma(_1527, _1533, _1529);
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1549 = fma(_1531, _1533, _1541);
    out.m_50.x = _1353;
    out.m_50.y = _1361;
    out.m_52.w = _958;
    out.m_54.z = _1409;
    out.m_54.w = _1369;
    out.m_48.w = _1375;
    out.m_44.w = _1547;
    out.m_52.x = _1543;
    out.m_52.y = _1545;
    out.m_52.z = _1549;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _632 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    uint _68 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].w)) >> uint(16)));
    int _71 = int(_68) & 65535;
    float _74 = in.m_31.x;
    uint _76 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(8)));
    float _78 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].x))).x;
    float _80 = (-0.0) + _78;
    int _82 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w) & 255;
    float _84 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].z))).x;
    float _86 = (-0.0) + _84;
    uint _88 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].x)) >> uint(16)));
    int _90 = int(_88) & 65535;
    int _92 = int(_76) & 255;
    uint _94 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(16)));
    float _96 = float(_82);
    uint _98 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(24)));
    float _100 = float(_92);
    uint _102 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].y)) >> uint(16)));
    int _104 = int(_102) & 65535;
    float _106 = _96 * 0.0039215688593685626983642578125;
    float _108 = float2(as_type<half2>(uint(_71))).x;
    float _110 = (-0.0) + _108;
    uint _112 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].z)) >> uint(16)));
    int _114 = int(_112) & 65535;
    float _116 = abs(_110);
    float _118 = precise::max(_116, 0.100000001490116119384765625);
    float _120 = float2(as_type<half2>(uint(_90))).x;
    float _122 = (-0.0) + _120;
    float _124 = precise::min(_118, 20.0);
    float _126 = _124 * 0.0500000007450580596923828125;
    float _128 = float2(as_type<half2>(uint(_104))).x;
    float _130 = (-0.0) + _128;
    bool _134 = _126 >= _74;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan(_74);
    bool _142 = _138 || _140;
    float _144 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].y))).x;
    float _146 = (-0.0) + _144;
    float _148 = float2(as_type<half2>(uint(_114))).x;
    float _150 = (-0.0) + _148;
    int _152 = 0;
    float _154 = _124;
    if (!_142)
    {
        _152 = -1;
    }
    int _156 = _152;
    float _158 = 0.0;
    int _160 = _156;
    int _162 = _156;
    if (!_142)
    {
        _158 = 1.0;
    }
    float _164 = _158;
    bool _166 = !_142;
    float _168 = _164;
    float _170 = _164;
    if (!_166)
    {
        float _172 = 1.0 / _124;
        float _174 = _172 * 20.0;
        float _176 = _174 * _74;
        float _178 = precise::clamp(_176, 0.0, 1.0);
        bool _180 = _178 > 0.20000000298023223876953125;
        bool _182 = isnan(_178);
        bool _184 = _180 || _182;
        bool _186 = isnan(0.20000000298023223876953125);
        bool _188 = _184 || _186;
        float _190 = _174;
        if (!_188)
        {
            float _192 = _178 * 5.0;
            _190 = _192;
        }
        float _194 = _190;
        float _196 = _194;
        if (!_188)
        {
            _160 = 0;
        }
        int _198 = _160;
        int _200 = _198;
        _162 = _198;
        if (!_188)
        {
            float _202 = _106 * _194;
            _168 = _202;
        }
        float _204 = _168;
        bool _206 = !_188;
        float _208 = _204;
        _170 = _204;
        if (!_206)
        {
            bool _210 = _178 > 0.4000000059604644775390625;
            bool _212 = isnan(_178);
            bool _214 = _210 || _212;
            bool _216 = isnan(0.4000000059604644775390625);
            bool _218 = _214 || _216;
            if (!_218)
            {
                _196 = 1.0;
            }
            float _220 = _196;
            if (!_218)
            {
                float _222 = -_96;
                float _224 = _222 + _100;
                _154 = _224;
            }
            float _226 = _154;
            float _228 = _226;
            if (!_218)
            {
                _200 = 0;
            }
            int _230 = _200;
            int _232 = _230;
            _162 = _230;
            if (!_218)
            {
                float _234 = -_220;
                float _236 = fma(_178, 5.0, _234);
                _208 = _236;
            }
            float _238 = _208;
            float _240 = _238;
            if (!_218)
            {
                float _242 = fma(_238, _226, _96);
                _240 = _242;
            }
            float _244 = _240;
            float _246 = _244;
            if (!_218)
            {
                float _248 = _244 * 0.0039215688593685626983642578125;
                _246 = _248;
            }
            float _250 = _246;
            bool _252 = !_218;
            float _254 = _250;
            _170 = _250;
            if (!_252)
            {
                bool _256 = _178 > 0.60000002384185791015625;
                bool _258 = isnan(_178);
                bool _260 = _256 || _258;
                bool _262 = isnan(0.60000002384185791015625);
                bool _264 = _260 || _262;
                int _266 = int(_94) & 255;
                float _268 = float(_266);
                float _270 = 0.0;
                float _272 = _268;
                if (!_264)
                {
                    _270 = 4.999999523162841796875;
                }
                float _274 = _270;
                float _276 = _274;
                if (!_264)
                {
                    float _278 = -_100;
                    float _280 = _278 + _268;
                    _254 = _280;
                }
                float _282 = _254;
                float _284 = _282;
                if (!_264)
                {
                    _232 = 0;
                }
                int _286 = _232;
                _162 = _286;
                if (!_264)
                {
                    float _288 = fma(_178, _274, -1.99999988079071044921875);
                    _276 = _288;
                }
                float _290 = _276;
                float _292 = _290;
                if (!_264)
                {
                    float _294 = fma(_290, _282, _100);
                    _284 = _294;
                }
                float _296 = _284;
                float _298 = _296;
                if (!_264)
                {
                    float _300 = _296 * 0.0039215688593685626983642578125;
                    _298 = _300;
                }
                float _302 = _298;
                bool _304 = !_264;
                _170 = _302;
                if (!_304)
                {
                    bool _306 = _178 > 0.800000011920928955078125;
                    bool _308 = isnan(_178);
                    bool _310 = _306 || _308;
                    bool _312 = isnan(0.800000011920928955078125);
                    bool _314 = _310 || _312;
                    float _316 = float(int(_98));
                    float _318 = _316;
                    _162 = 0;
                    if (!_314)
                    {
                        float _320 = fma(_178, 5.000000476837158203125, -3.000000476837158203125);
                        _228 = _320;
                    }
                    float _322 = _228;
                    float _324 = _322;
                    if (!_314)
                    {
                        float _326 = -_268;
                        float _328 = _326 + _316;
                        _292 = _328;
                    }
                    float _330 = _292;
                    float _332 = 0.0;
                    float _334 = _330;
                    if (_314)
                    {
                        float _336 = _316 * 0.0039215688593685626983642578125;
                        _332 = _336;
                    }
                    float _338 = _332;
                    if (!_314)
                    {
                        float _340 = fma(_322, _330, _268);
                        _334 = _340;
                    }
                    float _342 = _334;
                    if (_314)
                    {
                        float _344 = fma(_178, 5.000000476837158203125, -4.000000476837158203125);
                        _272 = _344;
                    }
                    float _346 = _272;
                    if (_314)
                    {
                        float _348 = -_338;
                        float _350 = _348 + 1.0;
                        _324 = _350;
                    }
                    float _352 = _324;
                    if (!_314)
                    {
                        float _354 = _342 * 0.0039215688593685626983642578125;
                        _318 = _354;
                    }
                    float _356 = _318;
                    _170 = _356;
                    if (_314)
                    {
                        float _358 = fma(_346, _352, _338);
                        _170 = _358;
                    }
                }
            }
        }
    }
    float _360 = _170;
    int _362 = _162;
    float _364 = -_96;
    float _366 = _364 + _100;
    float _368 = in.m_33.z;
    float _370 = fma(_366, 0.0019607846625149250030517578125, _106);
    float _372 = in.m_33.y;
    bool _374 = _360 >= _370;
    bool _376 = isnan(_360);
    bool _378 = _374 || _376;
    bool _380 = isnan(_370);
    bool _382 = _378 || _380;
    float _384 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
    bool _386 = 0.0 > _384;
    bool _388 = !_382;
    bool _390 = _386 && _388;
    float _392 = fma(_74, -20.0, _368);
    bool _394 = _372 >= 0.0;
    bool _396 = _394 && _390;
    bool _398 = !_396;
    float _400 = _372;
    float _402 = _392;
    float _608;
    float _610;
    float _612;
    float _614;
    float _616;
    float _618;
    float _620;
    float _622;
    float _624;
    float _626;
    float _628;
    float _630;
    if (!_398)
    {
        float _404 = _370 * _370;
        float _406 = -_370;
        float _408 = _406 + 1.0;
        float _410 = fma(_370, -3.0, 3.0);
        float _412 = _404 * 3.0;
        float _414 = _370 * _404;
        float _416 = _370 * _410;
        float _418 = _408 * _408;
        float _420 = _370 * _416;
        float _422 = _416 * 2.0;
        float _424 = _408 * _416;
        float _426 = 1.0 / _370;
        float _428 = _150 * _420;
        float _430 = -_412;
        float _432 = _430 + _422;
        float _434 = _122 * _420;
        float _436 = -_422;
        float _438 = fma(_418, 3.0, _436);
        float _440 = fma(_86, _424, _428);
        float _442 = _122 * _432;
        float _444 = _150 * _432;
        float _446 = _130 * _432;
        float _448 = fma(_80, _424, _434);
        float _450 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].z, _440);
        float _452 = fma(_80, _438, _442);
        float _454 = fma(_146, _438, _446);
        float _456 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].x, _448);
        float _458 = _450 * _450;
        float _460 = fma(_86, _438, _444);
        float _462 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].y, _454);
        float _464 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].x, _452);
        float _466 = fma(_456, _456, _458);
        float _468 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].z, _460);
        float _470 = _462 * _462;
        float _472 = _426 * _360;
        float _474 = _130 * _420;
        float _476 = sqrt(_466);
        float _478 = fma(_464, _464, _470);
        float _480 = fma(_472, -3.0, 3.0);
        float _482 = fma(_146, _424, _474);
        float _484 = _472 * _472;
        float _486 = fma(_468, _468, _478);
        float _488 = _472 * _480;
        float _490 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].y, _482);
        float _492 = -_472;
        float _494 = _492 + 1.0;
        float _496 = _484 * 3.0;
        float _498 = _488 * 2.0;
        float _500 = rsqrt(_486);
        float _502 = -_496;
        float _504 = _502 + _498;
        float _506 = _476 * 0.20000000298023223876953125;
        float _508 = precise::max(_506, 0.100000001490116119384765625);
        float _510 = _500 * _508;
        float _512 = _494 * _494;
        float _514 = _494 * _488;
        float _516 = -_510;
        float _518 = fma(_462, _516, _490);
        float _520 = -_498;
        float _522 = fma(_512, 3.0, _520);
        float _524 = -_510;
        float _526 = fma(_464, _524, _456);
        float _528 = -_510;
        float _530 = fma(_468, _528, _450);
        float _532 = _518 * _504;
        float _534 = fma(_522, 0.00999999977648258209228515625, _532);
        float _536 = _456 * _496;
        float _538 = fma(_490, _496, _534);
        float _540 = fma(_526, _504, _536);
        float _542 = _450 * _496;
        float _544 = _538 * _538;
        float _546 = fma(_530, _504, _542);
        float _548 = fma(_540, _540, _544);
        float _550 = fma(_546, _546, _548);
        float _552 = rsqrt(_550);
        float _554 = _538 * _552;
        float _556 = _546 * _552;
        float _558 = _554 * _554;
        float _560 = fma(_556, _556, _558);
        float _562 = _472 * _488;
        float _564 = _472 * _484;
        float _566 = rsqrt(_560);
        float _568 = _518 * _562;
        float _570 = _456 * _564;
        float _572 = _450 * _564;
        float _574 = fma(_514, 0.00999999977648258209228515625, _568);
        float _576 = _540 * _552;
        float _578 = fma(_526, _562, _570);
        float _580 = fma(_530, _562, _572);
        float _582 = fma(_490, _564, _574);
        float _584 = _554 * _566;
        float _586 = _556 * _566;
        float _588 = -_584;
        float _590 = _554 * _588;
        float _592 = -_584;
        float _594 = _576 * _592;
        float _596 = -_584;
        float _598 = (-0.0) + _596;
        float _600 = -_576;
        float _602 = fma(_600, _586, -0.0);
        float _604 = -_590;
        float _606 = fma(_556, _586, _604);
        _608 = _586;
        _610 = 0.0;
        _612 = _598;
        _614 = _594;
        _616 = _606;
        _618 = _602;
        _620 = _554;
        _622 = _576;
        _624 = _556;
        _626 = _582;
        _628 = _578;
        _630 = _580;
        _632 = true;
    }
    else
    {
        float _634 = _360 * _360;
        float _636 = fma(_360, -3.0, 3.0);
        float _638 = _634 * 3.0;
        float _640 = _636 * _360;
        float _642 = -_360;
        float _644 = _642 + 1.0;
        float _646 = _640 * 2.0;
        float _648 = _644 * _644;
        float _650 = -_638;
        float _652 = _650 + _646;
        float _654 = -_646;
        float _656 = fma(_648, 3.0, _654);
        float _658 = _130 * _652;
        float _660 = _122 * _652;
        float _662 = _150 * _652;
        float _664 = fma(_146, _656, _658);
        float _666 = fma(_80, _656, _660);
        float _668 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].y, _664);
        float _670 = fma(_86, _656, _662);
        float _672 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].x, _666);
        float _674 = _640 * _360;
        float _676 = _668 * _668;
        float _678 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].z, _670);
        float _680 = _644 * _640;
        float _682 = _122 * _674;
        float _684 = fma(_672, _672, _676);
        float _686 = _130 * _674;
        float _688 = _150 * _674;
        float _690 = fma(_80, _680, _682);
        float _692 = fma(_678, _678, _684);
        float _694 = _634 * _360;
        float _696 = fma(_146, _680, _686);
        float _698 = fma(_86, _680, _688);
        float _700 = rsqrt(_692);
        float _702 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].y, _696);
        float _704 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].z, _698);
        float _706 = _672 * _700;
        float _708 = _678 * _700;
        float _710 = _668 * _700;
        float _712 = _706 * _706;
        float _714 = fma(_708, _708, _712);
        float _716 = rsqrt(_714);
        float _718 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].x, _690);
        float _720 = _706 * _716;
        float _722 = _708 * _716;
        float _724 = -_720;
        float _726 = _706 * _724;
        float _728 = -_720;
        float _730 = _710 * _728;
        float _732 = -_720;
        float _734 = (-0.0) + _732;
        float _736 = -_710;
        float _738 = fma(_736, _722, -0.0);
        float _740 = -_726;
        float _742 = fma(_708, _722, _740);
        _608 = _742;
        _610 = _730;
        _612 = _738;
        _614 = 0.0;
        _616 = _722;
        _618 = _734;
        _620 = _710;
        _622 = _706;
        _624 = _708;
        _626 = _702;
        _628 = _718;
        _630 = _704;
    }
    _632 = false;
    float _744 = _608;
    float _746 = _610;
    float _748 = _612;
    float _750 = _614;
    float _752 = _616;
    float _754 = _618;
    float _756 = _620;
    float _758 = _622;
    float _760 = _624;
    float _762 = _626;
    float _764 = _628;
    float _766 = _630;
    float _768 = in.m_31.y;
    float _770 = in.m_35.x;
    float _772 = in.m_35.y;
    float _774 = in.m_35.z;
    float _776 = in.m_37.x;
    float _778 = in.m_37.y;
    float _780 = in.m_37.z;
    bool _782 = _768 > 0.0;
    float _784 = _768;
    if (!_782)
    {
        float _786 = in.m_33.x;
        _784 = _786;
    }
    float _788 = _784;
    bool _790 = !_782;
    float _792 = _788;
    if (!_790)
    {
        float _794 = in.m_33.x;
        float _796 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
        float _798 = (-0.0) + _796;
        float _800 = fma(_74, -20.0, _798);
        float _802 = fma(_800, 0.100000001490116119384765625, 1.0);
        float _804 = precise::clamp(_802, 0.0, 1.0);
        int _806 = ~_362;
        float _808 = (_806 != 0) ? _804 : 0.0;
        float _810 = _808 * _372;
        float _812 = _392 * _808;
        float _814 = _808 * _794;
        _400 = _810;
        _792 = _814;
        _402 = _812;
    }
    float _816 = _400;
    float _818 = _792;
    float _820 = _402;
    float _822 = _744 * _816;
    float _824 = _746 * _816;
    float _826 = _748 * _816;
    float _828 = fma(_750, _818, _822);
    float _830 = fma(_752, _818, _824);
    float _832 = fma(_754, _818, _826);
    float _834 = _746 * _772;
    float _836 = fma(_756, _820, _828);
    float _838 = fma(_758, _820, _830);
    float _840 = fma(_760, _820, _832);
    float _842 = _744 * _772;
    float _844 = _836 + _762;
    float _846 = _838 + _764;
    float _848 = _840 + _766;
    float _850 = _748 * _772;
    float _852 = _844 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _854 = _844 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _856 = _746 * _778;
    float _858 = _744 * _778;
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[2].x, _852);
    float _862 = fma(_752, _770, _834);
    float _864 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[0].x, _854);
    float _866 = fma(_750, _770, _842);
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[2].z, _860);
    float _870 = _748 * _778;
    float _872 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[0].z, _864);
    float _874 = fma(_752, _776, _856);
    float _876 = _868 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _878 = fma(_750, _776, _858);
    float _880 = _872 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _882 = fma(_754, _776, _870);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _886 = _876 + _884;
    float _888 = _844 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _892 = _880 + _890;
    float _894 = fma(_756, _774, _866);
    float _896 = _886 * _886;
    float _898 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[1].x, _888);
    float _900 = fma(_754, _770, _850);
    float _902 = fma(_758, _774, _862);
    float _904 = fma(_892, _892, _896);
    float _906 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[1].z, _898);
    float _908 = _894 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _910 = fma(_760, _774, _900);
    float _912 = sqrt(_904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _916 = fma(_756, _780, _878);
    float _918 = fma(_760, _780, _882);
    float _920 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[1].x, _908);
    float _922 = _914 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _924 = _894 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _926 = fma(_758, _780, _874);
    float _928 = _894 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _930 = fma(_880, (*spvDescriptorSet0.vp_c4)._m0[2].x, _922);
    float _932 = _916 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[1].z, _920);
    float _936 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[0].x, _924);
    float _938 = _916 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _940 = _916 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _942 = fma(_876, (*spvDescriptorSet0.vp_c4)._m0[2].z, _930);
    bool _944 = _912 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _946 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[2].x, _928);
    float _948 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[0].x, _932);
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[1].x, _938);
    float _952 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[2].x, _940);
    float _954 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[0].z, _936);
    float _956 = _934 * _934;
    float _958 = _942 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _960 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[2].z, _946);
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[0].z, _948);
    float _964 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[1].z, _950);
    float _966 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[2].z, _952);
    float _968 = fma(_954, _954, _956);
    float _970 = _952;
    float _972 = _898;
    float _974 = _950;
    float _976 = _956;
    if (!_944)
    {
        _970 = _958;
    }
    float _978 = _970;
    float _980 = _978;
    if (!_944)
    {
        _972 = _880;
    }
    float _982 = _972;
    float _984 = _982;
    if (!_944)
    {
        _974 = _914;
    }
    float _986 = _974;
    float _988 = _986;
    if (!_944)
    {
        _976 = _876;
    }
    float _990 = _976;
    bool _992 = !_944;
    float _994 = _990;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _998 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1000 = _912 + _998;
        float _1002 = _914 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1004 = rsqrt(_904);
        float _1006 = _1000 * _996;
        float _1008 = _1006 * 0.15915493667125701904296875;
        float _1010 = _1008 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        float _1014 = _1008 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 + (-1.0);
        float _1020 = fma(_1016, _1002, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1022 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1024 = _1004 * _1020;
        float _1026 = fma(_914, _1012, _1022);
        float _1028 = fma(_892, _1024, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1030 = _1026 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1032 = fma(_886, _1024, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1034 = fma(_1028, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1030);
        float _1036 = fma(_1032, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1034);
        float _1038 = _1036 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _988 = _1026;
        _984 = _1028;
        _994 = _1032;
        _980 = _1038;
    }
    float _1040 = _988;
    float _1042 = _984;
    float _1044 = _994;
    float _1046 = _980;
    float _1048 = _964 * _964;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1054 = fma(_960, _960, _968);
    float _1056 = fma(_962, _962, _1048);
    float _1058 = fma(_1042, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1050);
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1052);
    float _1062 = fma(_966, _966, _1056);
    float _1064 = rsqrt(_1054);
    float _1066 = fma(_1044, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1058);
    float _1068 = fma(_1044, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1060);
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _1072 = _1070 != 0;
    float _1074 = _1066 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1078 = rsqrt(_1062);
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1080);
    float _1090 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1082);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1084);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1086);
    float _1096 = _934 * _1064;
    float _1098 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1088);
    float _1100 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1090);
    float _1102 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1092);
    float _1104 = _960 * _1064;
    float _1106 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1094);
    float _1108 = _954 * _1064;
    float _1110 = _962 * _1078;
    float _1112 = _964 * _1078;
    float _1114 = _966 * _1078;
    float _1116 = _1098 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1118 = _1100 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1120 = _1102 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1122 = _1106 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1124 = !_1072;
    float _1126;
    float _1128;
    float _1130;
    int _1132;
    int _1134;
    int _1136;
    int _1138;
    int _1140;
    int _1142;
    int _1144;
    int _1146;
    int _1148;
    float _1150;
    float _1152;
    float _1154;
    float _1156;
    float _1158;
    float _1160;
    float _1162;
    float _1164;
    float _1166;
    float _1168;
    float _1170;
    float _1172;
    float _1174;
    float _1176;
    float _1178;
    float _1180;
    float _1182;
    float _1184;
    float _1186;
    float _1188;
    if (!_1124)
    {
        _1126 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _1128 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _1130 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _1150 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _1152 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _1154 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1156 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1158 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _1160 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1162 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1164 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1166 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1168 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1170 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1172 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1174 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1176 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1178 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1180 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1182 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1184 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1186 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1188 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1190 = true;
    }
    else
    {
        float _1192 = fma(_880, 6.2500002968590706586837768554688e-05, 0.5);
        float _1194 = fma(_876, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3351 = float3(_1192, _1194, float(0));
        float3 _3355 = select(_3351, float3(0.0), isnan(_3351));
        float4 _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3355.xy, uint(rint(_3355.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3355.xy, uint(rint(_3355.z)), level(0.0)).xyzw;
        float _1199 = _1197.x;
        float _1201 = _1197.y;
        float _1203 = _1197.z;
        float _1205 = _1197.w;
        float3 _3370 = float3(_1192, _1194, float(1));
        float3 _3372 = select(_3370, float3(0.0), isnan(_3370));
        float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3372.xy, uint(rint(_3372.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3372.xy, uint(rint(_3372.z)), level(0.0)).xyzw;
        float _1209 = _1207.x;
        float _1211 = _1207.y;
        float _1213 = _1207.z;
        float _1215 = _1207.w;
        float3 _3387 = float3(_1192, _1194, float(2));
        float3 _3389 = select(_3387, float3(0.0), isnan(_3387));
        float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3389.xy, uint(rint(_3389.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3389.xy, uint(rint(_3389.z)), level(0.0)).xyzw;
        float _1219 = _1217.x;
        float _1221 = _1217.y;
        float _1223 = _1217.z;
        float _1225 = _1217.w;
        float3 _3404 = float3(_1192, _1194, float(3));
        float3 _3406 = select(_3404, float3(0.0), isnan(_3404));
        float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3406.xy, uint(rint(_3406.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3406.xy, uint(rint(_3406.z)), level(0.0)).xyzw;
        float _1229 = _1227.x;
        float _1231 = _1227.y;
        float _1233 = _1227.z;
        float _1235 = _1227.w;
        float3 _3422 = float3(_1192, _1194, float(4));
        float3 _3424 = select(_3422, float3(0.0), isnan(_3422));
        float4 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3424.xy, uint(rint(_3424.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3424.xy, uint(rint(_3424.z)), level(0.0)).xyzw;
        float _1239 = _1237.x;
        float _1241 = _1237.y;
        float _1243 = _1237.z;
        float _1245 = _1237.w;
        float3 _3440 = float3(_1192, _1194, float(5));
        float3 _3442 = select(_3440, float3(0.0), isnan(_3440));
        float4 _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3442.xy, uint(rint(_3442.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3442.xy, uint(rint(_3442.z)), level(0.0)).xyzw;
        float _1249 = _1247.x;
        float _1251 = _1247.y;
        float _1253 = _1247.z;
        float _1255 = _1247.w;
        float3 _3458 = float3(_1192, _1194, float(6));
        float3 _3460 = select(_3458, float3(0.0), isnan(_3458));
        float4 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3460.xy, uint(rint(_3460.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3460.xy, uint(rint(_3460.z)), level(0.0)).xyzw;
        float _1259 = _1257.x;
        float _1261 = _1257.y;
        float _1263 = _1257.z;
        float _1265 = _1257.w;
        float3 _3475 = float3(_1192, _1194, float(7));
        float3 _3477 = select(_3475, float3(0.0), isnan(_3475));
        float4 _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3477.xy, uint(rint(_3477.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3477.xy, uint(rint(_3477.z)), level(0.0)).xyzw;
        float _1269 = _1267.x;
        float _1271 = _1267.y;
        float _1273 = _1267.z;
        float _1275 = _1267.w;
        _1126 = _1229;
        _1128 = _1231;
        _1130 = _1233;
        _1132 = as_type<int>(_1235);
        _1134 = as_type<int>(_1239);
        _1136 = as_type<int>(_1241);
        _1138 = as_type<int>(_1243);
        _1140 = as_type<int>(_1245);
        _1142 = as_type<int>(_1249);
        _1144 = as_type<int>(_1251);
        _1146 = as_type<int>(_1253);
        _1148 = as_type<int>(_1255);
        _1150 = _1261;
        _1152 = _1271;
        _1154 = _1259;
        _1156 = _1269;
        _1158 = _1205;
        _1160 = _1209;
        _1162 = _1263;
        _1164 = _1273;
        _1166 = _1211;
        _1168 = _1199;
        _1170 = _1265;
        _1172 = _1275;
        _1174 = _1201;
        _1176 = _1203;
        _1178 = _1213;
        _1180 = _1215;
        _1182 = _1219;
        _1184 = _1221;
        _1186 = _1223;
        _1188 = _1225;
    }
    _1190 = false;
    float _1277 = _1126;
    float _1279 = _1128;
    float _1281 = _1130;
    int _1283 = _1132;
    int _1285 = _1134;
    int _1287 = _1136;
    int _1289 = _1138;
    int _1291 = _1140;
    int _1293 = _1142;
    int _1295 = _1144;
    int _1297 = _1146;
    int _1299 = _1148;
    float _1301 = _1150;
    float _1303 = _1152;
    float _1305 = _1154;
    float _1307 = _1156;
    float _1309 = _1158;
    float _1311 = _1160;
    float _1313 = _1162;
    float _1315 = _1164;
    float _1317 = _1166;
    float _1319 = _1168;
    float _1321 = _1170;
    float _1323 = _1172;
    float _1325 = _1174;
    float _1327 = _1176;
    float _1329 = _1178;
    float _1331 = _1180;
    float _1333 = _1182;
    float _1335 = _1184;
    float _1337 = _1186;
    float _1339 = _1188;
    float _1341 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1343 = _914 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1347 = _880 + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1351 = _876 + _1349;
    float _1353 = in.m_39.x;
    float _1355 = _1343 * _1343;
    float _1357 = _1277 * 0.88622701168060302734375;
    float _1359 = _1279 * 0.88622701168060302734375;
    float _1361 = in.m_39.y;
    float _1363 = fma(_1347, _1347, _1355);
    float _1365 = _1281 * 0.88622701168060302734375;
    float _1367 = _1072 ? as_type<float>(_1283) : 0.0;
    float _1369 = in.m_41.y;
    float _1371 = fma(_1351, _1351, _1363);
    float _1373 = _1072 ? as_type<float>(_1285) : 0.0;
    float _1375 = in.m_37.w;
    float _1377 = _1072 ? as_type<float>(_1287) : 0.0;
    float _1379 = rsqrt(_1371);
    float _1381 = _1072 ? _1357 : 0.0;
    float _1383 = _1072 ? _1359 : 0.0;
    float _1385 = _1072 ? _1365 : 0.0;
    float _1387 = _1072 ? as_type<float>(_1289) : 0.0;
    float _1389 = _1072 ? as_type<float>(_1291) : 0.0;
    float _1391 = _1072 ? as_type<float>(_1293) : 0.0;
    float _1393 = _1072 ? as_type<float>(_1295) : 0.0;
    float _1395 = _1072 ? as_type<float>(_1297) : 0.0;
    float _1397 = _1343 * _1379;
    float _1399 = _1347 * _1379;
    float _1401 = _1351 * _1379;
    float _1403 = _1072 ? as_type<float>(_1299) : 0.0;
    float _1405 = _1096 * _1397;
    float _1407 = fma(_1108, _1399, _1405);
    float _1409 = in.m_41.x;
    float _1411 = fma(_1104, _1401, _1407);
    out.m_44.x = _1108;
    out.m_44.y = _1096;
    out.m_44.z = _1104;
    float _1413 = _1411 + _1411;
    out.m_46.x = _880;
    out.m_46.y = _914;
    out.m_46.z = _876;
    float _1415 = -_1413;
    float _1417 = fma(_1096, _1415, _1397);
    out.m_48.x = _1110;
    out.m_48.y = _1112;
    out.m_48.z = _1114;
    float _1419 = _1417 * 1.02332699298858642578125;
    float _1421 = -_1413;
    float _1423 = fma(_1104, _1421, _1401);
    float _1425 = -_1413;
    float _1427 = fma(_1108, _1425, _1399);
    float _1429 = _1419 * _1301;
    float _1431 = _1419 * _1303;
    float _1433 = _1423 * 1.02332699298858642578125;
    float _1435 = _1427 * 1.02332699298858642578125;
    float _1437 = fma(_1305, 0.88622701168060302734375, _1429);
    float _1439 = fma(_1307, 0.88622701168060302734375, _1431);
    float _1441 = _1419 * _1309;
    float _1443 = _1419 * _1311;
    float _1445 = fma(_1433, _1313, _1437);
    float _1447 = fma(_1433, _1315, _1439);
    float _1449 = _1419 * _1317;
    float _1451 = fma(_1319, 0.88622701168060302734375, _1441);
    float _1453 = fma(_1435, _1321, _1445);
    float _1455 = fma(_1435, _1323, _1447);
    float _1457 = fma(_1325, 0.88622701168060302734375, _1443);
    float _1459 = fma(_1327, 0.88622701168060302734375, _1449);
    float _1461 = fma(_1367, _1419, _1381);
    float _1463 = precise::max(0.0, _1453);
    float _1465 = fma(_1373, _1419, _1383);
    float _1467 = precise::max(0.0, _1455);
    float _1469 = fma(_1377, _1419, _1385);
    float _1471 = fma(_1433, _1329, _1451);
    float _1473 = fma(_1433, _1331, _1457);
    float _1475 = fma(_1433, _1333, _1459);
    float _1477 = _1463 * 0.31830990314483642578125;
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = _1467 * 0.31830990314483642578125;
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = fma(_1387, _1433, _1461);
    float _1487 = fma(_1389, _1433, _1465);
    float _1489 = fma(_1391, _1433, _1469);
    float _1491 = fma(_1435, _1335, _1471);
    float _1493 = fma(_1435, _1337, _1473);
    float _1495 = fma(_1435, _1339, _1475);
    float _1497 = _1479 * 0.88622701168060302734375;
    float _1499 = -_1483;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1393, _1435, _1485);
    float _1505 = fma(_1395, _1435, _1487);
    float _1507 = fma(_1403, _1435, _1489);
    float _1509 = precise::max(0.0, _1491);
    float _1511 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1513 = precise::max(0.0, _1493);
    float _1515 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1517 = precise::max(0.0, _1495);
    float _1519 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1483);
    float _1521 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1523 = precise::max(0.0, _1503);
    float _1525 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1511);
    float _1527 = precise::max(0.0, _1505);
    float _1529 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1515);
    float _1531 = precise::max(0.0, _1507);
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1535 = -_958;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1539 = _1535 + _1537;
    float _1541 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1521);
    out.gl_Position.x = _1116;
    out.gl_Position.y = _1118;
    out.gl_Position.z = _1120;
    out.gl_Position.w = _1122;
    float _1543 = fma(_1523, _1533, _1525);
    float _1545 = fma(_1527, _1533, _1529);
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1549 = fma(_1531, _1533, _1541);
    out.m_50.x = _1353;
    out.m_50.y = _1361;
    out.m_52.w = _958;
    out.m_54.z = _1409;
    out.m_54.w = _1369;
    out.m_48.w = _1375;
    out.m_44.w = _1547;
    out.m_52.x = _1543;
    out.m_52.y = _1545;
    out.m_52.z = _1549;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _632 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    uint _68 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].w)) >> uint(16)));
    int _71 = int(_68) & 65535;
    float _74 = in.m_31.x;
    uint _76 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(8)));
    float _78 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].x))).x;
    float _80 = (-0.0) + _78;
    int _82 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w) & 255;
    float _84 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].z))).x;
    float _86 = (-0.0) + _84;
    uint _88 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].x)) >> uint(16)));
    int _90 = int(_88) & 65535;
    int _92 = int(_76) & 255;
    uint _94 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(16)));
    float _96 = float(_82);
    uint _98 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(24)));
    float _100 = float(_92);
    uint _102 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].y)) >> uint(16)));
    int _104 = int(_102) & 65535;
    float _106 = _96 * 0.0039215688593685626983642578125;
    float _108 = float2(as_type<half2>(uint(_71))).x;
    float _110 = (-0.0) + _108;
    uint _112 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].z)) >> uint(16)));
    int _114 = int(_112) & 65535;
    float _116 = abs(_110);
    float _118 = precise::max(_116, 0.100000001490116119384765625);
    float _120 = float2(as_type<half2>(uint(_90))).x;
    float _122 = (-0.0) + _120;
    float _124 = precise::min(_118, 20.0);
    float _126 = _124 * 0.0500000007450580596923828125;
    float _128 = float2(as_type<half2>(uint(_104))).x;
    float _130 = (-0.0) + _128;
    bool _134 = _126 >= _74;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan(_74);
    bool _142 = _138 || _140;
    float _144 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].y))).x;
    float _146 = (-0.0) + _144;
    float _148 = float2(as_type<half2>(uint(_114))).x;
    float _150 = (-0.0) + _148;
    int _152 = 0;
    float _154 = _124;
    if (!_142)
    {
        _152 = -1;
    }
    int _156 = _152;
    float _158 = 0.0;
    int _160 = _156;
    int _162 = _156;
    if (!_142)
    {
        _158 = 1.0;
    }
    float _164 = _158;
    bool _166 = !_142;
    float _168 = _164;
    float _170 = _164;
    if (!_166)
    {
        float _172 = 1.0 / _124;
        float _174 = _172 * 20.0;
        float _176 = _174 * _74;
        float _178 = precise::clamp(_176, 0.0, 1.0);
        bool _180 = _178 > 0.20000000298023223876953125;
        bool _182 = isnan(_178);
        bool _184 = _180 || _182;
        bool _186 = isnan(0.20000000298023223876953125);
        bool _188 = _184 || _186;
        float _190 = _174;
        if (!_188)
        {
            float _192 = _178 * 5.0;
            _190 = _192;
        }
        float _194 = _190;
        float _196 = _194;
        if (!_188)
        {
            _160 = 0;
        }
        int _198 = _160;
        int _200 = _198;
        _162 = _198;
        if (!_188)
        {
            float _202 = _106 * _194;
            _168 = _202;
        }
        float _204 = _168;
        bool _206 = !_188;
        float _208 = _204;
        _170 = _204;
        if (!_206)
        {
            bool _210 = _178 > 0.4000000059604644775390625;
            bool _212 = isnan(_178);
            bool _214 = _210 || _212;
            bool _216 = isnan(0.4000000059604644775390625);
            bool _218 = _214 || _216;
            if (!_218)
            {
                _196 = 1.0;
            }
            float _220 = _196;
            if (!_218)
            {
                float _222 = -_96;
                float _224 = _222 + _100;
                _154 = _224;
            }
            float _226 = _154;
            float _228 = _226;
            if (!_218)
            {
                _200 = 0;
            }
            int _230 = _200;
            int _232 = _230;
            _162 = _230;
            if (!_218)
            {
                float _234 = -_220;
                float _236 = fma(_178, 5.0, _234);
                _208 = _236;
            }
            float _238 = _208;
            float _240 = _238;
            if (!_218)
            {
                float _242 = fma(_238, _226, _96);
                _240 = _242;
            }
            float _244 = _240;
            float _246 = _244;
            if (!_218)
            {
                float _248 = _244 * 0.0039215688593685626983642578125;
                _246 = _248;
            }
            float _250 = _246;
            bool _252 = !_218;
            float _254 = _250;
            _170 = _250;
            if (!_252)
            {
                bool _256 = _178 > 0.60000002384185791015625;
                bool _258 = isnan(_178);
                bool _260 = _256 || _258;
                bool _262 = isnan(0.60000002384185791015625);
                bool _264 = _260 || _262;
                int _266 = int(_94) & 255;
                float _268 = float(_266);
                float _270 = 0.0;
                float _272 = _268;
                if (!_264)
                {
                    _270 = 4.999999523162841796875;
                }
                float _274 = _270;
                float _276 = _274;
                if (!_264)
                {
                    float _278 = -_100;
                    float _280 = _278 + _268;
                    _254 = _280;
                }
                float _282 = _254;
                float _284 = _282;
                if (!_264)
                {
                    _232 = 0;
                }
                int _286 = _232;
                _162 = _286;
                if (!_264)
                {
                    float _288 = fma(_178, _274, -1.99999988079071044921875);
                    _276 = _288;
                }
                float _290 = _276;
                float _292 = _290;
                if (!_264)
                {
                    float _294 = fma(_290, _282, _100);
                    _284 = _294;
                }
                float _296 = _284;
                float _298 = _296;
                if (!_264)
                {
                    float _300 = _296 * 0.0039215688593685626983642578125;
                    _298 = _300;
                }
                float _302 = _298;
                bool _304 = !_264;
                _170 = _302;
                if (!_304)
                {
                    bool _306 = _178 > 0.800000011920928955078125;
                    bool _308 = isnan(_178);
                    bool _310 = _306 || _308;
                    bool _312 = isnan(0.800000011920928955078125);
                    bool _314 = _310 || _312;
                    float _316 = float(int(_98));
                    float _318 = _316;
                    _162 = 0;
                    if (!_314)
                    {
                        float _320 = fma(_178, 5.000000476837158203125, -3.000000476837158203125);
                        _228 = _320;
                    }
                    float _322 = _228;
                    float _324 = _322;
                    if (!_314)
                    {
                        float _326 = -_268;
                        float _328 = _326 + _316;
                        _292 = _328;
                    }
                    float _330 = _292;
                    float _332 = 0.0;
                    float _334 = _330;
                    if (_314)
                    {
                        float _336 = _316 * 0.0039215688593685626983642578125;
                        _332 = _336;
                    }
                    float _338 = _332;
                    if (!_314)
                    {
                        float _340 = fma(_322, _330, _268);
                        _334 = _340;
                    }
                    float _342 = _334;
                    if (_314)
                    {
                        float _344 = fma(_178, 5.000000476837158203125, -4.000000476837158203125);
                        _272 = _344;
                    }
                    float _346 = _272;
                    if (_314)
                    {
                        float _348 = -_338;
                        float _350 = _348 + 1.0;
                        _324 = _350;
                    }
                    float _352 = _324;
                    if (!_314)
                    {
                        float _354 = _342 * 0.0039215688593685626983642578125;
                        _318 = _354;
                    }
                    float _356 = _318;
                    _170 = _356;
                    if (_314)
                    {
                        float _358 = fma(_346, _352, _338);
                        _170 = _358;
                    }
                }
            }
        }
    }
    float _360 = _170;
    int _362 = _162;
    float _364 = -_96;
    float _366 = _364 + _100;
    float _368 = in.m_33.z;
    float _370 = fma(_366, 0.0019607846625149250030517578125, _106);
    float _372 = in.m_33.y;
    bool _374 = _360 >= _370;
    bool _376 = isnan(_360);
    bool _378 = _374 || _376;
    bool _380 = isnan(_370);
    bool _382 = _378 || _380;
    float _384 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
    bool _386 = 0.0 > _384;
    bool _388 = !_382;
    bool _390 = _386 && _388;
    float _392 = fma(_74, -20.0, _368);
    bool _394 = _372 >= 0.0;
    bool _396 = _394 && _390;
    bool _398 = !_396;
    float _400 = _372;
    float _402 = _392;
    float _608;
    float _610;
    float _612;
    float _614;
    float _616;
    float _618;
    float _620;
    float _622;
    float _624;
    float _626;
    float _628;
    float _630;
    if (!_398)
    {
        float _404 = _370 * _370;
        float _406 = -_370;
        float _408 = _406 + 1.0;
        float _410 = fma(_370, -3.0, 3.0);
        float _412 = _404 * 3.0;
        float _414 = _370 * _404;
        float _416 = _370 * _410;
        float _418 = _408 * _408;
        float _420 = _370 * _416;
        float _422 = _416 * 2.0;
        float _424 = _408 * _416;
        float _426 = 1.0 / _370;
        float _428 = _150 * _420;
        float _430 = -_412;
        float _432 = _430 + _422;
        float _434 = _122 * _420;
        float _436 = -_422;
        float _438 = fma(_418, 3.0, _436);
        float _440 = fma(_86, _424, _428);
        float _442 = _122 * _432;
        float _444 = _150 * _432;
        float _446 = _130 * _432;
        float _448 = fma(_80, _424, _434);
        float _450 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].z, _440);
        float _452 = fma(_80, _438, _442);
        float _454 = fma(_146, _438, _446);
        float _456 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].x, _448);
        float _458 = _450 * _450;
        float _460 = fma(_86, _438, _444);
        float _462 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].y, _454);
        float _464 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].x, _452);
        float _466 = fma(_456, _456, _458);
        float _468 = fma(_412, (*spvDescriptorSet0.vp_c7)._m0[10].z, _460);
        float _470 = _462 * _462;
        float _472 = _426 * _360;
        float _474 = _130 * _420;
        float _476 = sqrt(_466);
        float _478 = fma(_464, _464, _470);
        float _480 = fma(_472, -3.0, 3.0);
        float _482 = fma(_146, _424, _474);
        float _484 = _472 * _472;
        float _486 = fma(_468, _468, _478);
        float _488 = _472 * _480;
        float _490 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[10].y, _482);
        float _492 = -_472;
        float _494 = _492 + 1.0;
        float _496 = _484 * 3.0;
        float _498 = _488 * 2.0;
        float _500 = rsqrt(_486);
        float _502 = -_496;
        float _504 = _502 + _498;
        float _506 = _476 * 0.20000000298023223876953125;
        float _508 = precise::max(_506, 0.100000001490116119384765625);
        float _510 = _500 * _508;
        float _512 = _494 * _494;
        float _514 = _494 * _488;
        float _516 = -_510;
        float _518 = fma(_462, _516, _490);
        float _520 = -_498;
        float _522 = fma(_512, 3.0, _520);
        float _524 = -_510;
        float _526 = fma(_464, _524, _456);
        float _528 = -_510;
        float _530 = fma(_468, _528, _450);
        float _532 = _518 * _504;
        float _534 = fma(_522, 0.00999999977648258209228515625, _532);
        float _536 = _456 * _496;
        float _538 = fma(_490, _496, _534);
        float _540 = fma(_526, _504, _536);
        float _542 = _450 * _496;
        float _544 = _538 * _538;
        float _546 = fma(_530, _504, _542);
        float _548 = fma(_540, _540, _544);
        float _550 = fma(_546, _546, _548);
        float _552 = rsqrt(_550);
        float _554 = _538 * _552;
        float _556 = _546 * _552;
        float _558 = _554 * _554;
        float _560 = fma(_556, _556, _558);
        float _562 = _472 * _488;
        float _564 = _472 * _484;
        float _566 = rsqrt(_560);
        float _568 = _518 * _562;
        float _570 = _456 * _564;
        float _572 = _450 * _564;
        float _574 = fma(_514, 0.00999999977648258209228515625, _568);
        float _576 = _540 * _552;
        float _578 = fma(_526, _562, _570);
        float _580 = fma(_530, _562, _572);
        float _582 = fma(_490, _564, _574);
        float _584 = _554 * _566;
        float _586 = _556 * _566;
        float _588 = -_584;
        float _590 = _554 * _588;
        float _592 = -_584;
        float _594 = _576 * _592;
        float _596 = -_584;
        float _598 = (-0.0) + _596;
        float _600 = -_576;
        float _602 = fma(_600, _586, -0.0);
        float _604 = -_590;
        float _606 = fma(_556, _586, _604);
        _608 = _586;
        _610 = 0.0;
        _612 = _598;
        _614 = _594;
        _616 = _606;
        _618 = _602;
        _620 = _554;
        _622 = _576;
        _624 = _556;
        _626 = _582;
        _628 = _578;
        _630 = _580;
        _632 = true;
    }
    else
    {
        float _634 = _360 * _360;
        float _636 = fma(_360, -3.0, 3.0);
        float _638 = _634 * 3.0;
        float _640 = _636 * _360;
        float _642 = -_360;
        float _644 = _642 + 1.0;
        float _646 = _640 * 2.0;
        float _648 = _644 * _644;
        float _650 = -_638;
        float _652 = _650 + _646;
        float _654 = -_646;
        float _656 = fma(_648, 3.0, _654);
        float _658 = _130 * _652;
        float _660 = _122 * _652;
        float _662 = _150 * _652;
        float _664 = fma(_146, _656, _658);
        float _666 = fma(_80, _656, _660);
        float _668 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].y, _664);
        float _670 = fma(_86, _656, _662);
        float _672 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].x, _666);
        float _674 = _640 * _360;
        float _676 = _668 * _668;
        float _678 = fma(_638, (*spvDescriptorSet0.vp_c7)._m0[10].z, _670);
        float _680 = _644 * _640;
        float _682 = _122 * _674;
        float _684 = fma(_672, _672, _676);
        float _686 = _130 * _674;
        float _688 = _150 * _674;
        float _690 = fma(_80, _680, _682);
        float _692 = fma(_678, _678, _684);
        float _694 = _634 * _360;
        float _696 = fma(_146, _680, _686);
        float _698 = fma(_86, _680, _688);
        float _700 = rsqrt(_692);
        float _702 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].y, _696);
        float _704 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].z, _698);
        float _706 = _672 * _700;
        float _708 = _678 * _700;
        float _710 = _668 * _700;
        float _712 = _706 * _706;
        float _714 = fma(_708, _708, _712);
        float _716 = rsqrt(_714);
        float _718 = fma(_694, (*spvDescriptorSet0.vp_c7)._m0[10].x, _690);
        float _720 = _706 * _716;
        float _722 = _708 * _716;
        float _724 = -_720;
        float _726 = _706 * _724;
        float _728 = -_720;
        float _730 = _710 * _728;
        float _732 = -_720;
        float _734 = (-0.0) + _732;
        float _736 = -_710;
        float _738 = fma(_736, _722, -0.0);
        float _740 = -_726;
        float _742 = fma(_708, _722, _740);
        _608 = _742;
        _610 = _730;
        _612 = _738;
        _614 = 0.0;
        _616 = _722;
        _618 = _734;
        _620 = _710;
        _622 = _706;
        _624 = _708;
        _626 = _702;
        _628 = _718;
        _630 = _704;
    }
    _632 = false;
    float _744 = _608;
    float _746 = _610;
    float _748 = _612;
    float _750 = _614;
    float _752 = _616;
    float _754 = _618;
    float _756 = _620;
    float _758 = _622;
    float _760 = _624;
    float _762 = _626;
    float _764 = _628;
    float _766 = _630;
    float _768 = in.m_31.y;
    float _770 = in.m_35.x;
    float _772 = in.m_35.y;
    float _774 = in.m_35.z;
    float _776 = in.m_37.x;
    float _778 = in.m_37.y;
    float _780 = in.m_37.z;
    bool _782 = _768 > 0.0;
    float _784 = _768;
    if (!_782)
    {
        float _786 = in.m_33.x;
        _784 = _786;
    }
    float _788 = _784;
    bool _790 = !_782;
    float _792 = _788;
    if (!_790)
    {
        float _794 = in.m_33.x;
        float _796 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
        float _798 = (-0.0) + _796;
        float _800 = fma(_74, -20.0, _798);
        float _802 = fma(_800, 0.100000001490116119384765625, 1.0);
        float _804 = precise::clamp(_802, 0.0, 1.0);
        int _806 = ~_362;
        float _808 = (_806 != 0) ? _804 : 0.0;
        float _810 = _808 * _372;
        float _812 = _392 * _808;
        float _814 = _808 * _794;
        _400 = _810;
        _792 = _814;
        _402 = _812;
    }
    float _816 = _400;
    float _818 = _792;
    float _820 = _402;
    float _822 = _744 * _816;
    float _824 = _746 * _816;
    float _826 = _748 * _816;
    float _828 = fma(_750, _818, _822);
    float _830 = fma(_752, _818, _824);
    float _832 = fma(_754, _818, _826);
    float _834 = _746 * _772;
    float _836 = fma(_756, _820, _828);
    float _838 = fma(_758, _820, _830);
    float _840 = fma(_760, _820, _832);
    float _842 = _744 * _772;
    float _844 = _836 + _762;
    float _846 = _838 + _764;
    float _848 = _840 + _766;
    float _850 = _748 * _772;
    float _852 = _844 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _854 = _844 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _856 = _746 * _778;
    float _858 = _744 * _778;
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[2].x, _852);
    float _862 = fma(_752, _770, _834);
    float _864 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[0].x, _854);
    float _866 = fma(_750, _770, _842);
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[2].z, _860);
    float _870 = _748 * _778;
    float _872 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[0].z, _864);
    float _874 = fma(_752, _776, _856);
    float _876 = _868 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _878 = fma(_750, _776, _858);
    float _880 = _872 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _882 = fma(_754, _776, _870);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _886 = _876 + _884;
    float _888 = _844 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _892 = _880 + _890;
    float _894 = fma(_756, _774, _866);
    float _896 = _886 * _886;
    float _898 = fma(_846, (*spvDescriptorSet0.vp_c7)._m0[1].x, _888);
    float _900 = fma(_754, _770, _850);
    float _902 = fma(_758, _774, _862);
    float _904 = fma(_892, _892, _896);
    float _906 = fma(_848, (*spvDescriptorSet0.vp_c7)._m0[1].z, _898);
    float _908 = _894 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _910 = fma(_760, _774, _900);
    float _912 = sqrt(_904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _916 = fma(_756, _780, _878);
    float _918 = fma(_760, _780, _882);
    float _920 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[1].x, _908);
    float _922 = _914 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _924 = _894 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _926 = fma(_758, _780, _874);
    float _928 = _894 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _930 = fma(_880, (*spvDescriptorSet0.vp_c4)._m0[2].x, _922);
    float _932 = _916 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[1].z, _920);
    float _936 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[0].x, _924);
    float _938 = _916 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _940 = _916 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _942 = fma(_876, (*spvDescriptorSet0.vp_c4)._m0[2].z, _930);
    bool _944 = _912 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _946 = fma(_902, (*spvDescriptorSet0.vp_c7)._m0[2].x, _928);
    float _948 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[0].x, _932);
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[1].x, _938);
    float _952 = fma(_926, (*spvDescriptorSet0.vp_c7)._m0[2].x, _940);
    float _954 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[0].z, _936);
    float _956 = _934 * _934;
    float _958 = _942 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _960 = fma(_910, (*spvDescriptorSet0.vp_c7)._m0[2].z, _946);
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[0].z, _948);
    float _964 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[1].z, _950);
    float _966 = fma(_918, (*spvDescriptorSet0.vp_c7)._m0[2].z, _952);
    float _968 = fma(_954, _954, _956);
    float _970 = _952;
    float _972 = _898;
    float _974 = _950;
    float _976 = _956;
    if (!_944)
    {
        _970 = _958;
    }
    float _978 = _970;
    float _980 = _978;
    if (!_944)
    {
        _972 = _880;
    }
    float _982 = _972;
    float _984 = _982;
    if (!_944)
    {
        _974 = _914;
    }
    float _986 = _974;
    float _988 = _986;
    if (!_944)
    {
        _976 = _876;
    }
    float _990 = _976;
    bool _992 = !_944;
    float _994 = _990;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _998 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _1000 = _912 + _998;
        float _1002 = _914 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1004 = rsqrt(_904);
        float _1006 = _1000 * _996;
        float _1008 = _1006 * 0.15915493667125701904296875;
        float _1010 = _1008 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        float _1014 = _1008 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 + (-1.0);
        float _1020 = fma(_1016, _1002, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _1022 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _1024 = _1004 * _1020;
        float _1026 = fma(_914, _1012, _1022);
        float _1028 = fma(_892, _1024, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _1030 = _1026 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _1032 = fma(_886, _1024, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _1034 = fma(_1028, (*spvDescriptorSet0.vp_c4)._m0[2].x, _1030);
        float _1036 = fma(_1032, (*spvDescriptorSet0.vp_c4)._m0[2].z, _1034);
        float _1038 = _1036 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _988 = _1026;
        _984 = _1028;
        _994 = _1032;
        _980 = _1038;
    }
    float _1040 = _988;
    float _1042 = _984;
    float _1044 = _994;
    float _1046 = _980;
    float _1048 = _964 * _964;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _1054 = fma(_960, _960, _968);
    float _1056 = fma(_962, _962, _1048);
    float _1058 = fma(_1042, (*spvDescriptorSet0.vp_c4)._m0[1].x, _1050);
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c4)._m0[0].x, _1052);
    float _1062 = fma(_966, _966, _1056);
    float _1064 = rsqrt(_1054);
    float _1066 = fma(_1044, (*spvDescriptorSet0.vp_c4)._m0[1].z, _1058);
    float _1068 = fma(_1044, (*spvDescriptorSet0.vp_c4)._m0[0].z, _1060);
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[40].w) & 2;
    bool _1072 = _1070 != 0;
    float _1074 = _1066 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _1078 = rsqrt(_1062);
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[7].x, _1080);
    float _1090 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[8].x, _1082);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[9].x, _1084);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c4)._m0[10].x, _1086);
    float _1096 = _934 * _1064;
    float _1098 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[7].z, _1088);
    float _1100 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[8].z, _1090);
    float _1102 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[9].z, _1092);
    float _1104 = _960 * _1064;
    float _1106 = fma(_1046, (*spvDescriptorSet0.vp_c4)._m0[10].z, _1094);
    float _1108 = _954 * _1064;
    float _1110 = _962 * _1078;
    float _1112 = _964 * _1078;
    float _1114 = _966 * _1078;
    float _1116 = _1098 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _1118 = _1100 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _1120 = _1102 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _1122 = _1106 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    bool _1124 = !_1072;
    float _1126;
    float _1128;
    float _1130;
    int _1132;
    int _1134;
    int _1136;
    int _1138;
    int _1140;
    int _1142;
    int _1144;
    int _1146;
    int _1148;
    float _1150;
    float _1152;
    float _1154;
    float _1156;
    float _1158;
    float _1160;
    float _1162;
    float _1164;
    float _1166;
    float _1168;
    float _1170;
    float _1172;
    float _1174;
    float _1176;
    float _1178;
    float _1180;
    float _1182;
    float _1184;
    float _1186;
    float _1188;
    if (!_1124)
    {
        _1126 = (*spvDescriptorSet0.vp_c9)._m0[919].x;
        _1128 = (*spvDescriptorSet0.vp_c9)._m0[919].y;
        _1130 = (*spvDescriptorSet0.vp_c9)._m0[919].z;
        _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[919].w);
        _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].x);
        _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].y);
        _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].z);
        _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[920].w);
        _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].x);
        _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].y);
        _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].z);
        _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[921].w);
        _1150 = (*spvDescriptorSet0.vp_c9)._m0[922].y;
        _1152 = (*spvDescriptorSet0.vp_c9)._m0[923].y;
        _1154 = (*spvDescriptorSet0.vp_c9)._m0[922].x;
        _1156 = (*spvDescriptorSet0.vp_c9)._m0[923].x;
        _1158 = (*spvDescriptorSet0.vp_c9)._m0[916].w;
        _1160 = (*spvDescriptorSet0.vp_c9)._m0[917].x;
        _1162 = (*spvDescriptorSet0.vp_c9)._m0[922].z;
        _1164 = (*spvDescriptorSet0.vp_c9)._m0[923].z;
        _1166 = (*spvDescriptorSet0.vp_c9)._m0[917].y;
        _1168 = (*spvDescriptorSet0.vp_c9)._m0[916].x;
        _1170 = (*spvDescriptorSet0.vp_c9)._m0[922].w;
        _1172 = (*spvDescriptorSet0.vp_c9)._m0[923].w;
        _1174 = (*spvDescriptorSet0.vp_c9)._m0[916].y;
        _1176 = (*spvDescriptorSet0.vp_c9)._m0[916].z;
        _1178 = (*spvDescriptorSet0.vp_c9)._m0[917].z;
        _1180 = (*spvDescriptorSet0.vp_c9)._m0[917].w;
        _1182 = (*spvDescriptorSet0.vp_c9)._m0[918].x;
        _1184 = (*spvDescriptorSet0.vp_c9)._m0[918].y;
        _1186 = (*spvDescriptorSet0.vp_c9)._m0[918].z;
        _1188 = (*spvDescriptorSet0.vp_c9)._m0[918].w;
        _1190 = true;
    }
    else
    {
        float _1192 = fma(_880, 6.2500002968590706586837768554688e-05, 0.5);
        float _1194 = fma(_876, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _3351 = float3(_1192, _1194, float(0));
        float3 _3355 = select(_3351, float3(0.0), isnan(_3351));
        float4 _1197 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3355.xy, uint(rint(_3355.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3355.xy, uint(rint(_3355.z)), level(0.0)).xyzw;
        float _1199 = _1197.x;
        float _1201 = _1197.y;
        float _1203 = _1197.z;
        float _1205 = _1197.w;
        float3 _3370 = float3(_1192, _1194, float(1));
        float3 _3372 = select(_3370, float3(0.0), isnan(_3370));
        float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3372.xy, uint(rint(_3372.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3372.xy, uint(rint(_3372.z)), level(0.0)).xyzw;
        float _1209 = _1207.x;
        float _1211 = _1207.y;
        float _1213 = _1207.z;
        float _1215 = _1207.w;
        float3 _3387 = float3(_1192, _1194, float(2));
        float3 _3389 = select(_3387, float3(0.0), isnan(_3387));
        float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3389.xy, uint(rint(_3389.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3389.xy, uint(rint(_3389.z)), level(0.0)).xyzw;
        float _1219 = _1217.x;
        float _1221 = _1217.y;
        float _1223 = _1217.z;
        float _1225 = _1217.w;
        float3 _3404 = float3(_1192, _1194, float(3));
        float3 _3406 = select(_3404, float3(0.0), isnan(_3404));
        float4 _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3406.xy, uint(rint(_3406.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3406.xy, uint(rint(_3406.z)), level(0.0)).xyzw;
        float _1229 = _1227.x;
        float _1231 = _1227.y;
        float _1233 = _1227.z;
        float _1235 = _1227.w;
        float3 _3422 = float3(_1192, _1194, float(4));
        float3 _3424 = select(_3422, float3(0.0), isnan(_3422));
        float4 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3424.xy, uint(rint(_3424.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3424.xy, uint(rint(_3424.z)), level(0.0)).xyzw;
        float _1239 = _1237.x;
        float _1241 = _1237.y;
        float _1243 = _1237.z;
        float _1245 = _1237.w;
        float3 _3440 = float3(_1192, _1194, float(5));
        float3 _3442 = select(_3440, float3(0.0), isnan(_3440));
        float4 _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3442.xy, uint(rint(_3442.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3442.xy, uint(rint(_3442.z)), level(0.0)).xyzw;
        float _1249 = _1247.x;
        float _1251 = _1247.y;
        float _1253 = _1247.z;
        float _1255 = _1247.w;
        float3 _3458 = float3(_1192, _1194, float(6));
        float3 _3460 = select(_3458, float3(0.0), isnan(_3458));
        float4 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3460.xy, uint(rint(_3460.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3460.xy, uint(rint(_3460.z)), level(0.0)).xyzw;
        float _1259 = _1257.x;
        float _1261 = _1257.y;
        float _1263 = _1257.z;
        float _1265 = _1257.w;
        float3 _3475 = float3(_1192, _1194, float(7));
        float3 _3477 = select(_3475, float3(0.0), isnan(_3475));
        float4 _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, _3477.xy, uint(rint(_3477.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, _3477.xy, uint(rint(_3477.z)), level(0.0)).xyzw;
        float _1269 = _1267.x;
        float _1271 = _1267.y;
        float _1273 = _1267.z;
        float _1275 = _1267.w;
        _1126 = _1229;
        _1128 = _1231;
        _1130 = _1233;
        _1132 = as_type<int>(_1235);
        _1134 = as_type<int>(_1239);
        _1136 = as_type<int>(_1241);
        _1138 = as_type<int>(_1243);
        _1140 = as_type<int>(_1245);
        _1142 = as_type<int>(_1249);
        _1144 = as_type<int>(_1251);
        _1146 = as_type<int>(_1253);
        _1148 = as_type<int>(_1255);
        _1150 = _1261;
        _1152 = _1271;
        _1154 = _1259;
        _1156 = _1269;
        _1158 = _1205;
        _1160 = _1209;
        _1162 = _1263;
        _1164 = _1273;
        _1166 = _1211;
        _1168 = _1199;
        _1170 = _1265;
        _1172 = _1275;
        _1174 = _1201;
        _1176 = _1203;
        _1178 = _1213;
        _1180 = _1215;
        _1182 = _1219;
        _1184 = _1221;
        _1186 = _1223;
        _1188 = _1225;
    }
    _1190 = false;
    float _1277 = _1126;
    float _1279 = _1128;
    float _1281 = _1130;
    int _1283 = _1132;
    int _1285 = _1134;
    int _1287 = _1136;
    int _1289 = _1138;
    int _1291 = _1140;
    int _1293 = _1142;
    int _1295 = _1144;
    int _1297 = _1146;
    int _1299 = _1148;
    float _1301 = _1150;
    float _1303 = _1152;
    float _1305 = _1154;
    float _1307 = _1156;
    float _1309 = _1158;
    float _1311 = _1160;
    float _1313 = _1162;
    float _1315 = _1164;
    float _1317 = _1166;
    float _1319 = _1168;
    float _1321 = _1170;
    float _1323 = _1172;
    float _1325 = _1174;
    float _1327 = _1176;
    float _1329 = _1178;
    float _1331 = _1180;
    float _1333 = _1182;
    float _1335 = _1184;
    float _1337 = _1186;
    float _1339 = _1188;
    float _1341 = -(*spvDescriptorSet0.vp_c4)._m0[12].w;
    float _1343 = _914 + _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c4)._m0[11].w;
    float _1347 = _880 + _1345;
    float _1349 = -(*spvDescriptorSet0.vp_c4)._m0[13].w;
    float _1351 = _876 + _1349;
    float _1353 = in.m_39.x;
    float _1355 = _1343 * _1343;
    float _1357 = _1277 * 0.88622701168060302734375;
    float _1359 = _1279 * 0.88622701168060302734375;
    float _1361 = in.m_39.y;
    float _1363 = fma(_1347, _1347, _1355);
    float _1365 = _1281 * 0.88622701168060302734375;
    float _1367 = _1072 ? as_type<float>(_1283) : 0.0;
    float _1369 = in.m_41.y;
    float _1371 = fma(_1351, _1351, _1363);
    float _1373 = _1072 ? as_type<float>(_1285) : 0.0;
    float _1375 = in.m_37.w;
    float _1377 = _1072 ? as_type<float>(_1287) : 0.0;
    float _1379 = rsqrt(_1371);
    float _1381 = _1072 ? _1357 : 0.0;
    float _1383 = _1072 ? _1359 : 0.0;
    float _1385 = _1072 ? _1365 : 0.0;
    float _1387 = _1072 ? as_type<float>(_1289) : 0.0;
    float _1389 = _1072 ? as_type<float>(_1291) : 0.0;
    float _1391 = _1072 ? as_type<float>(_1293) : 0.0;
    float _1393 = _1072 ? as_type<float>(_1295) : 0.0;
    float _1395 = _1072 ? as_type<float>(_1297) : 0.0;
    float _1397 = _1343 * _1379;
    float _1399 = _1347 * _1379;
    float _1401 = _1351 * _1379;
    float _1403 = _1072 ? as_type<float>(_1299) : 0.0;
    float _1405 = _1096 * _1397;
    float _1407 = fma(_1108, _1399, _1405);
    float _1409 = in.m_41.x;
    float _1411 = fma(_1104, _1401, _1407);
    out.m_44.x = _1108;
    out.m_44.y = _1096;
    out.m_44.z = _1104;
    float _1413 = _1411 + _1411;
    out.m_46.x = _880;
    out.m_46.y = _914;
    out.m_46.z = _876;
    float _1415 = -_1413;
    float _1417 = fma(_1096, _1415, _1397);
    out.m_48.x = _1110;
    out.m_48.y = _1112;
    out.m_48.z = _1114;
    float _1419 = _1417 * 1.02332699298858642578125;
    float _1421 = -_1413;
    float _1423 = fma(_1104, _1421, _1401);
    float _1425 = -_1413;
    float _1427 = fma(_1108, _1425, _1399);
    float _1429 = _1419 * _1301;
    float _1431 = _1419 * _1303;
    float _1433 = _1423 * 1.02332699298858642578125;
    float _1435 = _1427 * 1.02332699298858642578125;
    float _1437 = fma(_1305, 0.88622701168060302734375, _1429);
    float _1439 = fma(_1307, 0.88622701168060302734375, _1431);
    float _1441 = _1419 * _1309;
    float _1443 = _1419 * _1311;
    float _1445 = fma(_1433, _1313, _1437);
    float _1447 = fma(_1433, _1315, _1439);
    float _1449 = _1419 * _1317;
    float _1451 = fma(_1319, 0.88622701168060302734375, _1441);
    float _1453 = fma(_1435, _1321, _1445);
    float _1455 = fma(_1435, _1323, _1447);
    float _1457 = fma(_1325, 0.88622701168060302734375, _1443);
    float _1459 = fma(_1327, 0.88622701168060302734375, _1449);
    float _1461 = fma(_1367, _1419, _1381);
    float _1463 = precise::max(0.0, _1453);
    float _1465 = fma(_1373, _1419, _1383);
    float _1467 = precise::max(0.0, _1455);
    float _1469 = fma(_1377, _1419, _1385);
    float _1471 = fma(_1433, _1329, _1451);
    float _1473 = fma(_1433, _1331, _1457);
    float _1475 = fma(_1433, _1333, _1459);
    float _1477 = _1463 * 0.31830990314483642578125;
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = _1467 * 0.31830990314483642578125;
    float _1483 = precise::clamp(_1481, 0.0, 1.0);
    float _1485 = fma(_1387, _1433, _1461);
    float _1487 = fma(_1389, _1433, _1465);
    float _1489 = fma(_1391, _1433, _1469);
    float _1491 = fma(_1435, _1335, _1471);
    float _1493 = fma(_1435, _1337, _1473);
    float _1495 = fma(_1435, _1339, _1475);
    float _1497 = _1479 * 0.88622701168060302734375;
    float _1499 = -_1483;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1393, _1435, _1485);
    float _1505 = fma(_1395, _1435, _1487);
    float _1507 = fma(_1403, _1435, _1489);
    float _1509 = precise::max(0.0, _1491);
    float _1511 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].x;
    float _1513 = precise::max(0.0, _1493);
    float _1515 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].y;
    float _1517 = precise::max(0.0, _1495);
    float _1519 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[37].y, _1483);
    float _1521 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[991].z;
    float _1523 = precise::max(0.0, _1503);
    float _1525 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[68].x, _1511);
    float _1527 = precise::max(0.0, _1505);
    float _1529 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[68].y, _1515);
    float _1531 = precise::max(0.0, _1507);
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[40].z;
    float _1535 = -_958;
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _1539 = _1535 + _1537;
    float _1541 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[68].z, _1521);
    out.gl_Position.x = _1116;
    out.gl_Position.y = _1118;
    out.gl_Position.z = _1120;
    out.gl_Position.w = _1122;
    float _1543 = fma(_1523, _1533, _1525);
    float _1545 = fma(_1527, _1533, _1529);
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    float _1549 = fma(_1531, _1533, _1541);
    out.m_50.x = _1353;
    out.m_50.y = _1361;
    out.m_52.w = _958;
    out.m_54.z = _1409;
    out.m_54.w = _1369;
    out.m_48.w = _1375;
    out.m_44.w = _1547;
    out.m_52.x = _1543;
    out.m_52.y = _1545;
    out.m_52.z = _1549;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

