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
    float4 m_81 [[user(locn0)]];
    float4 m_89 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_77 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2276 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_56.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_59.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2621 = as_type<float>(_132);
        out.gl_Position.z = _2621;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_61.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2690 = as_type<float>(_170);
        out.gl_Position.z = _2690;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_63.x;
    float _174 = in.m_63.y;
    float _176 = in.m_63.z;
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _210;
    float _220 = _208;
    float _222 = _202;
    float _224 = _204;
    if (_214)
    {
        float _226 = rsqrt(_202);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = 0.0;
    float _232 = 0.0;
    if (!_214)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _234 = _230;
    float _236 = _232;
    bool _238 = _212 > 0.0;
    float _240 = 0.0;
    float _242 = _212;
    float _244 = _236;
    float _246 = _234;
    if (!_214)
    {
        _240 = 0.0;
    }
    float _248 = _240;
    float _250 = 0.0;
    float _252 = _248;
    if (!_216)
    {
        _250 = 0.0;
        _220 = 0.0;
    }
    float _254 = _250;
    float _256 = _220;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (_216)
    {
        float _264 = rsqrt(_204);
        _258 = _264;
    }
    float _266 = _258;
    if (!_216)
    {
        _242 = 0.0;
    }
    float _268 = _242;
    float _270 = _268;
    if (!_238)
    {
        _222 = 0.0;
    }
    float _272 = _222;
    float _274 = 0.0;
    float _276 = _272;
    if (_238)
    {
        float _278 = rsqrt(_206);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _228;
    if (_214)
    {
        float _284 = _228 * _178;
        _252 = _284;
    }
    float _286 = _252;
    if (_214)
    {
        float _288 = _228 * _172;
        _244 = _288;
    }
    float _290 = _244;
    if (_214)
    {
        float _292 = _228 * _184;
        _246 = _292;
    }
    float _294 = _246;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_238)
    {
        _282 = 0.0;
        _224 = 0.0;
    }
    float _298 = _282;
    float _300 = _224;
    float _302 = _298;
    float _304 = _300;
    if (_216)
    {
        float _306 = _266 * _180;
        _260 = _306;
    }
    float _308 = _260;
    if (_216)
    {
        float _310 = _266 * _174;
        _262 = _310;
    }
    float _312 = _262;
    if (_216)
    {
        float _314 = _266 * _186;
        _270 = _314;
    }
    float _316 = _270;
    if (_238)
    {
        float _318 = _280 * _182;
        _302 = _318;
    }
    float _320 = _302;
    if (_238)
    {
        float _322 = _280 * _176;
        _304 = _322;
    }
    float _324 = _304;
    if (_238)
    {
        float _326 = _280 * _188;
        _276 = _326;
    }
    float _328 = _276;
    bool _330 = !_296;
    float _348;
    if (!_330)
    {
        float _332 = in.m_69.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_116);
        float _354 = 1.0 / _352;
        float _356 = _150 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_56.x;
    float _362 = in.m_56.y;
    float _364 = in.m_56.z;
    float _366 = in.m_65.w;
    float _368 = in.m_67.w;
    float _370 = _180 * _362;
    float _372 = _186 * _362;
    float _374 = fma(_178, _360, _370);
    float _376 = fma(_184, _360, _372);
    float _378 = fma(_182, _364, _374);
    float _380 = fma(_188, _364, _376);
    float _382 = _378 + _366;
    float _384 = _380 + _368;
    float _386 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _388 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _390 = floor(_386);
    float _392 = floor(_388);
    float _394 = -_390;
    float _396 = _386 + _394;
    float _398 = -_392;
    float _400 = _388 + _398;
    float2 _3015 = float2(_396, _400);
    float _402 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3015, float2(0.0), isnan(_3015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3015, float2(0.0), isnan(_3015)), level(0.0)).x;
    float _404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _406 = log2(_404);
    float _408 = in.m_69.x;
    float _410 = in.m_69.y;
    float _412 = in.m_69.z;
    float _414 = _174 * _362;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = _358 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = fma(_172, _360, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _430;
    float _434 = 1.0 / _422;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _446 = _444 != 0;
    float _448 = fma(_176, _364, _428);
    float _450 = in.m_63.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _454 = _358 + _452;
    float _456 = _406 * _150;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _464 = _358 + _462;
    float _466 = 1.0 / _426;
    bool _468 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _476 = _472 || _474;
    bool _478 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _480 = isnan(1.0);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _486 = _482 || _484;
    float _488 = _410 + _412;
    float _490 = _412 + _408;
    float _492 = exp2(_456);
    float _494 = _412 + (-0.5);
    float _496 = _412 * 2.0;
    float _498 = _410 + _408;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _502 = 1.0 + _500;
    float _504 = _410 + (-0.5);
    float _506 = _410 * 2.0;
    float _508 = _488 + (-1.0);
    float _510 = 1.0 / _432;
    float _512 = _464 * _466;
    float _514 = _498 + (-1.0);
    float _516 = _490 + (-1.0);
    float _518 = _418 * _434;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _522 = _358 + _520;
    float _524 = floor(_496);
    float _526 = _408 + (-0.5);
    float _528 = _408 * 2.0;
    float _530 = -_492;
    float _532 = _530 + 1.0;
    bool _534 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _536 = isnan(_358);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = 1.0 / _502;
    float _548 = _476 ? _532 : 0.0;
    float _550 = _454 * _510;
    bool _552 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_358);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_544;
    float _566 = _564 + 1.0;
    bool _568 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _570 = isnan(_358);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = floor(_528);
    bool _582 = _524 > 0.0;
    bool _584 = _524 >= 0.0;
    bool _586 = isnan(_524);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _596 = 1.0 / _460;
    if (_486)
    {
        float _598 = _548 * _546;
        _154 = _598;
    }
    float _600 = _154;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _606;
    int _610 = _592 ? 0 : 1;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = floor(_506);
    float _618 = fma(_608, _518, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _620 = _580 >= 0.0;
    bool _622 = isnan(_580);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    bool _630 = _580 > 0.0;
    float _632 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _634;
    int _638 = _628 ? 0 : 1;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _644 = _522 * _596;
    float _646 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _648;
    bool _652 = _616 > 0.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _654;
    bool _658 = _616 >= 0.0;
    bool _660 = isnan(_616);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _672 = fma(_656, _518, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _674 = fma(_636, _518, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _676 = fma(_614, _512, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _678 = fma(_642, _512, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _680 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _682 = isnan(_358);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_670, _512, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _694 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _696 = isnan(_358);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _714 = -_690;
    float _716 = _714 + 1.0;
    float _718 = _704 * _716;
    float _720 = -_704;
    float _722 = _720 + 1.0;
    float _724 = fma(_604, _550, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _730 = _544 * _722;
    float _732 = fma(_650, _550, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _734 = _562 * _566;
    float _736 = -_562;
    float _738 = _736 + 1.0;
    float _740 = fma(_708, _550, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _746 = fma(_728, _644, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _748 = _578 * _738;
    float _750 = fma(_712, _644, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _752 = -_578;
    float _754 = _752 + 1.0;
    float _756 = _448 + _450;
    float _758 = _618 * _748;
    float _760 = _672 * _748;
    float _762 = fma(_744, _644, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _764 = _674 * _748;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].x, _760);
    float _770 = _756 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _772 = ~_610;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].z, _764);
    int _780 = ~_638;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[11].x, _770);
    int _788 = _776;
    int _790 = _784;
    if (!_582)
    {
        int _792 = ~_610;
        int _794 = _792 + 1;
        _788 = _794;
    }
    int _796 = _788;
    if (!_630)
    {
        int _798 = ~_638;
        int _800 = _798 + 1;
        _790 = _800;
    }
    int _802 = _790;
    float _804 = fma(_692, _734, _768);
    int _806 = _666 ? 0 : 1;
    float _808 = in.m_71.x;
    float _810 = in.m_71.y;
    float _812 = in.m_71.z;
    bool _814 = !_442;
    int _816 = _814 ? 0 : 1;
    float _818 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].z, _786);
    int _820 = ~_806;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    int _826 = abs(_816);
    float _828 = _818 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _830 = _824;
    if (!_652)
    {
        int _832 = ~_806;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_676, _734, _766);
    float _840 = _756 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _842 = fma(_678, _734, _778);
    float _844 = float(_802);
    float _846 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[10].x, _840);
    float _848 = float(_826);
    float _850 = 1.0 / _828;
    float _852 = fma(_732, _730, _804);
    float _854 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].z, _846);
    float _856 = fma(_724, _730, _838);
    float _858 = _848 * _844;
    float _860 = fma(_740, _730, _842);
    float _862 = _854 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _864 = !_438;
    int _866 = _864 ? 0 : 1;
    float _868 = _858 * (-2.0);
    bool _870 = !_446;
    int _872 = _870 ? 0 : 1;
    float _874 = _862 + _828;
    int _876 = abs(_866);
    float _878 = fma(_632, _868, _632);
    float _880 = fma(_868, _810, _810);
    int _882 = abs(_872);
    float _884 = fma(_750, _718, _852);
    float _886 = _874 * _850;
    float _888 = _886 * 0.5;
    float _890 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].y, _880);
    float _892 = fma(_746, _718, _856);
    float _894 = float(_876);
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _896);
    float _900 = float(_882);
    float _902 = fma(_878, _600, _890);
    float _904 = in.m_73.x;
    float _906 = in.m_73.y;
    float _908 = in.m_73.z;
    float _910 = float(_796);
    float _912 = 1.0 / _898;
    float _914 = float(_836);
    float _916 = _902 * 0.15915493667125701904296875;
    float _918 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].x, _884);
    float _920 = _894 * _910;
    float _922 = fma(_762, _718, _860);
    float _924 = _900 * _914;
    float _926 = _920 * (-2.0);
    float _928 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].z, _922);
    float _930 = _924 * (-2.0);
    float _932 = in.m_75.x;
    float _934 = in.m_75.y;
    float _936 = in.m_75.z;
    float _938 = fma(_926, _808, _808);
    float _940 = fma(_646, _926, _646);
    float _942 = fma(_594, _930, _594);
    float _944 = _916 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _950 = fma(_930, _812, _812);
    float _952 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].y, _892);
    float _954 = fma(_940, _600, _948);
    float _956 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[196].z, _950);
    float _958 = _918 * _904;
    float _960 = _952 * _906;
    float _962 = _954 * 0.15915493667125701904296875;
    float _964 = fma(_942, _600, _956);
    float _966 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _970 = _912 * _968;
    float _972 = _962 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = _964 * 0.15915493667125701904296875;
    float _978 = _928 * _908;
    bool _980 = _970 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _982 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _984 = _970 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _988 = _916 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = _756 + _982;
    bool _996 = !_980;
    int _998 = _996 ? 0 : 1;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _1002 = _960 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1004 = _992 * _986;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _1008 = _976 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = _994 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1014 = 2;
    if (!_980)
    {
        _1014 = 1;
    }
    int _1016 = _1014;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1020 = _1016;
    if (!_984)
    {
        _1020 = _998;
    }
    int _1022 = _1020;
    float _1024 = _1002 * _1000;
    float _1026 = _966 * _1006;
    float _1028 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1012);
    float _1030 = _962 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1018);
    float _1036 = _974 * _946;
    float _1038 = _974 * _990;
    int _1040 = _1022 << 6;
    float _1042 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1034);
    float _1044 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1028);
    float _1046 = _976 * 6.283185482025146484375;
    float _1048 = sin(_1046);
    float _1050 = _974 * _1010;
    float _1052 = _1042 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1054 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1056 = _1050 * _1024;
    float _1058 = _1032 * _946;
    float _1060 = _1032 * _990;
    float _1062 = _990 * _1010;
    float _1064 = _1032 * _1010;
    float _1066 = _946 * _1010;
    float _1068 = trunc(_1052);
    int _1070 = int(_1068);
    int _1072 = _1040 + 96;
    uint _1075 = uint(int(uint(_1072) >> uint(2)));
    uint _1077 = uint(int(uint(int(_1075)) >> uint(2)));
    int _1079 = int(_1075) & 3;
    float _1081 = (*spvDescriptorSet0.vp_c15)._m0[int(_1077)][_1079];
    int _1083 = int(_1075) + 1;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    int _1087 = _1083 & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    float _1091 = -_1058;
    float _1093 = fma(_1048, _1038, _1091);
    float _1095 = -_1038;
    float _1097 = fma(_1048, _1058, _1095);
    float _1099 = _1064 * _1024;
    float _1101 = fma(_1048, _1060, _1036);
    float _1103 = -_1024;
    float _1105 = _1048 * _1103;
    float _1107 = fma(_1048, _1036, _1060);
    float _1109 = trunc(_1054);
    int _1111 = int(_1109);
    int _1113 = _1040 + 48;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    float _1131 = fma(_1101, _1026, _1099);
    float _1133 = fma(_1062, _1026, _1105);
    float _1135 = fma(_1093, _1026, _1056);
    float _1137 = fma(_1097, _1004, _1131);
    float _1139 = fma(_1066, _1004, _1133);
    float _1141 = fma(_1107, _1004, _1135);
    int _1143 = _1040 + 104;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.vp_c15)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.vp_c15)._m0[int(_1155)][_1157];
    float _1161 = _1137 * _316;
    float _1163 = _1137 * _308;
    int _1165 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1167 = _1070 + _1165;
    int _1169 = _1167 + 1;
    float _1171 = _1137 * _312;
    float _1173 = fma(_1139, _294, _1161);
    float _1175 = fma(_1139, _286, _1163);
    int _1177 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1179 = _1111 + _1177;
    int _1181 = _1179 + 1;
    int _1183 = _1040 + 64;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.vp_c15)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
    float _1201 = fma(_1141, _328, _1173);
    float _1203 = fma(_1141, _320, _1175);
    bool _1205 = _1169 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1207 = fma(_1139, _290, _1171);
    float _1209 = _384 + _1201;
    int _1211 = _1169 | _1181;
    float _1213 = _382 + _1203;
    int _1215 = _1040 + 56;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    uint _1219 = uint(int(uint(int(_1217)) >> uint(2)));
    int _1221 = int(_1217) & 3;
    float _1223 = (*spvDescriptorSet0.vp_c15)._m0[int(_1219)][_1221];
    int _1225 = int(_1217) + 1;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    int _1229 = _1225 & 3;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[int(_1227)][_1229];
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1209 + _1233;
    bool _1237 = _1211 < 0;
    bool _1239 = _1237 || _1205;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1243 = _1213 + _1241;
    float _1245 = fma(_1141, _324, _1207);
    float _1247 = _1235 * _1235;
    bool _1249 = _1181 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1251 = _1249 || _1239;
    int _1253 = _1040 + 72;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    uint _1257 = uint(int(uint(int(_1255)) >> uint(2)));
    int _1259 = int(_1255) & 3;
    float _1261 = (*spvDescriptorSet0.vp_c15)._m0[int(_1257)][_1259];
    int _1263 = int(_1255) + 1;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    int _1267 = _1263 & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    float _1271 = fma(_1243, _1243, _1247);
    float _1273 = sqrt(_1271);
    float _1275 = _994 * _1089;
    int _1277 = _1040 + 80;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    float _1295 = fma(_382, _1081, _1275);
    uint _1297 = as_type<uint>(_1137);
    float _1299 = _1245;
    float _1301 = _1213;
    float _1303 = _1207;
    if (!_1251)
    {
        int _1305 = _1181 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1307 = _1305 + _1169;
        _1297 = uint(_1307);
    }
    uint _1309 = _1297;
    float _1311 = as_type<float>(_1169);
    if (!_1251)
    {
        float _1313 = floor(_1052);
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = _994 * _1129;
    float _1319 = fma(_382, _1121, _1317);
    bool _1321 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = fma(_384, _1151, _1295);
    float _1325 = _1323 + _1159;
    int _1327 = as_type<int>(_1323);
    int _1329 = as_type<int>(_1159);
    if (!_1251)
    {
        uint _1331 = uint(int(uint(int(_1309)) >> uint(2)));
        _1327 = int(_1331);
    }
    int _1333 = _1327;
    float _1335 = _994 * _1199;
    int _1337 = as_type<int>(_1199);
    float _1339 = _1335;
    int _1341 = _1333;
    if (!_1251)
    {
        int _1343 = int(_1309) << 2;
        _1337 = _1343;
    }
    int _1345 = _1337;
    float _1347 = fma(_382, _1191, _1335);
    if (!_1251)
    {
        int _1349 = 12 & _1345;
        _1329 = _1349;
    }
    int _1351 = _1329;
    float _1353 = 1.0 / _1325;
    if (!_1321)
    {
        _1339 = _1213;
    }
    float _1355 = _1339;
    float _1357 = fma(_384, _1223, _1319);
    float _1359 = _1355;
    if (!_1251)
    {
        int _1361 = _1333 << 4;
        int _1363 = _1361 + _1351;
        _1341 = _1363;
    }
    int _1365 = _1341;
    float _1367 = _1357 + _1231;
    float _1369 = fma(_384, _1261, _1347);
    float _1371 = _756 + _1245;
    float _1373 = _1371;
    if (!_1321)
    {
        _1299 = _1209;
    }
    float _1375 = _1299;
    float _1377 = _1369 + _1269;
    bool _1379 = !_1321;
    float _1381 = _1375;
    float _1383 = _1293;
    if (!_1379)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1273 + _1387;
        float _1391 = rsqrt(_1271);
        float _1393 = _1389 * _1385;
        float _1395 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1401 + (-1.0);
        float _1409 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = fma(_1405, _1395, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1413 = fma(_1371, _1401, _1409);
        float _1415 = _1391 * _1411;
        float _1417 = fma(_1243, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1419 = fma(_1235, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1373 = _1413;
        _1359 = _1417;
        _1381 = _1419;
    }
    float _1421 = _1373;
    float _1423 = _1359;
    float _1425 = _1381;
    int _1427 = _1040 + 88;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    float _1445 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1447 = _1377 * _1353;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1445);
    float _1455 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1457 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    float _1459 = _1209;
    if (!_1251)
    {
        int _1461 = _1365 + 400;
        uint _1463 = uint(int(uint(_1461) >> uint(2)));
        uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
        int _1467 = int(_1463) & 3;
        float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1451);
    float _1475 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1477 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1457);
    float _1479 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1455);
    float _1481 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1487 = _1367 * _1353;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1497 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1499 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    bool _1501 = _1487 >= 0.0;
    float _1503 = -_1495;
    float _1505 = fma(_1503, _1493, 1.0);
    float _1507 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1509 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1499);
    bool _1511 = _1487 <= 1.0;
    bool _1513 = _1511 && _1501;
    float _1515 = _1223;
    if (!_1251)
    {
        float _1517 = floor(_1054);
        _1515 = _1517;
    }
    float _1519 = _1515;
    float _1521 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1523 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1509);
    bool _1525 = _1447 >= 0.0;
    bool _1527 = _1525 && _1513;
    float _1529 = _994 * _1293;
    float _1531 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1521);
    float _1533 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1535 = _1447 <= 1.0;
    bool _1537 = _1535 && _1527;
    float _1539 = 1.0 / _1523;
    float _1541 = fma(_382, _1285, _1529);
    float _1543 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1531);
    float _1545 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1547 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1545);
    float _1549 = _1543;
    if (!_1251)
    {
        float _1551 = -_1519;
        float _1553 = _1054 + _1551;
        _1301 = _1553;
    }
    float _1555 = _1301;
    float _1557 = log2(_1505);
    float _1559 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1561 = fma(_384, _1435, _1541);
    if (_1537)
    {
        float _1563 = float(_1022);
        _1383 = _1563;
    }
    float _1565 = _1383;
    float _1567 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1569 = _1561 + _1443;
    float _1571 = _1559 * _1539;
    float _1573 = _1529;
    float _1575 = _1569;
    if (_1537)
    {
        float _1577 = rint(_1565);
        float _1579 = precise::max(_1577, 0.0);
        uint _1581 = uint(_1579);
        uint _1583 = clamp(_1581, 0u, 65535u);
        _1573 = as_type<float>(_1583);
    }
    float _1585 = _1573;
    float _1587 = _1567 * _1539;
    float _1589 = _1569 * _1353;
    if (!_1251)
    {
        float _1591 = -_1315;
        float _1593 = _1052 + _1591;
        _1575 = _1593;
    }
    float _1595 = _1575;
    float _1597 = fma(_1587, 0.5, 0.5);
    float _1599 = _1557 * 0.693147182464599609375;
    float _1601 = fma(_1571, -0.5, 0.5);
    float _1603 = _1571;
    if (!_1251)
    {
        float _1605 = rint(_1471);
        float _1607 = precise::max(_1605, 0.0);
        uint _1609 = uint(_1607);
        uint _1611 = clamp(_1609, 0u, 65535u);
        _1603 = as_type<float>(_1611);
    }
    float _1613 = _1603;
    float _1615 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = _1447;
    float _1619 = _1615;
    if (_1537)
    {
        float3 _4978 = float3(_1487, _1447, float(as_type<int>(_1585)));
        float3 _4982 = select(_4978, float3(0.0), isnan(_4978));
        float _1621 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4982.xy, uint(rint(_4982.z)), _1589, level(0.0));
        _1617 = _1621;
    }
    float _1623 = _1617;
    float3 _4992 = float3(_1597, _1601, _1615);
    float _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4992, float3(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4992, float3(0.0), isnan(_4992)), level(0.0)).x;
    float3 _5001 = float3(_1597, _1601, _1615);
    float4 _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5001, float3(0.0), isnan(_5001)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5001, float3(0.0), isnan(_5001)), level(0.0)).xyzw;
    float _1630 = _1628.x;
    float _1632 = _1628.y;
    float _1634 = _1628.z;
    float _1636 = _1628.w;
    float _1638 = _1555;
    if (!_1251)
    {
        float3 _5024 = float3(_1595, _1555, float(as_type<int>(_1613)));
        float3 _5026 = select(_5024, float3(0.0), isnan(_5024));
        float _1640 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5026.xy, uint(rint(_5026.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5026.xy, uint(rint(_5026.z)), level(0.0)).x;
        _1638 = _1640;
    }
    float _1642 = _1638;
    if (_1251)
    {
        _1549 = 1.0;
    }
    float _1644 = _1549;
    float _1646 = _1644;
    if (!_1251)
    {
        int _1648 = int(_1309) << 4;
        int _1650 = _1648 + 2048;
        uint _1652 = uint(int(uint(_1650) >> uint(2)));
        uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
        int _1656 = int(_1652) & 3;
        float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
        int _1660 = int(_1652) + 1;
        uint _1662 = uint(int(uint(_1660) >> uint(2)));
        int _1664 = _1660 & 3;
        float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
        int _1668 = _1650 + 8;
        uint _1670 = uint(int(uint(_1668) >> uint(2)));
        uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
        int _1674 = int(_1670) & 3;
        float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
        int _1678 = int(_1670) + 1;
        uint _1680 = uint(int(uint(_1678) >> uint(2)));
        int _1682 = _1678 & 3;
        float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
        float _1686 = _994 * _1666;
        float _1688 = fma(_382, _1658, _1686);
        float _1690 = fma(_384, _1676, _1688);
        float _1692 = _1690 + _1684;
        float _1694 = precise::clamp(_1692, 0.0, 1.0);
        float _1696 = -_1694;
        float _1698 = _1696 + _1642;
        float _1700 = fma(_1698, 500.0, 1.5);
        float _1702 = exp2(_1700);
        float _1704 = 0.0 + _1702;
        float _1706 = precise::clamp(_1704, 0.0, 1.0);
        _1646 = _1706;
    }
    float _1708 = _1646;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1712 = _1421 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1716 = _1423 + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1720 = _1425 + _1718;
    float _1722 = _1712 * _1712;
    float _1724 = fma(_1716, _1716, _1722);
    float _1726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1728 = fma(_1720, _1720, _1724);
    float _1730 = rsqrt(_1728);
    float _1732 = sqrt(_1728);
    float _1734 = _1716 * _1730;
    float _1736 = _1720 * _1730;
    float _1738 = _1712 * _1730;
    float _1740 = precise::max(0.0, _1726);
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1742 * _1742;
    float _1748 = _1744 * _1744;
    float _1750 = -_1738;
    float _1752 = -_1740;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1752);
    float _1756 = _1746 + _1748;
    float _1758 = sqrt(_1756);
    bool _1760 = _1758 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1764 = _1758 + _1762;
    float _1766 = _1052;
    float _1768 = _1726;
    float _1770 = _1756;
    float _1772 = _1764;
    float _1774 = _1742;
    float _1776 = _1744;
    float _1778 = _1746;
    float _1780 = _1748;
    float _1782 = _1754;
    if (_1760)
    {
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1766 = _1784;
    }
    float _1786 = _1766;
    if (_1760)
    {
        float _1788 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1768 = _1788;
    }
    float _1790 = _1768;
    float _1792 = _1790;
    if (_1760)
    {
        float _1794 = rsqrt(_1756);
        _1770 = _1794;
    }
    float _1796 = _1770;
    if (_1760)
    {
        float _1798 = _1764 * _1786;
        _1772 = _1798;
    }
    float _1800 = _1772;
    if (_1760)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1303 = _1802;
    }
    float _1804 = _1303;
    float _1806 = _1786;
    if (_1760)
    {
        float _1808 = _1804 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = _1800;
    if (_1760)
    {
        float _1816 = _1804 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = _1812;
    if (_1760)
    {
        float _1824 = fma(_1812, _1790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1619 = _1824;
    }
    float _1826 = _1619;
    float _1828 = _1826;
    if (_1760)
    {
        float _1830 = _1796 * _1826;
        _1828 = _1830;
    }
    float _1832 = _1828;
    if (_1760)
    {
        float _1834 = _1820 + (-1.0);
        _1792 = _1834;
    }
    float _1836 = _1792;
    if (_1760)
    {
        float _1838 = _1742 * _1832;
        _1774 = _1838;
    }
    float _1840 = _1774;
    if (_1760)
    {
        float _1842 = _1744 * _1832;
        _1776 = _1842;
    }
    float _1844 = _1776;
    if (_1760)
    {
        float _1846 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1846;
    }
    float _1848 = _1822;
    if (_1760)
    {
        float _1850 = _1840 * _1840;
        _1778 = _1850;
    }
    float _1852 = _1778;
    if (_1760)
    {
        float _1854 = _1844 * _1844;
        _1780 = _1854;
    }
    float _1856 = _1780;
    if (_1760)
    {
        float _1858 = fma(_1754, _1820, _1848);
        _1782 = _1858;
    }
    float _1860 = _1782;
    float _1862 = fma(_1860, _1860, _1852);
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1866 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1864);
    float _1868 = precise::clamp(_1866, 0.0, 1.0);
    float _1870 = _1862 + _1856;
    float _1872 = -_1868;
    float _1874 = _1872 + 1.0;
    float _1876 = rsqrt(_1870);
    float _1878 = abs(_1874);
    float _1880 = log2(_1878);
    float _1882 = _1876 * _1840;
    float _1884 = _1876 * _1860;
    float _1886 = _1876 * _1844;
    float _1888 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1890 = -_1888;
    float _1892 = fma(_1884, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1890);
    float _1894 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1896 = -_1886;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1892);
    float _1900 = exp2(_1894);
    float _1902 = fma(_1898, -0.5, 0.5);
    float _1904 = fma(_1898, 0.5, 0.5);
    float _1906 = fma(_1904, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1908 = sqrt(_1902);
    float _1910 = fma(_1904, _1906, -0.212114393711090087890625);
    float _1912 = _1884 + 1.0;
    float _1914 = fma(_1904, _1910, 1.570728778839111328125);
    float _1916 = -_1884;
    float _1918 = fma(_1900, _1912, _1916);
    float _1920 = fma(_1918, 0.5, 0.5);
    float _1922 = _1908 * 0.636619746685028076171875;
    float _1924 = -_1914;
    float _1926 = fma(_1922, _1924, 1.0);
    float2 _5474 = float2(_1926, _1920);
    float3 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5474, float2(0.0), isnan(_5474)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5474, float2(0.0), isnan(_5474)), level(0.0)).xyz;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = in.m_77.x;
    float _1940 = in.m_77.y;
    float _1942 = in.m_77.z;
    float _1944 = abs(_970);
    float _1946 = log2(_1944);
    bool _1948 = _934 != 0.0;
    bool _1950 = isnan(_934);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(0.0);
    bool _1956 = _1952 || _1954;
    float _1958 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1960 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1962 = _932 == 0.0;
    bool _1964 = !_1956;
    bool _1966 = _1962 && _1964;
    float _1968 = -_402;
    float _1970 = _1968 + 1.0;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1974 = exp2(_1958);
    bool _1976 = _936 == 0.0;
    bool _1978 = _1976 && _1966;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1982 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1986 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1994 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1982);
    float _1996 = exp2(_1986);
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_79.x = _1423;
    out.m_79.y = _1421;
    out.m_79.z = _1425;
    float _2000 = _1940;
    float _2002 = _1938;
    float _2004 = _1942;
    if (!_1978)
    {
        float _2006 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1940);
        _2000 = _2006;
    }
    float _2008 = _2000;
    if (!_1978)
    {
        float _2010 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1938);
        _2002 = _2010;
    }
    float _2012 = _2002;
    if (!_1978)
    {
        float _2014 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1942);
        _2004 = _2014;
    }
    float _2016 = _2004;
    float _2018 = _1064 * _2008;
    float _2020 = -_2008;
    float _2022 = _1048 * _2020;
    float _2024 = _1050 * _2008;
    float _2026 = fma(_1101, _2012, _2018);
    float _2028 = fma(_1062, _2012, _2022);
    float _2030 = fma(_1093, _2012, _2024);
    float _2032 = -_1974;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1097, _2016, _2026);
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = fma(_1066, _2016, _2028);
    float _2044 = fma(_1107, _2016, _2030);
    float _2046 = _2036 * _312;
    float _2048 = fma(_2040, -2.0, 3.0);
    float _2050 = _2040 * _2040;
    float _2052 = _2036 * _308;
    float _2054 = fma(_2042, _290, _2046);
    float _2056 = _2036 * _316;
    float _2058 = _2050 * _2048;
    float _2060 = fma(_2042, _286, _2052);
    float _2062 = fma(_2044, _324, _2054);
    float _2064 = fma(_2042, _294, _2056);
    float _2066 = -_2058;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_2044, _320, _2060);
    float _2072 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2074 = fma(_2044, _328, _2064);
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2058);
    bool _2078 = _970 <= 8000.0;
    bool _2080 = isnan(_970);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(8000.0);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1994);
    float _2092 = _2072 * _1625;
    out.m_81.x = _1988;
    out.m_81.y = _1990;
    out.m_81.z = _1992;
    out.m_81.w = _1998;
    float _2094 = _2088 * _2076;
    float _2096 = _2088;
    if (!_1537)
    {
        _2096 = 1.0;
    }
    float _2098 = _2096;
    float _2100 = _2090 + _1523;
    float _2102 = _2098;
    if (_1537)
    {
        bool _2104 = _1623 >= _1589;
        bool _2106 = isnan(_1623);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan(_1589);
        bool _2112 = _2108 || _2110;
        float _2114 = float(_2112);
        _2102 = _2114;
    }
    float _2116 = _2102;
    float _2118 = _2094 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2120 = _2100 * 0.5;
    float _2122 = _1636 * _2092;
    float _2124 = _1970 * _2118;
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = _2116 * _1708;
    float _2130 = -_2072;
    float _2132 = _2130 + 1.0;
    out.gl_Position.x = _1567;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _2090;
    out.gl_Position.w = _1523;
    float _2134 = -_2126;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2138 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2140 = isnan(_1732);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2146 = _2142 || _2144;
    float _2148 = _1636 * _2132;
    out.m_83.z = _2120;
    out.m_83.w = _1523;
    float _2150 = -_2128;
    float _2152 = fma(_2150, _2136, 1.0);
    float _2154 = precise::clamp(_2152, 0.0, 1.0);
    out.m_85.x = _2070;
    out.m_85.y = _2062;
    out.m_85.z = _2074;
    float _2156 = _2154 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2156;
    float _2158 = _2136;
    float _2160 = _2154;
    float _2162 = _2132;
    float _2164 = 1.0;
    float _2166 = 1.0;
    float _2168 = _2122;
    if (!_2146)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2170 = _2158;
    float _2172 = _2170;
    float _2174 = _2170;
    if (!_2146)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2176 = _2160;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    float _2178 = _2176;
    float _2180 = _2176;
    if (!_2146)
    {
        _2162 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2182 = _2162;
    float _2184 = _2182;
    float _2186 = _2182;
    if (!_2146)
    {
        _2164 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2188 = _2164;
    float _2190 = _2188;
    float _2192 = _2188;
    if (!_2146)
    {
        _2166 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2194 = _2166;
    float _2196 = _1936 * _2092;
    float _2198 = fma(_1932, _2122, _1630);
    float _2200 = fma(_1934, _2122, _1632);
    float _2202 = _2194;
    float _2204 = _2194;
    if (!_2146)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2206 = _2168;
    float _2208 = fma(_1636, _2196, _1634);
    out.m_91.x = _2198;
    out.m_91.y = _2200;
    out.m_91.z = _2208;
    out.m_91.w = _2148;
    bool _2210 = !_2146;
    float _2212 = _2206;
    float _2214 = _2206;
    if (!_2210)
    {
        bool _2216 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2218 = isnan(_1732);
        bool _2220 = _2216 || _2218;
        bool _2222 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2224 = _2220 || _2222;
        if (!_2224)
        {
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2228 = _1732 + _2226;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2232 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2230;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2238 = 1.0 / _2232;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2256 = _2228 * _2238;
            float _2258 = precise::clamp(_2256, 0.0, 1.0);
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2264 = fma(_2258, _2236, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2266 = fma(_2258, _2262, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2268 = fma(_2258, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2270 = fma(_2258, _2246, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2272 = fma(_2258, _2250, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2274 = fma(_2258, _2254, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2204 = _2268;
            _2214 = _2272;
            _2192 = _2264;
            _2180 = _2270;
            _2174 = _2266;
            _2186 = _2274;
            _2276 = true;
        }
        else
        {
            bool _2278 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2280 = isnan(_1732);
            bool _2282 = _2278 || _2280;
            bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2286 = _2282 || _2284;
            if (!_2286)
            {
                _2190 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2288 = _2190;
            _2192 = _2288;
            if (!_2286)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2290 = _2202;
            _2204 = _2290;
            if (!_2286)
            {
                _2172 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2292 = _2172;
            _2174 = _2292;
            if (!_2286)
            {
                _2178 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2294 = _2178;
            _2180 = _2294;
            if (!_2286)
            {
                _2212 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2296 = _2212;
            _2214 = _2296;
            if (!_2286)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2298 = _2184;
            bool _2300 = !_2286;
            _2186 = _2298;
            if (!_2300)
            {
                bool _2302 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2304 = isnan(_1732);
                bool _2306 = _2302 || _2304;
                bool _2308 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2310 = _2306 || _2308;
                if (!_2310)
                {
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2314 = _1732 + _2312;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2318 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2316;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2324 = 1.0 / _2318;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2342 = _2314 * _2324;
                    float _2344 = precise::clamp(_2342, 0.0, 1.0);
                    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2350 = fma(_2344, _2322, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2352 = fma(_2344, _2348, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2354 = fma(_2344, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2356 = fma(_2344, _2332, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2358 = fma(_2344, _2336, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2360 = fma(_2344, _2340, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2204 = _2354;
                    _2214 = _2358;
                    _2192 = _2350;
                    _2180 = _2356;
                    _2174 = _2352;
                    _2186 = _2360;
                    _2276 = true;
                }
                else
                {
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2214 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2192 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2180 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2174 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2276 = false;
    float _2362 = _2204;
    float _2364 = _2214;
    float _2366 = _2192;
    float _2368 = _2180;
    float _2370 = _2174;
    float _2372 = _2186;
    float _2374 = fma(_2062, -0.5, 0.5);
    float _2376 = precise::clamp(_2374, 0.0, 1.0);
    float _2378 = -_2362;
    float _2380 = _2378 + _2364;
    float _2382 = -_2366;
    float _2384 = _2382 + _2368;
    float _2386 = -_2370;
    float _2388 = _2386 + _2372;
    bool _2390 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2392 = fma(_2376, _2380, _2362);
    float _2394 = fma(_2376, _2384, _2366);
    float _2396 = fma(_2376, _2388, _2370);
    float _2398 = _2392 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2400 = fma(_2394, 0.298911988735198974609375, _2398);
    float _2402 = fma(_2396, 0.114477999508380889892578125, _2400);
    out.m_93.x = 0.0;
    float _2404 = -_2402;
    float _2406 = _2394 + _2404;
    float _2408 = -_2402;
    float _2410 = _2392 + _2408;
    float _2412 = -_2402;
    float _2414 = _2396 + _2412;
    float _2416 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2418 = fma(_2406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    float _2420 = fma(_2410, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    float _2422 = fma(_2414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    out.m_95.x = 0.0;
    out.m_87.w = _2416;
    out.m_97.x = _2418;
    out.m_97.y = _2420;
    out.m_97.z = _2422;
    if (!_2390)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2424 = -_1421;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2428 = -_1423;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2432 = -_1425;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2436 = _2426 * _2426;
    float _2438 = fma(_2430, _2430, _2436);
    float _2440 = fma(_2434, _2434, _2438);
    float _2442 = rsqrt(_2440);
    float _2444 = sqrt(_2440);
    float _2446 = _2426 * _2442;
    float _2448 = _2430 * _2442;
    float _2450 = _2434 * _2442;
    float _2452 = -_1738;
    float _2454 = _2452 + _2446;
    float _2456 = -_1734;
    float _2458 = _2456 + _2448;
    float _2460 = -_1736;
    float _2462 = _2460 + _2450;
    float _2464 = _2454 * _2454;
    float _2466 = -_2444;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2470 = fma(_2458, _2458, _2464);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2462, _2462, _2470);
    float _2478 = abs(_2474);
    float _2480 = log2(_2478);
    float _2482 = rsqrt(_2476);
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2486 = exp2(_2484);
    float _2488 = _2454 * _2482;
    float _2490 = _2458 * _2482;
    float _2492 = _2462 * _2482;
    float _2494 = _2062 * _2488;
    float _2496 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2498 = precise::clamp(_2496, 0.0, 1.0);
    float _2500 = _2062 * _2446;
    float _2502 = fma(_2070, _2490, _2494);
    float _2504 = _2498 * _2498;
    float _2506 = fma(_2070, _2448, _2500);
    float _2508 = fma(_2074, _2492, _2502);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = _2504 + (-1.0);
    float _2514 = fma(_2074, _2450, _2506);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = _2510 * _2510;
    float _2520 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = fma(_2518, _2512, 1.0);
    float _2524 = -_2446;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = _2522 * _2522;
    float _2532 = -_2450;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2538 = _2534 + _2536;
    float _2540 = 1.0 / _2530;
    float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = _2486 * _2544;
    float _2548 = _2516 * _2546;
    float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2552 = _2504 * _2540;
    float _2554 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2556 = _2548 * _2552;
    float _2558 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2560 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2562 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2564 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2550;
    out.m_93.y = _2554;
    out.m_93.z = _2558;
    out.m_95.x = _2560;
    out.m_95.y = _2562;
    out.m_95.z = _2564;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2276 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_56.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_59.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2621 = as_type<float>(_132);
        out.gl_Position.z = _2621;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_61.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2690 = as_type<float>(_170);
        out.gl_Position.z = _2690;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_63.x;
    float _174 = in.m_63.y;
    float _176 = in.m_63.z;
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _210;
    float _220 = _208;
    float _222 = _202;
    float _224 = _204;
    if (_214)
    {
        float _226 = rsqrt(_202);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = 0.0;
    float _232 = 0.0;
    if (!_214)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _234 = _230;
    float _236 = _232;
    bool _238 = _212 > 0.0;
    float _240 = 0.0;
    float _242 = _212;
    float _244 = _236;
    float _246 = _234;
    if (!_214)
    {
        _240 = 0.0;
    }
    float _248 = _240;
    float _250 = 0.0;
    float _252 = _248;
    if (!_216)
    {
        _250 = 0.0;
        _220 = 0.0;
    }
    float _254 = _250;
    float _256 = _220;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (_216)
    {
        float _264 = rsqrt(_204);
        _258 = _264;
    }
    float _266 = _258;
    if (!_216)
    {
        _242 = 0.0;
    }
    float _268 = _242;
    float _270 = _268;
    if (!_238)
    {
        _222 = 0.0;
    }
    float _272 = _222;
    float _274 = 0.0;
    float _276 = _272;
    if (_238)
    {
        float _278 = rsqrt(_206);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _228;
    if (_214)
    {
        float _284 = _228 * _178;
        _252 = _284;
    }
    float _286 = _252;
    if (_214)
    {
        float _288 = _228 * _172;
        _244 = _288;
    }
    float _290 = _244;
    if (_214)
    {
        float _292 = _228 * _184;
        _246 = _292;
    }
    float _294 = _246;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_238)
    {
        _282 = 0.0;
        _224 = 0.0;
    }
    float _298 = _282;
    float _300 = _224;
    float _302 = _298;
    float _304 = _300;
    if (_216)
    {
        float _306 = _266 * _180;
        _260 = _306;
    }
    float _308 = _260;
    if (_216)
    {
        float _310 = _266 * _174;
        _262 = _310;
    }
    float _312 = _262;
    if (_216)
    {
        float _314 = _266 * _186;
        _270 = _314;
    }
    float _316 = _270;
    if (_238)
    {
        float _318 = _280 * _182;
        _302 = _318;
    }
    float _320 = _302;
    if (_238)
    {
        float _322 = _280 * _176;
        _304 = _322;
    }
    float _324 = _304;
    if (_238)
    {
        float _326 = _280 * _188;
        _276 = _326;
    }
    float _328 = _276;
    bool _330 = !_296;
    float _348;
    if (!_330)
    {
        float _332 = in.m_69.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_116);
        float _354 = 1.0 / _352;
        float _356 = _150 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_56.x;
    float _362 = in.m_56.y;
    float _364 = in.m_56.z;
    float _366 = in.m_65.w;
    float _368 = in.m_67.w;
    float _370 = _180 * _362;
    float _372 = _186 * _362;
    float _374 = fma(_178, _360, _370);
    float _376 = fma(_184, _360, _372);
    float _378 = fma(_182, _364, _374);
    float _380 = fma(_188, _364, _376);
    float _382 = _378 + _366;
    float _384 = _380 + _368;
    float _386 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _388 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _390 = floor(_386);
    float _392 = floor(_388);
    float _394 = -_390;
    float _396 = _386 + _394;
    float _398 = -_392;
    float _400 = _388 + _398;
    float2 _3015 = float2(_396, _400);
    float _402 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3015, float2(0.0), isnan(_3015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3015, float2(0.0), isnan(_3015)), level(0.0)).x;
    float _404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _406 = log2(_404);
    float _408 = in.m_69.x;
    float _410 = in.m_69.y;
    float _412 = in.m_69.z;
    float _414 = _174 * _362;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = _358 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = fma(_172, _360, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _430;
    float _434 = 1.0 / _422;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _446 = _444 != 0;
    float _448 = fma(_176, _364, _428);
    float _450 = in.m_63.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _454 = _358 + _452;
    float _456 = _406 * _150;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _464 = _358 + _462;
    float _466 = 1.0 / _426;
    bool _468 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _476 = _472 || _474;
    bool _478 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _480 = isnan(1.0);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _486 = _482 || _484;
    float _488 = _410 + _412;
    float _490 = _412 + _408;
    float _492 = exp2(_456);
    float _494 = _412 + (-0.5);
    float _496 = _412 * 2.0;
    float _498 = _410 + _408;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _502 = 1.0 + _500;
    float _504 = _410 + (-0.5);
    float _506 = _410 * 2.0;
    float _508 = _488 + (-1.0);
    float _510 = 1.0 / _432;
    float _512 = _464 * _466;
    float _514 = _498 + (-1.0);
    float _516 = _490 + (-1.0);
    float _518 = _418 * _434;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _522 = _358 + _520;
    float _524 = floor(_496);
    float _526 = _408 + (-0.5);
    float _528 = _408 * 2.0;
    float _530 = -_492;
    float _532 = _530 + 1.0;
    bool _534 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _536 = isnan(_358);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = 1.0 / _502;
    float _548 = _476 ? _532 : 0.0;
    float _550 = _454 * _510;
    bool _552 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_358);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_544;
    float _566 = _564 + 1.0;
    bool _568 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _570 = isnan(_358);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = floor(_528);
    bool _582 = _524 > 0.0;
    bool _584 = _524 >= 0.0;
    bool _586 = isnan(_524);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _596 = 1.0 / _460;
    if (_486)
    {
        float _598 = _548 * _546;
        _154 = _598;
    }
    float _600 = _154;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _606;
    int _610 = _592 ? 0 : 1;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = floor(_506);
    float _618 = fma(_608, _518, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _620 = _580 >= 0.0;
    bool _622 = isnan(_580);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    bool _630 = _580 > 0.0;
    float _632 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _634;
    int _638 = _628 ? 0 : 1;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _644 = _522 * _596;
    float _646 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _648;
    bool _652 = _616 > 0.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _654;
    bool _658 = _616 >= 0.0;
    bool _660 = isnan(_616);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _672 = fma(_656, _518, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _674 = fma(_636, _518, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _676 = fma(_614, _512, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _678 = fma(_642, _512, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _680 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _682 = isnan(_358);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_670, _512, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _694 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _696 = isnan(_358);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _714 = -_690;
    float _716 = _714 + 1.0;
    float _718 = _704 * _716;
    float _720 = -_704;
    float _722 = _720 + 1.0;
    float _724 = fma(_604, _550, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _730 = _544 * _722;
    float _732 = fma(_650, _550, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _734 = _562 * _566;
    float _736 = -_562;
    float _738 = _736 + 1.0;
    float _740 = fma(_708, _550, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _746 = fma(_728, _644, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _748 = _578 * _738;
    float _750 = fma(_712, _644, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _752 = -_578;
    float _754 = _752 + 1.0;
    float _756 = _448 + _450;
    float _758 = _618 * _748;
    float _760 = _672 * _748;
    float _762 = fma(_744, _644, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _764 = _674 * _748;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].x, _760);
    float _770 = _756 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _772 = ~_610;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].z, _764);
    int _780 = ~_638;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[11].x, _770);
    int _788 = _776;
    int _790 = _784;
    if (!_582)
    {
        int _792 = ~_610;
        int _794 = _792 + 1;
        _788 = _794;
    }
    int _796 = _788;
    if (!_630)
    {
        int _798 = ~_638;
        int _800 = _798 + 1;
        _790 = _800;
    }
    int _802 = _790;
    float _804 = fma(_692, _734, _768);
    int _806 = _666 ? 0 : 1;
    float _808 = in.m_71.x;
    float _810 = in.m_71.y;
    float _812 = in.m_71.z;
    bool _814 = !_442;
    int _816 = _814 ? 0 : 1;
    float _818 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].z, _786);
    int _820 = ~_806;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    int _826 = abs(_816);
    float _828 = _818 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _830 = _824;
    if (!_652)
    {
        int _832 = ~_806;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_676, _734, _766);
    float _840 = _756 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _842 = fma(_678, _734, _778);
    float _844 = float(_802);
    float _846 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[10].x, _840);
    float _848 = float(_826);
    float _850 = 1.0 / _828;
    float _852 = fma(_732, _730, _804);
    float _854 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].z, _846);
    float _856 = fma(_724, _730, _838);
    float _858 = _848 * _844;
    float _860 = fma(_740, _730, _842);
    float _862 = _854 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _864 = !_438;
    int _866 = _864 ? 0 : 1;
    float _868 = _858 * (-2.0);
    bool _870 = !_446;
    int _872 = _870 ? 0 : 1;
    float _874 = _862 + _828;
    int _876 = abs(_866);
    float _878 = fma(_632, _868, _632);
    float _880 = fma(_868, _810, _810);
    int _882 = abs(_872);
    float _884 = fma(_750, _718, _852);
    float _886 = _874 * _850;
    float _888 = _886 * 0.5;
    float _890 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].y, _880);
    float _892 = fma(_746, _718, _856);
    float _894 = float(_876);
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _896);
    float _900 = float(_882);
    float _902 = fma(_878, _600, _890);
    float _904 = in.m_73.x;
    float _906 = in.m_73.y;
    float _908 = in.m_73.z;
    float _910 = float(_796);
    float _912 = 1.0 / _898;
    float _914 = float(_836);
    float _916 = _902 * 0.15915493667125701904296875;
    float _918 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].x, _884);
    float _920 = _894 * _910;
    float _922 = fma(_762, _718, _860);
    float _924 = _900 * _914;
    float _926 = _920 * (-2.0);
    float _928 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].z, _922);
    float _930 = _924 * (-2.0);
    float _932 = in.m_75.x;
    float _934 = in.m_75.y;
    float _936 = in.m_75.z;
    float _938 = fma(_926, _808, _808);
    float _940 = fma(_646, _926, _646);
    float _942 = fma(_594, _930, _594);
    float _944 = _916 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _950 = fma(_930, _812, _812);
    float _952 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].y, _892);
    float _954 = fma(_940, _600, _948);
    float _956 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[196].z, _950);
    float _958 = _918 * _904;
    float _960 = _952 * _906;
    float _962 = _954 * 0.15915493667125701904296875;
    float _964 = fma(_942, _600, _956);
    float _966 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _970 = _912 * _968;
    float _972 = _962 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = _964 * 0.15915493667125701904296875;
    float _978 = _928 * _908;
    bool _980 = _970 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _982 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _984 = _970 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _988 = _916 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = _756 + _982;
    bool _996 = !_980;
    int _998 = _996 ? 0 : 1;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _1002 = _960 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1004 = _992 * _986;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _1008 = _976 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = _994 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1014 = 2;
    if (!_980)
    {
        _1014 = 1;
    }
    int _1016 = _1014;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1020 = _1016;
    if (!_984)
    {
        _1020 = _998;
    }
    int _1022 = _1020;
    float _1024 = _1002 * _1000;
    float _1026 = _966 * _1006;
    float _1028 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1012);
    float _1030 = _962 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1018);
    float _1036 = _974 * _946;
    float _1038 = _974 * _990;
    int _1040 = _1022 << 6;
    float _1042 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1034);
    float _1044 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1028);
    float _1046 = _976 * 6.283185482025146484375;
    float _1048 = sin(_1046);
    float _1050 = _974 * _1010;
    float _1052 = _1042 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1054 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1056 = _1050 * _1024;
    float _1058 = _1032 * _946;
    float _1060 = _1032 * _990;
    float _1062 = _990 * _1010;
    float _1064 = _1032 * _1010;
    float _1066 = _946 * _1010;
    float _1068 = trunc(_1052);
    int _1070 = int(_1068);
    int _1072 = _1040 + 96;
    uint _1075 = uint(int(uint(_1072) >> uint(2)));
    uint _1077 = uint(int(uint(int(_1075)) >> uint(2)));
    int _1079 = int(_1075) & 3;
    float _1081 = (*spvDescriptorSet0.vp_c15)._m0[int(_1077)][_1079];
    int _1083 = int(_1075) + 1;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    int _1087 = _1083 & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    float _1091 = -_1058;
    float _1093 = fma(_1048, _1038, _1091);
    float _1095 = -_1038;
    float _1097 = fma(_1048, _1058, _1095);
    float _1099 = _1064 * _1024;
    float _1101 = fma(_1048, _1060, _1036);
    float _1103 = -_1024;
    float _1105 = _1048 * _1103;
    float _1107 = fma(_1048, _1036, _1060);
    float _1109 = trunc(_1054);
    int _1111 = int(_1109);
    int _1113 = _1040 + 48;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    float _1131 = fma(_1101, _1026, _1099);
    float _1133 = fma(_1062, _1026, _1105);
    float _1135 = fma(_1093, _1026, _1056);
    float _1137 = fma(_1097, _1004, _1131);
    float _1139 = fma(_1066, _1004, _1133);
    float _1141 = fma(_1107, _1004, _1135);
    int _1143 = _1040 + 104;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.vp_c15)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.vp_c15)._m0[int(_1155)][_1157];
    float _1161 = _1137 * _316;
    float _1163 = _1137 * _308;
    int _1165 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1167 = _1070 + _1165;
    int _1169 = _1167 + 1;
    float _1171 = _1137 * _312;
    float _1173 = fma(_1139, _294, _1161);
    float _1175 = fma(_1139, _286, _1163);
    int _1177 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1179 = _1111 + _1177;
    int _1181 = _1179 + 1;
    int _1183 = _1040 + 64;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.vp_c15)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
    float _1201 = fma(_1141, _328, _1173);
    float _1203 = fma(_1141, _320, _1175);
    bool _1205 = _1169 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1207 = fma(_1139, _290, _1171);
    float _1209 = _384 + _1201;
    int _1211 = _1169 | _1181;
    float _1213 = _382 + _1203;
    int _1215 = _1040 + 56;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    uint _1219 = uint(int(uint(int(_1217)) >> uint(2)));
    int _1221 = int(_1217) & 3;
    float _1223 = (*spvDescriptorSet0.vp_c15)._m0[int(_1219)][_1221];
    int _1225 = int(_1217) + 1;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    int _1229 = _1225 & 3;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[int(_1227)][_1229];
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1209 + _1233;
    bool _1237 = _1211 < 0;
    bool _1239 = _1237 || _1205;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1243 = _1213 + _1241;
    float _1245 = fma(_1141, _324, _1207);
    float _1247 = _1235 * _1235;
    bool _1249 = _1181 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1251 = _1249 || _1239;
    int _1253 = _1040 + 72;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    uint _1257 = uint(int(uint(int(_1255)) >> uint(2)));
    int _1259 = int(_1255) & 3;
    float _1261 = (*spvDescriptorSet0.vp_c15)._m0[int(_1257)][_1259];
    int _1263 = int(_1255) + 1;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    int _1267 = _1263 & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    float _1271 = fma(_1243, _1243, _1247);
    float _1273 = sqrt(_1271);
    float _1275 = _994 * _1089;
    int _1277 = _1040 + 80;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    float _1295 = fma(_382, _1081, _1275);
    uint _1297 = as_type<uint>(_1137);
    float _1299 = _1245;
    float _1301 = _1213;
    float _1303 = _1207;
    if (!_1251)
    {
        int _1305 = _1181 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1307 = _1305 + _1169;
        _1297 = uint(_1307);
    }
    uint _1309 = _1297;
    float _1311 = as_type<float>(_1169);
    if (!_1251)
    {
        float _1313 = floor(_1052);
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = _994 * _1129;
    float _1319 = fma(_382, _1121, _1317);
    bool _1321 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = fma(_384, _1151, _1295);
    float _1325 = _1323 + _1159;
    int _1327 = as_type<int>(_1323);
    int _1329 = as_type<int>(_1159);
    if (!_1251)
    {
        uint _1331 = uint(int(uint(int(_1309)) >> uint(2)));
        _1327 = int(_1331);
    }
    int _1333 = _1327;
    float _1335 = _994 * _1199;
    int _1337 = as_type<int>(_1199);
    float _1339 = _1335;
    int _1341 = _1333;
    if (!_1251)
    {
        int _1343 = int(_1309) << 2;
        _1337 = _1343;
    }
    int _1345 = _1337;
    float _1347 = fma(_382, _1191, _1335);
    if (!_1251)
    {
        int _1349 = 12 & _1345;
        _1329 = _1349;
    }
    int _1351 = _1329;
    float _1353 = 1.0 / _1325;
    if (!_1321)
    {
        _1339 = _1213;
    }
    float _1355 = _1339;
    float _1357 = fma(_384, _1223, _1319);
    float _1359 = _1355;
    if (!_1251)
    {
        int _1361 = _1333 << 4;
        int _1363 = _1361 + _1351;
        _1341 = _1363;
    }
    int _1365 = _1341;
    float _1367 = _1357 + _1231;
    float _1369 = fma(_384, _1261, _1347);
    float _1371 = _756 + _1245;
    float _1373 = _1371;
    if (!_1321)
    {
        _1299 = _1209;
    }
    float _1375 = _1299;
    float _1377 = _1369 + _1269;
    bool _1379 = !_1321;
    float _1381 = _1375;
    float _1383 = _1293;
    if (!_1379)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1273 + _1387;
        float _1391 = rsqrt(_1271);
        float _1393 = _1389 * _1385;
        float _1395 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1401 + (-1.0);
        float _1409 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = fma(_1405, _1395, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1413 = fma(_1371, _1401, _1409);
        float _1415 = _1391 * _1411;
        float _1417 = fma(_1243, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1419 = fma(_1235, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1373 = _1413;
        _1359 = _1417;
        _1381 = _1419;
    }
    float _1421 = _1373;
    float _1423 = _1359;
    float _1425 = _1381;
    int _1427 = _1040 + 88;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    float _1445 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1447 = _1377 * _1353;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1445);
    float _1455 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1457 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    float _1459 = _1209;
    if (!_1251)
    {
        int _1461 = _1365 + 400;
        uint _1463 = uint(int(uint(_1461) >> uint(2)));
        uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
        int _1467 = int(_1463) & 3;
        float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1451);
    float _1475 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1477 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1457);
    float _1479 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1455);
    float _1481 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1487 = _1367 * _1353;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1497 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1499 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    bool _1501 = _1487 >= 0.0;
    float _1503 = -_1495;
    float _1505 = fma(_1503, _1493, 1.0);
    float _1507 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1509 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1499);
    bool _1511 = _1487 <= 1.0;
    bool _1513 = _1511 && _1501;
    float _1515 = _1223;
    if (!_1251)
    {
        float _1517 = floor(_1054);
        _1515 = _1517;
    }
    float _1519 = _1515;
    float _1521 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1523 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1509);
    bool _1525 = _1447 >= 0.0;
    bool _1527 = _1525 && _1513;
    float _1529 = _994 * _1293;
    float _1531 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1521);
    float _1533 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1535 = _1447 <= 1.0;
    bool _1537 = _1535 && _1527;
    float _1539 = 1.0 / _1523;
    float _1541 = fma(_382, _1285, _1529);
    float _1543 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1531);
    float _1545 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1547 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1545);
    float _1549 = _1543;
    if (!_1251)
    {
        float _1551 = -_1519;
        float _1553 = _1054 + _1551;
        _1301 = _1553;
    }
    float _1555 = _1301;
    float _1557 = log2(_1505);
    float _1559 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1561 = fma(_384, _1435, _1541);
    if (_1537)
    {
        float _1563 = float(_1022);
        _1383 = _1563;
    }
    float _1565 = _1383;
    float _1567 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1569 = _1561 + _1443;
    float _1571 = _1559 * _1539;
    float _1573 = _1529;
    float _1575 = _1569;
    if (_1537)
    {
        float _1577 = rint(_1565);
        float _1579 = precise::max(_1577, 0.0);
        uint _1581 = uint(_1579);
        uint _1583 = clamp(_1581, 0u, 65535u);
        _1573 = as_type<float>(_1583);
    }
    float _1585 = _1573;
    float _1587 = _1567 * _1539;
    float _1589 = _1569 * _1353;
    if (!_1251)
    {
        float _1591 = -_1315;
        float _1593 = _1052 + _1591;
        _1575 = _1593;
    }
    float _1595 = _1575;
    float _1597 = fma(_1587, 0.5, 0.5);
    float _1599 = _1557 * 0.693147182464599609375;
    float _1601 = fma(_1571, -0.5, 0.5);
    float _1603 = _1571;
    if (!_1251)
    {
        float _1605 = rint(_1471);
        float _1607 = precise::max(_1605, 0.0);
        uint _1609 = uint(_1607);
        uint _1611 = clamp(_1609, 0u, 65535u);
        _1603 = as_type<float>(_1611);
    }
    float _1613 = _1603;
    float _1615 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = _1447;
    float _1619 = _1615;
    if (_1537)
    {
        float3 _4978 = float3(_1487, _1447, float(as_type<int>(_1585)));
        float3 _4982 = select(_4978, float3(0.0), isnan(_4978));
        float _1621 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4982.xy, uint(rint(_4982.z)), _1589, level(0.0));
        _1617 = _1621;
    }
    float _1623 = _1617;
    float3 _4992 = float3(_1597, _1601, _1615);
    float _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4992, float3(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4992, float3(0.0), isnan(_4992)), level(0.0)).x;
    float3 _5001 = float3(_1597, _1601, _1615);
    float4 _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5001, float3(0.0), isnan(_5001)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5001, float3(0.0), isnan(_5001)), level(0.0)).xyzw;
    float _1630 = _1628.x;
    float _1632 = _1628.y;
    float _1634 = _1628.z;
    float _1636 = _1628.w;
    float _1638 = _1555;
    if (!_1251)
    {
        float3 _5024 = float3(_1595, _1555, float(as_type<int>(_1613)));
        float3 _5026 = select(_5024, float3(0.0), isnan(_5024));
        float _1640 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5026.xy, uint(rint(_5026.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5026.xy, uint(rint(_5026.z)), level(0.0)).x;
        _1638 = _1640;
    }
    float _1642 = _1638;
    if (_1251)
    {
        _1549 = 1.0;
    }
    float _1644 = _1549;
    float _1646 = _1644;
    if (!_1251)
    {
        int _1648 = int(_1309) << 4;
        int _1650 = _1648 + 2048;
        uint _1652 = uint(int(uint(_1650) >> uint(2)));
        uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
        int _1656 = int(_1652) & 3;
        float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
        int _1660 = int(_1652) + 1;
        uint _1662 = uint(int(uint(_1660) >> uint(2)));
        int _1664 = _1660 & 3;
        float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
        int _1668 = _1650 + 8;
        uint _1670 = uint(int(uint(_1668) >> uint(2)));
        uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
        int _1674 = int(_1670) & 3;
        float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
        int _1678 = int(_1670) + 1;
        uint _1680 = uint(int(uint(_1678) >> uint(2)));
        int _1682 = _1678 & 3;
        float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
        float _1686 = _994 * _1666;
        float _1688 = fma(_382, _1658, _1686);
        float _1690 = fma(_384, _1676, _1688);
        float _1692 = _1690 + _1684;
        float _1694 = precise::clamp(_1692, 0.0, 1.0);
        float _1696 = -_1694;
        float _1698 = _1696 + _1642;
        float _1700 = fma(_1698, 500.0, 1.5);
        float _1702 = exp2(_1700);
        float _1704 = 0.0 + _1702;
        float _1706 = precise::clamp(_1704, 0.0, 1.0);
        _1646 = _1706;
    }
    float _1708 = _1646;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1712 = _1421 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1716 = _1423 + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1720 = _1425 + _1718;
    float _1722 = _1712 * _1712;
    float _1724 = fma(_1716, _1716, _1722);
    float _1726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1728 = fma(_1720, _1720, _1724);
    float _1730 = rsqrt(_1728);
    float _1732 = sqrt(_1728);
    float _1734 = _1716 * _1730;
    float _1736 = _1720 * _1730;
    float _1738 = _1712 * _1730;
    float _1740 = precise::max(0.0, _1726);
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1742 * _1742;
    float _1748 = _1744 * _1744;
    float _1750 = -_1738;
    float _1752 = -_1740;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1752);
    float _1756 = _1746 + _1748;
    float _1758 = sqrt(_1756);
    bool _1760 = _1758 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1764 = _1758 + _1762;
    float _1766 = _1052;
    float _1768 = _1726;
    float _1770 = _1756;
    float _1772 = _1764;
    float _1774 = _1742;
    float _1776 = _1744;
    float _1778 = _1746;
    float _1780 = _1748;
    float _1782 = _1754;
    if (_1760)
    {
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1766 = _1784;
    }
    float _1786 = _1766;
    if (_1760)
    {
        float _1788 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1768 = _1788;
    }
    float _1790 = _1768;
    float _1792 = _1790;
    if (_1760)
    {
        float _1794 = rsqrt(_1756);
        _1770 = _1794;
    }
    float _1796 = _1770;
    if (_1760)
    {
        float _1798 = _1764 * _1786;
        _1772 = _1798;
    }
    float _1800 = _1772;
    if (_1760)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1303 = _1802;
    }
    float _1804 = _1303;
    float _1806 = _1786;
    if (_1760)
    {
        float _1808 = _1804 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = _1800;
    if (_1760)
    {
        float _1816 = _1804 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = _1812;
    if (_1760)
    {
        float _1824 = fma(_1812, _1790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1619 = _1824;
    }
    float _1826 = _1619;
    float _1828 = _1826;
    if (_1760)
    {
        float _1830 = _1796 * _1826;
        _1828 = _1830;
    }
    float _1832 = _1828;
    if (_1760)
    {
        float _1834 = _1820 + (-1.0);
        _1792 = _1834;
    }
    float _1836 = _1792;
    if (_1760)
    {
        float _1838 = _1742 * _1832;
        _1774 = _1838;
    }
    float _1840 = _1774;
    if (_1760)
    {
        float _1842 = _1744 * _1832;
        _1776 = _1842;
    }
    float _1844 = _1776;
    if (_1760)
    {
        float _1846 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1846;
    }
    float _1848 = _1822;
    if (_1760)
    {
        float _1850 = _1840 * _1840;
        _1778 = _1850;
    }
    float _1852 = _1778;
    if (_1760)
    {
        float _1854 = _1844 * _1844;
        _1780 = _1854;
    }
    float _1856 = _1780;
    if (_1760)
    {
        float _1858 = fma(_1754, _1820, _1848);
        _1782 = _1858;
    }
    float _1860 = _1782;
    float _1862 = fma(_1860, _1860, _1852);
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1866 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1864);
    float _1868 = precise::clamp(_1866, 0.0, 1.0);
    float _1870 = _1862 + _1856;
    float _1872 = -_1868;
    float _1874 = _1872 + 1.0;
    float _1876 = rsqrt(_1870);
    float _1878 = abs(_1874);
    float _1880 = log2(_1878);
    float _1882 = _1876 * _1840;
    float _1884 = _1876 * _1860;
    float _1886 = _1876 * _1844;
    float _1888 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1890 = -_1888;
    float _1892 = fma(_1884, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1890);
    float _1894 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1896 = -_1886;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1892);
    float _1900 = exp2(_1894);
    float _1902 = fma(_1898, -0.5, 0.5);
    float _1904 = fma(_1898, 0.5, 0.5);
    float _1906 = fma(_1904, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1908 = sqrt(_1902);
    float _1910 = fma(_1904, _1906, -0.212114393711090087890625);
    float _1912 = _1884 + 1.0;
    float _1914 = fma(_1904, _1910, 1.570728778839111328125);
    float _1916 = -_1884;
    float _1918 = fma(_1900, _1912, _1916);
    float _1920 = fma(_1918, 0.5, 0.5);
    float _1922 = _1908 * 0.636619746685028076171875;
    float _1924 = -_1914;
    float _1926 = fma(_1922, _1924, 1.0);
    float2 _5474 = float2(_1926, _1920);
    float3 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5474, float2(0.0), isnan(_5474)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5474, float2(0.0), isnan(_5474)), level(0.0)).xyz;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = in.m_77.x;
    float _1940 = in.m_77.y;
    float _1942 = in.m_77.z;
    float _1944 = abs(_970);
    float _1946 = log2(_1944);
    bool _1948 = _934 != 0.0;
    bool _1950 = isnan(_934);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(0.0);
    bool _1956 = _1952 || _1954;
    float _1958 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1960 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1962 = _932 == 0.0;
    bool _1964 = !_1956;
    bool _1966 = _1962 && _1964;
    float _1968 = -_402;
    float _1970 = _1968 + 1.0;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1974 = exp2(_1958);
    bool _1976 = _936 == 0.0;
    bool _1978 = _1976 && _1966;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1982 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1986 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1994 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1982);
    float _1996 = exp2(_1986);
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_79.x = _1423;
    out.m_79.y = _1421;
    out.m_79.z = _1425;
    float _2000 = _1940;
    float _2002 = _1938;
    float _2004 = _1942;
    if (!_1978)
    {
        float _2006 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1940);
        _2000 = _2006;
    }
    float _2008 = _2000;
    if (!_1978)
    {
        float _2010 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1938);
        _2002 = _2010;
    }
    float _2012 = _2002;
    if (!_1978)
    {
        float _2014 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1942);
        _2004 = _2014;
    }
    float _2016 = _2004;
    float _2018 = _1064 * _2008;
    float _2020 = -_2008;
    float _2022 = _1048 * _2020;
    float _2024 = _1050 * _2008;
    float _2026 = fma(_1101, _2012, _2018);
    float _2028 = fma(_1062, _2012, _2022);
    float _2030 = fma(_1093, _2012, _2024);
    float _2032 = -_1974;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1097, _2016, _2026);
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = fma(_1066, _2016, _2028);
    float _2044 = fma(_1107, _2016, _2030);
    float _2046 = _2036 * _312;
    float _2048 = fma(_2040, -2.0, 3.0);
    float _2050 = _2040 * _2040;
    float _2052 = _2036 * _308;
    float _2054 = fma(_2042, _290, _2046);
    float _2056 = _2036 * _316;
    float _2058 = _2050 * _2048;
    float _2060 = fma(_2042, _286, _2052);
    float _2062 = fma(_2044, _324, _2054);
    float _2064 = fma(_2042, _294, _2056);
    float _2066 = -_2058;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_2044, _320, _2060);
    float _2072 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2074 = fma(_2044, _328, _2064);
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2058);
    bool _2078 = _970 <= 8000.0;
    bool _2080 = isnan(_970);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(8000.0);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1994);
    float _2092 = _2072 * _1625;
    out.m_81.x = _1988;
    out.m_81.y = _1990;
    out.m_81.z = _1992;
    out.m_81.w = _1998;
    float _2094 = _2088 * _2076;
    float _2096 = _2088;
    if (!_1537)
    {
        _2096 = 1.0;
    }
    float _2098 = _2096;
    float _2100 = _2090 + _1523;
    float _2102 = _2098;
    if (_1537)
    {
        bool _2104 = _1623 >= _1589;
        bool _2106 = isnan(_1623);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan(_1589);
        bool _2112 = _2108 || _2110;
        float _2114 = float(_2112);
        _2102 = _2114;
    }
    float _2116 = _2102;
    float _2118 = _2094 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2120 = _2100 * 0.5;
    float _2122 = _1636 * _2092;
    float _2124 = _1970 * _2118;
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = _2116 * _1708;
    float _2130 = -_2072;
    float _2132 = _2130 + 1.0;
    out.gl_Position.x = _1567;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _2090;
    out.gl_Position.w = _1523;
    float _2134 = -_2126;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2138 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2140 = isnan(_1732);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2146 = _2142 || _2144;
    float _2148 = _1636 * _2132;
    out.m_83.z = _2120;
    out.m_83.w = _1523;
    float _2150 = -_2128;
    float _2152 = fma(_2150, _2136, 1.0);
    float _2154 = precise::clamp(_2152, 0.0, 1.0);
    out.m_85.x = _2070;
    out.m_85.y = _2062;
    out.m_85.z = _2074;
    float _2156 = _2154 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2156;
    float _2158 = _2136;
    float _2160 = _2154;
    float _2162 = _2132;
    float _2164 = 1.0;
    float _2166 = 1.0;
    float _2168 = _2122;
    if (!_2146)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2170 = _2158;
    float _2172 = _2170;
    float _2174 = _2170;
    if (!_2146)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2176 = _2160;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    float _2178 = _2176;
    float _2180 = _2176;
    if (!_2146)
    {
        _2162 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2182 = _2162;
    float _2184 = _2182;
    float _2186 = _2182;
    if (!_2146)
    {
        _2164 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2188 = _2164;
    float _2190 = _2188;
    float _2192 = _2188;
    if (!_2146)
    {
        _2166 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2194 = _2166;
    float _2196 = _1936 * _2092;
    float _2198 = fma(_1932, _2122, _1630);
    float _2200 = fma(_1934, _2122, _1632);
    float _2202 = _2194;
    float _2204 = _2194;
    if (!_2146)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2206 = _2168;
    float _2208 = fma(_1636, _2196, _1634);
    out.m_91.x = _2198;
    out.m_91.y = _2200;
    out.m_91.z = _2208;
    out.m_91.w = _2148;
    bool _2210 = !_2146;
    float _2212 = _2206;
    float _2214 = _2206;
    if (!_2210)
    {
        bool _2216 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2218 = isnan(_1732);
        bool _2220 = _2216 || _2218;
        bool _2222 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2224 = _2220 || _2222;
        if (!_2224)
        {
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2228 = _1732 + _2226;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2232 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2230;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2238 = 1.0 / _2232;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2256 = _2228 * _2238;
            float _2258 = precise::clamp(_2256, 0.0, 1.0);
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2264 = fma(_2258, _2236, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2266 = fma(_2258, _2262, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2268 = fma(_2258, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2270 = fma(_2258, _2246, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2272 = fma(_2258, _2250, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2274 = fma(_2258, _2254, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2204 = _2268;
            _2214 = _2272;
            _2192 = _2264;
            _2180 = _2270;
            _2174 = _2266;
            _2186 = _2274;
            _2276 = true;
        }
        else
        {
            bool _2278 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2280 = isnan(_1732);
            bool _2282 = _2278 || _2280;
            bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2286 = _2282 || _2284;
            if (!_2286)
            {
                _2190 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2288 = _2190;
            _2192 = _2288;
            if (!_2286)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2290 = _2202;
            _2204 = _2290;
            if (!_2286)
            {
                _2172 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2292 = _2172;
            _2174 = _2292;
            if (!_2286)
            {
                _2178 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2294 = _2178;
            _2180 = _2294;
            if (!_2286)
            {
                _2212 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2296 = _2212;
            _2214 = _2296;
            if (!_2286)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2298 = _2184;
            bool _2300 = !_2286;
            _2186 = _2298;
            if (!_2300)
            {
                bool _2302 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2304 = isnan(_1732);
                bool _2306 = _2302 || _2304;
                bool _2308 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2310 = _2306 || _2308;
                if (!_2310)
                {
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2314 = _1732 + _2312;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2318 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2316;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2324 = 1.0 / _2318;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2342 = _2314 * _2324;
                    float _2344 = precise::clamp(_2342, 0.0, 1.0);
                    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2350 = fma(_2344, _2322, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2352 = fma(_2344, _2348, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2354 = fma(_2344, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2356 = fma(_2344, _2332, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2358 = fma(_2344, _2336, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2360 = fma(_2344, _2340, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2204 = _2354;
                    _2214 = _2358;
                    _2192 = _2350;
                    _2180 = _2356;
                    _2174 = _2352;
                    _2186 = _2360;
                    _2276 = true;
                }
                else
                {
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2214 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2192 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2180 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2174 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2276 = false;
    float _2362 = _2204;
    float _2364 = _2214;
    float _2366 = _2192;
    float _2368 = _2180;
    float _2370 = _2174;
    float _2372 = _2186;
    float _2374 = fma(_2062, -0.5, 0.5);
    float _2376 = precise::clamp(_2374, 0.0, 1.0);
    float _2378 = -_2362;
    float _2380 = _2378 + _2364;
    float _2382 = -_2366;
    float _2384 = _2382 + _2368;
    float _2386 = -_2370;
    float _2388 = _2386 + _2372;
    bool _2390 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2392 = fma(_2376, _2380, _2362);
    float _2394 = fma(_2376, _2384, _2366);
    float _2396 = fma(_2376, _2388, _2370);
    float _2398 = _2392 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2400 = fma(_2394, 0.298911988735198974609375, _2398);
    float _2402 = fma(_2396, 0.114477999508380889892578125, _2400);
    out.m_93.x = 0.0;
    float _2404 = -_2402;
    float _2406 = _2394 + _2404;
    float _2408 = -_2402;
    float _2410 = _2392 + _2408;
    float _2412 = -_2402;
    float _2414 = _2396 + _2412;
    float _2416 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2418 = fma(_2406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    float _2420 = fma(_2410, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    float _2422 = fma(_2414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    out.m_95.x = 0.0;
    out.m_87.w = _2416;
    out.m_97.x = _2418;
    out.m_97.y = _2420;
    out.m_97.z = _2422;
    if (!_2390)
    {
        return out;
    }
    float _2424 = -_1421;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2428 = -_1423;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2432 = -_1425;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2436 = _2426 * _2426;
    float _2438 = fma(_2430, _2430, _2436);
    float _2440 = fma(_2434, _2434, _2438);
    float _2442 = rsqrt(_2440);
    float _2444 = sqrt(_2440);
    float _2446 = _2426 * _2442;
    float _2448 = _2430 * _2442;
    float _2450 = _2434 * _2442;
    float _2452 = -_1738;
    float _2454 = _2452 + _2446;
    float _2456 = -_1734;
    float _2458 = _2456 + _2448;
    float _2460 = -_1736;
    float _2462 = _2460 + _2450;
    float _2464 = _2454 * _2454;
    float _2466 = -_2444;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2470 = fma(_2458, _2458, _2464);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2462, _2462, _2470);
    float _2478 = abs(_2474);
    float _2480 = log2(_2478);
    float _2482 = rsqrt(_2476);
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2486 = exp2(_2484);
    float _2488 = _2454 * _2482;
    float _2490 = _2458 * _2482;
    float _2492 = _2462 * _2482;
    float _2494 = _2062 * _2488;
    float _2496 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2498 = precise::clamp(_2496, 0.0, 1.0);
    float _2500 = _2062 * _2446;
    float _2502 = fma(_2070, _2490, _2494);
    float _2504 = _2498 * _2498;
    float _2506 = fma(_2070, _2448, _2500);
    float _2508 = fma(_2074, _2492, _2502);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = _2504 + (-1.0);
    float _2514 = fma(_2074, _2450, _2506);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = _2510 * _2510;
    float _2520 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = fma(_2518, _2512, 1.0);
    float _2524 = -_2446;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = _2522 * _2522;
    float _2532 = -_2450;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2538 = _2534 + _2536;
    float _2540 = 1.0 / _2530;
    float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = _2486 * _2544;
    float _2548 = _2516 * _2546;
    float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2552 = _2504 * _2540;
    float _2554 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2556 = _2548 * _2552;
    float _2558 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2560 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2562 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2564 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2550;
    out.m_93.y = _2554;
    out.m_93.z = _2558;
    out.m_95.x = _2560;
    out.m_95.y = _2562;
    out.m_95.z = _2564;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2276 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_56.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_59.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2621 = as_type<float>(_132);
        out.gl_Position.z = _2621;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_61.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2690 = as_type<float>(_170);
        out.gl_Position.z = _2690;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_63.x;
    float _174 = in.m_63.y;
    float _176 = in.m_63.z;
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    float _190 = _172 * _172;
    float _192 = _174 * _174;
    float _194 = _176 * _176;
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = _210;
    float _220 = _208;
    float _222 = _202;
    float _224 = _204;
    if (_214)
    {
        float _226 = rsqrt(_202);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = 0.0;
    float _232 = 0.0;
    if (!_214)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _234 = _230;
    float _236 = _232;
    bool _238 = _212 > 0.0;
    float _240 = 0.0;
    float _242 = _212;
    float _244 = _236;
    float _246 = _234;
    if (!_214)
    {
        _240 = 0.0;
    }
    float _248 = _240;
    float _250 = 0.0;
    float _252 = _248;
    if (!_216)
    {
        _250 = 0.0;
        _220 = 0.0;
    }
    float _254 = _250;
    float _256 = _220;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (_216)
    {
        float _264 = rsqrt(_204);
        _258 = _264;
    }
    float _266 = _258;
    if (!_216)
    {
        _242 = 0.0;
    }
    float _268 = _242;
    float _270 = _268;
    if (!_238)
    {
        _222 = 0.0;
    }
    float _272 = _222;
    float _274 = 0.0;
    float _276 = _272;
    if (_238)
    {
        float _278 = rsqrt(_206);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _228;
    if (_214)
    {
        float _284 = _228 * _178;
        _252 = _284;
    }
    float _286 = _252;
    if (_214)
    {
        float _288 = _228 * _172;
        _244 = _288;
    }
    float _290 = _244;
    if (_214)
    {
        float _292 = _228 * _184;
        _246 = _292;
    }
    float _294 = _246;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_238)
    {
        _282 = 0.0;
        _224 = 0.0;
    }
    float _298 = _282;
    float _300 = _224;
    float _302 = _298;
    float _304 = _300;
    if (_216)
    {
        float _306 = _266 * _180;
        _260 = _306;
    }
    float _308 = _260;
    if (_216)
    {
        float _310 = _266 * _174;
        _262 = _310;
    }
    float _312 = _262;
    if (_216)
    {
        float _314 = _266 * _186;
        _270 = _314;
    }
    float _316 = _270;
    if (_238)
    {
        float _318 = _280 * _182;
        _302 = _318;
    }
    float _320 = _302;
    if (_238)
    {
        float _322 = _280 * _176;
        _304 = _322;
    }
    float _324 = _304;
    if (_238)
    {
        float _326 = _280 * _188;
        _276 = _326;
    }
    float _328 = _276;
    bool _330 = !_296;
    float _348;
    if (!_330)
    {
        float _332 = in.m_69.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_116);
        float _354 = 1.0 / _352;
        float _356 = _150 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_56.x;
    float _362 = in.m_56.y;
    float _364 = in.m_56.z;
    float _366 = in.m_65.w;
    float _368 = in.m_67.w;
    float _370 = _180 * _362;
    float _372 = _186 * _362;
    float _374 = fma(_178, _360, _370);
    float _376 = fma(_184, _360, _372);
    float _378 = fma(_182, _364, _374);
    float _380 = fma(_188, _364, _376);
    float _382 = _378 + _366;
    float _384 = _380 + _368;
    float _386 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _388 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _390 = floor(_386);
    float _392 = floor(_388);
    float _394 = -_390;
    float _396 = _386 + _394;
    float _398 = -_392;
    float _400 = _388 + _398;
    float2 _3015 = float2(_396, _400);
    float _402 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3015, float2(0.0), isnan(_3015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3015, float2(0.0), isnan(_3015)), level(0.0)).x;
    float _404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _406 = log2(_404);
    float _408 = in.m_69.x;
    float _410 = in.m_69.y;
    float _412 = in.m_69.z;
    float _414 = _174 * _362;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = _358 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = fma(_172, _360, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _430;
    float _434 = 1.0 / _422;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _446 = _444 != 0;
    float _448 = fma(_176, _364, _428);
    float _450 = in.m_63.w;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _454 = _358 + _452;
    float _456 = _406 * _150;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _464 = _358 + _462;
    float _466 = 1.0 / _426;
    bool _468 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _476 = _472 || _474;
    bool _478 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _480 = isnan(1.0);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _486 = _482 || _484;
    float _488 = _410 + _412;
    float _490 = _412 + _408;
    float _492 = exp2(_456);
    float _494 = _412 + (-0.5);
    float _496 = _412 * 2.0;
    float _498 = _410 + _408;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _502 = 1.0 + _500;
    float _504 = _410 + (-0.5);
    float _506 = _410 * 2.0;
    float _508 = _488 + (-1.0);
    float _510 = 1.0 / _432;
    float _512 = _464 * _466;
    float _514 = _498 + (-1.0);
    float _516 = _490 + (-1.0);
    float _518 = _418 * _434;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _522 = _358 + _520;
    float _524 = floor(_496);
    float _526 = _408 + (-0.5);
    float _528 = _408 * 2.0;
    float _530 = -_492;
    float _532 = _530 + 1.0;
    bool _534 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _536 = isnan(_358);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = 1.0 / _502;
    float _548 = _476 ? _532 : 0.0;
    float _550 = _454 * _510;
    bool _552 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_358);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_544;
    float _566 = _564 + 1.0;
    bool _568 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _570 = isnan(_358);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = floor(_528);
    bool _582 = _524 > 0.0;
    bool _584 = _524 >= 0.0;
    bool _586 = isnan(_524);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _596 = 1.0 / _460;
    if (_486)
    {
        float _598 = _548 * _546;
        _154 = _598;
    }
    float _600 = _154;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _606;
    int _610 = _592 ? 0 : 1;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = floor(_506);
    float _618 = fma(_608, _518, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _620 = _580 >= 0.0;
    bool _622 = isnan(_580);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    bool _630 = _580 > 0.0;
    float _632 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _634;
    int _638 = _628 ? 0 : 1;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _644 = _522 * _596;
    float _646 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _648;
    bool _652 = _616 > 0.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _654;
    bool _658 = _616 >= 0.0;
    bool _660 = isnan(_616);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _672 = fma(_656, _518, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _674 = fma(_636, _518, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _676 = fma(_614, _512, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _678 = fma(_642, _512, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _680 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _682 = isnan(_358);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_670, _512, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _694 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _696 = isnan(_358);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _714 = -_690;
    float _716 = _714 + 1.0;
    float _718 = _704 * _716;
    float _720 = -_704;
    float _722 = _720 + 1.0;
    float _724 = fma(_604, _550, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _730 = _544 * _722;
    float _732 = fma(_650, _550, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _734 = _562 * _566;
    float _736 = -_562;
    float _738 = _736 + 1.0;
    float _740 = fma(_708, _550, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _746 = fma(_728, _644, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _748 = _578 * _738;
    float _750 = fma(_712, _644, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _752 = -_578;
    float _754 = _752 + 1.0;
    float _756 = _448 + _450;
    float _758 = _618 * _748;
    float _760 = _672 * _748;
    float _762 = fma(_744, _644, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _764 = _674 * _748;
    float _766 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].x, _760);
    float _770 = _756 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _772 = ~_610;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[143].z, _764);
    int _780 = ~_638;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[11].x, _770);
    int _788 = _776;
    int _790 = _784;
    if (!_582)
    {
        int _792 = ~_610;
        int _794 = _792 + 1;
        _788 = _794;
    }
    int _796 = _788;
    if (!_630)
    {
        int _798 = ~_638;
        int _800 = _798 + 1;
        _790 = _800;
    }
    int _802 = _790;
    float _804 = fma(_692, _734, _768);
    int _806 = _666 ? 0 : 1;
    float _808 = in.m_71.x;
    float _810 = in.m_71.y;
    float _812 = in.m_71.z;
    bool _814 = !_442;
    int _816 = _814 ? 0 : 1;
    float _818 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[11].z, _786);
    int _820 = ~_806;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    int _826 = abs(_816);
    float _828 = _818 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _830 = _824;
    if (!_652)
    {
        int _832 = ~_806;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_676, _734, _766);
    float _840 = _756 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _842 = fma(_678, _734, _778);
    float _844 = float(_802);
    float _846 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[10].x, _840);
    float _848 = float(_826);
    float _850 = 1.0 / _828;
    float _852 = fma(_732, _730, _804);
    float _854 = fma(_384, (*spvDescriptorSet0.vp_c8)._m0[10].z, _846);
    float _856 = fma(_724, _730, _838);
    float _858 = _848 * _844;
    float _860 = fma(_740, _730, _842);
    float _862 = _854 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _864 = !_438;
    int _866 = _864 ? 0 : 1;
    float _868 = _858 * (-2.0);
    bool _870 = !_446;
    int _872 = _870 ? 0 : 1;
    float _874 = _862 + _828;
    int _876 = abs(_866);
    float _878 = fma(_632, _868, _632);
    float _880 = fma(_868, _810, _810);
    int _882 = abs(_872);
    float _884 = fma(_750, _718, _852);
    float _886 = _874 * _850;
    float _888 = _886 * 0.5;
    float _890 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[196].y, _880);
    float _892 = fma(_746, _718, _856);
    float _894 = float(_876);
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _896);
    float _900 = float(_882);
    float _902 = fma(_878, _600, _890);
    float _904 = in.m_73.x;
    float _906 = in.m_73.y;
    float _908 = in.m_73.z;
    float _910 = float(_796);
    float _912 = 1.0 / _898;
    float _914 = float(_836);
    float _916 = _902 * 0.15915493667125701904296875;
    float _918 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].x, _884);
    float _920 = _894 * _910;
    float _922 = fma(_762, _718, _860);
    float _924 = _900 * _914;
    float _926 = _920 * (-2.0);
    float _928 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].z, _922);
    float _930 = _924 * (-2.0);
    float _932 = in.m_75.x;
    float _934 = in.m_75.y;
    float _936 = in.m_75.z;
    float _938 = fma(_926, _808, _808);
    float _940 = fma(_646, _926, _646);
    float _942 = fma(_594, _930, _594);
    float _944 = _916 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    float _950 = fma(_930, _812, _812);
    float _952 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[147].y, _892);
    float _954 = fma(_940, _600, _948);
    float _956 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[196].z, _950);
    float _958 = _918 * _904;
    float _960 = _952 * _906;
    float _962 = _954 * 0.15915493667125701904296875;
    float _964 = fma(_942, _600, _956);
    float _966 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _970 = _912 * _968;
    float _972 = _962 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = _964 * 0.15915493667125701904296875;
    float _978 = _928 * _908;
    bool _980 = _970 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _982 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _984 = _970 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _988 = _916 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _994 = _756 + _982;
    bool _996 = !_980;
    int _998 = _996 ? 0 : 1;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _1002 = _960 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1004 = _992 * _986;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _1008 = _976 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = _994 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1014 = 2;
    if (!_980)
    {
        _1014 = 1;
    }
    int _1016 = _1014;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1020 = _1016;
    if (!_984)
    {
        _1020 = _998;
    }
    int _1022 = _1020;
    float _1024 = _1002 * _1000;
    float _1026 = _966 * _1006;
    float _1028 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1012);
    float _1030 = _962 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1018);
    float _1036 = _974 * _946;
    float _1038 = _974 * _990;
    int _1040 = _1022 << 6;
    float _1042 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1034);
    float _1044 = fma(_384, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1028);
    float _1046 = _976 * 6.283185482025146484375;
    float _1048 = sin(_1046);
    float _1050 = _974 * _1010;
    float _1052 = _1042 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1054 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1056 = _1050 * _1024;
    float _1058 = _1032 * _946;
    float _1060 = _1032 * _990;
    float _1062 = _990 * _1010;
    float _1064 = _1032 * _1010;
    float _1066 = _946 * _1010;
    float _1068 = trunc(_1052);
    int _1070 = int(_1068);
    int _1072 = _1040 + 96;
    uint _1075 = uint(int(uint(_1072) >> uint(2)));
    uint _1077 = uint(int(uint(int(_1075)) >> uint(2)));
    int _1079 = int(_1075) & 3;
    float _1081 = (*spvDescriptorSet0.vp_c15)._m0[int(_1077)][_1079];
    int _1083 = int(_1075) + 1;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    int _1087 = _1083 & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    float _1091 = -_1058;
    float _1093 = fma(_1048, _1038, _1091);
    float _1095 = -_1038;
    float _1097 = fma(_1048, _1058, _1095);
    float _1099 = _1064 * _1024;
    float _1101 = fma(_1048, _1060, _1036);
    float _1103 = -_1024;
    float _1105 = _1048 * _1103;
    float _1107 = fma(_1048, _1036, _1060);
    float _1109 = trunc(_1054);
    int _1111 = int(_1109);
    int _1113 = _1040 + 48;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    float _1131 = fma(_1101, _1026, _1099);
    float _1133 = fma(_1062, _1026, _1105);
    float _1135 = fma(_1093, _1026, _1056);
    float _1137 = fma(_1097, _1004, _1131);
    float _1139 = fma(_1066, _1004, _1133);
    float _1141 = fma(_1107, _1004, _1135);
    int _1143 = _1040 + 104;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.vp_c15)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.vp_c15)._m0[int(_1155)][_1157];
    float _1161 = _1137 * _316;
    float _1163 = _1137 * _308;
    int _1165 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1167 = _1070 + _1165;
    int _1169 = _1167 + 1;
    float _1171 = _1137 * _312;
    float _1173 = fma(_1139, _294, _1161);
    float _1175 = fma(_1139, _286, _1163);
    int _1177 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1179 = _1111 + _1177;
    int _1181 = _1179 + 1;
    int _1183 = _1040 + 64;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.vp_c15)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
    float _1201 = fma(_1141, _328, _1173);
    float _1203 = fma(_1141, _320, _1175);
    bool _1205 = _1169 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1207 = fma(_1139, _290, _1171);
    float _1209 = _384 + _1201;
    int _1211 = _1169 | _1181;
    float _1213 = _382 + _1203;
    int _1215 = _1040 + 56;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    uint _1219 = uint(int(uint(int(_1217)) >> uint(2)));
    int _1221 = int(_1217) & 3;
    float _1223 = (*spvDescriptorSet0.vp_c15)._m0[int(_1219)][_1221];
    int _1225 = int(_1217) + 1;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    int _1229 = _1225 & 3;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[int(_1227)][_1229];
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1209 + _1233;
    bool _1237 = _1211 < 0;
    bool _1239 = _1237 || _1205;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1243 = _1213 + _1241;
    float _1245 = fma(_1141, _324, _1207);
    float _1247 = _1235 * _1235;
    bool _1249 = _1181 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1251 = _1249 || _1239;
    int _1253 = _1040 + 72;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    uint _1257 = uint(int(uint(int(_1255)) >> uint(2)));
    int _1259 = int(_1255) & 3;
    float _1261 = (*spvDescriptorSet0.vp_c15)._m0[int(_1257)][_1259];
    int _1263 = int(_1255) + 1;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    int _1267 = _1263 & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    float _1271 = fma(_1243, _1243, _1247);
    float _1273 = sqrt(_1271);
    float _1275 = _994 * _1089;
    int _1277 = _1040 + 80;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[int(_1289)][_1291];
    float _1295 = fma(_382, _1081, _1275);
    uint _1297 = as_type<uint>(_1137);
    float _1299 = _1245;
    float _1301 = _1213;
    float _1303 = _1207;
    if (!_1251)
    {
        int _1305 = _1181 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1307 = _1305 + _1169;
        _1297 = uint(_1307);
    }
    uint _1309 = _1297;
    float _1311 = as_type<float>(_1169);
    if (!_1251)
    {
        float _1313 = floor(_1052);
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = _994 * _1129;
    float _1319 = fma(_382, _1121, _1317);
    bool _1321 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = fma(_384, _1151, _1295);
    float _1325 = _1323 + _1159;
    int _1327 = as_type<int>(_1323);
    int _1329 = as_type<int>(_1159);
    if (!_1251)
    {
        uint _1331 = uint(int(uint(int(_1309)) >> uint(2)));
        _1327 = int(_1331);
    }
    int _1333 = _1327;
    float _1335 = _994 * _1199;
    int _1337 = as_type<int>(_1199);
    float _1339 = _1335;
    int _1341 = _1333;
    if (!_1251)
    {
        int _1343 = int(_1309) << 2;
        _1337 = _1343;
    }
    int _1345 = _1337;
    float _1347 = fma(_382, _1191, _1335);
    if (!_1251)
    {
        int _1349 = 12 & _1345;
        _1329 = _1349;
    }
    int _1351 = _1329;
    float _1353 = 1.0 / _1325;
    if (!_1321)
    {
        _1339 = _1213;
    }
    float _1355 = _1339;
    float _1357 = fma(_384, _1223, _1319);
    float _1359 = _1355;
    if (!_1251)
    {
        int _1361 = _1333 << 4;
        int _1363 = _1361 + _1351;
        _1341 = _1363;
    }
    int _1365 = _1341;
    float _1367 = _1357 + _1231;
    float _1369 = fma(_384, _1261, _1347);
    float _1371 = _756 + _1245;
    float _1373 = _1371;
    if (!_1321)
    {
        _1299 = _1209;
    }
    float _1375 = _1299;
    float _1377 = _1369 + _1269;
    bool _1379 = !_1321;
    float _1381 = _1375;
    float _1383 = _1293;
    if (!_1379)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1273 + _1387;
        float _1391 = rsqrt(_1271);
        float _1393 = _1389 * _1385;
        float _1395 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1397 = _1393 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = cos(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1401 + (-1.0);
        float _1409 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = fma(_1405, _1395, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1413 = fma(_1371, _1401, _1409);
        float _1415 = _1391 * _1411;
        float _1417 = fma(_1243, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1419 = fma(_1235, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1373 = _1413;
        _1359 = _1417;
        _1381 = _1419;
    }
    float _1421 = _1373;
    float _1423 = _1359;
    float _1425 = _1381;
    int _1427 = _1040 + 88;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    float _1445 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1447 = _1377 * _1353;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1451 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1453 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1445);
    float _1455 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1457 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1449);
    float _1459 = _1209;
    if (!_1251)
    {
        int _1461 = _1365 + 400;
        uint _1463 = uint(int(uint(_1461) >> uint(2)));
        uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
        int _1467 = int(_1463) & 3;
        float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
        _1459 = _1469;
    }
    float _1471 = _1459;
    float _1473 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1451);
    float _1475 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1477 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1457);
    float _1479 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1455);
    float _1481 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1487 = _1367 * _1353;
    float _1489 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1497 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1499 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    bool _1501 = _1487 >= 0.0;
    float _1503 = -_1495;
    float _1505 = fma(_1503, _1493, 1.0);
    float _1507 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1509 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1499);
    bool _1511 = _1487 <= 1.0;
    bool _1513 = _1511 && _1501;
    float _1515 = _1223;
    if (!_1251)
    {
        float _1517 = floor(_1054);
        _1515 = _1517;
    }
    float _1519 = _1515;
    float _1521 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1523 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1509);
    bool _1525 = _1447 >= 0.0;
    bool _1527 = _1525 && _1513;
    float _1529 = _994 * _1293;
    float _1531 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1521);
    float _1533 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1535 = _1447 <= 1.0;
    bool _1537 = _1535 && _1527;
    float _1539 = 1.0 / _1523;
    float _1541 = fma(_382, _1285, _1529);
    float _1543 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1531);
    float _1545 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1547 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1545);
    float _1549 = _1543;
    if (!_1251)
    {
        float _1551 = -_1519;
        float _1553 = _1054 + _1551;
        _1301 = _1553;
    }
    float _1555 = _1301;
    float _1557 = log2(_1505);
    float _1559 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1543);
    float _1561 = fma(_384, _1435, _1541);
    if (_1537)
    {
        float _1563 = float(_1022);
        _1383 = _1563;
    }
    float _1565 = _1383;
    float _1567 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1569 = _1561 + _1443;
    float _1571 = _1559 * _1539;
    float _1573 = _1529;
    float _1575 = _1569;
    if (_1537)
    {
        float _1577 = rint(_1565);
        float _1579 = precise::max(_1577, 0.0);
        uint _1581 = uint(_1579);
        uint _1583 = clamp(_1581, 0u, 65535u);
        _1573 = as_type<float>(_1583);
    }
    float _1585 = _1573;
    float _1587 = _1567 * _1539;
    float _1589 = _1569 * _1353;
    if (!_1251)
    {
        float _1591 = -_1315;
        float _1593 = _1052 + _1591;
        _1575 = _1593;
    }
    float _1595 = _1575;
    float _1597 = fma(_1587, 0.5, 0.5);
    float _1599 = _1557 * 0.693147182464599609375;
    float _1601 = fma(_1571, -0.5, 0.5);
    float _1603 = _1571;
    if (!_1251)
    {
        float _1605 = rint(_1471);
        float _1607 = precise::max(_1605, 0.0);
        uint _1609 = uint(_1607);
        uint _1611 = clamp(_1609, 0u, 65535u);
        _1603 = as_type<float>(_1611);
    }
    float _1613 = _1603;
    float _1615 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = _1447;
    float _1619 = _1615;
    if (_1537)
    {
        float3 _4978 = float3(_1487, _1447, float(as_type<int>(_1585)));
        float3 _4982 = select(_4978, float3(0.0), isnan(_4978));
        float _1621 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4982.xy, uint(rint(_4982.z)), _1589, level(0.0));
        _1617 = _1621;
    }
    float _1623 = _1617;
    float3 _4992 = float3(_1597, _1601, _1615);
    float _1625 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4992, float3(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4992, float3(0.0), isnan(_4992)), level(0.0)).x;
    float3 _5001 = float3(_1597, _1601, _1615);
    float4 _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5001, float3(0.0), isnan(_5001)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5001, float3(0.0), isnan(_5001)), level(0.0)).xyzw;
    float _1630 = _1628.x;
    float _1632 = _1628.y;
    float _1634 = _1628.z;
    float _1636 = _1628.w;
    float _1638 = _1555;
    if (!_1251)
    {
        float3 _5024 = float3(_1595, _1555, float(as_type<int>(_1613)));
        float3 _5026 = select(_5024, float3(0.0), isnan(_5024));
        float _1640 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5026.xy, uint(rint(_5026.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5026.xy, uint(rint(_5026.z)), level(0.0)).x;
        _1638 = _1640;
    }
    float _1642 = _1638;
    if (_1251)
    {
        _1549 = 1.0;
    }
    float _1644 = _1549;
    float _1646 = _1644;
    if (!_1251)
    {
        int _1648 = int(_1309) << 4;
        int _1650 = _1648 + 2048;
        uint _1652 = uint(int(uint(_1650) >> uint(2)));
        uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
        int _1656 = int(_1652) & 3;
        float _1658 = (*spvDescriptorSet0.vp_c15)._m0[int(_1654)][_1656];
        int _1660 = int(_1652) + 1;
        uint _1662 = uint(int(uint(_1660) >> uint(2)));
        int _1664 = _1660 & 3;
        float _1666 = (*spvDescriptorSet0.vp_c15)._m0[int(_1662)][_1664];
        int _1668 = _1650 + 8;
        uint _1670 = uint(int(uint(_1668) >> uint(2)));
        uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
        int _1674 = int(_1670) & 3;
        float _1676 = (*spvDescriptorSet0.vp_c15)._m0[int(_1672)][_1674];
        int _1678 = int(_1670) + 1;
        uint _1680 = uint(int(uint(_1678) >> uint(2)));
        int _1682 = _1678 & 3;
        float _1684 = (*spvDescriptorSet0.vp_c15)._m0[int(_1680)][_1682];
        float _1686 = _994 * _1666;
        float _1688 = fma(_382, _1658, _1686);
        float _1690 = fma(_384, _1676, _1688);
        float _1692 = _1690 + _1684;
        float _1694 = precise::clamp(_1692, 0.0, 1.0);
        float _1696 = -_1694;
        float _1698 = _1696 + _1642;
        float _1700 = fma(_1698, 500.0, 1.5);
        float _1702 = exp2(_1700);
        float _1704 = 0.0 + _1702;
        float _1706 = precise::clamp(_1704, 0.0, 1.0);
        _1646 = _1706;
    }
    float _1708 = _1646;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1712 = _1421 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1716 = _1423 + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1720 = _1425 + _1718;
    float _1722 = _1712 * _1712;
    float _1724 = fma(_1716, _1716, _1722);
    float _1726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1728 = fma(_1720, _1720, _1724);
    float _1730 = rsqrt(_1728);
    float _1732 = sqrt(_1728);
    float _1734 = _1716 * _1730;
    float _1736 = _1720 * _1730;
    float _1738 = _1712 * _1730;
    float _1740 = precise::max(0.0, _1726);
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1742 * _1742;
    float _1748 = _1744 * _1744;
    float _1750 = -_1738;
    float _1752 = -_1740;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1752);
    float _1756 = _1746 + _1748;
    float _1758 = sqrt(_1756);
    bool _1760 = _1758 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1764 = _1758 + _1762;
    float _1766 = _1052;
    float _1768 = _1726;
    float _1770 = _1756;
    float _1772 = _1764;
    float _1774 = _1742;
    float _1776 = _1744;
    float _1778 = _1746;
    float _1780 = _1748;
    float _1782 = _1754;
    if (_1760)
    {
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1766 = _1784;
    }
    float _1786 = _1766;
    if (_1760)
    {
        float _1788 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1768 = _1788;
    }
    float _1790 = _1768;
    float _1792 = _1790;
    if (_1760)
    {
        float _1794 = rsqrt(_1756);
        _1770 = _1794;
    }
    float _1796 = _1770;
    if (_1760)
    {
        float _1798 = _1764 * _1786;
        _1772 = _1798;
    }
    float _1800 = _1772;
    if (_1760)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1303 = _1802;
    }
    float _1804 = _1303;
    float _1806 = _1786;
    if (_1760)
    {
        float _1808 = _1804 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = _1800;
    if (_1760)
    {
        float _1816 = _1804 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        _1814 = _1818;
    }
    float _1820 = _1814;
    float _1822 = _1812;
    if (_1760)
    {
        float _1824 = fma(_1812, _1790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1619 = _1824;
    }
    float _1826 = _1619;
    float _1828 = _1826;
    if (_1760)
    {
        float _1830 = _1796 * _1826;
        _1828 = _1830;
    }
    float _1832 = _1828;
    if (_1760)
    {
        float _1834 = _1820 + (-1.0);
        _1792 = _1834;
    }
    float _1836 = _1792;
    if (_1760)
    {
        float _1838 = _1742 * _1832;
        _1774 = _1838;
    }
    float _1840 = _1774;
    if (_1760)
    {
        float _1842 = _1744 * _1832;
        _1776 = _1842;
    }
    float _1844 = _1776;
    if (_1760)
    {
        float _1846 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1846;
    }
    float _1848 = _1822;
    if (_1760)
    {
        float _1850 = _1840 * _1840;
        _1778 = _1850;
    }
    float _1852 = _1778;
    if (_1760)
    {
        float _1854 = _1844 * _1844;
        _1780 = _1854;
    }
    float _1856 = _1780;
    if (_1760)
    {
        float _1858 = fma(_1754, _1820, _1848);
        _1782 = _1858;
    }
    float _1860 = _1782;
    float _1862 = fma(_1860, _1860, _1852);
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1866 = fma(_1732, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1864);
    float _1868 = precise::clamp(_1866, 0.0, 1.0);
    float _1870 = _1862 + _1856;
    float _1872 = -_1868;
    float _1874 = _1872 + 1.0;
    float _1876 = rsqrt(_1870);
    float _1878 = abs(_1874);
    float _1880 = log2(_1878);
    float _1882 = _1876 * _1840;
    float _1884 = _1876 * _1860;
    float _1886 = _1876 * _1844;
    float _1888 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1890 = -_1888;
    float _1892 = fma(_1884, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1890);
    float _1894 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1896 = -_1886;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1892);
    float _1900 = exp2(_1894);
    float _1902 = fma(_1898, -0.5, 0.5);
    float _1904 = fma(_1898, 0.5, 0.5);
    float _1906 = fma(_1904, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1908 = sqrt(_1902);
    float _1910 = fma(_1904, _1906, -0.212114393711090087890625);
    float _1912 = _1884 + 1.0;
    float _1914 = fma(_1904, _1910, 1.570728778839111328125);
    float _1916 = -_1884;
    float _1918 = fma(_1900, _1912, _1916);
    float _1920 = fma(_1918, 0.5, 0.5);
    float _1922 = _1908 * 0.636619746685028076171875;
    float _1924 = -_1914;
    float _1926 = fma(_1922, _1924, 1.0);
    float2 _5474 = float2(_1926, _1920);
    float3 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5474, float2(0.0), isnan(_5474)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5474, float2(0.0), isnan(_5474)), level(0.0)).xyz;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = in.m_77.x;
    float _1940 = in.m_77.y;
    float _1942 = in.m_77.z;
    float _1944 = abs(_970);
    float _1946 = log2(_1944);
    bool _1948 = _934 != 0.0;
    bool _1950 = isnan(_934);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan(0.0);
    bool _1956 = _1952 || _1954;
    float _1958 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1960 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1962 = _932 == 0.0;
    bool _1964 = !_1956;
    bool _1966 = _1962 && _1964;
    float _1968 = -_402;
    float _1970 = _1968 + 1.0;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1974 = exp2(_1958);
    bool _1976 = _936 == 0.0;
    bool _1978 = _1976 && _1966;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1982 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1986 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1994 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1982);
    float _1996 = exp2(_1986);
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_79.x = _1423;
    out.m_79.y = _1421;
    out.m_79.z = _1425;
    float _2000 = _1940;
    float _2002 = _1938;
    float _2004 = _1942;
    if (!_1978)
    {
        float _2006 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1940);
        _2000 = _2006;
    }
    float _2008 = _2000;
    if (!_1978)
    {
        float _2010 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1938);
        _2002 = _2010;
    }
    float _2012 = _2002;
    if (!_1978)
    {
        float _2014 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1942);
        _2004 = _2014;
    }
    float _2016 = _2004;
    float _2018 = _1064 * _2008;
    float _2020 = -_2008;
    float _2022 = _1048 * _2020;
    float _2024 = _1050 * _2008;
    float _2026 = fma(_1101, _2012, _2018);
    float _2028 = fma(_1062, _2012, _2022);
    float _2030 = fma(_1093, _2012, _2024);
    float _2032 = -_1974;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1097, _2016, _2026);
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = fma(_1066, _2016, _2028);
    float _2044 = fma(_1107, _2016, _2030);
    float _2046 = _2036 * _312;
    float _2048 = fma(_2040, -2.0, 3.0);
    float _2050 = _2040 * _2040;
    float _2052 = _2036 * _308;
    float _2054 = fma(_2042, _290, _2046);
    float _2056 = _2036 * _316;
    float _2058 = _2050 * _2048;
    float _2060 = fma(_2042, _286, _2052);
    float _2062 = fma(_2044, _324, _2054);
    float _2064 = fma(_2042, _294, _2056);
    float _2066 = -_2058;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_2044, _320, _2060);
    float _2072 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2074 = fma(_2044, _328, _2064);
    float _2076 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2058);
    bool _2078 = _970 <= 8000.0;
    bool _2080 = isnan(_970);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(8000.0);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1994);
    float _2092 = _2072 * _1625;
    out.m_81.x = _1988;
    out.m_81.y = _1990;
    out.m_81.z = _1992;
    out.m_81.w = _1998;
    float _2094 = _2088 * _2076;
    float _2096 = _2088;
    if (!_1537)
    {
        _2096 = 1.0;
    }
    float _2098 = _2096;
    float _2100 = _2090 + _1523;
    float _2102 = _2098;
    if (_1537)
    {
        bool _2104 = _1623 >= _1589;
        bool _2106 = isnan(_1623);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan(_1589);
        bool _2112 = _2108 || _2110;
        float _2114 = float(_2112);
        _2102 = _2114;
    }
    float _2116 = _2102;
    float _2118 = _2094 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2120 = _2100 * 0.5;
    float _2122 = _1636 * _2092;
    float _2124 = _1970 * _2118;
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = _2116 * _1708;
    float _2130 = -_2072;
    float _2132 = _2130 + 1.0;
    out.gl_Position.x = _1567;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _2090;
    out.gl_Position.w = _1523;
    float _2134 = -_2126;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2138 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2140 = isnan(_1732);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2146 = _2142 || _2144;
    float _2148 = _1636 * _2132;
    out.m_83.z = _2120;
    out.m_83.w = _1523;
    float _2150 = -_2128;
    float _2152 = fma(_2150, _2136, 1.0);
    float _2154 = precise::clamp(_2152, 0.0, 1.0);
    out.m_85.x = _2070;
    out.m_85.y = _2062;
    out.m_85.z = _2074;
    float _2156 = _2154 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2156;
    float _2158 = _2136;
    float _2160 = _2154;
    float _2162 = _2132;
    float _2164 = 1.0;
    float _2166 = 1.0;
    float _2168 = _2122;
    if (!_2146)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2170 = _2158;
    float _2172 = _2170;
    float _2174 = _2170;
    if (!_2146)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2176 = _2160;
    out.m_89.x = 1.0;
    out.m_89.y = 1.0;
    out.m_89.z = 1.0;
    float _2178 = _2176;
    float _2180 = _2176;
    if (!_2146)
    {
        _2162 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2182 = _2162;
    float _2184 = _2182;
    float _2186 = _2182;
    if (!_2146)
    {
        _2164 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2188 = _2164;
    float _2190 = _2188;
    float _2192 = _2188;
    if (!_2146)
    {
        _2166 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2194 = _2166;
    float _2196 = _1936 * _2092;
    float _2198 = fma(_1932, _2122, _1630);
    float _2200 = fma(_1934, _2122, _1632);
    float _2202 = _2194;
    float _2204 = _2194;
    if (!_2146)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2206 = _2168;
    float _2208 = fma(_1636, _2196, _1634);
    out.m_91.x = _2198;
    out.m_91.y = _2200;
    out.m_91.z = _2208;
    out.m_91.w = _2148;
    bool _2210 = !_2146;
    float _2212 = _2206;
    float _2214 = _2206;
    if (!_2210)
    {
        bool _2216 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2218 = isnan(_1732);
        bool _2220 = _2216 || _2218;
        bool _2222 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2224 = _2220 || _2222;
        if (!_2224)
        {
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2228 = _1732 + _2226;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2232 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2230;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2238 = 1.0 / _2232;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2256 = _2228 * _2238;
            float _2258 = precise::clamp(_2256, 0.0, 1.0);
            float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2264 = fma(_2258, _2236, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2266 = fma(_2258, _2262, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2268 = fma(_2258, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2270 = fma(_2258, _2246, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2272 = fma(_2258, _2250, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2274 = fma(_2258, _2254, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2204 = _2268;
            _2214 = _2272;
            _2192 = _2264;
            _2180 = _2270;
            _2174 = _2266;
            _2186 = _2274;
            _2276 = true;
        }
        else
        {
            bool _2278 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2280 = isnan(_1732);
            bool _2282 = _2278 || _2280;
            bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2286 = _2282 || _2284;
            if (!_2286)
            {
                _2190 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2288 = _2190;
            _2192 = _2288;
            if (!_2286)
            {
                _2202 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2290 = _2202;
            _2204 = _2290;
            if (!_2286)
            {
                _2172 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2292 = _2172;
            _2174 = _2292;
            if (!_2286)
            {
                _2178 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2294 = _2178;
            _2180 = _2294;
            if (!_2286)
            {
                _2212 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2296 = _2212;
            _2214 = _2296;
            if (!_2286)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2298 = _2184;
            bool _2300 = !_2286;
            _2186 = _2298;
            if (!_2300)
            {
                bool _2302 = _1732 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2304 = isnan(_1732);
                bool _2306 = _2302 || _2304;
                bool _2308 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2310 = _2306 || _2308;
                if (!_2310)
                {
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2314 = _1732 + _2312;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2318 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2316;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2324 = 1.0 / _2318;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2342 = _2314 * _2324;
                    float _2344 = precise::clamp(_2342, 0.0, 1.0);
                    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2350 = fma(_2344, _2322, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2352 = fma(_2344, _2348, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2354 = fma(_2344, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2356 = fma(_2344, _2332, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2358 = fma(_2344, _2336, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2360 = fma(_2344, _2340, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2204 = _2354;
                    _2214 = _2358;
                    _2192 = _2350;
                    _2180 = _2356;
                    _2174 = _2352;
                    _2186 = _2360;
                    _2276 = true;
                }
                else
                {
                    _2204 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2214 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2192 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2180 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2174 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2276 = false;
    float _2362 = _2204;
    float _2364 = _2214;
    float _2366 = _2192;
    float _2368 = _2180;
    float _2370 = _2174;
    float _2372 = _2186;
    float _2374 = fma(_2062, -0.5, 0.5);
    float _2376 = precise::clamp(_2374, 0.0, 1.0);
    float _2378 = -_2362;
    float _2380 = _2378 + _2364;
    float _2382 = -_2366;
    float _2384 = _2382 + _2368;
    float _2386 = -_2370;
    float _2388 = _2386 + _2372;
    bool _2390 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2392 = fma(_2376, _2380, _2362);
    float _2394 = fma(_2376, _2384, _2366);
    float _2396 = fma(_2376, _2388, _2370);
    float _2398 = _2392 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2400 = fma(_2394, 0.298911988735198974609375, _2398);
    float _2402 = fma(_2396, 0.114477999508380889892578125, _2400);
    out.m_93.x = 0.0;
    float _2404 = -_2402;
    float _2406 = _2394 + _2404;
    float _2408 = -_2402;
    float _2410 = _2392 + _2408;
    float _2412 = -_2402;
    float _2414 = _2396 + _2412;
    float _2416 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2418 = fma(_2406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    float _2420 = fma(_2410, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    float _2422 = fma(_2414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2402);
    out.m_95.x = 0.0;
    out.m_87.w = _2416;
    out.m_97.x = _2418;
    out.m_97.y = _2420;
    out.m_97.z = _2422;
    if (!_2390)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2424 = -_1421;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2428 = -_1423;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2432 = -_1425;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2436 = _2426 * _2426;
    float _2438 = fma(_2430, _2430, _2436);
    float _2440 = fma(_2434, _2434, _2438);
    float _2442 = rsqrt(_2440);
    float _2444 = sqrt(_2440);
    float _2446 = _2426 * _2442;
    float _2448 = _2430 * _2442;
    float _2450 = _2434 * _2442;
    float _2452 = -_1738;
    float _2454 = _2452 + _2446;
    float _2456 = -_1734;
    float _2458 = _2456 + _2448;
    float _2460 = -_1736;
    float _2462 = _2460 + _2450;
    float _2464 = _2454 * _2454;
    float _2466 = -_2444;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2470 = fma(_2458, _2458, _2464);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2462, _2462, _2470);
    float _2478 = abs(_2474);
    float _2480 = log2(_2478);
    float _2482 = rsqrt(_2476);
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2486 = exp2(_2484);
    float _2488 = _2454 * _2482;
    float _2490 = _2458 * _2482;
    float _2492 = _2462 * _2482;
    float _2494 = _2062 * _2488;
    float _2496 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2498 = precise::clamp(_2496, 0.0, 1.0);
    float _2500 = _2062 * _2446;
    float _2502 = fma(_2070, _2490, _2494);
    float _2504 = _2498 * _2498;
    float _2506 = fma(_2070, _2448, _2500);
    float _2508 = fma(_2074, _2492, _2502);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = _2504 + (-1.0);
    float _2514 = fma(_2074, _2450, _2506);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = _2510 * _2510;
    float _2520 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = fma(_2518, _2512, 1.0);
    float _2524 = -_2446;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = _2522 * _2522;
    float _2532 = -_2450;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2538 = _2534 + _2536;
    float _2540 = 1.0 / _2530;
    float _2542 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = _2486 * _2544;
    float _2548 = _2516 * _2546;
    float _2550 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2552 = _2504 * _2540;
    float _2554 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2556 = _2548 * _2552;
    float _2558 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2560 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2562 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2564 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2550;
    out.m_93.y = _2554;
    out.m_93.z = _2558;
    out.m_95.x = _2560;
    out.m_95.y = _2562;
    out.m_95.z = _2564;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

