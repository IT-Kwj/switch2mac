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
    float4 m_45 [[user(locn0)]];
    float4 m_35 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _594 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_32.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_35.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _846 = as_type<float>(_84);
        out.gl_Position.z = _846;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_37.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _76 = _104;
    }
    float _106 = _76;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_35.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _915 = as_type<float>(_120);
        out.gl_Position.z = _915;
    }
    if (_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_39.x;
    float _124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _126 = _102 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = _126 * _124;
    float _142 = 0.0;
    float _144 = _128;
    if (!_138)
    {
        float _146 = _128 * _128;
        float _148 = _146 * 0.5;
        _142 = _148;
    }
    float _150 = _142;
    float _152 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[20].x, _140);
    float _154 = in.m_41.x;
    float _156 = in.m_41.y;
    float _158 = in.m_41.z;
    float _160 = _150;
    if (!_138)
    {
        float _162 = _150 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    float _166 = _152 * 6.283185482025146484375;
    float _168 = floor(_152);
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _166 * 0.15915493667125701904296875;
    float _176 = _174 * 6.283185482025146484375;
    float _178 = cos(_176);
    bool _180 = !_138;
    float _182 = _164;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _128 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _128);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_138;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _128 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _144 = _236;
    }
    float _238 = _144;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _246 = _244 != 0;
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _250 = -_168;
    float _252 = _152 + _250;
    float _254 = fma(_178, 0.5, 0.5);
    float _256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    bool _258 = !_242;
    int _260 = _258 ? 0 : 1;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _264 = in.m_37.x;
    float _266 = in.m_37.y;
    float _268 = in.m_37.z;
    bool _270 = !_172;
    int _272 = _270 ? 0 : 1;
    int _274 = abs(_260);
    float _276 = in.m_43.x;
    float _278 = in.m_43.y;
    float _280 = in.m_43.z;
    float _282 = in.m_43.w;
    bool _284 = _252 < 0.5;
    float _286 = float(_284);
    float _288 = float(_274);
    float _290 = -_252;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_272);
    float _296 = -_286;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _300 = in.m_32.x;
    float _302 = in.m_32.y;
    float _304 = in.m_32.z;
    bool _306 = !_246;
    int _308 = _306 ? 0 : 1;
    float _310 = abs(_292);
    float _312 = _288 * _310;
    float _314 = float(_294);
    float _316 = -_254;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = abs(_308);
    float _322 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _324 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = fma(_314, _318, _312);
    float _328 = float(_320);
    float _330 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = fma(_238, _264, _322);
    float _334 = fma(_238, _266, _324);
    float _336 = abs(_298);
    float _338 = fma(_328, _336, _326);
    float _340 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = _280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = fma(_238, _268, _330);
    float _348 = _338 * _340;
    float _350 = _338 * _342;
    float _352 = _338 * _344;
    float _354 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _356 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _358 = fma(_334, _282, _302);
    float _360 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _362 = _354 * _256;
    float _364 = _356 * _248;
    float _366 = fma(_332, _282, _300);
    float _368 = _360 * _262;
    float _370 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _372 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _374 = _362 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _376 = _362 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _378 = fma(_346, _282, _304);
    float _380 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _370);
    float _382 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _384 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _374);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _376);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _392 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _384);
    float _394 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _386);
    float _396 = _388 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _398 = _390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = _392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _402 = _394 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _404 = _362 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _406 = _396 + _400;
    float _408 = _398 + _402;
    float _410 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _412 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _404);
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _406 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _420 = _408 + _418;
    float _422 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _410);
    float _424 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _412);
    float _426 = _416 * _416;
    float _428 = _420 * _420;
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
    float _432 = _424 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _434 = _426 + _428;
    float _436 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = sqrt(_434);
    float _440 = _436 + _432;
    bool _442 = _438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _444 = _410;
    float _446 = _432;
    float _448 = _428;
    float _450 = _406;
    float _452 = _408;
    if (!_442)
    {
        _444 = _426;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_442)
    {
        _446 = _440;
    }
    float _458 = _446;
    bool _460 = !_442;
    float _462 = _458;
    if (!_460)
    {
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _468 = _438 + _466;
        float _470 = rsqrt(_434);
        float _472 = _468 * _464;
        float _474 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _476 = _472 * 0.15915493667125701904296875;
        float _478 = _476 * 6.283185482025146484375;
        float _480 = sin(_478);
        float _482 = _476 * 6.283185482025146484375;
        float _484 = cos(_482);
        float _486 = fma(_480, _474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _488 = _470 * _486;
        float _490 = _484 + (-1.0);
        float _492 = fma(_416, _488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _494 = fma(_420, _488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _496 = _490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _500 = _492 + _498;
        float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _504 = _494 + _502;
        float _506 = fma(_440, _484, _496);
        float _508 = _500 * _500;
        float _510 = _504 * _504;
        _462 = _506;
        _456 = _508;
        _448 = _510;
        _450 = _492;
        _452 = _494;
    }
    float _512 = _462;
    float _514 = _456;
    float _516 = _448;
    float _518 = _450;
    float _520 = _452;
    float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _524 = _512 + _522;
    float _526 = fma(_524, _524, _514);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = _526 + _516;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = sqrt(_530);
    float _542 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _536;
    out.m_45.y = _542;
    out.m_45.z = _544;
    out.m_45.w = _538;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _546 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _548 = isnan(_540);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _554 = _550 || _552;
    float _556 = _532;
    float _558 = 1.0;
    if (!_554)
    {
        _556 = 1.0;
    }
    float _560 = _556;
    bool _562 = !_554;
    float _564 = _560;
    if (!_562)
    {
        bool _566 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _568 = isnan(_540);
        bool _570 = _566 || _568;
        bool _572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _574 = _570 || _572;
        if (!_574)
        {
            float _576 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _578 = _540 + _576;
            float _580 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _582 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _580;
            float _584 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _586 = _584 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _588 = 1.0 / _582;
            float _590 = _578 * _588;
            float _592 = fma(_590, _586, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _564 = _592;
            _558 = _588;
            _594 = true;
        }
        else
        {
            bool _596 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _598 = isnan(_540);
            bool _600 = _596 || _598;
            bool _602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _604 = _600 || _602;
            if (!_604)
            {
                float _606 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _608 = _540 + _606;
                float _610 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _612 = _610 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _614 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _616 = _614 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _618 = 1.0 / _612;
                float _620 = _608 * _618;
                float _622 = fma(_620, _616, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _564 = _622;
                _558 = _618;
                _594 = true;
            }
            else
            {
                _564 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _594 = false;
    float _624 = _564;
    float _626 = _558;
    float _628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _630 = _518 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _634 = _520 + _632;
    bool _636 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _638 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _640 = _636 || _638;
    bool _642 = isnan(0.5);
    bool _644 = _640 || _642;
    float _646 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _648 = _512 + _646;
    float _650 = fma(_630, _624, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _652 = fma(_634, _624, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _654 = fma(_648, _624, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _656 = _624;
    float _658 = _626;
    float _660 = _648;
    if (_644)
    {
        _656 = _650;
    }
    float _662 = _656;
    float _664 = _662;
    if (_644)
    {
        _658 = _654;
    }
    float _666 = _658;
    float _668 = _666;
    if (_644)
    {
        _660 = _652;
    }
    float _670 = _660;
    float _672 = _670;
    if (!_644)
    {
        float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _676 = _436 + _674;
        float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _680 = _396 + _678;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _684 = _676 * _676;
        float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _688 = _398 + _686;
        float _690 = fma(_680, _680, _684);
        float _692 = -_396;
        float _694 = _692 + _650;
        float _696 = fma(_688, _688, _690);
        float _698 = -_436;
        float _700 = _698 + _654;
        float _702 = sqrt(_696);
        float _704 = precise::min(_702, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _706 = _704 * _682;
        float _708 = -_398;
        float _710 = _708 + _652;
        float _712 = fma(_694, _706, _396);
        float _714 = fma(_700, _706, _436);
        float _716 = fma(_710, _706, _398);
        _668 = _714;
        _664 = _712;
        _672 = _716;
    }
    float _718 = _668;
    float _720 = _664;
    float _722 = _672;
    float _724 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _726 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _728 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_35.x = 1.0;
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[1].x, _724);
    float _732 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[0].x, _726);
    float _736 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[2].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].z, _730);
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[3].x, _732);
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].z, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].z, _736);
    float _746 = _738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _748 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].z, _740);
    float _750 = _742 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = _746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _756 = _746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _758 = _746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _760 = _746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[4].x, _754);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[5].x, _756);
    float _766 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[6].x, _758);
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[7].x, _760);
    float _770 = _748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _772 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _762);
    float _774 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _764);
    float _776 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _766);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _780 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _772);
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _774);
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _776);
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _778);
    out.m_49.w = _780;
    out.gl_Position.x = _782;
    out.gl_Position.y = _784;
    out.gl_Position.z = _786;
    out.gl_Position.w = _788;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _594 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_32.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_35.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _846 = as_type<float>(_84);
        out.gl_Position.z = _846;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_37.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _76 = _104;
    }
    float _106 = _76;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_35.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _915 = as_type<float>(_120);
        out.gl_Position.z = _915;
    }
    if (_112)
    {
        return out;
    }
    float _122 = in.m_39.x;
    float _124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _126 = _102 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = _126 * _124;
    float _142 = 0.0;
    float _144 = _128;
    if (!_138)
    {
        float _146 = _128 * _128;
        float _148 = _146 * 0.5;
        _142 = _148;
    }
    float _150 = _142;
    float _152 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[20].x, _140);
    float _154 = in.m_41.x;
    float _156 = in.m_41.y;
    float _158 = in.m_41.z;
    float _160 = _150;
    if (!_138)
    {
        float _162 = _150 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    float _166 = _152 * 6.283185482025146484375;
    float _168 = floor(_152);
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _166 * 0.15915493667125701904296875;
    float _176 = _174 * 6.283185482025146484375;
    float _178 = cos(_176);
    bool _180 = !_138;
    float _182 = _164;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _128 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _128);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_138;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _128 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _144 = _236;
    }
    float _238 = _144;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _246 = _244 != 0;
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _250 = -_168;
    float _252 = _152 + _250;
    float _254 = fma(_178, 0.5, 0.5);
    float _256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    bool _258 = !_242;
    int _260 = _258 ? 0 : 1;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _264 = in.m_37.x;
    float _266 = in.m_37.y;
    float _268 = in.m_37.z;
    bool _270 = !_172;
    int _272 = _270 ? 0 : 1;
    int _274 = abs(_260);
    float _276 = in.m_43.x;
    float _278 = in.m_43.y;
    float _280 = in.m_43.z;
    float _282 = in.m_43.w;
    bool _284 = _252 < 0.5;
    float _286 = float(_284);
    float _288 = float(_274);
    float _290 = -_252;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_272);
    float _296 = -_286;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _300 = in.m_32.x;
    float _302 = in.m_32.y;
    float _304 = in.m_32.z;
    bool _306 = !_246;
    int _308 = _306 ? 0 : 1;
    float _310 = abs(_292);
    float _312 = _288 * _310;
    float _314 = float(_294);
    float _316 = -_254;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = abs(_308);
    float _322 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _324 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = fma(_314, _318, _312);
    float _328 = float(_320);
    float _330 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = fma(_238, _264, _322);
    float _334 = fma(_238, _266, _324);
    float _336 = abs(_298);
    float _338 = fma(_328, _336, _326);
    float _340 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = _280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = fma(_238, _268, _330);
    float _348 = _338 * _340;
    float _350 = _338 * _342;
    float _352 = _338 * _344;
    float _354 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _356 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _358 = fma(_334, _282, _302);
    float _360 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _362 = _354 * _256;
    float _364 = _356 * _248;
    float _366 = fma(_332, _282, _300);
    float _368 = _360 * _262;
    float _370 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _372 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _374 = _362 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _376 = _362 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _378 = fma(_346, _282, _304);
    float _380 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _370);
    float _382 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _384 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _374);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _376);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _392 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _384);
    float _394 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _386);
    float _396 = _388 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _398 = _390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = _392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _402 = _394 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _404 = _362 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _406 = _396 + _400;
    float _408 = _398 + _402;
    float _410 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _412 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _404);
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _406 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _420 = _408 + _418;
    float _422 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _410);
    float _424 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _412);
    float _426 = _416 * _416;
    float _428 = _420 * _420;
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
    float _432 = _424 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _434 = _426 + _428;
    float _436 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = sqrt(_434);
    float _440 = _436 + _432;
    bool _442 = _438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _444 = _410;
    float _446 = _432;
    float _448 = _428;
    float _450 = _406;
    float _452 = _408;
    if (!_442)
    {
        _444 = _426;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_442)
    {
        _446 = _440;
    }
    float _458 = _446;
    bool _460 = !_442;
    float _462 = _458;
    if (!_460)
    {
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _468 = _438 + _466;
        float _470 = rsqrt(_434);
        float _472 = _468 * _464;
        float _474 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _476 = _472 * 0.15915493667125701904296875;
        float _478 = _476 * 6.283185482025146484375;
        float _480 = sin(_478);
        float _482 = _476 * 6.283185482025146484375;
        float _484 = cos(_482);
        float _486 = fma(_480, _474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _488 = _470 * _486;
        float _490 = _484 + (-1.0);
        float _492 = fma(_416, _488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _494 = fma(_420, _488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _496 = _490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _500 = _492 + _498;
        float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _504 = _494 + _502;
        float _506 = fma(_440, _484, _496);
        float _508 = _500 * _500;
        float _510 = _504 * _504;
        _462 = _506;
        _456 = _508;
        _448 = _510;
        _450 = _492;
        _452 = _494;
    }
    float _512 = _462;
    float _514 = _456;
    float _516 = _448;
    float _518 = _450;
    float _520 = _452;
    float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _524 = _512 + _522;
    float _526 = fma(_524, _524, _514);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = _526 + _516;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = sqrt(_530);
    float _542 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _536;
    out.m_45.y = _542;
    out.m_45.z = _544;
    out.m_45.w = _538;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _546 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _548 = isnan(_540);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _554 = _550 || _552;
    float _556 = _532;
    float _558 = 1.0;
    if (!_554)
    {
        _556 = 1.0;
    }
    float _560 = _556;
    bool _562 = !_554;
    float _564 = _560;
    if (!_562)
    {
        bool _566 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _568 = isnan(_540);
        bool _570 = _566 || _568;
        bool _572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _574 = _570 || _572;
        if (!_574)
        {
            float _576 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _578 = _540 + _576;
            float _580 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _582 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _580;
            float _584 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _586 = _584 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _588 = 1.0 / _582;
            float _590 = _578 * _588;
            float _592 = fma(_590, _586, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _564 = _592;
            _558 = _588;
            _594 = true;
        }
        else
        {
            bool _596 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _598 = isnan(_540);
            bool _600 = _596 || _598;
            bool _602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _604 = _600 || _602;
            if (!_604)
            {
                float _606 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _608 = _540 + _606;
                float _610 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _612 = _610 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _614 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _616 = _614 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _618 = 1.0 / _612;
                float _620 = _608 * _618;
                float _622 = fma(_620, _616, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _564 = _622;
                _558 = _618;
                _594 = true;
            }
            else
            {
                _564 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _594 = false;
    float _624 = _564;
    float _626 = _558;
    float _628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _630 = _518 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _634 = _520 + _632;
    bool _636 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _638 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _640 = _636 || _638;
    bool _642 = isnan(0.5);
    bool _644 = _640 || _642;
    float _646 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _648 = _512 + _646;
    float _650 = fma(_630, _624, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _652 = fma(_634, _624, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _654 = fma(_648, _624, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _656 = _624;
    float _658 = _626;
    float _660 = _648;
    if (_644)
    {
        _656 = _650;
    }
    float _662 = _656;
    float _664 = _662;
    if (_644)
    {
        _658 = _654;
    }
    float _666 = _658;
    float _668 = _666;
    if (_644)
    {
        _660 = _652;
    }
    float _670 = _660;
    float _672 = _670;
    if (!_644)
    {
        float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _676 = _436 + _674;
        float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _680 = _396 + _678;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _684 = _676 * _676;
        float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _688 = _398 + _686;
        float _690 = fma(_680, _680, _684);
        float _692 = -_396;
        float _694 = _692 + _650;
        float _696 = fma(_688, _688, _690);
        float _698 = -_436;
        float _700 = _698 + _654;
        float _702 = sqrt(_696);
        float _704 = precise::min(_702, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _706 = _704 * _682;
        float _708 = -_398;
        float _710 = _708 + _652;
        float _712 = fma(_694, _706, _396);
        float _714 = fma(_700, _706, _436);
        float _716 = fma(_710, _706, _398);
        _668 = _714;
        _664 = _712;
        _672 = _716;
    }
    float _718 = _668;
    float _720 = _664;
    float _722 = _672;
    float _724 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _726 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _728 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_35.x = 1.0;
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[1].x, _724);
    float _732 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[0].x, _726);
    float _736 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[2].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].z, _730);
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[3].x, _732);
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].z, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].z, _736);
    float _746 = _738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _748 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].z, _740);
    float _750 = _742 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = _746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _756 = _746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _758 = _746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _760 = _746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[4].x, _754);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[5].x, _756);
    float _766 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[6].x, _758);
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[7].x, _760);
    float _770 = _748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _772 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _762);
    float _774 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _764);
    float _776 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _766);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _780 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _772);
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _774);
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _776);
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _778);
    out.m_49.w = _780;
    out.gl_Position.x = _782;
    out.gl_Position.y = _784;
    out.gl_Position.z = _786;
    out.gl_Position.w = _788;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _594 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_32.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_35.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _846 = as_type<float>(_84);
        out.gl_Position.z = _846;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_37.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _76 = _104;
    }
    float _106 = _76;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_35.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _915 = as_type<float>(_120);
        out.gl_Position.z = _915;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_39.x;
    float _124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _126 = _102 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = _126 * _124;
    float _142 = 0.0;
    float _144 = _128;
    if (!_138)
    {
        float _146 = _128 * _128;
        float _148 = _146 * 0.5;
        _142 = _148;
    }
    float _150 = _142;
    float _152 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[20].x, _140);
    float _154 = in.m_41.x;
    float _156 = in.m_41.y;
    float _158 = in.m_41.z;
    float _160 = _150;
    if (!_138)
    {
        float _162 = _150 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    float _166 = _152 * 6.283185482025146484375;
    float _168 = floor(_152);
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _166 * 0.15915493667125701904296875;
    float _176 = _174 * 6.283185482025146484375;
    float _178 = cos(_176);
    bool _180 = !_138;
    float _182 = _164;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _128 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _128);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_138;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _128 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _144 = _236;
    }
    float _238 = _144;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _246 = _244 != 0;
    float _248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _250 = -_168;
    float _252 = _152 + _250;
    float _254 = fma(_178, 0.5, 0.5);
    float _256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    bool _258 = !_242;
    int _260 = _258 ? 0 : 1;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _264 = in.m_37.x;
    float _266 = in.m_37.y;
    float _268 = in.m_37.z;
    bool _270 = !_172;
    int _272 = _270 ? 0 : 1;
    int _274 = abs(_260);
    float _276 = in.m_43.x;
    float _278 = in.m_43.y;
    float _280 = in.m_43.z;
    float _282 = in.m_43.w;
    bool _284 = _252 < 0.5;
    float _286 = float(_284);
    float _288 = float(_274);
    float _290 = -_252;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _294 = abs(_272);
    float _296 = -_286;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _300 = in.m_32.x;
    float _302 = in.m_32.y;
    float _304 = in.m_32.z;
    bool _306 = !_246;
    int _308 = _306 ? 0 : 1;
    float _310 = abs(_292);
    float _312 = _288 * _310;
    float _314 = float(_294);
    float _316 = -_254;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = abs(_308);
    float _322 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _324 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _326 = fma(_314, _318, _312);
    float _328 = float(_320);
    float _330 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = fma(_238, _264, _322);
    float _334 = fma(_238, _266, _324);
    float _336 = abs(_298);
    float _338 = fma(_328, _336, _326);
    float _340 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = _280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = fma(_238, _268, _330);
    float _348 = _338 * _340;
    float _350 = _338 * _342;
    float _352 = _338 * _344;
    float _354 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _356 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _358 = fma(_334, _282, _302);
    float _360 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _362 = _354 * _256;
    float _364 = _356 * _248;
    float _366 = fma(_332, _282, _300);
    float _368 = _360 * _262;
    float _370 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _372 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _374 = _362 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _376 = _362 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _378 = fma(_346, _282, _304);
    float _380 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _370);
    float _382 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _384 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _374);
    float _386 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _376);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _392 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _384);
    float _394 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _386);
    float _396 = _388 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _398 = _390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = _392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _402 = _394 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _404 = _362 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _406 = _396 + _400;
    float _408 = _398 + _402;
    float _410 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _412 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _404);
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _406 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _420 = _408 + _418;
    float _422 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _410);
    float _424 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _412);
    float _426 = _416 * _416;
    float _428 = _420 * _420;
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
    float _432 = _424 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _434 = _426 + _428;
    float _436 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = sqrt(_434);
    float _440 = _436 + _432;
    bool _442 = _438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _444 = _410;
    float _446 = _432;
    float _448 = _428;
    float _450 = _406;
    float _452 = _408;
    if (!_442)
    {
        _444 = _426;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_442)
    {
        _446 = _440;
    }
    float _458 = _446;
    bool _460 = !_442;
    float _462 = _458;
    if (!_460)
    {
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _468 = _438 + _466;
        float _470 = rsqrt(_434);
        float _472 = _468 * _464;
        float _474 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _476 = _472 * 0.15915493667125701904296875;
        float _478 = _476 * 6.283185482025146484375;
        float _480 = sin(_478);
        float _482 = _476 * 6.283185482025146484375;
        float _484 = cos(_482);
        float _486 = fma(_480, _474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _488 = _470 * _486;
        float _490 = _484 + (-1.0);
        float _492 = fma(_416, _488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _494 = fma(_420, _488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _496 = _490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _500 = _492 + _498;
        float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _504 = _494 + _502;
        float _506 = fma(_440, _484, _496);
        float _508 = _500 * _500;
        float _510 = _504 * _504;
        _462 = _506;
        _456 = _508;
        _448 = _510;
        _450 = _492;
        _452 = _494;
    }
    float _512 = _462;
    float _514 = _456;
    float _516 = _448;
    float _518 = _450;
    float _520 = _452;
    float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _524 = _512 + _522;
    float _526 = fma(_524, _524, _514);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = _526 + _516;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = sqrt(_530);
    float _542 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _536;
    out.m_45.y = _542;
    out.m_45.z = _544;
    out.m_45.w = _538;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _546 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _548 = isnan(_540);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _554 = _550 || _552;
    float _556 = _532;
    float _558 = 1.0;
    if (!_554)
    {
        _556 = 1.0;
    }
    float _560 = _556;
    bool _562 = !_554;
    float _564 = _560;
    if (!_562)
    {
        bool _566 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _568 = isnan(_540);
        bool _570 = _566 || _568;
        bool _572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _574 = _570 || _572;
        if (!_574)
        {
            float _576 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _578 = _540 + _576;
            float _580 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _582 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _580;
            float _584 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _586 = _584 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _588 = 1.0 / _582;
            float _590 = _578 * _588;
            float _592 = fma(_590, _586, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _564 = _592;
            _558 = _588;
            _594 = true;
        }
        else
        {
            bool _596 = _540 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _598 = isnan(_540);
            bool _600 = _596 || _598;
            bool _602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _604 = _600 || _602;
            if (!_604)
            {
                float _606 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _608 = _540 + _606;
                float _610 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _612 = _610 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _614 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _616 = _614 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _618 = 1.0 / _612;
                float _620 = _608 * _618;
                float _622 = fma(_620, _616, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _564 = _622;
                _558 = _618;
                _594 = true;
            }
            else
            {
                _564 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _594 = false;
    float _624 = _564;
    float _626 = _558;
    float _628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _630 = _518 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _634 = _520 + _632;
    bool _636 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _638 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _640 = _636 || _638;
    bool _642 = isnan(0.5);
    bool _644 = _640 || _642;
    float _646 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _648 = _512 + _646;
    float _650 = fma(_630, _624, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _652 = fma(_634, _624, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _654 = fma(_648, _624, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _656 = _624;
    float _658 = _626;
    float _660 = _648;
    if (_644)
    {
        _656 = _650;
    }
    float _662 = _656;
    float _664 = _662;
    if (_644)
    {
        _658 = _654;
    }
    float _666 = _658;
    float _668 = _666;
    if (_644)
    {
        _660 = _652;
    }
    float _670 = _660;
    float _672 = _670;
    if (!_644)
    {
        float _674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _676 = _436 + _674;
        float _678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _680 = _396 + _678;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _684 = _676 * _676;
        float _686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _688 = _398 + _686;
        float _690 = fma(_680, _680, _684);
        float _692 = -_396;
        float _694 = _692 + _650;
        float _696 = fma(_688, _688, _690);
        float _698 = -_436;
        float _700 = _698 + _654;
        float _702 = sqrt(_696);
        float _704 = precise::min(_702, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _706 = _704 * _682;
        float _708 = -_398;
        float _710 = _708 + _652;
        float _712 = fma(_694, _706, _396);
        float _714 = fma(_700, _706, _436);
        float _716 = fma(_710, _706, _398);
        _668 = _714;
        _664 = _712;
        _672 = _716;
    }
    float _718 = _668;
    float _720 = _664;
    float _722 = _672;
    float _724 = _718 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _726 = _718 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _728 = _718 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_35.x = 1.0;
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[1].x, _724);
    float _732 = _718 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[0].x, _726);
    float _736 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[2].x, _728);
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].z, _730);
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[3].x, _732);
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].z, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].z, _736);
    float _746 = _738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _748 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].z, _740);
    float _750 = _742 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _752 = _744 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _754 = _746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _756 = _746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _758 = _746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _760 = _746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[4].x, _754);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[5].x, _756);
    float _766 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[6].x, _758);
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[7].x, _760);
    float _770 = _748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _772 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].z, _762);
    float _774 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].z, _764);
    float _776 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].z, _766);
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _780 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].w, _772);
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].w, _774);
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].w, _776);
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].w, _778);
    out.m_49.w = _780;
    out.gl_Position.x = _782;
    out.gl_Position.y = _784;
    out.gl_Position.z = _786;
    out.gl_Position.w = _788;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

