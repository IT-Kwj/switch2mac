#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_41 [[attribute(2)]];
    float4 m_45 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_59 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
    float4 m_47 [[attribute(11)]];
    float4 m_61 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2410 = false;
    bool _1346 = false;
    bool _1134 = false;
    bool _1014 = false;
    bool _744 = false;
    bool _582 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_32.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_35.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_104);
        out.gl_Position.z = _2850;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_37.w;
    float _110 = float(_88);
    float _112 = 1.0 / _110;
    float _114 = -_108;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _112;
    bool _130 = _116 >= _110;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_39.x = _128;
    float _136 = 0.0;
    float _138 = _116;
    if (_134)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _96;
    if (_134)
    {
        out.m_35.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2923 = as_type<float>(_144);
        out.gl_Position.z = _2923;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_41.y;
    float _150 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_43.y;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_45.y;
    float _166 = in.m_41.z;
    float _168 = in.m_43.z;
    float _170 = _150;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_162)
    {
        float _174 = _150 * _150;
        float _176 = _174 * 0.5;
        _146 = _176;
    }
    float _178 = _146;
    float _180 = 0.0;
    float _182 = _178;
    if (!_162)
    {
        float _184 = _116 * _116;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = in.m_45.z;
    if (!_162)
    {
        float _192 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _192;
    }
    float _194 = _182;
    float _196 = _148 * _148;
    float _198 = fma(_152, _152, _196);
    float _200 = fma(_164, _164, _198);
    float _202 = in.m_37.x;
    float _204 = in.m_37.y;
    float _206 = in.m_37.z;
    float _208 = sqrt(_200);
    bool _210 = _208 > 0.0;
    float _212 = _166 * _166;
    float _214 = fma(_168, _168, _212);
    bool _216 = !_162;
    float _218 = _194;
    float _220 = _214;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _150 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _150);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _136 = _240;
        _218 = _250;
    }
    float _252 = _136;
    float _254 = _218;
    bool _256 = !_162;
    float _258 = _252;
    if (!_256)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _150 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _258 = _266;
        _170 = _278;
    }
    float _280 = _258;
    float _282 = _170;
    float _284 = fma(_190, _190, _214);
    float _286 = _280;
    float _288 = _284;
    if (!_162)
    {
        _286 = _116;
    }
    float _290 = _286;
    float _292 = _290;
    if (!_162)
    {
        float _294 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _294;
    }
    float _296 = _220;
    bool _298 = !_162;
    float _300 = _296;
    if (!_298)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = _116 * _304;
        float _314 = 1.0 / _308;
        float _316 = _310 * 0.693147182464599609375;
        float _318 = exp2(_312);
        float _320 = 1.0 / _316;
        float _322 = _318 + (-1.0);
        float _324 = -_322;
        float _326 = fma(_324, _320, _116);
        float _328 = _326 * _314;
        float _330 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _330;
    }
    float _332 = _300;
    bool _334 = !_162;
    if (!_334)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = 1.0 / _342;
        float _346 = _116 * _338;
        float _348 = exp2(_346);
        float _350 = -_348;
        float _352 = _350 + 1.0;
        float _354 = _352 * _344;
        _292 = _354;
        _172 = _344;
    }
    float _356 = _292;
    float _358 = _172;
    float _360 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_282, _204, _360);
    float _370 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _372 = fma(_356, _204, _362);
    float _374 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _376 = fma(_282, _202, _364);
    float _378 = fma(_356, _202, _370);
    float _380 = -_372;
    float _382 = _368 + _380;
    float _384 = fma(_356, _206, _374);
    float _386 = sqrt(_284);
    float _388 = fma(_282, _206, _366);
    float _390 = -_378;
    float _392 = _376 + _390;
    float _394 = _382 * _382;
    float _396 = in.m_47.y;
    float _398 = -_384;
    float _400 = _388 + _398;
    float _402 = _364;
    float _404 = _378;
    float _406 = _358;
    if (!_210)
    {
        _402 = 0.0;
    }
    float _408 = _402;
    float _410 = fma(_392, _392, _394);
    float _412 = 0.0;
    float _414 = _408;
    if (_210)
    {
        float _416 = rsqrt(_200);
        _412 = _416;
    }
    float _418 = _412;
    float _420 = in.m_43.x;
    if (!_210)
    {
        _404 = 0.0;
    }
    float _422 = _404;
    float _424 = fma(_400, _400, _410);
    float _426 = _382 * _148;
    float _428 = in.m_41.x;
    float _430 = _382 * _164;
    bool _432 = _386 > 0.0;
    float _434 = sqrt(_424);
    float _436 = in.m_45.x;
    float _438 = _386;
    float _440 = _422;
    if (!_210)
    {
        _438 = 0.0;
    }
    float _442 = _438;
    float _444 = in.m_49.w;
    float _446 = _442;
    if (_210)
    {
        float _448 = _418 * _152;
        _446 = _448;
    }
    float _450 = _446;
    if (_210)
    {
        float _452 = _418 * _148;
        _414 = _452;
    }
    float _454 = _414;
    float _456 = in.m_32.x;
    float _458 = in.m_32.y;
    float _460 = in.m_32.z;
    float _462 = _454;
    if (_210)
    {
        float _464 = _418 * _164;
        _440 = _464;
    }
    float _466 = _440;
    float _468 = _382 * _152;
    float _470 = 0.0;
    float _472 = _466;
    if (_432)
    {
        float _474 = rsqrt(_284);
        _470 = _474;
    }
    float _476 = _470;
    out.m_51.y = _396;
    float _478 = _396;
    if (!_432)
    {
        _406 = 0.0;
    }
    float _480 = _406;
    bool _482 = _434 >= 9.9999999747524270787835121154785e-07;
    bool _484 = isnan(_434);
    bool _486 = _482 || _484;
    bool _488 = isnan(9.9999999747524270787835121154785e-07);
    bool _490 = _486 || _488;
    float _492 = fma(_392, _420, _468);
    float _494 = _434;
    float _496 = _480;
    if (!_432)
    {
        _494 = 0.0;
    }
    float _498 = _494;
    float _500 = fma(_392, _428, _426);
    float _502 = _498;
    if (!_432)
    {
        _288 = 0.0;
    }
    float _504 = _288;
    float _506 = fma(_392, _436, _430);
    float _508 = fma(_400, _168, _492);
    float _510 = fma(_400, _166, _500);
    float _512 = _504;
    float _514 = _508;
    float _516 = _510;
    float _518 = _510;
    float _520 = _508;
    if (_432)
    {
        float _522 = _476 * _168;
        _496 = _522;
    }
    float _524 = _496;
    float _526 = fma(_400, _190, _506);
    float _528 = _526;
    if (_432)
    {
        float _530 = _476 * _166;
        _502 = _530;
    }
    float _532 = _502;
    if (_432)
    {
        float _534 = _476 * _190;
        _512 = _534;
    }
    float _536 = _512;
    float _538 = fma(_376, _444, _456);
    float _540 = fma(_368, _444, _458);
    float _542 = fma(_388, _444, _460);
    if (!_490)
    {
        bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _546 = !_544;
        if (!_546)
        {
            float _548 = _148 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _550 = _152 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _552 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].x, _548);
            float _556 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[16].x, _550);
            float _558 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[16].x, _552);
            float _560 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[16].z, _554);
            float _562 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[16].z, _556);
            float _564 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[16].z, _558);
            float _566 = _560 * _560;
            float _568 = fma(_562, _562, _566);
            float _570 = fma(_564, _564, _568);
            float _572 = rsqrt(_570);
            float _574 = _572 * 9.9999999747524270787835121154785e-07;
            float _576 = _562 * _574;
            float _578 = _560 * _574;
            float _580 = _564 * _574;
            _518 = _578;
            _520 = _576;
            _528 = _580;
            _582 = true;
        }
        else
        {
            float _584 = _204 * _204;
            float _586 = fma(_202, _202, _584);
            float _588 = fma(_206, _206, _586);
            float _590 = sqrt(_588);
            bool _592 = _590 >= 9.9999999747524270787835121154785e-07;
            bool _594 = isnan(_590);
            bool _596 = _592 || _594;
            bool _598 = isnan(9.9999999747524270787835121154785e-07);
            bool _600 = _596 || _598;
            float _602 = _590;
            if (!_600)
            {
                float _604 = _458 * _458;
                float _606 = fma(_456, _456, _604);
                float _608 = fma(_460, _460, _606);
                float _610 = sqrt(_608);
                bool _612 = _610 >= 9.9999999747524270787835121154785e-07;
                bool _614 = isnan(_610);
                bool _616 = _612 || _614;
                bool _618 = isnan(9.9999999747524270787835121154785e-07);
                bool _620 = _616 || _618;
                float _622 = _200;
                if (!_620)
                {
                    float _624 = rsqrt(_200);
                    _622 = _624;
                }
                float _626 = _622;
                if (!_620)
                {
                    float _628 = _626 * 9.9999999747524270787835121154785e-07;
                    _602 = _628;
                }
                float _630 = _602;
                float _632 = _630;
                if (!_620)
                {
                    float _634 = _152 * _630;
                    _514 = _634;
                }
                float _636 = _514;
                _520 = _636;
                if (!_620)
                {
                    float _638 = _148 * _630;
                    _516 = _638;
                }
                float _640 = _516;
                _518 = _640;
                if (!_620)
                {
                    float _642 = _164 * _630;
                    _632 = _642;
                }
                float _644 = _632;
                bool _646 = !_620;
                _528 = _644;
                _582 = _646;
                if (!_582)
                {
                    float _648 = _148 * _458;
                    float _650 = _152 * _458;
                    float _652 = _164 * _458;
                    float _654 = fma(_456, _428, _648);
                    float _656 = fma(_456, _420, _650);
                    float _658 = fma(_456, _436, _652);
                    float _660 = fma(_166, _460, _654);
                    float _662 = fma(_168, _460, _656);
                    float _664 = fma(_190, _460, _658);
                    float _666 = _660 * _660;
                    float _668 = fma(_662, _662, _666);
                    float _670 = fma(_664, _664, _668);
                    float _672 = rsqrt(_670);
                    float _674 = _672 * 9.9999999747524270787835121154785e-07;
                    float _676 = _662 * _674;
                    float _678 = _660 * _674;
                    float _680 = _664 * _674;
                    _518 = _678;
                    _520 = _676;
                    _528 = _680;
                    _582 = true;
                }
            }
            else
            {
                float _682 = _148 * _204;
                float _684 = _152 * _204;
                float _686 = _164 * _204;
                float _688 = fma(_202, _428, _682);
                float _690 = fma(_202, _420, _684);
                float _692 = fma(_202, _436, _686);
                float _694 = fma(_166, _206, _688);
                float _696 = fma(_168, _206, _690);
                float _698 = fma(_190, _206, _692);
                float _700 = _694 * _694;
                float _702 = fma(_696, _696, _700);
                float _704 = fma(_698, _698, _702);
                float _706 = rsqrt(_704);
                float _708 = _706 * 9.9999999747524270787835121154785e-07;
                float _710 = _696 * _708;
                float _712 = _694 * _708;
                float _714 = _698 * _708;
                _518 = _712;
                _520 = _710;
                _528 = _714;
            }
        }
    }
    _582 = false;
    float _716 = _518;
    float _718 = _520;
    float _720 = _528;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _724 = !_722;
    float _742;
    if (!_724)
    {
        float _726 = in.m_53.x;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _730 = _726 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        _742 = _128;
    }
    _744 = false;
    float _746 = _742;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _750 = _746 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _754 = _746 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _758 = _746 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = 1.0 / _766;
    bool _778 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _780 = isnan(_746);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = 1.0 / _774;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _792;
    bool _796 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _798 = 1.0 / _770;
    float _800 = 1.0 / _762;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _804 = _746 + _802;
    float _806 = _750 * _790;
    bool _808 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _810 = isnan(_746);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _804 * _776;
    bool _822 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _824 = isnan(_746);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = _754 * _798;
    bool _836 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _838 = isnan(_746);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -_832;
    float _850 = _848 + 1.0;
    float _852 = fma(_794, _834, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _854 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _856 = isnan(_746);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = _818 * _850;
    float _868 = _758 * _800;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _874;
    float _878 = -_818;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = fma(_872, _834, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _888 = fma(_876, _834, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _890 = -_846;
    float _892 = _890 + 1.0;
    float _894 = _846 * _880;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _904 = _788 * _892;
    float _906 = -_788;
    float _908 = _906 + 1.0;
    float _910 = fma(_898, _806, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _912 = fma(_902, _806, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _914 = _864 * _908;
    float _916 = fma(_884, _806, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _918 = _888 * _914;
    float _920 = _886 * _914;
    float _922 = -_864;
    float _924 = _922 + 1.0;
    float _926 = _852 * _914;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _936;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].x, _920);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].y, _918);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].z, _926);
    float _946 = fma(_930, _868, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _948 = fma(_934, _868, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _950 = fma(_938, _868, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _952 = fma(_910, _904, _940);
    float _954 = fma(_912, _904, _942);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _964 = fma(_916, _904, _944);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _970 = fma(_946, _894, _952);
    float _972 = fma(_958, _820, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _974 = fma(_962, _820, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _976 = fma(_968, _820, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _978 = fma(_948, _894, _954);
    float _980 = fma(_950, _894, _964);
    float _982 = fma(_972, _866, _970);
    float _984 = fma(_974, _866, _978);
    float _986 = fma(_976, _866, _980);
    float _988 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].x, _982);
    float _990 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].y, _984);
    float _992 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].z, _986);
    bool _994 = !_796;
    float _1012;
    if (!_994)
    {
        float _996 = in.m_53.x;
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1000 = _996 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _128;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = in.m_49.x;
    float _1020 = in.m_49.y;
    float _1022 = in.m_49.z;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1026 = _1016 + _1024;
    bool _1028 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1030;
    float _1034 = 1.0 / _1032;
    float _1036 = _992 * _1022;
    float _1038 = _990 * _1020;
    float _1040 = _1026 * _1034;
    bool _1042 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1044 = isnan(_1016);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -_1052;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1058;
    bool _1062 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1064 = isnan(_1016);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1078;
    float _1082 = fma(_1060, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1084 = _1072 * _1056;
    float _1086 = fma(_1076, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1088 = fma(_1080, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1090 = -_1072;
    float _1092 = _1090 + 1.0;
    float _1094 = _1082 * _1084;
    float _1096 = _1086 * _1084;
    float _1098 = _1088 * _1084;
    float _1100 = _988 * _1018;
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1094);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1096);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1098);
    float _1108 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1102);
    float _1110 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1104);
    float _1112 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1106);
    bool _1114 = !_1028;
    float _1132;
    if (!_1114)
    {
        float _1116 = in.m_53.x;
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1120 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _1124 = _1122 * _1118;
        float _1126 = floor(_1124);
        float _1128 = -_1126;
        float _1130 = _1124 + _1128;
        _1132 = _1130;
        _1134 = true;
    }
    else
    {
        _1132 = _128;
    }
    _1134 = false;
    float _1136 = _1132;
    float _1138 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1140 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1150 = 1.0 / _1144;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1160 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1162 = isnan(_1136);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1176 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1178 = isnan(_1136);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1190 = 1.0 / _1148;
    bool _1192 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1194 = isnan(_1136);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = -_1170;
    float _1206 = _1204 + 1.0;
    float _1208 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = -_1202;
    float _1216 = _1214 + 1.0;
    float _1218 = _1202 * _1206;
    float _1220 = _1154 * _1150;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1224 = _1136 + _1222;
    float _1226 = 1.0 / _1158;
    float _1228 = _1186 * _1216;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1234 = fma(_1220, _1224, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1236 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1238 = isnan(_1136);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1248;
    float _1252 = _1232 * _1190;
    float _1254 = _1234 * _1228;
    float _1256 = 1.0 / _1174;
    float _1258 = -_1246;
    float _1260 = _1258 + 1.0;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1264 = _1136 + _1262;
    bool _1266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1268 = _1170 * _1260;
    float _1270 = -_1186;
    float _1272 = _1270 + 1.0;
    bool _1274 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1276 = isnan(_1136);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = _1250 * _1226;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1294 = _1136 + _1292;
    float _1296 = fma(_1252, _1264, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1298 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1254);
    float _1300 = -_1284;
    float _1302 = _1300 + 1.0;
    float _1304 = fma(_1286, _1294, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1308 = _1136 + _1306;
    float _1310 = _1290 * _1256;
    float _1312 = fma(_1296, _1218, _1298);
    float _1314 = _1246 * _1302;
    float _1316 = fma(_1310, _1308, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1318 = fma(_1304, _1268, _1312);
    float _1320 = fma(_1316, _1314, _1318);
    float _1322 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1320);
    float _1324 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1208;
    out.m_55.y = _1210;
    out.m_55.z = _1212;
    out.m_55.w = _1324;
    bool _1326 = !_1266;
    float _1344;
    if (!_1326)
    {
        float _1328 = in.m_53.x;
        float _1330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1332 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _1336 = _1334 * _1330;
        float _1338 = floor(_1336);
        float _1340 = -_1338;
        float _1342 = _1336 + _1340;
        _1344 = _1342;
        _1346 = true;
    }
    else
    {
        _1344 = _128;
    }
    _1346 = false;
    float _1348 = _1344;
    float _1350 = in.m_53.x;
    float _1352 = _540 * _148;
    float _1354 = _540 * _152;
    float _1356 = in.m_53.z;
    float _1358 = fma(_538, _428, _1352);
    float _1360 = _540 * _164;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1364 = _1362 != 0;
    float _1366 = in.m_53.y;
    float _1368 = fma(_538, _420, _1354);
    float _1370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1372 = log2(_1370);
    float _1374 = fma(_538, _436, _1360);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1380 = in.m_53.w;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1394 = _1392 != 0;
    float _1396 = fma(_542, _168, _1368);
    float _1398 = _1350 * 2.0;
    float _1400 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1404 = fma(_542, _166, _1358);
    float _1406 = _1356 * 2.0;
    float _1408 = -_1376;
    float _1410 = fma(_1400, 2.0, _1408);
    float _1412 = floor(_1398);
    float _1414 = _1400;
    float _1416 = _1406;
    bool _1418 = _1394;
    if (!_1364)
    {
        _1414 = _1356;
    }
    float _1420 = _1414;
    float _1422 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1424 = _1366 * 2.0;
    float _1426 = _1420;
    float _1428 = _1422;
    if (_1364)
    {
        _1426 = _1366;
    }
    float _1430 = _1426;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1434 = fma(_1422, -2.0, _1378);
    if (!_1364)
    {
        _1428 = _1356;
    }
    float _1436 = _1428;
    float _1438 = floor(_1406);
    float _1440 = _1436;
    if (_1364)
    {
        _1440 = _1366;
    }
    float _1442 = _1440;
    float _1444 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1382);
    float _1446 = _1372 * _116;
    float _1448 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1434);
    float _1450 = _1366 + _1356;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1454 = fma(_542, _190, _1374);
    bool _1456 = _1412 >= 0.0;
    bool _1458 = isnan(_1412);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = floor(_1424);
    if (!_1364)
    {
        _1416 = _1366;
    }
    float _1468 = _1416;
    float _1470 = _1450 + (-1.0);
    float _1472 = _1468;
    if (_1364)
    {
        _1472 = _1350;
    }
    float _1474 = _1472;
    float _1476 = _1350 + _1366;
    bool _1478 = _1412 > 0.0;
    float _1480 = in.m_47.x;
    bool _1482 = _1438 > 0.0;
    float _1484 = exp2(_1446);
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1402);
    bool _1488 = _1438 >= 0.0;
    bool _1490 = isnan(_1438);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1500 = _1464 ? 0 : 1;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1504 = _1496 ? 0 : 1;
    float _1506 = -_1432;
    float _1508 = fma(_1498, 2.0, _1506);
    bool _1510 = _1466 > 0.0;
    float _1512 = fma(_1452, -2.0, _1502);
    float _1514 = _1476 + (-1.0);
    int _1516 = ~_1504;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    float _1522 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1524 = _1520;
    if (!_1482)
    {
        int _1526 = ~_1504;
        int _1528 = _1526 + 1;
        _1524 = _1528;
    }
    int _1530 = _1524;
    float _1532 = -_1484;
    float _1534 = _1532 + 1.0;
    bool _1536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1538 = isnan(1.0);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1544 = _1540 || _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1548 = 1.0 + _1546;
    int _1550 = ~_1500;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    float _1556 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1558 = _1554;
    if (!_1478)
    {
        int _1560 = ~_1500;
        int _1562 = _1560 + 1;
        _1558 = _1562;
    }
    int _1564 = _1558;
    float _1566 = 1.0 / _1548;
    float _1568 = _1396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1570 = _1454 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1572 = _1466 >= 0.0;
    bool _1574 = isnan(_1466);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan(0.0);
    bool _1580 = _1576 || _1578;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1584 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1592 = _1588 || _1590;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1596 = _1580 ? 0 : 1;
    float _1598 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1582);
    float _1600 = _1592 ? _1534 : 0.0;
    float _1602 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    int _1604 = ~_1596;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    float _1610 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1598);
    int _1612 = _1608;
    if (!_1510)
    {
        int _1614 = ~_1596;
        int _1616 = _1614 + 1;
        _1612 = _1616;
    }
    int _1618 = _1612;
    float _1620 = -_116;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1410);
    float _1624 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1486);
    float _1626 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1602);
    float _1628 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1444);
    float _1630 = -_116;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1508);
    float _1634 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1512);
    if (_1544)
    {
        float _1636 = _1600 * _1566;
        _138 = _1636;
    }
    float _1638 = _138;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1644 = !_1386;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = _716 * _716;
    bool _1650 = _1380 > 0.5;
    float _1652 = 1.0 / _1642;
    float _1654 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1660;
    float _1664 = fma(_718, _718, _1648);
    float _1666 = 1.0 / _1658;
    float _1668 = fma(_128, 0.4000000059604644775390625, 0.300000011920928955078125);
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1674 = _1662 * _1652;
    float _1676 = fma(_720, _720, _1664);
    int _1678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1680 = _1678 != 0;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1684 = _1682 != 0;
    float _1686 = rsqrt(_1676);
    float _1688 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1690 = _1350 + _1356;
    float _1692 = _1672 * _1666;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1696 = _1694 != 0;
    float _1698 = _1690 + (-1.0);
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = in.m_57.x;
    float _1706 = in.m_57.y;
    float _1708 = in.m_57.z;
    int _1710 = abs(_1646);
    float _1712 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1716 = _1348 + _1714;
    float _1718 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1720 = float(_1618);
    float _1722 = _1686 * _716;
    float _1724 = fma(_1674, _1716, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1726 = _1686 * _718;
    float _1728 = float(_1710);
    float _1730 = _1722 * _454;
    float _1732 = float(_1530);
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1736 = _1348 + _1734;
    float _1738 = _1686 * _720;
    float _1740 = fma(_1726, _450, _1730);
    bool _1742 = !_1390;
    int _1744 = _1742 ? 0 : 1;
    float _1746 = _1728 * _1732;
    float _1748 = fma(_1692, _1736, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1750 = fma(_1738, _466, _1740);
    float _1752 = _1740;
    float _1754 = _1688;
    bool _1756 = _1696;
    float _1758 = _1480;
    if (!_1680)
    {
        _1752 = _1480;
    }
    float _1760 = _1752;
    float _1762 = _1746 * (-2.0);
    int _1764 = abs(_1744);
    float _1766 = _1350 + (-0.5);
    float _1768 = abs(_1750);
    bool _1770 = _1768 > 0.99989998340606689453125;
    float _1772 = fma(_1718, _1762, _1718);
    bool _1774 = !_1394;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = fma(_1762, _1704, _1704);
    float _1780 = _1350 + _1480;
    float _1782 = _1760;
    if (_1680)
    {
        bool _1784 = _1350 > 0.5;
        _1418 = _1784;
    }
    bool _1786 = _1418;
    float _1788 = _1366 + _1480;
    int _1790 = abs(_1776);
    float _1792 = _1780 * 6.283185482025146484375;
    float _1794 = _1788 * 18.84955596923828125;
    float _1796 = _1792 * 0.15915493667125701904296875;
    float _1798 = float(_1764);
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1778);
    float _1802 = float(_1564);
    float _1804 = -_396;
    float _1806 = _1804 + 1.0;
    float _1808 = float(_1790);
    float _1810 = _1794 * 0.15915493667125701904296875;
    float _1812 = _1796 * 6.283185482025146484375;
    float _1814 = sin(_1812);
    float _1816 = _1798 * _1802;
    if (_1770)
    {
        float _1818 = fma(_536, 0.001000000047497451305389404296875, _466);
        _472 = _1818;
    }
    float _1820 = _472;
    float _1822 = _1808 * _1720;
    float _1824 = fma(_1772, _1638, _1800);
    float _1826 = _1816 * (-2.0);
    int _1828 = _1650 ? as_type<int>(_1806) : as_type<int>(_396);
    if (_1770)
    {
        float _1830 = fma(_532, 0.001000000047497451305389404296875, _454);
        _462 = _1830;
    }
    float _1832 = _462;
    bool _1834 = _1366 > 0.5;
    float _1836 = _1366 + (-0.5);
    float _1838 = fma(_1826, _1706, _1706);
    float _1840 = _1810 * 6.283185482025146484375;
    float _1842 = sin(_1840);
    float _1844 = _1824 * 0.15915493667125701904296875;
    float _1846 = fma(_1688, _1826, _1688);
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1838);
    float _1850 = _1822 * (-2.0);
    if (!_1770)
    {
        _1754 = _450;
    }
    float _1852 = _1754;
    float _1854 = _1852;
    if (_1770)
    {
        float _1856 = fma(_524, 0.001000000047497451305389404296875, _450);
        _1854 = _1856;
    }
    float _1858 = _1854;
    float _1860 = _1696 ? as_type<float>(_1828) : _396;
    float _1862 = fma(_1846, _1638, _1848);
    if (_1702)
    {
        float _1864 = _1834 ? _1806 : _396;
        _478 = _1864;
    }
    float _1866 = _478;
    float _1868 = fma(_1850, _1708, _1708);
    if (_1684)
    {
        bool _1870 = _1356 > 0.5;
        _1756 = _1870;
    }
    bool _1872 = _1756;
    float _1874 = in.m_59.x;
    float _1876 = in.m_59.y;
    float _1878 = in.m_59.z;
    float _1880 = _1356 + (-0.5);
    float _1882 = fma(_1712, _1850, _1712);
    float _1884 = -_1820;
    float _1886 = _1722 * _1884;
    float _1888 = _1842 * 0.125;
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1868);
    float _1892 = -_1832;
    float _1894 = _1726 * _1892;
    float _1896 = -_1832;
    float _1898 = -_1886;
    float _1900 = fma(_1738, _1896, _1898);
    float _1902 = fma(_1814, 0.5, _1888);
    float _1904 = fma(_1882, _1638, _1890);
    float _1906 = -_1858;
    float _1908 = _1738 * _1906;
    float _1910 = _1862 * 0.15915493667125701904296875;
    float _1912 = _1902 + 0.625;
    float _1914 = _1904 * 0.15915493667125701904296875;
    float _1916 = -_1820;
    float _1918 = -_1908;
    float _1920 = fma(_1726, _1916, _1918);
    float _1922 = _1844 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = _1912 * _1668;
    float _1928 = -_1858;
    float _1930 = -_1894;
    float _1932 = fma(_1722, _1928, _1930);
    float _1934 = _1920 * _1920;
    float _1936 = _1844 * 6.283185482025146484375;
    float _1938 = cos(_1936);
    float _1940 = fma(_1874, _1926, _1874);
    float _1942 = fma(_1876, _1926, _1876);
    float _1944 = fma(_1878, _1926, _1878);
    float _1946 = fma(_1900, _1900, _1934);
    float _1948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1940);
    float _1950 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1942);
    float _1952 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1944);
    float _1954 = _1910 * 6.283185482025146484375;
    float _1956 = sin(_1954);
    float _1958 = fma(_1932, _1932, _1946);
    float _1960 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1962 = _1522 * _1948;
    float _1964 = _1556 * _1950;
    float _1966 = _1960 * _1952;
    float _1968 = _1910 * 6.283185482025146484375;
    float _1970 = cos(_1968);
    float _1972 = _1914 * 6.283185482025146484375;
    float _1974 = cos(_1972);
    float _1976 = _1924 * _1956;
    float _1978 = _1938 * _1956;
    float _1980 = _1914 * 6.283185482025146484375;
    float _1982 = sin(_1980);
    float _1984 = _1938 * _1970;
    float _1986 = _1924 * _1970;
    float _1988 = rsqrt(_1958);
    float _1990 = _1924 * _1974;
    float _1992 = _1970 * _1974;
    float _1994 = _1938 * _1974;
    float _1996 = _1956 * _1974;
    float _1998 = _1994 * _1726;
    float _2000 = fma(_1982, _1984, _1976);
    float _2002 = -_1978;
    float _2004 = fma(_1982, _1986, _2002);
    float _2006 = -_1986;
    float _2008 = fma(_1982, _1978, _2006);
    float _2010 = fma(_1982, _1976, _1984);
    float _2012 = _2000 * _1738;
    float _2014 = _2000 * _1726;
    float _2016 = _1994 * _1738;
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2020 = _1932 * _1988;
    float _2022 = _1900 * _1988;
    float _2024 = _1920 * _1988;
    float _2026 = _2008 * _1738;
    float _2028 = fma(_1992, _2020, _2012);
    float _2030 = fma(_1992, _2022, _2014);
    float _2032 = _1722 * _2020;
    float _2034 = _1726 * _2024;
    float _2036 = -_1982;
    float _2038 = fma(_2036, _2022, _1998);
    float _2040 = -_1982;
    float _2042 = fma(_2040, _2020, _2016);
    float _2044 = -_2032;
    float _2046 = fma(_1738, _2024, _2044);
    float _2048 = -_2034;
    float _2050 = fma(_1722, _2022, _2048);
    float _2052 = _2008 * _1726;
    float _2054 = fma(_1996, _2020, _2026);
    float _2056 = fma(_1990, _2046, _2038);
    float _2058 = fma(_1990, _2050, _2042);
    float _2060 = fma(_2004, _2050, _2028);
    float _2062 = fma(_1996, _2022, _2052);
    float _2064 = _1964 * _2056;
    float _2066 = _1964 * _2058;
    float _2068 = fma(_2004, _2046, _2030);
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2072 = fma(_2010, _2050, _2054);
    float _2074 = fma(_1962, _2060, _2066);
    float _2076 = fma(_2010, _2046, _2062);
    float _2078 = fma(_1962, _2068, _2064);
    bool _2080 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2082 = isnan(_1348);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = fma(_1966, _2072, _2074);
    bool _2094 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2096 = isnan(_1348);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = fma(_1966, _2076, _2078);
    bool _2108 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2110 = isnan(_1348);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -_2090;
    float _2122 = _2120 + 1.0;
    float _2124 = _1738 * _2022;
    float _2126 = _1568 + _2106;
    float _2128 = _1994 * _1722;
    float _2130 = _2118 * _2122;
    float _2132 = _1570 + _2092;
    float _2134 = -_2118;
    float _2136 = _2134 + 1.0;
    float _2138 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2142 = _2126 + _2140;
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2146 = _2132 + _2144;
    float _2148 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2150 = _2104 * _2136;
    float _2152 = _2142 * _2142;
    float _2154 = _2146 * _2146;
    float _2156 = fma(_1860, _2148, -0.5);
    float _2158 = _1724 * _2150;
    float _2160 = fma(_2138, _1866, -0.5);
    float _2162 = _2152 + _2154;
    float _2164 = -_1982;
    float _2166 = fma(_2164, _2024, _2128);
    float _2168 = _2000 * _1722;
    float _2170 = -_2124;
    float _2172 = fma(_1726, _2020, _2170);
    float _2174 = sqrt(_2162);
    int _2176 = as_type<int>(_1982);
    float _2178 = _2152;
    float _2180 = _2154;
    float _2182 = _2132;
    float _2184 = _2126;
    if (_1680)
    {
        float _2186 = -_1480;
        float _2188 = _2186 + 1.0;
        _2176 = as_type<int>(_2188);
    }
    int _2190 = _2176;
    float _2192 = _2008 * _1722;
    float _2194 = fma(_1992, _2024, _2168);
    float _2196 = fma(_1990, _2172, _2166);
    float _2198 = -_2104;
    float _2200 = _2198 + 1.0;
    float _2202 = fma(_1996, _2024, _2192);
    float _2204 = fma(_2004, _2172, _2194);
    float _2206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2208 = _1964 * _2196;
    int _2210 = _2190;
    if (_1680)
    {
        float _2212 = _1786 ? as_type<float>(_2190) : _1480;
        _1782 = _2212;
    }
    float _2214 = _1782;
    float _2216 = fma(_2010, _2172, _2202);
    if (_1684)
    {
        float _2218 = -_1480;
        float _2220 = _2218 + 1.0;
        _2210 = as_type<int>(_2220);
    }
    int _2222 = _2210;
    float _2224 = fma(_1962, _2204, _2208);
    float _2226 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2158);
    float _2228 = -_1448;
    float _2230 = fma(_1626, _2160, _2228);
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2234 = _2174 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2236 = fma(_1966, _2216, _2224);
    float _2238 = _2236;
    if (_1684)
    {
        float _2240 = _1872 ? as_type<float>(_2222) : _1480;
        _1758 = _2240;
    }
    float _2242 = _1758;
    float _2244 = fma(_1748, _2130, _2226);
    float _2246 = -_1634;
    float _2248 = fma(_1628, _2156, _2246);
    float _2250 = _1654 + _2236;
    float _2252 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2254 = fma(_2252, _2214, -0.5);
    if (!_2234)
    {
        _2238 = _2250;
    }
    float _2256 = _2238;
    float _2258 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2260 = fma(_2258, _2242, -0.5);
    bool _2262 = !_2234;
    float _2264 = _2256;
    if (!_2262)
    {
        float _2266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2270 = _2174 + _2268;
        float _2272 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = rsqrt(_2162);
        float _2276 = _2270 * _2266;
        float _2278 = _2276 * 0.15915493667125701904296875;
        float _2280 = _2278 * 6.283185482025146484375;
        float _2282 = sin(_2280);
        float _2284 = _2278 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = fma(_2282, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2290 = _2274 * _2288;
        float _2292 = _2286 + (-1.0);
        float _2294 = fma(_2142, _2290, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2296 = fma(_2146, _2290, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2298 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2302 = _2294 + _2300;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2306 = _2296 + _2304;
        float _2308 = fma(_2250, _2286, _2298);
        float _2310 = _2302 * _2302;
        float _2312 = _2306 * _2306;
        _2264 = _2308;
        _2178 = _2310;
        _2180 = _2312;
        _2182 = _2296;
        _2184 = _2294;
    }
    float _2314 = _2264;
    float _2316 = _2178;
    float _2318 = _2180;
    float _2320 = _2182;
    float _2322 = _2184;
    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2326 = _2314 + _2324;
    float _2328 = in.m_61.w;
    float _2330 = fma(_1610, _2254, _1622);
    float _2332 = fma(_1624, _2260, _1632);
    float _2334 = fma(_2326, _2326, _2316);
    float _2336 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2244);
    float _2338 = _2334 + _2318;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2342 = _2230 + 0.5;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2346 = _2248 + 0.5;
    float _2348 = sqrt(_2338);
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2352 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2360 = _2330 + 0.5;
    float _2362 = _2332 + 0.5;
    out.m_63.x = _2352;
    out.m_63.y = _2354;
    out.m_63.z = _2358;
    out.m_63.w = _2356;
    out.m_65.w = _2328;
    bool _2364 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2366 = isnan(_2348);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2372 = _2368 || _2370;
    out.m_67.x = _2360;
    out.m_67.y = _2342;
    out.m_67.z = _2362;
    out.m_67.w = _2346;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (!_2372)
    {
        _2374 = 1.0;
    }
    float _2376 = _2374;
    bool _2378 = !_2372;
    float _2380 = _2376;
    if (!_2378)
    {
        bool _2382 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2384 = isnan(_2348);
        bool _2386 = _2382 || _2384;
        bool _2388 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2390 = _2386 || _2388;
        if (!_2390)
        {
            float _2392 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2394 = _2348 + _2392;
            float _2396 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2398 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2396;
            float _2400 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2404 = 1.0 / _2398;
            float _2406 = _2394 * _2404;
            float _2408 = fma(_2406, _2402, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2380 = _2408;
            _2410 = true;
        }
        else
        {
            bool _2412 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2414 = isnan(_2348);
            bool _2416 = _2412 || _2414;
            bool _2418 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2420 = _2416 || _2418;
            if (!_2420)
            {
                float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2424 = _2348 + _2422;
                float _2426 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2428 = _2426 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2430 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2432 = _2430 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2434 = 1.0 / _2428;
                float _2436 = _2424 * _2434;
                float _2438 = fma(_2436, _2432, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2380 = _2438;
                _2410 = true;
            }
            else
            {
                _2380 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2410 = false;
    float _2440 = _2380;
    float _2442 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2444 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2446 = _2314 + _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2450 = _2320 + _2448;
    float _2452 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2442);
    float _2454 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2456 = fma(_2446, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2458 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.5);
    bool _2466 = _2462 || _2464;
    float _2468 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2452);
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2472 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2454);
    float _2474 = 1.0 / _2470;
    float _2476 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2472);
    bool _2478 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan(0.5);
    bool _2486 = _2482 || _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2490 = _2322 + _2488;
    float _2492 = _2476 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2494 = _2492 + _2470;
    float _2496 = fma(_2490, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2498 = fma(_2450, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2500 = _2494 * _2474;
    float _2502 = _2500 * 0.5;
    float _2504 = _2494;
    float _2506 = _2490;
    float _2508 = _2496;
    if (_2486)
    {
        _2504 = _2456;
    }
    float _2510 = _2504;
    float _2512 = _2510;
    if (_2486)
    {
        _2506 = _2498;
    }
    float _2514 = _2506;
    float _2516 = _2514;
    if (!_2486)
    {
        float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2520 = _1654 + _2518;
        float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2524 = _1568 + _2522;
        float _2526 = -_1568;
        float _2528 = _2526 + _2496;
        float _2530 = -_1570;
        float _2532 = _2530 + _2498;
        float _2534 = _2520 * _2520;
        float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2538 = _1570 + _2536;
        float _2540 = fma(_2524, _2524, _2534);
        float _2542 = fma(_2538, _2538, _2540);
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2546 = sqrt(_2542);
        float _2548 = precise::min(_2546, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2550 = _2548 * _2544;
        float _2552 = -_1654;
        float _2554 = _2552 + _2456;
        float _2556 = fma(_2528, _2550, _1568);
        float _2558 = fma(_2554, _2550, _1654);
        float _2560 = fma(_2532, _2550, _1570);
        _2512 = _2558;
        _2508 = _2556;
        _2516 = _2560;
    }
    float _2562 = _2512;
    float _2564 = _2508;
    float _2566 = _2516;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2570 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2568);
    float _2572 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2576 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2578 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2580 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2582 = 1.0 / _2570;
    float _2584 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2574);
    float _2586 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2576);
    float _2588 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2580);
    float _2590 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2578);
    float _2592 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2584);
    float _2594 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2586);
    float _2596 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2598 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2590);
    float _2600 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2602 = _2590;
    if (_2466)
    {
        _2602 = 1.0;
    }
    float _2604 = _2602;
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2608 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2610 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2614 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2606);
    float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2608);
    float _2618 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2610);
    float _2620 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2612);
    float _2622 = _2606;
    float _2624 = _2604;
    if (_2466)
    {
        _2622 = 1.0;
    }
    float _2626 = _2622;
    float _2628 = _2594 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2632 = _2582 * _2630;
    float _2634 = _2626;
    if (!_2466)
    {
        float _2636 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2638 = _2636 * 0.15915493667125701904296875;
        float _2640 = _2638 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        float _2644 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2646 = _2644 * 0.15915493667125701904296875;
        float _2648 = _2638 * 6.283185482025146484375;
        float _2650 = sin(_2648);
        float _2652 = 1.0 / _2642;
        float _2654 = _2646 * 6.283185482025146484375;
        float _2656 = cos(_2654);
        float _2658 = _2650 * _2652;
        float _2660 = _2646 * 6.283185482025146484375;
        float _2662 = sin(_2660);
        float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2666 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2664;
        float _2668 = _2656 * _2658;
        float _2670 = 1.0 / _2666;
        float _2672 = 1.0 / _2668;
        float _2674 = _2662 * _2672;
        float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2678 = fma(_2632, _2674, _2676);
        float _2680 = _2678 * _2670;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        _2624 = _2682;
    }
    float _2684 = _2624;
    if (!_2466)
    {
        float _2686 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = _2688 * 6.283185482025146484375;
        float _2692 = cos(_2690);
        float _2694 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2696 = _2694 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2692;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2632, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2634 = _2736;
    }
    float _2738 = _2634;
    float _2740 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2614);
    float _2742 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2616);
    float _2744 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2618);
    float _2746 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2748 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2620);
    bool _2750 = _2684 > 0.0;
    bool _2752 = isnan(_2684);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(0.0);
    bool _2758 = _2754 || _2756;
    float _2760 = _2684 * _2738;
    float _2762 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2740);
    float _2764 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2748);
    float _2766 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2744);
    bool _2768 = _2738 <= 0.0;
    bool _2770 = !_2758;
    bool _2772 = _2768 || _2770;
    float _2774 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2742);
    float _2776 = _2762 + _2764;
    float _2778 = _2766 + _2764;
    float _2780 = _2764 * 0.5;
    float _2782 = _2760 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2784 = _2776 * 0.5;
    float _2786 = _2778 * 0.5;
    float _2788 = fma(_2774, -0.5, _2780);
    float _2790 = _2782 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2762;
    out.gl_Position.y = _2774;
    out.gl_Position.z = _2766;
    out.gl_Position.w = _2764;
    out.m_69.x = _2784;
    out.m_69.y = _2788;
    out.m_69.z = _2786;
    out.m_69.w = _2764;
    out.m_35.x = _2790;
    if (!_2772)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2792 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2792;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2410 = false;
    bool _1346 = false;
    bool _1134 = false;
    bool _1014 = false;
    bool _744 = false;
    bool _582 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_32.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_35.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_104);
        out.gl_Position.z = _2850;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_37.w;
    float _110 = float(_88);
    float _112 = 1.0 / _110;
    float _114 = -_108;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _112;
    bool _130 = _116 >= _110;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_39.x = _128;
    float _136 = 0.0;
    float _138 = _116;
    if (_134)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _96;
    if (_134)
    {
        out.m_35.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2923 = as_type<float>(_144);
        out.gl_Position.z = _2923;
    }
    if (_134)
    {
        return out;
    }
    float _148 = in.m_41.y;
    float _150 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_43.y;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_45.y;
    float _166 = in.m_41.z;
    float _168 = in.m_43.z;
    float _170 = _150;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_162)
    {
        float _174 = _150 * _150;
        float _176 = _174 * 0.5;
        _146 = _176;
    }
    float _178 = _146;
    float _180 = 0.0;
    float _182 = _178;
    if (!_162)
    {
        float _184 = _116 * _116;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = in.m_45.z;
    if (!_162)
    {
        float _192 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _192;
    }
    float _194 = _182;
    float _196 = _148 * _148;
    float _198 = fma(_152, _152, _196);
    float _200 = fma(_164, _164, _198);
    float _202 = in.m_37.x;
    float _204 = in.m_37.y;
    float _206 = in.m_37.z;
    float _208 = sqrt(_200);
    bool _210 = _208 > 0.0;
    float _212 = _166 * _166;
    float _214 = fma(_168, _168, _212);
    bool _216 = !_162;
    float _218 = _194;
    float _220 = _214;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _150 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _150);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _136 = _240;
        _218 = _250;
    }
    float _252 = _136;
    float _254 = _218;
    bool _256 = !_162;
    float _258 = _252;
    if (!_256)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _150 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _258 = _266;
        _170 = _278;
    }
    float _280 = _258;
    float _282 = _170;
    float _284 = fma(_190, _190, _214);
    float _286 = _280;
    float _288 = _284;
    if (!_162)
    {
        _286 = _116;
    }
    float _290 = _286;
    float _292 = _290;
    if (!_162)
    {
        float _294 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _294;
    }
    float _296 = _220;
    bool _298 = !_162;
    float _300 = _296;
    if (!_298)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = _116 * _304;
        float _314 = 1.0 / _308;
        float _316 = _310 * 0.693147182464599609375;
        float _318 = exp2(_312);
        float _320 = 1.0 / _316;
        float _322 = _318 + (-1.0);
        float _324 = -_322;
        float _326 = fma(_324, _320, _116);
        float _328 = _326 * _314;
        float _330 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _330;
    }
    float _332 = _300;
    bool _334 = !_162;
    if (!_334)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = 1.0 / _342;
        float _346 = _116 * _338;
        float _348 = exp2(_346);
        float _350 = -_348;
        float _352 = _350 + 1.0;
        float _354 = _352 * _344;
        _292 = _354;
        _172 = _344;
    }
    float _356 = _292;
    float _358 = _172;
    float _360 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_282, _204, _360);
    float _370 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _372 = fma(_356, _204, _362);
    float _374 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _376 = fma(_282, _202, _364);
    float _378 = fma(_356, _202, _370);
    float _380 = -_372;
    float _382 = _368 + _380;
    float _384 = fma(_356, _206, _374);
    float _386 = sqrt(_284);
    float _388 = fma(_282, _206, _366);
    float _390 = -_378;
    float _392 = _376 + _390;
    float _394 = _382 * _382;
    float _396 = in.m_47.y;
    float _398 = -_384;
    float _400 = _388 + _398;
    float _402 = _364;
    float _404 = _378;
    float _406 = _358;
    if (!_210)
    {
        _402 = 0.0;
    }
    float _408 = _402;
    float _410 = fma(_392, _392, _394);
    float _412 = 0.0;
    float _414 = _408;
    if (_210)
    {
        float _416 = rsqrt(_200);
        _412 = _416;
    }
    float _418 = _412;
    float _420 = in.m_43.x;
    if (!_210)
    {
        _404 = 0.0;
    }
    float _422 = _404;
    float _424 = fma(_400, _400, _410);
    float _426 = _382 * _148;
    float _428 = in.m_41.x;
    float _430 = _382 * _164;
    bool _432 = _386 > 0.0;
    float _434 = sqrt(_424);
    float _436 = in.m_45.x;
    float _438 = _386;
    float _440 = _422;
    if (!_210)
    {
        _438 = 0.0;
    }
    float _442 = _438;
    float _444 = in.m_49.w;
    float _446 = _442;
    if (_210)
    {
        float _448 = _418 * _152;
        _446 = _448;
    }
    float _450 = _446;
    if (_210)
    {
        float _452 = _418 * _148;
        _414 = _452;
    }
    float _454 = _414;
    float _456 = in.m_32.x;
    float _458 = in.m_32.y;
    float _460 = in.m_32.z;
    float _462 = _454;
    if (_210)
    {
        float _464 = _418 * _164;
        _440 = _464;
    }
    float _466 = _440;
    float _468 = _382 * _152;
    float _470 = 0.0;
    float _472 = _466;
    if (_432)
    {
        float _474 = rsqrt(_284);
        _470 = _474;
    }
    float _476 = _470;
    out.m_51.y = _396;
    float _478 = _396;
    if (!_432)
    {
        _406 = 0.0;
    }
    float _480 = _406;
    bool _482 = _434 >= 9.9999999747524270787835121154785e-07;
    bool _484 = isnan(_434);
    bool _486 = _482 || _484;
    bool _488 = isnan(9.9999999747524270787835121154785e-07);
    bool _490 = _486 || _488;
    float _492 = fma(_392, _420, _468);
    float _494 = _434;
    float _496 = _480;
    if (!_432)
    {
        _494 = 0.0;
    }
    float _498 = _494;
    float _500 = fma(_392, _428, _426);
    float _502 = _498;
    if (!_432)
    {
        _288 = 0.0;
    }
    float _504 = _288;
    float _506 = fma(_392, _436, _430);
    float _508 = fma(_400, _168, _492);
    float _510 = fma(_400, _166, _500);
    float _512 = _504;
    float _514 = _508;
    float _516 = _510;
    float _518 = _510;
    float _520 = _508;
    if (_432)
    {
        float _522 = _476 * _168;
        _496 = _522;
    }
    float _524 = _496;
    float _526 = fma(_400, _190, _506);
    float _528 = _526;
    if (_432)
    {
        float _530 = _476 * _166;
        _502 = _530;
    }
    float _532 = _502;
    if (_432)
    {
        float _534 = _476 * _190;
        _512 = _534;
    }
    float _536 = _512;
    float _538 = fma(_376, _444, _456);
    float _540 = fma(_368, _444, _458);
    float _542 = fma(_388, _444, _460);
    if (!_490)
    {
        bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _546 = !_544;
        if (!_546)
        {
            float _548 = _148 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _550 = _152 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _552 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].x, _548);
            float _556 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[16].x, _550);
            float _558 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[16].x, _552);
            float _560 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[16].z, _554);
            float _562 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[16].z, _556);
            float _564 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[16].z, _558);
            float _566 = _560 * _560;
            float _568 = fma(_562, _562, _566);
            float _570 = fma(_564, _564, _568);
            float _572 = rsqrt(_570);
            float _574 = _572 * 9.9999999747524270787835121154785e-07;
            float _576 = _562 * _574;
            float _578 = _560 * _574;
            float _580 = _564 * _574;
            _518 = _578;
            _520 = _576;
            _528 = _580;
            _582 = true;
        }
        else
        {
            float _584 = _204 * _204;
            float _586 = fma(_202, _202, _584);
            float _588 = fma(_206, _206, _586);
            float _590 = sqrt(_588);
            bool _592 = _590 >= 9.9999999747524270787835121154785e-07;
            bool _594 = isnan(_590);
            bool _596 = _592 || _594;
            bool _598 = isnan(9.9999999747524270787835121154785e-07);
            bool _600 = _596 || _598;
            float _602 = _590;
            if (!_600)
            {
                float _604 = _458 * _458;
                float _606 = fma(_456, _456, _604);
                float _608 = fma(_460, _460, _606);
                float _610 = sqrt(_608);
                bool _612 = _610 >= 9.9999999747524270787835121154785e-07;
                bool _614 = isnan(_610);
                bool _616 = _612 || _614;
                bool _618 = isnan(9.9999999747524270787835121154785e-07);
                bool _620 = _616 || _618;
                float _622 = _200;
                if (!_620)
                {
                    float _624 = rsqrt(_200);
                    _622 = _624;
                }
                float _626 = _622;
                if (!_620)
                {
                    float _628 = _626 * 9.9999999747524270787835121154785e-07;
                    _602 = _628;
                }
                float _630 = _602;
                float _632 = _630;
                if (!_620)
                {
                    float _634 = _152 * _630;
                    _514 = _634;
                }
                float _636 = _514;
                _520 = _636;
                if (!_620)
                {
                    float _638 = _148 * _630;
                    _516 = _638;
                }
                float _640 = _516;
                _518 = _640;
                if (!_620)
                {
                    float _642 = _164 * _630;
                    _632 = _642;
                }
                float _644 = _632;
                bool _646 = !_620;
                _528 = _644;
                _582 = _646;
                if (!_582)
                {
                    float _648 = _148 * _458;
                    float _650 = _152 * _458;
                    float _652 = _164 * _458;
                    float _654 = fma(_456, _428, _648);
                    float _656 = fma(_456, _420, _650);
                    float _658 = fma(_456, _436, _652);
                    float _660 = fma(_166, _460, _654);
                    float _662 = fma(_168, _460, _656);
                    float _664 = fma(_190, _460, _658);
                    float _666 = _660 * _660;
                    float _668 = fma(_662, _662, _666);
                    float _670 = fma(_664, _664, _668);
                    float _672 = rsqrt(_670);
                    float _674 = _672 * 9.9999999747524270787835121154785e-07;
                    float _676 = _662 * _674;
                    float _678 = _660 * _674;
                    float _680 = _664 * _674;
                    _518 = _678;
                    _520 = _676;
                    _528 = _680;
                    _582 = true;
                }
            }
            else
            {
                float _682 = _148 * _204;
                float _684 = _152 * _204;
                float _686 = _164 * _204;
                float _688 = fma(_202, _428, _682);
                float _690 = fma(_202, _420, _684);
                float _692 = fma(_202, _436, _686);
                float _694 = fma(_166, _206, _688);
                float _696 = fma(_168, _206, _690);
                float _698 = fma(_190, _206, _692);
                float _700 = _694 * _694;
                float _702 = fma(_696, _696, _700);
                float _704 = fma(_698, _698, _702);
                float _706 = rsqrt(_704);
                float _708 = _706 * 9.9999999747524270787835121154785e-07;
                float _710 = _696 * _708;
                float _712 = _694 * _708;
                float _714 = _698 * _708;
                _518 = _712;
                _520 = _710;
                _528 = _714;
            }
        }
    }
    _582 = false;
    float _716 = _518;
    float _718 = _520;
    float _720 = _528;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _724 = !_722;
    float _742;
    if (!_724)
    {
        float _726 = in.m_53.x;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _730 = _726 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        _742 = _128;
    }
    _744 = false;
    float _746 = _742;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _750 = _746 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _754 = _746 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _758 = _746 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = 1.0 / _766;
    bool _778 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _780 = isnan(_746);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = 1.0 / _774;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _792;
    bool _796 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _798 = 1.0 / _770;
    float _800 = 1.0 / _762;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _804 = _746 + _802;
    float _806 = _750 * _790;
    bool _808 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _810 = isnan(_746);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _804 * _776;
    bool _822 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _824 = isnan(_746);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = _754 * _798;
    bool _836 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _838 = isnan(_746);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -_832;
    float _850 = _848 + 1.0;
    float _852 = fma(_794, _834, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _854 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _856 = isnan(_746);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = _818 * _850;
    float _868 = _758 * _800;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _874;
    float _878 = -_818;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = fma(_872, _834, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _888 = fma(_876, _834, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _890 = -_846;
    float _892 = _890 + 1.0;
    float _894 = _846 * _880;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _904 = _788 * _892;
    float _906 = -_788;
    float _908 = _906 + 1.0;
    float _910 = fma(_898, _806, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _912 = fma(_902, _806, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _914 = _864 * _908;
    float _916 = fma(_884, _806, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _918 = _888 * _914;
    float _920 = _886 * _914;
    float _922 = -_864;
    float _924 = _922 + 1.0;
    float _926 = _852 * _914;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _936;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].x, _920);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].y, _918);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].z, _926);
    float _946 = fma(_930, _868, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _948 = fma(_934, _868, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _950 = fma(_938, _868, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _952 = fma(_910, _904, _940);
    float _954 = fma(_912, _904, _942);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _964 = fma(_916, _904, _944);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _970 = fma(_946, _894, _952);
    float _972 = fma(_958, _820, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _974 = fma(_962, _820, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _976 = fma(_968, _820, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _978 = fma(_948, _894, _954);
    float _980 = fma(_950, _894, _964);
    float _982 = fma(_972, _866, _970);
    float _984 = fma(_974, _866, _978);
    float _986 = fma(_976, _866, _980);
    float _988 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].x, _982);
    float _990 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].y, _984);
    float _992 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].z, _986);
    bool _994 = !_796;
    float _1012;
    if (!_994)
    {
        float _996 = in.m_53.x;
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1000 = _996 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _128;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = in.m_49.x;
    float _1020 = in.m_49.y;
    float _1022 = in.m_49.z;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1026 = _1016 + _1024;
    bool _1028 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1030;
    float _1034 = 1.0 / _1032;
    float _1036 = _992 * _1022;
    float _1038 = _990 * _1020;
    float _1040 = _1026 * _1034;
    bool _1042 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1044 = isnan(_1016);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -_1052;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1058;
    bool _1062 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1064 = isnan(_1016);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1078;
    float _1082 = fma(_1060, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1084 = _1072 * _1056;
    float _1086 = fma(_1076, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1088 = fma(_1080, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1090 = -_1072;
    float _1092 = _1090 + 1.0;
    float _1094 = _1082 * _1084;
    float _1096 = _1086 * _1084;
    float _1098 = _1088 * _1084;
    float _1100 = _988 * _1018;
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1094);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1096);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1098);
    float _1108 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1102);
    float _1110 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1104);
    float _1112 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1106);
    bool _1114 = !_1028;
    float _1132;
    if (!_1114)
    {
        float _1116 = in.m_53.x;
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1120 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _1124 = _1122 * _1118;
        float _1126 = floor(_1124);
        float _1128 = -_1126;
        float _1130 = _1124 + _1128;
        _1132 = _1130;
        _1134 = true;
    }
    else
    {
        _1132 = _128;
    }
    _1134 = false;
    float _1136 = _1132;
    float _1138 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1140 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1150 = 1.0 / _1144;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1160 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1162 = isnan(_1136);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1176 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1178 = isnan(_1136);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1190 = 1.0 / _1148;
    bool _1192 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1194 = isnan(_1136);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = -_1170;
    float _1206 = _1204 + 1.0;
    float _1208 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = -_1202;
    float _1216 = _1214 + 1.0;
    float _1218 = _1202 * _1206;
    float _1220 = _1154 * _1150;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1224 = _1136 + _1222;
    float _1226 = 1.0 / _1158;
    float _1228 = _1186 * _1216;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1234 = fma(_1220, _1224, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1236 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1238 = isnan(_1136);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1248;
    float _1252 = _1232 * _1190;
    float _1254 = _1234 * _1228;
    float _1256 = 1.0 / _1174;
    float _1258 = -_1246;
    float _1260 = _1258 + 1.0;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1264 = _1136 + _1262;
    bool _1266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1268 = _1170 * _1260;
    float _1270 = -_1186;
    float _1272 = _1270 + 1.0;
    bool _1274 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1276 = isnan(_1136);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = _1250 * _1226;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1294 = _1136 + _1292;
    float _1296 = fma(_1252, _1264, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1298 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1254);
    float _1300 = -_1284;
    float _1302 = _1300 + 1.0;
    float _1304 = fma(_1286, _1294, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1308 = _1136 + _1306;
    float _1310 = _1290 * _1256;
    float _1312 = fma(_1296, _1218, _1298);
    float _1314 = _1246 * _1302;
    float _1316 = fma(_1310, _1308, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1318 = fma(_1304, _1268, _1312);
    float _1320 = fma(_1316, _1314, _1318);
    float _1322 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1320);
    float _1324 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1208;
    out.m_55.y = _1210;
    out.m_55.z = _1212;
    out.m_55.w = _1324;
    bool _1326 = !_1266;
    float _1344;
    if (!_1326)
    {
        float _1328 = in.m_53.x;
        float _1330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1332 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _1336 = _1334 * _1330;
        float _1338 = floor(_1336);
        float _1340 = -_1338;
        float _1342 = _1336 + _1340;
        _1344 = _1342;
        _1346 = true;
    }
    else
    {
        _1344 = _128;
    }
    _1346 = false;
    float _1348 = _1344;
    float _1350 = in.m_53.x;
    float _1352 = _540 * _148;
    float _1354 = _540 * _152;
    float _1356 = in.m_53.z;
    float _1358 = fma(_538, _428, _1352);
    float _1360 = _540 * _164;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1364 = _1362 != 0;
    float _1366 = in.m_53.y;
    float _1368 = fma(_538, _420, _1354);
    float _1370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1372 = log2(_1370);
    float _1374 = fma(_538, _436, _1360);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1380 = in.m_53.w;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1394 = _1392 != 0;
    float _1396 = fma(_542, _168, _1368);
    float _1398 = _1350 * 2.0;
    float _1400 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1404 = fma(_542, _166, _1358);
    float _1406 = _1356 * 2.0;
    float _1408 = -_1376;
    float _1410 = fma(_1400, 2.0, _1408);
    float _1412 = floor(_1398);
    float _1414 = _1400;
    float _1416 = _1406;
    bool _1418 = _1394;
    if (!_1364)
    {
        _1414 = _1356;
    }
    float _1420 = _1414;
    float _1422 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1424 = _1366 * 2.0;
    float _1426 = _1420;
    float _1428 = _1422;
    if (_1364)
    {
        _1426 = _1366;
    }
    float _1430 = _1426;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1434 = fma(_1422, -2.0, _1378);
    if (!_1364)
    {
        _1428 = _1356;
    }
    float _1436 = _1428;
    float _1438 = floor(_1406);
    float _1440 = _1436;
    if (_1364)
    {
        _1440 = _1366;
    }
    float _1442 = _1440;
    float _1444 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1382);
    float _1446 = _1372 * _116;
    float _1448 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1434);
    float _1450 = _1366 + _1356;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1454 = fma(_542, _190, _1374);
    bool _1456 = _1412 >= 0.0;
    bool _1458 = isnan(_1412);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = floor(_1424);
    if (!_1364)
    {
        _1416 = _1366;
    }
    float _1468 = _1416;
    float _1470 = _1450 + (-1.0);
    float _1472 = _1468;
    if (_1364)
    {
        _1472 = _1350;
    }
    float _1474 = _1472;
    float _1476 = _1350 + _1366;
    bool _1478 = _1412 > 0.0;
    float _1480 = in.m_47.x;
    bool _1482 = _1438 > 0.0;
    float _1484 = exp2(_1446);
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1402);
    bool _1488 = _1438 >= 0.0;
    bool _1490 = isnan(_1438);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1500 = _1464 ? 0 : 1;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1504 = _1496 ? 0 : 1;
    float _1506 = -_1432;
    float _1508 = fma(_1498, 2.0, _1506);
    bool _1510 = _1466 > 0.0;
    float _1512 = fma(_1452, -2.0, _1502);
    float _1514 = _1476 + (-1.0);
    int _1516 = ~_1504;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    float _1522 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1524 = _1520;
    if (!_1482)
    {
        int _1526 = ~_1504;
        int _1528 = _1526 + 1;
        _1524 = _1528;
    }
    int _1530 = _1524;
    float _1532 = -_1484;
    float _1534 = _1532 + 1.0;
    bool _1536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1538 = isnan(1.0);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1544 = _1540 || _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1548 = 1.0 + _1546;
    int _1550 = ~_1500;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    float _1556 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1558 = _1554;
    if (!_1478)
    {
        int _1560 = ~_1500;
        int _1562 = _1560 + 1;
        _1558 = _1562;
    }
    int _1564 = _1558;
    float _1566 = 1.0 / _1548;
    float _1568 = _1396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1570 = _1454 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1572 = _1466 >= 0.0;
    bool _1574 = isnan(_1466);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan(0.0);
    bool _1580 = _1576 || _1578;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1584 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1592 = _1588 || _1590;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1596 = _1580 ? 0 : 1;
    float _1598 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1582);
    float _1600 = _1592 ? _1534 : 0.0;
    float _1602 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    int _1604 = ~_1596;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    float _1610 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1598);
    int _1612 = _1608;
    if (!_1510)
    {
        int _1614 = ~_1596;
        int _1616 = _1614 + 1;
        _1612 = _1616;
    }
    int _1618 = _1612;
    float _1620 = -_116;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1410);
    float _1624 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1486);
    float _1626 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1602);
    float _1628 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1444);
    float _1630 = -_116;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1508);
    float _1634 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1512);
    if (_1544)
    {
        float _1636 = _1600 * _1566;
        _138 = _1636;
    }
    float _1638 = _138;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1644 = !_1386;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = _716 * _716;
    bool _1650 = _1380 > 0.5;
    float _1652 = 1.0 / _1642;
    float _1654 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1660;
    float _1664 = fma(_718, _718, _1648);
    float _1666 = 1.0 / _1658;
    float _1668 = fma(_128, 0.4000000059604644775390625, 0.300000011920928955078125);
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1674 = _1662 * _1652;
    float _1676 = fma(_720, _720, _1664);
    int _1678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1680 = _1678 != 0;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1684 = _1682 != 0;
    float _1686 = rsqrt(_1676);
    float _1688 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1690 = _1350 + _1356;
    float _1692 = _1672 * _1666;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1696 = _1694 != 0;
    float _1698 = _1690 + (-1.0);
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = in.m_57.x;
    float _1706 = in.m_57.y;
    float _1708 = in.m_57.z;
    int _1710 = abs(_1646);
    float _1712 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1716 = _1348 + _1714;
    float _1718 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1720 = float(_1618);
    float _1722 = _1686 * _716;
    float _1724 = fma(_1674, _1716, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1726 = _1686 * _718;
    float _1728 = float(_1710);
    float _1730 = _1722 * _454;
    float _1732 = float(_1530);
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1736 = _1348 + _1734;
    float _1738 = _1686 * _720;
    float _1740 = fma(_1726, _450, _1730);
    bool _1742 = !_1390;
    int _1744 = _1742 ? 0 : 1;
    float _1746 = _1728 * _1732;
    float _1748 = fma(_1692, _1736, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1750 = fma(_1738, _466, _1740);
    float _1752 = _1740;
    float _1754 = _1688;
    bool _1756 = _1696;
    float _1758 = _1480;
    if (!_1680)
    {
        _1752 = _1480;
    }
    float _1760 = _1752;
    float _1762 = _1746 * (-2.0);
    int _1764 = abs(_1744);
    float _1766 = _1350 + (-0.5);
    float _1768 = abs(_1750);
    bool _1770 = _1768 > 0.99989998340606689453125;
    float _1772 = fma(_1718, _1762, _1718);
    bool _1774 = !_1394;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = fma(_1762, _1704, _1704);
    float _1780 = _1350 + _1480;
    float _1782 = _1760;
    if (_1680)
    {
        bool _1784 = _1350 > 0.5;
        _1418 = _1784;
    }
    bool _1786 = _1418;
    float _1788 = _1366 + _1480;
    int _1790 = abs(_1776);
    float _1792 = _1780 * 6.283185482025146484375;
    float _1794 = _1788 * 18.84955596923828125;
    float _1796 = _1792 * 0.15915493667125701904296875;
    float _1798 = float(_1764);
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1778);
    float _1802 = float(_1564);
    float _1804 = -_396;
    float _1806 = _1804 + 1.0;
    float _1808 = float(_1790);
    float _1810 = _1794 * 0.15915493667125701904296875;
    float _1812 = _1796 * 6.283185482025146484375;
    float _1814 = sin(_1812);
    float _1816 = _1798 * _1802;
    if (_1770)
    {
        float _1818 = fma(_536, 0.001000000047497451305389404296875, _466);
        _472 = _1818;
    }
    float _1820 = _472;
    float _1822 = _1808 * _1720;
    float _1824 = fma(_1772, _1638, _1800);
    float _1826 = _1816 * (-2.0);
    int _1828 = _1650 ? as_type<int>(_1806) : as_type<int>(_396);
    if (_1770)
    {
        float _1830 = fma(_532, 0.001000000047497451305389404296875, _454);
        _462 = _1830;
    }
    float _1832 = _462;
    bool _1834 = _1366 > 0.5;
    float _1836 = _1366 + (-0.5);
    float _1838 = fma(_1826, _1706, _1706);
    float _1840 = _1810 * 6.283185482025146484375;
    float _1842 = sin(_1840);
    float _1844 = _1824 * 0.15915493667125701904296875;
    float _1846 = fma(_1688, _1826, _1688);
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1838);
    float _1850 = _1822 * (-2.0);
    if (!_1770)
    {
        _1754 = _450;
    }
    float _1852 = _1754;
    float _1854 = _1852;
    if (_1770)
    {
        float _1856 = fma(_524, 0.001000000047497451305389404296875, _450);
        _1854 = _1856;
    }
    float _1858 = _1854;
    float _1860 = _1696 ? as_type<float>(_1828) : _396;
    float _1862 = fma(_1846, _1638, _1848);
    if (_1702)
    {
        float _1864 = _1834 ? _1806 : _396;
        _478 = _1864;
    }
    float _1866 = _478;
    float _1868 = fma(_1850, _1708, _1708);
    if (_1684)
    {
        bool _1870 = _1356 > 0.5;
        _1756 = _1870;
    }
    bool _1872 = _1756;
    float _1874 = in.m_59.x;
    float _1876 = in.m_59.y;
    float _1878 = in.m_59.z;
    float _1880 = _1356 + (-0.5);
    float _1882 = fma(_1712, _1850, _1712);
    float _1884 = -_1820;
    float _1886 = _1722 * _1884;
    float _1888 = _1842 * 0.125;
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1868);
    float _1892 = -_1832;
    float _1894 = _1726 * _1892;
    float _1896 = -_1832;
    float _1898 = -_1886;
    float _1900 = fma(_1738, _1896, _1898);
    float _1902 = fma(_1814, 0.5, _1888);
    float _1904 = fma(_1882, _1638, _1890);
    float _1906 = -_1858;
    float _1908 = _1738 * _1906;
    float _1910 = _1862 * 0.15915493667125701904296875;
    float _1912 = _1902 + 0.625;
    float _1914 = _1904 * 0.15915493667125701904296875;
    float _1916 = -_1820;
    float _1918 = -_1908;
    float _1920 = fma(_1726, _1916, _1918);
    float _1922 = _1844 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = _1912 * _1668;
    float _1928 = -_1858;
    float _1930 = -_1894;
    float _1932 = fma(_1722, _1928, _1930);
    float _1934 = _1920 * _1920;
    float _1936 = _1844 * 6.283185482025146484375;
    float _1938 = cos(_1936);
    float _1940 = fma(_1874, _1926, _1874);
    float _1942 = fma(_1876, _1926, _1876);
    float _1944 = fma(_1878, _1926, _1878);
    float _1946 = fma(_1900, _1900, _1934);
    float _1948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1940);
    float _1950 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1942);
    float _1952 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1944);
    float _1954 = _1910 * 6.283185482025146484375;
    float _1956 = sin(_1954);
    float _1958 = fma(_1932, _1932, _1946);
    float _1960 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1962 = _1522 * _1948;
    float _1964 = _1556 * _1950;
    float _1966 = _1960 * _1952;
    float _1968 = _1910 * 6.283185482025146484375;
    float _1970 = cos(_1968);
    float _1972 = _1914 * 6.283185482025146484375;
    float _1974 = cos(_1972);
    float _1976 = _1924 * _1956;
    float _1978 = _1938 * _1956;
    float _1980 = _1914 * 6.283185482025146484375;
    float _1982 = sin(_1980);
    float _1984 = _1938 * _1970;
    float _1986 = _1924 * _1970;
    float _1988 = rsqrt(_1958);
    float _1990 = _1924 * _1974;
    float _1992 = _1970 * _1974;
    float _1994 = _1938 * _1974;
    float _1996 = _1956 * _1974;
    float _1998 = _1994 * _1726;
    float _2000 = fma(_1982, _1984, _1976);
    float _2002 = -_1978;
    float _2004 = fma(_1982, _1986, _2002);
    float _2006 = -_1986;
    float _2008 = fma(_1982, _1978, _2006);
    float _2010 = fma(_1982, _1976, _1984);
    float _2012 = _2000 * _1738;
    float _2014 = _2000 * _1726;
    float _2016 = _1994 * _1738;
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2020 = _1932 * _1988;
    float _2022 = _1900 * _1988;
    float _2024 = _1920 * _1988;
    float _2026 = _2008 * _1738;
    float _2028 = fma(_1992, _2020, _2012);
    float _2030 = fma(_1992, _2022, _2014);
    float _2032 = _1722 * _2020;
    float _2034 = _1726 * _2024;
    float _2036 = -_1982;
    float _2038 = fma(_2036, _2022, _1998);
    float _2040 = -_1982;
    float _2042 = fma(_2040, _2020, _2016);
    float _2044 = -_2032;
    float _2046 = fma(_1738, _2024, _2044);
    float _2048 = -_2034;
    float _2050 = fma(_1722, _2022, _2048);
    float _2052 = _2008 * _1726;
    float _2054 = fma(_1996, _2020, _2026);
    float _2056 = fma(_1990, _2046, _2038);
    float _2058 = fma(_1990, _2050, _2042);
    float _2060 = fma(_2004, _2050, _2028);
    float _2062 = fma(_1996, _2022, _2052);
    float _2064 = _1964 * _2056;
    float _2066 = _1964 * _2058;
    float _2068 = fma(_2004, _2046, _2030);
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2072 = fma(_2010, _2050, _2054);
    float _2074 = fma(_1962, _2060, _2066);
    float _2076 = fma(_2010, _2046, _2062);
    float _2078 = fma(_1962, _2068, _2064);
    bool _2080 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2082 = isnan(_1348);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = fma(_1966, _2072, _2074);
    bool _2094 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2096 = isnan(_1348);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = fma(_1966, _2076, _2078);
    bool _2108 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2110 = isnan(_1348);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -_2090;
    float _2122 = _2120 + 1.0;
    float _2124 = _1738 * _2022;
    float _2126 = _1568 + _2106;
    float _2128 = _1994 * _1722;
    float _2130 = _2118 * _2122;
    float _2132 = _1570 + _2092;
    float _2134 = -_2118;
    float _2136 = _2134 + 1.0;
    float _2138 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2142 = _2126 + _2140;
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2146 = _2132 + _2144;
    float _2148 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2150 = _2104 * _2136;
    float _2152 = _2142 * _2142;
    float _2154 = _2146 * _2146;
    float _2156 = fma(_1860, _2148, -0.5);
    float _2158 = _1724 * _2150;
    float _2160 = fma(_2138, _1866, -0.5);
    float _2162 = _2152 + _2154;
    float _2164 = -_1982;
    float _2166 = fma(_2164, _2024, _2128);
    float _2168 = _2000 * _1722;
    float _2170 = -_2124;
    float _2172 = fma(_1726, _2020, _2170);
    float _2174 = sqrt(_2162);
    int _2176 = as_type<int>(_1982);
    float _2178 = _2152;
    float _2180 = _2154;
    float _2182 = _2132;
    float _2184 = _2126;
    if (_1680)
    {
        float _2186 = -_1480;
        float _2188 = _2186 + 1.0;
        _2176 = as_type<int>(_2188);
    }
    int _2190 = _2176;
    float _2192 = _2008 * _1722;
    float _2194 = fma(_1992, _2024, _2168);
    float _2196 = fma(_1990, _2172, _2166);
    float _2198 = -_2104;
    float _2200 = _2198 + 1.0;
    float _2202 = fma(_1996, _2024, _2192);
    float _2204 = fma(_2004, _2172, _2194);
    float _2206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2208 = _1964 * _2196;
    int _2210 = _2190;
    if (_1680)
    {
        float _2212 = _1786 ? as_type<float>(_2190) : _1480;
        _1782 = _2212;
    }
    float _2214 = _1782;
    float _2216 = fma(_2010, _2172, _2202);
    if (_1684)
    {
        float _2218 = -_1480;
        float _2220 = _2218 + 1.0;
        _2210 = as_type<int>(_2220);
    }
    int _2222 = _2210;
    float _2224 = fma(_1962, _2204, _2208);
    float _2226 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2158);
    float _2228 = -_1448;
    float _2230 = fma(_1626, _2160, _2228);
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2234 = _2174 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2236 = fma(_1966, _2216, _2224);
    float _2238 = _2236;
    if (_1684)
    {
        float _2240 = _1872 ? as_type<float>(_2222) : _1480;
        _1758 = _2240;
    }
    float _2242 = _1758;
    float _2244 = fma(_1748, _2130, _2226);
    float _2246 = -_1634;
    float _2248 = fma(_1628, _2156, _2246);
    float _2250 = _1654 + _2236;
    float _2252 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2254 = fma(_2252, _2214, -0.5);
    if (!_2234)
    {
        _2238 = _2250;
    }
    float _2256 = _2238;
    float _2258 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2260 = fma(_2258, _2242, -0.5);
    bool _2262 = !_2234;
    float _2264 = _2256;
    if (!_2262)
    {
        float _2266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2270 = _2174 + _2268;
        float _2272 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = rsqrt(_2162);
        float _2276 = _2270 * _2266;
        float _2278 = _2276 * 0.15915493667125701904296875;
        float _2280 = _2278 * 6.283185482025146484375;
        float _2282 = sin(_2280);
        float _2284 = _2278 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = fma(_2282, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2290 = _2274 * _2288;
        float _2292 = _2286 + (-1.0);
        float _2294 = fma(_2142, _2290, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2296 = fma(_2146, _2290, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2298 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2302 = _2294 + _2300;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2306 = _2296 + _2304;
        float _2308 = fma(_2250, _2286, _2298);
        float _2310 = _2302 * _2302;
        float _2312 = _2306 * _2306;
        _2264 = _2308;
        _2178 = _2310;
        _2180 = _2312;
        _2182 = _2296;
        _2184 = _2294;
    }
    float _2314 = _2264;
    float _2316 = _2178;
    float _2318 = _2180;
    float _2320 = _2182;
    float _2322 = _2184;
    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2326 = _2314 + _2324;
    float _2328 = in.m_61.w;
    float _2330 = fma(_1610, _2254, _1622);
    float _2332 = fma(_1624, _2260, _1632);
    float _2334 = fma(_2326, _2326, _2316);
    float _2336 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2244);
    float _2338 = _2334 + _2318;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2342 = _2230 + 0.5;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2346 = _2248 + 0.5;
    float _2348 = sqrt(_2338);
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2352 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2360 = _2330 + 0.5;
    float _2362 = _2332 + 0.5;
    out.m_63.x = _2352;
    out.m_63.y = _2354;
    out.m_63.z = _2358;
    out.m_63.w = _2356;
    out.m_65.w = _2328;
    bool _2364 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2366 = isnan(_2348);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2372 = _2368 || _2370;
    out.m_67.x = _2360;
    out.m_67.y = _2342;
    out.m_67.z = _2362;
    out.m_67.w = _2346;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (!_2372)
    {
        _2374 = 1.0;
    }
    float _2376 = _2374;
    bool _2378 = !_2372;
    float _2380 = _2376;
    if (!_2378)
    {
        bool _2382 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2384 = isnan(_2348);
        bool _2386 = _2382 || _2384;
        bool _2388 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2390 = _2386 || _2388;
        if (!_2390)
        {
            float _2392 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2394 = _2348 + _2392;
            float _2396 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2398 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2396;
            float _2400 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2404 = 1.0 / _2398;
            float _2406 = _2394 * _2404;
            float _2408 = fma(_2406, _2402, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2380 = _2408;
            _2410 = true;
        }
        else
        {
            bool _2412 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2414 = isnan(_2348);
            bool _2416 = _2412 || _2414;
            bool _2418 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2420 = _2416 || _2418;
            if (!_2420)
            {
                float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2424 = _2348 + _2422;
                float _2426 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2428 = _2426 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2430 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2432 = _2430 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2434 = 1.0 / _2428;
                float _2436 = _2424 * _2434;
                float _2438 = fma(_2436, _2432, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2380 = _2438;
                _2410 = true;
            }
            else
            {
                _2380 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2410 = false;
    float _2440 = _2380;
    float _2442 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2444 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2446 = _2314 + _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2450 = _2320 + _2448;
    float _2452 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2442);
    float _2454 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2456 = fma(_2446, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2458 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.5);
    bool _2466 = _2462 || _2464;
    float _2468 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2452);
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2472 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2454);
    float _2474 = 1.0 / _2470;
    float _2476 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2472);
    bool _2478 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan(0.5);
    bool _2486 = _2482 || _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2490 = _2322 + _2488;
    float _2492 = _2476 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2494 = _2492 + _2470;
    float _2496 = fma(_2490, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2498 = fma(_2450, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2500 = _2494 * _2474;
    float _2502 = _2500 * 0.5;
    float _2504 = _2494;
    float _2506 = _2490;
    float _2508 = _2496;
    if (_2486)
    {
        _2504 = _2456;
    }
    float _2510 = _2504;
    float _2512 = _2510;
    if (_2486)
    {
        _2506 = _2498;
    }
    float _2514 = _2506;
    float _2516 = _2514;
    if (!_2486)
    {
        float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2520 = _1654 + _2518;
        float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2524 = _1568 + _2522;
        float _2526 = -_1568;
        float _2528 = _2526 + _2496;
        float _2530 = -_1570;
        float _2532 = _2530 + _2498;
        float _2534 = _2520 * _2520;
        float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2538 = _1570 + _2536;
        float _2540 = fma(_2524, _2524, _2534);
        float _2542 = fma(_2538, _2538, _2540);
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2546 = sqrt(_2542);
        float _2548 = precise::min(_2546, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2550 = _2548 * _2544;
        float _2552 = -_1654;
        float _2554 = _2552 + _2456;
        float _2556 = fma(_2528, _2550, _1568);
        float _2558 = fma(_2554, _2550, _1654);
        float _2560 = fma(_2532, _2550, _1570);
        _2512 = _2558;
        _2508 = _2556;
        _2516 = _2560;
    }
    float _2562 = _2512;
    float _2564 = _2508;
    float _2566 = _2516;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2570 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2568);
    float _2572 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2576 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2578 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2580 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2582 = 1.0 / _2570;
    float _2584 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2574);
    float _2586 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2576);
    float _2588 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2580);
    float _2590 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2578);
    float _2592 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2584);
    float _2594 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2586);
    float _2596 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2598 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2590);
    float _2600 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2602 = _2590;
    if (_2466)
    {
        _2602 = 1.0;
    }
    float _2604 = _2602;
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2608 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2610 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2614 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2606);
    float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2608);
    float _2618 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2610);
    float _2620 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2612);
    float _2622 = _2606;
    float _2624 = _2604;
    if (_2466)
    {
        _2622 = 1.0;
    }
    float _2626 = _2622;
    float _2628 = _2594 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2632 = _2582 * _2630;
    float _2634 = _2626;
    if (!_2466)
    {
        float _2636 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2638 = _2636 * 0.15915493667125701904296875;
        float _2640 = _2638 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        float _2644 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2646 = _2644 * 0.15915493667125701904296875;
        float _2648 = _2638 * 6.283185482025146484375;
        float _2650 = sin(_2648);
        float _2652 = 1.0 / _2642;
        float _2654 = _2646 * 6.283185482025146484375;
        float _2656 = cos(_2654);
        float _2658 = _2650 * _2652;
        float _2660 = _2646 * 6.283185482025146484375;
        float _2662 = sin(_2660);
        float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2666 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2664;
        float _2668 = _2656 * _2658;
        float _2670 = 1.0 / _2666;
        float _2672 = 1.0 / _2668;
        float _2674 = _2662 * _2672;
        float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2678 = fma(_2632, _2674, _2676);
        float _2680 = _2678 * _2670;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        _2624 = _2682;
    }
    float _2684 = _2624;
    if (!_2466)
    {
        float _2686 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = _2688 * 6.283185482025146484375;
        float _2692 = cos(_2690);
        float _2694 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2696 = _2694 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2692;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2632, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2634 = _2736;
    }
    float _2738 = _2634;
    float _2740 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2614);
    float _2742 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2616);
    float _2744 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2618);
    float _2746 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2748 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2620);
    bool _2750 = _2684 > 0.0;
    bool _2752 = isnan(_2684);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(0.0);
    bool _2758 = _2754 || _2756;
    float _2760 = _2684 * _2738;
    float _2762 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2740);
    float _2764 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2748);
    float _2766 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2744);
    bool _2768 = _2738 <= 0.0;
    bool _2770 = !_2758;
    bool _2772 = _2768 || _2770;
    float _2774 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2742);
    float _2776 = _2762 + _2764;
    float _2778 = _2766 + _2764;
    float _2780 = _2764 * 0.5;
    float _2782 = _2760 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2784 = _2776 * 0.5;
    float _2786 = _2778 * 0.5;
    float _2788 = fma(_2774, -0.5, _2780);
    float _2790 = _2782 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2762;
    out.gl_Position.y = _2774;
    out.gl_Position.z = _2766;
    out.gl_Position.w = _2764;
    out.m_69.x = _2784;
    out.m_69.y = _2788;
    out.m_69.z = _2786;
    out.m_69.w = _2764;
    out.m_35.x = _2790;
    if (!_2772)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2792 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2792;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2410 = false;
    bool _1346 = false;
    bool _1134 = false;
    bool _1014 = false;
    bool _744 = false;
    bool _582 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_32.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_35.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_104);
        out.gl_Position.z = _2850;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_37.w;
    float _110 = float(_88);
    float _112 = 1.0 / _110;
    float _114 = -_108;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_108);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = _116 * _112;
    bool _130 = _116 >= _110;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    out.m_39.x = _128;
    float _136 = 0.0;
    float _138 = _116;
    if (_134)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _96;
    if (_134)
    {
        out.m_35.x = 0.0;
    }
    if (_134)
    {
        float _142 = _140 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    float _146 = as_type<float>(_144);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2923 = as_type<float>(_144);
        out.gl_Position.z = _2923;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_41.y;
    float _150 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_43.y;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_45.y;
    float _166 = in.m_41.z;
    float _168 = in.m_43.z;
    float _170 = _150;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_162)
    {
        float _174 = _150 * _150;
        float _176 = _174 * 0.5;
        _146 = _176;
    }
    float _178 = _146;
    float _180 = 0.0;
    float _182 = _178;
    if (!_162)
    {
        float _184 = _116 * _116;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = in.m_45.z;
    if (!_162)
    {
        float _192 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _192;
    }
    float _194 = _182;
    float _196 = _148 * _148;
    float _198 = fma(_152, _152, _196);
    float _200 = fma(_164, _164, _198);
    float _202 = in.m_37.x;
    float _204 = in.m_37.y;
    float _206 = in.m_37.z;
    float _208 = sqrt(_200);
    bool _210 = _208 > 0.0;
    float _212 = _166 * _166;
    float _214 = fma(_168, _168, _212);
    bool _216 = !_162;
    float _218 = _194;
    float _220 = _214;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _150 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _150);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _136 = _240;
        _218 = _250;
    }
    float _252 = _136;
    float _254 = _218;
    bool _256 = !_162;
    float _258 = _252;
    if (!_256)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _150 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _258 = _266;
        _170 = _278;
    }
    float _280 = _258;
    float _282 = _170;
    float _284 = fma(_190, _190, _214);
    float _286 = _280;
    float _288 = _284;
    if (!_162)
    {
        _286 = _116;
    }
    float _290 = _286;
    float _292 = _290;
    if (!_162)
    {
        float _294 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _294;
    }
    float _296 = _220;
    bool _298 = !_162;
    float _300 = _296;
    if (!_298)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = _116 * _304;
        float _314 = 1.0 / _308;
        float _316 = _310 * 0.693147182464599609375;
        float _318 = exp2(_312);
        float _320 = 1.0 / _316;
        float _322 = _318 + (-1.0);
        float _324 = -_322;
        float _326 = fma(_324, _320, _116);
        float _328 = _326 * _314;
        float _330 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _330;
    }
    float _332 = _300;
    bool _334 = !_162;
    if (!_334)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = 1.0 / _342;
        float _346 = _116 * _338;
        float _348 = exp2(_346);
        float _350 = -_348;
        float _352 = _350 + 1.0;
        float _354 = _352 * _344;
        _292 = _354;
        _172 = _344;
    }
    float _356 = _292;
    float _358 = _172;
    float _360 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_282, _204, _360);
    float _370 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _372 = fma(_356, _204, _362);
    float _374 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _376 = fma(_282, _202, _364);
    float _378 = fma(_356, _202, _370);
    float _380 = -_372;
    float _382 = _368 + _380;
    float _384 = fma(_356, _206, _374);
    float _386 = sqrt(_284);
    float _388 = fma(_282, _206, _366);
    float _390 = -_378;
    float _392 = _376 + _390;
    float _394 = _382 * _382;
    float _396 = in.m_47.y;
    float _398 = -_384;
    float _400 = _388 + _398;
    float _402 = _364;
    float _404 = _378;
    float _406 = _358;
    if (!_210)
    {
        _402 = 0.0;
    }
    float _408 = _402;
    float _410 = fma(_392, _392, _394);
    float _412 = 0.0;
    float _414 = _408;
    if (_210)
    {
        float _416 = rsqrt(_200);
        _412 = _416;
    }
    float _418 = _412;
    float _420 = in.m_43.x;
    if (!_210)
    {
        _404 = 0.0;
    }
    float _422 = _404;
    float _424 = fma(_400, _400, _410);
    float _426 = _382 * _148;
    float _428 = in.m_41.x;
    float _430 = _382 * _164;
    bool _432 = _386 > 0.0;
    float _434 = sqrt(_424);
    float _436 = in.m_45.x;
    float _438 = _386;
    float _440 = _422;
    if (!_210)
    {
        _438 = 0.0;
    }
    float _442 = _438;
    float _444 = in.m_49.w;
    float _446 = _442;
    if (_210)
    {
        float _448 = _418 * _152;
        _446 = _448;
    }
    float _450 = _446;
    if (_210)
    {
        float _452 = _418 * _148;
        _414 = _452;
    }
    float _454 = _414;
    float _456 = in.m_32.x;
    float _458 = in.m_32.y;
    float _460 = in.m_32.z;
    float _462 = _454;
    if (_210)
    {
        float _464 = _418 * _164;
        _440 = _464;
    }
    float _466 = _440;
    float _468 = _382 * _152;
    float _470 = 0.0;
    float _472 = _466;
    if (_432)
    {
        float _474 = rsqrt(_284);
        _470 = _474;
    }
    float _476 = _470;
    out.m_51.y = _396;
    float _478 = _396;
    if (!_432)
    {
        _406 = 0.0;
    }
    float _480 = _406;
    bool _482 = _434 >= 9.9999999747524270787835121154785e-07;
    bool _484 = isnan(_434);
    bool _486 = _482 || _484;
    bool _488 = isnan(9.9999999747524270787835121154785e-07);
    bool _490 = _486 || _488;
    float _492 = fma(_392, _420, _468);
    float _494 = _434;
    float _496 = _480;
    if (!_432)
    {
        _494 = 0.0;
    }
    float _498 = _494;
    float _500 = fma(_392, _428, _426);
    float _502 = _498;
    if (!_432)
    {
        _288 = 0.0;
    }
    float _504 = _288;
    float _506 = fma(_392, _436, _430);
    float _508 = fma(_400, _168, _492);
    float _510 = fma(_400, _166, _500);
    float _512 = _504;
    float _514 = _508;
    float _516 = _510;
    float _518 = _510;
    float _520 = _508;
    if (_432)
    {
        float _522 = _476 * _168;
        _496 = _522;
    }
    float _524 = _496;
    float _526 = fma(_400, _190, _506);
    float _528 = _526;
    if (_432)
    {
        float _530 = _476 * _166;
        _502 = _530;
    }
    float _532 = _502;
    if (_432)
    {
        float _534 = _476 * _190;
        _512 = _534;
    }
    float _536 = _512;
    float _538 = fma(_376, _444, _456);
    float _540 = fma(_368, _444, _458);
    float _542 = fma(_388, _444, _460);
    if (!_490)
    {
        bool _544 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _546 = !_544;
        if (!_546)
        {
            float _548 = _148 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _550 = _152 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _552 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].x, _548);
            float _556 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[16].x, _550);
            float _558 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[16].x, _552);
            float _560 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[16].z, _554);
            float _562 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[16].z, _556);
            float _564 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[16].z, _558);
            float _566 = _560 * _560;
            float _568 = fma(_562, _562, _566);
            float _570 = fma(_564, _564, _568);
            float _572 = rsqrt(_570);
            float _574 = _572 * 9.9999999747524270787835121154785e-07;
            float _576 = _562 * _574;
            float _578 = _560 * _574;
            float _580 = _564 * _574;
            _518 = _578;
            _520 = _576;
            _528 = _580;
            _582 = true;
        }
        else
        {
            float _584 = _204 * _204;
            float _586 = fma(_202, _202, _584);
            float _588 = fma(_206, _206, _586);
            float _590 = sqrt(_588);
            bool _592 = _590 >= 9.9999999747524270787835121154785e-07;
            bool _594 = isnan(_590);
            bool _596 = _592 || _594;
            bool _598 = isnan(9.9999999747524270787835121154785e-07);
            bool _600 = _596 || _598;
            float _602 = _590;
            if (!_600)
            {
                float _604 = _458 * _458;
                float _606 = fma(_456, _456, _604);
                float _608 = fma(_460, _460, _606);
                float _610 = sqrt(_608);
                bool _612 = _610 >= 9.9999999747524270787835121154785e-07;
                bool _614 = isnan(_610);
                bool _616 = _612 || _614;
                bool _618 = isnan(9.9999999747524270787835121154785e-07);
                bool _620 = _616 || _618;
                float _622 = _200;
                if (!_620)
                {
                    float _624 = rsqrt(_200);
                    _622 = _624;
                }
                float _626 = _622;
                if (!_620)
                {
                    float _628 = _626 * 9.9999999747524270787835121154785e-07;
                    _602 = _628;
                }
                float _630 = _602;
                float _632 = _630;
                if (!_620)
                {
                    float _634 = _152 * _630;
                    _514 = _634;
                }
                float _636 = _514;
                _520 = _636;
                if (!_620)
                {
                    float _638 = _148 * _630;
                    _516 = _638;
                }
                float _640 = _516;
                _518 = _640;
                if (!_620)
                {
                    float _642 = _164 * _630;
                    _632 = _642;
                }
                float _644 = _632;
                bool _646 = !_620;
                _528 = _644;
                _582 = _646;
                if (!_582)
                {
                    float _648 = _148 * _458;
                    float _650 = _152 * _458;
                    float _652 = _164 * _458;
                    float _654 = fma(_456, _428, _648);
                    float _656 = fma(_456, _420, _650);
                    float _658 = fma(_456, _436, _652);
                    float _660 = fma(_166, _460, _654);
                    float _662 = fma(_168, _460, _656);
                    float _664 = fma(_190, _460, _658);
                    float _666 = _660 * _660;
                    float _668 = fma(_662, _662, _666);
                    float _670 = fma(_664, _664, _668);
                    float _672 = rsqrt(_670);
                    float _674 = _672 * 9.9999999747524270787835121154785e-07;
                    float _676 = _662 * _674;
                    float _678 = _660 * _674;
                    float _680 = _664 * _674;
                    _518 = _678;
                    _520 = _676;
                    _528 = _680;
                    _582 = true;
                }
            }
            else
            {
                float _682 = _148 * _204;
                float _684 = _152 * _204;
                float _686 = _164 * _204;
                float _688 = fma(_202, _428, _682);
                float _690 = fma(_202, _420, _684);
                float _692 = fma(_202, _436, _686);
                float _694 = fma(_166, _206, _688);
                float _696 = fma(_168, _206, _690);
                float _698 = fma(_190, _206, _692);
                float _700 = _694 * _694;
                float _702 = fma(_696, _696, _700);
                float _704 = fma(_698, _698, _702);
                float _706 = rsqrt(_704);
                float _708 = _706 * 9.9999999747524270787835121154785e-07;
                float _710 = _696 * _708;
                float _712 = _694 * _708;
                float _714 = _698 * _708;
                _518 = _712;
                _520 = _710;
                _528 = _714;
            }
        }
    }
    _582 = false;
    float _716 = _518;
    float _718 = _520;
    float _720 = _528;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _724 = !_722;
    float _742;
    if (!_724)
    {
        float _726 = in.m_53.x;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _730 = _726 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        _742 = _128;
    }
    _744 = false;
    float _746 = _742;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _750 = _746 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _754 = _746 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _758 = _746 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _776 = 1.0 / _766;
    bool _778 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _780 = isnan(_746);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = 1.0 / _774;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _792;
    bool _796 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _798 = 1.0 / _770;
    float _800 = 1.0 / _762;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _804 = _746 + _802;
    float _806 = _750 * _790;
    bool _808 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _810 = isnan(_746);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _804 * _776;
    bool _822 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _824 = isnan(_746);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = _754 * _798;
    bool _836 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _838 = isnan(_746);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -_832;
    float _850 = _848 + 1.0;
    float _852 = fma(_794, _834, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _854 = _746 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _856 = isnan(_746);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = _818 * _850;
    float _868 = _758 * _800;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _874;
    float _878 = -_818;
    float _880 = _878 + 1.0;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = fma(_872, _834, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _888 = fma(_876, _834, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _890 = -_846;
    float _892 = _890 + 1.0;
    float _894 = _846 * _880;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _904 = _788 * _892;
    float _906 = -_788;
    float _908 = _906 + 1.0;
    float _910 = fma(_898, _806, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _912 = fma(_902, _806, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _914 = _864 * _908;
    float _916 = fma(_884, _806, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _918 = _888 * _914;
    float _920 = _886 * _914;
    float _922 = -_864;
    float _924 = _922 + 1.0;
    float _926 = _852 * _914;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _936;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].x, _920);
    float _942 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].y, _918);
    float _944 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[143].z, _926);
    float _946 = fma(_930, _868, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _948 = fma(_934, _868, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _950 = fma(_938, _868, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _952 = fma(_910, _904, _940);
    float _954 = fma(_912, _904, _942);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _964 = fma(_916, _904, _944);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _970 = fma(_946, _894, _952);
    float _972 = fma(_958, _820, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _974 = fma(_962, _820, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _976 = fma(_968, _820, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _978 = fma(_948, _894, _954);
    float _980 = fma(_950, _894, _964);
    float _982 = fma(_972, _866, _970);
    float _984 = fma(_974, _866, _978);
    float _986 = fma(_976, _866, _980);
    float _988 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].x, _982);
    float _990 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].y, _984);
    float _992 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[147].z, _986);
    bool _994 = !_796;
    float _1012;
    if (!_994)
    {
        float _996 = in.m_53.x;
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1000 = _996 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _128;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = in.m_49.x;
    float _1020 = in.m_49.y;
    float _1022 = in.m_49.z;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1026 = _1016 + _1024;
    bool _1028 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1030;
    float _1034 = 1.0 / _1032;
    float _1036 = _992 * _1022;
    float _1038 = _990 * _1020;
    float _1040 = _1026 * _1034;
    bool _1042 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1044 = isnan(_1016);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -_1052;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1058;
    bool _1062 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1064 = isnan(_1016);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1078;
    float _1082 = fma(_1060, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1084 = _1072 * _1056;
    float _1086 = fma(_1076, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1088 = fma(_1080, _1040, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1090 = -_1072;
    float _1092 = _1090 + 1.0;
    float _1094 = _1082 * _1084;
    float _1096 = _1086 * _1084;
    float _1098 = _1088 * _1084;
    float _1100 = _988 * _1018;
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1094);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1096);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1098);
    float _1108 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1102);
    float _1110 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1104);
    float _1112 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1106);
    bool _1114 = !_1028;
    float _1132;
    if (!_1114)
    {
        float _1116 = in.m_53.x;
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1120 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _1124 = _1122 * _1118;
        float _1126 = floor(_1124);
        float _1128 = -_1126;
        float _1130 = _1124 + _1128;
        _1132 = _1130;
        _1134 = true;
    }
    else
    {
        _1132 = _128;
    }
    _1134 = false;
    float _1136 = _1132;
    float _1138 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1140 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1150 = 1.0 / _1144;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1160 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1162 = isnan(_1136);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1176 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1178 = isnan(_1136);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1190 = 1.0 / _1148;
    bool _1192 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1194 = isnan(_1136);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = -_1170;
    float _1206 = _1204 + 1.0;
    float _1208 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = -_1202;
    float _1216 = _1214 + 1.0;
    float _1218 = _1202 * _1206;
    float _1220 = _1154 * _1150;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1224 = _1136 + _1222;
    float _1226 = 1.0 / _1158;
    float _1228 = _1186 * _1216;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1234 = fma(_1220, _1224, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1236 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1238 = isnan(_1136);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1248;
    float _1252 = _1232 * _1190;
    float _1254 = _1234 * _1228;
    float _1256 = 1.0 / _1174;
    float _1258 = -_1246;
    float _1260 = _1258 + 1.0;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1264 = _1136 + _1262;
    bool _1266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1268 = _1170 * _1260;
    float _1270 = -_1186;
    float _1272 = _1270 + 1.0;
    bool _1274 = _1136 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1276 = isnan(_1136);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = _1250 * _1226;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1294 = _1136 + _1292;
    float _1296 = fma(_1252, _1264, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1298 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1254);
    float _1300 = -_1284;
    float _1302 = _1300 + 1.0;
    float _1304 = fma(_1286, _1294, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1308 = _1136 + _1306;
    float _1310 = _1290 * _1256;
    float _1312 = fma(_1296, _1218, _1298);
    float _1314 = _1246 * _1302;
    float _1316 = fma(_1310, _1308, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1318 = fma(_1304, _1268, _1312);
    float _1320 = fma(_1316, _1314, _1318);
    float _1322 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1320);
    float _1324 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1208;
    out.m_55.y = _1210;
    out.m_55.z = _1212;
    out.m_55.w = _1324;
    bool _1326 = !_1266;
    float _1344;
    if (!_1326)
    {
        float _1328 = in.m_53.x;
        float _1330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1332 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _1336 = _1334 * _1330;
        float _1338 = floor(_1336);
        float _1340 = -_1338;
        float _1342 = _1336 + _1340;
        _1344 = _1342;
        _1346 = true;
    }
    else
    {
        _1344 = _128;
    }
    _1346 = false;
    float _1348 = _1344;
    float _1350 = in.m_53.x;
    float _1352 = _540 * _148;
    float _1354 = _540 * _152;
    float _1356 = in.m_53.z;
    float _1358 = fma(_538, _428, _1352);
    float _1360 = _540 * _164;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1364 = _1362 != 0;
    float _1366 = in.m_53.y;
    float _1368 = fma(_538, _420, _1354);
    float _1370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1372 = log2(_1370);
    float _1374 = fma(_538, _436, _1360);
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1380 = in.m_53.w;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1394 = _1392 != 0;
    float _1396 = fma(_542, _168, _1368);
    float _1398 = _1350 * 2.0;
    float _1400 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1404 = fma(_542, _166, _1358);
    float _1406 = _1356 * 2.0;
    float _1408 = -_1376;
    float _1410 = fma(_1400, 2.0, _1408);
    float _1412 = floor(_1398);
    float _1414 = _1400;
    float _1416 = _1406;
    bool _1418 = _1394;
    if (!_1364)
    {
        _1414 = _1356;
    }
    float _1420 = _1414;
    float _1422 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1424 = _1366 * 2.0;
    float _1426 = _1420;
    float _1428 = _1422;
    if (_1364)
    {
        _1426 = _1366;
    }
    float _1430 = _1426;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1434 = fma(_1422, -2.0, _1378);
    if (!_1364)
    {
        _1428 = _1356;
    }
    float _1436 = _1428;
    float _1438 = floor(_1406);
    float _1440 = _1436;
    if (_1364)
    {
        _1440 = _1366;
    }
    float _1442 = _1440;
    float _1444 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1382);
    float _1446 = _1372 * _116;
    float _1448 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1434);
    float _1450 = _1366 + _1356;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1454 = fma(_542, _190, _1374);
    bool _1456 = _1412 >= 0.0;
    bool _1458 = isnan(_1412);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = floor(_1424);
    if (!_1364)
    {
        _1416 = _1366;
    }
    float _1468 = _1416;
    float _1470 = _1450 + (-1.0);
    float _1472 = _1468;
    if (_1364)
    {
        _1472 = _1350;
    }
    float _1474 = _1472;
    float _1476 = _1350 + _1366;
    bool _1478 = _1412 > 0.0;
    float _1480 = in.m_47.x;
    bool _1482 = _1438 > 0.0;
    float _1484 = exp2(_1446);
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1402);
    bool _1488 = _1438 >= 0.0;
    bool _1490 = isnan(_1438);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1500 = _1464 ? 0 : 1;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1504 = _1496 ? 0 : 1;
    float _1506 = -_1432;
    float _1508 = fma(_1498, 2.0, _1506);
    bool _1510 = _1466 > 0.0;
    float _1512 = fma(_1452, -2.0, _1502);
    float _1514 = _1476 + (-1.0);
    int _1516 = ~_1504;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    float _1522 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1524 = _1520;
    if (!_1482)
    {
        int _1526 = ~_1504;
        int _1528 = _1526 + 1;
        _1524 = _1528;
    }
    int _1530 = _1524;
    float _1532 = -_1484;
    float _1534 = _1532 + 1.0;
    bool _1536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1538 = isnan(1.0);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1544 = _1540 || _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1548 = 1.0 + _1546;
    int _1550 = ~_1500;
    int _1552 = _1550 + 1;
    int _1554 = _1552 + 1;
    float _1556 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1558 = _1554;
    if (!_1478)
    {
        int _1560 = ~_1500;
        int _1562 = _1560 + 1;
        _1558 = _1562;
    }
    int _1564 = _1558;
    float _1566 = 1.0 / _1548;
    float _1568 = _1396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1570 = _1454 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1572 = _1466 >= 0.0;
    bool _1574 = isnan(_1466);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan(0.0);
    bool _1580 = _1576 || _1578;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1584 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1586 = isnan(0.0);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1592 = _1588 || _1590;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1596 = _1580 ? 0 : 1;
    float _1598 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1582);
    float _1600 = _1592 ? _1534 : 0.0;
    float _1602 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    int _1604 = ~_1596;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    float _1610 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1598);
    int _1612 = _1608;
    if (!_1510)
    {
        int _1614 = ~_1596;
        int _1616 = _1614 + 1;
        _1612 = _1616;
    }
    int _1618 = _1612;
    float _1620 = -_116;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1410);
    float _1624 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1486);
    float _1626 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1602);
    float _1628 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1444);
    float _1630 = -_116;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1508);
    float _1634 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1512);
    if (_1544)
    {
        float _1636 = _1600 * _1566;
        _138 = _1636;
    }
    float _1638 = _138;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1644 = !_1386;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = _716 * _716;
    bool _1650 = _1380 > 0.5;
    float _1652 = 1.0 / _1642;
    float _1654 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1660;
    float _1664 = fma(_718, _718, _1648);
    float _1666 = 1.0 / _1658;
    float _1668 = fma(_128, 0.4000000059604644775390625, 0.300000011920928955078125);
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1672 = _1670 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1674 = _1662 * _1652;
    float _1676 = fma(_720, _720, _1664);
    int _1678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1680 = _1678 != 0;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1684 = _1682 != 0;
    float _1686 = rsqrt(_1676);
    float _1688 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1690 = _1350 + _1356;
    float _1692 = _1672 * _1666;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1696 = _1694 != 0;
    float _1698 = _1690 + (-1.0);
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1702 = _1700 != 0;
    float _1704 = in.m_57.x;
    float _1706 = in.m_57.y;
    float _1708 = in.m_57.z;
    int _1710 = abs(_1646);
    float _1712 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1716 = _1348 + _1714;
    float _1718 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1720 = float(_1618);
    float _1722 = _1686 * _716;
    float _1724 = fma(_1674, _1716, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1726 = _1686 * _718;
    float _1728 = float(_1710);
    float _1730 = _1722 * _454;
    float _1732 = float(_1530);
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1736 = _1348 + _1734;
    float _1738 = _1686 * _720;
    float _1740 = fma(_1726, _450, _1730);
    bool _1742 = !_1390;
    int _1744 = _1742 ? 0 : 1;
    float _1746 = _1728 * _1732;
    float _1748 = fma(_1692, _1736, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1750 = fma(_1738, _466, _1740);
    float _1752 = _1740;
    float _1754 = _1688;
    bool _1756 = _1696;
    float _1758 = _1480;
    if (!_1680)
    {
        _1752 = _1480;
    }
    float _1760 = _1752;
    float _1762 = _1746 * (-2.0);
    int _1764 = abs(_1744);
    float _1766 = _1350 + (-0.5);
    float _1768 = abs(_1750);
    bool _1770 = _1768 > 0.99989998340606689453125;
    float _1772 = fma(_1718, _1762, _1718);
    bool _1774 = !_1394;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = fma(_1762, _1704, _1704);
    float _1780 = _1350 + _1480;
    float _1782 = _1760;
    if (_1680)
    {
        bool _1784 = _1350 > 0.5;
        _1418 = _1784;
    }
    bool _1786 = _1418;
    float _1788 = _1366 + _1480;
    int _1790 = abs(_1776);
    float _1792 = _1780 * 6.283185482025146484375;
    float _1794 = _1788 * 18.84955596923828125;
    float _1796 = _1792 * 0.15915493667125701904296875;
    float _1798 = float(_1764);
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1778);
    float _1802 = float(_1564);
    float _1804 = -_396;
    float _1806 = _1804 + 1.0;
    float _1808 = float(_1790);
    float _1810 = _1794 * 0.15915493667125701904296875;
    float _1812 = _1796 * 6.283185482025146484375;
    float _1814 = sin(_1812);
    float _1816 = _1798 * _1802;
    if (_1770)
    {
        float _1818 = fma(_536, 0.001000000047497451305389404296875, _466);
        _472 = _1818;
    }
    float _1820 = _472;
    float _1822 = _1808 * _1720;
    float _1824 = fma(_1772, _1638, _1800);
    float _1826 = _1816 * (-2.0);
    int _1828 = _1650 ? as_type<int>(_1806) : as_type<int>(_396);
    if (_1770)
    {
        float _1830 = fma(_532, 0.001000000047497451305389404296875, _454);
        _462 = _1830;
    }
    float _1832 = _462;
    bool _1834 = _1366 > 0.5;
    float _1836 = _1366 + (-0.5);
    float _1838 = fma(_1826, _1706, _1706);
    float _1840 = _1810 * 6.283185482025146484375;
    float _1842 = sin(_1840);
    float _1844 = _1824 * 0.15915493667125701904296875;
    float _1846 = fma(_1688, _1826, _1688);
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1838);
    float _1850 = _1822 * (-2.0);
    if (!_1770)
    {
        _1754 = _450;
    }
    float _1852 = _1754;
    float _1854 = _1852;
    if (_1770)
    {
        float _1856 = fma(_524, 0.001000000047497451305389404296875, _450);
        _1854 = _1856;
    }
    float _1858 = _1854;
    float _1860 = _1696 ? as_type<float>(_1828) : _396;
    float _1862 = fma(_1846, _1638, _1848);
    if (_1702)
    {
        float _1864 = _1834 ? _1806 : _396;
        _478 = _1864;
    }
    float _1866 = _478;
    float _1868 = fma(_1850, _1708, _1708);
    if (_1684)
    {
        bool _1870 = _1356 > 0.5;
        _1756 = _1870;
    }
    bool _1872 = _1756;
    float _1874 = in.m_59.x;
    float _1876 = in.m_59.y;
    float _1878 = in.m_59.z;
    float _1880 = _1356 + (-0.5);
    float _1882 = fma(_1712, _1850, _1712);
    float _1884 = -_1820;
    float _1886 = _1722 * _1884;
    float _1888 = _1842 * 0.125;
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1868);
    float _1892 = -_1832;
    float _1894 = _1726 * _1892;
    float _1896 = -_1832;
    float _1898 = -_1886;
    float _1900 = fma(_1738, _1896, _1898);
    float _1902 = fma(_1814, 0.5, _1888);
    float _1904 = fma(_1882, _1638, _1890);
    float _1906 = -_1858;
    float _1908 = _1738 * _1906;
    float _1910 = _1862 * 0.15915493667125701904296875;
    float _1912 = _1902 + 0.625;
    float _1914 = _1904 * 0.15915493667125701904296875;
    float _1916 = -_1820;
    float _1918 = -_1908;
    float _1920 = fma(_1726, _1916, _1918);
    float _1922 = _1844 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = _1912 * _1668;
    float _1928 = -_1858;
    float _1930 = -_1894;
    float _1932 = fma(_1722, _1928, _1930);
    float _1934 = _1920 * _1920;
    float _1936 = _1844 * 6.283185482025146484375;
    float _1938 = cos(_1936);
    float _1940 = fma(_1874, _1926, _1874);
    float _1942 = fma(_1876, _1926, _1876);
    float _1944 = fma(_1878, _1926, _1878);
    float _1946 = fma(_1900, _1900, _1934);
    float _1948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1940);
    float _1950 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1942);
    float _1952 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1944);
    float _1954 = _1910 * 6.283185482025146484375;
    float _1956 = sin(_1954);
    float _1958 = fma(_1932, _1932, _1946);
    float _1960 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1962 = _1522 * _1948;
    float _1964 = _1556 * _1950;
    float _1966 = _1960 * _1952;
    float _1968 = _1910 * 6.283185482025146484375;
    float _1970 = cos(_1968);
    float _1972 = _1914 * 6.283185482025146484375;
    float _1974 = cos(_1972);
    float _1976 = _1924 * _1956;
    float _1978 = _1938 * _1956;
    float _1980 = _1914 * 6.283185482025146484375;
    float _1982 = sin(_1980);
    float _1984 = _1938 * _1970;
    float _1986 = _1924 * _1970;
    float _1988 = rsqrt(_1958);
    float _1990 = _1924 * _1974;
    float _1992 = _1970 * _1974;
    float _1994 = _1938 * _1974;
    float _1996 = _1956 * _1974;
    float _1998 = _1994 * _1726;
    float _2000 = fma(_1982, _1984, _1976);
    float _2002 = -_1978;
    float _2004 = fma(_1982, _1986, _2002);
    float _2006 = -_1986;
    float _2008 = fma(_1982, _1978, _2006);
    float _2010 = fma(_1982, _1976, _1984);
    float _2012 = _2000 * _1738;
    float _2014 = _2000 * _1726;
    float _2016 = _1994 * _1738;
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2020 = _1932 * _1988;
    float _2022 = _1900 * _1988;
    float _2024 = _1920 * _1988;
    float _2026 = _2008 * _1738;
    float _2028 = fma(_1992, _2020, _2012);
    float _2030 = fma(_1992, _2022, _2014);
    float _2032 = _1722 * _2020;
    float _2034 = _1726 * _2024;
    float _2036 = -_1982;
    float _2038 = fma(_2036, _2022, _1998);
    float _2040 = -_1982;
    float _2042 = fma(_2040, _2020, _2016);
    float _2044 = -_2032;
    float _2046 = fma(_1738, _2024, _2044);
    float _2048 = -_2034;
    float _2050 = fma(_1722, _2022, _2048);
    float _2052 = _2008 * _1726;
    float _2054 = fma(_1996, _2020, _2026);
    float _2056 = fma(_1990, _2046, _2038);
    float _2058 = fma(_1990, _2050, _2042);
    float _2060 = fma(_2004, _2050, _2028);
    float _2062 = fma(_1996, _2022, _2052);
    float _2064 = _1964 * _2056;
    float _2066 = _1964 * _2058;
    float _2068 = fma(_2004, _2046, _2030);
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2072 = fma(_2010, _2050, _2054);
    float _2074 = fma(_1962, _2060, _2066);
    float _2076 = fma(_2010, _2046, _2062);
    float _2078 = fma(_1962, _2068, _2064);
    bool _2080 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2082 = isnan(_1348);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = fma(_1966, _2072, _2074);
    bool _2094 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2096 = isnan(_1348);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = fma(_1966, _2076, _2078);
    bool _2108 = _1348 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2110 = isnan(_1348);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    float _2120 = -_2090;
    float _2122 = _2120 + 1.0;
    float _2124 = _1738 * _2022;
    float _2126 = _1568 + _2106;
    float _2128 = _1994 * _1722;
    float _2130 = _2118 * _2122;
    float _2132 = _1570 + _2092;
    float _2134 = -_2118;
    float _2136 = _2134 + 1.0;
    float _2138 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2142 = _2126 + _2140;
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2146 = _2132 + _2144;
    float _2148 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2150 = _2104 * _2136;
    float _2152 = _2142 * _2142;
    float _2154 = _2146 * _2146;
    float _2156 = fma(_1860, _2148, -0.5);
    float _2158 = _1724 * _2150;
    float _2160 = fma(_2138, _1866, -0.5);
    float _2162 = _2152 + _2154;
    float _2164 = -_1982;
    float _2166 = fma(_2164, _2024, _2128);
    float _2168 = _2000 * _1722;
    float _2170 = -_2124;
    float _2172 = fma(_1726, _2020, _2170);
    float _2174 = sqrt(_2162);
    int _2176 = as_type<int>(_1982);
    float _2178 = _2152;
    float _2180 = _2154;
    float _2182 = _2132;
    float _2184 = _2126;
    if (_1680)
    {
        float _2186 = -_1480;
        float _2188 = _2186 + 1.0;
        _2176 = as_type<int>(_2188);
    }
    int _2190 = _2176;
    float _2192 = _2008 * _1722;
    float _2194 = fma(_1992, _2024, _2168);
    float _2196 = fma(_1990, _2172, _2166);
    float _2198 = -_2104;
    float _2200 = _2198 + 1.0;
    float _2202 = fma(_1996, _2024, _2192);
    float _2204 = fma(_2004, _2172, _2194);
    float _2206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2208 = _1964 * _2196;
    int _2210 = _2190;
    if (_1680)
    {
        float _2212 = _1786 ? as_type<float>(_2190) : _1480;
        _1782 = _2212;
    }
    float _2214 = _1782;
    float _2216 = fma(_2010, _2172, _2202);
    if (_1684)
    {
        float _2218 = -_1480;
        float _2220 = _2218 + 1.0;
        _2210 = as_type<int>(_2220);
    }
    int _2222 = _2210;
    float _2224 = fma(_1962, _2204, _2208);
    float _2226 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2158);
    float _2228 = -_1448;
    float _2230 = fma(_1626, _2160, _2228);
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2234 = _2174 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2236 = fma(_1966, _2216, _2224);
    float _2238 = _2236;
    if (_1684)
    {
        float _2240 = _1872 ? as_type<float>(_2222) : _1480;
        _1758 = _2240;
    }
    float _2242 = _1758;
    float _2244 = fma(_1748, _2130, _2226);
    float _2246 = -_1634;
    float _2248 = fma(_1628, _2156, _2246);
    float _2250 = _1654 + _2236;
    float _2252 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2254 = fma(_2252, _2214, -0.5);
    if (!_2234)
    {
        _2238 = _2250;
    }
    float _2256 = _2238;
    float _2258 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2260 = fma(_2258, _2242, -0.5);
    bool _2262 = !_2234;
    float _2264 = _2256;
    if (!_2262)
    {
        float _2266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2270 = _2174 + _2268;
        float _2272 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = rsqrt(_2162);
        float _2276 = _2270 * _2266;
        float _2278 = _2276 * 0.15915493667125701904296875;
        float _2280 = _2278 * 6.283185482025146484375;
        float _2282 = sin(_2280);
        float _2284 = _2278 * 6.283185482025146484375;
        float _2286 = cos(_2284);
        float _2288 = fma(_2282, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2290 = _2274 * _2288;
        float _2292 = _2286 + (-1.0);
        float _2294 = fma(_2142, _2290, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2296 = fma(_2146, _2290, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2298 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2302 = _2294 + _2300;
        float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2306 = _2296 + _2304;
        float _2308 = fma(_2250, _2286, _2298);
        float _2310 = _2302 * _2302;
        float _2312 = _2306 * _2306;
        _2264 = _2308;
        _2178 = _2310;
        _2180 = _2312;
        _2182 = _2296;
        _2184 = _2294;
    }
    float _2314 = _2264;
    float _2316 = _2178;
    float _2318 = _2180;
    float _2320 = _2182;
    float _2322 = _2184;
    float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2326 = _2314 + _2324;
    float _2328 = in.m_61.w;
    float _2330 = fma(_1610, _2254, _1622);
    float _2332 = fma(_1624, _2260, _1632);
    float _2334 = fma(_2326, _2326, _2316);
    float _2336 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2244);
    float _2338 = _2334 + _2318;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2342 = _2230 + 0.5;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2346 = _2248 + 0.5;
    float _2348 = sqrt(_2338);
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2352 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2360 = _2330 + 0.5;
    float _2362 = _2332 + 0.5;
    out.m_63.x = _2352;
    out.m_63.y = _2354;
    out.m_63.z = _2358;
    out.m_63.w = _2356;
    out.m_65.w = _2328;
    bool _2364 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2366 = isnan(_2348);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2372 = _2368 || _2370;
    out.m_67.x = _2360;
    out.m_67.y = _2342;
    out.m_67.z = _2362;
    out.m_67.w = _2346;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (!_2372)
    {
        _2374 = 1.0;
    }
    float _2376 = _2374;
    bool _2378 = !_2372;
    float _2380 = _2376;
    if (!_2378)
    {
        bool _2382 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2384 = isnan(_2348);
        bool _2386 = _2382 || _2384;
        bool _2388 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2390 = _2386 || _2388;
        if (!_2390)
        {
            float _2392 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2394 = _2348 + _2392;
            float _2396 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2398 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2396;
            float _2400 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2404 = 1.0 / _2398;
            float _2406 = _2394 * _2404;
            float _2408 = fma(_2406, _2402, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2380 = _2408;
            _2410 = true;
        }
        else
        {
            bool _2412 = _2348 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2414 = isnan(_2348);
            bool _2416 = _2412 || _2414;
            bool _2418 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2420 = _2416 || _2418;
            if (!_2420)
            {
                float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2424 = _2348 + _2422;
                float _2426 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2428 = _2426 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2430 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2432 = _2430 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2434 = 1.0 / _2428;
                float _2436 = _2424 * _2434;
                float _2438 = fma(_2436, _2432, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2380 = _2438;
                _2410 = true;
            }
            else
            {
                _2380 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2410 = false;
    float _2440 = _2380;
    float _2442 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2444 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2446 = _2314 + _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2450 = _2320 + _2448;
    float _2452 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2442);
    float _2454 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2456 = fma(_2446, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2458 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan(0.5);
    bool _2466 = _2462 || _2464;
    float _2468 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2452);
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2472 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2454);
    float _2474 = 1.0 / _2470;
    float _2476 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2472);
    bool _2478 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan(0.5);
    bool _2486 = _2482 || _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2490 = _2322 + _2488;
    float _2492 = _2476 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2494 = _2492 + _2470;
    float _2496 = fma(_2490, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2498 = fma(_2450, _2440, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2500 = _2494 * _2474;
    float _2502 = _2500 * 0.5;
    float _2504 = _2494;
    float _2506 = _2490;
    float _2508 = _2496;
    if (_2486)
    {
        _2504 = _2456;
    }
    float _2510 = _2504;
    float _2512 = _2510;
    if (_2486)
    {
        _2506 = _2498;
    }
    float _2514 = _2506;
    float _2516 = _2514;
    if (!_2486)
    {
        float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2520 = _1654 + _2518;
        float _2522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2524 = _1568 + _2522;
        float _2526 = -_1568;
        float _2528 = _2526 + _2496;
        float _2530 = -_1570;
        float _2532 = _2530 + _2498;
        float _2534 = _2520 * _2520;
        float _2536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2538 = _1570 + _2536;
        float _2540 = fma(_2524, _2524, _2534);
        float _2542 = fma(_2538, _2538, _2540);
        float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2546 = sqrt(_2542);
        float _2548 = precise::min(_2546, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2550 = _2548 * _2544;
        float _2552 = -_1654;
        float _2554 = _2552 + _2456;
        float _2556 = fma(_2528, _2550, _1568);
        float _2558 = fma(_2554, _2550, _1654);
        float _2560 = fma(_2532, _2550, _1570);
        _2512 = _2558;
        _2508 = _2556;
        _2516 = _2560;
    }
    float _2562 = _2512;
    float _2564 = _2508;
    float _2566 = _2516;
    float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2570 = fma(_2502, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2568);
    float _2572 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2576 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2578 = _2562 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2580 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2582 = 1.0 / _2570;
    float _2584 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2574);
    float _2586 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2576);
    float _2588 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2580);
    float _2590 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2578);
    float _2592 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2584);
    float _2594 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2586);
    float _2596 = _2588 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2598 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2590);
    float _2600 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2602 = _2590;
    if (_2466)
    {
        _2602 = 1.0;
    }
    float _2604 = _2602;
    float _2606 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2608 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2610 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2612 = _2596 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2614 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2606);
    float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2608);
    float _2618 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2610);
    float _2620 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2612);
    float _2622 = _2606;
    float _2624 = _2604;
    if (_2466)
    {
        _2622 = 1.0;
    }
    float _2626 = _2622;
    float _2628 = _2594 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2632 = _2582 * _2630;
    float _2634 = _2626;
    if (!_2466)
    {
        float _2636 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2638 = _2636 * 0.15915493667125701904296875;
        float _2640 = _2638 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        float _2644 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2646 = _2644 * 0.15915493667125701904296875;
        float _2648 = _2638 * 6.283185482025146484375;
        float _2650 = sin(_2648);
        float _2652 = 1.0 / _2642;
        float _2654 = _2646 * 6.283185482025146484375;
        float _2656 = cos(_2654);
        float _2658 = _2650 * _2652;
        float _2660 = _2646 * 6.283185482025146484375;
        float _2662 = sin(_2660);
        float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2666 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2664;
        float _2668 = _2656 * _2658;
        float _2670 = 1.0 / _2666;
        float _2672 = 1.0 / _2668;
        float _2674 = _2662 * _2672;
        float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2678 = fma(_2632, _2674, _2676);
        float _2680 = _2678 * _2670;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        _2624 = _2682;
    }
    float _2684 = _2624;
    if (!_2466)
    {
        float _2686 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = _2688 * 6.283185482025146484375;
        float _2692 = cos(_2690);
        float _2694 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2696 = _2694 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2692;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2632, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2634 = _2736;
    }
    float _2738 = _2634;
    float _2740 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2614);
    float _2742 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2616);
    float _2744 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2618);
    float _2746 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2748 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2620);
    bool _2750 = _2684 > 0.0;
    bool _2752 = isnan(_2684);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(0.0);
    bool _2758 = _2754 || _2756;
    float _2760 = _2684 * _2738;
    float _2762 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2740);
    float _2764 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2748);
    float _2766 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2744);
    bool _2768 = _2738 <= 0.0;
    bool _2770 = !_2758;
    bool _2772 = _2768 || _2770;
    float _2774 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2742);
    float _2776 = _2762 + _2764;
    float _2778 = _2766 + _2764;
    float _2780 = _2764 * 0.5;
    float _2782 = _2760 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2784 = _2776 * 0.5;
    float _2786 = _2778 * 0.5;
    float _2788 = fma(_2774, -0.5, _2780);
    float _2790 = _2782 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2762;
    out.gl_Position.y = _2774;
    out.gl_Position.z = _2766;
    out.gl_Position.w = _2764;
    out.m_69.x = _2784;
    out.m_69.y = _2788;
    out.m_69.z = _2786;
    out.m_69.w = _2764;
    out.m_35.x = _2790;
    if (!_2772)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2792 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2792;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

