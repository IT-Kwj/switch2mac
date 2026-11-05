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
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_85 [[user(locn0)]];
    float4 m_83 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_71 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_79 [[attribute(11)]];
    float4 m_75 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2244 = false;
    bool _1010 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2589 = as_type<float>(_136);
        out.gl_Position.z = _2589;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    if (_150)
    {
        float _158 = float(_120);
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    if (_166)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _130;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _138 = as_type<int>(_170);
    }
    int _172 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_172);
        out.gl_Position.z = _2657;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_65.y;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_65.z;
    float _180 = in.m_67.y;
    float _182 = in.m_67.z;
    float _184 = in.m_69.y;
    float _186 = in.m_69.z;
    float _188 = _174 * _174;
    float _190 = in.m_65.x;
    float _192 = _178 * _178;
    float _194 = in.m_67.x;
    float _196 = fma(_180, _180, _188);
    float _198 = in.m_69.x;
    float _200 = fma(_182, _182, _192);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _200);
    float _206 = sqrt(_202);
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = sqrt(_204);
    bool _216 = _206 > 0.0;
    bool _218 = _214 > 0.0;
    float _220 = _174 * _210;
    float _222 = _180 * _210;
    float _224 = _184 * _210;
    float _226 = 0.0;
    if (_216)
    {
        float _228 = rsqrt(_202);
        _226 = _228;
    }
    float _230 = _226;
    float _232 = fma(_208, _190, _220);
    float _234 = fma(_208, _194, _222);
    float _236 = fma(_208, _198, _224);
    float _238 = 0.0;
    float _240 = 0.0;
    float _242 = _232;
    if (!_216)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _244 = _238;
    float _246 = _240;
    float _248 = fma(_178, _212, _232);
    float _250 = 0.0;
    float _252 = _246;
    float _254 = _244;
    if (!_216)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = fma(_182, _212, _234);
    float _260 = _204;
    float _262 = _256;
    if (_218)
    {
        float _264 = rsqrt(_204);
        _260 = _264;
    }
    float _266 = _260;
    float _268 = 0.0;
    if (!_218)
    {
        _268 = 0.0;
    }
    float _270 = _268;
    float _272 = fma(_186, _212, _236);
    float _274 = _270;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _276 = _242;
    float _278 = 0.0;
    float _280 = _276;
    if (!_218)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = _282;
    if (_216)
    {
        float _286 = _230 * _180;
        _252 = _286;
    }
    float _288 = _252;
    float _290 = _288;
    if (_216)
    {
        float _292 = _230 * _174;
        _254 = _292;
    }
    float _294 = _254;
    float _296 = _294;
    if (_216)
    {
        float _298 = _230 * _184;
        _262 = _298;
    }
    float _300 = _262;
    float _302 = _300;
    if (_218)
    {
        float _304 = _266 * _182;
        _274 = _304;
    }
    float _306 = _274;
    if (_218)
    {
        float _308 = _266 * _178;
        _280 = _308;
    }
    float _310 = _280;
    if (_218)
    {
        float _312 = _266 * _186;
        _284 = _312;
    }
    float _314 = _284;
    bool _316 = !_176;
    float _334;
    if (!_316)
    {
        float _318 = in.m_73.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        float _338 = float(_120);
        float _340 = 1.0 / _338;
        float _342 = _154 * _340;
        _334 = _342;
    }
    _336 = false;
    float _344 = _334;
    float _346 = in.m_58.x;
    float _348 = in.m_58.y;
    float _350 = in.m_58.z;
    float _352 = _248 * _248;
    float _354 = _154 * 0.15915493667125701904296875;
    float _356 = in.m_75.x;
    float _358 = fma(_258, _258, _352);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = _354 * 6.283185482025146484375;
    float _370 = sin(_368);
    float _372 = fma(_272, _272, _358);
    float _374 = in.m_69.w;
    float _376 = 1.0 / _362;
    float _378 = _180 * _348;
    float _380 = 1.0 / _366;
    float _382 = _184 * _348;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _344 + _384;
    float _388 = fma(_194, _346, _378);
    float _390 = _370 * _356;
    float _392 = in.m_77.x;
    float _394 = fma(_198, _346, _382);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _344 + _396;
    float _400 = rsqrt(_372);
    float _402 = _386 * _376;
    float _404 = fma(_182, _350, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    bool _410 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_344);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _398 * _380;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = fma(_426, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _440 = fma(_430, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = _258 * _400;
    float _448 = _248 * _400;
    float _450 = _272 * _400;
    bool _452 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _454 = isnan(_344);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _468 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_344);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = _448 * _294;
    bool _482 = _392 > 0.0;
    float _484 = fma(_436, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _486 = _392 >= 0.0;
    bool _488 = isnan(_392);
    bool _490 = _486 || _488;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    float _496 = -_478;
    float _498 = _496 + 1.0;
    float _500 = fma(_446, _288, _480);
    float _502 = fma(_444, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _504 = _494 ? 0 : 1;
    float _506 = _462 * _498;
    float _508 = -_462;
    float _510 = _508 + 1.0;
    float _512 = fma(_450, _300, _500);
    int _514 = ~_504;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_466, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _522 = _420 * _510;
    int _524 = _518;
    if (!_482)
    {
        int _526 = ~_504;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = -_420;
    float _534 = _532 + 1.0;
    float _536 = abs(_512);
    bool _538 = _536 > 0.99989998340606689453125;
    float _540 = _438 * _522;
    float _542 = float(_530);
    float _544 = _432 * _522;
    float _546 = _440 * _522;
    float _548 = _390 * 60.0;
    float _550 = in.m_79.x;
    float _552 = in.m_79.y;
    float _554 = in.m_79.z;
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _540);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _560 = _542 * _548;
    float _562 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _546);
    float _564 = fma(_502, _506, _556);
    float _566 = fma(_484, _506, _558);
    float _568 = _560 * 0.01745329238474369049072265625;
    float _570 = in.m_77.z;
    if (_538)
    {
        float _572 = fma(_306, 0.001000000047497451305389404296875, _288);
        _290 = _572;
    }
    float _574 = _290;
    if (_538)
    {
        float _576 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _576;
    }
    float _578 = _302;
    float _580 = _568 * 0.15915493667125701904296875;
    if (_538)
    {
        float _582 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _582;
    }
    float _584 = _296;
    float _586 = -_574;
    float _588 = _450 * _586;
    float _590 = -_578;
    float _592 = _448 * _590;
    float _594 = _580 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = fma(_520, _506, _562);
    float _600 = -_578;
    float _602 = -_588;
    float _604 = fma(_446, _600, _602);
    float _606 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].x, _566);
    float _608 = -_584;
    float _610 = -_592;
    float _612 = fma(_450, _608, _610);
    float _614 = -_584;
    float _616 = _446 * _614;
    float _618 = _604 * _604;
    float _620 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].y, _564);
    float _622 = _580 * 6.283185482025146484375;
    float _624 = cos(_622);
    float _626 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].z, _598);
    float _628 = in.m_77.y;
    float _630 = _606 * _550;
    float _632 = _542 * 0.02999999932944774627685546875;
    float _634 = -_574;
    float _636 = -_616;
    float _638 = fma(_448, _634, _636);
    float _640 = fma(_612, _612, _618);
    float _642 = _626 * _554;
    float _644 = -_632;
    float _646 = _644 + _392;
    float _648 = _570 + (-0.070000000298023223876953125);
    float _650 = fma(_638, _638, _640);
    float _652 = in.m_67.w;
    float _654 = _596 * _646;
    float _656 = _620 * _552;
    float _658 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = _624 * _646;
    float _662 = rsqrt(_650);
    float _664 = -_654;
    float _666 = fma(_624, _648, _664);
    float _668 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _670 = fma(_596, _648, _660);
    float _672 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = _666 + 0.070000000298023223876953125;
    float _676 = fma(_186, _350, _394);
    float _678 = _632 + _670;
    float _680 = in.m_81.z;
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _678);
    bool _688 = _628 != 0.0;
    bool _690 = isnan(_628);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = _174 * _348;
    float _700 = _672 * _684;
    float _702 = _658 * _686;
    float _704 = _668 * _682;
    float _706 = _612 * _662;
    float _708 = _638 * _662;
    float _710 = _604 * _662;
    float _712 = _700 * _446;
    float _714 = _700 * _450;
    float _716 = _448 * _708;
    float _718 = _446 * _710;
    float _720 = fma(_702, _706, _712);
    float _722 = fma(_702, _708, _714);
    float _724 = -_716;
    float _726 = fma(_450, _710, _724);
    float _728 = -_718;
    float _730 = fma(_448, _706, _728);
    float _732 = _404 + _652;
    float _734 = _676 + _374;
    float _736 = fma(_704, _726, _720);
    float _738 = fma(_704, _730, _722);
    float _740 = -_632;
    bool _742 = _670 == _740;
    bool _744 = !_696;
    bool _746 = _742 && _744;
    float _748 = in.m_65.w;
    float _750 = _732 + _736;
    float _752 = _734 + _738;
    float _754 = fma(_190, _346, _698);
    float _756 = in.m_81.x;
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _760 = _750 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _764 = _752 + _762;
    float _766 = _700 * _448;
    float _768 = in.m_81.y;
    float _770 = _760 * _760;
    float _772 = _764 * _764;
    float _774 = _450 * _706;
    bool _776 = _666 == (-0.070000000298023223876953125);
    bool _778 = _776 && _746;
    float _780 = fma(_178, _350, _754);
    float _782 = _770 + _772;
    float _784 = fma(_702, _710, _766);
    float _786 = -_774;
    float _788 = fma(_446, _708, _786);
    float _790 = sqrt(_782);
    float _792 = fma(_704, _788, _784);
    float _794 = _624 * _756;
    float _796 = _596 * _756;
    float _798 = _780 + _748;
    float _800 = fma(_596, _680, _794);
    float _802 = -_796;
    float _804 = fma(_624, _680, _802);
    bool _806 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _808 = _798 + _792;
    float _810 = _800;
    float _812 = _804;
    float _814 = _794;
    float _816 = _766;
    float _818 = _678;
    float _820 = _632;
    float _822 = _624;
    float _824 = _730;
    if (!_778)
    {
        float _826 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _800);
        _810 = _826;
    }
    float _828 = _810;
    float _830 = _768;
    if (!_778)
    {
        float _832 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _768);
        _830 = _832;
    }
    float _834 = _830;
    if (!_778)
    {
        float _836 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _804);
        _812 = _836;
    }
    float _838 = _812;
    if (!_806)
    {
        _814 = _772;
    }
    float _840 = _814;
    float _842 = _840;
    if (!_806)
    {
        _816 = _770;
    }
    float _844 = _816;
    float _846 = _844;
    if (!_806)
    {
        _818 = _750;
    }
    float _848 = _818;
    float _850 = _848;
    if (!_806)
    {
        _820 = _752;
    }
    float _852 = _820;
    float _854 = _852;
    if (!_806)
    {
        _822 = _808;
    }
    float _856 = _822;
    bool _858 = !_806;
    float _860 = _856;
    if (!_858)
    {
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _866 = _790 + _864;
        float _868 = rsqrt(_782);
        float _870 = _866 * _862;
        float _872 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = _870 * 0.15915493667125701904296875;
        float _876 = _874 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _874 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = fma(_878, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _886 = _868 * _884;
        float _888 = _882 + (-1.0);
        float _890 = fma(_760, _886, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _892 = fma(_764, _886, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _894 = _888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _898 = _890 + _896;
        float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _902 = _892 + _900;
        float _904 = fma(_808, _882, _894);
        float _906 = _898 * _898;
        float _908 = _902 * _902;
        _860 = _904;
        _846 = _906;
        _842 = _908;
        _850 = _890;
        _854 = _892;
    }
    float _910 = _860;
    float _912 = _846;
    float _914 = _842;
    float _916 = _850;
    float _918 = _854;
    float _920 = in.m_75.w;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _924 = _910 + _922;
    float _926 = _448 * _834;
    float _928 = _446 * _834;
    float _930 = _450 * _834;
    float _932 = fma(_924, _924, _912);
    float _934 = fma(_710, _828, _926);
    float _936 = fma(_706, _828, _928);
    float _938 = fma(_708, _828, _930);
    float _940 = _932 + _914;
    float _942 = fma(_788, _838, _934);
    float _944 = sqrt(_940);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = fma(_726, _838, _936);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = fma(_730, _838, _938);
    out.m_83.w = _920;
    out.m_85.x = _954;
    out.m_85.y = _958;
    out.m_85.z = _960;
    out.m_85.w = _956;
    bool _964 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _966 = isnan(_944);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _972 = _968 || _970;
    out.m_87.x = _950;
    out.m_87.y = _942;
    out.m_87.z = _962;
    float _974 = _918;
    if (!_972)
    {
        _824 = 1.0;
    }
    float _976 = _824;
    bool _978 = !_972;
    float _980 = _976;
    if (!_978)
    {
        bool _982 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _984 = isnan(_944);
        bool _986 = _982 || _984;
        bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _990 = _986 || _988;
        if (!_990)
        {
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = _944 + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1002 = _1000 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1004 = 1.0 / _998;
            float _1006 = _994 * _1004;
            float _1008 = fma(_1006, _1002, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _980 = _1008;
            _1010 = true;
        }
        else
        {
            bool _1012 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1014 = isnan(_944);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1020 = _1016 || _1018;
            if (!_1020)
            {
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _944 + _1022;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1034 = 1.0 / _1028;
                float _1036 = _1024 * _1034;
                float _1038 = fma(_1036, _1032, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _980 = _1038;
                _1010 = true;
            }
            else
            {
                _980 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1010 = false;
    float _1040 = _980;
    float _1042 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1044 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1046 = floor(_1042);
    float _1048 = floor(_1044);
    float _1050 = -_1046;
    float _1052 = _1042 + _1050;
    float _1054 = -_1048;
    float _1056 = _1044 + _1054;
    float2 _4037 = float2(_1052, _1056);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4037, float2(0.0), isnan(_4037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4037, float2(0.0), isnan(_4037)), level(0.0)).x;
    float _1060 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1064 = _916 + _1062;
    float _1066 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1060);
    float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1070 = _910 + _1068;
    float _1072 = fma(_1064, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1074 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1066);
    float _1076 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1078 = fma(_1070, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1082 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1076);
    float _1084 = 1.0 / _1080;
    float _1086 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1082);
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1090 = _1088 + _1080;
    float _1092 = _1090 * _1084;
    float _1094 = _1092 * 0.5;
    float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1098 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1096);
    float _1100 = 1.0 / _1098;
    float _1102 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1104 = _798 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1108 = _1100 * _1106;
    float _1110 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1114 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1116 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1110);
    bool _1118 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1120 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1112);
    bool _1122 = !_1114;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1116);
    float _1128 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1120);
    float _1130 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1132 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1134 = 2;
    float _1136 = _1064;
    float _1138 = _1040;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].y);
    if (!_1114)
    {
        _1134 = 1;
    }
    int _1142 = _1134;
    float _1144 = trunc(_1130);
    int _1146 = int(_1144);
    int _1148 = _1142;
    if (!_1118)
    {
        _1148 = _1124;
    }
    int _1150 = _1148;
    bool _1152 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    int _1162 = _1150 << 6;
    float _1164 = trunc(_1132);
    int _1166 = int(_1164);
    int _1168 = _1162 + 48;
    uint _1171 = uint(int(uint(_1168) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.vp_c15)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.vp_c15)._m0[int(_1181)][_1183];
    int _1187 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1189 = _1146 + _1187;
    int _1191 = _1189 + 1;
    int _1193 = _1162 + 56;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
    int _1199 = int(_1195) & 3;
    float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
    int _1203 = int(_1195) + 1;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    int _1207 = _1203 & 3;
    float _1209 = (*spvDescriptorSet0.vp_c15)._m0[int(_1205)][_1207];
    if (_1160)
    {
        _1136 = _1078;
    }
    float _1211 = _1136;
    bool _1213 = _1191 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1215 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1217 = _1166 + _1215;
    int _1219 = _1217 + 1;
    int _1221 = _1162 + 64;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    uint _1225 = uint(int(uint(int(_1223)) >> uint(2)));
    int _1227 = int(_1223) & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    int _1231 = int(_1223) + 1;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    int _1235 = _1231 & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = _1191 | _1219;
    bool _1241 = _1239 < 0;
    bool _1243 = _1241 || _1213;
    int _1245 = _1162 + 72;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    uint _1249 = uint(int(uint(int(_1247)) >> uint(2)));
    int _1251 = int(_1247) & 3;
    float _1253 = (*spvDescriptorSet0.vp_c15)._m0[int(_1249)][_1251];
    int _1255 = int(_1247) + 1;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    int _1259 = _1255 & 3;
    float _1261 = (*spvDescriptorSet0.vp_c15)._m0[int(_1257)][_1259];
    float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1265 = _918 + _1263;
    float _1267 = _1211;
    if (_1160)
    {
        _974 = _1072;
    }
    float _1269 = _974;
    bool _1271 = _1219 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1273 = _1271 || _1243;
    float _1275 = fma(_1265, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1277 = _1162 + 96;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    float _1295 = _1269;
    if (_1160)
    {
        _1138 = _1275;
    }
    float _1297 = _1138;
    int _1299 = _1162 + 104;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    uint _1303 = uint(int(uint(int(_1301)) >> uint(2)));
    int _1305 = int(_1301) & 3;
    float _1307 = (*spvDescriptorSet0.vp_c15)._m0[int(_1303)][_1305];
    int _1309 = int(_1301) + 1;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    int _1313 = _1309 & 3;
    float _1315 = (*spvDescriptorSet0.vp_c15)._m0[int(_1311)][_1313];
    float _1317 = _1297;
    int _1319 = as_type<int>(_1293);
    if (!_1160)
    {
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1323 = _798 + _1321;
        float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1327 = _732 + _1325;
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1331 = _1323 * _1323;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _734 + _1333;
        float _1337 = fma(_1327, _1327, _1331);
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1341 = fma(_1335, _1335, _1337);
        float _1343 = sqrt(_1341);
        float _1345 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = precise::min(_1343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1349 = _1347 * _1339;
        float _1351 = -_798;
        float _1353 = _1351 + _1078;
        float _1355 = -_734;
        float _1357 = _1355 + _1275;
        float _1359 = _1345 * _1349;
        float _1361 = -_732;
        float _1363 = _1361 + _1072;
        float _1365 = fma(_1353, _1359, _798);
        float _1367 = fma(_1363, _1359, _732);
        float _1369 = fma(_1357, _1359, _734);
        _1267 = _1365;
        _1295 = _1367;
        _1140 = as_type<int>(_1357);
        _1317 = _1369;
    }
    float _1371 = _1267;
    float _1373 = _1295;
    int _1375 = _1140;
    float _1377 = _1317;
    float _1379 = _1104 * _1293;
    int _1381 = _1375;
    if (!_1273)
    {
        int _1383 = _1219 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1385 = _1383 + _1191;
        _1319 = _1385;
    }
    int _1387 = _1319;
    float _1389 = _1104 * _1185;
    float _1391 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1393 = fma(_732, _1285, _1379);
    float _1395 = _1104 * _1237;
    int _1397 = as_type<int>(_1389);
    float _1399 = as_type<float>(_1387);
    if (!_1273)
    {
        int _1401 = _1387 << 2;
        _1381 = _1401;
    }
    int _1403 = _1381;
    float _1405 = fma(_732, _1177, _1389);
    float _1407 = fma(_734, _1307, _1393);
    int _1409 = _1403;
    if (!_1273)
    {
        uint _1411 = uint(int(uint(_1387) >> uint(2)));
        _1397 = int(_1411);
    }
    int _1413 = _1397;
    float _1415 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    if (!_1273)
    {
        int _1417 = 12 & _1403;
        _1409 = _1417;
    }
    int _1419 = _1409;
    float _1421 = _1407 + _1315;
    float _1423 = fma(_732, _1229, _1395);
    float _1425 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1415);
    int _1427 = _1162 + 80;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    float _1445 = as_type<float>(_1419);
    if (!_1273)
    {
        int _1447 = _1413 << 4;
        int _1449 = _1447 + _1419;
        _1445 = as_type<float>(_1449);
    }
    float _1451 = _1445;
    float _1453 = fma(_734, _1201, _1405);
    float _1455 = 1.0 / _1421;
    float _1457 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1459 = fma(_734, _1253, _1423);
    float _1461 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1453 + _1209;
    float _1465 = _1451;
    if (!_1273)
    {
        int _1467 = as_type<int>(_1451) + 400;
        uint _1469 = uint(int(uint(_1467) >> uint(2)));
        uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
        int _1473 = int(_1469) & 3;
        float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
        _1465 = _1475;
    }
    float _1477 = _1465;
    float _1479 = _1459 + _1261;
    float _1481 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1483 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1485 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1487 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1489 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1481);
    int _1491 = _1162 + 88;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
    float _1509 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1483);
    float _1511 = -_1485;
    float _1513 = fma(_1511, _1487, 1.0);
    float _1515 = _1463 * _1455;
    float _1517 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1519 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1489);
    float _1521 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1523 = _1479 * _1455;
    bool _1525 = _1515 >= 0.0;
    float _1527 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1517);
    float _1529 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1531 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1533 = _1515 <= 1.0;
    bool _1535 = _1533 && _1525;
    float _1537 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1527);
    float _1539 = 0.0;
    if (!_1273)
    {
        float _1541 = floor(_1132);
        _1539 = _1541;
    }
    float _1543 = _1539;
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1531);
    bool _1547 = _1523 >= 0.0;
    bool _1549 = _1547 && _1535;
    float _1551 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1553 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1555 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    bool _1557 = _1523 <= 1.0;
    bool _1559 = _1557 && _1549;
    float _1561 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1563 = log2(_1513);
    float _1565 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1555);
    float _1567 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1553);
    float _1569 = 1.0 / _1565;
    float _1571 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1561);
    float _1573 = _1104 * _1443;
    float _1575 = _1443;
    if (_1559)
    {
        float _1577 = float(_1150);
        _1575 = _1577;
    }
    float _1579 = _1575;
    float _1581 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1583 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1571);
    float _1585 = fma(_732, _1435, _1573);
    float _1587 = _1543;
    if (!_1273)
    {
        float _1589 = -_1543;
        float _1591 = _1132 + _1589;
        _1587 = _1591;
    }
    float _1593 = _1587;
    float _1595 = _772;
    float _1597 = _1593;
    if (!_1273)
    {
        float _1599 = floor(_1130);
        _1595 = _1599;
    }
    float _1601 = _1595;
    float _1603 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1581);
    float _1605 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1583);
    float _1607 = _1563 * 0.693147182464599609375;
    float _1609 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1611 = _1567;
    float _1613 = _1607;
    float _1615 = _1605;
    if (_1559)
    {
        float _1617 = rint(_1579);
        float _1619 = precise::max(_1617, 0.0);
        uint _1621 = uint(_1619);
        uint _1623 = clamp(_1621, 0u, 65535u);
        _1611 = as_type<float>(_1623);
    }
    float _1625 = _1611;
    float _1627 = _1605 * _1569;
    float _1629 = fma(_734, _1499, _1585);
    float _1631 = _1629 + _1507;
    float _1633 = _1603 * _1569;
    float _1635 = _1477;
    float _1637 = _1627;
    if (!_1273)
    {
        float _1639 = rint(_1477);
        float _1641 = precise::max(_1639, 0.0);
        uint _1643 = uint(_1641);
        uint _1645 = clamp(_1643, 0u, 65535u);
        _1635 = as_type<float>(_1645);
    }
    float _1647 = _1635;
    float _1649 = fma(_1627, -0.5, 0.5);
    float _1651 = _1631 * _1455;
    float _1653 = fma(_1633, 0.5, 0.5);
    float _1655 = _1653;
    float _1657 = _1651;
    if (!_1273)
    {
        float _1659 = -_1601;
        float _1661 = _1130 + _1659;
        _1613 = _1661;
    }
    float _1663 = _1613;
    float _1665 = _1625;
    if (_1559)
    {
        float3 _5076 = float3(_1515, _1523, float(as_type<int>(_1625)));
        float3 _5080 = select(_5076, float3(0.0), isnan(_5076));
        float _1667 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5080.xy, uint(rint(_5080.z)), _1651, level(0.0));
        _1665 = _1667;
    }
    float _1669 = _1665;
    float3 _5090 = float3(_1653, _1649, _1609);
    float _1671 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5090, float3(0.0), isnan(_5090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5090, float3(0.0), isnan(_5090)), level(0.0)).x;
    float3 _5099 = float3(_1653, _1649, _1609);
    float4 _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5099, float3(0.0), isnan(_5099)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5099, float3(0.0), isnan(_5099)), level(0.0)).xyzw;
    float _1676 = _1674.x;
    float _1678 = _1674.y;
    float _1680 = _1674.z;
    float _1682 = _1674.w;
    float _1684 = _1663;
    if (!_1273)
    {
        float3 _5122 = float3(_1663, _1593, float(as_type<int>(_1647)));
        float3 _5124 = select(_5122, float3(0.0), isnan(_5122));
        float _1686 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5124.xy, uint(rint(_5124.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5124.xy, uint(rint(_5124.z)), level(0.0)).x;
        _1684 = _1686;
    }
    float _1688 = _1684;
    if (_1273)
    {
        _1637 = 1.0;
    }
    float _1690 = _1637;
    float _1692 = _1690;
    float _1694 = _1676;
    if (!_1273)
    {
        int _1696 = _1387 << 4;
        int _1698 = _1696 + 2048;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
        int _1704 = int(_1700) & 3;
        float _1706 = (*spvDescriptorSet0.vp_c15)._m0[int(_1702)][_1704];
        int _1708 = int(_1700) + 1;
        uint _1710 = uint(int(uint(_1708) >> uint(2)));
        int _1712 = _1708 & 3;
        float _1714 = (*spvDescriptorSet0.vp_c15)._m0[int(_1710)][_1712];
        int _1716 = _1698 + 8;
        uint _1718 = uint(int(uint(_1716) >> uint(2)));
        uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
        int _1722 = int(_1718) & 3;
        float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
        int _1726 = int(_1718) + 1;
        uint _1728 = uint(int(uint(_1726) >> uint(2)));
        int _1730 = _1726 & 3;
        float _1732 = (*spvDescriptorSet0.vp_c15)._m0[int(_1728)][_1730];
        float _1734 = _1104 * _1714;
        float _1736 = fma(_732, _1706, _1734);
        float _1738 = fma(_734, _1724, _1736);
        float _1740 = _1738 + _1732;
        float _1742 = precise::clamp(_1740, 0.0, 1.0);
        float _1744 = -_1742;
        float _1746 = _1744 + _1688;
        float _1748 = fma(_1746, 500.0, 1.5);
        float _1750 = exp2(_1748);
        float _1752 = 0.0 + _1750;
        float _1754 = precise::clamp(_1752, 0.0, 1.0);
        _1399 = as_type<float>(_1698);
        _1655 = _1706;
        _1692 = _1754;
    }
    float _1756 = _1399;
    float _1758 = _1655;
    float _1760 = _1692;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1764 = _1371 + _1762;
    float _1766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1768 = _1373 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1772 = _1377 + _1770;
    float _1774 = _1764 * _1764;
    float _1776 = fma(_1768, _1768, _1774);
    float _1778 = fma(_1772, _1772, _1776);
    float _1780 = rsqrt(_1778);
    float _1782 = sqrt(_1778);
    float _1784 = _1768 * _1780;
    float _1786 = _1772 * _1780;
    float _1788 = _1764 * _1780;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1792 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1794 = _1790 * _1790;
    float _1796 = _1792 * _1792;
    float _1798 = _1794 + _1796;
    float _1800 = sqrt(_1798);
    bool _1802 = _1800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1800 + _1804;
    float _1808 = _1647;
    float _1810 = _1806;
    float _1812 = _1758;
    float _1814 = _1780;
    if (_1802)
    {
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1816;
    }
    float _1818 = _1808;
    float _1820 = _1818;
    if (_1802)
    {
        float _1822 = _1806 * _1818;
        _1810 = _1822;
    }
    float _1824 = _1810;
    if (_1802)
    {
        float _1826 = rsqrt(_1798);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = _1828;
    if (_1802)
    {
        float _1832 = _1824 * 0.15915493667125701904296875;
        _1812 = _1832;
    }
    float _1834 = _1812;
    float _1836 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1838 = _1756;
    float _1840 = _1834;
    if (_1802)
    {
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = precise::max(0.0, _1836);
    float _1850 = _1688;
    if (_1802)
    {
        float _1852 = _1834 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = -_1788;
    float _1860 = -_1848;
    float _1862 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1860);
    float _1864 = _1862;
    if (_1802)
    {
        float _1866 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1814 = _1866;
    }
    float _1868 = _1814;
    float _1870 = _1846;
    float _1872 = _1868;
    if (_1802)
    {
        float _1874 = fma(_1846, _1868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1870 = _1874;
    }
    float _1876 = _1870;
    float _1878 = _1876;
    if (_1802)
    {
        float _1880 = _1828 * _1876;
        _1597 = _1880;
    }
    float _1882 = _1597;
    if (!_1802)
    {
        _1878 = _1790;
    }
    float _1884 = _1878;
    float _1886 = _1884;
    float _1888 = _1856;
    if (_1802)
    {
        float _1890 = _1856 + (-1.0);
        _1872 = _1890;
    }
    float _1892 = _1872;
    float _1894 = _1892;
    if (_1802)
    {
        float _1896 = _1790 * _1882;
        _1886 = _1896;
    }
    float _1898 = _1886;
    if (!_1802)
    {
        _1830 = _1794;
    }
    float _1900 = _1830;
    float _1902 = _1900;
    if (_1802)
    {
        float _1904 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1904;
    }
    float _1906 = _1840;
    if (!_1802)
    {
        _1894 = _1792;
    }
    float _1908 = _1894;
    float _1910 = _1908;
    if (_1802)
    {
        float _1912 = _1792 * _1882;
        _1910 = _1912;
    }
    float _1914 = _1910;
    if (_1802)
    {
        float _1916 = _1898 * _1898;
        _1902 = _1916;
    }
    float _1918 = _1902;
    if (_1802)
    {
        float _1920 = fma(_1862, _1856, _1906);
        _1864 = _1920;
    }
    float _1922 = _1864;
    if (!_1802)
    {
        _1888 = _1796;
    }
    float _1924 = _1888;
    float _1926 = _1924;
    if (_1802)
    {
        float _1928 = _1914 * _1914;
        _1926 = _1928;
    }
    float _1930 = _1926;
    float _1932 = fma(_1922, _1922, _1918);
    float _1934 = _1932 + _1930;
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1938 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1936);
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1940;
    float _1944 = _1942 + 1.0;
    float _1946 = rsqrt(_1934);
    float _1948 = _1946 * _1898;
    float _1950 = _1946 * _1922;
    float _1952 = _1946 * _1914;
    float _1954 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1956 = abs(_1944);
    float _1958 = log2(_1956);
    float _1960 = -_1954;
    float _1962 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1960);
    float _1964 = -_1952;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1962);
    float _1968 = fma(_1966, -0.5, 0.5);
    float _1970 = fma(_1966, 0.5, 0.5);
    float _1972 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1974 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1976 = sqrt(_1968);
    float _1978 = fma(_1970, _1972, -0.212114393711090087890625);
    float _1980 = _1950 + 1.0;
    float _1982 = fma(_1970, _1978, 1.570728778839111328125);
    float _1984 = exp2(_1974);
    float _1986 = _1976 * 0.636619746685028076171875;
    float _1988 = -_1950;
    float _1990 = fma(_1984, _1980, _1988);
    float _1992 = -_1982;
    float _1994 = fma(_1986, _1992, 1.0);
    float _1996 = fma(_1990, 0.5, 0.5);
    float2 _5605 = float2(_1994, _1996);
    float3 _2000 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5605, float2(0.0), isnan(_5605)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5605, float2(0.0), isnan(_5605)), level(0.0)).xyz;
    float _2002 = _2000.x;
    float _2004 = _2000.y;
    float _2006 = _2000.z;
    float _2008 = abs(_1108);
    float _2010 = log2(_2008);
    float _2012 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2014 = -_1058;
    float _2016 = _2014 + 1.0;
    out.m_89.x = _1373;
    out.m_89.y = _1371;
    out.m_89.z = _1377;
    bool _2018 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2020 = isnan(_1782);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2026 = _2022 || _2024;
    float _2028 = exp2(_2012);
    float _2030 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2032 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2034 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2032);
    float _2036 = exp2(_2030);
    float _2038 = -_2028;
    float _2040 = _2038 + 1.0;
    float _2042 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2044 = _2042 * _1671;
    float _2046 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2048 = precise::clamp(_2046, 0.0, 1.0);
    float _2050 = fma(_2048, -2.0, 3.0);
    float _2052 = _2048 * _2048;
    float _2054 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2034);
    float _2056 = _2052 * _2050;
    float _2058 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2054);
    float _2060 = -_2056;
    float _2062 = _2060 + 1.0;
    float _2064 = _2058 + _1565;
    float _2066 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2056);
    bool _2068 = _1108 <= 8000.0;
    bool _2070 = isnan(_1108);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan(8000.0);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    float _2080 = _2064 * 0.5;
    float _2082 = _2078 * _2066;
    float _2084 = _2078;
    float _2086 = _2058;
    if (!_1559)
    {
        _2084 = 1.0;
    }
    float _2088 = _2084;
    out.gl_Position.x = _1603;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _2058;
    out.gl_Position.w = _1565;
    float _2090 = _2088;
    if (_1559)
    {
        bool _2092 = _1669 >= _1651;
        bool _2094 = isnan(_1669);
        bool _2096 = _2092 || _2094;
        bool _2098 = isnan(_1651);
        bool _2100 = _2096 || _2098;
        float _2102 = float(_2100);
        _2090 = _2102;
    }
    float _2104 = _2090;
    float _2106 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2026)
    {
        _1657 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2108 = _1657;
    out.m_91.z = _2080;
    out.m_91.w = _1565;
    float _2110 = _2016 * _2106;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = _2104 * _1760;
    float _2116 = -_2112;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2120 = _1682 * _2044;
    float _2122 = -_2114;
    float _2124 = fma(_2122, _2118, 1.0);
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = -_2042;
    float _2130 = _2128 + 1.0;
    float _2132 = _2130;
    float _2134 = _2126;
    float _2136 = _2108;
    float _2138 = _2108;
    if (!_2026)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2140 = _1615;
    float _2142 = _2126 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2144 = _1682 * _2130;
    float _2146 = _2140;
    float _2148 = _2140;
    if (!_2026)
    {
        _2086 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2150 = _2086;
    float _2152 = _2150;
    float _2154 = _2150;
    if (!_2026)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2156 = _2132;
    out.m_93.x = _2142;
    float _2158 = _2156;
    float _2160 = _2156;
    if (!_2026)
    {
        _2134 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2162 = _2134;
    float _2164 = _2006 * _2044;
    float _2166 = fma(_2002, _2120, _1676);
    float _2168 = fma(_2004, _2120, _1678);
    float _2170 = _2162;
    float _2172 = _2162;
    if (!_2026)
    {
        _1694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2174 = _1694;
    float _2176 = fma(_1682, _2164, _1680);
    out.m_95.x = _2166;
    out.m_95.y = _2168;
    out.m_95.z = _2176;
    out.m_95.w = _2144;
    bool _2178 = !_2026;
    float _2180 = _2174;
    float _2182 = _2174;
    if (!_2178)
    {
        bool _2184 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2186 = isnan(_1782);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2192 = _2188 || _2190;
        if (!_2192)
        {
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = _1782 + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2198;
            float _2202 = 1.0 / _2200;
            float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2206 = _2204 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2224 = _2196 * _2202;
            float _2226 = precise::clamp(_2224, 0.0, 1.0);
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2232 = fma(_2226, _2206, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2234 = fma(_2226, _2230, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2236 = fma(_2226, _2210, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2238 = fma(_2226, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2240 = fma(_2226, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2242 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2182 = _2232;
            _2138 = _2240;
            _2148 = _2234;
            _2160 = _2238;
            _2154 = _2236;
            _2172 = _2242;
            _2244 = true;
        }
        else
        {
            bool _2246 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2248 = isnan(_1782);
            bool _2250 = _2246 || _2248;
            bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2254 = _2250 || _2252;
            if (!_2254)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2256 = _2146;
            _2148 = _2256;
            if (!_2254)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2258 = _2180;
            _2182 = _2258;
            if (!_2254)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2260 = _2152;
            _2154 = _2260;
            if (!_2254)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2262 = _2158;
            _2160 = _2262;
            if (!_2254)
            {
                _2136 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2264 = _2136;
            _2138 = _2264;
            if (!_2254)
            {
                _2170 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2266 = _2170;
            bool _2268 = !_2254;
            _2172 = _2266;
            if (!_2268)
            {
                bool _2270 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2272 = isnan(_1782);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2278 = _2274 || _2276;
                if (!_2278)
                {
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = _1782 + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2284;
                    float _2288 = 1.0 / _2286;
                    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2310 = _2282 * _2288;
                    float _2312 = precise::clamp(_2310, 0.0, 1.0);
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2318 = fma(_2312, _2292, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2182 = _2318;
                    _2138 = _2326;
                    _2148 = _2320;
                    _2160 = _2324;
                    _2154 = _2322;
                    _2172 = _2328;
                    _2244 = true;
                }
                else
                {
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2138 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2172 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2244 = false;
    float _2330 = _2182;
    float _2332 = _2138;
    float _2334 = _2148;
    float _2336 = _2160;
    float _2338 = _2154;
    float _2340 = _2172;
    float _2342 = fma(_942, -0.5, 0.5);
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = -_2330;
    float _2348 = _2346 + _2332;
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    bool _2358 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2360 = fma(_2344, _2348, _2330);
    float _2362 = fma(_2344, _2352, _2334);
    float _2364 = fma(_2344, _2356, _2338);
    float _2366 = _2360 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2368 = fma(_2362, 0.298911988735198974609375, _2366);
    float _2370 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2372 = fma(_2364, 0.114477999508380889892578125, _2368);
    out.m_93.w = _2370;
    float _2374 = -_2372;
    float _2376 = _2362 + _2374;
    float _2378 = -_2372;
    float _2380 = _2360 + _2378;
    float _2382 = -_2372;
    float _2384 = _2364 + _2382;
    out.m_97.x = 0.0;
    float _2386 = fma(_2376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2388 = fma(_2380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2390 = fma(_2384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    out.m_99.x = 0.0;
    out.m_101.x = _2386;
    out.m_101.y = _2388;
    out.m_101.z = _2390;
    if (!_2358)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2392 = -_1371;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2396 = -_1373;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2400 = -_1377;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = rsqrt(_2408);
    float _2412 = _2394 * _2410;
    float _2414 = _2398 * _2410;
    float _2416 = _2402 * _2410;
    float _2418 = -_1788;
    float _2420 = _2418 + _2412;
    float _2422 = -_1784;
    float _2424 = _2422 + _2414;
    float _2426 = -_1786;
    float _2428 = _2426 + _2416;
    float _2430 = sqrt(_2408);
    float _2432 = _2420 * _2420;
    float _2434 = fma(_2424, _2424, _2432);
    float _2436 = fma(_2428, _2428, _2434);
    float _2438 = rsqrt(_2436);
    float _2440 = -_2430;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = abs(_2446);
    float _2450 = log2(_2448);
    float _2452 = _2420 * _2438;
    float _2454 = _2424 * _2438;
    float _2456 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2428 * _2438;
    float _2462 = _942 * _2452;
    float _2464 = _942 * _2412;
    float _2466 = fma(_950, _2454, _2462);
    float _2468 = _2458 * _2458;
    float _2470 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2472 = fma(_950, _2414, _2464);
    float _2474 = fma(_962, _2460, _2466);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = _2468 + (-1.0);
    float _2480 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2482 = fma(_962, _2416, _2472);
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = _2476 * _2476;
    float _2488 = fma(_2486, _2478, 1.0);
    float _2490 = exp2(_2480);
    float _2492 = -_2412;
    float _2494 = -_2470;
    float _2496 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2494);
    float _2498 = _2488 * _2488;
    float _2500 = -_2416;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2496);
    float _2504 = 1.0 / _2498;
    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2508 = _2502 + _2506;
    float _2510 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2490 * _2512;
    float _2516 = _2484 * _2514;
    float _2518 = _2468 * _2504;
    float _2520 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2522 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2524 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2526 = _2516 * _2518;
    float _2528 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2530 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2532 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2520;
    out.m_97.y = _2522;
    out.m_97.z = _2524;
    out.m_99.x = _2528;
    out.m_99.y = _2530;
    out.m_99.z = _2532;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2244 = false;
    bool _1010 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2589 = as_type<float>(_136);
        out.gl_Position.z = _2589;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    if (_150)
    {
        float _158 = float(_120);
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    if (_166)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _130;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _138 = as_type<int>(_170);
    }
    int _172 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_172);
        out.gl_Position.z = _2657;
    }
    if (_166)
    {
        return out;
    }
    float _174 = in.m_65.y;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_65.z;
    float _180 = in.m_67.y;
    float _182 = in.m_67.z;
    float _184 = in.m_69.y;
    float _186 = in.m_69.z;
    float _188 = _174 * _174;
    float _190 = in.m_65.x;
    float _192 = _178 * _178;
    float _194 = in.m_67.x;
    float _196 = fma(_180, _180, _188);
    float _198 = in.m_69.x;
    float _200 = fma(_182, _182, _192);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _200);
    float _206 = sqrt(_202);
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = sqrt(_204);
    bool _216 = _206 > 0.0;
    bool _218 = _214 > 0.0;
    float _220 = _174 * _210;
    float _222 = _180 * _210;
    float _224 = _184 * _210;
    float _226 = 0.0;
    if (_216)
    {
        float _228 = rsqrt(_202);
        _226 = _228;
    }
    float _230 = _226;
    float _232 = fma(_208, _190, _220);
    float _234 = fma(_208, _194, _222);
    float _236 = fma(_208, _198, _224);
    float _238 = 0.0;
    float _240 = 0.0;
    float _242 = _232;
    if (!_216)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _244 = _238;
    float _246 = _240;
    float _248 = fma(_178, _212, _232);
    float _250 = 0.0;
    float _252 = _246;
    float _254 = _244;
    if (!_216)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = fma(_182, _212, _234);
    float _260 = _204;
    float _262 = _256;
    if (_218)
    {
        float _264 = rsqrt(_204);
        _260 = _264;
    }
    float _266 = _260;
    float _268 = 0.0;
    if (!_218)
    {
        _268 = 0.0;
    }
    float _270 = _268;
    float _272 = fma(_186, _212, _236);
    float _274 = _270;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _276 = _242;
    float _278 = 0.0;
    float _280 = _276;
    if (!_218)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = _282;
    if (_216)
    {
        float _286 = _230 * _180;
        _252 = _286;
    }
    float _288 = _252;
    float _290 = _288;
    if (_216)
    {
        float _292 = _230 * _174;
        _254 = _292;
    }
    float _294 = _254;
    float _296 = _294;
    if (_216)
    {
        float _298 = _230 * _184;
        _262 = _298;
    }
    float _300 = _262;
    float _302 = _300;
    if (_218)
    {
        float _304 = _266 * _182;
        _274 = _304;
    }
    float _306 = _274;
    if (_218)
    {
        float _308 = _266 * _178;
        _280 = _308;
    }
    float _310 = _280;
    if (_218)
    {
        float _312 = _266 * _186;
        _284 = _312;
    }
    float _314 = _284;
    bool _316 = !_176;
    float _334;
    if (!_316)
    {
        float _318 = in.m_73.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        float _338 = float(_120);
        float _340 = 1.0 / _338;
        float _342 = _154 * _340;
        _334 = _342;
    }
    _336 = false;
    float _344 = _334;
    float _346 = in.m_58.x;
    float _348 = in.m_58.y;
    float _350 = in.m_58.z;
    float _352 = _248 * _248;
    float _354 = _154 * 0.15915493667125701904296875;
    float _356 = in.m_75.x;
    float _358 = fma(_258, _258, _352);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = _354 * 6.283185482025146484375;
    float _370 = sin(_368);
    float _372 = fma(_272, _272, _358);
    float _374 = in.m_69.w;
    float _376 = 1.0 / _362;
    float _378 = _180 * _348;
    float _380 = 1.0 / _366;
    float _382 = _184 * _348;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _344 + _384;
    float _388 = fma(_194, _346, _378);
    float _390 = _370 * _356;
    float _392 = in.m_77.x;
    float _394 = fma(_198, _346, _382);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _344 + _396;
    float _400 = rsqrt(_372);
    float _402 = _386 * _376;
    float _404 = fma(_182, _350, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    bool _410 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_344);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _398 * _380;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = fma(_426, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _440 = fma(_430, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = _258 * _400;
    float _448 = _248 * _400;
    float _450 = _272 * _400;
    bool _452 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _454 = isnan(_344);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _468 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_344);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = _448 * _294;
    bool _482 = _392 > 0.0;
    float _484 = fma(_436, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _486 = _392 >= 0.0;
    bool _488 = isnan(_392);
    bool _490 = _486 || _488;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    float _496 = -_478;
    float _498 = _496 + 1.0;
    float _500 = fma(_446, _288, _480);
    float _502 = fma(_444, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _504 = _494 ? 0 : 1;
    float _506 = _462 * _498;
    float _508 = -_462;
    float _510 = _508 + 1.0;
    float _512 = fma(_450, _300, _500);
    int _514 = ~_504;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_466, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _522 = _420 * _510;
    int _524 = _518;
    if (!_482)
    {
        int _526 = ~_504;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = -_420;
    float _534 = _532 + 1.0;
    float _536 = abs(_512);
    bool _538 = _536 > 0.99989998340606689453125;
    float _540 = _438 * _522;
    float _542 = float(_530);
    float _544 = _432 * _522;
    float _546 = _440 * _522;
    float _548 = _390 * 60.0;
    float _550 = in.m_79.x;
    float _552 = in.m_79.y;
    float _554 = in.m_79.z;
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _540);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _560 = _542 * _548;
    float _562 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _546);
    float _564 = fma(_502, _506, _556);
    float _566 = fma(_484, _506, _558);
    float _568 = _560 * 0.01745329238474369049072265625;
    float _570 = in.m_77.z;
    if (_538)
    {
        float _572 = fma(_306, 0.001000000047497451305389404296875, _288);
        _290 = _572;
    }
    float _574 = _290;
    if (_538)
    {
        float _576 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _576;
    }
    float _578 = _302;
    float _580 = _568 * 0.15915493667125701904296875;
    if (_538)
    {
        float _582 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _582;
    }
    float _584 = _296;
    float _586 = -_574;
    float _588 = _450 * _586;
    float _590 = -_578;
    float _592 = _448 * _590;
    float _594 = _580 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = fma(_520, _506, _562);
    float _600 = -_578;
    float _602 = -_588;
    float _604 = fma(_446, _600, _602);
    float _606 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].x, _566);
    float _608 = -_584;
    float _610 = -_592;
    float _612 = fma(_450, _608, _610);
    float _614 = -_584;
    float _616 = _446 * _614;
    float _618 = _604 * _604;
    float _620 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].y, _564);
    float _622 = _580 * 6.283185482025146484375;
    float _624 = cos(_622);
    float _626 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].z, _598);
    float _628 = in.m_77.y;
    float _630 = _606 * _550;
    float _632 = _542 * 0.02999999932944774627685546875;
    float _634 = -_574;
    float _636 = -_616;
    float _638 = fma(_448, _634, _636);
    float _640 = fma(_612, _612, _618);
    float _642 = _626 * _554;
    float _644 = -_632;
    float _646 = _644 + _392;
    float _648 = _570 + (-0.070000000298023223876953125);
    float _650 = fma(_638, _638, _640);
    float _652 = in.m_67.w;
    float _654 = _596 * _646;
    float _656 = _620 * _552;
    float _658 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = _624 * _646;
    float _662 = rsqrt(_650);
    float _664 = -_654;
    float _666 = fma(_624, _648, _664);
    float _668 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _670 = fma(_596, _648, _660);
    float _672 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = _666 + 0.070000000298023223876953125;
    float _676 = fma(_186, _350, _394);
    float _678 = _632 + _670;
    float _680 = in.m_81.z;
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _678);
    bool _688 = _628 != 0.0;
    bool _690 = isnan(_628);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = _174 * _348;
    float _700 = _672 * _684;
    float _702 = _658 * _686;
    float _704 = _668 * _682;
    float _706 = _612 * _662;
    float _708 = _638 * _662;
    float _710 = _604 * _662;
    float _712 = _700 * _446;
    float _714 = _700 * _450;
    float _716 = _448 * _708;
    float _718 = _446 * _710;
    float _720 = fma(_702, _706, _712);
    float _722 = fma(_702, _708, _714);
    float _724 = -_716;
    float _726 = fma(_450, _710, _724);
    float _728 = -_718;
    float _730 = fma(_448, _706, _728);
    float _732 = _404 + _652;
    float _734 = _676 + _374;
    float _736 = fma(_704, _726, _720);
    float _738 = fma(_704, _730, _722);
    float _740 = -_632;
    bool _742 = _670 == _740;
    bool _744 = !_696;
    bool _746 = _742 && _744;
    float _748 = in.m_65.w;
    float _750 = _732 + _736;
    float _752 = _734 + _738;
    float _754 = fma(_190, _346, _698);
    float _756 = in.m_81.x;
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _760 = _750 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _764 = _752 + _762;
    float _766 = _700 * _448;
    float _768 = in.m_81.y;
    float _770 = _760 * _760;
    float _772 = _764 * _764;
    float _774 = _450 * _706;
    bool _776 = _666 == (-0.070000000298023223876953125);
    bool _778 = _776 && _746;
    float _780 = fma(_178, _350, _754);
    float _782 = _770 + _772;
    float _784 = fma(_702, _710, _766);
    float _786 = -_774;
    float _788 = fma(_446, _708, _786);
    float _790 = sqrt(_782);
    float _792 = fma(_704, _788, _784);
    float _794 = _624 * _756;
    float _796 = _596 * _756;
    float _798 = _780 + _748;
    float _800 = fma(_596, _680, _794);
    float _802 = -_796;
    float _804 = fma(_624, _680, _802);
    bool _806 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _808 = _798 + _792;
    float _810 = _800;
    float _812 = _804;
    float _814 = _794;
    float _816 = _766;
    float _818 = _678;
    float _820 = _632;
    float _822 = _624;
    float _824 = _730;
    if (!_778)
    {
        float _826 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _800);
        _810 = _826;
    }
    float _828 = _810;
    float _830 = _768;
    if (!_778)
    {
        float _832 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _768);
        _830 = _832;
    }
    float _834 = _830;
    if (!_778)
    {
        float _836 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _804);
        _812 = _836;
    }
    float _838 = _812;
    if (!_806)
    {
        _814 = _772;
    }
    float _840 = _814;
    float _842 = _840;
    if (!_806)
    {
        _816 = _770;
    }
    float _844 = _816;
    float _846 = _844;
    if (!_806)
    {
        _818 = _750;
    }
    float _848 = _818;
    float _850 = _848;
    if (!_806)
    {
        _820 = _752;
    }
    float _852 = _820;
    float _854 = _852;
    if (!_806)
    {
        _822 = _808;
    }
    float _856 = _822;
    bool _858 = !_806;
    float _860 = _856;
    if (!_858)
    {
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _866 = _790 + _864;
        float _868 = rsqrt(_782);
        float _870 = _866 * _862;
        float _872 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = _870 * 0.15915493667125701904296875;
        float _876 = _874 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _874 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = fma(_878, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _886 = _868 * _884;
        float _888 = _882 + (-1.0);
        float _890 = fma(_760, _886, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _892 = fma(_764, _886, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _894 = _888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _898 = _890 + _896;
        float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _902 = _892 + _900;
        float _904 = fma(_808, _882, _894);
        float _906 = _898 * _898;
        float _908 = _902 * _902;
        _860 = _904;
        _846 = _906;
        _842 = _908;
        _850 = _890;
        _854 = _892;
    }
    float _910 = _860;
    float _912 = _846;
    float _914 = _842;
    float _916 = _850;
    float _918 = _854;
    float _920 = in.m_75.w;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _924 = _910 + _922;
    float _926 = _448 * _834;
    float _928 = _446 * _834;
    float _930 = _450 * _834;
    float _932 = fma(_924, _924, _912);
    float _934 = fma(_710, _828, _926);
    float _936 = fma(_706, _828, _928);
    float _938 = fma(_708, _828, _930);
    float _940 = _932 + _914;
    float _942 = fma(_788, _838, _934);
    float _944 = sqrt(_940);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = fma(_726, _838, _936);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = fma(_730, _838, _938);
    out.m_83.w = _920;
    out.m_85.x = _954;
    out.m_85.y = _958;
    out.m_85.z = _960;
    out.m_85.w = _956;
    bool _964 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _966 = isnan(_944);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _972 = _968 || _970;
    out.m_87.x = _950;
    out.m_87.y = _942;
    out.m_87.z = _962;
    float _974 = _918;
    if (!_972)
    {
        _824 = 1.0;
    }
    float _976 = _824;
    bool _978 = !_972;
    float _980 = _976;
    if (!_978)
    {
        bool _982 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _984 = isnan(_944);
        bool _986 = _982 || _984;
        bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _990 = _986 || _988;
        if (!_990)
        {
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = _944 + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1002 = _1000 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1004 = 1.0 / _998;
            float _1006 = _994 * _1004;
            float _1008 = fma(_1006, _1002, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _980 = _1008;
            _1010 = true;
        }
        else
        {
            bool _1012 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1014 = isnan(_944);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1020 = _1016 || _1018;
            if (!_1020)
            {
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _944 + _1022;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1034 = 1.0 / _1028;
                float _1036 = _1024 * _1034;
                float _1038 = fma(_1036, _1032, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _980 = _1038;
                _1010 = true;
            }
            else
            {
                _980 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1010 = false;
    float _1040 = _980;
    float _1042 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1044 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1046 = floor(_1042);
    float _1048 = floor(_1044);
    float _1050 = -_1046;
    float _1052 = _1042 + _1050;
    float _1054 = -_1048;
    float _1056 = _1044 + _1054;
    float2 _4037 = float2(_1052, _1056);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4037, float2(0.0), isnan(_4037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4037, float2(0.0), isnan(_4037)), level(0.0)).x;
    float _1060 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1064 = _916 + _1062;
    float _1066 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1060);
    float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1070 = _910 + _1068;
    float _1072 = fma(_1064, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1074 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1066);
    float _1076 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1078 = fma(_1070, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1082 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1076);
    float _1084 = 1.0 / _1080;
    float _1086 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1082);
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1090 = _1088 + _1080;
    float _1092 = _1090 * _1084;
    float _1094 = _1092 * 0.5;
    float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1098 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1096);
    float _1100 = 1.0 / _1098;
    float _1102 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1104 = _798 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1108 = _1100 * _1106;
    float _1110 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1114 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1116 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1110);
    bool _1118 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1120 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1112);
    bool _1122 = !_1114;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1116);
    float _1128 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1120);
    float _1130 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1132 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1134 = 2;
    float _1136 = _1064;
    float _1138 = _1040;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].y);
    if (!_1114)
    {
        _1134 = 1;
    }
    int _1142 = _1134;
    float _1144 = trunc(_1130);
    int _1146 = int(_1144);
    int _1148 = _1142;
    if (!_1118)
    {
        _1148 = _1124;
    }
    int _1150 = _1148;
    bool _1152 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    int _1162 = _1150 << 6;
    float _1164 = trunc(_1132);
    int _1166 = int(_1164);
    int _1168 = _1162 + 48;
    uint _1171 = uint(int(uint(_1168) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.vp_c15)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.vp_c15)._m0[int(_1181)][_1183];
    int _1187 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1189 = _1146 + _1187;
    int _1191 = _1189 + 1;
    int _1193 = _1162 + 56;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
    int _1199 = int(_1195) & 3;
    float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
    int _1203 = int(_1195) + 1;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    int _1207 = _1203 & 3;
    float _1209 = (*spvDescriptorSet0.vp_c15)._m0[int(_1205)][_1207];
    if (_1160)
    {
        _1136 = _1078;
    }
    float _1211 = _1136;
    bool _1213 = _1191 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1215 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1217 = _1166 + _1215;
    int _1219 = _1217 + 1;
    int _1221 = _1162 + 64;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    uint _1225 = uint(int(uint(int(_1223)) >> uint(2)));
    int _1227 = int(_1223) & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    int _1231 = int(_1223) + 1;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    int _1235 = _1231 & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = _1191 | _1219;
    bool _1241 = _1239 < 0;
    bool _1243 = _1241 || _1213;
    int _1245 = _1162 + 72;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    uint _1249 = uint(int(uint(int(_1247)) >> uint(2)));
    int _1251 = int(_1247) & 3;
    float _1253 = (*spvDescriptorSet0.vp_c15)._m0[int(_1249)][_1251];
    int _1255 = int(_1247) + 1;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    int _1259 = _1255 & 3;
    float _1261 = (*spvDescriptorSet0.vp_c15)._m0[int(_1257)][_1259];
    float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1265 = _918 + _1263;
    float _1267 = _1211;
    if (_1160)
    {
        _974 = _1072;
    }
    float _1269 = _974;
    bool _1271 = _1219 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1273 = _1271 || _1243;
    float _1275 = fma(_1265, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1277 = _1162 + 96;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    float _1295 = _1269;
    if (_1160)
    {
        _1138 = _1275;
    }
    float _1297 = _1138;
    int _1299 = _1162 + 104;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    uint _1303 = uint(int(uint(int(_1301)) >> uint(2)));
    int _1305 = int(_1301) & 3;
    float _1307 = (*spvDescriptorSet0.vp_c15)._m0[int(_1303)][_1305];
    int _1309 = int(_1301) + 1;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    int _1313 = _1309 & 3;
    float _1315 = (*spvDescriptorSet0.vp_c15)._m0[int(_1311)][_1313];
    float _1317 = _1297;
    int _1319 = as_type<int>(_1293);
    if (!_1160)
    {
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1323 = _798 + _1321;
        float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1327 = _732 + _1325;
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1331 = _1323 * _1323;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _734 + _1333;
        float _1337 = fma(_1327, _1327, _1331);
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1341 = fma(_1335, _1335, _1337);
        float _1343 = sqrt(_1341);
        float _1345 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = precise::min(_1343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1349 = _1347 * _1339;
        float _1351 = -_798;
        float _1353 = _1351 + _1078;
        float _1355 = -_734;
        float _1357 = _1355 + _1275;
        float _1359 = _1345 * _1349;
        float _1361 = -_732;
        float _1363 = _1361 + _1072;
        float _1365 = fma(_1353, _1359, _798);
        float _1367 = fma(_1363, _1359, _732);
        float _1369 = fma(_1357, _1359, _734);
        _1267 = _1365;
        _1295 = _1367;
        _1140 = as_type<int>(_1357);
        _1317 = _1369;
    }
    float _1371 = _1267;
    float _1373 = _1295;
    int _1375 = _1140;
    float _1377 = _1317;
    float _1379 = _1104 * _1293;
    int _1381 = _1375;
    if (!_1273)
    {
        int _1383 = _1219 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1385 = _1383 + _1191;
        _1319 = _1385;
    }
    int _1387 = _1319;
    float _1389 = _1104 * _1185;
    float _1391 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1393 = fma(_732, _1285, _1379);
    float _1395 = _1104 * _1237;
    int _1397 = as_type<int>(_1389);
    float _1399 = as_type<float>(_1387);
    if (!_1273)
    {
        int _1401 = _1387 << 2;
        _1381 = _1401;
    }
    int _1403 = _1381;
    float _1405 = fma(_732, _1177, _1389);
    float _1407 = fma(_734, _1307, _1393);
    int _1409 = _1403;
    if (!_1273)
    {
        uint _1411 = uint(int(uint(_1387) >> uint(2)));
        _1397 = int(_1411);
    }
    int _1413 = _1397;
    float _1415 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    if (!_1273)
    {
        int _1417 = 12 & _1403;
        _1409 = _1417;
    }
    int _1419 = _1409;
    float _1421 = _1407 + _1315;
    float _1423 = fma(_732, _1229, _1395);
    float _1425 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1415);
    int _1427 = _1162 + 80;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    float _1445 = as_type<float>(_1419);
    if (!_1273)
    {
        int _1447 = _1413 << 4;
        int _1449 = _1447 + _1419;
        _1445 = as_type<float>(_1449);
    }
    float _1451 = _1445;
    float _1453 = fma(_734, _1201, _1405);
    float _1455 = 1.0 / _1421;
    float _1457 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1459 = fma(_734, _1253, _1423);
    float _1461 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1453 + _1209;
    float _1465 = _1451;
    if (!_1273)
    {
        int _1467 = as_type<int>(_1451) + 400;
        uint _1469 = uint(int(uint(_1467) >> uint(2)));
        uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
        int _1473 = int(_1469) & 3;
        float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
        _1465 = _1475;
    }
    float _1477 = _1465;
    float _1479 = _1459 + _1261;
    float _1481 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1483 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1485 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1487 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1489 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1481);
    int _1491 = _1162 + 88;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
    float _1509 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1483);
    float _1511 = -_1485;
    float _1513 = fma(_1511, _1487, 1.0);
    float _1515 = _1463 * _1455;
    float _1517 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1519 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1489);
    float _1521 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1523 = _1479 * _1455;
    bool _1525 = _1515 >= 0.0;
    float _1527 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1517);
    float _1529 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1531 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1533 = _1515 <= 1.0;
    bool _1535 = _1533 && _1525;
    float _1537 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1527);
    float _1539 = 0.0;
    if (!_1273)
    {
        float _1541 = floor(_1132);
        _1539 = _1541;
    }
    float _1543 = _1539;
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1531);
    bool _1547 = _1523 >= 0.0;
    bool _1549 = _1547 && _1535;
    float _1551 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1553 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1555 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    bool _1557 = _1523 <= 1.0;
    bool _1559 = _1557 && _1549;
    float _1561 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1563 = log2(_1513);
    float _1565 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1555);
    float _1567 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1553);
    float _1569 = 1.0 / _1565;
    float _1571 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1561);
    float _1573 = _1104 * _1443;
    float _1575 = _1443;
    if (_1559)
    {
        float _1577 = float(_1150);
        _1575 = _1577;
    }
    float _1579 = _1575;
    float _1581 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1583 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1571);
    float _1585 = fma(_732, _1435, _1573);
    float _1587 = _1543;
    if (!_1273)
    {
        float _1589 = -_1543;
        float _1591 = _1132 + _1589;
        _1587 = _1591;
    }
    float _1593 = _1587;
    float _1595 = _772;
    float _1597 = _1593;
    if (!_1273)
    {
        float _1599 = floor(_1130);
        _1595 = _1599;
    }
    float _1601 = _1595;
    float _1603 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1581);
    float _1605 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1583);
    float _1607 = _1563 * 0.693147182464599609375;
    float _1609 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1611 = _1567;
    float _1613 = _1607;
    float _1615 = _1605;
    if (_1559)
    {
        float _1617 = rint(_1579);
        float _1619 = precise::max(_1617, 0.0);
        uint _1621 = uint(_1619);
        uint _1623 = clamp(_1621, 0u, 65535u);
        _1611 = as_type<float>(_1623);
    }
    float _1625 = _1611;
    float _1627 = _1605 * _1569;
    float _1629 = fma(_734, _1499, _1585);
    float _1631 = _1629 + _1507;
    float _1633 = _1603 * _1569;
    float _1635 = _1477;
    float _1637 = _1627;
    if (!_1273)
    {
        float _1639 = rint(_1477);
        float _1641 = precise::max(_1639, 0.0);
        uint _1643 = uint(_1641);
        uint _1645 = clamp(_1643, 0u, 65535u);
        _1635 = as_type<float>(_1645);
    }
    float _1647 = _1635;
    float _1649 = fma(_1627, -0.5, 0.5);
    float _1651 = _1631 * _1455;
    float _1653 = fma(_1633, 0.5, 0.5);
    float _1655 = _1653;
    float _1657 = _1651;
    if (!_1273)
    {
        float _1659 = -_1601;
        float _1661 = _1130 + _1659;
        _1613 = _1661;
    }
    float _1663 = _1613;
    float _1665 = _1625;
    if (_1559)
    {
        float3 _5076 = float3(_1515, _1523, float(as_type<int>(_1625)));
        float3 _5080 = select(_5076, float3(0.0), isnan(_5076));
        float _1667 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5080.xy, uint(rint(_5080.z)), _1651, level(0.0));
        _1665 = _1667;
    }
    float _1669 = _1665;
    float3 _5090 = float3(_1653, _1649, _1609);
    float _1671 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5090, float3(0.0), isnan(_5090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5090, float3(0.0), isnan(_5090)), level(0.0)).x;
    float3 _5099 = float3(_1653, _1649, _1609);
    float4 _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5099, float3(0.0), isnan(_5099)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5099, float3(0.0), isnan(_5099)), level(0.0)).xyzw;
    float _1676 = _1674.x;
    float _1678 = _1674.y;
    float _1680 = _1674.z;
    float _1682 = _1674.w;
    float _1684 = _1663;
    if (!_1273)
    {
        float3 _5122 = float3(_1663, _1593, float(as_type<int>(_1647)));
        float3 _5124 = select(_5122, float3(0.0), isnan(_5122));
        float _1686 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5124.xy, uint(rint(_5124.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5124.xy, uint(rint(_5124.z)), level(0.0)).x;
        _1684 = _1686;
    }
    float _1688 = _1684;
    if (_1273)
    {
        _1637 = 1.0;
    }
    float _1690 = _1637;
    float _1692 = _1690;
    float _1694 = _1676;
    if (!_1273)
    {
        int _1696 = _1387 << 4;
        int _1698 = _1696 + 2048;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
        int _1704 = int(_1700) & 3;
        float _1706 = (*spvDescriptorSet0.vp_c15)._m0[int(_1702)][_1704];
        int _1708 = int(_1700) + 1;
        uint _1710 = uint(int(uint(_1708) >> uint(2)));
        int _1712 = _1708 & 3;
        float _1714 = (*spvDescriptorSet0.vp_c15)._m0[int(_1710)][_1712];
        int _1716 = _1698 + 8;
        uint _1718 = uint(int(uint(_1716) >> uint(2)));
        uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
        int _1722 = int(_1718) & 3;
        float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
        int _1726 = int(_1718) + 1;
        uint _1728 = uint(int(uint(_1726) >> uint(2)));
        int _1730 = _1726 & 3;
        float _1732 = (*spvDescriptorSet0.vp_c15)._m0[int(_1728)][_1730];
        float _1734 = _1104 * _1714;
        float _1736 = fma(_732, _1706, _1734);
        float _1738 = fma(_734, _1724, _1736);
        float _1740 = _1738 + _1732;
        float _1742 = precise::clamp(_1740, 0.0, 1.0);
        float _1744 = -_1742;
        float _1746 = _1744 + _1688;
        float _1748 = fma(_1746, 500.0, 1.5);
        float _1750 = exp2(_1748);
        float _1752 = 0.0 + _1750;
        float _1754 = precise::clamp(_1752, 0.0, 1.0);
        _1399 = as_type<float>(_1698);
        _1655 = _1706;
        _1692 = _1754;
    }
    float _1756 = _1399;
    float _1758 = _1655;
    float _1760 = _1692;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1764 = _1371 + _1762;
    float _1766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1768 = _1373 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1772 = _1377 + _1770;
    float _1774 = _1764 * _1764;
    float _1776 = fma(_1768, _1768, _1774);
    float _1778 = fma(_1772, _1772, _1776);
    float _1780 = rsqrt(_1778);
    float _1782 = sqrt(_1778);
    float _1784 = _1768 * _1780;
    float _1786 = _1772 * _1780;
    float _1788 = _1764 * _1780;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1792 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1794 = _1790 * _1790;
    float _1796 = _1792 * _1792;
    float _1798 = _1794 + _1796;
    float _1800 = sqrt(_1798);
    bool _1802 = _1800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1800 + _1804;
    float _1808 = _1647;
    float _1810 = _1806;
    float _1812 = _1758;
    float _1814 = _1780;
    if (_1802)
    {
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1816;
    }
    float _1818 = _1808;
    float _1820 = _1818;
    if (_1802)
    {
        float _1822 = _1806 * _1818;
        _1810 = _1822;
    }
    float _1824 = _1810;
    if (_1802)
    {
        float _1826 = rsqrt(_1798);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = _1828;
    if (_1802)
    {
        float _1832 = _1824 * 0.15915493667125701904296875;
        _1812 = _1832;
    }
    float _1834 = _1812;
    float _1836 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1838 = _1756;
    float _1840 = _1834;
    if (_1802)
    {
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = precise::max(0.0, _1836);
    float _1850 = _1688;
    if (_1802)
    {
        float _1852 = _1834 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = -_1788;
    float _1860 = -_1848;
    float _1862 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1860);
    float _1864 = _1862;
    if (_1802)
    {
        float _1866 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1814 = _1866;
    }
    float _1868 = _1814;
    float _1870 = _1846;
    float _1872 = _1868;
    if (_1802)
    {
        float _1874 = fma(_1846, _1868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1870 = _1874;
    }
    float _1876 = _1870;
    float _1878 = _1876;
    if (_1802)
    {
        float _1880 = _1828 * _1876;
        _1597 = _1880;
    }
    float _1882 = _1597;
    if (!_1802)
    {
        _1878 = _1790;
    }
    float _1884 = _1878;
    float _1886 = _1884;
    float _1888 = _1856;
    if (_1802)
    {
        float _1890 = _1856 + (-1.0);
        _1872 = _1890;
    }
    float _1892 = _1872;
    float _1894 = _1892;
    if (_1802)
    {
        float _1896 = _1790 * _1882;
        _1886 = _1896;
    }
    float _1898 = _1886;
    if (!_1802)
    {
        _1830 = _1794;
    }
    float _1900 = _1830;
    float _1902 = _1900;
    if (_1802)
    {
        float _1904 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1904;
    }
    float _1906 = _1840;
    if (!_1802)
    {
        _1894 = _1792;
    }
    float _1908 = _1894;
    float _1910 = _1908;
    if (_1802)
    {
        float _1912 = _1792 * _1882;
        _1910 = _1912;
    }
    float _1914 = _1910;
    if (_1802)
    {
        float _1916 = _1898 * _1898;
        _1902 = _1916;
    }
    float _1918 = _1902;
    if (_1802)
    {
        float _1920 = fma(_1862, _1856, _1906);
        _1864 = _1920;
    }
    float _1922 = _1864;
    if (!_1802)
    {
        _1888 = _1796;
    }
    float _1924 = _1888;
    float _1926 = _1924;
    if (_1802)
    {
        float _1928 = _1914 * _1914;
        _1926 = _1928;
    }
    float _1930 = _1926;
    float _1932 = fma(_1922, _1922, _1918);
    float _1934 = _1932 + _1930;
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1938 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1936);
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1940;
    float _1944 = _1942 + 1.0;
    float _1946 = rsqrt(_1934);
    float _1948 = _1946 * _1898;
    float _1950 = _1946 * _1922;
    float _1952 = _1946 * _1914;
    float _1954 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1956 = abs(_1944);
    float _1958 = log2(_1956);
    float _1960 = -_1954;
    float _1962 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1960);
    float _1964 = -_1952;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1962);
    float _1968 = fma(_1966, -0.5, 0.5);
    float _1970 = fma(_1966, 0.5, 0.5);
    float _1972 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1974 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1976 = sqrt(_1968);
    float _1978 = fma(_1970, _1972, -0.212114393711090087890625);
    float _1980 = _1950 + 1.0;
    float _1982 = fma(_1970, _1978, 1.570728778839111328125);
    float _1984 = exp2(_1974);
    float _1986 = _1976 * 0.636619746685028076171875;
    float _1988 = -_1950;
    float _1990 = fma(_1984, _1980, _1988);
    float _1992 = -_1982;
    float _1994 = fma(_1986, _1992, 1.0);
    float _1996 = fma(_1990, 0.5, 0.5);
    float2 _5605 = float2(_1994, _1996);
    float3 _2000 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5605, float2(0.0), isnan(_5605)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5605, float2(0.0), isnan(_5605)), level(0.0)).xyz;
    float _2002 = _2000.x;
    float _2004 = _2000.y;
    float _2006 = _2000.z;
    float _2008 = abs(_1108);
    float _2010 = log2(_2008);
    float _2012 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2014 = -_1058;
    float _2016 = _2014 + 1.0;
    out.m_89.x = _1373;
    out.m_89.y = _1371;
    out.m_89.z = _1377;
    bool _2018 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2020 = isnan(_1782);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2026 = _2022 || _2024;
    float _2028 = exp2(_2012);
    float _2030 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2032 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2034 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2032);
    float _2036 = exp2(_2030);
    float _2038 = -_2028;
    float _2040 = _2038 + 1.0;
    float _2042 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2044 = _2042 * _1671;
    float _2046 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2048 = precise::clamp(_2046, 0.0, 1.0);
    float _2050 = fma(_2048, -2.0, 3.0);
    float _2052 = _2048 * _2048;
    float _2054 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2034);
    float _2056 = _2052 * _2050;
    float _2058 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2054);
    float _2060 = -_2056;
    float _2062 = _2060 + 1.0;
    float _2064 = _2058 + _1565;
    float _2066 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2056);
    bool _2068 = _1108 <= 8000.0;
    bool _2070 = isnan(_1108);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan(8000.0);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    float _2080 = _2064 * 0.5;
    float _2082 = _2078 * _2066;
    float _2084 = _2078;
    float _2086 = _2058;
    if (!_1559)
    {
        _2084 = 1.0;
    }
    float _2088 = _2084;
    out.gl_Position.x = _1603;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _2058;
    out.gl_Position.w = _1565;
    float _2090 = _2088;
    if (_1559)
    {
        bool _2092 = _1669 >= _1651;
        bool _2094 = isnan(_1669);
        bool _2096 = _2092 || _2094;
        bool _2098 = isnan(_1651);
        bool _2100 = _2096 || _2098;
        float _2102 = float(_2100);
        _2090 = _2102;
    }
    float _2104 = _2090;
    float _2106 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2026)
    {
        _1657 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2108 = _1657;
    out.m_91.z = _2080;
    out.m_91.w = _1565;
    float _2110 = _2016 * _2106;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = _2104 * _1760;
    float _2116 = -_2112;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2120 = _1682 * _2044;
    float _2122 = -_2114;
    float _2124 = fma(_2122, _2118, 1.0);
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = -_2042;
    float _2130 = _2128 + 1.0;
    float _2132 = _2130;
    float _2134 = _2126;
    float _2136 = _2108;
    float _2138 = _2108;
    if (!_2026)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2140 = _1615;
    float _2142 = _2126 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2144 = _1682 * _2130;
    float _2146 = _2140;
    float _2148 = _2140;
    if (!_2026)
    {
        _2086 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2150 = _2086;
    float _2152 = _2150;
    float _2154 = _2150;
    if (!_2026)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2156 = _2132;
    out.m_93.x = _2142;
    float _2158 = _2156;
    float _2160 = _2156;
    if (!_2026)
    {
        _2134 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2162 = _2134;
    float _2164 = _2006 * _2044;
    float _2166 = fma(_2002, _2120, _1676);
    float _2168 = fma(_2004, _2120, _1678);
    float _2170 = _2162;
    float _2172 = _2162;
    if (!_2026)
    {
        _1694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2174 = _1694;
    float _2176 = fma(_1682, _2164, _1680);
    out.m_95.x = _2166;
    out.m_95.y = _2168;
    out.m_95.z = _2176;
    out.m_95.w = _2144;
    bool _2178 = !_2026;
    float _2180 = _2174;
    float _2182 = _2174;
    if (!_2178)
    {
        bool _2184 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2186 = isnan(_1782);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2192 = _2188 || _2190;
        if (!_2192)
        {
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = _1782 + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2198;
            float _2202 = 1.0 / _2200;
            float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2206 = _2204 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2224 = _2196 * _2202;
            float _2226 = precise::clamp(_2224, 0.0, 1.0);
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2232 = fma(_2226, _2206, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2234 = fma(_2226, _2230, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2236 = fma(_2226, _2210, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2238 = fma(_2226, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2240 = fma(_2226, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2242 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2182 = _2232;
            _2138 = _2240;
            _2148 = _2234;
            _2160 = _2238;
            _2154 = _2236;
            _2172 = _2242;
            _2244 = true;
        }
        else
        {
            bool _2246 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2248 = isnan(_1782);
            bool _2250 = _2246 || _2248;
            bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2254 = _2250 || _2252;
            if (!_2254)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2256 = _2146;
            _2148 = _2256;
            if (!_2254)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2258 = _2180;
            _2182 = _2258;
            if (!_2254)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2260 = _2152;
            _2154 = _2260;
            if (!_2254)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2262 = _2158;
            _2160 = _2262;
            if (!_2254)
            {
                _2136 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2264 = _2136;
            _2138 = _2264;
            if (!_2254)
            {
                _2170 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2266 = _2170;
            bool _2268 = !_2254;
            _2172 = _2266;
            if (!_2268)
            {
                bool _2270 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2272 = isnan(_1782);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2278 = _2274 || _2276;
                if (!_2278)
                {
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = _1782 + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2284;
                    float _2288 = 1.0 / _2286;
                    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2310 = _2282 * _2288;
                    float _2312 = precise::clamp(_2310, 0.0, 1.0);
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2318 = fma(_2312, _2292, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2182 = _2318;
                    _2138 = _2326;
                    _2148 = _2320;
                    _2160 = _2324;
                    _2154 = _2322;
                    _2172 = _2328;
                    _2244 = true;
                }
                else
                {
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2138 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2172 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2244 = false;
    float _2330 = _2182;
    float _2332 = _2138;
    float _2334 = _2148;
    float _2336 = _2160;
    float _2338 = _2154;
    float _2340 = _2172;
    float _2342 = fma(_942, -0.5, 0.5);
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = -_2330;
    float _2348 = _2346 + _2332;
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    bool _2358 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2360 = fma(_2344, _2348, _2330);
    float _2362 = fma(_2344, _2352, _2334);
    float _2364 = fma(_2344, _2356, _2338);
    float _2366 = _2360 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2368 = fma(_2362, 0.298911988735198974609375, _2366);
    float _2370 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2372 = fma(_2364, 0.114477999508380889892578125, _2368);
    out.m_93.w = _2370;
    float _2374 = -_2372;
    float _2376 = _2362 + _2374;
    float _2378 = -_2372;
    float _2380 = _2360 + _2378;
    float _2382 = -_2372;
    float _2384 = _2364 + _2382;
    out.m_97.x = 0.0;
    float _2386 = fma(_2376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2388 = fma(_2380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2390 = fma(_2384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    out.m_99.x = 0.0;
    out.m_101.x = _2386;
    out.m_101.y = _2388;
    out.m_101.z = _2390;
    if (!_2358)
    {
        return out;
    }
    float _2392 = -_1371;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2396 = -_1373;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2400 = -_1377;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = rsqrt(_2408);
    float _2412 = _2394 * _2410;
    float _2414 = _2398 * _2410;
    float _2416 = _2402 * _2410;
    float _2418 = -_1788;
    float _2420 = _2418 + _2412;
    float _2422 = -_1784;
    float _2424 = _2422 + _2414;
    float _2426 = -_1786;
    float _2428 = _2426 + _2416;
    float _2430 = sqrt(_2408);
    float _2432 = _2420 * _2420;
    float _2434 = fma(_2424, _2424, _2432);
    float _2436 = fma(_2428, _2428, _2434);
    float _2438 = rsqrt(_2436);
    float _2440 = -_2430;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = abs(_2446);
    float _2450 = log2(_2448);
    float _2452 = _2420 * _2438;
    float _2454 = _2424 * _2438;
    float _2456 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2428 * _2438;
    float _2462 = _942 * _2452;
    float _2464 = _942 * _2412;
    float _2466 = fma(_950, _2454, _2462);
    float _2468 = _2458 * _2458;
    float _2470 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2472 = fma(_950, _2414, _2464);
    float _2474 = fma(_962, _2460, _2466);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = _2468 + (-1.0);
    float _2480 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2482 = fma(_962, _2416, _2472);
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = _2476 * _2476;
    float _2488 = fma(_2486, _2478, 1.0);
    float _2490 = exp2(_2480);
    float _2492 = -_2412;
    float _2494 = -_2470;
    float _2496 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2494);
    float _2498 = _2488 * _2488;
    float _2500 = -_2416;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2496);
    float _2504 = 1.0 / _2498;
    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2508 = _2502 + _2506;
    float _2510 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2490 * _2512;
    float _2516 = _2484 * _2514;
    float _2518 = _2468 * _2504;
    float _2520 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2522 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2524 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2526 = _2516 * _2518;
    float _2528 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2530 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2532 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2520;
    out.m_97.y = _2522;
    out.m_97.z = _2524;
    out.m_99.x = _2528;
    out.m_99.y = _2530;
    out.m_99.z = _2532;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2244 = false;
    bool _1010 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2589 = as_type<float>(_136);
        out.gl_Position.z = _2589;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    if (_150)
    {
        float _158 = float(_120);
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    if (_166)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _130;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _138 = as_type<int>(_170);
    }
    int _172 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2657 = as_type<float>(_172);
        out.gl_Position.z = _2657;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_65.y;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_65.z;
    float _180 = in.m_67.y;
    float _182 = in.m_67.z;
    float _184 = in.m_69.y;
    float _186 = in.m_69.z;
    float _188 = _174 * _174;
    float _190 = in.m_65.x;
    float _192 = _178 * _178;
    float _194 = in.m_67.x;
    float _196 = fma(_180, _180, _188);
    float _198 = in.m_69.x;
    float _200 = fma(_182, _182, _192);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _200);
    float _206 = sqrt(_202);
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = sqrt(_204);
    bool _216 = _206 > 0.0;
    bool _218 = _214 > 0.0;
    float _220 = _174 * _210;
    float _222 = _180 * _210;
    float _224 = _184 * _210;
    float _226 = 0.0;
    if (_216)
    {
        float _228 = rsqrt(_202);
        _226 = _228;
    }
    float _230 = _226;
    float _232 = fma(_208, _190, _220);
    float _234 = fma(_208, _194, _222);
    float _236 = fma(_208, _198, _224);
    float _238 = 0.0;
    float _240 = 0.0;
    float _242 = _232;
    if (!_216)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _244 = _238;
    float _246 = _240;
    float _248 = fma(_178, _212, _232);
    float _250 = 0.0;
    float _252 = _246;
    float _254 = _244;
    if (!_216)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = fma(_182, _212, _234);
    float _260 = _204;
    float _262 = _256;
    if (_218)
    {
        float _264 = rsqrt(_204);
        _260 = _264;
    }
    float _266 = _260;
    float _268 = 0.0;
    if (!_218)
    {
        _268 = 0.0;
    }
    float _270 = _268;
    float _272 = fma(_186, _212, _236);
    float _274 = _270;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _276 = _242;
    float _278 = 0.0;
    float _280 = _276;
    if (!_218)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = _282;
    if (_216)
    {
        float _286 = _230 * _180;
        _252 = _286;
    }
    float _288 = _252;
    float _290 = _288;
    if (_216)
    {
        float _292 = _230 * _174;
        _254 = _292;
    }
    float _294 = _254;
    float _296 = _294;
    if (_216)
    {
        float _298 = _230 * _184;
        _262 = _298;
    }
    float _300 = _262;
    float _302 = _300;
    if (_218)
    {
        float _304 = _266 * _182;
        _274 = _304;
    }
    float _306 = _274;
    if (_218)
    {
        float _308 = _266 * _178;
        _280 = _308;
    }
    float _310 = _280;
    if (_218)
    {
        float _312 = _266 * _186;
        _284 = _312;
    }
    float _314 = _284;
    bool _316 = !_176;
    float _334;
    if (!_316)
    {
        float _318 = in.m_73.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        float _338 = float(_120);
        float _340 = 1.0 / _338;
        float _342 = _154 * _340;
        _334 = _342;
    }
    _336 = false;
    float _344 = _334;
    float _346 = in.m_58.x;
    float _348 = in.m_58.y;
    float _350 = in.m_58.z;
    float _352 = _248 * _248;
    float _354 = _154 * 0.15915493667125701904296875;
    float _356 = in.m_75.x;
    float _358 = fma(_258, _258, _352);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = _354 * 6.283185482025146484375;
    float _370 = sin(_368);
    float _372 = fma(_272, _272, _358);
    float _374 = in.m_69.w;
    float _376 = 1.0 / _362;
    float _378 = _180 * _348;
    float _380 = 1.0 / _366;
    float _382 = _184 * _348;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _344 + _384;
    float _388 = fma(_194, _346, _378);
    float _390 = _370 * _356;
    float _392 = in.m_77.x;
    float _394 = fma(_198, _346, _382);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _344 + _396;
    float _400 = rsqrt(_372);
    float _402 = _386 * _376;
    float _404 = fma(_182, _350, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    bool _410 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_344);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _398 * _380;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _428;
    float _432 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = fma(_426, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _440 = fma(_430, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = _258 * _400;
    float _448 = _248 * _400;
    float _450 = _272 * _400;
    bool _452 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _454 = isnan(_344);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _468 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _470 = isnan(_344);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = _448 * _294;
    bool _482 = _392 > 0.0;
    float _484 = fma(_436, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _486 = _392 >= 0.0;
    bool _488 = isnan(_392);
    bool _490 = _486 || _488;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    float _496 = -_478;
    float _498 = _496 + 1.0;
    float _500 = fma(_446, _288, _480);
    float _502 = fma(_444, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _504 = _494 ? 0 : 1;
    float _506 = _462 * _498;
    float _508 = -_462;
    float _510 = _508 + 1.0;
    float _512 = fma(_450, _300, _500);
    int _514 = ~_504;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_466, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _522 = _420 * _510;
    int _524 = _518;
    if (!_482)
    {
        int _526 = ~_504;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = -_420;
    float _534 = _532 + 1.0;
    float _536 = abs(_512);
    bool _538 = _536 > 0.99989998340606689453125;
    float _540 = _438 * _522;
    float _542 = float(_530);
    float _544 = _432 * _522;
    float _546 = _440 * _522;
    float _548 = _390 * 60.0;
    float _550 = in.m_79.x;
    float _552 = in.m_79.y;
    float _554 = in.m_79.z;
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _540);
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _560 = _542 * _548;
    float _562 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _546);
    float _564 = fma(_502, _506, _556);
    float _566 = fma(_484, _506, _558);
    float _568 = _560 * 0.01745329238474369049072265625;
    float _570 = in.m_77.z;
    if (_538)
    {
        float _572 = fma(_306, 0.001000000047497451305389404296875, _288);
        _290 = _572;
    }
    float _574 = _290;
    if (_538)
    {
        float _576 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _576;
    }
    float _578 = _302;
    float _580 = _568 * 0.15915493667125701904296875;
    if (_538)
    {
        float _582 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _582;
    }
    float _584 = _296;
    float _586 = -_574;
    float _588 = _450 * _586;
    float _590 = -_578;
    float _592 = _448 * _590;
    float _594 = _580 * 6.283185482025146484375;
    float _596 = sin(_594);
    float _598 = fma(_520, _506, _562);
    float _600 = -_578;
    float _602 = -_588;
    float _604 = fma(_446, _600, _602);
    float _606 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].x, _566);
    float _608 = -_584;
    float _610 = -_592;
    float _612 = fma(_450, _608, _610);
    float _614 = -_584;
    float _616 = _446 * _614;
    float _618 = _604 * _604;
    float _620 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].y, _564);
    float _622 = _580 * 6.283185482025146484375;
    float _624 = cos(_622);
    float _626 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[145].z, _598);
    float _628 = in.m_77.y;
    float _630 = _606 * _550;
    float _632 = _542 * 0.02999999932944774627685546875;
    float _634 = -_574;
    float _636 = -_616;
    float _638 = fma(_448, _634, _636);
    float _640 = fma(_612, _612, _618);
    float _642 = _626 * _554;
    float _644 = -_632;
    float _646 = _644 + _392;
    float _648 = _570 + (-0.070000000298023223876953125);
    float _650 = fma(_638, _638, _640);
    float _652 = in.m_67.w;
    float _654 = _596 * _646;
    float _656 = _620 * _552;
    float _658 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = _624 * _646;
    float _662 = rsqrt(_650);
    float _664 = -_654;
    float _666 = fma(_624, _648, _664);
    float _668 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _670 = fma(_596, _648, _660);
    float _672 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _674 = _666 + 0.070000000298023223876953125;
    float _676 = fma(_186, _350, _394);
    float _678 = _632 + _670;
    float _680 = in.m_81.z;
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _684 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _628);
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _678);
    bool _688 = _628 != 0.0;
    bool _690 = isnan(_628);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = _174 * _348;
    float _700 = _672 * _684;
    float _702 = _658 * _686;
    float _704 = _668 * _682;
    float _706 = _612 * _662;
    float _708 = _638 * _662;
    float _710 = _604 * _662;
    float _712 = _700 * _446;
    float _714 = _700 * _450;
    float _716 = _448 * _708;
    float _718 = _446 * _710;
    float _720 = fma(_702, _706, _712);
    float _722 = fma(_702, _708, _714);
    float _724 = -_716;
    float _726 = fma(_450, _710, _724);
    float _728 = -_718;
    float _730 = fma(_448, _706, _728);
    float _732 = _404 + _652;
    float _734 = _676 + _374;
    float _736 = fma(_704, _726, _720);
    float _738 = fma(_704, _730, _722);
    float _740 = -_632;
    bool _742 = _670 == _740;
    bool _744 = !_696;
    bool _746 = _742 && _744;
    float _748 = in.m_65.w;
    float _750 = _732 + _736;
    float _752 = _734 + _738;
    float _754 = fma(_190, _346, _698);
    float _756 = in.m_81.x;
    float _758 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _760 = _750 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _764 = _752 + _762;
    float _766 = _700 * _448;
    float _768 = in.m_81.y;
    float _770 = _760 * _760;
    float _772 = _764 * _764;
    float _774 = _450 * _706;
    bool _776 = _666 == (-0.070000000298023223876953125);
    bool _778 = _776 && _746;
    float _780 = fma(_178, _350, _754);
    float _782 = _770 + _772;
    float _784 = fma(_702, _710, _766);
    float _786 = -_774;
    float _788 = fma(_446, _708, _786);
    float _790 = sqrt(_782);
    float _792 = fma(_704, _788, _784);
    float _794 = _624 * _756;
    float _796 = _596 * _756;
    float _798 = _780 + _748;
    float _800 = fma(_596, _680, _794);
    float _802 = -_796;
    float _804 = fma(_624, _680, _802);
    bool _806 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _808 = _798 + _792;
    float _810 = _800;
    float _812 = _804;
    float _814 = _794;
    float _816 = _766;
    float _818 = _678;
    float _820 = _632;
    float _822 = _624;
    float _824 = _730;
    if (!_778)
    {
        float _826 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _800);
        _810 = _826;
    }
    float _828 = _810;
    float _830 = _768;
    if (!_778)
    {
        float _832 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[17].y, _768);
        _830 = _832;
    }
    float _834 = _830;
    if (!_778)
    {
        float _836 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _804);
        _812 = _836;
    }
    float _838 = _812;
    if (!_806)
    {
        _814 = _772;
    }
    float _840 = _814;
    float _842 = _840;
    if (!_806)
    {
        _816 = _770;
    }
    float _844 = _816;
    float _846 = _844;
    if (!_806)
    {
        _818 = _750;
    }
    float _848 = _818;
    float _850 = _848;
    if (!_806)
    {
        _820 = _752;
    }
    float _852 = _820;
    float _854 = _852;
    if (!_806)
    {
        _822 = _808;
    }
    float _856 = _822;
    bool _858 = !_806;
    float _860 = _856;
    if (!_858)
    {
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _866 = _790 + _864;
        float _868 = rsqrt(_782);
        float _870 = _866 * _862;
        float _872 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = _870 * 0.15915493667125701904296875;
        float _876 = _874 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _874 * 6.283185482025146484375;
        float _882 = cos(_880);
        float _884 = fma(_878, _872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _886 = _868 * _884;
        float _888 = _882 + (-1.0);
        float _890 = fma(_760, _886, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _892 = fma(_764, _886, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _894 = _888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _898 = _890 + _896;
        float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _902 = _892 + _900;
        float _904 = fma(_808, _882, _894);
        float _906 = _898 * _898;
        float _908 = _902 * _902;
        _860 = _904;
        _846 = _906;
        _842 = _908;
        _850 = _890;
        _854 = _892;
    }
    float _910 = _860;
    float _912 = _846;
    float _914 = _842;
    float _916 = _850;
    float _918 = _854;
    float _920 = in.m_75.w;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _924 = _910 + _922;
    float _926 = _448 * _834;
    float _928 = _446 * _834;
    float _930 = _450 * _834;
    float _932 = fma(_924, _924, _912);
    float _934 = fma(_710, _828, _926);
    float _936 = fma(_706, _828, _928);
    float _938 = fma(_708, _828, _930);
    float _940 = _932 + _914;
    float _942 = fma(_788, _838, _934);
    float _944 = sqrt(_940);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _950 = fma(_726, _838, _936);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _958 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = fma(_730, _838, _938);
    out.m_83.w = _920;
    out.m_85.x = _954;
    out.m_85.y = _958;
    out.m_85.z = _960;
    out.m_85.w = _956;
    bool _964 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _966 = isnan(_944);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _972 = _968 || _970;
    out.m_87.x = _950;
    out.m_87.y = _942;
    out.m_87.z = _962;
    float _974 = _918;
    if (!_972)
    {
        _824 = 1.0;
    }
    float _976 = _824;
    bool _978 = !_972;
    float _980 = _976;
    if (!_978)
    {
        bool _982 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _984 = isnan(_944);
        bool _986 = _982 || _984;
        bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _990 = _986 || _988;
        if (!_990)
        {
            float _992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _994 = _944 + _992;
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1002 = _1000 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1004 = 1.0 / _998;
            float _1006 = _994 * _1004;
            float _1008 = fma(_1006, _1002, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _980 = _1008;
            _1010 = true;
        }
        else
        {
            bool _1012 = _944 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1014 = isnan(_944);
            bool _1016 = _1012 || _1014;
            bool _1018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1020 = _1016 || _1018;
            if (!_1020)
            {
                float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1024 = _944 + _1022;
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _1026 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1034 = 1.0 / _1028;
                float _1036 = _1024 * _1034;
                float _1038 = fma(_1036, _1032, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _980 = _1038;
                _1010 = true;
            }
            else
            {
                _980 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1010 = false;
    float _1040 = _980;
    float _1042 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1044 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1046 = floor(_1042);
    float _1048 = floor(_1044);
    float _1050 = -_1046;
    float _1052 = _1042 + _1050;
    float _1054 = -_1048;
    float _1056 = _1044 + _1054;
    float2 _4037 = float2(_1052, _1056);
    float _1058 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4037, float2(0.0), isnan(_4037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4037, float2(0.0), isnan(_4037)), level(0.0)).x;
    float _1060 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1064 = _916 + _1062;
    float _1066 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1060);
    float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1070 = _910 + _1068;
    float _1072 = fma(_1064, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1074 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1066);
    float _1076 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1078 = fma(_1070, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1082 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1076);
    float _1084 = 1.0 / _1080;
    float _1086 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1082);
    float _1088 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1090 = _1088 + _1080;
    float _1092 = _1090 * _1084;
    float _1094 = _1092 * 0.5;
    float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1098 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1096);
    float _1100 = 1.0 / _1098;
    float _1102 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1104 = _798 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1108 = _1100 * _1106;
    float _1110 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1112 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1114 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1116 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1110);
    bool _1118 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1120 = fma(_732, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1112);
    bool _1122 = !_1114;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1116);
    float _1128 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1120);
    float _1130 = _1126 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1132 = _1128 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1134 = 2;
    float _1136 = _1064;
    float _1138 = _1040;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].y);
    if (!_1114)
    {
        _1134 = 1;
    }
    int _1142 = _1134;
    float _1144 = trunc(_1130);
    int _1146 = int(_1144);
    int _1148 = _1142;
    if (!_1118)
    {
        _1148 = _1124;
    }
    int _1150 = _1148;
    bool _1152 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    int _1162 = _1150 << 6;
    float _1164 = trunc(_1132);
    int _1166 = int(_1164);
    int _1168 = _1162 + 48;
    uint _1171 = uint(int(uint(_1168) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.vp_c15)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.vp_c15)._m0[int(_1181)][_1183];
    int _1187 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1189 = _1146 + _1187;
    int _1191 = _1189 + 1;
    int _1193 = _1162 + 56;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
    int _1199 = int(_1195) & 3;
    float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
    int _1203 = int(_1195) + 1;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    int _1207 = _1203 & 3;
    float _1209 = (*spvDescriptorSet0.vp_c15)._m0[int(_1205)][_1207];
    if (_1160)
    {
        _1136 = _1078;
    }
    float _1211 = _1136;
    bool _1213 = _1191 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1215 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1217 = _1166 + _1215;
    int _1219 = _1217 + 1;
    int _1221 = _1162 + 64;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    uint _1225 = uint(int(uint(int(_1223)) >> uint(2)));
    int _1227 = int(_1223) & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    int _1231 = int(_1223) + 1;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    int _1235 = _1231 & 3;
    float _1237 = (*spvDescriptorSet0.vp_c15)._m0[int(_1233)][_1235];
    int _1239 = _1191 | _1219;
    bool _1241 = _1239 < 0;
    bool _1243 = _1241 || _1213;
    int _1245 = _1162 + 72;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    uint _1249 = uint(int(uint(int(_1247)) >> uint(2)));
    int _1251 = int(_1247) & 3;
    float _1253 = (*spvDescriptorSet0.vp_c15)._m0[int(_1249)][_1251];
    int _1255 = int(_1247) + 1;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    int _1259 = _1255 & 3;
    float _1261 = (*spvDescriptorSet0.vp_c15)._m0[int(_1257)][_1259];
    float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1265 = _918 + _1263;
    float _1267 = _1211;
    if (_1160)
    {
        _974 = _1072;
    }
    float _1269 = _974;
    bool _1271 = _1219 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1273 = _1271 || _1243;
    float _1275 = fma(_1265, _1040, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1277 = _1162 + 96;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    float _1295 = _1269;
    if (_1160)
    {
        _1138 = _1275;
    }
    float _1297 = _1138;
    int _1299 = _1162 + 104;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    uint _1303 = uint(int(uint(int(_1301)) >> uint(2)));
    int _1305 = int(_1301) & 3;
    float _1307 = (*spvDescriptorSet0.vp_c15)._m0[int(_1303)][_1305];
    int _1309 = int(_1301) + 1;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    int _1313 = _1309 & 3;
    float _1315 = (*spvDescriptorSet0.vp_c15)._m0[int(_1311)][_1313];
    float _1317 = _1297;
    int _1319 = as_type<int>(_1293);
    if (!_1160)
    {
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1323 = _798 + _1321;
        float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1327 = _732 + _1325;
        float _1329 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1331 = _1323 * _1323;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _734 + _1333;
        float _1337 = fma(_1327, _1327, _1331);
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1341 = fma(_1335, _1335, _1337);
        float _1343 = sqrt(_1341);
        float _1345 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = precise::min(_1343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1349 = _1347 * _1339;
        float _1351 = -_798;
        float _1353 = _1351 + _1078;
        float _1355 = -_734;
        float _1357 = _1355 + _1275;
        float _1359 = _1345 * _1349;
        float _1361 = -_732;
        float _1363 = _1361 + _1072;
        float _1365 = fma(_1353, _1359, _798);
        float _1367 = fma(_1363, _1359, _732);
        float _1369 = fma(_1357, _1359, _734);
        _1267 = _1365;
        _1295 = _1367;
        _1140 = as_type<int>(_1357);
        _1317 = _1369;
    }
    float _1371 = _1267;
    float _1373 = _1295;
    int _1375 = _1140;
    float _1377 = _1317;
    float _1379 = _1104 * _1293;
    int _1381 = _1375;
    if (!_1273)
    {
        int _1383 = _1219 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1385 = _1383 + _1191;
        _1319 = _1385;
    }
    int _1387 = _1319;
    float _1389 = _1104 * _1185;
    float _1391 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1393 = fma(_732, _1285, _1379);
    float _1395 = _1104 * _1237;
    int _1397 = as_type<int>(_1389);
    float _1399 = as_type<float>(_1387);
    if (!_1273)
    {
        int _1401 = _1387 << 2;
        _1381 = _1401;
    }
    int _1403 = _1381;
    float _1405 = fma(_732, _1177, _1389);
    float _1407 = fma(_734, _1307, _1393);
    int _1409 = _1403;
    if (!_1273)
    {
        uint _1411 = uint(int(uint(_1387) >> uint(2)));
        _1397 = int(_1411);
    }
    int _1413 = _1397;
    float _1415 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1391);
    if (!_1273)
    {
        int _1417 = 12 & _1403;
        _1409 = _1417;
    }
    int _1419 = _1409;
    float _1421 = _1407 + _1315;
    float _1423 = fma(_732, _1229, _1395);
    float _1425 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1415);
    int _1427 = _1162 + 80;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    float _1445 = as_type<float>(_1419);
    if (!_1273)
    {
        int _1447 = _1413 << 4;
        int _1449 = _1447 + _1419;
        _1445 = as_type<float>(_1449);
    }
    float _1451 = _1445;
    float _1453 = fma(_734, _1201, _1405);
    float _1455 = 1.0 / _1421;
    float _1457 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1459 = fma(_734, _1253, _1423);
    float _1461 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1453 + _1209;
    float _1465 = _1451;
    if (!_1273)
    {
        int _1467 = as_type<int>(_1451) + 400;
        uint _1469 = uint(int(uint(_1467) >> uint(2)));
        uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
        int _1473 = int(_1469) & 3;
        float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
        _1465 = _1475;
    }
    float _1477 = _1465;
    float _1479 = _1459 + _1261;
    float _1481 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1483 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1485 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1487 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1489 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1481);
    int _1491 = _1162 + 88;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
    float _1509 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1483);
    float _1511 = -_1485;
    float _1513 = fma(_1511, _1487, 1.0);
    float _1515 = _1463 * _1455;
    float _1517 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1519 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1489);
    float _1521 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1523 = _1479 * _1455;
    bool _1525 = _1515 >= 0.0;
    float _1527 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1517);
    float _1529 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1531 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1533 = _1515 <= 1.0;
    bool _1535 = _1533 && _1525;
    float _1537 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1527);
    float _1539 = 0.0;
    if (!_1273)
    {
        float _1541 = floor(_1132);
        _1539 = _1541;
    }
    float _1543 = _1539;
    float _1545 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1531);
    bool _1547 = _1523 >= 0.0;
    bool _1549 = _1547 && _1535;
    float _1551 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1553 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1555 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    bool _1557 = _1523 <= 1.0;
    bool _1559 = _1557 && _1549;
    float _1561 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1563 = log2(_1513);
    float _1565 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1555);
    float _1567 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1553);
    float _1569 = 1.0 / _1565;
    float _1571 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1561);
    float _1573 = _1104 * _1443;
    float _1575 = _1443;
    if (_1559)
    {
        float _1577 = float(_1150);
        _1575 = _1577;
    }
    float _1579 = _1575;
    float _1581 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1567);
    float _1583 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1571);
    float _1585 = fma(_732, _1435, _1573);
    float _1587 = _1543;
    if (!_1273)
    {
        float _1589 = -_1543;
        float _1591 = _1132 + _1589;
        _1587 = _1591;
    }
    float _1593 = _1587;
    float _1595 = _772;
    float _1597 = _1593;
    if (!_1273)
    {
        float _1599 = floor(_1130);
        _1595 = _1599;
    }
    float _1601 = _1595;
    float _1603 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1581);
    float _1605 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1583);
    float _1607 = _1563 * 0.693147182464599609375;
    float _1609 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1611 = _1567;
    float _1613 = _1607;
    float _1615 = _1605;
    if (_1559)
    {
        float _1617 = rint(_1579);
        float _1619 = precise::max(_1617, 0.0);
        uint _1621 = uint(_1619);
        uint _1623 = clamp(_1621, 0u, 65535u);
        _1611 = as_type<float>(_1623);
    }
    float _1625 = _1611;
    float _1627 = _1605 * _1569;
    float _1629 = fma(_734, _1499, _1585);
    float _1631 = _1629 + _1507;
    float _1633 = _1603 * _1569;
    float _1635 = _1477;
    float _1637 = _1627;
    if (!_1273)
    {
        float _1639 = rint(_1477);
        float _1641 = precise::max(_1639, 0.0);
        uint _1643 = uint(_1641);
        uint _1645 = clamp(_1643, 0u, 65535u);
        _1635 = as_type<float>(_1645);
    }
    float _1647 = _1635;
    float _1649 = fma(_1627, -0.5, 0.5);
    float _1651 = _1631 * _1455;
    float _1653 = fma(_1633, 0.5, 0.5);
    float _1655 = _1653;
    float _1657 = _1651;
    if (!_1273)
    {
        float _1659 = -_1601;
        float _1661 = _1130 + _1659;
        _1613 = _1661;
    }
    float _1663 = _1613;
    float _1665 = _1625;
    if (_1559)
    {
        float3 _5076 = float3(_1515, _1523, float(as_type<int>(_1625)));
        float3 _5080 = select(_5076, float3(0.0), isnan(_5076));
        float _1667 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5080.xy, uint(rint(_5080.z)), _1651, level(0.0));
        _1665 = _1667;
    }
    float _1669 = _1665;
    float3 _5090 = float3(_1653, _1649, _1609);
    float _1671 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5090, float3(0.0), isnan(_5090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5090, float3(0.0), isnan(_5090)), level(0.0)).x;
    float3 _5099 = float3(_1653, _1649, _1609);
    float4 _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5099, float3(0.0), isnan(_5099)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5099, float3(0.0), isnan(_5099)), level(0.0)).xyzw;
    float _1676 = _1674.x;
    float _1678 = _1674.y;
    float _1680 = _1674.z;
    float _1682 = _1674.w;
    float _1684 = _1663;
    if (!_1273)
    {
        float3 _5122 = float3(_1663, _1593, float(as_type<int>(_1647)));
        float3 _5124 = select(_5122, float3(0.0), isnan(_5122));
        float _1686 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5124.xy, uint(rint(_5124.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5124.xy, uint(rint(_5124.z)), level(0.0)).x;
        _1684 = _1686;
    }
    float _1688 = _1684;
    if (_1273)
    {
        _1637 = 1.0;
    }
    float _1690 = _1637;
    float _1692 = _1690;
    float _1694 = _1676;
    if (!_1273)
    {
        int _1696 = _1387 << 4;
        int _1698 = _1696 + 2048;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        uint _1702 = uint(int(uint(int(_1700)) >> uint(2)));
        int _1704 = int(_1700) & 3;
        float _1706 = (*spvDescriptorSet0.vp_c15)._m0[int(_1702)][_1704];
        int _1708 = int(_1700) + 1;
        uint _1710 = uint(int(uint(_1708) >> uint(2)));
        int _1712 = _1708 & 3;
        float _1714 = (*spvDescriptorSet0.vp_c15)._m0[int(_1710)][_1712];
        int _1716 = _1698 + 8;
        uint _1718 = uint(int(uint(_1716) >> uint(2)));
        uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
        int _1722 = int(_1718) & 3;
        float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
        int _1726 = int(_1718) + 1;
        uint _1728 = uint(int(uint(_1726) >> uint(2)));
        int _1730 = _1726 & 3;
        float _1732 = (*spvDescriptorSet0.vp_c15)._m0[int(_1728)][_1730];
        float _1734 = _1104 * _1714;
        float _1736 = fma(_732, _1706, _1734);
        float _1738 = fma(_734, _1724, _1736);
        float _1740 = _1738 + _1732;
        float _1742 = precise::clamp(_1740, 0.0, 1.0);
        float _1744 = -_1742;
        float _1746 = _1744 + _1688;
        float _1748 = fma(_1746, 500.0, 1.5);
        float _1750 = exp2(_1748);
        float _1752 = 0.0 + _1750;
        float _1754 = precise::clamp(_1752, 0.0, 1.0);
        _1399 = as_type<float>(_1698);
        _1655 = _1706;
        _1692 = _1754;
    }
    float _1756 = _1399;
    float _1758 = _1655;
    float _1760 = _1692;
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1764 = _1371 + _1762;
    float _1766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1768 = _1373 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1772 = _1377 + _1770;
    float _1774 = _1764 * _1764;
    float _1776 = fma(_1768, _1768, _1774);
    float _1778 = fma(_1772, _1772, _1776);
    float _1780 = rsqrt(_1778);
    float _1782 = sqrt(_1778);
    float _1784 = _1768 * _1780;
    float _1786 = _1772 * _1780;
    float _1788 = _1764 * _1780;
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1792 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1794 = _1790 * _1790;
    float _1796 = _1792 * _1792;
    float _1798 = _1794 + _1796;
    float _1800 = sqrt(_1798);
    bool _1802 = _1800 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1800 + _1804;
    float _1808 = _1647;
    float _1810 = _1806;
    float _1812 = _1758;
    float _1814 = _1780;
    if (_1802)
    {
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1816;
    }
    float _1818 = _1808;
    float _1820 = _1818;
    if (_1802)
    {
        float _1822 = _1806 * _1818;
        _1810 = _1822;
    }
    float _1824 = _1810;
    if (_1802)
    {
        float _1826 = rsqrt(_1798);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = _1828;
    if (_1802)
    {
        float _1832 = _1824 * 0.15915493667125701904296875;
        _1812 = _1832;
    }
    float _1834 = _1812;
    float _1836 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1838 = _1756;
    float _1840 = _1834;
    if (_1802)
    {
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = precise::max(0.0, _1836);
    float _1850 = _1688;
    if (_1802)
    {
        float _1852 = _1834 * 6.283185482025146484375;
        float _1854 = cos(_1852);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = -_1788;
    float _1860 = -_1848;
    float _1862 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1860);
    float _1864 = _1862;
    if (_1802)
    {
        float _1866 = _1862 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1814 = _1866;
    }
    float _1868 = _1814;
    float _1870 = _1846;
    float _1872 = _1868;
    if (_1802)
    {
        float _1874 = fma(_1846, _1868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1870 = _1874;
    }
    float _1876 = _1870;
    float _1878 = _1876;
    if (_1802)
    {
        float _1880 = _1828 * _1876;
        _1597 = _1880;
    }
    float _1882 = _1597;
    if (!_1802)
    {
        _1878 = _1790;
    }
    float _1884 = _1878;
    float _1886 = _1884;
    float _1888 = _1856;
    if (_1802)
    {
        float _1890 = _1856 + (-1.0);
        _1872 = _1890;
    }
    float _1892 = _1872;
    float _1894 = _1892;
    if (_1802)
    {
        float _1896 = _1790 * _1882;
        _1886 = _1896;
    }
    float _1898 = _1886;
    if (!_1802)
    {
        _1830 = _1794;
    }
    float _1900 = _1830;
    float _1902 = _1900;
    if (_1802)
    {
        float _1904 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1904;
    }
    float _1906 = _1840;
    if (!_1802)
    {
        _1894 = _1792;
    }
    float _1908 = _1894;
    float _1910 = _1908;
    if (_1802)
    {
        float _1912 = _1792 * _1882;
        _1910 = _1912;
    }
    float _1914 = _1910;
    if (_1802)
    {
        float _1916 = _1898 * _1898;
        _1902 = _1916;
    }
    float _1918 = _1902;
    if (_1802)
    {
        float _1920 = fma(_1862, _1856, _1906);
        _1864 = _1920;
    }
    float _1922 = _1864;
    if (!_1802)
    {
        _1888 = _1796;
    }
    float _1924 = _1888;
    float _1926 = _1924;
    if (_1802)
    {
        float _1928 = _1914 * _1914;
        _1926 = _1928;
    }
    float _1930 = _1926;
    float _1932 = fma(_1922, _1922, _1918);
    float _1934 = _1932 + _1930;
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1938 = fma(_1782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1936);
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1940;
    float _1944 = _1942 + 1.0;
    float _1946 = rsqrt(_1934);
    float _1948 = _1946 * _1898;
    float _1950 = _1946 * _1922;
    float _1952 = _1946 * _1914;
    float _1954 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1956 = abs(_1944);
    float _1958 = log2(_1956);
    float _1960 = -_1954;
    float _1962 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1960);
    float _1964 = -_1952;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1962);
    float _1968 = fma(_1966, -0.5, 0.5);
    float _1970 = fma(_1966, 0.5, 0.5);
    float _1972 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1974 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1976 = sqrt(_1968);
    float _1978 = fma(_1970, _1972, -0.212114393711090087890625);
    float _1980 = _1950 + 1.0;
    float _1982 = fma(_1970, _1978, 1.570728778839111328125);
    float _1984 = exp2(_1974);
    float _1986 = _1976 * 0.636619746685028076171875;
    float _1988 = -_1950;
    float _1990 = fma(_1984, _1980, _1988);
    float _1992 = -_1982;
    float _1994 = fma(_1986, _1992, 1.0);
    float _1996 = fma(_1990, 0.5, 0.5);
    float2 _5605 = float2(_1994, _1996);
    float3 _2000 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5605, float2(0.0), isnan(_5605)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5605, float2(0.0), isnan(_5605)), level(0.0)).xyz;
    float _2002 = _2000.x;
    float _2004 = _2000.y;
    float _2006 = _2000.z;
    float _2008 = abs(_1108);
    float _2010 = log2(_2008);
    float _2012 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2014 = -_1058;
    float _2016 = _2014 + 1.0;
    out.m_89.x = _1373;
    out.m_89.y = _1371;
    out.m_89.z = _1377;
    bool _2018 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2020 = isnan(_1782);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2026 = _2022 || _2024;
    float _2028 = exp2(_2012);
    float _2030 = _2010 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2032 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2034 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2032);
    float _2036 = exp2(_2030);
    float _2038 = -_2028;
    float _2040 = _2038 + 1.0;
    float _2042 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2044 = _2042 * _1671;
    float _2046 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2048 = precise::clamp(_2046, 0.0, 1.0);
    float _2050 = fma(_2048, -2.0, 3.0);
    float _2052 = _2048 * _2048;
    float _2054 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2034);
    float _2056 = _2052 * _2050;
    float _2058 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2054);
    float _2060 = -_2056;
    float _2062 = _2060 + 1.0;
    float _2064 = _2058 + _1565;
    float _2066 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2056);
    bool _2068 = _1108 <= 8000.0;
    bool _2070 = isnan(_1108);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan(8000.0);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    float _2080 = _2064 * 0.5;
    float _2082 = _2078 * _2066;
    float _2084 = _2078;
    float _2086 = _2058;
    if (!_1559)
    {
        _2084 = 1.0;
    }
    float _2088 = _2084;
    out.gl_Position.x = _1603;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _2058;
    out.gl_Position.w = _1565;
    float _2090 = _2088;
    if (_1559)
    {
        bool _2092 = _1669 >= _1651;
        bool _2094 = isnan(_1669);
        bool _2096 = _2092 || _2094;
        bool _2098 = isnan(_1651);
        bool _2100 = _2096 || _2098;
        float _2102 = float(_2100);
        _2090 = _2102;
    }
    float _2104 = _2090;
    float _2106 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2026)
    {
        _1657 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2108 = _1657;
    out.m_91.z = _2080;
    out.m_91.w = _1565;
    float _2110 = _2016 * _2106;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = _2104 * _1760;
    float _2116 = -_2112;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2120 = _1682 * _2044;
    float _2122 = -_2114;
    float _2124 = fma(_2122, _2118, 1.0);
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = -_2042;
    float _2130 = _2128 + 1.0;
    float _2132 = _2130;
    float _2134 = _2126;
    float _2136 = _2108;
    float _2138 = _2108;
    if (!_2026)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2140 = _1615;
    float _2142 = _2126 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2144 = _1682 * _2130;
    float _2146 = _2140;
    float _2148 = _2140;
    if (!_2026)
    {
        _2086 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2150 = _2086;
    float _2152 = _2150;
    float _2154 = _2150;
    if (!_2026)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2156 = _2132;
    out.m_93.x = _2142;
    float _2158 = _2156;
    float _2160 = _2156;
    if (!_2026)
    {
        _2134 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2162 = _2134;
    float _2164 = _2006 * _2044;
    float _2166 = fma(_2002, _2120, _1676);
    float _2168 = fma(_2004, _2120, _1678);
    float _2170 = _2162;
    float _2172 = _2162;
    if (!_2026)
    {
        _1694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2174 = _1694;
    float _2176 = fma(_1682, _2164, _1680);
    out.m_95.x = _2166;
    out.m_95.y = _2168;
    out.m_95.z = _2176;
    out.m_95.w = _2144;
    bool _2178 = !_2026;
    float _2180 = _2174;
    float _2182 = _2174;
    if (!_2178)
    {
        bool _2184 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2186 = isnan(_1782);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2192 = _2188 || _2190;
        if (!_2192)
        {
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = _1782 + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2198;
            float _2202 = 1.0 / _2200;
            float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2206 = _2204 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2224 = _2196 * _2202;
            float _2226 = precise::clamp(_2224, 0.0, 1.0);
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2232 = fma(_2226, _2206, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2234 = fma(_2226, _2230, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2236 = fma(_2226, _2210, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2238 = fma(_2226, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2240 = fma(_2226, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2242 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2182 = _2232;
            _2138 = _2240;
            _2148 = _2234;
            _2160 = _2238;
            _2154 = _2236;
            _2172 = _2242;
            _2244 = true;
        }
        else
        {
            bool _2246 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2248 = isnan(_1782);
            bool _2250 = _2246 || _2248;
            bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2254 = _2250 || _2252;
            if (!_2254)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2256 = _2146;
            _2148 = _2256;
            if (!_2254)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2258 = _2180;
            _2182 = _2258;
            if (!_2254)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2260 = _2152;
            _2154 = _2260;
            if (!_2254)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2262 = _2158;
            _2160 = _2262;
            if (!_2254)
            {
                _2136 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2264 = _2136;
            _2138 = _2264;
            if (!_2254)
            {
                _2170 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2266 = _2170;
            bool _2268 = !_2254;
            _2172 = _2266;
            if (!_2268)
            {
                bool _2270 = _1782 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2272 = isnan(_1782);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2278 = _2274 || _2276;
                if (!_2278)
                {
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = _1782 + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2284;
                    float _2288 = 1.0 / _2286;
                    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2310 = _2282 * _2288;
                    float _2312 = precise::clamp(_2310, 0.0, 1.0);
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2318 = fma(_2312, _2292, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2182 = _2318;
                    _2138 = _2326;
                    _2148 = _2320;
                    _2160 = _2324;
                    _2154 = _2322;
                    _2172 = _2328;
                    _2244 = true;
                }
                else
                {
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2138 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2172 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2244 = false;
    float _2330 = _2182;
    float _2332 = _2138;
    float _2334 = _2148;
    float _2336 = _2160;
    float _2338 = _2154;
    float _2340 = _2172;
    float _2342 = fma(_942, -0.5, 0.5);
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = -_2330;
    float _2348 = _2346 + _2332;
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    bool _2358 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2360 = fma(_2344, _2348, _2330);
    float _2362 = fma(_2344, _2352, _2334);
    float _2364 = fma(_2344, _2356, _2338);
    float _2366 = _2360 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2368 = fma(_2362, 0.298911988735198974609375, _2366);
    float _2370 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2372 = fma(_2364, 0.114477999508380889892578125, _2368);
    out.m_93.w = _2370;
    float _2374 = -_2372;
    float _2376 = _2362 + _2374;
    float _2378 = -_2372;
    float _2380 = _2360 + _2378;
    float _2382 = -_2372;
    float _2384 = _2364 + _2382;
    out.m_97.x = 0.0;
    float _2386 = fma(_2376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2388 = fma(_2380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2390 = fma(_2384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    out.m_99.x = 0.0;
    out.m_101.x = _2386;
    out.m_101.y = _2388;
    out.m_101.z = _2390;
    if (!_2358)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2392 = -_1371;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2396 = -_1373;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2400 = -_1377;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = rsqrt(_2408);
    float _2412 = _2394 * _2410;
    float _2414 = _2398 * _2410;
    float _2416 = _2402 * _2410;
    float _2418 = -_1788;
    float _2420 = _2418 + _2412;
    float _2422 = -_1784;
    float _2424 = _2422 + _2414;
    float _2426 = -_1786;
    float _2428 = _2426 + _2416;
    float _2430 = sqrt(_2408);
    float _2432 = _2420 * _2420;
    float _2434 = fma(_2424, _2424, _2432);
    float _2436 = fma(_2428, _2428, _2434);
    float _2438 = rsqrt(_2436);
    float _2440 = -_2430;
    float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = abs(_2446);
    float _2450 = log2(_2448);
    float _2452 = _2420 * _2438;
    float _2454 = _2424 * _2438;
    float _2456 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2428 * _2438;
    float _2462 = _942 * _2452;
    float _2464 = _942 * _2412;
    float _2466 = fma(_950, _2454, _2462);
    float _2468 = _2458 * _2458;
    float _2470 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2472 = fma(_950, _2414, _2464);
    float _2474 = fma(_962, _2460, _2466);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = _2468 + (-1.0);
    float _2480 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2482 = fma(_962, _2416, _2472);
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = _2476 * _2476;
    float _2488 = fma(_2486, _2478, 1.0);
    float _2490 = exp2(_2480);
    float _2492 = -_2412;
    float _2494 = -_2470;
    float _2496 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2494);
    float _2498 = _2488 * _2488;
    float _2500 = -_2416;
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2496);
    float _2504 = 1.0 / _2498;
    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2508 = _2502 + _2506;
    float _2510 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2490 * _2512;
    float _2516 = _2484 * _2514;
    float _2518 = _2468 * _2504;
    float _2520 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2522 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2524 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2526 = _2516 * _2518;
    float _2528 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2530 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2532 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2520;
    out.m_97.y = _2522;
    out.m_97.z = _2524;
    out.m_99.x = _2528;
    out.m_99.y = _2530;
    out.m_99.z = _2532;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

