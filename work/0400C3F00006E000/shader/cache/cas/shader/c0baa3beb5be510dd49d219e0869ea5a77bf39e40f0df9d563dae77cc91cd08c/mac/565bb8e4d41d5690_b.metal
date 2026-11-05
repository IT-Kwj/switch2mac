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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_97 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_75 [[attribute(13)]];
    float4 m_71 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2392 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_118);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_138);
        out.gl_Position.z = _2708;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _142 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_113);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_118);
    bool _154 = _122 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _130;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2763 = as_type<float>(_164);
        out.gl_Position.z = _2763;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.y;
    float _168 = 1.0 / _152;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = in.m_55.z;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = in.m_59.y;
    float _180 = _122 * _168;
    float _182 = in.m_59.z;
    float _184 = _166 * _166;
    float _186 = in.m_57.x;
    float _188 = _172 * _172;
    float _190 = in.m_55.x;
    float _192 = fma(_174, _174, _184);
    float _194 = in.m_59.x;
    float _196 = fma(_176, _176, _188);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_182, _182, _196);
    float _202 = sqrt(_198);
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = sqrt(_200);
    bool _212 = _202 > 0.0;
    bool _214 = _210 > 0.0;
    float _216 = _174 * _206;
    float _218 = _166 * _206;
    float _220 = _178 * _206;
    float _222 = 0.0;
    float _224 = _218;
    float _226 = _190;
    float _228 = _198;
    float _230 = _200;
    float _232 = _180;
    float _234 = _172;
    if (_212)
    {
        float _236 = rsqrt(_198);
        _222 = _236;
    }
    float _238 = _222;
    float _240 = fma(_204, _186, _216);
    float _242 = fma(_204, _190, _218);
    float _244 = fma(_204, _194, _220);
    float _246 = _240;
    if (!_212)
    {
        _224 = 0.0;
    }
    float _248 = _224;
    float _250 = fma(_176, _208, _240);
    float _252 = _248;
    if (!_212)
    {
        _226 = 0.0;
    }
    float _254 = _226;
    float _256 = fma(_172, _208, _242);
    float _258 = 0.0;
    float _260 = _254;
    if (_214)
    {
        float _262 = rsqrt(_200);
        _258 = _262;
    }
    float _264 = _258;
    if (!_214)
    {
        _228 = 0.0;
    }
    float _266 = _228;
    float _268 = fma(_182, _208, _244);
    float _270 = 0.0;
    float _272 = _266;
    if (!_212)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _274;
    if (!_214)
    {
        _246 = 0.0;
    }
    float _278 = _246;
    float _280 = _278;
    if (_212)
    {
        float _282 = _238 * _166;
        _252 = _282;
    }
    float _284 = _252;
    float _286 = _284;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _288 = _230;
    float _290 = _288;
    if (_212)
    {
        float _292 = _238 * _174;
        _260 = _292;
    }
    float _294 = _260;
    float _296 = _294;
    if (_212)
    {
        float _298 = _238 * _178;
        _276 = _298;
    }
    float _300 = _276;
    float _302 = _300;
    if (_214)
    {
        float _304 = _264 * _172;
        _272 = _304;
    }
    float _306 = _272;
    if (_214)
    {
        float _308 = _264 * _176;
        _290 = _308;
    }
    float _310 = _290;
    if (_214)
    {
        float _312 = _264 * _182;
        _280 = _312;
    }
    float _314 = _280;
    bool _316 = !_170;
    float _334;
    if (!_316)
    {
        float _318 = in.m_63.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        _334 = _180;
    }
    _336 = false;
    float _338 = _334;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = _338 + _340;
    bool _344 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_338);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _356;
    bool _360 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_338);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = 1.0 / _358;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = _370 * _374;
    float _386 = -_370;
    float _388 = _386 + 1.0;
    float _390 = _342 * _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = fma(_378, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = _396 * _384;
    float _408 = _404 * _384;
    float _410 = _402 * _384;
    float _412 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _414 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _416 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _418 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].x, _412);
    float _420 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].y, _414);
    float _422 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].z, _416);
    bool _424 = !_382;
    if (!_424)
    {
        float _426 = in.m_63.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _232 = _440;
    }
    float _442 = _232;
    float _444 = in.m_46.x;
    float _446 = in.m_46.y;
    float _448 = in.m_46.z;
    float _450 = _256 * _256;
    float _452 = in.m_65.y;
    float _454 = fma(_250, _250, _450);
    float _456 = in.m_57.w;
    float _458 = fma(_268, _268, _454);
    float _460 = in.m_59.w;
    float _462 = rsqrt(_458);
    float _464 = _174 * _446;
    float _466 = _178 * _446;
    float _468 = fma(_186, _444, _464);
    float _470 = fma(_194, _444, _466);
    float _472 = _446 + _452;
    float _474 = _256 * _462;
    float _476 = fma(_176, _448, _468);
    float _478 = fma(_182, _448, _470);
    float _480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _482 = _472 + _480;
    float _484 = _250 * _462;
    float _486 = _476 + _456;
    float _488 = _478 + _460;
    float _490 = _482 * _482;
    float _492 = _474 * _284;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _496 = _486 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _500 = _488 + _498;
    float _502 = _268 * _462;
    float _504 = fma(_484, _294, _492);
    float _506 = fma(_496, _496, _490);
    float _508 = fma(_502, _300, _504);
    float _510 = fma(_500, _500, _506);
    float _512 = rsqrt(_510);
    float _514 = abs(_508);
    bool _516 = _514 > 0.99989998340606689453125;
    if (_516)
    {
        float _518 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _518;
    }
    float _520 = _296;
    if (_516)
    {
        float _522 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _522;
    }
    float _524 = _302;
    float _526 = _482 * _512;
    float _528 = _496 * _512;
    float _530 = -_520;
    float _532 = _502 * _530;
    float _534 = _528;
    if (_516)
    {
        float _536 = fma(_306, 0.001000000047497451305389404296875, _284);
        _286 = _536;
    }
    float _538 = _286;
    float _540 = -_526;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _544 = -_528;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _548 = -_524;
    float _550 = _474 * _548;
    float _552 = -_524;
    float _554 = -_532;
    float _556 = fma(_484, _552, _554);
    float _558 = _542 * _542;
    float _560 = in.m_67.x;
    float _562 = in.m_67.y;
    float _564 = in.m_67.z;
    float _566 = -_538;
    float _568 = -_550;
    float _570 = fma(_502, _566, _568);
    float _572 = -_538;
    float _574 = _484 * _572;
    float _576 = fma(_546, _546, _558);
    float _578 = _500 * _512;
    float _580 = in.m_69.x;
    float _582 = in.m_69.y;
    float _584 = in.m_69.z;
    float _586 = _556 * _556;
    float _588 = -_520;
    float _590 = -_574;
    float _592 = fma(_474, _588, _590);
    float _594 = -_578;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _598 = fma(_570, _570, _586);
    float _600 = fma(_596, _596, _576);
    float _602 = fma(_592, _592, _598);
    float _604 = sqrt(_600);
    float _606 = rsqrt(_602);
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _560);
    float _610 = _420 * _582;
    float _612 = _422 * _584;
    float _614 = _418 * _580;
    float _616 = _512 * _604;
    float _618 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _620 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _626 = _618 * _616;
    float _628 = _620 * _616;
    float _630 = _622 * _616;
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _564);
    float _634 = _626 * _624;
    float _636 = _556 * _606;
    float _638 = _630 * _608;
    float _640 = _628 * _632;
    float _642 = _570 * _606;
    float _644 = _592 * _606;
    float _646 = _484 * _636;
    float _648 = _634 * _502;
    float _650 = _634 * _484;
    float _652 = _474 * _644;
    float _654 = -_646;
    float _656 = fma(_474, _642, _654);
    float _658 = fma(_638, _644, _648);
    float _660 = fma(_638, _642, _650);
    float _662 = -_652;
    float _664 = fma(_502, _636, _662);
    float _666 = _502 * _642;
    float _668 = fma(_640, _656, _658);
    float _670 = fma(_640, _664, _660);
    float _672 = -_666;
    float _674 = fma(_484, _644, _672);
    float _676 = _488 + _668;
    float _678 = _486 + _670;
    float _680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_686, _686, _688);
    float _692 = _634 * _474;
    float _694 = sqrt(_690);
    float _696 = fma(_638, _636, _692);
    float _698 = fma(_640, _674, _696);
    float _700 = _472 + _698;
    bool _702 = _694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _714 = _712 != 0;
    bool _716 = !_710;
    int _718 = _716 ? 0 : 1;
    bool _720 = !_706;
    int _722 = _720 ? 0 : 1;
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    float _728 = _696;
    float _730 = _676;
    float _732 = _682;
    float _734 = _640;
    float _736 = _578;
    if (!_702)
    {
        _728 = _678;
    }
    float _738 = _728;
    float _740 = _738;
    if (!_702)
    {
        _234 = _700;
    }
    float _742 = _234;
    bool _744 = !_702;
    float _746 = _742;
    if (!_744)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _752 = _694 + _750;
        float _754 = rsqrt(_690);
        float _756 = _752 * _748;
        float _758 = _700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _760 = _756 * 0.15915493667125701904296875;
        float _762 = _760 * 6.283185482025146484375;
        float _764 = cos(_762);
        float _766 = _760 * 6.283185482025146484375;
        float _768 = sin(_766);
        float _770 = _764 + (-1.0);
        float _772 = fma(_768, _758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = _770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _754 * _772;
        float _778 = fma(_700, _764, _774);
        float _780 = fma(_686, _776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _782 = fma(_682, _776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _746 = _778;
        _740 = _780;
        _730 = _782;
    }
    float _784 = _746;
    float _786 = _740;
    float _788 = _730;
    float _790 = -_526;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _794 = -_528;
    float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _798 = -_578;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _792 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _796 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _812 = _800 + _810;
    float _814 = _804 * _804;
    float _816 = -_528;
    float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _486);
    float _820 = -_578;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _824 = fma(_808, _808, _814);
    float _826 = fma(_812, _812, _824);
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _830 = rsqrt(_826);
    float _832 = sqrt(_826);
    float _834 = _830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _836 = _808 * _834;
    float _838 = _812 * _834;
    float _840 = _836 * _836;
    float _842 = _838 * _838;
    float _844 = _840 + _842;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = _700;
    float _856 = _852;
    float _858 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _860 = _838;
    float _862 = _836;
    if (_848)
    {
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _864;
    }
    float _866 = _854;
    if (!_848)
    {
        _534 = _836;
    }
    float _868 = _534;
    float _870 = _868;
    if (_848)
    {
        float _872 = rsqrt(_844);
        _732 = _872;
    }
    float _874 = _732;
    float _876 = _874;
    if (_848)
    {
        float _878 = _852 * _866;
        _856 = _878;
    }
    float _880 = _856;
    float _882 = _792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_848)
    {
        float _884 = _880 * 0.15915493667125701904296875;
        _734 = _884;
    }
    float _886 = _734;
    float _888 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _890 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _882);
    float _892 = _866;
    if (_848)
    {
        float _894 = _886 * 6.283185482025146484375;
        float _896 = sin(_894);
        _892 = _896;
    }
    float _898 = _892;
    float _900 = precise::max(0.0, _888);
    float _902 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _890);
    float _904 = -_834;
    float _906 = -_900;
    float _908 = fma(_804, _904, _906);
    float _910 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _912 = _900;
    if (_848)
    {
        float _914 = _886 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _922 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_848)
    {
        float _924 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _924;
    }
    float _926 = _912;
    float _928 = _926;
    if (!_848)
    {
        _736 = _908;
    }
    float _930 = _736;
    float _932 = _898;
    float _934 = _930;
    if (_848)
    {
        float _936 = fma(_898, _926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _928 = _936;
    }
    float _938 = _928;
    if (_848)
    {
        float _940 = _874 * _938;
        _858 = _940;
    }
    float _942 = _858;
    float _944 = floor(_920);
    if (_848)
    {
        float _946 = _918 + (-1.0);
        _932 = _946;
    }
    float _948 = _932;
    float _950 = _948;
    if (_848)
    {
        float _952 = _836 * _942;
        _870 = _952;
    }
    float _954 = _870;
    if (_848)
    {
        float _956 = _838 * _942;
        _860 = _956;
    }
    float _958 = _860;
    if (!_848)
    {
        _862 = _842;
    }
    float _960 = _862;
    float _962 = _960;
    if (_848)
    {
        float _964 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _964;
    }
    float _966 = _876;
    if (!_848)
    {
        _950 = _840;
    }
    float _968 = _950;
    float _970 = _968;
    if (_848)
    {
        float _972 = _954 * _954;
        _970 = _972;
    }
    float _974 = _970;
    if (_848)
    {
        float _976 = _958 * _958;
        _962 = _976;
    }
    float _978 = _962;
    if (_848)
    {
        float _980 = fma(_908, _918, _966);
        _934 = _980;
    }
    float _982 = _934;
    float _984 = _792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _986 = fma(_822, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _988 = fma(_982, _982, _974);
    float _990 = _792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _984);
    float _994 = _988 + _978;
    float _996 = _792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _998 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _992);
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1004 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1002);
    float _1006 = precise::clamp(_1004, 0.0, 1.0);
    float _1008 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _996);
    float _1010 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1012 = rsqrt(_994);
    float _1014 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1016 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1020 = -_1006;
    float _1022 = _1020 + 1.0;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1030 = floor(_986);
    float _1032 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1028);
    float _1034 = -_1024;
    float _1036 = fma(_1034, _828, 1.0);
    float _1038 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1032);
    float _1040 = abs(_1022);
    float _1042 = log2(_1040);
    float _1044 = _1012 * _954;
    float _1046 = _1012 * _958;
    float _1048 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1038);
    float _1050 = _1012 * _982;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1054 = -_944;
    float _1056 = _920 + _1054;
    float _1058 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1060 = log2(_1036);
    float _1062 = -_1052;
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1062);
    float _1066 = -_1030;
    float _1068 = _986 + _1066;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1058);
    float _1072 = _1050 + 1.0;
    float _1074 = -_1046;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1064);
    float _1078 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1080 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1070);
    float _1082 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1084 = fma(_1076, -0.5, 0.5);
    float _1086 = 1.0 / _1048;
    float _1088 = fma(_1076, 0.5, 0.5);
    float _1090 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1078);
    float _1092 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1080);
    float _1094 = fma(_1088, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1096 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1090);
    float _1098 = _1060 * 0.693147182464599609375;
    float _1100 = exp2(_1082);
    float _1102 = fma(_1088, _1094, -0.212114393711090087890625);
    float _1104 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1096);
    float _1106 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1108 = fma(_1088, _1102, 1.570728778839111328125);
    float _1110 = sqrt(_1084);
    float _1112 = _1092 * _1086;
    float2 _4274 = float2(_1056, _1068);
    float _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4274, float2(0.0), isnan(_4274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4274, float2(0.0), isnan(_4274)), level(0.0)).x;
    float _1116 = fma(_1112, 0.5, 0.5);
    float _1118 = -_1050;
    float _1120 = fma(_1100, _1072, _1118);
    float _1122 = _1104 * _1086;
    float _1124 = fma(_1120, 0.5, 0.5);
    float _1126 = fma(_1122, -0.5, 0.5);
    float _1128 = _1110 * 0.636619746685028076171875;
    float _1130 = -_1108;
    float _1132 = fma(_1128, _1130, 1.0);
    float3 _4308 = float3(_1116, _1126, _1106);
    float _1134 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4308, float3(0.0), isnan(_4308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4308, float3(0.0), isnan(_4308)), level(0.0)).x;
    float3 _4319 = float3(_1116, _1126, _1106);
    float4 _1137 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4319, float3(0.0), isnan(_4319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4319, float3(0.0), isnan(_4319)), level(0.0)).xyzw;
    float _1139 = _1137.x;
    float _1141 = _1137.y;
    float _1143 = _1137.z;
    float _1145 = _1137.w;
    float2 _4335 = float2(_1132, _1124);
    float3 _1149 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4335, float2(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4335, float2(0.0), isnan(_4335)), level(0.0)).xyz;
    float _1151 = _1149.x;
    float _1153 = _1149.y;
    float _1155 = _1149.z;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1159 = int(_1157);
    float _1161 = in.m_71.x;
    float _1163 = -_526;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _472);
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1169 = _1167 != 0;
    float _1171 = in.m_71.z;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1179 = int(_1177);
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1183 = _1181 != 0;
    float _1185 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1189 = _1187 != 0;
    int _1191 = abs(_722);
    float _1193 = float(_1159);
    float _1195 = 1.0 / _1193;
    float _1197 = float(uint(_1179));
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    out.m_73.x = _1161;
    float _1203 = float(_1179);
    float _1205 = 1.0 / _1197;
    out.m_73.z = _1171;
    float _1207 = _122 * _1203;
    float _1209 = _122 * _1195;
    float _1211 = _1207 * _168;
    float _1213 = trunc(_1209);
    int _1215 = int(_1213);
    int _1217 = as_type<int>(_1205) + (-2);
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1221 = _1219 != 0;
    float _1223 = in.m_75.y;
    float _1225 = float(uint(_1215));
    bool _1227 = !_1221;
    float _1229 = _1227 ? 7.345489978790283203125 : 1.0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1233 = _1231 != 0;
    float _1235 = as_type<float>(_1217) * _1225;
    int _1237 = ~_1179;
    int _1239 = _1237 + 1;
    float _1241 = float(_1215);
    bool _1243 = !_1233;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = trunc(_1235);
    float _1249 = precise::max(_1247, 0.0);
    uint _1252 = uint(_1249);
    bool _1254 = _1241 >= _1203;
    bool _1256 = isnan(_1241);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(_1203);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    int _1266 = abs(_1245);
    bool _1268 = _562 != 0.0;
    bool _1270 = isnan(_562);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan(0.0);
    bool _1276 = _1272 || _1274;
    float _1278 = trunc(_1264);
    int _1280 = int(_1278);
    bool _1282 = _560 == 0.0;
    bool _1284 = !_1276;
    bool _1286 = _1282 && _1284;
    bool _1288 = _564 == 0.0;
    bool _1290 = _1288 && _1286;
    int _1292 = _1239 * int(_1252);
    int _1294 = _1292 + _1215;
    float _1296 = float(uint(_1294));
    float _1298 = in.m_63.x;
    float _1300 = in.m_63.y;
    float _1302 = in.m_63.z;
    float _1304 = as_type<float>(_1217) * _1296;
    float _1306 = in.m_71.y;
    float _1308 = trunc(_1304);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = int(_1252) + int(_1312);
    float _1316 = _1229 * _1298;
    float _1318 = in.m_71.w;
    bool _1320 = _1300 > 0.5;
    float _1322 = floor(_1316);
    int _1324 = _1201 * _1314;
    int _1326 = _1324 + _1215;
    out.m_73.y = _1306;
    bool _1328 = uint(_1326) >= uint(_1179);
    bool _1330 = !_1328;
    int _1332 = _1330 ? 0 : (-1);
    int _1334 = ~_1280;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    int _1340 = ~_1314;
    int _1342 = _1340 + _1332;
    int _1344 = _1342 + 1;
    float _1346 = -_1322;
    float _1348 = _1316 + _1346;
    float _1350 = -_1223;
    float _1352 = _1350 + 1.0;
    float _1354 = _1348 * _1203;
    out.m_73.w = _1318;
    float _1356 = _1223;
    float _1358 = _1048;
    float _1360 = _1104;
    if (_1183)
    {
        float _1362 = _1320 ? _1352 : _1223;
        _1356 = _1362;
    }
    float _1364 = _1356;
    int _1366 = _1179 * _1344;
    int _1368 = _1366 + _1215;
    float _1370 = trunc(_1354);
    int _1372 = int(_1370);
    bool _1374 = _1179 == 0;
    int _1376 = _1179 + (-1);
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1380 = !_1374;
    int _1382 = _1380 ? _1368 : (-1);
    int _1384 = abs(_718);
    float _1386 = trunc(_1211);
    int _1388 = int(_1386);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1392 = _1382 * _1338;
    int _1394 = _1280 * _1376;
    int _1396 = _1394 + _1392;
    float _1398 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1390);
    int _1400 = _1372 * _1266;
    int _1402 = _1400 + _1215;
    bool _1404 = !_1169;
    int _1406 = _1404 ? 0 : 1;
    int _1408 = _1396 * _1384;
    int _1410 = abs(_726);
    float _1412 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1398);
    float _1414 = _1390;
    float _1416 = _1412;
    if (_1175)
    {
        float _1418 = in.m_63.x;
        _1414 = _1418;
    }
    float _1420 = _1414;
    int _1422 = abs(_1406);
    int _1424 = _1388 * _1191;
    int _1426 = _1424 + _1408;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1430 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1432 = _1402 * _1410;
    int _1434 = _1432 + _1426;
    float _1436 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1428);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1444 = _1372 * _1422;
    int _1446 = _1444 + _1434;
    float _1448 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1450 = -_1442;
    float _1452 = fma(_1430, 2.0, _1450);
    float _1454 = 1.0 / _1440;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1458 = -_122;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1452);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1470 = float(uint(_1446));
    float _1472 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1448, -2.0, _1466);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1480;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1486 = as_type<float>(_1217) * _1470;
    out.m_77.x = _1472;
    out.m_77.y = _1474;
    out.m_77.z = _1476;
    out.m_77.w = _1468;
    float _1488 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1484);
    float _1490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1478);
    float _1492 = trunc(_1486);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1502 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1488);
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1512 = _1420 > 0.5;
    bool _1514 = _1512 && _1175;
    float _1516 = _1412 * (-0.15915493667125701904296875);
    float _1518 = 1.0 / _1500;
    float _1520 = _1482 * _1454;
    int _1522 = ~_1179;
    int _1524 = _1522 + 1;
    float _1526 = in.m_79.x;
    float _1528 = in.m_79.y;
    float _1530 = in.m_79.z;
    float _1532 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1536 = _442 + _1534;
    int _1538 = _1524 * int(_1496);
    int _1540 = _1538 + _1446;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1542;
    float _1546 = 1.0 / _1506;
    float _1548 = float(uint(_1540));
    float _1550 = _1544 * _1518;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1554 = _442 + _1552;
    float _1556 = as_type<float>(_1217) * _1548;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1560 = _442 + _1558;
    float _1562 = fma(_1520, _1554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1564 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = fma(_1550, _1560, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1568 = trunc(_1556);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1576 = _1530;
    float _1578 = _1528;
    float _1580 = _1526;
    if (!_1290)
    {
        float _1582 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1530);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = float(uint(_1402));
    if (!_1290)
    {
        float _1588 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1528);
        _1578 = _1588;
    }
    float _1590 = _1578;
    float _1592 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1290)
    {
        float _1594 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1526);
        _1580 = _1594;
    }
    float _1596 = _1580;
    bool _1598 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1600 = isnan(_442);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = as_type<float>(_1217) * _1586;
    float _1612 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1592);
    float _1614 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1574);
    float _1616 = _1510 * _1546;
    float _1618 = -_1608;
    float _1620 = _1618 + 1.0;
    float _1622 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1612);
    float _1624 = trunc(_1610);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    bool _1630 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1632 = isnan(_442);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1638 = _1634 || _1636;
    float _1640 = float(_1638);
    float _1642 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = in.m_75.x;
    float _1646 = fma(_1616, _1536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1648 = ~_1179;
    int _1650 = _1648 + 1;
    float _1652 = _1640 * _1620;
    float _1654 = -_1640;
    float _1656 = _1654 + 1.0;
    bool _1658 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1660 = isnan(_442);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = 1.0 / _1642;
    int _1672 = int(_1496) + int(_1572);
    float _1674 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1676 = ~_1179;
    int _1678 = _1676 + 1;
    float _1680 = _484 * _1590;
    bool _1682 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1684 = isnan(_442);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = _1668 * _1656;
    int _1696 = _1650 * int(_1628);
    int _1698 = _1696 + _1402;
    float _1700 = -_1668;
    float _1702 = _1700 + 1.0;
    int _1704 = _1678 * _1672;
    int _1706 = _1704 + _1446;
    float _1708 = _1674 + _1642;
    float _1710 = _1516 * 6.283185482025146484375;
    float _1712 = sin(_1710);
    float _1714 = float(uint(_1698));
    float _1716 = _1692 * _1702;
    bool _1718 = uint(_1706) >= uint(_1179);
    float _1720 = -_1692;
    float _1722 = _1720 + 1.0;
    float _1724 = _1708 * _1670;
    float _1726 = _1724 * 0.5;
    float _1728 = as_type<float>(_1217) * _1714;
    float _1730 = _1562 * _1716;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : (-1);
    float _1736 = _1516 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1644;
    if (_1175)
    {
        _1416 = _1644;
    }
    float _1742 = _1416;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1746 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1744);
    float _1748 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1730);
    int _1750 = ~_1672;
    int _1752 = _1750 + _1734;
    int _1754 = _1752 + 1;
    float _1756 = _474 * _1590;
    float _1758 = _1742;
    if (_1514)
    {
        float _1760 = -_1742;
        float _1762 = _1760 + 1.0;
        _1758 = _1762;
    }
    float _1764 = _1758;
    float _1766 = fma(_1646, _1694, _1748);
    float _1768 = 1.0 / _1746;
    int _1770 = _1179 * _1754;
    int _1772 = _1770 + _1446;
    float _1774 = _502 * _1590;
    if (_1175)
    {
        _1740 = _1764;
    }
    float _1776 = _1740;
    float _1778 = _1712 * _1378;
    float _1780 = fma(_1566, _1652, _1766);
    bool _1782 = !_1374;
    int _1784 = _1782 ? _1772 : (-1);
    float _1786 = fma(_636, _1596, _1756);
    float _1788 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1790 = trunc(_1728);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    int _1796 = _1784 >> 31;
    float _1798 = _1738 * _1378;
    float _1800 = -_1778;
    float _1802 = fma(_1738, _1788, _1800);
    int _1804 = ~_1179;
    int _1806 = _1804 + 1;
    float _1808 = fma(_644, _1596, _1774);
    int _1810 = _1796 & 3;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1814 = _1768 * _1812;
    float _1816 = fma(_1532, _1802, _1460);
    float _1818 = fma(_1712, _1788, _1798);
    int _1820 = _1784 + _1810;
    float _1822 = abs(_1814);
    float _1824 = log2(_1822);
    float _1826 = _1816 + 0.5;
    float _1828 = -_1490;
    float _1830 = fma(_1502, _1818, _1828);
    int _1832 = _1820 >> 2;
    float _1834 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1780);
    int _1836 = int(_1628) + int(_1794);
    float _1838 = _1830 + 0.5;
    int _1840 = _1832 << 4;
    int _1842 = _1840 + 368;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1846 = uint(int(uint(_1842) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    out.m_81.x = _1826;
    out.m_81.y = _1838;
    int _1862 = _1806 * _1836;
    int _1864 = _1862 + _1402;
    float _1866 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1868 = fma(_642, _1596, _1680);
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1876 = _1842 + 8;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    uint _1880 = uint(int(uint(int(_1878)) >> uint(2)));
    int _1882 = int(_1878) & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    int _1886 = int(_1878) + 1;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    int _1890 = _1886 & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    float _1894 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1896 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = exp2(_1866);
    bool _1902 = uint(_1864) >= uint(_1179);
    float _1904 = fma(_664, _1584, _1868);
    int _1906 = _1784 & 3;
    bool _1908 = _1906 != 0;
    out.m_83.x = _1894;
    out.m_83.y = _1896;
    out.m_83.z = _1898;
    out.m_83.w = _1844;
    bool _1910 = !_1902;
    int _1912 = _1910 ? 0 : (-1);
    float _1914 = fma(_674, _1584, _1786);
    float _1916 = fma(_656, _1584, _1808);
    int _1918 = ~_1836;
    int _1920 = _1918 + _1912;
    int _1922 = _1920 + 1;
    int _1924 = _1179 * _1922;
    int _1926 = _1924 + _1402;
    int _1928 = _1784 & 3;
    bool _1930 = _1928 != 0;
    bool _1932 = uint(_1928) > 1u;
    bool _1934 = _1928 != 3;
    float _1936 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    int _1940 = _1908 ? 0 : 1;
    bool _1942 = uint(_1928) >= 2u;
    float _1944 = fma(_1938, -2.0, 3.0);
    float _1946 = _1938 * _1938;
    int _1948 = ~_1940;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1942 ? 0 : 1;
    float _1956 = _1946 * _1944;
    int _1958 = _1952;
    if (!_1932)
    {
        int _1960 = ~_1940;
        int _1962 = _1960 + 1;
        _1958 = _1962;
    }
    int _1964 = _1958;
    bool _1966 = !_1930;
    int _1968 = _1966 ? 0 : 1;
    bool _1970 = _1928 != 3;
    int _1972 = ~_1954;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = abs(_1964);
    float _1980 = -_1956;
    float _1982 = _1980 + 1.0;
    int _1984 = _1976;
    if (_1934)
    {
        int _1986 = ~_1954;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    int _1992 = abs(_1968);
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1956);
    bool _1996 = !_1970;
    int _1998 = _1996 ? 0 : (-1);
    int _2000 = abs(_1990);
    int _2002 = ~_1978;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    int _2008 = abs(_1998);
    int _2010 = ~_1992;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    int _2016 = _2006 * as_type<int>(_1860);
    bool _2018 = !_1189;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = _2014 * as_type<int>(_1852);
    int _2024 = _2022 + _2016;
    int _2026 = ~_2000;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = abs(_2020);
    float _2034 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2036 = ~_2008;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2030 * as_type<int>(_1884);
    int _2044 = _2042 + _2024;
    float _2046 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2034);
    float _2048 = in.m_65.x;
    int _2050 = _2040 * as_type<int>(_1892);
    int _2052 = _2050 + _2044;
    int _2054 = ~_2032;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    float _2060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    bool _2062 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2064 = isnan(0.5);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2070 = _2066 || _2068;
    float _2072 = _1048 * 0.5;
    bool _2074 = _1814 <= 8000.0;
    bool _2076 = isnan(_1814);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    int _2086 = _2052 * _2058;
    float _2088 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    bool _2090 = !_1374;
    int _2092 = _2090 ? _1926 : (-1);
    float _2094 = exp2(_1185);
    float _2096 = _2084 * _1994;
    float _2098 = _2088 + _1048;
    float _2100 = _1092 + _1048;
    int _2102 = _2092 * _2032;
    int _2104 = _2102 + _2086;
    float _2106 = fma(_1104, -0.5, _2072);
    float _2108 = _2098 * 0.5;
    float _2110 = as_type<float>(_2016);
    float _2112 = _2072;
    float _2114 = _2088;
    float _2116 = _2106;
    if (_2070)
    {
        _2110 = 1.0;
    }
    float _2118 = _2110;
    float _2120 = _2100 * 0.5;
    float _2122 = float(_2104);
    float _2124 = _2118;
    float _2126 = _2120;
    if (_2070)
    {
        _2112 = 1.0;
    }
    float _2128 = _2112;
    float _2130 = _2128;
    if (!_2070)
    {
        float _2132 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2134 = _2132 * 0.15915493667125701904296875;
        float _2136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2138 = _2134 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        float _2142 = _2136 * 0.15915493667125701904296875;
        float _2144 = _2134 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = 1.0 / _2140;
        float _2150 = _2142 * 6.283185482025146484375;
        float _2152 = cos(_2150);
        float _2154 = _2146 * _2148;
        float _2156 = _2142 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2162 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2160;
        float _2164 = _2152 * _2154;
        float _2166 = 1.0 / _2164;
        float _2168 = 1.0 / _2162;
        float _2170 = _2158 * _2166;
        float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2174 = fma(_1814, _2170, _2172);
        float _2176 = _2174 * _2168;
        float _2178 = precise::clamp(_2176, 0.0, 1.0);
        _2130 = _2178;
    }
    float _2180 = _2130;
    if (!_2070)
    {
        float _2182 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2184 = _2182 * 0.15915493667125701904296875;
        float _2186 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2188 = _2184 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        float _2192 = _2186 * 0.15915493667125701904296875;
        float _2194 = _2184 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = 1.0 / _2190;
        float _2200 = _2192 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = _2196 * _2198;
        float _2206 = _2192 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = _2202 * _2204;
        float _2212 = 1.0 / _2210;
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2216 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2214;
        float _2218 = 1.0 / _2216;
        float _2220 = _2208 * _2212;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2224 = fma(_1814, _2220, _2222);
        float _2226 = _2224 * _2218;
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        float _2230 = -_2228;
        float _2232 = _2230 + 1.0;
        _2124 = _2232;
    }
    float _2234 = _2124;
    float _2236 = -_2094;
    float _2238 = _2236 + 1.0;
    float _2240 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2242 = -_1114;
    float _2244 = _2242 + 1.0;
    float _2246 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _2122;
    float _2248 = _2244 * _2240;
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    bool _2252 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2254 = isnan(_832);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2260 = _2256 || _2258;
    float _2262 = _2246 * _1134;
    float _2264 = -_2246;
    float _2266 = _2264 + 1.0;
    float _2268 = -_2250;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_87.x = _1904;
    out.m_87.y = _1914;
    out.m_87.z = _1916;
    float _2272 = _1145 * _2262;
    float _2274 = _1155 * _2262;
    float _2276 = _2270 * _2048;
    float _2278 = _1145 * _2266;
    float _2280 = fma(_1151, _2272, _1139);
    float _2282 = fma(_1153, _2272, _1141);
    float _2284 = _2276 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2286 = fma(_1145, _2274, _1143);
    out.gl_Position.x = _1092;
    out.gl_Position.y = _1104;
    out.gl_Position.z = _2088;
    out.gl_Position.w = _1048;
    out.m_89.x = _2284;
    out.m_91.x = _2280;
    out.m_91.y = _2282;
    out.m_91.z = _2286;
    out.m_91.w = _2278;
    out.m_93.x = _2120;
    out.m_93.y = _2106;
    out.m_93.z = _2108;
    out.m_93.w = _1048;
    float _2288 = _2180 * _2234;
    float _2290 = _2288;
    if (!_2260)
    {
        _1358 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2292 = _1358;
    float _2294 = _2292;
    float _2296 = _2292;
    if (!_2260)
    {
        _2114 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2298 = _2114;
    float _2300 = _2298;
    float _2302 = _2298;
    if (!_2260)
    {
        _1360 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2304 = _1360;
    float _2306 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2308 = _2304;
    float _2310 = _2304;
    if (!_2260)
    {
        _2116 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2312 = _2116;
    float _2314 = _2312;
    float _2316 = _2312;
    if (!_2260)
    {
        _2126 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2318 = _2126;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2260)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2324 = _2290;
    bool _2326 = !_2260;
    float _2328 = _2324;
    float _2330 = _2324;
    if (!_2326)
    {
        bool _2332 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2334 = isnan(_832);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2340 = _2336 || _2338;
        if (!_2340)
        {
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2344 = _832 + _2342;
            float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2348 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2346;
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2354 = 1.0 / _2348;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2372 = _2344 * _2354;
            float _2374 = precise::clamp(_2372, 0.0, 1.0);
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2380 = fma(_2374, _2352, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2382 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2384 = fma(_2374, _2358, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2386 = fma(_2374, _2362, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2388 = fma(_2374, _2366, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2390 = fma(_2374, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2322 = _2384;
            _2310 = _2388;
            _2316 = _2380;
            _2302 = _2386;
            _2296 = _2382;
            _2330 = _2390;
            _2392 = true;
        }
        else
        {
            bool _2394 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2396 = isnan(_832);
            bool _2398 = _2394 || _2396;
            bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2402 = _2398 || _2400;
            if (!_2402)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2404 = _2314;
            _2316 = _2404;
            if (!_2402)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2406 = _2320;
            _2322 = _2406;
            if (!_2402)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2408 = _2294;
            _2296 = _2408;
            if (!_2402)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2410 = _2300;
            _2302 = _2410;
            if (!_2402)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2412 = _2308;
            _2310 = _2412;
            if (!_2402)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2414 = _2328;
            bool _2416 = !_2402;
            _2330 = _2414;
            if (!_2416)
            {
                bool _2418 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2420 = isnan(_832);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2426 = _2422 || _2424;
                if (!_2426)
                {
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2430 = _832 + _2428;
                    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2434 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2432;
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2440 = 1.0 / _2434;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2458 = _2430 * _2440;
                    float _2460 = precise::clamp(_2458, 0.0, 1.0);
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2466 = fma(_2460, _2438, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2468 = fma(_2460, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2470 = fma(_2460, _2444, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2472 = fma(_2460, _2448, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2474 = fma(_2460, _2452, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2476 = fma(_2460, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2322 = _2470;
                    _2310 = _2474;
                    _2316 = _2466;
                    _2302 = _2472;
                    _2296 = _2468;
                    _2330 = _2476;
                    _2392 = true;
                }
                else
                {
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2392 = false;
    float _2478 = _2322;
    float _2480 = _2310;
    float _2482 = _2316;
    float _2484 = _2302;
    float _2486 = _2296;
    float _2488 = _2330;
    float _2490 = fma(_1914, -0.5, 0.5);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = -_2478;
    float _2496 = _2494 + _2480;
    float _2498 = _2306 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2500 = -_2482;
    float _2502 = _2500 + _2484;
    float _2504 = fma(_2492, _2496, _2478);
    out.m_95.x = 0.0;
    float _2506 = -_2486;
    float _2508 = _2506 + _2488;
    float _2510 = fma(_2492, _2502, _2482);
    float _2512 = _2504 * 0.586610972881317138671875;
    out.m_53.x = _2498;
    bool _2514 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2516 = fma(_2492, _2508, _2486);
    float _2518 = fma(_2510, 0.298911988735198974609375, _2512);
    bool _2520 = _2180 > 0.0;
    bool _2522 = isnan(_2180);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(0.0);
    bool _2528 = _2524 || _2526;
    float _2530 = fma(_2516, 0.114477999508380889892578125, _2518);
    bool _2532 = _2234 <= 0.0;
    bool _2534 = !_2528;
    bool _2536 = _2532 || _2534;
    float _2538 = -_2530;
    float _2540 = _2510 + _2538;
    float _2542 = -_2530;
    float _2544 = _2504 + _2542;
    float _2546 = -_2530;
    float _2548 = _2516 + _2546;
    float _2550 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    float _2554 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    bool _2556 = !_2514;
    if (!_2556)
    {
        float _2558 = -_792;
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2562 = -_796;
        float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2566 = -_800;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2570 = _2560 * _2560;
        float _2572 = fma(_2564, _2564, _2570);
        float _2574 = fma(_2568, _2568, _2572);
        float _2576 = sqrt(_2574);
        float _2578 = rsqrt(_2574);
        float _2580 = -_2576;
        float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2584 = _2582 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2586 = precise::clamp(_2584, 0.0, 1.0);
        float _2588 = _2564 * _2578;
        float _2590 = _2560 * _2578;
        float _2592 = abs(_2586);
        float _2594 = log2(_2592);
        float _2596 = _2568 * _2578;
        float _2598 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2600 = _1914 * _2590;
        float _2602 = -_2590;
        float _2604 = -_2598;
        float _2606 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2604);
        float _2608 = fma(_1904, _2588, _2600);
        float _2610 = -_2596;
        float _2612 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2606);
        float _2614 = fma(_1916, _2596, _2608);
        float _2616 = precise::clamp(_2614, 0.0, 1.0);
        float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2620 = _2612 + _2618;
        float _2622 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2624 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        float _2628 = exp2(_2622);
        float _2630 = _2628 * _2626;
        float _2632 = _2616 * _2630;
        float _2634 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2636 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2638 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2634;
        out.m_95.y = _2636;
        out.m_95.z = _2638;
    }
    out.m_97.x = _2550;
    out.m_97.y = _2552;
    out.m_97.z = _2554;
    if (!_2536)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2640 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2640;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2392 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_118);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_138);
        out.gl_Position.z = _2708;
    }
    if (!_126)
    {
        return out;
    }
    bool _142 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_113);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_118);
    bool _154 = _122 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _130;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2763 = as_type<float>(_164);
        out.gl_Position.z = _2763;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_55.y;
    float _168 = 1.0 / _152;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = in.m_55.z;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = in.m_59.y;
    float _180 = _122 * _168;
    float _182 = in.m_59.z;
    float _184 = _166 * _166;
    float _186 = in.m_57.x;
    float _188 = _172 * _172;
    float _190 = in.m_55.x;
    float _192 = fma(_174, _174, _184);
    float _194 = in.m_59.x;
    float _196 = fma(_176, _176, _188);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_182, _182, _196);
    float _202 = sqrt(_198);
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = sqrt(_200);
    bool _212 = _202 > 0.0;
    bool _214 = _210 > 0.0;
    float _216 = _174 * _206;
    float _218 = _166 * _206;
    float _220 = _178 * _206;
    float _222 = 0.0;
    float _224 = _218;
    float _226 = _190;
    float _228 = _198;
    float _230 = _200;
    float _232 = _180;
    float _234 = _172;
    if (_212)
    {
        float _236 = rsqrt(_198);
        _222 = _236;
    }
    float _238 = _222;
    float _240 = fma(_204, _186, _216);
    float _242 = fma(_204, _190, _218);
    float _244 = fma(_204, _194, _220);
    float _246 = _240;
    if (!_212)
    {
        _224 = 0.0;
    }
    float _248 = _224;
    float _250 = fma(_176, _208, _240);
    float _252 = _248;
    if (!_212)
    {
        _226 = 0.0;
    }
    float _254 = _226;
    float _256 = fma(_172, _208, _242);
    float _258 = 0.0;
    float _260 = _254;
    if (_214)
    {
        float _262 = rsqrt(_200);
        _258 = _262;
    }
    float _264 = _258;
    if (!_214)
    {
        _228 = 0.0;
    }
    float _266 = _228;
    float _268 = fma(_182, _208, _244);
    float _270 = 0.0;
    float _272 = _266;
    if (!_212)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _274;
    if (!_214)
    {
        _246 = 0.0;
    }
    float _278 = _246;
    float _280 = _278;
    if (_212)
    {
        float _282 = _238 * _166;
        _252 = _282;
    }
    float _284 = _252;
    float _286 = _284;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _288 = _230;
    float _290 = _288;
    if (_212)
    {
        float _292 = _238 * _174;
        _260 = _292;
    }
    float _294 = _260;
    float _296 = _294;
    if (_212)
    {
        float _298 = _238 * _178;
        _276 = _298;
    }
    float _300 = _276;
    float _302 = _300;
    if (_214)
    {
        float _304 = _264 * _172;
        _272 = _304;
    }
    float _306 = _272;
    if (_214)
    {
        float _308 = _264 * _176;
        _290 = _308;
    }
    float _310 = _290;
    if (_214)
    {
        float _312 = _264 * _182;
        _280 = _312;
    }
    float _314 = _280;
    bool _316 = !_170;
    float _334;
    if (!_316)
    {
        float _318 = in.m_63.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        _334 = _180;
    }
    _336 = false;
    float _338 = _334;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = _338 + _340;
    bool _344 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_338);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _356;
    bool _360 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_338);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = 1.0 / _358;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = _370 * _374;
    float _386 = -_370;
    float _388 = _386 + 1.0;
    float _390 = _342 * _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = fma(_378, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = _396 * _384;
    float _408 = _404 * _384;
    float _410 = _402 * _384;
    float _412 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _414 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _416 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _418 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].x, _412);
    float _420 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].y, _414);
    float _422 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].z, _416);
    bool _424 = !_382;
    if (!_424)
    {
        float _426 = in.m_63.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _232 = _440;
    }
    float _442 = _232;
    float _444 = in.m_46.x;
    float _446 = in.m_46.y;
    float _448 = in.m_46.z;
    float _450 = _256 * _256;
    float _452 = in.m_65.y;
    float _454 = fma(_250, _250, _450);
    float _456 = in.m_57.w;
    float _458 = fma(_268, _268, _454);
    float _460 = in.m_59.w;
    float _462 = rsqrt(_458);
    float _464 = _174 * _446;
    float _466 = _178 * _446;
    float _468 = fma(_186, _444, _464);
    float _470 = fma(_194, _444, _466);
    float _472 = _446 + _452;
    float _474 = _256 * _462;
    float _476 = fma(_176, _448, _468);
    float _478 = fma(_182, _448, _470);
    float _480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _482 = _472 + _480;
    float _484 = _250 * _462;
    float _486 = _476 + _456;
    float _488 = _478 + _460;
    float _490 = _482 * _482;
    float _492 = _474 * _284;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _496 = _486 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _500 = _488 + _498;
    float _502 = _268 * _462;
    float _504 = fma(_484, _294, _492);
    float _506 = fma(_496, _496, _490);
    float _508 = fma(_502, _300, _504);
    float _510 = fma(_500, _500, _506);
    float _512 = rsqrt(_510);
    float _514 = abs(_508);
    bool _516 = _514 > 0.99989998340606689453125;
    if (_516)
    {
        float _518 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _518;
    }
    float _520 = _296;
    if (_516)
    {
        float _522 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _522;
    }
    float _524 = _302;
    float _526 = _482 * _512;
    float _528 = _496 * _512;
    float _530 = -_520;
    float _532 = _502 * _530;
    float _534 = _528;
    if (_516)
    {
        float _536 = fma(_306, 0.001000000047497451305389404296875, _284);
        _286 = _536;
    }
    float _538 = _286;
    float _540 = -_526;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _544 = -_528;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _548 = -_524;
    float _550 = _474 * _548;
    float _552 = -_524;
    float _554 = -_532;
    float _556 = fma(_484, _552, _554);
    float _558 = _542 * _542;
    float _560 = in.m_67.x;
    float _562 = in.m_67.y;
    float _564 = in.m_67.z;
    float _566 = -_538;
    float _568 = -_550;
    float _570 = fma(_502, _566, _568);
    float _572 = -_538;
    float _574 = _484 * _572;
    float _576 = fma(_546, _546, _558);
    float _578 = _500 * _512;
    float _580 = in.m_69.x;
    float _582 = in.m_69.y;
    float _584 = in.m_69.z;
    float _586 = _556 * _556;
    float _588 = -_520;
    float _590 = -_574;
    float _592 = fma(_474, _588, _590);
    float _594 = -_578;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _598 = fma(_570, _570, _586);
    float _600 = fma(_596, _596, _576);
    float _602 = fma(_592, _592, _598);
    float _604 = sqrt(_600);
    float _606 = rsqrt(_602);
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _560);
    float _610 = _420 * _582;
    float _612 = _422 * _584;
    float _614 = _418 * _580;
    float _616 = _512 * _604;
    float _618 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _620 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _626 = _618 * _616;
    float _628 = _620 * _616;
    float _630 = _622 * _616;
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _564);
    float _634 = _626 * _624;
    float _636 = _556 * _606;
    float _638 = _630 * _608;
    float _640 = _628 * _632;
    float _642 = _570 * _606;
    float _644 = _592 * _606;
    float _646 = _484 * _636;
    float _648 = _634 * _502;
    float _650 = _634 * _484;
    float _652 = _474 * _644;
    float _654 = -_646;
    float _656 = fma(_474, _642, _654);
    float _658 = fma(_638, _644, _648);
    float _660 = fma(_638, _642, _650);
    float _662 = -_652;
    float _664 = fma(_502, _636, _662);
    float _666 = _502 * _642;
    float _668 = fma(_640, _656, _658);
    float _670 = fma(_640, _664, _660);
    float _672 = -_666;
    float _674 = fma(_484, _644, _672);
    float _676 = _488 + _668;
    float _678 = _486 + _670;
    float _680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_686, _686, _688);
    float _692 = _634 * _474;
    float _694 = sqrt(_690);
    float _696 = fma(_638, _636, _692);
    float _698 = fma(_640, _674, _696);
    float _700 = _472 + _698;
    bool _702 = _694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _714 = _712 != 0;
    bool _716 = !_710;
    int _718 = _716 ? 0 : 1;
    bool _720 = !_706;
    int _722 = _720 ? 0 : 1;
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    float _728 = _696;
    float _730 = _676;
    float _732 = _682;
    float _734 = _640;
    float _736 = _578;
    if (!_702)
    {
        _728 = _678;
    }
    float _738 = _728;
    float _740 = _738;
    if (!_702)
    {
        _234 = _700;
    }
    float _742 = _234;
    bool _744 = !_702;
    float _746 = _742;
    if (!_744)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _752 = _694 + _750;
        float _754 = rsqrt(_690);
        float _756 = _752 * _748;
        float _758 = _700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _760 = _756 * 0.15915493667125701904296875;
        float _762 = _760 * 6.283185482025146484375;
        float _764 = cos(_762);
        float _766 = _760 * 6.283185482025146484375;
        float _768 = sin(_766);
        float _770 = _764 + (-1.0);
        float _772 = fma(_768, _758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = _770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _754 * _772;
        float _778 = fma(_700, _764, _774);
        float _780 = fma(_686, _776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _782 = fma(_682, _776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _746 = _778;
        _740 = _780;
        _730 = _782;
    }
    float _784 = _746;
    float _786 = _740;
    float _788 = _730;
    float _790 = -_526;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _794 = -_528;
    float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _798 = -_578;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _792 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _796 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _812 = _800 + _810;
    float _814 = _804 * _804;
    float _816 = -_528;
    float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _486);
    float _820 = -_578;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _824 = fma(_808, _808, _814);
    float _826 = fma(_812, _812, _824);
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _830 = rsqrt(_826);
    float _832 = sqrt(_826);
    float _834 = _830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _836 = _808 * _834;
    float _838 = _812 * _834;
    float _840 = _836 * _836;
    float _842 = _838 * _838;
    float _844 = _840 + _842;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = _700;
    float _856 = _852;
    float _858 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _860 = _838;
    float _862 = _836;
    if (_848)
    {
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _864;
    }
    float _866 = _854;
    if (!_848)
    {
        _534 = _836;
    }
    float _868 = _534;
    float _870 = _868;
    if (_848)
    {
        float _872 = rsqrt(_844);
        _732 = _872;
    }
    float _874 = _732;
    float _876 = _874;
    if (_848)
    {
        float _878 = _852 * _866;
        _856 = _878;
    }
    float _880 = _856;
    float _882 = _792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_848)
    {
        float _884 = _880 * 0.15915493667125701904296875;
        _734 = _884;
    }
    float _886 = _734;
    float _888 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _890 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _882);
    float _892 = _866;
    if (_848)
    {
        float _894 = _886 * 6.283185482025146484375;
        float _896 = sin(_894);
        _892 = _896;
    }
    float _898 = _892;
    float _900 = precise::max(0.0, _888);
    float _902 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _890);
    float _904 = -_834;
    float _906 = -_900;
    float _908 = fma(_804, _904, _906);
    float _910 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _912 = _900;
    if (_848)
    {
        float _914 = _886 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _922 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_848)
    {
        float _924 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _924;
    }
    float _926 = _912;
    float _928 = _926;
    if (!_848)
    {
        _736 = _908;
    }
    float _930 = _736;
    float _932 = _898;
    float _934 = _930;
    if (_848)
    {
        float _936 = fma(_898, _926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _928 = _936;
    }
    float _938 = _928;
    if (_848)
    {
        float _940 = _874 * _938;
        _858 = _940;
    }
    float _942 = _858;
    float _944 = floor(_920);
    if (_848)
    {
        float _946 = _918 + (-1.0);
        _932 = _946;
    }
    float _948 = _932;
    float _950 = _948;
    if (_848)
    {
        float _952 = _836 * _942;
        _870 = _952;
    }
    float _954 = _870;
    if (_848)
    {
        float _956 = _838 * _942;
        _860 = _956;
    }
    float _958 = _860;
    if (!_848)
    {
        _862 = _842;
    }
    float _960 = _862;
    float _962 = _960;
    if (_848)
    {
        float _964 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _964;
    }
    float _966 = _876;
    if (!_848)
    {
        _950 = _840;
    }
    float _968 = _950;
    float _970 = _968;
    if (_848)
    {
        float _972 = _954 * _954;
        _970 = _972;
    }
    float _974 = _970;
    if (_848)
    {
        float _976 = _958 * _958;
        _962 = _976;
    }
    float _978 = _962;
    if (_848)
    {
        float _980 = fma(_908, _918, _966);
        _934 = _980;
    }
    float _982 = _934;
    float _984 = _792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _986 = fma(_822, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _988 = fma(_982, _982, _974);
    float _990 = _792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _984);
    float _994 = _988 + _978;
    float _996 = _792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _998 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _992);
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1004 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1002);
    float _1006 = precise::clamp(_1004, 0.0, 1.0);
    float _1008 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _996);
    float _1010 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1012 = rsqrt(_994);
    float _1014 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1016 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1020 = -_1006;
    float _1022 = _1020 + 1.0;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1030 = floor(_986);
    float _1032 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1028);
    float _1034 = -_1024;
    float _1036 = fma(_1034, _828, 1.0);
    float _1038 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1032);
    float _1040 = abs(_1022);
    float _1042 = log2(_1040);
    float _1044 = _1012 * _954;
    float _1046 = _1012 * _958;
    float _1048 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1038);
    float _1050 = _1012 * _982;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1054 = -_944;
    float _1056 = _920 + _1054;
    float _1058 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1060 = log2(_1036);
    float _1062 = -_1052;
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1062);
    float _1066 = -_1030;
    float _1068 = _986 + _1066;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1058);
    float _1072 = _1050 + 1.0;
    float _1074 = -_1046;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1064);
    float _1078 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1080 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1070);
    float _1082 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1084 = fma(_1076, -0.5, 0.5);
    float _1086 = 1.0 / _1048;
    float _1088 = fma(_1076, 0.5, 0.5);
    float _1090 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1078);
    float _1092 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1080);
    float _1094 = fma(_1088, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1096 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1090);
    float _1098 = _1060 * 0.693147182464599609375;
    float _1100 = exp2(_1082);
    float _1102 = fma(_1088, _1094, -0.212114393711090087890625);
    float _1104 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1096);
    float _1106 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1108 = fma(_1088, _1102, 1.570728778839111328125);
    float _1110 = sqrt(_1084);
    float _1112 = _1092 * _1086;
    float2 _4274 = float2(_1056, _1068);
    float _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4274, float2(0.0), isnan(_4274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4274, float2(0.0), isnan(_4274)), level(0.0)).x;
    float _1116 = fma(_1112, 0.5, 0.5);
    float _1118 = -_1050;
    float _1120 = fma(_1100, _1072, _1118);
    float _1122 = _1104 * _1086;
    float _1124 = fma(_1120, 0.5, 0.5);
    float _1126 = fma(_1122, -0.5, 0.5);
    float _1128 = _1110 * 0.636619746685028076171875;
    float _1130 = -_1108;
    float _1132 = fma(_1128, _1130, 1.0);
    float3 _4308 = float3(_1116, _1126, _1106);
    float _1134 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4308, float3(0.0), isnan(_4308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4308, float3(0.0), isnan(_4308)), level(0.0)).x;
    float3 _4319 = float3(_1116, _1126, _1106);
    float4 _1137 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4319, float3(0.0), isnan(_4319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4319, float3(0.0), isnan(_4319)), level(0.0)).xyzw;
    float _1139 = _1137.x;
    float _1141 = _1137.y;
    float _1143 = _1137.z;
    float _1145 = _1137.w;
    float2 _4335 = float2(_1132, _1124);
    float3 _1149 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4335, float2(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4335, float2(0.0), isnan(_4335)), level(0.0)).xyz;
    float _1151 = _1149.x;
    float _1153 = _1149.y;
    float _1155 = _1149.z;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1159 = int(_1157);
    float _1161 = in.m_71.x;
    float _1163 = -_526;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _472);
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1169 = _1167 != 0;
    float _1171 = in.m_71.z;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1179 = int(_1177);
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1183 = _1181 != 0;
    float _1185 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1189 = _1187 != 0;
    int _1191 = abs(_722);
    float _1193 = float(_1159);
    float _1195 = 1.0 / _1193;
    float _1197 = float(uint(_1179));
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    out.m_73.x = _1161;
    float _1203 = float(_1179);
    float _1205 = 1.0 / _1197;
    out.m_73.z = _1171;
    float _1207 = _122 * _1203;
    float _1209 = _122 * _1195;
    float _1211 = _1207 * _168;
    float _1213 = trunc(_1209);
    int _1215 = int(_1213);
    int _1217 = as_type<int>(_1205) + (-2);
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1221 = _1219 != 0;
    float _1223 = in.m_75.y;
    float _1225 = float(uint(_1215));
    bool _1227 = !_1221;
    float _1229 = _1227 ? 7.345489978790283203125 : 1.0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1233 = _1231 != 0;
    float _1235 = as_type<float>(_1217) * _1225;
    int _1237 = ~_1179;
    int _1239 = _1237 + 1;
    float _1241 = float(_1215);
    bool _1243 = !_1233;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = trunc(_1235);
    float _1249 = precise::max(_1247, 0.0);
    uint _1252 = uint(_1249);
    bool _1254 = _1241 >= _1203;
    bool _1256 = isnan(_1241);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(_1203);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    int _1266 = abs(_1245);
    bool _1268 = _562 != 0.0;
    bool _1270 = isnan(_562);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan(0.0);
    bool _1276 = _1272 || _1274;
    float _1278 = trunc(_1264);
    int _1280 = int(_1278);
    bool _1282 = _560 == 0.0;
    bool _1284 = !_1276;
    bool _1286 = _1282 && _1284;
    bool _1288 = _564 == 0.0;
    bool _1290 = _1288 && _1286;
    int _1292 = _1239 * int(_1252);
    int _1294 = _1292 + _1215;
    float _1296 = float(uint(_1294));
    float _1298 = in.m_63.x;
    float _1300 = in.m_63.y;
    float _1302 = in.m_63.z;
    float _1304 = as_type<float>(_1217) * _1296;
    float _1306 = in.m_71.y;
    float _1308 = trunc(_1304);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = int(_1252) + int(_1312);
    float _1316 = _1229 * _1298;
    float _1318 = in.m_71.w;
    bool _1320 = _1300 > 0.5;
    float _1322 = floor(_1316);
    int _1324 = _1201 * _1314;
    int _1326 = _1324 + _1215;
    out.m_73.y = _1306;
    bool _1328 = uint(_1326) >= uint(_1179);
    bool _1330 = !_1328;
    int _1332 = _1330 ? 0 : (-1);
    int _1334 = ~_1280;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    int _1340 = ~_1314;
    int _1342 = _1340 + _1332;
    int _1344 = _1342 + 1;
    float _1346 = -_1322;
    float _1348 = _1316 + _1346;
    float _1350 = -_1223;
    float _1352 = _1350 + 1.0;
    float _1354 = _1348 * _1203;
    out.m_73.w = _1318;
    float _1356 = _1223;
    float _1358 = _1048;
    float _1360 = _1104;
    if (_1183)
    {
        float _1362 = _1320 ? _1352 : _1223;
        _1356 = _1362;
    }
    float _1364 = _1356;
    int _1366 = _1179 * _1344;
    int _1368 = _1366 + _1215;
    float _1370 = trunc(_1354);
    int _1372 = int(_1370);
    bool _1374 = _1179 == 0;
    int _1376 = _1179 + (-1);
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1380 = !_1374;
    int _1382 = _1380 ? _1368 : (-1);
    int _1384 = abs(_718);
    float _1386 = trunc(_1211);
    int _1388 = int(_1386);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1392 = _1382 * _1338;
    int _1394 = _1280 * _1376;
    int _1396 = _1394 + _1392;
    float _1398 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1390);
    int _1400 = _1372 * _1266;
    int _1402 = _1400 + _1215;
    bool _1404 = !_1169;
    int _1406 = _1404 ? 0 : 1;
    int _1408 = _1396 * _1384;
    int _1410 = abs(_726);
    float _1412 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1398);
    float _1414 = _1390;
    float _1416 = _1412;
    if (_1175)
    {
        float _1418 = in.m_63.x;
        _1414 = _1418;
    }
    float _1420 = _1414;
    int _1422 = abs(_1406);
    int _1424 = _1388 * _1191;
    int _1426 = _1424 + _1408;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1430 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1432 = _1402 * _1410;
    int _1434 = _1432 + _1426;
    float _1436 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1428);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1444 = _1372 * _1422;
    int _1446 = _1444 + _1434;
    float _1448 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1450 = -_1442;
    float _1452 = fma(_1430, 2.0, _1450);
    float _1454 = 1.0 / _1440;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1458 = -_122;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1452);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1470 = float(uint(_1446));
    float _1472 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1448, -2.0, _1466);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1480;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1486 = as_type<float>(_1217) * _1470;
    out.m_77.x = _1472;
    out.m_77.y = _1474;
    out.m_77.z = _1476;
    out.m_77.w = _1468;
    float _1488 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1484);
    float _1490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1478);
    float _1492 = trunc(_1486);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1502 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1488);
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1512 = _1420 > 0.5;
    bool _1514 = _1512 && _1175;
    float _1516 = _1412 * (-0.15915493667125701904296875);
    float _1518 = 1.0 / _1500;
    float _1520 = _1482 * _1454;
    int _1522 = ~_1179;
    int _1524 = _1522 + 1;
    float _1526 = in.m_79.x;
    float _1528 = in.m_79.y;
    float _1530 = in.m_79.z;
    float _1532 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1536 = _442 + _1534;
    int _1538 = _1524 * int(_1496);
    int _1540 = _1538 + _1446;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1542;
    float _1546 = 1.0 / _1506;
    float _1548 = float(uint(_1540));
    float _1550 = _1544 * _1518;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1554 = _442 + _1552;
    float _1556 = as_type<float>(_1217) * _1548;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1560 = _442 + _1558;
    float _1562 = fma(_1520, _1554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1564 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = fma(_1550, _1560, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1568 = trunc(_1556);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1576 = _1530;
    float _1578 = _1528;
    float _1580 = _1526;
    if (!_1290)
    {
        float _1582 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1530);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = float(uint(_1402));
    if (!_1290)
    {
        float _1588 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1528);
        _1578 = _1588;
    }
    float _1590 = _1578;
    float _1592 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1290)
    {
        float _1594 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1526);
        _1580 = _1594;
    }
    float _1596 = _1580;
    bool _1598 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1600 = isnan(_442);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = as_type<float>(_1217) * _1586;
    float _1612 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1592);
    float _1614 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1574);
    float _1616 = _1510 * _1546;
    float _1618 = -_1608;
    float _1620 = _1618 + 1.0;
    float _1622 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1612);
    float _1624 = trunc(_1610);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    bool _1630 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1632 = isnan(_442);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1638 = _1634 || _1636;
    float _1640 = float(_1638);
    float _1642 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = in.m_75.x;
    float _1646 = fma(_1616, _1536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1648 = ~_1179;
    int _1650 = _1648 + 1;
    float _1652 = _1640 * _1620;
    float _1654 = -_1640;
    float _1656 = _1654 + 1.0;
    bool _1658 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1660 = isnan(_442);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = 1.0 / _1642;
    int _1672 = int(_1496) + int(_1572);
    float _1674 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1676 = ~_1179;
    int _1678 = _1676 + 1;
    float _1680 = _484 * _1590;
    bool _1682 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1684 = isnan(_442);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = _1668 * _1656;
    int _1696 = _1650 * int(_1628);
    int _1698 = _1696 + _1402;
    float _1700 = -_1668;
    float _1702 = _1700 + 1.0;
    int _1704 = _1678 * _1672;
    int _1706 = _1704 + _1446;
    float _1708 = _1674 + _1642;
    float _1710 = _1516 * 6.283185482025146484375;
    float _1712 = sin(_1710);
    float _1714 = float(uint(_1698));
    float _1716 = _1692 * _1702;
    bool _1718 = uint(_1706) >= uint(_1179);
    float _1720 = -_1692;
    float _1722 = _1720 + 1.0;
    float _1724 = _1708 * _1670;
    float _1726 = _1724 * 0.5;
    float _1728 = as_type<float>(_1217) * _1714;
    float _1730 = _1562 * _1716;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : (-1);
    float _1736 = _1516 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1644;
    if (_1175)
    {
        _1416 = _1644;
    }
    float _1742 = _1416;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1746 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1744);
    float _1748 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1730);
    int _1750 = ~_1672;
    int _1752 = _1750 + _1734;
    int _1754 = _1752 + 1;
    float _1756 = _474 * _1590;
    float _1758 = _1742;
    if (_1514)
    {
        float _1760 = -_1742;
        float _1762 = _1760 + 1.0;
        _1758 = _1762;
    }
    float _1764 = _1758;
    float _1766 = fma(_1646, _1694, _1748);
    float _1768 = 1.0 / _1746;
    int _1770 = _1179 * _1754;
    int _1772 = _1770 + _1446;
    float _1774 = _502 * _1590;
    if (_1175)
    {
        _1740 = _1764;
    }
    float _1776 = _1740;
    float _1778 = _1712 * _1378;
    float _1780 = fma(_1566, _1652, _1766);
    bool _1782 = !_1374;
    int _1784 = _1782 ? _1772 : (-1);
    float _1786 = fma(_636, _1596, _1756);
    float _1788 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1790 = trunc(_1728);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    int _1796 = _1784 >> 31;
    float _1798 = _1738 * _1378;
    float _1800 = -_1778;
    float _1802 = fma(_1738, _1788, _1800);
    int _1804 = ~_1179;
    int _1806 = _1804 + 1;
    float _1808 = fma(_644, _1596, _1774);
    int _1810 = _1796 & 3;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1814 = _1768 * _1812;
    float _1816 = fma(_1532, _1802, _1460);
    float _1818 = fma(_1712, _1788, _1798);
    int _1820 = _1784 + _1810;
    float _1822 = abs(_1814);
    float _1824 = log2(_1822);
    float _1826 = _1816 + 0.5;
    float _1828 = -_1490;
    float _1830 = fma(_1502, _1818, _1828);
    int _1832 = _1820 >> 2;
    float _1834 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1780);
    int _1836 = int(_1628) + int(_1794);
    float _1838 = _1830 + 0.5;
    int _1840 = _1832 << 4;
    int _1842 = _1840 + 368;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1846 = uint(int(uint(_1842) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    out.m_81.x = _1826;
    out.m_81.y = _1838;
    int _1862 = _1806 * _1836;
    int _1864 = _1862 + _1402;
    float _1866 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1868 = fma(_642, _1596, _1680);
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1876 = _1842 + 8;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    uint _1880 = uint(int(uint(int(_1878)) >> uint(2)));
    int _1882 = int(_1878) & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    int _1886 = int(_1878) + 1;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    int _1890 = _1886 & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    float _1894 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1896 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = exp2(_1866);
    bool _1902 = uint(_1864) >= uint(_1179);
    float _1904 = fma(_664, _1584, _1868);
    int _1906 = _1784 & 3;
    bool _1908 = _1906 != 0;
    out.m_83.x = _1894;
    out.m_83.y = _1896;
    out.m_83.z = _1898;
    out.m_83.w = _1844;
    bool _1910 = !_1902;
    int _1912 = _1910 ? 0 : (-1);
    float _1914 = fma(_674, _1584, _1786);
    float _1916 = fma(_656, _1584, _1808);
    int _1918 = ~_1836;
    int _1920 = _1918 + _1912;
    int _1922 = _1920 + 1;
    int _1924 = _1179 * _1922;
    int _1926 = _1924 + _1402;
    int _1928 = _1784 & 3;
    bool _1930 = _1928 != 0;
    bool _1932 = uint(_1928) > 1u;
    bool _1934 = _1928 != 3;
    float _1936 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    int _1940 = _1908 ? 0 : 1;
    bool _1942 = uint(_1928) >= 2u;
    float _1944 = fma(_1938, -2.0, 3.0);
    float _1946 = _1938 * _1938;
    int _1948 = ~_1940;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1942 ? 0 : 1;
    float _1956 = _1946 * _1944;
    int _1958 = _1952;
    if (!_1932)
    {
        int _1960 = ~_1940;
        int _1962 = _1960 + 1;
        _1958 = _1962;
    }
    int _1964 = _1958;
    bool _1966 = !_1930;
    int _1968 = _1966 ? 0 : 1;
    bool _1970 = _1928 != 3;
    int _1972 = ~_1954;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = abs(_1964);
    float _1980 = -_1956;
    float _1982 = _1980 + 1.0;
    int _1984 = _1976;
    if (_1934)
    {
        int _1986 = ~_1954;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    int _1992 = abs(_1968);
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1956);
    bool _1996 = !_1970;
    int _1998 = _1996 ? 0 : (-1);
    int _2000 = abs(_1990);
    int _2002 = ~_1978;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    int _2008 = abs(_1998);
    int _2010 = ~_1992;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    int _2016 = _2006 * as_type<int>(_1860);
    bool _2018 = !_1189;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = _2014 * as_type<int>(_1852);
    int _2024 = _2022 + _2016;
    int _2026 = ~_2000;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = abs(_2020);
    float _2034 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2036 = ~_2008;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2030 * as_type<int>(_1884);
    int _2044 = _2042 + _2024;
    float _2046 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2034);
    float _2048 = in.m_65.x;
    int _2050 = _2040 * as_type<int>(_1892);
    int _2052 = _2050 + _2044;
    int _2054 = ~_2032;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    float _2060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    bool _2062 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2064 = isnan(0.5);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2070 = _2066 || _2068;
    float _2072 = _1048 * 0.5;
    bool _2074 = _1814 <= 8000.0;
    bool _2076 = isnan(_1814);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    int _2086 = _2052 * _2058;
    float _2088 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    bool _2090 = !_1374;
    int _2092 = _2090 ? _1926 : (-1);
    float _2094 = exp2(_1185);
    float _2096 = _2084 * _1994;
    float _2098 = _2088 + _1048;
    float _2100 = _1092 + _1048;
    int _2102 = _2092 * _2032;
    int _2104 = _2102 + _2086;
    float _2106 = fma(_1104, -0.5, _2072);
    float _2108 = _2098 * 0.5;
    float _2110 = as_type<float>(_2016);
    float _2112 = _2072;
    float _2114 = _2088;
    float _2116 = _2106;
    if (_2070)
    {
        _2110 = 1.0;
    }
    float _2118 = _2110;
    float _2120 = _2100 * 0.5;
    float _2122 = float(_2104);
    float _2124 = _2118;
    float _2126 = _2120;
    if (_2070)
    {
        _2112 = 1.0;
    }
    float _2128 = _2112;
    float _2130 = _2128;
    if (!_2070)
    {
        float _2132 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2134 = _2132 * 0.15915493667125701904296875;
        float _2136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2138 = _2134 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        float _2142 = _2136 * 0.15915493667125701904296875;
        float _2144 = _2134 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = 1.0 / _2140;
        float _2150 = _2142 * 6.283185482025146484375;
        float _2152 = cos(_2150);
        float _2154 = _2146 * _2148;
        float _2156 = _2142 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2162 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2160;
        float _2164 = _2152 * _2154;
        float _2166 = 1.0 / _2164;
        float _2168 = 1.0 / _2162;
        float _2170 = _2158 * _2166;
        float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2174 = fma(_1814, _2170, _2172);
        float _2176 = _2174 * _2168;
        float _2178 = precise::clamp(_2176, 0.0, 1.0);
        _2130 = _2178;
    }
    float _2180 = _2130;
    if (!_2070)
    {
        float _2182 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2184 = _2182 * 0.15915493667125701904296875;
        float _2186 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2188 = _2184 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        float _2192 = _2186 * 0.15915493667125701904296875;
        float _2194 = _2184 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = 1.0 / _2190;
        float _2200 = _2192 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = _2196 * _2198;
        float _2206 = _2192 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = _2202 * _2204;
        float _2212 = 1.0 / _2210;
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2216 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2214;
        float _2218 = 1.0 / _2216;
        float _2220 = _2208 * _2212;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2224 = fma(_1814, _2220, _2222);
        float _2226 = _2224 * _2218;
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        float _2230 = -_2228;
        float _2232 = _2230 + 1.0;
        _2124 = _2232;
    }
    float _2234 = _2124;
    float _2236 = -_2094;
    float _2238 = _2236 + 1.0;
    float _2240 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2242 = -_1114;
    float _2244 = _2242 + 1.0;
    float _2246 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _2122;
    float _2248 = _2244 * _2240;
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    bool _2252 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2254 = isnan(_832);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2260 = _2256 || _2258;
    float _2262 = _2246 * _1134;
    float _2264 = -_2246;
    float _2266 = _2264 + 1.0;
    float _2268 = -_2250;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_87.x = _1904;
    out.m_87.y = _1914;
    out.m_87.z = _1916;
    float _2272 = _1145 * _2262;
    float _2274 = _1155 * _2262;
    float _2276 = _2270 * _2048;
    float _2278 = _1145 * _2266;
    float _2280 = fma(_1151, _2272, _1139);
    float _2282 = fma(_1153, _2272, _1141);
    float _2284 = _2276 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2286 = fma(_1145, _2274, _1143);
    out.gl_Position.x = _1092;
    out.gl_Position.y = _1104;
    out.gl_Position.z = _2088;
    out.gl_Position.w = _1048;
    out.m_89.x = _2284;
    out.m_91.x = _2280;
    out.m_91.y = _2282;
    out.m_91.z = _2286;
    out.m_91.w = _2278;
    out.m_93.x = _2120;
    out.m_93.y = _2106;
    out.m_93.z = _2108;
    out.m_93.w = _1048;
    float _2288 = _2180 * _2234;
    float _2290 = _2288;
    if (!_2260)
    {
        _1358 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2292 = _1358;
    float _2294 = _2292;
    float _2296 = _2292;
    if (!_2260)
    {
        _2114 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2298 = _2114;
    float _2300 = _2298;
    float _2302 = _2298;
    if (!_2260)
    {
        _1360 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2304 = _1360;
    float _2306 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2308 = _2304;
    float _2310 = _2304;
    if (!_2260)
    {
        _2116 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2312 = _2116;
    float _2314 = _2312;
    float _2316 = _2312;
    if (!_2260)
    {
        _2126 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2318 = _2126;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2260)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2324 = _2290;
    bool _2326 = !_2260;
    float _2328 = _2324;
    float _2330 = _2324;
    if (!_2326)
    {
        bool _2332 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2334 = isnan(_832);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2340 = _2336 || _2338;
        if (!_2340)
        {
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2344 = _832 + _2342;
            float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2348 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2346;
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2354 = 1.0 / _2348;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2372 = _2344 * _2354;
            float _2374 = precise::clamp(_2372, 0.0, 1.0);
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2380 = fma(_2374, _2352, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2382 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2384 = fma(_2374, _2358, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2386 = fma(_2374, _2362, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2388 = fma(_2374, _2366, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2390 = fma(_2374, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2322 = _2384;
            _2310 = _2388;
            _2316 = _2380;
            _2302 = _2386;
            _2296 = _2382;
            _2330 = _2390;
            _2392 = true;
        }
        else
        {
            bool _2394 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2396 = isnan(_832);
            bool _2398 = _2394 || _2396;
            bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2402 = _2398 || _2400;
            if (!_2402)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2404 = _2314;
            _2316 = _2404;
            if (!_2402)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2406 = _2320;
            _2322 = _2406;
            if (!_2402)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2408 = _2294;
            _2296 = _2408;
            if (!_2402)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2410 = _2300;
            _2302 = _2410;
            if (!_2402)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2412 = _2308;
            _2310 = _2412;
            if (!_2402)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2414 = _2328;
            bool _2416 = !_2402;
            _2330 = _2414;
            if (!_2416)
            {
                bool _2418 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2420 = isnan(_832);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2426 = _2422 || _2424;
                if (!_2426)
                {
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2430 = _832 + _2428;
                    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2434 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2432;
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2440 = 1.0 / _2434;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2458 = _2430 * _2440;
                    float _2460 = precise::clamp(_2458, 0.0, 1.0);
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2466 = fma(_2460, _2438, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2468 = fma(_2460, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2470 = fma(_2460, _2444, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2472 = fma(_2460, _2448, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2474 = fma(_2460, _2452, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2476 = fma(_2460, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2322 = _2470;
                    _2310 = _2474;
                    _2316 = _2466;
                    _2302 = _2472;
                    _2296 = _2468;
                    _2330 = _2476;
                    _2392 = true;
                }
                else
                {
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2392 = false;
    float _2478 = _2322;
    float _2480 = _2310;
    float _2482 = _2316;
    float _2484 = _2302;
    float _2486 = _2296;
    float _2488 = _2330;
    float _2490 = fma(_1914, -0.5, 0.5);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = -_2478;
    float _2496 = _2494 + _2480;
    float _2498 = _2306 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2500 = -_2482;
    float _2502 = _2500 + _2484;
    float _2504 = fma(_2492, _2496, _2478);
    out.m_95.x = 0.0;
    float _2506 = -_2486;
    float _2508 = _2506 + _2488;
    float _2510 = fma(_2492, _2502, _2482);
    float _2512 = _2504 * 0.586610972881317138671875;
    out.m_53.x = _2498;
    bool _2514 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2516 = fma(_2492, _2508, _2486);
    float _2518 = fma(_2510, 0.298911988735198974609375, _2512);
    bool _2520 = _2180 > 0.0;
    bool _2522 = isnan(_2180);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(0.0);
    bool _2528 = _2524 || _2526;
    float _2530 = fma(_2516, 0.114477999508380889892578125, _2518);
    bool _2532 = _2234 <= 0.0;
    bool _2534 = !_2528;
    bool _2536 = _2532 || _2534;
    float _2538 = -_2530;
    float _2540 = _2510 + _2538;
    float _2542 = -_2530;
    float _2544 = _2504 + _2542;
    float _2546 = -_2530;
    float _2548 = _2516 + _2546;
    float _2550 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    float _2554 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    bool _2556 = !_2514;
    if (!_2556)
    {
        float _2558 = -_792;
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2562 = -_796;
        float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2566 = -_800;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2570 = _2560 * _2560;
        float _2572 = fma(_2564, _2564, _2570);
        float _2574 = fma(_2568, _2568, _2572);
        float _2576 = sqrt(_2574);
        float _2578 = rsqrt(_2574);
        float _2580 = -_2576;
        float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2584 = _2582 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2586 = precise::clamp(_2584, 0.0, 1.0);
        float _2588 = _2564 * _2578;
        float _2590 = _2560 * _2578;
        float _2592 = abs(_2586);
        float _2594 = log2(_2592);
        float _2596 = _2568 * _2578;
        float _2598 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2600 = _1914 * _2590;
        float _2602 = -_2590;
        float _2604 = -_2598;
        float _2606 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2604);
        float _2608 = fma(_1904, _2588, _2600);
        float _2610 = -_2596;
        float _2612 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2606);
        float _2614 = fma(_1916, _2596, _2608);
        float _2616 = precise::clamp(_2614, 0.0, 1.0);
        float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2620 = _2612 + _2618;
        float _2622 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2624 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        float _2628 = exp2(_2622);
        float _2630 = _2628 * _2626;
        float _2632 = _2616 * _2630;
        float _2634 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2636 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2638 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2634;
        out.m_95.y = _2636;
        out.m_95.z = _2638;
    }
    out.m_97.x = _2550;
    out.m_97.y = _2552;
    out.m_97.z = _2554;
    if (!_2536)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2640 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2640;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2392 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_118);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_138);
        out.gl_Position.z = _2708;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _142 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_113);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_118);
    bool _154 = _122 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _130;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2763 = as_type<float>(_164);
        out.gl_Position.z = _2763;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.y;
    float _168 = 1.0 / _152;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = in.m_55.z;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    float _178 = in.m_59.y;
    float _180 = _122 * _168;
    float _182 = in.m_59.z;
    float _184 = _166 * _166;
    float _186 = in.m_57.x;
    float _188 = _172 * _172;
    float _190 = in.m_55.x;
    float _192 = fma(_174, _174, _184);
    float _194 = in.m_59.x;
    float _196 = fma(_176, _176, _188);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_182, _182, _196);
    float _202 = sqrt(_198);
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = sqrt(_200);
    bool _212 = _202 > 0.0;
    bool _214 = _210 > 0.0;
    float _216 = _174 * _206;
    float _218 = _166 * _206;
    float _220 = _178 * _206;
    float _222 = 0.0;
    float _224 = _218;
    float _226 = _190;
    float _228 = _198;
    float _230 = _200;
    float _232 = _180;
    float _234 = _172;
    if (_212)
    {
        float _236 = rsqrt(_198);
        _222 = _236;
    }
    float _238 = _222;
    float _240 = fma(_204, _186, _216);
    float _242 = fma(_204, _190, _218);
    float _244 = fma(_204, _194, _220);
    float _246 = _240;
    if (!_212)
    {
        _224 = 0.0;
    }
    float _248 = _224;
    float _250 = fma(_176, _208, _240);
    float _252 = _248;
    if (!_212)
    {
        _226 = 0.0;
    }
    float _254 = _226;
    float _256 = fma(_172, _208, _242);
    float _258 = 0.0;
    float _260 = _254;
    if (_214)
    {
        float _262 = rsqrt(_200);
        _258 = _262;
    }
    float _264 = _258;
    if (!_214)
    {
        _228 = 0.0;
    }
    float _266 = _228;
    float _268 = fma(_182, _208, _244);
    float _270 = 0.0;
    float _272 = _266;
    if (!_212)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _274;
    if (!_214)
    {
        _246 = 0.0;
    }
    float _278 = _246;
    float _280 = _278;
    if (_212)
    {
        float _282 = _238 * _166;
        _252 = _282;
    }
    float _284 = _252;
    float _286 = _284;
    if (!_214)
    {
        _230 = 0.0;
    }
    float _288 = _230;
    float _290 = _288;
    if (_212)
    {
        float _292 = _238 * _174;
        _260 = _292;
    }
    float _294 = _260;
    float _296 = _294;
    if (_212)
    {
        float _298 = _238 * _178;
        _276 = _298;
    }
    float _300 = _276;
    float _302 = _300;
    if (_214)
    {
        float _304 = _264 * _172;
        _272 = _304;
    }
    float _306 = _272;
    if (_214)
    {
        float _308 = _264 * _176;
        _290 = _308;
    }
    float _310 = _290;
    if (_214)
    {
        float _312 = _264 * _182;
        _280 = _312;
    }
    float _314 = _280;
    bool _316 = !_170;
    float _334;
    if (!_316)
    {
        float _318 = in.m_63.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        _334 = _180;
    }
    _336 = false;
    float _338 = _334;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _342 = _338 + _340;
    bool _344 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_338);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _356;
    bool _360 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_338);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _376;
    float _380 = 1.0 / _358;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = _370 * _374;
    float _386 = -_370;
    float _388 = _386 + 1.0;
    float _390 = _342 * _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    float _396 = fma(_378, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = _396 * _384;
    float _408 = _404 * _384;
    float _410 = _402 * _384;
    float _412 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _414 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _416 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _418 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].x, _412);
    float _420 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].y, _414);
    float _422 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[144].z, _416);
    bool _424 = !_382;
    if (!_424)
    {
        float _426 = in.m_63.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _232 = _440;
    }
    float _442 = _232;
    float _444 = in.m_46.x;
    float _446 = in.m_46.y;
    float _448 = in.m_46.z;
    float _450 = _256 * _256;
    float _452 = in.m_65.y;
    float _454 = fma(_250, _250, _450);
    float _456 = in.m_57.w;
    float _458 = fma(_268, _268, _454);
    float _460 = in.m_59.w;
    float _462 = rsqrt(_458);
    float _464 = _174 * _446;
    float _466 = _178 * _446;
    float _468 = fma(_186, _444, _464);
    float _470 = fma(_194, _444, _466);
    float _472 = _446 + _452;
    float _474 = _256 * _462;
    float _476 = fma(_176, _448, _468);
    float _478 = fma(_182, _448, _470);
    float _480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _482 = _472 + _480;
    float _484 = _250 * _462;
    float _486 = _476 + _456;
    float _488 = _478 + _460;
    float _490 = _482 * _482;
    float _492 = _474 * _284;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _496 = _486 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _500 = _488 + _498;
    float _502 = _268 * _462;
    float _504 = fma(_484, _294, _492);
    float _506 = fma(_496, _496, _490);
    float _508 = fma(_502, _300, _504);
    float _510 = fma(_500, _500, _506);
    float _512 = rsqrt(_510);
    float _514 = abs(_508);
    bool _516 = _514 > 0.99989998340606689453125;
    if (_516)
    {
        float _518 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _518;
    }
    float _520 = _296;
    if (_516)
    {
        float _522 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _522;
    }
    float _524 = _302;
    float _526 = _482 * _512;
    float _528 = _496 * _512;
    float _530 = -_520;
    float _532 = _502 * _530;
    float _534 = _528;
    if (_516)
    {
        float _536 = fma(_306, 0.001000000047497451305389404296875, _284);
        _286 = _536;
    }
    float _538 = _286;
    float _540 = -_526;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _482);
    float _544 = -_528;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _548 = -_524;
    float _550 = _474 * _548;
    float _552 = -_524;
    float _554 = -_532;
    float _556 = fma(_484, _552, _554);
    float _558 = _542 * _542;
    float _560 = in.m_67.x;
    float _562 = in.m_67.y;
    float _564 = in.m_67.z;
    float _566 = -_538;
    float _568 = -_550;
    float _570 = fma(_502, _566, _568);
    float _572 = -_538;
    float _574 = _484 * _572;
    float _576 = fma(_546, _546, _558);
    float _578 = _500 * _512;
    float _580 = in.m_69.x;
    float _582 = in.m_69.y;
    float _584 = in.m_69.z;
    float _586 = _556 * _556;
    float _588 = -_520;
    float _590 = -_574;
    float _592 = fma(_474, _588, _590);
    float _594 = -_578;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _598 = fma(_570, _570, _586);
    float _600 = fma(_596, _596, _576);
    float _602 = fma(_592, _592, _598);
    float _604 = sqrt(_600);
    float _606 = rsqrt(_602);
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _560);
    float _610 = _420 * _582;
    float _612 = _422 * _584;
    float _614 = _418 * _580;
    float _616 = _512 * _604;
    float _618 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _620 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _626 = _618 * _616;
    float _628 = _620 * _616;
    float _630 = _622 * _616;
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _564);
    float _634 = _626 * _624;
    float _636 = _556 * _606;
    float _638 = _630 * _608;
    float _640 = _628 * _632;
    float _642 = _570 * _606;
    float _644 = _592 * _606;
    float _646 = _484 * _636;
    float _648 = _634 * _502;
    float _650 = _634 * _484;
    float _652 = _474 * _644;
    float _654 = -_646;
    float _656 = fma(_474, _642, _654);
    float _658 = fma(_638, _644, _648);
    float _660 = fma(_638, _642, _650);
    float _662 = -_652;
    float _664 = fma(_502, _636, _662);
    float _666 = _502 * _642;
    float _668 = fma(_640, _656, _658);
    float _670 = fma(_640, _664, _660);
    float _672 = -_666;
    float _674 = fma(_484, _644, _672);
    float _676 = _488 + _668;
    float _678 = _486 + _670;
    float _680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _682 = _676 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _686 = _678 + _684;
    float _688 = _682 * _682;
    float _690 = fma(_686, _686, _688);
    float _692 = _634 * _474;
    float _694 = sqrt(_690);
    float _696 = fma(_638, _636, _692);
    float _698 = fma(_640, _674, _696);
    float _700 = _472 + _698;
    bool _702 = _694 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _714 = _712 != 0;
    bool _716 = !_710;
    int _718 = _716 ? 0 : 1;
    bool _720 = !_706;
    int _722 = _720 ? 0 : 1;
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    float _728 = _696;
    float _730 = _676;
    float _732 = _682;
    float _734 = _640;
    float _736 = _578;
    if (!_702)
    {
        _728 = _678;
    }
    float _738 = _728;
    float _740 = _738;
    if (!_702)
    {
        _234 = _700;
    }
    float _742 = _234;
    bool _744 = !_702;
    float _746 = _742;
    if (!_744)
    {
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _750 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _752 = _694 + _750;
        float _754 = rsqrt(_690);
        float _756 = _752 * _748;
        float _758 = _700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _760 = _756 * 0.15915493667125701904296875;
        float _762 = _760 * 6.283185482025146484375;
        float _764 = cos(_762);
        float _766 = _760 * 6.283185482025146484375;
        float _768 = sin(_766);
        float _770 = _764 + (-1.0);
        float _772 = fma(_768, _758, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _774 = _770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _754 * _772;
        float _778 = fma(_700, _764, _774);
        float _780 = fma(_686, _776, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _782 = fma(_682, _776, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _746 = _778;
        _740 = _780;
        _730 = _782;
    }
    float _784 = _746;
    float _786 = _740;
    float _788 = _730;
    float _790 = -_526;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _794 = -_528;
    float _796 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _798 = -_578;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _788);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _804 = _792 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _808 = _796 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _812 = _800 + _810;
    float _814 = _804 * _804;
    float _816 = -_528;
    float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[18].w, _486);
    float _820 = -_578;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _824 = fma(_808, _808, _814);
    float _826 = fma(_812, _812, _824);
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _830 = rsqrt(_826);
    float _832 = sqrt(_826);
    float _834 = _830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _836 = _808 * _834;
    float _838 = _812 * _834;
    float _840 = _836 * _836;
    float _842 = _838 * _838;
    float _844 = _840 + _842;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = _700;
    float _856 = _852;
    float _858 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _860 = _838;
    float _862 = _836;
    if (_848)
    {
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _864;
    }
    float _866 = _854;
    if (!_848)
    {
        _534 = _836;
    }
    float _868 = _534;
    float _870 = _868;
    if (_848)
    {
        float _872 = rsqrt(_844);
        _732 = _872;
    }
    float _874 = _732;
    float _876 = _874;
    if (_848)
    {
        float _878 = _852 * _866;
        _856 = _878;
    }
    float _880 = _856;
    float _882 = _792 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_848)
    {
        float _884 = _880 * 0.15915493667125701904296875;
        _734 = _884;
    }
    float _886 = _734;
    float _888 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _890 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _882);
    float _892 = _866;
    if (_848)
    {
        float _894 = _886 * 6.283185482025146484375;
        float _896 = sin(_894);
        _892 = _896;
    }
    float _898 = _892;
    float _900 = precise::max(0.0, _888);
    float _902 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _890);
    float _904 = -_834;
    float _906 = -_900;
    float _908 = fma(_804, _904, _906);
    float _910 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _912 = _900;
    if (_848)
    {
        float _914 = _886 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _922 = _902 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_848)
    {
        float _924 = _908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _924;
    }
    float _926 = _912;
    float _928 = _926;
    if (!_848)
    {
        _736 = _908;
    }
    float _930 = _736;
    float _932 = _898;
    float _934 = _930;
    if (_848)
    {
        float _936 = fma(_898, _926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _928 = _936;
    }
    float _938 = _928;
    if (_848)
    {
        float _940 = _874 * _938;
        _858 = _940;
    }
    float _942 = _858;
    float _944 = floor(_920);
    if (_848)
    {
        float _946 = _918 + (-1.0);
        _932 = _946;
    }
    float _948 = _932;
    float _950 = _948;
    if (_848)
    {
        float _952 = _836 * _942;
        _870 = _952;
    }
    float _954 = _870;
    if (_848)
    {
        float _956 = _838 * _942;
        _860 = _956;
    }
    float _958 = _860;
    if (!_848)
    {
        _862 = _842;
    }
    float _960 = _862;
    float _962 = _960;
    if (_848)
    {
        float _964 = _948 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _964;
    }
    float _966 = _876;
    if (!_848)
    {
        _950 = _840;
    }
    float _968 = _950;
    float _970 = _968;
    if (_848)
    {
        float _972 = _954 * _954;
        _970 = _972;
    }
    float _974 = _970;
    if (_848)
    {
        float _976 = _958 * _958;
        _962 = _976;
    }
    float _978 = _962;
    if (_848)
    {
        float _980 = fma(_908, _918, _966);
        _934 = _980;
    }
    float _982 = _934;
    float _984 = _792 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _986 = fma(_822, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _988 = fma(_982, _982, _974);
    float _990 = _792 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _984);
    float _994 = _988 + _978;
    float _996 = _792 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _998 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _992);
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1004 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1002);
    float _1006 = precise::clamp(_1004, 0.0, 1.0);
    float _1008 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _996);
    float _1010 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1012 = rsqrt(_994);
    float _1014 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1016 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1008);
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1020 = -_1006;
    float _1022 = _1020 + 1.0;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1030 = floor(_986);
    float _1032 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1028);
    float _1034 = -_1024;
    float _1036 = fma(_1034, _828, 1.0);
    float _1038 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1032);
    float _1040 = abs(_1022);
    float _1042 = log2(_1040);
    float _1044 = _1012 * _954;
    float _1046 = _1012 * _958;
    float _1048 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1038);
    float _1050 = _1012 * _982;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1054 = -_944;
    float _1056 = _920 + _1054;
    float _1058 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1060 = log2(_1036);
    float _1062 = -_1052;
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1062);
    float _1066 = -_1030;
    float _1068 = _986 + _1066;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1058);
    float _1072 = _1050 + 1.0;
    float _1074 = -_1046;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1064);
    float _1078 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1080 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1070);
    float _1082 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1084 = fma(_1076, -0.5, 0.5);
    float _1086 = 1.0 / _1048;
    float _1088 = fma(_1076, 0.5, 0.5);
    float _1090 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1078);
    float _1092 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1080);
    float _1094 = fma(_1088, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1096 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1090);
    float _1098 = _1060 * 0.693147182464599609375;
    float _1100 = exp2(_1082);
    float _1102 = fma(_1088, _1094, -0.212114393711090087890625);
    float _1104 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1096);
    float _1106 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1108 = fma(_1088, _1102, 1.570728778839111328125);
    float _1110 = sqrt(_1084);
    float _1112 = _1092 * _1086;
    float2 _4274 = float2(_1056, _1068);
    float _1114 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4274, float2(0.0), isnan(_4274)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4274, float2(0.0), isnan(_4274)), level(0.0)).x;
    float _1116 = fma(_1112, 0.5, 0.5);
    float _1118 = -_1050;
    float _1120 = fma(_1100, _1072, _1118);
    float _1122 = _1104 * _1086;
    float _1124 = fma(_1120, 0.5, 0.5);
    float _1126 = fma(_1122, -0.5, 0.5);
    float _1128 = _1110 * 0.636619746685028076171875;
    float _1130 = -_1108;
    float _1132 = fma(_1128, _1130, 1.0);
    float3 _4308 = float3(_1116, _1126, _1106);
    float _1134 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4308, float3(0.0), isnan(_4308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4308, float3(0.0), isnan(_4308)), level(0.0)).x;
    float3 _4319 = float3(_1116, _1126, _1106);
    float4 _1137 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4319, float3(0.0), isnan(_4319)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4319, float3(0.0), isnan(_4319)), level(0.0)).xyzw;
    float _1139 = _1137.x;
    float _1141 = _1137.y;
    float _1143 = _1137.z;
    float _1145 = _1137.w;
    float2 _4335 = float2(_1132, _1124);
    float3 _1149 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4335, float2(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4335, float2(0.0), isnan(_4335)), level(0.0)).xyz;
    float _1151 = _1149.x;
    float _1153 = _1149.y;
    float _1155 = _1149.z;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1159 = int(_1157);
    float _1161 = in.m_71.x;
    float _1163 = -_526;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _472);
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1169 = _1167 != 0;
    float _1171 = in.m_71.z;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1175 = _1173 != 0;
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1179 = int(_1177);
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1183 = _1181 != 0;
    float _1185 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1189 = _1187 != 0;
    int _1191 = abs(_722);
    float _1193 = float(_1159);
    float _1195 = 1.0 / _1193;
    float _1197 = float(uint(_1179));
    int _1199 = ~_1179;
    int _1201 = _1199 + 1;
    out.m_73.x = _1161;
    float _1203 = float(_1179);
    float _1205 = 1.0 / _1197;
    out.m_73.z = _1171;
    float _1207 = _122 * _1203;
    float _1209 = _122 * _1195;
    float _1211 = _1207 * _168;
    float _1213 = trunc(_1209);
    int _1215 = int(_1213);
    int _1217 = as_type<int>(_1205) + (-2);
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1221 = _1219 != 0;
    float _1223 = in.m_75.y;
    float _1225 = float(uint(_1215));
    bool _1227 = !_1221;
    float _1229 = _1227 ? 7.345489978790283203125 : 1.0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1233 = _1231 != 0;
    float _1235 = as_type<float>(_1217) * _1225;
    int _1237 = ~_1179;
    int _1239 = _1237 + 1;
    float _1241 = float(_1215);
    bool _1243 = !_1233;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = trunc(_1235);
    float _1249 = precise::max(_1247, 0.0);
    uint _1252 = uint(_1249);
    bool _1254 = _1241 >= _1203;
    bool _1256 = isnan(_1241);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(_1203);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    int _1266 = abs(_1245);
    bool _1268 = _562 != 0.0;
    bool _1270 = isnan(_562);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan(0.0);
    bool _1276 = _1272 || _1274;
    float _1278 = trunc(_1264);
    int _1280 = int(_1278);
    bool _1282 = _560 == 0.0;
    bool _1284 = !_1276;
    bool _1286 = _1282 && _1284;
    bool _1288 = _564 == 0.0;
    bool _1290 = _1288 && _1286;
    int _1292 = _1239 * int(_1252);
    int _1294 = _1292 + _1215;
    float _1296 = float(uint(_1294));
    float _1298 = in.m_63.x;
    float _1300 = in.m_63.y;
    float _1302 = in.m_63.z;
    float _1304 = as_type<float>(_1217) * _1296;
    float _1306 = in.m_71.y;
    float _1308 = trunc(_1304);
    float _1310 = precise::max(_1308, 0.0);
    uint _1312 = uint(_1310);
    int _1314 = int(_1252) + int(_1312);
    float _1316 = _1229 * _1298;
    float _1318 = in.m_71.w;
    bool _1320 = _1300 > 0.5;
    float _1322 = floor(_1316);
    int _1324 = _1201 * _1314;
    int _1326 = _1324 + _1215;
    out.m_73.y = _1306;
    bool _1328 = uint(_1326) >= uint(_1179);
    bool _1330 = !_1328;
    int _1332 = _1330 ? 0 : (-1);
    int _1334 = ~_1280;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    int _1340 = ~_1314;
    int _1342 = _1340 + _1332;
    int _1344 = _1342 + 1;
    float _1346 = -_1322;
    float _1348 = _1316 + _1346;
    float _1350 = -_1223;
    float _1352 = _1350 + 1.0;
    float _1354 = _1348 * _1203;
    out.m_73.w = _1318;
    float _1356 = _1223;
    float _1358 = _1048;
    float _1360 = _1104;
    if (_1183)
    {
        float _1362 = _1320 ? _1352 : _1223;
        _1356 = _1362;
    }
    float _1364 = _1356;
    int _1366 = _1179 * _1344;
    int _1368 = _1366 + _1215;
    float _1370 = trunc(_1354);
    int _1372 = int(_1370);
    bool _1374 = _1179 == 0;
    int _1376 = _1179 + (-1);
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1380 = !_1374;
    int _1382 = _1380 ? _1368 : (-1);
    int _1384 = abs(_718);
    float _1386 = trunc(_1211);
    int _1388 = int(_1386);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1392 = _1382 * _1338;
    int _1394 = _1280 * _1376;
    int _1396 = _1394 + _1392;
    float _1398 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1390);
    int _1400 = _1372 * _1266;
    int _1402 = _1400 + _1215;
    bool _1404 = !_1169;
    int _1406 = _1404 ? 0 : 1;
    int _1408 = _1396 * _1384;
    int _1410 = abs(_726);
    float _1412 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1398);
    float _1414 = _1390;
    float _1416 = _1412;
    if (_1175)
    {
        float _1418 = in.m_63.x;
        _1414 = _1418;
    }
    float _1420 = _1414;
    int _1422 = abs(_1406);
    int _1424 = _1388 * _1191;
    int _1426 = _1424 + _1408;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1430 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1432 = _1402 * _1410;
    int _1434 = _1432 + _1426;
    float _1436 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1428);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1444 = _1372 * _1422;
    int _1446 = _1444 + _1434;
    float _1448 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1450 = -_1442;
    float _1452 = fma(_1430, 2.0, _1450);
    float _1454 = 1.0 / _1440;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1458 = -_122;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1452);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1470 = float(uint(_1446));
    float _1472 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1448, -2.0, _1466);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1480;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1486 = as_type<float>(_1217) * _1470;
    out.m_77.x = _1472;
    out.m_77.y = _1474;
    out.m_77.z = _1476;
    out.m_77.w = _1468;
    float _1488 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1484);
    float _1490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1478);
    float _1492 = trunc(_1486);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1502 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1488);
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1512 = _1420 > 0.5;
    bool _1514 = _1512 && _1175;
    float _1516 = _1412 * (-0.15915493667125701904296875);
    float _1518 = 1.0 / _1500;
    float _1520 = _1482 * _1454;
    int _1522 = ~_1179;
    int _1524 = _1522 + 1;
    float _1526 = in.m_79.x;
    float _1528 = in.m_79.y;
    float _1530 = in.m_79.z;
    float _1532 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1536 = _442 + _1534;
    int _1538 = _1524 * int(_1496);
    int _1540 = _1538 + _1446;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1542;
    float _1546 = 1.0 / _1506;
    float _1548 = float(uint(_1540));
    float _1550 = _1544 * _1518;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1554 = _442 + _1552;
    float _1556 = as_type<float>(_1217) * _1548;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1560 = _442 + _1558;
    float _1562 = fma(_1520, _1554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1564 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = fma(_1550, _1560, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1568 = trunc(_1556);
    float _1570 = precise::max(_1568, 0.0);
    uint _1572 = uint(_1570);
    float _1574 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1576 = _1530;
    float _1578 = _1528;
    float _1580 = _1526;
    if (!_1290)
    {
        float _1582 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1530);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = float(uint(_1402));
    if (!_1290)
    {
        float _1588 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1528);
        _1578 = _1588;
    }
    float _1590 = _1578;
    float _1592 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1290)
    {
        float _1594 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1526);
        _1580 = _1594;
    }
    float _1596 = _1580;
    bool _1598 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1600 = isnan(_442);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = as_type<float>(_1217) * _1586;
    float _1612 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1592);
    float _1614 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1574);
    float _1616 = _1510 * _1546;
    float _1618 = -_1608;
    float _1620 = _1618 + 1.0;
    float _1622 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1612);
    float _1624 = trunc(_1610);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    bool _1630 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1632 = isnan(_442);
    bool _1634 = _1630 || _1632;
    bool _1636 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1638 = _1634 || _1636;
    float _1640 = float(_1638);
    float _1642 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = in.m_75.x;
    float _1646 = fma(_1616, _1536, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1648 = ~_1179;
    int _1650 = _1648 + 1;
    float _1652 = _1640 * _1620;
    float _1654 = -_1640;
    float _1656 = _1654 + 1.0;
    bool _1658 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1660 = isnan(_442);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = 1.0 / _1642;
    int _1672 = int(_1496) + int(_1572);
    float _1674 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1676 = ~_1179;
    int _1678 = _1676 + 1;
    float _1680 = _484 * _1590;
    bool _1682 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1684 = isnan(_442);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = _1668 * _1656;
    int _1696 = _1650 * int(_1628);
    int _1698 = _1696 + _1402;
    float _1700 = -_1668;
    float _1702 = _1700 + 1.0;
    int _1704 = _1678 * _1672;
    int _1706 = _1704 + _1446;
    float _1708 = _1674 + _1642;
    float _1710 = _1516 * 6.283185482025146484375;
    float _1712 = sin(_1710);
    float _1714 = float(uint(_1698));
    float _1716 = _1692 * _1702;
    bool _1718 = uint(_1706) >= uint(_1179);
    float _1720 = -_1692;
    float _1722 = _1720 + 1.0;
    float _1724 = _1708 * _1670;
    float _1726 = _1724 * 0.5;
    float _1728 = as_type<float>(_1217) * _1714;
    float _1730 = _1562 * _1716;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : (-1);
    float _1736 = _1516 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1644;
    if (_1175)
    {
        _1416 = _1644;
    }
    float _1742 = _1416;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1746 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1744);
    float _1748 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1730);
    int _1750 = ~_1672;
    int _1752 = _1750 + _1734;
    int _1754 = _1752 + 1;
    float _1756 = _474 * _1590;
    float _1758 = _1742;
    if (_1514)
    {
        float _1760 = -_1742;
        float _1762 = _1760 + 1.0;
        _1758 = _1762;
    }
    float _1764 = _1758;
    float _1766 = fma(_1646, _1694, _1748);
    float _1768 = 1.0 / _1746;
    int _1770 = _1179 * _1754;
    int _1772 = _1770 + _1446;
    float _1774 = _502 * _1590;
    if (_1175)
    {
        _1740 = _1764;
    }
    float _1776 = _1740;
    float _1778 = _1712 * _1378;
    float _1780 = fma(_1566, _1652, _1766);
    bool _1782 = !_1374;
    int _1784 = _1782 ? _1772 : (-1);
    float _1786 = fma(_636, _1596, _1756);
    float _1788 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1790 = trunc(_1728);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    int _1796 = _1784 >> 31;
    float _1798 = _1738 * _1378;
    float _1800 = -_1778;
    float _1802 = fma(_1738, _1788, _1800);
    int _1804 = ~_1179;
    int _1806 = _1804 + 1;
    float _1808 = fma(_644, _1596, _1774);
    int _1810 = _1796 & 3;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1814 = _1768 * _1812;
    float _1816 = fma(_1532, _1802, _1460);
    float _1818 = fma(_1712, _1788, _1798);
    int _1820 = _1784 + _1810;
    float _1822 = abs(_1814);
    float _1824 = log2(_1822);
    float _1826 = _1816 + 0.5;
    float _1828 = -_1490;
    float _1830 = fma(_1502, _1818, _1828);
    int _1832 = _1820 >> 2;
    float _1834 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1780);
    int _1836 = int(_1628) + int(_1794);
    float _1838 = _1830 + 0.5;
    int _1840 = _1832 << 4;
    int _1842 = _1840 + 368;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1846 = uint(int(uint(_1842) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    out.m_81.x = _1826;
    out.m_81.y = _1838;
    int _1862 = _1806 * _1836;
    int _1864 = _1862 + _1402;
    float _1866 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1868 = fma(_642, _1596, _1680);
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1876 = _1842 + 8;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    uint _1880 = uint(int(uint(int(_1878)) >> uint(2)));
    int _1882 = int(_1878) & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    int _1886 = int(_1878) + 1;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    int _1890 = _1886 & 3;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[int(_1888)][_1890];
    float _1894 = _1870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1896 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = exp2(_1866);
    bool _1902 = uint(_1864) >= uint(_1179);
    float _1904 = fma(_664, _1584, _1868);
    int _1906 = _1784 & 3;
    bool _1908 = _1906 != 0;
    out.m_83.x = _1894;
    out.m_83.y = _1896;
    out.m_83.z = _1898;
    out.m_83.w = _1844;
    bool _1910 = !_1902;
    int _1912 = _1910 ? 0 : (-1);
    float _1914 = fma(_674, _1584, _1786);
    float _1916 = fma(_656, _1584, _1808);
    int _1918 = ~_1836;
    int _1920 = _1918 + _1912;
    int _1922 = _1920 + 1;
    int _1924 = _1179 * _1922;
    int _1926 = _1924 + _1402;
    int _1928 = _1784 & 3;
    bool _1930 = _1928 != 0;
    bool _1932 = uint(_1928) > 1u;
    bool _1934 = _1928 != 3;
    float _1936 = fma(_1900, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    int _1940 = _1908 ? 0 : 1;
    bool _1942 = uint(_1928) >= 2u;
    float _1944 = fma(_1938, -2.0, 3.0);
    float _1946 = _1938 * _1938;
    int _1948 = ~_1940;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1942 ? 0 : 1;
    float _1956 = _1946 * _1944;
    int _1958 = _1952;
    if (!_1932)
    {
        int _1960 = ~_1940;
        int _1962 = _1960 + 1;
        _1958 = _1962;
    }
    int _1964 = _1958;
    bool _1966 = !_1930;
    int _1968 = _1966 ? 0 : 1;
    bool _1970 = _1928 != 3;
    int _1972 = ~_1954;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = abs(_1964);
    float _1980 = -_1956;
    float _1982 = _1980 + 1.0;
    int _1984 = _1976;
    if (_1934)
    {
        int _1986 = ~_1954;
        int _1988 = _1986 + 1;
        _1984 = _1988;
    }
    int _1990 = _1984;
    int _1992 = abs(_1968);
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1956);
    bool _1996 = !_1970;
    int _1998 = _1996 ? 0 : (-1);
    int _2000 = abs(_1990);
    int _2002 = ~_1978;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    int _2008 = abs(_1998);
    int _2010 = ~_1992;
    int _2012 = _2010 + 1;
    int _2014 = _2012 + 1;
    int _2016 = _2006 * as_type<int>(_1860);
    bool _2018 = !_1189;
    int _2020 = _2018 ? 0 : 1;
    int _2022 = _2014 * as_type<int>(_1852);
    int _2024 = _2022 + _2016;
    int _2026 = ~_2000;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    int _2032 = abs(_2020);
    float _2034 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2036 = ~_2008;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = _2030 * as_type<int>(_1884);
    int _2044 = _2042 + _2024;
    float _2046 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2034);
    float _2048 = in.m_65.x;
    int _2050 = _2040 * as_type<int>(_1892);
    int _2052 = _2050 + _2044;
    int _2054 = ~_2032;
    int _2056 = _2054 + 1;
    int _2058 = _2056 + 1;
    float _2060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    bool _2062 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2064 = isnan(0.5);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2070 = _2066 || _2068;
    float _2072 = _1048 * 0.5;
    bool _2074 = _1814 <= 8000.0;
    bool _2076 = isnan(_1814);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    int _2086 = _2052 * _2058;
    float _2088 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    bool _2090 = !_1374;
    int _2092 = _2090 ? _1926 : (-1);
    float _2094 = exp2(_1185);
    float _2096 = _2084 * _1994;
    float _2098 = _2088 + _1048;
    float _2100 = _1092 + _1048;
    int _2102 = _2092 * _2032;
    int _2104 = _2102 + _2086;
    float _2106 = fma(_1104, -0.5, _2072);
    float _2108 = _2098 * 0.5;
    float _2110 = as_type<float>(_2016);
    float _2112 = _2072;
    float _2114 = _2088;
    float _2116 = _2106;
    if (_2070)
    {
        _2110 = 1.0;
    }
    float _2118 = _2110;
    float _2120 = _2100 * 0.5;
    float _2122 = float(_2104);
    float _2124 = _2118;
    float _2126 = _2120;
    if (_2070)
    {
        _2112 = 1.0;
    }
    float _2128 = _2112;
    float _2130 = _2128;
    if (!_2070)
    {
        float _2132 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2134 = _2132 * 0.15915493667125701904296875;
        float _2136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2138 = _2134 * 6.283185482025146484375;
        float _2140 = cos(_2138);
        float _2142 = _2136 * 0.15915493667125701904296875;
        float _2144 = _2134 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = 1.0 / _2140;
        float _2150 = _2142 * 6.283185482025146484375;
        float _2152 = cos(_2150);
        float _2154 = _2146 * _2148;
        float _2156 = _2142 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2162 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2160;
        float _2164 = _2152 * _2154;
        float _2166 = 1.0 / _2164;
        float _2168 = 1.0 / _2162;
        float _2170 = _2158 * _2166;
        float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2174 = fma(_1814, _2170, _2172);
        float _2176 = _2174 * _2168;
        float _2178 = precise::clamp(_2176, 0.0, 1.0);
        _2130 = _2178;
    }
    float _2180 = _2130;
    if (!_2070)
    {
        float _2182 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2184 = _2182 * 0.15915493667125701904296875;
        float _2186 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2188 = _2184 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        float _2192 = _2186 * 0.15915493667125701904296875;
        float _2194 = _2184 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = 1.0 / _2190;
        float _2200 = _2192 * 6.283185482025146484375;
        float _2202 = cos(_2200);
        float _2204 = _2196 * _2198;
        float _2206 = _2192 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = _2202 * _2204;
        float _2212 = 1.0 / _2210;
        float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2216 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2214;
        float _2218 = 1.0 / _2216;
        float _2220 = _2208 * _2212;
        float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2224 = fma(_1814, _2220, _2222);
        float _2226 = _2224 * _2218;
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        float _2230 = -_2228;
        float _2232 = _2230 + 1.0;
        _2124 = _2232;
    }
    float _2234 = _2124;
    float _2236 = -_2094;
    float _2238 = _2236 + 1.0;
    float _2240 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2242 = -_1114;
    float _2244 = _2242 + 1.0;
    float _2246 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _2122;
    float _2248 = _2244 * _2240;
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    bool _2252 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2254 = isnan(_832);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2260 = _2256 || _2258;
    float _2262 = _2246 * _1134;
    float _2264 = -_2246;
    float _2266 = _2264 + 1.0;
    float _2268 = -_2250;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_87.x = _1904;
    out.m_87.y = _1914;
    out.m_87.z = _1916;
    float _2272 = _1145 * _2262;
    float _2274 = _1155 * _2262;
    float _2276 = _2270 * _2048;
    float _2278 = _1145 * _2266;
    float _2280 = fma(_1151, _2272, _1139);
    float _2282 = fma(_1153, _2272, _1141);
    float _2284 = _2276 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2286 = fma(_1145, _2274, _1143);
    out.gl_Position.x = _1092;
    out.gl_Position.y = _1104;
    out.gl_Position.z = _2088;
    out.gl_Position.w = _1048;
    out.m_89.x = _2284;
    out.m_91.x = _2280;
    out.m_91.y = _2282;
    out.m_91.z = _2286;
    out.m_91.w = _2278;
    out.m_93.x = _2120;
    out.m_93.y = _2106;
    out.m_93.z = _2108;
    out.m_93.w = _1048;
    float _2288 = _2180 * _2234;
    float _2290 = _2288;
    if (!_2260)
    {
        _1358 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2292 = _1358;
    float _2294 = _2292;
    float _2296 = _2292;
    if (!_2260)
    {
        _2114 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2298 = _2114;
    float _2300 = _2298;
    float _2302 = _2298;
    if (!_2260)
    {
        _1360 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2304 = _1360;
    float _2306 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2308 = _2304;
    float _2310 = _2304;
    if (!_2260)
    {
        _2116 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2312 = _2116;
    float _2314 = _2312;
    float _2316 = _2312;
    if (!_2260)
    {
        _2126 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2318 = _2126;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2260)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2324 = _2290;
    bool _2326 = !_2260;
    float _2328 = _2324;
    float _2330 = _2324;
    if (!_2326)
    {
        bool _2332 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2334 = isnan(_832);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2340 = _2336 || _2338;
        if (!_2340)
        {
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2344 = _832 + _2342;
            float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2348 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2346;
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2354 = 1.0 / _2348;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2372 = _2344 * _2354;
            float _2374 = precise::clamp(_2372, 0.0, 1.0);
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2380 = fma(_2374, _2352, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2382 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2384 = fma(_2374, _2358, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2386 = fma(_2374, _2362, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2388 = fma(_2374, _2366, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2390 = fma(_2374, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2322 = _2384;
            _2310 = _2388;
            _2316 = _2380;
            _2302 = _2386;
            _2296 = _2382;
            _2330 = _2390;
            _2392 = true;
        }
        else
        {
            bool _2394 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2396 = isnan(_832);
            bool _2398 = _2394 || _2396;
            bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2402 = _2398 || _2400;
            if (!_2402)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2404 = _2314;
            _2316 = _2404;
            if (!_2402)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2406 = _2320;
            _2322 = _2406;
            if (!_2402)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2408 = _2294;
            _2296 = _2408;
            if (!_2402)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2410 = _2300;
            _2302 = _2410;
            if (!_2402)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2412 = _2308;
            _2310 = _2412;
            if (!_2402)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2414 = _2328;
            bool _2416 = !_2402;
            _2330 = _2414;
            if (!_2416)
            {
                bool _2418 = _832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2420 = isnan(_832);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2426 = _2422 || _2424;
                if (!_2426)
                {
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2430 = _832 + _2428;
                    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2434 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2432;
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2440 = 1.0 / _2434;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2458 = _2430 * _2440;
                    float _2460 = precise::clamp(_2458, 0.0, 1.0);
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2466 = fma(_2460, _2438, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2468 = fma(_2460, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2470 = fma(_2460, _2444, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2472 = fma(_2460, _2448, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2474 = fma(_2460, _2452, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2476 = fma(_2460, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2322 = _2470;
                    _2310 = _2474;
                    _2316 = _2466;
                    _2302 = _2472;
                    _2296 = _2468;
                    _2330 = _2476;
                    _2392 = true;
                }
                else
                {
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2392 = false;
    float _2478 = _2322;
    float _2480 = _2310;
    float _2482 = _2316;
    float _2484 = _2302;
    float _2486 = _2296;
    float _2488 = _2330;
    float _2490 = fma(_1914, -0.5, 0.5);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = -_2478;
    float _2496 = _2494 + _2480;
    float _2498 = _2306 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2500 = -_2482;
    float _2502 = _2500 + _2484;
    float _2504 = fma(_2492, _2496, _2478);
    out.m_95.x = 0.0;
    float _2506 = -_2486;
    float _2508 = _2506 + _2488;
    float _2510 = fma(_2492, _2502, _2482);
    float _2512 = _2504 * 0.586610972881317138671875;
    out.m_53.x = _2498;
    bool _2514 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2516 = fma(_2492, _2508, _2486);
    float _2518 = fma(_2510, 0.298911988735198974609375, _2512);
    bool _2520 = _2180 > 0.0;
    bool _2522 = isnan(_2180);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(0.0);
    bool _2528 = _2524 || _2526;
    float _2530 = fma(_2516, 0.114477999508380889892578125, _2518);
    bool _2532 = _2234 <= 0.0;
    bool _2534 = !_2528;
    bool _2536 = _2532 || _2534;
    float _2538 = -_2530;
    float _2540 = _2510 + _2538;
    float _2542 = -_2530;
    float _2544 = _2504 + _2542;
    float _2546 = -_2530;
    float _2548 = _2516 + _2546;
    float _2550 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    float _2554 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2530);
    bool _2556 = !_2514;
    if (!_2556)
    {
        float _2558 = -_792;
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2562 = -_796;
        float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2566 = -_800;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2570 = _2560 * _2560;
        float _2572 = fma(_2564, _2564, _2570);
        float _2574 = fma(_2568, _2568, _2572);
        float _2576 = sqrt(_2574);
        float _2578 = rsqrt(_2574);
        float _2580 = -_2576;
        float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2584 = _2582 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2586 = precise::clamp(_2584, 0.0, 1.0);
        float _2588 = _2564 * _2578;
        float _2590 = _2560 * _2578;
        float _2592 = abs(_2586);
        float _2594 = log2(_2592);
        float _2596 = _2568 * _2578;
        float _2598 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2600 = _1914 * _2590;
        float _2602 = -_2590;
        float _2604 = -_2598;
        float _2606 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2604);
        float _2608 = fma(_1904, _2588, _2600);
        float _2610 = -_2596;
        float _2612 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2606);
        float _2614 = fma(_1916, _2596, _2608);
        float _2616 = precise::clamp(_2614, 0.0, 1.0);
        float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2620 = _2612 + _2618;
        float _2622 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2624 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        float _2628 = exp2(_2622);
        float _2630 = _2628 * _2626;
        float _2632 = _2616 * _2630;
        float _2634 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2636 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2638 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2634;
        out.m_95.y = _2636;
        out.m_95.z = _2638;
    }
    out.m_97.x = _2550;
    out.m_97.y = _2552;
    out.m_97.z = _2554;
    if (!_2536)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2640 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2640;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

