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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_67 [[attribute(13)]];
    float4 m_65 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1627 = false;
    bool _326 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1858 = as_type<float>(_120);
        out.gl_Position.z = _1858;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _114 = _140;
    }
    float _142 = _114;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1927 = as_type<float>(_156);
        out.gl_Position.z = _1927;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _162 = in.m_53.z;
    float _164 = in.m_51.y;
    float _166 = in.m_55.z;
    float _168 = in.m_53.y;
    float _170 = in.m_55.y;
    float _172 = _158 * _158;
    float _174 = in.m_51.x;
    float _176 = fma(_162, _162, _172);
    float _178 = in.m_53.x;
    float _180 = _164 * _164;
    float _182 = in.m_55.x;
    float _184 = fma(_166, _166, _176);
    float _186 = fma(_168, _168, _180);
    float _188 = sqrt(_184);
    float _190 = fma(_170, _170, _186);
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = sqrt(_190);
    bool _200 = _188 > 0.0;
    bool _202 = _198 > 0.0;
    float _204 = 0.0;
    if (_200)
    {
        float _206 = rsqrt(_184);
        _204 = _206;
    }
    float _208 = _204;
    float _210 = _164 * _194;
    float _212 = _168 * _194;
    float _214 = _170 * _194;
    float _216 = 0.0;
    float _218 = _192;
    if (!_200)
    {
        _216 = 0.0;
    }
    float _220 = _216;
    float _222 = fma(_192, _174, _210);
    float _224 = fma(_192, _178, _212);
    float _226 = fma(_192, _182, _214);
    float _228 = _190;
    float _230 = _220;
    if (_202)
    {
        float _232 = rsqrt(_190);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    if (!_202)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    float _240 = fma(_158, _196, _222);
    float _242 = 0.0;
    float _244 = _238;
    if (!_202)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = fma(_162, _196, _224);
    float _250 = 0.0;
    float _252 = _246;
    if (!_202)
    {
        _250 = 0.0;
    }
    float _254 = _250;
    float _256 = fma(_166, _196, _226);
    float _258 = 0.0;
    float _260 = _254;
    if (!_200)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _262;
    if (_200)
    {
        float _266 = _208 * 0.001000000047497451305389404296875;
        _218 = _266;
    }
    float _268 = _218;
    float _270 = 0.0;
    if (!_200)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = _272;
    if (_200)
    {
        float _276 = _162 * _268;
        _230 = _276;
    }
    float _278 = _230;
    if (_200)
    {
        float _280 = _158 * _268;
        _264 = _280;
    }
    float _282 = _264;
    if (_200)
    {
        float _284 = _166 * _268;
        _274 = _284;
    }
    float _286 = _274;
    if (_202)
    {
        float _288 = _234 * _168;
        _244 = _288;
    }
    float _290 = _244;
    float _292 = _290;
    if (_202)
    {
        float _294 = _234 * _164;
        _252 = _294;
    }
    float _296 = _252;
    float _298 = _296;
    if (_202)
    {
        float _300 = _234 * _170;
        _260 = _300;
    }
    float _302 = _260;
    bool _304 = !_160;
    float _306 = _302;
    float _324;
    if (!_304)
    {
        float _308 = in.m_59.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_104);
        float _330 = 1.0 / _328;
        float _332 = _138 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_59.x;
    float _338 = in.m_59.y;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    float _346 = fma(0.2000000476837158203125, _336, 0.89999997615814208984375);
    float _348 = _336 * 100.0;
    float _350 = _240 * _240;
    float _352 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _354 = _340 > 0.0;
    float _356 = fma(_248, _248, _350);
    bool _358 = _340 >= 0.0;
    bool _360 = isnan(_340);
    bool _362 = _358 || _360;
    bool _364 = isnan(0.0);
    bool _366 = _362 || _364;
    float _368 = fma(_138, _352, _348);
    float _370 = fma(_138, 0.00999999977648258209228515625, _348);
    float _372 = fma(_256, _256, _356);
    float _374 = abs(_340);
    float _376 = -_374;
    float _378 = _376 + 1.0;
    float _380 = abs(_340);
    float _382 = -_380;
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[191].y, _368);
    float _386 = _370 * 0.15915493667125701904296875;
    float _388 = rsqrt(_372);
    float _390 = in.m_63.x;
    float _392 = in.m_63.y;
    float _394 = in.m_63.z;
    float _396 = _384 * 0.15915493667125701904296875;
    int _398 = _366 ? 0 : 1;
    int _400 = ~_398;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = _396 * 6.283185482025146484375;
    float _408 = sin(_406);
    int _410 = _404;
    float _412 = _334;
    if (!_354)
    {
        int _414 = ~_398;
        int _416 = _414 + 1;
        _410 = _416;
    }
    int _418 = _410;
    float _420 = -_378;
    float _422 = fma(_420, _378, 1.0);
    float _424 = float(_418);
    float _426 = _396 * 6.283185482025146484375;
    float _428 = cos(_426);
    float _430 = _248 * _388;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _434 = _256 * _388;
    float _436 = _408 * _432;
    float _438 = _386 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = in.m_44.x;
    float _444 = in.m_44.y;
    float _446 = in.m_44.z;
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = _436 * 0.15915493667125701904296875;
    float _452 = _240 * _388;
    float _454 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _428 * _422;
    float _460 = _452 * _296;
    float _462 = _450 * 6.283185482025146484375;
    float _464 = sin(_462);
    float _466 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = _458 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _470 = fma(_430, _290, _460);
    float _472 = _458 * _432;
    float _474 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _476 = _468 * 0.15915493667125701904296875;
    float _478 = fma(_434, _302, _470);
    float _480 = _450 * 6.283185482025146484375;
    float _482 = cos(_480);
    float _484 = in.m_65.x;
    float _486 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _488 = abs(_478);
    bool _490 = _488 > 0.99989998340606689453125;
    float _492 = _472 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _494 = _168 * _444;
    float _496 = _476 * 6.283185482025146484375;
    float _498 = cos(_496);
    float _500 = _170 * _444;
    float _502 = _492 * 0.15915493667125701904296875;
    float _504 = fma(_178, _442, _494);
    float _506 = _164 * _444;
    float _508 = fma(_182, _442, _500);
    float _510 = fma(_162, _446, _504);
    float _512 = _476 * 6.283185482025146484375;
    float _514 = sin(_512);
    if (_490)
    {
        float _516 = _290 + _278;
        _292 = _516;
    }
    float _518 = _292;
    if (_490)
    {
        float _520 = _302 + _286;
        _306 = _520;
    }
    float _522 = _306;
    float _524 = fma(_166, _446, _508);
    if (_490)
    {
        float _526 = _296 + _282;
        _298 = _526;
    }
    float _528 = _298;
    float _530 = -_518;
    float _532 = _434 * _530;
    float _534 = -_522;
    float _536 = _452 * _534;
    float _538 = _368 * 0.15915493667125701904296875;
    float _540 = _502 * 6.283185482025146484375;
    float _542 = sin(_540);
    float _544 = -_522;
    float _546 = -_532;
    float _548 = fma(_430, _544, _546);
    float _550 = -_528;
    float _552 = _430 * _550;
    float _554 = -_528;
    float _556 = -_536;
    float _558 = fma(_434, _554, _556);
    float _560 = fma(_440, 2.0, 2.0);
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _548 * _548;
    float _566 = _498 * _344;
    float _568 = -_518;
    float _570 = -_552;
    float _572 = fma(_452, _568, _570);
    float _574 = _502 * 6.283185482025146484375;
    float _576 = cos(_574);
    float _578 = _514 * _344;
    float _580 = fma(_558, _558, _564);
    float _582 = _464 * _340;
    float _584 = fma(_514, _342, _566);
    float _586 = _482 * _340;
    float _588 = -_578;
    float _590 = fma(_498, _342, _588);
    float _592 = fma(_572, _572, _580);
    float _594 = _538 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = -_582;
    float _600 = fma(_584, _482, _598);
    float _602 = fma(_584, _464, _586);
    float _604 = _590 * _542;
    float _606 = -_600;
    float _608 = _606 + _344;
    float _610 = fma(_174, _442, _506);
    float _612 = _590 * _576;
    float _614 = rsqrt(_592);
    float _616 = -_604;
    float _618 = fma(_602, _576, _616);
    float _620 = fma(_608, _484, _600);
    float _622 = fma(_602, _542, _612);
    float _624 = fma(_562, 0.949999988079071044921875, -1.0);
    float _626 = -_618;
    float _628 = _626 + _340;
    float _630 = fma(_158, _446, _610);
    float _632 = -_622;
    float _634 = _632 + _342;
    float _636 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[191].w, _620);
    float _638 = fma(_628, _484, _618);
    float _640 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _642 = fma(_634, _484, _622);
    float _644 = -_344;
    float _646 = _636 + _644;
    float _648 = in.m_55.w;
    float _650 = -_340;
    float _652 = _638 + _650;
    float _654 = -_342;
    float _656 = _642 + _654;
    float _658 = _558 * _614;
    float _660 = _548 * _614;
    float _662 = _572 * _614;
    float _664 = fma(_640, _646, _344);
    float _666 = in.m_53.w;
    float _668 = fma(_640, _656, _342);
    float _670 = fma(_640, _652, _340);
    float _672 = _452 * _662;
    float _674 = _434 * _658;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _682 = -_672;
    float _684 = fma(_434, _660, _682);
    float _686 = _456 * _676;
    float _688 = _474 * _678;
    float _690 = _430 * _660;
    float _692 = _486 * _680;
    float _694 = _686 * _434;
    float _696 = _686 * _430;
    float _698 = -_690;
    float _700 = fma(_452, _658, _698);
    float _702 = _524 + _648;
    float _704 = fma(_688, _662, _694);
    float _706 = fma(_688, _658, _696);
    float _708 = _686 * _452;
    float _710 = -_674;
    float _712 = fma(_430, _662, _710);
    float _714 = fma(_692, _700, _704);
    float _716 = fma(_692, _684, _706);
    float _718 = _510 + _666;
    float _720 = fma(_688, _660, _708);
    float _722 = _702 + _714;
    float _724 = in.m_51.w;
    float _726 = _718 + _716;
    float _728 = fma(_692, _712, _720);
    float _730 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _732 = _722 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _736 = _726 + _734;
    float _738 = _732 * _732;
    float _740 = fma(_736, _736, _738);
    float _742 = sqrt(_740);
    float _744 = _630 + _724;
    float _746 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _748 = _744 + _746;
    bool _750 = _742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _748 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _754 = _752 + 200.0;
    float _756 = _728 + _754;
    float _758 = _688;
    float _760 = _726;
    float _762 = _724;
    float _764 = _742;
    float _766 = 0.949999988079071044921875;
    float _768 = _756;
    if (!_750)
    {
        _758 = _726;
    }
    float _770 = _758;
    float _772 = _770;
    if (!_750)
    {
        _760 = _722;
    }
    float _774 = _760;
    float _776 = _774;
    if (!_750)
    {
        _762 = _756;
    }
    float _778 = _762;
    bool _780 = !_750;
    float _782 = _778;
    if (!_780)
    {
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _788 = _742 + _786;
        float _790 = rsqrt(_740);
        float _792 = _788 * _784;
        float _794 = _756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = _792 * 0.15915493667125701904296875;
        float _798 = _796 * 6.283185482025146484375;
        float _800 = cos(_798);
        float _802 = _796 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 + (-1.0);
        float _808 = _806 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _810 = fma(_804, _794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _812 = fma(_756, _800, _808);
        float _814 = _790 * _810;
        float _816 = fma(_736, _814, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _818 = fma(_732, _814, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _782 = _812;
        _772 = _816;
        _776 = _818;
        _764 = _796;
    }
    float _820 = _782;
    float _822 = _772;
    float _824 = _776;
    float _826 = _764;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _820 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = _822 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = _824 + _836;
    float _840 = _830 * _830;
    float _842 = fma(_834, _834, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = rsqrt(_844);
    float _848 = sqrt(_844);
    float _850 = _846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _852 = _834 * _850;
    float _854 = _838 * _850;
    float _856 = _852 * _852;
    float _858 = _854 * _854;
    float _860 = _856 + _858;
    float _862 = sqrt(_860);
    bool _864 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _862 + _866;
    float _870 = _846;
    float _872 = _860;
    float _874 = _868;
    float _876 = _826;
    float _878 = _850;
    float _880 = _830;
    if (_864)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _870 = _882;
    }
    float _884 = _870;
    if (_864)
    {
        float _886 = rsqrt(_860);
        _872 = _886;
    }
    float _888 = _872;
    if (_864)
    {
        float _890 = _868 * _884;
        _874 = _890;
    }
    float _892 = _874;
    if (_864)
    {
        float _894 = _892 * 0.15915493667125701904296875;
        _876 = _894;
    }
    float _896 = _876;
    float _898 = _884;
    if (_864)
    {
        float _900 = _896 * 6.283185482025146484375;
        float _902 = sin(_900);
        _898 = _902;
    }
    float _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = precise::max(0.0, _906);
    float _910 = _838;
    float _912 = _908;
    if (_864)
    {
        float _914 = _896 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = -_850;
    float _922 = -_908;
    float _924 = fma(_830, _920, _922);
    if (_864)
    {
        float _926 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _926;
    }
    float _928 = _912;
    float _930 = _904;
    float _932 = _928;
    if (_864)
    {
        float _934 = fma(_904, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _878 = _934;
    }
    float _936 = _878;
    float _938 = _936;
    if (!_864)
    {
        _930 = _852;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_864)
    {
        _932 = _924;
    }
    float _944 = _932;
    float _946 = _944;
    float _948 = _918;
    if (_864)
    {
        float _950 = _918 + (-1.0);
        _880 = _950;
    }
    float _952 = _880;
    float _954 = _952;
    if (_864)
    {
        float _956 = _888 * _936;
        _766 = _956;
    }
    float _958 = _766;
    if (!_864)
    {
        _938 = _856;
    }
    float _960 = _938;
    float _962 = _820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _960;
    if (_864)
    {
        float _966 = _952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _768 = _966;
    }
    float _968 = _768;
    if (_864)
    {
        float _970 = _852 * _958;
        _942 = _970;
    }
    float _972 = _942;
    if (!_864)
    {
        _954 = _854;
    }
    float _974 = _954;
    float _976 = _974;
    if (_864)
    {
        float _978 = _854 * _958;
        _976 = _978;
    }
    float _980 = _976;
    if (_864)
    {
        float _982 = fma(_924, _918, _968);
        _946 = _982;
    }
    float _984 = _946;
    if (_864)
    {
        float _986 = _972 * _972;
        _964 = _986;
    }
    float _988 = _964;
    if (!_864)
    {
        _948 = _858;
    }
    float _990 = _948;
    float _992 = _990;
    if (_864)
    {
        float _994 = _980 * _980;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = fma(_984, _984, _988);
    float _1000 = _998 + _996;
    float _1002 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1012 = rsqrt(_1000);
    float _1014 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = _820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1022 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1010);
    float _1024 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1026 = _820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1020);
    float _1030 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1022);
    float _1032 = abs(_1018);
    float _1034 = log2(_1032);
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1038 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1028);
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1048 = _1012 * _972;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1052 = _1012 * _984;
    float _1054 = -_1042;
    float _1056 = fma(_1054, _1036, 1.0);
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1060 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1044);
    float _1062 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1050);
    float _1064 = _1012 * _980;
    float _1066 = -_1058;
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1066);
    float _1070 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1062);
    float _1074 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1076 = -_1064;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1068);
    float _1080 = log2(_1056);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1072);
    float _1084 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1086 = fma(_1078, -0.5, 0.5);
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1078, 0.5, 0.5);
    float _1092 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1084);
    float _1094 = _1052 + 1.0;
    float _1096 = exp2(_1074);
    float _1098 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1100 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1092);
    float _1102 = fma(_1090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1104 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1098);
    float _1106 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1100);
    float _1108 = fma(_1090, _1102, -0.212114393711090087890625);
    float _1110 = 1.0 / _1082;
    float _1112 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1104);
    float _1114 = _1080 * 0.693147182464599609375;
    float _1116 = fma(_1090, _1108, 1.570728778839111328125);
    float _1118 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1120 = sqrt(_1086);
    float _1122 = -_1052;
    float _1124 = fma(_1096, _1094, _1122);
    float _1126 = fma(_1124, 0.5, 0.5);
    float _1128 = _1106 * _1110;
    float _1130 = _1112 * _1110;
    float _1132 = fma(_1128, 0.5, 0.5);
    float _1134 = fma(_1130, -0.5, 0.5);
    float _1136 = _1120 * 0.636619746685028076171875;
    float _1138 = -_1116;
    float _1140 = fma(_1136, _1138, 1.0);
    float3 _3426 = float3(_1132, _1134, _1118);
    float _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3426, float3(0.0), isnan(_3426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3426, float3(0.0), isnan(_3426)), level(0.0)).x;
    float3 _3437 = float3(_1132, _1134, _1118);
    float4 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3437, float3(0.0), isnan(_3437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3437, float3(0.0), isnan(_3437)), level(0.0)).xyzw;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float _1153 = _1145.w;
    float2 _3454 = float2(_1140, _1126);
    float3 _1157 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3454, float2(0.0), isnan(_3454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3454, float2(0.0), isnan(_3454)), level(0.0)).xyz;
    float _1159 = _1157.x;
    float _1161 = _1157.y;
    float _1163 = _1157.z;
    float _1165 = in.m_67.y;
    float _1167 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1175 = _1173 != 0;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1181 = exp2(_1167);
    bool _1183 = _338 > 0.5;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1193 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1195 = isnan(_334);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1207 = _1112;
    float _1209 = _1106;
    if (_1171)
    {
        float _1211 = in.m_59.x;
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = 1.0 / _1179;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1223 = _1221 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1225 = -_1165;
    float _1227 = _1225 + 1.0;
    bool _1229 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1231 = isnan(_334);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -_1181;
    float _1243 = _1241 + 1.0;
    float _1245 = 1.0 / _1187;
    float _1247 = in.m_67.x;
    float _1249 = _1165;
    float _1251 = _1247;
    if (_1175)
    {
        float _1253 = _1183 ? _1227 : _1165;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = -_1239;
    float _1259 = _1257 + 1.0;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1263 = 1.0 / _1191;
    float _1265 = in.m_69.x;
    float _1267 = in.m_69.y;
    float _1269 = in.m_69.z;
    float _1271 = _1223 * _1215;
    float _1273 = -_1203;
    float _1275 = _1273 + 1.0;
    bool _1277 = _1213 > 0.5;
    bool _1279 = _1277 && _1171;
    float _1281 = _1219 * _1245;
    bool _1283 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1285 = isnan(_334);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1301 = _334 + _1299;
    float _1303 = _1293 * _1275;
    float _1305 = -_1293;
    float _1307 = _1305 + 1.0;
    float _1309 = _1297 * _1263;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1313 = _334 + _1311;
    float _1315 = fma(_1281, _1301, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1317 = _1239 * _1307;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1321 = _334 + _1319;
    float _1323 = fma(_1271, _1313, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1325 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1327 = isnan(_334);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = fma(_1309, _1321, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1339 = _514 * _1269;
    float _1341 = _498 * _1269;
    float _1343 = _1335 * _1259;
    float _1345 = -_1335;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1339;
    float _1351 = fma(_498, _1267, _1349);
    float _1353 = fma(_514, _1267, _1341);
    float _1355 = _482 * _1265;
    float _1357 = _1315 * _1343;
    float _1359 = _576 * _1351;
    float _1361 = _542 * _1351;
    float _1363 = fma(_464, _1353, _1355);
    float _1365 = _464 * _1265;
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1357);
    if (_1171)
    {
        _412 = _1247;
    }
    float _1369 = _412;
    float _1371 = fma(_542, _1363, _1359);
    float _1373 = -_1361;
    float _1375 = fma(_576, _1363, _1373);
    float _1377 = -_1365;
    float _1379 = fma(_482, _1353, _1377);
    float _1381 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1383 = -_1371;
    float _1385 = _1383 + _1267;
    float _1387 = -_1375;
    float _1389 = _1387 + _1265;
    float _1391 = _1369;
    if (_1279)
    {
        float _1393 = -_1369;
        float _1395 = _1393 + 1.0;
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1401 = fma(_1385, _484, _1371);
    float _1403 = fma(_1389, _484, _1375);
    float _1405 = -_1379;
    float _1407 = _1405 + _1269;
    if (_1171)
    {
        _1251 = _1397;
    }
    float _1409 = _1251;
    float _1411 = _1401 * _1401;
    bool _1413 = _668 != 0.0;
    bool _1415 = isnan(_668);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = fma(_1407, _484, _1379);
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1427 = fma(_1403, _1403, _1411);
    bool _1429 = _670 == 0.0;
    bool _1431 = !_1421;
    bool _1433 = _1429 && _1431;
    float _1435 = fma(_1323, _1317, _1367);
    float _1437 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1399);
    float _1439 = fma(_1423, _1423, _1427);
    bool _1441 = _664 == 0.0;
    bool _1443 = _1441 && _1433;
    float _1445 = fma(_1337, _1303, _1435);
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1449 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1437);
    float _1451 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1445);
    float _1453 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1457 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1449);
    float _1459 = rsqrt(_1439);
    float _1461 = _1381 * _1425;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1106;
    out.gl_Position.y = _1112;
    out.gl_Position.z = _1457;
    out.gl_Position.w = _1082;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1471 = _1453 * _1447;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1471;
    out.m_71.y = _1461;
    float _1477 = -_1265;
    float _1479 = fma(_1403, _1459, _1477);
    float _1481 = -_1267;
    float _1483 = fma(_1401, _1459, _1481);
    float _1485 = -_1269;
    float _1487 = fma(_1423, _1459, _1485);
    out.m_73.x = _1465;
    out.m_73.y = _1473;
    out.m_73.z = _1475;
    out.m_73.w = _1467;
    float _1489 = fma(_640, _1479, _1265);
    float _1491 = fma(_640, _1483, _1267);
    float _1493 = fma(_640, _1487, _1269);
    float _1495 = _1457 + _1082;
    float _1497 = _1489;
    float _1499 = _1491;
    float _1501 = _1493;
    float _1503 = _1457;
    if (!_1443)
    {
        float _1505 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1497 = _1505;
    }
    float _1507 = _1497;
    if (!_1443)
    {
        float _1509 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1499 = _1509;
    }
    float _1511 = _1499;
    if (!_1443)
    {
        float _1513 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1493);
        _1501 = _1513;
    }
    float _1515 = _1501;
    bool _1517 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1519 = isnan(_848);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1525 = _1521 || _1523;
    float _1527 = _430 * _1511;
    float _1529 = _452 * _1511;
    float _1531 = _434 * _1511;
    float _1533 = fma(_658, _1507, _1527);
    float _1535 = fma(_660, _1507, _1529);
    float _1537 = fma(_662, _1507, _1531);
    float _1539 = fma(_684, _1515, _1533);
    float _1541 = _1495 * 0.5;
    float _1543 = fma(_700, _1515, _1537);
    float _1545 = fma(_712, _1515, _1535);
    if (!_1525)
    {
        _1503 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1547 = _1503;
    out.m_75.z = _1541;
    out.m_75.w = _1082;
    float _1549 = _1547;
    float _1551 = _1547;
    if (!_1525)
    {
        _1207 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1553 = _1207;
    float _1555 = _1553;
    float _1557 = _1553;
    if (!_1525)
    {
        _1209 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1559 = _1209;
    out.m_77.x = _1539;
    out.m_77.y = _1545;
    out.m_77.z = _1543;
    float _1561 = _1261 * _1142;
    float _1563 = -_1261;
    float _1565 = _1563 + 1.0;
    float _1567 = _1153 * _1561;
    float _1569 = _1163 * _1561;
    float _1571 = _1153 * _1565;
    float _1573 = fma(_1159, _1567, _1147);
    float _1575 = fma(_1161, _1567, _1149);
    float _1577 = fma(_1153, _1569, _1151);
    out.m_79.x = _1573;
    out.m_79.y = _1575;
    out.m_79.z = _1577;
    out.m_79.w = _1571;
    bool _1579 = !_1525;
    float _1581 = _1559;
    float _1583 = _1559;
    if (!_1579)
    {
        bool _1585 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1587 = isnan(_848);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1593 = _1589 || _1591;
        if (!_1593)
        {
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = _848 + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1599;
            float _1603 = 1.0 / _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1613 = _1597 * _1603;
            float _1615 = precise::clamp(_1613, 0.0, 1.0);
            float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1619 = _1617 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1621 = fma(_1615, _1611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1623 = fma(_1615, _1619, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1625 = fma(_1615, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1557 = _1625;
            _1551 = _1623;
            _1583 = _1621;
            _1627 = true;
        }
        else
        {
            bool _1629 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1631 = isnan(_848);
            bool _1633 = _1629 || _1631;
            bool _1635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1637 = _1633 || _1635;
            if (!_1637)
            {
                _1549 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1639 = _1549;
            _1551 = _1639;
            if (!_1637)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1641 = _1555;
            _1557 = _1641;
            if (!_1637)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1643 = _1581;
            bool _1645 = !_1637;
            _1583 = _1643;
            if (!_1645)
            {
                bool _1647 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1649 = isnan(_848);
                bool _1651 = _1647 || _1649;
                bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1655 = _1651 || _1653;
                if (!_1655)
                {
                    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1659 = _848 + _1657;
                    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1661;
                    float _1665 = 1.0 / _1663;
                    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1669 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1673 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1675 = _1659 * _1665;
                    float _1677 = precise::clamp(_1675, 0.0, 1.0);
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1683 = fma(_1677, _1673, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1685 = fma(_1677, _1681, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1687 = fma(_1677, _1669, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1557 = _1687;
                    _1551 = _1685;
                    _1583 = _1683;
                    _1627 = true;
                }
                else
                {
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1551 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1627 = false;
    float _1689 = _1557;
    float _1691 = _1551;
    float _1693 = _1583;
    float _1695 = _1689 * 0.586610972881317138671875;
    bool _1697 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_81.x = 0.0;
    float _1699 = fma(_1691, 0.298911988735198974609375, _1695);
    float _1701 = fma(_1693, 0.114477999508380889892578125, _1699);
    out.m_83.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1703 = -_1701;
    float _1705 = _1703 + _1691;
    float _1707 = -_1701;
    float _1709 = _1707 + _1689;
    float _1711 = -_1701;
    float _1713 = _1711 + _1693;
    float _1715 = fma(_1705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    float _1717 = fma(_1709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    float _1719 = fma(_1713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    out.m_47.x = 1.0;
    out.m_85.x = _1715;
    out.m_85.y = _1717;
    out.m_85.z = _1719;
    if (!_1697)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1721 = -_820;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1725 = -_822;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1729 = -_824;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1733 = _1723 * _1723;
    float _1735 = fma(_1727, _1727, _1733);
    float _1737 = fma(_1731, _1731, _1735);
    float _1739 = sqrt(_1737);
    float _1741 = rsqrt(_1737);
    float _1743 = -_1739;
    float _1745 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1747 = _1745 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = _1727 * _1741;
    float _1753 = _1723 * _1741;
    float _1755 = abs(_1749);
    float _1757 = log2(_1755);
    float _1759 = _1731 * _1741;
    float _1761 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1763 = _1545 * _1753;
    float _1765 = -_1753;
    float _1767 = -_1761;
    float _1769 = fma(_1765, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1767);
    float _1771 = fma(_1539, _1751, _1763);
    float _1773 = -_1759;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1769);
    float _1777 = fma(_1543, _1759, _1771);
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1783 = _1775 + _1781;
    float _1785 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1787 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1789 = precise::clamp(_1787, 0.0, 1.0);
    float _1791 = exp2(_1785);
    float _1793 = _1791 * _1789;
    float _1795 = _1779 * _1793;
    float _1797 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1799 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1801 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _1797;
    out.m_81.y = _1799;
    out.m_81.z = _1801;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1627 = false;
    bool _326 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1858 = as_type<float>(_120);
        out.gl_Position.z = _1858;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _114 = _140;
    }
    float _142 = _114;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1927 = as_type<float>(_156);
        out.gl_Position.z = _1927;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_51.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _162 = in.m_53.z;
    float _164 = in.m_51.y;
    float _166 = in.m_55.z;
    float _168 = in.m_53.y;
    float _170 = in.m_55.y;
    float _172 = _158 * _158;
    float _174 = in.m_51.x;
    float _176 = fma(_162, _162, _172);
    float _178 = in.m_53.x;
    float _180 = _164 * _164;
    float _182 = in.m_55.x;
    float _184 = fma(_166, _166, _176);
    float _186 = fma(_168, _168, _180);
    float _188 = sqrt(_184);
    float _190 = fma(_170, _170, _186);
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = sqrt(_190);
    bool _200 = _188 > 0.0;
    bool _202 = _198 > 0.0;
    float _204 = 0.0;
    if (_200)
    {
        float _206 = rsqrt(_184);
        _204 = _206;
    }
    float _208 = _204;
    float _210 = _164 * _194;
    float _212 = _168 * _194;
    float _214 = _170 * _194;
    float _216 = 0.0;
    float _218 = _192;
    if (!_200)
    {
        _216 = 0.0;
    }
    float _220 = _216;
    float _222 = fma(_192, _174, _210);
    float _224 = fma(_192, _178, _212);
    float _226 = fma(_192, _182, _214);
    float _228 = _190;
    float _230 = _220;
    if (_202)
    {
        float _232 = rsqrt(_190);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    if (!_202)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    float _240 = fma(_158, _196, _222);
    float _242 = 0.0;
    float _244 = _238;
    if (!_202)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = fma(_162, _196, _224);
    float _250 = 0.0;
    float _252 = _246;
    if (!_202)
    {
        _250 = 0.0;
    }
    float _254 = _250;
    float _256 = fma(_166, _196, _226);
    float _258 = 0.0;
    float _260 = _254;
    if (!_200)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _262;
    if (_200)
    {
        float _266 = _208 * 0.001000000047497451305389404296875;
        _218 = _266;
    }
    float _268 = _218;
    float _270 = 0.0;
    if (!_200)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = _272;
    if (_200)
    {
        float _276 = _162 * _268;
        _230 = _276;
    }
    float _278 = _230;
    if (_200)
    {
        float _280 = _158 * _268;
        _264 = _280;
    }
    float _282 = _264;
    if (_200)
    {
        float _284 = _166 * _268;
        _274 = _284;
    }
    float _286 = _274;
    if (_202)
    {
        float _288 = _234 * _168;
        _244 = _288;
    }
    float _290 = _244;
    float _292 = _290;
    if (_202)
    {
        float _294 = _234 * _164;
        _252 = _294;
    }
    float _296 = _252;
    float _298 = _296;
    if (_202)
    {
        float _300 = _234 * _170;
        _260 = _300;
    }
    float _302 = _260;
    bool _304 = !_160;
    float _306 = _302;
    float _324;
    if (!_304)
    {
        float _308 = in.m_59.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_104);
        float _330 = 1.0 / _328;
        float _332 = _138 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_59.x;
    float _338 = in.m_59.y;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    float _346 = fma(0.2000000476837158203125, _336, 0.89999997615814208984375);
    float _348 = _336 * 100.0;
    float _350 = _240 * _240;
    float _352 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _354 = _340 > 0.0;
    float _356 = fma(_248, _248, _350);
    bool _358 = _340 >= 0.0;
    bool _360 = isnan(_340);
    bool _362 = _358 || _360;
    bool _364 = isnan(0.0);
    bool _366 = _362 || _364;
    float _368 = fma(_138, _352, _348);
    float _370 = fma(_138, 0.00999999977648258209228515625, _348);
    float _372 = fma(_256, _256, _356);
    float _374 = abs(_340);
    float _376 = -_374;
    float _378 = _376 + 1.0;
    float _380 = abs(_340);
    float _382 = -_380;
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[191].y, _368);
    float _386 = _370 * 0.15915493667125701904296875;
    float _388 = rsqrt(_372);
    float _390 = in.m_63.x;
    float _392 = in.m_63.y;
    float _394 = in.m_63.z;
    float _396 = _384 * 0.15915493667125701904296875;
    int _398 = _366 ? 0 : 1;
    int _400 = ~_398;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = _396 * 6.283185482025146484375;
    float _408 = sin(_406);
    int _410 = _404;
    float _412 = _334;
    if (!_354)
    {
        int _414 = ~_398;
        int _416 = _414 + 1;
        _410 = _416;
    }
    int _418 = _410;
    float _420 = -_378;
    float _422 = fma(_420, _378, 1.0);
    float _424 = float(_418);
    float _426 = _396 * 6.283185482025146484375;
    float _428 = cos(_426);
    float _430 = _248 * _388;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _434 = _256 * _388;
    float _436 = _408 * _432;
    float _438 = _386 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = in.m_44.x;
    float _444 = in.m_44.y;
    float _446 = in.m_44.z;
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = _436 * 0.15915493667125701904296875;
    float _452 = _240 * _388;
    float _454 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _428 * _422;
    float _460 = _452 * _296;
    float _462 = _450 * 6.283185482025146484375;
    float _464 = sin(_462);
    float _466 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = _458 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _470 = fma(_430, _290, _460);
    float _472 = _458 * _432;
    float _474 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _476 = _468 * 0.15915493667125701904296875;
    float _478 = fma(_434, _302, _470);
    float _480 = _450 * 6.283185482025146484375;
    float _482 = cos(_480);
    float _484 = in.m_65.x;
    float _486 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _488 = abs(_478);
    bool _490 = _488 > 0.99989998340606689453125;
    float _492 = _472 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _494 = _168 * _444;
    float _496 = _476 * 6.283185482025146484375;
    float _498 = cos(_496);
    float _500 = _170 * _444;
    float _502 = _492 * 0.15915493667125701904296875;
    float _504 = fma(_178, _442, _494);
    float _506 = _164 * _444;
    float _508 = fma(_182, _442, _500);
    float _510 = fma(_162, _446, _504);
    float _512 = _476 * 6.283185482025146484375;
    float _514 = sin(_512);
    if (_490)
    {
        float _516 = _290 + _278;
        _292 = _516;
    }
    float _518 = _292;
    if (_490)
    {
        float _520 = _302 + _286;
        _306 = _520;
    }
    float _522 = _306;
    float _524 = fma(_166, _446, _508);
    if (_490)
    {
        float _526 = _296 + _282;
        _298 = _526;
    }
    float _528 = _298;
    float _530 = -_518;
    float _532 = _434 * _530;
    float _534 = -_522;
    float _536 = _452 * _534;
    float _538 = _368 * 0.15915493667125701904296875;
    float _540 = _502 * 6.283185482025146484375;
    float _542 = sin(_540);
    float _544 = -_522;
    float _546 = -_532;
    float _548 = fma(_430, _544, _546);
    float _550 = -_528;
    float _552 = _430 * _550;
    float _554 = -_528;
    float _556 = -_536;
    float _558 = fma(_434, _554, _556);
    float _560 = fma(_440, 2.0, 2.0);
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _548 * _548;
    float _566 = _498 * _344;
    float _568 = -_518;
    float _570 = -_552;
    float _572 = fma(_452, _568, _570);
    float _574 = _502 * 6.283185482025146484375;
    float _576 = cos(_574);
    float _578 = _514 * _344;
    float _580 = fma(_558, _558, _564);
    float _582 = _464 * _340;
    float _584 = fma(_514, _342, _566);
    float _586 = _482 * _340;
    float _588 = -_578;
    float _590 = fma(_498, _342, _588);
    float _592 = fma(_572, _572, _580);
    float _594 = _538 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = -_582;
    float _600 = fma(_584, _482, _598);
    float _602 = fma(_584, _464, _586);
    float _604 = _590 * _542;
    float _606 = -_600;
    float _608 = _606 + _344;
    float _610 = fma(_174, _442, _506);
    float _612 = _590 * _576;
    float _614 = rsqrt(_592);
    float _616 = -_604;
    float _618 = fma(_602, _576, _616);
    float _620 = fma(_608, _484, _600);
    float _622 = fma(_602, _542, _612);
    float _624 = fma(_562, 0.949999988079071044921875, -1.0);
    float _626 = -_618;
    float _628 = _626 + _340;
    float _630 = fma(_158, _446, _610);
    float _632 = -_622;
    float _634 = _632 + _342;
    float _636 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[191].w, _620);
    float _638 = fma(_628, _484, _618);
    float _640 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _642 = fma(_634, _484, _622);
    float _644 = -_344;
    float _646 = _636 + _644;
    float _648 = in.m_55.w;
    float _650 = -_340;
    float _652 = _638 + _650;
    float _654 = -_342;
    float _656 = _642 + _654;
    float _658 = _558 * _614;
    float _660 = _548 * _614;
    float _662 = _572 * _614;
    float _664 = fma(_640, _646, _344);
    float _666 = in.m_53.w;
    float _668 = fma(_640, _656, _342);
    float _670 = fma(_640, _652, _340);
    float _672 = _452 * _662;
    float _674 = _434 * _658;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _682 = -_672;
    float _684 = fma(_434, _660, _682);
    float _686 = _456 * _676;
    float _688 = _474 * _678;
    float _690 = _430 * _660;
    float _692 = _486 * _680;
    float _694 = _686 * _434;
    float _696 = _686 * _430;
    float _698 = -_690;
    float _700 = fma(_452, _658, _698);
    float _702 = _524 + _648;
    float _704 = fma(_688, _662, _694);
    float _706 = fma(_688, _658, _696);
    float _708 = _686 * _452;
    float _710 = -_674;
    float _712 = fma(_430, _662, _710);
    float _714 = fma(_692, _700, _704);
    float _716 = fma(_692, _684, _706);
    float _718 = _510 + _666;
    float _720 = fma(_688, _660, _708);
    float _722 = _702 + _714;
    float _724 = in.m_51.w;
    float _726 = _718 + _716;
    float _728 = fma(_692, _712, _720);
    float _730 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _732 = _722 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _736 = _726 + _734;
    float _738 = _732 * _732;
    float _740 = fma(_736, _736, _738);
    float _742 = sqrt(_740);
    float _744 = _630 + _724;
    float _746 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _748 = _744 + _746;
    bool _750 = _742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _748 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _754 = _752 + 200.0;
    float _756 = _728 + _754;
    float _758 = _688;
    float _760 = _726;
    float _762 = _724;
    float _764 = _742;
    float _766 = 0.949999988079071044921875;
    float _768 = _756;
    if (!_750)
    {
        _758 = _726;
    }
    float _770 = _758;
    float _772 = _770;
    if (!_750)
    {
        _760 = _722;
    }
    float _774 = _760;
    float _776 = _774;
    if (!_750)
    {
        _762 = _756;
    }
    float _778 = _762;
    bool _780 = !_750;
    float _782 = _778;
    if (!_780)
    {
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _788 = _742 + _786;
        float _790 = rsqrt(_740);
        float _792 = _788 * _784;
        float _794 = _756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = _792 * 0.15915493667125701904296875;
        float _798 = _796 * 6.283185482025146484375;
        float _800 = cos(_798);
        float _802 = _796 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 + (-1.0);
        float _808 = _806 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _810 = fma(_804, _794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _812 = fma(_756, _800, _808);
        float _814 = _790 * _810;
        float _816 = fma(_736, _814, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _818 = fma(_732, _814, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _782 = _812;
        _772 = _816;
        _776 = _818;
        _764 = _796;
    }
    float _820 = _782;
    float _822 = _772;
    float _824 = _776;
    float _826 = _764;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _820 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = _822 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = _824 + _836;
    float _840 = _830 * _830;
    float _842 = fma(_834, _834, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = rsqrt(_844);
    float _848 = sqrt(_844);
    float _850 = _846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _852 = _834 * _850;
    float _854 = _838 * _850;
    float _856 = _852 * _852;
    float _858 = _854 * _854;
    float _860 = _856 + _858;
    float _862 = sqrt(_860);
    bool _864 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _862 + _866;
    float _870 = _846;
    float _872 = _860;
    float _874 = _868;
    float _876 = _826;
    float _878 = _850;
    float _880 = _830;
    if (_864)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _870 = _882;
    }
    float _884 = _870;
    if (_864)
    {
        float _886 = rsqrt(_860);
        _872 = _886;
    }
    float _888 = _872;
    if (_864)
    {
        float _890 = _868 * _884;
        _874 = _890;
    }
    float _892 = _874;
    if (_864)
    {
        float _894 = _892 * 0.15915493667125701904296875;
        _876 = _894;
    }
    float _896 = _876;
    float _898 = _884;
    if (_864)
    {
        float _900 = _896 * 6.283185482025146484375;
        float _902 = sin(_900);
        _898 = _902;
    }
    float _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = precise::max(0.0, _906);
    float _910 = _838;
    float _912 = _908;
    if (_864)
    {
        float _914 = _896 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = -_850;
    float _922 = -_908;
    float _924 = fma(_830, _920, _922);
    if (_864)
    {
        float _926 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _926;
    }
    float _928 = _912;
    float _930 = _904;
    float _932 = _928;
    if (_864)
    {
        float _934 = fma(_904, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _878 = _934;
    }
    float _936 = _878;
    float _938 = _936;
    if (!_864)
    {
        _930 = _852;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_864)
    {
        _932 = _924;
    }
    float _944 = _932;
    float _946 = _944;
    float _948 = _918;
    if (_864)
    {
        float _950 = _918 + (-1.0);
        _880 = _950;
    }
    float _952 = _880;
    float _954 = _952;
    if (_864)
    {
        float _956 = _888 * _936;
        _766 = _956;
    }
    float _958 = _766;
    if (!_864)
    {
        _938 = _856;
    }
    float _960 = _938;
    float _962 = _820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _960;
    if (_864)
    {
        float _966 = _952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _768 = _966;
    }
    float _968 = _768;
    if (_864)
    {
        float _970 = _852 * _958;
        _942 = _970;
    }
    float _972 = _942;
    if (!_864)
    {
        _954 = _854;
    }
    float _974 = _954;
    float _976 = _974;
    if (_864)
    {
        float _978 = _854 * _958;
        _976 = _978;
    }
    float _980 = _976;
    if (_864)
    {
        float _982 = fma(_924, _918, _968);
        _946 = _982;
    }
    float _984 = _946;
    if (_864)
    {
        float _986 = _972 * _972;
        _964 = _986;
    }
    float _988 = _964;
    if (!_864)
    {
        _948 = _858;
    }
    float _990 = _948;
    float _992 = _990;
    if (_864)
    {
        float _994 = _980 * _980;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = fma(_984, _984, _988);
    float _1000 = _998 + _996;
    float _1002 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1012 = rsqrt(_1000);
    float _1014 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = _820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1022 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1010);
    float _1024 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1026 = _820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1020);
    float _1030 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1022);
    float _1032 = abs(_1018);
    float _1034 = log2(_1032);
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1038 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1028);
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1048 = _1012 * _972;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1052 = _1012 * _984;
    float _1054 = -_1042;
    float _1056 = fma(_1054, _1036, 1.0);
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1060 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1044);
    float _1062 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1050);
    float _1064 = _1012 * _980;
    float _1066 = -_1058;
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1066);
    float _1070 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1062);
    float _1074 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1076 = -_1064;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1068);
    float _1080 = log2(_1056);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1072);
    float _1084 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1086 = fma(_1078, -0.5, 0.5);
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1078, 0.5, 0.5);
    float _1092 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1084);
    float _1094 = _1052 + 1.0;
    float _1096 = exp2(_1074);
    float _1098 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1100 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1092);
    float _1102 = fma(_1090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1104 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1098);
    float _1106 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1100);
    float _1108 = fma(_1090, _1102, -0.212114393711090087890625);
    float _1110 = 1.0 / _1082;
    float _1112 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1104);
    float _1114 = _1080 * 0.693147182464599609375;
    float _1116 = fma(_1090, _1108, 1.570728778839111328125);
    float _1118 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1120 = sqrt(_1086);
    float _1122 = -_1052;
    float _1124 = fma(_1096, _1094, _1122);
    float _1126 = fma(_1124, 0.5, 0.5);
    float _1128 = _1106 * _1110;
    float _1130 = _1112 * _1110;
    float _1132 = fma(_1128, 0.5, 0.5);
    float _1134 = fma(_1130, -0.5, 0.5);
    float _1136 = _1120 * 0.636619746685028076171875;
    float _1138 = -_1116;
    float _1140 = fma(_1136, _1138, 1.0);
    float3 _3426 = float3(_1132, _1134, _1118);
    float _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3426, float3(0.0), isnan(_3426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3426, float3(0.0), isnan(_3426)), level(0.0)).x;
    float3 _3437 = float3(_1132, _1134, _1118);
    float4 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3437, float3(0.0), isnan(_3437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3437, float3(0.0), isnan(_3437)), level(0.0)).xyzw;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float _1153 = _1145.w;
    float2 _3454 = float2(_1140, _1126);
    float3 _1157 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3454, float2(0.0), isnan(_3454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3454, float2(0.0), isnan(_3454)), level(0.0)).xyz;
    float _1159 = _1157.x;
    float _1161 = _1157.y;
    float _1163 = _1157.z;
    float _1165 = in.m_67.y;
    float _1167 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1175 = _1173 != 0;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1181 = exp2(_1167);
    bool _1183 = _338 > 0.5;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1193 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1195 = isnan(_334);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1207 = _1112;
    float _1209 = _1106;
    if (_1171)
    {
        float _1211 = in.m_59.x;
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = 1.0 / _1179;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1223 = _1221 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1225 = -_1165;
    float _1227 = _1225 + 1.0;
    bool _1229 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1231 = isnan(_334);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -_1181;
    float _1243 = _1241 + 1.0;
    float _1245 = 1.0 / _1187;
    float _1247 = in.m_67.x;
    float _1249 = _1165;
    float _1251 = _1247;
    if (_1175)
    {
        float _1253 = _1183 ? _1227 : _1165;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = -_1239;
    float _1259 = _1257 + 1.0;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1263 = 1.0 / _1191;
    float _1265 = in.m_69.x;
    float _1267 = in.m_69.y;
    float _1269 = in.m_69.z;
    float _1271 = _1223 * _1215;
    float _1273 = -_1203;
    float _1275 = _1273 + 1.0;
    bool _1277 = _1213 > 0.5;
    bool _1279 = _1277 && _1171;
    float _1281 = _1219 * _1245;
    bool _1283 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1285 = isnan(_334);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1301 = _334 + _1299;
    float _1303 = _1293 * _1275;
    float _1305 = -_1293;
    float _1307 = _1305 + 1.0;
    float _1309 = _1297 * _1263;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1313 = _334 + _1311;
    float _1315 = fma(_1281, _1301, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1317 = _1239 * _1307;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1321 = _334 + _1319;
    float _1323 = fma(_1271, _1313, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1325 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1327 = isnan(_334);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = fma(_1309, _1321, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1339 = _514 * _1269;
    float _1341 = _498 * _1269;
    float _1343 = _1335 * _1259;
    float _1345 = -_1335;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1339;
    float _1351 = fma(_498, _1267, _1349);
    float _1353 = fma(_514, _1267, _1341);
    float _1355 = _482 * _1265;
    float _1357 = _1315 * _1343;
    float _1359 = _576 * _1351;
    float _1361 = _542 * _1351;
    float _1363 = fma(_464, _1353, _1355);
    float _1365 = _464 * _1265;
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1357);
    if (_1171)
    {
        _412 = _1247;
    }
    float _1369 = _412;
    float _1371 = fma(_542, _1363, _1359);
    float _1373 = -_1361;
    float _1375 = fma(_576, _1363, _1373);
    float _1377 = -_1365;
    float _1379 = fma(_482, _1353, _1377);
    float _1381 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1383 = -_1371;
    float _1385 = _1383 + _1267;
    float _1387 = -_1375;
    float _1389 = _1387 + _1265;
    float _1391 = _1369;
    if (_1279)
    {
        float _1393 = -_1369;
        float _1395 = _1393 + 1.0;
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1401 = fma(_1385, _484, _1371);
    float _1403 = fma(_1389, _484, _1375);
    float _1405 = -_1379;
    float _1407 = _1405 + _1269;
    if (_1171)
    {
        _1251 = _1397;
    }
    float _1409 = _1251;
    float _1411 = _1401 * _1401;
    bool _1413 = _668 != 0.0;
    bool _1415 = isnan(_668);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = fma(_1407, _484, _1379);
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1427 = fma(_1403, _1403, _1411);
    bool _1429 = _670 == 0.0;
    bool _1431 = !_1421;
    bool _1433 = _1429 && _1431;
    float _1435 = fma(_1323, _1317, _1367);
    float _1437 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1399);
    float _1439 = fma(_1423, _1423, _1427);
    bool _1441 = _664 == 0.0;
    bool _1443 = _1441 && _1433;
    float _1445 = fma(_1337, _1303, _1435);
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1449 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1437);
    float _1451 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1445);
    float _1453 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1457 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1449);
    float _1459 = rsqrt(_1439);
    float _1461 = _1381 * _1425;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1106;
    out.gl_Position.y = _1112;
    out.gl_Position.z = _1457;
    out.gl_Position.w = _1082;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1471 = _1453 * _1447;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1471;
    out.m_71.y = _1461;
    float _1477 = -_1265;
    float _1479 = fma(_1403, _1459, _1477);
    float _1481 = -_1267;
    float _1483 = fma(_1401, _1459, _1481);
    float _1485 = -_1269;
    float _1487 = fma(_1423, _1459, _1485);
    out.m_73.x = _1465;
    out.m_73.y = _1473;
    out.m_73.z = _1475;
    out.m_73.w = _1467;
    float _1489 = fma(_640, _1479, _1265);
    float _1491 = fma(_640, _1483, _1267);
    float _1493 = fma(_640, _1487, _1269);
    float _1495 = _1457 + _1082;
    float _1497 = _1489;
    float _1499 = _1491;
    float _1501 = _1493;
    float _1503 = _1457;
    if (!_1443)
    {
        float _1505 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1497 = _1505;
    }
    float _1507 = _1497;
    if (!_1443)
    {
        float _1509 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1499 = _1509;
    }
    float _1511 = _1499;
    if (!_1443)
    {
        float _1513 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1493);
        _1501 = _1513;
    }
    float _1515 = _1501;
    bool _1517 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1519 = isnan(_848);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1525 = _1521 || _1523;
    float _1527 = _430 * _1511;
    float _1529 = _452 * _1511;
    float _1531 = _434 * _1511;
    float _1533 = fma(_658, _1507, _1527);
    float _1535 = fma(_660, _1507, _1529);
    float _1537 = fma(_662, _1507, _1531);
    float _1539 = fma(_684, _1515, _1533);
    float _1541 = _1495 * 0.5;
    float _1543 = fma(_700, _1515, _1537);
    float _1545 = fma(_712, _1515, _1535);
    if (!_1525)
    {
        _1503 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1547 = _1503;
    out.m_75.z = _1541;
    out.m_75.w = _1082;
    float _1549 = _1547;
    float _1551 = _1547;
    if (!_1525)
    {
        _1207 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1553 = _1207;
    float _1555 = _1553;
    float _1557 = _1553;
    if (!_1525)
    {
        _1209 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1559 = _1209;
    out.m_77.x = _1539;
    out.m_77.y = _1545;
    out.m_77.z = _1543;
    float _1561 = _1261 * _1142;
    float _1563 = -_1261;
    float _1565 = _1563 + 1.0;
    float _1567 = _1153 * _1561;
    float _1569 = _1163 * _1561;
    float _1571 = _1153 * _1565;
    float _1573 = fma(_1159, _1567, _1147);
    float _1575 = fma(_1161, _1567, _1149);
    float _1577 = fma(_1153, _1569, _1151);
    out.m_79.x = _1573;
    out.m_79.y = _1575;
    out.m_79.z = _1577;
    out.m_79.w = _1571;
    bool _1579 = !_1525;
    float _1581 = _1559;
    float _1583 = _1559;
    if (!_1579)
    {
        bool _1585 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1587 = isnan(_848);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1593 = _1589 || _1591;
        if (!_1593)
        {
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = _848 + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1599;
            float _1603 = 1.0 / _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1613 = _1597 * _1603;
            float _1615 = precise::clamp(_1613, 0.0, 1.0);
            float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1619 = _1617 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1621 = fma(_1615, _1611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1623 = fma(_1615, _1619, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1625 = fma(_1615, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1557 = _1625;
            _1551 = _1623;
            _1583 = _1621;
            _1627 = true;
        }
        else
        {
            bool _1629 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1631 = isnan(_848);
            bool _1633 = _1629 || _1631;
            bool _1635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1637 = _1633 || _1635;
            if (!_1637)
            {
                _1549 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1639 = _1549;
            _1551 = _1639;
            if (!_1637)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1641 = _1555;
            _1557 = _1641;
            if (!_1637)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1643 = _1581;
            bool _1645 = !_1637;
            _1583 = _1643;
            if (!_1645)
            {
                bool _1647 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1649 = isnan(_848);
                bool _1651 = _1647 || _1649;
                bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1655 = _1651 || _1653;
                if (!_1655)
                {
                    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1659 = _848 + _1657;
                    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1661;
                    float _1665 = 1.0 / _1663;
                    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1669 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1673 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1675 = _1659 * _1665;
                    float _1677 = precise::clamp(_1675, 0.0, 1.0);
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1683 = fma(_1677, _1673, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1685 = fma(_1677, _1681, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1687 = fma(_1677, _1669, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1557 = _1687;
                    _1551 = _1685;
                    _1583 = _1683;
                    _1627 = true;
                }
                else
                {
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1551 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1627 = false;
    float _1689 = _1557;
    float _1691 = _1551;
    float _1693 = _1583;
    float _1695 = _1689 * 0.586610972881317138671875;
    bool _1697 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_81.x = 0.0;
    float _1699 = fma(_1691, 0.298911988735198974609375, _1695);
    float _1701 = fma(_1693, 0.114477999508380889892578125, _1699);
    out.m_83.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1703 = -_1701;
    float _1705 = _1703 + _1691;
    float _1707 = -_1701;
    float _1709 = _1707 + _1689;
    float _1711 = -_1701;
    float _1713 = _1711 + _1693;
    float _1715 = fma(_1705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    float _1717 = fma(_1709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    float _1719 = fma(_1713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    out.m_47.x = 1.0;
    out.m_85.x = _1715;
    out.m_85.y = _1717;
    out.m_85.z = _1719;
    if (!_1697)
    {
        return out;
    }
    float _1721 = -_820;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1725 = -_822;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1729 = -_824;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1733 = _1723 * _1723;
    float _1735 = fma(_1727, _1727, _1733);
    float _1737 = fma(_1731, _1731, _1735);
    float _1739 = sqrt(_1737);
    float _1741 = rsqrt(_1737);
    float _1743 = -_1739;
    float _1745 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1747 = _1745 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = _1727 * _1741;
    float _1753 = _1723 * _1741;
    float _1755 = abs(_1749);
    float _1757 = log2(_1755);
    float _1759 = _1731 * _1741;
    float _1761 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1763 = _1545 * _1753;
    float _1765 = -_1753;
    float _1767 = -_1761;
    float _1769 = fma(_1765, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1767);
    float _1771 = fma(_1539, _1751, _1763);
    float _1773 = -_1759;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1769);
    float _1777 = fma(_1543, _1759, _1771);
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1783 = _1775 + _1781;
    float _1785 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1787 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1789 = precise::clamp(_1787, 0.0, 1.0);
    float _1791 = exp2(_1785);
    float _1793 = _1791 * _1789;
    float _1795 = _1779 * _1793;
    float _1797 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1799 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1801 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _1797;
    out.m_81.y = _1799;
    out.m_81.z = _1801;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1627 = false;
    bool _326 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1858 = as_type<float>(_120);
        out.gl_Position.z = _1858;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _114 = _140;
    }
    float _142 = _114;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1927 = as_type<float>(_156);
        out.gl_Position.z = _1927;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _162 = in.m_53.z;
    float _164 = in.m_51.y;
    float _166 = in.m_55.z;
    float _168 = in.m_53.y;
    float _170 = in.m_55.y;
    float _172 = _158 * _158;
    float _174 = in.m_51.x;
    float _176 = fma(_162, _162, _172);
    float _178 = in.m_53.x;
    float _180 = _164 * _164;
    float _182 = in.m_55.x;
    float _184 = fma(_166, _166, _176);
    float _186 = fma(_168, _168, _180);
    float _188 = sqrt(_184);
    float _190 = fma(_170, _170, _186);
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = sqrt(_190);
    bool _200 = _188 > 0.0;
    bool _202 = _198 > 0.0;
    float _204 = 0.0;
    if (_200)
    {
        float _206 = rsqrt(_184);
        _204 = _206;
    }
    float _208 = _204;
    float _210 = _164 * _194;
    float _212 = _168 * _194;
    float _214 = _170 * _194;
    float _216 = 0.0;
    float _218 = _192;
    if (!_200)
    {
        _216 = 0.0;
    }
    float _220 = _216;
    float _222 = fma(_192, _174, _210);
    float _224 = fma(_192, _178, _212);
    float _226 = fma(_192, _182, _214);
    float _228 = _190;
    float _230 = _220;
    if (_202)
    {
        float _232 = rsqrt(_190);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    if (!_202)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    float _240 = fma(_158, _196, _222);
    float _242 = 0.0;
    float _244 = _238;
    if (!_202)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = fma(_162, _196, _224);
    float _250 = 0.0;
    float _252 = _246;
    if (!_202)
    {
        _250 = 0.0;
    }
    float _254 = _250;
    float _256 = fma(_166, _196, _226);
    float _258 = 0.0;
    float _260 = _254;
    if (!_200)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _262;
    if (_200)
    {
        float _266 = _208 * 0.001000000047497451305389404296875;
        _218 = _266;
    }
    float _268 = _218;
    float _270 = 0.0;
    if (!_200)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = _272;
    if (_200)
    {
        float _276 = _162 * _268;
        _230 = _276;
    }
    float _278 = _230;
    if (_200)
    {
        float _280 = _158 * _268;
        _264 = _280;
    }
    float _282 = _264;
    if (_200)
    {
        float _284 = _166 * _268;
        _274 = _284;
    }
    float _286 = _274;
    if (_202)
    {
        float _288 = _234 * _168;
        _244 = _288;
    }
    float _290 = _244;
    float _292 = _290;
    if (_202)
    {
        float _294 = _234 * _164;
        _252 = _294;
    }
    float _296 = _252;
    float _298 = _296;
    if (_202)
    {
        float _300 = _234 * _170;
        _260 = _300;
    }
    float _302 = _260;
    bool _304 = !_160;
    float _306 = _302;
    float _324;
    if (!_304)
    {
        float _308 = in.m_59.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_104);
        float _330 = 1.0 / _328;
        float _332 = _138 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_59.x;
    float _338 = in.m_59.y;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    float _346 = fma(0.2000000476837158203125, _336, 0.89999997615814208984375);
    float _348 = _336 * 100.0;
    float _350 = _240 * _240;
    float _352 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _354 = _340 > 0.0;
    float _356 = fma(_248, _248, _350);
    bool _358 = _340 >= 0.0;
    bool _360 = isnan(_340);
    bool _362 = _358 || _360;
    bool _364 = isnan(0.0);
    bool _366 = _362 || _364;
    float _368 = fma(_138, _352, _348);
    float _370 = fma(_138, 0.00999999977648258209228515625, _348);
    float _372 = fma(_256, _256, _356);
    float _374 = abs(_340);
    float _376 = -_374;
    float _378 = _376 + 1.0;
    float _380 = abs(_340);
    float _382 = -_380;
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[191].y, _368);
    float _386 = _370 * 0.15915493667125701904296875;
    float _388 = rsqrt(_372);
    float _390 = in.m_63.x;
    float _392 = in.m_63.y;
    float _394 = in.m_63.z;
    float _396 = _384 * 0.15915493667125701904296875;
    int _398 = _366 ? 0 : 1;
    int _400 = ~_398;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = _396 * 6.283185482025146484375;
    float _408 = sin(_406);
    int _410 = _404;
    float _412 = _334;
    if (!_354)
    {
        int _414 = ~_398;
        int _416 = _414 + 1;
        _410 = _416;
    }
    int _418 = _410;
    float _420 = -_378;
    float _422 = fma(_420, _378, 1.0);
    float _424 = float(_418);
    float _426 = _396 * 6.283185482025146484375;
    float _428 = cos(_426);
    float _430 = _248 * _388;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _434 = _256 * _388;
    float _436 = _408 * _432;
    float _438 = _386 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = in.m_44.x;
    float _444 = in.m_44.y;
    float _446 = in.m_44.z;
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = _436 * 0.15915493667125701904296875;
    float _452 = _240 * _388;
    float _454 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _428 * _422;
    float _460 = _452 * _296;
    float _462 = _450 * 6.283185482025146484375;
    float _464 = sin(_462);
    float _466 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = _458 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _470 = fma(_430, _290, _460);
    float _472 = _458 * _432;
    float _474 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _476 = _468 * 0.15915493667125701904296875;
    float _478 = fma(_434, _302, _470);
    float _480 = _450 * 6.283185482025146484375;
    float _482 = cos(_480);
    float _484 = in.m_65.x;
    float _486 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _488 = abs(_478);
    bool _490 = _488 > 0.99989998340606689453125;
    float _492 = _472 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _494 = _168 * _444;
    float _496 = _476 * 6.283185482025146484375;
    float _498 = cos(_496);
    float _500 = _170 * _444;
    float _502 = _492 * 0.15915493667125701904296875;
    float _504 = fma(_178, _442, _494);
    float _506 = _164 * _444;
    float _508 = fma(_182, _442, _500);
    float _510 = fma(_162, _446, _504);
    float _512 = _476 * 6.283185482025146484375;
    float _514 = sin(_512);
    if (_490)
    {
        float _516 = _290 + _278;
        _292 = _516;
    }
    float _518 = _292;
    if (_490)
    {
        float _520 = _302 + _286;
        _306 = _520;
    }
    float _522 = _306;
    float _524 = fma(_166, _446, _508);
    if (_490)
    {
        float _526 = _296 + _282;
        _298 = _526;
    }
    float _528 = _298;
    float _530 = -_518;
    float _532 = _434 * _530;
    float _534 = -_522;
    float _536 = _452 * _534;
    float _538 = _368 * 0.15915493667125701904296875;
    float _540 = _502 * 6.283185482025146484375;
    float _542 = sin(_540);
    float _544 = -_522;
    float _546 = -_532;
    float _548 = fma(_430, _544, _546);
    float _550 = -_528;
    float _552 = _430 * _550;
    float _554 = -_528;
    float _556 = -_536;
    float _558 = fma(_434, _554, _556);
    float _560 = fma(_440, 2.0, 2.0);
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _548 * _548;
    float _566 = _498 * _344;
    float _568 = -_518;
    float _570 = -_552;
    float _572 = fma(_452, _568, _570);
    float _574 = _502 * 6.283185482025146484375;
    float _576 = cos(_574);
    float _578 = _514 * _344;
    float _580 = fma(_558, _558, _564);
    float _582 = _464 * _340;
    float _584 = fma(_514, _342, _566);
    float _586 = _482 * _340;
    float _588 = -_578;
    float _590 = fma(_498, _342, _588);
    float _592 = fma(_572, _572, _580);
    float _594 = _538 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = -_582;
    float _600 = fma(_584, _482, _598);
    float _602 = fma(_584, _464, _586);
    float _604 = _590 * _542;
    float _606 = -_600;
    float _608 = _606 + _344;
    float _610 = fma(_174, _442, _506);
    float _612 = _590 * _576;
    float _614 = rsqrt(_592);
    float _616 = -_604;
    float _618 = fma(_602, _576, _616);
    float _620 = fma(_608, _484, _600);
    float _622 = fma(_602, _542, _612);
    float _624 = fma(_562, 0.949999988079071044921875, -1.0);
    float _626 = -_618;
    float _628 = _626 + _340;
    float _630 = fma(_158, _446, _610);
    float _632 = -_622;
    float _634 = _632 + _342;
    float _636 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[191].w, _620);
    float _638 = fma(_628, _484, _618);
    float _640 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _642 = fma(_634, _484, _622);
    float _644 = -_344;
    float _646 = _636 + _644;
    float _648 = in.m_55.w;
    float _650 = -_340;
    float _652 = _638 + _650;
    float _654 = -_342;
    float _656 = _642 + _654;
    float _658 = _558 * _614;
    float _660 = _548 * _614;
    float _662 = _572 * _614;
    float _664 = fma(_640, _646, _344);
    float _666 = in.m_53.w;
    float _668 = fma(_640, _656, _342);
    float _670 = fma(_640, _652, _340);
    float _672 = _452 * _662;
    float _674 = _434 * _658;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _682 = -_672;
    float _684 = fma(_434, _660, _682);
    float _686 = _456 * _676;
    float _688 = _474 * _678;
    float _690 = _430 * _660;
    float _692 = _486 * _680;
    float _694 = _686 * _434;
    float _696 = _686 * _430;
    float _698 = -_690;
    float _700 = fma(_452, _658, _698);
    float _702 = _524 + _648;
    float _704 = fma(_688, _662, _694);
    float _706 = fma(_688, _658, _696);
    float _708 = _686 * _452;
    float _710 = -_674;
    float _712 = fma(_430, _662, _710);
    float _714 = fma(_692, _700, _704);
    float _716 = fma(_692, _684, _706);
    float _718 = _510 + _666;
    float _720 = fma(_688, _660, _708);
    float _722 = _702 + _714;
    float _724 = in.m_51.w;
    float _726 = _718 + _716;
    float _728 = fma(_692, _712, _720);
    float _730 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _732 = _722 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _736 = _726 + _734;
    float _738 = _732 * _732;
    float _740 = fma(_736, _736, _738);
    float _742 = sqrt(_740);
    float _744 = _630 + _724;
    float _746 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _748 = _744 + _746;
    bool _750 = _742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _748 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _754 = _752 + 200.0;
    float _756 = _728 + _754;
    float _758 = _688;
    float _760 = _726;
    float _762 = _724;
    float _764 = _742;
    float _766 = 0.949999988079071044921875;
    float _768 = _756;
    if (!_750)
    {
        _758 = _726;
    }
    float _770 = _758;
    float _772 = _770;
    if (!_750)
    {
        _760 = _722;
    }
    float _774 = _760;
    float _776 = _774;
    if (!_750)
    {
        _762 = _756;
    }
    float _778 = _762;
    bool _780 = !_750;
    float _782 = _778;
    if (!_780)
    {
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _788 = _742 + _786;
        float _790 = rsqrt(_740);
        float _792 = _788 * _784;
        float _794 = _756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = _792 * 0.15915493667125701904296875;
        float _798 = _796 * 6.283185482025146484375;
        float _800 = cos(_798);
        float _802 = _796 * 6.283185482025146484375;
        float _804 = sin(_802);
        float _806 = _800 + (-1.0);
        float _808 = _806 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _810 = fma(_804, _794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _812 = fma(_756, _800, _808);
        float _814 = _790 * _810;
        float _816 = fma(_736, _814, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _818 = fma(_732, _814, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _782 = _812;
        _772 = _816;
        _776 = _818;
        _764 = _796;
    }
    float _820 = _782;
    float _822 = _772;
    float _824 = _776;
    float _826 = _764;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _820 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = _822 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = _824 + _836;
    float _840 = _830 * _830;
    float _842 = fma(_834, _834, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = rsqrt(_844);
    float _848 = sqrt(_844);
    float _850 = _846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _852 = _834 * _850;
    float _854 = _838 * _850;
    float _856 = _852 * _852;
    float _858 = _854 * _854;
    float _860 = _856 + _858;
    float _862 = sqrt(_860);
    bool _864 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _862 + _866;
    float _870 = _846;
    float _872 = _860;
    float _874 = _868;
    float _876 = _826;
    float _878 = _850;
    float _880 = _830;
    if (_864)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _870 = _882;
    }
    float _884 = _870;
    if (_864)
    {
        float _886 = rsqrt(_860);
        _872 = _886;
    }
    float _888 = _872;
    if (_864)
    {
        float _890 = _868 * _884;
        _874 = _890;
    }
    float _892 = _874;
    if (_864)
    {
        float _894 = _892 * 0.15915493667125701904296875;
        _876 = _894;
    }
    float _896 = _876;
    float _898 = _884;
    if (_864)
    {
        float _900 = _896 * 6.283185482025146484375;
        float _902 = sin(_900);
        _898 = _902;
    }
    float _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = precise::max(0.0, _906);
    float _910 = _838;
    float _912 = _908;
    if (_864)
    {
        float _914 = _896 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = -_850;
    float _922 = -_908;
    float _924 = fma(_830, _920, _922);
    if (_864)
    {
        float _926 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _926;
    }
    float _928 = _912;
    float _930 = _904;
    float _932 = _928;
    if (_864)
    {
        float _934 = fma(_904, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _878 = _934;
    }
    float _936 = _878;
    float _938 = _936;
    if (!_864)
    {
        _930 = _852;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_864)
    {
        _932 = _924;
    }
    float _944 = _932;
    float _946 = _944;
    float _948 = _918;
    if (_864)
    {
        float _950 = _918 + (-1.0);
        _880 = _950;
    }
    float _952 = _880;
    float _954 = _952;
    if (_864)
    {
        float _956 = _888 * _936;
        _766 = _956;
    }
    float _958 = _766;
    if (!_864)
    {
        _938 = _856;
    }
    float _960 = _938;
    float _962 = _820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _964 = _960;
    if (_864)
    {
        float _966 = _952 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _768 = _966;
    }
    float _968 = _768;
    if (_864)
    {
        float _970 = _852 * _958;
        _942 = _970;
    }
    float _972 = _942;
    if (!_864)
    {
        _954 = _854;
    }
    float _974 = _954;
    float _976 = _974;
    if (_864)
    {
        float _978 = _854 * _958;
        _976 = _978;
    }
    float _980 = _976;
    if (_864)
    {
        float _982 = fma(_924, _918, _968);
        _946 = _982;
    }
    float _984 = _946;
    if (_864)
    {
        float _986 = _972 * _972;
        _964 = _986;
    }
    float _988 = _964;
    if (!_864)
    {
        _948 = _858;
    }
    float _990 = _948;
    float _992 = _990;
    if (_864)
    {
        float _994 = _980 * _980;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = fma(_984, _984, _988);
    float _1000 = _998 + _996;
    float _1002 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _962);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1012 = rsqrt(_1000);
    float _1014 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = _820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1022 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1010);
    float _1024 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1026 = _820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1020);
    float _1030 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1022);
    float _1032 = abs(_1018);
    float _1034 = log2(_1032);
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1038 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1028);
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1046 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1048 = _1012 * _972;
    float _1050 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1052 = _1012 * _984;
    float _1054 = -_1042;
    float _1056 = fma(_1054, _1036, 1.0);
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1060 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1044);
    float _1062 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1050);
    float _1064 = _1012 * _980;
    float _1066 = -_1058;
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1066);
    float _1070 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1072 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1062);
    float _1074 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1076 = -_1064;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1068);
    float _1080 = log2(_1056);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1072);
    float _1084 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1086 = fma(_1078, -0.5, 0.5);
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1078, 0.5, 0.5);
    float _1092 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1084);
    float _1094 = _1052 + 1.0;
    float _1096 = exp2(_1074);
    float _1098 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1100 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1092);
    float _1102 = fma(_1090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1104 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1098);
    float _1106 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1100);
    float _1108 = fma(_1090, _1102, -0.212114393711090087890625);
    float _1110 = 1.0 / _1082;
    float _1112 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1104);
    float _1114 = _1080 * 0.693147182464599609375;
    float _1116 = fma(_1090, _1108, 1.570728778839111328125);
    float _1118 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1120 = sqrt(_1086);
    float _1122 = -_1052;
    float _1124 = fma(_1096, _1094, _1122);
    float _1126 = fma(_1124, 0.5, 0.5);
    float _1128 = _1106 * _1110;
    float _1130 = _1112 * _1110;
    float _1132 = fma(_1128, 0.5, 0.5);
    float _1134 = fma(_1130, -0.5, 0.5);
    float _1136 = _1120 * 0.636619746685028076171875;
    float _1138 = -_1116;
    float _1140 = fma(_1136, _1138, 1.0);
    float3 _3426 = float3(_1132, _1134, _1118);
    float _1142 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3426, float3(0.0), isnan(_3426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3426, float3(0.0), isnan(_3426)), level(0.0)).x;
    float3 _3437 = float3(_1132, _1134, _1118);
    float4 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3437, float3(0.0), isnan(_3437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3437, float3(0.0), isnan(_3437)), level(0.0)).xyzw;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float _1153 = _1145.w;
    float2 _3454 = float2(_1140, _1126);
    float3 _1157 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3454, float2(0.0), isnan(_3454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3454, float2(0.0), isnan(_3454)), level(0.0)).xyz;
    float _1159 = _1157.x;
    float _1161 = _1157.y;
    float _1163 = _1157.z;
    float _1165 = in.m_67.y;
    float _1167 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1175 = _1173 != 0;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1179 = _1177 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1181 = exp2(_1167);
    bool _1183 = _338 > 0.5;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1193 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1195 = isnan(_334);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1207 = _1112;
    float _1209 = _1106;
    if (_1171)
    {
        float _1211 = in.m_59.x;
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = 1.0 / _1179;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1223 = _1221 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1225 = -_1165;
    float _1227 = _1225 + 1.0;
    bool _1229 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1231 = isnan(_334);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -_1181;
    float _1243 = _1241 + 1.0;
    float _1245 = 1.0 / _1187;
    float _1247 = in.m_67.x;
    float _1249 = _1165;
    float _1251 = _1247;
    if (_1175)
    {
        float _1253 = _1183 ? _1227 : _1165;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = -_1239;
    float _1259 = _1257 + 1.0;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1263 = 1.0 / _1191;
    float _1265 = in.m_69.x;
    float _1267 = in.m_69.y;
    float _1269 = in.m_69.z;
    float _1271 = _1223 * _1215;
    float _1273 = -_1203;
    float _1275 = _1273 + 1.0;
    bool _1277 = _1213 > 0.5;
    bool _1279 = _1277 && _1171;
    float _1281 = _1219 * _1245;
    bool _1283 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1285 = isnan(_334);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1301 = _334 + _1299;
    float _1303 = _1293 * _1275;
    float _1305 = -_1293;
    float _1307 = _1305 + 1.0;
    float _1309 = _1297 * _1263;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1313 = _334 + _1311;
    float _1315 = fma(_1281, _1301, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1317 = _1239 * _1307;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1321 = _334 + _1319;
    float _1323 = fma(_1271, _1313, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1325 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1327 = isnan(_334);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = fma(_1309, _1321, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1339 = _514 * _1269;
    float _1341 = _498 * _1269;
    float _1343 = _1335 * _1259;
    float _1345 = -_1335;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1339;
    float _1351 = fma(_498, _1267, _1349);
    float _1353 = fma(_514, _1267, _1341);
    float _1355 = _482 * _1265;
    float _1357 = _1315 * _1343;
    float _1359 = _576 * _1351;
    float _1361 = _542 * _1351;
    float _1363 = fma(_464, _1353, _1355);
    float _1365 = _464 * _1265;
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1357);
    if (_1171)
    {
        _412 = _1247;
    }
    float _1369 = _412;
    float _1371 = fma(_542, _1363, _1359);
    float _1373 = -_1361;
    float _1375 = fma(_576, _1363, _1373);
    float _1377 = -_1365;
    float _1379 = fma(_482, _1353, _1377);
    float _1381 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1383 = -_1371;
    float _1385 = _1383 + _1267;
    float _1387 = -_1375;
    float _1389 = _1387 + _1265;
    float _1391 = _1369;
    if (_1279)
    {
        float _1393 = -_1369;
        float _1395 = _1393 + 1.0;
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1401 = fma(_1385, _484, _1371);
    float _1403 = fma(_1389, _484, _1375);
    float _1405 = -_1379;
    float _1407 = _1405 + _1269;
    if (_1171)
    {
        _1251 = _1397;
    }
    float _1409 = _1251;
    float _1411 = _1401 * _1401;
    bool _1413 = _668 != 0.0;
    bool _1415 = isnan(_668);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = fma(_1407, _484, _1379);
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1427 = fma(_1403, _1403, _1411);
    bool _1429 = _670 == 0.0;
    bool _1431 = !_1421;
    bool _1433 = _1429 && _1431;
    float _1435 = fma(_1323, _1317, _1367);
    float _1437 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1399);
    float _1439 = fma(_1423, _1423, _1427);
    bool _1441 = _664 == 0.0;
    bool _1443 = _1441 && _1433;
    float _1445 = fma(_1337, _1303, _1435);
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1449 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1437);
    float _1451 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1445);
    float _1453 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1457 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1449);
    float _1459 = rsqrt(_1439);
    float _1461 = _1381 * _1425;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1106;
    out.gl_Position.y = _1112;
    out.gl_Position.z = _1457;
    out.gl_Position.w = _1082;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1471 = _1453 * _1447;
    float _1473 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1471;
    out.m_71.y = _1461;
    float _1477 = -_1265;
    float _1479 = fma(_1403, _1459, _1477);
    float _1481 = -_1267;
    float _1483 = fma(_1401, _1459, _1481);
    float _1485 = -_1269;
    float _1487 = fma(_1423, _1459, _1485);
    out.m_73.x = _1465;
    out.m_73.y = _1473;
    out.m_73.z = _1475;
    out.m_73.w = _1467;
    float _1489 = fma(_640, _1479, _1265);
    float _1491 = fma(_640, _1483, _1267);
    float _1493 = fma(_640, _1487, _1269);
    float _1495 = _1457 + _1082;
    float _1497 = _1489;
    float _1499 = _1491;
    float _1501 = _1493;
    float _1503 = _1457;
    if (!_1443)
    {
        float _1505 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1489);
        _1497 = _1505;
    }
    float _1507 = _1497;
    if (!_1443)
    {
        float _1509 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1491);
        _1499 = _1509;
    }
    float _1511 = _1499;
    if (!_1443)
    {
        float _1513 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1493);
        _1501 = _1513;
    }
    float _1515 = _1501;
    bool _1517 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1519 = isnan(_848);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1525 = _1521 || _1523;
    float _1527 = _430 * _1511;
    float _1529 = _452 * _1511;
    float _1531 = _434 * _1511;
    float _1533 = fma(_658, _1507, _1527);
    float _1535 = fma(_660, _1507, _1529);
    float _1537 = fma(_662, _1507, _1531);
    float _1539 = fma(_684, _1515, _1533);
    float _1541 = _1495 * 0.5;
    float _1543 = fma(_700, _1515, _1537);
    float _1545 = fma(_712, _1515, _1535);
    if (!_1525)
    {
        _1503 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1547 = _1503;
    out.m_75.z = _1541;
    out.m_75.w = _1082;
    float _1549 = _1547;
    float _1551 = _1547;
    if (!_1525)
    {
        _1207 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1553 = _1207;
    float _1555 = _1553;
    float _1557 = _1553;
    if (!_1525)
    {
        _1209 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1559 = _1209;
    out.m_77.x = _1539;
    out.m_77.y = _1545;
    out.m_77.z = _1543;
    float _1561 = _1261 * _1142;
    float _1563 = -_1261;
    float _1565 = _1563 + 1.0;
    float _1567 = _1153 * _1561;
    float _1569 = _1163 * _1561;
    float _1571 = _1153 * _1565;
    float _1573 = fma(_1159, _1567, _1147);
    float _1575 = fma(_1161, _1567, _1149);
    float _1577 = fma(_1153, _1569, _1151);
    out.m_79.x = _1573;
    out.m_79.y = _1575;
    out.m_79.z = _1577;
    out.m_79.w = _1571;
    bool _1579 = !_1525;
    float _1581 = _1559;
    float _1583 = _1559;
    if (!_1579)
    {
        bool _1585 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1587 = isnan(_848);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1593 = _1589 || _1591;
        if (!_1593)
        {
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1597 = _848 + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1601 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1599;
            float _1603 = 1.0 / _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1613 = _1597 * _1603;
            float _1615 = precise::clamp(_1613, 0.0, 1.0);
            float _1617 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1619 = _1617 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1621 = fma(_1615, _1611, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1623 = fma(_1615, _1619, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1625 = fma(_1615, _1607, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1557 = _1625;
            _1551 = _1623;
            _1583 = _1621;
            _1627 = true;
        }
        else
        {
            bool _1629 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1631 = isnan(_848);
            bool _1633 = _1629 || _1631;
            bool _1635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1637 = _1633 || _1635;
            if (!_1637)
            {
                _1549 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1639 = _1549;
            _1551 = _1639;
            if (!_1637)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1641 = _1555;
            _1557 = _1641;
            if (!_1637)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1643 = _1581;
            bool _1645 = !_1637;
            _1583 = _1643;
            if (!_1645)
            {
                bool _1647 = _848 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1649 = isnan(_848);
                bool _1651 = _1647 || _1649;
                bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1655 = _1651 || _1653;
                if (!_1655)
                {
                    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1659 = _848 + _1657;
                    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1661;
                    float _1665 = 1.0 / _1663;
                    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1669 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1673 = _1671 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1675 = _1659 * _1665;
                    float _1677 = precise::clamp(_1675, 0.0, 1.0);
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1683 = fma(_1677, _1673, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1685 = fma(_1677, _1681, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1687 = fma(_1677, _1669, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1557 = _1687;
                    _1551 = _1685;
                    _1583 = _1683;
                    _1627 = true;
                }
                else
                {
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1551 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1627 = false;
    float _1689 = _1557;
    float _1691 = _1551;
    float _1693 = _1583;
    float _1695 = _1689 * 0.586610972881317138671875;
    bool _1697 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_81.x = 0.0;
    float _1699 = fma(_1691, 0.298911988735198974609375, _1695);
    float _1701 = fma(_1693, 0.114477999508380889892578125, _1699);
    out.m_83.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1703 = -_1701;
    float _1705 = _1703 + _1691;
    float _1707 = -_1701;
    float _1709 = _1707 + _1689;
    float _1711 = -_1701;
    float _1713 = _1711 + _1693;
    float _1715 = fma(_1705, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    float _1717 = fma(_1709, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    float _1719 = fma(_1713, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1701);
    out.m_47.x = 1.0;
    out.m_85.x = _1715;
    out.m_85.y = _1717;
    out.m_85.z = _1719;
    if (!_1697)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1721 = -_820;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1725 = -_822;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1729 = -_824;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1733 = _1723 * _1723;
    float _1735 = fma(_1727, _1727, _1733);
    float _1737 = fma(_1731, _1731, _1735);
    float _1739 = sqrt(_1737);
    float _1741 = rsqrt(_1737);
    float _1743 = -_1739;
    float _1745 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1747 = _1745 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = _1727 * _1741;
    float _1753 = _1723 * _1741;
    float _1755 = abs(_1749);
    float _1757 = log2(_1755);
    float _1759 = _1731 * _1741;
    float _1761 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1763 = _1545 * _1753;
    float _1765 = -_1753;
    float _1767 = -_1761;
    float _1769 = fma(_1765, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1767);
    float _1771 = fma(_1539, _1751, _1763);
    float _1773 = -_1759;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1769);
    float _1777 = fma(_1543, _1759, _1771);
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1783 = _1775 + _1781;
    float _1785 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1787 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1789 = precise::clamp(_1787, 0.0, 1.0);
    float _1791 = exp2(_1785);
    float _1793 = _1791 * _1789;
    float _1795 = _1779 * _1793;
    float _1797 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1799 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1801 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _1797;
    out.m_81.y = _1799;
    out.m_81.z = _1801;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

