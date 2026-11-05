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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _867 = as_type<float>(_84);
        out.gl_Position.z = _867;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _935 = as_type<float>(_120);
        out.gl_Position.z = _935;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = in.m_41.x;
    float _276 = in.m_41.y;
    float _278 = in.m_41.z;
    float _280 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = in.m_37.x;
    float _286 = in.m_37.y;
    float _288 = in.m_37.z;
    float _290 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _296 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _298 = in.m_43.y;
    float _300 = 1.0 / _294;
    float _302 = in.m_43.x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _310 = in.m_43.w;
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _318 = 1.0 / _306;
    float _320 = in.m_43.z;
    float _322 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _312);
    float _324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _274);
    float _326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _278);
    float _328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _276);
    float _330 = 1.0 / _316;
    float _332 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = _286 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    out.m_45.y = _298;
    float _336 = _284 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _342 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _296);
    out.m_45.x = _302;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _344;
    float _348 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _352 = _346 * _300;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _358 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _360 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _366;
    float _370 = 1.0 / _356;
    float _372 = _358 * _328;
    out.m_45.w = _310;
    float _374 = _368 * _318;
    float _376 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _378 = _348 * _324;
    float _380 = _372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _382 = _376 * _326;
    bool _384 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _386 = isnan(_272);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _340;
    float _398 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _380);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _400;
    float _404 = _360 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _410 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _398);
    float _412 = _402 * _370;
    bool _414 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _416 = isnan(_272);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = _372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _272 + _428;
    float _432 = _410 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _434 = _364 * _330;
    float _436 = fma(_352, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _438 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _440 = isnan(_272);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_394;
    float _452 = _450 + 1.0;
    float _454 = _408 * _396;
    float _456 = -_424;
    float _458 = _456 + 1.0;
    float _460 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _426);
    float _462 = _448 * _452;
    float _464 = -_448;
    float _466 = _464 + 1.0;
    float _468 = _404 + _432;
    bool _470 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _472 = isnan(_272);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _460);
    float _484 = _424 * _466;
    bool _486 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = isnan(_272);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    out.m_45.z = _320;
    float _498 = _480 * _458;
    float _500 = -_480;
    float _502 = _500 + 1.0;
    bool _504 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _506 = isnan(_272);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _520 = _482 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _522 = _496 * _502;
    float _524 = -_496;
    float _526 = _524 + 1.0;
    float _528 = _322 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _530 = 1.0 / _518;
    bool _532 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = isnan(_272);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _514 * _526;
    float _546 = -_514;
    float _548 = _546 + 1.0;
    float _550 = _528 + _520;
    bool _552 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _554 = isnan(_272);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_542;
    float _566 = _564 + 1.0;
    float _568 = _542 * _548;
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _572 = _550 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _578 = _562 * _566;
    float _580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _582 = _468 + _580;
    float _584 = _572 * _572;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _590 = _436 * _578;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = fma(_582, _582, _584);
    float _598 = _576 * _530;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _272 + _600;
    float _604 = sqrt(_596);
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _608 = fma(_434, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _612 = _272 + _610;
    float _614 = 1.0 / _588;
    float _616 = fma(_454, _612, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _618 = _604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _626 = _272 + _624;
    float _628 = fma(_374, _626, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _630 = fma(_608, _568, _606);
    float _632 = _372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _636 = _272 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _640 = _272 + _638;
    float _642 = fma(_628, _544, _630);
    float _644 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _632);
    float _646 = fma(_412, _636, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _648 = _622 * _614;
    float _650 = fma(_616, _522, _642);
    float _652 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _644);
    float _654 = fma(_598, _640, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _658 = _272 + _656;
    float _660 = fma(_646, _498, _650);
    float _662 = _652 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _666 = fma(_654, _484, _660);
    float _668 = _350 + _662;
    float _670 = fma(_664, _462, _666);
    float _672 = _272;
    float _674 = _468;
    float _676 = _550;
    if (!_618)
    {
        _672 = _668;
    }
    float _678 = _672;
    bool _680 = !_618;
    float _682 = _678;
    if (!_680)
    {
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _688 = _604 + _686;
        float _690 = _668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = rsqrt(_596);
        float _694 = _688 * _684;
        float _696 = _694 * 0.15915493667125701904296875;
        float _698 = _696 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _696 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = _700 + (-1.0);
        float _708 = _706 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _710 = fma(_704, _690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _712 = fma(_668, _700, _708);
        float _714 = _692 * _710;
        float _716 = fma(_582, _714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _718 = fma(_572, _714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _682 = _712;
        _674 = _716;
        _676 = _718;
    }
    float _720 = _682;
    float _722 = _674;
    float _724 = _676;
    float _726 = _720 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _728 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[122].x, _670);
    float _730 = _720 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _732 = _720 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _726);
    float _736 = _720 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _730);
    float _740 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _732);
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _736);
    float _746 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _740);
    float _750 = _742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _744);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _756 = _748 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _758 = _750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _760 = _750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _762 = _750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _764 = _750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _758);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _760);
    float _770 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _762);
    float _772 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _764);
    float _774 = _752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _766);
    float _778 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _768);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _770);
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _772);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[5].w, _776);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _788 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[6].w, _780);
    float _790 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _792 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _802 = _788 + _790;
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _808 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _802 * 0.5;
    out.m_33.x = _806;
    out.m_47.x = _804;
    out.m_47.y = _798;
    out.m_47.z = _808;
    out.m_47.w = _792;
    out.gl_Position.x = _786;
    out.gl_Position.y = _784;
    out.gl_Position.z = _788;
    out.gl_Position.w = _790;
    out.m_49.z = _810;
    out.m_49.w = _790;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _867 = as_type<float>(_84);
        out.gl_Position.z = _867;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _935 = as_type<float>(_120);
        out.gl_Position.z = _935;
    }
    if (_114)
    {
        return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = in.m_41.x;
    float _276 = in.m_41.y;
    float _278 = in.m_41.z;
    float _280 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = in.m_37.x;
    float _286 = in.m_37.y;
    float _288 = in.m_37.z;
    float _290 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _296 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _298 = in.m_43.y;
    float _300 = 1.0 / _294;
    float _302 = in.m_43.x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _310 = in.m_43.w;
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _318 = 1.0 / _306;
    float _320 = in.m_43.z;
    float _322 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _312);
    float _324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _274);
    float _326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _278);
    float _328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _276);
    float _330 = 1.0 / _316;
    float _332 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = _286 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    out.m_45.y = _298;
    float _336 = _284 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _342 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _296);
    out.m_45.x = _302;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _344;
    float _348 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _352 = _346 * _300;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _358 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _360 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _366;
    float _370 = 1.0 / _356;
    float _372 = _358 * _328;
    out.m_45.w = _310;
    float _374 = _368 * _318;
    float _376 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _378 = _348 * _324;
    float _380 = _372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _382 = _376 * _326;
    bool _384 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _386 = isnan(_272);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _340;
    float _398 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _380);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _400;
    float _404 = _360 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _410 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _398);
    float _412 = _402 * _370;
    bool _414 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _416 = isnan(_272);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = _372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _272 + _428;
    float _432 = _410 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _434 = _364 * _330;
    float _436 = fma(_352, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _438 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _440 = isnan(_272);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_394;
    float _452 = _450 + 1.0;
    float _454 = _408 * _396;
    float _456 = -_424;
    float _458 = _456 + 1.0;
    float _460 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _426);
    float _462 = _448 * _452;
    float _464 = -_448;
    float _466 = _464 + 1.0;
    float _468 = _404 + _432;
    bool _470 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _472 = isnan(_272);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _460);
    float _484 = _424 * _466;
    bool _486 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = isnan(_272);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    out.m_45.z = _320;
    float _498 = _480 * _458;
    float _500 = -_480;
    float _502 = _500 + 1.0;
    bool _504 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _506 = isnan(_272);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _520 = _482 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _522 = _496 * _502;
    float _524 = -_496;
    float _526 = _524 + 1.0;
    float _528 = _322 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _530 = 1.0 / _518;
    bool _532 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = isnan(_272);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _514 * _526;
    float _546 = -_514;
    float _548 = _546 + 1.0;
    float _550 = _528 + _520;
    bool _552 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _554 = isnan(_272);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_542;
    float _566 = _564 + 1.0;
    float _568 = _542 * _548;
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _572 = _550 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _578 = _562 * _566;
    float _580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _582 = _468 + _580;
    float _584 = _572 * _572;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _590 = _436 * _578;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = fma(_582, _582, _584);
    float _598 = _576 * _530;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _272 + _600;
    float _604 = sqrt(_596);
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _608 = fma(_434, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _612 = _272 + _610;
    float _614 = 1.0 / _588;
    float _616 = fma(_454, _612, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _618 = _604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _626 = _272 + _624;
    float _628 = fma(_374, _626, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _630 = fma(_608, _568, _606);
    float _632 = _372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _636 = _272 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _640 = _272 + _638;
    float _642 = fma(_628, _544, _630);
    float _644 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _632);
    float _646 = fma(_412, _636, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _648 = _622 * _614;
    float _650 = fma(_616, _522, _642);
    float _652 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _644);
    float _654 = fma(_598, _640, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _658 = _272 + _656;
    float _660 = fma(_646, _498, _650);
    float _662 = _652 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _666 = fma(_654, _484, _660);
    float _668 = _350 + _662;
    float _670 = fma(_664, _462, _666);
    float _672 = _272;
    float _674 = _468;
    float _676 = _550;
    if (!_618)
    {
        _672 = _668;
    }
    float _678 = _672;
    bool _680 = !_618;
    float _682 = _678;
    if (!_680)
    {
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _688 = _604 + _686;
        float _690 = _668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = rsqrt(_596);
        float _694 = _688 * _684;
        float _696 = _694 * 0.15915493667125701904296875;
        float _698 = _696 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _696 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = _700 + (-1.0);
        float _708 = _706 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _710 = fma(_704, _690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _712 = fma(_668, _700, _708);
        float _714 = _692 * _710;
        float _716 = fma(_582, _714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _718 = fma(_572, _714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _682 = _712;
        _674 = _716;
        _676 = _718;
    }
    float _720 = _682;
    float _722 = _674;
    float _724 = _676;
    float _726 = _720 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _728 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[122].x, _670);
    float _730 = _720 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _732 = _720 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _726);
    float _736 = _720 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _730);
    float _740 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _732);
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _736);
    float _746 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _740);
    float _750 = _742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _744);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _756 = _748 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _758 = _750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _760 = _750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _762 = _750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _764 = _750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _758);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _760);
    float _770 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _762);
    float _772 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _764);
    float _774 = _752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _766);
    float _778 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _768);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _770);
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _772);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[5].w, _776);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _788 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[6].w, _780);
    float _790 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _792 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _802 = _788 + _790;
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _808 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _802 * 0.5;
    out.m_33.x = _806;
    out.m_47.x = _804;
    out.m_47.y = _798;
    out.m_47.z = _808;
    out.m_47.w = _792;
    out.gl_Position.x = _786;
    out.gl_Position.y = _784;
    out.gl_Position.z = _788;
    out.gl_Position.w = _790;
    out.m_49.z = _810;
    out.m_49.w = _790;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _867 = as_type<float>(_84);
        out.gl_Position.z = _867;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _935 = as_type<float>(_120);
        out.gl_Position.z = _935;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = in.m_41.x;
    float _276 = in.m_41.y;
    float _278 = in.m_41.z;
    float _280 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = in.m_37.x;
    float _286 = in.m_37.y;
    float _288 = in.m_37.z;
    float _290 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _296 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _298 = in.m_43.y;
    float _300 = 1.0 / _294;
    float _302 = in.m_43.x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _310 = in.m_43.w;
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _318 = 1.0 / _306;
    float _320 = in.m_43.z;
    float _322 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _312);
    float _324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _274);
    float _326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _278);
    float _328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _276);
    float _330 = 1.0 / _316;
    float _332 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = _286 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    out.m_45.y = _298;
    float _336 = _284 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _342 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _296);
    out.m_45.x = _302;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _344;
    float _348 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _352 = _346 * _300;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _358 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _360 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _366;
    float _370 = 1.0 / _356;
    float _372 = _358 * _328;
    out.m_45.w = _310;
    float _374 = _368 * _318;
    float _376 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _378 = _348 * _324;
    float _380 = _372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _382 = _376 * _326;
    bool _384 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[122].w;
    bool _386 = isnan(_272);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[122].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _340;
    float _398 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _380);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _400;
    float _404 = _360 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _410 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _398);
    float _412 = _402 * _370;
    bool _414 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _416 = isnan(_272);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = _372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _430 = _272 + _428;
    float _432 = _410 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _434 = _364 * _330;
    float _436 = fma(_352, _430, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _438 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _440 = isnan(_272);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_394;
    float _452 = _450 + 1.0;
    float _454 = _408 * _396;
    float _456 = -_424;
    float _458 = _456 + 1.0;
    float _460 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _426);
    float _462 = _448 * _452;
    float _464 = -_448;
    float _466 = _464 + 1.0;
    float _468 = _404 + _432;
    bool _470 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _472 = isnan(_272);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _460);
    float _484 = _424 * _466;
    bool _486 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = isnan(_272);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    out.m_45.z = _320;
    float _498 = _480 * _458;
    float _500 = -_480;
    float _502 = _500 + 1.0;
    bool _504 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _506 = isnan(_272);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _520 = _482 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _522 = _496 * _502;
    float _524 = -_496;
    float _526 = _524 + 1.0;
    float _528 = _322 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _530 = 1.0 / _518;
    bool _532 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = isnan(_272);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _514 * _526;
    float _546 = -_514;
    float _548 = _546 + 1.0;
    float _550 = _528 + _520;
    bool _552 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _554 = isnan(_272);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_542;
    float _566 = _564 + 1.0;
    float _568 = _542 * _548;
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _572 = _550 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _578 = _562 * _566;
    float _580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _582 = _468 + _580;
    float _584 = _572 * _572;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[122].w;
    float _590 = _436 * _578;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = fma(_582, _582, _584);
    float _598 = _576 * _530;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _272 + _600;
    float _604 = sqrt(_596);
    float _606 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _608 = fma(_434, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _612 = _272 + _610;
    float _614 = 1.0 / _588;
    float _616 = fma(_454, _612, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _618 = _604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[122].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _626 = _272 + _624;
    float _628 = fma(_374, _626, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _630 = fma(_608, _568, _606);
    float _632 = _372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _636 = _272 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _640 = _272 + _638;
    float _642 = fma(_628, _544, _630);
    float _644 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _632);
    float _646 = fma(_412, _636, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _648 = _622 * _614;
    float _650 = fma(_616, _522, _642);
    float _652 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _644);
    float _654 = fma(_598, _640, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _658 = _272 + _656;
    float _660 = fma(_646, _498, _650);
    float _662 = _652 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[121].x);
    float _666 = fma(_654, _484, _660);
    float _668 = _350 + _662;
    float _670 = fma(_664, _462, _666);
    float _672 = _272;
    float _674 = _468;
    float _676 = _550;
    if (!_618)
    {
        _672 = _668;
    }
    float _678 = _672;
    bool _680 = !_618;
    float _682 = _678;
    if (!_680)
    {
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _688 = _604 + _686;
        float _690 = _668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = rsqrt(_596);
        float _694 = _688 * _684;
        float _696 = _694 * 0.15915493667125701904296875;
        float _698 = _696 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _696 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = _700 + (-1.0);
        float _708 = _706 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _710 = fma(_704, _690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _712 = fma(_668, _700, _708);
        float _714 = _692 * _710;
        float _716 = fma(_582, _714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _718 = fma(_572, _714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _682 = _712;
        _674 = _716;
        _676 = _718;
    }
    float _720 = _682;
    float _722 = _674;
    float _724 = _676;
    float _726 = _720 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _728 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[122].x, _670);
    float _730 = _720 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _732 = _720 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[1].x, _726);
    float _736 = _720 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _738 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[0].x, _730);
    float _740 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[2].x, _732);
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[3].x, _736);
    float _746 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _740);
    float _750 = _742 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _744);
    float _754 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _756 = _748 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _758 = _750 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _760 = _750 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _762 = _750 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _764 = _750 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _758);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _760);
    float _770 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _762);
    float _772 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _764);
    float _774 = _752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _766);
    float _778 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _768);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _770);
    float _782 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _772);
    float _784 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[5].w, _776);
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _788 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[6].w, _780);
    float _790 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[7].w, _782);
    float _792 = _728 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _798 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _802 = _788 + _790;
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _808 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _802 * 0.5;
    out.m_33.x = _806;
    out.m_47.x = _804;
    out.m_47.y = _798;
    out.m_47.z = _808;
    out.m_47.w = _792;
    out.gl_Position.x = _786;
    out.gl_Position.y = _784;
    out.gl_Position.z = _788;
    out.gl_Position.w = _790;
    out.m_49.z = _810;
    out.m_49.w = _790;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

