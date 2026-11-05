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
    float4 m_81 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2182 = false;
    bool _194 = false;
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
        float _2527 = as_type<float>(_132);
        out.gl_Position.z = _2527;
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
        float _2596 = as_type<float>(_170);
        out.gl_Position.z = _2596;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_63.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_116);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = in.m_56.x;
    float _206 = in.m_56.y;
    float _208 = in.m_56.z;
    float _210 = _206 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _212 = _206 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _214 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].x, _210);
    float _216 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].x, _212);
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].z, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].z, _216);
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _224 = _220 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _228 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _230 = floor(_226);
    float _232 = floor(_228);
    float _234 = -_230;
    float _236 = _226 + _234;
    float _238 = -_232;
    float _240 = _228 + _238;
    float2 _2723 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2723, float2(0.0), isnan(_2723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2723, float2(0.0), isnan(_2723)), level(0.0)).x;
    float _244 = in.m_63.x;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = in.m_63.z;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _254;
    float _258 = in.m_63.y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _274 = _272 != 0;
    float _276 = 1.0 / _256;
    float _278 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _202 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _202 + _284;
    float _288 = _248 * _150;
    bool _290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _298 = _294 || _296;
    float _300 = 1.0 / _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _304 = 1.0 + _302;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _314 = _310 || _312;
    float _316 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    bool _318 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_202);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = exp2(_288);
    float _332 = _244 * 2.0;
    float _334 = _252 * 2.0;
    float _336 = _282 * _276;
    float _338 = _258 + _252;
    float _340 = _258 * 2.0;
    bool _342 = !_270;
    int _344 = _342 ? 0 : 1;
    float _346 = floor(_332);
    float _348 = _338 + (-1.0);
    float _350 = _286 * _300;
    float _352 = _244 + _252;
    float _354 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _356 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_202);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _352 + (-1.0);
    float _370 = floor(_334);
    float _372 = _244 + _258;
    float _374 = -_330;
    float _376 = _374 + 1.0;
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _380 = _372 + (-1.0);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = _314 ? _376 : 0.0;
    float _388 = 1.0 / _304;
    bool _390 = _346 >= 0.0;
    bool _392 = isnan(_346);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = fma(_384, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _402 = abs(_344);
    float _404 = _252 + (-0.5);
    int _406 = _398 ? 0 : 1;
    float _408 = floor(_340);
    float _410 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _412 = _370 > 0.0;
    bool _414 = _370 >= 0.0;
    bool _416 = isnan(_370);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = -_366;
    float _426 = _424 + 1.0;
    float _428 = _222;
    if (_298)
    {
        float _430 = _386 * _388;
        _154 = _430;
    }
    float _432 = _154;
    bool _434 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_202);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _446;
    bool _450 = _346 > 0.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = _328 * _426;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = fma(_448, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _464 = _408 > 0.0;
    float _466 = fma(_454, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _468 = _408 >= 0.0;
    bool _470 = isnan(_408);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = -_328;
    float _480 = _478 + 1.0;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = fma(_460, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = _316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _490 = _444 * _480;
    float _492 = fma(_484, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -_444;
    float _500 = _498 + 1.0;
    float _502 = _400 * _490;
    float _504 = _462 * _490;
    float _506 = _466 * _490;
    float _508 = _488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _502);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    float _516 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _508);
    float _518 = in.m_65.x;
    float _520 = in.m_65.y;
    float _522 = in.m_65.z;
    int _524 = ~_406;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = fma(_496, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _532 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _516);
    int _534 = _528;
    if (!_450)
    {
        int _536 = ~_406;
        int _538 = _536 + 1;
        _534 = _538;
    }
    int _540 = _534;
    float _542 = _488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _544 = float(_402);
    float _546 = _532 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _548 = float(_540);
    float _550 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _542);
    int _552 = _422 ? 0 : 1;
    float _554 = 1.0 / _546;
    float _556 = fma(_486, _456, _512);
    float _558 = _544 * _548;
    float _560 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _550);
    bool _562 = !_266;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_492, _456, _510);
    float _568 = _558 * (-2.0);
    int _570 = _476 ? 0 : 1;
    float _572 = _560 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _574 = ~_552;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_354, _568, _354);
    bool _582 = !_274;
    int _584 = _582 ? 0 : 1;
    float _586 = _258 + (-0.5);
    int _588 = _578;
    if (!_412)
    {
        int _590 = ~_552;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_568, _520, _520);
    int _598 = abs(_564);
    float _600 = _572 + _546;
    int _602 = ~_570;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_530, _456, _514);
    int _610 = abs(_584);
    float _612 = _600 * _554;
    float _614 = _612 * 0.5;
    int _616 = _606;
    if (!_464)
    {
        int _618 = ~_570;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].x, _556);
    float _626 = float(_598);
    float _628 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].z, _608);
    float _630 = float(_594);
    float _632 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[196].y, _596);
    float _634 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _636 = float(_610);
    float _638 = fma(_580, _432, _632);
    float _640 = float(_622);
    float _642 = _626 * _630;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _646 = fma(_614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _644);
    float _648 = in.m_67.x;
    float _650 = in.m_67.y;
    float _652 = in.m_67.z;
    float _654 = _638 * 0.15915493667125701904296875;
    float _656 = _642 * (-2.0);
    float _658 = _636 * _640;
    float _660 = _244 + (-0.5);
    float _662 = 1.0 / _646;
    float _664 = fma(_656, _518, _518);
    float _666 = _658 * (-2.0);
    float _668 = in.m_69.x;
    float _670 = in.m_69.y;
    float _672 = in.m_69.z;
    float _674 = fma(_410, _656, _410);
    float _676 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _664);
    float _678 = fma(_666, _522, _522);
    float _680 = fma(_378, _666, _378);
    float _682 = _654 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = fma(_674, _432, _676);
    float _688 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _690 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].y, _566);
    float _692 = _488 + _634;
    float _694 = _686 * 0.15915493667125701904296875;
    float _696 = fma(_680, _432, _688);
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _700 = _662 * _698;
    float _702 = _694 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _696 * 0.15915493667125701904296875;
    float _708 = _690 * _650;
    float _710 = _624 * _648;
    bool _712 = _700 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _714 = _628 * _652;
    bool _716 = _700 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _720 = _654 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _732 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _734 = _718 * _726;
    float _736 = _724 * _728;
    float _738 = _694 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _692 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _744 = !_712;
    int _746 = _744 ? 0 : 1;
    float _748 = _732 * _730;
    float _750 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _742);
    int _752 = 2;
    float _754 = _692;
    if (!_712)
    {
        _752 = 1;
    }
    int _756 = _752;
    float _758 = _704 * _684;
    float _760 = _706 * 6.283185482025146484375;
    float _762 = cos(_760);
    int _764 = _756;
    if (!_716)
    {
        _764 = _746;
    }
    int _766 = _764;
    float _768 = _704 * _722;
    float _770 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _750);
    float _772 = _692 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _774 = _766 << 6;
    float _776 = _770 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _778 = _706 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = _740 * _722;
    float _784 = _740 * _684;
    float _786 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    int _788 = _774 + 72;
    uint _791 = uint(int(uint(_788) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.vp_c15)._m0[int(_801)][_803];
    float _807 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _786);
    float _809 = _740 * _762;
    float _811 = _722 * _762;
    float _813 = _704 * _762;
    float _815 = _684 * _762;
    float _817 = _809 * _736;
    float _819 = _807 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _821 = trunc(_776);
    int _823 = int(_821);
    int _825 = _774 + 64;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c15)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c15)._m0[int(_837)][_839];
    float _843 = -_784;
    float _845 = fma(_780, _768, _843);
    float _847 = fma(_780, _782, _758);
    float _849 = -_768;
    float _851 = fma(_780, _784, _849);
    float _853 = -_736;
    float _855 = _780 * _853;
    float _857 = _813 * _736;
    float _859 = fma(_847, _734, _817);
    float _861 = fma(_780, _758, _782);
    int _863 = _774 + 96;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.vp_c15)._m0[int(_875)][_877];
    float _881 = fma(_811, _734, _855);
    float _883 = fma(_851, _748, _859);
    float _885 = fma(_845, _734, _857);
    float _887 = trunc(_819);
    int _889 = int(_887);
    float _891 = fma(_815, _748, _881);
    float _893 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _895 = fma(_861, _748, _885);
    int _897 = _774 + 48;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _893);
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _823 + _919;
    int _923 = _921 + 1;
    float _925 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _927 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _929 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _917);
    int _931 = _774 + 104;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    uint _935 = uint(int(uint(int(_933)) >> uint(2)));
    int _937 = int(_933) & 3;
    float _939 = (*spvDescriptorSet0.vp_c15)._m0[int(_935)][_937];
    int _941 = int(_933) + 1;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    int _945 = _941 & 3;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[int(_943)][_945];
    float _949 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _927);
    float _951 = _929 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _953 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _955 = _889 + _953;
    int _957 = _955 + 1;
    float _959 = _949 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _961 = _224 + _951;
    int _963 = _774 + 56;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = _222 + _959;
    bool _983 = _957 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _987 = _961 + _985;
    int _989 = _957 | _923;
    float _991 = _987 * _987;
    int _993 = _774 + 80;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    bool _1011 = _989 < 0;
    bool _1013 = _1011 || _983;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _981 + _1015;
    bool _1019 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1021 = _1019 || _1013;
    float _1023 = fma(_1017, _1017, _991);
    float _1025 = _692 * _841;
    float _1027 = sqrt(_1023);
    float _1029 = fma(_222, _833, _1025);
    float _1031 = _692 * _879;
    float _1033 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _925);
    int _1035 = _957;
    int _1037 = as_type<int>(_925);
    int _1039 = as_type<int>(_833);
    float _1041 = _895;
    if (!_1021)
    {
        int _1043 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1045 = _1043 + _957;
        _1035 = _1045;
    }
    int _1047 = _1035;
    float _1049 = _891;
    float _1051 = as_type<float>(_1047);
    if (!_1021)
    {
        float _1053 = floor(_819);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = fma(_222, _871, _1031);
    float _1059 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1033);
    float _1061 = fma(_224, _797, _1029);
    float _1063 = _1059;
    if (!_1021)
    {
        int _1065 = _1047 << 2;
        _1037 = _1065;
    }
    int _1067 = _1037;
    float _1069 = _692 * _913;
    float _1071 = as_type<float>(_1067);
    if (!_1021)
    {
        uint _1073 = uint(int(uint(_1047) >> uint(2)));
        _1039 = int(_1073);
    }
    int _1075 = _1039;
    float _1077 = _1061 + _805;
    bool _1079 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1081 = fma(_222, _905, _1069);
    float _1083 = fma(_224, _939, _1057);
    float _1085 = _1083 + _947;
    int _1087 = as_type<int>(_947);
    int _1089 = _1075;
    float _1091 = _1027;
    if (!_1021)
    {
        int _1093 = 12 & _1067;
        _1087 = _1093;
    }
    int _1095 = _1087;
    float _1097 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1099 = fma(_224, _971, _1081);
    float _1101 = _1097;
    if (!_1021)
    {
        int _1103 = _1075 << 4;
        int _1105 = _1103 + _1095;
        _1089 = _1105;
    }
    int _1107 = _1089;
    float _1109 = 1.0 / _1085;
    float _1111 = _488 + _1097;
    float _1113 = _1099 + _979;
    if (!_1079)
    {
        _1101 = _981;
    }
    float _1115 = _1101;
    float _1117 = _1115;
    if (!_1079)
    {
        _1071 = _961;
    }
    float _1119 = _1071;
    float _1121 = _1119;
    if (!_1079)
    {
        _1063 = _1111;
    }
    float _1123 = _1063;
    bool _1125 = !_1079;
    float _1127 = _1123;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1027 + _1131;
        float _1135 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = rsqrt(_1023);
        float _1139 = _1133 * _1129;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 + (-1.0);
        float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = fma(_1149, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = fma(_1111, _1145, _1153);
        float _1159 = _1137 * _1155;
        float _1161 = fma(_1017, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_987, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1157;
        _1117 = _1161;
        _1091 = _1133;
        _1121 = _1163;
    }
    float _1165 = _1127;
    float _1167 = _1117;
    float _1169 = _1091;
    float _1171 = _1121;
    int _1173 = _774 + 88;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    uint _1177 = uint(int(uint(int(_1175)) >> uint(2)));
    int _1179 = int(_1175) & 3;
    float _1181 = (*spvDescriptorSet0.vp_c15)._m0[int(_1177)][_1179];
    int _1183 = int(_1175) + 1;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    int _1187 = _1183 & 3;
    float _1189 = (*spvDescriptorSet0.vp_c15)._m0[int(_1185)][_1187];
    float _1191 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1193 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1195 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1197 = _1113 * _1109;
    float _1199 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1191);
    float _1201 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1193);
    float _1203 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1195);
    float _1205 = _1169;
    if (!_1021)
    {
        int _1207 = _1107 + 400;
        uint _1209 = uint(int(uint(_1207) >> uint(2)));
        uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
        int _1213 = int(_1209) & 3;
        float _1215 = (*spvDescriptorSet0.vp_c15)._m0[int(_1211)][_1213];
        _1205 = _1215;
    }
    float _1217 = _1205;
    float _1219 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1199);
    bool _1221 = _1197 >= 0.0;
    float _1223 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1201);
    float _1225 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1227 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1203);
    float _1229 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1231 = _1077 * _1109;
    bool _1233 = _1197 <= 1.0;
    bool _1235 = _1233 && _1221;
    float _1237 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1239 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1225);
    float _1241 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1245 = _1231 >= 0.0;
    bool _1247 = _1245 && _1235;
    float _1249 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1251 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1253 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1255 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1243);
    bool _1257 = _1231 <= 1.0;
    bool _1259 = _1257 && _1247;
    float _1261 = -_1251;
    float _1263 = fma(_1261, _1249, 1.0);
    float _1265 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1267 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1255);
    float _1269 = _692 * _1009;
    float _1271 = _979;
    float _1273 = _1263;
    if (!_1021)
    {
        float _1275 = floor(_776);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1267);
    float _1283 = fma(_222, _1001, _1269);
    float _1285 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1287 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1279);
    float _1289 = log2(_1263);
    if (_1259)
    {
        float _1291 = float(_766);
        _1041 = _1291;
    }
    float _1293 = _1041;
    float _1295 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1285);
    float _1297 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1287);
    float _1299 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1295);
    float _1301 = 1.0 / _1281;
    float _1303 = fma(_224, _1181, _1283);
    float _1305 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1307 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1299);
    float _1309 = _1189;
    float _1311 = _1293;
    float _1313 = _1307;
    float _1315 = _1305;
    if (!_1021)
    {
        float _1317 = -_1277;
        float _1319 = _776 + _1317;
        _1273 = _1319;
    }
    float _1321 = _1273;
    float _1323 = _1303 + _1189;
    if (!_1021)
    {
        float _1325 = -_1055;
        float _1327 = _819 + _1325;
        _1309 = _1327;
    }
    float _1329 = _1309;
    float _1331 = _1285;
    if (_1259)
    {
        float _1333 = rint(_1293);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        uint _1339 = clamp(_1337, 0u, 65535u);
        _1331 = as_type<float>(_1339);
    }
    float _1341 = _1331;
    float _1343 = _1323 * _1109;
    float _1345 = _1289 * 0.693147182464599609375;
    float _1347 = _1323;
    float _1349 = _1343;
    if (!_1021)
    {
        float _1351 = rint(_1217);
        float _1353 = precise::max(_1351, 0.0);
        uint _1355 = uint(_1353);
        uint _1357 = clamp(_1355, 0u, 65535u);
        _1347 = as_type<float>(_1357);
    }
    float _1359 = _1347;
    float _1361 = _1305 * _1301;
    float _1363 = _1307 * _1301;
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1367 = fma(_1361, 0.5, 0.5);
    float _1369 = fma(_1363, -0.5, 0.5);
    float _1371 = _1269;
    if (_1259)
    {
        float3 _4539 = float3(_1197, _1231, float(as_type<int>(_1341)));
        float3 _4543 = select(_4539, float3(0.0), isnan(_4539));
        float _1373 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4543.xy, uint(rint(_4543.z)), _1343, level(0.0));
        _1371 = _1373;
    }
    float _1375 = _1371;
    float3 _4553 = float3(_1367, _1369, _1365);
    float _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4553, float3(0.0), isnan(_4553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4553, float3(0.0), isnan(_4553)), level(0.0)).x;
    float3 _4562 = float3(_1367, _1369, _1365);
    float4 _1380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4562, float3(0.0), isnan(_4562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4562, float3(0.0), isnan(_4562)), level(0.0)).xyzw;
    float _1382 = _1380.x;
    float _1384 = _1380.y;
    float _1386 = _1380.z;
    float _1388 = _1380.w;
    float _1390 = _1345;
    if (!_1021)
    {
        float3 _4585 = float3(_1329, _1321, float(as_type<int>(_1359)));
        float3 _4587 = select(_4585, float3(0.0), isnan(_4585));
        float _1392 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4587.xy, uint(rint(_4587.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4587.xy, uint(rint(_4587.z)), level(0.0)).x;
        _1390 = _1392;
    }
    float _1394 = _1390;
    if (_1021)
    {
        _1311 = 1.0;
    }
    float _1396 = _1311;
    float _1398 = _1396;
    if (!_1021)
    {
        int _1400 = _1047 << 4;
        int _1402 = _1400 + 2048;
        uint _1404 = uint(int(uint(_1402) >> uint(2)));
        uint _1406 = uint(int(uint(int(_1404)) >> uint(2)));
        int _1408 = int(_1404) & 3;
        float _1410 = (*spvDescriptorSet0.vp_c15)._m0[int(_1406)][_1408];
        int _1412 = int(_1404) + 1;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        int _1416 = _1412 & 3;
        float _1418 = (*spvDescriptorSet0.vp_c15)._m0[int(_1414)][_1416];
        int _1420 = _1402 + 8;
        uint _1422 = uint(int(uint(_1420) >> uint(2)));
        uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
        int _1426 = int(_1422) & 3;
        float _1428 = (*spvDescriptorSet0.vp_c15)._m0[int(_1424)][_1426];
        int _1430 = int(_1422) + 1;
        uint _1432 = uint(int(uint(_1430) >> uint(2)));
        int _1434 = _1430 & 3;
        float _1436 = (*spvDescriptorSet0.vp_c15)._m0[int(_1432)][_1434];
        float _1438 = _692 * _1418;
        float _1440 = fma(_222, _1410, _1438);
        float _1442 = fma(_224, _1428, _1440);
        float _1444 = _1442 + _1436;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        float _1448 = -_1446;
        float _1450 = _1448 + _1394;
        float _1452 = fma(_1450, 500.0, 1.5);
        float _1454 = exp2(_1452);
        float _1456 = 0.0 + _1454;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        _754 = _1438;
        _1051 = as_type<float>(_1402);
        _1398 = _1458;
    }
    float _1460 = _754;
    float _1462 = _1051;
    float _1464 = _1398;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1165 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1167 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1171 + _1474;
    float _1478 = _1468 * _1468;
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = fma(_1476, _1476, _1480);
    float _1484 = rsqrt(_1482);
    float _1486 = sqrt(_1482);
    float _1488 = _1472 * _1484;
    float _1490 = _1476 * _1484;
    float _1492 = _1468 * _1484;
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 * _1496;
    float _1502 = _1498 + _1500;
    float _1504 = sqrt(_1502);
    bool _1506 = _1504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1510 = _1504 + _1508;
    float _1512 = _1197;
    float _1514 = _1510;
    float _1516 = _1462;
    float _1518 = _1494;
    float _1520 = _1498;
    float _1522 = _1500;
    if (_1506)
    {
        float _1524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1524;
    }
    float _1526 = _1512;
    if (_1506)
    {
        float _1528 = rsqrt(_1502);
        _428 = _1528;
    }
    float _1530 = _428;
    float _1532 = _1530;
    if (_1506)
    {
        float _1534 = _1510 * _1526;
        _1514 = _1534;
    }
    float _1536 = _1514;
    if (_1506)
    {
        float _1538 = _1536 * 0.15915493667125701904296875;
        _1516 = _1538;
    }
    float _1540 = _1516;
    float _1542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1544 = _1460;
    float _1546 = _1542;
    if (_1506)
    {
        float _1548 = _1540 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = precise::max(0.0, _1542);
    float _1556 = _1536;
    float _1558 = _1554;
    if (_1506)
    {
        float _1560 = _1540 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        _1556 = _1562;
    }
    float _1564 = _1556;
    float _1566 = -_1492;
    float _1568 = -_1554;
    float _1570 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1568);
    if (_1506)
    {
        float _1572 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1572;
    }
    float _1574 = _1546;
    float _1576 = _1552;
    float _1578 = _1574;
    if (_1506)
    {
        float _1580 = fma(_1552, _1574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1506)
    {
        _1578 = _1570;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (_1506)
    {
        float _1590 = _1530 * _1582;
        _1584 = _1590;
    }
    float _1592 = _1584;
    if (_1506)
    {
        float _1594 = _1564 + (-1.0);
        _1558 = _1594;
    }
    float _1596 = _1558;
    float _1598 = _1596;
    if (_1506)
    {
        float _1600 = _1494 * _1592;
        _1518 = _1600;
    }
    float _1602 = _1518;
    if (_1506)
    {
        float _1604 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1532 = _1604;
    }
    float _1606 = _1532;
    if (!_1506)
    {
        _1598 = _1496;
    }
    float _1608 = _1598;
    float _1610 = _1608;
    if (_1506)
    {
        float _1612 = _1496 * _1592;
        _1610 = _1612;
    }
    float _1614 = _1610;
    if (_1506)
    {
        float _1616 = _1602 * _1602;
        _1520 = _1616;
    }
    float _1618 = _1520;
    if (_1506)
    {
        float _1620 = fma(_1570, _1564, _1606);
        _1588 = _1620;
    }
    float _1622 = _1588;
    if (_1506)
    {
        float _1624 = _1614 * _1614;
        _1522 = _1624;
    }
    float _1626 = _1522;
    float _1628 = fma(_1622, _1622, _1618);
    float _1630 = _1628 + _1626;
    float _1632 = rsqrt(_1630);
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1636 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1634);
    float _1638 = precise::clamp(_1636, 0.0, 1.0);
    float _1640 = -_1638;
    float _1642 = _1640 + 1.0;
    float _1644 = abs(_1642);
    float _1646 = log2(_1644);
    float _1648 = _1632 * _1602;
    float _1650 = _1632 * _1622;
    float _1652 = _1632 * _1614;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1656 = -_1654;
    float _1658 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1656);
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1662 = -_1652;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1658);
    float _1666 = fma(_1664, -0.5, 0.5);
    float _1668 = exp2(_1660);
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1674 = sqrt(_1666);
    float _1676 = fma(_1670, _1672, -0.212114393711090087890625);
    float _1678 = _1650 + 1.0;
    float _1680 = fma(_1670, _1676, 1.570728778839111328125);
    float _1682 = -_1650;
    float _1684 = fma(_1668, _1678, _1682);
    float _1686 = fma(_1684, 0.5, 0.5);
    float _1688 = _1674 * 0.636619746685028076171875;
    float _1690 = -_1680;
    float _1692 = fma(_1688, _1690, 1.0);
    float2 _5053 = float2(_1692, _1686);
    float3 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5053, float2(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5053, float2(0.0), isnan(_5053)), level(0.0)).xyz;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1706 = in.m_71.x;
    float _1708 = abs(_700);
    float _1710 = log2(_1708);
    bool _1712 = _258 > 0.5;
    float _1714 = _1704 * _244;
    float _1716 = in.m_71.y;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1720 = _1718 != 0;
    float _1722 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1726 = _1724 != 0;
    float _1728 = -_242;
    float _1730 = _1728 + 1.0;
    float _1732 = trunc(_1714);
    int _1734 = int(_1732);
    bool _1736 = _244 > 0.5;
    bool _1738 = _1736 && _1720;
    float _1740 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    out.m_73.x = _1167;
    out.m_73.y = _1165;
    out.m_73.z = _1171;
    float _1742 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1740);
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1746 = _670 != 0.0;
    bool _1748 = isnan(_670);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan(0.0);
    bool _1754 = _1750 || _1752;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1762 = _668 == 0.0;
    bool _1764 = !_1754;
    bool _1766 = _1762 && _1764;
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = 0.0;
    float _1772 = _1706;
    if (_1720)
    {
        _1770 = _1706;
    }
    float _1774 = _1770;
    float _1776 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1778 = _1734 << 4;
    int _1780 = _1778 + 1712;
    float _1782 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1784 = in.m_75.x;
    float _1786 = in.m_75.y;
    float _1788 = in.m_75.z;
    bool _1790 = _672 == 0.0;
    bool _1792 = _1790 && _1766;
    uint _1794 = uint(int(uint(_1780) >> uint(2)));
    uint _1796 = uint(int(uint(int(_1794)) >> uint(2)));
    int _1798 = int(_1794) & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    int _1802 = int(_1794) + 1;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    int _1806 = _1802 & 3;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[int(_1804)][_1806];
    float _1810 = _1774;
    if (_1738)
    {
        float _1812 = -_1774;
        float _1814 = _1812 + 1.0;
        _1810 = _1814;
    }
    float _1816 = _1810;
    float _1818 = -_1716;
    float _1820 = _1818 + 1.0;
    bool _1822 = _700 <= 8000.0;
    bool _1824 = isnan(_700);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan(8000.0);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1742);
    float _1836 = _1716;
    if (_1720)
    {
        _1772 = _1816;
    }
    float _1838 = _1772;
    int _1840 = _1780 + 8;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    if (_1726)
    {
        float _1850 = _1712 ? _1820 : _1716;
        _1836 = _1850;
    }
    float _1852 = _1836;
    out.gl_Position.x = _1305;
    out.gl_Position.y = _1307;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1281;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1856 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1864 = _1856 * _1758;
    out.m_77.x = _1768;
    out.m_77.y = _1776;
    out.m_77.z = _1858;
    float _1866 = _1784;
    float _1868 = _1788;
    float _1870 = _1786;
    if (!_1792)
    {
        float _1872 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1784);
        _1866 = _1872;
    }
    float _1874 = _1866;
    if (!_1792)
    {
        float _1876 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1788);
        _1868 = _1876;
    }
    float _1878 = _1868;
    float _1880 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1792)
    {
        float _1882 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1786);
        _1870 = _1882;
    }
    float _1884 = _1870;
    float _1886 = -_780;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1880);
    float _1890 = _1854 * _1862;
    float _1892 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1894 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_79.x = _1890;
    out.m_79.y = _1864;
    float _1896 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1898 = _1808 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1900 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1902 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = exp2(_1782);
    float _1908 = -_780;
    float _1910 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1892);
    float _1912 = _1848 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1914 = -_780;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1894);
    float _1918 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1910);
    float _1920 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1922 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1900);
    float _1926 = _1918 * _1884;
    float _1928 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_81.x = _1902;
    out.m_81.y = _1904;
    out.m_81.z = _1920;
    out.m_81.w = _1860;
    float _1930 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1932 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1928);
    float _1934 = fma(_1906, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1936 = precise::clamp(_1934, 0.0, 1.0);
    float _1938 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1888);
    float _1940 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1916);
    float _1942 = _1938 * _1884;
    float _1944 = _1940 * _1884;
    float _1946 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1924);
    float _1948 = _847 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1950 = _847 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1952 = _847 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1930);
    float _1956 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1948);
    float _1958 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1950);
    float _1960 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    float _1962 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1956);
    float _1964 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1958);
    float _1966 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1960);
    float _1968 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1932);
    float _1970 = fma(_1962, _1874, _1942);
    float _1972 = fma(_1964, _1874, _1926);
    float _1974 = fma(_1966, _1874, _1944);
    float _1976 = fma(_1936, -2.0, 3.0);
    float _1978 = fma(_1946, _1878, _1970);
    float _1980 = fma(_1954, _1878, _1972);
    float _1982 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1984 = _1936 * _1936;
    float _1986 = fma(_1968, _1878, _1974);
    float _1988 = _1984 * _1976;
    float _1990 = exp2(_1982);
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1992 = -_1988;
    float _1994 = _1992 + 1.0;
    out.m_85.x = _1978;
    out.m_85.y = _1980;
    out.m_85.z = _1986;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1988);
    float _1998 = _1994;
    if (!_1259)
    {
        _1998 = 1.0;
    }
    float _2000 = _1998;
    float _2002 = _1834 + _1281;
    float _2004 = _2000;
    if (_1259)
    {
        bool _2006 = _1375 >= _1343;
        bool _2008 = isnan(_1375);
        bool _2010 = _2006 || _2008;
        bool _2012 = isnan(_1343);
        bool _2014 = _2010 || _2012;
        float _2016 = float(_2014);
        _2004 = _2016;
    }
    float _2018 = _2004;
    float _2020 = _1832 * _1996;
    bool _2022 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2024 = isnan(_1486);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2030 = _2026 || _2028;
    float _2032 = _2002 * 0.5;
    float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2036 = -_1990;
    float _2038 = _2036 + 1.0;
    float _2040 = _2018 * _1464;
    out.m_87.z = _2032;
    out.m_87.w = _1281;
    float _2042 = _1730 * _2034;
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2048 = -_2044;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2052 = _2046 * _1377;
    float _2054 = -_2046;
    float _2056 = _2054 + 1.0;
    float _2058 = _2056;
    if (!_2030)
    {
        _1313 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2060 = _1313;
    float _2062 = -_2040;
    float _2064 = fma(_2062, _2050, 1.0);
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = _1388 * _2052;
    float _2070 = _1388 * _2056;
    float _2072 = _2066;
    float _2074 = _2068;
    float _2076 = _2060;
    float _2078 = _2060;
    if (!_2030)
    {
        _1315 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2080 = _1315;
    float _2082 = _2066 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2084 = _2080;
    float _2086 = _2080;
    if (!_2030)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2088 = _1349;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2030)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2094 = _2058;
    out.m_89.x = _2082;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2030)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2100 = _2072;
    float _2102 = _1702 * _2052;
    float _2104 = fma(_1698, _2068, _1382);
    float _2106 = fma(_1700, _2068, _1384);
    float _2108 = _2100;
    float _2110 = _2100;
    if (!_2030)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2112 = _2074;
    float _2114 = fma(_1388, _2102, _1386);
    out.m_91.x = _2104;
    out.m_91.y = _2106;
    out.m_91.z = _2114;
    out.m_91.w = _2070;
    bool _2116 = !_2030;
    float _2118 = _2112;
    float _2120 = _2112;
    if (!_2116)
    {
        bool _2122 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1486);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1486 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = 1.0 / _2138;
            float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2162 = _2134 * _2140;
            float _2164 = precise::clamp(_2162, 0.0, 1.0);
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2170 = fma(_2164, _2144, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2086 = _2172;
            _2120 = _2178;
            _2078 = _2170;
            _2098 = _2176;
            _2092 = _2174;
            _2110 = _2180;
            _2182 = true;
        }
        else
        {
            bool _2184 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2186 = isnan(_1486);
            bool _2188 = _2184 || _2186;
            bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2192 = _2188 || _2190;
            if (!_2192)
            {
                _2076 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2194 = _2076;
            _2078 = _2194;
            if (!_2192)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2196 = _2084;
            _2086 = _2196;
            if (!_2192)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2198 = _2090;
            _2092 = _2198;
            if (!_2192)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2200 = _2096;
            _2098 = _2200;
            if (!_2192)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2202 = _2118;
            _2120 = _2202;
            if (!_2192)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2204 = _2108;
            bool _2206 = !_2192;
            _2110 = _2204;
            if (!_2206)
            {
                bool _2208 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2210 = isnan(_1486);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2216 = _2212 || _2214;
                if (!_2216)
                {
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2220 = _1486 + _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2222;
                    float _2226 = 1.0 / _2224;
                    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2248 = _2220 * _2226;
                    float _2250 = precise::clamp(_2248, 0.0, 1.0);
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2256 = fma(_2250, _2230, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2258 = fma(_2250, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2260 = fma(_2250, _2234, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2262 = fma(_2250, _2238, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2264 = fma(_2250, _2242, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2266 = fma(_2250, _2246, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2086 = _2258;
                    _2120 = _2264;
                    _2078 = _2256;
                    _2098 = _2262;
                    _2092 = _2260;
                    _2110 = _2266;
                    _2182 = true;
                }
                else
                {
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2078 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2182 = false;
    float _2268 = _2086;
    float _2270 = _2120;
    float _2272 = _2078;
    float _2274 = _2098;
    float _2276 = _2092;
    float _2278 = _2110;
    float _2280 = fma(_1980, -0.5, 0.5);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = -_2268;
    float _2286 = _2284 + _2270;
    float _2288 = -_2272;
    float _2290 = _2288 + _2274;
    float _2292 = -_2276;
    float _2294 = _2292 + _2278;
    bool _2296 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2298 = fma(_2282, _2286, _2268);
    float _2300 = fma(_2282, _2290, _2272);
    float _2302 = fma(_2282, _2294, _2276);
    float _2304 = _2298 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2306 = fma(_2300, 0.298911988735198974609375, _2304);
    float _2308 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2310 = fma(_2302, 0.114477999508380889892578125, _2306);
    out.m_59.x = _2308;
    float _2312 = -_2310;
    float _2314 = _2300 + _2312;
    float _2316 = -_2310;
    float _2318 = _2298 + _2316;
    float _2320 = -_2310;
    float _2322 = _2302 + _2320;
    out.m_95.x = 0.0;
    float _2324 = fma(_2314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    float _2326 = fma(_2318, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    float _2328 = fma(_2322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    out.m_97.x = _2324;
    out.m_97.y = _2326;
    out.m_97.z = _2328;
    if (!_2296)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2330 = -_1165;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2334 = -_1167;
    float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2338 = -_1171;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2342 = _2332 * _2332;
    float _2344 = fma(_2336, _2336, _2342);
    float _2346 = fma(_2340, _2340, _2344);
    float _2348 = rsqrt(_2346);
    float _2350 = _2332 * _2348;
    float _2352 = _2336 * _2348;
    float _2354 = _2340 * _2348;
    float _2356 = sqrt(_2346);
    float _2358 = -_1492;
    float _2360 = _2358 + _2350;
    float _2362 = -_1488;
    float _2364 = _2362 + _2352;
    float _2366 = -_1490;
    float _2368 = _2366 + _2354;
    float _2370 = _2360 * _2360;
    float _2372 = fma(_2364, _2364, _2370);
    float _2374 = fma(_2368, _2368, _2372);
    float _2376 = -_2356;
    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = rsqrt(_2374);
    float _2382 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = abs(_2384);
    float _2388 = log2(_2386);
    float _2390 = _2360 * _2380;
    float _2392 = _2364 * _2380;
    float _2394 = _2368 * _2380;
    float _2396 = _1980 * _2390;
    float _2398 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2400 = precise::clamp(_2398, 0.0, 1.0);
    float _2402 = _1980 * _2350;
    float _2404 = fma(_1978, _2392, _2396);
    float _2406 = _2400 * _2400;
    float _2408 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2410 = fma(_1978, _2352, _2402);
    float _2412 = fma(_1986, _2394, _2404);
    float _2414 = precise::clamp(_2412, 0.0, 1.0);
    float _2416 = _2406 + (-1.0);
    float _2418 = fma(_1986, _2354, _2410);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2414 * _2414;
    float _2424 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2426 = exp2(_2408);
    float _2428 = fma(_2422, _2416, 1.0);
    float _2430 = -_2350;
    float _2432 = -_2424;
    float _2434 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2432);
    float _2436 = _2428 * _2428;
    float _2438 = -_2354;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2434);
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2444 = _2440 + _2442;
    float _2446 = 1.0 / _2436;
    float _2448 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    float _2452 = _2426 * _2450;
    float _2454 = _2420 * _2452;
    float _2456 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2458 = _2406 * _2446;
    float _2460 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2462 = _2454 * _2458;
    float _2464 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2466 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2468 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2470 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2456;
    out.m_93.y = _2460;
    out.m_93.z = _2464;
    out.m_95.x = _2466;
    out.m_95.y = _2468;
    out.m_95.z = _2470;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2182 = false;
    bool _194 = false;
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
        float _2527 = as_type<float>(_132);
        out.gl_Position.z = _2527;
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
        float _2596 = as_type<float>(_170);
        out.gl_Position.z = _2596;
    }
    if (_164)
    {
        return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_63.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_116);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = in.m_56.x;
    float _206 = in.m_56.y;
    float _208 = in.m_56.z;
    float _210 = _206 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _212 = _206 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _214 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].x, _210);
    float _216 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].x, _212);
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].z, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].z, _216);
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _224 = _220 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _228 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _230 = floor(_226);
    float _232 = floor(_228);
    float _234 = -_230;
    float _236 = _226 + _234;
    float _238 = -_232;
    float _240 = _228 + _238;
    float2 _2723 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2723, float2(0.0), isnan(_2723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2723, float2(0.0), isnan(_2723)), level(0.0)).x;
    float _244 = in.m_63.x;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = in.m_63.z;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _254;
    float _258 = in.m_63.y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _274 = _272 != 0;
    float _276 = 1.0 / _256;
    float _278 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _202 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _202 + _284;
    float _288 = _248 * _150;
    bool _290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _298 = _294 || _296;
    float _300 = 1.0 / _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _304 = 1.0 + _302;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _314 = _310 || _312;
    float _316 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    bool _318 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_202);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = exp2(_288);
    float _332 = _244 * 2.0;
    float _334 = _252 * 2.0;
    float _336 = _282 * _276;
    float _338 = _258 + _252;
    float _340 = _258 * 2.0;
    bool _342 = !_270;
    int _344 = _342 ? 0 : 1;
    float _346 = floor(_332);
    float _348 = _338 + (-1.0);
    float _350 = _286 * _300;
    float _352 = _244 + _252;
    float _354 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _356 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_202);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _352 + (-1.0);
    float _370 = floor(_334);
    float _372 = _244 + _258;
    float _374 = -_330;
    float _376 = _374 + 1.0;
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _380 = _372 + (-1.0);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = _314 ? _376 : 0.0;
    float _388 = 1.0 / _304;
    bool _390 = _346 >= 0.0;
    bool _392 = isnan(_346);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = fma(_384, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _402 = abs(_344);
    float _404 = _252 + (-0.5);
    int _406 = _398 ? 0 : 1;
    float _408 = floor(_340);
    float _410 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _412 = _370 > 0.0;
    bool _414 = _370 >= 0.0;
    bool _416 = isnan(_370);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = -_366;
    float _426 = _424 + 1.0;
    float _428 = _222;
    if (_298)
    {
        float _430 = _386 * _388;
        _154 = _430;
    }
    float _432 = _154;
    bool _434 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_202);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _446;
    bool _450 = _346 > 0.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = _328 * _426;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = fma(_448, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _464 = _408 > 0.0;
    float _466 = fma(_454, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _468 = _408 >= 0.0;
    bool _470 = isnan(_408);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = -_328;
    float _480 = _478 + 1.0;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = fma(_460, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = _316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _490 = _444 * _480;
    float _492 = fma(_484, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -_444;
    float _500 = _498 + 1.0;
    float _502 = _400 * _490;
    float _504 = _462 * _490;
    float _506 = _466 * _490;
    float _508 = _488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _502);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    float _516 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _508);
    float _518 = in.m_65.x;
    float _520 = in.m_65.y;
    float _522 = in.m_65.z;
    int _524 = ~_406;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = fma(_496, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _532 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _516);
    int _534 = _528;
    if (!_450)
    {
        int _536 = ~_406;
        int _538 = _536 + 1;
        _534 = _538;
    }
    int _540 = _534;
    float _542 = _488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _544 = float(_402);
    float _546 = _532 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _548 = float(_540);
    float _550 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _542);
    int _552 = _422 ? 0 : 1;
    float _554 = 1.0 / _546;
    float _556 = fma(_486, _456, _512);
    float _558 = _544 * _548;
    float _560 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _550);
    bool _562 = !_266;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_492, _456, _510);
    float _568 = _558 * (-2.0);
    int _570 = _476 ? 0 : 1;
    float _572 = _560 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _574 = ~_552;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_354, _568, _354);
    bool _582 = !_274;
    int _584 = _582 ? 0 : 1;
    float _586 = _258 + (-0.5);
    int _588 = _578;
    if (!_412)
    {
        int _590 = ~_552;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_568, _520, _520);
    int _598 = abs(_564);
    float _600 = _572 + _546;
    int _602 = ~_570;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_530, _456, _514);
    int _610 = abs(_584);
    float _612 = _600 * _554;
    float _614 = _612 * 0.5;
    int _616 = _606;
    if (!_464)
    {
        int _618 = ~_570;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].x, _556);
    float _626 = float(_598);
    float _628 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].z, _608);
    float _630 = float(_594);
    float _632 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[196].y, _596);
    float _634 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _636 = float(_610);
    float _638 = fma(_580, _432, _632);
    float _640 = float(_622);
    float _642 = _626 * _630;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _646 = fma(_614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _644);
    float _648 = in.m_67.x;
    float _650 = in.m_67.y;
    float _652 = in.m_67.z;
    float _654 = _638 * 0.15915493667125701904296875;
    float _656 = _642 * (-2.0);
    float _658 = _636 * _640;
    float _660 = _244 + (-0.5);
    float _662 = 1.0 / _646;
    float _664 = fma(_656, _518, _518);
    float _666 = _658 * (-2.0);
    float _668 = in.m_69.x;
    float _670 = in.m_69.y;
    float _672 = in.m_69.z;
    float _674 = fma(_410, _656, _410);
    float _676 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _664);
    float _678 = fma(_666, _522, _522);
    float _680 = fma(_378, _666, _378);
    float _682 = _654 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = fma(_674, _432, _676);
    float _688 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _690 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].y, _566);
    float _692 = _488 + _634;
    float _694 = _686 * 0.15915493667125701904296875;
    float _696 = fma(_680, _432, _688);
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _700 = _662 * _698;
    float _702 = _694 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _696 * 0.15915493667125701904296875;
    float _708 = _690 * _650;
    float _710 = _624 * _648;
    bool _712 = _700 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _714 = _628 * _652;
    bool _716 = _700 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _720 = _654 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _732 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _734 = _718 * _726;
    float _736 = _724 * _728;
    float _738 = _694 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _692 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _744 = !_712;
    int _746 = _744 ? 0 : 1;
    float _748 = _732 * _730;
    float _750 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _742);
    int _752 = 2;
    float _754 = _692;
    if (!_712)
    {
        _752 = 1;
    }
    int _756 = _752;
    float _758 = _704 * _684;
    float _760 = _706 * 6.283185482025146484375;
    float _762 = cos(_760);
    int _764 = _756;
    if (!_716)
    {
        _764 = _746;
    }
    int _766 = _764;
    float _768 = _704 * _722;
    float _770 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _750);
    float _772 = _692 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _774 = _766 << 6;
    float _776 = _770 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _778 = _706 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = _740 * _722;
    float _784 = _740 * _684;
    float _786 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    int _788 = _774 + 72;
    uint _791 = uint(int(uint(_788) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.vp_c15)._m0[int(_801)][_803];
    float _807 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _786);
    float _809 = _740 * _762;
    float _811 = _722 * _762;
    float _813 = _704 * _762;
    float _815 = _684 * _762;
    float _817 = _809 * _736;
    float _819 = _807 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _821 = trunc(_776);
    int _823 = int(_821);
    int _825 = _774 + 64;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c15)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c15)._m0[int(_837)][_839];
    float _843 = -_784;
    float _845 = fma(_780, _768, _843);
    float _847 = fma(_780, _782, _758);
    float _849 = -_768;
    float _851 = fma(_780, _784, _849);
    float _853 = -_736;
    float _855 = _780 * _853;
    float _857 = _813 * _736;
    float _859 = fma(_847, _734, _817);
    float _861 = fma(_780, _758, _782);
    int _863 = _774 + 96;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.vp_c15)._m0[int(_875)][_877];
    float _881 = fma(_811, _734, _855);
    float _883 = fma(_851, _748, _859);
    float _885 = fma(_845, _734, _857);
    float _887 = trunc(_819);
    int _889 = int(_887);
    float _891 = fma(_815, _748, _881);
    float _893 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _895 = fma(_861, _748, _885);
    int _897 = _774 + 48;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _893);
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _823 + _919;
    int _923 = _921 + 1;
    float _925 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _927 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _929 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _917);
    int _931 = _774 + 104;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    uint _935 = uint(int(uint(int(_933)) >> uint(2)));
    int _937 = int(_933) & 3;
    float _939 = (*spvDescriptorSet0.vp_c15)._m0[int(_935)][_937];
    int _941 = int(_933) + 1;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    int _945 = _941 & 3;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[int(_943)][_945];
    float _949 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _927);
    float _951 = _929 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _953 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _955 = _889 + _953;
    int _957 = _955 + 1;
    float _959 = _949 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _961 = _224 + _951;
    int _963 = _774 + 56;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = _222 + _959;
    bool _983 = _957 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _987 = _961 + _985;
    int _989 = _957 | _923;
    float _991 = _987 * _987;
    int _993 = _774 + 80;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    bool _1011 = _989 < 0;
    bool _1013 = _1011 || _983;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _981 + _1015;
    bool _1019 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1021 = _1019 || _1013;
    float _1023 = fma(_1017, _1017, _991);
    float _1025 = _692 * _841;
    float _1027 = sqrt(_1023);
    float _1029 = fma(_222, _833, _1025);
    float _1031 = _692 * _879;
    float _1033 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _925);
    int _1035 = _957;
    int _1037 = as_type<int>(_925);
    int _1039 = as_type<int>(_833);
    float _1041 = _895;
    if (!_1021)
    {
        int _1043 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1045 = _1043 + _957;
        _1035 = _1045;
    }
    int _1047 = _1035;
    float _1049 = _891;
    float _1051 = as_type<float>(_1047);
    if (!_1021)
    {
        float _1053 = floor(_819);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = fma(_222, _871, _1031);
    float _1059 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1033);
    float _1061 = fma(_224, _797, _1029);
    float _1063 = _1059;
    if (!_1021)
    {
        int _1065 = _1047 << 2;
        _1037 = _1065;
    }
    int _1067 = _1037;
    float _1069 = _692 * _913;
    float _1071 = as_type<float>(_1067);
    if (!_1021)
    {
        uint _1073 = uint(int(uint(_1047) >> uint(2)));
        _1039 = int(_1073);
    }
    int _1075 = _1039;
    float _1077 = _1061 + _805;
    bool _1079 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1081 = fma(_222, _905, _1069);
    float _1083 = fma(_224, _939, _1057);
    float _1085 = _1083 + _947;
    int _1087 = as_type<int>(_947);
    int _1089 = _1075;
    float _1091 = _1027;
    if (!_1021)
    {
        int _1093 = 12 & _1067;
        _1087 = _1093;
    }
    int _1095 = _1087;
    float _1097 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1099 = fma(_224, _971, _1081);
    float _1101 = _1097;
    if (!_1021)
    {
        int _1103 = _1075 << 4;
        int _1105 = _1103 + _1095;
        _1089 = _1105;
    }
    int _1107 = _1089;
    float _1109 = 1.0 / _1085;
    float _1111 = _488 + _1097;
    float _1113 = _1099 + _979;
    if (!_1079)
    {
        _1101 = _981;
    }
    float _1115 = _1101;
    float _1117 = _1115;
    if (!_1079)
    {
        _1071 = _961;
    }
    float _1119 = _1071;
    float _1121 = _1119;
    if (!_1079)
    {
        _1063 = _1111;
    }
    float _1123 = _1063;
    bool _1125 = !_1079;
    float _1127 = _1123;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1027 + _1131;
        float _1135 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = rsqrt(_1023);
        float _1139 = _1133 * _1129;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 + (-1.0);
        float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = fma(_1149, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = fma(_1111, _1145, _1153);
        float _1159 = _1137 * _1155;
        float _1161 = fma(_1017, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_987, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1157;
        _1117 = _1161;
        _1091 = _1133;
        _1121 = _1163;
    }
    float _1165 = _1127;
    float _1167 = _1117;
    float _1169 = _1091;
    float _1171 = _1121;
    int _1173 = _774 + 88;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    uint _1177 = uint(int(uint(int(_1175)) >> uint(2)));
    int _1179 = int(_1175) & 3;
    float _1181 = (*spvDescriptorSet0.vp_c15)._m0[int(_1177)][_1179];
    int _1183 = int(_1175) + 1;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    int _1187 = _1183 & 3;
    float _1189 = (*spvDescriptorSet0.vp_c15)._m0[int(_1185)][_1187];
    float _1191 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1193 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1195 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1197 = _1113 * _1109;
    float _1199 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1191);
    float _1201 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1193);
    float _1203 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1195);
    float _1205 = _1169;
    if (!_1021)
    {
        int _1207 = _1107 + 400;
        uint _1209 = uint(int(uint(_1207) >> uint(2)));
        uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
        int _1213 = int(_1209) & 3;
        float _1215 = (*spvDescriptorSet0.vp_c15)._m0[int(_1211)][_1213];
        _1205 = _1215;
    }
    float _1217 = _1205;
    float _1219 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1199);
    bool _1221 = _1197 >= 0.0;
    float _1223 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1201);
    float _1225 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1227 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1203);
    float _1229 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1231 = _1077 * _1109;
    bool _1233 = _1197 <= 1.0;
    bool _1235 = _1233 && _1221;
    float _1237 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1239 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1225);
    float _1241 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1245 = _1231 >= 0.0;
    bool _1247 = _1245 && _1235;
    float _1249 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1251 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1253 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1255 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1243);
    bool _1257 = _1231 <= 1.0;
    bool _1259 = _1257 && _1247;
    float _1261 = -_1251;
    float _1263 = fma(_1261, _1249, 1.0);
    float _1265 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1267 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1255);
    float _1269 = _692 * _1009;
    float _1271 = _979;
    float _1273 = _1263;
    if (!_1021)
    {
        float _1275 = floor(_776);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1267);
    float _1283 = fma(_222, _1001, _1269);
    float _1285 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1287 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1279);
    float _1289 = log2(_1263);
    if (_1259)
    {
        float _1291 = float(_766);
        _1041 = _1291;
    }
    float _1293 = _1041;
    float _1295 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1285);
    float _1297 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1287);
    float _1299 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1295);
    float _1301 = 1.0 / _1281;
    float _1303 = fma(_224, _1181, _1283);
    float _1305 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1307 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1299);
    float _1309 = _1189;
    float _1311 = _1293;
    float _1313 = _1307;
    float _1315 = _1305;
    if (!_1021)
    {
        float _1317 = -_1277;
        float _1319 = _776 + _1317;
        _1273 = _1319;
    }
    float _1321 = _1273;
    float _1323 = _1303 + _1189;
    if (!_1021)
    {
        float _1325 = -_1055;
        float _1327 = _819 + _1325;
        _1309 = _1327;
    }
    float _1329 = _1309;
    float _1331 = _1285;
    if (_1259)
    {
        float _1333 = rint(_1293);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        uint _1339 = clamp(_1337, 0u, 65535u);
        _1331 = as_type<float>(_1339);
    }
    float _1341 = _1331;
    float _1343 = _1323 * _1109;
    float _1345 = _1289 * 0.693147182464599609375;
    float _1347 = _1323;
    float _1349 = _1343;
    if (!_1021)
    {
        float _1351 = rint(_1217);
        float _1353 = precise::max(_1351, 0.0);
        uint _1355 = uint(_1353);
        uint _1357 = clamp(_1355, 0u, 65535u);
        _1347 = as_type<float>(_1357);
    }
    float _1359 = _1347;
    float _1361 = _1305 * _1301;
    float _1363 = _1307 * _1301;
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1367 = fma(_1361, 0.5, 0.5);
    float _1369 = fma(_1363, -0.5, 0.5);
    float _1371 = _1269;
    if (_1259)
    {
        float3 _4539 = float3(_1197, _1231, float(as_type<int>(_1341)));
        float3 _4543 = select(_4539, float3(0.0), isnan(_4539));
        float _1373 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4543.xy, uint(rint(_4543.z)), _1343, level(0.0));
        _1371 = _1373;
    }
    float _1375 = _1371;
    float3 _4553 = float3(_1367, _1369, _1365);
    float _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4553, float3(0.0), isnan(_4553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4553, float3(0.0), isnan(_4553)), level(0.0)).x;
    float3 _4562 = float3(_1367, _1369, _1365);
    float4 _1380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4562, float3(0.0), isnan(_4562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4562, float3(0.0), isnan(_4562)), level(0.0)).xyzw;
    float _1382 = _1380.x;
    float _1384 = _1380.y;
    float _1386 = _1380.z;
    float _1388 = _1380.w;
    float _1390 = _1345;
    if (!_1021)
    {
        float3 _4585 = float3(_1329, _1321, float(as_type<int>(_1359)));
        float3 _4587 = select(_4585, float3(0.0), isnan(_4585));
        float _1392 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4587.xy, uint(rint(_4587.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4587.xy, uint(rint(_4587.z)), level(0.0)).x;
        _1390 = _1392;
    }
    float _1394 = _1390;
    if (_1021)
    {
        _1311 = 1.0;
    }
    float _1396 = _1311;
    float _1398 = _1396;
    if (!_1021)
    {
        int _1400 = _1047 << 4;
        int _1402 = _1400 + 2048;
        uint _1404 = uint(int(uint(_1402) >> uint(2)));
        uint _1406 = uint(int(uint(int(_1404)) >> uint(2)));
        int _1408 = int(_1404) & 3;
        float _1410 = (*spvDescriptorSet0.vp_c15)._m0[int(_1406)][_1408];
        int _1412 = int(_1404) + 1;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        int _1416 = _1412 & 3;
        float _1418 = (*spvDescriptorSet0.vp_c15)._m0[int(_1414)][_1416];
        int _1420 = _1402 + 8;
        uint _1422 = uint(int(uint(_1420) >> uint(2)));
        uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
        int _1426 = int(_1422) & 3;
        float _1428 = (*spvDescriptorSet0.vp_c15)._m0[int(_1424)][_1426];
        int _1430 = int(_1422) + 1;
        uint _1432 = uint(int(uint(_1430) >> uint(2)));
        int _1434 = _1430 & 3;
        float _1436 = (*spvDescriptorSet0.vp_c15)._m0[int(_1432)][_1434];
        float _1438 = _692 * _1418;
        float _1440 = fma(_222, _1410, _1438);
        float _1442 = fma(_224, _1428, _1440);
        float _1444 = _1442 + _1436;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        float _1448 = -_1446;
        float _1450 = _1448 + _1394;
        float _1452 = fma(_1450, 500.0, 1.5);
        float _1454 = exp2(_1452);
        float _1456 = 0.0 + _1454;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        _754 = _1438;
        _1051 = as_type<float>(_1402);
        _1398 = _1458;
    }
    float _1460 = _754;
    float _1462 = _1051;
    float _1464 = _1398;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1165 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1167 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1171 + _1474;
    float _1478 = _1468 * _1468;
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = fma(_1476, _1476, _1480);
    float _1484 = rsqrt(_1482);
    float _1486 = sqrt(_1482);
    float _1488 = _1472 * _1484;
    float _1490 = _1476 * _1484;
    float _1492 = _1468 * _1484;
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 * _1496;
    float _1502 = _1498 + _1500;
    float _1504 = sqrt(_1502);
    bool _1506 = _1504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1510 = _1504 + _1508;
    float _1512 = _1197;
    float _1514 = _1510;
    float _1516 = _1462;
    float _1518 = _1494;
    float _1520 = _1498;
    float _1522 = _1500;
    if (_1506)
    {
        float _1524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1524;
    }
    float _1526 = _1512;
    if (_1506)
    {
        float _1528 = rsqrt(_1502);
        _428 = _1528;
    }
    float _1530 = _428;
    float _1532 = _1530;
    if (_1506)
    {
        float _1534 = _1510 * _1526;
        _1514 = _1534;
    }
    float _1536 = _1514;
    if (_1506)
    {
        float _1538 = _1536 * 0.15915493667125701904296875;
        _1516 = _1538;
    }
    float _1540 = _1516;
    float _1542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1544 = _1460;
    float _1546 = _1542;
    if (_1506)
    {
        float _1548 = _1540 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = precise::max(0.0, _1542);
    float _1556 = _1536;
    float _1558 = _1554;
    if (_1506)
    {
        float _1560 = _1540 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        _1556 = _1562;
    }
    float _1564 = _1556;
    float _1566 = -_1492;
    float _1568 = -_1554;
    float _1570 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1568);
    if (_1506)
    {
        float _1572 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1572;
    }
    float _1574 = _1546;
    float _1576 = _1552;
    float _1578 = _1574;
    if (_1506)
    {
        float _1580 = fma(_1552, _1574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1506)
    {
        _1578 = _1570;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (_1506)
    {
        float _1590 = _1530 * _1582;
        _1584 = _1590;
    }
    float _1592 = _1584;
    if (_1506)
    {
        float _1594 = _1564 + (-1.0);
        _1558 = _1594;
    }
    float _1596 = _1558;
    float _1598 = _1596;
    if (_1506)
    {
        float _1600 = _1494 * _1592;
        _1518 = _1600;
    }
    float _1602 = _1518;
    if (_1506)
    {
        float _1604 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1532 = _1604;
    }
    float _1606 = _1532;
    if (!_1506)
    {
        _1598 = _1496;
    }
    float _1608 = _1598;
    float _1610 = _1608;
    if (_1506)
    {
        float _1612 = _1496 * _1592;
        _1610 = _1612;
    }
    float _1614 = _1610;
    if (_1506)
    {
        float _1616 = _1602 * _1602;
        _1520 = _1616;
    }
    float _1618 = _1520;
    if (_1506)
    {
        float _1620 = fma(_1570, _1564, _1606);
        _1588 = _1620;
    }
    float _1622 = _1588;
    if (_1506)
    {
        float _1624 = _1614 * _1614;
        _1522 = _1624;
    }
    float _1626 = _1522;
    float _1628 = fma(_1622, _1622, _1618);
    float _1630 = _1628 + _1626;
    float _1632 = rsqrt(_1630);
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1636 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1634);
    float _1638 = precise::clamp(_1636, 0.0, 1.0);
    float _1640 = -_1638;
    float _1642 = _1640 + 1.0;
    float _1644 = abs(_1642);
    float _1646 = log2(_1644);
    float _1648 = _1632 * _1602;
    float _1650 = _1632 * _1622;
    float _1652 = _1632 * _1614;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1656 = -_1654;
    float _1658 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1656);
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1662 = -_1652;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1658);
    float _1666 = fma(_1664, -0.5, 0.5);
    float _1668 = exp2(_1660);
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1674 = sqrt(_1666);
    float _1676 = fma(_1670, _1672, -0.212114393711090087890625);
    float _1678 = _1650 + 1.0;
    float _1680 = fma(_1670, _1676, 1.570728778839111328125);
    float _1682 = -_1650;
    float _1684 = fma(_1668, _1678, _1682);
    float _1686 = fma(_1684, 0.5, 0.5);
    float _1688 = _1674 * 0.636619746685028076171875;
    float _1690 = -_1680;
    float _1692 = fma(_1688, _1690, 1.0);
    float2 _5053 = float2(_1692, _1686);
    float3 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5053, float2(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5053, float2(0.0), isnan(_5053)), level(0.0)).xyz;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1706 = in.m_71.x;
    float _1708 = abs(_700);
    float _1710 = log2(_1708);
    bool _1712 = _258 > 0.5;
    float _1714 = _1704 * _244;
    float _1716 = in.m_71.y;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1720 = _1718 != 0;
    float _1722 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1726 = _1724 != 0;
    float _1728 = -_242;
    float _1730 = _1728 + 1.0;
    float _1732 = trunc(_1714);
    int _1734 = int(_1732);
    bool _1736 = _244 > 0.5;
    bool _1738 = _1736 && _1720;
    float _1740 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    out.m_73.x = _1167;
    out.m_73.y = _1165;
    out.m_73.z = _1171;
    float _1742 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1740);
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1746 = _670 != 0.0;
    bool _1748 = isnan(_670);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan(0.0);
    bool _1754 = _1750 || _1752;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1762 = _668 == 0.0;
    bool _1764 = !_1754;
    bool _1766 = _1762 && _1764;
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = 0.0;
    float _1772 = _1706;
    if (_1720)
    {
        _1770 = _1706;
    }
    float _1774 = _1770;
    float _1776 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1778 = _1734 << 4;
    int _1780 = _1778 + 1712;
    float _1782 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1784 = in.m_75.x;
    float _1786 = in.m_75.y;
    float _1788 = in.m_75.z;
    bool _1790 = _672 == 0.0;
    bool _1792 = _1790 && _1766;
    uint _1794 = uint(int(uint(_1780) >> uint(2)));
    uint _1796 = uint(int(uint(int(_1794)) >> uint(2)));
    int _1798 = int(_1794) & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    int _1802 = int(_1794) + 1;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    int _1806 = _1802 & 3;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[int(_1804)][_1806];
    float _1810 = _1774;
    if (_1738)
    {
        float _1812 = -_1774;
        float _1814 = _1812 + 1.0;
        _1810 = _1814;
    }
    float _1816 = _1810;
    float _1818 = -_1716;
    float _1820 = _1818 + 1.0;
    bool _1822 = _700 <= 8000.0;
    bool _1824 = isnan(_700);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan(8000.0);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1742);
    float _1836 = _1716;
    if (_1720)
    {
        _1772 = _1816;
    }
    float _1838 = _1772;
    int _1840 = _1780 + 8;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    if (_1726)
    {
        float _1850 = _1712 ? _1820 : _1716;
        _1836 = _1850;
    }
    float _1852 = _1836;
    out.gl_Position.x = _1305;
    out.gl_Position.y = _1307;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1281;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1856 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1864 = _1856 * _1758;
    out.m_77.x = _1768;
    out.m_77.y = _1776;
    out.m_77.z = _1858;
    float _1866 = _1784;
    float _1868 = _1788;
    float _1870 = _1786;
    if (!_1792)
    {
        float _1872 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1784);
        _1866 = _1872;
    }
    float _1874 = _1866;
    if (!_1792)
    {
        float _1876 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1788);
        _1868 = _1876;
    }
    float _1878 = _1868;
    float _1880 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1792)
    {
        float _1882 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1786);
        _1870 = _1882;
    }
    float _1884 = _1870;
    float _1886 = -_780;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1880);
    float _1890 = _1854 * _1862;
    float _1892 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1894 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_79.x = _1890;
    out.m_79.y = _1864;
    float _1896 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1898 = _1808 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1900 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1902 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = exp2(_1782);
    float _1908 = -_780;
    float _1910 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1892);
    float _1912 = _1848 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1914 = -_780;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1894);
    float _1918 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1910);
    float _1920 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1922 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1900);
    float _1926 = _1918 * _1884;
    float _1928 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_81.x = _1902;
    out.m_81.y = _1904;
    out.m_81.z = _1920;
    out.m_81.w = _1860;
    float _1930 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1932 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1928);
    float _1934 = fma(_1906, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1936 = precise::clamp(_1934, 0.0, 1.0);
    float _1938 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1888);
    float _1940 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1916);
    float _1942 = _1938 * _1884;
    float _1944 = _1940 * _1884;
    float _1946 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1924);
    float _1948 = _847 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1950 = _847 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1952 = _847 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1930);
    float _1956 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1948);
    float _1958 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1950);
    float _1960 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    float _1962 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1956);
    float _1964 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1958);
    float _1966 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1960);
    float _1968 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1932);
    float _1970 = fma(_1962, _1874, _1942);
    float _1972 = fma(_1964, _1874, _1926);
    float _1974 = fma(_1966, _1874, _1944);
    float _1976 = fma(_1936, -2.0, 3.0);
    float _1978 = fma(_1946, _1878, _1970);
    float _1980 = fma(_1954, _1878, _1972);
    float _1982 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1984 = _1936 * _1936;
    float _1986 = fma(_1968, _1878, _1974);
    float _1988 = _1984 * _1976;
    float _1990 = exp2(_1982);
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1992 = -_1988;
    float _1994 = _1992 + 1.0;
    out.m_85.x = _1978;
    out.m_85.y = _1980;
    out.m_85.z = _1986;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1988);
    float _1998 = _1994;
    if (!_1259)
    {
        _1998 = 1.0;
    }
    float _2000 = _1998;
    float _2002 = _1834 + _1281;
    float _2004 = _2000;
    if (_1259)
    {
        bool _2006 = _1375 >= _1343;
        bool _2008 = isnan(_1375);
        bool _2010 = _2006 || _2008;
        bool _2012 = isnan(_1343);
        bool _2014 = _2010 || _2012;
        float _2016 = float(_2014);
        _2004 = _2016;
    }
    float _2018 = _2004;
    float _2020 = _1832 * _1996;
    bool _2022 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2024 = isnan(_1486);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2030 = _2026 || _2028;
    float _2032 = _2002 * 0.5;
    float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2036 = -_1990;
    float _2038 = _2036 + 1.0;
    float _2040 = _2018 * _1464;
    out.m_87.z = _2032;
    out.m_87.w = _1281;
    float _2042 = _1730 * _2034;
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2048 = -_2044;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2052 = _2046 * _1377;
    float _2054 = -_2046;
    float _2056 = _2054 + 1.0;
    float _2058 = _2056;
    if (!_2030)
    {
        _1313 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2060 = _1313;
    float _2062 = -_2040;
    float _2064 = fma(_2062, _2050, 1.0);
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = _1388 * _2052;
    float _2070 = _1388 * _2056;
    float _2072 = _2066;
    float _2074 = _2068;
    float _2076 = _2060;
    float _2078 = _2060;
    if (!_2030)
    {
        _1315 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2080 = _1315;
    float _2082 = _2066 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2084 = _2080;
    float _2086 = _2080;
    if (!_2030)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2088 = _1349;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2030)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2094 = _2058;
    out.m_89.x = _2082;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2030)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2100 = _2072;
    float _2102 = _1702 * _2052;
    float _2104 = fma(_1698, _2068, _1382);
    float _2106 = fma(_1700, _2068, _1384);
    float _2108 = _2100;
    float _2110 = _2100;
    if (!_2030)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2112 = _2074;
    float _2114 = fma(_1388, _2102, _1386);
    out.m_91.x = _2104;
    out.m_91.y = _2106;
    out.m_91.z = _2114;
    out.m_91.w = _2070;
    bool _2116 = !_2030;
    float _2118 = _2112;
    float _2120 = _2112;
    if (!_2116)
    {
        bool _2122 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1486);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1486 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = 1.0 / _2138;
            float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2162 = _2134 * _2140;
            float _2164 = precise::clamp(_2162, 0.0, 1.0);
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2170 = fma(_2164, _2144, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2086 = _2172;
            _2120 = _2178;
            _2078 = _2170;
            _2098 = _2176;
            _2092 = _2174;
            _2110 = _2180;
            _2182 = true;
        }
        else
        {
            bool _2184 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2186 = isnan(_1486);
            bool _2188 = _2184 || _2186;
            bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2192 = _2188 || _2190;
            if (!_2192)
            {
                _2076 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2194 = _2076;
            _2078 = _2194;
            if (!_2192)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2196 = _2084;
            _2086 = _2196;
            if (!_2192)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2198 = _2090;
            _2092 = _2198;
            if (!_2192)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2200 = _2096;
            _2098 = _2200;
            if (!_2192)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2202 = _2118;
            _2120 = _2202;
            if (!_2192)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2204 = _2108;
            bool _2206 = !_2192;
            _2110 = _2204;
            if (!_2206)
            {
                bool _2208 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2210 = isnan(_1486);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2216 = _2212 || _2214;
                if (!_2216)
                {
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2220 = _1486 + _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2222;
                    float _2226 = 1.0 / _2224;
                    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2248 = _2220 * _2226;
                    float _2250 = precise::clamp(_2248, 0.0, 1.0);
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2256 = fma(_2250, _2230, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2258 = fma(_2250, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2260 = fma(_2250, _2234, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2262 = fma(_2250, _2238, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2264 = fma(_2250, _2242, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2266 = fma(_2250, _2246, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2086 = _2258;
                    _2120 = _2264;
                    _2078 = _2256;
                    _2098 = _2262;
                    _2092 = _2260;
                    _2110 = _2266;
                    _2182 = true;
                }
                else
                {
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2078 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2182 = false;
    float _2268 = _2086;
    float _2270 = _2120;
    float _2272 = _2078;
    float _2274 = _2098;
    float _2276 = _2092;
    float _2278 = _2110;
    float _2280 = fma(_1980, -0.5, 0.5);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = -_2268;
    float _2286 = _2284 + _2270;
    float _2288 = -_2272;
    float _2290 = _2288 + _2274;
    float _2292 = -_2276;
    float _2294 = _2292 + _2278;
    bool _2296 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2298 = fma(_2282, _2286, _2268);
    float _2300 = fma(_2282, _2290, _2272);
    float _2302 = fma(_2282, _2294, _2276);
    float _2304 = _2298 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2306 = fma(_2300, 0.298911988735198974609375, _2304);
    float _2308 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2310 = fma(_2302, 0.114477999508380889892578125, _2306);
    out.m_59.x = _2308;
    float _2312 = -_2310;
    float _2314 = _2300 + _2312;
    float _2316 = -_2310;
    float _2318 = _2298 + _2316;
    float _2320 = -_2310;
    float _2322 = _2302 + _2320;
    out.m_95.x = 0.0;
    float _2324 = fma(_2314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    float _2326 = fma(_2318, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    float _2328 = fma(_2322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    out.m_97.x = _2324;
    out.m_97.y = _2326;
    out.m_97.z = _2328;
    if (!_2296)
    {
        return out;
    }
    float _2330 = -_1165;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2334 = -_1167;
    float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2338 = -_1171;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2342 = _2332 * _2332;
    float _2344 = fma(_2336, _2336, _2342);
    float _2346 = fma(_2340, _2340, _2344);
    float _2348 = rsqrt(_2346);
    float _2350 = _2332 * _2348;
    float _2352 = _2336 * _2348;
    float _2354 = _2340 * _2348;
    float _2356 = sqrt(_2346);
    float _2358 = -_1492;
    float _2360 = _2358 + _2350;
    float _2362 = -_1488;
    float _2364 = _2362 + _2352;
    float _2366 = -_1490;
    float _2368 = _2366 + _2354;
    float _2370 = _2360 * _2360;
    float _2372 = fma(_2364, _2364, _2370);
    float _2374 = fma(_2368, _2368, _2372);
    float _2376 = -_2356;
    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = rsqrt(_2374);
    float _2382 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = abs(_2384);
    float _2388 = log2(_2386);
    float _2390 = _2360 * _2380;
    float _2392 = _2364 * _2380;
    float _2394 = _2368 * _2380;
    float _2396 = _1980 * _2390;
    float _2398 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2400 = precise::clamp(_2398, 0.0, 1.0);
    float _2402 = _1980 * _2350;
    float _2404 = fma(_1978, _2392, _2396);
    float _2406 = _2400 * _2400;
    float _2408 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2410 = fma(_1978, _2352, _2402);
    float _2412 = fma(_1986, _2394, _2404);
    float _2414 = precise::clamp(_2412, 0.0, 1.0);
    float _2416 = _2406 + (-1.0);
    float _2418 = fma(_1986, _2354, _2410);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2414 * _2414;
    float _2424 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2426 = exp2(_2408);
    float _2428 = fma(_2422, _2416, 1.0);
    float _2430 = -_2350;
    float _2432 = -_2424;
    float _2434 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2432);
    float _2436 = _2428 * _2428;
    float _2438 = -_2354;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2434);
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2444 = _2440 + _2442;
    float _2446 = 1.0 / _2436;
    float _2448 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    float _2452 = _2426 * _2450;
    float _2454 = _2420 * _2452;
    float _2456 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2458 = _2406 * _2446;
    float _2460 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2462 = _2454 * _2458;
    float _2464 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2466 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2468 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2470 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2456;
    out.m_93.y = _2460;
    out.m_93.z = _2464;
    out.m_95.x = _2466;
    out.m_95.y = _2468;
    out.m_95.z = _2470;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2182 = false;
    bool _194 = false;
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
        float _2527 = as_type<float>(_132);
        out.gl_Position.z = _2527;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2596 = as_type<float>(_170);
        out.gl_Position.z = _2596;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_63.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_116);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = in.m_56.x;
    float _206 = in.m_56.y;
    float _208 = in.m_56.z;
    float _210 = _206 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _212 = _206 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _214 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].x, _210);
    float _216 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].x, _212);
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].z, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].z, _216);
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _224 = _220 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _228 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _230 = floor(_226);
    float _232 = floor(_228);
    float _234 = -_230;
    float _236 = _226 + _234;
    float _238 = -_232;
    float _240 = _228 + _238;
    float2 _2723 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2723, float2(0.0), isnan(_2723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2723, float2(0.0), isnan(_2723)), level(0.0)).x;
    float _244 = in.m_63.x;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = in.m_63.z;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _254;
    float _258 = in.m_63.y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _274 = _272 != 0;
    float _276 = 1.0 / _256;
    float _278 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _202 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _202 + _284;
    float _288 = _248 * _150;
    bool _290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _298 = _294 || _296;
    float _300 = 1.0 / _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _304 = 1.0 + _302;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _314 = _310 || _312;
    float _316 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _278);
    bool _318 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_202);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = exp2(_288);
    float _332 = _244 * 2.0;
    float _334 = _252 * 2.0;
    float _336 = _282 * _276;
    float _338 = _258 + _252;
    float _340 = _258 * 2.0;
    bool _342 = !_270;
    int _344 = _342 ? 0 : 1;
    float _346 = floor(_332);
    float _348 = _338 + (-1.0);
    float _350 = _286 * _300;
    float _352 = _244 + _252;
    float _354 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _356 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_202);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _352 + (-1.0);
    float _370 = floor(_334);
    float _372 = _244 + _258;
    float _374 = -_330;
    float _376 = _374 + 1.0;
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _380 = _372 + (-1.0);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = _314 ? _376 : 0.0;
    float _388 = 1.0 / _304;
    bool _390 = _346 >= 0.0;
    bool _392 = isnan(_346);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = fma(_384, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _402 = abs(_344);
    float _404 = _252 + (-0.5);
    int _406 = _398 ? 0 : 1;
    float _408 = floor(_340);
    float _410 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _412 = _370 > 0.0;
    bool _414 = _370 >= 0.0;
    bool _416 = isnan(_370);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = -_366;
    float _426 = _424 + 1.0;
    float _428 = _222;
    if (_298)
    {
        float _430 = _386 * _388;
        _154 = _430;
    }
    float _432 = _154;
    bool _434 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_202);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _446;
    bool _450 = _346 > 0.0;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = _328 * _426;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = fma(_448, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _464 = _408 > 0.0;
    float _466 = fma(_454, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _468 = _408 >= 0.0;
    bool _470 = isnan(_408);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = -_328;
    float _480 = _478 + 1.0;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = fma(_460, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = _316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _490 = _444 * _480;
    float _492 = fma(_484, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = -_444;
    float _500 = _498 + 1.0;
    float _502 = _400 * _490;
    float _504 = _462 * _490;
    float _506 = _466 * _490;
    float _508 = _488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _510 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].y, _502);
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].x, _504);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[143].z, _506);
    float _516 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _508);
    float _518 = in.m_65.x;
    float _520 = in.m_65.y;
    float _522 = in.m_65.z;
    int _524 = ~_406;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = fma(_496, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _532 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _516);
    int _534 = _528;
    if (!_450)
    {
        int _536 = ~_406;
        int _538 = _536 + 1;
        _534 = _538;
    }
    int _540 = _534;
    float _542 = _488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _544 = float(_402);
    float _546 = _532 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _548 = float(_540);
    float _550 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _542);
    int _552 = _422 ? 0 : 1;
    float _554 = 1.0 / _546;
    float _556 = fma(_486, _456, _512);
    float _558 = _544 * _548;
    float _560 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _550);
    bool _562 = !_266;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_492, _456, _510);
    float _568 = _558 * (-2.0);
    int _570 = _476 ? 0 : 1;
    float _572 = _560 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _574 = ~_552;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_354, _568, _354);
    bool _582 = !_274;
    int _584 = _582 ? 0 : 1;
    float _586 = _258 + (-0.5);
    int _588 = _578;
    if (!_412)
    {
        int _590 = ~_552;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_568, _520, _520);
    int _598 = abs(_564);
    float _600 = _572 + _546;
    int _602 = ~_570;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = fma(_530, _456, _514);
    int _610 = abs(_584);
    float _612 = _600 * _554;
    float _614 = _612 * 0.5;
    int _616 = _606;
    if (!_464)
    {
        int _618 = ~_570;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].x, _556);
    float _626 = float(_598);
    float _628 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].z, _608);
    float _630 = float(_594);
    float _632 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[196].y, _596);
    float _634 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _636 = float(_610);
    float _638 = fma(_580, _432, _632);
    float _640 = float(_622);
    float _642 = _626 * _630;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _646 = fma(_614, (*spvDescriptorSet0.vp_c8)._m0[30].w, _644);
    float _648 = in.m_67.x;
    float _650 = in.m_67.y;
    float _652 = in.m_67.z;
    float _654 = _638 * 0.15915493667125701904296875;
    float _656 = _642 * (-2.0);
    float _658 = _636 * _640;
    float _660 = _244 + (-0.5);
    float _662 = 1.0 / _646;
    float _664 = fma(_656, _518, _518);
    float _666 = _658 * (-2.0);
    float _668 = in.m_69.x;
    float _670 = in.m_69.y;
    float _672 = in.m_69.z;
    float _674 = fma(_410, _656, _410);
    float _676 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _664);
    float _678 = fma(_666, _522, _522);
    float _680 = fma(_378, _666, _378);
    float _682 = _654 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = fma(_674, _432, _676);
    float _688 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _690 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[145].y, _566);
    float _692 = _488 + _634;
    float _694 = _686 * 0.15915493667125701904296875;
    float _696 = fma(_680, _432, _688);
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _700 = _662 * _698;
    float _702 = _694 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _696 * 0.15915493667125701904296875;
    float _708 = _690 * _650;
    float _710 = _624 * _648;
    bool _712 = _700 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _714 = _628 * _652;
    bool _716 = _700 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _720 = _654 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _732 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _734 = _718 * _726;
    float _736 = _724 * _728;
    float _738 = _694 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _692 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _744 = !_712;
    int _746 = _744 ? 0 : 1;
    float _748 = _732 * _730;
    float _750 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _742);
    int _752 = 2;
    float _754 = _692;
    if (!_712)
    {
        _752 = 1;
    }
    int _756 = _752;
    float _758 = _704 * _684;
    float _760 = _706 * 6.283185482025146484375;
    float _762 = cos(_760);
    int _764 = _756;
    if (!_716)
    {
        _764 = _746;
    }
    int _766 = _764;
    float _768 = _704 * _722;
    float _770 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _750);
    float _772 = _692 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _774 = _766 << 6;
    float _776 = _770 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _778 = _706 * 6.283185482025146484375;
    float _780 = sin(_778);
    float _782 = _740 * _722;
    float _784 = _740 * _684;
    float _786 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    int _788 = _774 + 72;
    uint _791 = uint(int(uint(_788) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.vp_c15)._m0[int(_793)][_795];
    int _799 = int(_791) + 1;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    int _803 = _799 & 3;
    float _805 = (*spvDescriptorSet0.vp_c15)._m0[int(_801)][_803];
    float _807 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _786);
    float _809 = _740 * _762;
    float _811 = _722 * _762;
    float _813 = _704 * _762;
    float _815 = _684 * _762;
    float _817 = _809 * _736;
    float _819 = _807 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _821 = trunc(_776);
    int _823 = int(_821);
    int _825 = _774 + 64;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c15)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c15)._m0[int(_837)][_839];
    float _843 = -_784;
    float _845 = fma(_780, _768, _843);
    float _847 = fma(_780, _782, _758);
    float _849 = -_768;
    float _851 = fma(_780, _784, _849);
    float _853 = -_736;
    float _855 = _780 * _853;
    float _857 = _813 * _736;
    float _859 = fma(_847, _734, _817);
    float _861 = fma(_780, _758, _782);
    int _863 = _774 + 96;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.vp_c15)._m0[int(_875)][_877];
    float _881 = fma(_811, _734, _855);
    float _883 = fma(_851, _748, _859);
    float _885 = fma(_845, _734, _857);
    float _887 = trunc(_819);
    int _889 = int(_887);
    float _891 = fma(_815, _748, _881);
    float _893 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _895 = fma(_861, _748, _885);
    int _897 = _774 + 48;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    uint _901 = uint(int(uint(int(_899)) >> uint(2)));
    int _903 = int(_899) & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    int _907 = int(_899) + 1;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    int _911 = _907 & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    float _915 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _893);
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _823 + _919;
    int _923 = _921 + 1;
    float _925 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _927 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _929 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _917);
    int _931 = _774 + 104;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    uint _935 = uint(int(uint(int(_933)) >> uint(2)));
    int _937 = int(_933) & 3;
    float _939 = (*spvDescriptorSet0.vp_c15)._m0[int(_935)][_937];
    int _941 = int(_933) + 1;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    int _945 = _941 & 3;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[int(_943)][_945];
    float _949 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _927);
    float _951 = _929 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _953 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _955 = _889 + _953;
    int _957 = _955 + 1;
    float _959 = _949 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _961 = _224 + _951;
    int _963 = _774 + 56;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    float _981 = _222 + _959;
    bool _983 = _957 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _987 = _961 + _985;
    int _989 = _957 | _923;
    float _991 = _987 * _987;
    int _993 = _774 + 80;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    bool _1011 = _989 < 0;
    bool _1013 = _1011 || _983;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _981 + _1015;
    bool _1019 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1021 = _1019 || _1013;
    float _1023 = fma(_1017, _1017, _991);
    float _1025 = _692 * _841;
    float _1027 = sqrt(_1023);
    float _1029 = fma(_222, _833, _1025);
    float _1031 = _692 * _879;
    float _1033 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _925);
    int _1035 = _957;
    int _1037 = as_type<int>(_925);
    int _1039 = as_type<int>(_833);
    float _1041 = _895;
    if (!_1021)
    {
        int _1043 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1045 = _1043 + _957;
        _1035 = _1045;
    }
    int _1047 = _1035;
    float _1049 = _891;
    float _1051 = as_type<float>(_1047);
    if (!_1021)
    {
        float _1053 = floor(_819);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = fma(_222, _871, _1031);
    float _1059 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1033);
    float _1061 = fma(_224, _797, _1029);
    float _1063 = _1059;
    if (!_1021)
    {
        int _1065 = _1047 << 2;
        _1037 = _1065;
    }
    int _1067 = _1037;
    float _1069 = _692 * _913;
    float _1071 = as_type<float>(_1067);
    if (!_1021)
    {
        uint _1073 = uint(int(uint(_1047) >> uint(2)));
        _1039 = int(_1073);
    }
    int _1075 = _1039;
    float _1077 = _1061 + _805;
    bool _1079 = _1027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1081 = fma(_222, _905, _1069);
    float _1083 = fma(_224, _939, _1057);
    float _1085 = _1083 + _947;
    int _1087 = as_type<int>(_947);
    int _1089 = _1075;
    float _1091 = _1027;
    if (!_1021)
    {
        int _1093 = 12 & _1067;
        _1087 = _1093;
    }
    int _1095 = _1087;
    float _1097 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1099 = fma(_224, _971, _1081);
    float _1101 = _1097;
    if (!_1021)
    {
        int _1103 = _1075 << 4;
        int _1105 = _1103 + _1095;
        _1089 = _1105;
    }
    int _1107 = _1089;
    float _1109 = 1.0 / _1085;
    float _1111 = _488 + _1097;
    float _1113 = _1099 + _979;
    if (!_1079)
    {
        _1101 = _981;
    }
    float _1115 = _1101;
    float _1117 = _1115;
    if (!_1079)
    {
        _1071 = _961;
    }
    float _1119 = _1071;
    float _1121 = _1119;
    if (!_1079)
    {
        _1063 = _1111;
    }
    float _1123 = _1063;
    bool _1125 = !_1079;
    float _1127 = _1123;
    if (!_1125)
    {
        float _1129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1133 = _1027 + _1131;
        float _1135 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = rsqrt(_1023);
        float _1139 = _1133 * _1129;
        float _1141 = _1139 * 0.15915493667125701904296875;
        float _1143 = _1141 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 6.283185482025146484375;
        float _1149 = sin(_1147);
        float _1151 = _1145 + (-1.0);
        float _1153 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = fma(_1149, _1135, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1157 = fma(_1111, _1145, _1153);
        float _1159 = _1137 * _1155;
        float _1161 = fma(_1017, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1163 = fma(_987, _1159, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1157;
        _1117 = _1161;
        _1091 = _1133;
        _1121 = _1163;
    }
    float _1165 = _1127;
    float _1167 = _1117;
    float _1169 = _1091;
    float _1171 = _1121;
    int _1173 = _774 + 88;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    uint _1177 = uint(int(uint(int(_1175)) >> uint(2)));
    int _1179 = int(_1175) & 3;
    float _1181 = (*spvDescriptorSet0.vp_c15)._m0[int(_1177)][_1179];
    int _1183 = int(_1175) + 1;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    int _1187 = _1183 & 3;
    float _1189 = (*spvDescriptorSet0.vp_c15)._m0[int(_1185)][_1187];
    float _1191 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1193 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1195 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1197 = _1113 * _1109;
    float _1199 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1191);
    float _1201 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1193);
    float _1203 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1195);
    float _1205 = _1169;
    if (!_1021)
    {
        int _1207 = _1107 + 400;
        uint _1209 = uint(int(uint(_1207) >> uint(2)));
        uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
        int _1213 = int(_1209) & 3;
        float _1215 = (*spvDescriptorSet0.vp_c15)._m0[int(_1211)][_1213];
        _1205 = _1215;
    }
    float _1217 = _1205;
    float _1219 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1199);
    bool _1221 = _1197 >= 0.0;
    float _1223 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1201);
    float _1225 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1227 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1203);
    float _1229 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1231 = _1077 * _1109;
    bool _1233 = _1197 <= 1.0;
    bool _1235 = _1233 && _1221;
    float _1237 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1239 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1225);
    float _1241 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1243 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1245 = _1231 >= 0.0;
    bool _1247 = _1245 && _1235;
    float _1249 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1251 = _1237 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1253 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1239);
    float _1255 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1243);
    bool _1257 = _1231 <= 1.0;
    bool _1259 = _1257 && _1247;
    float _1261 = -_1251;
    float _1263 = fma(_1261, _1249, 1.0);
    float _1265 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1267 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1255);
    float _1269 = _692 * _1009;
    float _1271 = _979;
    float _1273 = _1263;
    if (!_1021)
    {
        float _1275 = floor(_776);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1267);
    float _1283 = fma(_222, _1001, _1269);
    float _1285 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1287 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1279);
    float _1289 = log2(_1263);
    if (_1259)
    {
        float _1291 = float(_766);
        _1041 = _1291;
    }
    float _1293 = _1041;
    float _1295 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1285);
    float _1297 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1287);
    float _1299 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1295);
    float _1301 = 1.0 / _1281;
    float _1303 = fma(_224, _1181, _1283);
    float _1305 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1307 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1299);
    float _1309 = _1189;
    float _1311 = _1293;
    float _1313 = _1307;
    float _1315 = _1305;
    if (!_1021)
    {
        float _1317 = -_1277;
        float _1319 = _776 + _1317;
        _1273 = _1319;
    }
    float _1321 = _1273;
    float _1323 = _1303 + _1189;
    if (!_1021)
    {
        float _1325 = -_1055;
        float _1327 = _819 + _1325;
        _1309 = _1327;
    }
    float _1329 = _1309;
    float _1331 = _1285;
    if (_1259)
    {
        float _1333 = rint(_1293);
        float _1335 = precise::max(_1333, 0.0);
        uint _1337 = uint(_1335);
        uint _1339 = clamp(_1337, 0u, 65535u);
        _1331 = as_type<float>(_1339);
    }
    float _1341 = _1331;
    float _1343 = _1323 * _1109;
    float _1345 = _1289 * 0.693147182464599609375;
    float _1347 = _1323;
    float _1349 = _1343;
    if (!_1021)
    {
        float _1351 = rint(_1217);
        float _1353 = precise::max(_1351, 0.0);
        uint _1355 = uint(_1353);
        uint _1357 = clamp(_1355, 0u, 65535u);
        _1347 = as_type<float>(_1357);
    }
    float _1359 = _1347;
    float _1361 = _1305 * _1301;
    float _1363 = _1307 * _1301;
    float _1365 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1367 = fma(_1361, 0.5, 0.5);
    float _1369 = fma(_1363, -0.5, 0.5);
    float _1371 = _1269;
    if (_1259)
    {
        float3 _4539 = float3(_1197, _1231, float(as_type<int>(_1341)));
        float3 _4543 = select(_4539, float3(0.0), isnan(_4539));
        float _1373 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4543.xy, uint(rint(_4543.z)), _1343, level(0.0));
        _1371 = _1373;
    }
    float _1375 = _1371;
    float3 _4553 = float3(_1367, _1369, _1365);
    float _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4553, float3(0.0), isnan(_4553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4553, float3(0.0), isnan(_4553)), level(0.0)).x;
    float3 _4562 = float3(_1367, _1369, _1365);
    float4 _1380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4562, float3(0.0), isnan(_4562)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4562, float3(0.0), isnan(_4562)), level(0.0)).xyzw;
    float _1382 = _1380.x;
    float _1384 = _1380.y;
    float _1386 = _1380.z;
    float _1388 = _1380.w;
    float _1390 = _1345;
    if (!_1021)
    {
        float3 _4585 = float3(_1329, _1321, float(as_type<int>(_1359)));
        float3 _4587 = select(_4585, float3(0.0), isnan(_4585));
        float _1392 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4587.xy, uint(rint(_4587.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4587.xy, uint(rint(_4587.z)), level(0.0)).x;
        _1390 = _1392;
    }
    float _1394 = _1390;
    if (_1021)
    {
        _1311 = 1.0;
    }
    float _1396 = _1311;
    float _1398 = _1396;
    if (!_1021)
    {
        int _1400 = _1047 << 4;
        int _1402 = _1400 + 2048;
        uint _1404 = uint(int(uint(_1402) >> uint(2)));
        uint _1406 = uint(int(uint(int(_1404)) >> uint(2)));
        int _1408 = int(_1404) & 3;
        float _1410 = (*spvDescriptorSet0.vp_c15)._m0[int(_1406)][_1408];
        int _1412 = int(_1404) + 1;
        uint _1414 = uint(int(uint(_1412) >> uint(2)));
        int _1416 = _1412 & 3;
        float _1418 = (*spvDescriptorSet0.vp_c15)._m0[int(_1414)][_1416];
        int _1420 = _1402 + 8;
        uint _1422 = uint(int(uint(_1420) >> uint(2)));
        uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
        int _1426 = int(_1422) & 3;
        float _1428 = (*spvDescriptorSet0.vp_c15)._m0[int(_1424)][_1426];
        int _1430 = int(_1422) + 1;
        uint _1432 = uint(int(uint(_1430) >> uint(2)));
        int _1434 = _1430 & 3;
        float _1436 = (*spvDescriptorSet0.vp_c15)._m0[int(_1432)][_1434];
        float _1438 = _692 * _1418;
        float _1440 = fma(_222, _1410, _1438);
        float _1442 = fma(_224, _1428, _1440);
        float _1444 = _1442 + _1436;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        float _1448 = -_1446;
        float _1450 = _1448 + _1394;
        float _1452 = fma(_1450, 500.0, 1.5);
        float _1454 = exp2(_1452);
        float _1456 = 0.0 + _1454;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        _754 = _1438;
        _1051 = as_type<float>(_1402);
        _1398 = _1458;
    }
    float _1460 = _754;
    float _1462 = _1051;
    float _1464 = _1398;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = _1165 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = _1167 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1171 + _1474;
    float _1478 = _1468 * _1468;
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = fma(_1476, _1476, _1480);
    float _1484 = rsqrt(_1482);
    float _1486 = sqrt(_1482);
    float _1488 = _1472 * _1484;
    float _1490 = _1476 * _1484;
    float _1492 = _1468 * _1484;
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1498 = _1494 * _1494;
    float _1500 = _1496 * _1496;
    float _1502 = _1498 + _1500;
    float _1504 = sqrt(_1502);
    bool _1506 = _1504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1510 = _1504 + _1508;
    float _1512 = _1197;
    float _1514 = _1510;
    float _1516 = _1462;
    float _1518 = _1494;
    float _1520 = _1498;
    float _1522 = _1500;
    if (_1506)
    {
        float _1524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1512 = _1524;
    }
    float _1526 = _1512;
    if (_1506)
    {
        float _1528 = rsqrt(_1502);
        _428 = _1528;
    }
    float _1530 = _428;
    float _1532 = _1530;
    if (_1506)
    {
        float _1534 = _1510 * _1526;
        _1514 = _1534;
    }
    float _1536 = _1514;
    if (_1506)
    {
        float _1538 = _1536 * 0.15915493667125701904296875;
        _1516 = _1538;
    }
    float _1540 = _1516;
    float _1542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1544 = _1460;
    float _1546 = _1542;
    if (_1506)
    {
        float _1548 = _1540 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = precise::max(0.0, _1542);
    float _1556 = _1536;
    float _1558 = _1554;
    if (_1506)
    {
        float _1560 = _1540 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        _1556 = _1562;
    }
    float _1564 = _1556;
    float _1566 = -_1492;
    float _1568 = -_1554;
    float _1570 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1568);
    if (_1506)
    {
        float _1572 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1572;
    }
    float _1574 = _1546;
    float _1576 = _1552;
    float _1578 = _1574;
    if (_1506)
    {
        float _1580 = fma(_1552, _1574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1576 = _1580;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1506)
    {
        _1578 = _1570;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (_1506)
    {
        float _1590 = _1530 * _1582;
        _1584 = _1590;
    }
    float _1592 = _1584;
    if (_1506)
    {
        float _1594 = _1564 + (-1.0);
        _1558 = _1594;
    }
    float _1596 = _1558;
    float _1598 = _1596;
    if (_1506)
    {
        float _1600 = _1494 * _1592;
        _1518 = _1600;
    }
    float _1602 = _1518;
    if (_1506)
    {
        float _1604 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1532 = _1604;
    }
    float _1606 = _1532;
    if (!_1506)
    {
        _1598 = _1496;
    }
    float _1608 = _1598;
    float _1610 = _1608;
    if (_1506)
    {
        float _1612 = _1496 * _1592;
        _1610 = _1612;
    }
    float _1614 = _1610;
    if (_1506)
    {
        float _1616 = _1602 * _1602;
        _1520 = _1616;
    }
    float _1618 = _1520;
    if (_1506)
    {
        float _1620 = fma(_1570, _1564, _1606);
        _1588 = _1620;
    }
    float _1622 = _1588;
    if (_1506)
    {
        float _1624 = _1614 * _1614;
        _1522 = _1624;
    }
    float _1626 = _1522;
    float _1628 = fma(_1622, _1622, _1618);
    float _1630 = _1628 + _1626;
    float _1632 = rsqrt(_1630);
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1636 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1634);
    float _1638 = precise::clamp(_1636, 0.0, 1.0);
    float _1640 = -_1638;
    float _1642 = _1640 + 1.0;
    float _1644 = abs(_1642);
    float _1646 = log2(_1644);
    float _1648 = _1632 * _1602;
    float _1650 = _1632 * _1622;
    float _1652 = _1632 * _1614;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1656 = -_1654;
    float _1658 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1656);
    float _1660 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1662 = -_1652;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1658);
    float _1666 = fma(_1664, -0.5, 0.5);
    float _1668 = exp2(_1660);
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1674 = sqrt(_1666);
    float _1676 = fma(_1670, _1672, -0.212114393711090087890625);
    float _1678 = _1650 + 1.0;
    float _1680 = fma(_1670, _1676, 1.570728778839111328125);
    float _1682 = -_1650;
    float _1684 = fma(_1668, _1678, _1682);
    float _1686 = fma(_1684, 0.5, 0.5);
    float _1688 = _1674 * 0.636619746685028076171875;
    float _1690 = -_1680;
    float _1692 = fma(_1688, _1690, 1.0);
    float2 _5053 = float2(_1692, _1686);
    float3 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5053, float2(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5053, float2(0.0), isnan(_5053)), level(0.0)).xyz;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1706 = in.m_71.x;
    float _1708 = abs(_700);
    float _1710 = log2(_1708);
    bool _1712 = _258 > 0.5;
    float _1714 = _1704 * _244;
    float _1716 = in.m_71.y;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1720 = _1718 != 0;
    float _1722 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1726 = _1724 != 0;
    float _1728 = -_242;
    float _1730 = _1728 + 1.0;
    float _1732 = trunc(_1714);
    int _1734 = int(_1732);
    bool _1736 = _244 > 0.5;
    bool _1738 = _1736 && _1720;
    float _1740 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    out.m_73.x = _1167;
    out.m_73.y = _1165;
    out.m_73.z = _1171;
    float _1742 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1740);
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1746 = _670 != 0.0;
    bool _1748 = isnan(_670);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan(0.0);
    bool _1754 = _1750 || _1752;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1762 = _668 == 0.0;
    bool _1764 = !_1754;
    bool _1766 = _1762 && _1764;
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = 0.0;
    float _1772 = _1706;
    if (_1720)
    {
        _1770 = _1706;
    }
    float _1774 = _1770;
    float _1776 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1778 = _1734 << 4;
    int _1780 = _1778 + 1712;
    float _1782 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1784 = in.m_75.x;
    float _1786 = in.m_75.y;
    float _1788 = in.m_75.z;
    bool _1790 = _672 == 0.0;
    bool _1792 = _1790 && _1766;
    uint _1794 = uint(int(uint(_1780) >> uint(2)));
    uint _1796 = uint(int(uint(int(_1794)) >> uint(2)));
    int _1798 = int(_1794) & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    int _1802 = int(_1794) + 1;
    uint _1804 = uint(int(uint(_1802) >> uint(2)));
    int _1806 = _1802 & 3;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[int(_1804)][_1806];
    float _1810 = _1774;
    if (_1738)
    {
        float _1812 = -_1774;
        float _1814 = _1812 + 1.0;
        _1810 = _1814;
    }
    float _1816 = _1810;
    float _1818 = -_1716;
    float _1820 = _1818 + 1.0;
    bool _1822 = _700 <= 8000.0;
    bool _1824 = isnan(_700);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan(8000.0);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1742);
    float _1836 = _1716;
    if (_1720)
    {
        _1772 = _1816;
    }
    float _1838 = _1772;
    int _1840 = _1780 + 8;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    if (_1726)
    {
        float _1850 = _1712 ? _1820 : _1716;
        _1836 = _1850;
    }
    float _1852 = _1836;
    out.gl_Position.x = _1305;
    out.gl_Position.y = _1307;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1281;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1856 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1858 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1864 = _1856 * _1758;
    out.m_77.x = _1768;
    out.m_77.y = _1776;
    out.m_77.z = _1858;
    float _1866 = _1784;
    float _1868 = _1788;
    float _1870 = _1786;
    if (!_1792)
    {
        float _1872 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1784);
        _1866 = _1872;
    }
    float _1874 = _1866;
    if (!_1792)
    {
        float _1876 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1788);
        _1868 = _1876;
    }
    float _1878 = _1868;
    float _1880 = _809 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1792)
    {
        float _1882 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1786);
        _1870 = _1882;
    }
    float _1884 = _1870;
    float _1886 = -_780;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1880);
    float _1890 = _1854 * _1862;
    float _1892 = _809 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1894 = _809 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_79.x = _1890;
    out.m_79.y = _1864;
    float _1896 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1898 = _1808 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1900 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1902 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = exp2(_1782);
    float _1908 = -_780;
    float _1910 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1892);
    float _1912 = _1848 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1914 = -_780;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1894);
    float _1918 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1910);
    float _1920 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1922 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1900);
    float _1926 = _1918 * _1884;
    float _1928 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_81.x = _1902;
    out.m_81.y = _1904;
    out.m_81.z = _1920;
    out.m_81.w = _1860;
    float _1930 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    float _1932 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1928);
    float _1934 = fma(_1906, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1936 = precise::clamp(_1934, 0.0, 1.0);
    float _1938 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1888);
    float _1940 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1916);
    float _1942 = _1938 * _1884;
    float _1944 = _1940 * _1884;
    float _1946 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1924);
    float _1948 = _847 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1950 = _847 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1952 = _847 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1954 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1930);
    float _1956 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1948);
    float _1958 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1950);
    float _1960 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1952);
    float _1962 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1956);
    float _1964 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1958);
    float _1966 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1960);
    float _1968 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1932);
    float _1970 = fma(_1962, _1874, _1942);
    float _1972 = fma(_1964, _1874, _1926);
    float _1974 = fma(_1966, _1874, _1944);
    float _1976 = fma(_1936, -2.0, 3.0);
    float _1978 = fma(_1946, _1878, _1970);
    float _1980 = fma(_1954, _1878, _1972);
    float _1982 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1984 = _1936 * _1936;
    float _1986 = fma(_1968, _1878, _1974);
    float _1988 = _1984 * _1976;
    float _1990 = exp2(_1982);
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1992 = -_1988;
    float _1994 = _1992 + 1.0;
    out.m_85.x = _1978;
    out.m_85.y = _1980;
    out.m_85.z = _1986;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1988);
    float _1998 = _1994;
    if (!_1259)
    {
        _1998 = 1.0;
    }
    float _2000 = _1998;
    float _2002 = _1834 + _1281;
    float _2004 = _2000;
    if (_1259)
    {
        bool _2006 = _1375 >= _1343;
        bool _2008 = isnan(_1375);
        bool _2010 = _2006 || _2008;
        bool _2012 = isnan(_1343);
        bool _2014 = _2010 || _2012;
        float _2016 = float(_2014);
        _2004 = _2016;
    }
    float _2018 = _2004;
    float _2020 = _1832 * _1996;
    bool _2022 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2024 = isnan(_1486);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2030 = _2026 || _2028;
    float _2032 = _2002 * 0.5;
    float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2036 = -_1990;
    float _2038 = _2036 + 1.0;
    float _2040 = _2018 * _1464;
    out.m_87.z = _2032;
    out.m_87.w = _1281;
    float _2042 = _1730 * _2034;
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2048 = -_2044;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2052 = _2046 * _1377;
    float _2054 = -_2046;
    float _2056 = _2054 + 1.0;
    float _2058 = _2056;
    if (!_2030)
    {
        _1313 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2060 = _1313;
    float _2062 = -_2040;
    float _2064 = fma(_2062, _2050, 1.0);
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = _1388 * _2052;
    float _2070 = _1388 * _2056;
    float _2072 = _2066;
    float _2074 = _2068;
    float _2076 = _2060;
    float _2078 = _2060;
    if (!_2030)
    {
        _1315 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2080 = _1315;
    float _2082 = _2066 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2084 = _2080;
    float _2086 = _2080;
    if (!_2030)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2088 = _1349;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2030)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2094 = _2058;
    out.m_89.x = _2082;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2030)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2100 = _2072;
    float _2102 = _1702 * _2052;
    float _2104 = fma(_1698, _2068, _1382);
    float _2106 = fma(_1700, _2068, _1384);
    float _2108 = _2100;
    float _2110 = _2100;
    if (!_2030)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2112 = _2074;
    float _2114 = fma(_1388, _2102, _1386);
    out.m_91.x = _2104;
    out.m_91.y = _2106;
    out.m_91.z = _2114;
    out.m_91.w = _2070;
    bool _2116 = !_2030;
    float _2118 = _2112;
    float _2120 = _2112;
    if (!_2116)
    {
        bool _2122 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2124 = isnan(_1486);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2130 = _2126 || _2128;
        if (!_2130)
        {
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2134 = _1486 + _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2138 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2136;
            float _2140 = 1.0 / _2138;
            float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2148 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2152 = _2150 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2162 = _2134 * _2140;
            float _2164 = precise::clamp(_2162, 0.0, 1.0);
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2170 = fma(_2164, _2144, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2172 = fma(_2164, _2168, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2174 = fma(_2164, _2148, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2176 = fma(_2164, _2152, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2178 = fma(_2164, _2156, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2180 = fma(_2164, _2160, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2086 = _2172;
            _2120 = _2178;
            _2078 = _2170;
            _2098 = _2176;
            _2092 = _2174;
            _2110 = _2180;
            _2182 = true;
        }
        else
        {
            bool _2184 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2186 = isnan(_1486);
            bool _2188 = _2184 || _2186;
            bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2192 = _2188 || _2190;
            if (!_2192)
            {
                _2076 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2194 = _2076;
            _2078 = _2194;
            if (!_2192)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2196 = _2084;
            _2086 = _2196;
            if (!_2192)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2198 = _2090;
            _2092 = _2198;
            if (!_2192)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2200 = _2096;
            _2098 = _2200;
            if (!_2192)
            {
                _2118 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2202 = _2118;
            _2120 = _2202;
            if (!_2192)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2204 = _2108;
            bool _2206 = !_2192;
            _2110 = _2204;
            if (!_2206)
            {
                bool _2208 = _1486 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2210 = isnan(_1486);
                bool _2212 = _2208 || _2210;
                bool _2214 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2216 = _2212 || _2214;
                if (!_2216)
                {
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2220 = _1486 + _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2224 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2222;
                    float _2226 = 1.0 / _2224;
                    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2248 = _2220 * _2226;
                    float _2250 = precise::clamp(_2248, 0.0, 1.0);
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2256 = fma(_2250, _2230, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2258 = fma(_2250, _2254, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2260 = fma(_2250, _2234, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2262 = fma(_2250, _2238, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2264 = fma(_2250, _2242, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2266 = fma(_2250, _2246, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2086 = _2258;
                    _2120 = _2264;
                    _2078 = _2256;
                    _2098 = _2262;
                    _2092 = _2260;
                    _2110 = _2266;
                    _2182 = true;
                }
                else
                {
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2120 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2078 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2182 = false;
    float _2268 = _2086;
    float _2270 = _2120;
    float _2272 = _2078;
    float _2274 = _2098;
    float _2276 = _2092;
    float _2278 = _2110;
    float _2280 = fma(_1980, -0.5, 0.5);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = -_2268;
    float _2286 = _2284 + _2270;
    float _2288 = -_2272;
    float _2290 = _2288 + _2274;
    float _2292 = -_2276;
    float _2294 = _2292 + _2278;
    bool _2296 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2298 = fma(_2282, _2286, _2268);
    float _2300 = fma(_2282, _2290, _2272);
    float _2302 = fma(_2282, _2294, _2276);
    float _2304 = _2298 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2306 = fma(_2300, 0.298911988735198974609375, _2304);
    float _2308 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2310 = fma(_2302, 0.114477999508380889892578125, _2306);
    out.m_59.x = _2308;
    float _2312 = -_2310;
    float _2314 = _2300 + _2312;
    float _2316 = -_2310;
    float _2318 = _2298 + _2316;
    float _2320 = -_2310;
    float _2322 = _2302 + _2320;
    out.m_95.x = 0.0;
    float _2324 = fma(_2314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    float _2326 = fma(_2318, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    float _2328 = fma(_2322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2310);
    out.m_97.x = _2324;
    out.m_97.y = _2326;
    out.m_97.z = _2328;
    if (!_2296)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2330 = -_1165;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2334 = -_1167;
    float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2338 = -_1171;
    float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2342 = _2332 * _2332;
    float _2344 = fma(_2336, _2336, _2342);
    float _2346 = fma(_2340, _2340, _2344);
    float _2348 = rsqrt(_2346);
    float _2350 = _2332 * _2348;
    float _2352 = _2336 * _2348;
    float _2354 = _2340 * _2348;
    float _2356 = sqrt(_2346);
    float _2358 = -_1492;
    float _2360 = _2358 + _2350;
    float _2362 = -_1488;
    float _2364 = _2362 + _2352;
    float _2366 = -_1490;
    float _2368 = _2366 + _2354;
    float _2370 = _2360 * _2360;
    float _2372 = fma(_2364, _2364, _2370);
    float _2374 = fma(_2368, _2368, _2372);
    float _2376 = -_2356;
    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = rsqrt(_2374);
    float _2382 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = abs(_2384);
    float _2388 = log2(_2386);
    float _2390 = _2360 * _2380;
    float _2392 = _2364 * _2380;
    float _2394 = _2368 * _2380;
    float _2396 = _1980 * _2390;
    float _2398 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2400 = precise::clamp(_2398, 0.0, 1.0);
    float _2402 = _1980 * _2350;
    float _2404 = fma(_1978, _2392, _2396);
    float _2406 = _2400 * _2400;
    float _2408 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2410 = fma(_1978, _2352, _2402);
    float _2412 = fma(_1986, _2394, _2404);
    float _2414 = precise::clamp(_2412, 0.0, 1.0);
    float _2416 = _2406 + (-1.0);
    float _2418 = fma(_1986, _2354, _2410);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2414 * _2414;
    float _2424 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2426 = exp2(_2408);
    float _2428 = fma(_2422, _2416, 1.0);
    float _2430 = -_2350;
    float _2432 = -_2424;
    float _2434 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2432);
    float _2436 = _2428 * _2428;
    float _2438 = -_2354;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2434);
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2444 = _2440 + _2442;
    float _2446 = 1.0 / _2436;
    float _2448 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    float _2452 = _2426 * _2450;
    float _2454 = _2420 * _2452;
    float _2456 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2458 = _2406 * _2446;
    float _2460 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2462 = _2454 * _2458;
    float _2464 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2466 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2468 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2470 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2456;
    out.m_93.y = _2460;
    out.m_93.z = _2464;
    out.m_95.x = _2466;
    out.m_95.y = _2468;
    out.m_95.z = _2470;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

