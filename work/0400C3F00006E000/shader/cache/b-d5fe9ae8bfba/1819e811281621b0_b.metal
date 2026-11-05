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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_67 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_47 [[attribute(1)]];
    float4 m_45 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_34 [[attribute(6)]];
    float4 m_53 [[attribute(8)]];
    float4 m_41 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
    float4 m_57 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1936 = false;
    bool _894 = false;
    bool _666 = false;
    bool _506 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_32.w;
    float _85 = in.m_34.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _85;
    float _104 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _100;
    if (!_98)
    {
        out.m_39.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2272 = as_type<float>(_112);
        out.gl_Position.z = _2272;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _116 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_85);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = in.m_41.z;
    float _128 = float(_90);
    float _130 = in.m_41.w;
    bool _132 = _94 >= _128;
    bool _134 = !_124;
    bool _136 = _132 || _134;
    float _138 = 1.0 / _128;
    float _140 = 0.0;
    if (_136)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_136)
    {
        out.m_39.x = 0.0;
    }
    float _144 = _94 * _138;
    if (_136)
    {
        float _146 = _142 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    out.m_43.z = _126;
    float _150 = as_type<float>(_148);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2340 = as_type<float>(_148);
        out.gl_Position.z = _2340;
    }
    out.m_43.w = _130;
    out.m_37.x = _144;
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_34.x;
    float _154 = in.m_34.y;
    float _156 = in.m_34.z;
    float _158 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _158;
    if (!_168)
    {
        float _172 = _158 * _158;
        float _174 = _172 * 0.5;
        _150 = _174;
    }
    float _176 = _150;
    float _178 = 0.0;
    float _180 = _176;
    if (!_168)
    {
        float _182 = _94 * _94;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_168)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_168;
    float _194 = _190;
    float _196 = 0.0;
    if (!_192)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _158 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _158);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _140 = _214;
        _194 = _226;
        _196 = _216;
    }
    float _228 = _140;
    float _230 = _194;
    float _232 = _196;
    bool _234 = !_168;
    float _236 = _228;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _236 = _252;
        _238 = _246;
        _170 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _170;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _94;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _276;
    }
    float _278 = _268;
    bool _280 = !_168;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _94 * _286;
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _288 * 0.693147182464599609375;
        float _300 = exp2(_290);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _94);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_168;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _94 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = fma(_264, _152, _272);
    float _342 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _346 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_264, _154, _342);
    float _352 = fma(_338, _154, _344);
    float _354 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = fma(_264, _156, _348);
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_338, _156, _354);
    float _366 = -_356;
    float _368 = _340 + _366;
    float _370 = in.m_45.y;
    float _372 = _362 * _362;
    float _374 = -_364;
    float _376 = _358 + _374;
    float _378 = in.m_47.y;
    float _380 = fma(_368, _368, _372);
    float _382 = in.m_49.y;
    float _384 = fma(_376, _376, _380);
    float _386 = in.m_47.x;
    float _388 = sqrt(_384);
    float _390 = in.m_45.x;
    float _392 = in.m_49.x;
    float _394 = in.m_47.z;
    float _396 = _362 * _370;
    float _398 = in.m_45.z;
    float _400 = _362 * _378;
    bool _402 = _388 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_388);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = in.m_49.z;
    float _414 = _362 * _382;
    float _416 = _370 * _370;
    float _418 = in.m_51.w;
    float _420 = fma(_368, _386, _400);
    float _422 = fma(_378, _378, _416);
    float _424 = in.m_32.x;
    float _426 = in.m_32.y;
    float _428 = in.m_32.z;
    float _430 = fma(_368, _390, _396);
    float _432 = fma(_382, _382, _422);
    float _434 = fma(_368, _392, _414);
    float _436 = fma(_376, _394, _420);
    float _438 = fma(_376, _398, _430);
    float _440 = fma(_376, _412, _434);
    float _442 = _434;
    float _444 = _438;
    float _446 = _418;
    float _448 = _436;
    if (_410)
    {
        _442 = _438;
    }
    float _450 = _442;
    float _452 = _450;
    float _454 = _450;
    if (_410)
    {
        _444 = _440;
    }
    float _456 = _444;
    float _458 = fma(_340, _418, _424);
    float _460 = fma(_350, _418, _426);
    float _462 = fma(_358, _418, _428);
    float _464 = _456;
    float _466 = _456;
    if (!_410)
    {
        bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _470 = !_468;
        if (!_470)
        {
            float _472 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _474 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[16].x, _472);
            float _480 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].z, _478);
            float _486 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = _484 * _484;
            float _492 = fma(_486, _486, _490);
            float _494 = fma(_488, _488, _492);
            float _496 = rsqrt(_494);
            float _498 = _496 * 9.9999999747524270787835121154785e-07;
            float _500 = _486 * _498;
            float _502 = _484 * _498;
            float _504 = _488 * _498;
            _454 = _502;
            _448 = _500;
            _466 = _504;
            _506 = true;
        }
        else
        {
            float _508 = _154 * _154;
            float _510 = fma(_152, _152, _508);
            float _512 = fma(_156, _156, _510);
            float _514 = sqrt(_512);
            bool _516 = _514 >= 9.9999999747524270787835121154785e-07;
            bool _518 = isnan(_514);
            bool _520 = _516 || _518;
            bool _522 = isnan(9.9999999747524270787835121154785e-07);
            bool _524 = _520 || _522;
            float _526 = _514;
            if (!_524)
            {
                float _528 = _426 * _426;
                float _530 = fma(_424, _424, _528);
                float _532 = fma(_428, _428, _530);
                float _534 = sqrt(_532);
                bool _536 = _534 >= 9.9999999747524270787835121154785e-07;
                bool _538 = isnan(_534);
                bool _540 = _536 || _538;
                bool _542 = isnan(9.9999999747524270787835121154785e-07);
                bool _544 = _540 || _542;
                float _546 = _432;
                if (!_544)
                {
                    float _548 = rsqrt(_432);
                    _546 = _548;
                }
                float _550 = _546;
                if (!_544)
                {
                    float _552 = _550 * 9.9999999747524270787835121154785e-07;
                    _446 = _552;
                }
                float _554 = _446;
                if (!_544)
                {
                    float _556 = _378 * _554;
                    _526 = _556;
                }
                float _558 = _526;
                _448 = _558;
                if (!_544)
                {
                    float _560 = _370 * _554;
                    _452 = _560;
                }
                float _562 = _452;
                _454 = _562;
                if (!_544)
                {
                    float _564 = _382 * _554;
                    _464 = _564;
                }
                float _566 = _464;
                bool _568 = !_544;
                _466 = _566;
                _506 = _568;
                if (!_506)
                {
                    float _570 = _370 * _426;
                    float _572 = _378 * _426;
                    float _574 = _382 * _426;
                    float _576 = fma(_424, _390, _570);
                    float _578 = fma(_424, _386, _572);
                    float _580 = fma(_424, _392, _574);
                    float _582 = fma(_428, _398, _576);
                    float _584 = fma(_428, _394, _578);
                    float _586 = fma(_428, _412, _580);
                    float _588 = _582 * _582;
                    float _590 = fma(_584, _584, _588);
                    float _592 = fma(_586, _586, _590);
                    float _594 = rsqrt(_592);
                    float _596 = _594 * 9.9999999747524270787835121154785e-07;
                    float _598 = _584 * _596;
                    float _600 = _582 * _596;
                    float _602 = _586 * _596;
                    _454 = _600;
                    _448 = _598;
                    _466 = _602;
                    _506 = true;
                }
            }
            else
            {
                float _604 = _370 * _154;
                float _606 = _378 * _154;
                float _608 = _382 * _154;
                float _610 = fma(_152, _390, _604);
                float _612 = fma(_152, _386, _606);
                float _614 = fma(_152, _392, _608);
                float _616 = fma(_156, _398, _610);
                float _618 = fma(_156, _394, _612);
                float _620 = fma(_156, _412, _614);
                float _622 = _616 * _616;
                float _624 = fma(_618, _618, _622);
                float _626 = fma(_620, _620, _624);
                float _628 = rsqrt(_626);
                float _630 = _628 * 9.9999999747524270787835121154785e-07;
                float _632 = _618 * _630;
                float _634 = _616 * _630;
                float _636 = _620 * _630;
                _454 = _634;
                _448 = _632;
                _466 = _636;
            }
        }
    }
    _506 = false;
    float _638 = _454;
    float _640 = _448;
    float _642 = _466;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _646 = !_644;
    float _664;
    if (!_646)
    {
        float _648 = in.m_41.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[12].x, _94);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        _664 = _144;
    }
    _666 = false;
    float _668 = _664;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _672 = _668 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _676 = _668 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _692 = _668 + _690;
    float _694 = 1.0 / _680;
    bool _696 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _698 = isnan(_668);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _710 = isnan(_668);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = 1.0 / _684;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _724 = 1.0 / _688;
    float _726 = _676 * _694;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _728;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _732;
    float _736 = fma(_734, _726, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _738 = _672 * _720;
    bool _740 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _742 = isnan(_668);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _752;
    float _756 = fma(_730, _726, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _766 = -_750;
    float _768 = _766 + 1.0;
    float _770 = _692 * _724;
    float _772 = fma(_754, _726, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _774 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _776 = isnan(_668);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = _706 * _768;
    float _788 = -_706;
    float _790 = _788 + 1.0;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _796 = fma(_764, _738, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _798 = -_784;
    float _800 = _798 + 1.0;
    float _802 = _784 * _790;
    float _804 = fma(_794, _738, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _806 = fma(_760, _738, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _808 = _718 * _800;
    float _810 = in.m_51.x;
    float _812 = in.m_51.y;
    float _814 = in.m_51.z;
    float _816 = _756 * _808;
    float _818 = _736 * _808;
    float _820 = _772 * _808;
    float _822 = -_718;
    float _824 = _822 + 1.0;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _834;
    float _838 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _816);
    float _840 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _818);
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _820);
    float _844 = fma(_828, _770, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _846 = fma(_832, _770, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _848 = fma(_836, _770, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _850 = fma(_804, _802, _838);
    float _852 = fma(_806, _802, _840);
    float _854 = fma(_796, _802, _842);
    float _856 = fma(_844, _786, _850);
    float _858 = fma(_846, _786, _852);
    float _860 = fma(_848, _786, _854);
    float _862 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].x, _856);
    float _864 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].y, _858);
    float _866 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].z, _860);
    float _868 = _862 * _810;
    float _870 = _864 * _812;
    float _872 = _866 * _814;
    bool _874 = !_722;
    float _892;
    if (!_874)
    {
        float _876 = in.m_41.x;
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _880 = _876 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[11].y, _94);
        float _884 = _882 * _878;
        float _886 = floor(_884);
        float _888 = -_886;
        float _890 = _884 + _888;
        _892 = _890;
        _894 = true;
    }
    else
    {
        _892 = _144;
    }
    _894 = false;
    float _896 = _892;
    float _898 = in.m_45.w;
    float _900 = _460 * _378;
    float _902 = _460 * _370;
    float _904 = _460 * _382;
    float _906 = in.m_47.w;
    float _908 = fma(_458, _390, _902);
    float _910 = in.m_49.w;
    float _912 = fma(_458, _392, _904);
    float _914 = fma(_458, _386, _900);
    float _916 = fma(_462, _398, _908);
    float _918 = in.m_53.x;
    float _920 = in.m_53.y;
    float _922 = in.m_53.z;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    float _928 = fma(_462, _394, _914);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _932 = _930 != 0;
    float _934 = fma(_462, _412, _912);
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _938 = _936 != 0;
    float _940 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _948 = _946 != 0;
    float _950 = in.m_41.x;
    float _952 = in.m_41.y;
    float _954 = _916 + _898;
    float _956 = fma(_130, 0.39999997615814208984375, 0.60000002384185791015625);
    float _958 = _928 + _906;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _962 = _954 + _960;
    float _964 = _934 + _910;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _968 = _958 + _966;
    bool _970 = _130 > 0.5;
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    float _974 = _962 * _962;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _918);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = _964 + _978;
    float _982 = -_130;
    float _984 = fma(_982, 0.25, 1.0);
    float _986 = fma(_968, _968, _974);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _922);
    float _990 = fma(_980, _980, _986);
    float _992 = _638 * _638;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _996 = rsqrt(_990);
    float _998 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1000 = _950 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1002 = fma(_640, _640, _992);
    float _1004 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _998);
    float _1006 = -_994;
    float _1008 = fma(_1000, 2.0, _1006);
    float _1010 = fma(_642, _642, _1002);
    float _1012 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = rsqrt(_1010);
    float _1018 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1012);
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1022 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1004);
    float _1024 = _1020 * _996;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1018);
    float _1028 = _962 * _1024;
    float _1030 = _968 * _1024;
    float _1032 = _980 * _1024;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1038 = -_1028;
    float _1040 = _962 + _1038;
    float _1042 = -_1030;
    float _1044 = _968 + _1042;
    float _1046 = _1016 * _642;
    float _1048 = _1040 * _1040;
    float _1050 = _1016 * _640;
    float _1052 = fma(_952, 2.0, -1.0);
    float _1054 = fma(2.0, _950, -1.0);
    float _1056 = fma(_1044, _1044, _1048);
    float _1058 = _1016 * _638;
    float _1060 = _1052 * _1052;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1064 = _1046 * _1062;
    float _1066 = fma(_126, 2.0, -1.0);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = _1058 * _1068;
    float _1072 = fma(_1054, _1054, _1060);
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1076 = -_1064;
    float _1078 = fma(_1050, _1074, _1076);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1082 = _1050 * _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1086 = -_1070;
    float _1088 = fma(_1046, _1084, _1086);
    float _1090 = fma(_1066, _1066, _1072);
    float _1092 = _1078 * _1078;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1096 = -_1082;
    float _1098 = fma(_1058, _1094, _1096);
    float _1100 = -_1032;
    float _1102 = _980 + _1100;
    float _1104 = fma(_1088, _1088, _1092);
    float _1106 = rsqrt(_1090);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1110 = fma(_1098, _1098, _1104);
    float _1112 = fma(_1102, _1102, _1056);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1118 = in.m_55.x;
    float _1120 = in.m_55.y;
    float _1122 = 1.0 / _1036;
    float _1124 = _952 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1126 = _950 > 0.5;
    float _1128 = fma(_1124, -2.0, _1108);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1130;
    float _1134 = sqrt(_1026);
    float _1136 = rsqrt(_1110);
    float _1138 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1140 = fma(_144, -0.5, 1.0);
    float _1142 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1144 = _1106 * _1140;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1150 = sqrt(_1112);
    float _1152 = _1132 * _1122;
    float _1154 = _1052 * _1144;
    float _1156 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1142);
    float _1158 = fma(_1154, _1134, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1160 = 1.0 / _1116;
    float _1162 = _1078 * _1136;
    float _1164 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1166 = _1098 * _1136;
    float _1168 = in.m_57.x;
    float _1170 = _1088 * _1136;
    float _1172 = _1164 * _1120;
    float _1174 = sqrt(_1022);
    float _1176 = _996 * _1150;
    float _1178 = _1014 * _1176;
    float _1180 = _1164 * _1176;
    float _1182 = _940 * _1176;
    float _1184 = _1148 * _1160;
    float _1186 = _1066 * _1144;
    float _1188 = _952 * 78.233001708984375;
    float _1190 = _1178 * _976;
    float _1192 = _144 * _956;
    float _1194 = _1058 * _1166;
    float _1196 = _1054 * _1144;
    float _1198 = fma(_950, 12.98980045318603515625, _1188);
    float _1200 = _1180 * _972;
    float _1202 = _1182 * _988;
    float _1204 = -_1194;
    float _1206 = fma(_1046, _1162, _1204);
    float _1208 = fma(_1196, _1174, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1210 = _1198 * 0.15915493667125701904296875;
    float _1212 = _1050 * _1162;
    float _1214 = _1200 * _1050;
    float _1216 = _1046 * _1170;
    float _1218 = _1200 * _1058;
    float _1220 = _1200 * _1046;
    float _1222 = -_1212;
    float _1224 = fma(_1058, _1170, _1222);
    float _1226 = fma(_1190, _1170, _1214);
    float _1228 = -_1216;
    float _1230 = fma(_1050, _1166, _1228);
    float _1232 = fma(_1190, _1162, _1218);
    float _1234 = fma(_1190, _1166, _1220);
    float _1236 = fma(_1202, _1206, _1226);
    float _1238 = sqrt(_1156);
    float _1240 = fma(_1202, _1230, _1232);
    float _1242 = fma(_1202, _1224, _1234);
    float _1244 = fma(_1192, -0.5, 0.5);
    float _1246 = _958 + _1236;
    float _1248 = _954 + _1240;
    float _1250 = _964 + _1242;
    float _1252 = -_1244;
    float _1254 = fma(_1252, _1168, 1.0);
    float _1256 = -_1246;
    float _1258 = _1256 + _1208;
    float _1260 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1262 = _1248 + _1260;
    float _1264 = _1210 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = -_1248;
    float _1270 = _1268 + _1158;
    float _1272 = fma(_1254, _1258, _1246);
    float _1274 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1276 = _1246 + _1274;
    float _1278 = _1262 * _1262;
    float _1280 = fma(_1254, _1270, _1248);
    float _1282 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1284 = _1250 + _1282;
    float _1286 = fma(_1186, _1238, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1288 = fma(_1276, _1276, _1278);
    float _1290 = -_1280;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1294 = -_1272;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1298 = -_1250;
    float _1300 = _1298 + _1286;
    float _1302 = fma(_1284, _1284, _1288);
    float _1304 = _1292 * _1292;
    float _1306 = fma(_1254, _1300, _1250);
    float _1308 = _1266 * 43758.546875;
    float _1310 = fma(_1296, _1296, _1304);
    float _1312 = rsqrt(_1302);
    float _1314 = -_1306;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1318 = _1168 * 4.0;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1322 = _1300;
    float _1324 = _1118;
    float _1326 = _1172;
    if (!_948)
    {
        _1322 = _952;
    }
    float _1328 = _1322;
    float _1330 = fma(_1316, _1316, _1310);
    float _1332 = fma(_144, 2.0, -1.0);
    float _1334 = fma(_94, 0.1500000059604644775390625, _1318);
    float _1336 = floor(_1308);
    float _1338 = _144 * 32.0;
    float _1340 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1320);
    float _1342 = _1328;
    float _1344 = _1338;
    if (_948)
    {
        _1342 = _950;
    }
    float _1346 = _1342;
    float _1348 = fma(_950, 6.283185482025146484375, _1334);
    float _1350 = -_1118;
    float _1352 = _1350 + 1.0;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1356 = sqrt(_1330);
    float _1358 = _1262 * _1312;
    float _1360 = _1276 * _1312;
    float _1362 = _1284 * _1312;
    float _1364 = fma(_94, 0.20000000298023223876953125, _1318);
    float _1366 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1354);
    float _1368 = abs(_1332);
    float _1370 = -_1368;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1340);
    float _1376 = -_1336;
    float _1378 = _1308 + _1376;
    float _1380 = _1358 * _1358;
    float _1382 = fma(_952, 6.283185482025146484375, _1364);
    float _1384 = fma(_126, 6.283185482025146484375, _1364);
    float _1386 = _1378 * 6.283185482025146484375;
    float _1388 = fma(_1360, _1360, _1380);
    int _1390 = _1126 ? as_type<int>(_1352) : as_type<int>(_1118);
    float _1392 = _1384 * 0.15915493667125701904296875;
    float _1394 = fma(_1338, _1168, _1386);
    float _1396 = fma(_1362, _1362, _1388);
    float _1398 = precise::max(_1356, 1.5);
    float _1400 = _1382 * 0.15915493667125701904296875;
    float _1402 = _1394 * 0.15915493667125701904296875;
    float _1404 = rsqrt(_1396);
    float _1406 = _1388;
    if (!_948)
    {
        _1344 = _126;
    }
    float _1408 = _1344;
    float _1410 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1366);
    float _1412 = _1408;
    if (!_948)
    {
        _1406 = _126;
    }
    float _1414 = _1406;
    float _1416 = precise::min(_1398, 2.5);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1420 = _896 + _1418;
    bool _1422 = _952 > 0.5;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1426 = _896 + _1424;
    float _1428 = _1414;
    if (_948)
    {
        _1412 = _952;
    }
    float _1430 = _1412;
    float _1432 = _1416 + (-1.5);
    if (_948)
    {
        _1428 = _952;
    }
    float _1434 = _1428;
    float _1436 = fma(_1152, _1426, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = fma(_1240, _1432, _954);
    float _1444 = fma(_1184, _1420, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1446 = fma(_1236, _1432, _958);
    float _1448 = fma(_1242, _1432, _964);
    float _1450 = -_1442;
    float _1452 = _1158 + _1450;
    float _1454 = _1360 * _1404;
    float _1456 = -_1446;
    float _1458 = _1208 + _1456;
    float _1460 = _1402 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1358 * _1404;
    bool _1466 = _126 > 0.5;
    float _1468 = fma(_1254, _1452, _1442);
    float _1470 = -_958;
    float _1472 = _1470 + _1208;
    float _1474 = _1362 * _1404;
    float _1476 = -_954;
    float _1478 = _1476 + _1158;
    float _1480 = fma(_1254, _1458, _1446);
    float _1482 = -_1440;
    float _1484 = _1482 + 1.0;
    float _1486 = -_964;
    float _1488 = _1486 + _1286;
    float _1490 = fma(_1254, _1472, _958);
    float _1492 = -_1448;
    float _1494 = _1286 + _1492;
    float _1496 = _1454 * _1484;
    float _1498 = fma(_1254, _1478, _954);
    float _1500 = fma(_1254, _1488, _964);
    float _1502 = fma(_1254, _1494, _1448);
    float _1504 = _1474 * _1462;
    float _1506 = -_1498;
    float _1508 = _1468 + _1506;
    float _1510 = fma(_1454, _1496, _1440);
    float _1512 = -_1490;
    float _1514 = _1480 + _1512;
    float _1516 = -_1504;
    float _1518 = fma(_1464, _1496, _1516);
    float _1520 = _1454 * _1462;
    float _1522 = _1464 * _1484;
    float _1524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1526 = _1518 * _1508;
    float _1528 = _1474 * _1474;
    float _1530 = fma(_1474, _1522, _1520);
    float _1532 = -_1500;
    float _1534 = _1502 + _1532;
    float _1536 = fma(_1510, _1514, _1526);
    float _1538 = _1464 * _1462;
    float _1540 = _1530 * _1508;
    float _1542 = _1392 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = fma(_1484, _1528, _1440);
    float _1548 = -_1538;
    float _1550 = fma(_1474, _1496, _1548);
    float _1552 = fma(_1474, _1496, _1538);
    float _1554 = _926 ? as_type<float>(_1390) : _1118;
    float _1556 = -_1520;
    float _1558 = fma(_1474, _1522, _1556);
    float _1560 = fma(_1550, _1514, _1540);
    float _1562 = fma(_1552, _1534, _1536);
    float _1564 = _1400 * 6.283185482025146484375;
    float _1566 = sin(_1564);
    float _1568 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1570 = _1372 * _1168;
    float _1572 = fma(_1546, _1534, _1560);
    float _1574 = _1490 + _1562;
    float _1576 = fma(_1554, _1568, -0.5);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1580 = _1500 + _1572;
    float _1582 = _984 * _1570;
    float _1584 = _1544 * _1570;
    float _1586 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1578);
    bool _1588 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1590 = isnan(_896);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_94;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1008);
    float _1604 = fma(_1584, _984, _1580);
    float _1606 = -_1172;
    float _1608 = _1606 + 1.0;
    float _1610 = fma(_1566, _1582, _1574);
    bool _1612 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1614 = isnan(_896);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = -_1598;
    float _1626 = _1624 + 1.0;
    bool _1628 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1630 = isnan(_896);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1642 = _1422 ? as_type<int>(_1608) : as_type<int>(_1172);
    float _1644 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1646 = _1604;
    float _1648 = _1610;
    if (_932)
    {
        float _1650 = _1466 ? _1352 : _1118;
        _1324 = _1650;
    }
    float _1652 = _1324;
    float _1654 = _1638 * _1626;
    float _1656 = -_1638;
    float _1658 = _1656 + 1.0;
    float _1660 = fma(_1374, _1576, _1602);
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1664 = _1610 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1668 = _1604 + _1666;
    float _1670 = _1622 * _1658;
    bool _1672 = !_938;
    float _1674 = _1672 ? _1172 : as_type<float>(_1642);
    float _1676 = _1664 * _1664;
    float _1678 = _1668 * _1668;
    float _1680 = _1436 * _1670;
    float _1682 = _1676;
    float _1684 = _1678;
    if (_944)
    {
        float _1686 = _970 ? _1608 : _1172;
        _1326 = _1686;
    }
    float _1688 = _1326;
    float _1690 = fma(_1464, _1496, _1504);
    float _1692 = _1676 + _1678;
    float _1694 = _1348 * 0.15915493667125701904296875;
    float _1696 = fma(_1464, _1522, _1440);
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1700 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1702 = _1696 * _1508;
    float _1704 = -_1622;
    float _1706 = _1704 + 1.0;
    float _1708 = fma(_1690, _1514, _1702);
    float _1710 = sqrt(_1692);
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1716 = fma(_1558, _1534, _1708);
    float _1718 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1128);
    float _1720 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1712);
    float _1722 = fma(_1674, _1700, -0.5);
    float _1724 = _1498 + _1716;
    float _1726 = _1694 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1734 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1736 = -_1718;
    float _1738 = fma(_1410, _1722, _1736);
    float _1740 = fma(_1730, _1652, -0.5);
    float _1742 = fma(_1644, -2.0, _1732);
    float _1744 = -_1714;
    float _1746 = fma(_1734, 2.0, _1744);
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1750 = _1710 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1752 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1680);
    float _1754 = fma(_1728, _1582, _1724);
    float _1756 = _1716;
    if (!_1750)
    {
        _1756 = _1754;
    }
    float _1758 = _1756;
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1762 = fma(_1688, _1760, -0.5);
    bool _1764 = !_1750;
    float _1766 = _1758;
    if (!_1764)
    {
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1772 = _1710 + _1770;
        float _1774 = rsqrt(_1692);
        float _1776 = _1772 * _1768;
        float _1778 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = _1776 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = _1774 * _1790;
        float _1794 = fma(_1664, _1792, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1796 = _1788 + (-1.0);
        float _1798 = fma(_1668, _1792, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1802 = _1794 + _1800;
        float _1804 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1808 = _1798 + _1806;
        float _1810 = _1802 * _1802;
        float _1812 = fma(_1754, _1788, _1804);
        float _1814 = _1808 * _1808;
        _1766 = _1812;
        _1682 = _1810;
        _1684 = _1814;
        _1646 = _1798;
        _1648 = _1794;
    }
    float _1816 = _1766;
    float _1818 = _1682;
    float _1820 = _1684;
    float _1822 = _1646;
    float _1824 = _1648;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1828 = _1816 + _1826;
    float _1830 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1586);
    float _1832 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1742);
    float _1834 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1720);
    float _1836 = fma(_1828, _1828, _1818);
    float _1838 = -_94;
    float _1840 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1746);
    float _1842 = in.m_57.z;
    float _1844 = fma(_1444, _1654, _1752);
    float _1846 = _1836 + _1820;
    float _1848 = -_1832;
    float _1850 = fma(_1830, _1762, _1848);
    float _1852 = fma(_1834, _1740, _1840);
    float _1854 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1844);
    float _1856 = _1660 + 0.5;
    float _1858 = sqrt(_1846);
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1868 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1872 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1876 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1878 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1884 = _1738 + 0.5;
    float _1886 = _1852 + 0.5;
    float _1888 = _1850 + 0.5;
    float _1890 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1168;
    bool _1892 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1894 = isnan(_1858);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1900 = _1896 || _1898;
    out.m_59.z = _1842;
    out.m_61.x = _1878;
    out.m_61.y = _1880;
    out.m_61.z = _1882;
    out.m_63.x = _1856;
    out.m_63.y = _1884;
    out.m_63.z = _1886;
    out.m_63.w = _1888;
    if (!_1900)
    {
        _104 = 1.0;
    }
    float _1902 = _104;
    out.m_65.x = _1868;
    out.m_65.y = _1872;
    out.m_65.z = _1876;
    out.m_65.w = _1890;
    bool _1904 = !_1900;
    float _1906 = _1902;
    if (!_1904)
    {
        bool _1908 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1910 = isnan(_1858);
        bool _1912 = _1908 || _1910;
        bool _1914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1916 = _1912 || _1914;
        if (!_1916)
        {
            float _1918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1920 = _1858 + _1918;
            float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1924 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1922;
            float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1928 = _1926 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1930 = 1.0 / _1924;
            float _1932 = _1920 * _1930;
            float _1934 = fma(_1932, _1928, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1906 = _1934;
            _1936 = true;
        }
        else
        {
            bool _1938 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1940 = isnan(_1858);
            bool _1942 = _1938 || _1940;
            bool _1944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1946 = _1942 || _1944;
            if (!_1946)
            {
                float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1950 = _1858 + _1948;
                float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1954 = _1952 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1956 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1958 = _1956 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1960 = 1.0 / _1954;
                float _1962 = _1950 * _1960;
                float _1964 = fma(_1962, _1958, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1906 = _1964;
                _1936 = true;
            }
            else
            {
                _1906 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1936 = false;
    float _1966 = _1906;
    float _1968 = -_1028;
    float _1970 = _954 + _1968;
    float _1972 = -_1030;
    float _1974 = _958 + _1972;
    float _1976 = -_1032;
    float _1978 = _964 + _1976;
    float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1982 = _1816 + _1980;
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1988 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1990 = _1822 + _1988;
    float _1992 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1984);
    float _1994 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1986);
    float _1996 = fma(_1982, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1998 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1992);
    float _2000 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1994);
    float _2002 = -_1028;
    float _2004 = _2002 + _1996;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2020 = _1824 + _2018;
    float _2022 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2024 = 1.0 / _2016;
    float _2026 = fma(_2020, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2028 = fma(_1990, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2030 = _2022 + _2016;
    float _2032 = -_1030;
    float _2034 = _2032 + _2026;
    float _2036 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = -_1032;
    float _2040 = _2038 + _2028;
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2044 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2042);
    float _2050 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2052 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2054 = _2030 * _2024;
    float _2056 = _2054 * 0.5;
    float _2058 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2050);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2062 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2064 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2048);
    float _2066 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2068 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2074 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2076 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2062);
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2080 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2082 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2072);
    float _2084 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2074);
    float _2086 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2088 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2090 = _2066;
    if (_2014)
    {
        _2090 = 1.0;
    }
    float _2092 = _2090;
    float _2094 = _2092;
    if (!_2014)
    {
        float _2096 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2100 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2098);
        float _2102 = _2096 * 0.15915493667125701904296875;
        float _2104 = _2102 * 6.283185482025146484375;
        float _2106 = cos(_2104);
        float _2108 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = _2102 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = 1.0 / _2106;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = 1.0 / _2100;
        float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2128 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2126;
        float _2130 = _2120 * _2122;
        float _2132 = _2110 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        float _2136 = 1.0 / _2130;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2140 = _2124 * _2138;
        float _2142 = 1.0 / _2128;
        float _2144 = _2134 * _2136;
        float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2148 = fma(_2144, _2140, _2146);
        float _2150 = _2148 * _2142;
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = -_2152;
        float _2156 = _2154 + 1.0;
        _2094 = _2156;
    }
    float _2158 = _2094;
    float _2160 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2162 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2080);
    float _2164 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2166 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2082);
    float _2168 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2084);
    bool _2170 = _2158 > 0.0;
    bool _2172 = isnan(_2158);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2182 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2162);
    float _2184 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2164);
    float _2186 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2168);
    float _2188 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2166);
    float _2190 = _2180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2192 = _2184 + _2186;
    float _2194 = _2188 + _2186;
    float _2196 = _2186 * 0.5;
    float _2198 = _2192 * 0.5;
    float _2200 = _2194 * 0.5;
    float _2202 = fma(_2182, -0.5, _2196);
    out.m_67.x = _2034;
    out.m_67.y = _2004;
    out.m_67.z = _2040;
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2182;
    out.gl_Position.z = _2188;
    out.gl_Position.w = _2186;
    out.m_39.x = _2190;
    out.m_69.x = _2198;
    out.m_69.y = _2202;
    out.m_69.z = _2200;
    out.m_69.w = _2186;
    if (_2178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_39.x = 0.0;
    float _2204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2204;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1936 = false;
    bool _894 = false;
    bool _666 = false;
    bool _506 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_32.w;
    float _85 = in.m_34.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _85;
    float _104 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _100;
    if (!_98)
    {
        out.m_39.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2272 = as_type<float>(_112);
        out.gl_Position.z = _2272;
    }
    if (!_98)
    {
        return out;
    }
    bool _116 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_85);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = in.m_41.z;
    float _128 = float(_90);
    float _130 = in.m_41.w;
    bool _132 = _94 >= _128;
    bool _134 = !_124;
    bool _136 = _132 || _134;
    float _138 = 1.0 / _128;
    float _140 = 0.0;
    if (_136)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_136)
    {
        out.m_39.x = 0.0;
    }
    float _144 = _94 * _138;
    if (_136)
    {
        float _146 = _142 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    out.m_43.z = _126;
    float _150 = as_type<float>(_148);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2340 = as_type<float>(_148);
        out.gl_Position.z = _2340;
    }
    out.m_43.w = _130;
    out.m_37.x = _144;
    if (_136)
    {
        return out;
    }
    float _152 = in.m_34.x;
    float _154 = in.m_34.y;
    float _156 = in.m_34.z;
    float _158 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _158;
    if (!_168)
    {
        float _172 = _158 * _158;
        float _174 = _172 * 0.5;
        _150 = _174;
    }
    float _176 = _150;
    float _178 = 0.0;
    float _180 = _176;
    if (!_168)
    {
        float _182 = _94 * _94;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_168)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_168;
    float _194 = _190;
    float _196 = 0.0;
    if (!_192)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _158 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _158);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _140 = _214;
        _194 = _226;
        _196 = _216;
    }
    float _228 = _140;
    float _230 = _194;
    float _232 = _196;
    bool _234 = !_168;
    float _236 = _228;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _236 = _252;
        _238 = _246;
        _170 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _170;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _94;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _276;
    }
    float _278 = _268;
    bool _280 = !_168;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _94 * _286;
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _288 * 0.693147182464599609375;
        float _300 = exp2(_290);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _94);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_168;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _94 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = fma(_264, _152, _272);
    float _342 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _346 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_264, _154, _342);
    float _352 = fma(_338, _154, _344);
    float _354 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = fma(_264, _156, _348);
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_338, _156, _354);
    float _366 = -_356;
    float _368 = _340 + _366;
    float _370 = in.m_45.y;
    float _372 = _362 * _362;
    float _374 = -_364;
    float _376 = _358 + _374;
    float _378 = in.m_47.y;
    float _380 = fma(_368, _368, _372);
    float _382 = in.m_49.y;
    float _384 = fma(_376, _376, _380);
    float _386 = in.m_47.x;
    float _388 = sqrt(_384);
    float _390 = in.m_45.x;
    float _392 = in.m_49.x;
    float _394 = in.m_47.z;
    float _396 = _362 * _370;
    float _398 = in.m_45.z;
    float _400 = _362 * _378;
    bool _402 = _388 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_388);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = in.m_49.z;
    float _414 = _362 * _382;
    float _416 = _370 * _370;
    float _418 = in.m_51.w;
    float _420 = fma(_368, _386, _400);
    float _422 = fma(_378, _378, _416);
    float _424 = in.m_32.x;
    float _426 = in.m_32.y;
    float _428 = in.m_32.z;
    float _430 = fma(_368, _390, _396);
    float _432 = fma(_382, _382, _422);
    float _434 = fma(_368, _392, _414);
    float _436 = fma(_376, _394, _420);
    float _438 = fma(_376, _398, _430);
    float _440 = fma(_376, _412, _434);
    float _442 = _434;
    float _444 = _438;
    float _446 = _418;
    float _448 = _436;
    if (_410)
    {
        _442 = _438;
    }
    float _450 = _442;
    float _452 = _450;
    float _454 = _450;
    if (_410)
    {
        _444 = _440;
    }
    float _456 = _444;
    float _458 = fma(_340, _418, _424);
    float _460 = fma(_350, _418, _426);
    float _462 = fma(_358, _418, _428);
    float _464 = _456;
    float _466 = _456;
    if (!_410)
    {
        bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _470 = !_468;
        if (!_470)
        {
            float _472 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _474 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[16].x, _472);
            float _480 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].z, _478);
            float _486 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = _484 * _484;
            float _492 = fma(_486, _486, _490);
            float _494 = fma(_488, _488, _492);
            float _496 = rsqrt(_494);
            float _498 = _496 * 9.9999999747524270787835121154785e-07;
            float _500 = _486 * _498;
            float _502 = _484 * _498;
            float _504 = _488 * _498;
            _454 = _502;
            _448 = _500;
            _466 = _504;
            _506 = true;
        }
        else
        {
            float _508 = _154 * _154;
            float _510 = fma(_152, _152, _508);
            float _512 = fma(_156, _156, _510);
            float _514 = sqrt(_512);
            bool _516 = _514 >= 9.9999999747524270787835121154785e-07;
            bool _518 = isnan(_514);
            bool _520 = _516 || _518;
            bool _522 = isnan(9.9999999747524270787835121154785e-07);
            bool _524 = _520 || _522;
            float _526 = _514;
            if (!_524)
            {
                float _528 = _426 * _426;
                float _530 = fma(_424, _424, _528);
                float _532 = fma(_428, _428, _530);
                float _534 = sqrt(_532);
                bool _536 = _534 >= 9.9999999747524270787835121154785e-07;
                bool _538 = isnan(_534);
                bool _540 = _536 || _538;
                bool _542 = isnan(9.9999999747524270787835121154785e-07);
                bool _544 = _540 || _542;
                float _546 = _432;
                if (!_544)
                {
                    float _548 = rsqrt(_432);
                    _546 = _548;
                }
                float _550 = _546;
                if (!_544)
                {
                    float _552 = _550 * 9.9999999747524270787835121154785e-07;
                    _446 = _552;
                }
                float _554 = _446;
                if (!_544)
                {
                    float _556 = _378 * _554;
                    _526 = _556;
                }
                float _558 = _526;
                _448 = _558;
                if (!_544)
                {
                    float _560 = _370 * _554;
                    _452 = _560;
                }
                float _562 = _452;
                _454 = _562;
                if (!_544)
                {
                    float _564 = _382 * _554;
                    _464 = _564;
                }
                float _566 = _464;
                bool _568 = !_544;
                _466 = _566;
                _506 = _568;
                if (!_506)
                {
                    float _570 = _370 * _426;
                    float _572 = _378 * _426;
                    float _574 = _382 * _426;
                    float _576 = fma(_424, _390, _570);
                    float _578 = fma(_424, _386, _572);
                    float _580 = fma(_424, _392, _574);
                    float _582 = fma(_428, _398, _576);
                    float _584 = fma(_428, _394, _578);
                    float _586 = fma(_428, _412, _580);
                    float _588 = _582 * _582;
                    float _590 = fma(_584, _584, _588);
                    float _592 = fma(_586, _586, _590);
                    float _594 = rsqrt(_592);
                    float _596 = _594 * 9.9999999747524270787835121154785e-07;
                    float _598 = _584 * _596;
                    float _600 = _582 * _596;
                    float _602 = _586 * _596;
                    _454 = _600;
                    _448 = _598;
                    _466 = _602;
                    _506 = true;
                }
            }
            else
            {
                float _604 = _370 * _154;
                float _606 = _378 * _154;
                float _608 = _382 * _154;
                float _610 = fma(_152, _390, _604);
                float _612 = fma(_152, _386, _606);
                float _614 = fma(_152, _392, _608);
                float _616 = fma(_156, _398, _610);
                float _618 = fma(_156, _394, _612);
                float _620 = fma(_156, _412, _614);
                float _622 = _616 * _616;
                float _624 = fma(_618, _618, _622);
                float _626 = fma(_620, _620, _624);
                float _628 = rsqrt(_626);
                float _630 = _628 * 9.9999999747524270787835121154785e-07;
                float _632 = _618 * _630;
                float _634 = _616 * _630;
                float _636 = _620 * _630;
                _454 = _634;
                _448 = _632;
                _466 = _636;
            }
        }
    }
    _506 = false;
    float _638 = _454;
    float _640 = _448;
    float _642 = _466;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _646 = !_644;
    float _664;
    if (!_646)
    {
        float _648 = in.m_41.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[12].x, _94);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        _664 = _144;
    }
    _666 = false;
    float _668 = _664;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _672 = _668 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _676 = _668 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _692 = _668 + _690;
    float _694 = 1.0 / _680;
    bool _696 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _698 = isnan(_668);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _710 = isnan(_668);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = 1.0 / _684;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _724 = 1.0 / _688;
    float _726 = _676 * _694;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _728;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _732;
    float _736 = fma(_734, _726, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _738 = _672 * _720;
    bool _740 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _742 = isnan(_668);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _752;
    float _756 = fma(_730, _726, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _766 = -_750;
    float _768 = _766 + 1.0;
    float _770 = _692 * _724;
    float _772 = fma(_754, _726, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _774 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _776 = isnan(_668);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = _706 * _768;
    float _788 = -_706;
    float _790 = _788 + 1.0;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _796 = fma(_764, _738, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _798 = -_784;
    float _800 = _798 + 1.0;
    float _802 = _784 * _790;
    float _804 = fma(_794, _738, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _806 = fma(_760, _738, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _808 = _718 * _800;
    float _810 = in.m_51.x;
    float _812 = in.m_51.y;
    float _814 = in.m_51.z;
    float _816 = _756 * _808;
    float _818 = _736 * _808;
    float _820 = _772 * _808;
    float _822 = -_718;
    float _824 = _822 + 1.0;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _834;
    float _838 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _816);
    float _840 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _818);
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _820);
    float _844 = fma(_828, _770, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _846 = fma(_832, _770, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _848 = fma(_836, _770, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _850 = fma(_804, _802, _838);
    float _852 = fma(_806, _802, _840);
    float _854 = fma(_796, _802, _842);
    float _856 = fma(_844, _786, _850);
    float _858 = fma(_846, _786, _852);
    float _860 = fma(_848, _786, _854);
    float _862 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].x, _856);
    float _864 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].y, _858);
    float _866 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].z, _860);
    float _868 = _862 * _810;
    float _870 = _864 * _812;
    float _872 = _866 * _814;
    bool _874 = !_722;
    float _892;
    if (!_874)
    {
        float _876 = in.m_41.x;
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _880 = _876 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[11].y, _94);
        float _884 = _882 * _878;
        float _886 = floor(_884);
        float _888 = -_886;
        float _890 = _884 + _888;
        _892 = _890;
        _894 = true;
    }
    else
    {
        _892 = _144;
    }
    _894 = false;
    float _896 = _892;
    float _898 = in.m_45.w;
    float _900 = _460 * _378;
    float _902 = _460 * _370;
    float _904 = _460 * _382;
    float _906 = in.m_47.w;
    float _908 = fma(_458, _390, _902);
    float _910 = in.m_49.w;
    float _912 = fma(_458, _392, _904);
    float _914 = fma(_458, _386, _900);
    float _916 = fma(_462, _398, _908);
    float _918 = in.m_53.x;
    float _920 = in.m_53.y;
    float _922 = in.m_53.z;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    float _928 = fma(_462, _394, _914);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _932 = _930 != 0;
    float _934 = fma(_462, _412, _912);
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _938 = _936 != 0;
    float _940 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _948 = _946 != 0;
    float _950 = in.m_41.x;
    float _952 = in.m_41.y;
    float _954 = _916 + _898;
    float _956 = fma(_130, 0.39999997615814208984375, 0.60000002384185791015625);
    float _958 = _928 + _906;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _962 = _954 + _960;
    float _964 = _934 + _910;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _968 = _958 + _966;
    bool _970 = _130 > 0.5;
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    float _974 = _962 * _962;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _918);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = _964 + _978;
    float _982 = -_130;
    float _984 = fma(_982, 0.25, 1.0);
    float _986 = fma(_968, _968, _974);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _922);
    float _990 = fma(_980, _980, _986);
    float _992 = _638 * _638;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _996 = rsqrt(_990);
    float _998 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1000 = _950 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1002 = fma(_640, _640, _992);
    float _1004 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _998);
    float _1006 = -_994;
    float _1008 = fma(_1000, 2.0, _1006);
    float _1010 = fma(_642, _642, _1002);
    float _1012 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = rsqrt(_1010);
    float _1018 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1012);
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1022 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1004);
    float _1024 = _1020 * _996;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1018);
    float _1028 = _962 * _1024;
    float _1030 = _968 * _1024;
    float _1032 = _980 * _1024;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1038 = -_1028;
    float _1040 = _962 + _1038;
    float _1042 = -_1030;
    float _1044 = _968 + _1042;
    float _1046 = _1016 * _642;
    float _1048 = _1040 * _1040;
    float _1050 = _1016 * _640;
    float _1052 = fma(_952, 2.0, -1.0);
    float _1054 = fma(2.0, _950, -1.0);
    float _1056 = fma(_1044, _1044, _1048);
    float _1058 = _1016 * _638;
    float _1060 = _1052 * _1052;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1064 = _1046 * _1062;
    float _1066 = fma(_126, 2.0, -1.0);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = _1058 * _1068;
    float _1072 = fma(_1054, _1054, _1060);
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1076 = -_1064;
    float _1078 = fma(_1050, _1074, _1076);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1082 = _1050 * _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1086 = -_1070;
    float _1088 = fma(_1046, _1084, _1086);
    float _1090 = fma(_1066, _1066, _1072);
    float _1092 = _1078 * _1078;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1096 = -_1082;
    float _1098 = fma(_1058, _1094, _1096);
    float _1100 = -_1032;
    float _1102 = _980 + _1100;
    float _1104 = fma(_1088, _1088, _1092);
    float _1106 = rsqrt(_1090);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1110 = fma(_1098, _1098, _1104);
    float _1112 = fma(_1102, _1102, _1056);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1118 = in.m_55.x;
    float _1120 = in.m_55.y;
    float _1122 = 1.0 / _1036;
    float _1124 = _952 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1126 = _950 > 0.5;
    float _1128 = fma(_1124, -2.0, _1108);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1130;
    float _1134 = sqrt(_1026);
    float _1136 = rsqrt(_1110);
    float _1138 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1140 = fma(_144, -0.5, 1.0);
    float _1142 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1144 = _1106 * _1140;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1150 = sqrt(_1112);
    float _1152 = _1132 * _1122;
    float _1154 = _1052 * _1144;
    float _1156 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1142);
    float _1158 = fma(_1154, _1134, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1160 = 1.0 / _1116;
    float _1162 = _1078 * _1136;
    float _1164 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1166 = _1098 * _1136;
    float _1168 = in.m_57.x;
    float _1170 = _1088 * _1136;
    float _1172 = _1164 * _1120;
    float _1174 = sqrt(_1022);
    float _1176 = _996 * _1150;
    float _1178 = _1014 * _1176;
    float _1180 = _1164 * _1176;
    float _1182 = _940 * _1176;
    float _1184 = _1148 * _1160;
    float _1186 = _1066 * _1144;
    float _1188 = _952 * 78.233001708984375;
    float _1190 = _1178 * _976;
    float _1192 = _144 * _956;
    float _1194 = _1058 * _1166;
    float _1196 = _1054 * _1144;
    float _1198 = fma(_950, 12.98980045318603515625, _1188);
    float _1200 = _1180 * _972;
    float _1202 = _1182 * _988;
    float _1204 = -_1194;
    float _1206 = fma(_1046, _1162, _1204);
    float _1208 = fma(_1196, _1174, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1210 = _1198 * 0.15915493667125701904296875;
    float _1212 = _1050 * _1162;
    float _1214 = _1200 * _1050;
    float _1216 = _1046 * _1170;
    float _1218 = _1200 * _1058;
    float _1220 = _1200 * _1046;
    float _1222 = -_1212;
    float _1224 = fma(_1058, _1170, _1222);
    float _1226 = fma(_1190, _1170, _1214);
    float _1228 = -_1216;
    float _1230 = fma(_1050, _1166, _1228);
    float _1232 = fma(_1190, _1162, _1218);
    float _1234 = fma(_1190, _1166, _1220);
    float _1236 = fma(_1202, _1206, _1226);
    float _1238 = sqrt(_1156);
    float _1240 = fma(_1202, _1230, _1232);
    float _1242 = fma(_1202, _1224, _1234);
    float _1244 = fma(_1192, -0.5, 0.5);
    float _1246 = _958 + _1236;
    float _1248 = _954 + _1240;
    float _1250 = _964 + _1242;
    float _1252 = -_1244;
    float _1254 = fma(_1252, _1168, 1.0);
    float _1256 = -_1246;
    float _1258 = _1256 + _1208;
    float _1260 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1262 = _1248 + _1260;
    float _1264 = _1210 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = -_1248;
    float _1270 = _1268 + _1158;
    float _1272 = fma(_1254, _1258, _1246);
    float _1274 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1276 = _1246 + _1274;
    float _1278 = _1262 * _1262;
    float _1280 = fma(_1254, _1270, _1248);
    float _1282 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1284 = _1250 + _1282;
    float _1286 = fma(_1186, _1238, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1288 = fma(_1276, _1276, _1278);
    float _1290 = -_1280;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1294 = -_1272;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1298 = -_1250;
    float _1300 = _1298 + _1286;
    float _1302 = fma(_1284, _1284, _1288);
    float _1304 = _1292 * _1292;
    float _1306 = fma(_1254, _1300, _1250);
    float _1308 = _1266 * 43758.546875;
    float _1310 = fma(_1296, _1296, _1304);
    float _1312 = rsqrt(_1302);
    float _1314 = -_1306;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1318 = _1168 * 4.0;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1322 = _1300;
    float _1324 = _1118;
    float _1326 = _1172;
    if (!_948)
    {
        _1322 = _952;
    }
    float _1328 = _1322;
    float _1330 = fma(_1316, _1316, _1310);
    float _1332 = fma(_144, 2.0, -1.0);
    float _1334 = fma(_94, 0.1500000059604644775390625, _1318);
    float _1336 = floor(_1308);
    float _1338 = _144 * 32.0;
    float _1340 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1320);
    float _1342 = _1328;
    float _1344 = _1338;
    if (_948)
    {
        _1342 = _950;
    }
    float _1346 = _1342;
    float _1348 = fma(_950, 6.283185482025146484375, _1334);
    float _1350 = -_1118;
    float _1352 = _1350 + 1.0;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1356 = sqrt(_1330);
    float _1358 = _1262 * _1312;
    float _1360 = _1276 * _1312;
    float _1362 = _1284 * _1312;
    float _1364 = fma(_94, 0.20000000298023223876953125, _1318);
    float _1366 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1354);
    float _1368 = abs(_1332);
    float _1370 = -_1368;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1340);
    float _1376 = -_1336;
    float _1378 = _1308 + _1376;
    float _1380 = _1358 * _1358;
    float _1382 = fma(_952, 6.283185482025146484375, _1364);
    float _1384 = fma(_126, 6.283185482025146484375, _1364);
    float _1386 = _1378 * 6.283185482025146484375;
    float _1388 = fma(_1360, _1360, _1380);
    int _1390 = _1126 ? as_type<int>(_1352) : as_type<int>(_1118);
    float _1392 = _1384 * 0.15915493667125701904296875;
    float _1394 = fma(_1338, _1168, _1386);
    float _1396 = fma(_1362, _1362, _1388);
    float _1398 = precise::max(_1356, 1.5);
    float _1400 = _1382 * 0.15915493667125701904296875;
    float _1402 = _1394 * 0.15915493667125701904296875;
    float _1404 = rsqrt(_1396);
    float _1406 = _1388;
    if (!_948)
    {
        _1344 = _126;
    }
    float _1408 = _1344;
    float _1410 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1366);
    float _1412 = _1408;
    if (!_948)
    {
        _1406 = _126;
    }
    float _1414 = _1406;
    float _1416 = precise::min(_1398, 2.5);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1420 = _896 + _1418;
    bool _1422 = _952 > 0.5;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1426 = _896 + _1424;
    float _1428 = _1414;
    if (_948)
    {
        _1412 = _952;
    }
    float _1430 = _1412;
    float _1432 = _1416 + (-1.5);
    if (_948)
    {
        _1428 = _952;
    }
    float _1434 = _1428;
    float _1436 = fma(_1152, _1426, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = fma(_1240, _1432, _954);
    float _1444 = fma(_1184, _1420, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1446 = fma(_1236, _1432, _958);
    float _1448 = fma(_1242, _1432, _964);
    float _1450 = -_1442;
    float _1452 = _1158 + _1450;
    float _1454 = _1360 * _1404;
    float _1456 = -_1446;
    float _1458 = _1208 + _1456;
    float _1460 = _1402 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1358 * _1404;
    bool _1466 = _126 > 0.5;
    float _1468 = fma(_1254, _1452, _1442);
    float _1470 = -_958;
    float _1472 = _1470 + _1208;
    float _1474 = _1362 * _1404;
    float _1476 = -_954;
    float _1478 = _1476 + _1158;
    float _1480 = fma(_1254, _1458, _1446);
    float _1482 = -_1440;
    float _1484 = _1482 + 1.0;
    float _1486 = -_964;
    float _1488 = _1486 + _1286;
    float _1490 = fma(_1254, _1472, _958);
    float _1492 = -_1448;
    float _1494 = _1286 + _1492;
    float _1496 = _1454 * _1484;
    float _1498 = fma(_1254, _1478, _954);
    float _1500 = fma(_1254, _1488, _964);
    float _1502 = fma(_1254, _1494, _1448);
    float _1504 = _1474 * _1462;
    float _1506 = -_1498;
    float _1508 = _1468 + _1506;
    float _1510 = fma(_1454, _1496, _1440);
    float _1512 = -_1490;
    float _1514 = _1480 + _1512;
    float _1516 = -_1504;
    float _1518 = fma(_1464, _1496, _1516);
    float _1520 = _1454 * _1462;
    float _1522 = _1464 * _1484;
    float _1524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1526 = _1518 * _1508;
    float _1528 = _1474 * _1474;
    float _1530 = fma(_1474, _1522, _1520);
    float _1532 = -_1500;
    float _1534 = _1502 + _1532;
    float _1536 = fma(_1510, _1514, _1526);
    float _1538 = _1464 * _1462;
    float _1540 = _1530 * _1508;
    float _1542 = _1392 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = fma(_1484, _1528, _1440);
    float _1548 = -_1538;
    float _1550 = fma(_1474, _1496, _1548);
    float _1552 = fma(_1474, _1496, _1538);
    float _1554 = _926 ? as_type<float>(_1390) : _1118;
    float _1556 = -_1520;
    float _1558 = fma(_1474, _1522, _1556);
    float _1560 = fma(_1550, _1514, _1540);
    float _1562 = fma(_1552, _1534, _1536);
    float _1564 = _1400 * 6.283185482025146484375;
    float _1566 = sin(_1564);
    float _1568 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1570 = _1372 * _1168;
    float _1572 = fma(_1546, _1534, _1560);
    float _1574 = _1490 + _1562;
    float _1576 = fma(_1554, _1568, -0.5);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1580 = _1500 + _1572;
    float _1582 = _984 * _1570;
    float _1584 = _1544 * _1570;
    float _1586 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1578);
    bool _1588 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1590 = isnan(_896);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_94;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1008);
    float _1604 = fma(_1584, _984, _1580);
    float _1606 = -_1172;
    float _1608 = _1606 + 1.0;
    float _1610 = fma(_1566, _1582, _1574);
    bool _1612 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1614 = isnan(_896);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = -_1598;
    float _1626 = _1624 + 1.0;
    bool _1628 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1630 = isnan(_896);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1642 = _1422 ? as_type<int>(_1608) : as_type<int>(_1172);
    float _1644 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1646 = _1604;
    float _1648 = _1610;
    if (_932)
    {
        float _1650 = _1466 ? _1352 : _1118;
        _1324 = _1650;
    }
    float _1652 = _1324;
    float _1654 = _1638 * _1626;
    float _1656 = -_1638;
    float _1658 = _1656 + 1.0;
    float _1660 = fma(_1374, _1576, _1602);
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1664 = _1610 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1668 = _1604 + _1666;
    float _1670 = _1622 * _1658;
    bool _1672 = !_938;
    float _1674 = _1672 ? _1172 : as_type<float>(_1642);
    float _1676 = _1664 * _1664;
    float _1678 = _1668 * _1668;
    float _1680 = _1436 * _1670;
    float _1682 = _1676;
    float _1684 = _1678;
    if (_944)
    {
        float _1686 = _970 ? _1608 : _1172;
        _1326 = _1686;
    }
    float _1688 = _1326;
    float _1690 = fma(_1464, _1496, _1504);
    float _1692 = _1676 + _1678;
    float _1694 = _1348 * 0.15915493667125701904296875;
    float _1696 = fma(_1464, _1522, _1440);
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1700 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1702 = _1696 * _1508;
    float _1704 = -_1622;
    float _1706 = _1704 + 1.0;
    float _1708 = fma(_1690, _1514, _1702);
    float _1710 = sqrt(_1692);
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1716 = fma(_1558, _1534, _1708);
    float _1718 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1128);
    float _1720 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1712);
    float _1722 = fma(_1674, _1700, -0.5);
    float _1724 = _1498 + _1716;
    float _1726 = _1694 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1734 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1736 = -_1718;
    float _1738 = fma(_1410, _1722, _1736);
    float _1740 = fma(_1730, _1652, -0.5);
    float _1742 = fma(_1644, -2.0, _1732);
    float _1744 = -_1714;
    float _1746 = fma(_1734, 2.0, _1744);
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1750 = _1710 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1752 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1680);
    float _1754 = fma(_1728, _1582, _1724);
    float _1756 = _1716;
    if (!_1750)
    {
        _1756 = _1754;
    }
    float _1758 = _1756;
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1762 = fma(_1688, _1760, -0.5);
    bool _1764 = !_1750;
    float _1766 = _1758;
    if (!_1764)
    {
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1772 = _1710 + _1770;
        float _1774 = rsqrt(_1692);
        float _1776 = _1772 * _1768;
        float _1778 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = _1776 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = _1774 * _1790;
        float _1794 = fma(_1664, _1792, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1796 = _1788 + (-1.0);
        float _1798 = fma(_1668, _1792, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1802 = _1794 + _1800;
        float _1804 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1808 = _1798 + _1806;
        float _1810 = _1802 * _1802;
        float _1812 = fma(_1754, _1788, _1804);
        float _1814 = _1808 * _1808;
        _1766 = _1812;
        _1682 = _1810;
        _1684 = _1814;
        _1646 = _1798;
        _1648 = _1794;
    }
    float _1816 = _1766;
    float _1818 = _1682;
    float _1820 = _1684;
    float _1822 = _1646;
    float _1824 = _1648;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1828 = _1816 + _1826;
    float _1830 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1586);
    float _1832 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1742);
    float _1834 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1720);
    float _1836 = fma(_1828, _1828, _1818);
    float _1838 = -_94;
    float _1840 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1746);
    float _1842 = in.m_57.z;
    float _1844 = fma(_1444, _1654, _1752);
    float _1846 = _1836 + _1820;
    float _1848 = -_1832;
    float _1850 = fma(_1830, _1762, _1848);
    float _1852 = fma(_1834, _1740, _1840);
    float _1854 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1844);
    float _1856 = _1660 + 0.5;
    float _1858 = sqrt(_1846);
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1868 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1872 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1876 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1878 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1884 = _1738 + 0.5;
    float _1886 = _1852 + 0.5;
    float _1888 = _1850 + 0.5;
    float _1890 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1168;
    bool _1892 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1894 = isnan(_1858);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1900 = _1896 || _1898;
    out.m_59.z = _1842;
    out.m_61.x = _1878;
    out.m_61.y = _1880;
    out.m_61.z = _1882;
    out.m_63.x = _1856;
    out.m_63.y = _1884;
    out.m_63.z = _1886;
    out.m_63.w = _1888;
    if (!_1900)
    {
        _104 = 1.0;
    }
    float _1902 = _104;
    out.m_65.x = _1868;
    out.m_65.y = _1872;
    out.m_65.z = _1876;
    out.m_65.w = _1890;
    bool _1904 = !_1900;
    float _1906 = _1902;
    if (!_1904)
    {
        bool _1908 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1910 = isnan(_1858);
        bool _1912 = _1908 || _1910;
        bool _1914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1916 = _1912 || _1914;
        if (!_1916)
        {
            float _1918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1920 = _1858 + _1918;
            float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1924 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1922;
            float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1928 = _1926 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1930 = 1.0 / _1924;
            float _1932 = _1920 * _1930;
            float _1934 = fma(_1932, _1928, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1906 = _1934;
            _1936 = true;
        }
        else
        {
            bool _1938 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1940 = isnan(_1858);
            bool _1942 = _1938 || _1940;
            bool _1944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1946 = _1942 || _1944;
            if (!_1946)
            {
                float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1950 = _1858 + _1948;
                float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1954 = _1952 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1956 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1958 = _1956 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1960 = 1.0 / _1954;
                float _1962 = _1950 * _1960;
                float _1964 = fma(_1962, _1958, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1906 = _1964;
                _1936 = true;
            }
            else
            {
                _1906 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1936 = false;
    float _1966 = _1906;
    float _1968 = -_1028;
    float _1970 = _954 + _1968;
    float _1972 = -_1030;
    float _1974 = _958 + _1972;
    float _1976 = -_1032;
    float _1978 = _964 + _1976;
    float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1982 = _1816 + _1980;
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1988 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1990 = _1822 + _1988;
    float _1992 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1984);
    float _1994 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1986);
    float _1996 = fma(_1982, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1998 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1992);
    float _2000 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1994);
    float _2002 = -_1028;
    float _2004 = _2002 + _1996;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2020 = _1824 + _2018;
    float _2022 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2024 = 1.0 / _2016;
    float _2026 = fma(_2020, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2028 = fma(_1990, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2030 = _2022 + _2016;
    float _2032 = -_1030;
    float _2034 = _2032 + _2026;
    float _2036 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = -_1032;
    float _2040 = _2038 + _2028;
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2044 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2042);
    float _2050 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2052 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2054 = _2030 * _2024;
    float _2056 = _2054 * 0.5;
    float _2058 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2050);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2062 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2064 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2048);
    float _2066 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2068 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2074 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2076 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2062);
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2080 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2082 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2072);
    float _2084 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2074);
    float _2086 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2088 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2090 = _2066;
    if (_2014)
    {
        _2090 = 1.0;
    }
    float _2092 = _2090;
    float _2094 = _2092;
    if (!_2014)
    {
        float _2096 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2100 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2098);
        float _2102 = _2096 * 0.15915493667125701904296875;
        float _2104 = _2102 * 6.283185482025146484375;
        float _2106 = cos(_2104);
        float _2108 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = _2102 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = 1.0 / _2106;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = 1.0 / _2100;
        float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2128 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2126;
        float _2130 = _2120 * _2122;
        float _2132 = _2110 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        float _2136 = 1.0 / _2130;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2140 = _2124 * _2138;
        float _2142 = 1.0 / _2128;
        float _2144 = _2134 * _2136;
        float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2148 = fma(_2144, _2140, _2146);
        float _2150 = _2148 * _2142;
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = -_2152;
        float _2156 = _2154 + 1.0;
        _2094 = _2156;
    }
    float _2158 = _2094;
    float _2160 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2162 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2080);
    float _2164 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2166 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2082);
    float _2168 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2084);
    bool _2170 = _2158 > 0.0;
    bool _2172 = isnan(_2158);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2182 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2162);
    float _2184 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2164);
    float _2186 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2168);
    float _2188 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2166);
    float _2190 = _2180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2192 = _2184 + _2186;
    float _2194 = _2188 + _2186;
    float _2196 = _2186 * 0.5;
    float _2198 = _2192 * 0.5;
    float _2200 = _2194 * 0.5;
    float _2202 = fma(_2182, -0.5, _2196);
    out.m_67.x = _2034;
    out.m_67.y = _2004;
    out.m_67.z = _2040;
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2182;
    out.gl_Position.z = _2188;
    out.gl_Position.w = _2186;
    out.m_39.x = _2190;
    out.m_69.x = _2198;
    out.m_69.y = _2202;
    out.m_69.z = _2200;
    out.m_69.w = _2186;
    if (_2178)
    {
        return out;
    }
    out.m_39.x = 0.0;
    float _2204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2204;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1936 = false;
    bool _894 = false;
    bool _666 = false;
    bool _506 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_32.w;
    float _85 = in.m_34.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _85;
    float _104 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _100;
    if (!_98)
    {
        out.m_39.x = 0.0;
    }
    int _108 = 0;
    if (!_98)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2272 = as_type<float>(_112);
        out.gl_Position.z = _2272;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _116 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_85);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = in.m_41.z;
    float _128 = float(_90);
    float _130 = in.m_41.w;
    bool _132 = _94 >= _128;
    bool _134 = !_124;
    bool _136 = _132 || _134;
    float _138 = 1.0 / _128;
    float _140 = 0.0;
    if (_136)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_136)
    {
        out.m_39.x = 0.0;
    }
    float _144 = _94 * _138;
    if (_136)
    {
        float _146 = _142 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    out.m_43.z = _126;
    float _150 = as_type<float>(_148);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2340 = as_type<float>(_148);
        out.gl_Position.z = _2340;
    }
    out.m_43.w = _130;
    out.m_37.x = _144;
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_34.x;
    float _154 = in.m_34.y;
    float _156 = in.m_34.z;
    float _158 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _158;
    if (!_168)
    {
        float _172 = _158 * _158;
        float _174 = _172 * 0.5;
        _150 = _174;
    }
    float _176 = _150;
    float _178 = 0.0;
    float _180 = _176;
    if (!_168)
    {
        float _182 = _94 * _94;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    if (!_168)
    {
        float _188 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _188;
    }
    float _190 = _180;
    bool _192 = !_168;
    float _194 = _190;
    float _196 = 0.0;
    if (!_192)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _158 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _158);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _140 = _214;
        _194 = _226;
        _196 = _216;
    }
    float _228 = _140;
    float _230 = _194;
    float _232 = _196;
    bool _234 = !_168;
    float _236 = _228;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _236 = _252;
        _238 = _246;
        _170 = _258;
    }
    float _260 = _236;
    float _262 = _238;
    float _264 = _170;
    float _266 = _262;
    float _268 = _260;
    if (!_168)
    {
        _266 = _94;
    }
    float _270 = _266;
    float _272 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _270;
    if (!_168)
    {
        float _276 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _276;
    }
    float _278 = _268;
    bool _280 = !_168;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _94 * _286;
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _288 * 0.693147182464599609375;
        float _300 = exp2(_290);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _94);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_168;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _94 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _274 = _336;
    }
    float _338 = _274;
    float _340 = fma(_264, _152, _272);
    float _342 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _346 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_264, _154, _342);
    float _352 = fma(_338, _154, _344);
    float _354 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_338, _152, _346);
    float _358 = fma(_264, _156, _348);
    float _360 = -_352;
    float _362 = _350 + _360;
    float _364 = fma(_338, _156, _354);
    float _366 = -_356;
    float _368 = _340 + _366;
    float _370 = in.m_45.y;
    float _372 = _362 * _362;
    float _374 = -_364;
    float _376 = _358 + _374;
    float _378 = in.m_47.y;
    float _380 = fma(_368, _368, _372);
    float _382 = in.m_49.y;
    float _384 = fma(_376, _376, _380);
    float _386 = in.m_47.x;
    float _388 = sqrt(_384);
    float _390 = in.m_45.x;
    float _392 = in.m_49.x;
    float _394 = in.m_47.z;
    float _396 = _362 * _370;
    float _398 = in.m_45.z;
    float _400 = _362 * _378;
    bool _402 = _388 >= 9.9999999747524270787835121154785e-07;
    bool _404 = isnan(_388);
    bool _406 = _402 || _404;
    bool _408 = isnan(9.9999999747524270787835121154785e-07);
    bool _410 = _406 || _408;
    float _412 = in.m_49.z;
    float _414 = _362 * _382;
    float _416 = _370 * _370;
    float _418 = in.m_51.w;
    float _420 = fma(_368, _386, _400);
    float _422 = fma(_378, _378, _416);
    float _424 = in.m_32.x;
    float _426 = in.m_32.y;
    float _428 = in.m_32.z;
    float _430 = fma(_368, _390, _396);
    float _432 = fma(_382, _382, _422);
    float _434 = fma(_368, _392, _414);
    float _436 = fma(_376, _394, _420);
    float _438 = fma(_376, _398, _430);
    float _440 = fma(_376, _412, _434);
    float _442 = _434;
    float _444 = _438;
    float _446 = _418;
    float _448 = _436;
    if (_410)
    {
        _442 = _438;
    }
    float _450 = _442;
    float _452 = _450;
    float _454 = _450;
    if (_410)
    {
        _444 = _440;
    }
    float _456 = _444;
    float _458 = fma(_340, _418, _424);
    float _460 = fma(_350, _418, _426);
    float _462 = fma(_358, _418, _428);
    float _464 = _456;
    float _466 = _456;
    if (!_410)
    {
        bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _470 = !_468;
        if (!_470)
        {
            float _472 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _474 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[16].x, _472);
            float _480 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].z, _478);
            float _486 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = _484 * _484;
            float _492 = fma(_486, _486, _490);
            float _494 = fma(_488, _488, _492);
            float _496 = rsqrt(_494);
            float _498 = _496 * 9.9999999747524270787835121154785e-07;
            float _500 = _486 * _498;
            float _502 = _484 * _498;
            float _504 = _488 * _498;
            _454 = _502;
            _448 = _500;
            _466 = _504;
            _506 = true;
        }
        else
        {
            float _508 = _154 * _154;
            float _510 = fma(_152, _152, _508);
            float _512 = fma(_156, _156, _510);
            float _514 = sqrt(_512);
            bool _516 = _514 >= 9.9999999747524270787835121154785e-07;
            bool _518 = isnan(_514);
            bool _520 = _516 || _518;
            bool _522 = isnan(9.9999999747524270787835121154785e-07);
            bool _524 = _520 || _522;
            float _526 = _514;
            if (!_524)
            {
                float _528 = _426 * _426;
                float _530 = fma(_424, _424, _528);
                float _532 = fma(_428, _428, _530);
                float _534 = sqrt(_532);
                bool _536 = _534 >= 9.9999999747524270787835121154785e-07;
                bool _538 = isnan(_534);
                bool _540 = _536 || _538;
                bool _542 = isnan(9.9999999747524270787835121154785e-07);
                bool _544 = _540 || _542;
                float _546 = _432;
                if (!_544)
                {
                    float _548 = rsqrt(_432);
                    _546 = _548;
                }
                float _550 = _546;
                if (!_544)
                {
                    float _552 = _550 * 9.9999999747524270787835121154785e-07;
                    _446 = _552;
                }
                float _554 = _446;
                if (!_544)
                {
                    float _556 = _378 * _554;
                    _526 = _556;
                }
                float _558 = _526;
                _448 = _558;
                if (!_544)
                {
                    float _560 = _370 * _554;
                    _452 = _560;
                }
                float _562 = _452;
                _454 = _562;
                if (!_544)
                {
                    float _564 = _382 * _554;
                    _464 = _564;
                }
                float _566 = _464;
                bool _568 = !_544;
                _466 = _566;
                _506 = _568;
                if (!_506)
                {
                    float _570 = _370 * _426;
                    float _572 = _378 * _426;
                    float _574 = _382 * _426;
                    float _576 = fma(_424, _390, _570);
                    float _578 = fma(_424, _386, _572);
                    float _580 = fma(_424, _392, _574);
                    float _582 = fma(_428, _398, _576);
                    float _584 = fma(_428, _394, _578);
                    float _586 = fma(_428, _412, _580);
                    float _588 = _582 * _582;
                    float _590 = fma(_584, _584, _588);
                    float _592 = fma(_586, _586, _590);
                    float _594 = rsqrt(_592);
                    float _596 = _594 * 9.9999999747524270787835121154785e-07;
                    float _598 = _584 * _596;
                    float _600 = _582 * _596;
                    float _602 = _586 * _596;
                    _454 = _600;
                    _448 = _598;
                    _466 = _602;
                    _506 = true;
                }
            }
            else
            {
                float _604 = _370 * _154;
                float _606 = _378 * _154;
                float _608 = _382 * _154;
                float _610 = fma(_152, _390, _604);
                float _612 = fma(_152, _386, _606);
                float _614 = fma(_152, _392, _608);
                float _616 = fma(_156, _398, _610);
                float _618 = fma(_156, _394, _612);
                float _620 = fma(_156, _412, _614);
                float _622 = _616 * _616;
                float _624 = fma(_618, _618, _622);
                float _626 = fma(_620, _620, _624);
                float _628 = rsqrt(_626);
                float _630 = _628 * 9.9999999747524270787835121154785e-07;
                float _632 = _618 * _630;
                float _634 = _616 * _630;
                float _636 = _620 * _630;
                _454 = _634;
                _448 = _632;
                _466 = _636;
            }
        }
    }
    _506 = false;
    float _638 = _454;
    float _640 = _448;
    float _642 = _466;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _646 = !_644;
    float _664;
    if (!_646)
    {
        float _648 = in.m_41.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[12].x, _94);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        _664 = _144;
    }
    _666 = false;
    float _668 = _664;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _672 = _668 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _676 = _668 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _692 = _668 + _690;
    float _694 = 1.0 / _680;
    bool _696 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _698 = isnan(_668);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _710 = isnan(_668);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = 1.0 / _684;
    bool _722 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _724 = 1.0 / _688;
    float _726 = _676 * _694;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _728;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _732;
    float _736 = fma(_734, _726, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _738 = _672 * _720;
    bool _740 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _742 = isnan(_668);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _752;
    float _756 = fma(_730, _726, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _766 = -_750;
    float _768 = _766 + 1.0;
    float _770 = _692 * _724;
    float _772 = fma(_754, _726, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _774 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _776 = isnan(_668);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = _706 * _768;
    float _788 = -_706;
    float _790 = _788 + 1.0;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _796 = fma(_764, _738, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _798 = -_784;
    float _800 = _798 + 1.0;
    float _802 = _784 * _790;
    float _804 = fma(_794, _738, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _806 = fma(_760, _738, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _808 = _718 * _800;
    float _810 = in.m_51.x;
    float _812 = in.m_51.y;
    float _814 = in.m_51.z;
    float _816 = _756 * _808;
    float _818 = _736 * _808;
    float _820 = _772 * _808;
    float _822 = -_718;
    float _824 = _822 + 1.0;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _834;
    float _838 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _816);
    float _840 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _818);
    float _842 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _820);
    float _844 = fma(_828, _770, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _846 = fma(_832, _770, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _848 = fma(_836, _770, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _850 = fma(_804, _802, _838);
    float _852 = fma(_806, _802, _840);
    float _854 = fma(_796, _802, _842);
    float _856 = fma(_844, _786, _850);
    float _858 = fma(_846, _786, _852);
    float _860 = fma(_848, _786, _854);
    float _862 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].x, _856);
    float _864 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].y, _858);
    float _866 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[146].z, _860);
    float _868 = _862 * _810;
    float _870 = _864 * _812;
    float _872 = _866 * _814;
    bool _874 = !_722;
    float _892;
    if (!_874)
    {
        float _876 = in.m_41.x;
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _880 = _876 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[11].y, _94);
        float _884 = _882 * _878;
        float _886 = floor(_884);
        float _888 = -_886;
        float _890 = _884 + _888;
        _892 = _890;
        _894 = true;
    }
    else
    {
        _892 = _144;
    }
    _894 = false;
    float _896 = _892;
    float _898 = in.m_45.w;
    float _900 = _460 * _378;
    float _902 = _460 * _370;
    float _904 = _460 * _382;
    float _906 = in.m_47.w;
    float _908 = fma(_458, _390, _902);
    float _910 = in.m_49.w;
    float _912 = fma(_458, _392, _904);
    float _914 = fma(_458, _386, _900);
    float _916 = fma(_462, _398, _908);
    float _918 = in.m_53.x;
    float _920 = in.m_53.y;
    float _922 = in.m_53.z;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    float _928 = fma(_462, _394, _914);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _932 = _930 != 0;
    float _934 = fma(_462, _412, _912);
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _938 = _936 != 0;
    float _940 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _948 = _946 != 0;
    float _950 = in.m_41.x;
    float _952 = in.m_41.y;
    float _954 = _916 + _898;
    float _956 = fma(_130, 0.39999997615814208984375, 0.60000002384185791015625);
    float _958 = _928 + _906;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _962 = _954 + _960;
    float _964 = _934 + _910;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _968 = _958 + _966;
    bool _970 = _130 > 0.5;
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    float _974 = _962 * _962;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _918);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _980 = _964 + _978;
    float _982 = -_130;
    float _984 = fma(_982, 0.25, 1.0);
    float _986 = fma(_968, _968, _974);
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _922);
    float _990 = fma(_980, _980, _986);
    float _992 = _638 * _638;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _996 = rsqrt(_990);
    float _998 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1000 = _950 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1002 = fma(_640, _640, _992);
    float _1004 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _998);
    float _1006 = -_994;
    float _1008 = fma(_1000, 2.0, _1006);
    float _1010 = fma(_642, _642, _1002);
    float _1012 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = rsqrt(_1010);
    float _1018 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1012);
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1022 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1004);
    float _1024 = _1020 * _996;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1018);
    float _1028 = _962 * _1024;
    float _1030 = _968 * _1024;
    float _1032 = _980 * _1024;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1038 = -_1028;
    float _1040 = _962 + _1038;
    float _1042 = -_1030;
    float _1044 = _968 + _1042;
    float _1046 = _1016 * _642;
    float _1048 = _1040 * _1040;
    float _1050 = _1016 * _640;
    float _1052 = fma(_952, 2.0, -1.0);
    float _1054 = fma(2.0, _950, -1.0);
    float _1056 = fma(_1044, _1044, _1048);
    float _1058 = _1016 * _638;
    float _1060 = _1052 * _1052;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1064 = _1046 * _1062;
    float _1066 = fma(_126, 2.0, -1.0);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = _1058 * _1068;
    float _1072 = fma(_1054, _1054, _1060);
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1076 = -_1064;
    float _1078 = fma(_1050, _1074, _1076);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1082 = _1050 * _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1086 = -_1070;
    float _1088 = fma(_1046, _1084, _1086);
    float _1090 = fma(_1066, _1066, _1072);
    float _1092 = _1078 * _1078;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1096 = -_1082;
    float _1098 = fma(_1058, _1094, _1096);
    float _1100 = -_1032;
    float _1102 = _980 + _1100;
    float _1104 = fma(_1088, _1088, _1092);
    float _1106 = rsqrt(_1090);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1110 = fma(_1098, _1098, _1104);
    float _1112 = fma(_1102, _1102, _1056);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1118 = in.m_55.x;
    float _1120 = in.m_55.y;
    float _1122 = 1.0 / _1036;
    float _1124 = _952 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1126 = _950 > 0.5;
    float _1128 = fma(_1124, -2.0, _1108);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1130;
    float _1134 = sqrt(_1026);
    float _1136 = rsqrt(_1110);
    float _1138 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1140 = fma(_144, -0.5, 1.0);
    float _1142 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1144 = _1106 * _1140;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1150 = sqrt(_1112);
    float _1152 = _1132 * _1122;
    float _1154 = _1052 * _1144;
    float _1156 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1142);
    float _1158 = fma(_1154, _1134, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1160 = 1.0 / _1116;
    float _1162 = _1078 * _1136;
    float _1164 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1166 = _1098 * _1136;
    float _1168 = in.m_57.x;
    float _1170 = _1088 * _1136;
    float _1172 = _1164 * _1120;
    float _1174 = sqrt(_1022);
    float _1176 = _996 * _1150;
    float _1178 = _1014 * _1176;
    float _1180 = _1164 * _1176;
    float _1182 = _940 * _1176;
    float _1184 = _1148 * _1160;
    float _1186 = _1066 * _1144;
    float _1188 = _952 * 78.233001708984375;
    float _1190 = _1178 * _976;
    float _1192 = _144 * _956;
    float _1194 = _1058 * _1166;
    float _1196 = _1054 * _1144;
    float _1198 = fma(_950, 12.98980045318603515625, _1188);
    float _1200 = _1180 * _972;
    float _1202 = _1182 * _988;
    float _1204 = -_1194;
    float _1206 = fma(_1046, _1162, _1204);
    float _1208 = fma(_1196, _1174, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1210 = _1198 * 0.15915493667125701904296875;
    float _1212 = _1050 * _1162;
    float _1214 = _1200 * _1050;
    float _1216 = _1046 * _1170;
    float _1218 = _1200 * _1058;
    float _1220 = _1200 * _1046;
    float _1222 = -_1212;
    float _1224 = fma(_1058, _1170, _1222);
    float _1226 = fma(_1190, _1170, _1214);
    float _1228 = -_1216;
    float _1230 = fma(_1050, _1166, _1228);
    float _1232 = fma(_1190, _1162, _1218);
    float _1234 = fma(_1190, _1166, _1220);
    float _1236 = fma(_1202, _1206, _1226);
    float _1238 = sqrt(_1156);
    float _1240 = fma(_1202, _1230, _1232);
    float _1242 = fma(_1202, _1224, _1234);
    float _1244 = fma(_1192, -0.5, 0.5);
    float _1246 = _958 + _1236;
    float _1248 = _954 + _1240;
    float _1250 = _964 + _1242;
    float _1252 = -_1244;
    float _1254 = fma(_1252, _1168, 1.0);
    float _1256 = -_1246;
    float _1258 = _1256 + _1208;
    float _1260 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1262 = _1248 + _1260;
    float _1264 = _1210 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = -_1248;
    float _1270 = _1268 + _1158;
    float _1272 = fma(_1254, _1258, _1246);
    float _1274 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1276 = _1246 + _1274;
    float _1278 = _1262 * _1262;
    float _1280 = fma(_1254, _1270, _1248);
    float _1282 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1284 = _1250 + _1282;
    float _1286 = fma(_1186, _1238, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1288 = fma(_1276, _1276, _1278);
    float _1290 = -_1280;
    float _1292 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1294 = -_1272;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1298 = -_1250;
    float _1300 = _1298 + _1286;
    float _1302 = fma(_1284, _1284, _1288);
    float _1304 = _1292 * _1292;
    float _1306 = fma(_1254, _1300, _1250);
    float _1308 = _1266 * 43758.546875;
    float _1310 = fma(_1296, _1296, _1304);
    float _1312 = rsqrt(_1302);
    float _1314 = -_1306;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1318 = _1168 * 4.0;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1322 = _1300;
    float _1324 = _1118;
    float _1326 = _1172;
    if (!_948)
    {
        _1322 = _952;
    }
    float _1328 = _1322;
    float _1330 = fma(_1316, _1316, _1310);
    float _1332 = fma(_144, 2.0, -1.0);
    float _1334 = fma(_94, 0.1500000059604644775390625, _1318);
    float _1336 = floor(_1308);
    float _1338 = _144 * 32.0;
    float _1340 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1320);
    float _1342 = _1328;
    float _1344 = _1338;
    if (_948)
    {
        _1342 = _950;
    }
    float _1346 = _1342;
    float _1348 = fma(_950, 6.283185482025146484375, _1334);
    float _1350 = -_1118;
    float _1352 = _1350 + 1.0;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1356 = sqrt(_1330);
    float _1358 = _1262 * _1312;
    float _1360 = _1276 * _1312;
    float _1362 = _1284 * _1312;
    float _1364 = fma(_94, 0.20000000298023223876953125, _1318);
    float _1366 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1354);
    float _1368 = abs(_1332);
    float _1370 = -_1368;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1340);
    float _1376 = -_1336;
    float _1378 = _1308 + _1376;
    float _1380 = _1358 * _1358;
    float _1382 = fma(_952, 6.283185482025146484375, _1364);
    float _1384 = fma(_126, 6.283185482025146484375, _1364);
    float _1386 = _1378 * 6.283185482025146484375;
    float _1388 = fma(_1360, _1360, _1380);
    int _1390 = _1126 ? as_type<int>(_1352) : as_type<int>(_1118);
    float _1392 = _1384 * 0.15915493667125701904296875;
    float _1394 = fma(_1338, _1168, _1386);
    float _1396 = fma(_1362, _1362, _1388);
    float _1398 = precise::max(_1356, 1.5);
    float _1400 = _1382 * 0.15915493667125701904296875;
    float _1402 = _1394 * 0.15915493667125701904296875;
    float _1404 = rsqrt(_1396);
    float _1406 = _1388;
    if (!_948)
    {
        _1344 = _126;
    }
    float _1408 = _1344;
    float _1410 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1366);
    float _1412 = _1408;
    if (!_948)
    {
        _1406 = _126;
    }
    float _1414 = _1406;
    float _1416 = precise::min(_1398, 2.5);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1420 = _896 + _1418;
    bool _1422 = _952 > 0.5;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1426 = _896 + _1424;
    float _1428 = _1414;
    if (_948)
    {
        _1412 = _952;
    }
    float _1430 = _1412;
    float _1432 = _1416 + (-1.5);
    if (_948)
    {
        _1428 = _952;
    }
    float _1434 = _1428;
    float _1436 = fma(_1152, _1426, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = fma(_1240, _1432, _954);
    float _1444 = fma(_1184, _1420, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1446 = fma(_1236, _1432, _958);
    float _1448 = fma(_1242, _1432, _964);
    float _1450 = -_1442;
    float _1452 = _1158 + _1450;
    float _1454 = _1360 * _1404;
    float _1456 = -_1446;
    float _1458 = _1208 + _1456;
    float _1460 = _1402 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1358 * _1404;
    bool _1466 = _126 > 0.5;
    float _1468 = fma(_1254, _1452, _1442);
    float _1470 = -_958;
    float _1472 = _1470 + _1208;
    float _1474 = _1362 * _1404;
    float _1476 = -_954;
    float _1478 = _1476 + _1158;
    float _1480 = fma(_1254, _1458, _1446);
    float _1482 = -_1440;
    float _1484 = _1482 + 1.0;
    float _1486 = -_964;
    float _1488 = _1486 + _1286;
    float _1490 = fma(_1254, _1472, _958);
    float _1492 = -_1448;
    float _1494 = _1286 + _1492;
    float _1496 = _1454 * _1484;
    float _1498 = fma(_1254, _1478, _954);
    float _1500 = fma(_1254, _1488, _964);
    float _1502 = fma(_1254, _1494, _1448);
    float _1504 = _1474 * _1462;
    float _1506 = -_1498;
    float _1508 = _1468 + _1506;
    float _1510 = fma(_1454, _1496, _1440);
    float _1512 = -_1490;
    float _1514 = _1480 + _1512;
    float _1516 = -_1504;
    float _1518 = fma(_1464, _1496, _1516);
    float _1520 = _1454 * _1462;
    float _1522 = _1464 * _1484;
    float _1524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1526 = _1518 * _1508;
    float _1528 = _1474 * _1474;
    float _1530 = fma(_1474, _1522, _1520);
    float _1532 = -_1500;
    float _1534 = _1502 + _1532;
    float _1536 = fma(_1510, _1514, _1526);
    float _1538 = _1464 * _1462;
    float _1540 = _1530 * _1508;
    float _1542 = _1392 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = fma(_1484, _1528, _1440);
    float _1548 = -_1538;
    float _1550 = fma(_1474, _1496, _1548);
    float _1552 = fma(_1474, _1496, _1538);
    float _1554 = _926 ? as_type<float>(_1390) : _1118;
    float _1556 = -_1520;
    float _1558 = fma(_1474, _1522, _1556);
    float _1560 = fma(_1550, _1514, _1540);
    float _1562 = fma(_1552, _1534, _1536);
    float _1564 = _1400 * 6.283185482025146484375;
    float _1566 = sin(_1564);
    float _1568 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1570 = _1372 * _1168;
    float _1572 = fma(_1546, _1534, _1560);
    float _1574 = _1490 + _1562;
    float _1576 = fma(_1554, _1568, -0.5);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1580 = _1500 + _1572;
    float _1582 = _984 * _1570;
    float _1584 = _1544 * _1570;
    float _1586 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1578);
    bool _1588 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1590 = isnan(_896);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_94;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1008);
    float _1604 = fma(_1584, _984, _1580);
    float _1606 = -_1172;
    float _1608 = _1606 + 1.0;
    float _1610 = fma(_1566, _1582, _1574);
    bool _1612 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1614 = isnan(_896);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = -_1598;
    float _1626 = _1624 + 1.0;
    bool _1628 = _896 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1630 = isnan(_896);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1642 = _1422 ? as_type<int>(_1608) : as_type<int>(_1172);
    float _1644 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1646 = _1604;
    float _1648 = _1610;
    if (_932)
    {
        float _1650 = _1466 ? _1352 : _1118;
        _1324 = _1650;
    }
    float _1652 = _1324;
    float _1654 = _1638 * _1626;
    float _1656 = -_1638;
    float _1658 = _1656 + 1.0;
    float _1660 = fma(_1374, _1576, _1602);
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1664 = _1610 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1668 = _1604 + _1666;
    float _1670 = _1622 * _1658;
    bool _1672 = !_938;
    float _1674 = _1672 ? _1172 : as_type<float>(_1642);
    float _1676 = _1664 * _1664;
    float _1678 = _1668 * _1668;
    float _1680 = _1436 * _1670;
    float _1682 = _1676;
    float _1684 = _1678;
    if (_944)
    {
        float _1686 = _970 ? _1608 : _1172;
        _1326 = _1686;
    }
    float _1688 = _1326;
    float _1690 = fma(_1464, _1496, _1504);
    float _1692 = _1676 + _1678;
    float _1694 = _1348 * 0.15915493667125701904296875;
    float _1696 = fma(_1464, _1522, _1440);
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1700 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1702 = _1696 * _1508;
    float _1704 = -_1622;
    float _1706 = _1704 + 1.0;
    float _1708 = fma(_1690, _1514, _1702);
    float _1710 = sqrt(_1692);
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1716 = fma(_1558, _1534, _1708);
    float _1718 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1128);
    float _1720 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1712);
    float _1722 = fma(_1674, _1700, -0.5);
    float _1724 = _1498 + _1716;
    float _1726 = _1694 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1734 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1736 = -_1718;
    float _1738 = fma(_1410, _1722, _1736);
    float _1740 = fma(_1730, _1652, -0.5);
    float _1742 = fma(_1644, -2.0, _1732);
    float _1744 = -_1714;
    float _1746 = fma(_1734, 2.0, _1744);
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1750 = _1710 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1752 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1680);
    float _1754 = fma(_1728, _1582, _1724);
    float _1756 = _1716;
    if (!_1750)
    {
        _1756 = _1754;
    }
    float _1758 = _1756;
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1762 = fma(_1688, _1760, -0.5);
    bool _1764 = !_1750;
    float _1766 = _1758;
    if (!_1764)
    {
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1772 = _1710 + _1770;
        float _1774 = rsqrt(_1692);
        float _1776 = _1772 * _1768;
        float _1778 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = _1776 * 0.15915493667125701904296875;
        float _1782 = _1780 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = _1780 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = fma(_1784, _1778, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1792 = _1774 * _1790;
        float _1794 = fma(_1664, _1792, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1796 = _1788 + (-1.0);
        float _1798 = fma(_1668, _1792, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1802 = _1794 + _1800;
        float _1804 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1808 = _1798 + _1806;
        float _1810 = _1802 * _1802;
        float _1812 = fma(_1754, _1788, _1804);
        float _1814 = _1808 * _1808;
        _1766 = _1812;
        _1682 = _1810;
        _1684 = _1814;
        _1646 = _1798;
        _1648 = _1794;
    }
    float _1816 = _1766;
    float _1818 = _1682;
    float _1820 = _1684;
    float _1822 = _1646;
    float _1824 = _1648;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1828 = _1816 + _1826;
    float _1830 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1586);
    float _1832 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1742);
    float _1834 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1720);
    float _1836 = fma(_1828, _1828, _1818);
    float _1838 = -_94;
    float _1840 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1746);
    float _1842 = in.m_57.z;
    float _1844 = fma(_1444, _1654, _1752);
    float _1846 = _1836 + _1820;
    float _1848 = -_1832;
    float _1850 = fma(_1830, _1762, _1848);
    float _1852 = fma(_1834, _1740, _1840);
    float _1854 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1844);
    float _1856 = _1660 + 0.5;
    float _1858 = sqrt(_1846);
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1868 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1872 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1876 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1878 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1882 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1884 = _1738 + 0.5;
    float _1886 = _1852 + 0.5;
    float _1888 = _1850 + 0.5;
    float _1890 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1168;
    bool _1892 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1894 = isnan(_1858);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1900 = _1896 || _1898;
    out.m_59.z = _1842;
    out.m_61.x = _1878;
    out.m_61.y = _1880;
    out.m_61.z = _1882;
    out.m_63.x = _1856;
    out.m_63.y = _1884;
    out.m_63.z = _1886;
    out.m_63.w = _1888;
    if (!_1900)
    {
        _104 = 1.0;
    }
    float _1902 = _104;
    out.m_65.x = _1868;
    out.m_65.y = _1872;
    out.m_65.z = _1876;
    out.m_65.w = _1890;
    bool _1904 = !_1900;
    float _1906 = _1902;
    if (!_1904)
    {
        bool _1908 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1910 = isnan(_1858);
        bool _1912 = _1908 || _1910;
        bool _1914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1916 = _1912 || _1914;
        if (!_1916)
        {
            float _1918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1920 = _1858 + _1918;
            float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1924 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1922;
            float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1928 = _1926 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1930 = 1.0 / _1924;
            float _1932 = _1920 * _1930;
            float _1934 = fma(_1932, _1928, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1906 = _1934;
            _1936 = true;
        }
        else
        {
            bool _1938 = _1858 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1940 = isnan(_1858);
            bool _1942 = _1938 || _1940;
            bool _1944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1946 = _1942 || _1944;
            if (!_1946)
            {
                float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1950 = _1858 + _1948;
                float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1954 = _1952 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1956 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1958 = _1956 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1960 = 1.0 / _1954;
                float _1962 = _1950 * _1960;
                float _1964 = fma(_1962, _1958, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1906 = _1964;
                _1936 = true;
            }
            else
            {
                _1906 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1936 = false;
    float _1966 = _1906;
    float _1968 = -_1028;
    float _1970 = _954 + _1968;
    float _1972 = -_1030;
    float _1974 = _958 + _1972;
    float _1976 = -_1032;
    float _1978 = _964 + _1976;
    float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1982 = _1816 + _1980;
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1988 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1990 = _1822 + _1988;
    float _1992 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1984);
    float _1994 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1986);
    float _1996 = fma(_1982, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1998 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1992);
    float _2000 = fma(_1978, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1994);
    float _2002 = -_1028;
    float _2004 = _2002 + _1996;
    bool _2006 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    float _2016 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2020 = _1824 + _2018;
    float _2022 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2024 = 1.0 / _2016;
    float _2026 = fma(_2020, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2028 = fma(_1990, _1966, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2030 = _2022 + _2016;
    float _2032 = -_1030;
    float _2034 = _2032 + _2026;
    float _2036 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = -_1032;
    float _2040 = _2038 + _2028;
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2044 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2042);
    float _2050 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2052 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2054 = _2030 * _2024;
    float _2056 = _2054 * 0.5;
    float _2058 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2050);
    float _2060 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2062 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2064 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2048);
    float _2066 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2068 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2074 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2076 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2062);
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2068);
    float _2080 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2082 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2072);
    float _2084 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2074);
    float _2086 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2088 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2090 = _2066;
    if (_2014)
    {
        _2090 = 1.0;
    }
    float _2092 = _2090;
    float _2094 = _2092;
    if (!_2014)
    {
        float _2096 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2100 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2098);
        float _2102 = _2096 * 0.15915493667125701904296875;
        float _2104 = _2102 * 6.283185482025146484375;
        float _2106 = cos(_2104);
        float _2108 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = _2102 * 6.283185482025146484375;
        float _2114 = sin(_2112);
        float _2116 = 1.0 / _2106;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2114 * _2116;
        float _2124 = 1.0 / _2100;
        float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2128 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2126;
        float _2130 = _2120 * _2122;
        float _2132 = _2110 * 6.283185482025146484375;
        float _2134 = sin(_2132);
        float _2136 = 1.0 / _2130;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2140 = _2124 * _2138;
        float _2142 = 1.0 / _2128;
        float _2144 = _2134 * _2136;
        float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2148 = fma(_2144, _2140, _2146);
        float _2150 = _2148 * _2142;
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = -_2152;
        float _2156 = _2154 + 1.0;
        _2094 = _2156;
    }
    float _2158 = _2094;
    float _2160 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2162 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2080);
    float _2164 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2078);
    float _2166 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2082);
    float _2168 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2084);
    bool _2170 = _2158 > 0.0;
    bool _2172 = isnan(_2158);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2182 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2162);
    float _2184 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2164);
    float _2186 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2168);
    float _2188 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2166);
    float _2190 = _2180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2192 = _2184 + _2186;
    float _2194 = _2188 + _2186;
    float _2196 = _2186 * 0.5;
    float _2198 = _2192 * 0.5;
    float _2200 = _2194 * 0.5;
    float _2202 = fma(_2182, -0.5, _2196);
    out.m_67.x = _2034;
    out.m_67.y = _2004;
    out.m_67.z = _2040;
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2182;
    out.gl_Position.z = _2188;
    out.gl_Position.w = _2186;
    out.m_39.x = _2190;
    out.m_69.x = _2198;
    out.m_69.y = _2202;
    out.m_69.z = _2200;
    out.m_69.w = _2186;
    if (_2178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_39.x = 0.0;
    float _2204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2204;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

