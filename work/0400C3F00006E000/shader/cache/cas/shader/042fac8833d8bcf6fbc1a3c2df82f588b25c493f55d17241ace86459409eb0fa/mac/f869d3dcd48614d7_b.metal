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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    texture2d_array<float> vp_t_tcb_14 [[id(18)]];
    sampler vp_t_tcb_14Smplr [[id(19)]];
    sampler vp_t_tcb_28Smplr_w [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_85 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_101 [[user(locn7)]];
    float4 m_103 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_77 [[attribute(10)]];
    float4 m_81 [[attribute(12)]];
    float4 m_91 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2790 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_61.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3075 = as_type<float>(_140);
        out.gl_Position.z = _3075;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3144 = as_type<float>(_178);
        out.gl_Position.z = _3144;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_65.x;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = in.m_67.x;
    float _188 = in.m_67.y;
    float _190 = in.m_67.z;
    float _192 = in.m_69.x;
    float _194 = in.m_69.y;
    float _196 = in.m_69.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    if (_222)
    {
        float _228 = rsqrt(_210);
        _226 = _228;
    }
    float _230 = _226;
    float _232 = 0.0;
    if (!_222)
    {
        _232 = 0.0;
    }
    float _234 = _232;
    bool _236 = _220 > 0.0;
    float _238 = 0.0;
    float _240 = _234;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _220;
    float _252 = _248;
    if (_224)
    {
        float _254 = rsqrt(_212);
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_224)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = 0.0;
    float _264 = _260;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    if (_236)
    {
        float _278 = rsqrt(_214);
        _274 = _278;
    }
    float _280 = _274;
    if (_222)
    {
        float _282 = _230 * _186;
        _240 = _282;
    }
    float _284 = _240;
    if (_222)
    {
        float _286 = _230 * _180;
        _246 = _286;
    }
    float _288 = _246;
    if (_222)
    {
        float _290 = _230 * _192;
        _252 = _290;
    }
    float _292 = _252;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _296 = 0.0;
    if (!_236)
    {
        _296 = 0.0;
    }
    float _298 = _296;
    float _300 = 0.0;
    float _302 = _298;
    if (!_236)
    {
        _300 = 0.0;
    }
    float _304 = _300;
    float _306 = _304;
    if (_224)
    {
        float _308 = _256 * _188;
        _264 = _308;
    }
    float _310 = _264;
    float _312 = 0.0;
    if (!_236)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (_224)
    {
        float _318 = _256 * _182;
        _270 = _318;
    }
    float _320 = _270;
    if (_224)
    {
        float _322 = _256 * _194;
        _276 = _322;
    }
    float _324 = _276;
    if (_236)
    {
        float _326 = _280 * _190;
        _302 = _326;
    }
    float _328 = _302;
    if (_236)
    {
        float _330 = _280 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_236)
    {
        float _334 = _280 * _196;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_294;
    float _356;
    if (!_338)
    {
        float _340 = in.m_71.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_124);
        float _362 = 1.0 / _360;
        float _364 = _158 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = in.m_58.x;
    float _374 = in.m_58.y;
    float _376 = in.m_58.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _380 = _366 + _378;
    float _382 = in.m_71.z;
    bool _384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _392 = _388 || _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = 1.0 / _396;
    float _408 = in.m_71.x;
    bool _410 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_366);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _370 * _158;
    float _432 = in.m_71.y;
    float _434 = 1.0 / _400;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = in.m_67.w;
    float _448 = _182 * _374;
    float _450 = _188 * _374;
    float _452 = exp2(_430);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _382 * 2.0;
    float _460 = _194 * _374;
    float _462 = fma(_186, _372, _450);
    float _464 = in.m_65.w;
    float _466 = _380 * _406;
    float _468 = fma(_192, _372, _460);
    float _470 = 1.0 / _404;
    float _472 = fma(_190, _376, _462);
    float _474 = in.m_69.w;
    float _476 = fma(_196, _376, _468);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = in.m_73.x;
    float _484 = floor(_458);
    float _486 = fma(_180, _372, _448);
    float _488 = -_452;
    float _490 = _488 + 1.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _494 = _366 + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    float _500 = fma(_184, _376, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = 1.0 / _456;
    float _508 = _392 ? _490 : 0.0;
    float _510 = _494 * _470;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _522 = _520 != 0;
    float _524 = _432 + _382;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = fma(_428, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _532 = !_514;
    int _534 = _532 ? 0 : 1;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _538 = _366 + _536;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _550 = _548 != 0;
    float _552 = _408 + _382;
    bool _554 = _484 > 0.0;
    float _556 = _538 * _434;
    float _558 = _408 + _432;
    float _560 = _374;
    float _562 = _432;
    if (_444)
    {
        float _564 = _508 * _506;
        _162 = _564;
    }
    float _566 = _162;
    bool _568 = _484 >= 0.0;
    bool _570 = isnan(_484);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = _408 * 2.0;
    float _580 = _432 * 2.0;
    float _582 = _524 + (-1.0);
    float _584 = _552 + (-1.0);
    float _586 = _558 + (-1.0);
    float _588 = floor(_578);
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _592 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _596 = _576 ? 0 : 1;
    float _598 = fma(_424, _556, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _600 = !_518;
    int _602 = _600 ? 0 : 1;
    float _604 = fma(_498, _556, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _606 = floor(_580);
    float _608 = fma(_528, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _610 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _612 = isnan(_366);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _382 + (-0.5);
    int _624 = ~_596;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _630;
    int _634 = _628;
    if (!_554)
    {
        int _636 = ~_596;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _644 = _588 > 0.0;
    float _646 = fma(_632, _556, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _648 = _588 >= 0.0;
    bool _650 = isnan(_588);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _662 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _664 = isnan(_366);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    bool _674 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _676 = isnan(_366);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _688 = _656 ? 0 : 1;
    float _690 = fma(_660, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _692 = _606 > 0.0;
    float _694 = -_684;
    float _696 = _694 + 1.0;
    bool _698 = _606 >= 0.0;
    bool _700 = isnan(_606);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -_672;
    float _710 = _708 + 1.0;
    float _712 = _620 * _696;
    float _714 = -_620;
    float _716 = _714 + 1.0;
    float _718 = _684 * _710;
    float _720 = _472 + _446;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _722;
    float _726 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _728 = _420 * _716;
    float _730 = fma(_504, _466, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _732 = _500 + _464;
    float _734 = fma(_724, _466, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _736 = _476 + _474;
    float _738 = _726 * _642;
    float _740 = _604 * _728;
    float _742 = _598 * _728;
    float _744 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _746 = _646 * _728;
    float _748 = -_420;
    float _750 = _748 + 1.0;
    float _752 = fma(_480, _466, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _754 = ~_688;
    int _756 = _754 + 1;
    int _758 = _756 + 1;
    float _760 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[203].x, _738);
    int _762 = _758;
    if (!_644)
    {
        int _764 = ~_688;
        int _766 = _764 + 1;
        _762 = _766;
    }
    int _768 = _762;
    float _770 = _744 * _686;
    bool _772 = !_522;
    int _774 = _772 ? 0 : 1;
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].x, _742);
    bool _778 = !_550;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].y, _740);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _794 = _792 != 0;
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].z, _746);
    float _798 = floor(_760);
    float _800 = _760 + 0.25;
    int _802 = _706 ? 0 : 1;
    float _804 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[203].z, _770);
    bool _806 = !_786;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_608, _712, _782);
    bool _812 = !_790;
    int _814 = _812 ? 0 : 1;
    float _816 = fma(_690, _712, _796);
    float _818 = floor(_800);
    int _820 = abs(_808);
    float _822 = fma(_734, _718, _810);
    int _824 = ~_802;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = fma(_752, _718, _816);
    int _832 = abs(_814);
    float _834 = in.m_73.z;
    int _836 = _828;
    if (!_692)
    {
        int _838 = ~_802;
        int _840 = _838 + 1;
        _836 = _840;
    }
    int _842 = _836;
    float _844 = -_798;
    float _846 = _760 + _844;
    float _848 = float(_820);
    float _850 = _760 * 6.283185482025146484375;
    float _852 = float(_768);
    float _854 = floor(_804);
    float _856 = float(_832);
    float _858 = in.m_75.x;
    float _860 = in.m_75.y;
    float _862 = in.m_75.z;
    float _864 = float(_640);
    float _866 = fma(_530, _712, _776);
    int _868 = abs(_602);
    float _870 = _856 * _852;
    float _872 = -_818;
    float _874 = _800 + _872;
    float _876 = _850 * 0.15915493667125701904296875;
    bool _878 = _846 >= 0.5;
    bool _880 = isnan(_846);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.5);
    bool _886 = _882 || _884;
    float _888 = _870 * (-2.0);
    float _890 = _848 * _864;
    int _892 = abs(_534);
    float _894 = _876 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = fma(_590, _888, _590);
    bool _900 = !_886;
    float _902 = _900 ? 0.5 : (-0.5);
    float _904 = _804 * 6.283185482025146484375;
    float _906 = float(_868);
    float _908 = -_854;
    float _910 = _804 + _908;
    bool _912 = _874 > 0.5;
    float _914 = _902 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _916 = _914 * 2.0;
    float _918 = _904 * 0.15915493667125701904296875;
    int _920 = abs(_774);
    float _922 = _890 * (-2.0);
    float _924 = _906 * _916;
    float _926 = float(_892);
    float _928 = _918 * 6.283185482025146484375;
    float _930 = sin(_928);
    bool _932 = _910 >= 0.5;
    bool _934 = isnan(_910);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    float _942 = fma(_888, _860, _860);
    float _944 = _896 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _946 = !_546;
    int _948 = _946 ? 0 : 1;
    float _950 = _432 + (-0.5);
    float _952 = _874;
    if (_912)
    {
        float _954 = -_874;
        float _956 = _954 + 1.0;
        _952 = _956;
    }
    float _958 = _952;
    float _960 = fma(_926, _944, _924);
    float _962 = _804 + 0.25;
    int _964 = abs(_948);
    float _966 = fma(_958, 4.0, -1.0);
    bool _968 = !_542;
    int _970 = _968 ? 0 : 1;
    float _972 = floor(_962);
    bool _974 = !_940;
    float _976 = _974 ? 0.5 : (-0.5);
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _980 = float(_920);
    float _982 = _930 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _984 = abs(_970);
    float _986 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _942);
    float _988 = float(_964);
    float _990 = _976 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _992 = _990 * 2.0;
    float _994 = fma(_980, _978, _960);
    float _996 = float(_984);
    float _998 = fma(_898, _566, _986);
    float _1000 = _988 * _992;
    float _1002 = fma(_994, 3.1415927410125732421875, _858);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _732 + _1004;
    float _1008 = -_972;
    float _1010 = _962 + _1008;
    float _1012 = fma(_996, _982, _1000);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = _720 + _1014;
    float _1018 = precise::min((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _736 + _1020;
    bool _1024 = _1010 > 0.5;
    float _1026 = _1016 * _1016;
    float _1028 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1030 = fma(_594, _922, _594);
    float _1032 = fma(_1002, _922, _1002);
    bool _1034 = !_794;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _1022 * _1022;
    float _1040 = -_1018;
    float _1042 = _1040 + _1028;
    float _1044 = fma(_1006, _1006, _1026);
    int _1046 = abs(_780);
    float _1048 = _408 + (-0.5);
    int _1050 = abs(_1036);
    float _1052 = 1.0 / _1042;
    float _1054 = _1010;
    if (_1024)
    {
        float _1056 = -_1010;
        float _1058 = _1056 + 1.0;
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1038 + _1044;
    float _1064 = float(_1046);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1032);
    float _1068 = fma(_1060, 4.0, -1.0);
    float _1070 = fma(_730, _718, _866);
    float _1072 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].y, _822);
    float _1074 = sqrt(_1062);
    float _1076 = _998 * 0.15915493667125701904296875;
    float _1078 = float(_842);
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = float(_1050);
    float _1084 = fma(_1030, _566, _1066);
    float _1086 = in.m_73.y;
    float _1088 = fma(_1064, _1080, _1012);
    float _1090 = _1076 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1082 * _1078;
    float _1096 = _1084 * 0.15915493667125701904296875;
    float _1098 = fma(_1088, 3.1415927410125732421875, _862);
    float _1100 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1070);
    float _1102 = _1094 * (-2.0);
    float _1104 = in.m_77.x;
    float _1106 = in.m_77.y;
    float _1108 = in.m_77.z;
    float _1110 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].z, _830);
    float _1112 = _1076 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = fma(_1098, _1102, _1098);
    float _1118 = fma(_592, _1102, _592);
    float _1120 = precise::max(_1018, _1074);
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _1124 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1116);
    float _1126 = precise::min(_1028, _1120);
    float _1128 = _1096 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = fma(_1118, _566, _1124);
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _482);
    float _1136 = -_1018;
    float _1138 = _1136 + _1126;
    float _1140 = _1132 * 0.15915493667125701904296875;
    float _1142 = _1096 * 6.283185482025146484375;
    float _1144 = cos(_1142);
    float _1146 = -_1138;
    float _1148 = fma(_1146, _1052, 1.0);
    float _1150 = _1148 * _1086;
    float _1152 = _1100 * _1104;
    float _1154 = _1072 * _1106;
    float _1156 = _1140 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    float _1160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1150);
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1166 = _1110 * _1108;
    float _1168 = _1130 * _1092;
    float _1170 = _1162 * _1134;
    float _1172 = _1164 * _1160;
    float _1174 = _1140 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = _1144 * _1114;
    float _1180 = _1144 * _1092;
    float _1182 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1184 = _1130 * _1114;
    float _1186 = _1182 * _1122;
    float _1188 = _1144 * _1158;
    float _1190 = _1130 * _1158;
    float _1192 = _1114 * _1158;
    float _1194 = _1092 * _1158;
    float _1196 = _1188 * _1172;
    float _1198 = in.m_79.y;
    float _1200 = fma(_1176, _1178, _1168);
    float _1202 = -_1172;
    float _1204 = _1176 * _1202;
    float _1206 = -_1184;
    float _1208 = fma(_1176, _1180, _1206);
    float _1210 = -_1180;
    float _1212 = fma(_1176, _1184, _1210);
    float _1214 = fma(_1200, _1170, _1196);
    float _1216 = _1190 * _1172;
    float _1218 = fma(_1192, _1170, _1204);
    float _1220 = fma(_1176, _1168, _1178);
    float _1222 = fma(_1208, _1186, _1214);
    float _1224 = fma(_1212, _1170, _1216);
    float _1226 = fma(_1194, _1186, _1218);
    float _1228 = _1222 * _324;
    float _1230 = fma(_1220, _1186, _1224);
    float _1232 = _1222 * _310;
    float _1234 = _1222 * _320;
    float _1236 = fma(_1226, _292, _1228);
    float _1238 = fma(_1226, _284, _1232);
    float _1240 = fma(_1226, _288, _1234);
    float _1242 = fma(_1230, _336, _1236);
    float _1244 = fma(_1230, _328, _1238);
    float _1246 = fma(_1230, _332, _1240);
    float _1248 = _736 + _1242;
    float _1250 = _720 + _1244;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1254 = _1248 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1258 = _1250 + _1256;
    float _1260 = _1254 * _1254;
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = _1264 + _1268;
    float _1272 = _1242;
    float _1274 = _1234;
    float _1276 = _1230;
    float _1278 = _1264;
    float _1280 = _1170;
    float _1282 = _1246;
    float _1284 = _1258;
    if (_1266)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1286;
    }
    float _1288 = _1272;
    if (!_1266)
    {
        _1274 = _1248;
    }
    float _1290 = _1274;
    float _1292 = _1290;
    if (_1266)
    {
        float _1294 = rsqrt(_1262);
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1296;
    if (_1266)
    {
        float _1300 = _1270 * _1288;
        _1278 = _1300;
    }
    float _1302 = _1278;
    if (_1266)
    {
        float _1304 = _1302 * 0.15915493667125701904296875;
        _1280 = _1304;
    }
    float _1306 = _1280;
    float _1308 = _374 + _1198;
    float _1310 = _1288;
    float _1312 = _1306;
    if (_1266)
    {
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = _1308 + _1246;
    if (!_1266)
    {
        _1282 = _1250;
    }
    float _1322 = _1282;
    float _1324 = _1322;
    if (_1266)
    {
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _560 = _1326;
    }
    float _1328 = _560;
    float _1330 = _1328;
    float _1332 = _1318;
    if (_1266)
    {
        float _1334 = fma(_1318, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1330 = _1334;
    }
    float _1336 = _1330;
    if (_1266)
    {
        float _1338 = _1296 * _1336;
        _1298 = _1338;
    }
    float _1340 = _1298;
    if (_1266)
    {
        float _1342 = fma(_1258, _1340, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1324 = _1342;
    }
    float _1344 = _1324;
    float _1346 = _1344;
    if (_1266)
    {
        float _1348 = fma(_1254, _1340, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1292 = _1348;
    }
    float _1350 = _1292;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1354 = _1344 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1358 = _1350 + _1356;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1362 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4871 = float2(_1360, _1362);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4871, float2(0.0), isnan(_4871)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4871, float2(0.0), isnan(_4871)), level(0.0)).x;
    float _1366 = _1340;
    float _1368 = _1354;
    float _1370 = _1358;
    float _1372 = _1362;
    float _1374 = _1350;
    if (_1266)
    {
        float _1376 = _1306 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        _1366 = _1378;
    }
    float _1380 = _1366;
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1390 = _1386 || _1388;
    if (!_1266)
    {
        _1368 = _1320;
    }
    float _1392 = _1368;
    float _1394 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1396 = _1392;
    if (!_1390)
    {
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1284 = _1398;
    }
    float _1400 = _1284;
    if (_1266)
    {
        float _1402 = _1380 + (-1.0);
        _1332 = _1402;
    }
    float _1404 = _1332;
    float _1406 = _1404;
    if (_1266)
    {
        float _1408 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1370 = _1408;
    }
    float _1410 = _1370;
    float _1412 = _1410;
    if (!_1390)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _1312 = _1414;
    }
    float _1416 = _1312;
    if (_1266)
    {
        float _1418 = fma(_1320, _1380, _1410);
        _1396 = _1418;
    }
    float _1420 = _1396;
    float _1422 = _1420;
    if (!_1390)
    {
        float _1424 = -_1308;
        float _1426 = _1424 + _1420;
        _1372 = _1426;
    }
    float _1428 = _1372;
    float _1430 = floor(_1394);
    float _1432 = -_1430;
    float _1434 = _1394 + _1432;
    float _1436 = fma(_1364, 100.0, _1308);
    float _1438 = fma(_1364, 100.0, _1420);
    float _1440 = _1364;
    float _1442 = _1438;
    if (!_1390)
    {
        float _1444 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _1422 = _1444;
    }
    float _1446 = _1422;
    float _1448 = _1446;
    if (!_1390)
    {
        float _1450 = -_736;
        float _1452 = _1450 + _1350;
        _1440 = _1452;
    }
    float _1454 = _1440;
    if (!_1390)
    {
        float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1458 = _1436 + _1456;
        _1412 = _1458;
    }
    float _1460 = _1412;
    float _1462 = _1460;
    if (!_1390)
    {
        float _1464 = fma(_1460, _1460, _1026);
        _1462 = _1464;
    }
    float _1466 = _1462;
    float _1468 = _1466;
    if (!_1390)
    {
        float _1470 = _1038 + _1466;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = _1472;
    if (!_1390)
    {
        float _1476 = sqrt(_1472);
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (!_1390)
    {
        float _1480 = precise::min(_1478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1406 = _1480;
    }
    float _1482 = _1406;
    float _1484 = _1482;
    if (!_1390)
    {
        float _1486 = _1482 * _1400;
        _1484 = _1486;
    }
    float _1488 = _1484;
    float _1490 = _1488;
    if (!_1390)
    {
        float _1492 = _1446 * _1488;
        _1448 = _1492;
    }
    float _1494 = _1448;
    if (!_1390)
    {
        float _1496 = -_720;
        float _1498 = _1496 + _1344;
        _1490 = _1498;
    }
    float _1500 = _1490;
    if (!_1390)
    {
        float _1502 = fma(_1428, _1494, _1436);
        _1442 = _1502;
    }
    float _1504 = _1442;
    if (!_1390)
    {
        float _1506 = fma(_1500, _1494, _720);
        _1346 = _1506;
    }
    float _1508 = _1346;
    if (!_1390)
    {
        float _1510 = fma(_1454, _1494, _736);
        _1374 = _1510;
    }
    float _1512 = _1374;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1504 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1508 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1512 + _1522;
    float _1526 = _1516 * _1516;
    float _1528 = fma(_1520, _1520, _1526);
    float _1530 = fma(_1524, _1524, _1528);
    float _1532 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1534 = rsqrt(_1530);
    float _1536 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1532);
    float _1538 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1536);
    float _1540 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1542 = sqrt(_1530);
    float _1544 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1540);
    float _1548 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1546);
    float _1550 = 1.0 / _1544;
    float _1552 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1556 = _1520 * _1552;
    float _1558 = _1524 * _1552;
    float _1560 = _1554 + _1544;
    float _1562 = _1556 * _1556;
    float _1564 = _1558 * _1558;
    float _1566 = _1562 + _1564;
    float _1568 = _1560 * _1550;
    float _1570 = _1568 * 0.5;
    float _1572 = sqrt(_1566);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1576 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1574);
    float _1578 = 1.0 / _1576;
    bool _1580 = _1572 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1584 = _1572 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1588 = _1578 * _1586;
    bool _1590 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1592 = _1320;
    float _1594 = _1566;
    int _1596 = 2;
    float _1598 = _1576;
    float _1600 = _1516;
    float _1602 = _1556;
    float _1604 = _1558;
    float _1606 = _1562;
    if (_1580)
    {
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1608;
    }
    float _1610 = _1592;
    bool _1612 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1614 = !_1590;
    int _1616 = _1614 ? 0 : 1;
    if (_1580)
    {
        float _1618 = rsqrt(_1566);
        _1594 = _1618;
    }
    float _1620 = _1594;
    if (!_1590)
    {
        _1596 = 1;
    }
    int _1622 = _1596;
    int _1624 = _1622;
    if (!_1612)
    {
        _1624 = _1616;
    }
    int _1626 = _1624;
    if (_1580)
    {
        float _1628 = _1584 * _1610;
        _1598 = _1628;
    }
    float _1630 = _1598;
    int _1632 = _1626 << 6;
    float _1634 = 0.0;
    if (_1580)
    {
        float _1636 = _1630 * 0.15915493667125701904296875;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1642 = _1632 + 64;
    uint _1645 = uint(int(uint(_1642) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    float _1661 = 0.0;
    if (_1580)
    {
        float _1663 = _1638 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        _1661 = _1665;
    }
    float _1667 = _1661;
    float _1669 = precise::max(0.0, _1640);
    int _1671 = _1632 + 96;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    float _1689 = 0.0;
    float _1691 = _1669;
    if (_1580)
    {
        float _1693 = _1638 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        _1689 = _1695;
    }
    float _1697 = _1689;
    float _1699 = -_1552;
    float _1701 = -_1669;
    float _1703 = fma(_1516, _1699, _1701);
    if (_1580)
    {
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1705;
    }
    float _1707 = _1600;
    int _1709 = _1632 + 48;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.vp_c15)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    float _1727 = _1707;
    if (_1580)
    {
        float _1729 = _1667 + (-1.0);
        _1691 = _1729;
    }
    float _1731 = _1691;
    float _1733 = 0.0;
    if (_1580)
    {
        float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1733 = _1735;
    }
    float _1737 = _1733;
    int _1739 = _1632 + 104;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    uint _1743 = uint(int(uint(int(_1741)) >> uint(2)));
    int _1745 = int(_1741) & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    int _1749 = int(_1741) + 1;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    int _1753 = _1749 & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    float _1757 = 0.0;
    if (_1580)
    {
        float _1759 = fma(_1697, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = _1761;
    if (!_1580)
    {
        _1727 = _1703;
    }
    float _1765 = _1727;
    float _1767 = _1765;
    if (_1580)
    {
        float _1769 = fma(_1703, _1667, _1737);
        _1767 = _1769;
    }
    float _1771 = _1767;
    float _1773 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1775 = _1773;
    if (_1580)
    {
        float _1777 = _1620 * _1761;
        _1763 = _1777;
    }
    float _1779 = _1763;
    int _1781 = _1632 + 80;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    if (_1580)
    {
        float _1799 = _1556 * _1779;
        _1602 = _1799;
    }
    float _1801 = _1602;
    float _1803 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1773);
    if (_1580)
    {
        float _1805 = _1558 * _1779;
        _1604 = _1805;
    }
    float _1807 = _1604;
    if (!_1580)
    {
        _1775 = _1564;
    }
    float _1809 = _1775;
    float _1811 = _1809;
    if (_1580)
    {
        float _1813 = _1801 * _1801;
        _1606 = _1813;
    }
    float _1815 = _1606;
    float _1817 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1803);
    float _1819 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1821 = _1632 + 56;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    if (_1580)
    {
        float _1839 = _1807 * _1807;
        _1811 = _1839;
    }
    float _1841 = _1811;
    float _1843 = fma(_1771, _1771, _1815);
    float _1845 = _1436 + _1819;
    float _1847 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1849 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1851 = _1843 + _1841;
    int _1853 = _1632 + 72;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[int(_1865)][_1867];
    float _1871 = _1845 * _1659;
    float _1873 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1875 = rsqrt(_1851);
    float _1877 = _1845 * _1687;
    float _1879 = fma(_720, _1679, _1877);
    float _1881 = _1845 * _1725;
    float _1883 = -_1873;
    float _1885 = fma(_1883, _1849, 1.0);
    float _1887 = fma(_720, _1651, _1871);
    float _1889 = _1875 * _1801;
    float _1891 = fma(_720, _1717, _1881);
    float _1893 = log2(_1885);
    float _1895 = fma(_736, _1747, _1879);
    int _1897 = _1632 + 88;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
    int _1903 = int(_1899) & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    int _1907 = int(_1899) + 1;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    int _1911 = _1907 & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    float _1915 = _1895 + _1755;
    float _1917 = _1845 * _1797;
    float _1919 = 1.0 / _1915;
    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1923 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1921);
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = fma(_720, _1789, _1917);
    float _1929 = -_1925;
    float _1931 = _1929 + 1.0;
    float _1933 = _1893 * 0.693147182464599609375;
    float _1935 = fma(_736, _1829, _1891);
    float _1937 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1939 = _1935 + _1837;
    float _1941 = fma(_736, _1861, _1887);
    float _1943 = _1875 * _1771;
    float _1945 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1947 = _1875 * _1807;
    float _1949 = _1941 + _1869;
    float _1951 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1937);
    float _1953 = -_1945;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1959 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1951);
    float _1963 = -_1947;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1967 = abs(_1931);
    float _1969 = log2(_1967);
    float _1971 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1973 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1975 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1977 = _1949 * _1919;
    float _1979 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1971);
    float _1981 = _1939 * _1919;
    float _1983 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1985 = floor(_1957);
    float _1987 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1989 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1975);
    bool _1991 = _1981 >= 0.0;
    float _1993 = fma(_1965, -0.5, 0.5);
    float _1995 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1983);
    float _1997 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1989);
    bool _1999 = _1981 <= 1.0;
    bool _2001 = _1999 && _1991;
    float _2003 = fma(_1965, 0.5, 0.5);
    float _2005 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1995);
    float _2007 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2009 = _1977 >= 0.0;
    bool _2011 = _2009 && _2001;
    float _2013 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2015 = fma(_736, _1905, _1927);
    float _2017 = sqrt(_1993);
    bool _2019 = _1977 <= 1.0;
    bool _2021 = _2019 && _2011;
    float _2023 = -_1985;
    float _2025 = _1957 + _2023;
    float _2027 = fma(_2003, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2029 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2005);
    float _2031 = _2015 + _1913;
    float _2033 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2035 = fma(_2003, _2027, -0.212114393711090087890625);
    float _2037 = exp2(_2013);
    float _2039 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2041 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2033);
    float _2043 = fma(_2003, _2035, 1.570728778839111328125);
    float _2045 = _1943 + 1.0;
    float _2047 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2039);
    float _2049 = _2035;
    float _2051 = _1845;
    if (_2021)
    {
        float _2053 = float(_1626);
        _2049 = _2053;
    }
    float _2055 = _2049;
    float _2057 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2041);
    float _2059 = 1.0 / _2029;
    float _2061 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2047);
    float _2063 = _2017 * 0.636619746685028076171875;
    float _2065 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2057);
    float _2067 = _2031 * _1919;
    float _2069 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2061);
    float _2071 = -_2043;
    float _2073 = fma(_2063, _2071, 1.0);
    float _2075 = _2055;
    if (_2021)
    {
        float _2077 = rint(_2055);
        float _2079 = precise::max(_2077, 0.0);
        uint _2081 = uint(_2079);
        uint _2083 = clamp(_2081, 0u, 65535u);
        _2075 = as_type<float>(_2083);
    }
    float _2085 = _2075;
    float _2087 = -_1943;
    float _2089 = fma(_2037, _2045, _2087);
    float _2091 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6090 = float2(_1434, _2025);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6090, float2(0.0), isnan(_6090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6090, float2(0.0), isnan(_6090)), level(0.0)).x;
    float _2095 = fma(_2089, 0.5, 0.5);
    float _2097 = _2065 * _2059;
    float _2099 = _2069 * _2059;
    float _2101 = fma(_2097, 0.5, 0.5);
    float _2103 = fma(_2099, -0.5, 0.5);
    float _2105 = _1977;
    if (_2021)
    {
        float3 _6116 = float3(_1981, _1977, float(as_type<int>(_2085)));
        float3 _6120 = select(_6116, float3(0.0), isnan(_6116));
        float _2107 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6120.xy, uint(rint(_6120.z)), _2067, level(0.0));
        _2105 = _2107;
    }
    float _2109 = _2105;
    float3 _6130 = float3(_2101, _2103, _2091);
    float _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6130, float3(0.0), isnan(_6130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6130, float3(0.0), isnan(_6130)), level(0.0)).x;
    float3 _6139 = float3(_2101, _2103, _2091);
    float4 _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6139, float3(0.0), isnan(_6139)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level(0.0)).xyzw;
    float _2116 = _2114.x;
    float _2118 = _2114.y;
    float _2120 = _2114.z;
    float _2122 = _2114.w;
    float2 _6155 = float2(_2073, _2095);
    float3 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6155, float2(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6155, float2(0.0), isnan(_6155)), level(0.0)).xyz;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2136 = in.m_81.y;
    float _2138 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2140 = _1150 != 0.0;
    bool _2142 = isnan(_1150);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = _2134 * _408;
    bool _2152 = _432 > 0.5;
    float _2154 = _2138 * _408;
    bool _2156 = _482 == 0.0;
    bool _2158 = !_2148;
    bool _2160 = _2156 && _2158;
    float _2162 = trunc(_2150);
    int _2164 = int(_2162);
    bool _2166 = _834 == 0.0;
    bool _2168 = _2166 && _2160;
    int _2170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2172 = _2170 != 0;
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2176 = _2174 != 0;
    float _2178 = trunc(_2154);
    int _2180 = int(_2178);
    float _2182 = in.m_81.x;
    bool _2184 = _408 > 0.5;
    bool _2186 = _2184 && _2172;
    int _2188 = _2164 << 4;
    int _2190 = _2188 + 1712;
    float _2192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2194 = in.m_83.x;
    float _2196 = in.m_83.y;
    float _2198 = in.m_83.z;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _2202 = uint(int(uint(_2190) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = _2180 << 4;
    int _2220 = _2218 + 1968;
    float _2222 = -_2136;
    float _2224 = _2222 + 1.0;
    int _2226 = _2190 + 8;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    uint _2230 = uint(int(uint(int(_2228)) >> uint(2)));
    int _2232 = int(_2228) & 3;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[int(_2230)][_2232];
    float _2236 = _2136;
    if (_2176)
    {
        float _2238 = _2152 ? _2224 : _2136;
        _2236 = _2238;
    }
    float _2240 = _2236;
    float _2242 = 0.0;
    if (_2172)
    {
        _2242 = _2182;
    }
    float _2244 = _2242;
    float _2246 = _2244;
    if (!_2172)
    {
        _562 = _2182;
    }
    float _2248 = _562;
    uint _2250 = uint(int(uint(_2220) >> uint(2)));
    uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
    int _2254 = int(_2250) & 3;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[int(_2252)][_2254];
    int _2258 = int(_2250) + 1;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    int _2262 = _2258 & 3;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[int(_2260)][_2262];
    float _2266 = _2248;
    if (_2186)
    {
        float _2268 = -_2244;
        float _2270 = _2268 + 1.0;
        _2246 = _2270;
    }
    float _2272 = _2246;
    float _2274 = _2196;
    float _2276 = _2194;
    float _2278 = _2198;
    if (!_2168)
    {
        float _2280 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2196);
        _2274 = _2280;
    }
    float _2282 = _2274;
    if (!_2168)
    {
        float _2284 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2194);
        _2276 = _2284;
    }
    float _2286 = _2276;
    if (!_2168)
    {
        float _2288 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2198);
        _2278 = _2288;
    }
    float _2290 = _2278;
    int _2292 = _2220 + 8;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    uint _2296 = uint(int(uint(int(_2294)) >> uint(2)));
    int _2298 = int(_2294) & 3;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[int(_2296)][_2298];
    float _2302 = _1188 * _2282;
    float _2304 = -_2282;
    float _2306 = _1176 * _2304;
    float _2308 = _1190 * _2282;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2312 = fma(_1200, _2286, _2302);
    float _2314 = fma(_1192, _2286, _2306);
    float _2316 = fma(_1212, _2286, _2308);
    if (_2172)
    {
        _2266 = _2272;
    }
    float _2318 = _2266;
    float _2320 = fma(_1208, _2290, _2312);
    float _2322 = fma(_1194, _2290, _2314);
    float _2324 = fma(_1220, _2290, _2316);
    float _2326 = _2320 * _310;
    float _2328 = _2320 * _320;
    float _2330 = _2320 * _324;
    float _2332 = fma(_2322, _284, _2326);
    float _2334 = fma(_2322, _288, _2328);
    float _2336 = fma(_2322, _292, _2330);
    float _2338 = fma(_2324, _328, _2332);
    float _2340 = fma(_2324, _332, _2334);
    float _2342 = fma(_2324, _336, _2336);
    float _2344 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2346 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2348 = abs(_1588);
    float _2350 = log2(_2348);
    float _2352 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2354 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2344);
    float _2356 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2346);
    float _2358 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2360 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2362 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2354);
    float _2364 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2356);
    float _2366 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2368 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2370 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2372 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2374 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2376 = trunc(_2370);
    int _2378 = int(_2376);
    float _2380 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2382 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_85.x = _2366;
    out.m_85.y = _2368;
    out.m_85.z = _2374;
    out.m_85.w = _2200;
    float _2384 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2386 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2390 = trunc(_2372);
    int _2392 = int(_2390);
    float _2394 = _2300 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2396 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = exp2(_2382);
    float _2402 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2404 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_87.x = _2388;
    out.m_87.y = _2396;
    out.m_87.z = _2398;
    float _2406 = _2402 * _2310;
    float _2408 = _2404 * _2192;
    int _2410 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2412 = _2392 + _2410;
    int _2414 = _2412 + 1;
    out.m_89.x = _2408;
    out.m_89.y = _2406;
    bool _2416 = _1588 <= 8000.0;
    bool _2418 = isnan(_1588);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan(8000.0);
    bool _2424 = _2420 || _2422;
    float _2426 = float(_2424);
    float _2428 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2430 = precise::clamp(_2428, 0.0, 1.0);
    int _2432 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2434 = _2378 + _2432;
    int _2436 = _2434 + 1;
    float _2438 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2384);
    float _2440 = in.m_91.x;
    bool _2442 = _2436 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2444 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2438);
    int _2446 = _2436 | _2414;
    float _2448 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2450 = fma(_2430, -2.0, 3.0);
    float _2452 = _2430 * _2430;
    bool _2454 = _2446 < 0;
    bool _2456 = _2454 || _2442;
    float _2458 = exp2(_2448);
    bool _2460 = _2414 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2462 = _2460 || _2456;
    float _2464 = _2452 * _2450;
    float _2466 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2444);
    float _2468 = -_2464;
    float _2470 = _2468 + 1.0;
    float _2472 = _2466 + _2029;
    float _2474 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2476 = _2472 * 0.5;
    float _2478 = _2472;
    float _2480 = _2476;
    if (_2462)
    {
        _2478 = 1.0;
    }
    float _2482 = _2478;
    float _2484 = _2482;
    float _2486 = _2440;
    if (!_2462)
    {
        int _2488 = _2414 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2490 = _2488 + _2436;
        float _2492 = floor(_2372);
        int _2494 = _2490 << 2;
        uint _2496 = uint(int(uint(_2490) >> uint(2)));
        int _2498 = 12 & _2494;
        int _2500 = int(_2496) << 4;
        int _2502 = _2500 + _2498;
        float _2504 = floor(_2370);
        float _2506 = -_2492;
        float _2508 = _2372 + _2506;
        int _2510 = _2502 + 400;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        uint _2514 = uint(int(uint(int(_2512)) >> uint(2)));
        int _2516 = int(_2512) & 3;
        float _2518 = (*spvDescriptorSet0.vp_c15)._m0[int(_2514)][_2516];
        float _2520 = -_2504;
        float _2522 = _2370 + _2520;
        float _2524 = rint(_2518);
        float _2526 = precise::max(_2524, 0.0);
        uint _2528 = uint(_2526);
        uint _2530 = clamp(_2528, 0u, 65535u);
        float3 _6827 = float3(_2522, _2508, float(int(_2530)));
        float3 _6829 = select(_6827, float3(0.0), isnan(_6827));
        float _2532 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6829.xy, uint(rint(_6829.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6829.xy, uint(rint(_6829.z)), level(0.0)).x;
        int _2534 = _2490 << 4;
        int _2536 = _2534 + 2048;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        uint _2540 = uint(int(uint(int(_2538)) >> uint(2)));
        int _2542 = int(_2538) & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = int(_2538) + 1;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        int _2550 = _2546 & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        int _2554 = _2536 + 8;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        uint _2558 = uint(int(uint(int(_2556)) >> uint(2)));
        int _2560 = int(_2556) & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        int _2564 = int(_2556) + 1;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        int _2568 = _2564 & 3;
        float _2570 = (*spvDescriptorSet0.vp_c15)._m0[int(_2566)][_2568];
        float _2572 = _1845 * _2552;
        float _2574 = fma(_720, _2544, _2572);
        float _2576 = fma(_736, _2562, _2574);
        float _2578 = _2576 + _2570;
        float _2580 = precise::clamp(_2578, 0.0, 1.0);
        float _2582 = -_2580;
        float _2584 = _2582 + _2532;
        float _2586 = fma(_2584, 500.0, 1.5);
        float _2588 = exp2(_2586);
        float _2590 = 0.0 + _2588;
        float _2592 = precise::clamp(_2590, 0.0, 1.0);
        _2051 = _2588;
        _2484 = _2592;
    }
    float _2594 = _2051;
    float _2596 = _2484;
    float _2598 = _2426 * _2474;
    float _2600 = in.m_91.z;
    float _2602 = -_2458;
    float _2604 = _2602 + 1.0;
    float _2606 = -_2093;
    float _2608 = _2606 + 1.0;
    float _2610 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = in.m_91.w;
    float _2614 = _2594;
    if (!_2021)
    {
        _2614 = 1.0;
    }
    float _2616 = _2614;
    float _2618 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2620 = _2616;
    if (_2021)
    {
        bool _2622 = _2109 >= _2067;
        bool _2624 = isnan(_2109);
        bool _2626 = _2622 || _2624;
        bool _2628 = isnan(_2067);
        bool _2630 = _2626 || _2628;
        float _2632 = float(_2630);
        _2620 = _2632;
    }
    float _2634 = _2620;
    float _2636 = _2608 * _2610;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    out.gl_Position.x = _2065;
    out.gl_Position.y = _2069;
    out.gl_Position.z = _2466;
    out.gl_Position.w = _2029;
    float _2640 = _2618 * _2111;
    float _2642 = -_2618;
    float _2644 = _2642 + 1.0;
    float _2646 = _2634 * _2596;
    float _2648 = -_2638;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = _2132 * _2640;
    out.m_93.z = _2476;
    out.m_93.w = _2029;
    bool _2654 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1542);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = -_2646;
    float _2666 = fma(_2664, _2650, 1.0);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = in.m_91.y;
    float _2672 = _2122 * _2640;
    float _2674 = _2122 * _2644;
    float _2676 = _2668 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2678 = fma(_2122, _2652, _2120);
    float _2680 = fma(_2128, _2672, _2116);
    float _2682 = fma(_2130, _2672, _2118);
    out.m_95.z = _2600;
    float _2684 = _2644;
    float _2686 = _2646;
    float _2688 = _2668;
    if (!_2662)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2690 = _2684;
    float _2692 = _2690;
    float _2694 = _2690;
    if (!_2662)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2696 = _2480;
    out.m_95.w = _2612;
    float _2698 = _2696;
    float _2700 = _2696;
    if (!_2662)
    {
        _2686 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2702 = _2686;
    float _2704 = _2702;
    float _2706 = _2702;
    if (!_2662)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2708 = _2688;
    out.m_97.x = _2676;
    out.m_99.x = _2680;
    out.m_99.y = _2682;
    out.m_99.z = _2678;
    out.m_99.w = _2674;
    out.m_101.x = _2338;
    out.m_101.y = _2340;
    out.m_101.z = _2342;
    out.m_95.x = _2440;
    out.m_95.y = _2670;
    float _2710 = _2670;
    float _2712 = _2708;
    float _2714 = _2708;
    if (!_2662)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2486;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2662)
    {
        _2710 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2722 = _2710;
    bool _2724 = !_2662;
    float _2726 = _2722;
    float _2728 = _2722;
    if (!_2724)
    {
        bool _2730 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2732 = isnan(_1542);
        bool _2734 = _2730 || _2732;
        bool _2736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2738 = _2734 || _2736;
        if (!_2738)
        {
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2742 = _1542 + _2740;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2744;
            float _2748 = 1.0 / _2746;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2770 = _2742 * _2748;
            float _2772 = precise::clamp(_2770, 0.0, 1.0);
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2778 = fma(_2772, _2752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2780 = fma(_2772, _2776, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2782 = fma(_2772, _2756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2784 = fma(_2772, _2760, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2786 = fma(_2772, _2764, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2788 = fma(_2772, _2768, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2694 = _2778;
            _2728 = _2786;
            _2720 = _2780;
            _2706 = _2784;
            _2700 = _2782;
            _2714 = _2788;
            _2790 = true;
        }
        else
        {
            bool _2792 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2794 = isnan(_1542);
            bool _2796 = _2792 || _2794;
            bool _2798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2800 = _2796 || _2798;
            if (!_2800)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2802 = _2718;
            _2720 = _2802;
            if (!_2800)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2804 = _2692;
            _2694 = _2804;
            if (!_2800)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2806 = _2698;
            _2700 = _2806;
            if (!_2800)
            {
                _2704 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2808 = _2704;
            _2706 = _2808;
            if (!_2800)
            {
                _2726 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2810 = _2726;
            _2728 = _2810;
            if (!_2800)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2812 = _2712;
            bool _2814 = !_2800;
            _2714 = _2812;
            if (!_2814)
            {
                bool _2816 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2818 = isnan(_1542);
                bool _2820 = _2816 || _2818;
                bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2824 = _2820 || _2822;
                if (!_2824)
                {
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2828 = _1542 + _2826;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2832 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2830;
                    float _2834 = 1.0 / _2832;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2856 = _2828 * _2834;
                    float _2858 = precise::clamp(_2856, 0.0, 1.0);
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2864 = fma(_2858, _2838, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2866 = fma(_2858, _2862, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2868 = fma(_2858, _2842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2870 = fma(_2858, _2846, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2872 = fma(_2858, _2850, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2874 = fma(_2858, _2854, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2694 = _2864;
                    _2728 = _2872;
                    _2720 = _2866;
                    _2706 = _2870;
                    _2700 = _2868;
                    _2714 = _2874;
                    _2790 = true;
                }
                else
                {
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2728 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2706 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2790 = false;
    float _2876 = _2694;
    float _2878 = _2728;
    float _2880 = _2720;
    float _2882 = _2706;
    float _2884 = _2700;
    float _2886 = _2714;
    float _2888 = fma(_2340, -0.5, 0.5);
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = -_2876;
    float _2894 = _2892 + _2878;
    float _2896 = -_2880;
    float _2898 = _2896 + _2882;
    float _2900 = -_2884;
    float _2902 = _2900 + _2886;
    bool _2904 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2906 = fma(_2890, _2894, _2876);
    float _2908 = fma(_2890, _2898, _2880);
    float _2910 = fma(_2890, _2902, _2884);
    float _2912 = _2906 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2914 = fma(_2908, 0.298911988735198974609375, _2912);
    float _2916 = fma(_2910, 0.114477999508380889892578125, _2914);
    out.m_103.x = 0.0;
    float _2918 = -_2916;
    float _2920 = _2908 + _2918;
    float _2922 = -_2916;
    float _2924 = _2906 + _2922;
    float _2926 = -_2916;
    float _2928 = _2910 + _2926;
    float _2930 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2932 = fma(_2920, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    out.m_97.w = _2930;
    out.m_105.x = _2932;
    out.m_105.y = _2934;
    out.m_105.z = _2936;
    if (!_2904)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2938 = -_1504;
    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2942 = -_1508;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2946 = -_1512;
    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2950 = _2940 * _2940;
    float _2952 = fma(_2944, _2944, _2950);
    float _2954 = fma(_2948, _2948, _2952);
    float _2956 = sqrt(_2954);
    float _2958 = rsqrt(_2954);
    float _2960 = -_2956;
    float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2964 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2966 = precise::clamp(_2964, 0.0, 1.0);
    float _2968 = _2944 * _2958;
    float _2970 = _2940 * _2958;
    float _2972 = abs(_2966);
    float _2974 = log2(_2972);
    float _2976 = _2948 * _2958;
    float _2978 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2980 = _2340 * _2970;
    float _2982 = -_2970;
    float _2984 = -_2978;
    float _2986 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2984);
    float _2988 = fma(_2338, _2968, _2980);
    float _2990 = -_2976;
    float _2992 = fma(_2990, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2986);
    float _2994 = fma(_2342, _2976, _2988);
    float _2996 = precise::clamp(_2994, 0.0, 1.0);
    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3000 = _2992 + _2998;
    float _3002 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3004 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3006 = precise::clamp(_3004, 0.0, 1.0);
    float _3008 = exp2(_3002);
    float _3010 = _3008 * _3006;
    float _3012 = _2996 * _3010;
    float _3014 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3016 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3018 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _3014;
    out.m_103.y = _3016;
    out.m_103.z = _3018;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2790 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_61.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3075 = as_type<float>(_140);
        out.gl_Position.z = _3075;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3144 = as_type<float>(_178);
        out.gl_Position.z = _3144;
    }
    if (_172)
    {
        return out;
    }
    float _180 = in.m_65.x;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = in.m_67.x;
    float _188 = in.m_67.y;
    float _190 = in.m_67.z;
    float _192 = in.m_69.x;
    float _194 = in.m_69.y;
    float _196 = in.m_69.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    if (_222)
    {
        float _228 = rsqrt(_210);
        _226 = _228;
    }
    float _230 = _226;
    float _232 = 0.0;
    if (!_222)
    {
        _232 = 0.0;
    }
    float _234 = _232;
    bool _236 = _220 > 0.0;
    float _238 = 0.0;
    float _240 = _234;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _220;
    float _252 = _248;
    if (_224)
    {
        float _254 = rsqrt(_212);
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_224)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = 0.0;
    float _264 = _260;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    if (_236)
    {
        float _278 = rsqrt(_214);
        _274 = _278;
    }
    float _280 = _274;
    if (_222)
    {
        float _282 = _230 * _186;
        _240 = _282;
    }
    float _284 = _240;
    if (_222)
    {
        float _286 = _230 * _180;
        _246 = _286;
    }
    float _288 = _246;
    if (_222)
    {
        float _290 = _230 * _192;
        _252 = _290;
    }
    float _292 = _252;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _296 = 0.0;
    if (!_236)
    {
        _296 = 0.0;
    }
    float _298 = _296;
    float _300 = 0.0;
    float _302 = _298;
    if (!_236)
    {
        _300 = 0.0;
    }
    float _304 = _300;
    float _306 = _304;
    if (_224)
    {
        float _308 = _256 * _188;
        _264 = _308;
    }
    float _310 = _264;
    float _312 = 0.0;
    if (!_236)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (_224)
    {
        float _318 = _256 * _182;
        _270 = _318;
    }
    float _320 = _270;
    if (_224)
    {
        float _322 = _256 * _194;
        _276 = _322;
    }
    float _324 = _276;
    if (_236)
    {
        float _326 = _280 * _190;
        _302 = _326;
    }
    float _328 = _302;
    if (_236)
    {
        float _330 = _280 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_236)
    {
        float _334 = _280 * _196;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_294;
    float _356;
    if (!_338)
    {
        float _340 = in.m_71.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_124);
        float _362 = 1.0 / _360;
        float _364 = _158 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = in.m_58.x;
    float _374 = in.m_58.y;
    float _376 = in.m_58.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _380 = _366 + _378;
    float _382 = in.m_71.z;
    bool _384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _392 = _388 || _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = 1.0 / _396;
    float _408 = in.m_71.x;
    bool _410 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_366);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _370 * _158;
    float _432 = in.m_71.y;
    float _434 = 1.0 / _400;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = in.m_67.w;
    float _448 = _182 * _374;
    float _450 = _188 * _374;
    float _452 = exp2(_430);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _382 * 2.0;
    float _460 = _194 * _374;
    float _462 = fma(_186, _372, _450);
    float _464 = in.m_65.w;
    float _466 = _380 * _406;
    float _468 = fma(_192, _372, _460);
    float _470 = 1.0 / _404;
    float _472 = fma(_190, _376, _462);
    float _474 = in.m_69.w;
    float _476 = fma(_196, _376, _468);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = in.m_73.x;
    float _484 = floor(_458);
    float _486 = fma(_180, _372, _448);
    float _488 = -_452;
    float _490 = _488 + 1.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _494 = _366 + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    float _500 = fma(_184, _376, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = 1.0 / _456;
    float _508 = _392 ? _490 : 0.0;
    float _510 = _494 * _470;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _522 = _520 != 0;
    float _524 = _432 + _382;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = fma(_428, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _532 = !_514;
    int _534 = _532 ? 0 : 1;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _538 = _366 + _536;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _550 = _548 != 0;
    float _552 = _408 + _382;
    bool _554 = _484 > 0.0;
    float _556 = _538 * _434;
    float _558 = _408 + _432;
    float _560 = _374;
    float _562 = _432;
    if (_444)
    {
        float _564 = _508 * _506;
        _162 = _564;
    }
    float _566 = _162;
    bool _568 = _484 >= 0.0;
    bool _570 = isnan(_484);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = _408 * 2.0;
    float _580 = _432 * 2.0;
    float _582 = _524 + (-1.0);
    float _584 = _552 + (-1.0);
    float _586 = _558 + (-1.0);
    float _588 = floor(_578);
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _592 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _596 = _576 ? 0 : 1;
    float _598 = fma(_424, _556, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _600 = !_518;
    int _602 = _600 ? 0 : 1;
    float _604 = fma(_498, _556, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _606 = floor(_580);
    float _608 = fma(_528, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _610 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _612 = isnan(_366);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _382 + (-0.5);
    int _624 = ~_596;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _630;
    int _634 = _628;
    if (!_554)
    {
        int _636 = ~_596;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _644 = _588 > 0.0;
    float _646 = fma(_632, _556, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _648 = _588 >= 0.0;
    bool _650 = isnan(_588);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _662 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _664 = isnan(_366);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    bool _674 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _676 = isnan(_366);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _688 = _656 ? 0 : 1;
    float _690 = fma(_660, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _692 = _606 > 0.0;
    float _694 = -_684;
    float _696 = _694 + 1.0;
    bool _698 = _606 >= 0.0;
    bool _700 = isnan(_606);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -_672;
    float _710 = _708 + 1.0;
    float _712 = _620 * _696;
    float _714 = -_620;
    float _716 = _714 + 1.0;
    float _718 = _684 * _710;
    float _720 = _472 + _446;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _722;
    float _726 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _728 = _420 * _716;
    float _730 = fma(_504, _466, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _732 = _500 + _464;
    float _734 = fma(_724, _466, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _736 = _476 + _474;
    float _738 = _726 * _642;
    float _740 = _604 * _728;
    float _742 = _598 * _728;
    float _744 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _746 = _646 * _728;
    float _748 = -_420;
    float _750 = _748 + 1.0;
    float _752 = fma(_480, _466, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _754 = ~_688;
    int _756 = _754 + 1;
    int _758 = _756 + 1;
    float _760 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[203].x, _738);
    int _762 = _758;
    if (!_644)
    {
        int _764 = ~_688;
        int _766 = _764 + 1;
        _762 = _766;
    }
    int _768 = _762;
    float _770 = _744 * _686;
    bool _772 = !_522;
    int _774 = _772 ? 0 : 1;
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].x, _742);
    bool _778 = !_550;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].y, _740);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _794 = _792 != 0;
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].z, _746);
    float _798 = floor(_760);
    float _800 = _760 + 0.25;
    int _802 = _706 ? 0 : 1;
    float _804 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[203].z, _770);
    bool _806 = !_786;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_608, _712, _782);
    bool _812 = !_790;
    int _814 = _812 ? 0 : 1;
    float _816 = fma(_690, _712, _796);
    float _818 = floor(_800);
    int _820 = abs(_808);
    float _822 = fma(_734, _718, _810);
    int _824 = ~_802;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = fma(_752, _718, _816);
    int _832 = abs(_814);
    float _834 = in.m_73.z;
    int _836 = _828;
    if (!_692)
    {
        int _838 = ~_802;
        int _840 = _838 + 1;
        _836 = _840;
    }
    int _842 = _836;
    float _844 = -_798;
    float _846 = _760 + _844;
    float _848 = float(_820);
    float _850 = _760 * 6.283185482025146484375;
    float _852 = float(_768);
    float _854 = floor(_804);
    float _856 = float(_832);
    float _858 = in.m_75.x;
    float _860 = in.m_75.y;
    float _862 = in.m_75.z;
    float _864 = float(_640);
    float _866 = fma(_530, _712, _776);
    int _868 = abs(_602);
    float _870 = _856 * _852;
    float _872 = -_818;
    float _874 = _800 + _872;
    float _876 = _850 * 0.15915493667125701904296875;
    bool _878 = _846 >= 0.5;
    bool _880 = isnan(_846);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.5);
    bool _886 = _882 || _884;
    float _888 = _870 * (-2.0);
    float _890 = _848 * _864;
    int _892 = abs(_534);
    float _894 = _876 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = fma(_590, _888, _590);
    bool _900 = !_886;
    float _902 = _900 ? 0.5 : (-0.5);
    float _904 = _804 * 6.283185482025146484375;
    float _906 = float(_868);
    float _908 = -_854;
    float _910 = _804 + _908;
    bool _912 = _874 > 0.5;
    float _914 = _902 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _916 = _914 * 2.0;
    float _918 = _904 * 0.15915493667125701904296875;
    int _920 = abs(_774);
    float _922 = _890 * (-2.0);
    float _924 = _906 * _916;
    float _926 = float(_892);
    float _928 = _918 * 6.283185482025146484375;
    float _930 = sin(_928);
    bool _932 = _910 >= 0.5;
    bool _934 = isnan(_910);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    float _942 = fma(_888, _860, _860);
    float _944 = _896 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _946 = !_546;
    int _948 = _946 ? 0 : 1;
    float _950 = _432 + (-0.5);
    float _952 = _874;
    if (_912)
    {
        float _954 = -_874;
        float _956 = _954 + 1.0;
        _952 = _956;
    }
    float _958 = _952;
    float _960 = fma(_926, _944, _924);
    float _962 = _804 + 0.25;
    int _964 = abs(_948);
    float _966 = fma(_958, 4.0, -1.0);
    bool _968 = !_542;
    int _970 = _968 ? 0 : 1;
    float _972 = floor(_962);
    bool _974 = !_940;
    float _976 = _974 ? 0.5 : (-0.5);
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _980 = float(_920);
    float _982 = _930 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _984 = abs(_970);
    float _986 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _942);
    float _988 = float(_964);
    float _990 = _976 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _992 = _990 * 2.0;
    float _994 = fma(_980, _978, _960);
    float _996 = float(_984);
    float _998 = fma(_898, _566, _986);
    float _1000 = _988 * _992;
    float _1002 = fma(_994, 3.1415927410125732421875, _858);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _732 + _1004;
    float _1008 = -_972;
    float _1010 = _962 + _1008;
    float _1012 = fma(_996, _982, _1000);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = _720 + _1014;
    float _1018 = precise::min((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _736 + _1020;
    bool _1024 = _1010 > 0.5;
    float _1026 = _1016 * _1016;
    float _1028 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1030 = fma(_594, _922, _594);
    float _1032 = fma(_1002, _922, _1002);
    bool _1034 = !_794;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _1022 * _1022;
    float _1040 = -_1018;
    float _1042 = _1040 + _1028;
    float _1044 = fma(_1006, _1006, _1026);
    int _1046 = abs(_780);
    float _1048 = _408 + (-0.5);
    int _1050 = abs(_1036);
    float _1052 = 1.0 / _1042;
    float _1054 = _1010;
    if (_1024)
    {
        float _1056 = -_1010;
        float _1058 = _1056 + 1.0;
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1038 + _1044;
    float _1064 = float(_1046);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1032);
    float _1068 = fma(_1060, 4.0, -1.0);
    float _1070 = fma(_730, _718, _866);
    float _1072 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].y, _822);
    float _1074 = sqrt(_1062);
    float _1076 = _998 * 0.15915493667125701904296875;
    float _1078 = float(_842);
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = float(_1050);
    float _1084 = fma(_1030, _566, _1066);
    float _1086 = in.m_73.y;
    float _1088 = fma(_1064, _1080, _1012);
    float _1090 = _1076 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1082 * _1078;
    float _1096 = _1084 * 0.15915493667125701904296875;
    float _1098 = fma(_1088, 3.1415927410125732421875, _862);
    float _1100 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1070);
    float _1102 = _1094 * (-2.0);
    float _1104 = in.m_77.x;
    float _1106 = in.m_77.y;
    float _1108 = in.m_77.z;
    float _1110 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].z, _830);
    float _1112 = _1076 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = fma(_1098, _1102, _1098);
    float _1118 = fma(_592, _1102, _592);
    float _1120 = precise::max(_1018, _1074);
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _1124 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1116);
    float _1126 = precise::min(_1028, _1120);
    float _1128 = _1096 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = fma(_1118, _566, _1124);
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _482);
    float _1136 = -_1018;
    float _1138 = _1136 + _1126;
    float _1140 = _1132 * 0.15915493667125701904296875;
    float _1142 = _1096 * 6.283185482025146484375;
    float _1144 = cos(_1142);
    float _1146 = -_1138;
    float _1148 = fma(_1146, _1052, 1.0);
    float _1150 = _1148 * _1086;
    float _1152 = _1100 * _1104;
    float _1154 = _1072 * _1106;
    float _1156 = _1140 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    float _1160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1150);
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1166 = _1110 * _1108;
    float _1168 = _1130 * _1092;
    float _1170 = _1162 * _1134;
    float _1172 = _1164 * _1160;
    float _1174 = _1140 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = _1144 * _1114;
    float _1180 = _1144 * _1092;
    float _1182 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1184 = _1130 * _1114;
    float _1186 = _1182 * _1122;
    float _1188 = _1144 * _1158;
    float _1190 = _1130 * _1158;
    float _1192 = _1114 * _1158;
    float _1194 = _1092 * _1158;
    float _1196 = _1188 * _1172;
    float _1198 = in.m_79.y;
    float _1200 = fma(_1176, _1178, _1168);
    float _1202 = -_1172;
    float _1204 = _1176 * _1202;
    float _1206 = -_1184;
    float _1208 = fma(_1176, _1180, _1206);
    float _1210 = -_1180;
    float _1212 = fma(_1176, _1184, _1210);
    float _1214 = fma(_1200, _1170, _1196);
    float _1216 = _1190 * _1172;
    float _1218 = fma(_1192, _1170, _1204);
    float _1220 = fma(_1176, _1168, _1178);
    float _1222 = fma(_1208, _1186, _1214);
    float _1224 = fma(_1212, _1170, _1216);
    float _1226 = fma(_1194, _1186, _1218);
    float _1228 = _1222 * _324;
    float _1230 = fma(_1220, _1186, _1224);
    float _1232 = _1222 * _310;
    float _1234 = _1222 * _320;
    float _1236 = fma(_1226, _292, _1228);
    float _1238 = fma(_1226, _284, _1232);
    float _1240 = fma(_1226, _288, _1234);
    float _1242 = fma(_1230, _336, _1236);
    float _1244 = fma(_1230, _328, _1238);
    float _1246 = fma(_1230, _332, _1240);
    float _1248 = _736 + _1242;
    float _1250 = _720 + _1244;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1254 = _1248 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1258 = _1250 + _1256;
    float _1260 = _1254 * _1254;
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = _1264 + _1268;
    float _1272 = _1242;
    float _1274 = _1234;
    float _1276 = _1230;
    float _1278 = _1264;
    float _1280 = _1170;
    float _1282 = _1246;
    float _1284 = _1258;
    if (_1266)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1286;
    }
    float _1288 = _1272;
    if (!_1266)
    {
        _1274 = _1248;
    }
    float _1290 = _1274;
    float _1292 = _1290;
    if (_1266)
    {
        float _1294 = rsqrt(_1262);
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1296;
    if (_1266)
    {
        float _1300 = _1270 * _1288;
        _1278 = _1300;
    }
    float _1302 = _1278;
    if (_1266)
    {
        float _1304 = _1302 * 0.15915493667125701904296875;
        _1280 = _1304;
    }
    float _1306 = _1280;
    float _1308 = _374 + _1198;
    float _1310 = _1288;
    float _1312 = _1306;
    if (_1266)
    {
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = _1308 + _1246;
    if (!_1266)
    {
        _1282 = _1250;
    }
    float _1322 = _1282;
    float _1324 = _1322;
    if (_1266)
    {
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _560 = _1326;
    }
    float _1328 = _560;
    float _1330 = _1328;
    float _1332 = _1318;
    if (_1266)
    {
        float _1334 = fma(_1318, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1330 = _1334;
    }
    float _1336 = _1330;
    if (_1266)
    {
        float _1338 = _1296 * _1336;
        _1298 = _1338;
    }
    float _1340 = _1298;
    if (_1266)
    {
        float _1342 = fma(_1258, _1340, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1324 = _1342;
    }
    float _1344 = _1324;
    float _1346 = _1344;
    if (_1266)
    {
        float _1348 = fma(_1254, _1340, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1292 = _1348;
    }
    float _1350 = _1292;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1354 = _1344 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1358 = _1350 + _1356;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1362 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4871 = float2(_1360, _1362);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4871, float2(0.0), isnan(_4871)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4871, float2(0.0), isnan(_4871)), level(0.0)).x;
    float _1366 = _1340;
    float _1368 = _1354;
    float _1370 = _1358;
    float _1372 = _1362;
    float _1374 = _1350;
    if (_1266)
    {
        float _1376 = _1306 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        _1366 = _1378;
    }
    float _1380 = _1366;
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1390 = _1386 || _1388;
    if (!_1266)
    {
        _1368 = _1320;
    }
    float _1392 = _1368;
    float _1394 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1396 = _1392;
    if (!_1390)
    {
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1284 = _1398;
    }
    float _1400 = _1284;
    if (_1266)
    {
        float _1402 = _1380 + (-1.0);
        _1332 = _1402;
    }
    float _1404 = _1332;
    float _1406 = _1404;
    if (_1266)
    {
        float _1408 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1370 = _1408;
    }
    float _1410 = _1370;
    float _1412 = _1410;
    if (!_1390)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _1312 = _1414;
    }
    float _1416 = _1312;
    if (_1266)
    {
        float _1418 = fma(_1320, _1380, _1410);
        _1396 = _1418;
    }
    float _1420 = _1396;
    float _1422 = _1420;
    if (!_1390)
    {
        float _1424 = -_1308;
        float _1426 = _1424 + _1420;
        _1372 = _1426;
    }
    float _1428 = _1372;
    float _1430 = floor(_1394);
    float _1432 = -_1430;
    float _1434 = _1394 + _1432;
    float _1436 = fma(_1364, 100.0, _1308);
    float _1438 = fma(_1364, 100.0, _1420);
    float _1440 = _1364;
    float _1442 = _1438;
    if (!_1390)
    {
        float _1444 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _1422 = _1444;
    }
    float _1446 = _1422;
    float _1448 = _1446;
    if (!_1390)
    {
        float _1450 = -_736;
        float _1452 = _1450 + _1350;
        _1440 = _1452;
    }
    float _1454 = _1440;
    if (!_1390)
    {
        float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1458 = _1436 + _1456;
        _1412 = _1458;
    }
    float _1460 = _1412;
    float _1462 = _1460;
    if (!_1390)
    {
        float _1464 = fma(_1460, _1460, _1026);
        _1462 = _1464;
    }
    float _1466 = _1462;
    float _1468 = _1466;
    if (!_1390)
    {
        float _1470 = _1038 + _1466;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = _1472;
    if (!_1390)
    {
        float _1476 = sqrt(_1472);
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (!_1390)
    {
        float _1480 = precise::min(_1478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1406 = _1480;
    }
    float _1482 = _1406;
    float _1484 = _1482;
    if (!_1390)
    {
        float _1486 = _1482 * _1400;
        _1484 = _1486;
    }
    float _1488 = _1484;
    float _1490 = _1488;
    if (!_1390)
    {
        float _1492 = _1446 * _1488;
        _1448 = _1492;
    }
    float _1494 = _1448;
    if (!_1390)
    {
        float _1496 = -_720;
        float _1498 = _1496 + _1344;
        _1490 = _1498;
    }
    float _1500 = _1490;
    if (!_1390)
    {
        float _1502 = fma(_1428, _1494, _1436);
        _1442 = _1502;
    }
    float _1504 = _1442;
    if (!_1390)
    {
        float _1506 = fma(_1500, _1494, _720);
        _1346 = _1506;
    }
    float _1508 = _1346;
    if (!_1390)
    {
        float _1510 = fma(_1454, _1494, _736);
        _1374 = _1510;
    }
    float _1512 = _1374;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1504 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1508 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1512 + _1522;
    float _1526 = _1516 * _1516;
    float _1528 = fma(_1520, _1520, _1526);
    float _1530 = fma(_1524, _1524, _1528);
    float _1532 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1534 = rsqrt(_1530);
    float _1536 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1532);
    float _1538 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1536);
    float _1540 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1542 = sqrt(_1530);
    float _1544 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1540);
    float _1548 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1546);
    float _1550 = 1.0 / _1544;
    float _1552 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1556 = _1520 * _1552;
    float _1558 = _1524 * _1552;
    float _1560 = _1554 + _1544;
    float _1562 = _1556 * _1556;
    float _1564 = _1558 * _1558;
    float _1566 = _1562 + _1564;
    float _1568 = _1560 * _1550;
    float _1570 = _1568 * 0.5;
    float _1572 = sqrt(_1566);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1576 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1574);
    float _1578 = 1.0 / _1576;
    bool _1580 = _1572 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1584 = _1572 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1588 = _1578 * _1586;
    bool _1590 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1592 = _1320;
    float _1594 = _1566;
    int _1596 = 2;
    float _1598 = _1576;
    float _1600 = _1516;
    float _1602 = _1556;
    float _1604 = _1558;
    float _1606 = _1562;
    if (_1580)
    {
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1608;
    }
    float _1610 = _1592;
    bool _1612 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1614 = !_1590;
    int _1616 = _1614 ? 0 : 1;
    if (_1580)
    {
        float _1618 = rsqrt(_1566);
        _1594 = _1618;
    }
    float _1620 = _1594;
    if (!_1590)
    {
        _1596 = 1;
    }
    int _1622 = _1596;
    int _1624 = _1622;
    if (!_1612)
    {
        _1624 = _1616;
    }
    int _1626 = _1624;
    if (_1580)
    {
        float _1628 = _1584 * _1610;
        _1598 = _1628;
    }
    float _1630 = _1598;
    int _1632 = _1626 << 6;
    float _1634 = 0.0;
    if (_1580)
    {
        float _1636 = _1630 * 0.15915493667125701904296875;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1642 = _1632 + 64;
    uint _1645 = uint(int(uint(_1642) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    float _1661 = 0.0;
    if (_1580)
    {
        float _1663 = _1638 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        _1661 = _1665;
    }
    float _1667 = _1661;
    float _1669 = precise::max(0.0, _1640);
    int _1671 = _1632 + 96;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    float _1689 = 0.0;
    float _1691 = _1669;
    if (_1580)
    {
        float _1693 = _1638 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        _1689 = _1695;
    }
    float _1697 = _1689;
    float _1699 = -_1552;
    float _1701 = -_1669;
    float _1703 = fma(_1516, _1699, _1701);
    if (_1580)
    {
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1705;
    }
    float _1707 = _1600;
    int _1709 = _1632 + 48;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.vp_c15)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    float _1727 = _1707;
    if (_1580)
    {
        float _1729 = _1667 + (-1.0);
        _1691 = _1729;
    }
    float _1731 = _1691;
    float _1733 = 0.0;
    if (_1580)
    {
        float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1733 = _1735;
    }
    float _1737 = _1733;
    int _1739 = _1632 + 104;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    uint _1743 = uint(int(uint(int(_1741)) >> uint(2)));
    int _1745 = int(_1741) & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    int _1749 = int(_1741) + 1;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    int _1753 = _1749 & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    float _1757 = 0.0;
    if (_1580)
    {
        float _1759 = fma(_1697, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = _1761;
    if (!_1580)
    {
        _1727 = _1703;
    }
    float _1765 = _1727;
    float _1767 = _1765;
    if (_1580)
    {
        float _1769 = fma(_1703, _1667, _1737);
        _1767 = _1769;
    }
    float _1771 = _1767;
    float _1773 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1775 = _1773;
    if (_1580)
    {
        float _1777 = _1620 * _1761;
        _1763 = _1777;
    }
    float _1779 = _1763;
    int _1781 = _1632 + 80;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    if (_1580)
    {
        float _1799 = _1556 * _1779;
        _1602 = _1799;
    }
    float _1801 = _1602;
    float _1803 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1773);
    if (_1580)
    {
        float _1805 = _1558 * _1779;
        _1604 = _1805;
    }
    float _1807 = _1604;
    if (!_1580)
    {
        _1775 = _1564;
    }
    float _1809 = _1775;
    float _1811 = _1809;
    if (_1580)
    {
        float _1813 = _1801 * _1801;
        _1606 = _1813;
    }
    float _1815 = _1606;
    float _1817 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1803);
    float _1819 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1821 = _1632 + 56;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    if (_1580)
    {
        float _1839 = _1807 * _1807;
        _1811 = _1839;
    }
    float _1841 = _1811;
    float _1843 = fma(_1771, _1771, _1815);
    float _1845 = _1436 + _1819;
    float _1847 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1849 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1851 = _1843 + _1841;
    int _1853 = _1632 + 72;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[int(_1865)][_1867];
    float _1871 = _1845 * _1659;
    float _1873 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1875 = rsqrt(_1851);
    float _1877 = _1845 * _1687;
    float _1879 = fma(_720, _1679, _1877);
    float _1881 = _1845 * _1725;
    float _1883 = -_1873;
    float _1885 = fma(_1883, _1849, 1.0);
    float _1887 = fma(_720, _1651, _1871);
    float _1889 = _1875 * _1801;
    float _1891 = fma(_720, _1717, _1881);
    float _1893 = log2(_1885);
    float _1895 = fma(_736, _1747, _1879);
    int _1897 = _1632 + 88;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
    int _1903 = int(_1899) & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    int _1907 = int(_1899) + 1;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    int _1911 = _1907 & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    float _1915 = _1895 + _1755;
    float _1917 = _1845 * _1797;
    float _1919 = 1.0 / _1915;
    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1923 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1921);
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = fma(_720, _1789, _1917);
    float _1929 = -_1925;
    float _1931 = _1929 + 1.0;
    float _1933 = _1893 * 0.693147182464599609375;
    float _1935 = fma(_736, _1829, _1891);
    float _1937 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1939 = _1935 + _1837;
    float _1941 = fma(_736, _1861, _1887);
    float _1943 = _1875 * _1771;
    float _1945 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1947 = _1875 * _1807;
    float _1949 = _1941 + _1869;
    float _1951 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1937);
    float _1953 = -_1945;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1959 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1951);
    float _1963 = -_1947;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1967 = abs(_1931);
    float _1969 = log2(_1967);
    float _1971 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1973 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1975 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1977 = _1949 * _1919;
    float _1979 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1971);
    float _1981 = _1939 * _1919;
    float _1983 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1985 = floor(_1957);
    float _1987 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1989 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1975);
    bool _1991 = _1981 >= 0.0;
    float _1993 = fma(_1965, -0.5, 0.5);
    float _1995 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1983);
    float _1997 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1989);
    bool _1999 = _1981 <= 1.0;
    bool _2001 = _1999 && _1991;
    float _2003 = fma(_1965, 0.5, 0.5);
    float _2005 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1995);
    float _2007 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2009 = _1977 >= 0.0;
    bool _2011 = _2009 && _2001;
    float _2013 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2015 = fma(_736, _1905, _1927);
    float _2017 = sqrt(_1993);
    bool _2019 = _1977 <= 1.0;
    bool _2021 = _2019 && _2011;
    float _2023 = -_1985;
    float _2025 = _1957 + _2023;
    float _2027 = fma(_2003, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2029 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2005);
    float _2031 = _2015 + _1913;
    float _2033 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2035 = fma(_2003, _2027, -0.212114393711090087890625);
    float _2037 = exp2(_2013);
    float _2039 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2041 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2033);
    float _2043 = fma(_2003, _2035, 1.570728778839111328125);
    float _2045 = _1943 + 1.0;
    float _2047 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2039);
    float _2049 = _2035;
    float _2051 = _1845;
    if (_2021)
    {
        float _2053 = float(_1626);
        _2049 = _2053;
    }
    float _2055 = _2049;
    float _2057 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2041);
    float _2059 = 1.0 / _2029;
    float _2061 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2047);
    float _2063 = _2017 * 0.636619746685028076171875;
    float _2065 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2057);
    float _2067 = _2031 * _1919;
    float _2069 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2061);
    float _2071 = -_2043;
    float _2073 = fma(_2063, _2071, 1.0);
    float _2075 = _2055;
    if (_2021)
    {
        float _2077 = rint(_2055);
        float _2079 = precise::max(_2077, 0.0);
        uint _2081 = uint(_2079);
        uint _2083 = clamp(_2081, 0u, 65535u);
        _2075 = as_type<float>(_2083);
    }
    float _2085 = _2075;
    float _2087 = -_1943;
    float _2089 = fma(_2037, _2045, _2087);
    float _2091 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6090 = float2(_1434, _2025);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6090, float2(0.0), isnan(_6090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6090, float2(0.0), isnan(_6090)), level(0.0)).x;
    float _2095 = fma(_2089, 0.5, 0.5);
    float _2097 = _2065 * _2059;
    float _2099 = _2069 * _2059;
    float _2101 = fma(_2097, 0.5, 0.5);
    float _2103 = fma(_2099, -0.5, 0.5);
    float _2105 = _1977;
    if (_2021)
    {
        float3 _6116 = float3(_1981, _1977, float(as_type<int>(_2085)));
        float3 _6120 = select(_6116, float3(0.0), isnan(_6116));
        float _2107 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6120.xy, uint(rint(_6120.z)), _2067, level(0.0));
        _2105 = _2107;
    }
    float _2109 = _2105;
    float3 _6130 = float3(_2101, _2103, _2091);
    float _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6130, float3(0.0), isnan(_6130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6130, float3(0.0), isnan(_6130)), level(0.0)).x;
    float3 _6139 = float3(_2101, _2103, _2091);
    float4 _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6139, float3(0.0), isnan(_6139)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level(0.0)).xyzw;
    float _2116 = _2114.x;
    float _2118 = _2114.y;
    float _2120 = _2114.z;
    float _2122 = _2114.w;
    float2 _6155 = float2(_2073, _2095);
    float3 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6155, float2(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6155, float2(0.0), isnan(_6155)), level(0.0)).xyz;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2136 = in.m_81.y;
    float _2138 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2140 = _1150 != 0.0;
    bool _2142 = isnan(_1150);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = _2134 * _408;
    bool _2152 = _432 > 0.5;
    float _2154 = _2138 * _408;
    bool _2156 = _482 == 0.0;
    bool _2158 = !_2148;
    bool _2160 = _2156 && _2158;
    float _2162 = trunc(_2150);
    int _2164 = int(_2162);
    bool _2166 = _834 == 0.0;
    bool _2168 = _2166 && _2160;
    int _2170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2172 = _2170 != 0;
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2176 = _2174 != 0;
    float _2178 = trunc(_2154);
    int _2180 = int(_2178);
    float _2182 = in.m_81.x;
    bool _2184 = _408 > 0.5;
    bool _2186 = _2184 && _2172;
    int _2188 = _2164 << 4;
    int _2190 = _2188 + 1712;
    float _2192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2194 = in.m_83.x;
    float _2196 = in.m_83.y;
    float _2198 = in.m_83.z;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _2202 = uint(int(uint(_2190) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = _2180 << 4;
    int _2220 = _2218 + 1968;
    float _2222 = -_2136;
    float _2224 = _2222 + 1.0;
    int _2226 = _2190 + 8;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    uint _2230 = uint(int(uint(int(_2228)) >> uint(2)));
    int _2232 = int(_2228) & 3;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[int(_2230)][_2232];
    float _2236 = _2136;
    if (_2176)
    {
        float _2238 = _2152 ? _2224 : _2136;
        _2236 = _2238;
    }
    float _2240 = _2236;
    float _2242 = 0.0;
    if (_2172)
    {
        _2242 = _2182;
    }
    float _2244 = _2242;
    float _2246 = _2244;
    if (!_2172)
    {
        _562 = _2182;
    }
    float _2248 = _562;
    uint _2250 = uint(int(uint(_2220) >> uint(2)));
    uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
    int _2254 = int(_2250) & 3;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[int(_2252)][_2254];
    int _2258 = int(_2250) + 1;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    int _2262 = _2258 & 3;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[int(_2260)][_2262];
    float _2266 = _2248;
    if (_2186)
    {
        float _2268 = -_2244;
        float _2270 = _2268 + 1.0;
        _2246 = _2270;
    }
    float _2272 = _2246;
    float _2274 = _2196;
    float _2276 = _2194;
    float _2278 = _2198;
    if (!_2168)
    {
        float _2280 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2196);
        _2274 = _2280;
    }
    float _2282 = _2274;
    if (!_2168)
    {
        float _2284 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2194);
        _2276 = _2284;
    }
    float _2286 = _2276;
    if (!_2168)
    {
        float _2288 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2198);
        _2278 = _2288;
    }
    float _2290 = _2278;
    int _2292 = _2220 + 8;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    uint _2296 = uint(int(uint(int(_2294)) >> uint(2)));
    int _2298 = int(_2294) & 3;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[int(_2296)][_2298];
    float _2302 = _1188 * _2282;
    float _2304 = -_2282;
    float _2306 = _1176 * _2304;
    float _2308 = _1190 * _2282;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2312 = fma(_1200, _2286, _2302);
    float _2314 = fma(_1192, _2286, _2306);
    float _2316 = fma(_1212, _2286, _2308);
    if (_2172)
    {
        _2266 = _2272;
    }
    float _2318 = _2266;
    float _2320 = fma(_1208, _2290, _2312);
    float _2322 = fma(_1194, _2290, _2314);
    float _2324 = fma(_1220, _2290, _2316);
    float _2326 = _2320 * _310;
    float _2328 = _2320 * _320;
    float _2330 = _2320 * _324;
    float _2332 = fma(_2322, _284, _2326);
    float _2334 = fma(_2322, _288, _2328);
    float _2336 = fma(_2322, _292, _2330);
    float _2338 = fma(_2324, _328, _2332);
    float _2340 = fma(_2324, _332, _2334);
    float _2342 = fma(_2324, _336, _2336);
    float _2344 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2346 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2348 = abs(_1588);
    float _2350 = log2(_2348);
    float _2352 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2354 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2344);
    float _2356 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2346);
    float _2358 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2360 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2362 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2354);
    float _2364 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2356);
    float _2366 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2368 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2370 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2372 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2374 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2376 = trunc(_2370);
    int _2378 = int(_2376);
    float _2380 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2382 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_85.x = _2366;
    out.m_85.y = _2368;
    out.m_85.z = _2374;
    out.m_85.w = _2200;
    float _2384 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2386 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2390 = trunc(_2372);
    int _2392 = int(_2390);
    float _2394 = _2300 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2396 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = exp2(_2382);
    float _2402 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2404 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_87.x = _2388;
    out.m_87.y = _2396;
    out.m_87.z = _2398;
    float _2406 = _2402 * _2310;
    float _2408 = _2404 * _2192;
    int _2410 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2412 = _2392 + _2410;
    int _2414 = _2412 + 1;
    out.m_89.x = _2408;
    out.m_89.y = _2406;
    bool _2416 = _1588 <= 8000.0;
    bool _2418 = isnan(_1588);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan(8000.0);
    bool _2424 = _2420 || _2422;
    float _2426 = float(_2424);
    float _2428 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2430 = precise::clamp(_2428, 0.0, 1.0);
    int _2432 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2434 = _2378 + _2432;
    int _2436 = _2434 + 1;
    float _2438 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2384);
    float _2440 = in.m_91.x;
    bool _2442 = _2436 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2444 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2438);
    int _2446 = _2436 | _2414;
    float _2448 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2450 = fma(_2430, -2.0, 3.0);
    float _2452 = _2430 * _2430;
    bool _2454 = _2446 < 0;
    bool _2456 = _2454 || _2442;
    float _2458 = exp2(_2448);
    bool _2460 = _2414 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2462 = _2460 || _2456;
    float _2464 = _2452 * _2450;
    float _2466 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2444);
    float _2468 = -_2464;
    float _2470 = _2468 + 1.0;
    float _2472 = _2466 + _2029;
    float _2474 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2476 = _2472 * 0.5;
    float _2478 = _2472;
    float _2480 = _2476;
    if (_2462)
    {
        _2478 = 1.0;
    }
    float _2482 = _2478;
    float _2484 = _2482;
    float _2486 = _2440;
    if (!_2462)
    {
        int _2488 = _2414 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2490 = _2488 + _2436;
        float _2492 = floor(_2372);
        int _2494 = _2490 << 2;
        uint _2496 = uint(int(uint(_2490) >> uint(2)));
        int _2498 = 12 & _2494;
        int _2500 = int(_2496) << 4;
        int _2502 = _2500 + _2498;
        float _2504 = floor(_2370);
        float _2506 = -_2492;
        float _2508 = _2372 + _2506;
        int _2510 = _2502 + 400;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        uint _2514 = uint(int(uint(int(_2512)) >> uint(2)));
        int _2516 = int(_2512) & 3;
        float _2518 = (*spvDescriptorSet0.vp_c15)._m0[int(_2514)][_2516];
        float _2520 = -_2504;
        float _2522 = _2370 + _2520;
        float _2524 = rint(_2518);
        float _2526 = precise::max(_2524, 0.0);
        uint _2528 = uint(_2526);
        uint _2530 = clamp(_2528, 0u, 65535u);
        float3 _6827 = float3(_2522, _2508, float(int(_2530)));
        float3 _6829 = select(_6827, float3(0.0), isnan(_6827));
        float _2532 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6829.xy, uint(rint(_6829.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6829.xy, uint(rint(_6829.z)), level(0.0)).x;
        int _2534 = _2490 << 4;
        int _2536 = _2534 + 2048;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        uint _2540 = uint(int(uint(int(_2538)) >> uint(2)));
        int _2542 = int(_2538) & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = int(_2538) + 1;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        int _2550 = _2546 & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        int _2554 = _2536 + 8;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        uint _2558 = uint(int(uint(int(_2556)) >> uint(2)));
        int _2560 = int(_2556) & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        int _2564 = int(_2556) + 1;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        int _2568 = _2564 & 3;
        float _2570 = (*spvDescriptorSet0.vp_c15)._m0[int(_2566)][_2568];
        float _2572 = _1845 * _2552;
        float _2574 = fma(_720, _2544, _2572);
        float _2576 = fma(_736, _2562, _2574);
        float _2578 = _2576 + _2570;
        float _2580 = precise::clamp(_2578, 0.0, 1.0);
        float _2582 = -_2580;
        float _2584 = _2582 + _2532;
        float _2586 = fma(_2584, 500.0, 1.5);
        float _2588 = exp2(_2586);
        float _2590 = 0.0 + _2588;
        float _2592 = precise::clamp(_2590, 0.0, 1.0);
        _2051 = _2588;
        _2484 = _2592;
    }
    float _2594 = _2051;
    float _2596 = _2484;
    float _2598 = _2426 * _2474;
    float _2600 = in.m_91.z;
    float _2602 = -_2458;
    float _2604 = _2602 + 1.0;
    float _2606 = -_2093;
    float _2608 = _2606 + 1.0;
    float _2610 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = in.m_91.w;
    float _2614 = _2594;
    if (!_2021)
    {
        _2614 = 1.0;
    }
    float _2616 = _2614;
    float _2618 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2620 = _2616;
    if (_2021)
    {
        bool _2622 = _2109 >= _2067;
        bool _2624 = isnan(_2109);
        bool _2626 = _2622 || _2624;
        bool _2628 = isnan(_2067);
        bool _2630 = _2626 || _2628;
        float _2632 = float(_2630);
        _2620 = _2632;
    }
    float _2634 = _2620;
    float _2636 = _2608 * _2610;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    out.gl_Position.x = _2065;
    out.gl_Position.y = _2069;
    out.gl_Position.z = _2466;
    out.gl_Position.w = _2029;
    float _2640 = _2618 * _2111;
    float _2642 = -_2618;
    float _2644 = _2642 + 1.0;
    float _2646 = _2634 * _2596;
    float _2648 = -_2638;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = _2132 * _2640;
    out.m_93.z = _2476;
    out.m_93.w = _2029;
    bool _2654 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1542);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = -_2646;
    float _2666 = fma(_2664, _2650, 1.0);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = in.m_91.y;
    float _2672 = _2122 * _2640;
    float _2674 = _2122 * _2644;
    float _2676 = _2668 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2678 = fma(_2122, _2652, _2120);
    float _2680 = fma(_2128, _2672, _2116);
    float _2682 = fma(_2130, _2672, _2118);
    out.m_95.z = _2600;
    float _2684 = _2644;
    float _2686 = _2646;
    float _2688 = _2668;
    if (!_2662)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2690 = _2684;
    float _2692 = _2690;
    float _2694 = _2690;
    if (!_2662)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2696 = _2480;
    out.m_95.w = _2612;
    float _2698 = _2696;
    float _2700 = _2696;
    if (!_2662)
    {
        _2686 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2702 = _2686;
    float _2704 = _2702;
    float _2706 = _2702;
    if (!_2662)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2708 = _2688;
    out.m_97.x = _2676;
    out.m_99.x = _2680;
    out.m_99.y = _2682;
    out.m_99.z = _2678;
    out.m_99.w = _2674;
    out.m_101.x = _2338;
    out.m_101.y = _2340;
    out.m_101.z = _2342;
    out.m_95.x = _2440;
    out.m_95.y = _2670;
    float _2710 = _2670;
    float _2712 = _2708;
    float _2714 = _2708;
    if (!_2662)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2486;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2662)
    {
        _2710 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2722 = _2710;
    bool _2724 = !_2662;
    float _2726 = _2722;
    float _2728 = _2722;
    if (!_2724)
    {
        bool _2730 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2732 = isnan(_1542);
        bool _2734 = _2730 || _2732;
        bool _2736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2738 = _2734 || _2736;
        if (!_2738)
        {
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2742 = _1542 + _2740;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2744;
            float _2748 = 1.0 / _2746;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2770 = _2742 * _2748;
            float _2772 = precise::clamp(_2770, 0.0, 1.0);
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2778 = fma(_2772, _2752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2780 = fma(_2772, _2776, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2782 = fma(_2772, _2756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2784 = fma(_2772, _2760, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2786 = fma(_2772, _2764, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2788 = fma(_2772, _2768, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2694 = _2778;
            _2728 = _2786;
            _2720 = _2780;
            _2706 = _2784;
            _2700 = _2782;
            _2714 = _2788;
            _2790 = true;
        }
        else
        {
            bool _2792 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2794 = isnan(_1542);
            bool _2796 = _2792 || _2794;
            bool _2798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2800 = _2796 || _2798;
            if (!_2800)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2802 = _2718;
            _2720 = _2802;
            if (!_2800)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2804 = _2692;
            _2694 = _2804;
            if (!_2800)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2806 = _2698;
            _2700 = _2806;
            if (!_2800)
            {
                _2704 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2808 = _2704;
            _2706 = _2808;
            if (!_2800)
            {
                _2726 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2810 = _2726;
            _2728 = _2810;
            if (!_2800)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2812 = _2712;
            bool _2814 = !_2800;
            _2714 = _2812;
            if (!_2814)
            {
                bool _2816 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2818 = isnan(_1542);
                bool _2820 = _2816 || _2818;
                bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2824 = _2820 || _2822;
                if (!_2824)
                {
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2828 = _1542 + _2826;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2832 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2830;
                    float _2834 = 1.0 / _2832;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2856 = _2828 * _2834;
                    float _2858 = precise::clamp(_2856, 0.0, 1.0);
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2864 = fma(_2858, _2838, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2866 = fma(_2858, _2862, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2868 = fma(_2858, _2842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2870 = fma(_2858, _2846, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2872 = fma(_2858, _2850, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2874 = fma(_2858, _2854, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2694 = _2864;
                    _2728 = _2872;
                    _2720 = _2866;
                    _2706 = _2870;
                    _2700 = _2868;
                    _2714 = _2874;
                    _2790 = true;
                }
                else
                {
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2728 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2706 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2790 = false;
    float _2876 = _2694;
    float _2878 = _2728;
    float _2880 = _2720;
    float _2882 = _2706;
    float _2884 = _2700;
    float _2886 = _2714;
    float _2888 = fma(_2340, -0.5, 0.5);
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = -_2876;
    float _2894 = _2892 + _2878;
    float _2896 = -_2880;
    float _2898 = _2896 + _2882;
    float _2900 = -_2884;
    float _2902 = _2900 + _2886;
    bool _2904 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2906 = fma(_2890, _2894, _2876);
    float _2908 = fma(_2890, _2898, _2880);
    float _2910 = fma(_2890, _2902, _2884);
    float _2912 = _2906 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2914 = fma(_2908, 0.298911988735198974609375, _2912);
    float _2916 = fma(_2910, 0.114477999508380889892578125, _2914);
    out.m_103.x = 0.0;
    float _2918 = -_2916;
    float _2920 = _2908 + _2918;
    float _2922 = -_2916;
    float _2924 = _2906 + _2922;
    float _2926 = -_2916;
    float _2928 = _2910 + _2926;
    float _2930 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2932 = fma(_2920, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    out.m_97.w = _2930;
    out.m_105.x = _2932;
    out.m_105.y = _2934;
    out.m_105.z = _2936;
    if (!_2904)
    {
        return out;
    }
    float _2938 = -_1504;
    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2942 = -_1508;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2946 = -_1512;
    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2950 = _2940 * _2940;
    float _2952 = fma(_2944, _2944, _2950);
    float _2954 = fma(_2948, _2948, _2952);
    float _2956 = sqrt(_2954);
    float _2958 = rsqrt(_2954);
    float _2960 = -_2956;
    float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2964 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2966 = precise::clamp(_2964, 0.0, 1.0);
    float _2968 = _2944 * _2958;
    float _2970 = _2940 * _2958;
    float _2972 = abs(_2966);
    float _2974 = log2(_2972);
    float _2976 = _2948 * _2958;
    float _2978 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2980 = _2340 * _2970;
    float _2982 = -_2970;
    float _2984 = -_2978;
    float _2986 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2984);
    float _2988 = fma(_2338, _2968, _2980);
    float _2990 = -_2976;
    float _2992 = fma(_2990, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2986);
    float _2994 = fma(_2342, _2976, _2988);
    float _2996 = precise::clamp(_2994, 0.0, 1.0);
    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3000 = _2992 + _2998;
    float _3002 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3004 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3006 = precise::clamp(_3004, 0.0, 1.0);
    float _3008 = exp2(_3002);
    float _3010 = _3008 * _3006;
    float _3012 = _2996 * _3010;
    float _3014 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3016 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3018 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _3014;
    out.m_103.y = _3016;
    out.m_103.z = _3018;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2790 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_61.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3075 = as_type<float>(_140);
        out.gl_Position.z = _3075;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3144 = as_type<float>(_178);
        out.gl_Position.z = _3144;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_65.x;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = in.m_67.x;
    float _188 = in.m_67.y;
    float _190 = in.m_67.z;
    float _192 = in.m_69.x;
    float _194 = in.m_69.y;
    float _196 = in.m_69.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = _218;
    if (_222)
    {
        float _228 = rsqrt(_210);
        _226 = _228;
    }
    float _230 = _226;
    float _232 = 0.0;
    if (!_222)
    {
        _232 = 0.0;
    }
    float _234 = _232;
    bool _236 = _220 > 0.0;
    float _238 = 0.0;
    float _240 = _234;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _220;
    float _252 = _248;
    if (_224)
    {
        float _254 = rsqrt(_212);
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_224)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = 0.0;
    float _264 = _260;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _266;
    if (!_224)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    if (_236)
    {
        float _278 = rsqrt(_214);
        _274 = _278;
    }
    float _280 = _274;
    if (_222)
    {
        float _282 = _230 * _186;
        _240 = _282;
    }
    float _284 = _240;
    if (_222)
    {
        float _286 = _230 * _180;
        _246 = _286;
    }
    float _288 = _246;
    if (_222)
    {
        float _290 = _230 * _192;
        _252 = _290;
    }
    float _292 = _252;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _296 = 0.0;
    if (!_236)
    {
        _296 = 0.0;
    }
    float _298 = _296;
    float _300 = 0.0;
    float _302 = _298;
    if (!_236)
    {
        _300 = 0.0;
    }
    float _304 = _300;
    float _306 = _304;
    if (_224)
    {
        float _308 = _256 * _188;
        _264 = _308;
    }
    float _310 = _264;
    float _312 = 0.0;
    if (!_236)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (_224)
    {
        float _318 = _256 * _182;
        _270 = _318;
    }
    float _320 = _270;
    if (_224)
    {
        float _322 = _256 * _194;
        _276 = _322;
    }
    float _324 = _276;
    if (_236)
    {
        float _326 = _280 * _190;
        _302 = _326;
    }
    float _328 = _302;
    if (_236)
    {
        float _330 = _280 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_236)
    {
        float _334 = _280 * _196;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_294;
    float _356;
    if (!_338)
    {
        float _340 = in.m_71.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_124);
        float _362 = 1.0 / _360;
        float _364 = _158 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = in.m_58.x;
    float _374 = in.m_58.y;
    float _376 = in.m_58.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _380 = _366 + _378;
    float _382 = in.m_71.z;
    bool _384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _392 = _388 || _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = 1.0 / _396;
    float _408 = in.m_71.x;
    bool _410 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_366);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _370 * _158;
    float _432 = in.m_71.y;
    float _434 = 1.0 / _400;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = in.m_67.w;
    float _448 = _182 * _374;
    float _450 = _188 * _374;
    float _452 = exp2(_430);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _382 * 2.0;
    float _460 = _194 * _374;
    float _462 = fma(_186, _372, _450);
    float _464 = in.m_65.w;
    float _466 = _380 * _406;
    float _468 = fma(_192, _372, _460);
    float _470 = 1.0 / _404;
    float _472 = fma(_190, _376, _462);
    float _474 = in.m_69.w;
    float _476 = fma(_196, _376, _468);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _478;
    float _482 = in.m_73.x;
    float _484 = floor(_458);
    float _486 = fma(_180, _372, _448);
    float _488 = -_452;
    float _490 = _488 + 1.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _494 = _366 + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _496;
    float _500 = fma(_184, _376, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _502;
    float _506 = 1.0 / _456;
    float _508 = _392 ? _490 : 0.0;
    float _510 = _494 * _470;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _522 = _520 != 0;
    float _524 = _432 + _382;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = fma(_428, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _532 = !_514;
    int _534 = _532 ? 0 : 1;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _538 = _366 + _536;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _550 = _548 != 0;
    float _552 = _408 + _382;
    bool _554 = _484 > 0.0;
    float _556 = _538 * _434;
    float _558 = _408 + _432;
    float _560 = _374;
    float _562 = _432;
    if (_444)
    {
        float _564 = _508 * _506;
        _162 = _564;
    }
    float _566 = _162;
    bool _568 = _484 >= 0.0;
    bool _570 = isnan(_484);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = _408 * 2.0;
    float _580 = _432 * 2.0;
    float _582 = _524 + (-1.0);
    float _584 = _552 + (-1.0);
    float _586 = _558 + (-1.0);
    float _588 = floor(_578);
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _592 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _596 = _576 ? 0 : 1;
    float _598 = fma(_424, _556, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _600 = !_518;
    int _602 = _600 ? 0 : 1;
    float _604 = fma(_498, _556, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _606 = floor(_580);
    float _608 = fma(_528, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _610 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _612 = isnan(_366);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _382 + (-0.5);
    int _624 = ~_596;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _630;
    int _634 = _628;
    if (!_554)
    {
        int _636 = ~_596;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    bool _644 = _588 > 0.0;
    float _646 = fma(_632, _556, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _648 = _588 >= 0.0;
    bool _650 = isnan(_588);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _662 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _664 = isnan(_366);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    bool _674 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _676 = isnan(_366);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _688 = _656 ? 0 : 1;
    float _690 = fma(_660, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _692 = _606 > 0.0;
    float _694 = -_684;
    float _696 = _694 + 1.0;
    bool _698 = _606 >= 0.0;
    bool _700 = isnan(_606);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -_672;
    float _710 = _708 + 1.0;
    float _712 = _620 * _696;
    float _714 = -_620;
    float _716 = _714 + 1.0;
    float _718 = _684 * _710;
    float _720 = _472 + _446;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _722;
    float _726 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _728 = _420 * _716;
    float _730 = fma(_504, _466, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _732 = _500 + _464;
    float _734 = fma(_724, _466, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _736 = _476 + _474;
    float _738 = _726 * _642;
    float _740 = _604 * _728;
    float _742 = _598 * _728;
    float _744 = _566 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _746 = _646 * _728;
    float _748 = -_420;
    float _750 = _748 + 1.0;
    float _752 = fma(_480, _466, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _754 = ~_688;
    int _756 = _754 + 1;
    int _758 = _756 + 1;
    float _760 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[203].x, _738);
    int _762 = _758;
    if (!_644)
    {
        int _764 = ~_688;
        int _766 = _764 + 1;
        _762 = _766;
    }
    int _768 = _762;
    float _770 = _744 * _686;
    bool _772 = !_522;
    int _774 = _772 ? 0 : 1;
    float _776 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].x, _742);
    bool _778 = !_550;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].y, _740);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _794 = _792 != 0;
    float _796 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[143].z, _746);
    float _798 = floor(_760);
    float _800 = _760 + 0.25;
    int _802 = _706 ? 0 : 1;
    float _804 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[203].z, _770);
    bool _806 = !_786;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_608, _712, _782);
    bool _812 = !_790;
    int _814 = _812 ? 0 : 1;
    float _816 = fma(_690, _712, _796);
    float _818 = floor(_800);
    int _820 = abs(_808);
    float _822 = fma(_734, _718, _810);
    int _824 = ~_802;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = fma(_752, _718, _816);
    int _832 = abs(_814);
    float _834 = in.m_73.z;
    int _836 = _828;
    if (!_692)
    {
        int _838 = ~_802;
        int _840 = _838 + 1;
        _836 = _840;
    }
    int _842 = _836;
    float _844 = -_798;
    float _846 = _760 + _844;
    float _848 = float(_820);
    float _850 = _760 * 6.283185482025146484375;
    float _852 = float(_768);
    float _854 = floor(_804);
    float _856 = float(_832);
    float _858 = in.m_75.x;
    float _860 = in.m_75.y;
    float _862 = in.m_75.z;
    float _864 = float(_640);
    float _866 = fma(_530, _712, _776);
    int _868 = abs(_602);
    float _870 = _856 * _852;
    float _872 = -_818;
    float _874 = _800 + _872;
    float _876 = _850 * 0.15915493667125701904296875;
    bool _878 = _846 >= 0.5;
    bool _880 = isnan(_846);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.5);
    bool _886 = _882 || _884;
    float _888 = _870 * (-2.0);
    float _890 = _848 * _864;
    int _892 = abs(_534);
    float _894 = _876 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = fma(_590, _888, _590);
    bool _900 = !_886;
    float _902 = _900 ? 0.5 : (-0.5);
    float _904 = _804 * 6.283185482025146484375;
    float _906 = float(_868);
    float _908 = -_854;
    float _910 = _804 + _908;
    bool _912 = _874 > 0.5;
    float _914 = _902 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _916 = _914 * 2.0;
    float _918 = _904 * 0.15915493667125701904296875;
    int _920 = abs(_774);
    float _922 = _890 * (-2.0);
    float _924 = _906 * _916;
    float _926 = float(_892);
    float _928 = _918 * 6.283185482025146484375;
    float _930 = sin(_928);
    bool _932 = _910 >= 0.5;
    bool _934 = isnan(_910);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.5);
    bool _940 = _936 || _938;
    float _942 = fma(_888, _860, _860);
    float _944 = _896 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _946 = !_546;
    int _948 = _946 ? 0 : 1;
    float _950 = _432 + (-0.5);
    float _952 = _874;
    if (_912)
    {
        float _954 = -_874;
        float _956 = _954 + 1.0;
        _952 = _956;
    }
    float _958 = _952;
    float _960 = fma(_926, _944, _924);
    float _962 = _804 + 0.25;
    int _964 = abs(_948);
    float _966 = fma(_958, 4.0, -1.0);
    bool _968 = !_542;
    int _970 = _968 ? 0 : 1;
    float _972 = floor(_962);
    bool _974 = !_940;
    float _976 = _974 ? 0.5 : (-0.5);
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _980 = float(_920);
    float _982 = _930 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _984 = abs(_970);
    float _986 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].y, _942);
    float _988 = float(_964);
    float _990 = _976 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _992 = _990 * 2.0;
    float _994 = fma(_980, _978, _960);
    float _996 = float(_984);
    float _998 = fma(_898, _566, _986);
    float _1000 = _988 * _992;
    float _1002 = fma(_994, 3.1415927410125732421875, _858);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _732 + _1004;
    float _1008 = -_972;
    float _1010 = _962 + _1008;
    float _1012 = fma(_996, _982, _1000);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1016 = _720 + _1014;
    float _1018 = precise::min((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _736 + _1020;
    bool _1024 = _1010 > 0.5;
    float _1026 = _1016 * _1016;
    float _1028 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1030 = fma(_594, _922, _594);
    float _1032 = fma(_1002, _922, _1002);
    bool _1034 = !_794;
    int _1036 = _1034 ? 0 : 1;
    float _1038 = _1022 * _1022;
    float _1040 = -_1018;
    float _1042 = _1040 + _1028;
    float _1044 = fma(_1006, _1006, _1026);
    int _1046 = abs(_780);
    float _1048 = _408 + (-0.5);
    int _1050 = abs(_1036);
    float _1052 = 1.0 / _1042;
    float _1054 = _1010;
    if (_1024)
    {
        float _1056 = -_1010;
        float _1058 = _1056 + 1.0;
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1038 + _1044;
    float _1064 = float(_1046);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1032);
    float _1068 = fma(_1060, 4.0, -1.0);
    float _1070 = fma(_730, _718, _866);
    float _1072 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].y, _822);
    float _1074 = sqrt(_1062);
    float _1076 = _998 * 0.15915493667125701904296875;
    float _1078 = float(_842);
    float _1080 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = float(_1050);
    float _1084 = fma(_1030, _566, _1066);
    float _1086 = in.m_73.y;
    float _1088 = fma(_1064, _1080, _1012);
    float _1090 = _1076 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1082 * _1078;
    float _1096 = _1084 * 0.15915493667125701904296875;
    float _1098 = fma(_1088, 3.1415927410125732421875, _862);
    float _1100 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1070);
    float _1102 = _1094 * (-2.0);
    float _1104 = in.m_77.x;
    float _1106 = in.m_77.y;
    float _1108 = in.m_77.z;
    float _1110 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[146].z, _830);
    float _1112 = _1076 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = fma(_1098, _1102, _1098);
    float _1118 = fma(_592, _1102, _592);
    float _1120 = precise::max(_1018, _1074);
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _1124 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1116);
    float _1126 = precise::min(_1028, _1120);
    float _1128 = _1096 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = fma(_1118, _566, _1124);
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _482);
    float _1136 = -_1018;
    float _1138 = _1136 + _1126;
    float _1140 = _1132 * 0.15915493667125701904296875;
    float _1142 = _1096 * 6.283185482025146484375;
    float _1144 = cos(_1142);
    float _1146 = -_1138;
    float _1148 = fma(_1146, _1052, 1.0);
    float _1150 = _1148 * _1086;
    float _1152 = _1100 * _1104;
    float _1154 = _1072 * _1106;
    float _1156 = _1140 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    float _1160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1150);
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1166 = _1110 * _1108;
    float _1168 = _1130 * _1092;
    float _1170 = _1162 * _1134;
    float _1172 = _1164 * _1160;
    float _1174 = _1140 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = _1144 * _1114;
    float _1180 = _1144 * _1092;
    float _1182 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1184 = _1130 * _1114;
    float _1186 = _1182 * _1122;
    float _1188 = _1144 * _1158;
    float _1190 = _1130 * _1158;
    float _1192 = _1114 * _1158;
    float _1194 = _1092 * _1158;
    float _1196 = _1188 * _1172;
    float _1198 = in.m_79.y;
    float _1200 = fma(_1176, _1178, _1168);
    float _1202 = -_1172;
    float _1204 = _1176 * _1202;
    float _1206 = -_1184;
    float _1208 = fma(_1176, _1180, _1206);
    float _1210 = -_1180;
    float _1212 = fma(_1176, _1184, _1210);
    float _1214 = fma(_1200, _1170, _1196);
    float _1216 = _1190 * _1172;
    float _1218 = fma(_1192, _1170, _1204);
    float _1220 = fma(_1176, _1168, _1178);
    float _1222 = fma(_1208, _1186, _1214);
    float _1224 = fma(_1212, _1170, _1216);
    float _1226 = fma(_1194, _1186, _1218);
    float _1228 = _1222 * _324;
    float _1230 = fma(_1220, _1186, _1224);
    float _1232 = _1222 * _310;
    float _1234 = _1222 * _320;
    float _1236 = fma(_1226, _292, _1228);
    float _1238 = fma(_1226, _284, _1232);
    float _1240 = fma(_1226, _288, _1234);
    float _1242 = fma(_1230, _336, _1236);
    float _1244 = fma(_1230, _328, _1238);
    float _1246 = fma(_1230, _332, _1240);
    float _1248 = _736 + _1242;
    float _1250 = _720 + _1244;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1254 = _1248 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1258 = _1250 + _1256;
    float _1260 = _1254 * _1254;
    float _1262 = fma(_1258, _1258, _1260);
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = _1264 + _1268;
    float _1272 = _1242;
    float _1274 = _1234;
    float _1276 = _1230;
    float _1278 = _1264;
    float _1280 = _1170;
    float _1282 = _1246;
    float _1284 = _1258;
    if (_1266)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1286;
    }
    float _1288 = _1272;
    if (!_1266)
    {
        _1274 = _1248;
    }
    float _1290 = _1274;
    float _1292 = _1290;
    if (_1266)
    {
        float _1294 = rsqrt(_1262);
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1296;
    if (_1266)
    {
        float _1300 = _1270 * _1288;
        _1278 = _1300;
    }
    float _1302 = _1278;
    if (_1266)
    {
        float _1304 = _1302 * 0.15915493667125701904296875;
        _1280 = _1304;
    }
    float _1306 = _1280;
    float _1308 = _374 + _1198;
    float _1310 = _1288;
    float _1312 = _1306;
    if (_1266)
    {
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = _1308 + _1246;
    if (!_1266)
    {
        _1282 = _1250;
    }
    float _1322 = _1282;
    float _1324 = _1322;
    if (_1266)
    {
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _560 = _1326;
    }
    float _1328 = _560;
    float _1330 = _1328;
    float _1332 = _1318;
    if (_1266)
    {
        float _1334 = fma(_1318, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1330 = _1334;
    }
    float _1336 = _1330;
    if (_1266)
    {
        float _1338 = _1296 * _1336;
        _1298 = _1338;
    }
    float _1340 = _1298;
    if (_1266)
    {
        float _1342 = fma(_1258, _1340, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1324 = _1342;
    }
    float _1344 = _1324;
    float _1346 = _1344;
    if (_1266)
    {
        float _1348 = fma(_1254, _1340, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1292 = _1348;
    }
    float _1350 = _1292;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1354 = _1344 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1358 = _1350 + _1356;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1362 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4871 = float2(_1360, _1362);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4871, float2(0.0), isnan(_4871)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4871, float2(0.0), isnan(_4871)), level(0.0)).x;
    float _1366 = _1340;
    float _1368 = _1354;
    float _1370 = _1358;
    float _1372 = _1362;
    float _1374 = _1350;
    if (_1266)
    {
        float _1376 = _1306 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        _1366 = _1378;
    }
    float _1380 = _1366;
    bool _1382 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1384 = isnan(0.5);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1390 = _1386 || _1388;
    if (!_1266)
    {
        _1368 = _1320;
    }
    float _1392 = _1368;
    float _1394 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1396 = _1392;
    if (!_1390)
    {
        float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1284 = _1398;
    }
    float _1400 = _1284;
    if (_1266)
    {
        float _1402 = _1380 + (-1.0);
        _1332 = _1402;
    }
    float _1404 = _1332;
    float _1406 = _1404;
    if (_1266)
    {
        float _1408 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1370 = _1408;
    }
    float _1410 = _1370;
    float _1412 = _1410;
    if (!_1390)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        _1312 = _1414;
    }
    float _1416 = _1312;
    if (_1266)
    {
        float _1418 = fma(_1320, _1380, _1410);
        _1396 = _1418;
    }
    float _1420 = _1396;
    float _1422 = _1420;
    if (!_1390)
    {
        float _1424 = -_1308;
        float _1426 = _1424 + _1420;
        _1372 = _1426;
    }
    float _1428 = _1372;
    float _1430 = floor(_1394);
    float _1432 = -_1430;
    float _1434 = _1394 + _1432;
    float _1436 = fma(_1364, 100.0, _1308);
    float _1438 = fma(_1364, 100.0, _1420);
    float _1440 = _1364;
    float _1442 = _1438;
    if (!_1390)
    {
        float _1444 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        _1422 = _1444;
    }
    float _1446 = _1422;
    float _1448 = _1446;
    if (!_1390)
    {
        float _1450 = -_736;
        float _1452 = _1450 + _1350;
        _1440 = _1452;
    }
    float _1454 = _1440;
    if (!_1390)
    {
        float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1458 = _1436 + _1456;
        _1412 = _1458;
    }
    float _1460 = _1412;
    float _1462 = _1460;
    if (!_1390)
    {
        float _1464 = fma(_1460, _1460, _1026);
        _1462 = _1464;
    }
    float _1466 = _1462;
    float _1468 = _1466;
    if (!_1390)
    {
        float _1470 = _1038 + _1466;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = _1472;
    if (!_1390)
    {
        float _1476 = sqrt(_1472);
        _1474 = _1476;
    }
    float _1478 = _1474;
    if (!_1390)
    {
        float _1480 = precise::min(_1478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1406 = _1480;
    }
    float _1482 = _1406;
    float _1484 = _1482;
    if (!_1390)
    {
        float _1486 = _1482 * _1400;
        _1484 = _1486;
    }
    float _1488 = _1484;
    float _1490 = _1488;
    if (!_1390)
    {
        float _1492 = _1446 * _1488;
        _1448 = _1492;
    }
    float _1494 = _1448;
    if (!_1390)
    {
        float _1496 = -_720;
        float _1498 = _1496 + _1344;
        _1490 = _1498;
    }
    float _1500 = _1490;
    if (!_1390)
    {
        float _1502 = fma(_1428, _1494, _1436);
        _1442 = _1502;
    }
    float _1504 = _1442;
    if (!_1390)
    {
        float _1506 = fma(_1500, _1494, _720);
        _1346 = _1506;
    }
    float _1508 = _1346;
    if (!_1390)
    {
        float _1510 = fma(_1454, _1494, _736);
        _1374 = _1510;
    }
    float _1512 = _1374;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1504 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1508 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1512 + _1522;
    float _1526 = _1516 * _1516;
    float _1528 = fma(_1520, _1520, _1526);
    float _1530 = fma(_1524, _1524, _1528);
    float _1532 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1534 = rsqrt(_1530);
    float _1536 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1532);
    float _1538 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1536);
    float _1540 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1542 = sqrt(_1530);
    float _1544 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = fma(_720, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1540);
    float _1548 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1546);
    float _1550 = 1.0 / _1544;
    float _1552 = _1534 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1556 = _1520 * _1552;
    float _1558 = _1524 * _1552;
    float _1560 = _1554 + _1544;
    float _1562 = _1556 * _1556;
    float _1564 = _1558 * _1558;
    float _1566 = _1562 + _1564;
    float _1568 = _1560 * _1550;
    float _1570 = _1568 * 0.5;
    float _1572 = sqrt(_1566);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1576 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1574);
    float _1578 = 1.0 / _1576;
    bool _1580 = _1572 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1584 = _1572 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1588 = _1578 * _1586;
    bool _1590 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1592 = _1320;
    float _1594 = _1566;
    int _1596 = 2;
    float _1598 = _1576;
    float _1600 = _1516;
    float _1602 = _1556;
    float _1604 = _1558;
    float _1606 = _1562;
    if (_1580)
    {
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1608;
    }
    float _1610 = _1592;
    bool _1612 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1614 = !_1590;
    int _1616 = _1614 ? 0 : 1;
    if (_1580)
    {
        float _1618 = rsqrt(_1566);
        _1594 = _1618;
    }
    float _1620 = _1594;
    if (!_1590)
    {
        _1596 = 1;
    }
    int _1622 = _1596;
    int _1624 = _1622;
    if (!_1612)
    {
        _1624 = _1616;
    }
    int _1626 = _1624;
    if (_1580)
    {
        float _1628 = _1584 * _1610;
        _1598 = _1628;
    }
    float _1630 = _1598;
    int _1632 = _1626 << 6;
    float _1634 = 0.0;
    if (_1580)
    {
        float _1636 = _1630 * 0.15915493667125701904296875;
        _1634 = _1636;
    }
    float _1638 = _1634;
    float _1640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1642 = _1632 + 64;
    uint _1645 = uint(int(uint(_1642) >> uint(2)));
    uint _1647 = uint(int(uint(int(_1645)) >> uint(2)));
    int _1649 = int(_1645) & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = int(_1645) + 1;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    int _1657 = _1653 & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    float _1661 = 0.0;
    if (_1580)
    {
        float _1663 = _1638 * 6.283185482025146484375;
        float _1665 = cos(_1663);
        _1661 = _1665;
    }
    float _1667 = _1661;
    float _1669 = precise::max(0.0, _1640);
    int _1671 = _1632 + 96;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    float _1689 = 0.0;
    float _1691 = _1669;
    if (_1580)
    {
        float _1693 = _1638 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        _1689 = _1695;
    }
    float _1697 = _1689;
    float _1699 = -_1552;
    float _1701 = -_1669;
    float _1703 = fma(_1516, _1699, _1701);
    if (_1580)
    {
        float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1705;
    }
    float _1707 = _1600;
    int _1709 = _1632 + 48;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.vp_c15)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    float _1727 = _1707;
    if (_1580)
    {
        float _1729 = _1667 + (-1.0);
        _1691 = _1729;
    }
    float _1731 = _1691;
    float _1733 = 0.0;
    if (_1580)
    {
        float _1735 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1733 = _1735;
    }
    float _1737 = _1733;
    int _1739 = _1632 + 104;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    uint _1743 = uint(int(uint(int(_1741)) >> uint(2)));
    int _1745 = int(_1741) & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    int _1749 = int(_1741) + 1;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    int _1753 = _1749 & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    float _1757 = 0.0;
    if (_1580)
    {
        float _1759 = fma(_1697, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = _1761;
    if (!_1580)
    {
        _1727 = _1703;
    }
    float _1765 = _1727;
    float _1767 = _1765;
    if (_1580)
    {
        float _1769 = fma(_1703, _1667, _1737);
        _1767 = _1769;
    }
    float _1771 = _1767;
    float _1773 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1775 = _1773;
    if (_1580)
    {
        float _1777 = _1620 * _1761;
        _1763 = _1777;
    }
    float _1779 = _1763;
    int _1781 = _1632 + 80;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    uint _1785 = uint(int(uint(int(_1783)) >> uint(2)));
    int _1787 = int(_1783) & 3;
    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[int(_1785)][_1787];
    int _1791 = int(_1783) + 1;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    int _1795 = _1791 & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    if (_1580)
    {
        float _1799 = _1556 * _1779;
        _1602 = _1799;
    }
    float _1801 = _1602;
    float _1803 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1773);
    if (_1580)
    {
        float _1805 = _1558 * _1779;
        _1604 = _1805;
    }
    float _1807 = _1604;
    if (!_1580)
    {
        _1775 = _1564;
    }
    float _1809 = _1775;
    float _1811 = _1809;
    if (_1580)
    {
        float _1813 = _1801 * _1801;
        _1606 = _1813;
    }
    float _1815 = _1606;
    float _1817 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1803);
    float _1819 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _1821 = _1632 + 56;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    if (_1580)
    {
        float _1839 = _1807 * _1807;
        _1811 = _1839;
    }
    float _1841 = _1811;
    float _1843 = fma(_1771, _1771, _1815);
    float _1845 = _1436 + _1819;
    float _1847 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1849 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1851 = _1843 + _1841;
    int _1853 = _1632 + 72;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[int(_1865)][_1867];
    float _1871 = _1845 * _1659;
    float _1873 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1875 = rsqrt(_1851);
    float _1877 = _1845 * _1687;
    float _1879 = fma(_720, _1679, _1877);
    float _1881 = _1845 * _1725;
    float _1883 = -_1873;
    float _1885 = fma(_1883, _1849, 1.0);
    float _1887 = fma(_720, _1651, _1871);
    float _1889 = _1875 * _1801;
    float _1891 = fma(_720, _1717, _1881);
    float _1893 = log2(_1885);
    float _1895 = fma(_736, _1747, _1879);
    int _1897 = _1632 + 88;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
    int _1903 = int(_1899) & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    int _1907 = int(_1899) + 1;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    int _1911 = _1907 & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    float _1915 = _1895 + _1755;
    float _1917 = _1845 * _1797;
    float _1919 = 1.0 / _1915;
    float _1921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1923 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1921);
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = fma(_720, _1789, _1917);
    float _1929 = -_1925;
    float _1931 = _1929 + 1.0;
    float _1933 = _1893 * 0.693147182464599609375;
    float _1935 = fma(_736, _1829, _1891);
    float _1937 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1939 = _1935 + _1837;
    float _1941 = fma(_736, _1861, _1887);
    float _1943 = _1875 * _1771;
    float _1945 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1947 = _1875 * _1807;
    float _1949 = _1941 + _1869;
    float _1951 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1937);
    float _1953 = -_1945;
    float _1955 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1953);
    float _1957 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1959 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1951);
    float _1963 = -_1947;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1955);
    float _1967 = abs(_1931);
    float _1969 = log2(_1967);
    float _1971 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1973 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1975 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1977 = _1949 * _1919;
    float _1979 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1971);
    float _1981 = _1939 * _1919;
    float _1983 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1985 = floor(_1957);
    float _1987 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1989 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1975);
    bool _1991 = _1981 >= 0.0;
    float _1993 = fma(_1965, -0.5, 0.5);
    float _1995 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1983);
    float _1997 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1989);
    bool _1999 = _1981 <= 1.0;
    bool _2001 = _1999 && _1991;
    float _2003 = fma(_1965, 0.5, 0.5);
    float _2005 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1995);
    float _2007 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2009 = _1977 >= 0.0;
    bool _2011 = _2009 && _2001;
    float _2013 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2015 = fma(_736, _1905, _1927);
    float _2017 = sqrt(_1993);
    bool _2019 = _1977 <= 1.0;
    bool _2021 = _2019 && _2011;
    float _2023 = -_1985;
    float _2025 = _1957 + _2023;
    float _2027 = fma(_2003, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2029 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2005);
    float _2031 = _2015 + _1913;
    float _2033 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2035 = fma(_2003, _2027, -0.212114393711090087890625);
    float _2037 = exp2(_2013);
    float _2039 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2041 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2033);
    float _2043 = fma(_2003, _2035, 1.570728778839111328125);
    float _2045 = _1943 + 1.0;
    float _2047 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2039);
    float _2049 = _2035;
    float _2051 = _1845;
    if (_2021)
    {
        float _2053 = float(_1626);
        _2049 = _2053;
    }
    float _2055 = _2049;
    float _2057 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2041);
    float _2059 = 1.0 / _2029;
    float _2061 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2047);
    float _2063 = _2017 * 0.636619746685028076171875;
    float _2065 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2057);
    float _2067 = _2031 * _1919;
    float _2069 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2061);
    float _2071 = -_2043;
    float _2073 = fma(_2063, _2071, 1.0);
    float _2075 = _2055;
    if (_2021)
    {
        float _2077 = rint(_2055);
        float _2079 = precise::max(_2077, 0.0);
        uint _2081 = uint(_2079);
        uint _2083 = clamp(_2081, 0u, 65535u);
        _2075 = as_type<float>(_2083);
    }
    float _2085 = _2075;
    float _2087 = -_1943;
    float _2089 = fma(_2037, _2045, _2087);
    float _2091 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6090 = float2(_1434, _2025);
    float _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6090, float2(0.0), isnan(_6090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6090, float2(0.0), isnan(_6090)), level(0.0)).x;
    float _2095 = fma(_2089, 0.5, 0.5);
    float _2097 = _2065 * _2059;
    float _2099 = _2069 * _2059;
    float _2101 = fma(_2097, 0.5, 0.5);
    float _2103 = fma(_2099, -0.5, 0.5);
    float _2105 = _1977;
    if (_2021)
    {
        float3 _6116 = float3(_1981, _1977, float(as_type<int>(_2085)));
        float3 _6120 = select(_6116, float3(0.0), isnan(_6116));
        float _2107 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6120.xy, uint(rint(_6120.z)), _2067, level(0.0));
        _2105 = _2107;
    }
    float _2109 = _2105;
    float3 _6130 = float3(_2101, _2103, _2091);
    float _2111 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6130, float3(0.0), isnan(_6130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6130, float3(0.0), isnan(_6130)), level(0.0)).x;
    float3 _6139 = float3(_2101, _2103, _2091);
    float4 _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6139, float3(0.0), isnan(_6139)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level(0.0)).xyzw;
    float _2116 = _2114.x;
    float _2118 = _2114.y;
    float _2120 = _2114.z;
    float _2122 = _2114.w;
    float2 _6155 = float2(_2073, _2095);
    float3 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6155, float2(0.0), isnan(_6155)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6155, float2(0.0), isnan(_6155)), level(0.0)).xyz;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2136 = in.m_81.y;
    float _2138 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2140 = _1150 != 0.0;
    bool _2142 = isnan(_1150);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = _2134 * _408;
    bool _2152 = _432 > 0.5;
    float _2154 = _2138 * _408;
    bool _2156 = _482 == 0.0;
    bool _2158 = !_2148;
    bool _2160 = _2156 && _2158;
    float _2162 = trunc(_2150);
    int _2164 = int(_2162);
    bool _2166 = _834 == 0.0;
    bool _2168 = _2166 && _2160;
    int _2170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2172 = _2170 != 0;
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2176 = _2174 != 0;
    float _2178 = trunc(_2154);
    int _2180 = int(_2178);
    float _2182 = in.m_81.x;
    bool _2184 = _408 > 0.5;
    bool _2186 = _2184 && _2172;
    int _2188 = _2164 << 4;
    int _2190 = _2188 + 1712;
    float _2192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2194 = in.m_83.x;
    float _2196 = in.m_83.y;
    float _2198 = in.m_83.z;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _2202 = uint(int(uint(_2190) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = _2180 << 4;
    int _2220 = _2218 + 1968;
    float _2222 = -_2136;
    float _2224 = _2222 + 1.0;
    int _2226 = _2190 + 8;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    uint _2230 = uint(int(uint(int(_2228)) >> uint(2)));
    int _2232 = int(_2228) & 3;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[int(_2230)][_2232];
    float _2236 = _2136;
    if (_2176)
    {
        float _2238 = _2152 ? _2224 : _2136;
        _2236 = _2238;
    }
    float _2240 = _2236;
    float _2242 = 0.0;
    if (_2172)
    {
        _2242 = _2182;
    }
    float _2244 = _2242;
    float _2246 = _2244;
    if (!_2172)
    {
        _562 = _2182;
    }
    float _2248 = _562;
    uint _2250 = uint(int(uint(_2220) >> uint(2)));
    uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
    int _2254 = int(_2250) & 3;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[int(_2252)][_2254];
    int _2258 = int(_2250) + 1;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    int _2262 = _2258 & 3;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[int(_2260)][_2262];
    float _2266 = _2248;
    if (_2186)
    {
        float _2268 = -_2244;
        float _2270 = _2268 + 1.0;
        _2246 = _2270;
    }
    float _2272 = _2246;
    float _2274 = _2196;
    float _2276 = _2194;
    float _2278 = _2198;
    if (!_2168)
    {
        float _2280 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2196);
        _2274 = _2280;
    }
    float _2282 = _2274;
    if (!_2168)
    {
        float _2284 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2194);
        _2276 = _2284;
    }
    float _2286 = _2276;
    if (!_2168)
    {
        float _2288 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2198);
        _2278 = _2288;
    }
    float _2290 = _2278;
    int _2292 = _2220 + 8;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    uint _2296 = uint(int(uint(int(_2294)) >> uint(2)));
    int _2298 = int(_2294) & 3;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[int(_2296)][_2298];
    float _2302 = _1188 * _2282;
    float _2304 = -_2282;
    float _2306 = _1176 * _2304;
    float _2308 = _1190 * _2282;
    float _2310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2312 = fma(_1200, _2286, _2302);
    float _2314 = fma(_1192, _2286, _2306);
    float _2316 = fma(_1212, _2286, _2308);
    if (_2172)
    {
        _2266 = _2272;
    }
    float _2318 = _2266;
    float _2320 = fma(_1208, _2290, _2312);
    float _2322 = fma(_1194, _2290, _2314);
    float _2324 = fma(_1220, _2290, _2316);
    float _2326 = _2320 * _310;
    float _2328 = _2320 * _320;
    float _2330 = _2320 * _324;
    float _2332 = fma(_2322, _284, _2326);
    float _2334 = fma(_2322, _288, _2328);
    float _2336 = fma(_2322, _292, _2330);
    float _2338 = fma(_2324, _328, _2332);
    float _2340 = fma(_2324, _332, _2334);
    float _2342 = fma(_2324, _336, _2336);
    float _2344 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2346 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2348 = abs(_1588);
    float _2350 = log2(_2348);
    float _2352 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2354 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2344);
    float _2356 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2346);
    float _2358 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2360 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2362 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2354);
    float _2364 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2356);
    float _2366 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2368 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2370 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2372 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2374 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2376 = trunc(_2370);
    int _2378 = int(_2376);
    float _2380 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2382 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_85.x = _2366;
    out.m_85.y = _2368;
    out.m_85.z = _2374;
    out.m_85.w = _2200;
    float _2384 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2386 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2390 = trunc(_2372);
    int _2392 = int(_2390);
    float _2394 = _2300 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2396 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = exp2(_2382);
    float _2402 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2404 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_87.x = _2388;
    out.m_87.y = _2396;
    out.m_87.z = _2398;
    float _2406 = _2402 * _2310;
    float _2408 = _2404 * _2192;
    int _2410 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2412 = _2392 + _2410;
    int _2414 = _2412 + 1;
    out.m_89.x = _2408;
    out.m_89.y = _2406;
    bool _2416 = _1588 <= 8000.0;
    bool _2418 = isnan(_1588);
    bool _2420 = _2416 || _2418;
    bool _2422 = isnan(8000.0);
    bool _2424 = _2420 || _2422;
    float _2426 = float(_2424);
    float _2428 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2430 = precise::clamp(_2428, 0.0, 1.0);
    int _2432 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2434 = _2378 + _2432;
    int _2436 = _2434 + 1;
    float _2438 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2384);
    float _2440 = in.m_91.x;
    bool _2442 = _2436 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2444 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2438);
    int _2446 = _2436 | _2414;
    float _2448 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2450 = fma(_2430, -2.0, 3.0);
    float _2452 = _2430 * _2430;
    bool _2454 = _2446 < 0;
    bool _2456 = _2454 || _2442;
    float _2458 = exp2(_2448);
    bool _2460 = _2414 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2462 = _2460 || _2456;
    float _2464 = _2452 * _2450;
    float _2466 = fma(_2007, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2444);
    float _2468 = -_2464;
    float _2470 = _2468 + 1.0;
    float _2472 = _2466 + _2029;
    float _2474 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2476 = _2472 * 0.5;
    float _2478 = _2472;
    float _2480 = _2476;
    if (_2462)
    {
        _2478 = 1.0;
    }
    float _2482 = _2478;
    float _2484 = _2482;
    float _2486 = _2440;
    if (!_2462)
    {
        int _2488 = _2414 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2490 = _2488 + _2436;
        float _2492 = floor(_2372);
        int _2494 = _2490 << 2;
        uint _2496 = uint(int(uint(_2490) >> uint(2)));
        int _2498 = 12 & _2494;
        int _2500 = int(_2496) << 4;
        int _2502 = _2500 + _2498;
        float _2504 = floor(_2370);
        float _2506 = -_2492;
        float _2508 = _2372 + _2506;
        int _2510 = _2502 + 400;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        uint _2514 = uint(int(uint(int(_2512)) >> uint(2)));
        int _2516 = int(_2512) & 3;
        float _2518 = (*spvDescriptorSet0.vp_c15)._m0[int(_2514)][_2516];
        float _2520 = -_2504;
        float _2522 = _2370 + _2520;
        float _2524 = rint(_2518);
        float _2526 = precise::max(_2524, 0.0);
        uint _2528 = uint(_2526);
        uint _2530 = clamp(_2528, 0u, 65535u);
        float3 _6827 = float3(_2522, _2508, float(int(_2530)));
        float3 _6829 = select(_6827, float3(0.0), isnan(_6827));
        float _2532 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6829.xy, uint(rint(_6829.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6829.xy, uint(rint(_6829.z)), level(0.0)).x;
        int _2534 = _2490 << 4;
        int _2536 = _2534 + 2048;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        uint _2540 = uint(int(uint(int(_2538)) >> uint(2)));
        int _2542 = int(_2538) & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = int(_2538) + 1;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        int _2550 = _2546 & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        int _2554 = _2536 + 8;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        uint _2558 = uint(int(uint(int(_2556)) >> uint(2)));
        int _2560 = int(_2556) & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        int _2564 = int(_2556) + 1;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        int _2568 = _2564 & 3;
        float _2570 = (*spvDescriptorSet0.vp_c15)._m0[int(_2566)][_2568];
        float _2572 = _1845 * _2552;
        float _2574 = fma(_720, _2544, _2572);
        float _2576 = fma(_736, _2562, _2574);
        float _2578 = _2576 + _2570;
        float _2580 = precise::clamp(_2578, 0.0, 1.0);
        float _2582 = -_2580;
        float _2584 = _2582 + _2532;
        float _2586 = fma(_2584, 500.0, 1.5);
        float _2588 = exp2(_2586);
        float _2590 = 0.0 + _2588;
        float _2592 = precise::clamp(_2590, 0.0, 1.0);
        _2051 = _2588;
        _2484 = _2592;
    }
    float _2594 = _2051;
    float _2596 = _2484;
    float _2598 = _2426 * _2474;
    float _2600 = in.m_91.z;
    float _2602 = -_2458;
    float _2604 = _2602 + 1.0;
    float _2606 = -_2093;
    float _2608 = _2606 + 1.0;
    float _2610 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = in.m_91.w;
    float _2614 = _2594;
    if (!_2021)
    {
        _2614 = 1.0;
    }
    float _2616 = _2614;
    float _2618 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2620 = _2616;
    if (_2021)
    {
        bool _2622 = _2109 >= _2067;
        bool _2624 = isnan(_2109);
        bool _2626 = _2622 || _2624;
        bool _2628 = isnan(_2067);
        bool _2630 = _2626 || _2628;
        float _2632 = float(_2630);
        _2620 = _2632;
    }
    float _2634 = _2620;
    float _2636 = _2608 * _2610;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    out.gl_Position.x = _2065;
    out.gl_Position.y = _2069;
    out.gl_Position.z = _2466;
    out.gl_Position.w = _2029;
    float _2640 = _2618 * _2111;
    float _2642 = -_2618;
    float _2644 = _2642 + 1.0;
    float _2646 = _2634 * _2596;
    float _2648 = -_2638;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = _2132 * _2640;
    out.m_93.z = _2476;
    out.m_93.w = _2029;
    bool _2654 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2656 = isnan(_1542);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2662 = _2658 || _2660;
    float _2664 = -_2646;
    float _2666 = fma(_2664, _2650, 1.0);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = in.m_91.y;
    float _2672 = _2122 * _2640;
    float _2674 = _2122 * _2644;
    float _2676 = _2668 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2678 = fma(_2122, _2652, _2120);
    float _2680 = fma(_2128, _2672, _2116);
    float _2682 = fma(_2130, _2672, _2118);
    out.m_95.z = _2600;
    float _2684 = _2644;
    float _2686 = _2646;
    float _2688 = _2668;
    if (!_2662)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2690 = _2684;
    float _2692 = _2690;
    float _2694 = _2690;
    if (!_2662)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2696 = _2480;
    out.m_95.w = _2612;
    float _2698 = _2696;
    float _2700 = _2696;
    if (!_2662)
    {
        _2686 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2702 = _2686;
    float _2704 = _2702;
    float _2706 = _2702;
    if (!_2662)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2708 = _2688;
    out.m_97.x = _2676;
    out.m_99.x = _2680;
    out.m_99.y = _2682;
    out.m_99.z = _2678;
    out.m_99.w = _2674;
    out.m_101.x = _2338;
    out.m_101.y = _2340;
    out.m_101.z = _2342;
    out.m_95.x = _2440;
    out.m_95.y = _2670;
    float _2710 = _2670;
    float _2712 = _2708;
    float _2714 = _2708;
    if (!_2662)
    {
        _2486 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2486;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2662)
    {
        _2710 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2722 = _2710;
    bool _2724 = !_2662;
    float _2726 = _2722;
    float _2728 = _2722;
    if (!_2724)
    {
        bool _2730 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2732 = isnan(_1542);
        bool _2734 = _2730 || _2732;
        bool _2736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2738 = _2734 || _2736;
        if (!_2738)
        {
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2742 = _1542 + _2740;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2744;
            float _2748 = 1.0 / _2746;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2770 = _2742 * _2748;
            float _2772 = precise::clamp(_2770, 0.0, 1.0);
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2778 = fma(_2772, _2752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2780 = fma(_2772, _2776, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2782 = fma(_2772, _2756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2784 = fma(_2772, _2760, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2786 = fma(_2772, _2764, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2788 = fma(_2772, _2768, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2694 = _2778;
            _2728 = _2786;
            _2720 = _2780;
            _2706 = _2784;
            _2700 = _2782;
            _2714 = _2788;
            _2790 = true;
        }
        else
        {
            bool _2792 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2794 = isnan(_1542);
            bool _2796 = _2792 || _2794;
            bool _2798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2800 = _2796 || _2798;
            if (!_2800)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2802 = _2718;
            _2720 = _2802;
            if (!_2800)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2804 = _2692;
            _2694 = _2804;
            if (!_2800)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2806 = _2698;
            _2700 = _2806;
            if (!_2800)
            {
                _2704 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2808 = _2704;
            _2706 = _2808;
            if (!_2800)
            {
                _2726 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2810 = _2726;
            _2728 = _2810;
            if (!_2800)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2812 = _2712;
            bool _2814 = !_2800;
            _2714 = _2812;
            if (!_2814)
            {
                bool _2816 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2818 = isnan(_1542);
                bool _2820 = _2816 || _2818;
                bool _2822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2824 = _2820 || _2822;
                if (!_2824)
                {
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2828 = _1542 + _2826;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2832 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2830;
                    float _2834 = 1.0 / _2832;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2856 = _2828 * _2834;
                    float _2858 = precise::clamp(_2856, 0.0, 1.0);
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2864 = fma(_2858, _2838, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2866 = fma(_2858, _2862, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2868 = fma(_2858, _2842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2870 = fma(_2858, _2846, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2872 = fma(_2858, _2850, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2874 = fma(_2858, _2854, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2694 = _2864;
                    _2728 = _2872;
                    _2720 = _2866;
                    _2706 = _2870;
                    _2700 = _2868;
                    _2714 = _2874;
                    _2790 = true;
                }
                else
                {
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2728 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2706 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2790 = false;
    float _2876 = _2694;
    float _2878 = _2728;
    float _2880 = _2720;
    float _2882 = _2706;
    float _2884 = _2700;
    float _2886 = _2714;
    float _2888 = fma(_2340, -0.5, 0.5);
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = -_2876;
    float _2894 = _2892 + _2878;
    float _2896 = -_2880;
    float _2898 = _2896 + _2882;
    float _2900 = -_2884;
    float _2902 = _2900 + _2886;
    bool _2904 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2906 = fma(_2890, _2894, _2876);
    float _2908 = fma(_2890, _2898, _2880);
    float _2910 = fma(_2890, _2902, _2884);
    float _2912 = _2906 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2914 = fma(_2908, 0.298911988735198974609375, _2912);
    float _2916 = fma(_2910, 0.114477999508380889892578125, _2914);
    out.m_103.x = 0.0;
    float _2918 = -_2916;
    float _2920 = _2908 + _2918;
    float _2922 = -_2916;
    float _2924 = _2906 + _2922;
    float _2926 = -_2916;
    float _2928 = _2910 + _2926;
    float _2930 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2932 = fma(_2920, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2916);
    out.m_97.w = _2930;
    out.m_105.x = _2932;
    out.m_105.y = _2934;
    out.m_105.z = _2936;
    if (!_2904)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2938 = -_1504;
    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2942 = -_1508;
    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2946 = -_1512;
    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2950 = _2940 * _2940;
    float _2952 = fma(_2944, _2944, _2950);
    float _2954 = fma(_2948, _2948, _2952);
    float _2956 = sqrt(_2954);
    float _2958 = rsqrt(_2954);
    float _2960 = -_2956;
    float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2964 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2966 = precise::clamp(_2964, 0.0, 1.0);
    float _2968 = _2944 * _2958;
    float _2970 = _2940 * _2958;
    float _2972 = abs(_2966);
    float _2974 = log2(_2972);
    float _2976 = _2948 * _2958;
    float _2978 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2980 = _2340 * _2970;
    float _2982 = -_2970;
    float _2984 = -_2978;
    float _2986 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2984);
    float _2988 = fma(_2338, _2968, _2980);
    float _2990 = -_2976;
    float _2992 = fma(_2990, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2986);
    float _2994 = fma(_2342, _2976, _2988);
    float _2996 = precise::clamp(_2994, 0.0, 1.0);
    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3000 = _2992 + _2998;
    float _3002 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3004 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3006 = precise::clamp(_3004, 0.0, 1.0);
    float _3008 = exp2(_3002);
    float _3010 = _3008 * _3006;
    float _3012 = _2996 * _3010;
    float _3014 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3016 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3018 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _3014;
    out.m_103.y = _3016;
    out.m_103.z = _3018;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

