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
    float4 m_87 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
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
    float4 m_85 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
    float4 m_77 [[attribute(11)]];
    float4 m_79 [[attribute(13)]];
    float4 m_73 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2332 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_56.w;
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
        out.m_59.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    float _138 = as_type<float>(_136);
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2618 = as_type<float>(_136);
        out.gl_Position.z = _2618;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_61.w;
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
        out.m_59.x = 0.0;
    }
    int _170 = 0;
    if (_166)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2686 = as_type<float>(_174);
        out.gl_Position.z = _2686;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_63.y;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = in.m_63.z;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = _176 * _176;
    float _192 = in.m_65.x;
    float _194 = _180 * _180;
    float _196 = in.m_63.x;
    float _198 = fma(_182, _182, _190);
    float _200 = in.m_67.x;
    float _202 = fma(_184, _184, _194);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _202);
    float _208 = sqrt(_204);
    float _210 = in.m_69.x;
    float _212 = in.m_69.y;
    float _214 = in.m_69.z;
    float _216 = sqrt(_206);
    bool _218 = _208 > 0.0;
    bool _220 = _216 > 0.0;
    float _222 = _182 * _212;
    float _224 = _176 * _212;
    float _226 = _186 * _212;
    float _228 = 0.0;
    float _230 = _214;
    float _232 = _204;
    if (_218)
    {
        float _234 = rsqrt(_204);
        _228 = _234;
    }
    float _236 = _228;
    float _238 = fma(_210, _192, _222);
    float _240 = fma(_210, _196, _224);
    float _242 = fma(_210, _200, _226);
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _242;
    if (!_218)
    {
        _244 = 0.0;
    }
    float _250 = _244;
    float _252 = fma(_184, _214, _238);
    float _254 = fma(_180, _214, _240);
    float _256 = fma(_188, _214, _242);
    float _258 = 0.0;
    float _260 = _250;
    if (_220)
    {
        float _262 = rsqrt(_206);
        _258 = _262;
    }
    float _264 = _258;
    if (!_220)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _266 = _230;
    float _268 = _232;
    float _270 = _266;
    float _272 = _268;
    if (!_218)
    {
        _246 = 0.0;
    }
    float _274 = _246;
    float _276 = _274;
    if (!_218)
    {
        _138 = 0.0;
    }
    float _278 = _138;
    float _280 = _278;
    if (!_220)
    {
        _248 = 0.0;
    }
    float _282 = _248;
    float _284 = _282;
    if (_218)
    {
        float _286 = _236 * _182;
        _276 = _286;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        float _292 = _236 * _176;
        _260 = _292;
    }
    float _294 = _260;
    float _296 = _294;
    if (_218)
    {
        float _298 = _236 * _186;
        _280 = _298;
    }
    float _300 = _280;
    float _302 = _300;
    if (_220)
    {
        float _304 = _264 * _184;
        _270 = _304;
    }
    float _306 = _270;
    if (_220)
    {
        float _308 = _264 * _180;
        _284 = _308;
    }
    float _310 = _284;
    if (_220)
    {
        float _312 = _264 * _188;
        _272 = _312;
    }
    float _314 = _272;
    bool _316 = !_178;
    float _334;
    if (!_316)
    {
        float _318 = in.m_71.x;
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
    float _346 = in.m_56.x;
    float _348 = in.m_56.y;
    float _350 = in.m_56.z;
    float _352 = in.m_65.w;
    float _354 = in.m_67.w;
    float _356 = _182 * _348;
    float _358 = _186 * _348;
    float _360 = fma(_192, _346, _356);
    float _362 = fma(_200, _346, _358);
    float _364 = fma(_184, _350, _360);
    float _366 = fma(_188, _350, _362);
    float _368 = _364 + _352;
    float _370 = _366 + _354;
    float _372 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _374 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _376 = floor(_372);
    float _378 = floor(_374);
    float _380 = -_376;
    float _382 = _372 + _380;
    float _384 = -_378;
    float _386 = _374 + _384;
    float2 _2995 = float2(_382, _386);
    float _388 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2995, float2(0.0), isnan(_2995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2995, float2(0.0), isnan(_2995)), level(0.0)).x;
    float _390 = _176 * _348;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _394 = _344 + _392;
    float _396 = _154 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = fma(_196, _346, _390);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _410 = _344 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = 1.0 / _404;
    float _418 = fma(_180, _350, _406);
    float _420 = _254 * _254;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _424 = _344 + _422;
    float _426 = in.m_63.w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = 1.0 / _400;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _434;
    float _438 = fma(_252, _252, _420);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = in.m_73.y;
    float _450 = fma(_256, _256, _438);
    float _452 = _394 * _416;
    float _454 = 1.0 / _414;
    float _456 = in.m_73.z;
    float _458 = fma(_442, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _460 = fma(_446, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = _410 * _432;
    float _468 = in.m_75.x;
    float _470 = in.m_75.y;
    float _472 = in.m_75.z;
    float _474 = rsqrt(_450);
    float _476 = fma(_430, _466, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = _424 * _454;
    bool _492 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_344);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = _396 * 0.15915493667125701904296875;
    float _506 = fma(_484, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _508 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_344);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_436, _466, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _522 = _504 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = -_502;
    float _528 = _526 + 1.0;
    float _530 = fma(_480, _466, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = fma(_464, _490, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = _518 * _528;
    float _536 = -_518;
    float _538 = _536 + 1.0;
    float _540 = fma(_488, _490, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _542 = _504 * 6.283185482025146484375;
    float _544 = sin(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _546;
    float _550 = _254 * _474;
    bool _552 = _468 > 0.0;
    float _554 = _252 * _474;
    bool _556 = _468 >= 0.0;
    bool _558 = isnan(_468);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = fma(_548, _490, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = _256 * _474;
    int _570 = _564 ? 0 : 1;
    bool _572 = _524 >= 0.0;
    bool _574 = isnan(_524);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    int _582 = ~_570;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    int _588 = _586;
    if (!_552)
    {
        int _590 = ~_570;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    bool _596 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_344);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    bool _608 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _610 = isnan(_344);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = _524 > 0.0;
    float _622 = _606 * _538;
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = float(_594);
    float _630 = _618 * _626;
    float _632 = _418 + _426;
    float _634 = -_618;
    float _636 = _634 + 1.0;
    float _638 = _530 * _630;
    float _640 = _632 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _642 = _476 * _630;
    float _644 = _520 * _630;
    float _646 = _544 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    int _648 = _580 ? 0 : 1;
    float _650 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _640);
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _654 = _646 * _628;
    int _656 = ~_648;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_370, (*spvDescriptorSet0.vp_c8)._m0[11].z, _650);
    int _664 = _660;
    if (!_620)
    {
        int _666 = ~_648;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = _654 * _448;
    float _674 = _524 * _524;
    float _676 = _662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _678 = float(_670);
    float _680 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].z, _638);
    float _682 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].x, _642);
    float _684 = _632 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _686 = 1.0 / _676;
    float _688 = _674 * _678;
    float _690 = fma(_458, _622, _682);
    float _692 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    float _694 = _550 * _294;
    float _696 = _672 * 0.01745329238474369049072265625;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _700 = fma(_370, (*spvDescriptorSet0.vp_c8)._m0[10].z, _692);
    float _702 = fma(_554, _288, _694);
    float _704 = _696 * 0.15915493667125701904296875;
    float _706 = fma(_460, _622, _652);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _710 = fma(_568, _300, _702);
    float _712 = _698 * _456;
    float _714 = in.m_77.x;
    float _716 = in.m_77.y;
    float _718 = in.m_77.z;
    float _720 = _708 + _676;
    float _722 = fma(_540, _534, _706);
    float _724 = _712 * (-0.01745329238474369049072265625);
    float _726 = _720 * _686;
    float _728 = _726 * 0.5;
    float _730 = abs(_710);
    bool _732 = _730 > 0.99989998340606689453125;
    float _734 = _704 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _724 * 0.15915493667125701904296875;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[30].w, _740);
    float _744 = fma(_532, _534, _690);
    float _746 = fma(_506, _622, _680);
    float _748 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].y, _722);
    float _750 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].x, _744);
    float _752 = _738 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = fma(_566, _534, _746);
    if (_732)
    {
        float _758 = fma(_306, 0.001000000047497451305389404296875, _288);
        _290 = _758;
    }
    float _760 = _290;
    if (_732)
    {
        float _762 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _762;
    }
    float _764 = _296;
    if (_732)
    {
        float _766 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _766;
    }
    float _768 = _302;
    float _770 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].z, _756);
    float _772 = _738 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _750 * _714;
    float _778 = -_760;
    float _780 = _568 * _778;
    float _782 = -_764;
    float _784 = _554 * _782;
    float _786 = -_768;
    float _788 = _550 * _786;
    float _790 = -_768;
    float _792 = -_780;
    float _794 = fma(_554, _790, _792);
    float _796 = _736 * _468;
    float _798 = 1.0 / _742;
    float _800 = -_760;
    float _802 = -_784;
    float _804 = fma(_550, _800, _802);
    float _806 = _754 * _472;
    float _808 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _810 = -_764;
    float _812 = -_788;
    float _814 = fma(_568, _810, _812);
    float _816 = _794 * _794;
    float _818 = _748 * _716;
    float _820 = _632 + _808;
    float _822 = _704 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _774 * _472;
    float _828 = fma(_774, _470, _806);
    float _830 = fma(_814, _814, _816);
    float _832 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _834 = -_826;
    float _836 = fma(_754, _470, _834);
    float _838 = fma(_804, _804, _830);
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _842 = _798 * _840;
    float _844 = _770 * _718;
    float _846 = _820 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _848 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _850 = _842 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _852 = rsqrt(_838);
    bool _854 = _842 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _856 = _824 * _468;
    float _858 = -_796;
    float _860 = fma(_828, _824, _858);
    bool _862 = !_850;
    int _864 = _862 ? 0 : 1;
    float _866 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[127].x, _846);
    float _868 = fma(_828, _736, _856);
    float _870 = _820 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _872 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[127].z, _866);
    float _874 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _876 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[126].x, _870);
    int _878 = 2;
    if (!_850)
    {
        _878 = 1;
    }
    int _880 = _878;
    float _882 = _872 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _884 = _880;
    if (!_854)
    {
        _884 = _864;
    }
    int _886 = _884;
    float _888 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[126].z, _876);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _836);
    float _892 = _814 * _852;
    int _894 = _886 << 6;
    float _896 = _888 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _898 = _832 * _890;
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    float _902 = _794 * _852;
    float _904 = _804 * _852;
    float _906 = trunc(_896);
    int _908 = int(_906);
    float _910 = _848 * _900;
    int _912 = _894 + 48;
    uint _915 = uint(int(uint(_912) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.vp_c15)._m0[int(_925)][_927];
    float _931 = in.m_71.x;
    float _933 = _898 * _568;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _937 = _554 * _902;
    float _939 = _898 * _554;
    float _941 = trunc(_882);
    int _943 = int(_941);
    float _945 = _550 * _904;
    int _947 = _894 + 96;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    float _965 = fma(_910, _904, _933);
    float _967 = _874 * _935;
    float _969 = -_937;
    float _971 = fma(_550, _892, _969);
    float _973 = fma(_910, _892, _939);
    float _975 = -_945;
    float _977 = fma(_568, _902, _975);
    int _979 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _981 = _908 + _979;
    int _983 = _981 + 1;
    float _985 = fma(_967, _971, _965);
    int _987 = _894 + 104;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    float _1005 = fma(_967, _977, _973);
    float _1007 = _370 + _985;
    bool _1009 = _983 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1011 = _368 + _1005;
    int _1013 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1015 = _943 + _1013;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1007 + _1019;
    int _1023 = _894 + 64;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1043 = _1011 + _1041;
    int _1045 = _983 | _1017;
    float _1047 = _1021 * _1021;
    float _1049 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1007);
    float _1051 = _898 * _550;
    bool _1053 = _1045 < 0;
    bool _1055 = _1053 || _1009;
    float _1057 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1011);
    int _1059 = _894 + 56;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    float _1077 = fma(_931, 100.0, _1049);
    bool _1079 = _1017 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1081 = _1079 || _1055;
    float _1083 = fma(_931, 100.0, _1057);
    float _1085 = fma(_1043, _1043, _1047);
    float _1087 = _1077 * 2.0;
    float _1089 = fma(_910, _902, _1051);
    float _1091 = _1083 * 2.0;
    int _1093 = _894 + 72;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    float _1111 = sqrt(_1085);
    float _1113 = _1087 * 0.15915493667125701904296875;
    float _1115 = _1091 * 0.15915493667125701904296875;
    float _1117 = _568 * _892;
    bool _1119 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1121 = isnan(0.5);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1127 = _1123 || _1125;
    int _1129 = _983;
    float _1131 = _1011;
    float _1133 = _1007;
    float _1135 = _1043;
    float _1137 = _896;
    if (!_1081)
    {
        int _1139 = _1017 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1141 = _1139 + _983;
        _1129 = _1141;
    }
    int _1143 = _1129;
    int _1145 = _894 + 80;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.vp_c15)._m0[int(_1157)][_1159];
    float _1163 = _1115 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = _820 * _929;
    float _1169 = -_1117;
    float _1171 = fma(_554, _904, _1169);
    float _1173 = fma(_368, _921, _1167);
    float _1175 = fma(_967, _1171, _1089);
    float _1177 = _820 * _963;
    bool _1179 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1181 = _1113 * 6.283185482025146484375;
    float _1183 = cos(_1181);
    int _1185 = as_type<int>(_921);
    int _1187 = as_type<int>(_1175);
    float _1189 = as_type<float>(_1143);
    if (!_1081)
    {
        int _1191 = _1143 << 2;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = fma(_368, _955, _1177);
    float _1197 = fma(_370, _995, _1195);
    float _1199 = _967;
    int _1201 = as_type<int>(_1197);
    if (!_1081)
    {
        float _1203 = floor(_896);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = _1197 + _1003;
    if (!_1081)
    {
        uint _1209 = uint(int(uint(_1143) >> uint(2)));
        _1201 = int(_1209);
    }
    int _1211 = _1201;
    float _1213 = _820 * _1039;
    float _1215 = fma(_368, _1031, _1213);
    float _1217 = _632 + _1175;
    int _1219 = as_type<int>(_1215);
    float _1221 = as_type<float>(_1211);
    if (!_1081)
    {
        int _1223 = 12 & _1193;
        _1187 = _1223;
    }
    int _1225 = _1187;
    float _1227 = fma(_370, _1067, _1173);
    float _1229 = fma(_1165, 0.100000001490116119384765625, _1217);
    float _1231 = 1.0 / _1207;
    float _1233 = _1227 + _1075;
    float _1235 = fma(_1183, 0.100000001490116119384765625, _1229);
    float _1237 = fma(_370, _1101, _1215);
    float _1239 = _1183;
    float _1241 = _1101;
    float _1243 = _1109;
    if (!_1081)
    {
        int _1245 = _1211 << 4;
        int _1247 = _1245 + _1225;
        _1219 = _1247;
    }
    int _1249 = _1219;
    if (!_1179)
    {
        _1221 = _1235;
    }
    float _1251 = _1221;
    float _1253 = _1237 + _1109;
    bool _1255 = !_1179;
    float _1257 = _1251;
    float _1259 = _1205;
    if (!_1255)
    {
        float _1261 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1265 = _1111 + _1263;
        float _1267 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = rsqrt(_1085);
        float _1271 = _1265 * _1261;
        float _1273 = _1271 * 0.15915493667125701904296875;
        float _1275 = _1273 * 6.283185482025146484375;
        float _1277 = cos(_1275);
        float _1279 = _1273 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        float _1283 = _1277 + (-1.0);
        float _1285 = _1283 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1287 = fma(_1281, _1267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = fma(_1235, _1277, _1285);
        float _1291 = _1269 * _1287;
        float _1293 = fma(_1043, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = fma(_1021, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1131 = _1293;
        _1133 = _1295;
        _1257 = _1289;
        _1239 = _1281;
    }
    float _1297 = _1131;
    float _1299 = _1133;
    float _1301 = _1257;
    float _1303 = _1239;
    float _1305 = _1303;
    float _1307 = _1301;
    if (_1127)
    {
        _1135 = _1297;
    }
    float _1309 = _1135;
    float _1311 = _1309;
    if (_1127)
    {
        _1305 = _1299;
    }
    float _1313 = _1305;
    float _1315 = _1313;
    if (!_1127)
    {
        float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1319 = _632 + _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1323 = _368 + _1321;
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = -_370;
        float _1329 = _1327 + _1299;
        float _1331 = _1319 * _1319;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _370 + _1333;
        float _1337 = fma(_1323, _1323, _1331);
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1341 = fma(_1335, _1335, _1337);
        float _1343 = sqrt(_1341);
        float _1345 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = precise::min(_1343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1349 = _1347 * _1339;
        float _1351 = -_632;
        float _1353 = _1351 + _1301;
        float _1355 = _1345 * _1349;
        float _1357 = -_368;
        float _1359 = _1357 + _1297;
        float _1361 = fma(_1353, _1355, _632);
        float _1363 = fma(_1359, _1355, _368);
        float _1365 = fma(_1329, _1355, _370);
        _1307 = _1361;
        _1311 = _1363;
        _1241 = _1359;
        _1315 = _1365;
    }
    float _1367 = _1307;
    float _1369 = _1311;
    float _1371 = _1241;
    float _1373 = _1315;
    int _1375 = _894 + 88;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    float _1393 = _1233 * _1231;
    float _1395 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1397 = _1253 * _1231;
    float _1399 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1401 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    bool _1405 = _1393 >= 0.0;
    float _1407 = _1371;
    if (!_1081)
    {
        int _1409 = _1249 + 400;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
        int _1415 = int(_1411) & 3;
        float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1399);
    float _1423 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1401);
    float _1425 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1403);
    float _1427 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1421);
    float _1431 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1423);
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1435 = _1393 <= 1.0;
    bool _1437 = _1435 && _1405;
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1443 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1445 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1447 = _1397 >= 0.0;
    bool _1449 = _1447 && _1437;
    float _1451 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1455 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1445);
    bool _1459 = _1397 <= 1.0;
    bool _1461 = _1459 && _1449;
    float _1463 = -_1453;
    float _1465 = fma(_1463, _1451, 1.0);
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1471 = _820 * _1161;
    float _1473 = _1235;
    float _1475 = _1453;
    if (!_1081)
    {
        float _1477 = floor(_882);
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1483 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1485 = fma(_368, _1153, _1471);
    float _1487 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1489 = log2(_1465);
    if (_1461)
    {
        float _1491 = float(_886);
        _1475 = _1491;
    }
    float _1493 = _1475;
    float _1495 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1481);
    float _1497 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1487);
    float _1499 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1501 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1503 = 1.0 / _1483;
    float _1505 = fma(_370, _1383, _1485);
    if (!_1081)
    {
        float _1507 = -_1479;
        float _1509 = _882 + _1507;
        _1243 = _1509;
    }
    float _1511 = _1243;
    float _1513 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1515 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1517 = _1505 + _1391;
    float _1519 = _1481;
    if (_1461)
    {
        float _1521 = rint(_1493);
        float _1523 = precise::max(_1521, 0.0);
        uint _1525 = uint(_1523);
        uint _1527 = clamp(_1525, 0u, 65535u);
        _1519 = as_type<float>(_1527);
    }
    float _1529 = _1519;
    float _1531 = _1517 * _1231;
    float _1533 = _1489 * 0.693147182464599609375;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = _1517;
    if (!_1081)
    {
        float _1539 = rint(_1419);
        float _1541 = precise::max(_1539, 0.0);
        uint _1543 = uint(_1541);
        uint _1545 = clamp(_1543, 0u, 65535u);
        _1537 = as_type<float>(_1545);
    }
    float _1547 = _1537;
    float _1549 = _1513 * _1503;
    float _1551 = _1515 * _1503;
    float _1553 = fma(_1549, 0.5, 0.5);
    float _1555 = fma(_1551, -0.5, 0.5);
    float _1557 = _1549;
    if (!_1081)
    {
        float _1559 = -_1205;
        float _1561 = _896 + _1559;
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1397;
    if (_1461)
    {
        float3 _4897 = float3(_1393, _1397, float(as_type<int>(_1529)));
        float3 _4901 = select(_4897, float3(0.0), isnan(_4897));
        float _1567 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4901.xy, uint(rint(_4901.z)), _1531, level(0.0));
        _1565 = _1567;
    }
    float _1569 = _1565;
    float3 _4911 = float3(_1553, _1555, _1535);
    float _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4911, float3(0.0), isnan(_4911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4911, float3(0.0), isnan(_4911)), level(0.0)).x;
    float3 _4920 = float3(_1553, _1555, _1535);
    float4 _1574 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4920, float3(0.0), isnan(_4920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4920, float3(0.0), isnan(_4920)), level(0.0)).xyzw;
    float _1576 = _1574.x;
    float _1578 = _1574.y;
    float _1580 = _1574.z;
    float _1582 = _1574.w;
    float _1584 = _1511;
    if (!_1081)
    {
        float3 _4943 = float3(_1563, _1511, float(as_type<int>(_1547)));
        float3 _4945 = select(_4943, float3(0.0), isnan(_4943));
        float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4945.xy, uint(rint(_4945.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4945.xy, uint(rint(_4945.z)), level(0.0)).x;
        _1584 = _1586;
    }
    float _1588 = _1584;
    if (_1081)
    {
        _1259 = 1.0;
    }
    float _1590 = _1259;
    float _1592 = _1590;
    if (!_1081)
    {
        int _1594 = _1143 << 4;
        int _1596 = _1594 + 2048;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
        int _1602 = int(_1598) & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        int _1606 = int(_1598) + 1;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        int _1610 = _1606 & 3;
        float _1612 = (*spvDescriptorSet0.vp_c15)._m0[int(_1608)][_1610];
        int _1614 = _1596 + 8;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        uint _1618 = uint(int(uint(int(_1616)) >> uint(2)));
        int _1620 = int(_1616) & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        int _1624 = int(_1616) + 1;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        int _1628 = _1624 & 3;
        float _1630 = (*spvDescriptorSet0.vp_c15)._m0[int(_1626)][_1628];
        float _1632 = _820 * _1612;
        float _1634 = fma(_368, _1604, _1632);
        float _1636 = fma(_370, _1622, _1634);
        float _1638 = _1636 + _1630;
        float _1640 = precise::clamp(_1638, 0.0, 1.0);
        float _1642 = -_1640;
        float _1644 = _1642 + _1588;
        float _1646 = fma(_1644, 500.0, 1.5);
        float _1648 = exp2(_1646);
        float _1650 = 0.0 + _1648;
        float _1652 = precise::clamp(_1650, 0.0, 1.0);
        _1189 = as_type<float>(_1596);
        _1592 = _1652;
    }
    float _1654 = _1189;
    float _1656 = _1592;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1660 = _1367 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1369 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1668 = _1373 + _1666;
    float _1670 = _1660 * _1660;
    float _1672 = fma(_1664, _1664, _1670);
    float _1674 = fma(_1668, _1668, _1672);
    float _1676 = rsqrt(_1674);
    float _1678 = sqrt(_1674);
    float _1680 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1682 = _1664 * _1680;
    float _1684 = _1668 * _1680;
    float _1686 = _1682 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 + _1688;
    float _1692 = sqrt(_1690);
    bool _1694 = _1692 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = _1692 + _1696;
    float _1700 = _1555;
    float _1702 = _1690;
    float _1704 = _1698;
    float _1706 = _1682;
    float _1708 = _1684;
    float _1710 = _1686;
    float _1712 = _1688;
    if (_1694)
    {
        float _1714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1714;
    }
    float _1716 = _1700;
    if (_1694)
    {
        float _1718 = rsqrt(_1690);
        _1702 = _1718;
    }
    float _1720 = _1702;
    if (_1694)
    {
        float _1722 = _1698 * _1716;
        _1704 = _1722;
    }
    float _1724 = _1704;
    if (_1694)
    {
        float _1726 = _1724 * 0.15915493667125701904296875;
        _1137 = _1726;
    }
    float _1728 = _1137;
    float _1730 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1732 = _1654;
    if (_1694)
    {
        float _1734 = _1728 * 6.283185482025146484375;
        float _1736 = sin(_1734);
        _1732 = _1736;
    }
    float _1738 = _1732;
    float _1740 = precise::max(0.0, _1730);
    float _1742 = _1724;
    float _1744 = _1740;
    if (_1694)
    {
        float _1746 = _1728 * 6.283185482025146484375;
        float _1748 = cos(_1746);
        _1742 = _1748;
    }
    float _1750 = _1742;
    float _1752 = -_1680;
    float _1754 = -_1740;
    float _1756 = fma(_1660, _1752, _1754);
    float _1758 = _1756;
    if (_1694)
    {
        float _1760 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1760;
    }
    float _1762 = _1744;
    float _1764 = _1738;
    float _1766 = _1762;
    if (_1694)
    {
        float _1768 = fma(_1738, _1762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1764 = _1768;
    }
    float _1770 = _1764;
    float _1772 = _1770;
    if (_1694)
    {
        float _1774 = _1720 * _1770;
        _1772 = _1774;
    }
    float _1776 = _1772;
    if (_1694)
    {
        float _1778 = _1750 + (-1.0);
        _1766 = _1778;
    }
    float _1780 = _1766;
    float _1782 = _1780;
    if (_1694)
    {
        float _1784 = _1682 * _1776;
        _1706 = _1784;
    }
    float _1786 = _1706;
    if (_1694)
    {
        float _1788 = _1684 * _1776;
        _1708 = _1788;
    }
    float _1790 = _1708;
    if (_1694)
    {
        float _1792 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1792;
    }
    float _1794 = _1782;
    if (_1694)
    {
        float _1796 = _1786 * _1786;
        _1710 = _1796;
    }
    float _1798 = _1710;
    if (_1694)
    {
        float _1800 = _1790 * _1790;
        _1712 = _1800;
    }
    float _1802 = _1712;
    if (_1694)
    {
        float _1804 = fma(_1756, _1750, _1794);
        _1758 = _1804;
    }
    float _1806 = _1758;
    float _1808 = fma(_1806, _1806, _1798);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1812 = fma(_1678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1810);
    float _1814 = precise::clamp(_1812, 0.0, 1.0);
    float _1816 = _1808 + _1802;
    float _1818 = -_1814;
    float _1820 = _1818 + 1.0;
    float _1822 = rsqrt(_1816);
    float _1824 = abs(_1820);
    float _1826 = log2(_1824);
    float _1828 = _1822 * _1786;
    float _1830 = _1822 * _1806;
    float _1832 = _1822 * _1790;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1836 = -_1834;
    float _1838 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1836);
    float _1840 = -_1832;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1838);
    float _1844 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1846 = fma(_1842, -0.5, 0.5);
    float _1848 = exp2(_1844);
    float _1850 = fma(_1842, 0.5, 0.5);
    float _1852 = fma(_1850, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = sqrt(_1846);
    float _1856 = fma(_1850, _1852, -0.212114393711090087890625);
    float _1858 = _1830 + 1.0;
    float _1860 = fma(_1850, _1856, 1.570728778839111328125);
    float _1862 = -_1830;
    float _1864 = fma(_1848, _1858, _1862);
    float _1866 = fma(_1864, 0.5, 0.5);
    float _1868 = _1854 * 0.636619746685028076171875;
    float _1870 = -_1860;
    float _1872 = fma(_1868, _1870, 1.0);
    float2 _5387 = float2(_1872, _1866);
    float3 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5387, float2(0.0), isnan(_5387)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5387, float2(0.0), isnan(_5387)), level(0.0)).xyz;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1886 = in.m_71.y;
    float _1888 = abs(_842);
    float _1890 = log2(_1888);
    float _1892 = _1884 * _931;
    float _1894 = in.m_79.x;
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1898 = _1896 != 0;
    float _1900 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1904 = _1902 != 0;
    float _1906 = in.m_79.y;
    float _1908 = trunc(_1892);
    int _1910 = int(_1908);
    bool _1912 = _931 > 0.5;
    bool _1914 = _1912 && _1898;
    float _1916 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1918 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1900);
    float _1920 = -_388;
    float _1922 = _1920 + 1.0;
    bool _1924 = _842 <= 8000.0;
    bool _1926 = isnan(_842);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(8000.0);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1938 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1918);
    bool _1940 = _1886 > 0.5;
    int _1942 = _1910 << 4;
    int _1944 = _1942 + 1712;
    float _1946 = exp2(_1916);
    float _1948 = _1886;
    float _1950 = _1894;
    float _1952 = _1934;
    if (_1898)
    {
        _1948 = _1894;
    }
    float _1954 = _1948;
    uint _1956 = uint(int(uint(_1944) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = -_1906;
    float _1974 = _1972 + 1.0;
    float _1976 = _1954;
    float _1978 = _1906;
    if (_1914)
    {
        float _1980 = -_1954;
        float _1982 = _1980 + 1.0;
        _1976 = _1982;
    }
    float _1984 = _1976;
    float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1988 = _1944 + 8;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    if (_1904)
    {
        float _1998 = _1940 ? _1974 : _1906;
        _1978 = _1998;
    }
    float _2000 = _1978;
    if (_1898)
    {
        _1950 = _1984;
    }
    float _2002 = _1950;
    float _2004 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2006 = _836 != 0.0;
    bool _2008 = isnan(_836);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.0);
    bool _2014 = _2010 || _2012;
    float _2016 = -_1946;
    float _2018 = _2016 + 1.0;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2024 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2026 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2028 = _2004 * _1986;
    float _2030 = _2024 * _1936;
    bool _2032 = _868 == 0.0;
    bool _2034 = !_2014;
    bool _2036 = _2032 && _2034;
    float _2038 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2040 = exp2(_2026);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2044 = _860 == 0.0;
    bool _2046 = _2044 && _2036;
    float _2048 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_81.x = _2030;
    out.m_81.y = _2028;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_83.x = _2050;
    out.m_83.y = _2038;
    out.m_83.z = _2048;
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _1962 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2060 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2062 = fma(_2056, -2.0, 3.0);
    float _2064 = in.m_85.x;
    float _2066 = in.m_85.y;
    float _2068 = in.m_85.z;
    float _2070 = _2056 * _2056;
    float _2072 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2070 * _2062;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _2074;
    out.m_87.y = _2076;
    out.m_87.z = _2080;
    out.m_87.w = _2052;
    float _2082 = _774 * _2068;
    float _2084 = _754 * _2068;
    float _2086 = -_2082;
    float _2088 = fma(_754, _2066, _2086);
    float _2090 = fma(_774, _2066, _2084);
    float _2092 = _736 * _2088;
    float _2094 = _824 * _2088;
    float _2096 = _2090;
    if (!_2046)
    {
        float _2098 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2090);
        _2096 = _2098;
    }
    float _2100 = _2096;
    float _2102 = -_2092;
    float _2104 = fma(_824, _2064, _2102);
    float _2106 = fma(_736, _2064, _2094);
    float _2108 = in.m_73.w;
    float _2110 = _2104;
    float _2112 = _2106;
    if (!_2046)
    {
        float _2114 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2104);
        _2110 = _2114;
    }
    float _2116 = _2110;
    if (!_2046)
    {
        float _2118 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2106);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = _550 * _2120;
    float _2124 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1938);
    float _2126 = -_2078;
    float _2128 = _2126 + 1.0;
    float _2130 = _554 * _2120;
    float _2132 = _568 * _2120;
    float _2134 = fma(_902, _2116, _2122);
    float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2078);
    float _2138 = fma(_892, _2116, _2130);
    float _2140 = fma(_904, _2116, _2132);
    float _2142 = _2124 + _1483;
    float _2144 = _1934 * _2136;
    if (!_1461)
    {
        _1952 = 1.0;
    }
    float _2146 = _1952;
    float _2148 = fma(_977, _2100, _2138);
    float _2150 = _2146;
    if (_1461)
    {
        bool _2152 = _1569 >= _1531;
        bool _2154 = isnan(_1569);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan(_1531);
        bool _2160 = _2156 || _2158;
        float _2162 = float(_2160);
        _2150 = _2162;
    }
    float _2164 = _2150;
    float _2166 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2168 = fma(_1171, _2100, _2134);
    float _2170 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2172 = fma(_971, _2100, _2140);
    float _2174 = _1922 * _2166;
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = _2142 * 0.5;
    float _2180 = _2164 * _1656;
    float _2182 = _2170 * _1571;
    float _2184 = -_2176;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_89.z = _2178;
    out.m_89.w = _1483;
    float _2188 = -_2170;
    float _2190 = _2188 + 1.0;
    bool _2192 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2194 = isnan(_1678);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2200 = _2196 || _2198;
    float _2202 = -_2180;
    float _2204 = fma(_2202, _2186, 1.0);
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _2124;
    out.gl_Position.w = _1483;
    float _2208 = _1582 * _2190;
    float _2210 = _2206 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _2148;
    out.m_91.y = _2168;
    out.m_91.z = _2172;
    float _2212 = _1582 * _2182;
    out.m_93.x = _2210;
    float _2214 = _1483;
    float _2216 = _2186;
    float _2218 = _2206;
    float _2220 = _2190;
    float _2222 = _2212;
    if (!_2200)
    {
        _2214 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _2214;
    out.m_95.w = _2108;
    float _2226 = _2108;
    float _2228 = _2224;
    float _2230 = _2224;
    if (!_2200)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2232 = _2216;
    float _2234 = _2232;
    float _2236 = _2232;
    if (!_2200)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2238 = _2218;
    float _2240 = _2238;
    float _2242 = _2238;
    if (!_2200)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2244 = _2220;
    float _2246 = _2244;
    float _2248 = _2244;
    if (!_2200)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2250 = _2226;
    float _2252 = _1882 * _2182;
    float _2254 = fma(_1878, _2212, _1576);
    float _2256 = fma(_1880, _2212, _1578);
    float _2258 = _2250;
    float _2260 = _2250;
    if (!_2200)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2262 = _2222;
    float _2264 = fma(_1582, _2252, _1580);
    out.m_97.x = _2254;
    out.m_97.y = _2256;
    out.m_97.z = _2264;
    out.m_97.w = _2208;
    bool _2266 = !_2200;
    float _2268 = _2262;
    float _2270 = _2262;
    if (!_2266)
    {
        bool _2272 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2274 = isnan(_1678);
        bool _2276 = _2272 || _2274;
        bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2280 = _2276 || _2278;
        if (!_2280)
        {
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2284 = _1678 + _2282;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2286;
            float _2290 = 1.0 / _2288;
            float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2312 = _2284 * _2290;
            float _2314 = precise::clamp(_2312, 0.0, 1.0);
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2320 = fma(_2314, _2294, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2322 = fma(_2314, _2318, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2324 = fma(_2314, _2298, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2326 = fma(_2314, _2302, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2328 = fma(_2314, _2306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2330 = fma(_2314, _2310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2260 = _2320;
            _2242 = _2328;
            _2270 = _2322;
            _2236 = _2326;
            _2230 = _2324;
            _2248 = _2330;
            _2332 = true;
        }
        else
        {
            bool _2334 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2336 = isnan(_1678);
            bool _2338 = _2334 || _2336;
            bool _2340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2342 = _2338 || _2340;
            if (!_2342)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2344 = _2268;
            _2270 = _2344;
            if (!_2342)
            {
                _2258 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2346 = _2258;
            _2260 = _2346;
            if (!_2342)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2348 = _2228;
            _2230 = _2348;
            if (!_2342)
            {
                _2234 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2350 = _2234;
            _2236 = _2350;
            if (!_2342)
            {
                _2240 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2352 = _2240;
            _2242 = _2352;
            if (!_2342)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2354 = _2246;
            bool _2356 = !_2342;
            _2248 = _2354;
            if (!_2356)
            {
                bool _2358 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2360 = isnan(_1678);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2366 = _2362 || _2364;
                if (!_2366)
                {
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2370 = _1678 + _2368;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2372;
                    float _2376 = 1.0 / _2374;
                    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2398 = _2370 * _2376;
                    float _2400 = precise::clamp(_2398, 0.0, 1.0);
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2406 = fma(_2400, _2380, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2408 = fma(_2400, _2404, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2410 = fma(_2400, _2384, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2412 = fma(_2400, _2388, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2414 = fma(_2400, _2392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2416 = fma(_2400, _2396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2260 = _2406;
                    _2242 = _2414;
                    _2270 = _2408;
                    _2236 = _2412;
                    _2230 = _2410;
                    _2248 = _2416;
                    _2332 = true;
                }
                else
                {
                    _2260 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2242 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2236 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2332 = false;
    float _2418 = _2260;
    float _2420 = _2242;
    float _2422 = _2270;
    float _2424 = _2236;
    float _2426 = _2230;
    float _2428 = _2248;
    float _2430 = fma(_2168, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2418;
    float _2436 = _2434 + _2420;
    float _2438 = -_2422;
    float _2440 = _2438 + _2424;
    float _2442 = -_2426;
    float _2444 = _2442 + _2428;
    bool _2446 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2448 = fma(_2432, _2436, _2418);
    float _2450 = fma(_2432, _2440, _2422);
    float _2452 = fma(_2432, _2444, _2426);
    float _2454 = _2448 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2456 = fma(_2450, 0.298911988735198974609375, _2454);
    float _2458 = fma(_2452, 0.114477999508380889892578125, _2456);
    out.m_99.x = 0.0;
    float _2460 = -_2458;
    float _2462 = _2450 + _2460;
    float _2464 = -_2458;
    float _2466 = _2448 + _2464;
    float _2468 = -_2458;
    float _2470 = _2452 + _2468;
    float _2472 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2474 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    float _2478 = fma(_2470, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    out.m_93.w = _2472;
    out.m_101.x = _2474;
    out.m_101.y = _2476;
    out.m_101.z = _2478;
    if (!_2446)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2480 = -_1367;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2484 = -_1369;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2488 = -_1373;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2492 = _2482 * _2482;
    float _2494 = fma(_2486, _2486, _2492);
    float _2496 = fma(_2490, _2490, _2494);
    float _2498 = sqrt(_2496);
    float _2500 = rsqrt(_2496);
    float _2502 = -_2498;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2506 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2486 * _2500;
    float _2512 = _2482 * _2500;
    float _2514 = abs(_2508);
    float _2516 = log2(_2514);
    float _2518 = _2490 * _2500;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = _2168 * _2512;
    float _2524 = -_2512;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = fma(_2148, _2510, _2522);
    float _2532 = -_2518;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = fma(_2172, _2518, _2530);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2542 = _2534 + _2540;
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2546 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = exp2(_2544);
    float _2552 = _2550 * _2548;
    float _2554 = _2538 * _2552;
    float _2556 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2556;
    out.m_99.y = _2558;
    out.m_99.z = _2560;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2332 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_56.w;
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
        out.m_59.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    float _138 = as_type<float>(_136);
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2618 = as_type<float>(_136);
        out.gl_Position.z = _2618;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_61.w;
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
        out.m_59.x = 0.0;
    }
    int _170 = 0;
    if (_166)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2686 = as_type<float>(_174);
        out.gl_Position.z = _2686;
    }
    if (_166)
    {
        return out;
    }
    float _176 = in.m_63.y;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = in.m_63.z;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = _176 * _176;
    float _192 = in.m_65.x;
    float _194 = _180 * _180;
    float _196 = in.m_63.x;
    float _198 = fma(_182, _182, _190);
    float _200 = in.m_67.x;
    float _202 = fma(_184, _184, _194);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _202);
    float _208 = sqrt(_204);
    float _210 = in.m_69.x;
    float _212 = in.m_69.y;
    float _214 = in.m_69.z;
    float _216 = sqrt(_206);
    bool _218 = _208 > 0.0;
    bool _220 = _216 > 0.0;
    float _222 = _182 * _212;
    float _224 = _176 * _212;
    float _226 = _186 * _212;
    float _228 = 0.0;
    float _230 = _214;
    float _232 = _204;
    if (_218)
    {
        float _234 = rsqrt(_204);
        _228 = _234;
    }
    float _236 = _228;
    float _238 = fma(_210, _192, _222);
    float _240 = fma(_210, _196, _224);
    float _242 = fma(_210, _200, _226);
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _242;
    if (!_218)
    {
        _244 = 0.0;
    }
    float _250 = _244;
    float _252 = fma(_184, _214, _238);
    float _254 = fma(_180, _214, _240);
    float _256 = fma(_188, _214, _242);
    float _258 = 0.0;
    float _260 = _250;
    if (_220)
    {
        float _262 = rsqrt(_206);
        _258 = _262;
    }
    float _264 = _258;
    if (!_220)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _266 = _230;
    float _268 = _232;
    float _270 = _266;
    float _272 = _268;
    if (!_218)
    {
        _246 = 0.0;
    }
    float _274 = _246;
    float _276 = _274;
    if (!_218)
    {
        _138 = 0.0;
    }
    float _278 = _138;
    float _280 = _278;
    if (!_220)
    {
        _248 = 0.0;
    }
    float _282 = _248;
    float _284 = _282;
    if (_218)
    {
        float _286 = _236 * _182;
        _276 = _286;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        float _292 = _236 * _176;
        _260 = _292;
    }
    float _294 = _260;
    float _296 = _294;
    if (_218)
    {
        float _298 = _236 * _186;
        _280 = _298;
    }
    float _300 = _280;
    float _302 = _300;
    if (_220)
    {
        float _304 = _264 * _184;
        _270 = _304;
    }
    float _306 = _270;
    if (_220)
    {
        float _308 = _264 * _180;
        _284 = _308;
    }
    float _310 = _284;
    if (_220)
    {
        float _312 = _264 * _188;
        _272 = _312;
    }
    float _314 = _272;
    bool _316 = !_178;
    float _334;
    if (!_316)
    {
        float _318 = in.m_71.x;
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
    float _346 = in.m_56.x;
    float _348 = in.m_56.y;
    float _350 = in.m_56.z;
    float _352 = in.m_65.w;
    float _354 = in.m_67.w;
    float _356 = _182 * _348;
    float _358 = _186 * _348;
    float _360 = fma(_192, _346, _356);
    float _362 = fma(_200, _346, _358);
    float _364 = fma(_184, _350, _360);
    float _366 = fma(_188, _350, _362);
    float _368 = _364 + _352;
    float _370 = _366 + _354;
    float _372 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _374 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _376 = floor(_372);
    float _378 = floor(_374);
    float _380 = -_376;
    float _382 = _372 + _380;
    float _384 = -_378;
    float _386 = _374 + _384;
    float2 _2995 = float2(_382, _386);
    float _388 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2995, float2(0.0), isnan(_2995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2995, float2(0.0), isnan(_2995)), level(0.0)).x;
    float _390 = _176 * _348;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _394 = _344 + _392;
    float _396 = _154 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = fma(_196, _346, _390);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _410 = _344 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = 1.0 / _404;
    float _418 = fma(_180, _350, _406);
    float _420 = _254 * _254;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _424 = _344 + _422;
    float _426 = in.m_63.w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = 1.0 / _400;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _434;
    float _438 = fma(_252, _252, _420);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = in.m_73.y;
    float _450 = fma(_256, _256, _438);
    float _452 = _394 * _416;
    float _454 = 1.0 / _414;
    float _456 = in.m_73.z;
    float _458 = fma(_442, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _460 = fma(_446, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = _410 * _432;
    float _468 = in.m_75.x;
    float _470 = in.m_75.y;
    float _472 = in.m_75.z;
    float _474 = rsqrt(_450);
    float _476 = fma(_430, _466, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = _424 * _454;
    bool _492 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_344);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = _396 * 0.15915493667125701904296875;
    float _506 = fma(_484, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _508 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_344);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_436, _466, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _522 = _504 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = -_502;
    float _528 = _526 + 1.0;
    float _530 = fma(_480, _466, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = fma(_464, _490, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = _518 * _528;
    float _536 = -_518;
    float _538 = _536 + 1.0;
    float _540 = fma(_488, _490, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _542 = _504 * 6.283185482025146484375;
    float _544 = sin(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _546;
    float _550 = _254 * _474;
    bool _552 = _468 > 0.0;
    float _554 = _252 * _474;
    bool _556 = _468 >= 0.0;
    bool _558 = isnan(_468);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = fma(_548, _490, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = _256 * _474;
    int _570 = _564 ? 0 : 1;
    bool _572 = _524 >= 0.0;
    bool _574 = isnan(_524);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    int _582 = ~_570;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    int _588 = _586;
    if (!_552)
    {
        int _590 = ~_570;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    bool _596 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_344);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    bool _608 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _610 = isnan(_344);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = _524 > 0.0;
    float _622 = _606 * _538;
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = float(_594);
    float _630 = _618 * _626;
    float _632 = _418 + _426;
    float _634 = -_618;
    float _636 = _634 + 1.0;
    float _638 = _530 * _630;
    float _640 = _632 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _642 = _476 * _630;
    float _644 = _520 * _630;
    float _646 = _544 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    int _648 = _580 ? 0 : 1;
    float _650 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _640);
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _654 = _646 * _628;
    int _656 = ~_648;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_370, (*spvDescriptorSet0.vp_c8)._m0[11].z, _650);
    int _664 = _660;
    if (!_620)
    {
        int _666 = ~_648;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = _654 * _448;
    float _674 = _524 * _524;
    float _676 = _662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _678 = float(_670);
    float _680 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].z, _638);
    float _682 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].x, _642);
    float _684 = _632 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _686 = 1.0 / _676;
    float _688 = _674 * _678;
    float _690 = fma(_458, _622, _682);
    float _692 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    float _694 = _550 * _294;
    float _696 = _672 * 0.01745329238474369049072265625;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _700 = fma(_370, (*spvDescriptorSet0.vp_c8)._m0[10].z, _692);
    float _702 = fma(_554, _288, _694);
    float _704 = _696 * 0.15915493667125701904296875;
    float _706 = fma(_460, _622, _652);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _710 = fma(_568, _300, _702);
    float _712 = _698 * _456;
    float _714 = in.m_77.x;
    float _716 = in.m_77.y;
    float _718 = in.m_77.z;
    float _720 = _708 + _676;
    float _722 = fma(_540, _534, _706);
    float _724 = _712 * (-0.01745329238474369049072265625);
    float _726 = _720 * _686;
    float _728 = _726 * 0.5;
    float _730 = abs(_710);
    bool _732 = _730 > 0.99989998340606689453125;
    float _734 = _704 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _724 * 0.15915493667125701904296875;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[30].w, _740);
    float _744 = fma(_532, _534, _690);
    float _746 = fma(_506, _622, _680);
    float _748 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].y, _722);
    float _750 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].x, _744);
    float _752 = _738 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = fma(_566, _534, _746);
    if (_732)
    {
        float _758 = fma(_306, 0.001000000047497451305389404296875, _288);
        _290 = _758;
    }
    float _760 = _290;
    if (_732)
    {
        float _762 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _762;
    }
    float _764 = _296;
    if (_732)
    {
        float _766 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _766;
    }
    float _768 = _302;
    float _770 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].z, _756);
    float _772 = _738 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _750 * _714;
    float _778 = -_760;
    float _780 = _568 * _778;
    float _782 = -_764;
    float _784 = _554 * _782;
    float _786 = -_768;
    float _788 = _550 * _786;
    float _790 = -_768;
    float _792 = -_780;
    float _794 = fma(_554, _790, _792);
    float _796 = _736 * _468;
    float _798 = 1.0 / _742;
    float _800 = -_760;
    float _802 = -_784;
    float _804 = fma(_550, _800, _802);
    float _806 = _754 * _472;
    float _808 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _810 = -_764;
    float _812 = -_788;
    float _814 = fma(_568, _810, _812);
    float _816 = _794 * _794;
    float _818 = _748 * _716;
    float _820 = _632 + _808;
    float _822 = _704 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _774 * _472;
    float _828 = fma(_774, _470, _806);
    float _830 = fma(_814, _814, _816);
    float _832 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _834 = -_826;
    float _836 = fma(_754, _470, _834);
    float _838 = fma(_804, _804, _830);
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _842 = _798 * _840;
    float _844 = _770 * _718;
    float _846 = _820 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _848 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _850 = _842 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _852 = rsqrt(_838);
    bool _854 = _842 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _856 = _824 * _468;
    float _858 = -_796;
    float _860 = fma(_828, _824, _858);
    bool _862 = !_850;
    int _864 = _862 ? 0 : 1;
    float _866 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[127].x, _846);
    float _868 = fma(_828, _736, _856);
    float _870 = _820 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _872 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[127].z, _866);
    float _874 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _876 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[126].x, _870);
    int _878 = 2;
    if (!_850)
    {
        _878 = 1;
    }
    int _880 = _878;
    float _882 = _872 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _884 = _880;
    if (!_854)
    {
        _884 = _864;
    }
    int _886 = _884;
    float _888 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[126].z, _876);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _836);
    float _892 = _814 * _852;
    int _894 = _886 << 6;
    float _896 = _888 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _898 = _832 * _890;
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    float _902 = _794 * _852;
    float _904 = _804 * _852;
    float _906 = trunc(_896);
    int _908 = int(_906);
    float _910 = _848 * _900;
    int _912 = _894 + 48;
    uint _915 = uint(int(uint(_912) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.vp_c15)._m0[int(_925)][_927];
    float _931 = in.m_71.x;
    float _933 = _898 * _568;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _937 = _554 * _902;
    float _939 = _898 * _554;
    float _941 = trunc(_882);
    int _943 = int(_941);
    float _945 = _550 * _904;
    int _947 = _894 + 96;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    float _965 = fma(_910, _904, _933);
    float _967 = _874 * _935;
    float _969 = -_937;
    float _971 = fma(_550, _892, _969);
    float _973 = fma(_910, _892, _939);
    float _975 = -_945;
    float _977 = fma(_568, _902, _975);
    int _979 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _981 = _908 + _979;
    int _983 = _981 + 1;
    float _985 = fma(_967, _971, _965);
    int _987 = _894 + 104;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    float _1005 = fma(_967, _977, _973);
    float _1007 = _370 + _985;
    bool _1009 = _983 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1011 = _368 + _1005;
    int _1013 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1015 = _943 + _1013;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1007 + _1019;
    int _1023 = _894 + 64;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1043 = _1011 + _1041;
    int _1045 = _983 | _1017;
    float _1047 = _1021 * _1021;
    float _1049 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1007);
    float _1051 = _898 * _550;
    bool _1053 = _1045 < 0;
    bool _1055 = _1053 || _1009;
    float _1057 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1011);
    int _1059 = _894 + 56;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    float _1077 = fma(_931, 100.0, _1049);
    bool _1079 = _1017 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1081 = _1079 || _1055;
    float _1083 = fma(_931, 100.0, _1057);
    float _1085 = fma(_1043, _1043, _1047);
    float _1087 = _1077 * 2.0;
    float _1089 = fma(_910, _902, _1051);
    float _1091 = _1083 * 2.0;
    int _1093 = _894 + 72;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    float _1111 = sqrt(_1085);
    float _1113 = _1087 * 0.15915493667125701904296875;
    float _1115 = _1091 * 0.15915493667125701904296875;
    float _1117 = _568 * _892;
    bool _1119 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1121 = isnan(0.5);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1127 = _1123 || _1125;
    int _1129 = _983;
    float _1131 = _1011;
    float _1133 = _1007;
    float _1135 = _1043;
    float _1137 = _896;
    if (!_1081)
    {
        int _1139 = _1017 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1141 = _1139 + _983;
        _1129 = _1141;
    }
    int _1143 = _1129;
    int _1145 = _894 + 80;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.vp_c15)._m0[int(_1157)][_1159];
    float _1163 = _1115 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = _820 * _929;
    float _1169 = -_1117;
    float _1171 = fma(_554, _904, _1169);
    float _1173 = fma(_368, _921, _1167);
    float _1175 = fma(_967, _1171, _1089);
    float _1177 = _820 * _963;
    bool _1179 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1181 = _1113 * 6.283185482025146484375;
    float _1183 = cos(_1181);
    int _1185 = as_type<int>(_921);
    int _1187 = as_type<int>(_1175);
    float _1189 = as_type<float>(_1143);
    if (!_1081)
    {
        int _1191 = _1143 << 2;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = fma(_368, _955, _1177);
    float _1197 = fma(_370, _995, _1195);
    float _1199 = _967;
    int _1201 = as_type<int>(_1197);
    if (!_1081)
    {
        float _1203 = floor(_896);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = _1197 + _1003;
    if (!_1081)
    {
        uint _1209 = uint(int(uint(_1143) >> uint(2)));
        _1201 = int(_1209);
    }
    int _1211 = _1201;
    float _1213 = _820 * _1039;
    float _1215 = fma(_368, _1031, _1213);
    float _1217 = _632 + _1175;
    int _1219 = as_type<int>(_1215);
    float _1221 = as_type<float>(_1211);
    if (!_1081)
    {
        int _1223 = 12 & _1193;
        _1187 = _1223;
    }
    int _1225 = _1187;
    float _1227 = fma(_370, _1067, _1173);
    float _1229 = fma(_1165, 0.100000001490116119384765625, _1217);
    float _1231 = 1.0 / _1207;
    float _1233 = _1227 + _1075;
    float _1235 = fma(_1183, 0.100000001490116119384765625, _1229);
    float _1237 = fma(_370, _1101, _1215);
    float _1239 = _1183;
    float _1241 = _1101;
    float _1243 = _1109;
    if (!_1081)
    {
        int _1245 = _1211 << 4;
        int _1247 = _1245 + _1225;
        _1219 = _1247;
    }
    int _1249 = _1219;
    if (!_1179)
    {
        _1221 = _1235;
    }
    float _1251 = _1221;
    float _1253 = _1237 + _1109;
    bool _1255 = !_1179;
    float _1257 = _1251;
    float _1259 = _1205;
    if (!_1255)
    {
        float _1261 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1265 = _1111 + _1263;
        float _1267 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = rsqrt(_1085);
        float _1271 = _1265 * _1261;
        float _1273 = _1271 * 0.15915493667125701904296875;
        float _1275 = _1273 * 6.283185482025146484375;
        float _1277 = cos(_1275);
        float _1279 = _1273 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        float _1283 = _1277 + (-1.0);
        float _1285 = _1283 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1287 = fma(_1281, _1267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = fma(_1235, _1277, _1285);
        float _1291 = _1269 * _1287;
        float _1293 = fma(_1043, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = fma(_1021, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1131 = _1293;
        _1133 = _1295;
        _1257 = _1289;
        _1239 = _1281;
    }
    float _1297 = _1131;
    float _1299 = _1133;
    float _1301 = _1257;
    float _1303 = _1239;
    float _1305 = _1303;
    float _1307 = _1301;
    if (_1127)
    {
        _1135 = _1297;
    }
    float _1309 = _1135;
    float _1311 = _1309;
    if (_1127)
    {
        _1305 = _1299;
    }
    float _1313 = _1305;
    float _1315 = _1313;
    if (!_1127)
    {
        float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1319 = _632 + _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1323 = _368 + _1321;
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = -_370;
        float _1329 = _1327 + _1299;
        float _1331 = _1319 * _1319;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _370 + _1333;
        float _1337 = fma(_1323, _1323, _1331);
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1341 = fma(_1335, _1335, _1337);
        float _1343 = sqrt(_1341);
        float _1345 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = precise::min(_1343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1349 = _1347 * _1339;
        float _1351 = -_632;
        float _1353 = _1351 + _1301;
        float _1355 = _1345 * _1349;
        float _1357 = -_368;
        float _1359 = _1357 + _1297;
        float _1361 = fma(_1353, _1355, _632);
        float _1363 = fma(_1359, _1355, _368);
        float _1365 = fma(_1329, _1355, _370);
        _1307 = _1361;
        _1311 = _1363;
        _1241 = _1359;
        _1315 = _1365;
    }
    float _1367 = _1307;
    float _1369 = _1311;
    float _1371 = _1241;
    float _1373 = _1315;
    int _1375 = _894 + 88;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    float _1393 = _1233 * _1231;
    float _1395 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1397 = _1253 * _1231;
    float _1399 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1401 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    bool _1405 = _1393 >= 0.0;
    float _1407 = _1371;
    if (!_1081)
    {
        int _1409 = _1249 + 400;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
        int _1415 = int(_1411) & 3;
        float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1399);
    float _1423 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1401);
    float _1425 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1403);
    float _1427 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1421);
    float _1431 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1423);
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1435 = _1393 <= 1.0;
    bool _1437 = _1435 && _1405;
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1443 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1445 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1447 = _1397 >= 0.0;
    bool _1449 = _1447 && _1437;
    float _1451 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1455 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1445);
    bool _1459 = _1397 <= 1.0;
    bool _1461 = _1459 && _1449;
    float _1463 = -_1453;
    float _1465 = fma(_1463, _1451, 1.0);
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1471 = _820 * _1161;
    float _1473 = _1235;
    float _1475 = _1453;
    if (!_1081)
    {
        float _1477 = floor(_882);
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1483 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1485 = fma(_368, _1153, _1471);
    float _1487 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1489 = log2(_1465);
    if (_1461)
    {
        float _1491 = float(_886);
        _1475 = _1491;
    }
    float _1493 = _1475;
    float _1495 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1481);
    float _1497 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1487);
    float _1499 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1501 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1503 = 1.0 / _1483;
    float _1505 = fma(_370, _1383, _1485);
    if (!_1081)
    {
        float _1507 = -_1479;
        float _1509 = _882 + _1507;
        _1243 = _1509;
    }
    float _1511 = _1243;
    float _1513 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1515 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1517 = _1505 + _1391;
    float _1519 = _1481;
    if (_1461)
    {
        float _1521 = rint(_1493);
        float _1523 = precise::max(_1521, 0.0);
        uint _1525 = uint(_1523);
        uint _1527 = clamp(_1525, 0u, 65535u);
        _1519 = as_type<float>(_1527);
    }
    float _1529 = _1519;
    float _1531 = _1517 * _1231;
    float _1533 = _1489 * 0.693147182464599609375;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = _1517;
    if (!_1081)
    {
        float _1539 = rint(_1419);
        float _1541 = precise::max(_1539, 0.0);
        uint _1543 = uint(_1541);
        uint _1545 = clamp(_1543, 0u, 65535u);
        _1537 = as_type<float>(_1545);
    }
    float _1547 = _1537;
    float _1549 = _1513 * _1503;
    float _1551 = _1515 * _1503;
    float _1553 = fma(_1549, 0.5, 0.5);
    float _1555 = fma(_1551, -0.5, 0.5);
    float _1557 = _1549;
    if (!_1081)
    {
        float _1559 = -_1205;
        float _1561 = _896 + _1559;
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1397;
    if (_1461)
    {
        float3 _4897 = float3(_1393, _1397, float(as_type<int>(_1529)));
        float3 _4901 = select(_4897, float3(0.0), isnan(_4897));
        float _1567 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4901.xy, uint(rint(_4901.z)), _1531, level(0.0));
        _1565 = _1567;
    }
    float _1569 = _1565;
    float3 _4911 = float3(_1553, _1555, _1535);
    float _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4911, float3(0.0), isnan(_4911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4911, float3(0.0), isnan(_4911)), level(0.0)).x;
    float3 _4920 = float3(_1553, _1555, _1535);
    float4 _1574 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4920, float3(0.0), isnan(_4920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4920, float3(0.0), isnan(_4920)), level(0.0)).xyzw;
    float _1576 = _1574.x;
    float _1578 = _1574.y;
    float _1580 = _1574.z;
    float _1582 = _1574.w;
    float _1584 = _1511;
    if (!_1081)
    {
        float3 _4943 = float3(_1563, _1511, float(as_type<int>(_1547)));
        float3 _4945 = select(_4943, float3(0.0), isnan(_4943));
        float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4945.xy, uint(rint(_4945.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4945.xy, uint(rint(_4945.z)), level(0.0)).x;
        _1584 = _1586;
    }
    float _1588 = _1584;
    if (_1081)
    {
        _1259 = 1.0;
    }
    float _1590 = _1259;
    float _1592 = _1590;
    if (!_1081)
    {
        int _1594 = _1143 << 4;
        int _1596 = _1594 + 2048;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
        int _1602 = int(_1598) & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        int _1606 = int(_1598) + 1;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        int _1610 = _1606 & 3;
        float _1612 = (*spvDescriptorSet0.vp_c15)._m0[int(_1608)][_1610];
        int _1614 = _1596 + 8;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        uint _1618 = uint(int(uint(int(_1616)) >> uint(2)));
        int _1620 = int(_1616) & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        int _1624 = int(_1616) + 1;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        int _1628 = _1624 & 3;
        float _1630 = (*spvDescriptorSet0.vp_c15)._m0[int(_1626)][_1628];
        float _1632 = _820 * _1612;
        float _1634 = fma(_368, _1604, _1632);
        float _1636 = fma(_370, _1622, _1634);
        float _1638 = _1636 + _1630;
        float _1640 = precise::clamp(_1638, 0.0, 1.0);
        float _1642 = -_1640;
        float _1644 = _1642 + _1588;
        float _1646 = fma(_1644, 500.0, 1.5);
        float _1648 = exp2(_1646);
        float _1650 = 0.0 + _1648;
        float _1652 = precise::clamp(_1650, 0.0, 1.0);
        _1189 = as_type<float>(_1596);
        _1592 = _1652;
    }
    float _1654 = _1189;
    float _1656 = _1592;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1660 = _1367 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1369 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1668 = _1373 + _1666;
    float _1670 = _1660 * _1660;
    float _1672 = fma(_1664, _1664, _1670);
    float _1674 = fma(_1668, _1668, _1672);
    float _1676 = rsqrt(_1674);
    float _1678 = sqrt(_1674);
    float _1680 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1682 = _1664 * _1680;
    float _1684 = _1668 * _1680;
    float _1686 = _1682 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 + _1688;
    float _1692 = sqrt(_1690);
    bool _1694 = _1692 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = _1692 + _1696;
    float _1700 = _1555;
    float _1702 = _1690;
    float _1704 = _1698;
    float _1706 = _1682;
    float _1708 = _1684;
    float _1710 = _1686;
    float _1712 = _1688;
    if (_1694)
    {
        float _1714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1714;
    }
    float _1716 = _1700;
    if (_1694)
    {
        float _1718 = rsqrt(_1690);
        _1702 = _1718;
    }
    float _1720 = _1702;
    if (_1694)
    {
        float _1722 = _1698 * _1716;
        _1704 = _1722;
    }
    float _1724 = _1704;
    if (_1694)
    {
        float _1726 = _1724 * 0.15915493667125701904296875;
        _1137 = _1726;
    }
    float _1728 = _1137;
    float _1730 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1732 = _1654;
    if (_1694)
    {
        float _1734 = _1728 * 6.283185482025146484375;
        float _1736 = sin(_1734);
        _1732 = _1736;
    }
    float _1738 = _1732;
    float _1740 = precise::max(0.0, _1730);
    float _1742 = _1724;
    float _1744 = _1740;
    if (_1694)
    {
        float _1746 = _1728 * 6.283185482025146484375;
        float _1748 = cos(_1746);
        _1742 = _1748;
    }
    float _1750 = _1742;
    float _1752 = -_1680;
    float _1754 = -_1740;
    float _1756 = fma(_1660, _1752, _1754);
    float _1758 = _1756;
    if (_1694)
    {
        float _1760 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1760;
    }
    float _1762 = _1744;
    float _1764 = _1738;
    float _1766 = _1762;
    if (_1694)
    {
        float _1768 = fma(_1738, _1762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1764 = _1768;
    }
    float _1770 = _1764;
    float _1772 = _1770;
    if (_1694)
    {
        float _1774 = _1720 * _1770;
        _1772 = _1774;
    }
    float _1776 = _1772;
    if (_1694)
    {
        float _1778 = _1750 + (-1.0);
        _1766 = _1778;
    }
    float _1780 = _1766;
    float _1782 = _1780;
    if (_1694)
    {
        float _1784 = _1682 * _1776;
        _1706 = _1784;
    }
    float _1786 = _1706;
    if (_1694)
    {
        float _1788 = _1684 * _1776;
        _1708 = _1788;
    }
    float _1790 = _1708;
    if (_1694)
    {
        float _1792 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1792;
    }
    float _1794 = _1782;
    if (_1694)
    {
        float _1796 = _1786 * _1786;
        _1710 = _1796;
    }
    float _1798 = _1710;
    if (_1694)
    {
        float _1800 = _1790 * _1790;
        _1712 = _1800;
    }
    float _1802 = _1712;
    if (_1694)
    {
        float _1804 = fma(_1756, _1750, _1794);
        _1758 = _1804;
    }
    float _1806 = _1758;
    float _1808 = fma(_1806, _1806, _1798);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1812 = fma(_1678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1810);
    float _1814 = precise::clamp(_1812, 0.0, 1.0);
    float _1816 = _1808 + _1802;
    float _1818 = -_1814;
    float _1820 = _1818 + 1.0;
    float _1822 = rsqrt(_1816);
    float _1824 = abs(_1820);
    float _1826 = log2(_1824);
    float _1828 = _1822 * _1786;
    float _1830 = _1822 * _1806;
    float _1832 = _1822 * _1790;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1836 = -_1834;
    float _1838 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1836);
    float _1840 = -_1832;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1838);
    float _1844 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1846 = fma(_1842, -0.5, 0.5);
    float _1848 = exp2(_1844);
    float _1850 = fma(_1842, 0.5, 0.5);
    float _1852 = fma(_1850, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = sqrt(_1846);
    float _1856 = fma(_1850, _1852, -0.212114393711090087890625);
    float _1858 = _1830 + 1.0;
    float _1860 = fma(_1850, _1856, 1.570728778839111328125);
    float _1862 = -_1830;
    float _1864 = fma(_1848, _1858, _1862);
    float _1866 = fma(_1864, 0.5, 0.5);
    float _1868 = _1854 * 0.636619746685028076171875;
    float _1870 = -_1860;
    float _1872 = fma(_1868, _1870, 1.0);
    float2 _5387 = float2(_1872, _1866);
    float3 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5387, float2(0.0), isnan(_5387)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5387, float2(0.0), isnan(_5387)), level(0.0)).xyz;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1886 = in.m_71.y;
    float _1888 = abs(_842);
    float _1890 = log2(_1888);
    float _1892 = _1884 * _931;
    float _1894 = in.m_79.x;
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1898 = _1896 != 0;
    float _1900 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1904 = _1902 != 0;
    float _1906 = in.m_79.y;
    float _1908 = trunc(_1892);
    int _1910 = int(_1908);
    bool _1912 = _931 > 0.5;
    bool _1914 = _1912 && _1898;
    float _1916 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1918 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1900);
    float _1920 = -_388;
    float _1922 = _1920 + 1.0;
    bool _1924 = _842 <= 8000.0;
    bool _1926 = isnan(_842);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(8000.0);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1938 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1918);
    bool _1940 = _1886 > 0.5;
    int _1942 = _1910 << 4;
    int _1944 = _1942 + 1712;
    float _1946 = exp2(_1916);
    float _1948 = _1886;
    float _1950 = _1894;
    float _1952 = _1934;
    if (_1898)
    {
        _1948 = _1894;
    }
    float _1954 = _1948;
    uint _1956 = uint(int(uint(_1944) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = -_1906;
    float _1974 = _1972 + 1.0;
    float _1976 = _1954;
    float _1978 = _1906;
    if (_1914)
    {
        float _1980 = -_1954;
        float _1982 = _1980 + 1.0;
        _1976 = _1982;
    }
    float _1984 = _1976;
    float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1988 = _1944 + 8;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    if (_1904)
    {
        float _1998 = _1940 ? _1974 : _1906;
        _1978 = _1998;
    }
    float _2000 = _1978;
    if (_1898)
    {
        _1950 = _1984;
    }
    float _2002 = _1950;
    float _2004 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2006 = _836 != 0.0;
    bool _2008 = isnan(_836);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.0);
    bool _2014 = _2010 || _2012;
    float _2016 = -_1946;
    float _2018 = _2016 + 1.0;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2024 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2026 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2028 = _2004 * _1986;
    float _2030 = _2024 * _1936;
    bool _2032 = _868 == 0.0;
    bool _2034 = !_2014;
    bool _2036 = _2032 && _2034;
    float _2038 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2040 = exp2(_2026);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2044 = _860 == 0.0;
    bool _2046 = _2044 && _2036;
    float _2048 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_81.x = _2030;
    out.m_81.y = _2028;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_83.x = _2050;
    out.m_83.y = _2038;
    out.m_83.z = _2048;
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _1962 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2060 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2062 = fma(_2056, -2.0, 3.0);
    float _2064 = in.m_85.x;
    float _2066 = in.m_85.y;
    float _2068 = in.m_85.z;
    float _2070 = _2056 * _2056;
    float _2072 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2070 * _2062;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _2074;
    out.m_87.y = _2076;
    out.m_87.z = _2080;
    out.m_87.w = _2052;
    float _2082 = _774 * _2068;
    float _2084 = _754 * _2068;
    float _2086 = -_2082;
    float _2088 = fma(_754, _2066, _2086);
    float _2090 = fma(_774, _2066, _2084);
    float _2092 = _736 * _2088;
    float _2094 = _824 * _2088;
    float _2096 = _2090;
    if (!_2046)
    {
        float _2098 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2090);
        _2096 = _2098;
    }
    float _2100 = _2096;
    float _2102 = -_2092;
    float _2104 = fma(_824, _2064, _2102);
    float _2106 = fma(_736, _2064, _2094);
    float _2108 = in.m_73.w;
    float _2110 = _2104;
    float _2112 = _2106;
    if (!_2046)
    {
        float _2114 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2104);
        _2110 = _2114;
    }
    float _2116 = _2110;
    if (!_2046)
    {
        float _2118 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2106);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = _550 * _2120;
    float _2124 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1938);
    float _2126 = -_2078;
    float _2128 = _2126 + 1.0;
    float _2130 = _554 * _2120;
    float _2132 = _568 * _2120;
    float _2134 = fma(_902, _2116, _2122);
    float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2078);
    float _2138 = fma(_892, _2116, _2130);
    float _2140 = fma(_904, _2116, _2132);
    float _2142 = _2124 + _1483;
    float _2144 = _1934 * _2136;
    if (!_1461)
    {
        _1952 = 1.0;
    }
    float _2146 = _1952;
    float _2148 = fma(_977, _2100, _2138);
    float _2150 = _2146;
    if (_1461)
    {
        bool _2152 = _1569 >= _1531;
        bool _2154 = isnan(_1569);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan(_1531);
        bool _2160 = _2156 || _2158;
        float _2162 = float(_2160);
        _2150 = _2162;
    }
    float _2164 = _2150;
    float _2166 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2168 = fma(_1171, _2100, _2134);
    float _2170 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2172 = fma(_971, _2100, _2140);
    float _2174 = _1922 * _2166;
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = _2142 * 0.5;
    float _2180 = _2164 * _1656;
    float _2182 = _2170 * _1571;
    float _2184 = -_2176;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_89.z = _2178;
    out.m_89.w = _1483;
    float _2188 = -_2170;
    float _2190 = _2188 + 1.0;
    bool _2192 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2194 = isnan(_1678);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2200 = _2196 || _2198;
    float _2202 = -_2180;
    float _2204 = fma(_2202, _2186, 1.0);
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _2124;
    out.gl_Position.w = _1483;
    float _2208 = _1582 * _2190;
    float _2210 = _2206 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _2148;
    out.m_91.y = _2168;
    out.m_91.z = _2172;
    float _2212 = _1582 * _2182;
    out.m_93.x = _2210;
    float _2214 = _1483;
    float _2216 = _2186;
    float _2218 = _2206;
    float _2220 = _2190;
    float _2222 = _2212;
    if (!_2200)
    {
        _2214 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _2214;
    out.m_95.w = _2108;
    float _2226 = _2108;
    float _2228 = _2224;
    float _2230 = _2224;
    if (!_2200)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2232 = _2216;
    float _2234 = _2232;
    float _2236 = _2232;
    if (!_2200)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2238 = _2218;
    float _2240 = _2238;
    float _2242 = _2238;
    if (!_2200)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2244 = _2220;
    float _2246 = _2244;
    float _2248 = _2244;
    if (!_2200)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2250 = _2226;
    float _2252 = _1882 * _2182;
    float _2254 = fma(_1878, _2212, _1576);
    float _2256 = fma(_1880, _2212, _1578);
    float _2258 = _2250;
    float _2260 = _2250;
    if (!_2200)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2262 = _2222;
    float _2264 = fma(_1582, _2252, _1580);
    out.m_97.x = _2254;
    out.m_97.y = _2256;
    out.m_97.z = _2264;
    out.m_97.w = _2208;
    bool _2266 = !_2200;
    float _2268 = _2262;
    float _2270 = _2262;
    if (!_2266)
    {
        bool _2272 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2274 = isnan(_1678);
        bool _2276 = _2272 || _2274;
        bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2280 = _2276 || _2278;
        if (!_2280)
        {
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2284 = _1678 + _2282;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2286;
            float _2290 = 1.0 / _2288;
            float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2312 = _2284 * _2290;
            float _2314 = precise::clamp(_2312, 0.0, 1.0);
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2320 = fma(_2314, _2294, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2322 = fma(_2314, _2318, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2324 = fma(_2314, _2298, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2326 = fma(_2314, _2302, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2328 = fma(_2314, _2306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2330 = fma(_2314, _2310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2260 = _2320;
            _2242 = _2328;
            _2270 = _2322;
            _2236 = _2326;
            _2230 = _2324;
            _2248 = _2330;
            _2332 = true;
        }
        else
        {
            bool _2334 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2336 = isnan(_1678);
            bool _2338 = _2334 || _2336;
            bool _2340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2342 = _2338 || _2340;
            if (!_2342)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2344 = _2268;
            _2270 = _2344;
            if (!_2342)
            {
                _2258 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2346 = _2258;
            _2260 = _2346;
            if (!_2342)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2348 = _2228;
            _2230 = _2348;
            if (!_2342)
            {
                _2234 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2350 = _2234;
            _2236 = _2350;
            if (!_2342)
            {
                _2240 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2352 = _2240;
            _2242 = _2352;
            if (!_2342)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2354 = _2246;
            bool _2356 = !_2342;
            _2248 = _2354;
            if (!_2356)
            {
                bool _2358 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2360 = isnan(_1678);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2366 = _2362 || _2364;
                if (!_2366)
                {
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2370 = _1678 + _2368;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2372;
                    float _2376 = 1.0 / _2374;
                    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2398 = _2370 * _2376;
                    float _2400 = precise::clamp(_2398, 0.0, 1.0);
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2406 = fma(_2400, _2380, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2408 = fma(_2400, _2404, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2410 = fma(_2400, _2384, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2412 = fma(_2400, _2388, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2414 = fma(_2400, _2392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2416 = fma(_2400, _2396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2260 = _2406;
                    _2242 = _2414;
                    _2270 = _2408;
                    _2236 = _2412;
                    _2230 = _2410;
                    _2248 = _2416;
                    _2332 = true;
                }
                else
                {
                    _2260 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2242 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2236 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2332 = false;
    float _2418 = _2260;
    float _2420 = _2242;
    float _2422 = _2270;
    float _2424 = _2236;
    float _2426 = _2230;
    float _2428 = _2248;
    float _2430 = fma(_2168, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2418;
    float _2436 = _2434 + _2420;
    float _2438 = -_2422;
    float _2440 = _2438 + _2424;
    float _2442 = -_2426;
    float _2444 = _2442 + _2428;
    bool _2446 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2448 = fma(_2432, _2436, _2418);
    float _2450 = fma(_2432, _2440, _2422);
    float _2452 = fma(_2432, _2444, _2426);
    float _2454 = _2448 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2456 = fma(_2450, 0.298911988735198974609375, _2454);
    float _2458 = fma(_2452, 0.114477999508380889892578125, _2456);
    out.m_99.x = 0.0;
    float _2460 = -_2458;
    float _2462 = _2450 + _2460;
    float _2464 = -_2458;
    float _2466 = _2448 + _2464;
    float _2468 = -_2458;
    float _2470 = _2452 + _2468;
    float _2472 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2474 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    float _2478 = fma(_2470, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    out.m_93.w = _2472;
    out.m_101.x = _2474;
    out.m_101.y = _2476;
    out.m_101.z = _2478;
    if (!_2446)
    {
        return out;
    }
    float _2480 = -_1367;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2484 = -_1369;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2488 = -_1373;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2492 = _2482 * _2482;
    float _2494 = fma(_2486, _2486, _2492);
    float _2496 = fma(_2490, _2490, _2494);
    float _2498 = sqrt(_2496);
    float _2500 = rsqrt(_2496);
    float _2502 = -_2498;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2506 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2486 * _2500;
    float _2512 = _2482 * _2500;
    float _2514 = abs(_2508);
    float _2516 = log2(_2514);
    float _2518 = _2490 * _2500;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = _2168 * _2512;
    float _2524 = -_2512;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = fma(_2148, _2510, _2522);
    float _2532 = -_2518;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = fma(_2172, _2518, _2530);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2542 = _2534 + _2540;
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2546 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = exp2(_2544);
    float _2552 = _2550 * _2548;
    float _2554 = _2538 * _2552;
    float _2556 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2556;
    out.m_99.y = _2558;
    out.m_99.z = _2560;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2332 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_56.w;
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
        out.m_59.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    float _138 = as_type<float>(_136);
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2618 = as_type<float>(_136);
        out.gl_Position.z = _2618;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_61.w;
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
        out.m_59.x = 0.0;
    }
    int _170 = 0;
    if (_166)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2686 = as_type<float>(_174);
        out.gl_Position.z = _2686;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_63.y;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = in.m_63.z;
    float _182 = in.m_65.y;
    float _184 = in.m_65.z;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = _176 * _176;
    float _192 = in.m_65.x;
    float _194 = _180 * _180;
    float _196 = in.m_63.x;
    float _198 = fma(_182, _182, _190);
    float _200 = in.m_67.x;
    float _202 = fma(_184, _184, _194);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _202);
    float _208 = sqrt(_204);
    float _210 = in.m_69.x;
    float _212 = in.m_69.y;
    float _214 = in.m_69.z;
    float _216 = sqrt(_206);
    bool _218 = _208 > 0.0;
    bool _220 = _216 > 0.0;
    float _222 = _182 * _212;
    float _224 = _176 * _212;
    float _226 = _186 * _212;
    float _228 = 0.0;
    float _230 = _214;
    float _232 = _204;
    if (_218)
    {
        float _234 = rsqrt(_204);
        _228 = _234;
    }
    float _236 = _228;
    float _238 = fma(_210, _192, _222);
    float _240 = fma(_210, _196, _224);
    float _242 = fma(_210, _200, _226);
    float _244 = 0.0;
    float _246 = _238;
    float _248 = _242;
    if (!_218)
    {
        _244 = 0.0;
    }
    float _250 = _244;
    float _252 = fma(_184, _214, _238);
    float _254 = fma(_180, _214, _240);
    float _256 = fma(_188, _214, _242);
    float _258 = 0.0;
    float _260 = _250;
    if (_220)
    {
        float _262 = rsqrt(_206);
        _258 = _262;
    }
    float _264 = _258;
    if (!_220)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _266 = _230;
    float _268 = _232;
    float _270 = _266;
    float _272 = _268;
    if (!_218)
    {
        _246 = 0.0;
    }
    float _274 = _246;
    float _276 = _274;
    if (!_218)
    {
        _138 = 0.0;
    }
    float _278 = _138;
    float _280 = _278;
    if (!_220)
    {
        _248 = 0.0;
    }
    float _282 = _248;
    float _284 = _282;
    if (_218)
    {
        float _286 = _236 * _182;
        _276 = _286;
    }
    float _288 = _276;
    float _290 = _288;
    if (_218)
    {
        float _292 = _236 * _176;
        _260 = _292;
    }
    float _294 = _260;
    float _296 = _294;
    if (_218)
    {
        float _298 = _236 * _186;
        _280 = _298;
    }
    float _300 = _280;
    float _302 = _300;
    if (_220)
    {
        float _304 = _264 * _184;
        _270 = _304;
    }
    float _306 = _270;
    if (_220)
    {
        float _308 = _264 * _180;
        _284 = _308;
    }
    float _310 = _284;
    if (_220)
    {
        float _312 = _264 * _188;
        _272 = _312;
    }
    float _314 = _272;
    bool _316 = !_178;
    float _334;
    if (!_316)
    {
        float _318 = in.m_71.x;
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
    float _346 = in.m_56.x;
    float _348 = in.m_56.y;
    float _350 = in.m_56.z;
    float _352 = in.m_65.w;
    float _354 = in.m_67.w;
    float _356 = _182 * _348;
    float _358 = _186 * _348;
    float _360 = fma(_192, _346, _356);
    float _362 = fma(_200, _346, _358);
    float _364 = fma(_184, _350, _360);
    float _366 = fma(_188, _350, _362);
    float _368 = _364 + _352;
    float _370 = _366 + _354;
    float _372 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _374 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _376 = floor(_372);
    float _378 = floor(_374);
    float _380 = -_376;
    float _382 = _372 + _380;
    float _384 = -_378;
    float _386 = _374 + _384;
    float2 _2995 = float2(_382, _386);
    float _388 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2995, float2(0.0), isnan(_2995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2995, float2(0.0), isnan(_2995)), level(0.0)).x;
    float _390 = _176 * _348;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _394 = _344 + _392;
    float _396 = _154 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = fma(_196, _346, _390);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _410 = _344 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = 1.0 / _404;
    float _418 = fma(_180, _350, _406);
    float _420 = _254 * _254;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _424 = _344 + _422;
    float _426 = in.m_63.w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = 1.0 / _400;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _434;
    float _438 = fma(_252, _252, _420);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = in.m_73.y;
    float _450 = fma(_256, _256, _438);
    float _452 = _394 * _416;
    float _454 = 1.0 / _414;
    float _456 = in.m_73.z;
    float _458 = fma(_442, _452, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _460 = fma(_446, _452, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = _410 * _432;
    float _468 = in.m_75.x;
    float _470 = in.m_75.y;
    float _472 = in.m_75.z;
    float _474 = rsqrt(_450);
    float _476 = fma(_430, _466, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = _424 * _454;
    bool _492 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_344);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = _396 * 0.15915493667125701904296875;
    float _506 = fma(_484, _452, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _508 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_344);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_436, _466, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _522 = _504 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = -_502;
    float _528 = _526 + 1.0;
    float _530 = fma(_480, _466, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _532 = fma(_464, _490, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = _518 * _528;
    float _536 = -_518;
    float _538 = _536 + 1.0;
    float _540 = fma(_488, _490, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _542 = _504 * 6.283185482025146484375;
    float _544 = sin(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _546;
    float _550 = _254 * _474;
    bool _552 = _468 > 0.0;
    float _554 = _252 * _474;
    bool _556 = _468 >= 0.0;
    bool _558 = isnan(_468);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = fma(_548, _490, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _568 = _256 * _474;
    int _570 = _564 ? 0 : 1;
    bool _572 = _524 >= 0.0;
    bool _574 = isnan(_524);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    int _582 = ~_570;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    int _588 = _586;
    if (!_552)
    {
        int _590 = ~_570;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    bool _596 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _598 = isnan(_344);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    bool _608 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _610 = isnan(_344);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = _524 > 0.0;
    float _622 = _606 * _538;
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = float(_594);
    float _630 = _618 * _626;
    float _632 = _418 + _426;
    float _634 = -_618;
    float _636 = _634 + 1.0;
    float _638 = _530 * _630;
    float _640 = _632 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _642 = _476 * _630;
    float _644 = _520 * _630;
    float _646 = _544 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    int _648 = _580 ? 0 : 1;
    float _650 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[11].x, _640);
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].y, _644);
    float _654 = _646 * _628;
    int _656 = ~_648;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_370, (*spvDescriptorSet0.vp_c8)._m0[11].z, _650);
    int _664 = _660;
    if (!_620)
    {
        int _666 = ~_648;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = _654 * _448;
    float _674 = _524 * _524;
    float _676 = _662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _678 = float(_670);
    float _680 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].z, _638);
    float _682 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[143].x, _642);
    float _684 = _632 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _686 = 1.0 / _676;
    float _688 = _674 * _678;
    float _690 = fma(_458, _622, _682);
    float _692 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    float _694 = _550 * _294;
    float _696 = _672 * 0.01745329238474369049072265625;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _700 = fma(_370, (*spvDescriptorSet0.vp_c8)._m0[10].z, _692);
    float _702 = fma(_554, _288, _694);
    float _704 = _696 * 0.15915493667125701904296875;
    float _706 = fma(_460, _622, _652);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _710 = fma(_568, _300, _702);
    float _712 = _698 * _456;
    float _714 = in.m_77.x;
    float _716 = in.m_77.y;
    float _718 = in.m_77.z;
    float _720 = _708 + _676;
    float _722 = fma(_540, _534, _706);
    float _724 = _712 * (-0.01745329238474369049072265625);
    float _726 = _720 * _686;
    float _728 = _726 * 0.5;
    float _730 = abs(_710);
    bool _732 = _730 > 0.99989998340606689453125;
    float _734 = _704 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _724 * 0.15915493667125701904296875;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[30].w, _740);
    float _744 = fma(_532, _534, _690);
    float _746 = fma(_506, _622, _680);
    float _748 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].y, _722);
    float _750 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].x, _744);
    float _752 = _738 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = fma(_566, _534, _746);
    if (_732)
    {
        float _758 = fma(_306, 0.001000000047497451305389404296875, _288);
        _290 = _758;
    }
    float _760 = _290;
    if (_732)
    {
        float _762 = fma(_310, 0.001000000047497451305389404296875, _294);
        _296 = _762;
    }
    float _764 = _296;
    if (_732)
    {
        float _766 = fma(_314, 0.001000000047497451305389404296875, _300);
        _302 = _766;
    }
    float _768 = _302;
    float _770 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[146].z, _756);
    float _772 = _738 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _750 * _714;
    float _778 = -_760;
    float _780 = _568 * _778;
    float _782 = -_764;
    float _784 = _554 * _782;
    float _786 = -_768;
    float _788 = _550 * _786;
    float _790 = -_768;
    float _792 = -_780;
    float _794 = fma(_554, _790, _792);
    float _796 = _736 * _468;
    float _798 = 1.0 / _742;
    float _800 = -_760;
    float _802 = -_784;
    float _804 = fma(_550, _800, _802);
    float _806 = _754 * _472;
    float _808 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _810 = -_764;
    float _812 = -_788;
    float _814 = fma(_568, _810, _812);
    float _816 = _794 * _794;
    float _818 = _748 * _716;
    float _820 = _632 + _808;
    float _822 = _704 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _774 * _472;
    float _828 = fma(_774, _470, _806);
    float _830 = fma(_814, _814, _816);
    float _832 = _818 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _834 = -_826;
    float _836 = fma(_754, _470, _834);
    float _838 = fma(_804, _804, _830);
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _842 = _798 * _840;
    float _844 = _770 * _718;
    float _846 = _820 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _848 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _850 = _842 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _852 = rsqrt(_838);
    bool _854 = _842 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _856 = _824 * _468;
    float _858 = -_796;
    float _860 = fma(_828, _824, _858);
    bool _862 = !_850;
    int _864 = _862 ? 0 : 1;
    float _866 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[127].x, _846);
    float _868 = fma(_828, _736, _856);
    float _870 = _820 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _872 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[127].z, _866);
    float _874 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _876 = fma(_368, (*spvDescriptorSet0.vp_c15)._m0[126].x, _870);
    int _878 = 2;
    if (!_850)
    {
        _878 = 1;
    }
    int _880 = _878;
    float _882 = _872 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _884 = _880;
    if (!_854)
    {
        _884 = _864;
    }
    int _886 = _884;
    float _888 = fma(_370, (*spvDescriptorSet0.vp_c15)._m0[126].z, _876);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _836);
    float _892 = _814 * _852;
    int _894 = _886 << 6;
    float _896 = _888 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _898 = _832 * _890;
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _868);
    float _902 = _794 * _852;
    float _904 = _804 * _852;
    float _906 = trunc(_896);
    int _908 = int(_906);
    float _910 = _848 * _900;
    int _912 = _894 + 48;
    uint _915 = uint(int(uint(_912) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.vp_c15)._m0[int(_925)][_927];
    float _931 = in.m_71.x;
    float _933 = _898 * _568;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _937 = _554 * _902;
    float _939 = _898 * _554;
    float _941 = trunc(_882);
    int _943 = int(_941);
    float _945 = _550 * _904;
    int _947 = _894 + 96;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    uint _951 = uint(int(uint(int(_949)) >> uint(2)));
    int _953 = int(_949) & 3;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[int(_951)][_953];
    int _957 = int(_949) + 1;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    int _961 = _957 & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    float _965 = fma(_910, _904, _933);
    float _967 = _874 * _935;
    float _969 = -_937;
    float _971 = fma(_550, _892, _969);
    float _973 = fma(_910, _892, _939);
    float _975 = -_945;
    float _977 = fma(_568, _902, _975);
    int _979 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _981 = _908 + _979;
    int _983 = _981 + 1;
    float _985 = fma(_967, _971, _965);
    int _987 = _894 + 104;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.vp_c15)._m0[int(_999)][_1001];
    float _1005 = fma(_967, _977, _973);
    float _1007 = _370 + _985;
    bool _1009 = _983 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1011 = _368 + _1005;
    int _1013 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1015 = _943 + _1013;
    int _1017 = _1015 + 1;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1007 + _1019;
    int _1023 = _894 + 64;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1043 = _1011 + _1041;
    int _1045 = _983 | _1017;
    float _1047 = _1021 * _1021;
    float _1049 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1007);
    float _1051 = _898 * _550;
    bool _1053 = _1045 < 0;
    bool _1055 = _1053 || _1009;
    float _1057 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.07500000298023223876953125, _1011);
    int _1059 = _894 + 56;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    float _1077 = fma(_931, 100.0, _1049);
    bool _1079 = _1017 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1081 = _1079 || _1055;
    float _1083 = fma(_931, 100.0, _1057);
    float _1085 = fma(_1043, _1043, _1047);
    float _1087 = _1077 * 2.0;
    float _1089 = fma(_910, _902, _1051);
    float _1091 = _1083 * 2.0;
    int _1093 = _894 + 72;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    float _1111 = sqrt(_1085);
    float _1113 = _1087 * 0.15915493667125701904296875;
    float _1115 = _1091 * 0.15915493667125701904296875;
    float _1117 = _568 * _892;
    bool _1119 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1121 = isnan(0.5);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1127 = _1123 || _1125;
    int _1129 = _983;
    float _1131 = _1011;
    float _1133 = _1007;
    float _1135 = _1043;
    float _1137 = _896;
    if (!_1081)
    {
        int _1139 = _1017 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1141 = _1139 + _983;
        _1129 = _1141;
    }
    int _1143 = _1129;
    int _1145 = _894 + 80;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.vp_c15)._m0[int(_1157)][_1159];
    float _1163 = _1115 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = _820 * _929;
    float _1169 = -_1117;
    float _1171 = fma(_554, _904, _1169);
    float _1173 = fma(_368, _921, _1167);
    float _1175 = fma(_967, _1171, _1089);
    float _1177 = _820 * _963;
    bool _1179 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1181 = _1113 * 6.283185482025146484375;
    float _1183 = cos(_1181);
    int _1185 = as_type<int>(_921);
    int _1187 = as_type<int>(_1175);
    float _1189 = as_type<float>(_1143);
    if (!_1081)
    {
        int _1191 = _1143 << 2;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = fma(_368, _955, _1177);
    float _1197 = fma(_370, _995, _1195);
    float _1199 = _967;
    int _1201 = as_type<int>(_1197);
    if (!_1081)
    {
        float _1203 = floor(_896);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = _1197 + _1003;
    if (!_1081)
    {
        uint _1209 = uint(int(uint(_1143) >> uint(2)));
        _1201 = int(_1209);
    }
    int _1211 = _1201;
    float _1213 = _820 * _1039;
    float _1215 = fma(_368, _1031, _1213);
    float _1217 = _632 + _1175;
    int _1219 = as_type<int>(_1215);
    float _1221 = as_type<float>(_1211);
    if (!_1081)
    {
        int _1223 = 12 & _1193;
        _1187 = _1223;
    }
    int _1225 = _1187;
    float _1227 = fma(_370, _1067, _1173);
    float _1229 = fma(_1165, 0.100000001490116119384765625, _1217);
    float _1231 = 1.0 / _1207;
    float _1233 = _1227 + _1075;
    float _1235 = fma(_1183, 0.100000001490116119384765625, _1229);
    float _1237 = fma(_370, _1101, _1215);
    float _1239 = _1183;
    float _1241 = _1101;
    float _1243 = _1109;
    if (!_1081)
    {
        int _1245 = _1211 << 4;
        int _1247 = _1245 + _1225;
        _1219 = _1247;
    }
    int _1249 = _1219;
    if (!_1179)
    {
        _1221 = _1235;
    }
    float _1251 = _1221;
    float _1253 = _1237 + _1109;
    bool _1255 = !_1179;
    float _1257 = _1251;
    float _1259 = _1205;
    if (!_1255)
    {
        float _1261 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1265 = _1111 + _1263;
        float _1267 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = rsqrt(_1085);
        float _1271 = _1265 * _1261;
        float _1273 = _1271 * 0.15915493667125701904296875;
        float _1275 = _1273 * 6.283185482025146484375;
        float _1277 = cos(_1275);
        float _1279 = _1273 * 6.283185482025146484375;
        float _1281 = sin(_1279);
        float _1283 = _1277 + (-1.0);
        float _1285 = _1283 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1287 = fma(_1281, _1267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1289 = fma(_1235, _1277, _1285);
        float _1291 = _1269 * _1287;
        float _1293 = fma(_1043, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1295 = fma(_1021, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1131 = _1293;
        _1133 = _1295;
        _1257 = _1289;
        _1239 = _1281;
    }
    float _1297 = _1131;
    float _1299 = _1133;
    float _1301 = _1257;
    float _1303 = _1239;
    float _1305 = _1303;
    float _1307 = _1301;
    if (_1127)
    {
        _1135 = _1297;
    }
    float _1309 = _1135;
    float _1311 = _1309;
    if (_1127)
    {
        _1305 = _1299;
    }
    float _1313 = _1305;
    float _1315 = _1313;
    if (!_1127)
    {
        float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1319 = _632 + _1317;
        float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1323 = _368 + _1321;
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = -_370;
        float _1329 = _1327 + _1299;
        float _1331 = _1319 * _1319;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1335 = _370 + _1333;
        float _1337 = fma(_1323, _1323, _1331);
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1341 = fma(_1335, _1335, _1337);
        float _1343 = sqrt(_1341);
        float _1345 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = precise::min(_1343, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1349 = _1347 * _1339;
        float _1351 = -_632;
        float _1353 = _1351 + _1301;
        float _1355 = _1345 * _1349;
        float _1357 = -_368;
        float _1359 = _1357 + _1297;
        float _1361 = fma(_1353, _1355, _632);
        float _1363 = fma(_1359, _1355, _368);
        float _1365 = fma(_1329, _1355, _370);
        _1307 = _1361;
        _1311 = _1363;
        _1241 = _1359;
        _1315 = _1365;
    }
    float _1367 = _1307;
    float _1369 = _1311;
    float _1371 = _1241;
    float _1373 = _1315;
    int _1375 = _894 + 88;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    float _1393 = _1233 * _1231;
    float _1395 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1397 = _1253 * _1231;
    float _1399 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1401 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1403 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1395);
    bool _1405 = _1393 >= 0.0;
    float _1407 = _1371;
    if (!_1081)
    {
        int _1409 = _1249 + 400;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
        int _1415 = int(_1411) & 3;
        float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
        _1407 = _1417;
    }
    float _1419 = _1407;
    float _1421 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1399);
    float _1423 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1401);
    float _1425 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1403);
    float _1427 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1421);
    float _1431 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1423);
    float _1433 = _1425 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1435 = _1393 <= 1.0;
    bool _1437 = _1435 && _1405;
    float _1439 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1443 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1445 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1447 = _1397 >= 0.0;
    bool _1449 = _1447 && _1437;
    float _1451 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1453 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1455 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1443);
    float _1457 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1445);
    bool _1459 = _1397 <= 1.0;
    bool _1461 = _1459 && _1449;
    float _1463 = -_1453;
    float _1465 = fma(_1463, _1451, 1.0);
    float _1467 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1457);
    float _1471 = _820 * _1161;
    float _1473 = _1235;
    float _1475 = _1453;
    if (!_1081)
    {
        float _1477 = floor(_882);
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1483 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1485 = fma(_368, _1153, _1471);
    float _1487 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1489 = log2(_1465);
    if (_1461)
    {
        float _1491 = float(_886);
        _1475 = _1491;
    }
    float _1493 = _1475;
    float _1495 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1481);
    float _1497 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1487);
    float _1499 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1495);
    float _1501 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1503 = 1.0 / _1483;
    float _1505 = fma(_370, _1383, _1485);
    if (!_1081)
    {
        float _1507 = -_1479;
        float _1509 = _882 + _1507;
        _1243 = _1509;
    }
    float _1511 = _1243;
    float _1513 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1515 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1517 = _1505 + _1391;
    float _1519 = _1481;
    if (_1461)
    {
        float _1521 = rint(_1493);
        float _1523 = precise::max(_1521, 0.0);
        uint _1525 = uint(_1523);
        uint _1527 = clamp(_1525, 0u, 65535u);
        _1519 = as_type<float>(_1527);
    }
    float _1529 = _1519;
    float _1531 = _1517 * _1231;
    float _1533 = _1489 * 0.693147182464599609375;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = _1517;
    if (!_1081)
    {
        float _1539 = rint(_1419);
        float _1541 = precise::max(_1539, 0.0);
        uint _1543 = uint(_1541);
        uint _1545 = clamp(_1543, 0u, 65535u);
        _1537 = as_type<float>(_1545);
    }
    float _1547 = _1537;
    float _1549 = _1513 * _1503;
    float _1551 = _1515 * _1503;
    float _1553 = fma(_1549, 0.5, 0.5);
    float _1555 = fma(_1551, -0.5, 0.5);
    float _1557 = _1549;
    if (!_1081)
    {
        float _1559 = -_1205;
        float _1561 = _896 + _1559;
        _1557 = _1561;
    }
    float _1563 = _1557;
    float _1565 = _1397;
    if (_1461)
    {
        float3 _4897 = float3(_1393, _1397, float(as_type<int>(_1529)));
        float3 _4901 = select(_4897, float3(0.0), isnan(_4897));
        float _1567 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4901.xy, uint(rint(_4901.z)), _1531, level(0.0));
        _1565 = _1567;
    }
    float _1569 = _1565;
    float3 _4911 = float3(_1553, _1555, _1535);
    float _1571 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4911, float3(0.0), isnan(_4911)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4911, float3(0.0), isnan(_4911)), level(0.0)).x;
    float3 _4920 = float3(_1553, _1555, _1535);
    float4 _1574 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4920, float3(0.0), isnan(_4920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4920, float3(0.0), isnan(_4920)), level(0.0)).xyzw;
    float _1576 = _1574.x;
    float _1578 = _1574.y;
    float _1580 = _1574.z;
    float _1582 = _1574.w;
    float _1584 = _1511;
    if (!_1081)
    {
        float3 _4943 = float3(_1563, _1511, float(as_type<int>(_1547)));
        float3 _4945 = select(_4943, float3(0.0), isnan(_4943));
        float _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4945.xy, uint(rint(_4945.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4945.xy, uint(rint(_4945.z)), level(0.0)).x;
        _1584 = _1586;
    }
    float _1588 = _1584;
    if (_1081)
    {
        _1259 = 1.0;
    }
    float _1590 = _1259;
    float _1592 = _1590;
    if (!_1081)
    {
        int _1594 = _1143 << 4;
        int _1596 = _1594 + 2048;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
        int _1602 = int(_1598) & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        int _1606 = int(_1598) + 1;
        uint _1608 = uint(int(uint(_1606) >> uint(2)));
        int _1610 = _1606 & 3;
        float _1612 = (*spvDescriptorSet0.vp_c15)._m0[int(_1608)][_1610];
        int _1614 = _1596 + 8;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        uint _1618 = uint(int(uint(int(_1616)) >> uint(2)));
        int _1620 = int(_1616) & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        int _1624 = int(_1616) + 1;
        uint _1626 = uint(int(uint(_1624) >> uint(2)));
        int _1628 = _1624 & 3;
        float _1630 = (*spvDescriptorSet0.vp_c15)._m0[int(_1626)][_1628];
        float _1632 = _820 * _1612;
        float _1634 = fma(_368, _1604, _1632);
        float _1636 = fma(_370, _1622, _1634);
        float _1638 = _1636 + _1630;
        float _1640 = precise::clamp(_1638, 0.0, 1.0);
        float _1642 = -_1640;
        float _1644 = _1642 + _1588;
        float _1646 = fma(_1644, 500.0, 1.5);
        float _1648 = exp2(_1646);
        float _1650 = 0.0 + _1648;
        float _1652 = precise::clamp(_1650, 0.0, 1.0);
        _1189 = as_type<float>(_1596);
        _1592 = _1652;
    }
    float _1654 = _1189;
    float _1656 = _1592;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1660 = _1367 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1369 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1668 = _1373 + _1666;
    float _1670 = _1660 * _1660;
    float _1672 = fma(_1664, _1664, _1670);
    float _1674 = fma(_1668, _1668, _1672);
    float _1676 = rsqrt(_1674);
    float _1678 = sqrt(_1674);
    float _1680 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1682 = _1664 * _1680;
    float _1684 = _1668 * _1680;
    float _1686 = _1682 * _1682;
    float _1688 = _1684 * _1684;
    float _1690 = _1686 + _1688;
    float _1692 = sqrt(_1690);
    bool _1694 = _1692 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1698 = _1692 + _1696;
    float _1700 = _1555;
    float _1702 = _1690;
    float _1704 = _1698;
    float _1706 = _1682;
    float _1708 = _1684;
    float _1710 = _1686;
    float _1712 = _1688;
    if (_1694)
    {
        float _1714 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1700 = _1714;
    }
    float _1716 = _1700;
    if (_1694)
    {
        float _1718 = rsqrt(_1690);
        _1702 = _1718;
    }
    float _1720 = _1702;
    if (_1694)
    {
        float _1722 = _1698 * _1716;
        _1704 = _1722;
    }
    float _1724 = _1704;
    if (_1694)
    {
        float _1726 = _1724 * 0.15915493667125701904296875;
        _1137 = _1726;
    }
    float _1728 = _1137;
    float _1730 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1732 = _1654;
    if (_1694)
    {
        float _1734 = _1728 * 6.283185482025146484375;
        float _1736 = sin(_1734);
        _1732 = _1736;
    }
    float _1738 = _1732;
    float _1740 = precise::max(0.0, _1730);
    float _1742 = _1724;
    float _1744 = _1740;
    if (_1694)
    {
        float _1746 = _1728 * 6.283185482025146484375;
        float _1748 = cos(_1746);
        _1742 = _1748;
    }
    float _1750 = _1742;
    float _1752 = -_1680;
    float _1754 = -_1740;
    float _1756 = fma(_1660, _1752, _1754);
    float _1758 = _1756;
    if (_1694)
    {
        float _1760 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1760;
    }
    float _1762 = _1744;
    float _1764 = _1738;
    float _1766 = _1762;
    if (_1694)
    {
        float _1768 = fma(_1738, _1762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1764 = _1768;
    }
    float _1770 = _1764;
    float _1772 = _1770;
    if (_1694)
    {
        float _1774 = _1720 * _1770;
        _1772 = _1774;
    }
    float _1776 = _1772;
    if (_1694)
    {
        float _1778 = _1750 + (-1.0);
        _1766 = _1778;
    }
    float _1780 = _1766;
    float _1782 = _1780;
    if (_1694)
    {
        float _1784 = _1682 * _1776;
        _1706 = _1784;
    }
    float _1786 = _1706;
    if (_1694)
    {
        float _1788 = _1684 * _1776;
        _1708 = _1788;
    }
    float _1790 = _1708;
    if (_1694)
    {
        float _1792 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1792;
    }
    float _1794 = _1782;
    if (_1694)
    {
        float _1796 = _1786 * _1786;
        _1710 = _1796;
    }
    float _1798 = _1710;
    if (_1694)
    {
        float _1800 = _1790 * _1790;
        _1712 = _1800;
    }
    float _1802 = _1712;
    if (_1694)
    {
        float _1804 = fma(_1756, _1750, _1794);
        _1758 = _1804;
    }
    float _1806 = _1758;
    float _1808 = fma(_1806, _1806, _1798);
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1812 = fma(_1678, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1810);
    float _1814 = precise::clamp(_1812, 0.0, 1.0);
    float _1816 = _1808 + _1802;
    float _1818 = -_1814;
    float _1820 = _1818 + 1.0;
    float _1822 = rsqrt(_1816);
    float _1824 = abs(_1820);
    float _1826 = log2(_1824);
    float _1828 = _1822 * _1786;
    float _1830 = _1822 * _1806;
    float _1832 = _1822 * _1790;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1836 = -_1834;
    float _1838 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1836);
    float _1840 = -_1832;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1838);
    float _1844 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1846 = fma(_1842, -0.5, 0.5);
    float _1848 = exp2(_1844);
    float _1850 = fma(_1842, 0.5, 0.5);
    float _1852 = fma(_1850, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = sqrt(_1846);
    float _1856 = fma(_1850, _1852, -0.212114393711090087890625);
    float _1858 = _1830 + 1.0;
    float _1860 = fma(_1850, _1856, 1.570728778839111328125);
    float _1862 = -_1830;
    float _1864 = fma(_1848, _1858, _1862);
    float _1866 = fma(_1864, 0.5, 0.5);
    float _1868 = _1854 * 0.636619746685028076171875;
    float _1870 = -_1860;
    float _1872 = fma(_1868, _1870, 1.0);
    float2 _5387 = float2(_1872, _1866);
    float3 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5387, float2(0.0), isnan(_5387)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5387, float2(0.0), isnan(_5387)), level(0.0)).xyz;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1886 = in.m_71.y;
    float _1888 = abs(_842);
    float _1890 = log2(_1888);
    float _1892 = _1884 * _931;
    float _1894 = in.m_79.x;
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1898 = _1896 != 0;
    float _1900 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1904 = _1902 != 0;
    float _1906 = in.m_79.y;
    float _1908 = trunc(_1892);
    int _1910 = int(_1908);
    bool _1912 = _931 > 0.5;
    bool _1914 = _1912 && _1898;
    float _1916 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1918 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1900);
    float _1920 = -_388;
    float _1922 = _1920 + 1.0;
    bool _1924 = _842 <= 8000.0;
    bool _1926 = isnan(_842);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(8000.0);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1938 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1918);
    bool _1940 = _1886 > 0.5;
    int _1942 = _1910 << 4;
    int _1944 = _1942 + 1712;
    float _1946 = exp2(_1916);
    float _1948 = _1886;
    float _1950 = _1894;
    float _1952 = _1934;
    if (_1898)
    {
        _1948 = _1894;
    }
    float _1954 = _1948;
    uint _1956 = uint(int(uint(_1944) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = -_1906;
    float _1974 = _1972 + 1.0;
    float _1976 = _1954;
    float _1978 = _1906;
    if (_1914)
    {
        float _1980 = -_1954;
        float _1982 = _1980 + 1.0;
        _1976 = _1982;
    }
    float _1984 = _1976;
    float _1986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1988 = _1944 + 8;
    uint _1990 = uint(int(uint(_1988) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    if (_1904)
    {
        float _1998 = _1940 ? _1974 : _1906;
        _1978 = _1998;
    }
    float _2000 = _1978;
    if (_1898)
    {
        _1950 = _1984;
    }
    float _2002 = _1950;
    float _2004 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2006 = _836 != 0.0;
    bool _2008 = isnan(_836);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan(0.0);
    bool _2014 = _2010 || _2012;
    float _2016 = -_1946;
    float _2018 = _2016 + 1.0;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2024 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2026 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2028 = _2004 * _1986;
    float _2030 = _2024 * _1936;
    bool _2032 = _868 == 0.0;
    bool _2034 = !_2014;
    bool _2036 = _2032 && _2034;
    float _2038 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2040 = exp2(_2026);
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2044 = _860 == 0.0;
    bool _2046 = _2044 && _2036;
    float _2048 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_81.x = _2030;
    out.m_81.y = _2028;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_83.x = _2050;
    out.m_83.y = _2038;
    out.m_83.z = _2048;
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _1962 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2060 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2062 = fma(_2056, -2.0, 3.0);
    float _2064 = in.m_85.x;
    float _2066 = in.m_85.y;
    float _2068 = in.m_85.z;
    float _2070 = _2056 * _2056;
    float _2072 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2070 * _2062;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _2074;
    out.m_87.y = _2076;
    out.m_87.z = _2080;
    out.m_87.w = _2052;
    float _2082 = _774 * _2068;
    float _2084 = _754 * _2068;
    float _2086 = -_2082;
    float _2088 = fma(_754, _2066, _2086);
    float _2090 = fma(_774, _2066, _2084);
    float _2092 = _736 * _2088;
    float _2094 = _824 * _2088;
    float _2096 = _2090;
    if (!_2046)
    {
        float _2098 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2090);
        _2096 = _2098;
    }
    float _2100 = _2096;
    float _2102 = -_2092;
    float _2104 = fma(_824, _2064, _2102);
    float _2106 = fma(_736, _2064, _2094);
    float _2108 = in.m_73.w;
    float _2110 = _2104;
    float _2112 = _2106;
    if (!_2046)
    {
        float _2114 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2104);
        _2110 = _2114;
    }
    float _2116 = _2110;
    if (!_2046)
    {
        float _2118 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2106);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = _550 * _2120;
    float _2124 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1938);
    float _2126 = -_2078;
    float _2128 = _2126 + 1.0;
    float _2130 = _554 * _2120;
    float _2132 = _568 * _2120;
    float _2134 = fma(_902, _2116, _2122);
    float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2078);
    float _2138 = fma(_892, _2116, _2130);
    float _2140 = fma(_904, _2116, _2132);
    float _2142 = _2124 + _1483;
    float _2144 = _1934 * _2136;
    if (!_1461)
    {
        _1952 = 1.0;
    }
    float _2146 = _1952;
    float _2148 = fma(_977, _2100, _2138);
    float _2150 = _2146;
    if (_1461)
    {
        bool _2152 = _1569 >= _1531;
        bool _2154 = isnan(_1569);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan(_1531);
        bool _2160 = _2156 || _2158;
        float _2162 = float(_2160);
        _2150 = _2162;
    }
    float _2164 = _2150;
    float _2166 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2168 = fma(_1171, _2100, _2134);
    float _2170 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2172 = fma(_971, _2100, _2140);
    float _2174 = _1922 * _2166;
    float _2176 = precise::clamp(_2174, 0.0, 1.0);
    float _2178 = _2142 * 0.5;
    float _2180 = _2164 * _1656;
    float _2182 = _2170 * _1571;
    float _2184 = -_2176;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_89.z = _2178;
    out.m_89.w = _1483;
    float _2188 = -_2170;
    float _2190 = _2188 + 1.0;
    bool _2192 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2194 = isnan(_1678);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2200 = _2196 || _2198;
    float _2202 = -_2180;
    float _2204 = fma(_2202, _2186, 1.0);
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    out.gl_Position.x = _1513;
    out.gl_Position.y = _1515;
    out.gl_Position.z = _2124;
    out.gl_Position.w = _1483;
    float _2208 = _1582 * _2190;
    float _2210 = _2206 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _2148;
    out.m_91.y = _2168;
    out.m_91.z = _2172;
    float _2212 = _1582 * _2182;
    out.m_93.x = _2210;
    float _2214 = _1483;
    float _2216 = _2186;
    float _2218 = _2206;
    float _2220 = _2190;
    float _2222 = _2212;
    if (!_2200)
    {
        _2214 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2224 = _2214;
    out.m_95.w = _2108;
    float _2226 = _2108;
    float _2228 = _2224;
    float _2230 = _2224;
    if (!_2200)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2232 = _2216;
    float _2234 = _2232;
    float _2236 = _2232;
    if (!_2200)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2238 = _2218;
    float _2240 = _2238;
    float _2242 = _2238;
    if (!_2200)
    {
        _2220 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2244 = _2220;
    float _2246 = _2244;
    float _2248 = _2244;
    if (!_2200)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2250 = _2226;
    float _2252 = _1882 * _2182;
    float _2254 = fma(_1878, _2212, _1576);
    float _2256 = fma(_1880, _2212, _1578);
    float _2258 = _2250;
    float _2260 = _2250;
    if (!_2200)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2262 = _2222;
    float _2264 = fma(_1582, _2252, _1580);
    out.m_97.x = _2254;
    out.m_97.y = _2256;
    out.m_97.z = _2264;
    out.m_97.w = _2208;
    bool _2266 = !_2200;
    float _2268 = _2262;
    float _2270 = _2262;
    if (!_2266)
    {
        bool _2272 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2274 = isnan(_1678);
        bool _2276 = _2272 || _2274;
        bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2280 = _2276 || _2278;
        if (!_2280)
        {
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2284 = _1678 + _2282;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2286;
            float _2290 = 1.0 / _2288;
            float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2312 = _2284 * _2290;
            float _2314 = precise::clamp(_2312, 0.0, 1.0);
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2320 = fma(_2314, _2294, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2322 = fma(_2314, _2318, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2324 = fma(_2314, _2298, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2326 = fma(_2314, _2302, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2328 = fma(_2314, _2306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2330 = fma(_2314, _2310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2260 = _2320;
            _2242 = _2328;
            _2270 = _2322;
            _2236 = _2326;
            _2230 = _2324;
            _2248 = _2330;
            _2332 = true;
        }
        else
        {
            bool _2334 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2336 = isnan(_1678);
            bool _2338 = _2334 || _2336;
            bool _2340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2342 = _2338 || _2340;
            if (!_2342)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2344 = _2268;
            _2270 = _2344;
            if (!_2342)
            {
                _2258 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2346 = _2258;
            _2260 = _2346;
            if (!_2342)
            {
                _2228 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2348 = _2228;
            _2230 = _2348;
            if (!_2342)
            {
                _2234 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2350 = _2234;
            _2236 = _2350;
            if (!_2342)
            {
                _2240 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2352 = _2240;
            _2242 = _2352;
            if (!_2342)
            {
                _2246 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2354 = _2246;
            bool _2356 = !_2342;
            _2248 = _2354;
            if (!_2356)
            {
                bool _2358 = _1678 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2360 = isnan(_1678);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2366 = _2362 || _2364;
                if (!_2366)
                {
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2370 = _1678 + _2368;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2372;
                    float _2376 = 1.0 / _2374;
                    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2398 = _2370 * _2376;
                    float _2400 = precise::clamp(_2398, 0.0, 1.0);
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2406 = fma(_2400, _2380, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2408 = fma(_2400, _2404, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2410 = fma(_2400, _2384, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2412 = fma(_2400, _2388, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2414 = fma(_2400, _2392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2416 = fma(_2400, _2396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2260 = _2406;
                    _2242 = _2414;
                    _2270 = _2408;
                    _2236 = _2412;
                    _2230 = _2410;
                    _2248 = _2416;
                    _2332 = true;
                }
                else
                {
                    _2260 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2242 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2236 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2230 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2248 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2332 = false;
    float _2418 = _2260;
    float _2420 = _2242;
    float _2422 = _2270;
    float _2424 = _2236;
    float _2426 = _2230;
    float _2428 = _2248;
    float _2430 = fma(_2168, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2418;
    float _2436 = _2434 + _2420;
    float _2438 = -_2422;
    float _2440 = _2438 + _2424;
    float _2442 = -_2426;
    float _2444 = _2442 + _2428;
    bool _2446 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2448 = fma(_2432, _2436, _2418);
    float _2450 = fma(_2432, _2440, _2422);
    float _2452 = fma(_2432, _2444, _2426);
    float _2454 = _2448 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2456 = fma(_2450, 0.298911988735198974609375, _2454);
    float _2458 = fma(_2452, 0.114477999508380889892578125, _2456);
    out.m_99.x = 0.0;
    float _2460 = -_2458;
    float _2462 = _2450 + _2460;
    float _2464 = -_2458;
    float _2466 = _2448 + _2464;
    float _2468 = -_2458;
    float _2470 = _2452 + _2468;
    float _2472 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2474 = fma(_2462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    float _2478 = fma(_2470, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2458);
    out.m_93.w = _2472;
    out.m_101.x = _2474;
    out.m_101.y = _2476;
    out.m_101.z = _2478;
    if (!_2446)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2480 = -_1367;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2484 = -_1369;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2488 = -_1373;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2492 = _2482 * _2482;
    float _2494 = fma(_2486, _2486, _2492);
    float _2496 = fma(_2490, _2490, _2494);
    float _2498 = sqrt(_2496);
    float _2500 = rsqrt(_2496);
    float _2502 = -_2498;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2506 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2486 * _2500;
    float _2512 = _2482 * _2500;
    float _2514 = abs(_2508);
    float _2516 = log2(_2514);
    float _2518 = _2490 * _2500;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = _2168 * _2512;
    float _2524 = -_2512;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = fma(_2148, _2510, _2522);
    float _2532 = -_2518;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = fma(_2172, _2518, _2530);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2542 = _2534 + _2540;
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2546 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = exp2(_2544);
    float _2552 = _2550 * _2548;
    float _2554 = _2538 * _2552;
    float _2556 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2556;
    out.m_99.y = _2558;
    out.m_99.z = _2560;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

