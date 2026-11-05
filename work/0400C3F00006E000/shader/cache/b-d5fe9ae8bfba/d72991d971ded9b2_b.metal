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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_91 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_109 [[user(locn3)]];
    float4 m_101 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_107 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_105 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_69 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
    float4 m_77 [[attribute(11)]];
    float4 m_83 [[attribute(12)]];
    float4 m_79 [[attribute(13)]];
    float4 m_73 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2494 = false;
    bool _344 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_56.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_59.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_144);
        out.gl_Position.z = _2778;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = 0.0;
    if (_156)
    {
        float _164 = float(_128);
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    if (_172)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _138;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    int _176 = 0;
    if (_172)
    {
        float _178 = _174 * 5.0;
        _176 = as_type<int>(_178);
    }
    int _180 = _176;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_180);
        out.gl_Position.z = _2846;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_63.y;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_63.z;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _182 * _182;
    float _198 = in.m_63.x;
    float _200 = _186 * _186;
    float _202 = in.m_65.x;
    float _204 = fma(_188, _188, _196);
    float _206 = in.m_67.x;
    float _208 = fma(_190, _190, _200);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _208);
    float _214 = sqrt(_210);
    float _216 = in.m_69.x;
    float _218 = in.m_69.y;
    float _220 = in.m_69.z;
    float _222 = sqrt(_212);
    bool _224 = _214 > 0.0;
    bool _226 = _222 > 0.0;
    float _228 = _182 * _218;
    float _230 = _188 * _218;
    float _232 = _192 * _218;
    float _234 = 0.0;
    float _236 = _212;
    float _238 = _214;
    if (_224)
    {
        float _240 = rsqrt(_210);
        _234 = _240;
    }
    float _242 = _234;
    float _244 = fma(_216, _198, _228);
    float _246 = fma(_216, _202, _230);
    float _248 = fma(_216, _206, _232);
    float _250 = 0.0;
    float _252 = _244;
    float _254 = _246;
    if (!_224)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = fma(_186, _220, _244);
    float _260 = fma(_190, _220, _246);
    float _262 = 0.0;
    float _264 = _256;
    if (!_224)
    {
        _252 = 0.0;
        _262 = 0.0;
    }
    float _266 = _252;
    float _268 = _262;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_226)
    {
        float _276 = rsqrt(_212);
        _270 = _276;
    }
    float _278 = _270;
    if (!_226)
    {
        _254 = 0.0;
    }
    float _280 = _254;
    float _282 = fma(_194, _220, _248);
    float _284 = _280;
    if (_224)
    {
        float _286 = _242 * _188;
        _264 = _286;
    }
    float _288 = _264;
    float _290 = _288;
    if (!_226)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _292 = _236;
    float _294 = _238;
    float _296 = _294;
    float _298 = _292;
    if (_224)
    {
        float _300 = _242 * _182;
        _272 = _300;
    }
    float _302 = _272;
    float _304 = _302;
    if (_224)
    {
        float _306 = _242 * _192;
        _274 = _306;
    }
    float _308 = _274;
    float _310 = _308;
    if (_226)
    {
        float _312 = _278 * _190;
        _284 = _312;
    }
    float _314 = _284;
    if (_226)
    {
        float _316 = _278 * _186;
        _296 = _316;
    }
    float _318 = _296;
    if (_226)
    {
        float _320 = _278 * _194;
        _298 = _320;
    }
    float _322 = _298;
    bool _324 = !_184;
    float _342;
    if (!_324)
    {
        float _326 = in.m_71.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_128);
        float _348 = 1.0 / _346;
        float _350 = _160 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_56.x;
    float _356 = in.m_56.y;
    float _358 = in.m_56.z;
    float _360 = in.m_65.w;
    float _362 = in.m_67.w;
    float _364 = _188 * _356;
    float _366 = _192 * _356;
    float _368 = fma(_202, _354, _364);
    float _370 = fma(_206, _354, _366);
    float _372 = fma(_190, _358, _368);
    float _374 = fma(_194, _358, _370);
    float _376 = _372 + _360;
    float _378 = _374 + _362;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _382 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _384 = floor(_380);
    float _386 = floor(_382);
    float _388 = -_384;
    float _390 = _380 + _388;
    float _392 = -_386;
    float _394 = _382 + _392;
    float2 _3151 = float2(_390, _394);
    float _396 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3151, float2(0.0), isnan(_3151)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3151, float2(0.0), isnan(_3151)), level(0.0)).x;
    float _398 = _182 * _356;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _352 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = fma(_198, _354, _398);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _416 = _352 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _418;
    float _422 = 1.0 / _406;
    float _424 = fma(_186, _358, _412);
    float _426 = in.m_63.w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = _160 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = 1.0 / _410;
    float _444 = _436 * 0.15915493667125701904296875;
    float _446 = in.m_73.y;
    float _448 = in.m_73.z;
    float _450 = _416 * _422;
    float _452 = 1.0 / _420;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _456 = _352 + _454;
    float _458 = _402 * _442;
    float _460 = in.m_75.x;
    float _462 = in.m_75.y;
    float _464 = in.m_75.z;
    float _466 = fma(_430, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = fma(_440, _458, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = _424 + _426;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = _456 * _452;
    float _482 = fma(_474, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _484 = _258 * _258;
    float _486 = fma(_434, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_478, _458, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_260, _260, _484);
    bool _496 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _498 = isnan(_352);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_490, _458, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _510 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_352);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _444 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = fma(_282, _282, _494);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _532;
    float _536 = -_506;
    float _538 = _536 + 1.0;
    float _540 = fma(_530, _480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _542 = _460 > 0.0;
    float _544 = _444 * 6.283185482025146484375;
    float _546 = sin(_544);
    bool _548 = _460 >= 0.0;
    bool _550 = isnan(_460);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = _520 * _538;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _560;
    float _564 = fma(_534, _480, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _566 = _556 ? 0 : 1;
    float _568 = fma(_562, _480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _570 = rsqrt(_526);
    int _572 = ~_566;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    bool _578 = _524 >= 0.0;
    bool _580 = isnan(_524);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    int _588 = _576;
    if (!_542)
    {
        int _590 = ~_566;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    bool _596 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_352);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _546 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _610 = -_520;
    float _612 = _610 + 1.0;
    bool _614 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _616 = isnan(_352);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    bool _626 = _524 > 0.0;
    float _628 = _606 * _612;
    float _630 = -_606;
    float _632 = _630 + 1.0;
    float _634 = _470 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _636 = float(_594);
    float _638 = _260 * _570;
    float _640 = _624 * _632;
    float _642 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[11].x, _634);
    float _644 = _258 * _570;
    float _646 = _282 * _570;
    float _648 = _466 * _640;
    float _650 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].z, _642);
    float _652 = -_624;
    float _654 = _652 + 1.0;
    float _656 = _482 * _640;
    int _658 = _586 ? 0 : 1;
    float _660 = _608 * _636;
    float _662 = _650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _664 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].x, _648);
    int _666 = ~_658;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = _660 * _446;
    int _674 = _670;
    if (!_626)
    {
        int _676 = ~_658;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    float _682 = fma(_468, _628, _664);
    float _684 = _470 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _686 = _524 * _524;
    float _688 = float(_680);
    float _690 = 1.0 / _662;
    float _692 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    float _694 = _486 * _640;
    float _696 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].y, _656);
    float _698 = _686 * _688;
    float _700 = _644 * _302;
    float _702 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].z, _692);
    float _704 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].z, _694);
    float _706 = fma(_492, _628, _696);
    float _708 = fma(_638, _288, _700);
    float _710 = _702 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _712 = fma(_508, _628, _704);
    float _714 = in.m_77.x;
    float _716 = in.m_77.y;
    float _718 = in.m_77.z;
    float _720 = fma(_646, _308, _708);
    float _722 = _710 + _662;
    float _724 = fma(_568, _558, _682);
    float _726 = fma(_540, _558, _706);
    float _728 = fma(_564, _558, _712);
    float _730 = _722 * _690;
    float _732 = _730 * 0.5;
    float _734 = abs(_720);
    bool _736 = _734 > 0.99989998340606689453125;
    float _738 = _698 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _740 = _672 * 0.01745329238474369049072265625;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[30].w, _742);
    float _746 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].y, _726);
    float _748 = _738 * _448;
    float _750 = _740 * 0.15915493667125701904296875;
    float _752 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].x, _724);
    float _754 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].z, _728);
    float _756 = 1.0 / _744;
    float _758 = _748 * (-0.01745329238474369049072265625);
    float _760 = in.m_71.x;
    if (_736)
    {
        float _762 = fma(_314, 0.001000000047497451305389404296875, _288);
        _290 = _762;
    }
    float _764 = _290;
    float _766 = _758 * 0.15915493667125701904296875;
    if (_736)
    {
        float _768 = fma(_322, 0.001000000047497451305389404296875, _308);
        _310 = _768;
    }
    float _770 = _310;
    float _772 = _746 * _716;
    float _774 = -_764;
    float _776 = _646 * _774;
    float _778 = _766 * 6.283185482025146484375;
    float _780 = sin(_778);
    if (_736)
    {
        float _782 = fma(_318, 0.001000000047497451305389404296875, _302);
        _304 = _782;
    }
    float _784 = _304;
    float _786 = -_770;
    float _788 = _644 * _786;
    float _790 = -_770;
    float _792 = -_776;
    float _794 = fma(_638, _790, _792);
    float _796 = _752 * _714;
    float _798 = _754 * _718;
    float _800 = -_784;
    float _802 = _638 * _800;
    float _804 = -_784;
    float _806 = -_788;
    float _808 = fma(_646, _804, _806);
    float _810 = _766 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _816 = _756 * _814;
    float _818 = _794 * _794;
    float _820 = -_764;
    float _822 = -_802;
    float _824 = fma(_644, _820, _822);
    float _826 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _828 = fma(_808, _808, _818);
    bool _830 = _816 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _832 = _750 * 6.283185482025146484375;
    float _834 = sin(_832);
    bool _836 = _816 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _838 = fma(_824, _824, _828);
    float _840 = _780 * _464;
    float _842 = _470 + _826;
    float _844 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _848 = _750 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _812 * _464;
    float _854 = -_840;
    float _856 = fma(_812, _462, _854);
    float _858 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _860 = 2;
    if (!_830)
    {
        _860 = 1;
    }
    int _862 = _860;
    float _864 = fma(_780, _462, _852);
    bool _866 = !_830;
    int _868 = _866 ? 0 : 1;
    float _870 = _834 * _460;
    float _872 = rsqrt(_838);
    int _874 = _862;
    if (!_836)
    {
        _874 = _868;
    }
    int _876 = _874;
    int _878 = _876 << 6;
    float _880 = _850 * _460;
    float _882 = -_870;
    float _884 = fma(_864, _850, _882);
    int _886 = _878 + 96;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    bool _905 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _913 = _909 || _911;
    float _915 = fma(_864, _834, _880);
    float _917 = _842 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _919 = _842 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _915);
    float _923 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[126].x, _917);
    float _925 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[127].x, _919);
    float _927 = _808 * _872;
    float _929 = _846 * _921;
    float _931 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[126].z, _923);
    float _933 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[127].z, _925);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _856);
    float _937 = _824 * _872;
    float _939 = _931 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _943 = _844 * _935;
    float _945 = _794 * _872;
    float _947 = trunc(_939);
    int _949 = int(_947);
    int _951 = _878 + 104;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.vp_c15)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.vp_c15)._m0[int(_963)][_965];
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _971 = _644 * _937;
    float _973 = _943 * _638;
    float _975 = _943 * _646;
    float _977 = _858 * _969;
    float _979 = -_971;
    float _981 = fma(_646, _945, _979);
    float _983 = trunc(_941);
    int _985 = int(_983);
    int _987 = _878 + 48;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    float _1005 = fma(_929, _927, _973);
    float _1007 = _638 * _945;
    float _1009 = fma(_929, _937, _975);
    float _1011 = _943 * _644;
    float _1013 = fma(_977, _981, _1005);
    float _1015 = -_1007;
    float _1017 = fma(_644, _927, _1015);
    int _1019 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1021 = _949 + _1019;
    int _1023 = _1021 + 1;
    int _1025 = _878 + 64;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    uint _1029 = uint(int(uint(int(_1027)) >> uint(2)));
    int _1031 = int(_1027) & 3;
    float _1033 = (*spvDescriptorSet0.vp_c15)._m0[int(_1029)][_1031];
    int _1035 = int(_1027) + 1;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    int _1039 = _1035 & 3;
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[int(_1037)][_1039];
    float _1043 = _376 + _1013;
    float _1045 = fma(_977, _1017, _1009);
    bool _1047 = _1023 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1049 = _646 * _927;
    float _1051 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1043);
    float _1053 = _378 + _1045;
    int _1055 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1057 = _985 + _1055;
    int _1059 = _1057 + 1;
    int _1061 = _878 + 56;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c15)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    float _1079 = fma(_760, 100.0, _1051);
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1083 = _1053 + _1081;
    int _1085 = _1023 | _1059;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1089 = _1043 + _1087;
    float _1091 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1053);
    float _1093 = _1083 * _1083;
    bool _1095 = _1085 < 0;
    bool _1097 = _1095 || _1047;
    int _1099 = _878 + 72;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    uint _1103 = uint(int(uint(int(_1101)) >> uint(2)));
    int _1105 = int(_1101) & 3;
    float _1107 = (*spvDescriptorSet0.vp_c15)._m0[int(_1103)][_1105];
    int _1109 = int(_1101) + 1;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    int _1113 = _1109 & 3;
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[int(_1111)][_1113];
    float _1117 = _1079 * 2.0;
    float _1119 = fma(_1089, _1089, _1093);
    float _1121 = fma(_760, 100.0, _1091);
    float _1123 = _842 * _903;
    float _1125 = _1117 * 0.15915493667125701904296875;
    float _1127 = sqrt(_1119);
    float _1129 = _1121 * 2.0;
    int _1131 = _878 + 80;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
    int _1137 = int(_1133) & 3;
    float _1139 = (*spvDescriptorSet0.vp_c15)._m0[int(_1135)][_1137];
    int _1141 = int(_1133) + 1;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    int _1145 = _1141 & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    bool _1149 = _1059 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1151 = _1149 || _1097;
    float _1153 = fma(_376, _895, _1123);
    float _1155 = _1129 * 0.15915493667125701904296875;
    float _1157 = fma(_929, _945, _1011);
    float _1159 = -_1049;
    float _1161 = fma(_638, _937, _1159);
    float _1163 = _1125 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = fma(_378, _959, _1153);
    float _1169 = fma(_977, _1161, _1157);
    float _1171 = _1167 + _967;
    float _1173 = _470 + _1169;
    float _1175 = _1155 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    bool _1179 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1181 = _1023;
    int _1183 = as_type<int>(_1153);
    int _1185 = as_type<int>(_967);
    float _1187 = _1167;
    float _1189 = _1053;
    float _1191 = _1083;
    float _1193 = as_type<float>(_876);
    float _1195 = _760;
    if (!_1151)
    {
        int _1197 = _1059 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1199 = _1197 + _1023;
        _1181 = _1199;
    }
    int _1201 = _1181;
    float _1203 = _842 * _1003;
    float _1205 = fma(_376, _995, _1203);
    float _1207 = _1157;
    if (!_1151)
    {
        float _1209 = floor(_939);
        _1207 = _1209;
    }
    float _1211 = _1207;
    if (!_1151)
    {
        int _1213 = _1201 << 2;
        _1183 = _1213;
    }
    int _1215 = _1183;
    float _1217 = _842 * _1041;
    float _1219 = fma(_1165, 0.100000001490116119384765625, _1173);
    if (!_1151)
    {
        int _1221 = 12 & _1215;
        _1185 = _1221;
    }
    int _1223 = _1185;
    float _1225 = fma(_376, _1033, _1217);
    float _1227 = as_type<float>(_1223);
    float _1229 = _1225;
    if (!_1179)
    {
        _1187 = _1043;
    }
    float _1231 = _1187;
    float _1233 = 1.0 / _1171;
    float _1235 = fma(_1177, 0.100000001490116119384765625, _1219);
    float _1237 = fma(_378, _1069, _1205);
    int _1239 = as_type<int>(_1069);
    float _1241 = _1231;
    if (!_1151)
    {
        uint _1243 = uint(int(uint(_1201) >> uint(2)));
        _1239 = int(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1237 + _1077;
    int _1249 = _1245;
    if (!_1151)
    {
        int _1251 = _1245 << 4;
        int _1253 = _1251 + _1223;
        _1249 = _1253;
    }
    int _1255 = _1249;
    if (!_1179)
    {
        _1227 = _1235;
    }
    float _1257 = _1227;
    float _1259 = fma(_378, _1107, _1225);
    float _1261 = _1259 + _1115;
    bool _1263 = !_1179;
    float _1265 = _1257;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1127 + _1269;
        float _1273 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1119);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        float _1289 = _1283 + (-1.0);
        float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = fma(_1287, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1295 = fma(_1235, _1283, _1291);
        float _1297 = _1275 * _1293;
        float _1299 = fma(_1089, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1301 = fma(_1083, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1189 = _1301;
        _1241 = _1299;
        _1265 = _1295;
    }
    float _1303 = _1189;
    float _1305 = _1241;
    float _1307 = _1265;
    float _1309 = _1307;
    float _1311 = _1305;
    if (_913)
    {
        _1191 = _1303;
    }
    float _1313 = _1191;
    float _1315 = _1313;
    if (!_913)
    {
        float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1319 = _470 + _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1323 = _376 + _1321;
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = -_376;
        float _1329 = _1327 + _1305;
        float _1331 = _1319 * _1319;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _378 + _1333;
        float _1337 = -_378;
        float _1339 = _1337 + _1303;
        float _1341 = fma(_1323, _1323, _1331);
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1345 = fma(_1335, _1335, _1341);
        float _1347 = sqrt(_1345);
        float _1349 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1351 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1353 = _1351 * _1343;
        float _1355 = -_470;
        float _1357 = _1355 + _1307;
        float _1359 = _1349 * _1353;
        float _1361 = fma(_1357, _1359, _470);
        float _1363 = fma(_1329, _1359, _376);
        float _1365 = fma(_1339, _1359, _378);
        _1309 = _1361;
        _1311 = _1363;
        _1315 = _1365;
        _1229 = _1353;
    }
    float _1367 = _1309;
    float _1369 = _1311;
    float _1371 = _1315;
    float _1373 = _1229;
    int _1375 = _878 + 88;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    float _1393 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1395 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1397 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1399 = _1247 * _1233;
    float _1401 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1393);
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1395);
    float _1405 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1397);
    float _1407 = _470;
    if (!_1151)
    {
        int _1409 = _1255 + 400;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
        int _1415 = int(_1411) & 3;
        float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1401);
    bool _1423 = _1399 >= 0.0;
    float _1425 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1427 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1429 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1431 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1433 = _1261 * _1233;
    bool _1435 = _1399 <= 1.0;
    bool _1437 = _1435 && _1423;
    float _1439 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1443 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1429);
    float _1445 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1447 = _1433 >= 0.0;
    bool _1449 = _1447 && _1437;
    float _1451 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1455 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1445);
    bool _1459 = _1433 <= 1.0;
    bool _1461 = _1459 && _1449;
    float _1463 = -_1453;
    float _1465 = fma(_1463, _1451, 1.0);
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1471 = _842 * _1147;
    float _1473 = _1373;
    if (!_1151)
    {
        float _1475 = floor(_941);
        _1473 = _1475;
    }
    float _1477 = _1473;
    float _1479 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1483 = fma(_376, _1139, _1471);
    float _1485 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1489 = log2(_1465);
    float _1491 = _1481;
    if (_1461)
    {
        float _1493 = float(_876);
        _1193 = _1493;
    }
    float _1495 = _1193;
    float _1497 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1499 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1487);
    float _1501 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1503 = 1.0 / _1481;
    float _1505 = fma(_378, _1383, _1483);
    float _1507 = _1477;
    if (!_1151)
    {
        float _1509 = -_1477;
        float _1511 = _941 + _1509;
        _1507 = _1511;
    }
    float _1513 = _1507;
    float _1515 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1517 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1519 = _1505 + _1391;
    float _1521 = _1471;
    float _1523 = _1513;
    float _1525 = _1517;
    if (_1461)
    {
        float _1527 = rint(_1495);
        float _1529 = precise::max(_1527, 0.0);
        uint _1531 = uint(_1529);
        uint _1533 = clamp(_1531, 0u, 65535u);
        _1521 = as_type<float>(_1533);
    }
    float _1535 = _1521;
    float _1537 = _1519 * _1233;
    float _1539 = _1489 * 0.693147182464599609375;
    float _1541 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1543 = _1519;
    if (!_1151)
    {
        float _1545 = rint(_1419);
        float _1547 = precise::max(_1545, 0.0);
        uint _1549 = uint(_1547);
        uint _1551 = clamp(_1549, 0u, 65535u);
        _1543 = as_type<float>(_1551);
    }
    float _1553 = _1543;
    float _1555 = _1515 * _1503;
    float _1557 = _1517 * _1503;
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = fma(_1557, -0.5, 0.5);
    float _1563 = _1555;
    float _1565 = _1559;
    if (!_1151)
    {
        float _1567 = -_1211;
        float _1569 = _939 + _1567;
        _1563 = _1569;
    }
    float _1571 = _1563;
    float _1573 = _1177;
    if (_1461)
    {
        float3 _5052 = float3(_1399, _1433, float(as_type<int>(_1535)));
        float3 _5056 = select(_5052, float3(0.0), isnan(_5052));
        float _1575 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5056.xy, uint(rint(_5056.z)), _1537, level(0.0));
        _1573 = _1575;
    }
    float _1577 = _1573;
    float3 _5066 = float3(_1559, _1561, _1541);
    float _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5066, float3(0.0), isnan(_5066)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5066, float3(0.0), isnan(_5066)), level(0.0)).x;
    float3 _5075 = float3(_1559, _1561, _1541);
    float4 _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5075, float3(0.0), isnan(_5075)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5075, float3(0.0), isnan(_5075)), level(0.0)).xyzw;
    float _1584 = _1582.x;
    float _1586 = _1582.y;
    float _1588 = _1582.z;
    float _1590 = _1582.w;
    float _1592 = _1495;
    if (!_1151)
    {
        float3 _5098 = float3(_1571, _1513, float(as_type<int>(_1553)));
        float3 _5100 = select(_5098, float3(0.0), isnan(_5098));
        float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5100.xy, uint(rint(_5100.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5100.xy, uint(rint(_5100.z)), level(0.0)).x;
        _1592 = _1594;
    }
    float _1596 = _1592;
    float _1598 = 0.0;
    if (_1151)
    {
        _1598 = 1.0;
    }
    float _1600 = _1598;
    float _1602 = _1600;
    if (!_1151)
    {
        int _1604 = _1201 << 4;
        int _1606 = _1604 + 2048;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
        int _1612 = int(_1608) & 3;
        float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
        int _1616 = int(_1608) + 1;
        uint _1618 = uint(int(uint(_1616) >> uint(2)));
        int _1620 = _1616 & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        int _1624 = _1606 + 8;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
        int _1630 = int(_1626) & 3;
        float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
        int _1634 = int(_1626) + 1;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        int _1638 = _1634 & 3;
        float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
        float _1642 = _842 * _1622;
        float _1644 = fma(_376, _1614, _1642);
        float _1646 = fma(_378, _1632, _1644);
        float _1648 = _1646 + _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        float _1652 = -_1650;
        float _1654 = _1652 + _1596;
        float _1656 = fma(_1654, 500.0, 1.5);
        float _1658 = exp2(_1656);
        float _1660 = 0.0 + _1658;
        float _1662 = precise::clamp(_1660, 0.0, 1.0);
        _1602 = _1662;
    }
    float _1664 = _1602;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1668 = _1367 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1672 = _1369 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1676 = _1371 + _1674;
    float _1678 = _1668 * _1668;
    float _1680 = fma(_1672, _1672, _1678);
    float _1682 = fma(_1676, _1676, _1680);
    float _1684 = rsqrt(_1682);
    float _1686 = sqrt(_1682);
    float _1688 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1690 = _1672 * _1688;
    float _1692 = _1676 * _1688;
    float _1694 = _1690 * _1690;
    float _1696 = _1692 * _1692;
    float _1698 = _1694 + _1696;
    float _1700 = sqrt(_1698);
    bool _1702 = _1700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1706 = _1700 + _1704;
    float _1708 = _1680;
    float _1710 = _1684;
    float _1712 = _1706;
    float _1714 = _1668;
    if (_1702)
    {
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1716;
    }
    float _1718 = _1708;
    if (_1702)
    {
        float _1720 = rsqrt(_1698);
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = _1722;
    if (_1702)
    {
        float _1726 = _1706 * _1718;
        _1712 = _1726;
    }
    float _1728 = _1712;
    if (_1702)
    {
        float _1730 = _1728 * 0.15915493667125701904296875;
        _1565 = _1730;
    }
    float _1732 = _1565;
    float _1734 = _1676;
    float _1736 = _1732;
    if (_1702)
    {
        float _1738 = _1732 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1734 = _1740;
    }
    float _1742 = _1734;
    float _1744 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1746 = precise::max(0.0, _1744);
    float _1748 = _1718;
    float _1750 = _1746;
    if (_1702)
    {
        float _1752 = _1732 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = -_1688;
    float _1760 = -_1746;
    float _1762 = fma(_1668, _1758, _1760);
    if (_1702)
    {
        float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1714 = _1764;
    }
    float _1766 = _1714;
    float _1768 = _1766;
    float _1770 = _1742;
    if (_1702)
    {
        float _1772 = fma(_1742, _1766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = _1774;
    if (!_1702)
    {
        _1770 = _1690;
    }
    float _1778 = _1770;
    float _1780 = _1778;
    float _1782 = _1756;
    if (_1702)
    {
        float _1784 = _1756 + (-1.0);
        _1750 = _1784;
    }
    float _1786 = _1750;
    float _1788 = _1786;
    if (_1702)
    {
        float _1790 = _1722 * _1774;
        _1523 = _1790;
    }
    float _1792 = _1523;
    int _1794 = as_type<int>(_1792);
    if (!_1702)
    {
        _1776 = _1762;
    }
    float _1796 = _1776;
    float _1798 = _1796;
    if (_1702)
    {
        float _1800 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1800;
    }
    float _1802 = _1736;
    if (_1702)
    {
        float _1804 = _1690 * _1792;
        _1780 = _1804;
    }
    float _1806 = _1780;
    if (!_1702)
    {
        _1788 = _1692;
    }
    float _1808 = _1788;
    float _1810 = _1808;
    if (_1702)
    {
        float _1812 = _1692 * _1792;
        _1810 = _1812;
    }
    float _1814 = _1810;
    if (!_1702)
    {
        _1724 = _1694;
    }
    float _1816 = _1724;
    float _1818 = _1816;
    if (_1702)
    {
        float _1820 = fma(_1762, _1756, _1802);
        _1798 = _1820;
    }
    float _1822 = _1798;
    if (_1702)
    {
        float _1824 = _1806 * _1806;
        _1818 = _1824;
    }
    float _1826 = _1818;
    if (!_1702)
    {
        _1782 = _1696;
    }
    float _1828 = _1782;
    float _1830 = _1828;
    if (_1702)
    {
        float _1832 = _1814 * _1814;
        _1830 = _1832;
    }
    float _1834 = _1830;
    float _1836 = fma(_1822, _1822, _1826);
    float _1838 = _1836 + _1834;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = rsqrt(_1838);
    float _1848 = -_1844;
    float _1850 = _1848 + 1.0;
    float _1852 = abs(_1850);
    float _1854 = log2(_1852);
    float _1856 = _1846 * _1806;
    float _1858 = _1846 * _1822;
    float _1860 = _1846 * _1814;
    float _1862 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1864 = -_1862;
    float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = -_1860;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1872 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1870, -0.5, 0.5);
    float _1876 = fma(_1870, 0.5, 0.5);
    float _1878 = exp2(_1872);
    float _1880 = fma(_1876, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1882 = fma(_1876, _1880, -0.212114393711090087890625);
    float _1884 = _1858 + 1.0;
    float _1886 = sqrt(_1874);
    float _1888 = fma(_1876, _1882, 1.570728778839111328125);
    float _1890 = -_1858;
    float _1892 = fma(_1878, _1884, _1890);
    float _1894 = fma(_1892, 0.5, 0.5);
    float _1896 = _1886 * 0.636619746685028076171875;
    float _1898 = -_1888;
    float _1900 = fma(_1896, _1898, 1.0);
    float2 _5575 = float2(_1900, _1894);
    float3 _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5575, float2(0.0), isnan(_5575)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5575, float2(0.0), isnan(_5575)), level(0.0)).xyz;
    float _1906 = _1904.x;
    float _1908 = _1904.y;
    float _1910 = _1904.z;
    float _1912 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1914 = in.m_79.y;
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1920 = _1912 * _760;
    int _1922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1924 = _1922 != 0;
    float _1926 = in.m_71.w;
    int _1928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1930 = _1928 != 0;
    float _1932 = -_396;
    float _1934 = _1932 + 1.0;
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1938 = _1936 != 0;
    float _1940 = trunc(_1920);
    int _1942 = int(_1940);
    float _1944 = in.m_71.y;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1948 = _1946 != 0;
    float _1950 = in.m_79.x;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1954 = _1888;
    float _1956 = _1926;
    bool _1958 = _1938;
    float _1960 = _1914;
    float _1962 = _1934;
    if (_1924)
    {
        float _1964 = in.m_71.z;
        _1954 = _1964;
    }
    float _1966 = _1954;
    out.m_81.x = _1369;
    out.m_81.y = _1367;
    out.m_81.z = _1371;
    float _1968 = -_1914;
    float _1970 = _1968 + 1.0;
    int _1972 = _1942 << 4;
    int _1974 = _1972 + 1712;
    float _1976 = abs(_816);
    float _1978 = log2(_1976);
    uint _1980 = uint(int(uint(_1974) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    bool _1996 = _1926 > 0.5;
    int _1998 = _1996 ? as_type<int>(_1970) : as_type<int>(_1914);
    float _2000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2002 = _1944 > 0.5;
    int _2004 = _1974 + 8;
    uint _2006 = uint(int(uint(_2004) >> uint(2)));
    uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
    int _2010 = int(_2006) & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    float _2014 = _1938 ? as_type<float>(_1998) : _1914;
    int _2016 = _1998;
    bool _2018 = _1996;
    if (_1930)
    {
        float _2020 = -_1950;
        float _2022 = _2020 + 1.0;
        _2016 = as_type<int>(_2022);
    }
    int _2024 = _2016;
    if (_1930)
    {
        bool _2026 = _760 > 0.5;
        _2018 = _2026;
    }
    bool _2028 = _2018;
    if (_1924)
    {
        float _2030 = -_1950;
        float _2032 = _2030 + 1.0;
        _1794 = as_type<int>(_2032);
    }
    int _2034 = _1794;
    if (!_1930)
    {
        _1956 = _1950;
    }
    float _2036 = _1956;
    float _2038 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2040 = _2036;
    if (_1924)
    {
        bool _2042 = _1966 > 0.5;
        _1958 = _2042;
    }
    bool _2044 = _1958;
    float _2046 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1930)
    {
        float _2050 = _2028 ? as_type<float>(_2024) : _1950;
        _2040 = _2050;
    }
    float _2052 = _2040;
    if (!_1924)
    {
        _1195 = _1950;
    }
    float _2054 = _1195;
    float _2056 = _2054;
    if (_1948)
    {
        float _2058 = _2002 ? _1970 : _1914;
        _1960 = _2058;
    }
    float _2060 = _1960;
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1924)
    {
        float _2064 = _2044 ? as_type<float>(_2034) : _1950;
        _2056 = _2064;
    }
    float _2066 = _2056;
    float _2068 = _2046 * _2000;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2072 = _2062 * _1916;
    float _2074 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2076 = _2070 * _1952;
    float _2078 = _2074 * _2048;
    float _2080 = exp2(_2038);
    float _2082 = in.m_83.x;
    float _2084 = in.m_83.y;
    float _2086 = in.m_83.z;
    float _2088 = in.m_83.w;
    bool _2090 = _856 != 0.0;
    bool _2092 = isnan(_856);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2106 = _915 == 0.0;
    bool _2108 = !_2098;
    bool _2110 = _2106 && _2108;
    float _2112 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2114 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_85.x = _2072;
    out.m_85.y = _2076;
    out.m_85.z = _2078;
    out.m_85.w = _2068;
    bool _2120 = _884 == 0.0;
    bool _2122 = _2120 && _2110;
    float _2124 = _1986 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2126 = _1994 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_87.x = _2112;
    out.m_87.y = _2116;
    out.m_87.z = _2118;
    float _2128 = exp2(_1918);
    float _2130 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2132 = in.m_89.x;
    float _2134 = in.m_89.y;
    float _2136 = in.m_89.z;
    float _2138 = _2012 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2142 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2144 = _644 * _2084;
    float _2146 = _646 * _2084;
    out.m_91.x = _2140;
    out.m_91.y = _2130;
    out.m_91.z = _2142;
    out.m_91.w = _2114;
    float _2148 = -_2128;
    float _2150 = _2148 + 1.0;
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2154 = _2152 * _1579;
    float _2156 = -_2152;
    float _2158 = _2156 + 1.0;
    float _2160 = _780 * _2136;
    float _2162 = _812 * _2136;
    float _2164 = fma(_945, _2082, _2144);
    float _2166 = -_2160;
    float _2168 = fma(_812, _2134, _2166);
    float _2170 = fma(_780, _2134, _2162);
    float _2172 = _834 * _2168;
    float _2174 = _850 * _2168;
    float _2176 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = -_2172;
    float _2182 = fma(_850, _2132, _2180);
    float _2184 = fma(_834, _2132, _2174);
    float _2186 = _638 * _2084;
    float _2188 = fma(_937, _2082, _2146);
    float _2190 = _2182 * _2086;
    float _2192 = _2178 * _2178;
    float _2194 = fma(_927, _2082, _2186);
    float _2196 = fma(_2178, -2.0, 3.0);
    float _2198 = -_2190;
    float _2200 = fma(_2170, _2082, _2198);
    float _2202 = _2184 * _2082;
    float _2204 = _2190;
    float _2206 = _2146;
    float _2208 = _2144;
    if (_2122)
    {
        _2204 = _2184;
    }
    float _2210 = _2204;
    float _2212 = _2192 * _2196;
    float _2214 = _2210;
    if (!_2122)
    {
        float _2216 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2184);
        _2214 = _2216;
    }
    float _2218 = _2214;
    float _2220 = -_2202;
    float _2222 = fma(_2182, _2084, _2220);
    float _2224 = _2170 * _2084;
    float _2226 = _2200 * _2088;
    if (_2122)
    {
        _2206 = _2170;
    }
    float _2228 = _2206;
    float _2230 = _2228;
    if (!_2122)
    {
        float _2232 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2170);
        _2230 = _2232;
    }
    float _2234 = _2230;
    float _2236 = -_2224;
    float _2238 = fma(_2184, _2086, _2236);
    float _2240 = fma(_981, _2086, _2194);
    float _2242 = _638 * _2218;
    float _2244 = _644 * _2226;
    float _2246 = _2238 * _2088;
    float _2248 = _638 * _2226;
    float _2250 = _646 * _2226;
    float _2252 = _2222 * _2088;
    float _2254 = fma(_945, _2246, _2244);
    float _2256 = fma(_1161, _2086, _2164);
    float _2258 = fma(_927, _2246, _2248);
    float _2260 = fma(_937, _2246, _2250);
    float _2262 = fma(_1017, _2086, _2188);
    float _2264 = _644 * _2218;
    float _2266 = _646 * _2218;
    float _2268 = fma(_1161, _2252, _2254);
    float _2270 = fma(_981, _2252, _2258);
    float _2272 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2274 = fma(_1017, _2252, _2260);
    out.m_93.x = _2240;
    out.m_93.y = _2256;
    out.m_93.z = _2262;
    float _2276 = _2268;
    if (_2122)
    {
        _2208 = _2182;
    }
    float _2278 = _2208;
    float _2280 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2272);
    float _2282 = _2278;
    if (!_2122)
    {
        float _2284 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2182);
        _2282 = _2284;
    }
    float _2286 = _2282;
    out.m_95.x = _2270;
    out.m_95.y = _2268;
    out.m_95.z = _2274;
    float _2288 = fma(_927, _2286, _2242);
    float _2290 = in.m_73.w;
    float _2292 = fma(_945, _2286, _2264);
    float _2294 = fma(_937, _2286, _2266);
    float _2296 = fma(_981, _2234, _2288);
    float _2298 = -_2212;
    float _2300 = _2298 + 1.0;
    float _2302 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2304 = fma(_1161, _2234, _2292);
    float _2306 = fma(_1017, _2234, _2294);
    bool _2308 = _816 <= 8000.0;
    bool _2310 = isnan(_816);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(8000.0);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2212);
    float _2322 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2302);
    float _2324 = _2322;
    if (!_1461)
    {
        _2276 = 1.0;
    }
    float _2326 = _2276;
    out.m_97.x = _2296;
    out.m_97.y = _2304;
    out.m_97.z = _2306;
    float _2328 = _2318 * _2320;
    float _2330 = _2322 + _1481;
    float _2332 = _2326;
    if (_1461)
    {
        bool _2334 = _1577 >= _1537;
        bool _2336 = isnan(_1577);
        bool _2338 = _2334 || _2336;
        bool _2340 = isnan(_1537);
        bool _2342 = _2338 || _2340;
        float _2344 = float(_2342);
        _2332 = _2344;
    }
    float _2346 = _2332;
    float _2348 = _1590 * _2158;
    float _2350 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2352 = _2330 * 0.5;
    float _2354 = _2346 * _1664;
    float _2356 = _1934 * _2350;
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    bool _2360 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2362 = isnan(_1686);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2368 = _2364 || _2366;
    out.m_99.z = _2352;
    out.m_99.w = _1481;
    float _2370 = -_2358;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_101.w = _2290;
    float _2374 = -_2354;
    float _2376 = fma(_2374, _2372, 1.0);
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    out.gl_Position.x = _1515;
    out.gl_Position.y = _1517;
    out.gl_Position.z = _2322;
    out.gl_Position.w = _1481;
    float _2380 = _2378 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2382 = _1590 * _2154;
    float _2384 = _2378;
    float _2386 = _1515;
    if (!_2368)
    {
        _2384 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2388 = _2384;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2368)
    {
        _1962 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2394 = _1962;
    out.m_103.x = _2380;
    float _2396 = _2394;
    float _2398 = _2394;
    if (!_2368)
    {
        _1491 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2400 = _1491;
    float _2402 = _2400;
    float _2404 = _2400;
    if (!_2368)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _2324;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2368)
    {
        _1525 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2412 = _1525;
    float _2414 = _2412;
    float _2416 = _2412;
    if (!_2368)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2418 = _2386;
    float _2420 = _1910 * _2154;
    float _2422 = fma(_1906, _2382, _1584);
    float _2424 = fma(_1908, _2382, _1586);
    float _2426 = fma(_1590, _2420, _1588);
    out.m_105.x = _2422;
    out.m_105.y = _2424;
    out.m_105.z = _2426;
    out.m_105.w = _2348;
    bool _2428 = !_2368;
    float _2430 = _2418;
    float _2432 = _2418;
    if (!_2428)
    {
        bool _2434 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2436 = isnan(_1686);
        bool _2438 = _2434 || _2436;
        bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2442 = _2438 || _2440;
        if (!_2442)
        {
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2446 = _1686 + _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2448;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2456 = 1.0 / _2450;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2474 = _2446 * _2456;
            float _2476 = precise::clamp(_2474, 0.0, 1.0);
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2482 = fma(_2476, _2454, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2486;
            _2432 = _2490;
            _2392 = _2482;
            _2416 = _2488;
            _2410 = _2484;
            _2398 = _2492;
            _2494 = true;
        }
        else
        {
            bool _2496 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2498 = isnan(_1686);
            bool _2500 = _2496 || _2498;
            bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2504 = _2500 || _2502;
            if (!_2504)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2506 = _2390;
            _2392 = _2506;
            if (!_2504)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2508 = _2402;
            _2404 = _2508;
            if (!_2504)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2510 = _2408;
            _2410 = _2510;
            if (!_2504)
            {
                _2414 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2512 = _2414;
            _2416 = _2512;
            if (!_2504)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2514 = _2430;
            _2432 = _2514;
            if (!_2504)
            {
                _2396 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2516 = _2396;
            bool _2518 = !_2504;
            _2398 = _2516;
            if (!_2518)
            {
                bool _2520 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2522 = isnan(_1686);
                bool _2524 = _2520 || _2522;
                bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2528 = _2524 || _2526;
                if (!_2528)
                {
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2532 = _1686 + _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2534;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2542 = 1.0 / _2536;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2560 = _2532 * _2542;
                    float _2562 = precise::clamp(_2560, 0.0, 1.0);
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2568 = fma(_2562, _2540, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2572;
                    _2432 = _2576;
                    _2392 = _2568;
                    _2416 = _2574;
                    _2410 = _2570;
                    _2398 = _2578;
                    _2494 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2416 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2398 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2494 = false;
    float _2580 = _2404;
    float _2582 = _2432;
    float _2584 = _2392;
    float _2586 = _2416;
    float _2588 = _2410;
    float _2590 = _2398;
    float _2592 = fma(_2304, -0.5, 0.5);
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = -_2580;
    float _2598 = _2596 + _2582;
    float _2600 = -_2584;
    float _2602 = _2600 + _2586;
    float _2604 = -_2588;
    float _2606 = _2604 + _2590;
    bool _2608 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2610 = fma(_2594, _2598, _2580);
    float _2612 = fma(_2594, _2602, _2584);
    float _2614 = fma(_2594, _2606, _2588);
    float _2616 = _2610 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2618 = fma(_2612, 0.298911988735198974609375, _2616);
    float _2620 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2622 = fma(_2614, 0.114477999508380889892578125, _2618);
    out.m_103.w = _2620;
    float _2624 = -_2622;
    float _2626 = _2612 + _2624;
    float _2628 = -_2622;
    float _2630 = _2610 + _2628;
    float _2632 = -_2622;
    float _2634 = _2614 + _2632;
    out.m_107.x = 0.0;
    float _2636 = fma(_2626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    float _2638 = fma(_2630, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    float _2640 = fma(_2634, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    out.m_109.x = _2636;
    out.m_109.y = _2638;
    out.m_109.z = _2640;
    if (!_2608)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2642 = -_1367;
    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2646 = -_1369;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2650 = -_1371;
    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2648, _2648, _2654);
    float _2658 = fma(_2652, _2652, _2656);
    float _2660 = sqrt(_2658);
    float _2662 = rsqrt(_2658);
    float _2664 = -_2660;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2668 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2670 = precise::clamp(_2668, 0.0, 1.0);
    float _2672 = _2648 * _2662;
    float _2674 = _2644 * _2662;
    float _2676 = abs(_2670);
    float _2678 = log2(_2676);
    float _2680 = _2652 * _2662;
    float _2682 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2684 = _2304 * _2674;
    float _2686 = -_2674;
    float _2688 = -_2682;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2688);
    float _2692 = fma(_2296, _2672, _2684);
    float _2694 = -_2680;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2690);
    float _2698 = fma(_2306, _2680, _2692);
    float _2700 = precise::clamp(_2698, 0.0, 1.0);
    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2704 = _2696 + _2702;
    float _2706 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = exp2(_2706);
    float _2714 = _2712 * _2710;
    float _2716 = _2700 * _2714;
    float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2722 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _2718;
    out.m_107.y = _2720;
    out.m_107.z = _2722;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2494 = false;
    bool _344 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_56.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_59.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_144);
        out.gl_Position.z = _2778;
    }
    if (!_132)
    {
        return out;
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = 0.0;
    if (_156)
    {
        float _164 = float(_128);
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    if (_172)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _138;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    int _176 = 0;
    if (_172)
    {
        float _178 = _174 * 5.0;
        _176 = as_type<int>(_178);
    }
    int _180 = _176;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_180);
        out.gl_Position.z = _2846;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_63.y;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_63.z;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _182 * _182;
    float _198 = in.m_63.x;
    float _200 = _186 * _186;
    float _202 = in.m_65.x;
    float _204 = fma(_188, _188, _196);
    float _206 = in.m_67.x;
    float _208 = fma(_190, _190, _200);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _208);
    float _214 = sqrt(_210);
    float _216 = in.m_69.x;
    float _218 = in.m_69.y;
    float _220 = in.m_69.z;
    float _222 = sqrt(_212);
    bool _224 = _214 > 0.0;
    bool _226 = _222 > 0.0;
    float _228 = _182 * _218;
    float _230 = _188 * _218;
    float _232 = _192 * _218;
    float _234 = 0.0;
    float _236 = _212;
    float _238 = _214;
    if (_224)
    {
        float _240 = rsqrt(_210);
        _234 = _240;
    }
    float _242 = _234;
    float _244 = fma(_216, _198, _228);
    float _246 = fma(_216, _202, _230);
    float _248 = fma(_216, _206, _232);
    float _250 = 0.0;
    float _252 = _244;
    float _254 = _246;
    if (!_224)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = fma(_186, _220, _244);
    float _260 = fma(_190, _220, _246);
    float _262 = 0.0;
    float _264 = _256;
    if (!_224)
    {
        _252 = 0.0;
        _262 = 0.0;
    }
    float _266 = _252;
    float _268 = _262;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_226)
    {
        float _276 = rsqrt(_212);
        _270 = _276;
    }
    float _278 = _270;
    if (!_226)
    {
        _254 = 0.0;
    }
    float _280 = _254;
    float _282 = fma(_194, _220, _248);
    float _284 = _280;
    if (_224)
    {
        float _286 = _242 * _188;
        _264 = _286;
    }
    float _288 = _264;
    float _290 = _288;
    if (!_226)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _292 = _236;
    float _294 = _238;
    float _296 = _294;
    float _298 = _292;
    if (_224)
    {
        float _300 = _242 * _182;
        _272 = _300;
    }
    float _302 = _272;
    float _304 = _302;
    if (_224)
    {
        float _306 = _242 * _192;
        _274 = _306;
    }
    float _308 = _274;
    float _310 = _308;
    if (_226)
    {
        float _312 = _278 * _190;
        _284 = _312;
    }
    float _314 = _284;
    if (_226)
    {
        float _316 = _278 * _186;
        _296 = _316;
    }
    float _318 = _296;
    if (_226)
    {
        float _320 = _278 * _194;
        _298 = _320;
    }
    float _322 = _298;
    bool _324 = !_184;
    float _342;
    if (!_324)
    {
        float _326 = in.m_71.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_128);
        float _348 = 1.0 / _346;
        float _350 = _160 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_56.x;
    float _356 = in.m_56.y;
    float _358 = in.m_56.z;
    float _360 = in.m_65.w;
    float _362 = in.m_67.w;
    float _364 = _188 * _356;
    float _366 = _192 * _356;
    float _368 = fma(_202, _354, _364);
    float _370 = fma(_206, _354, _366);
    float _372 = fma(_190, _358, _368);
    float _374 = fma(_194, _358, _370);
    float _376 = _372 + _360;
    float _378 = _374 + _362;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _382 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _384 = floor(_380);
    float _386 = floor(_382);
    float _388 = -_384;
    float _390 = _380 + _388;
    float _392 = -_386;
    float _394 = _382 + _392;
    float2 _3151 = float2(_390, _394);
    float _396 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3151, float2(0.0), isnan(_3151)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3151, float2(0.0), isnan(_3151)), level(0.0)).x;
    float _398 = _182 * _356;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _352 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = fma(_198, _354, _398);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _416 = _352 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _418;
    float _422 = 1.0 / _406;
    float _424 = fma(_186, _358, _412);
    float _426 = in.m_63.w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = _160 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = 1.0 / _410;
    float _444 = _436 * 0.15915493667125701904296875;
    float _446 = in.m_73.y;
    float _448 = in.m_73.z;
    float _450 = _416 * _422;
    float _452 = 1.0 / _420;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _456 = _352 + _454;
    float _458 = _402 * _442;
    float _460 = in.m_75.x;
    float _462 = in.m_75.y;
    float _464 = in.m_75.z;
    float _466 = fma(_430, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = fma(_440, _458, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = _424 + _426;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = _456 * _452;
    float _482 = fma(_474, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _484 = _258 * _258;
    float _486 = fma(_434, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_478, _458, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_260, _260, _484);
    bool _496 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _498 = isnan(_352);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_490, _458, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _510 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_352);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _444 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = fma(_282, _282, _494);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _532;
    float _536 = -_506;
    float _538 = _536 + 1.0;
    float _540 = fma(_530, _480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _542 = _460 > 0.0;
    float _544 = _444 * 6.283185482025146484375;
    float _546 = sin(_544);
    bool _548 = _460 >= 0.0;
    bool _550 = isnan(_460);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = _520 * _538;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _560;
    float _564 = fma(_534, _480, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _566 = _556 ? 0 : 1;
    float _568 = fma(_562, _480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _570 = rsqrt(_526);
    int _572 = ~_566;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    bool _578 = _524 >= 0.0;
    bool _580 = isnan(_524);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    int _588 = _576;
    if (!_542)
    {
        int _590 = ~_566;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    bool _596 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_352);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _546 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _610 = -_520;
    float _612 = _610 + 1.0;
    bool _614 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _616 = isnan(_352);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    bool _626 = _524 > 0.0;
    float _628 = _606 * _612;
    float _630 = -_606;
    float _632 = _630 + 1.0;
    float _634 = _470 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _636 = float(_594);
    float _638 = _260 * _570;
    float _640 = _624 * _632;
    float _642 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[11].x, _634);
    float _644 = _258 * _570;
    float _646 = _282 * _570;
    float _648 = _466 * _640;
    float _650 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].z, _642);
    float _652 = -_624;
    float _654 = _652 + 1.0;
    float _656 = _482 * _640;
    int _658 = _586 ? 0 : 1;
    float _660 = _608 * _636;
    float _662 = _650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _664 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].x, _648);
    int _666 = ~_658;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = _660 * _446;
    int _674 = _670;
    if (!_626)
    {
        int _676 = ~_658;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    float _682 = fma(_468, _628, _664);
    float _684 = _470 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _686 = _524 * _524;
    float _688 = float(_680);
    float _690 = 1.0 / _662;
    float _692 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    float _694 = _486 * _640;
    float _696 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].y, _656);
    float _698 = _686 * _688;
    float _700 = _644 * _302;
    float _702 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].z, _692);
    float _704 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].z, _694);
    float _706 = fma(_492, _628, _696);
    float _708 = fma(_638, _288, _700);
    float _710 = _702 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _712 = fma(_508, _628, _704);
    float _714 = in.m_77.x;
    float _716 = in.m_77.y;
    float _718 = in.m_77.z;
    float _720 = fma(_646, _308, _708);
    float _722 = _710 + _662;
    float _724 = fma(_568, _558, _682);
    float _726 = fma(_540, _558, _706);
    float _728 = fma(_564, _558, _712);
    float _730 = _722 * _690;
    float _732 = _730 * 0.5;
    float _734 = abs(_720);
    bool _736 = _734 > 0.99989998340606689453125;
    float _738 = _698 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _740 = _672 * 0.01745329238474369049072265625;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[30].w, _742);
    float _746 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].y, _726);
    float _748 = _738 * _448;
    float _750 = _740 * 0.15915493667125701904296875;
    float _752 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].x, _724);
    float _754 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].z, _728);
    float _756 = 1.0 / _744;
    float _758 = _748 * (-0.01745329238474369049072265625);
    float _760 = in.m_71.x;
    if (_736)
    {
        float _762 = fma(_314, 0.001000000047497451305389404296875, _288);
        _290 = _762;
    }
    float _764 = _290;
    float _766 = _758 * 0.15915493667125701904296875;
    if (_736)
    {
        float _768 = fma(_322, 0.001000000047497451305389404296875, _308);
        _310 = _768;
    }
    float _770 = _310;
    float _772 = _746 * _716;
    float _774 = -_764;
    float _776 = _646 * _774;
    float _778 = _766 * 6.283185482025146484375;
    float _780 = sin(_778);
    if (_736)
    {
        float _782 = fma(_318, 0.001000000047497451305389404296875, _302);
        _304 = _782;
    }
    float _784 = _304;
    float _786 = -_770;
    float _788 = _644 * _786;
    float _790 = -_770;
    float _792 = -_776;
    float _794 = fma(_638, _790, _792);
    float _796 = _752 * _714;
    float _798 = _754 * _718;
    float _800 = -_784;
    float _802 = _638 * _800;
    float _804 = -_784;
    float _806 = -_788;
    float _808 = fma(_646, _804, _806);
    float _810 = _766 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _816 = _756 * _814;
    float _818 = _794 * _794;
    float _820 = -_764;
    float _822 = -_802;
    float _824 = fma(_644, _820, _822);
    float _826 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _828 = fma(_808, _808, _818);
    bool _830 = _816 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _832 = _750 * 6.283185482025146484375;
    float _834 = sin(_832);
    bool _836 = _816 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _838 = fma(_824, _824, _828);
    float _840 = _780 * _464;
    float _842 = _470 + _826;
    float _844 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _848 = _750 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _812 * _464;
    float _854 = -_840;
    float _856 = fma(_812, _462, _854);
    float _858 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _860 = 2;
    if (!_830)
    {
        _860 = 1;
    }
    int _862 = _860;
    float _864 = fma(_780, _462, _852);
    bool _866 = !_830;
    int _868 = _866 ? 0 : 1;
    float _870 = _834 * _460;
    float _872 = rsqrt(_838);
    int _874 = _862;
    if (!_836)
    {
        _874 = _868;
    }
    int _876 = _874;
    int _878 = _876 << 6;
    float _880 = _850 * _460;
    float _882 = -_870;
    float _884 = fma(_864, _850, _882);
    int _886 = _878 + 96;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    bool _905 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _913 = _909 || _911;
    float _915 = fma(_864, _834, _880);
    float _917 = _842 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _919 = _842 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _915);
    float _923 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[126].x, _917);
    float _925 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[127].x, _919);
    float _927 = _808 * _872;
    float _929 = _846 * _921;
    float _931 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[126].z, _923);
    float _933 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[127].z, _925);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _856);
    float _937 = _824 * _872;
    float _939 = _931 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _943 = _844 * _935;
    float _945 = _794 * _872;
    float _947 = trunc(_939);
    int _949 = int(_947);
    int _951 = _878 + 104;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.vp_c15)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.vp_c15)._m0[int(_963)][_965];
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _971 = _644 * _937;
    float _973 = _943 * _638;
    float _975 = _943 * _646;
    float _977 = _858 * _969;
    float _979 = -_971;
    float _981 = fma(_646, _945, _979);
    float _983 = trunc(_941);
    int _985 = int(_983);
    int _987 = _878 + 48;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    float _1005 = fma(_929, _927, _973);
    float _1007 = _638 * _945;
    float _1009 = fma(_929, _937, _975);
    float _1011 = _943 * _644;
    float _1013 = fma(_977, _981, _1005);
    float _1015 = -_1007;
    float _1017 = fma(_644, _927, _1015);
    int _1019 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1021 = _949 + _1019;
    int _1023 = _1021 + 1;
    int _1025 = _878 + 64;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    uint _1029 = uint(int(uint(int(_1027)) >> uint(2)));
    int _1031 = int(_1027) & 3;
    float _1033 = (*spvDescriptorSet0.vp_c15)._m0[int(_1029)][_1031];
    int _1035 = int(_1027) + 1;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    int _1039 = _1035 & 3;
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[int(_1037)][_1039];
    float _1043 = _376 + _1013;
    float _1045 = fma(_977, _1017, _1009);
    bool _1047 = _1023 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1049 = _646 * _927;
    float _1051 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1043);
    float _1053 = _378 + _1045;
    int _1055 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1057 = _985 + _1055;
    int _1059 = _1057 + 1;
    int _1061 = _878 + 56;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c15)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    float _1079 = fma(_760, 100.0, _1051);
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1083 = _1053 + _1081;
    int _1085 = _1023 | _1059;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1089 = _1043 + _1087;
    float _1091 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1053);
    float _1093 = _1083 * _1083;
    bool _1095 = _1085 < 0;
    bool _1097 = _1095 || _1047;
    int _1099 = _878 + 72;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    uint _1103 = uint(int(uint(int(_1101)) >> uint(2)));
    int _1105 = int(_1101) & 3;
    float _1107 = (*spvDescriptorSet0.vp_c15)._m0[int(_1103)][_1105];
    int _1109 = int(_1101) + 1;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    int _1113 = _1109 & 3;
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[int(_1111)][_1113];
    float _1117 = _1079 * 2.0;
    float _1119 = fma(_1089, _1089, _1093);
    float _1121 = fma(_760, 100.0, _1091);
    float _1123 = _842 * _903;
    float _1125 = _1117 * 0.15915493667125701904296875;
    float _1127 = sqrt(_1119);
    float _1129 = _1121 * 2.0;
    int _1131 = _878 + 80;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
    int _1137 = int(_1133) & 3;
    float _1139 = (*spvDescriptorSet0.vp_c15)._m0[int(_1135)][_1137];
    int _1141 = int(_1133) + 1;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    int _1145 = _1141 & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    bool _1149 = _1059 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1151 = _1149 || _1097;
    float _1153 = fma(_376, _895, _1123);
    float _1155 = _1129 * 0.15915493667125701904296875;
    float _1157 = fma(_929, _945, _1011);
    float _1159 = -_1049;
    float _1161 = fma(_638, _937, _1159);
    float _1163 = _1125 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = fma(_378, _959, _1153);
    float _1169 = fma(_977, _1161, _1157);
    float _1171 = _1167 + _967;
    float _1173 = _470 + _1169;
    float _1175 = _1155 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    bool _1179 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1181 = _1023;
    int _1183 = as_type<int>(_1153);
    int _1185 = as_type<int>(_967);
    float _1187 = _1167;
    float _1189 = _1053;
    float _1191 = _1083;
    float _1193 = as_type<float>(_876);
    float _1195 = _760;
    if (!_1151)
    {
        int _1197 = _1059 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1199 = _1197 + _1023;
        _1181 = _1199;
    }
    int _1201 = _1181;
    float _1203 = _842 * _1003;
    float _1205 = fma(_376, _995, _1203);
    float _1207 = _1157;
    if (!_1151)
    {
        float _1209 = floor(_939);
        _1207 = _1209;
    }
    float _1211 = _1207;
    if (!_1151)
    {
        int _1213 = _1201 << 2;
        _1183 = _1213;
    }
    int _1215 = _1183;
    float _1217 = _842 * _1041;
    float _1219 = fma(_1165, 0.100000001490116119384765625, _1173);
    if (!_1151)
    {
        int _1221 = 12 & _1215;
        _1185 = _1221;
    }
    int _1223 = _1185;
    float _1225 = fma(_376, _1033, _1217);
    float _1227 = as_type<float>(_1223);
    float _1229 = _1225;
    if (!_1179)
    {
        _1187 = _1043;
    }
    float _1231 = _1187;
    float _1233 = 1.0 / _1171;
    float _1235 = fma(_1177, 0.100000001490116119384765625, _1219);
    float _1237 = fma(_378, _1069, _1205);
    int _1239 = as_type<int>(_1069);
    float _1241 = _1231;
    if (!_1151)
    {
        uint _1243 = uint(int(uint(_1201) >> uint(2)));
        _1239 = int(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1237 + _1077;
    int _1249 = _1245;
    if (!_1151)
    {
        int _1251 = _1245 << 4;
        int _1253 = _1251 + _1223;
        _1249 = _1253;
    }
    int _1255 = _1249;
    if (!_1179)
    {
        _1227 = _1235;
    }
    float _1257 = _1227;
    float _1259 = fma(_378, _1107, _1225);
    float _1261 = _1259 + _1115;
    bool _1263 = !_1179;
    float _1265 = _1257;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1127 + _1269;
        float _1273 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1119);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        float _1289 = _1283 + (-1.0);
        float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = fma(_1287, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1295 = fma(_1235, _1283, _1291);
        float _1297 = _1275 * _1293;
        float _1299 = fma(_1089, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1301 = fma(_1083, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1189 = _1301;
        _1241 = _1299;
        _1265 = _1295;
    }
    float _1303 = _1189;
    float _1305 = _1241;
    float _1307 = _1265;
    float _1309 = _1307;
    float _1311 = _1305;
    if (_913)
    {
        _1191 = _1303;
    }
    float _1313 = _1191;
    float _1315 = _1313;
    if (!_913)
    {
        float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1319 = _470 + _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1323 = _376 + _1321;
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = -_376;
        float _1329 = _1327 + _1305;
        float _1331 = _1319 * _1319;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _378 + _1333;
        float _1337 = -_378;
        float _1339 = _1337 + _1303;
        float _1341 = fma(_1323, _1323, _1331);
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1345 = fma(_1335, _1335, _1341);
        float _1347 = sqrt(_1345);
        float _1349 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1351 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1353 = _1351 * _1343;
        float _1355 = -_470;
        float _1357 = _1355 + _1307;
        float _1359 = _1349 * _1353;
        float _1361 = fma(_1357, _1359, _470);
        float _1363 = fma(_1329, _1359, _376);
        float _1365 = fma(_1339, _1359, _378);
        _1309 = _1361;
        _1311 = _1363;
        _1315 = _1365;
        _1229 = _1353;
    }
    float _1367 = _1309;
    float _1369 = _1311;
    float _1371 = _1315;
    float _1373 = _1229;
    int _1375 = _878 + 88;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    float _1393 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1395 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1397 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1399 = _1247 * _1233;
    float _1401 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1393);
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1395);
    float _1405 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1397);
    float _1407 = _470;
    if (!_1151)
    {
        int _1409 = _1255 + 400;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
        int _1415 = int(_1411) & 3;
        float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1401);
    bool _1423 = _1399 >= 0.0;
    float _1425 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1427 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1429 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1431 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1433 = _1261 * _1233;
    bool _1435 = _1399 <= 1.0;
    bool _1437 = _1435 && _1423;
    float _1439 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1443 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1429);
    float _1445 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1447 = _1433 >= 0.0;
    bool _1449 = _1447 && _1437;
    float _1451 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1455 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1445);
    bool _1459 = _1433 <= 1.0;
    bool _1461 = _1459 && _1449;
    float _1463 = -_1453;
    float _1465 = fma(_1463, _1451, 1.0);
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1471 = _842 * _1147;
    float _1473 = _1373;
    if (!_1151)
    {
        float _1475 = floor(_941);
        _1473 = _1475;
    }
    float _1477 = _1473;
    float _1479 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1483 = fma(_376, _1139, _1471);
    float _1485 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1489 = log2(_1465);
    float _1491 = _1481;
    if (_1461)
    {
        float _1493 = float(_876);
        _1193 = _1493;
    }
    float _1495 = _1193;
    float _1497 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1499 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1487);
    float _1501 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1503 = 1.0 / _1481;
    float _1505 = fma(_378, _1383, _1483);
    float _1507 = _1477;
    if (!_1151)
    {
        float _1509 = -_1477;
        float _1511 = _941 + _1509;
        _1507 = _1511;
    }
    float _1513 = _1507;
    float _1515 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1517 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1519 = _1505 + _1391;
    float _1521 = _1471;
    float _1523 = _1513;
    float _1525 = _1517;
    if (_1461)
    {
        float _1527 = rint(_1495);
        float _1529 = precise::max(_1527, 0.0);
        uint _1531 = uint(_1529);
        uint _1533 = clamp(_1531, 0u, 65535u);
        _1521 = as_type<float>(_1533);
    }
    float _1535 = _1521;
    float _1537 = _1519 * _1233;
    float _1539 = _1489 * 0.693147182464599609375;
    float _1541 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1543 = _1519;
    if (!_1151)
    {
        float _1545 = rint(_1419);
        float _1547 = precise::max(_1545, 0.0);
        uint _1549 = uint(_1547);
        uint _1551 = clamp(_1549, 0u, 65535u);
        _1543 = as_type<float>(_1551);
    }
    float _1553 = _1543;
    float _1555 = _1515 * _1503;
    float _1557 = _1517 * _1503;
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = fma(_1557, -0.5, 0.5);
    float _1563 = _1555;
    float _1565 = _1559;
    if (!_1151)
    {
        float _1567 = -_1211;
        float _1569 = _939 + _1567;
        _1563 = _1569;
    }
    float _1571 = _1563;
    float _1573 = _1177;
    if (_1461)
    {
        float3 _5052 = float3(_1399, _1433, float(as_type<int>(_1535)));
        float3 _5056 = select(_5052, float3(0.0), isnan(_5052));
        float _1575 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5056.xy, uint(rint(_5056.z)), _1537, level(0.0));
        _1573 = _1575;
    }
    float _1577 = _1573;
    float3 _5066 = float3(_1559, _1561, _1541);
    float _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5066, float3(0.0), isnan(_5066)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5066, float3(0.0), isnan(_5066)), level(0.0)).x;
    float3 _5075 = float3(_1559, _1561, _1541);
    float4 _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5075, float3(0.0), isnan(_5075)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5075, float3(0.0), isnan(_5075)), level(0.0)).xyzw;
    float _1584 = _1582.x;
    float _1586 = _1582.y;
    float _1588 = _1582.z;
    float _1590 = _1582.w;
    float _1592 = _1495;
    if (!_1151)
    {
        float3 _5098 = float3(_1571, _1513, float(as_type<int>(_1553)));
        float3 _5100 = select(_5098, float3(0.0), isnan(_5098));
        float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5100.xy, uint(rint(_5100.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5100.xy, uint(rint(_5100.z)), level(0.0)).x;
        _1592 = _1594;
    }
    float _1596 = _1592;
    float _1598 = 0.0;
    if (_1151)
    {
        _1598 = 1.0;
    }
    float _1600 = _1598;
    float _1602 = _1600;
    if (!_1151)
    {
        int _1604 = _1201 << 4;
        int _1606 = _1604 + 2048;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
        int _1612 = int(_1608) & 3;
        float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
        int _1616 = int(_1608) + 1;
        uint _1618 = uint(int(uint(_1616) >> uint(2)));
        int _1620 = _1616 & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        int _1624 = _1606 + 8;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
        int _1630 = int(_1626) & 3;
        float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
        int _1634 = int(_1626) + 1;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        int _1638 = _1634 & 3;
        float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
        float _1642 = _842 * _1622;
        float _1644 = fma(_376, _1614, _1642);
        float _1646 = fma(_378, _1632, _1644);
        float _1648 = _1646 + _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        float _1652 = -_1650;
        float _1654 = _1652 + _1596;
        float _1656 = fma(_1654, 500.0, 1.5);
        float _1658 = exp2(_1656);
        float _1660 = 0.0 + _1658;
        float _1662 = precise::clamp(_1660, 0.0, 1.0);
        _1602 = _1662;
    }
    float _1664 = _1602;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1668 = _1367 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1672 = _1369 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1676 = _1371 + _1674;
    float _1678 = _1668 * _1668;
    float _1680 = fma(_1672, _1672, _1678);
    float _1682 = fma(_1676, _1676, _1680);
    float _1684 = rsqrt(_1682);
    float _1686 = sqrt(_1682);
    float _1688 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1690 = _1672 * _1688;
    float _1692 = _1676 * _1688;
    float _1694 = _1690 * _1690;
    float _1696 = _1692 * _1692;
    float _1698 = _1694 + _1696;
    float _1700 = sqrt(_1698);
    bool _1702 = _1700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1706 = _1700 + _1704;
    float _1708 = _1680;
    float _1710 = _1684;
    float _1712 = _1706;
    float _1714 = _1668;
    if (_1702)
    {
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1716;
    }
    float _1718 = _1708;
    if (_1702)
    {
        float _1720 = rsqrt(_1698);
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = _1722;
    if (_1702)
    {
        float _1726 = _1706 * _1718;
        _1712 = _1726;
    }
    float _1728 = _1712;
    if (_1702)
    {
        float _1730 = _1728 * 0.15915493667125701904296875;
        _1565 = _1730;
    }
    float _1732 = _1565;
    float _1734 = _1676;
    float _1736 = _1732;
    if (_1702)
    {
        float _1738 = _1732 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1734 = _1740;
    }
    float _1742 = _1734;
    float _1744 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1746 = precise::max(0.0, _1744);
    float _1748 = _1718;
    float _1750 = _1746;
    if (_1702)
    {
        float _1752 = _1732 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = -_1688;
    float _1760 = -_1746;
    float _1762 = fma(_1668, _1758, _1760);
    if (_1702)
    {
        float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1714 = _1764;
    }
    float _1766 = _1714;
    float _1768 = _1766;
    float _1770 = _1742;
    if (_1702)
    {
        float _1772 = fma(_1742, _1766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = _1774;
    if (!_1702)
    {
        _1770 = _1690;
    }
    float _1778 = _1770;
    float _1780 = _1778;
    float _1782 = _1756;
    if (_1702)
    {
        float _1784 = _1756 + (-1.0);
        _1750 = _1784;
    }
    float _1786 = _1750;
    float _1788 = _1786;
    if (_1702)
    {
        float _1790 = _1722 * _1774;
        _1523 = _1790;
    }
    float _1792 = _1523;
    int _1794 = as_type<int>(_1792);
    if (!_1702)
    {
        _1776 = _1762;
    }
    float _1796 = _1776;
    float _1798 = _1796;
    if (_1702)
    {
        float _1800 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1800;
    }
    float _1802 = _1736;
    if (_1702)
    {
        float _1804 = _1690 * _1792;
        _1780 = _1804;
    }
    float _1806 = _1780;
    if (!_1702)
    {
        _1788 = _1692;
    }
    float _1808 = _1788;
    float _1810 = _1808;
    if (_1702)
    {
        float _1812 = _1692 * _1792;
        _1810 = _1812;
    }
    float _1814 = _1810;
    if (!_1702)
    {
        _1724 = _1694;
    }
    float _1816 = _1724;
    float _1818 = _1816;
    if (_1702)
    {
        float _1820 = fma(_1762, _1756, _1802);
        _1798 = _1820;
    }
    float _1822 = _1798;
    if (_1702)
    {
        float _1824 = _1806 * _1806;
        _1818 = _1824;
    }
    float _1826 = _1818;
    if (!_1702)
    {
        _1782 = _1696;
    }
    float _1828 = _1782;
    float _1830 = _1828;
    if (_1702)
    {
        float _1832 = _1814 * _1814;
        _1830 = _1832;
    }
    float _1834 = _1830;
    float _1836 = fma(_1822, _1822, _1826);
    float _1838 = _1836 + _1834;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = rsqrt(_1838);
    float _1848 = -_1844;
    float _1850 = _1848 + 1.0;
    float _1852 = abs(_1850);
    float _1854 = log2(_1852);
    float _1856 = _1846 * _1806;
    float _1858 = _1846 * _1822;
    float _1860 = _1846 * _1814;
    float _1862 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1864 = -_1862;
    float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = -_1860;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1872 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1870, -0.5, 0.5);
    float _1876 = fma(_1870, 0.5, 0.5);
    float _1878 = exp2(_1872);
    float _1880 = fma(_1876, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1882 = fma(_1876, _1880, -0.212114393711090087890625);
    float _1884 = _1858 + 1.0;
    float _1886 = sqrt(_1874);
    float _1888 = fma(_1876, _1882, 1.570728778839111328125);
    float _1890 = -_1858;
    float _1892 = fma(_1878, _1884, _1890);
    float _1894 = fma(_1892, 0.5, 0.5);
    float _1896 = _1886 * 0.636619746685028076171875;
    float _1898 = -_1888;
    float _1900 = fma(_1896, _1898, 1.0);
    float2 _5575 = float2(_1900, _1894);
    float3 _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5575, float2(0.0), isnan(_5575)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5575, float2(0.0), isnan(_5575)), level(0.0)).xyz;
    float _1906 = _1904.x;
    float _1908 = _1904.y;
    float _1910 = _1904.z;
    float _1912 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1914 = in.m_79.y;
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1920 = _1912 * _760;
    int _1922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1924 = _1922 != 0;
    float _1926 = in.m_71.w;
    int _1928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1930 = _1928 != 0;
    float _1932 = -_396;
    float _1934 = _1932 + 1.0;
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1938 = _1936 != 0;
    float _1940 = trunc(_1920);
    int _1942 = int(_1940);
    float _1944 = in.m_71.y;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1948 = _1946 != 0;
    float _1950 = in.m_79.x;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1954 = _1888;
    float _1956 = _1926;
    bool _1958 = _1938;
    float _1960 = _1914;
    float _1962 = _1934;
    if (_1924)
    {
        float _1964 = in.m_71.z;
        _1954 = _1964;
    }
    float _1966 = _1954;
    out.m_81.x = _1369;
    out.m_81.y = _1367;
    out.m_81.z = _1371;
    float _1968 = -_1914;
    float _1970 = _1968 + 1.0;
    int _1972 = _1942 << 4;
    int _1974 = _1972 + 1712;
    float _1976 = abs(_816);
    float _1978 = log2(_1976);
    uint _1980 = uint(int(uint(_1974) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    bool _1996 = _1926 > 0.5;
    int _1998 = _1996 ? as_type<int>(_1970) : as_type<int>(_1914);
    float _2000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2002 = _1944 > 0.5;
    int _2004 = _1974 + 8;
    uint _2006 = uint(int(uint(_2004) >> uint(2)));
    uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
    int _2010 = int(_2006) & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    float _2014 = _1938 ? as_type<float>(_1998) : _1914;
    int _2016 = _1998;
    bool _2018 = _1996;
    if (_1930)
    {
        float _2020 = -_1950;
        float _2022 = _2020 + 1.0;
        _2016 = as_type<int>(_2022);
    }
    int _2024 = _2016;
    if (_1930)
    {
        bool _2026 = _760 > 0.5;
        _2018 = _2026;
    }
    bool _2028 = _2018;
    if (_1924)
    {
        float _2030 = -_1950;
        float _2032 = _2030 + 1.0;
        _1794 = as_type<int>(_2032);
    }
    int _2034 = _1794;
    if (!_1930)
    {
        _1956 = _1950;
    }
    float _2036 = _1956;
    float _2038 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2040 = _2036;
    if (_1924)
    {
        bool _2042 = _1966 > 0.5;
        _1958 = _2042;
    }
    bool _2044 = _1958;
    float _2046 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1930)
    {
        float _2050 = _2028 ? as_type<float>(_2024) : _1950;
        _2040 = _2050;
    }
    float _2052 = _2040;
    if (!_1924)
    {
        _1195 = _1950;
    }
    float _2054 = _1195;
    float _2056 = _2054;
    if (_1948)
    {
        float _2058 = _2002 ? _1970 : _1914;
        _1960 = _2058;
    }
    float _2060 = _1960;
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1924)
    {
        float _2064 = _2044 ? as_type<float>(_2034) : _1950;
        _2056 = _2064;
    }
    float _2066 = _2056;
    float _2068 = _2046 * _2000;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2072 = _2062 * _1916;
    float _2074 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2076 = _2070 * _1952;
    float _2078 = _2074 * _2048;
    float _2080 = exp2(_2038);
    float _2082 = in.m_83.x;
    float _2084 = in.m_83.y;
    float _2086 = in.m_83.z;
    float _2088 = in.m_83.w;
    bool _2090 = _856 != 0.0;
    bool _2092 = isnan(_856);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2106 = _915 == 0.0;
    bool _2108 = !_2098;
    bool _2110 = _2106 && _2108;
    float _2112 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2114 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_85.x = _2072;
    out.m_85.y = _2076;
    out.m_85.z = _2078;
    out.m_85.w = _2068;
    bool _2120 = _884 == 0.0;
    bool _2122 = _2120 && _2110;
    float _2124 = _1986 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2126 = _1994 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_87.x = _2112;
    out.m_87.y = _2116;
    out.m_87.z = _2118;
    float _2128 = exp2(_1918);
    float _2130 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2132 = in.m_89.x;
    float _2134 = in.m_89.y;
    float _2136 = in.m_89.z;
    float _2138 = _2012 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2142 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2144 = _644 * _2084;
    float _2146 = _646 * _2084;
    out.m_91.x = _2140;
    out.m_91.y = _2130;
    out.m_91.z = _2142;
    out.m_91.w = _2114;
    float _2148 = -_2128;
    float _2150 = _2148 + 1.0;
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2154 = _2152 * _1579;
    float _2156 = -_2152;
    float _2158 = _2156 + 1.0;
    float _2160 = _780 * _2136;
    float _2162 = _812 * _2136;
    float _2164 = fma(_945, _2082, _2144);
    float _2166 = -_2160;
    float _2168 = fma(_812, _2134, _2166);
    float _2170 = fma(_780, _2134, _2162);
    float _2172 = _834 * _2168;
    float _2174 = _850 * _2168;
    float _2176 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = -_2172;
    float _2182 = fma(_850, _2132, _2180);
    float _2184 = fma(_834, _2132, _2174);
    float _2186 = _638 * _2084;
    float _2188 = fma(_937, _2082, _2146);
    float _2190 = _2182 * _2086;
    float _2192 = _2178 * _2178;
    float _2194 = fma(_927, _2082, _2186);
    float _2196 = fma(_2178, -2.0, 3.0);
    float _2198 = -_2190;
    float _2200 = fma(_2170, _2082, _2198);
    float _2202 = _2184 * _2082;
    float _2204 = _2190;
    float _2206 = _2146;
    float _2208 = _2144;
    if (_2122)
    {
        _2204 = _2184;
    }
    float _2210 = _2204;
    float _2212 = _2192 * _2196;
    float _2214 = _2210;
    if (!_2122)
    {
        float _2216 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2184);
        _2214 = _2216;
    }
    float _2218 = _2214;
    float _2220 = -_2202;
    float _2222 = fma(_2182, _2084, _2220);
    float _2224 = _2170 * _2084;
    float _2226 = _2200 * _2088;
    if (_2122)
    {
        _2206 = _2170;
    }
    float _2228 = _2206;
    float _2230 = _2228;
    if (!_2122)
    {
        float _2232 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2170);
        _2230 = _2232;
    }
    float _2234 = _2230;
    float _2236 = -_2224;
    float _2238 = fma(_2184, _2086, _2236);
    float _2240 = fma(_981, _2086, _2194);
    float _2242 = _638 * _2218;
    float _2244 = _644 * _2226;
    float _2246 = _2238 * _2088;
    float _2248 = _638 * _2226;
    float _2250 = _646 * _2226;
    float _2252 = _2222 * _2088;
    float _2254 = fma(_945, _2246, _2244);
    float _2256 = fma(_1161, _2086, _2164);
    float _2258 = fma(_927, _2246, _2248);
    float _2260 = fma(_937, _2246, _2250);
    float _2262 = fma(_1017, _2086, _2188);
    float _2264 = _644 * _2218;
    float _2266 = _646 * _2218;
    float _2268 = fma(_1161, _2252, _2254);
    float _2270 = fma(_981, _2252, _2258);
    float _2272 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2274 = fma(_1017, _2252, _2260);
    out.m_93.x = _2240;
    out.m_93.y = _2256;
    out.m_93.z = _2262;
    float _2276 = _2268;
    if (_2122)
    {
        _2208 = _2182;
    }
    float _2278 = _2208;
    float _2280 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2272);
    float _2282 = _2278;
    if (!_2122)
    {
        float _2284 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2182);
        _2282 = _2284;
    }
    float _2286 = _2282;
    out.m_95.x = _2270;
    out.m_95.y = _2268;
    out.m_95.z = _2274;
    float _2288 = fma(_927, _2286, _2242);
    float _2290 = in.m_73.w;
    float _2292 = fma(_945, _2286, _2264);
    float _2294 = fma(_937, _2286, _2266);
    float _2296 = fma(_981, _2234, _2288);
    float _2298 = -_2212;
    float _2300 = _2298 + 1.0;
    float _2302 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2304 = fma(_1161, _2234, _2292);
    float _2306 = fma(_1017, _2234, _2294);
    bool _2308 = _816 <= 8000.0;
    bool _2310 = isnan(_816);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(8000.0);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2212);
    float _2322 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2302);
    float _2324 = _2322;
    if (!_1461)
    {
        _2276 = 1.0;
    }
    float _2326 = _2276;
    out.m_97.x = _2296;
    out.m_97.y = _2304;
    out.m_97.z = _2306;
    float _2328 = _2318 * _2320;
    float _2330 = _2322 + _1481;
    float _2332 = _2326;
    if (_1461)
    {
        bool _2334 = _1577 >= _1537;
        bool _2336 = isnan(_1577);
        bool _2338 = _2334 || _2336;
        bool _2340 = isnan(_1537);
        bool _2342 = _2338 || _2340;
        float _2344 = float(_2342);
        _2332 = _2344;
    }
    float _2346 = _2332;
    float _2348 = _1590 * _2158;
    float _2350 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2352 = _2330 * 0.5;
    float _2354 = _2346 * _1664;
    float _2356 = _1934 * _2350;
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    bool _2360 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2362 = isnan(_1686);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2368 = _2364 || _2366;
    out.m_99.z = _2352;
    out.m_99.w = _1481;
    float _2370 = -_2358;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_101.w = _2290;
    float _2374 = -_2354;
    float _2376 = fma(_2374, _2372, 1.0);
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    out.gl_Position.x = _1515;
    out.gl_Position.y = _1517;
    out.gl_Position.z = _2322;
    out.gl_Position.w = _1481;
    float _2380 = _2378 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2382 = _1590 * _2154;
    float _2384 = _2378;
    float _2386 = _1515;
    if (!_2368)
    {
        _2384 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2388 = _2384;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2368)
    {
        _1962 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2394 = _1962;
    out.m_103.x = _2380;
    float _2396 = _2394;
    float _2398 = _2394;
    if (!_2368)
    {
        _1491 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2400 = _1491;
    float _2402 = _2400;
    float _2404 = _2400;
    if (!_2368)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _2324;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2368)
    {
        _1525 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2412 = _1525;
    float _2414 = _2412;
    float _2416 = _2412;
    if (!_2368)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2418 = _2386;
    float _2420 = _1910 * _2154;
    float _2422 = fma(_1906, _2382, _1584);
    float _2424 = fma(_1908, _2382, _1586);
    float _2426 = fma(_1590, _2420, _1588);
    out.m_105.x = _2422;
    out.m_105.y = _2424;
    out.m_105.z = _2426;
    out.m_105.w = _2348;
    bool _2428 = !_2368;
    float _2430 = _2418;
    float _2432 = _2418;
    if (!_2428)
    {
        bool _2434 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2436 = isnan(_1686);
        bool _2438 = _2434 || _2436;
        bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2442 = _2438 || _2440;
        if (!_2442)
        {
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2446 = _1686 + _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2448;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2456 = 1.0 / _2450;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2474 = _2446 * _2456;
            float _2476 = precise::clamp(_2474, 0.0, 1.0);
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2482 = fma(_2476, _2454, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2486;
            _2432 = _2490;
            _2392 = _2482;
            _2416 = _2488;
            _2410 = _2484;
            _2398 = _2492;
            _2494 = true;
        }
        else
        {
            bool _2496 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2498 = isnan(_1686);
            bool _2500 = _2496 || _2498;
            bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2504 = _2500 || _2502;
            if (!_2504)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2506 = _2390;
            _2392 = _2506;
            if (!_2504)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2508 = _2402;
            _2404 = _2508;
            if (!_2504)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2510 = _2408;
            _2410 = _2510;
            if (!_2504)
            {
                _2414 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2512 = _2414;
            _2416 = _2512;
            if (!_2504)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2514 = _2430;
            _2432 = _2514;
            if (!_2504)
            {
                _2396 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2516 = _2396;
            bool _2518 = !_2504;
            _2398 = _2516;
            if (!_2518)
            {
                bool _2520 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2522 = isnan(_1686);
                bool _2524 = _2520 || _2522;
                bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2528 = _2524 || _2526;
                if (!_2528)
                {
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2532 = _1686 + _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2534;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2542 = 1.0 / _2536;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2560 = _2532 * _2542;
                    float _2562 = precise::clamp(_2560, 0.0, 1.0);
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2568 = fma(_2562, _2540, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2572;
                    _2432 = _2576;
                    _2392 = _2568;
                    _2416 = _2574;
                    _2410 = _2570;
                    _2398 = _2578;
                    _2494 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2416 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2398 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2494 = false;
    float _2580 = _2404;
    float _2582 = _2432;
    float _2584 = _2392;
    float _2586 = _2416;
    float _2588 = _2410;
    float _2590 = _2398;
    float _2592 = fma(_2304, -0.5, 0.5);
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = -_2580;
    float _2598 = _2596 + _2582;
    float _2600 = -_2584;
    float _2602 = _2600 + _2586;
    float _2604 = -_2588;
    float _2606 = _2604 + _2590;
    bool _2608 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2610 = fma(_2594, _2598, _2580);
    float _2612 = fma(_2594, _2602, _2584);
    float _2614 = fma(_2594, _2606, _2588);
    float _2616 = _2610 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2618 = fma(_2612, 0.298911988735198974609375, _2616);
    float _2620 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2622 = fma(_2614, 0.114477999508380889892578125, _2618);
    out.m_103.w = _2620;
    float _2624 = -_2622;
    float _2626 = _2612 + _2624;
    float _2628 = -_2622;
    float _2630 = _2610 + _2628;
    float _2632 = -_2622;
    float _2634 = _2614 + _2632;
    out.m_107.x = 0.0;
    float _2636 = fma(_2626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    float _2638 = fma(_2630, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    float _2640 = fma(_2634, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    out.m_109.x = _2636;
    out.m_109.y = _2638;
    out.m_109.z = _2640;
    if (!_2608)
    {
        return out;
    }
    float _2642 = -_1367;
    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2646 = -_1369;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2650 = -_1371;
    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2648, _2648, _2654);
    float _2658 = fma(_2652, _2652, _2656);
    float _2660 = sqrt(_2658);
    float _2662 = rsqrt(_2658);
    float _2664 = -_2660;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2668 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2670 = precise::clamp(_2668, 0.0, 1.0);
    float _2672 = _2648 * _2662;
    float _2674 = _2644 * _2662;
    float _2676 = abs(_2670);
    float _2678 = log2(_2676);
    float _2680 = _2652 * _2662;
    float _2682 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2684 = _2304 * _2674;
    float _2686 = -_2674;
    float _2688 = -_2682;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2688);
    float _2692 = fma(_2296, _2672, _2684);
    float _2694 = -_2680;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2690);
    float _2698 = fma(_2306, _2680, _2692);
    float _2700 = precise::clamp(_2698, 0.0, 1.0);
    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2704 = _2696 + _2702;
    float _2706 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = exp2(_2706);
    float _2714 = _2712 * _2710;
    float _2716 = _2700 * _2714;
    float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2722 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _2718;
    out.m_107.y = _2720;
    out.m_107.z = _2722;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2494 = false;
    bool _344 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_56.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_59.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_144);
        out.gl_Position.z = _2778;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = 0.0;
    if (_156)
    {
        float _164 = float(_128);
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    if (_172)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _138;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    int _176 = 0;
    if (_172)
    {
        float _178 = _174 * 5.0;
        _176 = as_type<int>(_178);
    }
    int _180 = _176;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_180);
        out.gl_Position.z = _2846;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_63.y;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_63.z;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _182 * _182;
    float _198 = in.m_63.x;
    float _200 = _186 * _186;
    float _202 = in.m_65.x;
    float _204 = fma(_188, _188, _196);
    float _206 = in.m_67.x;
    float _208 = fma(_190, _190, _200);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _208);
    float _214 = sqrt(_210);
    float _216 = in.m_69.x;
    float _218 = in.m_69.y;
    float _220 = in.m_69.z;
    float _222 = sqrt(_212);
    bool _224 = _214 > 0.0;
    bool _226 = _222 > 0.0;
    float _228 = _182 * _218;
    float _230 = _188 * _218;
    float _232 = _192 * _218;
    float _234 = 0.0;
    float _236 = _212;
    float _238 = _214;
    if (_224)
    {
        float _240 = rsqrt(_210);
        _234 = _240;
    }
    float _242 = _234;
    float _244 = fma(_216, _198, _228);
    float _246 = fma(_216, _202, _230);
    float _248 = fma(_216, _206, _232);
    float _250 = 0.0;
    float _252 = _244;
    float _254 = _246;
    if (!_224)
    {
        _250 = 0.0;
    }
    float _256 = _250;
    float _258 = fma(_186, _220, _244);
    float _260 = fma(_190, _220, _246);
    float _262 = 0.0;
    float _264 = _256;
    if (!_224)
    {
        _252 = 0.0;
        _262 = 0.0;
    }
    float _266 = _252;
    float _268 = _262;
    float _270 = 0.0;
    float _272 = _266;
    float _274 = _268;
    if (_226)
    {
        float _276 = rsqrt(_212);
        _270 = _276;
    }
    float _278 = _270;
    if (!_226)
    {
        _254 = 0.0;
    }
    float _280 = _254;
    float _282 = fma(_194, _220, _248);
    float _284 = _280;
    if (_224)
    {
        float _286 = _242 * _188;
        _264 = _286;
    }
    float _288 = _264;
    float _290 = _288;
    if (!_226)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _292 = _236;
    float _294 = _238;
    float _296 = _294;
    float _298 = _292;
    if (_224)
    {
        float _300 = _242 * _182;
        _272 = _300;
    }
    float _302 = _272;
    float _304 = _302;
    if (_224)
    {
        float _306 = _242 * _192;
        _274 = _306;
    }
    float _308 = _274;
    float _310 = _308;
    if (_226)
    {
        float _312 = _278 * _190;
        _284 = _312;
    }
    float _314 = _284;
    if (_226)
    {
        float _316 = _278 * _186;
        _296 = _316;
    }
    float _318 = _296;
    if (_226)
    {
        float _320 = _278 * _194;
        _298 = _320;
    }
    float _322 = _298;
    bool _324 = !_184;
    float _342;
    if (!_324)
    {
        float _326 = in.m_71.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_128);
        float _348 = 1.0 / _346;
        float _350 = _160 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_56.x;
    float _356 = in.m_56.y;
    float _358 = in.m_56.z;
    float _360 = in.m_65.w;
    float _362 = in.m_67.w;
    float _364 = _188 * _356;
    float _366 = _192 * _356;
    float _368 = fma(_202, _354, _364);
    float _370 = fma(_206, _354, _366);
    float _372 = fma(_190, _358, _368);
    float _374 = fma(_194, _358, _370);
    float _376 = _372 + _360;
    float _378 = _374 + _362;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _382 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _384 = floor(_380);
    float _386 = floor(_382);
    float _388 = -_384;
    float _390 = _380 + _388;
    float _392 = -_386;
    float _394 = _382 + _392;
    float2 _3151 = float2(_390, _394);
    float _396 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3151, float2(0.0), isnan(_3151)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3151, float2(0.0), isnan(_3151)), level(0.0)).x;
    float _398 = _182 * _356;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _352 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = fma(_198, _354, _398);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _416 = _352 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _418;
    float _422 = 1.0 / _406;
    float _424 = fma(_186, _358, _412);
    float _426 = in.m_63.w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = _160 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = 1.0 / _410;
    float _444 = _436 * 0.15915493667125701904296875;
    float _446 = in.m_73.y;
    float _448 = in.m_73.z;
    float _450 = _416 * _422;
    float _452 = 1.0 / _420;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _456 = _352 + _454;
    float _458 = _402 * _442;
    float _460 = in.m_75.x;
    float _462 = in.m_75.y;
    float _464 = in.m_75.z;
    float _466 = fma(_430, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = fma(_440, _458, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = _424 + _426;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = _456 * _452;
    float _482 = fma(_474, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _484 = _258 * _258;
    float _486 = fma(_434, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = fma(_478, _458, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_260, _260, _484);
    bool _496 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _498 = isnan(_352);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = fma(_490, _458, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _510 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_352);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _444 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = fma(_282, _282, _494);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _532;
    float _536 = -_506;
    float _538 = _536 + 1.0;
    float _540 = fma(_530, _480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _542 = _460 > 0.0;
    float _544 = _444 * 6.283185482025146484375;
    float _546 = sin(_544);
    bool _548 = _460 >= 0.0;
    bool _550 = isnan(_460);
    bool _552 = _548 || _550;
    bool _554 = isnan(0.0);
    bool _556 = _552 || _554;
    float _558 = _520 * _538;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _560;
    float _564 = fma(_534, _480, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _566 = _556 ? 0 : 1;
    float _568 = fma(_562, _480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _570 = rsqrt(_526);
    int _572 = ~_566;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    bool _578 = _524 >= 0.0;
    bool _580 = isnan(_524);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    int _588 = _576;
    if (!_542)
    {
        int _590 = ~_566;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    bool _596 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_352);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _546 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _610 = -_520;
    float _612 = _610 + 1.0;
    bool _614 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _616 = isnan(_352);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    bool _626 = _524 > 0.0;
    float _628 = _606 * _612;
    float _630 = -_606;
    float _632 = _630 + 1.0;
    float _634 = _470 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _636 = float(_594);
    float _638 = _260 * _570;
    float _640 = _624 * _632;
    float _642 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[11].x, _634);
    float _644 = _258 * _570;
    float _646 = _282 * _570;
    float _648 = _466 * _640;
    float _650 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].z, _642);
    float _652 = -_624;
    float _654 = _652 + 1.0;
    float _656 = _482 * _640;
    int _658 = _586 ? 0 : 1;
    float _660 = _608 * _636;
    float _662 = _650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _664 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].x, _648);
    int _666 = ~_658;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = _660 * _446;
    int _674 = _670;
    if (!_626)
    {
        int _676 = ~_658;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    float _682 = fma(_468, _628, _664);
    float _684 = _470 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _686 = _524 * _524;
    float _688 = float(_680);
    float _690 = 1.0 / _662;
    float _692 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    float _694 = _486 * _640;
    float _696 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].y, _656);
    float _698 = _686 * _688;
    float _700 = _644 * _302;
    float _702 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].z, _692);
    float _704 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[143].z, _694);
    float _706 = fma(_492, _628, _696);
    float _708 = fma(_638, _288, _700);
    float _710 = _702 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _712 = fma(_508, _628, _704);
    float _714 = in.m_77.x;
    float _716 = in.m_77.y;
    float _718 = in.m_77.z;
    float _720 = fma(_646, _308, _708);
    float _722 = _710 + _662;
    float _724 = fma(_568, _558, _682);
    float _726 = fma(_540, _558, _706);
    float _728 = fma(_564, _558, _712);
    float _730 = _722 * _690;
    float _732 = _730 * 0.5;
    float _734 = abs(_720);
    bool _736 = _734 > 0.99989998340606689453125;
    float _738 = _698 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _740 = _672 * 0.01745329238474369049072265625;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[30].w, _742);
    float _746 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].y, _726);
    float _748 = _738 * _448;
    float _750 = _740 * 0.15915493667125701904296875;
    float _752 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].x, _724);
    float _754 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[146].z, _728);
    float _756 = 1.0 / _744;
    float _758 = _748 * (-0.01745329238474369049072265625);
    float _760 = in.m_71.x;
    if (_736)
    {
        float _762 = fma(_314, 0.001000000047497451305389404296875, _288);
        _290 = _762;
    }
    float _764 = _290;
    float _766 = _758 * 0.15915493667125701904296875;
    if (_736)
    {
        float _768 = fma(_322, 0.001000000047497451305389404296875, _308);
        _310 = _768;
    }
    float _770 = _310;
    float _772 = _746 * _716;
    float _774 = -_764;
    float _776 = _646 * _774;
    float _778 = _766 * 6.283185482025146484375;
    float _780 = sin(_778);
    if (_736)
    {
        float _782 = fma(_318, 0.001000000047497451305389404296875, _302);
        _304 = _782;
    }
    float _784 = _304;
    float _786 = -_770;
    float _788 = _644 * _786;
    float _790 = -_770;
    float _792 = -_776;
    float _794 = fma(_638, _790, _792);
    float _796 = _752 * _714;
    float _798 = _754 * _718;
    float _800 = -_784;
    float _802 = _638 * _800;
    float _804 = -_784;
    float _806 = -_788;
    float _808 = fma(_646, _804, _806);
    float _810 = _766 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _816 = _756 * _814;
    float _818 = _794 * _794;
    float _820 = -_764;
    float _822 = -_802;
    float _824 = fma(_644, _820, _822);
    float _826 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _828 = fma(_808, _808, _818);
    bool _830 = _816 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _832 = _750 * 6.283185482025146484375;
    float _834 = sin(_832);
    bool _836 = _816 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _838 = fma(_824, _824, _828);
    float _840 = _780 * _464;
    float _842 = _470 + _826;
    float _844 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _848 = _750 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _812 * _464;
    float _854 = -_840;
    float _856 = fma(_812, _462, _854);
    float _858 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _860 = 2;
    if (!_830)
    {
        _860 = 1;
    }
    int _862 = _860;
    float _864 = fma(_780, _462, _852);
    bool _866 = !_830;
    int _868 = _866 ? 0 : 1;
    float _870 = _834 * _460;
    float _872 = rsqrt(_838);
    int _874 = _862;
    if (!_836)
    {
        _874 = _868;
    }
    int _876 = _874;
    int _878 = _876 << 6;
    float _880 = _850 * _460;
    float _882 = -_870;
    float _884 = fma(_864, _850, _882);
    int _886 = _878 + 96;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    bool _905 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _913 = _909 || _911;
    float _915 = fma(_864, _834, _880);
    float _917 = _842 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _919 = _842 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _921 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _915);
    float _923 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[126].x, _917);
    float _925 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[127].x, _919);
    float _927 = _808 * _872;
    float _929 = _846 * _921;
    float _931 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[126].z, _923);
    float _933 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[127].z, _925);
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _856);
    float _937 = _824 * _872;
    float _939 = _931 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _943 = _844 * _935;
    float _945 = _794 * _872;
    float _947 = trunc(_939);
    int _949 = int(_947);
    int _951 = _878 + 104;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.vp_c15)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.vp_c15)._m0[int(_963)][_965];
    float _969 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _971 = _644 * _937;
    float _973 = _943 * _638;
    float _975 = _943 * _646;
    float _977 = _858 * _969;
    float _979 = -_971;
    float _981 = fma(_646, _945, _979);
    float _983 = trunc(_941);
    int _985 = int(_983);
    int _987 = _878 + 48;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    float _1005 = fma(_929, _927, _973);
    float _1007 = _638 * _945;
    float _1009 = fma(_929, _937, _975);
    float _1011 = _943 * _644;
    float _1013 = fma(_977, _981, _1005);
    float _1015 = -_1007;
    float _1017 = fma(_644, _927, _1015);
    int _1019 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1021 = _949 + _1019;
    int _1023 = _1021 + 1;
    int _1025 = _878 + 64;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    uint _1029 = uint(int(uint(int(_1027)) >> uint(2)));
    int _1031 = int(_1027) & 3;
    float _1033 = (*spvDescriptorSet0.vp_c15)._m0[int(_1029)][_1031];
    int _1035 = int(_1027) + 1;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    int _1039 = _1035 & 3;
    float _1041 = (*spvDescriptorSet0.vp_c15)._m0[int(_1037)][_1039];
    float _1043 = _376 + _1013;
    float _1045 = fma(_977, _1017, _1009);
    bool _1047 = _1023 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1049 = _646 * _927;
    float _1051 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1043);
    float _1053 = _378 + _1045;
    int _1055 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1057 = _985 + _1055;
    int _1059 = _1057 + 1;
    int _1061 = _878 + 56;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.vp_c15)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    float _1079 = fma(_760, 100.0, _1051);
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1083 = _1053 + _1081;
    int _1085 = _1023 | _1059;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1089 = _1043 + _1087;
    float _1091 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1053);
    float _1093 = _1083 * _1083;
    bool _1095 = _1085 < 0;
    bool _1097 = _1095 || _1047;
    int _1099 = _878 + 72;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    uint _1103 = uint(int(uint(int(_1101)) >> uint(2)));
    int _1105 = int(_1101) & 3;
    float _1107 = (*spvDescriptorSet0.vp_c15)._m0[int(_1103)][_1105];
    int _1109 = int(_1101) + 1;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    int _1113 = _1109 & 3;
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[int(_1111)][_1113];
    float _1117 = _1079 * 2.0;
    float _1119 = fma(_1089, _1089, _1093);
    float _1121 = fma(_760, 100.0, _1091);
    float _1123 = _842 * _903;
    float _1125 = _1117 * 0.15915493667125701904296875;
    float _1127 = sqrt(_1119);
    float _1129 = _1121 * 2.0;
    int _1131 = _878 + 80;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
    int _1137 = int(_1133) & 3;
    float _1139 = (*spvDescriptorSet0.vp_c15)._m0[int(_1135)][_1137];
    int _1141 = int(_1133) + 1;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    int _1145 = _1141 & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    bool _1149 = _1059 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1151 = _1149 || _1097;
    float _1153 = fma(_376, _895, _1123);
    float _1155 = _1129 * 0.15915493667125701904296875;
    float _1157 = fma(_929, _945, _1011);
    float _1159 = -_1049;
    float _1161 = fma(_638, _937, _1159);
    float _1163 = _1125 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = fma(_378, _959, _1153);
    float _1169 = fma(_977, _1161, _1157);
    float _1171 = _1167 + _967;
    float _1173 = _470 + _1169;
    float _1175 = _1155 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    bool _1179 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1181 = _1023;
    int _1183 = as_type<int>(_1153);
    int _1185 = as_type<int>(_967);
    float _1187 = _1167;
    float _1189 = _1053;
    float _1191 = _1083;
    float _1193 = as_type<float>(_876);
    float _1195 = _760;
    if (!_1151)
    {
        int _1197 = _1059 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1199 = _1197 + _1023;
        _1181 = _1199;
    }
    int _1201 = _1181;
    float _1203 = _842 * _1003;
    float _1205 = fma(_376, _995, _1203);
    float _1207 = _1157;
    if (!_1151)
    {
        float _1209 = floor(_939);
        _1207 = _1209;
    }
    float _1211 = _1207;
    if (!_1151)
    {
        int _1213 = _1201 << 2;
        _1183 = _1213;
    }
    int _1215 = _1183;
    float _1217 = _842 * _1041;
    float _1219 = fma(_1165, 0.100000001490116119384765625, _1173);
    if (!_1151)
    {
        int _1221 = 12 & _1215;
        _1185 = _1221;
    }
    int _1223 = _1185;
    float _1225 = fma(_376, _1033, _1217);
    float _1227 = as_type<float>(_1223);
    float _1229 = _1225;
    if (!_1179)
    {
        _1187 = _1043;
    }
    float _1231 = _1187;
    float _1233 = 1.0 / _1171;
    float _1235 = fma(_1177, 0.100000001490116119384765625, _1219);
    float _1237 = fma(_378, _1069, _1205);
    int _1239 = as_type<int>(_1069);
    float _1241 = _1231;
    if (!_1151)
    {
        uint _1243 = uint(int(uint(_1201) >> uint(2)));
        _1239 = int(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1237 + _1077;
    int _1249 = _1245;
    if (!_1151)
    {
        int _1251 = _1245 << 4;
        int _1253 = _1251 + _1223;
        _1249 = _1253;
    }
    int _1255 = _1249;
    if (!_1179)
    {
        _1227 = _1235;
    }
    float _1257 = _1227;
    float _1259 = fma(_378, _1107, _1225);
    float _1261 = _1259 + _1115;
    bool _1263 = !_1179;
    float _1265 = _1257;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1127 + _1269;
        float _1273 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1119);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = sin(_1285);
        float _1289 = _1283 + (-1.0);
        float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = fma(_1287, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1295 = fma(_1235, _1283, _1291);
        float _1297 = _1275 * _1293;
        float _1299 = fma(_1089, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1301 = fma(_1083, _1297, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1189 = _1301;
        _1241 = _1299;
        _1265 = _1295;
    }
    float _1303 = _1189;
    float _1305 = _1241;
    float _1307 = _1265;
    float _1309 = _1307;
    float _1311 = _1305;
    if (_913)
    {
        _1191 = _1303;
    }
    float _1313 = _1191;
    float _1315 = _1313;
    if (!_913)
    {
        float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1319 = _470 + _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1323 = _376 + _1321;
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = -_376;
        float _1329 = _1327 + _1305;
        float _1331 = _1319 * _1319;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _378 + _1333;
        float _1337 = -_378;
        float _1339 = _1337 + _1303;
        float _1341 = fma(_1323, _1323, _1331);
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1345 = fma(_1335, _1335, _1341);
        float _1347 = sqrt(_1345);
        float _1349 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1351 = precise::min(_1347, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1353 = _1351 * _1343;
        float _1355 = -_470;
        float _1357 = _1355 + _1307;
        float _1359 = _1349 * _1353;
        float _1361 = fma(_1357, _1359, _470);
        float _1363 = fma(_1329, _1359, _376);
        float _1365 = fma(_1339, _1359, _378);
        _1309 = _1361;
        _1311 = _1363;
        _1315 = _1365;
        _1229 = _1353;
    }
    float _1367 = _1309;
    float _1369 = _1311;
    float _1371 = _1315;
    float _1373 = _1229;
    int _1375 = _878 + 88;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    float _1393 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1395 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1397 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1399 = _1247 * _1233;
    float _1401 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1393);
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1395);
    float _1405 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1397);
    float _1407 = _470;
    if (!_1151)
    {
        int _1409 = _1255 + 400;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
        int _1415 = int(_1411) & 3;
        float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1401);
    bool _1423 = _1399 >= 0.0;
    float _1425 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1427 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1429 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1431 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1433 = _1261 * _1233;
    bool _1435 = _1399 <= 1.0;
    bool _1437 = _1435 && _1423;
    float _1439 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1443 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1429);
    float _1445 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1447 = _1433 >= 0.0;
    bool _1449 = _1447 && _1437;
    float _1451 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1455 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1445);
    bool _1459 = _1433 <= 1.0;
    bool _1461 = _1459 && _1449;
    float _1463 = -_1453;
    float _1465 = fma(_1463, _1451, 1.0);
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1471 = _842 * _1147;
    float _1473 = _1373;
    if (!_1151)
    {
        float _1475 = floor(_941);
        _1473 = _1475;
    }
    float _1477 = _1473;
    float _1479 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1483 = fma(_376, _1139, _1471);
    float _1485 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1489 = log2(_1465);
    float _1491 = _1481;
    if (_1461)
    {
        float _1493 = float(_876);
        _1193 = _1493;
    }
    float _1495 = _1193;
    float _1497 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1499 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1487);
    float _1501 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1503 = 1.0 / _1481;
    float _1505 = fma(_378, _1383, _1483);
    float _1507 = _1477;
    if (!_1151)
    {
        float _1509 = -_1477;
        float _1511 = _941 + _1509;
        _1507 = _1511;
    }
    float _1513 = _1507;
    float _1515 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1517 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1519 = _1505 + _1391;
    float _1521 = _1471;
    float _1523 = _1513;
    float _1525 = _1517;
    if (_1461)
    {
        float _1527 = rint(_1495);
        float _1529 = precise::max(_1527, 0.0);
        uint _1531 = uint(_1529);
        uint _1533 = clamp(_1531, 0u, 65535u);
        _1521 = as_type<float>(_1533);
    }
    float _1535 = _1521;
    float _1537 = _1519 * _1233;
    float _1539 = _1489 * 0.693147182464599609375;
    float _1541 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1543 = _1519;
    if (!_1151)
    {
        float _1545 = rint(_1419);
        float _1547 = precise::max(_1545, 0.0);
        uint _1549 = uint(_1547);
        uint _1551 = clamp(_1549, 0u, 65535u);
        _1543 = as_type<float>(_1551);
    }
    float _1553 = _1543;
    float _1555 = _1515 * _1503;
    float _1557 = _1517 * _1503;
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = fma(_1557, -0.5, 0.5);
    float _1563 = _1555;
    float _1565 = _1559;
    if (!_1151)
    {
        float _1567 = -_1211;
        float _1569 = _939 + _1567;
        _1563 = _1569;
    }
    float _1571 = _1563;
    float _1573 = _1177;
    if (_1461)
    {
        float3 _5052 = float3(_1399, _1433, float(as_type<int>(_1535)));
        float3 _5056 = select(_5052, float3(0.0), isnan(_5052));
        float _1575 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5056.xy, uint(rint(_5056.z)), _1537, level(0.0));
        _1573 = _1575;
    }
    float _1577 = _1573;
    float3 _5066 = float3(_1559, _1561, _1541);
    float _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5066, float3(0.0), isnan(_5066)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5066, float3(0.0), isnan(_5066)), level(0.0)).x;
    float3 _5075 = float3(_1559, _1561, _1541);
    float4 _1582 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5075, float3(0.0), isnan(_5075)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5075, float3(0.0), isnan(_5075)), level(0.0)).xyzw;
    float _1584 = _1582.x;
    float _1586 = _1582.y;
    float _1588 = _1582.z;
    float _1590 = _1582.w;
    float _1592 = _1495;
    if (!_1151)
    {
        float3 _5098 = float3(_1571, _1513, float(as_type<int>(_1553)));
        float3 _5100 = select(_5098, float3(0.0), isnan(_5098));
        float _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5100.xy, uint(rint(_5100.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5100.xy, uint(rint(_5100.z)), level(0.0)).x;
        _1592 = _1594;
    }
    float _1596 = _1592;
    float _1598 = 0.0;
    if (_1151)
    {
        _1598 = 1.0;
    }
    float _1600 = _1598;
    float _1602 = _1600;
    if (!_1151)
    {
        int _1604 = _1201 << 4;
        int _1606 = _1604 + 2048;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
        int _1612 = int(_1608) & 3;
        float _1614 = (*spvDescriptorSet0.vp_c15)._m0[int(_1610)][_1612];
        int _1616 = int(_1608) + 1;
        uint _1618 = uint(int(uint(_1616) >> uint(2)));
        int _1620 = _1616 & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        int _1624 = _1606 + 8;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
        int _1630 = int(_1626) & 3;
        float _1632 = (*spvDescriptorSet0.vp_c15)._m0[int(_1628)][_1630];
        int _1634 = int(_1626) + 1;
        uint _1636 = uint(int(uint(_1634) >> uint(2)));
        int _1638 = _1634 & 3;
        float _1640 = (*spvDescriptorSet0.vp_c15)._m0[int(_1636)][_1638];
        float _1642 = _842 * _1622;
        float _1644 = fma(_376, _1614, _1642);
        float _1646 = fma(_378, _1632, _1644);
        float _1648 = _1646 + _1640;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        float _1652 = -_1650;
        float _1654 = _1652 + _1596;
        float _1656 = fma(_1654, 500.0, 1.5);
        float _1658 = exp2(_1656);
        float _1660 = 0.0 + _1658;
        float _1662 = precise::clamp(_1660, 0.0, 1.0);
        _1602 = _1662;
    }
    float _1664 = _1602;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1668 = _1367 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1672 = _1369 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1676 = _1371 + _1674;
    float _1678 = _1668 * _1668;
    float _1680 = fma(_1672, _1672, _1678);
    float _1682 = fma(_1676, _1676, _1680);
    float _1684 = rsqrt(_1682);
    float _1686 = sqrt(_1682);
    float _1688 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1690 = _1672 * _1688;
    float _1692 = _1676 * _1688;
    float _1694 = _1690 * _1690;
    float _1696 = _1692 * _1692;
    float _1698 = _1694 + _1696;
    float _1700 = sqrt(_1698);
    bool _1702 = _1700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1706 = _1700 + _1704;
    float _1708 = _1680;
    float _1710 = _1684;
    float _1712 = _1706;
    float _1714 = _1668;
    if (_1702)
    {
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1708 = _1716;
    }
    float _1718 = _1708;
    if (_1702)
    {
        float _1720 = rsqrt(_1698);
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = _1722;
    if (_1702)
    {
        float _1726 = _1706 * _1718;
        _1712 = _1726;
    }
    float _1728 = _1712;
    if (_1702)
    {
        float _1730 = _1728 * 0.15915493667125701904296875;
        _1565 = _1730;
    }
    float _1732 = _1565;
    float _1734 = _1676;
    float _1736 = _1732;
    if (_1702)
    {
        float _1738 = _1732 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1734 = _1740;
    }
    float _1742 = _1734;
    float _1744 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1746 = precise::max(0.0, _1744);
    float _1748 = _1718;
    float _1750 = _1746;
    if (_1702)
    {
        float _1752 = _1732 * 6.283185482025146484375;
        float _1754 = cos(_1752);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = -_1688;
    float _1760 = -_1746;
    float _1762 = fma(_1668, _1758, _1760);
    if (_1702)
    {
        float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1714 = _1764;
    }
    float _1766 = _1714;
    float _1768 = _1766;
    float _1770 = _1742;
    if (_1702)
    {
        float _1772 = fma(_1742, _1766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = _1774;
    if (!_1702)
    {
        _1770 = _1690;
    }
    float _1778 = _1770;
    float _1780 = _1778;
    float _1782 = _1756;
    if (_1702)
    {
        float _1784 = _1756 + (-1.0);
        _1750 = _1784;
    }
    float _1786 = _1750;
    float _1788 = _1786;
    if (_1702)
    {
        float _1790 = _1722 * _1774;
        _1523 = _1790;
    }
    float _1792 = _1523;
    int _1794 = as_type<int>(_1792);
    if (!_1702)
    {
        _1776 = _1762;
    }
    float _1796 = _1776;
    float _1798 = _1796;
    if (_1702)
    {
        float _1800 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1800;
    }
    float _1802 = _1736;
    if (_1702)
    {
        float _1804 = _1690 * _1792;
        _1780 = _1804;
    }
    float _1806 = _1780;
    if (!_1702)
    {
        _1788 = _1692;
    }
    float _1808 = _1788;
    float _1810 = _1808;
    if (_1702)
    {
        float _1812 = _1692 * _1792;
        _1810 = _1812;
    }
    float _1814 = _1810;
    if (!_1702)
    {
        _1724 = _1694;
    }
    float _1816 = _1724;
    float _1818 = _1816;
    if (_1702)
    {
        float _1820 = fma(_1762, _1756, _1802);
        _1798 = _1820;
    }
    float _1822 = _1798;
    if (_1702)
    {
        float _1824 = _1806 * _1806;
        _1818 = _1824;
    }
    float _1826 = _1818;
    if (!_1702)
    {
        _1782 = _1696;
    }
    float _1828 = _1782;
    float _1830 = _1828;
    if (_1702)
    {
        float _1832 = _1814 * _1814;
        _1830 = _1832;
    }
    float _1834 = _1830;
    float _1836 = fma(_1822, _1822, _1826);
    float _1838 = _1836 + _1834;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = rsqrt(_1838);
    float _1848 = -_1844;
    float _1850 = _1848 + 1.0;
    float _1852 = abs(_1850);
    float _1854 = log2(_1852);
    float _1856 = _1846 * _1806;
    float _1858 = _1846 * _1822;
    float _1860 = _1846 * _1814;
    float _1862 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1864 = -_1862;
    float _1866 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1864);
    float _1868 = -_1860;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1866);
    float _1872 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1874 = fma(_1870, -0.5, 0.5);
    float _1876 = fma(_1870, 0.5, 0.5);
    float _1878 = exp2(_1872);
    float _1880 = fma(_1876, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1882 = fma(_1876, _1880, -0.212114393711090087890625);
    float _1884 = _1858 + 1.0;
    float _1886 = sqrt(_1874);
    float _1888 = fma(_1876, _1882, 1.570728778839111328125);
    float _1890 = -_1858;
    float _1892 = fma(_1878, _1884, _1890);
    float _1894 = fma(_1892, 0.5, 0.5);
    float _1896 = _1886 * 0.636619746685028076171875;
    float _1898 = -_1888;
    float _1900 = fma(_1896, _1898, 1.0);
    float2 _5575 = float2(_1900, _1894);
    float3 _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5575, float2(0.0), isnan(_5575)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5575, float2(0.0), isnan(_5575)), level(0.0)).xyz;
    float _1906 = _1904.x;
    float _1908 = _1904.y;
    float _1910 = _1904.z;
    float _1912 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1914 = in.m_79.y;
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1920 = _1912 * _760;
    int _1922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1924 = _1922 != 0;
    float _1926 = in.m_71.w;
    int _1928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1930 = _1928 != 0;
    float _1932 = -_396;
    float _1934 = _1932 + 1.0;
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1938 = _1936 != 0;
    float _1940 = trunc(_1920);
    int _1942 = int(_1940);
    float _1944 = in.m_71.y;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1948 = _1946 != 0;
    float _1950 = in.m_79.x;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1954 = _1888;
    float _1956 = _1926;
    bool _1958 = _1938;
    float _1960 = _1914;
    float _1962 = _1934;
    if (_1924)
    {
        float _1964 = in.m_71.z;
        _1954 = _1964;
    }
    float _1966 = _1954;
    out.m_81.x = _1369;
    out.m_81.y = _1367;
    out.m_81.z = _1371;
    float _1968 = -_1914;
    float _1970 = _1968 + 1.0;
    int _1972 = _1942 << 4;
    int _1974 = _1972 + 1712;
    float _1976 = abs(_816);
    float _1978 = log2(_1976);
    uint _1980 = uint(int(uint(_1974) >> uint(2)));
    uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
    int _1984 = int(_1980) & 3;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[int(_1982)][_1984];
    int _1988 = int(_1980) + 1;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    int _1992 = _1988 & 3;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[int(_1990)][_1992];
    bool _1996 = _1926 > 0.5;
    int _1998 = _1996 ? as_type<int>(_1970) : as_type<int>(_1914);
    float _2000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2002 = _1944 > 0.5;
    int _2004 = _1974 + 8;
    uint _2006 = uint(int(uint(_2004) >> uint(2)));
    uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
    int _2010 = int(_2006) & 3;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[int(_2008)][_2010];
    float _2014 = _1938 ? as_type<float>(_1998) : _1914;
    int _2016 = _1998;
    bool _2018 = _1996;
    if (_1930)
    {
        float _2020 = -_1950;
        float _2022 = _2020 + 1.0;
        _2016 = as_type<int>(_2022);
    }
    int _2024 = _2016;
    if (_1930)
    {
        bool _2026 = _760 > 0.5;
        _2018 = _2026;
    }
    bool _2028 = _2018;
    if (_1924)
    {
        float _2030 = -_1950;
        float _2032 = _2030 + 1.0;
        _1794 = as_type<int>(_2032);
    }
    int _2034 = _1794;
    if (!_1930)
    {
        _1956 = _1950;
    }
    float _2036 = _1956;
    float _2038 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2040 = _2036;
    if (_1924)
    {
        bool _2042 = _1966 > 0.5;
        _1958 = _2042;
    }
    bool _2044 = _1958;
    float _2046 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1930)
    {
        float _2050 = _2028 ? as_type<float>(_2024) : _1950;
        _2040 = _2050;
    }
    float _2052 = _2040;
    if (!_1924)
    {
        _1195 = _1950;
    }
    float _2054 = _1195;
    float _2056 = _2054;
    if (_1948)
    {
        float _2058 = _2002 ? _1970 : _1914;
        _1960 = _2058;
    }
    float _2060 = _1960;
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1924)
    {
        float _2064 = _2044 ? as_type<float>(_2034) : _1950;
        _2056 = _2064;
    }
    float _2066 = _2056;
    float _2068 = _2046 * _2000;
    float _2070 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2072 = _2062 * _1916;
    float _2074 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2076 = _2070 * _1952;
    float _2078 = _2074 * _2048;
    float _2080 = exp2(_2038);
    float _2082 = in.m_83.x;
    float _2084 = in.m_83.y;
    float _2086 = in.m_83.z;
    float _2088 = in.m_83.w;
    bool _2090 = _856 != 0.0;
    bool _2092 = isnan(_856);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(0.0);
    bool _2098 = _2094 || _2096;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2106 = _915 == 0.0;
    bool _2108 = !_2098;
    bool _2110 = _2106 && _2108;
    float _2112 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2114 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_85.x = _2072;
    out.m_85.y = _2076;
    out.m_85.z = _2078;
    out.m_85.w = _2068;
    bool _2120 = _884 == 0.0;
    bool _2122 = _2120 && _2110;
    float _2124 = _1986 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2126 = _1994 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_87.x = _2112;
    out.m_87.y = _2116;
    out.m_87.z = _2118;
    float _2128 = exp2(_1918);
    float _2130 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2132 = in.m_89.x;
    float _2134 = in.m_89.y;
    float _2136 = in.m_89.z;
    float _2138 = _2012 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2142 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2144 = _644 * _2084;
    float _2146 = _646 * _2084;
    out.m_91.x = _2140;
    out.m_91.y = _2130;
    out.m_91.z = _2142;
    out.m_91.w = _2114;
    float _2148 = -_2128;
    float _2150 = _2148 + 1.0;
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2154 = _2152 * _1579;
    float _2156 = -_2152;
    float _2158 = _2156 + 1.0;
    float _2160 = _780 * _2136;
    float _2162 = _812 * _2136;
    float _2164 = fma(_945, _2082, _2144);
    float _2166 = -_2160;
    float _2168 = fma(_812, _2134, _2166);
    float _2170 = fma(_780, _2134, _2162);
    float _2172 = _834 * _2168;
    float _2174 = _850 * _2168;
    float _2176 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = -_2172;
    float _2182 = fma(_850, _2132, _2180);
    float _2184 = fma(_834, _2132, _2174);
    float _2186 = _638 * _2084;
    float _2188 = fma(_937, _2082, _2146);
    float _2190 = _2182 * _2086;
    float _2192 = _2178 * _2178;
    float _2194 = fma(_927, _2082, _2186);
    float _2196 = fma(_2178, -2.0, 3.0);
    float _2198 = -_2190;
    float _2200 = fma(_2170, _2082, _2198);
    float _2202 = _2184 * _2082;
    float _2204 = _2190;
    float _2206 = _2146;
    float _2208 = _2144;
    if (_2122)
    {
        _2204 = _2184;
    }
    float _2210 = _2204;
    float _2212 = _2192 * _2196;
    float _2214 = _2210;
    if (!_2122)
    {
        float _2216 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2184);
        _2214 = _2216;
    }
    float _2218 = _2214;
    float _2220 = -_2202;
    float _2222 = fma(_2182, _2084, _2220);
    float _2224 = _2170 * _2084;
    float _2226 = _2200 * _2088;
    if (_2122)
    {
        _2206 = _2170;
    }
    float _2228 = _2206;
    float _2230 = _2228;
    if (!_2122)
    {
        float _2232 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2170);
        _2230 = _2232;
    }
    float _2234 = _2230;
    float _2236 = -_2224;
    float _2238 = fma(_2184, _2086, _2236);
    float _2240 = fma(_981, _2086, _2194);
    float _2242 = _638 * _2218;
    float _2244 = _644 * _2226;
    float _2246 = _2238 * _2088;
    float _2248 = _638 * _2226;
    float _2250 = _646 * _2226;
    float _2252 = _2222 * _2088;
    float _2254 = fma(_945, _2246, _2244);
    float _2256 = fma(_1161, _2086, _2164);
    float _2258 = fma(_927, _2246, _2248);
    float _2260 = fma(_937, _2246, _2250);
    float _2262 = fma(_1017, _2086, _2188);
    float _2264 = _644 * _2218;
    float _2266 = _646 * _2218;
    float _2268 = fma(_1161, _2252, _2254);
    float _2270 = fma(_981, _2252, _2258);
    float _2272 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2274 = fma(_1017, _2252, _2260);
    out.m_93.x = _2240;
    out.m_93.y = _2256;
    out.m_93.z = _2262;
    float _2276 = _2268;
    if (_2122)
    {
        _2208 = _2182;
    }
    float _2278 = _2208;
    float _2280 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2272);
    float _2282 = _2278;
    if (!_2122)
    {
        float _2284 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2182);
        _2282 = _2284;
    }
    float _2286 = _2282;
    out.m_95.x = _2270;
    out.m_95.y = _2268;
    out.m_95.z = _2274;
    float _2288 = fma(_927, _2286, _2242);
    float _2290 = in.m_73.w;
    float _2292 = fma(_945, _2286, _2264);
    float _2294 = fma(_937, _2286, _2266);
    float _2296 = fma(_981, _2234, _2288);
    float _2298 = -_2212;
    float _2300 = _2298 + 1.0;
    float _2302 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2280);
    float _2304 = fma(_1161, _2234, _2292);
    float _2306 = fma(_1017, _2234, _2294);
    bool _2308 = _816 <= 8000.0;
    bool _2310 = isnan(_816);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(8000.0);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2212);
    float _2322 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2302);
    float _2324 = _2322;
    if (!_1461)
    {
        _2276 = 1.0;
    }
    float _2326 = _2276;
    out.m_97.x = _2296;
    out.m_97.y = _2304;
    out.m_97.z = _2306;
    float _2328 = _2318 * _2320;
    float _2330 = _2322 + _1481;
    float _2332 = _2326;
    if (_1461)
    {
        bool _2334 = _1577 >= _1537;
        bool _2336 = isnan(_1577);
        bool _2338 = _2334 || _2336;
        bool _2340 = isnan(_1537);
        bool _2342 = _2338 || _2340;
        float _2344 = float(_2342);
        _2332 = _2344;
    }
    float _2346 = _2332;
    float _2348 = _1590 * _2158;
    float _2350 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2352 = _2330 * 0.5;
    float _2354 = _2346 * _1664;
    float _2356 = _1934 * _2350;
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    bool _2360 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2362 = isnan(_1686);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2368 = _2364 || _2366;
    out.m_99.z = _2352;
    out.m_99.w = _1481;
    float _2370 = -_2358;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_101.w = _2290;
    float _2374 = -_2354;
    float _2376 = fma(_2374, _2372, 1.0);
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    out.gl_Position.x = _1515;
    out.gl_Position.y = _1517;
    out.gl_Position.z = _2322;
    out.gl_Position.w = _1481;
    float _2380 = _2378 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2382 = _1590 * _2154;
    float _2384 = _2378;
    float _2386 = _1515;
    if (!_2368)
    {
        _2384 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2388 = _2384;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2368)
    {
        _1962 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2394 = _1962;
    out.m_103.x = _2380;
    float _2396 = _2394;
    float _2398 = _2394;
    if (!_2368)
    {
        _1491 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2400 = _1491;
    float _2402 = _2400;
    float _2404 = _2400;
    if (!_2368)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _2324;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2368)
    {
        _1525 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2412 = _1525;
    float _2414 = _2412;
    float _2416 = _2412;
    if (!_2368)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2418 = _2386;
    float _2420 = _1910 * _2154;
    float _2422 = fma(_1906, _2382, _1584);
    float _2424 = fma(_1908, _2382, _1586);
    float _2426 = fma(_1590, _2420, _1588);
    out.m_105.x = _2422;
    out.m_105.y = _2424;
    out.m_105.z = _2426;
    out.m_105.w = _2348;
    bool _2428 = !_2368;
    float _2430 = _2418;
    float _2432 = _2418;
    if (!_2428)
    {
        bool _2434 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2436 = isnan(_1686);
        bool _2438 = _2434 || _2436;
        bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2442 = _2438 || _2440;
        if (!_2442)
        {
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2446 = _1686 + _2444;
            float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2448;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2456 = 1.0 / _2450;
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2474 = _2446 * _2456;
            float _2476 = precise::clamp(_2474, 0.0, 1.0);
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2482 = fma(_2476, _2454, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2486;
            _2432 = _2490;
            _2392 = _2482;
            _2416 = _2488;
            _2410 = _2484;
            _2398 = _2492;
            _2494 = true;
        }
        else
        {
            bool _2496 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2498 = isnan(_1686);
            bool _2500 = _2496 || _2498;
            bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2504 = _2500 || _2502;
            if (!_2504)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2506 = _2390;
            _2392 = _2506;
            if (!_2504)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2508 = _2402;
            _2404 = _2508;
            if (!_2504)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2510 = _2408;
            _2410 = _2510;
            if (!_2504)
            {
                _2414 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2512 = _2414;
            _2416 = _2512;
            if (!_2504)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2514 = _2430;
            _2432 = _2514;
            if (!_2504)
            {
                _2396 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2516 = _2396;
            bool _2518 = !_2504;
            _2398 = _2516;
            if (!_2518)
            {
                bool _2520 = _1686 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2522 = isnan(_1686);
                bool _2524 = _2520 || _2522;
                bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2528 = _2524 || _2526;
                if (!_2528)
                {
                    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2532 = _1686 + _2530;
                    float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2534;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2542 = 1.0 / _2536;
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2560 = _2532 * _2542;
                    float _2562 = precise::clamp(_2560, 0.0, 1.0);
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2568 = fma(_2562, _2540, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2572;
                    _2432 = _2576;
                    _2392 = _2568;
                    _2416 = _2574;
                    _2410 = _2570;
                    _2398 = _2578;
                    _2494 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2416 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2398 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2494 = false;
    float _2580 = _2404;
    float _2582 = _2432;
    float _2584 = _2392;
    float _2586 = _2416;
    float _2588 = _2410;
    float _2590 = _2398;
    float _2592 = fma(_2304, -0.5, 0.5);
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = -_2580;
    float _2598 = _2596 + _2582;
    float _2600 = -_2584;
    float _2602 = _2600 + _2586;
    float _2604 = -_2588;
    float _2606 = _2604 + _2590;
    bool _2608 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2610 = fma(_2594, _2598, _2580);
    float _2612 = fma(_2594, _2602, _2584);
    float _2614 = fma(_2594, _2606, _2588);
    float _2616 = _2610 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2618 = fma(_2612, 0.298911988735198974609375, _2616);
    float _2620 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2622 = fma(_2614, 0.114477999508380889892578125, _2618);
    out.m_103.w = _2620;
    float _2624 = -_2622;
    float _2626 = _2612 + _2624;
    float _2628 = -_2622;
    float _2630 = _2610 + _2628;
    float _2632 = -_2622;
    float _2634 = _2614 + _2632;
    out.m_107.x = 0.0;
    float _2636 = fma(_2626, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    float _2638 = fma(_2630, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    float _2640 = fma(_2634, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2622);
    out.m_109.x = _2636;
    out.m_109.y = _2638;
    out.m_109.z = _2640;
    if (!_2608)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2642 = -_1367;
    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2646 = -_1369;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2650 = -_1371;
    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2648, _2648, _2654);
    float _2658 = fma(_2652, _2652, _2656);
    float _2660 = sqrt(_2658);
    float _2662 = rsqrt(_2658);
    float _2664 = -_2660;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2668 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2670 = precise::clamp(_2668, 0.0, 1.0);
    float _2672 = _2648 * _2662;
    float _2674 = _2644 * _2662;
    float _2676 = abs(_2670);
    float _2678 = log2(_2676);
    float _2680 = _2652 * _2662;
    float _2682 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2684 = _2304 * _2674;
    float _2686 = -_2674;
    float _2688 = -_2682;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2688);
    float _2692 = fma(_2296, _2672, _2684);
    float _2694 = -_2680;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2690);
    float _2698 = fma(_2306, _2680, _2692);
    float _2700 = precise::clamp(_2698, 0.0, 1.0);
    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2704 = _2696 + _2702;
    float _2706 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = exp2(_2706);
    float _2714 = _2712 * _2710;
    float _2716 = _2700 * _2714;
    float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2722 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _2718;
    out.m_107.y = _2720;
    out.m_107.z = _2722;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

