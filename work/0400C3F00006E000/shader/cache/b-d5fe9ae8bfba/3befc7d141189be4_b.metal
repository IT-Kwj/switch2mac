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
    float4 m_91 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_113 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_97 [[user(locn7)]];
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
    float4 m_87 [[attribute(11)]];
    float4 m_81 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2672 = false;
    bool _1543 = false;
    bool _366 = false;
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
        float _2957 = as_type<float>(_148);
        out.gl_Position.z = _2957;
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
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_63.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3026 = as_type<float>(_186);
        out.gl_Position.z = _3026;
    }
    if (_180)
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
    float _208 = _192 * _192;
    float _210 = _190 * _190;
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_198, _198, _208);
    float _216 = fma(_196, _196, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_204, _204, _214);
    float _222 = fma(_202, _202, _216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    float _228 = sqrt(_222);
    bool _230 = _224 > 0.0;
    bool _232 = _226 > 0.0;
    float _234 = _226;
    float _236 = _224;
    if (_230)
    {
        float _238 = rsqrt(_218);
        _234 = _238;
    }
    float _240 = _234;
    if (!_230)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    bool _244 = _228 > 0.0;
    float _246 = _228;
    float _248 = _242;
    if (!_230)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = 0.0;
    float _254 = _250;
    if (!_230)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (_232)
    {
        float _262 = rsqrt(_220);
        _258 = _262;
    }
    float _264 = _258;
    float _266 = 0.0;
    float _268 = 0.0;
    if (!_232)
    {
        _266 = 0.0;
        _268 = 0.0;
    }
    float _270 = _266;
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    float _278 = _270;
    if (!_232)
    {
        _274 = 0.0;
    }
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    if (_244)
    {
        float _286 = rsqrt(_222);
        _282 = _286;
    }
    float _288 = _282;
    float _290 = _240;
    if (_230)
    {
        float _292 = _240 * _194;
        _254 = _292;
    }
    float _294 = _254;
    if (_230)
    {
        float _296 = _240 * _188;
        _248 = _296;
    }
    float _298 = _248;
    if (_230)
    {
        float _300 = _240 * _200;
        _260 = _300;
    }
    float _302 = _260;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = 0.0;
    if (!_244)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = 0.0;
    float _312 = _308;
    if (!_244)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = _314;
    if (_232)
    {
        float _318 = _264 * _198;
        _284 = _318;
    }
    float _320 = _284;
    if (!_244)
    {
        _290 = 0.0;
    }
    float _322 = _290;
    float _324 = _322;
    if (_232)
    {
        float _326 = _264 * _192;
        _276 = _326;
    }
    float _328 = _276;
    if (_232)
    {
        float _330 = _264 * _204;
        _278 = _330;
    }
    float _332 = _278;
    if (_244)
    {
        float _334 = _288 * _196;
        _312 = _334;
    }
    float _336 = _312;
    if (_244)
    {
        float _338 = _288 * _190;
        _316 = _338;
    }
    float _340 = _316;
    if (_244)
    {
        float _342 = _288 * _202;
        _324 = _342;
    }
    float _344 = _324;
    bool _346 = !_304;
    float _364;
    if (!_346)
    {
        float _348 = in.m_73.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_132);
        float _370 = 1.0 / _368;
        float _372 = _166 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_73.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = _374 + _378;
    float _382 = in.m_73.x;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _384;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _398 = _396 != 0;
    float _400 = in.m_60.x;
    float _402 = in.m_60.y;
    float _404 = in.m_60.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = 1.0 / _386;
    float _412 = in.m_73.y;
    float _414 = 1.0 / _408;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _374 + _416;
    float _420 = _376 * 2.0;
    float _422 = _380 * _410;
    float _424 = floor(_420);
    float _426 = _382 * 2.0;
    float _428 = _202 * _402;
    float _430 = _196 * _402;
    float _432 = _418 * _414;
    float _434 = _190 * _402;
    float _436 = floor(_426);
    float _438 = _412 + _376;
    float _440 = fma(_200, _400, _428);
    float _442 = _382 + _376;
    float _444 = fma(_194, _400, _430);
    float _446 = _438 + (-1.0);
    float _448 = _412 * 2.0;
    float _450 = _442 + (-1.0);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _424 > 0.0;
    float _458 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _460 = _382 + _412;
    float _462 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _464 = _424 >= 0.0;
    bool _466 = isnan(_424);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_198, _404, _444);
    bool _476 = !_390;
    int _478 = _476 ? 0 : 1;
    float _480 = _460 + (-1.0);
    float _482 = floor(_448);
    int _484 = _472 ? 0 : 1;
    float _486 = fma(_188, _400, _434);
    bool _488 = _436 > 0.0;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _492 = abs(_478);
    float _494 = _454 * _166;
    int _496 = ~_484;
    int _498 = _496 + 1;
    int _500 = _498 + 1;
    float _502 = fma(_192, _404, _486);
    bool _504 = _436 >= 0.0;
    bool _506 = isnan(_436);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    int _514 = _500;
    float _516 = _502;
    float _518 = _376;
    if (!_456)
    {
        int _520 = ~_484;
        int _522 = _520 + 1;
        _514 = _522;
    }
    int _524 = _514;
    float _526 = exp2(_494);
    int _528 = _512 ? 0 : 1;
    float _530 = float(_492);
    float _532 = float(_524);
    int _534 = ~_528;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    int _540 = _538;
    if (!_488)
    {
        int _542 = ~_528;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    float _548 = _530 * _532;
    float _550 = in.m_75.x;
    float _552 = in.m_75.y;
    float _554 = in.m_75.z;
    bool _556 = !_394;
    int _558 = _556 ? 0 : 1;
    float _560 = _548 * (-2.0);
    bool _562 = _482 > 0.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _566 = 1.0 + _564;
    int _568 = abs(_558);
    float _570 = -_526;
    float _572 = _570 + 1.0;
    bool _574 = _482 >= 0.0;
    bool _576 = isnan(_482);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = 1.0 / _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    bool _590 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(1.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _600;
    float _604 = float(_546);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _606;
    bool _610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _618 = _614 || _616;
    float _620 = fma(_588, _422, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _622 = float(_568);
    float _624 = fma(_602, _422, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _626 = _618 ? _572 : 0.0;
    float _628 = fma(_608, _422, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = fma(_490, _560, _490);
    float _632 = _622 * _604;
    int _634 = _582 ? 0 : 1;
    float _636 = fma(_560, _550, _550);
    float _638 = _382 + (-0.5);
    float _640 = _632 * (-2.0);
    if (_598)
    {
        float _642 = _626 * _584;
        _170 = _642;
    }
    float _644 = _170;
    float _646 = _412 + (-0.5);
    bool _648 = !_398;
    int _650 = _648 ? 0 : 1;
    float _652 = fma(_640, _552, _552);
    float _654 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[196].x, _636);
    int _656 = ~_634;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_458, _640, _458);
    bool _664 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _666 = isnan(_374);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _680 = _660;
    if (!_562)
    {
        int _682 = ~_634;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _652);
    int _690 = abs(_650);
    float _692 = -_674;
    float _694 = _692 + 1.0;
    bool _696 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _698 = isnan(_374);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = fma(_630, _644, _654);
    bool _710 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _712 = isnan(_374);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _730 = float(_686);
    float _732 = _720 * _694;
    float _734 = -_720;
    float _736 = _734 + 1.0;
    float _738 = float(_690);
    float _740 = fma(_724, _432, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _742 = fma(_728, _432, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _744 = fma(_678, _432, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _746 = _706 * _736;
    float _748 = _738 * _730;
    float _750 = _708 * 0.15915493667125701904296875;
    float _752 = fma(_662, _644, _688);
    float _754 = _620 * _746;
    float _756 = _748 * (-2.0);
    float _758 = in.m_77.x;
    float _760 = in.m_77.y;
    float _762 = in.m_77.z;
    float _764 = _752 * 0.15915493667125701904296875;
    float _766 = _624 * _746;
    float _768 = fma(_756, _554, _554);
    float _770 = _376 + (-0.5);
    float _772 = _628 * _746;
    float _774 = -_706;
    float _776 = _774 + 1.0;
    float _778 = in.m_79.x;
    float _780 = in.m_79.y;
    float _782 = in.m_79.z;
    float _784 = fma(_462, _756, _462);
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _754);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _772);
    float _794 = fma(_784, _644, _786);
    float _796 = fma(_740, _732, _788);
    float _798 = fma(_742, _732, _790);
    float _800 = fma(_744, _732, _792);
    float _802 = _794 * 0.15915493667125701904296875;
    float _804 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].x, _796);
    float _806 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].y, _798);
    float _808 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].z, _800);
    float _810 = _750 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _808 * _762;
    float _816 = _804 * _758;
    float _818 = _806 * _760;
    float _820 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _822 = _764 * 6.283185482025146484375;
    float _824 = sin(_822);
    float _826 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _778);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _780);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _834 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _836 = _828 * _826;
    float _838 = _764 * 6.283185482025146484375;
    float _840 = cos(_838);
    float _842 = _830 * _834;
    float _844 = _832 * _820;
    float _846 = in.m_69.w;
    float _848 = in.m_71.w;
    float _850 = _802 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _812 * _824;
    float _856 = _750 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _812 * _840;
    float _862 = _802 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _812 * _852;
    float _868 = _474 + _846;
    float _870 = _858 * _824;
    float _872 = _858 * _840;
    float _874 = _866 * _842;
    float _876 = _840 * _852;
    float _878 = _858 * _852;
    float _880 = _824 * _852;
    float _882 = fma(_864, _860, _870);
    float _884 = -_842;
    float _886 = _864 * _884;
    float _888 = -_872;
    float _890 = fma(_864, _854, _888);
    float _892 = -_854;
    float _894 = fma(_864, _872, _892);
    float _896 = fma(_882, _836, _874);
    float _898 = fma(_876, _836, _886);
    float _900 = _878 * _842;
    float _902 = fma(_864, _870, _860);
    float _904 = fma(_890, _844, _896);
    float _906 = fma(_880, _844, _898);
    float _908 = fma(_894, _836, _900);
    float _910 = fma(_204, _404, _440);
    float _912 = _904 * _336;
    float _914 = _904 * _344;
    float _916 = fma(_902, _844, _908);
    float _918 = _910 + _848;
    float _920 = fma(_906, _294, _912);
    float _922 = fma(_906, _302, _914);
    float _924 = in.m_67.w;
    float _926 = _904 * _340;
    float _928 = fma(_916, _320, _920);
    float _930 = fma(_916, _332, _922);
    float _932 = fma(_906, _298, _926);
    float _934 = _868 + _928;
    float _936 = _918 + _930;
    float _938 = fma(_916, _328, _932);
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _942 = _934 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _946 = _936 + _944;
    float _948 = _942 * _942;
    float _950 = _946 * _946;
    float _952 = _948 + _950;
    float _954 = sqrt(_952);
    float _956 = _502 + _924;
    float _958 = _956 + _938;
    bool _960 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _954 + _962;
    float _966 = _754;
    float _968 = _916;
    float _970 = _934;
    float _972 = _936;
    float _974 = _882;
    float _976 = _958;
    float _978 = _948;
    float _980 = _950;
    float _982 = _876;
    float _984 = _890;
    if (_960)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _986;
    }
    float _988 = _966;
    if (_960)
    {
        float _990 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _990;
    }
    float _992 = _516;
    float _994 = _992;
    if (_960)
    {
        float _996 = rsqrt(_952);
        _968 = _996;
    }
    float _998 = _968;
    float _1000 = _988;
    float _1002 = _998;
    if (_960)
    {
        float _1004 = _964 * _988;
        _1000 = _1004;
    }
    float _1006 = _1000;
    float _1008 = _1006;
    if (_960)
    {
        float _1010 = _1006 * 0.15915493667125701904296875;
        _1008 = _1010;
    }
    float _1012 = _1008;
    float _1014 = _188;
    float _1016 = _1012;
    if (_960)
    {
        float _1018 = _1012 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        _1014 = _1020;
    }
    float _1022 = _1014;
    if (_960)
    {
        float _1024 = fma(_1022, _992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _1024;
    }
    float _1026 = _994;
    if (_960)
    {
        float _1028 = _998 * _1026;
        _1002 = _1028;
    }
    float _1030 = _1002;
    if (_960)
    {
        float _1032 = fma(_942, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _970 = _1032;
    }
    float _1034 = _970;
    if (_960)
    {
        float _1036 = fma(_946, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _972 = _1036;
    }
    float _1038 = _972;
    float _1040 = fma(_1034, 6.2500002968590706586837768554688e-05, 0.5);
    float _1042 = fma(_1038, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4270 = float2(_1040, _1042);
    float3 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4270, float2(0.0), isnan(_4270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4270, float2(0.0), isnan(_4270)), level(0.0)).xyz;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1056 = in.m_81.y;
    float _1058 = _1054 * _382;
    float _1060 = in.m_73.w;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1068 = _1066 != 0;
    float _1070 = in.m_81.x;
    float _1072 = trunc(_1058);
    int _1074 = int(_1072);
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1082 = _1080 != 0;
    bool _1084 = _412 > 0.5;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1086 = -_1056;
    float _1088 = _1086 + 1.0;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1092 = _1074 << 4;
    int _1094 = _1092 + 1968;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1100 = _1060 > 0.5;
    uint _1103 = uint(int(uint(_1094) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = in.m_85.x;
    float _1121 = in.m_85.y;
    float _1123 = in.m_85.z;
    float _1125 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1127 = _1100 ? as_type<int>(_1088) : as_type<int>(_1056);
    int _1129 = 0;
    bool _1131 = _1082;
    float _1133 = _1056;
    bool _1135 = _1084;
    float _1137 = 1.0;
    float _1139 = _1098;
    float _1141 = _1038;
    if (_1064)
    {
        float _1143 = -_1070;
        float _1145 = _1143 + 1.0;
        _1129 = as_type<int>(_1145);
    }
    int _1147 = _1129;
    bool _1149 = _780 != 0.0;
    bool _1151 = isnan(_780);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1082 ? as_type<float>(_1127) : _1056;
    int _1163 = _1094 + 8;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[int(_1167)][_1169];
    bool _1173 = _778 == 0.0;
    bool _1175 = !_1157;
    bool _1177 = _1173 && _1175;
    int _1179 = _1147;
    if (_1064)
    {
        bool _1181 = _382 > 0.5;
        _1131 = _1181;
    }
    bool _1183 = _1131;
    float _1185 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1068)
    {
        float _1187 = _1084 ? _1088 : _1056;
        _1133 = _1187;
    }
    float _1189 = _1133;
    bool _1191 = _782 == 0.0;
    bool _1193 = _1191 && _1177;
    float _1195 = in.m_87.x;
    float _1197 = in.m_87.y;
    float _1199 = in.m_87.z;
    float _1201 = in.m_87.w;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1078)
    {
        bool _1205 = _376 > 0.5;
        _1135 = _1205;
    }
    bool _1207 = _1135;
    if (!_1064)
    {
        _1137 = _1070;
    }
    float _1209 = _1137;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1213 = _1209;
    if (_1064)
    {
        float _1215 = _1183 ? as_type<float>(_1147) : _1070;
        _1213 = _1215;
    }
    float _1217 = _1213;
    if (_1078)
    {
        float _1219 = -_1070;
        float _1221 = _1219 + 1.0;
        _1179 = as_type<int>(_1221);
    }
    int _1223 = _1179;
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = 0.0;
    float _1229 = _1119;
    if (_1193)
    {
        _1227 = _1119;
    }
    float _1231 = _1227;
    out.m_89.x = _1125;
    out.m_89.y = _1225;
    out.m_89.z = _1159;
    out.m_89.w = _1098;
    float _1233 = _1231;
    if (_1193)
    {
        _518 = _1231;
    }
    float _1235 = _518;
    float _1237 = _1235;
    if (!_1193)
    {
        _1233 = _1119;
    }
    float _1239 = _1233;
    if (!_1078)
    {
        _1229 = _1070;
    }
    float _1241 = _1229;
    float _1243 = _1241;
    if (_1078)
    {
        float _1245 = _1207 ? as_type<float>(_1223) : _1070;
        _1243 = _1245;
    }
    float _1247 = _1243;
    if (!_1193)
    {
        float _1249 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1239);
        _1237 = _1249;
    }
    float _1251 = _1237;
    if (_1193)
    {
        _1139 = _1121;
    }
    float _1253 = _1139;
    float _1255 = _1253;
    if (!_1193)
    {
        float _1257 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1121);
        _1255 = _1257;
    }
    float _1259 = _1255;
    float _1261 = _1197 * _1123;
    float _1263 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1265 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1267 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1199 * _1239;
    float _1271 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1265;
    if (_1193)
    {
        _1273 = _1123;
    }
    float _1275 = _1273;
    float _1277 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1279 = _1275;
    if (!_1193)
    {
        float _1281 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1123);
        _1279 = _1281;
    }
    float _1283 = _1279;
    float _1285 = -_1269;
    float _1287 = fma(_1195, _1123, _1285);
    float _1289 = _1195 * _1121;
    float _1291 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = -_1261;
    float _1295 = fma(_1199, _1121, _1293);
    float _1297 = _1287 * _1201;
    float _1299 = -_1289;
    float _1301 = fma(_1197, _1239, _1299);
    float _1303 = -_1197;
    float _1305 = _864 * _1303;
    out.m_91.x = _1271;
    out.m_91.y = _1267;
    out.m_91.z = _1291;
    float _1307 = _1295 * _1201;
    float _1309 = _1301 * _1201;
    float _1311 = _866 * _1197;
    float _1313 = _878 * _1197;
    float _1315 = fma(_876, _1195, _1305);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1319 = fma(_882, _1195, _1311);
    float _1321 = fma(_894, _1195, _1313);
    float _1323 = -_1259;
    float _1325 = _864 * _1323;
    float _1327 = -_1297;
    float _1329 = _864 * _1327;
    float _1331 = _866 * _1259;
    float _1333 = _878 * _1259;
    float _1335 = _866 * _1297;
    float _1337 = _878 * _1297;
    float _1339 = fma(_876, _1251, _1325);
    float _1341 = fma(_894, _1251, _1333);
    float _1343 = fma(_882, _1251, _1331);
    float _1345 = fma(_894, _1307, _1337);
    float _1347 = fma(_876, _1307, _1329);
    float _1349 = _1337;
    if (_960)
    {
        float _1351 = _1012 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = fma(_882, _1307, _1335);
    float _1359 = fma(_880, _1283, _1339);
    float _1361 = fma(_890, _1283, _1343);
    float _1363 = fma(_902, _1283, _1341);
    float _1365 = fma(_890, _1199, _1319);
    float _1367 = fma(_880, _1199, _1315);
    float _1369 = fma(_880, _1309, _1347);
    float _1371 = fma(_902, _1199, _1321);
    float _1373 = fma(_902, _1309, _1345);
    float _1375 = _1365 * _336;
    float _1377 = _1365 * _340;
    float _1379 = _1365 * _344;
    float _1381 = fma(_890, _1309, _1357);
    float _1383 = _1361 * _336;
    float _1385 = _1361 * _340;
    float _1387 = _1365;
    float _1389 = _1361;
    float _1391 = _1367;
    if (_960)
    {
        float _1393 = _1355 + (-1.0);
        _1387 = _1393;
    }
    float _1395 = _1387;
    float _1397 = _1361 * _344;
    if (_960)
    {
        float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1401 = _1034 + _1399;
        _1389 = _1401;
    }
    float _1403 = _1389;
    float _1405 = _1381 * _344;
    if (_960)
    {
        float _1407 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _1407;
    }
    float _1409 = _974;
    float _1411 = fma(_1367, _294, _1375);
    float _1413 = fma(_1367, _298, _1377);
    float _1415 = fma(_1367, _302, _1379);
    if (_960)
    {
        float _1417 = fma(_958, _1355, _1409);
        _976 = _1417;
    }
    float _1419 = _976;
    if (_960)
    {
        float _1421 = _1403 * _1403;
        _978 = _1421;
    }
    float _1423 = _978;
    if (_960)
    {
        float _1425 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1427 = _1038 + _1425;
        _1391 = _1427;
    }
    float _1429 = _1391;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1435 = _1419 + _1433;
    float _1437 = _1381 * _336;
    if (_960)
    {
        float _1439 = _1429 * _1429;
        _980 = _1439;
    }
    float _1441 = _980;
    float _1443 = _1381 * _340;
    float _1445 = fma(_1435, _1435, _1423);
    float _1447 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1449 = fma(_1359, _294, _1383);
    float _1451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1453 = _1445 + _1441;
    float _1455 = fma(_1369, _294, _1437);
    float _1457 = fma(_1359, _298, _1385);
    float _1459 = fma(_1369, _298, _1443);
    float _1461 = fma(_1359, _302, _1397);
    float _1463 = fma(_1369, _302, _1405);
    float _1465 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1469 = _1447 * _1317;
    float _1471 = fma(_1363, _320, _1449);
    float _1473 = fma(_1371, _320, _1411);
    float _1475 = fma(_1371, _328, _1413);
    float _1477 = fma(_1373, _320, _1455);
    float _1479 = fma(_1373, _328, _1459);
    float _1481 = fma(_1363, _328, _1457);
    float _1483 = sqrt(_1453);
    float _1485 = _1203 * _1431;
    float _1487 = _1465 * _1451;
    float _1489 = fma(_1371, _332, _1415);
    float _1491 = fma(_1373, _332, _1463);
    float _1493 = fma(_1363, _332, _1461);
    float _1495 = _1185 * _1467;
    out.m_93.x = _1473;
    out.m_93.y = _1475;
    out.m_93.z = _1489;
    out.m_95.x = _1469;
    out.m_95.y = _1485;
    out.m_95.z = _1487;
    out.m_95.w = _1495;
    bool _1497 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1499 = isnan(_1483);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1505 = _1501 || _1503;
    out.m_97.x = _1477;
    out.m_97.y = _1479;
    out.m_97.z = _1491;
    out.m_99.x = _1471;
    out.m_99.y = _1481;
    out.m_99.z = _1493;
    float _1507 = _1465;
    if (!_1505)
    {
        _1507 = 1.0;
    }
    float _1509 = _1507;
    out.m_101.x = _1048;
    out.m_101.y = _1050;
    out.m_101.z = _1052;
    bool _1511 = !_1505;
    float _1513 = _1509;
    if (!_1511)
    {
        bool _1515 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1517 = isnan(_1483);
        bool _1519 = _1515 || _1517;
        bool _1521 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1523 = _1519 || _1521;
        if (!_1523)
        {
            float _1525 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1527 = _1483 + _1525;
            float _1529 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1531 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1529;
            float _1533 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1535 = _1533 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1537 = 1.0 / _1531;
            float _1539 = _1527 * _1537;
            float _1541 = fma(_1539, _1535, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1513 = _1541;
            _1543 = true;
        }
        else
        {
            bool _1545 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1547 = isnan(_1483);
            bool _1549 = _1545 || _1547;
            bool _1551 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1553 = _1549 || _1551;
            if (!_1553)
            {
                float _1555 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1557 = _1483 + _1555;
                float _1559 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1561 = _1559 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1563 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1565 = _1563 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1567 = 1.0 / _1561;
                float _1569 = _1557 * _1567;
                float _1571 = fma(_1569, _1565, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1513 = _1571;
                _1543 = true;
            }
            else
            {
                _1513 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1543 = false;
    float _1573 = _1513;
    float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1577 = _1419 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1581 = _1034 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1585 = _1038 + _1583;
    float _1587 = _956 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1589 = fma(_1577, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1591 = fma(_1581, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1593 = fma(_1585, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1595 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1587);
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1599 = _1589 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1603 = _1591 + _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1607 = _1593 + _1605;
    float _1609 = _1599 * _1599;
    float _1611 = fma(_1603, _1603, _1609);
    float _1613 = fma(_1607, _1607, _1611);
    float _1615 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1595);
    float _1617 = _956 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1619 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1621 = rsqrt(_1613);
    float _1623 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1625 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1617);
    float _1627 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1629 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1625);
    float _1631 = 1.0 / _1623;
    float _1633 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1635 = _1633 + _1623;
    float _1637 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1639 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1641 = floor(_1619);
    float _1643 = _1603 * _1637;
    float _1645 = _1607 * _1637;
    float _1647 = _956 + _1639;
    float _1649 = _1643 * _1643;
    float _1651 = _1645 * _1645;
    float _1653 = _1635 * _1631;
    float _1655 = _1653 * 0.5;
    float _1657 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1661 = _1649 + _1651;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1665 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1663);
    float _1667 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1657);
    float _1669 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1659);
    float _1671 = sqrt(_1661);
    float _1673 = -_1641;
    float _1675 = _1619 + _1673;
    float _1677 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1667);
    float _1679 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1669);
    float _1681 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1683 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1685 = 1.0 / _1665;
    bool _1687 = _1671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1689 = trunc(_1681);
    int _1691 = int(_1689);
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1695 = _1685 * _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1699 = _1671 + _1697;
    float _1701 = trunc(_1683);
    int _1703 = int(_1701);
    bool _1705 = _1695 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1707 = _1695 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1709 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1711 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1713 = _1691 + _1711;
    int _1715 = _1713 + 1;
    float _1717 = _1631;
    int _1719 = 2;
    float _1721 = _1661;
    float _1723 = _1637;
    float _1725 = _1699;
    float _1727 = _1641;
    float _1729 = _1643;
    float _1731 = _1649;
    if (_1687)
    {
        float _1733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1717 = _1733;
    }
    float _1735 = _1717;
    float _1737 = precise::max(0.0, _1709);
    if (!_1705)
    {
        _1719 = 1;
    }
    int _1739 = _1719;
    float _1741 = -_1637;
    float _1743 = -_1737;
    float _1745 = fma(_1599, _1741, _1743);
    int _1747 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1749 = _1703 + _1747;
    int _1751 = _1749 + 1;
    int _1753 = _1739;
    if (_1687)
    {
        float _1755 = rsqrt(_1661);
        _1721 = _1755;
    }
    float _1757 = _1721;
    float _1759 = _1757;
    if (_1687)
    {
        float _1761 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1761;
    }
    float _1763 = _1723;
    int _1765 = _1715 | _1751;
    float _1767 = as_type<float>(_1765);
    if (_1687)
    {
        float _1769 = _1699 * _1735;
        _1725 = _1769;
    }
    float _1771 = _1725;
    if (!_1687)
    {
        _1727 = _1745;
    }
    float _1773 = _1727;
    float _1775 = floor(_1627);
    float _1777 = _1773;
    if (_1687)
    {
        float _1779 = _1771 * 0.15915493667125701904296875;
        _1016 = _1779;
    }
    float _1781 = _1016;
    bool _1783 = !_1705;
    int _1785 = _1783 ? 0 : 1;
    if (!_1707)
    {
        _1753 = _1785;
    }
    int _1787 = _1753;
    float _1789 = _1677;
    if (_1687)
    {
        float _1791 = _1781 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1789 = _1793;
    }
    float _1795 = _1789;
    bool _1797 = _1715 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1799 = _1787 << 6;
    bool _1801 = _1765 < 0;
    bool _1803 = _1801 || _1797;
    int _1805 = _1799 + 96;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.vp_c15)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.vp_c15)._m0[int(_1817)][_1819];
    float _1823 = _1781;
    if (_1687)
    {
        float _1825 = _1781 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        _1823 = _1827;
    }
    float _1829 = _1823;
    bool _1831 = _1751 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1833 = _1831 || _1803;
    int _1835 = _1799 + 48;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    uint _1839 = uint(int(uint(int(_1837)) >> uint(2)));
    int _1841 = int(_1837) & 3;
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[int(_1839)][_1841];
    int _1845 = int(_1837) + 1;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    int _1849 = _1845 & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    if (_1687)
    {
        float _1853 = fma(_1795, _1763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1767 = _1853;
    }
    float _1855 = _1767;
    float _1857 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1859 = sqrt(_1613);
    if (_1687)
    {
        float _1861 = _1757 * _1855;
        _982 = _1861;
    }
    float _1863 = _982;
    float _1865 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1857);
    int _1867 = _1799 + 104;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    float _1885 = _1829;
    if (_1687)
    {
        float _1887 = _1829 + (-1.0);
        _1759 = _1887;
    }
    float _1889 = _1759;
    float _1891 = _1889;
    if (_1687)
    {
        float _1893 = _1643 * _1863;
        _1729 = _1893;
    }
    float _1895 = _1729;
    float _1897 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1865);
    if (!_1833)
    {
        float _1899 = floor(_1683);
        _1141 = _1899;
    }
    float _1901 = _1141;
    if (_1687)
    {
        float _1903 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _1903;
    }
    float _1905 = _984;
    if (!_1687)
    {
        _1891 = _1645;
    }
    float _1907 = _1891;
    float _1909 = _1907;
    if (_1687)
    {
        float _1911 = _1645 * _1863;
        _1909 = _1911;
    }
    float _1913 = _1909;
    int _1915 = _1799 + 64;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    uint _1919 = uint(int(uint(int(_1917)) >> uint(2)));
    int _1921 = int(_1917) & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    int _1925 = int(_1917) + 1;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    int _1929 = _1925 & 3;
    float _1931 = (*spvDescriptorSet0.vp_c15)._m0[int(_1927)][_1929];
    if (_1687)
    {
        float _1933 = fma(_1745, _1829, _1905);
        _1777 = _1933;
    }
    float _1935 = _1777;
    if (_1687)
    {
        float _1937 = _1895 * _1895;
        _1731 = _1937;
    }
    float _1939 = _1731;
    float _1941 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1687)
    {
        _1885 = _1651;
    }
    float _1943 = _1885;
    float _1945 = _1943;
    if (_1687)
    {
        float _1947 = _1913 * _1913;
        _1945 = _1947;
    }
    float _1949 = _1945;
    float _1951 = fma(_1935, _1935, _1939);
    float _1953 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1955 = _1799 + 80;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    uint _1959 = uint(int(uint(int(_1957)) >> uint(2)));
    int _1961 = int(_1957) & 3;
    float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
    int _1965 = int(_1957) + 1;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    int _1969 = _1965 & 3;
    float _1971 = (*spvDescriptorSet0.vp_c15)._m0[int(_1967)][_1969];
    float _1973 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1975 = -_1775;
    float _1977 = _1627 + _1975;
    float _1979 = _1951 + _1949;
    float _1981 = -_1973;
    float _1983 = fma(_1981, _1953, 1.0);
    int _1985 = as_type<int>(_1973);
    if (!_1833)
    {
        int _1987 = _1751 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1989 = _1987 + _1715;
        _1985 = _1989;
    }
    int _1991 = _1985;
    int _1993 = _1799 + 56;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    uint _1997 = uint(int(uint(int(_1995)) >> uint(2)));
    int _1999 = int(_1995) & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    int _2003 = int(_1995) + 1;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    int _2007 = _2003 & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    float _2011 = log2(_1983);
    int _2013 = _1799 + 88;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1647 * _1821;
    float _2033 = fma(_868, _1813, _2031);
    int _2035 = _1799 + 72;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    uint _2039 = uint(int(uint(int(_2037)) >> uint(2)));
    int _2041 = int(_2037) & 3;
    float _2043 = (*spvDescriptorSet0.vp_c15)._m0[int(_2039)][_2041];
    int _2045 = int(_2037) + 1;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    int _2049 = _2045 & 3;
    float _2051 = (*spvDescriptorSet0.vp_c15)._m0[int(_2047)][_2049];
    float _2053 = _1647 * _1851;
    float _2055 = rsqrt(_1979);
    float _2057 = _2011 * 0.693147182464599609375;
    float _2059 = fma(_868, _1843, _2053);
    int _2061 = as_type<int>(_2053);
    int _2063 = as_type<int>(_1813);
    if (!_1833)
    {
        int _2065 = _1991 << 2;
        _2061 = _2065;
    }
    int _2067 = _2061;
    float _2069 = fma(_918, _1875, _2033);
    int _2071 = _2067;
    if (!_1833)
    {
        int _2073 = 12 & _2067;
        _2071 = _2073;
    }
    int _2075 = _2071;
    float _2077 = _2069 + _1883;
    float2 _6048 = float2(_1675, _1977);
    float _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6048, float2(0.0), isnan(_6048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6048, float2(0.0), isnan(_6048)), level(0.0)).x;
    float _2081 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2083 = _1647 * _1931;
    float _2085 = _1931;
    int _2087 = as_type<int>(_1971);
    if (!_1833)
    {
        float _2089 = -_1901;
        float _2091 = _1683 + _2089;
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2097 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2095);
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = _2055 * _1895;
    float _2103 = fma(_868, _1923, _2083);
    float _2105 = _2055 * _1935;
    float _2107 = _2055 * _1913;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2111 = _1647 * _1971;
    if (!_1833)
    {
        uint _2113 = uint(int(uint(_1991) >> uint(2)));
        _2087 = int(_2113);
    }
    int _2115 = _2087;
    float _2117 = fma(_868, _1963, _2111);
    float _2119 = -_2099;
    float _2121 = _2119 + 1.0;
    if (!_1833)
    {
        int _2123 = _2115 << 4;
        int _2125 = _2123 + _2075;
        _2063 = _2125;
    }
    int _2127 = _2063;
    float _2129 = fma(_918, _2001, _2059);
    float _2131 = 1.0 / _2077;
    float _2133 = _2101;
    if (!_1833)
    {
        int _2135 = _2127 + 400;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
        int _2141 = int(_2137) & 3;
        float _2143 = (*spvDescriptorSet0.vp_c15)._m0[int(_2139)][_2141];
        _2133 = _2143;
    }
    float _2145 = _2133;
    float _2147 = _2129 + _2009;
    float _2149 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_918, _2021, _2117);
    float _2153 = -_2109;
    float _2155 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2153);
    float _2157 = abs(_2121);
    float _2159 = log2(_2157);
    float _2161 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2165 = -_2107;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2155);
    float _2169 = _2105 + 1.0;
    float _2171 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2173 = fma(_918, _2043, _2103);
    float _2175 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2163);
    float _2177 = _2147 * _2131;
    float _2179 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2171);
    float _2181 = _2173 + _2051;
    float _2183 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2185 = fma(_2167, -0.5, 0.5);
    bool _2187 = _2177 >= 0.0;
    float _2189 = _2181 * _2131;
    float _2191 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2183);
    float _2193 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2195 = _2177 <= 1.0;
    bool _2197 = _2195 && _2187;
    float _2199 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2191);
    float _2203 = exp2(_2193);
    bool _2205 = _2189 >= 0.0;
    bool _2207 = _2205 && _2197;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2211 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2213 = fma(_2167, 0.5, 0.5);
    bool _2215 = _2189 <= 1.0;
    bool _2217 = _2215 && _2207;
    float _2219 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2209);
    float _2223 = _2151 + _2029;
    float _2225 = sqrt(_2185);
    float _2227 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2221);
    float _2229 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2231 = fma(_2213, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2227);
    float _2235 = -_2105;
    float _2237 = fma(_2203, _2169, _2235);
    float _2239 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2229);
    float _2241 = fma(_2213, _2231, -0.212114393711090087890625);
    float _2243 = 1.0 / _2233;
    float _2245 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = _2169;
    if (_2217)
    {
        float _2249 = float(_1787);
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2239);
    float _2255 = fma(_2213, _2241, 1.570728778839111328125);
    float _2257 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2259 = _2223 * _2131;
    float _2261 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2253);
    float _2263 = _2251;
    float _2265 = _2259;
    if (_2217)
    {
        float _2267 = rint(_2251);
        float _2269 = precise::max(_2267, 0.0);
        uint _2271 = uint(_2269);
        uint _2273 = clamp(_2271, 0u, 65535u);
        _2263 = as_type<float>(_2273);
    }
    float _2275 = _2263;
    float _2277 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2257);
    float _2279 = _2225 * 0.636619746685028076171875;
    float _2281 = fma(_2237, 0.5, 0.5);
    float _2283 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2277);
    float _2285 = -_2255;
    float _2287 = fma(_2279, _2285, 1.0);
    float _2289 = _2175;
    if (!_1833)
    {
        float _2291 = floor(_1681);
        _2289 = _2291;
    }
    float _2293 = _2289;
    float _2295 = _2261 * _2243;
    float _2297 = _2283 * _2243;
    float _2299 = fma(_2295, 0.5, 0.5);
    float _2301 = fma(_2297, -0.5, 0.5);
    float _2303 = _2275;
    if (_2217)
    {
        float3 _6437 = float3(_2177, _2189, float(as_type<int>(_2275)));
        float3 _6441 = select(_6437, float3(0.0), isnan(_6437));
        float _2305 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6441.xy, uint(rint(_6441.z)), _2259, level(0.0));
        _2303 = _2305;
    }
    float _2307 = _2303;
    float _2309 = _2131;
    if (!_1833)
    {
        float _2311 = rint(_2145);
        float _2313 = precise::max(_2311, 0.0);
        uint _2315 = uint(_2313);
        uint _2317 = clamp(_2315, 0u, 65535u);
        _2309 = as_type<float>(_2317);
    }
    float _2319 = _2309;
    float3 _6467 = float3(_2299, _2301, _2081);
    float _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6467, float3(0.0), isnan(_6467)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6467, float3(0.0), isnan(_6467)), level(0.0)).x;
    float _2323 = _2293;
    if (!_1833)
    {
        float _2325 = -_2293;
        float _2327 = _1681 + _2325;
        _2323 = _2327;
    }
    float _2329 = _2323;
    float3 _6488 = float3(_2299, _2301, _2081);
    float4 _2332 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6488, float3(0.0), isnan(_6488)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6488, float3(0.0), isnan(_6488)), level(0.0)).xyzw;
    float _2334 = _2332.x;
    float _2336 = _2332.y;
    float _2338 = _2332.z;
    float _2340 = _2332.w;
    float2 _6504 = float2(_2287, _2281);
    float3 _2342 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6504, float2(0.0), isnan(_6504)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6504, float2(0.0), isnan(_6504)), level(0.0)).xyz;
    float _2344 = _2342.x;
    float _2346 = _2342.y;
    float _2348 = _2342.z;
    float _2350 = _2319;
    if (!_1833)
    {
        float3 _6525 = float3(_2329, _2093, float(as_type<int>(_2319)));
        float3 _6527 = select(_6525, float3(0.0), isnan(_6525));
        float _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6527.xy, uint(rint(_6527.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6527.xy, uint(rint(_6527.z)), level(0.0)).x;
        _2350 = _2352;
    }
    float _2354 = _2350;
    float _2356 = abs(_1695);
    float _2358 = log2(_2356);
    float _2360 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2362 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2360);
    float _2364 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2362);
    bool _2366 = _1695 <= 8000.0;
    bool _2368 = isnan(_1695);
    bool _2370 = _2366 || _2368;
    bool _2372 = isnan(8000.0);
    bool _2374 = _2370 || _2372;
    float _2376 = float(_2374);
    float _2378 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2364);
    float _2380 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2382 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2261;
    out.gl_Position.y = _2283;
    out.gl_Position.z = _2378;
    out.gl_Position.w = _2233;
    float _2384 = exp2(_2380);
    float _2386 = exp2(_2382);
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = fma(_2390, -2.0, 3.0);
    float _2394 = _2390 * _2390;
    float _2396 = _2394 * _2392;
    float _2398 = _2378 + _2233;
    float _2400 = _2398 * 0.5;
    float _2402 = -_2396;
    float _2404 = _2402 + 1.0;
    out.m_103.z = _2400;
    out.m_103.w = _2233;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2396);
    float _2408 = _2376 * _2406;
    float _2410 = _2406;
    float _2412 = _2261;
    if (!_2217)
    {
        _2410 = 1.0;
    }
    float _2414 = _2410;
    float _2416 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2418 = -_2384;
    float _2420 = _2418 + 1.0;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2424 = _2420;
    float _2426 = _2414;
    if (_1833)
    {
        _2424 = 1.0;
    }
    float _2428 = _2424;
    float _2430 = -_2079;
    float _2432 = _2430 + 1.0;
    float _2434 = _2432 * _2416;
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2428;
    if (_2217)
    {
        bool _2440 = _2307 >= _2259;
        bool _2442 = isnan(_2307);
        bool _2444 = _2440 || _2442;
        bool _2446 = isnan(_2259);
        bool _2448 = _2444 || _2446;
        float _2450 = float(_2448);
        _2426 = _2450;
    }
    float _2452 = _2426;
    float _2454 = _2452;
    if (!_1833)
    {
        int _2456 = _1991 << 4;
        int _2458 = _2456 + 2048;
        uint _2460 = uint(int(uint(_2458) >> uint(2)));
        uint _2462 = uint(int(uint(int(_2460)) >> uint(2)));
        int _2464 = int(_2460) & 3;
        float _2466 = (*spvDescriptorSet0.vp_c15)._m0[int(_2462)][_2464];
        int _2468 = int(_2460) + 1;
        uint _2470 = uint(int(uint(_2468) >> uint(2)));
        int _2472 = _2468 & 3;
        float _2474 = (*spvDescriptorSet0.vp_c15)._m0[int(_2470)][_2472];
        int _2476 = _2458 + 8;
        uint _2478 = uint(int(uint(_2476) >> uint(2)));
        uint _2480 = uint(int(uint(int(_2478)) >> uint(2)));
        int _2482 = int(_2478) & 3;
        float _2484 = (*spvDescriptorSet0.vp_c15)._m0[int(_2480)][_2482];
        int _2486 = int(_2478) + 1;
        uint _2488 = uint(int(uint(_2486) >> uint(2)));
        int _2490 = _2486 & 3;
        float _2492 = (*spvDescriptorSet0.vp_c15)._m0[int(_2488)][_2490];
        float _2494 = _1647 * _2474;
        float _2496 = fma(_868, _2466, _2494);
        float _2498 = fma(_918, _2484, _2496);
        float _2500 = _2498 + _2492;
        float _2502 = precise::clamp(_2500, 0.0, 1.0);
        float _2504 = -_2502;
        float _2506 = _2504 + _2354;
        float _2508 = fma(_2506, 500.0, 1.5);
        float _2510 = exp2(_2508);
        float _2512 = 0.0 + _2510;
        float _2514 = precise::clamp(_2512, 0.0, 1.0);
        _2438 = _2514;
        _2265 = _2510;
        _2412 = 500.0;
    }
    float _2516 = _2438;
    float _2518 = _2265;
    float _2520 = _2412;
    float _2522 = _2452 * _2516;
    float _2524 = -_2436;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2528 = _2422 * _2321;
    out.m_105.x = _1591;
    out.m_105.y = _1589;
    out.m_105.z = _1593;
    bool _2530 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2532 = isnan(_1859);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2538 = _2534 || _2536;
    float _2540 = -_2522;
    float _2542 = fma(_2540, _2526, 1.0);
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = _2340 * _2528;
    float _2548 = -_2422;
    float _2550 = _2548 + 1.0;
    float _2552 = _2348 * _2528;
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2556 = fma(_2344, _2546, _2334);
    float _2558 = fma(_2346, _2546, _2336);
    float _2560 = _2340 * _2550;
    float _2562 = fma(_2340, _2552, _2338);
    out.m_107.x = _2554;
    float _2564 = _2520;
    float _2566 = _2518;
    float _2568 = _2546;
    float _2570 = _2550;
    float _2572 = _2544;
    if (!_2538)
    {
        _2564 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2574 = _2564;
    out.m_109.x = _2556;
    out.m_109.y = _2558;
    out.m_109.z = _2562;
    out.m_109.w = _2560;
    float _2576 = _2574;
    float _2578 = _2574;
    if (!_2538)
    {
        _2566 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2580 = _2566;
    float _2582 = _2580;
    float _2584 = _2580;
    if (!_2538)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2586 = _2454;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2538)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2592 = _2568;
    float _2594 = _2592;
    float _2596 = _2592;
    if (!_2538)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2598 = _2570;
    float _2600 = _2598;
    float _2602 = _2598;
    if (!_2538)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2604 = _2572;
    bool _2606 = !_2538;
    float _2608 = _2604;
    float _2610 = _2604;
    if (!_2606)
    {
        bool _2612 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2614 = isnan(_1859);
        bool _2616 = _2612 || _2614;
        bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2620 = _2616 || _2618;
        if (!_2620)
        {
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2624 = _1859 + _2622;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2628 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2626;
            float _2630 = 1.0 / _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2652 = _2624 * _2630;
            float _2654 = precise::clamp(_2652, 0.0, 1.0);
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2660 = fma(_2654, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2662 = fma(_2654, _2658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2664 = fma(_2654, _2638, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2654, _2642, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2668 = fma(_2654, _2646, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2670 = fma(_2654, _2650, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2584 = _2662;
            _2602 = _2668;
            _2578 = _2660;
            _2596 = _2666;
            _2590 = _2664;
            _2610 = _2670;
            _2672 = true;
        }
        else
        {
            bool _2674 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2676 = isnan(_1859);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2682 = _2678 || _2680;
            if (!_2682)
            {
                _2576 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2684 = _2576;
            _2578 = _2684;
            if (!_2682)
            {
                _2582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2686 = _2582;
            _2584 = _2686;
            if (!_2682)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2688 = _2588;
            _2590 = _2688;
            if (!_2682)
            {
                _2594 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2690 = _2594;
            _2596 = _2690;
            if (!_2682)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2692 = _2600;
            _2602 = _2692;
            if (!_2682)
            {
                _2608 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2694 = _2608;
            bool _2696 = !_2682;
            _2610 = _2694;
            if (!_2696)
            {
                bool _2698 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2700 = isnan(_1859);
                bool _2702 = _2698 || _2700;
                bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2706 = _2702 || _2704;
                if (!_2706)
                {
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2710 = _1859 + _2708;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2714 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2712;
                    float _2716 = 1.0 / _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2738 = _2710 * _2716;
                    float _2740 = precise::clamp(_2738, 0.0, 1.0);
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2746 = fma(_2740, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2748 = fma(_2740, _2744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2750 = fma(_2740, _2724, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2740, _2728, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2754 = fma(_2740, _2732, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2756 = fma(_2740, _2736, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2584 = _2748;
                    _2602 = _2754;
                    _2578 = _2746;
                    _2596 = _2752;
                    _2590 = _2750;
                    _2610 = _2756;
                    _2672 = true;
                }
                else
                {
                    _2584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2578 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2596 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2610 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2672 = false;
    float _2758 = _2584;
    float _2760 = _2602;
    float _2762 = _2578;
    float _2764 = _2596;
    float _2766 = _2590;
    float _2768 = _2610;
    float _2770 = fma(_1481, -0.5, 0.5);
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = -_2758;
    float _2776 = _2774 + _2760;
    float _2778 = -_2762;
    float _2780 = _2778 + _2764;
    float _2782 = -_2766;
    float _2784 = _2782 + _2768;
    bool _2786 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2788 = fma(_2772, _2776, _2758);
    float _2790 = fma(_2772, _2780, _2762);
    float _2792 = fma(_2772, _2784, _2766);
    float _2794 = _2788 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _2796 = fma(_2790, 0.298911988735198974609375, _2794);
    float _2798 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2800 = fma(_2792, 0.114477999508380889892578125, _2796);
    out.m_63.x = _2798;
    float _2802 = -_2800;
    float _2804 = _2790 + _2802;
    float _2806 = -_2800;
    float _2808 = _2788 + _2806;
    float _2810 = -_2800;
    float _2812 = _2792 + _2810;
    float _2814 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2816 = fma(_2808, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2818 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    out.m_113.x = _2814;
    out.m_113.y = _2816;
    out.m_113.z = _2818;
    if (!_2786)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2820 = -_1589;
    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2824 = -_1591;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2828 = -_1593;
    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2832 = _2822 * _2822;
    float _2834 = fma(_2826, _2826, _2832);
    float _2836 = fma(_2830, _2830, _2834);
    float _2838 = sqrt(_2836);
    float _2840 = rsqrt(_2836);
    float _2842 = -_2838;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2846 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2848 = precise::clamp(_2846, 0.0, 1.0);
    float _2850 = _2826 * _2840;
    float _2852 = _2822 * _2840;
    float _2854 = abs(_2848);
    float _2856 = log2(_2854);
    float _2858 = _2830 * _2840;
    float _2860 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2862 = _1481 * _2852;
    float _2864 = -_2852;
    float _2866 = -_2860;
    float _2868 = fma(_2864, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2866);
    float _2870 = fma(_1471, _2850, _2862);
    float _2872 = -_2858;
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2868);
    float _2876 = fma(_1493, _2858, _2870);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2882 = _2874 + _2880;
    float _2884 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2886 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2888 = precise::clamp(_2886, 0.0, 1.0);
    float _2890 = exp2(_2884);
    float _2892 = _2890 * _2888;
    float _2894 = _2878 * _2892;
    float _2896 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2900 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2896;
    out.m_111.y = _2898;
    out.m_111.z = _2900;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2672 = false;
    bool _1543 = false;
    bool _366 = false;
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
        float _2957 = as_type<float>(_148);
        out.gl_Position.z = _2957;
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
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_63.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3026 = as_type<float>(_186);
        out.gl_Position.z = _3026;
    }
    if (_180)
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
    float _208 = _192 * _192;
    float _210 = _190 * _190;
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_198, _198, _208);
    float _216 = fma(_196, _196, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_204, _204, _214);
    float _222 = fma(_202, _202, _216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    float _228 = sqrt(_222);
    bool _230 = _224 > 0.0;
    bool _232 = _226 > 0.0;
    float _234 = _226;
    float _236 = _224;
    if (_230)
    {
        float _238 = rsqrt(_218);
        _234 = _238;
    }
    float _240 = _234;
    if (!_230)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    bool _244 = _228 > 0.0;
    float _246 = _228;
    float _248 = _242;
    if (!_230)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = 0.0;
    float _254 = _250;
    if (!_230)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (_232)
    {
        float _262 = rsqrt(_220);
        _258 = _262;
    }
    float _264 = _258;
    float _266 = 0.0;
    float _268 = 0.0;
    if (!_232)
    {
        _266 = 0.0;
        _268 = 0.0;
    }
    float _270 = _266;
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    float _278 = _270;
    if (!_232)
    {
        _274 = 0.0;
    }
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    if (_244)
    {
        float _286 = rsqrt(_222);
        _282 = _286;
    }
    float _288 = _282;
    float _290 = _240;
    if (_230)
    {
        float _292 = _240 * _194;
        _254 = _292;
    }
    float _294 = _254;
    if (_230)
    {
        float _296 = _240 * _188;
        _248 = _296;
    }
    float _298 = _248;
    if (_230)
    {
        float _300 = _240 * _200;
        _260 = _300;
    }
    float _302 = _260;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = 0.0;
    if (!_244)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = 0.0;
    float _312 = _308;
    if (!_244)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = _314;
    if (_232)
    {
        float _318 = _264 * _198;
        _284 = _318;
    }
    float _320 = _284;
    if (!_244)
    {
        _290 = 0.0;
    }
    float _322 = _290;
    float _324 = _322;
    if (_232)
    {
        float _326 = _264 * _192;
        _276 = _326;
    }
    float _328 = _276;
    if (_232)
    {
        float _330 = _264 * _204;
        _278 = _330;
    }
    float _332 = _278;
    if (_244)
    {
        float _334 = _288 * _196;
        _312 = _334;
    }
    float _336 = _312;
    if (_244)
    {
        float _338 = _288 * _190;
        _316 = _338;
    }
    float _340 = _316;
    if (_244)
    {
        float _342 = _288 * _202;
        _324 = _342;
    }
    float _344 = _324;
    bool _346 = !_304;
    float _364;
    if (!_346)
    {
        float _348 = in.m_73.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_132);
        float _370 = 1.0 / _368;
        float _372 = _166 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_73.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = _374 + _378;
    float _382 = in.m_73.x;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _384;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _398 = _396 != 0;
    float _400 = in.m_60.x;
    float _402 = in.m_60.y;
    float _404 = in.m_60.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = 1.0 / _386;
    float _412 = in.m_73.y;
    float _414 = 1.0 / _408;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _374 + _416;
    float _420 = _376 * 2.0;
    float _422 = _380 * _410;
    float _424 = floor(_420);
    float _426 = _382 * 2.0;
    float _428 = _202 * _402;
    float _430 = _196 * _402;
    float _432 = _418 * _414;
    float _434 = _190 * _402;
    float _436 = floor(_426);
    float _438 = _412 + _376;
    float _440 = fma(_200, _400, _428);
    float _442 = _382 + _376;
    float _444 = fma(_194, _400, _430);
    float _446 = _438 + (-1.0);
    float _448 = _412 * 2.0;
    float _450 = _442 + (-1.0);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _424 > 0.0;
    float _458 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _460 = _382 + _412;
    float _462 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _464 = _424 >= 0.0;
    bool _466 = isnan(_424);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_198, _404, _444);
    bool _476 = !_390;
    int _478 = _476 ? 0 : 1;
    float _480 = _460 + (-1.0);
    float _482 = floor(_448);
    int _484 = _472 ? 0 : 1;
    float _486 = fma(_188, _400, _434);
    bool _488 = _436 > 0.0;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _492 = abs(_478);
    float _494 = _454 * _166;
    int _496 = ~_484;
    int _498 = _496 + 1;
    int _500 = _498 + 1;
    float _502 = fma(_192, _404, _486);
    bool _504 = _436 >= 0.0;
    bool _506 = isnan(_436);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    int _514 = _500;
    float _516 = _502;
    float _518 = _376;
    if (!_456)
    {
        int _520 = ~_484;
        int _522 = _520 + 1;
        _514 = _522;
    }
    int _524 = _514;
    float _526 = exp2(_494);
    int _528 = _512 ? 0 : 1;
    float _530 = float(_492);
    float _532 = float(_524);
    int _534 = ~_528;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    int _540 = _538;
    if (!_488)
    {
        int _542 = ~_528;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    float _548 = _530 * _532;
    float _550 = in.m_75.x;
    float _552 = in.m_75.y;
    float _554 = in.m_75.z;
    bool _556 = !_394;
    int _558 = _556 ? 0 : 1;
    float _560 = _548 * (-2.0);
    bool _562 = _482 > 0.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _566 = 1.0 + _564;
    int _568 = abs(_558);
    float _570 = -_526;
    float _572 = _570 + 1.0;
    bool _574 = _482 >= 0.0;
    bool _576 = isnan(_482);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = 1.0 / _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    bool _590 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(1.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _600;
    float _604 = float(_546);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _606;
    bool _610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _618 = _614 || _616;
    float _620 = fma(_588, _422, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _622 = float(_568);
    float _624 = fma(_602, _422, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _626 = _618 ? _572 : 0.0;
    float _628 = fma(_608, _422, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = fma(_490, _560, _490);
    float _632 = _622 * _604;
    int _634 = _582 ? 0 : 1;
    float _636 = fma(_560, _550, _550);
    float _638 = _382 + (-0.5);
    float _640 = _632 * (-2.0);
    if (_598)
    {
        float _642 = _626 * _584;
        _170 = _642;
    }
    float _644 = _170;
    float _646 = _412 + (-0.5);
    bool _648 = !_398;
    int _650 = _648 ? 0 : 1;
    float _652 = fma(_640, _552, _552);
    float _654 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[196].x, _636);
    int _656 = ~_634;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_458, _640, _458);
    bool _664 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _666 = isnan(_374);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _680 = _660;
    if (!_562)
    {
        int _682 = ~_634;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _652);
    int _690 = abs(_650);
    float _692 = -_674;
    float _694 = _692 + 1.0;
    bool _696 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _698 = isnan(_374);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = fma(_630, _644, _654);
    bool _710 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _712 = isnan(_374);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _730 = float(_686);
    float _732 = _720 * _694;
    float _734 = -_720;
    float _736 = _734 + 1.0;
    float _738 = float(_690);
    float _740 = fma(_724, _432, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _742 = fma(_728, _432, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _744 = fma(_678, _432, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _746 = _706 * _736;
    float _748 = _738 * _730;
    float _750 = _708 * 0.15915493667125701904296875;
    float _752 = fma(_662, _644, _688);
    float _754 = _620 * _746;
    float _756 = _748 * (-2.0);
    float _758 = in.m_77.x;
    float _760 = in.m_77.y;
    float _762 = in.m_77.z;
    float _764 = _752 * 0.15915493667125701904296875;
    float _766 = _624 * _746;
    float _768 = fma(_756, _554, _554);
    float _770 = _376 + (-0.5);
    float _772 = _628 * _746;
    float _774 = -_706;
    float _776 = _774 + 1.0;
    float _778 = in.m_79.x;
    float _780 = in.m_79.y;
    float _782 = in.m_79.z;
    float _784 = fma(_462, _756, _462);
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _754);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _772);
    float _794 = fma(_784, _644, _786);
    float _796 = fma(_740, _732, _788);
    float _798 = fma(_742, _732, _790);
    float _800 = fma(_744, _732, _792);
    float _802 = _794 * 0.15915493667125701904296875;
    float _804 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].x, _796);
    float _806 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].y, _798);
    float _808 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].z, _800);
    float _810 = _750 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _808 * _762;
    float _816 = _804 * _758;
    float _818 = _806 * _760;
    float _820 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _822 = _764 * 6.283185482025146484375;
    float _824 = sin(_822);
    float _826 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _778);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _780);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _834 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _836 = _828 * _826;
    float _838 = _764 * 6.283185482025146484375;
    float _840 = cos(_838);
    float _842 = _830 * _834;
    float _844 = _832 * _820;
    float _846 = in.m_69.w;
    float _848 = in.m_71.w;
    float _850 = _802 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _812 * _824;
    float _856 = _750 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _812 * _840;
    float _862 = _802 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _812 * _852;
    float _868 = _474 + _846;
    float _870 = _858 * _824;
    float _872 = _858 * _840;
    float _874 = _866 * _842;
    float _876 = _840 * _852;
    float _878 = _858 * _852;
    float _880 = _824 * _852;
    float _882 = fma(_864, _860, _870);
    float _884 = -_842;
    float _886 = _864 * _884;
    float _888 = -_872;
    float _890 = fma(_864, _854, _888);
    float _892 = -_854;
    float _894 = fma(_864, _872, _892);
    float _896 = fma(_882, _836, _874);
    float _898 = fma(_876, _836, _886);
    float _900 = _878 * _842;
    float _902 = fma(_864, _870, _860);
    float _904 = fma(_890, _844, _896);
    float _906 = fma(_880, _844, _898);
    float _908 = fma(_894, _836, _900);
    float _910 = fma(_204, _404, _440);
    float _912 = _904 * _336;
    float _914 = _904 * _344;
    float _916 = fma(_902, _844, _908);
    float _918 = _910 + _848;
    float _920 = fma(_906, _294, _912);
    float _922 = fma(_906, _302, _914);
    float _924 = in.m_67.w;
    float _926 = _904 * _340;
    float _928 = fma(_916, _320, _920);
    float _930 = fma(_916, _332, _922);
    float _932 = fma(_906, _298, _926);
    float _934 = _868 + _928;
    float _936 = _918 + _930;
    float _938 = fma(_916, _328, _932);
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _942 = _934 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _946 = _936 + _944;
    float _948 = _942 * _942;
    float _950 = _946 * _946;
    float _952 = _948 + _950;
    float _954 = sqrt(_952);
    float _956 = _502 + _924;
    float _958 = _956 + _938;
    bool _960 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _954 + _962;
    float _966 = _754;
    float _968 = _916;
    float _970 = _934;
    float _972 = _936;
    float _974 = _882;
    float _976 = _958;
    float _978 = _948;
    float _980 = _950;
    float _982 = _876;
    float _984 = _890;
    if (_960)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _986;
    }
    float _988 = _966;
    if (_960)
    {
        float _990 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _990;
    }
    float _992 = _516;
    float _994 = _992;
    if (_960)
    {
        float _996 = rsqrt(_952);
        _968 = _996;
    }
    float _998 = _968;
    float _1000 = _988;
    float _1002 = _998;
    if (_960)
    {
        float _1004 = _964 * _988;
        _1000 = _1004;
    }
    float _1006 = _1000;
    float _1008 = _1006;
    if (_960)
    {
        float _1010 = _1006 * 0.15915493667125701904296875;
        _1008 = _1010;
    }
    float _1012 = _1008;
    float _1014 = _188;
    float _1016 = _1012;
    if (_960)
    {
        float _1018 = _1012 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        _1014 = _1020;
    }
    float _1022 = _1014;
    if (_960)
    {
        float _1024 = fma(_1022, _992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _1024;
    }
    float _1026 = _994;
    if (_960)
    {
        float _1028 = _998 * _1026;
        _1002 = _1028;
    }
    float _1030 = _1002;
    if (_960)
    {
        float _1032 = fma(_942, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _970 = _1032;
    }
    float _1034 = _970;
    if (_960)
    {
        float _1036 = fma(_946, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _972 = _1036;
    }
    float _1038 = _972;
    float _1040 = fma(_1034, 6.2500002968590706586837768554688e-05, 0.5);
    float _1042 = fma(_1038, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4270 = float2(_1040, _1042);
    float3 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4270, float2(0.0), isnan(_4270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4270, float2(0.0), isnan(_4270)), level(0.0)).xyz;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1056 = in.m_81.y;
    float _1058 = _1054 * _382;
    float _1060 = in.m_73.w;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1068 = _1066 != 0;
    float _1070 = in.m_81.x;
    float _1072 = trunc(_1058);
    int _1074 = int(_1072);
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1082 = _1080 != 0;
    bool _1084 = _412 > 0.5;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1086 = -_1056;
    float _1088 = _1086 + 1.0;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1092 = _1074 << 4;
    int _1094 = _1092 + 1968;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1100 = _1060 > 0.5;
    uint _1103 = uint(int(uint(_1094) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = in.m_85.x;
    float _1121 = in.m_85.y;
    float _1123 = in.m_85.z;
    float _1125 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1127 = _1100 ? as_type<int>(_1088) : as_type<int>(_1056);
    int _1129 = 0;
    bool _1131 = _1082;
    float _1133 = _1056;
    bool _1135 = _1084;
    float _1137 = 1.0;
    float _1139 = _1098;
    float _1141 = _1038;
    if (_1064)
    {
        float _1143 = -_1070;
        float _1145 = _1143 + 1.0;
        _1129 = as_type<int>(_1145);
    }
    int _1147 = _1129;
    bool _1149 = _780 != 0.0;
    bool _1151 = isnan(_780);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1082 ? as_type<float>(_1127) : _1056;
    int _1163 = _1094 + 8;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[int(_1167)][_1169];
    bool _1173 = _778 == 0.0;
    bool _1175 = !_1157;
    bool _1177 = _1173 && _1175;
    int _1179 = _1147;
    if (_1064)
    {
        bool _1181 = _382 > 0.5;
        _1131 = _1181;
    }
    bool _1183 = _1131;
    float _1185 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1068)
    {
        float _1187 = _1084 ? _1088 : _1056;
        _1133 = _1187;
    }
    float _1189 = _1133;
    bool _1191 = _782 == 0.0;
    bool _1193 = _1191 && _1177;
    float _1195 = in.m_87.x;
    float _1197 = in.m_87.y;
    float _1199 = in.m_87.z;
    float _1201 = in.m_87.w;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1078)
    {
        bool _1205 = _376 > 0.5;
        _1135 = _1205;
    }
    bool _1207 = _1135;
    if (!_1064)
    {
        _1137 = _1070;
    }
    float _1209 = _1137;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1213 = _1209;
    if (_1064)
    {
        float _1215 = _1183 ? as_type<float>(_1147) : _1070;
        _1213 = _1215;
    }
    float _1217 = _1213;
    if (_1078)
    {
        float _1219 = -_1070;
        float _1221 = _1219 + 1.0;
        _1179 = as_type<int>(_1221);
    }
    int _1223 = _1179;
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = 0.0;
    float _1229 = _1119;
    if (_1193)
    {
        _1227 = _1119;
    }
    float _1231 = _1227;
    out.m_89.x = _1125;
    out.m_89.y = _1225;
    out.m_89.z = _1159;
    out.m_89.w = _1098;
    float _1233 = _1231;
    if (_1193)
    {
        _518 = _1231;
    }
    float _1235 = _518;
    float _1237 = _1235;
    if (!_1193)
    {
        _1233 = _1119;
    }
    float _1239 = _1233;
    if (!_1078)
    {
        _1229 = _1070;
    }
    float _1241 = _1229;
    float _1243 = _1241;
    if (_1078)
    {
        float _1245 = _1207 ? as_type<float>(_1223) : _1070;
        _1243 = _1245;
    }
    float _1247 = _1243;
    if (!_1193)
    {
        float _1249 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1239);
        _1237 = _1249;
    }
    float _1251 = _1237;
    if (_1193)
    {
        _1139 = _1121;
    }
    float _1253 = _1139;
    float _1255 = _1253;
    if (!_1193)
    {
        float _1257 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1121);
        _1255 = _1257;
    }
    float _1259 = _1255;
    float _1261 = _1197 * _1123;
    float _1263 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1265 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1267 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1199 * _1239;
    float _1271 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1265;
    if (_1193)
    {
        _1273 = _1123;
    }
    float _1275 = _1273;
    float _1277 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1279 = _1275;
    if (!_1193)
    {
        float _1281 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1123);
        _1279 = _1281;
    }
    float _1283 = _1279;
    float _1285 = -_1269;
    float _1287 = fma(_1195, _1123, _1285);
    float _1289 = _1195 * _1121;
    float _1291 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = -_1261;
    float _1295 = fma(_1199, _1121, _1293);
    float _1297 = _1287 * _1201;
    float _1299 = -_1289;
    float _1301 = fma(_1197, _1239, _1299);
    float _1303 = -_1197;
    float _1305 = _864 * _1303;
    out.m_91.x = _1271;
    out.m_91.y = _1267;
    out.m_91.z = _1291;
    float _1307 = _1295 * _1201;
    float _1309 = _1301 * _1201;
    float _1311 = _866 * _1197;
    float _1313 = _878 * _1197;
    float _1315 = fma(_876, _1195, _1305);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1319 = fma(_882, _1195, _1311);
    float _1321 = fma(_894, _1195, _1313);
    float _1323 = -_1259;
    float _1325 = _864 * _1323;
    float _1327 = -_1297;
    float _1329 = _864 * _1327;
    float _1331 = _866 * _1259;
    float _1333 = _878 * _1259;
    float _1335 = _866 * _1297;
    float _1337 = _878 * _1297;
    float _1339 = fma(_876, _1251, _1325);
    float _1341 = fma(_894, _1251, _1333);
    float _1343 = fma(_882, _1251, _1331);
    float _1345 = fma(_894, _1307, _1337);
    float _1347 = fma(_876, _1307, _1329);
    float _1349 = _1337;
    if (_960)
    {
        float _1351 = _1012 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = fma(_882, _1307, _1335);
    float _1359 = fma(_880, _1283, _1339);
    float _1361 = fma(_890, _1283, _1343);
    float _1363 = fma(_902, _1283, _1341);
    float _1365 = fma(_890, _1199, _1319);
    float _1367 = fma(_880, _1199, _1315);
    float _1369 = fma(_880, _1309, _1347);
    float _1371 = fma(_902, _1199, _1321);
    float _1373 = fma(_902, _1309, _1345);
    float _1375 = _1365 * _336;
    float _1377 = _1365 * _340;
    float _1379 = _1365 * _344;
    float _1381 = fma(_890, _1309, _1357);
    float _1383 = _1361 * _336;
    float _1385 = _1361 * _340;
    float _1387 = _1365;
    float _1389 = _1361;
    float _1391 = _1367;
    if (_960)
    {
        float _1393 = _1355 + (-1.0);
        _1387 = _1393;
    }
    float _1395 = _1387;
    float _1397 = _1361 * _344;
    if (_960)
    {
        float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1401 = _1034 + _1399;
        _1389 = _1401;
    }
    float _1403 = _1389;
    float _1405 = _1381 * _344;
    if (_960)
    {
        float _1407 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _1407;
    }
    float _1409 = _974;
    float _1411 = fma(_1367, _294, _1375);
    float _1413 = fma(_1367, _298, _1377);
    float _1415 = fma(_1367, _302, _1379);
    if (_960)
    {
        float _1417 = fma(_958, _1355, _1409);
        _976 = _1417;
    }
    float _1419 = _976;
    if (_960)
    {
        float _1421 = _1403 * _1403;
        _978 = _1421;
    }
    float _1423 = _978;
    if (_960)
    {
        float _1425 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1427 = _1038 + _1425;
        _1391 = _1427;
    }
    float _1429 = _1391;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1435 = _1419 + _1433;
    float _1437 = _1381 * _336;
    if (_960)
    {
        float _1439 = _1429 * _1429;
        _980 = _1439;
    }
    float _1441 = _980;
    float _1443 = _1381 * _340;
    float _1445 = fma(_1435, _1435, _1423);
    float _1447 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1449 = fma(_1359, _294, _1383);
    float _1451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1453 = _1445 + _1441;
    float _1455 = fma(_1369, _294, _1437);
    float _1457 = fma(_1359, _298, _1385);
    float _1459 = fma(_1369, _298, _1443);
    float _1461 = fma(_1359, _302, _1397);
    float _1463 = fma(_1369, _302, _1405);
    float _1465 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1469 = _1447 * _1317;
    float _1471 = fma(_1363, _320, _1449);
    float _1473 = fma(_1371, _320, _1411);
    float _1475 = fma(_1371, _328, _1413);
    float _1477 = fma(_1373, _320, _1455);
    float _1479 = fma(_1373, _328, _1459);
    float _1481 = fma(_1363, _328, _1457);
    float _1483 = sqrt(_1453);
    float _1485 = _1203 * _1431;
    float _1487 = _1465 * _1451;
    float _1489 = fma(_1371, _332, _1415);
    float _1491 = fma(_1373, _332, _1463);
    float _1493 = fma(_1363, _332, _1461);
    float _1495 = _1185 * _1467;
    out.m_93.x = _1473;
    out.m_93.y = _1475;
    out.m_93.z = _1489;
    out.m_95.x = _1469;
    out.m_95.y = _1485;
    out.m_95.z = _1487;
    out.m_95.w = _1495;
    bool _1497 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1499 = isnan(_1483);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1505 = _1501 || _1503;
    out.m_97.x = _1477;
    out.m_97.y = _1479;
    out.m_97.z = _1491;
    out.m_99.x = _1471;
    out.m_99.y = _1481;
    out.m_99.z = _1493;
    float _1507 = _1465;
    if (!_1505)
    {
        _1507 = 1.0;
    }
    float _1509 = _1507;
    out.m_101.x = _1048;
    out.m_101.y = _1050;
    out.m_101.z = _1052;
    bool _1511 = !_1505;
    float _1513 = _1509;
    if (!_1511)
    {
        bool _1515 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1517 = isnan(_1483);
        bool _1519 = _1515 || _1517;
        bool _1521 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1523 = _1519 || _1521;
        if (!_1523)
        {
            float _1525 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1527 = _1483 + _1525;
            float _1529 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1531 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1529;
            float _1533 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1535 = _1533 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1537 = 1.0 / _1531;
            float _1539 = _1527 * _1537;
            float _1541 = fma(_1539, _1535, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1513 = _1541;
            _1543 = true;
        }
        else
        {
            bool _1545 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1547 = isnan(_1483);
            bool _1549 = _1545 || _1547;
            bool _1551 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1553 = _1549 || _1551;
            if (!_1553)
            {
                float _1555 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1557 = _1483 + _1555;
                float _1559 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1561 = _1559 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1563 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1565 = _1563 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1567 = 1.0 / _1561;
                float _1569 = _1557 * _1567;
                float _1571 = fma(_1569, _1565, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1513 = _1571;
                _1543 = true;
            }
            else
            {
                _1513 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1543 = false;
    float _1573 = _1513;
    float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1577 = _1419 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1581 = _1034 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1585 = _1038 + _1583;
    float _1587 = _956 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1589 = fma(_1577, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1591 = fma(_1581, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1593 = fma(_1585, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1595 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1587);
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1599 = _1589 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1603 = _1591 + _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1607 = _1593 + _1605;
    float _1609 = _1599 * _1599;
    float _1611 = fma(_1603, _1603, _1609);
    float _1613 = fma(_1607, _1607, _1611);
    float _1615 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1595);
    float _1617 = _956 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1619 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1621 = rsqrt(_1613);
    float _1623 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1625 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1617);
    float _1627 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1629 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1625);
    float _1631 = 1.0 / _1623;
    float _1633 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1635 = _1633 + _1623;
    float _1637 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1639 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1641 = floor(_1619);
    float _1643 = _1603 * _1637;
    float _1645 = _1607 * _1637;
    float _1647 = _956 + _1639;
    float _1649 = _1643 * _1643;
    float _1651 = _1645 * _1645;
    float _1653 = _1635 * _1631;
    float _1655 = _1653 * 0.5;
    float _1657 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1661 = _1649 + _1651;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1665 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1663);
    float _1667 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1657);
    float _1669 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1659);
    float _1671 = sqrt(_1661);
    float _1673 = -_1641;
    float _1675 = _1619 + _1673;
    float _1677 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1667);
    float _1679 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1669);
    float _1681 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1683 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1685 = 1.0 / _1665;
    bool _1687 = _1671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1689 = trunc(_1681);
    int _1691 = int(_1689);
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1695 = _1685 * _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1699 = _1671 + _1697;
    float _1701 = trunc(_1683);
    int _1703 = int(_1701);
    bool _1705 = _1695 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1707 = _1695 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1709 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1711 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1713 = _1691 + _1711;
    int _1715 = _1713 + 1;
    float _1717 = _1631;
    int _1719 = 2;
    float _1721 = _1661;
    float _1723 = _1637;
    float _1725 = _1699;
    float _1727 = _1641;
    float _1729 = _1643;
    float _1731 = _1649;
    if (_1687)
    {
        float _1733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1717 = _1733;
    }
    float _1735 = _1717;
    float _1737 = precise::max(0.0, _1709);
    if (!_1705)
    {
        _1719 = 1;
    }
    int _1739 = _1719;
    float _1741 = -_1637;
    float _1743 = -_1737;
    float _1745 = fma(_1599, _1741, _1743);
    int _1747 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1749 = _1703 + _1747;
    int _1751 = _1749 + 1;
    int _1753 = _1739;
    if (_1687)
    {
        float _1755 = rsqrt(_1661);
        _1721 = _1755;
    }
    float _1757 = _1721;
    float _1759 = _1757;
    if (_1687)
    {
        float _1761 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1761;
    }
    float _1763 = _1723;
    int _1765 = _1715 | _1751;
    float _1767 = as_type<float>(_1765);
    if (_1687)
    {
        float _1769 = _1699 * _1735;
        _1725 = _1769;
    }
    float _1771 = _1725;
    if (!_1687)
    {
        _1727 = _1745;
    }
    float _1773 = _1727;
    float _1775 = floor(_1627);
    float _1777 = _1773;
    if (_1687)
    {
        float _1779 = _1771 * 0.15915493667125701904296875;
        _1016 = _1779;
    }
    float _1781 = _1016;
    bool _1783 = !_1705;
    int _1785 = _1783 ? 0 : 1;
    if (!_1707)
    {
        _1753 = _1785;
    }
    int _1787 = _1753;
    float _1789 = _1677;
    if (_1687)
    {
        float _1791 = _1781 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1789 = _1793;
    }
    float _1795 = _1789;
    bool _1797 = _1715 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1799 = _1787 << 6;
    bool _1801 = _1765 < 0;
    bool _1803 = _1801 || _1797;
    int _1805 = _1799 + 96;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.vp_c15)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.vp_c15)._m0[int(_1817)][_1819];
    float _1823 = _1781;
    if (_1687)
    {
        float _1825 = _1781 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        _1823 = _1827;
    }
    float _1829 = _1823;
    bool _1831 = _1751 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1833 = _1831 || _1803;
    int _1835 = _1799 + 48;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    uint _1839 = uint(int(uint(int(_1837)) >> uint(2)));
    int _1841 = int(_1837) & 3;
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[int(_1839)][_1841];
    int _1845 = int(_1837) + 1;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    int _1849 = _1845 & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    if (_1687)
    {
        float _1853 = fma(_1795, _1763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1767 = _1853;
    }
    float _1855 = _1767;
    float _1857 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1859 = sqrt(_1613);
    if (_1687)
    {
        float _1861 = _1757 * _1855;
        _982 = _1861;
    }
    float _1863 = _982;
    float _1865 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1857);
    int _1867 = _1799 + 104;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    float _1885 = _1829;
    if (_1687)
    {
        float _1887 = _1829 + (-1.0);
        _1759 = _1887;
    }
    float _1889 = _1759;
    float _1891 = _1889;
    if (_1687)
    {
        float _1893 = _1643 * _1863;
        _1729 = _1893;
    }
    float _1895 = _1729;
    float _1897 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1865);
    if (!_1833)
    {
        float _1899 = floor(_1683);
        _1141 = _1899;
    }
    float _1901 = _1141;
    if (_1687)
    {
        float _1903 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _1903;
    }
    float _1905 = _984;
    if (!_1687)
    {
        _1891 = _1645;
    }
    float _1907 = _1891;
    float _1909 = _1907;
    if (_1687)
    {
        float _1911 = _1645 * _1863;
        _1909 = _1911;
    }
    float _1913 = _1909;
    int _1915 = _1799 + 64;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    uint _1919 = uint(int(uint(int(_1917)) >> uint(2)));
    int _1921 = int(_1917) & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    int _1925 = int(_1917) + 1;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    int _1929 = _1925 & 3;
    float _1931 = (*spvDescriptorSet0.vp_c15)._m0[int(_1927)][_1929];
    if (_1687)
    {
        float _1933 = fma(_1745, _1829, _1905);
        _1777 = _1933;
    }
    float _1935 = _1777;
    if (_1687)
    {
        float _1937 = _1895 * _1895;
        _1731 = _1937;
    }
    float _1939 = _1731;
    float _1941 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1687)
    {
        _1885 = _1651;
    }
    float _1943 = _1885;
    float _1945 = _1943;
    if (_1687)
    {
        float _1947 = _1913 * _1913;
        _1945 = _1947;
    }
    float _1949 = _1945;
    float _1951 = fma(_1935, _1935, _1939);
    float _1953 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1955 = _1799 + 80;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    uint _1959 = uint(int(uint(int(_1957)) >> uint(2)));
    int _1961 = int(_1957) & 3;
    float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
    int _1965 = int(_1957) + 1;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    int _1969 = _1965 & 3;
    float _1971 = (*spvDescriptorSet0.vp_c15)._m0[int(_1967)][_1969];
    float _1973 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1975 = -_1775;
    float _1977 = _1627 + _1975;
    float _1979 = _1951 + _1949;
    float _1981 = -_1973;
    float _1983 = fma(_1981, _1953, 1.0);
    int _1985 = as_type<int>(_1973);
    if (!_1833)
    {
        int _1987 = _1751 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1989 = _1987 + _1715;
        _1985 = _1989;
    }
    int _1991 = _1985;
    int _1993 = _1799 + 56;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    uint _1997 = uint(int(uint(int(_1995)) >> uint(2)));
    int _1999 = int(_1995) & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    int _2003 = int(_1995) + 1;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    int _2007 = _2003 & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    float _2011 = log2(_1983);
    int _2013 = _1799 + 88;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1647 * _1821;
    float _2033 = fma(_868, _1813, _2031);
    int _2035 = _1799 + 72;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    uint _2039 = uint(int(uint(int(_2037)) >> uint(2)));
    int _2041 = int(_2037) & 3;
    float _2043 = (*spvDescriptorSet0.vp_c15)._m0[int(_2039)][_2041];
    int _2045 = int(_2037) + 1;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    int _2049 = _2045 & 3;
    float _2051 = (*spvDescriptorSet0.vp_c15)._m0[int(_2047)][_2049];
    float _2053 = _1647 * _1851;
    float _2055 = rsqrt(_1979);
    float _2057 = _2011 * 0.693147182464599609375;
    float _2059 = fma(_868, _1843, _2053);
    int _2061 = as_type<int>(_2053);
    int _2063 = as_type<int>(_1813);
    if (!_1833)
    {
        int _2065 = _1991 << 2;
        _2061 = _2065;
    }
    int _2067 = _2061;
    float _2069 = fma(_918, _1875, _2033);
    int _2071 = _2067;
    if (!_1833)
    {
        int _2073 = 12 & _2067;
        _2071 = _2073;
    }
    int _2075 = _2071;
    float _2077 = _2069 + _1883;
    float2 _6048 = float2(_1675, _1977);
    float _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6048, float2(0.0), isnan(_6048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6048, float2(0.0), isnan(_6048)), level(0.0)).x;
    float _2081 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2083 = _1647 * _1931;
    float _2085 = _1931;
    int _2087 = as_type<int>(_1971);
    if (!_1833)
    {
        float _2089 = -_1901;
        float _2091 = _1683 + _2089;
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2097 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2095);
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = _2055 * _1895;
    float _2103 = fma(_868, _1923, _2083);
    float _2105 = _2055 * _1935;
    float _2107 = _2055 * _1913;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2111 = _1647 * _1971;
    if (!_1833)
    {
        uint _2113 = uint(int(uint(_1991) >> uint(2)));
        _2087 = int(_2113);
    }
    int _2115 = _2087;
    float _2117 = fma(_868, _1963, _2111);
    float _2119 = -_2099;
    float _2121 = _2119 + 1.0;
    if (!_1833)
    {
        int _2123 = _2115 << 4;
        int _2125 = _2123 + _2075;
        _2063 = _2125;
    }
    int _2127 = _2063;
    float _2129 = fma(_918, _2001, _2059);
    float _2131 = 1.0 / _2077;
    float _2133 = _2101;
    if (!_1833)
    {
        int _2135 = _2127 + 400;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
        int _2141 = int(_2137) & 3;
        float _2143 = (*spvDescriptorSet0.vp_c15)._m0[int(_2139)][_2141];
        _2133 = _2143;
    }
    float _2145 = _2133;
    float _2147 = _2129 + _2009;
    float _2149 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_918, _2021, _2117);
    float _2153 = -_2109;
    float _2155 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2153);
    float _2157 = abs(_2121);
    float _2159 = log2(_2157);
    float _2161 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2165 = -_2107;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2155);
    float _2169 = _2105 + 1.0;
    float _2171 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2173 = fma(_918, _2043, _2103);
    float _2175 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2163);
    float _2177 = _2147 * _2131;
    float _2179 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2171);
    float _2181 = _2173 + _2051;
    float _2183 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2185 = fma(_2167, -0.5, 0.5);
    bool _2187 = _2177 >= 0.0;
    float _2189 = _2181 * _2131;
    float _2191 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2183);
    float _2193 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2195 = _2177 <= 1.0;
    bool _2197 = _2195 && _2187;
    float _2199 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2191);
    float _2203 = exp2(_2193);
    bool _2205 = _2189 >= 0.0;
    bool _2207 = _2205 && _2197;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2211 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2213 = fma(_2167, 0.5, 0.5);
    bool _2215 = _2189 <= 1.0;
    bool _2217 = _2215 && _2207;
    float _2219 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2209);
    float _2223 = _2151 + _2029;
    float _2225 = sqrt(_2185);
    float _2227 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2221);
    float _2229 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2231 = fma(_2213, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2227);
    float _2235 = -_2105;
    float _2237 = fma(_2203, _2169, _2235);
    float _2239 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2229);
    float _2241 = fma(_2213, _2231, -0.212114393711090087890625);
    float _2243 = 1.0 / _2233;
    float _2245 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = _2169;
    if (_2217)
    {
        float _2249 = float(_1787);
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2239);
    float _2255 = fma(_2213, _2241, 1.570728778839111328125);
    float _2257 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2259 = _2223 * _2131;
    float _2261 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2253);
    float _2263 = _2251;
    float _2265 = _2259;
    if (_2217)
    {
        float _2267 = rint(_2251);
        float _2269 = precise::max(_2267, 0.0);
        uint _2271 = uint(_2269);
        uint _2273 = clamp(_2271, 0u, 65535u);
        _2263 = as_type<float>(_2273);
    }
    float _2275 = _2263;
    float _2277 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2257);
    float _2279 = _2225 * 0.636619746685028076171875;
    float _2281 = fma(_2237, 0.5, 0.5);
    float _2283 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2277);
    float _2285 = -_2255;
    float _2287 = fma(_2279, _2285, 1.0);
    float _2289 = _2175;
    if (!_1833)
    {
        float _2291 = floor(_1681);
        _2289 = _2291;
    }
    float _2293 = _2289;
    float _2295 = _2261 * _2243;
    float _2297 = _2283 * _2243;
    float _2299 = fma(_2295, 0.5, 0.5);
    float _2301 = fma(_2297, -0.5, 0.5);
    float _2303 = _2275;
    if (_2217)
    {
        float3 _6437 = float3(_2177, _2189, float(as_type<int>(_2275)));
        float3 _6441 = select(_6437, float3(0.0), isnan(_6437));
        float _2305 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6441.xy, uint(rint(_6441.z)), _2259, level(0.0));
        _2303 = _2305;
    }
    float _2307 = _2303;
    float _2309 = _2131;
    if (!_1833)
    {
        float _2311 = rint(_2145);
        float _2313 = precise::max(_2311, 0.0);
        uint _2315 = uint(_2313);
        uint _2317 = clamp(_2315, 0u, 65535u);
        _2309 = as_type<float>(_2317);
    }
    float _2319 = _2309;
    float3 _6467 = float3(_2299, _2301, _2081);
    float _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6467, float3(0.0), isnan(_6467)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6467, float3(0.0), isnan(_6467)), level(0.0)).x;
    float _2323 = _2293;
    if (!_1833)
    {
        float _2325 = -_2293;
        float _2327 = _1681 + _2325;
        _2323 = _2327;
    }
    float _2329 = _2323;
    float3 _6488 = float3(_2299, _2301, _2081);
    float4 _2332 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6488, float3(0.0), isnan(_6488)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6488, float3(0.0), isnan(_6488)), level(0.0)).xyzw;
    float _2334 = _2332.x;
    float _2336 = _2332.y;
    float _2338 = _2332.z;
    float _2340 = _2332.w;
    float2 _6504 = float2(_2287, _2281);
    float3 _2342 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6504, float2(0.0), isnan(_6504)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6504, float2(0.0), isnan(_6504)), level(0.0)).xyz;
    float _2344 = _2342.x;
    float _2346 = _2342.y;
    float _2348 = _2342.z;
    float _2350 = _2319;
    if (!_1833)
    {
        float3 _6525 = float3(_2329, _2093, float(as_type<int>(_2319)));
        float3 _6527 = select(_6525, float3(0.0), isnan(_6525));
        float _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6527.xy, uint(rint(_6527.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6527.xy, uint(rint(_6527.z)), level(0.0)).x;
        _2350 = _2352;
    }
    float _2354 = _2350;
    float _2356 = abs(_1695);
    float _2358 = log2(_2356);
    float _2360 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2362 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2360);
    float _2364 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2362);
    bool _2366 = _1695 <= 8000.0;
    bool _2368 = isnan(_1695);
    bool _2370 = _2366 || _2368;
    bool _2372 = isnan(8000.0);
    bool _2374 = _2370 || _2372;
    float _2376 = float(_2374);
    float _2378 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2364);
    float _2380 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2382 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2261;
    out.gl_Position.y = _2283;
    out.gl_Position.z = _2378;
    out.gl_Position.w = _2233;
    float _2384 = exp2(_2380);
    float _2386 = exp2(_2382);
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = fma(_2390, -2.0, 3.0);
    float _2394 = _2390 * _2390;
    float _2396 = _2394 * _2392;
    float _2398 = _2378 + _2233;
    float _2400 = _2398 * 0.5;
    float _2402 = -_2396;
    float _2404 = _2402 + 1.0;
    out.m_103.z = _2400;
    out.m_103.w = _2233;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2396);
    float _2408 = _2376 * _2406;
    float _2410 = _2406;
    float _2412 = _2261;
    if (!_2217)
    {
        _2410 = 1.0;
    }
    float _2414 = _2410;
    float _2416 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2418 = -_2384;
    float _2420 = _2418 + 1.0;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2424 = _2420;
    float _2426 = _2414;
    if (_1833)
    {
        _2424 = 1.0;
    }
    float _2428 = _2424;
    float _2430 = -_2079;
    float _2432 = _2430 + 1.0;
    float _2434 = _2432 * _2416;
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2428;
    if (_2217)
    {
        bool _2440 = _2307 >= _2259;
        bool _2442 = isnan(_2307);
        bool _2444 = _2440 || _2442;
        bool _2446 = isnan(_2259);
        bool _2448 = _2444 || _2446;
        float _2450 = float(_2448);
        _2426 = _2450;
    }
    float _2452 = _2426;
    float _2454 = _2452;
    if (!_1833)
    {
        int _2456 = _1991 << 4;
        int _2458 = _2456 + 2048;
        uint _2460 = uint(int(uint(_2458) >> uint(2)));
        uint _2462 = uint(int(uint(int(_2460)) >> uint(2)));
        int _2464 = int(_2460) & 3;
        float _2466 = (*spvDescriptorSet0.vp_c15)._m0[int(_2462)][_2464];
        int _2468 = int(_2460) + 1;
        uint _2470 = uint(int(uint(_2468) >> uint(2)));
        int _2472 = _2468 & 3;
        float _2474 = (*spvDescriptorSet0.vp_c15)._m0[int(_2470)][_2472];
        int _2476 = _2458 + 8;
        uint _2478 = uint(int(uint(_2476) >> uint(2)));
        uint _2480 = uint(int(uint(int(_2478)) >> uint(2)));
        int _2482 = int(_2478) & 3;
        float _2484 = (*spvDescriptorSet0.vp_c15)._m0[int(_2480)][_2482];
        int _2486 = int(_2478) + 1;
        uint _2488 = uint(int(uint(_2486) >> uint(2)));
        int _2490 = _2486 & 3;
        float _2492 = (*spvDescriptorSet0.vp_c15)._m0[int(_2488)][_2490];
        float _2494 = _1647 * _2474;
        float _2496 = fma(_868, _2466, _2494);
        float _2498 = fma(_918, _2484, _2496);
        float _2500 = _2498 + _2492;
        float _2502 = precise::clamp(_2500, 0.0, 1.0);
        float _2504 = -_2502;
        float _2506 = _2504 + _2354;
        float _2508 = fma(_2506, 500.0, 1.5);
        float _2510 = exp2(_2508);
        float _2512 = 0.0 + _2510;
        float _2514 = precise::clamp(_2512, 0.0, 1.0);
        _2438 = _2514;
        _2265 = _2510;
        _2412 = 500.0;
    }
    float _2516 = _2438;
    float _2518 = _2265;
    float _2520 = _2412;
    float _2522 = _2452 * _2516;
    float _2524 = -_2436;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2528 = _2422 * _2321;
    out.m_105.x = _1591;
    out.m_105.y = _1589;
    out.m_105.z = _1593;
    bool _2530 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2532 = isnan(_1859);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2538 = _2534 || _2536;
    float _2540 = -_2522;
    float _2542 = fma(_2540, _2526, 1.0);
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = _2340 * _2528;
    float _2548 = -_2422;
    float _2550 = _2548 + 1.0;
    float _2552 = _2348 * _2528;
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2556 = fma(_2344, _2546, _2334);
    float _2558 = fma(_2346, _2546, _2336);
    float _2560 = _2340 * _2550;
    float _2562 = fma(_2340, _2552, _2338);
    out.m_107.x = _2554;
    float _2564 = _2520;
    float _2566 = _2518;
    float _2568 = _2546;
    float _2570 = _2550;
    float _2572 = _2544;
    if (!_2538)
    {
        _2564 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2574 = _2564;
    out.m_109.x = _2556;
    out.m_109.y = _2558;
    out.m_109.z = _2562;
    out.m_109.w = _2560;
    float _2576 = _2574;
    float _2578 = _2574;
    if (!_2538)
    {
        _2566 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2580 = _2566;
    float _2582 = _2580;
    float _2584 = _2580;
    if (!_2538)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2586 = _2454;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2538)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2592 = _2568;
    float _2594 = _2592;
    float _2596 = _2592;
    if (!_2538)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2598 = _2570;
    float _2600 = _2598;
    float _2602 = _2598;
    if (!_2538)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2604 = _2572;
    bool _2606 = !_2538;
    float _2608 = _2604;
    float _2610 = _2604;
    if (!_2606)
    {
        bool _2612 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2614 = isnan(_1859);
        bool _2616 = _2612 || _2614;
        bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2620 = _2616 || _2618;
        if (!_2620)
        {
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2624 = _1859 + _2622;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2628 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2626;
            float _2630 = 1.0 / _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2652 = _2624 * _2630;
            float _2654 = precise::clamp(_2652, 0.0, 1.0);
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2660 = fma(_2654, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2662 = fma(_2654, _2658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2664 = fma(_2654, _2638, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2654, _2642, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2668 = fma(_2654, _2646, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2670 = fma(_2654, _2650, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2584 = _2662;
            _2602 = _2668;
            _2578 = _2660;
            _2596 = _2666;
            _2590 = _2664;
            _2610 = _2670;
            _2672 = true;
        }
        else
        {
            bool _2674 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2676 = isnan(_1859);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2682 = _2678 || _2680;
            if (!_2682)
            {
                _2576 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2684 = _2576;
            _2578 = _2684;
            if (!_2682)
            {
                _2582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2686 = _2582;
            _2584 = _2686;
            if (!_2682)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2688 = _2588;
            _2590 = _2688;
            if (!_2682)
            {
                _2594 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2690 = _2594;
            _2596 = _2690;
            if (!_2682)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2692 = _2600;
            _2602 = _2692;
            if (!_2682)
            {
                _2608 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2694 = _2608;
            bool _2696 = !_2682;
            _2610 = _2694;
            if (!_2696)
            {
                bool _2698 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2700 = isnan(_1859);
                bool _2702 = _2698 || _2700;
                bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2706 = _2702 || _2704;
                if (!_2706)
                {
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2710 = _1859 + _2708;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2714 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2712;
                    float _2716 = 1.0 / _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2738 = _2710 * _2716;
                    float _2740 = precise::clamp(_2738, 0.0, 1.0);
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2746 = fma(_2740, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2748 = fma(_2740, _2744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2750 = fma(_2740, _2724, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2740, _2728, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2754 = fma(_2740, _2732, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2756 = fma(_2740, _2736, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2584 = _2748;
                    _2602 = _2754;
                    _2578 = _2746;
                    _2596 = _2752;
                    _2590 = _2750;
                    _2610 = _2756;
                    _2672 = true;
                }
                else
                {
                    _2584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2578 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2596 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2610 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2672 = false;
    float _2758 = _2584;
    float _2760 = _2602;
    float _2762 = _2578;
    float _2764 = _2596;
    float _2766 = _2590;
    float _2768 = _2610;
    float _2770 = fma(_1481, -0.5, 0.5);
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = -_2758;
    float _2776 = _2774 + _2760;
    float _2778 = -_2762;
    float _2780 = _2778 + _2764;
    float _2782 = -_2766;
    float _2784 = _2782 + _2768;
    bool _2786 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2788 = fma(_2772, _2776, _2758);
    float _2790 = fma(_2772, _2780, _2762);
    float _2792 = fma(_2772, _2784, _2766);
    float _2794 = _2788 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _2796 = fma(_2790, 0.298911988735198974609375, _2794);
    float _2798 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2800 = fma(_2792, 0.114477999508380889892578125, _2796);
    out.m_63.x = _2798;
    float _2802 = -_2800;
    float _2804 = _2790 + _2802;
    float _2806 = -_2800;
    float _2808 = _2788 + _2806;
    float _2810 = -_2800;
    float _2812 = _2792 + _2810;
    float _2814 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2816 = fma(_2808, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2818 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    out.m_113.x = _2814;
    out.m_113.y = _2816;
    out.m_113.z = _2818;
    if (!_2786)
    {
        return out;
    }
    float _2820 = -_1589;
    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2824 = -_1591;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2828 = -_1593;
    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2832 = _2822 * _2822;
    float _2834 = fma(_2826, _2826, _2832);
    float _2836 = fma(_2830, _2830, _2834);
    float _2838 = sqrt(_2836);
    float _2840 = rsqrt(_2836);
    float _2842 = -_2838;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2846 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2848 = precise::clamp(_2846, 0.0, 1.0);
    float _2850 = _2826 * _2840;
    float _2852 = _2822 * _2840;
    float _2854 = abs(_2848);
    float _2856 = log2(_2854);
    float _2858 = _2830 * _2840;
    float _2860 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2862 = _1481 * _2852;
    float _2864 = -_2852;
    float _2866 = -_2860;
    float _2868 = fma(_2864, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2866);
    float _2870 = fma(_1471, _2850, _2862);
    float _2872 = -_2858;
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2868);
    float _2876 = fma(_1493, _2858, _2870);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2882 = _2874 + _2880;
    float _2884 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2886 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2888 = precise::clamp(_2886, 0.0, 1.0);
    float _2890 = exp2(_2884);
    float _2892 = _2890 * _2888;
    float _2894 = _2878 * _2892;
    float _2896 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2900 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2896;
    out.m_111.y = _2898;
    out.m_111.z = _2900;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2672 = false;
    bool _1543 = false;
    bool _366 = false;
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
        float _2957 = as_type<float>(_148);
        out.gl_Position.z = _2957;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_65.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_63.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3026 = as_type<float>(_186);
        out.gl_Position.z = _3026;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _208 = _192 * _192;
    float _210 = _190 * _190;
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_198, _198, _208);
    float _216 = fma(_196, _196, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = fma(_204, _204, _214);
    float _222 = fma(_202, _202, _216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    float _228 = sqrt(_222);
    bool _230 = _224 > 0.0;
    bool _232 = _226 > 0.0;
    float _234 = _226;
    float _236 = _224;
    if (_230)
    {
        float _238 = rsqrt(_218);
        _234 = _238;
    }
    float _240 = _234;
    if (!_230)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    bool _244 = _228 > 0.0;
    float _246 = _228;
    float _248 = _242;
    if (!_230)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = 0.0;
    float _254 = _250;
    if (!_230)
    {
        _252 = 0.0;
    }
    float _256 = _252;
    float _258 = 0.0;
    float _260 = _256;
    if (_232)
    {
        float _262 = rsqrt(_220);
        _258 = _262;
    }
    float _264 = _258;
    float _266 = 0.0;
    float _268 = 0.0;
    if (!_232)
    {
        _266 = 0.0;
        _268 = 0.0;
    }
    float _270 = _266;
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    float _278 = _270;
    if (!_232)
    {
        _274 = 0.0;
    }
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    if (_244)
    {
        float _286 = rsqrt(_222);
        _282 = _286;
    }
    float _288 = _282;
    float _290 = _240;
    if (_230)
    {
        float _292 = _240 * _194;
        _254 = _292;
    }
    float _294 = _254;
    if (_230)
    {
        float _296 = _240 * _188;
        _248 = _296;
    }
    float _298 = _248;
    if (_230)
    {
        float _300 = _240 * _200;
        _260 = _300;
    }
    float _302 = _260;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = 0.0;
    if (!_244)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = 0.0;
    float _312 = _308;
    if (!_244)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = _314;
    if (_232)
    {
        float _318 = _264 * _198;
        _284 = _318;
    }
    float _320 = _284;
    if (!_244)
    {
        _290 = 0.0;
    }
    float _322 = _290;
    float _324 = _322;
    if (_232)
    {
        float _326 = _264 * _192;
        _276 = _326;
    }
    float _328 = _276;
    if (_232)
    {
        float _330 = _264 * _204;
        _278 = _330;
    }
    float _332 = _278;
    if (_244)
    {
        float _334 = _288 * _196;
        _312 = _334;
    }
    float _336 = _312;
    if (_244)
    {
        float _338 = _288 * _190;
        _316 = _338;
    }
    float _340 = _316;
    if (_244)
    {
        float _342 = _288 * _202;
        _324 = _342;
    }
    float _344 = _324;
    bool _346 = !_304;
    float _364;
    if (!_346)
    {
        float _348 = in.m_73.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_132);
        float _370 = 1.0 / _368;
        float _372 = _166 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_73.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _380 = _374 + _378;
    float _382 = in.m_73.x;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _384;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _398 = _396 != 0;
    float _400 = in.m_60.x;
    float _402 = in.m_60.y;
    float _404 = in.m_60.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = 1.0 / _386;
    float _412 = in.m_73.y;
    float _414 = 1.0 / _408;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _374 + _416;
    float _420 = _376 * 2.0;
    float _422 = _380 * _410;
    float _424 = floor(_420);
    float _426 = _382 * 2.0;
    float _428 = _202 * _402;
    float _430 = _196 * _402;
    float _432 = _418 * _414;
    float _434 = _190 * _402;
    float _436 = floor(_426);
    float _438 = _412 + _376;
    float _440 = fma(_200, _400, _428);
    float _442 = _382 + _376;
    float _444 = fma(_194, _400, _430);
    float _446 = _438 + (-1.0);
    float _448 = _412 * 2.0;
    float _450 = _442 + (-1.0);
    float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _454 = log2(_452);
    bool _456 = _424 > 0.0;
    float _458 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _460 = _382 + _412;
    float _462 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _464 = _424 >= 0.0;
    bool _466 = isnan(_424);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_198, _404, _444);
    bool _476 = !_390;
    int _478 = _476 ? 0 : 1;
    float _480 = _460 + (-1.0);
    float _482 = floor(_448);
    int _484 = _472 ? 0 : 1;
    float _486 = fma(_188, _400, _434);
    bool _488 = _436 > 0.0;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _492 = abs(_478);
    float _494 = _454 * _166;
    int _496 = ~_484;
    int _498 = _496 + 1;
    int _500 = _498 + 1;
    float _502 = fma(_192, _404, _486);
    bool _504 = _436 >= 0.0;
    bool _506 = isnan(_436);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    int _514 = _500;
    float _516 = _502;
    float _518 = _376;
    if (!_456)
    {
        int _520 = ~_484;
        int _522 = _520 + 1;
        _514 = _522;
    }
    int _524 = _514;
    float _526 = exp2(_494);
    int _528 = _512 ? 0 : 1;
    float _530 = float(_492);
    float _532 = float(_524);
    int _534 = ~_528;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    int _540 = _538;
    if (!_488)
    {
        int _542 = ~_528;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    float _548 = _530 * _532;
    float _550 = in.m_75.x;
    float _552 = in.m_75.y;
    float _554 = in.m_75.z;
    bool _556 = !_394;
    int _558 = _556 ? 0 : 1;
    float _560 = _548 * (-2.0);
    bool _562 = _482 > 0.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _566 = 1.0 + _564;
    int _568 = abs(_558);
    float _570 = -_526;
    float _572 = _570 + 1.0;
    bool _574 = _482 >= 0.0;
    bool _576 = isnan(_482);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = 1.0 / _566;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _586;
    bool _590 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(1.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _600;
    float _604 = float(_546);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _606;
    bool _610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _618 = _614 || _616;
    float _620 = fma(_588, _422, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _622 = float(_568);
    float _624 = fma(_602, _422, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _626 = _618 ? _572 : 0.0;
    float _628 = fma(_608, _422, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _630 = fma(_490, _560, _490);
    float _632 = _622 * _604;
    int _634 = _582 ? 0 : 1;
    float _636 = fma(_560, _550, _550);
    float _638 = _382 + (-0.5);
    float _640 = _632 * (-2.0);
    if (_598)
    {
        float _642 = _626 * _584;
        _170 = _642;
    }
    float _644 = _170;
    float _646 = _412 + (-0.5);
    bool _648 = !_398;
    int _650 = _648 ? 0 : 1;
    float _652 = fma(_640, _552, _552);
    float _654 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[196].x, _636);
    int _656 = ~_634;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_458, _640, _458);
    bool _664 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _666 = isnan(_374);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _680 = _660;
    if (!_562)
    {
        int _682 = ~_634;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _652);
    int _690 = abs(_650);
    float _692 = -_674;
    float _694 = _692 + 1.0;
    bool _696 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _698 = isnan(_374);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = fma(_630, _644, _654);
    bool _710 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _712 = isnan(_374);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _730 = float(_686);
    float _732 = _720 * _694;
    float _734 = -_720;
    float _736 = _734 + 1.0;
    float _738 = float(_690);
    float _740 = fma(_724, _432, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _742 = fma(_728, _432, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _744 = fma(_678, _432, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _746 = _706 * _736;
    float _748 = _738 * _730;
    float _750 = _708 * 0.15915493667125701904296875;
    float _752 = fma(_662, _644, _688);
    float _754 = _620 * _746;
    float _756 = _748 * (-2.0);
    float _758 = in.m_77.x;
    float _760 = in.m_77.y;
    float _762 = in.m_77.z;
    float _764 = _752 * 0.15915493667125701904296875;
    float _766 = _624 * _746;
    float _768 = fma(_756, _554, _554);
    float _770 = _376 + (-0.5);
    float _772 = _628 * _746;
    float _774 = -_706;
    float _776 = _774 + 1.0;
    float _778 = in.m_79.x;
    float _780 = in.m_79.y;
    float _782 = in.m_79.z;
    float _784 = fma(_462, _756, _462);
    float _786 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _754);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _792 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _772);
    float _794 = fma(_784, _644, _786);
    float _796 = fma(_740, _732, _788);
    float _798 = fma(_742, _732, _790);
    float _800 = fma(_744, _732, _792);
    float _802 = _794 * 0.15915493667125701904296875;
    float _804 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].x, _796);
    float _806 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].y, _798);
    float _808 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[145].z, _800);
    float _810 = _750 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _808 * _762;
    float _816 = _804 * _758;
    float _818 = _806 * _760;
    float _820 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _822 = _764 * 6.283185482025146484375;
    float _824 = sin(_822);
    float _826 = _816 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _778);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _780);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _834 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _836 = _828 * _826;
    float _838 = _764 * 6.283185482025146484375;
    float _840 = cos(_838);
    float _842 = _830 * _834;
    float _844 = _832 * _820;
    float _846 = in.m_69.w;
    float _848 = in.m_71.w;
    float _850 = _802 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _812 * _824;
    float _856 = _750 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _812 * _840;
    float _862 = _802 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _812 * _852;
    float _868 = _474 + _846;
    float _870 = _858 * _824;
    float _872 = _858 * _840;
    float _874 = _866 * _842;
    float _876 = _840 * _852;
    float _878 = _858 * _852;
    float _880 = _824 * _852;
    float _882 = fma(_864, _860, _870);
    float _884 = -_842;
    float _886 = _864 * _884;
    float _888 = -_872;
    float _890 = fma(_864, _854, _888);
    float _892 = -_854;
    float _894 = fma(_864, _872, _892);
    float _896 = fma(_882, _836, _874);
    float _898 = fma(_876, _836, _886);
    float _900 = _878 * _842;
    float _902 = fma(_864, _870, _860);
    float _904 = fma(_890, _844, _896);
    float _906 = fma(_880, _844, _898);
    float _908 = fma(_894, _836, _900);
    float _910 = fma(_204, _404, _440);
    float _912 = _904 * _336;
    float _914 = _904 * _344;
    float _916 = fma(_902, _844, _908);
    float _918 = _910 + _848;
    float _920 = fma(_906, _294, _912);
    float _922 = fma(_906, _302, _914);
    float _924 = in.m_67.w;
    float _926 = _904 * _340;
    float _928 = fma(_916, _320, _920);
    float _930 = fma(_916, _332, _922);
    float _932 = fma(_906, _298, _926);
    float _934 = _868 + _928;
    float _936 = _918 + _930;
    float _938 = fma(_916, _328, _932);
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _942 = _934 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _946 = _936 + _944;
    float _948 = _942 * _942;
    float _950 = _946 * _946;
    float _952 = _948 + _950;
    float _954 = sqrt(_952);
    float _956 = _502 + _924;
    float _958 = _956 + _938;
    bool _960 = _954 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = _954 + _962;
    float _966 = _754;
    float _968 = _916;
    float _970 = _934;
    float _972 = _936;
    float _974 = _882;
    float _976 = _958;
    float _978 = _948;
    float _980 = _950;
    float _982 = _876;
    float _984 = _890;
    if (_960)
    {
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _966 = _986;
    }
    float _988 = _966;
    if (_960)
    {
        float _990 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _990;
    }
    float _992 = _516;
    float _994 = _992;
    if (_960)
    {
        float _996 = rsqrt(_952);
        _968 = _996;
    }
    float _998 = _968;
    float _1000 = _988;
    float _1002 = _998;
    if (_960)
    {
        float _1004 = _964 * _988;
        _1000 = _1004;
    }
    float _1006 = _1000;
    float _1008 = _1006;
    if (_960)
    {
        float _1010 = _1006 * 0.15915493667125701904296875;
        _1008 = _1010;
    }
    float _1012 = _1008;
    float _1014 = _188;
    float _1016 = _1012;
    if (_960)
    {
        float _1018 = _1012 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        _1014 = _1020;
    }
    float _1022 = _1014;
    if (_960)
    {
        float _1024 = fma(_1022, _992, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _1024;
    }
    float _1026 = _994;
    if (_960)
    {
        float _1028 = _998 * _1026;
        _1002 = _1028;
    }
    float _1030 = _1002;
    if (_960)
    {
        float _1032 = fma(_942, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _970 = _1032;
    }
    float _1034 = _970;
    if (_960)
    {
        float _1036 = fma(_946, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _972 = _1036;
    }
    float _1038 = _972;
    float _1040 = fma(_1034, 6.2500002968590706586837768554688e-05, 0.5);
    float _1042 = fma(_1038, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4270 = float2(_1040, _1042);
    float3 _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4270, float2(0.0), isnan(_4270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4270, float2(0.0), isnan(_4270)), level(0.0)).xyz;
    float _1048 = _1046.x;
    float _1050 = _1046.y;
    float _1052 = _1046.z;
    float _1054 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1056 = in.m_81.y;
    float _1058 = _1054 * _382;
    float _1060 = in.m_73.w;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1068 = _1066 != 0;
    float _1070 = in.m_81.x;
    float _1072 = trunc(_1058);
    int _1074 = int(_1072);
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1082 = _1080 != 0;
    bool _1084 = _412 > 0.5;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1086 = -_1056;
    float _1088 = _1086 + 1.0;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1092 = _1074 << 4;
    int _1094 = _1092 + 1968;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1100 = _1060 > 0.5;
    uint _1103 = uint(int(uint(_1094) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = in.m_85.x;
    float _1121 = in.m_85.y;
    float _1123 = in.m_85.z;
    float _1125 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1127 = _1100 ? as_type<int>(_1088) : as_type<int>(_1056);
    int _1129 = 0;
    bool _1131 = _1082;
    float _1133 = _1056;
    bool _1135 = _1084;
    float _1137 = 1.0;
    float _1139 = _1098;
    float _1141 = _1038;
    if (_1064)
    {
        float _1143 = -_1070;
        float _1145 = _1143 + 1.0;
        _1129 = as_type<int>(_1145);
    }
    int _1147 = _1129;
    bool _1149 = _780 != 0.0;
    bool _1151 = isnan(_780);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1082 ? as_type<float>(_1127) : _1056;
    int _1163 = _1094 + 8;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[int(_1167)][_1169];
    bool _1173 = _778 == 0.0;
    bool _1175 = !_1157;
    bool _1177 = _1173 && _1175;
    int _1179 = _1147;
    if (_1064)
    {
        bool _1181 = _382 > 0.5;
        _1131 = _1181;
    }
    bool _1183 = _1131;
    float _1185 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1068)
    {
        float _1187 = _1084 ? _1088 : _1056;
        _1133 = _1187;
    }
    float _1189 = _1133;
    bool _1191 = _782 == 0.0;
    bool _1193 = _1191 && _1177;
    float _1195 = in.m_87.x;
    float _1197 = in.m_87.y;
    float _1199 = in.m_87.z;
    float _1201 = in.m_87.w;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1078)
    {
        bool _1205 = _376 > 0.5;
        _1135 = _1205;
    }
    bool _1207 = _1135;
    if (!_1064)
    {
        _1137 = _1070;
    }
    float _1209 = _1137;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1213 = _1209;
    if (_1064)
    {
        float _1215 = _1183 ? as_type<float>(_1147) : _1070;
        _1213 = _1215;
    }
    float _1217 = _1213;
    if (_1078)
    {
        float _1219 = -_1070;
        float _1221 = _1219 + 1.0;
        _1179 = as_type<int>(_1221);
    }
    int _1223 = _1179;
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = 0.0;
    float _1229 = _1119;
    if (_1193)
    {
        _1227 = _1119;
    }
    float _1231 = _1227;
    out.m_89.x = _1125;
    out.m_89.y = _1225;
    out.m_89.z = _1159;
    out.m_89.w = _1098;
    float _1233 = _1231;
    if (_1193)
    {
        _518 = _1231;
    }
    float _1235 = _518;
    float _1237 = _1235;
    if (!_1193)
    {
        _1233 = _1119;
    }
    float _1239 = _1233;
    if (!_1078)
    {
        _1229 = _1070;
    }
    float _1241 = _1229;
    float _1243 = _1241;
    if (_1078)
    {
        float _1245 = _1207 ? as_type<float>(_1223) : _1070;
        _1243 = _1245;
    }
    float _1247 = _1243;
    if (!_1193)
    {
        float _1249 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1239);
        _1237 = _1249;
    }
    float _1251 = _1237;
    if (_1193)
    {
        _1139 = _1121;
    }
    float _1253 = _1139;
    float _1255 = _1253;
    if (!_1193)
    {
        float _1257 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1121);
        _1255 = _1257;
    }
    float _1259 = _1255;
    float _1261 = _1197 * _1123;
    float _1263 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1265 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1267 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1199 * _1239;
    float _1271 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1265;
    if (_1193)
    {
        _1273 = _1123;
    }
    float _1275 = _1273;
    float _1277 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1279 = _1275;
    if (!_1193)
    {
        float _1281 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1123);
        _1279 = _1281;
    }
    float _1283 = _1279;
    float _1285 = -_1269;
    float _1287 = fma(_1195, _1123, _1285);
    float _1289 = _1195 * _1121;
    float _1291 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = -_1261;
    float _1295 = fma(_1199, _1121, _1293);
    float _1297 = _1287 * _1201;
    float _1299 = -_1289;
    float _1301 = fma(_1197, _1239, _1299);
    float _1303 = -_1197;
    float _1305 = _864 * _1303;
    out.m_91.x = _1271;
    out.m_91.y = _1267;
    out.m_91.z = _1291;
    float _1307 = _1295 * _1201;
    float _1309 = _1301 * _1201;
    float _1311 = _866 * _1197;
    float _1313 = _878 * _1197;
    float _1315 = fma(_876, _1195, _1305);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1319 = fma(_882, _1195, _1311);
    float _1321 = fma(_894, _1195, _1313);
    float _1323 = -_1259;
    float _1325 = _864 * _1323;
    float _1327 = -_1297;
    float _1329 = _864 * _1327;
    float _1331 = _866 * _1259;
    float _1333 = _878 * _1259;
    float _1335 = _866 * _1297;
    float _1337 = _878 * _1297;
    float _1339 = fma(_876, _1251, _1325);
    float _1341 = fma(_894, _1251, _1333);
    float _1343 = fma(_882, _1251, _1331);
    float _1345 = fma(_894, _1307, _1337);
    float _1347 = fma(_876, _1307, _1329);
    float _1349 = _1337;
    if (_960)
    {
        float _1351 = _1012 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = fma(_882, _1307, _1335);
    float _1359 = fma(_880, _1283, _1339);
    float _1361 = fma(_890, _1283, _1343);
    float _1363 = fma(_902, _1283, _1341);
    float _1365 = fma(_890, _1199, _1319);
    float _1367 = fma(_880, _1199, _1315);
    float _1369 = fma(_880, _1309, _1347);
    float _1371 = fma(_902, _1199, _1321);
    float _1373 = fma(_902, _1309, _1345);
    float _1375 = _1365 * _336;
    float _1377 = _1365 * _340;
    float _1379 = _1365 * _344;
    float _1381 = fma(_890, _1309, _1357);
    float _1383 = _1361 * _336;
    float _1385 = _1361 * _340;
    float _1387 = _1365;
    float _1389 = _1361;
    float _1391 = _1367;
    if (_960)
    {
        float _1393 = _1355 + (-1.0);
        _1387 = _1393;
    }
    float _1395 = _1387;
    float _1397 = _1361 * _344;
    if (_960)
    {
        float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1401 = _1034 + _1399;
        _1389 = _1401;
    }
    float _1403 = _1389;
    float _1405 = _1381 * _344;
    if (_960)
    {
        float _1407 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _1407;
    }
    float _1409 = _974;
    float _1411 = fma(_1367, _294, _1375);
    float _1413 = fma(_1367, _298, _1377);
    float _1415 = fma(_1367, _302, _1379);
    if (_960)
    {
        float _1417 = fma(_958, _1355, _1409);
        _976 = _1417;
    }
    float _1419 = _976;
    if (_960)
    {
        float _1421 = _1403 * _1403;
        _978 = _1421;
    }
    float _1423 = _978;
    if (_960)
    {
        float _1425 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1427 = _1038 + _1425;
        _1391 = _1427;
    }
    float _1429 = _1391;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1435 = _1419 + _1433;
    float _1437 = _1381 * _336;
    if (_960)
    {
        float _1439 = _1429 * _1429;
        _980 = _1439;
    }
    float _1441 = _980;
    float _1443 = _1381 * _340;
    float _1445 = fma(_1435, _1435, _1423);
    float _1447 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1449 = fma(_1359, _294, _1383);
    float _1451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1453 = _1445 + _1441;
    float _1455 = fma(_1369, _294, _1437);
    float _1457 = fma(_1359, _298, _1385);
    float _1459 = fma(_1369, _298, _1443);
    float _1461 = fma(_1359, _302, _1397);
    float _1463 = fma(_1369, _302, _1405);
    float _1465 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1469 = _1447 * _1317;
    float _1471 = fma(_1363, _320, _1449);
    float _1473 = fma(_1371, _320, _1411);
    float _1475 = fma(_1371, _328, _1413);
    float _1477 = fma(_1373, _320, _1455);
    float _1479 = fma(_1373, _328, _1459);
    float _1481 = fma(_1363, _328, _1457);
    float _1483 = sqrt(_1453);
    float _1485 = _1203 * _1431;
    float _1487 = _1465 * _1451;
    float _1489 = fma(_1371, _332, _1415);
    float _1491 = fma(_1373, _332, _1463);
    float _1493 = fma(_1363, _332, _1461);
    float _1495 = _1185 * _1467;
    out.m_93.x = _1473;
    out.m_93.y = _1475;
    out.m_93.z = _1489;
    out.m_95.x = _1469;
    out.m_95.y = _1485;
    out.m_95.z = _1487;
    out.m_95.w = _1495;
    bool _1497 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1499 = isnan(_1483);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1505 = _1501 || _1503;
    out.m_97.x = _1477;
    out.m_97.y = _1479;
    out.m_97.z = _1491;
    out.m_99.x = _1471;
    out.m_99.y = _1481;
    out.m_99.z = _1493;
    float _1507 = _1465;
    if (!_1505)
    {
        _1507 = 1.0;
    }
    float _1509 = _1507;
    out.m_101.x = _1048;
    out.m_101.y = _1050;
    out.m_101.z = _1052;
    bool _1511 = !_1505;
    float _1513 = _1509;
    if (!_1511)
    {
        bool _1515 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1517 = isnan(_1483);
        bool _1519 = _1515 || _1517;
        bool _1521 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1523 = _1519 || _1521;
        if (!_1523)
        {
            float _1525 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1527 = _1483 + _1525;
            float _1529 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1531 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1529;
            float _1533 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1535 = _1533 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1537 = 1.0 / _1531;
            float _1539 = _1527 * _1537;
            float _1541 = fma(_1539, _1535, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1513 = _1541;
            _1543 = true;
        }
        else
        {
            bool _1545 = _1483 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1547 = isnan(_1483);
            bool _1549 = _1545 || _1547;
            bool _1551 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1553 = _1549 || _1551;
            if (!_1553)
            {
                float _1555 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1557 = _1483 + _1555;
                float _1559 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1561 = _1559 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1563 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1565 = _1563 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1567 = 1.0 / _1561;
                float _1569 = _1557 * _1567;
                float _1571 = fma(_1569, _1565, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1513 = _1571;
                _1543 = true;
            }
            else
            {
                _1513 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1543 = false;
    float _1573 = _1513;
    float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1577 = _1419 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1581 = _1034 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1585 = _1038 + _1583;
    float _1587 = _956 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1589 = fma(_1577, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1591 = fma(_1581, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1593 = fma(_1585, _1573, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1595 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1587);
    float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1599 = _1589 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1603 = _1591 + _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1607 = _1593 + _1605;
    float _1609 = _1599 * _1599;
    float _1611 = fma(_1603, _1603, _1609);
    float _1613 = fma(_1607, _1607, _1611);
    float _1615 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1595);
    float _1617 = _956 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1619 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1621 = rsqrt(_1613);
    float _1623 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1625 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1617);
    float _1627 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1629 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1625);
    float _1631 = 1.0 / _1623;
    float _1633 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1635 = _1633 + _1623;
    float _1637 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1639 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1641 = floor(_1619);
    float _1643 = _1603 * _1637;
    float _1645 = _1607 * _1637;
    float _1647 = _956 + _1639;
    float _1649 = _1643 * _1643;
    float _1651 = _1645 * _1645;
    float _1653 = _1635 * _1631;
    float _1655 = _1653 * 0.5;
    float _1657 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1661 = _1649 + _1651;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1665 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1663);
    float _1667 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1657);
    float _1669 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1659);
    float _1671 = sqrt(_1661);
    float _1673 = -_1641;
    float _1675 = _1619 + _1673;
    float _1677 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1667);
    float _1679 = fma(_918, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1669);
    float _1681 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1683 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1685 = 1.0 / _1665;
    bool _1687 = _1671 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1689 = trunc(_1681);
    int _1691 = int(_1689);
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1695 = _1685 * _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1699 = _1671 + _1697;
    float _1701 = trunc(_1683);
    int _1703 = int(_1701);
    bool _1705 = _1695 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1707 = _1695 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1709 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1711 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1713 = _1691 + _1711;
    int _1715 = _1713 + 1;
    float _1717 = _1631;
    int _1719 = 2;
    float _1721 = _1661;
    float _1723 = _1637;
    float _1725 = _1699;
    float _1727 = _1641;
    float _1729 = _1643;
    float _1731 = _1649;
    if (_1687)
    {
        float _1733 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1717 = _1733;
    }
    float _1735 = _1717;
    float _1737 = precise::max(0.0, _1709);
    if (!_1705)
    {
        _1719 = 1;
    }
    int _1739 = _1719;
    float _1741 = -_1637;
    float _1743 = -_1737;
    float _1745 = fma(_1599, _1741, _1743);
    int _1747 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1749 = _1703 + _1747;
    int _1751 = _1749 + 1;
    int _1753 = _1739;
    if (_1687)
    {
        float _1755 = rsqrt(_1661);
        _1721 = _1755;
    }
    float _1757 = _1721;
    float _1759 = _1757;
    if (_1687)
    {
        float _1761 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1723 = _1761;
    }
    float _1763 = _1723;
    int _1765 = _1715 | _1751;
    float _1767 = as_type<float>(_1765);
    if (_1687)
    {
        float _1769 = _1699 * _1735;
        _1725 = _1769;
    }
    float _1771 = _1725;
    if (!_1687)
    {
        _1727 = _1745;
    }
    float _1773 = _1727;
    float _1775 = floor(_1627);
    float _1777 = _1773;
    if (_1687)
    {
        float _1779 = _1771 * 0.15915493667125701904296875;
        _1016 = _1779;
    }
    float _1781 = _1016;
    bool _1783 = !_1705;
    int _1785 = _1783 ? 0 : 1;
    if (!_1707)
    {
        _1753 = _1785;
    }
    int _1787 = _1753;
    float _1789 = _1677;
    if (_1687)
    {
        float _1791 = _1781 * 6.283185482025146484375;
        float _1793 = sin(_1791);
        _1789 = _1793;
    }
    float _1795 = _1789;
    bool _1797 = _1715 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1799 = _1787 << 6;
    bool _1801 = _1765 < 0;
    bool _1803 = _1801 || _1797;
    int _1805 = _1799 + 96;
    uint _1807 = uint(int(uint(_1805) >> uint(2)));
    uint _1809 = uint(int(uint(int(_1807)) >> uint(2)));
    int _1811 = int(_1807) & 3;
    float _1813 = (*spvDescriptorSet0.vp_c15)._m0[int(_1809)][_1811];
    int _1815 = int(_1807) + 1;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    int _1819 = _1815 & 3;
    float _1821 = (*spvDescriptorSet0.vp_c15)._m0[int(_1817)][_1819];
    float _1823 = _1781;
    if (_1687)
    {
        float _1825 = _1781 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        _1823 = _1827;
    }
    float _1829 = _1823;
    bool _1831 = _1751 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1833 = _1831 || _1803;
    int _1835 = _1799 + 48;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    uint _1839 = uint(int(uint(int(_1837)) >> uint(2)));
    int _1841 = int(_1837) & 3;
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[int(_1839)][_1841];
    int _1845 = int(_1837) + 1;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    int _1849 = _1845 & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    if (_1687)
    {
        float _1853 = fma(_1795, _1763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1767 = _1853;
    }
    float _1855 = _1767;
    float _1857 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1859 = sqrt(_1613);
    if (_1687)
    {
        float _1861 = _1757 * _1855;
        _982 = _1861;
    }
    float _1863 = _982;
    float _1865 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1857);
    int _1867 = _1799 + 104;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    float _1885 = _1829;
    if (_1687)
    {
        float _1887 = _1829 + (-1.0);
        _1759 = _1887;
    }
    float _1889 = _1759;
    float _1891 = _1889;
    if (_1687)
    {
        float _1893 = _1643 * _1863;
        _1729 = _1893;
    }
    float _1895 = _1729;
    float _1897 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1865);
    if (!_1833)
    {
        float _1899 = floor(_1683);
        _1141 = _1899;
    }
    float _1901 = _1141;
    if (_1687)
    {
        float _1903 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _984 = _1903;
    }
    float _1905 = _984;
    if (!_1687)
    {
        _1891 = _1645;
    }
    float _1907 = _1891;
    float _1909 = _1907;
    if (_1687)
    {
        float _1911 = _1645 * _1863;
        _1909 = _1911;
    }
    float _1913 = _1909;
    int _1915 = _1799 + 64;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    uint _1919 = uint(int(uint(int(_1917)) >> uint(2)));
    int _1921 = int(_1917) & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    int _1925 = int(_1917) + 1;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    int _1929 = _1925 & 3;
    float _1931 = (*spvDescriptorSet0.vp_c15)._m0[int(_1927)][_1929];
    if (_1687)
    {
        float _1933 = fma(_1745, _1829, _1905);
        _1777 = _1933;
    }
    float _1935 = _1777;
    if (_1687)
    {
        float _1937 = _1895 * _1895;
        _1731 = _1937;
    }
    float _1939 = _1731;
    float _1941 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1687)
    {
        _1885 = _1651;
    }
    float _1943 = _1885;
    float _1945 = _1943;
    if (_1687)
    {
        float _1947 = _1913 * _1913;
        _1945 = _1947;
    }
    float _1949 = _1945;
    float _1951 = fma(_1935, _1935, _1939);
    float _1953 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1955 = _1799 + 80;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    uint _1959 = uint(int(uint(int(_1957)) >> uint(2)));
    int _1961 = int(_1957) & 3;
    float _1963 = (*spvDescriptorSet0.vp_c15)._m0[int(_1959)][_1961];
    int _1965 = int(_1957) + 1;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    int _1969 = _1965 & 3;
    float _1971 = (*spvDescriptorSet0.vp_c15)._m0[int(_1967)][_1969];
    float _1973 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1975 = -_1775;
    float _1977 = _1627 + _1975;
    float _1979 = _1951 + _1949;
    float _1981 = -_1973;
    float _1983 = fma(_1981, _1953, 1.0);
    int _1985 = as_type<int>(_1973);
    if (!_1833)
    {
        int _1987 = _1751 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1989 = _1987 + _1715;
        _1985 = _1989;
    }
    int _1991 = _1985;
    int _1993 = _1799 + 56;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    uint _1997 = uint(int(uint(int(_1995)) >> uint(2)));
    int _1999 = int(_1995) & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    int _2003 = int(_1995) + 1;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    int _2007 = _2003 & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    float _2011 = log2(_1983);
    int _2013 = _1799 + 88;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1647 * _1821;
    float _2033 = fma(_868, _1813, _2031);
    int _2035 = _1799 + 72;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    uint _2039 = uint(int(uint(int(_2037)) >> uint(2)));
    int _2041 = int(_2037) & 3;
    float _2043 = (*spvDescriptorSet0.vp_c15)._m0[int(_2039)][_2041];
    int _2045 = int(_2037) + 1;
    uint _2047 = uint(int(uint(_2045) >> uint(2)));
    int _2049 = _2045 & 3;
    float _2051 = (*spvDescriptorSet0.vp_c15)._m0[int(_2047)][_2049];
    float _2053 = _1647 * _1851;
    float _2055 = rsqrt(_1979);
    float _2057 = _2011 * 0.693147182464599609375;
    float _2059 = fma(_868, _1843, _2053);
    int _2061 = as_type<int>(_2053);
    int _2063 = as_type<int>(_1813);
    if (!_1833)
    {
        int _2065 = _1991 << 2;
        _2061 = _2065;
    }
    int _2067 = _2061;
    float _2069 = fma(_918, _1875, _2033);
    int _2071 = _2067;
    if (!_1833)
    {
        int _2073 = 12 & _2067;
        _2071 = _2073;
    }
    int _2075 = _2071;
    float _2077 = _2069 + _1883;
    float2 _6048 = float2(_1675, _1977);
    float _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6048, float2(0.0), isnan(_6048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6048, float2(0.0), isnan(_6048)), level(0.0)).x;
    float _2081 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2083 = _1647 * _1931;
    float _2085 = _1931;
    int _2087 = as_type<int>(_1971);
    if (!_1833)
    {
        float _2089 = -_1901;
        float _2091 = _1683 + _2089;
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2097 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2095);
    float _2099 = precise::clamp(_2097, 0.0, 1.0);
    float _2101 = _2055 * _1895;
    float _2103 = fma(_868, _1923, _2083);
    float _2105 = _2055 * _1935;
    float _2107 = _2055 * _1913;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2111 = _1647 * _1971;
    if (!_1833)
    {
        uint _2113 = uint(int(uint(_1991) >> uint(2)));
        _2087 = int(_2113);
    }
    int _2115 = _2087;
    float _2117 = fma(_868, _1963, _2111);
    float _2119 = -_2099;
    float _2121 = _2119 + 1.0;
    if (!_1833)
    {
        int _2123 = _2115 << 4;
        int _2125 = _2123 + _2075;
        _2063 = _2125;
    }
    int _2127 = _2063;
    float _2129 = fma(_918, _2001, _2059);
    float _2131 = 1.0 / _2077;
    float _2133 = _2101;
    if (!_1833)
    {
        int _2135 = _2127 + 400;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
        int _2141 = int(_2137) & 3;
        float _2143 = (*spvDescriptorSet0.vp_c15)._m0[int(_2139)][_2141];
        _2133 = _2143;
    }
    float _2145 = _2133;
    float _2147 = _2129 + _2009;
    float _2149 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_918, _2021, _2117);
    float _2153 = -_2109;
    float _2155 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2153);
    float _2157 = abs(_2121);
    float _2159 = log2(_2157);
    float _2161 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2165 = -_2107;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2155);
    float _2169 = _2105 + 1.0;
    float _2171 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2173 = fma(_918, _2043, _2103);
    float _2175 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2163);
    float _2177 = _2147 * _2131;
    float _2179 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2171);
    float _2181 = _2173 + _2051;
    float _2183 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2185 = fma(_2167, -0.5, 0.5);
    bool _2187 = _2177 >= 0.0;
    float _2189 = _2181 * _2131;
    float _2191 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2183);
    float _2193 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2195 = _2177 <= 1.0;
    bool _2197 = _2195 && _2187;
    float _2199 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2201 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2191);
    float _2203 = exp2(_2193);
    bool _2205 = _2189 >= 0.0;
    bool _2207 = _2205 && _2197;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2211 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2213 = fma(_2167, 0.5, 0.5);
    bool _2215 = _2189 <= 1.0;
    bool _2217 = _2215 && _2207;
    float _2219 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2209);
    float _2223 = _2151 + _2029;
    float _2225 = sqrt(_2185);
    float _2227 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2221);
    float _2229 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2231 = fma(_2213, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2227);
    float _2235 = -_2105;
    float _2237 = fma(_2203, _2169, _2235);
    float _2239 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2229);
    float _2241 = fma(_2213, _2231, -0.212114393711090087890625);
    float _2243 = 1.0 / _2233;
    float _2245 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = _2169;
    if (_2217)
    {
        float _2249 = float(_1787);
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2239);
    float _2255 = fma(_2213, _2241, 1.570728778839111328125);
    float _2257 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2259 = _2223 * _2131;
    float _2261 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2253);
    float _2263 = _2251;
    float _2265 = _2259;
    if (_2217)
    {
        float _2267 = rint(_2251);
        float _2269 = precise::max(_2267, 0.0);
        uint _2271 = uint(_2269);
        uint _2273 = clamp(_2271, 0u, 65535u);
        _2263 = as_type<float>(_2273);
    }
    float _2275 = _2263;
    float _2277 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2257);
    float _2279 = _2225 * 0.636619746685028076171875;
    float _2281 = fma(_2237, 0.5, 0.5);
    float _2283 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2277);
    float _2285 = -_2255;
    float _2287 = fma(_2279, _2285, 1.0);
    float _2289 = _2175;
    if (!_1833)
    {
        float _2291 = floor(_1681);
        _2289 = _2291;
    }
    float _2293 = _2289;
    float _2295 = _2261 * _2243;
    float _2297 = _2283 * _2243;
    float _2299 = fma(_2295, 0.5, 0.5);
    float _2301 = fma(_2297, -0.5, 0.5);
    float _2303 = _2275;
    if (_2217)
    {
        float3 _6437 = float3(_2177, _2189, float(as_type<int>(_2275)));
        float3 _6441 = select(_6437, float3(0.0), isnan(_6437));
        float _2305 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6441.xy, uint(rint(_6441.z)), _2259, level(0.0));
        _2303 = _2305;
    }
    float _2307 = _2303;
    float _2309 = _2131;
    if (!_1833)
    {
        float _2311 = rint(_2145);
        float _2313 = precise::max(_2311, 0.0);
        uint _2315 = uint(_2313);
        uint _2317 = clamp(_2315, 0u, 65535u);
        _2309 = as_type<float>(_2317);
    }
    float _2319 = _2309;
    float3 _6467 = float3(_2299, _2301, _2081);
    float _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6467, float3(0.0), isnan(_6467)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6467, float3(0.0), isnan(_6467)), level(0.0)).x;
    float _2323 = _2293;
    if (!_1833)
    {
        float _2325 = -_2293;
        float _2327 = _1681 + _2325;
        _2323 = _2327;
    }
    float _2329 = _2323;
    float3 _6488 = float3(_2299, _2301, _2081);
    float4 _2332 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6488, float3(0.0), isnan(_6488)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6488, float3(0.0), isnan(_6488)), level(0.0)).xyzw;
    float _2334 = _2332.x;
    float _2336 = _2332.y;
    float _2338 = _2332.z;
    float _2340 = _2332.w;
    float2 _6504 = float2(_2287, _2281);
    float3 _2342 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6504, float2(0.0), isnan(_6504)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6504, float2(0.0), isnan(_6504)), level(0.0)).xyz;
    float _2344 = _2342.x;
    float _2346 = _2342.y;
    float _2348 = _2342.z;
    float _2350 = _2319;
    if (!_1833)
    {
        float3 _6525 = float3(_2329, _2093, float(as_type<int>(_2319)));
        float3 _6527 = select(_6525, float3(0.0), isnan(_6525));
        float _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6527.xy, uint(rint(_6527.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6527.xy, uint(rint(_6527.z)), level(0.0)).x;
        _2350 = _2352;
    }
    float _2354 = _2350;
    float _2356 = abs(_1695);
    float _2358 = log2(_2356);
    float _2360 = _2199 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2362 = fma(_2211, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2360);
    float _2364 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2362);
    bool _2366 = _1695 <= 8000.0;
    bool _2368 = isnan(_1695);
    bool _2370 = _2366 || _2368;
    bool _2372 = isnan(8000.0);
    bool _2374 = _2370 || _2372;
    float _2376 = float(_2374);
    float _2378 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2364);
    float _2380 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2382 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2261;
    out.gl_Position.y = _2283;
    out.gl_Position.z = _2378;
    out.gl_Position.w = _2233;
    float _2384 = exp2(_2380);
    float _2386 = exp2(_2382);
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2390 = precise::clamp(_2388, 0.0, 1.0);
    float _2392 = fma(_2390, -2.0, 3.0);
    float _2394 = _2390 * _2390;
    float _2396 = _2394 * _2392;
    float _2398 = _2378 + _2233;
    float _2400 = _2398 * 0.5;
    float _2402 = -_2396;
    float _2404 = _2402 + 1.0;
    out.m_103.z = _2400;
    out.m_103.w = _2233;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2396);
    float _2408 = _2376 * _2406;
    float _2410 = _2406;
    float _2412 = _2261;
    if (!_2217)
    {
        _2410 = 1.0;
    }
    float _2414 = _2410;
    float _2416 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2418 = -_2384;
    float _2420 = _2418 + 1.0;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2424 = _2420;
    float _2426 = _2414;
    if (_1833)
    {
        _2424 = 1.0;
    }
    float _2428 = _2424;
    float _2430 = -_2079;
    float _2432 = _2430 + 1.0;
    float _2434 = _2432 * _2416;
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2428;
    if (_2217)
    {
        bool _2440 = _2307 >= _2259;
        bool _2442 = isnan(_2307);
        bool _2444 = _2440 || _2442;
        bool _2446 = isnan(_2259);
        bool _2448 = _2444 || _2446;
        float _2450 = float(_2448);
        _2426 = _2450;
    }
    float _2452 = _2426;
    float _2454 = _2452;
    if (!_1833)
    {
        int _2456 = _1991 << 4;
        int _2458 = _2456 + 2048;
        uint _2460 = uint(int(uint(_2458) >> uint(2)));
        uint _2462 = uint(int(uint(int(_2460)) >> uint(2)));
        int _2464 = int(_2460) & 3;
        float _2466 = (*spvDescriptorSet0.vp_c15)._m0[int(_2462)][_2464];
        int _2468 = int(_2460) + 1;
        uint _2470 = uint(int(uint(_2468) >> uint(2)));
        int _2472 = _2468 & 3;
        float _2474 = (*spvDescriptorSet0.vp_c15)._m0[int(_2470)][_2472];
        int _2476 = _2458 + 8;
        uint _2478 = uint(int(uint(_2476) >> uint(2)));
        uint _2480 = uint(int(uint(int(_2478)) >> uint(2)));
        int _2482 = int(_2478) & 3;
        float _2484 = (*spvDescriptorSet0.vp_c15)._m0[int(_2480)][_2482];
        int _2486 = int(_2478) + 1;
        uint _2488 = uint(int(uint(_2486) >> uint(2)));
        int _2490 = _2486 & 3;
        float _2492 = (*spvDescriptorSet0.vp_c15)._m0[int(_2488)][_2490];
        float _2494 = _1647 * _2474;
        float _2496 = fma(_868, _2466, _2494);
        float _2498 = fma(_918, _2484, _2496);
        float _2500 = _2498 + _2492;
        float _2502 = precise::clamp(_2500, 0.0, 1.0);
        float _2504 = -_2502;
        float _2506 = _2504 + _2354;
        float _2508 = fma(_2506, 500.0, 1.5);
        float _2510 = exp2(_2508);
        float _2512 = 0.0 + _2510;
        float _2514 = precise::clamp(_2512, 0.0, 1.0);
        _2438 = _2514;
        _2265 = _2510;
        _2412 = 500.0;
    }
    float _2516 = _2438;
    float _2518 = _2265;
    float _2520 = _2412;
    float _2522 = _2452 * _2516;
    float _2524 = -_2436;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2528 = _2422 * _2321;
    out.m_105.x = _1591;
    out.m_105.y = _1589;
    out.m_105.z = _1593;
    bool _2530 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2532 = isnan(_1859);
    bool _2534 = _2530 || _2532;
    bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2538 = _2534 || _2536;
    float _2540 = -_2522;
    float _2542 = fma(_2540, _2526, 1.0);
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = _2340 * _2528;
    float _2548 = -_2422;
    float _2550 = _2548 + 1.0;
    float _2552 = _2348 * _2528;
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2556 = fma(_2344, _2546, _2334);
    float _2558 = fma(_2346, _2546, _2336);
    float _2560 = _2340 * _2550;
    float _2562 = fma(_2340, _2552, _2338);
    out.m_107.x = _2554;
    float _2564 = _2520;
    float _2566 = _2518;
    float _2568 = _2546;
    float _2570 = _2550;
    float _2572 = _2544;
    if (!_2538)
    {
        _2564 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2574 = _2564;
    out.m_109.x = _2556;
    out.m_109.y = _2558;
    out.m_109.z = _2562;
    out.m_109.w = _2560;
    float _2576 = _2574;
    float _2578 = _2574;
    if (!_2538)
    {
        _2566 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2580 = _2566;
    float _2582 = _2580;
    float _2584 = _2580;
    if (!_2538)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2586 = _2454;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2538)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2592 = _2568;
    float _2594 = _2592;
    float _2596 = _2592;
    if (!_2538)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2598 = _2570;
    float _2600 = _2598;
    float _2602 = _2598;
    if (!_2538)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2604 = _2572;
    bool _2606 = !_2538;
    float _2608 = _2604;
    float _2610 = _2604;
    if (!_2606)
    {
        bool _2612 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2614 = isnan(_1859);
        bool _2616 = _2612 || _2614;
        bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2620 = _2616 || _2618;
        if (!_2620)
        {
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2624 = _1859 + _2622;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2628 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2626;
            float _2630 = 1.0 / _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2652 = _2624 * _2630;
            float _2654 = precise::clamp(_2652, 0.0, 1.0);
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2660 = fma(_2654, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2662 = fma(_2654, _2658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2664 = fma(_2654, _2638, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2654, _2642, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2668 = fma(_2654, _2646, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2670 = fma(_2654, _2650, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2584 = _2662;
            _2602 = _2668;
            _2578 = _2660;
            _2596 = _2666;
            _2590 = _2664;
            _2610 = _2670;
            _2672 = true;
        }
        else
        {
            bool _2674 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2676 = isnan(_1859);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2682 = _2678 || _2680;
            if (!_2682)
            {
                _2576 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2684 = _2576;
            _2578 = _2684;
            if (!_2682)
            {
                _2582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2686 = _2582;
            _2584 = _2686;
            if (!_2682)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2688 = _2588;
            _2590 = _2688;
            if (!_2682)
            {
                _2594 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2690 = _2594;
            _2596 = _2690;
            if (!_2682)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2692 = _2600;
            _2602 = _2692;
            if (!_2682)
            {
                _2608 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2694 = _2608;
            bool _2696 = !_2682;
            _2610 = _2694;
            if (!_2696)
            {
                bool _2698 = _1859 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2700 = isnan(_1859);
                bool _2702 = _2698 || _2700;
                bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2706 = _2702 || _2704;
                if (!_2706)
                {
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2710 = _1859 + _2708;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2714 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2712;
                    float _2716 = 1.0 / _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2738 = _2710 * _2716;
                    float _2740 = precise::clamp(_2738, 0.0, 1.0);
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2746 = fma(_2740, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2748 = fma(_2740, _2744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2750 = fma(_2740, _2724, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2740, _2728, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2754 = fma(_2740, _2732, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2756 = fma(_2740, _2736, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2584 = _2748;
                    _2602 = _2754;
                    _2578 = _2746;
                    _2596 = _2752;
                    _2590 = _2750;
                    _2610 = _2756;
                    _2672 = true;
                }
                else
                {
                    _2584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2578 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2596 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2610 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2672 = false;
    float _2758 = _2584;
    float _2760 = _2602;
    float _2762 = _2578;
    float _2764 = _2596;
    float _2766 = _2590;
    float _2768 = _2610;
    float _2770 = fma(_1481, -0.5, 0.5);
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = -_2758;
    float _2776 = _2774 + _2760;
    float _2778 = -_2762;
    float _2780 = _2778 + _2764;
    float _2782 = -_2766;
    float _2784 = _2782 + _2768;
    bool _2786 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2788 = fma(_2772, _2776, _2758);
    float _2790 = fma(_2772, _2780, _2762);
    float _2792 = fma(_2772, _2784, _2766);
    float _2794 = _2788 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _2796 = fma(_2790, 0.298911988735198974609375, _2794);
    float _2798 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2800 = fma(_2792, 0.114477999508380889892578125, _2796);
    out.m_63.x = _2798;
    float _2802 = -_2800;
    float _2804 = _2790 + _2802;
    float _2806 = -_2800;
    float _2808 = _2788 + _2806;
    float _2810 = -_2800;
    float _2812 = _2792 + _2810;
    float _2814 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2816 = fma(_2808, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2818 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    out.m_113.x = _2814;
    out.m_113.y = _2816;
    out.m_113.z = _2818;
    if (!_2786)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2820 = -_1589;
    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2824 = -_1591;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2828 = -_1593;
    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2832 = _2822 * _2822;
    float _2834 = fma(_2826, _2826, _2832);
    float _2836 = fma(_2830, _2830, _2834);
    float _2838 = sqrt(_2836);
    float _2840 = rsqrt(_2836);
    float _2842 = -_2838;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2846 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2848 = precise::clamp(_2846, 0.0, 1.0);
    float _2850 = _2826 * _2840;
    float _2852 = _2822 * _2840;
    float _2854 = abs(_2848);
    float _2856 = log2(_2854);
    float _2858 = _2830 * _2840;
    float _2860 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2862 = _1481 * _2852;
    float _2864 = -_2852;
    float _2866 = -_2860;
    float _2868 = fma(_2864, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2866);
    float _2870 = fma(_1471, _2850, _2862);
    float _2872 = -_2858;
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2868);
    float _2876 = fma(_1493, _2858, _2870);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2882 = _2874 + _2880;
    float _2884 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2886 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2888 = precise::clamp(_2886, 0.0, 1.0);
    float _2890 = exp2(_2884);
    float _2892 = _2890 * _2888;
    float _2894 = _2878 * _2892;
    float _2896 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2900 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2896;
    out.m_111.y = _2898;
    out.m_111.z = _2900;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

