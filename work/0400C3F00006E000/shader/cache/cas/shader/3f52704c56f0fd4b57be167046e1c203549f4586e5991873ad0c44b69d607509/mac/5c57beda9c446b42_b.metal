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
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_89 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_113 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_97 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_105 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_111 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 m_107 [[user(locn13)]];
    float4 m_109 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_85 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_77 [[attribute(10)]];
    float4 m_91 [[attribute(11)]];
    float4 m_83 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2618 = false;
    bool _1488 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2903 = as_type<float>(_148);
        out.gl_Position.z = _2903;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_63.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2973 = as_type<float>(_186);
        out.gl_Position.z = _2973;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = in.m_71.x;
    float _202 = in.m_71.y;
    float _204 = in.m_71.z;
    float _206 = _188 * _188;
    float _208 = _190 * _190;
    float _210 = _192 * _192;
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _214);
    float _222 = fma(_204, _204, _216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    float _228 = sqrt(_222);
    bool _230 = _224 > 0.0;
    bool _232 = _226 > 0.0;
    float _234 = _226;
    float _236 = _218;
    float _238 = _222;
    if (_230)
    {
        float _240 = rsqrt(_218);
        _234 = _240;
    }
    float _242 = _234;
    float _244 = 0.0;
    float _246 = 0.0;
    if (!_230)
    {
        _244 = 0.0;
        _246 = 0.0;
    }
    float _248 = _244;
    float _250 = _246;
    bool _252 = _228 > 0.0;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _248;
    if (!_230)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = _260;
    if (!_232)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _268 = _262;
    float _270 = _264;
    float _272 = _228;
    float _274 = _270;
    float _276 = _268;
    if (_232)
    {
        float _278 = rsqrt(_220);
        _272 = _278;
    }
    float _280 = _272;
    float _282 = 0.0;
    if (!_232)
    {
        _282 = 0.0;
    }
    float _284 = _282;
    float _286 = 0.0;
    float _288 = _284;
    if (!_252)
    {
        _286 = 0.0;
    }
    float _290 = _286;
    float _292 = _224;
    float _294 = _290;
    if (_252)
    {
        float _296 = rsqrt(_222);
        _292 = _296;
    }
    float _298 = _292;
    if (_230)
    {
        float _300 = _242 * _188;
        _256 = _300;
    }
    float _302 = _256;
    if (_230)
    {
        float _304 = _242 * _194;
        _258 = _304;
    }
    float _306 = _258;
    if (_230)
    {
        float _308 = _242 * _200;
        _266 = _308;
    }
    float _310 = _266;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_252)
    {
        _236 = 0.0;
    }
    float _314 = _236;
    float _316 = _314;
    if (_232)
    {
        float _318 = _280 * _190;
        _274 = _318;
    }
    float _320 = _274;
    if (!_252)
    {
        _238 = 0.0;
    }
    float _322 = _238;
    float _324 = _322;
    if (_232)
    {
        float _326 = _280 * _196;
        _276 = _326;
    }
    float _328 = _276;
    if (_232)
    {
        float _330 = _280 * _202;
        _288 = _330;
    }
    float _332 = _288;
    if (_252)
    {
        float _334 = _298 * _192;
        _324 = _334;
    }
    float _336 = _324;
    if (_252)
    {
        float _338 = _298 * _198;
        _294 = _338;
    }
    float _340 = _294;
    if (_252)
    {
        float _342 = _298 * _204;
        _316 = _342;
    }
    float _344 = _316;
    bool _346 = !_312;
    float _348 = _344;
    float _366;
    if (!_346)
    {
        float _350 = in.m_73.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_132);
        float _372 = 1.0 / _370;
        float _374 = _166 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_73.x;
    float _380 = in.m_73.y;
    float _382 = in.m_73.z;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = _376 + _384;
    float _388 = in.m_60.x;
    float _390 = in.m_60.y;
    float _392 = in.m_60.z;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _416 = _414 != 0;
    float _418 = 1.0 / _396;
    float _420 = 1.0 / _400;
    bool _422 = !_412;
    int _424 = _422 ? 0 : 1;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = _378 * 2.0;
    float _432 = _378 + _382;
    float _434 = 1.0 / _404;
    float _436 = _382 * 2.0;
    float _438 = _196 * _390;
    float _440 = _202 * _390;
    float _442 = _380 + _378;
    float _444 = _380 * 2.0;
    float _446 = fma(_194, _388, _438);
    float _448 = fma(_200, _388, _440);
    float _450 = floor(_436);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _454 = _376 + _452;
    float _456 = _380 + _382;
    float _458 = _382 + (-0.5);
    float _460 = _378 + (-0.5);
    float _462 = _380 + (-0.5);
    float _464 = _454 * _420;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _468 = _376 + _466;
    float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _472 = log2(_470);
    float _474 = _456 + (-1.0);
    float _476 = _386 * _434;
    float _478 = _468 * _418;
    float _480 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _482 = _432 + (-1.0);
    float _484 = _442 + (-1.0);
    float _486 = floor(_430);
    float _488 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _490 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _492 = _450 > 0.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _494;
    bool _498 = _450 >= 0.0;
    bool _500 = isnan(_450);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = floor(_444);
    float _518 = fma(_496, _478, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _520 = fma(_510, _478, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _522 = fma(_514, _478, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = _472 * _166;
    int _526 = _506 ? 0 : 1;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _532 = _486 > 0.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _538 = _486 >= 0.0;
    bool _540 = isnan(_486);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = exp2(_524);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _554 = ~_526;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    float _560 = fma(_530, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _562 = _546 ? 0 : 1;
    float _564 = fma(_536, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _566 = _516 > 0.0;
    float _568 = fma(_552, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _570 = ~_562;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    bool _580 = _516 >= 0.0;
    bool _582 = isnan(_516);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    int _594 = _558;
    int _596 = _574;
    float _598 = _390;
    if (!_492)
    {
        int _600 = ~_526;
        int _602 = _600 + 1;
        _594 = _602;
    }
    int _604 = _594;
    float _606 = fma(_198, _392, _446);
    if (!_532)
    {
        int _608 = ~_562;
        int _610 = _608 + 1;
        _596 = _610;
    }
    int _612 = _596;
    float _614 = fma(_204, _392, _448);
    float _616 = in.m_75.x;
    float _618 = in.m_75.y;
    float _620 = in.m_75.z;
    bool _622 = !_408;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_424);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _630 = 1.0 + _628;
    int _632 = abs(_624);
    float _634 = -_548;
    float _636 = _634 + 1.0;
    float _638 = fma(_428, _476, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _640 = fma(_578, _476, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _642 = float(_632);
    float _644 = 1.0 / _630;
    float _646 = float(_604);
    float _648 = fma(_592, _476, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _650 = float(_612);
    bool _652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _654 = isnan(1.0);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _660 = _656 || _658;
    float _662 = _642 * _646;
    bool _664 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = float(_626);
    float _676 = _662 * (-2.0);
    int _678 = _588 ? 0 : 1;
    float _680 = _672 ? _636 : 0.0;
    float _682 = _674 * _650;
    float _684 = fma(_490, _676, _490);
    int _686 = ~_678;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = fma(_676, _616, _616);
    float _694 = _682 * (-2.0);
    bool _696 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _698 = isnan(_376);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    int _708 = _690;
    if (_660)
    {
        float _710 = _680 * _644;
        _168 = _710;
    }
    float _712 = _168;
    if (!_566)
    {
        int _714 = ~_678;
        int _716 = _714 + 1;
        _708 = _716;
    }
    int _718 = _708;
    float _720 = fma(_694, _618, _618);
    bool _722 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _724 = isnan(_376);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[196].x, _692);
    bool _740 = !_416;
    int _742 = _740 ? 0 : 1;
    float _744 = fma(_480, _694, _480);
    bool _746 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _748 = isnan(_376);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -_732;
    float _760 = _758 + 1.0;
    float _762 = _732 * _736;
    int _764 = abs(_742);
    float _766 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[196].y, _720);
    float _768 = _756 * _760;
    float _770 = -_756;
    float _772 = _770 + 1.0;
    float _774 = fma(_684, _712, _738);
    bool _776 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _778 = isnan(_376);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = fma(_744, _712, _766);
    float _790 = float(_764);
    float _792 = _774 * 0.15915493667125701904296875;
    float _794 = float(_718);
    float _796 = _786 * _772;
    float _798 = -_786;
    float _800 = _798 + 1.0;
    float _802 = _788 * 0.15915493667125701904296875;
    float _804 = _792 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _790 * _794;
    float _810 = _520 * _796;
    float _812 = _522 * _796;
    float _814 = _518 * _796;
    float _816 = _808 * (-2.0);
    float _818 = in.m_77.x;
    float _820 = in.m_77.y;
    float _822 = in.m_77.z;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _810);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _812);
    float _828 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _814);
    float _830 = fma(_816, _620, _620);
    float _832 = in.m_79.x;
    float _834 = in.m_79.y;
    float _836 = in.m_79.z;
    float _838 = fma(_488, _816, _488);
    float _840 = fma(_560, _768, _824);
    float _842 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _830);
    float _844 = fma(_564, _768, _826);
    float _846 = _802 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = fma(_638, _762, _840);
    float _852 = fma(_838, _712, _842);
    float _854 = fma(_640, _762, _844);
    float _856 = fma(_568, _768, _828);
    float _858 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].x, _850);
    float _860 = _852 * 0.15915493667125701904296875;
    float _862 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].y, _854);
    float _864 = _802 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = fma(_648, _762, _856);
    float _870 = in.m_71.w;
    float _872 = _858 * _818;
    float _874 = _862 * _820;
    float _876 = _792 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].z, _868);
    float _882 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _888 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _890 = _806 * _848;
    float _892 = _884 * _882;
    float _894 = _860 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _886 * _888;
    float _900 = _806 * _866;
    float _902 = _880 * _822;
    float _904 = in.m_69.w;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
    float _908 = _902 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _910 = _860 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _878 * _848;
    float _916 = _878 * _866;
    float _918 = _906 * _908;
    float _920 = _614 + _870;
    float _922 = in.m_81.y;
    float _924 = _806 * _896;
    float _926 = _866 * _896;
    float _928 = _878 * _896;
    float _930 = _848 * _896;
    float _932 = _924 * _898;
    float _934 = fma(_912, _900, _914);
    float _936 = -_898;
    float _938 = _912 * _936;
    float _940 = -_916;
    float _942 = fma(_912, _890, _940);
    float _944 = -_890;
    float _946 = fma(_912, _916, _944);
    float _948 = fma(_934, _892, _932);
    float _950 = _928 * _898;
    float _952 = fma(_926, _892, _938);
    float _954 = fma(_912, _914, _900);
    float _956 = fma(_942, _918, _948);
    float _958 = fma(_946, _892, _950);
    float _960 = fma(_930, _918, _952);
    float _962 = _606 + _904;
    float _964 = _956 * _328;
    float _966 = _956 * _332;
    float _968 = fma(_954, _918, _958);
    float _970 = _390 + _922;
    float _972 = fma(_960, _306, _964);
    float _974 = fma(_960, _310, _966);
    float _976 = fma(_968, _340, _972);
    float _978 = fma(_968, _344, _974);
    float _980 = _962 + _976;
    float _982 = _920 + _978;
    float _984 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _986 = _980 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _990 = _982 + _988;
    float _992 = _986 * _986;
    float _994 = _990 * _990;
    float _996 = _992 + _994;
    float _998 = sqrt(_996);
    bool _1000 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1004 = _998 + _1002;
    float _1006 = _956 * _320;
    float _1008 = fma(_960, _302, _1006);
    float _1010 = fma(_968, _336, _1008);
    float _1012 = _828;
    float _1014 = _1006;
    float _1016 = _980;
    float _1018 = _982;
    float _1020 = _992;
    float _1022 = _994;
    float _1024 = _934;
    float _1026 = _928;
    if (_1000)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1028;
    }
    float _1030 = _1012;
    float _1032 = _970 + _1010;
    float _1034 = _1032;
    if (_1000)
    {
        float _1036 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _1036;
    }
    float _1038 = _598;
    float _1040 = _1038;
    if (_1000)
    {
        float _1042 = rsqrt(_996);
        _1014 = _1042;
    }
    float _1044 = _1014;
    float _1046 = _1030;
    if (_1000)
    {
        float _1048 = _1004 * _1030;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = _1050;
    if (_1000)
    {
        float _1054 = _1050 * 0.15915493667125701904296875;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _978;
    if (_1000)
    {
        float _1060 = _1056 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1058 = _1062;
    }
    float _1064 = _1058;
    if (_1000)
    {
        float _1066 = fma(_1064, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1066;
    }
    float _1068 = _1040;
    float _1070 = _1068;
    if (_1000)
    {
        float _1072 = _1044 * _1068;
        _1070 = _1072;
    }
    float _1074 = _1070;
    if (_1000)
    {
        float _1076 = fma(_986, _1074, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1016 = _1076;
    }
    float _1078 = _1016;
    if (_1000)
    {
        float _1080 = fma(_990, _1074, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1018 = _1080;
    }
    float _1082 = _1018;
    float _1084 = fma(_1078, 6.2500002968590706586837768554688e-05, 0.5);
    float _1086 = fma(_1082, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4292 = float2(_1084, _1086);
    float3 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4292, float2(0.0), isnan(_4292)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4292, float2(0.0), isnan(_4292)), level(0.0)).xyz;
    float _1092 = _1090.x;
    float _1094 = _1090.y;
    float _1096 = _1090.z;
    float _1098 = in.m_83.y;
    bool _1100 = _834 != 0.0;
    bool _1102 = isnan(_834);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1056;
    if (_1000)
    {
        float _1112 = _1056 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        _1110 = _1114;
    }
    float _1116 = _1110;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_73.w;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    bool _1128 = _832 == 0.0;
    bool _1130 = !_1108;
    bool _1132 = _1128 && _1130;
    float _1134 = in.m_85.x;
    float _1136 = in.m_85.y;
    float _1138 = in.m_85.z;
    bool _1140 = _836 == 0.0;
    bool _1142 = _1140 && _1132;
    float _1144 = in.m_83.x;
    float _1146 = _1004;
    float _1148 = 1.0;
    float _1150 = 1.0;
    if (_1120)
    {
        float _1152 = in.m_73.z;
        _1146 = _1152;
    }
    float _1154 = _1146;
    out.m_87.x = 1.0;
    out.m_87.y = 1.0;
    out.m_87.z = 1.0;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1160 = -_1098;
    float _1162 = _1160 + 1.0;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1170 = _1122 > 0.5;
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1098;
    if (_1126)
    {
        float _1178 = _1170 ? _1162 : _1098;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = 0.0;
    if (_1142)
    {
        _1182 = _1136;
    }
    float _1184 = _1182;
    float _1186 = _1184;
    if (!_1142)
    {
        float _1188 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1136);
        _1186 = _1188;
    }
    float _1190 = _1186;
    if (_1142)
    {
        _1148 = _1138;
    }
    float _1192 = _1148;
    float _1194 = _1192;
    if (!_1142)
    {
        float _1196 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1138);
        _1194 = _1196;
    }
    float _1198 = _1194;
    float _1200 = 0.0;
    if (_1120)
    {
        _1200 = _1144;
    }
    float _1202 = _1200;
    out.m_89.x = _1168;
    out.m_89.y = _1172;
    out.m_89.z = _1174;
    out.m_89.w = _1166;
    bool _1204 = _1154 > 0.5;
    bool _1206 = _1204 && _1120;
    float _1208 = _1202;
    if (!_1120)
    {
        _1150 = _1144;
    }
    float _1210 = _1150;
    float _1212 = in.m_91.x;
    float _1214 = in.m_91.y;
    float _1216 = in.m_91.z;
    float _1218 = in.m_91.w;
    float _1220 = 0.0;
    float _1222 = _1210;
    if (_1142)
    {
        _1220 = _1134;
    }
    float _1224 = _1220;
    float _1226 = _1224;
    if (!_1142)
    {
        float _1228 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1134);
        _1226 = _1228;
    }
    float _1230 = _1226;
    float _1232 = _928 * _1190;
    float _1234 = _1230;
    if (_1206)
    {
        float _1236 = -_1202;
        float _1238 = _1236 + 1.0;
        _1208 = _1238;
    }
    float _1240 = _1208;
    float _1242 = fma(_946, _1230, _1232);
    if (_1120)
    {
        _1222 = _1240;
    }
    float _1244 = _1222;
    float _1246 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1248 = _1216 * _1134;
    float _1250 = _1214 * _1138;
    float _1252 = _1212 * _1136;
    float _1254 = -_1248;
    float _1256 = fma(_1212, _1138, _1254);
    float _1258 = -_1250;
    float _1260 = fma(_1216, _1136, _1258);
    float _1262 = -_1252;
    float _1264 = fma(_1214, _1134, _1262);
    float _1266 = -_1214;
    float _1268 = _912 * _1266;
    float _1270 = _1256 * _1218;
    float _1272 = _1260 * _1218;
    float _1274 = -_1190;
    float _1276 = _912 * _1274;
    float _1278 = _1264 * _1218;
    float _1280 = -_1270;
    float _1282 = _912 * _1280;
    float _1284 = fma(_926, _1212, _1268);
    float _1286 = _924 * _1190;
    float _1288 = _924 * _1214;
    float _1290 = _928 * _1214;
    float _1292 = _924 * _1270;
    float _1294 = fma(_926, _1230, _1276);
    float _1296 = _928 * _1270;
    float _1298 = fma(_926, _1272, _1282);
    float _1300 = fma(_934, _1230, _1286);
    float _1302 = fma(_934, _1212, _1288);
    float _1304 = fma(_946, _1212, _1290);
    float _1306 = fma(_934, _1272, _1292);
    float _1308 = fma(_946, _1272, _1296);
    float _1310 = fma(_942, _1198, _1300);
    float _1312 = fma(_930, _1198, _1294);
    float _1314 = fma(_930, _1216, _1284);
    float _1316 = fma(_942, _1216, _1302);
    float _1318 = fma(_954, _1216, _1304);
    float _1320 = fma(_930, _1278, _1298);
    float _1322 = fma(_942, _1278, _1306);
    float _1324 = fma(_954, _1278, _1308);
    float _1326 = _1310 * _328;
    float _1328 = fma(_954, _1198, _1242);
    float _1330 = _1310 * _320;
    float _1332 = _1310 * _332;
    float _1334 = _1316 * _328;
    float _1336 = fma(_1312, _306, _1326);
    float _1338 = _1326;
    float _1340 = _1334;
    float _1342 = _1322;
    float _1344 = _1320;
    if (_1000)
    {
        float _1346 = _1116 + (-1.0);
        _1338 = _1346;
    }
    float _1348 = _1338;
    float _1350 = fma(_1312, _302, _1330);
    float _1352 = fma(_1312, _310, _1332);
    float _1354 = fma(_1314, _306, _1334);
    if (_1000)
    {
        float _1356 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1356;
    }
    float _1358 = _1340;
    float _1360 = _1316 * _320;
    float _1362 = _1316 * _332;
    float _1364 = _1322 * _328;
    float _1366 = _1322 * _320;
    float _1368 = _1322 * _332;
    float _1370 = _1362;
    if (_1000)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1374 = _1078 + _1372;
        _1342 = _1374;
    }
    float _1376 = _1342;
    if (_1000)
    {
        float _1378 = fma(_1032, _1116, _1358);
        _1034 = _1378;
    }
    float _1380 = _1034;
    float _1382 = fma(_1314, _310, _1362);
    if (_1000)
    {
        float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1386 = _1082 + _1384;
        _1370 = _1386;
    }
    float _1388 = _1370;
    if (_1000)
    {
        float _1390 = _1376 * _1376;
        _1020 = _1390;
    }
    float _1392 = _1020;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1396 = _1380 + _1394;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1000)
    {
        float _1400 = _1388 * _1388;
        _1022 = _1400;
    }
    float _1402 = _1022;
    float _1404 = fma(_1314, _302, _1360);
    float _1406 = fma(_1396, _1396, _1392);
    float _1408 = fma(_1320, _306, _1364);
    float _1410 = fma(_1320, _302, _1366);
    float _1412 = fma(_1318, _340, _1354);
    float _1414 = _1406 + _1402;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1418 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1420 = fma(_1320, _310, _1368);
    float _1422 = fma(_1318, _336, _1404);
    float _1424 = fma(_1318, _344, _1382);
    float _1426 = fma(_1328, _340, _1336);
    float _1428 = fma(_1324, _340, _1408);
    float _1430 = fma(_1324, _336, _1410);
    float _1432 = sqrt(_1414);
    float _1434 = fma(_1328, _336, _1350);
    float _1436 = _1246 * _1398;
    float _1438 = fma(_1324, _344, _1420);
    float _1440 = fma(_1328, _344, _1352);
    out.m_93.x = _1412;
    out.m_93.y = _1422;
    out.m_93.z = _1424;
    float _1442 = _1418 * _1416;
    out.m_95.x = _1428;
    out.m_95.y = _1430;
    out.m_95.z = _1438;
    out.m_97.z = _1436;
    out.m_97.w = _1442;
    bool _1444 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1446 = isnan(_1432);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1452 = _1448 || _1450;
    out.m_99.x = _1426;
    out.m_99.y = _1434;
    out.m_99.z = _1440;
    if (!_1452)
    {
        _348 = 1.0;
    }
    float _1454 = _348;
    out.m_101.x = _1092;
    out.m_101.y = _1094;
    out.m_101.z = _1096;
    bool _1456 = !_1452;
    float _1458 = _1454;
    if (!_1456)
    {
        bool _1460 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1462 = isnan(_1432);
        bool _1464 = _1460 || _1462;
        bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1468 = _1464 || _1466;
        if (!_1468)
        {
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = _1432 + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1476 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1474;
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1482 = 1.0 / _1476;
            float _1484 = _1472 * _1482;
            float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1458 = _1486;
            _1488 = true;
        }
        else
        {
            bool _1490 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1492 = isnan(_1432);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1432 + _1500;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1510 = _1508 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1512 = 1.0 / _1506;
                float _1514 = _1502 * _1512;
                float _1516 = fma(_1514, _1510, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1458 = _1516;
                _1488 = true;
            }
            else
            {
                _1458 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1488 = false;
    float _1518 = _1458;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1522 = _1380 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1526 = _1078 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1530 = _1082 + _1528;
    float _1532 = _970 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1534 = fma(_1522, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1536 = fma(_1526, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1538 = fma(_1530, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1540 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1532);
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1534 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1536 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1540);
    float _1562 = _970 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1564 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1566 = rsqrt(_1558);
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1570 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1562);
    float _1572 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1570);
    float _1574 = 1.0 / _1568;
    float _1576 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1578 = _1576 + _1568;
    float _1580 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = sqrt(_1558);
    float _1584 = _1548 * _1580;
    float _1586 = _1552 * _1580;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 * _1586;
    float _1592 = _1578 * _1574;
    float _1594 = _1592 * 0.5;
    float _1596 = _1588 + _1590;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1600 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1598);
    float _1602 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1604 = sqrt(_1596);
    float _1606 = _970 + _1602;
    float _1608 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1610 = 1.0 / _1600;
    float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1614 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1608);
    float _1616 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1612);
    float _1618 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1614);
    bool _1620 = _1604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1616);
    float _1624 = floor(_1564);
    float _1626 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1628 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1632 = _1610 * _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1604 + _1634;
    float _1638 = trunc(_1626);
    int _1640 = int(_1638);
    float _1642 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1644 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1646 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1648 = precise::max(0.0, _1642);
    float _1650 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _1652 = 2;
    float _1654 = _1580;
    float _1656 = _1636;
    float _1658 = _1596;
    float _1660 = _1584;
    float _1662 = _1588;
    int _1664 = as_type<int>(_1590);
    if (_1620)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1666;
    }
    float _1668 = _1650;
    float _1670 = -_1624;
    float _1672 = _1564 + _1670;
    float _1674 = -_1580;
    float _1676 = -_1648;
    float _1678 = fma(_1544, _1674, _1676);
    float _1680 = trunc(_1628);
    int _1682 = int(_1680);
    float _1684 = _1678;
    if (!_1644)
    {
        _1652 = 1;
    }
    int _1686 = _1652;
    int _1688 = _1686;
    if (_1620)
    {
        float _1690 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1690;
    }
    float _1692 = _1654;
    int _1694 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1696 = _1640 + _1694;
    int _1698 = _1696 + 1;
    if (_1620)
    {
        float _1700 = _1636 * _1668;
        _1656 = _1700;
    }
    float _1702 = _1656;
    if (_1620)
    {
        float _1704 = rsqrt(_1596);
        _1658 = _1704;
    }
    float _1706 = _1658;
    float _1708 = _1706;
    if (_1620)
    {
        float _1710 = _1702 * 0.15915493667125701904296875;
        _1344 = _1710;
    }
    float _1712 = _1344;
    bool _1714 = !_1644;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1720 = _1682 + _1718;
    int _1722 = _1720 + 1;
    float _1724 = _1622;
    if (_1620)
    {
        float _1726 = _1712 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        _1724 = _1728;
    }
    float _1730 = _1724;
    if (!_1646)
    {
        _1688 = _1716;
    }
    int _1732 = _1688;
    bool _1734 = _1698 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1736 = _1732 << 6;
    int _1738 = _1698 | _1722;
    float _1740 = _1712;
    float _1742 = as_type<float>(_1738);
    if (_1620)
    {
        float _1744 = _1712 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        _1740 = _1746;
    }
    float _1748 = _1740;
    int _1750 = _1736 + 96;
    uint _1753 = uint(int(uint(_1750) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    bool _1769 = _1738 < 0;
    bool _1771 = _1769 || _1734;
    float _1773 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1620)
    {
        float _1775 = fma(_1730, _1692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1742 = _1775;
    }
    float _1777 = _1742;
    int _1779 = _1736 + 48;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    float _1797 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1799 = _1722 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1801 = _1799 || _1771;
    if (_1620)
    {
        float _1803 = _1706 * _1777;
        _1024 = _1803;
    }
    float _1805 = _1024;
    float _1807 = floor(_1773);
    float _1809 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1797);
    float _1811 = _1748;
    if (_1620)
    {
        float _1813 = _1748 + (-1.0);
        _1708 = _1813;
    }
    float _1815 = _1708;
    int _1817 = _1736 + 104;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    float _1835 = _1815;
    if (_1620)
    {
        float _1837 = _1584 * _1805;
        _1660 = _1837;
    }
    float _1839 = _1660;
    float _1841 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1809);
    if (_1620)
    {
        float _1843 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1234 = _1843;
    }
    float _1845 = _1234;
    if (!_1620)
    {
        _1835 = _1586;
    }
    float _1847 = _1835;
    float _1849 = _1847;
    if (_1620)
    {
        float _1851 = _1586 * _1805;
        _1849 = _1851;
    }
    float _1853 = _1849;
    if (_1620)
    {
        float _1855 = _1839 * _1839;
        _1662 = _1855;
    }
    float _1857 = _1662;
    if (_1620)
    {
        float _1859 = fma(_1678, _1748, _1845);
        _1684 = _1859;
    }
    float _1861 = _1684;
    int _1863 = _1736 + 64;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    uint _1867 = uint(int(uint(int(_1865)) >> uint(2)));
    int _1869 = int(_1865) & 3;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[int(_1867)][_1869];
    int _1873 = int(_1865) + 1;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    int _1877 = _1873 & 3;
    float _1879 = (*spvDescriptorSet0.vp_c15)._m0[int(_1875)][_1877];
    if (!_1620)
    {
        _1811 = _1590;
    }
    float _1881 = _1811;
    float _1883 = _1881;
    if (_1620)
    {
        float _1885 = _1853 * _1853;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = fma(_1861, _1861, _1857);
    if (!_1801)
    {
        float _1891 = floor(_1628);
        _1026 = _1891;
    }
    float _1893 = _1026;
    if (!_1801)
    {
        int _1895 = _1722 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1897 = _1895 + _1698;
        _1664 = _1897;
    }
    int _1899 = _1664;
    float _1901 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1903 = _1889 + _1887;
    int _1905 = _1736 + 56;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    uint _1909 = uint(int(uint(int(_1907)) >> uint(2)));
    int _1911 = int(_1907) & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    int _1915 = int(_1907) + 1;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    int _1919 = _1915 & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    float _1923 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1925 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1927 = -_1807;
    float _1929 = _1773 + _1927;
    float _1931 = -_1925;
    float _1933 = fma(_1931, _1923, 1.0);
    int _1935 = _1736 + 80;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    float _1953 = log2(_1933);
    int _1955 = _1736 + 88;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    uint _1959 = uint(int(uint(int(_1957)) >> uint(2)));
    int _1961 = int(_1957) & 3;
    float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
    int _1965 = int(_1957) + 1;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    int _1969 = _1965 & 3;
    float _1971 = (*spvDescriptorSet0.vp_c15)._m0[int(_1967)][_1969];
    float _1973 = _1606 * _1767;
    float _1975 = fma(_962, _1759, _1973);
    int _1977 = _1736 + 72;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    float _1995 = _1606 * _1795;
    float _1997 = rsqrt(_1903);
    float _1999 = _1953 * 0.693147182464599609375;
    float _2001 = fma(_962, _1787, _1995);
    int _2003 = as_type<int>(_1995);
    int _2005 = as_type<int>(_1759);
    if (!_1801)
    {
        int _2007 = _1899 << 2;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = fma(_920, _1825, _1975);
    int _2013 = _2009;
    float _2015 = _1879;
    if (!_1801)
    {
        int _2017 = 12 & _2009;
        _2013 = _2017;
    }
    int _2019 = _2013;
    float _2021 = _2011 + _1833;
    float _2023 = _1606 * _1879;
    if (!_1801)
    {
        float _2025 = -_1893;
        float _2027 = _1628 + _2025;
        _2015 = _2027;
    }
    float _2029 = _2015;
    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2033 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2031);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _1997 * _1839;
    float _2039 = fma(_962, _1871, _2023);
    float _2041 = _1997 * _1861;
    float _2043 = _1997 * _1853;
    float _2045 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2047 = fma(_920, _1913, _2001);
    float2 _5927 = float2(_1672, _1929);
    float _2049 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5927, float2(0.0), isnan(_5927)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5927, float2(0.0), isnan(_5927)), level(0.0)).x;
    float _2051 = 1.0 / _2021;
    float _2053 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2055 = _2047 + _1921;
    float _2057 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = _1606 * _1951;
    int _2061 = as_type<int>(_1951);
    if (!_1801)
    {
        uint _2063 = uint(int(uint(_1899) >> uint(2)));
        _2061 = int(_2063);
    }
    int _2065 = _2061;
    float _2067 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2057);
    float _2069 = fma(_962, _1943, _2059);
    float _2071 = -_2035;
    float _2073 = _2071 + 1.0;
    if (!_1801)
    {
        int _2075 = _2065 << 4;
        int _2077 = _2075 + _2019;
        _2005 = _2077;
    }
    int _2079 = _2005;
    float _2081 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2083 = fma(_920, _1963, _2069);
    float _2085 = -_2045;
    float _2087 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2085);
    float _2089 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = abs(_2073);
    float _2093 = log2(_2091);
    float _2095 = _2055 * _2051;
    float _2097 = -_2043;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2087);
    float _2101 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2103 = _2035;
    float _2105 = as_type<float>(_2079);
    if (!_1801)
    {
        int _2107 = _2079 + 400;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
        _2103 = _2115;
    }
    float _2117 = _2103;
    float _2119 = fma(_920, _1985, _2039);
    bool _2121 = _2095 >= 0.0;
    float _2123 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2101);
    float _2125 = fma(_2099, -0.5, 0.5);
    float _2127 = _2119 + _1993;
    float _2129 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2131 = _2095 <= 1.0;
    bool _2133 = _2131 && _2121;
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2137 = _2127 * _2051;
    float _2139 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2129);
    float _2141 = fma(_2099, 0.5, 0.5);
    float _2143 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2145 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    bool _2149 = _2137 >= 0.0;
    bool _2151 = _2149 && _2133;
    float _2153 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = exp2(_2143);
    float _2157 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2159 = _2137 <= 1.0;
    bool _2161 = _2159 && _2151;
    float _2163 = _2083 + _1971;
    float _2165 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2169 = _2041 + 1.0;
    float _2171 = sqrt(_2125);
    float _2173 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2175 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2165);
    float _2177 = fma(_2141, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2179 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2181 = as_type<float>(_2019);
    float _2183 = _2169;
    if (!_1801)
    {
        float _2185 = floor(_1626);
        _2181 = _2185;
    }
    float _2187 = _2181;
    if (_2161)
    {
        float _2189 = float(_1732);
        _2105 = _2189;
    }
    float _2191 = _2105;
    float _2193 = fma(_2141, _2177, -0.212114393711090087890625);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = -_2041;
    float _2199 = fma(_2155, _2169, _2197);
    float _2201 = fma(_2141, _2193, 1.570728778839111328125);
    float _2203 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2205 = 1.0 / _2179;
    float _2207 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2175);
    float _2209 = _2171 * 0.636619746685028076171875;
    float _2211 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2203);
    float _2213 = _2163 * _2051;
    float _2215 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float _2217 = -_2201;
    float _2219 = fma(_2209, _2217, 1.0);
    float _2221 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2211);
    float _2223 = _2191;
    float _2225 = _2213;
    if (_2161)
    {
        float _2227 = rint(_2191);
        float _2229 = precise::max(_2227, 0.0);
        uint _2231 = uint(_2229);
        uint _2233 = clamp(_2231, 0u, 65535u);
        _2223 = as_type<float>(_2233);
    }
    float _2235 = _2223;
    if (!_1801)
    {
        float _2237 = -_2187;
        float _2239 = _1626 + _2237;
        _2183 = _2239;
    }
    float _2241 = _2183;
    float _2243 = fma(_2199, 0.5, 0.5);
    float _2245 = _2215 * _2205;
    float _2247 = _2221 * _2205;
    float _2249 = _2051;
    if (!_1801)
    {
        float _2251 = rint(_2117);
        float _2253 = precise::max(_2251, 0.0);
        uint _2255 = uint(_2253);
        uint _2257 = clamp(_2255, 0u, 65535u);
        _2249 = as_type<float>(_2257);
    }
    float _2259 = _2249;
    float _2261 = fma(_2245, 0.5, 0.5);
    float _2263 = fma(_2247, -0.5, 0.5);
    float _2265 = _2235;
    if (_2161)
    {
        float3 _6298 = float3(_2095, _2137, float(as_type<int>(_2235)));
        float3 _6302 = select(_6298, float3(0.0), isnan(_6298));
        float _2267 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6302.xy, uint(rint(_6302.z)), _2213, level(0.0));
        _2265 = _2267;
    }
    float _2269 = _2265;
    float3 _6312 = float3(_2261, _2263, _2053);
    float _2271 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6312, float3(0.0), isnan(_6312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6312, float3(0.0), isnan(_6312)), level(0.0)).x;
    float3 _6321 = float3(_2261, _2263, _2053);
    float4 _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6321, float3(0.0), isnan(_6321)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6321, float3(0.0), isnan(_6321)), level(0.0)).xyzw;
    float _2276 = _2274.x;
    float _2278 = _2274.y;
    float _2280 = _2274.z;
    float _2282 = _2274.w;
    float2 _6337 = float2(_2219, _2243);
    float3 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).xyz;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2259;
    if (!_1801)
    {
        float3 _6358 = float3(_2241, _2029, float(as_type<int>(_2259)));
        float3 _6360 = select(_6358, float3(0.0), isnan(_6358));
        float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6360.xy, uint(rint(_6360.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6360.xy, uint(rint(_6360.z)), level(0.0)).x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = abs(_1632);
    float _2300 = log2(_2298);
    float _2302 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2304 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2302);
    float _2306 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    bool _2308 = _1632 <= 8000.0;
    bool _2310 = isnan(_1632);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(8000.0);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2322 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2324 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2215;
    out.gl_Position.y = _2221;
    out.gl_Position.z = _2320;
    out.gl_Position.w = _2179;
    float _2326 = exp2(_2322);
    float _2328 = exp2(_2324);
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = fma(_2332, -2.0, 3.0);
    float _2336 = _2332 * _2332;
    float _2338 = _2336 * _2334;
    float _2340 = _2320 + _2179;
    float _2342 = _2340 * 0.5;
    float _2344 = -_2338;
    float _2346 = _2344 + 1.0;
    out.m_103.z = _2342;
    out.m_103.w = _2179;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2338);
    float _2350 = -_2326;
    float _2352 = _2350 + 1.0;
    float _2354 = _2318 * _2348;
    float _2356 = _2348;
    float _2358 = _2320;
    float _2360 = _2215;
    if (!_2161)
    {
        _2356 = 1.0;
    }
    float _2362 = _2356;
    float _2364 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2366 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2368 = -_2049;
    float _2370 = _2368 + 1.0;
    float _2372 = _2370 * _2366;
    float _2374 = precise::clamp(_2372, 0.0, 1.0);
    float _2376 = _2366;
    float _2378 = _2362;
    if (_1801)
    {
        _2376 = 1.0;
    }
    float _2380 = _2376;
    float _2382 = _2380;
    if (_2161)
    {
        bool _2384 = _2269 >= _2213;
        bool _2386 = isnan(_2269);
        bool _2388 = _2384 || _2386;
        bool _2390 = isnan(_2213);
        bool _2392 = _2388 || _2390;
        float _2394 = float(_2392);
        _2378 = _2394;
    }
    float _2396 = _2378;
    if (!_1801)
    {
        int _2398 = _1899 << 4;
        int _2400 = _2398 + 2048;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
        int _2406 = int(_2402) & 3;
        float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
        int _2410 = int(_2402) + 1;
        uint _2412 = uint(int(uint(_2410) >> uint(2)));
        int _2414 = _2410 & 3;
        float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
        int _2418 = _2400 + 8;
        uint _2420 = uint(int(uint(_2418) >> uint(2)));
        uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
        int _2424 = int(_2420) & 3;
        float _2426 = (*spvDescriptorSet0.vp_c15)._m0[int(_2422)][_2424];
        int _2428 = int(_2420) + 1;
        uint _2430 = uint(int(uint(_2428) >> uint(2)));
        int _2432 = _2428 & 3;
        float _2434 = (*spvDescriptorSet0.vp_c15)._m0[int(_2430)][_2432];
        float _2436 = _1606 * _2416;
        float _2438 = fma(_962, _2408, _2436);
        float _2440 = fma(_920, _2426, _2438);
        float _2442 = _2440 + _2434;
        float _2444 = precise::clamp(_2442, 0.0, 1.0);
        float _2446 = -_2444;
        float _2448 = _2446 + _2296;
        float _2450 = fma(_2448, 500.0, 1.5);
        float _2452 = exp2(_2450);
        float _2454 = 0.0 + _2452;
        float _2456 = precise::clamp(_2454, 0.0, 1.0);
        _2382 = _2456;
        _2358 = _2426;
        _2225 = _2452;
        _2360 = 500.0;
    }
    float _2458 = _2382;
    float _2460 = _2358;
    float _2462 = _2225;
    float _2464 = _2360;
    float _2466 = _2396 * _2458;
    float _2468 = -_2374;
    float _2470 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2472 = _2364 * _2271;
    out.m_105.x = _1536;
    out.m_105.y = _1534;
    out.m_105.z = _1538;
    bool _2474 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2476 = isnan(_1582);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2482 = _2478 || _2480;
    float _2484 = -_2466;
    float _2486 = fma(_2484, _2470, 1.0);
    float _2488 = precise::clamp(_2486, 0.0, 1.0);
    float _2490 = _2282 * _2472;
    float _2492 = -_2364;
    float _2494 = _2492 + 1.0;
    float _2496 = _2290 * _2472;
    float _2498 = _2488 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2500 = fma(_2286, _2490, _2276);
    float _2502 = fma(_2288, _2490, _2278);
    float _2504 = _2282 * _2494;
    float _2506 = fma(_2282, _2496, _2280);
    out.m_107.x = _2498;
    float _2508 = _2462;
    float _2510 = _2460;
    float _2512 = _2464;
    float _2514 = _2494;
    float _2516 = _2490;
    float _2518 = _2488;
    if (!_2482)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2520 = _2508;
    out.m_109.x = _2500;
    out.m_109.y = _2502;
    out.m_109.z = _2506;
    out.m_109.w = _2504;
    float _2522 = _2520;
    float _2524 = _2520;
    if (!_2482)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2526 = _2510;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2482)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2532 = _2512;
    float _2534 = _2532;
    float _2536 = _2532;
    if (!_2482)
    {
        _2514 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2538 = _2514;
    float _2540 = _2538;
    float _2542 = _2538;
    if (!_2482)
    {
        _2516 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2544 = _2516;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2482)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2550 = _2518;
    bool _2552 = !_2482;
    float _2554 = _2550;
    float _2556 = _2550;
    if (!_2552)
    {
        bool _2558 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2560 = isnan(_1582);
        bool _2562 = _2558 || _2560;
        bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2566 = _2562 || _2564;
        if (!_2566)
        {
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2570 = _1582 + _2568;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2574 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2572;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2580 = 1.0 / _2574;
            float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2598 = _2570 * _2580;
            float _2600 = precise::clamp(_2598, 0.0, 1.0);
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2606 = fma(_2600, _2578, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2608 = fma(_2600, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2610 = fma(_2600, _2584, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2612 = fma(_2600, _2588, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2614 = fma(_2600, _2592, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2616 = fma(_2600, _2596, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2530 = _2606;
            _2548 = _2614;
            _2524 = _2610;
            _2542 = _2612;
            _2536 = _2608;
            _2556 = _2616;
            _2618 = true;
        }
        else
        {
            bool _2620 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2622 = isnan(_1582);
            bool _2624 = _2620 || _2622;
            bool _2626 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2628 = _2624 || _2626;
            if (!_2628)
            {
                _2522 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2630 = _2522;
            _2524 = _2630;
            if (!_2628)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2632 = _2528;
            _2530 = _2632;
            if (!_2628)
            {
                _2534 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2634 = _2534;
            _2536 = _2634;
            if (!_2628)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2636 = _2540;
            _2542 = _2636;
            if (!_2628)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2638 = _2546;
            _2548 = _2638;
            if (!_2628)
            {
                _2554 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2640 = _2554;
            bool _2642 = !_2628;
            _2556 = _2640;
            if (!_2642)
            {
                bool _2644 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2646 = isnan(_1582);
                bool _2648 = _2644 || _2646;
                bool _2650 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2652 = _2648 || _2650;
                if (!_2652)
                {
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2656 = _1582 + _2654;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2660 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2658;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2666 = 1.0 / _2660;
                    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2684 = _2656 * _2666;
                    float _2686 = precise::clamp(_2684, 0.0, 1.0);
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2692 = fma(_2686, _2664, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2694 = fma(_2686, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2696 = fma(_2686, _2670, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2698 = fma(_2686, _2674, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2700 = fma(_2686, _2678, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2702 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2530 = _2692;
                    _2548 = _2700;
                    _2524 = _2696;
                    _2542 = _2698;
                    _2536 = _2694;
                    _2556 = _2702;
                    _2618 = true;
                }
                else
                {
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2524 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2536 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2556 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2618 = false;
    float _2704 = _2530;
    float _2706 = _2548;
    float _2708 = _2524;
    float _2710 = _2542;
    float _2712 = _2536;
    float _2714 = _2556;
    float _2716 = fma(_1434, -0.5, 0.5);
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    float _2720 = -_2704;
    float _2722 = _2720 + _2706;
    float _2724 = -_2708;
    float _2726 = _2724 + _2710;
    float _2728 = -_2712;
    float _2730 = _2728 + _2714;
    bool _2732 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2734 = fma(_2718, _2722, _2704);
    float _2736 = fma(_2718, _2726, _2708);
    float _2738 = fma(_2718, _2730, _2712);
    float _2740 = _2734 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2742 = fma(_2736, 0.298911988735198974609375, _2740);
    float _2744 = fma(_2738, 0.114477999508380889892578125, _2742);
    out.m_111.x = 0.0;
    float _2746 = -_2744;
    float _2748 = _2736 + _2746;
    float _2750 = -_2744;
    float _2752 = _2734 + _2750;
    float _2754 = -_2744;
    float _2756 = _2738 + _2754;
    float _2758 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2760 = fma(_2748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    float _2762 = fma(_2752, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    float _2764 = fma(_2756, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    out.m_107.w = _2758;
    out.m_113.x = _2760;
    out.m_113.y = _2762;
    out.m_113.z = _2764;
    if (!_2732)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2766 = -_1534;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2770 = -_1536;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2774 = -_1538;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2778 = _2768 * _2768;
    float _2780 = fma(_2772, _2772, _2778);
    float _2782 = fma(_2776, _2776, _2780);
    float _2784 = sqrt(_2782);
    float _2786 = rsqrt(_2782);
    float _2788 = -_2784;
    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2792 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = _2772 * _2786;
    float _2798 = _2768 * _2786;
    float _2800 = abs(_2794);
    float _2802 = log2(_2800);
    float _2804 = _2776 * _2786;
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2808 = _1434 * _2798;
    float _2810 = -_2798;
    float _2812 = -_2806;
    float _2814 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2812);
    float _2816 = fma(_1426, _2796, _2808);
    float _2818 = -_2804;
    float _2820 = fma(_2818, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2814);
    float _2822 = fma(_1440, _2804, _2816);
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2828 = _2820 + _2826;
    float _2830 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2832 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = exp2(_2830);
    float _2838 = _2836 * _2834;
    float _2840 = _2824 * _2838;
    float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2844 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2846 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2842;
    out.m_111.y = _2844;
    out.m_111.z = _2846;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2618 = false;
    bool _1488 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2903 = as_type<float>(_148);
        out.gl_Position.z = _2903;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_63.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2973 = as_type<float>(_186);
        out.gl_Position.z = _2973;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = in.m_71.x;
    float _202 = in.m_71.y;
    float _204 = in.m_71.z;
    float _206 = _188 * _188;
    float _208 = _190 * _190;
    float _210 = _192 * _192;
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _214);
    float _222 = fma(_204, _204, _216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    float _228 = sqrt(_222);
    bool _230 = _224 > 0.0;
    bool _232 = _226 > 0.0;
    float _234 = _226;
    float _236 = _218;
    float _238 = _222;
    if (_230)
    {
        float _240 = rsqrt(_218);
        _234 = _240;
    }
    float _242 = _234;
    float _244 = 0.0;
    float _246 = 0.0;
    if (!_230)
    {
        _244 = 0.0;
        _246 = 0.0;
    }
    float _248 = _244;
    float _250 = _246;
    bool _252 = _228 > 0.0;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _248;
    if (!_230)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = _260;
    if (!_232)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _268 = _262;
    float _270 = _264;
    float _272 = _228;
    float _274 = _270;
    float _276 = _268;
    if (_232)
    {
        float _278 = rsqrt(_220);
        _272 = _278;
    }
    float _280 = _272;
    float _282 = 0.0;
    if (!_232)
    {
        _282 = 0.0;
    }
    float _284 = _282;
    float _286 = 0.0;
    float _288 = _284;
    if (!_252)
    {
        _286 = 0.0;
    }
    float _290 = _286;
    float _292 = _224;
    float _294 = _290;
    if (_252)
    {
        float _296 = rsqrt(_222);
        _292 = _296;
    }
    float _298 = _292;
    if (_230)
    {
        float _300 = _242 * _188;
        _256 = _300;
    }
    float _302 = _256;
    if (_230)
    {
        float _304 = _242 * _194;
        _258 = _304;
    }
    float _306 = _258;
    if (_230)
    {
        float _308 = _242 * _200;
        _266 = _308;
    }
    float _310 = _266;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_252)
    {
        _236 = 0.0;
    }
    float _314 = _236;
    float _316 = _314;
    if (_232)
    {
        float _318 = _280 * _190;
        _274 = _318;
    }
    float _320 = _274;
    if (!_252)
    {
        _238 = 0.0;
    }
    float _322 = _238;
    float _324 = _322;
    if (_232)
    {
        float _326 = _280 * _196;
        _276 = _326;
    }
    float _328 = _276;
    if (_232)
    {
        float _330 = _280 * _202;
        _288 = _330;
    }
    float _332 = _288;
    if (_252)
    {
        float _334 = _298 * _192;
        _324 = _334;
    }
    float _336 = _324;
    if (_252)
    {
        float _338 = _298 * _198;
        _294 = _338;
    }
    float _340 = _294;
    if (_252)
    {
        float _342 = _298 * _204;
        _316 = _342;
    }
    float _344 = _316;
    bool _346 = !_312;
    float _348 = _344;
    float _366;
    if (!_346)
    {
        float _350 = in.m_73.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_132);
        float _372 = 1.0 / _370;
        float _374 = _166 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_73.x;
    float _380 = in.m_73.y;
    float _382 = in.m_73.z;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = _376 + _384;
    float _388 = in.m_60.x;
    float _390 = in.m_60.y;
    float _392 = in.m_60.z;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _416 = _414 != 0;
    float _418 = 1.0 / _396;
    float _420 = 1.0 / _400;
    bool _422 = !_412;
    int _424 = _422 ? 0 : 1;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = _378 * 2.0;
    float _432 = _378 + _382;
    float _434 = 1.0 / _404;
    float _436 = _382 * 2.0;
    float _438 = _196 * _390;
    float _440 = _202 * _390;
    float _442 = _380 + _378;
    float _444 = _380 * 2.0;
    float _446 = fma(_194, _388, _438);
    float _448 = fma(_200, _388, _440);
    float _450 = floor(_436);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _454 = _376 + _452;
    float _456 = _380 + _382;
    float _458 = _382 + (-0.5);
    float _460 = _378 + (-0.5);
    float _462 = _380 + (-0.5);
    float _464 = _454 * _420;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _468 = _376 + _466;
    float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _472 = log2(_470);
    float _474 = _456 + (-1.0);
    float _476 = _386 * _434;
    float _478 = _468 * _418;
    float _480 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _482 = _432 + (-1.0);
    float _484 = _442 + (-1.0);
    float _486 = floor(_430);
    float _488 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _490 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _492 = _450 > 0.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _494;
    bool _498 = _450 >= 0.0;
    bool _500 = isnan(_450);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = floor(_444);
    float _518 = fma(_496, _478, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _520 = fma(_510, _478, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _522 = fma(_514, _478, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = _472 * _166;
    int _526 = _506 ? 0 : 1;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _532 = _486 > 0.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _538 = _486 >= 0.0;
    bool _540 = isnan(_486);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = exp2(_524);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _554 = ~_526;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    float _560 = fma(_530, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _562 = _546 ? 0 : 1;
    float _564 = fma(_536, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _566 = _516 > 0.0;
    float _568 = fma(_552, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _570 = ~_562;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    bool _580 = _516 >= 0.0;
    bool _582 = isnan(_516);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    int _594 = _558;
    int _596 = _574;
    float _598 = _390;
    if (!_492)
    {
        int _600 = ~_526;
        int _602 = _600 + 1;
        _594 = _602;
    }
    int _604 = _594;
    float _606 = fma(_198, _392, _446);
    if (!_532)
    {
        int _608 = ~_562;
        int _610 = _608 + 1;
        _596 = _610;
    }
    int _612 = _596;
    float _614 = fma(_204, _392, _448);
    float _616 = in.m_75.x;
    float _618 = in.m_75.y;
    float _620 = in.m_75.z;
    bool _622 = !_408;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_424);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _630 = 1.0 + _628;
    int _632 = abs(_624);
    float _634 = -_548;
    float _636 = _634 + 1.0;
    float _638 = fma(_428, _476, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _640 = fma(_578, _476, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _642 = float(_632);
    float _644 = 1.0 / _630;
    float _646 = float(_604);
    float _648 = fma(_592, _476, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _650 = float(_612);
    bool _652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _654 = isnan(1.0);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _660 = _656 || _658;
    float _662 = _642 * _646;
    bool _664 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = float(_626);
    float _676 = _662 * (-2.0);
    int _678 = _588 ? 0 : 1;
    float _680 = _672 ? _636 : 0.0;
    float _682 = _674 * _650;
    float _684 = fma(_490, _676, _490);
    int _686 = ~_678;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = fma(_676, _616, _616);
    float _694 = _682 * (-2.0);
    bool _696 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _698 = isnan(_376);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    int _708 = _690;
    if (_660)
    {
        float _710 = _680 * _644;
        _168 = _710;
    }
    float _712 = _168;
    if (!_566)
    {
        int _714 = ~_678;
        int _716 = _714 + 1;
        _708 = _716;
    }
    int _718 = _708;
    float _720 = fma(_694, _618, _618);
    bool _722 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _724 = isnan(_376);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[196].x, _692);
    bool _740 = !_416;
    int _742 = _740 ? 0 : 1;
    float _744 = fma(_480, _694, _480);
    bool _746 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _748 = isnan(_376);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -_732;
    float _760 = _758 + 1.0;
    float _762 = _732 * _736;
    int _764 = abs(_742);
    float _766 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[196].y, _720);
    float _768 = _756 * _760;
    float _770 = -_756;
    float _772 = _770 + 1.0;
    float _774 = fma(_684, _712, _738);
    bool _776 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _778 = isnan(_376);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = fma(_744, _712, _766);
    float _790 = float(_764);
    float _792 = _774 * 0.15915493667125701904296875;
    float _794 = float(_718);
    float _796 = _786 * _772;
    float _798 = -_786;
    float _800 = _798 + 1.0;
    float _802 = _788 * 0.15915493667125701904296875;
    float _804 = _792 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _790 * _794;
    float _810 = _520 * _796;
    float _812 = _522 * _796;
    float _814 = _518 * _796;
    float _816 = _808 * (-2.0);
    float _818 = in.m_77.x;
    float _820 = in.m_77.y;
    float _822 = in.m_77.z;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _810);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _812);
    float _828 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _814);
    float _830 = fma(_816, _620, _620);
    float _832 = in.m_79.x;
    float _834 = in.m_79.y;
    float _836 = in.m_79.z;
    float _838 = fma(_488, _816, _488);
    float _840 = fma(_560, _768, _824);
    float _842 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _830);
    float _844 = fma(_564, _768, _826);
    float _846 = _802 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = fma(_638, _762, _840);
    float _852 = fma(_838, _712, _842);
    float _854 = fma(_640, _762, _844);
    float _856 = fma(_568, _768, _828);
    float _858 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].x, _850);
    float _860 = _852 * 0.15915493667125701904296875;
    float _862 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].y, _854);
    float _864 = _802 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = fma(_648, _762, _856);
    float _870 = in.m_71.w;
    float _872 = _858 * _818;
    float _874 = _862 * _820;
    float _876 = _792 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].z, _868);
    float _882 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _888 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _890 = _806 * _848;
    float _892 = _884 * _882;
    float _894 = _860 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _886 * _888;
    float _900 = _806 * _866;
    float _902 = _880 * _822;
    float _904 = in.m_69.w;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
    float _908 = _902 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _910 = _860 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _878 * _848;
    float _916 = _878 * _866;
    float _918 = _906 * _908;
    float _920 = _614 + _870;
    float _922 = in.m_81.y;
    float _924 = _806 * _896;
    float _926 = _866 * _896;
    float _928 = _878 * _896;
    float _930 = _848 * _896;
    float _932 = _924 * _898;
    float _934 = fma(_912, _900, _914);
    float _936 = -_898;
    float _938 = _912 * _936;
    float _940 = -_916;
    float _942 = fma(_912, _890, _940);
    float _944 = -_890;
    float _946 = fma(_912, _916, _944);
    float _948 = fma(_934, _892, _932);
    float _950 = _928 * _898;
    float _952 = fma(_926, _892, _938);
    float _954 = fma(_912, _914, _900);
    float _956 = fma(_942, _918, _948);
    float _958 = fma(_946, _892, _950);
    float _960 = fma(_930, _918, _952);
    float _962 = _606 + _904;
    float _964 = _956 * _328;
    float _966 = _956 * _332;
    float _968 = fma(_954, _918, _958);
    float _970 = _390 + _922;
    float _972 = fma(_960, _306, _964);
    float _974 = fma(_960, _310, _966);
    float _976 = fma(_968, _340, _972);
    float _978 = fma(_968, _344, _974);
    float _980 = _962 + _976;
    float _982 = _920 + _978;
    float _984 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _986 = _980 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _990 = _982 + _988;
    float _992 = _986 * _986;
    float _994 = _990 * _990;
    float _996 = _992 + _994;
    float _998 = sqrt(_996);
    bool _1000 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1004 = _998 + _1002;
    float _1006 = _956 * _320;
    float _1008 = fma(_960, _302, _1006);
    float _1010 = fma(_968, _336, _1008);
    float _1012 = _828;
    float _1014 = _1006;
    float _1016 = _980;
    float _1018 = _982;
    float _1020 = _992;
    float _1022 = _994;
    float _1024 = _934;
    float _1026 = _928;
    if (_1000)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1028;
    }
    float _1030 = _1012;
    float _1032 = _970 + _1010;
    float _1034 = _1032;
    if (_1000)
    {
        float _1036 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _1036;
    }
    float _1038 = _598;
    float _1040 = _1038;
    if (_1000)
    {
        float _1042 = rsqrt(_996);
        _1014 = _1042;
    }
    float _1044 = _1014;
    float _1046 = _1030;
    if (_1000)
    {
        float _1048 = _1004 * _1030;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = _1050;
    if (_1000)
    {
        float _1054 = _1050 * 0.15915493667125701904296875;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _978;
    if (_1000)
    {
        float _1060 = _1056 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1058 = _1062;
    }
    float _1064 = _1058;
    if (_1000)
    {
        float _1066 = fma(_1064, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1066;
    }
    float _1068 = _1040;
    float _1070 = _1068;
    if (_1000)
    {
        float _1072 = _1044 * _1068;
        _1070 = _1072;
    }
    float _1074 = _1070;
    if (_1000)
    {
        float _1076 = fma(_986, _1074, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1016 = _1076;
    }
    float _1078 = _1016;
    if (_1000)
    {
        float _1080 = fma(_990, _1074, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1018 = _1080;
    }
    float _1082 = _1018;
    float _1084 = fma(_1078, 6.2500002968590706586837768554688e-05, 0.5);
    float _1086 = fma(_1082, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4292 = float2(_1084, _1086);
    float3 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4292, float2(0.0), isnan(_4292)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4292, float2(0.0), isnan(_4292)), level(0.0)).xyz;
    float _1092 = _1090.x;
    float _1094 = _1090.y;
    float _1096 = _1090.z;
    float _1098 = in.m_83.y;
    bool _1100 = _834 != 0.0;
    bool _1102 = isnan(_834);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1056;
    if (_1000)
    {
        float _1112 = _1056 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        _1110 = _1114;
    }
    float _1116 = _1110;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_73.w;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    bool _1128 = _832 == 0.0;
    bool _1130 = !_1108;
    bool _1132 = _1128 && _1130;
    float _1134 = in.m_85.x;
    float _1136 = in.m_85.y;
    float _1138 = in.m_85.z;
    bool _1140 = _836 == 0.0;
    bool _1142 = _1140 && _1132;
    float _1144 = in.m_83.x;
    float _1146 = _1004;
    float _1148 = 1.0;
    float _1150 = 1.0;
    if (_1120)
    {
        float _1152 = in.m_73.z;
        _1146 = _1152;
    }
    float _1154 = _1146;
    out.m_87.x = 1.0;
    out.m_87.y = 1.0;
    out.m_87.z = 1.0;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1160 = -_1098;
    float _1162 = _1160 + 1.0;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1170 = _1122 > 0.5;
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1098;
    if (_1126)
    {
        float _1178 = _1170 ? _1162 : _1098;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = 0.0;
    if (_1142)
    {
        _1182 = _1136;
    }
    float _1184 = _1182;
    float _1186 = _1184;
    if (!_1142)
    {
        float _1188 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1136);
        _1186 = _1188;
    }
    float _1190 = _1186;
    if (_1142)
    {
        _1148 = _1138;
    }
    float _1192 = _1148;
    float _1194 = _1192;
    if (!_1142)
    {
        float _1196 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1138);
        _1194 = _1196;
    }
    float _1198 = _1194;
    float _1200 = 0.0;
    if (_1120)
    {
        _1200 = _1144;
    }
    float _1202 = _1200;
    out.m_89.x = _1168;
    out.m_89.y = _1172;
    out.m_89.z = _1174;
    out.m_89.w = _1166;
    bool _1204 = _1154 > 0.5;
    bool _1206 = _1204 && _1120;
    float _1208 = _1202;
    if (!_1120)
    {
        _1150 = _1144;
    }
    float _1210 = _1150;
    float _1212 = in.m_91.x;
    float _1214 = in.m_91.y;
    float _1216 = in.m_91.z;
    float _1218 = in.m_91.w;
    float _1220 = 0.0;
    float _1222 = _1210;
    if (_1142)
    {
        _1220 = _1134;
    }
    float _1224 = _1220;
    float _1226 = _1224;
    if (!_1142)
    {
        float _1228 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1134);
        _1226 = _1228;
    }
    float _1230 = _1226;
    float _1232 = _928 * _1190;
    float _1234 = _1230;
    if (_1206)
    {
        float _1236 = -_1202;
        float _1238 = _1236 + 1.0;
        _1208 = _1238;
    }
    float _1240 = _1208;
    float _1242 = fma(_946, _1230, _1232);
    if (_1120)
    {
        _1222 = _1240;
    }
    float _1244 = _1222;
    float _1246 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1248 = _1216 * _1134;
    float _1250 = _1214 * _1138;
    float _1252 = _1212 * _1136;
    float _1254 = -_1248;
    float _1256 = fma(_1212, _1138, _1254);
    float _1258 = -_1250;
    float _1260 = fma(_1216, _1136, _1258);
    float _1262 = -_1252;
    float _1264 = fma(_1214, _1134, _1262);
    float _1266 = -_1214;
    float _1268 = _912 * _1266;
    float _1270 = _1256 * _1218;
    float _1272 = _1260 * _1218;
    float _1274 = -_1190;
    float _1276 = _912 * _1274;
    float _1278 = _1264 * _1218;
    float _1280 = -_1270;
    float _1282 = _912 * _1280;
    float _1284 = fma(_926, _1212, _1268);
    float _1286 = _924 * _1190;
    float _1288 = _924 * _1214;
    float _1290 = _928 * _1214;
    float _1292 = _924 * _1270;
    float _1294 = fma(_926, _1230, _1276);
    float _1296 = _928 * _1270;
    float _1298 = fma(_926, _1272, _1282);
    float _1300 = fma(_934, _1230, _1286);
    float _1302 = fma(_934, _1212, _1288);
    float _1304 = fma(_946, _1212, _1290);
    float _1306 = fma(_934, _1272, _1292);
    float _1308 = fma(_946, _1272, _1296);
    float _1310 = fma(_942, _1198, _1300);
    float _1312 = fma(_930, _1198, _1294);
    float _1314 = fma(_930, _1216, _1284);
    float _1316 = fma(_942, _1216, _1302);
    float _1318 = fma(_954, _1216, _1304);
    float _1320 = fma(_930, _1278, _1298);
    float _1322 = fma(_942, _1278, _1306);
    float _1324 = fma(_954, _1278, _1308);
    float _1326 = _1310 * _328;
    float _1328 = fma(_954, _1198, _1242);
    float _1330 = _1310 * _320;
    float _1332 = _1310 * _332;
    float _1334 = _1316 * _328;
    float _1336 = fma(_1312, _306, _1326);
    float _1338 = _1326;
    float _1340 = _1334;
    float _1342 = _1322;
    float _1344 = _1320;
    if (_1000)
    {
        float _1346 = _1116 + (-1.0);
        _1338 = _1346;
    }
    float _1348 = _1338;
    float _1350 = fma(_1312, _302, _1330);
    float _1352 = fma(_1312, _310, _1332);
    float _1354 = fma(_1314, _306, _1334);
    if (_1000)
    {
        float _1356 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1356;
    }
    float _1358 = _1340;
    float _1360 = _1316 * _320;
    float _1362 = _1316 * _332;
    float _1364 = _1322 * _328;
    float _1366 = _1322 * _320;
    float _1368 = _1322 * _332;
    float _1370 = _1362;
    if (_1000)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1374 = _1078 + _1372;
        _1342 = _1374;
    }
    float _1376 = _1342;
    if (_1000)
    {
        float _1378 = fma(_1032, _1116, _1358);
        _1034 = _1378;
    }
    float _1380 = _1034;
    float _1382 = fma(_1314, _310, _1362);
    if (_1000)
    {
        float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1386 = _1082 + _1384;
        _1370 = _1386;
    }
    float _1388 = _1370;
    if (_1000)
    {
        float _1390 = _1376 * _1376;
        _1020 = _1390;
    }
    float _1392 = _1020;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1396 = _1380 + _1394;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1000)
    {
        float _1400 = _1388 * _1388;
        _1022 = _1400;
    }
    float _1402 = _1022;
    float _1404 = fma(_1314, _302, _1360);
    float _1406 = fma(_1396, _1396, _1392);
    float _1408 = fma(_1320, _306, _1364);
    float _1410 = fma(_1320, _302, _1366);
    float _1412 = fma(_1318, _340, _1354);
    float _1414 = _1406 + _1402;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1418 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1420 = fma(_1320, _310, _1368);
    float _1422 = fma(_1318, _336, _1404);
    float _1424 = fma(_1318, _344, _1382);
    float _1426 = fma(_1328, _340, _1336);
    float _1428 = fma(_1324, _340, _1408);
    float _1430 = fma(_1324, _336, _1410);
    float _1432 = sqrt(_1414);
    float _1434 = fma(_1328, _336, _1350);
    float _1436 = _1246 * _1398;
    float _1438 = fma(_1324, _344, _1420);
    float _1440 = fma(_1328, _344, _1352);
    out.m_93.x = _1412;
    out.m_93.y = _1422;
    out.m_93.z = _1424;
    float _1442 = _1418 * _1416;
    out.m_95.x = _1428;
    out.m_95.y = _1430;
    out.m_95.z = _1438;
    out.m_97.z = _1436;
    out.m_97.w = _1442;
    bool _1444 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1446 = isnan(_1432);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1452 = _1448 || _1450;
    out.m_99.x = _1426;
    out.m_99.y = _1434;
    out.m_99.z = _1440;
    if (!_1452)
    {
        _348 = 1.0;
    }
    float _1454 = _348;
    out.m_101.x = _1092;
    out.m_101.y = _1094;
    out.m_101.z = _1096;
    bool _1456 = !_1452;
    float _1458 = _1454;
    if (!_1456)
    {
        bool _1460 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1462 = isnan(_1432);
        bool _1464 = _1460 || _1462;
        bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1468 = _1464 || _1466;
        if (!_1468)
        {
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = _1432 + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1476 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1474;
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1482 = 1.0 / _1476;
            float _1484 = _1472 * _1482;
            float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1458 = _1486;
            _1488 = true;
        }
        else
        {
            bool _1490 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1492 = isnan(_1432);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1432 + _1500;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1510 = _1508 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1512 = 1.0 / _1506;
                float _1514 = _1502 * _1512;
                float _1516 = fma(_1514, _1510, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1458 = _1516;
                _1488 = true;
            }
            else
            {
                _1458 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1488 = false;
    float _1518 = _1458;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1522 = _1380 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1526 = _1078 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1530 = _1082 + _1528;
    float _1532 = _970 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1534 = fma(_1522, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1536 = fma(_1526, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1538 = fma(_1530, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1540 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1532);
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1534 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1536 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1540);
    float _1562 = _970 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1564 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1566 = rsqrt(_1558);
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1570 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1562);
    float _1572 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1570);
    float _1574 = 1.0 / _1568;
    float _1576 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1578 = _1576 + _1568;
    float _1580 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = sqrt(_1558);
    float _1584 = _1548 * _1580;
    float _1586 = _1552 * _1580;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 * _1586;
    float _1592 = _1578 * _1574;
    float _1594 = _1592 * 0.5;
    float _1596 = _1588 + _1590;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1600 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1598);
    float _1602 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1604 = sqrt(_1596);
    float _1606 = _970 + _1602;
    float _1608 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1610 = 1.0 / _1600;
    float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1614 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1608);
    float _1616 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1612);
    float _1618 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1614);
    bool _1620 = _1604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1616);
    float _1624 = floor(_1564);
    float _1626 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1628 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1632 = _1610 * _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1604 + _1634;
    float _1638 = trunc(_1626);
    int _1640 = int(_1638);
    float _1642 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1644 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1646 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1648 = precise::max(0.0, _1642);
    float _1650 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _1652 = 2;
    float _1654 = _1580;
    float _1656 = _1636;
    float _1658 = _1596;
    float _1660 = _1584;
    float _1662 = _1588;
    int _1664 = as_type<int>(_1590);
    if (_1620)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1666;
    }
    float _1668 = _1650;
    float _1670 = -_1624;
    float _1672 = _1564 + _1670;
    float _1674 = -_1580;
    float _1676 = -_1648;
    float _1678 = fma(_1544, _1674, _1676);
    float _1680 = trunc(_1628);
    int _1682 = int(_1680);
    float _1684 = _1678;
    if (!_1644)
    {
        _1652 = 1;
    }
    int _1686 = _1652;
    int _1688 = _1686;
    if (_1620)
    {
        float _1690 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1690;
    }
    float _1692 = _1654;
    int _1694 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1696 = _1640 + _1694;
    int _1698 = _1696 + 1;
    if (_1620)
    {
        float _1700 = _1636 * _1668;
        _1656 = _1700;
    }
    float _1702 = _1656;
    if (_1620)
    {
        float _1704 = rsqrt(_1596);
        _1658 = _1704;
    }
    float _1706 = _1658;
    float _1708 = _1706;
    if (_1620)
    {
        float _1710 = _1702 * 0.15915493667125701904296875;
        _1344 = _1710;
    }
    float _1712 = _1344;
    bool _1714 = !_1644;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1720 = _1682 + _1718;
    int _1722 = _1720 + 1;
    float _1724 = _1622;
    if (_1620)
    {
        float _1726 = _1712 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        _1724 = _1728;
    }
    float _1730 = _1724;
    if (!_1646)
    {
        _1688 = _1716;
    }
    int _1732 = _1688;
    bool _1734 = _1698 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1736 = _1732 << 6;
    int _1738 = _1698 | _1722;
    float _1740 = _1712;
    float _1742 = as_type<float>(_1738);
    if (_1620)
    {
        float _1744 = _1712 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        _1740 = _1746;
    }
    float _1748 = _1740;
    int _1750 = _1736 + 96;
    uint _1753 = uint(int(uint(_1750) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    bool _1769 = _1738 < 0;
    bool _1771 = _1769 || _1734;
    float _1773 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1620)
    {
        float _1775 = fma(_1730, _1692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1742 = _1775;
    }
    float _1777 = _1742;
    int _1779 = _1736 + 48;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    float _1797 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1799 = _1722 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1801 = _1799 || _1771;
    if (_1620)
    {
        float _1803 = _1706 * _1777;
        _1024 = _1803;
    }
    float _1805 = _1024;
    float _1807 = floor(_1773);
    float _1809 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1797);
    float _1811 = _1748;
    if (_1620)
    {
        float _1813 = _1748 + (-1.0);
        _1708 = _1813;
    }
    float _1815 = _1708;
    int _1817 = _1736 + 104;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    float _1835 = _1815;
    if (_1620)
    {
        float _1837 = _1584 * _1805;
        _1660 = _1837;
    }
    float _1839 = _1660;
    float _1841 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1809);
    if (_1620)
    {
        float _1843 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1234 = _1843;
    }
    float _1845 = _1234;
    if (!_1620)
    {
        _1835 = _1586;
    }
    float _1847 = _1835;
    float _1849 = _1847;
    if (_1620)
    {
        float _1851 = _1586 * _1805;
        _1849 = _1851;
    }
    float _1853 = _1849;
    if (_1620)
    {
        float _1855 = _1839 * _1839;
        _1662 = _1855;
    }
    float _1857 = _1662;
    if (_1620)
    {
        float _1859 = fma(_1678, _1748, _1845);
        _1684 = _1859;
    }
    float _1861 = _1684;
    int _1863 = _1736 + 64;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    uint _1867 = uint(int(uint(int(_1865)) >> uint(2)));
    int _1869 = int(_1865) & 3;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[int(_1867)][_1869];
    int _1873 = int(_1865) + 1;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    int _1877 = _1873 & 3;
    float _1879 = (*spvDescriptorSet0.vp_c15)._m0[int(_1875)][_1877];
    if (!_1620)
    {
        _1811 = _1590;
    }
    float _1881 = _1811;
    float _1883 = _1881;
    if (_1620)
    {
        float _1885 = _1853 * _1853;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = fma(_1861, _1861, _1857);
    if (!_1801)
    {
        float _1891 = floor(_1628);
        _1026 = _1891;
    }
    float _1893 = _1026;
    if (!_1801)
    {
        int _1895 = _1722 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1897 = _1895 + _1698;
        _1664 = _1897;
    }
    int _1899 = _1664;
    float _1901 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1903 = _1889 + _1887;
    int _1905 = _1736 + 56;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    uint _1909 = uint(int(uint(int(_1907)) >> uint(2)));
    int _1911 = int(_1907) & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    int _1915 = int(_1907) + 1;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    int _1919 = _1915 & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    float _1923 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1925 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1927 = -_1807;
    float _1929 = _1773 + _1927;
    float _1931 = -_1925;
    float _1933 = fma(_1931, _1923, 1.0);
    int _1935 = _1736 + 80;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    float _1953 = log2(_1933);
    int _1955 = _1736 + 88;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    uint _1959 = uint(int(uint(int(_1957)) >> uint(2)));
    int _1961 = int(_1957) & 3;
    float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
    int _1965 = int(_1957) + 1;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    int _1969 = _1965 & 3;
    float _1971 = (*spvDescriptorSet0.vp_c15)._m0[int(_1967)][_1969];
    float _1973 = _1606 * _1767;
    float _1975 = fma(_962, _1759, _1973);
    int _1977 = _1736 + 72;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    float _1995 = _1606 * _1795;
    float _1997 = rsqrt(_1903);
    float _1999 = _1953 * 0.693147182464599609375;
    float _2001 = fma(_962, _1787, _1995);
    int _2003 = as_type<int>(_1995);
    int _2005 = as_type<int>(_1759);
    if (!_1801)
    {
        int _2007 = _1899 << 2;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = fma(_920, _1825, _1975);
    int _2013 = _2009;
    float _2015 = _1879;
    if (!_1801)
    {
        int _2017 = 12 & _2009;
        _2013 = _2017;
    }
    int _2019 = _2013;
    float _2021 = _2011 + _1833;
    float _2023 = _1606 * _1879;
    if (!_1801)
    {
        float _2025 = -_1893;
        float _2027 = _1628 + _2025;
        _2015 = _2027;
    }
    float _2029 = _2015;
    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2033 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2031);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _1997 * _1839;
    float _2039 = fma(_962, _1871, _2023);
    float _2041 = _1997 * _1861;
    float _2043 = _1997 * _1853;
    float _2045 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2047 = fma(_920, _1913, _2001);
    float2 _5927 = float2(_1672, _1929);
    float _2049 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5927, float2(0.0), isnan(_5927)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5927, float2(0.0), isnan(_5927)), level(0.0)).x;
    float _2051 = 1.0 / _2021;
    float _2053 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2055 = _2047 + _1921;
    float _2057 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = _1606 * _1951;
    int _2061 = as_type<int>(_1951);
    if (!_1801)
    {
        uint _2063 = uint(int(uint(_1899) >> uint(2)));
        _2061 = int(_2063);
    }
    int _2065 = _2061;
    float _2067 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2057);
    float _2069 = fma(_962, _1943, _2059);
    float _2071 = -_2035;
    float _2073 = _2071 + 1.0;
    if (!_1801)
    {
        int _2075 = _2065 << 4;
        int _2077 = _2075 + _2019;
        _2005 = _2077;
    }
    int _2079 = _2005;
    float _2081 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2083 = fma(_920, _1963, _2069);
    float _2085 = -_2045;
    float _2087 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2085);
    float _2089 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = abs(_2073);
    float _2093 = log2(_2091);
    float _2095 = _2055 * _2051;
    float _2097 = -_2043;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2087);
    float _2101 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2103 = _2035;
    float _2105 = as_type<float>(_2079);
    if (!_1801)
    {
        int _2107 = _2079 + 400;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
        _2103 = _2115;
    }
    float _2117 = _2103;
    float _2119 = fma(_920, _1985, _2039);
    bool _2121 = _2095 >= 0.0;
    float _2123 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2101);
    float _2125 = fma(_2099, -0.5, 0.5);
    float _2127 = _2119 + _1993;
    float _2129 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2131 = _2095 <= 1.0;
    bool _2133 = _2131 && _2121;
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2137 = _2127 * _2051;
    float _2139 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2129);
    float _2141 = fma(_2099, 0.5, 0.5);
    float _2143 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2145 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    bool _2149 = _2137 >= 0.0;
    bool _2151 = _2149 && _2133;
    float _2153 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = exp2(_2143);
    float _2157 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2159 = _2137 <= 1.0;
    bool _2161 = _2159 && _2151;
    float _2163 = _2083 + _1971;
    float _2165 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2169 = _2041 + 1.0;
    float _2171 = sqrt(_2125);
    float _2173 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2175 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2165);
    float _2177 = fma(_2141, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2179 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2181 = as_type<float>(_2019);
    float _2183 = _2169;
    if (!_1801)
    {
        float _2185 = floor(_1626);
        _2181 = _2185;
    }
    float _2187 = _2181;
    if (_2161)
    {
        float _2189 = float(_1732);
        _2105 = _2189;
    }
    float _2191 = _2105;
    float _2193 = fma(_2141, _2177, -0.212114393711090087890625);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = -_2041;
    float _2199 = fma(_2155, _2169, _2197);
    float _2201 = fma(_2141, _2193, 1.570728778839111328125);
    float _2203 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2205 = 1.0 / _2179;
    float _2207 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2175);
    float _2209 = _2171 * 0.636619746685028076171875;
    float _2211 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2203);
    float _2213 = _2163 * _2051;
    float _2215 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float _2217 = -_2201;
    float _2219 = fma(_2209, _2217, 1.0);
    float _2221 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2211);
    float _2223 = _2191;
    float _2225 = _2213;
    if (_2161)
    {
        float _2227 = rint(_2191);
        float _2229 = precise::max(_2227, 0.0);
        uint _2231 = uint(_2229);
        uint _2233 = clamp(_2231, 0u, 65535u);
        _2223 = as_type<float>(_2233);
    }
    float _2235 = _2223;
    if (!_1801)
    {
        float _2237 = -_2187;
        float _2239 = _1626 + _2237;
        _2183 = _2239;
    }
    float _2241 = _2183;
    float _2243 = fma(_2199, 0.5, 0.5);
    float _2245 = _2215 * _2205;
    float _2247 = _2221 * _2205;
    float _2249 = _2051;
    if (!_1801)
    {
        float _2251 = rint(_2117);
        float _2253 = precise::max(_2251, 0.0);
        uint _2255 = uint(_2253);
        uint _2257 = clamp(_2255, 0u, 65535u);
        _2249 = as_type<float>(_2257);
    }
    float _2259 = _2249;
    float _2261 = fma(_2245, 0.5, 0.5);
    float _2263 = fma(_2247, -0.5, 0.5);
    float _2265 = _2235;
    if (_2161)
    {
        float3 _6298 = float3(_2095, _2137, float(as_type<int>(_2235)));
        float3 _6302 = select(_6298, float3(0.0), isnan(_6298));
        float _2267 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6302.xy, uint(rint(_6302.z)), _2213, level(0.0));
        _2265 = _2267;
    }
    float _2269 = _2265;
    float3 _6312 = float3(_2261, _2263, _2053);
    float _2271 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6312, float3(0.0), isnan(_6312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6312, float3(0.0), isnan(_6312)), level(0.0)).x;
    float3 _6321 = float3(_2261, _2263, _2053);
    float4 _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6321, float3(0.0), isnan(_6321)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6321, float3(0.0), isnan(_6321)), level(0.0)).xyzw;
    float _2276 = _2274.x;
    float _2278 = _2274.y;
    float _2280 = _2274.z;
    float _2282 = _2274.w;
    float2 _6337 = float2(_2219, _2243);
    float3 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).xyz;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2259;
    if (!_1801)
    {
        float3 _6358 = float3(_2241, _2029, float(as_type<int>(_2259)));
        float3 _6360 = select(_6358, float3(0.0), isnan(_6358));
        float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6360.xy, uint(rint(_6360.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6360.xy, uint(rint(_6360.z)), level(0.0)).x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = abs(_1632);
    float _2300 = log2(_2298);
    float _2302 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2304 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2302);
    float _2306 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    bool _2308 = _1632 <= 8000.0;
    bool _2310 = isnan(_1632);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(8000.0);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2322 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2324 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2215;
    out.gl_Position.y = _2221;
    out.gl_Position.z = _2320;
    out.gl_Position.w = _2179;
    float _2326 = exp2(_2322);
    float _2328 = exp2(_2324);
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = fma(_2332, -2.0, 3.0);
    float _2336 = _2332 * _2332;
    float _2338 = _2336 * _2334;
    float _2340 = _2320 + _2179;
    float _2342 = _2340 * 0.5;
    float _2344 = -_2338;
    float _2346 = _2344 + 1.0;
    out.m_103.z = _2342;
    out.m_103.w = _2179;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2338);
    float _2350 = -_2326;
    float _2352 = _2350 + 1.0;
    float _2354 = _2318 * _2348;
    float _2356 = _2348;
    float _2358 = _2320;
    float _2360 = _2215;
    if (!_2161)
    {
        _2356 = 1.0;
    }
    float _2362 = _2356;
    float _2364 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2366 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2368 = -_2049;
    float _2370 = _2368 + 1.0;
    float _2372 = _2370 * _2366;
    float _2374 = precise::clamp(_2372, 0.0, 1.0);
    float _2376 = _2366;
    float _2378 = _2362;
    if (_1801)
    {
        _2376 = 1.0;
    }
    float _2380 = _2376;
    float _2382 = _2380;
    if (_2161)
    {
        bool _2384 = _2269 >= _2213;
        bool _2386 = isnan(_2269);
        bool _2388 = _2384 || _2386;
        bool _2390 = isnan(_2213);
        bool _2392 = _2388 || _2390;
        float _2394 = float(_2392);
        _2378 = _2394;
    }
    float _2396 = _2378;
    if (!_1801)
    {
        int _2398 = _1899 << 4;
        int _2400 = _2398 + 2048;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
        int _2406 = int(_2402) & 3;
        float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
        int _2410 = int(_2402) + 1;
        uint _2412 = uint(int(uint(_2410) >> uint(2)));
        int _2414 = _2410 & 3;
        float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
        int _2418 = _2400 + 8;
        uint _2420 = uint(int(uint(_2418) >> uint(2)));
        uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
        int _2424 = int(_2420) & 3;
        float _2426 = (*spvDescriptorSet0.vp_c15)._m0[int(_2422)][_2424];
        int _2428 = int(_2420) + 1;
        uint _2430 = uint(int(uint(_2428) >> uint(2)));
        int _2432 = _2428 & 3;
        float _2434 = (*spvDescriptorSet0.vp_c15)._m0[int(_2430)][_2432];
        float _2436 = _1606 * _2416;
        float _2438 = fma(_962, _2408, _2436);
        float _2440 = fma(_920, _2426, _2438);
        float _2442 = _2440 + _2434;
        float _2444 = precise::clamp(_2442, 0.0, 1.0);
        float _2446 = -_2444;
        float _2448 = _2446 + _2296;
        float _2450 = fma(_2448, 500.0, 1.5);
        float _2452 = exp2(_2450);
        float _2454 = 0.0 + _2452;
        float _2456 = precise::clamp(_2454, 0.0, 1.0);
        _2382 = _2456;
        _2358 = _2426;
        _2225 = _2452;
        _2360 = 500.0;
    }
    float _2458 = _2382;
    float _2460 = _2358;
    float _2462 = _2225;
    float _2464 = _2360;
    float _2466 = _2396 * _2458;
    float _2468 = -_2374;
    float _2470 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2472 = _2364 * _2271;
    out.m_105.x = _1536;
    out.m_105.y = _1534;
    out.m_105.z = _1538;
    bool _2474 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2476 = isnan(_1582);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2482 = _2478 || _2480;
    float _2484 = -_2466;
    float _2486 = fma(_2484, _2470, 1.0);
    float _2488 = precise::clamp(_2486, 0.0, 1.0);
    float _2490 = _2282 * _2472;
    float _2492 = -_2364;
    float _2494 = _2492 + 1.0;
    float _2496 = _2290 * _2472;
    float _2498 = _2488 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2500 = fma(_2286, _2490, _2276);
    float _2502 = fma(_2288, _2490, _2278);
    float _2504 = _2282 * _2494;
    float _2506 = fma(_2282, _2496, _2280);
    out.m_107.x = _2498;
    float _2508 = _2462;
    float _2510 = _2460;
    float _2512 = _2464;
    float _2514 = _2494;
    float _2516 = _2490;
    float _2518 = _2488;
    if (!_2482)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2520 = _2508;
    out.m_109.x = _2500;
    out.m_109.y = _2502;
    out.m_109.z = _2506;
    out.m_109.w = _2504;
    float _2522 = _2520;
    float _2524 = _2520;
    if (!_2482)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2526 = _2510;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2482)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2532 = _2512;
    float _2534 = _2532;
    float _2536 = _2532;
    if (!_2482)
    {
        _2514 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2538 = _2514;
    float _2540 = _2538;
    float _2542 = _2538;
    if (!_2482)
    {
        _2516 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2544 = _2516;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2482)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2550 = _2518;
    bool _2552 = !_2482;
    float _2554 = _2550;
    float _2556 = _2550;
    if (!_2552)
    {
        bool _2558 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2560 = isnan(_1582);
        bool _2562 = _2558 || _2560;
        bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2566 = _2562 || _2564;
        if (!_2566)
        {
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2570 = _1582 + _2568;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2574 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2572;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2580 = 1.0 / _2574;
            float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2598 = _2570 * _2580;
            float _2600 = precise::clamp(_2598, 0.0, 1.0);
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2606 = fma(_2600, _2578, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2608 = fma(_2600, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2610 = fma(_2600, _2584, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2612 = fma(_2600, _2588, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2614 = fma(_2600, _2592, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2616 = fma(_2600, _2596, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2530 = _2606;
            _2548 = _2614;
            _2524 = _2610;
            _2542 = _2612;
            _2536 = _2608;
            _2556 = _2616;
            _2618 = true;
        }
        else
        {
            bool _2620 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2622 = isnan(_1582);
            bool _2624 = _2620 || _2622;
            bool _2626 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2628 = _2624 || _2626;
            if (!_2628)
            {
                _2522 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2630 = _2522;
            _2524 = _2630;
            if (!_2628)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2632 = _2528;
            _2530 = _2632;
            if (!_2628)
            {
                _2534 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2634 = _2534;
            _2536 = _2634;
            if (!_2628)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2636 = _2540;
            _2542 = _2636;
            if (!_2628)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2638 = _2546;
            _2548 = _2638;
            if (!_2628)
            {
                _2554 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2640 = _2554;
            bool _2642 = !_2628;
            _2556 = _2640;
            if (!_2642)
            {
                bool _2644 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2646 = isnan(_1582);
                bool _2648 = _2644 || _2646;
                bool _2650 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2652 = _2648 || _2650;
                if (!_2652)
                {
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2656 = _1582 + _2654;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2660 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2658;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2666 = 1.0 / _2660;
                    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2684 = _2656 * _2666;
                    float _2686 = precise::clamp(_2684, 0.0, 1.0);
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2692 = fma(_2686, _2664, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2694 = fma(_2686, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2696 = fma(_2686, _2670, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2698 = fma(_2686, _2674, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2700 = fma(_2686, _2678, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2702 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2530 = _2692;
                    _2548 = _2700;
                    _2524 = _2696;
                    _2542 = _2698;
                    _2536 = _2694;
                    _2556 = _2702;
                    _2618 = true;
                }
                else
                {
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2524 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2536 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2556 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2618 = false;
    float _2704 = _2530;
    float _2706 = _2548;
    float _2708 = _2524;
    float _2710 = _2542;
    float _2712 = _2536;
    float _2714 = _2556;
    float _2716 = fma(_1434, -0.5, 0.5);
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    float _2720 = -_2704;
    float _2722 = _2720 + _2706;
    float _2724 = -_2708;
    float _2726 = _2724 + _2710;
    float _2728 = -_2712;
    float _2730 = _2728 + _2714;
    bool _2732 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2734 = fma(_2718, _2722, _2704);
    float _2736 = fma(_2718, _2726, _2708);
    float _2738 = fma(_2718, _2730, _2712);
    float _2740 = _2734 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2742 = fma(_2736, 0.298911988735198974609375, _2740);
    float _2744 = fma(_2738, 0.114477999508380889892578125, _2742);
    out.m_111.x = 0.0;
    float _2746 = -_2744;
    float _2748 = _2736 + _2746;
    float _2750 = -_2744;
    float _2752 = _2734 + _2750;
    float _2754 = -_2744;
    float _2756 = _2738 + _2754;
    float _2758 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2760 = fma(_2748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    float _2762 = fma(_2752, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    float _2764 = fma(_2756, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    out.m_107.w = _2758;
    out.m_113.x = _2760;
    out.m_113.y = _2762;
    out.m_113.z = _2764;
    if (!_2732)
    {
        return out;
    }
    float _2766 = -_1534;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2770 = -_1536;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2774 = -_1538;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2778 = _2768 * _2768;
    float _2780 = fma(_2772, _2772, _2778);
    float _2782 = fma(_2776, _2776, _2780);
    float _2784 = sqrt(_2782);
    float _2786 = rsqrt(_2782);
    float _2788 = -_2784;
    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2792 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = _2772 * _2786;
    float _2798 = _2768 * _2786;
    float _2800 = abs(_2794);
    float _2802 = log2(_2800);
    float _2804 = _2776 * _2786;
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2808 = _1434 * _2798;
    float _2810 = -_2798;
    float _2812 = -_2806;
    float _2814 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2812);
    float _2816 = fma(_1426, _2796, _2808);
    float _2818 = -_2804;
    float _2820 = fma(_2818, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2814);
    float _2822 = fma(_1440, _2804, _2816);
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2828 = _2820 + _2826;
    float _2830 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2832 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = exp2(_2830);
    float _2838 = _2836 * _2834;
    float _2840 = _2824 * _2838;
    float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2844 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2846 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2842;
    out.m_111.y = _2844;
    out.m_111.z = _2846;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2618 = false;
    bool _1488 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2903 = as_type<float>(_148);
        out.gl_Position.z = _2903;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_63.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2973 = as_type<float>(_186);
        out.gl_Position.z = _2973;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = in.m_71.x;
    float _202 = in.m_71.y;
    float _204 = in.m_71.z;
    float _206 = _188 * _188;
    float _208 = _190 * _190;
    float _210 = _192 * _192;
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_202, _202, _214);
    float _222 = fma(_204, _204, _216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    float _228 = sqrt(_222);
    bool _230 = _224 > 0.0;
    bool _232 = _226 > 0.0;
    float _234 = _226;
    float _236 = _218;
    float _238 = _222;
    if (_230)
    {
        float _240 = rsqrt(_218);
        _234 = _240;
    }
    float _242 = _234;
    float _244 = 0.0;
    float _246 = 0.0;
    if (!_230)
    {
        _244 = 0.0;
        _246 = 0.0;
    }
    float _248 = _244;
    float _250 = _246;
    bool _252 = _228 > 0.0;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _248;
    if (!_230)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = _260;
    if (!_232)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _268 = _262;
    float _270 = _264;
    float _272 = _228;
    float _274 = _270;
    float _276 = _268;
    if (_232)
    {
        float _278 = rsqrt(_220);
        _272 = _278;
    }
    float _280 = _272;
    float _282 = 0.0;
    if (!_232)
    {
        _282 = 0.0;
    }
    float _284 = _282;
    float _286 = 0.0;
    float _288 = _284;
    if (!_252)
    {
        _286 = 0.0;
    }
    float _290 = _286;
    float _292 = _224;
    float _294 = _290;
    if (_252)
    {
        float _296 = rsqrt(_222);
        _292 = _296;
    }
    float _298 = _292;
    if (_230)
    {
        float _300 = _242 * _188;
        _256 = _300;
    }
    float _302 = _256;
    if (_230)
    {
        float _304 = _242 * _194;
        _258 = _304;
    }
    float _306 = _258;
    if (_230)
    {
        float _308 = _242 * _200;
        _266 = _308;
    }
    float _310 = _266;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_252)
    {
        _236 = 0.0;
    }
    float _314 = _236;
    float _316 = _314;
    if (_232)
    {
        float _318 = _280 * _190;
        _274 = _318;
    }
    float _320 = _274;
    if (!_252)
    {
        _238 = 0.0;
    }
    float _322 = _238;
    float _324 = _322;
    if (_232)
    {
        float _326 = _280 * _196;
        _276 = _326;
    }
    float _328 = _276;
    if (_232)
    {
        float _330 = _280 * _202;
        _288 = _330;
    }
    float _332 = _288;
    if (_252)
    {
        float _334 = _298 * _192;
        _324 = _334;
    }
    float _336 = _324;
    if (_252)
    {
        float _338 = _298 * _198;
        _294 = _338;
    }
    float _340 = _294;
    if (_252)
    {
        float _342 = _298 * _204;
        _316 = _342;
    }
    float _344 = _316;
    bool _346 = !_312;
    float _348 = _344;
    float _366;
    if (!_346)
    {
        float _350 = in.m_73.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_132);
        float _372 = 1.0 / _370;
        float _374 = _166 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_73.x;
    float _380 = in.m_73.y;
    float _382 = in.m_73.z;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = _376 + _384;
    float _388 = in.m_60.x;
    float _390 = in.m_60.y;
    float _392 = in.m_60.z;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _416 = _414 != 0;
    float _418 = 1.0 / _396;
    float _420 = 1.0 / _400;
    bool _422 = !_412;
    int _424 = _422 ? 0 : 1;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = _378 * 2.0;
    float _432 = _378 + _382;
    float _434 = 1.0 / _404;
    float _436 = _382 * 2.0;
    float _438 = _196 * _390;
    float _440 = _202 * _390;
    float _442 = _380 + _378;
    float _444 = _380 * 2.0;
    float _446 = fma(_194, _388, _438);
    float _448 = fma(_200, _388, _440);
    float _450 = floor(_436);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _454 = _376 + _452;
    float _456 = _380 + _382;
    float _458 = _382 + (-0.5);
    float _460 = _378 + (-0.5);
    float _462 = _380 + (-0.5);
    float _464 = _454 * _420;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _468 = _376 + _466;
    float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _472 = log2(_470);
    float _474 = _456 + (-1.0);
    float _476 = _386 * _434;
    float _478 = _468 * _418;
    float _480 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _482 = _432 + (-1.0);
    float _484 = _442 + (-1.0);
    float _486 = floor(_430);
    float _488 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _490 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _492 = _450 > 0.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _494;
    bool _498 = _450 >= 0.0;
    bool _500 = isnan(_450);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = floor(_444);
    float _518 = fma(_496, _478, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _520 = fma(_510, _478, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _522 = fma(_514, _478, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = _472 * _166;
    int _526 = _506 ? 0 : 1;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _532 = _486 > 0.0;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _538 = _486 >= 0.0;
    bool _540 = isnan(_486);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = exp2(_524);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _554 = ~_526;
    int _556 = _554 + 1;
    int _558 = _556 + 1;
    float _560 = fma(_530, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _562 = _546 ? 0 : 1;
    float _564 = fma(_536, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _566 = _516 > 0.0;
    float _568 = fma(_552, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _570 = ~_562;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    bool _580 = _516 >= 0.0;
    bool _582 = isnan(_516);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    int _594 = _558;
    int _596 = _574;
    float _598 = _390;
    if (!_492)
    {
        int _600 = ~_526;
        int _602 = _600 + 1;
        _594 = _602;
    }
    int _604 = _594;
    float _606 = fma(_198, _392, _446);
    if (!_532)
    {
        int _608 = ~_562;
        int _610 = _608 + 1;
        _596 = _610;
    }
    int _612 = _596;
    float _614 = fma(_204, _392, _448);
    float _616 = in.m_75.x;
    float _618 = in.m_75.y;
    float _620 = in.m_75.z;
    bool _622 = !_408;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_424);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _630 = 1.0 + _628;
    int _632 = abs(_624);
    float _634 = -_548;
    float _636 = _634 + 1.0;
    float _638 = fma(_428, _476, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _640 = fma(_578, _476, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _642 = float(_632);
    float _644 = 1.0 / _630;
    float _646 = float(_604);
    float _648 = fma(_592, _476, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _650 = float(_612);
    bool _652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _654 = isnan(1.0);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _660 = _656 || _658;
    float _662 = _642 * _646;
    bool _664 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = float(_626);
    float _676 = _662 * (-2.0);
    int _678 = _588 ? 0 : 1;
    float _680 = _672 ? _636 : 0.0;
    float _682 = _674 * _650;
    float _684 = fma(_490, _676, _490);
    int _686 = ~_678;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = fma(_676, _616, _616);
    float _694 = _682 * (-2.0);
    bool _696 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _698 = isnan(_376);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    int _708 = _690;
    if (_660)
    {
        float _710 = _680 * _644;
        _168 = _710;
    }
    float _712 = _168;
    if (!_566)
    {
        int _714 = ~_678;
        int _716 = _714 + 1;
        _708 = _716;
    }
    int _718 = _708;
    float _720 = fma(_694, _618, _618);
    bool _722 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _724 = isnan(_376);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[196].x, _692);
    bool _740 = !_416;
    int _742 = _740 ? 0 : 1;
    float _744 = fma(_480, _694, _480);
    bool _746 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _748 = isnan(_376);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -_732;
    float _760 = _758 + 1.0;
    float _762 = _732 * _736;
    int _764 = abs(_742);
    float _766 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[196].y, _720);
    float _768 = _756 * _760;
    float _770 = -_756;
    float _772 = _770 + 1.0;
    float _774 = fma(_684, _712, _738);
    bool _776 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _778 = isnan(_376);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = fma(_744, _712, _766);
    float _790 = float(_764);
    float _792 = _774 * 0.15915493667125701904296875;
    float _794 = float(_718);
    float _796 = _786 * _772;
    float _798 = -_786;
    float _800 = _798 + 1.0;
    float _802 = _788 * 0.15915493667125701904296875;
    float _804 = _792 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _790 * _794;
    float _810 = _520 * _796;
    float _812 = _522 * _796;
    float _814 = _518 * _796;
    float _816 = _808 * (-2.0);
    float _818 = in.m_77.x;
    float _820 = in.m_77.y;
    float _822 = in.m_77.z;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _810);
    float _826 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _812);
    float _828 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _814);
    float _830 = fma(_816, _620, _620);
    float _832 = in.m_79.x;
    float _834 = in.m_79.y;
    float _836 = in.m_79.z;
    float _838 = fma(_488, _816, _488);
    float _840 = fma(_560, _768, _824);
    float _842 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _830);
    float _844 = fma(_564, _768, _826);
    float _846 = _802 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = fma(_638, _762, _840);
    float _852 = fma(_838, _712, _842);
    float _854 = fma(_640, _762, _844);
    float _856 = fma(_568, _768, _828);
    float _858 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].x, _850);
    float _860 = _852 * 0.15915493667125701904296875;
    float _862 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].y, _854);
    float _864 = _802 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = fma(_648, _762, _856);
    float _870 = in.m_71.w;
    float _872 = _858 * _818;
    float _874 = _862 * _820;
    float _876 = _792 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[146].z, _868);
    float _882 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _888 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _890 = _806 * _848;
    float _892 = _884 * _882;
    float _894 = _860 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _886 * _888;
    float _900 = _806 * _866;
    float _902 = _880 * _822;
    float _904 = in.m_69.w;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
    float _908 = _902 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _910 = _860 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _878 * _848;
    float _916 = _878 * _866;
    float _918 = _906 * _908;
    float _920 = _614 + _870;
    float _922 = in.m_81.y;
    float _924 = _806 * _896;
    float _926 = _866 * _896;
    float _928 = _878 * _896;
    float _930 = _848 * _896;
    float _932 = _924 * _898;
    float _934 = fma(_912, _900, _914);
    float _936 = -_898;
    float _938 = _912 * _936;
    float _940 = -_916;
    float _942 = fma(_912, _890, _940);
    float _944 = -_890;
    float _946 = fma(_912, _916, _944);
    float _948 = fma(_934, _892, _932);
    float _950 = _928 * _898;
    float _952 = fma(_926, _892, _938);
    float _954 = fma(_912, _914, _900);
    float _956 = fma(_942, _918, _948);
    float _958 = fma(_946, _892, _950);
    float _960 = fma(_930, _918, _952);
    float _962 = _606 + _904;
    float _964 = _956 * _328;
    float _966 = _956 * _332;
    float _968 = fma(_954, _918, _958);
    float _970 = _390 + _922;
    float _972 = fma(_960, _306, _964);
    float _974 = fma(_960, _310, _966);
    float _976 = fma(_968, _340, _972);
    float _978 = fma(_968, _344, _974);
    float _980 = _962 + _976;
    float _982 = _920 + _978;
    float _984 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _986 = _980 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _990 = _982 + _988;
    float _992 = _986 * _986;
    float _994 = _990 * _990;
    float _996 = _992 + _994;
    float _998 = sqrt(_996);
    bool _1000 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1004 = _998 + _1002;
    float _1006 = _956 * _320;
    float _1008 = fma(_960, _302, _1006);
    float _1010 = fma(_968, _336, _1008);
    float _1012 = _828;
    float _1014 = _1006;
    float _1016 = _980;
    float _1018 = _982;
    float _1020 = _992;
    float _1022 = _994;
    float _1024 = _934;
    float _1026 = _928;
    if (_1000)
    {
        float _1028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1028;
    }
    float _1030 = _1012;
    float _1032 = _970 + _1010;
    float _1034 = _1032;
    if (_1000)
    {
        float _1036 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _598 = _1036;
    }
    float _1038 = _598;
    float _1040 = _1038;
    if (_1000)
    {
        float _1042 = rsqrt(_996);
        _1014 = _1042;
    }
    float _1044 = _1014;
    float _1046 = _1030;
    if (_1000)
    {
        float _1048 = _1004 * _1030;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = _1050;
    if (_1000)
    {
        float _1054 = _1050 * 0.15915493667125701904296875;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _978;
    if (_1000)
    {
        float _1060 = _1056 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1058 = _1062;
    }
    float _1064 = _1058;
    if (_1000)
    {
        float _1066 = fma(_1064, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1066;
    }
    float _1068 = _1040;
    float _1070 = _1068;
    if (_1000)
    {
        float _1072 = _1044 * _1068;
        _1070 = _1072;
    }
    float _1074 = _1070;
    if (_1000)
    {
        float _1076 = fma(_986, _1074, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1016 = _1076;
    }
    float _1078 = _1016;
    if (_1000)
    {
        float _1080 = fma(_990, _1074, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1018 = _1080;
    }
    float _1082 = _1018;
    float _1084 = fma(_1078, 6.2500002968590706586837768554688e-05, 0.5);
    float _1086 = fma(_1082, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4292 = float2(_1084, _1086);
    float3 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4292, float2(0.0), isnan(_4292)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4292, float2(0.0), isnan(_4292)), level(0.0)).xyz;
    float _1092 = _1090.x;
    float _1094 = _1090.y;
    float _1096 = _1090.z;
    float _1098 = in.m_83.y;
    bool _1100 = _834 != 0.0;
    bool _1102 = isnan(_834);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1056;
    if (_1000)
    {
        float _1112 = _1056 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        _1110 = _1114;
    }
    float _1116 = _1110;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    float _1122 = in.m_73.w;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1126 = _1124 != 0;
    bool _1128 = _832 == 0.0;
    bool _1130 = !_1108;
    bool _1132 = _1128 && _1130;
    float _1134 = in.m_85.x;
    float _1136 = in.m_85.y;
    float _1138 = in.m_85.z;
    bool _1140 = _836 == 0.0;
    bool _1142 = _1140 && _1132;
    float _1144 = in.m_83.x;
    float _1146 = _1004;
    float _1148 = 1.0;
    float _1150 = 1.0;
    if (_1120)
    {
        float _1152 = in.m_73.z;
        _1146 = _1152;
    }
    float _1154 = _1146;
    out.m_87.x = 1.0;
    out.m_87.y = 1.0;
    out.m_87.z = 1.0;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1160 = -_1098;
    float _1162 = _1160 + 1.0;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1170 = _1122 > 0.5;
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1098;
    if (_1126)
    {
        float _1178 = _1170 ? _1162 : _1098;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = 0.0;
    if (_1142)
    {
        _1182 = _1136;
    }
    float _1184 = _1182;
    float _1186 = _1184;
    if (!_1142)
    {
        float _1188 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1136);
        _1186 = _1188;
    }
    float _1190 = _1186;
    if (_1142)
    {
        _1148 = _1138;
    }
    float _1192 = _1148;
    float _1194 = _1192;
    if (!_1142)
    {
        float _1196 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1138);
        _1194 = _1196;
    }
    float _1198 = _1194;
    float _1200 = 0.0;
    if (_1120)
    {
        _1200 = _1144;
    }
    float _1202 = _1200;
    out.m_89.x = _1168;
    out.m_89.y = _1172;
    out.m_89.z = _1174;
    out.m_89.w = _1166;
    bool _1204 = _1154 > 0.5;
    bool _1206 = _1204 && _1120;
    float _1208 = _1202;
    if (!_1120)
    {
        _1150 = _1144;
    }
    float _1210 = _1150;
    float _1212 = in.m_91.x;
    float _1214 = in.m_91.y;
    float _1216 = in.m_91.z;
    float _1218 = in.m_91.w;
    float _1220 = 0.0;
    float _1222 = _1210;
    if (_1142)
    {
        _1220 = _1134;
    }
    float _1224 = _1220;
    float _1226 = _1224;
    if (!_1142)
    {
        float _1228 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1134);
        _1226 = _1228;
    }
    float _1230 = _1226;
    float _1232 = _928 * _1190;
    float _1234 = _1230;
    if (_1206)
    {
        float _1236 = -_1202;
        float _1238 = _1236 + 1.0;
        _1208 = _1238;
    }
    float _1240 = _1208;
    float _1242 = fma(_946, _1230, _1232);
    if (_1120)
    {
        _1222 = _1240;
    }
    float _1244 = _1222;
    float _1246 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1248 = _1216 * _1134;
    float _1250 = _1214 * _1138;
    float _1252 = _1212 * _1136;
    float _1254 = -_1248;
    float _1256 = fma(_1212, _1138, _1254);
    float _1258 = -_1250;
    float _1260 = fma(_1216, _1136, _1258);
    float _1262 = -_1252;
    float _1264 = fma(_1214, _1134, _1262);
    float _1266 = -_1214;
    float _1268 = _912 * _1266;
    float _1270 = _1256 * _1218;
    float _1272 = _1260 * _1218;
    float _1274 = -_1190;
    float _1276 = _912 * _1274;
    float _1278 = _1264 * _1218;
    float _1280 = -_1270;
    float _1282 = _912 * _1280;
    float _1284 = fma(_926, _1212, _1268);
    float _1286 = _924 * _1190;
    float _1288 = _924 * _1214;
    float _1290 = _928 * _1214;
    float _1292 = _924 * _1270;
    float _1294 = fma(_926, _1230, _1276);
    float _1296 = _928 * _1270;
    float _1298 = fma(_926, _1272, _1282);
    float _1300 = fma(_934, _1230, _1286);
    float _1302 = fma(_934, _1212, _1288);
    float _1304 = fma(_946, _1212, _1290);
    float _1306 = fma(_934, _1272, _1292);
    float _1308 = fma(_946, _1272, _1296);
    float _1310 = fma(_942, _1198, _1300);
    float _1312 = fma(_930, _1198, _1294);
    float _1314 = fma(_930, _1216, _1284);
    float _1316 = fma(_942, _1216, _1302);
    float _1318 = fma(_954, _1216, _1304);
    float _1320 = fma(_930, _1278, _1298);
    float _1322 = fma(_942, _1278, _1306);
    float _1324 = fma(_954, _1278, _1308);
    float _1326 = _1310 * _328;
    float _1328 = fma(_954, _1198, _1242);
    float _1330 = _1310 * _320;
    float _1332 = _1310 * _332;
    float _1334 = _1316 * _328;
    float _1336 = fma(_1312, _306, _1326);
    float _1338 = _1326;
    float _1340 = _1334;
    float _1342 = _1322;
    float _1344 = _1320;
    if (_1000)
    {
        float _1346 = _1116 + (-1.0);
        _1338 = _1346;
    }
    float _1348 = _1338;
    float _1350 = fma(_1312, _302, _1330);
    float _1352 = fma(_1312, _310, _1332);
    float _1354 = fma(_1314, _306, _1334);
    if (_1000)
    {
        float _1356 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1356;
    }
    float _1358 = _1340;
    float _1360 = _1316 * _320;
    float _1362 = _1316 * _332;
    float _1364 = _1322 * _328;
    float _1366 = _1322 * _320;
    float _1368 = _1322 * _332;
    float _1370 = _1362;
    if (_1000)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1374 = _1078 + _1372;
        _1342 = _1374;
    }
    float _1376 = _1342;
    if (_1000)
    {
        float _1378 = fma(_1032, _1116, _1358);
        _1034 = _1378;
    }
    float _1380 = _1034;
    float _1382 = fma(_1314, _310, _1362);
    if (_1000)
    {
        float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1386 = _1082 + _1384;
        _1370 = _1386;
    }
    float _1388 = _1370;
    if (_1000)
    {
        float _1390 = _1376 * _1376;
        _1020 = _1390;
    }
    float _1392 = _1020;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1396 = _1380 + _1394;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1000)
    {
        float _1400 = _1388 * _1388;
        _1022 = _1400;
    }
    float _1402 = _1022;
    float _1404 = fma(_1314, _302, _1360);
    float _1406 = fma(_1396, _1396, _1392);
    float _1408 = fma(_1320, _306, _1364);
    float _1410 = fma(_1320, _302, _1366);
    float _1412 = fma(_1318, _340, _1354);
    float _1414 = _1406 + _1402;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1418 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1420 = fma(_1320, _310, _1368);
    float _1422 = fma(_1318, _336, _1404);
    float _1424 = fma(_1318, _344, _1382);
    float _1426 = fma(_1328, _340, _1336);
    float _1428 = fma(_1324, _340, _1408);
    float _1430 = fma(_1324, _336, _1410);
    float _1432 = sqrt(_1414);
    float _1434 = fma(_1328, _336, _1350);
    float _1436 = _1246 * _1398;
    float _1438 = fma(_1324, _344, _1420);
    float _1440 = fma(_1328, _344, _1352);
    out.m_93.x = _1412;
    out.m_93.y = _1422;
    out.m_93.z = _1424;
    float _1442 = _1418 * _1416;
    out.m_95.x = _1428;
    out.m_95.y = _1430;
    out.m_95.z = _1438;
    out.m_97.z = _1436;
    out.m_97.w = _1442;
    bool _1444 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1446 = isnan(_1432);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1452 = _1448 || _1450;
    out.m_99.x = _1426;
    out.m_99.y = _1434;
    out.m_99.z = _1440;
    if (!_1452)
    {
        _348 = 1.0;
    }
    float _1454 = _348;
    out.m_101.x = _1092;
    out.m_101.y = _1094;
    out.m_101.z = _1096;
    bool _1456 = !_1452;
    float _1458 = _1454;
    if (!_1456)
    {
        bool _1460 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1462 = isnan(_1432);
        bool _1464 = _1460 || _1462;
        bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1468 = _1464 || _1466;
        if (!_1468)
        {
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = _1432 + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1476 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1474;
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1482 = 1.0 / _1476;
            float _1484 = _1472 * _1482;
            float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1458 = _1486;
            _1488 = true;
        }
        else
        {
            bool _1490 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1492 = isnan(_1432);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1432 + _1500;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1510 = _1508 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1512 = 1.0 / _1506;
                float _1514 = _1502 * _1512;
                float _1516 = fma(_1514, _1510, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1458 = _1516;
                _1488 = true;
            }
            else
            {
                _1458 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1488 = false;
    float _1518 = _1458;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1522 = _1380 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1526 = _1078 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1530 = _1082 + _1528;
    float _1532 = _970 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1534 = fma(_1522, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1536 = fma(_1526, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1538 = fma(_1530, _1518, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1540 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1532);
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1534 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1536 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1540);
    float _1562 = _970 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1564 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1566 = rsqrt(_1558);
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1570 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1562);
    float _1572 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1570);
    float _1574 = 1.0 / _1568;
    float _1576 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1578 = _1576 + _1568;
    float _1580 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = sqrt(_1558);
    float _1584 = _1548 * _1580;
    float _1586 = _1552 * _1580;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 * _1586;
    float _1592 = _1578 * _1574;
    float _1594 = _1592 * 0.5;
    float _1596 = _1588 + _1590;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1600 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1598);
    float _1602 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1604 = sqrt(_1596);
    float _1606 = _970 + _1602;
    float _1608 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1610 = 1.0 / _1600;
    float _1612 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1614 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1608);
    float _1616 = fma(_962, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1612);
    float _1618 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1614);
    bool _1620 = _1604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1622 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1616);
    float _1624 = floor(_1564);
    float _1626 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1628 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1632 = _1610 * _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1604 + _1634;
    float _1638 = trunc(_1626);
    int _1640 = int(_1638);
    float _1642 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _1644 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1646 = _1632 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1648 = precise::max(0.0, _1642);
    float _1650 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _1652 = 2;
    float _1654 = _1580;
    float _1656 = _1636;
    float _1658 = _1596;
    float _1660 = _1584;
    float _1662 = _1588;
    int _1664 = as_type<int>(_1590);
    if (_1620)
    {
        float _1666 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1666;
    }
    float _1668 = _1650;
    float _1670 = -_1624;
    float _1672 = _1564 + _1670;
    float _1674 = -_1580;
    float _1676 = -_1648;
    float _1678 = fma(_1544, _1674, _1676);
    float _1680 = trunc(_1628);
    int _1682 = int(_1680);
    float _1684 = _1678;
    if (!_1644)
    {
        _1652 = 1;
    }
    int _1686 = _1652;
    int _1688 = _1686;
    if (_1620)
    {
        float _1690 = _1678 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1690;
    }
    float _1692 = _1654;
    int _1694 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1696 = _1640 + _1694;
    int _1698 = _1696 + 1;
    if (_1620)
    {
        float _1700 = _1636 * _1668;
        _1656 = _1700;
    }
    float _1702 = _1656;
    if (_1620)
    {
        float _1704 = rsqrt(_1596);
        _1658 = _1704;
    }
    float _1706 = _1658;
    float _1708 = _1706;
    if (_1620)
    {
        float _1710 = _1702 * 0.15915493667125701904296875;
        _1344 = _1710;
    }
    float _1712 = _1344;
    bool _1714 = !_1644;
    int _1716 = _1714 ? 0 : 1;
    int _1718 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1720 = _1682 + _1718;
    int _1722 = _1720 + 1;
    float _1724 = _1622;
    if (_1620)
    {
        float _1726 = _1712 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        _1724 = _1728;
    }
    float _1730 = _1724;
    if (!_1646)
    {
        _1688 = _1716;
    }
    int _1732 = _1688;
    bool _1734 = _1698 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1736 = _1732 << 6;
    int _1738 = _1698 | _1722;
    float _1740 = _1712;
    float _1742 = as_type<float>(_1738);
    if (_1620)
    {
        float _1744 = _1712 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        _1740 = _1746;
    }
    float _1748 = _1740;
    int _1750 = _1736 + 96;
    uint _1753 = uint(int(uint(_1750) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    bool _1769 = _1738 < 0;
    bool _1771 = _1769 || _1734;
    float _1773 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1620)
    {
        float _1775 = fma(_1730, _1692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1742 = _1775;
    }
    float _1777 = _1742;
    int _1779 = _1736 + 48;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    float _1797 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1799 = _1722 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1801 = _1799 || _1771;
    if (_1620)
    {
        float _1803 = _1706 * _1777;
        _1024 = _1803;
    }
    float _1805 = _1024;
    float _1807 = floor(_1773);
    float _1809 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1797);
    float _1811 = _1748;
    if (_1620)
    {
        float _1813 = _1748 + (-1.0);
        _1708 = _1813;
    }
    float _1815 = _1708;
    int _1817 = _1736 + 104;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    float _1835 = _1815;
    if (_1620)
    {
        float _1837 = _1584 * _1805;
        _1660 = _1837;
    }
    float _1839 = _1660;
    float _1841 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1809);
    if (_1620)
    {
        float _1843 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1234 = _1843;
    }
    float _1845 = _1234;
    if (!_1620)
    {
        _1835 = _1586;
    }
    float _1847 = _1835;
    float _1849 = _1847;
    if (_1620)
    {
        float _1851 = _1586 * _1805;
        _1849 = _1851;
    }
    float _1853 = _1849;
    if (_1620)
    {
        float _1855 = _1839 * _1839;
        _1662 = _1855;
    }
    float _1857 = _1662;
    if (_1620)
    {
        float _1859 = fma(_1678, _1748, _1845);
        _1684 = _1859;
    }
    float _1861 = _1684;
    int _1863 = _1736 + 64;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    uint _1867 = uint(int(uint(int(_1865)) >> uint(2)));
    int _1869 = int(_1865) & 3;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[int(_1867)][_1869];
    int _1873 = int(_1865) + 1;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    int _1877 = _1873 & 3;
    float _1879 = (*spvDescriptorSet0.vp_c15)._m0[int(_1875)][_1877];
    if (!_1620)
    {
        _1811 = _1590;
    }
    float _1881 = _1811;
    float _1883 = _1881;
    if (_1620)
    {
        float _1885 = _1853 * _1853;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = fma(_1861, _1861, _1857);
    if (!_1801)
    {
        float _1891 = floor(_1628);
        _1026 = _1891;
    }
    float _1893 = _1026;
    if (!_1801)
    {
        int _1895 = _1722 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1897 = _1895 + _1698;
        _1664 = _1897;
    }
    int _1899 = _1664;
    float _1901 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1903 = _1889 + _1887;
    int _1905 = _1736 + 56;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    uint _1909 = uint(int(uint(int(_1907)) >> uint(2)));
    int _1911 = int(_1907) & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    int _1915 = int(_1907) + 1;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    int _1919 = _1915 & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    float _1923 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1925 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1927 = -_1807;
    float _1929 = _1773 + _1927;
    float _1931 = -_1925;
    float _1933 = fma(_1931, _1923, 1.0);
    int _1935 = _1736 + 80;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    float _1953 = log2(_1933);
    int _1955 = _1736 + 88;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    uint _1959 = uint(int(uint(int(_1957)) >> uint(2)));
    int _1961 = int(_1957) & 3;
    float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
    int _1965 = int(_1957) + 1;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    int _1969 = _1965 & 3;
    float _1971 = (*spvDescriptorSet0.vp_c15)._m0[int(_1967)][_1969];
    float _1973 = _1606 * _1767;
    float _1975 = fma(_962, _1759, _1973);
    int _1977 = _1736 + 72;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    uint _1981 = uint(int(uint(int(_1979)) >> uint(2)));
    int _1983 = int(_1979) & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    int _1987 = int(_1979) + 1;
    uint _1989 = uint(int(uint(_1987) >> uint(2)));
    int _1991 = _1987 & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    float _1995 = _1606 * _1795;
    float _1997 = rsqrt(_1903);
    float _1999 = _1953 * 0.693147182464599609375;
    float _2001 = fma(_962, _1787, _1995);
    int _2003 = as_type<int>(_1995);
    int _2005 = as_type<int>(_1759);
    if (!_1801)
    {
        int _2007 = _1899 << 2;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = fma(_920, _1825, _1975);
    int _2013 = _2009;
    float _2015 = _1879;
    if (!_1801)
    {
        int _2017 = 12 & _2009;
        _2013 = _2017;
    }
    int _2019 = _2013;
    float _2021 = _2011 + _1833;
    float _2023 = _1606 * _1879;
    if (!_1801)
    {
        float _2025 = -_1893;
        float _2027 = _1628 + _2025;
        _2015 = _2027;
    }
    float _2029 = _2015;
    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2033 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2031);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _1997 * _1839;
    float _2039 = fma(_962, _1871, _2023);
    float _2041 = _1997 * _1861;
    float _2043 = _1997 * _1853;
    float _2045 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2047 = fma(_920, _1913, _2001);
    float2 _5927 = float2(_1672, _1929);
    float _2049 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5927, float2(0.0), isnan(_5927)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5927, float2(0.0), isnan(_5927)), level(0.0)).x;
    float _2051 = 1.0 / _2021;
    float _2053 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2055 = _2047 + _1921;
    float _2057 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = _1606 * _1951;
    int _2061 = as_type<int>(_1951);
    if (!_1801)
    {
        uint _2063 = uint(int(uint(_1899) >> uint(2)));
        _2061 = int(_2063);
    }
    int _2065 = _2061;
    float _2067 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2057);
    float _2069 = fma(_962, _1943, _2059);
    float _2071 = -_2035;
    float _2073 = _2071 + 1.0;
    if (!_1801)
    {
        int _2075 = _2065 << 4;
        int _2077 = _2075 + _2019;
        _2005 = _2077;
    }
    int _2079 = _2005;
    float _2081 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2083 = fma(_920, _1963, _2069);
    float _2085 = -_2045;
    float _2087 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2085);
    float _2089 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = abs(_2073);
    float _2093 = log2(_2091);
    float _2095 = _2055 * _2051;
    float _2097 = -_2043;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2087);
    float _2101 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2103 = _2035;
    float _2105 = as_type<float>(_2079);
    if (!_1801)
    {
        int _2107 = _2079 + 400;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
        _2103 = _2115;
    }
    float _2117 = _2103;
    float _2119 = fma(_920, _1985, _2039);
    bool _2121 = _2095 >= 0.0;
    float _2123 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2101);
    float _2125 = fma(_2099, -0.5, 0.5);
    float _2127 = _2119 + _1993;
    float _2129 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2131 = _2095 <= 1.0;
    bool _2133 = _2131 && _2121;
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2137 = _2127 * _2051;
    float _2139 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2129);
    float _2141 = fma(_2099, 0.5, 0.5);
    float _2143 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2145 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2147 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2139);
    bool _2149 = _2137 >= 0.0;
    bool _2151 = _2149 && _2133;
    float _2153 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = exp2(_2143);
    float _2157 = _2147 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2159 = _2137 <= 1.0;
    bool _2161 = _2159 && _2151;
    float _2163 = _2083 + _1971;
    float _2165 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2169 = _2041 + 1.0;
    float _2171 = sqrt(_2125);
    float _2173 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2175 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2165);
    float _2177 = fma(_2141, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2179 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2181 = as_type<float>(_2019);
    float _2183 = _2169;
    if (!_1801)
    {
        float _2185 = floor(_1626);
        _2181 = _2185;
    }
    float _2187 = _2181;
    if (_2161)
    {
        float _2189 = float(_1732);
        _2105 = _2189;
    }
    float _2191 = _2105;
    float _2193 = fma(_2141, _2177, -0.212114393711090087890625);
    float _2195 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = -_2041;
    float _2199 = fma(_2155, _2169, _2197);
    float _2201 = fma(_2141, _2193, 1.570728778839111328125);
    float _2203 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2205 = 1.0 / _2179;
    float _2207 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2175);
    float _2209 = _2171 * 0.636619746685028076171875;
    float _2211 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2203);
    float _2213 = _2163 * _2051;
    float _2215 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float _2217 = -_2201;
    float _2219 = fma(_2209, _2217, 1.0);
    float _2221 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2211);
    float _2223 = _2191;
    float _2225 = _2213;
    if (_2161)
    {
        float _2227 = rint(_2191);
        float _2229 = precise::max(_2227, 0.0);
        uint _2231 = uint(_2229);
        uint _2233 = clamp(_2231, 0u, 65535u);
        _2223 = as_type<float>(_2233);
    }
    float _2235 = _2223;
    if (!_1801)
    {
        float _2237 = -_2187;
        float _2239 = _1626 + _2237;
        _2183 = _2239;
    }
    float _2241 = _2183;
    float _2243 = fma(_2199, 0.5, 0.5);
    float _2245 = _2215 * _2205;
    float _2247 = _2221 * _2205;
    float _2249 = _2051;
    if (!_1801)
    {
        float _2251 = rint(_2117);
        float _2253 = precise::max(_2251, 0.0);
        uint _2255 = uint(_2253);
        uint _2257 = clamp(_2255, 0u, 65535u);
        _2249 = as_type<float>(_2257);
    }
    float _2259 = _2249;
    float _2261 = fma(_2245, 0.5, 0.5);
    float _2263 = fma(_2247, -0.5, 0.5);
    float _2265 = _2235;
    if (_2161)
    {
        float3 _6298 = float3(_2095, _2137, float(as_type<int>(_2235)));
        float3 _6302 = select(_6298, float3(0.0), isnan(_6298));
        float _2267 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6302.xy, uint(rint(_6302.z)), _2213, level(0.0));
        _2265 = _2267;
    }
    float _2269 = _2265;
    float3 _6312 = float3(_2261, _2263, _2053);
    float _2271 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6312, float3(0.0), isnan(_6312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6312, float3(0.0), isnan(_6312)), level(0.0)).x;
    float3 _6321 = float3(_2261, _2263, _2053);
    float4 _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6321, float3(0.0), isnan(_6321)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6321, float3(0.0), isnan(_6321)), level(0.0)).xyzw;
    float _2276 = _2274.x;
    float _2278 = _2274.y;
    float _2280 = _2274.z;
    float _2282 = _2274.w;
    float2 _6337 = float2(_2219, _2243);
    float3 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).xyz;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2259;
    if (!_1801)
    {
        float3 _6358 = float3(_2241, _2029, float(as_type<int>(_2259)));
        float3 _6360 = select(_6358, float3(0.0), isnan(_6358));
        float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6360.xy, uint(rint(_6360.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6360.xy, uint(rint(_6360.z)), level(0.0)).x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = abs(_1632);
    float _2300 = log2(_2298);
    float _2302 = _2135 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2304 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2302);
    float _2306 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    bool _2308 = _1632 <= 8000.0;
    bool _2310 = isnan(_1632);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(8000.0);
    bool _2316 = _2312 || _2314;
    float _2318 = float(_2316);
    float _2320 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2322 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2324 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2215;
    out.gl_Position.y = _2221;
    out.gl_Position.z = _2320;
    out.gl_Position.w = _2179;
    float _2326 = exp2(_2322);
    float _2328 = exp2(_2324);
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = fma(_2332, -2.0, 3.0);
    float _2336 = _2332 * _2332;
    float _2338 = _2336 * _2334;
    float _2340 = _2320 + _2179;
    float _2342 = _2340 * 0.5;
    float _2344 = -_2338;
    float _2346 = _2344 + 1.0;
    out.m_103.z = _2342;
    out.m_103.w = _2179;
    float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2338);
    float _2350 = -_2326;
    float _2352 = _2350 + 1.0;
    float _2354 = _2318 * _2348;
    float _2356 = _2348;
    float _2358 = _2320;
    float _2360 = _2215;
    if (!_2161)
    {
        _2356 = 1.0;
    }
    float _2362 = _2356;
    float _2364 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2366 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2368 = -_2049;
    float _2370 = _2368 + 1.0;
    float _2372 = _2370 * _2366;
    float _2374 = precise::clamp(_2372, 0.0, 1.0);
    float _2376 = _2366;
    float _2378 = _2362;
    if (_1801)
    {
        _2376 = 1.0;
    }
    float _2380 = _2376;
    float _2382 = _2380;
    if (_2161)
    {
        bool _2384 = _2269 >= _2213;
        bool _2386 = isnan(_2269);
        bool _2388 = _2384 || _2386;
        bool _2390 = isnan(_2213);
        bool _2392 = _2388 || _2390;
        float _2394 = float(_2392);
        _2378 = _2394;
    }
    float _2396 = _2378;
    if (!_1801)
    {
        int _2398 = _1899 << 4;
        int _2400 = _2398 + 2048;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
        int _2406 = int(_2402) & 3;
        float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
        int _2410 = int(_2402) + 1;
        uint _2412 = uint(int(uint(_2410) >> uint(2)));
        int _2414 = _2410 & 3;
        float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
        int _2418 = _2400 + 8;
        uint _2420 = uint(int(uint(_2418) >> uint(2)));
        uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
        int _2424 = int(_2420) & 3;
        float _2426 = (*spvDescriptorSet0.vp_c15)._m0[int(_2422)][_2424];
        int _2428 = int(_2420) + 1;
        uint _2430 = uint(int(uint(_2428) >> uint(2)));
        int _2432 = _2428 & 3;
        float _2434 = (*spvDescriptorSet0.vp_c15)._m0[int(_2430)][_2432];
        float _2436 = _1606 * _2416;
        float _2438 = fma(_962, _2408, _2436);
        float _2440 = fma(_920, _2426, _2438);
        float _2442 = _2440 + _2434;
        float _2444 = precise::clamp(_2442, 0.0, 1.0);
        float _2446 = -_2444;
        float _2448 = _2446 + _2296;
        float _2450 = fma(_2448, 500.0, 1.5);
        float _2452 = exp2(_2450);
        float _2454 = 0.0 + _2452;
        float _2456 = precise::clamp(_2454, 0.0, 1.0);
        _2382 = _2456;
        _2358 = _2426;
        _2225 = _2452;
        _2360 = 500.0;
    }
    float _2458 = _2382;
    float _2460 = _2358;
    float _2462 = _2225;
    float _2464 = _2360;
    float _2466 = _2396 * _2458;
    float _2468 = -_2374;
    float _2470 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2472 = _2364 * _2271;
    out.m_105.x = _1536;
    out.m_105.y = _1534;
    out.m_105.z = _1538;
    bool _2474 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2476 = isnan(_1582);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2482 = _2478 || _2480;
    float _2484 = -_2466;
    float _2486 = fma(_2484, _2470, 1.0);
    float _2488 = precise::clamp(_2486, 0.0, 1.0);
    float _2490 = _2282 * _2472;
    float _2492 = -_2364;
    float _2494 = _2492 + 1.0;
    float _2496 = _2290 * _2472;
    float _2498 = _2488 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2500 = fma(_2286, _2490, _2276);
    float _2502 = fma(_2288, _2490, _2278);
    float _2504 = _2282 * _2494;
    float _2506 = fma(_2282, _2496, _2280);
    out.m_107.x = _2498;
    float _2508 = _2462;
    float _2510 = _2460;
    float _2512 = _2464;
    float _2514 = _2494;
    float _2516 = _2490;
    float _2518 = _2488;
    if (!_2482)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2520 = _2508;
    out.m_109.x = _2500;
    out.m_109.y = _2502;
    out.m_109.z = _2506;
    out.m_109.w = _2504;
    float _2522 = _2520;
    float _2524 = _2520;
    if (!_2482)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2526 = _2510;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2482)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2532 = _2512;
    float _2534 = _2532;
    float _2536 = _2532;
    if (!_2482)
    {
        _2514 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2538 = _2514;
    float _2540 = _2538;
    float _2542 = _2538;
    if (!_2482)
    {
        _2516 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2544 = _2516;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2482)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2550 = _2518;
    bool _2552 = !_2482;
    float _2554 = _2550;
    float _2556 = _2550;
    if (!_2552)
    {
        bool _2558 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2560 = isnan(_1582);
        bool _2562 = _2558 || _2560;
        bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2566 = _2562 || _2564;
        if (!_2566)
        {
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2570 = _1582 + _2568;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2574 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2572;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2580 = 1.0 / _2574;
            float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2598 = _2570 * _2580;
            float _2600 = precise::clamp(_2598, 0.0, 1.0);
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2606 = fma(_2600, _2578, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2608 = fma(_2600, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2610 = fma(_2600, _2584, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2612 = fma(_2600, _2588, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2614 = fma(_2600, _2592, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2616 = fma(_2600, _2596, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2530 = _2606;
            _2548 = _2614;
            _2524 = _2610;
            _2542 = _2612;
            _2536 = _2608;
            _2556 = _2616;
            _2618 = true;
        }
        else
        {
            bool _2620 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2622 = isnan(_1582);
            bool _2624 = _2620 || _2622;
            bool _2626 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2628 = _2624 || _2626;
            if (!_2628)
            {
                _2522 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2630 = _2522;
            _2524 = _2630;
            if (!_2628)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2632 = _2528;
            _2530 = _2632;
            if (!_2628)
            {
                _2534 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2634 = _2534;
            _2536 = _2634;
            if (!_2628)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2636 = _2540;
            _2542 = _2636;
            if (!_2628)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2638 = _2546;
            _2548 = _2638;
            if (!_2628)
            {
                _2554 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2640 = _2554;
            bool _2642 = !_2628;
            _2556 = _2640;
            if (!_2642)
            {
                bool _2644 = _1582 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2646 = isnan(_1582);
                bool _2648 = _2644 || _2646;
                bool _2650 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2652 = _2648 || _2650;
                if (!_2652)
                {
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2656 = _1582 + _2654;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2660 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2658;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2666 = 1.0 / _2660;
                    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2684 = _2656 * _2666;
                    float _2686 = precise::clamp(_2684, 0.0, 1.0);
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2692 = fma(_2686, _2664, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2694 = fma(_2686, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2696 = fma(_2686, _2670, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2698 = fma(_2686, _2674, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2700 = fma(_2686, _2678, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2702 = fma(_2686, _2682, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2530 = _2692;
                    _2548 = _2700;
                    _2524 = _2696;
                    _2542 = _2698;
                    _2536 = _2694;
                    _2556 = _2702;
                    _2618 = true;
                }
                else
                {
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2524 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2536 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2556 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2618 = false;
    float _2704 = _2530;
    float _2706 = _2548;
    float _2708 = _2524;
    float _2710 = _2542;
    float _2712 = _2536;
    float _2714 = _2556;
    float _2716 = fma(_1434, -0.5, 0.5);
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    float _2720 = -_2704;
    float _2722 = _2720 + _2706;
    float _2724 = -_2708;
    float _2726 = _2724 + _2710;
    float _2728 = -_2712;
    float _2730 = _2728 + _2714;
    bool _2732 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2734 = fma(_2718, _2722, _2704);
    float _2736 = fma(_2718, _2726, _2708);
    float _2738 = fma(_2718, _2730, _2712);
    float _2740 = _2734 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2742 = fma(_2736, 0.298911988735198974609375, _2740);
    float _2744 = fma(_2738, 0.114477999508380889892578125, _2742);
    out.m_111.x = 0.0;
    float _2746 = -_2744;
    float _2748 = _2736 + _2746;
    float _2750 = -_2744;
    float _2752 = _2734 + _2750;
    float _2754 = -_2744;
    float _2756 = _2738 + _2754;
    float _2758 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2760 = fma(_2748, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    float _2762 = fma(_2752, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    float _2764 = fma(_2756, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2744);
    out.m_107.w = _2758;
    out.m_113.x = _2760;
    out.m_113.y = _2762;
    out.m_113.z = _2764;
    if (!_2732)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2766 = -_1534;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2770 = -_1536;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2774 = -_1538;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2778 = _2768 * _2768;
    float _2780 = fma(_2772, _2772, _2778);
    float _2782 = fma(_2776, _2776, _2780);
    float _2784 = sqrt(_2782);
    float _2786 = rsqrt(_2782);
    float _2788 = -_2784;
    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2792 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = _2772 * _2786;
    float _2798 = _2768 * _2786;
    float _2800 = abs(_2794);
    float _2802 = log2(_2800);
    float _2804 = _2776 * _2786;
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2808 = _1434 * _2798;
    float _2810 = -_2798;
    float _2812 = -_2806;
    float _2814 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2812);
    float _2816 = fma(_1426, _2796, _2808);
    float _2818 = -_2804;
    float _2820 = fma(_2818, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2814);
    float _2822 = fma(_1440, _2804, _2816);
    float _2824 = precise::clamp(_2822, 0.0, 1.0);
    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2828 = _2820 + _2826;
    float _2830 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2832 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = exp2(_2830);
    float _2838 = _2836 * _2834;
    float _2840 = _2824 * _2838;
    float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2844 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2846 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2842;
    out.m_111.y = _2844;
    out.m_111.z = _2846;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

