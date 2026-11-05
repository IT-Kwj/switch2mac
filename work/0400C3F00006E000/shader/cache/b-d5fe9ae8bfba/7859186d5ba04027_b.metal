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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_53 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 m_99 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_79 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2017 = false;
    bool _1382 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_50.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_138);
        out.gl_Position.z = _2302;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_55.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_176);
        out.gl_Position.z = _2372;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = _216;
    float _226 = _208;
    if (_220)
    {
        float _228 = rsqrt(_208);
        _224 = _228;
    }
    float _230 = _224;
    float _232 = 0.0;
    float _234 = 0.0;
    if (!_220)
    {
        _232 = 0.0;
        _234 = 0.0;
    }
    float _236 = _232;
    float _238 = _234;
    bool _240 = _218 > 0.0;
    float _242 = 0.0;
    float _244 = _218;
    float _246 = _238;
    float _248 = _236;
    if (!_220)
    {
        _242 = 0.0;
    }
    float _250 = _242;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = _250;
    if (!_222)
    {
        _252 = 0.0;
        _254 = 0.0;
    }
    float _258 = _252;
    float _260 = _254;
    float _262 = _214;
    float _264 = _258;
    float _266 = _260;
    if (_222)
    {
        float _268 = rsqrt(_210);
        _262 = _268;
    }
    float _270 = _262;
    float _272 = 0.0;
    if (!_222)
    {
        _272 = 0.0;
    }
    float _274 = _272;
    float _276 = _274;
    if (!_240)
    {
        _244 = 0.0;
    }
    float _278 = _244;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    float _288 = _230;
    if (_220)
    {
        float _290 = _230 * _178;
        _246 = _290;
    }
    float _292 = _246;
    if (_220)
    {
        float _294 = _230 * _184;
        _248 = _294;
    }
    float _296 = _248;
    if (_220)
    {
        float _298 = _230 * _190;
        _256 = _298;
    }
    float _300 = _256;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _288 = 0.0;
    }
    float _304 = _288;
    float _306 = _304;
    if (!_240)
    {
        _226 = 0.0;
    }
    float _308 = _226;
    float _310 = _308;
    if (_222)
    {
        float _312 = _270 * _180;
        _276 = _312;
    }
    float _314 = _276;
    if (_222)
    {
        float _316 = _270 * _186;
        _264 = _316;
    }
    float _318 = _264;
    if (_222)
    {
        float _320 = _270 * _192;
        _266 = _320;
    }
    float _322 = _266;
    if (_240)
    {
        float _324 = _286 * _182;
        _306 = _324;
    }
    float _326 = _306;
    if (_240)
    {
        float _328 = _286 * _188;
        _282 = _328;
    }
    float _330 = _282;
    if (_240)
    {
        float _332 = _286 * _194;
        _310 = _332;
    }
    float _334 = _310;
    bool _336 = !_302;
    float _338 = _334;
    float _356;
    if (!_336)
    {
        float _340 = in.m_63.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_122);
        float _362 = 1.0 / _360;
        float _364 = _156 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_63.x;
    float _370 = in.m_63.y;
    float _372 = in.m_63.z;
    float _374 = in.m_50.x;
    float _376 = in.m_50.y;
    float _378 = in.m_50.z;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _380;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _394 = _392 != 0;
    float _396 = 1.0 / _382;
    bool _398 = !_390;
    int _400 = _398 ? 0 : 1;
    int _402 = abs(_400);
    float _404 = _372 * 2.0;
    float _406 = _368 * 2.0;
    float _408 = _370 + _372;
    float _410 = _370 * 2.0;
    float _412 = _192 * _376;
    float _414 = _186 * _376;
    float _416 = floor(_404);
    float _418 = _408 + (-1.0);
    float _420 = fma(_190, _374, _412);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _424 = _366 + _422;
    float _426 = fma(_184, _374, _414);
    float _428 = _368 + _372;
    float _430 = _372 + (-0.5);
    float _432 = _368 + (-0.5);
    float _434 = floor(_406);
    float _436 = _370 + _368;
    float _438 = _424 * _396;
    float _440 = _428 + (-1.0);
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _436 + (-1.0);
    float _450 = _370 + (-0.5);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _416 > 0.0;
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _460 = _416 >= 0.0;
    bool _462 = isnan(_416);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_188, _378, _426);
    float _472 = fma(_194, _378, _420);
    int _474 = abs(_446);
    float _476 = floor(_410);
    bool _478 = _434 > 0.0;
    float _480 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _482 = _434 >= 0.0;
    bool _484 = isnan(_434);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    int _492 = _468 ? 0 : 1;
    int _494 = _490 ? 0 : 1;
    float _496 = _454 * _156;
    int _498 = ~_492;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    int _504 = ~_494;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = exp2(_496);
    int _512 = _502;
    int _514 = _508;
    if (!_456)
    {
        int _516 = ~_492;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    bool _522 = _476 > 0.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    bool _528 = _476 >= 0.0;
    bool _530 = isnan(_476);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    if (!_478)
    {
        int _538 = ~_494;
        int _540 = _538 + 1;
        _514 = _540;
    }
    int _542 = _514;
    float _544 = 1.0 / _526;
    float _546 = in.m_65.x;
    float _548 = in.m_65.y;
    float _550 = in.m_65.z;
    bool _552 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _554 = isnan(1.0);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _560 = _556 || _558;
    float _562 = float(_474);
    float _564 = float(_520);
    float _566 = -_510;
    float _568 = _566 + 1.0;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = float(_402);
    float _582 = _562 * _564;
    float _584 = float(_542);
    float _586 = _578 ? _568 : 0.0;
    float _588 = _582 * (-2.0);
    int _590 = _536 ? 0 : 1;
    float _592 = _580 * _584;
    if (_560)
    {
        float _594 = _586 * _544;
        _158 = _594;
    }
    float _596 = _158;
    float _598 = fma(_458, _588, _458);
    float _600 = _592 * (-2.0);
    int _602 = ~_590;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_588, _546, _546);
    int _610 = _606;
    if (!_522)
    {
        int _612 = ~_590;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = fma(_600, _548, _548);
    float _620 = fma(_442, _600, _442);
    float _622 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    bool _624 = !_394;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    float _630 = fma(_598, _596, _622);
    int _632 = abs(_626);
    float _634 = fma(_620, _596, _628);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _636;
    float _640 = float(_616);
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _644;
    float _648 = float(_632);
    float _650 = fma(_638, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _652 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _654 = isnan(_366);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _664;
    float _668 = _634 * 0.15915493667125701904296875;
    float _670 = _648 * _640;
    bool _672 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _674 = isnan(_366);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_662;
    float _686 = _684 + 1.0;
    float _688 = in.m_67.x;
    float _690 = in.m_67.y;
    float _692 = in.m_67.z;
    float _694 = _670 * (-2.0);
    float _696 = fma(_666, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _698 = fma(_646, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _700 = _682 * _686;
    float _702 = fma(_694, _550, _550);
    float _704 = in.m_69.x;
    float _706 = in.m_69.y;
    float _708 = in.m_69.z;
    float _710 = fma(_480, _694, _480);
    float _712 = _696 * _700;
    float _714 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[196].z, _702);
    float _716 = _650 * _700;
    float _718 = -_682;
    float _720 = _718 + 1.0;
    float _722 = _698 * _700;
    float _724 = fma(_710, _596, _714);
    float _726 = _642 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _712);
    float _732 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _722);
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _716);
    float _736 = _724 * 0.15915493667125701904296875;
    float _738 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].x, _730);
    float _740 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].z, _732);
    float _742 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].y, _734);
    float _744 = _668 * 6.283185482025146484375;
    float _746 = sin(_744);
    float _748 = _740 * _692;
    float _750 = _738 * _688;
    float _752 = _742 * _690;
    float _754 = in.m_61.w;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _758 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _760 = _668 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _704);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _706);
    float _768 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = in.m_59.w;
    float _772 = _764 * _758;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _708);
    float _776 = _766 * _768;
    float _778 = _642 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = _728 * _746;
    float _784 = _774 * _756;
    float _786 = _736 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _728 * _762;
    float _792 = _736 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = _780 * _746;
    float _798 = _780 * _762;
    float _800 = _470 + _770;
    float _802 = _728 * _788;
    float _804 = _780 * _788;
    float _806 = _762 * _788;
    float _808 = _746 * _788;
    float _810 = _802 * _776;
    float _812 = _804 * _776;
    float _814 = _472 + _754;
    float _816 = fma(_794, _790, _796);
    float _818 = -_776;
    float _820 = _794 * _818;
    float _822 = -_798;
    float _824 = fma(_794, _782, _822);
    float _826 = -_782;
    float _828 = fma(_794, _798, _826);
    float _830 = fma(_816, _772, _810);
    float _832 = fma(_806, _772, _820);
    float _834 = fma(_794, _796, _790);
    float _836 = fma(_828, _772, _812);
    float _838 = fma(_824, _784, _830);
    float _840 = fma(_808, _784, _832);
    float _842 = fma(_834, _784, _836);
    float _844 = _838 * _318;
    float _846 = _838 * _322;
    float _848 = _838 * _314;
    float _850 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _852 = fma(_840, _296, _844);
    float _854 = fma(_840, _300, _846);
    float _856 = fma(_840, _292, _848);
    float _858 = floor(_850);
    float _860 = fma(_842, _330, _852);
    float _862 = fma(_842, _334, _854);
    float _864 = fma(_842, _326, _856);
    float _866 = _800 + _860;
    float _868 = _814 + _862;
    float _870 = in.m_71.y;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _874 = _866 + _872;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _878 = _868 + _876;
    float _880 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _882 = _874 * _874;
    float _884 = _878 * _878;
    float _886 = -_858;
    float _888 = _850 + _886;
    float _890 = _882 + _884;
    float _892 = sqrt(_890);
    float _894 = _376 + _870;
    float _896 = _894 + _864;
    bool _898 = _892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _892 + _900;
    float _904 = 0.0;
    float _906 = _870;
    float _908 = _848;
    float _910 = _856;
    float _912 = _866;
    float _914 = _868;
    float _916 = _896;
    float _918 = _882;
    float _920 = _884;
    if (_898)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _922;
    }
    float _924 = _904;
    if (_898)
    {
        float _926 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _926;
    }
    float _928 = _906;
    if (_898)
    {
        float _930 = rsqrt(_890);
        _908 = _930;
    }
    float _932 = _908;
    float _934 = _924;
    if (_898)
    {
        float _936 = _902 * _924;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _938;
    if (_898)
    {
        float _942 = _938 * 0.15915493667125701904296875;
        _940 = _942;
    }
    float _944 = _940;
    float _946 = _902;
    if (_898)
    {
        float _948 = _944 * 6.283185482025146484375;
        float _950 = sin(_948);
        _946 = _950;
    }
    float _952 = _946;
    if (_898)
    {
        float _954 = fma(_952, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _910 = _954;
    }
    float _956 = _910;
    float _958 = floor(_880);
    float _960 = _956;
    if (_898)
    {
        float _962 = _932 * _956;
        _960 = _962;
    }
    float _964 = _960;
    if (_898)
    {
        float _966 = fma(_874, _964, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _912 = _966;
    }
    float _968 = _912;
    if (_898)
    {
        float _970 = fma(_878, _964, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _914 = _970;
    }
    float _972 = _914;
    float _974 = fma(_968, 6.2500002968590706586837768554688e-05, 0.5);
    float _976 = fma(_972, 6.2500002968590706586837768554688e-05, 0.5);
    float _978 = -_958;
    float _980 = _880 + _978;
    float2 _3533 = float2(_974, _976);
    float3 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3533, float2(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3533, float2(0.0), isnan(_3533)), level(0.0)).xyz;
    float _986 = _984.x;
    float _988 = _984.y;
    float _990 = _984.z;
    float2 _3549 = float2(_888, _980);
    float _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3549, float2(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3549, float2(0.0), isnan(_3549)), level(0.0)).x;
    float _994 = in.m_73.y;
    bool _996 = _706 != 0.0;
    bool _998 = isnan(_706);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.0);
    bool _1004 = _1000 || _1002;
    float _1006 = _944;
    if (_898)
    {
        float _1008 = _944 * 6.283185482025146484375;
        float _1010 = cos(_1008);
        _1006 = _1010;
    }
    float _1012 = _1006;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1016 = _1014 != 0;
    float _1018 = in.m_63.w;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1022 = _1020 != 0;
    bool _1024 = _704 == 0.0;
    bool _1026 = !_1004;
    bool _1028 = _1024 && _1026;
    float _1030 = in.m_75.x;
    float _1032 = in.m_75.y;
    float _1034 = in.m_75.z;
    float _1036 = in.m_73.x;
    bool _1038 = _708 == 0.0;
    bool _1040 = _1038 && _1028;
    float _1042 = _376;
    float _1044 = 1.0;
    if (_1016)
    {
        float _1046 = in.m_63.z;
        _1042 = _1046;
    }
    float _1048 = _1042;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1050 = -_994;
    float _1052 = _1050 + 1.0;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1058 = _1018 > 0.5;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1064 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _994;
    float _1068 = 1.0;
    if (_1022)
    {
        float _1070 = _1058 ? _1052 : _994;
        _1066 = _1070;
    }
    float _1072 = _1066;
    float _1074 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = 0.0;
    if (_1040)
    {
        _1076 = _1032;
    }
    float _1078 = _1076;
    float _1080 = _1078;
    if (!_1040)
    {
        float _1082 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1032);
        _1080 = _1082;
    }
    float _1084 = _1080;
    if (_1040)
    {
        _1068 = _1034;
    }
    float _1086 = _1068;
    float _1088 = _1086;
    if (!_1040)
    {
        float _1090 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1088 = _1090;
    }
    float _1092 = _1088;
    float _1094 = 0.0;
    if (_1016)
    {
        _1094 = _1036;
    }
    float _1096 = _1094;
    float _1098 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1100 = _1048 > 0.5;
    bool _1102 = _1100 && _1016;
    float _1104 = in.m_79.x;
    float _1106 = in.m_79.y;
    float _1108 = in.m_79.z;
    float _1110 = in.m_79.w;
    float _1112 = _1096;
    if (!_1016)
    {
        _1044 = _1036;
    }
    float _1114 = _1044;
    float _1116 = 0.0;
    float _1118 = _1114;
    if (_1040)
    {
        _1116 = _1030;
    }
    float _1120 = _1116;
    float _1122 = _1120;
    if (!_1040)
    {
        float _1124 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1030);
        _1122 = _1124;
    }
    float _1126 = _1122;
    out.m_81.x = _1064;
    out.m_81.y = _1074;
    out.m_81.z = _1098;
    out.m_81.w = _1062;
    if (_1102)
    {
        float _1128 = -_1096;
        float _1130 = _1128 + 1.0;
        _1112 = _1130;
    }
    float _1132 = _1112;
    if (_1016)
    {
        _1118 = _1132;
    }
    float _1134 = _1118;
    float _1136 = _804 * _1084;
    float _1138 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1140 = fma(_828, _1126, _1136);
    float _1142 = _1108 * _1030;
    float _1144 = _1106 * _1034;
    float _1146 = _1104 * _1032;
    float _1148 = -_1142;
    float _1150 = fma(_1104, _1034, _1148);
    float _1152 = -_1144;
    float _1154 = fma(_1108, _1032, _1152);
    float _1156 = -_1146;
    float _1158 = fma(_1106, _1030, _1156);
    float _1160 = -_1084;
    float _1162 = _794 * _1160;
    float _1164 = _1150 * _1110;
    float _1166 = _1154 * _1110;
    float _1168 = _1158 * _1110;
    float _1170 = -_1106;
    float _1172 = _794 * _1170;
    float _1174 = _802 * _1106;
    float _1176 = _802 * _1084;
    float _1178 = -_1164;
    float _1180 = _794 * _1178;
    float _1182 = _804 * _1106;
    float _1184 = _802 * _1164;
    float _1186 = _804 * _1164;
    float _1188 = fma(_806, _1126, _1162);
    float _1190 = fma(_816, _1126, _1176);
    float _1192 = fma(_816, _1104, _1174);
    float _1194 = fma(_828, _1104, _1182);
    float _1196 = fma(_828, _1166, _1186);
    float _1198 = fma(_806, _1166, _1180);
    float _1200 = fma(_816, _1166, _1184);
    float _1202 = fma(_808, _1092, _1188);
    float _1204 = fma(_824, _1092, _1190);
    float _1206 = fma(_834, _1092, _1140);
    float _1208 = fma(_806, _1104, _1172);
    float _1210 = fma(_824, _1108, _1192);
    float _1212 = fma(_834, _1108, _1194);
    float _1214 = fma(_824, _1168, _1200);
    float _1216 = fma(_808, _1108, _1208);
    float _1218 = _1210 * _318;
    float _1220 = _1210 * _314;
    float _1222 = _1210 * _322;
    float _1224 = fma(_808, _1168, _1198);
    float _1226 = fma(_834, _1168, _1196);
    float _1228 = _1204 * _318;
    float _1230 = _1214 * _318;
    float _1232 = _1214 * _314;
    float _1234 = _1214 * _322;
    float _1236 = fma(_1216, _296, _1218);
    float _1238 = fma(_1216, _292, _1220);
    float _1240 = fma(_1216, _300, _1222);
    float _1242 = _1216;
    float _1244 = _1228;
    if (_898)
    {
        float _1246 = _1012 + (-1.0);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = fma(_1202, _296, _1228);
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1254 = _1204 * _314;
    float _1256 = _1248;
    if (_898)
    {
        float _1258 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1258;
    }
    float _1260 = _1244;
    float _1262 = _1260;
    if (_898)
    {
        float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1266 = _968 + _1264;
        _1256 = _1266;
    }
    float _1268 = _1256;
    float _1270 = _1204 * _322;
    float _1272 = fma(_1224, _296, _1230);
    if (_898)
    {
        float _1274 = fma(_896, _1012, _1260);
        _916 = _1274;
    }
    float _1276 = _916;
    if (_898)
    {
        float _1278 = _1268 * _1268;
        _918 = _1278;
    }
    float _1280 = _918;
    if (_898)
    {
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1284 = _972 + _1282;
        _1262 = _1284;
    }
    float _1286 = _1262;
    float _1288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1292 = _1276 + _1290;
    float _1294 = fma(_1202, _292, _1254);
    if (_898)
    {
        float _1296 = _1286 * _1286;
        _920 = _1296;
    }
    float _1298 = _920;
    float _1300 = fma(_1224, _292, _1232);
    float _1302 = fma(_1292, _1292, _1280);
    float _1304 = fma(_1202, _300, _1270);
    float _1306 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1308 = fma(_1224, _300, _1234);
    float _1310 = _1302 + _1298;
    float _1312 = fma(_1212, _330, _1236);
    float _1314 = fma(_1212, _326, _1238);
    float _1316 = fma(_1212, _334, _1240);
    float _1318 = fma(_1206, _330, _1250);
    float _1320 = fma(_1226, _330, _1272);
    float _1322 = sqrt(_1310);
    float _1324 = fma(_1226, _326, _1300);
    float _1326 = fma(_1206, _326, _1294);
    float _1328 = _1306 * _1252;
    float _1330 = _1138 * _1288;
    float _1332 = fma(_1226, _334, _1308);
    float _1334 = fma(_1206, _334, _1304);
    out.m_83.x = _1312;
    out.m_83.y = _1314;
    out.m_83.z = _1316;
    out.m_85.z = _1330;
    out.m_85.w = _1328;
    out.m_87.x = _1320;
    out.m_87.y = _1324;
    out.m_87.z = _1332;
    bool _1336 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1338 = isnan(_1322);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1344 = _1340 || _1342;
    out.m_89.x = _1318;
    out.m_89.y = _1326;
    out.m_89.z = _1334;
    float _1346 = _1320;
    if (!_1344)
    {
        _338 = 1.0;
    }
    float _1348 = _338;
    out.m_91.x = _986;
    out.m_91.y = _988;
    out.m_91.z = _990;
    bool _1350 = !_1344;
    float _1352 = _1348;
    if (!_1350)
    {
        bool _1354 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1356 = isnan(_1322);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1362 = _1358 || _1360;
        if (!_1362)
        {
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1366 = _1322 + _1364;
            float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1370 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1368;
            float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1374 = _1372 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1376 = 1.0 / _1370;
            float _1378 = _1366 * _1376;
            float _1380 = fma(_1378, _1374, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1352 = _1380;
            _1382 = true;
        }
        else
        {
            bool _1384 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1386 = isnan(_1322);
            bool _1388 = _1384 || _1386;
            bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1392 = _1388 || _1390;
            if (!_1392)
            {
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1396 = _1322 + _1394;
                float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1400 = _1398 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1404 = _1402 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1406 = 1.0 / _1400;
                float _1408 = _1396 * _1406;
                float _1410 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1352 = _1410;
                _1382 = true;
            }
            else
            {
                _1352 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1382 = false;
    float _1412 = _1352;
    float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1416 = _1276 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1420 = _968 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1424 = _972 + _1422;
    float _1426 = fma(_1416, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1428 = fma(_1420, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1424, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1434 = _1426 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1438 = _1428 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1442 = _1430 + _1440;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1446 = _1434 * _1434;
    float _1448 = fma(_1438, _1438, _1446);
    float _1450 = fma(_1442, _1442, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1456 = _1438 * _1454;
    float _1458 = _1442 * _1454;
    float _1460 = _1456 * _1456;
    float _1462 = _1458 * _1458;
    float _1464 = _1460 + _1462;
    float _1466 = sqrt(_1464);
    bool _1468 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1470;
    float _1474 = _1442;
    float _1476 = _1464;
    float _1478 = _1472;
    float _1480 = _1454;
    float _1482 = _1456;
    if (_1468)
    {
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1484;
    }
    float _1486 = _1474;
    if (_1468)
    {
        float _1488 = rsqrt(_1464);
        _1476 = _1488;
    }
    float _1490 = _1476;
    float _1492 = _1490;
    if (_1468)
    {
        float _1494 = _1472 * _1486;
        _1478 = _1494;
    }
    float _1496 = _1478;
    if (_1468)
    {
        float _1498 = _1496 * 0.15915493667125701904296875;
        _1346 = _1498;
    }
    float _1500 = _1346;
    float _1502 = _1452;
    float _1504 = _1500;
    if (_1468)
    {
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1514 = precise::max(0.0, _1512);
    float _1516 = _330;
    float _1518 = _1514;
    float _1520 = _1512;
    if (_1468)
    {
        float _1522 = _1500 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1516 = _1524;
    }
    float _1526 = _1516;
    float _1528 = -_1454;
    float _1530 = -_1514;
    float _1532 = fma(_1434, _1528, _1530);
    float _1534 = _1532;
    if (_1468)
    {
        float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1536;
    }
    float _1538 = _1518;
    float _1540 = _1510;
    float _1542 = _1538;
    if (_1468)
    {
        float _1544 = fma(_1510, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1544;
    }
    float _1546 = _1540;
    float _1548 = _1546;
    if (!_1468)
    {
        _1542 = _1458;
    }
    float _1550 = _1542;
    float _1552 = _1550;
    if (_1468)
    {
        float _1554 = _1526 + (-1.0);
        _1520 = _1554;
    }
    float _1556 = _1520;
    if (_1468)
    {
        float _1558 = _1490 * _1546;
        _1480 = _1558;
    }
    float _1560 = _1480;
    if (!_1468)
    {
        _1548 = _1532;
    }
    float _1562 = _1548;
    float _1564 = _1562;
    if (_1468)
    {
        float _1566 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1566;
    }
    float _1568 = _1504;
    if (_1468)
    {
        float _1570 = _1456 * _1560;
        _1482 = _1570;
    }
    float _1572 = _1482;
    float _1574 = sqrt(_1450);
    if (!_1468)
    {
        _1492 = _1460;
    }
    float _1576 = _1492;
    float _1578 = _1576;
    if (_1468)
    {
        float _1580 = fma(_1532, _1526, _1568);
        _1564 = _1580;
    }
    float _1582 = _1564;
    if (_1468)
    {
        float _1584 = _1458 * _1560;
        _1552 = _1584;
    }
    float _1586 = _1552;
    if (_1468)
    {
        float _1588 = _1572 * _1572;
        _1578 = _1588;
    }
    float _1590 = _1578;
    if (!_1468)
    {
        _1534 = _1462;
    }
    float _1592 = _1534;
    float _1594 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1592;
    if (_1468)
    {
        float _1598 = _1586 * _1586;
        _1596 = _1598;
    }
    float _1600 = _1596;
    float _1602 = fma(_1582, _1582, _1590);
    float _1604 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1606 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1608 = _1602 + _1600;
    float _1610 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1612 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1606);
    float _1616 = rsqrt(_1608);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1620 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1618);
    float _1622 = precise::clamp(_1620, 0.0, 1.0);
    float _1624 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1610);
    float _1626 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1628 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1614);
    float _1630 = -_1622;
    float _1632 = _1630 + 1.0;
    float _1634 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1640 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1642 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1644 = abs(_1632);
    float _1646 = log2(_1644);
    float _1648 = -_1636;
    float _1650 = fma(_1648, _1444, 1.0);
    float _1652 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1642);
    float _1656 = _1616 * _1572;
    float _1658 = _1616 * _1586;
    float _1660 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1664 = _1616 * _1582;
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1668 = log2(_1650);
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1662);
    float _1672 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1674 = -_1666;
    float _1676 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1674);
    float _1678 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1670);
    float _1682 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1684 = -_1658;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1676);
    float _1688 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1690 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1692 = exp2(_1682);
    float _1694 = fma(_1686, -0.5, 0.5);
    float _1696 = fma(_1686, 0.5, 0.5);
    float _1698 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1672);
    float _1700 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1702 = _1664 + 1.0;
    float _1704 = _1668 * 0.693147182464599609375;
    float _1706 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1698);
    float _1708 = 1.0 / _1690;
    float _1710 = fma(_1696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1712 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1700);
    float _1714 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1706);
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1718 = fma(_1696, _1710, -0.212114393711090087890625);
    float _1720 = sqrt(_1694);
    float _1722 = -_1664;
    float _1724 = fma(_1692, _1702, _1722);
    float _1726 = fma(_1696, _1718, 1.570728778839111328125);
    float _1728 = fma(_1724, 0.5, 0.5);
    float _1730 = _1714 * _1708;
    float _1732 = _1712 * _1708;
    float _1734 = fma(_1730, 0.5, 0.5);
    float _1736 = fma(_1732, -0.5, 0.5);
    float _1738 = _1720 * 0.636619746685028076171875;
    float _1740 = -_1726;
    float _1742 = fma(_1738, _1740, 1.0);
    float3 _4834 = float3(_1734, _1736, _1716);
    float _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4834, float3(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4834, float3(0.0), isnan(_4834)), level(0.0)).x;
    float3 _4845 = float3(_1734, _1736, _1716);
    float4 _1747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4845, float3(0.0), isnan(_4845)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4845, float3(0.0), isnan(_4845)), level(0.0)).xyzw;
    float _1749 = _1747.x;
    float _1751 = _1747.y;
    float _1753 = _1747.z;
    float _1755 = _1747.w;
    float2 _4861 = float2(_1742, _1728);
    float3 _1757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4861, float2(0.0), isnan(_4861)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4861, float2(0.0), isnan(_4861)), level(0.0)).xyz;
    float _1759 = _1757.x;
    float _1761 = _1757.y;
    float _1763 = _1757.z;
    float _1765 = _894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = _894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1769 = -_992;
    float _1771 = _1769 + 1.0;
    out.m_93.x = _1428;
    out.m_93.y = _1426;
    out.m_93.z = _1430;
    float _1773 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1775 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1767);
    bool _1777 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1779 = isnan(_1574);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1785 = _1781 || _1783;
    float _1787 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1773);
    float _1789 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1775);
    float _1791 = _1787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1793 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = 1.0 / _1791;
    float _1797 = _1793 + _1791;
    float _1799 = _1797 * _1795;
    float _1801 = _1799 * 0.5;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1805 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1803);
    float _1807 = 1.0 / _1805;
    float _1809 = in.m_71.x;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1813 = _1807 * _1811;
    float _1815 = abs(_1813);
    float _1817 = log2(_1815);
    bool _1819 = _1813 <= 8000.0;
    bool _1821 = isnan(_1813);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(8000.0);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1833 = exp2(_1831);
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1841 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = fma(_1837, -2.0, 3.0);
    float _1845 = _1837 * _1837;
    float _1847 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1849 = exp2(_1839);
    float _1851 = _1845 * _1843;
    float _1853 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1847);
    float _1855 = -_1851;
    float _1857 = _1855 + 1.0;
    float _1859 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1861 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1851);
    float _1863 = _1859 + _1690;
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1712;
    out.gl_Position.z = _1859;
    out.gl_Position.w = _1690;
    float _1865 = _1829 * _1861;
    float _1867 = _1863 * 0.5;
    float _1869 = -_1849;
    float _1871 = _1869 + 1.0;
    float _1873 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1875 = _1771 * _1873;
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = -_1877;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1883 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1885 = _1881 * _1809;
    float _1887 = _1885 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.z = _1867;
    out.m_95.w = _1690;
    out.m_97.x = _1887;
    float _1889 = _1887;
    float _1891 = _1749;
    float _1893 = _1755;
    float _1895 = _1753;
    if (!_1785)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1897 = _1889;
    float _1899 = _1883 * _1744;
    float _1901 = -_1883;
    float _1903 = _1901 + 1.0;
    float _1905 = _1755 * _1899;
    float _1907 = _1763 * _1899;
    float _1909 = _1755 * _1903;
    float _1911 = _1903;
    float _1913 = _1905;
    float _1915 = _1897;
    float _1917 = _1897;
    if (!_1785)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1919 = _1911;
    float _1921 = fma(_1759, _1905, _1749);
    float _1923 = fma(_1761, _1905, _1751);
    float _1925 = fma(_1755, _1907, _1753);
    float _1927 = _1919;
    float _1929 = _1919;
    if (!_1785)
    {
        _1891 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1931 = _1891;
    float _1933 = _1931;
    float _1935 = _1931;
    if (!_1785)
    {
        _1893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1937 = _1893;
    out.m_99.x = _1921;
    out.m_99.y = _1923;
    out.m_99.z = _1925;
    out.m_99.w = _1909;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1785)
    {
        _1895 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1943 = _1895;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1785)
    {
        _1913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1949 = _1913;
    bool _1951 = !_1785;
    float _1953 = _1949;
    float _1955 = _1949;
    if (!_1951)
    {
        bool _1957 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1959 = isnan(_1574);
        bool _1961 = _1957 || _1959;
        bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1965 = _1961 || _1963;
        if (!_1965)
        {
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1969 = _1574 + _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1971;
            float _1975 = 1.0 / _1973;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1997 = _1969 * _1975;
            float _1999 = precise::clamp(_1997, 0.0, 1.0);
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2005 = fma(_1999, _1979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2007 = fma(_1999, _2003, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2009 = fma(_1999, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2011 = fma(_1999, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2013 = fma(_1999, _1991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2015 = fma(_1999, _1995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1917 = _2007;
            _1947 = _2013;
            _1929 = _2005;
            _1941 = _2011;
            _1935 = _2009;
            _1955 = _2015;
            _2017 = true;
        }
        else
        {
            bool _2019 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2021 = isnan(_1574);
            bool _2023 = _2019 || _2021;
            bool _2025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2027 = _2023 || _2025;
            if (!_2027)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2029 = _1927;
            _1929 = _2029;
            if (!_2027)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2031 = _1915;
            _1917 = _2031;
            if (!_2027)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2033 = _1933;
            _1935 = _2033;
            if (!_2027)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2035 = _1939;
            _1941 = _2035;
            if (!_2027)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2037 = _1945;
            _1947 = _2037;
            if (!_2027)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2039 = _1953;
            bool _2041 = !_2027;
            _1955 = _2039;
            if (!_2041)
            {
                bool _2043 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2045 = isnan(_1574);
                bool _2047 = _2043 || _2045;
                bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2051 = _2047 || _2049;
                if (!_2051)
                {
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2055 = _1574 + _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2057;
                    float _2061 = 1.0 / _2059;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2083 = _2055 * _2061;
                    float _2085 = precise::clamp(_2083, 0.0, 1.0);
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2091 = fma(_2085, _2065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2093 = fma(_2085, _2089, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2095 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2097 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2099 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2101 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1917 = _2093;
                    _1947 = _2099;
                    _1929 = _2091;
                    _1941 = _2097;
                    _1935 = _2095;
                    _1955 = _2101;
                    _2017 = true;
                }
                else
                {
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2017 = false;
    float _2103 = _1917;
    float _2105 = _1947;
    float _2107 = _1929;
    float _2109 = _1941;
    float _2111 = _1935;
    float _2113 = _1955;
    float _2115 = fma(_1326, -0.5, 0.5);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    float _2123 = -_2107;
    float _2125 = _2123 + _2109;
    float _2127 = -_2111;
    float _2129 = _2127 + _2113;
    bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = fma(_2117, _2121, _2103);
    float _2135 = fma(_2117, _2125, _2107);
    float _2137 = fma(_2117, _2129, _2111);
    float _2139 = _2133 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2141 = fma(_2135, 0.298911988735198974609375, _2139);
    float _2143 = fma(_2137, 0.114477999508380889892578125, _2141);
    out.m_101.x = 0.0;
    float _2145 = -_2143;
    float _2147 = _2135 + _2145;
    float _2149 = -_2143;
    float _2151 = _2133 + _2149;
    float _2153 = -_2143;
    float _2155 = _2137 + _2153;
    float _2157 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    float _2163 = fma(_2155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    out.m_97.w = _2157;
    out.m_103.x = _2159;
    out.m_103.y = _2161;
    out.m_103.z = _2163;
    if (!_2131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2165 = -_1426;
    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2169 = -_1428;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2173 = -_1430;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2177 = _2167 * _2167;
    float _2179 = fma(_2171, _2171, _2177);
    float _2181 = fma(_2175, _2175, _2179);
    float _2183 = sqrt(_2181);
    float _2185 = rsqrt(_2181);
    float _2187 = -_2183;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2171 * _2185;
    float _2197 = _2167 * _2185;
    float _2199 = abs(_2193);
    float _2201 = log2(_2199);
    float _2203 = _2175 * _2185;
    float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2207 = _1326 * _2197;
    float _2209 = -_2197;
    float _2211 = -_2205;
    float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
    float _2215 = fma(_1318, _2195, _2207);
    float _2217 = -_2203;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
    float _2221 = fma(_1334, _2203, _2215);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2227 = _2219 + _2225;
    float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = exp2(_2229);
    float _2237 = _2235 * _2233;
    float _2239 = _2223 * _2237;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2241;
    out.m_101.y = _2243;
    out.m_101.z = _2245;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2017 = false;
    bool _1382 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_50.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_138);
        out.gl_Position.z = _2302;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_55.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_176);
        out.gl_Position.z = _2372;
    }
    if (_168)
    {
        return out;
    }
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = _216;
    float _226 = _208;
    if (_220)
    {
        float _228 = rsqrt(_208);
        _224 = _228;
    }
    float _230 = _224;
    float _232 = 0.0;
    float _234 = 0.0;
    if (!_220)
    {
        _232 = 0.0;
        _234 = 0.0;
    }
    float _236 = _232;
    float _238 = _234;
    bool _240 = _218 > 0.0;
    float _242 = 0.0;
    float _244 = _218;
    float _246 = _238;
    float _248 = _236;
    if (!_220)
    {
        _242 = 0.0;
    }
    float _250 = _242;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = _250;
    if (!_222)
    {
        _252 = 0.0;
        _254 = 0.0;
    }
    float _258 = _252;
    float _260 = _254;
    float _262 = _214;
    float _264 = _258;
    float _266 = _260;
    if (_222)
    {
        float _268 = rsqrt(_210);
        _262 = _268;
    }
    float _270 = _262;
    float _272 = 0.0;
    if (!_222)
    {
        _272 = 0.0;
    }
    float _274 = _272;
    float _276 = _274;
    if (!_240)
    {
        _244 = 0.0;
    }
    float _278 = _244;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    float _288 = _230;
    if (_220)
    {
        float _290 = _230 * _178;
        _246 = _290;
    }
    float _292 = _246;
    if (_220)
    {
        float _294 = _230 * _184;
        _248 = _294;
    }
    float _296 = _248;
    if (_220)
    {
        float _298 = _230 * _190;
        _256 = _298;
    }
    float _300 = _256;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _288 = 0.0;
    }
    float _304 = _288;
    float _306 = _304;
    if (!_240)
    {
        _226 = 0.0;
    }
    float _308 = _226;
    float _310 = _308;
    if (_222)
    {
        float _312 = _270 * _180;
        _276 = _312;
    }
    float _314 = _276;
    if (_222)
    {
        float _316 = _270 * _186;
        _264 = _316;
    }
    float _318 = _264;
    if (_222)
    {
        float _320 = _270 * _192;
        _266 = _320;
    }
    float _322 = _266;
    if (_240)
    {
        float _324 = _286 * _182;
        _306 = _324;
    }
    float _326 = _306;
    if (_240)
    {
        float _328 = _286 * _188;
        _282 = _328;
    }
    float _330 = _282;
    if (_240)
    {
        float _332 = _286 * _194;
        _310 = _332;
    }
    float _334 = _310;
    bool _336 = !_302;
    float _338 = _334;
    float _356;
    if (!_336)
    {
        float _340 = in.m_63.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_122);
        float _362 = 1.0 / _360;
        float _364 = _156 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_63.x;
    float _370 = in.m_63.y;
    float _372 = in.m_63.z;
    float _374 = in.m_50.x;
    float _376 = in.m_50.y;
    float _378 = in.m_50.z;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _380;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _394 = _392 != 0;
    float _396 = 1.0 / _382;
    bool _398 = !_390;
    int _400 = _398 ? 0 : 1;
    int _402 = abs(_400);
    float _404 = _372 * 2.0;
    float _406 = _368 * 2.0;
    float _408 = _370 + _372;
    float _410 = _370 * 2.0;
    float _412 = _192 * _376;
    float _414 = _186 * _376;
    float _416 = floor(_404);
    float _418 = _408 + (-1.0);
    float _420 = fma(_190, _374, _412);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _424 = _366 + _422;
    float _426 = fma(_184, _374, _414);
    float _428 = _368 + _372;
    float _430 = _372 + (-0.5);
    float _432 = _368 + (-0.5);
    float _434 = floor(_406);
    float _436 = _370 + _368;
    float _438 = _424 * _396;
    float _440 = _428 + (-1.0);
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _436 + (-1.0);
    float _450 = _370 + (-0.5);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _416 > 0.0;
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _460 = _416 >= 0.0;
    bool _462 = isnan(_416);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_188, _378, _426);
    float _472 = fma(_194, _378, _420);
    int _474 = abs(_446);
    float _476 = floor(_410);
    bool _478 = _434 > 0.0;
    float _480 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _482 = _434 >= 0.0;
    bool _484 = isnan(_434);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    int _492 = _468 ? 0 : 1;
    int _494 = _490 ? 0 : 1;
    float _496 = _454 * _156;
    int _498 = ~_492;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    int _504 = ~_494;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = exp2(_496);
    int _512 = _502;
    int _514 = _508;
    if (!_456)
    {
        int _516 = ~_492;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    bool _522 = _476 > 0.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    bool _528 = _476 >= 0.0;
    bool _530 = isnan(_476);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    if (!_478)
    {
        int _538 = ~_494;
        int _540 = _538 + 1;
        _514 = _540;
    }
    int _542 = _514;
    float _544 = 1.0 / _526;
    float _546 = in.m_65.x;
    float _548 = in.m_65.y;
    float _550 = in.m_65.z;
    bool _552 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _554 = isnan(1.0);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _560 = _556 || _558;
    float _562 = float(_474);
    float _564 = float(_520);
    float _566 = -_510;
    float _568 = _566 + 1.0;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = float(_402);
    float _582 = _562 * _564;
    float _584 = float(_542);
    float _586 = _578 ? _568 : 0.0;
    float _588 = _582 * (-2.0);
    int _590 = _536 ? 0 : 1;
    float _592 = _580 * _584;
    if (_560)
    {
        float _594 = _586 * _544;
        _158 = _594;
    }
    float _596 = _158;
    float _598 = fma(_458, _588, _458);
    float _600 = _592 * (-2.0);
    int _602 = ~_590;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_588, _546, _546);
    int _610 = _606;
    if (!_522)
    {
        int _612 = ~_590;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = fma(_600, _548, _548);
    float _620 = fma(_442, _600, _442);
    float _622 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    bool _624 = !_394;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    float _630 = fma(_598, _596, _622);
    int _632 = abs(_626);
    float _634 = fma(_620, _596, _628);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _636;
    float _640 = float(_616);
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _644;
    float _648 = float(_632);
    float _650 = fma(_638, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _652 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _654 = isnan(_366);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _664;
    float _668 = _634 * 0.15915493667125701904296875;
    float _670 = _648 * _640;
    bool _672 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _674 = isnan(_366);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_662;
    float _686 = _684 + 1.0;
    float _688 = in.m_67.x;
    float _690 = in.m_67.y;
    float _692 = in.m_67.z;
    float _694 = _670 * (-2.0);
    float _696 = fma(_666, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _698 = fma(_646, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _700 = _682 * _686;
    float _702 = fma(_694, _550, _550);
    float _704 = in.m_69.x;
    float _706 = in.m_69.y;
    float _708 = in.m_69.z;
    float _710 = fma(_480, _694, _480);
    float _712 = _696 * _700;
    float _714 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[196].z, _702);
    float _716 = _650 * _700;
    float _718 = -_682;
    float _720 = _718 + 1.0;
    float _722 = _698 * _700;
    float _724 = fma(_710, _596, _714);
    float _726 = _642 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _712);
    float _732 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _722);
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _716);
    float _736 = _724 * 0.15915493667125701904296875;
    float _738 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].x, _730);
    float _740 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].z, _732);
    float _742 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].y, _734);
    float _744 = _668 * 6.283185482025146484375;
    float _746 = sin(_744);
    float _748 = _740 * _692;
    float _750 = _738 * _688;
    float _752 = _742 * _690;
    float _754 = in.m_61.w;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _758 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _760 = _668 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _704);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _706);
    float _768 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = in.m_59.w;
    float _772 = _764 * _758;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _708);
    float _776 = _766 * _768;
    float _778 = _642 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = _728 * _746;
    float _784 = _774 * _756;
    float _786 = _736 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _728 * _762;
    float _792 = _736 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = _780 * _746;
    float _798 = _780 * _762;
    float _800 = _470 + _770;
    float _802 = _728 * _788;
    float _804 = _780 * _788;
    float _806 = _762 * _788;
    float _808 = _746 * _788;
    float _810 = _802 * _776;
    float _812 = _804 * _776;
    float _814 = _472 + _754;
    float _816 = fma(_794, _790, _796);
    float _818 = -_776;
    float _820 = _794 * _818;
    float _822 = -_798;
    float _824 = fma(_794, _782, _822);
    float _826 = -_782;
    float _828 = fma(_794, _798, _826);
    float _830 = fma(_816, _772, _810);
    float _832 = fma(_806, _772, _820);
    float _834 = fma(_794, _796, _790);
    float _836 = fma(_828, _772, _812);
    float _838 = fma(_824, _784, _830);
    float _840 = fma(_808, _784, _832);
    float _842 = fma(_834, _784, _836);
    float _844 = _838 * _318;
    float _846 = _838 * _322;
    float _848 = _838 * _314;
    float _850 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _852 = fma(_840, _296, _844);
    float _854 = fma(_840, _300, _846);
    float _856 = fma(_840, _292, _848);
    float _858 = floor(_850);
    float _860 = fma(_842, _330, _852);
    float _862 = fma(_842, _334, _854);
    float _864 = fma(_842, _326, _856);
    float _866 = _800 + _860;
    float _868 = _814 + _862;
    float _870 = in.m_71.y;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _874 = _866 + _872;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _878 = _868 + _876;
    float _880 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _882 = _874 * _874;
    float _884 = _878 * _878;
    float _886 = -_858;
    float _888 = _850 + _886;
    float _890 = _882 + _884;
    float _892 = sqrt(_890);
    float _894 = _376 + _870;
    float _896 = _894 + _864;
    bool _898 = _892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _892 + _900;
    float _904 = 0.0;
    float _906 = _870;
    float _908 = _848;
    float _910 = _856;
    float _912 = _866;
    float _914 = _868;
    float _916 = _896;
    float _918 = _882;
    float _920 = _884;
    if (_898)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _922;
    }
    float _924 = _904;
    if (_898)
    {
        float _926 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _926;
    }
    float _928 = _906;
    if (_898)
    {
        float _930 = rsqrt(_890);
        _908 = _930;
    }
    float _932 = _908;
    float _934 = _924;
    if (_898)
    {
        float _936 = _902 * _924;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _938;
    if (_898)
    {
        float _942 = _938 * 0.15915493667125701904296875;
        _940 = _942;
    }
    float _944 = _940;
    float _946 = _902;
    if (_898)
    {
        float _948 = _944 * 6.283185482025146484375;
        float _950 = sin(_948);
        _946 = _950;
    }
    float _952 = _946;
    if (_898)
    {
        float _954 = fma(_952, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _910 = _954;
    }
    float _956 = _910;
    float _958 = floor(_880);
    float _960 = _956;
    if (_898)
    {
        float _962 = _932 * _956;
        _960 = _962;
    }
    float _964 = _960;
    if (_898)
    {
        float _966 = fma(_874, _964, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _912 = _966;
    }
    float _968 = _912;
    if (_898)
    {
        float _970 = fma(_878, _964, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _914 = _970;
    }
    float _972 = _914;
    float _974 = fma(_968, 6.2500002968590706586837768554688e-05, 0.5);
    float _976 = fma(_972, 6.2500002968590706586837768554688e-05, 0.5);
    float _978 = -_958;
    float _980 = _880 + _978;
    float2 _3533 = float2(_974, _976);
    float3 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3533, float2(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3533, float2(0.0), isnan(_3533)), level(0.0)).xyz;
    float _986 = _984.x;
    float _988 = _984.y;
    float _990 = _984.z;
    float2 _3549 = float2(_888, _980);
    float _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3549, float2(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3549, float2(0.0), isnan(_3549)), level(0.0)).x;
    float _994 = in.m_73.y;
    bool _996 = _706 != 0.0;
    bool _998 = isnan(_706);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.0);
    bool _1004 = _1000 || _1002;
    float _1006 = _944;
    if (_898)
    {
        float _1008 = _944 * 6.283185482025146484375;
        float _1010 = cos(_1008);
        _1006 = _1010;
    }
    float _1012 = _1006;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1016 = _1014 != 0;
    float _1018 = in.m_63.w;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1022 = _1020 != 0;
    bool _1024 = _704 == 0.0;
    bool _1026 = !_1004;
    bool _1028 = _1024 && _1026;
    float _1030 = in.m_75.x;
    float _1032 = in.m_75.y;
    float _1034 = in.m_75.z;
    float _1036 = in.m_73.x;
    bool _1038 = _708 == 0.0;
    bool _1040 = _1038 && _1028;
    float _1042 = _376;
    float _1044 = 1.0;
    if (_1016)
    {
        float _1046 = in.m_63.z;
        _1042 = _1046;
    }
    float _1048 = _1042;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1050 = -_994;
    float _1052 = _1050 + 1.0;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1058 = _1018 > 0.5;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1064 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _994;
    float _1068 = 1.0;
    if (_1022)
    {
        float _1070 = _1058 ? _1052 : _994;
        _1066 = _1070;
    }
    float _1072 = _1066;
    float _1074 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = 0.0;
    if (_1040)
    {
        _1076 = _1032;
    }
    float _1078 = _1076;
    float _1080 = _1078;
    if (!_1040)
    {
        float _1082 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1032);
        _1080 = _1082;
    }
    float _1084 = _1080;
    if (_1040)
    {
        _1068 = _1034;
    }
    float _1086 = _1068;
    float _1088 = _1086;
    if (!_1040)
    {
        float _1090 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1088 = _1090;
    }
    float _1092 = _1088;
    float _1094 = 0.0;
    if (_1016)
    {
        _1094 = _1036;
    }
    float _1096 = _1094;
    float _1098 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1100 = _1048 > 0.5;
    bool _1102 = _1100 && _1016;
    float _1104 = in.m_79.x;
    float _1106 = in.m_79.y;
    float _1108 = in.m_79.z;
    float _1110 = in.m_79.w;
    float _1112 = _1096;
    if (!_1016)
    {
        _1044 = _1036;
    }
    float _1114 = _1044;
    float _1116 = 0.0;
    float _1118 = _1114;
    if (_1040)
    {
        _1116 = _1030;
    }
    float _1120 = _1116;
    float _1122 = _1120;
    if (!_1040)
    {
        float _1124 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1030);
        _1122 = _1124;
    }
    float _1126 = _1122;
    out.m_81.x = _1064;
    out.m_81.y = _1074;
    out.m_81.z = _1098;
    out.m_81.w = _1062;
    if (_1102)
    {
        float _1128 = -_1096;
        float _1130 = _1128 + 1.0;
        _1112 = _1130;
    }
    float _1132 = _1112;
    if (_1016)
    {
        _1118 = _1132;
    }
    float _1134 = _1118;
    float _1136 = _804 * _1084;
    float _1138 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1140 = fma(_828, _1126, _1136);
    float _1142 = _1108 * _1030;
    float _1144 = _1106 * _1034;
    float _1146 = _1104 * _1032;
    float _1148 = -_1142;
    float _1150 = fma(_1104, _1034, _1148);
    float _1152 = -_1144;
    float _1154 = fma(_1108, _1032, _1152);
    float _1156 = -_1146;
    float _1158 = fma(_1106, _1030, _1156);
    float _1160 = -_1084;
    float _1162 = _794 * _1160;
    float _1164 = _1150 * _1110;
    float _1166 = _1154 * _1110;
    float _1168 = _1158 * _1110;
    float _1170 = -_1106;
    float _1172 = _794 * _1170;
    float _1174 = _802 * _1106;
    float _1176 = _802 * _1084;
    float _1178 = -_1164;
    float _1180 = _794 * _1178;
    float _1182 = _804 * _1106;
    float _1184 = _802 * _1164;
    float _1186 = _804 * _1164;
    float _1188 = fma(_806, _1126, _1162);
    float _1190 = fma(_816, _1126, _1176);
    float _1192 = fma(_816, _1104, _1174);
    float _1194 = fma(_828, _1104, _1182);
    float _1196 = fma(_828, _1166, _1186);
    float _1198 = fma(_806, _1166, _1180);
    float _1200 = fma(_816, _1166, _1184);
    float _1202 = fma(_808, _1092, _1188);
    float _1204 = fma(_824, _1092, _1190);
    float _1206 = fma(_834, _1092, _1140);
    float _1208 = fma(_806, _1104, _1172);
    float _1210 = fma(_824, _1108, _1192);
    float _1212 = fma(_834, _1108, _1194);
    float _1214 = fma(_824, _1168, _1200);
    float _1216 = fma(_808, _1108, _1208);
    float _1218 = _1210 * _318;
    float _1220 = _1210 * _314;
    float _1222 = _1210 * _322;
    float _1224 = fma(_808, _1168, _1198);
    float _1226 = fma(_834, _1168, _1196);
    float _1228 = _1204 * _318;
    float _1230 = _1214 * _318;
    float _1232 = _1214 * _314;
    float _1234 = _1214 * _322;
    float _1236 = fma(_1216, _296, _1218);
    float _1238 = fma(_1216, _292, _1220);
    float _1240 = fma(_1216, _300, _1222);
    float _1242 = _1216;
    float _1244 = _1228;
    if (_898)
    {
        float _1246 = _1012 + (-1.0);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = fma(_1202, _296, _1228);
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1254 = _1204 * _314;
    float _1256 = _1248;
    if (_898)
    {
        float _1258 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1258;
    }
    float _1260 = _1244;
    float _1262 = _1260;
    if (_898)
    {
        float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1266 = _968 + _1264;
        _1256 = _1266;
    }
    float _1268 = _1256;
    float _1270 = _1204 * _322;
    float _1272 = fma(_1224, _296, _1230);
    if (_898)
    {
        float _1274 = fma(_896, _1012, _1260);
        _916 = _1274;
    }
    float _1276 = _916;
    if (_898)
    {
        float _1278 = _1268 * _1268;
        _918 = _1278;
    }
    float _1280 = _918;
    if (_898)
    {
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1284 = _972 + _1282;
        _1262 = _1284;
    }
    float _1286 = _1262;
    float _1288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1292 = _1276 + _1290;
    float _1294 = fma(_1202, _292, _1254);
    if (_898)
    {
        float _1296 = _1286 * _1286;
        _920 = _1296;
    }
    float _1298 = _920;
    float _1300 = fma(_1224, _292, _1232);
    float _1302 = fma(_1292, _1292, _1280);
    float _1304 = fma(_1202, _300, _1270);
    float _1306 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1308 = fma(_1224, _300, _1234);
    float _1310 = _1302 + _1298;
    float _1312 = fma(_1212, _330, _1236);
    float _1314 = fma(_1212, _326, _1238);
    float _1316 = fma(_1212, _334, _1240);
    float _1318 = fma(_1206, _330, _1250);
    float _1320 = fma(_1226, _330, _1272);
    float _1322 = sqrt(_1310);
    float _1324 = fma(_1226, _326, _1300);
    float _1326 = fma(_1206, _326, _1294);
    float _1328 = _1306 * _1252;
    float _1330 = _1138 * _1288;
    float _1332 = fma(_1226, _334, _1308);
    float _1334 = fma(_1206, _334, _1304);
    out.m_83.x = _1312;
    out.m_83.y = _1314;
    out.m_83.z = _1316;
    out.m_85.z = _1330;
    out.m_85.w = _1328;
    out.m_87.x = _1320;
    out.m_87.y = _1324;
    out.m_87.z = _1332;
    bool _1336 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1338 = isnan(_1322);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1344 = _1340 || _1342;
    out.m_89.x = _1318;
    out.m_89.y = _1326;
    out.m_89.z = _1334;
    float _1346 = _1320;
    if (!_1344)
    {
        _338 = 1.0;
    }
    float _1348 = _338;
    out.m_91.x = _986;
    out.m_91.y = _988;
    out.m_91.z = _990;
    bool _1350 = !_1344;
    float _1352 = _1348;
    if (!_1350)
    {
        bool _1354 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1356 = isnan(_1322);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1362 = _1358 || _1360;
        if (!_1362)
        {
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1366 = _1322 + _1364;
            float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1370 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1368;
            float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1374 = _1372 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1376 = 1.0 / _1370;
            float _1378 = _1366 * _1376;
            float _1380 = fma(_1378, _1374, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1352 = _1380;
            _1382 = true;
        }
        else
        {
            bool _1384 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1386 = isnan(_1322);
            bool _1388 = _1384 || _1386;
            bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1392 = _1388 || _1390;
            if (!_1392)
            {
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1396 = _1322 + _1394;
                float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1400 = _1398 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1404 = _1402 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1406 = 1.0 / _1400;
                float _1408 = _1396 * _1406;
                float _1410 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1352 = _1410;
                _1382 = true;
            }
            else
            {
                _1352 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1382 = false;
    float _1412 = _1352;
    float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1416 = _1276 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1420 = _968 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1424 = _972 + _1422;
    float _1426 = fma(_1416, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1428 = fma(_1420, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1424, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1434 = _1426 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1438 = _1428 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1442 = _1430 + _1440;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1446 = _1434 * _1434;
    float _1448 = fma(_1438, _1438, _1446);
    float _1450 = fma(_1442, _1442, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1456 = _1438 * _1454;
    float _1458 = _1442 * _1454;
    float _1460 = _1456 * _1456;
    float _1462 = _1458 * _1458;
    float _1464 = _1460 + _1462;
    float _1466 = sqrt(_1464);
    bool _1468 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1470;
    float _1474 = _1442;
    float _1476 = _1464;
    float _1478 = _1472;
    float _1480 = _1454;
    float _1482 = _1456;
    if (_1468)
    {
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1484;
    }
    float _1486 = _1474;
    if (_1468)
    {
        float _1488 = rsqrt(_1464);
        _1476 = _1488;
    }
    float _1490 = _1476;
    float _1492 = _1490;
    if (_1468)
    {
        float _1494 = _1472 * _1486;
        _1478 = _1494;
    }
    float _1496 = _1478;
    if (_1468)
    {
        float _1498 = _1496 * 0.15915493667125701904296875;
        _1346 = _1498;
    }
    float _1500 = _1346;
    float _1502 = _1452;
    float _1504 = _1500;
    if (_1468)
    {
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1514 = precise::max(0.0, _1512);
    float _1516 = _330;
    float _1518 = _1514;
    float _1520 = _1512;
    if (_1468)
    {
        float _1522 = _1500 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1516 = _1524;
    }
    float _1526 = _1516;
    float _1528 = -_1454;
    float _1530 = -_1514;
    float _1532 = fma(_1434, _1528, _1530);
    float _1534 = _1532;
    if (_1468)
    {
        float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1536;
    }
    float _1538 = _1518;
    float _1540 = _1510;
    float _1542 = _1538;
    if (_1468)
    {
        float _1544 = fma(_1510, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1544;
    }
    float _1546 = _1540;
    float _1548 = _1546;
    if (!_1468)
    {
        _1542 = _1458;
    }
    float _1550 = _1542;
    float _1552 = _1550;
    if (_1468)
    {
        float _1554 = _1526 + (-1.0);
        _1520 = _1554;
    }
    float _1556 = _1520;
    if (_1468)
    {
        float _1558 = _1490 * _1546;
        _1480 = _1558;
    }
    float _1560 = _1480;
    if (!_1468)
    {
        _1548 = _1532;
    }
    float _1562 = _1548;
    float _1564 = _1562;
    if (_1468)
    {
        float _1566 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1566;
    }
    float _1568 = _1504;
    if (_1468)
    {
        float _1570 = _1456 * _1560;
        _1482 = _1570;
    }
    float _1572 = _1482;
    float _1574 = sqrt(_1450);
    if (!_1468)
    {
        _1492 = _1460;
    }
    float _1576 = _1492;
    float _1578 = _1576;
    if (_1468)
    {
        float _1580 = fma(_1532, _1526, _1568);
        _1564 = _1580;
    }
    float _1582 = _1564;
    if (_1468)
    {
        float _1584 = _1458 * _1560;
        _1552 = _1584;
    }
    float _1586 = _1552;
    if (_1468)
    {
        float _1588 = _1572 * _1572;
        _1578 = _1588;
    }
    float _1590 = _1578;
    if (!_1468)
    {
        _1534 = _1462;
    }
    float _1592 = _1534;
    float _1594 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1592;
    if (_1468)
    {
        float _1598 = _1586 * _1586;
        _1596 = _1598;
    }
    float _1600 = _1596;
    float _1602 = fma(_1582, _1582, _1590);
    float _1604 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1606 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1608 = _1602 + _1600;
    float _1610 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1612 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1606);
    float _1616 = rsqrt(_1608);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1620 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1618);
    float _1622 = precise::clamp(_1620, 0.0, 1.0);
    float _1624 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1610);
    float _1626 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1628 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1614);
    float _1630 = -_1622;
    float _1632 = _1630 + 1.0;
    float _1634 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1640 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1642 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1644 = abs(_1632);
    float _1646 = log2(_1644);
    float _1648 = -_1636;
    float _1650 = fma(_1648, _1444, 1.0);
    float _1652 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1642);
    float _1656 = _1616 * _1572;
    float _1658 = _1616 * _1586;
    float _1660 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1664 = _1616 * _1582;
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1668 = log2(_1650);
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1662);
    float _1672 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1674 = -_1666;
    float _1676 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1674);
    float _1678 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1670);
    float _1682 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1684 = -_1658;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1676);
    float _1688 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1690 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1692 = exp2(_1682);
    float _1694 = fma(_1686, -0.5, 0.5);
    float _1696 = fma(_1686, 0.5, 0.5);
    float _1698 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1672);
    float _1700 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1702 = _1664 + 1.0;
    float _1704 = _1668 * 0.693147182464599609375;
    float _1706 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1698);
    float _1708 = 1.0 / _1690;
    float _1710 = fma(_1696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1712 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1700);
    float _1714 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1706);
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1718 = fma(_1696, _1710, -0.212114393711090087890625);
    float _1720 = sqrt(_1694);
    float _1722 = -_1664;
    float _1724 = fma(_1692, _1702, _1722);
    float _1726 = fma(_1696, _1718, 1.570728778839111328125);
    float _1728 = fma(_1724, 0.5, 0.5);
    float _1730 = _1714 * _1708;
    float _1732 = _1712 * _1708;
    float _1734 = fma(_1730, 0.5, 0.5);
    float _1736 = fma(_1732, -0.5, 0.5);
    float _1738 = _1720 * 0.636619746685028076171875;
    float _1740 = -_1726;
    float _1742 = fma(_1738, _1740, 1.0);
    float3 _4834 = float3(_1734, _1736, _1716);
    float _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4834, float3(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4834, float3(0.0), isnan(_4834)), level(0.0)).x;
    float3 _4845 = float3(_1734, _1736, _1716);
    float4 _1747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4845, float3(0.0), isnan(_4845)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4845, float3(0.0), isnan(_4845)), level(0.0)).xyzw;
    float _1749 = _1747.x;
    float _1751 = _1747.y;
    float _1753 = _1747.z;
    float _1755 = _1747.w;
    float2 _4861 = float2(_1742, _1728);
    float3 _1757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4861, float2(0.0), isnan(_4861)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4861, float2(0.0), isnan(_4861)), level(0.0)).xyz;
    float _1759 = _1757.x;
    float _1761 = _1757.y;
    float _1763 = _1757.z;
    float _1765 = _894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = _894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1769 = -_992;
    float _1771 = _1769 + 1.0;
    out.m_93.x = _1428;
    out.m_93.y = _1426;
    out.m_93.z = _1430;
    float _1773 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1775 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1767);
    bool _1777 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1779 = isnan(_1574);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1785 = _1781 || _1783;
    float _1787 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1773);
    float _1789 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1775);
    float _1791 = _1787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1793 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = 1.0 / _1791;
    float _1797 = _1793 + _1791;
    float _1799 = _1797 * _1795;
    float _1801 = _1799 * 0.5;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1805 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1803);
    float _1807 = 1.0 / _1805;
    float _1809 = in.m_71.x;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1813 = _1807 * _1811;
    float _1815 = abs(_1813);
    float _1817 = log2(_1815);
    bool _1819 = _1813 <= 8000.0;
    bool _1821 = isnan(_1813);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(8000.0);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1833 = exp2(_1831);
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1841 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = fma(_1837, -2.0, 3.0);
    float _1845 = _1837 * _1837;
    float _1847 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1849 = exp2(_1839);
    float _1851 = _1845 * _1843;
    float _1853 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1847);
    float _1855 = -_1851;
    float _1857 = _1855 + 1.0;
    float _1859 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1861 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1851);
    float _1863 = _1859 + _1690;
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1712;
    out.gl_Position.z = _1859;
    out.gl_Position.w = _1690;
    float _1865 = _1829 * _1861;
    float _1867 = _1863 * 0.5;
    float _1869 = -_1849;
    float _1871 = _1869 + 1.0;
    float _1873 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1875 = _1771 * _1873;
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = -_1877;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1883 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1885 = _1881 * _1809;
    float _1887 = _1885 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.z = _1867;
    out.m_95.w = _1690;
    out.m_97.x = _1887;
    float _1889 = _1887;
    float _1891 = _1749;
    float _1893 = _1755;
    float _1895 = _1753;
    if (!_1785)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1897 = _1889;
    float _1899 = _1883 * _1744;
    float _1901 = -_1883;
    float _1903 = _1901 + 1.0;
    float _1905 = _1755 * _1899;
    float _1907 = _1763 * _1899;
    float _1909 = _1755 * _1903;
    float _1911 = _1903;
    float _1913 = _1905;
    float _1915 = _1897;
    float _1917 = _1897;
    if (!_1785)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1919 = _1911;
    float _1921 = fma(_1759, _1905, _1749);
    float _1923 = fma(_1761, _1905, _1751);
    float _1925 = fma(_1755, _1907, _1753);
    float _1927 = _1919;
    float _1929 = _1919;
    if (!_1785)
    {
        _1891 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1931 = _1891;
    float _1933 = _1931;
    float _1935 = _1931;
    if (!_1785)
    {
        _1893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1937 = _1893;
    out.m_99.x = _1921;
    out.m_99.y = _1923;
    out.m_99.z = _1925;
    out.m_99.w = _1909;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1785)
    {
        _1895 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1943 = _1895;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1785)
    {
        _1913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1949 = _1913;
    bool _1951 = !_1785;
    float _1953 = _1949;
    float _1955 = _1949;
    if (!_1951)
    {
        bool _1957 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1959 = isnan(_1574);
        bool _1961 = _1957 || _1959;
        bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1965 = _1961 || _1963;
        if (!_1965)
        {
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1969 = _1574 + _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1971;
            float _1975 = 1.0 / _1973;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1997 = _1969 * _1975;
            float _1999 = precise::clamp(_1997, 0.0, 1.0);
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2005 = fma(_1999, _1979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2007 = fma(_1999, _2003, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2009 = fma(_1999, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2011 = fma(_1999, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2013 = fma(_1999, _1991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2015 = fma(_1999, _1995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1917 = _2007;
            _1947 = _2013;
            _1929 = _2005;
            _1941 = _2011;
            _1935 = _2009;
            _1955 = _2015;
            _2017 = true;
        }
        else
        {
            bool _2019 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2021 = isnan(_1574);
            bool _2023 = _2019 || _2021;
            bool _2025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2027 = _2023 || _2025;
            if (!_2027)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2029 = _1927;
            _1929 = _2029;
            if (!_2027)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2031 = _1915;
            _1917 = _2031;
            if (!_2027)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2033 = _1933;
            _1935 = _2033;
            if (!_2027)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2035 = _1939;
            _1941 = _2035;
            if (!_2027)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2037 = _1945;
            _1947 = _2037;
            if (!_2027)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2039 = _1953;
            bool _2041 = !_2027;
            _1955 = _2039;
            if (!_2041)
            {
                bool _2043 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2045 = isnan(_1574);
                bool _2047 = _2043 || _2045;
                bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2051 = _2047 || _2049;
                if (!_2051)
                {
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2055 = _1574 + _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2057;
                    float _2061 = 1.0 / _2059;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2083 = _2055 * _2061;
                    float _2085 = precise::clamp(_2083, 0.0, 1.0);
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2091 = fma(_2085, _2065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2093 = fma(_2085, _2089, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2095 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2097 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2099 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2101 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1917 = _2093;
                    _1947 = _2099;
                    _1929 = _2091;
                    _1941 = _2097;
                    _1935 = _2095;
                    _1955 = _2101;
                    _2017 = true;
                }
                else
                {
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2017 = false;
    float _2103 = _1917;
    float _2105 = _1947;
    float _2107 = _1929;
    float _2109 = _1941;
    float _2111 = _1935;
    float _2113 = _1955;
    float _2115 = fma(_1326, -0.5, 0.5);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    float _2123 = -_2107;
    float _2125 = _2123 + _2109;
    float _2127 = -_2111;
    float _2129 = _2127 + _2113;
    bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = fma(_2117, _2121, _2103);
    float _2135 = fma(_2117, _2125, _2107);
    float _2137 = fma(_2117, _2129, _2111);
    float _2139 = _2133 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2141 = fma(_2135, 0.298911988735198974609375, _2139);
    float _2143 = fma(_2137, 0.114477999508380889892578125, _2141);
    out.m_101.x = 0.0;
    float _2145 = -_2143;
    float _2147 = _2135 + _2145;
    float _2149 = -_2143;
    float _2151 = _2133 + _2149;
    float _2153 = -_2143;
    float _2155 = _2137 + _2153;
    float _2157 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    float _2163 = fma(_2155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    out.m_97.w = _2157;
    out.m_103.x = _2159;
    out.m_103.y = _2161;
    out.m_103.z = _2163;
    if (!_2131)
    {
        return out;
    }
    float _2165 = -_1426;
    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2169 = -_1428;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2173 = -_1430;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2177 = _2167 * _2167;
    float _2179 = fma(_2171, _2171, _2177);
    float _2181 = fma(_2175, _2175, _2179);
    float _2183 = sqrt(_2181);
    float _2185 = rsqrt(_2181);
    float _2187 = -_2183;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2171 * _2185;
    float _2197 = _2167 * _2185;
    float _2199 = abs(_2193);
    float _2201 = log2(_2199);
    float _2203 = _2175 * _2185;
    float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2207 = _1326 * _2197;
    float _2209 = -_2197;
    float _2211 = -_2205;
    float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
    float _2215 = fma(_1318, _2195, _2207);
    float _2217 = -_2203;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
    float _2221 = fma(_1334, _2203, _2215);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2227 = _2219 + _2225;
    float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = exp2(_2229);
    float _2237 = _2235 * _2233;
    float _2239 = _2223 * _2237;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2241;
    out.m_101.y = _2243;
    out.m_101.z = _2245;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2017 = false;
    bool _1382 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_50.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_138);
        out.gl_Position.z = _2302;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_55.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_176);
        out.gl_Position.z = _2372;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = _216;
    float _226 = _208;
    if (_220)
    {
        float _228 = rsqrt(_208);
        _224 = _228;
    }
    float _230 = _224;
    float _232 = 0.0;
    float _234 = 0.0;
    if (!_220)
    {
        _232 = 0.0;
        _234 = 0.0;
    }
    float _236 = _232;
    float _238 = _234;
    bool _240 = _218 > 0.0;
    float _242 = 0.0;
    float _244 = _218;
    float _246 = _238;
    float _248 = _236;
    if (!_220)
    {
        _242 = 0.0;
    }
    float _250 = _242;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = _250;
    if (!_222)
    {
        _252 = 0.0;
        _254 = 0.0;
    }
    float _258 = _252;
    float _260 = _254;
    float _262 = _214;
    float _264 = _258;
    float _266 = _260;
    if (_222)
    {
        float _268 = rsqrt(_210);
        _262 = _268;
    }
    float _270 = _262;
    float _272 = 0.0;
    if (!_222)
    {
        _272 = 0.0;
    }
    float _274 = _272;
    float _276 = _274;
    if (!_240)
    {
        _244 = 0.0;
    }
    float _278 = _244;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    float _288 = _230;
    if (_220)
    {
        float _290 = _230 * _178;
        _246 = _290;
    }
    float _292 = _246;
    if (_220)
    {
        float _294 = _230 * _184;
        _248 = _294;
    }
    float _296 = _248;
    if (_220)
    {
        float _298 = _230 * _190;
        _256 = _298;
    }
    float _300 = _256;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _288 = 0.0;
    }
    float _304 = _288;
    float _306 = _304;
    if (!_240)
    {
        _226 = 0.0;
    }
    float _308 = _226;
    float _310 = _308;
    if (_222)
    {
        float _312 = _270 * _180;
        _276 = _312;
    }
    float _314 = _276;
    if (_222)
    {
        float _316 = _270 * _186;
        _264 = _316;
    }
    float _318 = _264;
    if (_222)
    {
        float _320 = _270 * _192;
        _266 = _320;
    }
    float _322 = _266;
    if (_240)
    {
        float _324 = _286 * _182;
        _306 = _324;
    }
    float _326 = _306;
    if (_240)
    {
        float _328 = _286 * _188;
        _282 = _328;
    }
    float _330 = _282;
    if (_240)
    {
        float _332 = _286 * _194;
        _310 = _332;
    }
    float _334 = _310;
    bool _336 = !_302;
    float _338 = _334;
    float _356;
    if (!_336)
    {
        float _340 = in.m_63.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_122);
        float _362 = 1.0 / _360;
        float _364 = _156 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_63.x;
    float _370 = in.m_63.y;
    float _372 = in.m_63.z;
    float _374 = in.m_50.x;
    float _376 = in.m_50.y;
    float _378 = in.m_50.z;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _380;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _394 = _392 != 0;
    float _396 = 1.0 / _382;
    bool _398 = !_390;
    int _400 = _398 ? 0 : 1;
    int _402 = abs(_400);
    float _404 = _372 * 2.0;
    float _406 = _368 * 2.0;
    float _408 = _370 + _372;
    float _410 = _370 * 2.0;
    float _412 = _192 * _376;
    float _414 = _186 * _376;
    float _416 = floor(_404);
    float _418 = _408 + (-1.0);
    float _420 = fma(_190, _374, _412);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _424 = _366 + _422;
    float _426 = fma(_184, _374, _414);
    float _428 = _368 + _372;
    float _430 = _372 + (-0.5);
    float _432 = _368 + (-0.5);
    float _434 = floor(_406);
    float _436 = _370 + _368;
    float _438 = _424 * _396;
    float _440 = _428 + (-1.0);
    float _442 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _436 + (-1.0);
    float _450 = _370 + (-0.5);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _416 > 0.0;
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _460 = _416 >= 0.0;
    bool _462 = isnan(_416);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_188, _378, _426);
    float _472 = fma(_194, _378, _420);
    int _474 = abs(_446);
    float _476 = floor(_410);
    bool _478 = _434 > 0.0;
    float _480 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _482 = _434 >= 0.0;
    bool _484 = isnan(_434);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    int _492 = _468 ? 0 : 1;
    int _494 = _490 ? 0 : 1;
    float _496 = _454 * _156;
    int _498 = ~_492;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    int _504 = ~_494;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = exp2(_496);
    int _512 = _502;
    int _514 = _508;
    if (!_456)
    {
        int _516 = ~_492;
        int _518 = _516 + 1;
        _512 = _518;
    }
    int _520 = _512;
    bool _522 = _476 > 0.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    bool _528 = _476 >= 0.0;
    bool _530 = isnan(_476);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    if (!_478)
    {
        int _538 = ~_494;
        int _540 = _538 + 1;
        _514 = _540;
    }
    int _542 = _514;
    float _544 = 1.0 / _526;
    float _546 = in.m_65.x;
    float _548 = in.m_65.y;
    float _550 = in.m_65.z;
    bool _552 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _554 = isnan(1.0);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _560 = _556 || _558;
    float _562 = float(_474);
    float _564 = float(_520);
    float _566 = -_510;
    float _568 = _566 + 1.0;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = float(_402);
    float _582 = _562 * _564;
    float _584 = float(_542);
    float _586 = _578 ? _568 : 0.0;
    float _588 = _582 * (-2.0);
    int _590 = _536 ? 0 : 1;
    float _592 = _580 * _584;
    if (_560)
    {
        float _594 = _586 * _544;
        _158 = _594;
    }
    float _596 = _158;
    float _598 = fma(_458, _588, _458);
    float _600 = _592 * (-2.0);
    int _602 = ~_590;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_588, _546, _546);
    int _610 = _606;
    if (!_522)
    {
        int _612 = ~_590;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = fma(_600, _548, _548);
    float _620 = fma(_442, _600, _442);
    float _622 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    bool _624 = !_394;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    float _630 = fma(_598, _596, _622);
    int _632 = abs(_626);
    float _634 = fma(_620, _596, _628);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _636;
    float _640 = float(_616);
    float _642 = _630 * 0.15915493667125701904296875;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _644;
    float _648 = float(_632);
    float _650 = fma(_638, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _652 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _654 = isnan(_366);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _664;
    float _668 = _634 * 0.15915493667125701904296875;
    float _670 = _648 * _640;
    bool _672 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _674 = isnan(_366);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_662;
    float _686 = _684 + 1.0;
    float _688 = in.m_67.x;
    float _690 = in.m_67.y;
    float _692 = in.m_67.z;
    float _694 = _670 * (-2.0);
    float _696 = fma(_666, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _698 = fma(_646, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _700 = _682 * _686;
    float _702 = fma(_694, _550, _550);
    float _704 = in.m_69.x;
    float _706 = in.m_69.y;
    float _708 = in.m_69.z;
    float _710 = fma(_480, _694, _480);
    float _712 = _696 * _700;
    float _714 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[196].z, _702);
    float _716 = _650 * _700;
    float _718 = -_682;
    float _720 = _718 + 1.0;
    float _722 = _698 * _700;
    float _724 = fma(_710, _596, _714);
    float _726 = _642 * 6.283185482025146484375;
    float _728 = cos(_726);
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _712);
    float _732 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _722);
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _716);
    float _736 = _724 * 0.15915493667125701904296875;
    float _738 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].x, _730);
    float _740 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].z, _732);
    float _742 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[144].y, _734);
    float _744 = _668 * 6.283185482025146484375;
    float _746 = sin(_744);
    float _748 = _740 * _692;
    float _750 = _738 * _688;
    float _752 = _742 * _690;
    float _754 = in.m_61.w;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _758 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _760 = _668 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _704);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _706);
    float _768 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = in.m_59.w;
    float _772 = _764 * _758;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _708);
    float _776 = _766 * _768;
    float _778 = _642 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = _728 * _746;
    float _784 = _774 * _756;
    float _786 = _736 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _728 * _762;
    float _792 = _736 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = _780 * _746;
    float _798 = _780 * _762;
    float _800 = _470 + _770;
    float _802 = _728 * _788;
    float _804 = _780 * _788;
    float _806 = _762 * _788;
    float _808 = _746 * _788;
    float _810 = _802 * _776;
    float _812 = _804 * _776;
    float _814 = _472 + _754;
    float _816 = fma(_794, _790, _796);
    float _818 = -_776;
    float _820 = _794 * _818;
    float _822 = -_798;
    float _824 = fma(_794, _782, _822);
    float _826 = -_782;
    float _828 = fma(_794, _798, _826);
    float _830 = fma(_816, _772, _810);
    float _832 = fma(_806, _772, _820);
    float _834 = fma(_794, _796, _790);
    float _836 = fma(_828, _772, _812);
    float _838 = fma(_824, _784, _830);
    float _840 = fma(_808, _784, _832);
    float _842 = fma(_834, _784, _836);
    float _844 = _838 * _318;
    float _846 = _838 * _322;
    float _848 = _838 * _314;
    float _850 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _852 = fma(_840, _296, _844);
    float _854 = fma(_840, _300, _846);
    float _856 = fma(_840, _292, _848);
    float _858 = floor(_850);
    float _860 = fma(_842, _330, _852);
    float _862 = fma(_842, _334, _854);
    float _864 = fma(_842, _326, _856);
    float _866 = _800 + _860;
    float _868 = _814 + _862;
    float _870 = in.m_71.y;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _874 = _866 + _872;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _878 = _868 + _876;
    float _880 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _882 = _874 * _874;
    float _884 = _878 * _878;
    float _886 = -_858;
    float _888 = _850 + _886;
    float _890 = _882 + _884;
    float _892 = sqrt(_890);
    float _894 = _376 + _870;
    float _896 = _894 + _864;
    bool _898 = _892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _892 + _900;
    float _904 = 0.0;
    float _906 = _870;
    float _908 = _848;
    float _910 = _856;
    float _912 = _866;
    float _914 = _868;
    float _916 = _896;
    float _918 = _882;
    float _920 = _884;
    if (_898)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _922;
    }
    float _924 = _904;
    if (_898)
    {
        float _926 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _906 = _926;
    }
    float _928 = _906;
    if (_898)
    {
        float _930 = rsqrt(_890);
        _908 = _930;
    }
    float _932 = _908;
    float _934 = _924;
    if (_898)
    {
        float _936 = _902 * _924;
        _934 = _936;
    }
    float _938 = _934;
    float _940 = _938;
    if (_898)
    {
        float _942 = _938 * 0.15915493667125701904296875;
        _940 = _942;
    }
    float _944 = _940;
    float _946 = _902;
    if (_898)
    {
        float _948 = _944 * 6.283185482025146484375;
        float _950 = sin(_948);
        _946 = _950;
    }
    float _952 = _946;
    if (_898)
    {
        float _954 = fma(_952, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _910 = _954;
    }
    float _956 = _910;
    float _958 = floor(_880);
    float _960 = _956;
    if (_898)
    {
        float _962 = _932 * _956;
        _960 = _962;
    }
    float _964 = _960;
    if (_898)
    {
        float _966 = fma(_874, _964, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _912 = _966;
    }
    float _968 = _912;
    if (_898)
    {
        float _970 = fma(_878, _964, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _914 = _970;
    }
    float _972 = _914;
    float _974 = fma(_968, 6.2500002968590706586837768554688e-05, 0.5);
    float _976 = fma(_972, 6.2500002968590706586837768554688e-05, 0.5);
    float _978 = -_958;
    float _980 = _880 + _978;
    float2 _3533 = float2(_974, _976);
    float3 _984 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3533, float2(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3533, float2(0.0), isnan(_3533)), level(0.0)).xyz;
    float _986 = _984.x;
    float _988 = _984.y;
    float _990 = _984.z;
    float2 _3549 = float2(_888, _980);
    float _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3549, float2(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3549, float2(0.0), isnan(_3549)), level(0.0)).x;
    float _994 = in.m_73.y;
    bool _996 = _706 != 0.0;
    bool _998 = isnan(_706);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.0);
    bool _1004 = _1000 || _1002;
    float _1006 = _944;
    if (_898)
    {
        float _1008 = _944 * 6.283185482025146484375;
        float _1010 = cos(_1008);
        _1006 = _1010;
    }
    float _1012 = _1006;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1016 = _1014 != 0;
    float _1018 = in.m_63.w;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1022 = _1020 != 0;
    bool _1024 = _704 == 0.0;
    bool _1026 = !_1004;
    bool _1028 = _1024 && _1026;
    float _1030 = in.m_75.x;
    float _1032 = in.m_75.y;
    float _1034 = in.m_75.z;
    float _1036 = in.m_73.x;
    bool _1038 = _708 == 0.0;
    bool _1040 = _1038 && _1028;
    float _1042 = _376;
    float _1044 = 1.0;
    if (_1016)
    {
        float _1046 = in.m_63.z;
        _1042 = _1046;
    }
    float _1048 = _1042;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1050 = -_994;
    float _1052 = _1050 + 1.0;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1058 = _1018 > 0.5;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1064 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _994;
    float _1068 = 1.0;
    if (_1022)
    {
        float _1070 = _1058 ? _1052 : _994;
        _1066 = _1070;
    }
    float _1072 = _1066;
    float _1074 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1076 = 0.0;
    if (_1040)
    {
        _1076 = _1032;
    }
    float _1078 = _1076;
    float _1080 = _1078;
    if (!_1040)
    {
        float _1082 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1032);
        _1080 = _1082;
    }
    float _1084 = _1080;
    if (_1040)
    {
        _1068 = _1034;
    }
    float _1086 = _1068;
    float _1088 = _1086;
    if (!_1040)
    {
        float _1090 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1034);
        _1088 = _1090;
    }
    float _1092 = _1088;
    float _1094 = 0.0;
    if (_1016)
    {
        _1094 = _1036;
    }
    float _1096 = _1094;
    float _1098 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1100 = _1048 > 0.5;
    bool _1102 = _1100 && _1016;
    float _1104 = in.m_79.x;
    float _1106 = in.m_79.y;
    float _1108 = in.m_79.z;
    float _1110 = in.m_79.w;
    float _1112 = _1096;
    if (!_1016)
    {
        _1044 = _1036;
    }
    float _1114 = _1044;
    float _1116 = 0.0;
    float _1118 = _1114;
    if (_1040)
    {
        _1116 = _1030;
    }
    float _1120 = _1116;
    float _1122 = _1120;
    if (!_1040)
    {
        float _1124 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1030);
        _1122 = _1124;
    }
    float _1126 = _1122;
    out.m_81.x = _1064;
    out.m_81.y = _1074;
    out.m_81.z = _1098;
    out.m_81.w = _1062;
    if (_1102)
    {
        float _1128 = -_1096;
        float _1130 = _1128 + 1.0;
        _1112 = _1130;
    }
    float _1132 = _1112;
    if (_1016)
    {
        _1118 = _1132;
    }
    float _1134 = _1118;
    float _1136 = _804 * _1084;
    float _1138 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1140 = fma(_828, _1126, _1136);
    float _1142 = _1108 * _1030;
    float _1144 = _1106 * _1034;
    float _1146 = _1104 * _1032;
    float _1148 = -_1142;
    float _1150 = fma(_1104, _1034, _1148);
    float _1152 = -_1144;
    float _1154 = fma(_1108, _1032, _1152);
    float _1156 = -_1146;
    float _1158 = fma(_1106, _1030, _1156);
    float _1160 = -_1084;
    float _1162 = _794 * _1160;
    float _1164 = _1150 * _1110;
    float _1166 = _1154 * _1110;
    float _1168 = _1158 * _1110;
    float _1170 = -_1106;
    float _1172 = _794 * _1170;
    float _1174 = _802 * _1106;
    float _1176 = _802 * _1084;
    float _1178 = -_1164;
    float _1180 = _794 * _1178;
    float _1182 = _804 * _1106;
    float _1184 = _802 * _1164;
    float _1186 = _804 * _1164;
    float _1188 = fma(_806, _1126, _1162);
    float _1190 = fma(_816, _1126, _1176);
    float _1192 = fma(_816, _1104, _1174);
    float _1194 = fma(_828, _1104, _1182);
    float _1196 = fma(_828, _1166, _1186);
    float _1198 = fma(_806, _1166, _1180);
    float _1200 = fma(_816, _1166, _1184);
    float _1202 = fma(_808, _1092, _1188);
    float _1204 = fma(_824, _1092, _1190);
    float _1206 = fma(_834, _1092, _1140);
    float _1208 = fma(_806, _1104, _1172);
    float _1210 = fma(_824, _1108, _1192);
    float _1212 = fma(_834, _1108, _1194);
    float _1214 = fma(_824, _1168, _1200);
    float _1216 = fma(_808, _1108, _1208);
    float _1218 = _1210 * _318;
    float _1220 = _1210 * _314;
    float _1222 = _1210 * _322;
    float _1224 = fma(_808, _1168, _1198);
    float _1226 = fma(_834, _1168, _1196);
    float _1228 = _1204 * _318;
    float _1230 = _1214 * _318;
    float _1232 = _1214 * _314;
    float _1234 = _1214 * _322;
    float _1236 = fma(_1216, _296, _1218);
    float _1238 = fma(_1216, _292, _1220);
    float _1240 = fma(_1216, _300, _1222);
    float _1242 = _1216;
    float _1244 = _1228;
    if (_898)
    {
        float _1246 = _1012 + (-1.0);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = fma(_1202, _296, _1228);
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1254 = _1204 * _314;
    float _1256 = _1248;
    if (_898)
    {
        float _1258 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1258;
    }
    float _1260 = _1244;
    float _1262 = _1260;
    if (_898)
    {
        float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1266 = _968 + _1264;
        _1256 = _1266;
    }
    float _1268 = _1256;
    float _1270 = _1204 * _322;
    float _1272 = fma(_1224, _296, _1230);
    if (_898)
    {
        float _1274 = fma(_896, _1012, _1260);
        _916 = _1274;
    }
    float _1276 = _916;
    if (_898)
    {
        float _1278 = _1268 * _1268;
        _918 = _1278;
    }
    float _1280 = _918;
    if (_898)
    {
        float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1284 = _972 + _1282;
        _1262 = _1284;
    }
    float _1286 = _1262;
    float _1288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1292 = _1276 + _1290;
    float _1294 = fma(_1202, _292, _1254);
    if (_898)
    {
        float _1296 = _1286 * _1286;
        _920 = _1296;
    }
    float _1298 = _920;
    float _1300 = fma(_1224, _292, _1232);
    float _1302 = fma(_1292, _1292, _1280);
    float _1304 = fma(_1202, _300, _1270);
    float _1306 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1308 = fma(_1224, _300, _1234);
    float _1310 = _1302 + _1298;
    float _1312 = fma(_1212, _330, _1236);
    float _1314 = fma(_1212, _326, _1238);
    float _1316 = fma(_1212, _334, _1240);
    float _1318 = fma(_1206, _330, _1250);
    float _1320 = fma(_1226, _330, _1272);
    float _1322 = sqrt(_1310);
    float _1324 = fma(_1226, _326, _1300);
    float _1326 = fma(_1206, _326, _1294);
    float _1328 = _1306 * _1252;
    float _1330 = _1138 * _1288;
    float _1332 = fma(_1226, _334, _1308);
    float _1334 = fma(_1206, _334, _1304);
    out.m_83.x = _1312;
    out.m_83.y = _1314;
    out.m_83.z = _1316;
    out.m_85.z = _1330;
    out.m_85.w = _1328;
    out.m_87.x = _1320;
    out.m_87.y = _1324;
    out.m_87.z = _1332;
    bool _1336 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1338 = isnan(_1322);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1344 = _1340 || _1342;
    out.m_89.x = _1318;
    out.m_89.y = _1326;
    out.m_89.z = _1334;
    float _1346 = _1320;
    if (!_1344)
    {
        _338 = 1.0;
    }
    float _1348 = _338;
    out.m_91.x = _986;
    out.m_91.y = _988;
    out.m_91.z = _990;
    bool _1350 = !_1344;
    float _1352 = _1348;
    if (!_1350)
    {
        bool _1354 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1356 = isnan(_1322);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1362 = _1358 || _1360;
        if (!_1362)
        {
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1366 = _1322 + _1364;
            float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1370 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1368;
            float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1374 = _1372 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1376 = 1.0 / _1370;
            float _1378 = _1366 * _1376;
            float _1380 = fma(_1378, _1374, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1352 = _1380;
            _1382 = true;
        }
        else
        {
            bool _1384 = _1322 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1386 = isnan(_1322);
            bool _1388 = _1384 || _1386;
            bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1392 = _1388 || _1390;
            if (!_1392)
            {
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1396 = _1322 + _1394;
                float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1400 = _1398 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1404 = _1402 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1406 = 1.0 / _1400;
                float _1408 = _1396 * _1406;
                float _1410 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1352 = _1410;
                _1382 = true;
            }
            else
            {
                _1352 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1382 = false;
    float _1412 = _1352;
    float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1416 = _1276 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1420 = _968 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1424 = _972 + _1422;
    float _1426 = fma(_1416, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1428 = fma(_1420, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1424, _1412, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1434 = _1426 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1438 = _1428 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1442 = _1430 + _1440;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1446 = _1434 * _1434;
    float _1448 = fma(_1438, _1438, _1446);
    float _1450 = fma(_1442, _1442, _1448);
    float _1452 = rsqrt(_1450);
    float _1454 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1456 = _1438 * _1454;
    float _1458 = _1442 * _1454;
    float _1460 = _1456 * _1456;
    float _1462 = _1458 * _1458;
    float _1464 = _1460 + _1462;
    float _1466 = sqrt(_1464);
    bool _1468 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1472 = _1466 + _1470;
    float _1474 = _1442;
    float _1476 = _1464;
    float _1478 = _1472;
    float _1480 = _1454;
    float _1482 = _1456;
    if (_1468)
    {
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1474 = _1484;
    }
    float _1486 = _1474;
    if (_1468)
    {
        float _1488 = rsqrt(_1464);
        _1476 = _1488;
    }
    float _1490 = _1476;
    float _1492 = _1490;
    if (_1468)
    {
        float _1494 = _1472 * _1486;
        _1478 = _1494;
    }
    float _1496 = _1478;
    if (_1468)
    {
        float _1498 = _1496 * 0.15915493667125701904296875;
        _1346 = _1498;
    }
    float _1500 = _1346;
    float _1502 = _1452;
    float _1504 = _1500;
    if (_1468)
    {
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1514 = precise::max(0.0, _1512);
    float _1516 = _330;
    float _1518 = _1514;
    float _1520 = _1512;
    if (_1468)
    {
        float _1522 = _1500 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1516 = _1524;
    }
    float _1526 = _1516;
    float _1528 = -_1454;
    float _1530 = -_1514;
    float _1532 = fma(_1434, _1528, _1530);
    float _1534 = _1532;
    if (_1468)
    {
        float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1536;
    }
    float _1538 = _1518;
    float _1540 = _1510;
    float _1542 = _1538;
    if (_1468)
    {
        float _1544 = fma(_1510, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1540 = _1544;
    }
    float _1546 = _1540;
    float _1548 = _1546;
    if (!_1468)
    {
        _1542 = _1458;
    }
    float _1550 = _1542;
    float _1552 = _1550;
    if (_1468)
    {
        float _1554 = _1526 + (-1.0);
        _1520 = _1554;
    }
    float _1556 = _1520;
    if (_1468)
    {
        float _1558 = _1490 * _1546;
        _1480 = _1558;
    }
    float _1560 = _1480;
    if (!_1468)
    {
        _1548 = _1532;
    }
    float _1562 = _1548;
    float _1564 = _1562;
    if (_1468)
    {
        float _1566 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1566;
    }
    float _1568 = _1504;
    if (_1468)
    {
        float _1570 = _1456 * _1560;
        _1482 = _1570;
    }
    float _1572 = _1482;
    float _1574 = sqrt(_1450);
    if (!_1468)
    {
        _1492 = _1460;
    }
    float _1576 = _1492;
    float _1578 = _1576;
    if (_1468)
    {
        float _1580 = fma(_1532, _1526, _1568);
        _1564 = _1580;
    }
    float _1582 = _1564;
    if (_1468)
    {
        float _1584 = _1458 * _1560;
        _1552 = _1584;
    }
    float _1586 = _1552;
    if (_1468)
    {
        float _1588 = _1572 * _1572;
        _1578 = _1588;
    }
    float _1590 = _1578;
    if (!_1468)
    {
        _1534 = _1462;
    }
    float _1592 = _1534;
    float _1594 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1592;
    if (_1468)
    {
        float _1598 = _1586 * _1586;
        _1596 = _1598;
    }
    float _1600 = _1596;
    float _1602 = fma(_1582, _1582, _1590);
    float _1604 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1606 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1608 = _1602 + _1600;
    float _1610 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1612 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1606);
    float _1616 = rsqrt(_1608);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1620 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1618);
    float _1622 = precise::clamp(_1620, 0.0, 1.0);
    float _1624 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1610);
    float _1626 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1628 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1614);
    float _1630 = -_1622;
    float _1632 = _1630 + 1.0;
    float _1634 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1640 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1642 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1644 = abs(_1632);
    float _1646 = log2(_1644);
    float _1648 = -_1636;
    float _1650 = fma(_1648, _1444, 1.0);
    float _1652 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1642);
    float _1656 = _1616 * _1572;
    float _1658 = _1616 * _1586;
    float _1660 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1664 = _1616 * _1582;
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1668 = log2(_1650);
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1662);
    float _1672 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1674 = -_1666;
    float _1676 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1674);
    float _1678 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1680 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1670);
    float _1682 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1684 = -_1658;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1676);
    float _1688 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1678);
    float _1690 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1692 = exp2(_1682);
    float _1694 = fma(_1686, -0.5, 0.5);
    float _1696 = fma(_1686, 0.5, 0.5);
    float _1698 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1672);
    float _1700 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1688);
    float _1702 = _1664 + 1.0;
    float _1704 = _1668 * 0.693147182464599609375;
    float _1706 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1698);
    float _1708 = 1.0 / _1690;
    float _1710 = fma(_1696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1712 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1700);
    float _1714 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1706);
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1718 = fma(_1696, _1710, -0.212114393711090087890625);
    float _1720 = sqrt(_1694);
    float _1722 = -_1664;
    float _1724 = fma(_1692, _1702, _1722);
    float _1726 = fma(_1696, _1718, 1.570728778839111328125);
    float _1728 = fma(_1724, 0.5, 0.5);
    float _1730 = _1714 * _1708;
    float _1732 = _1712 * _1708;
    float _1734 = fma(_1730, 0.5, 0.5);
    float _1736 = fma(_1732, -0.5, 0.5);
    float _1738 = _1720 * 0.636619746685028076171875;
    float _1740 = -_1726;
    float _1742 = fma(_1738, _1740, 1.0);
    float3 _4834 = float3(_1734, _1736, _1716);
    float _1744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4834, float3(0.0), isnan(_4834)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4834, float3(0.0), isnan(_4834)), level(0.0)).x;
    float3 _4845 = float3(_1734, _1736, _1716);
    float4 _1747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4845, float3(0.0), isnan(_4845)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4845, float3(0.0), isnan(_4845)), level(0.0)).xyzw;
    float _1749 = _1747.x;
    float _1751 = _1747.y;
    float _1753 = _1747.z;
    float _1755 = _1747.w;
    float2 _4861 = float2(_1742, _1728);
    float3 _1757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4861, float2(0.0), isnan(_4861)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4861, float2(0.0), isnan(_4861)), level(0.0)).xyz;
    float _1759 = _1757.x;
    float _1761 = _1757.y;
    float _1763 = _1757.z;
    float _1765 = _894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = _894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1769 = -_992;
    float _1771 = _1769 + 1.0;
    out.m_93.x = _1428;
    out.m_93.y = _1426;
    out.m_93.z = _1430;
    float _1773 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1775 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1767);
    bool _1777 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1779 = isnan(_1574);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1785 = _1781 || _1783;
    float _1787 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1773);
    float _1789 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1775);
    float _1791 = _1787 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1793 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1795 = 1.0 / _1791;
    float _1797 = _1793 + _1791;
    float _1799 = _1797 * _1795;
    float _1801 = _1799 * 0.5;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1805 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1803);
    float _1807 = 1.0 / _1805;
    float _1809 = in.m_71.x;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1813 = _1807 * _1811;
    float _1815 = abs(_1813);
    float _1817 = log2(_1815);
    bool _1819 = _1813 <= 8000.0;
    bool _1821 = isnan(_1813);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(8000.0);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1833 = exp2(_1831);
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1841 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = fma(_1837, -2.0, 3.0);
    float _1845 = _1837 * _1837;
    float _1847 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1849 = exp2(_1839);
    float _1851 = _1845 * _1843;
    float _1853 = fma(_1626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1847);
    float _1855 = -_1851;
    float _1857 = _1855 + 1.0;
    float _1859 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1861 = fma(_1857, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1851);
    float _1863 = _1859 + _1690;
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1712;
    out.gl_Position.z = _1859;
    out.gl_Position.w = _1690;
    float _1865 = _1829 * _1861;
    float _1867 = _1863 * 0.5;
    float _1869 = -_1849;
    float _1871 = _1869 + 1.0;
    float _1873 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1875 = _1771 * _1873;
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = -_1877;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1883 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1885 = _1881 * _1809;
    float _1887 = _1885 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.z = _1867;
    out.m_95.w = _1690;
    out.m_97.x = _1887;
    float _1889 = _1887;
    float _1891 = _1749;
    float _1893 = _1755;
    float _1895 = _1753;
    if (!_1785)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1897 = _1889;
    float _1899 = _1883 * _1744;
    float _1901 = -_1883;
    float _1903 = _1901 + 1.0;
    float _1905 = _1755 * _1899;
    float _1907 = _1763 * _1899;
    float _1909 = _1755 * _1903;
    float _1911 = _1903;
    float _1913 = _1905;
    float _1915 = _1897;
    float _1917 = _1897;
    if (!_1785)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1919 = _1911;
    float _1921 = fma(_1759, _1905, _1749);
    float _1923 = fma(_1761, _1905, _1751);
    float _1925 = fma(_1755, _1907, _1753);
    float _1927 = _1919;
    float _1929 = _1919;
    if (!_1785)
    {
        _1891 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1931 = _1891;
    float _1933 = _1931;
    float _1935 = _1931;
    if (!_1785)
    {
        _1893 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1937 = _1893;
    out.m_99.x = _1921;
    out.m_99.y = _1923;
    out.m_99.z = _1925;
    out.m_99.w = _1909;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1785)
    {
        _1895 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1943 = _1895;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1785)
    {
        _1913 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1949 = _1913;
    bool _1951 = !_1785;
    float _1953 = _1949;
    float _1955 = _1949;
    if (!_1951)
    {
        bool _1957 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1959 = isnan(_1574);
        bool _1961 = _1957 || _1959;
        bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1965 = _1961 || _1963;
        if (!_1965)
        {
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1969 = _1574 + _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1971;
            float _1975 = 1.0 / _1973;
            float _1977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1979 = _1977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1997 = _1969 * _1975;
            float _1999 = precise::clamp(_1997, 0.0, 1.0);
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2005 = fma(_1999, _1979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2007 = fma(_1999, _2003, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2009 = fma(_1999, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2011 = fma(_1999, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2013 = fma(_1999, _1991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2015 = fma(_1999, _1995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1917 = _2007;
            _1947 = _2013;
            _1929 = _2005;
            _1941 = _2011;
            _1935 = _2009;
            _1955 = _2015;
            _2017 = true;
        }
        else
        {
            bool _2019 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2021 = isnan(_1574);
            bool _2023 = _2019 || _2021;
            bool _2025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2027 = _2023 || _2025;
            if (!_2027)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2029 = _1927;
            _1929 = _2029;
            if (!_2027)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2031 = _1915;
            _1917 = _2031;
            if (!_2027)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2033 = _1933;
            _1935 = _2033;
            if (!_2027)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2035 = _1939;
            _1941 = _2035;
            if (!_2027)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2037 = _1945;
            _1947 = _2037;
            if (!_2027)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2039 = _1953;
            bool _2041 = !_2027;
            _1955 = _2039;
            if (!_2041)
            {
                bool _2043 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2045 = isnan(_1574);
                bool _2047 = _2043 || _2045;
                bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2051 = _2047 || _2049;
                if (!_2051)
                {
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2055 = _1574 + _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2057;
                    float _2061 = 1.0 / _2059;
                    float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2083 = _2055 * _2061;
                    float _2085 = precise::clamp(_2083, 0.0, 1.0);
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2091 = fma(_2085, _2065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2093 = fma(_2085, _2089, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2095 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2097 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2099 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2101 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1917 = _2093;
                    _1947 = _2099;
                    _1929 = _2091;
                    _1941 = _2097;
                    _1935 = _2095;
                    _1955 = _2101;
                    _2017 = true;
                }
                else
                {
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2017 = false;
    float _2103 = _1917;
    float _2105 = _1947;
    float _2107 = _1929;
    float _2109 = _1941;
    float _2111 = _1935;
    float _2113 = _1955;
    float _2115 = fma(_1326, -0.5, 0.5);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    float _2123 = -_2107;
    float _2125 = _2123 + _2109;
    float _2127 = -_2111;
    float _2129 = _2127 + _2113;
    bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = fma(_2117, _2121, _2103);
    float _2135 = fma(_2117, _2125, _2107);
    float _2137 = fma(_2117, _2129, _2111);
    float _2139 = _2133 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2141 = fma(_2135, 0.298911988735198974609375, _2139);
    float _2143 = fma(_2137, 0.114477999508380889892578125, _2141);
    out.m_101.x = 0.0;
    float _2145 = -_2143;
    float _2147 = _2135 + _2145;
    float _2149 = -_2143;
    float _2151 = _2133 + _2149;
    float _2153 = -_2143;
    float _2155 = _2137 + _2153;
    float _2157 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = fma(_2147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    float _2163 = fma(_2155, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2143);
    out.m_97.w = _2157;
    out.m_103.x = _2159;
    out.m_103.y = _2161;
    out.m_103.z = _2163;
    if (!_2131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2165 = -_1426;
    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2169 = -_1428;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2173 = -_1430;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2177 = _2167 * _2167;
    float _2179 = fma(_2171, _2171, _2177);
    float _2181 = fma(_2175, _2175, _2179);
    float _2183 = sqrt(_2181);
    float _2185 = rsqrt(_2181);
    float _2187 = -_2183;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2171 * _2185;
    float _2197 = _2167 * _2185;
    float _2199 = abs(_2193);
    float _2201 = log2(_2199);
    float _2203 = _2175 * _2185;
    float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2207 = _1326 * _2197;
    float _2209 = -_2197;
    float _2211 = -_2205;
    float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
    float _2215 = fma(_1318, _2195, _2207);
    float _2217 = -_2203;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
    float _2221 = fma(_1334, _2203, _2215);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2227 = _2219 + _2225;
    float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = exp2(_2229);
    float _2237 = _2235 * _2233;
    float _2239 = _2223 * _2237;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2241;
    out.m_101.y = _2243;
    out.m_101.z = _2245;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

