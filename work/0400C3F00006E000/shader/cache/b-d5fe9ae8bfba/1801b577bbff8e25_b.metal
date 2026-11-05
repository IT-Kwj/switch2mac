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
    float4 m_89 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_107 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_105 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
    float4 m_85 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2734 = false;
    bool _1476 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_58.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_61.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3039 = as_type<float>(_142);
        out.gl_Position.z = _3039;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_63.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_180);
        out.gl_Position.z = _3109;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_65.x;
    float _184 = in.m_65.y;
    float _186 = in.m_65.z;
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    bool _224 = _218 > 0.0;
    bool _226 = _220 > 0.0;
    float _228 = _220;
    float _230 = _218;
    if (_224)
    {
        float _232 = rsqrt(_212);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    if (!_224)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _240 = _236;
    float _242 = _238;
    bool _244 = _222 > 0.0;
    float _246 = 0.0;
    float _248 = _240;
    float _250 = _242;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _252 = _246;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _252;
    if (!_226)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = _222;
    float _266 = _260;
    float _268 = _262;
    if (_226)
    {
        float _270 = rsqrt(_214);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_226)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (!_244)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = 0.0;
    float _286 = _282;
    if (_244)
    {
        float _288 = rsqrt(_216);
        _284 = _288;
    }
    float _290 = _284;
    float _292 = _234;
    if (_224)
    {
        float _294 = _234 * _188;
        _248 = _294;
    }
    float _296 = _248;
    if (_224)
    {
        float _298 = _234 * _182;
        _250 = _298;
    }
    float _300 = _250;
    if (_224)
    {
        float _302 = _234 * _194;
        _258 = _302;
    }
    float _304 = _258;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_244)
    {
        _230 = 0.0;
    }
    float _308 = _230;
    float _310 = _308;
    if (!_244)
    {
        _292 = 0.0;
    }
    float _312 = _292;
    float _314 = _312;
    if (_226)
    {
        float _316 = _272 * _190;
        _266 = _316;
    }
    float _318 = _266;
    if (_226)
    {
        float _320 = _272 * _184;
        _268 = _320;
    }
    float _322 = _268;
    if (_226)
    {
        float _324 = _272 * _196;
        _280 = _324;
    }
    float _326 = _280;
    if (_244)
    {
        float _328 = _290 * _192;
        _286 = _328;
    }
    float _330 = _286;
    if (_244)
    {
        float _332 = _290 * _186;
        _310 = _332;
    }
    float _334 = _310;
    if (_244)
    {
        float _336 = _290 * _198;
        _314 = _336;
    }
    float _338 = _314;
    bool _340 = !_306;
    float _358;
    if (!_340)
    {
        float _342 = in.m_71.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_126);
        float _364 = 1.0 / _362;
        float _366 = _160 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_71.w;
    float _372 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _374 = log2(_372);
    float _376 = in.m_58.x;
    float _378 = in.m_58.y;
    float _380 = in.m_58.z;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _384 = _382 != 0;
    float _386 = in.m_71.z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _396 = _394 != 0;
    float _398 = in.m_73.y;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _402 = _400 != 0;
    float _404 = in.m_75.x;
    float _406 = in.m_75.y;
    float _408 = in.m_75.z;
    float _410 = _374 * _160;
    float _412 = in.m_71.y;
    float _414 = exp2(_410);
    bool _416 = _370 > 0.5;
    float _418 = _184 * _378;
    float _420 = _190 * _378;
    float _422 = _196 * _378;
    float _424 = in.m_71.x;
    float _426 = fma(_182, _376, _418);
    float _428 = _386 * 2.0;
    float _430 = fma(_188, _376, _420);
    float _432 = -_398;
    float _434 = _432 + 1.0;
    float _436 = -_414;
    float _438 = _436 + 1.0;
    float _440 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _442 = _416 ? as_type<int>(_434) : as_type<int>(_398);
    float _444 = floor(_428);
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _456 = _454 != 0;
    float _458 = fma(_194, _376, _422);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _462 = _406 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = _396 ? as_type<float>(_442) : _398;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = _412 > 0.5;
    float _472 = _412 * 2.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    float _478 = 1.0 / _468;
    float _480 = _398;
    if (_402)
    {
        float _482 = _470 ? _434 : _398;
        _480 = _482;
    }
    float _484 = _480;
    float _486 = fma(_192, _380, _430);
    out.m_77.w = _460;
    bool _488 = _444 >= 0.0;
    bool _490 = isnan(_444);
    bool _492 = _488 || _490;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    float _498 = _408 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _500 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _508 = _504 || _506;
    float _510 = fma(_198, _380, _458);
    float _512 = 1.0 / _476;
    float _514 = _412 + _386;
    int _516 = _496 ? 0 : 1;
    float _518 = _424 * 2.0;
    float _520 = _514 + (-1.0);
    bool _522 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = floor(_472);
    float _536 = _508 ? _438 : 0.0;
    float _538 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _540 = _444 > 0.0;
    float _542 = in.m_79.x;
    float _544 = in.m_79.y;
    float _546 = in.m_79.z;
    float _548 = fma(_186, _380, _426);
    int _550 = ~_516;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _368 + _556;
    float _560 = floor(_518);
    int _562 = _554;
    if (_530)
    {
        float _564 = _536 * _512;
        _162 = _564;
    }
    float _566 = _162;
    float _568 = _424 + _386;
    float _570 = _424 + _412;
    float _572 = _412 + (-0.5);
    bool _574 = _534 > 0.0;
    float _576 = _568 + (-1.0);
    if (!_540)
    {
        int _578 = ~_516;
        int _580 = _578 + 1;
        _562 = _580;
    }
    int _582 = _562;
    float _584 = _570 + (-1.0);
    bool _586 = _534 >= 0.0;
    bool _588 = isnan(_534);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _604 = _594 ? 0 : 1;
    float _606 = in.m_73.x;
    float _608 = _600 * _478;
    int _610 = ~_604;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    int _616 = _614;
    if (!_574)
    {
        int _618 = ~_604;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _628 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _630 = _560 >= 0.0;
    bool _632 = isnan(_560);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = fma(_608, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _642 = _626 * _628;
    float _644 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _646 = !_448;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    bool _652 = !_452;
    int _654 = _652 ? 0 : 1;
    float _656 = _644 * _392;
    bool _658 = !_456;
    int _660 = _658 ? 0 : 1;
    float _662 = in.m_81.x;
    float _664 = in.m_81.y;
    float _666 = in.m_81.z;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[203].x, _656);
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    bool _684 = _560 > 0.0;
    float _686 = _650 * _624;
    float _688 = floor(_680);
    bool _690 = !_670;
    int _692 = _690 ? 0 : 1;
    float _694 = _682 * _532;
    float _696 = float(_582);
    int _698 = abs(_692);
    float _700 = _680 + 0.25;
    bool _702 = !_678;
    int _704 = _702 ? 0 : 1;
    int _706 = _638 ? 0 : 1;
    float _708 = floor(_700);
    int _710 = abs(_704);
    bool _712 = !_674;
    int _714 = _712 ? 0 : 1;
    float _716 = float(_622);
    float _718 = -_688;
    float _720 = _680 + _718;
    float _722 = float(_710);
    float _724 = _680 * 6.283185482025146484375;
    int _726 = ~_706;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _730;
    bool _734 = _638;
    bool _736 = _670;
    float _738 = _624;
    int _740 = _706;
    if (!_684)
    {
        int _742 = ~_706;
        int _744 = _742 + 1;
        _732 = _744;
    }
    int _746 = _732;
    float _748 = _722 * _716;
    int _750 = abs(_714);
    float _752 = float(_698);
    float _754 = -_708;
    float _756 = _700 + _754;
    bool _758 = _720 >= 0.5;
    bool _760 = isnan(_720);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.5);
    bool _766 = _762 || _764;
    int _768 = abs(_654);
    float _770 = _724 * 0.15915493667125701904296875;
    float _772 = _752 * _696;
    float _774 = float(_746);
    float _776 = float(_750);
    float _778 = _770 * 6.283185482025146484375;
    float _780 = sin(_778);
    bool _782 = !_766;
    float _784 = _782 ? 0.5 : (-0.5);
    float _786 = _772 * (-2.0);
    bool _788 = _756 > 0.5;
    float _790 = _776 * _774;
    float _792 = _748 * (-2.0);
    int _794 = abs(_648);
    float _796 = _784 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _798 = _796 * 2.0;
    float _800 = float(_768);
    float _802 = fma(_792, _666, _666);
    float _804 = fma(_596, _792, _596);
    float _806 = _756;
    if (_390)
    {
        bool _808 = _386 > 0.5;
        _734 = _808;
    }
    bool _810 = _734;
    float _812 = _386 + (-0.5);
    int _814 = abs(_660);
    if (_788)
    {
        float _816 = -_756;
        float _818 = _816 + 1.0;
        _806 = _818;
    }
    float _820 = _806;
    float _822 = float(_794);
    float _824 = _800 * _798;
    float _826 = _780 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _802);
    float _830 = fma(_820, 4.0, -1.0);
    float _832 = fma(_822, _826, _824);
    float _834 = _790 * (-2.0);
    float _836 = float(_814);
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _840 = fma(_804, _566, _828);
    float _842 = fma(_834, _664, _664);
    float _844 = fma(_538, _834, _538);
    float _846 = fma(_836, _838, _832);
    float _848 = _840 * 0.15915493667125701904296875;
    float _850 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _852 = fma(_602, _786, _602);
    float _854 = fma(_846, 3.1415927410125732421875, _662);
    bool _856 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _858 = isnan(_368);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = fma(_844, _566, _850);
    float _870 = _780;
    float _872 = _848;
    if (_384)
    {
        bool _874 = _424 > 0.5;
        _736 = _874;
    }
    bool _876 = _736;
    float _878 = in.m_83.x;
    float _880 = in.m_83.y;
    float _882 = in.m_83.z;
    float _884 = fma(_854, _786, _854);
    float _886 = _424 + (-0.5);
    bool _888 = _544 != 0.0;
    bool _890 = isnan(_544);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = -_866;
    float _900 = _898 + 1.0;
    bool _902 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _904 = isnan(_368);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[196].x, _884);
    bool _916 = _542 == 0.0;
    bool _918 = !_896;
    bool _920 = _916 && _918;
    int _922 = as_type<int>(_886);
    if (_384)
    {
        float _924 = -_606;
        float _926 = _924 + 1.0;
        _922 = as_type<int>(_926);
    }
    int _928 = _922;
    int _930 = _928;
    if (!_384)
    {
        _738 = _606;
    }
    float _932 = _738;
    float _934 = _912 * _900;
    float _936 = fma(_852, _566, _914);
    bool _938 = _546 == 0.0;
    bool _940 = _938 && _920;
    float _942 = in.m_85.x;
    float _944 = in.m_85.y;
    float _946 = in.m_85.z;
    float _948 = in.m_85.w;
    float _950 = _932;
    float _952 = _936;
    if (_384)
    {
        float _954 = _876 ? as_type<float>(_928) : _606;
        _950 = _954;
    }
    float _956 = _950;
    float _958 = _936 * 0.15915493667125701904296875;
    float _960 = _868 * 0.15915493667125701904296875;
    if (_390)
    {
        float _962 = -_606;
        float _964 = _962 + 1.0;
        _930 = as_type<int>(_964);
    }
    int _966 = _930;
    float _968 = _848 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = _640 * _934;
    float _974 = -_912;
    float _976 = _974 + 1.0;
    float _978 = _976;
    float _980 = as_type<float>(_966);
    float _982 = _972;
    if (!_390)
    {
        _952 = _606;
    }
    float _984 = _952;
    float _986 = _984;
    if (_390)
    {
        float _988 = _810 ? as_type<float>(_966) : _606;
        _986 = _988;
    }
    float _990 = _986;
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[115].x, _972);
    float _994 = _990;
    if (_940)
    {
        _870 = _880;
    }
    float _996 = _870;
    float _998 = _848 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = _996;
    if (_940)
    {
        _978 = _882;
    }
    float _1004 = _978;
    float _1006 = _1004;
    if (!_940)
    {
        float _1008 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _1006 = _1008;
    }
    float _1010 = _1006;
    if (_940)
    {
        _980 = _996;
    }
    float _1012 = _980;
    float _1014 = _1012;
    if (!_940)
    {
        _1002 = _880;
    }
    float _1016 = _1002;
    float _1018 = _958 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    if (_940)
    {
        _872 = _878;
    }
    float _1022 = _872;
    float _1024 = _1022;
    if (!_940)
    {
        float _1026 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1016);
        _1014 = _1026;
    }
    float _1028 = _1014;
    float _1030 = _944 * _882;
    if (_940)
    {
        _982 = _1022;
    }
    float _1032 = _982;
    float _1034 = _1032;
    if (!_940)
    {
        _1024 = _878;
    }
    float _1036 = _1024;
    float _1038 = _958 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    float _1042 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[116].x, _992);
    float _1044 = _1042;
    if (!_940)
    {
        float _1046 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1036);
        _1034 = _1046;
    }
    float _1048 = _1034;
    float _1050 = _942 * _1016;
    float _1052 = -_1030;
    float _1054 = fma(_946, _1016, _1052);
    float _1056 = _946 * _1036;
    float _1058 = _960 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1020 * _970;
    float _1064 = -_1050;
    float _1066 = fma(_944, _1036, _1064);
    float _1068 = -_1056;
    float _1070 = fma(_942, _882, _1068);
    float _1072 = _510 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1074 = _1070 * _948;
    float _1076 = _960 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _1040 * _1000;
    float _1082 = _970 * _1060;
    float _1084 = _1000 * _1060;
    float _1086 = _1040 * _970;
    float _1088 = _1020 * _1000;
    float _1090 = _1020 * _1060;
    float _1092 = _1040 * _1060;
    float _1094 = fma(_1078, _1062, _1080);
    float _1096 = -_1086;
    float _1098 = fma(_1078, _1088, _1096);
    float _1100 = fma(_1078, _1080, _1062);
    float _1102 = _1090 * _642;
    float _1104 = _1094 * _642;
    float _1106 = _1098 * _642;
    float _1108 = -_1088;
    float _1110 = fma(_1078, _1086, _1108);
    float _1112 = -_1078;
    float _1114 = fma(_1112, _686, _1102);
    float _1116 = fma(_1082, _686, _1104);
    float _1118 = fma(_1084, _686, _1106);
    float _1120 = _1054 * _948;
    float _1122 = fma(_1092, _694, _1114);
    float _1124 = fma(_1110, _694, _1116);
    float _1126 = fma(_1100, _694, _1118);
    float _1128 = _1066 * _948;
    float _1130 = _486 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1132 = _1124 * _318;
    float _1134 = _1124 * _326;
    float _1136 = _1090 * _1028;
    float _1138 = _1090 * _944;
    float _1140 = fma(_1126, _296, _1132);
    float _1142 = fma(_1126, _304, _1134);
    float _1144 = _1090 * _1074;
    float _1146 = _1098 * _944;
    float _1148 = fma(_1122, _330, _1140);
    float _1150 = fma(_1122, _338, _1142);
    float _1152 = _1094 * _944;
    float _1154 = _1094 * _1028;
    float _1156 = _1130 + _1148;
    float _1158 = _1072 + _1150;
    float _1160 = _1098 * _1028;
    float _1162 = _1098 * _1074;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1156 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1158 + _1168;
    float _1172 = _1094 * _1074;
    float _1174 = -_1078;
    float _1176 = fma(_1174, _1048, _1136);
    float _1178 = _1166 * _1166;
    float _1180 = _1170 * _1170;
    float _1182 = fma(_1084, _1048, _1160);
    float _1184 = fma(_1082, _1048, _1154);
    float _1186 = fma(_1084, _942, _1146);
    float _1188 = _1178 + _1180;
    float _1190 = fma(_1084, _1120, _1162);
    float _1192 = -_1078;
    float _1194 = fma(_1192, _942, _1138);
    float _1196 = -_1078;
    float _1198 = fma(_1196, _1120, _1144);
    float _1200 = sqrt(_1188);
    float _1202 = fma(_1082, _942, _1152);
    float _1204 = fma(_1082, _1120, _1172);
    float _1206 = fma(_1092, _1010, _1176);
    float _1208 = fma(_1100, _1010, _1182);
    float _1210 = fma(_1110, _1010, _1184);
    float _1212 = fma(_1100, _946, _1186);
    float _1214 = fma(_1100, _1128, _1190);
    float _1216 = _1124 * _322;
    float _1218 = fma(_1110, _946, _1202);
    float _1220 = fma(_1110, _1128, _1204);
    float _1222 = fma(_1092, _1128, _1198);
    float _1224 = fma(_1126, _300, _1216);
    float _1226 = _1218 * _318;
    float _1228 = _1218 * _322;
    float _1230 = _1210 * _318;
    bool _1232 = _1200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1210 * _322;
    float _1236 = fma(_1092, _946, _1194);
    float _1238 = _1218 * _326;
    float _1240 = _1210 * _326;
    float _1242 = _1220 * _326;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = fma(_1122, _334, _1224);
    float _1248 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1250 = _1220 * _318;
    float _1252 = _1220 * _322;
    float _1254 = fma(_1212, _296, _1226);
    float _1256 = _1248 + _1246;
    float _1258 = _1092;
    float _1260 = _1180;
    float _1262 = _1178;
    float _1264 = _1212;
    float _1266 = _1238;
    float _1268 = _1072;
    if (!_1232)
    {
        _1258 = _1180;
    }
    float _1270 = _1258;
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1274 = fma(_1212, _300, _1228);
    float _1276 = fma(_1212, _304, _1238);
    float _1278 = _1270;
    if (!_1232)
    {
        _1260 = _1178;
    }
    float _1280 = _1260;
    float _1282 = _1280;
    if (!_1232)
    {
        _1262 = _1156;
    }
    float _1284 = _1262;
    float _1286 = _1284;
    if (!_1232)
    {
        _1264 = _1158;
    }
    float _1288 = _1264;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1292 = _1288;
    if (!_1232)
    {
        _1266 = _1256;
    }
    float _1294 = _1266;
    bool _1296 = !_1232;
    float _1298 = _1294;
    if (!_1296)
    {
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1304 = _1200 + _1302;
        float _1306 = _1256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = rsqrt(_1188);
        float _1310 = _1304 * _1300;
        float _1312 = _1310 * 0.15915493667125701904296875;
        float _1314 = _1312 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1312 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = fma(_1316, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1324 = _1308 * _1322;
        float _1326 = _1320 + (-1.0);
        float _1328 = fma(_1166, _1324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1330 = fma(_1170, _1324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1336 = _1328 + _1334;
        float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1340 = _1330 + _1338;
        float _1342 = fma(_1256, _1320, _1332);
        float _1344 = _1336 * _1336;
        float _1346 = _1340 * _1340;
        _1298 = _1342;
        _1282 = _1344;
        _1278 = _1346;
        _1286 = _1328;
        _1292 = _1330;
    }
    float _1348 = _1298;
    float _1350 = _1282;
    float _1352 = _1278;
    float _1354 = _1286;
    float _1356 = _1292;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1360 = _1348 + _1358;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = _464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1366 = fma(_1208, _296, _1230);
    float _1368 = fma(_1360, _1360, _1350);
    float _1370 = fma(_1208, _300, _1234);
    float _1372 = fma(_1208, _304, _1240);
    float _1374 = fma(_1214, _300, _1252);
    float _1376 = _1368 + _1352;
    float _1378 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = _1364 * _1290;
    float _1384 = fma(_1214, _296, _1250);
    float _1386 = _1380 * _1244;
    float _1388 = sqrt(_1376);
    float _1390 = fma(_1214, _304, _1242);
    float _1392 = fma(_1236, _334, _1274);
    float _1394 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1402 = _1378 * _1272;
    float _1404 = fma(_1236, _338, _1276);
    float _1406 = fma(_1236, _330, _1254);
    float _1408 = fma(_1206, _330, _1366);
    float _1410 = fma(_1222, _330, _1384);
    float _1412 = fma(_1206, _334, _1370);
    float _1414 = _1394 * _1362;
    float _1416 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1424 = fma(_1222, _334, _1374);
    float _1426 = fma(_1222, _338, _1390);
    float _1428 = fma(_1206, _338, _1372);
    out.m_87.x = _1386;
    out.m_87.y = _1402;
    out.m_87.z = _1414;
    out.m_87.w = _1382;
    bool _1430 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1432 = isnan(_1388);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1438 = _1434 || _1436;
    out.m_89.x = _1416;
    out.m_89.y = _1418;
    out.m_89.z = _1420;
    out.m_89.w = _1422;
    out.m_91.x = _1406;
    out.m_91.y = _1392;
    out.m_91.z = _1404;
    out.m_93.x = _1410;
    out.m_93.y = _1424;
    out.m_93.z = _1426;
    int _1440 = as_type<int>(_1362);
    if (!_1438)
    {
        _1044 = 1.0;
    }
    float _1442 = _1044;
    out.m_95.x = _1408;
    out.m_95.y = _1412;
    out.m_95.z = _1428;
    bool _1444 = !_1438;
    float _1446 = _1442;
    if (!_1444)
    {
        bool _1448 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1450 = isnan(_1388);
        bool _1452 = _1448 || _1450;
        bool _1454 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1456 = _1452 || _1454;
        if (!_1456)
        {
            float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1460 = _1388 + _1458;
            float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1464 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1462;
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1468 = _1466 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1470 = 1.0 / _1464;
            float _1472 = _1460 * _1470;
            float _1474 = fma(_1472, _1468, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1446 = _1474;
            _1476 = true;
        }
        else
        {
            bool _1478 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1480 = isnan(_1388);
            bool _1482 = _1478 || _1480;
            bool _1484 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1486 = _1482 || _1484;
            if (!_1486)
            {
                float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1490 = _1388 + _1488;
                float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1494 = _1492 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1498 = _1496 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1500 = 1.0 / _1494;
                float _1502 = _1490 * _1500;
                float _1504 = fma(_1502, _1498, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1446 = _1504;
                _1476 = true;
            }
            else
            {
                _1446 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1476 = false;
    float _1506 = _1446;
    float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1510 = _1348 + _1508;
    float _1512 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1354 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1356 + _1518;
    float _1522 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1512);
    float _1526 = fma(_1516, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1528 = fma(_1520, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1522 + _1530;
    float _1534 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1524);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1526 + _1536;
    float _1540 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1542 = _1532 * _1532;
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1548 = _1528 + _1546;
    float _1550 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1540);
    float _1552 = fma(_1538, _1538, _1542);
    float _1554 = 1.0 / _1544;
    float _1556 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1550);
    float _1558 = fma(_1548, _1548, _1552);
    float _1560 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1562 = rsqrt(_1558);
    float _1564 = _1560 + _1544;
    float _1566 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1568 = _1248 + _1566;
    float _1570 = _1564 * _1554;
    float _1572 = _1570 * 0.5;
    float _1574 = sqrt(_1558);
    float _1576 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1578 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
    float _1584 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1578);
    float _1586 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1588 = 1.0 / _1582;
    float _1590 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1584);
    float _1592 = _1538 * _1586;
    float _1594 = _1548 * _1586;
    float _1596 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1598 = _1592 * _1592;
    float _1600 = _1594 * _1594;
    float _1602 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1604 = trunc(_1596);
    int _1606 = int(_1604);
    float _1608 = _1598 + _1600;
    float _1610 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1602);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1614 = _1588 * _1612;
    float _1616 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1610);
    float _1618 = sqrt(_1608);
    bool _1620 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1622 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1624 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1626 = !_1620;
    int _1628 = _1626 ? 0 : 1;
    float _1630 = trunc(_1622);
    int _1632 = int(_1630);
    bool _1634 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1638 = _1618 + _1636;
    int _1640 = 2;
    float _1642 = _1638;
    int _1644 = as_type<int>(_1532);
    float _1646 = _1592;
    float _1648 = _1594;
    float _1650 = _1598;
    float _1652 = _1600;
    float _1654 = _1614;
    if (!_1620)
    {
        _1640 = 1;
    }
    int _1656 = _1640;
    float _1658 = floor(_1576);
    int _1660 = _1656;
    if (!_1624)
    {
        _1660 = _1628;
    }
    int _1662 = _1660;
    int _1664 = _1662 << 6;
    int _1666 = _1664 + 96;
    uint _1669 = uint(int(uint(_1666) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.vp_c15)._m0[int(_1679)][_1681];
    float _1685 = _1402;
    float _1687 = as_type<float>(_1662);
    if (_1634)
    {
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1685 = _1689;
    }
    float _1691 = _1685;
    float _1693 = -_1658;
    float _1695 = _1576 + _1693;
    int _1697 = _1664 + 104;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    if (_1634)
    {
        float _1715 = _1638 * _1691;
        _1642 = _1715;
    }
    float _1717 = _1642;
    int _1719 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1721 = _1606 + _1719;
    int _1723 = _1721 + 1;
    if (_1634)
    {
        float _1725 = _1717 * 0.15915493667125701904296875;
        _994 = _1725;
    }
    float _1727 = _994;
    int _1729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1731 = _1632 + _1729;
    int _1733 = _1731 + 1;
    float _1735 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = _1410;
    if (_1634)
    {
        float _1739 = _1727 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        _1737 = _1741;
    }
    float _1743 = _1737;
    bool _1745 = _1733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1747 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    int _1749 = _1733 | _1723;
    float _1751 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    bool _1753 = _1749 < 0;
    bool _1755 = _1753 || _1745;
    float _1757 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1759 = _1424;
    if (_1634)
    {
        float _1761 = _1727 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        _1759 = _1763;
    }
    float _1765 = _1759;
    float _1767 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1769 = _1723 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1771 = _1769 || _1755;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1775 = precise::max(0.0, _1757);
    float _1777 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = _1751;
    float _1781 = _1773;
    if (_1634)
    {
        float _1783 = rsqrt(_1608);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = -_1586;
    float _1789 = -_1775;
    float _1791 = fma(_1532, _1787, _1789);
    float _1793 = -_1777;
    float _1795 = fma(_1793, _1773, 1.0);
    float _1797 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1799 = _1791;
    if (_1634)
    {
        float _1801 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1781 = _1801;
    }
    float _1803 = _1781;
    float _1805 = _1568 * _1683;
    float _1807 = _1683;
    float _1809 = _1803;
    if (!_1771)
    {
        int _1811 = _1723 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1813 = _1811 + _1733;
        _1644 = _1813;
    }
    int _1815 = _1644;
    float _1817 = as_type<float>(_1815);
    if (_1634)
    {
        float _1819 = _1743 + (-1.0);
        _1807 = _1819;
    }
    float _1821 = _1807;
    float _1823 = _1821;
    if (_1634)
    {
        float _1825 = fma(_1765, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1809 = _1825;
    }
    float _1827 = _1809;
    int _1829 = _1664 + 48;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    uint _1833 = uint(int(uint(int(_1831)) >> uint(2)));
    int _1835 = int(_1831) & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = int(_1831) + 1;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    int _1843 = _1839 & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    float _1847 = fma(_1130, _1675, _1805);
    if (_1634)
    {
        float _1849 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1823 = _1849;
    }
    float _1851 = _1823;
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1855 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1853);
    float _1857 = precise::clamp(_1855, 0.0, 1.0);
    float _1859 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1797);
    float _1861 = fma(_1072, _1705, _1847);
    float _1863 = _1785;
    if (_1634)
    {
        float _1865 = _1785 * _1827;
        _1863 = _1865;
    }
    float _1867 = _1863;
    if (_1634)
    {
        float _1869 = fma(_1791, _1743, _1851);
        _1799 = _1869;
    }
    float _1871 = _1799;
    int _1873 = _1664 + 64;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    uint _1877 = uint(int(uint(int(_1875)) >> uint(2)));
    int _1879 = int(_1875) & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    int _1883 = int(_1875) + 1;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    int _1887 = _1883 & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    if (_1634)
    {
        float _1891 = _1592 * _1867;
        _1646 = _1891;
    }
    float _1893 = _1646;
    if (_1634)
    {
        float _1895 = _1594 * _1867;
        _1648 = _1895;
    }
    float _1897 = _1648;
    float _1899 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1901 = -_1857;
    float _1903 = _1901 + 1.0;
    if (_1634)
    {
        float _1905 = _1893 * _1893;
        _1650 = _1905;
    }
    float _1907 = _1650;
    float _1909 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1911 = _1664 + 56;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    uint _1915 = uint(int(uint(int(_1913)) >> uint(2)));
    int _1917 = int(_1913) & 3;
    float _1919 = (*spvDescriptorSet0.vp_c15)._m0[int(_1915)][_1917];
    int _1921 = int(_1913) + 1;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    int _1925 = _1921 & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    float _1929 = _1909;
    if (_1634)
    {
        float _1931 = _1897 * _1897;
        _1652 = _1931;
    }
    float _1933 = _1652;
    float _1935 = fma(_1871, _1871, _1907);
    float _1937 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1939 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1899);
    if (!_1771)
    {
        int _1941 = _1815 << 2;
        _1440 = _1941;
    }
    int _1943 = _1440;
    float _1945 = _1935 + _1933;
    float _1947 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1937);
    int _1949 = _1664 + 72;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    uint _1953 = uint(int(uint(int(_1951)) >> uint(2)));
    int _1955 = int(_1951) & 3;
    float _1957 = (*spvDescriptorSet0.vp_c15)._m0[int(_1953)][_1955];
    int _1959 = int(_1951) + 1;
    uint _1961 = uint(int(uint(_1959) >> uint(2)));
    int _1963 = _1959 & 3;
    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[int(_1961)][_1963];
    float _1967 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1939);
    int _1969 = _1943;
    if (!_1771)
    {
        uint _1971 = uint(int(uint(_1815) >> uint(2)));
        _740 = int(_1971);
    }
    int _1973 = _740;
    float _1975 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1947);
    if (!_1771)
    {
        int _1977 = 12 & _1943;
        _1969 = _1977;
    }
    int _1979 = _1969;
    float _1981 = _1967 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1983 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1859);
    float _1985 = _1975 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1987 = _1664 + 80;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
    int _1993 = int(_1989) & 3;
    float _1995 = (*spvDescriptorSet0.vp_c15)._m0[int(_1991)][_1993];
    int _1997 = int(_1989) + 1;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    int _2001 = _1997 & 3;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[int(_1999)][_2001];
    float _2005 = _1861 + _1713;
    float _2007 = rsqrt(_1945);
    float _2009 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2011 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2013 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2009);
    int _2015 = _1664 + 88;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    uint _2019 = uint(int(uint(int(_2017)) >> uint(2)));
    int _2021 = int(_2017) & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    int _2025 = int(_2017) + 1;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    int _2029 = _2025 & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    float _2033 = _2009;
    if (!_1771)
    {
        int _2035 = _1973 << 4;
        int _2037 = _2035 + _1979;
        _2033 = as_type<float>(_2037);
    }
    float _2039 = _2033;
    float _2041 = 1.0 / _2005;
    float _2043 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2013);
    float _2045 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2043);
    float _2047 = _1568 * _1845;
    float _2049 = _2039;
    if (!_1771)
    {
        int _2051 = as_type<int>(_2039) + 400;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        uint _2055 = uint(int(uint(int(_2053)) >> uint(2)));
        int _2057 = int(_2053) & 3;
        float _2059 = (*spvDescriptorSet0.vp_c15)._m0[int(_2055)][_2057];
        _2049 = _2059;
    }
    float _2061 = _2049;
    float _2063 = _2007 * _1893;
    float _2065 = _2007 * _1871;
    float _2067 = fma(_1130, _1837, _2047);
    float _2069 = _2007 * _1897;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2073 = floor(_1909);
    float _2075 = _1568 * _1889;
    float _2077 = fma(_1130, _1881, _2075);
    float _2079 = abs(_1903);
    float _2081 = log2(_2079);
    float _2083 = fma(_1072, _1919, _2067);
    float _2085 = _2083 + _1927;
    float _2087 = -_2071;
    float _2089 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = _1927;
    if (!_1771)
    {
        float _2093 = floor(_1596);
        _2091 = _2093;
    }
    float _2095 = _2091;
    float _2097 = fma(_1072, _1957, _2077);
    float _2099 = _2085 * _2041;
    float _2101 = -_2069;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2105 = -_2073;
    float _2107 = _1909 + _2105;
    float _2109 = _2097 + _1965;
    bool _2111 = _2099 >= 0.0;
    float _2113 = fma(_2103, -0.5, 0.5);
    float _2115 = _2109 * _2041;
    float _2117 = _1568 * _2003;
    bool _2119 = _2099 <= 1.0;
    bool _2121 = _2119 && _2111;
    float _2123 = fma(_2103, 0.5, 0.5);
    float _2125 = fma(_1130, _1995, _2117);
    bool _2127 = _2115 >= 0.0;
    bool _2129 = _2127 && _2121;
    float _2131 = sqrt(_2113);
    if (!_1771)
    {
        float _2133 = -_2095;
        float _2135 = _1596 + _2133;
        _1929 = _2135;
    }
    float _2137 = _1929;
    float _2139 = fma(_1072, _2023, _2125);
    bool _2141 = _2115 <= 1.0;
    bool _2143 = _2141 && _2129;
    float _2145 = fma(_2123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2147 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = _2139 + _2031;
    float _2151 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2153 = fma(_2123, _2145, -0.212114393711090087890625);
    float _2155 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2157 = 1.0 / _2045;
    float _2159 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2151);
    float _2161 = fma(_2123, _2153, 1.570728778839111328125);
    float _2163 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2155);
    float _2165 = _2065 + 1.0;
    float _2167 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2159);
    float _2169 = _2155;
    if (_2143)
    {
        float _2171 = float(_1662);
        _1687 = _2171;
    }
    float _2173 = _1687;
    float _2175 = _2131 * 0.636619746685028076171875;
    float _2177 = exp2(_2147);
    float _2179 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2163);
    float _2181 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2167);
    float _2183 = -_2161;
    float _2185 = fma(_2175, _2183, 1.0);
    float _2187 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2179);
    float _2189 = log2(_1795);
    float _2191 = _2187 * _2157;
    float _2193 = _2181 * _2157;
    float _2195 = fma(_2191, -0.5, 0.5);
    float _2197 = fma(_2193, 0.5, 0.5);
    float _2199 = _2069;
    float _2201 = _2181;
    if (!_1771)
    {
        float _2203 = floor(_1622);
        _2199 = _2203;
    }
    float _2205 = _2199;
    float _2207 = -_2065;
    float _2209 = fma(_2177, _2165, _2207);
    float _2211 = _2149 * _2041;
    float _2213 = fma(_2209, 0.5, 0.5);
    float _2215 = _2139;
    if (!_1771)
    {
        float _2217 = rint(_2061);
        float _2219 = precise::max(_2217, 0.0);
        uint _2221 = uint(_2219);
        uint _2223 = clamp(_2221, 0u, 65535u);
        _2215 = as_type<float>(_2223);
    }
    float _2225 = _2215;
    float _2227 = _2189 * 0.693147182464599609375;
    float _2229 = _2163;
    if (_2143)
    {
        float _2231 = rint(_2173);
        float _2233 = precise::max(_2231, 0.0);
        uint _2235 = uint(_2233);
        uint _2237 = clamp(_2235, 0u, 65535u);
        _2229 = as_type<float>(_2237);
    }
    float _2239 = _2229;
    if (!_1771)
    {
        float _2241 = -_2205;
        float _2243 = _1622 + _2241;
        _2169 = _2243;
    }
    float _2245 = _2169;
    float _2247 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6371 = float2(_2107, _1695);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6371, float2(0.0), isnan(_6371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6371, float2(0.0), isnan(_6371)), level(0.0)).x;
    float _2251 = _2225;
    if (!_1771)
    {
        float3 _6388 = float3(_2245, _2137, float(as_type<int>(_2225)));
        float3 _6392 = select(_6388, float3(0.0), isnan(_6388));
        float _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6392.xy, uint(rint(_6392.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6392.xy, uint(rint(_6392.z)), level(0.0)).x;
        _2251 = _2253;
    }
    float _2255 = _2251;
    float _2257 = _2115;
    if (_2143)
    {
        float3 _6407 = float3(_2099, _2115, float(as_type<int>(_2239)));
        float3 _6409 = select(_6407, float3(0.0), isnan(_6407));
        float _2259 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6409.xy, uint(rint(_6409.z)), _2211, level(0.0));
        _2257 = _2259;
    }
    float _2261 = _2257;
    float3 _6419 = float3(_2197, _2195, _2247);
    float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6419, float3(0.0), isnan(_6419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6419, float3(0.0), isnan(_6419)), level(0.0)).x;
    float3 _6428 = float3(_2197, _2195, _2247);
    float4 _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6428, float3(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6428, float3(0.0), isnan(_6428)), level(0.0)).xyzw;
    float _2268 = _2266.x;
    float _2270 = _2266.y;
    float _2272 = _2266.z;
    float _2274 = _2266.w;
    float2 _6444 = float2(_2185, _2213);
    float3 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6444, float2(0.0), isnan(_6444)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6444, float2(0.0), isnan(_6444)), level(0.0)).xyz;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = abs(_1614);
    float _2288 = log2(_2286);
    float _2290 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2292 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2294 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2290);
    float _2296 = exp2(_2292);
    float _2298 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2294);
    float _2300 = _2045 * 0.5;
    float _2302 = _2181 + _2045;
    float _2304 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2298);
    float _2306 = _2302 * 0.5;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2310 = _2304 + _2045;
    float _2312 = fma(_2187, -0.5, _2300);
    out.gl_Position.x = _2181;
    out.gl_Position.y = _2187;
    out.gl_Position.z = _2304;
    out.gl_Position.w = _2045;
    float _2314 = _2310 * 0.5;
    float _2316 = exp2(_2308);
    out.m_97.x = _2306;
    out.m_97.y = _2312;
    out.m_97.z = _2314;
    out.m_97.w = _2045;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = fma(_2320, -2.0, 3.0);
    float _2324 = _2320 * _2320;
    bool _2326 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.5);
    bool _2334 = _2330 || _2332;
    float _2336 = _2324 * _2322;
    bool _2338 = _1614 <= 8000.0;
    bool _2340 = isnan(_1614);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan(8000.0);
    bool _2346 = _2342 || _2344;
    float _2348 = float(_2346);
    float _2350 = -_2336;
    float _2352 = _2350 + 1.0;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2336);
    float _2356 = _2348;
    if (_2334)
    {
        _2201 = 1.0;
    }
    float _2358 = _2201;
    float _2360 = _2348 * _2354;
    float _2362 = _2358;
    float _2364 = _2360;
    if (_2334)
    {
        _2356 = 1.0;
    }
    float _2366 = _2356;
    float _2368 = _2366;
    if (!_2334)
    {
        float _2370 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2374 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2372;
        float _2376 = _2370 * 0.15915493667125701904296875;
        float _2378 = _2376 * 6.283185482025146484375;
        float _2380 = cos(_2378);
        float _2382 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2384 = _2382 * 0.15915493667125701904296875;
        float _2386 = _2376 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        float _2390 = 1.0 / _2380;
        float _2392 = _2384 * 6.283185482025146484375;
        float _2394 = cos(_2392);
        float _2396 = _2388 * _2390;
        float _2398 = _2384 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        float _2402 = _2394 * _2396;
        float _2404 = 1.0 / _2374;
        float _2406 = 1.0 / _2402;
        float _2408 = _2400 * _2406;
        float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2412 = fma(_1614, _2408, _2410);
        float _2414 = _2412 * _2404;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        _2362 = _2416;
    }
    float _2418 = _2362;
    if (!_2334)
    {
        float _2420 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2422 = _2420 * 0.15915493667125701904296875;
        float _2424 = _2422 * 6.283185482025146484375;
        float _2426 = cos(_2424);
        float _2428 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2422 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = 1.0 / _2426;
        float _2438 = _2430 * 6.283185482025146484375;
        float _2440 = cos(_2438);
        float _2442 = _2434 * _2436;
        float _2444 = _2430 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2440 * _2442;
        float _2450 = 1.0 / _2448;
        float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2452;
        float _2456 = 1.0 / _2454;
        float _2458 = _2446 * _2450;
        float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2462 = fma(_1614, _2458, _2460);
        float _2464 = _2462 * _2456;
        float _2466 = precise::clamp(_2464, 0.0, 1.0);
        float _2468 = -_2466;
        float _2470 = _2468 + 1.0;
        _1654 = _2466;
        _2368 = _2470;
    }
    float _2472 = _1654;
    float _2474 = _2368;
    float _2476 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2478 = -_2249;
    float _2480 = _2478 + 1.0;
    float _2482 = -_2296;
    float _2484 = _2482 + 1.0;
    float _2486 = _2472;
    if (!_2143)
    {
        _2364 = 1.0;
    }
    float _2488 = _2364;
    float _2490 = _2480 * _2476;
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = _2488;
    if (_2143)
    {
        bool _2496 = _2261 >= _2211;
        bool _2498 = isnan(_2261);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan(_2211);
        bool _2504 = _2500 || _2502;
        float _2506 = float(_2504);
        _2494 = _2506;
    }
    float _2508 = _2494;
    float _2510 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1771)
    {
        _2486 = 1.0;
    }
    float _2512 = _2486;
    float _2514 = _2512;
    if (!_1771)
    {
        int _2516 = _1815 << 4;
        int _2518 = _2516 + 2048;
        uint _2520 = uint(int(uint(_2518) >> uint(2)));
        uint _2522 = uint(int(uint(int(_2520)) >> uint(2)));
        int _2524 = int(_2520) & 3;
        float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
        int _2528 = int(_2520) + 1;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        int _2532 = _2528 & 3;
        float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
        int _2536 = _2518 + 8;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        uint _2540 = uint(int(uint(int(_2538)) >> uint(2)));
        int _2542 = int(_2538) & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = int(_2538) + 1;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        int _2550 = _2546 & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        float _2554 = _1568 * _2534;
        float _2556 = fma(_1130, _2526, _2554);
        float _2558 = fma(_1072, _2544, _2556);
        float _2560 = _2558 + _2552;
        float _2562 = precise::clamp(_2560, 0.0, 1.0);
        float _2564 = -_2562;
        float _2566 = _2564 + _2255;
        float _2568 = fma(_2566, 500.0, 1.5);
        float _2570 = exp2(_2568);
        float _2572 = 0.0 + _2570;
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        _2514 = _2574;
        _1817 = as_type<float>(_2518);
    }
    float _2576 = _2514;
    float _2578 = _1817;
    float _2580 = _2508 * _2576;
    float _2582 = _2510 * _2263;
    float _2584 = -_2492;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2588 = -_2510;
    float _2590 = _2588 + 1.0;
    out.m_99.x = _1526;
    out.m_99.y = _1522;
    out.m_99.z = _1528;
    float _2592 = _2274 * _2582;
    float _2594 = -_2580;
    float _2596 = fma(_2594, _2586, 1.0);
    float _2598 = precise::clamp(_2596, 0.0, 1.0);
    float _2600 = _2284 * _2582;
    float _2602 = _2274 * _2590;
    float _2604 = fma(_2280, _2592, _2268);
    float _2606 = fma(_2282, _2592, _2270);
    float _2608 = _2598 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2610 = fma(_2274, _2600, _2272);
    bool _2612 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2614 = isnan(_1574);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2620 = _2616 || _2618;
    float _2622 = _2418 * _2474;
    out.m_101.x = _2608;
    float _2624 = _2622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2604;
    out.m_103.y = _2606;
    out.m_103.z = _2610;
    out.m_103.w = _2602;
    float _2626 = _2578;
    float _2628 = _2590;
    float _2630 = _2580;
    float _2632 = _2592;
    float _2634 = _2598;
    if (!_2620)
    {
        _1268 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2636 = _1268;
    float _2638 = _2636;
    float _2640 = _2636;
    if (!_2620)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2642 = _2626;
    float _2644 = _2642;
    float _2646 = _2642;
    if (!_2620)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _2628;
    float _2650 = _2648;
    float _2652 = _2648;
    if (!_2620)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2654 = _2630;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2620)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2660 = _2632;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2620)
    {
        _2634 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2634;
    bool _2668 = !_2620;
    float _2670 = _2666;
    float _2672 = _2666;
    if (!_2668)
    {
        bool _2674 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2676 = isnan(_1574);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2682 = _2678 || _2680;
        if (!_2682)
        {
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2686 = _1574 + _2684;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2688;
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2696 = 1.0 / _2690;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2714 = _2686 * _2696;
            float _2716 = precise::clamp(_2714, 0.0, 1.0);
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2722 = fma(_2716, _2694, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2724 = fma(_2716, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2726 = fma(_2716, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2728 = fma(_2716, _2704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2730 = fma(_2716, _2708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2732 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2646 = _2722;
            _2664 = _2730;
            _2640 = _2726;
            _2658 = _2728;
            _2652 = _2724;
            _2672 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2738 = isnan(_1574);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2746 = _2638;
            _2640 = _2746;
            if (!_2744)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2748 = _2644;
            _2646 = _2748;
            if (!_2744)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2750 = _2650;
            _2652 = _2750;
            if (!_2744)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2752 = _2656;
            _2658 = _2752;
            if (!_2744)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2754 = _2662;
            _2664 = _2754;
            if (!_2744)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2756 = _2670;
            bool _2758 = !_2744;
            _2672 = _2756;
            if (!_2758)
            {
                bool _2760 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2762 = isnan(_1574);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2772 = _1574 + _2770;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2774;
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2782 = 1.0 / _2776;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2800 = _2772 * _2782;
                    float _2802 = precise::clamp(_2800, 0.0, 1.0);
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2808 = fma(_2802, _2780, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2810 = fma(_2802, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2812 = fma(_2802, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2814 = fma(_2802, _2790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2816 = fma(_2802, _2794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2818 = fma(_2802, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2646 = _2808;
                    _2664 = _2816;
                    _2640 = _2812;
                    _2658 = _2814;
                    _2652 = _2810;
                    _2672 = _2818;
                    _2734 = true;
                }
                else
                {
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2734 = false;
    float _2820 = _2646;
    float _2822 = _2664;
    float _2824 = _2640;
    float _2826 = _2658;
    float _2828 = _2652;
    float _2830 = _2672;
    float _2832 = fma(_1412, -0.5, 0.5);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = -_2820;
    float _2838 = _2836 + _2822;
    float _2840 = _2624 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2842 = -_2824;
    float _2844 = _2842 + _2826;
    out.m_105.x = 0.0;
    float _2846 = fma(_2834, _2838, _2820);
    float _2848 = fma(_2834, _2844, _2824);
    out.m_61.x = _2840;
    float _2850 = -_2828;
    float _2852 = _2850 + _2830;
    float _2854 = _2846 * 0.586610972881317138671875;
    bool _2856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2858 = fma(_2834, _2852, _2828);
    float _2860 = fma(_2848, 0.298911988735198974609375, _2854);
    bool _2862 = _2418 > 0.0;
    bool _2864 = isnan(_2418);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan(0.0);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2858, 0.114477999508380889892578125, _2860);
    bool _2874 = _2474 <= 0.0;
    bool _2876 = !_2870;
    bool _2878 = _2874 || _2876;
    float _2880 = -_2872;
    float _2882 = _2848 + _2880;
    float _2884 = -_2872;
    float _2886 = _2846 + _2884;
    float _2888 = -_2872;
    float _2890 = _2858 + _2888;
    float _2892 = fma(_2882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2894 = fma(_2886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    bool _2898 = !_2856;
    if (!_2898)
    {
        float _2900 = -_1522;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2904 = -_1526;
        float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2908 = -_1528;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2912 = _2902 * _2902;
        float _2914 = fma(_2906, _2906, _2912);
        float _2916 = fma(_2910, _2910, _2914);
        float _2918 = sqrt(_2916);
        float _2920 = rsqrt(_2916);
        float _2922 = -_2918;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = _2906 * _2920;
        float _2932 = _2902 * _2920;
        float _2934 = abs(_2928);
        float _2936 = log2(_2934);
        float _2938 = _2910 * _2920;
        float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2942 = _1412 * _2932;
        float _2944 = -_2932;
        float _2946 = -_2940;
        float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
        float _2950 = fma(_1408, _2930, _2942);
        float _2952 = -_2938;
        float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
        float _2956 = fma(_1428, _2938, _2950);
        float _2958 = precise::clamp(_2956, 0.0, 1.0);
        float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2962 = _2954 + _2960;
        float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = exp2(_2964);
        float _2972 = _2970 * _2968;
        float _2974 = _2958 * _2972;
        float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2976;
        out.m_105.y = _2978;
        out.m_105.z = _2980;
    }
    out.m_107.x = _2892;
    out.m_107.y = _2894;
    out.m_107.z = _2896;
    if (!_2878)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2982 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2982;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2734 = false;
    bool _1476 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_58.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_61.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3039 = as_type<float>(_142);
        out.gl_Position.z = _3039;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_63.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_180);
        out.gl_Position.z = _3109;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_65.x;
    float _184 = in.m_65.y;
    float _186 = in.m_65.z;
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    bool _224 = _218 > 0.0;
    bool _226 = _220 > 0.0;
    float _228 = _220;
    float _230 = _218;
    if (_224)
    {
        float _232 = rsqrt(_212);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    if (!_224)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _240 = _236;
    float _242 = _238;
    bool _244 = _222 > 0.0;
    float _246 = 0.0;
    float _248 = _240;
    float _250 = _242;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _252 = _246;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _252;
    if (!_226)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = _222;
    float _266 = _260;
    float _268 = _262;
    if (_226)
    {
        float _270 = rsqrt(_214);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_226)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (!_244)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = 0.0;
    float _286 = _282;
    if (_244)
    {
        float _288 = rsqrt(_216);
        _284 = _288;
    }
    float _290 = _284;
    float _292 = _234;
    if (_224)
    {
        float _294 = _234 * _188;
        _248 = _294;
    }
    float _296 = _248;
    if (_224)
    {
        float _298 = _234 * _182;
        _250 = _298;
    }
    float _300 = _250;
    if (_224)
    {
        float _302 = _234 * _194;
        _258 = _302;
    }
    float _304 = _258;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_244)
    {
        _230 = 0.0;
    }
    float _308 = _230;
    float _310 = _308;
    if (!_244)
    {
        _292 = 0.0;
    }
    float _312 = _292;
    float _314 = _312;
    if (_226)
    {
        float _316 = _272 * _190;
        _266 = _316;
    }
    float _318 = _266;
    if (_226)
    {
        float _320 = _272 * _184;
        _268 = _320;
    }
    float _322 = _268;
    if (_226)
    {
        float _324 = _272 * _196;
        _280 = _324;
    }
    float _326 = _280;
    if (_244)
    {
        float _328 = _290 * _192;
        _286 = _328;
    }
    float _330 = _286;
    if (_244)
    {
        float _332 = _290 * _186;
        _310 = _332;
    }
    float _334 = _310;
    if (_244)
    {
        float _336 = _290 * _198;
        _314 = _336;
    }
    float _338 = _314;
    bool _340 = !_306;
    float _358;
    if (!_340)
    {
        float _342 = in.m_71.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_126);
        float _364 = 1.0 / _362;
        float _366 = _160 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_71.w;
    float _372 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _374 = log2(_372);
    float _376 = in.m_58.x;
    float _378 = in.m_58.y;
    float _380 = in.m_58.z;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _384 = _382 != 0;
    float _386 = in.m_71.z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _396 = _394 != 0;
    float _398 = in.m_73.y;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _402 = _400 != 0;
    float _404 = in.m_75.x;
    float _406 = in.m_75.y;
    float _408 = in.m_75.z;
    float _410 = _374 * _160;
    float _412 = in.m_71.y;
    float _414 = exp2(_410);
    bool _416 = _370 > 0.5;
    float _418 = _184 * _378;
    float _420 = _190 * _378;
    float _422 = _196 * _378;
    float _424 = in.m_71.x;
    float _426 = fma(_182, _376, _418);
    float _428 = _386 * 2.0;
    float _430 = fma(_188, _376, _420);
    float _432 = -_398;
    float _434 = _432 + 1.0;
    float _436 = -_414;
    float _438 = _436 + 1.0;
    float _440 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _442 = _416 ? as_type<int>(_434) : as_type<int>(_398);
    float _444 = floor(_428);
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _456 = _454 != 0;
    float _458 = fma(_194, _376, _422);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _462 = _406 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = _396 ? as_type<float>(_442) : _398;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = _412 > 0.5;
    float _472 = _412 * 2.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    float _478 = 1.0 / _468;
    float _480 = _398;
    if (_402)
    {
        float _482 = _470 ? _434 : _398;
        _480 = _482;
    }
    float _484 = _480;
    float _486 = fma(_192, _380, _430);
    out.m_77.w = _460;
    bool _488 = _444 >= 0.0;
    bool _490 = isnan(_444);
    bool _492 = _488 || _490;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    float _498 = _408 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _500 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _508 = _504 || _506;
    float _510 = fma(_198, _380, _458);
    float _512 = 1.0 / _476;
    float _514 = _412 + _386;
    int _516 = _496 ? 0 : 1;
    float _518 = _424 * 2.0;
    float _520 = _514 + (-1.0);
    bool _522 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = floor(_472);
    float _536 = _508 ? _438 : 0.0;
    float _538 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _540 = _444 > 0.0;
    float _542 = in.m_79.x;
    float _544 = in.m_79.y;
    float _546 = in.m_79.z;
    float _548 = fma(_186, _380, _426);
    int _550 = ~_516;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _368 + _556;
    float _560 = floor(_518);
    int _562 = _554;
    if (_530)
    {
        float _564 = _536 * _512;
        _162 = _564;
    }
    float _566 = _162;
    float _568 = _424 + _386;
    float _570 = _424 + _412;
    float _572 = _412 + (-0.5);
    bool _574 = _534 > 0.0;
    float _576 = _568 + (-1.0);
    if (!_540)
    {
        int _578 = ~_516;
        int _580 = _578 + 1;
        _562 = _580;
    }
    int _582 = _562;
    float _584 = _570 + (-1.0);
    bool _586 = _534 >= 0.0;
    bool _588 = isnan(_534);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _604 = _594 ? 0 : 1;
    float _606 = in.m_73.x;
    float _608 = _600 * _478;
    int _610 = ~_604;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    int _616 = _614;
    if (!_574)
    {
        int _618 = ~_604;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _628 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _630 = _560 >= 0.0;
    bool _632 = isnan(_560);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = fma(_608, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _642 = _626 * _628;
    float _644 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _646 = !_448;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    bool _652 = !_452;
    int _654 = _652 ? 0 : 1;
    float _656 = _644 * _392;
    bool _658 = !_456;
    int _660 = _658 ? 0 : 1;
    float _662 = in.m_81.x;
    float _664 = in.m_81.y;
    float _666 = in.m_81.z;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[203].x, _656);
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    bool _684 = _560 > 0.0;
    float _686 = _650 * _624;
    float _688 = floor(_680);
    bool _690 = !_670;
    int _692 = _690 ? 0 : 1;
    float _694 = _682 * _532;
    float _696 = float(_582);
    int _698 = abs(_692);
    float _700 = _680 + 0.25;
    bool _702 = !_678;
    int _704 = _702 ? 0 : 1;
    int _706 = _638 ? 0 : 1;
    float _708 = floor(_700);
    int _710 = abs(_704);
    bool _712 = !_674;
    int _714 = _712 ? 0 : 1;
    float _716 = float(_622);
    float _718 = -_688;
    float _720 = _680 + _718;
    float _722 = float(_710);
    float _724 = _680 * 6.283185482025146484375;
    int _726 = ~_706;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _730;
    bool _734 = _638;
    bool _736 = _670;
    float _738 = _624;
    int _740 = _706;
    if (!_684)
    {
        int _742 = ~_706;
        int _744 = _742 + 1;
        _732 = _744;
    }
    int _746 = _732;
    float _748 = _722 * _716;
    int _750 = abs(_714);
    float _752 = float(_698);
    float _754 = -_708;
    float _756 = _700 + _754;
    bool _758 = _720 >= 0.5;
    bool _760 = isnan(_720);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.5);
    bool _766 = _762 || _764;
    int _768 = abs(_654);
    float _770 = _724 * 0.15915493667125701904296875;
    float _772 = _752 * _696;
    float _774 = float(_746);
    float _776 = float(_750);
    float _778 = _770 * 6.283185482025146484375;
    float _780 = sin(_778);
    bool _782 = !_766;
    float _784 = _782 ? 0.5 : (-0.5);
    float _786 = _772 * (-2.0);
    bool _788 = _756 > 0.5;
    float _790 = _776 * _774;
    float _792 = _748 * (-2.0);
    int _794 = abs(_648);
    float _796 = _784 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _798 = _796 * 2.0;
    float _800 = float(_768);
    float _802 = fma(_792, _666, _666);
    float _804 = fma(_596, _792, _596);
    float _806 = _756;
    if (_390)
    {
        bool _808 = _386 > 0.5;
        _734 = _808;
    }
    bool _810 = _734;
    float _812 = _386 + (-0.5);
    int _814 = abs(_660);
    if (_788)
    {
        float _816 = -_756;
        float _818 = _816 + 1.0;
        _806 = _818;
    }
    float _820 = _806;
    float _822 = float(_794);
    float _824 = _800 * _798;
    float _826 = _780 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _802);
    float _830 = fma(_820, 4.0, -1.0);
    float _832 = fma(_822, _826, _824);
    float _834 = _790 * (-2.0);
    float _836 = float(_814);
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _840 = fma(_804, _566, _828);
    float _842 = fma(_834, _664, _664);
    float _844 = fma(_538, _834, _538);
    float _846 = fma(_836, _838, _832);
    float _848 = _840 * 0.15915493667125701904296875;
    float _850 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _852 = fma(_602, _786, _602);
    float _854 = fma(_846, 3.1415927410125732421875, _662);
    bool _856 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _858 = isnan(_368);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = fma(_844, _566, _850);
    float _870 = _780;
    float _872 = _848;
    if (_384)
    {
        bool _874 = _424 > 0.5;
        _736 = _874;
    }
    bool _876 = _736;
    float _878 = in.m_83.x;
    float _880 = in.m_83.y;
    float _882 = in.m_83.z;
    float _884 = fma(_854, _786, _854);
    float _886 = _424 + (-0.5);
    bool _888 = _544 != 0.0;
    bool _890 = isnan(_544);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = -_866;
    float _900 = _898 + 1.0;
    bool _902 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _904 = isnan(_368);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[196].x, _884);
    bool _916 = _542 == 0.0;
    bool _918 = !_896;
    bool _920 = _916 && _918;
    int _922 = as_type<int>(_886);
    if (_384)
    {
        float _924 = -_606;
        float _926 = _924 + 1.0;
        _922 = as_type<int>(_926);
    }
    int _928 = _922;
    int _930 = _928;
    if (!_384)
    {
        _738 = _606;
    }
    float _932 = _738;
    float _934 = _912 * _900;
    float _936 = fma(_852, _566, _914);
    bool _938 = _546 == 0.0;
    bool _940 = _938 && _920;
    float _942 = in.m_85.x;
    float _944 = in.m_85.y;
    float _946 = in.m_85.z;
    float _948 = in.m_85.w;
    float _950 = _932;
    float _952 = _936;
    if (_384)
    {
        float _954 = _876 ? as_type<float>(_928) : _606;
        _950 = _954;
    }
    float _956 = _950;
    float _958 = _936 * 0.15915493667125701904296875;
    float _960 = _868 * 0.15915493667125701904296875;
    if (_390)
    {
        float _962 = -_606;
        float _964 = _962 + 1.0;
        _930 = as_type<int>(_964);
    }
    int _966 = _930;
    float _968 = _848 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = _640 * _934;
    float _974 = -_912;
    float _976 = _974 + 1.0;
    float _978 = _976;
    float _980 = as_type<float>(_966);
    float _982 = _972;
    if (!_390)
    {
        _952 = _606;
    }
    float _984 = _952;
    float _986 = _984;
    if (_390)
    {
        float _988 = _810 ? as_type<float>(_966) : _606;
        _986 = _988;
    }
    float _990 = _986;
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[115].x, _972);
    float _994 = _990;
    if (_940)
    {
        _870 = _880;
    }
    float _996 = _870;
    float _998 = _848 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = _996;
    if (_940)
    {
        _978 = _882;
    }
    float _1004 = _978;
    float _1006 = _1004;
    if (!_940)
    {
        float _1008 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _1006 = _1008;
    }
    float _1010 = _1006;
    if (_940)
    {
        _980 = _996;
    }
    float _1012 = _980;
    float _1014 = _1012;
    if (!_940)
    {
        _1002 = _880;
    }
    float _1016 = _1002;
    float _1018 = _958 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    if (_940)
    {
        _872 = _878;
    }
    float _1022 = _872;
    float _1024 = _1022;
    if (!_940)
    {
        float _1026 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1016);
        _1014 = _1026;
    }
    float _1028 = _1014;
    float _1030 = _944 * _882;
    if (_940)
    {
        _982 = _1022;
    }
    float _1032 = _982;
    float _1034 = _1032;
    if (!_940)
    {
        _1024 = _878;
    }
    float _1036 = _1024;
    float _1038 = _958 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    float _1042 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[116].x, _992);
    float _1044 = _1042;
    if (!_940)
    {
        float _1046 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1036);
        _1034 = _1046;
    }
    float _1048 = _1034;
    float _1050 = _942 * _1016;
    float _1052 = -_1030;
    float _1054 = fma(_946, _1016, _1052);
    float _1056 = _946 * _1036;
    float _1058 = _960 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1020 * _970;
    float _1064 = -_1050;
    float _1066 = fma(_944, _1036, _1064);
    float _1068 = -_1056;
    float _1070 = fma(_942, _882, _1068);
    float _1072 = _510 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1074 = _1070 * _948;
    float _1076 = _960 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _1040 * _1000;
    float _1082 = _970 * _1060;
    float _1084 = _1000 * _1060;
    float _1086 = _1040 * _970;
    float _1088 = _1020 * _1000;
    float _1090 = _1020 * _1060;
    float _1092 = _1040 * _1060;
    float _1094 = fma(_1078, _1062, _1080);
    float _1096 = -_1086;
    float _1098 = fma(_1078, _1088, _1096);
    float _1100 = fma(_1078, _1080, _1062);
    float _1102 = _1090 * _642;
    float _1104 = _1094 * _642;
    float _1106 = _1098 * _642;
    float _1108 = -_1088;
    float _1110 = fma(_1078, _1086, _1108);
    float _1112 = -_1078;
    float _1114 = fma(_1112, _686, _1102);
    float _1116 = fma(_1082, _686, _1104);
    float _1118 = fma(_1084, _686, _1106);
    float _1120 = _1054 * _948;
    float _1122 = fma(_1092, _694, _1114);
    float _1124 = fma(_1110, _694, _1116);
    float _1126 = fma(_1100, _694, _1118);
    float _1128 = _1066 * _948;
    float _1130 = _486 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1132 = _1124 * _318;
    float _1134 = _1124 * _326;
    float _1136 = _1090 * _1028;
    float _1138 = _1090 * _944;
    float _1140 = fma(_1126, _296, _1132);
    float _1142 = fma(_1126, _304, _1134);
    float _1144 = _1090 * _1074;
    float _1146 = _1098 * _944;
    float _1148 = fma(_1122, _330, _1140);
    float _1150 = fma(_1122, _338, _1142);
    float _1152 = _1094 * _944;
    float _1154 = _1094 * _1028;
    float _1156 = _1130 + _1148;
    float _1158 = _1072 + _1150;
    float _1160 = _1098 * _1028;
    float _1162 = _1098 * _1074;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1156 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1158 + _1168;
    float _1172 = _1094 * _1074;
    float _1174 = -_1078;
    float _1176 = fma(_1174, _1048, _1136);
    float _1178 = _1166 * _1166;
    float _1180 = _1170 * _1170;
    float _1182 = fma(_1084, _1048, _1160);
    float _1184 = fma(_1082, _1048, _1154);
    float _1186 = fma(_1084, _942, _1146);
    float _1188 = _1178 + _1180;
    float _1190 = fma(_1084, _1120, _1162);
    float _1192 = -_1078;
    float _1194 = fma(_1192, _942, _1138);
    float _1196 = -_1078;
    float _1198 = fma(_1196, _1120, _1144);
    float _1200 = sqrt(_1188);
    float _1202 = fma(_1082, _942, _1152);
    float _1204 = fma(_1082, _1120, _1172);
    float _1206 = fma(_1092, _1010, _1176);
    float _1208 = fma(_1100, _1010, _1182);
    float _1210 = fma(_1110, _1010, _1184);
    float _1212 = fma(_1100, _946, _1186);
    float _1214 = fma(_1100, _1128, _1190);
    float _1216 = _1124 * _322;
    float _1218 = fma(_1110, _946, _1202);
    float _1220 = fma(_1110, _1128, _1204);
    float _1222 = fma(_1092, _1128, _1198);
    float _1224 = fma(_1126, _300, _1216);
    float _1226 = _1218 * _318;
    float _1228 = _1218 * _322;
    float _1230 = _1210 * _318;
    bool _1232 = _1200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1210 * _322;
    float _1236 = fma(_1092, _946, _1194);
    float _1238 = _1218 * _326;
    float _1240 = _1210 * _326;
    float _1242 = _1220 * _326;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = fma(_1122, _334, _1224);
    float _1248 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1250 = _1220 * _318;
    float _1252 = _1220 * _322;
    float _1254 = fma(_1212, _296, _1226);
    float _1256 = _1248 + _1246;
    float _1258 = _1092;
    float _1260 = _1180;
    float _1262 = _1178;
    float _1264 = _1212;
    float _1266 = _1238;
    float _1268 = _1072;
    if (!_1232)
    {
        _1258 = _1180;
    }
    float _1270 = _1258;
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1274 = fma(_1212, _300, _1228);
    float _1276 = fma(_1212, _304, _1238);
    float _1278 = _1270;
    if (!_1232)
    {
        _1260 = _1178;
    }
    float _1280 = _1260;
    float _1282 = _1280;
    if (!_1232)
    {
        _1262 = _1156;
    }
    float _1284 = _1262;
    float _1286 = _1284;
    if (!_1232)
    {
        _1264 = _1158;
    }
    float _1288 = _1264;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1292 = _1288;
    if (!_1232)
    {
        _1266 = _1256;
    }
    float _1294 = _1266;
    bool _1296 = !_1232;
    float _1298 = _1294;
    if (!_1296)
    {
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1304 = _1200 + _1302;
        float _1306 = _1256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = rsqrt(_1188);
        float _1310 = _1304 * _1300;
        float _1312 = _1310 * 0.15915493667125701904296875;
        float _1314 = _1312 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1312 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = fma(_1316, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1324 = _1308 * _1322;
        float _1326 = _1320 + (-1.0);
        float _1328 = fma(_1166, _1324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1330 = fma(_1170, _1324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1336 = _1328 + _1334;
        float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1340 = _1330 + _1338;
        float _1342 = fma(_1256, _1320, _1332);
        float _1344 = _1336 * _1336;
        float _1346 = _1340 * _1340;
        _1298 = _1342;
        _1282 = _1344;
        _1278 = _1346;
        _1286 = _1328;
        _1292 = _1330;
    }
    float _1348 = _1298;
    float _1350 = _1282;
    float _1352 = _1278;
    float _1354 = _1286;
    float _1356 = _1292;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1360 = _1348 + _1358;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = _464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1366 = fma(_1208, _296, _1230);
    float _1368 = fma(_1360, _1360, _1350);
    float _1370 = fma(_1208, _300, _1234);
    float _1372 = fma(_1208, _304, _1240);
    float _1374 = fma(_1214, _300, _1252);
    float _1376 = _1368 + _1352;
    float _1378 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = _1364 * _1290;
    float _1384 = fma(_1214, _296, _1250);
    float _1386 = _1380 * _1244;
    float _1388 = sqrt(_1376);
    float _1390 = fma(_1214, _304, _1242);
    float _1392 = fma(_1236, _334, _1274);
    float _1394 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1402 = _1378 * _1272;
    float _1404 = fma(_1236, _338, _1276);
    float _1406 = fma(_1236, _330, _1254);
    float _1408 = fma(_1206, _330, _1366);
    float _1410 = fma(_1222, _330, _1384);
    float _1412 = fma(_1206, _334, _1370);
    float _1414 = _1394 * _1362;
    float _1416 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1424 = fma(_1222, _334, _1374);
    float _1426 = fma(_1222, _338, _1390);
    float _1428 = fma(_1206, _338, _1372);
    out.m_87.x = _1386;
    out.m_87.y = _1402;
    out.m_87.z = _1414;
    out.m_87.w = _1382;
    bool _1430 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1432 = isnan(_1388);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1438 = _1434 || _1436;
    out.m_89.x = _1416;
    out.m_89.y = _1418;
    out.m_89.z = _1420;
    out.m_89.w = _1422;
    out.m_91.x = _1406;
    out.m_91.y = _1392;
    out.m_91.z = _1404;
    out.m_93.x = _1410;
    out.m_93.y = _1424;
    out.m_93.z = _1426;
    int _1440 = as_type<int>(_1362);
    if (!_1438)
    {
        _1044 = 1.0;
    }
    float _1442 = _1044;
    out.m_95.x = _1408;
    out.m_95.y = _1412;
    out.m_95.z = _1428;
    bool _1444 = !_1438;
    float _1446 = _1442;
    if (!_1444)
    {
        bool _1448 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1450 = isnan(_1388);
        bool _1452 = _1448 || _1450;
        bool _1454 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1456 = _1452 || _1454;
        if (!_1456)
        {
            float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1460 = _1388 + _1458;
            float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1464 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1462;
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1468 = _1466 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1470 = 1.0 / _1464;
            float _1472 = _1460 * _1470;
            float _1474 = fma(_1472, _1468, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1446 = _1474;
            _1476 = true;
        }
        else
        {
            bool _1478 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1480 = isnan(_1388);
            bool _1482 = _1478 || _1480;
            bool _1484 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1486 = _1482 || _1484;
            if (!_1486)
            {
                float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1490 = _1388 + _1488;
                float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1494 = _1492 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1498 = _1496 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1500 = 1.0 / _1494;
                float _1502 = _1490 * _1500;
                float _1504 = fma(_1502, _1498, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1446 = _1504;
                _1476 = true;
            }
            else
            {
                _1446 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1476 = false;
    float _1506 = _1446;
    float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1510 = _1348 + _1508;
    float _1512 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1354 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1356 + _1518;
    float _1522 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1512);
    float _1526 = fma(_1516, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1528 = fma(_1520, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1522 + _1530;
    float _1534 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1524);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1526 + _1536;
    float _1540 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1542 = _1532 * _1532;
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1548 = _1528 + _1546;
    float _1550 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1540);
    float _1552 = fma(_1538, _1538, _1542);
    float _1554 = 1.0 / _1544;
    float _1556 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1550);
    float _1558 = fma(_1548, _1548, _1552);
    float _1560 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1562 = rsqrt(_1558);
    float _1564 = _1560 + _1544;
    float _1566 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1568 = _1248 + _1566;
    float _1570 = _1564 * _1554;
    float _1572 = _1570 * 0.5;
    float _1574 = sqrt(_1558);
    float _1576 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1578 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
    float _1584 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1578);
    float _1586 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1588 = 1.0 / _1582;
    float _1590 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1584);
    float _1592 = _1538 * _1586;
    float _1594 = _1548 * _1586;
    float _1596 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1598 = _1592 * _1592;
    float _1600 = _1594 * _1594;
    float _1602 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1604 = trunc(_1596);
    int _1606 = int(_1604);
    float _1608 = _1598 + _1600;
    float _1610 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1602);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1614 = _1588 * _1612;
    float _1616 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1610);
    float _1618 = sqrt(_1608);
    bool _1620 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1622 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1624 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1626 = !_1620;
    int _1628 = _1626 ? 0 : 1;
    float _1630 = trunc(_1622);
    int _1632 = int(_1630);
    bool _1634 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1638 = _1618 + _1636;
    int _1640 = 2;
    float _1642 = _1638;
    int _1644 = as_type<int>(_1532);
    float _1646 = _1592;
    float _1648 = _1594;
    float _1650 = _1598;
    float _1652 = _1600;
    float _1654 = _1614;
    if (!_1620)
    {
        _1640 = 1;
    }
    int _1656 = _1640;
    float _1658 = floor(_1576);
    int _1660 = _1656;
    if (!_1624)
    {
        _1660 = _1628;
    }
    int _1662 = _1660;
    int _1664 = _1662 << 6;
    int _1666 = _1664 + 96;
    uint _1669 = uint(int(uint(_1666) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.vp_c15)._m0[int(_1679)][_1681];
    float _1685 = _1402;
    float _1687 = as_type<float>(_1662);
    if (_1634)
    {
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1685 = _1689;
    }
    float _1691 = _1685;
    float _1693 = -_1658;
    float _1695 = _1576 + _1693;
    int _1697 = _1664 + 104;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    if (_1634)
    {
        float _1715 = _1638 * _1691;
        _1642 = _1715;
    }
    float _1717 = _1642;
    int _1719 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1721 = _1606 + _1719;
    int _1723 = _1721 + 1;
    if (_1634)
    {
        float _1725 = _1717 * 0.15915493667125701904296875;
        _994 = _1725;
    }
    float _1727 = _994;
    int _1729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1731 = _1632 + _1729;
    int _1733 = _1731 + 1;
    float _1735 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = _1410;
    if (_1634)
    {
        float _1739 = _1727 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        _1737 = _1741;
    }
    float _1743 = _1737;
    bool _1745 = _1733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1747 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    int _1749 = _1733 | _1723;
    float _1751 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    bool _1753 = _1749 < 0;
    bool _1755 = _1753 || _1745;
    float _1757 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1759 = _1424;
    if (_1634)
    {
        float _1761 = _1727 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        _1759 = _1763;
    }
    float _1765 = _1759;
    float _1767 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1769 = _1723 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1771 = _1769 || _1755;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1775 = precise::max(0.0, _1757);
    float _1777 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = _1751;
    float _1781 = _1773;
    if (_1634)
    {
        float _1783 = rsqrt(_1608);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = -_1586;
    float _1789 = -_1775;
    float _1791 = fma(_1532, _1787, _1789);
    float _1793 = -_1777;
    float _1795 = fma(_1793, _1773, 1.0);
    float _1797 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1799 = _1791;
    if (_1634)
    {
        float _1801 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1781 = _1801;
    }
    float _1803 = _1781;
    float _1805 = _1568 * _1683;
    float _1807 = _1683;
    float _1809 = _1803;
    if (!_1771)
    {
        int _1811 = _1723 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1813 = _1811 + _1733;
        _1644 = _1813;
    }
    int _1815 = _1644;
    float _1817 = as_type<float>(_1815);
    if (_1634)
    {
        float _1819 = _1743 + (-1.0);
        _1807 = _1819;
    }
    float _1821 = _1807;
    float _1823 = _1821;
    if (_1634)
    {
        float _1825 = fma(_1765, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1809 = _1825;
    }
    float _1827 = _1809;
    int _1829 = _1664 + 48;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    uint _1833 = uint(int(uint(int(_1831)) >> uint(2)));
    int _1835 = int(_1831) & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = int(_1831) + 1;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    int _1843 = _1839 & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    float _1847 = fma(_1130, _1675, _1805);
    if (_1634)
    {
        float _1849 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1823 = _1849;
    }
    float _1851 = _1823;
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1855 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1853);
    float _1857 = precise::clamp(_1855, 0.0, 1.0);
    float _1859 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1797);
    float _1861 = fma(_1072, _1705, _1847);
    float _1863 = _1785;
    if (_1634)
    {
        float _1865 = _1785 * _1827;
        _1863 = _1865;
    }
    float _1867 = _1863;
    if (_1634)
    {
        float _1869 = fma(_1791, _1743, _1851);
        _1799 = _1869;
    }
    float _1871 = _1799;
    int _1873 = _1664 + 64;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    uint _1877 = uint(int(uint(int(_1875)) >> uint(2)));
    int _1879 = int(_1875) & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    int _1883 = int(_1875) + 1;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    int _1887 = _1883 & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    if (_1634)
    {
        float _1891 = _1592 * _1867;
        _1646 = _1891;
    }
    float _1893 = _1646;
    if (_1634)
    {
        float _1895 = _1594 * _1867;
        _1648 = _1895;
    }
    float _1897 = _1648;
    float _1899 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1901 = -_1857;
    float _1903 = _1901 + 1.0;
    if (_1634)
    {
        float _1905 = _1893 * _1893;
        _1650 = _1905;
    }
    float _1907 = _1650;
    float _1909 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1911 = _1664 + 56;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    uint _1915 = uint(int(uint(int(_1913)) >> uint(2)));
    int _1917 = int(_1913) & 3;
    float _1919 = (*spvDescriptorSet0.vp_c15)._m0[int(_1915)][_1917];
    int _1921 = int(_1913) + 1;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    int _1925 = _1921 & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    float _1929 = _1909;
    if (_1634)
    {
        float _1931 = _1897 * _1897;
        _1652 = _1931;
    }
    float _1933 = _1652;
    float _1935 = fma(_1871, _1871, _1907);
    float _1937 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1939 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1899);
    if (!_1771)
    {
        int _1941 = _1815 << 2;
        _1440 = _1941;
    }
    int _1943 = _1440;
    float _1945 = _1935 + _1933;
    float _1947 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1937);
    int _1949 = _1664 + 72;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    uint _1953 = uint(int(uint(int(_1951)) >> uint(2)));
    int _1955 = int(_1951) & 3;
    float _1957 = (*spvDescriptorSet0.vp_c15)._m0[int(_1953)][_1955];
    int _1959 = int(_1951) + 1;
    uint _1961 = uint(int(uint(_1959) >> uint(2)));
    int _1963 = _1959 & 3;
    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[int(_1961)][_1963];
    float _1967 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1939);
    int _1969 = _1943;
    if (!_1771)
    {
        uint _1971 = uint(int(uint(_1815) >> uint(2)));
        _740 = int(_1971);
    }
    int _1973 = _740;
    float _1975 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1947);
    if (!_1771)
    {
        int _1977 = 12 & _1943;
        _1969 = _1977;
    }
    int _1979 = _1969;
    float _1981 = _1967 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1983 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1859);
    float _1985 = _1975 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1987 = _1664 + 80;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
    int _1993 = int(_1989) & 3;
    float _1995 = (*spvDescriptorSet0.vp_c15)._m0[int(_1991)][_1993];
    int _1997 = int(_1989) + 1;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    int _2001 = _1997 & 3;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[int(_1999)][_2001];
    float _2005 = _1861 + _1713;
    float _2007 = rsqrt(_1945);
    float _2009 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2011 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2013 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2009);
    int _2015 = _1664 + 88;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    uint _2019 = uint(int(uint(int(_2017)) >> uint(2)));
    int _2021 = int(_2017) & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    int _2025 = int(_2017) + 1;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    int _2029 = _2025 & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    float _2033 = _2009;
    if (!_1771)
    {
        int _2035 = _1973 << 4;
        int _2037 = _2035 + _1979;
        _2033 = as_type<float>(_2037);
    }
    float _2039 = _2033;
    float _2041 = 1.0 / _2005;
    float _2043 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2013);
    float _2045 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2043);
    float _2047 = _1568 * _1845;
    float _2049 = _2039;
    if (!_1771)
    {
        int _2051 = as_type<int>(_2039) + 400;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        uint _2055 = uint(int(uint(int(_2053)) >> uint(2)));
        int _2057 = int(_2053) & 3;
        float _2059 = (*spvDescriptorSet0.vp_c15)._m0[int(_2055)][_2057];
        _2049 = _2059;
    }
    float _2061 = _2049;
    float _2063 = _2007 * _1893;
    float _2065 = _2007 * _1871;
    float _2067 = fma(_1130, _1837, _2047);
    float _2069 = _2007 * _1897;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2073 = floor(_1909);
    float _2075 = _1568 * _1889;
    float _2077 = fma(_1130, _1881, _2075);
    float _2079 = abs(_1903);
    float _2081 = log2(_2079);
    float _2083 = fma(_1072, _1919, _2067);
    float _2085 = _2083 + _1927;
    float _2087 = -_2071;
    float _2089 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = _1927;
    if (!_1771)
    {
        float _2093 = floor(_1596);
        _2091 = _2093;
    }
    float _2095 = _2091;
    float _2097 = fma(_1072, _1957, _2077);
    float _2099 = _2085 * _2041;
    float _2101 = -_2069;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2105 = -_2073;
    float _2107 = _1909 + _2105;
    float _2109 = _2097 + _1965;
    bool _2111 = _2099 >= 0.0;
    float _2113 = fma(_2103, -0.5, 0.5);
    float _2115 = _2109 * _2041;
    float _2117 = _1568 * _2003;
    bool _2119 = _2099 <= 1.0;
    bool _2121 = _2119 && _2111;
    float _2123 = fma(_2103, 0.5, 0.5);
    float _2125 = fma(_1130, _1995, _2117);
    bool _2127 = _2115 >= 0.0;
    bool _2129 = _2127 && _2121;
    float _2131 = sqrt(_2113);
    if (!_1771)
    {
        float _2133 = -_2095;
        float _2135 = _1596 + _2133;
        _1929 = _2135;
    }
    float _2137 = _1929;
    float _2139 = fma(_1072, _2023, _2125);
    bool _2141 = _2115 <= 1.0;
    bool _2143 = _2141 && _2129;
    float _2145 = fma(_2123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2147 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = _2139 + _2031;
    float _2151 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2153 = fma(_2123, _2145, -0.212114393711090087890625);
    float _2155 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2157 = 1.0 / _2045;
    float _2159 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2151);
    float _2161 = fma(_2123, _2153, 1.570728778839111328125);
    float _2163 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2155);
    float _2165 = _2065 + 1.0;
    float _2167 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2159);
    float _2169 = _2155;
    if (_2143)
    {
        float _2171 = float(_1662);
        _1687 = _2171;
    }
    float _2173 = _1687;
    float _2175 = _2131 * 0.636619746685028076171875;
    float _2177 = exp2(_2147);
    float _2179 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2163);
    float _2181 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2167);
    float _2183 = -_2161;
    float _2185 = fma(_2175, _2183, 1.0);
    float _2187 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2179);
    float _2189 = log2(_1795);
    float _2191 = _2187 * _2157;
    float _2193 = _2181 * _2157;
    float _2195 = fma(_2191, -0.5, 0.5);
    float _2197 = fma(_2193, 0.5, 0.5);
    float _2199 = _2069;
    float _2201 = _2181;
    if (!_1771)
    {
        float _2203 = floor(_1622);
        _2199 = _2203;
    }
    float _2205 = _2199;
    float _2207 = -_2065;
    float _2209 = fma(_2177, _2165, _2207);
    float _2211 = _2149 * _2041;
    float _2213 = fma(_2209, 0.5, 0.5);
    float _2215 = _2139;
    if (!_1771)
    {
        float _2217 = rint(_2061);
        float _2219 = precise::max(_2217, 0.0);
        uint _2221 = uint(_2219);
        uint _2223 = clamp(_2221, 0u, 65535u);
        _2215 = as_type<float>(_2223);
    }
    float _2225 = _2215;
    float _2227 = _2189 * 0.693147182464599609375;
    float _2229 = _2163;
    if (_2143)
    {
        float _2231 = rint(_2173);
        float _2233 = precise::max(_2231, 0.0);
        uint _2235 = uint(_2233);
        uint _2237 = clamp(_2235, 0u, 65535u);
        _2229 = as_type<float>(_2237);
    }
    float _2239 = _2229;
    if (!_1771)
    {
        float _2241 = -_2205;
        float _2243 = _1622 + _2241;
        _2169 = _2243;
    }
    float _2245 = _2169;
    float _2247 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6371 = float2(_2107, _1695);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6371, float2(0.0), isnan(_6371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6371, float2(0.0), isnan(_6371)), level(0.0)).x;
    float _2251 = _2225;
    if (!_1771)
    {
        float3 _6388 = float3(_2245, _2137, float(as_type<int>(_2225)));
        float3 _6392 = select(_6388, float3(0.0), isnan(_6388));
        float _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6392.xy, uint(rint(_6392.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6392.xy, uint(rint(_6392.z)), level(0.0)).x;
        _2251 = _2253;
    }
    float _2255 = _2251;
    float _2257 = _2115;
    if (_2143)
    {
        float3 _6407 = float3(_2099, _2115, float(as_type<int>(_2239)));
        float3 _6409 = select(_6407, float3(0.0), isnan(_6407));
        float _2259 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6409.xy, uint(rint(_6409.z)), _2211, level(0.0));
        _2257 = _2259;
    }
    float _2261 = _2257;
    float3 _6419 = float3(_2197, _2195, _2247);
    float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6419, float3(0.0), isnan(_6419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6419, float3(0.0), isnan(_6419)), level(0.0)).x;
    float3 _6428 = float3(_2197, _2195, _2247);
    float4 _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6428, float3(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6428, float3(0.0), isnan(_6428)), level(0.0)).xyzw;
    float _2268 = _2266.x;
    float _2270 = _2266.y;
    float _2272 = _2266.z;
    float _2274 = _2266.w;
    float2 _6444 = float2(_2185, _2213);
    float3 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6444, float2(0.0), isnan(_6444)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6444, float2(0.0), isnan(_6444)), level(0.0)).xyz;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = abs(_1614);
    float _2288 = log2(_2286);
    float _2290 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2292 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2294 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2290);
    float _2296 = exp2(_2292);
    float _2298 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2294);
    float _2300 = _2045 * 0.5;
    float _2302 = _2181 + _2045;
    float _2304 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2298);
    float _2306 = _2302 * 0.5;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2310 = _2304 + _2045;
    float _2312 = fma(_2187, -0.5, _2300);
    out.gl_Position.x = _2181;
    out.gl_Position.y = _2187;
    out.gl_Position.z = _2304;
    out.gl_Position.w = _2045;
    float _2314 = _2310 * 0.5;
    float _2316 = exp2(_2308);
    out.m_97.x = _2306;
    out.m_97.y = _2312;
    out.m_97.z = _2314;
    out.m_97.w = _2045;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = fma(_2320, -2.0, 3.0);
    float _2324 = _2320 * _2320;
    bool _2326 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.5);
    bool _2334 = _2330 || _2332;
    float _2336 = _2324 * _2322;
    bool _2338 = _1614 <= 8000.0;
    bool _2340 = isnan(_1614);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan(8000.0);
    bool _2346 = _2342 || _2344;
    float _2348 = float(_2346);
    float _2350 = -_2336;
    float _2352 = _2350 + 1.0;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2336);
    float _2356 = _2348;
    if (_2334)
    {
        _2201 = 1.0;
    }
    float _2358 = _2201;
    float _2360 = _2348 * _2354;
    float _2362 = _2358;
    float _2364 = _2360;
    if (_2334)
    {
        _2356 = 1.0;
    }
    float _2366 = _2356;
    float _2368 = _2366;
    if (!_2334)
    {
        float _2370 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2374 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2372;
        float _2376 = _2370 * 0.15915493667125701904296875;
        float _2378 = _2376 * 6.283185482025146484375;
        float _2380 = cos(_2378);
        float _2382 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2384 = _2382 * 0.15915493667125701904296875;
        float _2386 = _2376 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        float _2390 = 1.0 / _2380;
        float _2392 = _2384 * 6.283185482025146484375;
        float _2394 = cos(_2392);
        float _2396 = _2388 * _2390;
        float _2398 = _2384 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        float _2402 = _2394 * _2396;
        float _2404 = 1.0 / _2374;
        float _2406 = 1.0 / _2402;
        float _2408 = _2400 * _2406;
        float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2412 = fma(_1614, _2408, _2410);
        float _2414 = _2412 * _2404;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        _2362 = _2416;
    }
    float _2418 = _2362;
    if (!_2334)
    {
        float _2420 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2422 = _2420 * 0.15915493667125701904296875;
        float _2424 = _2422 * 6.283185482025146484375;
        float _2426 = cos(_2424);
        float _2428 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2422 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = 1.0 / _2426;
        float _2438 = _2430 * 6.283185482025146484375;
        float _2440 = cos(_2438);
        float _2442 = _2434 * _2436;
        float _2444 = _2430 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2440 * _2442;
        float _2450 = 1.0 / _2448;
        float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2452;
        float _2456 = 1.0 / _2454;
        float _2458 = _2446 * _2450;
        float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2462 = fma(_1614, _2458, _2460);
        float _2464 = _2462 * _2456;
        float _2466 = precise::clamp(_2464, 0.0, 1.0);
        float _2468 = -_2466;
        float _2470 = _2468 + 1.0;
        _1654 = _2466;
        _2368 = _2470;
    }
    float _2472 = _1654;
    float _2474 = _2368;
    float _2476 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2478 = -_2249;
    float _2480 = _2478 + 1.0;
    float _2482 = -_2296;
    float _2484 = _2482 + 1.0;
    float _2486 = _2472;
    if (!_2143)
    {
        _2364 = 1.0;
    }
    float _2488 = _2364;
    float _2490 = _2480 * _2476;
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = _2488;
    if (_2143)
    {
        bool _2496 = _2261 >= _2211;
        bool _2498 = isnan(_2261);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan(_2211);
        bool _2504 = _2500 || _2502;
        float _2506 = float(_2504);
        _2494 = _2506;
    }
    float _2508 = _2494;
    float _2510 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1771)
    {
        _2486 = 1.0;
    }
    float _2512 = _2486;
    float _2514 = _2512;
    if (!_1771)
    {
        int _2516 = _1815 << 4;
        int _2518 = _2516 + 2048;
        uint _2520 = uint(int(uint(_2518) >> uint(2)));
        uint _2522 = uint(int(uint(int(_2520)) >> uint(2)));
        int _2524 = int(_2520) & 3;
        float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
        int _2528 = int(_2520) + 1;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        int _2532 = _2528 & 3;
        float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
        int _2536 = _2518 + 8;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        uint _2540 = uint(int(uint(int(_2538)) >> uint(2)));
        int _2542 = int(_2538) & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = int(_2538) + 1;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        int _2550 = _2546 & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        float _2554 = _1568 * _2534;
        float _2556 = fma(_1130, _2526, _2554);
        float _2558 = fma(_1072, _2544, _2556);
        float _2560 = _2558 + _2552;
        float _2562 = precise::clamp(_2560, 0.0, 1.0);
        float _2564 = -_2562;
        float _2566 = _2564 + _2255;
        float _2568 = fma(_2566, 500.0, 1.5);
        float _2570 = exp2(_2568);
        float _2572 = 0.0 + _2570;
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        _2514 = _2574;
        _1817 = as_type<float>(_2518);
    }
    float _2576 = _2514;
    float _2578 = _1817;
    float _2580 = _2508 * _2576;
    float _2582 = _2510 * _2263;
    float _2584 = -_2492;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2588 = -_2510;
    float _2590 = _2588 + 1.0;
    out.m_99.x = _1526;
    out.m_99.y = _1522;
    out.m_99.z = _1528;
    float _2592 = _2274 * _2582;
    float _2594 = -_2580;
    float _2596 = fma(_2594, _2586, 1.0);
    float _2598 = precise::clamp(_2596, 0.0, 1.0);
    float _2600 = _2284 * _2582;
    float _2602 = _2274 * _2590;
    float _2604 = fma(_2280, _2592, _2268);
    float _2606 = fma(_2282, _2592, _2270);
    float _2608 = _2598 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2610 = fma(_2274, _2600, _2272);
    bool _2612 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2614 = isnan(_1574);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2620 = _2616 || _2618;
    float _2622 = _2418 * _2474;
    out.m_101.x = _2608;
    float _2624 = _2622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2604;
    out.m_103.y = _2606;
    out.m_103.z = _2610;
    out.m_103.w = _2602;
    float _2626 = _2578;
    float _2628 = _2590;
    float _2630 = _2580;
    float _2632 = _2592;
    float _2634 = _2598;
    if (!_2620)
    {
        _1268 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2636 = _1268;
    float _2638 = _2636;
    float _2640 = _2636;
    if (!_2620)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2642 = _2626;
    float _2644 = _2642;
    float _2646 = _2642;
    if (!_2620)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _2628;
    float _2650 = _2648;
    float _2652 = _2648;
    if (!_2620)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2654 = _2630;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2620)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2660 = _2632;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2620)
    {
        _2634 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2634;
    bool _2668 = !_2620;
    float _2670 = _2666;
    float _2672 = _2666;
    if (!_2668)
    {
        bool _2674 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2676 = isnan(_1574);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2682 = _2678 || _2680;
        if (!_2682)
        {
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2686 = _1574 + _2684;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2688;
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2696 = 1.0 / _2690;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2714 = _2686 * _2696;
            float _2716 = precise::clamp(_2714, 0.0, 1.0);
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2722 = fma(_2716, _2694, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2724 = fma(_2716, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2726 = fma(_2716, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2728 = fma(_2716, _2704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2730 = fma(_2716, _2708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2732 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2646 = _2722;
            _2664 = _2730;
            _2640 = _2726;
            _2658 = _2728;
            _2652 = _2724;
            _2672 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2738 = isnan(_1574);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2746 = _2638;
            _2640 = _2746;
            if (!_2744)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2748 = _2644;
            _2646 = _2748;
            if (!_2744)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2750 = _2650;
            _2652 = _2750;
            if (!_2744)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2752 = _2656;
            _2658 = _2752;
            if (!_2744)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2754 = _2662;
            _2664 = _2754;
            if (!_2744)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2756 = _2670;
            bool _2758 = !_2744;
            _2672 = _2756;
            if (!_2758)
            {
                bool _2760 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2762 = isnan(_1574);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2772 = _1574 + _2770;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2774;
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2782 = 1.0 / _2776;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2800 = _2772 * _2782;
                    float _2802 = precise::clamp(_2800, 0.0, 1.0);
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2808 = fma(_2802, _2780, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2810 = fma(_2802, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2812 = fma(_2802, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2814 = fma(_2802, _2790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2816 = fma(_2802, _2794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2818 = fma(_2802, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2646 = _2808;
                    _2664 = _2816;
                    _2640 = _2812;
                    _2658 = _2814;
                    _2652 = _2810;
                    _2672 = _2818;
                    _2734 = true;
                }
                else
                {
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2734 = false;
    float _2820 = _2646;
    float _2822 = _2664;
    float _2824 = _2640;
    float _2826 = _2658;
    float _2828 = _2652;
    float _2830 = _2672;
    float _2832 = fma(_1412, -0.5, 0.5);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = -_2820;
    float _2838 = _2836 + _2822;
    float _2840 = _2624 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2842 = -_2824;
    float _2844 = _2842 + _2826;
    out.m_105.x = 0.0;
    float _2846 = fma(_2834, _2838, _2820);
    float _2848 = fma(_2834, _2844, _2824);
    out.m_61.x = _2840;
    float _2850 = -_2828;
    float _2852 = _2850 + _2830;
    float _2854 = _2846 * 0.586610972881317138671875;
    bool _2856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2858 = fma(_2834, _2852, _2828);
    float _2860 = fma(_2848, 0.298911988735198974609375, _2854);
    bool _2862 = _2418 > 0.0;
    bool _2864 = isnan(_2418);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan(0.0);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2858, 0.114477999508380889892578125, _2860);
    bool _2874 = _2474 <= 0.0;
    bool _2876 = !_2870;
    bool _2878 = _2874 || _2876;
    float _2880 = -_2872;
    float _2882 = _2848 + _2880;
    float _2884 = -_2872;
    float _2886 = _2846 + _2884;
    float _2888 = -_2872;
    float _2890 = _2858 + _2888;
    float _2892 = fma(_2882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2894 = fma(_2886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    bool _2898 = !_2856;
    if (!_2898)
    {
        float _2900 = -_1522;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2904 = -_1526;
        float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2908 = -_1528;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2912 = _2902 * _2902;
        float _2914 = fma(_2906, _2906, _2912);
        float _2916 = fma(_2910, _2910, _2914);
        float _2918 = sqrt(_2916);
        float _2920 = rsqrt(_2916);
        float _2922 = -_2918;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = _2906 * _2920;
        float _2932 = _2902 * _2920;
        float _2934 = abs(_2928);
        float _2936 = log2(_2934);
        float _2938 = _2910 * _2920;
        float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2942 = _1412 * _2932;
        float _2944 = -_2932;
        float _2946 = -_2940;
        float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
        float _2950 = fma(_1408, _2930, _2942);
        float _2952 = -_2938;
        float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
        float _2956 = fma(_1428, _2938, _2950);
        float _2958 = precise::clamp(_2956, 0.0, 1.0);
        float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2962 = _2954 + _2960;
        float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = exp2(_2964);
        float _2972 = _2970 * _2968;
        float _2974 = _2958 * _2972;
        float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2976;
        out.m_105.y = _2978;
        out.m_105.z = _2980;
    }
    out.m_107.x = _2892;
    out.m_107.y = _2894;
    out.m_107.z = _2896;
    if (!_2878)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2982 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2982;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2734 = false;
    bool _1476 = false;
    bool _360 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_58.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_61.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3039 = as_type<float>(_142);
        out.gl_Position.z = _3039;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_63.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_180);
        out.gl_Position.z = _3109;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_65.x;
    float _184 = in.m_65.y;
    float _186 = in.m_65.z;
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    bool _224 = _218 > 0.0;
    bool _226 = _220 > 0.0;
    float _228 = _220;
    float _230 = _218;
    if (_224)
    {
        float _232 = rsqrt(_212);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    if (!_224)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _240 = _236;
    float _242 = _238;
    bool _244 = _222 > 0.0;
    float _246 = 0.0;
    float _248 = _240;
    float _250 = _242;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _252 = _246;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _252;
    if (!_226)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = _222;
    float _266 = _260;
    float _268 = _262;
    if (_226)
    {
        float _270 = rsqrt(_214);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_226)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (!_244)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = 0.0;
    float _286 = _282;
    if (_244)
    {
        float _288 = rsqrt(_216);
        _284 = _288;
    }
    float _290 = _284;
    float _292 = _234;
    if (_224)
    {
        float _294 = _234 * _188;
        _248 = _294;
    }
    float _296 = _248;
    if (_224)
    {
        float _298 = _234 * _182;
        _250 = _298;
    }
    float _300 = _250;
    if (_224)
    {
        float _302 = _234 * _194;
        _258 = _302;
    }
    float _304 = _258;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_244)
    {
        _230 = 0.0;
    }
    float _308 = _230;
    float _310 = _308;
    if (!_244)
    {
        _292 = 0.0;
    }
    float _312 = _292;
    float _314 = _312;
    if (_226)
    {
        float _316 = _272 * _190;
        _266 = _316;
    }
    float _318 = _266;
    if (_226)
    {
        float _320 = _272 * _184;
        _268 = _320;
    }
    float _322 = _268;
    if (_226)
    {
        float _324 = _272 * _196;
        _280 = _324;
    }
    float _326 = _280;
    if (_244)
    {
        float _328 = _290 * _192;
        _286 = _328;
    }
    float _330 = _286;
    if (_244)
    {
        float _332 = _290 * _186;
        _310 = _332;
    }
    float _334 = _310;
    if (_244)
    {
        float _336 = _290 * _198;
        _314 = _336;
    }
    float _338 = _314;
    bool _340 = !_306;
    float _358;
    if (!_340)
    {
        float _342 = in.m_71.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_126);
        float _364 = 1.0 / _362;
        float _366 = _160 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_71.w;
    float _372 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _374 = log2(_372);
    float _376 = in.m_58.x;
    float _378 = in.m_58.y;
    float _380 = in.m_58.z;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _384 = _382 != 0;
    float _386 = in.m_71.z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _390 = _388 != 0;
    float _392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _396 = _394 != 0;
    float _398 = in.m_73.y;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _402 = _400 != 0;
    float _404 = in.m_75.x;
    float _406 = in.m_75.y;
    float _408 = in.m_75.z;
    float _410 = _374 * _160;
    float _412 = in.m_71.y;
    float _414 = exp2(_410);
    bool _416 = _370 > 0.5;
    float _418 = _184 * _378;
    float _420 = _190 * _378;
    float _422 = _196 * _378;
    float _424 = in.m_71.x;
    float _426 = fma(_182, _376, _418);
    float _428 = _386 * 2.0;
    float _430 = fma(_188, _376, _420);
    float _432 = -_398;
    float _434 = _432 + 1.0;
    float _436 = -_414;
    float _438 = _436 + 1.0;
    float _440 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _442 = _416 ? as_type<int>(_434) : as_type<int>(_398);
    float _444 = floor(_428);
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _456 = _454 != 0;
    float _458 = fma(_194, _376, _422);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _462 = _406 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = _396 ? as_type<float>(_442) : _398;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = _412 > 0.5;
    float _472 = _412 * 2.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    float _478 = 1.0 / _468;
    float _480 = _398;
    if (_402)
    {
        float _482 = _470 ? _434 : _398;
        _480 = _482;
    }
    float _484 = _480;
    float _486 = fma(_192, _380, _430);
    out.m_77.w = _460;
    bool _488 = _444 >= 0.0;
    bool _490 = isnan(_444);
    bool _492 = _488 || _490;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    float _498 = _408 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _500 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _508 = _504 || _506;
    float _510 = fma(_198, _380, _458);
    float _512 = 1.0 / _476;
    float _514 = _412 + _386;
    int _516 = _496 ? 0 : 1;
    float _518 = _424 * 2.0;
    float _520 = _514 + (-1.0);
    bool _522 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _530 = _526 || _528;
    float _532 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = floor(_472);
    float _536 = _508 ? _438 : 0.0;
    float _538 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _540 = _444 > 0.0;
    float _542 = in.m_79.x;
    float _544 = in.m_79.y;
    float _546 = in.m_79.z;
    float _548 = fma(_186, _380, _426);
    int _550 = ~_516;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _368 + _556;
    float _560 = floor(_518);
    int _562 = _554;
    if (_530)
    {
        float _564 = _536 * _512;
        _162 = _564;
    }
    float _566 = _162;
    float _568 = _424 + _386;
    float _570 = _424 + _412;
    float _572 = _412 + (-0.5);
    bool _574 = _534 > 0.0;
    float _576 = _568 + (-1.0);
    if (!_540)
    {
        int _578 = ~_516;
        int _580 = _578 + 1;
        _562 = _580;
    }
    int _582 = _562;
    float _584 = _570 + (-1.0);
    bool _586 = _534 >= 0.0;
    bool _588 = isnan(_534);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _604 = _594 ? 0 : 1;
    float _606 = in.m_73.x;
    float _608 = _600 * _478;
    int _610 = ~_604;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    int _616 = _614;
    if (!_574)
    {
        int _618 = ~_604;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _626 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _628 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _630 = _560 >= 0.0;
    bool _632 = isnan(_560);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = fma(_608, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _642 = _626 * _628;
    float _644 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _646 = !_448;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    bool _652 = !_452;
    int _654 = _652 ? 0 : 1;
    float _656 = _644 * _392;
    bool _658 = !_456;
    int _660 = _658 ? 0 : 1;
    float _662 = in.m_81.x;
    float _664 = in.m_81.y;
    float _666 = in.m_81.z;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _670 = _668 != 0;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _678 = _676 != 0;
    float _680 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[203].x, _656);
    float _682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    bool _684 = _560 > 0.0;
    float _686 = _650 * _624;
    float _688 = floor(_680);
    bool _690 = !_670;
    int _692 = _690 ? 0 : 1;
    float _694 = _682 * _532;
    float _696 = float(_582);
    int _698 = abs(_692);
    float _700 = _680 + 0.25;
    bool _702 = !_678;
    int _704 = _702 ? 0 : 1;
    int _706 = _638 ? 0 : 1;
    float _708 = floor(_700);
    int _710 = abs(_704);
    bool _712 = !_674;
    int _714 = _712 ? 0 : 1;
    float _716 = float(_622);
    float _718 = -_688;
    float _720 = _680 + _718;
    float _722 = float(_710);
    float _724 = _680 * 6.283185482025146484375;
    int _726 = ~_706;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _730;
    bool _734 = _638;
    bool _736 = _670;
    float _738 = _624;
    int _740 = _706;
    if (!_684)
    {
        int _742 = ~_706;
        int _744 = _742 + 1;
        _732 = _744;
    }
    int _746 = _732;
    float _748 = _722 * _716;
    int _750 = abs(_714);
    float _752 = float(_698);
    float _754 = -_708;
    float _756 = _700 + _754;
    bool _758 = _720 >= 0.5;
    bool _760 = isnan(_720);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.5);
    bool _766 = _762 || _764;
    int _768 = abs(_654);
    float _770 = _724 * 0.15915493667125701904296875;
    float _772 = _752 * _696;
    float _774 = float(_746);
    float _776 = float(_750);
    float _778 = _770 * 6.283185482025146484375;
    float _780 = sin(_778);
    bool _782 = !_766;
    float _784 = _782 ? 0.5 : (-0.5);
    float _786 = _772 * (-2.0);
    bool _788 = _756 > 0.5;
    float _790 = _776 * _774;
    float _792 = _748 * (-2.0);
    int _794 = abs(_648);
    float _796 = _784 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _798 = _796 * 2.0;
    float _800 = float(_768);
    float _802 = fma(_792, _666, _666);
    float _804 = fma(_596, _792, _596);
    float _806 = _756;
    if (_390)
    {
        bool _808 = _386 > 0.5;
        _734 = _808;
    }
    bool _810 = _734;
    float _812 = _386 + (-0.5);
    int _814 = abs(_660);
    if (_788)
    {
        float _816 = -_756;
        float _818 = _816 + 1.0;
        _806 = _818;
    }
    float _820 = _806;
    float _822 = float(_794);
    float _824 = _800 * _798;
    float _826 = _780 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _828 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _802);
    float _830 = fma(_820, 4.0, -1.0);
    float _832 = fma(_822, _826, _824);
    float _834 = _790 * (-2.0);
    float _836 = float(_814);
    float _838 = _830 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _840 = fma(_804, _566, _828);
    float _842 = fma(_834, _664, _664);
    float _844 = fma(_538, _834, _538);
    float _846 = fma(_836, _838, _832);
    float _848 = _840 * 0.15915493667125701904296875;
    float _850 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _852 = fma(_602, _786, _602);
    float _854 = fma(_846, 3.1415927410125732421875, _662);
    bool _856 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _858 = isnan(_368);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = fma(_844, _566, _850);
    float _870 = _780;
    float _872 = _848;
    if (_384)
    {
        bool _874 = _424 > 0.5;
        _736 = _874;
    }
    bool _876 = _736;
    float _878 = in.m_83.x;
    float _880 = in.m_83.y;
    float _882 = in.m_83.z;
    float _884 = fma(_854, _786, _854);
    float _886 = _424 + (-0.5);
    bool _888 = _544 != 0.0;
    bool _890 = isnan(_544);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = -_866;
    float _900 = _898 + 1.0;
    bool _902 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _904 = isnan(_368);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[196].x, _884);
    bool _916 = _542 == 0.0;
    bool _918 = !_896;
    bool _920 = _916 && _918;
    int _922 = as_type<int>(_886);
    if (_384)
    {
        float _924 = -_606;
        float _926 = _924 + 1.0;
        _922 = as_type<int>(_926);
    }
    int _928 = _922;
    int _930 = _928;
    if (!_384)
    {
        _738 = _606;
    }
    float _932 = _738;
    float _934 = _912 * _900;
    float _936 = fma(_852, _566, _914);
    bool _938 = _546 == 0.0;
    bool _940 = _938 && _920;
    float _942 = in.m_85.x;
    float _944 = in.m_85.y;
    float _946 = in.m_85.z;
    float _948 = in.m_85.w;
    float _950 = _932;
    float _952 = _936;
    if (_384)
    {
        float _954 = _876 ? as_type<float>(_928) : _606;
        _950 = _954;
    }
    float _956 = _950;
    float _958 = _936 * 0.15915493667125701904296875;
    float _960 = _868 * 0.15915493667125701904296875;
    if (_390)
    {
        float _962 = -_606;
        float _964 = _962 + 1.0;
        _930 = as_type<int>(_964);
    }
    int _966 = _930;
    float _968 = _848 * 6.283185482025146484375;
    float _970 = sin(_968);
    float _972 = _640 * _934;
    float _974 = -_912;
    float _976 = _974 + 1.0;
    float _978 = _976;
    float _980 = as_type<float>(_966);
    float _982 = _972;
    if (!_390)
    {
        _952 = _606;
    }
    float _984 = _952;
    float _986 = _984;
    if (_390)
    {
        float _988 = _810 ? as_type<float>(_966) : _606;
        _986 = _988;
    }
    float _990 = _986;
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[115].x, _972);
    float _994 = _990;
    if (_940)
    {
        _870 = _880;
    }
    float _996 = _870;
    float _998 = _848 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = _996;
    if (_940)
    {
        _978 = _882;
    }
    float _1004 = _978;
    float _1006 = _1004;
    if (!_940)
    {
        float _1008 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[17].y, _882);
        _1006 = _1008;
    }
    float _1010 = _1006;
    if (_940)
    {
        _980 = _996;
    }
    float _1012 = _980;
    float _1014 = _1012;
    if (!_940)
    {
        _1002 = _880;
    }
    float _1016 = _1002;
    float _1018 = _958 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    if (_940)
    {
        _872 = _878;
    }
    float _1022 = _872;
    float _1024 = _1022;
    if (!_940)
    {
        float _1026 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1016);
        _1014 = _1026;
    }
    float _1028 = _1014;
    float _1030 = _944 * _882;
    if (_940)
    {
        _982 = _1022;
    }
    float _1032 = _982;
    float _1034 = _1032;
    if (!_940)
    {
        _1024 = _878;
    }
    float _1036 = _1024;
    float _1038 = _958 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    float _1042 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[116].x, _992);
    float _1044 = _1042;
    if (!_940)
    {
        float _1046 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1036);
        _1034 = _1046;
    }
    float _1048 = _1034;
    float _1050 = _942 * _1016;
    float _1052 = -_1030;
    float _1054 = fma(_946, _1016, _1052);
    float _1056 = _946 * _1036;
    float _1058 = _960 * 6.283185482025146484375;
    float _1060 = cos(_1058);
    float _1062 = _1020 * _970;
    float _1064 = -_1050;
    float _1066 = fma(_944, _1036, _1064);
    float _1068 = -_1056;
    float _1070 = fma(_942, _882, _1068);
    float _1072 = _510 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1074 = _1070 * _948;
    float _1076 = _960 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _1040 * _1000;
    float _1082 = _970 * _1060;
    float _1084 = _1000 * _1060;
    float _1086 = _1040 * _970;
    float _1088 = _1020 * _1000;
    float _1090 = _1020 * _1060;
    float _1092 = _1040 * _1060;
    float _1094 = fma(_1078, _1062, _1080);
    float _1096 = -_1086;
    float _1098 = fma(_1078, _1088, _1096);
    float _1100 = fma(_1078, _1080, _1062);
    float _1102 = _1090 * _642;
    float _1104 = _1094 * _642;
    float _1106 = _1098 * _642;
    float _1108 = -_1088;
    float _1110 = fma(_1078, _1086, _1108);
    float _1112 = -_1078;
    float _1114 = fma(_1112, _686, _1102);
    float _1116 = fma(_1082, _686, _1104);
    float _1118 = fma(_1084, _686, _1106);
    float _1120 = _1054 * _948;
    float _1122 = fma(_1092, _694, _1114);
    float _1124 = fma(_1110, _694, _1116);
    float _1126 = fma(_1100, _694, _1118);
    float _1128 = _1066 * _948;
    float _1130 = _486 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1132 = _1124 * _318;
    float _1134 = _1124 * _326;
    float _1136 = _1090 * _1028;
    float _1138 = _1090 * _944;
    float _1140 = fma(_1126, _296, _1132);
    float _1142 = fma(_1126, _304, _1134);
    float _1144 = _1090 * _1074;
    float _1146 = _1098 * _944;
    float _1148 = fma(_1122, _330, _1140);
    float _1150 = fma(_1122, _338, _1142);
    float _1152 = _1094 * _944;
    float _1154 = _1094 * _1028;
    float _1156 = _1130 + _1148;
    float _1158 = _1072 + _1150;
    float _1160 = _1098 * _1028;
    float _1162 = _1098 * _1074;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1166 = _1156 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1158 + _1168;
    float _1172 = _1094 * _1074;
    float _1174 = -_1078;
    float _1176 = fma(_1174, _1048, _1136);
    float _1178 = _1166 * _1166;
    float _1180 = _1170 * _1170;
    float _1182 = fma(_1084, _1048, _1160);
    float _1184 = fma(_1082, _1048, _1154);
    float _1186 = fma(_1084, _942, _1146);
    float _1188 = _1178 + _1180;
    float _1190 = fma(_1084, _1120, _1162);
    float _1192 = -_1078;
    float _1194 = fma(_1192, _942, _1138);
    float _1196 = -_1078;
    float _1198 = fma(_1196, _1120, _1144);
    float _1200 = sqrt(_1188);
    float _1202 = fma(_1082, _942, _1152);
    float _1204 = fma(_1082, _1120, _1172);
    float _1206 = fma(_1092, _1010, _1176);
    float _1208 = fma(_1100, _1010, _1182);
    float _1210 = fma(_1110, _1010, _1184);
    float _1212 = fma(_1100, _946, _1186);
    float _1214 = fma(_1100, _1128, _1190);
    float _1216 = _1124 * _322;
    float _1218 = fma(_1110, _946, _1202);
    float _1220 = fma(_1110, _1128, _1204);
    float _1222 = fma(_1092, _1128, _1198);
    float _1224 = fma(_1126, _300, _1216);
    float _1226 = _1218 * _318;
    float _1228 = _1218 * _322;
    float _1230 = _1210 * _318;
    bool _1232 = _1200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1210 * _322;
    float _1236 = fma(_1092, _946, _1194);
    float _1238 = _1218 * _326;
    float _1240 = _1210 * _326;
    float _1242 = _1220 * _326;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = fma(_1122, _334, _1224);
    float _1248 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1250 = _1220 * _318;
    float _1252 = _1220 * _322;
    float _1254 = fma(_1212, _296, _1226);
    float _1256 = _1248 + _1246;
    float _1258 = _1092;
    float _1260 = _1180;
    float _1262 = _1178;
    float _1264 = _1212;
    float _1266 = _1238;
    float _1268 = _1072;
    if (!_1232)
    {
        _1258 = _1180;
    }
    float _1270 = _1258;
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1274 = fma(_1212, _300, _1228);
    float _1276 = fma(_1212, _304, _1238);
    float _1278 = _1270;
    if (!_1232)
    {
        _1260 = _1178;
    }
    float _1280 = _1260;
    float _1282 = _1280;
    if (!_1232)
    {
        _1262 = _1156;
    }
    float _1284 = _1262;
    float _1286 = _1284;
    if (!_1232)
    {
        _1264 = _1158;
    }
    float _1288 = _1264;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1292 = _1288;
    if (!_1232)
    {
        _1266 = _1256;
    }
    float _1294 = _1266;
    bool _1296 = !_1232;
    float _1298 = _1294;
    if (!_1296)
    {
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1304 = _1200 + _1302;
        float _1306 = _1256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = rsqrt(_1188);
        float _1310 = _1304 * _1300;
        float _1312 = _1310 * 0.15915493667125701904296875;
        float _1314 = _1312 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1312 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = fma(_1316, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1324 = _1308 * _1322;
        float _1326 = _1320 + (-1.0);
        float _1328 = fma(_1166, _1324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1330 = fma(_1170, _1324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1336 = _1328 + _1334;
        float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1340 = _1330 + _1338;
        float _1342 = fma(_1256, _1320, _1332);
        float _1344 = _1336 * _1336;
        float _1346 = _1340 * _1340;
        _1298 = _1342;
        _1282 = _1344;
        _1278 = _1346;
        _1286 = _1328;
        _1292 = _1330;
    }
    float _1348 = _1298;
    float _1350 = _1282;
    float _1352 = _1278;
    float _1354 = _1286;
    float _1356 = _1292;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1360 = _1348 + _1358;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = _464 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1366 = fma(_1208, _296, _1230);
    float _1368 = fma(_1360, _1360, _1350);
    float _1370 = fma(_1208, _300, _1234);
    float _1372 = fma(_1208, _304, _1240);
    float _1374 = fma(_1214, _300, _1252);
    float _1376 = _1368 + _1352;
    float _1378 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = _1364 * _1290;
    float _1384 = fma(_1214, _296, _1250);
    float _1386 = _1380 * _1244;
    float _1388 = sqrt(_1376);
    float _1390 = fma(_1214, _304, _1242);
    float _1392 = fma(_1236, _334, _1274);
    float _1394 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1402 = _1378 * _1272;
    float _1404 = fma(_1236, _338, _1276);
    float _1406 = fma(_1236, _330, _1254);
    float _1408 = fma(_1206, _330, _1366);
    float _1410 = fma(_1222, _330, _1384);
    float _1412 = fma(_1206, _334, _1370);
    float _1414 = _1394 * _1362;
    float _1416 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1424 = fma(_1222, _334, _1374);
    float _1426 = fma(_1222, _338, _1390);
    float _1428 = fma(_1206, _338, _1372);
    out.m_87.x = _1386;
    out.m_87.y = _1402;
    out.m_87.z = _1414;
    out.m_87.w = _1382;
    bool _1430 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1432 = isnan(_1388);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1438 = _1434 || _1436;
    out.m_89.x = _1416;
    out.m_89.y = _1418;
    out.m_89.z = _1420;
    out.m_89.w = _1422;
    out.m_91.x = _1406;
    out.m_91.y = _1392;
    out.m_91.z = _1404;
    out.m_93.x = _1410;
    out.m_93.y = _1424;
    out.m_93.z = _1426;
    int _1440 = as_type<int>(_1362);
    if (!_1438)
    {
        _1044 = 1.0;
    }
    float _1442 = _1044;
    out.m_95.x = _1408;
    out.m_95.y = _1412;
    out.m_95.z = _1428;
    bool _1444 = !_1438;
    float _1446 = _1442;
    if (!_1444)
    {
        bool _1448 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1450 = isnan(_1388);
        bool _1452 = _1448 || _1450;
        bool _1454 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1456 = _1452 || _1454;
        if (!_1456)
        {
            float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1460 = _1388 + _1458;
            float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1464 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1462;
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1468 = _1466 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1470 = 1.0 / _1464;
            float _1472 = _1460 * _1470;
            float _1474 = fma(_1472, _1468, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1446 = _1474;
            _1476 = true;
        }
        else
        {
            bool _1478 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1480 = isnan(_1388);
            bool _1482 = _1478 || _1480;
            bool _1484 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1486 = _1482 || _1484;
            if (!_1486)
            {
                float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1490 = _1388 + _1488;
                float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1494 = _1492 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1498 = _1496 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1500 = 1.0 / _1494;
                float _1502 = _1490 * _1500;
                float _1504 = fma(_1502, _1498, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1446 = _1504;
                _1476 = true;
            }
            else
            {
                _1446 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1476 = false;
    float _1506 = _1446;
    float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1510 = _1348 + _1508;
    float _1512 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1354 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1356 + _1518;
    float _1522 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1512);
    float _1526 = fma(_1516, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1528 = fma(_1520, _1506, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1522 + _1530;
    float _1534 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1524);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1526 + _1536;
    float _1540 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1542 = _1532 * _1532;
    float _1544 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1548 = _1528 + _1546;
    float _1550 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1540);
    float _1552 = fma(_1538, _1538, _1542);
    float _1554 = 1.0 / _1544;
    float _1556 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1550);
    float _1558 = fma(_1548, _1548, _1552);
    float _1560 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1562 = rsqrt(_1558);
    float _1564 = _1560 + _1544;
    float _1566 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1568 = _1248 + _1566;
    float _1570 = _1564 * _1554;
    float _1572 = _1570 * 0.5;
    float _1574 = sqrt(_1558);
    float _1576 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1578 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1582 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
    float _1584 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1578);
    float _1586 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1588 = 1.0 / _1582;
    float _1590 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1584);
    float _1592 = _1538 * _1586;
    float _1594 = _1548 * _1586;
    float _1596 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1598 = _1592 * _1592;
    float _1600 = _1594 * _1594;
    float _1602 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1604 = trunc(_1596);
    int _1606 = int(_1604);
    float _1608 = _1598 + _1600;
    float _1610 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1602);
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1614 = _1588 * _1612;
    float _1616 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1610);
    float _1618 = sqrt(_1608);
    bool _1620 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1622 = _1616 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1624 = _1614 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1626 = !_1620;
    int _1628 = _1626 ? 0 : 1;
    float _1630 = trunc(_1622);
    int _1632 = int(_1630);
    bool _1634 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1638 = _1618 + _1636;
    int _1640 = 2;
    float _1642 = _1638;
    int _1644 = as_type<int>(_1532);
    float _1646 = _1592;
    float _1648 = _1594;
    float _1650 = _1598;
    float _1652 = _1600;
    float _1654 = _1614;
    if (!_1620)
    {
        _1640 = 1;
    }
    int _1656 = _1640;
    float _1658 = floor(_1576);
    int _1660 = _1656;
    if (!_1624)
    {
        _1660 = _1628;
    }
    int _1662 = _1660;
    int _1664 = _1662 << 6;
    int _1666 = _1664 + 96;
    uint _1669 = uint(int(uint(_1666) >> uint(2)));
    uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
    int _1673 = int(_1669) & 3;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
    int _1677 = int(_1669) + 1;
    uint _1679 = uint(int(uint(_1677) >> uint(2)));
    int _1681 = _1677 & 3;
    float _1683 = (*spvDescriptorSet0.vp_c15)._m0[int(_1679)][_1681];
    float _1685 = _1402;
    float _1687 = as_type<float>(_1662);
    if (_1634)
    {
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1685 = _1689;
    }
    float _1691 = _1685;
    float _1693 = -_1658;
    float _1695 = _1576 + _1693;
    int _1697 = _1664 + 104;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    if (_1634)
    {
        float _1715 = _1638 * _1691;
        _1642 = _1715;
    }
    float _1717 = _1642;
    int _1719 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1721 = _1606 + _1719;
    int _1723 = _1721 + 1;
    if (_1634)
    {
        float _1725 = _1717 * 0.15915493667125701904296875;
        _994 = _1725;
    }
    float _1727 = _994;
    int _1729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1731 = _1632 + _1729;
    int _1733 = _1731 + 1;
    float _1735 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = _1410;
    if (_1634)
    {
        float _1739 = _1727 * 6.283185482025146484375;
        float _1741 = cos(_1739);
        _1737 = _1741;
    }
    float _1743 = _1737;
    bool _1745 = _1733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1747 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    int _1749 = _1733 | _1723;
    float _1751 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    bool _1753 = _1749 < 0;
    bool _1755 = _1753 || _1745;
    float _1757 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1759 = _1424;
    if (_1634)
    {
        float _1761 = _1727 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        _1759 = _1763;
    }
    float _1765 = _1759;
    float _1767 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1769 = _1723 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1771 = _1769 || _1755;
    float _1773 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1775 = precise::max(0.0, _1757);
    float _1777 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = _1751;
    float _1781 = _1773;
    if (_1634)
    {
        float _1783 = rsqrt(_1608);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = -_1586;
    float _1789 = -_1775;
    float _1791 = fma(_1532, _1787, _1789);
    float _1793 = -_1777;
    float _1795 = fma(_1793, _1773, 1.0);
    float _1797 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1799 = _1791;
    if (_1634)
    {
        float _1801 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1781 = _1801;
    }
    float _1803 = _1781;
    float _1805 = _1568 * _1683;
    float _1807 = _1683;
    float _1809 = _1803;
    if (!_1771)
    {
        int _1811 = _1723 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1813 = _1811 + _1733;
        _1644 = _1813;
    }
    int _1815 = _1644;
    float _1817 = as_type<float>(_1815);
    if (_1634)
    {
        float _1819 = _1743 + (-1.0);
        _1807 = _1819;
    }
    float _1821 = _1807;
    float _1823 = _1821;
    if (_1634)
    {
        float _1825 = fma(_1765, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1809 = _1825;
    }
    float _1827 = _1809;
    int _1829 = _1664 + 48;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    uint _1833 = uint(int(uint(int(_1831)) >> uint(2)));
    int _1835 = int(_1831) & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = int(_1831) + 1;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    int _1843 = _1839 & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    float _1847 = fma(_1130, _1675, _1805);
    if (_1634)
    {
        float _1849 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1823 = _1849;
    }
    float _1851 = _1823;
    float _1853 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1855 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1853);
    float _1857 = precise::clamp(_1855, 0.0, 1.0);
    float _1859 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1797);
    float _1861 = fma(_1072, _1705, _1847);
    float _1863 = _1785;
    if (_1634)
    {
        float _1865 = _1785 * _1827;
        _1863 = _1865;
    }
    float _1867 = _1863;
    if (_1634)
    {
        float _1869 = fma(_1791, _1743, _1851);
        _1799 = _1869;
    }
    float _1871 = _1799;
    int _1873 = _1664 + 64;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    uint _1877 = uint(int(uint(int(_1875)) >> uint(2)));
    int _1879 = int(_1875) & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    int _1883 = int(_1875) + 1;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    int _1887 = _1883 & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    if (_1634)
    {
        float _1891 = _1592 * _1867;
        _1646 = _1891;
    }
    float _1893 = _1646;
    if (_1634)
    {
        float _1895 = _1594 * _1867;
        _1648 = _1895;
    }
    float _1897 = _1648;
    float _1899 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1901 = -_1857;
    float _1903 = _1901 + 1.0;
    if (_1634)
    {
        float _1905 = _1893 * _1893;
        _1650 = _1905;
    }
    float _1907 = _1650;
    float _1909 = fma(_1130, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1911 = _1664 + 56;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    uint _1915 = uint(int(uint(int(_1913)) >> uint(2)));
    int _1917 = int(_1913) & 3;
    float _1919 = (*spvDescriptorSet0.vp_c15)._m0[int(_1915)][_1917];
    int _1921 = int(_1913) + 1;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    int _1925 = _1921 & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    float _1929 = _1909;
    if (_1634)
    {
        float _1931 = _1897 * _1897;
        _1652 = _1931;
    }
    float _1933 = _1652;
    float _1935 = fma(_1871, _1871, _1907);
    float _1937 = _1522 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1939 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1899);
    if (!_1771)
    {
        int _1941 = _1815 << 2;
        _1440 = _1941;
    }
    int _1943 = _1440;
    float _1945 = _1935 + _1933;
    float _1947 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1937);
    int _1949 = _1664 + 72;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    uint _1953 = uint(int(uint(int(_1951)) >> uint(2)));
    int _1955 = int(_1951) & 3;
    float _1957 = (*spvDescriptorSet0.vp_c15)._m0[int(_1953)][_1955];
    int _1959 = int(_1951) + 1;
    uint _1961 = uint(int(uint(_1959) >> uint(2)));
    int _1963 = _1959 & 3;
    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[int(_1961)][_1963];
    float _1967 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1939);
    int _1969 = _1943;
    if (!_1771)
    {
        uint _1971 = uint(int(uint(_1815) >> uint(2)));
        _740 = int(_1971);
    }
    int _1973 = _740;
    float _1975 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1947);
    if (!_1771)
    {
        int _1977 = 12 & _1943;
        _1969 = _1977;
    }
    int _1979 = _1969;
    float _1981 = _1967 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1983 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1859);
    float _1985 = _1975 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1987 = _1664 + 80;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    uint _1991 = uint(int(uint(int(_1989)) >> uint(2)));
    int _1993 = int(_1989) & 3;
    float _1995 = (*spvDescriptorSet0.vp_c15)._m0[int(_1991)][_1993];
    int _1997 = int(_1989) + 1;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    int _2001 = _1997 & 3;
    float _2003 = (*spvDescriptorSet0.vp_c15)._m0[int(_1999)][_2001];
    float _2005 = _1861 + _1713;
    float _2007 = rsqrt(_1945);
    float _2009 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2011 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2013 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2009);
    int _2015 = _1664 + 88;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    uint _2019 = uint(int(uint(int(_2017)) >> uint(2)));
    int _2021 = int(_2017) & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    int _2025 = int(_2017) + 1;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    int _2029 = _2025 & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    float _2033 = _2009;
    if (!_1771)
    {
        int _2035 = _1973 << 4;
        int _2037 = _2035 + _1979;
        _2033 = as_type<float>(_2037);
    }
    float _2039 = _2033;
    float _2041 = 1.0 / _2005;
    float _2043 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2013);
    float _2045 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2043);
    float _2047 = _1568 * _1845;
    float _2049 = _2039;
    if (!_1771)
    {
        int _2051 = as_type<int>(_2039) + 400;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        uint _2055 = uint(int(uint(int(_2053)) >> uint(2)));
        int _2057 = int(_2053) & 3;
        float _2059 = (*spvDescriptorSet0.vp_c15)._m0[int(_2055)][_2057];
        _2049 = _2059;
    }
    float _2061 = _2049;
    float _2063 = _2007 * _1893;
    float _2065 = _2007 * _1871;
    float _2067 = fma(_1130, _1837, _2047);
    float _2069 = _2007 * _1897;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2073 = floor(_1909);
    float _2075 = _1568 * _1889;
    float _2077 = fma(_1130, _1881, _2075);
    float _2079 = abs(_1903);
    float _2081 = log2(_2079);
    float _2083 = fma(_1072, _1919, _2067);
    float _2085 = _2083 + _1927;
    float _2087 = -_2071;
    float _2089 = fma(_2065, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = _1927;
    if (!_1771)
    {
        float _2093 = floor(_1596);
        _2091 = _2093;
    }
    float _2095 = _2091;
    float _2097 = fma(_1072, _1957, _2077);
    float _2099 = _2085 * _2041;
    float _2101 = -_2069;
    float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2105 = -_2073;
    float _2107 = _1909 + _2105;
    float _2109 = _2097 + _1965;
    bool _2111 = _2099 >= 0.0;
    float _2113 = fma(_2103, -0.5, 0.5);
    float _2115 = _2109 * _2041;
    float _2117 = _1568 * _2003;
    bool _2119 = _2099 <= 1.0;
    bool _2121 = _2119 && _2111;
    float _2123 = fma(_2103, 0.5, 0.5);
    float _2125 = fma(_1130, _1995, _2117);
    bool _2127 = _2115 >= 0.0;
    bool _2129 = _2127 && _2121;
    float _2131 = sqrt(_2113);
    if (!_1771)
    {
        float _2133 = -_2095;
        float _2135 = _1596 + _2133;
        _1929 = _2135;
    }
    float _2137 = _1929;
    float _2139 = fma(_1072, _2023, _2125);
    bool _2141 = _2115 <= 1.0;
    bool _2143 = _2141 && _2129;
    float _2145 = fma(_2123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2147 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = _2139 + _2031;
    float _2151 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2153 = fma(_2123, _2145, -0.212114393711090087890625);
    float _2155 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2157 = 1.0 / _2045;
    float _2159 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2151);
    float _2161 = fma(_2123, _2153, 1.570728778839111328125);
    float _2163 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2155);
    float _2165 = _2065 + 1.0;
    float _2167 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2159);
    float _2169 = _2155;
    if (_2143)
    {
        float _2171 = float(_1662);
        _1687 = _2171;
    }
    float _2173 = _1687;
    float _2175 = _2131 * 0.636619746685028076171875;
    float _2177 = exp2(_2147);
    float _2179 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2163);
    float _2181 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2167);
    float _2183 = -_2161;
    float _2185 = fma(_2175, _2183, 1.0);
    float _2187 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2179);
    float _2189 = log2(_1795);
    float _2191 = _2187 * _2157;
    float _2193 = _2181 * _2157;
    float _2195 = fma(_2191, -0.5, 0.5);
    float _2197 = fma(_2193, 0.5, 0.5);
    float _2199 = _2069;
    float _2201 = _2181;
    if (!_1771)
    {
        float _2203 = floor(_1622);
        _2199 = _2203;
    }
    float _2205 = _2199;
    float _2207 = -_2065;
    float _2209 = fma(_2177, _2165, _2207);
    float _2211 = _2149 * _2041;
    float _2213 = fma(_2209, 0.5, 0.5);
    float _2215 = _2139;
    if (!_1771)
    {
        float _2217 = rint(_2061);
        float _2219 = precise::max(_2217, 0.0);
        uint _2221 = uint(_2219);
        uint _2223 = clamp(_2221, 0u, 65535u);
        _2215 = as_type<float>(_2223);
    }
    float _2225 = _2215;
    float _2227 = _2189 * 0.693147182464599609375;
    float _2229 = _2163;
    if (_2143)
    {
        float _2231 = rint(_2173);
        float _2233 = precise::max(_2231, 0.0);
        uint _2235 = uint(_2233);
        uint _2237 = clamp(_2235, 0u, 65535u);
        _2229 = as_type<float>(_2237);
    }
    float _2239 = _2229;
    if (!_1771)
    {
        float _2241 = -_2205;
        float _2243 = _1622 + _2241;
        _2169 = _2243;
    }
    float _2245 = _2169;
    float _2247 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6371 = float2(_2107, _1695);
    float _2249 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6371, float2(0.0), isnan(_6371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6371, float2(0.0), isnan(_6371)), level(0.0)).x;
    float _2251 = _2225;
    if (!_1771)
    {
        float3 _6388 = float3(_2245, _2137, float(as_type<int>(_2225)));
        float3 _6392 = select(_6388, float3(0.0), isnan(_6388));
        float _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6392.xy, uint(rint(_6392.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6392.xy, uint(rint(_6392.z)), level(0.0)).x;
        _2251 = _2253;
    }
    float _2255 = _2251;
    float _2257 = _2115;
    if (_2143)
    {
        float3 _6407 = float3(_2099, _2115, float(as_type<int>(_2239)));
        float3 _6409 = select(_6407, float3(0.0), isnan(_6407));
        float _2259 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6409.xy, uint(rint(_6409.z)), _2211, level(0.0));
        _2257 = _2259;
    }
    float _2261 = _2257;
    float3 _6419 = float3(_2197, _2195, _2247);
    float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6419, float3(0.0), isnan(_6419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6419, float3(0.0), isnan(_6419)), level(0.0)).x;
    float3 _6428 = float3(_2197, _2195, _2247);
    float4 _2266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6428, float3(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6428, float3(0.0), isnan(_6428)), level(0.0)).xyzw;
    float _2268 = _2266.x;
    float _2270 = _2266.y;
    float _2272 = _2266.z;
    float _2274 = _2266.w;
    float2 _6444 = float2(_2185, _2213);
    float3 _2278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6444, float2(0.0), isnan(_6444)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6444, float2(0.0), isnan(_6444)), level(0.0)).xyz;
    float _2280 = _2278.x;
    float _2282 = _2278.y;
    float _2284 = _2278.z;
    float _2286 = abs(_1614);
    float _2288 = log2(_2286);
    float _2290 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2292 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2294 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2290);
    float _2296 = exp2(_2292);
    float _2298 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2294);
    float _2300 = _2045 * 0.5;
    float _2302 = _2181 + _2045;
    float _2304 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2298);
    float _2306 = _2302 * 0.5;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2310 = _2304 + _2045;
    float _2312 = fma(_2187, -0.5, _2300);
    out.gl_Position.x = _2181;
    out.gl_Position.y = _2187;
    out.gl_Position.z = _2304;
    out.gl_Position.w = _2045;
    float _2314 = _2310 * 0.5;
    float _2316 = exp2(_2308);
    out.m_97.x = _2306;
    out.m_97.y = _2312;
    out.m_97.z = _2314;
    out.m_97.w = _2045;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = fma(_2320, -2.0, 3.0);
    float _2324 = _2320 * _2320;
    bool _2326 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.5);
    bool _2334 = _2330 || _2332;
    float _2336 = _2324 * _2322;
    bool _2338 = _1614 <= 8000.0;
    bool _2340 = isnan(_1614);
    bool _2342 = _2338 || _2340;
    bool _2344 = isnan(8000.0);
    bool _2346 = _2342 || _2344;
    float _2348 = float(_2346);
    float _2350 = -_2336;
    float _2352 = _2350 + 1.0;
    float _2354 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2336);
    float _2356 = _2348;
    if (_2334)
    {
        _2201 = 1.0;
    }
    float _2358 = _2201;
    float _2360 = _2348 * _2354;
    float _2362 = _2358;
    float _2364 = _2360;
    if (_2334)
    {
        _2356 = 1.0;
    }
    float _2366 = _2356;
    float _2368 = _2366;
    if (!_2334)
    {
        float _2370 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2374 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2372;
        float _2376 = _2370 * 0.15915493667125701904296875;
        float _2378 = _2376 * 6.283185482025146484375;
        float _2380 = cos(_2378);
        float _2382 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2384 = _2382 * 0.15915493667125701904296875;
        float _2386 = _2376 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        float _2390 = 1.0 / _2380;
        float _2392 = _2384 * 6.283185482025146484375;
        float _2394 = cos(_2392);
        float _2396 = _2388 * _2390;
        float _2398 = _2384 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        float _2402 = _2394 * _2396;
        float _2404 = 1.0 / _2374;
        float _2406 = 1.0 / _2402;
        float _2408 = _2400 * _2406;
        float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2412 = fma(_1614, _2408, _2410);
        float _2414 = _2412 * _2404;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        _2362 = _2416;
    }
    float _2418 = _2362;
    if (!_2334)
    {
        float _2420 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2422 = _2420 * 0.15915493667125701904296875;
        float _2424 = _2422 * 6.283185482025146484375;
        float _2426 = cos(_2424);
        float _2428 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2422 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = 1.0 / _2426;
        float _2438 = _2430 * 6.283185482025146484375;
        float _2440 = cos(_2438);
        float _2442 = _2434 * _2436;
        float _2444 = _2430 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2440 * _2442;
        float _2450 = 1.0 / _2448;
        float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2454 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2452;
        float _2456 = 1.0 / _2454;
        float _2458 = _2446 * _2450;
        float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2462 = fma(_1614, _2458, _2460);
        float _2464 = _2462 * _2456;
        float _2466 = precise::clamp(_2464, 0.0, 1.0);
        float _2468 = -_2466;
        float _2470 = _2468 + 1.0;
        _1654 = _2466;
        _2368 = _2470;
    }
    float _2472 = _1654;
    float _2474 = _2368;
    float _2476 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2478 = -_2249;
    float _2480 = _2478 + 1.0;
    float _2482 = -_2296;
    float _2484 = _2482 + 1.0;
    float _2486 = _2472;
    if (!_2143)
    {
        _2364 = 1.0;
    }
    float _2488 = _2364;
    float _2490 = _2480 * _2476;
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = _2488;
    if (_2143)
    {
        bool _2496 = _2261 >= _2211;
        bool _2498 = isnan(_2261);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan(_2211);
        bool _2504 = _2500 || _2502;
        float _2506 = float(_2504);
        _2494 = _2506;
    }
    float _2508 = _2494;
    float _2510 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1771)
    {
        _2486 = 1.0;
    }
    float _2512 = _2486;
    float _2514 = _2512;
    if (!_1771)
    {
        int _2516 = _1815 << 4;
        int _2518 = _2516 + 2048;
        uint _2520 = uint(int(uint(_2518) >> uint(2)));
        uint _2522 = uint(int(uint(int(_2520)) >> uint(2)));
        int _2524 = int(_2520) & 3;
        float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
        int _2528 = int(_2520) + 1;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        int _2532 = _2528 & 3;
        float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
        int _2536 = _2518 + 8;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        uint _2540 = uint(int(uint(int(_2538)) >> uint(2)));
        int _2542 = int(_2538) & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = int(_2538) + 1;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        int _2550 = _2546 & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        float _2554 = _1568 * _2534;
        float _2556 = fma(_1130, _2526, _2554);
        float _2558 = fma(_1072, _2544, _2556);
        float _2560 = _2558 + _2552;
        float _2562 = precise::clamp(_2560, 0.0, 1.0);
        float _2564 = -_2562;
        float _2566 = _2564 + _2255;
        float _2568 = fma(_2566, 500.0, 1.5);
        float _2570 = exp2(_2568);
        float _2572 = 0.0 + _2570;
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        _2514 = _2574;
        _1817 = as_type<float>(_2518);
    }
    float _2576 = _2514;
    float _2578 = _1817;
    float _2580 = _2508 * _2576;
    float _2582 = _2510 * _2263;
    float _2584 = -_2492;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2588 = -_2510;
    float _2590 = _2588 + 1.0;
    out.m_99.x = _1526;
    out.m_99.y = _1522;
    out.m_99.z = _1528;
    float _2592 = _2274 * _2582;
    float _2594 = -_2580;
    float _2596 = fma(_2594, _2586, 1.0);
    float _2598 = precise::clamp(_2596, 0.0, 1.0);
    float _2600 = _2284 * _2582;
    float _2602 = _2274 * _2590;
    float _2604 = fma(_2280, _2592, _2268);
    float _2606 = fma(_2282, _2592, _2270);
    float _2608 = _2598 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2610 = fma(_2274, _2600, _2272);
    bool _2612 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2614 = isnan(_1574);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2620 = _2616 || _2618;
    float _2622 = _2418 * _2474;
    out.m_101.x = _2608;
    float _2624 = _2622 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2604;
    out.m_103.y = _2606;
    out.m_103.z = _2610;
    out.m_103.w = _2602;
    float _2626 = _2578;
    float _2628 = _2590;
    float _2630 = _2580;
    float _2632 = _2592;
    float _2634 = _2598;
    if (!_2620)
    {
        _1268 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2636 = _1268;
    float _2638 = _2636;
    float _2640 = _2636;
    if (!_2620)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2642 = _2626;
    float _2644 = _2642;
    float _2646 = _2642;
    if (!_2620)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _2628;
    float _2650 = _2648;
    float _2652 = _2648;
    if (!_2620)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2654 = _2630;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2620)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2660 = _2632;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2620)
    {
        _2634 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2634;
    bool _2668 = !_2620;
    float _2670 = _2666;
    float _2672 = _2666;
    if (!_2668)
    {
        bool _2674 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2676 = isnan(_1574);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2682 = _2678 || _2680;
        if (!_2682)
        {
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2686 = _1574 + _2684;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2688;
            float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2696 = 1.0 / _2690;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2714 = _2686 * _2696;
            float _2716 = precise::clamp(_2714, 0.0, 1.0);
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2722 = fma(_2716, _2694, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2724 = fma(_2716, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2726 = fma(_2716, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2728 = fma(_2716, _2704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2730 = fma(_2716, _2708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2732 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2646 = _2722;
            _2664 = _2730;
            _2640 = _2726;
            _2658 = _2728;
            _2652 = _2724;
            _2672 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2738 = isnan(_1574);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2746 = _2638;
            _2640 = _2746;
            if (!_2744)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2748 = _2644;
            _2646 = _2748;
            if (!_2744)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2750 = _2650;
            _2652 = _2750;
            if (!_2744)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2752 = _2656;
            _2658 = _2752;
            if (!_2744)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2754 = _2662;
            _2664 = _2754;
            if (!_2744)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2756 = _2670;
            bool _2758 = !_2744;
            _2672 = _2756;
            if (!_2758)
            {
                bool _2760 = _1574 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2762 = isnan(_1574);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2772 = _1574 + _2770;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2774;
                    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2782 = 1.0 / _2776;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2800 = _2772 * _2782;
                    float _2802 = precise::clamp(_2800, 0.0, 1.0);
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2808 = fma(_2802, _2780, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2810 = fma(_2802, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2812 = fma(_2802, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2814 = fma(_2802, _2790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2816 = fma(_2802, _2794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2818 = fma(_2802, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2646 = _2808;
                    _2664 = _2816;
                    _2640 = _2812;
                    _2658 = _2814;
                    _2652 = _2810;
                    _2672 = _2818;
                    _2734 = true;
                }
                else
                {
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2734 = false;
    float _2820 = _2646;
    float _2822 = _2664;
    float _2824 = _2640;
    float _2826 = _2658;
    float _2828 = _2652;
    float _2830 = _2672;
    float _2832 = fma(_1412, -0.5, 0.5);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = -_2820;
    float _2838 = _2836 + _2822;
    float _2840 = _2624 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2842 = -_2824;
    float _2844 = _2842 + _2826;
    out.m_105.x = 0.0;
    float _2846 = fma(_2834, _2838, _2820);
    float _2848 = fma(_2834, _2844, _2824);
    out.m_61.x = _2840;
    float _2850 = -_2828;
    float _2852 = _2850 + _2830;
    float _2854 = _2846 * 0.586610972881317138671875;
    bool _2856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2858 = fma(_2834, _2852, _2828);
    float _2860 = fma(_2848, 0.298911988735198974609375, _2854);
    bool _2862 = _2418 > 0.0;
    bool _2864 = isnan(_2418);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan(0.0);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2858, 0.114477999508380889892578125, _2860);
    bool _2874 = _2474 <= 0.0;
    bool _2876 = !_2870;
    bool _2878 = _2874 || _2876;
    float _2880 = -_2872;
    float _2882 = _2848 + _2880;
    float _2884 = -_2872;
    float _2886 = _2846 + _2884;
    float _2888 = -_2872;
    float _2890 = _2858 + _2888;
    float _2892 = fma(_2882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2894 = fma(_2886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    bool _2898 = !_2856;
    if (!_2898)
    {
        float _2900 = -_1522;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2904 = -_1526;
        float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2908 = -_1528;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2912 = _2902 * _2902;
        float _2914 = fma(_2906, _2906, _2912);
        float _2916 = fma(_2910, _2910, _2914);
        float _2918 = sqrt(_2916);
        float _2920 = rsqrt(_2916);
        float _2922 = -_2918;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = _2906 * _2920;
        float _2932 = _2902 * _2920;
        float _2934 = abs(_2928);
        float _2936 = log2(_2934);
        float _2938 = _2910 * _2920;
        float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2942 = _1412 * _2932;
        float _2944 = -_2932;
        float _2946 = -_2940;
        float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
        float _2950 = fma(_1408, _2930, _2942);
        float _2952 = -_2938;
        float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
        float _2956 = fma(_1428, _2938, _2950);
        float _2958 = precise::clamp(_2956, 0.0, 1.0);
        float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2962 = _2954 + _2960;
        float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = exp2(_2964);
        float _2972 = _2970 * _2968;
        float _2974 = _2958 * _2972;
        float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2976;
        out.m_105.y = _2978;
        out.m_105.z = _2980;
    }
    out.m_107.x = _2892;
    out.m_107.y = _2894;
    out.m_107.z = _2896;
    if (!_2878)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2982 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2982;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

