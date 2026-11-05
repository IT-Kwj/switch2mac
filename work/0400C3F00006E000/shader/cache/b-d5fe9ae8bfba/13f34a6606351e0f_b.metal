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
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_49 [[attribute(8)]];
    float4 m_47 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
    float4 m_51 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _432 = false;
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
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_92);
        out.gl_Position.z = _1217;
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
    float _112 = 0.0;
    if (_106)
    {
        float _114 = float(_76);
        _112 = _114;
    }
    float _116 = _112;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    if (_122)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _86;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1285 = as_type<float>(_128);
        out.gl_Position.z = _1285;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    float _136 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_41.x;
    float _156 = in.m_41.y;
    float _158 = in.m_41.z;
    float _160 = in.m_43.w;
    float _162 = in.m_30.x;
    float _164 = in.m_30.y;
    float _166 = in.m_30.z;
    float _168 = 0.0;
    float _170 = _136;
    if (!_152)
    {
        float _172 = _136 * _136;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_152)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = _130 * _130;
    float _186 = _132 * _132;
    float _188 = _134 * _134;
    float _190 = fma(_138, _138, _184);
    float _192 = fma(_140, _140, _186);
    float _194 = fma(_142, _142, _188);
    float _196 = fma(_154, _154, _190);
    float _198 = fma(_156, _156, _192);
    float _200 = fma(_158, _158, _194);
    float _202 = sqrt(_196);
    float _204 = sqrt(_198);
    bool _206 = _202 > 0.0;
    float _208 = sqrt(_200);
    float _210 = in.m_35.x;
    float _212 = in.m_35.y;
    float _214 = in.m_35.z;
    bool _216 = _204 > 0.0;
    float _218 = 0.0;
    float _220 = _182;
    float _222 = _204;
    float _224 = _198;
    float _226 = _200;
    if (_206)
    {
        float _228 = rsqrt(_196);
        _218 = _228;
    }
    float _230 = _218;
    bool _232 = _208 > 0.0;
    bool _234 = !_152;
    float _236 = _208;
    float _238 = _230;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _136 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _136);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _268;
        _222 = _252;
    }
    float _270 = _220;
    float _272 = _222;
    bool _274 = !_152;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = 1.0 / _284;
        float _288 = _136 * _280;
        float _290 = exp2(_288);
        float _292 = -_290;
        float _294 = _292 + 1.0;
        float _296 = _294 * _286;
        _170 = _296;
    }
    float _298 = _170;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_206)
    {
        _276 = 0.0;
    }
    float _304 = _276;
    float _306 = _304;
    if (_206)
    {
        float _308 = _230 * _138;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = fma(_298, _210, _300);
    float _314 = fma(_298, _212, _302);
    float _316 = 0.0;
    float _318 = _312;
    float _320 = _314;
    if (!_206)
    {
        _316 = 0.0;
    }
    float _322 = _316;
    float _324 = _210;
    float _326 = _322;
    if (_216)
    {
        float _328 = rsqrt(_198);
        _324 = _328;
    }
    float _330 = _324;
    float _332 = fma(_312, _160, _162);
    float _334 = fma(_314, _160, _164);
    if (!_206)
    {
        _318 = 0.0;
    }
    float _336 = _318;
    float _338 = _336;
    if (_206)
    {
        float _340 = _230 * _130;
        _338 = _340;
    }
    float _342 = _338;
    if (_206)
    {
        float _344 = _230 * _154;
        _326 = _344;
    }
    float _346 = _326;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_45.x = _332;
    out.m_45.y = _334;
    float _350 = _212;
    if (_232)
    {
        float _352 = rsqrt(_200);
        _350 = _352;
    }
    float _354 = _350;
    float _356 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = 0.0;
    if (!_216)
    {
        _358 = 0.0;
        _320 = 0.0;
    }
    float _360 = _358;
    float _362 = _320;
    float _364 = _362;
    float _366 = _360;
    if (!_216)
    {
        _224 = 0.0;
    }
    float _368 = _224;
    float _370 = fma(_298, _214, _356);
    float _372 = _368;
    if (!_232)
    {
        _236 = 0.0;
    }
    float _374 = _236;
    float _376 = _374;
    if (!_232)
    {
        _238 = 0.0;
    }
    float _378 = _238;
    float _380 = _378;
    if (_216)
    {
        float _382 = _330 * _140;
        _364 = _382;
    }
    float _384 = _364;
    if (!_232)
    {
        _226 = 0.0;
    }
    float _386 = _226;
    float _388 = _386;
    if (_216)
    {
        float _390 = _330 * _132;
        _372 = _390;
    }
    float _392 = _372;
    if (_216)
    {
        float _394 = _330 * _156;
        _366 = _394;
    }
    float _396 = _366;
    float _398 = fma(_370, _160, _166);
    if (_232)
    {
        float _400 = _354 * _142;
        _376 = _400;
    }
    float _402 = _376;
    if (_232)
    {
        float _404 = _354 * _134;
        _380 = _404;
    }
    float _406 = _380;
    if (_232)
    {
        float _408 = _354 * _158;
        _388 = _408;
    }
    float _410 = _388;
    bool _412 = !_348;
    float _430;
    if (!_412)
    {
        float _414 = in.m_47.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_76);
        float _436 = 1.0 / _434;
        float _438 = _110 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_47.x;
    float _444 = _334 * _156;
    float _446 = in.m_49.x;
    float _448 = in.m_49.y;
    float _450 = in.m_49.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _452;
    float _456 = _334 * _140;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _458;
    float _462 = fma(_332, _154, _444);
    float _464 = 1.0 / _454;
    float _466 = fma(_332, _138, _456);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _470 = _440 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _440 + _476;
    float _480 = fma(_398, _158, _462);
    bool _482 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_440);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _460;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _498 = _440 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _500;
    float _504 = fma(_398, _142, _466);
    float _506 = fma(_442, 0.2000000476837158203125, 0.89999997615814208984375);
    float _508 = _442 * 100.0;
    float _510 = _470 * _464;
    float _512 = 1.0 / _474;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _516 = _446 > 0.0;
    float _518 = fma(_110, 0.00999999977648258209228515625, _508);
    bool _520 = _446 >= 0.0;
    bool _522 = isnan(_446);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = fma(_110, _514, _508);
    float _532 = _478 * _494;
    float _534 = abs(_446);
    float _536 = -_534;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[191].y, _530);
    float _540 = abs(_446);
    float _542 = -_540;
    float _544 = _542 + 1.0;
    float _546 = _518 * 0.15915493667125701904296875;
    float _548 = fma(_502, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _550 = _538 * 0.15915493667125701904296875;
    int _552 = _528 ? 0 : 1;
    float _554 = -_544;
    float _556 = fma(_554, _544, 1.0);
    float _558 = _498 * _512;
    float _560 = _550 * 6.283185482025146484375;
    float _562 = sin(_560);
    int _564 = ~_552;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _570;
    int _574 = _568;
    if (!_516)
    {
        int _576 = ~_552;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _594 = float(_580);
    float _596 = _550 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _604 = fma(_572, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _606 = fma(_588, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _608 = _594 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _610 = fma(_584, _558, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _612 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _614 = fma(_602, _558, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _616 = _562 * _608;
    bool _618 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _620 = isnan(_440);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _546 * 6.283185482025146484375;
    float _632 = sin(_630);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _638;
    float _642 = -_628;
    float _644 = _642 + 1.0;
    float _646 = _616 * 0.15915493667125701904296875;
    float _648 = _598 * _556;
    bool _650 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _652 = isnan(_440);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _662;
    bool _666 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_440);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _648 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _680 = fma(_636, _532, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _682 = -_660;
    float _684 = _682 + 1.0;
    float _686 = _648 * _608;
    float _688 = _676 * _644;
    float _690 = -_676;
    float _692 = _690 + 1.0;
    float _694 = _628 * _684;
    float _696 = fma(_664, _532, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _698 = fma(_640, _532, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _700 = _492 * _692;
    float _702 = _678 * 0.15915493667125701904296875;
    float _704 = -_492;
    float _706 = _704 + 1.0;
    float _708 = _604 * _700;
    float _710 = _702 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _606 * _700;
    float _716 = _686 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _718 = fma(_632, 2.0, 2.0);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _548 * _700;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].x, _708);
    float _726 = _716 * 0.15915493667125701904296875;
    float _728 = _702 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].y, _714);
    float _734 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].z, _722);
    float _736 = fma(_610, _688, _724);
    float _738 = fma(_720, 0.949999988079071044921875, -1.0);
    float _740 = fma(_612, _688, _732);
    float _742 = fma(_614, _688, _734);
    float _744 = in.m_43.x;
    float _746 = in.m_43.y;
    float _748 = in.m_43.z;
    float _750 = _646 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_696, _694, _736);
    float _756 = _712 * _450;
    float _758 = in.m_51.x;
    float _760 = fma(_680, _694, _740);
    float _762 = fma(_698, _694, _742);
    float _764 = _530 * 0.15915493667125701904296875;
    float _766 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].x, _754);
    float _768 = _646 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _730 * _450;
    float _774 = -_756;
    float _776 = fma(_730, _448, _774);
    float _778 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].z, _762);
    float _780 = fma(_712, _448, _772);
    float _782 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].y, _760);
    float _784 = _334 * _132;
    float _786 = _726 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _752 * _446;
    float _792 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _794 = fma(_332, _130, _784);
    float _796 = _782 * _746;
    float _798 = _726 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_780, _770, _790);
    float _804 = _770 * _446;
    float _806 = _766 * _744;
    float _808 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _810 = _778 * _748;
    float _812 = -_804;
    float _814 = fma(_780, _752, _812);
    float _816 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _818 = _776 * _788;
    float _820 = _764 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = -_814;
    float _826 = _824 + _450;
    float _828 = in.m_41.w;
    float _830 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _832 = fma(_398, _134, _794);
    float _834 = fma(_826, _758, _814);
    float _836 = _776 * _800;
    float _838 = fma(_802, _800, _818);
    float _840 = in.m_39.w;
    float _842 = -_836;
    float _844 = fma(_802, _788, _842);
    float _846 = -_838;
    float _848 = _846 + _448;
    float _850 = -_844;
    float _852 = _850 + _446;
    float _854 = fma(_848, _758, _838);
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[191].w, _834);
    float _858 = fma(_852, _758, _844);
    float _860 = -_448;
    float _862 = _854 + _860;
    bool _864 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _866 = isnan(0.5);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _872 = _868 || _870;
    float _874 = -_450;
    float _876 = _856 + _874;
    float _878 = -_446;
    float _880 = _858 + _878;
    float _882 = fma(_792, _862, _448);
    float _884 = fma(_792, _876, _450);
    float _886 = fma(_792, _880, _446);
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _890 = _480 + _828;
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _896 = _808 * _888;
    float _898 = _504 + _840;
    float _900 = _830 * _892;
    float _902 = _816 * _894;
    float _904 = _896 * _396;
    float _906 = _896 * _384;
    float _908 = _896 * _392;
    float _910 = fma(_902, _346, _904);
    float _912 = fma(_902, _310, _906);
    float _914 = fma(_902, _342, _908);
    float _916 = in.m_37.w;
    float _918 = fma(_900, _410, _910);
    float _920 = fma(_900, _402, _912);
    float _922 = fma(_900, _406, _914);
    float _924 = _890 + _918;
    float _926 = _898 + _920;
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _924 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _926 + _932;
    float _936 = _930 * _930;
    float _938 = fma(_934, _934, _936);
    float _940 = sqrt(_938);
    float _942 = _832 + _916;
    float _944 = _942 + _922;
    bool _946 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _948 = _936;
    float _950 = 0.5;
    float _952 = _922;
    if (!_946)
    {
        _948 = _926;
    }
    float _954 = _948;
    float _956 = _954;
    if (!_946)
    {
        _950 = _924;
    }
    float _958 = _950;
    float _960 = _958;
    if (!_946)
    {
        _952 = _944;
    }
    float _962 = _952;
    bool _964 = !_946;
    float _966 = _962;
    if (!_964)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _972 = _940 + _970;
        float _974 = rsqrt(_938);
        float _976 = _972 * _968;
        float _978 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = _976 * 0.15915493667125701904296875;
        float _982 = _980 * 6.283185482025146484375;
        float _984 = cos(_982);
        float _986 = _980 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _984 + (-1.0);
        float _992 = fma(_988, _978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _994 = _990 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _974 * _992;
        float _998 = fma(_944, _984, _994);
        float _1000 = fma(_934, _996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1002 = fma(_930, _996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _998;
        _960 = _1002;
        _956 = _1000;
    }
    float _1004 = _966;
    float _1006 = _960;
    float _1008 = _956;
    float _1010 = _1004;
    float _1012 = _1008;
    float _1014 = _1006;
    if (!_872)
    {
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1018 = _942 + _1016;
        float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1022 = _898 + _1020;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1026 = -_942;
        float _1028 = _1026 + _1004;
        float _1030 = _1018 * _1018;
        float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1034 = _890 + _1032;
        float _1036 = -_890;
        float _1038 = _1036 + _1006;
        float _1040 = fma(_1022, _1022, _1030);
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1044 = fma(_1034, _1034, _1040);
        float _1046 = sqrt(_1044);
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1050 = precise::min(_1046, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1052 = _1050 * _1042;
        float _1054 = -_898;
        float _1056 = _1054 + _1008;
        float _1058 = _1048 * _1052;
        float _1060 = fma(_1056, _1058, _898);
        float _1062 = fma(_1028, _1058, _942);
        float _1064 = fma(_1038, _1058, _890);
        _1010 = _1062;
        _1012 = _1060;
        _1014 = _1064;
    }
    float _1066 = _1010;
    float _1068 = _1012;
    float _1070 = _1014;
    float _1072 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1082 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1074);
    float _1084 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1076);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1078);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1080);
    float _1090 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1082);
    float _1092 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1084);
    float _1094 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1086);
    float _1096 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1098 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1102 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1106 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1112 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1104);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1106);
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1108);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1110);
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1114);
    float _1124 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1126 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1116);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_33.x = 1.0;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1120);
    float _1142 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1148 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1150 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1118);
    float _1158 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1122);
    float _1160 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1126);
    out.m_53.w = _1142;
    out.m_55.x = _1144;
    out.m_55.y = _1146;
    out.m_55.z = _1148;
    out.m_57.x = _1150;
    out.m_57.y = _1152;
    out.m_57.z = _1154;
    out.gl_Position.x = _1156;
    out.gl_Position.y = _1140;
    out.gl_Position.z = _1158;
    out.gl_Position.w = _1160;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _432 = false;
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
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_92);
        out.gl_Position.z = _1217;
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
    float _112 = 0.0;
    if (_106)
    {
        float _114 = float(_76);
        _112 = _114;
    }
    float _116 = _112;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    if (_122)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _86;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1285 = as_type<float>(_128);
        out.gl_Position.z = _1285;
    }
    if (_122)
    {
        return out;
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    float _136 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_41.x;
    float _156 = in.m_41.y;
    float _158 = in.m_41.z;
    float _160 = in.m_43.w;
    float _162 = in.m_30.x;
    float _164 = in.m_30.y;
    float _166 = in.m_30.z;
    float _168 = 0.0;
    float _170 = _136;
    if (!_152)
    {
        float _172 = _136 * _136;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_152)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = _130 * _130;
    float _186 = _132 * _132;
    float _188 = _134 * _134;
    float _190 = fma(_138, _138, _184);
    float _192 = fma(_140, _140, _186);
    float _194 = fma(_142, _142, _188);
    float _196 = fma(_154, _154, _190);
    float _198 = fma(_156, _156, _192);
    float _200 = fma(_158, _158, _194);
    float _202 = sqrt(_196);
    float _204 = sqrt(_198);
    bool _206 = _202 > 0.0;
    float _208 = sqrt(_200);
    float _210 = in.m_35.x;
    float _212 = in.m_35.y;
    float _214 = in.m_35.z;
    bool _216 = _204 > 0.0;
    float _218 = 0.0;
    float _220 = _182;
    float _222 = _204;
    float _224 = _198;
    float _226 = _200;
    if (_206)
    {
        float _228 = rsqrt(_196);
        _218 = _228;
    }
    float _230 = _218;
    bool _232 = _208 > 0.0;
    bool _234 = !_152;
    float _236 = _208;
    float _238 = _230;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _136 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _136);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _268;
        _222 = _252;
    }
    float _270 = _220;
    float _272 = _222;
    bool _274 = !_152;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = 1.0 / _284;
        float _288 = _136 * _280;
        float _290 = exp2(_288);
        float _292 = -_290;
        float _294 = _292 + 1.0;
        float _296 = _294 * _286;
        _170 = _296;
    }
    float _298 = _170;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_206)
    {
        _276 = 0.0;
    }
    float _304 = _276;
    float _306 = _304;
    if (_206)
    {
        float _308 = _230 * _138;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = fma(_298, _210, _300);
    float _314 = fma(_298, _212, _302);
    float _316 = 0.0;
    float _318 = _312;
    float _320 = _314;
    if (!_206)
    {
        _316 = 0.0;
    }
    float _322 = _316;
    float _324 = _210;
    float _326 = _322;
    if (_216)
    {
        float _328 = rsqrt(_198);
        _324 = _328;
    }
    float _330 = _324;
    float _332 = fma(_312, _160, _162);
    float _334 = fma(_314, _160, _164);
    if (!_206)
    {
        _318 = 0.0;
    }
    float _336 = _318;
    float _338 = _336;
    if (_206)
    {
        float _340 = _230 * _130;
        _338 = _340;
    }
    float _342 = _338;
    if (_206)
    {
        float _344 = _230 * _154;
        _326 = _344;
    }
    float _346 = _326;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_45.x = _332;
    out.m_45.y = _334;
    float _350 = _212;
    if (_232)
    {
        float _352 = rsqrt(_200);
        _350 = _352;
    }
    float _354 = _350;
    float _356 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = 0.0;
    if (!_216)
    {
        _358 = 0.0;
        _320 = 0.0;
    }
    float _360 = _358;
    float _362 = _320;
    float _364 = _362;
    float _366 = _360;
    if (!_216)
    {
        _224 = 0.0;
    }
    float _368 = _224;
    float _370 = fma(_298, _214, _356);
    float _372 = _368;
    if (!_232)
    {
        _236 = 0.0;
    }
    float _374 = _236;
    float _376 = _374;
    if (!_232)
    {
        _238 = 0.0;
    }
    float _378 = _238;
    float _380 = _378;
    if (_216)
    {
        float _382 = _330 * _140;
        _364 = _382;
    }
    float _384 = _364;
    if (!_232)
    {
        _226 = 0.0;
    }
    float _386 = _226;
    float _388 = _386;
    if (_216)
    {
        float _390 = _330 * _132;
        _372 = _390;
    }
    float _392 = _372;
    if (_216)
    {
        float _394 = _330 * _156;
        _366 = _394;
    }
    float _396 = _366;
    float _398 = fma(_370, _160, _166);
    if (_232)
    {
        float _400 = _354 * _142;
        _376 = _400;
    }
    float _402 = _376;
    if (_232)
    {
        float _404 = _354 * _134;
        _380 = _404;
    }
    float _406 = _380;
    if (_232)
    {
        float _408 = _354 * _158;
        _388 = _408;
    }
    float _410 = _388;
    bool _412 = !_348;
    float _430;
    if (!_412)
    {
        float _414 = in.m_47.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_76);
        float _436 = 1.0 / _434;
        float _438 = _110 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_47.x;
    float _444 = _334 * _156;
    float _446 = in.m_49.x;
    float _448 = in.m_49.y;
    float _450 = in.m_49.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _452;
    float _456 = _334 * _140;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _458;
    float _462 = fma(_332, _154, _444);
    float _464 = 1.0 / _454;
    float _466 = fma(_332, _138, _456);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _470 = _440 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _440 + _476;
    float _480 = fma(_398, _158, _462);
    bool _482 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_440);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _460;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _498 = _440 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _500;
    float _504 = fma(_398, _142, _466);
    float _506 = fma(_442, 0.2000000476837158203125, 0.89999997615814208984375);
    float _508 = _442 * 100.0;
    float _510 = _470 * _464;
    float _512 = 1.0 / _474;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _516 = _446 > 0.0;
    float _518 = fma(_110, 0.00999999977648258209228515625, _508);
    bool _520 = _446 >= 0.0;
    bool _522 = isnan(_446);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = fma(_110, _514, _508);
    float _532 = _478 * _494;
    float _534 = abs(_446);
    float _536 = -_534;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[191].y, _530);
    float _540 = abs(_446);
    float _542 = -_540;
    float _544 = _542 + 1.0;
    float _546 = _518 * 0.15915493667125701904296875;
    float _548 = fma(_502, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _550 = _538 * 0.15915493667125701904296875;
    int _552 = _528 ? 0 : 1;
    float _554 = -_544;
    float _556 = fma(_554, _544, 1.0);
    float _558 = _498 * _512;
    float _560 = _550 * 6.283185482025146484375;
    float _562 = sin(_560);
    int _564 = ~_552;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _570;
    int _574 = _568;
    if (!_516)
    {
        int _576 = ~_552;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _594 = float(_580);
    float _596 = _550 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _604 = fma(_572, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _606 = fma(_588, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _608 = _594 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _610 = fma(_584, _558, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _612 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _614 = fma(_602, _558, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _616 = _562 * _608;
    bool _618 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _620 = isnan(_440);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _546 * 6.283185482025146484375;
    float _632 = sin(_630);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _638;
    float _642 = -_628;
    float _644 = _642 + 1.0;
    float _646 = _616 * 0.15915493667125701904296875;
    float _648 = _598 * _556;
    bool _650 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _652 = isnan(_440);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _662;
    bool _666 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_440);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _648 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _680 = fma(_636, _532, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _682 = -_660;
    float _684 = _682 + 1.0;
    float _686 = _648 * _608;
    float _688 = _676 * _644;
    float _690 = -_676;
    float _692 = _690 + 1.0;
    float _694 = _628 * _684;
    float _696 = fma(_664, _532, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _698 = fma(_640, _532, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _700 = _492 * _692;
    float _702 = _678 * 0.15915493667125701904296875;
    float _704 = -_492;
    float _706 = _704 + 1.0;
    float _708 = _604 * _700;
    float _710 = _702 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _606 * _700;
    float _716 = _686 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _718 = fma(_632, 2.0, 2.0);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _548 * _700;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].x, _708);
    float _726 = _716 * 0.15915493667125701904296875;
    float _728 = _702 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].y, _714);
    float _734 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].z, _722);
    float _736 = fma(_610, _688, _724);
    float _738 = fma(_720, 0.949999988079071044921875, -1.0);
    float _740 = fma(_612, _688, _732);
    float _742 = fma(_614, _688, _734);
    float _744 = in.m_43.x;
    float _746 = in.m_43.y;
    float _748 = in.m_43.z;
    float _750 = _646 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_696, _694, _736);
    float _756 = _712 * _450;
    float _758 = in.m_51.x;
    float _760 = fma(_680, _694, _740);
    float _762 = fma(_698, _694, _742);
    float _764 = _530 * 0.15915493667125701904296875;
    float _766 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].x, _754);
    float _768 = _646 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _730 * _450;
    float _774 = -_756;
    float _776 = fma(_730, _448, _774);
    float _778 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].z, _762);
    float _780 = fma(_712, _448, _772);
    float _782 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].y, _760);
    float _784 = _334 * _132;
    float _786 = _726 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _752 * _446;
    float _792 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _794 = fma(_332, _130, _784);
    float _796 = _782 * _746;
    float _798 = _726 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_780, _770, _790);
    float _804 = _770 * _446;
    float _806 = _766 * _744;
    float _808 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _810 = _778 * _748;
    float _812 = -_804;
    float _814 = fma(_780, _752, _812);
    float _816 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _818 = _776 * _788;
    float _820 = _764 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = -_814;
    float _826 = _824 + _450;
    float _828 = in.m_41.w;
    float _830 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _832 = fma(_398, _134, _794);
    float _834 = fma(_826, _758, _814);
    float _836 = _776 * _800;
    float _838 = fma(_802, _800, _818);
    float _840 = in.m_39.w;
    float _842 = -_836;
    float _844 = fma(_802, _788, _842);
    float _846 = -_838;
    float _848 = _846 + _448;
    float _850 = -_844;
    float _852 = _850 + _446;
    float _854 = fma(_848, _758, _838);
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[191].w, _834);
    float _858 = fma(_852, _758, _844);
    float _860 = -_448;
    float _862 = _854 + _860;
    bool _864 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _866 = isnan(0.5);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _872 = _868 || _870;
    float _874 = -_450;
    float _876 = _856 + _874;
    float _878 = -_446;
    float _880 = _858 + _878;
    float _882 = fma(_792, _862, _448);
    float _884 = fma(_792, _876, _450);
    float _886 = fma(_792, _880, _446);
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _890 = _480 + _828;
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _896 = _808 * _888;
    float _898 = _504 + _840;
    float _900 = _830 * _892;
    float _902 = _816 * _894;
    float _904 = _896 * _396;
    float _906 = _896 * _384;
    float _908 = _896 * _392;
    float _910 = fma(_902, _346, _904);
    float _912 = fma(_902, _310, _906);
    float _914 = fma(_902, _342, _908);
    float _916 = in.m_37.w;
    float _918 = fma(_900, _410, _910);
    float _920 = fma(_900, _402, _912);
    float _922 = fma(_900, _406, _914);
    float _924 = _890 + _918;
    float _926 = _898 + _920;
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _924 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _926 + _932;
    float _936 = _930 * _930;
    float _938 = fma(_934, _934, _936);
    float _940 = sqrt(_938);
    float _942 = _832 + _916;
    float _944 = _942 + _922;
    bool _946 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _948 = _936;
    float _950 = 0.5;
    float _952 = _922;
    if (!_946)
    {
        _948 = _926;
    }
    float _954 = _948;
    float _956 = _954;
    if (!_946)
    {
        _950 = _924;
    }
    float _958 = _950;
    float _960 = _958;
    if (!_946)
    {
        _952 = _944;
    }
    float _962 = _952;
    bool _964 = !_946;
    float _966 = _962;
    if (!_964)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _972 = _940 + _970;
        float _974 = rsqrt(_938);
        float _976 = _972 * _968;
        float _978 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = _976 * 0.15915493667125701904296875;
        float _982 = _980 * 6.283185482025146484375;
        float _984 = cos(_982);
        float _986 = _980 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _984 + (-1.0);
        float _992 = fma(_988, _978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _994 = _990 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _974 * _992;
        float _998 = fma(_944, _984, _994);
        float _1000 = fma(_934, _996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1002 = fma(_930, _996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _998;
        _960 = _1002;
        _956 = _1000;
    }
    float _1004 = _966;
    float _1006 = _960;
    float _1008 = _956;
    float _1010 = _1004;
    float _1012 = _1008;
    float _1014 = _1006;
    if (!_872)
    {
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1018 = _942 + _1016;
        float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1022 = _898 + _1020;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1026 = -_942;
        float _1028 = _1026 + _1004;
        float _1030 = _1018 * _1018;
        float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1034 = _890 + _1032;
        float _1036 = -_890;
        float _1038 = _1036 + _1006;
        float _1040 = fma(_1022, _1022, _1030);
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1044 = fma(_1034, _1034, _1040);
        float _1046 = sqrt(_1044);
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1050 = precise::min(_1046, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1052 = _1050 * _1042;
        float _1054 = -_898;
        float _1056 = _1054 + _1008;
        float _1058 = _1048 * _1052;
        float _1060 = fma(_1056, _1058, _898);
        float _1062 = fma(_1028, _1058, _942);
        float _1064 = fma(_1038, _1058, _890);
        _1010 = _1062;
        _1012 = _1060;
        _1014 = _1064;
    }
    float _1066 = _1010;
    float _1068 = _1012;
    float _1070 = _1014;
    float _1072 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1082 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1074);
    float _1084 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1076);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1078);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1080);
    float _1090 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1082);
    float _1092 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1084);
    float _1094 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1086);
    float _1096 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1098 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1102 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1106 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1112 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1104);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1106);
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1108);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1110);
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1114);
    float _1124 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1126 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1116);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_33.x = 1.0;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1120);
    float _1142 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1148 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1150 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1118);
    float _1158 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1122);
    float _1160 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1126);
    out.m_53.w = _1142;
    out.m_55.x = _1144;
    out.m_55.y = _1146;
    out.m_55.z = _1148;
    out.m_57.x = _1150;
    out.m_57.y = _1152;
    out.m_57.z = _1154;
    out.gl_Position.x = _1156;
    out.gl_Position.y = _1140;
    out.gl_Position.z = _1158;
    out.gl_Position.w = _1160;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _432 = false;
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
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_92);
        out.gl_Position.z = _1217;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = 0.0;
    if (_106)
    {
        float _114 = float(_76);
        _112 = _114;
    }
    float _116 = _112;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    if (_122)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _86;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1285 = as_type<float>(_128);
        out.gl_Position.z = _1285;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    float _136 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _138 = in.m_39.x;
    float _140 = in.m_39.y;
    float _142 = in.m_39.z;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_41.x;
    float _156 = in.m_41.y;
    float _158 = in.m_41.z;
    float _160 = in.m_43.w;
    float _162 = in.m_30.x;
    float _164 = in.m_30.y;
    float _166 = in.m_30.z;
    float _168 = 0.0;
    float _170 = _136;
    if (!_152)
    {
        float _172 = _136 * _136;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_152)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = _130 * _130;
    float _186 = _132 * _132;
    float _188 = _134 * _134;
    float _190 = fma(_138, _138, _184);
    float _192 = fma(_140, _140, _186);
    float _194 = fma(_142, _142, _188);
    float _196 = fma(_154, _154, _190);
    float _198 = fma(_156, _156, _192);
    float _200 = fma(_158, _158, _194);
    float _202 = sqrt(_196);
    float _204 = sqrt(_198);
    bool _206 = _202 > 0.0;
    float _208 = sqrt(_200);
    float _210 = in.m_35.x;
    float _212 = in.m_35.y;
    float _214 = in.m_35.z;
    bool _216 = _204 > 0.0;
    float _218 = 0.0;
    float _220 = _182;
    float _222 = _204;
    float _224 = _198;
    float _226 = _200;
    if (_206)
    {
        float _228 = rsqrt(_196);
        _218 = _228;
    }
    float _230 = _218;
    bool _232 = _208 > 0.0;
    bool _234 = !_152;
    float _236 = _208;
    float _238 = _230;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _136 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _136);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _268;
        _222 = _252;
    }
    float _270 = _220;
    float _272 = _222;
    bool _274 = !_152;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = 1.0 / _284;
        float _288 = _136 * _280;
        float _290 = exp2(_288);
        float _292 = -_290;
        float _294 = _292 + 1.0;
        float _296 = _294 * _286;
        _170 = _296;
    }
    float _298 = _170;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_206)
    {
        _276 = 0.0;
    }
    float _304 = _276;
    float _306 = _304;
    if (_206)
    {
        float _308 = _230 * _138;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = fma(_298, _210, _300);
    float _314 = fma(_298, _212, _302);
    float _316 = 0.0;
    float _318 = _312;
    float _320 = _314;
    if (!_206)
    {
        _316 = 0.0;
    }
    float _322 = _316;
    float _324 = _210;
    float _326 = _322;
    if (_216)
    {
        float _328 = rsqrt(_198);
        _324 = _328;
    }
    float _330 = _324;
    float _332 = fma(_312, _160, _162);
    float _334 = fma(_314, _160, _164);
    if (!_206)
    {
        _318 = 0.0;
    }
    float _336 = _318;
    float _338 = _336;
    if (_206)
    {
        float _340 = _230 * _130;
        _338 = _340;
    }
    float _342 = _338;
    if (_206)
    {
        float _344 = _230 * _154;
        _326 = _344;
    }
    float _346 = _326;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_45.x = _332;
    out.m_45.y = _334;
    float _350 = _212;
    if (_232)
    {
        float _352 = rsqrt(_200);
        _350 = _352;
    }
    float _354 = _350;
    float _356 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = 0.0;
    if (!_216)
    {
        _358 = 0.0;
        _320 = 0.0;
    }
    float _360 = _358;
    float _362 = _320;
    float _364 = _362;
    float _366 = _360;
    if (!_216)
    {
        _224 = 0.0;
    }
    float _368 = _224;
    float _370 = fma(_298, _214, _356);
    float _372 = _368;
    if (!_232)
    {
        _236 = 0.0;
    }
    float _374 = _236;
    float _376 = _374;
    if (!_232)
    {
        _238 = 0.0;
    }
    float _378 = _238;
    float _380 = _378;
    if (_216)
    {
        float _382 = _330 * _140;
        _364 = _382;
    }
    float _384 = _364;
    if (!_232)
    {
        _226 = 0.0;
    }
    float _386 = _226;
    float _388 = _386;
    if (_216)
    {
        float _390 = _330 * _132;
        _372 = _390;
    }
    float _392 = _372;
    if (_216)
    {
        float _394 = _330 * _156;
        _366 = _394;
    }
    float _396 = _366;
    float _398 = fma(_370, _160, _166);
    if (_232)
    {
        float _400 = _354 * _142;
        _376 = _400;
    }
    float _402 = _376;
    if (_232)
    {
        float _404 = _354 * _134;
        _380 = _404;
    }
    float _406 = _380;
    if (_232)
    {
        float _408 = _354 * _158;
        _388 = _408;
    }
    float _410 = _388;
    bool _412 = !_348;
    float _430;
    if (!_412)
    {
        float _414 = in.m_47.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_76);
        float _436 = 1.0 / _434;
        float _438 = _110 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_47.x;
    float _444 = _334 * _156;
    float _446 = in.m_49.x;
    float _448 = in.m_49.y;
    float _450 = in.m_49.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _452;
    float _456 = _334 * _140;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _458;
    float _462 = fma(_332, _154, _444);
    float _464 = 1.0 / _454;
    float _466 = fma(_332, _138, _456);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _470 = _440 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _440 + _476;
    float _480 = fma(_398, _158, _462);
    bool _482 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _484 = isnan(_440);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = 1.0 / _460;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _498 = _440 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _500;
    float _504 = fma(_398, _142, _466);
    float _506 = fma(_442, 0.2000000476837158203125, 0.89999997615814208984375);
    float _508 = _442 * 100.0;
    float _510 = _470 * _464;
    float _512 = 1.0 / _474;
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _516 = _446 > 0.0;
    float _518 = fma(_110, 0.00999999977648258209228515625, _508);
    bool _520 = _446 >= 0.0;
    bool _522 = isnan(_446);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = fma(_110, _514, _508);
    float _532 = _478 * _494;
    float _534 = abs(_446);
    float _536 = -_534;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[191].y, _530);
    float _540 = abs(_446);
    float _542 = -_540;
    float _544 = _542 + 1.0;
    float _546 = _518 * 0.15915493667125701904296875;
    float _548 = fma(_502, _510, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _550 = _538 * 0.15915493667125701904296875;
    int _552 = _528 ? 0 : 1;
    float _554 = -_544;
    float _556 = fma(_554, _544, 1.0);
    float _558 = _498 * _512;
    float _560 = _550 * 6.283185482025146484375;
    float _562 = sin(_560);
    int _564 = ~_552;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _570;
    int _574 = _568;
    if (!_516)
    {
        int _576 = ~_552;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _594 = float(_580);
    float _596 = _550 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _604 = fma(_572, _510, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _606 = fma(_588, _510, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _608 = _594 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _610 = fma(_584, _558, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _612 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _614 = fma(_602, _558, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _616 = _562 * _608;
    bool _618 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _620 = isnan(_440);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _546 * 6.283185482025146484375;
    float _632 = sin(_630);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _638;
    float _642 = -_628;
    float _644 = _642 + 1.0;
    float _646 = _616 * 0.15915493667125701904296875;
    float _648 = _598 * _556;
    bool _650 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _652 = isnan(_440);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _662;
    bool _666 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _668 = isnan(_440);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _648 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _680 = fma(_636, _532, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _682 = -_660;
    float _684 = _682 + 1.0;
    float _686 = _648 * _608;
    float _688 = _676 * _644;
    float _690 = -_676;
    float _692 = _690 + 1.0;
    float _694 = _628 * _684;
    float _696 = fma(_664, _532, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _698 = fma(_640, _532, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _700 = _492 * _692;
    float _702 = _678 * 0.15915493667125701904296875;
    float _704 = -_492;
    float _706 = _704 + 1.0;
    float _708 = _604 * _700;
    float _710 = _702 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _606 * _700;
    float _716 = _686 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _718 = fma(_632, 2.0, 2.0);
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _548 * _700;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].x, _708);
    float _726 = _716 * 0.15915493667125701904296875;
    float _728 = _702 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].y, _714);
    float _734 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[143].z, _722);
    float _736 = fma(_610, _688, _724);
    float _738 = fma(_720, 0.949999988079071044921875, -1.0);
    float _740 = fma(_612, _688, _732);
    float _742 = fma(_614, _688, _734);
    float _744 = in.m_43.x;
    float _746 = in.m_43.y;
    float _748 = in.m_43.z;
    float _750 = _646 * 6.283185482025146484375;
    float _752 = cos(_750);
    float _754 = fma(_696, _694, _736);
    float _756 = _712 * _450;
    float _758 = in.m_51.x;
    float _760 = fma(_680, _694, _740);
    float _762 = fma(_698, _694, _742);
    float _764 = _530 * 0.15915493667125701904296875;
    float _766 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].x, _754);
    float _768 = _646 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _730 * _450;
    float _774 = -_756;
    float _776 = fma(_730, _448, _774);
    float _778 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].z, _762);
    float _780 = fma(_712, _448, _772);
    float _782 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[146].y, _760);
    float _784 = _334 * _132;
    float _786 = _726 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _752 * _446;
    float _792 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _794 = fma(_332, _130, _784);
    float _796 = _782 * _746;
    float _798 = _726 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_780, _770, _790);
    float _804 = _770 * _446;
    float _806 = _766 * _744;
    float _808 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _810 = _778 * _748;
    float _812 = -_804;
    float _814 = fma(_780, _752, _812);
    float _816 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _818 = _776 * _788;
    float _820 = _764 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = -_814;
    float _826 = _824 + _450;
    float _828 = in.m_41.w;
    float _830 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _832 = fma(_398, _134, _794);
    float _834 = fma(_826, _758, _814);
    float _836 = _776 * _800;
    float _838 = fma(_802, _800, _818);
    float _840 = in.m_39.w;
    float _842 = -_836;
    float _844 = fma(_802, _788, _842);
    float _846 = -_838;
    float _848 = _846 + _448;
    float _850 = -_844;
    float _852 = _850 + _446;
    float _854 = fma(_848, _758, _838);
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[191].w, _834);
    float _858 = fma(_852, _758, _844);
    float _860 = -_448;
    float _862 = _854 + _860;
    bool _864 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _866 = isnan(0.5);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _872 = _868 || _870;
    float _874 = -_450;
    float _876 = _856 + _874;
    float _878 = -_446;
    float _880 = _858 + _878;
    float _882 = fma(_792, _862, _448);
    float _884 = fma(_792, _876, _450);
    float _886 = fma(_792, _880, _446);
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _890 = _480 + _828;
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _896 = _808 * _888;
    float _898 = _504 + _840;
    float _900 = _830 * _892;
    float _902 = _816 * _894;
    float _904 = _896 * _396;
    float _906 = _896 * _384;
    float _908 = _896 * _392;
    float _910 = fma(_902, _346, _904);
    float _912 = fma(_902, _310, _906);
    float _914 = fma(_902, _342, _908);
    float _916 = in.m_37.w;
    float _918 = fma(_900, _410, _910);
    float _920 = fma(_900, _402, _912);
    float _922 = fma(_900, _406, _914);
    float _924 = _890 + _918;
    float _926 = _898 + _920;
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _924 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _926 + _932;
    float _936 = _930 * _930;
    float _938 = fma(_934, _934, _936);
    float _940 = sqrt(_938);
    float _942 = _832 + _916;
    float _944 = _942 + _922;
    bool _946 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _948 = _936;
    float _950 = 0.5;
    float _952 = _922;
    if (!_946)
    {
        _948 = _926;
    }
    float _954 = _948;
    float _956 = _954;
    if (!_946)
    {
        _950 = _924;
    }
    float _958 = _950;
    float _960 = _958;
    if (!_946)
    {
        _952 = _944;
    }
    float _962 = _952;
    bool _964 = !_946;
    float _966 = _962;
    if (!_964)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _972 = _940 + _970;
        float _974 = rsqrt(_938);
        float _976 = _972 * _968;
        float _978 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = _976 * 0.15915493667125701904296875;
        float _982 = _980 * 6.283185482025146484375;
        float _984 = cos(_982);
        float _986 = _980 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _984 + (-1.0);
        float _992 = fma(_988, _978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _994 = _990 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = _974 * _992;
        float _998 = fma(_944, _984, _994);
        float _1000 = fma(_934, _996, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1002 = fma(_930, _996, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _998;
        _960 = _1002;
        _956 = _1000;
    }
    float _1004 = _966;
    float _1006 = _960;
    float _1008 = _956;
    float _1010 = _1004;
    float _1012 = _1008;
    float _1014 = _1006;
    if (!_872)
    {
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1018 = _942 + _1016;
        float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1022 = _898 + _1020;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1026 = -_942;
        float _1028 = _1026 + _1004;
        float _1030 = _1018 * _1018;
        float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1034 = _890 + _1032;
        float _1036 = -_890;
        float _1038 = _1036 + _1006;
        float _1040 = fma(_1022, _1022, _1030);
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1044 = fma(_1034, _1034, _1040);
        float _1046 = sqrt(_1044);
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1050 = precise::min(_1046, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1052 = _1050 * _1042;
        float _1054 = -_898;
        float _1056 = _1054 + _1008;
        float _1058 = _1048 * _1052;
        float _1060 = fma(_1056, _1058, _898);
        float _1062 = fma(_1028, _1058, _942);
        float _1064 = fma(_1038, _1058, _890);
        _1010 = _1062;
        _1012 = _1060;
        _1014 = _1064;
    }
    float _1066 = _1010;
    float _1068 = _1012;
    float _1070 = _1014;
    float _1072 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1076 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1078 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1082 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1074);
    float _1084 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1076);
    float _1086 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1078);
    float _1088 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1080);
    float _1090 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1082);
    float _1092 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1084);
    float _1094 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1086);
    float _1096 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1098 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1102 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1106 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1112 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1104);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1106);
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1108);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1110);
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1114);
    float _1124 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1126 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1116);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_33.x = 1.0;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1120);
    float _1142 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1148 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1150 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1154 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1156 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1118);
    float _1158 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1122);
    float _1160 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1126);
    out.m_53.w = _1142;
    out.m_55.x = _1144;
    out.m_55.y = _1146;
    out.m_55.z = _1148;
    out.m_57.x = _1150;
    out.m_57.y = _1152;
    out.m_57.z = _1154;
    out.gl_Position.x = _1156;
    out.gl_Position.y = _1140;
    out.gl_Position.z = _1158;
    out.gl_Position.w = _1160;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

