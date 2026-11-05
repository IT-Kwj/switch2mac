#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_101 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_81 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_77 [[attribute(10)]];
    float4 m_75 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
    bool _1262 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2919 = as_type<float>(_138);
        out.gl_Position.z = _2919;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_63.w;
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
        out.m_61.x = 0.0;
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
        float _2989 = as_type<float>(_176);
        out.gl_Position.z = _2989;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
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
    float _224 = _214;
    float _226 = _178;
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
    float _244 = _238;
    float _246 = _236;
    if (!_220)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = _248;
    if (!_222)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _256 = _250;
    float _258 = _252;
    float _260 = _216;
    float _262 = _256;
    float _264 = _258;
    if (_222)
    {
        float _266 = rsqrt(_210);
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (!_222)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = _272;
    if (!_240)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    if (_220)
    {
        float _288 = _230 * _184;
        _254 = _288;
    }
    float _290 = _254;
    if (_220)
    {
        float _292 = _230 * _178;
        _244 = _292;
    }
    float _294 = _244;
    if (_220)
    {
        float _296 = _230 * _190;
        _246 = _296;
    }
    float _298 = _246;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 0.0;
    float _304 = _298;
    if (!_240)
    {
        _302 = 0.0;
    }
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _306;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _312 = _308;
    float _314 = _312;
    if (_222)
    {
        float _316 = _268 * _186;
        _262 = _316;
    }
    float _318 = _262;
    if (_222)
    {
        float _320 = _268 * _180;
        _264 = _320;
    }
    float _322 = _264;
    if (_222)
    {
        float _324 = _268 * _192;
        _276 = _324;
    }
    float _326 = _276;
    if (_240)
    {
        float _328 = _286 * _188;
        _282 = _328;
    }
    float _330 = _282;
    if (_240)
    {
        float _332 = _286 * _182;
        _310 = _332;
    }
    float _334 = _310;
    if (_240)
    {
        float _336 = _286 * _194;
        _314 = _336;
    }
    float _338 = _314;
    bool _340 = !_300;
    float _358;
    if (!_340)
    {
        float _342 = in.m_71.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_122);
        float _364 = 1.0 / _362;
        float _366 = _156 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_71.z;
    bool _376 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    float _386 = in.m_71.x;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _400 = 1.0 + _398;
    float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _404 = in.m_71.y;
    bool _406 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_368);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _372 * _156;
    float _420 = 1.0 / _400;
    bool _422 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _424 = isnan(_368);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -_416;
    float _436 = _434 + 1.0;
    float _438 = _432 * _436;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = exp2(_418);
    float _446 = _374 * 2.0;
    float _448 = _386 * 2.0;
    float _450 = floor(_446);
    float _452 = _404 * 2.0;
    float _454 = floor(_448);
    float _456 = -_444;
    float _458 = _456 + 1.0;
    float _460 = _384 ? _458 : 0.0;
    float _462 = floor(_452);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _474 = _472 != 0;
    if (_396)
    {
        float _476 = _460 * _420;
        _158 = _476;
    }
    float _478 = _158;
    bool _480 = _450 > 0.0;
    bool _482 = _450 >= 0.0;
    bool _484 = isnan(_450);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _454 > 0.0;
    bool _494 = _454 >= 0.0;
    bool _496 = isnan(_454);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    bool _504 = !_466;
    int _506 = _504 ? 0 : 1;
    bool _508 = !_470;
    int _510 = _508 ? 0 : 1;
    bool _512 = !_474;
    int _514 = _512 ? 0 : 1;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _526 = _524 != 0;
    int _528 = _502 ? 0 : 1;
    int _530 = _490 ? 0 : 1;
    bool _532 = !_522;
    int _534 = _532 ? 0 : 1;
    int _536 = ~_528;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    int _542 = _540;
    if (!_492)
    {
        int _544 = ~_528;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    int _550 = abs(_534);
    float _552 = _478 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _554 = _462 > 0.0;
    bool _556 = _462 >= 0.0;
    bool _558 = isnan(_462);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _552 * _402;
    float _568 = float(_548);
    float _570 = float(_550);
    float _572 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[203].x, _566);
    int _574 = _564 ? 0 : 1;
    float _576 = _404 + _374;
    bool _578 = !_518;
    int _580 = _578 ? 0 : 1;
    float _582 = _570 * _568;
    int _584 = ~_574;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = in.m_73.x;
    float _592 = in.m_73.y;
    float _594 = in.m_73.z;
    int _596 = _588;
    if (!_554)
    {
        int _598 = ~_574;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = floor(_572);
    float _606 = _572 + 0.25;
    bool _608 = !_526;
    int _610 = _608 ? 0 : 1;
    float _612 = _576 + (-1.0);
    float _614 = float(_602);
    float _616 = _582 * (-2.0);
    int _618 = ~_530;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = floor(_606);
    int _626 = _622;
    if (!_480)
    {
        int _628 = ~_530;
        int _630 = _628 + 1;
        _626 = _630;
    }
    int _632 = _626;
    float _634 = _386 + _374;
    int _636 = abs(_610);
    float _638 = _374 + (-0.5);
    int _640 = abs(_580);
    float _642 = _634 + (-1.0);
    float _644 = float(_632);
    float _646 = -_604;
    float _648 = _572 + _646;
    float _650 = float(_636);
    float _652 = _572 * 6.283185482025146484375;
    float _654 = float(_640);
    float _656 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _658 = _648 >= 0.5;
    bool _660 = isnan(_648);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.5);
    bool _666 = _662 || _664;
    float _668 = _650 * _614;
    float _670 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _672 = _654 * _644;
    float _674 = fma(_616, _592, _592);
    float _676 = _652 * 0.15915493667125701904296875;
    float _678 = -_624;
    float _680 = _606 + _678;
    float _682 = _668 * (-2.0);
    float _684 = fma(_656, _616, _656);
    float _686 = in.m_75.x;
    float _688 = fma(_670, _682, _670);
    float _690 = _676 * 6.283185482025146484375;
    float _692 = sin(_690);
    bool _694 = _680 > 0.5;
    float _696 = fma(_682, _594, _594);
    int _698 = abs(_510);
    float _700 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _702 = _404 + (-0.5);
    bool _704 = !_666;
    float _706 = _704 ? 0.5 : (-0.5);
    float _708 = fma(_688, _478, _700);
    int _710 = abs(_506);
    float _712 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _714 = float(_698);
    float _716 = _706 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _718 = _716 * 2.0;
    float _720 = _680;
    if (_694)
    {
        float _722 = -_680;
        float _724 = _722 + 1.0;
        _720 = _724;
    }
    float _726 = _720;
    int _728 = abs(_514);
    float _730 = _714 * _718;
    float _732 = float(_710);
    float _734 = _692 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _736 = fma(_726, 4.0, -1.0);
    float _738 = float(_728);
    float _740 = fma(_684, _478, _712);
    float _742 = fma(_732, _734, _730);
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _746 = in.m_58.x;
    float _748 = in.m_58.y;
    float _750 = in.m_58.z;
    float _752 = _386 + _404;
    float _754 = fma(_738, _744, _742);
    float _756 = _672 * (-2.0);
    float _758 = _752 + (-1.0);
    float _760 = _708 * 0.15915493667125701904296875;
    float _762 = fma(_754, 3.1415927410125732421875, _590);
    float _764 = _386 + (-0.5);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _772 = fma(_762, _756, _762);
    float _774 = _740 * 0.15915493667125701904296875;
    float _776 = in.m_77.x;
    float _778 = in.m_77.y;
    float _780 = in.m_77.z;
    float _782 = fma(_766, _756, _766);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _772);
    float _786 = 1.0 / _770;
    float _788 = in.m_79.x;
    float _790 = in.m_79.y;
    float _792 = in.m_79.z;
    float _794 = fma(_782, _478, _784);
    bool _796 = _404 > 0.5;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _800 = _798 != 0;
    float _802 = _794 * 0.15915493667125701904296875;
    float _804 = _192 * _748;
    float _806 = _760 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _186 * _748;
    float _812 = _180 * _748;
    float _814 = fma(_190, _746, _804);
    float _816 = fma(_184, _746, _810);
    bool _818 = _386 > 0.5;
    bool _820 = _818 && _800;
    float _822 = fma(_194, _750, _814);
    float _824 = _760 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _828;
    float _832 = fma(_188, _750, _816);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _836 = _834 != 0;
    float _838 = _778 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _840 = _780 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _842 = _830 * _786;
    float _844 = _776 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _846 = _802 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _790);
    float _852 = _838 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _792);
    float _856 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _368 + _858;
    float _862 = _852 * _850;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _866 = _802 * 6.283185482025146484375;
    float _868 = cos(_866);
    float _870 = _856 * _854;
    float _872 = fma(_842, _860, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _876 = _832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _878 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _880 = in.m_75.y;
    float _882 = _874 * _864;
    float _884 = _774 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _848 * _808;
    float _890 = _848 * _826;
    bool _892 = _790 != 0.0;
    bool _894 = isnan(_790);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = fma(_178, _746, _812);
    float _904 = 0.0;
    float _906 = _792;
    if (_800)
    {
        _904 = _686;
    }
    float _908 = _904;
    float _910 = _872 * _438;
    bool _912 = _788 == 0.0;
    bool _914 = !_900;
    bool _916 = _912 && _914;
    float _918 = _774 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _868 * _826;
    float _924 = _868 * _808;
    bool _926 = _792 == 0.0;
    bool _928 = _926 && _916;
    float _930 = fma(_182, _750, _902);
    float _932 = _908;
    if (_820)
    {
        float _934 = -_908;
        float _936 = _934 + 1.0;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _910);
    if (!_800)
    {
        _226 = _686;
    }
    float _942 = _226;
    float _944 = _886 * _808;
    float _946 = _848 * _886;
    float _948 = _886 * _826;
    float _950 = _868 * _886;
    float _952 = _942;
    if (_800)
    {
        _952 = _938;
    }
    float _954 = _952;
    float _956 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[116].x, _940);
    float _958 = -_880;
    float _960 = _958 + 1.0;
    float _962 = fma(_920, _888, _922);
    float _964 = -_924;
    float _966 = fma(_920, _890, _964);
    float _968 = -_890;
    float _970 = fma(_920, _924, _968);
    float _972 = fma(_920, _922, _888);
    float _974 = _962 * _862;
    float _976 = _966 * _862;
    float _978 = _946 * _862;
    float _980 = _880;
    if (_836)
    {
        float _982 = _796 ? _960 : _880;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = fma(_944, _882, _974);
    float _988 = fma(_948, _882, _976);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _992 = fma(_970, _870, _986);
    float _994 = -_920;
    float _996 = fma(_994, _882, _978);
    float _998 = fma(_972, _870, _988);
    float _1000 = _992 * _318;
    float _1002 = _992 * _326;
    float _1004 = fma(_950, _870, _996);
    float _1006 = _992 * _322;
    float _1008 = fma(_998, _290, _1000);
    float _1010 = fma(_998, _298, _1002);
    float _1012 = fma(_998, _294, _1006);
    float _1014 = fma(_1004, _330, _1008);
    float _1016 = fma(_1004, _338, _1010);
    float _1018 = in.m_81.x;
    float _1020 = in.m_81.y;
    float _1022 = in.m_81.z;
    float _1024 = _876 + _1014;
    float _1026 = _878 + _1016;
    float _1028 = fma(_1004, _334, _1012);
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1024 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1036 = _1026 + _1034;
    float _1038 = _1032 * _1032;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 + _1040;
    float _1044 = sqrt(_1042);
    float _1046 = _1020;
    float _1048 = _1018;
    float _1050 = _1022;
    float _1052 = _1038;
    float _1054 = _1040;
    float _1056 = _1024;
    float _1058 = _1026;
    if (!_928)
    {
        float _1060 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1046 = _1060;
    }
    float _1062 = _1046;
    if (!_928)
    {
        float _1064 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1018);
        _1048 = _1064;
    }
    float _1066 = _1048;
    if (!_928)
    {
        float _1068 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1022);
        _1050 = _1068;
    }
    float _1070 = _1050;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1074 = _962 * _1062;
    float _1076 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1078 = _946 * _1062;
    float _1080 = _966 * _1062;
    float _1082 = fma(_944, _1066, _1074);
    bool _1084 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = -_920;
    float _1088 = fma(_1086, _1066, _1078);
    float _1090 = fma(_970, _1070, _1082);
    float _1092 = _1076 + _1028;
    float _1094 = fma(_948, _1066, _1080);
    float _1096 = fma(_950, _1070, _1088);
    float _1098 = fma(_972, _1070, _1094);
    float _1100 = _1096;
    if (!_1084)
    {
        _906 = _1092;
    }
    float _1102 = _906;
    bool _1104 = !_1084;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1112 = _1044 + _1110;
        float _1114 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = rsqrt(_1042);
        float _1118 = _1112 * _1108;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1120 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = fma(_1124, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = _1116 * _1130;
        float _1134 = _1128 + (-1.0);
        float _1136 = fma(_1032, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1036, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1140 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1144 = _1136 + _1142;
        float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1148 = _1138 + _1146;
        float _1150 = fma(_1092, _1128, _1140);
        float _1152 = _1144 * _1144;
        float _1154 = _1148 * _1148;
        _1106 = _1150;
        _1052 = _1152;
        _1054 = _1154;
        _1056 = _1136;
        _1058 = _1138;
    }
    float _1156 = _1106;
    float _1158 = _1052;
    float _1160 = _1054;
    float _1162 = _1056;
    float _1164 = _1058;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1168 = _1156 + _1166;
    float _1170 = _1090 * _318;
    float _1172 = _1090 * _322;
    float _1174 = _1090 * _326;
    float _1176 = fma(_1168, _1168, _1158);
    float _1178 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1180 = fma(_1098, _290, _1170);
    float _1182 = fma(_1098, _294, _1172);
    float _1184 = _1176 + _1160;
    float _1186 = fma(_1098, _298, _1174);
    float _1188 = _1178 * _1072;
    float _1190 = _954 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1192 = sqrt(_1184);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1198 = _1190 * _990;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1202 = fma(_1096, _334, _1182);
    float _1204 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1206 = fma(_1096, _330, _1180);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1210 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = fma(_1096, _338, _1186);
    out.m_83.w = _1208;
    bool _1218 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1220 = isnan(_1192);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1226 = _1222 || _1224;
    out.m_85.x = _1198;
    out.m_85.y = _1188;
    out.m_87.x = _1210;
    out.m_87.y = _1212;
    out.m_87.z = _1214;
    out.m_87.w = _1204;
    out.m_89.x = _1206;
    out.m_89.y = _1202;
    out.m_89.z = _1216;
    if (!_1226)
    {
        _1100 = 1.0;
    }
    float _1228 = _1100;
    bool _1230 = !_1226;
    float _1232 = _1228;
    if (!_1230)
    {
        bool _1234 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1236 = isnan(_1192);
        bool _1238 = _1234 || _1236;
        bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1242 = _1238 || _1240;
        if (!_1242)
        {
            float _1244 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1246 = _1192 + _1244;
            float _1248 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1250 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1248;
            float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1254 = _1252 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1256 = 1.0 / _1250;
            float _1258 = _1246 * _1256;
            float _1260 = fma(_1258, _1254, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1232 = _1260;
            _1262 = true;
        }
        else
        {
            bool _1264 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1266 = isnan(_1192);
            bool _1268 = _1264 || _1266;
            bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1272 = _1268 || _1270;
            if (!_1272)
            {
                float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1276 = _1192 + _1274;
                float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1280 = _1278 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1284 = _1282 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1286 = 1.0 / _1280;
                float _1288 = _1276 * _1286;
                float _1290 = fma(_1288, _1284, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1232 = _1290;
                _1262 = true;
            }
            else
            {
                _1232 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1262 = false;
    float _1292 = _1232;
    float _1294 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1298 = _1156 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1302 = _1162 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1306 = _1164 + _1304;
    float _1308 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1294);
    float _1310 = fma(_1298, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1312 = fma(_1302, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1314 = fma(_1306, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1316 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1308);
    float _1318 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1310 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1312 + _1324;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1318);
    float _1332 = _1322 * _1322;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1336 = _1314 + _1334;
    float _1338 = 1.0 / _1328;
    float _1340 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1330);
    float _1342 = fma(_1326, _1326, _1332);
    float _1344 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1348 = fma(_1336, _1336, _1342);
    float _1350 = _1346 + _1328;
    float _1352 = rsqrt(_1348);
    float _1354 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1356 = _1076 + _1354;
    float _1358 = _1350 * _1338;
    float _1360 = _1358 * 0.5;
    float _1362 = sqrt(_1348);
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1366);
    float _1370 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1372 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1364);
    float _1374 = 1.0 / _1368;
    float _1376 = _1326 * _1352;
    float _1378 = _1336 * _1352;
    float _1380 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1372);
    float _1382 = _1322 * _1352;
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1384 * _1384;
    float _1394 = _1386 * _1386;
    float _1396 = trunc(_1388);
    int _1398 = int(_1396);
    float _1400 = _1392 + _1394;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1374 * _1402;
    float _1406 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1408 = sqrt(_1400);
    bool _1410 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1412 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1406);
    bool _1414 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1416 = !_1410;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1412);
    int _1422 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1424 = _1398 + _1422;
    int _1426 = _1424 + 1;
    float _1428 = floor(_1370);
    float _1430 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1432 = 2;
    int _1434 = _1426;
    float _1436 = _1384;
    float _1438 = _1386;
    float _1440 = _1392;
    float _1442 = _1394;
    if (!_1410)
    {
        _1432 = 1;
    }
    int _1444 = _1432;
    int _1446 = _1444;
    if (!_1414)
    {
        _1446 = _1418;
    }
    int _1448 = _1446;
    float _1450 = trunc(_1430);
    int _1452 = int(_1450);
    bool _1454 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1458 = _1408 + _1456;
    int _1460 = _1448 << 6;
    bool _1462 = _1426 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1464 = _1460 + 96;
    uint _1467 = uint(int(uint(_1464) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.vp_c15)._m0[int(_1477)][_1479];
    float _1483 = -_1428;
    float _1485 = _1370 + _1483;
    float _1487 = _1164;
    float _1489 = _1458;
    if (_1454)
    {
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1487 = _1491;
    }
    float _1493 = _1487;
    int _1495 = _1460 + 104;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1515 = _1452 + _1513;
    int _1517 = _1515 + 1;
    int _1519 = _1426 | _1517;
    bool _1521 = _1519 < 0;
    bool _1523 = _1521 || _1462;
    float _1525 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1527 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1529 = _1527 || _1523;
    if (_1454)
    {
        float _1531 = _1458 * _1493;
        _1489 = _1531;
    }
    float _1533 = _1489;
    float _1535 = precise::max(0.0, _1525);
    if (_1454)
    {
        float _1537 = _1533 * 0.15915493667125701904296875;
        _304 = _1537;
    }
    float _1539 = _304;
    float _1541 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1543 = -_1382;
    float _1545 = -_1535;
    float _1547 = fma(_1543, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1545);
    float _1549 = _1182;
    float _1551 = _1547;
    if (_1454)
    {
        float _1553 = _1539 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1549 = _1555;
    }
    float _1557 = _1549;
    float _1559 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1541);
    if (!_1529)
    {
        int _1561 = _1517 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1563 = _1561 + _1426;
        _1434 = _1563;
    }
    int _1565 = _1434;
    float _1567 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1569 = _1493;
    if (_1454)
    {
        float _1571 = _1539 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        _1569 = _1573;
    }
    float _1575 = _1569;
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1579 = 0;
    if (!_1529)
    {
        int _1581 = _1565 << 2;
        _1579 = _1581;
    }
    int _1583 = _1579;
    int _1585 = 0;
    int _1587 = _1583;
    if (!_1529)
    {
        uint _1589 = uint(int(uint(_1565) >> uint(2)));
        _1585 = int(_1589);
    }
    int _1591 = _1585;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_1529)
    {
        int _1595 = 12 & _1583;
        _1587 = _1595;
    }
    int _1597 = _1587;
    float _1599 = _1567;
    if (_1454)
    {
        float _1601 = rsqrt(_1400);
        _1599 = _1601;
    }
    float _1603 = _1599;
    float _1605 = _1356 * _1481;
    float _1607 = _1481;
    float _1609 = _1605;
    if (_1454)
    {
        float _1611 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1607 = _1611;
    }
    float _1613 = _1607;
    float _1615 = -_1593;
    float _1617 = fma(_1615, _1390, 1.0);
    float _1619 = fma(_876, _1473, _1605);
    float _1621 = _1557;
    float _1623 = _1613;
    if (_1454)
    {
        float _1625 = fma(_1557, _1613, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1621 = _1625;
    }
    float _1627 = _1621;
    if (_1454)
    {
        float _1629 = _1575 + (-1.0);
        _1609 = _1629;
    }
    float _1631 = _1609;
    float _1633 = fma(_878, _1503, _1619);
    float _1635 = log2(_1617);
    if (_1454)
    {
        float _1637 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1623 = _1637;
    }
    float _1639 = _1623;
    float _1641 = _1633 + _1511;
    int _1643 = _1460 + 72;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    float _1661 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1663 = _1603;
    if (_1454)
    {
        float _1665 = _1603 * _1627;
        _1663 = _1665;
    }
    float _1667 = _1663;
    if (_1454)
    {
        float _1669 = fma(_1547, _1575, _1639);
        _1551 = _1669;
    }
    float _1671 = _1551;
    float _1673 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1675 = floor(_1661);
    if (_1454)
    {
        float _1677 = _1384 * _1667;
        _1436 = _1677;
    }
    float _1679 = _1436;
    if (_1454)
    {
        float _1681 = _1386 * _1667;
        _1438 = _1681;
    }
    float _1683 = _1438;
    int _1685 = _1460 + 64;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    if (_1454)
    {
        float _1703 = _1679 * _1679;
        _1440 = _1703;
    }
    float _1705 = _1440;
    if (_1454)
    {
        float _1707 = _1683 * _1683;
        _1442 = _1707;
    }
    float _1709 = _1442;
    float _1711 = _1635 * 0.693147182464599609375;
    float _1713 = fma(_1671, _1671, _1705);
    float _1715 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1717 = _1460 + 48;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    float _1735 = _1713 + _1709;
    float _1737 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1715);
    float _1739 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1673);
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1743 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1741);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1344);
    float _1749 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1737);
    int _1751 = _1460 + 56;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1739);
    float _1771 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1773 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1775 = -_1745;
    float _1777 = _1775 + 1.0;
    float _1779 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1781 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1783 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1785 = _1460 + 80;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    float _1803 = rsqrt(_1735);
    float _1805 = -_1675;
    float _1807 = _1661 + _1805;
    float _1809 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1783);
    float _1811 = _1783;
    if (!_1529)
    {
        int _1813 = _1591 << 4;
        int _1815 = _1813 + _1597;
        _1811 = as_type<float>(_1815);
    }
    float _1817 = _1811;
    float _1819 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1809);
    int _1821 = _1460 + 88;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    float _1839 = 1.0 / _1641;
    float _1841 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1819);
    float _1843 = _1817;
    float _1845 = _1841;
    if (!_1529)
    {
        int _1847 = as_type<int>(_1817) + 400;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
        int _1853 = int(_1849) & 3;
        float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
        _1843 = _1855;
    }
    float _1857 = _1843;
    float _1859 = _1803 * _1679;
    float _1861 = abs(_1777);
    float _1863 = log2(_1861);
    float _1865 = _1803 * _1671;
    float _1867 = _1803 * _1683;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1871 = _1356 * _1701;
    float _1873 = fma(_876, _1693, _1871);
    float _1875 = _1356 * _1733;
    float _1877 = fma(_878, _1651, _1873);
    float _1879 = 1.0 / _1841;
    float _1881 = fma(_876, _1725, _1875);
    float _1883 = _1877 + _1659;
    float _1885 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1887 = fma(_878, _1759, _1881);
    float _1889 = exp2(_1885);
    float _1891 = _1887 + _1767;
    float _1893 = -_1869;
    float _1895 = fma(_1865, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1893);
    float _1897 = _1891 * _1839;
    float _1899 = _1883 * _1839;
    float _1901 = _1356 * _1801;
    float _1903 = -_1867;
    float _1905 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1895);
    float _1907 = _1883;
    float _1909 = _1905;
    if (!_1529)
    {
        float _1911 = floor(_1388);
        _1907 = _1911;
    }
    float _1913 = _1907;
    bool _1915 = _1897 >= 0.0;
    float _1917 = fma(_876, _1793, _1901);
    float _1919 = fma(_1905, -0.5, 0.5);
    bool _1921 = _1897 <= 1.0;
    bool _1923 = _1921 && _1915;
    float _1925 = fma(_1905, 0.5, 0.5);
    float _1927 = fma(_878, _1829, _1917);
    float _1929 = _1895;
    if (!_1529)
    {
        float _1931 = floor(_1430);
        _1929 = _1931;
    }
    float _1933 = _1929;
    bool _1935 = _1899 >= 0.0;
    bool _1937 = _1935 && _1923;
    float _1939 = fma(_1925, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1941 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1943 = _1899 <= 1.0;
    bool _1945 = _1943 && _1937;
    float _1947 = fma(_1925, _1939, -0.212114393711090087890625);
    float _1949 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = sqrt(_1919);
    float _1953 = fma(_1925, _1947, 1.570728778839111328125);
    float _1955 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1957 = _1949;
    if (!_1529)
    {
        float _1959 = -_1933;
        float _1961 = _1430 + _1959;
        _1909 = _1961;
    }
    float _1963 = _1909;
    float _1965 = _1927 + _1837;
    if (_1945)
    {
        float _1967 = float(_1448);
        _1957 = _1967;
    }
    float _1969 = _1957;
    float _1971 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1941);
    float _1973 = _1927;
    if (!_1529)
    {
        float _1975 = rint(_1857);
        float _1977 = precise::max(_1975, 0.0);
        uint _1979 = uint(_1977);
        uint _1981 = clamp(_1979, 0u, 65535u);
        _1973 = as_type<float>(_1981);
    }
    float _1983 = _1973;
    float _1985 = _1865 + 1.0;
    float _1987 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1971);
    float _1989 = _1951 * 0.636619746685028076171875;
    float _1991 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1955);
    float _1993 = -_1865;
    float _1995 = fma(_1889, _1985, _1993);
    float _1997 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1987);
    float _1999 = _1969;
    float _2001 = _1987;
    float _2003 = _1997;
    if (_1945)
    {
        float _2005 = rint(_1969);
        float _2007 = precise::max(_2005, 0.0);
        uint _2009 = uint(_2007);
        uint _2011 = clamp(_2009, 0u, 65535u);
        _1999 = as_type<float>(_2011);
    }
    float _2013 = _1999;
    float _2015 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1991);
    float _2017 = _2015;
    if (!_1529)
    {
        float _2019 = -_1913;
        float _2021 = _1388 + _2019;
        _2001 = _2021;
    }
    float _2023 = _2001;
    float _2025 = _1997 * _1879;
    float _2027 = -_1953;
    float _2029 = fma(_1989, _2027, 1.0);
    float _2031 = _2015 * _1879;
    float _2033 = _1965 * _1839;
    float _2035 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2037 = fma(_2025, 0.5, 0.5);
    float _2039 = fma(_2031, -0.5, 0.5);
    float _2041 = fma(_1995, 0.5, 0.5);
    float2 _5890 = float2(_1807, _1485);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5890, float2(0.0), isnan(_5890)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5890, float2(0.0), isnan(_5890)), level(0.0)).x;
    float _2045 = _1963;
    if (!_1529)
    {
        float3 _5907 = float3(_2023, _1963, float(as_type<int>(_1983)));
        float3 _5911 = select(_5907, float3(0.0), isnan(_5907));
        float _2047 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5911.xy, uint(rint(_5911.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5911.xy, uint(rint(_5911.z)), level(0.0)).x;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = _2013;
    if (_1945)
    {
        float3 _5926 = float3(_1897, _1899, float(as_type<int>(_2013)));
        float3 _5928 = select(_5926, float3(0.0), isnan(_5926));
        float _2053 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5928.xy, uint(rint(_5928.z)), _2033, level(0.0));
        _2051 = _2053;
    }
    float _2055 = _2051;
    float3 _5938 = float3(_2037, _2039, _2035);
    float _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5938, float3(0.0), isnan(_5938)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5938, float3(0.0), isnan(_5938)), level(0.0)).x;
    float3 _5947 = float3(_2037, _2039, _2035);
    float4 _2060 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _2062 = _2060.x;
    float _2064 = _2060.y;
    float _2066 = _2060.z;
    float _2068 = _2060.w;
    float2 _5963 = float2(_2029, _2041);
    float3 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).xyz;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = abs(_1404);
    float _2082 = log2(_2080);
    float _2084 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2086 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2088 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2084);
    float _2090 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2088);
    float _2092 = _1997 + _1841;
    float _2094 = _1841 * 0.5;
    float _2096 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2090);
    float _2098 = _2092 * 0.5;
    float _2100 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2102 = _2096 + _1841;
    out.gl_Position.x = _1997;
    out.gl_Position.y = _2015;
    out.gl_Position.z = _2096;
    out.gl_Position.w = _1841;
    float _2104 = _2102 * 0.5;
    float _2106 = exp2(_2100);
    float _2108 = fma(_2015, -0.5, _2094);
    bool _2110 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan(0.5);
    bool _2118 = _2114 || _2116;
    out.m_91.x = _2098;
    out.m_91.y = _2108;
    out.m_91.z = _2104;
    out.m_91.w = _1841;
    bool _2120 = _1404 <= 8000.0;
    bool _2122 = isnan(_1404);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan(8000.0);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = _2104;
    float _2138 = _2108;
    if (_2118)
    {
        _2003 = 1.0;
    }
    float _2140 = _2003;
    float _2142 = _2140;
    if (_2118)
    {
        _2017 = 1.0;
    }
    float _2144 = _2017;
    float _2146 = fma(_2134, -2.0, 3.0);
    float _2148 = _2134 * _2134;
    float _2150 = _2148 * _2146;
    float _2152 = exp2(_2086);
    float _2154 = -_2150;
    float _2156 = _2154 + 1.0;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2150);
    float _2160 = _2130 * _2158;
    float _2162 = _2144;
    if (!_2118)
    {
        float _2164 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2166;
        float _2170 = _2164 * 0.15915493667125701904296875;
        float _2172 = _2170 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2178 = _2176 * 0.15915493667125701904296875;
        float _2180 = _2170 * 6.283185482025146484375;
        float _2182 = sin(_2180);
        float _2184 = 1.0 / _2174;
        float _2186 = _2178 * 6.283185482025146484375;
        float _2188 = cos(_2186);
        float _2190 = _2182 * _2184;
        float _2192 = _2178 * 6.283185482025146484375;
        float _2194 = sin(_2192);
        float _2196 = _2188 * _2190;
        float _2198 = 1.0 / _2168;
        float _2200 = 1.0 / _2196;
        float _2202 = _2194 * _2200;
        float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2206 = fma(_1404, _2202, _2204);
        float _2208 = _2206 * _2198;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2136 = _2168;
        _1845 = _2196;
        _2162 = _2210;
        _2138 = _2184;
    }
    float _2212 = _2136;
    float _2214 = _1845;
    float _2216 = _2162;
    float _2218 = _2138;
    float _2220 = _2212;
    float _2222 = _2214;
    float _2224 = _2218;
    if (!_2118)
    {
        float _2226 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2228 = _2226 * 0.15915493667125701904296875;
        float _2230 = _2228 * 6.283185482025146484375;
        float _2232 = cos(_2230);
        float _2234 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2236 = _2234 * 0.15915493667125701904296875;
        float _2238 = _2228 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = 1.0 / _2232;
        float _2244 = _2236 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        float _2248 = _2240 * _2242;
        float _2250 = _2236 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2246 * _2248;
        float _2256 = 1.0 / _2254;
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2260 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2258;
        float _2262 = 1.0 / _2260;
        float _2264 = _2252 * _2256;
        float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2268 = fma(_1404, _2264, _2266);
        float _2270 = _2268 * _2262;
        float _2272 = precise::clamp(_2270, 0.0, 1.0);
        float _2274 = -_2272;
        float _2276 = _2274 + 1.0;
        _2220 = _2228;
        _2222 = _2260;
        _2142 = _2276;
        _2224 = _2252;
    }
    float _2278 = _2220;
    float _2280 = _2222;
    float _2282 = _2142;
    float _2284 = _2224;
    float _2286 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2288 = -_2043;
    float _2290 = _2288 + 1.0;
    float _2292 = -_2152;
    float _2294 = _2292 + 1.0;
    float _2296 = _2280;
    float _2298 = _2286;
    float _2300 = _2284;
    float _2302 = _2278;
    if (!_1945)
    {
        _2296 = 1.0;
    }
    float _2304 = _2296;
    float _2306 = _2290 * _2286;
    float _2308 = precise::clamp(_2306, 0.0, 1.0);
    float _2310 = _2304;
    float _2312 = _2308;
    if (_1945)
    {
        bool _2314 = _2055 >= _2033;
        bool _2316 = isnan(_2055);
        bool _2318 = _2314 || _2316;
        bool _2320 = isnan(_2033);
        bool _2322 = _2318 || _2320;
        float _2324 = float(_2322);
        _2310 = _2324;
    }
    float _2326 = _2310;
    float _2328 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1529)
    {
        _2298 = 1.0;
    }
    float _2330 = _2298;
    float _2332 = _2330;
    if (!_1529)
    {
        int _2334 = _1565 << 4;
        int _2336 = _2334 + 2048;
        uint _2338 = uint(int(uint(_2336) >> uint(2)));
        uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
        int _2342 = int(_2338) & 3;
        float _2344 = (*spvDescriptorSet0.vp_c15)._m0[int(_2340)][_2342];
        int _2346 = int(_2338) + 1;
        uint _2348 = uint(int(uint(_2346) >> uint(2)));
        int _2350 = _2346 & 3;
        float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
        int _2354 = _2336 + 8;
        uint _2356 = uint(int(uint(_2354) >> uint(2)));
        uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
        int _2360 = int(_2356) & 3;
        float _2362 = (*spvDescriptorSet0.vp_c15)._m0[int(_2358)][_2360];
        int _2364 = int(_2356) + 1;
        uint _2366 = uint(int(uint(_2364) >> uint(2)));
        int _2368 = _2364 & 3;
        float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
        float _2372 = _1356 * _2352;
        float _2374 = fma(_876, _2344, _2372);
        float _2376 = fma(_878, _2362, _2374);
        float _2378 = _2376 + _2370;
        float _2380 = precise::clamp(_2378, 0.0, 1.0);
        float _2382 = -_2380;
        float _2384 = _2382 + _2049;
        float _2386 = fma(_2384, 500.0, 1.5);
        float _2388 = exp2(_2386);
        float _2390 = 0.0 + _2388;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        _2332 = _2392;
        _2300 = _2388;
        _2302 = _2344;
    }
    float _2394 = _2332;
    float _2396 = _2300;
    float _2398 = _2302;
    float _2400 = _2326 * _2394;
    float _2402 = _2328 * _2057;
    float _2404 = -_2308;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2408 = -_2328;
    float _2410 = _2408 + 1.0;
    out.m_93.x = _1312;
    out.m_93.y = _1310;
    out.m_93.z = _1314;
    float _2412 = _2068 * _2402;
    float _2414 = -_2400;
    float _2416 = fma(_2414, _2406, 1.0);
    float _2418 = precise::clamp(_2416, 0.0, 1.0);
    float _2420 = _2078 * _2402;
    float _2422 = _2068 * _2410;
    float _2424 = fma(_2074, _2412, _2062);
    float _2426 = fma(_2076, _2412, _2064);
    float _2428 = _2418 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2430 = fma(_2068, _2420, _2066);
    bool _2432 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2434 = isnan(_1362);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2440 = _2436 || _2438;
    float _2442 = _2216 * _2282;
    out.m_95.x = _2428;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2424;
    out.m_97.y = _2426;
    out.m_97.z = _2430;
    out.m_97.w = _2422;
    float _2446 = _2398;
    float _2448 = _2396;
    float _2450 = _2412;
    float _2452 = _2400;
    float _2454 = _2418;
    if (!_2440)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2456 = _2446;
    float _2458 = _2456;
    float _2460 = _2456;
    if (!_2440)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2462 = _2448;
    float _2464 = _2462;
    float _2466 = _2462;
    if (!_2440)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2468 = _2312;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2440)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2474 = _2450;
    float _2476 = _2474;
    float _2478 = _2474;
    if (!_2440)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2480 = _2452;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2440)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2486 = _2454;
    bool _2488 = !_2440;
    float _2490 = _2486;
    float _2492 = _2486;
    if (!_2488)
    {
        bool _2494 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1362);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1362 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2516 = 1.0 / _2510;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2516;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2542 = fma(_2536, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2466 = _2546;
            _2484 = _2550;
            _2460 = _2542;
            _2478 = _2548;
            _2472 = _2544;
            _2492 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1362);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2458 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2458;
            _2460 = _2566;
            if (!_2564)
            {
                _2464 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2464;
            _2466 = _2568;
            if (!_2564)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2470;
            _2472 = _2570;
            if (!_2564)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2476;
            _2478 = _2572;
            if (!_2564)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2482;
            _2484 = _2574;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2490;
            bool _2578 = !_2564;
            _2492 = _2576;
            if (!_2578)
            {
                bool _2580 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1362);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1362 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = 1.0 / _2596;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2602;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2628 = fma(_2622, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2466 = _2632;
                    _2484 = _2636;
                    _2460 = _2628;
                    _2478 = _2634;
                    _2472 = _2630;
                    _2492 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2466 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2460 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2466;
    float _2642 = _2484;
    float _2644 = _2460;
    float _2646 = _2478;
    float _2648 = _2472;
    float _2650 = _2492;
    float _2652 = fma(_1202, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = _2444 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = -_2644;
    float _2664 = _2662 + _2646;
    out.m_99.x = 0.0;
    float _2666 = fma(_2654, _2658, _2640);
    float _2668 = fma(_2654, _2664, _2644);
    out.m_61.x = _2660;
    float _2670 = -_2648;
    float _2672 = _2670 + _2650;
    float _2674 = _2666 * 0.586610972881317138671875;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2654, _2672, _2648);
    float _2680 = fma(_2668, 0.298911988735198974609375, _2674);
    bool _2682 = _2216 > 0.0;
    bool _2684 = isnan(_2216);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    out.m_101.x = 0.0;
    float _2692 = fma(_2678, 0.114477999508380889892578125, _2680);
    bool _2694 = _2282 <= 0.0;
    bool _2696 = !_2690;
    bool _2698 = _2694 || _2696;
    float _2700 = -_2692;
    float _2702 = _2668 + _2700;
    float _2704 = -_2692;
    float _2706 = _2666 + _2704;
    float _2708 = -_2692;
    float _2710 = _2678 + _2708;
    float _2712 = fma(_2702, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2714 = fma(_2706, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2716 = fma(_2710, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    bool _2718 = !_2676;
    if (!_2718)
    {
        float _2720 = -_1310;
        float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2724 = -_1312;
        float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2728 = -_1314;
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2732 = _2722 * _2722;
        float _2734 = fma(_2726, _2726, _2732);
        float _2736 = fma(_2730, _2730, _2734);
        float _2738 = rsqrt(_2736);
        float _2740 = _2722 * _2738;
        float _2742 = _2726 * _2738;
        float _2744 = _2730 * _2738;
        float _2746 = sqrt(_2736);
        float _2748 = -_1382;
        float _2750 = _2748 + _2740;
        float _2752 = -_1376;
        float _2754 = _2752 + _2742;
        float _2756 = -_1378;
        float _2758 = _2756 + _2744;
        float _2760 = _2750 * _2750;
        float _2762 = fma(_2754, _2754, _2760);
        float _2764 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2766 = precise::clamp(_2764, 0.0, 1.0);
        float _2768 = fma(_2758, _2758, _2762);
        float _2770 = _2766 * _2766;
        float _2772 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2774 = -_2746;
        float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2778 = _2770 + (-1.0);
        float _2780 = rsqrt(_2768);
        float _2782 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2784 = precise::clamp(_2782, 0.0, 1.0);
        float _2786 = -_2740;
        float _2788 = -_2772;
        float _2790 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2788);
        float _2792 = -_2744;
        float _2794 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2790);
        float _2796 = abs(_2784);
        float _2798 = log2(_2796);
        float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2802 = _2794 + _2800;
        float _2804 = _2750 * _2780;
        float _2806 = _2754 * _2780;
        float _2808 = _2758 * _2780;
        float _2810 = _1202 * _2804;
        float _2812 = _1202 * _2740;
        float _2814 = fma(_1206, _2806, _2810);
        float _2816 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2818 = fma(_1206, _2742, _2812);
        float _2820 = fma(_1216, _2808, _2814);
        float _2822 = precise::clamp(_2820, 0.0, 1.0);
        float _2824 = fma(_1216, _2744, _2818);
        float _2826 = precise::clamp(_2824, 0.0, 1.0);
        float _2828 = exp2(_2816);
        float _2830 = _2822 * _2822;
        float _2832 = fma(_2830, _2778, 1.0);
        float _2834 = _2832 * _2832;
        float _2836 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = 1.0 / _2834;
        float _2842 = _2828 * _2838;
        float _2844 = _2826 * _2842;
        float _2846 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2848 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2850 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2852 = _2770 * _2840;
        out.m_99.x = _2846;
        out.m_99.y = _2848;
        out.m_99.z = _2850;
        float _2854 = _2844 * _2852;
        float _2856 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2860 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2856;
        out.m_101.y = _2858;
        out.m_101.z = _2860;
    }
    out.m_103.x = _2712;
    out.m_103.y = _2714;
    out.m_103.z = _2716;
    if (!_2698)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2862 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2862;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
    bool _1262 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2919 = as_type<float>(_138);
        out.gl_Position.z = _2919;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_63.w;
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
        out.m_61.x = 0.0;
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
        float _2989 = as_type<float>(_176);
        out.gl_Position.z = _2989;
    }
    if (_168)
    {
        return out;
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
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
    float _224 = _214;
    float _226 = _178;
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
    float _244 = _238;
    float _246 = _236;
    if (!_220)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = _248;
    if (!_222)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _256 = _250;
    float _258 = _252;
    float _260 = _216;
    float _262 = _256;
    float _264 = _258;
    if (_222)
    {
        float _266 = rsqrt(_210);
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (!_222)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = _272;
    if (!_240)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    if (_220)
    {
        float _288 = _230 * _184;
        _254 = _288;
    }
    float _290 = _254;
    if (_220)
    {
        float _292 = _230 * _178;
        _244 = _292;
    }
    float _294 = _244;
    if (_220)
    {
        float _296 = _230 * _190;
        _246 = _296;
    }
    float _298 = _246;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 0.0;
    float _304 = _298;
    if (!_240)
    {
        _302 = 0.0;
    }
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _306;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _312 = _308;
    float _314 = _312;
    if (_222)
    {
        float _316 = _268 * _186;
        _262 = _316;
    }
    float _318 = _262;
    if (_222)
    {
        float _320 = _268 * _180;
        _264 = _320;
    }
    float _322 = _264;
    if (_222)
    {
        float _324 = _268 * _192;
        _276 = _324;
    }
    float _326 = _276;
    if (_240)
    {
        float _328 = _286 * _188;
        _282 = _328;
    }
    float _330 = _282;
    if (_240)
    {
        float _332 = _286 * _182;
        _310 = _332;
    }
    float _334 = _310;
    if (_240)
    {
        float _336 = _286 * _194;
        _314 = _336;
    }
    float _338 = _314;
    bool _340 = !_300;
    float _358;
    if (!_340)
    {
        float _342 = in.m_71.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_122);
        float _364 = 1.0 / _362;
        float _366 = _156 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_71.z;
    bool _376 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    float _386 = in.m_71.x;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _400 = 1.0 + _398;
    float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _404 = in.m_71.y;
    bool _406 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_368);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _372 * _156;
    float _420 = 1.0 / _400;
    bool _422 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _424 = isnan(_368);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -_416;
    float _436 = _434 + 1.0;
    float _438 = _432 * _436;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = exp2(_418);
    float _446 = _374 * 2.0;
    float _448 = _386 * 2.0;
    float _450 = floor(_446);
    float _452 = _404 * 2.0;
    float _454 = floor(_448);
    float _456 = -_444;
    float _458 = _456 + 1.0;
    float _460 = _384 ? _458 : 0.0;
    float _462 = floor(_452);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _474 = _472 != 0;
    if (_396)
    {
        float _476 = _460 * _420;
        _158 = _476;
    }
    float _478 = _158;
    bool _480 = _450 > 0.0;
    bool _482 = _450 >= 0.0;
    bool _484 = isnan(_450);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _454 > 0.0;
    bool _494 = _454 >= 0.0;
    bool _496 = isnan(_454);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    bool _504 = !_466;
    int _506 = _504 ? 0 : 1;
    bool _508 = !_470;
    int _510 = _508 ? 0 : 1;
    bool _512 = !_474;
    int _514 = _512 ? 0 : 1;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _526 = _524 != 0;
    int _528 = _502 ? 0 : 1;
    int _530 = _490 ? 0 : 1;
    bool _532 = !_522;
    int _534 = _532 ? 0 : 1;
    int _536 = ~_528;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    int _542 = _540;
    if (!_492)
    {
        int _544 = ~_528;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    int _550 = abs(_534);
    float _552 = _478 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _554 = _462 > 0.0;
    bool _556 = _462 >= 0.0;
    bool _558 = isnan(_462);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _552 * _402;
    float _568 = float(_548);
    float _570 = float(_550);
    float _572 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[203].x, _566);
    int _574 = _564 ? 0 : 1;
    float _576 = _404 + _374;
    bool _578 = !_518;
    int _580 = _578 ? 0 : 1;
    float _582 = _570 * _568;
    int _584 = ~_574;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = in.m_73.x;
    float _592 = in.m_73.y;
    float _594 = in.m_73.z;
    int _596 = _588;
    if (!_554)
    {
        int _598 = ~_574;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = floor(_572);
    float _606 = _572 + 0.25;
    bool _608 = !_526;
    int _610 = _608 ? 0 : 1;
    float _612 = _576 + (-1.0);
    float _614 = float(_602);
    float _616 = _582 * (-2.0);
    int _618 = ~_530;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = floor(_606);
    int _626 = _622;
    if (!_480)
    {
        int _628 = ~_530;
        int _630 = _628 + 1;
        _626 = _630;
    }
    int _632 = _626;
    float _634 = _386 + _374;
    int _636 = abs(_610);
    float _638 = _374 + (-0.5);
    int _640 = abs(_580);
    float _642 = _634 + (-1.0);
    float _644 = float(_632);
    float _646 = -_604;
    float _648 = _572 + _646;
    float _650 = float(_636);
    float _652 = _572 * 6.283185482025146484375;
    float _654 = float(_640);
    float _656 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _658 = _648 >= 0.5;
    bool _660 = isnan(_648);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.5);
    bool _666 = _662 || _664;
    float _668 = _650 * _614;
    float _670 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _672 = _654 * _644;
    float _674 = fma(_616, _592, _592);
    float _676 = _652 * 0.15915493667125701904296875;
    float _678 = -_624;
    float _680 = _606 + _678;
    float _682 = _668 * (-2.0);
    float _684 = fma(_656, _616, _656);
    float _686 = in.m_75.x;
    float _688 = fma(_670, _682, _670);
    float _690 = _676 * 6.283185482025146484375;
    float _692 = sin(_690);
    bool _694 = _680 > 0.5;
    float _696 = fma(_682, _594, _594);
    int _698 = abs(_510);
    float _700 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _702 = _404 + (-0.5);
    bool _704 = !_666;
    float _706 = _704 ? 0.5 : (-0.5);
    float _708 = fma(_688, _478, _700);
    int _710 = abs(_506);
    float _712 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _714 = float(_698);
    float _716 = _706 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _718 = _716 * 2.0;
    float _720 = _680;
    if (_694)
    {
        float _722 = -_680;
        float _724 = _722 + 1.0;
        _720 = _724;
    }
    float _726 = _720;
    int _728 = abs(_514);
    float _730 = _714 * _718;
    float _732 = float(_710);
    float _734 = _692 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _736 = fma(_726, 4.0, -1.0);
    float _738 = float(_728);
    float _740 = fma(_684, _478, _712);
    float _742 = fma(_732, _734, _730);
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _746 = in.m_58.x;
    float _748 = in.m_58.y;
    float _750 = in.m_58.z;
    float _752 = _386 + _404;
    float _754 = fma(_738, _744, _742);
    float _756 = _672 * (-2.0);
    float _758 = _752 + (-1.0);
    float _760 = _708 * 0.15915493667125701904296875;
    float _762 = fma(_754, 3.1415927410125732421875, _590);
    float _764 = _386 + (-0.5);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _772 = fma(_762, _756, _762);
    float _774 = _740 * 0.15915493667125701904296875;
    float _776 = in.m_77.x;
    float _778 = in.m_77.y;
    float _780 = in.m_77.z;
    float _782 = fma(_766, _756, _766);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _772);
    float _786 = 1.0 / _770;
    float _788 = in.m_79.x;
    float _790 = in.m_79.y;
    float _792 = in.m_79.z;
    float _794 = fma(_782, _478, _784);
    bool _796 = _404 > 0.5;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _800 = _798 != 0;
    float _802 = _794 * 0.15915493667125701904296875;
    float _804 = _192 * _748;
    float _806 = _760 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _186 * _748;
    float _812 = _180 * _748;
    float _814 = fma(_190, _746, _804);
    float _816 = fma(_184, _746, _810);
    bool _818 = _386 > 0.5;
    bool _820 = _818 && _800;
    float _822 = fma(_194, _750, _814);
    float _824 = _760 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _828;
    float _832 = fma(_188, _750, _816);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _836 = _834 != 0;
    float _838 = _778 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _840 = _780 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _842 = _830 * _786;
    float _844 = _776 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _846 = _802 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _790);
    float _852 = _838 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _792);
    float _856 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _368 + _858;
    float _862 = _852 * _850;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _866 = _802 * 6.283185482025146484375;
    float _868 = cos(_866);
    float _870 = _856 * _854;
    float _872 = fma(_842, _860, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _876 = _832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _878 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _880 = in.m_75.y;
    float _882 = _874 * _864;
    float _884 = _774 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _848 * _808;
    float _890 = _848 * _826;
    bool _892 = _790 != 0.0;
    bool _894 = isnan(_790);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = fma(_178, _746, _812);
    float _904 = 0.0;
    float _906 = _792;
    if (_800)
    {
        _904 = _686;
    }
    float _908 = _904;
    float _910 = _872 * _438;
    bool _912 = _788 == 0.0;
    bool _914 = !_900;
    bool _916 = _912 && _914;
    float _918 = _774 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _868 * _826;
    float _924 = _868 * _808;
    bool _926 = _792 == 0.0;
    bool _928 = _926 && _916;
    float _930 = fma(_182, _750, _902);
    float _932 = _908;
    if (_820)
    {
        float _934 = -_908;
        float _936 = _934 + 1.0;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _910);
    if (!_800)
    {
        _226 = _686;
    }
    float _942 = _226;
    float _944 = _886 * _808;
    float _946 = _848 * _886;
    float _948 = _886 * _826;
    float _950 = _868 * _886;
    float _952 = _942;
    if (_800)
    {
        _952 = _938;
    }
    float _954 = _952;
    float _956 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[116].x, _940);
    float _958 = -_880;
    float _960 = _958 + 1.0;
    float _962 = fma(_920, _888, _922);
    float _964 = -_924;
    float _966 = fma(_920, _890, _964);
    float _968 = -_890;
    float _970 = fma(_920, _924, _968);
    float _972 = fma(_920, _922, _888);
    float _974 = _962 * _862;
    float _976 = _966 * _862;
    float _978 = _946 * _862;
    float _980 = _880;
    if (_836)
    {
        float _982 = _796 ? _960 : _880;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = fma(_944, _882, _974);
    float _988 = fma(_948, _882, _976);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _992 = fma(_970, _870, _986);
    float _994 = -_920;
    float _996 = fma(_994, _882, _978);
    float _998 = fma(_972, _870, _988);
    float _1000 = _992 * _318;
    float _1002 = _992 * _326;
    float _1004 = fma(_950, _870, _996);
    float _1006 = _992 * _322;
    float _1008 = fma(_998, _290, _1000);
    float _1010 = fma(_998, _298, _1002);
    float _1012 = fma(_998, _294, _1006);
    float _1014 = fma(_1004, _330, _1008);
    float _1016 = fma(_1004, _338, _1010);
    float _1018 = in.m_81.x;
    float _1020 = in.m_81.y;
    float _1022 = in.m_81.z;
    float _1024 = _876 + _1014;
    float _1026 = _878 + _1016;
    float _1028 = fma(_1004, _334, _1012);
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1024 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1036 = _1026 + _1034;
    float _1038 = _1032 * _1032;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 + _1040;
    float _1044 = sqrt(_1042);
    float _1046 = _1020;
    float _1048 = _1018;
    float _1050 = _1022;
    float _1052 = _1038;
    float _1054 = _1040;
    float _1056 = _1024;
    float _1058 = _1026;
    if (!_928)
    {
        float _1060 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1046 = _1060;
    }
    float _1062 = _1046;
    if (!_928)
    {
        float _1064 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1018);
        _1048 = _1064;
    }
    float _1066 = _1048;
    if (!_928)
    {
        float _1068 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1022);
        _1050 = _1068;
    }
    float _1070 = _1050;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1074 = _962 * _1062;
    float _1076 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1078 = _946 * _1062;
    float _1080 = _966 * _1062;
    float _1082 = fma(_944, _1066, _1074);
    bool _1084 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = -_920;
    float _1088 = fma(_1086, _1066, _1078);
    float _1090 = fma(_970, _1070, _1082);
    float _1092 = _1076 + _1028;
    float _1094 = fma(_948, _1066, _1080);
    float _1096 = fma(_950, _1070, _1088);
    float _1098 = fma(_972, _1070, _1094);
    float _1100 = _1096;
    if (!_1084)
    {
        _906 = _1092;
    }
    float _1102 = _906;
    bool _1104 = !_1084;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1112 = _1044 + _1110;
        float _1114 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = rsqrt(_1042);
        float _1118 = _1112 * _1108;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1120 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = fma(_1124, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = _1116 * _1130;
        float _1134 = _1128 + (-1.0);
        float _1136 = fma(_1032, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1036, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1140 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1144 = _1136 + _1142;
        float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1148 = _1138 + _1146;
        float _1150 = fma(_1092, _1128, _1140);
        float _1152 = _1144 * _1144;
        float _1154 = _1148 * _1148;
        _1106 = _1150;
        _1052 = _1152;
        _1054 = _1154;
        _1056 = _1136;
        _1058 = _1138;
    }
    float _1156 = _1106;
    float _1158 = _1052;
    float _1160 = _1054;
    float _1162 = _1056;
    float _1164 = _1058;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1168 = _1156 + _1166;
    float _1170 = _1090 * _318;
    float _1172 = _1090 * _322;
    float _1174 = _1090 * _326;
    float _1176 = fma(_1168, _1168, _1158);
    float _1178 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1180 = fma(_1098, _290, _1170);
    float _1182 = fma(_1098, _294, _1172);
    float _1184 = _1176 + _1160;
    float _1186 = fma(_1098, _298, _1174);
    float _1188 = _1178 * _1072;
    float _1190 = _954 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1192 = sqrt(_1184);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1198 = _1190 * _990;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1202 = fma(_1096, _334, _1182);
    float _1204 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1206 = fma(_1096, _330, _1180);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1210 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = fma(_1096, _338, _1186);
    out.m_83.w = _1208;
    bool _1218 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1220 = isnan(_1192);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1226 = _1222 || _1224;
    out.m_85.x = _1198;
    out.m_85.y = _1188;
    out.m_87.x = _1210;
    out.m_87.y = _1212;
    out.m_87.z = _1214;
    out.m_87.w = _1204;
    out.m_89.x = _1206;
    out.m_89.y = _1202;
    out.m_89.z = _1216;
    if (!_1226)
    {
        _1100 = 1.0;
    }
    float _1228 = _1100;
    bool _1230 = !_1226;
    float _1232 = _1228;
    if (!_1230)
    {
        bool _1234 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1236 = isnan(_1192);
        bool _1238 = _1234 || _1236;
        bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1242 = _1238 || _1240;
        if (!_1242)
        {
            float _1244 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1246 = _1192 + _1244;
            float _1248 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1250 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1248;
            float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1254 = _1252 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1256 = 1.0 / _1250;
            float _1258 = _1246 * _1256;
            float _1260 = fma(_1258, _1254, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1232 = _1260;
            _1262 = true;
        }
        else
        {
            bool _1264 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1266 = isnan(_1192);
            bool _1268 = _1264 || _1266;
            bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1272 = _1268 || _1270;
            if (!_1272)
            {
                float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1276 = _1192 + _1274;
                float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1280 = _1278 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1284 = _1282 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1286 = 1.0 / _1280;
                float _1288 = _1276 * _1286;
                float _1290 = fma(_1288, _1284, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1232 = _1290;
                _1262 = true;
            }
            else
            {
                _1232 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1262 = false;
    float _1292 = _1232;
    float _1294 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1298 = _1156 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1302 = _1162 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1306 = _1164 + _1304;
    float _1308 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1294);
    float _1310 = fma(_1298, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1312 = fma(_1302, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1314 = fma(_1306, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1316 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1308);
    float _1318 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1310 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1312 + _1324;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1318);
    float _1332 = _1322 * _1322;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1336 = _1314 + _1334;
    float _1338 = 1.0 / _1328;
    float _1340 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1330);
    float _1342 = fma(_1326, _1326, _1332);
    float _1344 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1348 = fma(_1336, _1336, _1342);
    float _1350 = _1346 + _1328;
    float _1352 = rsqrt(_1348);
    float _1354 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1356 = _1076 + _1354;
    float _1358 = _1350 * _1338;
    float _1360 = _1358 * 0.5;
    float _1362 = sqrt(_1348);
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1366);
    float _1370 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1372 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1364);
    float _1374 = 1.0 / _1368;
    float _1376 = _1326 * _1352;
    float _1378 = _1336 * _1352;
    float _1380 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1372);
    float _1382 = _1322 * _1352;
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1384 * _1384;
    float _1394 = _1386 * _1386;
    float _1396 = trunc(_1388);
    int _1398 = int(_1396);
    float _1400 = _1392 + _1394;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1374 * _1402;
    float _1406 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1408 = sqrt(_1400);
    bool _1410 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1412 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1406);
    bool _1414 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1416 = !_1410;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1412);
    int _1422 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1424 = _1398 + _1422;
    int _1426 = _1424 + 1;
    float _1428 = floor(_1370);
    float _1430 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1432 = 2;
    int _1434 = _1426;
    float _1436 = _1384;
    float _1438 = _1386;
    float _1440 = _1392;
    float _1442 = _1394;
    if (!_1410)
    {
        _1432 = 1;
    }
    int _1444 = _1432;
    int _1446 = _1444;
    if (!_1414)
    {
        _1446 = _1418;
    }
    int _1448 = _1446;
    float _1450 = trunc(_1430);
    int _1452 = int(_1450);
    bool _1454 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1458 = _1408 + _1456;
    int _1460 = _1448 << 6;
    bool _1462 = _1426 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1464 = _1460 + 96;
    uint _1467 = uint(int(uint(_1464) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.vp_c15)._m0[int(_1477)][_1479];
    float _1483 = -_1428;
    float _1485 = _1370 + _1483;
    float _1487 = _1164;
    float _1489 = _1458;
    if (_1454)
    {
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1487 = _1491;
    }
    float _1493 = _1487;
    int _1495 = _1460 + 104;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1515 = _1452 + _1513;
    int _1517 = _1515 + 1;
    int _1519 = _1426 | _1517;
    bool _1521 = _1519 < 0;
    bool _1523 = _1521 || _1462;
    float _1525 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1527 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1529 = _1527 || _1523;
    if (_1454)
    {
        float _1531 = _1458 * _1493;
        _1489 = _1531;
    }
    float _1533 = _1489;
    float _1535 = precise::max(0.0, _1525);
    if (_1454)
    {
        float _1537 = _1533 * 0.15915493667125701904296875;
        _304 = _1537;
    }
    float _1539 = _304;
    float _1541 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1543 = -_1382;
    float _1545 = -_1535;
    float _1547 = fma(_1543, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1545);
    float _1549 = _1182;
    float _1551 = _1547;
    if (_1454)
    {
        float _1553 = _1539 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1549 = _1555;
    }
    float _1557 = _1549;
    float _1559 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1541);
    if (!_1529)
    {
        int _1561 = _1517 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1563 = _1561 + _1426;
        _1434 = _1563;
    }
    int _1565 = _1434;
    float _1567 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1569 = _1493;
    if (_1454)
    {
        float _1571 = _1539 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        _1569 = _1573;
    }
    float _1575 = _1569;
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1579 = 0;
    if (!_1529)
    {
        int _1581 = _1565 << 2;
        _1579 = _1581;
    }
    int _1583 = _1579;
    int _1585 = 0;
    int _1587 = _1583;
    if (!_1529)
    {
        uint _1589 = uint(int(uint(_1565) >> uint(2)));
        _1585 = int(_1589);
    }
    int _1591 = _1585;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_1529)
    {
        int _1595 = 12 & _1583;
        _1587 = _1595;
    }
    int _1597 = _1587;
    float _1599 = _1567;
    if (_1454)
    {
        float _1601 = rsqrt(_1400);
        _1599 = _1601;
    }
    float _1603 = _1599;
    float _1605 = _1356 * _1481;
    float _1607 = _1481;
    float _1609 = _1605;
    if (_1454)
    {
        float _1611 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1607 = _1611;
    }
    float _1613 = _1607;
    float _1615 = -_1593;
    float _1617 = fma(_1615, _1390, 1.0);
    float _1619 = fma(_876, _1473, _1605);
    float _1621 = _1557;
    float _1623 = _1613;
    if (_1454)
    {
        float _1625 = fma(_1557, _1613, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1621 = _1625;
    }
    float _1627 = _1621;
    if (_1454)
    {
        float _1629 = _1575 + (-1.0);
        _1609 = _1629;
    }
    float _1631 = _1609;
    float _1633 = fma(_878, _1503, _1619);
    float _1635 = log2(_1617);
    if (_1454)
    {
        float _1637 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1623 = _1637;
    }
    float _1639 = _1623;
    float _1641 = _1633 + _1511;
    int _1643 = _1460 + 72;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    float _1661 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1663 = _1603;
    if (_1454)
    {
        float _1665 = _1603 * _1627;
        _1663 = _1665;
    }
    float _1667 = _1663;
    if (_1454)
    {
        float _1669 = fma(_1547, _1575, _1639);
        _1551 = _1669;
    }
    float _1671 = _1551;
    float _1673 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1675 = floor(_1661);
    if (_1454)
    {
        float _1677 = _1384 * _1667;
        _1436 = _1677;
    }
    float _1679 = _1436;
    if (_1454)
    {
        float _1681 = _1386 * _1667;
        _1438 = _1681;
    }
    float _1683 = _1438;
    int _1685 = _1460 + 64;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    if (_1454)
    {
        float _1703 = _1679 * _1679;
        _1440 = _1703;
    }
    float _1705 = _1440;
    if (_1454)
    {
        float _1707 = _1683 * _1683;
        _1442 = _1707;
    }
    float _1709 = _1442;
    float _1711 = _1635 * 0.693147182464599609375;
    float _1713 = fma(_1671, _1671, _1705);
    float _1715 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1717 = _1460 + 48;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    float _1735 = _1713 + _1709;
    float _1737 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1715);
    float _1739 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1673);
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1743 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1741);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1344);
    float _1749 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1737);
    int _1751 = _1460 + 56;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1739);
    float _1771 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1773 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1775 = -_1745;
    float _1777 = _1775 + 1.0;
    float _1779 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1781 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1783 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1785 = _1460 + 80;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    float _1803 = rsqrt(_1735);
    float _1805 = -_1675;
    float _1807 = _1661 + _1805;
    float _1809 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1783);
    float _1811 = _1783;
    if (!_1529)
    {
        int _1813 = _1591 << 4;
        int _1815 = _1813 + _1597;
        _1811 = as_type<float>(_1815);
    }
    float _1817 = _1811;
    float _1819 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1809);
    int _1821 = _1460 + 88;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    float _1839 = 1.0 / _1641;
    float _1841 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1819);
    float _1843 = _1817;
    float _1845 = _1841;
    if (!_1529)
    {
        int _1847 = as_type<int>(_1817) + 400;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
        int _1853 = int(_1849) & 3;
        float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
        _1843 = _1855;
    }
    float _1857 = _1843;
    float _1859 = _1803 * _1679;
    float _1861 = abs(_1777);
    float _1863 = log2(_1861);
    float _1865 = _1803 * _1671;
    float _1867 = _1803 * _1683;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1871 = _1356 * _1701;
    float _1873 = fma(_876, _1693, _1871);
    float _1875 = _1356 * _1733;
    float _1877 = fma(_878, _1651, _1873);
    float _1879 = 1.0 / _1841;
    float _1881 = fma(_876, _1725, _1875);
    float _1883 = _1877 + _1659;
    float _1885 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1887 = fma(_878, _1759, _1881);
    float _1889 = exp2(_1885);
    float _1891 = _1887 + _1767;
    float _1893 = -_1869;
    float _1895 = fma(_1865, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1893);
    float _1897 = _1891 * _1839;
    float _1899 = _1883 * _1839;
    float _1901 = _1356 * _1801;
    float _1903 = -_1867;
    float _1905 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1895);
    float _1907 = _1883;
    float _1909 = _1905;
    if (!_1529)
    {
        float _1911 = floor(_1388);
        _1907 = _1911;
    }
    float _1913 = _1907;
    bool _1915 = _1897 >= 0.0;
    float _1917 = fma(_876, _1793, _1901);
    float _1919 = fma(_1905, -0.5, 0.5);
    bool _1921 = _1897 <= 1.0;
    bool _1923 = _1921 && _1915;
    float _1925 = fma(_1905, 0.5, 0.5);
    float _1927 = fma(_878, _1829, _1917);
    float _1929 = _1895;
    if (!_1529)
    {
        float _1931 = floor(_1430);
        _1929 = _1931;
    }
    float _1933 = _1929;
    bool _1935 = _1899 >= 0.0;
    bool _1937 = _1935 && _1923;
    float _1939 = fma(_1925, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1941 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1943 = _1899 <= 1.0;
    bool _1945 = _1943 && _1937;
    float _1947 = fma(_1925, _1939, -0.212114393711090087890625);
    float _1949 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = sqrt(_1919);
    float _1953 = fma(_1925, _1947, 1.570728778839111328125);
    float _1955 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1957 = _1949;
    if (!_1529)
    {
        float _1959 = -_1933;
        float _1961 = _1430 + _1959;
        _1909 = _1961;
    }
    float _1963 = _1909;
    float _1965 = _1927 + _1837;
    if (_1945)
    {
        float _1967 = float(_1448);
        _1957 = _1967;
    }
    float _1969 = _1957;
    float _1971 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1941);
    float _1973 = _1927;
    if (!_1529)
    {
        float _1975 = rint(_1857);
        float _1977 = precise::max(_1975, 0.0);
        uint _1979 = uint(_1977);
        uint _1981 = clamp(_1979, 0u, 65535u);
        _1973 = as_type<float>(_1981);
    }
    float _1983 = _1973;
    float _1985 = _1865 + 1.0;
    float _1987 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1971);
    float _1989 = _1951 * 0.636619746685028076171875;
    float _1991 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1955);
    float _1993 = -_1865;
    float _1995 = fma(_1889, _1985, _1993);
    float _1997 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1987);
    float _1999 = _1969;
    float _2001 = _1987;
    float _2003 = _1997;
    if (_1945)
    {
        float _2005 = rint(_1969);
        float _2007 = precise::max(_2005, 0.0);
        uint _2009 = uint(_2007);
        uint _2011 = clamp(_2009, 0u, 65535u);
        _1999 = as_type<float>(_2011);
    }
    float _2013 = _1999;
    float _2015 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1991);
    float _2017 = _2015;
    if (!_1529)
    {
        float _2019 = -_1913;
        float _2021 = _1388 + _2019;
        _2001 = _2021;
    }
    float _2023 = _2001;
    float _2025 = _1997 * _1879;
    float _2027 = -_1953;
    float _2029 = fma(_1989, _2027, 1.0);
    float _2031 = _2015 * _1879;
    float _2033 = _1965 * _1839;
    float _2035 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2037 = fma(_2025, 0.5, 0.5);
    float _2039 = fma(_2031, -0.5, 0.5);
    float _2041 = fma(_1995, 0.5, 0.5);
    float2 _5890 = float2(_1807, _1485);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5890, float2(0.0), isnan(_5890)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5890, float2(0.0), isnan(_5890)), level(0.0)).x;
    float _2045 = _1963;
    if (!_1529)
    {
        float3 _5907 = float3(_2023, _1963, float(as_type<int>(_1983)));
        float3 _5911 = select(_5907, float3(0.0), isnan(_5907));
        float _2047 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5911.xy, uint(rint(_5911.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5911.xy, uint(rint(_5911.z)), level(0.0)).x;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = _2013;
    if (_1945)
    {
        float3 _5926 = float3(_1897, _1899, float(as_type<int>(_2013)));
        float3 _5928 = select(_5926, float3(0.0), isnan(_5926));
        float _2053 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5928.xy, uint(rint(_5928.z)), _2033, level(0.0));
        _2051 = _2053;
    }
    float _2055 = _2051;
    float3 _5938 = float3(_2037, _2039, _2035);
    float _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5938, float3(0.0), isnan(_5938)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5938, float3(0.0), isnan(_5938)), level(0.0)).x;
    float3 _5947 = float3(_2037, _2039, _2035);
    float4 _2060 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _2062 = _2060.x;
    float _2064 = _2060.y;
    float _2066 = _2060.z;
    float _2068 = _2060.w;
    float2 _5963 = float2(_2029, _2041);
    float3 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).xyz;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = abs(_1404);
    float _2082 = log2(_2080);
    float _2084 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2086 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2088 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2084);
    float _2090 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2088);
    float _2092 = _1997 + _1841;
    float _2094 = _1841 * 0.5;
    float _2096 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2090);
    float _2098 = _2092 * 0.5;
    float _2100 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2102 = _2096 + _1841;
    out.gl_Position.x = _1997;
    out.gl_Position.y = _2015;
    out.gl_Position.z = _2096;
    out.gl_Position.w = _1841;
    float _2104 = _2102 * 0.5;
    float _2106 = exp2(_2100);
    float _2108 = fma(_2015, -0.5, _2094);
    bool _2110 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan(0.5);
    bool _2118 = _2114 || _2116;
    out.m_91.x = _2098;
    out.m_91.y = _2108;
    out.m_91.z = _2104;
    out.m_91.w = _1841;
    bool _2120 = _1404 <= 8000.0;
    bool _2122 = isnan(_1404);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan(8000.0);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = _2104;
    float _2138 = _2108;
    if (_2118)
    {
        _2003 = 1.0;
    }
    float _2140 = _2003;
    float _2142 = _2140;
    if (_2118)
    {
        _2017 = 1.0;
    }
    float _2144 = _2017;
    float _2146 = fma(_2134, -2.0, 3.0);
    float _2148 = _2134 * _2134;
    float _2150 = _2148 * _2146;
    float _2152 = exp2(_2086);
    float _2154 = -_2150;
    float _2156 = _2154 + 1.0;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2150);
    float _2160 = _2130 * _2158;
    float _2162 = _2144;
    if (!_2118)
    {
        float _2164 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2166;
        float _2170 = _2164 * 0.15915493667125701904296875;
        float _2172 = _2170 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2178 = _2176 * 0.15915493667125701904296875;
        float _2180 = _2170 * 6.283185482025146484375;
        float _2182 = sin(_2180);
        float _2184 = 1.0 / _2174;
        float _2186 = _2178 * 6.283185482025146484375;
        float _2188 = cos(_2186);
        float _2190 = _2182 * _2184;
        float _2192 = _2178 * 6.283185482025146484375;
        float _2194 = sin(_2192);
        float _2196 = _2188 * _2190;
        float _2198 = 1.0 / _2168;
        float _2200 = 1.0 / _2196;
        float _2202 = _2194 * _2200;
        float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2206 = fma(_1404, _2202, _2204);
        float _2208 = _2206 * _2198;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2136 = _2168;
        _1845 = _2196;
        _2162 = _2210;
        _2138 = _2184;
    }
    float _2212 = _2136;
    float _2214 = _1845;
    float _2216 = _2162;
    float _2218 = _2138;
    float _2220 = _2212;
    float _2222 = _2214;
    float _2224 = _2218;
    if (!_2118)
    {
        float _2226 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2228 = _2226 * 0.15915493667125701904296875;
        float _2230 = _2228 * 6.283185482025146484375;
        float _2232 = cos(_2230);
        float _2234 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2236 = _2234 * 0.15915493667125701904296875;
        float _2238 = _2228 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = 1.0 / _2232;
        float _2244 = _2236 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        float _2248 = _2240 * _2242;
        float _2250 = _2236 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2246 * _2248;
        float _2256 = 1.0 / _2254;
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2260 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2258;
        float _2262 = 1.0 / _2260;
        float _2264 = _2252 * _2256;
        float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2268 = fma(_1404, _2264, _2266);
        float _2270 = _2268 * _2262;
        float _2272 = precise::clamp(_2270, 0.0, 1.0);
        float _2274 = -_2272;
        float _2276 = _2274 + 1.0;
        _2220 = _2228;
        _2222 = _2260;
        _2142 = _2276;
        _2224 = _2252;
    }
    float _2278 = _2220;
    float _2280 = _2222;
    float _2282 = _2142;
    float _2284 = _2224;
    float _2286 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2288 = -_2043;
    float _2290 = _2288 + 1.0;
    float _2292 = -_2152;
    float _2294 = _2292 + 1.0;
    float _2296 = _2280;
    float _2298 = _2286;
    float _2300 = _2284;
    float _2302 = _2278;
    if (!_1945)
    {
        _2296 = 1.0;
    }
    float _2304 = _2296;
    float _2306 = _2290 * _2286;
    float _2308 = precise::clamp(_2306, 0.0, 1.0);
    float _2310 = _2304;
    float _2312 = _2308;
    if (_1945)
    {
        bool _2314 = _2055 >= _2033;
        bool _2316 = isnan(_2055);
        bool _2318 = _2314 || _2316;
        bool _2320 = isnan(_2033);
        bool _2322 = _2318 || _2320;
        float _2324 = float(_2322);
        _2310 = _2324;
    }
    float _2326 = _2310;
    float _2328 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1529)
    {
        _2298 = 1.0;
    }
    float _2330 = _2298;
    float _2332 = _2330;
    if (!_1529)
    {
        int _2334 = _1565 << 4;
        int _2336 = _2334 + 2048;
        uint _2338 = uint(int(uint(_2336) >> uint(2)));
        uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
        int _2342 = int(_2338) & 3;
        float _2344 = (*spvDescriptorSet0.vp_c15)._m0[int(_2340)][_2342];
        int _2346 = int(_2338) + 1;
        uint _2348 = uint(int(uint(_2346) >> uint(2)));
        int _2350 = _2346 & 3;
        float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
        int _2354 = _2336 + 8;
        uint _2356 = uint(int(uint(_2354) >> uint(2)));
        uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
        int _2360 = int(_2356) & 3;
        float _2362 = (*spvDescriptorSet0.vp_c15)._m0[int(_2358)][_2360];
        int _2364 = int(_2356) + 1;
        uint _2366 = uint(int(uint(_2364) >> uint(2)));
        int _2368 = _2364 & 3;
        float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
        float _2372 = _1356 * _2352;
        float _2374 = fma(_876, _2344, _2372);
        float _2376 = fma(_878, _2362, _2374);
        float _2378 = _2376 + _2370;
        float _2380 = precise::clamp(_2378, 0.0, 1.0);
        float _2382 = -_2380;
        float _2384 = _2382 + _2049;
        float _2386 = fma(_2384, 500.0, 1.5);
        float _2388 = exp2(_2386);
        float _2390 = 0.0 + _2388;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        _2332 = _2392;
        _2300 = _2388;
        _2302 = _2344;
    }
    float _2394 = _2332;
    float _2396 = _2300;
    float _2398 = _2302;
    float _2400 = _2326 * _2394;
    float _2402 = _2328 * _2057;
    float _2404 = -_2308;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2408 = -_2328;
    float _2410 = _2408 + 1.0;
    out.m_93.x = _1312;
    out.m_93.y = _1310;
    out.m_93.z = _1314;
    float _2412 = _2068 * _2402;
    float _2414 = -_2400;
    float _2416 = fma(_2414, _2406, 1.0);
    float _2418 = precise::clamp(_2416, 0.0, 1.0);
    float _2420 = _2078 * _2402;
    float _2422 = _2068 * _2410;
    float _2424 = fma(_2074, _2412, _2062);
    float _2426 = fma(_2076, _2412, _2064);
    float _2428 = _2418 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2430 = fma(_2068, _2420, _2066);
    bool _2432 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2434 = isnan(_1362);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2440 = _2436 || _2438;
    float _2442 = _2216 * _2282;
    out.m_95.x = _2428;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2424;
    out.m_97.y = _2426;
    out.m_97.z = _2430;
    out.m_97.w = _2422;
    float _2446 = _2398;
    float _2448 = _2396;
    float _2450 = _2412;
    float _2452 = _2400;
    float _2454 = _2418;
    if (!_2440)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2456 = _2446;
    float _2458 = _2456;
    float _2460 = _2456;
    if (!_2440)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2462 = _2448;
    float _2464 = _2462;
    float _2466 = _2462;
    if (!_2440)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2468 = _2312;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2440)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2474 = _2450;
    float _2476 = _2474;
    float _2478 = _2474;
    if (!_2440)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2480 = _2452;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2440)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2486 = _2454;
    bool _2488 = !_2440;
    float _2490 = _2486;
    float _2492 = _2486;
    if (!_2488)
    {
        bool _2494 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1362);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1362 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2516 = 1.0 / _2510;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2516;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2542 = fma(_2536, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2466 = _2546;
            _2484 = _2550;
            _2460 = _2542;
            _2478 = _2548;
            _2472 = _2544;
            _2492 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1362);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2458 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2458;
            _2460 = _2566;
            if (!_2564)
            {
                _2464 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2464;
            _2466 = _2568;
            if (!_2564)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2470;
            _2472 = _2570;
            if (!_2564)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2476;
            _2478 = _2572;
            if (!_2564)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2482;
            _2484 = _2574;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2490;
            bool _2578 = !_2564;
            _2492 = _2576;
            if (!_2578)
            {
                bool _2580 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1362);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1362 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = 1.0 / _2596;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2602;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2628 = fma(_2622, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2466 = _2632;
                    _2484 = _2636;
                    _2460 = _2628;
                    _2478 = _2634;
                    _2472 = _2630;
                    _2492 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2466 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2460 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2466;
    float _2642 = _2484;
    float _2644 = _2460;
    float _2646 = _2478;
    float _2648 = _2472;
    float _2650 = _2492;
    float _2652 = fma(_1202, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = _2444 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = -_2644;
    float _2664 = _2662 + _2646;
    out.m_99.x = 0.0;
    float _2666 = fma(_2654, _2658, _2640);
    float _2668 = fma(_2654, _2664, _2644);
    out.m_61.x = _2660;
    float _2670 = -_2648;
    float _2672 = _2670 + _2650;
    float _2674 = _2666 * 0.586610972881317138671875;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2654, _2672, _2648);
    float _2680 = fma(_2668, 0.298911988735198974609375, _2674);
    bool _2682 = _2216 > 0.0;
    bool _2684 = isnan(_2216);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    out.m_101.x = 0.0;
    float _2692 = fma(_2678, 0.114477999508380889892578125, _2680);
    bool _2694 = _2282 <= 0.0;
    bool _2696 = !_2690;
    bool _2698 = _2694 || _2696;
    float _2700 = -_2692;
    float _2702 = _2668 + _2700;
    float _2704 = -_2692;
    float _2706 = _2666 + _2704;
    float _2708 = -_2692;
    float _2710 = _2678 + _2708;
    float _2712 = fma(_2702, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2714 = fma(_2706, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2716 = fma(_2710, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    bool _2718 = !_2676;
    if (!_2718)
    {
        float _2720 = -_1310;
        float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2724 = -_1312;
        float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2728 = -_1314;
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2732 = _2722 * _2722;
        float _2734 = fma(_2726, _2726, _2732);
        float _2736 = fma(_2730, _2730, _2734);
        float _2738 = rsqrt(_2736);
        float _2740 = _2722 * _2738;
        float _2742 = _2726 * _2738;
        float _2744 = _2730 * _2738;
        float _2746 = sqrt(_2736);
        float _2748 = -_1382;
        float _2750 = _2748 + _2740;
        float _2752 = -_1376;
        float _2754 = _2752 + _2742;
        float _2756 = -_1378;
        float _2758 = _2756 + _2744;
        float _2760 = _2750 * _2750;
        float _2762 = fma(_2754, _2754, _2760);
        float _2764 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2766 = precise::clamp(_2764, 0.0, 1.0);
        float _2768 = fma(_2758, _2758, _2762);
        float _2770 = _2766 * _2766;
        float _2772 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2774 = -_2746;
        float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2778 = _2770 + (-1.0);
        float _2780 = rsqrt(_2768);
        float _2782 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2784 = precise::clamp(_2782, 0.0, 1.0);
        float _2786 = -_2740;
        float _2788 = -_2772;
        float _2790 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2788);
        float _2792 = -_2744;
        float _2794 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2790);
        float _2796 = abs(_2784);
        float _2798 = log2(_2796);
        float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2802 = _2794 + _2800;
        float _2804 = _2750 * _2780;
        float _2806 = _2754 * _2780;
        float _2808 = _2758 * _2780;
        float _2810 = _1202 * _2804;
        float _2812 = _1202 * _2740;
        float _2814 = fma(_1206, _2806, _2810);
        float _2816 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2818 = fma(_1206, _2742, _2812);
        float _2820 = fma(_1216, _2808, _2814);
        float _2822 = precise::clamp(_2820, 0.0, 1.0);
        float _2824 = fma(_1216, _2744, _2818);
        float _2826 = precise::clamp(_2824, 0.0, 1.0);
        float _2828 = exp2(_2816);
        float _2830 = _2822 * _2822;
        float _2832 = fma(_2830, _2778, 1.0);
        float _2834 = _2832 * _2832;
        float _2836 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = 1.0 / _2834;
        float _2842 = _2828 * _2838;
        float _2844 = _2826 * _2842;
        float _2846 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2848 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2850 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2852 = _2770 * _2840;
        out.m_99.x = _2846;
        out.m_99.y = _2848;
        out.m_99.z = _2850;
        float _2854 = _2844 * _2852;
        float _2856 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2860 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2856;
        out.m_101.y = _2858;
        out.m_101.z = _2860;
    }
    out.m_103.x = _2712;
    out.m_103.y = _2714;
    out.m_103.z = _2716;
    if (!_2698)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2862 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2862;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
    bool _1262 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2919 = as_type<float>(_138);
        out.gl_Position.z = _2919;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_63.w;
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
        out.m_61.x = 0.0;
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
        float _2989 = as_type<float>(_176);
        out.gl_Position.z = _2989;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = in.m_69.x;
    float _192 = in.m_69.y;
    float _194 = in.m_69.z;
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
    float _224 = _214;
    float _226 = _178;
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
    float _244 = _238;
    float _246 = _236;
    if (!_220)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = _248;
    if (!_222)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _256 = _250;
    float _258 = _252;
    float _260 = _216;
    float _262 = _256;
    float _264 = _258;
    if (_222)
    {
        float _266 = rsqrt(_210);
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (!_222)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = _272;
    if (!_240)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    if (_220)
    {
        float _288 = _230 * _184;
        _254 = _288;
    }
    float _290 = _254;
    if (_220)
    {
        float _292 = _230 * _178;
        _244 = _292;
    }
    float _294 = _244;
    if (_220)
    {
        float _296 = _230 * _190;
        _246 = _296;
    }
    float _298 = _246;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 0.0;
    float _304 = _298;
    if (!_240)
    {
        _302 = 0.0;
    }
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _306;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _312 = _308;
    float _314 = _312;
    if (_222)
    {
        float _316 = _268 * _186;
        _262 = _316;
    }
    float _318 = _262;
    if (_222)
    {
        float _320 = _268 * _180;
        _264 = _320;
    }
    float _322 = _264;
    if (_222)
    {
        float _324 = _268 * _192;
        _276 = _324;
    }
    float _326 = _276;
    if (_240)
    {
        float _328 = _286 * _188;
        _282 = _328;
    }
    float _330 = _282;
    if (_240)
    {
        float _332 = _286 * _182;
        _310 = _332;
    }
    float _334 = _310;
    if (_240)
    {
        float _336 = _286 * _194;
        _314 = _336;
    }
    float _338 = _314;
    bool _340 = !_300;
    float _358;
    if (!_340)
    {
        float _342 = in.m_71.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_122);
        float _364 = 1.0 / _362;
        float _366 = _156 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_71.z;
    bool _376 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    float _386 = in.m_71.x;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _400 = 1.0 + _398;
    float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _404 = in.m_71.y;
    bool _406 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_368);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _372 * _156;
    float _420 = 1.0 / _400;
    bool _422 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _424 = isnan(_368);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -_416;
    float _436 = _434 + 1.0;
    float _438 = _432 * _436;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = exp2(_418);
    float _446 = _374 * 2.0;
    float _448 = _386 * 2.0;
    float _450 = floor(_446);
    float _452 = _404 * 2.0;
    float _454 = floor(_448);
    float _456 = -_444;
    float _458 = _456 + 1.0;
    float _460 = _384 ? _458 : 0.0;
    float _462 = floor(_452);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _474 = _472 != 0;
    if (_396)
    {
        float _476 = _460 * _420;
        _158 = _476;
    }
    float _478 = _158;
    bool _480 = _450 > 0.0;
    bool _482 = _450 >= 0.0;
    bool _484 = isnan(_450);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _454 > 0.0;
    bool _494 = _454 >= 0.0;
    bool _496 = isnan(_454);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    bool _504 = !_466;
    int _506 = _504 ? 0 : 1;
    bool _508 = !_470;
    int _510 = _508 ? 0 : 1;
    bool _512 = !_474;
    int _514 = _512 ? 0 : 1;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _526 = _524 != 0;
    int _528 = _502 ? 0 : 1;
    int _530 = _490 ? 0 : 1;
    bool _532 = !_522;
    int _534 = _532 ? 0 : 1;
    int _536 = ~_528;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    int _542 = _540;
    if (!_492)
    {
        int _544 = ~_528;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    int _550 = abs(_534);
    float _552 = _478 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _554 = _462 > 0.0;
    bool _556 = _462 >= 0.0;
    bool _558 = isnan(_462);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = _552 * _402;
    float _568 = float(_548);
    float _570 = float(_550);
    float _572 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[203].x, _566);
    int _574 = _564 ? 0 : 1;
    float _576 = _404 + _374;
    bool _578 = !_518;
    int _580 = _578 ? 0 : 1;
    float _582 = _570 * _568;
    int _584 = ~_574;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = in.m_73.x;
    float _592 = in.m_73.y;
    float _594 = in.m_73.z;
    int _596 = _588;
    if (!_554)
    {
        int _598 = ~_574;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = floor(_572);
    float _606 = _572 + 0.25;
    bool _608 = !_526;
    int _610 = _608 ? 0 : 1;
    float _612 = _576 + (-1.0);
    float _614 = float(_602);
    float _616 = _582 * (-2.0);
    int _618 = ~_530;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = floor(_606);
    int _626 = _622;
    if (!_480)
    {
        int _628 = ~_530;
        int _630 = _628 + 1;
        _626 = _630;
    }
    int _632 = _626;
    float _634 = _386 + _374;
    int _636 = abs(_610);
    float _638 = _374 + (-0.5);
    int _640 = abs(_580);
    float _642 = _634 + (-1.0);
    float _644 = float(_632);
    float _646 = -_604;
    float _648 = _572 + _646;
    float _650 = float(_636);
    float _652 = _572 * 6.283185482025146484375;
    float _654 = float(_640);
    float _656 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _658 = _648 >= 0.5;
    bool _660 = isnan(_648);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.5);
    bool _666 = _662 || _664;
    float _668 = _650 * _614;
    float _670 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _672 = _654 * _644;
    float _674 = fma(_616, _592, _592);
    float _676 = _652 * 0.15915493667125701904296875;
    float _678 = -_624;
    float _680 = _606 + _678;
    float _682 = _668 * (-2.0);
    float _684 = fma(_656, _616, _656);
    float _686 = in.m_75.x;
    float _688 = fma(_670, _682, _670);
    float _690 = _676 * 6.283185482025146484375;
    float _692 = sin(_690);
    bool _694 = _680 > 0.5;
    float _696 = fma(_682, _594, _594);
    int _698 = abs(_510);
    float _700 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _702 = _404 + (-0.5);
    bool _704 = !_666;
    float _706 = _704 ? 0.5 : (-0.5);
    float _708 = fma(_688, _478, _700);
    int _710 = abs(_506);
    float _712 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _714 = float(_698);
    float _716 = _706 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _718 = _716 * 2.0;
    float _720 = _680;
    if (_694)
    {
        float _722 = -_680;
        float _724 = _722 + 1.0;
        _720 = _724;
    }
    float _726 = _720;
    int _728 = abs(_514);
    float _730 = _714 * _718;
    float _732 = float(_710);
    float _734 = _692 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _736 = fma(_726, 4.0, -1.0);
    float _738 = float(_728);
    float _740 = fma(_684, _478, _712);
    float _742 = fma(_732, _734, _730);
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _746 = in.m_58.x;
    float _748 = in.m_58.y;
    float _750 = in.m_58.z;
    float _752 = _386 + _404;
    float _754 = fma(_738, _744, _742);
    float _756 = _672 * (-2.0);
    float _758 = _752 + (-1.0);
    float _760 = _708 * 0.15915493667125701904296875;
    float _762 = fma(_754, 3.1415927410125732421875, _590);
    float _764 = _386 + (-0.5);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _772 = fma(_762, _756, _762);
    float _774 = _740 * 0.15915493667125701904296875;
    float _776 = in.m_77.x;
    float _778 = in.m_77.y;
    float _780 = in.m_77.z;
    float _782 = fma(_766, _756, _766);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[196].x, _772);
    float _786 = 1.0 / _770;
    float _788 = in.m_79.x;
    float _790 = in.m_79.y;
    float _792 = in.m_79.z;
    float _794 = fma(_782, _478, _784);
    bool _796 = _404 > 0.5;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _800 = _798 != 0;
    float _802 = _794 * 0.15915493667125701904296875;
    float _804 = _192 * _748;
    float _806 = _760 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _186 * _748;
    float _812 = _180 * _748;
    float _814 = fma(_190, _746, _804);
    float _816 = fma(_184, _746, _810);
    bool _818 = _386 > 0.5;
    bool _820 = _818 && _800;
    float _822 = fma(_194, _750, _814);
    float _824 = _760 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _828;
    float _832 = fma(_188, _750, _816);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _836 = _834 != 0;
    float _838 = _778 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _840 = _780 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _842 = _830 * _786;
    float _844 = _776 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _846 = _802 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _790);
    float _852 = _838 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _792);
    float _856 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _860 = _368 + _858;
    float _862 = _852 * _850;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _866 = _802 * 6.283185482025146484375;
    float _868 = cos(_866);
    float _870 = _856 * _854;
    float _872 = fma(_842, _860, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _876 = _832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _878 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _880 = in.m_75.y;
    float _882 = _874 * _864;
    float _884 = _774 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = _848 * _808;
    float _890 = _848 * _826;
    bool _892 = _790 != 0.0;
    bool _894 = isnan(_790);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = fma(_178, _746, _812);
    float _904 = 0.0;
    float _906 = _792;
    if (_800)
    {
        _904 = _686;
    }
    float _908 = _904;
    float _910 = _872 * _438;
    bool _912 = _788 == 0.0;
    bool _914 = !_900;
    bool _916 = _912 && _914;
    float _918 = _774 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _868 * _826;
    float _924 = _868 * _808;
    bool _926 = _792 == 0.0;
    bool _928 = _926 && _916;
    float _930 = fma(_182, _750, _902);
    float _932 = _908;
    if (_820)
    {
        float _934 = -_908;
        float _936 = _934 + 1.0;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[115].x, _910);
    if (!_800)
    {
        _226 = _686;
    }
    float _942 = _226;
    float _944 = _886 * _808;
    float _946 = _848 * _886;
    float _948 = _886 * _826;
    float _950 = _868 * _886;
    float _952 = _942;
    if (_800)
    {
        _952 = _938;
    }
    float _954 = _952;
    float _956 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[116].x, _940);
    float _958 = -_880;
    float _960 = _958 + 1.0;
    float _962 = fma(_920, _888, _922);
    float _964 = -_924;
    float _966 = fma(_920, _890, _964);
    float _968 = -_890;
    float _970 = fma(_920, _924, _968);
    float _972 = fma(_920, _922, _888);
    float _974 = _962 * _862;
    float _976 = _966 * _862;
    float _978 = _946 * _862;
    float _980 = _880;
    if (_836)
    {
        float _982 = _796 ? _960 : _880;
        _980 = _982;
    }
    float _984 = _980;
    float _986 = fma(_944, _882, _974);
    float _988 = fma(_948, _882, _976);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _992 = fma(_970, _870, _986);
    float _994 = -_920;
    float _996 = fma(_994, _882, _978);
    float _998 = fma(_972, _870, _988);
    float _1000 = _992 * _318;
    float _1002 = _992 * _326;
    float _1004 = fma(_950, _870, _996);
    float _1006 = _992 * _322;
    float _1008 = fma(_998, _290, _1000);
    float _1010 = fma(_998, _298, _1002);
    float _1012 = fma(_998, _294, _1006);
    float _1014 = fma(_1004, _330, _1008);
    float _1016 = fma(_1004, _338, _1010);
    float _1018 = in.m_81.x;
    float _1020 = in.m_81.y;
    float _1022 = in.m_81.z;
    float _1024 = _876 + _1014;
    float _1026 = _878 + _1016;
    float _1028 = fma(_1004, _334, _1012);
    float _1030 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1032 = _1024 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1036 = _1026 + _1034;
    float _1038 = _1032 * _1032;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 + _1040;
    float _1044 = sqrt(_1042);
    float _1046 = _1020;
    float _1048 = _1018;
    float _1050 = _1022;
    float _1052 = _1038;
    float _1054 = _1040;
    float _1056 = _1024;
    float _1058 = _1026;
    if (!_928)
    {
        float _1060 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1020);
        _1046 = _1060;
    }
    float _1062 = _1046;
    if (!_928)
    {
        float _1064 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1018);
        _1048 = _1064;
    }
    float _1066 = _1048;
    if (!_928)
    {
        float _1068 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1022);
        _1050 = _1068;
    }
    float _1070 = _1050;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1074 = _962 * _1062;
    float _1076 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1078 = _946 * _1062;
    float _1080 = _966 * _1062;
    float _1082 = fma(_944, _1066, _1074);
    bool _1084 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = -_920;
    float _1088 = fma(_1086, _1066, _1078);
    float _1090 = fma(_970, _1070, _1082);
    float _1092 = _1076 + _1028;
    float _1094 = fma(_948, _1066, _1080);
    float _1096 = fma(_950, _1070, _1088);
    float _1098 = fma(_972, _1070, _1094);
    float _1100 = _1096;
    if (!_1084)
    {
        _906 = _1092;
    }
    float _1102 = _906;
    bool _1104 = !_1084;
    float _1106 = _1102;
    if (!_1104)
    {
        float _1108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1112 = _1044 + _1110;
        float _1114 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = rsqrt(_1042);
        float _1118 = _1112 * _1108;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1120 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = fma(_1124, _1114, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1132 = _1116 * _1130;
        float _1134 = _1128 + (-1.0);
        float _1136 = fma(_1032, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1138 = fma(_1036, _1132, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1140 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1144 = _1136 + _1142;
        float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1148 = _1138 + _1146;
        float _1150 = fma(_1092, _1128, _1140);
        float _1152 = _1144 * _1144;
        float _1154 = _1148 * _1148;
        _1106 = _1150;
        _1052 = _1152;
        _1054 = _1154;
        _1056 = _1136;
        _1058 = _1138;
    }
    float _1156 = _1106;
    float _1158 = _1052;
    float _1160 = _1054;
    float _1162 = _1056;
    float _1164 = _1058;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1168 = _1156 + _1166;
    float _1170 = _1090 * _318;
    float _1172 = _1090 * _322;
    float _1174 = _1090 * _326;
    float _1176 = fma(_1168, _1168, _1158);
    float _1178 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1180 = fma(_1098, _290, _1170);
    float _1182 = fma(_1098, _294, _1172);
    float _1184 = _1176 + _1160;
    float _1186 = fma(_1098, _298, _1174);
    float _1188 = _1178 * _1072;
    float _1190 = _954 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1192 = sqrt(_1184);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1198 = _1190 * _990;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1202 = fma(_1096, _334, _1182);
    float _1204 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1206 = fma(_1096, _330, _1180);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1210 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1216 = fma(_1096, _338, _1186);
    out.m_83.w = _1208;
    bool _1218 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1220 = isnan(_1192);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1226 = _1222 || _1224;
    out.m_85.x = _1198;
    out.m_85.y = _1188;
    out.m_87.x = _1210;
    out.m_87.y = _1212;
    out.m_87.z = _1214;
    out.m_87.w = _1204;
    out.m_89.x = _1206;
    out.m_89.y = _1202;
    out.m_89.z = _1216;
    if (!_1226)
    {
        _1100 = 1.0;
    }
    float _1228 = _1100;
    bool _1230 = !_1226;
    float _1232 = _1228;
    if (!_1230)
    {
        bool _1234 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1236 = isnan(_1192);
        bool _1238 = _1234 || _1236;
        bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1242 = _1238 || _1240;
        if (!_1242)
        {
            float _1244 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1246 = _1192 + _1244;
            float _1248 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1250 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1248;
            float _1252 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1254 = _1252 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1256 = 1.0 / _1250;
            float _1258 = _1246 * _1256;
            float _1260 = fma(_1258, _1254, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1232 = _1260;
            _1262 = true;
        }
        else
        {
            bool _1264 = _1192 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1266 = isnan(_1192);
            bool _1268 = _1264 || _1266;
            bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1272 = _1268 || _1270;
            if (!_1272)
            {
                float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1276 = _1192 + _1274;
                float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1280 = _1278 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1284 = _1282 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1286 = 1.0 / _1280;
                float _1288 = _1276 * _1286;
                float _1290 = fma(_1288, _1284, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1232 = _1290;
                _1262 = true;
            }
            else
            {
                _1232 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1262 = false;
    float _1292 = _1232;
    float _1294 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1298 = _1156 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1302 = _1162 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1306 = _1164 + _1304;
    float _1308 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1294);
    float _1310 = fma(_1298, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1312 = fma(_1302, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1314 = fma(_1306, _1292, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1316 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1308);
    float _1318 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1310 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1312 + _1324;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1318);
    float _1332 = _1322 * _1322;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1336 = _1314 + _1334;
    float _1338 = 1.0 / _1328;
    float _1340 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1330);
    float _1342 = fma(_1326, _1326, _1332);
    float _1344 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1346 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1348 = fma(_1336, _1336, _1342);
    float _1350 = _1346 + _1328;
    float _1352 = rsqrt(_1348);
    float _1354 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1356 = _1076 + _1354;
    float _1358 = _1350 * _1338;
    float _1360 = _1358 * 0.5;
    float _1362 = sqrt(_1348);
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1366 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1366);
    float _1370 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1372 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1364);
    float _1374 = 1.0 / _1368;
    float _1376 = _1326 * _1352;
    float _1378 = _1336 * _1352;
    float _1380 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1372);
    float _1382 = _1322 * _1352;
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1384 * _1384;
    float _1394 = _1386 * _1386;
    float _1396 = trunc(_1388);
    int _1398 = int(_1396);
    float _1400 = _1392 + _1394;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1374 * _1402;
    float _1406 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1408 = sqrt(_1400);
    bool _1410 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1412 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1406);
    bool _1414 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1416 = !_1410;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1412);
    int _1422 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1424 = _1398 + _1422;
    int _1426 = _1424 + 1;
    float _1428 = floor(_1370);
    float _1430 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1432 = 2;
    int _1434 = _1426;
    float _1436 = _1384;
    float _1438 = _1386;
    float _1440 = _1392;
    float _1442 = _1394;
    if (!_1410)
    {
        _1432 = 1;
    }
    int _1444 = _1432;
    int _1446 = _1444;
    if (!_1414)
    {
        _1446 = _1418;
    }
    int _1448 = _1446;
    float _1450 = trunc(_1430);
    int _1452 = int(_1450);
    bool _1454 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1458 = _1408 + _1456;
    int _1460 = _1448 << 6;
    bool _1462 = _1426 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1464 = _1460 + 96;
    uint _1467 = uint(int(uint(_1464) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.vp_c15)._m0[int(_1477)][_1479];
    float _1483 = -_1428;
    float _1485 = _1370 + _1483;
    float _1487 = _1164;
    float _1489 = _1458;
    if (_1454)
    {
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1487 = _1491;
    }
    float _1493 = _1487;
    int _1495 = _1460 + 104;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1515 = _1452 + _1513;
    int _1517 = _1515 + 1;
    int _1519 = _1426 | _1517;
    bool _1521 = _1519 < 0;
    bool _1523 = _1521 || _1462;
    float _1525 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1527 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1529 = _1527 || _1523;
    if (_1454)
    {
        float _1531 = _1458 * _1493;
        _1489 = _1531;
    }
    float _1533 = _1489;
    float _1535 = precise::max(0.0, _1525);
    if (_1454)
    {
        float _1537 = _1533 * 0.15915493667125701904296875;
        _304 = _1537;
    }
    float _1539 = _304;
    float _1541 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1543 = -_1382;
    float _1545 = -_1535;
    float _1547 = fma(_1543, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1545);
    float _1549 = _1182;
    float _1551 = _1547;
    if (_1454)
    {
        float _1553 = _1539 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1549 = _1555;
    }
    float _1557 = _1549;
    float _1559 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1541);
    if (!_1529)
    {
        int _1561 = _1517 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1563 = _1561 + _1426;
        _1434 = _1563;
    }
    int _1565 = _1434;
    float _1567 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1569 = _1493;
    if (_1454)
    {
        float _1571 = _1539 * 6.283185482025146484375;
        float _1573 = cos(_1571);
        _1569 = _1573;
    }
    float _1575 = _1569;
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1579 = 0;
    if (!_1529)
    {
        int _1581 = _1565 << 2;
        _1579 = _1581;
    }
    int _1583 = _1579;
    int _1585 = 0;
    int _1587 = _1583;
    if (!_1529)
    {
        uint _1589 = uint(int(uint(_1565) >> uint(2)));
        _1585 = int(_1589);
    }
    int _1591 = _1585;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_1529)
    {
        int _1595 = 12 & _1583;
        _1587 = _1595;
    }
    int _1597 = _1587;
    float _1599 = _1567;
    if (_1454)
    {
        float _1601 = rsqrt(_1400);
        _1599 = _1601;
    }
    float _1603 = _1599;
    float _1605 = _1356 * _1481;
    float _1607 = _1481;
    float _1609 = _1605;
    if (_1454)
    {
        float _1611 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1607 = _1611;
    }
    float _1613 = _1607;
    float _1615 = -_1593;
    float _1617 = fma(_1615, _1390, 1.0);
    float _1619 = fma(_876, _1473, _1605);
    float _1621 = _1557;
    float _1623 = _1613;
    if (_1454)
    {
        float _1625 = fma(_1557, _1613, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1621 = _1625;
    }
    float _1627 = _1621;
    if (_1454)
    {
        float _1629 = _1575 + (-1.0);
        _1609 = _1629;
    }
    float _1631 = _1609;
    float _1633 = fma(_878, _1503, _1619);
    float _1635 = log2(_1617);
    if (_1454)
    {
        float _1637 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1623 = _1637;
    }
    float _1639 = _1623;
    float _1641 = _1633 + _1511;
    int _1643 = _1460 + 72;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    float _1661 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1663 = _1603;
    if (_1454)
    {
        float _1665 = _1603 * _1627;
        _1663 = _1665;
    }
    float _1667 = _1663;
    if (_1454)
    {
        float _1669 = fma(_1547, _1575, _1639);
        _1551 = _1669;
    }
    float _1671 = _1551;
    float _1673 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1675 = floor(_1661);
    if (_1454)
    {
        float _1677 = _1384 * _1667;
        _1436 = _1677;
    }
    float _1679 = _1436;
    if (_1454)
    {
        float _1681 = _1386 * _1667;
        _1438 = _1681;
    }
    float _1683 = _1438;
    int _1685 = _1460 + 64;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    if (_1454)
    {
        float _1703 = _1679 * _1679;
        _1440 = _1703;
    }
    float _1705 = _1440;
    if (_1454)
    {
        float _1707 = _1683 * _1683;
        _1442 = _1707;
    }
    float _1709 = _1442;
    float _1711 = _1635 * 0.693147182464599609375;
    float _1713 = fma(_1671, _1671, _1705);
    float _1715 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1717 = _1460 + 48;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    float _1735 = _1713 + _1709;
    float _1737 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1715);
    float _1739 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1673);
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1743 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1741);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1344);
    float _1749 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1737);
    int _1751 = _1460 + 56;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1739);
    float _1771 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1773 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1775 = -_1745;
    float _1777 = _1775 + 1.0;
    float _1779 = _1769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1781 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1783 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1785 = _1460 + 80;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    float _1803 = rsqrt(_1735);
    float _1805 = -_1675;
    float _1807 = _1661 + _1805;
    float _1809 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1783);
    float _1811 = _1783;
    if (!_1529)
    {
        int _1813 = _1591 << 4;
        int _1815 = _1813 + _1597;
        _1811 = as_type<float>(_1815);
    }
    float _1817 = _1811;
    float _1819 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1809);
    int _1821 = _1460 + 88;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    float _1839 = 1.0 / _1641;
    float _1841 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1819);
    float _1843 = _1817;
    float _1845 = _1841;
    if (!_1529)
    {
        int _1847 = as_type<int>(_1817) + 400;
        uint _1849 = uint(int(uint(_1847) >> uint(2)));
        uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
        int _1853 = int(_1849) & 3;
        float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
        _1843 = _1855;
    }
    float _1857 = _1843;
    float _1859 = _1803 * _1679;
    float _1861 = abs(_1777);
    float _1863 = log2(_1861);
    float _1865 = _1803 * _1671;
    float _1867 = _1803 * _1683;
    float _1869 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1871 = _1356 * _1701;
    float _1873 = fma(_876, _1693, _1871);
    float _1875 = _1356 * _1733;
    float _1877 = fma(_878, _1651, _1873);
    float _1879 = 1.0 / _1841;
    float _1881 = fma(_876, _1725, _1875);
    float _1883 = _1877 + _1659;
    float _1885 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1887 = fma(_878, _1759, _1881);
    float _1889 = exp2(_1885);
    float _1891 = _1887 + _1767;
    float _1893 = -_1869;
    float _1895 = fma(_1865, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1893);
    float _1897 = _1891 * _1839;
    float _1899 = _1883 * _1839;
    float _1901 = _1356 * _1801;
    float _1903 = -_1867;
    float _1905 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1895);
    float _1907 = _1883;
    float _1909 = _1905;
    if (!_1529)
    {
        float _1911 = floor(_1388);
        _1907 = _1911;
    }
    float _1913 = _1907;
    bool _1915 = _1897 >= 0.0;
    float _1917 = fma(_876, _1793, _1901);
    float _1919 = fma(_1905, -0.5, 0.5);
    bool _1921 = _1897 <= 1.0;
    bool _1923 = _1921 && _1915;
    float _1925 = fma(_1905, 0.5, 0.5);
    float _1927 = fma(_878, _1829, _1917);
    float _1929 = _1895;
    if (!_1529)
    {
        float _1931 = floor(_1430);
        _1929 = _1931;
    }
    float _1933 = _1929;
    bool _1935 = _1899 >= 0.0;
    bool _1937 = _1935 && _1923;
    float _1939 = fma(_1925, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1941 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1943 = _1899 <= 1.0;
    bool _1945 = _1943 && _1937;
    float _1947 = fma(_1925, _1939, -0.212114393711090087890625);
    float _1949 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1951 = sqrt(_1919);
    float _1953 = fma(_1925, _1947, 1.570728778839111328125);
    float _1955 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1949);
    float _1957 = _1949;
    if (!_1529)
    {
        float _1959 = -_1933;
        float _1961 = _1430 + _1959;
        _1909 = _1961;
    }
    float _1963 = _1909;
    float _1965 = _1927 + _1837;
    if (_1945)
    {
        float _1967 = float(_1448);
        _1957 = _1967;
    }
    float _1969 = _1957;
    float _1971 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1941);
    float _1973 = _1927;
    if (!_1529)
    {
        float _1975 = rint(_1857);
        float _1977 = precise::max(_1975, 0.0);
        uint _1979 = uint(_1977);
        uint _1981 = clamp(_1979, 0u, 65535u);
        _1973 = as_type<float>(_1981);
    }
    float _1983 = _1973;
    float _1985 = _1865 + 1.0;
    float _1987 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1971);
    float _1989 = _1951 * 0.636619746685028076171875;
    float _1991 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1955);
    float _1993 = -_1865;
    float _1995 = fma(_1889, _1985, _1993);
    float _1997 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1987);
    float _1999 = _1969;
    float _2001 = _1987;
    float _2003 = _1997;
    if (_1945)
    {
        float _2005 = rint(_1969);
        float _2007 = precise::max(_2005, 0.0);
        uint _2009 = uint(_2007);
        uint _2011 = clamp(_2009, 0u, 65535u);
        _1999 = as_type<float>(_2011);
    }
    float _2013 = _1999;
    float _2015 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1991);
    float _2017 = _2015;
    if (!_1529)
    {
        float _2019 = -_1913;
        float _2021 = _1388 + _2019;
        _2001 = _2021;
    }
    float _2023 = _2001;
    float _2025 = _1997 * _1879;
    float _2027 = -_1953;
    float _2029 = fma(_1989, _2027, 1.0);
    float _2031 = _2015 * _1879;
    float _2033 = _1965 * _1839;
    float _2035 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2037 = fma(_2025, 0.5, 0.5);
    float _2039 = fma(_2031, -0.5, 0.5);
    float _2041 = fma(_1995, 0.5, 0.5);
    float2 _5890 = float2(_1807, _1485);
    float _2043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5890, float2(0.0), isnan(_5890)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5890, float2(0.0), isnan(_5890)), level(0.0)).x;
    float _2045 = _1963;
    if (!_1529)
    {
        float3 _5907 = float3(_2023, _1963, float(as_type<int>(_1983)));
        float3 _5911 = select(_5907, float3(0.0), isnan(_5907));
        float _2047 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5911.xy, uint(rint(_5911.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5911.xy, uint(rint(_5911.z)), level(0.0)).x;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = _2013;
    if (_1945)
    {
        float3 _5926 = float3(_1897, _1899, float(as_type<int>(_2013)));
        float3 _5928 = select(_5926, float3(0.0), isnan(_5926));
        float _2053 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5928.xy, uint(rint(_5928.z)), _2033, level(0.0));
        _2051 = _2053;
    }
    float _2055 = _2051;
    float3 _5938 = float3(_2037, _2039, _2035);
    float _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5938, float3(0.0), isnan(_5938)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5938, float3(0.0), isnan(_5938)), level(0.0)).x;
    float3 _5947 = float3(_2037, _2039, _2035);
    float4 _2060 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _2062 = _2060.x;
    float _2064 = _2060.y;
    float _2066 = _2060.z;
    float _2068 = _2060.w;
    float2 _5963 = float2(_2029, _2041);
    float3 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).xyz;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = abs(_1404);
    float _2082 = log2(_2080);
    float _2084 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2086 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2088 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2084);
    float _2090 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2088);
    float _2092 = _1997 + _1841;
    float _2094 = _1841 * 0.5;
    float _2096 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2090);
    float _2098 = _2092 * 0.5;
    float _2100 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2102 = _2096 + _1841;
    out.gl_Position.x = _1997;
    out.gl_Position.y = _2015;
    out.gl_Position.z = _2096;
    out.gl_Position.w = _1841;
    float _2104 = _2102 * 0.5;
    float _2106 = exp2(_2100);
    float _2108 = fma(_2015, -0.5, _2094);
    bool _2110 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan(0.5);
    bool _2118 = _2114 || _2116;
    out.m_91.x = _2098;
    out.m_91.y = _2108;
    out.m_91.z = _2104;
    out.m_91.w = _1841;
    bool _2120 = _1404 <= 8000.0;
    bool _2122 = isnan(_1404);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan(8000.0);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = _2104;
    float _2138 = _2108;
    if (_2118)
    {
        _2003 = 1.0;
    }
    float _2140 = _2003;
    float _2142 = _2140;
    if (_2118)
    {
        _2017 = 1.0;
    }
    float _2144 = _2017;
    float _2146 = fma(_2134, -2.0, 3.0);
    float _2148 = _2134 * _2134;
    float _2150 = _2148 * _2146;
    float _2152 = exp2(_2086);
    float _2154 = -_2150;
    float _2156 = _2154 + 1.0;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2150);
    float _2160 = _2130 * _2158;
    float _2162 = _2144;
    if (!_2118)
    {
        float _2164 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2166;
        float _2170 = _2164 * 0.15915493667125701904296875;
        float _2172 = _2170 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        float _2176 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2178 = _2176 * 0.15915493667125701904296875;
        float _2180 = _2170 * 6.283185482025146484375;
        float _2182 = sin(_2180);
        float _2184 = 1.0 / _2174;
        float _2186 = _2178 * 6.283185482025146484375;
        float _2188 = cos(_2186);
        float _2190 = _2182 * _2184;
        float _2192 = _2178 * 6.283185482025146484375;
        float _2194 = sin(_2192);
        float _2196 = _2188 * _2190;
        float _2198 = 1.0 / _2168;
        float _2200 = 1.0 / _2196;
        float _2202 = _2194 * _2200;
        float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2206 = fma(_1404, _2202, _2204);
        float _2208 = _2206 * _2198;
        float _2210 = precise::clamp(_2208, 0.0, 1.0);
        _2136 = _2168;
        _1845 = _2196;
        _2162 = _2210;
        _2138 = _2184;
    }
    float _2212 = _2136;
    float _2214 = _1845;
    float _2216 = _2162;
    float _2218 = _2138;
    float _2220 = _2212;
    float _2222 = _2214;
    float _2224 = _2218;
    if (!_2118)
    {
        float _2226 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2228 = _2226 * 0.15915493667125701904296875;
        float _2230 = _2228 * 6.283185482025146484375;
        float _2232 = cos(_2230);
        float _2234 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2236 = _2234 * 0.15915493667125701904296875;
        float _2238 = _2228 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = 1.0 / _2232;
        float _2244 = _2236 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        float _2248 = _2240 * _2242;
        float _2250 = _2236 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2246 * _2248;
        float _2256 = 1.0 / _2254;
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2260 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2258;
        float _2262 = 1.0 / _2260;
        float _2264 = _2252 * _2256;
        float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2268 = fma(_1404, _2264, _2266);
        float _2270 = _2268 * _2262;
        float _2272 = precise::clamp(_2270, 0.0, 1.0);
        float _2274 = -_2272;
        float _2276 = _2274 + 1.0;
        _2220 = _2228;
        _2222 = _2260;
        _2142 = _2276;
        _2224 = _2252;
    }
    float _2278 = _2220;
    float _2280 = _2222;
    float _2282 = _2142;
    float _2284 = _2224;
    float _2286 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2288 = -_2043;
    float _2290 = _2288 + 1.0;
    float _2292 = -_2152;
    float _2294 = _2292 + 1.0;
    float _2296 = _2280;
    float _2298 = _2286;
    float _2300 = _2284;
    float _2302 = _2278;
    if (!_1945)
    {
        _2296 = 1.0;
    }
    float _2304 = _2296;
    float _2306 = _2290 * _2286;
    float _2308 = precise::clamp(_2306, 0.0, 1.0);
    float _2310 = _2304;
    float _2312 = _2308;
    if (_1945)
    {
        bool _2314 = _2055 >= _2033;
        bool _2316 = isnan(_2055);
        bool _2318 = _2314 || _2316;
        bool _2320 = isnan(_2033);
        bool _2322 = _2318 || _2320;
        float _2324 = float(_2322);
        _2310 = _2324;
    }
    float _2326 = _2310;
    float _2328 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1529)
    {
        _2298 = 1.0;
    }
    float _2330 = _2298;
    float _2332 = _2330;
    if (!_1529)
    {
        int _2334 = _1565 << 4;
        int _2336 = _2334 + 2048;
        uint _2338 = uint(int(uint(_2336) >> uint(2)));
        uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
        int _2342 = int(_2338) & 3;
        float _2344 = (*spvDescriptorSet0.vp_c15)._m0[int(_2340)][_2342];
        int _2346 = int(_2338) + 1;
        uint _2348 = uint(int(uint(_2346) >> uint(2)));
        int _2350 = _2346 & 3;
        float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
        int _2354 = _2336 + 8;
        uint _2356 = uint(int(uint(_2354) >> uint(2)));
        uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
        int _2360 = int(_2356) & 3;
        float _2362 = (*spvDescriptorSet0.vp_c15)._m0[int(_2358)][_2360];
        int _2364 = int(_2356) + 1;
        uint _2366 = uint(int(uint(_2364) >> uint(2)));
        int _2368 = _2364 & 3;
        float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
        float _2372 = _1356 * _2352;
        float _2374 = fma(_876, _2344, _2372);
        float _2376 = fma(_878, _2362, _2374);
        float _2378 = _2376 + _2370;
        float _2380 = precise::clamp(_2378, 0.0, 1.0);
        float _2382 = -_2380;
        float _2384 = _2382 + _2049;
        float _2386 = fma(_2384, 500.0, 1.5);
        float _2388 = exp2(_2386);
        float _2390 = 0.0 + _2388;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        _2332 = _2392;
        _2300 = _2388;
        _2302 = _2344;
    }
    float _2394 = _2332;
    float _2396 = _2300;
    float _2398 = _2302;
    float _2400 = _2326 * _2394;
    float _2402 = _2328 * _2057;
    float _2404 = -_2308;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2408 = -_2328;
    float _2410 = _2408 + 1.0;
    out.m_93.x = _1312;
    out.m_93.y = _1310;
    out.m_93.z = _1314;
    float _2412 = _2068 * _2402;
    float _2414 = -_2400;
    float _2416 = fma(_2414, _2406, 1.0);
    float _2418 = precise::clamp(_2416, 0.0, 1.0);
    float _2420 = _2078 * _2402;
    float _2422 = _2068 * _2410;
    float _2424 = fma(_2074, _2412, _2062);
    float _2426 = fma(_2076, _2412, _2064);
    float _2428 = _2418 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2430 = fma(_2068, _2420, _2066);
    bool _2432 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2434 = isnan(_1362);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2440 = _2436 || _2438;
    float _2442 = _2216 * _2282;
    out.m_95.x = _2428;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2424;
    out.m_97.y = _2426;
    out.m_97.z = _2430;
    out.m_97.w = _2422;
    float _2446 = _2398;
    float _2448 = _2396;
    float _2450 = _2412;
    float _2452 = _2400;
    float _2454 = _2418;
    if (!_2440)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2456 = _2446;
    float _2458 = _2456;
    float _2460 = _2456;
    if (!_2440)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2462 = _2448;
    float _2464 = _2462;
    float _2466 = _2462;
    if (!_2440)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2468 = _2312;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2440)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2474 = _2450;
    float _2476 = _2474;
    float _2478 = _2474;
    if (!_2440)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2480 = _2452;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2440)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2486 = _2454;
    bool _2488 = !_2440;
    float _2490 = _2486;
    float _2492 = _2486;
    if (!_2488)
    {
        bool _2494 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1362);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1362 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2516 = 1.0 / _2510;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2516;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2542 = fma(_2536, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2466 = _2546;
            _2484 = _2550;
            _2460 = _2542;
            _2478 = _2548;
            _2472 = _2544;
            _2492 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1362);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2458 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2458;
            _2460 = _2566;
            if (!_2564)
            {
                _2464 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2464;
            _2466 = _2568;
            if (!_2564)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2470;
            _2472 = _2570;
            if (!_2564)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2476;
            _2478 = _2572;
            if (!_2564)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2482;
            _2484 = _2574;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2490;
            bool _2578 = !_2564;
            _2492 = _2576;
            if (!_2578)
            {
                bool _2580 = _1362 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1362);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1362 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = 1.0 / _2596;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2602;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2628 = fma(_2622, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2466 = _2632;
                    _2484 = _2636;
                    _2460 = _2628;
                    _2478 = _2634;
                    _2472 = _2630;
                    _2492 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2466 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2460 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2466;
    float _2642 = _2484;
    float _2644 = _2460;
    float _2646 = _2478;
    float _2648 = _2472;
    float _2650 = _2492;
    float _2652 = fma(_1202, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = _2444 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = -_2644;
    float _2664 = _2662 + _2646;
    out.m_99.x = 0.0;
    float _2666 = fma(_2654, _2658, _2640);
    float _2668 = fma(_2654, _2664, _2644);
    out.m_61.x = _2660;
    float _2670 = -_2648;
    float _2672 = _2670 + _2650;
    float _2674 = _2666 * 0.586610972881317138671875;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2654, _2672, _2648);
    float _2680 = fma(_2668, 0.298911988735198974609375, _2674);
    bool _2682 = _2216 > 0.0;
    bool _2684 = isnan(_2216);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    out.m_101.x = 0.0;
    float _2692 = fma(_2678, 0.114477999508380889892578125, _2680);
    bool _2694 = _2282 <= 0.0;
    bool _2696 = !_2690;
    bool _2698 = _2694 || _2696;
    float _2700 = -_2692;
    float _2702 = _2668 + _2700;
    float _2704 = -_2692;
    float _2706 = _2666 + _2704;
    float _2708 = -_2692;
    float _2710 = _2678 + _2708;
    float _2712 = fma(_2702, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2714 = fma(_2706, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2716 = fma(_2710, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    bool _2718 = !_2676;
    if (!_2718)
    {
        float _2720 = -_1310;
        float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2724 = -_1312;
        float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2728 = -_1314;
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2732 = _2722 * _2722;
        float _2734 = fma(_2726, _2726, _2732);
        float _2736 = fma(_2730, _2730, _2734);
        float _2738 = rsqrt(_2736);
        float _2740 = _2722 * _2738;
        float _2742 = _2726 * _2738;
        float _2744 = _2730 * _2738;
        float _2746 = sqrt(_2736);
        float _2748 = -_1382;
        float _2750 = _2748 + _2740;
        float _2752 = -_1376;
        float _2754 = _2752 + _2742;
        float _2756 = -_1378;
        float _2758 = _2756 + _2744;
        float _2760 = _2750 * _2750;
        float _2762 = fma(_2754, _2754, _2760);
        float _2764 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2766 = precise::clamp(_2764, 0.0, 1.0);
        float _2768 = fma(_2758, _2758, _2762);
        float _2770 = _2766 * _2766;
        float _2772 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2774 = -_2746;
        float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2778 = _2770 + (-1.0);
        float _2780 = rsqrt(_2768);
        float _2782 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2784 = precise::clamp(_2782, 0.0, 1.0);
        float _2786 = -_2740;
        float _2788 = -_2772;
        float _2790 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2788);
        float _2792 = -_2744;
        float _2794 = fma(_2792, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2790);
        float _2796 = abs(_2784);
        float _2798 = log2(_2796);
        float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2802 = _2794 + _2800;
        float _2804 = _2750 * _2780;
        float _2806 = _2754 * _2780;
        float _2808 = _2758 * _2780;
        float _2810 = _1202 * _2804;
        float _2812 = _1202 * _2740;
        float _2814 = fma(_1206, _2806, _2810);
        float _2816 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2818 = fma(_1206, _2742, _2812);
        float _2820 = fma(_1216, _2808, _2814);
        float _2822 = precise::clamp(_2820, 0.0, 1.0);
        float _2824 = fma(_1216, _2744, _2818);
        float _2826 = precise::clamp(_2824, 0.0, 1.0);
        float _2828 = exp2(_2816);
        float _2830 = _2822 * _2822;
        float _2832 = fma(_2830, _2778, 1.0);
        float _2834 = _2832 * _2832;
        float _2836 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2838 = precise::clamp(_2836, 0.0, 1.0);
        float _2840 = 1.0 / _2834;
        float _2842 = _2828 * _2838;
        float _2844 = _2826 * _2842;
        float _2846 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2848 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2850 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2852 = _2770 * _2840;
        out.m_99.x = _2846;
        out.m_99.y = _2848;
        out.m_99.z = _2850;
        float _2854 = _2844 * _2852;
        float _2856 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2860 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2856;
        out.m_101.y = _2858;
        out.m_101.z = _2860;
    }
    out.m_103.x = _2712;
    out.m_103.y = _2714;
    out.m_103.z = _2716;
    if (!_2698)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2862 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2862;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

