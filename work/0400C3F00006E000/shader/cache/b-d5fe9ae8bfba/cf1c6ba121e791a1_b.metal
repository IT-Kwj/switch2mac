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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_83 [[user(locn0)]];
    float4 m_81 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2560 = false;
    bool _1333 = false;
    bool _484 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2905 = as_type<float>(_134);
        out.gl_Position.z = _2905;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_61.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2975 = as_type<float>(_172);
        out.gl_Position.z = _2975;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    bool _188 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _190 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    float _210 = _174 * _174;
    float _212 = _176 * _176;
    float _214 = _178 * _178;
    float _216 = fma(_182, _182, _210);
    float _218 = fma(_184, _184, _212);
    float _220 = fma(_186, _186, _214);
    float _222 = fma(_198, _198, _216);
    float _224 = fma(_200, _200, _218);
    float _226 = fma(_202, _202, _220);
    float _228 = sqrt(_222);
    float _230 = sqrt(_224);
    bool _232 = _228 > 0.0;
    float _234 = sqrt(_226);
    bool _236 = _230 > 0.0;
    float _238 = _230;
    float _240 = _222;
    float _242 = _180;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_196)
    {
        float _246 = _180 * _180;
        float _248 = _246 * 0.5;
        _238 = _248;
    }
    float _250 = _238;
    float _252 = 0.0;
    float _254 = _250;
    if (_232)
    {
        float _256 = rsqrt(_222);
        _252 = _256;
    }
    float _258 = _252;
    if (!_196)
    {
        float _260 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _260;
    }
    float _262 = _254;
    bool _264 = _234 > 0.0;
    float _266 = 0.0;
    float _268 = _262;
    if (_236)
    {
        float _270 = rsqrt(_224);
        _266 = _270;
    }
    float _272 = _266;
    bool _274 = !_196;
    float _276 = 0.0;
    float _278 = _258;
    if (!_274)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _180 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _180);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _308;
        _276 = _298;
        _240 = _294;
    }
    float _310 = _268;
    float _312 = _276;
    float _314 = _240;
    bool _316 = !_196;
    float _318 = _314;
    float _320 = _312;
    float _322 = _310;
    if (!_316)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _180 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _242 = _342;
        _244 = _330;
    }
    float _344 = _242;
    float _346 = _244;
    float _348 = in.m_71.w;
    float _350 = _346;
    if (!_232)
    {
        _318 = 0.0;
    }
    float _352 = _318;
    float _354 = _352;
    if (_232)
    {
        float _356 = _258 * _182;
        _354 = _356;
    }
    float _358 = _354;
    if (!_232)
    {
        _350 = 0.0;
    }
    float _360 = _350;
    float _362 = in.m_58.x;
    float _364 = in.m_58.y;
    float _366 = in.m_58.z;
    float _368 = 0.0;
    float _370 = _360;
    if (!_232)
    {
        _368 = 0.0;
    }
    float _372 = _368;
    float _374 = _372;
    if (_232)
    {
        float _376 = _258 * _174;
        _370 = _376;
    }
    float _378 = _370;
    if (_232)
    {
        float _380 = _258 * _198;
        _374 = _380;
    }
    float _382 = _374;
    float _384 = 0.0;
    if (_264)
    {
        float _386 = rsqrt(_226);
        _384 = _386;
    }
    float _388 = _384;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _392 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _394 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _396 = _392;
    if (!_236)
    {
        _278 = 0.0;
        _320 = 0.0;
    }
    float _398 = _278;
    float _400 = _320;
    float _402 = 0.0;
    float _404 = _400;
    float _406 = _398;
    if (!_236)
    {
        _402 = 0.0;
    }
    float _408 = _402;
    float _410 = fma(_344, _204, _392);
    float _412 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _414 = fma(_344, _206, _394);
    float _416 = 0.0;
    float _418 = _408;
    if (!_264)
    {
        _416 = 0.0;
        _396 = 0.0;
    }
    float _420 = _416;
    float _422 = _396;
    float _424 = _420;
    float _426 = _422;
    if (!_264)
    {
        _322 = 0.0;
    }
    float _428 = _322;
    float _430 = fma(_344, _208, _412);
    float _432 = _428;
    if (_236)
    {
        float _434 = _272 * _184;
        _418 = _434;
    }
    float _436 = _418;
    if (_236)
    {
        float _438 = _272 * _176;
        _404 = _438;
    }
    float _440 = _404;
    if (_236)
    {
        float _442 = _272 * _200;
        _406 = _442;
    }
    float _444 = _406;
    if (_264)
    {
        float _446 = _388 * _186;
        _424 = _446;
    }
    float _448 = _424;
    if (_264)
    {
        float _450 = _388 * _178;
        _426 = _450;
    }
    float _452 = _426;
    if (_264)
    {
        float _454 = _388 * _202;
        _432 = _454;
    }
    float _456 = _432;
    float _458 = fma(_410, _348, _362);
    float _460 = fma(_414, _348, _364);
    float _462 = fma(_430, _348, _366);
    bool _464 = !_390;
    float _482;
    if (!_464)
    {
        float _466 = in.m_73.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        float _486 = float(_118);
        float _488 = 1.0 / _486;
        float _490 = _152 * _488;
        _482 = _490;
    }
    _484 = false;
    float _492 = _482;
    float _494 = in.m_73.z;
    float _496 = _460 * _184;
    float _498 = in.m_73.x;
    float _500 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _502 = log2(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = in.m_73.y;
    float _514 = fma(_458, _182, _496);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _518 = _492 + _516;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _534 = _492 + _532;
    float _536 = 1.0 / _506;
    float _538 = 1.0 / _510;
    float _540 = _502 * _152;
    float _542 = _494 * 2.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = _498 * 2.0;
    float _550 = _498 + _494;
    float _552 = floor(_542);
    float _554 = _518 * _536;
    float _556 = _512 * 2.0;
    float _558 = _550 + (-1.0);
    float _560 = _512 + _494;
    float _562 = _534 * _538;
    float _564 = floor(_548);
    float _566 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _568 = !_522;
    int _570 = _568 ? 0 : 1;
    float _572 = _560 + (-1.0);
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _576 = _552 > 0.0;
    float _578 = floor(_556);
    bool _580 = _552 >= 0.0;
    bool _582 = isnan(_552);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _498 + _512;
    int _592 = _588 ? 0 : 1;
    float _594 = _590 + (-1.0);
    bool _596 = _564 > 0.0;
    int _598 = ~_592;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _606 = _564 >= 0.0;
    bool _608 = isnan(_564);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _616;
    int _620 = _602;
    if (!_576)
    {
        int _622 = ~_592;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _628;
    int _632 = abs(_570);
    bool _634 = _578 > 0.0;
    float _636 = fma(_630, _554, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _638 = _578 >= 0.0;
    bool _640 = isnan(_578);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_618, _554, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _650 = exp2(_540);
    float _652 = float(_632);
    float _654 = fma(_546, _554, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _656 = float(_626);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _666 = _614 ? 0 : 1;
    float _668 = _652 * _656;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _674 = in.m_75.x;
    float _676 = in.m_75.y;
    float _678 = in.m_75.z;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _682 = 1.0 + _680;
    int _684 = ~_666;
    int _686 = _684 + 1;
    int _688 = _686 + 1;
    float _690 = _668 * (-2.0);
    int _692 = _688;
    if (!_596)
    {
        int _694 = ~_666;
        int _696 = _694 + 1;
        _692 = _696;
    }
    int _698 = _692;
    float _700 = 1.0 / _682;
    bool _702 = !_526;
    int _704 = _702 ? 0 : 1;
    bool _706 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _708 = isnan(1.0);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _714 = _710 || _712;
    int _716 = abs(_704);
    float _718 = -_650;
    float _720 = _718 + 1.0;
    float _722 = fma(_660, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _724 = fma(_672, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = fma(_664, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _738 = float(_716);
    float _740 = float(_698);
    float _742 = _734 ? _720 : 0.0;
    int _744 = _646 ? 0 : 1;
    float _746 = _738 * _740;
    float _748 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_714)
    {
        float _750 = _742 * _700;
        _154 = _750;
    }
    float _752 = _154;
    float _754 = fma(_604, _690, _604);
    float _756 = _746 * (-2.0);
    float _758 = fma(_690, _674, _674);
    float _760 = _748 * _498;
    float _762 = _498 + (-0.5);
    bool _764 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _766 = isnan(_492);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_574, _756, _574);
    bool _778 = !_530;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_756, _676, _676);
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _758);
    bool _786 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _788 = isnan(_492);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_774;
    float _800 = _798 + 1.0;
    int _802 = ~_744;
    int _804 = _802 + 1;
    int _806 = _804 + 1;
    float _808 = fma(_754, _752, _784);
    int _810 = _806;
    if (!_634)
    {
        int _812 = ~_744;
        int _814 = _812 + 1;
        _810 = _814;
    }
    int _816 = _810;
    float _818 = _796 * _800;
    int _820 = abs(_780);
    float _822 = -_796;
    float _824 = _822 + 1.0;
    bool _826 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _828 = isnan(_492);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = _512 + (-0.5);
    float _840 = float(_820);
    float _842 = _808 * 0.15915493667125701904296875;
    float _844 = float(_816);
    float _846 = _836 * _824;
    float _848 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _782);
    float _850 = -_836;
    float _852 = _850 + 1.0;
    float _854 = _842 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _840 * _844;
    float _860 = _636 * _846;
    float _862 = _648 * _846;
    float _864 = _654 * _846;
    float _866 = fma(_776, _752, _848);
    float _868 = in.m_71.x;
    float _870 = in.m_71.y;
    float _872 = in.m_71.z;
    float _874 = _858 * (-2.0);
    float _876 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _864);
    float _878 = _866 * 0.15915493667125701904296875;
    float _880 = in.m_77.x;
    float _882 = in.m_77.y;
    float _884 = in.m_77.z;
    float _886 = fma(_566, _874, _566);
    float _888 = fma(_874, _678, _678);
    float _890 = _494 + (-0.5);
    float _892 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _862);
    float _894 = fma(_736, _818, _876);
    float _896 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _860);
    float _898 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[196].z, _888);
    float _900 = fma(_724, _818, _892);
    float _902 = _460 * _200;
    float _904 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].z, _894);
    float _906 = fma(_886, _752, _898);
    float _908 = _842 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = fma(_722, _818, _896);
    float _914 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].y, _900);
    float _916 = _906 * 0.15915493667125701904296875;
    float _918 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].x, _912);
    float _920 = fma(_458, _198, _902);
    float _922 = fma(_462, _186, _514);
    float _924 = _878 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _904 * _872;
    float _930 = _914 * _870;
    float _932 = _918 * _868;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _938 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _940 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _878 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _948 = _932 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _950 = _938 * _934;
    float _952 = _940 * _936;
    float _954 = fma(_462, _202, _920);
    float _956 = _948 * _946;
    float _958 = _922 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _960 = _916 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _856 * _926;
    float _966 = _910 * _926;
    bool _968 = _882 != 0.0;
    bool _970 = isnan(_882);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    float _978 = _460 * _176;
    bool _980 = _880 == 0.0;
    bool _982 = !_976;
    bool _984 = _980 && _982;
    float _986 = _916 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _910 * _944;
    float _992 = _856 * _944;
    bool _994 = _884 == 0.0;
    bool _996 = _994 && _984;
    float _998 = fma(_458, _174, _978);
    float _1000 = _910 * _962;
    float _1002 = _856 * _962;
    float _1004 = _944 * _962;
    float _1006 = _926 * _962;
    float _1008 = _1000 * _950;
    float _1010 = _1002 * _950;
    float _1012 = trunc(_760);
    int _1014 = int(_1012);
    float _1016 = _954 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1018 = fma(_988, _990, _964);
    float _1020 = -_966;
    float _1022 = fma(_988, _992, _1020);
    float _1024 = -_992;
    float _1026 = fma(_988, _966, _1024);
    float _1028 = -_950;
    float _1030 = _988 * _1028;
    float _1032 = fma(_1018, _956, _1008);
    float _1034 = fma(_1022, _956, _1010);
    float _1036 = fma(_988, _964, _990);
    float _1038 = fma(_1004, _956, _1030);
    float _1040 = fma(_1026, _952, _1032);
    float _1042 = fma(_462, _178, _998);
    float _1044 = fma(_1036, _952, _1034);
    float _1046 = fma(_1006, _952, _1038);
    float _1048 = _1040 * _436;
    float _1050 = _1040 * _444;
    int _1052 = _1014 << 4;
    int _1054 = _1052 + 1712;
    float _1056 = _1040 * _440;
    float _1058 = fma(_1046, _358, _1048);
    float _1060 = fma(_1046, _382, _1050);
    int _1062 = _1054 + 8;
    uint _1065 = uint(int(uint(_1062) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[int(_1067)][_1069];
    float _1073 = fma(_1046, _378, _1056);
    float _1075 = fma(_1044, _448, _1058);
    float _1077 = fma(_1044, _456, _1060);
    float _1079 = in.m_79.x;
    float _1081 = in.m_79.y;
    float _1083 = in.m_79.z;
    float _1085 = fma(_1044, _452, _1073);
    float _1087 = _958 + _1075;
    float _1089 = _1016 + _1077;
    uint _1091 = uint(int(uint(_1054) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[int(_1101)][_1103];
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1109 = _1087 + _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1113 = _1089 + _1111;
    float _1115 = _1109 * _1109;
    float _1117 = _1113 * _1113;
    float _1119 = _1115 + _1117;
    float _1121 = sqrt(_1119);
    float _1123 = _1081;
    float _1125 = _1079;
    float _1127 = _1083;
    float _1129 = _1115;
    float _1131 = _1117;
    float _1133 = _1087;
    float _1135 = _1089;
    int _1137 = as_type<int>(_1046);
    if (!_996)
    {
        float _1139 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1081);
        _1123 = _1139;
    }
    float _1141 = _1123;
    if (!_996)
    {
        float _1143 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1079);
        _1125 = _1143;
    }
    float _1145 = _1125;
    float _1147 = _1145;
    if (!_996)
    {
        float _1149 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1083);
        _1127 = _1149;
    }
    float _1151 = _1127;
    float _1153 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1155 = -_1141;
    float _1157 = _988 * _1155;
    float _1159 = _1000 * _1141;
    float _1161 = _1002 * _1141;
    float _1163 = fma(_1004, _1145, _1157);
    float _1165 = fma(_1018, _1145, _1159);
    float _1167 = fma(_1022, _1145, _1161);
    bool _1169 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = fma(_1006, _1151, _1163);
    float _1173 = fma(_1026, _1151, _1165);
    float _1175 = fma(_1036, _1151, _1167);
    float _1177 = _1153 + _1085;
    float _1179 = _1121;
    if (!_1169)
    {
        _1147 = _1177;
    }
    float _1181 = _1147;
    bool _1183 = !_1169;
    float _1185 = _1181;
    if (!_1183)
    {
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1191 = _1121 + _1189;
        float _1193 = rsqrt(_1119);
        float _1195 = _1191 * _1187;
        float _1197 = _1177 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = _1195 * 0.15915493667125701904296875;
        float _1201 = _1199 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = _1199 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = fma(_1203, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1211 = _1193 * _1209;
        float _1213 = _1207 + (-1.0);
        float _1215 = fma(_1109, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1217 = fma(_1113, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1219 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1223 = _1215 + _1221;
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1227 = _1217 + _1225;
        float _1229 = fma(_1177, _1207, _1219);
        float _1231 = _1223 * _1223;
        float _1233 = _1227 * _1227;
        _1185 = _1229;
        _1129 = _1231;
        _1131 = _1233;
        _1133 = _1215;
        _1135 = _1217;
    }
    float _1235 = _1185;
    float _1237 = _1129;
    float _1239 = _1131;
    float _1241 = _1133;
    float _1243 = _1135;
    float _1245 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1247 = _1235 + _1245;
    float _1249 = _1173 * _436;
    float _1251 = _1173 * _440;
    float _1253 = _1173 * _444;
    float _1255 = fma(_1247, _1247, _1237);
    float _1257 = fma(_1171, _358, _1249);
    float _1259 = fma(_1171, _378, _1251);
    float _1261 = fma(_1171, _382, _1253);
    float _1263 = _1255 + _1239;
    float _1265 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = _1105 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1271 = fma(_1175, _448, _1257);
    float _1273 = sqrt(_1263);
    float _1275 = fma(_1175, _452, _1259);
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = fma(_1175, _456, _1261);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1279;
    out.m_83.y = _1281;
    out.m_83.z = _1283;
    out.m_83.w = _1277;
    bool _1287 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1289 = isnan(_1273);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1295 = _1291 || _1293;
    out.m_85.x = _1271;
    out.m_85.y = _1275;
    out.m_85.z = _1285;
    float _1297 = _1261;
    if (!_1295)
    {
        _1297 = 1.0;
    }
    float _1299 = _1297;
    bool _1301 = !_1295;
    float _1303 = _1299;
    if (!_1301)
    {
        bool _1305 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1307 = isnan(_1273);
        bool _1309 = _1305 || _1307;
        bool _1311 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1313 = _1309 || _1311;
        if (!_1313)
        {
            float _1315 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1317 = _1273 + _1315;
            float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1321 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1319;
            float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1325 = _1323 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1327 = 1.0 / _1321;
            float _1329 = _1317 * _1327;
            float _1331 = fma(_1329, _1325, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1303 = _1331;
            _1333 = true;
        }
        else
        {
            bool _1335 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1337 = isnan(_1273);
            bool _1339 = _1335 || _1337;
            bool _1341 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1343 = _1339 || _1341;
            if (!_1343)
            {
                float _1345 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1347 = _1273 + _1345;
                float _1349 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1351 = _1349 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1353 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1355 = _1353 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1357 = 1.0 / _1351;
                float _1359 = _1347 * _1357;
                float _1361 = fma(_1359, _1355, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1303 = _1361;
                _1333 = true;
            }
            else
            {
                _1303 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1333 = false;
    float _1363 = _1303;
    float _1365 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1367 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1369 = floor(_1365);
    float _1371 = floor(_1367);
    float _1373 = -_1369;
    float _1375 = _1365 + _1373;
    float _1377 = -_1371;
    float _1379 = _1367 + _1377;
    float2 _4802 = float2(_1375, _1379);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4802, float2(0.0), isnan(_4802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4802, float2(0.0), isnan(_4802)), level(0.0)).x;
    float _1383 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1387 = _1241 + _1385;
    float _1389 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1383);
    float _1391 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1393 = _1235 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1397 = _1243 + _1395;
    float _1399 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1401 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1403 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    float _1413 = fma(_1387, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1415 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1401);
    float _1419 = fma(_1393, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1421 = fma(_1397, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1423 = 1.0 / _1415;
    float _1425 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1427 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1429 = _1393;
    float _1431 = _1363;
    int _1433 = 2;
    if (_1411)
    {
        _1429 = _1413;
    }
    float _1435 = _1429;
    float _1437 = _1427 + _1415;
    float _1439 = _1435;
    if (_1411)
    {
        _1431 = _1419;
    }
    float _1441 = _1431;
    float _1443 = _1437 * _1423;
    float _1445 = _1443 * 0.5;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1449 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1447);
    float _1451 = 1.0 / _1449;
    float _1453 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1455 = _1153 + _1453;
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1459 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1457);
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1463 = _1451 * _1461;
    float _1465 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1459);
    float _1467 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1469 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1471 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1473 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1475 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1467);
    bool _1477 = !_1469;
    int _1479 = _1477 ? 0 : 1;
    float _1481 = trunc(_1471);
    int _1483 = int(_1481);
    float _1485 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1475);
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1489 = _1441;
    if (!_1469)
    {
        _1433 = 1;
    }
    int _1491 = _1433;
    int _1493 = _1491;
    if (!_1473)
    {
        _1493 = _1479;
    }
    int _1495 = _1493;
    float _1497 = trunc(_1487);
    int _1499 = int(_1497);
    int _1501 = _1495 << 6;
    int _1503 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1505 = _1483 + _1503;
    int _1507 = _1505 + 1;
    int _1509 = _1501 + 48;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    uint _1513 = uint(int(uint(int(_1511)) >> uint(2)));
    int _1515 = int(_1511) & 3;
    float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
    int _1519 = int(_1511) + 1;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    int _1523 = _1519 & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    bool _1527 = _1507 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1529 = _1501 + 56;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1549 = _1499 + _1547;
    int _1551 = _1549 + 1;
    int _1553 = _1507 | _1551;
    int _1555 = _1501 + 64;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    bool _1573 = _1553 < 0;
    bool _1575 = _1573 || _1527;
    float _1577 = as_type<float>(_1553);
    int _1579 = _1507;
    if (_1411)
    {
        _1577 = _1421;
    }
    float _1581 = _1577;
    bool _1583 = _1551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1585 = _1583 || _1575;
    int _1587 = _1501 + 72;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    uint _1591 = uint(int(uint(int(_1589)) >> uint(2)));
    int _1593 = int(_1589) & 3;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[int(_1591)][_1593];
    int _1597 = int(_1589) + 1;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    int _1601 = _1597 & 3;
    float _1603 = (*spvDescriptorSet0.vp_c15)._m0[int(_1599)][_1601];
    int _1605 = _1501 + 96;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = _1501 + 104;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    float _1641 = _1581;
    if (!_1411)
    {
        float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1645 = _1153 + _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1649 = _958 + _1647;
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = _1645 * _1645;
        float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1657 = _1016 + _1655;
        float _1659 = fma(_1649, _1649, _1653);
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = fma(_1657, _1657, _1659);
        float _1665 = sqrt(_1663);
        float _1667 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1669 = -_1016;
        float _1671 = _1669 + _1421;
        float _1673 = precise::min(_1665, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1675 = _1673 * _1661;
        float _1677 = -_1153;
        float _1679 = _1677 + _1419;
        float _1681 = _1667 * _1675;
        float _1683 = -_958;
        float _1685 = _1683 + _1413;
        float _1687 = fma(_1679, _1681, _1153);
        float _1689 = fma(_1685, _1681, _958);
        float _1691 = fma(_1671, _1681, _1016);
        _1489 = _1687;
        _1439 = _1689;
        _1641 = _1691;
        _1137 = as_type<int>(_1661);
    }
    float _1693 = _1489;
    float _1695 = _1439;
    float _1697 = _1641;
    int _1699 = _1137;
    float _1701 = _1455 * _1621;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1705 = _1699;
    if (!_1585)
    {
        int _1707 = _1551 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1709 = _1707 + _1507;
        _1579 = _1709;
    }
    int _1711 = _1579;
    float _1713 = _1455 * _1571;
    float _1715 = fma(_958, _1613, _1701);
    float _1717 = _1455 * _1525;
    float _1719 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1703);
    int _1721 = as_type<int>(_1719);
    if (!_1585)
    {
        int _1723 = _1711 << 2;
        _1705 = _1723;
    }
    int _1725 = _1705;
    float _1727 = fma(_1016, _1631, _1715);
    float _1729 = fma(_958, _1517, _1717);
    float _1731 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = fma(_958, _1563, _1713);
    float _1735 = _1727 + _1639;
    int _1737 = _1725;
    if (!_1585)
    {
        uint _1739 = uint(int(uint(_1711) >> uint(2)));
        _1721 = int(_1739);
    }
    int _1741 = _1721;
    int _1743 = _1501 + 80;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
    int _1749 = int(_1745) & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    int _1753 = int(_1745) + 1;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    int _1757 = _1753 & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    if (!_1585)
    {
        int _1761 = 12 & _1725;
        _1737 = _1761;
    }
    int _1763 = _1737;
    float _1765 = 1.0 / _1735;
    float _1767 = fma(_1016, _1537, _1729);
    float _1769 = fma(_1016, _1595, _1733);
    int _1771 = _1763;
    if (!_1585)
    {
        int _1773 = _1741 << 4;
        int _1775 = _1773 + _1763;
        _1771 = _1775;
    }
    int _1777 = _1771;
    float _1779 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1781 = _1767 + _1545;
    float _1783 = _1769 + _1603;
    int _1785 = _1501 + 88;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    float _1803 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1779);
    float _1805 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1807 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1803);
    float _1813 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1815 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1807);
    float _1817 = _1113;
    if (!_1585)
    {
        float _1819 = floor(_1487);
        _1817 = _1819;
    }
    float _1821 = _1817;
    float _1823 = _1781 * _1765;
    float _1825 = -_1813;
    float _1827 = fma(_1825, _1809, 1.0);
    float _1829 = _1781;
    float _1831 = _1765;
    if (!_1585)
    {
        int _1833 = _1777 + 400;
        uint _1835 = uint(int(uint(_1833) >> uint(2)));
        uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
        int _1839 = int(_1835) & 3;
        float _1841 = (*spvDescriptorSet0.vp_c15)._m0[int(_1837)][_1839];
        _1829 = _1841;
    }
    float _1843 = _1829;
    float _1845 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1847 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1815);
    bool _1849 = _1823 >= 0.0;
    float _1851 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1853 = _1783 * _1765;
    float _1855 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1845);
    bool _1857 = _1823 <= 1.0;
    bool _1859 = _1857 && _1849;
    float _1861 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1863 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1865 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    bool _1867 = _1853 >= 0.0;
    bool _1869 = _1867 && _1859;
    float _1871 = log2(_1827);
    float _1873 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1863);
    float _1875 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1877 = _1853 <= 1.0;
    bool _1879 = _1877 && _1869;
    float _1881 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1883 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1873);
    float _1885 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1887 = _1821;
    if (!_1585)
    {
        float _1889 = -_1821;
        float _1891 = _1487 + _1889;
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = _1783;
    if (!_1585)
    {
        float _1897 = floor(_1471);
        _1895 = _1897;
    }
    float _1899 = _1895;
    float _1901 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1883);
    float _1903 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1885);
    float _1905 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1881);
    float _1907 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1905);
    float _1909 = 1.0 / _1901;
    float _1911 = _1455 * _1759;
    float _1913 = _1759;
    float _1915 = _1907;
    if (_1879)
    {
        float _1917 = float(_1495);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1907);
    float _1923 = _1871 * 0.693147182464599609375;
    float _1925 = fma(_958, _1751, _1911);
    float _1927 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1903);
    float _1929 = _1911;
    if (_1879)
    {
        float _1931 = rint(_1919);
        float _1933 = precise::max(_1931, 0.0);
        uint _1935 = uint(_1933);
        uint _1937 = clamp(_1935, 0u, 65535u);
        _1929 = as_type<float>(_1937);
    }
    float _1939 = _1929;
    float _1941 = fma(_1016, _1793, _1925);
    float _1943 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1927);
    float _1945 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1947 = _1899;
    float _1949 = _1843;
    if (!_1585)
    {
        float _1951 = -_1899;
        float _1953 = _1471 + _1951;
        _1947 = _1953;
    }
    float _1955 = _1947;
    float _1957 = _1941 + _1801;
    float _1959 = _1943 * _1909;
    float _1961 = _1921 * _1909;
    float _1963 = _1957 * _1765;
    float _1965 = _1925;
    float _1967 = _1963;
    if (!_1585)
    {
        float _1969 = rint(_1843);
        float _1971 = precise::max(_1969, 0.0);
        uint _1973 = uint(_1971);
        uint _1975 = clamp(_1973, 0u, 65535u);
        _1965 = as_type<float>(_1975);
    }
    float _1977 = _1965;
    float _1979 = fma(_1959, 0.5, 0.5);
    float _1981 = fma(_1961, -0.5, 0.5);
    float _1983 = _1939;
    if (_1879)
    {
        float3 _5828 = float3(_1823, _1853, float(as_type<int>(_1939)));
        float3 _5832 = select(_5828, float3(0.0), isnan(_5828));
        float _1985 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5832.xy, uint(rint(_5832.z)), _1963, level(0.0));
        _1983 = _1985;
    }
    float _1987 = _1983;
    float3 _5842 = float3(_1979, _1981, _1945);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5842, float3(0.0), isnan(_5842)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5842, float3(0.0), isnan(_5842)), level(0.0)).x;
    float3 _5851 = float3(_1979, _1981, _1945);
    float4 _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5851, float3(0.0), isnan(_5851)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5851, float3(0.0), isnan(_5851)), level(0.0)).xyzw;
    float _1994 = _1992.x;
    float _1996 = _1992.y;
    float _1998 = _1992.z;
    float _2000 = _1992.w;
    float _2002 = _1955;
    float _2004 = _1977;
    if (!_1585)
    {
        float3 _5875 = float3(_1955, _1893, float(as_type<int>(_1977)));
        float3 _5877 = select(_5875, float3(0.0), isnan(_5875));
        float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5877.xy, uint(rint(_5877.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5877.xy, uint(rint(_5877.z)), level(0.0)).x;
        _2002 = _2006;
    }
    float _2008 = _2002;
    if (_1585)
    {
        _1831 = 1.0;
    }
    float _2010 = _1831;
    float _2012 = _2010;
    if (!_1585)
    {
        int _2014 = _1711 << 4;
        int _2016 = _2014 + 2048;
        uint _2018 = uint(int(uint(_2016) >> uint(2)));
        uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
        int _2022 = int(_2018) & 3;
        float _2024 = (*spvDescriptorSet0.vp_c15)._m0[int(_2020)][_2022];
        int _2026 = int(_2018) + 1;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        int _2030 = _2026 & 3;
        float _2032 = (*spvDescriptorSet0.vp_c15)._m0[int(_2028)][_2030];
        int _2034 = _2016 + 8;
        uint _2036 = uint(int(uint(_2034) >> uint(2)));
        uint _2038 = uint(int(uint(int(_2036)) >> uint(2)));
        int _2040 = int(_2036) & 3;
        float _2042 = (*spvDescriptorSet0.vp_c15)._m0[int(_2038)][_2040];
        int _2044 = int(_2036) + 1;
        uint _2046 = uint(int(uint(_2044) >> uint(2)));
        int _2048 = _2044 & 3;
        float _2050 = (*spvDescriptorSet0.vp_c15)._m0[int(_2046)][_2048];
        float _2052 = _1455 * _2032;
        float _2054 = fma(_958, _2024, _2052);
        float _2056 = fma(_1016, _2042, _2054);
        float _2058 = _2056 + _2050;
        float _2060 = precise::clamp(_2058, 0.0, 1.0);
        float _2062 = -_2060;
        float _2064 = _2062 + _2008;
        float _2066 = fma(_2064, 500.0, 1.5);
        float _2068 = exp2(_2066);
        float _2070 = 0.0 + _2068;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        _1949 = _2032;
        _2012 = _2072;
    }
    float _2074 = _1949;
    float _2076 = _2012;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2080 = _1693 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2084 = _1695 + _2082;
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2088 = _1697 + _2086;
    float _2090 = _2080 * _2080;
    float _2092 = fma(_2084, _2084, _2090);
    float _2094 = fma(_2088, _2088, _2092);
    float _2096 = rsqrt(_2094);
    float _2098 = sqrt(_2094);
    float _2100 = _2084 * _2096;
    float _2102 = _2088 * _2096;
    float _2104 = _2080 * _2096;
    float _2106 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2108 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2110 = _2106 * _2106;
    float _2112 = _2108 * _2108;
    float _2114 = _2110 + _2112;
    float _2116 = sqrt(_2114);
    bool _2118 = _2116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2122 = _2116 + _2120;
    float _2124 = _2074;
    float _2126 = _2122;
    if (_2118)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2128;
    }
    float _2130 = _2124;
    if (_2118)
    {
        float _2132 = rsqrt(_2114);
        _1915 = _2132;
    }
    float _2134 = _1915;
    float _2136 = _2134;
    if (_2118)
    {
        float _2138 = _2122 * _2130;
        _2126 = _2138;
    }
    float _2140 = _2126;
    if (_2118)
    {
        float _2142 = _2140 * 0.15915493667125701904296875;
        _2004 = _2142;
    }
    float _2144 = _2004;
    float _2146 = _2130;
    float _2148 = _2144;
    if (_2118)
    {
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        _2146 = _2152;
    }
    float _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2158 = precise::max(0.0, _2156);
    float _2160 = _958;
    float _2162 = _2156;
    if (_2118)
    {
        float _2164 = _2144 * 6.283185482025146484375;
        float _2166 = cos(_2164);
        _2160 = _2166;
    }
    float _2168 = _2160;
    float _2170 = -_2104;
    float _2172 = -_2158;
    float _2174 = fma(_2170, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2172);
    float _2176 = _2174;
    if (_2118)
    {
        float _2178 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2162 = _2178;
    }
    float _2180 = _2162;
    float _2182 = _2154;
    float _2184 = _2180;
    if (_2118)
    {
        float _2186 = fma(_2154, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    float _2192 = _2168;
    if (_2118)
    {
        float _2194 = _2168 + (-1.0);
        _2184 = _2194;
    }
    float _2196 = _2184;
    float _2198 = _2196;
    if (_2118)
    {
        float _2200 = _2134 * _2188;
        _1179 = _2200;
    }
    float _2202 = _1179;
    if (!_2118)
    {
        _2190 = _2106;
    }
    float _2204 = _2190;
    float _2206 = _2204;
    if (_2118)
    {
        float _2208 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2148 = _2208;
    }
    float _2210 = _2148;
    if (_2118)
    {
        float _2212 = _2106 * _2202;
        _2206 = _2212;
    }
    float _2214 = _2206;
    if (!_2118)
    {
        _2198 = _2108;
    }
    float _2216 = _2198;
    float _2218 = _2216;
    if (_2118)
    {
        float _2220 = _2108 * _2202;
        _2218 = _2220;
    }
    float _2222 = _2218;
    if (!_2118)
    {
        _2136 = _2110;
    }
    float _2224 = _2136;
    float _2226 = _2224;
    if (_2118)
    {
        float _2228 = fma(_2174, _2168, _2210);
        _2176 = _2228;
    }
    float _2230 = _2176;
    if (_2118)
    {
        float _2232 = _2214 * _2214;
        _2226 = _2232;
    }
    float _2234 = _2226;
    if (!_2118)
    {
        _2192 = _2112;
    }
    float _2236 = _2192;
    float _2238 = _2236;
    if (_2118)
    {
        float _2240 = _2222 * _2222;
        _2238 = _2240;
    }
    float _2242 = _2238;
    float _2244 = fma(_2230, _2230, _2234);
    float _2246 = _2244 + _2242;
    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2250 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2248);
    float _2252 = precise::clamp(_2250, 0.0, 1.0);
    float _2254 = -_2252;
    float _2256 = _2254 + 1.0;
    float _2258 = rsqrt(_2246);
    float _2260 = _2258 * _2214;
    float _2262 = _2258 * _2230;
    float _2264 = _2258 * _2222;
    float _2266 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2268 = abs(_2256);
    float _2270 = log2(_2268);
    float _2272 = -_2266;
    float _2274 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = -_2264;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2280 = fma(_2278, -0.5, 0.5);
    float _2282 = fma(_2278, 0.5, 0.5);
    float _2284 = fma(_2282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2288 = sqrt(_2280);
    float _2290 = fma(_2282, _2284, -0.212114393711090087890625);
    float _2292 = _2262 + 1.0;
    float _2294 = fma(_2282, _2290, 1.570728778839111328125);
    float _2296 = exp2(_2286);
    float _2298 = _2288 * 0.636619746685028076171875;
    float _2300 = -_2262;
    float _2302 = fma(_2296, _2292, _2300);
    float _2304 = -_2294;
    float _2306 = fma(_2298, _2304, 1.0);
    float _2308 = fma(_2302, 0.5, 0.5);
    float2 _6351 = float2(_2306, _2308);
    float3 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6351, float2(0.0), isnan(_6351)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6351, float2(0.0), isnan(_6351)), level(0.0)).xyz;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = abs(_1463);
    float _2322 = log2(_2320);
    float _2324 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2326 = -_1381;
    float _2328 = _2326 + 1.0;
    out.m_87.x = _1695;
    out.m_87.y = _1693;
    out.m_87.z = _1697;
    float _2330 = exp2(_2324);
    bool _2332 = _1463 <= 8000.0;
    bool _2334 = isnan(_1463);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(8000.0);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2346 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2348 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2346);
    float _2350 = exp2(_2344);
    float _2352 = -_2330;
    float _2354 = _2352 + 1.0;
    float _2356 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2358 = _2356 * _1989;
    float _2360 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2362 = precise::clamp(_2360, 0.0, 1.0);
    float _2364 = fma(_2362, -2.0, 3.0);
    float _2366 = _2362 * _2362;
    float _2368 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2348);
    float _2370 = _2366 * _2364;
    float _2372 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2368);
    float _2374 = -_2370;
    float _2376 = _2374 + 1.0;
    out.gl_Position.x = _1943;
    out.gl_Position.y = _1921;
    out.gl_Position.z = _2372;
    out.gl_Position.w = _1901;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2380 = _2372 + _1901;
    float _2382 = _2342 * _2378;
    float _2384 = _2342;
    float _2386 = _2372;
    if (!_1879)
    {
        _2384 = 1.0;
    }
    float _2388 = _2384;
    float _2390 = _2380 * 0.5;
    float _2392 = _2388;
    if (_1879)
    {
        bool _2394 = _1987 >= _1963;
        bool _2396 = isnan(_1987);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1963);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2410 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2412 = isnan(_2098);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2418 = _2414 || _2416;
    out.m_89.z = _2390;
    out.m_89.w = _1901;
    float _2420 = _2328 * _2408;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = _2406 * _2076;
    float _2426 = -_2356;
    float _2428 = _2426 + 1.0;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2434 = _2000 * _2428;
    float _2436 = -_2424;
    float _2438 = fma(_2436, _2432, 1.0);
    float _2440 = precise::clamp(_2438, 0.0, 1.0);
    float _2442 = _2000 * _2358;
    float _2444 = _2428;
    float _2446 = _2424;
    float _2448 = _2440;
    float _2450 = _2422;
    if (!_2418)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _2386;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2418)
    {
        _1967 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _1967;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2418)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _2444;
    out.m_91.x = _2454;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2418)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2472 = _2446;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2418)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2478 = _2448;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2418)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2484 = _2450;
    float _2486 = _2318 * _2358;
    float _2488 = fma(_2314, _2442, _1994);
    float _2490 = fma(_2316, _2442, _1996);
    float _2492 = fma(_2000, _2486, _1998);
    out.m_93.x = _2488;
    out.m_93.y = _2490;
    out.m_93.z = _2492;
    out.m_93.w = _2434;
    bool _2494 = !_2418;
    float _2496 = _2484;
    float _2498 = _2484;
    if (!_2494)
    {
        bool _2500 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2502 = isnan(_2098);
        bool _2504 = _2500 || _2502;
        bool _2506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2508 = _2504 || _2506;
        if (!_2508)
        {
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = _2098 + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2516 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2514;
            float _2518 = 1.0 / _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2540 = _2512 * _2518;
            float _2542 = precise::clamp(_2540, 0.0, 1.0);
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2548 = fma(_2542, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2550 = fma(_2542, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2552 = fma(_2542, _2526, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2554 = fma(_2542, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2556 = fma(_2542, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2558 = fma(_2542, _2538, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2550;
            _2482 = _2556;
            _2458 = _2548;
            _2476 = _2554;
            _2470 = _2552;
            _2498 = _2558;
            _2560 = true;
        }
        else
        {
            bool _2562 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2564 = isnan(_2098);
            bool _2566 = _2562 || _2564;
            bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2570 = _2566 || _2568;
            if (!_2570)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2572 = _2456;
            _2458 = _2572;
            if (!_2570)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2574 = _2462;
            _2464 = _2574;
            if (!_2570)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2576 = _2468;
            _2470 = _2576;
            if (!_2570)
            {
                _2474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2578 = _2474;
            _2476 = _2578;
            if (!_2570)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2580 = _2480;
            _2482 = _2580;
            if (!_2570)
            {
                _2496 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2582 = _2496;
            bool _2584 = !_2570;
            _2498 = _2582;
            if (!_2584)
            {
                bool _2586 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2588 = isnan(_2098);
                bool _2590 = _2586 || _2588;
                bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2594 = _2590 || _2592;
                if (!_2594)
                {
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = _2098 + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2602 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2600;
                    float _2604 = 1.0 / _2602;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2626 = _2598 * _2604;
                    float _2628 = precise::clamp(_2626, 0.0, 1.0);
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2634 = fma(_2628, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2636 = fma(_2628, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2638 = fma(_2628, _2612, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2640 = fma(_2628, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2642 = fma(_2628, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2644 = fma(_2628, _2624, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2636;
                    _2482 = _2642;
                    _2458 = _2634;
                    _2476 = _2640;
                    _2470 = _2638;
                    _2498 = _2644;
                    _2560 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2498 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2560 = false;
    float _2646 = _2464;
    float _2648 = _2482;
    float _2650 = _2458;
    float _2652 = _2476;
    float _2654 = _2470;
    float _2656 = _2498;
    float _2658 = fma(_1275, -0.5, 0.5);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    float _2670 = -_2654;
    float _2672 = _2670 + _2656;
    bool _2674 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2676 = fma(_2660, _2664, _2646);
    float _2678 = fma(_2660, _2668, _2650);
    float _2680 = fma(_2660, _2672, _2654);
    float _2682 = _2676 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2684 = fma(_2678, 0.298911988735198974609375, _2682);
    float _2686 = fma(_2680, 0.114477999508380889892578125, _2684);
    out.m_97.x = 0.0;
    float _2688 = -_2686;
    float _2690 = _2678 + _2688;
    float _2692 = -_2686;
    float _2694 = _2676 + _2692;
    float _2696 = -_2686;
    float _2698 = _2680 + _2696;
    float _2700 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2702 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    float _2704 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    float _2706 = fma(_2698, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    out.m_61.x = _2700;
    out.m_99.x = _2702;
    out.m_99.y = _2704;
    out.m_99.z = _2706;
    if (!_2674)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2708 = -_1693;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2712 = -_1695;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2716 = -_1697;
    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2720 = _2710 * _2710;
    float _2722 = fma(_2714, _2714, _2720);
    float _2724 = fma(_2718, _2718, _2722);
    float _2726 = rsqrt(_2724);
    float _2728 = _2710 * _2726;
    float _2730 = _2714 * _2726;
    float _2732 = _2718 * _2726;
    float _2734 = sqrt(_2724);
    float _2736 = -_2104;
    float _2738 = _2736 + _2728;
    float _2740 = -_2100;
    float _2742 = _2740 + _2730;
    float _2744 = -_2102;
    float _2746 = _2744 + _2732;
    float _2748 = _2738 * _2738;
    float _2750 = fma(_2742, _2742, _2748);
    float _2752 = fma(_2746, _2746, _2750);
    float _2754 = -_2734;
    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2758 = rsqrt(_2752);
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = abs(_2762);
    float _2766 = log2(_2764);
    float _2768 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2770 = _2738 * _2758;
    float _2772 = _2742 * _2758;
    float _2774 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2776 = precise::clamp(_2774, 0.0, 1.0);
    float _2778 = _2746 * _2758;
    float _2780 = _1275 * _2770;
    float _2782 = _1275 * _2728;
    float _2784 = _2776 * _2776;
    float _2786 = fma(_1271, _2772, _2780);
    float _2788 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2790 = _2784 + (-1.0);
    float _2792 = fma(_1271, _2730, _2782);
    float _2794 = fma(_1285, _2778, _2786);
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = exp2(_2788);
    float _2800 = _2796 * _2796;
    float _2802 = fma(_1285, _2732, _2792);
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = fma(_2800, _2790, 1.0);
    float _2808 = -_2728;
    float _2810 = -_2768;
    float _2812 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2810);
    float _2814 = _2806 * _2806;
    float _2816 = -_2732;
    float _2818 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2812);
    float _2820 = 1.0 / _2814;
    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2824 = _2818 + _2822;
    float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = _2798 * _2828;
    float _2832 = _2804 * _2830;
    float _2834 = _2784 * _2820;
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2838 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2842 = _2832 * _2834;
    float _2844 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2846 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2848 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2836;
    out.m_95.y = _2838;
    out.m_95.z = _2840;
    out.m_97.x = _2844;
    out.m_97.y = _2846;
    out.m_97.z = _2848;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2560 = false;
    bool _1333 = false;
    bool _484 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2905 = as_type<float>(_134);
        out.gl_Position.z = _2905;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_61.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2975 = as_type<float>(_172);
        out.gl_Position.z = _2975;
    }
    if (_164)
    {
        return out;
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    bool _188 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _190 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    float _210 = _174 * _174;
    float _212 = _176 * _176;
    float _214 = _178 * _178;
    float _216 = fma(_182, _182, _210);
    float _218 = fma(_184, _184, _212);
    float _220 = fma(_186, _186, _214);
    float _222 = fma(_198, _198, _216);
    float _224 = fma(_200, _200, _218);
    float _226 = fma(_202, _202, _220);
    float _228 = sqrt(_222);
    float _230 = sqrt(_224);
    bool _232 = _228 > 0.0;
    float _234 = sqrt(_226);
    bool _236 = _230 > 0.0;
    float _238 = _230;
    float _240 = _222;
    float _242 = _180;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_196)
    {
        float _246 = _180 * _180;
        float _248 = _246 * 0.5;
        _238 = _248;
    }
    float _250 = _238;
    float _252 = 0.0;
    float _254 = _250;
    if (_232)
    {
        float _256 = rsqrt(_222);
        _252 = _256;
    }
    float _258 = _252;
    if (!_196)
    {
        float _260 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _260;
    }
    float _262 = _254;
    bool _264 = _234 > 0.0;
    float _266 = 0.0;
    float _268 = _262;
    if (_236)
    {
        float _270 = rsqrt(_224);
        _266 = _270;
    }
    float _272 = _266;
    bool _274 = !_196;
    float _276 = 0.0;
    float _278 = _258;
    if (!_274)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _180 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _180);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _308;
        _276 = _298;
        _240 = _294;
    }
    float _310 = _268;
    float _312 = _276;
    float _314 = _240;
    bool _316 = !_196;
    float _318 = _314;
    float _320 = _312;
    float _322 = _310;
    if (!_316)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _180 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _242 = _342;
        _244 = _330;
    }
    float _344 = _242;
    float _346 = _244;
    float _348 = in.m_71.w;
    float _350 = _346;
    if (!_232)
    {
        _318 = 0.0;
    }
    float _352 = _318;
    float _354 = _352;
    if (_232)
    {
        float _356 = _258 * _182;
        _354 = _356;
    }
    float _358 = _354;
    if (!_232)
    {
        _350 = 0.0;
    }
    float _360 = _350;
    float _362 = in.m_58.x;
    float _364 = in.m_58.y;
    float _366 = in.m_58.z;
    float _368 = 0.0;
    float _370 = _360;
    if (!_232)
    {
        _368 = 0.0;
    }
    float _372 = _368;
    float _374 = _372;
    if (_232)
    {
        float _376 = _258 * _174;
        _370 = _376;
    }
    float _378 = _370;
    if (_232)
    {
        float _380 = _258 * _198;
        _374 = _380;
    }
    float _382 = _374;
    float _384 = 0.0;
    if (_264)
    {
        float _386 = rsqrt(_226);
        _384 = _386;
    }
    float _388 = _384;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _392 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _394 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _396 = _392;
    if (!_236)
    {
        _278 = 0.0;
        _320 = 0.0;
    }
    float _398 = _278;
    float _400 = _320;
    float _402 = 0.0;
    float _404 = _400;
    float _406 = _398;
    if (!_236)
    {
        _402 = 0.0;
    }
    float _408 = _402;
    float _410 = fma(_344, _204, _392);
    float _412 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _414 = fma(_344, _206, _394);
    float _416 = 0.0;
    float _418 = _408;
    if (!_264)
    {
        _416 = 0.0;
        _396 = 0.0;
    }
    float _420 = _416;
    float _422 = _396;
    float _424 = _420;
    float _426 = _422;
    if (!_264)
    {
        _322 = 0.0;
    }
    float _428 = _322;
    float _430 = fma(_344, _208, _412);
    float _432 = _428;
    if (_236)
    {
        float _434 = _272 * _184;
        _418 = _434;
    }
    float _436 = _418;
    if (_236)
    {
        float _438 = _272 * _176;
        _404 = _438;
    }
    float _440 = _404;
    if (_236)
    {
        float _442 = _272 * _200;
        _406 = _442;
    }
    float _444 = _406;
    if (_264)
    {
        float _446 = _388 * _186;
        _424 = _446;
    }
    float _448 = _424;
    if (_264)
    {
        float _450 = _388 * _178;
        _426 = _450;
    }
    float _452 = _426;
    if (_264)
    {
        float _454 = _388 * _202;
        _432 = _454;
    }
    float _456 = _432;
    float _458 = fma(_410, _348, _362);
    float _460 = fma(_414, _348, _364);
    float _462 = fma(_430, _348, _366);
    bool _464 = !_390;
    float _482;
    if (!_464)
    {
        float _466 = in.m_73.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        float _486 = float(_118);
        float _488 = 1.0 / _486;
        float _490 = _152 * _488;
        _482 = _490;
    }
    _484 = false;
    float _492 = _482;
    float _494 = in.m_73.z;
    float _496 = _460 * _184;
    float _498 = in.m_73.x;
    float _500 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _502 = log2(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = in.m_73.y;
    float _514 = fma(_458, _182, _496);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _518 = _492 + _516;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _534 = _492 + _532;
    float _536 = 1.0 / _506;
    float _538 = 1.0 / _510;
    float _540 = _502 * _152;
    float _542 = _494 * 2.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = _498 * 2.0;
    float _550 = _498 + _494;
    float _552 = floor(_542);
    float _554 = _518 * _536;
    float _556 = _512 * 2.0;
    float _558 = _550 + (-1.0);
    float _560 = _512 + _494;
    float _562 = _534 * _538;
    float _564 = floor(_548);
    float _566 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _568 = !_522;
    int _570 = _568 ? 0 : 1;
    float _572 = _560 + (-1.0);
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _576 = _552 > 0.0;
    float _578 = floor(_556);
    bool _580 = _552 >= 0.0;
    bool _582 = isnan(_552);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _498 + _512;
    int _592 = _588 ? 0 : 1;
    float _594 = _590 + (-1.0);
    bool _596 = _564 > 0.0;
    int _598 = ~_592;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _606 = _564 >= 0.0;
    bool _608 = isnan(_564);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _616;
    int _620 = _602;
    if (!_576)
    {
        int _622 = ~_592;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _628;
    int _632 = abs(_570);
    bool _634 = _578 > 0.0;
    float _636 = fma(_630, _554, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _638 = _578 >= 0.0;
    bool _640 = isnan(_578);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_618, _554, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _650 = exp2(_540);
    float _652 = float(_632);
    float _654 = fma(_546, _554, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _656 = float(_626);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _666 = _614 ? 0 : 1;
    float _668 = _652 * _656;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _674 = in.m_75.x;
    float _676 = in.m_75.y;
    float _678 = in.m_75.z;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _682 = 1.0 + _680;
    int _684 = ~_666;
    int _686 = _684 + 1;
    int _688 = _686 + 1;
    float _690 = _668 * (-2.0);
    int _692 = _688;
    if (!_596)
    {
        int _694 = ~_666;
        int _696 = _694 + 1;
        _692 = _696;
    }
    int _698 = _692;
    float _700 = 1.0 / _682;
    bool _702 = !_526;
    int _704 = _702 ? 0 : 1;
    bool _706 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _708 = isnan(1.0);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _714 = _710 || _712;
    int _716 = abs(_704);
    float _718 = -_650;
    float _720 = _718 + 1.0;
    float _722 = fma(_660, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _724 = fma(_672, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = fma(_664, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _738 = float(_716);
    float _740 = float(_698);
    float _742 = _734 ? _720 : 0.0;
    int _744 = _646 ? 0 : 1;
    float _746 = _738 * _740;
    float _748 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_714)
    {
        float _750 = _742 * _700;
        _154 = _750;
    }
    float _752 = _154;
    float _754 = fma(_604, _690, _604);
    float _756 = _746 * (-2.0);
    float _758 = fma(_690, _674, _674);
    float _760 = _748 * _498;
    float _762 = _498 + (-0.5);
    bool _764 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _766 = isnan(_492);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_574, _756, _574);
    bool _778 = !_530;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_756, _676, _676);
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _758);
    bool _786 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _788 = isnan(_492);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_774;
    float _800 = _798 + 1.0;
    int _802 = ~_744;
    int _804 = _802 + 1;
    int _806 = _804 + 1;
    float _808 = fma(_754, _752, _784);
    int _810 = _806;
    if (!_634)
    {
        int _812 = ~_744;
        int _814 = _812 + 1;
        _810 = _814;
    }
    int _816 = _810;
    float _818 = _796 * _800;
    int _820 = abs(_780);
    float _822 = -_796;
    float _824 = _822 + 1.0;
    bool _826 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _828 = isnan(_492);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = _512 + (-0.5);
    float _840 = float(_820);
    float _842 = _808 * 0.15915493667125701904296875;
    float _844 = float(_816);
    float _846 = _836 * _824;
    float _848 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _782);
    float _850 = -_836;
    float _852 = _850 + 1.0;
    float _854 = _842 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _840 * _844;
    float _860 = _636 * _846;
    float _862 = _648 * _846;
    float _864 = _654 * _846;
    float _866 = fma(_776, _752, _848);
    float _868 = in.m_71.x;
    float _870 = in.m_71.y;
    float _872 = in.m_71.z;
    float _874 = _858 * (-2.0);
    float _876 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _864);
    float _878 = _866 * 0.15915493667125701904296875;
    float _880 = in.m_77.x;
    float _882 = in.m_77.y;
    float _884 = in.m_77.z;
    float _886 = fma(_566, _874, _566);
    float _888 = fma(_874, _678, _678);
    float _890 = _494 + (-0.5);
    float _892 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _862);
    float _894 = fma(_736, _818, _876);
    float _896 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _860);
    float _898 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[196].z, _888);
    float _900 = fma(_724, _818, _892);
    float _902 = _460 * _200;
    float _904 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].z, _894);
    float _906 = fma(_886, _752, _898);
    float _908 = _842 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = fma(_722, _818, _896);
    float _914 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].y, _900);
    float _916 = _906 * 0.15915493667125701904296875;
    float _918 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].x, _912);
    float _920 = fma(_458, _198, _902);
    float _922 = fma(_462, _186, _514);
    float _924 = _878 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _904 * _872;
    float _930 = _914 * _870;
    float _932 = _918 * _868;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _938 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _940 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _878 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _948 = _932 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _950 = _938 * _934;
    float _952 = _940 * _936;
    float _954 = fma(_462, _202, _920);
    float _956 = _948 * _946;
    float _958 = _922 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _960 = _916 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _856 * _926;
    float _966 = _910 * _926;
    bool _968 = _882 != 0.0;
    bool _970 = isnan(_882);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    float _978 = _460 * _176;
    bool _980 = _880 == 0.0;
    bool _982 = !_976;
    bool _984 = _980 && _982;
    float _986 = _916 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _910 * _944;
    float _992 = _856 * _944;
    bool _994 = _884 == 0.0;
    bool _996 = _994 && _984;
    float _998 = fma(_458, _174, _978);
    float _1000 = _910 * _962;
    float _1002 = _856 * _962;
    float _1004 = _944 * _962;
    float _1006 = _926 * _962;
    float _1008 = _1000 * _950;
    float _1010 = _1002 * _950;
    float _1012 = trunc(_760);
    int _1014 = int(_1012);
    float _1016 = _954 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1018 = fma(_988, _990, _964);
    float _1020 = -_966;
    float _1022 = fma(_988, _992, _1020);
    float _1024 = -_992;
    float _1026 = fma(_988, _966, _1024);
    float _1028 = -_950;
    float _1030 = _988 * _1028;
    float _1032 = fma(_1018, _956, _1008);
    float _1034 = fma(_1022, _956, _1010);
    float _1036 = fma(_988, _964, _990);
    float _1038 = fma(_1004, _956, _1030);
    float _1040 = fma(_1026, _952, _1032);
    float _1042 = fma(_462, _178, _998);
    float _1044 = fma(_1036, _952, _1034);
    float _1046 = fma(_1006, _952, _1038);
    float _1048 = _1040 * _436;
    float _1050 = _1040 * _444;
    int _1052 = _1014 << 4;
    int _1054 = _1052 + 1712;
    float _1056 = _1040 * _440;
    float _1058 = fma(_1046, _358, _1048);
    float _1060 = fma(_1046, _382, _1050);
    int _1062 = _1054 + 8;
    uint _1065 = uint(int(uint(_1062) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[int(_1067)][_1069];
    float _1073 = fma(_1046, _378, _1056);
    float _1075 = fma(_1044, _448, _1058);
    float _1077 = fma(_1044, _456, _1060);
    float _1079 = in.m_79.x;
    float _1081 = in.m_79.y;
    float _1083 = in.m_79.z;
    float _1085 = fma(_1044, _452, _1073);
    float _1087 = _958 + _1075;
    float _1089 = _1016 + _1077;
    uint _1091 = uint(int(uint(_1054) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[int(_1101)][_1103];
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1109 = _1087 + _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1113 = _1089 + _1111;
    float _1115 = _1109 * _1109;
    float _1117 = _1113 * _1113;
    float _1119 = _1115 + _1117;
    float _1121 = sqrt(_1119);
    float _1123 = _1081;
    float _1125 = _1079;
    float _1127 = _1083;
    float _1129 = _1115;
    float _1131 = _1117;
    float _1133 = _1087;
    float _1135 = _1089;
    int _1137 = as_type<int>(_1046);
    if (!_996)
    {
        float _1139 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1081);
        _1123 = _1139;
    }
    float _1141 = _1123;
    if (!_996)
    {
        float _1143 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1079);
        _1125 = _1143;
    }
    float _1145 = _1125;
    float _1147 = _1145;
    if (!_996)
    {
        float _1149 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1083);
        _1127 = _1149;
    }
    float _1151 = _1127;
    float _1153 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1155 = -_1141;
    float _1157 = _988 * _1155;
    float _1159 = _1000 * _1141;
    float _1161 = _1002 * _1141;
    float _1163 = fma(_1004, _1145, _1157);
    float _1165 = fma(_1018, _1145, _1159);
    float _1167 = fma(_1022, _1145, _1161);
    bool _1169 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = fma(_1006, _1151, _1163);
    float _1173 = fma(_1026, _1151, _1165);
    float _1175 = fma(_1036, _1151, _1167);
    float _1177 = _1153 + _1085;
    float _1179 = _1121;
    if (!_1169)
    {
        _1147 = _1177;
    }
    float _1181 = _1147;
    bool _1183 = !_1169;
    float _1185 = _1181;
    if (!_1183)
    {
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1191 = _1121 + _1189;
        float _1193 = rsqrt(_1119);
        float _1195 = _1191 * _1187;
        float _1197 = _1177 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = _1195 * 0.15915493667125701904296875;
        float _1201 = _1199 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = _1199 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = fma(_1203, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1211 = _1193 * _1209;
        float _1213 = _1207 + (-1.0);
        float _1215 = fma(_1109, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1217 = fma(_1113, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1219 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1223 = _1215 + _1221;
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1227 = _1217 + _1225;
        float _1229 = fma(_1177, _1207, _1219);
        float _1231 = _1223 * _1223;
        float _1233 = _1227 * _1227;
        _1185 = _1229;
        _1129 = _1231;
        _1131 = _1233;
        _1133 = _1215;
        _1135 = _1217;
    }
    float _1235 = _1185;
    float _1237 = _1129;
    float _1239 = _1131;
    float _1241 = _1133;
    float _1243 = _1135;
    float _1245 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1247 = _1235 + _1245;
    float _1249 = _1173 * _436;
    float _1251 = _1173 * _440;
    float _1253 = _1173 * _444;
    float _1255 = fma(_1247, _1247, _1237);
    float _1257 = fma(_1171, _358, _1249);
    float _1259 = fma(_1171, _378, _1251);
    float _1261 = fma(_1171, _382, _1253);
    float _1263 = _1255 + _1239;
    float _1265 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = _1105 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1271 = fma(_1175, _448, _1257);
    float _1273 = sqrt(_1263);
    float _1275 = fma(_1175, _452, _1259);
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = fma(_1175, _456, _1261);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1279;
    out.m_83.y = _1281;
    out.m_83.z = _1283;
    out.m_83.w = _1277;
    bool _1287 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1289 = isnan(_1273);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1295 = _1291 || _1293;
    out.m_85.x = _1271;
    out.m_85.y = _1275;
    out.m_85.z = _1285;
    float _1297 = _1261;
    if (!_1295)
    {
        _1297 = 1.0;
    }
    float _1299 = _1297;
    bool _1301 = !_1295;
    float _1303 = _1299;
    if (!_1301)
    {
        bool _1305 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1307 = isnan(_1273);
        bool _1309 = _1305 || _1307;
        bool _1311 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1313 = _1309 || _1311;
        if (!_1313)
        {
            float _1315 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1317 = _1273 + _1315;
            float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1321 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1319;
            float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1325 = _1323 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1327 = 1.0 / _1321;
            float _1329 = _1317 * _1327;
            float _1331 = fma(_1329, _1325, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1303 = _1331;
            _1333 = true;
        }
        else
        {
            bool _1335 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1337 = isnan(_1273);
            bool _1339 = _1335 || _1337;
            bool _1341 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1343 = _1339 || _1341;
            if (!_1343)
            {
                float _1345 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1347 = _1273 + _1345;
                float _1349 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1351 = _1349 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1353 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1355 = _1353 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1357 = 1.0 / _1351;
                float _1359 = _1347 * _1357;
                float _1361 = fma(_1359, _1355, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1303 = _1361;
                _1333 = true;
            }
            else
            {
                _1303 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1333 = false;
    float _1363 = _1303;
    float _1365 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1367 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1369 = floor(_1365);
    float _1371 = floor(_1367);
    float _1373 = -_1369;
    float _1375 = _1365 + _1373;
    float _1377 = -_1371;
    float _1379 = _1367 + _1377;
    float2 _4802 = float2(_1375, _1379);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4802, float2(0.0), isnan(_4802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4802, float2(0.0), isnan(_4802)), level(0.0)).x;
    float _1383 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1387 = _1241 + _1385;
    float _1389 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1383);
    float _1391 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1393 = _1235 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1397 = _1243 + _1395;
    float _1399 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1401 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1403 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    float _1413 = fma(_1387, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1415 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1401);
    float _1419 = fma(_1393, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1421 = fma(_1397, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1423 = 1.0 / _1415;
    float _1425 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1427 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1429 = _1393;
    float _1431 = _1363;
    int _1433 = 2;
    if (_1411)
    {
        _1429 = _1413;
    }
    float _1435 = _1429;
    float _1437 = _1427 + _1415;
    float _1439 = _1435;
    if (_1411)
    {
        _1431 = _1419;
    }
    float _1441 = _1431;
    float _1443 = _1437 * _1423;
    float _1445 = _1443 * 0.5;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1449 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1447);
    float _1451 = 1.0 / _1449;
    float _1453 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1455 = _1153 + _1453;
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1459 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1457);
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1463 = _1451 * _1461;
    float _1465 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1459);
    float _1467 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1469 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1471 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1473 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1475 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1467);
    bool _1477 = !_1469;
    int _1479 = _1477 ? 0 : 1;
    float _1481 = trunc(_1471);
    int _1483 = int(_1481);
    float _1485 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1475);
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1489 = _1441;
    if (!_1469)
    {
        _1433 = 1;
    }
    int _1491 = _1433;
    int _1493 = _1491;
    if (!_1473)
    {
        _1493 = _1479;
    }
    int _1495 = _1493;
    float _1497 = trunc(_1487);
    int _1499 = int(_1497);
    int _1501 = _1495 << 6;
    int _1503 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1505 = _1483 + _1503;
    int _1507 = _1505 + 1;
    int _1509 = _1501 + 48;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    uint _1513 = uint(int(uint(int(_1511)) >> uint(2)));
    int _1515 = int(_1511) & 3;
    float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
    int _1519 = int(_1511) + 1;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    int _1523 = _1519 & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    bool _1527 = _1507 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1529 = _1501 + 56;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1549 = _1499 + _1547;
    int _1551 = _1549 + 1;
    int _1553 = _1507 | _1551;
    int _1555 = _1501 + 64;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    bool _1573 = _1553 < 0;
    bool _1575 = _1573 || _1527;
    float _1577 = as_type<float>(_1553);
    int _1579 = _1507;
    if (_1411)
    {
        _1577 = _1421;
    }
    float _1581 = _1577;
    bool _1583 = _1551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1585 = _1583 || _1575;
    int _1587 = _1501 + 72;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    uint _1591 = uint(int(uint(int(_1589)) >> uint(2)));
    int _1593 = int(_1589) & 3;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[int(_1591)][_1593];
    int _1597 = int(_1589) + 1;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    int _1601 = _1597 & 3;
    float _1603 = (*spvDescriptorSet0.vp_c15)._m0[int(_1599)][_1601];
    int _1605 = _1501 + 96;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = _1501 + 104;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    float _1641 = _1581;
    if (!_1411)
    {
        float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1645 = _1153 + _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1649 = _958 + _1647;
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = _1645 * _1645;
        float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1657 = _1016 + _1655;
        float _1659 = fma(_1649, _1649, _1653);
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = fma(_1657, _1657, _1659);
        float _1665 = sqrt(_1663);
        float _1667 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1669 = -_1016;
        float _1671 = _1669 + _1421;
        float _1673 = precise::min(_1665, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1675 = _1673 * _1661;
        float _1677 = -_1153;
        float _1679 = _1677 + _1419;
        float _1681 = _1667 * _1675;
        float _1683 = -_958;
        float _1685 = _1683 + _1413;
        float _1687 = fma(_1679, _1681, _1153);
        float _1689 = fma(_1685, _1681, _958);
        float _1691 = fma(_1671, _1681, _1016);
        _1489 = _1687;
        _1439 = _1689;
        _1641 = _1691;
        _1137 = as_type<int>(_1661);
    }
    float _1693 = _1489;
    float _1695 = _1439;
    float _1697 = _1641;
    int _1699 = _1137;
    float _1701 = _1455 * _1621;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1705 = _1699;
    if (!_1585)
    {
        int _1707 = _1551 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1709 = _1707 + _1507;
        _1579 = _1709;
    }
    int _1711 = _1579;
    float _1713 = _1455 * _1571;
    float _1715 = fma(_958, _1613, _1701);
    float _1717 = _1455 * _1525;
    float _1719 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1703);
    int _1721 = as_type<int>(_1719);
    if (!_1585)
    {
        int _1723 = _1711 << 2;
        _1705 = _1723;
    }
    int _1725 = _1705;
    float _1727 = fma(_1016, _1631, _1715);
    float _1729 = fma(_958, _1517, _1717);
    float _1731 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = fma(_958, _1563, _1713);
    float _1735 = _1727 + _1639;
    int _1737 = _1725;
    if (!_1585)
    {
        uint _1739 = uint(int(uint(_1711) >> uint(2)));
        _1721 = int(_1739);
    }
    int _1741 = _1721;
    int _1743 = _1501 + 80;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
    int _1749 = int(_1745) & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    int _1753 = int(_1745) + 1;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    int _1757 = _1753 & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    if (!_1585)
    {
        int _1761 = 12 & _1725;
        _1737 = _1761;
    }
    int _1763 = _1737;
    float _1765 = 1.0 / _1735;
    float _1767 = fma(_1016, _1537, _1729);
    float _1769 = fma(_1016, _1595, _1733);
    int _1771 = _1763;
    if (!_1585)
    {
        int _1773 = _1741 << 4;
        int _1775 = _1773 + _1763;
        _1771 = _1775;
    }
    int _1777 = _1771;
    float _1779 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1781 = _1767 + _1545;
    float _1783 = _1769 + _1603;
    int _1785 = _1501 + 88;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    float _1803 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1779);
    float _1805 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1807 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1803);
    float _1813 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1815 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1807);
    float _1817 = _1113;
    if (!_1585)
    {
        float _1819 = floor(_1487);
        _1817 = _1819;
    }
    float _1821 = _1817;
    float _1823 = _1781 * _1765;
    float _1825 = -_1813;
    float _1827 = fma(_1825, _1809, 1.0);
    float _1829 = _1781;
    float _1831 = _1765;
    if (!_1585)
    {
        int _1833 = _1777 + 400;
        uint _1835 = uint(int(uint(_1833) >> uint(2)));
        uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
        int _1839 = int(_1835) & 3;
        float _1841 = (*spvDescriptorSet0.vp_c15)._m0[int(_1837)][_1839];
        _1829 = _1841;
    }
    float _1843 = _1829;
    float _1845 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1847 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1815);
    bool _1849 = _1823 >= 0.0;
    float _1851 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1853 = _1783 * _1765;
    float _1855 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1845);
    bool _1857 = _1823 <= 1.0;
    bool _1859 = _1857 && _1849;
    float _1861 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1863 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1865 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    bool _1867 = _1853 >= 0.0;
    bool _1869 = _1867 && _1859;
    float _1871 = log2(_1827);
    float _1873 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1863);
    float _1875 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1877 = _1853 <= 1.0;
    bool _1879 = _1877 && _1869;
    float _1881 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1883 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1873);
    float _1885 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1887 = _1821;
    if (!_1585)
    {
        float _1889 = -_1821;
        float _1891 = _1487 + _1889;
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = _1783;
    if (!_1585)
    {
        float _1897 = floor(_1471);
        _1895 = _1897;
    }
    float _1899 = _1895;
    float _1901 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1883);
    float _1903 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1885);
    float _1905 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1881);
    float _1907 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1905);
    float _1909 = 1.0 / _1901;
    float _1911 = _1455 * _1759;
    float _1913 = _1759;
    float _1915 = _1907;
    if (_1879)
    {
        float _1917 = float(_1495);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1907);
    float _1923 = _1871 * 0.693147182464599609375;
    float _1925 = fma(_958, _1751, _1911);
    float _1927 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1903);
    float _1929 = _1911;
    if (_1879)
    {
        float _1931 = rint(_1919);
        float _1933 = precise::max(_1931, 0.0);
        uint _1935 = uint(_1933);
        uint _1937 = clamp(_1935, 0u, 65535u);
        _1929 = as_type<float>(_1937);
    }
    float _1939 = _1929;
    float _1941 = fma(_1016, _1793, _1925);
    float _1943 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1927);
    float _1945 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1947 = _1899;
    float _1949 = _1843;
    if (!_1585)
    {
        float _1951 = -_1899;
        float _1953 = _1471 + _1951;
        _1947 = _1953;
    }
    float _1955 = _1947;
    float _1957 = _1941 + _1801;
    float _1959 = _1943 * _1909;
    float _1961 = _1921 * _1909;
    float _1963 = _1957 * _1765;
    float _1965 = _1925;
    float _1967 = _1963;
    if (!_1585)
    {
        float _1969 = rint(_1843);
        float _1971 = precise::max(_1969, 0.0);
        uint _1973 = uint(_1971);
        uint _1975 = clamp(_1973, 0u, 65535u);
        _1965 = as_type<float>(_1975);
    }
    float _1977 = _1965;
    float _1979 = fma(_1959, 0.5, 0.5);
    float _1981 = fma(_1961, -0.5, 0.5);
    float _1983 = _1939;
    if (_1879)
    {
        float3 _5828 = float3(_1823, _1853, float(as_type<int>(_1939)));
        float3 _5832 = select(_5828, float3(0.0), isnan(_5828));
        float _1985 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5832.xy, uint(rint(_5832.z)), _1963, level(0.0));
        _1983 = _1985;
    }
    float _1987 = _1983;
    float3 _5842 = float3(_1979, _1981, _1945);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5842, float3(0.0), isnan(_5842)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5842, float3(0.0), isnan(_5842)), level(0.0)).x;
    float3 _5851 = float3(_1979, _1981, _1945);
    float4 _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5851, float3(0.0), isnan(_5851)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5851, float3(0.0), isnan(_5851)), level(0.0)).xyzw;
    float _1994 = _1992.x;
    float _1996 = _1992.y;
    float _1998 = _1992.z;
    float _2000 = _1992.w;
    float _2002 = _1955;
    float _2004 = _1977;
    if (!_1585)
    {
        float3 _5875 = float3(_1955, _1893, float(as_type<int>(_1977)));
        float3 _5877 = select(_5875, float3(0.0), isnan(_5875));
        float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5877.xy, uint(rint(_5877.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5877.xy, uint(rint(_5877.z)), level(0.0)).x;
        _2002 = _2006;
    }
    float _2008 = _2002;
    if (_1585)
    {
        _1831 = 1.0;
    }
    float _2010 = _1831;
    float _2012 = _2010;
    if (!_1585)
    {
        int _2014 = _1711 << 4;
        int _2016 = _2014 + 2048;
        uint _2018 = uint(int(uint(_2016) >> uint(2)));
        uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
        int _2022 = int(_2018) & 3;
        float _2024 = (*spvDescriptorSet0.vp_c15)._m0[int(_2020)][_2022];
        int _2026 = int(_2018) + 1;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        int _2030 = _2026 & 3;
        float _2032 = (*spvDescriptorSet0.vp_c15)._m0[int(_2028)][_2030];
        int _2034 = _2016 + 8;
        uint _2036 = uint(int(uint(_2034) >> uint(2)));
        uint _2038 = uint(int(uint(int(_2036)) >> uint(2)));
        int _2040 = int(_2036) & 3;
        float _2042 = (*spvDescriptorSet0.vp_c15)._m0[int(_2038)][_2040];
        int _2044 = int(_2036) + 1;
        uint _2046 = uint(int(uint(_2044) >> uint(2)));
        int _2048 = _2044 & 3;
        float _2050 = (*spvDescriptorSet0.vp_c15)._m0[int(_2046)][_2048];
        float _2052 = _1455 * _2032;
        float _2054 = fma(_958, _2024, _2052);
        float _2056 = fma(_1016, _2042, _2054);
        float _2058 = _2056 + _2050;
        float _2060 = precise::clamp(_2058, 0.0, 1.0);
        float _2062 = -_2060;
        float _2064 = _2062 + _2008;
        float _2066 = fma(_2064, 500.0, 1.5);
        float _2068 = exp2(_2066);
        float _2070 = 0.0 + _2068;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        _1949 = _2032;
        _2012 = _2072;
    }
    float _2074 = _1949;
    float _2076 = _2012;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2080 = _1693 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2084 = _1695 + _2082;
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2088 = _1697 + _2086;
    float _2090 = _2080 * _2080;
    float _2092 = fma(_2084, _2084, _2090);
    float _2094 = fma(_2088, _2088, _2092);
    float _2096 = rsqrt(_2094);
    float _2098 = sqrt(_2094);
    float _2100 = _2084 * _2096;
    float _2102 = _2088 * _2096;
    float _2104 = _2080 * _2096;
    float _2106 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2108 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2110 = _2106 * _2106;
    float _2112 = _2108 * _2108;
    float _2114 = _2110 + _2112;
    float _2116 = sqrt(_2114);
    bool _2118 = _2116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2122 = _2116 + _2120;
    float _2124 = _2074;
    float _2126 = _2122;
    if (_2118)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2128;
    }
    float _2130 = _2124;
    if (_2118)
    {
        float _2132 = rsqrt(_2114);
        _1915 = _2132;
    }
    float _2134 = _1915;
    float _2136 = _2134;
    if (_2118)
    {
        float _2138 = _2122 * _2130;
        _2126 = _2138;
    }
    float _2140 = _2126;
    if (_2118)
    {
        float _2142 = _2140 * 0.15915493667125701904296875;
        _2004 = _2142;
    }
    float _2144 = _2004;
    float _2146 = _2130;
    float _2148 = _2144;
    if (_2118)
    {
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        _2146 = _2152;
    }
    float _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2158 = precise::max(0.0, _2156);
    float _2160 = _958;
    float _2162 = _2156;
    if (_2118)
    {
        float _2164 = _2144 * 6.283185482025146484375;
        float _2166 = cos(_2164);
        _2160 = _2166;
    }
    float _2168 = _2160;
    float _2170 = -_2104;
    float _2172 = -_2158;
    float _2174 = fma(_2170, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2172);
    float _2176 = _2174;
    if (_2118)
    {
        float _2178 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2162 = _2178;
    }
    float _2180 = _2162;
    float _2182 = _2154;
    float _2184 = _2180;
    if (_2118)
    {
        float _2186 = fma(_2154, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    float _2192 = _2168;
    if (_2118)
    {
        float _2194 = _2168 + (-1.0);
        _2184 = _2194;
    }
    float _2196 = _2184;
    float _2198 = _2196;
    if (_2118)
    {
        float _2200 = _2134 * _2188;
        _1179 = _2200;
    }
    float _2202 = _1179;
    if (!_2118)
    {
        _2190 = _2106;
    }
    float _2204 = _2190;
    float _2206 = _2204;
    if (_2118)
    {
        float _2208 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2148 = _2208;
    }
    float _2210 = _2148;
    if (_2118)
    {
        float _2212 = _2106 * _2202;
        _2206 = _2212;
    }
    float _2214 = _2206;
    if (!_2118)
    {
        _2198 = _2108;
    }
    float _2216 = _2198;
    float _2218 = _2216;
    if (_2118)
    {
        float _2220 = _2108 * _2202;
        _2218 = _2220;
    }
    float _2222 = _2218;
    if (!_2118)
    {
        _2136 = _2110;
    }
    float _2224 = _2136;
    float _2226 = _2224;
    if (_2118)
    {
        float _2228 = fma(_2174, _2168, _2210);
        _2176 = _2228;
    }
    float _2230 = _2176;
    if (_2118)
    {
        float _2232 = _2214 * _2214;
        _2226 = _2232;
    }
    float _2234 = _2226;
    if (!_2118)
    {
        _2192 = _2112;
    }
    float _2236 = _2192;
    float _2238 = _2236;
    if (_2118)
    {
        float _2240 = _2222 * _2222;
        _2238 = _2240;
    }
    float _2242 = _2238;
    float _2244 = fma(_2230, _2230, _2234);
    float _2246 = _2244 + _2242;
    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2250 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2248);
    float _2252 = precise::clamp(_2250, 0.0, 1.0);
    float _2254 = -_2252;
    float _2256 = _2254 + 1.0;
    float _2258 = rsqrt(_2246);
    float _2260 = _2258 * _2214;
    float _2262 = _2258 * _2230;
    float _2264 = _2258 * _2222;
    float _2266 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2268 = abs(_2256);
    float _2270 = log2(_2268);
    float _2272 = -_2266;
    float _2274 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = -_2264;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2280 = fma(_2278, -0.5, 0.5);
    float _2282 = fma(_2278, 0.5, 0.5);
    float _2284 = fma(_2282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2288 = sqrt(_2280);
    float _2290 = fma(_2282, _2284, -0.212114393711090087890625);
    float _2292 = _2262 + 1.0;
    float _2294 = fma(_2282, _2290, 1.570728778839111328125);
    float _2296 = exp2(_2286);
    float _2298 = _2288 * 0.636619746685028076171875;
    float _2300 = -_2262;
    float _2302 = fma(_2296, _2292, _2300);
    float _2304 = -_2294;
    float _2306 = fma(_2298, _2304, 1.0);
    float _2308 = fma(_2302, 0.5, 0.5);
    float2 _6351 = float2(_2306, _2308);
    float3 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6351, float2(0.0), isnan(_6351)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6351, float2(0.0), isnan(_6351)), level(0.0)).xyz;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = abs(_1463);
    float _2322 = log2(_2320);
    float _2324 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2326 = -_1381;
    float _2328 = _2326 + 1.0;
    out.m_87.x = _1695;
    out.m_87.y = _1693;
    out.m_87.z = _1697;
    float _2330 = exp2(_2324);
    bool _2332 = _1463 <= 8000.0;
    bool _2334 = isnan(_1463);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(8000.0);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2346 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2348 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2346);
    float _2350 = exp2(_2344);
    float _2352 = -_2330;
    float _2354 = _2352 + 1.0;
    float _2356 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2358 = _2356 * _1989;
    float _2360 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2362 = precise::clamp(_2360, 0.0, 1.0);
    float _2364 = fma(_2362, -2.0, 3.0);
    float _2366 = _2362 * _2362;
    float _2368 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2348);
    float _2370 = _2366 * _2364;
    float _2372 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2368);
    float _2374 = -_2370;
    float _2376 = _2374 + 1.0;
    out.gl_Position.x = _1943;
    out.gl_Position.y = _1921;
    out.gl_Position.z = _2372;
    out.gl_Position.w = _1901;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2380 = _2372 + _1901;
    float _2382 = _2342 * _2378;
    float _2384 = _2342;
    float _2386 = _2372;
    if (!_1879)
    {
        _2384 = 1.0;
    }
    float _2388 = _2384;
    float _2390 = _2380 * 0.5;
    float _2392 = _2388;
    if (_1879)
    {
        bool _2394 = _1987 >= _1963;
        bool _2396 = isnan(_1987);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1963);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2410 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2412 = isnan(_2098);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2418 = _2414 || _2416;
    out.m_89.z = _2390;
    out.m_89.w = _1901;
    float _2420 = _2328 * _2408;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = _2406 * _2076;
    float _2426 = -_2356;
    float _2428 = _2426 + 1.0;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2434 = _2000 * _2428;
    float _2436 = -_2424;
    float _2438 = fma(_2436, _2432, 1.0);
    float _2440 = precise::clamp(_2438, 0.0, 1.0);
    float _2442 = _2000 * _2358;
    float _2444 = _2428;
    float _2446 = _2424;
    float _2448 = _2440;
    float _2450 = _2422;
    if (!_2418)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _2386;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2418)
    {
        _1967 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _1967;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2418)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _2444;
    out.m_91.x = _2454;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2418)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2472 = _2446;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2418)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2478 = _2448;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2418)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2484 = _2450;
    float _2486 = _2318 * _2358;
    float _2488 = fma(_2314, _2442, _1994);
    float _2490 = fma(_2316, _2442, _1996);
    float _2492 = fma(_2000, _2486, _1998);
    out.m_93.x = _2488;
    out.m_93.y = _2490;
    out.m_93.z = _2492;
    out.m_93.w = _2434;
    bool _2494 = !_2418;
    float _2496 = _2484;
    float _2498 = _2484;
    if (!_2494)
    {
        bool _2500 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2502 = isnan(_2098);
        bool _2504 = _2500 || _2502;
        bool _2506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2508 = _2504 || _2506;
        if (!_2508)
        {
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = _2098 + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2516 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2514;
            float _2518 = 1.0 / _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2540 = _2512 * _2518;
            float _2542 = precise::clamp(_2540, 0.0, 1.0);
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2548 = fma(_2542, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2550 = fma(_2542, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2552 = fma(_2542, _2526, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2554 = fma(_2542, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2556 = fma(_2542, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2558 = fma(_2542, _2538, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2550;
            _2482 = _2556;
            _2458 = _2548;
            _2476 = _2554;
            _2470 = _2552;
            _2498 = _2558;
            _2560 = true;
        }
        else
        {
            bool _2562 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2564 = isnan(_2098);
            bool _2566 = _2562 || _2564;
            bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2570 = _2566 || _2568;
            if (!_2570)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2572 = _2456;
            _2458 = _2572;
            if (!_2570)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2574 = _2462;
            _2464 = _2574;
            if (!_2570)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2576 = _2468;
            _2470 = _2576;
            if (!_2570)
            {
                _2474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2578 = _2474;
            _2476 = _2578;
            if (!_2570)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2580 = _2480;
            _2482 = _2580;
            if (!_2570)
            {
                _2496 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2582 = _2496;
            bool _2584 = !_2570;
            _2498 = _2582;
            if (!_2584)
            {
                bool _2586 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2588 = isnan(_2098);
                bool _2590 = _2586 || _2588;
                bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2594 = _2590 || _2592;
                if (!_2594)
                {
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = _2098 + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2602 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2600;
                    float _2604 = 1.0 / _2602;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2626 = _2598 * _2604;
                    float _2628 = precise::clamp(_2626, 0.0, 1.0);
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2634 = fma(_2628, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2636 = fma(_2628, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2638 = fma(_2628, _2612, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2640 = fma(_2628, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2642 = fma(_2628, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2644 = fma(_2628, _2624, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2636;
                    _2482 = _2642;
                    _2458 = _2634;
                    _2476 = _2640;
                    _2470 = _2638;
                    _2498 = _2644;
                    _2560 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2498 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2560 = false;
    float _2646 = _2464;
    float _2648 = _2482;
    float _2650 = _2458;
    float _2652 = _2476;
    float _2654 = _2470;
    float _2656 = _2498;
    float _2658 = fma(_1275, -0.5, 0.5);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    float _2670 = -_2654;
    float _2672 = _2670 + _2656;
    bool _2674 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2676 = fma(_2660, _2664, _2646);
    float _2678 = fma(_2660, _2668, _2650);
    float _2680 = fma(_2660, _2672, _2654);
    float _2682 = _2676 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2684 = fma(_2678, 0.298911988735198974609375, _2682);
    float _2686 = fma(_2680, 0.114477999508380889892578125, _2684);
    out.m_97.x = 0.0;
    float _2688 = -_2686;
    float _2690 = _2678 + _2688;
    float _2692 = -_2686;
    float _2694 = _2676 + _2692;
    float _2696 = -_2686;
    float _2698 = _2680 + _2696;
    float _2700 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2702 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    float _2704 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    float _2706 = fma(_2698, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    out.m_61.x = _2700;
    out.m_99.x = _2702;
    out.m_99.y = _2704;
    out.m_99.z = _2706;
    if (!_2674)
    {
        return out;
    }
    float _2708 = -_1693;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2712 = -_1695;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2716 = -_1697;
    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2720 = _2710 * _2710;
    float _2722 = fma(_2714, _2714, _2720);
    float _2724 = fma(_2718, _2718, _2722);
    float _2726 = rsqrt(_2724);
    float _2728 = _2710 * _2726;
    float _2730 = _2714 * _2726;
    float _2732 = _2718 * _2726;
    float _2734 = sqrt(_2724);
    float _2736 = -_2104;
    float _2738 = _2736 + _2728;
    float _2740 = -_2100;
    float _2742 = _2740 + _2730;
    float _2744 = -_2102;
    float _2746 = _2744 + _2732;
    float _2748 = _2738 * _2738;
    float _2750 = fma(_2742, _2742, _2748);
    float _2752 = fma(_2746, _2746, _2750);
    float _2754 = -_2734;
    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2758 = rsqrt(_2752);
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = abs(_2762);
    float _2766 = log2(_2764);
    float _2768 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2770 = _2738 * _2758;
    float _2772 = _2742 * _2758;
    float _2774 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2776 = precise::clamp(_2774, 0.0, 1.0);
    float _2778 = _2746 * _2758;
    float _2780 = _1275 * _2770;
    float _2782 = _1275 * _2728;
    float _2784 = _2776 * _2776;
    float _2786 = fma(_1271, _2772, _2780);
    float _2788 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2790 = _2784 + (-1.0);
    float _2792 = fma(_1271, _2730, _2782);
    float _2794 = fma(_1285, _2778, _2786);
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = exp2(_2788);
    float _2800 = _2796 * _2796;
    float _2802 = fma(_1285, _2732, _2792);
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = fma(_2800, _2790, 1.0);
    float _2808 = -_2728;
    float _2810 = -_2768;
    float _2812 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2810);
    float _2814 = _2806 * _2806;
    float _2816 = -_2732;
    float _2818 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2812);
    float _2820 = 1.0 / _2814;
    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2824 = _2818 + _2822;
    float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = _2798 * _2828;
    float _2832 = _2804 * _2830;
    float _2834 = _2784 * _2820;
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2838 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2842 = _2832 * _2834;
    float _2844 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2846 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2848 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2836;
    out.m_95.y = _2838;
    out.m_95.z = _2840;
    out.m_97.x = _2844;
    out.m_97.y = _2846;
    out.m_97.z = _2848;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2560 = false;
    bool _1333 = false;
    bool _484 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2905 = as_type<float>(_134);
        out.gl_Position.z = _2905;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_61.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2975 = as_type<float>(_172);
        out.gl_Position.z = _2975;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    bool _188 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _190 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    float _210 = _174 * _174;
    float _212 = _176 * _176;
    float _214 = _178 * _178;
    float _216 = fma(_182, _182, _210);
    float _218 = fma(_184, _184, _212);
    float _220 = fma(_186, _186, _214);
    float _222 = fma(_198, _198, _216);
    float _224 = fma(_200, _200, _218);
    float _226 = fma(_202, _202, _220);
    float _228 = sqrt(_222);
    float _230 = sqrt(_224);
    bool _232 = _228 > 0.0;
    float _234 = sqrt(_226);
    bool _236 = _230 > 0.0;
    float _238 = _230;
    float _240 = _222;
    float _242 = _180;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_196)
    {
        float _246 = _180 * _180;
        float _248 = _246 * 0.5;
        _238 = _248;
    }
    float _250 = _238;
    float _252 = 0.0;
    float _254 = _250;
    if (_232)
    {
        float _256 = rsqrt(_222);
        _252 = _256;
    }
    float _258 = _252;
    if (!_196)
    {
        float _260 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _260;
    }
    float _262 = _254;
    bool _264 = _234 > 0.0;
    float _266 = 0.0;
    float _268 = _262;
    if (_236)
    {
        float _270 = rsqrt(_224);
        _266 = _270;
    }
    float _272 = _266;
    bool _274 = !_196;
    float _276 = 0.0;
    float _278 = _258;
    if (!_274)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _180 * _282;
        float _292 = 1.0 / _286;
        float _294 = _288 * 0.693147182464599609375;
        float _296 = exp2(_290);
        float _298 = 1.0 / _294;
        float _300 = _296 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _298, _180);
        float _306 = _304 * _292;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _308;
        _276 = _298;
        _240 = _294;
    }
    float _310 = _268;
    float _312 = _276;
    float _314 = _240;
    bool _316 = !_196;
    float _318 = _314;
    float _320 = _312;
    float _322 = _310;
    if (!_316)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _180 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _242 = _342;
        _244 = _330;
    }
    float _344 = _242;
    float _346 = _244;
    float _348 = in.m_71.w;
    float _350 = _346;
    if (!_232)
    {
        _318 = 0.0;
    }
    float _352 = _318;
    float _354 = _352;
    if (_232)
    {
        float _356 = _258 * _182;
        _354 = _356;
    }
    float _358 = _354;
    if (!_232)
    {
        _350 = 0.0;
    }
    float _360 = _350;
    float _362 = in.m_58.x;
    float _364 = in.m_58.y;
    float _366 = in.m_58.z;
    float _368 = 0.0;
    float _370 = _360;
    if (!_232)
    {
        _368 = 0.0;
    }
    float _372 = _368;
    float _374 = _372;
    if (_232)
    {
        float _376 = _258 * _174;
        _370 = _376;
    }
    float _378 = _370;
    if (_232)
    {
        float _380 = _258 * _198;
        _374 = _380;
    }
    float _382 = _374;
    float _384 = 0.0;
    if (_264)
    {
        float _386 = rsqrt(_226);
        _384 = _386;
    }
    float _388 = _384;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _392 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _394 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _396 = _392;
    if (!_236)
    {
        _278 = 0.0;
        _320 = 0.0;
    }
    float _398 = _278;
    float _400 = _320;
    float _402 = 0.0;
    float _404 = _400;
    float _406 = _398;
    if (!_236)
    {
        _402 = 0.0;
    }
    float _408 = _402;
    float _410 = fma(_344, _204, _392);
    float _412 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _414 = fma(_344, _206, _394);
    float _416 = 0.0;
    float _418 = _408;
    if (!_264)
    {
        _416 = 0.0;
        _396 = 0.0;
    }
    float _420 = _416;
    float _422 = _396;
    float _424 = _420;
    float _426 = _422;
    if (!_264)
    {
        _322 = 0.0;
    }
    float _428 = _322;
    float _430 = fma(_344, _208, _412);
    float _432 = _428;
    if (_236)
    {
        float _434 = _272 * _184;
        _418 = _434;
    }
    float _436 = _418;
    if (_236)
    {
        float _438 = _272 * _176;
        _404 = _438;
    }
    float _440 = _404;
    if (_236)
    {
        float _442 = _272 * _200;
        _406 = _442;
    }
    float _444 = _406;
    if (_264)
    {
        float _446 = _388 * _186;
        _424 = _446;
    }
    float _448 = _424;
    if (_264)
    {
        float _450 = _388 * _178;
        _426 = _450;
    }
    float _452 = _426;
    if (_264)
    {
        float _454 = _388 * _202;
        _432 = _454;
    }
    float _456 = _432;
    float _458 = fma(_410, _348, _362);
    float _460 = fma(_414, _348, _364);
    float _462 = fma(_430, _348, _366);
    bool _464 = !_390;
    float _482;
    if (!_464)
    {
        float _466 = in.m_73.x;
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _470 = _466 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _474 = _472 * _468;
        float _476 = floor(_474);
        float _478 = -_476;
        float _480 = _474 + _478;
        _482 = _480;
        _484 = true;
    }
    else
    {
        float _486 = float(_118);
        float _488 = 1.0 / _486;
        float _490 = _152 * _488;
        _482 = _490;
    }
    _484 = false;
    float _492 = _482;
    float _494 = in.m_73.z;
    float _496 = _460 * _184;
    float _498 = in.m_73.x;
    float _500 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _502 = log2(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = in.m_73.y;
    float _514 = fma(_458, _182, _496);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _518 = _492 + _516;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _522 = _520 != 0;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _530 = _528 != 0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _534 = _492 + _532;
    float _536 = 1.0 / _506;
    float _538 = 1.0 / _510;
    float _540 = _502 * _152;
    float _542 = _494 * 2.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _544;
    float _548 = _498 * 2.0;
    float _550 = _498 + _494;
    float _552 = floor(_542);
    float _554 = _518 * _536;
    float _556 = _512 * 2.0;
    float _558 = _550 + (-1.0);
    float _560 = _512 + _494;
    float _562 = _534 * _538;
    float _564 = floor(_548);
    float _566 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _568 = !_522;
    int _570 = _568 ? 0 : 1;
    float _572 = _560 + (-1.0);
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _576 = _552 > 0.0;
    float _578 = floor(_556);
    bool _580 = _552 >= 0.0;
    bool _582 = isnan(_552);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _498 + _512;
    int _592 = _588 ? 0 : 1;
    float _594 = _590 + (-1.0);
    bool _596 = _564 > 0.0;
    int _598 = ~_592;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _606 = _564 >= 0.0;
    bool _608 = isnan(_564);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _616;
    int _620 = _602;
    if (!_576)
    {
        int _622 = ~_592;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _628;
    int _632 = abs(_570);
    bool _634 = _578 > 0.0;
    float _636 = fma(_630, _554, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _638 = _578 >= 0.0;
    bool _640 = isnan(_578);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_618, _554, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _650 = exp2(_540);
    float _652 = float(_632);
    float _654 = fma(_546, _554, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _656 = float(_626);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _666 = _614 ? 0 : 1;
    float _668 = _652 * _656;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _674 = in.m_75.x;
    float _676 = in.m_75.y;
    float _678 = in.m_75.z;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _682 = 1.0 + _680;
    int _684 = ~_666;
    int _686 = _684 + 1;
    int _688 = _686 + 1;
    float _690 = _668 * (-2.0);
    int _692 = _688;
    if (!_596)
    {
        int _694 = ~_666;
        int _696 = _694 + 1;
        _692 = _696;
    }
    int _698 = _692;
    float _700 = 1.0 / _682;
    bool _702 = !_526;
    int _704 = _702 ? 0 : 1;
    bool _706 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _708 = isnan(1.0);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _714 = _710 || _712;
    int _716 = abs(_704);
    float _718 = -_650;
    float _720 = _718 + 1.0;
    float _722 = fma(_660, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _724 = fma(_672, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = fma(_664, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _738 = float(_716);
    float _740 = float(_698);
    float _742 = _734 ? _720 : 0.0;
    int _744 = _646 ? 0 : 1;
    float _746 = _738 * _740;
    float _748 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_714)
    {
        float _750 = _742 * _700;
        _154 = _750;
    }
    float _752 = _154;
    float _754 = fma(_604, _690, _604);
    float _756 = _746 * (-2.0);
    float _758 = fma(_690, _674, _674);
    float _760 = _748 * _498;
    float _762 = _498 + (-0.5);
    bool _764 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _766 = isnan(_492);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_574, _756, _574);
    bool _778 = !_530;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_756, _676, _676);
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _758);
    bool _786 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _788 = isnan(_492);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_774;
    float _800 = _798 + 1.0;
    int _802 = ~_744;
    int _804 = _802 + 1;
    int _806 = _804 + 1;
    float _808 = fma(_754, _752, _784);
    int _810 = _806;
    if (!_634)
    {
        int _812 = ~_744;
        int _814 = _812 + 1;
        _810 = _814;
    }
    int _816 = _810;
    float _818 = _796 * _800;
    int _820 = abs(_780);
    float _822 = -_796;
    float _824 = _822 + 1.0;
    bool _826 = _492 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _828 = isnan(_492);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = _512 + (-0.5);
    float _840 = float(_820);
    float _842 = _808 * 0.15915493667125701904296875;
    float _844 = float(_816);
    float _846 = _836 * _824;
    float _848 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _782);
    float _850 = -_836;
    float _852 = _850 + 1.0;
    float _854 = _842 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _840 * _844;
    float _860 = _636 * _846;
    float _862 = _648 * _846;
    float _864 = _654 * _846;
    float _866 = fma(_776, _752, _848);
    float _868 = in.m_71.x;
    float _870 = in.m_71.y;
    float _872 = in.m_71.z;
    float _874 = _858 * (-2.0);
    float _876 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _864);
    float _878 = _866 * 0.15915493667125701904296875;
    float _880 = in.m_77.x;
    float _882 = in.m_77.y;
    float _884 = in.m_77.z;
    float _886 = fma(_566, _874, _566);
    float _888 = fma(_874, _678, _678);
    float _890 = _494 + (-0.5);
    float _892 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _862);
    float _894 = fma(_736, _818, _876);
    float _896 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _860);
    float _898 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[196].z, _888);
    float _900 = fma(_724, _818, _892);
    float _902 = _460 * _200;
    float _904 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].z, _894);
    float _906 = fma(_886, _752, _898);
    float _908 = _842 * 6.283185482025146484375;
    float _910 = cos(_908);
    float _912 = fma(_722, _818, _896);
    float _914 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].y, _900);
    float _916 = _906 * 0.15915493667125701904296875;
    float _918 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[145].x, _912);
    float _920 = fma(_458, _198, _902);
    float _922 = fma(_462, _186, _514);
    float _924 = _878 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _904 * _872;
    float _930 = _914 * _870;
    float _932 = _918 * _868;
    float _934 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _938 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _940 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _878 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _948 = _932 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _950 = _938 * _934;
    float _952 = _940 * _936;
    float _954 = fma(_462, _202, _920);
    float _956 = _948 * _946;
    float _958 = _922 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _960 = _916 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _856 * _926;
    float _966 = _910 * _926;
    bool _968 = _882 != 0.0;
    bool _970 = isnan(_882);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    float _978 = _460 * _176;
    bool _980 = _880 == 0.0;
    bool _982 = !_976;
    bool _984 = _980 && _982;
    float _986 = _916 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _910 * _944;
    float _992 = _856 * _944;
    bool _994 = _884 == 0.0;
    bool _996 = _994 && _984;
    float _998 = fma(_458, _174, _978);
    float _1000 = _910 * _962;
    float _1002 = _856 * _962;
    float _1004 = _944 * _962;
    float _1006 = _926 * _962;
    float _1008 = _1000 * _950;
    float _1010 = _1002 * _950;
    float _1012 = trunc(_760);
    int _1014 = int(_1012);
    float _1016 = _954 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1018 = fma(_988, _990, _964);
    float _1020 = -_966;
    float _1022 = fma(_988, _992, _1020);
    float _1024 = -_992;
    float _1026 = fma(_988, _966, _1024);
    float _1028 = -_950;
    float _1030 = _988 * _1028;
    float _1032 = fma(_1018, _956, _1008);
    float _1034 = fma(_1022, _956, _1010);
    float _1036 = fma(_988, _964, _990);
    float _1038 = fma(_1004, _956, _1030);
    float _1040 = fma(_1026, _952, _1032);
    float _1042 = fma(_462, _178, _998);
    float _1044 = fma(_1036, _952, _1034);
    float _1046 = fma(_1006, _952, _1038);
    float _1048 = _1040 * _436;
    float _1050 = _1040 * _444;
    int _1052 = _1014 << 4;
    int _1054 = _1052 + 1712;
    float _1056 = _1040 * _440;
    float _1058 = fma(_1046, _358, _1048);
    float _1060 = fma(_1046, _382, _1050);
    int _1062 = _1054 + 8;
    uint _1065 = uint(int(uint(_1062) >> uint(2)));
    uint _1067 = uint(int(uint(int(_1065)) >> uint(2)));
    int _1069 = int(_1065) & 3;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[int(_1067)][_1069];
    float _1073 = fma(_1046, _378, _1056);
    float _1075 = fma(_1044, _448, _1058);
    float _1077 = fma(_1044, _456, _1060);
    float _1079 = in.m_79.x;
    float _1081 = in.m_79.y;
    float _1083 = in.m_79.z;
    float _1085 = fma(_1044, _452, _1073);
    float _1087 = _958 + _1075;
    float _1089 = _1016 + _1077;
    uint _1091 = uint(int(uint(_1054) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[int(_1101)][_1103];
    float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1109 = _1087 + _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1113 = _1089 + _1111;
    float _1115 = _1109 * _1109;
    float _1117 = _1113 * _1113;
    float _1119 = _1115 + _1117;
    float _1121 = sqrt(_1119);
    float _1123 = _1081;
    float _1125 = _1079;
    float _1127 = _1083;
    float _1129 = _1115;
    float _1131 = _1117;
    float _1133 = _1087;
    float _1135 = _1089;
    int _1137 = as_type<int>(_1046);
    if (!_996)
    {
        float _1139 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1081);
        _1123 = _1139;
    }
    float _1141 = _1123;
    if (!_996)
    {
        float _1143 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1079);
        _1125 = _1143;
    }
    float _1145 = _1125;
    float _1147 = _1145;
    if (!_996)
    {
        float _1149 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1083);
        _1127 = _1149;
    }
    float _1151 = _1127;
    float _1153 = _1042 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1155 = -_1141;
    float _1157 = _988 * _1155;
    float _1159 = _1000 * _1141;
    float _1161 = _1002 * _1141;
    float _1163 = fma(_1004, _1145, _1157);
    float _1165 = fma(_1018, _1145, _1159);
    float _1167 = fma(_1022, _1145, _1161);
    bool _1169 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = fma(_1006, _1151, _1163);
    float _1173 = fma(_1026, _1151, _1165);
    float _1175 = fma(_1036, _1151, _1167);
    float _1177 = _1153 + _1085;
    float _1179 = _1121;
    if (!_1169)
    {
        _1147 = _1177;
    }
    float _1181 = _1147;
    bool _1183 = !_1169;
    float _1185 = _1181;
    if (!_1183)
    {
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1191 = _1121 + _1189;
        float _1193 = rsqrt(_1119);
        float _1195 = _1191 * _1187;
        float _1197 = _1177 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = _1195 * 0.15915493667125701904296875;
        float _1201 = _1199 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = _1199 * 6.283185482025146484375;
        float _1207 = cos(_1205);
        float _1209 = fma(_1203, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1211 = _1193 * _1209;
        float _1213 = _1207 + (-1.0);
        float _1215 = fma(_1109, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1217 = fma(_1113, _1211, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1219 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1223 = _1215 + _1221;
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1227 = _1217 + _1225;
        float _1229 = fma(_1177, _1207, _1219);
        float _1231 = _1223 * _1223;
        float _1233 = _1227 * _1227;
        _1185 = _1229;
        _1129 = _1231;
        _1131 = _1233;
        _1133 = _1215;
        _1135 = _1217;
    }
    float _1235 = _1185;
    float _1237 = _1129;
    float _1239 = _1131;
    float _1241 = _1133;
    float _1243 = _1135;
    float _1245 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1247 = _1235 + _1245;
    float _1249 = _1173 * _436;
    float _1251 = _1173 * _440;
    float _1253 = _1173 * _444;
    float _1255 = fma(_1247, _1247, _1237);
    float _1257 = fma(_1171, _358, _1249);
    float _1259 = fma(_1171, _378, _1251);
    float _1261 = fma(_1171, _382, _1253);
    float _1263 = _1255 + _1239;
    float _1265 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = _1105 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1271 = fma(_1175, _448, _1257);
    float _1273 = sqrt(_1263);
    float _1275 = fma(_1175, _452, _1259);
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = fma(_1175, _456, _1261);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1279;
    out.m_83.y = _1281;
    out.m_83.z = _1283;
    out.m_83.w = _1277;
    bool _1287 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1289 = isnan(_1273);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1295 = _1291 || _1293;
    out.m_85.x = _1271;
    out.m_85.y = _1275;
    out.m_85.z = _1285;
    float _1297 = _1261;
    if (!_1295)
    {
        _1297 = 1.0;
    }
    float _1299 = _1297;
    bool _1301 = !_1295;
    float _1303 = _1299;
    if (!_1301)
    {
        bool _1305 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1307 = isnan(_1273);
        bool _1309 = _1305 || _1307;
        bool _1311 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1313 = _1309 || _1311;
        if (!_1313)
        {
            float _1315 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1317 = _1273 + _1315;
            float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1321 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1319;
            float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1325 = _1323 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1327 = 1.0 / _1321;
            float _1329 = _1317 * _1327;
            float _1331 = fma(_1329, _1325, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1303 = _1331;
            _1333 = true;
        }
        else
        {
            bool _1335 = _1273 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1337 = isnan(_1273);
            bool _1339 = _1335 || _1337;
            bool _1341 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1343 = _1339 || _1341;
            if (!_1343)
            {
                float _1345 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1347 = _1273 + _1345;
                float _1349 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1351 = _1349 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1353 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1355 = _1353 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1357 = 1.0 / _1351;
                float _1359 = _1347 * _1357;
                float _1361 = fma(_1359, _1355, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1303 = _1361;
                _1333 = true;
            }
            else
            {
                _1303 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1333 = false;
    float _1363 = _1303;
    float _1365 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1367 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1369 = floor(_1365);
    float _1371 = floor(_1367);
    float _1373 = -_1369;
    float _1375 = _1365 + _1373;
    float _1377 = -_1371;
    float _1379 = _1367 + _1377;
    float2 _4802 = float2(_1375, _1379);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4802, float2(0.0), isnan(_4802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4802, float2(0.0), isnan(_4802)), level(0.0)).x;
    float _1383 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1387 = _1241 + _1385;
    float _1389 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1383);
    float _1391 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1393 = _1235 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1397 = _1243 + _1395;
    float _1399 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1401 = _1153 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1403 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.5);
    bool _1411 = _1407 || _1409;
    float _1413 = fma(_1387, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1415 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1401);
    float _1419 = fma(_1393, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1421 = fma(_1397, _1363, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1423 = 1.0 / _1415;
    float _1425 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1427 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1429 = _1393;
    float _1431 = _1363;
    int _1433 = 2;
    if (_1411)
    {
        _1429 = _1413;
    }
    float _1435 = _1429;
    float _1437 = _1427 + _1415;
    float _1439 = _1435;
    if (_1411)
    {
        _1431 = _1419;
    }
    float _1441 = _1431;
    float _1443 = _1437 * _1423;
    float _1445 = _1443 * 0.5;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1449 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1447);
    float _1451 = 1.0 / _1449;
    float _1453 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1455 = _1153 + _1453;
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1459 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1457);
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1463 = _1451 * _1461;
    float _1465 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1459);
    float _1467 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1469 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1471 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1473 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1475 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1467);
    bool _1477 = !_1469;
    int _1479 = _1477 ? 0 : 1;
    float _1481 = trunc(_1471);
    int _1483 = int(_1481);
    float _1485 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1475);
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1489 = _1441;
    if (!_1469)
    {
        _1433 = 1;
    }
    int _1491 = _1433;
    int _1493 = _1491;
    if (!_1473)
    {
        _1493 = _1479;
    }
    int _1495 = _1493;
    float _1497 = trunc(_1487);
    int _1499 = int(_1497);
    int _1501 = _1495 << 6;
    int _1503 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1505 = _1483 + _1503;
    int _1507 = _1505 + 1;
    int _1509 = _1501 + 48;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    uint _1513 = uint(int(uint(int(_1511)) >> uint(2)));
    int _1515 = int(_1511) & 3;
    float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
    int _1519 = int(_1511) + 1;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    int _1523 = _1519 & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    bool _1527 = _1507 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1529 = _1501 + 56;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    uint _1533 = uint(int(uint(int(_1531)) >> uint(2)));
    int _1535 = int(_1531) & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    int _1539 = int(_1531) + 1;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    int _1543 = _1539 & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1549 = _1499 + _1547;
    int _1551 = _1549 + 1;
    int _1553 = _1507 | _1551;
    int _1555 = _1501 + 64;
    uint _1557 = uint(int(uint(_1555) >> uint(2)));
    uint _1559 = uint(int(uint(int(_1557)) >> uint(2)));
    int _1561 = int(_1557) & 3;
    float _1563 = (*spvDescriptorSet0.vp_c15)._m0[int(_1559)][_1561];
    int _1565 = int(_1557) + 1;
    uint _1567 = uint(int(uint(_1565) >> uint(2)));
    int _1569 = _1565 & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    bool _1573 = _1553 < 0;
    bool _1575 = _1573 || _1527;
    float _1577 = as_type<float>(_1553);
    int _1579 = _1507;
    if (_1411)
    {
        _1577 = _1421;
    }
    float _1581 = _1577;
    bool _1583 = _1551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1585 = _1583 || _1575;
    int _1587 = _1501 + 72;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    uint _1591 = uint(int(uint(int(_1589)) >> uint(2)));
    int _1593 = int(_1589) & 3;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[int(_1591)][_1593];
    int _1597 = int(_1589) + 1;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    int _1601 = _1597 & 3;
    float _1603 = (*spvDescriptorSet0.vp_c15)._m0[int(_1599)][_1601];
    int _1605 = _1501 + 96;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = _1501 + 104;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    float _1641 = _1581;
    if (!_1411)
    {
        float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1645 = _1153 + _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1649 = _958 + _1647;
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1653 = _1645 * _1645;
        float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1657 = _1016 + _1655;
        float _1659 = fma(_1649, _1649, _1653);
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = fma(_1657, _1657, _1659);
        float _1665 = sqrt(_1663);
        float _1667 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1669 = -_1016;
        float _1671 = _1669 + _1421;
        float _1673 = precise::min(_1665, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1675 = _1673 * _1661;
        float _1677 = -_1153;
        float _1679 = _1677 + _1419;
        float _1681 = _1667 * _1675;
        float _1683 = -_958;
        float _1685 = _1683 + _1413;
        float _1687 = fma(_1679, _1681, _1153);
        float _1689 = fma(_1685, _1681, _958);
        float _1691 = fma(_1671, _1681, _1016);
        _1489 = _1687;
        _1439 = _1689;
        _1641 = _1691;
        _1137 = as_type<int>(_1661);
    }
    float _1693 = _1489;
    float _1695 = _1439;
    float _1697 = _1641;
    int _1699 = _1137;
    float _1701 = _1455 * _1621;
    float _1703 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1705 = _1699;
    if (!_1585)
    {
        int _1707 = _1551 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1709 = _1707 + _1507;
        _1579 = _1709;
    }
    int _1711 = _1579;
    float _1713 = _1455 * _1571;
    float _1715 = fma(_958, _1613, _1701);
    float _1717 = _1455 * _1525;
    float _1719 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1703);
    int _1721 = as_type<int>(_1719);
    if (!_1585)
    {
        int _1723 = _1711 << 2;
        _1705 = _1723;
    }
    int _1725 = _1705;
    float _1727 = fma(_1016, _1631, _1715);
    float _1729 = fma(_958, _1517, _1717);
    float _1731 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = fma(_958, _1563, _1713);
    float _1735 = _1727 + _1639;
    int _1737 = _1725;
    if (!_1585)
    {
        uint _1739 = uint(int(uint(_1711) >> uint(2)));
        _1721 = int(_1739);
    }
    int _1741 = _1721;
    int _1743 = _1501 + 80;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    uint _1747 = uint(int(uint(int(_1745)) >> uint(2)));
    int _1749 = int(_1745) & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    int _1753 = int(_1745) + 1;
    uint _1755 = uint(int(uint(_1753) >> uint(2)));
    int _1757 = _1753 & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    if (!_1585)
    {
        int _1761 = 12 & _1725;
        _1737 = _1761;
    }
    int _1763 = _1737;
    float _1765 = 1.0 / _1735;
    float _1767 = fma(_1016, _1537, _1729);
    float _1769 = fma(_1016, _1595, _1733);
    int _1771 = _1763;
    if (!_1585)
    {
        int _1773 = _1741 << 4;
        int _1775 = _1773 + _1763;
        _1771 = _1775;
    }
    int _1777 = _1771;
    float _1779 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1781 = _1767 + _1545;
    float _1783 = _1769 + _1603;
    int _1785 = _1501 + 88;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    float _1803 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1779);
    float _1805 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1807 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1803);
    float _1813 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1815 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1807);
    float _1817 = _1113;
    if (!_1585)
    {
        float _1819 = floor(_1487);
        _1817 = _1819;
    }
    float _1821 = _1817;
    float _1823 = _1781 * _1765;
    float _1825 = -_1813;
    float _1827 = fma(_1825, _1809, 1.0);
    float _1829 = _1781;
    float _1831 = _1765;
    if (!_1585)
    {
        int _1833 = _1777 + 400;
        uint _1835 = uint(int(uint(_1833) >> uint(2)));
        uint _1837 = uint(int(uint(int(_1835)) >> uint(2)));
        int _1839 = int(_1835) & 3;
        float _1841 = (*spvDescriptorSet0.vp_c15)._m0[int(_1837)][_1839];
        _1829 = _1841;
    }
    float _1843 = _1829;
    float _1845 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1847 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1815);
    bool _1849 = _1823 >= 0.0;
    float _1851 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1853 = _1783 * _1765;
    float _1855 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1845);
    bool _1857 = _1823 <= 1.0;
    bool _1859 = _1857 && _1849;
    float _1861 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1863 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1865 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    bool _1867 = _1853 >= 0.0;
    bool _1869 = _1867 && _1859;
    float _1871 = log2(_1827);
    float _1873 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1863);
    float _1875 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1877 = _1853 <= 1.0;
    bool _1879 = _1877 && _1869;
    float _1881 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1883 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1873);
    float _1885 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1887 = _1821;
    if (!_1585)
    {
        float _1889 = -_1821;
        float _1891 = _1487 + _1889;
        _1887 = _1891;
    }
    float _1893 = _1887;
    float _1895 = _1783;
    if (!_1585)
    {
        float _1897 = floor(_1471);
        _1895 = _1897;
    }
    float _1899 = _1895;
    float _1901 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1883);
    float _1903 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1885);
    float _1905 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1881);
    float _1907 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1905);
    float _1909 = 1.0 / _1901;
    float _1911 = _1455 * _1759;
    float _1913 = _1759;
    float _1915 = _1907;
    if (_1879)
    {
        float _1917 = float(_1495);
        _1913 = _1917;
    }
    float _1919 = _1913;
    float _1921 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1907);
    float _1923 = _1871 * 0.693147182464599609375;
    float _1925 = fma(_958, _1751, _1911);
    float _1927 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1903);
    float _1929 = _1911;
    if (_1879)
    {
        float _1931 = rint(_1919);
        float _1933 = precise::max(_1931, 0.0);
        uint _1935 = uint(_1933);
        uint _1937 = clamp(_1935, 0u, 65535u);
        _1929 = as_type<float>(_1937);
    }
    float _1939 = _1929;
    float _1941 = fma(_1016, _1793, _1925);
    float _1943 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1927);
    float _1945 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1947 = _1899;
    float _1949 = _1843;
    if (!_1585)
    {
        float _1951 = -_1899;
        float _1953 = _1471 + _1951;
        _1947 = _1953;
    }
    float _1955 = _1947;
    float _1957 = _1941 + _1801;
    float _1959 = _1943 * _1909;
    float _1961 = _1921 * _1909;
    float _1963 = _1957 * _1765;
    float _1965 = _1925;
    float _1967 = _1963;
    if (!_1585)
    {
        float _1969 = rint(_1843);
        float _1971 = precise::max(_1969, 0.0);
        uint _1973 = uint(_1971);
        uint _1975 = clamp(_1973, 0u, 65535u);
        _1965 = as_type<float>(_1975);
    }
    float _1977 = _1965;
    float _1979 = fma(_1959, 0.5, 0.5);
    float _1981 = fma(_1961, -0.5, 0.5);
    float _1983 = _1939;
    if (_1879)
    {
        float3 _5828 = float3(_1823, _1853, float(as_type<int>(_1939)));
        float3 _5832 = select(_5828, float3(0.0), isnan(_5828));
        float _1985 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5832.xy, uint(rint(_5832.z)), _1963, level(0.0));
        _1983 = _1985;
    }
    float _1987 = _1983;
    float3 _5842 = float3(_1979, _1981, _1945);
    float _1989 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5842, float3(0.0), isnan(_5842)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5842, float3(0.0), isnan(_5842)), level(0.0)).x;
    float3 _5851 = float3(_1979, _1981, _1945);
    float4 _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5851, float3(0.0), isnan(_5851)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5851, float3(0.0), isnan(_5851)), level(0.0)).xyzw;
    float _1994 = _1992.x;
    float _1996 = _1992.y;
    float _1998 = _1992.z;
    float _2000 = _1992.w;
    float _2002 = _1955;
    float _2004 = _1977;
    if (!_1585)
    {
        float3 _5875 = float3(_1955, _1893, float(as_type<int>(_1977)));
        float3 _5877 = select(_5875, float3(0.0), isnan(_5875));
        float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5877.xy, uint(rint(_5877.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5877.xy, uint(rint(_5877.z)), level(0.0)).x;
        _2002 = _2006;
    }
    float _2008 = _2002;
    if (_1585)
    {
        _1831 = 1.0;
    }
    float _2010 = _1831;
    float _2012 = _2010;
    if (!_1585)
    {
        int _2014 = _1711 << 4;
        int _2016 = _2014 + 2048;
        uint _2018 = uint(int(uint(_2016) >> uint(2)));
        uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
        int _2022 = int(_2018) & 3;
        float _2024 = (*spvDescriptorSet0.vp_c15)._m0[int(_2020)][_2022];
        int _2026 = int(_2018) + 1;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        int _2030 = _2026 & 3;
        float _2032 = (*spvDescriptorSet0.vp_c15)._m0[int(_2028)][_2030];
        int _2034 = _2016 + 8;
        uint _2036 = uint(int(uint(_2034) >> uint(2)));
        uint _2038 = uint(int(uint(int(_2036)) >> uint(2)));
        int _2040 = int(_2036) & 3;
        float _2042 = (*spvDescriptorSet0.vp_c15)._m0[int(_2038)][_2040];
        int _2044 = int(_2036) + 1;
        uint _2046 = uint(int(uint(_2044) >> uint(2)));
        int _2048 = _2044 & 3;
        float _2050 = (*spvDescriptorSet0.vp_c15)._m0[int(_2046)][_2048];
        float _2052 = _1455 * _2032;
        float _2054 = fma(_958, _2024, _2052);
        float _2056 = fma(_1016, _2042, _2054);
        float _2058 = _2056 + _2050;
        float _2060 = precise::clamp(_2058, 0.0, 1.0);
        float _2062 = -_2060;
        float _2064 = _2062 + _2008;
        float _2066 = fma(_2064, 500.0, 1.5);
        float _2068 = exp2(_2066);
        float _2070 = 0.0 + _2068;
        float _2072 = precise::clamp(_2070, 0.0, 1.0);
        _1949 = _2032;
        _2012 = _2072;
    }
    float _2074 = _1949;
    float _2076 = _2012;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2080 = _1693 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2084 = _1695 + _2082;
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2088 = _1697 + _2086;
    float _2090 = _2080 * _2080;
    float _2092 = fma(_2084, _2084, _2090);
    float _2094 = fma(_2088, _2088, _2092);
    float _2096 = rsqrt(_2094);
    float _2098 = sqrt(_2094);
    float _2100 = _2084 * _2096;
    float _2102 = _2088 * _2096;
    float _2104 = _2080 * _2096;
    float _2106 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2108 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2110 = _2106 * _2106;
    float _2112 = _2108 * _2108;
    float _2114 = _2110 + _2112;
    float _2116 = sqrt(_2114);
    bool _2118 = _2116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2122 = _2116 + _2120;
    float _2124 = _2074;
    float _2126 = _2122;
    if (_2118)
    {
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2128;
    }
    float _2130 = _2124;
    if (_2118)
    {
        float _2132 = rsqrt(_2114);
        _1915 = _2132;
    }
    float _2134 = _1915;
    float _2136 = _2134;
    if (_2118)
    {
        float _2138 = _2122 * _2130;
        _2126 = _2138;
    }
    float _2140 = _2126;
    if (_2118)
    {
        float _2142 = _2140 * 0.15915493667125701904296875;
        _2004 = _2142;
    }
    float _2144 = _2004;
    float _2146 = _2130;
    float _2148 = _2144;
    if (_2118)
    {
        float _2150 = _2144 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        _2146 = _2152;
    }
    float _2154 = _2146;
    float _2156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2158 = precise::max(0.0, _2156);
    float _2160 = _958;
    float _2162 = _2156;
    if (_2118)
    {
        float _2164 = _2144 * 6.283185482025146484375;
        float _2166 = cos(_2164);
        _2160 = _2166;
    }
    float _2168 = _2160;
    float _2170 = -_2104;
    float _2172 = -_2158;
    float _2174 = fma(_2170, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2172);
    float _2176 = _2174;
    if (_2118)
    {
        float _2178 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2162 = _2178;
    }
    float _2180 = _2162;
    float _2182 = _2154;
    float _2184 = _2180;
    if (_2118)
    {
        float _2186 = fma(_2154, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    float _2192 = _2168;
    if (_2118)
    {
        float _2194 = _2168 + (-1.0);
        _2184 = _2194;
    }
    float _2196 = _2184;
    float _2198 = _2196;
    if (_2118)
    {
        float _2200 = _2134 * _2188;
        _1179 = _2200;
    }
    float _2202 = _1179;
    if (!_2118)
    {
        _2190 = _2106;
    }
    float _2204 = _2190;
    float _2206 = _2204;
    if (_2118)
    {
        float _2208 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2148 = _2208;
    }
    float _2210 = _2148;
    if (_2118)
    {
        float _2212 = _2106 * _2202;
        _2206 = _2212;
    }
    float _2214 = _2206;
    if (!_2118)
    {
        _2198 = _2108;
    }
    float _2216 = _2198;
    float _2218 = _2216;
    if (_2118)
    {
        float _2220 = _2108 * _2202;
        _2218 = _2220;
    }
    float _2222 = _2218;
    if (!_2118)
    {
        _2136 = _2110;
    }
    float _2224 = _2136;
    float _2226 = _2224;
    if (_2118)
    {
        float _2228 = fma(_2174, _2168, _2210);
        _2176 = _2228;
    }
    float _2230 = _2176;
    if (_2118)
    {
        float _2232 = _2214 * _2214;
        _2226 = _2232;
    }
    float _2234 = _2226;
    if (!_2118)
    {
        _2192 = _2112;
    }
    float _2236 = _2192;
    float _2238 = _2236;
    if (_2118)
    {
        float _2240 = _2222 * _2222;
        _2238 = _2240;
    }
    float _2242 = _2238;
    float _2244 = fma(_2230, _2230, _2234);
    float _2246 = _2244 + _2242;
    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2250 = fma(_2098, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2248);
    float _2252 = precise::clamp(_2250, 0.0, 1.0);
    float _2254 = -_2252;
    float _2256 = _2254 + 1.0;
    float _2258 = rsqrt(_2246);
    float _2260 = _2258 * _2214;
    float _2262 = _2258 * _2230;
    float _2264 = _2258 * _2222;
    float _2266 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2268 = abs(_2256);
    float _2270 = log2(_2268);
    float _2272 = -_2266;
    float _2274 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = -_2264;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2280 = fma(_2278, -0.5, 0.5);
    float _2282 = fma(_2278, 0.5, 0.5);
    float _2284 = fma(_2282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2288 = sqrt(_2280);
    float _2290 = fma(_2282, _2284, -0.212114393711090087890625);
    float _2292 = _2262 + 1.0;
    float _2294 = fma(_2282, _2290, 1.570728778839111328125);
    float _2296 = exp2(_2286);
    float _2298 = _2288 * 0.636619746685028076171875;
    float _2300 = -_2262;
    float _2302 = fma(_2296, _2292, _2300);
    float _2304 = -_2294;
    float _2306 = fma(_2298, _2304, 1.0);
    float _2308 = fma(_2302, 0.5, 0.5);
    float2 _6351 = float2(_2306, _2308);
    float3 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6351, float2(0.0), isnan(_6351)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6351, float2(0.0), isnan(_6351)), level(0.0)).xyz;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = abs(_1463);
    float _2322 = log2(_2320);
    float _2324 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2326 = -_1381;
    float _2328 = _2326 + 1.0;
    out.m_87.x = _1695;
    out.m_87.y = _1693;
    out.m_87.z = _1697;
    float _2330 = exp2(_2324);
    bool _2332 = _1463 <= 8000.0;
    bool _2334 = isnan(_1463);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(8000.0);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2346 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2348 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2346);
    float _2350 = exp2(_2344);
    float _2352 = -_2330;
    float _2354 = _2352 + 1.0;
    float _2356 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2358 = _2356 * _1989;
    float _2360 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2362 = precise::clamp(_2360, 0.0, 1.0);
    float _2364 = fma(_2362, -2.0, 3.0);
    float _2366 = _2362 * _2362;
    float _2368 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2348);
    float _2370 = _2366 * _2364;
    float _2372 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2368);
    float _2374 = -_2370;
    float _2376 = _2374 + 1.0;
    out.gl_Position.x = _1943;
    out.gl_Position.y = _1921;
    out.gl_Position.z = _2372;
    out.gl_Position.w = _1901;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2380 = _2372 + _1901;
    float _2382 = _2342 * _2378;
    float _2384 = _2342;
    float _2386 = _2372;
    if (!_1879)
    {
        _2384 = 1.0;
    }
    float _2388 = _2384;
    float _2390 = _2380 * 0.5;
    float _2392 = _2388;
    if (_1879)
    {
        bool _2394 = _1987 >= _1963;
        bool _2396 = isnan(_1987);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1963);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2410 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2412 = isnan(_2098);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2418 = _2414 || _2416;
    out.m_89.z = _2390;
    out.m_89.w = _1901;
    float _2420 = _2328 * _2408;
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = _2406 * _2076;
    float _2426 = -_2356;
    float _2428 = _2426 + 1.0;
    float _2430 = -_2422;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2434 = _2000 * _2428;
    float _2436 = -_2424;
    float _2438 = fma(_2436, _2432, 1.0);
    float _2440 = precise::clamp(_2438, 0.0, 1.0);
    float _2442 = _2000 * _2358;
    float _2444 = _2428;
    float _2446 = _2424;
    float _2448 = _2440;
    float _2450 = _2422;
    if (!_2418)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _2386;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2418)
    {
        _1967 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _1967;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2418)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _2444;
    out.m_91.x = _2454;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2418)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2472 = _2446;
    float _2474 = _2472;
    float _2476 = _2472;
    if (!_2418)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2478 = _2448;
    float _2480 = _2478;
    float _2482 = _2478;
    if (!_2418)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2484 = _2450;
    float _2486 = _2318 * _2358;
    float _2488 = fma(_2314, _2442, _1994);
    float _2490 = fma(_2316, _2442, _1996);
    float _2492 = fma(_2000, _2486, _1998);
    out.m_93.x = _2488;
    out.m_93.y = _2490;
    out.m_93.z = _2492;
    out.m_93.w = _2434;
    bool _2494 = !_2418;
    float _2496 = _2484;
    float _2498 = _2484;
    if (!_2494)
    {
        bool _2500 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2502 = isnan(_2098);
        bool _2504 = _2500 || _2502;
        bool _2506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2508 = _2504 || _2506;
        if (!_2508)
        {
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = _2098 + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2516 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2514;
            float _2518 = 1.0 / _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2540 = _2512 * _2518;
            float _2542 = precise::clamp(_2540, 0.0, 1.0);
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2548 = fma(_2542, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2550 = fma(_2542, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2552 = fma(_2542, _2526, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2554 = fma(_2542, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2556 = fma(_2542, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2558 = fma(_2542, _2538, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2550;
            _2482 = _2556;
            _2458 = _2548;
            _2476 = _2554;
            _2470 = _2552;
            _2498 = _2558;
            _2560 = true;
        }
        else
        {
            bool _2562 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2564 = isnan(_2098);
            bool _2566 = _2562 || _2564;
            bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2570 = _2566 || _2568;
            if (!_2570)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2572 = _2456;
            _2458 = _2572;
            if (!_2570)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2574 = _2462;
            _2464 = _2574;
            if (!_2570)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2576 = _2468;
            _2470 = _2576;
            if (!_2570)
            {
                _2474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2578 = _2474;
            _2476 = _2578;
            if (!_2570)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2580 = _2480;
            _2482 = _2580;
            if (!_2570)
            {
                _2496 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2582 = _2496;
            bool _2584 = !_2570;
            _2498 = _2582;
            if (!_2584)
            {
                bool _2586 = _2098 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2588 = isnan(_2098);
                bool _2590 = _2586 || _2588;
                bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2594 = _2590 || _2592;
                if (!_2594)
                {
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = _2098 + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2602 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2600;
                    float _2604 = 1.0 / _2602;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2626 = _2598 * _2604;
                    float _2628 = precise::clamp(_2626, 0.0, 1.0);
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2634 = fma(_2628, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2636 = fma(_2628, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2638 = fma(_2628, _2612, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2640 = fma(_2628, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2642 = fma(_2628, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2644 = fma(_2628, _2624, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2636;
                    _2482 = _2642;
                    _2458 = _2634;
                    _2476 = _2640;
                    _2470 = _2638;
                    _2498 = _2644;
                    _2560 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2498 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2560 = false;
    float _2646 = _2464;
    float _2648 = _2482;
    float _2650 = _2458;
    float _2652 = _2476;
    float _2654 = _2470;
    float _2656 = _2498;
    float _2658 = fma(_1275, -0.5, 0.5);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    float _2670 = -_2654;
    float _2672 = _2670 + _2656;
    bool _2674 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2676 = fma(_2660, _2664, _2646);
    float _2678 = fma(_2660, _2668, _2650);
    float _2680 = fma(_2660, _2672, _2654);
    float _2682 = _2676 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2684 = fma(_2678, 0.298911988735198974609375, _2682);
    float _2686 = fma(_2680, 0.114477999508380889892578125, _2684);
    out.m_97.x = 0.0;
    float _2688 = -_2686;
    float _2690 = _2678 + _2688;
    float _2692 = -_2686;
    float _2694 = _2676 + _2692;
    float _2696 = -_2686;
    float _2698 = _2680 + _2696;
    float _2700 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2702 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    float _2704 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    float _2706 = fma(_2698, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2686);
    out.m_61.x = _2700;
    out.m_99.x = _2702;
    out.m_99.y = _2704;
    out.m_99.z = _2706;
    if (!_2674)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2708 = -_1693;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2712 = -_1695;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2716 = -_1697;
    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2720 = _2710 * _2710;
    float _2722 = fma(_2714, _2714, _2720);
    float _2724 = fma(_2718, _2718, _2722);
    float _2726 = rsqrt(_2724);
    float _2728 = _2710 * _2726;
    float _2730 = _2714 * _2726;
    float _2732 = _2718 * _2726;
    float _2734 = sqrt(_2724);
    float _2736 = -_2104;
    float _2738 = _2736 + _2728;
    float _2740 = -_2100;
    float _2742 = _2740 + _2730;
    float _2744 = -_2102;
    float _2746 = _2744 + _2732;
    float _2748 = _2738 * _2738;
    float _2750 = fma(_2742, _2742, _2748);
    float _2752 = fma(_2746, _2746, _2750);
    float _2754 = -_2734;
    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2758 = rsqrt(_2752);
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = abs(_2762);
    float _2766 = log2(_2764);
    float _2768 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2770 = _2738 * _2758;
    float _2772 = _2742 * _2758;
    float _2774 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2776 = precise::clamp(_2774, 0.0, 1.0);
    float _2778 = _2746 * _2758;
    float _2780 = _1275 * _2770;
    float _2782 = _1275 * _2728;
    float _2784 = _2776 * _2776;
    float _2786 = fma(_1271, _2772, _2780);
    float _2788 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2790 = _2784 + (-1.0);
    float _2792 = fma(_1271, _2730, _2782);
    float _2794 = fma(_1285, _2778, _2786);
    float _2796 = precise::clamp(_2794, 0.0, 1.0);
    float _2798 = exp2(_2788);
    float _2800 = _2796 * _2796;
    float _2802 = fma(_1285, _2732, _2792);
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = fma(_2800, _2790, 1.0);
    float _2808 = -_2728;
    float _2810 = -_2768;
    float _2812 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2810);
    float _2814 = _2806 * _2806;
    float _2816 = -_2732;
    float _2818 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2812);
    float _2820 = 1.0 / _2814;
    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2824 = _2818 + _2822;
    float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = _2798 * _2828;
    float _2832 = _2804 * _2830;
    float _2834 = _2784 * _2820;
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2838 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2842 = _2832 * _2834;
    float _2844 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2846 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2848 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2836;
    out.m_95.y = _2838;
    out.m_95.z = _2840;
    out.m_97.x = _2844;
    out.m_97.y = _2846;
    out.m_97.z = _2848;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

