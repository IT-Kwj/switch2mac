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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_85 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_97 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_77 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
    float4 m_65 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1997 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_44.w;
    float _113 = in.m_46.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _122;
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
        out.m_51.x = 0.0;
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
        float _2307 = as_type<float>(_138);
        out.gl_Position.z = _2307;
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
        out.m_51.x = 0.0;
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
        float _2362 = as_type<float>(_164);
        out.gl_Position.z = _2362;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    float _172 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_57.x;
    float _192 = in.m_57.y;
    float _194 = in.m_57.z;
    float _196 = _166 * _166;
    float _198 = _168 * _168;
    float _200 = fma(_174, _174, _196);
    float _202 = fma(_176, _176, _198);
    float _204 = fma(_190, _190, _200);
    float _206 = fma(_192, _192, _202);
    float _208 = _170 * _170;
    float _210 = sqrt(_204);
    float _212 = fma(_178, _178, _208);
    float _214 = fma(_194, _194, _212);
    float _216 = sqrt(_206);
    bool _218 = _210 > 0.0;
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    float _224 = in.m_46.x;
    float _226 = in.m_46.y;
    float _228 = in.m_46.z;
    float _230 = 0.0;
    float _232 = _206;
    float _234 = _204;
    float _236 = _172;
    if (_218)
    {
        float _238 = rsqrt(_204);
        _230 = _238;
    }
    float _240 = _230;
    bool _242 = _220 > 0.0;
    float _244 = _220;
    if (!_188)
    {
        float _246 = _172 * _172;
        float _248 = _246 * 0.5;
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    float _254 = _250;
    if (_222)
    {
        float _256 = rsqrt(_206);
        _252 = _256;
    }
    float _258 = _252;
    if (!_188)
    {
        float _260 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _260;
    }
    float _262 = _254;
    bool _264 = !_188;
    float _266 = _262;
    float _268 = _240;
    if (!_264)
    {
        float _270 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = log2(_270);
        float _274 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _276 = _274 + 1.0;
        float _278 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = _172 * _272;
        float _282 = 1.0 / _276;
        float _284 = _278 * 0.693147182464599609375;
        float _286 = exp2(_280);
        float _288 = 1.0 / _284;
        float _290 = _286 + (-1.0);
        float _292 = -_290;
        float _294 = fma(_292, _288, _172);
        float _296 = _294 * _282;
        float _298 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _286;
        _266 = _298;
        _234 = _288;
    }
    float _300 = _232;
    float _302 = _266;
    float _304 = _234;
    bool _306 = !_188;
    float _308 = _300;
    float _310 = _304;
    float _312 = _302;
    if (!_306)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _172 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _236 = _332;
        _308 = _324;
    }
    float _334 = _236;
    float _336 = _308;
    float _338 = in.m_59.w;
    float _340 = 0.0;
    float _342 = _336;
    if (!_218)
    {
        _340 = 0.0;
    }
    float _344 = _340;
    float _346 = 1.0 / _152;
    float _348 = 0.0;
    float _350 = _344;
    if (!_218)
    {
        _348 = 0.0;
    }
    float _352 = _348;
    float _354 = in.m_44.x;
    float _356 = in.m_44.y;
    float _358 = in.m_44.z;
    float _360 = _352;
    if (!_218)
    {
        _310 = 0.0;
    }
    float _362 = _310;
    float _364 = _362;
    if (_218)
    {
        float _366 = _240 * _174;
        _350 = _366;
    }
    float _368 = _350;
    if (_218)
    {
        float _370 = _240 * _166;
        _360 = _370;
    }
    float _372 = _360;
    if (_218)
    {
        float _374 = _240 * _190;
        _364 = _374;
    }
    float _376 = _364;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _380 = _214;
    if (_242)
    {
        float _382 = rsqrt(_214);
        _380 = _382;
    }
    float _384 = _380;
    float _386 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _388 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _390 = 0.0;
    if (!_222)
    {
        _390 = 0.0;
    }
    float _392 = _390;
    float _394 = _392;
    if (_222)
    {
        float _396 = _258 * _176;
        _394 = _396;
    }
    float _398 = _394;
    float _400 = fma(_334, _224, _386);
    float _402 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _404 = fma(_334, _226, _388);
    float _406 = 0.0;
    if (!_222)
    {
        _406 = 0.0;
    }
    float _408 = _406;
    float _410 = _408;
    if (_222)
    {
        float _412 = _258 * _168;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = fma(_334, _228, _402);
    if (!_222)
    {
        _342 = 0.0;
    }
    float _418 = _342;
    float _420 = _418;
    if (_222)
    {
        float _422 = _258 * _192;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = 0.0;
    if (!_242)
    {
        _426 = 0.0;
    }
    float _428 = _426;
    float _430 = _122 * _346;
    float _432 = _428;
    float _434 = _430;
    if (!_242)
    {
        _268 = 0.0;
    }
    float _436 = _268;
    float _438 = _436;
    if (_242)
    {
        float _440 = _384 * _178;
        _432 = _440;
    }
    float _442 = _432;
    if (!_242)
    {
        _312 = 0.0;
    }
    float _444 = _312;
    float _446 = _444;
    if (_242)
    {
        float _448 = _384 * _170;
        _438 = _448;
    }
    float _450 = _438;
    if (_242)
    {
        float _452 = _384 * _194;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = fma(_400, _338, _354);
    float _458 = fma(_404, _338, _356);
    float _460 = fma(_416, _338, _358);
    bool _462 = !_378;
    if (!_462)
    {
        float _464 = in.m_61.x;
        float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _472 = _470 * _466;
        float _474 = floor(_472);
        float _476 = -_474;
        float _478 = _472 + _476;
        _434 = _478;
    }
    float _480 = _434;
    float _482 = in.m_59.x;
    float _484 = in.m_59.y;
    float _486 = in.m_59.z;
    float _488 = _458 * _192;
    float _490 = _458 * _168;
    float _492 = in.m_63.x;
    float _494 = in.m_63.y;
    float _496 = in.m_63.z;
    float _498 = fma(_456, _190, _488);
    float _500 = _458 * _176;
    float _502 = fma(_456, _166, _490);
    float _504 = in.m_53.w;
    float _506 = fma(_460, _194, _498);
    float _508 = fma(_456, _174, _500);
    float _510 = fma(_460, _170, _502);
    float _512 = in.m_55.w;
    float _514 = fma(_460, _178, _508);
    float _516 = in.m_57.w;
    float _518 = in.m_65.x;
    float _520 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _522 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _494);
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _492);
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _496);
    float _536 = _528 * _526;
    float _538 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _540 = _532 * _530;
    float _542 = _510 + _504;
    float _544 = _536 * _414;
    float _546 = _536 * _398;
    float _548 = _538 * _534;
    float _550 = _536 * _424;
    float _552 = fma(_540, _372, _544);
    float _554 = fma(_540, _368, _546);
    float _556 = _514 + _512;
    float _558 = fma(_540, _376, _550);
    float _560 = fma(_548, _450, _552);
    float _562 = fma(_548, _442, _554);
    float _564 = _506 + _516;
    float _566 = fma(_548, _454, _558);
    float _568 = _542 + _560;
    float _570 = _556 + _562;
    float _572 = in.m_67.x;
    float _574 = in.m_67.y;
    float _576 = in.m_67.z;
    float _578 = _564 + _566;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _568 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _570 + _584;
    bool _588 = _494 != 0.0;
    bool _590 = isnan(_494);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _582 * _582;
    bool _600 = _492 == 0.0;
    bool _602 = !_596;
    bool _604 = _600 && _602;
    float _606 = fma(_586, _586, _598);
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _610 = _578 + _608;
    float _612 = _122 * 0.00999999977648258209228515625;
    bool _614 = _496 == 0.0;
    bool _616 = _614 && _604;
    float _618 = fma(_610, _610, _606);
    float _620 = fma(_518, 25.1327419281005859375, _612);
    float _622 = _620 * 0.15915493667125701904296875;
    float _624 = sqrt(_618);
    float _626 = 0.0;
    float _628 = _620;
    float _630 = _610;
    float _632 = _572;
    float _634 = _548;
    float _636 = _480;
    float _638 = _542;
    if (_616)
    {
        _626 = _574;
    }
    float _640 = _626;
    float _642 = 0.0;
    float _644 = _640;
    if (_616)
    {
        _642 = _572;
    }
    float _646 = _642;
    float _648 = _622 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = _646;
    if (_616)
    {
        _628 = _640;
    }
    float _654 = _628;
    float _656 = _654;
    if (!_616)
    {
        _644 = _574;
    }
    float _658 = _644;
    float _660 = 0.0;
    if (_616)
    {
        _660 = _576;
    }
    float _662 = _660;
    float _664 = _662;
    if (_616)
    {
        _630 = _646;
    }
    float _666 = _630;
    float _668 = _666;
    if (!_616)
    {
        float _670 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _656 = _670;
    }
    float _672 = _656;
    float _674 = precise::max(0.0, _624);
    if (!_616)
    {
        _652 = _572;
    }
    float _676 = _652;
    float _678 = precise::min(_674, 40.0);
    if (_616)
    {
        _632 = _662;
    }
    float _680 = _632;
    float _682 = fma(_650, 0.5, 0.5);
    float _684 = _680;
    if (!_616)
    {
        _664 = _576;
    }
    float _686 = _664;
    float _688 = _678 * 0.02500000037252902984619140625;
    if (!_616)
    {
        float _690 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _676);
        _668 = _690;
    }
    float _692 = _668;
    float _694 = _424 * _672;
    float _696 = _398 * _672;
    float _698 = _682 * _688;
    if (!_616)
    {
        float _700 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _686);
        _684 = _700;
    }
    float _702 = _684;
    float _704 = fma(_376, _692, _694);
    float _706 = fma(_368, _692, _696);
    float _708 = _698 * _698;
    float _710 = _414 * _672;
    float _712 = fma(_454, _702, _704);
    float _714 = fma(_442, _702, _706);
    float _716 = _708 * 3.0;
    float _718 = precise::max(_624, 60.0);
    float _720 = fma(_372, _692, _710);
    float _722 = fma(_712, _716, _578);
    float _724 = fma(_714, _716, _570);
    float _726 = precise::min(_718, 120.0);
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _730 = _722 + _728;
    float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _734 = _724 + _732;
    float _736 = fma(_726, -0.066666670143604278564453125, 4.0);
    float _738 = _730 * _730;
    float _740 = fma(_734, _734, _738);
    float _742 = fma(_450, _702, _720);
    float _744 = sqrt(_740);
    float _746 = fma(_742, _716, _568);
    float _748 = _746 + _736;
    bool _750 = _744 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _702;
    float _754 = _720;
    float _756 = _724;
    float _758 = _748;
    float _760 = _734;
    if (!_750)
    {
        _752 = _724;
    }
    float _762 = _752;
    float _764 = _762;
    if (!_750)
    {
        _754 = _722;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_750)
    {
        _756 = _748;
    }
    float _770 = _756;
    bool _772 = !_750;
    float _774 = _770;
    if (!_772)
    {
        float _776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _780 = _744 + _778;
        float _782 = _748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = rsqrt(_740);
        float _786 = _780 * _776;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _788 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 + (-1.0);
        float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = fma(_796, _782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _804 = fma(_748, _792, _800);
        float _806 = _784 * _802;
        float _808 = fma(_734, _806, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _810 = fma(_730, _806, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _774 = _804;
        _764 = _808;
        _768 = _810;
    }
    float _812 = _774;
    float _814 = _764;
    float _816 = _768;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _812 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _824 = _814 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _816 + _826;
    float _830 = _820 * _820;
    float _832 = fma(_824, _824, _830);
    float _834 = fma(_828, _828, _832);
    float _836 = rsqrt(_834);
    float _838 = sqrt(_834);
    float _840 = _836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _842 = _824 * _840;
    float _844 = _828 * _840;
    float _846 = _842 * _842;
    float _848 = _844 * _844;
    float _850 = _846 + _848;
    float _852 = sqrt(_850);
    bool _854 = _852 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = _852 + _856;
    float _860 = _828;
    float _862 = _850;
    float _864 = _858;
    float _866 = _820;
    if (_854)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _860 = _868;
    }
    float _870 = _860;
    if (_854)
    {
        float _872 = rsqrt(_850);
        _862 = _872;
    }
    float _874 = _862;
    float _876 = _874;
    if (_854)
    {
        float _878 = _858 * _870;
        _864 = _878;
    }
    float _880 = _864;
    if (_854)
    {
        float _882 = _880 * 0.15915493667125701904296875;
        _758 = _882;
    }
    float _884 = _758;
    float _886 = _870;
    if (_854)
    {
        float _888 = _884 * 6.283185482025146484375;
        float _890 = sin(_888);
        _886 = _890;
    }
    float _892 = _886;
    float _894 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _896 = precise::max(0.0, _894);
    float _898 = _836;
    float _900 = _896;
    if (_854)
    {
        float _902 = _884 * 6.283185482025146484375;
        float _904 = cos(_902);
        _898 = _904;
    }
    float _906 = _898;
    float _908 = -_840;
    float _910 = -_896;
    float _912 = fma(_820, _908, _910);
    if (_854)
    {
        float _914 = _912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _900 = _914;
    }
    float _916 = _900;
    float _918 = _812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _920 = _892;
    float _922 = _916;
    if (_854)
    {
        float _924 = fma(_892, _916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _866 = _924;
    }
    float _926 = _866;
    float _928 = _926;
    if (!_854)
    {
        _920 = _842;
    }
    float _930 = _920;
    float _932 = _930;
    float _934 = _906;
    if (_854)
    {
        float _936 = _906 + (-1.0);
        _922 = _936;
    }
    float _938 = _922;
    float _940 = _938;
    if (_854)
    {
        float _942 = _874 * _926;
        _634 = _942;
    }
    float _944 = _634;
    if (!_854)
    {
        _928 = _912;
    }
    float _946 = _928;
    float _948 = _946;
    if (_854)
    {
        float _950 = _938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _760 = _950;
    }
    float _952 = _760;
    if (_854)
    {
        float _954 = _842 * _944;
        _932 = _954;
    }
    float _956 = _932;
    if (!_854)
    {
        _940 = _844;
    }
    float _958 = _940;
    float _960 = _958;
    if (_854)
    {
        float _962 = _844 * _944;
        _960 = _962;
    }
    float _964 = _960;
    if (!_854)
    {
        _876 = _846;
    }
    float _966 = _876;
    float _968 = _966;
    if (_854)
    {
        float _970 = fma(_912, _906, _952);
        _948 = _970;
    }
    float _972 = _948;
    if (_854)
    {
        float _974 = _956 * _956;
        _968 = _974;
    }
    float _976 = _968;
    if (!_854)
    {
        _934 = _848;
    }
    float _978 = _934;
    float _980 = _978;
    if (_854)
    {
        float _982 = _964 * _964;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = fma(_972, _972, _976);
    float _988 = _986 + _984;
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _918);
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _994 = fma(_838, (*spvDescriptorSet0.vp_c15)._m0[23].w, _992);
    float _996 = precise::clamp(_994, 0.0, 1.0);
    float _998 = _812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1000 = rsqrt(_988);
    float _1002 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _990);
    float _1004 = -_996;
    float _1006 = _1004 + 1.0;
    float _1008 = _812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1010 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _998);
    float _1012 = _812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1016 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1008);
    float _1018 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1010);
    float _1020 = abs(_1006);
    float _1022 = log2(_1020);
    float _1024 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1026 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1016);
    float _1028 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1030 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1036 = _1000 * _956;
    float _1038 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1040 = _1000 * _972;
    float _1042 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1024);
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1038);
    float _1048 = _1000 * _964;
    float _1050 = -_1032;
    float _1052 = fma(_1050, _1030, 1.0);
    float _1054 = -_1044;
    float _1056 = fma(_1040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1054);
    float _1058 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1046);
    float _1062 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1064 = -_1048;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1056);
    float _1068 = log2(_1052);
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1060);
    float _1072 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1074 = fma(_1066, -0.5, 0.5);
    float _1076 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = fma(_1066, 0.5, 0.5);
    float _1080 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1072);
    float _1082 = _1040 + 1.0;
    float _1084 = exp2(_1062);
    float _1086 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1088 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1080);
    float _1090 = fma(_1078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1092 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1086);
    float _1094 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1088);
    float _1096 = fma(_1078, _1090, -0.212114393711090087890625);
    float _1098 = 1.0 / _1070;
    float _1100 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1102 = _1068 * 0.693147182464599609375;
    float _1104 = fma(_1078, _1096, 1.570728778839111328125);
    float _1106 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1108 = sqrt(_1074);
    float _1110 = -_1040;
    float _1112 = fma(_1084, _1082, _1110);
    float _1114 = fma(_1112, 0.5, 0.5);
    float _1116 = _1094 * _1098;
    float _1118 = _1100 * _1098;
    float _1120 = fma(_1116, 0.5, 0.5);
    float _1122 = fma(_1118, -0.5, 0.5);
    float _1124 = _1108 * 0.636619746685028076171875;
    float3 _3849 = float3(_1120, _1122, _1106);
    float _1126 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3849, float3(0.0), isnan(_3849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3849, float3(0.0), isnan(_3849)), level(0.0)).x;
    float _1128 = -_1104;
    float _1130 = fma(_1124, _1128, 1.0);
    float3 _3865 = float3(_1120, _1122, _1106);
    float4 _1133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3865, float3(0.0), isnan(_3865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3865, float3(0.0), isnan(_3865)), level(0.0)).xyzw;
    float _1135 = _1133.x;
    float _1137 = _1133.y;
    float _1139 = _1133.z;
    float _1141 = _1133.w;
    float2 _3882 = float2(_1130, _1114);
    float3 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3882, float2(0.0), isnan(_3882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3882, float2(0.0), isnan(_3882)), level(0.0)).xyz;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float _1153 = in.m_69.y;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = in.m_61.z;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1161 = _1159 != 0;
    float _1163 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1167 = _1165 != 0;
    float _1169 = in.m_61.y;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1173 = _1171 != 0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1179 = in.m_61.w;
    float _1181 = exp2(_1163);
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1185 = _1183 != 0;
    out.m_71.x = _518;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1189 = _1187 != 0;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1193 = _1191 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1195 = in.m_65.w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1201 = -_1153;
    float _1203 = _1201 + 1.0;
    float _1205 = in.m_61.x;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = 1.0 / _1177;
    bool _1211 = _1157 > 0.5;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1219 = _1211 ? as_type<int>(_1203) : as_type<int>(_1153);
    float _1221 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1223 = _1169 > 0.5;
    float _1225 = 1.0 / _1193;
    float _1227 = _1167 ? as_type<float>(_1219) : _1153;
    float _1229 = fma(_1217, -2.0, _1213);
    int _1231 = _1223 ? as_type<int>(_1203) : as_type<int>(_1153);
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1233;
    bool _1237 = _1179 > 0.5;
    float _1239 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1229);
    float _1241 = 1.0 / _1199;
    float _1243 = _1173 ? as_type<float>(_1231) : _1153;
    out.m_71.w = _1195;
    float _1245 = _1153;
    bool _1247 = _1161;
    float _1249 = _1157;
    float _1251 = _1169;
    float _1253 = _1094;
    float _1255 = _1070;
    float _1257 = _1100;
    if (_1161)
    {
        float _1259 = _1237 ? _1203 : _1153;
        _1245 = _1259;
    }
    float _1261 = _1245;
    float _1263 = -_1181;
    float _1265 = _1263 + 1.0;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1269 = _1267 != 0;
    float _1271 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1273 = in.m_73.x;
    float _1275 = in.m_73.y;
    float _1277 = in.m_73.z;
    float _1279 = in.m_73.w;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1283 = _1281 != 0;
    float _1285 = _1235 * _1225;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1299 = _480 + _1297;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1185)
    {
        bool _1303 = _1205 > 0.5;
        _1247 = _1303;
    }
    bool _1305 = _1247;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1311 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1301;
    out.m_75.y = _1215;
    out.m_75.z = _1307;
    float _1313 = -_1309;
    float _1315 = fma(_1271, 2.0, _1313);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1319 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1321 = in.m_69.x;
    float _1323 = _398 * _1275;
    float _1325 = _414 * _1275;
    float _1327 = _424 * _1275;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1331 = fma(_368, _1273, _1323);
    float _1333 = fma(_372, _1273, _1325);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1335;
    float _1339 = fma(_376, _1273, _1327);
    float _1341 = fma(_442, _1277, _1331);
    float _1343 = fma(_450, _1277, _1333);
    float _1345 = _1289 * _1209;
    float _1347 = fma(_454, _1277, _1339);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1351 = _480 + _1349;
    float _1353 = _1337 * _1241;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1357 = _480 + _1355;
    out.m_77.x = _1341;
    out.m_77.y = _1343;
    out.m_77.z = _1347;
    float _1359 = fma(_1285, _1351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1361 = fma(_1353, _1299, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1363 = fma(_1221, _1243, -0.5);
    bool _1365 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1367 = isnan(_480);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1379 = fma(_1345, _1357, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1381 = _1345;
    float _1383 = _1357;
    if (!_1269)
    {
        _1381 = _1169;
    }
    float _1385 = _1381;
    float _1387 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1329);
    float _1389 = _1385;
    if (_1269)
    {
        _1389 = _1205;
    }
    float _1391 = _1389;
    float _1393 = -_122;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1315);
    float _1397 = _1321;
    if (!_1185)
    {
        _1383 = _1321;
    }
    float _1399 = _1383;
    out.m_79.x = _714;
    out.m_79.y = _742;
    out.m_79.z = _712;
    bool _1401 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1403 = isnan(_480);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    out.m_81.x = _814;
    out.m_81.y = _812;
    out.m_81.z = _816;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1415 = -_1411;
    float _1417 = _1415 + 1.0;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1421 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1413);
    float _1423 = fma(_1227, _1319, -0.5);
    float _1425 = _1375 * _1417;
    float _1427 = -_1375;
    float _1429 = _1427 + 1.0;
    bool _1431 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1433 = isnan(_480);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1421);
    bool _1445 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1447 = isnan(_480);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1459 = as_type<int>(_1419);
    int _1461 = as_type<int>(_1457);
    float _1463 = _1399;
    if (_1269)
    {
        _636 = _1205;
    }
    float _1465 = _636;
    float _1467 = _1441 * _1429;
    float _1469 = _1465;
    if (!_1269)
    {
        _1469 = _1157;
    }
    float _1471 = _1469;
    float _1473 = -_1441;
    float _1475 = _1473 + 1.0;
    float _1477 = fma(_1419, _1261, -0.5);
    if (_1185)
    {
        float _1479 = -_1321;
        float _1481 = _1479 + 1.0;
        _1459 = as_type<int>(_1481);
    }
    int _1483 = _1459;
    float _1485 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1487 = -_1239;
    float _1489 = fma(_1443, _1363, _1487);
    float _1491 = _1455 * _1475;
    float _1493 = -_1455;
    float _1495 = _1493 + 1.0;
    float _1497 = -_1457;
    float _1499 = fma(_1485, 2.0, _1497);
    float _1501 = as_type<float>(_1483);
    if (_1189)
    {
        float _1503 = -_1321;
        float _1505 = _1503 + 1.0;
        _1461 = as_type<int>(_1505);
    }
    int _1507 = _1461;
    float _1509 = _1359 * _1491;
    float _1511 = _542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1513 = _542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1517 = _1507;
    if (!_1189)
    {
        _638 = _1321;
    }
    float _1519 = _638;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1523 = _1519;
    if (_1185)
    {
        float _1525 = _1305 ? as_type<float>(_1483) : _1321;
        _1463 = _1525;
    }
    float _1527 = _1463;
    float _1529 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1515);
    float _1531 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1189)
    {
        float _1533 = _1211 ? as_type<float>(_1507) : _1321;
        _1523 = _1533;
    }
    float _1535 = _1523;
    if (_1283)
    {
        float _1537 = -_1321;
        float _1539 = _1537 + 1.0;
        _1517 = as_type<int>(_1539);
    }
    int _1541 = _1517;
    float _1543 = as_type<float>(_1541);
    if (!_1269)
    {
        _1501 = _1157;
    }
    float _1545 = _1501;
    float _1547 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1511);
    float _1549 = _1545;
    if (_1269)
    {
        _1549 = _1169;
    }
    float _1551 = _1549;
    float _1553 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1513);
    float _1555 = -_1521;
    float _1557 = fma(_1531, 2.0, _1555);
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1509);
    if (_1283)
    {
        float _1563 = _1223 ? as_type<float>(_1541) : _1321;
        _1397 = _1563;
    }
    float _1565 = _1397;
    float _1567 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1317);
    if (_1269)
    {
        _1543 = _1157;
    }
    float _1569 = _1543;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1575 = _1569;
    if (!_1269)
    {
        _1575 = _1169;
    }
    float _1577 = _1575;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1269)
    {
        _1249 = _1169;
    }
    float _1581 = _1249;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1585 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1553);
    float _1587 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1571);
    float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1591 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1579);
    float _1593 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1583);
    if (!_1269)
    {
        _1251 = _1205;
    }
    float _1595 = _1251;
    float _1597 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1547);
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1601 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1603 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1605 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1607 = -_122;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1557);
    float _1611 = fma(_1601, -2.0, _1599);
    float _1613 = fma(_1603, _1527, -0.5);
    float _1615 = fma(_1605, _1535, -0.5);
    float _1617 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1387);
    float _1619 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1529);
    float _1621 = fma(_1379, _1467, _1561);
    float _1623 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1625 = _1277 * _676;
    float _1627 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1587);
    float _1629 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1631 = fma(_1623, _1565, -0.5);
    float _1633 = fma(_1617, _1613, _1395);
    float _1635 = -_1625;
    float _1637 = fma(_1273, _686, _1635);
    float _1639 = fma(_1619, _1615, _1609);
    float _1641 = _1275 * _686;
    float _1643 = fma(_1361, _1425, _1621);
    float _1645 = _1273 * _658;
    float _1647 = _1627 * (-0.15915493667125701904296875);
    float _1649 = 1.0 / _1629;
    float _1651 = -_1641;
    float _1653 = fma(_1277, _658, _1651);
    float _1655 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1657 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1659 = isnan(0.5);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1665 = _1661 || _1663;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1669 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1671 = _1655 + _1629;
    float _1673 = -_1645;
    float _1675 = fma(_1275, _676, _1673);
    float _1677 = _1647 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1637 * _1279;
    float _1683 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1567);
    float _1685 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1611);
    float _1687 = fma(_1669, -2.0, _1667);
    float _1689 = _1653 * _1279;
    float _1691 = _1681 * _414;
    float _1693 = -_1685;
    float _1695 = fma(_1683, _1477, _1693);
    float _1697 = _1647 * 6.283185482025146484375;
    float _1699 = cos(_1697);
    float _1701 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1593);
    float _1703 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1591);
    float _1705 = -_122;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1499);
    float _1709 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1687);
    float _1711 = _1637;
    float _1713 = _1633;
    if (!_1665)
    {
        _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1715 = _1711;
    float _1717 = _1639 + 0.5;
    float _1719 = fma(_1689, _372, _1691);
    float _1721 = _1671 * _1649;
    float _1723 = _1721 * 0.5;
    float _1725 = _1681 * _398;
    float _1727 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1729 = _1489 + 0.5;
    float _1731 = _1681 * _424;
    float _1733 = _1675 * _1279;
    float _1735 = _1633 + 0.5;
    float _1737 = _1679 * _1423;
    float _1739 = _1695 + 0.5;
    float _1741 = _1699 * _1423;
    if (!_1665)
    {
        float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1745 = fma(_1723, _1715, _1743);
        _1713 = _1745;
    }
    float _1747 = _1713;
    float _1749 = fma(_1689, _368, _1725);
    float _1751 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1727);
    float _1753 = -_1737;
    float _1755 = fma(_1699, _1631, _1753);
    float _1757 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1751);
    float _1759 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1643);
    out.m_83.x = _1735;
    out.m_83.y = _1729;
    out.m_83.z = _1717;
    out.m_83.w = _1739;
    float _1761 = fma(_1689, _376, _1731);
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1765 = _1747;
    if (!_1665)
    {
        float _1767 = 1.0 / _1747;
        _1765 = _1767;
    }
    float _1769 = _1765;
    float _1771 = fma(_1701, _1755, _1707);
    float _1773 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1757);
    float _1775 = fma(_1733, _442, _1749);
    float _1777 = fma(_1679, _1631, _1741);
    bool _1779 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1781 = isnan(_838);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1787 = _1783 || _1785;
    out.gl_Position.x = _1094;
    out.gl_Position.y = _1100;
    out.gl_Position.z = _1773;
    out.gl_Position.w = _1070;
    float _1789 = -_1709;
    float _1791 = fma(_1703, _1777, _1789);
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1797 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1799 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1803 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = fma(_1733, _450, _1719);
    float _1807 = fma(_1733, _454, _1761);
    float _1809 = _1773 + _1070;
    float _1811 = _1094 + _1070;
    out.m_85.x = _1799;
    out.m_85.y = _1801;
    out.m_85.z = _1803;
    out.m_85.w = _1797;
    float _1813 = _1771 + 0.5;
    float _1815 = _1791 + 0.5;
    float _1817 = _1070 * 0.5;
    out.m_87.x = _1775;
    out.m_87.y = _1805;
    out.m_87.z = _1807;
    float _1819 = _1773;
    float _1821 = _1809;
    float _1823 = _1811;
    if (!_1787)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1819;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1787)
    {
        _1253 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1831 = _1253;
    out.m_89.x = _1813;
    out.m_89.y = _1815;
    float _1833 = _1809 * 0.5;
    float _1835 = _1831;
    float _1837 = _1831;
    if (!_1665)
    {
        _1821 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1839 = _1821;
    float _1841 = _1811 * 0.5;
    float _1843 = -_1311;
    float _1845 = _1843 + 1.0;
    float _1847 = fma(_1100, -0.5, _1817);
    float _1849 = _1839;
    float _1851 = _1841;
    if (!_1665)
    {
        float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1855 = -_1839;
        float _1857 = fma(_1769, _1853, _1855);
        _1823 = _1857;
    }
    float _1859 = _1823;
    float _1861 = _1859;
    if (!_1665)
    {
        float _1863 = -_1839;
        float _1865 = _1863 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1849 = _1865;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1665)
    {
        _1255 = 1.0;
    }
    float _1871 = _1255;
    out.m_91.x = _1841;
    out.m_91.y = _1847;
    out.m_91.z = _1833;
    out.m_91.w = _1070;
    float _1873 = _1807;
    float _1875 = _1871;
    if (!_1665)
    {
        float _1877 = 1.0 / _1867;
        _1873 = _1877;
    }
    float _1879 = _1873;
    if (!_1787)
    {
        _1257 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1881 = _1257;
    float _1883 = _1311 * _1126;
    float _1885 = _1141 * _1883;
    float _1887 = _1141 * _1845;
    float _1889 = _1881;
    float _1891 = _1881;
    if (!_1787)
    {
        _1869 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1893 = _1869;
    float _1895 = _1151 * _1883;
    float _1897 = fma(_1147, _1885, _1135);
    float _1899 = fma(_1149, _1885, _1137);
    float _1901 = _1893;
    float _1903 = _1893;
    if (!_1787)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1905 = _1851;
    float _1907 = fma(_1141, _1895, _1139);
    float _1909 = _1905;
    float _1911 = _1905;
    if (!_1665)
    {
        float _1913 = _1859 * _1879;
        float _1915 = precise::clamp(_1913, 0.0, 1.0);
        _1861 = _1915;
    }
    float _1917 = _1861;
    out.m_93.x = _1897;
    out.m_93.y = _1899;
    out.m_93.z = _1907;
    out.m_93.w = _1887;
    float _1919 = _1917;
    if (!_1665)
    {
        float _1921 = -_1917;
        float _1923 = _1921 + 1.0;
        _1875 = _1923;
    }
    float _1925 = _1875;
    if (!_1787)
    {
        _1919 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1927 = _1919;
    float _1929 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1931 = !_1787;
    float _1933 = _1927;
    float _1935 = _1927;
    if (!_1931)
    {
        bool _1937 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1939 = isnan(_838);
        bool _1941 = _1937 || _1939;
        bool _1943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1945 = _1941 || _1943;
        if (!_1945)
        {
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1949 = _838 + _1947;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1953 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1951;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1959 = 1.0 / _1953;
            float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1967 = _1965 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1977 = _1949 * _1959;
            float _1979 = precise::clamp(_1977, 0.0, 1.0);
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1985 = fma(_1979, _1957, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1987 = fma(_1979, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1979, _1963, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1991 = fma(_1979, _1967, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1993 = fma(_1979, _1971, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1995 = fma(_1979, _1975, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1911 = _1985;
            _1903 = _1993;
            _1891 = _1989;
            _1837 = _1991;
            _1829 = _1987;
            _1935 = _1995;
            _1997 = true;
        }
        else
        {
            bool _1999 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2001 = isnan(_838);
            bool _2003 = _1999 || _2001;
            bool _2005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2007 = _2003 || _2005;
            if (!_2007)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2009 = _1889;
            _1891 = _2009;
            if (!_2007)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2011 = _1909;
            _1911 = _2011;
            if (!_2007)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2013 = _1827;
            _1829 = _2013;
            if (!_2007)
            {
                _1835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2015 = _1835;
            _1837 = _2015;
            if (!_2007)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2017 = _1901;
            _1903 = _2017;
            if (!_2007)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2019 = _1933;
            bool _2021 = !_2007;
            _1935 = _2019;
            if (!_2021)
            {
                bool _2023 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2025 = isnan(_838);
                bool _2027 = _2023 || _2025;
                bool _2029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2031 = _2027 || _2029;
                if (!_2031)
                {
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2035 = _838 + _2033;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2037;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2045 = 1.0 / _2039;
                    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2053 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2063 = _2035 * _2045;
                    float _2065 = precise::clamp(_2063, 0.0, 1.0);
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2071 = fma(_2065, _2043, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2073 = fma(_2065, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2065, _2049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2077 = fma(_2065, _2053, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2079 = fma(_2065, _2057, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2081 = fma(_2065, _2061, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1911 = _2071;
                    _1903 = _2079;
                    _1891 = _2075;
                    _1837 = _2077;
                    _1829 = _2073;
                    _1935 = _2081;
                    _1997 = true;
                }
                else
                {
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1997 = false;
    float _2083 = _1911;
    float _2085 = _1903;
    float _2087 = _1891;
    float _2089 = _1837;
    float _2091 = _1829;
    float _2093 = _1935;
    float _2095 = fma(_742, -0.5, 0.5);
    float _2097 = precise::clamp(_2095, 0.0, 1.0);
    float _2099 = -_2083;
    float _2101 = _2099 + _2085;
    float _2103 = _1929 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2105 = -_2087;
    float _2107 = _2105 + _2089;
    out.m_95.x = 0.0;
    float _2109 = fma(_2097, _2101, _2083);
    float _2111 = fma(_2097, _2107, _2087);
    out.m_51.x = _2103;
    float _2113 = -_2091;
    float _2115 = _2113 + _2093;
    float _2117 = _2109 * 0.586610972881317138671875;
    bool _2119 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2121 = fma(_2097, _2115, _2091);
    float _2123 = fma(_2111, 0.298911988735198974609375, _2117);
    bool _2125 = _1925 > 0.0;
    bool _2127 = isnan(_1925);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(0.0);
    bool _2133 = _2129 || _2131;
    float _2135 = fma(_2121, 0.114477999508380889892578125, _2123);
    float _2137 = -_2135;
    float _2139 = _2111 + _2137;
    float _2141 = -_2135;
    float _2143 = _2109 + _2141;
    float _2145 = -_2135;
    float _2147 = _2121 + _2145;
    float _2149 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2153 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    bool _2155 = !_2119;
    if (!_2155)
    {
        float _2157 = -_812;
        float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2161 = -_814;
        float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2165 = -_816;
        float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2169 = _2159 * _2159;
        float _2171 = fma(_2163, _2163, _2169);
        float _2173 = fma(_2167, _2167, _2171);
        float _2175 = sqrt(_2173);
        float _2177 = rsqrt(_2173);
        float _2179 = -_2175;
        float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        float _2187 = _2163 * _2177;
        float _2189 = _2159 * _2177;
        float _2191 = abs(_2185);
        float _2193 = log2(_2191);
        float _2195 = _2167 * _2177;
        float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2199 = _742 * _2189;
        float _2201 = -_2189;
        float _2203 = -_2197;
        float _2205 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2203);
        float _2207 = fma(_714, _2187, _2199);
        float _2209 = -_2195;
        float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2205);
        float _2213 = fma(_712, _2195, _2207);
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2219 = _2211 + _2217;
        float _2221 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2223 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        float _2227 = exp2(_2221);
        float _2229 = _2227 * _2225;
        float _2231 = _2215 * _2229;
        float _2233 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2235 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2237 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2233;
        out.m_95.y = _2235;
        out.m_95.z = _2237;
    }
    out.m_97.x = _2149;
    out.m_97.y = _2151;
    out.m_97.z = _2153;
    if (_2133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2239 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2239;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1997 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_44.w;
    float _113 = in.m_46.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _122;
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
        out.m_51.x = 0.0;
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
        float _2307 = as_type<float>(_138);
        out.gl_Position.z = _2307;
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
        out.m_51.x = 0.0;
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
        float _2362 = as_type<float>(_164);
        out.gl_Position.z = _2362;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    float _172 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_57.x;
    float _192 = in.m_57.y;
    float _194 = in.m_57.z;
    float _196 = _166 * _166;
    float _198 = _168 * _168;
    float _200 = fma(_174, _174, _196);
    float _202 = fma(_176, _176, _198);
    float _204 = fma(_190, _190, _200);
    float _206 = fma(_192, _192, _202);
    float _208 = _170 * _170;
    float _210 = sqrt(_204);
    float _212 = fma(_178, _178, _208);
    float _214 = fma(_194, _194, _212);
    float _216 = sqrt(_206);
    bool _218 = _210 > 0.0;
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    float _224 = in.m_46.x;
    float _226 = in.m_46.y;
    float _228 = in.m_46.z;
    float _230 = 0.0;
    float _232 = _206;
    float _234 = _204;
    float _236 = _172;
    if (_218)
    {
        float _238 = rsqrt(_204);
        _230 = _238;
    }
    float _240 = _230;
    bool _242 = _220 > 0.0;
    float _244 = _220;
    if (!_188)
    {
        float _246 = _172 * _172;
        float _248 = _246 * 0.5;
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    float _254 = _250;
    if (_222)
    {
        float _256 = rsqrt(_206);
        _252 = _256;
    }
    float _258 = _252;
    if (!_188)
    {
        float _260 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _260;
    }
    float _262 = _254;
    bool _264 = !_188;
    float _266 = _262;
    float _268 = _240;
    if (!_264)
    {
        float _270 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = log2(_270);
        float _274 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _276 = _274 + 1.0;
        float _278 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = _172 * _272;
        float _282 = 1.0 / _276;
        float _284 = _278 * 0.693147182464599609375;
        float _286 = exp2(_280);
        float _288 = 1.0 / _284;
        float _290 = _286 + (-1.0);
        float _292 = -_290;
        float _294 = fma(_292, _288, _172);
        float _296 = _294 * _282;
        float _298 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _286;
        _266 = _298;
        _234 = _288;
    }
    float _300 = _232;
    float _302 = _266;
    float _304 = _234;
    bool _306 = !_188;
    float _308 = _300;
    float _310 = _304;
    float _312 = _302;
    if (!_306)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _172 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _236 = _332;
        _308 = _324;
    }
    float _334 = _236;
    float _336 = _308;
    float _338 = in.m_59.w;
    float _340 = 0.0;
    float _342 = _336;
    if (!_218)
    {
        _340 = 0.0;
    }
    float _344 = _340;
    float _346 = 1.0 / _152;
    float _348 = 0.0;
    float _350 = _344;
    if (!_218)
    {
        _348 = 0.0;
    }
    float _352 = _348;
    float _354 = in.m_44.x;
    float _356 = in.m_44.y;
    float _358 = in.m_44.z;
    float _360 = _352;
    if (!_218)
    {
        _310 = 0.0;
    }
    float _362 = _310;
    float _364 = _362;
    if (_218)
    {
        float _366 = _240 * _174;
        _350 = _366;
    }
    float _368 = _350;
    if (_218)
    {
        float _370 = _240 * _166;
        _360 = _370;
    }
    float _372 = _360;
    if (_218)
    {
        float _374 = _240 * _190;
        _364 = _374;
    }
    float _376 = _364;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _380 = _214;
    if (_242)
    {
        float _382 = rsqrt(_214);
        _380 = _382;
    }
    float _384 = _380;
    float _386 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _388 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _390 = 0.0;
    if (!_222)
    {
        _390 = 0.0;
    }
    float _392 = _390;
    float _394 = _392;
    if (_222)
    {
        float _396 = _258 * _176;
        _394 = _396;
    }
    float _398 = _394;
    float _400 = fma(_334, _224, _386);
    float _402 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _404 = fma(_334, _226, _388);
    float _406 = 0.0;
    if (!_222)
    {
        _406 = 0.0;
    }
    float _408 = _406;
    float _410 = _408;
    if (_222)
    {
        float _412 = _258 * _168;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = fma(_334, _228, _402);
    if (!_222)
    {
        _342 = 0.0;
    }
    float _418 = _342;
    float _420 = _418;
    if (_222)
    {
        float _422 = _258 * _192;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = 0.0;
    if (!_242)
    {
        _426 = 0.0;
    }
    float _428 = _426;
    float _430 = _122 * _346;
    float _432 = _428;
    float _434 = _430;
    if (!_242)
    {
        _268 = 0.0;
    }
    float _436 = _268;
    float _438 = _436;
    if (_242)
    {
        float _440 = _384 * _178;
        _432 = _440;
    }
    float _442 = _432;
    if (!_242)
    {
        _312 = 0.0;
    }
    float _444 = _312;
    float _446 = _444;
    if (_242)
    {
        float _448 = _384 * _170;
        _438 = _448;
    }
    float _450 = _438;
    if (_242)
    {
        float _452 = _384 * _194;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = fma(_400, _338, _354);
    float _458 = fma(_404, _338, _356);
    float _460 = fma(_416, _338, _358);
    bool _462 = !_378;
    if (!_462)
    {
        float _464 = in.m_61.x;
        float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _472 = _470 * _466;
        float _474 = floor(_472);
        float _476 = -_474;
        float _478 = _472 + _476;
        _434 = _478;
    }
    float _480 = _434;
    float _482 = in.m_59.x;
    float _484 = in.m_59.y;
    float _486 = in.m_59.z;
    float _488 = _458 * _192;
    float _490 = _458 * _168;
    float _492 = in.m_63.x;
    float _494 = in.m_63.y;
    float _496 = in.m_63.z;
    float _498 = fma(_456, _190, _488);
    float _500 = _458 * _176;
    float _502 = fma(_456, _166, _490);
    float _504 = in.m_53.w;
    float _506 = fma(_460, _194, _498);
    float _508 = fma(_456, _174, _500);
    float _510 = fma(_460, _170, _502);
    float _512 = in.m_55.w;
    float _514 = fma(_460, _178, _508);
    float _516 = in.m_57.w;
    float _518 = in.m_65.x;
    float _520 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _522 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _494);
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _492);
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _496);
    float _536 = _528 * _526;
    float _538 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _540 = _532 * _530;
    float _542 = _510 + _504;
    float _544 = _536 * _414;
    float _546 = _536 * _398;
    float _548 = _538 * _534;
    float _550 = _536 * _424;
    float _552 = fma(_540, _372, _544);
    float _554 = fma(_540, _368, _546);
    float _556 = _514 + _512;
    float _558 = fma(_540, _376, _550);
    float _560 = fma(_548, _450, _552);
    float _562 = fma(_548, _442, _554);
    float _564 = _506 + _516;
    float _566 = fma(_548, _454, _558);
    float _568 = _542 + _560;
    float _570 = _556 + _562;
    float _572 = in.m_67.x;
    float _574 = in.m_67.y;
    float _576 = in.m_67.z;
    float _578 = _564 + _566;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _568 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _570 + _584;
    bool _588 = _494 != 0.0;
    bool _590 = isnan(_494);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _582 * _582;
    bool _600 = _492 == 0.0;
    bool _602 = !_596;
    bool _604 = _600 && _602;
    float _606 = fma(_586, _586, _598);
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _610 = _578 + _608;
    float _612 = _122 * 0.00999999977648258209228515625;
    bool _614 = _496 == 0.0;
    bool _616 = _614 && _604;
    float _618 = fma(_610, _610, _606);
    float _620 = fma(_518, 25.1327419281005859375, _612);
    float _622 = _620 * 0.15915493667125701904296875;
    float _624 = sqrt(_618);
    float _626 = 0.0;
    float _628 = _620;
    float _630 = _610;
    float _632 = _572;
    float _634 = _548;
    float _636 = _480;
    float _638 = _542;
    if (_616)
    {
        _626 = _574;
    }
    float _640 = _626;
    float _642 = 0.0;
    float _644 = _640;
    if (_616)
    {
        _642 = _572;
    }
    float _646 = _642;
    float _648 = _622 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = _646;
    if (_616)
    {
        _628 = _640;
    }
    float _654 = _628;
    float _656 = _654;
    if (!_616)
    {
        _644 = _574;
    }
    float _658 = _644;
    float _660 = 0.0;
    if (_616)
    {
        _660 = _576;
    }
    float _662 = _660;
    float _664 = _662;
    if (_616)
    {
        _630 = _646;
    }
    float _666 = _630;
    float _668 = _666;
    if (!_616)
    {
        float _670 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _656 = _670;
    }
    float _672 = _656;
    float _674 = precise::max(0.0, _624);
    if (!_616)
    {
        _652 = _572;
    }
    float _676 = _652;
    float _678 = precise::min(_674, 40.0);
    if (_616)
    {
        _632 = _662;
    }
    float _680 = _632;
    float _682 = fma(_650, 0.5, 0.5);
    float _684 = _680;
    if (!_616)
    {
        _664 = _576;
    }
    float _686 = _664;
    float _688 = _678 * 0.02500000037252902984619140625;
    if (!_616)
    {
        float _690 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _676);
        _668 = _690;
    }
    float _692 = _668;
    float _694 = _424 * _672;
    float _696 = _398 * _672;
    float _698 = _682 * _688;
    if (!_616)
    {
        float _700 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _686);
        _684 = _700;
    }
    float _702 = _684;
    float _704 = fma(_376, _692, _694);
    float _706 = fma(_368, _692, _696);
    float _708 = _698 * _698;
    float _710 = _414 * _672;
    float _712 = fma(_454, _702, _704);
    float _714 = fma(_442, _702, _706);
    float _716 = _708 * 3.0;
    float _718 = precise::max(_624, 60.0);
    float _720 = fma(_372, _692, _710);
    float _722 = fma(_712, _716, _578);
    float _724 = fma(_714, _716, _570);
    float _726 = precise::min(_718, 120.0);
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _730 = _722 + _728;
    float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _734 = _724 + _732;
    float _736 = fma(_726, -0.066666670143604278564453125, 4.0);
    float _738 = _730 * _730;
    float _740 = fma(_734, _734, _738);
    float _742 = fma(_450, _702, _720);
    float _744 = sqrt(_740);
    float _746 = fma(_742, _716, _568);
    float _748 = _746 + _736;
    bool _750 = _744 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _702;
    float _754 = _720;
    float _756 = _724;
    float _758 = _748;
    float _760 = _734;
    if (!_750)
    {
        _752 = _724;
    }
    float _762 = _752;
    float _764 = _762;
    if (!_750)
    {
        _754 = _722;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_750)
    {
        _756 = _748;
    }
    float _770 = _756;
    bool _772 = !_750;
    float _774 = _770;
    if (!_772)
    {
        float _776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _780 = _744 + _778;
        float _782 = _748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = rsqrt(_740);
        float _786 = _780 * _776;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _788 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 + (-1.0);
        float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = fma(_796, _782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _804 = fma(_748, _792, _800);
        float _806 = _784 * _802;
        float _808 = fma(_734, _806, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _810 = fma(_730, _806, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _774 = _804;
        _764 = _808;
        _768 = _810;
    }
    float _812 = _774;
    float _814 = _764;
    float _816 = _768;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _812 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _824 = _814 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _816 + _826;
    float _830 = _820 * _820;
    float _832 = fma(_824, _824, _830);
    float _834 = fma(_828, _828, _832);
    float _836 = rsqrt(_834);
    float _838 = sqrt(_834);
    float _840 = _836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _842 = _824 * _840;
    float _844 = _828 * _840;
    float _846 = _842 * _842;
    float _848 = _844 * _844;
    float _850 = _846 + _848;
    float _852 = sqrt(_850);
    bool _854 = _852 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = _852 + _856;
    float _860 = _828;
    float _862 = _850;
    float _864 = _858;
    float _866 = _820;
    if (_854)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _860 = _868;
    }
    float _870 = _860;
    if (_854)
    {
        float _872 = rsqrt(_850);
        _862 = _872;
    }
    float _874 = _862;
    float _876 = _874;
    if (_854)
    {
        float _878 = _858 * _870;
        _864 = _878;
    }
    float _880 = _864;
    if (_854)
    {
        float _882 = _880 * 0.15915493667125701904296875;
        _758 = _882;
    }
    float _884 = _758;
    float _886 = _870;
    if (_854)
    {
        float _888 = _884 * 6.283185482025146484375;
        float _890 = sin(_888);
        _886 = _890;
    }
    float _892 = _886;
    float _894 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _896 = precise::max(0.0, _894);
    float _898 = _836;
    float _900 = _896;
    if (_854)
    {
        float _902 = _884 * 6.283185482025146484375;
        float _904 = cos(_902);
        _898 = _904;
    }
    float _906 = _898;
    float _908 = -_840;
    float _910 = -_896;
    float _912 = fma(_820, _908, _910);
    if (_854)
    {
        float _914 = _912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _900 = _914;
    }
    float _916 = _900;
    float _918 = _812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _920 = _892;
    float _922 = _916;
    if (_854)
    {
        float _924 = fma(_892, _916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _866 = _924;
    }
    float _926 = _866;
    float _928 = _926;
    if (!_854)
    {
        _920 = _842;
    }
    float _930 = _920;
    float _932 = _930;
    float _934 = _906;
    if (_854)
    {
        float _936 = _906 + (-1.0);
        _922 = _936;
    }
    float _938 = _922;
    float _940 = _938;
    if (_854)
    {
        float _942 = _874 * _926;
        _634 = _942;
    }
    float _944 = _634;
    if (!_854)
    {
        _928 = _912;
    }
    float _946 = _928;
    float _948 = _946;
    if (_854)
    {
        float _950 = _938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _760 = _950;
    }
    float _952 = _760;
    if (_854)
    {
        float _954 = _842 * _944;
        _932 = _954;
    }
    float _956 = _932;
    if (!_854)
    {
        _940 = _844;
    }
    float _958 = _940;
    float _960 = _958;
    if (_854)
    {
        float _962 = _844 * _944;
        _960 = _962;
    }
    float _964 = _960;
    if (!_854)
    {
        _876 = _846;
    }
    float _966 = _876;
    float _968 = _966;
    if (_854)
    {
        float _970 = fma(_912, _906, _952);
        _948 = _970;
    }
    float _972 = _948;
    if (_854)
    {
        float _974 = _956 * _956;
        _968 = _974;
    }
    float _976 = _968;
    if (!_854)
    {
        _934 = _848;
    }
    float _978 = _934;
    float _980 = _978;
    if (_854)
    {
        float _982 = _964 * _964;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = fma(_972, _972, _976);
    float _988 = _986 + _984;
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _918);
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _994 = fma(_838, (*spvDescriptorSet0.vp_c15)._m0[23].w, _992);
    float _996 = precise::clamp(_994, 0.0, 1.0);
    float _998 = _812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1000 = rsqrt(_988);
    float _1002 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _990);
    float _1004 = -_996;
    float _1006 = _1004 + 1.0;
    float _1008 = _812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1010 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _998);
    float _1012 = _812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1016 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1008);
    float _1018 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1010);
    float _1020 = abs(_1006);
    float _1022 = log2(_1020);
    float _1024 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1026 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1016);
    float _1028 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1030 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1036 = _1000 * _956;
    float _1038 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1040 = _1000 * _972;
    float _1042 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1024);
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1038);
    float _1048 = _1000 * _964;
    float _1050 = -_1032;
    float _1052 = fma(_1050, _1030, 1.0);
    float _1054 = -_1044;
    float _1056 = fma(_1040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1054);
    float _1058 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1046);
    float _1062 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1064 = -_1048;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1056);
    float _1068 = log2(_1052);
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1060);
    float _1072 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1074 = fma(_1066, -0.5, 0.5);
    float _1076 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = fma(_1066, 0.5, 0.5);
    float _1080 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1072);
    float _1082 = _1040 + 1.0;
    float _1084 = exp2(_1062);
    float _1086 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1088 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1080);
    float _1090 = fma(_1078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1092 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1086);
    float _1094 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1088);
    float _1096 = fma(_1078, _1090, -0.212114393711090087890625);
    float _1098 = 1.0 / _1070;
    float _1100 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1102 = _1068 * 0.693147182464599609375;
    float _1104 = fma(_1078, _1096, 1.570728778839111328125);
    float _1106 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1108 = sqrt(_1074);
    float _1110 = -_1040;
    float _1112 = fma(_1084, _1082, _1110);
    float _1114 = fma(_1112, 0.5, 0.5);
    float _1116 = _1094 * _1098;
    float _1118 = _1100 * _1098;
    float _1120 = fma(_1116, 0.5, 0.5);
    float _1122 = fma(_1118, -0.5, 0.5);
    float _1124 = _1108 * 0.636619746685028076171875;
    float3 _3849 = float3(_1120, _1122, _1106);
    float _1126 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3849, float3(0.0), isnan(_3849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3849, float3(0.0), isnan(_3849)), level(0.0)).x;
    float _1128 = -_1104;
    float _1130 = fma(_1124, _1128, 1.0);
    float3 _3865 = float3(_1120, _1122, _1106);
    float4 _1133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3865, float3(0.0), isnan(_3865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3865, float3(0.0), isnan(_3865)), level(0.0)).xyzw;
    float _1135 = _1133.x;
    float _1137 = _1133.y;
    float _1139 = _1133.z;
    float _1141 = _1133.w;
    float2 _3882 = float2(_1130, _1114);
    float3 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3882, float2(0.0), isnan(_3882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3882, float2(0.0), isnan(_3882)), level(0.0)).xyz;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float _1153 = in.m_69.y;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = in.m_61.z;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1161 = _1159 != 0;
    float _1163 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1167 = _1165 != 0;
    float _1169 = in.m_61.y;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1173 = _1171 != 0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1179 = in.m_61.w;
    float _1181 = exp2(_1163);
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1185 = _1183 != 0;
    out.m_71.x = _518;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1189 = _1187 != 0;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1193 = _1191 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1195 = in.m_65.w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1201 = -_1153;
    float _1203 = _1201 + 1.0;
    float _1205 = in.m_61.x;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = 1.0 / _1177;
    bool _1211 = _1157 > 0.5;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1219 = _1211 ? as_type<int>(_1203) : as_type<int>(_1153);
    float _1221 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1223 = _1169 > 0.5;
    float _1225 = 1.0 / _1193;
    float _1227 = _1167 ? as_type<float>(_1219) : _1153;
    float _1229 = fma(_1217, -2.0, _1213);
    int _1231 = _1223 ? as_type<int>(_1203) : as_type<int>(_1153);
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1233;
    bool _1237 = _1179 > 0.5;
    float _1239 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1229);
    float _1241 = 1.0 / _1199;
    float _1243 = _1173 ? as_type<float>(_1231) : _1153;
    out.m_71.w = _1195;
    float _1245 = _1153;
    bool _1247 = _1161;
    float _1249 = _1157;
    float _1251 = _1169;
    float _1253 = _1094;
    float _1255 = _1070;
    float _1257 = _1100;
    if (_1161)
    {
        float _1259 = _1237 ? _1203 : _1153;
        _1245 = _1259;
    }
    float _1261 = _1245;
    float _1263 = -_1181;
    float _1265 = _1263 + 1.0;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1269 = _1267 != 0;
    float _1271 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1273 = in.m_73.x;
    float _1275 = in.m_73.y;
    float _1277 = in.m_73.z;
    float _1279 = in.m_73.w;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1283 = _1281 != 0;
    float _1285 = _1235 * _1225;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1299 = _480 + _1297;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1185)
    {
        bool _1303 = _1205 > 0.5;
        _1247 = _1303;
    }
    bool _1305 = _1247;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1311 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1301;
    out.m_75.y = _1215;
    out.m_75.z = _1307;
    float _1313 = -_1309;
    float _1315 = fma(_1271, 2.0, _1313);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1319 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1321 = in.m_69.x;
    float _1323 = _398 * _1275;
    float _1325 = _414 * _1275;
    float _1327 = _424 * _1275;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1331 = fma(_368, _1273, _1323);
    float _1333 = fma(_372, _1273, _1325);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1335;
    float _1339 = fma(_376, _1273, _1327);
    float _1341 = fma(_442, _1277, _1331);
    float _1343 = fma(_450, _1277, _1333);
    float _1345 = _1289 * _1209;
    float _1347 = fma(_454, _1277, _1339);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1351 = _480 + _1349;
    float _1353 = _1337 * _1241;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1357 = _480 + _1355;
    out.m_77.x = _1341;
    out.m_77.y = _1343;
    out.m_77.z = _1347;
    float _1359 = fma(_1285, _1351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1361 = fma(_1353, _1299, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1363 = fma(_1221, _1243, -0.5);
    bool _1365 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1367 = isnan(_480);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1379 = fma(_1345, _1357, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1381 = _1345;
    float _1383 = _1357;
    if (!_1269)
    {
        _1381 = _1169;
    }
    float _1385 = _1381;
    float _1387 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1329);
    float _1389 = _1385;
    if (_1269)
    {
        _1389 = _1205;
    }
    float _1391 = _1389;
    float _1393 = -_122;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1315);
    float _1397 = _1321;
    if (!_1185)
    {
        _1383 = _1321;
    }
    float _1399 = _1383;
    out.m_79.x = _714;
    out.m_79.y = _742;
    out.m_79.z = _712;
    bool _1401 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1403 = isnan(_480);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    out.m_81.x = _814;
    out.m_81.y = _812;
    out.m_81.z = _816;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1415 = -_1411;
    float _1417 = _1415 + 1.0;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1421 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1413);
    float _1423 = fma(_1227, _1319, -0.5);
    float _1425 = _1375 * _1417;
    float _1427 = -_1375;
    float _1429 = _1427 + 1.0;
    bool _1431 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1433 = isnan(_480);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1421);
    bool _1445 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1447 = isnan(_480);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1459 = as_type<int>(_1419);
    int _1461 = as_type<int>(_1457);
    float _1463 = _1399;
    if (_1269)
    {
        _636 = _1205;
    }
    float _1465 = _636;
    float _1467 = _1441 * _1429;
    float _1469 = _1465;
    if (!_1269)
    {
        _1469 = _1157;
    }
    float _1471 = _1469;
    float _1473 = -_1441;
    float _1475 = _1473 + 1.0;
    float _1477 = fma(_1419, _1261, -0.5);
    if (_1185)
    {
        float _1479 = -_1321;
        float _1481 = _1479 + 1.0;
        _1459 = as_type<int>(_1481);
    }
    int _1483 = _1459;
    float _1485 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1487 = -_1239;
    float _1489 = fma(_1443, _1363, _1487);
    float _1491 = _1455 * _1475;
    float _1493 = -_1455;
    float _1495 = _1493 + 1.0;
    float _1497 = -_1457;
    float _1499 = fma(_1485, 2.0, _1497);
    float _1501 = as_type<float>(_1483);
    if (_1189)
    {
        float _1503 = -_1321;
        float _1505 = _1503 + 1.0;
        _1461 = as_type<int>(_1505);
    }
    int _1507 = _1461;
    float _1509 = _1359 * _1491;
    float _1511 = _542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1513 = _542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1517 = _1507;
    if (!_1189)
    {
        _638 = _1321;
    }
    float _1519 = _638;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1523 = _1519;
    if (_1185)
    {
        float _1525 = _1305 ? as_type<float>(_1483) : _1321;
        _1463 = _1525;
    }
    float _1527 = _1463;
    float _1529 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1515);
    float _1531 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1189)
    {
        float _1533 = _1211 ? as_type<float>(_1507) : _1321;
        _1523 = _1533;
    }
    float _1535 = _1523;
    if (_1283)
    {
        float _1537 = -_1321;
        float _1539 = _1537 + 1.0;
        _1517 = as_type<int>(_1539);
    }
    int _1541 = _1517;
    float _1543 = as_type<float>(_1541);
    if (!_1269)
    {
        _1501 = _1157;
    }
    float _1545 = _1501;
    float _1547 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1511);
    float _1549 = _1545;
    if (_1269)
    {
        _1549 = _1169;
    }
    float _1551 = _1549;
    float _1553 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1513);
    float _1555 = -_1521;
    float _1557 = fma(_1531, 2.0, _1555);
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1509);
    if (_1283)
    {
        float _1563 = _1223 ? as_type<float>(_1541) : _1321;
        _1397 = _1563;
    }
    float _1565 = _1397;
    float _1567 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1317);
    if (_1269)
    {
        _1543 = _1157;
    }
    float _1569 = _1543;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1575 = _1569;
    if (!_1269)
    {
        _1575 = _1169;
    }
    float _1577 = _1575;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1269)
    {
        _1249 = _1169;
    }
    float _1581 = _1249;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1585 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1553);
    float _1587 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1571);
    float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1591 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1579);
    float _1593 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1583);
    if (!_1269)
    {
        _1251 = _1205;
    }
    float _1595 = _1251;
    float _1597 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1547);
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1601 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1603 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1605 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1607 = -_122;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1557);
    float _1611 = fma(_1601, -2.0, _1599);
    float _1613 = fma(_1603, _1527, -0.5);
    float _1615 = fma(_1605, _1535, -0.5);
    float _1617 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1387);
    float _1619 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1529);
    float _1621 = fma(_1379, _1467, _1561);
    float _1623 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1625 = _1277 * _676;
    float _1627 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1587);
    float _1629 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1631 = fma(_1623, _1565, -0.5);
    float _1633 = fma(_1617, _1613, _1395);
    float _1635 = -_1625;
    float _1637 = fma(_1273, _686, _1635);
    float _1639 = fma(_1619, _1615, _1609);
    float _1641 = _1275 * _686;
    float _1643 = fma(_1361, _1425, _1621);
    float _1645 = _1273 * _658;
    float _1647 = _1627 * (-0.15915493667125701904296875);
    float _1649 = 1.0 / _1629;
    float _1651 = -_1641;
    float _1653 = fma(_1277, _658, _1651);
    float _1655 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1657 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1659 = isnan(0.5);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1665 = _1661 || _1663;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1669 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1671 = _1655 + _1629;
    float _1673 = -_1645;
    float _1675 = fma(_1275, _676, _1673);
    float _1677 = _1647 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1637 * _1279;
    float _1683 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1567);
    float _1685 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1611);
    float _1687 = fma(_1669, -2.0, _1667);
    float _1689 = _1653 * _1279;
    float _1691 = _1681 * _414;
    float _1693 = -_1685;
    float _1695 = fma(_1683, _1477, _1693);
    float _1697 = _1647 * 6.283185482025146484375;
    float _1699 = cos(_1697);
    float _1701 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1593);
    float _1703 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1591);
    float _1705 = -_122;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1499);
    float _1709 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1687);
    float _1711 = _1637;
    float _1713 = _1633;
    if (!_1665)
    {
        _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1715 = _1711;
    float _1717 = _1639 + 0.5;
    float _1719 = fma(_1689, _372, _1691);
    float _1721 = _1671 * _1649;
    float _1723 = _1721 * 0.5;
    float _1725 = _1681 * _398;
    float _1727 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1729 = _1489 + 0.5;
    float _1731 = _1681 * _424;
    float _1733 = _1675 * _1279;
    float _1735 = _1633 + 0.5;
    float _1737 = _1679 * _1423;
    float _1739 = _1695 + 0.5;
    float _1741 = _1699 * _1423;
    if (!_1665)
    {
        float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1745 = fma(_1723, _1715, _1743);
        _1713 = _1745;
    }
    float _1747 = _1713;
    float _1749 = fma(_1689, _368, _1725);
    float _1751 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1727);
    float _1753 = -_1737;
    float _1755 = fma(_1699, _1631, _1753);
    float _1757 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1751);
    float _1759 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1643);
    out.m_83.x = _1735;
    out.m_83.y = _1729;
    out.m_83.z = _1717;
    out.m_83.w = _1739;
    float _1761 = fma(_1689, _376, _1731);
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1765 = _1747;
    if (!_1665)
    {
        float _1767 = 1.0 / _1747;
        _1765 = _1767;
    }
    float _1769 = _1765;
    float _1771 = fma(_1701, _1755, _1707);
    float _1773 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1757);
    float _1775 = fma(_1733, _442, _1749);
    float _1777 = fma(_1679, _1631, _1741);
    bool _1779 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1781 = isnan(_838);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1787 = _1783 || _1785;
    out.gl_Position.x = _1094;
    out.gl_Position.y = _1100;
    out.gl_Position.z = _1773;
    out.gl_Position.w = _1070;
    float _1789 = -_1709;
    float _1791 = fma(_1703, _1777, _1789);
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1797 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1799 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1803 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = fma(_1733, _450, _1719);
    float _1807 = fma(_1733, _454, _1761);
    float _1809 = _1773 + _1070;
    float _1811 = _1094 + _1070;
    out.m_85.x = _1799;
    out.m_85.y = _1801;
    out.m_85.z = _1803;
    out.m_85.w = _1797;
    float _1813 = _1771 + 0.5;
    float _1815 = _1791 + 0.5;
    float _1817 = _1070 * 0.5;
    out.m_87.x = _1775;
    out.m_87.y = _1805;
    out.m_87.z = _1807;
    float _1819 = _1773;
    float _1821 = _1809;
    float _1823 = _1811;
    if (!_1787)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1819;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1787)
    {
        _1253 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1831 = _1253;
    out.m_89.x = _1813;
    out.m_89.y = _1815;
    float _1833 = _1809 * 0.5;
    float _1835 = _1831;
    float _1837 = _1831;
    if (!_1665)
    {
        _1821 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1839 = _1821;
    float _1841 = _1811 * 0.5;
    float _1843 = -_1311;
    float _1845 = _1843 + 1.0;
    float _1847 = fma(_1100, -0.5, _1817);
    float _1849 = _1839;
    float _1851 = _1841;
    if (!_1665)
    {
        float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1855 = -_1839;
        float _1857 = fma(_1769, _1853, _1855);
        _1823 = _1857;
    }
    float _1859 = _1823;
    float _1861 = _1859;
    if (!_1665)
    {
        float _1863 = -_1839;
        float _1865 = _1863 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1849 = _1865;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1665)
    {
        _1255 = 1.0;
    }
    float _1871 = _1255;
    out.m_91.x = _1841;
    out.m_91.y = _1847;
    out.m_91.z = _1833;
    out.m_91.w = _1070;
    float _1873 = _1807;
    float _1875 = _1871;
    if (!_1665)
    {
        float _1877 = 1.0 / _1867;
        _1873 = _1877;
    }
    float _1879 = _1873;
    if (!_1787)
    {
        _1257 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1881 = _1257;
    float _1883 = _1311 * _1126;
    float _1885 = _1141 * _1883;
    float _1887 = _1141 * _1845;
    float _1889 = _1881;
    float _1891 = _1881;
    if (!_1787)
    {
        _1869 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1893 = _1869;
    float _1895 = _1151 * _1883;
    float _1897 = fma(_1147, _1885, _1135);
    float _1899 = fma(_1149, _1885, _1137);
    float _1901 = _1893;
    float _1903 = _1893;
    if (!_1787)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1905 = _1851;
    float _1907 = fma(_1141, _1895, _1139);
    float _1909 = _1905;
    float _1911 = _1905;
    if (!_1665)
    {
        float _1913 = _1859 * _1879;
        float _1915 = precise::clamp(_1913, 0.0, 1.0);
        _1861 = _1915;
    }
    float _1917 = _1861;
    out.m_93.x = _1897;
    out.m_93.y = _1899;
    out.m_93.z = _1907;
    out.m_93.w = _1887;
    float _1919 = _1917;
    if (!_1665)
    {
        float _1921 = -_1917;
        float _1923 = _1921 + 1.0;
        _1875 = _1923;
    }
    float _1925 = _1875;
    if (!_1787)
    {
        _1919 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1927 = _1919;
    float _1929 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1931 = !_1787;
    float _1933 = _1927;
    float _1935 = _1927;
    if (!_1931)
    {
        bool _1937 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1939 = isnan(_838);
        bool _1941 = _1937 || _1939;
        bool _1943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1945 = _1941 || _1943;
        if (!_1945)
        {
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1949 = _838 + _1947;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1953 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1951;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1959 = 1.0 / _1953;
            float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1967 = _1965 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1977 = _1949 * _1959;
            float _1979 = precise::clamp(_1977, 0.0, 1.0);
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1985 = fma(_1979, _1957, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1987 = fma(_1979, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1979, _1963, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1991 = fma(_1979, _1967, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1993 = fma(_1979, _1971, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1995 = fma(_1979, _1975, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1911 = _1985;
            _1903 = _1993;
            _1891 = _1989;
            _1837 = _1991;
            _1829 = _1987;
            _1935 = _1995;
            _1997 = true;
        }
        else
        {
            bool _1999 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2001 = isnan(_838);
            bool _2003 = _1999 || _2001;
            bool _2005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2007 = _2003 || _2005;
            if (!_2007)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2009 = _1889;
            _1891 = _2009;
            if (!_2007)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2011 = _1909;
            _1911 = _2011;
            if (!_2007)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2013 = _1827;
            _1829 = _2013;
            if (!_2007)
            {
                _1835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2015 = _1835;
            _1837 = _2015;
            if (!_2007)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2017 = _1901;
            _1903 = _2017;
            if (!_2007)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2019 = _1933;
            bool _2021 = !_2007;
            _1935 = _2019;
            if (!_2021)
            {
                bool _2023 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2025 = isnan(_838);
                bool _2027 = _2023 || _2025;
                bool _2029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2031 = _2027 || _2029;
                if (!_2031)
                {
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2035 = _838 + _2033;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2037;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2045 = 1.0 / _2039;
                    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2053 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2063 = _2035 * _2045;
                    float _2065 = precise::clamp(_2063, 0.0, 1.0);
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2071 = fma(_2065, _2043, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2073 = fma(_2065, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2065, _2049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2077 = fma(_2065, _2053, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2079 = fma(_2065, _2057, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2081 = fma(_2065, _2061, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1911 = _2071;
                    _1903 = _2079;
                    _1891 = _2075;
                    _1837 = _2077;
                    _1829 = _2073;
                    _1935 = _2081;
                    _1997 = true;
                }
                else
                {
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1997 = false;
    float _2083 = _1911;
    float _2085 = _1903;
    float _2087 = _1891;
    float _2089 = _1837;
    float _2091 = _1829;
    float _2093 = _1935;
    float _2095 = fma(_742, -0.5, 0.5);
    float _2097 = precise::clamp(_2095, 0.0, 1.0);
    float _2099 = -_2083;
    float _2101 = _2099 + _2085;
    float _2103 = _1929 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2105 = -_2087;
    float _2107 = _2105 + _2089;
    out.m_95.x = 0.0;
    float _2109 = fma(_2097, _2101, _2083);
    float _2111 = fma(_2097, _2107, _2087);
    out.m_51.x = _2103;
    float _2113 = -_2091;
    float _2115 = _2113 + _2093;
    float _2117 = _2109 * 0.586610972881317138671875;
    bool _2119 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2121 = fma(_2097, _2115, _2091);
    float _2123 = fma(_2111, 0.298911988735198974609375, _2117);
    bool _2125 = _1925 > 0.0;
    bool _2127 = isnan(_1925);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(0.0);
    bool _2133 = _2129 || _2131;
    float _2135 = fma(_2121, 0.114477999508380889892578125, _2123);
    float _2137 = -_2135;
    float _2139 = _2111 + _2137;
    float _2141 = -_2135;
    float _2143 = _2109 + _2141;
    float _2145 = -_2135;
    float _2147 = _2121 + _2145;
    float _2149 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2153 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    bool _2155 = !_2119;
    if (!_2155)
    {
        float _2157 = -_812;
        float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2161 = -_814;
        float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2165 = -_816;
        float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2169 = _2159 * _2159;
        float _2171 = fma(_2163, _2163, _2169);
        float _2173 = fma(_2167, _2167, _2171);
        float _2175 = sqrt(_2173);
        float _2177 = rsqrt(_2173);
        float _2179 = -_2175;
        float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        float _2187 = _2163 * _2177;
        float _2189 = _2159 * _2177;
        float _2191 = abs(_2185);
        float _2193 = log2(_2191);
        float _2195 = _2167 * _2177;
        float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2199 = _742 * _2189;
        float _2201 = -_2189;
        float _2203 = -_2197;
        float _2205 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2203);
        float _2207 = fma(_714, _2187, _2199);
        float _2209 = -_2195;
        float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2205);
        float _2213 = fma(_712, _2195, _2207);
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2219 = _2211 + _2217;
        float _2221 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2223 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        float _2227 = exp2(_2221);
        float _2229 = _2227 * _2225;
        float _2231 = _2215 * _2229;
        float _2233 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2235 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2237 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2233;
        out.m_95.y = _2235;
        out.m_95.z = _2237;
    }
    out.m_97.x = _2149;
    out.m_97.y = _2151;
    out.m_97.z = _2153;
    if (_2133)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2239 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2239;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1997 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_44.w;
    float _113 = in.m_46.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _122;
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
        out.m_51.x = 0.0;
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
        float _2307 = as_type<float>(_138);
        out.gl_Position.z = _2307;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        out.m_51.x = 0.0;
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
        float _2362 = as_type<float>(_164);
        out.gl_Position.z = _2362;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.x;
    float _168 = in.m_53.y;
    float _170 = in.m_53.z;
    float _172 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_57.x;
    float _192 = in.m_57.y;
    float _194 = in.m_57.z;
    float _196 = _166 * _166;
    float _198 = _168 * _168;
    float _200 = fma(_174, _174, _196);
    float _202 = fma(_176, _176, _198);
    float _204 = fma(_190, _190, _200);
    float _206 = fma(_192, _192, _202);
    float _208 = _170 * _170;
    float _210 = sqrt(_204);
    float _212 = fma(_178, _178, _208);
    float _214 = fma(_194, _194, _212);
    float _216 = sqrt(_206);
    bool _218 = _210 > 0.0;
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    float _224 = in.m_46.x;
    float _226 = in.m_46.y;
    float _228 = in.m_46.z;
    float _230 = 0.0;
    float _232 = _206;
    float _234 = _204;
    float _236 = _172;
    if (_218)
    {
        float _238 = rsqrt(_204);
        _230 = _238;
    }
    float _240 = _230;
    bool _242 = _220 > 0.0;
    float _244 = _220;
    if (!_188)
    {
        float _246 = _172 * _172;
        float _248 = _246 * 0.5;
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    float _254 = _250;
    if (_222)
    {
        float _256 = rsqrt(_206);
        _252 = _256;
    }
    float _258 = _252;
    if (!_188)
    {
        float _260 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _260;
    }
    float _262 = _254;
    bool _264 = !_188;
    float _266 = _262;
    float _268 = _240;
    if (!_264)
    {
        float _270 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = log2(_270);
        float _274 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _276 = _274 + 1.0;
        float _278 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = _172 * _272;
        float _282 = 1.0 / _276;
        float _284 = _278 * 0.693147182464599609375;
        float _286 = exp2(_280);
        float _288 = 1.0 / _284;
        float _290 = _286 + (-1.0);
        float _292 = -_290;
        float _294 = fma(_292, _288, _172);
        float _296 = _294 * _282;
        float _298 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _286;
        _266 = _298;
        _234 = _288;
    }
    float _300 = _232;
    float _302 = _266;
    float _304 = _234;
    bool _306 = !_188;
    float _308 = _300;
    float _310 = _304;
    float _312 = _302;
    if (!_306)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _172 * _316;
        float _326 = exp2(_324);
        float _328 = -_326;
        float _330 = _328 + 1.0;
        float _332 = _330 * _322;
        _236 = _332;
        _308 = _324;
    }
    float _334 = _236;
    float _336 = _308;
    float _338 = in.m_59.w;
    float _340 = 0.0;
    float _342 = _336;
    if (!_218)
    {
        _340 = 0.0;
    }
    float _344 = _340;
    float _346 = 1.0 / _152;
    float _348 = 0.0;
    float _350 = _344;
    if (!_218)
    {
        _348 = 0.0;
    }
    float _352 = _348;
    float _354 = in.m_44.x;
    float _356 = in.m_44.y;
    float _358 = in.m_44.z;
    float _360 = _352;
    if (!_218)
    {
        _310 = 0.0;
    }
    float _362 = _310;
    float _364 = _362;
    if (_218)
    {
        float _366 = _240 * _174;
        _350 = _366;
    }
    float _368 = _350;
    if (_218)
    {
        float _370 = _240 * _166;
        _360 = _370;
    }
    float _372 = _360;
    if (_218)
    {
        float _374 = _240 * _190;
        _364 = _374;
    }
    float _376 = _364;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _380 = _214;
    if (_242)
    {
        float _382 = rsqrt(_214);
        _380 = _382;
    }
    float _384 = _380;
    float _386 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _388 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _390 = 0.0;
    if (!_222)
    {
        _390 = 0.0;
    }
    float _392 = _390;
    float _394 = _392;
    if (_222)
    {
        float _396 = _258 * _176;
        _394 = _396;
    }
    float _398 = _394;
    float _400 = fma(_334, _224, _386);
    float _402 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _404 = fma(_334, _226, _388);
    float _406 = 0.0;
    if (!_222)
    {
        _406 = 0.0;
    }
    float _408 = _406;
    float _410 = _408;
    if (_222)
    {
        float _412 = _258 * _168;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = fma(_334, _228, _402);
    if (!_222)
    {
        _342 = 0.0;
    }
    float _418 = _342;
    float _420 = _418;
    if (_222)
    {
        float _422 = _258 * _192;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = 0.0;
    if (!_242)
    {
        _426 = 0.0;
    }
    float _428 = _426;
    float _430 = _122 * _346;
    float _432 = _428;
    float _434 = _430;
    if (!_242)
    {
        _268 = 0.0;
    }
    float _436 = _268;
    float _438 = _436;
    if (_242)
    {
        float _440 = _384 * _178;
        _432 = _440;
    }
    float _442 = _432;
    if (!_242)
    {
        _312 = 0.0;
    }
    float _444 = _312;
    float _446 = _444;
    if (_242)
    {
        float _448 = _384 * _170;
        _438 = _448;
    }
    float _450 = _438;
    if (_242)
    {
        float _452 = _384 * _194;
        _446 = _452;
    }
    float _454 = _446;
    float _456 = fma(_400, _338, _354);
    float _458 = fma(_404, _338, _356);
    float _460 = fma(_416, _338, _358);
    bool _462 = !_378;
    if (!_462)
    {
        float _464 = in.m_61.x;
        float _466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _472 = _470 * _466;
        float _474 = floor(_472);
        float _476 = -_474;
        float _478 = _472 + _476;
        _434 = _478;
    }
    float _480 = _434;
    float _482 = in.m_59.x;
    float _484 = in.m_59.y;
    float _486 = in.m_59.z;
    float _488 = _458 * _192;
    float _490 = _458 * _168;
    float _492 = in.m_63.x;
    float _494 = in.m_63.y;
    float _496 = in.m_63.z;
    float _498 = fma(_456, _190, _488);
    float _500 = _458 * _176;
    float _502 = fma(_456, _166, _490);
    float _504 = in.m_53.w;
    float _506 = fma(_460, _194, _498);
    float _508 = fma(_456, _174, _500);
    float _510 = fma(_460, _170, _502);
    float _512 = in.m_55.w;
    float _514 = fma(_460, _178, _508);
    float _516 = in.m_57.w;
    float _518 = in.m_65.x;
    float _520 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _522 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _494);
    float _528 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _530 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _492);
    float _532 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _496);
    float _536 = _528 * _526;
    float _538 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _540 = _532 * _530;
    float _542 = _510 + _504;
    float _544 = _536 * _414;
    float _546 = _536 * _398;
    float _548 = _538 * _534;
    float _550 = _536 * _424;
    float _552 = fma(_540, _372, _544);
    float _554 = fma(_540, _368, _546);
    float _556 = _514 + _512;
    float _558 = fma(_540, _376, _550);
    float _560 = fma(_548, _450, _552);
    float _562 = fma(_548, _442, _554);
    float _564 = _506 + _516;
    float _566 = fma(_548, _454, _558);
    float _568 = _542 + _560;
    float _570 = _556 + _562;
    float _572 = in.m_67.x;
    float _574 = in.m_67.y;
    float _576 = in.m_67.z;
    float _578 = _564 + _566;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _582 = _568 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _570 + _584;
    bool _588 = _494 != 0.0;
    bool _590 = isnan(_494);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _582 * _582;
    bool _600 = _492 == 0.0;
    bool _602 = !_596;
    bool _604 = _600 && _602;
    float _606 = fma(_586, _586, _598);
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _610 = _578 + _608;
    float _612 = _122 * 0.00999999977648258209228515625;
    bool _614 = _496 == 0.0;
    bool _616 = _614 && _604;
    float _618 = fma(_610, _610, _606);
    float _620 = fma(_518, 25.1327419281005859375, _612);
    float _622 = _620 * 0.15915493667125701904296875;
    float _624 = sqrt(_618);
    float _626 = 0.0;
    float _628 = _620;
    float _630 = _610;
    float _632 = _572;
    float _634 = _548;
    float _636 = _480;
    float _638 = _542;
    if (_616)
    {
        _626 = _574;
    }
    float _640 = _626;
    float _642 = 0.0;
    float _644 = _640;
    if (_616)
    {
        _642 = _572;
    }
    float _646 = _642;
    float _648 = _622 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = _646;
    if (_616)
    {
        _628 = _640;
    }
    float _654 = _628;
    float _656 = _654;
    if (!_616)
    {
        _644 = _574;
    }
    float _658 = _644;
    float _660 = 0.0;
    if (_616)
    {
        _660 = _576;
    }
    float _662 = _660;
    float _664 = _662;
    if (_616)
    {
        _630 = _646;
    }
    float _666 = _630;
    float _668 = _666;
    if (!_616)
    {
        float _670 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _656 = _670;
    }
    float _672 = _656;
    float _674 = precise::max(0.0, _624);
    if (!_616)
    {
        _652 = _572;
    }
    float _676 = _652;
    float _678 = precise::min(_674, 40.0);
    if (_616)
    {
        _632 = _662;
    }
    float _680 = _632;
    float _682 = fma(_650, 0.5, 0.5);
    float _684 = _680;
    if (!_616)
    {
        _664 = _576;
    }
    float _686 = _664;
    float _688 = _678 * 0.02500000037252902984619140625;
    if (!_616)
    {
        float _690 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _676);
        _668 = _690;
    }
    float _692 = _668;
    float _694 = _424 * _672;
    float _696 = _398 * _672;
    float _698 = _682 * _688;
    if (!_616)
    {
        float _700 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _686);
        _684 = _700;
    }
    float _702 = _684;
    float _704 = fma(_376, _692, _694);
    float _706 = fma(_368, _692, _696);
    float _708 = _698 * _698;
    float _710 = _414 * _672;
    float _712 = fma(_454, _702, _704);
    float _714 = fma(_442, _702, _706);
    float _716 = _708 * 3.0;
    float _718 = precise::max(_624, 60.0);
    float _720 = fma(_372, _692, _710);
    float _722 = fma(_712, _716, _578);
    float _724 = fma(_714, _716, _570);
    float _726 = precise::min(_718, 120.0);
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _730 = _722 + _728;
    float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _734 = _724 + _732;
    float _736 = fma(_726, -0.066666670143604278564453125, 4.0);
    float _738 = _730 * _730;
    float _740 = fma(_734, _734, _738);
    float _742 = fma(_450, _702, _720);
    float _744 = sqrt(_740);
    float _746 = fma(_742, _716, _568);
    float _748 = _746 + _736;
    bool _750 = _744 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _702;
    float _754 = _720;
    float _756 = _724;
    float _758 = _748;
    float _760 = _734;
    if (!_750)
    {
        _752 = _724;
    }
    float _762 = _752;
    float _764 = _762;
    if (!_750)
    {
        _754 = _722;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_750)
    {
        _756 = _748;
    }
    float _770 = _756;
    bool _772 = !_750;
    float _774 = _770;
    if (!_772)
    {
        float _776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _780 = _744 + _778;
        float _782 = _748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = rsqrt(_740);
        float _786 = _780 * _776;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _788 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 + (-1.0);
        float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = fma(_796, _782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _804 = fma(_748, _792, _800);
        float _806 = _784 * _802;
        float _808 = fma(_734, _806, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _810 = fma(_730, _806, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _774 = _804;
        _764 = _808;
        _768 = _810;
    }
    float _812 = _774;
    float _814 = _764;
    float _816 = _768;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _812 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _824 = _814 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _816 + _826;
    float _830 = _820 * _820;
    float _832 = fma(_824, _824, _830);
    float _834 = fma(_828, _828, _832);
    float _836 = rsqrt(_834);
    float _838 = sqrt(_834);
    float _840 = _836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _842 = _824 * _840;
    float _844 = _828 * _840;
    float _846 = _842 * _842;
    float _848 = _844 * _844;
    float _850 = _846 + _848;
    float _852 = sqrt(_850);
    bool _854 = _852 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = _852 + _856;
    float _860 = _828;
    float _862 = _850;
    float _864 = _858;
    float _866 = _820;
    if (_854)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _860 = _868;
    }
    float _870 = _860;
    if (_854)
    {
        float _872 = rsqrt(_850);
        _862 = _872;
    }
    float _874 = _862;
    float _876 = _874;
    if (_854)
    {
        float _878 = _858 * _870;
        _864 = _878;
    }
    float _880 = _864;
    if (_854)
    {
        float _882 = _880 * 0.15915493667125701904296875;
        _758 = _882;
    }
    float _884 = _758;
    float _886 = _870;
    if (_854)
    {
        float _888 = _884 * 6.283185482025146484375;
        float _890 = sin(_888);
        _886 = _890;
    }
    float _892 = _886;
    float _894 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _896 = precise::max(0.0, _894);
    float _898 = _836;
    float _900 = _896;
    if (_854)
    {
        float _902 = _884 * 6.283185482025146484375;
        float _904 = cos(_902);
        _898 = _904;
    }
    float _906 = _898;
    float _908 = -_840;
    float _910 = -_896;
    float _912 = fma(_820, _908, _910);
    if (_854)
    {
        float _914 = _912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _900 = _914;
    }
    float _916 = _900;
    float _918 = _812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _920 = _892;
    float _922 = _916;
    if (_854)
    {
        float _924 = fma(_892, _916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _866 = _924;
    }
    float _926 = _866;
    float _928 = _926;
    if (!_854)
    {
        _920 = _842;
    }
    float _930 = _920;
    float _932 = _930;
    float _934 = _906;
    if (_854)
    {
        float _936 = _906 + (-1.0);
        _922 = _936;
    }
    float _938 = _922;
    float _940 = _938;
    if (_854)
    {
        float _942 = _874 * _926;
        _634 = _942;
    }
    float _944 = _634;
    if (!_854)
    {
        _928 = _912;
    }
    float _946 = _928;
    float _948 = _946;
    if (_854)
    {
        float _950 = _938 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _760 = _950;
    }
    float _952 = _760;
    if (_854)
    {
        float _954 = _842 * _944;
        _932 = _954;
    }
    float _956 = _932;
    if (!_854)
    {
        _940 = _844;
    }
    float _958 = _940;
    float _960 = _958;
    if (_854)
    {
        float _962 = _844 * _944;
        _960 = _962;
    }
    float _964 = _960;
    if (!_854)
    {
        _876 = _846;
    }
    float _966 = _876;
    float _968 = _966;
    if (_854)
    {
        float _970 = fma(_912, _906, _952);
        _948 = _970;
    }
    float _972 = _948;
    if (_854)
    {
        float _974 = _956 * _956;
        _968 = _974;
    }
    float _976 = _968;
    if (!_854)
    {
        _934 = _848;
    }
    float _978 = _934;
    float _980 = _978;
    if (_854)
    {
        float _982 = _964 * _964;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = fma(_972, _972, _976);
    float _988 = _986 + _984;
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _918);
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _994 = fma(_838, (*spvDescriptorSet0.vp_c15)._m0[23].w, _992);
    float _996 = precise::clamp(_994, 0.0, 1.0);
    float _998 = _812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1000 = rsqrt(_988);
    float _1002 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _990);
    float _1004 = -_996;
    float _1006 = _1004 + 1.0;
    float _1008 = _812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1010 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _998);
    float _1012 = _812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1016 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1008);
    float _1018 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1010);
    float _1020 = abs(_1006);
    float _1022 = log2(_1020);
    float _1024 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1026 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1016);
    float _1028 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1030 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1036 = _1000 * _956;
    float _1038 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1040 = _1000 * _972;
    float _1042 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1024);
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1038);
    float _1048 = _1000 * _964;
    float _1050 = -_1032;
    float _1052 = fma(_1050, _1030, 1.0);
    float _1054 = -_1044;
    float _1056 = fma(_1040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1054);
    float _1058 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1046);
    float _1062 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1064 = -_1048;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1056);
    float _1068 = log2(_1052);
    float _1070 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1060);
    float _1072 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1074 = fma(_1066, -0.5, 0.5);
    float _1076 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1078 = fma(_1066, 0.5, 0.5);
    float _1080 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1072);
    float _1082 = _1040 + 1.0;
    float _1084 = exp2(_1062);
    float _1086 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1076);
    float _1088 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1080);
    float _1090 = fma(_1078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1092 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1086);
    float _1094 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1088);
    float _1096 = fma(_1078, _1090, -0.212114393711090087890625);
    float _1098 = 1.0 / _1070;
    float _1100 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1092);
    float _1102 = _1068 * 0.693147182464599609375;
    float _1104 = fma(_1078, _1096, 1.570728778839111328125);
    float _1106 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1108 = sqrt(_1074);
    float _1110 = -_1040;
    float _1112 = fma(_1084, _1082, _1110);
    float _1114 = fma(_1112, 0.5, 0.5);
    float _1116 = _1094 * _1098;
    float _1118 = _1100 * _1098;
    float _1120 = fma(_1116, 0.5, 0.5);
    float _1122 = fma(_1118, -0.5, 0.5);
    float _1124 = _1108 * 0.636619746685028076171875;
    float3 _3849 = float3(_1120, _1122, _1106);
    float _1126 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3849, float3(0.0), isnan(_3849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3849, float3(0.0), isnan(_3849)), level(0.0)).x;
    float _1128 = -_1104;
    float _1130 = fma(_1124, _1128, 1.0);
    float3 _3865 = float3(_1120, _1122, _1106);
    float4 _1133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3865, float3(0.0), isnan(_3865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3865, float3(0.0), isnan(_3865)), level(0.0)).xyzw;
    float _1135 = _1133.x;
    float _1137 = _1133.y;
    float _1139 = _1133.z;
    float _1141 = _1133.w;
    float2 _3882 = float2(_1130, _1114);
    float3 _1145 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3882, float2(0.0), isnan(_3882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3882, float2(0.0), isnan(_3882)), level(0.0)).xyz;
    float _1147 = _1145.x;
    float _1149 = _1145.y;
    float _1151 = _1145.z;
    float _1153 = in.m_69.y;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = in.m_61.z;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1161 = _1159 != 0;
    float _1163 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1167 = _1165 != 0;
    float _1169 = in.m_61.y;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1173 = _1171 != 0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1179 = in.m_61.w;
    float _1181 = exp2(_1163);
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1185 = _1183 != 0;
    out.m_71.x = _518;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1189 = _1187 != 0;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1193 = _1191 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1195 = in.m_65.w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1201 = -_1153;
    float _1203 = _1201 + 1.0;
    float _1205 = in.m_61.x;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = 1.0 / _1177;
    bool _1211 = _1157 > 0.5;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1219 = _1211 ? as_type<int>(_1203) : as_type<int>(_1153);
    float _1221 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1223 = _1169 > 0.5;
    float _1225 = 1.0 / _1193;
    float _1227 = _1167 ? as_type<float>(_1219) : _1153;
    float _1229 = fma(_1217, -2.0, _1213);
    int _1231 = _1223 ? as_type<int>(_1203) : as_type<int>(_1153);
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1233;
    bool _1237 = _1179 > 0.5;
    float _1239 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1229);
    float _1241 = 1.0 / _1199;
    float _1243 = _1173 ? as_type<float>(_1231) : _1153;
    out.m_71.w = _1195;
    float _1245 = _1153;
    bool _1247 = _1161;
    float _1249 = _1157;
    float _1251 = _1169;
    float _1253 = _1094;
    float _1255 = _1070;
    float _1257 = _1100;
    if (_1161)
    {
        float _1259 = _1237 ? _1203 : _1153;
        _1245 = _1259;
    }
    float _1261 = _1245;
    float _1263 = -_1181;
    float _1265 = _1263 + 1.0;
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1269 = _1267 != 0;
    float _1271 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1273 = in.m_73.x;
    float _1275 = in.m_73.y;
    float _1277 = in.m_73.z;
    float _1279 = in.m_73.w;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1283 = _1281 != 0;
    float _1285 = _1235 * _1225;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1299 = _480 + _1297;
    float _1301 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1185)
    {
        bool _1303 = _1205 > 0.5;
        _1247 = _1303;
    }
    bool _1305 = _1247;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1311 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _1301;
    out.m_75.y = _1215;
    out.m_75.z = _1307;
    float _1313 = -_1309;
    float _1315 = fma(_1271, 2.0, _1313);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1319 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1321 = in.m_69.x;
    float _1323 = _398 * _1275;
    float _1325 = _414 * _1275;
    float _1327 = _424 * _1275;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1331 = fma(_368, _1273, _1323);
    float _1333 = fma(_372, _1273, _1325);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1335;
    float _1339 = fma(_376, _1273, _1327);
    float _1341 = fma(_442, _1277, _1331);
    float _1343 = fma(_450, _1277, _1333);
    float _1345 = _1289 * _1209;
    float _1347 = fma(_454, _1277, _1339);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1351 = _480 + _1349;
    float _1353 = _1337 * _1241;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1357 = _480 + _1355;
    out.m_77.x = _1341;
    out.m_77.y = _1343;
    out.m_77.z = _1347;
    float _1359 = fma(_1285, _1351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1361 = fma(_1353, _1299, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1363 = fma(_1221, _1243, -0.5);
    bool _1365 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1367 = isnan(_480);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1379 = fma(_1345, _1357, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1381 = _1345;
    float _1383 = _1357;
    if (!_1269)
    {
        _1381 = _1169;
    }
    float _1385 = _1381;
    float _1387 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1329);
    float _1389 = _1385;
    if (_1269)
    {
        _1389 = _1205;
    }
    float _1391 = _1389;
    float _1393 = -_122;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1315);
    float _1397 = _1321;
    if (!_1185)
    {
        _1383 = _1321;
    }
    float _1399 = _1383;
    out.m_79.x = _714;
    out.m_79.y = _742;
    out.m_79.z = _712;
    bool _1401 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1403 = isnan(_480);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    out.m_81.x = _814;
    out.m_81.y = _812;
    out.m_81.z = _816;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1415 = -_1411;
    float _1417 = _1415 + 1.0;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1421 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1413);
    float _1423 = fma(_1227, _1319, -0.5);
    float _1425 = _1375 * _1417;
    float _1427 = -_1375;
    float _1429 = _1427 + 1.0;
    bool _1431 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1433 = isnan(_480);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1421);
    bool _1445 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1447 = isnan(_480);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1459 = as_type<int>(_1419);
    int _1461 = as_type<int>(_1457);
    float _1463 = _1399;
    if (_1269)
    {
        _636 = _1205;
    }
    float _1465 = _636;
    float _1467 = _1441 * _1429;
    float _1469 = _1465;
    if (!_1269)
    {
        _1469 = _1157;
    }
    float _1471 = _1469;
    float _1473 = -_1441;
    float _1475 = _1473 + 1.0;
    float _1477 = fma(_1419, _1261, -0.5);
    if (_1185)
    {
        float _1479 = -_1321;
        float _1481 = _1479 + 1.0;
        _1459 = as_type<int>(_1481);
    }
    int _1483 = _1459;
    float _1485 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1487 = -_1239;
    float _1489 = fma(_1443, _1363, _1487);
    float _1491 = _1455 * _1475;
    float _1493 = -_1455;
    float _1495 = _1493 + 1.0;
    float _1497 = -_1457;
    float _1499 = fma(_1485, 2.0, _1497);
    float _1501 = as_type<float>(_1483);
    if (_1189)
    {
        float _1503 = -_1321;
        float _1505 = _1503 + 1.0;
        _1461 = as_type<int>(_1505);
    }
    int _1507 = _1461;
    float _1509 = _1359 * _1491;
    float _1511 = _542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1513 = _542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1517 = _1507;
    if (!_1189)
    {
        _638 = _1321;
    }
    float _1519 = _638;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1523 = _1519;
    if (_1185)
    {
        float _1525 = _1305 ? as_type<float>(_1483) : _1321;
        _1463 = _1525;
    }
    float _1527 = _1463;
    float _1529 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1515);
    float _1531 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1189)
    {
        float _1533 = _1211 ? as_type<float>(_1507) : _1321;
        _1523 = _1533;
    }
    float _1535 = _1523;
    if (_1283)
    {
        float _1537 = -_1321;
        float _1539 = _1537 + 1.0;
        _1517 = as_type<int>(_1539);
    }
    int _1541 = _1517;
    float _1543 = as_type<float>(_1541);
    if (!_1269)
    {
        _1501 = _1157;
    }
    float _1545 = _1501;
    float _1547 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1511);
    float _1549 = _1545;
    if (_1269)
    {
        _1549 = _1169;
    }
    float _1551 = _1549;
    float _1553 = fma(_556, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1513);
    float _1555 = -_1521;
    float _1557 = fma(_1531, 2.0, _1555);
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1509);
    if (_1283)
    {
        float _1563 = _1223 ? as_type<float>(_1541) : _1321;
        _1397 = _1563;
    }
    float _1565 = _1397;
    float _1567 = fma(_1551, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1317);
    if (_1269)
    {
        _1543 = _1157;
    }
    float _1569 = _1543;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1575 = _1569;
    if (!_1269)
    {
        _1575 = _1169;
    }
    float _1577 = _1575;
    float _1579 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1269)
    {
        _1249 = _1169;
    }
    float _1581 = _1249;
    float _1583 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1585 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1553);
    float _1587 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1571);
    float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1591 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1579);
    float _1593 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1583);
    if (!_1269)
    {
        _1251 = _1205;
    }
    float _1595 = _1251;
    float _1597 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1547);
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1601 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1603 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1605 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1607 = -_122;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1557);
    float _1611 = fma(_1601, -2.0, _1599);
    float _1613 = fma(_1603, _1527, -0.5);
    float _1615 = fma(_1605, _1535, -0.5);
    float _1617 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1387);
    float _1619 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1529);
    float _1621 = fma(_1379, _1467, _1561);
    float _1623 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1625 = _1277 * _676;
    float _1627 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1587);
    float _1629 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1631 = fma(_1623, _1565, -0.5);
    float _1633 = fma(_1617, _1613, _1395);
    float _1635 = -_1625;
    float _1637 = fma(_1273, _686, _1635);
    float _1639 = fma(_1619, _1615, _1609);
    float _1641 = _1275 * _686;
    float _1643 = fma(_1361, _1425, _1621);
    float _1645 = _1273 * _658;
    float _1647 = _1627 * (-0.15915493667125701904296875);
    float _1649 = 1.0 / _1629;
    float _1651 = -_1641;
    float _1653 = fma(_1277, _658, _1651);
    float _1655 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1657 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1659 = isnan(0.5);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1665 = _1661 || _1663;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1669 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1671 = _1655 + _1629;
    float _1673 = -_1645;
    float _1675 = fma(_1275, _676, _1673);
    float _1677 = _1647 * 6.283185482025146484375;
    float _1679 = sin(_1677);
    float _1681 = _1637 * _1279;
    float _1683 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1567);
    float _1685 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1611);
    float _1687 = fma(_1669, -2.0, _1667);
    float _1689 = _1653 * _1279;
    float _1691 = _1681 * _414;
    float _1693 = -_1685;
    float _1695 = fma(_1683, _1477, _1693);
    float _1697 = _1647 * 6.283185482025146484375;
    float _1699 = cos(_1697);
    float _1701 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1593);
    float _1703 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1591);
    float _1705 = -_122;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1499);
    float _1709 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1687);
    float _1711 = _1637;
    float _1713 = _1633;
    if (!_1665)
    {
        _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1715 = _1711;
    float _1717 = _1639 + 0.5;
    float _1719 = fma(_1689, _372, _1691);
    float _1721 = _1671 * _1649;
    float _1723 = _1721 * 0.5;
    float _1725 = _1681 * _398;
    float _1727 = _1028 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1729 = _1489 + 0.5;
    float _1731 = _1681 * _424;
    float _1733 = _1675 * _1279;
    float _1735 = _1633 + 0.5;
    float _1737 = _1679 * _1423;
    float _1739 = _1695 + 0.5;
    float _1741 = _1699 * _1423;
    if (!_1665)
    {
        float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1745 = fma(_1723, _1715, _1743);
        _1713 = _1745;
    }
    float _1747 = _1713;
    float _1749 = fma(_1689, _368, _1725);
    float _1751 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1727);
    float _1753 = -_1737;
    float _1755 = fma(_1699, _1631, _1753);
    float _1757 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1751);
    float _1759 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1643);
    out.m_83.x = _1735;
    out.m_83.y = _1729;
    out.m_83.z = _1717;
    out.m_83.w = _1739;
    float _1761 = fma(_1689, _376, _1731);
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1765 = _1747;
    if (!_1665)
    {
        float _1767 = 1.0 / _1747;
        _1765 = _1767;
    }
    float _1769 = _1765;
    float _1771 = fma(_1701, _1755, _1707);
    float _1773 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1757);
    float _1775 = fma(_1733, _442, _1749);
    float _1777 = fma(_1679, _1631, _1741);
    bool _1779 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1781 = isnan(_838);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1787 = _1783 || _1785;
    out.gl_Position.x = _1094;
    out.gl_Position.y = _1100;
    out.gl_Position.z = _1773;
    out.gl_Position.w = _1070;
    float _1789 = -_1709;
    float _1791 = fma(_1703, _1777, _1789);
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1797 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1799 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1803 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1805 = fma(_1733, _450, _1719);
    float _1807 = fma(_1733, _454, _1761);
    float _1809 = _1773 + _1070;
    float _1811 = _1094 + _1070;
    out.m_85.x = _1799;
    out.m_85.y = _1801;
    out.m_85.z = _1803;
    out.m_85.w = _1797;
    float _1813 = _1771 + 0.5;
    float _1815 = _1791 + 0.5;
    float _1817 = _1070 * 0.5;
    out.m_87.x = _1775;
    out.m_87.y = _1805;
    out.m_87.z = _1807;
    float _1819 = _1773;
    float _1821 = _1809;
    float _1823 = _1811;
    if (!_1787)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1825 = _1819;
    float _1827 = _1825;
    float _1829 = _1825;
    if (!_1787)
    {
        _1253 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1831 = _1253;
    out.m_89.x = _1813;
    out.m_89.y = _1815;
    float _1833 = _1809 * 0.5;
    float _1835 = _1831;
    float _1837 = _1831;
    if (!_1665)
    {
        _1821 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1839 = _1821;
    float _1841 = _1811 * 0.5;
    float _1843 = -_1311;
    float _1845 = _1843 + 1.0;
    float _1847 = fma(_1100, -0.5, _1817);
    float _1849 = _1839;
    float _1851 = _1841;
    if (!_1665)
    {
        float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1855 = -_1839;
        float _1857 = fma(_1769, _1853, _1855);
        _1823 = _1857;
    }
    float _1859 = _1823;
    float _1861 = _1859;
    if (!_1665)
    {
        float _1863 = -_1839;
        float _1865 = _1863 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1849 = _1865;
    }
    float _1867 = _1849;
    float _1869 = _1867;
    if (_1665)
    {
        _1255 = 1.0;
    }
    float _1871 = _1255;
    out.m_91.x = _1841;
    out.m_91.y = _1847;
    out.m_91.z = _1833;
    out.m_91.w = _1070;
    float _1873 = _1807;
    float _1875 = _1871;
    if (!_1665)
    {
        float _1877 = 1.0 / _1867;
        _1873 = _1877;
    }
    float _1879 = _1873;
    if (!_1787)
    {
        _1257 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1881 = _1257;
    float _1883 = _1311 * _1126;
    float _1885 = _1141 * _1883;
    float _1887 = _1141 * _1845;
    float _1889 = _1881;
    float _1891 = _1881;
    if (!_1787)
    {
        _1869 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1893 = _1869;
    float _1895 = _1151 * _1883;
    float _1897 = fma(_1147, _1885, _1135);
    float _1899 = fma(_1149, _1885, _1137);
    float _1901 = _1893;
    float _1903 = _1893;
    if (!_1787)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1905 = _1851;
    float _1907 = fma(_1141, _1895, _1139);
    float _1909 = _1905;
    float _1911 = _1905;
    if (!_1665)
    {
        float _1913 = _1859 * _1879;
        float _1915 = precise::clamp(_1913, 0.0, 1.0);
        _1861 = _1915;
    }
    float _1917 = _1861;
    out.m_93.x = _1897;
    out.m_93.y = _1899;
    out.m_93.z = _1907;
    out.m_93.w = _1887;
    float _1919 = _1917;
    if (!_1665)
    {
        float _1921 = -_1917;
        float _1923 = _1921 + 1.0;
        _1875 = _1923;
    }
    float _1925 = _1875;
    if (!_1787)
    {
        _1919 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1927 = _1919;
    float _1929 = _1925 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1931 = !_1787;
    float _1933 = _1927;
    float _1935 = _1927;
    if (!_1931)
    {
        bool _1937 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1939 = isnan(_838);
        bool _1941 = _1937 || _1939;
        bool _1943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1945 = _1941 || _1943;
        if (!_1945)
        {
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1949 = _838 + _1947;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1953 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1951;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1959 = 1.0 / _1953;
            float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1967 = _1965 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1975 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1977 = _1949 * _1959;
            float _1979 = precise::clamp(_1977, 0.0, 1.0);
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1985 = fma(_1979, _1957, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1987 = fma(_1979, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1979, _1963, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1991 = fma(_1979, _1967, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1993 = fma(_1979, _1971, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1995 = fma(_1979, _1975, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1911 = _1985;
            _1903 = _1993;
            _1891 = _1989;
            _1837 = _1991;
            _1829 = _1987;
            _1935 = _1995;
            _1997 = true;
        }
        else
        {
            bool _1999 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2001 = isnan(_838);
            bool _2003 = _1999 || _2001;
            bool _2005 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2007 = _2003 || _2005;
            if (!_2007)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2009 = _1889;
            _1891 = _2009;
            if (!_2007)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2011 = _1909;
            _1911 = _2011;
            if (!_2007)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2013 = _1827;
            _1829 = _2013;
            if (!_2007)
            {
                _1835 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2015 = _1835;
            _1837 = _2015;
            if (!_2007)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2017 = _1901;
            _1903 = _2017;
            if (!_2007)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2019 = _1933;
            bool _2021 = !_2007;
            _1935 = _2019;
            if (!_2021)
            {
                bool _2023 = _838 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2025 = isnan(_838);
                bool _2027 = _2023 || _2025;
                bool _2029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2031 = _2027 || _2029;
                if (!_2031)
                {
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2035 = _838 + _2033;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2037;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2045 = 1.0 / _2039;
                    float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2053 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2063 = _2035 * _2045;
                    float _2065 = precise::clamp(_2063, 0.0, 1.0);
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2071 = fma(_2065, _2043, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2073 = fma(_2065, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2065, _2049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2077 = fma(_2065, _2053, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2079 = fma(_2065, _2057, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2081 = fma(_2065, _2061, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1911 = _2071;
                    _1903 = _2079;
                    _1891 = _2075;
                    _1837 = _2077;
                    _1829 = _2073;
                    _1935 = _2081;
                    _1997 = true;
                }
                else
                {
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1837 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1997 = false;
    float _2083 = _1911;
    float _2085 = _1903;
    float _2087 = _1891;
    float _2089 = _1837;
    float _2091 = _1829;
    float _2093 = _1935;
    float _2095 = fma(_742, -0.5, 0.5);
    float _2097 = precise::clamp(_2095, 0.0, 1.0);
    float _2099 = -_2083;
    float _2101 = _2099 + _2085;
    float _2103 = _1929 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2105 = -_2087;
    float _2107 = _2105 + _2089;
    out.m_95.x = 0.0;
    float _2109 = fma(_2097, _2101, _2083);
    float _2111 = fma(_2097, _2107, _2087);
    out.m_51.x = _2103;
    float _2113 = -_2091;
    float _2115 = _2113 + _2093;
    float _2117 = _2109 * 0.586610972881317138671875;
    bool _2119 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2121 = fma(_2097, _2115, _2091);
    float _2123 = fma(_2111, 0.298911988735198974609375, _2117);
    bool _2125 = _1925 > 0.0;
    bool _2127 = isnan(_1925);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(0.0);
    bool _2133 = _2129 || _2131;
    float _2135 = fma(_2121, 0.114477999508380889892578125, _2123);
    float _2137 = -_2135;
    float _2139 = _2111 + _2137;
    float _2141 = -_2135;
    float _2143 = _2109 + _2141;
    float _2145 = -_2135;
    float _2147 = _2121 + _2145;
    float _2149 = fma(_2139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    float _2153 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2135);
    bool _2155 = !_2119;
    if (!_2155)
    {
        float _2157 = -_812;
        float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2161 = -_814;
        float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2165 = -_816;
        float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2169 = _2159 * _2159;
        float _2171 = fma(_2163, _2163, _2169);
        float _2173 = fma(_2167, _2167, _2171);
        float _2175 = sqrt(_2173);
        float _2177 = rsqrt(_2173);
        float _2179 = -_2175;
        float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        float _2187 = _2163 * _2177;
        float _2189 = _2159 * _2177;
        float _2191 = abs(_2185);
        float _2193 = log2(_2191);
        float _2195 = _2167 * _2177;
        float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2199 = _742 * _2189;
        float _2201 = -_2189;
        float _2203 = -_2197;
        float _2205 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2203);
        float _2207 = fma(_714, _2187, _2199);
        float _2209 = -_2195;
        float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2205);
        float _2213 = fma(_712, _2195, _2207);
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2219 = _2211 + _2217;
        float _2221 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2223 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        float _2227 = exp2(_2221);
        float _2229 = _2227 * _2225;
        float _2231 = _2215 * _2229;
        float _2233 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2235 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2237 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2233;
        out.m_95.y = _2235;
        out.m_95.z = _2237;
    }
    out.m_97.x = _2149;
    out.m_97.y = _2151;
    out.m_97.z = _2153;
    if (_2133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2239 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2239;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

