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
    float4 m_73 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
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
    bool _2438 = false;
    bool _1207 = false;
    bool _352 = false;
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
        float _2783 = as_type<float>(_134);
        out.gl_Position.z = _2783;
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
        float _2853 = as_type<float>(_172);
        out.gl_Position.z = _2853;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = in.m_67.x;
    float _182 = in.m_67.y;
    float _184 = in.m_67.z;
    float _186 = in.m_69.x;
    float _188 = in.m_69.y;
    float _190 = in.m_69.z;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    bool _216 = _210 > 0.0;
    bool _218 = _212 > 0.0;
    float _220 = _212;
    float _222 = _204;
    float _224 = _208;
    if (_216)
    {
        float _226 = rsqrt(_204);
        _220 = _226;
    }
    float _228 = _220;
    float _230 = 0.0;
    if (!_216)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _214 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    if (!_216)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = 0.0;
    float _244 = _240;
    if (!_216)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = _214;
    float _250 = _246;
    if (_218)
    {
        float _252 = rsqrt(_206);
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = 0.0;
    if (!_218)
    {
        _256 = 0.0;
        _258 = 0.0;
    }
    float _260 = _256;
    float _262 = _258;
    float _264 = 0.0;
    float _266 = _262;
    float _268 = _260;
    if (!_218)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = _210;
    float _274 = _270;
    if (_234)
    {
        float _276 = rsqrt(_208);
        _272 = _276;
    }
    float _278 = _272;
    if (_216)
    {
        float _280 = _228 * _180;
        _238 = _280;
    }
    float _282 = _238;
    if (_216)
    {
        float _284 = _228 * _174;
        _244 = _284;
    }
    float _286 = _244;
    if (_216)
    {
        float _288 = _228 * _186;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _294 = 0.0;
    if (!_234)
    {
        _294 = 0.0;
    }
    float _296 = _294;
    float _298 = _296;
    if (!_234)
    {
        _222 = 0.0;
    }
    float _300 = _222;
    float _302 = _300;
    if (_218)
    {
        float _304 = _254 * _182;
        _274 = _304;
    }
    float _306 = _274;
    if (!_234)
    {
        _224 = 0.0;
    }
    float _308 = _224;
    float _310 = _308;
    if (_218)
    {
        float _312 = _254 * _176;
        _266 = _312;
    }
    float _314 = _266;
    if (_218)
    {
        float _316 = _254 * _188;
        _268 = _316;
    }
    float _318 = _268;
    if (_234)
    {
        float _320 = _278 * _184;
        _298 = _320;
    }
    float _322 = _298;
    if (_234)
    {
        float _324 = _278 * _178;
        _310 = _324;
    }
    float _326 = _310;
    if (_234)
    {
        float _328 = _278 * _190;
        _302 = _328;
    }
    float _330 = _302;
    bool _332 = !_292;
    float _350;
    if (!_332)
    {
        float _334 = in.m_71.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_118);
        float _356 = 1.0 / _354;
        float _358 = _152 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_71.z;
    float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _366 = log2(_364);
    float _368 = in.m_71.x;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _372 = _360 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = in.m_71.y;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _394 = _392 != 0;
    float _396 = 1.0 / _376;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _360 + _398;
    float _402 = in.m_58.x;
    float _404 = in.m_58.y;
    float _406 = in.m_58.z;
    float _408 = 1.0 / _380;
    float _410 = _366 * _152;
    float _412 = _362 * 2.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _400 * _396;
    float _420 = _368 * 2.0;
    float _422 = _368 + _362;
    float _424 = floor(_412);
    float _426 = _382 * 2.0;
    float _428 = _422 + (-1.0);
    float _430 = _372 * _408;
    float _432 = _182 * _404;
    float _434 = _382 + _362;
    float _436 = floor(_420);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _440 = fma(_180, _402, _432);
    float _442 = _368 + _382;
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _434 + (-1.0);
    float _450 = _188 * _404;
    float _452 = _442 + (-1.0);
    float _454 = floor(_426);
    bool _456 = _424 > 0.0;
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _460 = _424 >= 0.0;
    bool _462 = isnan(_424);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_186, _402, _450);
    float _472 = fma(_184, _406, _440);
    int _474 = _468 ? 0 : 1;
    float _476 = fma(_190, _406, _470);
    bool _478 = _436 > 0.0;
    float _480 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _482 = ~_474;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _488;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _504 = _486;
    float _506 = _402;
    if (!_456)
    {
        int _508 = ~_474;
        int _510 = _508 + 1;
        _504 = _510;
    }
    int _512 = _504;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _514;
    int _518 = abs(_446);
    float _520 = _176 * _404;
    bool _522 = _454 > 0.0;
    float _524 = fma(_516, _418, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _526 = _454 >= 0.0;
    bool _528 = isnan(_454);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = fma(_490, _418, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = exp2(_410);
    float _540 = float(_518);
    float _542 = fma(_416, _418, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _544 = float(_512);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _554 = _500 ? 0 : 1;
    float _556 = _540 * _544;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _562 = in.m_73.x;
    float _564 = in.m_73.y;
    float _566 = in.m_73.z;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    int _572 = ~_554;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = _556 * (-2.0);
    int _580 = _576;
    if (!_478)
    {
        int _582 = ~_554;
        int _584 = _582 + 1;
        _580 = _584;
    }
    int _586 = _580;
    float _588 = 1.0 / _570;
    bool _590 = !_390;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_174, _402, _520);
    bool _596 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    int _606 = abs(_592);
    float _608 = -_538;
    float _610 = _608 + 1.0;
    float _612 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _614 = fma(_560, _430, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _624 = _620 || _622;
    float _626 = fma(_552, _430, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _628 = float(_606);
    float _630 = fma(_178, _406, _594);
    float _632 = float(_586);
    float _634 = _624 ? _610 : 0.0;
    int _636 = _534 ? 0 : 1;
    float _638 = _628 * _632;
    float _640 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_604)
    {
        float _642 = _634 * _588;
        _154 = _642;
    }
    float _644 = _154;
    float _646 = fma(_480, _578, _480);
    float _648 = _638 * (-2.0);
    float _650 = fma(_578, _562, _562);
    float _652 = _640 * _368;
    float _654 = _368 + (-0.5);
    bool _656 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _658 = isnan(_360);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = fma(_458, _648, _458);
    bool _670 = !_394;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_648, _564, _564);
    float _676 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _650);
    int _678 = ~_636;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = -_666;
    float _686 = _684 + 1.0;
    bool _688 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _690 = isnan(_360);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = fma(_646, _644, _676);
    int _702 = _682;
    if (!_522)
    {
        int _704 = ~_636;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    float _710 = trunc(_652);
    int _712 = int(_710);
    int _714 = abs(_672);
    float _716 = _698 * _686;
    bool _718 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _720 = isnan(_360);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _382 + (-0.5);
    float _732 = float(_714);
    float _734 = -_698;
    float _736 = _734 + 1.0;
    float _738 = float(_708);
    float _740 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _742 = _700 * 0.15915493667125701904296875;
    float _744 = _728 * _736;
    float _746 = -_728;
    float _748 = _746 + 1.0;
    float _750 = _732 * _738;
    float _752 = fma(_668, _644, _740);
    float _754 = _524 * _744;
    float _756 = _536 * _744;
    float _758 = _542 * _744;
    float _760 = _750 * (-2.0);
    float _762 = in.m_75.x;
    float _764 = in.m_75.y;
    float _766 = in.m_75.z;
    float _768 = _752 * 0.15915493667125701904296875;
    float _770 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].z, _758);
    float _772 = fma(_438, _760, _438);
    float _774 = fma(_760, _566, _566);
    float _776 = _362 + (-0.5);
    float _778 = in.m_77.x;
    float _780 = in.m_77.y;
    float _782 = in.m_77.z;
    float _784 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].y, _756);
    float _786 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].x, _754);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _790 = fma(_626, _716, _770);
    float _792 = fma(_614, _716, _784);
    float _794 = fma(_612, _716, _786);
    float _796 = fma(_772, _644, _788);
    float _798 = _742 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].y, _792);
    float _804 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].z, _790);
    float _806 = _796 * 0.15915493667125701904296875;
    float _808 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].x, _794);
    int _810 = _712 << 4;
    int _812 = _810 + 1712;
    float _814 = _742 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _804 * _766;
    float _820 = _808 * _762;
    float _822 = _802 * _764;
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _828 = _768 * 6.283185482025146484375;
    float _830 = cos(_828);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _778);
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _780);
    float _836 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _840 = _826 * _832;
    bool _842 = _780 != 0.0;
    bool _844 = isnan(_780);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = _836 * _834;
    float _854 = _806 * 6.283185482025146484375;
    float _856 = cos(_854);
    float _858 = _824 * _838;
    bool _860 = _778 == 0.0;
    bool _862 = !_850;
    bool _864 = _860 && _862;
    bool _866 = _782 == 0.0;
    bool _868 = _866 && _864;
    float _870 = _768 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _800 * _830;
    float _876 = _816 * _830;
    float _878 = _806 * 6.283185482025146484375;
    float _880 = sin(_878);
    float _882 = _830 * _856;
    float _884 = _816 * _856;
    float _886 = _800 * _856;
    float _888 = _884 * _852;
    float _890 = _886 * _852;
    float _892 = _800 * _872;
    float _894 = _816 * _872;
    float _896 = _872 * _856;
    float _898 = _476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = fma(_880, _876, _892);
    float _902 = -_894;
    float _904 = fma(_880, _874, _902);
    float _906 = -_874;
    float _908 = fma(_880, _894, _906);
    float _910 = -_852;
    float _912 = _880 * _910;
    float _914 = fma(_900, _840, _888);
    float _916 = fma(_904, _840, _890);
    float _918 = fma(_880, _892, _876);
    float _920 = fma(_882, _840, _912);
    float _922 = fma(_908, _858, _914);
    float _924 = fma(_918, _858, _916);
    float _926 = fma(_896, _858, _920);
    float _928 = _922 * _306;
    float _930 = _922 * _318;
    int _932 = _812 + 8;
    uint _935 = uint(int(uint(_932) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[int(_937)][_939];
    float _943 = _922 * _314;
    float _945 = fma(_926, _282, _928);
    float _947 = fma(_926, _290, _930);
    float _949 = fma(_926, _286, _943);
    float _951 = fma(_924, _322, _945);
    float _953 = fma(_924, _330, _947);
    float _955 = in.m_79.x;
    float _957 = in.m_79.y;
    float _959 = in.m_79.z;
    float _961 = _502 + _951;
    float _963 = _898 + _953;
    float _965 = fma(_924, _326, _949);
    uint _967 = uint(int(uint(_812) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[int(_977)][_979];
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _985 = _961 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _989 = _963 + _987;
    float _991 = _985 * _985;
    float _993 = _989 * _989;
    float _995 = _991 + _993;
    float _997 = sqrt(_995);
    float _999 = _957;
    float _1001 = _955;
    float _1003 = _959;
    float _1005 = _991;
    float _1007 = _993;
    float _1009 = _961;
    float _1011 = _963;
    float _1013 = _965;
    float _1015 = _908;
    if (!_868)
    {
        float _1017 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _957);
        _999 = _1017;
    }
    float _1019 = _999;
    if (!_868)
    {
        float _1021 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _955);
        _1001 = _1021;
    }
    float _1023 = _1001;
    if (!_868)
    {
        float _1025 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _959);
        _1003 = _1025;
    }
    float _1027 = _1003;
    float _1029 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1031 = -_1019;
    float _1033 = _880 * _1031;
    float _1035 = _884 * _1019;
    float _1037 = _886 * _1019;
    float _1039 = _1029 + _965;
    float _1041 = fma(_882, _1023, _1033);
    float _1043 = fma(_900, _1023, _1035);
    bool _1045 = _997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = fma(_904, _1023, _1037);
    float _1049 = fma(_896, _1027, _1041);
    float _1051 = fma(_908, _1027, _1043);
    float _1053 = fma(_918, _1027, _1047);
    if (!_1045)
    {
        _506 = _1039;
    }
    float _1055 = _506;
    bool _1057 = !_1045;
    float _1059 = _1055;
    if (!_1057)
    {
        float _1061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1065 = _997 + _1063;
        float _1067 = rsqrt(_995);
        float _1069 = _1065 * _1061;
        float _1071 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = _1069 * 0.15915493667125701904296875;
        float _1075 = _1073 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1073 * 6.283185482025146484375;
        float _1081 = cos(_1079);
        float _1083 = fma(_1077, _1071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1085 = _1067 * _1083;
        float _1087 = _1081 + (-1.0);
        float _1089 = fma(_985, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1091 = fma(_989, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1093 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1097 = _1089 + _1095;
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1101 = _1091 + _1099;
        float _1103 = fma(_1039, _1081, _1093);
        float _1105 = _1097 * _1097;
        float _1107 = _1101 * _1101;
        _1059 = _1103;
        _1005 = _1105;
        _1007 = _1107;
        _1009 = _1089;
        _1011 = _1091;
    }
    float _1109 = _1059;
    float _1111 = _1005;
    float _1113 = _1007;
    float _1115 = _1009;
    float _1117 = _1011;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1121 = _1109 + _1119;
    float _1123 = _1051 * _314;
    float _1125 = _1051 * _306;
    float _1127 = _1051 * _318;
    float _1129 = fma(_1121, _1121, _1111);
    float _1131 = fma(_1049, _286, _1123);
    float _1133 = fma(_1049, _282, _1125);
    float _1135 = _1129 + _1113;
    float _1137 = fma(_1049, _290, _1127);
    float _1139 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1141 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1143 = _941 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1145 = fma(_1053, _322, _1133);
    float _1147 = sqrt(_1135);
    float _1149 = fma(_1053, _326, _1131);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = fma(_1053, _330, _1137);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1153;
    out.m_83.y = _1155;
    out.m_83.z = _1157;
    out.m_83.w = _1151;
    bool _1161 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1163 = isnan(_1147);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1169 = _1165 || _1167;
    out.m_85.x = _1145;
    out.m_85.y = _1149;
    out.m_85.z = _1159;
    int _1171 = as_type<int>(_1127);
    if (!_1169)
    {
        _1013 = 1.0;
    }
    float _1173 = _1013;
    bool _1175 = !_1169;
    float _1177 = _1173;
    if (!_1175)
    {
        bool _1179 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1181 = isnan(_1147);
        bool _1183 = _1179 || _1181;
        bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1187 = _1183 || _1185;
        if (!_1187)
        {
            float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1191 = _1147 + _1189;
            float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1195 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1193;
            float _1197 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1199 = _1197 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1201 = 1.0 / _1195;
            float _1203 = _1191 * _1201;
            float _1205 = fma(_1203, _1199, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1177 = _1205;
            _1207 = true;
        }
        else
        {
            bool _1209 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1211 = isnan(_1147);
            bool _1213 = _1209 || _1211;
            bool _1215 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1217 = _1213 || _1215;
            if (!_1217)
            {
                float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1221 = _1147 + _1219;
                float _1223 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1225 = _1223 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1227 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1229 = _1227 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1231 = 1.0 / _1225;
                float _1233 = _1221 * _1231;
                float _1235 = fma(_1233, _1229, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1177 = _1235;
                _1207 = true;
            }
            else
            {
                _1177 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1207 = false;
    float _1237 = _1177;
    float _1239 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1241 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1243 = floor(_1239);
    float _1245 = floor(_1241);
    float _1247 = -_1243;
    float _1249 = _1239 + _1247;
    float _1251 = -_1245;
    float _1253 = _1241 + _1251;
    float2 _4507 = float2(_1249, _1253);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4507, float2(0.0), isnan(_4507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4507, float2(0.0), isnan(_4507)), level(0.0)).x;
    float _1257 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1261 = _1115 + _1259;
    float _1263 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1257);
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1267 = _1109 + _1265;
    float _1269 = fma(_1261, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1271 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1263);
    float _1273 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1275 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    float _1285 = fma(_1267, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1287 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1289 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1273);
    float _1291 = 1.0 / _1287;
    float _1293 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1289);
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1297 = _1267;
    int _1299 = 2;
    float _1301 = _1237;
    if (_1283)
    {
        _1297 = _1269;
    }
    float _1303 = _1297;
    float _1305 = _1295 + _1287;
    float _1307 = _1305 * _1291;
    float _1309 = _1307 * 0.5;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1313 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1311);
    float _1315 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1317 = 1.0 / _1313;
    float _1319 = _1029 + _1315;
    float _1321 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1323 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1321);
    float _1325 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1323);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1329 = _1317 * _1327;
    float _1331 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1335 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1337 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1331);
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1341 = trunc(_1333);
    int _1343 = int(_1341);
    bool _1345 = !_1335;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1337);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1353 = _1303;
    if (!_1335)
    {
        _1299 = 1;
    }
    int _1355 = _1299;
    float _1357 = trunc(_1351);
    int _1359 = int(_1357);
    int _1361 = _1355;
    if (!_1339)
    {
        _1361 = _1347;
    }
    int _1363 = _1361;
    int _1365 = _1363 << 6;
    int _1367 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1369 = _1343 + _1367;
    int _1371 = _1369 + 1;
    int _1373 = _1365 + 48;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    bool _1391 = _1371 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1393 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1395 = _1359 + _1393;
    int _1397 = _1395 + 1;
    int _1399 = _1365 + 56;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    int _1417 = _1371 | _1397;
    bool _1419 = _1417 < 0;
    bool _1421 = _1419 || _1391;
    int _1423 = _1365 + 64;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1443 = _1117 + _1441;
    bool _1445 = _1397 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1447 = _1445 || _1421;
    float _1449 = fma(_1443, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1451 = _1443;
    int _1453 = _1371;
    if (_1283)
    {
        _1301 = _1285;
    }
    float _1455 = _1301;
    int _1457 = _1365 + 72;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    float _1475 = _1455;
    if (_1283)
    {
        _1451 = _1449;
    }
    float _1477 = _1451;
    int _1479 = _1365 + 96;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    uint _1483 = uint(int(uint(int(_1481)) >> uint(2)));
    int _1485 = int(_1481) & 3;
    float _1487 = (*spvDescriptorSet0.vp_c15)._m0[int(_1483)][_1485];
    int _1489 = int(_1481) + 1;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    int _1493 = _1489 & 3;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[int(_1491)][_1493];
    int _1497 = _1365 + 104;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    float _1515 = _1477;
    if (!_1283)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1519 = _1029 + _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1523 = _502 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = _1519 * _1519;
        float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1531 = _898 + _1529;
        float _1533 = fma(_1523, _1523, _1527);
        float _1535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1537 = fma(_1531, _1531, _1533);
        float _1539 = sqrt(_1537);
        float _1541 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1543 = -_898;
        float _1545 = _1543 + _1449;
        float _1547 = precise::min(_1539, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1549 = _1547 * _1535;
        float _1551 = -_1029;
        float _1553 = _1551 + _1285;
        float _1555 = _1541 * _1549;
        float _1557 = -_502;
        float _1559 = _1557 + _1269;
        float _1561 = fma(_1553, _1555, _1029);
        float _1563 = fma(_1559, _1555, _502);
        float _1565 = fma(_1545, _1555, _898);
        _1475 = _1561;
        _1353 = _1563;
        _1515 = _1565;
        _1171 = as_type<int>(_1535);
    }
    float _1567 = _1475;
    float _1569 = _1353;
    float _1571 = _1515;
    int _1573 = _1171;
    float _1575 = _1319 * _1495;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1579 = _1573;
    if (!_1447)
    {
        int _1581 = _1397 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1583 = _1581 + _1371;
        _1453 = _1583;
    }
    int _1585 = _1453;
    float _1587 = _1319 * _1439;
    float _1589 = fma(_502, _1487, _1575);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1593 = _1319 * _1389;
    int _1595 = as_type<int>(_1591);
    if (!_1447)
    {
        int _1597 = _1585 << 2;
        _1579 = _1597;
    }
    int _1599 = _1579;
    float _1601 = fma(_898, _1505, _1589);
    float _1603 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1591);
    float _1605 = fma(_502, _1381, _1593);
    float _1607 = fma(_502, _1431, _1587);
    int _1609 = _1599;
    if (!_1447)
    {
        uint _1611 = uint(int(uint(_1585) >> uint(2)));
        _1595 = int(_1611);
    }
    int _1613 = _1595;
    float _1615 = _1601 + _1513;
    if (!_1447)
    {
        int _1617 = 12 & _1599;
        _1609 = _1617;
    }
    int _1619 = _1609;
    int _1621 = _1365 + 80;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    uint _1625 = uint(int(uint(int(_1623)) >> uint(2)));
    int _1627 = int(_1623) & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    int _1631 = int(_1623) + 1;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    int _1635 = _1631 & 3;
    float _1637 = (*spvDescriptorSet0.vp_c15)._m0[int(_1633)][_1635];
    float _1639 = fma(_898, _1407, _1605);
    float _1641 = 1.0 / _1615;
    float _1643 = as_type<float>(_1619);
    if (!_1447)
    {
        int _1645 = _1613 << 4;
        int _1647 = _1645 + _1619;
        _1643 = as_type<float>(_1647);
    }
    float _1649 = _1643;
    float _1651 = fma(_898, _1465, _1607);
    float _1653 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1655 = _1639 + _1415;
    float _1657 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1659 = _1365 + 88;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    uint _1663 = uint(int(uint(int(_1661)) >> uint(2)));
    int _1665 = int(_1661) & 3;
    float _1667 = (*spvDescriptorSet0.vp_c15)._m0[int(_1663)][_1665];
    int _1669 = int(_1661) + 1;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    int _1673 = _1669 & 3;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
    float _1677 = _1651 + _1473;
    float _1679 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1681 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1653);
    float _1683 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1685 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1687 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1679);
    float _1689 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1681);
    float _1691 = _1649;
    if (!_1447)
    {
        int _1693 = as_type<int>(_1649) + 400;
        uint _1695 = uint(int(uint(_1693) >> uint(2)));
        uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
        int _1699 = int(_1695) & 3;
        float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
        _1691 = _1701;
    }
    float _1703 = _1691;
    float _1705 = -_1685;
    float _1707 = fma(_1705, _1683, 1.0);
    float _1709 = _1655 * _1641;
    float _1711 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1713 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1687);
    float _1715 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1717 = _1677 * _1641;
    bool _1719 = _1709 >= 0.0;
    float _1721 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1711);
    float _1723 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1725 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1727 = _1709 <= 1.0;
    bool _1729 = _1727 && _1719;
    float _1731 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1721);
    float _1733 = _989;
    float _1735 = _1641;
    if (!_1447)
    {
        float _1737 = floor(_1351);
        _1733 = _1737;
    }
    float _1739 = _1733;
    float _1741 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1725);
    bool _1743 = _1717 >= 0.0;
    bool _1745 = _1743 && _1729;
    float _1747 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1749 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1751 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1741);
    bool _1753 = _1717 <= 1.0;
    bool _1755 = _1753 && _1745;
    float _1757 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1759 = log2(_1707);
    float _1761 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1751);
    float _1763 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1749);
    float _1765 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1757);
    float _1767 = 1.0 / _1761;
    float _1769 = _1739;
    if (!_1447)
    {
        float _1771 = -_1739;
        float _1773 = _1351 + _1771;
        _1769 = _1773;
    }
    float _1775 = _1769;
    float _1777 = _1319 * _1637;
    float _1779 = _1637;
    if (_1755)
    {
        float _1781 = float(_1363);
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1765);
    float _1787 = fma(_502, _1629, _1777);
    float _1789 = _924;
    if (!_1447)
    {
        float _1791 = floor(_1333);
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1763);
    float _1797 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1785);
    float _1799 = fma(_898, _1667, _1787);
    float _1801 = _1759 * 0.693147182464599609375;
    float _1803 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1795);
    float _1805 = _1799 + _1675;
    float _1807 = _1777;
    float _1809 = _1801;
    if (_1755)
    {
        float _1811 = rint(_1783);
        float _1813 = precise::max(_1811, 0.0);
        uint _1815 = uint(_1813);
        uint _1817 = clamp(_1815, 0u, 65535u);
        _1807 = as_type<float>(_1817);
    }
    float _1819 = _1807;
    float _1821 = _1797 * _1767;
    float _1823 = _1803 * _1767;
    float _1825 = _1805 * _1641;
    float _1827 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1829 = fma(_1821, 0.5, 0.5);
    float _1831 = fma(_1823, -0.5, 0.5);
    float _1833 = _1703;
    float _1835 = _1829;
    float _1837 = _1825;
    if (!_1447)
    {
        float _1839 = rint(_1703);
        float _1841 = precise::max(_1839, 0.0);
        uint _1843 = uint(_1841);
        uint _1845 = clamp(_1843, 0u, 65535u);
        _1833 = as_type<float>(_1845);
    }
    float _1847 = _1833;
    if (!_1447)
    {
        float _1849 = -_1793;
        float _1851 = _1333 + _1849;
        _1809 = _1851;
    }
    float _1853 = _1809;
    float _1855 = _1819;
    if (_1755)
    {
        float3 _5535 = float3(_1709, _1717, float(as_type<int>(_1819)));
        float3 _5539 = select(_5535, float3(0.0), isnan(_5535));
        float _1857 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5539.xy, uint(rint(_5539.z)), _1825, level(0.0));
        _1855 = _1857;
    }
    float _1859 = _1855;
    float3 _5549 = float3(_1829, _1831, _1827);
    float _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5549, float3(0.0), isnan(_5549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5549, float3(0.0), isnan(_5549)), level(0.0)).x;
    float3 _5558 = float3(_1829, _1831, _1827);
    float4 _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5558, float3(0.0), isnan(_5558)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5558, float3(0.0), isnan(_5558)), level(0.0)).xyzw;
    float _1866 = _1864.x;
    float _1868 = _1864.y;
    float _1870 = _1864.z;
    float _1872 = _1864.w;
    float _1874 = _1853;
    if (!_1447)
    {
        float3 _5581 = float3(_1853, _1775, float(as_type<int>(_1847)));
        float3 _5583 = select(_5581, float3(0.0), isnan(_5581));
        float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5583.xy, uint(rint(_5583.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5583.xy, uint(rint(_5583.z)), level(0.0)).x;
        _1874 = _1876;
    }
    float _1878 = _1874;
    if (_1447)
    {
        _1735 = 1.0;
    }
    float _1880 = _1735;
    float _1882 = _1880;
    if (!_1447)
    {
        int _1884 = _1585 << 4;
        int _1886 = _1884 + 2048;
        uint _1888 = uint(int(uint(_1886) >> uint(2)));
        uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
        int _1892 = int(_1888) & 3;
        float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
        int _1896 = int(_1888) + 1;
        uint _1898 = uint(int(uint(_1896) >> uint(2)));
        int _1900 = _1896 & 3;
        float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
        int _1904 = _1886 + 8;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        uint _1908 = uint(int(uint(int(_1906)) >> uint(2)));
        int _1910 = int(_1906) & 3;
        float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
        int _1914 = int(_1906) + 1;
        uint _1916 = uint(int(uint(_1914) >> uint(2)));
        int _1918 = _1914 & 3;
        float _1920 = (*spvDescriptorSet0.vp_c15)._m0[int(_1916)][_1918];
        float _1922 = _1319 * _1902;
        float _1924 = fma(_502, _1894, _1922);
        float _1926 = fma(_898, _1912, _1924);
        float _1928 = _1926 + _1920;
        float _1930 = precise::clamp(_1928, 0.0, 1.0);
        float _1932 = -_1930;
        float _1934 = _1932 + _1878;
        float _1936 = fma(_1934, 500.0, 1.5);
        float _1938 = exp2(_1936);
        float _1940 = 0.0 + _1938;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1835 = _1894;
        _1882 = _1942;
    }
    float _1944 = _1835;
    float _1946 = _1882;
    float _1948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1950 = _1567 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1954 = _1569 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1958 = _1571 + _1956;
    float _1960 = _1950 * _1950;
    float _1962 = fma(_1954, _1954, _1960);
    float _1964 = fma(_1958, _1958, _1962);
    float _1966 = rsqrt(_1964);
    float _1968 = sqrt(_1964);
    float _1970 = _1954 * _1966;
    float _1972 = _1958 * _1966;
    float _1974 = _1950 * _1966;
    float _1976 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1978 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1980 = _1976 * _1976;
    float _1982 = _1978 * _1978;
    float _1984 = _1980 + _1982;
    float _1986 = sqrt(_1984);
    bool _1988 = _1986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1992 = _1986 + _1990;
    float _1994 = _1847;
    float _1996 = _1992;
    float _1998 = _1944;
    if (_1988)
    {
        float _2000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = _2002;
    if (_1988)
    {
        float _2006 = _1992 * _2002;
        _1996 = _2006;
    }
    float _2008 = _1996;
    if (_1988)
    {
        float _2010 = _2008 * 0.15915493667125701904296875;
        _1998 = _2010;
    }
    float _2012 = _1998;
    float _2014 = _502;
    float _2016 = _2012;
    if (_1988)
    {
        float _2018 = _2012 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2026 = precise::max(0.0, _2024);
    float _2028 = _1878;
    float _2030 = _2026;
    if (_1988)
    {
        float _2032 = _2012 * 6.283185482025146484375;
        float _2034 = cos(_2032);
        _2028 = _2034;
    }
    float _2036 = _2028;
    float _2038 = -_1974;
    float _2040 = -_2026;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2040);
    float _2044 = _2024;
    if (_1988)
    {
        float _2046 = rsqrt(_1984);
        _2044 = _2046;
    }
    float _2048 = _2044;
    if (_1988)
    {
        float _2050 = _2042 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2050;
    }
    float _2052 = _2030;
    float _2054 = _2022;
    float _2056 = _2052;
    if (_1988)
    {
        float _2058 = fma(_2022, _2052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2004 = _2058;
    }
    float _2060 = _2004;
    float _2062 = _2060;
    if (!_1988)
    {
        _2054 = _1976;
    }
    float _2064 = _2054;
    float _2066 = _2064;
    float _2068 = _2036;
    if (_1988)
    {
        float _2070 = _2036 + (-1.0);
        _2056 = _2070;
    }
    float _2072 = _2056;
    float _2074 = _2072;
    if (_1988)
    {
        float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2016 = _2076;
    }
    float _2078 = _2016;
    if (!_1988)
    {
        _2074 = _1978;
    }
    float _2080 = _2074;
    float _2082 = _2048;
    float _2084 = _2080;
    if (_1988)
    {
        float _2086 = _2048 * _2060;
        _1015 = _2086;
    }
    float _2088 = _1015;
    if (!_1988)
    {
        _2082 = _2042;
    }
    float _2090 = _2082;
    float _2092 = _2090;
    if (_1988)
    {
        float _2094 = fma(_2042, _2036, _2078);
        _2092 = _2094;
    }
    float _2096 = _2092;
    if (!_1988)
    {
        _2062 = _1980;
    }
    float _2098 = _2062;
    float _2100 = _2098;
    if (_1988)
    {
        float _2102 = _1976 * _2088;
        _2066 = _2102;
    }
    float _2104 = _2066;
    if (_1988)
    {
        float _2106 = _1978 * _2088;
        _2084 = _2106;
    }
    float _2108 = _2084;
    if (!_1988)
    {
        _2068 = _1982;
    }
    float _2110 = _2068;
    float _2112 = _2110;
    if (_1988)
    {
        float _2114 = _2104 * _2104;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_1988)
    {
        float _2118 = _2108 * _2108;
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = fma(_2096, _2096, _2116);
    float _2124 = _2122 + _2120;
    float _2126 = rsqrt(_2124);
    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2130 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2128);
    float _2132 = precise::clamp(_2130, 0.0, 1.0);
    float _2134 = -_2132;
    float _2136 = _2134 + 1.0;
    float _2138 = _2126 * _2104;
    float _2140 = _2126 * _2096;
    float _2142 = _2126 * _2108;
    float _2144 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2146 = abs(_2136);
    float _2148 = log2(_2146);
    float _2150 = -_2144;
    float _2152 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = -_2142;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2158 = fma(_2156, -0.5, 0.5);
    float _2160 = fma(_2156, 0.5, 0.5);
    float _2162 = fma(_2160, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2164 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = sqrt(_2158);
    float _2168 = fma(_2160, _2162, -0.212114393711090087890625);
    float _2170 = _2140 + 1.0;
    float _2172 = fma(_2160, _2168, 1.570728778839111328125);
    float _2174 = exp2(_2164);
    float _2176 = _2166 * 0.636619746685028076171875;
    float _2178 = -_2140;
    float _2180 = fma(_2174, _2170, _2178);
    float _2182 = -_2172;
    float _2184 = fma(_2176, _2182, 1.0);
    float _2186 = fma(_2180, 0.5, 0.5);
    float2 _6066 = float2(_2184, _2186);
    float3 _2190 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6066, float2(0.0), isnan(_6066)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6066, float2(0.0), isnan(_6066)), level(0.0)).xyz;
    float _2192 = _2190.x;
    float _2194 = _2190.y;
    float _2196 = _2190.z;
    float _2198 = abs(_1329);
    float _2200 = log2(_2198);
    float _2202 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2204 = -_1255;
    float _2206 = _2204 + 1.0;
    out.m_87.x = _1569;
    out.m_87.y = _1567;
    out.m_87.z = _1571;
    float _2208 = exp2(_2202);
    bool _2210 = _1329 <= 8000.0;
    bool _2212 = isnan(_1329);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan(8000.0);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2224 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2226 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2224);
    float _2228 = exp2(_2222);
    float _2230 = -_2208;
    float _2232 = _2230 + 1.0;
    float _2234 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2236 = precise::clamp(_2234, 0.0, 1.0);
    float _2238 = fma(_2236, -2.0, 3.0);
    float _2240 = _2236 * _2236;
    float _2242 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2226);
    float _2244 = _2240 * _2238;
    float _2246 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _2248 = -_2244;
    float _2250 = _2248 + 1.0;
    out.gl_Position.x = _1797;
    out.gl_Position.y = _1803;
    out.gl_Position.z = _2246;
    out.gl_Position.w = _1761;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2244);
    float _2254 = _2246 + _1761;
    float _2256 = _2220 * _2252;
    float _2258 = _2220;
    float _2260 = _2246;
    float _2262 = _1797;
    if (!_1755)
    {
        _2258 = 1.0;
    }
    float _2264 = _2258;
    float _2266 = _2254 * 0.5;
    float _2268 = _2264;
    if (_1755)
    {
        bool _2270 = _1859 >= _1825;
        bool _2272 = isnan(_1859);
        bool _2274 = _2270 || _2272;
        bool _2276 = isnan(_1825);
        bool _2278 = _2274 || _2276;
        float _2280 = float(_2278);
        _2268 = _2280;
    }
    float _2282 = _2268;
    float _2284 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2286 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2288 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2290 = isnan(_1968);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2296 = _2292 || _2294;
    out.m_89.z = _2266;
    out.m_89.w = _1761;
    float _2298 = _2206 * _2284;
    float _2300 = precise::clamp(_2298, 0.0, 1.0);
    float _2302 = _2286 * _1861;
    float _2304 = _2282 * _1946;
    float _2306 = -_2286;
    float _2308 = _2306 + 1.0;
    float _2310 = -_2300;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2314 = _1872 * _2302;
    float _2316 = _1872 * _2308;
    float _2318 = -_2304;
    float _2320 = fma(_2318, _2312, 1.0);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = _2304;
    float _2326 = _2300;
    float _2328 = _2322;
    if (!_2296)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2330 = _2260;
    float _2332 = _2322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2334 = _2330;
    float _2336 = _2330;
    if (!_2296)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2338 = _2262;
    float _2340 = _2338;
    float _2342 = _2338;
    if (!_2296)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2344 = _2324;
    out.m_91.x = _2332;
    float _2346 = _2344;
    float _2348 = _2344;
    if (!_2296)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2350 = _1837;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2296)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2356 = _2326;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2296)
    {
        _2328 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2362 = _2328;
    float _2364 = _2196 * _2302;
    float _2366 = fma(_2192, _2314, _1866);
    float _2368 = fma(_2194, _2314, _1868);
    float _2370 = fma(_1872, _2364, _1870);
    out.m_93.x = _2366;
    out.m_93.y = _2368;
    out.m_93.z = _2370;
    out.m_93.w = _2316;
    bool _2372 = !_2296;
    float _2374 = _2362;
    float _2376 = _2362;
    if (!_2372)
    {
        bool _2378 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2380 = isnan(_1968);
        bool _2382 = _2378 || _2380;
        bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2386 = _2382 || _2384;
        if (!_2386)
        {
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2390 = _1968 + _2388;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2394 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2392;
            float _2396 = 1.0 / _2394;
            float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2400 = _2398 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2410 = _2390 * _2396;
            float _2412 = precise::clamp(_2410, 0.0, 1.0);
            float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2426 = fma(_2412, _2408, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2428 = fma(_2412, _2416, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2430 = fma(_2412, _2420, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2432 = fma(_2412, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2434 = fma(_2412, _2400, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2436 = fma(_2412, _2404, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _2342 = _2430;
            _2360 = _2436;
            _2336 = _2428;
            _2354 = _2434;
            _2348 = _2432;
            _2376 = _2426;
            _2438 = true;
        }
        else
        {
            bool _2440 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2442 = isnan(_1968);
            bool _2444 = _2440 || _2442;
            bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2448 = _2444 || _2446;
            if (!_2448)
            {
                _2334 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2450 = _2334;
            _2336 = _2450;
            if (!_2448)
            {
                _2340 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2452 = _2340;
            _2342 = _2452;
            if (!_2448)
            {
                _2346 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2454 = _2346;
            _2348 = _2454;
            if (!_2448)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2456 = _2352;
            _2354 = _2456;
            if (!_2448)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2458 = _2358;
            _2360 = _2458;
            if (!_2448)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2460 = _2374;
            bool _2462 = !_2448;
            _2376 = _2460;
            if (!_2462)
            {
                bool _2464 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2466 = isnan(_1968);
                bool _2468 = _2464 || _2466;
                bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2472 = _2468 || _2470;
                if (!_2472)
                {
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2476 = _1968 + _2474;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2478;
                    float _2482 = 1.0 / _2480;
                    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2496 = _2476 * _2482;
                    float _2498 = precise::clamp(_2496, 0.0, 1.0);
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2512 = fma(_2498, _2494, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2514 = fma(_2498, _2502, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2516 = fma(_2498, _2506, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2518 = fma(_2498, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2520 = fma(_2498, _2486, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2522 = fma(_2498, _2490, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _2342 = _2516;
                    _2360 = _2522;
                    _2336 = _2514;
                    _2354 = _2520;
                    _2348 = _2518;
                    _2376 = _2512;
                    _2438 = true;
                }
                else
                {
                    _2342 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2336 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2348 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2438 = false;
    float _2524 = _2342;
    float _2526 = _2360;
    float _2528 = _2336;
    float _2530 = _2354;
    float _2532 = _2348;
    float _2534 = _2376;
    float _2536 = fma(_1149, -0.5, 0.5);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -_2524;
    float _2542 = _2540 + _2526;
    float _2544 = -_2528;
    float _2546 = _2544 + _2530;
    float _2548 = -_2532;
    float _2550 = _2548 + _2534;
    bool _2552 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = fma(_2538, _2542, _2524);
    float _2556 = fma(_2538, _2546, _2528);
    float _2558 = fma(_2538, _2550, _2532);
    float _2560 = _2554 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2562 = fma(_2556, 0.298911988735198974609375, _2560);
    float _2564 = fma(_2558, 0.114477999508380889892578125, _2562);
    out.m_97.x = 0.0;
    float _2566 = -_2564;
    float _2568 = _2556 + _2566;
    float _2570 = -_2564;
    float _2572 = _2554 + _2570;
    float _2574 = -_2564;
    float _2576 = _2558 + _2574;
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2584 = fma(_2576, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    out.m_61.x = _2578;
    out.m_99.x = _2580;
    out.m_99.y = _2582;
    out.m_99.z = _2584;
    if (!_2552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2586 = -_1567;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2590 = -_1569;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2594 = -_1571;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2598 = _2588 * _2588;
    float _2600 = fma(_2592, _2592, _2598);
    float _2602 = fma(_2596, _2596, _2600);
    float _2604 = rsqrt(_2602);
    float _2606 = sqrt(_2602);
    float _2608 = _2588 * _2604;
    float _2610 = _2592 * _2604;
    float _2612 = _2596 * _2604;
    float _2614 = -_1974;
    float _2616 = _2614 + _2608;
    float _2618 = -_1970;
    float _2620 = _2618 + _2610;
    float _2622 = -_1972;
    float _2624 = _2622 + _2612;
    float _2626 = _2616 * _2616;
    float _2628 = -_2606;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2632 = fma(_2620, _2620, _2626);
    float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = fma(_2624, _2624, _2632);
    float _2640 = abs(_2636);
    float _2642 = log2(_2640);
    float _2644 = rsqrt(_2638);
    float _2646 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2648 = exp2(_2646);
    float _2650 = _2616 * _2644;
    float _2652 = _2620 * _2644;
    float _2654 = _2624 * _2644;
    float _2656 = _1149 * _2650;
    float _2658 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = _1149 * _2608;
    float _2664 = fma(_1145, _2652, _2656);
    float _2666 = _2660 * _2660;
    float _2668 = fma(_1145, _2610, _2662);
    float _2670 = fma(_1159, _2654, _2664);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = _2666 + (-1.0);
    float _2676 = fma(_1159, _2612, _2668);
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = _2672 * _2672;
    float _2682 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2684 = fma(_2680, _2674, 1.0);
    float _2686 = -_2608;
    float _2688 = -_2682;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2688);
    float _2692 = _2684 * _2684;
    float _2694 = -_2612;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2690);
    float _2698 = 1.0 / _2692;
    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2702 = _2696 + _2700;
    float _2704 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2706 = precise::clamp(_2704, 0.0, 1.0);
    float _2708 = _2648 * _2706;
    float _2710 = _2678 * _2708;
    float _2712 = _2666 * _2698;
    float _2714 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2716 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2720 = _2710 * _2712;
    float _2722 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2724 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2726 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2714;
    out.m_95.y = _2716;
    out.m_95.z = _2718;
    out.m_97.x = _2722;
    out.m_97.y = _2724;
    out.m_97.z = _2726;
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
    bool _2438 = false;
    bool _1207 = false;
    bool _352 = false;
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
        float _2783 = as_type<float>(_134);
        out.gl_Position.z = _2783;
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
        float _2853 = as_type<float>(_172);
        out.gl_Position.z = _2853;
    }
    if (_164)
    {
        return out;
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = in.m_67.x;
    float _182 = in.m_67.y;
    float _184 = in.m_67.z;
    float _186 = in.m_69.x;
    float _188 = in.m_69.y;
    float _190 = in.m_69.z;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    bool _216 = _210 > 0.0;
    bool _218 = _212 > 0.0;
    float _220 = _212;
    float _222 = _204;
    float _224 = _208;
    if (_216)
    {
        float _226 = rsqrt(_204);
        _220 = _226;
    }
    float _228 = _220;
    float _230 = 0.0;
    if (!_216)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _214 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    if (!_216)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = 0.0;
    float _244 = _240;
    if (!_216)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = _214;
    float _250 = _246;
    if (_218)
    {
        float _252 = rsqrt(_206);
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = 0.0;
    if (!_218)
    {
        _256 = 0.0;
        _258 = 0.0;
    }
    float _260 = _256;
    float _262 = _258;
    float _264 = 0.0;
    float _266 = _262;
    float _268 = _260;
    if (!_218)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = _210;
    float _274 = _270;
    if (_234)
    {
        float _276 = rsqrt(_208);
        _272 = _276;
    }
    float _278 = _272;
    if (_216)
    {
        float _280 = _228 * _180;
        _238 = _280;
    }
    float _282 = _238;
    if (_216)
    {
        float _284 = _228 * _174;
        _244 = _284;
    }
    float _286 = _244;
    if (_216)
    {
        float _288 = _228 * _186;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _294 = 0.0;
    if (!_234)
    {
        _294 = 0.0;
    }
    float _296 = _294;
    float _298 = _296;
    if (!_234)
    {
        _222 = 0.0;
    }
    float _300 = _222;
    float _302 = _300;
    if (_218)
    {
        float _304 = _254 * _182;
        _274 = _304;
    }
    float _306 = _274;
    if (!_234)
    {
        _224 = 0.0;
    }
    float _308 = _224;
    float _310 = _308;
    if (_218)
    {
        float _312 = _254 * _176;
        _266 = _312;
    }
    float _314 = _266;
    if (_218)
    {
        float _316 = _254 * _188;
        _268 = _316;
    }
    float _318 = _268;
    if (_234)
    {
        float _320 = _278 * _184;
        _298 = _320;
    }
    float _322 = _298;
    if (_234)
    {
        float _324 = _278 * _178;
        _310 = _324;
    }
    float _326 = _310;
    if (_234)
    {
        float _328 = _278 * _190;
        _302 = _328;
    }
    float _330 = _302;
    bool _332 = !_292;
    float _350;
    if (!_332)
    {
        float _334 = in.m_71.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_118);
        float _356 = 1.0 / _354;
        float _358 = _152 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_71.z;
    float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _366 = log2(_364);
    float _368 = in.m_71.x;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _372 = _360 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = in.m_71.y;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _394 = _392 != 0;
    float _396 = 1.0 / _376;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _360 + _398;
    float _402 = in.m_58.x;
    float _404 = in.m_58.y;
    float _406 = in.m_58.z;
    float _408 = 1.0 / _380;
    float _410 = _366 * _152;
    float _412 = _362 * 2.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _400 * _396;
    float _420 = _368 * 2.0;
    float _422 = _368 + _362;
    float _424 = floor(_412);
    float _426 = _382 * 2.0;
    float _428 = _422 + (-1.0);
    float _430 = _372 * _408;
    float _432 = _182 * _404;
    float _434 = _382 + _362;
    float _436 = floor(_420);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _440 = fma(_180, _402, _432);
    float _442 = _368 + _382;
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _434 + (-1.0);
    float _450 = _188 * _404;
    float _452 = _442 + (-1.0);
    float _454 = floor(_426);
    bool _456 = _424 > 0.0;
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _460 = _424 >= 0.0;
    bool _462 = isnan(_424);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_186, _402, _450);
    float _472 = fma(_184, _406, _440);
    int _474 = _468 ? 0 : 1;
    float _476 = fma(_190, _406, _470);
    bool _478 = _436 > 0.0;
    float _480 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _482 = ~_474;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _488;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _504 = _486;
    float _506 = _402;
    if (!_456)
    {
        int _508 = ~_474;
        int _510 = _508 + 1;
        _504 = _510;
    }
    int _512 = _504;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _514;
    int _518 = abs(_446);
    float _520 = _176 * _404;
    bool _522 = _454 > 0.0;
    float _524 = fma(_516, _418, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _526 = _454 >= 0.0;
    bool _528 = isnan(_454);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = fma(_490, _418, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = exp2(_410);
    float _540 = float(_518);
    float _542 = fma(_416, _418, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _544 = float(_512);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _554 = _500 ? 0 : 1;
    float _556 = _540 * _544;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _562 = in.m_73.x;
    float _564 = in.m_73.y;
    float _566 = in.m_73.z;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    int _572 = ~_554;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = _556 * (-2.0);
    int _580 = _576;
    if (!_478)
    {
        int _582 = ~_554;
        int _584 = _582 + 1;
        _580 = _584;
    }
    int _586 = _580;
    float _588 = 1.0 / _570;
    bool _590 = !_390;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_174, _402, _520);
    bool _596 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    int _606 = abs(_592);
    float _608 = -_538;
    float _610 = _608 + 1.0;
    float _612 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _614 = fma(_560, _430, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _624 = _620 || _622;
    float _626 = fma(_552, _430, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _628 = float(_606);
    float _630 = fma(_178, _406, _594);
    float _632 = float(_586);
    float _634 = _624 ? _610 : 0.0;
    int _636 = _534 ? 0 : 1;
    float _638 = _628 * _632;
    float _640 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_604)
    {
        float _642 = _634 * _588;
        _154 = _642;
    }
    float _644 = _154;
    float _646 = fma(_480, _578, _480);
    float _648 = _638 * (-2.0);
    float _650 = fma(_578, _562, _562);
    float _652 = _640 * _368;
    float _654 = _368 + (-0.5);
    bool _656 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _658 = isnan(_360);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = fma(_458, _648, _458);
    bool _670 = !_394;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_648, _564, _564);
    float _676 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _650);
    int _678 = ~_636;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = -_666;
    float _686 = _684 + 1.0;
    bool _688 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _690 = isnan(_360);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = fma(_646, _644, _676);
    int _702 = _682;
    if (!_522)
    {
        int _704 = ~_636;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    float _710 = trunc(_652);
    int _712 = int(_710);
    int _714 = abs(_672);
    float _716 = _698 * _686;
    bool _718 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _720 = isnan(_360);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _382 + (-0.5);
    float _732 = float(_714);
    float _734 = -_698;
    float _736 = _734 + 1.0;
    float _738 = float(_708);
    float _740 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _742 = _700 * 0.15915493667125701904296875;
    float _744 = _728 * _736;
    float _746 = -_728;
    float _748 = _746 + 1.0;
    float _750 = _732 * _738;
    float _752 = fma(_668, _644, _740);
    float _754 = _524 * _744;
    float _756 = _536 * _744;
    float _758 = _542 * _744;
    float _760 = _750 * (-2.0);
    float _762 = in.m_75.x;
    float _764 = in.m_75.y;
    float _766 = in.m_75.z;
    float _768 = _752 * 0.15915493667125701904296875;
    float _770 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].z, _758);
    float _772 = fma(_438, _760, _438);
    float _774 = fma(_760, _566, _566);
    float _776 = _362 + (-0.5);
    float _778 = in.m_77.x;
    float _780 = in.m_77.y;
    float _782 = in.m_77.z;
    float _784 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].y, _756);
    float _786 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].x, _754);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _790 = fma(_626, _716, _770);
    float _792 = fma(_614, _716, _784);
    float _794 = fma(_612, _716, _786);
    float _796 = fma(_772, _644, _788);
    float _798 = _742 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].y, _792);
    float _804 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].z, _790);
    float _806 = _796 * 0.15915493667125701904296875;
    float _808 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].x, _794);
    int _810 = _712 << 4;
    int _812 = _810 + 1712;
    float _814 = _742 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _804 * _766;
    float _820 = _808 * _762;
    float _822 = _802 * _764;
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _828 = _768 * 6.283185482025146484375;
    float _830 = cos(_828);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _778);
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _780);
    float _836 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _840 = _826 * _832;
    bool _842 = _780 != 0.0;
    bool _844 = isnan(_780);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = _836 * _834;
    float _854 = _806 * 6.283185482025146484375;
    float _856 = cos(_854);
    float _858 = _824 * _838;
    bool _860 = _778 == 0.0;
    bool _862 = !_850;
    bool _864 = _860 && _862;
    bool _866 = _782 == 0.0;
    bool _868 = _866 && _864;
    float _870 = _768 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _800 * _830;
    float _876 = _816 * _830;
    float _878 = _806 * 6.283185482025146484375;
    float _880 = sin(_878);
    float _882 = _830 * _856;
    float _884 = _816 * _856;
    float _886 = _800 * _856;
    float _888 = _884 * _852;
    float _890 = _886 * _852;
    float _892 = _800 * _872;
    float _894 = _816 * _872;
    float _896 = _872 * _856;
    float _898 = _476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = fma(_880, _876, _892);
    float _902 = -_894;
    float _904 = fma(_880, _874, _902);
    float _906 = -_874;
    float _908 = fma(_880, _894, _906);
    float _910 = -_852;
    float _912 = _880 * _910;
    float _914 = fma(_900, _840, _888);
    float _916 = fma(_904, _840, _890);
    float _918 = fma(_880, _892, _876);
    float _920 = fma(_882, _840, _912);
    float _922 = fma(_908, _858, _914);
    float _924 = fma(_918, _858, _916);
    float _926 = fma(_896, _858, _920);
    float _928 = _922 * _306;
    float _930 = _922 * _318;
    int _932 = _812 + 8;
    uint _935 = uint(int(uint(_932) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[int(_937)][_939];
    float _943 = _922 * _314;
    float _945 = fma(_926, _282, _928);
    float _947 = fma(_926, _290, _930);
    float _949 = fma(_926, _286, _943);
    float _951 = fma(_924, _322, _945);
    float _953 = fma(_924, _330, _947);
    float _955 = in.m_79.x;
    float _957 = in.m_79.y;
    float _959 = in.m_79.z;
    float _961 = _502 + _951;
    float _963 = _898 + _953;
    float _965 = fma(_924, _326, _949);
    uint _967 = uint(int(uint(_812) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[int(_977)][_979];
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _985 = _961 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _989 = _963 + _987;
    float _991 = _985 * _985;
    float _993 = _989 * _989;
    float _995 = _991 + _993;
    float _997 = sqrt(_995);
    float _999 = _957;
    float _1001 = _955;
    float _1003 = _959;
    float _1005 = _991;
    float _1007 = _993;
    float _1009 = _961;
    float _1011 = _963;
    float _1013 = _965;
    float _1015 = _908;
    if (!_868)
    {
        float _1017 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _957);
        _999 = _1017;
    }
    float _1019 = _999;
    if (!_868)
    {
        float _1021 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _955);
        _1001 = _1021;
    }
    float _1023 = _1001;
    if (!_868)
    {
        float _1025 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _959);
        _1003 = _1025;
    }
    float _1027 = _1003;
    float _1029 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1031 = -_1019;
    float _1033 = _880 * _1031;
    float _1035 = _884 * _1019;
    float _1037 = _886 * _1019;
    float _1039 = _1029 + _965;
    float _1041 = fma(_882, _1023, _1033);
    float _1043 = fma(_900, _1023, _1035);
    bool _1045 = _997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = fma(_904, _1023, _1037);
    float _1049 = fma(_896, _1027, _1041);
    float _1051 = fma(_908, _1027, _1043);
    float _1053 = fma(_918, _1027, _1047);
    if (!_1045)
    {
        _506 = _1039;
    }
    float _1055 = _506;
    bool _1057 = !_1045;
    float _1059 = _1055;
    if (!_1057)
    {
        float _1061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1065 = _997 + _1063;
        float _1067 = rsqrt(_995);
        float _1069 = _1065 * _1061;
        float _1071 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = _1069 * 0.15915493667125701904296875;
        float _1075 = _1073 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1073 * 6.283185482025146484375;
        float _1081 = cos(_1079);
        float _1083 = fma(_1077, _1071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1085 = _1067 * _1083;
        float _1087 = _1081 + (-1.0);
        float _1089 = fma(_985, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1091 = fma(_989, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1093 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1097 = _1089 + _1095;
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1101 = _1091 + _1099;
        float _1103 = fma(_1039, _1081, _1093);
        float _1105 = _1097 * _1097;
        float _1107 = _1101 * _1101;
        _1059 = _1103;
        _1005 = _1105;
        _1007 = _1107;
        _1009 = _1089;
        _1011 = _1091;
    }
    float _1109 = _1059;
    float _1111 = _1005;
    float _1113 = _1007;
    float _1115 = _1009;
    float _1117 = _1011;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1121 = _1109 + _1119;
    float _1123 = _1051 * _314;
    float _1125 = _1051 * _306;
    float _1127 = _1051 * _318;
    float _1129 = fma(_1121, _1121, _1111);
    float _1131 = fma(_1049, _286, _1123);
    float _1133 = fma(_1049, _282, _1125);
    float _1135 = _1129 + _1113;
    float _1137 = fma(_1049, _290, _1127);
    float _1139 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1141 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1143 = _941 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1145 = fma(_1053, _322, _1133);
    float _1147 = sqrt(_1135);
    float _1149 = fma(_1053, _326, _1131);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = fma(_1053, _330, _1137);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1153;
    out.m_83.y = _1155;
    out.m_83.z = _1157;
    out.m_83.w = _1151;
    bool _1161 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1163 = isnan(_1147);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1169 = _1165 || _1167;
    out.m_85.x = _1145;
    out.m_85.y = _1149;
    out.m_85.z = _1159;
    int _1171 = as_type<int>(_1127);
    if (!_1169)
    {
        _1013 = 1.0;
    }
    float _1173 = _1013;
    bool _1175 = !_1169;
    float _1177 = _1173;
    if (!_1175)
    {
        bool _1179 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1181 = isnan(_1147);
        bool _1183 = _1179 || _1181;
        bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1187 = _1183 || _1185;
        if (!_1187)
        {
            float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1191 = _1147 + _1189;
            float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1195 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1193;
            float _1197 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1199 = _1197 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1201 = 1.0 / _1195;
            float _1203 = _1191 * _1201;
            float _1205 = fma(_1203, _1199, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1177 = _1205;
            _1207 = true;
        }
        else
        {
            bool _1209 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1211 = isnan(_1147);
            bool _1213 = _1209 || _1211;
            bool _1215 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1217 = _1213 || _1215;
            if (!_1217)
            {
                float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1221 = _1147 + _1219;
                float _1223 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1225 = _1223 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1227 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1229 = _1227 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1231 = 1.0 / _1225;
                float _1233 = _1221 * _1231;
                float _1235 = fma(_1233, _1229, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1177 = _1235;
                _1207 = true;
            }
            else
            {
                _1177 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1207 = false;
    float _1237 = _1177;
    float _1239 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1241 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1243 = floor(_1239);
    float _1245 = floor(_1241);
    float _1247 = -_1243;
    float _1249 = _1239 + _1247;
    float _1251 = -_1245;
    float _1253 = _1241 + _1251;
    float2 _4507 = float2(_1249, _1253);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4507, float2(0.0), isnan(_4507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4507, float2(0.0), isnan(_4507)), level(0.0)).x;
    float _1257 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1261 = _1115 + _1259;
    float _1263 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1257);
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1267 = _1109 + _1265;
    float _1269 = fma(_1261, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1271 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1263);
    float _1273 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1275 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    float _1285 = fma(_1267, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1287 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1289 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1273);
    float _1291 = 1.0 / _1287;
    float _1293 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1289);
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1297 = _1267;
    int _1299 = 2;
    float _1301 = _1237;
    if (_1283)
    {
        _1297 = _1269;
    }
    float _1303 = _1297;
    float _1305 = _1295 + _1287;
    float _1307 = _1305 * _1291;
    float _1309 = _1307 * 0.5;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1313 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1311);
    float _1315 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1317 = 1.0 / _1313;
    float _1319 = _1029 + _1315;
    float _1321 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1323 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1321);
    float _1325 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1323);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1329 = _1317 * _1327;
    float _1331 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1335 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1337 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1331);
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1341 = trunc(_1333);
    int _1343 = int(_1341);
    bool _1345 = !_1335;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1337);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1353 = _1303;
    if (!_1335)
    {
        _1299 = 1;
    }
    int _1355 = _1299;
    float _1357 = trunc(_1351);
    int _1359 = int(_1357);
    int _1361 = _1355;
    if (!_1339)
    {
        _1361 = _1347;
    }
    int _1363 = _1361;
    int _1365 = _1363 << 6;
    int _1367 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1369 = _1343 + _1367;
    int _1371 = _1369 + 1;
    int _1373 = _1365 + 48;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    bool _1391 = _1371 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1393 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1395 = _1359 + _1393;
    int _1397 = _1395 + 1;
    int _1399 = _1365 + 56;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    int _1417 = _1371 | _1397;
    bool _1419 = _1417 < 0;
    bool _1421 = _1419 || _1391;
    int _1423 = _1365 + 64;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1443 = _1117 + _1441;
    bool _1445 = _1397 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1447 = _1445 || _1421;
    float _1449 = fma(_1443, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1451 = _1443;
    int _1453 = _1371;
    if (_1283)
    {
        _1301 = _1285;
    }
    float _1455 = _1301;
    int _1457 = _1365 + 72;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    float _1475 = _1455;
    if (_1283)
    {
        _1451 = _1449;
    }
    float _1477 = _1451;
    int _1479 = _1365 + 96;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    uint _1483 = uint(int(uint(int(_1481)) >> uint(2)));
    int _1485 = int(_1481) & 3;
    float _1487 = (*spvDescriptorSet0.vp_c15)._m0[int(_1483)][_1485];
    int _1489 = int(_1481) + 1;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    int _1493 = _1489 & 3;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[int(_1491)][_1493];
    int _1497 = _1365 + 104;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    float _1515 = _1477;
    if (!_1283)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1519 = _1029 + _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1523 = _502 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = _1519 * _1519;
        float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1531 = _898 + _1529;
        float _1533 = fma(_1523, _1523, _1527);
        float _1535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1537 = fma(_1531, _1531, _1533);
        float _1539 = sqrt(_1537);
        float _1541 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1543 = -_898;
        float _1545 = _1543 + _1449;
        float _1547 = precise::min(_1539, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1549 = _1547 * _1535;
        float _1551 = -_1029;
        float _1553 = _1551 + _1285;
        float _1555 = _1541 * _1549;
        float _1557 = -_502;
        float _1559 = _1557 + _1269;
        float _1561 = fma(_1553, _1555, _1029);
        float _1563 = fma(_1559, _1555, _502);
        float _1565 = fma(_1545, _1555, _898);
        _1475 = _1561;
        _1353 = _1563;
        _1515 = _1565;
        _1171 = as_type<int>(_1535);
    }
    float _1567 = _1475;
    float _1569 = _1353;
    float _1571 = _1515;
    int _1573 = _1171;
    float _1575 = _1319 * _1495;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1579 = _1573;
    if (!_1447)
    {
        int _1581 = _1397 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1583 = _1581 + _1371;
        _1453 = _1583;
    }
    int _1585 = _1453;
    float _1587 = _1319 * _1439;
    float _1589 = fma(_502, _1487, _1575);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1593 = _1319 * _1389;
    int _1595 = as_type<int>(_1591);
    if (!_1447)
    {
        int _1597 = _1585 << 2;
        _1579 = _1597;
    }
    int _1599 = _1579;
    float _1601 = fma(_898, _1505, _1589);
    float _1603 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1591);
    float _1605 = fma(_502, _1381, _1593);
    float _1607 = fma(_502, _1431, _1587);
    int _1609 = _1599;
    if (!_1447)
    {
        uint _1611 = uint(int(uint(_1585) >> uint(2)));
        _1595 = int(_1611);
    }
    int _1613 = _1595;
    float _1615 = _1601 + _1513;
    if (!_1447)
    {
        int _1617 = 12 & _1599;
        _1609 = _1617;
    }
    int _1619 = _1609;
    int _1621 = _1365 + 80;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    uint _1625 = uint(int(uint(int(_1623)) >> uint(2)));
    int _1627 = int(_1623) & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    int _1631 = int(_1623) + 1;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    int _1635 = _1631 & 3;
    float _1637 = (*spvDescriptorSet0.vp_c15)._m0[int(_1633)][_1635];
    float _1639 = fma(_898, _1407, _1605);
    float _1641 = 1.0 / _1615;
    float _1643 = as_type<float>(_1619);
    if (!_1447)
    {
        int _1645 = _1613 << 4;
        int _1647 = _1645 + _1619;
        _1643 = as_type<float>(_1647);
    }
    float _1649 = _1643;
    float _1651 = fma(_898, _1465, _1607);
    float _1653 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1655 = _1639 + _1415;
    float _1657 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1659 = _1365 + 88;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    uint _1663 = uint(int(uint(int(_1661)) >> uint(2)));
    int _1665 = int(_1661) & 3;
    float _1667 = (*spvDescriptorSet0.vp_c15)._m0[int(_1663)][_1665];
    int _1669 = int(_1661) + 1;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    int _1673 = _1669 & 3;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
    float _1677 = _1651 + _1473;
    float _1679 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1681 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1653);
    float _1683 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1685 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1687 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1679);
    float _1689 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1681);
    float _1691 = _1649;
    if (!_1447)
    {
        int _1693 = as_type<int>(_1649) + 400;
        uint _1695 = uint(int(uint(_1693) >> uint(2)));
        uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
        int _1699 = int(_1695) & 3;
        float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
        _1691 = _1701;
    }
    float _1703 = _1691;
    float _1705 = -_1685;
    float _1707 = fma(_1705, _1683, 1.0);
    float _1709 = _1655 * _1641;
    float _1711 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1713 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1687);
    float _1715 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1717 = _1677 * _1641;
    bool _1719 = _1709 >= 0.0;
    float _1721 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1711);
    float _1723 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1725 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1727 = _1709 <= 1.0;
    bool _1729 = _1727 && _1719;
    float _1731 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1721);
    float _1733 = _989;
    float _1735 = _1641;
    if (!_1447)
    {
        float _1737 = floor(_1351);
        _1733 = _1737;
    }
    float _1739 = _1733;
    float _1741 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1725);
    bool _1743 = _1717 >= 0.0;
    bool _1745 = _1743 && _1729;
    float _1747 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1749 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1751 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1741);
    bool _1753 = _1717 <= 1.0;
    bool _1755 = _1753 && _1745;
    float _1757 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1759 = log2(_1707);
    float _1761 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1751);
    float _1763 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1749);
    float _1765 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1757);
    float _1767 = 1.0 / _1761;
    float _1769 = _1739;
    if (!_1447)
    {
        float _1771 = -_1739;
        float _1773 = _1351 + _1771;
        _1769 = _1773;
    }
    float _1775 = _1769;
    float _1777 = _1319 * _1637;
    float _1779 = _1637;
    if (_1755)
    {
        float _1781 = float(_1363);
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1765);
    float _1787 = fma(_502, _1629, _1777);
    float _1789 = _924;
    if (!_1447)
    {
        float _1791 = floor(_1333);
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1763);
    float _1797 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1785);
    float _1799 = fma(_898, _1667, _1787);
    float _1801 = _1759 * 0.693147182464599609375;
    float _1803 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1795);
    float _1805 = _1799 + _1675;
    float _1807 = _1777;
    float _1809 = _1801;
    if (_1755)
    {
        float _1811 = rint(_1783);
        float _1813 = precise::max(_1811, 0.0);
        uint _1815 = uint(_1813);
        uint _1817 = clamp(_1815, 0u, 65535u);
        _1807 = as_type<float>(_1817);
    }
    float _1819 = _1807;
    float _1821 = _1797 * _1767;
    float _1823 = _1803 * _1767;
    float _1825 = _1805 * _1641;
    float _1827 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1829 = fma(_1821, 0.5, 0.5);
    float _1831 = fma(_1823, -0.5, 0.5);
    float _1833 = _1703;
    float _1835 = _1829;
    float _1837 = _1825;
    if (!_1447)
    {
        float _1839 = rint(_1703);
        float _1841 = precise::max(_1839, 0.0);
        uint _1843 = uint(_1841);
        uint _1845 = clamp(_1843, 0u, 65535u);
        _1833 = as_type<float>(_1845);
    }
    float _1847 = _1833;
    if (!_1447)
    {
        float _1849 = -_1793;
        float _1851 = _1333 + _1849;
        _1809 = _1851;
    }
    float _1853 = _1809;
    float _1855 = _1819;
    if (_1755)
    {
        float3 _5535 = float3(_1709, _1717, float(as_type<int>(_1819)));
        float3 _5539 = select(_5535, float3(0.0), isnan(_5535));
        float _1857 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5539.xy, uint(rint(_5539.z)), _1825, level(0.0));
        _1855 = _1857;
    }
    float _1859 = _1855;
    float3 _5549 = float3(_1829, _1831, _1827);
    float _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5549, float3(0.0), isnan(_5549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5549, float3(0.0), isnan(_5549)), level(0.0)).x;
    float3 _5558 = float3(_1829, _1831, _1827);
    float4 _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5558, float3(0.0), isnan(_5558)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5558, float3(0.0), isnan(_5558)), level(0.0)).xyzw;
    float _1866 = _1864.x;
    float _1868 = _1864.y;
    float _1870 = _1864.z;
    float _1872 = _1864.w;
    float _1874 = _1853;
    if (!_1447)
    {
        float3 _5581 = float3(_1853, _1775, float(as_type<int>(_1847)));
        float3 _5583 = select(_5581, float3(0.0), isnan(_5581));
        float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5583.xy, uint(rint(_5583.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5583.xy, uint(rint(_5583.z)), level(0.0)).x;
        _1874 = _1876;
    }
    float _1878 = _1874;
    if (_1447)
    {
        _1735 = 1.0;
    }
    float _1880 = _1735;
    float _1882 = _1880;
    if (!_1447)
    {
        int _1884 = _1585 << 4;
        int _1886 = _1884 + 2048;
        uint _1888 = uint(int(uint(_1886) >> uint(2)));
        uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
        int _1892 = int(_1888) & 3;
        float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
        int _1896 = int(_1888) + 1;
        uint _1898 = uint(int(uint(_1896) >> uint(2)));
        int _1900 = _1896 & 3;
        float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
        int _1904 = _1886 + 8;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        uint _1908 = uint(int(uint(int(_1906)) >> uint(2)));
        int _1910 = int(_1906) & 3;
        float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
        int _1914 = int(_1906) + 1;
        uint _1916 = uint(int(uint(_1914) >> uint(2)));
        int _1918 = _1914 & 3;
        float _1920 = (*spvDescriptorSet0.vp_c15)._m0[int(_1916)][_1918];
        float _1922 = _1319 * _1902;
        float _1924 = fma(_502, _1894, _1922);
        float _1926 = fma(_898, _1912, _1924);
        float _1928 = _1926 + _1920;
        float _1930 = precise::clamp(_1928, 0.0, 1.0);
        float _1932 = -_1930;
        float _1934 = _1932 + _1878;
        float _1936 = fma(_1934, 500.0, 1.5);
        float _1938 = exp2(_1936);
        float _1940 = 0.0 + _1938;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1835 = _1894;
        _1882 = _1942;
    }
    float _1944 = _1835;
    float _1946 = _1882;
    float _1948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1950 = _1567 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1954 = _1569 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1958 = _1571 + _1956;
    float _1960 = _1950 * _1950;
    float _1962 = fma(_1954, _1954, _1960);
    float _1964 = fma(_1958, _1958, _1962);
    float _1966 = rsqrt(_1964);
    float _1968 = sqrt(_1964);
    float _1970 = _1954 * _1966;
    float _1972 = _1958 * _1966;
    float _1974 = _1950 * _1966;
    float _1976 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1978 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1980 = _1976 * _1976;
    float _1982 = _1978 * _1978;
    float _1984 = _1980 + _1982;
    float _1986 = sqrt(_1984);
    bool _1988 = _1986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1992 = _1986 + _1990;
    float _1994 = _1847;
    float _1996 = _1992;
    float _1998 = _1944;
    if (_1988)
    {
        float _2000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = _2002;
    if (_1988)
    {
        float _2006 = _1992 * _2002;
        _1996 = _2006;
    }
    float _2008 = _1996;
    if (_1988)
    {
        float _2010 = _2008 * 0.15915493667125701904296875;
        _1998 = _2010;
    }
    float _2012 = _1998;
    float _2014 = _502;
    float _2016 = _2012;
    if (_1988)
    {
        float _2018 = _2012 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2026 = precise::max(0.0, _2024);
    float _2028 = _1878;
    float _2030 = _2026;
    if (_1988)
    {
        float _2032 = _2012 * 6.283185482025146484375;
        float _2034 = cos(_2032);
        _2028 = _2034;
    }
    float _2036 = _2028;
    float _2038 = -_1974;
    float _2040 = -_2026;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2040);
    float _2044 = _2024;
    if (_1988)
    {
        float _2046 = rsqrt(_1984);
        _2044 = _2046;
    }
    float _2048 = _2044;
    if (_1988)
    {
        float _2050 = _2042 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2050;
    }
    float _2052 = _2030;
    float _2054 = _2022;
    float _2056 = _2052;
    if (_1988)
    {
        float _2058 = fma(_2022, _2052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2004 = _2058;
    }
    float _2060 = _2004;
    float _2062 = _2060;
    if (!_1988)
    {
        _2054 = _1976;
    }
    float _2064 = _2054;
    float _2066 = _2064;
    float _2068 = _2036;
    if (_1988)
    {
        float _2070 = _2036 + (-1.0);
        _2056 = _2070;
    }
    float _2072 = _2056;
    float _2074 = _2072;
    if (_1988)
    {
        float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2016 = _2076;
    }
    float _2078 = _2016;
    if (!_1988)
    {
        _2074 = _1978;
    }
    float _2080 = _2074;
    float _2082 = _2048;
    float _2084 = _2080;
    if (_1988)
    {
        float _2086 = _2048 * _2060;
        _1015 = _2086;
    }
    float _2088 = _1015;
    if (!_1988)
    {
        _2082 = _2042;
    }
    float _2090 = _2082;
    float _2092 = _2090;
    if (_1988)
    {
        float _2094 = fma(_2042, _2036, _2078);
        _2092 = _2094;
    }
    float _2096 = _2092;
    if (!_1988)
    {
        _2062 = _1980;
    }
    float _2098 = _2062;
    float _2100 = _2098;
    if (_1988)
    {
        float _2102 = _1976 * _2088;
        _2066 = _2102;
    }
    float _2104 = _2066;
    if (_1988)
    {
        float _2106 = _1978 * _2088;
        _2084 = _2106;
    }
    float _2108 = _2084;
    if (!_1988)
    {
        _2068 = _1982;
    }
    float _2110 = _2068;
    float _2112 = _2110;
    if (_1988)
    {
        float _2114 = _2104 * _2104;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_1988)
    {
        float _2118 = _2108 * _2108;
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = fma(_2096, _2096, _2116);
    float _2124 = _2122 + _2120;
    float _2126 = rsqrt(_2124);
    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2130 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2128);
    float _2132 = precise::clamp(_2130, 0.0, 1.0);
    float _2134 = -_2132;
    float _2136 = _2134 + 1.0;
    float _2138 = _2126 * _2104;
    float _2140 = _2126 * _2096;
    float _2142 = _2126 * _2108;
    float _2144 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2146 = abs(_2136);
    float _2148 = log2(_2146);
    float _2150 = -_2144;
    float _2152 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = -_2142;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2158 = fma(_2156, -0.5, 0.5);
    float _2160 = fma(_2156, 0.5, 0.5);
    float _2162 = fma(_2160, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2164 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = sqrt(_2158);
    float _2168 = fma(_2160, _2162, -0.212114393711090087890625);
    float _2170 = _2140 + 1.0;
    float _2172 = fma(_2160, _2168, 1.570728778839111328125);
    float _2174 = exp2(_2164);
    float _2176 = _2166 * 0.636619746685028076171875;
    float _2178 = -_2140;
    float _2180 = fma(_2174, _2170, _2178);
    float _2182 = -_2172;
    float _2184 = fma(_2176, _2182, 1.0);
    float _2186 = fma(_2180, 0.5, 0.5);
    float2 _6066 = float2(_2184, _2186);
    float3 _2190 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6066, float2(0.0), isnan(_6066)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6066, float2(0.0), isnan(_6066)), level(0.0)).xyz;
    float _2192 = _2190.x;
    float _2194 = _2190.y;
    float _2196 = _2190.z;
    float _2198 = abs(_1329);
    float _2200 = log2(_2198);
    float _2202 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2204 = -_1255;
    float _2206 = _2204 + 1.0;
    out.m_87.x = _1569;
    out.m_87.y = _1567;
    out.m_87.z = _1571;
    float _2208 = exp2(_2202);
    bool _2210 = _1329 <= 8000.0;
    bool _2212 = isnan(_1329);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan(8000.0);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2224 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2226 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2224);
    float _2228 = exp2(_2222);
    float _2230 = -_2208;
    float _2232 = _2230 + 1.0;
    float _2234 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2236 = precise::clamp(_2234, 0.0, 1.0);
    float _2238 = fma(_2236, -2.0, 3.0);
    float _2240 = _2236 * _2236;
    float _2242 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2226);
    float _2244 = _2240 * _2238;
    float _2246 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _2248 = -_2244;
    float _2250 = _2248 + 1.0;
    out.gl_Position.x = _1797;
    out.gl_Position.y = _1803;
    out.gl_Position.z = _2246;
    out.gl_Position.w = _1761;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2244);
    float _2254 = _2246 + _1761;
    float _2256 = _2220 * _2252;
    float _2258 = _2220;
    float _2260 = _2246;
    float _2262 = _1797;
    if (!_1755)
    {
        _2258 = 1.0;
    }
    float _2264 = _2258;
    float _2266 = _2254 * 0.5;
    float _2268 = _2264;
    if (_1755)
    {
        bool _2270 = _1859 >= _1825;
        bool _2272 = isnan(_1859);
        bool _2274 = _2270 || _2272;
        bool _2276 = isnan(_1825);
        bool _2278 = _2274 || _2276;
        float _2280 = float(_2278);
        _2268 = _2280;
    }
    float _2282 = _2268;
    float _2284 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2286 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2288 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2290 = isnan(_1968);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2296 = _2292 || _2294;
    out.m_89.z = _2266;
    out.m_89.w = _1761;
    float _2298 = _2206 * _2284;
    float _2300 = precise::clamp(_2298, 0.0, 1.0);
    float _2302 = _2286 * _1861;
    float _2304 = _2282 * _1946;
    float _2306 = -_2286;
    float _2308 = _2306 + 1.0;
    float _2310 = -_2300;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2314 = _1872 * _2302;
    float _2316 = _1872 * _2308;
    float _2318 = -_2304;
    float _2320 = fma(_2318, _2312, 1.0);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = _2304;
    float _2326 = _2300;
    float _2328 = _2322;
    if (!_2296)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2330 = _2260;
    float _2332 = _2322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2334 = _2330;
    float _2336 = _2330;
    if (!_2296)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2338 = _2262;
    float _2340 = _2338;
    float _2342 = _2338;
    if (!_2296)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2344 = _2324;
    out.m_91.x = _2332;
    float _2346 = _2344;
    float _2348 = _2344;
    if (!_2296)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2350 = _1837;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2296)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2356 = _2326;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2296)
    {
        _2328 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2362 = _2328;
    float _2364 = _2196 * _2302;
    float _2366 = fma(_2192, _2314, _1866);
    float _2368 = fma(_2194, _2314, _1868);
    float _2370 = fma(_1872, _2364, _1870);
    out.m_93.x = _2366;
    out.m_93.y = _2368;
    out.m_93.z = _2370;
    out.m_93.w = _2316;
    bool _2372 = !_2296;
    float _2374 = _2362;
    float _2376 = _2362;
    if (!_2372)
    {
        bool _2378 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2380 = isnan(_1968);
        bool _2382 = _2378 || _2380;
        bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2386 = _2382 || _2384;
        if (!_2386)
        {
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2390 = _1968 + _2388;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2394 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2392;
            float _2396 = 1.0 / _2394;
            float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2400 = _2398 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2410 = _2390 * _2396;
            float _2412 = precise::clamp(_2410, 0.0, 1.0);
            float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2426 = fma(_2412, _2408, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2428 = fma(_2412, _2416, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2430 = fma(_2412, _2420, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2432 = fma(_2412, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2434 = fma(_2412, _2400, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2436 = fma(_2412, _2404, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _2342 = _2430;
            _2360 = _2436;
            _2336 = _2428;
            _2354 = _2434;
            _2348 = _2432;
            _2376 = _2426;
            _2438 = true;
        }
        else
        {
            bool _2440 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2442 = isnan(_1968);
            bool _2444 = _2440 || _2442;
            bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2448 = _2444 || _2446;
            if (!_2448)
            {
                _2334 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2450 = _2334;
            _2336 = _2450;
            if (!_2448)
            {
                _2340 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2452 = _2340;
            _2342 = _2452;
            if (!_2448)
            {
                _2346 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2454 = _2346;
            _2348 = _2454;
            if (!_2448)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2456 = _2352;
            _2354 = _2456;
            if (!_2448)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2458 = _2358;
            _2360 = _2458;
            if (!_2448)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2460 = _2374;
            bool _2462 = !_2448;
            _2376 = _2460;
            if (!_2462)
            {
                bool _2464 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2466 = isnan(_1968);
                bool _2468 = _2464 || _2466;
                bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2472 = _2468 || _2470;
                if (!_2472)
                {
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2476 = _1968 + _2474;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2478;
                    float _2482 = 1.0 / _2480;
                    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2496 = _2476 * _2482;
                    float _2498 = precise::clamp(_2496, 0.0, 1.0);
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2512 = fma(_2498, _2494, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2514 = fma(_2498, _2502, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2516 = fma(_2498, _2506, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2518 = fma(_2498, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2520 = fma(_2498, _2486, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2522 = fma(_2498, _2490, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _2342 = _2516;
                    _2360 = _2522;
                    _2336 = _2514;
                    _2354 = _2520;
                    _2348 = _2518;
                    _2376 = _2512;
                    _2438 = true;
                }
                else
                {
                    _2342 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2336 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2348 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2438 = false;
    float _2524 = _2342;
    float _2526 = _2360;
    float _2528 = _2336;
    float _2530 = _2354;
    float _2532 = _2348;
    float _2534 = _2376;
    float _2536 = fma(_1149, -0.5, 0.5);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -_2524;
    float _2542 = _2540 + _2526;
    float _2544 = -_2528;
    float _2546 = _2544 + _2530;
    float _2548 = -_2532;
    float _2550 = _2548 + _2534;
    bool _2552 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = fma(_2538, _2542, _2524);
    float _2556 = fma(_2538, _2546, _2528);
    float _2558 = fma(_2538, _2550, _2532);
    float _2560 = _2554 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2562 = fma(_2556, 0.298911988735198974609375, _2560);
    float _2564 = fma(_2558, 0.114477999508380889892578125, _2562);
    out.m_97.x = 0.0;
    float _2566 = -_2564;
    float _2568 = _2556 + _2566;
    float _2570 = -_2564;
    float _2572 = _2554 + _2570;
    float _2574 = -_2564;
    float _2576 = _2558 + _2574;
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2584 = fma(_2576, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    out.m_61.x = _2578;
    out.m_99.x = _2580;
    out.m_99.y = _2582;
    out.m_99.z = _2584;
    if (!_2552)
    {
        return out;
    }
    float _2586 = -_1567;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2590 = -_1569;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2594 = -_1571;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2598 = _2588 * _2588;
    float _2600 = fma(_2592, _2592, _2598);
    float _2602 = fma(_2596, _2596, _2600);
    float _2604 = rsqrt(_2602);
    float _2606 = sqrt(_2602);
    float _2608 = _2588 * _2604;
    float _2610 = _2592 * _2604;
    float _2612 = _2596 * _2604;
    float _2614 = -_1974;
    float _2616 = _2614 + _2608;
    float _2618 = -_1970;
    float _2620 = _2618 + _2610;
    float _2622 = -_1972;
    float _2624 = _2622 + _2612;
    float _2626 = _2616 * _2616;
    float _2628 = -_2606;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2632 = fma(_2620, _2620, _2626);
    float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = fma(_2624, _2624, _2632);
    float _2640 = abs(_2636);
    float _2642 = log2(_2640);
    float _2644 = rsqrt(_2638);
    float _2646 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2648 = exp2(_2646);
    float _2650 = _2616 * _2644;
    float _2652 = _2620 * _2644;
    float _2654 = _2624 * _2644;
    float _2656 = _1149 * _2650;
    float _2658 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = _1149 * _2608;
    float _2664 = fma(_1145, _2652, _2656);
    float _2666 = _2660 * _2660;
    float _2668 = fma(_1145, _2610, _2662);
    float _2670 = fma(_1159, _2654, _2664);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = _2666 + (-1.0);
    float _2676 = fma(_1159, _2612, _2668);
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = _2672 * _2672;
    float _2682 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2684 = fma(_2680, _2674, 1.0);
    float _2686 = -_2608;
    float _2688 = -_2682;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2688);
    float _2692 = _2684 * _2684;
    float _2694 = -_2612;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2690);
    float _2698 = 1.0 / _2692;
    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2702 = _2696 + _2700;
    float _2704 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2706 = precise::clamp(_2704, 0.0, 1.0);
    float _2708 = _2648 * _2706;
    float _2710 = _2678 * _2708;
    float _2712 = _2666 * _2698;
    float _2714 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2716 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2720 = _2710 * _2712;
    float _2722 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2724 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2726 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2714;
    out.m_95.y = _2716;
    out.m_95.z = _2718;
    out.m_97.x = _2722;
    out.m_97.y = _2724;
    out.m_97.z = _2726;
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
    bool _2438 = false;
    bool _1207 = false;
    bool _352 = false;
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
        float _2783 = as_type<float>(_134);
        out.gl_Position.z = _2783;
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
        float _2853 = as_type<float>(_172);
        out.gl_Position.z = _2853;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_65.x;
    float _176 = in.m_65.y;
    float _178 = in.m_65.z;
    float _180 = in.m_67.x;
    float _182 = in.m_67.y;
    float _184 = in.m_67.z;
    float _186 = in.m_69.x;
    float _188 = in.m_69.y;
    float _190 = in.m_69.z;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    bool _216 = _210 > 0.0;
    bool _218 = _212 > 0.0;
    float _220 = _212;
    float _222 = _204;
    float _224 = _208;
    if (_216)
    {
        float _226 = rsqrt(_204);
        _220 = _226;
    }
    float _228 = _220;
    float _230 = 0.0;
    if (!_216)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _214 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    if (!_216)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = 0.0;
    float _244 = _240;
    if (!_216)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = _214;
    float _250 = _246;
    if (_218)
    {
        float _252 = rsqrt(_206);
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = 0.0;
    if (!_218)
    {
        _256 = 0.0;
        _258 = 0.0;
    }
    float _260 = _256;
    float _262 = _258;
    float _264 = 0.0;
    float _266 = _262;
    float _268 = _260;
    if (!_218)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = _210;
    float _274 = _270;
    if (_234)
    {
        float _276 = rsqrt(_208);
        _272 = _276;
    }
    float _278 = _272;
    if (_216)
    {
        float _280 = _228 * _180;
        _238 = _280;
    }
    float _282 = _238;
    if (_216)
    {
        float _284 = _228 * _174;
        _244 = _284;
    }
    float _286 = _244;
    if (_216)
    {
        float _288 = _228 * _186;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _294 = 0.0;
    if (!_234)
    {
        _294 = 0.0;
    }
    float _296 = _294;
    float _298 = _296;
    if (!_234)
    {
        _222 = 0.0;
    }
    float _300 = _222;
    float _302 = _300;
    if (_218)
    {
        float _304 = _254 * _182;
        _274 = _304;
    }
    float _306 = _274;
    if (!_234)
    {
        _224 = 0.0;
    }
    float _308 = _224;
    float _310 = _308;
    if (_218)
    {
        float _312 = _254 * _176;
        _266 = _312;
    }
    float _314 = _266;
    if (_218)
    {
        float _316 = _254 * _188;
        _268 = _316;
    }
    float _318 = _268;
    if (_234)
    {
        float _320 = _278 * _184;
        _298 = _320;
    }
    float _322 = _298;
    if (_234)
    {
        float _324 = _278 * _178;
        _310 = _324;
    }
    float _326 = _310;
    if (_234)
    {
        float _328 = _278 * _190;
        _302 = _328;
    }
    float _330 = _302;
    bool _332 = !_292;
    float _350;
    if (!_332)
    {
        float _334 = in.m_71.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_118);
        float _356 = 1.0 / _354;
        float _358 = _152 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_71.z;
    float _364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _366 = log2(_364);
    float _368 = in.m_71.x;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _372 = _360 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = in.m_71.y;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _394 = _392 != 0;
    float _396 = 1.0 / _376;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _360 + _398;
    float _402 = in.m_58.x;
    float _404 = in.m_58.y;
    float _406 = in.m_58.z;
    float _408 = 1.0 / _380;
    float _410 = _366 * _152;
    float _412 = _362 * 2.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _400 * _396;
    float _420 = _368 * 2.0;
    float _422 = _368 + _362;
    float _424 = floor(_412);
    float _426 = _382 * 2.0;
    float _428 = _422 + (-1.0);
    float _430 = _372 * _408;
    float _432 = _182 * _404;
    float _434 = _382 + _362;
    float _436 = floor(_420);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _440 = fma(_180, _402, _432);
    float _442 = _368 + _382;
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _434 + (-1.0);
    float _450 = _188 * _404;
    float _452 = _442 + (-1.0);
    float _454 = floor(_426);
    bool _456 = _424 > 0.0;
    float _458 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _460 = _424 >= 0.0;
    bool _462 = isnan(_424);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_186, _402, _450);
    float _472 = fma(_184, _406, _440);
    int _474 = _468 ? 0 : 1;
    float _476 = fma(_190, _406, _470);
    bool _478 = _436 > 0.0;
    float _480 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _482 = ~_474;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _488;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _504 = _486;
    float _506 = _402;
    if (!_456)
    {
        int _508 = ~_474;
        int _510 = _508 + 1;
        _504 = _510;
    }
    int _512 = _504;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _514;
    int _518 = abs(_446);
    float _520 = _176 * _404;
    bool _522 = _454 > 0.0;
    float _524 = fma(_516, _418, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _526 = _454 >= 0.0;
    bool _528 = isnan(_454);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = fma(_490, _418, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = exp2(_410);
    float _540 = float(_518);
    float _542 = fma(_416, _418, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _544 = float(_512);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _554 = _500 ? 0 : 1;
    float _556 = _540 * _544;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _562 = in.m_73.x;
    float _564 = in.m_73.y;
    float _566 = in.m_73.z;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    int _572 = ~_554;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = _556 * (-2.0);
    int _580 = _576;
    if (!_478)
    {
        int _582 = ~_554;
        int _584 = _582 + 1;
        _580 = _584;
    }
    int _586 = _580;
    float _588 = 1.0 / _570;
    bool _590 = !_390;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_174, _402, _520);
    bool _596 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    int _606 = abs(_592);
    float _608 = -_538;
    float _610 = _608 + 1.0;
    float _612 = fma(_548, _430, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _614 = fma(_560, _430, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _624 = _620 || _622;
    float _626 = fma(_552, _430, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _628 = float(_606);
    float _630 = fma(_178, _406, _594);
    float _632 = float(_586);
    float _634 = _624 ? _610 : 0.0;
    int _636 = _534 ? 0 : 1;
    float _638 = _628 * _632;
    float _640 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    if (_604)
    {
        float _642 = _634 * _588;
        _154 = _642;
    }
    float _644 = _154;
    float _646 = fma(_480, _578, _480);
    float _648 = _638 * (-2.0);
    float _650 = fma(_578, _562, _562);
    float _652 = _640 * _368;
    float _654 = _368 + (-0.5);
    bool _656 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _658 = isnan(_360);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = fma(_458, _648, _458);
    bool _670 = !_394;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_648, _564, _564);
    float _676 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _650);
    int _678 = ~_636;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = -_666;
    float _686 = _684 + 1.0;
    bool _688 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _690 = isnan(_360);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = fma(_646, _644, _676);
    int _702 = _682;
    if (!_522)
    {
        int _704 = ~_636;
        int _706 = _704 + 1;
        _702 = _706;
    }
    int _708 = _702;
    float _710 = trunc(_652);
    int _712 = int(_710);
    int _714 = abs(_672);
    float _716 = _698 * _686;
    bool _718 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _720 = isnan(_360);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _382 + (-0.5);
    float _732 = float(_714);
    float _734 = -_698;
    float _736 = _734 + 1.0;
    float _738 = float(_708);
    float _740 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _742 = _700 * 0.15915493667125701904296875;
    float _744 = _728 * _736;
    float _746 = -_728;
    float _748 = _746 + 1.0;
    float _750 = _732 * _738;
    float _752 = fma(_668, _644, _740);
    float _754 = _524 * _744;
    float _756 = _536 * _744;
    float _758 = _542 * _744;
    float _760 = _750 * (-2.0);
    float _762 = in.m_75.x;
    float _764 = in.m_75.y;
    float _766 = in.m_75.z;
    float _768 = _752 * 0.15915493667125701904296875;
    float _770 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].z, _758);
    float _772 = fma(_438, _760, _438);
    float _774 = fma(_760, _566, _566);
    float _776 = _362 + (-0.5);
    float _778 = in.m_77.x;
    float _780 = in.m_77.y;
    float _782 = in.m_77.z;
    float _784 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].y, _756);
    float _786 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[143].x, _754);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _790 = fma(_626, _716, _770);
    float _792 = fma(_614, _716, _784);
    float _794 = fma(_612, _716, _786);
    float _796 = fma(_772, _644, _788);
    float _798 = _742 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].y, _792);
    float _804 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].z, _790);
    float _806 = _796 * 0.15915493667125701904296875;
    float _808 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[145].x, _794);
    int _810 = _712 << 4;
    int _812 = _810 + 1712;
    float _814 = _742 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _804 * _766;
    float _820 = _808 * _762;
    float _822 = _802 * _764;
    float _824 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _828 = _768 * 6.283185482025146484375;
    float _830 = cos(_828);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _778);
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _780);
    float _836 = _822 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _840 = _826 * _832;
    bool _842 = _780 != 0.0;
    bool _844 = isnan(_780);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = _836 * _834;
    float _854 = _806 * 6.283185482025146484375;
    float _856 = cos(_854);
    float _858 = _824 * _838;
    bool _860 = _778 == 0.0;
    bool _862 = !_850;
    bool _864 = _860 && _862;
    bool _866 = _782 == 0.0;
    bool _868 = _866 && _864;
    float _870 = _768 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _800 * _830;
    float _876 = _816 * _830;
    float _878 = _806 * 6.283185482025146484375;
    float _880 = sin(_878);
    float _882 = _830 * _856;
    float _884 = _816 * _856;
    float _886 = _800 * _856;
    float _888 = _884 * _852;
    float _890 = _886 * _852;
    float _892 = _800 * _872;
    float _894 = _816 * _872;
    float _896 = _872 * _856;
    float _898 = _476 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = fma(_880, _876, _892);
    float _902 = -_894;
    float _904 = fma(_880, _874, _902);
    float _906 = -_874;
    float _908 = fma(_880, _894, _906);
    float _910 = -_852;
    float _912 = _880 * _910;
    float _914 = fma(_900, _840, _888);
    float _916 = fma(_904, _840, _890);
    float _918 = fma(_880, _892, _876);
    float _920 = fma(_882, _840, _912);
    float _922 = fma(_908, _858, _914);
    float _924 = fma(_918, _858, _916);
    float _926 = fma(_896, _858, _920);
    float _928 = _922 * _306;
    float _930 = _922 * _318;
    int _932 = _812 + 8;
    uint _935 = uint(int(uint(_932) >> uint(2)));
    uint _937 = uint(int(uint(int(_935)) >> uint(2)));
    int _939 = int(_935) & 3;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[int(_937)][_939];
    float _943 = _922 * _314;
    float _945 = fma(_926, _282, _928);
    float _947 = fma(_926, _290, _930);
    float _949 = fma(_926, _286, _943);
    float _951 = fma(_924, _322, _945);
    float _953 = fma(_924, _330, _947);
    float _955 = in.m_79.x;
    float _957 = in.m_79.y;
    float _959 = in.m_79.z;
    float _961 = _502 + _951;
    float _963 = _898 + _953;
    float _965 = fma(_924, _326, _949);
    uint _967 = uint(int(uint(_812) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[int(_977)][_979];
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _985 = _961 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _989 = _963 + _987;
    float _991 = _985 * _985;
    float _993 = _989 * _989;
    float _995 = _991 + _993;
    float _997 = sqrt(_995);
    float _999 = _957;
    float _1001 = _955;
    float _1003 = _959;
    float _1005 = _991;
    float _1007 = _993;
    float _1009 = _961;
    float _1011 = _963;
    float _1013 = _965;
    float _1015 = _908;
    if (!_868)
    {
        float _1017 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _957);
        _999 = _1017;
    }
    float _1019 = _999;
    if (!_868)
    {
        float _1021 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _955);
        _1001 = _1021;
    }
    float _1023 = _1001;
    if (!_868)
    {
        float _1025 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _959);
        _1003 = _1025;
    }
    float _1027 = _1003;
    float _1029 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1031 = -_1019;
    float _1033 = _880 * _1031;
    float _1035 = _884 * _1019;
    float _1037 = _886 * _1019;
    float _1039 = _1029 + _965;
    float _1041 = fma(_882, _1023, _1033);
    float _1043 = fma(_900, _1023, _1035);
    bool _1045 = _997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = fma(_904, _1023, _1037);
    float _1049 = fma(_896, _1027, _1041);
    float _1051 = fma(_908, _1027, _1043);
    float _1053 = fma(_918, _1027, _1047);
    if (!_1045)
    {
        _506 = _1039;
    }
    float _1055 = _506;
    bool _1057 = !_1045;
    float _1059 = _1055;
    if (!_1057)
    {
        float _1061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1065 = _997 + _1063;
        float _1067 = rsqrt(_995);
        float _1069 = _1065 * _1061;
        float _1071 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = _1069 * 0.15915493667125701904296875;
        float _1075 = _1073 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1073 * 6.283185482025146484375;
        float _1081 = cos(_1079);
        float _1083 = fma(_1077, _1071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1085 = _1067 * _1083;
        float _1087 = _1081 + (-1.0);
        float _1089 = fma(_985, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1091 = fma(_989, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1093 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1097 = _1089 + _1095;
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1101 = _1091 + _1099;
        float _1103 = fma(_1039, _1081, _1093);
        float _1105 = _1097 * _1097;
        float _1107 = _1101 * _1101;
        _1059 = _1103;
        _1005 = _1105;
        _1007 = _1107;
        _1009 = _1089;
        _1011 = _1091;
    }
    float _1109 = _1059;
    float _1111 = _1005;
    float _1113 = _1007;
    float _1115 = _1009;
    float _1117 = _1011;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1121 = _1109 + _1119;
    float _1123 = _1051 * _314;
    float _1125 = _1051 * _306;
    float _1127 = _1051 * _318;
    float _1129 = fma(_1121, _1121, _1111);
    float _1131 = fma(_1049, _286, _1123);
    float _1133 = fma(_1049, _282, _1125);
    float _1135 = _1129 + _1113;
    float _1137 = fma(_1049, _290, _1127);
    float _1139 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1141 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1143 = _941 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1145 = fma(_1053, _322, _1133);
    float _1147 = sqrt(_1135);
    float _1149 = fma(_1053, _326, _1131);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = fma(_1053, _330, _1137);
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _1153;
    out.m_83.y = _1155;
    out.m_83.z = _1157;
    out.m_83.w = _1151;
    bool _1161 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1163 = isnan(_1147);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1169 = _1165 || _1167;
    out.m_85.x = _1145;
    out.m_85.y = _1149;
    out.m_85.z = _1159;
    int _1171 = as_type<int>(_1127);
    if (!_1169)
    {
        _1013 = 1.0;
    }
    float _1173 = _1013;
    bool _1175 = !_1169;
    float _1177 = _1173;
    if (!_1175)
    {
        bool _1179 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1181 = isnan(_1147);
        bool _1183 = _1179 || _1181;
        bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1187 = _1183 || _1185;
        if (!_1187)
        {
            float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1191 = _1147 + _1189;
            float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1195 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1193;
            float _1197 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1199 = _1197 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1201 = 1.0 / _1195;
            float _1203 = _1191 * _1201;
            float _1205 = fma(_1203, _1199, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1177 = _1205;
            _1207 = true;
        }
        else
        {
            bool _1209 = _1147 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1211 = isnan(_1147);
            bool _1213 = _1209 || _1211;
            bool _1215 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1217 = _1213 || _1215;
            if (!_1217)
            {
                float _1219 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1221 = _1147 + _1219;
                float _1223 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1225 = _1223 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1227 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1229 = _1227 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1231 = 1.0 / _1225;
                float _1233 = _1221 * _1231;
                float _1235 = fma(_1233, _1229, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1177 = _1235;
                _1207 = true;
            }
            else
            {
                _1177 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1207 = false;
    float _1237 = _1177;
    float _1239 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1241 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1243 = floor(_1239);
    float _1245 = floor(_1241);
    float _1247 = -_1243;
    float _1249 = _1239 + _1247;
    float _1251 = -_1245;
    float _1253 = _1241 + _1251;
    float2 _4507 = float2(_1249, _1253);
    float _1255 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4507, float2(0.0), isnan(_4507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4507, float2(0.0), isnan(_4507)), level(0.0)).x;
    float _1257 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1261 = _1115 + _1259;
    float _1263 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1257);
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1267 = _1109 + _1265;
    float _1269 = fma(_1261, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1271 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1263);
    float _1273 = _1029 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1275 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1277 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.5);
    bool _1283 = _1279 || _1281;
    float _1285 = fma(_1267, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1287 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1289 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1273);
    float _1291 = 1.0 / _1287;
    float _1293 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1289);
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1297 = _1267;
    int _1299 = 2;
    float _1301 = _1237;
    if (_1283)
    {
        _1297 = _1269;
    }
    float _1303 = _1297;
    float _1305 = _1295 + _1287;
    float _1307 = _1305 * _1291;
    float _1309 = _1307 * 0.5;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1313 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1311);
    float _1315 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1317 = 1.0 / _1313;
    float _1319 = _1029 + _1315;
    float _1321 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1323 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1321);
    float _1325 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1323);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1329 = _1317 * _1327;
    float _1331 = _1319 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1335 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1337 = fma(_502, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1331);
    bool _1339 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1341 = trunc(_1333);
    int _1343 = int(_1341);
    bool _1345 = !_1335;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1337);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1353 = _1303;
    if (!_1335)
    {
        _1299 = 1;
    }
    int _1355 = _1299;
    float _1357 = trunc(_1351);
    int _1359 = int(_1357);
    int _1361 = _1355;
    if (!_1339)
    {
        _1361 = _1347;
    }
    int _1363 = _1361;
    int _1365 = _1363 << 6;
    int _1367 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1369 = _1343 + _1367;
    int _1371 = _1369 + 1;
    int _1373 = _1365 + 48;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    bool _1391 = _1371 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1393 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1395 = _1359 + _1393;
    int _1397 = _1395 + 1;
    int _1399 = _1365 + 56;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    int _1417 = _1371 | _1397;
    bool _1419 = _1417 < 0;
    bool _1421 = _1419 || _1391;
    int _1423 = _1365 + 64;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1443 = _1117 + _1441;
    bool _1445 = _1397 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1447 = _1445 || _1421;
    float _1449 = fma(_1443, _1237, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1451 = _1443;
    int _1453 = _1371;
    if (_1283)
    {
        _1301 = _1285;
    }
    float _1455 = _1301;
    int _1457 = _1365 + 72;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    float _1475 = _1455;
    if (_1283)
    {
        _1451 = _1449;
    }
    float _1477 = _1451;
    int _1479 = _1365 + 96;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    uint _1483 = uint(int(uint(int(_1481)) >> uint(2)));
    int _1485 = int(_1481) & 3;
    float _1487 = (*spvDescriptorSet0.vp_c15)._m0[int(_1483)][_1485];
    int _1489 = int(_1481) + 1;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    int _1493 = _1489 & 3;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[int(_1491)][_1493];
    int _1497 = _1365 + 104;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    float _1515 = _1477;
    if (!_1283)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1519 = _1029 + _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1523 = _502 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = _1519 * _1519;
        float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1531 = _898 + _1529;
        float _1533 = fma(_1523, _1523, _1527);
        float _1535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1537 = fma(_1531, _1531, _1533);
        float _1539 = sqrt(_1537);
        float _1541 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1543 = -_898;
        float _1545 = _1543 + _1449;
        float _1547 = precise::min(_1539, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1549 = _1547 * _1535;
        float _1551 = -_1029;
        float _1553 = _1551 + _1285;
        float _1555 = _1541 * _1549;
        float _1557 = -_502;
        float _1559 = _1557 + _1269;
        float _1561 = fma(_1553, _1555, _1029);
        float _1563 = fma(_1559, _1555, _502);
        float _1565 = fma(_1545, _1555, _898);
        _1475 = _1561;
        _1353 = _1563;
        _1515 = _1565;
        _1171 = as_type<int>(_1535);
    }
    float _1567 = _1475;
    float _1569 = _1353;
    float _1571 = _1515;
    int _1573 = _1171;
    float _1575 = _1319 * _1495;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1579 = _1573;
    if (!_1447)
    {
        int _1581 = _1397 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1583 = _1581 + _1371;
        _1453 = _1583;
    }
    int _1585 = _1453;
    float _1587 = _1319 * _1439;
    float _1589 = fma(_502, _1487, _1575);
    float _1591 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1593 = _1319 * _1389;
    int _1595 = as_type<int>(_1591);
    if (!_1447)
    {
        int _1597 = _1585 << 2;
        _1579 = _1597;
    }
    int _1599 = _1579;
    float _1601 = fma(_898, _1505, _1589);
    float _1603 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1591);
    float _1605 = fma(_502, _1381, _1593);
    float _1607 = fma(_502, _1431, _1587);
    int _1609 = _1599;
    if (!_1447)
    {
        uint _1611 = uint(int(uint(_1585) >> uint(2)));
        _1595 = int(_1611);
    }
    int _1613 = _1595;
    float _1615 = _1601 + _1513;
    if (!_1447)
    {
        int _1617 = 12 & _1599;
        _1609 = _1617;
    }
    int _1619 = _1609;
    int _1621 = _1365 + 80;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    uint _1625 = uint(int(uint(int(_1623)) >> uint(2)));
    int _1627 = int(_1623) & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    int _1631 = int(_1623) + 1;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    int _1635 = _1631 & 3;
    float _1637 = (*spvDescriptorSet0.vp_c15)._m0[int(_1633)][_1635];
    float _1639 = fma(_898, _1407, _1605);
    float _1641 = 1.0 / _1615;
    float _1643 = as_type<float>(_1619);
    if (!_1447)
    {
        int _1645 = _1613 << 4;
        int _1647 = _1645 + _1619;
        _1643 = as_type<float>(_1647);
    }
    float _1649 = _1643;
    float _1651 = fma(_898, _1465, _1607);
    float _1653 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1655 = _1639 + _1415;
    float _1657 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1659 = _1365 + 88;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    uint _1663 = uint(int(uint(int(_1661)) >> uint(2)));
    int _1665 = int(_1661) & 3;
    float _1667 = (*spvDescriptorSet0.vp_c15)._m0[int(_1663)][_1665];
    int _1669 = int(_1661) + 1;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    int _1673 = _1669 & 3;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
    float _1677 = _1651 + _1473;
    float _1679 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1681 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1653);
    float _1683 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1685 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1687 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1679);
    float _1689 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1681);
    float _1691 = _1649;
    if (!_1447)
    {
        int _1693 = as_type<int>(_1649) + 400;
        uint _1695 = uint(int(uint(_1693) >> uint(2)));
        uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
        int _1699 = int(_1695) & 3;
        float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
        _1691 = _1701;
    }
    float _1703 = _1691;
    float _1705 = -_1685;
    float _1707 = fma(_1705, _1683, 1.0);
    float _1709 = _1655 * _1641;
    float _1711 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1713 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1687);
    float _1715 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1717 = _1677 * _1641;
    bool _1719 = _1709 >= 0.0;
    float _1721 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1711);
    float _1723 = _1713 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1725 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1727 = _1709 <= 1.0;
    bool _1729 = _1727 && _1719;
    float _1731 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1721);
    float _1733 = _989;
    float _1735 = _1641;
    if (!_1447)
    {
        float _1737 = floor(_1351);
        _1733 = _1737;
    }
    float _1739 = _1733;
    float _1741 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1725);
    bool _1743 = _1717 >= 0.0;
    bool _1745 = _1743 && _1729;
    float _1747 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1749 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1751 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1741);
    bool _1753 = _1717 <= 1.0;
    bool _1755 = _1753 && _1745;
    float _1757 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1759 = log2(_1707);
    float _1761 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1751);
    float _1763 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1749);
    float _1765 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1757);
    float _1767 = 1.0 / _1761;
    float _1769 = _1739;
    if (!_1447)
    {
        float _1771 = -_1739;
        float _1773 = _1351 + _1771;
        _1769 = _1773;
    }
    float _1775 = _1769;
    float _1777 = _1319 * _1637;
    float _1779 = _1637;
    if (_1755)
    {
        float _1781 = float(_1363);
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1765);
    float _1787 = fma(_502, _1629, _1777);
    float _1789 = _924;
    if (!_1447)
    {
        float _1791 = floor(_1333);
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1763);
    float _1797 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1785);
    float _1799 = fma(_898, _1667, _1787);
    float _1801 = _1759 * 0.693147182464599609375;
    float _1803 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1795);
    float _1805 = _1799 + _1675;
    float _1807 = _1777;
    float _1809 = _1801;
    if (_1755)
    {
        float _1811 = rint(_1783);
        float _1813 = precise::max(_1811, 0.0);
        uint _1815 = uint(_1813);
        uint _1817 = clamp(_1815, 0u, 65535u);
        _1807 = as_type<float>(_1817);
    }
    float _1819 = _1807;
    float _1821 = _1797 * _1767;
    float _1823 = _1803 * _1767;
    float _1825 = _1805 * _1641;
    float _1827 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1829 = fma(_1821, 0.5, 0.5);
    float _1831 = fma(_1823, -0.5, 0.5);
    float _1833 = _1703;
    float _1835 = _1829;
    float _1837 = _1825;
    if (!_1447)
    {
        float _1839 = rint(_1703);
        float _1841 = precise::max(_1839, 0.0);
        uint _1843 = uint(_1841);
        uint _1845 = clamp(_1843, 0u, 65535u);
        _1833 = as_type<float>(_1845);
    }
    float _1847 = _1833;
    if (!_1447)
    {
        float _1849 = -_1793;
        float _1851 = _1333 + _1849;
        _1809 = _1851;
    }
    float _1853 = _1809;
    float _1855 = _1819;
    if (_1755)
    {
        float3 _5535 = float3(_1709, _1717, float(as_type<int>(_1819)));
        float3 _5539 = select(_5535, float3(0.0), isnan(_5535));
        float _1857 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5539.xy, uint(rint(_5539.z)), _1825, level(0.0));
        _1855 = _1857;
    }
    float _1859 = _1855;
    float3 _5549 = float3(_1829, _1831, _1827);
    float _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5549, float3(0.0), isnan(_5549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5549, float3(0.0), isnan(_5549)), level(0.0)).x;
    float3 _5558 = float3(_1829, _1831, _1827);
    float4 _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5558, float3(0.0), isnan(_5558)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5558, float3(0.0), isnan(_5558)), level(0.0)).xyzw;
    float _1866 = _1864.x;
    float _1868 = _1864.y;
    float _1870 = _1864.z;
    float _1872 = _1864.w;
    float _1874 = _1853;
    if (!_1447)
    {
        float3 _5581 = float3(_1853, _1775, float(as_type<int>(_1847)));
        float3 _5583 = select(_5581, float3(0.0), isnan(_5581));
        float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5583.xy, uint(rint(_5583.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5583.xy, uint(rint(_5583.z)), level(0.0)).x;
        _1874 = _1876;
    }
    float _1878 = _1874;
    if (_1447)
    {
        _1735 = 1.0;
    }
    float _1880 = _1735;
    float _1882 = _1880;
    if (!_1447)
    {
        int _1884 = _1585 << 4;
        int _1886 = _1884 + 2048;
        uint _1888 = uint(int(uint(_1886) >> uint(2)));
        uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
        int _1892 = int(_1888) & 3;
        float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
        int _1896 = int(_1888) + 1;
        uint _1898 = uint(int(uint(_1896) >> uint(2)));
        int _1900 = _1896 & 3;
        float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
        int _1904 = _1886 + 8;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        uint _1908 = uint(int(uint(int(_1906)) >> uint(2)));
        int _1910 = int(_1906) & 3;
        float _1912 = (*spvDescriptorSet0.vp_c15)._m0[int(_1908)][_1910];
        int _1914 = int(_1906) + 1;
        uint _1916 = uint(int(uint(_1914) >> uint(2)));
        int _1918 = _1914 & 3;
        float _1920 = (*spvDescriptorSet0.vp_c15)._m0[int(_1916)][_1918];
        float _1922 = _1319 * _1902;
        float _1924 = fma(_502, _1894, _1922);
        float _1926 = fma(_898, _1912, _1924);
        float _1928 = _1926 + _1920;
        float _1930 = precise::clamp(_1928, 0.0, 1.0);
        float _1932 = -_1930;
        float _1934 = _1932 + _1878;
        float _1936 = fma(_1934, 500.0, 1.5);
        float _1938 = exp2(_1936);
        float _1940 = 0.0 + _1938;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        _1835 = _1894;
        _1882 = _1942;
    }
    float _1944 = _1835;
    float _1946 = _1882;
    float _1948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1950 = _1567 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1954 = _1569 + _1952;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1958 = _1571 + _1956;
    float _1960 = _1950 * _1950;
    float _1962 = fma(_1954, _1954, _1960);
    float _1964 = fma(_1958, _1958, _1962);
    float _1966 = rsqrt(_1964);
    float _1968 = sqrt(_1964);
    float _1970 = _1954 * _1966;
    float _1972 = _1958 * _1966;
    float _1974 = _1950 * _1966;
    float _1976 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1978 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1980 = _1976 * _1976;
    float _1982 = _1978 * _1978;
    float _1984 = _1980 + _1982;
    float _1986 = sqrt(_1984);
    bool _1988 = _1986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1992 = _1986 + _1990;
    float _1994 = _1847;
    float _1996 = _1992;
    float _1998 = _1944;
    if (_1988)
    {
        float _2000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = _2002;
    if (_1988)
    {
        float _2006 = _1992 * _2002;
        _1996 = _2006;
    }
    float _2008 = _1996;
    if (_1988)
    {
        float _2010 = _2008 * 0.15915493667125701904296875;
        _1998 = _2010;
    }
    float _2012 = _1998;
    float _2014 = _502;
    float _2016 = _2012;
    if (_1988)
    {
        float _2018 = _2012 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2026 = precise::max(0.0, _2024);
    float _2028 = _1878;
    float _2030 = _2026;
    if (_1988)
    {
        float _2032 = _2012 * 6.283185482025146484375;
        float _2034 = cos(_2032);
        _2028 = _2034;
    }
    float _2036 = _2028;
    float _2038 = -_1974;
    float _2040 = -_2026;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2040);
    float _2044 = _2024;
    if (_1988)
    {
        float _2046 = rsqrt(_1984);
        _2044 = _2046;
    }
    float _2048 = _2044;
    if (_1988)
    {
        float _2050 = _2042 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2030 = _2050;
    }
    float _2052 = _2030;
    float _2054 = _2022;
    float _2056 = _2052;
    if (_1988)
    {
        float _2058 = fma(_2022, _2052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2004 = _2058;
    }
    float _2060 = _2004;
    float _2062 = _2060;
    if (!_1988)
    {
        _2054 = _1976;
    }
    float _2064 = _2054;
    float _2066 = _2064;
    float _2068 = _2036;
    if (_1988)
    {
        float _2070 = _2036 + (-1.0);
        _2056 = _2070;
    }
    float _2072 = _2056;
    float _2074 = _2072;
    if (_1988)
    {
        float _2076 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2016 = _2076;
    }
    float _2078 = _2016;
    if (!_1988)
    {
        _2074 = _1978;
    }
    float _2080 = _2074;
    float _2082 = _2048;
    float _2084 = _2080;
    if (_1988)
    {
        float _2086 = _2048 * _2060;
        _1015 = _2086;
    }
    float _2088 = _1015;
    if (!_1988)
    {
        _2082 = _2042;
    }
    float _2090 = _2082;
    float _2092 = _2090;
    if (_1988)
    {
        float _2094 = fma(_2042, _2036, _2078);
        _2092 = _2094;
    }
    float _2096 = _2092;
    if (!_1988)
    {
        _2062 = _1980;
    }
    float _2098 = _2062;
    float _2100 = _2098;
    if (_1988)
    {
        float _2102 = _1976 * _2088;
        _2066 = _2102;
    }
    float _2104 = _2066;
    if (_1988)
    {
        float _2106 = _1978 * _2088;
        _2084 = _2106;
    }
    float _2108 = _2084;
    if (!_1988)
    {
        _2068 = _1982;
    }
    float _2110 = _2068;
    float _2112 = _2110;
    if (_1988)
    {
        float _2114 = _2104 * _2104;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_1988)
    {
        float _2118 = _2108 * _2108;
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = fma(_2096, _2096, _2116);
    float _2124 = _2122 + _2120;
    float _2126 = rsqrt(_2124);
    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2130 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2128);
    float _2132 = precise::clamp(_2130, 0.0, 1.0);
    float _2134 = -_2132;
    float _2136 = _2134 + 1.0;
    float _2138 = _2126 * _2104;
    float _2140 = _2126 * _2096;
    float _2142 = _2126 * _2108;
    float _2144 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2146 = abs(_2136);
    float _2148 = log2(_2146);
    float _2150 = -_2144;
    float _2152 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = -_2142;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2158 = fma(_2156, -0.5, 0.5);
    float _2160 = fma(_2156, 0.5, 0.5);
    float _2162 = fma(_2160, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2164 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2166 = sqrt(_2158);
    float _2168 = fma(_2160, _2162, -0.212114393711090087890625);
    float _2170 = _2140 + 1.0;
    float _2172 = fma(_2160, _2168, 1.570728778839111328125);
    float _2174 = exp2(_2164);
    float _2176 = _2166 * 0.636619746685028076171875;
    float _2178 = -_2140;
    float _2180 = fma(_2174, _2170, _2178);
    float _2182 = -_2172;
    float _2184 = fma(_2176, _2182, 1.0);
    float _2186 = fma(_2180, 0.5, 0.5);
    float2 _6066 = float2(_2184, _2186);
    float3 _2190 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6066, float2(0.0), isnan(_6066)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6066, float2(0.0), isnan(_6066)), level(0.0)).xyz;
    float _2192 = _2190.x;
    float _2194 = _2190.y;
    float _2196 = _2190.z;
    float _2198 = abs(_1329);
    float _2200 = log2(_2198);
    float _2202 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2204 = -_1255;
    float _2206 = _2204 + 1.0;
    out.m_87.x = _1569;
    out.m_87.y = _1567;
    out.m_87.z = _1571;
    float _2208 = exp2(_2202);
    bool _2210 = _1329 <= 8000.0;
    bool _2212 = isnan(_1329);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan(8000.0);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2224 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2226 = fma(_1723, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2224);
    float _2228 = exp2(_2222);
    float _2230 = -_2208;
    float _2232 = _2230 + 1.0;
    float _2234 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2236 = precise::clamp(_2234, 0.0, 1.0);
    float _2238 = fma(_2236, -2.0, 3.0);
    float _2240 = _2236 * _2236;
    float _2242 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2226);
    float _2244 = _2240 * _2238;
    float _2246 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _2248 = -_2244;
    float _2250 = _2248 + 1.0;
    out.gl_Position.x = _1797;
    out.gl_Position.y = _1803;
    out.gl_Position.z = _2246;
    out.gl_Position.w = _1761;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2244);
    float _2254 = _2246 + _1761;
    float _2256 = _2220 * _2252;
    float _2258 = _2220;
    float _2260 = _2246;
    float _2262 = _1797;
    if (!_1755)
    {
        _2258 = 1.0;
    }
    float _2264 = _2258;
    float _2266 = _2254 * 0.5;
    float _2268 = _2264;
    if (_1755)
    {
        bool _2270 = _1859 >= _1825;
        bool _2272 = isnan(_1859);
        bool _2274 = _2270 || _2272;
        bool _2276 = isnan(_1825);
        bool _2278 = _2274 || _2276;
        float _2280 = float(_2278);
        _2268 = _2280;
    }
    float _2282 = _2268;
    float _2284 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2286 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2288 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2290 = isnan(_1968);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2296 = _2292 || _2294;
    out.m_89.z = _2266;
    out.m_89.w = _1761;
    float _2298 = _2206 * _2284;
    float _2300 = precise::clamp(_2298, 0.0, 1.0);
    float _2302 = _2286 * _1861;
    float _2304 = _2282 * _1946;
    float _2306 = -_2286;
    float _2308 = _2306 + 1.0;
    float _2310 = -_2300;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2314 = _1872 * _2302;
    float _2316 = _1872 * _2308;
    float _2318 = -_2304;
    float _2320 = fma(_2318, _2312, 1.0);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = _2304;
    float _2326 = _2300;
    float _2328 = _2322;
    if (!_2296)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2330 = _2260;
    float _2332 = _2322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2334 = _2330;
    float _2336 = _2330;
    if (!_2296)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2338 = _2262;
    float _2340 = _2338;
    float _2342 = _2338;
    if (!_2296)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2344 = _2324;
    out.m_91.x = _2332;
    float _2346 = _2344;
    float _2348 = _2344;
    if (!_2296)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2350 = _1837;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2296)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2356 = _2326;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2296)
    {
        _2328 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2362 = _2328;
    float _2364 = _2196 * _2302;
    float _2366 = fma(_2192, _2314, _1866);
    float _2368 = fma(_2194, _2314, _1868);
    float _2370 = fma(_1872, _2364, _1870);
    out.m_93.x = _2366;
    out.m_93.y = _2368;
    out.m_93.z = _2370;
    out.m_93.w = _2316;
    bool _2372 = !_2296;
    float _2374 = _2362;
    float _2376 = _2362;
    if (!_2372)
    {
        bool _2378 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2380 = isnan(_1968);
        bool _2382 = _2378 || _2380;
        bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2386 = _2382 || _2384;
        if (!_2386)
        {
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2390 = _1968 + _2388;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2394 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2392;
            float _2396 = 1.0 / _2394;
            float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2400 = _2398 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2410 = _2390 * _2396;
            float _2412 = precise::clamp(_2410, 0.0, 1.0);
            float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2426 = fma(_2412, _2408, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2428 = fma(_2412, _2416, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2430 = fma(_2412, _2420, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2432 = fma(_2412, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2434 = fma(_2412, _2400, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2436 = fma(_2412, _2404, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _2342 = _2430;
            _2360 = _2436;
            _2336 = _2428;
            _2354 = _2434;
            _2348 = _2432;
            _2376 = _2426;
            _2438 = true;
        }
        else
        {
            bool _2440 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2442 = isnan(_1968);
            bool _2444 = _2440 || _2442;
            bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2448 = _2444 || _2446;
            if (!_2448)
            {
                _2334 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2450 = _2334;
            _2336 = _2450;
            if (!_2448)
            {
                _2340 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2452 = _2340;
            _2342 = _2452;
            if (!_2448)
            {
                _2346 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2454 = _2346;
            _2348 = _2454;
            if (!_2448)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2456 = _2352;
            _2354 = _2456;
            if (!_2448)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2458 = _2358;
            _2360 = _2458;
            if (!_2448)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2460 = _2374;
            bool _2462 = !_2448;
            _2376 = _2460;
            if (!_2462)
            {
                bool _2464 = _1968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2466 = isnan(_1968);
                bool _2468 = _2464 || _2466;
                bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2472 = _2468 || _2470;
                if (!_2472)
                {
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2476 = _1968 + _2474;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2478;
                    float _2482 = 1.0 / _2480;
                    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2496 = _2476 * _2482;
                    float _2498 = precise::clamp(_2496, 0.0, 1.0);
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2512 = fma(_2498, _2494, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2514 = fma(_2498, _2502, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2516 = fma(_2498, _2506, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2518 = fma(_2498, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2520 = fma(_2498, _2486, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2522 = fma(_2498, _2490, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _2342 = _2516;
                    _2360 = _2522;
                    _2336 = _2514;
                    _2354 = _2520;
                    _2348 = _2518;
                    _2376 = _2512;
                    _2438 = true;
                }
                else
                {
                    _2342 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2336 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2348 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2438 = false;
    float _2524 = _2342;
    float _2526 = _2360;
    float _2528 = _2336;
    float _2530 = _2354;
    float _2532 = _2348;
    float _2534 = _2376;
    float _2536 = fma(_1149, -0.5, 0.5);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -_2524;
    float _2542 = _2540 + _2526;
    float _2544 = -_2528;
    float _2546 = _2544 + _2530;
    float _2548 = -_2532;
    float _2550 = _2548 + _2534;
    bool _2552 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = fma(_2538, _2542, _2524);
    float _2556 = fma(_2538, _2546, _2528);
    float _2558 = fma(_2538, _2550, _2532);
    float _2560 = _2554 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2562 = fma(_2556, 0.298911988735198974609375, _2560);
    float _2564 = fma(_2558, 0.114477999508380889892578125, _2562);
    out.m_97.x = 0.0;
    float _2566 = -_2564;
    float _2568 = _2556 + _2566;
    float _2570 = -_2564;
    float _2572 = _2554 + _2570;
    float _2574 = -_2564;
    float _2576 = _2558 + _2574;
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2584 = fma(_2576, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    out.m_61.x = _2578;
    out.m_99.x = _2580;
    out.m_99.y = _2582;
    out.m_99.z = _2584;
    if (!_2552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2586 = -_1567;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2590 = -_1569;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2594 = -_1571;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2598 = _2588 * _2588;
    float _2600 = fma(_2592, _2592, _2598);
    float _2602 = fma(_2596, _2596, _2600);
    float _2604 = rsqrt(_2602);
    float _2606 = sqrt(_2602);
    float _2608 = _2588 * _2604;
    float _2610 = _2592 * _2604;
    float _2612 = _2596 * _2604;
    float _2614 = -_1974;
    float _2616 = _2614 + _2608;
    float _2618 = -_1970;
    float _2620 = _2618 + _2610;
    float _2622 = -_1972;
    float _2624 = _2622 + _2612;
    float _2626 = _2616 * _2616;
    float _2628 = -_2606;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2632 = fma(_2620, _2620, _2626);
    float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = fma(_2624, _2624, _2632);
    float _2640 = abs(_2636);
    float _2642 = log2(_2640);
    float _2644 = rsqrt(_2638);
    float _2646 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2648 = exp2(_2646);
    float _2650 = _2616 * _2644;
    float _2652 = _2620 * _2644;
    float _2654 = _2624 * _2644;
    float _2656 = _1149 * _2650;
    float _2658 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    float _2662 = _1149 * _2608;
    float _2664 = fma(_1145, _2652, _2656);
    float _2666 = _2660 * _2660;
    float _2668 = fma(_1145, _2610, _2662);
    float _2670 = fma(_1159, _2654, _2664);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = _2666 + (-1.0);
    float _2676 = fma(_1159, _2612, _2668);
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = _2672 * _2672;
    float _2682 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2684 = fma(_2680, _2674, 1.0);
    float _2686 = -_2608;
    float _2688 = -_2682;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2688);
    float _2692 = _2684 * _2684;
    float _2694 = -_2612;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2690);
    float _2698 = 1.0 / _2692;
    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2702 = _2696 + _2700;
    float _2704 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2706 = precise::clamp(_2704, 0.0, 1.0);
    float _2708 = _2648 * _2706;
    float _2710 = _2678 * _2708;
    float _2712 = _2666 * _2698;
    float _2714 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2716 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2720 = _2710 * _2712;
    float _2722 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2724 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2726 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2714;
    out.m_95.y = _2716;
    out.m_95.z = _2718;
    out.m_97.x = _2722;
    out.m_97.y = _2724;
    out.m_97.z = _2726;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

