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
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    texture2d_array<float> vp_t_tcb_14 [[id(16)]];
    sampler vp_t_tcb_14Smplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_93 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3342 = false;
    bool _742 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_56.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_59.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3628 = as_type<float>(_128);
        out.gl_Position.z = _3628;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_61.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _138;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    float _160 = _158;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _162 = _158 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3693 = as_type<float>(_164);
        out.gl_Position.z = _3693;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_63.w;
    float _168 = 1.0 / _134;
    float _170 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_61.x;
    float _184 = in.m_61.y;
    float _186 = in.m_61.z;
    float _188 = in.m_56.x;
    float _190 = in.m_56.y;
    float _192 = in.m_56.z;
    float _194 = _170;
    if (!_180)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _160 = _198;
    }
    float _200 = _160;
    float _202 = _200;
    if (!_180)
    {
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_180;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _170 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _170);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_180;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _170 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _194 = _264;
    }
    float _266 = _194;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _276 = _138 * _168;
    float _278 = fma(_266, _182, _270);
    float _280 = fma(_266, _184, _272);
    float _282 = fma(_266, _186, _274);
    float _284 = fma(_278, _166, _188);
    float _286 = fma(_280, _166, _190);
    float _288 = fma(_282, _166, _192);
    bool _290 = !_268;
    float _308;
    if (!_290)
    {
        float _292 = in.m_65.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _276;
    }
    _310 = false;
    float _312 = _308;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _312 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = _312 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _338;
    float _342 = 1.0 / _332;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _348;
    float _352 = 1.0 / _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = _312 + _354;
    bool _358 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _360 = isnan(_312);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    bool _370 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _372 = isnan(_312);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _336;
    float _384 = _356 * _342;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _388 = _312 + _386;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _392 = 1.0 / _340;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _396 = _312 + _394;
    float _398 = _316 * _352;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _402 = _312 + _400;
    float _404 = 1.0 / _350;
    float _406 = _396 * _382;
    bool _408 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _410 = isnan(_312);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _312 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    float _428 = 1.0 / _324;
    float _430 = _388 * _392;
    bool _432 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _434 = isnan(_312);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_426, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = 1.0 / _346;
    bool _448 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _450 = isnan(_312);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _402 * _404;
    bool _462 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _464 = isnan(_312);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_458;
    float _476 = _474 + 1.0;
    float _478 = _320 * _428;
    float _480 = -_418;
    float _482 = _480 + 1.0;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = _418 * _476;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _490;
    float _494 = _442 * _482;
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = _422 * _446;
    float _502 = -_442;
    float _504 = _502 + 1.0;
    float _506 = fma(_486, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _508 = fma(_492, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _510 = _368 * _498;
    float _512 = _472 * _504;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = -_368;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _530 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _532 = isnan(_312);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = fma(_520, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _544 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _546 = isnan(_312);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = fma(_516, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_528, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = -_540;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _564;
    float _568 = _554 * _524;
    float _570 = -_554;
    float _572 = _570 + 1.0;
    float _574 = _380 * _562;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    float _580 = _540 * _572;
    float _582 = _506 * _574;
    float _584 = _508 * _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = _444 * _574;
    float _592 = fma(_578, _478, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _598 = -_380;
    float _600 = _598 + 1.0;
    float _602 = fma(_588, _478, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _612 = fma(_596, _398, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _616 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _584);
    float _618 = fma(_606, _398, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _622 = fma(_610, _398, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _624 = fma(_542, _580, _614);
    float _626 = fma(_566, _478, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = fma(_556, _580, _616);
    float _630 = fma(_558, _580, _620);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _632;
    float _636 = fma(_602, _568, _624);
    float _638 = fma(_592, _568, _628);
    float _640 = fma(_626, _568, _630);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _658;
    float _662 = fma(_634, _430, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _664 = fma(_612, _510, _636);
    float _666 = fma(_644, _430, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _668 = fma(_648, _500, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _670 = fma(_652, _500, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _672 = fma(_656, _500, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _674 = fma(_618, _510, _638);
    float _676 = fma(_622, _510, _640);
    float _678 = fma(_660, _430, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _680 = fma(_662, _512, _664);
    float _682 = fma(_666, _512, _674);
    float _684 = fma(_678, _512, _676);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _686;
    float _690 = fma(_668, _494, _680);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _692;
    float _696 = fma(_670, _494, _682);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _698;
    float _702 = fma(_688, _460, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _704 = fma(_694, _460, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _706 = fma(_672, _494, _684);
    float _708 = fma(_700, _460, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _710 = fma(_702, _488, _690);
    float _712 = fma(_704, _488, _696);
    float _714 = fma(_708, _488, _706);
    float _716 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].x, _710);
    float _718 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].y, _712);
    float _720 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].z, _714);
    bool _722 = !_390;
    float _740;
    if (!_722)
    {
        float _724 = in.m_65.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _276;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_65.z;
    float _748 = in.m_65.w;
    float _750 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _752 = log2(_750);
    float _754 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _756 = in.m_65.x;
    float _758 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _760 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _764 = _762 != 0;
    float _766 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _754);
    float _768 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _758);
    float _770 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _778 = _776 != 0;
    float _780 = _138 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _794 = _276 * 3.1415927410125732421875;
    float _796 = _752 * _138;
    float _798 = in.m_67.x;
    float _800 = in.m_67.y;
    float _802 = in.m_67.z;
    bool _804 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _806 = isnan(1.0);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _812 = _808 || _810;
    float _814 = exp2(_796);
    float _816 = _746 * 2.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _820 = 1.0 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _826 = _756 * 2.0;
    float _828 = floor(_816);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _834;
    float _838 = 1.0 / _820;
    float _840 = -_814;
    float _842 = _840 + 1.0;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _856 = _790 ? _842 : 0.0;
    float _858 = floor(_826);
    bool _860 = _828 > 0.0;
    bool _862 = _828 >= 0.0;
    bool _864 = isnan(_828);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    int _872 = as_type<int>(_746);
    if (_812)
    {
        float _874 = _856 * _838;
        _156 = _874;
    }
    float _876 = _156;
    int _878 = _870 ? 0 : 1;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _884 = 1.0 / _824;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _896 = _894 != 0;
    int _898 = ~_878;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    int _904 = _902;
    bool _906 = _764;
    float _908 = _876;
    if (!_860)
    {
        int _910 = ~_878;
        int _912 = _910 + 1;
        _904 = _912;
    }
    int _914 = _904;
    float _916 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _918 = _858 >= 0.0;
    bool _920 = isnan(_858);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = 1.0 / _832;
    float _930 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _916);
    int _932 = _926 ? 0 : 1;
    float _934 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _940 = _858 > 0.0;
    float _942 = 1.0 / _882;
    float _944 = in.m_65.y;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _950 = _934 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _952 = ~_932;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = 1.0 / _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _964 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _766);
    float _966 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _770);
    int _968 = _956;
    float _970 = _950;
    if (!_940)
    {
        int _972 = ~_932;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    bool _978 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _980 = isnan(_744);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = 1.0 / _938;
    float _992 = _850 * _942;
    float _994 = float(_914);
    float _996 = float(_976);
    float _998 = 1.0 / _962;
    float _1000 = _846 * _958;
    float _1002 = _944 * 2.0;
    float _1004 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _1006 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _1008 = precise::max(_1004, _1006);
    float _1010 = floor(_1002);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1016 = _1008 >= 16.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1018;
    float _1022 = _854 * _990;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1028 = _1020 * _928;
    float _1030 = 1.0 / _1014;
    float _1032 = _944 + _746;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1034;
    float _1038 = _836 * _998;
    bool _1040 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1042 = isnan(_744);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = _1026 * _884;
    bool _1054 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1056 = isnan(_744);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1068 = isnan(_744);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1032 + (-1.0);
    bool _1080 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1082 = isnan(_744);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1094 = _756 + _746;
    float _1096 = -_1090;
    float _1098 = _1096 + 1.0;
    float _1100 = _1036 * _1030;
    float _1102 = _756 + _944;
    float _1104 = _1094 + (-1.0);
    float _1106 = _1050 * _1098;
    float _1108 = -_1050;
    float _1110 = _1108 + 1.0;
    float _1112 = _1102 + (-1.0);
    float _1114 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1116 = !_888;
    int _1118 = _1116 ? 0 : 1;
    float _1120 = _1064 * _1110;
    bool _1122 = _1010 >= 0.0;
    bool _1124 = isnan(_1010);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1134 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1136 = isnan(_744);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1064;
    float _1148 = _1146 + 1.0;
    int _1150 = _1130 ? 0 : 1;
    bool _1152 = _1010 > 0.0;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1156 = _744 + _1154;
    float _1158 = -_1144;
    float _1160 = _1158 + 1.0;
    bool _1162 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1164 = isnan(_744);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = _1076 * _1148;
    float _1176 = fma(_1028, _1156, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1178 = -_1076;
    float _1180 = _1178 + 1.0;
    float _1182 = _988 * _1160;
    bool _1184 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1186 = isnan(_744);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = -_1172;
    float _1198 = _1196 + 1.0;
    float _1200 = _1144 * _1180;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1204 = _744 + _1202;
    float _1206 = -_988;
    float _1208 = _1206 + 1.0;
    float _1210 = _1194 * _1198;
    float _1212 = -_1194;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1052, _1204, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1220 = _744 + _1218;
    float _1222 = _1172 * _1208;
    float _1224 = _1176 * _1210;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1228 = _744 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1232 = _744 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1236 = _744 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1240 = _744 + _1238;
    float _1242 = fma(_992, _1220, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1244 = fma(_1022, _1228, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1246 = fma(_1038, _1232, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1248 = fma(_1100, _1240, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1250 = abs(_1118);
    float _1252 = _876 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _1254 = !_892;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1224);
    float _1260 = fma(_1000, _1236, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1262 = _1252 * _792;
    int _1264 = abs(_1256);
    float _1266 = fma(_1216, _1222, _1258);
    float _1268 = float(_1250);
    float _1270 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1262);
    bool _1272 = !_896;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = fma(_1242, _1182, _1266);
    int _1278 = ~_1150;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = _1268 * _994;
    float _1286 = _1270 + 0.25;
    float _1288 = floor(_1270);
    int _1290 = _1282;
    if (!_1152)
    {
        int _1292 = ~_1150;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = fma(_1244, _1200, _1276);
    int _1300 = abs(_1274);
    float _1302 = _1284 * (-2.0);
    float _1304 = float(_1296);
    float _1306 = fma(_1246, _1174, _1298);
    float _1308 = float(_1300);
    float _1310 = floor(_1286);
    float _1312 = _794 * 0.15915493667125701904296875;
    float _1314 = fma(_1132, _1302, _1132);
    float _1316 = fma(_1260, _1120, _1306);
    float _1318 = _1308 * _1304;
    float _1320 = _780 * 0.15915493667125701904296875;
    float _1322 = _756 + (-0.5);
    float _1324 = -_1288;
    float _1326 = _1270 + _1324;
    float _1328 = _1318 * (-2.0);
    float _1330 = _1270 * 6.283185482025146484375;
    float _1332 = _1312 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = float(_1264);
    float _1338 = fma(_1114, _1328, _1114);
    bool _1340 = _1326 >= 0.5;
    bool _1342 = isnan(_1326);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(0.5);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1248, _1106, _1316);
    bool _1352 = !_774;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = -_1310;
    float _1358 = _1286 + _1356;
    float _1360 = _1330 * 0.15915493667125701904296875;
    float _1362 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1364 = abs(_1354);
    float _1366 = _1336 * _996;
    float _1368 = fma(_1314, _876, _1362);
    float _1370 = _1360 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = float(_1364);
    float _1376 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1378 = !_1348;
    float _1380 = _1378 ? 0.5 : (-0.5);
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1384 = _950 + _1382;
    bool _1386 = _1358 > 0.5;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1390 = _1376 + _1388;
    float _1392 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1350);
    float _1394 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1396 = _1394 * 2.0;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[191].w + _1398;
    bool _1402 = !_764;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _1384 * _1384;
    float _1408 = _1374 * _1396;
    float _1410 = _1320 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    int _1414 = abs(_1404);
    float _1416 = _966 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1418 = fma(_1390, _1390, _1406);
    bool _1420 = !_778;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = _1358;
    float _1426 = _1416;
    bool _1428 = _1348;
    if (_1386)
    {
        float _1430 = -_1358;
        float _1432 = _1430 + 1.0;
        _1424 = _1432;
    }
    float _1434 = _1424;
    float _1436 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1440 = _1416 + _1438;
    float _1442 = fma(_1434, 4.0, -1.0);
    float _1444 = float(_1414);
    float _1446 = fma(_1440, _1440, _1418);
    int _1448 = abs(_1422);
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1454 = fma(_1444, _1436, _1408);
    float _1456 = _746 + (-0.5);
    float _1458 = rsqrt(_1446);
    float _1460 = _1016 ? _1450 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1462 = _1368 * 0.15915493667125701904296875;
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1466 = float(_1448);
    float _1468 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1470 = fma(_1338, _876, _1464);
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1474 = _1412 * _1468;
    float _1476 = fma(_1466, _1452, _1454);
    float _1478 = _1462 * 6.283185482025146484375;
    float _1480 = sin(_1478);
    float _1482 = in.m_63.x;
    float _1484 = in.m_63.y;
    float _1486 = in.m_63.z;
    float _1488 = _1016 ? _1472 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1490 = _1470 * 0.15915493667125701904296875;
    float _1492 = abs(_1460);
    bool _1494 = _1492 == 0.0;
    float _1496 = _1384 * _1458;
    float _1498 = abs(_1488);
    bool _1500 = _1498 != 0.0;
    bool _1502 = isnan(_1498);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    float _1510 = _1366 * (-2.0);
    float _1512 = _1462 * 6.283185482025146484375;
    float _1514 = cos(_1512);
    float _1516 = _1390 * _1458;
    float _1518 = abs(_1460);
    bool _1520 = _1518 == 0.0;
    bool _1522 = !_1508;
    bool _1524 = _1520 && _1522;
    float _1526 = -_1496;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1384);
    float _1530 = _1476 * 3.1415927410125732421875;
    float _1532 = _944 + (-0.5);
    float _1534 = -_1516;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1538 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _930);
    float _1540 = 1.0 / _1400;
    float _1542 = _1474 * 0.15915493667125701904296875;
    float _1544 = _1528 * _1528;
    float _1546 = fma(_1530, _1510, _1530);
    float _1548 = _1440 * _1458;
    float _1550 = fma(_1092, _1510, _1092);
    float _1552 = fma(_1536, _1536, _1544);
    int _1554 = as_type<int>(_1544);
    if (_1524)
    {
        bool _1556 = as_type<int>(_1460) >= 0;
        _906 = _1556;
    }
    bool _1558 = _906;
    float _1560 = _1490 * 6.283185482025146484375;
    float _1562 = cos(_1560);
    float _1564 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1546);
    float _1566 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1568 = -_1548;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    int _1572 = _1558 ? (-1) : 0;
    if (_1524)
    {
        int _1574 = _1558 ? 0 : 1078530011;
        _1554 = _1574;
    }
    int _1576 = _1554;
    float _1578 = fma(_1550, _876, _1564);
    float _1580 = fma(_1570, _1570, _1552);
    float _1582 = _1542 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = -_1566;
    float _1588 = precise::max(_1586, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    int _1590 = _1576;
    if (_1524)
    {
        int _1592 = int(0x80000000) & as_type<int>(_1488);
        int _1594 = _1576 | _1592;
        _908 = as_type<float>(_1594);
    }
    float _1596 = _908;
    float _1598 = _1542 * 6.283185482025146484375;
    float _1600 = cos(_1598);
    bool _1602 = !_1508;
    bool _1604 = _1602 && _1494;
    float _1606 = _1596;
    float _1608 = _1596;
    if (!_1604)
    {
        float _1610 = abs(_1488);
        bool _1612 = _1610 != as_type<float>(0x7f800000u /* inf */);
        bool _1614 = isnan(_1610);
        bool _1616 = _1612 || _1614;
        bool _1618 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1620 = _1616 || _1618;
        float _1622 = abs(_1460);
        bool _1624 = _1622 == as_type<float>(0x7f800000u /* inf */);
        float _1626 = abs(_1460);
        bool _1628 = _1626 == as_type<float>(0x7f800000u /* inf */);
        bool _1630 = !_1620;
        bool _1632 = _1628 && _1630;
        if (_1632)
        {
            bool _1634 = as_type<int>(_1460) >= 0;
            _1572 = _1634 ? (-1) : 0;
        }
        int _1636 = _1572;
        if (_1632)
        {
            _1590 = 1075235812;
        }
        int _1638 = _1590;
        int _1640 = _1638;
        if (_1632)
        {
            int _1642 = ~_1636;
            int _1644 = (_1642 != 0) ? _1638 : 1061752795;
            _1640 = _1644;
        }
        int _1646 = _1640;
        if (_1632)
        {
            int _1648 = int(0x80000000) & as_type<int>(_1488);
            int _1650 = _1646 | _1648;
            _1606 = as_type<float>(_1650);
        }
        float _1652 = _1606;
        bool _1654 = !_1620;
        bool _1656 = _1654 && _1624;
        _1608 = _1652;
        if (!_1656)
        {
            float _1658 = abs(_1488);
            float _1660 = abs(_1460);
            float _1662 = precise::max(_1658, _1660);
            float _1664 = abs(_1488);
            float _1666 = abs(_1460);
            float _1668 = precise::min(_1664, _1666);
            float _1670 = 1.0 / _1662;
            float _1672 = abs(_1488);
            float _1674 = abs(_1460);
            bool _1676 = _1672 > _1674;
            bool _1678 = as_type<int>(_1460) >= 0;
            float _1680 = abs(_1488);
            float _1682 = abs(_1460);
            float _1684 = _1680 + _1682;
            int _1686 = as_type<int>(_1488) & int(0x80000000);
            bool _1688 = _1684 > as_type<float>(0x7f800000u /* inf */);
            bool _1690 = isnan(_1684);
            bool _1692 = _1688 || _1690;
            bool _1694 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1696 = _1692 || _1694;
            float _1698 = _1668 * _1670;
            float _1700 = _1698 * _1698;
            float _1702 = _1700 + 11.33538818359375;
            float _1704 = fma(_1700, _1702, 28.84246826171875);
            float _1706 = fma(_1700, _1704, 19.6966705322265625);
            float _1708 = fma(_1700, -0.82336294651031494140625, -5.674867153167724609375);
            float _1710 = fma(_1700, _1708, -6.565555095672607421875);
            float _1712 = 1.0 / _1706;
            float _1714 = _1700 * _1710;
            float _1716 = _1698 * _1714;
            float _1718 = fma(_1716, _1712, _1698);
            float _1720 = _1718;
            _1608 = _1684;
            if (_1676)
            {
                float _1722 = -_1718;
                float _1724 = _1722 + 1.57079637050628662109375;
                _1720 = _1724;
            }
            float _1726 = _1720;
            int _1728 = as_type<int>(_1726);
            if (!_1678)
            {
                float _1730 = -_1726;
                float _1732 = _1730 + 3.1415927410125732421875;
                _1728 = as_type<int>(_1732);
            }
            int _1734 = _1728;
            if (!_1696)
            {
                int _1736 = _1686 | _1734;
                _1608 = as_type<float>(_1736);
            }
        }
    }
    float _1738 = _1608;
    float _1740 = _1578 + _1738;
    float _1742 = sqrt(_1580);
    float _1744 = precise::min(_1588, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1746 = 0.0 + _1334;
    float _1748 = precise::clamp(_1746, 0.0, 1.0);
    float _1750 = _1740 * 0.15915493667125701904296875;
    float _1752 = _716 * _1482;
    float _1754 = _718 * _1484;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1758 = _1744 + _1756;
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1762 = _1750 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1768 = _1758 * _1540;
    float _1770 = _1584 * _798;
    float _1772 = _1600 * _798;
    float _1774 = _720 * _1486;
    float _1776 = fma(_1760, _1768, _800);
    float _1778 = -_1770;
    float _1780 = fma(_1600, _802, _1778);
    float _1782 = _1750 * 6.283185482025146484375;
    float _1784 = cos(_1782);
    float _1786 = _1458 * _1742;
    float _1788 = fma(_1584, _802, _1772);
    float _1790 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1776);
    float _1794 = _1786 * _1766;
    float _1796 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1798 = _1786 * _1790;
    float _1800 = _1490 * 6.283185482025146484375;
    float _1802 = sin(_1800);
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1788);
    float _1806 = _1792 * _1794;
    float _1808 = _1480 * _1562;
    float _1810 = _1514 * _1764;
    float _1812 = _1786 * _1796;
    float _1814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1780);
    float _1816 = _1804 * _1798;
    float _1818 = _1480 * _1784;
    float _1820 = _1808 * _1806;
    float _1822 = _1480 * _1764;
    float _1824 = _1514 * _1784;
    float _1826 = _1814 * _1812;
    float _1828 = _1784 * _1562;
    float _1830 = _1764 * _1562;
    float _1832 = _1514 * _1562;
    float _1834 = -_1810;
    float _1836 = fma(_1802, _1818, _1834);
    float _1838 = -_1806;
    float _1840 = _1802 * _1838;
    float _1842 = fma(_1802, _1822, _1824);
    float _1844 = _1832 * _1806;
    float _1846 = fma(_1836, _1816, _1820);
    float _1848 = fma(_1828, _1816, _1840);
    float _1850 = fma(_1802, _1824, _1822);
    float _1852 = -_1818;
    float _1854 = fma(_1802, _1810, _1852);
    float _1856 = fma(_1842, _1826, _1846);
    float _1858 = fma(_1830, _1826, _1848);
    float _1860 = fma(_1850, _1816, _1844);
    float _1862 = -_1496;
    float _1864 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1866 = _1416 + _1856;
    float _1868 = _1376 + _1858;
    float _1870 = fma(_1854, _1826, _1860);
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1876 = _1866 + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1880 = _1868 + _1878;
    float _1882 = _950 + _1870;
    float _1884 = _1876 * _1876;
    float _1886 = -_1548;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1890 = fma(_1880, _1880, _1884);
    float _1892 = -_1516;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1896 = sqrt(_1890);
    float _1898 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1872);
    bool _1900 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1872;
    float _1904 = _1894;
    float _1906 = _1888;
    if (!_1900)
    {
        _970 = _1868;
    }
    float _1908 = _970;
    float _1910 = _1908;
    if (!_1900)
    {
        _1426 = _1866;
    }
    float _1912 = _1426;
    float _1914 = _1912;
    if (!_1900)
    {
        _1902 = _1882;
    }
    float _1916 = _1902;
    bool _1918 = !_1900;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1896 + _1924;
        float _1928 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = rsqrt(_1890);
        float _1932 = _1926 * _1922;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = sin(_1940);
        float _1944 = _1938 + (-1.0);
        float _1946 = fma(_1942, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1948 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1930 * _1946;
        float _1952 = fma(_1882, _1938, _1948);
        float _1954 = fma(_1880, _1950, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1956 = fma(_1876, _1950, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1920 = _1952;
        _1910 = _1954;
        _1914 = _1956;
    }
    float _1958 = _1920;
    float _1960 = _1910;
    float _1962 = _1914;
    float _1964 = -_1496;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1968 = -_1516;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1972 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1898);
    float _1974 = -_1548;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1980 = _1966 + _1978;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1984 = _1970 + _1982;
    float _1986 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1990 = _1976 + _1988;
    float _1992 = _1980 * _1980;
    float _1994 = 1.0 / _1986;
    float _1996 = fma(_1984, _1984, _1992);
    float _1998 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2000 = fma(_1990, _1990, _1996);
    float _2002 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1998);
    float _2004 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2006 = rsqrt(_2000);
    float _2008 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2002);
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2012 = floor(_2004);
    float _2014 = _2010 + _1986;
    float _2016 = _2014 * _1994;
    float _2018 = _2016 * 0.5;
    float _2020 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2022 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2026 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2024);
    float _2028 = _1864 + _2020;
    float _2030 = _1984 * _2022;
    float _2032 = _1990 * _2022;
    float _2034 = 1.0 / _2026;
    float _2036 = _2030 * _2030;
    float _2038 = _2032 * _2032;
    float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2042 = -_2012;
    float _2044 = _2004 + _2042;
    float _2046 = _2036 + _2038;
    float _2048 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2040);
    float _2050 = sqrt(_2046);
    float _2052 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2048);
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2058 = _2034 * _2056;
    float _2060 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2062 = trunc(_2054);
    int _2064 = int(_2062);
    bool _2066 = _2058 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2068 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2060);
    bool _2070 = _2058 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2072 = !_2066;
    int _2074 = _2072 ? 0 : 1;
    float _2076 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2068);
    bool _2078 = _2050 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = _2050 + _2080;
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2086 = 2;
    float _2088 = _2046;
    float _2090 = _2082;
    float _2092 = _2030;
    float _2094 = _2032;
    float _2096 = _2036;
    float _2098 = _2038;
    float _2100 = _2084;
    float _2102 = _2012;
    if (!_2066)
    {
        _2086 = 1;
    }
    int _2104 = _2086;
    float _2106 = trunc(_2084);
    int _2108 = int(_2106);
    int _2110 = _2104;
    if (!_2070)
    {
        _2110 = _2074;
    }
    int _2112 = _2110;
    int _2114 = _2112 << 6;
    float _2116 = _1994;
    float _2118 = as_type<float>(_2112);
    if (_2078)
    {
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2116 = _2120;
    }
    float _2122 = _2116;
    int _2124 = _2114 + 96;
    uint _2127 = uint(int(uint(_2124) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
    float _2143 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2147 = _2064 + _2145;
    int _2149 = _2147 + 1;
    bool _2151 = _2149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    uint _2153 = uint(_2149);
    if (_2078)
    {
        float _2155 = rsqrt(_2046);
        _2088 = _2155;
    }
    float _2157 = _2088;
    int _2159 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2161 = _2108 + _2159;
    int _2163 = _2161 + 1;
    int _2165 = _2114 + 104;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    uint _2169 = uint(int(uint(int(_2167)) >> uint(2)));
    int _2171 = int(_2167) & 3;
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[int(_2169)][_2171];
    int _2175 = int(_2167) + 1;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    int _2179 = _2175 & 3;
    float _2181 = (*spvDescriptorSet0.vp_c15)._m0[int(_2177)][_2179];
    int _2183 = _2149 | _2163;
    float _2185 = as_type<float>(_2163);
    if (_2078)
    {
        float _2187 = _2082 * _2122;
        _2090 = _2187;
    }
    float _2189 = _2090;
    int _2191 = _2114 + 48;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
    int _2197 = int(_2193) & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    int _2201 = int(_2193) + 1;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    int _2205 = _2201 & 3;
    float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
    bool _2209 = _2183 < 0;
    bool _2211 = _2209 || _2151;
    float _2213 = _2189;
    if (_2078)
    {
        float _2215 = _2189 * 0.15915493667125701904296875;
        _2213 = _2215;
    }
    float _2217 = _2213;
    float _2219 = floor(_2143);
    float _2221 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _2223 = _2163 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2225 = _2223 || _2211;
    int _2227 = _2114 + 64;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    uint _2231 = uint(int(uint(int(_2229)) >> uint(2)));
    int _2233 = int(_2229) & 3;
    float _2235 = (*spvDescriptorSet0.vp_c15)._m0[int(_2231)][_2233];
    int _2237 = int(_2229) + 1;
    uint _2239 = uint(int(uint(_2237) >> uint(2)));
    int _2241 = _2237 & 3;
    float _2243 = (*spvDescriptorSet0.vp_c15)._m0[int(_2239)][_2241];
    float _2245 = precise::max(0.0, _2221);
    float _2247 = 0.0;
    if (_2078)
    {
        float _2249 = _2217 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        _2247 = _2251;
    }
    float _2253 = _2247;
    float _2255 = -_2022;
    float _2257 = -_2245;
    float _2259 = fma(_1980, _2255, _2257);
    int _2261 = _2114 + 80;
    uint _2263 = uint(int(uint(_2261) >> uint(2)));
    uint _2265 = uint(int(uint(int(_2263)) >> uint(2)));
    int _2267 = int(_2263) & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    int _2271 = int(_2263) + 1;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    int _2275 = _2271 & 3;
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[int(_2273)][_2275];
    float _2279 = 0.0;
    float _2281 = _2259;
    if (_2078)
    {
        float _2283 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2279 = _2283;
    }
    float _2285 = _2279;
    int _2287 = as_type<int>(_1224);
    if (_2078)
    {
        float _2289 = _2217 * 6.283185482025146484375;
        float _2291 = cos(_2289);
        _2287 = as_type<int>(_2291);
    }
    int _2293 = _2287;
    if (!_2225)
    {
        int _2295 = _2163 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2297 = _2295 + _2149;
        _2153 = uint(_2297);
    }
    uint _2299 = _2153;
    float _2301 = -_2219;
    float _2303 = _2143 + _2301;
    int _2305 = _2114 + 56;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[int(_2317)][_2319];
    int _2323 = as_type<int>(_2141);
    float _2325 = _2253;
    int _2327 = _2293;
    float _2329 = as_type<float>(_2299);
    if (_2078)
    {
        float _2331 = fma(_2253, _2285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2185 = _2331;
    }
    float _2333 = _2185;
    float _2335 = _2285;
    float _2337 = _2333;
    if (!_2225)
    {
        float _2339 = floor(_2084);
        _2335 = _2339;
    }
    float _2341 = _2335;
    if (_2078)
    {
        float _2343 = _2157 * _2333;
        _2337 = _2343;
    }
    float _2345 = _2337;
    int _2347 = _2114 + 72;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    uint _2351 = uint(int(uint(int(_2349)) >> uint(2)));
    int _2353 = int(_2349) & 3;
    float _2355 = (*spvDescriptorSet0.vp_c15)._m0[int(_2351)][_2353];
    int _2357 = int(_2349) + 1;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    int _2361 = _2357 & 3;
    float _2363 = (*spvDescriptorSet0.vp_c15)._m0[int(_2359)][_2361];
    float _2365 = _2028 * _2141;
    if (!_2225)
    {
        uint _2367 = uint(int(uint(int(_2299)) >> uint(2)));
        _2323 = int(_2367);
    }
    int _2369 = _2323;
    if (_2078)
    {
        float _2371 = as_type<float>(_2293) + (-1.0);
        _2325 = _2371;
    }
    float _2373 = _2325;
    float _2375 = _2373;
    if (_2078)
    {
        float _2377 = _2030 * _2345;
        _2092 = _2377;
    }
    float _2379 = _2092;
    if (_2078)
    {
        float _2381 = _2032 * _2345;
        _2094 = _2381;
    }
    float _2383 = _2094;
    float _2385 = fma(_1894, _2133, _2365);
    if (_2078)
    {
        float _2387 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2375 = _2387;
    }
    float _2389 = _2375;
    int _2391 = _2114 + 88;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    uint _2395 = uint(int(uint(int(_2393)) >> uint(2)));
    int _2397 = int(_2393) & 3;
    float _2399 = (*spvDescriptorSet0.vp_c15)._m0[int(_2395)][_2397];
    int _2401 = int(_2393) + 1;
    uint _2403 = uint(int(uint(_2401) >> uint(2)));
    int _2405 = _2401 & 3;
    float _2407 = (*spvDescriptorSet0.vp_c15)._m0[int(_2403)][_2405];
    if (_2078)
    {
        float _2409 = _2379 * _2379;
        _2096 = _2409;
    }
    float _2411 = _2096;
    int _2413 = as_type<int>(_2411);
    if (_2078)
    {
        float _2415 = _2383 * _2383;
        _2098 = _2415;
    }
    float _2417 = _2098;
    if (_2078)
    {
        float _2419 = fma(_2259, as_type<float>(_2293), _2389);
        _2281 = _2419;
    }
    float _2421 = _2281;
    if (!_2225)
    {
        int _2423 = int(_2299) << 2;
        _2327 = _2423;
    }
    int _2425 = _2327;
    float _2427 = sqrt(_2000);
    float _2429 = fma(_1888, _2173, _2385);
    float _2431 = fma(_2421, _2421, _2411);
    int _2433 = _2425;
    if (!_2225)
    {
        int _2435 = 12 & _2425;
        _2433 = _2435;
    }
    int _2437 = _2433;
    float _2439 = _2028 * _2207;
    float _2441 = _2431 + _2417;
    if (!_2225)
    {
        int _2443 = _2369 << 4;
        int _2445 = _2443 + _2437;
        _2413 = _2445;
    }
    int _2447 = _2413;
    float _2449 = _2429 + _2181;
    float _2451 = fma(_1894, _2199, _2439);
    float _2453 = rsqrt(_2441);
    float _2455 = _2028 * _2243;
    float _2457 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2225)
    {
        float _2459 = -_2341;
        float _2461 = _2084 + _2459;
        _2100 = _2461;
    }
    float _2463 = _2100;
    float _2465 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2467 = fma(_1894, _2235, _2455);
    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2471 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2469);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2457);
    float _2477 = 1.0 / _2449;
    float _2479 = _2028 * _2277;
    float _2481 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2483 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2475);
    float _2485 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2465);
    float _2487 = fma(_1894, _2269, _2479);
    float _2489 = -_2473;
    float _2491 = _2489 + 1.0;
    float _2493 = _2483 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2495 = _2453 * _2379;
    float _2497 = fma(_1888, _2313, _2451);
    float _2499 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2501 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2503 = _2497 + _2321;
    float _2505 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2507 = _2453 * _2421;
    float _2509 = -_2499;
    float _2511 = fma(_2509, _2481, 1.0);
    float _2513 = fma(_1888, _2355, _2467);
    float _2515 = _2453 * _2383;
    float _2517 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2505);
    float _2519 = abs(_2491);
    float _2521 = log2(_2519);
    float _2523 = _2503 * _2477;
    float _2525 = _2513 + _2363;
    float _2527 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2517);
    float _2529 = _2513;
    if (!_2225)
    {
        int _2531 = _2447 + 400;
        uint _2533 = uint(int(uint(_2531) >> uint(2)));
        uint _2535 = uint(int(uint(int(_2533)) >> uint(2)));
        int _2537 = int(_2533) & 3;
        float _2539 = (*spvDescriptorSet0.vp_c15)._m0[int(_2535)][_2537];
        _2529 = _2539;
    }
    float _2541 = _2529;
    float _2543 = fma(_1888, _2399, _2487);
    float _2545 = -_2501;
    float _2547 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2545);
    float _2549 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2551 = _2523 >= 0.0;
    float _2553 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2555 = -_2515;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2547);
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2561 = _2525 * _2477;
    float _2563 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2553);
    float _2565 = fma(_2557, -0.5, 0.5);
    bool _2567 = _2523 <= 1.0;
    bool _2569 = _2567 && _2551;
    float _2571 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2573 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2563);
    float _2575 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2485);
    bool _2577 = _2561 >= 0.0;
    bool _2579 = _2577 && _2569;
    float _2581 = exp2(_2571);
    float _2583 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2585 = fma(_2557, 0.5, 0.5);
    float _2587 = _2575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2589 = _2561 <= 1.0;
    bool _2591 = _2589 && _2579;
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2559);
    float _2595 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2597 = sqrt(_2565);
    float _2599 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2593);
    float _2601 = _2507 + 1.0;
    float _2603 = _2543 + _2407;
    float _2605 = fma(_2585, _2595, -0.212114393711090087890625);
    float _2607 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2599);
    float _2609 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2611 = _2603 * _2477;
    float _2613 = -_2507;
    float _2615 = fma(_2581, _2601, _2613);
    float _2617 = _2363;
    float _2619 = _2561;
    if (!_2225)
    {
        float _2621 = floor(_2054);
        _2617 = _2621;
    }
    float _2623 = _2617;
    float _2625 = fma(_2585, _2605, 1.570728778839111328125);
    float _2627 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_2591)
    {
        float _2629 = float(_2112);
        _2118 = _2629;
    }
    float _2631 = _2118;
    float _2633 = fma(_2615, 0.5, 0.5);
    float _2635 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2627);
    float _2637 = _2597 * 0.636619746685028076171875;
    float _2639 = 1.0 / _2607;
    float _2641 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2609);
    float _2643 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2635);
    float _2645 = -_2625;
    float _2647 = fma(_2637, _2645, 1.0);
    float _2649 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2641);
    float _2651 = log2(_2511);
    float _2653 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2649);
    float _2655 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2643);
    float _2657 = _2623;
    if (!_2225)
    {
        float _2659 = -_2623;
        float _2661 = _2054 + _2659;
        _2657 = _2661;
    }
    float _2663 = _2657;
    float _2665 = _2641;
    if (_2591)
    {
        float _2667 = rint(_2631);
        float _2669 = precise::max(_2667, 0.0);
        uint _2671 = uint(_2669);
        uint _2673 = clamp(_2671, 0u, 65535u);
        _2665 = as_type<float>(_2673);
    }
    float _2675 = _2665;
    float _2677 = _2653 * _2639;
    float _2679 = _2651 * 0.693147182464599609375;
    float _2681 = _2655 * _2639;
    float _2683 = fma(_2677, 0.5, 0.5);
    float _2685 = _2541;
    if (!_2225)
    {
        float _2687 = rint(_2541);
        float _2689 = precise::max(_2687, 0.0);
        uint _2691 = uint(_2689);
        uint _2693 = clamp(_2691, 0u, 65535u);
        _2685 = as_type<float>(_2693);
    }
    float _2695 = _2685;
    float2 _7667 = float2(_2044, _2303);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7667, float2(0.0), isnan(_7667)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7667, float2(0.0), isnan(_7667)), level(0.0)).x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2701 = fma(_2681, -0.5, 0.5);
    float _2703 = _2679;
    if (_2591)
    {
        float3 _7689 = float3(_2523, _2561, float(as_type<int>(_2675)));
        float3 _7693 = select(_7689, float3(0.0), isnan(_7689));
        float _2705 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7693.xy, uint(rint(_7693.z)), _2611, level(0.0));
        _2703 = _2705;
    }
    float _2707 = _2703;
    float3 _7703 = float3(_2683, _2701, _2699);
    float _2709 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7703, float3(0.0), isnan(_7703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7703, float3(0.0), isnan(_7703)), level(0.0)).x;
    float3 _7712 = float3(_2683, _2701, _2699);
    float4 _2712 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7712, float3(0.0), isnan(_7712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7712, float3(0.0), isnan(_7712)), level(0.0)).xyzw;
    float _2714 = _2712.x;
    float _2716 = _2712.y;
    float _2718 = _2712.z;
    float _2720 = _2712.w;
    float2 _7728 = float2(_2647, _2633);
    float3 _2724 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7728, float2(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7728, float2(0.0), isnan(_7728)), level(0.0)).xyz;
    float _2726 = _2724.x;
    float _2728 = _2724.y;
    float _2730 = _2724.z;
    float _2732 = _2463;
    int _2734 = as_type<int>(_2695);
    if (!_2225)
    {
        float3 _7751 = float3(_2663, _2463, float(as_type<int>(_2695)));
        float3 _7753 = select(_7751, float3(0.0), isnan(_7751));
        float _2736 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7753.xy, uint(rint(_7753.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7753.xy, uint(rint(_7753.z)), level(0.0)).x;
        _2732 = _2736;
    }
    float _2738 = _2732;
    float _2740 = in.m_69.x;
    float _2742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2744 = _746 > 0.5;
    float _2746 = in.m_69.y;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2750 = _2748 != 0;
    float _2752 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2756 = _2754 != 0;
    float _2758 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2760 = _944 > 0.5;
    float _2762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2764 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2752);
    float _2766 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2764);
    int _2768 = as_type<int>(_2683);
    if (_2750)
    {
        float _2770 = in.m_65.z;
        _2768 = as_type<int>(_2770);
    }
    int _2772 = _2768;
    float _2774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2756)
    {
        bool _2776 = _756 > 0.5;
        _1428 = _2776;
    }
    bool _2778 = _1428;
    float _2780 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2766);
    float _2782 = _2740;
    if (_2756)
    {
        float _2784 = -_2740;
        float _2786 = _2784 + 1.0;
        _2734 = as_type<int>(_2786);
    }
    int _2788 = _2734;
    if (!_2756)
    {
        _2619 = _2740;
    }
    float _2790 = _2619;
    float _2792 = _2790;
    if (_2750)
    {
        float _2794 = -_2740;
        float _2796 = _2794 + 1.0;
        _872 = as_type<int>(_2796);
    }
    int _2798 = _872;
    float _2800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2802 = -_2746;
    float _2804 = _2802 + 1.0;
    float _2806 = _2746;
    if (_2756)
    {
        float _2808 = _2778 ? as_type<float>(_2788) : _2740;
        _2792 = _2808;
    }
    float _2810 = _2792;
    out.gl_Position.x = _2653;
    out.gl_Position.y = _2655;
    out.gl_Position.z = _2780;
    out.gl_Position.w = _2607;
    int _2812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2814 = _2812 != 0;
    int _2816 = _2744 ? as_type<int>(_2804) : as_type<int>(_2746);
    float _2818 = _2810 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2822 = _2820 != 0;
    float _2824 = abs(_2058);
    float _2826 = log2(_2824);
    float _2828 = _2814 ? as_type<float>(_2816) : _2746;
    int _2830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2832 = _2830 != 0;
    int _2834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2836 = _2834 != 0;
    float _2838 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2840 = _2760 ? as_type<int>(_2804) : as_type<int>(_2746);
    float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2844 = _2822;
    float _2846 = _2838;
    if (!_2750)
    {
        _2102 = _2740;
    }
    float _2848 = _2102;
    float _2850 = _2818 * _2742;
    float _2852 = _2836 ? as_type<float>(_2840) : _2746;
    bool _2854 = _748 > 0.5;
    bool _2856 = _2058 <= 8000.0;
    bool _2858 = isnan(_2058);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan(8000.0);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2870 = _2848;
    float _2872 = _2850;
    if (_2822)
    {
        float _2874 = _2854 ? _2804 : _2746;
        _2806 = _2874;
    }
    float _2876 = _2806;
    float _2878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2880 = _2772;
    if (_2750)
    {
        bool _2882 = as_type<float>(_2772) > 0.5;
        _2844 = _2882;
    }
    bool _2884 = _2844;
    if (_2832)
    {
        float _2886 = -_2740;
        float _2888 = _2886 + 1.0;
        _2880 = as_type<int>(_2888);
    }
    int _2890 = _2880;
    float _2892 = _2876 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2750)
    {
        float _2894 = _2884 ? as_type<float>(_2798) : _2740;
        _2870 = _2894;
    }
    float _2896 = _2870;
    if (_2832)
    {
        float _2898 = _2760 ? as_type<float>(_2890) : _2740;
        _2782 = _2898;
    }
    float _2900 = _2782;
    float _2902 = _2852 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2904 = _2892 * _2800;
    float _2906 = in.m_71.x;
    float _2908 = in.m_71.y;
    float _2910 = in.m_71.z;
    float _2912 = exp2(_2868);
    float _2914 = _2902 * _2762;
    bool _2916 = _1776 != 0.0;
    bool _2918 = isnan(_1776);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan(0.0);
    bool _2924 = _2920 || _2922;
    float _2926 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2928 = _2896 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2930 = _2838 * _2878;
    bool _2932 = _1788 == 0.0;
    bool _2934 = !_2924;
    bool _2936 = _2932 && _2934;
    float _2938 = _2926 * _2842;
    float _2940 = in.m_73.x;
    float _2942 = in.m_73.y;
    float _2944 = in.m_73.z;
    float _2946 = in.m_73.w;
    bool _2948 = _1780 == 0.0;
    bool _2950 = _2948 && _2936;
    float _2952 = _2928 * _2774;
    out.m_75.x = _2938;
    out.m_75.y = _2930;
    float _2954 = exp2(_2758);
    float _2956 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    out.m_77.x = _2850;
    out.m_77.y = _2914;
    out.m_77.z = _2952;
    out.m_77.w = _2904;
    float _2960 = fma(_2958, -2.0, 3.0);
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (_2950)
    {
        _2846 = _2906;
    }
    float _2964 = _2846;
    float _2966 = _2964;
    if (!_2950)
    {
        float _2968 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2906);
        _2966 = _2968;
    }
    float _2970 = _2966;
    if (_2950)
    {
        _2962 = _2908;
    }
    float _2972 = _2962;
    float _2974 = _2972;
    if (!_2950)
    {
        float _2976 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2974 = _2976;
    }
    float _2978 = _2974;
    float _2980 = -_2954;
    float _2982 = _2980 + 1.0;
    float _2984 = _2958 * _2958;
    if (_2950)
    {
        _2872 = _2910;
    }
    float _2986 = _2872;
    float _2988 = _2944 * _2906;
    float _2990 = _2986;
    if (!_2950)
    {
        float _2992 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2910);
        _2990 = _2992;
    }
    float _2994 = _2990;
    float _2996 = _2984 * _2960;
    float _2998 = _2940 * _2908;
    float _3000 = -_2988;
    float _3002 = fma(_2940, _2910, _3000);
    float _3004 = _2942 * _2910;
    float _3006 = -_2942;
    float _3008 = _1802 * _3006;
    float _3010 = _1832 * _2942;
    float _3012 = _1808 * _2942;
    float _3014 = -_2998;
    float _3016 = fma(_2942, _2906, _3014);
    float _3018 = fma(_1828, _2940, _3008);
    float _3020 = fma(_1850, _2940, _3010);
    float _3022 = -_3004;
    float _3024 = fma(_2944, _2908, _3022);
    float _3026 = _3002 * _2946;
    float _3028 = fma(_1836, _2940, _3012);
    float _3030 = fma(_1830, _2944, _3018);
    float _3032 = fma(_1854, _2944, _3020);
    float _3034 = -_2978;
    float _3036 = _1802 * _3034;
    float _3038 = _1832 * _2978;
    float _3040 = _1808 * _2978;
    float _3042 = _3024 * _2946;
    float _3044 = -_3026;
    float _3046 = _1802 * _3044;
    float _3048 = _1832 * _3026;
    float _3050 = _1808 * _3026;
    float _3052 = _3016 * _2946;
    float _3054 = fma(_1828, _3042, _3046);
    float _3056 = fma(_1850, _3042, _3048);
    float _3058 = fma(_1836, _3042, _3050);
    float _3060 = -_2996;
    float _3062 = _3060 + 1.0;
    float _3064 = fma(_1830, _3052, _3054);
    float _3066 = fma(_1854, _3052, _3056);
    float _3068 = fma(_1842, _3052, _3058);
    float _3070 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2996);
    float _3072 = fma(_1842, _2944, _3028);
    float _3074 = fma(_1828, _2970, _3036);
    float _3076 = fma(_1850, _2970, _3038);
    float _3078 = _2866 * _3070;
    out.m_79.x = _3064;
    out.m_79.y = _3066;
    out.m_79.z = _3068;
    float _3080 = fma(_1836, _2970, _3040);
    float _3082 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _3030;
    out.m_81.y = _3032;
    out.m_81.z = _3072;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3086 = _3064;
    if (!_2591)
    {
        _3086 = 1.0;
    }
    float _3088 = _3086;
    float _3090 = fma(_1830, _2994, _3074);
    float _3092 = fma(_1854, _2994, _3076);
    float _3094 = fma(_1842, _2994, _3080);
    float _3096 = -_2697;
    float _3098 = _3096 + 1.0;
    float _3100 = _3098 * _3084;
    float _3102 = precise::clamp(_3100, 0.0, 1.0);
    float _3104 = _3088;
    float _3106 = _3098;
    if (_2591)
    {
        bool _3108 = _2707 >= _2611;
        bool _3110 = isnan(_2707);
        bool _3112 = _3108 || _3110;
        bool _3114 = isnan(_2611);
        bool _3116 = _3112 || _3114;
        float _3118 = float(_3116);
        _3104 = _3118;
    }
    float _3120 = _3104;
    if (_2225)
    {
        _3106 = 1.0;
    }
    float _3122 = _3106;
    float _3124 = _3122;
    if (!_2225)
    {
        int _3126 = int(_2299) << 4;
        int _3128 = _3126 + 2048;
        uint _3130 = uint(int(uint(_3128) >> uint(2)));
        uint _3132 = uint(int(uint(int(_3130)) >> uint(2)));
        int _3134 = int(_3130) & 3;
        float _3136 = (*spvDescriptorSet0.vp_c15)._m0[int(_3132)][_3134];
        int _3138 = int(_3130) + 1;
        uint _3140 = uint(int(uint(_3138) >> uint(2)));
        int _3142 = _3138 & 3;
        float _3144 = (*spvDescriptorSet0.vp_c15)._m0[int(_3140)][_3142];
        int _3146 = _3128 + 8;
        uint _3148 = uint(int(uint(_3146) >> uint(2)));
        uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
        int _3152 = int(_3148) & 3;
        float _3154 = (*spvDescriptorSet0.vp_c15)._m0[int(_3150)][_3152];
        int _3156 = int(_3148) + 1;
        uint _3158 = uint(int(uint(_3156) >> uint(2)));
        int _3160 = _3156 & 3;
        float _3162 = (*spvDescriptorSet0.vp_c15)._m0[int(_3158)][_3160];
        float _3164 = _2028 * _3144;
        float _3166 = fma(_1894, _3136, _3164);
        float _3168 = fma(_1888, _3154, _3166);
        float _3170 = _3168 + _3162;
        float _3172 = precise::clamp(_3170, 0.0, 1.0);
        float _3174 = -_3172;
        float _3176 = _3174 + _2738;
        float _3178 = fma(_3176, 500.0, 1.5);
        float _3180 = exp2(_3178);
        float _3182 = 0.0 + _3180;
        float _3184 = precise::clamp(_3182, 0.0, 1.0);
        _3124 = _3184;
        _1904 = _3180;
        _2329 = as_type<float>(_3128);
    }
    float _3186 = _3124;
    float _3188 = _1904;
    float _3190 = _2329;
    float _3192 = _3120 * _3186;
    float _3194 = _3082 * _2709;
    float _3196 = -_3102;
    float _3198 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3200 = -_3082;
    float _3202 = _3200 + 1.0;
    out.m_83.x = _3090;
    out.m_83.y = _3092;
    out.m_83.z = _3094;
    float _3204 = _2720 * _3194;
    float _3206 = -_3192;
    float _3208 = fma(_3206, _3198, 1.0);
    float _3210 = precise::clamp(_3208, 0.0, 1.0);
    float _3212 = _2730 * _3194;
    float _3214 = _2720 * _3202;
    float _3216 = fma(_2726, _3204, _2714);
    float _3218 = fma(_2728, _3204, _2716);
    float _3220 = _3210 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3222 = fma(_2720, _3212, _2718);
    out.m_85.x = _1970;
    out.m_85.y = _1966;
    out.m_85.z = _1976;
    bool _3224 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3226 = isnan(_2427);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3232 = _3228 || _3230;
    out.m_87.x = _3220;
    out.m_89.x = _3216;
    out.m_89.y = _3218;
    out.m_89.z = _3222;
    out.m_89.w = _3214;
    float _3234 = _3210;
    float _3236 = _3212;
    float _3238 = _3190;
    float _3240 = _3188;
    float _3242 = _3204;
    if (!_3232)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3244 = _3234;
    float _3246 = _3244;
    float _3248 = _3244;
    if (!_3232)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3250 = _3236;
    float _3252 = _3250;
    float _3254 = _3250;
    if (!_3232)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3256 = _1906;
    float _3258 = _3256;
    float _3260 = _3256;
    if (!_3232)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3262 = _3238;
    float _3264 = _3262;
    float _3266 = _3262;
    if (!_3232)
    {
        _3240 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3268 = _3240;
    float _3270 = _3268;
    float _3272 = _3268;
    if (!_3232)
    {
        _3242 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3274 = _3242;
    bool _3276 = !_3232;
    float _3278 = _3274;
    float _3280 = _3274;
    if (!_3276)
    {
        bool _3282 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3284 = isnan(_2427);
        bool _3286 = _3282 || _3284;
        bool _3288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3290 = _3286 || _3288;
        if (!_3290)
        {
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3294 = _2427 + _3292;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3298 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3296;
            float _3300 = 1.0 / _3298;
            float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3322 = _3294 * _3300;
            float _3324 = precise::clamp(_3322, 0.0, 1.0);
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3330 = fma(_3324, _3304, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3332 = fma(_3324, _3328, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3334 = fma(_3324, _3308, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3336 = fma(_3324, _3312, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3338 = fma(_3324, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3340 = fma(_3324, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3254 = _3332;
            _3272 = _3338;
            _3248 = _3330;
            _3266 = _3336;
            _3260 = _3334;
            _3280 = _3340;
            _3342 = true;
        }
        else
        {
            bool _3344 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3346 = isnan(_2427);
            bool _3348 = _3344 || _3346;
            bool _3350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3352 = _3348 || _3350;
            if (!_3352)
            {
                _3246 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3354 = _3246;
            _3248 = _3354;
            if (!_3352)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3356 = _3252;
            _3254 = _3356;
            if (!_3352)
            {
                _3258 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3358 = _3258;
            _3260 = _3358;
            if (!_3352)
            {
                _3264 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3360 = _3264;
            _3266 = _3360;
            if (!_3352)
            {
                _3270 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3362 = _3270;
            _3272 = _3362;
            if (!_3352)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3364 = _3278;
            bool _3366 = !_3352;
            _3280 = _3364;
            if (!_3366)
            {
                bool _3368 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3370 = isnan(_2427);
                bool _3372 = _3368 || _3370;
                bool _3374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3376 = _3372 || _3374;
                if (!_3376)
                {
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3380 = _2427 + _3378;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3382;
                    float _3386 = 1.0 / _3384;
                    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3390 = _3388 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3408 = _3380 * _3386;
                    float _3410 = precise::clamp(_3408, 0.0, 1.0);
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3416 = fma(_3410, _3390, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3418 = fma(_3410, _3414, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3420 = fma(_3410, _3394, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3422 = fma(_3410, _3398, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3424 = fma(_3410, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3426 = fma(_3410, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3254 = _3418;
                    _3272 = _3424;
                    _3248 = _3416;
                    _3266 = _3422;
                    _3260 = _3420;
                    _3280 = _3426;
                    _3342 = true;
                }
                else
                {
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3272 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3248 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3266 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3260 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3342 = false;
    float _3428 = _3254;
    float _3430 = _3272;
    float _3432 = _3248;
    float _3434 = _3266;
    float _3436 = _3260;
    float _3438 = _3280;
    float _3440 = fma(_3092, -0.5, 0.5);
    float _3442 = precise::clamp(_3440, 0.0, 1.0);
    float _3444 = -_3428;
    float _3446 = _3444 + _3430;
    float _3448 = -_3432;
    float _3450 = _3448 + _3434;
    float _3452 = -_3436;
    float _3454 = _3452 + _3438;
    bool _3456 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3458 = fma(_3442, _3446, _3428);
    float _3460 = fma(_3442, _3450, _3432);
    float _3462 = fma(_3442, _3454, _3436);
    float _3464 = _3458 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3466 = fma(_3460, 0.298911988735198974609375, _3464);
    float _3468 = fma(_3462, 0.114477999508380889892578125, _3466);
    out.m_91.x = 0.0;
    float _3470 = -_3468;
    float _3472 = _3460 + _3470;
    float _3474 = -_3468;
    float _3476 = _3458 + _3474;
    float _3478 = -_3468;
    float _3480 = _3462 + _3478;
    float _3482 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3484 = fma(_3472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    float _3486 = fma(_3476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    float _3488 = fma(_3480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    out.m_87.w = _3482;
    out.m_93.x = _3484;
    out.m_93.y = _3486;
    out.m_93.z = _3488;
    if (!_3456)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3490 = -_1966;
    float _3492 = _3490 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3494 = -_1970;
    float _3496 = _3494 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3498 = -_1976;
    float _3500 = _3498 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3502 = _3492 * _3492;
    float _3504 = fma(_3496, _3496, _3502);
    float _3506 = fma(_3500, _3500, _3504);
    float _3508 = sqrt(_3506);
    float _3510 = rsqrt(_3506);
    float _3512 = -_3508;
    float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3516 = _3514 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3518 = precise::clamp(_3516, 0.0, 1.0);
    float _3520 = _3496 * _3510;
    float _3522 = _3492 * _3510;
    float _3524 = abs(_3518);
    float _3526 = log2(_3524);
    float _3528 = _3500 * _3510;
    float _3530 = _3520 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3532 = _3092 * _3522;
    float _3534 = -_3522;
    float _3536 = -_3530;
    float _3538 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3536);
    float _3540 = fma(_3090, _3520, _3532);
    float _3542 = -_3528;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3538);
    float _3546 = fma(_3094, _3528, _3540);
    float _3548 = precise::clamp(_3546, 0.0, 1.0);
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3552 = _3544 + _3550;
    float _3554 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3556 = _3552 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3558 = precise::clamp(_3556, 0.0, 1.0);
    float _3560 = exp2(_3554);
    float _3562 = _3560 * _3558;
    float _3564 = _3548 * _3562;
    float _3566 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3568 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3570 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3566;
    out.m_91.y = _3568;
    out.m_91.z = _3570;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3342 = false;
    bool _742 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_56.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_59.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3628 = as_type<float>(_128);
        out.gl_Position.z = _3628;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_61.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _138;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    float _160 = _158;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _162 = _158 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3693 = as_type<float>(_164);
        out.gl_Position.z = _3693;
    }
    if (_154)
    {
        return out;
    }
    float _166 = in.m_63.w;
    float _168 = 1.0 / _134;
    float _170 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_61.x;
    float _184 = in.m_61.y;
    float _186 = in.m_61.z;
    float _188 = in.m_56.x;
    float _190 = in.m_56.y;
    float _192 = in.m_56.z;
    float _194 = _170;
    if (!_180)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _160 = _198;
    }
    float _200 = _160;
    float _202 = _200;
    if (!_180)
    {
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_180;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _170 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _170);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_180;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _170 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _194 = _264;
    }
    float _266 = _194;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _276 = _138 * _168;
    float _278 = fma(_266, _182, _270);
    float _280 = fma(_266, _184, _272);
    float _282 = fma(_266, _186, _274);
    float _284 = fma(_278, _166, _188);
    float _286 = fma(_280, _166, _190);
    float _288 = fma(_282, _166, _192);
    bool _290 = !_268;
    float _308;
    if (!_290)
    {
        float _292 = in.m_65.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _276;
    }
    _310 = false;
    float _312 = _308;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _312 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = _312 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _338;
    float _342 = 1.0 / _332;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _348;
    float _352 = 1.0 / _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = _312 + _354;
    bool _358 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _360 = isnan(_312);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    bool _370 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _372 = isnan(_312);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _336;
    float _384 = _356 * _342;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _388 = _312 + _386;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _392 = 1.0 / _340;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _396 = _312 + _394;
    float _398 = _316 * _352;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _402 = _312 + _400;
    float _404 = 1.0 / _350;
    float _406 = _396 * _382;
    bool _408 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _410 = isnan(_312);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _312 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    float _428 = 1.0 / _324;
    float _430 = _388 * _392;
    bool _432 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _434 = isnan(_312);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_426, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = 1.0 / _346;
    bool _448 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _450 = isnan(_312);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _402 * _404;
    bool _462 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _464 = isnan(_312);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_458;
    float _476 = _474 + 1.0;
    float _478 = _320 * _428;
    float _480 = -_418;
    float _482 = _480 + 1.0;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = _418 * _476;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _490;
    float _494 = _442 * _482;
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = _422 * _446;
    float _502 = -_442;
    float _504 = _502 + 1.0;
    float _506 = fma(_486, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _508 = fma(_492, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _510 = _368 * _498;
    float _512 = _472 * _504;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = -_368;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _530 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _532 = isnan(_312);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = fma(_520, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _544 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _546 = isnan(_312);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = fma(_516, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_528, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = -_540;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _564;
    float _568 = _554 * _524;
    float _570 = -_554;
    float _572 = _570 + 1.0;
    float _574 = _380 * _562;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    float _580 = _540 * _572;
    float _582 = _506 * _574;
    float _584 = _508 * _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = _444 * _574;
    float _592 = fma(_578, _478, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _598 = -_380;
    float _600 = _598 + 1.0;
    float _602 = fma(_588, _478, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _612 = fma(_596, _398, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _616 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _584);
    float _618 = fma(_606, _398, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _622 = fma(_610, _398, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _624 = fma(_542, _580, _614);
    float _626 = fma(_566, _478, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = fma(_556, _580, _616);
    float _630 = fma(_558, _580, _620);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _632;
    float _636 = fma(_602, _568, _624);
    float _638 = fma(_592, _568, _628);
    float _640 = fma(_626, _568, _630);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _658;
    float _662 = fma(_634, _430, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _664 = fma(_612, _510, _636);
    float _666 = fma(_644, _430, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _668 = fma(_648, _500, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _670 = fma(_652, _500, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _672 = fma(_656, _500, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _674 = fma(_618, _510, _638);
    float _676 = fma(_622, _510, _640);
    float _678 = fma(_660, _430, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _680 = fma(_662, _512, _664);
    float _682 = fma(_666, _512, _674);
    float _684 = fma(_678, _512, _676);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _686;
    float _690 = fma(_668, _494, _680);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _692;
    float _696 = fma(_670, _494, _682);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _698;
    float _702 = fma(_688, _460, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _704 = fma(_694, _460, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _706 = fma(_672, _494, _684);
    float _708 = fma(_700, _460, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _710 = fma(_702, _488, _690);
    float _712 = fma(_704, _488, _696);
    float _714 = fma(_708, _488, _706);
    float _716 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].x, _710);
    float _718 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].y, _712);
    float _720 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].z, _714);
    bool _722 = !_390;
    float _740;
    if (!_722)
    {
        float _724 = in.m_65.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _276;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_65.z;
    float _748 = in.m_65.w;
    float _750 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _752 = log2(_750);
    float _754 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _756 = in.m_65.x;
    float _758 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _760 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _764 = _762 != 0;
    float _766 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _754);
    float _768 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _758);
    float _770 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _778 = _776 != 0;
    float _780 = _138 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _794 = _276 * 3.1415927410125732421875;
    float _796 = _752 * _138;
    float _798 = in.m_67.x;
    float _800 = in.m_67.y;
    float _802 = in.m_67.z;
    bool _804 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _806 = isnan(1.0);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _812 = _808 || _810;
    float _814 = exp2(_796);
    float _816 = _746 * 2.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _820 = 1.0 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _826 = _756 * 2.0;
    float _828 = floor(_816);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _834;
    float _838 = 1.0 / _820;
    float _840 = -_814;
    float _842 = _840 + 1.0;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _856 = _790 ? _842 : 0.0;
    float _858 = floor(_826);
    bool _860 = _828 > 0.0;
    bool _862 = _828 >= 0.0;
    bool _864 = isnan(_828);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    int _872 = as_type<int>(_746);
    if (_812)
    {
        float _874 = _856 * _838;
        _156 = _874;
    }
    float _876 = _156;
    int _878 = _870 ? 0 : 1;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _884 = 1.0 / _824;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _896 = _894 != 0;
    int _898 = ~_878;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    int _904 = _902;
    bool _906 = _764;
    float _908 = _876;
    if (!_860)
    {
        int _910 = ~_878;
        int _912 = _910 + 1;
        _904 = _912;
    }
    int _914 = _904;
    float _916 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _918 = _858 >= 0.0;
    bool _920 = isnan(_858);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = 1.0 / _832;
    float _930 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _916);
    int _932 = _926 ? 0 : 1;
    float _934 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _940 = _858 > 0.0;
    float _942 = 1.0 / _882;
    float _944 = in.m_65.y;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _950 = _934 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _952 = ~_932;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = 1.0 / _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _964 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _766);
    float _966 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _770);
    int _968 = _956;
    float _970 = _950;
    if (!_940)
    {
        int _972 = ~_932;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    bool _978 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _980 = isnan(_744);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = 1.0 / _938;
    float _992 = _850 * _942;
    float _994 = float(_914);
    float _996 = float(_976);
    float _998 = 1.0 / _962;
    float _1000 = _846 * _958;
    float _1002 = _944 * 2.0;
    float _1004 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _1006 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _1008 = precise::max(_1004, _1006);
    float _1010 = floor(_1002);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1016 = _1008 >= 16.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1018;
    float _1022 = _854 * _990;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1028 = _1020 * _928;
    float _1030 = 1.0 / _1014;
    float _1032 = _944 + _746;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1034;
    float _1038 = _836 * _998;
    bool _1040 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1042 = isnan(_744);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = _1026 * _884;
    bool _1054 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1056 = isnan(_744);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1068 = isnan(_744);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1032 + (-1.0);
    bool _1080 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1082 = isnan(_744);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1094 = _756 + _746;
    float _1096 = -_1090;
    float _1098 = _1096 + 1.0;
    float _1100 = _1036 * _1030;
    float _1102 = _756 + _944;
    float _1104 = _1094 + (-1.0);
    float _1106 = _1050 * _1098;
    float _1108 = -_1050;
    float _1110 = _1108 + 1.0;
    float _1112 = _1102 + (-1.0);
    float _1114 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1116 = !_888;
    int _1118 = _1116 ? 0 : 1;
    float _1120 = _1064 * _1110;
    bool _1122 = _1010 >= 0.0;
    bool _1124 = isnan(_1010);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1134 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1136 = isnan(_744);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1064;
    float _1148 = _1146 + 1.0;
    int _1150 = _1130 ? 0 : 1;
    bool _1152 = _1010 > 0.0;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1156 = _744 + _1154;
    float _1158 = -_1144;
    float _1160 = _1158 + 1.0;
    bool _1162 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1164 = isnan(_744);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = _1076 * _1148;
    float _1176 = fma(_1028, _1156, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1178 = -_1076;
    float _1180 = _1178 + 1.0;
    float _1182 = _988 * _1160;
    bool _1184 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1186 = isnan(_744);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = -_1172;
    float _1198 = _1196 + 1.0;
    float _1200 = _1144 * _1180;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1204 = _744 + _1202;
    float _1206 = -_988;
    float _1208 = _1206 + 1.0;
    float _1210 = _1194 * _1198;
    float _1212 = -_1194;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1052, _1204, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1220 = _744 + _1218;
    float _1222 = _1172 * _1208;
    float _1224 = _1176 * _1210;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1228 = _744 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1232 = _744 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1236 = _744 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1240 = _744 + _1238;
    float _1242 = fma(_992, _1220, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1244 = fma(_1022, _1228, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1246 = fma(_1038, _1232, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1248 = fma(_1100, _1240, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1250 = abs(_1118);
    float _1252 = _876 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _1254 = !_892;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1224);
    float _1260 = fma(_1000, _1236, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1262 = _1252 * _792;
    int _1264 = abs(_1256);
    float _1266 = fma(_1216, _1222, _1258);
    float _1268 = float(_1250);
    float _1270 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1262);
    bool _1272 = !_896;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = fma(_1242, _1182, _1266);
    int _1278 = ~_1150;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = _1268 * _994;
    float _1286 = _1270 + 0.25;
    float _1288 = floor(_1270);
    int _1290 = _1282;
    if (!_1152)
    {
        int _1292 = ~_1150;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = fma(_1244, _1200, _1276);
    int _1300 = abs(_1274);
    float _1302 = _1284 * (-2.0);
    float _1304 = float(_1296);
    float _1306 = fma(_1246, _1174, _1298);
    float _1308 = float(_1300);
    float _1310 = floor(_1286);
    float _1312 = _794 * 0.15915493667125701904296875;
    float _1314 = fma(_1132, _1302, _1132);
    float _1316 = fma(_1260, _1120, _1306);
    float _1318 = _1308 * _1304;
    float _1320 = _780 * 0.15915493667125701904296875;
    float _1322 = _756 + (-0.5);
    float _1324 = -_1288;
    float _1326 = _1270 + _1324;
    float _1328 = _1318 * (-2.0);
    float _1330 = _1270 * 6.283185482025146484375;
    float _1332 = _1312 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = float(_1264);
    float _1338 = fma(_1114, _1328, _1114);
    bool _1340 = _1326 >= 0.5;
    bool _1342 = isnan(_1326);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(0.5);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1248, _1106, _1316);
    bool _1352 = !_774;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = -_1310;
    float _1358 = _1286 + _1356;
    float _1360 = _1330 * 0.15915493667125701904296875;
    float _1362 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1364 = abs(_1354);
    float _1366 = _1336 * _996;
    float _1368 = fma(_1314, _876, _1362);
    float _1370 = _1360 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = float(_1364);
    float _1376 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1378 = !_1348;
    float _1380 = _1378 ? 0.5 : (-0.5);
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1384 = _950 + _1382;
    bool _1386 = _1358 > 0.5;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1390 = _1376 + _1388;
    float _1392 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1350);
    float _1394 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1396 = _1394 * 2.0;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[191].w + _1398;
    bool _1402 = !_764;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _1384 * _1384;
    float _1408 = _1374 * _1396;
    float _1410 = _1320 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    int _1414 = abs(_1404);
    float _1416 = _966 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1418 = fma(_1390, _1390, _1406);
    bool _1420 = !_778;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = _1358;
    float _1426 = _1416;
    bool _1428 = _1348;
    if (_1386)
    {
        float _1430 = -_1358;
        float _1432 = _1430 + 1.0;
        _1424 = _1432;
    }
    float _1434 = _1424;
    float _1436 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1440 = _1416 + _1438;
    float _1442 = fma(_1434, 4.0, -1.0);
    float _1444 = float(_1414);
    float _1446 = fma(_1440, _1440, _1418);
    int _1448 = abs(_1422);
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1454 = fma(_1444, _1436, _1408);
    float _1456 = _746 + (-0.5);
    float _1458 = rsqrt(_1446);
    float _1460 = _1016 ? _1450 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1462 = _1368 * 0.15915493667125701904296875;
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1466 = float(_1448);
    float _1468 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1470 = fma(_1338, _876, _1464);
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1474 = _1412 * _1468;
    float _1476 = fma(_1466, _1452, _1454);
    float _1478 = _1462 * 6.283185482025146484375;
    float _1480 = sin(_1478);
    float _1482 = in.m_63.x;
    float _1484 = in.m_63.y;
    float _1486 = in.m_63.z;
    float _1488 = _1016 ? _1472 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1490 = _1470 * 0.15915493667125701904296875;
    float _1492 = abs(_1460);
    bool _1494 = _1492 == 0.0;
    float _1496 = _1384 * _1458;
    float _1498 = abs(_1488);
    bool _1500 = _1498 != 0.0;
    bool _1502 = isnan(_1498);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    float _1510 = _1366 * (-2.0);
    float _1512 = _1462 * 6.283185482025146484375;
    float _1514 = cos(_1512);
    float _1516 = _1390 * _1458;
    float _1518 = abs(_1460);
    bool _1520 = _1518 == 0.0;
    bool _1522 = !_1508;
    bool _1524 = _1520 && _1522;
    float _1526 = -_1496;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1384);
    float _1530 = _1476 * 3.1415927410125732421875;
    float _1532 = _944 + (-0.5);
    float _1534 = -_1516;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1538 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _930);
    float _1540 = 1.0 / _1400;
    float _1542 = _1474 * 0.15915493667125701904296875;
    float _1544 = _1528 * _1528;
    float _1546 = fma(_1530, _1510, _1530);
    float _1548 = _1440 * _1458;
    float _1550 = fma(_1092, _1510, _1092);
    float _1552 = fma(_1536, _1536, _1544);
    int _1554 = as_type<int>(_1544);
    if (_1524)
    {
        bool _1556 = as_type<int>(_1460) >= 0;
        _906 = _1556;
    }
    bool _1558 = _906;
    float _1560 = _1490 * 6.283185482025146484375;
    float _1562 = cos(_1560);
    float _1564 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1546);
    float _1566 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1568 = -_1548;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    int _1572 = _1558 ? (-1) : 0;
    if (_1524)
    {
        int _1574 = _1558 ? 0 : 1078530011;
        _1554 = _1574;
    }
    int _1576 = _1554;
    float _1578 = fma(_1550, _876, _1564);
    float _1580 = fma(_1570, _1570, _1552);
    float _1582 = _1542 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = -_1566;
    float _1588 = precise::max(_1586, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    int _1590 = _1576;
    if (_1524)
    {
        int _1592 = int(0x80000000) & as_type<int>(_1488);
        int _1594 = _1576 | _1592;
        _908 = as_type<float>(_1594);
    }
    float _1596 = _908;
    float _1598 = _1542 * 6.283185482025146484375;
    float _1600 = cos(_1598);
    bool _1602 = !_1508;
    bool _1604 = _1602 && _1494;
    float _1606 = _1596;
    float _1608 = _1596;
    if (!_1604)
    {
        float _1610 = abs(_1488);
        bool _1612 = _1610 != as_type<float>(0x7f800000u /* inf */);
        bool _1614 = isnan(_1610);
        bool _1616 = _1612 || _1614;
        bool _1618 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1620 = _1616 || _1618;
        float _1622 = abs(_1460);
        bool _1624 = _1622 == as_type<float>(0x7f800000u /* inf */);
        float _1626 = abs(_1460);
        bool _1628 = _1626 == as_type<float>(0x7f800000u /* inf */);
        bool _1630 = !_1620;
        bool _1632 = _1628 && _1630;
        if (_1632)
        {
            bool _1634 = as_type<int>(_1460) >= 0;
            _1572 = _1634 ? (-1) : 0;
        }
        int _1636 = _1572;
        if (_1632)
        {
            _1590 = 1075235812;
        }
        int _1638 = _1590;
        int _1640 = _1638;
        if (_1632)
        {
            int _1642 = ~_1636;
            int _1644 = (_1642 != 0) ? _1638 : 1061752795;
            _1640 = _1644;
        }
        int _1646 = _1640;
        if (_1632)
        {
            int _1648 = int(0x80000000) & as_type<int>(_1488);
            int _1650 = _1646 | _1648;
            _1606 = as_type<float>(_1650);
        }
        float _1652 = _1606;
        bool _1654 = !_1620;
        bool _1656 = _1654 && _1624;
        _1608 = _1652;
        if (!_1656)
        {
            float _1658 = abs(_1488);
            float _1660 = abs(_1460);
            float _1662 = precise::max(_1658, _1660);
            float _1664 = abs(_1488);
            float _1666 = abs(_1460);
            float _1668 = precise::min(_1664, _1666);
            float _1670 = 1.0 / _1662;
            float _1672 = abs(_1488);
            float _1674 = abs(_1460);
            bool _1676 = _1672 > _1674;
            bool _1678 = as_type<int>(_1460) >= 0;
            float _1680 = abs(_1488);
            float _1682 = abs(_1460);
            float _1684 = _1680 + _1682;
            int _1686 = as_type<int>(_1488) & int(0x80000000);
            bool _1688 = _1684 > as_type<float>(0x7f800000u /* inf */);
            bool _1690 = isnan(_1684);
            bool _1692 = _1688 || _1690;
            bool _1694 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1696 = _1692 || _1694;
            float _1698 = _1668 * _1670;
            float _1700 = _1698 * _1698;
            float _1702 = _1700 + 11.33538818359375;
            float _1704 = fma(_1700, _1702, 28.84246826171875);
            float _1706 = fma(_1700, _1704, 19.6966705322265625);
            float _1708 = fma(_1700, -0.82336294651031494140625, -5.674867153167724609375);
            float _1710 = fma(_1700, _1708, -6.565555095672607421875);
            float _1712 = 1.0 / _1706;
            float _1714 = _1700 * _1710;
            float _1716 = _1698 * _1714;
            float _1718 = fma(_1716, _1712, _1698);
            float _1720 = _1718;
            _1608 = _1684;
            if (_1676)
            {
                float _1722 = -_1718;
                float _1724 = _1722 + 1.57079637050628662109375;
                _1720 = _1724;
            }
            float _1726 = _1720;
            int _1728 = as_type<int>(_1726);
            if (!_1678)
            {
                float _1730 = -_1726;
                float _1732 = _1730 + 3.1415927410125732421875;
                _1728 = as_type<int>(_1732);
            }
            int _1734 = _1728;
            if (!_1696)
            {
                int _1736 = _1686 | _1734;
                _1608 = as_type<float>(_1736);
            }
        }
    }
    float _1738 = _1608;
    float _1740 = _1578 + _1738;
    float _1742 = sqrt(_1580);
    float _1744 = precise::min(_1588, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1746 = 0.0 + _1334;
    float _1748 = precise::clamp(_1746, 0.0, 1.0);
    float _1750 = _1740 * 0.15915493667125701904296875;
    float _1752 = _716 * _1482;
    float _1754 = _718 * _1484;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1758 = _1744 + _1756;
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1762 = _1750 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1768 = _1758 * _1540;
    float _1770 = _1584 * _798;
    float _1772 = _1600 * _798;
    float _1774 = _720 * _1486;
    float _1776 = fma(_1760, _1768, _800);
    float _1778 = -_1770;
    float _1780 = fma(_1600, _802, _1778);
    float _1782 = _1750 * 6.283185482025146484375;
    float _1784 = cos(_1782);
    float _1786 = _1458 * _1742;
    float _1788 = fma(_1584, _802, _1772);
    float _1790 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1776);
    float _1794 = _1786 * _1766;
    float _1796 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1798 = _1786 * _1790;
    float _1800 = _1490 * 6.283185482025146484375;
    float _1802 = sin(_1800);
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1788);
    float _1806 = _1792 * _1794;
    float _1808 = _1480 * _1562;
    float _1810 = _1514 * _1764;
    float _1812 = _1786 * _1796;
    float _1814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1780);
    float _1816 = _1804 * _1798;
    float _1818 = _1480 * _1784;
    float _1820 = _1808 * _1806;
    float _1822 = _1480 * _1764;
    float _1824 = _1514 * _1784;
    float _1826 = _1814 * _1812;
    float _1828 = _1784 * _1562;
    float _1830 = _1764 * _1562;
    float _1832 = _1514 * _1562;
    float _1834 = -_1810;
    float _1836 = fma(_1802, _1818, _1834);
    float _1838 = -_1806;
    float _1840 = _1802 * _1838;
    float _1842 = fma(_1802, _1822, _1824);
    float _1844 = _1832 * _1806;
    float _1846 = fma(_1836, _1816, _1820);
    float _1848 = fma(_1828, _1816, _1840);
    float _1850 = fma(_1802, _1824, _1822);
    float _1852 = -_1818;
    float _1854 = fma(_1802, _1810, _1852);
    float _1856 = fma(_1842, _1826, _1846);
    float _1858 = fma(_1830, _1826, _1848);
    float _1860 = fma(_1850, _1816, _1844);
    float _1862 = -_1496;
    float _1864 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1866 = _1416 + _1856;
    float _1868 = _1376 + _1858;
    float _1870 = fma(_1854, _1826, _1860);
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1876 = _1866 + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1880 = _1868 + _1878;
    float _1882 = _950 + _1870;
    float _1884 = _1876 * _1876;
    float _1886 = -_1548;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1890 = fma(_1880, _1880, _1884);
    float _1892 = -_1516;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1896 = sqrt(_1890);
    float _1898 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1872);
    bool _1900 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1872;
    float _1904 = _1894;
    float _1906 = _1888;
    if (!_1900)
    {
        _970 = _1868;
    }
    float _1908 = _970;
    float _1910 = _1908;
    if (!_1900)
    {
        _1426 = _1866;
    }
    float _1912 = _1426;
    float _1914 = _1912;
    if (!_1900)
    {
        _1902 = _1882;
    }
    float _1916 = _1902;
    bool _1918 = !_1900;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1896 + _1924;
        float _1928 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = rsqrt(_1890);
        float _1932 = _1926 * _1922;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = sin(_1940);
        float _1944 = _1938 + (-1.0);
        float _1946 = fma(_1942, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1948 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1930 * _1946;
        float _1952 = fma(_1882, _1938, _1948);
        float _1954 = fma(_1880, _1950, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1956 = fma(_1876, _1950, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1920 = _1952;
        _1910 = _1954;
        _1914 = _1956;
    }
    float _1958 = _1920;
    float _1960 = _1910;
    float _1962 = _1914;
    float _1964 = -_1496;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1968 = -_1516;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1972 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1898);
    float _1974 = -_1548;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1980 = _1966 + _1978;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1984 = _1970 + _1982;
    float _1986 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1990 = _1976 + _1988;
    float _1992 = _1980 * _1980;
    float _1994 = 1.0 / _1986;
    float _1996 = fma(_1984, _1984, _1992);
    float _1998 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2000 = fma(_1990, _1990, _1996);
    float _2002 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1998);
    float _2004 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2006 = rsqrt(_2000);
    float _2008 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2002);
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2012 = floor(_2004);
    float _2014 = _2010 + _1986;
    float _2016 = _2014 * _1994;
    float _2018 = _2016 * 0.5;
    float _2020 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2022 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2026 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2024);
    float _2028 = _1864 + _2020;
    float _2030 = _1984 * _2022;
    float _2032 = _1990 * _2022;
    float _2034 = 1.0 / _2026;
    float _2036 = _2030 * _2030;
    float _2038 = _2032 * _2032;
    float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2042 = -_2012;
    float _2044 = _2004 + _2042;
    float _2046 = _2036 + _2038;
    float _2048 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2040);
    float _2050 = sqrt(_2046);
    float _2052 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2048);
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2058 = _2034 * _2056;
    float _2060 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2062 = trunc(_2054);
    int _2064 = int(_2062);
    bool _2066 = _2058 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2068 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2060);
    bool _2070 = _2058 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2072 = !_2066;
    int _2074 = _2072 ? 0 : 1;
    float _2076 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2068);
    bool _2078 = _2050 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = _2050 + _2080;
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2086 = 2;
    float _2088 = _2046;
    float _2090 = _2082;
    float _2092 = _2030;
    float _2094 = _2032;
    float _2096 = _2036;
    float _2098 = _2038;
    float _2100 = _2084;
    float _2102 = _2012;
    if (!_2066)
    {
        _2086 = 1;
    }
    int _2104 = _2086;
    float _2106 = trunc(_2084);
    int _2108 = int(_2106);
    int _2110 = _2104;
    if (!_2070)
    {
        _2110 = _2074;
    }
    int _2112 = _2110;
    int _2114 = _2112 << 6;
    float _2116 = _1994;
    float _2118 = as_type<float>(_2112);
    if (_2078)
    {
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2116 = _2120;
    }
    float _2122 = _2116;
    int _2124 = _2114 + 96;
    uint _2127 = uint(int(uint(_2124) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
    float _2143 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2147 = _2064 + _2145;
    int _2149 = _2147 + 1;
    bool _2151 = _2149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    uint _2153 = uint(_2149);
    if (_2078)
    {
        float _2155 = rsqrt(_2046);
        _2088 = _2155;
    }
    float _2157 = _2088;
    int _2159 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2161 = _2108 + _2159;
    int _2163 = _2161 + 1;
    int _2165 = _2114 + 104;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    uint _2169 = uint(int(uint(int(_2167)) >> uint(2)));
    int _2171 = int(_2167) & 3;
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[int(_2169)][_2171];
    int _2175 = int(_2167) + 1;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    int _2179 = _2175 & 3;
    float _2181 = (*spvDescriptorSet0.vp_c15)._m0[int(_2177)][_2179];
    int _2183 = _2149 | _2163;
    float _2185 = as_type<float>(_2163);
    if (_2078)
    {
        float _2187 = _2082 * _2122;
        _2090 = _2187;
    }
    float _2189 = _2090;
    int _2191 = _2114 + 48;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
    int _2197 = int(_2193) & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    int _2201 = int(_2193) + 1;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    int _2205 = _2201 & 3;
    float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
    bool _2209 = _2183 < 0;
    bool _2211 = _2209 || _2151;
    float _2213 = _2189;
    if (_2078)
    {
        float _2215 = _2189 * 0.15915493667125701904296875;
        _2213 = _2215;
    }
    float _2217 = _2213;
    float _2219 = floor(_2143);
    float _2221 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _2223 = _2163 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2225 = _2223 || _2211;
    int _2227 = _2114 + 64;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    uint _2231 = uint(int(uint(int(_2229)) >> uint(2)));
    int _2233 = int(_2229) & 3;
    float _2235 = (*spvDescriptorSet0.vp_c15)._m0[int(_2231)][_2233];
    int _2237 = int(_2229) + 1;
    uint _2239 = uint(int(uint(_2237) >> uint(2)));
    int _2241 = _2237 & 3;
    float _2243 = (*spvDescriptorSet0.vp_c15)._m0[int(_2239)][_2241];
    float _2245 = precise::max(0.0, _2221);
    float _2247 = 0.0;
    if (_2078)
    {
        float _2249 = _2217 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        _2247 = _2251;
    }
    float _2253 = _2247;
    float _2255 = -_2022;
    float _2257 = -_2245;
    float _2259 = fma(_1980, _2255, _2257);
    int _2261 = _2114 + 80;
    uint _2263 = uint(int(uint(_2261) >> uint(2)));
    uint _2265 = uint(int(uint(int(_2263)) >> uint(2)));
    int _2267 = int(_2263) & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    int _2271 = int(_2263) + 1;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    int _2275 = _2271 & 3;
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[int(_2273)][_2275];
    float _2279 = 0.0;
    float _2281 = _2259;
    if (_2078)
    {
        float _2283 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2279 = _2283;
    }
    float _2285 = _2279;
    int _2287 = as_type<int>(_1224);
    if (_2078)
    {
        float _2289 = _2217 * 6.283185482025146484375;
        float _2291 = cos(_2289);
        _2287 = as_type<int>(_2291);
    }
    int _2293 = _2287;
    if (!_2225)
    {
        int _2295 = _2163 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2297 = _2295 + _2149;
        _2153 = uint(_2297);
    }
    uint _2299 = _2153;
    float _2301 = -_2219;
    float _2303 = _2143 + _2301;
    int _2305 = _2114 + 56;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[int(_2317)][_2319];
    int _2323 = as_type<int>(_2141);
    float _2325 = _2253;
    int _2327 = _2293;
    float _2329 = as_type<float>(_2299);
    if (_2078)
    {
        float _2331 = fma(_2253, _2285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2185 = _2331;
    }
    float _2333 = _2185;
    float _2335 = _2285;
    float _2337 = _2333;
    if (!_2225)
    {
        float _2339 = floor(_2084);
        _2335 = _2339;
    }
    float _2341 = _2335;
    if (_2078)
    {
        float _2343 = _2157 * _2333;
        _2337 = _2343;
    }
    float _2345 = _2337;
    int _2347 = _2114 + 72;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    uint _2351 = uint(int(uint(int(_2349)) >> uint(2)));
    int _2353 = int(_2349) & 3;
    float _2355 = (*spvDescriptorSet0.vp_c15)._m0[int(_2351)][_2353];
    int _2357 = int(_2349) + 1;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    int _2361 = _2357 & 3;
    float _2363 = (*spvDescriptorSet0.vp_c15)._m0[int(_2359)][_2361];
    float _2365 = _2028 * _2141;
    if (!_2225)
    {
        uint _2367 = uint(int(uint(int(_2299)) >> uint(2)));
        _2323 = int(_2367);
    }
    int _2369 = _2323;
    if (_2078)
    {
        float _2371 = as_type<float>(_2293) + (-1.0);
        _2325 = _2371;
    }
    float _2373 = _2325;
    float _2375 = _2373;
    if (_2078)
    {
        float _2377 = _2030 * _2345;
        _2092 = _2377;
    }
    float _2379 = _2092;
    if (_2078)
    {
        float _2381 = _2032 * _2345;
        _2094 = _2381;
    }
    float _2383 = _2094;
    float _2385 = fma(_1894, _2133, _2365);
    if (_2078)
    {
        float _2387 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2375 = _2387;
    }
    float _2389 = _2375;
    int _2391 = _2114 + 88;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    uint _2395 = uint(int(uint(int(_2393)) >> uint(2)));
    int _2397 = int(_2393) & 3;
    float _2399 = (*spvDescriptorSet0.vp_c15)._m0[int(_2395)][_2397];
    int _2401 = int(_2393) + 1;
    uint _2403 = uint(int(uint(_2401) >> uint(2)));
    int _2405 = _2401 & 3;
    float _2407 = (*spvDescriptorSet0.vp_c15)._m0[int(_2403)][_2405];
    if (_2078)
    {
        float _2409 = _2379 * _2379;
        _2096 = _2409;
    }
    float _2411 = _2096;
    int _2413 = as_type<int>(_2411);
    if (_2078)
    {
        float _2415 = _2383 * _2383;
        _2098 = _2415;
    }
    float _2417 = _2098;
    if (_2078)
    {
        float _2419 = fma(_2259, as_type<float>(_2293), _2389);
        _2281 = _2419;
    }
    float _2421 = _2281;
    if (!_2225)
    {
        int _2423 = int(_2299) << 2;
        _2327 = _2423;
    }
    int _2425 = _2327;
    float _2427 = sqrt(_2000);
    float _2429 = fma(_1888, _2173, _2385);
    float _2431 = fma(_2421, _2421, _2411);
    int _2433 = _2425;
    if (!_2225)
    {
        int _2435 = 12 & _2425;
        _2433 = _2435;
    }
    int _2437 = _2433;
    float _2439 = _2028 * _2207;
    float _2441 = _2431 + _2417;
    if (!_2225)
    {
        int _2443 = _2369 << 4;
        int _2445 = _2443 + _2437;
        _2413 = _2445;
    }
    int _2447 = _2413;
    float _2449 = _2429 + _2181;
    float _2451 = fma(_1894, _2199, _2439);
    float _2453 = rsqrt(_2441);
    float _2455 = _2028 * _2243;
    float _2457 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2225)
    {
        float _2459 = -_2341;
        float _2461 = _2084 + _2459;
        _2100 = _2461;
    }
    float _2463 = _2100;
    float _2465 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2467 = fma(_1894, _2235, _2455);
    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2471 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2469);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2457);
    float _2477 = 1.0 / _2449;
    float _2479 = _2028 * _2277;
    float _2481 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2483 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2475);
    float _2485 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2465);
    float _2487 = fma(_1894, _2269, _2479);
    float _2489 = -_2473;
    float _2491 = _2489 + 1.0;
    float _2493 = _2483 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2495 = _2453 * _2379;
    float _2497 = fma(_1888, _2313, _2451);
    float _2499 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2501 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2503 = _2497 + _2321;
    float _2505 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2507 = _2453 * _2421;
    float _2509 = -_2499;
    float _2511 = fma(_2509, _2481, 1.0);
    float _2513 = fma(_1888, _2355, _2467);
    float _2515 = _2453 * _2383;
    float _2517 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2505);
    float _2519 = abs(_2491);
    float _2521 = log2(_2519);
    float _2523 = _2503 * _2477;
    float _2525 = _2513 + _2363;
    float _2527 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2517);
    float _2529 = _2513;
    if (!_2225)
    {
        int _2531 = _2447 + 400;
        uint _2533 = uint(int(uint(_2531) >> uint(2)));
        uint _2535 = uint(int(uint(int(_2533)) >> uint(2)));
        int _2537 = int(_2533) & 3;
        float _2539 = (*spvDescriptorSet0.vp_c15)._m0[int(_2535)][_2537];
        _2529 = _2539;
    }
    float _2541 = _2529;
    float _2543 = fma(_1888, _2399, _2487);
    float _2545 = -_2501;
    float _2547 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2545);
    float _2549 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2551 = _2523 >= 0.0;
    float _2553 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2555 = -_2515;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2547);
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2561 = _2525 * _2477;
    float _2563 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2553);
    float _2565 = fma(_2557, -0.5, 0.5);
    bool _2567 = _2523 <= 1.0;
    bool _2569 = _2567 && _2551;
    float _2571 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2573 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2563);
    float _2575 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2485);
    bool _2577 = _2561 >= 0.0;
    bool _2579 = _2577 && _2569;
    float _2581 = exp2(_2571);
    float _2583 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2585 = fma(_2557, 0.5, 0.5);
    float _2587 = _2575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2589 = _2561 <= 1.0;
    bool _2591 = _2589 && _2579;
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2559);
    float _2595 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2597 = sqrt(_2565);
    float _2599 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2593);
    float _2601 = _2507 + 1.0;
    float _2603 = _2543 + _2407;
    float _2605 = fma(_2585, _2595, -0.212114393711090087890625);
    float _2607 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2599);
    float _2609 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2611 = _2603 * _2477;
    float _2613 = -_2507;
    float _2615 = fma(_2581, _2601, _2613);
    float _2617 = _2363;
    float _2619 = _2561;
    if (!_2225)
    {
        float _2621 = floor(_2054);
        _2617 = _2621;
    }
    float _2623 = _2617;
    float _2625 = fma(_2585, _2605, 1.570728778839111328125);
    float _2627 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_2591)
    {
        float _2629 = float(_2112);
        _2118 = _2629;
    }
    float _2631 = _2118;
    float _2633 = fma(_2615, 0.5, 0.5);
    float _2635 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2627);
    float _2637 = _2597 * 0.636619746685028076171875;
    float _2639 = 1.0 / _2607;
    float _2641 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2609);
    float _2643 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2635);
    float _2645 = -_2625;
    float _2647 = fma(_2637, _2645, 1.0);
    float _2649 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2641);
    float _2651 = log2(_2511);
    float _2653 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2649);
    float _2655 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2643);
    float _2657 = _2623;
    if (!_2225)
    {
        float _2659 = -_2623;
        float _2661 = _2054 + _2659;
        _2657 = _2661;
    }
    float _2663 = _2657;
    float _2665 = _2641;
    if (_2591)
    {
        float _2667 = rint(_2631);
        float _2669 = precise::max(_2667, 0.0);
        uint _2671 = uint(_2669);
        uint _2673 = clamp(_2671, 0u, 65535u);
        _2665 = as_type<float>(_2673);
    }
    float _2675 = _2665;
    float _2677 = _2653 * _2639;
    float _2679 = _2651 * 0.693147182464599609375;
    float _2681 = _2655 * _2639;
    float _2683 = fma(_2677, 0.5, 0.5);
    float _2685 = _2541;
    if (!_2225)
    {
        float _2687 = rint(_2541);
        float _2689 = precise::max(_2687, 0.0);
        uint _2691 = uint(_2689);
        uint _2693 = clamp(_2691, 0u, 65535u);
        _2685 = as_type<float>(_2693);
    }
    float _2695 = _2685;
    float2 _7667 = float2(_2044, _2303);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7667, float2(0.0), isnan(_7667)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7667, float2(0.0), isnan(_7667)), level(0.0)).x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2701 = fma(_2681, -0.5, 0.5);
    float _2703 = _2679;
    if (_2591)
    {
        float3 _7689 = float3(_2523, _2561, float(as_type<int>(_2675)));
        float3 _7693 = select(_7689, float3(0.0), isnan(_7689));
        float _2705 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7693.xy, uint(rint(_7693.z)), _2611, level(0.0));
        _2703 = _2705;
    }
    float _2707 = _2703;
    float3 _7703 = float3(_2683, _2701, _2699);
    float _2709 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7703, float3(0.0), isnan(_7703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7703, float3(0.0), isnan(_7703)), level(0.0)).x;
    float3 _7712 = float3(_2683, _2701, _2699);
    float4 _2712 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7712, float3(0.0), isnan(_7712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7712, float3(0.0), isnan(_7712)), level(0.0)).xyzw;
    float _2714 = _2712.x;
    float _2716 = _2712.y;
    float _2718 = _2712.z;
    float _2720 = _2712.w;
    float2 _7728 = float2(_2647, _2633);
    float3 _2724 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7728, float2(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7728, float2(0.0), isnan(_7728)), level(0.0)).xyz;
    float _2726 = _2724.x;
    float _2728 = _2724.y;
    float _2730 = _2724.z;
    float _2732 = _2463;
    int _2734 = as_type<int>(_2695);
    if (!_2225)
    {
        float3 _7751 = float3(_2663, _2463, float(as_type<int>(_2695)));
        float3 _7753 = select(_7751, float3(0.0), isnan(_7751));
        float _2736 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7753.xy, uint(rint(_7753.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7753.xy, uint(rint(_7753.z)), level(0.0)).x;
        _2732 = _2736;
    }
    float _2738 = _2732;
    float _2740 = in.m_69.x;
    float _2742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2744 = _746 > 0.5;
    float _2746 = in.m_69.y;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2750 = _2748 != 0;
    float _2752 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2756 = _2754 != 0;
    float _2758 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2760 = _944 > 0.5;
    float _2762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2764 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2752);
    float _2766 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2764);
    int _2768 = as_type<int>(_2683);
    if (_2750)
    {
        float _2770 = in.m_65.z;
        _2768 = as_type<int>(_2770);
    }
    int _2772 = _2768;
    float _2774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2756)
    {
        bool _2776 = _756 > 0.5;
        _1428 = _2776;
    }
    bool _2778 = _1428;
    float _2780 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2766);
    float _2782 = _2740;
    if (_2756)
    {
        float _2784 = -_2740;
        float _2786 = _2784 + 1.0;
        _2734 = as_type<int>(_2786);
    }
    int _2788 = _2734;
    if (!_2756)
    {
        _2619 = _2740;
    }
    float _2790 = _2619;
    float _2792 = _2790;
    if (_2750)
    {
        float _2794 = -_2740;
        float _2796 = _2794 + 1.0;
        _872 = as_type<int>(_2796);
    }
    int _2798 = _872;
    float _2800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2802 = -_2746;
    float _2804 = _2802 + 1.0;
    float _2806 = _2746;
    if (_2756)
    {
        float _2808 = _2778 ? as_type<float>(_2788) : _2740;
        _2792 = _2808;
    }
    float _2810 = _2792;
    out.gl_Position.x = _2653;
    out.gl_Position.y = _2655;
    out.gl_Position.z = _2780;
    out.gl_Position.w = _2607;
    int _2812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2814 = _2812 != 0;
    int _2816 = _2744 ? as_type<int>(_2804) : as_type<int>(_2746);
    float _2818 = _2810 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2822 = _2820 != 0;
    float _2824 = abs(_2058);
    float _2826 = log2(_2824);
    float _2828 = _2814 ? as_type<float>(_2816) : _2746;
    int _2830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2832 = _2830 != 0;
    int _2834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2836 = _2834 != 0;
    float _2838 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2840 = _2760 ? as_type<int>(_2804) : as_type<int>(_2746);
    float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2844 = _2822;
    float _2846 = _2838;
    if (!_2750)
    {
        _2102 = _2740;
    }
    float _2848 = _2102;
    float _2850 = _2818 * _2742;
    float _2852 = _2836 ? as_type<float>(_2840) : _2746;
    bool _2854 = _748 > 0.5;
    bool _2856 = _2058 <= 8000.0;
    bool _2858 = isnan(_2058);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan(8000.0);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2870 = _2848;
    float _2872 = _2850;
    if (_2822)
    {
        float _2874 = _2854 ? _2804 : _2746;
        _2806 = _2874;
    }
    float _2876 = _2806;
    float _2878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2880 = _2772;
    if (_2750)
    {
        bool _2882 = as_type<float>(_2772) > 0.5;
        _2844 = _2882;
    }
    bool _2884 = _2844;
    if (_2832)
    {
        float _2886 = -_2740;
        float _2888 = _2886 + 1.0;
        _2880 = as_type<int>(_2888);
    }
    int _2890 = _2880;
    float _2892 = _2876 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2750)
    {
        float _2894 = _2884 ? as_type<float>(_2798) : _2740;
        _2870 = _2894;
    }
    float _2896 = _2870;
    if (_2832)
    {
        float _2898 = _2760 ? as_type<float>(_2890) : _2740;
        _2782 = _2898;
    }
    float _2900 = _2782;
    float _2902 = _2852 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2904 = _2892 * _2800;
    float _2906 = in.m_71.x;
    float _2908 = in.m_71.y;
    float _2910 = in.m_71.z;
    float _2912 = exp2(_2868);
    float _2914 = _2902 * _2762;
    bool _2916 = _1776 != 0.0;
    bool _2918 = isnan(_1776);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan(0.0);
    bool _2924 = _2920 || _2922;
    float _2926 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2928 = _2896 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2930 = _2838 * _2878;
    bool _2932 = _1788 == 0.0;
    bool _2934 = !_2924;
    bool _2936 = _2932 && _2934;
    float _2938 = _2926 * _2842;
    float _2940 = in.m_73.x;
    float _2942 = in.m_73.y;
    float _2944 = in.m_73.z;
    float _2946 = in.m_73.w;
    bool _2948 = _1780 == 0.0;
    bool _2950 = _2948 && _2936;
    float _2952 = _2928 * _2774;
    out.m_75.x = _2938;
    out.m_75.y = _2930;
    float _2954 = exp2(_2758);
    float _2956 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    out.m_77.x = _2850;
    out.m_77.y = _2914;
    out.m_77.z = _2952;
    out.m_77.w = _2904;
    float _2960 = fma(_2958, -2.0, 3.0);
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (_2950)
    {
        _2846 = _2906;
    }
    float _2964 = _2846;
    float _2966 = _2964;
    if (!_2950)
    {
        float _2968 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2906);
        _2966 = _2968;
    }
    float _2970 = _2966;
    if (_2950)
    {
        _2962 = _2908;
    }
    float _2972 = _2962;
    float _2974 = _2972;
    if (!_2950)
    {
        float _2976 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2974 = _2976;
    }
    float _2978 = _2974;
    float _2980 = -_2954;
    float _2982 = _2980 + 1.0;
    float _2984 = _2958 * _2958;
    if (_2950)
    {
        _2872 = _2910;
    }
    float _2986 = _2872;
    float _2988 = _2944 * _2906;
    float _2990 = _2986;
    if (!_2950)
    {
        float _2992 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2910);
        _2990 = _2992;
    }
    float _2994 = _2990;
    float _2996 = _2984 * _2960;
    float _2998 = _2940 * _2908;
    float _3000 = -_2988;
    float _3002 = fma(_2940, _2910, _3000);
    float _3004 = _2942 * _2910;
    float _3006 = -_2942;
    float _3008 = _1802 * _3006;
    float _3010 = _1832 * _2942;
    float _3012 = _1808 * _2942;
    float _3014 = -_2998;
    float _3016 = fma(_2942, _2906, _3014);
    float _3018 = fma(_1828, _2940, _3008);
    float _3020 = fma(_1850, _2940, _3010);
    float _3022 = -_3004;
    float _3024 = fma(_2944, _2908, _3022);
    float _3026 = _3002 * _2946;
    float _3028 = fma(_1836, _2940, _3012);
    float _3030 = fma(_1830, _2944, _3018);
    float _3032 = fma(_1854, _2944, _3020);
    float _3034 = -_2978;
    float _3036 = _1802 * _3034;
    float _3038 = _1832 * _2978;
    float _3040 = _1808 * _2978;
    float _3042 = _3024 * _2946;
    float _3044 = -_3026;
    float _3046 = _1802 * _3044;
    float _3048 = _1832 * _3026;
    float _3050 = _1808 * _3026;
    float _3052 = _3016 * _2946;
    float _3054 = fma(_1828, _3042, _3046);
    float _3056 = fma(_1850, _3042, _3048);
    float _3058 = fma(_1836, _3042, _3050);
    float _3060 = -_2996;
    float _3062 = _3060 + 1.0;
    float _3064 = fma(_1830, _3052, _3054);
    float _3066 = fma(_1854, _3052, _3056);
    float _3068 = fma(_1842, _3052, _3058);
    float _3070 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2996);
    float _3072 = fma(_1842, _2944, _3028);
    float _3074 = fma(_1828, _2970, _3036);
    float _3076 = fma(_1850, _2970, _3038);
    float _3078 = _2866 * _3070;
    out.m_79.x = _3064;
    out.m_79.y = _3066;
    out.m_79.z = _3068;
    float _3080 = fma(_1836, _2970, _3040);
    float _3082 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _3030;
    out.m_81.y = _3032;
    out.m_81.z = _3072;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3086 = _3064;
    if (!_2591)
    {
        _3086 = 1.0;
    }
    float _3088 = _3086;
    float _3090 = fma(_1830, _2994, _3074);
    float _3092 = fma(_1854, _2994, _3076);
    float _3094 = fma(_1842, _2994, _3080);
    float _3096 = -_2697;
    float _3098 = _3096 + 1.0;
    float _3100 = _3098 * _3084;
    float _3102 = precise::clamp(_3100, 0.0, 1.0);
    float _3104 = _3088;
    float _3106 = _3098;
    if (_2591)
    {
        bool _3108 = _2707 >= _2611;
        bool _3110 = isnan(_2707);
        bool _3112 = _3108 || _3110;
        bool _3114 = isnan(_2611);
        bool _3116 = _3112 || _3114;
        float _3118 = float(_3116);
        _3104 = _3118;
    }
    float _3120 = _3104;
    if (_2225)
    {
        _3106 = 1.0;
    }
    float _3122 = _3106;
    float _3124 = _3122;
    if (!_2225)
    {
        int _3126 = int(_2299) << 4;
        int _3128 = _3126 + 2048;
        uint _3130 = uint(int(uint(_3128) >> uint(2)));
        uint _3132 = uint(int(uint(int(_3130)) >> uint(2)));
        int _3134 = int(_3130) & 3;
        float _3136 = (*spvDescriptorSet0.vp_c15)._m0[int(_3132)][_3134];
        int _3138 = int(_3130) + 1;
        uint _3140 = uint(int(uint(_3138) >> uint(2)));
        int _3142 = _3138 & 3;
        float _3144 = (*spvDescriptorSet0.vp_c15)._m0[int(_3140)][_3142];
        int _3146 = _3128 + 8;
        uint _3148 = uint(int(uint(_3146) >> uint(2)));
        uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
        int _3152 = int(_3148) & 3;
        float _3154 = (*spvDescriptorSet0.vp_c15)._m0[int(_3150)][_3152];
        int _3156 = int(_3148) + 1;
        uint _3158 = uint(int(uint(_3156) >> uint(2)));
        int _3160 = _3156 & 3;
        float _3162 = (*spvDescriptorSet0.vp_c15)._m0[int(_3158)][_3160];
        float _3164 = _2028 * _3144;
        float _3166 = fma(_1894, _3136, _3164);
        float _3168 = fma(_1888, _3154, _3166);
        float _3170 = _3168 + _3162;
        float _3172 = precise::clamp(_3170, 0.0, 1.0);
        float _3174 = -_3172;
        float _3176 = _3174 + _2738;
        float _3178 = fma(_3176, 500.0, 1.5);
        float _3180 = exp2(_3178);
        float _3182 = 0.0 + _3180;
        float _3184 = precise::clamp(_3182, 0.0, 1.0);
        _3124 = _3184;
        _1904 = _3180;
        _2329 = as_type<float>(_3128);
    }
    float _3186 = _3124;
    float _3188 = _1904;
    float _3190 = _2329;
    float _3192 = _3120 * _3186;
    float _3194 = _3082 * _2709;
    float _3196 = -_3102;
    float _3198 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3200 = -_3082;
    float _3202 = _3200 + 1.0;
    out.m_83.x = _3090;
    out.m_83.y = _3092;
    out.m_83.z = _3094;
    float _3204 = _2720 * _3194;
    float _3206 = -_3192;
    float _3208 = fma(_3206, _3198, 1.0);
    float _3210 = precise::clamp(_3208, 0.0, 1.0);
    float _3212 = _2730 * _3194;
    float _3214 = _2720 * _3202;
    float _3216 = fma(_2726, _3204, _2714);
    float _3218 = fma(_2728, _3204, _2716);
    float _3220 = _3210 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3222 = fma(_2720, _3212, _2718);
    out.m_85.x = _1970;
    out.m_85.y = _1966;
    out.m_85.z = _1976;
    bool _3224 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3226 = isnan(_2427);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3232 = _3228 || _3230;
    out.m_87.x = _3220;
    out.m_89.x = _3216;
    out.m_89.y = _3218;
    out.m_89.z = _3222;
    out.m_89.w = _3214;
    float _3234 = _3210;
    float _3236 = _3212;
    float _3238 = _3190;
    float _3240 = _3188;
    float _3242 = _3204;
    if (!_3232)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3244 = _3234;
    float _3246 = _3244;
    float _3248 = _3244;
    if (!_3232)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3250 = _3236;
    float _3252 = _3250;
    float _3254 = _3250;
    if (!_3232)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3256 = _1906;
    float _3258 = _3256;
    float _3260 = _3256;
    if (!_3232)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3262 = _3238;
    float _3264 = _3262;
    float _3266 = _3262;
    if (!_3232)
    {
        _3240 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3268 = _3240;
    float _3270 = _3268;
    float _3272 = _3268;
    if (!_3232)
    {
        _3242 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3274 = _3242;
    bool _3276 = !_3232;
    float _3278 = _3274;
    float _3280 = _3274;
    if (!_3276)
    {
        bool _3282 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3284 = isnan(_2427);
        bool _3286 = _3282 || _3284;
        bool _3288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3290 = _3286 || _3288;
        if (!_3290)
        {
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3294 = _2427 + _3292;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3298 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3296;
            float _3300 = 1.0 / _3298;
            float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3322 = _3294 * _3300;
            float _3324 = precise::clamp(_3322, 0.0, 1.0);
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3330 = fma(_3324, _3304, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3332 = fma(_3324, _3328, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3334 = fma(_3324, _3308, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3336 = fma(_3324, _3312, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3338 = fma(_3324, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3340 = fma(_3324, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3254 = _3332;
            _3272 = _3338;
            _3248 = _3330;
            _3266 = _3336;
            _3260 = _3334;
            _3280 = _3340;
            _3342 = true;
        }
        else
        {
            bool _3344 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3346 = isnan(_2427);
            bool _3348 = _3344 || _3346;
            bool _3350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3352 = _3348 || _3350;
            if (!_3352)
            {
                _3246 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3354 = _3246;
            _3248 = _3354;
            if (!_3352)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3356 = _3252;
            _3254 = _3356;
            if (!_3352)
            {
                _3258 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3358 = _3258;
            _3260 = _3358;
            if (!_3352)
            {
                _3264 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3360 = _3264;
            _3266 = _3360;
            if (!_3352)
            {
                _3270 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3362 = _3270;
            _3272 = _3362;
            if (!_3352)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3364 = _3278;
            bool _3366 = !_3352;
            _3280 = _3364;
            if (!_3366)
            {
                bool _3368 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3370 = isnan(_2427);
                bool _3372 = _3368 || _3370;
                bool _3374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3376 = _3372 || _3374;
                if (!_3376)
                {
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3380 = _2427 + _3378;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3382;
                    float _3386 = 1.0 / _3384;
                    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3390 = _3388 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3408 = _3380 * _3386;
                    float _3410 = precise::clamp(_3408, 0.0, 1.0);
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3416 = fma(_3410, _3390, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3418 = fma(_3410, _3414, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3420 = fma(_3410, _3394, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3422 = fma(_3410, _3398, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3424 = fma(_3410, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3426 = fma(_3410, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3254 = _3418;
                    _3272 = _3424;
                    _3248 = _3416;
                    _3266 = _3422;
                    _3260 = _3420;
                    _3280 = _3426;
                    _3342 = true;
                }
                else
                {
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3272 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3248 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3266 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3260 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3342 = false;
    float _3428 = _3254;
    float _3430 = _3272;
    float _3432 = _3248;
    float _3434 = _3266;
    float _3436 = _3260;
    float _3438 = _3280;
    float _3440 = fma(_3092, -0.5, 0.5);
    float _3442 = precise::clamp(_3440, 0.0, 1.0);
    float _3444 = -_3428;
    float _3446 = _3444 + _3430;
    float _3448 = -_3432;
    float _3450 = _3448 + _3434;
    float _3452 = -_3436;
    float _3454 = _3452 + _3438;
    bool _3456 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3458 = fma(_3442, _3446, _3428);
    float _3460 = fma(_3442, _3450, _3432);
    float _3462 = fma(_3442, _3454, _3436);
    float _3464 = _3458 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3466 = fma(_3460, 0.298911988735198974609375, _3464);
    float _3468 = fma(_3462, 0.114477999508380889892578125, _3466);
    out.m_91.x = 0.0;
    float _3470 = -_3468;
    float _3472 = _3460 + _3470;
    float _3474 = -_3468;
    float _3476 = _3458 + _3474;
    float _3478 = -_3468;
    float _3480 = _3462 + _3478;
    float _3482 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3484 = fma(_3472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    float _3486 = fma(_3476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    float _3488 = fma(_3480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    out.m_87.w = _3482;
    out.m_93.x = _3484;
    out.m_93.y = _3486;
    out.m_93.z = _3488;
    if (!_3456)
    {
        return out;
    }
    float _3490 = -_1966;
    float _3492 = _3490 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3494 = -_1970;
    float _3496 = _3494 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3498 = -_1976;
    float _3500 = _3498 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3502 = _3492 * _3492;
    float _3504 = fma(_3496, _3496, _3502);
    float _3506 = fma(_3500, _3500, _3504);
    float _3508 = sqrt(_3506);
    float _3510 = rsqrt(_3506);
    float _3512 = -_3508;
    float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3516 = _3514 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3518 = precise::clamp(_3516, 0.0, 1.0);
    float _3520 = _3496 * _3510;
    float _3522 = _3492 * _3510;
    float _3524 = abs(_3518);
    float _3526 = log2(_3524);
    float _3528 = _3500 * _3510;
    float _3530 = _3520 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3532 = _3092 * _3522;
    float _3534 = -_3522;
    float _3536 = -_3530;
    float _3538 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3536);
    float _3540 = fma(_3090, _3520, _3532);
    float _3542 = -_3528;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3538);
    float _3546 = fma(_3094, _3528, _3540);
    float _3548 = precise::clamp(_3546, 0.0, 1.0);
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3552 = _3544 + _3550;
    float _3554 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3556 = _3552 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3558 = precise::clamp(_3556, 0.0, 1.0);
    float _3560 = exp2(_3554);
    float _3562 = _3560 * _3558;
    float _3564 = _3548 * _3562;
    float _3566 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3568 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3570 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3566;
    out.m_91.y = _3568;
    out.m_91.z = _3570;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3342 = false;
    bool _742 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_56.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    float _120 = as_type<float>(_112);
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _118;
    if (!_116)
    {
        out.m_59.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3628 = as_type<float>(_128);
        out.gl_Position.z = _3628;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_61.w;
    float _134 = float(_112);
    float _136 = -_132;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    bool _150 = _138 >= _134;
    bool _152 = !_148;
    bool _154 = _150 || _152;
    float _156 = _138;
    if (_154)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _120;
    float _160 = _158;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _162 = _158 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3693 = as_type<float>(_164);
        out.gl_Position.z = _3693;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_63.w;
    float _168 = 1.0 / _134;
    float _170 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_61.x;
    float _184 = in.m_61.y;
    float _186 = in.m_61.z;
    float _188 = in.m_56.x;
    float _190 = in.m_56.y;
    float _192 = in.m_56.z;
    float _194 = _170;
    if (!_180)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _160 = _198;
    }
    float _200 = _160;
    float _202 = _200;
    if (!_180)
    {
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_180;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _170 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _170);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_180;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _170 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _194 = _264;
    }
    float _266 = _194;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _276 = _138 * _168;
    float _278 = fma(_266, _182, _270);
    float _280 = fma(_266, _184, _272);
    float _282 = fma(_266, _186, _274);
    float _284 = fma(_278, _166, _188);
    float _286 = fma(_280, _166, _190);
    float _288 = fma(_282, _166, _192);
    bool _290 = !_268;
    float _308;
    if (!_290)
    {
        float _292 = in.m_65.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _276;
    }
    _310 = false;
    float _312 = _308;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _316 = _312 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = _312 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _338;
    float _342 = 1.0 / _332;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _348;
    float _352 = 1.0 / _328;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = _312 + _354;
    bool _358 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _360 = isnan(_312);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    bool _370 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _372 = isnan(_312);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _336;
    float _384 = _356 * _342;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _388 = _312 + _386;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _392 = 1.0 / _340;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _396 = _312 + _394;
    float _398 = _316 * _352;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _402 = _312 + _400;
    float _404 = 1.0 / _350;
    float _406 = _396 * _382;
    bool _408 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _410 = isnan(_312);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _312 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    float _428 = 1.0 / _324;
    float _430 = _388 * _392;
    bool _432 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _434 = isnan(_312);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_426, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = 1.0 / _346;
    bool _448 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _450 = isnan(_312);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _402 * _404;
    bool _462 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _464 = isnan(_312);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_458;
    float _476 = _474 + 1.0;
    float _478 = _320 * _428;
    float _480 = -_418;
    float _482 = _480 + 1.0;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = _418 * _476;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _490;
    float _494 = _442 * _482;
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = _422 * _446;
    float _502 = -_442;
    float _504 = _502 + 1.0;
    float _506 = fma(_486, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _508 = fma(_492, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _510 = _368 * _498;
    float _512 = _472 * _504;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = -_368;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _530 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _532 = isnan(_312);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = fma(_520, _406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _544 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _546 = isnan(_312);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = fma(_516, _406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_528, _406, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = -_540;
    float _562 = _560 + 1.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _564;
    float _568 = _554 * _524;
    float _570 = -_554;
    float _572 = _570 + 1.0;
    float _574 = _380 * _562;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _576;
    float _580 = _540 * _572;
    float _582 = _506 * _574;
    float _584 = _508 * _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = _444 * _574;
    float _592 = fma(_578, _478, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _598 = -_380;
    float _600 = _598 + 1.0;
    float _602 = fma(_588, _478, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _612 = fma(_596, _398, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _616 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _584);
    float _618 = fma(_606, _398, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _622 = fma(_610, _398, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _624 = fma(_542, _580, _614);
    float _626 = fma(_566, _478, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = fma(_556, _580, _616);
    float _630 = fma(_558, _580, _620);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _632;
    float _636 = fma(_602, _568, _624);
    float _638 = fma(_592, _568, _628);
    float _640 = fma(_626, _568, _630);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _658;
    float _662 = fma(_634, _430, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _664 = fma(_612, _510, _636);
    float _666 = fma(_644, _430, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _668 = fma(_648, _500, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _670 = fma(_652, _500, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _672 = fma(_656, _500, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _674 = fma(_618, _510, _638);
    float _676 = fma(_622, _510, _640);
    float _678 = fma(_660, _430, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _680 = fma(_662, _512, _664);
    float _682 = fma(_666, _512, _674);
    float _684 = fma(_678, _512, _676);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _686;
    float _690 = fma(_668, _494, _680);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _692;
    float _696 = fma(_670, _494, _682);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _698;
    float _702 = fma(_688, _460, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _704 = fma(_694, _460, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _706 = fma(_672, _494, _684);
    float _708 = fma(_700, _460, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _710 = fma(_702, _488, _690);
    float _712 = fma(_704, _488, _696);
    float _714 = fma(_708, _488, _706);
    float _716 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].x, _710);
    float _718 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].y, _712);
    float _720 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[150].z, _714);
    bool _722 = !_390;
    float _740;
    if (!_722)
    {
        float _724 = in.m_65.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _276;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_65.z;
    float _748 = in.m_65.w;
    float _750 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _752 = log2(_750);
    float _754 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _756 = in.m_65.x;
    float _758 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _760 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _764 = _762 != 0;
    float _766 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _754);
    float _768 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _758);
    float _770 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _778 = _776 != 0;
    float _780 = _138 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    bool _782 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _790 = _786 || _788;
    float _792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _794 = _276 * 3.1415927410125732421875;
    float _796 = _752 * _138;
    float _798 = in.m_67.x;
    float _800 = in.m_67.y;
    float _802 = in.m_67.z;
    bool _804 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _806 = isnan(1.0);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _812 = _808 || _810;
    float _814 = exp2(_796);
    float _816 = _746 * 2.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _820 = 1.0 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _826 = _756 * 2.0;
    float _828 = floor(_816);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _834;
    float _838 = 1.0 / _820;
    float _840 = -_814;
    float _842 = _840 + 1.0;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _856 = _790 ? _842 : 0.0;
    float _858 = floor(_826);
    bool _860 = _828 > 0.0;
    bool _862 = _828 >= 0.0;
    bool _864 = isnan(_828);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    int _872 = as_type<int>(_746);
    if (_812)
    {
        float _874 = _856 * _838;
        _156 = _874;
    }
    float _876 = _156;
    int _878 = _870 ? 0 : 1;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _884 = 1.0 / _824;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _892 = _890 != 0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _896 = _894 != 0;
    int _898 = ~_878;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    int _904 = _902;
    bool _906 = _764;
    float _908 = _876;
    if (!_860)
    {
        int _910 = ~_878;
        int _912 = _910 + 1;
        _904 = _912;
    }
    int _914 = _904;
    float _916 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _918 = _858 >= 0.0;
    bool _920 = isnan(_858);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = 1.0 / _832;
    float _930 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _916);
    int _932 = _926 ? 0 : 1;
    float _934 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _940 = _858 > 0.0;
    float _942 = 1.0 / _882;
    float _944 = in.m_65.y;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _950 = _934 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _952 = ~_932;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = 1.0 / _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _964 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _766);
    float _966 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _770);
    int _968 = _956;
    float _970 = _950;
    if (!_940)
    {
        int _972 = ~_932;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    bool _978 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _980 = isnan(_744);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = 1.0 / _938;
    float _992 = _850 * _942;
    float _994 = float(_914);
    float _996 = float(_976);
    float _998 = 1.0 / _962;
    float _1000 = _846 * _958;
    float _1002 = _944 * 2.0;
    float _1004 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _1006 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _1008 = precise::max(_1004, _1006);
    float _1010 = floor(_1002);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1016 = _1008 >= 16.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1018;
    float _1022 = _854 * _990;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1028 = _1020 * _928;
    float _1030 = 1.0 / _1014;
    float _1032 = _944 + _746;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1034;
    float _1038 = _836 * _998;
    bool _1040 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1042 = isnan(_744);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = _1026 * _884;
    bool _1054 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1056 = isnan(_744);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1068 = isnan(_744);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = _1032 + (-1.0);
    bool _1080 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1082 = isnan(_744);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1094 = _756 + _746;
    float _1096 = -_1090;
    float _1098 = _1096 + 1.0;
    float _1100 = _1036 * _1030;
    float _1102 = _756 + _944;
    float _1104 = _1094 + (-1.0);
    float _1106 = _1050 * _1098;
    float _1108 = -_1050;
    float _1110 = _1108 + 1.0;
    float _1112 = _1102 + (-1.0);
    float _1114 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1116 = !_888;
    int _1118 = _1116 ? 0 : 1;
    float _1120 = _1064 * _1110;
    bool _1122 = _1010 >= 0.0;
    bool _1124 = isnan(_1010);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1134 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1136 = isnan(_744);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1064;
    float _1148 = _1146 + 1.0;
    int _1150 = _1130 ? 0 : 1;
    bool _1152 = _1010 > 0.0;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1156 = _744 + _1154;
    float _1158 = -_1144;
    float _1160 = _1158 + 1.0;
    bool _1162 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1164 = isnan(_744);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = _1076 * _1148;
    float _1176 = fma(_1028, _1156, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1178 = -_1076;
    float _1180 = _1178 + 1.0;
    float _1182 = _988 * _1160;
    bool _1184 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1186 = isnan(_744);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1192 = _1188 || _1190;
    float _1194 = float(_1192);
    float _1196 = -_1172;
    float _1198 = _1196 + 1.0;
    float _1200 = _1144 * _1180;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1204 = _744 + _1202;
    float _1206 = -_988;
    float _1208 = _1206 + 1.0;
    float _1210 = _1194 * _1198;
    float _1212 = -_1194;
    float _1214 = _1212 + 1.0;
    float _1216 = fma(_1052, _1204, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1220 = _744 + _1218;
    float _1222 = _1172 * _1208;
    float _1224 = _1176 * _1210;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1228 = _744 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1232 = _744 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1236 = _744 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1240 = _744 + _1238;
    float _1242 = fma(_992, _1220, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1244 = fma(_1022, _1228, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1246 = fma(_1038, _1232, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1248 = fma(_1100, _1240, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1250 = abs(_1118);
    float _1252 = _876 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _1254 = !_892;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1224);
    float _1260 = fma(_1000, _1236, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1262 = _1252 * _792;
    int _1264 = abs(_1256);
    float _1266 = fma(_1216, _1222, _1258);
    float _1268 = float(_1250);
    float _1270 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1262);
    bool _1272 = !_896;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = fma(_1242, _1182, _1266);
    int _1278 = ~_1150;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = _1268 * _994;
    float _1286 = _1270 + 0.25;
    float _1288 = floor(_1270);
    int _1290 = _1282;
    if (!_1152)
    {
        int _1292 = ~_1150;
        int _1294 = _1292 + 1;
        _1290 = _1294;
    }
    int _1296 = _1290;
    float _1298 = fma(_1244, _1200, _1276);
    int _1300 = abs(_1274);
    float _1302 = _1284 * (-2.0);
    float _1304 = float(_1296);
    float _1306 = fma(_1246, _1174, _1298);
    float _1308 = float(_1300);
    float _1310 = floor(_1286);
    float _1312 = _794 * 0.15915493667125701904296875;
    float _1314 = fma(_1132, _1302, _1132);
    float _1316 = fma(_1260, _1120, _1306);
    float _1318 = _1308 * _1304;
    float _1320 = _780 * 0.15915493667125701904296875;
    float _1322 = _756 + (-0.5);
    float _1324 = -_1288;
    float _1326 = _1270 + _1324;
    float _1328 = _1318 * (-2.0);
    float _1330 = _1270 * 6.283185482025146484375;
    float _1332 = _1312 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = float(_1264);
    float _1338 = fma(_1114, _1328, _1114);
    bool _1340 = _1326 >= 0.5;
    bool _1342 = isnan(_1326);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(0.5);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1248, _1106, _1316);
    bool _1352 = !_774;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = -_1310;
    float _1358 = _1286 + _1356;
    float _1360 = _1330 * 0.15915493667125701904296875;
    float _1362 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1364 = abs(_1354);
    float _1366 = _1336 * _996;
    float _1368 = fma(_1314, _876, _1362);
    float _1370 = _1360 * 6.283185482025146484375;
    float _1372 = sin(_1370);
    float _1374 = float(_1364);
    float _1376 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1378 = !_1348;
    float _1380 = _1378 ? 0.5 : (-0.5);
    float _1382 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1384 = _950 + _1382;
    bool _1386 = _1358 > 0.5;
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1390 = _1376 + _1388;
    float _1392 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1350);
    float _1394 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1396 = _1394 * 2.0;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[191].w + _1398;
    bool _1402 = !_764;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _1384 * _1384;
    float _1408 = _1374 * _1396;
    float _1410 = _1320 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    int _1414 = abs(_1404);
    float _1416 = _966 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1418 = fma(_1390, _1390, _1406);
    bool _1420 = !_778;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = _1358;
    float _1426 = _1416;
    bool _1428 = _1348;
    if (_1386)
    {
        float _1430 = -_1358;
        float _1432 = _1430 + 1.0;
        _1424 = _1432;
    }
    float _1434 = _1424;
    float _1436 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1440 = _1416 + _1438;
    float _1442 = fma(_1434, 4.0, -1.0);
    float _1444 = float(_1414);
    float _1446 = fma(_1440, _1440, _1418);
    int _1448 = abs(_1422);
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1454 = fma(_1444, _1436, _1408);
    float _1456 = _746 + (-0.5);
    float _1458 = rsqrt(_1446);
    float _1460 = _1016 ? _1450 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1462 = _1368 * 0.15915493667125701904296875;
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1466 = float(_1448);
    float _1468 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1470 = fma(_1338, _876, _1464);
    float _1472 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1474 = _1412 * _1468;
    float _1476 = fma(_1466, _1452, _1454);
    float _1478 = _1462 * 6.283185482025146484375;
    float _1480 = sin(_1478);
    float _1482 = in.m_63.x;
    float _1484 = in.m_63.y;
    float _1486 = in.m_63.z;
    float _1488 = _1016 ? _1472 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1490 = _1470 * 0.15915493667125701904296875;
    float _1492 = abs(_1460);
    bool _1494 = _1492 == 0.0;
    float _1496 = _1384 * _1458;
    float _1498 = abs(_1488);
    bool _1500 = _1498 != 0.0;
    bool _1502 = isnan(_1498);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    float _1510 = _1366 * (-2.0);
    float _1512 = _1462 * 6.283185482025146484375;
    float _1514 = cos(_1512);
    float _1516 = _1390 * _1458;
    float _1518 = abs(_1460);
    bool _1520 = _1518 == 0.0;
    bool _1522 = !_1508;
    bool _1524 = _1520 && _1522;
    float _1526 = -_1496;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1384);
    float _1530 = _1476 * 3.1415927410125732421875;
    float _1532 = _944 + (-0.5);
    float _1534 = -_1516;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1538 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _930);
    float _1540 = 1.0 / _1400;
    float _1542 = _1474 * 0.15915493667125701904296875;
    float _1544 = _1528 * _1528;
    float _1546 = fma(_1530, _1510, _1530);
    float _1548 = _1440 * _1458;
    float _1550 = fma(_1092, _1510, _1092);
    float _1552 = fma(_1536, _1536, _1544);
    int _1554 = as_type<int>(_1544);
    if (_1524)
    {
        bool _1556 = as_type<int>(_1460) >= 0;
        _906 = _1556;
    }
    bool _1558 = _906;
    float _1560 = _1490 * 6.283185482025146484375;
    float _1562 = cos(_1560);
    float _1564 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1546);
    float _1566 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1568 = -_1548;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1440);
    int _1572 = _1558 ? (-1) : 0;
    if (_1524)
    {
        int _1574 = _1558 ? 0 : 1078530011;
        _1554 = _1574;
    }
    int _1576 = _1554;
    float _1578 = fma(_1550, _876, _1564);
    float _1580 = fma(_1570, _1570, _1552);
    float _1582 = _1542 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = -_1566;
    float _1588 = precise::max(_1586, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    int _1590 = _1576;
    if (_1524)
    {
        int _1592 = int(0x80000000) & as_type<int>(_1488);
        int _1594 = _1576 | _1592;
        _908 = as_type<float>(_1594);
    }
    float _1596 = _908;
    float _1598 = _1542 * 6.283185482025146484375;
    float _1600 = cos(_1598);
    bool _1602 = !_1508;
    bool _1604 = _1602 && _1494;
    float _1606 = _1596;
    float _1608 = _1596;
    if (!_1604)
    {
        float _1610 = abs(_1488);
        bool _1612 = _1610 != as_type<float>(0x7f800000u /* inf */);
        bool _1614 = isnan(_1610);
        bool _1616 = _1612 || _1614;
        bool _1618 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1620 = _1616 || _1618;
        float _1622 = abs(_1460);
        bool _1624 = _1622 == as_type<float>(0x7f800000u /* inf */);
        float _1626 = abs(_1460);
        bool _1628 = _1626 == as_type<float>(0x7f800000u /* inf */);
        bool _1630 = !_1620;
        bool _1632 = _1628 && _1630;
        if (_1632)
        {
            bool _1634 = as_type<int>(_1460) >= 0;
            _1572 = _1634 ? (-1) : 0;
        }
        int _1636 = _1572;
        if (_1632)
        {
            _1590 = 1075235812;
        }
        int _1638 = _1590;
        int _1640 = _1638;
        if (_1632)
        {
            int _1642 = ~_1636;
            int _1644 = (_1642 != 0) ? _1638 : 1061752795;
            _1640 = _1644;
        }
        int _1646 = _1640;
        if (_1632)
        {
            int _1648 = int(0x80000000) & as_type<int>(_1488);
            int _1650 = _1646 | _1648;
            _1606 = as_type<float>(_1650);
        }
        float _1652 = _1606;
        bool _1654 = !_1620;
        bool _1656 = _1654 && _1624;
        _1608 = _1652;
        if (!_1656)
        {
            float _1658 = abs(_1488);
            float _1660 = abs(_1460);
            float _1662 = precise::max(_1658, _1660);
            float _1664 = abs(_1488);
            float _1666 = abs(_1460);
            float _1668 = precise::min(_1664, _1666);
            float _1670 = 1.0 / _1662;
            float _1672 = abs(_1488);
            float _1674 = abs(_1460);
            bool _1676 = _1672 > _1674;
            bool _1678 = as_type<int>(_1460) >= 0;
            float _1680 = abs(_1488);
            float _1682 = abs(_1460);
            float _1684 = _1680 + _1682;
            int _1686 = as_type<int>(_1488) & int(0x80000000);
            bool _1688 = _1684 > as_type<float>(0x7f800000u /* inf */);
            bool _1690 = isnan(_1684);
            bool _1692 = _1688 || _1690;
            bool _1694 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1696 = _1692 || _1694;
            float _1698 = _1668 * _1670;
            float _1700 = _1698 * _1698;
            float _1702 = _1700 + 11.33538818359375;
            float _1704 = fma(_1700, _1702, 28.84246826171875);
            float _1706 = fma(_1700, _1704, 19.6966705322265625);
            float _1708 = fma(_1700, -0.82336294651031494140625, -5.674867153167724609375);
            float _1710 = fma(_1700, _1708, -6.565555095672607421875);
            float _1712 = 1.0 / _1706;
            float _1714 = _1700 * _1710;
            float _1716 = _1698 * _1714;
            float _1718 = fma(_1716, _1712, _1698);
            float _1720 = _1718;
            _1608 = _1684;
            if (_1676)
            {
                float _1722 = -_1718;
                float _1724 = _1722 + 1.57079637050628662109375;
                _1720 = _1724;
            }
            float _1726 = _1720;
            int _1728 = as_type<int>(_1726);
            if (!_1678)
            {
                float _1730 = -_1726;
                float _1732 = _1730 + 3.1415927410125732421875;
                _1728 = as_type<int>(_1732);
            }
            int _1734 = _1728;
            if (!_1696)
            {
                int _1736 = _1686 | _1734;
                _1608 = as_type<float>(_1736);
            }
        }
    }
    float _1738 = _1608;
    float _1740 = _1578 + _1738;
    float _1742 = sqrt(_1580);
    float _1744 = precise::min(_1588, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _1746 = 0.0 + _1334;
    float _1748 = precise::clamp(_1746, 0.0, 1.0);
    float _1750 = _1740 * 0.15915493667125701904296875;
    float _1752 = _716 * _1482;
    float _1754 = _718 * _1484;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1758 = _1744 + _1756;
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1762 = _1750 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1768 = _1758 * _1540;
    float _1770 = _1584 * _798;
    float _1772 = _1600 * _798;
    float _1774 = _720 * _1486;
    float _1776 = fma(_1760, _1768, _800);
    float _1778 = -_1770;
    float _1780 = fma(_1600, _802, _1778);
    float _1782 = _1750 * 6.283185482025146484375;
    float _1784 = cos(_1782);
    float _1786 = _1458 * _1742;
    float _1788 = fma(_1584, _802, _1772);
    float _1790 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1776);
    float _1794 = _1786 * _1766;
    float _1796 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1798 = _1786 * _1790;
    float _1800 = _1490 * 6.283185482025146484375;
    float _1802 = sin(_1800);
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1788);
    float _1806 = _1792 * _1794;
    float _1808 = _1480 * _1562;
    float _1810 = _1514 * _1764;
    float _1812 = _1786 * _1796;
    float _1814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1780);
    float _1816 = _1804 * _1798;
    float _1818 = _1480 * _1784;
    float _1820 = _1808 * _1806;
    float _1822 = _1480 * _1764;
    float _1824 = _1514 * _1784;
    float _1826 = _1814 * _1812;
    float _1828 = _1784 * _1562;
    float _1830 = _1764 * _1562;
    float _1832 = _1514 * _1562;
    float _1834 = -_1810;
    float _1836 = fma(_1802, _1818, _1834);
    float _1838 = -_1806;
    float _1840 = _1802 * _1838;
    float _1842 = fma(_1802, _1822, _1824);
    float _1844 = _1832 * _1806;
    float _1846 = fma(_1836, _1816, _1820);
    float _1848 = fma(_1828, _1816, _1840);
    float _1850 = fma(_1802, _1824, _1822);
    float _1852 = -_1818;
    float _1854 = fma(_1802, _1810, _1852);
    float _1856 = fma(_1842, _1826, _1846);
    float _1858 = fma(_1830, _1826, _1848);
    float _1860 = fma(_1850, _1816, _1844);
    float _1862 = -_1496;
    float _1864 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1866 = _1416 + _1856;
    float _1868 = _1376 + _1858;
    float _1870 = fma(_1854, _1826, _1860);
    float _1872 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1876 = _1866 + _1874;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1880 = _1868 + _1878;
    float _1882 = _950 + _1870;
    float _1884 = _1876 * _1876;
    float _1886 = -_1548;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1890 = fma(_1880, _1880, _1884);
    float _1892 = -_1516;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1376);
    float _1896 = sqrt(_1890);
    float _1898 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1872);
    bool _1900 = _1896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1872;
    float _1904 = _1894;
    float _1906 = _1888;
    if (!_1900)
    {
        _970 = _1868;
    }
    float _1908 = _970;
    float _1910 = _1908;
    if (!_1900)
    {
        _1426 = _1866;
    }
    float _1912 = _1426;
    float _1914 = _1912;
    if (!_1900)
    {
        _1902 = _1882;
    }
    float _1916 = _1902;
    bool _1918 = !_1900;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1896 + _1924;
        float _1928 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = rsqrt(_1890);
        float _1932 = _1926 * _1922;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = sin(_1940);
        float _1944 = _1938 + (-1.0);
        float _1946 = fma(_1942, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1948 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1930 * _1946;
        float _1952 = fma(_1882, _1938, _1948);
        float _1954 = fma(_1880, _1950, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1956 = fma(_1876, _1950, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1920 = _1952;
        _1910 = _1954;
        _1914 = _1956;
    }
    float _1958 = _1920;
    float _1960 = _1910;
    float _1962 = _1914;
    float _1964 = -_1496;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1968 = -_1516;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1972 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1898);
    float _1974 = -_1548;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1980 = _1966 + _1978;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1984 = _1970 + _1982;
    float _1986 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1990 = _1976 + _1988;
    float _1992 = _1980 * _1980;
    float _1994 = 1.0 / _1986;
    float _1996 = fma(_1984, _1984, _1992);
    float _1998 = _1864 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2000 = fma(_1990, _1990, _1996);
    float _2002 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1998);
    float _2004 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2006 = rsqrt(_2000);
    float _2008 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2002);
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2012 = floor(_2004);
    float _2014 = _2010 + _1986;
    float _2016 = _2014 * _1994;
    float _2018 = _2016 * 0.5;
    float _2020 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2022 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2026 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2024);
    float _2028 = _1864 + _2020;
    float _2030 = _1984 * _2022;
    float _2032 = _1990 * _2022;
    float _2034 = 1.0 / _2026;
    float _2036 = _2030 * _2030;
    float _2038 = _2032 * _2032;
    float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2042 = -_2012;
    float _2044 = _2004 + _2042;
    float _2046 = _2036 + _2038;
    float _2048 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2040);
    float _2050 = sqrt(_2046);
    float _2052 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2048);
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2058 = _2034 * _2056;
    float _2060 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2062 = trunc(_2054);
    int _2064 = int(_2062);
    bool _2066 = _2058 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2068 = fma(_1894, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2060);
    bool _2070 = _2058 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2072 = !_2066;
    int _2074 = _2072 ? 0 : 1;
    float _2076 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2068);
    bool _2078 = _2050 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2082 = _2050 + _2080;
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2086 = 2;
    float _2088 = _2046;
    float _2090 = _2082;
    float _2092 = _2030;
    float _2094 = _2032;
    float _2096 = _2036;
    float _2098 = _2038;
    float _2100 = _2084;
    float _2102 = _2012;
    if (!_2066)
    {
        _2086 = 1;
    }
    int _2104 = _2086;
    float _2106 = trunc(_2084);
    int _2108 = int(_2106);
    int _2110 = _2104;
    if (!_2070)
    {
        _2110 = _2074;
    }
    int _2112 = _2110;
    int _2114 = _2112 << 6;
    float _2116 = _1994;
    float _2118 = as_type<float>(_2112);
    if (_2078)
    {
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2116 = _2120;
    }
    float _2122 = _2116;
    int _2124 = _2114 + 96;
    uint _2127 = uint(int(uint(_2124) >> uint(2)));
    uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
    int _2131 = int(_2127) & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    int _2135 = int(_2127) + 1;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    int _2139 = _2135 & 3;
    float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
    float _2143 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2147 = _2064 + _2145;
    int _2149 = _2147 + 1;
    bool _2151 = _2149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    uint _2153 = uint(_2149);
    if (_2078)
    {
        float _2155 = rsqrt(_2046);
        _2088 = _2155;
    }
    float _2157 = _2088;
    int _2159 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2161 = _2108 + _2159;
    int _2163 = _2161 + 1;
    int _2165 = _2114 + 104;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    uint _2169 = uint(int(uint(int(_2167)) >> uint(2)));
    int _2171 = int(_2167) & 3;
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[int(_2169)][_2171];
    int _2175 = int(_2167) + 1;
    uint _2177 = uint(int(uint(_2175) >> uint(2)));
    int _2179 = _2175 & 3;
    float _2181 = (*spvDescriptorSet0.vp_c15)._m0[int(_2177)][_2179];
    int _2183 = _2149 | _2163;
    float _2185 = as_type<float>(_2163);
    if (_2078)
    {
        float _2187 = _2082 * _2122;
        _2090 = _2187;
    }
    float _2189 = _2090;
    int _2191 = _2114 + 48;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
    int _2197 = int(_2193) & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    int _2201 = int(_2193) + 1;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    int _2205 = _2201 & 3;
    float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
    bool _2209 = _2183 < 0;
    bool _2211 = _2209 || _2151;
    float _2213 = _2189;
    if (_2078)
    {
        float _2215 = _2189 * 0.15915493667125701904296875;
        _2213 = _2215;
    }
    float _2217 = _2213;
    float _2219 = floor(_2143);
    float _2221 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _2223 = _2163 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2225 = _2223 || _2211;
    int _2227 = _2114 + 64;
    uint _2229 = uint(int(uint(_2227) >> uint(2)));
    uint _2231 = uint(int(uint(int(_2229)) >> uint(2)));
    int _2233 = int(_2229) & 3;
    float _2235 = (*spvDescriptorSet0.vp_c15)._m0[int(_2231)][_2233];
    int _2237 = int(_2229) + 1;
    uint _2239 = uint(int(uint(_2237) >> uint(2)));
    int _2241 = _2237 & 3;
    float _2243 = (*spvDescriptorSet0.vp_c15)._m0[int(_2239)][_2241];
    float _2245 = precise::max(0.0, _2221);
    float _2247 = 0.0;
    if (_2078)
    {
        float _2249 = _2217 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        _2247 = _2251;
    }
    float _2253 = _2247;
    float _2255 = -_2022;
    float _2257 = -_2245;
    float _2259 = fma(_1980, _2255, _2257);
    int _2261 = _2114 + 80;
    uint _2263 = uint(int(uint(_2261) >> uint(2)));
    uint _2265 = uint(int(uint(int(_2263)) >> uint(2)));
    int _2267 = int(_2263) & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    int _2271 = int(_2263) + 1;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    int _2275 = _2271 & 3;
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[int(_2273)][_2275];
    float _2279 = 0.0;
    float _2281 = _2259;
    if (_2078)
    {
        float _2283 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2279 = _2283;
    }
    float _2285 = _2279;
    int _2287 = as_type<int>(_1224);
    if (_2078)
    {
        float _2289 = _2217 * 6.283185482025146484375;
        float _2291 = cos(_2289);
        _2287 = as_type<int>(_2291);
    }
    int _2293 = _2287;
    if (!_2225)
    {
        int _2295 = _2163 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2297 = _2295 + _2149;
        _2153 = uint(_2297);
    }
    uint _2299 = _2153;
    float _2301 = -_2219;
    float _2303 = _2143 + _2301;
    int _2305 = _2114 + 56;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[int(_2317)][_2319];
    int _2323 = as_type<int>(_2141);
    float _2325 = _2253;
    int _2327 = _2293;
    float _2329 = as_type<float>(_2299);
    if (_2078)
    {
        float _2331 = fma(_2253, _2285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2185 = _2331;
    }
    float _2333 = _2185;
    float _2335 = _2285;
    float _2337 = _2333;
    if (!_2225)
    {
        float _2339 = floor(_2084);
        _2335 = _2339;
    }
    float _2341 = _2335;
    if (_2078)
    {
        float _2343 = _2157 * _2333;
        _2337 = _2343;
    }
    float _2345 = _2337;
    int _2347 = _2114 + 72;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    uint _2351 = uint(int(uint(int(_2349)) >> uint(2)));
    int _2353 = int(_2349) & 3;
    float _2355 = (*spvDescriptorSet0.vp_c15)._m0[int(_2351)][_2353];
    int _2357 = int(_2349) + 1;
    uint _2359 = uint(int(uint(_2357) >> uint(2)));
    int _2361 = _2357 & 3;
    float _2363 = (*spvDescriptorSet0.vp_c15)._m0[int(_2359)][_2361];
    float _2365 = _2028 * _2141;
    if (!_2225)
    {
        uint _2367 = uint(int(uint(int(_2299)) >> uint(2)));
        _2323 = int(_2367);
    }
    int _2369 = _2323;
    if (_2078)
    {
        float _2371 = as_type<float>(_2293) + (-1.0);
        _2325 = _2371;
    }
    float _2373 = _2325;
    float _2375 = _2373;
    if (_2078)
    {
        float _2377 = _2030 * _2345;
        _2092 = _2377;
    }
    float _2379 = _2092;
    if (_2078)
    {
        float _2381 = _2032 * _2345;
        _2094 = _2381;
    }
    float _2383 = _2094;
    float _2385 = fma(_1894, _2133, _2365);
    if (_2078)
    {
        float _2387 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2375 = _2387;
    }
    float _2389 = _2375;
    int _2391 = _2114 + 88;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    uint _2395 = uint(int(uint(int(_2393)) >> uint(2)));
    int _2397 = int(_2393) & 3;
    float _2399 = (*spvDescriptorSet0.vp_c15)._m0[int(_2395)][_2397];
    int _2401 = int(_2393) + 1;
    uint _2403 = uint(int(uint(_2401) >> uint(2)));
    int _2405 = _2401 & 3;
    float _2407 = (*spvDescriptorSet0.vp_c15)._m0[int(_2403)][_2405];
    if (_2078)
    {
        float _2409 = _2379 * _2379;
        _2096 = _2409;
    }
    float _2411 = _2096;
    int _2413 = as_type<int>(_2411);
    if (_2078)
    {
        float _2415 = _2383 * _2383;
        _2098 = _2415;
    }
    float _2417 = _2098;
    if (_2078)
    {
        float _2419 = fma(_2259, as_type<float>(_2293), _2389);
        _2281 = _2419;
    }
    float _2421 = _2281;
    if (!_2225)
    {
        int _2423 = int(_2299) << 2;
        _2327 = _2423;
    }
    int _2425 = _2327;
    float _2427 = sqrt(_2000);
    float _2429 = fma(_1888, _2173, _2385);
    float _2431 = fma(_2421, _2421, _2411);
    int _2433 = _2425;
    if (!_2225)
    {
        int _2435 = 12 & _2425;
        _2433 = _2435;
    }
    int _2437 = _2433;
    float _2439 = _2028 * _2207;
    float _2441 = _2431 + _2417;
    if (!_2225)
    {
        int _2443 = _2369 << 4;
        int _2445 = _2443 + _2437;
        _2413 = _2445;
    }
    int _2447 = _2413;
    float _2449 = _2429 + _2181;
    float _2451 = fma(_1894, _2199, _2439);
    float _2453 = rsqrt(_2441);
    float _2455 = _2028 * _2243;
    float _2457 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2225)
    {
        float _2459 = -_2341;
        float _2461 = _2084 + _2459;
        _2100 = _2461;
    }
    float _2463 = _2100;
    float _2465 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2467 = fma(_1894, _2235, _2455);
    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2471 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2469);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2457);
    float _2477 = 1.0 / _2449;
    float _2479 = _2028 * _2277;
    float _2481 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2483 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2475);
    float _2485 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2465);
    float _2487 = fma(_1894, _2269, _2479);
    float _2489 = -_2473;
    float _2491 = _2489 + 1.0;
    float _2493 = _2483 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2495 = _2453 * _2379;
    float _2497 = fma(_1888, _2313, _2451);
    float _2499 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2501 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2503 = _2497 + _2321;
    float _2505 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2507 = _2453 * _2421;
    float _2509 = -_2499;
    float _2511 = fma(_2509, _2481, 1.0);
    float _2513 = fma(_1888, _2355, _2467);
    float _2515 = _2453 * _2383;
    float _2517 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2505);
    float _2519 = abs(_2491);
    float _2521 = log2(_2519);
    float _2523 = _2503 * _2477;
    float _2525 = _2513 + _2363;
    float _2527 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2517);
    float _2529 = _2513;
    if (!_2225)
    {
        int _2531 = _2447 + 400;
        uint _2533 = uint(int(uint(_2531) >> uint(2)));
        uint _2535 = uint(int(uint(int(_2533)) >> uint(2)));
        int _2537 = int(_2533) & 3;
        float _2539 = (*spvDescriptorSet0.vp_c15)._m0[int(_2535)][_2537];
        _2529 = _2539;
    }
    float _2541 = _2529;
    float _2543 = fma(_1888, _2399, _2487);
    float _2545 = -_2501;
    float _2547 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2545);
    float _2549 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2551 = _2523 >= 0.0;
    float _2553 = _1966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2555 = -_2515;
    float _2557 = fma(_2555, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2547);
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2561 = _2525 * _2477;
    float _2563 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2553);
    float _2565 = fma(_2557, -0.5, 0.5);
    bool _2567 = _2523 <= 1.0;
    bool _2569 = _2567 && _2551;
    float _2571 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2573 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2563);
    float _2575 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2485);
    bool _2577 = _2561 >= 0.0;
    bool _2579 = _2577 && _2569;
    float _2581 = exp2(_2571);
    float _2583 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2585 = fma(_2557, 0.5, 0.5);
    float _2587 = _2575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2589 = _2561 <= 1.0;
    bool _2591 = _2589 && _2579;
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2559);
    float _2595 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2597 = sqrt(_2565);
    float _2599 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2593);
    float _2601 = _2507 + 1.0;
    float _2603 = _2543 + _2407;
    float _2605 = fma(_2585, _2595, -0.212114393711090087890625);
    float _2607 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2599);
    float _2609 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2611 = _2603 * _2477;
    float _2613 = -_2507;
    float _2615 = fma(_2581, _2601, _2613);
    float _2617 = _2363;
    float _2619 = _2561;
    if (!_2225)
    {
        float _2621 = floor(_2054);
        _2617 = _2621;
    }
    float _2623 = _2617;
    float _2625 = fma(_2585, _2605, 1.570728778839111328125);
    float _2627 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (_2591)
    {
        float _2629 = float(_2112);
        _2118 = _2629;
    }
    float _2631 = _2118;
    float _2633 = fma(_2615, 0.5, 0.5);
    float _2635 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2627);
    float _2637 = _2597 * 0.636619746685028076171875;
    float _2639 = 1.0 / _2607;
    float _2641 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2609);
    float _2643 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2635);
    float _2645 = -_2625;
    float _2647 = fma(_2637, _2645, 1.0);
    float _2649 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2641);
    float _2651 = log2(_2511);
    float _2653 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2649);
    float _2655 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2643);
    float _2657 = _2623;
    if (!_2225)
    {
        float _2659 = -_2623;
        float _2661 = _2054 + _2659;
        _2657 = _2661;
    }
    float _2663 = _2657;
    float _2665 = _2641;
    if (_2591)
    {
        float _2667 = rint(_2631);
        float _2669 = precise::max(_2667, 0.0);
        uint _2671 = uint(_2669);
        uint _2673 = clamp(_2671, 0u, 65535u);
        _2665 = as_type<float>(_2673);
    }
    float _2675 = _2665;
    float _2677 = _2653 * _2639;
    float _2679 = _2651 * 0.693147182464599609375;
    float _2681 = _2655 * _2639;
    float _2683 = fma(_2677, 0.5, 0.5);
    float _2685 = _2541;
    if (!_2225)
    {
        float _2687 = rint(_2541);
        float _2689 = precise::max(_2687, 0.0);
        uint _2691 = uint(_2689);
        uint _2693 = clamp(_2691, 0u, 65535u);
        _2685 = as_type<float>(_2693);
    }
    float _2695 = _2685;
    float2 _7667 = float2(_2044, _2303);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7667, float2(0.0), isnan(_7667)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7667, float2(0.0), isnan(_7667)), level(0.0)).x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2701 = fma(_2681, -0.5, 0.5);
    float _2703 = _2679;
    if (_2591)
    {
        float3 _7689 = float3(_2523, _2561, float(as_type<int>(_2675)));
        float3 _7693 = select(_7689, float3(0.0), isnan(_7689));
        float _2705 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7693.xy, uint(rint(_7693.z)), _2611, level(0.0));
        _2703 = _2705;
    }
    float _2707 = _2703;
    float3 _7703 = float3(_2683, _2701, _2699);
    float _2709 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7703, float3(0.0), isnan(_7703)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7703, float3(0.0), isnan(_7703)), level(0.0)).x;
    float3 _7712 = float3(_2683, _2701, _2699);
    float4 _2712 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7712, float3(0.0), isnan(_7712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7712, float3(0.0), isnan(_7712)), level(0.0)).xyzw;
    float _2714 = _2712.x;
    float _2716 = _2712.y;
    float _2718 = _2712.z;
    float _2720 = _2712.w;
    float2 _7728 = float2(_2647, _2633);
    float3 _2724 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7728, float2(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7728, float2(0.0), isnan(_7728)), level(0.0)).xyz;
    float _2726 = _2724.x;
    float _2728 = _2724.y;
    float _2730 = _2724.z;
    float _2732 = _2463;
    int _2734 = as_type<int>(_2695);
    if (!_2225)
    {
        float3 _7751 = float3(_2663, _2463, float(as_type<int>(_2695)));
        float3 _7753 = select(_7751, float3(0.0), isnan(_7751));
        float _2736 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7753.xy, uint(rint(_7753.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7753.xy, uint(rint(_7753.z)), level(0.0)).x;
        _2732 = _2736;
    }
    float _2738 = _2732;
    float _2740 = in.m_69.x;
    float _2742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2744 = _746 > 0.5;
    float _2746 = in.m_69.y;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2750 = _2748 != 0;
    float _2752 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2756 = _2754 != 0;
    float _2758 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2760 = _944 > 0.5;
    float _2762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2764 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2752);
    float _2766 = fma(_2493, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2764);
    int _2768 = as_type<int>(_2683);
    if (_2750)
    {
        float _2770 = in.m_65.z;
        _2768 = as_type<int>(_2770);
    }
    int _2772 = _2768;
    float _2774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2756)
    {
        bool _2776 = _756 > 0.5;
        _1428 = _2776;
    }
    bool _2778 = _1428;
    float _2780 = fma(_2587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2766);
    float _2782 = _2740;
    if (_2756)
    {
        float _2784 = -_2740;
        float _2786 = _2784 + 1.0;
        _2734 = as_type<int>(_2786);
    }
    int _2788 = _2734;
    if (!_2756)
    {
        _2619 = _2740;
    }
    float _2790 = _2619;
    float _2792 = _2790;
    if (_2750)
    {
        float _2794 = -_2740;
        float _2796 = _2794 + 1.0;
        _872 = as_type<int>(_2796);
    }
    int _2798 = _872;
    float _2800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2802 = -_2746;
    float _2804 = _2802 + 1.0;
    float _2806 = _2746;
    if (_2756)
    {
        float _2808 = _2778 ? as_type<float>(_2788) : _2740;
        _2792 = _2808;
    }
    float _2810 = _2792;
    out.gl_Position.x = _2653;
    out.gl_Position.y = _2655;
    out.gl_Position.z = _2780;
    out.gl_Position.w = _2607;
    int _2812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2814 = _2812 != 0;
    int _2816 = _2744 ? as_type<int>(_2804) : as_type<int>(_2746);
    float _2818 = _2810 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2822 = _2820 != 0;
    float _2824 = abs(_2058);
    float _2826 = log2(_2824);
    float _2828 = _2814 ? as_type<float>(_2816) : _2746;
    int _2830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2832 = _2830 != 0;
    int _2834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2836 = _2834 != 0;
    float _2838 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2840 = _2760 ? as_type<int>(_2804) : as_type<int>(_2746);
    float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2844 = _2822;
    float _2846 = _2838;
    if (!_2750)
    {
        _2102 = _2740;
    }
    float _2848 = _2102;
    float _2850 = _2818 * _2742;
    float _2852 = _2836 ? as_type<float>(_2840) : _2746;
    bool _2854 = _748 > 0.5;
    bool _2856 = _2058 <= 8000.0;
    bool _2858 = isnan(_2058);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan(8000.0);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2870 = _2848;
    float _2872 = _2850;
    if (_2822)
    {
        float _2874 = _2854 ? _2804 : _2746;
        _2806 = _2874;
    }
    float _2876 = _2806;
    float _2878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2880 = _2772;
    if (_2750)
    {
        bool _2882 = as_type<float>(_2772) > 0.5;
        _2844 = _2882;
    }
    bool _2884 = _2844;
    if (_2832)
    {
        float _2886 = -_2740;
        float _2888 = _2886 + 1.0;
        _2880 = as_type<int>(_2888);
    }
    int _2890 = _2880;
    float _2892 = _2876 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2750)
    {
        float _2894 = _2884 ? as_type<float>(_2798) : _2740;
        _2870 = _2894;
    }
    float _2896 = _2870;
    if (_2832)
    {
        float _2898 = _2760 ? as_type<float>(_2890) : _2740;
        _2782 = _2898;
    }
    float _2900 = _2782;
    float _2902 = _2852 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2904 = _2892 * _2800;
    float _2906 = in.m_71.x;
    float _2908 = in.m_71.y;
    float _2910 = in.m_71.z;
    float _2912 = exp2(_2868);
    float _2914 = _2902 * _2762;
    bool _2916 = _1776 != 0.0;
    bool _2918 = isnan(_1776);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan(0.0);
    bool _2924 = _2920 || _2922;
    float _2926 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2928 = _2896 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2930 = _2838 * _2878;
    bool _2932 = _1788 == 0.0;
    bool _2934 = !_2924;
    bool _2936 = _2932 && _2934;
    float _2938 = _2926 * _2842;
    float _2940 = in.m_73.x;
    float _2942 = in.m_73.y;
    float _2944 = in.m_73.z;
    float _2946 = in.m_73.w;
    bool _2948 = _1780 == 0.0;
    bool _2950 = _2948 && _2936;
    float _2952 = _2928 * _2774;
    out.m_75.x = _2938;
    out.m_75.y = _2930;
    float _2954 = exp2(_2758);
    float _2956 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    out.m_77.x = _2850;
    out.m_77.y = _2914;
    out.m_77.z = _2952;
    out.m_77.w = _2904;
    float _2960 = fma(_2958, -2.0, 3.0);
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (_2950)
    {
        _2846 = _2906;
    }
    float _2964 = _2846;
    float _2966 = _2964;
    if (!_2950)
    {
        float _2968 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2906);
        _2966 = _2968;
    }
    float _2970 = _2966;
    if (_2950)
    {
        _2962 = _2908;
    }
    float _2972 = _2962;
    float _2974 = _2972;
    if (!_2950)
    {
        float _2976 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2974 = _2976;
    }
    float _2978 = _2974;
    float _2980 = -_2954;
    float _2982 = _2980 + 1.0;
    float _2984 = _2958 * _2958;
    if (_2950)
    {
        _2872 = _2910;
    }
    float _2986 = _2872;
    float _2988 = _2944 * _2906;
    float _2990 = _2986;
    if (!_2950)
    {
        float _2992 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2910);
        _2990 = _2992;
    }
    float _2994 = _2990;
    float _2996 = _2984 * _2960;
    float _2998 = _2940 * _2908;
    float _3000 = -_2988;
    float _3002 = fma(_2940, _2910, _3000);
    float _3004 = _2942 * _2910;
    float _3006 = -_2942;
    float _3008 = _1802 * _3006;
    float _3010 = _1832 * _2942;
    float _3012 = _1808 * _2942;
    float _3014 = -_2998;
    float _3016 = fma(_2942, _2906, _3014);
    float _3018 = fma(_1828, _2940, _3008);
    float _3020 = fma(_1850, _2940, _3010);
    float _3022 = -_3004;
    float _3024 = fma(_2944, _2908, _3022);
    float _3026 = _3002 * _2946;
    float _3028 = fma(_1836, _2940, _3012);
    float _3030 = fma(_1830, _2944, _3018);
    float _3032 = fma(_1854, _2944, _3020);
    float _3034 = -_2978;
    float _3036 = _1802 * _3034;
    float _3038 = _1832 * _2978;
    float _3040 = _1808 * _2978;
    float _3042 = _3024 * _2946;
    float _3044 = -_3026;
    float _3046 = _1802 * _3044;
    float _3048 = _1832 * _3026;
    float _3050 = _1808 * _3026;
    float _3052 = _3016 * _2946;
    float _3054 = fma(_1828, _3042, _3046);
    float _3056 = fma(_1850, _3042, _3048);
    float _3058 = fma(_1836, _3042, _3050);
    float _3060 = -_2996;
    float _3062 = _3060 + 1.0;
    float _3064 = fma(_1830, _3052, _3054);
    float _3066 = fma(_1854, _3052, _3056);
    float _3068 = fma(_1842, _3052, _3058);
    float _3070 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2996);
    float _3072 = fma(_1842, _2944, _3028);
    float _3074 = fma(_1828, _2970, _3036);
    float _3076 = fma(_1850, _2970, _3038);
    float _3078 = _2866 * _3070;
    out.m_79.x = _3064;
    out.m_79.y = _3066;
    out.m_79.z = _3068;
    float _3080 = fma(_1836, _2970, _3040);
    float _3082 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _3030;
    out.m_81.y = _3032;
    out.m_81.z = _3072;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3086 = _3064;
    if (!_2591)
    {
        _3086 = 1.0;
    }
    float _3088 = _3086;
    float _3090 = fma(_1830, _2994, _3074);
    float _3092 = fma(_1854, _2994, _3076);
    float _3094 = fma(_1842, _2994, _3080);
    float _3096 = -_2697;
    float _3098 = _3096 + 1.0;
    float _3100 = _3098 * _3084;
    float _3102 = precise::clamp(_3100, 0.0, 1.0);
    float _3104 = _3088;
    float _3106 = _3098;
    if (_2591)
    {
        bool _3108 = _2707 >= _2611;
        bool _3110 = isnan(_2707);
        bool _3112 = _3108 || _3110;
        bool _3114 = isnan(_2611);
        bool _3116 = _3112 || _3114;
        float _3118 = float(_3116);
        _3104 = _3118;
    }
    float _3120 = _3104;
    if (_2225)
    {
        _3106 = 1.0;
    }
    float _3122 = _3106;
    float _3124 = _3122;
    if (!_2225)
    {
        int _3126 = int(_2299) << 4;
        int _3128 = _3126 + 2048;
        uint _3130 = uint(int(uint(_3128) >> uint(2)));
        uint _3132 = uint(int(uint(int(_3130)) >> uint(2)));
        int _3134 = int(_3130) & 3;
        float _3136 = (*spvDescriptorSet0.vp_c15)._m0[int(_3132)][_3134];
        int _3138 = int(_3130) + 1;
        uint _3140 = uint(int(uint(_3138) >> uint(2)));
        int _3142 = _3138 & 3;
        float _3144 = (*spvDescriptorSet0.vp_c15)._m0[int(_3140)][_3142];
        int _3146 = _3128 + 8;
        uint _3148 = uint(int(uint(_3146) >> uint(2)));
        uint _3150 = uint(int(uint(int(_3148)) >> uint(2)));
        int _3152 = int(_3148) & 3;
        float _3154 = (*spvDescriptorSet0.vp_c15)._m0[int(_3150)][_3152];
        int _3156 = int(_3148) + 1;
        uint _3158 = uint(int(uint(_3156) >> uint(2)));
        int _3160 = _3156 & 3;
        float _3162 = (*spvDescriptorSet0.vp_c15)._m0[int(_3158)][_3160];
        float _3164 = _2028 * _3144;
        float _3166 = fma(_1894, _3136, _3164);
        float _3168 = fma(_1888, _3154, _3166);
        float _3170 = _3168 + _3162;
        float _3172 = precise::clamp(_3170, 0.0, 1.0);
        float _3174 = -_3172;
        float _3176 = _3174 + _2738;
        float _3178 = fma(_3176, 500.0, 1.5);
        float _3180 = exp2(_3178);
        float _3182 = 0.0 + _3180;
        float _3184 = precise::clamp(_3182, 0.0, 1.0);
        _3124 = _3184;
        _1904 = _3180;
        _2329 = as_type<float>(_3128);
    }
    float _3186 = _3124;
    float _3188 = _1904;
    float _3190 = _2329;
    float _3192 = _3120 * _3186;
    float _3194 = _3082 * _2709;
    float _3196 = -_3102;
    float _3198 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3200 = -_3082;
    float _3202 = _3200 + 1.0;
    out.m_83.x = _3090;
    out.m_83.y = _3092;
    out.m_83.z = _3094;
    float _3204 = _2720 * _3194;
    float _3206 = -_3192;
    float _3208 = fma(_3206, _3198, 1.0);
    float _3210 = precise::clamp(_3208, 0.0, 1.0);
    float _3212 = _2730 * _3194;
    float _3214 = _2720 * _3202;
    float _3216 = fma(_2726, _3204, _2714);
    float _3218 = fma(_2728, _3204, _2716);
    float _3220 = _3210 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3222 = fma(_2720, _3212, _2718);
    out.m_85.x = _1970;
    out.m_85.y = _1966;
    out.m_85.z = _1976;
    bool _3224 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3226 = isnan(_2427);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3232 = _3228 || _3230;
    out.m_87.x = _3220;
    out.m_89.x = _3216;
    out.m_89.y = _3218;
    out.m_89.z = _3222;
    out.m_89.w = _3214;
    float _3234 = _3210;
    float _3236 = _3212;
    float _3238 = _3190;
    float _3240 = _3188;
    float _3242 = _3204;
    if (!_3232)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3244 = _3234;
    float _3246 = _3244;
    float _3248 = _3244;
    if (!_3232)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3250 = _3236;
    float _3252 = _3250;
    float _3254 = _3250;
    if (!_3232)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3256 = _1906;
    float _3258 = _3256;
    float _3260 = _3256;
    if (!_3232)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3262 = _3238;
    float _3264 = _3262;
    float _3266 = _3262;
    if (!_3232)
    {
        _3240 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3268 = _3240;
    float _3270 = _3268;
    float _3272 = _3268;
    if (!_3232)
    {
        _3242 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3274 = _3242;
    bool _3276 = !_3232;
    float _3278 = _3274;
    float _3280 = _3274;
    if (!_3276)
    {
        bool _3282 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3284 = isnan(_2427);
        bool _3286 = _3282 || _3284;
        bool _3288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3290 = _3286 || _3288;
        if (!_3290)
        {
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3294 = _2427 + _3292;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3298 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3296;
            float _3300 = 1.0 / _3298;
            float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3322 = _3294 * _3300;
            float _3324 = precise::clamp(_3322, 0.0, 1.0);
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3330 = fma(_3324, _3304, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3332 = fma(_3324, _3328, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3334 = fma(_3324, _3308, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3336 = fma(_3324, _3312, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3338 = fma(_3324, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3340 = fma(_3324, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3254 = _3332;
            _3272 = _3338;
            _3248 = _3330;
            _3266 = _3336;
            _3260 = _3334;
            _3280 = _3340;
            _3342 = true;
        }
        else
        {
            bool _3344 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3346 = isnan(_2427);
            bool _3348 = _3344 || _3346;
            bool _3350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3352 = _3348 || _3350;
            if (!_3352)
            {
                _3246 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3354 = _3246;
            _3248 = _3354;
            if (!_3352)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3356 = _3252;
            _3254 = _3356;
            if (!_3352)
            {
                _3258 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3358 = _3258;
            _3260 = _3358;
            if (!_3352)
            {
                _3264 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3360 = _3264;
            _3266 = _3360;
            if (!_3352)
            {
                _3270 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3362 = _3270;
            _3272 = _3362;
            if (!_3352)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3364 = _3278;
            bool _3366 = !_3352;
            _3280 = _3364;
            if (!_3366)
            {
                bool _3368 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3370 = isnan(_2427);
                bool _3372 = _3368 || _3370;
                bool _3374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3376 = _3372 || _3374;
                if (!_3376)
                {
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3380 = _2427 + _3378;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3382;
                    float _3386 = 1.0 / _3384;
                    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3390 = _3388 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3408 = _3380 * _3386;
                    float _3410 = precise::clamp(_3408, 0.0, 1.0);
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3416 = fma(_3410, _3390, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3418 = fma(_3410, _3414, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3420 = fma(_3410, _3394, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3422 = fma(_3410, _3398, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3424 = fma(_3410, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3426 = fma(_3410, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3254 = _3418;
                    _3272 = _3424;
                    _3248 = _3416;
                    _3266 = _3422;
                    _3260 = _3420;
                    _3280 = _3426;
                    _3342 = true;
                }
                else
                {
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3272 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3248 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3266 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3260 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3342 = false;
    float _3428 = _3254;
    float _3430 = _3272;
    float _3432 = _3248;
    float _3434 = _3266;
    float _3436 = _3260;
    float _3438 = _3280;
    float _3440 = fma(_3092, -0.5, 0.5);
    float _3442 = precise::clamp(_3440, 0.0, 1.0);
    float _3444 = -_3428;
    float _3446 = _3444 + _3430;
    float _3448 = -_3432;
    float _3450 = _3448 + _3434;
    float _3452 = -_3436;
    float _3454 = _3452 + _3438;
    bool _3456 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3458 = fma(_3442, _3446, _3428);
    float _3460 = fma(_3442, _3450, _3432);
    float _3462 = fma(_3442, _3454, _3436);
    float _3464 = _3458 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3466 = fma(_3460, 0.298911988735198974609375, _3464);
    float _3468 = fma(_3462, 0.114477999508380889892578125, _3466);
    out.m_91.x = 0.0;
    float _3470 = -_3468;
    float _3472 = _3460 + _3470;
    float _3474 = -_3468;
    float _3476 = _3458 + _3474;
    float _3478 = -_3468;
    float _3480 = _3462 + _3478;
    float _3482 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3484 = fma(_3472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    float _3486 = fma(_3476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    float _3488 = fma(_3480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3468);
    out.m_87.w = _3482;
    out.m_93.x = _3484;
    out.m_93.y = _3486;
    out.m_93.z = _3488;
    if (!_3456)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3490 = -_1966;
    float _3492 = _3490 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3494 = -_1970;
    float _3496 = _3494 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3498 = -_1976;
    float _3500 = _3498 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3502 = _3492 * _3492;
    float _3504 = fma(_3496, _3496, _3502);
    float _3506 = fma(_3500, _3500, _3504);
    float _3508 = sqrt(_3506);
    float _3510 = rsqrt(_3506);
    float _3512 = -_3508;
    float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3516 = _3514 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3518 = precise::clamp(_3516, 0.0, 1.0);
    float _3520 = _3496 * _3510;
    float _3522 = _3492 * _3510;
    float _3524 = abs(_3518);
    float _3526 = log2(_3524);
    float _3528 = _3500 * _3510;
    float _3530 = _3520 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3532 = _3092 * _3522;
    float _3534 = -_3522;
    float _3536 = -_3530;
    float _3538 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3536);
    float _3540 = fma(_3090, _3520, _3532);
    float _3542 = -_3528;
    float _3544 = fma(_3542, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3538);
    float _3546 = fma(_3094, _3528, _3540);
    float _3548 = precise::clamp(_3546, 0.0, 1.0);
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3552 = _3544 + _3550;
    float _3554 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3556 = _3552 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3558 = precise::clamp(_3556, 0.0, 1.0);
    float _3560 = exp2(_3554);
    float _3562 = _3560 * _3558;
    float _3564 = _3548 * _3562;
    float _3566 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3568 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3570 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3566;
    out.m_91.y = _3568;
    out.m_91.z = _3570;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

