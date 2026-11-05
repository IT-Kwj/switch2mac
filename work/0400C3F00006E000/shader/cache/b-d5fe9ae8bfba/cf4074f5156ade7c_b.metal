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
    float4 m_115 [[user(locn3)]];
    float4 m_107 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_99 [[user(locn7)]];
    float4 m_105 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_113 [[user(locn11)]];
    float4 m_109 [[user(locn12)]];
    float4 m_111 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_81 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_89 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
    float4 m_101 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2892 = false;
    bool _352 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_56.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_59.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_150);
        out.gl_Position.z = _3177;
    }
    if (!_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_61.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_59.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3247 = as_type<float>(_188);
        out.gl_Position.z = _3247;
    }
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _190 = in.m_63.y;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_63.z;
    float _196 = in.m_65.y;
    float _198 = in.m_65.z;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = _190 * _190;
    float _206 = in.m_63.x;
    float _208 = _194 * _194;
    float _210 = in.m_65.x;
    float _212 = fma(_196, _196, _204);
    float _214 = in.m_67.x;
    float _216 = fma(_198, _198, _208);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _216);
    float _222 = sqrt(_218);
    float _224 = in.m_69.x;
    float _226 = in.m_69.y;
    float _228 = in.m_69.z;
    float _230 = sqrt(_220);
    bool _232 = _222 > 0.0;
    bool _234 = _230 > 0.0;
    float _236 = _190 * _226;
    float _238 = _196 * _226;
    float _240 = _200 * _226;
    float _242 = 0.0;
    float _244 = _222;
    float _246 = _220;
    if (_232)
    {
        float _248 = rsqrt(_218);
        _242 = _248;
    }
    float _250 = _242;
    float _252 = fma(_224, _206, _236);
    float _254 = fma(_224, _210, _238);
    float _256 = fma(_224, _214, _240);
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = _252;
    if (!_232)
    {
        _258 = 0.0;
        _260 = 0.0;
    }
    float _264 = _258;
    float _266 = _260;
    float _268 = fma(_194, _228, _252);
    float _270 = _266;
    float _272 = _264;
    if (!_232)
    {
        _262 = 0.0;
    }
    float _274 = _262;
    float _276 = fma(_198, _228, _254);
    float _278 = 0.0;
    float _280 = _274;
    if (_234)
    {
        float _282 = rsqrt(_220);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = 0.0;
    if (!_234)
    {
        _286 = 0.0;
    }
    float _288 = _286;
    float _290 = fma(_202, _228, _256);
    float _292 = _288;
    if (!_234)
    {
        _244 = 0.0;
    }
    float _294 = _244;
    float _296 = _294;
    if (_232)
    {
        float _298 = _250 * _196;
        _270 = _298;
    }
    float _300 = _270;
    float _302 = _300;
    if (!_234)
    {
        _246 = 0.0;
    }
    float _304 = _246;
    float _306 = _304;
    if (_232)
    {
        float _308 = _250 * _190;
        _272 = _308;
    }
    float _310 = _272;
    float _312 = _310;
    if (_232)
    {
        float _314 = _250 * _200;
        _280 = _314;
    }
    float _316 = _280;
    float _318 = _316;
    if (_234)
    {
        float _320 = _284 * _198;
        _292 = _320;
    }
    float _322 = _292;
    if (_234)
    {
        float _324 = _284 * _194;
        _296 = _324;
    }
    float _326 = _296;
    if (_234)
    {
        float _328 = _284 * _202;
        _306 = _328;
    }
    float _330 = _306;
    bool _332 = !_192;
    float _350;
    if (!_332)
    {
        float _334 = in.m_71.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_134);
        float _356 = 1.0 / _354;
        float _358 = _168 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_56.x;
    float _364 = in.m_56.y;
    float _366 = in.m_56.z;
    float _368 = in.m_65.w;
    float _370 = in.m_67.w;
    float _372 = _196 * _364;
    float _374 = _200 * _364;
    float _376 = fma(_210, _362, _372);
    float _378 = fma(_214, _362, _374);
    float _380 = fma(_198, _366, _376);
    float _382 = fma(_202, _366, _378);
    float _384 = _380 + _368;
    float _386 = _382 + _370;
    float _388 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _390 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _392 = floor(_388);
    float _394 = floor(_390);
    float _396 = -_392;
    float _398 = _388 + _396;
    float _400 = -_394;
    float _402 = _390 + _400;
    float2 _3555 = float2(_398, _402);
    float _404 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3555, float2(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3555, float2(0.0), isnan(_3555)), level(0.0)).x;
    float _406 = in.m_71.z;
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    float _412 = _190 * _364;
    float _414 = in.m_71.y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = in.m_71.x;
    float _422 = fma(_206, _362, _412);
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _430 = _428 != 0;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _434 = _432 != 0;
    float _436 = 1.0 / _418;
    float _438 = fma(_194, _366, _422);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _446 = _360 + _444;
    float _448 = _410 * _168;
    float _450 = 1.0 / _442;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _454 = 1.0 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _456;
    bool _460 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _468 = _464 || _466;
    float _470 = in.m_63.w;
    float _472 = _406 * 2.0;
    bool _474 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = exp2(_448);
    float _486 = _414 + _406;
    float _488 = _446 * _436;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _492 = _360 + _490;
    bool _494 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _496 = isnan(_360);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _486 + (-1.0);
    float _508 = _420 * 2.0;
    float _510 = 1.0 / _454;
    float _512 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _514 = _414 * 2.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _518 = _360 + _516;
    float _520 = _492 * _450;
    float _522 = _420 + _406;
    float _524 = _420 + _414;
    float _526 = 1.0 / _458;
    float _528 = -_484;
    float _530 = _528 + 1.0;
    float _532 = _522 + (-1.0);
    float _534 = _524 + (-1.0);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _536;
    float _540 = _482 ? _530 : 0.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _546 = floor(_514);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_468)
    {
        float _550 = _540 * _510;
        _170 = _550;
    }
    float _552 = _170;
    float _554 = _268 * _268;
    float _556 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _558 = !_426;
    int _560 = _558 ? 0 : 1;
    float _562 = floor(_472);
    float _564 = _518 * _526;
    float _566 = fma(_276, _276, _554);
    bool _568 = !_430;
    int _570 = _568 ? 0 : 1;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _572;
    bool _576 = !_434;
    int _578 = _576 ? 0 : 1;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _580;
    float _584 = floor(_508);
    bool _586 = _546 > 0.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _592 = _546 >= 0.0;
    bool _594 = isnan(_546);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _606 = fma(_290, _290, _566);
    bool _608 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _610 = isnan(_360);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = fma(_590, _520, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _622 = _562 >= 0.0;
    bool _624 = isnan(_562);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = fma(_604, _520, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _634 = fma(_544, _520, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _636 = rsqrt(_606);
    bool _638 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _640 = isnan(_360);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -_618;
    float _652 = _650 + 1.0;
    float _654 = fma(_582, _488, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _656 = _584 >= 0.0;
    bool _658 = isnan(_584);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_574, _488, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _668 = fma(_538, _488, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _682 = _680 != 0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _684;
    bool _688 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _690 = isnan(_360);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _438 + _470;
    int _702 = _630 ? 0 : 1;
    float _704 = fma(_686, _564, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _706 = _664 ? 0 : 1;
    float _708 = -_698;
    float _710 = _708 + 1.0;
    float _712 = _276 * _636;
    float _714 = _268 * _636;
    float _716 = _290 * _636;
    float _718 = _618 * _710;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _720;
    float _724 = _504 * _652;
    float _726 = -_504;
    float _728 = _726 + 1.0;
    float _730 = fma(_722, _564, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _732 = _562 > 0.0;
    float _734 = _648 * _728;
    float _736 = -_648;
    float _738 = _736 + 1.0;
    bool _740 = _584 > 0.0;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _742;
    float _746 = _654 * _734;
    float _748 = _666 * _734;
    float _750 = _668 * _734;
    int _752 = _600 ? 0 : 1;
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _746);
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _748);
    float _758 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].z, _750);
    float _760 = fma(_744, _564, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _762 = fma(_620, _724, _754);
    float _764 = _714 * _310;
    float _766 = fma(_634, _724, _758);
    float _768 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _770 = fma(_632, _724, _756);
    float _772 = fma(_730, _718, _762);
    bool _774 = !_678;
    int _776 = _774 ? 0 : 1;
    float _778 = _768 * _670;
    int _780 = ~_702;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_760, _718, _770);
    int _788 = ~_706;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    float _794 = fma(_704, _718, _766);
    int _796 = ~_752;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].x, _772);
    int _804 = _784;
    int _806 = _792;
    int _808 = _800;
    float _810 = _712;
    if (!_732)
    {
        int _812 = ~_702;
        int _814 = _812 + 1;
        _804 = _814;
    }
    int _816 = _804;
    float _818 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].z, _794);
    if (!_740)
    {
        int _820 = ~_706;
        int _822 = _820 + 1;
        _806 = _822;
    }
    int _824 = _806;
    if (!_586)
    {
        int _826 = ~_752;
        int _828 = _826 + 1;
        _808 = _828;
    }
    int _830 = _808;
    float _832 = fma(_712, _300, _764);
    bool _834 = !_674;
    int _836 = _834 ? 0 : 1;
    float _838 = in.m_73.x;
    float _840 = in.m_73.y;
    float _842 = in.m_73.z;
    int _844 = abs(_776);
    float _846 = fma(_716, _316, _832);
    bool _848 = !_682;
    int _850 = _848 ? 0 : 1;
    float _852 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[203].x, _778);
    float _854 = float(_816);
    int _856 = abs(_836);
    float _858 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _860 = float(_824);
    float _862 = float(_844);
    float _864 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].x, _858);
    int _866 = abs(_850);
    float _868 = abs(_846);
    bool _870 = _868 > 0.99989998340606689453125;
    float _872 = _862 * _860;
    float _874 = float(_856);
    float _876 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[11].z, _864);
    float _878 = _872 * (-2.0);
    float _880 = float(_830);
    float _882 = _852 + 0.25;
    float _884 = float(_866);
    float _886 = _874 * _854;
    float _888 = floor(_852);
    float _890 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _892 = _876 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _894 = _884 * _880;
    if (_870)
    {
        float _896 = fma(_322, 0.001000000047497451305389404296875, _300);
        _302 = _896;
    }
    float _898 = _302;
    if (_870)
    {
        float _900 = fma(_326, 0.001000000047497451305389404296875, _310);
        _312 = _900;
    }
    float _902 = _312;
    float _904 = fma(_512, _878, _512);
    float _906 = _894 * (-2.0);
    float _908 = floor(_882);
    float _910 = fma(_878, _840, _840);
    float _912 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _914 = fma(_556, _906, _556);
    float _916 = fma(_906, _842, _842);
    float _918 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].x, _890);
    float _920 = _406 + (-0.5);
    float _922 = _700 + _912;
    float _924 = 1.0 / _892;
    float _926 = _414 + (-0.5);
    float _928 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[10].z, _918);
    float _930 = -_888;
    float _932 = _852 + _930;
    int _934 = abs(_570);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].y, _910);
    float _938 = _852 * 6.283185482025146484375;
    float _940 = _928 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _942 = -_908;
    float _944 = _882 + _942;
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _916);
    float _948 = _922 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _950 = _938 * 0.15915493667125701904296875;
    float _952 = _940 + _892;
    bool _954 = _932 >= 0.5;
    bool _956 = isnan(_932);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.5);
    bool _962 = _958 || _960;
    float _964 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[126].x, _948);
    float _966 = _950 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[126].z, _964);
    bool _972 = _944 > 0.5;
    float _974 = _952 * _924;
    float _976 = _974 * 0.5;
    float _978 = fma(_904, _552, _936);
    float _980 = _970 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _982 = !_962;
    float _984 = _982 ? 0.5 : (-0.5);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[30].w, _986);
    int _990 = abs(_560);
    float _992 = _922 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _994 = float(_934);
    float _996 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _998 = _996 * 2.0;
    float _1000 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[127].x, _992);
    float _1002 = _944;
    float _1004 = _988;
    if (_870)
    {
        float _1006 = fma(_330, 0.001000000047497451305389404296875, _316);
        _318 = _1006;
    }
    float _1008 = _318;
    float _1010 = _994 * _998;
    int _1012 = abs(_578);
    if (_972)
    {
        float _1014 = -_944;
        float _1016 = _1014 + 1.0;
        _1002 = _1016;
    }
    float _1018 = _1002;
    float _1020 = float(_990);
    float _1022 = _968 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1024 = fma(_1018, 4.0, -1.0);
    float _1026 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1000);
    float _1028 = fma(_1020, _1022, _1010);
    float _1030 = float(_1012);
    float _1032 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1036 = trunc(_980);
    int _1038 = int(_1036);
    float _1040 = _978 * 0.15915493667125701904296875;
    float _1042 = fma(_1030, _1032, _1028);
    float _1044 = -_1008;
    float _1046 = _714 * _1044;
    float _1048 = in.m_75.x;
    float _1050 = in.m_75.y;
    float _1052 = in.m_75.z;
    float _1054 = -_902;
    float _1056 = _712 * _1054;
    float _1058 = -_898;
    float _1060 = _716 * _1058;
    float _1062 = fma(_914, _552, _946);
    float _1064 = trunc(_1034);
    int _1066 = int(_1064);
    float _1068 = fma(_1042, 3.1415927410125732421875, _838);
    float _1070 = _886 * (-2.0);
    float _1072 = -_1008;
    float _1074 = -_1060;
    float _1076 = fma(_712, _1072, _1074);
    float _1078 = -_902;
    float _1080 = -_1046;
    float _1082 = fma(_716, _1078, _1080);
    float _1084 = -_898;
    float _1086 = -_1056;
    float _1088 = fma(_714, _1084, _1086);
    float _1090 = _1062 * 0.15915493667125701904296875;
    float _1092 = in.m_77.x;
    float _1094 = in.m_77.y;
    float _1096 = in.m_77.z;
    float _1098 = 1.0 / _988;
    float _1100 = _420 + (-0.5);
    float _1102 = fma(_1068, _1070, _1068);
    float _1104 = fma(_548, _1070, _548);
    float _1106 = _1076 * _1076;
    float _1108 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1102);
    float _1110 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].y, _786);
    float _1112 = _1040 * 6.283185482025146484375;
    float _1114 = sin(_1112);
    int _1116 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1118 = _1066 + _1116;
    int _1120 = _1118 + 1;
    float _1122 = fma(_1104, _552, _1108);
    float _1124 = fma(_1082, _1082, _1106);
    float _1126 = _802 * _1048;
    float _1128 = _1110 * _1050;
    float _1130 = _1122 * 0.15915493667125701904296875;
    float _1132 = fma(_1088, _1088, _1124);
    float _1134 = _1040 * 6.283185482025146484375;
    float _1136 = cos(_1134);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1140 = _1098 * _1138;
    float _1142 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1146 = _1140 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1148 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1092);
    float _1150 = _1130 * 6.283185482025146484375;
    float _1152 = sin(_1150);
    int _1154 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1156 = _1038 + _1154;
    int _1158 = _1156 + 1;
    float _1160 = _818 * _1052;
    float _1162 = _1148 * _1142;
    bool _1164 = _1158 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1166 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1168 = _1158 | _1120;
    float _1170 = _1130 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    bool _1174 = !_1146;
    int _1176 = _1174 ? 0 : 1;
    bool _1178 = _1168 < 0;
    bool _1180 = _1178 || _1164;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1096);
    int _1184 = 2;
    int _1186 = _1158;
    int _1188 = as_type<int>(_1098);
    int _1190 = as_type<int>(_1128);
    if (!_1146)
    {
        _1184 = 1;
    }
    int _1192 = _1184;
    bool _1194 = _1120 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1196 = _1194 || _1180;
    float _1198 = _1090 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    bool _1202 = _1140 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1204 = _1152 * _1114;
    float _1206 = _1182 * _1166;
    bool _1208 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1210 = isnan(0.5);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1216 = _1212 || _1214;
    float _1218 = rsqrt(_1132);
    float _1220 = _1172 * _1114;
    int _1222 = _1192;
    if (!_1196)
    {
        int _1224 = _1120 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1226 = _1224 + _1158;
        _1186 = _1226;
    }
    int _1228 = _1186;
    if (!_1202)
    {
        _1222 = _1176;
    }
    int _1230 = _1222;
    float _1232 = _1090 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1094);
    float _1238 = _1136 * _1200;
    int _1240 = _1230 << 6;
    float _1242 = _1114 * _1200;
    float _1244 = _1236 * _1144;
    float _1246 = _1172 * _1136;
    float _1248 = _1152 * _1136;
    float _1250 = _1088 * _1218;
    float _1252 = _1082 * _1218;
    float _1254 = _1076 * _1218;
    float _1256 = _1172 * _1200;
    float _1258 = _1152 * _1200;
    int _1260 = _1240 + 96;
    uint _1263 = uint(int(uint(_1260) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
    float _1279 = as_type<float>(_1230);
    if (!_1196)
    {
        int _1281 = _1228 << 2;
        _1188 = _1281;
    }
    int _1283 = _1188;
    float _1285 = _712 * _1256;
    float _1287 = fma(_1234, _1246, _1204);
    float _1289 = fma(_1234, _1204, _1246);
    float _1291 = -_1220;
    float _1293 = fma(_1234, _1248, _1291);
    float _1295 = _714 * _1250;
    float _1297 = _1287 * _712;
    float _1299 = -_1248;
    float _1301 = fma(_1234, _1220, _1299);
    int _1303 = _1240 + 48;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    float _1321 = -_1295;
    float _1323 = fma(_716, _1254, _1321);
    float _1325 = fma(_1238, _1252, _1297);
    float _1327 = _712 * _1301;
    float _1329 = -_1234;
    float _1331 = fma(_1329, _1252, _1285);
    float _1333 = _716 * _1301;
    float _1335 = fma(_1293, _1323, _1325);
    float _1337 = fma(_1242, _1252, _1327);
    float _1339 = _712 * _1254;
    int _1341 = _1240 + 104;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    float _1359 = _716 * _1256;
    float _1361 = fma(_1258, _1323, _1331);
    float _1363 = fma(_1289, _1323, _1337);
    float _1365 = _1287 * _716;
    float _1367 = -_1339;
    float _1369 = fma(_714, _1252, _1367);
    float _1371 = -_1234;
    float _1373 = fma(_1371, _1250, _1359);
    float _1375 = fma(_1242, _1250, _1333);
    int _1377 = _1240 + 64;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.vp_c15)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[int(_1389)][_1391];
    float _1395 = fma(_1238, _1250, _1365);
    float _1397 = fma(_1258, _1369, _1373);
    float _1399 = _1244 * _1361;
    int _1401 = _1283;
    float _1403 = _1293;
    if (!_1196)
    {
        uint _1405 = uint(int(uint(_1228) >> uint(2)));
        _1190 = int(_1405);
    }
    int _1407 = _1190;
    float _1409 = fma(_1293, _1369, _1395);
    float _1411 = _1244 * _1397;
    float _1413 = fma(_1289, _1369, _1375);
    if (!_1196)
    {
        int _1415 = 12 & _1283;
        _1401 = _1415;
    }
    int _1417 = _1401;
    int _1419 = _1240 + 56;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    uint _1423 = uint(int(uint(int(_1421)) >> uint(2)));
    int _1425 = int(_1421) & 3;
    float _1427 = (*spvDescriptorSet0.vp_c15)._m0[int(_1423)][_1425];
    int _1429 = int(_1421) + 1;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    int _1433 = _1429 & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    float _1437 = fma(_1162, _1409, _1411);
    float _1439 = fma(_1162, _1335, _1399);
    if (!_1196)
    {
        int _1441 = _1407 << 4;
        int _1443 = _1441 + _1417;
        _1004 = as_type<float>(_1443);
    }
    float _1445 = _1004;
    float _1447 = _716 * _1252;
    float _1449 = fma(_1206, _1413, _1437);
    float _1451 = fma(_1206, _1363, _1439);
    float _1453 = _714 * _1256;
    int _1455 = _1240 + 72;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.vp_c15)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    float _1473 = _386 + _1449;
    float _1475 = _384 + _1451;
    float _1477 = -_1447;
    float _1479 = fma(_712, _1250, _1477);
    float _1481 = _1287 * _714;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1485 = _1473 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1489 = _1475 + _1487;
    float _1491 = -_1234;
    float _1493 = fma(_1491, _1254, _1453);
    int _1495 = _1240 + 80;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    float _1513 = _1485 * _1485;
    float _1515 = _714 * _1301;
    float _1517 = fma(_1238, _1254, _1481);
    float _1519 = fma(_1258, _1479, _1493);
    float _1521 = fma(_1489, _1489, _1513);
    float _1523 = _922 * _1277;
    float _1525 = _922 * _1319;
    int _1527 = _1240 + 88;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    uint _1531 = uint(int(uint(int(_1529)) >> uint(2)));
    int _1533 = int(_1529) & 3;
    float _1535 = (*spvDescriptorSet0.vp_c15)._m0[int(_1531)][_1533];
    int _1537 = int(_1529) + 1;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    int _1541 = _1537 & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    float _1545 = sqrt(_1521);
    float _1547 = fma(_384, _1269, _1523);
    float _1549 = fma(_1242, _1254, _1515);
    float _1551 = fma(_1293, _1479, _1517);
    float _1553 = _1244 * _1519;
    float _1555 = fma(_384, _1311, _1525);
    float _1557 = fma(_386, _1349, _1547);
    float _1559 = _1445;
    float _1561 = _1475;
    float _1563 = _1473;
    float _1565 = _1493;
    int _1567 = as_type<int>(_1515);
    if (!_1196)
    {
        int _1569 = as_type<int>(_1445) + 400;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        uint _1573 = uint(int(uint(int(_1571)) >> uint(2)));
        int _1575 = int(_1571) & 3;
        float _1577 = (*spvDescriptorSet0.vp_c15)._m0[int(_1573)][_1575];
        _1559 = _1577;
    }
    float _1579 = _1559;
    float _1581 = fma(_1289, _1479, _1549);
    float _1583 = fma(_1162, _1551, _1553);
    float _1585 = _1557 + _1357;
    float _1587 = _1525;
    if (!_1196)
    {
        float _1589 = floor(_980);
        _1587 = _1589;
    }
    float _1591 = _1587;
    float _1593 = fma(_1206, _1581, _1583);
    float _1595 = _922 * _1393;
    bool _1597 = _1545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = _700 + _1593;
    float _1601 = fma(_384, _1385, _1595);
    float _1603 = 1.0 / _1585;
    float _1605 = fma(_386, _1427, _1555);
    float _1607 = _1605 + _1435;
    float _1609 = fma(_386, _1463, _1601);
    float _1611 = _1601;
    float _1613 = _1385;
    float _1615 = _1545;
    float _1617 = _1593;
    float _1619 = _1511;
    float _1621 = _1503;
    if (!_1597)
    {
        _1611 = _1599;
    }
    float _1623 = _1611;
    float _1625 = _1609 + _1471;
    bool _1627 = !_1597;
    float _1629 = _1623;
    float _1631 = _1579;
    if (!_1627)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1637 = _1545 + _1635;
        float _1639 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = rsqrt(_1521);
        float _1643 = _1637 * _1633;
        float _1645 = _1643 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1645 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1649 + (-1.0);
        float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1659 = fma(_1653, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1661 = fma(_1599, _1649, _1657);
        float _1663 = _1641 * _1659;
        float _1665 = fma(_1489, _1663, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1667 = fma(_1485, _1663, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1561 = _1665;
        _1563 = _1667;
        _1629 = _1661;
        _1613 = _1663;
        _1615 = _1637;
        _1617 = _1657;
    }
    float _1669 = _1561;
    float _1671 = _1563;
    float _1673 = _1629;
    float _1675 = _1613;
    float _1677 = _1615;
    float _1679 = _1617;
    float _1681 = _1607 * _1603;
    float _1683 = _1675;
    float _1685 = _1679;
    float _1687 = _1673;
    float _1689 = _1677;
    if (_1216)
    {
        _1683 = _1669;
    }
    float _1691 = _1683;
    float _1693 = _1691;
    if (_1216)
    {
        _1685 = _1671;
    }
    float _1695 = _1685;
    float _1697 = _1695;
    if (!_1216)
    {
        float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1701 = _700 + _1699;
        float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1705 = _384 + _1703;
        float _1707 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1709 = -_386;
        float _1711 = _1709 + _1671;
        float _1713 = _1701 * _1701;
        float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1717 = _386 + _1715;
        float _1719 = fma(_1705, _1705, _1713);
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1723 = fma(_1717, _1717, _1719);
        float _1725 = sqrt(_1723);
        float _1727 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1729 = precise::min(_1725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1731 = _1729 * _1721;
        float _1733 = -_700;
        float _1735 = _1733 + _1673;
        float _1737 = _1727 * _1731;
        float _1739 = -_384;
        float _1741 = _1739 + _1669;
        float _1743 = fma(_1735, _1737, _700);
        float _1745 = fma(_1741, _1737, _384);
        float _1747 = fma(_1711, _1737, _386);
        _1687 = _1743;
        _1693 = _1745;
        _1689 = _1737;
        _1697 = _1747;
    }
    float _1749 = _1687;
    float _1751 = _1693;
    float _1753 = _1689;
    float _1755 = _1697;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1759 = _1625 * _1603;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1765 = isnan(0.5);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    float _1773 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1757);
    float _1775 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1777 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    bool _1779 = _1681 >= 0.0;
    float _1781 = _1753;
    if (!_1196)
    {
        float _1783 = floor(_1034);
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1775);
    float _1789 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1773);
    float _1791 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1777);
    bool _1793 = _1681 <= 1.0;
    bool _1795 = _1793 && _1779;
    float _1797 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1799 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1805 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1807 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1809 = _1759 >= 0.0;
    bool _1811 = _1809 && _1795;
    float _1813 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1815 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1817 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1819 = _1759 <= 1.0;
    bool _1821 = _1819 && _1811;
    float _1823 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1813);
    float _1825 = -_1815;
    float _1827 = fma(_1825, _1807, 1.0);
    float _1829 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1817);
    if (_1771)
    {
        _810 = 1.0;
    }
    float _1831 = _810;
    float _1833 = _1831;
    if (!_1771)
    {
        float _1835 = as_type<float>(in.m_81.w);
        int _1837 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1839 = _1837 == 4;
        bool _1841 = _1837 == 8;
        bool _1843 = _1837 == 12;
        int _1845 = as_type<int>(_1835) << 16;
        int _1847 = as_type<int>(_1835) << 8;
        int _1849 = as_type<int>(_1835) << 24;
        int _1851 = _1845 >> 24;
        int _1853 = _1847 >> 24;
        int _1855 = as_type<int>(_1835) >> 24;
        int _1857 = _1849 >> 24;
        float _1859 = float(_1851);
        float _1861 = float(_1853);
        float _1863 = float(_1855);
        float _1865 = _1859 * 0.0078740157186985015869140625;
        float _1867 = float(_1857);
        float _1869 = _1861 * 0.0078740157186985015869140625;
        float _1871 = _1863 * 0.0078740157186985015869140625;
        float _1873 = precise::min(_1865, 1.0);
        float _1875 = _1867 * 0.0078740157186985015869140625;
        float _1877 = precise::min(_1869, 1.0);
        float _1879 = precise::min(_1871, 1.0);
        float _1881 = precise::min(_1875, 1.0);
        float _1883 = precise::max(_1873, -1.0);
        float _1885 = precise::max(_1877, -1.0);
        float _1887 = precise::max(_1879, -1.0);
        float _1889 = precise::max(_1881, -1.0);
        float _1891 = _1889;
        if (_1839)
        {
            _1891 = _1883;
        }
        float _1893 = _1891;
        float _1895 = _1893;
        if (_1841)
        {
            _1895 = _1885;
        }
        float _1897 = _1895;
        float _1899 = _1897;
        if (_1843)
        {
            _1899 = _1887;
        }
        float _1901 = _1899;
        float _1903 = abs(_1901);
        float _1905 = (-0.0) + _1903;
        _1833 = _1905;
    }
    float _1907 = _1833;
    float _1909 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1911 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1913 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1829);
    float _1915 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1917 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1909);
    bool _1919 = _1907 != 0.0;
    bool _1921 = isnan(_1907);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan(0.0);
    bool _1927 = _1923 || _1925;
    float _1929 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1913);
    float _1931 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1915);
    float _1933 = _922 * _1511;
    float _1935 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1917);
    float _1937 = 1.0 / _1929;
    float _1939 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1941 = fma(_384, _1503, _1933);
    float _1943 = _1939;
    float _1945 = _1929;
    if (_1821)
    {
        float _1947 = float(_1230);
        _1279 = _1947;
    }
    float _1949 = _1279;
    float _1951 = fma(_386, _1535, _1941);
    float _1953 = log2(_1827);
    float _1955 = _1951 + _1543;
    float _1957 = _1933;
    float _1959 = _1955;
    if (_1821)
    {
        float _1961 = rint(_1949);
        float _1963 = precise::max(_1961, 0.0);
        uint _1965 = uint(_1963);
        uint _1967 = clamp(_1965, 0u, 65535u);
        _1957 = as_type<float>(_1967);
    }
    float _1969 = _1957;
    float _1971 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1935);
    float _1973 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1939);
    if (!_1196)
    {
        float _1975 = -_1785;
        float _1977 = _1034 + _1975;
        _1943 = _1977;
    }
    float _1979 = _1943;
    float _1981 = _1955 * _1603;
    if (!_1196)
    {
        float _1983 = -_1591;
        float _1985 = _980 + _1983;
        _1959 = _1985;
    }
    float _1987 = _1959;
    if (_1927)
    {
        _1619 = _1971;
    }
    float _1989 = _1619;
    float _1991 = _1989;
    if (_1927)
    {
        _1621 = _1973;
    }
    float _1993 = _1621;
    float _1995 = _1993;
    if (!_1927)
    {
        _1991 = 0.0;
        _1995 = 0.0;
    }
    float _1997 = _1991;
    float _1999 = _1995;
    float _2001 = _1951;
    if (!_1196)
    {
        float _2003 = rint(_1579);
        float _2005 = precise::max(_2003, 0.0);
        uint _2007 = uint(_2005);
        uint _2009 = clamp(_2007, 0u, 65535u);
        _2001 = as_type<float>(_2009);
    }
    float _2011 = _2001;
    float _2013 = _1953 * 0.693147182464599609375;
    float _2015 = _1937 * _1997;
    float _2017 = _1937 * _1999;
    float _2019 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2021 = fma(_2015, 0.5, 0.5);
    float _2023 = fma(_2017, -0.5, 0.5);
    float _2025 = _1941;
    float _2027 = _2013;
    float _2029 = _2021;
    if (_1821)
    {
        float3 _6071 = float3(_1681, _1759, float(as_type<int>(_1969)));
        float3 _6075 = select(_6071, float3(0.0), isnan(_6071));
        float _2031 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6075.xy, uint(rint(_6075.z)), _1981, level(0.0));
        _2025 = _2031;
    }
    float _2033 = _2025;
    float3 _6085 = float3(_2021, _2023, _2019);
    float _2035 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6085, float3(0.0), isnan(_6085)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6085, float3(0.0), isnan(_6085)), level(0.0)).x;
    float3 _6094 = float3(_2021, _2023, _2019);
    float4 _2038 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6094, float3(0.0), isnan(_6094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6094, float3(0.0), isnan(_6094)), level(0.0)).xyzw;
    float _2040 = _2038.x;
    float _2042 = _2038.y;
    float _2044 = _2038.z;
    float _2046 = _2038.w;
    float _2048 = _1979;
    if (!_1196)
    {
        float3 _6117 = float3(_1987, _1979, float(as_type<int>(_2011)));
        float3 _6119 = select(_6117, float3(0.0), isnan(_6117));
        float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6119.xy, uint(rint(_6119.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6119.xy, uint(rint(_6119.z)), level(0.0)).x;
        _2048 = _2050;
    }
    float _2052 = _2048;
    if (_1196)
    {
        _2027 = 1.0;
    }
    float _2054 = _2027;
    float _2056 = _2054;
    if (!_1196)
    {
        int _2058 = _1228 << 4;
        int _2060 = _2058 + 2048;
        uint _2062 = uint(int(uint(_2060) >> uint(2)));
        uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
        int _2066 = int(_2062) & 3;
        float _2068 = (*spvDescriptorSet0.vp_c15)._m0[int(_2064)][_2066];
        int _2070 = int(_2062) + 1;
        uint _2072 = uint(int(uint(_2070) >> uint(2)));
        int _2074 = _2070 & 3;
        float _2076 = (*spvDescriptorSet0.vp_c15)._m0[int(_2072)][_2074];
        int _2078 = _2060 + 8;
        uint _2080 = uint(int(uint(_2078) >> uint(2)));
        uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
        int _2084 = int(_2080) & 3;
        float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
        int _2088 = int(_2080) + 1;
        uint _2090 = uint(int(uint(_2088) >> uint(2)));
        int _2092 = _2088 & 3;
        float _2094 = (*spvDescriptorSet0.vp_c15)._m0[int(_2090)][_2092];
        float _2096 = _922 * _2076;
        float _2098 = fma(_384, _2068, _2096);
        float _2100 = fma(_386, _2086, _2098);
        float _2102 = _2100 + _2094;
        float _2104 = precise::clamp(_2102, 0.0, 1.0);
        float _2106 = -_2104;
        float _2108 = _2106 + _2052;
        float _2110 = fma(_2108, 500.0, 1.5);
        float _2112 = exp2(_2110);
        float _2114 = 0.0 + _2112;
        float _2116 = precise::clamp(_2114, 0.0, 1.0);
        _2056 = _2116;
    }
    float _2118 = _2056;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2122 = _1749 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2126 = _1751 + _2124;
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2130 = _1755 + _2128;
    float _2132 = _2122 * _2122;
    float _2134 = fma(_2126, _2126, _2132);
    float _2136 = fma(_2130, _2130, _2134);
    float _2138 = rsqrt(_2136);
    float _2140 = sqrt(_2136);
    float _2142 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2144 = _2126 * _2142;
    float _2146 = _2130 * _2142;
    float _2148 = _2144 * _2144;
    float _2150 = _2146 * _2146;
    float _2152 = _2148 + _2150;
    float _2154 = sqrt(_2152);
    bool _2156 = _2154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2160 = _2154 + _2158;
    float _2162 = _2134;
    float _2164 = _2138;
    float _2166 = _2160;
    float _2168 = _2122;
    bool _2170 = _2156;
    if (_2156)
    {
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2162 = _2172;
    }
    float _2174 = _2162;
    if (_2156)
    {
        float _2176 = rsqrt(_2152);
        _2164 = _2176;
    }
    float _2178 = _2164;
    float _2180 = _2178;
    if (_2156)
    {
        float _2182 = _2160 * _2174;
        _2166 = _2182;
    }
    float _2184 = _2166;
    if (_2156)
    {
        float _2186 = _2184 * 0.15915493667125701904296875;
        _2029 = _2186;
    }
    float _2188 = _2029;
    float _2190 = _2130;
    float _2192 = _2188;
    if (_2156)
    {
        float _2194 = _2188 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        _2190 = _2196;
    }
    float _2198 = _2190;
    float _2200 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2202 = precise::max(0.0, _2200);
    float _2204 = _2174;
    float _2206 = _2202;
    if (_2156)
    {
        float _2208 = _2188 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        _2204 = _2210;
    }
    float _2212 = _2204;
    float _2214 = -_2142;
    float _2216 = -_2202;
    float _2218 = fma(_2122, _2214, _2216);
    if (_2156)
    {
        float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2220;
    }
    float _2222 = _2168;
    float _2224 = _2222;
    float _2226 = _2198;
    if (_2156)
    {
        float _2228 = fma(_2198, _2222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2224 = _2228;
    }
    float _2230 = _2224;
    float _2232 = _2230;
    if (!_2156)
    {
        _2226 = _2144;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    float _2238 = _2212;
    if (_2156)
    {
        float _2240 = _2212 + (-1.0);
        _2206 = _2240;
    }
    float _2242 = _2206;
    float _2244 = _2242;
    if (_2156)
    {
        float _2246 = _2178 * _2230;
        _1631 = _2246;
    }
    float _2248 = _1631;
    if (!_2156)
    {
        _2232 = _2218;
    }
    float _2250 = _2232;
    float _2252 = _2250;
    if (_2156)
    {
        float _2254 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2192 = _2254;
    }
    float _2256 = _2192;
    if (_2156)
    {
        float _2258 = _2144 * _2248;
        _2236 = _2258;
    }
    float _2260 = _2236;
    if (!_2156)
    {
        _2244 = _2146;
    }
    float _2262 = _2244;
    float _2264 = _2262;
    if (_2156)
    {
        float _2266 = _2146 * _2248;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (!_2156)
    {
        _2180 = _2148;
    }
    float _2270 = _2180;
    float _2272 = _2270;
    if (_2156)
    {
        float _2274 = fma(_2218, _2212, _2256);
        _2252 = _2274;
    }
    float _2276 = _2252;
    if (_2156)
    {
        float _2278 = _2260 * _2260;
        _2272 = _2278;
    }
    float _2280 = _2272;
    if (!_2156)
    {
        _2238 = _2150;
    }
    float _2282 = _2238;
    float _2284 = _2282;
    if (_2156)
    {
        float _2286 = _2268 * _2268;
        _2284 = _2286;
    }
    float _2288 = _2284;
    float _2290 = fma(_2276, _2276, _2280);
    float _2292 = _2290 + _2288;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = rsqrt(_2292);
    float _2302 = -_2298;
    float _2304 = _2302 + 1.0;
    float _2306 = abs(_2304);
    float _2308 = log2(_2306);
    float _2310 = _2300 * _2260;
    float _2312 = _2300 * _2276;
    float _2314 = _2300 * _2268;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2318 = -_2316;
    float _2320 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2318);
    float _2322 = -_2314;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2320);
    float _2326 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2328 = fma(_2324, -0.5, 0.5);
    float _2330 = fma(_2324, 0.5, 0.5);
    float _2332 = exp2(_2326);
    float _2334 = fma(_2330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = fma(_2330, _2334, -0.212114393711090087890625);
    float _2338 = _2312 + 1.0;
    float _2340 = sqrt(_2328);
    float _2342 = fma(_2330, _2336, 1.570728778839111328125);
    float _2344 = -_2312;
    float _2346 = fma(_2332, _2338, _2344);
    float _2348 = _2340 * 0.636619746685028076171875;
    float _2350 = fma(_2346, 0.5, 0.5);
    float _2352 = -_2342;
    float _2354 = fma(_2348, _2352, 1.0);
    float2 _6591 = float2(_2354, _2350);
    float3 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).xyz;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = in.m_83.x;
    float _2368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2370 = in.m_83.y;
    int _2372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2374 = _2372 != 0;
    float _2376 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2380 = _2378 != 0;
    float _2382 = in.m_71.w;
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2386 = _2384 != 0;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2392 = _2390 != 0;
    float _2394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2396 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = -_404;
    float _2400 = _2398 + 1.0;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2404 = as_type<int>(_2346);
    bool _2406 = _2392;
    float _2408 = _2370;
    float _2410 = _2366;
    if (_2374)
    {
        bool _2412 = _420 > 0.5;
        _2170 = _2412;
    }
    bool _2414 = _2170;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_2374)
    {
        float _2420 = -_2366;
        float _2422 = _2420 + 1.0;
        _2404 = as_type<int>(_2422);
    }
    int _2424 = _2404;
    if (!_2374)
    {
        _1565 = _2366;
    }
    float _2426 = _1565;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2430 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2432 = -_2370;
    float _2434 = _2432 + 1.0;
    float _2436 = _2426;
    float _2438 = _2430;
    if (_2374)
    {
        float _2440 = _2414 ? as_type<float>(_2424) : _2366;
        _2436 = _2440;
    }
    float _2442 = _2436;
    float _2444 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2446 = _414 > 0.5;
    float _2448 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2450 = _2382 > 0.5;
    float _2452 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2454 = in.m_85.x;
    float _2456 = in.m_85.y;
    float _2458 = in.m_85.z;
    int _2460 = _2450 ? as_type<int>(_2434) : as_type<int>(_2370);
    float _2462 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2464 = _1094 != 0.0;
    bool _2466 = isnan(_1094);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan(0.0);
    bool _2472 = _2468 || _2470;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2476 = _2392 ? as_type<float>(_2460) : _2370;
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2380)
    {
        bool _2480 = _406 > 0.5;
        _2406 = _2480;
    }
    bool _2482 = _2406;
    float _2484 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2486 = _2484;
    if (_2386)
    {
        float _2488 = _2446 ? _2434 : _2370;
        _2408 = _2488;
    }
    float _2490 = _2408;
    out.m_87.x = _2448;
    out.m_87.y = _2452;
    out.m_87.z = _2462;
    bool _2492 = _1092 == 0.0;
    bool _2494 = !_2472;
    bool _2496 = _2492 && _2494;
    if (_2380)
    {
        float _2498 = -_2366;
        float _2500 = _2498 + 1.0;
        _1567 = as_type<int>(_2500);
    }
    int _2502 = _1567;
    float _2504 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2506 = abs(_1140);
    float _2508 = log2(_2506);
    float _2510 = in.m_89.x;
    float _2512 = in.m_89.y;
    float _2514 = in.m_89.z;
    float _2516 = in.m_89.w;
    bool _2518 = _1096 == 0.0;
    bool _2520 = _2518 && _2496;
    float _2522 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2380)
    {
        float _2524 = _2482 ? as_type<float>(_2502) : _2366;
        _2410 = _2524;
    }
    float _2526 = _2410;
    out.m_91.x = _2396;
    out.m_91.y = _2430;
    out.m_91.z = _2484;
    out.m_91.w = _2444;
    float _2528 = exp2(_2376);
    bool _2530 = _1140 <= 8000.0;
    bool _2532 = isnan(_1140);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(8000.0);
    bool _2538 = _2534 || _2536;
    float _2540 = float(_2538);
    out.m_93.x = _1751;
    out.m_93.y = _1749;
    out.m_93.z = _1755;
    float _2542 = _2540;
    if (_2520)
    {
        _1403 = _2454;
    }
    float _2544 = _1403;
    float _2546 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2548 = _2544;
    if (!_2520)
    {
        float _2550 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2454);
        _2548 = _2550;
    }
    float _2552 = _2548;
    float _2554 = _2490 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2558 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2520)
    {
        _2438 = _2456;
    }
    float _2560 = _2438;
    float _2562 = _2560;
    if (!_2520)
    {
        float _2564 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2456);
        _2562 = _2564;
    }
    float _2566 = _2562;
    if (_2520)
    {
        _2486 = _2458;
    }
    float _2568 = _2486;
    float _2570 = _2568;
    if (!_2520)
    {
        float _2572 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2570 = _2572;
    }
    float _2574 = _2570;
    float _2576 = _2514 * _2454;
    float _2578 = _2554 * _2368;
    float _2580 = exp2(_2546);
    float _2582 = _2512 * _2458;
    float _2584 = _2510 * _2456;
    float _2586 = _2504 * _2478;
    float _2588 = _2522 * _2394;
    float _2590 = -_2584;
    float _2592 = fma(_2512, _2454, _2590);
    float _2594 = _1519 * _2566;
    float _2596 = _2558 * _2556;
    float _2598 = -_2576;
    float _2600 = fma(_2510, _2458, _2598);
    float _2602 = -_2582;
    float _2604 = fma(_2514, _2456, _2602);
    float _2606 = _2592 * _2516;
    out.m_95.x = _2588;
    out.m_95.y = _2578;
    out.m_95.z = _2596;
    out.m_95.w = _2586;
    float _2608 = _2600 * _2516;
    float _2610 = _2604 * _2516;
    float _2612 = _1361 * _2512;
    float _2614 = _1519 * _2512;
    float _2616 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2618 = precise::clamp(_2616, 0.0, 1.0);
    float _2620 = _1361 * _2566;
    float _2622 = _1397 * _2566;
    float _2624 = _1397 * _2512;
    float _2626 = _1361 * _2608;
    float _2628 = _1519 * _2608;
    float _2630 = _1397 * _2608;
    float _2632 = fma(_1335, _2552, _2620);
    float _2634 = fma(_1551, _2552, _2594);
    float _2636 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2638 = fma(_1335, _2510, _2612);
    float _2640 = fma(_1551, _2510, _2614);
    float _2642 = fma(_1409, _2552, _2622);
    float _2644 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2636);
    float _2646 = fma(_1409, _2510, _2624);
    float _2648 = fma(_1363, _2514, _2638);
    float _2650 = fma(_1581, _2514, _2640);
    float _2652 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2644);
    float _2654 = fma(_1335, _2610, _2626);
    float _2656 = fma(_1551, _2610, _2628);
    float _2658 = fma(_1409, _2610, _2630);
    float _2660 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2652);
    float _2662 = fma(_1413, _2514, _2646);
    float _2664 = fma(_1363, _2606, _2654);
    float _2666 = fma(_1581, _2606, _2656);
    float _2668 = fma(_1413, _2606, _2658);
    float _2670 = _2660 + _1929;
    out.m_97.x = _2648;
    out.m_97.y = _2650;
    out.m_97.z = _2662;
    float _2672 = _2610;
    if (!_1927)
    {
        _2672 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2674 = _2672;
    float _2676 = fma(_1363, _2574, _2632);
    out.m_99.x = _2664;
    out.m_99.y = _2666;
    out.m_99.z = _2668;
    float _2678 = fma(_1581, _2574, _2634);
    int _2680 = as_type<int>(_2674);
    if (!_1927)
    {
        float _2682 = _2674 * 5.0;
        _2680 = as_type<int>(_2682);
    }
    int _2684 = _2680;
    float _2686 = fma(_1413, _2574, _2642);
    out.gl_Position.x = _1971;
    out.gl_Position.y = _1973;
    out.gl_Position.z = _2660;
    out.gl_Position.w = _1929;
    float _2688 = _2670 * 0.5;
    if (!_1927)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7198 = as_type<float>(_2684);
        out.gl_Position.z = _7198;
    }
    float _2690 = fma(_2618, -2.0, 3.0);
    float _2692 = in.m_101.w;
    float _2694 = _2618 * _2618;
    float _2696 = _1907 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2698 = _2696;
    if (!_1927)
    {
        _2698 = 0.0;
    }
    float _2700 = _2698;
    out.m_103.z = _2688;
    out.m_103.w = _1929;
    float _2702 = -_2528;
    float _2704 = _2702 + 1.0;
    float _2706 = _2694 * _2690;
    out.m_105.x = _2676;
    out.m_105.y = _2678;
    out.m_105.z = _2686;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2710 = -_2706;
    float _2712 = _2710 + 1.0;
    float _2714 = _2708 * _2035;
    float _2716 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2706);
    float _2718 = -_2708;
    float _2720 = _2718 + 1.0;
    float _2722 = _2046 * _2714;
    float _2724 = _2540 * _2716;
    float _2726 = _2712;
    float _2728 = _2720;
    float _2730 = _2714;
    if (!_1821)
    {
        _2542 = 1.0;
    }
    float _2732 = _2542;
    float _2734 = _2732;
    if (_1821)
    {
        bool _2736 = _2033 >= _1981;
        bool _2738 = isnan(_2033);
        bool _2740 = _2736 || _2738;
        bool _2742 = isnan(_1981);
        bool _2744 = _2740 || _2742;
        float _2746 = float(_2744);
        _2734 = _2746;
    }
    float _2748 = _2734;
    float _2750 = _2046 * _2720;
    float _2752 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.w = _2692;
    bool _2754 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2756 = isnan(_2140);
    bool _2758 = _2754 || _2756;
    bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2762 = _2758 || _2760;
    float _2764 = _2748 * _2118;
    float _2766 = _2400 * _2752;
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = -_2768;
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2774 = -_2764;
    float _2776 = fma(_2774, _2772, 1.0);
    float _2778 = precise::clamp(_2776, 0.0, 1.0);
    float _2780 = _2772;
    if (!_2762)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2782 = _2780;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2786 = _2784;
    float _2788 = _2782;
    float _2790 = _2782;
    if (!_2762)
    {
        _1945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2792 = _1945;
    float _2794 = _2792;
    float _2796 = _2792;
    if (!_2762)
    {
        _2726 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2798 = _2726;
    out.m_109.x = _2784;
    float _2800 = _2798;
    float _2802 = _2798;
    if (!_2762)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2804 = _2728;
    float _2806 = _2804;
    float _2808 = _2804;
    if (!_2762)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2810 = _2786;
    float _2812 = _2364 * _2714;
    float _2814 = fma(_2360, _2722, _2040);
    float _2816 = fma(_2362, _2722, _2042);
    float _2818 = _2810;
    float _2820 = _2810;
    if (!_2762)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2822 = _2730;
    float _2824 = fma(_2046, _2812, _2044);
    out.m_111.x = _2814;
    out.m_111.y = _2816;
    out.m_111.z = _2824;
    out.m_111.w = _2750;
    bool _2826 = !_2762;
    float _2828 = _2822;
    float _2830 = _2822;
    if (!_2826)
    {
        bool _2832 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_2140);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _2140 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2846;
            float _2850 = 1.0 / _2848;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2872 = _2844 * _2850;
            float _2874 = precise::clamp(_2872, 0.0, 1.0);
            float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2880 = fma(_2874, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2796 = _2882;
            _2808 = _2888;
            _2790 = _2880;
            _2802 = _2886;
            _2830 = _2884;
            _2820 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_2140);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2788 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2788;
            _2790 = _2904;
            if (!_2902)
            {
                _2794 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2794;
            _2796 = _2906;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2828;
            _2830 = _2908;
            if (!_2902)
            {
                _2800 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2800;
            _2802 = _2910;
            if (!_2902)
            {
                _2806 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2806;
            _2808 = _2912;
            if (!_2902)
            {
                _2818 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2818;
            bool _2916 = !_2902;
            _2820 = _2914;
            if (!_2916)
            {
                bool _2918 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_2140);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _2140 + _2928;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2932;
                    float _2936 = 1.0 / _2934;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2958 = _2930 * _2936;
                    float _2960 = precise::clamp(_2958, 0.0, 1.0);
                    float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2966 = fma(_2960, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2968 = fma(_2960, _2964, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2970 = fma(_2960, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2972 = fma(_2960, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2974 = fma(_2960, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2976 = fma(_2960, _2956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2796 = _2968;
                    _2808 = _2974;
                    _2790 = _2966;
                    _2802 = _2972;
                    _2830 = _2970;
                    _2820 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2796 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2808 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2790 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2802 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2820 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2796;
    float _2980 = _2808;
    float _2982 = _2790;
    float _2984 = _2802;
    float _2986 = _2830;
    float _2988 = _2820;
    float _2990 = fma(_2678, -0.5, 0.5);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2978;
    float _2996 = _2994 + _2980;
    float _2998 = -_2982;
    float _3000 = _2998 + _2984;
    float _3002 = -_2986;
    float _3004 = _3002 + _2988;
    bool _3006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3008 = fma(_2992, _2996, _2978);
    float _3010 = fma(_2992, _3000, _2982);
    float _3012 = fma(_2992, _3004, _2986);
    float _3014 = _2700 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3016 = _3008 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3018 = fma(_3010, 0.298911988735198974609375, _3016);
    out.m_109.w = _3014;
    float _3020 = fma(_3012, 0.114477999508380889892578125, _3018);
    float _3022 = -_3020;
    float _3024 = _3010 + _3022;
    float _3026 = -_3020;
    float _3028 = _3008 + _3026;
    float _3030 = -_3020;
    float _3032 = _3012 + _3030;
    out.m_113.x = 0.0;
    float _3034 = fma(_3024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    float _3036 = fma(_3028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    float _3038 = fma(_3032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    out.m_115.x = _3034;
    out.m_115.y = _3036;
    out.m_115.z = _3038;
    if (!_3006)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3040 = -_1749;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1751;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1755;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3052 = _3042 * _3042;
    float _3054 = fma(_3046, _3046, _3052);
    float _3056 = fma(_3050, _3050, _3054);
    float _3058 = sqrt(_3056);
    float _3060 = rsqrt(_3056);
    float _3062 = -_3058;
    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3068 = precise::clamp(_3066, 0.0, 1.0);
    float _3070 = _3046 * _3060;
    float _3072 = _3042 * _3060;
    float _3074 = abs(_3068);
    float _3076 = log2(_3074);
    float _3078 = _3050 * _3060;
    float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3082 = _2678 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2676, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2686, _3078, _3090);
    float _3098 = precise::clamp(_3096, 0.0, 1.0);
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3102 = _3094 + _3100;
    float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = exp2(_3104);
    float _3112 = _3110 * _3108;
    float _3114 = _3098 * _3112;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_113.x = _3116;
    out.m_113.y = _3118;
    out.m_113.z = _3120;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2892 = false;
    bool _352 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_56.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_59.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_150);
        out.gl_Position.z = _3177;
    }
    if (!_138)
    {
        return out;
    }
    float _154 = in.m_61.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_59.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3247 = as_type<float>(_188);
        out.gl_Position.z = _3247;
    }
    if (_180)
    {
        return out;
    }
    float _190 = in.m_63.y;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_63.z;
    float _196 = in.m_65.y;
    float _198 = in.m_65.z;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = _190 * _190;
    float _206 = in.m_63.x;
    float _208 = _194 * _194;
    float _210 = in.m_65.x;
    float _212 = fma(_196, _196, _204);
    float _214 = in.m_67.x;
    float _216 = fma(_198, _198, _208);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _216);
    float _222 = sqrt(_218);
    float _224 = in.m_69.x;
    float _226 = in.m_69.y;
    float _228 = in.m_69.z;
    float _230 = sqrt(_220);
    bool _232 = _222 > 0.0;
    bool _234 = _230 > 0.0;
    float _236 = _190 * _226;
    float _238 = _196 * _226;
    float _240 = _200 * _226;
    float _242 = 0.0;
    float _244 = _222;
    float _246 = _220;
    if (_232)
    {
        float _248 = rsqrt(_218);
        _242 = _248;
    }
    float _250 = _242;
    float _252 = fma(_224, _206, _236);
    float _254 = fma(_224, _210, _238);
    float _256 = fma(_224, _214, _240);
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = _252;
    if (!_232)
    {
        _258 = 0.0;
        _260 = 0.0;
    }
    float _264 = _258;
    float _266 = _260;
    float _268 = fma(_194, _228, _252);
    float _270 = _266;
    float _272 = _264;
    if (!_232)
    {
        _262 = 0.0;
    }
    float _274 = _262;
    float _276 = fma(_198, _228, _254);
    float _278 = 0.0;
    float _280 = _274;
    if (_234)
    {
        float _282 = rsqrt(_220);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = 0.0;
    if (!_234)
    {
        _286 = 0.0;
    }
    float _288 = _286;
    float _290 = fma(_202, _228, _256);
    float _292 = _288;
    if (!_234)
    {
        _244 = 0.0;
    }
    float _294 = _244;
    float _296 = _294;
    if (_232)
    {
        float _298 = _250 * _196;
        _270 = _298;
    }
    float _300 = _270;
    float _302 = _300;
    if (!_234)
    {
        _246 = 0.0;
    }
    float _304 = _246;
    float _306 = _304;
    if (_232)
    {
        float _308 = _250 * _190;
        _272 = _308;
    }
    float _310 = _272;
    float _312 = _310;
    if (_232)
    {
        float _314 = _250 * _200;
        _280 = _314;
    }
    float _316 = _280;
    float _318 = _316;
    if (_234)
    {
        float _320 = _284 * _198;
        _292 = _320;
    }
    float _322 = _292;
    if (_234)
    {
        float _324 = _284 * _194;
        _296 = _324;
    }
    float _326 = _296;
    if (_234)
    {
        float _328 = _284 * _202;
        _306 = _328;
    }
    float _330 = _306;
    bool _332 = !_192;
    float _350;
    if (!_332)
    {
        float _334 = in.m_71.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_134);
        float _356 = 1.0 / _354;
        float _358 = _168 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_56.x;
    float _364 = in.m_56.y;
    float _366 = in.m_56.z;
    float _368 = in.m_65.w;
    float _370 = in.m_67.w;
    float _372 = _196 * _364;
    float _374 = _200 * _364;
    float _376 = fma(_210, _362, _372);
    float _378 = fma(_214, _362, _374);
    float _380 = fma(_198, _366, _376);
    float _382 = fma(_202, _366, _378);
    float _384 = _380 + _368;
    float _386 = _382 + _370;
    float _388 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _390 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _392 = floor(_388);
    float _394 = floor(_390);
    float _396 = -_392;
    float _398 = _388 + _396;
    float _400 = -_394;
    float _402 = _390 + _400;
    float2 _3555 = float2(_398, _402);
    float _404 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3555, float2(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3555, float2(0.0), isnan(_3555)), level(0.0)).x;
    float _406 = in.m_71.z;
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    float _412 = _190 * _364;
    float _414 = in.m_71.y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = in.m_71.x;
    float _422 = fma(_206, _362, _412);
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _430 = _428 != 0;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _434 = _432 != 0;
    float _436 = 1.0 / _418;
    float _438 = fma(_194, _366, _422);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _446 = _360 + _444;
    float _448 = _410 * _168;
    float _450 = 1.0 / _442;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _454 = 1.0 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _456;
    bool _460 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _468 = _464 || _466;
    float _470 = in.m_63.w;
    float _472 = _406 * 2.0;
    bool _474 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = exp2(_448);
    float _486 = _414 + _406;
    float _488 = _446 * _436;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _492 = _360 + _490;
    bool _494 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _496 = isnan(_360);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _486 + (-1.0);
    float _508 = _420 * 2.0;
    float _510 = 1.0 / _454;
    float _512 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _514 = _414 * 2.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _518 = _360 + _516;
    float _520 = _492 * _450;
    float _522 = _420 + _406;
    float _524 = _420 + _414;
    float _526 = 1.0 / _458;
    float _528 = -_484;
    float _530 = _528 + 1.0;
    float _532 = _522 + (-1.0);
    float _534 = _524 + (-1.0);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _536;
    float _540 = _482 ? _530 : 0.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _546 = floor(_514);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_468)
    {
        float _550 = _540 * _510;
        _170 = _550;
    }
    float _552 = _170;
    float _554 = _268 * _268;
    float _556 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _558 = !_426;
    int _560 = _558 ? 0 : 1;
    float _562 = floor(_472);
    float _564 = _518 * _526;
    float _566 = fma(_276, _276, _554);
    bool _568 = !_430;
    int _570 = _568 ? 0 : 1;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _572;
    bool _576 = !_434;
    int _578 = _576 ? 0 : 1;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _580;
    float _584 = floor(_508);
    bool _586 = _546 > 0.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _592 = _546 >= 0.0;
    bool _594 = isnan(_546);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _606 = fma(_290, _290, _566);
    bool _608 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _610 = isnan(_360);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = fma(_590, _520, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _622 = _562 >= 0.0;
    bool _624 = isnan(_562);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = fma(_604, _520, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _634 = fma(_544, _520, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _636 = rsqrt(_606);
    bool _638 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _640 = isnan(_360);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -_618;
    float _652 = _650 + 1.0;
    float _654 = fma(_582, _488, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _656 = _584 >= 0.0;
    bool _658 = isnan(_584);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_574, _488, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _668 = fma(_538, _488, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _682 = _680 != 0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _684;
    bool _688 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _690 = isnan(_360);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _438 + _470;
    int _702 = _630 ? 0 : 1;
    float _704 = fma(_686, _564, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _706 = _664 ? 0 : 1;
    float _708 = -_698;
    float _710 = _708 + 1.0;
    float _712 = _276 * _636;
    float _714 = _268 * _636;
    float _716 = _290 * _636;
    float _718 = _618 * _710;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _720;
    float _724 = _504 * _652;
    float _726 = -_504;
    float _728 = _726 + 1.0;
    float _730 = fma(_722, _564, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _732 = _562 > 0.0;
    float _734 = _648 * _728;
    float _736 = -_648;
    float _738 = _736 + 1.0;
    bool _740 = _584 > 0.0;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _742;
    float _746 = _654 * _734;
    float _748 = _666 * _734;
    float _750 = _668 * _734;
    int _752 = _600 ? 0 : 1;
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _746);
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _748);
    float _758 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].z, _750);
    float _760 = fma(_744, _564, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _762 = fma(_620, _724, _754);
    float _764 = _714 * _310;
    float _766 = fma(_634, _724, _758);
    float _768 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _770 = fma(_632, _724, _756);
    float _772 = fma(_730, _718, _762);
    bool _774 = !_678;
    int _776 = _774 ? 0 : 1;
    float _778 = _768 * _670;
    int _780 = ~_702;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_760, _718, _770);
    int _788 = ~_706;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    float _794 = fma(_704, _718, _766);
    int _796 = ~_752;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].x, _772);
    int _804 = _784;
    int _806 = _792;
    int _808 = _800;
    float _810 = _712;
    if (!_732)
    {
        int _812 = ~_702;
        int _814 = _812 + 1;
        _804 = _814;
    }
    int _816 = _804;
    float _818 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].z, _794);
    if (!_740)
    {
        int _820 = ~_706;
        int _822 = _820 + 1;
        _806 = _822;
    }
    int _824 = _806;
    if (!_586)
    {
        int _826 = ~_752;
        int _828 = _826 + 1;
        _808 = _828;
    }
    int _830 = _808;
    float _832 = fma(_712, _300, _764);
    bool _834 = !_674;
    int _836 = _834 ? 0 : 1;
    float _838 = in.m_73.x;
    float _840 = in.m_73.y;
    float _842 = in.m_73.z;
    int _844 = abs(_776);
    float _846 = fma(_716, _316, _832);
    bool _848 = !_682;
    int _850 = _848 ? 0 : 1;
    float _852 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[203].x, _778);
    float _854 = float(_816);
    int _856 = abs(_836);
    float _858 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _860 = float(_824);
    float _862 = float(_844);
    float _864 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].x, _858);
    int _866 = abs(_850);
    float _868 = abs(_846);
    bool _870 = _868 > 0.99989998340606689453125;
    float _872 = _862 * _860;
    float _874 = float(_856);
    float _876 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[11].z, _864);
    float _878 = _872 * (-2.0);
    float _880 = float(_830);
    float _882 = _852 + 0.25;
    float _884 = float(_866);
    float _886 = _874 * _854;
    float _888 = floor(_852);
    float _890 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _892 = _876 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _894 = _884 * _880;
    if (_870)
    {
        float _896 = fma(_322, 0.001000000047497451305389404296875, _300);
        _302 = _896;
    }
    float _898 = _302;
    if (_870)
    {
        float _900 = fma(_326, 0.001000000047497451305389404296875, _310);
        _312 = _900;
    }
    float _902 = _312;
    float _904 = fma(_512, _878, _512);
    float _906 = _894 * (-2.0);
    float _908 = floor(_882);
    float _910 = fma(_878, _840, _840);
    float _912 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _914 = fma(_556, _906, _556);
    float _916 = fma(_906, _842, _842);
    float _918 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].x, _890);
    float _920 = _406 + (-0.5);
    float _922 = _700 + _912;
    float _924 = 1.0 / _892;
    float _926 = _414 + (-0.5);
    float _928 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[10].z, _918);
    float _930 = -_888;
    float _932 = _852 + _930;
    int _934 = abs(_570);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].y, _910);
    float _938 = _852 * 6.283185482025146484375;
    float _940 = _928 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _942 = -_908;
    float _944 = _882 + _942;
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _916);
    float _948 = _922 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _950 = _938 * 0.15915493667125701904296875;
    float _952 = _940 + _892;
    bool _954 = _932 >= 0.5;
    bool _956 = isnan(_932);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.5);
    bool _962 = _958 || _960;
    float _964 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[126].x, _948);
    float _966 = _950 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[126].z, _964);
    bool _972 = _944 > 0.5;
    float _974 = _952 * _924;
    float _976 = _974 * 0.5;
    float _978 = fma(_904, _552, _936);
    float _980 = _970 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _982 = !_962;
    float _984 = _982 ? 0.5 : (-0.5);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[30].w, _986);
    int _990 = abs(_560);
    float _992 = _922 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _994 = float(_934);
    float _996 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _998 = _996 * 2.0;
    float _1000 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[127].x, _992);
    float _1002 = _944;
    float _1004 = _988;
    if (_870)
    {
        float _1006 = fma(_330, 0.001000000047497451305389404296875, _316);
        _318 = _1006;
    }
    float _1008 = _318;
    float _1010 = _994 * _998;
    int _1012 = abs(_578);
    if (_972)
    {
        float _1014 = -_944;
        float _1016 = _1014 + 1.0;
        _1002 = _1016;
    }
    float _1018 = _1002;
    float _1020 = float(_990);
    float _1022 = _968 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1024 = fma(_1018, 4.0, -1.0);
    float _1026 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1000);
    float _1028 = fma(_1020, _1022, _1010);
    float _1030 = float(_1012);
    float _1032 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1036 = trunc(_980);
    int _1038 = int(_1036);
    float _1040 = _978 * 0.15915493667125701904296875;
    float _1042 = fma(_1030, _1032, _1028);
    float _1044 = -_1008;
    float _1046 = _714 * _1044;
    float _1048 = in.m_75.x;
    float _1050 = in.m_75.y;
    float _1052 = in.m_75.z;
    float _1054 = -_902;
    float _1056 = _712 * _1054;
    float _1058 = -_898;
    float _1060 = _716 * _1058;
    float _1062 = fma(_914, _552, _946);
    float _1064 = trunc(_1034);
    int _1066 = int(_1064);
    float _1068 = fma(_1042, 3.1415927410125732421875, _838);
    float _1070 = _886 * (-2.0);
    float _1072 = -_1008;
    float _1074 = -_1060;
    float _1076 = fma(_712, _1072, _1074);
    float _1078 = -_902;
    float _1080 = -_1046;
    float _1082 = fma(_716, _1078, _1080);
    float _1084 = -_898;
    float _1086 = -_1056;
    float _1088 = fma(_714, _1084, _1086);
    float _1090 = _1062 * 0.15915493667125701904296875;
    float _1092 = in.m_77.x;
    float _1094 = in.m_77.y;
    float _1096 = in.m_77.z;
    float _1098 = 1.0 / _988;
    float _1100 = _420 + (-0.5);
    float _1102 = fma(_1068, _1070, _1068);
    float _1104 = fma(_548, _1070, _548);
    float _1106 = _1076 * _1076;
    float _1108 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1102);
    float _1110 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].y, _786);
    float _1112 = _1040 * 6.283185482025146484375;
    float _1114 = sin(_1112);
    int _1116 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1118 = _1066 + _1116;
    int _1120 = _1118 + 1;
    float _1122 = fma(_1104, _552, _1108);
    float _1124 = fma(_1082, _1082, _1106);
    float _1126 = _802 * _1048;
    float _1128 = _1110 * _1050;
    float _1130 = _1122 * 0.15915493667125701904296875;
    float _1132 = fma(_1088, _1088, _1124);
    float _1134 = _1040 * 6.283185482025146484375;
    float _1136 = cos(_1134);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1140 = _1098 * _1138;
    float _1142 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1146 = _1140 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1148 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1092);
    float _1150 = _1130 * 6.283185482025146484375;
    float _1152 = sin(_1150);
    int _1154 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1156 = _1038 + _1154;
    int _1158 = _1156 + 1;
    float _1160 = _818 * _1052;
    float _1162 = _1148 * _1142;
    bool _1164 = _1158 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1166 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1168 = _1158 | _1120;
    float _1170 = _1130 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    bool _1174 = !_1146;
    int _1176 = _1174 ? 0 : 1;
    bool _1178 = _1168 < 0;
    bool _1180 = _1178 || _1164;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1096);
    int _1184 = 2;
    int _1186 = _1158;
    int _1188 = as_type<int>(_1098);
    int _1190 = as_type<int>(_1128);
    if (!_1146)
    {
        _1184 = 1;
    }
    int _1192 = _1184;
    bool _1194 = _1120 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1196 = _1194 || _1180;
    float _1198 = _1090 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    bool _1202 = _1140 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1204 = _1152 * _1114;
    float _1206 = _1182 * _1166;
    bool _1208 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1210 = isnan(0.5);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1216 = _1212 || _1214;
    float _1218 = rsqrt(_1132);
    float _1220 = _1172 * _1114;
    int _1222 = _1192;
    if (!_1196)
    {
        int _1224 = _1120 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1226 = _1224 + _1158;
        _1186 = _1226;
    }
    int _1228 = _1186;
    if (!_1202)
    {
        _1222 = _1176;
    }
    int _1230 = _1222;
    float _1232 = _1090 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1094);
    float _1238 = _1136 * _1200;
    int _1240 = _1230 << 6;
    float _1242 = _1114 * _1200;
    float _1244 = _1236 * _1144;
    float _1246 = _1172 * _1136;
    float _1248 = _1152 * _1136;
    float _1250 = _1088 * _1218;
    float _1252 = _1082 * _1218;
    float _1254 = _1076 * _1218;
    float _1256 = _1172 * _1200;
    float _1258 = _1152 * _1200;
    int _1260 = _1240 + 96;
    uint _1263 = uint(int(uint(_1260) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
    float _1279 = as_type<float>(_1230);
    if (!_1196)
    {
        int _1281 = _1228 << 2;
        _1188 = _1281;
    }
    int _1283 = _1188;
    float _1285 = _712 * _1256;
    float _1287 = fma(_1234, _1246, _1204);
    float _1289 = fma(_1234, _1204, _1246);
    float _1291 = -_1220;
    float _1293 = fma(_1234, _1248, _1291);
    float _1295 = _714 * _1250;
    float _1297 = _1287 * _712;
    float _1299 = -_1248;
    float _1301 = fma(_1234, _1220, _1299);
    int _1303 = _1240 + 48;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    float _1321 = -_1295;
    float _1323 = fma(_716, _1254, _1321);
    float _1325 = fma(_1238, _1252, _1297);
    float _1327 = _712 * _1301;
    float _1329 = -_1234;
    float _1331 = fma(_1329, _1252, _1285);
    float _1333 = _716 * _1301;
    float _1335 = fma(_1293, _1323, _1325);
    float _1337 = fma(_1242, _1252, _1327);
    float _1339 = _712 * _1254;
    int _1341 = _1240 + 104;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    float _1359 = _716 * _1256;
    float _1361 = fma(_1258, _1323, _1331);
    float _1363 = fma(_1289, _1323, _1337);
    float _1365 = _1287 * _716;
    float _1367 = -_1339;
    float _1369 = fma(_714, _1252, _1367);
    float _1371 = -_1234;
    float _1373 = fma(_1371, _1250, _1359);
    float _1375 = fma(_1242, _1250, _1333);
    int _1377 = _1240 + 64;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.vp_c15)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[int(_1389)][_1391];
    float _1395 = fma(_1238, _1250, _1365);
    float _1397 = fma(_1258, _1369, _1373);
    float _1399 = _1244 * _1361;
    int _1401 = _1283;
    float _1403 = _1293;
    if (!_1196)
    {
        uint _1405 = uint(int(uint(_1228) >> uint(2)));
        _1190 = int(_1405);
    }
    int _1407 = _1190;
    float _1409 = fma(_1293, _1369, _1395);
    float _1411 = _1244 * _1397;
    float _1413 = fma(_1289, _1369, _1375);
    if (!_1196)
    {
        int _1415 = 12 & _1283;
        _1401 = _1415;
    }
    int _1417 = _1401;
    int _1419 = _1240 + 56;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    uint _1423 = uint(int(uint(int(_1421)) >> uint(2)));
    int _1425 = int(_1421) & 3;
    float _1427 = (*spvDescriptorSet0.vp_c15)._m0[int(_1423)][_1425];
    int _1429 = int(_1421) + 1;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    int _1433 = _1429 & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    float _1437 = fma(_1162, _1409, _1411);
    float _1439 = fma(_1162, _1335, _1399);
    if (!_1196)
    {
        int _1441 = _1407 << 4;
        int _1443 = _1441 + _1417;
        _1004 = as_type<float>(_1443);
    }
    float _1445 = _1004;
    float _1447 = _716 * _1252;
    float _1449 = fma(_1206, _1413, _1437);
    float _1451 = fma(_1206, _1363, _1439);
    float _1453 = _714 * _1256;
    int _1455 = _1240 + 72;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.vp_c15)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    float _1473 = _386 + _1449;
    float _1475 = _384 + _1451;
    float _1477 = -_1447;
    float _1479 = fma(_712, _1250, _1477);
    float _1481 = _1287 * _714;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1485 = _1473 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1489 = _1475 + _1487;
    float _1491 = -_1234;
    float _1493 = fma(_1491, _1254, _1453);
    int _1495 = _1240 + 80;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    float _1513 = _1485 * _1485;
    float _1515 = _714 * _1301;
    float _1517 = fma(_1238, _1254, _1481);
    float _1519 = fma(_1258, _1479, _1493);
    float _1521 = fma(_1489, _1489, _1513);
    float _1523 = _922 * _1277;
    float _1525 = _922 * _1319;
    int _1527 = _1240 + 88;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    uint _1531 = uint(int(uint(int(_1529)) >> uint(2)));
    int _1533 = int(_1529) & 3;
    float _1535 = (*spvDescriptorSet0.vp_c15)._m0[int(_1531)][_1533];
    int _1537 = int(_1529) + 1;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    int _1541 = _1537 & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    float _1545 = sqrt(_1521);
    float _1547 = fma(_384, _1269, _1523);
    float _1549 = fma(_1242, _1254, _1515);
    float _1551 = fma(_1293, _1479, _1517);
    float _1553 = _1244 * _1519;
    float _1555 = fma(_384, _1311, _1525);
    float _1557 = fma(_386, _1349, _1547);
    float _1559 = _1445;
    float _1561 = _1475;
    float _1563 = _1473;
    float _1565 = _1493;
    int _1567 = as_type<int>(_1515);
    if (!_1196)
    {
        int _1569 = as_type<int>(_1445) + 400;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        uint _1573 = uint(int(uint(int(_1571)) >> uint(2)));
        int _1575 = int(_1571) & 3;
        float _1577 = (*spvDescriptorSet0.vp_c15)._m0[int(_1573)][_1575];
        _1559 = _1577;
    }
    float _1579 = _1559;
    float _1581 = fma(_1289, _1479, _1549);
    float _1583 = fma(_1162, _1551, _1553);
    float _1585 = _1557 + _1357;
    float _1587 = _1525;
    if (!_1196)
    {
        float _1589 = floor(_980);
        _1587 = _1589;
    }
    float _1591 = _1587;
    float _1593 = fma(_1206, _1581, _1583);
    float _1595 = _922 * _1393;
    bool _1597 = _1545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = _700 + _1593;
    float _1601 = fma(_384, _1385, _1595);
    float _1603 = 1.0 / _1585;
    float _1605 = fma(_386, _1427, _1555);
    float _1607 = _1605 + _1435;
    float _1609 = fma(_386, _1463, _1601);
    float _1611 = _1601;
    float _1613 = _1385;
    float _1615 = _1545;
    float _1617 = _1593;
    float _1619 = _1511;
    float _1621 = _1503;
    if (!_1597)
    {
        _1611 = _1599;
    }
    float _1623 = _1611;
    float _1625 = _1609 + _1471;
    bool _1627 = !_1597;
    float _1629 = _1623;
    float _1631 = _1579;
    if (!_1627)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1637 = _1545 + _1635;
        float _1639 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = rsqrt(_1521);
        float _1643 = _1637 * _1633;
        float _1645 = _1643 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1645 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1649 + (-1.0);
        float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1659 = fma(_1653, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1661 = fma(_1599, _1649, _1657);
        float _1663 = _1641 * _1659;
        float _1665 = fma(_1489, _1663, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1667 = fma(_1485, _1663, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1561 = _1665;
        _1563 = _1667;
        _1629 = _1661;
        _1613 = _1663;
        _1615 = _1637;
        _1617 = _1657;
    }
    float _1669 = _1561;
    float _1671 = _1563;
    float _1673 = _1629;
    float _1675 = _1613;
    float _1677 = _1615;
    float _1679 = _1617;
    float _1681 = _1607 * _1603;
    float _1683 = _1675;
    float _1685 = _1679;
    float _1687 = _1673;
    float _1689 = _1677;
    if (_1216)
    {
        _1683 = _1669;
    }
    float _1691 = _1683;
    float _1693 = _1691;
    if (_1216)
    {
        _1685 = _1671;
    }
    float _1695 = _1685;
    float _1697 = _1695;
    if (!_1216)
    {
        float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1701 = _700 + _1699;
        float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1705 = _384 + _1703;
        float _1707 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1709 = -_386;
        float _1711 = _1709 + _1671;
        float _1713 = _1701 * _1701;
        float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1717 = _386 + _1715;
        float _1719 = fma(_1705, _1705, _1713);
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1723 = fma(_1717, _1717, _1719);
        float _1725 = sqrt(_1723);
        float _1727 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1729 = precise::min(_1725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1731 = _1729 * _1721;
        float _1733 = -_700;
        float _1735 = _1733 + _1673;
        float _1737 = _1727 * _1731;
        float _1739 = -_384;
        float _1741 = _1739 + _1669;
        float _1743 = fma(_1735, _1737, _700);
        float _1745 = fma(_1741, _1737, _384);
        float _1747 = fma(_1711, _1737, _386);
        _1687 = _1743;
        _1693 = _1745;
        _1689 = _1737;
        _1697 = _1747;
    }
    float _1749 = _1687;
    float _1751 = _1693;
    float _1753 = _1689;
    float _1755 = _1697;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1759 = _1625 * _1603;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1765 = isnan(0.5);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    float _1773 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1757);
    float _1775 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1777 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    bool _1779 = _1681 >= 0.0;
    float _1781 = _1753;
    if (!_1196)
    {
        float _1783 = floor(_1034);
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1775);
    float _1789 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1773);
    float _1791 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1777);
    bool _1793 = _1681 <= 1.0;
    bool _1795 = _1793 && _1779;
    float _1797 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1799 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1805 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1807 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1809 = _1759 >= 0.0;
    bool _1811 = _1809 && _1795;
    float _1813 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1815 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1817 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1819 = _1759 <= 1.0;
    bool _1821 = _1819 && _1811;
    float _1823 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1813);
    float _1825 = -_1815;
    float _1827 = fma(_1825, _1807, 1.0);
    float _1829 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1817);
    if (_1771)
    {
        _810 = 1.0;
    }
    float _1831 = _810;
    float _1833 = _1831;
    if (!_1771)
    {
        float _1835 = as_type<float>(in.m_81.w);
        int _1837 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1839 = _1837 == 4;
        bool _1841 = _1837 == 8;
        bool _1843 = _1837 == 12;
        int _1845 = as_type<int>(_1835) << 16;
        int _1847 = as_type<int>(_1835) << 8;
        int _1849 = as_type<int>(_1835) << 24;
        int _1851 = _1845 >> 24;
        int _1853 = _1847 >> 24;
        int _1855 = as_type<int>(_1835) >> 24;
        int _1857 = _1849 >> 24;
        float _1859 = float(_1851);
        float _1861 = float(_1853);
        float _1863 = float(_1855);
        float _1865 = _1859 * 0.0078740157186985015869140625;
        float _1867 = float(_1857);
        float _1869 = _1861 * 0.0078740157186985015869140625;
        float _1871 = _1863 * 0.0078740157186985015869140625;
        float _1873 = precise::min(_1865, 1.0);
        float _1875 = _1867 * 0.0078740157186985015869140625;
        float _1877 = precise::min(_1869, 1.0);
        float _1879 = precise::min(_1871, 1.0);
        float _1881 = precise::min(_1875, 1.0);
        float _1883 = precise::max(_1873, -1.0);
        float _1885 = precise::max(_1877, -1.0);
        float _1887 = precise::max(_1879, -1.0);
        float _1889 = precise::max(_1881, -1.0);
        float _1891 = _1889;
        if (_1839)
        {
            _1891 = _1883;
        }
        float _1893 = _1891;
        float _1895 = _1893;
        if (_1841)
        {
            _1895 = _1885;
        }
        float _1897 = _1895;
        float _1899 = _1897;
        if (_1843)
        {
            _1899 = _1887;
        }
        float _1901 = _1899;
        float _1903 = abs(_1901);
        float _1905 = (-0.0) + _1903;
        _1833 = _1905;
    }
    float _1907 = _1833;
    float _1909 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1911 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1913 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1829);
    float _1915 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1917 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1909);
    bool _1919 = _1907 != 0.0;
    bool _1921 = isnan(_1907);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan(0.0);
    bool _1927 = _1923 || _1925;
    float _1929 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1913);
    float _1931 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1915);
    float _1933 = _922 * _1511;
    float _1935 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1917);
    float _1937 = 1.0 / _1929;
    float _1939 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1941 = fma(_384, _1503, _1933);
    float _1943 = _1939;
    float _1945 = _1929;
    if (_1821)
    {
        float _1947 = float(_1230);
        _1279 = _1947;
    }
    float _1949 = _1279;
    float _1951 = fma(_386, _1535, _1941);
    float _1953 = log2(_1827);
    float _1955 = _1951 + _1543;
    float _1957 = _1933;
    float _1959 = _1955;
    if (_1821)
    {
        float _1961 = rint(_1949);
        float _1963 = precise::max(_1961, 0.0);
        uint _1965 = uint(_1963);
        uint _1967 = clamp(_1965, 0u, 65535u);
        _1957 = as_type<float>(_1967);
    }
    float _1969 = _1957;
    float _1971 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1935);
    float _1973 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1939);
    if (!_1196)
    {
        float _1975 = -_1785;
        float _1977 = _1034 + _1975;
        _1943 = _1977;
    }
    float _1979 = _1943;
    float _1981 = _1955 * _1603;
    if (!_1196)
    {
        float _1983 = -_1591;
        float _1985 = _980 + _1983;
        _1959 = _1985;
    }
    float _1987 = _1959;
    if (_1927)
    {
        _1619 = _1971;
    }
    float _1989 = _1619;
    float _1991 = _1989;
    if (_1927)
    {
        _1621 = _1973;
    }
    float _1993 = _1621;
    float _1995 = _1993;
    if (!_1927)
    {
        _1991 = 0.0;
        _1995 = 0.0;
    }
    float _1997 = _1991;
    float _1999 = _1995;
    float _2001 = _1951;
    if (!_1196)
    {
        float _2003 = rint(_1579);
        float _2005 = precise::max(_2003, 0.0);
        uint _2007 = uint(_2005);
        uint _2009 = clamp(_2007, 0u, 65535u);
        _2001 = as_type<float>(_2009);
    }
    float _2011 = _2001;
    float _2013 = _1953 * 0.693147182464599609375;
    float _2015 = _1937 * _1997;
    float _2017 = _1937 * _1999;
    float _2019 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2021 = fma(_2015, 0.5, 0.5);
    float _2023 = fma(_2017, -0.5, 0.5);
    float _2025 = _1941;
    float _2027 = _2013;
    float _2029 = _2021;
    if (_1821)
    {
        float3 _6071 = float3(_1681, _1759, float(as_type<int>(_1969)));
        float3 _6075 = select(_6071, float3(0.0), isnan(_6071));
        float _2031 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6075.xy, uint(rint(_6075.z)), _1981, level(0.0));
        _2025 = _2031;
    }
    float _2033 = _2025;
    float3 _6085 = float3(_2021, _2023, _2019);
    float _2035 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6085, float3(0.0), isnan(_6085)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6085, float3(0.0), isnan(_6085)), level(0.0)).x;
    float3 _6094 = float3(_2021, _2023, _2019);
    float4 _2038 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6094, float3(0.0), isnan(_6094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6094, float3(0.0), isnan(_6094)), level(0.0)).xyzw;
    float _2040 = _2038.x;
    float _2042 = _2038.y;
    float _2044 = _2038.z;
    float _2046 = _2038.w;
    float _2048 = _1979;
    if (!_1196)
    {
        float3 _6117 = float3(_1987, _1979, float(as_type<int>(_2011)));
        float3 _6119 = select(_6117, float3(0.0), isnan(_6117));
        float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6119.xy, uint(rint(_6119.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6119.xy, uint(rint(_6119.z)), level(0.0)).x;
        _2048 = _2050;
    }
    float _2052 = _2048;
    if (_1196)
    {
        _2027 = 1.0;
    }
    float _2054 = _2027;
    float _2056 = _2054;
    if (!_1196)
    {
        int _2058 = _1228 << 4;
        int _2060 = _2058 + 2048;
        uint _2062 = uint(int(uint(_2060) >> uint(2)));
        uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
        int _2066 = int(_2062) & 3;
        float _2068 = (*spvDescriptorSet0.vp_c15)._m0[int(_2064)][_2066];
        int _2070 = int(_2062) + 1;
        uint _2072 = uint(int(uint(_2070) >> uint(2)));
        int _2074 = _2070 & 3;
        float _2076 = (*spvDescriptorSet0.vp_c15)._m0[int(_2072)][_2074];
        int _2078 = _2060 + 8;
        uint _2080 = uint(int(uint(_2078) >> uint(2)));
        uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
        int _2084 = int(_2080) & 3;
        float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
        int _2088 = int(_2080) + 1;
        uint _2090 = uint(int(uint(_2088) >> uint(2)));
        int _2092 = _2088 & 3;
        float _2094 = (*spvDescriptorSet0.vp_c15)._m0[int(_2090)][_2092];
        float _2096 = _922 * _2076;
        float _2098 = fma(_384, _2068, _2096);
        float _2100 = fma(_386, _2086, _2098);
        float _2102 = _2100 + _2094;
        float _2104 = precise::clamp(_2102, 0.0, 1.0);
        float _2106 = -_2104;
        float _2108 = _2106 + _2052;
        float _2110 = fma(_2108, 500.0, 1.5);
        float _2112 = exp2(_2110);
        float _2114 = 0.0 + _2112;
        float _2116 = precise::clamp(_2114, 0.0, 1.0);
        _2056 = _2116;
    }
    float _2118 = _2056;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2122 = _1749 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2126 = _1751 + _2124;
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2130 = _1755 + _2128;
    float _2132 = _2122 * _2122;
    float _2134 = fma(_2126, _2126, _2132);
    float _2136 = fma(_2130, _2130, _2134);
    float _2138 = rsqrt(_2136);
    float _2140 = sqrt(_2136);
    float _2142 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2144 = _2126 * _2142;
    float _2146 = _2130 * _2142;
    float _2148 = _2144 * _2144;
    float _2150 = _2146 * _2146;
    float _2152 = _2148 + _2150;
    float _2154 = sqrt(_2152);
    bool _2156 = _2154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2160 = _2154 + _2158;
    float _2162 = _2134;
    float _2164 = _2138;
    float _2166 = _2160;
    float _2168 = _2122;
    bool _2170 = _2156;
    if (_2156)
    {
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2162 = _2172;
    }
    float _2174 = _2162;
    if (_2156)
    {
        float _2176 = rsqrt(_2152);
        _2164 = _2176;
    }
    float _2178 = _2164;
    float _2180 = _2178;
    if (_2156)
    {
        float _2182 = _2160 * _2174;
        _2166 = _2182;
    }
    float _2184 = _2166;
    if (_2156)
    {
        float _2186 = _2184 * 0.15915493667125701904296875;
        _2029 = _2186;
    }
    float _2188 = _2029;
    float _2190 = _2130;
    float _2192 = _2188;
    if (_2156)
    {
        float _2194 = _2188 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        _2190 = _2196;
    }
    float _2198 = _2190;
    float _2200 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2202 = precise::max(0.0, _2200);
    float _2204 = _2174;
    float _2206 = _2202;
    if (_2156)
    {
        float _2208 = _2188 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        _2204 = _2210;
    }
    float _2212 = _2204;
    float _2214 = -_2142;
    float _2216 = -_2202;
    float _2218 = fma(_2122, _2214, _2216);
    if (_2156)
    {
        float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2220;
    }
    float _2222 = _2168;
    float _2224 = _2222;
    float _2226 = _2198;
    if (_2156)
    {
        float _2228 = fma(_2198, _2222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2224 = _2228;
    }
    float _2230 = _2224;
    float _2232 = _2230;
    if (!_2156)
    {
        _2226 = _2144;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    float _2238 = _2212;
    if (_2156)
    {
        float _2240 = _2212 + (-1.0);
        _2206 = _2240;
    }
    float _2242 = _2206;
    float _2244 = _2242;
    if (_2156)
    {
        float _2246 = _2178 * _2230;
        _1631 = _2246;
    }
    float _2248 = _1631;
    if (!_2156)
    {
        _2232 = _2218;
    }
    float _2250 = _2232;
    float _2252 = _2250;
    if (_2156)
    {
        float _2254 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2192 = _2254;
    }
    float _2256 = _2192;
    if (_2156)
    {
        float _2258 = _2144 * _2248;
        _2236 = _2258;
    }
    float _2260 = _2236;
    if (!_2156)
    {
        _2244 = _2146;
    }
    float _2262 = _2244;
    float _2264 = _2262;
    if (_2156)
    {
        float _2266 = _2146 * _2248;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (!_2156)
    {
        _2180 = _2148;
    }
    float _2270 = _2180;
    float _2272 = _2270;
    if (_2156)
    {
        float _2274 = fma(_2218, _2212, _2256);
        _2252 = _2274;
    }
    float _2276 = _2252;
    if (_2156)
    {
        float _2278 = _2260 * _2260;
        _2272 = _2278;
    }
    float _2280 = _2272;
    if (!_2156)
    {
        _2238 = _2150;
    }
    float _2282 = _2238;
    float _2284 = _2282;
    if (_2156)
    {
        float _2286 = _2268 * _2268;
        _2284 = _2286;
    }
    float _2288 = _2284;
    float _2290 = fma(_2276, _2276, _2280);
    float _2292 = _2290 + _2288;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = rsqrt(_2292);
    float _2302 = -_2298;
    float _2304 = _2302 + 1.0;
    float _2306 = abs(_2304);
    float _2308 = log2(_2306);
    float _2310 = _2300 * _2260;
    float _2312 = _2300 * _2276;
    float _2314 = _2300 * _2268;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2318 = -_2316;
    float _2320 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2318);
    float _2322 = -_2314;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2320);
    float _2326 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2328 = fma(_2324, -0.5, 0.5);
    float _2330 = fma(_2324, 0.5, 0.5);
    float _2332 = exp2(_2326);
    float _2334 = fma(_2330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = fma(_2330, _2334, -0.212114393711090087890625);
    float _2338 = _2312 + 1.0;
    float _2340 = sqrt(_2328);
    float _2342 = fma(_2330, _2336, 1.570728778839111328125);
    float _2344 = -_2312;
    float _2346 = fma(_2332, _2338, _2344);
    float _2348 = _2340 * 0.636619746685028076171875;
    float _2350 = fma(_2346, 0.5, 0.5);
    float _2352 = -_2342;
    float _2354 = fma(_2348, _2352, 1.0);
    float2 _6591 = float2(_2354, _2350);
    float3 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).xyz;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = in.m_83.x;
    float _2368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2370 = in.m_83.y;
    int _2372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2374 = _2372 != 0;
    float _2376 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2380 = _2378 != 0;
    float _2382 = in.m_71.w;
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2386 = _2384 != 0;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2392 = _2390 != 0;
    float _2394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2396 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = -_404;
    float _2400 = _2398 + 1.0;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2404 = as_type<int>(_2346);
    bool _2406 = _2392;
    float _2408 = _2370;
    float _2410 = _2366;
    if (_2374)
    {
        bool _2412 = _420 > 0.5;
        _2170 = _2412;
    }
    bool _2414 = _2170;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_2374)
    {
        float _2420 = -_2366;
        float _2422 = _2420 + 1.0;
        _2404 = as_type<int>(_2422);
    }
    int _2424 = _2404;
    if (!_2374)
    {
        _1565 = _2366;
    }
    float _2426 = _1565;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2430 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2432 = -_2370;
    float _2434 = _2432 + 1.0;
    float _2436 = _2426;
    float _2438 = _2430;
    if (_2374)
    {
        float _2440 = _2414 ? as_type<float>(_2424) : _2366;
        _2436 = _2440;
    }
    float _2442 = _2436;
    float _2444 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2446 = _414 > 0.5;
    float _2448 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2450 = _2382 > 0.5;
    float _2452 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2454 = in.m_85.x;
    float _2456 = in.m_85.y;
    float _2458 = in.m_85.z;
    int _2460 = _2450 ? as_type<int>(_2434) : as_type<int>(_2370);
    float _2462 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2464 = _1094 != 0.0;
    bool _2466 = isnan(_1094);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan(0.0);
    bool _2472 = _2468 || _2470;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2476 = _2392 ? as_type<float>(_2460) : _2370;
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2380)
    {
        bool _2480 = _406 > 0.5;
        _2406 = _2480;
    }
    bool _2482 = _2406;
    float _2484 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2486 = _2484;
    if (_2386)
    {
        float _2488 = _2446 ? _2434 : _2370;
        _2408 = _2488;
    }
    float _2490 = _2408;
    out.m_87.x = _2448;
    out.m_87.y = _2452;
    out.m_87.z = _2462;
    bool _2492 = _1092 == 0.0;
    bool _2494 = !_2472;
    bool _2496 = _2492 && _2494;
    if (_2380)
    {
        float _2498 = -_2366;
        float _2500 = _2498 + 1.0;
        _1567 = as_type<int>(_2500);
    }
    int _2502 = _1567;
    float _2504 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2506 = abs(_1140);
    float _2508 = log2(_2506);
    float _2510 = in.m_89.x;
    float _2512 = in.m_89.y;
    float _2514 = in.m_89.z;
    float _2516 = in.m_89.w;
    bool _2518 = _1096 == 0.0;
    bool _2520 = _2518 && _2496;
    float _2522 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2380)
    {
        float _2524 = _2482 ? as_type<float>(_2502) : _2366;
        _2410 = _2524;
    }
    float _2526 = _2410;
    out.m_91.x = _2396;
    out.m_91.y = _2430;
    out.m_91.z = _2484;
    out.m_91.w = _2444;
    float _2528 = exp2(_2376);
    bool _2530 = _1140 <= 8000.0;
    bool _2532 = isnan(_1140);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(8000.0);
    bool _2538 = _2534 || _2536;
    float _2540 = float(_2538);
    out.m_93.x = _1751;
    out.m_93.y = _1749;
    out.m_93.z = _1755;
    float _2542 = _2540;
    if (_2520)
    {
        _1403 = _2454;
    }
    float _2544 = _1403;
    float _2546 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2548 = _2544;
    if (!_2520)
    {
        float _2550 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2454);
        _2548 = _2550;
    }
    float _2552 = _2548;
    float _2554 = _2490 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2558 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2520)
    {
        _2438 = _2456;
    }
    float _2560 = _2438;
    float _2562 = _2560;
    if (!_2520)
    {
        float _2564 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2456);
        _2562 = _2564;
    }
    float _2566 = _2562;
    if (_2520)
    {
        _2486 = _2458;
    }
    float _2568 = _2486;
    float _2570 = _2568;
    if (!_2520)
    {
        float _2572 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2570 = _2572;
    }
    float _2574 = _2570;
    float _2576 = _2514 * _2454;
    float _2578 = _2554 * _2368;
    float _2580 = exp2(_2546);
    float _2582 = _2512 * _2458;
    float _2584 = _2510 * _2456;
    float _2586 = _2504 * _2478;
    float _2588 = _2522 * _2394;
    float _2590 = -_2584;
    float _2592 = fma(_2512, _2454, _2590);
    float _2594 = _1519 * _2566;
    float _2596 = _2558 * _2556;
    float _2598 = -_2576;
    float _2600 = fma(_2510, _2458, _2598);
    float _2602 = -_2582;
    float _2604 = fma(_2514, _2456, _2602);
    float _2606 = _2592 * _2516;
    out.m_95.x = _2588;
    out.m_95.y = _2578;
    out.m_95.z = _2596;
    out.m_95.w = _2586;
    float _2608 = _2600 * _2516;
    float _2610 = _2604 * _2516;
    float _2612 = _1361 * _2512;
    float _2614 = _1519 * _2512;
    float _2616 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2618 = precise::clamp(_2616, 0.0, 1.0);
    float _2620 = _1361 * _2566;
    float _2622 = _1397 * _2566;
    float _2624 = _1397 * _2512;
    float _2626 = _1361 * _2608;
    float _2628 = _1519 * _2608;
    float _2630 = _1397 * _2608;
    float _2632 = fma(_1335, _2552, _2620);
    float _2634 = fma(_1551, _2552, _2594);
    float _2636 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2638 = fma(_1335, _2510, _2612);
    float _2640 = fma(_1551, _2510, _2614);
    float _2642 = fma(_1409, _2552, _2622);
    float _2644 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2636);
    float _2646 = fma(_1409, _2510, _2624);
    float _2648 = fma(_1363, _2514, _2638);
    float _2650 = fma(_1581, _2514, _2640);
    float _2652 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2644);
    float _2654 = fma(_1335, _2610, _2626);
    float _2656 = fma(_1551, _2610, _2628);
    float _2658 = fma(_1409, _2610, _2630);
    float _2660 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2652);
    float _2662 = fma(_1413, _2514, _2646);
    float _2664 = fma(_1363, _2606, _2654);
    float _2666 = fma(_1581, _2606, _2656);
    float _2668 = fma(_1413, _2606, _2658);
    float _2670 = _2660 + _1929;
    out.m_97.x = _2648;
    out.m_97.y = _2650;
    out.m_97.z = _2662;
    float _2672 = _2610;
    if (!_1927)
    {
        _2672 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2674 = _2672;
    float _2676 = fma(_1363, _2574, _2632);
    out.m_99.x = _2664;
    out.m_99.y = _2666;
    out.m_99.z = _2668;
    float _2678 = fma(_1581, _2574, _2634);
    int _2680 = as_type<int>(_2674);
    if (!_1927)
    {
        float _2682 = _2674 * 5.0;
        _2680 = as_type<int>(_2682);
    }
    int _2684 = _2680;
    float _2686 = fma(_1413, _2574, _2642);
    out.gl_Position.x = _1971;
    out.gl_Position.y = _1973;
    out.gl_Position.z = _2660;
    out.gl_Position.w = _1929;
    float _2688 = _2670 * 0.5;
    if (!_1927)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7198 = as_type<float>(_2684);
        out.gl_Position.z = _7198;
    }
    float _2690 = fma(_2618, -2.0, 3.0);
    float _2692 = in.m_101.w;
    float _2694 = _2618 * _2618;
    float _2696 = _1907 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2698 = _2696;
    if (!_1927)
    {
        _2698 = 0.0;
    }
    float _2700 = _2698;
    out.m_103.z = _2688;
    out.m_103.w = _1929;
    float _2702 = -_2528;
    float _2704 = _2702 + 1.0;
    float _2706 = _2694 * _2690;
    out.m_105.x = _2676;
    out.m_105.y = _2678;
    out.m_105.z = _2686;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2710 = -_2706;
    float _2712 = _2710 + 1.0;
    float _2714 = _2708 * _2035;
    float _2716 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2706);
    float _2718 = -_2708;
    float _2720 = _2718 + 1.0;
    float _2722 = _2046 * _2714;
    float _2724 = _2540 * _2716;
    float _2726 = _2712;
    float _2728 = _2720;
    float _2730 = _2714;
    if (!_1821)
    {
        _2542 = 1.0;
    }
    float _2732 = _2542;
    float _2734 = _2732;
    if (_1821)
    {
        bool _2736 = _2033 >= _1981;
        bool _2738 = isnan(_2033);
        bool _2740 = _2736 || _2738;
        bool _2742 = isnan(_1981);
        bool _2744 = _2740 || _2742;
        float _2746 = float(_2744);
        _2734 = _2746;
    }
    float _2748 = _2734;
    float _2750 = _2046 * _2720;
    float _2752 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.w = _2692;
    bool _2754 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2756 = isnan(_2140);
    bool _2758 = _2754 || _2756;
    bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2762 = _2758 || _2760;
    float _2764 = _2748 * _2118;
    float _2766 = _2400 * _2752;
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = -_2768;
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2774 = -_2764;
    float _2776 = fma(_2774, _2772, 1.0);
    float _2778 = precise::clamp(_2776, 0.0, 1.0);
    float _2780 = _2772;
    if (!_2762)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2782 = _2780;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2786 = _2784;
    float _2788 = _2782;
    float _2790 = _2782;
    if (!_2762)
    {
        _1945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2792 = _1945;
    float _2794 = _2792;
    float _2796 = _2792;
    if (!_2762)
    {
        _2726 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2798 = _2726;
    out.m_109.x = _2784;
    float _2800 = _2798;
    float _2802 = _2798;
    if (!_2762)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2804 = _2728;
    float _2806 = _2804;
    float _2808 = _2804;
    if (!_2762)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2810 = _2786;
    float _2812 = _2364 * _2714;
    float _2814 = fma(_2360, _2722, _2040);
    float _2816 = fma(_2362, _2722, _2042);
    float _2818 = _2810;
    float _2820 = _2810;
    if (!_2762)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2822 = _2730;
    float _2824 = fma(_2046, _2812, _2044);
    out.m_111.x = _2814;
    out.m_111.y = _2816;
    out.m_111.z = _2824;
    out.m_111.w = _2750;
    bool _2826 = !_2762;
    float _2828 = _2822;
    float _2830 = _2822;
    if (!_2826)
    {
        bool _2832 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_2140);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _2140 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2846;
            float _2850 = 1.0 / _2848;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2872 = _2844 * _2850;
            float _2874 = precise::clamp(_2872, 0.0, 1.0);
            float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2880 = fma(_2874, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2796 = _2882;
            _2808 = _2888;
            _2790 = _2880;
            _2802 = _2886;
            _2830 = _2884;
            _2820 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_2140);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2788 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2788;
            _2790 = _2904;
            if (!_2902)
            {
                _2794 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2794;
            _2796 = _2906;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2828;
            _2830 = _2908;
            if (!_2902)
            {
                _2800 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2800;
            _2802 = _2910;
            if (!_2902)
            {
                _2806 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2806;
            _2808 = _2912;
            if (!_2902)
            {
                _2818 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2818;
            bool _2916 = !_2902;
            _2820 = _2914;
            if (!_2916)
            {
                bool _2918 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_2140);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _2140 + _2928;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2932;
                    float _2936 = 1.0 / _2934;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2958 = _2930 * _2936;
                    float _2960 = precise::clamp(_2958, 0.0, 1.0);
                    float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2966 = fma(_2960, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2968 = fma(_2960, _2964, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2970 = fma(_2960, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2972 = fma(_2960, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2974 = fma(_2960, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2976 = fma(_2960, _2956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2796 = _2968;
                    _2808 = _2974;
                    _2790 = _2966;
                    _2802 = _2972;
                    _2830 = _2970;
                    _2820 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2796 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2808 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2790 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2802 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2820 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2796;
    float _2980 = _2808;
    float _2982 = _2790;
    float _2984 = _2802;
    float _2986 = _2830;
    float _2988 = _2820;
    float _2990 = fma(_2678, -0.5, 0.5);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2978;
    float _2996 = _2994 + _2980;
    float _2998 = -_2982;
    float _3000 = _2998 + _2984;
    float _3002 = -_2986;
    float _3004 = _3002 + _2988;
    bool _3006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3008 = fma(_2992, _2996, _2978);
    float _3010 = fma(_2992, _3000, _2982);
    float _3012 = fma(_2992, _3004, _2986);
    float _3014 = _2700 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3016 = _3008 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3018 = fma(_3010, 0.298911988735198974609375, _3016);
    out.m_109.w = _3014;
    float _3020 = fma(_3012, 0.114477999508380889892578125, _3018);
    float _3022 = -_3020;
    float _3024 = _3010 + _3022;
    float _3026 = -_3020;
    float _3028 = _3008 + _3026;
    float _3030 = -_3020;
    float _3032 = _3012 + _3030;
    out.m_113.x = 0.0;
    float _3034 = fma(_3024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    float _3036 = fma(_3028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    float _3038 = fma(_3032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    out.m_115.x = _3034;
    out.m_115.y = _3036;
    out.m_115.z = _3038;
    if (!_3006)
    {
        return out;
    }
    float _3040 = -_1749;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1751;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1755;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3052 = _3042 * _3042;
    float _3054 = fma(_3046, _3046, _3052);
    float _3056 = fma(_3050, _3050, _3054);
    float _3058 = sqrt(_3056);
    float _3060 = rsqrt(_3056);
    float _3062 = -_3058;
    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3068 = precise::clamp(_3066, 0.0, 1.0);
    float _3070 = _3046 * _3060;
    float _3072 = _3042 * _3060;
    float _3074 = abs(_3068);
    float _3076 = log2(_3074);
    float _3078 = _3050 * _3060;
    float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3082 = _2678 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2676, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2686, _3078, _3090);
    float _3098 = precise::clamp(_3096, 0.0, 1.0);
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3102 = _3094 + _3100;
    float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = exp2(_3104);
    float _3112 = _3110 * _3108;
    float _3114 = _3098 * _3112;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_113.x = _3116;
    out.m_113.y = _3118;
    out.m_113.z = _3120;
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
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2892 = false;
    bool _352 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_56.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_59.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3177 = as_type<float>(_150);
        out.gl_Position.z = _3177;
    }
    if (!_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_61.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_59.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3247 = as_type<float>(_188);
        out.gl_Position.z = _3247;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _190 = in.m_63.y;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_63.z;
    float _196 = in.m_65.y;
    float _198 = in.m_65.z;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = _190 * _190;
    float _206 = in.m_63.x;
    float _208 = _194 * _194;
    float _210 = in.m_65.x;
    float _212 = fma(_196, _196, _204);
    float _214 = in.m_67.x;
    float _216 = fma(_198, _198, _208);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _216);
    float _222 = sqrt(_218);
    float _224 = in.m_69.x;
    float _226 = in.m_69.y;
    float _228 = in.m_69.z;
    float _230 = sqrt(_220);
    bool _232 = _222 > 0.0;
    bool _234 = _230 > 0.0;
    float _236 = _190 * _226;
    float _238 = _196 * _226;
    float _240 = _200 * _226;
    float _242 = 0.0;
    float _244 = _222;
    float _246 = _220;
    if (_232)
    {
        float _248 = rsqrt(_218);
        _242 = _248;
    }
    float _250 = _242;
    float _252 = fma(_224, _206, _236);
    float _254 = fma(_224, _210, _238);
    float _256 = fma(_224, _214, _240);
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = _252;
    if (!_232)
    {
        _258 = 0.0;
        _260 = 0.0;
    }
    float _264 = _258;
    float _266 = _260;
    float _268 = fma(_194, _228, _252);
    float _270 = _266;
    float _272 = _264;
    if (!_232)
    {
        _262 = 0.0;
    }
    float _274 = _262;
    float _276 = fma(_198, _228, _254);
    float _278 = 0.0;
    float _280 = _274;
    if (_234)
    {
        float _282 = rsqrt(_220);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = 0.0;
    if (!_234)
    {
        _286 = 0.0;
    }
    float _288 = _286;
    float _290 = fma(_202, _228, _256);
    float _292 = _288;
    if (!_234)
    {
        _244 = 0.0;
    }
    float _294 = _244;
    float _296 = _294;
    if (_232)
    {
        float _298 = _250 * _196;
        _270 = _298;
    }
    float _300 = _270;
    float _302 = _300;
    if (!_234)
    {
        _246 = 0.0;
    }
    float _304 = _246;
    float _306 = _304;
    if (_232)
    {
        float _308 = _250 * _190;
        _272 = _308;
    }
    float _310 = _272;
    float _312 = _310;
    if (_232)
    {
        float _314 = _250 * _200;
        _280 = _314;
    }
    float _316 = _280;
    float _318 = _316;
    if (_234)
    {
        float _320 = _284 * _198;
        _292 = _320;
    }
    float _322 = _292;
    if (_234)
    {
        float _324 = _284 * _194;
        _296 = _324;
    }
    float _326 = _296;
    if (_234)
    {
        float _328 = _284 * _202;
        _306 = _328;
    }
    float _330 = _306;
    bool _332 = !_192;
    float _350;
    if (!_332)
    {
        float _334 = in.m_71.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_134);
        float _356 = 1.0 / _354;
        float _358 = _168 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_56.x;
    float _364 = in.m_56.y;
    float _366 = in.m_56.z;
    float _368 = in.m_65.w;
    float _370 = in.m_67.w;
    float _372 = _196 * _364;
    float _374 = _200 * _364;
    float _376 = fma(_210, _362, _372);
    float _378 = fma(_214, _362, _374);
    float _380 = fma(_198, _366, _376);
    float _382 = fma(_202, _366, _378);
    float _384 = _380 + _368;
    float _386 = _382 + _370;
    float _388 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _390 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _392 = floor(_388);
    float _394 = floor(_390);
    float _396 = -_392;
    float _398 = _388 + _396;
    float _400 = -_394;
    float _402 = _390 + _400;
    float2 _3555 = float2(_398, _402);
    float _404 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3555, float2(0.0), isnan(_3555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3555, float2(0.0), isnan(_3555)), level(0.0)).x;
    float _406 = in.m_71.z;
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    float _412 = _190 * _364;
    float _414 = in.m_71.y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = in.m_71.x;
    float _422 = fma(_206, _362, _412);
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _430 = _428 != 0;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _434 = _432 != 0;
    float _436 = 1.0 / _418;
    float _438 = fma(_194, _366, _422);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _446 = _360 + _444;
    float _448 = _410 * _168;
    float _450 = 1.0 / _442;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _454 = 1.0 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _456;
    bool _460 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _468 = _464 || _466;
    float _470 = in.m_63.w;
    float _472 = _406 * 2.0;
    bool _474 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _482 = _478 || _480;
    float _484 = exp2(_448);
    float _486 = _414 + _406;
    float _488 = _446 * _436;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _492 = _360 + _490;
    bool _494 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _496 = isnan(_360);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _486 + (-1.0);
    float _508 = _420 * 2.0;
    float _510 = 1.0 / _454;
    float _512 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _514 = _414 * 2.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _518 = _360 + _516;
    float _520 = _492 * _450;
    float _522 = _420 + _406;
    float _524 = _420 + _414;
    float _526 = 1.0 / _458;
    float _528 = -_484;
    float _530 = _528 + 1.0;
    float _532 = _522 + (-1.0);
    float _534 = _524 + (-1.0);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _536;
    float _540 = _482 ? _530 : 0.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _546 = floor(_514);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_468)
    {
        float _550 = _540 * _510;
        _170 = _550;
    }
    float _552 = _170;
    float _554 = _268 * _268;
    float _556 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _558 = !_426;
    int _560 = _558 ? 0 : 1;
    float _562 = floor(_472);
    float _564 = _518 * _526;
    float _566 = fma(_276, _276, _554);
    bool _568 = !_430;
    int _570 = _568 ? 0 : 1;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _572;
    bool _576 = !_434;
    int _578 = _576 ? 0 : 1;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _580;
    float _584 = floor(_508);
    bool _586 = _546 > 0.0;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _592 = _546 >= 0.0;
    bool _594 = isnan(_546);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _606 = fma(_290, _290, _566);
    bool _608 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _610 = isnan(_360);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = fma(_590, _520, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _622 = _562 >= 0.0;
    bool _624 = isnan(_562);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = fma(_604, _520, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _634 = fma(_544, _520, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _636 = rsqrt(_606);
    bool _638 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _640 = isnan(_360);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -_618;
    float _652 = _650 + 1.0;
    float _654 = fma(_582, _488, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _656 = _584 >= 0.0;
    bool _658 = isnan(_584);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_574, _488, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _668 = fma(_538, _488, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _682 = _680 != 0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _684;
    bool _688 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _690 = isnan(_360);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _438 + _470;
    int _702 = _630 ? 0 : 1;
    float _704 = fma(_686, _564, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _706 = _664 ? 0 : 1;
    float _708 = -_698;
    float _710 = _708 + 1.0;
    float _712 = _276 * _636;
    float _714 = _268 * _636;
    float _716 = _290 * _636;
    float _718 = _618 * _710;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _720;
    float _724 = _504 * _652;
    float _726 = -_504;
    float _728 = _726 + 1.0;
    float _730 = fma(_722, _564, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _732 = _562 > 0.0;
    float _734 = _648 * _728;
    float _736 = -_648;
    float _738 = _736 + 1.0;
    bool _740 = _584 > 0.0;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _742;
    float _746 = _654 * _734;
    float _748 = _666 * _734;
    float _750 = _668 * _734;
    int _752 = _600 ? 0 : 1;
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _746);
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _748);
    float _758 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].z, _750);
    float _760 = fma(_744, _564, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _762 = fma(_620, _724, _754);
    float _764 = _714 * _310;
    float _766 = fma(_634, _724, _758);
    float _768 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _770 = fma(_632, _724, _756);
    float _772 = fma(_730, _718, _762);
    bool _774 = !_678;
    int _776 = _774 ? 0 : 1;
    float _778 = _768 * _670;
    int _780 = ~_702;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_760, _718, _770);
    int _788 = ~_706;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    float _794 = fma(_704, _718, _766);
    int _796 = ~_752;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    float _802 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].x, _772);
    int _804 = _784;
    int _806 = _792;
    int _808 = _800;
    float _810 = _712;
    if (!_732)
    {
        int _812 = ~_702;
        int _814 = _812 + 1;
        _804 = _814;
    }
    int _816 = _804;
    float _818 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].z, _794);
    if (!_740)
    {
        int _820 = ~_706;
        int _822 = _820 + 1;
        _806 = _822;
    }
    int _824 = _806;
    if (!_586)
    {
        int _826 = ~_752;
        int _828 = _826 + 1;
        _808 = _828;
    }
    int _830 = _808;
    float _832 = fma(_712, _300, _764);
    bool _834 = !_674;
    int _836 = _834 ? 0 : 1;
    float _838 = in.m_73.x;
    float _840 = in.m_73.y;
    float _842 = in.m_73.z;
    int _844 = abs(_776);
    float _846 = fma(_716, _316, _832);
    bool _848 = !_682;
    int _850 = _848 ? 0 : 1;
    float _852 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[203].x, _778);
    float _854 = float(_816);
    int _856 = abs(_836);
    float _858 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _860 = float(_824);
    float _862 = float(_844);
    float _864 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].x, _858);
    int _866 = abs(_850);
    float _868 = abs(_846);
    bool _870 = _868 > 0.99989998340606689453125;
    float _872 = _862 * _860;
    float _874 = float(_856);
    float _876 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[11].z, _864);
    float _878 = _872 * (-2.0);
    float _880 = float(_830);
    float _882 = _852 + 0.25;
    float _884 = float(_866);
    float _886 = _874 * _854;
    float _888 = floor(_852);
    float _890 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _892 = _876 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _894 = _884 * _880;
    if (_870)
    {
        float _896 = fma(_322, 0.001000000047497451305389404296875, _300);
        _302 = _896;
    }
    float _898 = _302;
    if (_870)
    {
        float _900 = fma(_326, 0.001000000047497451305389404296875, _310);
        _312 = _900;
    }
    float _902 = _312;
    float _904 = fma(_512, _878, _512);
    float _906 = _894 * (-2.0);
    float _908 = floor(_882);
    float _910 = fma(_878, _840, _840);
    float _912 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _914 = fma(_556, _906, _556);
    float _916 = fma(_906, _842, _842);
    float _918 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].x, _890);
    float _920 = _406 + (-0.5);
    float _922 = _700 + _912;
    float _924 = 1.0 / _892;
    float _926 = _414 + (-0.5);
    float _928 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[10].z, _918);
    float _930 = -_888;
    float _932 = _852 + _930;
    int _934 = abs(_570);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].y, _910);
    float _938 = _852 * 6.283185482025146484375;
    float _940 = _928 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _942 = -_908;
    float _944 = _882 + _942;
    float _946 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _916);
    float _948 = _922 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _950 = _938 * 0.15915493667125701904296875;
    float _952 = _940 + _892;
    bool _954 = _932 >= 0.5;
    bool _956 = isnan(_932);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.5);
    bool _962 = _958 || _960;
    float _964 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[126].x, _948);
    float _966 = _950 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[126].z, _964);
    bool _972 = _944 > 0.5;
    float _974 = _952 * _924;
    float _976 = _974 * 0.5;
    float _978 = fma(_904, _552, _936);
    float _980 = _970 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _982 = !_962;
    float _984 = _982 ? 0.5 : (-0.5);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[30].w, _986);
    int _990 = abs(_560);
    float _992 = _922 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _994 = float(_934);
    float _996 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _998 = _996 * 2.0;
    float _1000 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[127].x, _992);
    float _1002 = _944;
    float _1004 = _988;
    if (_870)
    {
        float _1006 = fma(_330, 0.001000000047497451305389404296875, _316);
        _318 = _1006;
    }
    float _1008 = _318;
    float _1010 = _994 * _998;
    int _1012 = abs(_578);
    if (_972)
    {
        float _1014 = -_944;
        float _1016 = _1014 + 1.0;
        _1002 = _1016;
    }
    float _1018 = _1002;
    float _1020 = float(_990);
    float _1022 = _968 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1024 = fma(_1018, 4.0, -1.0);
    float _1026 = fma(_386, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1000);
    float _1028 = fma(_1020, _1022, _1010);
    float _1030 = float(_1012);
    float _1032 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1036 = trunc(_980);
    int _1038 = int(_1036);
    float _1040 = _978 * 0.15915493667125701904296875;
    float _1042 = fma(_1030, _1032, _1028);
    float _1044 = -_1008;
    float _1046 = _714 * _1044;
    float _1048 = in.m_75.x;
    float _1050 = in.m_75.y;
    float _1052 = in.m_75.z;
    float _1054 = -_902;
    float _1056 = _712 * _1054;
    float _1058 = -_898;
    float _1060 = _716 * _1058;
    float _1062 = fma(_914, _552, _946);
    float _1064 = trunc(_1034);
    int _1066 = int(_1064);
    float _1068 = fma(_1042, 3.1415927410125732421875, _838);
    float _1070 = _886 * (-2.0);
    float _1072 = -_1008;
    float _1074 = -_1060;
    float _1076 = fma(_712, _1072, _1074);
    float _1078 = -_902;
    float _1080 = -_1046;
    float _1082 = fma(_716, _1078, _1080);
    float _1084 = -_898;
    float _1086 = -_1056;
    float _1088 = fma(_714, _1084, _1086);
    float _1090 = _1062 * 0.15915493667125701904296875;
    float _1092 = in.m_77.x;
    float _1094 = in.m_77.y;
    float _1096 = in.m_77.z;
    float _1098 = 1.0 / _988;
    float _1100 = _420 + (-0.5);
    float _1102 = fma(_1068, _1070, _1068);
    float _1104 = fma(_548, _1070, _548);
    float _1106 = _1076 * _1076;
    float _1108 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1102);
    float _1110 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[146].y, _786);
    float _1112 = _1040 * 6.283185482025146484375;
    float _1114 = sin(_1112);
    int _1116 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1118 = _1066 + _1116;
    int _1120 = _1118 + 1;
    float _1122 = fma(_1104, _552, _1108);
    float _1124 = fma(_1082, _1082, _1106);
    float _1126 = _802 * _1048;
    float _1128 = _1110 * _1050;
    float _1130 = _1122 * 0.15915493667125701904296875;
    float _1132 = fma(_1088, _1088, _1124);
    float _1134 = _1040 * 6.283185482025146484375;
    float _1136 = cos(_1134);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1140 = _1098 * _1138;
    float _1142 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1144 = _1128 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1146 = _1140 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1148 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1092);
    float _1150 = _1130 * 6.283185482025146484375;
    float _1152 = sin(_1150);
    int _1154 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1156 = _1038 + _1154;
    int _1158 = _1156 + 1;
    float _1160 = _818 * _1052;
    float _1162 = _1148 * _1142;
    bool _1164 = _1158 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1166 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1168 = _1158 | _1120;
    float _1170 = _1130 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    bool _1174 = !_1146;
    int _1176 = _1174 ? 0 : 1;
    bool _1178 = _1168 < 0;
    bool _1180 = _1178 || _1164;
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1096);
    int _1184 = 2;
    int _1186 = _1158;
    int _1188 = as_type<int>(_1098);
    int _1190 = as_type<int>(_1128);
    if (!_1146)
    {
        _1184 = 1;
    }
    int _1192 = _1184;
    bool _1194 = _1120 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1196 = _1194 || _1180;
    float _1198 = _1090 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    bool _1202 = _1140 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1204 = _1152 * _1114;
    float _1206 = _1182 * _1166;
    bool _1208 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1210 = isnan(0.5);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1216 = _1212 || _1214;
    float _1218 = rsqrt(_1132);
    float _1220 = _1172 * _1114;
    int _1222 = _1192;
    if (!_1196)
    {
        int _1224 = _1120 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1226 = _1224 + _1158;
        _1186 = _1226;
    }
    int _1228 = _1186;
    if (!_1202)
    {
        _1222 = _1176;
    }
    int _1230 = _1222;
    float _1232 = _1090 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1094);
    float _1238 = _1136 * _1200;
    int _1240 = _1230 << 6;
    float _1242 = _1114 * _1200;
    float _1244 = _1236 * _1144;
    float _1246 = _1172 * _1136;
    float _1248 = _1152 * _1136;
    float _1250 = _1088 * _1218;
    float _1252 = _1082 * _1218;
    float _1254 = _1076 * _1218;
    float _1256 = _1172 * _1200;
    float _1258 = _1152 * _1200;
    int _1260 = _1240 + 96;
    uint _1263 = uint(int(uint(_1260) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
    float _1279 = as_type<float>(_1230);
    if (!_1196)
    {
        int _1281 = _1228 << 2;
        _1188 = _1281;
    }
    int _1283 = _1188;
    float _1285 = _712 * _1256;
    float _1287 = fma(_1234, _1246, _1204);
    float _1289 = fma(_1234, _1204, _1246);
    float _1291 = -_1220;
    float _1293 = fma(_1234, _1248, _1291);
    float _1295 = _714 * _1250;
    float _1297 = _1287 * _712;
    float _1299 = -_1248;
    float _1301 = fma(_1234, _1220, _1299);
    int _1303 = _1240 + 48;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    float _1321 = -_1295;
    float _1323 = fma(_716, _1254, _1321);
    float _1325 = fma(_1238, _1252, _1297);
    float _1327 = _712 * _1301;
    float _1329 = -_1234;
    float _1331 = fma(_1329, _1252, _1285);
    float _1333 = _716 * _1301;
    float _1335 = fma(_1293, _1323, _1325);
    float _1337 = fma(_1242, _1252, _1327);
    float _1339 = _712 * _1254;
    int _1341 = _1240 + 104;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    float _1359 = _716 * _1256;
    float _1361 = fma(_1258, _1323, _1331);
    float _1363 = fma(_1289, _1323, _1337);
    float _1365 = _1287 * _716;
    float _1367 = -_1339;
    float _1369 = fma(_714, _1252, _1367);
    float _1371 = -_1234;
    float _1373 = fma(_1371, _1250, _1359);
    float _1375 = fma(_1242, _1250, _1333);
    int _1377 = _1240 + 64;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.vp_c15)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[int(_1389)][_1391];
    float _1395 = fma(_1238, _1250, _1365);
    float _1397 = fma(_1258, _1369, _1373);
    float _1399 = _1244 * _1361;
    int _1401 = _1283;
    float _1403 = _1293;
    if (!_1196)
    {
        uint _1405 = uint(int(uint(_1228) >> uint(2)));
        _1190 = int(_1405);
    }
    int _1407 = _1190;
    float _1409 = fma(_1293, _1369, _1395);
    float _1411 = _1244 * _1397;
    float _1413 = fma(_1289, _1369, _1375);
    if (!_1196)
    {
        int _1415 = 12 & _1283;
        _1401 = _1415;
    }
    int _1417 = _1401;
    int _1419 = _1240 + 56;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    uint _1423 = uint(int(uint(int(_1421)) >> uint(2)));
    int _1425 = int(_1421) & 3;
    float _1427 = (*spvDescriptorSet0.vp_c15)._m0[int(_1423)][_1425];
    int _1429 = int(_1421) + 1;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    int _1433 = _1429 & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    float _1437 = fma(_1162, _1409, _1411);
    float _1439 = fma(_1162, _1335, _1399);
    if (!_1196)
    {
        int _1441 = _1407 << 4;
        int _1443 = _1441 + _1417;
        _1004 = as_type<float>(_1443);
    }
    float _1445 = _1004;
    float _1447 = _716 * _1252;
    float _1449 = fma(_1206, _1413, _1437);
    float _1451 = fma(_1206, _1363, _1439);
    float _1453 = _714 * _1256;
    int _1455 = _1240 + 72;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.vp_c15)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    float _1473 = _386 + _1449;
    float _1475 = _384 + _1451;
    float _1477 = -_1447;
    float _1479 = fma(_712, _1250, _1477);
    float _1481 = _1287 * _714;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1485 = _1473 + _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1489 = _1475 + _1487;
    float _1491 = -_1234;
    float _1493 = fma(_1491, _1254, _1453);
    int _1495 = _1240 + 80;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[int(_1507)][_1509];
    float _1513 = _1485 * _1485;
    float _1515 = _714 * _1301;
    float _1517 = fma(_1238, _1254, _1481);
    float _1519 = fma(_1258, _1479, _1493);
    float _1521 = fma(_1489, _1489, _1513);
    float _1523 = _922 * _1277;
    float _1525 = _922 * _1319;
    int _1527 = _1240 + 88;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    uint _1531 = uint(int(uint(int(_1529)) >> uint(2)));
    int _1533 = int(_1529) & 3;
    float _1535 = (*spvDescriptorSet0.vp_c15)._m0[int(_1531)][_1533];
    int _1537 = int(_1529) + 1;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    int _1541 = _1537 & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    float _1545 = sqrt(_1521);
    float _1547 = fma(_384, _1269, _1523);
    float _1549 = fma(_1242, _1254, _1515);
    float _1551 = fma(_1293, _1479, _1517);
    float _1553 = _1244 * _1519;
    float _1555 = fma(_384, _1311, _1525);
    float _1557 = fma(_386, _1349, _1547);
    float _1559 = _1445;
    float _1561 = _1475;
    float _1563 = _1473;
    float _1565 = _1493;
    int _1567 = as_type<int>(_1515);
    if (!_1196)
    {
        int _1569 = as_type<int>(_1445) + 400;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        uint _1573 = uint(int(uint(int(_1571)) >> uint(2)));
        int _1575 = int(_1571) & 3;
        float _1577 = (*spvDescriptorSet0.vp_c15)._m0[int(_1573)][_1575];
        _1559 = _1577;
    }
    float _1579 = _1559;
    float _1581 = fma(_1289, _1479, _1549);
    float _1583 = fma(_1162, _1551, _1553);
    float _1585 = _1557 + _1357;
    float _1587 = _1525;
    if (!_1196)
    {
        float _1589 = floor(_980);
        _1587 = _1589;
    }
    float _1591 = _1587;
    float _1593 = fma(_1206, _1581, _1583);
    float _1595 = _922 * _1393;
    bool _1597 = _1545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = _700 + _1593;
    float _1601 = fma(_384, _1385, _1595);
    float _1603 = 1.0 / _1585;
    float _1605 = fma(_386, _1427, _1555);
    float _1607 = _1605 + _1435;
    float _1609 = fma(_386, _1463, _1601);
    float _1611 = _1601;
    float _1613 = _1385;
    float _1615 = _1545;
    float _1617 = _1593;
    float _1619 = _1511;
    float _1621 = _1503;
    if (!_1597)
    {
        _1611 = _1599;
    }
    float _1623 = _1611;
    float _1625 = _1609 + _1471;
    bool _1627 = !_1597;
    float _1629 = _1623;
    float _1631 = _1579;
    if (!_1627)
    {
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1637 = _1545 + _1635;
        float _1639 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1641 = rsqrt(_1521);
        float _1643 = _1637 * _1633;
        float _1645 = _1643 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = cos(_1647);
        float _1651 = _1645 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = _1649 + (-1.0);
        float _1657 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1659 = fma(_1653, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1661 = fma(_1599, _1649, _1657);
        float _1663 = _1641 * _1659;
        float _1665 = fma(_1489, _1663, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1667 = fma(_1485, _1663, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1561 = _1665;
        _1563 = _1667;
        _1629 = _1661;
        _1613 = _1663;
        _1615 = _1637;
        _1617 = _1657;
    }
    float _1669 = _1561;
    float _1671 = _1563;
    float _1673 = _1629;
    float _1675 = _1613;
    float _1677 = _1615;
    float _1679 = _1617;
    float _1681 = _1607 * _1603;
    float _1683 = _1675;
    float _1685 = _1679;
    float _1687 = _1673;
    float _1689 = _1677;
    if (_1216)
    {
        _1683 = _1669;
    }
    float _1691 = _1683;
    float _1693 = _1691;
    if (_1216)
    {
        _1685 = _1671;
    }
    float _1695 = _1685;
    float _1697 = _1695;
    if (!_1216)
    {
        float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1701 = _700 + _1699;
        float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1705 = _384 + _1703;
        float _1707 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1709 = -_386;
        float _1711 = _1709 + _1671;
        float _1713 = _1701 * _1701;
        float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1717 = _386 + _1715;
        float _1719 = fma(_1705, _1705, _1713);
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1723 = fma(_1717, _1717, _1719);
        float _1725 = sqrt(_1723);
        float _1727 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1729 = precise::min(_1725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1731 = _1729 * _1721;
        float _1733 = -_700;
        float _1735 = _1733 + _1673;
        float _1737 = _1727 * _1731;
        float _1739 = -_384;
        float _1741 = _1739 + _1669;
        float _1743 = fma(_1735, _1737, _700);
        float _1745 = fma(_1741, _1737, _384);
        float _1747 = fma(_1711, _1737, _386);
        _1687 = _1743;
        _1693 = _1745;
        _1689 = _1737;
        _1697 = _1747;
    }
    float _1749 = _1687;
    float _1751 = _1693;
    float _1753 = _1689;
    float _1755 = _1697;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1759 = _1625 * _1603;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1765 = isnan(0.5);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1771 = _1767 || _1769;
    float _1773 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1757);
    float _1775 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1777 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1761);
    bool _1779 = _1681 >= 0.0;
    float _1781 = _1753;
    if (!_1196)
    {
        float _1783 = floor(_1034);
        _1781 = _1783;
    }
    float _1785 = _1781;
    float _1787 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1775);
    float _1789 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1773);
    float _1791 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1777);
    bool _1793 = _1681 <= 1.0;
    bool _1795 = _1793 && _1779;
    float _1797 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1787);
    float _1799 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1805 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1807 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1809 = _1759 >= 0.0;
    bool _1811 = _1809 && _1795;
    float _1813 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1815 = _1801 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1817 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1819 = _1759 <= 1.0;
    bool _1821 = _1819 && _1811;
    float _1823 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1813);
    float _1825 = -_1815;
    float _1827 = fma(_1825, _1807, 1.0);
    float _1829 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1817);
    if (_1771)
    {
        _810 = 1.0;
    }
    float _1831 = _810;
    float _1833 = _1831;
    if (!_1771)
    {
        float _1835 = as_type<float>(in.m_81.w);
        int _1837 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1839 = _1837 == 4;
        bool _1841 = _1837 == 8;
        bool _1843 = _1837 == 12;
        int _1845 = as_type<int>(_1835) << 16;
        int _1847 = as_type<int>(_1835) << 8;
        int _1849 = as_type<int>(_1835) << 24;
        int _1851 = _1845 >> 24;
        int _1853 = _1847 >> 24;
        int _1855 = as_type<int>(_1835) >> 24;
        int _1857 = _1849 >> 24;
        float _1859 = float(_1851);
        float _1861 = float(_1853);
        float _1863 = float(_1855);
        float _1865 = _1859 * 0.0078740157186985015869140625;
        float _1867 = float(_1857);
        float _1869 = _1861 * 0.0078740157186985015869140625;
        float _1871 = _1863 * 0.0078740157186985015869140625;
        float _1873 = precise::min(_1865, 1.0);
        float _1875 = _1867 * 0.0078740157186985015869140625;
        float _1877 = precise::min(_1869, 1.0);
        float _1879 = precise::min(_1871, 1.0);
        float _1881 = precise::min(_1875, 1.0);
        float _1883 = precise::max(_1873, -1.0);
        float _1885 = precise::max(_1877, -1.0);
        float _1887 = precise::max(_1879, -1.0);
        float _1889 = precise::max(_1881, -1.0);
        float _1891 = _1889;
        if (_1839)
        {
            _1891 = _1883;
        }
        float _1893 = _1891;
        float _1895 = _1893;
        if (_1841)
        {
            _1895 = _1885;
        }
        float _1897 = _1895;
        float _1899 = _1897;
        if (_1843)
        {
            _1899 = _1887;
        }
        float _1901 = _1899;
        float _1903 = abs(_1901);
        float _1905 = (-0.0) + _1903;
        _1833 = _1905;
    }
    float _1907 = _1833;
    float _1909 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1911 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1913 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1829);
    float _1915 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1917 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1909);
    bool _1919 = _1907 != 0.0;
    bool _1921 = isnan(_1907);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan(0.0);
    bool _1927 = _1923 || _1925;
    float _1929 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1913);
    float _1931 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1915);
    float _1933 = _922 * _1511;
    float _1935 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1917);
    float _1937 = 1.0 / _1929;
    float _1939 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1941 = fma(_384, _1503, _1933);
    float _1943 = _1939;
    float _1945 = _1929;
    if (_1821)
    {
        float _1947 = float(_1230);
        _1279 = _1947;
    }
    float _1949 = _1279;
    float _1951 = fma(_386, _1535, _1941);
    float _1953 = log2(_1827);
    float _1955 = _1951 + _1543;
    float _1957 = _1933;
    float _1959 = _1955;
    if (_1821)
    {
        float _1961 = rint(_1949);
        float _1963 = precise::max(_1961, 0.0);
        uint _1965 = uint(_1963);
        uint _1967 = clamp(_1965, 0u, 65535u);
        _1957 = as_type<float>(_1967);
    }
    float _1969 = _1957;
    float _1971 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1935);
    float _1973 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1939);
    if (!_1196)
    {
        float _1975 = -_1785;
        float _1977 = _1034 + _1975;
        _1943 = _1977;
    }
    float _1979 = _1943;
    float _1981 = _1955 * _1603;
    if (!_1196)
    {
        float _1983 = -_1591;
        float _1985 = _980 + _1983;
        _1959 = _1985;
    }
    float _1987 = _1959;
    if (_1927)
    {
        _1619 = _1971;
    }
    float _1989 = _1619;
    float _1991 = _1989;
    if (_1927)
    {
        _1621 = _1973;
    }
    float _1993 = _1621;
    float _1995 = _1993;
    if (!_1927)
    {
        _1991 = 0.0;
        _1995 = 0.0;
    }
    float _1997 = _1991;
    float _1999 = _1995;
    float _2001 = _1951;
    if (!_1196)
    {
        float _2003 = rint(_1579);
        float _2005 = precise::max(_2003, 0.0);
        uint _2007 = uint(_2005);
        uint _2009 = clamp(_2007, 0u, 65535u);
        _2001 = as_type<float>(_2009);
    }
    float _2011 = _2001;
    float _2013 = _1953 * 0.693147182464599609375;
    float _2015 = _1937 * _1997;
    float _2017 = _1937 * _1999;
    float _2019 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2021 = fma(_2015, 0.5, 0.5);
    float _2023 = fma(_2017, -0.5, 0.5);
    float _2025 = _1941;
    float _2027 = _2013;
    float _2029 = _2021;
    if (_1821)
    {
        float3 _6071 = float3(_1681, _1759, float(as_type<int>(_1969)));
        float3 _6075 = select(_6071, float3(0.0), isnan(_6071));
        float _2031 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6075.xy, uint(rint(_6075.z)), _1981, level(0.0));
        _2025 = _2031;
    }
    float _2033 = _2025;
    float3 _6085 = float3(_2021, _2023, _2019);
    float _2035 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6085, float3(0.0), isnan(_6085)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6085, float3(0.0), isnan(_6085)), level(0.0)).x;
    float3 _6094 = float3(_2021, _2023, _2019);
    float4 _2038 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6094, float3(0.0), isnan(_6094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6094, float3(0.0), isnan(_6094)), level(0.0)).xyzw;
    float _2040 = _2038.x;
    float _2042 = _2038.y;
    float _2044 = _2038.z;
    float _2046 = _2038.w;
    float _2048 = _1979;
    if (!_1196)
    {
        float3 _6117 = float3(_1987, _1979, float(as_type<int>(_2011)));
        float3 _6119 = select(_6117, float3(0.0), isnan(_6117));
        float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6119.xy, uint(rint(_6119.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6119.xy, uint(rint(_6119.z)), level(0.0)).x;
        _2048 = _2050;
    }
    float _2052 = _2048;
    if (_1196)
    {
        _2027 = 1.0;
    }
    float _2054 = _2027;
    float _2056 = _2054;
    if (!_1196)
    {
        int _2058 = _1228 << 4;
        int _2060 = _2058 + 2048;
        uint _2062 = uint(int(uint(_2060) >> uint(2)));
        uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
        int _2066 = int(_2062) & 3;
        float _2068 = (*spvDescriptorSet0.vp_c15)._m0[int(_2064)][_2066];
        int _2070 = int(_2062) + 1;
        uint _2072 = uint(int(uint(_2070) >> uint(2)));
        int _2074 = _2070 & 3;
        float _2076 = (*spvDescriptorSet0.vp_c15)._m0[int(_2072)][_2074];
        int _2078 = _2060 + 8;
        uint _2080 = uint(int(uint(_2078) >> uint(2)));
        uint _2082 = uint(int(uint(int(_2080)) >> uint(2)));
        int _2084 = int(_2080) & 3;
        float _2086 = (*spvDescriptorSet0.vp_c15)._m0[int(_2082)][_2084];
        int _2088 = int(_2080) + 1;
        uint _2090 = uint(int(uint(_2088) >> uint(2)));
        int _2092 = _2088 & 3;
        float _2094 = (*spvDescriptorSet0.vp_c15)._m0[int(_2090)][_2092];
        float _2096 = _922 * _2076;
        float _2098 = fma(_384, _2068, _2096);
        float _2100 = fma(_386, _2086, _2098);
        float _2102 = _2100 + _2094;
        float _2104 = precise::clamp(_2102, 0.0, 1.0);
        float _2106 = -_2104;
        float _2108 = _2106 + _2052;
        float _2110 = fma(_2108, 500.0, 1.5);
        float _2112 = exp2(_2110);
        float _2114 = 0.0 + _2112;
        float _2116 = precise::clamp(_2114, 0.0, 1.0);
        _2056 = _2116;
    }
    float _2118 = _2056;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2122 = _1749 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2126 = _1751 + _2124;
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2130 = _1755 + _2128;
    float _2132 = _2122 * _2122;
    float _2134 = fma(_2126, _2126, _2132);
    float _2136 = fma(_2130, _2130, _2134);
    float _2138 = rsqrt(_2136);
    float _2140 = sqrt(_2136);
    float _2142 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2144 = _2126 * _2142;
    float _2146 = _2130 * _2142;
    float _2148 = _2144 * _2144;
    float _2150 = _2146 * _2146;
    float _2152 = _2148 + _2150;
    float _2154 = sqrt(_2152);
    bool _2156 = _2154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2160 = _2154 + _2158;
    float _2162 = _2134;
    float _2164 = _2138;
    float _2166 = _2160;
    float _2168 = _2122;
    bool _2170 = _2156;
    if (_2156)
    {
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2162 = _2172;
    }
    float _2174 = _2162;
    if (_2156)
    {
        float _2176 = rsqrt(_2152);
        _2164 = _2176;
    }
    float _2178 = _2164;
    float _2180 = _2178;
    if (_2156)
    {
        float _2182 = _2160 * _2174;
        _2166 = _2182;
    }
    float _2184 = _2166;
    if (_2156)
    {
        float _2186 = _2184 * 0.15915493667125701904296875;
        _2029 = _2186;
    }
    float _2188 = _2029;
    float _2190 = _2130;
    float _2192 = _2188;
    if (_2156)
    {
        float _2194 = _2188 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        _2190 = _2196;
    }
    float _2198 = _2190;
    float _2200 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2202 = precise::max(0.0, _2200);
    float _2204 = _2174;
    float _2206 = _2202;
    if (_2156)
    {
        float _2208 = _2188 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        _2204 = _2210;
    }
    float _2212 = _2204;
    float _2214 = -_2142;
    float _2216 = -_2202;
    float _2218 = fma(_2122, _2214, _2216);
    if (_2156)
    {
        float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2220;
    }
    float _2222 = _2168;
    float _2224 = _2222;
    float _2226 = _2198;
    if (_2156)
    {
        float _2228 = fma(_2198, _2222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2224 = _2228;
    }
    float _2230 = _2224;
    float _2232 = _2230;
    if (!_2156)
    {
        _2226 = _2144;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    float _2238 = _2212;
    if (_2156)
    {
        float _2240 = _2212 + (-1.0);
        _2206 = _2240;
    }
    float _2242 = _2206;
    float _2244 = _2242;
    if (_2156)
    {
        float _2246 = _2178 * _2230;
        _1631 = _2246;
    }
    float _2248 = _1631;
    if (!_2156)
    {
        _2232 = _2218;
    }
    float _2250 = _2232;
    float _2252 = _2250;
    if (_2156)
    {
        float _2254 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2192 = _2254;
    }
    float _2256 = _2192;
    if (_2156)
    {
        float _2258 = _2144 * _2248;
        _2236 = _2258;
    }
    float _2260 = _2236;
    if (!_2156)
    {
        _2244 = _2146;
    }
    float _2262 = _2244;
    float _2264 = _2262;
    if (_2156)
    {
        float _2266 = _2146 * _2248;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (!_2156)
    {
        _2180 = _2148;
    }
    float _2270 = _2180;
    float _2272 = _2270;
    if (_2156)
    {
        float _2274 = fma(_2218, _2212, _2256);
        _2252 = _2274;
    }
    float _2276 = _2252;
    if (_2156)
    {
        float _2278 = _2260 * _2260;
        _2272 = _2278;
    }
    float _2280 = _2272;
    if (!_2156)
    {
        _2238 = _2150;
    }
    float _2282 = _2238;
    float _2284 = _2282;
    if (_2156)
    {
        float _2286 = _2268 * _2268;
        _2284 = _2286;
    }
    float _2288 = _2284;
    float _2290 = fma(_2276, _2276, _2280);
    float _2292 = _2290 + _2288;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2140, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = rsqrt(_2292);
    float _2302 = -_2298;
    float _2304 = _2302 + 1.0;
    float _2306 = abs(_2304);
    float _2308 = log2(_2306);
    float _2310 = _2300 * _2260;
    float _2312 = _2300 * _2276;
    float _2314 = _2300 * _2268;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2318 = -_2316;
    float _2320 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2318);
    float _2322 = -_2314;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2320);
    float _2326 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2328 = fma(_2324, -0.5, 0.5);
    float _2330 = fma(_2324, 0.5, 0.5);
    float _2332 = exp2(_2326);
    float _2334 = fma(_2330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = fma(_2330, _2334, -0.212114393711090087890625);
    float _2338 = _2312 + 1.0;
    float _2340 = sqrt(_2328);
    float _2342 = fma(_2330, _2336, 1.570728778839111328125);
    float _2344 = -_2312;
    float _2346 = fma(_2332, _2338, _2344);
    float _2348 = _2340 * 0.636619746685028076171875;
    float _2350 = fma(_2346, 0.5, 0.5);
    float _2352 = -_2342;
    float _2354 = fma(_2348, _2352, 1.0);
    float2 _6591 = float2(_2354, _2350);
    float3 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).xyz;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = in.m_83.x;
    float _2368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2370 = in.m_83.y;
    int _2372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2374 = _2372 != 0;
    float _2376 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2380 = _2378 != 0;
    float _2382 = in.m_71.w;
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2386 = _2384 != 0;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2392 = _2390 != 0;
    float _2394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2396 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = -_404;
    float _2400 = _2398 + 1.0;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2404 = as_type<int>(_2346);
    bool _2406 = _2392;
    float _2408 = _2370;
    float _2410 = _2366;
    if (_2374)
    {
        bool _2412 = _420 > 0.5;
        _2170 = _2412;
    }
    bool _2414 = _2170;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_2374)
    {
        float _2420 = -_2366;
        float _2422 = _2420 + 1.0;
        _2404 = as_type<int>(_2422);
    }
    int _2424 = _2404;
    if (!_2374)
    {
        _1565 = _2366;
    }
    float _2426 = _1565;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2430 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2432 = -_2370;
    float _2434 = _2432 + 1.0;
    float _2436 = _2426;
    float _2438 = _2430;
    if (_2374)
    {
        float _2440 = _2414 ? as_type<float>(_2424) : _2366;
        _2436 = _2440;
    }
    float _2442 = _2436;
    float _2444 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2446 = _414 > 0.5;
    float _2448 = _2416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2450 = _2382 > 0.5;
    float _2452 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2454 = in.m_85.x;
    float _2456 = in.m_85.y;
    float _2458 = in.m_85.z;
    int _2460 = _2450 ? as_type<int>(_2434) : as_type<int>(_2370);
    float _2462 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2464 = _1094 != 0.0;
    bool _2466 = isnan(_1094);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan(0.0);
    bool _2472 = _2468 || _2470;
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2476 = _2392 ? as_type<float>(_2460) : _2370;
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2380)
    {
        bool _2480 = _406 > 0.5;
        _2406 = _2480;
    }
    bool _2482 = _2406;
    float _2484 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2486 = _2484;
    if (_2386)
    {
        float _2488 = _2446 ? _2434 : _2370;
        _2408 = _2488;
    }
    float _2490 = _2408;
    out.m_87.x = _2448;
    out.m_87.y = _2452;
    out.m_87.z = _2462;
    bool _2492 = _1092 == 0.0;
    bool _2494 = !_2472;
    bool _2496 = _2492 && _2494;
    if (_2380)
    {
        float _2498 = -_2366;
        float _2500 = _2498 + 1.0;
        _1567 = as_type<int>(_2500);
    }
    int _2502 = _1567;
    float _2504 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2506 = abs(_1140);
    float _2508 = log2(_2506);
    float _2510 = in.m_89.x;
    float _2512 = in.m_89.y;
    float _2514 = in.m_89.z;
    float _2516 = in.m_89.w;
    bool _2518 = _1096 == 0.0;
    bool _2520 = _2518 && _2496;
    float _2522 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2380)
    {
        float _2524 = _2482 ? as_type<float>(_2502) : _2366;
        _2410 = _2524;
    }
    float _2526 = _2410;
    out.m_91.x = _2396;
    out.m_91.y = _2430;
    out.m_91.z = _2484;
    out.m_91.w = _2444;
    float _2528 = exp2(_2376);
    bool _2530 = _1140 <= 8000.0;
    bool _2532 = isnan(_1140);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan(8000.0);
    bool _2538 = _2534 || _2536;
    float _2540 = float(_2538);
    out.m_93.x = _1751;
    out.m_93.y = _1749;
    out.m_93.z = _1755;
    float _2542 = _2540;
    if (_2520)
    {
        _1403 = _2454;
    }
    float _2544 = _1403;
    float _2546 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2548 = _2544;
    if (!_2520)
    {
        float _2550 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2454);
        _2548 = _2550;
    }
    float _2552 = _2548;
    float _2554 = _2490 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2558 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2520)
    {
        _2438 = _2456;
    }
    float _2560 = _2438;
    float _2562 = _2560;
    if (!_2520)
    {
        float _2564 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2456);
        _2562 = _2564;
    }
    float _2566 = _2562;
    if (_2520)
    {
        _2486 = _2458;
    }
    float _2568 = _2486;
    float _2570 = _2568;
    if (!_2520)
    {
        float _2572 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2570 = _2572;
    }
    float _2574 = _2570;
    float _2576 = _2514 * _2454;
    float _2578 = _2554 * _2368;
    float _2580 = exp2(_2546);
    float _2582 = _2512 * _2458;
    float _2584 = _2510 * _2456;
    float _2586 = _2504 * _2478;
    float _2588 = _2522 * _2394;
    float _2590 = -_2584;
    float _2592 = fma(_2512, _2454, _2590);
    float _2594 = _1519 * _2566;
    float _2596 = _2558 * _2556;
    float _2598 = -_2576;
    float _2600 = fma(_2510, _2458, _2598);
    float _2602 = -_2582;
    float _2604 = fma(_2514, _2456, _2602);
    float _2606 = _2592 * _2516;
    out.m_95.x = _2588;
    out.m_95.y = _2578;
    out.m_95.z = _2596;
    out.m_95.w = _2586;
    float _2608 = _2600 * _2516;
    float _2610 = _2604 * _2516;
    float _2612 = _1361 * _2512;
    float _2614 = _1519 * _2512;
    float _2616 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2618 = precise::clamp(_2616, 0.0, 1.0);
    float _2620 = _1361 * _2566;
    float _2622 = _1397 * _2566;
    float _2624 = _1397 * _2512;
    float _2626 = _1361 * _2608;
    float _2628 = _1519 * _2608;
    float _2630 = _1397 * _2608;
    float _2632 = fma(_1335, _2552, _2620);
    float _2634 = fma(_1551, _2552, _2594);
    float _2636 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2638 = fma(_1335, _2510, _2612);
    float _2640 = fma(_1551, _2510, _2614);
    float _2642 = fma(_1409, _2552, _2622);
    float _2644 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2636);
    float _2646 = fma(_1409, _2510, _2624);
    float _2648 = fma(_1363, _2514, _2638);
    float _2650 = fma(_1581, _2514, _2640);
    float _2652 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2644);
    float _2654 = fma(_1335, _2610, _2626);
    float _2656 = fma(_1551, _2610, _2628);
    float _2658 = fma(_1409, _2610, _2630);
    float _2660 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2652);
    float _2662 = fma(_1413, _2514, _2646);
    float _2664 = fma(_1363, _2606, _2654);
    float _2666 = fma(_1581, _2606, _2656);
    float _2668 = fma(_1413, _2606, _2658);
    float _2670 = _2660 + _1929;
    out.m_97.x = _2648;
    out.m_97.y = _2650;
    out.m_97.z = _2662;
    float _2672 = _2610;
    if (!_1927)
    {
        _2672 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2674 = _2672;
    float _2676 = fma(_1363, _2574, _2632);
    out.m_99.x = _2664;
    out.m_99.y = _2666;
    out.m_99.z = _2668;
    float _2678 = fma(_1581, _2574, _2634);
    int _2680 = as_type<int>(_2674);
    if (!_1927)
    {
        float _2682 = _2674 * 5.0;
        _2680 = as_type<int>(_2682);
    }
    int _2684 = _2680;
    float _2686 = fma(_1413, _2574, _2642);
    out.gl_Position.x = _1971;
    out.gl_Position.y = _1973;
    out.gl_Position.z = _2660;
    out.gl_Position.w = _1929;
    float _2688 = _2670 * 0.5;
    if (!_1927)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7198 = as_type<float>(_2684);
        out.gl_Position.z = _7198;
    }
    float _2690 = fma(_2618, -2.0, 3.0);
    float _2692 = in.m_101.w;
    float _2694 = _2618 * _2618;
    float _2696 = _1907 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2698 = _2696;
    if (!_1927)
    {
        _2698 = 0.0;
    }
    float _2700 = _2698;
    out.m_103.z = _2688;
    out.m_103.w = _1929;
    float _2702 = -_2528;
    float _2704 = _2702 + 1.0;
    float _2706 = _2694 * _2690;
    out.m_105.x = _2676;
    out.m_105.y = _2678;
    out.m_105.z = _2686;
    float _2708 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2710 = -_2706;
    float _2712 = _2710 + 1.0;
    float _2714 = _2708 * _2035;
    float _2716 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2706);
    float _2718 = -_2708;
    float _2720 = _2718 + 1.0;
    float _2722 = _2046 * _2714;
    float _2724 = _2540 * _2716;
    float _2726 = _2712;
    float _2728 = _2720;
    float _2730 = _2714;
    if (!_1821)
    {
        _2542 = 1.0;
    }
    float _2732 = _2542;
    float _2734 = _2732;
    if (_1821)
    {
        bool _2736 = _2033 >= _1981;
        bool _2738 = isnan(_2033);
        bool _2740 = _2736 || _2738;
        bool _2742 = isnan(_1981);
        bool _2744 = _2740 || _2742;
        float _2746 = float(_2744);
        _2734 = _2746;
    }
    float _2748 = _2734;
    float _2750 = _2046 * _2720;
    float _2752 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.w = _2692;
    bool _2754 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2756 = isnan(_2140);
    bool _2758 = _2754 || _2756;
    bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2762 = _2758 || _2760;
    float _2764 = _2748 * _2118;
    float _2766 = _2400 * _2752;
    float _2768 = precise::clamp(_2766, 0.0, 1.0);
    float _2770 = -_2768;
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2774 = -_2764;
    float _2776 = fma(_2774, _2772, 1.0);
    float _2778 = precise::clamp(_2776, 0.0, 1.0);
    float _2780 = _2772;
    if (!_2762)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2782 = _2780;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2786 = _2784;
    float _2788 = _2782;
    float _2790 = _2782;
    if (!_2762)
    {
        _1945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2792 = _1945;
    float _2794 = _2792;
    float _2796 = _2792;
    if (!_2762)
    {
        _2726 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2798 = _2726;
    out.m_109.x = _2784;
    float _2800 = _2798;
    float _2802 = _2798;
    if (!_2762)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2804 = _2728;
    float _2806 = _2804;
    float _2808 = _2804;
    if (!_2762)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2810 = _2786;
    float _2812 = _2364 * _2714;
    float _2814 = fma(_2360, _2722, _2040);
    float _2816 = fma(_2362, _2722, _2042);
    float _2818 = _2810;
    float _2820 = _2810;
    if (!_2762)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2822 = _2730;
    float _2824 = fma(_2046, _2812, _2044);
    out.m_111.x = _2814;
    out.m_111.y = _2816;
    out.m_111.z = _2824;
    out.m_111.w = _2750;
    bool _2826 = !_2762;
    float _2828 = _2822;
    float _2830 = _2822;
    if (!_2826)
    {
        bool _2832 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_2140);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _2140 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2846;
            float _2850 = 1.0 / _2848;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2872 = _2844 * _2850;
            float _2874 = precise::clamp(_2872, 0.0, 1.0);
            float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2880 = fma(_2874, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2796 = _2882;
            _2808 = _2888;
            _2790 = _2880;
            _2802 = _2886;
            _2830 = _2884;
            _2820 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_2140);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2788 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2788;
            _2790 = _2904;
            if (!_2902)
            {
                _2794 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2794;
            _2796 = _2906;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2828;
            _2830 = _2908;
            if (!_2902)
            {
                _2800 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2800;
            _2802 = _2910;
            if (!_2902)
            {
                _2806 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2806;
            _2808 = _2912;
            if (!_2902)
            {
                _2818 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2818;
            bool _2916 = !_2902;
            _2820 = _2914;
            if (!_2916)
            {
                bool _2918 = _2140 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_2140);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _2140 + _2928;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2932;
                    float _2936 = 1.0 / _2934;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2958 = _2930 * _2936;
                    float _2960 = precise::clamp(_2958, 0.0, 1.0);
                    float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2966 = fma(_2960, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2968 = fma(_2960, _2964, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2970 = fma(_2960, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2972 = fma(_2960, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2974 = fma(_2960, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2976 = fma(_2960, _2956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2796 = _2968;
                    _2808 = _2974;
                    _2790 = _2966;
                    _2802 = _2972;
                    _2830 = _2970;
                    _2820 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2796 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2808 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2790 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2802 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2820 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2796;
    float _2980 = _2808;
    float _2982 = _2790;
    float _2984 = _2802;
    float _2986 = _2830;
    float _2988 = _2820;
    float _2990 = fma(_2678, -0.5, 0.5);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2978;
    float _2996 = _2994 + _2980;
    float _2998 = -_2982;
    float _3000 = _2998 + _2984;
    float _3002 = -_2986;
    float _3004 = _3002 + _2988;
    bool _3006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3008 = fma(_2992, _2996, _2978);
    float _3010 = fma(_2992, _3000, _2982);
    float _3012 = fma(_2992, _3004, _2986);
    float _3014 = _2700 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3016 = _3008 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3018 = fma(_3010, 0.298911988735198974609375, _3016);
    out.m_109.w = _3014;
    float _3020 = fma(_3012, 0.114477999508380889892578125, _3018);
    float _3022 = -_3020;
    float _3024 = _3010 + _3022;
    float _3026 = -_3020;
    float _3028 = _3008 + _3026;
    float _3030 = -_3020;
    float _3032 = _3012 + _3030;
    out.m_113.x = 0.0;
    float _3034 = fma(_3024, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    float _3036 = fma(_3028, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    float _3038 = fma(_3032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3020);
    out.m_115.x = _3034;
    out.m_115.y = _3036;
    out.m_115.z = _3038;
    if (!_3006)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3040 = -_1749;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1751;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1755;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3052 = _3042 * _3042;
    float _3054 = fma(_3046, _3046, _3052);
    float _3056 = fma(_3050, _3050, _3054);
    float _3058 = sqrt(_3056);
    float _3060 = rsqrt(_3056);
    float _3062 = -_3058;
    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3068 = precise::clamp(_3066, 0.0, 1.0);
    float _3070 = _3046 * _3060;
    float _3072 = _3042 * _3060;
    float _3074 = abs(_3068);
    float _3076 = log2(_3074);
    float _3078 = _3050 * _3060;
    float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3082 = _2678 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2676, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2686, _3078, _3090);
    float _3098 = precise::clamp(_3096, 0.0, 1.0);
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3102 = _3094 + _3100;
    float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = exp2(_3104);
    float _3112 = _3110 * _3108;
    float _3114 = _3098 * _3112;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_113.x = _3116;
    out.m_113.y = _3118;
    out.m_113.z = _3120;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

