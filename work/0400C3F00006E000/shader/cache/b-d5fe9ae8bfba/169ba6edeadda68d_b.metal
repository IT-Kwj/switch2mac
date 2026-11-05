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
    float4 m_33 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_45 [[attribute(4)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
    float4 m_47 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    float _84 = as_type<float>(_76);
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _82;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1103 = as_type<float>(_92);
        out.gl_Position.z = _1103;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_76);
        _84 = _112;
    }
    float _114 = _84;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1172 = as_type<float>(_128);
        out.gl_Position.z = _1172;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _138 = in.m_39.x;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_39.y;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _148 = _146 != 0;
    float _150 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _154 = _152 != 0;
    float _156 = in.m_41.x;
    float _158 = in.m_41.y;
    float _160 = in.m_41.z;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _164 = _162 != 0;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _170 = in.m_43.y;
    float _172 = in.m_39.w;
    float _174 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _176 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _178 = _132 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _180 = 1.0 / _174;
    float _182 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _184 = in.m_39.z;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _192 = -_150;
    float _194 = fma(_182, 2.0, _192);
    float _196 = in.m_43.x;
    bool _198 = _144 > 0.5;
    float _200 = 1.0 / _176;
    float _202 = fma(_190, -2.0, _166);
    float _204 = _168 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _206 = in.m_35.x;
    float _208 = in.m_35.y;
    float _210 = in.m_35.z;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _214 = 1.0 / _178;
    float _216 = _180 * _160;
    float _218 = -_170;
    float _220 = _218 + 1.0;
    bool _222 = _172 > 0.5;
    float _224 = in.m_37.w;
    int _226 = _222 ? as_type<int>(_220) : as_type<int>(_170);
    float _228 = _200 * _156;
    bool _230 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.0);
    bool _238 = _234 || _236;
    int _240 = _198 ? as_type<int>(_220) : as_type<int>(_170);
    float _242 = _136 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _244 = _154 ? as_type<float>(_226) : _170;
    float _246 = _164 ? as_type<float>(_240) : _170;
    float _248 = _214 * _158;
    float _250 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _252 = in.m_30.x;
    float _254 = in.m_30.y;
    float _256 = in.m_30.z;
    float _258 = fma(_244, _204, -0.5);
    float _260 = fma(_242, _246, -0.5);
    float _262 = _246;
    float _264 = _204;
    float _266 = _250;
    float _268 = _144;
    bool _270 = _154;
    bool _272 = _188;
    if (!_188)
    {
        _262 = _184;
    }
    float _274 = _262;
    float _276 = _274;
    if (!_238)
    {
        float _278 = _250 * _250;
        float _280 = _278 * 0.5;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = 0.0;
    float _286 = _282;
    float _288 = _196;
    if (!_142)
    {
        _284 = _196;
    }
    float _290 = _284;
    float _292 = _290;
    if (_188)
    {
        _276 = _144;
    }
    float _294 = _276;
    if (!_238)
    {
        float _296 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _296;
    }
    float _298 = _286;
    bool _300 = !_238;
    float _302 = _298;
    if (!_300)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = _250 * _306;
        float _316 = 1.0 / _310;
        float _318 = _312 * 0.693147182464599609375;
        float _320 = exp2(_314);
        float _322 = 1.0 / _318;
        float _324 = _320 + (-1.0);
        float _326 = -_324;
        float _328 = fma(_326, _322, _250);
        float _330 = _328 * _316;
        float _332 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _302 = _332;
    }
    float _334 = _302;
    bool _336 = !_238;
    if (!_336)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _250 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _266 = _356;
    }
    float _358 = _266;
    float _360 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _364 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _202);
    float _366 = fma(_358, _208, _360);
    float _368 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = fma(_358, _206, _362);
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _374 = fma(_366, _224, _254);
    float _376 = fma(_358, _210, _368);
    float _378 = fma(_370, _224, _252);
    float _380 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].w, _372);
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = fma(_376, _224, _256);
    float _386 = _374 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _380);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _392 = _374 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = -_364;
    float _398 = fma(_388, _260, _396);
    float _400 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _404 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _412 = _400;
    if (!_188)
    {
        _412 = _184;
    }
    float _414 = _412;
    float _416 = -_406;
    float _418 = _416 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _420 = _408 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _422 = -_410;
    float _424 = _422 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _426 = _414;
    if (_188)
    {
        _426 = _144;
    }
    float _428 = _426;
    float _430 = _418 * _418;
    float _432 = -_420;
    float _434 = _432 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    if (_188)
    {
        _268 = _138;
    }
    float _436 = _268;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _440 = fma(_424, _424, _430);
    float _442 = _184 * 6.283185482025146484375;
    float _444 = fma(_434, _434, _440);
    if (_148)
    {
        bool _446 = _184 > 0.5;
        _270 = _446;
    }
    bool _448 = _270;
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _438);
    float _452 = rsqrt(_444);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _456 = _436 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _458 = _428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _462 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _212);
    float _464 = fma(_110, 0.310000002384185791015625, _442);
    float _466 = -_454;
    float _468 = fma(_456, 2.0, _466);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_142)
    {
        bool _472 = _138 > 0.5;
        _272 = _472;
    }
    bool _474 = _272;
    float _476 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _460);
    float _478 = _138 * 6.283185482025146484375;
    float _480 = fma(_458, -2.0, _470);
    float _482 = _464 * 0.15915493667125701904296875;
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _486 = fma(_110, 0.10999999940395355224609375, _478);
    float _488 = _424 * _452;
    float _490 = _434 * _452;
    float _492 = _418 * _452;
    float _494 = _486 * 0.15915493667125701904296875;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _498 = _488 * _496;
    float _500 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _502 = _490 * _500;
    float _504 = _482 * 6.283185482025146484375;
    float _506 = sin(_504);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _510 = -_498;
    float _512 = fma(_490, _508, _510);
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _516 = _492 * _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _520 = -_502;
    float _522 = fma(_492, _518, _520);
    float _524 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _480);
    float _526 = _512 * _512;
    float _528 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _530 = -_516;
    float _532 = fma(_488, _528, _530);
    float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _536 = as_type<int>(_482);
    int _538 = as_type<int>(_526);
    if (_148)
    {
        float _540 = -_196;
        float _542 = _540 + 1.0;
        _536 = as_type<int>(_542);
    }
    int _544 = _536;
    float _546 = fma(_522, _522, _526);
    if (_142)
    {
        float _548 = -_196;
        float _550 = _548 + 1.0;
        _538 = as_type<int>(_550);
    }
    int _552 = _538;
    float _554 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _476);
    float _556 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _558 = fma(_532, _532, _546);
    float _560 = _494 * 6.283185482025146484375;
    float _562 = sin(_560);
    if (_142)
    {
        float _564 = _474 ? as_type<float>(_552) : _196;
        _292 = _564;
    }
    float _566 = _292;
    float _568 = fma(_506, 0.12999999523162841796875, 1.0);
    if (_148)
    {
        float _570 = _448 ? as_type<float>(_544) : _196;
        _288 = _570;
    }
    float _572 = _288;
    float _574 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _462);
    float _576 = -_110;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    float _580 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _450);
    float _582 = -_110;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[81].x, _468);
    float _586 = rsqrt(_558);
    float _588 = _534 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _590 = -_524;
    float _592 = fma(_574, _258, _590);
    float _594 = fma(_556, _566, -0.5);
    float _596 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _598 = fma(_588, _572, -0.5);
    float _600 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _248);
    float _604 = fma(_562, 0.300000011920928955078125, _568);
    float _606 = -_170;
    float _608 = fma(_606, 0.5, 0.5);
    float _610 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _228);
    float _614 = _602 * _600;
    float _616 = _604 * _608;
    float _618 = fma(_580, _598, _584);
    bool _620 = _248 != 0.0;
    bool _622 = isnan(_248);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _532 * _586;
    float _632 = _522 * _586;
    float _634 = _512 * _586;
    float _636 = _612 * _596;
    float _638 = _488 * _630;
    float _640 = _492 * _632;
    float _642 = _490 * _634;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    float _646 = -_638;
    float _648 = fma(_490, _632, _646);
    float _650 = -_640;
    float _652 = fma(_488, _634, _650);
    float _654 = -_642;
    float _656 = fma(_492, _630, _654);
    float _658 = _644 * _610;
    float _660 = _614 * _648;
    float _662 = _614 * _652;
    float _664 = _614 * _656;
    float _666 = fma(_554, _594, _578);
    float _668 = fma(_636, _634, _660);
    float _670 = fma(_636, _630, _662);
    float _672 = fma(_636, _632, _664);
    bool _674 = _228 == 0.0;
    bool _676 = !_628;
    bool _678 = _674 && _676;
    float _680 = fma(_658, _492, _668);
    float _682 = fma(_658, _490, _670);
    float _684 = fma(_658, _488, _672);
    bool _686 = _216 == 0.0;
    bool _688 = _686 && _678;
    float _690 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _692 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _694 = in.m_45.x;
    float _696 = in.m_45.y;
    float _698 = in.m_45.z;
    float _700 = _600 * _616;
    float _702 = _700 * 2.0;
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].z, _690);
    float _706 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _708 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].y, _692);
    float _710 = in.m_47.w;
    float _712 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].z, _704);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].x, _706);
    float _716 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].y, _708);
    float _718 = _410 + _684;
    float _720 = _610 * _712;
    float _722 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _714);
    float _724 = _600 * _716;
    float _726 = _420 + _682;
    float _728 = _720 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _730 = _720 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _732 = _596 * _722;
    float _734 = _398 + 0.5;
    float _736 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].y, _728);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].y, _730);
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    float _750 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _736);
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _738);
    float _754 = _696;
    float _756 = _694;
    float _758 = _698;
    if (!_688)
    {
        float _760 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[17].y, _696);
        _754 = _760;
    }
    float _762 = _754;
    if (!_688)
    {
        float _764 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _694);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _726 + _750;
    float _770 = _718 + _752;
    float _772 = _656 * _762;
    float _774 = _648 * _762;
    float _776 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].z, _768);
    float _778 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].x, _770);
    float _780 = fma(_632, _766, _772);
    float _782 = _652 * _762;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _786 = _776 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _778 + _788;
    float _792 = fma(_634, _766, _774);
    float _794 = fma(_630, _766, _782);
    float _796 = _786 * _786;
    float _798 = _406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_688)
    {
        float _800 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _698);
        _758 = _800;
    }
    float _802 = _758;
    out.m_49.w = _710;
    float _804 = fma(_790, _790, _796);
    float _806 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[11].x, _798);
    float _808 = fma(_488, _802, _780);
    float _810 = _592 + 0.5;
    float _812 = sqrt(_804);
    float _814 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _806);
    float _816 = _666 + 0.5;
    float _818 = _618 + 0.5;
    float _820 = fma(_492, _802, _792);
    float _822 = _406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _824 = _814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _826 = _720 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    out.m_51.x = _816;
    out.m_51.y = _734;
    out.m_51.z = _818;
    out.m_51.w = _810;
    float _828 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[10].x, _822);
    float _830 = _406 + _680;
    float _832 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].y, _826);
    float _834 = 1.0 / _824;
    float _836 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _828);
    float _838 = fma(_490, _802, _794);
    float _840 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _832);
    bool _842 = _812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _830 + _840;
    out.m_53.x = _808;
    out.m_53.y = _820;
    out.m_53.z = _838;
    float _848 = _844 + _824;
    float _850 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].y, _846);
    float _852 = _848 * _834;
    float _854 = _852 * 0.5;
    float _856 = _808;
    float _858 = _838;
    float _860 = _820;
    float _862 = _826;
    if (!_842)
    {
        _856 = _778;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_842)
    {
        _858 = _776;
    }
    float _868 = _858;
    float _870 = _868;
    if (!_842)
    {
        _860 = _850;
    }
    float _872 = _860;
    bool _874 = !_842;
    float _876 = _872;
    if (!_874)
    {
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _882 = _812 + _880;
        float _884 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = rsqrt(_804);
        float _888 = _882 * _878;
        float _890 = _888 * 0.15915493667125701904296875;
        float _892 = _890 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = _890 * 6.283185482025146484375;
        float _898 = sin(_896);
        float _900 = _894 + (-1.0);
        float _902 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = fma(_898, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = fma(_850, _894, _902);
        float _908 = _886 * _904;
        float _910 = fma(_790, _908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _912 = fma(_786, _908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _876 = _906;
        _862 = _908;
        _866 = _910;
        _870 = _912;
    }
    float _914 = _876;
    float _916 = _862;
    float _918 = _866;
    float _920 = _870;
    float _922 = _914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = _916;
    if (_748)
    {
        _924 = 1.0;
    }
    float _926 = _924;
    float _928 = _926;
    if (!_748)
    {
        float _930 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _932 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _930);
        float _934 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _938 = 1.0 / _932;
        float _940 = 1.0 / _936;
        float _942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _944 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _946 = fma(_938, _942, _944);
        float _948 = _946 * _940;
        float _950 = precise::clamp(_948, 0.0, 1.0);
        float _952 = -_950;
        float _954 = _952 + 1.0;
        _928 = _954;
    }
    float _956 = _928;
    float _958 = _914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _960 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _966 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _958);
    float _968 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _960);
    float _970 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _972 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _964);
    float _974 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _966);
    float _976 = _968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _978 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _970);
    float _980 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _984 = _976 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _986 = _976 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _988 = _976 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _990 = _976 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _992 = _978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _984);
    float _996 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _986);
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _988);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _990);
    float _1002 = _980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _994);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _996);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1010 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    bool _1012 = _956 > 0.0;
    bool _1014 = isnan(_956);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    float _1022 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1004);
    float _1026 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1006);
    float _1028 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    float _1030 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1008);
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1034 = _1026 + _1028;
    float _1036 = _1030 + _1028;
    float _1038 = _1028 * 0.5;
    float _1040 = _1034 * 0.5;
    float _1042 = _1036 * 0.5;
    float _1044 = fma(_1024, -0.5, _1038);
    out.m_55.x = _918;
    out.m_55.y = _914;
    out.m_55.z = _920;
    out.m_33.x = _1032;
    out.gl_Position.x = _1026;
    out.gl_Position.y = _1024;
    out.gl_Position.z = _1030;
    out.gl_Position.w = _1028;
    out.m_57.x = _1040;
    out.m_57.y = _1044;
    out.m_57.z = _1042;
    out.m_57.w = _1028;
    if (_1020)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1046;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    float _84 = as_type<float>(_76);
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _82;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1103 = as_type<float>(_92);
        out.gl_Position.z = _1103;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_76);
        _84 = _112;
    }
    float _114 = _84;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1172 = as_type<float>(_128);
        out.gl_Position.z = _1172;
    }
    if (_120)
    {
        return out;
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _138 = in.m_39.x;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_39.y;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _148 = _146 != 0;
    float _150 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _154 = _152 != 0;
    float _156 = in.m_41.x;
    float _158 = in.m_41.y;
    float _160 = in.m_41.z;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _164 = _162 != 0;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _170 = in.m_43.y;
    float _172 = in.m_39.w;
    float _174 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _176 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _178 = _132 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _180 = 1.0 / _174;
    float _182 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _184 = in.m_39.z;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _192 = -_150;
    float _194 = fma(_182, 2.0, _192);
    float _196 = in.m_43.x;
    bool _198 = _144 > 0.5;
    float _200 = 1.0 / _176;
    float _202 = fma(_190, -2.0, _166);
    float _204 = _168 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _206 = in.m_35.x;
    float _208 = in.m_35.y;
    float _210 = in.m_35.z;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _214 = 1.0 / _178;
    float _216 = _180 * _160;
    float _218 = -_170;
    float _220 = _218 + 1.0;
    bool _222 = _172 > 0.5;
    float _224 = in.m_37.w;
    int _226 = _222 ? as_type<int>(_220) : as_type<int>(_170);
    float _228 = _200 * _156;
    bool _230 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.0);
    bool _238 = _234 || _236;
    int _240 = _198 ? as_type<int>(_220) : as_type<int>(_170);
    float _242 = _136 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _244 = _154 ? as_type<float>(_226) : _170;
    float _246 = _164 ? as_type<float>(_240) : _170;
    float _248 = _214 * _158;
    float _250 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _252 = in.m_30.x;
    float _254 = in.m_30.y;
    float _256 = in.m_30.z;
    float _258 = fma(_244, _204, -0.5);
    float _260 = fma(_242, _246, -0.5);
    float _262 = _246;
    float _264 = _204;
    float _266 = _250;
    float _268 = _144;
    bool _270 = _154;
    bool _272 = _188;
    if (!_188)
    {
        _262 = _184;
    }
    float _274 = _262;
    float _276 = _274;
    if (!_238)
    {
        float _278 = _250 * _250;
        float _280 = _278 * 0.5;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = 0.0;
    float _286 = _282;
    float _288 = _196;
    if (!_142)
    {
        _284 = _196;
    }
    float _290 = _284;
    float _292 = _290;
    if (_188)
    {
        _276 = _144;
    }
    float _294 = _276;
    if (!_238)
    {
        float _296 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _296;
    }
    float _298 = _286;
    bool _300 = !_238;
    float _302 = _298;
    if (!_300)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = _250 * _306;
        float _316 = 1.0 / _310;
        float _318 = _312 * 0.693147182464599609375;
        float _320 = exp2(_314);
        float _322 = 1.0 / _318;
        float _324 = _320 + (-1.0);
        float _326 = -_324;
        float _328 = fma(_326, _322, _250);
        float _330 = _328 * _316;
        float _332 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _302 = _332;
    }
    float _334 = _302;
    bool _336 = !_238;
    if (!_336)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _250 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _266 = _356;
    }
    float _358 = _266;
    float _360 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _364 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _202);
    float _366 = fma(_358, _208, _360);
    float _368 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = fma(_358, _206, _362);
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _374 = fma(_366, _224, _254);
    float _376 = fma(_358, _210, _368);
    float _378 = fma(_370, _224, _252);
    float _380 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].w, _372);
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = fma(_376, _224, _256);
    float _386 = _374 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _380);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _392 = _374 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = -_364;
    float _398 = fma(_388, _260, _396);
    float _400 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _404 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _412 = _400;
    if (!_188)
    {
        _412 = _184;
    }
    float _414 = _412;
    float _416 = -_406;
    float _418 = _416 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _420 = _408 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _422 = -_410;
    float _424 = _422 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _426 = _414;
    if (_188)
    {
        _426 = _144;
    }
    float _428 = _426;
    float _430 = _418 * _418;
    float _432 = -_420;
    float _434 = _432 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    if (_188)
    {
        _268 = _138;
    }
    float _436 = _268;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _440 = fma(_424, _424, _430);
    float _442 = _184 * 6.283185482025146484375;
    float _444 = fma(_434, _434, _440);
    if (_148)
    {
        bool _446 = _184 > 0.5;
        _270 = _446;
    }
    bool _448 = _270;
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _438);
    float _452 = rsqrt(_444);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _456 = _436 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _458 = _428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _462 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _212);
    float _464 = fma(_110, 0.310000002384185791015625, _442);
    float _466 = -_454;
    float _468 = fma(_456, 2.0, _466);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_142)
    {
        bool _472 = _138 > 0.5;
        _272 = _472;
    }
    bool _474 = _272;
    float _476 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _460);
    float _478 = _138 * 6.283185482025146484375;
    float _480 = fma(_458, -2.0, _470);
    float _482 = _464 * 0.15915493667125701904296875;
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _486 = fma(_110, 0.10999999940395355224609375, _478);
    float _488 = _424 * _452;
    float _490 = _434 * _452;
    float _492 = _418 * _452;
    float _494 = _486 * 0.15915493667125701904296875;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _498 = _488 * _496;
    float _500 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _502 = _490 * _500;
    float _504 = _482 * 6.283185482025146484375;
    float _506 = sin(_504);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _510 = -_498;
    float _512 = fma(_490, _508, _510);
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _516 = _492 * _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _520 = -_502;
    float _522 = fma(_492, _518, _520);
    float _524 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _480);
    float _526 = _512 * _512;
    float _528 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _530 = -_516;
    float _532 = fma(_488, _528, _530);
    float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _536 = as_type<int>(_482);
    int _538 = as_type<int>(_526);
    if (_148)
    {
        float _540 = -_196;
        float _542 = _540 + 1.0;
        _536 = as_type<int>(_542);
    }
    int _544 = _536;
    float _546 = fma(_522, _522, _526);
    if (_142)
    {
        float _548 = -_196;
        float _550 = _548 + 1.0;
        _538 = as_type<int>(_550);
    }
    int _552 = _538;
    float _554 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _476);
    float _556 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _558 = fma(_532, _532, _546);
    float _560 = _494 * 6.283185482025146484375;
    float _562 = sin(_560);
    if (_142)
    {
        float _564 = _474 ? as_type<float>(_552) : _196;
        _292 = _564;
    }
    float _566 = _292;
    float _568 = fma(_506, 0.12999999523162841796875, 1.0);
    if (_148)
    {
        float _570 = _448 ? as_type<float>(_544) : _196;
        _288 = _570;
    }
    float _572 = _288;
    float _574 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _462);
    float _576 = -_110;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    float _580 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _450);
    float _582 = -_110;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[81].x, _468);
    float _586 = rsqrt(_558);
    float _588 = _534 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _590 = -_524;
    float _592 = fma(_574, _258, _590);
    float _594 = fma(_556, _566, -0.5);
    float _596 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _598 = fma(_588, _572, -0.5);
    float _600 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _248);
    float _604 = fma(_562, 0.300000011920928955078125, _568);
    float _606 = -_170;
    float _608 = fma(_606, 0.5, 0.5);
    float _610 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _228);
    float _614 = _602 * _600;
    float _616 = _604 * _608;
    float _618 = fma(_580, _598, _584);
    bool _620 = _248 != 0.0;
    bool _622 = isnan(_248);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _532 * _586;
    float _632 = _522 * _586;
    float _634 = _512 * _586;
    float _636 = _612 * _596;
    float _638 = _488 * _630;
    float _640 = _492 * _632;
    float _642 = _490 * _634;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    float _646 = -_638;
    float _648 = fma(_490, _632, _646);
    float _650 = -_640;
    float _652 = fma(_488, _634, _650);
    float _654 = -_642;
    float _656 = fma(_492, _630, _654);
    float _658 = _644 * _610;
    float _660 = _614 * _648;
    float _662 = _614 * _652;
    float _664 = _614 * _656;
    float _666 = fma(_554, _594, _578);
    float _668 = fma(_636, _634, _660);
    float _670 = fma(_636, _630, _662);
    float _672 = fma(_636, _632, _664);
    bool _674 = _228 == 0.0;
    bool _676 = !_628;
    bool _678 = _674 && _676;
    float _680 = fma(_658, _492, _668);
    float _682 = fma(_658, _490, _670);
    float _684 = fma(_658, _488, _672);
    bool _686 = _216 == 0.0;
    bool _688 = _686 && _678;
    float _690 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _692 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _694 = in.m_45.x;
    float _696 = in.m_45.y;
    float _698 = in.m_45.z;
    float _700 = _600 * _616;
    float _702 = _700 * 2.0;
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].z, _690);
    float _706 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _708 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].y, _692);
    float _710 = in.m_47.w;
    float _712 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].z, _704);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].x, _706);
    float _716 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].y, _708);
    float _718 = _410 + _684;
    float _720 = _610 * _712;
    float _722 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _714);
    float _724 = _600 * _716;
    float _726 = _420 + _682;
    float _728 = _720 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _730 = _720 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _732 = _596 * _722;
    float _734 = _398 + 0.5;
    float _736 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].y, _728);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].y, _730);
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    float _750 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _736);
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _738);
    float _754 = _696;
    float _756 = _694;
    float _758 = _698;
    if (!_688)
    {
        float _760 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[17].y, _696);
        _754 = _760;
    }
    float _762 = _754;
    if (!_688)
    {
        float _764 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _694);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _726 + _750;
    float _770 = _718 + _752;
    float _772 = _656 * _762;
    float _774 = _648 * _762;
    float _776 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].z, _768);
    float _778 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].x, _770);
    float _780 = fma(_632, _766, _772);
    float _782 = _652 * _762;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _786 = _776 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _778 + _788;
    float _792 = fma(_634, _766, _774);
    float _794 = fma(_630, _766, _782);
    float _796 = _786 * _786;
    float _798 = _406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_688)
    {
        float _800 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _698);
        _758 = _800;
    }
    float _802 = _758;
    out.m_49.w = _710;
    float _804 = fma(_790, _790, _796);
    float _806 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[11].x, _798);
    float _808 = fma(_488, _802, _780);
    float _810 = _592 + 0.5;
    float _812 = sqrt(_804);
    float _814 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _806);
    float _816 = _666 + 0.5;
    float _818 = _618 + 0.5;
    float _820 = fma(_492, _802, _792);
    float _822 = _406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _824 = _814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _826 = _720 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    out.m_51.x = _816;
    out.m_51.y = _734;
    out.m_51.z = _818;
    out.m_51.w = _810;
    float _828 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[10].x, _822);
    float _830 = _406 + _680;
    float _832 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].y, _826);
    float _834 = 1.0 / _824;
    float _836 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _828);
    float _838 = fma(_490, _802, _794);
    float _840 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _832);
    bool _842 = _812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _830 + _840;
    out.m_53.x = _808;
    out.m_53.y = _820;
    out.m_53.z = _838;
    float _848 = _844 + _824;
    float _850 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].y, _846);
    float _852 = _848 * _834;
    float _854 = _852 * 0.5;
    float _856 = _808;
    float _858 = _838;
    float _860 = _820;
    float _862 = _826;
    if (!_842)
    {
        _856 = _778;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_842)
    {
        _858 = _776;
    }
    float _868 = _858;
    float _870 = _868;
    if (!_842)
    {
        _860 = _850;
    }
    float _872 = _860;
    bool _874 = !_842;
    float _876 = _872;
    if (!_874)
    {
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _882 = _812 + _880;
        float _884 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = rsqrt(_804);
        float _888 = _882 * _878;
        float _890 = _888 * 0.15915493667125701904296875;
        float _892 = _890 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = _890 * 6.283185482025146484375;
        float _898 = sin(_896);
        float _900 = _894 + (-1.0);
        float _902 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = fma(_898, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = fma(_850, _894, _902);
        float _908 = _886 * _904;
        float _910 = fma(_790, _908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _912 = fma(_786, _908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _876 = _906;
        _862 = _908;
        _866 = _910;
        _870 = _912;
    }
    float _914 = _876;
    float _916 = _862;
    float _918 = _866;
    float _920 = _870;
    float _922 = _914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = _916;
    if (_748)
    {
        _924 = 1.0;
    }
    float _926 = _924;
    float _928 = _926;
    if (!_748)
    {
        float _930 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _932 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _930);
        float _934 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _938 = 1.0 / _932;
        float _940 = 1.0 / _936;
        float _942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _944 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _946 = fma(_938, _942, _944);
        float _948 = _946 * _940;
        float _950 = precise::clamp(_948, 0.0, 1.0);
        float _952 = -_950;
        float _954 = _952 + 1.0;
        _928 = _954;
    }
    float _956 = _928;
    float _958 = _914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _960 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _966 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _958);
    float _968 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _960);
    float _970 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _972 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _964);
    float _974 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _966);
    float _976 = _968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _978 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _970);
    float _980 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _984 = _976 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _986 = _976 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _988 = _976 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _990 = _976 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _992 = _978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _984);
    float _996 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _986);
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _988);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _990);
    float _1002 = _980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _994);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _996);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1010 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    bool _1012 = _956 > 0.0;
    bool _1014 = isnan(_956);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    float _1022 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1004);
    float _1026 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1006);
    float _1028 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    float _1030 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1008);
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1034 = _1026 + _1028;
    float _1036 = _1030 + _1028;
    float _1038 = _1028 * 0.5;
    float _1040 = _1034 * 0.5;
    float _1042 = _1036 * 0.5;
    float _1044 = fma(_1024, -0.5, _1038);
    out.m_55.x = _918;
    out.m_55.y = _914;
    out.m_55.z = _920;
    out.m_33.x = _1032;
    out.gl_Position.x = _1026;
    out.gl_Position.y = _1024;
    out.gl_Position.z = _1030;
    out.gl_Position.w = _1028;
    out.m_57.x = _1040;
    out.m_57.y = _1044;
    out.m_57.z = _1042;
    out.m_57.w = _1028;
    if (_1020)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1046;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    float _84 = as_type<float>(_76);
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _82;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1103 = as_type<float>(_92);
        out.gl_Position.z = _1103;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_76);
        _84 = _112;
    }
    float _114 = _84;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1172 = as_type<float>(_128);
        out.gl_Position.z = _1172;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _138 = in.m_39.x;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_39.y;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _148 = _146 != 0;
    float _150 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _154 = _152 != 0;
    float _156 = in.m_41.x;
    float _158 = in.m_41.y;
    float _160 = in.m_41.z;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _164 = _162 != 0;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _170 = in.m_43.y;
    float _172 = in.m_39.w;
    float _174 = _134 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _176 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _178 = _132 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _180 = 1.0 / _174;
    float _182 = _138 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _184 = in.m_39.z;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _192 = -_150;
    float _194 = fma(_182, 2.0, _192);
    float _196 = in.m_43.x;
    bool _198 = _144 > 0.5;
    float _200 = 1.0 / _176;
    float _202 = fma(_190, -2.0, _166);
    float _204 = _168 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _206 = in.m_35.x;
    float _208 = in.m_35.y;
    float _210 = in.m_35.z;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _214 = 1.0 / _178;
    float _216 = _180 * _160;
    float _218 = -_170;
    float _220 = _218 + 1.0;
    bool _222 = _172 > 0.5;
    float _224 = in.m_37.w;
    int _226 = _222 ? as_type<int>(_220) : as_type<int>(_170);
    float _228 = _200 * _156;
    bool _230 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.0);
    bool _238 = _234 || _236;
    int _240 = _198 ? as_type<int>(_220) : as_type<int>(_170);
    float _242 = _136 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _244 = _154 ? as_type<float>(_226) : _170;
    float _246 = _164 ? as_type<float>(_240) : _170;
    float _248 = _214 * _158;
    float _250 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _252 = in.m_30.x;
    float _254 = in.m_30.y;
    float _256 = in.m_30.z;
    float _258 = fma(_244, _204, -0.5);
    float _260 = fma(_242, _246, -0.5);
    float _262 = _246;
    float _264 = _204;
    float _266 = _250;
    float _268 = _144;
    bool _270 = _154;
    bool _272 = _188;
    if (!_188)
    {
        _262 = _184;
    }
    float _274 = _262;
    float _276 = _274;
    if (!_238)
    {
        float _278 = _250 * _250;
        float _280 = _278 * 0.5;
        _264 = _280;
    }
    float _282 = _264;
    float _284 = 0.0;
    float _286 = _282;
    float _288 = _196;
    if (!_142)
    {
        _284 = _196;
    }
    float _290 = _284;
    float _292 = _290;
    if (_188)
    {
        _276 = _144;
    }
    float _294 = _276;
    if (!_238)
    {
        float _296 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _286 = _296;
    }
    float _298 = _286;
    bool _300 = !_238;
    float _302 = _298;
    if (!_300)
    {
        float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = log2(_304);
        float _308 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _310 = _308 + 1.0;
        float _312 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = _250 * _306;
        float _316 = 1.0 / _310;
        float _318 = _312 * 0.693147182464599609375;
        float _320 = exp2(_314);
        float _322 = 1.0 / _318;
        float _324 = _320 + (-1.0);
        float _326 = -_324;
        float _328 = fma(_326, _322, _250);
        float _330 = _328 * _316;
        float _332 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _302 = _332;
    }
    float _334 = _302;
    bool _336 = !_238;
    if (!_336)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _250 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _266 = _356;
    }
    float _358 = _266;
    float _360 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _362 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _364 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _202);
    float _366 = fma(_358, _208, _360);
    float _368 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = fma(_358, _206, _362);
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _374 = fma(_366, _224, _254);
    float _376 = fma(_358, _210, _368);
    float _378 = fma(_370, _224, _252);
    float _380 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].w, _372);
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = fma(_376, _224, _256);
    float _386 = _374 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _380);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _392 = _374 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = -_364;
    float _398 = fma(_388, _260, _396);
    float _400 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _390);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    float _404 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _402);
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _412 = _400;
    if (!_188)
    {
        _412 = _184;
    }
    float _414 = _412;
    float _416 = -_406;
    float _418 = _416 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _420 = _408 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _422 = -_410;
    float _424 = _422 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _426 = _414;
    if (_188)
    {
        _426 = _144;
    }
    float _428 = _426;
    float _430 = _418 * _418;
    float _432 = -_420;
    float _434 = _432 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    if (_188)
    {
        _268 = _138;
    }
    float _436 = _268;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _440 = fma(_424, _424, _430);
    float _442 = _184 * 6.283185482025146484375;
    float _444 = fma(_434, _434, _440);
    if (_148)
    {
        bool _446 = _184 > 0.5;
        _270 = _446;
    }
    bool _448 = _270;
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[83].z, _438);
    float _452 = rsqrt(_444);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _456 = _436 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _458 = _428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _462 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _212);
    float _464 = fma(_110, 0.310000002384185791015625, _442);
    float _466 = -_454;
    float _468 = fma(_456, 2.0, _466);
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_142)
    {
        bool _472 = _138 > 0.5;
        _272 = _472;
    }
    bool _474 = _272;
    float _476 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[78].z, _460);
    float _478 = _138 * 6.283185482025146484375;
    float _480 = fma(_458, -2.0, _470);
    float _482 = _464 * 0.15915493667125701904296875;
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _486 = fma(_110, 0.10999999940395355224609375, _478);
    float _488 = _424 * _452;
    float _490 = _434 * _452;
    float _492 = _418 * _452;
    float _494 = _486 * 0.15915493667125701904296875;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _498 = _488 * _496;
    float _500 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _502 = _490 * _500;
    float _504 = _482 * 6.283185482025146484375;
    float _506 = sin(_504);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _510 = -_498;
    float _512 = fma(_490, _508, _510);
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _516 = _492 * _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _520 = -_502;
    float _522 = fma(_492, _518, _520);
    float _524 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _480);
    float _526 = _512 * _512;
    float _528 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _530 = -_516;
    float _532 = fma(_488, _528, _530);
    float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _536 = as_type<int>(_482);
    int _538 = as_type<int>(_526);
    if (_148)
    {
        float _540 = -_196;
        float _542 = _540 + 1.0;
        _536 = as_type<int>(_542);
    }
    int _544 = _536;
    float _546 = fma(_522, _522, _526);
    if (_142)
    {
        float _548 = -_196;
        float _550 = _548 + 1.0;
        _538 = as_type<int>(_550);
    }
    int _552 = _538;
    float _554 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _476);
    float _556 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _558 = fma(_532, _532, _546);
    float _560 = _494 * 6.283185482025146484375;
    float _562 = sin(_560);
    if (_142)
    {
        float _564 = _474 ? as_type<float>(_552) : _196;
        _292 = _564;
    }
    float _566 = _292;
    float _568 = fma(_506, 0.12999999523162841796875, 1.0);
    if (_148)
    {
        float _570 = _448 ? as_type<float>(_544) : _196;
        _288 = _570;
    }
    float _572 = _288;
    float _574 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _462);
    float _576 = -_110;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _194);
    float _580 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _450);
    float _582 = -_110;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[81].x, _468);
    float _586 = rsqrt(_558);
    float _588 = _534 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _590 = -_524;
    float _592 = fma(_574, _258, _590);
    float _594 = fma(_556, _566, -0.5);
    float _596 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _598 = fma(_588, _572, -0.5);
    float _600 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _248);
    float _604 = fma(_562, 0.300000011920928955078125, _568);
    float _606 = -_170;
    float _608 = fma(_606, 0.5, 0.5);
    float _610 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _228);
    float _614 = _602 * _600;
    float _616 = _604 * _608;
    float _618 = fma(_580, _598, _584);
    bool _620 = _248 != 0.0;
    bool _622 = isnan(_248);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _532 * _586;
    float _632 = _522 * _586;
    float _634 = _512 * _586;
    float _636 = _612 * _596;
    float _638 = _488 * _630;
    float _640 = _492 * _632;
    float _642 = _490 * _634;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _216);
    float _646 = -_638;
    float _648 = fma(_490, _632, _646);
    float _650 = -_640;
    float _652 = fma(_488, _634, _650);
    float _654 = -_642;
    float _656 = fma(_492, _630, _654);
    float _658 = _644 * _610;
    float _660 = _614 * _648;
    float _662 = _614 * _652;
    float _664 = _614 * _656;
    float _666 = fma(_554, _594, _578);
    float _668 = fma(_636, _634, _660);
    float _670 = fma(_636, _630, _662);
    float _672 = fma(_636, _632, _664);
    bool _674 = _228 == 0.0;
    bool _676 = !_628;
    bool _678 = _674 && _676;
    float _680 = fma(_658, _492, _668);
    float _682 = fma(_658, _490, _670);
    float _684 = fma(_658, _488, _672);
    bool _686 = _216 == 0.0;
    bool _688 = _686 && _678;
    float _690 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _692 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _694 = in.m_45.x;
    float _696 = in.m_45.y;
    float _698 = in.m_45.z;
    float _700 = _600 * _616;
    float _702 = _700 * 2.0;
    float _704 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].z, _690);
    float _706 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _708 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].y, _692);
    float _710 = in.m_47.w;
    float _712 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].z, _704);
    float _714 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[8].x, _706);
    float _716 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].y, _708);
    float _718 = _410 + _684;
    float _720 = _610 * _712;
    float _722 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _714);
    float _724 = _600 * _716;
    float _726 = _420 + _682;
    float _728 = _720 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _730 = _720 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _732 = _596 * _722;
    float _734 = _398 + 0.5;
    float _736 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].y, _728);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].y, _730);
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    float _750 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _736);
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _738);
    float _754 = _696;
    float _756 = _694;
    float _758 = _698;
    if (!_688)
    {
        float _760 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[17].y, _696);
        _754 = _760;
    }
    float _762 = _754;
    if (!_688)
    {
        float _764 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _694);
        _756 = _764;
    }
    float _766 = _756;
    float _768 = _726 + _750;
    float _770 = _718 + _752;
    float _772 = _656 * _762;
    float _774 = _648 * _762;
    float _776 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].z, _768);
    float _778 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].x, _770);
    float _780 = fma(_632, _766, _772);
    float _782 = _652 * _762;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _786 = _776 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _790 = _778 + _788;
    float _792 = fma(_634, _766, _774);
    float _794 = fma(_630, _766, _782);
    float _796 = _786 * _786;
    float _798 = _406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_688)
    {
        float _800 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _698);
        _758 = _800;
    }
    float _802 = _758;
    out.m_49.w = _710;
    float _804 = fma(_790, _790, _796);
    float _806 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[11].x, _798);
    float _808 = fma(_488, _802, _780);
    float _810 = _592 + 0.5;
    float _812 = sqrt(_804);
    float _814 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _806);
    float _816 = _666 + 0.5;
    float _818 = _618 + 0.5;
    float _820 = fma(_492, _802, _792);
    float _822 = _406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _824 = _814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _826 = _720 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    out.m_51.x = _816;
    out.m_51.y = _734;
    out.m_51.z = _818;
    out.m_51.w = _810;
    float _828 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[10].x, _822);
    float _830 = _406 + _680;
    float _832 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].y, _826);
    float _834 = 1.0 / _824;
    float _836 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _828);
    float _838 = fma(_490, _802, _794);
    float _840 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _832);
    bool _842 = _812 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _846 = _830 + _840;
    out.m_53.x = _808;
    out.m_53.y = _820;
    out.m_53.z = _838;
    float _848 = _844 + _824;
    float _850 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].y, _846);
    float _852 = _848 * _834;
    float _854 = _852 * 0.5;
    float _856 = _808;
    float _858 = _838;
    float _860 = _820;
    float _862 = _826;
    if (!_842)
    {
        _856 = _778;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_842)
    {
        _858 = _776;
    }
    float _868 = _858;
    float _870 = _868;
    if (!_842)
    {
        _860 = _850;
    }
    float _872 = _860;
    bool _874 = !_842;
    float _876 = _872;
    if (!_874)
    {
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _882 = _812 + _880;
        float _884 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = rsqrt(_804);
        float _888 = _882 * _878;
        float _890 = _888 * 0.15915493667125701904296875;
        float _892 = _890 * 6.283185482025146484375;
        float _894 = cos(_892);
        float _896 = _890 * 6.283185482025146484375;
        float _898 = sin(_896);
        float _900 = _894 + (-1.0);
        float _902 = _900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = fma(_898, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = fma(_850, _894, _902);
        float _908 = _886 * _904;
        float _910 = fma(_790, _908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _912 = fma(_786, _908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _876 = _906;
        _862 = _908;
        _866 = _910;
        _870 = _912;
    }
    float _914 = _876;
    float _916 = _862;
    float _918 = _866;
    float _920 = _870;
    float _922 = _914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = _916;
    if (_748)
    {
        _924 = 1.0;
    }
    float _926 = _924;
    float _928 = _926;
    if (!_748)
    {
        float _930 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _932 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _930);
        float _934 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _938 = 1.0 / _932;
        float _940 = 1.0 / _936;
        float _942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _944 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _946 = fma(_938, _942, _944);
        float _948 = _946 * _940;
        float _950 = precise::clamp(_948, 0.0, 1.0);
        float _952 = -_950;
        float _954 = _952 + 1.0;
        _928 = _954;
    }
    float _956 = _928;
    float _958 = _914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _960 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _962 = _914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _966 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _958);
    float _968 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _960);
    float _970 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _972 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _964);
    float _974 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _966);
    float _976 = _968 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _978 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _970);
    float _980 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _984 = _976 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _986 = _976 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _988 = _976 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _990 = _976 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _992 = _978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _984);
    float _996 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _986);
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _988);
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _990);
    float _1002 = _980 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _994);
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _996);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _998);
    float _1010 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1000);
    bool _1012 = _956 > 0.0;
    bool _1014 = isnan(_956);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    float _1022 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1024 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1004);
    float _1026 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1006);
    float _1028 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    float _1030 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1008);
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1034 = _1026 + _1028;
    float _1036 = _1030 + _1028;
    float _1038 = _1028 * 0.5;
    float _1040 = _1034 * 0.5;
    float _1042 = _1036 * 0.5;
    float _1044 = fma(_1024, -0.5, _1038);
    out.m_55.x = _918;
    out.m_55.y = _914;
    out.m_55.z = _920;
    out.m_33.x = _1032;
    out.gl_Position.x = _1026;
    out.gl_Position.y = _1024;
    out.gl_Position.z = _1030;
    out.gl_Position.w = _1028;
    out.m_57.x = _1040;
    out.m_57.y = _1044;
    out.m_57.z = _1042;
    out.m_57.w = _1028;
    if (_1020)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1046;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

