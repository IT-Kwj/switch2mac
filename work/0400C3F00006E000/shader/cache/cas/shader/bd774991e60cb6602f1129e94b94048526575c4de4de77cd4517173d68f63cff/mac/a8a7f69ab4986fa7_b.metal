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
    float4 m_79 [[user(locn0)]];
    float4 m_59 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
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
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2238 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_56.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_59.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2583 = as_type<float>(_130);
        out.gl_Position.z = _2583;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_61.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_59.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2652 = as_type<float>(_168);
        out.gl_Position.z = _2652;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_63.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = in.m_56.x;
    float _204 = in.m_56.y;
    float _206 = in.m_56.z;
    float _208 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _214);
    float _220 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _228 = floor(_224);
    float _230 = floor(_226);
    float _232 = -_228;
    float _234 = _224 + _232;
    float _236 = -_230;
    float _238 = _226 + _236;
    float2 _2779 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2779, float2(0.0), isnan(_2779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2779, float2(0.0), isnan(_2779)), level(0.0)).x;
    float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _244 = log2(_242);
    float _246 = in.m_63.z;
    float _248 = in.m_63.x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = in.m_63.y;
    float _260 = 1.0 / _252;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _276 = _274 != 0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _280 = 1.0 + _278;
    float _282 = _244 * _148;
    bool _284 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _292 = _288 || _290;
    float _294 = 1.0 / _256;
    float _296 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _200 + _298;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _310 = _306 || _308;
    float _312 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _296);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _200 + _314;
    float _318 = exp2(_282);
    float _320 = _246 * 2.0;
    float _322 = _300 * _260;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = _200 + _324;
    float _328 = _258 + _246;
    float _330 = 1.0 / _264;
    float _332 = _316 * _294;
    float _334 = _328 + (-1.0);
    float _336 = _248 + _258;
    float _338 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _312);
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _342 = _248 + _246;
    float _344 = 1.0 / _280;
    float _346 = _248 * 2.0;
    float _348 = -_318;
    float _350 = _348 + 1.0;
    float _352 = _342 + (-1.0);
    float _354 = _336 + (-1.0);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = _310 ? _350 : 0.0;
    float _362 = floor(_320);
    float _364 = _258 * 2.0;
    float _366 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _368 = _326 * _330;
    bool _370 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_200);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_200);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _338 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _398 = floor(_346);
    float _400 = _222;
    float _402 = _258;
    if (_292)
    {
        float _404 = _360 * _344;
        _152 = _404;
    }
    float _406 = _152;
    float _408 = _246 + (-0.5);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = floor(_364);
    bool _416 = _362 >= 0.0;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _430 = _362 > 0.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    int _436 = _424 ? 0 : 1;
    float _438 = fma(_428, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _440 = _398 >= 0.0;
    bool _442 = isnan(_398);
    bool _444 = _440 || _442;
    bool _446 = isnan(0.0);
    bool _448 = _444 || _446;
    float _450 = fma(_434, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _456 = _398 > 0.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    int _462 = _448 ? 0 : 1;
    float _464 = -_380;
    float _466 = _464 + 1.0;
    float _468 = fma(_454, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _470 = _414 > 0.0;
    float _472 = fma(_460, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _474 = _414 >= 0.0;
    bool _476 = isnan(_414);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma(_412, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = _394 * _466;
    float _492 = -_394;
    float _494 = _492 + 1.0;
    float _496 = fma(_488, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _498 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _500 = isnan(_200);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    bool _510 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _512 = isnan(_200);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _522;
    float _526 = -_520;
    float _528 = _526 + 1.0;
    float _530 = _520 * _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = fma(_524, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = _508 * _528;
    float _540 = -_508;
    float _542 = _540 + 1.0;
    float _544 = fma(_534, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _546 = _482 ? 0 : 1;
    float _548 = _484 * _538;
    float _550 = _450 * _538;
    float _552 = _472 * _538;
    float _554 = fma(_358, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].x, _548);
    float _558 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].y, _550);
    float _560 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    bool _562 = !_268;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_438, _530, _556);
    float _568 = fma(_496, _530, _558);
    int _570 = ~_546;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = fma(_468, _530, _560);
    int _578 = abs(_564);
    float _580 = _396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _582 = in.m_65.x;
    float _584 = in.m_65.y;
    float _586 = in.m_65.z;
    int _588 = _574;
    int _590 = 2;
    if (!_470)
    {
        int _592 = ~_546;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = _396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _600 = ~_436;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    float _606 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].x, _580);
    int _608 = ~_462;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_554, _490, _576);
    int _616 = _604;
    int _618 = _612;
    if (!_430)
    {
        int _620 = ~_436;
        int _622 = _620 + 1;
        _616 = _622;
    }
    int _624 = _616;
    float _626 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _606);
    if (!_456)
    {
        int _628 = ~_462;
        int _630 = _628 + 1;
        _618 = _630;
    }
    int _632 = _618;
    float _634 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].x, _598);
    float _636 = float(_578);
    float _638 = _626 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _640 = float(_624);
    float _642 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _634);
    bool _644 = !_272;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].z, _614);
    float _650 = _636 * _640;
    int _652 = abs(_646);
    float _654 = _642 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _656 = fma(_544, _490, _566);
    float _658 = fma(_536, _490, _568);
    float _660 = _650 * (-2.0);
    float _662 = 1.0 / _654;
    float _664 = _638 + _654;
    bool _666 = !_276;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_382, _660, _382);
    float _672 = fma(_660, _582, _582);
    float _674 = _248 + (-0.5);
    float _676 = float(_652);
    float _678 = _258 + (-0.5);
    float _680 = float(_632);
    float _682 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].x, _672);
    int _684 = abs(_668);
    float _686 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].x, _656);
    float _688 = _676 * _680;
    float _690 = in.m_67.x;
    float _692 = in.m_67.y;
    float _694 = in.m_67.z;
    float _696 = fma(_670, _406, _682);
    float _698 = float(_596);
    float _700 = _688 * (-2.0);
    float _702 = float(_684);
    float _704 = _664 * _662;
    float _706 = _704 * 0.5;
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_700, _584, _584);
    float _716 = fma(_340, _700, _340);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[30].w, _718);
    float _722 = _702 * _698;
    float _724 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].y, _714);
    float _726 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].y, _658);
    float _728 = 1.0 / _720;
    float _730 = _722 * (-2.0);
    float _732 = fma(_716, _406, _724);
    float _734 = _696 * 0.15915493667125701904296875;
    float _736 = fma(_730, _586, _586);
    float _738 = _732 * 0.15915493667125701904296875;
    float _740 = fma(_366, _730, _366);
    float _742 = _734 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _748 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _750 = _686 * _690;
    float _752 = _726 * _692;
    float _754 = fma(_740, _406, _746);
    float _756 = _396 + _748;
    float _758 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _766 = _728 * _764;
    float _768 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = _754 * 0.15915493667125701904296875;
    float _772 = _756 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _774 = _648 * _694;
    float _776 = _758 * _760;
    float _778 = _768 * _762;
    bool _780 = _766 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _782 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    bool _784 = _766 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _786 = _734 * 6.283185482025146484375;
    float _788 = cos(_786);
    bool _790 = !_780;
    int _792 = _790 ? 0 : 1;
    float _794 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].z, _782);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _798 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _800 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _802 = isnan(0.5);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _808 = _804 || _806;
    float _810 = _794 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _812 = _738 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _798 * _796;
    if (!_780)
    {
        _590 = 1;
    }
    int _818 = _590;
    int _820 = _818;
    if (!_784)
    {
        _820 = _792;
    }
    int _822 = _820;
    float _824 = _738 * 6.283185482025146484375;
    float _826 = cos(_824);
    int _828 = _822 << 6;
    int _830 = _828 + 96;
    uint _833 = uint(int(uint(_830) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.vp_c15)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    float _849 = _770 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = _756 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _855 = _788 * _814;
    float _857 = _744 * _814;
    float _859 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].x, _853);
    int _861 = _828 + 48;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.vp_c15)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.vp_c15)._m0[int(_873)][_875];
    float _879 = _770 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].z, _859);
    float _885 = _744 * _826;
    float _887 = _788 * _826;
    float _889 = _883 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _891 = _788 * _851;
    float _893 = _744 * _851;
    float _895 = trunc(_810);
    int _897 = int(_895);
    float _899 = _826 * _851;
    float _901 = _814 * _851;
    float _903 = _893 * _778;
    int _905 = _828 + 64;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    float _923 = -_855;
    float _925 = fma(_881, _885, _923);
    float _927 = -_885;
    float _929 = fma(_881, _855, _927);
    float _931 = _891 * _778;
    float _933 = fma(_881, _887, _857);
    float _935 = -_778;
    float _937 = _881 * _935;
    float _939 = trunc(_889);
    int _941 = int(_939);
    float _943 = fma(_881, _857, _887);
    float _945 = fma(_933, _776, _931);
    float _947 = fma(_899, _776, _937);
    int _949 = _828 + 104;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.vp_c15)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    float _967 = fma(_925, _776, _903);
    float _969 = fma(_929, _816, _945);
    float _971 = fma(_901, _816, _947);
    int _973 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _975 = _897 + _973;
    int _977 = _975 + 1;
    float _979 = fma(_943, _816, _967);
    float _981 = _969 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _983 = _969 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _985 = _828 + 72;
    uint _987 = uint(int(uint(_985) >> uint(2)));
    uint _989 = uint(int(uint(int(_987)) >> uint(2)));
    int _991 = int(_987) & 3;
    float _993 = (*spvDescriptorSet0.vp_c15)._m0[int(_989)][_991];
    int _995 = int(_987) + 1;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    int _999 = _995 & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    bool _1003 = _977 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[10].x, _981);
    float _1007 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[8].x, _983);
    int _1009 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1011 = _941 + _1009;
    int _1013 = _1011 + 1;
    float _1015 = _756 * _847;
    float _1017 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1005);
    float _1019 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1007);
    int _1021 = _828 + 56;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    int _1031 = int(_1023) + 1;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    int _1035 = _1031 & 3;
    float _1037 = (*spvDescriptorSet0.vp_c15)._m0[int(_1033)][_1035];
    int _1039 = _977 | _1013;
    float _1041 = _222 + _1017;
    float _1043 = _220 + _1019;
    float _1045 = fma(_220, _839, _1015);
    bool _1047 = _1039 < 0;
    bool _1049 = _1047 || _1003;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1053 = _1041 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1043 + _1055;
    int _1059 = _828 + 80;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    bool _1077 = _1013 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1079 = _1077 || _1049;
    float _1081 = _1053 * _1053;
    float _1083 = _969 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1085 = fma(_1057, _1057, _1081);
    float _1087 = _756 * _877;
    float _1089 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1083);
    float _1091 = sqrt(_1085);
    float _1093 = fma(_220, _869, _1087);
    float _1095 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1089);
    float _1097 = _756 * _921;
    uint _1099 = as_type<uint>(_969);
    int _1101 = as_type<int>(_913);
    int _1103 = as_type<int>(_1045);
    int _1105 = as_type<int>(_1089);
    float _1107 = _1041;
    float _1109 = _1057;
    float _1111 = _971;
    if (!_1079)
    {
        int _1113 = _1013 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1115 = _1113 + _977;
        _1099 = uint(_1115);
    }
    uint _1117 = _1099;
    float _1119 = fma(_220, _913, _1097);
    float _1121 = _1083;
    float _1123 = _1119;
    float _1125 = as_type<float>(_1117);
    if (!_1079)
    {
        float _1127 = floor(_810);
        _1121 = _1127;
    }
    float _1129 = _1121;
    if (!_1079)
    {
        uint _1131 = uint(int(uint(int(_1117)) >> uint(2)));
        _1101 = int(_1131);
    }
    int _1133 = _1101;
    float _1135 = fma(_222, _957, _1045);
    float _1137 = as_type<float>(_1133);
    if (!_1079)
    {
        int _1139 = int(_1117) << 2;
        _1103 = _1139;
    }
    int _1141 = _1103;
    bool _1143 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1145 = _1135 + _965;
    if (!_1079)
    {
        int _1147 = 12 & _1141;
        _1105 = _1147;
    }
    int _1149 = _1105;
    float _1151 = fma(_222, _993, _1119);
    int _1153 = as_type<int>(_993);
    if (!_1079)
    {
        int _1155 = _1133 << 4;
        int _1157 = _1155 + _1149;
        _1153 = _1157;
    }
    int _1159 = _1153;
    float _1161 = 1.0 / _1145;
    float _1163 = _396 + _1095;
    float _1165 = _1151 + _1001;
    float _1167 = fma(_222, _1029, _1093);
    if (!_1143)
    {
        _1137 = _1043;
    }
    float _1169 = _1137;
    float _1171 = _1169;
    if (!_1143)
    {
        _1123 = _1163;
    }
    float _1173 = _1123;
    float _1175 = _1167 + _1037;
    bool _1177 = !_1143;
    float _1179 = _1173;
    float _1181 = _1075;
    if (!_1177)
    {
        float _1183 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1187 = _1091 + _1185;
        float _1189 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = rsqrt(_1085);
        float _1193 = _1187 * _1183;
        float _1195 = _1193 * 0.15915493667125701904296875;
        float _1197 = _1195 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = _1195 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = _1199 + (-1.0);
        float _1207 = _1205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = fma(_1203, _1189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1211 = fma(_1163, _1199, _1207);
        float _1213 = _1191 * _1209;
        float _1215 = fma(_1057, _1213, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1217 = fma(_1053, _1213, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1217;
        _1171 = _1215;
        _1179 = _1211;
    }
    float _1219 = _1107;
    float _1221 = _1171;
    float _1223 = _1179;
    float _1225 = _1223;
    float _1227 = _1221;
    if (_808)
    {
        _1109 = _1219;
    }
    float _1229 = _1109;
    float _1231 = _1229;
    if (!_808)
    {
        float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1235 = _396 + _1233;
        float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1239 = _220 + _1237;
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1243 = -_220;
        float _1245 = _1243 + _1221;
        float _1247 = _1235 * _1235;
        float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1251 = _222 + _1249;
        float _1253 = fma(_1239, _1239, _1247);
        float _1255 = -_396;
        float _1257 = _1255 + _1223;
        float _1259 = fma(_1251, _1251, _1253);
        float _1261 = sqrt(_1259);
        float _1263 = precise::min(_1261, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1265 = _1263 * _1241;
        float _1267 = -_222;
        float _1269 = _1267 + _1219;
        float _1271 = fma(_1257, _1265, _396);
        float _1273 = fma(_1245, _1265, _220);
        float _1275 = fma(_1269, _1265, _222);
        _1225 = _1271;
        _1227 = _1273;
        _1231 = _1275;
    }
    float _1277 = _1225;
    float _1279 = _1227;
    float _1281 = _1231;
    int _1283 = _828 + 88;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    float _1301 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1303 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = _1175 * _1161;
    float _1309 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1301);
    float _1311 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1313 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1315 = _1043;
    if (!_1079)
    {
        int _1317 = _1159 + 400;
        uint _1319 = uint(int(uint(_1317) >> uint(2)));
        uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
        int _1323 = int(_1319) & 3;
        float _1325 = (*spvDescriptorSet0.vp_c15)._m0[int(_1321)][_1323];
        _1315 = _1325;
    }
    float _1327 = _1315;
    float _1329 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1309);
    bool _1331 = _1307 >= 0.0;
    float _1333 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1311);
    float _1335 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1313);
    float _1337 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1339 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1341 = _1165 * _1161;
    bool _1343 = _1307 <= 1.0;
    bool _1345 = _1343 && _1331;
    float _1347 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1349 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1337);
    float _1351 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1353 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1355 = _1341 >= 0.0;
    bool _1357 = _1355 && _1345;
    float _1359 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1349);
    float _1361 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1351);
    float _1363 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1367 = _1341 <= 1.0;
    bool _1369 = _1367 && _1357;
    float _1371 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1375 = _756 * _1075;
    float _1377 = -_1365;
    float _1379 = fma(_1377, _1363, 1.0);
    float _1381 = _1093;
    if (!_1079)
    {
        float _1383 = floor(_889);
        _1381 = _1383;
    }
    float _1385 = _1381;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1373);
    float _1389 = fma(_220, _1067, _1375);
    float _1391 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1393 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1395 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1391);
    float _1397 = log2(_1379);
    float _1399 = _1387;
    if (_1369)
    {
        float _1401 = float(_822);
        _1181 = _1401;
    }
    float _1403 = _1181;
    float _1405 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1393);
    float _1407 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1409 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1405);
    float _1411 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1407);
    float _1413 = 1.0 / _1387;
    float _1415 = fma(_222, _1291, _1389);
    if (!_1079)
    {
        float _1417 = -_1385;
        float _1419 = _889 + _1417;
        _1111 = _1419;
    }
    float _1421 = _1111;
    float _1423 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1425 = _1415 + _1299;
    float _1427 = _1375;
    float _1429 = _1423;
    if (_1369)
    {
        float _1431 = rint(_1403);
        float _1433 = precise::max(_1431, 0.0);
        uint _1435 = uint(_1433);
        uint _1437 = clamp(_1435, 0u, 65535u);
        _1427 = as_type<float>(_1437);
    }
    float _1439 = _1427;
    float _1441 = _1425 * _1161;
    float _1443 = _1397 * 0.693147182464599609375;
    float _1445 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1447 = _1443;
    if (!_1079)
    {
        float _1449 = -_1129;
        float _1451 = _810 + _1449;
        _1447 = _1451;
    }
    float _1453 = _1447;
    float _1455 = _1425;
    if (!_1079)
    {
        float _1457 = rint(_1327);
        float _1459 = precise::max(_1457, 0.0);
        uint _1461 = uint(_1459);
        uint _1463 = clamp(_1461, 0u, 65535u);
        _1455 = as_type<float>(_1463);
    }
    float _1465 = _1455;
    float _1467 = _1411 * _1413;
    float _1469 = _1423 * _1413;
    float _1471 = fma(_1467, 0.5, 0.5);
    float _1473 = fma(_1469, -0.5, 0.5);
    float _1475 = _810;
    float _1477 = _1413;
    if (_1369)
    {
        float3 _4770 = float3(_1307, _1341, float(as_type<int>(_1439)));
        float3 _4774 = select(_4770, float3(0.0), isnan(_4770));
        float _1479 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4774.xy, uint(rint(_4774.z)), _1441, level(0.0));
        _1475 = _1479;
    }
    float _1481 = _1475;
    float3 _4784 = float3(_1471, _1473, _1445);
    float _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4784, float3(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4784, float3(0.0), isnan(_4784)), level(0.0)).x;
    float3 _4793 = float3(_1471, _1473, _1445);
    float4 _1486 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4793, float3(0.0), isnan(_4793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4793, float3(0.0), isnan(_4793)), level(0.0)).xyzw;
    float _1488 = _1486.x;
    float _1490 = _1486.y;
    float _1492 = _1486.z;
    float _1494 = _1486.w;
    float _1496 = _1363;
    if (!_1079)
    {
        float3 _4816 = float3(_1453, _1421, float(as_type<int>(_1465)));
        float3 _4818 = select(_4816, float3(0.0), isnan(_4816));
        float _1498 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4818.xy, uint(rint(_4818.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4818.xy, uint(rint(_4818.z)), level(0.0)).x;
        _1496 = _1498;
    }
    float _1500 = _1496;
    if (_1079)
    {
        _1477 = 1.0;
    }
    float _1502 = _1477;
    float _1504 = _1502;
    if (!_1079)
    {
        int _1506 = int(_1117) << 4;
        int _1508 = _1506 + 2048;
        uint _1510 = uint(int(uint(_1508) >> uint(2)));
        uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
        int _1514 = int(_1510) & 3;
        float _1516 = (*spvDescriptorSet0.vp_c15)._m0[int(_1512)][_1514];
        int _1518 = int(_1510) + 1;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        int _1522 = _1518 & 3;
        float _1524 = (*spvDescriptorSet0.vp_c15)._m0[int(_1520)][_1522];
        int _1526 = _1508 + 8;
        uint _1528 = uint(int(uint(_1526) >> uint(2)));
        uint _1530 = uint(int(uint(int(_1528)) >> uint(2)));
        int _1532 = int(_1528) & 3;
        float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
        int _1536 = int(_1528) + 1;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        int _1540 = _1536 & 3;
        float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
        float _1544 = _756 * _1524;
        float _1546 = fma(_220, _1516, _1544);
        float _1548 = fma(_222, _1534, _1546);
        float _1550 = _1548 + _1542;
        float _1552 = precise::clamp(_1550, 0.0, 1.0);
        float _1554 = -_1552;
        float _1556 = _1554 + _1500;
        float _1558 = fma(_1556, 500.0, 1.5);
        float _1560 = exp2(_1558);
        float _1562 = 0.0 + _1560;
        float _1564 = precise::clamp(_1562, 0.0, 1.0);
        _1125 = as_type<float>(_1508);
        _1504 = _1564;
    }
    float _1566 = _1125;
    float _1568 = _1504;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1572 = _1277 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1576 = _1279 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1580 = _1281 + _1578;
    float _1582 = _1572 * _1572;
    float _1584 = fma(_1576, _1576, _1582);
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = fma(_1580, _1580, _1584);
    float _1590 = rsqrt(_1588);
    float _1592 = sqrt(_1588);
    float _1594 = _1576 * _1590;
    float _1596 = _1580 * _1590;
    float _1598 = _1572 * _1590;
    float _1600 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 + _1606;
    float _1610 = sqrt(_1608);
    bool _1612 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1610 + _1614;
    float _1618 = _220;
    float _1620 = _1616;
    float _1622 = _1586;
    float _1624 = _1590;
    float _1626 = _1600;
    float _1628 = _1604;
    float _1630 = _1606;
    if (_1612)
    {
        float _1632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1632;
    }
    float _1634 = _1618;
    if (_1612)
    {
        float _1636 = _1616 * _1634;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = precise::max(0.0, _1586);
    float _1642 = _1640;
    if (_1612)
    {
        float _1644 = rsqrt(_1608);
        _1622 = _1644;
    }
    float _1646 = _1622;
    float _1648 = _1646;
    if (_1612)
    {
        float _1650 = _1638 * 0.15915493667125701904296875;
        _400 = _1650;
    }
    float _1652 = _400;
    float _1654 = -_1598;
    float _1656 = -_1640;
    float _1658 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1656);
    if (_1612)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1660;
    }
    float _1662 = _1642;
    float _1664 = _1566;
    float _1666 = _1662;
    if (_1612)
    {
        float _1668 = _1652 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = _1638;
    if (_1612)
    {
        float _1676 = _1652 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1672;
    if (_1612)
    {
        float _1684 = fma(_1672, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1666 = _1684;
    }
    float _1686 = _1666;
    float _1688 = _1686;
    if (_1612)
    {
        float _1690 = _1646 * _1686;
        _1682 = _1690;
    }
    float _1692 = _1682;
    if (!_1612)
    {
        _1648 = _1658;
    }
    float _1694 = _1648;
    float _1696 = _1694;
    if (_1612)
    {
        float _1698 = _1680 + (-1.0);
        _1624 = _1698;
    }
    float _1700 = _1624;
    float _1702 = _1700;
    if (_1612)
    {
        float _1704 = _1600 * _1692;
        _1626 = _1704;
    }
    float _1706 = _1626;
    if (_1612)
    {
        float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1708;
    }
    float _1710 = _1688;
    if (!_1612)
    {
        _1702 = _1602;
    }
    float _1712 = _1702;
    float _1714 = _1712;
    if (_1612)
    {
        float _1716 = _1602 * _1692;
        _1714 = _1716;
    }
    float _1718 = _1714;
    if (_1612)
    {
        float _1720 = _1706 * _1706;
        _1628 = _1720;
    }
    float _1722 = _1628;
    if (_1612)
    {
        float _1724 = fma(_1658, _1680, _1710);
        _1696 = _1724;
    }
    float _1726 = _1696;
    if (_1612)
    {
        float _1728 = _1718 * _1718;
        _1630 = _1728;
    }
    float _1730 = _1630;
    float _1732 = fma(_1726, _1726, _1722);
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1736 = fma(_1592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1734);
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = _1732 + _1730;
    float _1742 = -_1738;
    float _1744 = _1742 + 1.0;
    float _1746 = rsqrt(_1740);
    float _1748 = abs(_1744);
    float _1750 = log2(_1748);
    float _1752 = _1746 * _1706;
    float _1754 = _1746 * _1726;
    float _1756 = _1746 * _1718;
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = _1754 + 1.0;
    float _1762 = -_1758;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1756;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = exp2(_1766);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = fma(_1770, 0.5, 0.5);
    float _1778 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = sqrt(_1774);
    float _1782 = fma(_1776, _1778, -0.212114393711090087890625);
    float _1784 = fma(_1776, _1782, 1.570728778839111328125);
    float _1786 = -_1754;
    float _1788 = fma(_1772, _1760, _1786);
    float _1790 = fma(_1788, 0.5, 0.5);
    float _1792 = _1780 * 0.636619746685028076171875;
    float _1794 = -_1784;
    float _1796 = fma(_1792, _1794, 1.0);
    float2 _5282 = float2(_1796, _1790);
    float3 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5282, float2(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5282, float2(0.0), isnan(_5282)), level(0.0)).xyz;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1810 = in.m_71.y;
    float _1812 = abs(_766);
    float _1814 = log2(_1812);
    bool _1816 = _258 > 0.5;
    float _1818 = _1808 * _248;
    float _1820 = in.m_71.x;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1824 = _1822 != 0;
    float _1826 = -_240;
    float _1828 = _1826 + 1.0;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1832 = _1830 != 0;
    out.m_73.x = _1279;
    out.m_73.y = _1277;
    out.m_73.z = _1281;
    float _1834 = trunc(_1818);
    int _1836 = int(_1834);
    bool _1838 = _710 != 0.0;
    bool _1840 = isnan(_710);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan(0.0);
    bool _1846 = _1842 || _1844;
    bool _1848 = _248 > 0.5;
    bool _1850 = _1848 && _1832;
    bool _1852 = _708 == 0.0;
    bool _1854 = !_1846;
    bool _1856 = _1852 && _1854;
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1860 = _712 == 0.0;
    bool _1862 = _1860 && _1856;
    float _1864 = -_1810;
    float _1866 = _1864 + 1.0;
    int _1868 = _1836 << 4;
    int _1870 = _1868 + 1712;
    float _1872 = _1810;
    if (_1824)
    {
        float _1874 = _1816 ? _1866 : _1810;
        _1872 = _1874;
    }
    float _1876 = _1872;
    int _1878 = _1870 + 8;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
    int _1884 = int(_1880) & 3;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[int(_1882)][_1884];
    float _1888 = in.m_75.x;
    float _1890 = in.m_75.y;
    float _1892 = in.m_75.z;
    float _1894 = 0.0;
    if (_1832)
    {
        _1894 = _1820;
    }
    float _1896 = _1894;
    float _1898 = _1896;
    if (!_1832)
    {
        _402 = _1820;
    }
    float _1900 = _402;
    float _1902 = _1900;
    if (_1850)
    {
        float _1904 = -_1896;
        float _1906 = _1904 + 1.0;
        _1898 = _1906;
    }
    float _1908 = _1898;
    uint _1910 = uint(int(uint(_1870) >> uint(2)));
    uint _1912 = uint(int(uint(int(_1910)) >> uint(2)));
    int _1914 = int(_1910) & 3;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[int(_1912)][_1914];
    int _1918 = int(_1910) + 1;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    int _1922 = _1918 & 3;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[int(_1920)][_1922];
    float _1926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1832)
    {
        _1902 = _1908;
    }
    float _1930 = _1902;
    float _1932 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1934 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1936 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1938 = _1932 * _1858;
    float _1940 = _1890;
    float _1942 = _1888;
    float _1944 = _1892;
    if (!_1862)
    {
        float _1946 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1890);
        _1940 = _1946;
    }
    float _1948 = _1940;
    if (!_1862)
    {
        float _1950 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1888);
        _1942 = _1950;
    }
    float _1952 = _1942;
    if (!_1862)
    {
        float _1954 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1892);
        _1944 = _1954;
    }
    float _1956 = _1944;
    float _1958 = _891 * _1948;
    float _1960 = -_1948;
    float _1962 = _881 * _1960;
    float _1964 = _893 * _1948;
    float _1966 = fma(_933, _1952, _1958);
    float _1968 = fma(_899, _1952, _1962);
    float _1970 = _1936 * _1926;
    float _1972 = fma(_925, _1952, _1964);
    float _1974 = fma(_929, _1956, _1966);
    float _1976 = fma(_901, _1956, _1968);
    float _1978 = fma(_943, _1956, _1972);
    float _1980 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1984 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_77.x = _1970;
    out.m_77.y = _1938;
    float _1986 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1980);
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1982);
    float _1990 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1984);
    float _1992 = _1886 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1994 = exp2(_1934);
    float _1996 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2000 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2002 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2008 = precise::clamp(_2006, 0.0, 1.0);
    out.m_79.x = _2002;
    out.m_79.y = _2004;
    out.m_79.z = _1996;
    out.m_79.w = _1928;
    float _2010 = fma(_2008, -2.0, 3.0);
    float _2012 = _2008 * _2008;
    float _2014 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1986);
    bool _2016 = _766 <= 8000.0;
    bool _2018 = isnan(_766);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(8000.0);
    bool _2024 = _2020 || _2022;
    float _2026 = float(_2024);
    float _2028 = _2012 * _2010;
    float _2030 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1988);
    float _2032 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1990);
    float _2034 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2036 = -_2028;
    float _2038 = _2036 + 1.0;
    float _2040 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _2030;
    out.m_81.y = _2032;
    out.m_81.z = _2014;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2028);
    float _2044 = exp2(_2034);
    float _2046 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2040);
    float _2048 = _2026 * _2042;
    float _2050 = _2026;
    float _2052 = _1411;
    if (!_1369)
    {
        _2050 = 1.0;
    }
    float _2054 = _2050;
    float _2056 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2058 = _2054;
    if (_1369)
    {
        bool _2060 = _1481 >= _1441;
        bool _2062 = isnan(_1481);
        bool _2064 = _2060 || _2062;
        bool _2066 = isnan(_1441);
        bool _2068 = _2064 || _2066;
        float _2070 = float(_2068);
        _2058 = _2070;
    }
    float _2072 = _2058;
    float _2074 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2076 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2056);
    float _2078 = _1828 * _2074;
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    float _2082 = _2072 * _1568;
    float _2084 = _2076 + _1387;
    bool _2086 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2088 = isnan(_1592);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2094 = _2090 || _2092;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _2076;
    out.gl_Position.w = _1387;
    float _2096 = -_2044;
    float _2098 = _2096 + 1.0;
    float _2100 = _2084 * 0.5;
    float _2102 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2104 = -_2080;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.z = _2100;
    out.m_85.w = _1387;
    float _2108 = _2102 * _1483;
    float _2110 = -_2082;
    float _2112 = fma(_2110, _2106, 1.0);
    float _2114 = precise::clamp(_2112, 0.0, 1.0);
    float _2116 = -_2102;
    float _2118 = _2116 + 1.0;
    float _2120 = _1494 * _2108;
    float _2122 = _2114 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2124 = _1494 * _2118;
    float _2126 = _2114;
    float _2128 = _2076;
    float _2130 = _2120;
    if (!_2094)
    {
        _2126 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2132 = _2126;
    float _2134 = _2132;
    float _2136 = _2132;
    if (!_2094)
    {
        _1399 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2138 = _1399;
    out.m_87.x = _2122;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2094)
    {
        _2128 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2144 = _2128;
    float _2146 = _2144;
    float _2148 = _2144;
    if (!_2094)
    {
        _1429 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2150 = _1429;
    float _2152 = _2150;
    float _2154 = _2150;
    if (!_2094)
    {
        _2052 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2156 = _2052;
    float _2158 = _1806 * _2108;
    float _2160 = fma(_1802, _2120, _1488);
    float _2162 = fma(_1804, _2120, _1490);
    float _2164 = _2156;
    float _2166 = _2156;
    if (!_2094)
    {
        _2130 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2168 = _2130;
    float _2170 = fma(_1494, _2158, _1492);
    out.m_89.x = _2160;
    out.m_89.y = _2162;
    out.m_89.z = _2170;
    out.m_89.w = _2124;
    bool _2172 = !_2094;
    float _2174 = _2168;
    float _2176 = _2168;
    if (!_2172)
    {
        bool _2178 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2180 = isnan(_1592);
        bool _2182 = _2178 || _2180;
        bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2186 = _2182 || _2184;
        if (!_2186)
        {
            float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2190 = _1592 + _2188;
            float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2194 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2192;
            float _2196 = 1.0 / _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2212 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2218 = _2190 * _2196;
            float _2220 = precise::clamp(_2218, 0.0, 1.0);
            float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2226 = fma(_2220, _2200, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2228 = fma(_2220, _2224, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2230 = fma(_2220, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2232 = fma(_2220, _2208, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2234 = fma(_2220, _2212, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2236 = fma(_2220, _2216, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2142 = _2228;
            _2166 = _2234;
            _2136 = _2226;
            _2154 = _2232;
            _2148 = _2230;
            _2176 = _2236;
            _2238 = true;
        }
        else
        {
            bool _2240 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2242 = isnan(_1592);
            bool _2244 = _2240 || _2242;
            bool _2246 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2248 = _2244 || _2246;
            if (!_2248)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2250 = _2134;
            _2136 = _2250;
            if (!_2248)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2252 = _2140;
            _2142 = _2252;
            if (!_2248)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2254 = _2146;
            _2148 = _2254;
            if (!_2248)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2256 = _2152;
            _2154 = _2256;
            if (!_2248)
            {
                _2164 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2258 = _2164;
            _2166 = _2258;
            if (!_2248)
            {
                _2174 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2260 = _2174;
            bool _2262 = !_2248;
            _2176 = _2260;
            if (!_2262)
            {
                bool _2264 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2266 = isnan(_1592);
                bool _2268 = _2264 || _2266;
                bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2272 = _2268 || _2270;
                if (!_2272)
                {
                    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2276 = _1592 + _2274;
                    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2280 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2278;
                    float _2282 = 1.0 / _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2304 = _2276 * _2282;
                    float _2306 = precise::clamp(_2304, 0.0, 1.0);
                    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2312 = fma(_2306, _2286, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2314 = fma(_2306, _2310, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2316 = fma(_2306, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2318 = fma(_2306, _2294, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2320 = fma(_2306, _2298, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2322 = fma(_2306, _2302, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2142 = _2314;
                    _2166 = _2320;
                    _2136 = _2312;
                    _2154 = _2318;
                    _2148 = _2316;
                    _2176 = _2322;
                    _2238 = true;
                }
                else
                {
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2166 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2176 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2238 = false;
    float _2324 = _2142;
    float _2326 = _2166;
    float _2328 = _2136;
    float _2330 = _2154;
    float _2332 = _2148;
    float _2334 = _2176;
    float _2336 = fma(_2032, -0.5, 0.5);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = -_2324;
    float _2342 = _2340 + _2326;
    float _2344 = -_2328;
    float _2346 = _2344 + _2330;
    float _2348 = -_2332;
    float _2350 = _2348 + _2334;
    bool _2352 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2354 = fma(_2338, _2342, _2324);
    float _2356 = fma(_2338, _2346, _2328);
    float _2358 = fma(_2338, _2350, _2332);
    float _2360 = _2354 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _2362 = fma(_2356, 0.298911988735198974609375, _2360);
    float _2364 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2366 = fma(_2358, 0.114477999508380889892578125, _2362);
    out.m_59.x = _2364;
    float _2368 = -_2366;
    float _2370 = _2356 + _2368;
    float _2372 = -_2366;
    float _2374 = _2354 + _2372;
    float _2376 = -_2366;
    float _2378 = _2358 + _2376;
    out.m_93.x = 0.0;
    float _2380 = fma(_2370, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    float _2382 = fma(_2374, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    float _2384 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    out.m_95.x = _2380;
    out.m_95.y = _2382;
    out.m_95.z = _2384;
    if (!_2352)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2386 = -_1277;
    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2390 = -_1279;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2394 = -_1281;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2398 = _2388 * _2388;
    float _2400 = fma(_2392, _2392, _2398);
    float _2402 = fma(_2396, _2396, _2400);
    float _2404 = rsqrt(_2402);
    float _2406 = _2388 * _2404;
    float _2408 = _2392 * _2404;
    float _2410 = _2396 * _2404;
    float _2412 = sqrt(_2402);
    float _2414 = -_1598;
    float _2416 = _2414 + _2406;
    float _2418 = -_1594;
    float _2420 = _2418 + _2408;
    float _2422 = -_1596;
    float _2424 = _2422 + _2410;
    float _2426 = _2416 * _2416;
    float _2428 = fma(_2420, _2420, _2426);
    float _2430 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = fma(_2424, _2424, _2428);
    float _2436 = _2432 * _2432;
    float _2438 = -_2412;
    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2442 = _2436 + (-1.0);
    float _2444 = rsqrt(_2434);
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = abs(_2448);
    float _2452 = log2(_2450);
    float _2454 = _2416 * _2444;
    float _2456 = _2420 * _2444;
    float _2458 = _2424 * _2444;
    float _2460 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2462 = _2032 * _2454;
    float _2464 = _2032 * _2406;
    float _2466 = fma(_2030, _2456, _2462);
    float _2468 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2470 = fma(_2030, _2408, _2464);
    float _2472 = fma(_2014, _2458, _2466);
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2014, _2410, _2470);
    float _2478 = precise::clamp(_2476, 0.0, 1.0);
    float _2480 = exp2(_2468);
    float _2482 = _2474 * _2474;
    float _2484 = fma(_2482, _2442, 1.0);
    float _2486 = -_2406;
    float _2488 = -_2460;
    float _2490 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2488);
    float _2492 = _2484 * _2484;
    float _2494 = -_2410;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2490);
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2500 = _2496 + _2498;
    float _2502 = 1.0 / _2492;
    float _2504 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = _2480 * _2506;
    float _2510 = _2478 * _2508;
    float _2512 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2514 = _2436 * _2502;
    float _2516 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2520 = _2510 * _2514;
    out.m_91.x = _2512;
    out.m_91.y = _2516;
    out.m_91.z = _2518;
    float _2522 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2524 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2526 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2522;
    out.m_93.y = _2524;
    out.m_93.z = _2526;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2238 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_56.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_59.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2583 = as_type<float>(_130);
        out.gl_Position.z = _2583;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_61.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_59.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2652 = as_type<float>(_168);
        out.gl_Position.z = _2652;
    }
    if (_162)
    {
        return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_63.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = in.m_56.x;
    float _204 = in.m_56.y;
    float _206 = in.m_56.z;
    float _208 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _214);
    float _220 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _228 = floor(_224);
    float _230 = floor(_226);
    float _232 = -_228;
    float _234 = _224 + _232;
    float _236 = -_230;
    float _238 = _226 + _236;
    float2 _2779 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2779, float2(0.0), isnan(_2779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2779, float2(0.0), isnan(_2779)), level(0.0)).x;
    float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _244 = log2(_242);
    float _246 = in.m_63.z;
    float _248 = in.m_63.x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = in.m_63.y;
    float _260 = 1.0 / _252;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _276 = _274 != 0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _280 = 1.0 + _278;
    float _282 = _244 * _148;
    bool _284 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _292 = _288 || _290;
    float _294 = 1.0 / _256;
    float _296 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _200 + _298;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _310 = _306 || _308;
    float _312 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _296);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _200 + _314;
    float _318 = exp2(_282);
    float _320 = _246 * 2.0;
    float _322 = _300 * _260;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = _200 + _324;
    float _328 = _258 + _246;
    float _330 = 1.0 / _264;
    float _332 = _316 * _294;
    float _334 = _328 + (-1.0);
    float _336 = _248 + _258;
    float _338 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _312);
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _342 = _248 + _246;
    float _344 = 1.0 / _280;
    float _346 = _248 * 2.0;
    float _348 = -_318;
    float _350 = _348 + 1.0;
    float _352 = _342 + (-1.0);
    float _354 = _336 + (-1.0);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = _310 ? _350 : 0.0;
    float _362 = floor(_320);
    float _364 = _258 * 2.0;
    float _366 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _368 = _326 * _330;
    bool _370 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_200);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_200);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _338 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _398 = floor(_346);
    float _400 = _222;
    float _402 = _258;
    if (_292)
    {
        float _404 = _360 * _344;
        _152 = _404;
    }
    float _406 = _152;
    float _408 = _246 + (-0.5);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = floor(_364);
    bool _416 = _362 >= 0.0;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _430 = _362 > 0.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    int _436 = _424 ? 0 : 1;
    float _438 = fma(_428, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _440 = _398 >= 0.0;
    bool _442 = isnan(_398);
    bool _444 = _440 || _442;
    bool _446 = isnan(0.0);
    bool _448 = _444 || _446;
    float _450 = fma(_434, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _456 = _398 > 0.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    int _462 = _448 ? 0 : 1;
    float _464 = -_380;
    float _466 = _464 + 1.0;
    float _468 = fma(_454, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _470 = _414 > 0.0;
    float _472 = fma(_460, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _474 = _414 >= 0.0;
    bool _476 = isnan(_414);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma(_412, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = _394 * _466;
    float _492 = -_394;
    float _494 = _492 + 1.0;
    float _496 = fma(_488, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _498 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _500 = isnan(_200);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    bool _510 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _512 = isnan(_200);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _522;
    float _526 = -_520;
    float _528 = _526 + 1.0;
    float _530 = _520 * _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = fma(_524, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = _508 * _528;
    float _540 = -_508;
    float _542 = _540 + 1.0;
    float _544 = fma(_534, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _546 = _482 ? 0 : 1;
    float _548 = _484 * _538;
    float _550 = _450 * _538;
    float _552 = _472 * _538;
    float _554 = fma(_358, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].x, _548);
    float _558 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].y, _550);
    float _560 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    bool _562 = !_268;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_438, _530, _556);
    float _568 = fma(_496, _530, _558);
    int _570 = ~_546;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = fma(_468, _530, _560);
    int _578 = abs(_564);
    float _580 = _396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _582 = in.m_65.x;
    float _584 = in.m_65.y;
    float _586 = in.m_65.z;
    int _588 = _574;
    int _590 = 2;
    if (!_470)
    {
        int _592 = ~_546;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = _396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _600 = ~_436;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    float _606 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].x, _580);
    int _608 = ~_462;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_554, _490, _576);
    int _616 = _604;
    int _618 = _612;
    if (!_430)
    {
        int _620 = ~_436;
        int _622 = _620 + 1;
        _616 = _622;
    }
    int _624 = _616;
    float _626 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _606);
    if (!_456)
    {
        int _628 = ~_462;
        int _630 = _628 + 1;
        _618 = _630;
    }
    int _632 = _618;
    float _634 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].x, _598);
    float _636 = float(_578);
    float _638 = _626 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _640 = float(_624);
    float _642 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _634);
    bool _644 = !_272;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].z, _614);
    float _650 = _636 * _640;
    int _652 = abs(_646);
    float _654 = _642 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _656 = fma(_544, _490, _566);
    float _658 = fma(_536, _490, _568);
    float _660 = _650 * (-2.0);
    float _662 = 1.0 / _654;
    float _664 = _638 + _654;
    bool _666 = !_276;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_382, _660, _382);
    float _672 = fma(_660, _582, _582);
    float _674 = _248 + (-0.5);
    float _676 = float(_652);
    float _678 = _258 + (-0.5);
    float _680 = float(_632);
    float _682 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].x, _672);
    int _684 = abs(_668);
    float _686 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].x, _656);
    float _688 = _676 * _680;
    float _690 = in.m_67.x;
    float _692 = in.m_67.y;
    float _694 = in.m_67.z;
    float _696 = fma(_670, _406, _682);
    float _698 = float(_596);
    float _700 = _688 * (-2.0);
    float _702 = float(_684);
    float _704 = _664 * _662;
    float _706 = _704 * 0.5;
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_700, _584, _584);
    float _716 = fma(_340, _700, _340);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[30].w, _718);
    float _722 = _702 * _698;
    float _724 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].y, _714);
    float _726 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].y, _658);
    float _728 = 1.0 / _720;
    float _730 = _722 * (-2.0);
    float _732 = fma(_716, _406, _724);
    float _734 = _696 * 0.15915493667125701904296875;
    float _736 = fma(_730, _586, _586);
    float _738 = _732 * 0.15915493667125701904296875;
    float _740 = fma(_366, _730, _366);
    float _742 = _734 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _748 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _750 = _686 * _690;
    float _752 = _726 * _692;
    float _754 = fma(_740, _406, _746);
    float _756 = _396 + _748;
    float _758 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _766 = _728 * _764;
    float _768 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = _754 * 0.15915493667125701904296875;
    float _772 = _756 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _774 = _648 * _694;
    float _776 = _758 * _760;
    float _778 = _768 * _762;
    bool _780 = _766 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _782 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    bool _784 = _766 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _786 = _734 * 6.283185482025146484375;
    float _788 = cos(_786);
    bool _790 = !_780;
    int _792 = _790 ? 0 : 1;
    float _794 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].z, _782);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _798 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _800 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _802 = isnan(0.5);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _808 = _804 || _806;
    float _810 = _794 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _812 = _738 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _798 * _796;
    if (!_780)
    {
        _590 = 1;
    }
    int _818 = _590;
    int _820 = _818;
    if (!_784)
    {
        _820 = _792;
    }
    int _822 = _820;
    float _824 = _738 * 6.283185482025146484375;
    float _826 = cos(_824);
    int _828 = _822 << 6;
    int _830 = _828 + 96;
    uint _833 = uint(int(uint(_830) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.vp_c15)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    float _849 = _770 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = _756 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _855 = _788 * _814;
    float _857 = _744 * _814;
    float _859 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].x, _853);
    int _861 = _828 + 48;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.vp_c15)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.vp_c15)._m0[int(_873)][_875];
    float _879 = _770 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].z, _859);
    float _885 = _744 * _826;
    float _887 = _788 * _826;
    float _889 = _883 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _891 = _788 * _851;
    float _893 = _744 * _851;
    float _895 = trunc(_810);
    int _897 = int(_895);
    float _899 = _826 * _851;
    float _901 = _814 * _851;
    float _903 = _893 * _778;
    int _905 = _828 + 64;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    float _923 = -_855;
    float _925 = fma(_881, _885, _923);
    float _927 = -_885;
    float _929 = fma(_881, _855, _927);
    float _931 = _891 * _778;
    float _933 = fma(_881, _887, _857);
    float _935 = -_778;
    float _937 = _881 * _935;
    float _939 = trunc(_889);
    int _941 = int(_939);
    float _943 = fma(_881, _857, _887);
    float _945 = fma(_933, _776, _931);
    float _947 = fma(_899, _776, _937);
    int _949 = _828 + 104;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.vp_c15)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    float _967 = fma(_925, _776, _903);
    float _969 = fma(_929, _816, _945);
    float _971 = fma(_901, _816, _947);
    int _973 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _975 = _897 + _973;
    int _977 = _975 + 1;
    float _979 = fma(_943, _816, _967);
    float _981 = _969 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _983 = _969 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _985 = _828 + 72;
    uint _987 = uint(int(uint(_985) >> uint(2)));
    uint _989 = uint(int(uint(int(_987)) >> uint(2)));
    int _991 = int(_987) & 3;
    float _993 = (*spvDescriptorSet0.vp_c15)._m0[int(_989)][_991];
    int _995 = int(_987) + 1;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    int _999 = _995 & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    bool _1003 = _977 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[10].x, _981);
    float _1007 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[8].x, _983);
    int _1009 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1011 = _941 + _1009;
    int _1013 = _1011 + 1;
    float _1015 = _756 * _847;
    float _1017 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1005);
    float _1019 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1007);
    int _1021 = _828 + 56;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    int _1031 = int(_1023) + 1;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    int _1035 = _1031 & 3;
    float _1037 = (*spvDescriptorSet0.vp_c15)._m0[int(_1033)][_1035];
    int _1039 = _977 | _1013;
    float _1041 = _222 + _1017;
    float _1043 = _220 + _1019;
    float _1045 = fma(_220, _839, _1015);
    bool _1047 = _1039 < 0;
    bool _1049 = _1047 || _1003;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1053 = _1041 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1043 + _1055;
    int _1059 = _828 + 80;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    bool _1077 = _1013 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1079 = _1077 || _1049;
    float _1081 = _1053 * _1053;
    float _1083 = _969 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1085 = fma(_1057, _1057, _1081);
    float _1087 = _756 * _877;
    float _1089 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1083);
    float _1091 = sqrt(_1085);
    float _1093 = fma(_220, _869, _1087);
    float _1095 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1089);
    float _1097 = _756 * _921;
    uint _1099 = as_type<uint>(_969);
    int _1101 = as_type<int>(_913);
    int _1103 = as_type<int>(_1045);
    int _1105 = as_type<int>(_1089);
    float _1107 = _1041;
    float _1109 = _1057;
    float _1111 = _971;
    if (!_1079)
    {
        int _1113 = _1013 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1115 = _1113 + _977;
        _1099 = uint(_1115);
    }
    uint _1117 = _1099;
    float _1119 = fma(_220, _913, _1097);
    float _1121 = _1083;
    float _1123 = _1119;
    float _1125 = as_type<float>(_1117);
    if (!_1079)
    {
        float _1127 = floor(_810);
        _1121 = _1127;
    }
    float _1129 = _1121;
    if (!_1079)
    {
        uint _1131 = uint(int(uint(int(_1117)) >> uint(2)));
        _1101 = int(_1131);
    }
    int _1133 = _1101;
    float _1135 = fma(_222, _957, _1045);
    float _1137 = as_type<float>(_1133);
    if (!_1079)
    {
        int _1139 = int(_1117) << 2;
        _1103 = _1139;
    }
    int _1141 = _1103;
    bool _1143 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1145 = _1135 + _965;
    if (!_1079)
    {
        int _1147 = 12 & _1141;
        _1105 = _1147;
    }
    int _1149 = _1105;
    float _1151 = fma(_222, _993, _1119);
    int _1153 = as_type<int>(_993);
    if (!_1079)
    {
        int _1155 = _1133 << 4;
        int _1157 = _1155 + _1149;
        _1153 = _1157;
    }
    int _1159 = _1153;
    float _1161 = 1.0 / _1145;
    float _1163 = _396 + _1095;
    float _1165 = _1151 + _1001;
    float _1167 = fma(_222, _1029, _1093);
    if (!_1143)
    {
        _1137 = _1043;
    }
    float _1169 = _1137;
    float _1171 = _1169;
    if (!_1143)
    {
        _1123 = _1163;
    }
    float _1173 = _1123;
    float _1175 = _1167 + _1037;
    bool _1177 = !_1143;
    float _1179 = _1173;
    float _1181 = _1075;
    if (!_1177)
    {
        float _1183 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1187 = _1091 + _1185;
        float _1189 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = rsqrt(_1085);
        float _1193 = _1187 * _1183;
        float _1195 = _1193 * 0.15915493667125701904296875;
        float _1197 = _1195 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = _1195 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = _1199 + (-1.0);
        float _1207 = _1205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = fma(_1203, _1189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1211 = fma(_1163, _1199, _1207);
        float _1213 = _1191 * _1209;
        float _1215 = fma(_1057, _1213, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1217 = fma(_1053, _1213, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1217;
        _1171 = _1215;
        _1179 = _1211;
    }
    float _1219 = _1107;
    float _1221 = _1171;
    float _1223 = _1179;
    float _1225 = _1223;
    float _1227 = _1221;
    if (_808)
    {
        _1109 = _1219;
    }
    float _1229 = _1109;
    float _1231 = _1229;
    if (!_808)
    {
        float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1235 = _396 + _1233;
        float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1239 = _220 + _1237;
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1243 = -_220;
        float _1245 = _1243 + _1221;
        float _1247 = _1235 * _1235;
        float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1251 = _222 + _1249;
        float _1253 = fma(_1239, _1239, _1247);
        float _1255 = -_396;
        float _1257 = _1255 + _1223;
        float _1259 = fma(_1251, _1251, _1253);
        float _1261 = sqrt(_1259);
        float _1263 = precise::min(_1261, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1265 = _1263 * _1241;
        float _1267 = -_222;
        float _1269 = _1267 + _1219;
        float _1271 = fma(_1257, _1265, _396);
        float _1273 = fma(_1245, _1265, _220);
        float _1275 = fma(_1269, _1265, _222);
        _1225 = _1271;
        _1227 = _1273;
        _1231 = _1275;
    }
    float _1277 = _1225;
    float _1279 = _1227;
    float _1281 = _1231;
    int _1283 = _828 + 88;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    float _1301 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1303 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = _1175 * _1161;
    float _1309 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1301);
    float _1311 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1313 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1315 = _1043;
    if (!_1079)
    {
        int _1317 = _1159 + 400;
        uint _1319 = uint(int(uint(_1317) >> uint(2)));
        uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
        int _1323 = int(_1319) & 3;
        float _1325 = (*spvDescriptorSet0.vp_c15)._m0[int(_1321)][_1323];
        _1315 = _1325;
    }
    float _1327 = _1315;
    float _1329 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1309);
    bool _1331 = _1307 >= 0.0;
    float _1333 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1311);
    float _1335 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1313);
    float _1337 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1339 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1341 = _1165 * _1161;
    bool _1343 = _1307 <= 1.0;
    bool _1345 = _1343 && _1331;
    float _1347 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1349 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1337);
    float _1351 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1353 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1355 = _1341 >= 0.0;
    bool _1357 = _1355 && _1345;
    float _1359 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1349);
    float _1361 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1351);
    float _1363 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1367 = _1341 <= 1.0;
    bool _1369 = _1367 && _1357;
    float _1371 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1375 = _756 * _1075;
    float _1377 = -_1365;
    float _1379 = fma(_1377, _1363, 1.0);
    float _1381 = _1093;
    if (!_1079)
    {
        float _1383 = floor(_889);
        _1381 = _1383;
    }
    float _1385 = _1381;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1373);
    float _1389 = fma(_220, _1067, _1375);
    float _1391 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1393 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1395 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1391);
    float _1397 = log2(_1379);
    float _1399 = _1387;
    if (_1369)
    {
        float _1401 = float(_822);
        _1181 = _1401;
    }
    float _1403 = _1181;
    float _1405 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1393);
    float _1407 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1409 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1405);
    float _1411 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1407);
    float _1413 = 1.0 / _1387;
    float _1415 = fma(_222, _1291, _1389);
    if (!_1079)
    {
        float _1417 = -_1385;
        float _1419 = _889 + _1417;
        _1111 = _1419;
    }
    float _1421 = _1111;
    float _1423 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1425 = _1415 + _1299;
    float _1427 = _1375;
    float _1429 = _1423;
    if (_1369)
    {
        float _1431 = rint(_1403);
        float _1433 = precise::max(_1431, 0.0);
        uint _1435 = uint(_1433);
        uint _1437 = clamp(_1435, 0u, 65535u);
        _1427 = as_type<float>(_1437);
    }
    float _1439 = _1427;
    float _1441 = _1425 * _1161;
    float _1443 = _1397 * 0.693147182464599609375;
    float _1445 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1447 = _1443;
    if (!_1079)
    {
        float _1449 = -_1129;
        float _1451 = _810 + _1449;
        _1447 = _1451;
    }
    float _1453 = _1447;
    float _1455 = _1425;
    if (!_1079)
    {
        float _1457 = rint(_1327);
        float _1459 = precise::max(_1457, 0.0);
        uint _1461 = uint(_1459);
        uint _1463 = clamp(_1461, 0u, 65535u);
        _1455 = as_type<float>(_1463);
    }
    float _1465 = _1455;
    float _1467 = _1411 * _1413;
    float _1469 = _1423 * _1413;
    float _1471 = fma(_1467, 0.5, 0.5);
    float _1473 = fma(_1469, -0.5, 0.5);
    float _1475 = _810;
    float _1477 = _1413;
    if (_1369)
    {
        float3 _4770 = float3(_1307, _1341, float(as_type<int>(_1439)));
        float3 _4774 = select(_4770, float3(0.0), isnan(_4770));
        float _1479 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4774.xy, uint(rint(_4774.z)), _1441, level(0.0));
        _1475 = _1479;
    }
    float _1481 = _1475;
    float3 _4784 = float3(_1471, _1473, _1445);
    float _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4784, float3(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4784, float3(0.0), isnan(_4784)), level(0.0)).x;
    float3 _4793 = float3(_1471, _1473, _1445);
    float4 _1486 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4793, float3(0.0), isnan(_4793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4793, float3(0.0), isnan(_4793)), level(0.0)).xyzw;
    float _1488 = _1486.x;
    float _1490 = _1486.y;
    float _1492 = _1486.z;
    float _1494 = _1486.w;
    float _1496 = _1363;
    if (!_1079)
    {
        float3 _4816 = float3(_1453, _1421, float(as_type<int>(_1465)));
        float3 _4818 = select(_4816, float3(0.0), isnan(_4816));
        float _1498 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4818.xy, uint(rint(_4818.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4818.xy, uint(rint(_4818.z)), level(0.0)).x;
        _1496 = _1498;
    }
    float _1500 = _1496;
    if (_1079)
    {
        _1477 = 1.0;
    }
    float _1502 = _1477;
    float _1504 = _1502;
    if (!_1079)
    {
        int _1506 = int(_1117) << 4;
        int _1508 = _1506 + 2048;
        uint _1510 = uint(int(uint(_1508) >> uint(2)));
        uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
        int _1514 = int(_1510) & 3;
        float _1516 = (*spvDescriptorSet0.vp_c15)._m0[int(_1512)][_1514];
        int _1518 = int(_1510) + 1;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        int _1522 = _1518 & 3;
        float _1524 = (*spvDescriptorSet0.vp_c15)._m0[int(_1520)][_1522];
        int _1526 = _1508 + 8;
        uint _1528 = uint(int(uint(_1526) >> uint(2)));
        uint _1530 = uint(int(uint(int(_1528)) >> uint(2)));
        int _1532 = int(_1528) & 3;
        float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
        int _1536 = int(_1528) + 1;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        int _1540 = _1536 & 3;
        float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
        float _1544 = _756 * _1524;
        float _1546 = fma(_220, _1516, _1544);
        float _1548 = fma(_222, _1534, _1546);
        float _1550 = _1548 + _1542;
        float _1552 = precise::clamp(_1550, 0.0, 1.0);
        float _1554 = -_1552;
        float _1556 = _1554 + _1500;
        float _1558 = fma(_1556, 500.0, 1.5);
        float _1560 = exp2(_1558);
        float _1562 = 0.0 + _1560;
        float _1564 = precise::clamp(_1562, 0.0, 1.0);
        _1125 = as_type<float>(_1508);
        _1504 = _1564;
    }
    float _1566 = _1125;
    float _1568 = _1504;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1572 = _1277 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1576 = _1279 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1580 = _1281 + _1578;
    float _1582 = _1572 * _1572;
    float _1584 = fma(_1576, _1576, _1582);
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = fma(_1580, _1580, _1584);
    float _1590 = rsqrt(_1588);
    float _1592 = sqrt(_1588);
    float _1594 = _1576 * _1590;
    float _1596 = _1580 * _1590;
    float _1598 = _1572 * _1590;
    float _1600 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 + _1606;
    float _1610 = sqrt(_1608);
    bool _1612 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1610 + _1614;
    float _1618 = _220;
    float _1620 = _1616;
    float _1622 = _1586;
    float _1624 = _1590;
    float _1626 = _1600;
    float _1628 = _1604;
    float _1630 = _1606;
    if (_1612)
    {
        float _1632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1632;
    }
    float _1634 = _1618;
    if (_1612)
    {
        float _1636 = _1616 * _1634;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = precise::max(0.0, _1586);
    float _1642 = _1640;
    if (_1612)
    {
        float _1644 = rsqrt(_1608);
        _1622 = _1644;
    }
    float _1646 = _1622;
    float _1648 = _1646;
    if (_1612)
    {
        float _1650 = _1638 * 0.15915493667125701904296875;
        _400 = _1650;
    }
    float _1652 = _400;
    float _1654 = -_1598;
    float _1656 = -_1640;
    float _1658 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1656);
    if (_1612)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1660;
    }
    float _1662 = _1642;
    float _1664 = _1566;
    float _1666 = _1662;
    if (_1612)
    {
        float _1668 = _1652 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = _1638;
    if (_1612)
    {
        float _1676 = _1652 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1672;
    if (_1612)
    {
        float _1684 = fma(_1672, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1666 = _1684;
    }
    float _1686 = _1666;
    float _1688 = _1686;
    if (_1612)
    {
        float _1690 = _1646 * _1686;
        _1682 = _1690;
    }
    float _1692 = _1682;
    if (!_1612)
    {
        _1648 = _1658;
    }
    float _1694 = _1648;
    float _1696 = _1694;
    if (_1612)
    {
        float _1698 = _1680 + (-1.0);
        _1624 = _1698;
    }
    float _1700 = _1624;
    float _1702 = _1700;
    if (_1612)
    {
        float _1704 = _1600 * _1692;
        _1626 = _1704;
    }
    float _1706 = _1626;
    if (_1612)
    {
        float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1708;
    }
    float _1710 = _1688;
    if (!_1612)
    {
        _1702 = _1602;
    }
    float _1712 = _1702;
    float _1714 = _1712;
    if (_1612)
    {
        float _1716 = _1602 * _1692;
        _1714 = _1716;
    }
    float _1718 = _1714;
    if (_1612)
    {
        float _1720 = _1706 * _1706;
        _1628 = _1720;
    }
    float _1722 = _1628;
    if (_1612)
    {
        float _1724 = fma(_1658, _1680, _1710);
        _1696 = _1724;
    }
    float _1726 = _1696;
    if (_1612)
    {
        float _1728 = _1718 * _1718;
        _1630 = _1728;
    }
    float _1730 = _1630;
    float _1732 = fma(_1726, _1726, _1722);
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1736 = fma(_1592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1734);
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = _1732 + _1730;
    float _1742 = -_1738;
    float _1744 = _1742 + 1.0;
    float _1746 = rsqrt(_1740);
    float _1748 = abs(_1744);
    float _1750 = log2(_1748);
    float _1752 = _1746 * _1706;
    float _1754 = _1746 * _1726;
    float _1756 = _1746 * _1718;
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = _1754 + 1.0;
    float _1762 = -_1758;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1756;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = exp2(_1766);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = fma(_1770, 0.5, 0.5);
    float _1778 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = sqrt(_1774);
    float _1782 = fma(_1776, _1778, -0.212114393711090087890625);
    float _1784 = fma(_1776, _1782, 1.570728778839111328125);
    float _1786 = -_1754;
    float _1788 = fma(_1772, _1760, _1786);
    float _1790 = fma(_1788, 0.5, 0.5);
    float _1792 = _1780 * 0.636619746685028076171875;
    float _1794 = -_1784;
    float _1796 = fma(_1792, _1794, 1.0);
    float2 _5282 = float2(_1796, _1790);
    float3 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5282, float2(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5282, float2(0.0), isnan(_5282)), level(0.0)).xyz;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1810 = in.m_71.y;
    float _1812 = abs(_766);
    float _1814 = log2(_1812);
    bool _1816 = _258 > 0.5;
    float _1818 = _1808 * _248;
    float _1820 = in.m_71.x;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1824 = _1822 != 0;
    float _1826 = -_240;
    float _1828 = _1826 + 1.0;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1832 = _1830 != 0;
    out.m_73.x = _1279;
    out.m_73.y = _1277;
    out.m_73.z = _1281;
    float _1834 = trunc(_1818);
    int _1836 = int(_1834);
    bool _1838 = _710 != 0.0;
    bool _1840 = isnan(_710);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan(0.0);
    bool _1846 = _1842 || _1844;
    bool _1848 = _248 > 0.5;
    bool _1850 = _1848 && _1832;
    bool _1852 = _708 == 0.0;
    bool _1854 = !_1846;
    bool _1856 = _1852 && _1854;
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1860 = _712 == 0.0;
    bool _1862 = _1860 && _1856;
    float _1864 = -_1810;
    float _1866 = _1864 + 1.0;
    int _1868 = _1836 << 4;
    int _1870 = _1868 + 1712;
    float _1872 = _1810;
    if (_1824)
    {
        float _1874 = _1816 ? _1866 : _1810;
        _1872 = _1874;
    }
    float _1876 = _1872;
    int _1878 = _1870 + 8;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
    int _1884 = int(_1880) & 3;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[int(_1882)][_1884];
    float _1888 = in.m_75.x;
    float _1890 = in.m_75.y;
    float _1892 = in.m_75.z;
    float _1894 = 0.0;
    if (_1832)
    {
        _1894 = _1820;
    }
    float _1896 = _1894;
    float _1898 = _1896;
    if (!_1832)
    {
        _402 = _1820;
    }
    float _1900 = _402;
    float _1902 = _1900;
    if (_1850)
    {
        float _1904 = -_1896;
        float _1906 = _1904 + 1.0;
        _1898 = _1906;
    }
    float _1908 = _1898;
    uint _1910 = uint(int(uint(_1870) >> uint(2)));
    uint _1912 = uint(int(uint(int(_1910)) >> uint(2)));
    int _1914 = int(_1910) & 3;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[int(_1912)][_1914];
    int _1918 = int(_1910) + 1;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    int _1922 = _1918 & 3;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[int(_1920)][_1922];
    float _1926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1832)
    {
        _1902 = _1908;
    }
    float _1930 = _1902;
    float _1932 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1934 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1936 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1938 = _1932 * _1858;
    float _1940 = _1890;
    float _1942 = _1888;
    float _1944 = _1892;
    if (!_1862)
    {
        float _1946 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1890);
        _1940 = _1946;
    }
    float _1948 = _1940;
    if (!_1862)
    {
        float _1950 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1888);
        _1942 = _1950;
    }
    float _1952 = _1942;
    if (!_1862)
    {
        float _1954 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1892);
        _1944 = _1954;
    }
    float _1956 = _1944;
    float _1958 = _891 * _1948;
    float _1960 = -_1948;
    float _1962 = _881 * _1960;
    float _1964 = _893 * _1948;
    float _1966 = fma(_933, _1952, _1958);
    float _1968 = fma(_899, _1952, _1962);
    float _1970 = _1936 * _1926;
    float _1972 = fma(_925, _1952, _1964);
    float _1974 = fma(_929, _1956, _1966);
    float _1976 = fma(_901, _1956, _1968);
    float _1978 = fma(_943, _1956, _1972);
    float _1980 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1984 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_77.x = _1970;
    out.m_77.y = _1938;
    float _1986 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1980);
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1982);
    float _1990 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1984);
    float _1992 = _1886 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1994 = exp2(_1934);
    float _1996 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2000 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2002 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2008 = precise::clamp(_2006, 0.0, 1.0);
    out.m_79.x = _2002;
    out.m_79.y = _2004;
    out.m_79.z = _1996;
    out.m_79.w = _1928;
    float _2010 = fma(_2008, -2.0, 3.0);
    float _2012 = _2008 * _2008;
    float _2014 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1986);
    bool _2016 = _766 <= 8000.0;
    bool _2018 = isnan(_766);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(8000.0);
    bool _2024 = _2020 || _2022;
    float _2026 = float(_2024);
    float _2028 = _2012 * _2010;
    float _2030 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1988);
    float _2032 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1990);
    float _2034 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2036 = -_2028;
    float _2038 = _2036 + 1.0;
    float _2040 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _2030;
    out.m_81.y = _2032;
    out.m_81.z = _2014;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2028);
    float _2044 = exp2(_2034);
    float _2046 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2040);
    float _2048 = _2026 * _2042;
    float _2050 = _2026;
    float _2052 = _1411;
    if (!_1369)
    {
        _2050 = 1.0;
    }
    float _2054 = _2050;
    float _2056 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2058 = _2054;
    if (_1369)
    {
        bool _2060 = _1481 >= _1441;
        bool _2062 = isnan(_1481);
        bool _2064 = _2060 || _2062;
        bool _2066 = isnan(_1441);
        bool _2068 = _2064 || _2066;
        float _2070 = float(_2068);
        _2058 = _2070;
    }
    float _2072 = _2058;
    float _2074 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2076 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2056);
    float _2078 = _1828 * _2074;
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    float _2082 = _2072 * _1568;
    float _2084 = _2076 + _1387;
    bool _2086 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2088 = isnan(_1592);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2094 = _2090 || _2092;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _2076;
    out.gl_Position.w = _1387;
    float _2096 = -_2044;
    float _2098 = _2096 + 1.0;
    float _2100 = _2084 * 0.5;
    float _2102 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2104 = -_2080;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.z = _2100;
    out.m_85.w = _1387;
    float _2108 = _2102 * _1483;
    float _2110 = -_2082;
    float _2112 = fma(_2110, _2106, 1.0);
    float _2114 = precise::clamp(_2112, 0.0, 1.0);
    float _2116 = -_2102;
    float _2118 = _2116 + 1.0;
    float _2120 = _1494 * _2108;
    float _2122 = _2114 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2124 = _1494 * _2118;
    float _2126 = _2114;
    float _2128 = _2076;
    float _2130 = _2120;
    if (!_2094)
    {
        _2126 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2132 = _2126;
    float _2134 = _2132;
    float _2136 = _2132;
    if (!_2094)
    {
        _1399 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2138 = _1399;
    out.m_87.x = _2122;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2094)
    {
        _2128 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2144 = _2128;
    float _2146 = _2144;
    float _2148 = _2144;
    if (!_2094)
    {
        _1429 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2150 = _1429;
    float _2152 = _2150;
    float _2154 = _2150;
    if (!_2094)
    {
        _2052 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2156 = _2052;
    float _2158 = _1806 * _2108;
    float _2160 = fma(_1802, _2120, _1488);
    float _2162 = fma(_1804, _2120, _1490);
    float _2164 = _2156;
    float _2166 = _2156;
    if (!_2094)
    {
        _2130 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2168 = _2130;
    float _2170 = fma(_1494, _2158, _1492);
    out.m_89.x = _2160;
    out.m_89.y = _2162;
    out.m_89.z = _2170;
    out.m_89.w = _2124;
    bool _2172 = !_2094;
    float _2174 = _2168;
    float _2176 = _2168;
    if (!_2172)
    {
        bool _2178 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2180 = isnan(_1592);
        bool _2182 = _2178 || _2180;
        bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2186 = _2182 || _2184;
        if (!_2186)
        {
            float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2190 = _1592 + _2188;
            float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2194 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2192;
            float _2196 = 1.0 / _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2212 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2218 = _2190 * _2196;
            float _2220 = precise::clamp(_2218, 0.0, 1.0);
            float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2226 = fma(_2220, _2200, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2228 = fma(_2220, _2224, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2230 = fma(_2220, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2232 = fma(_2220, _2208, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2234 = fma(_2220, _2212, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2236 = fma(_2220, _2216, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2142 = _2228;
            _2166 = _2234;
            _2136 = _2226;
            _2154 = _2232;
            _2148 = _2230;
            _2176 = _2236;
            _2238 = true;
        }
        else
        {
            bool _2240 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2242 = isnan(_1592);
            bool _2244 = _2240 || _2242;
            bool _2246 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2248 = _2244 || _2246;
            if (!_2248)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2250 = _2134;
            _2136 = _2250;
            if (!_2248)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2252 = _2140;
            _2142 = _2252;
            if (!_2248)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2254 = _2146;
            _2148 = _2254;
            if (!_2248)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2256 = _2152;
            _2154 = _2256;
            if (!_2248)
            {
                _2164 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2258 = _2164;
            _2166 = _2258;
            if (!_2248)
            {
                _2174 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2260 = _2174;
            bool _2262 = !_2248;
            _2176 = _2260;
            if (!_2262)
            {
                bool _2264 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2266 = isnan(_1592);
                bool _2268 = _2264 || _2266;
                bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2272 = _2268 || _2270;
                if (!_2272)
                {
                    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2276 = _1592 + _2274;
                    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2280 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2278;
                    float _2282 = 1.0 / _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2304 = _2276 * _2282;
                    float _2306 = precise::clamp(_2304, 0.0, 1.0);
                    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2312 = fma(_2306, _2286, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2314 = fma(_2306, _2310, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2316 = fma(_2306, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2318 = fma(_2306, _2294, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2320 = fma(_2306, _2298, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2322 = fma(_2306, _2302, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2142 = _2314;
                    _2166 = _2320;
                    _2136 = _2312;
                    _2154 = _2318;
                    _2148 = _2316;
                    _2176 = _2322;
                    _2238 = true;
                }
                else
                {
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2166 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2176 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2238 = false;
    float _2324 = _2142;
    float _2326 = _2166;
    float _2328 = _2136;
    float _2330 = _2154;
    float _2332 = _2148;
    float _2334 = _2176;
    float _2336 = fma(_2032, -0.5, 0.5);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = -_2324;
    float _2342 = _2340 + _2326;
    float _2344 = -_2328;
    float _2346 = _2344 + _2330;
    float _2348 = -_2332;
    float _2350 = _2348 + _2334;
    bool _2352 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2354 = fma(_2338, _2342, _2324);
    float _2356 = fma(_2338, _2346, _2328);
    float _2358 = fma(_2338, _2350, _2332);
    float _2360 = _2354 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _2362 = fma(_2356, 0.298911988735198974609375, _2360);
    float _2364 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2366 = fma(_2358, 0.114477999508380889892578125, _2362);
    out.m_59.x = _2364;
    float _2368 = -_2366;
    float _2370 = _2356 + _2368;
    float _2372 = -_2366;
    float _2374 = _2354 + _2372;
    float _2376 = -_2366;
    float _2378 = _2358 + _2376;
    out.m_93.x = 0.0;
    float _2380 = fma(_2370, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    float _2382 = fma(_2374, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    float _2384 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    out.m_95.x = _2380;
    out.m_95.y = _2382;
    out.m_95.z = _2384;
    if (!_2352)
    {
        return out;
    }
    float _2386 = -_1277;
    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2390 = -_1279;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2394 = -_1281;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2398 = _2388 * _2388;
    float _2400 = fma(_2392, _2392, _2398);
    float _2402 = fma(_2396, _2396, _2400);
    float _2404 = rsqrt(_2402);
    float _2406 = _2388 * _2404;
    float _2408 = _2392 * _2404;
    float _2410 = _2396 * _2404;
    float _2412 = sqrt(_2402);
    float _2414 = -_1598;
    float _2416 = _2414 + _2406;
    float _2418 = -_1594;
    float _2420 = _2418 + _2408;
    float _2422 = -_1596;
    float _2424 = _2422 + _2410;
    float _2426 = _2416 * _2416;
    float _2428 = fma(_2420, _2420, _2426);
    float _2430 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = fma(_2424, _2424, _2428);
    float _2436 = _2432 * _2432;
    float _2438 = -_2412;
    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2442 = _2436 + (-1.0);
    float _2444 = rsqrt(_2434);
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = abs(_2448);
    float _2452 = log2(_2450);
    float _2454 = _2416 * _2444;
    float _2456 = _2420 * _2444;
    float _2458 = _2424 * _2444;
    float _2460 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2462 = _2032 * _2454;
    float _2464 = _2032 * _2406;
    float _2466 = fma(_2030, _2456, _2462);
    float _2468 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2470 = fma(_2030, _2408, _2464);
    float _2472 = fma(_2014, _2458, _2466);
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2014, _2410, _2470);
    float _2478 = precise::clamp(_2476, 0.0, 1.0);
    float _2480 = exp2(_2468);
    float _2482 = _2474 * _2474;
    float _2484 = fma(_2482, _2442, 1.0);
    float _2486 = -_2406;
    float _2488 = -_2460;
    float _2490 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2488);
    float _2492 = _2484 * _2484;
    float _2494 = -_2410;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2490);
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2500 = _2496 + _2498;
    float _2502 = 1.0 / _2492;
    float _2504 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = _2480 * _2506;
    float _2510 = _2478 * _2508;
    float _2512 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2514 = _2436 * _2502;
    float _2516 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2520 = _2510 * _2514;
    out.m_91.x = _2512;
    out.m_91.y = _2516;
    out.m_91.z = _2518;
    float _2522 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2524 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2526 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2522;
    out.m_93.y = _2524;
    out.m_93.z = _2526;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2238 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_56.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_59.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2583 = as_type<float>(_130);
        out.gl_Position.z = _2583;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_61.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_59.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2652 = as_type<float>(_168);
        out.gl_Position.z = _2652;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _172 = !_170;
    float _190;
    if (!_172)
    {
        float _174 = in.m_63.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_114);
        float _196 = 1.0 / _194;
        float _198 = _148 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = in.m_56.x;
    float _204 = in.m_56.y;
    float _206 = in.m_56.z;
    float _208 = _204 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _212 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[4].x, _208);
    float _214 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].z, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].z, _214);
    float _220 = _216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _222 = _218 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _228 = floor(_224);
    float _230 = floor(_226);
    float _232 = -_228;
    float _234 = _224 + _232;
    float _236 = -_230;
    float _238 = _226 + _236;
    float2 _2779 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2779, float2(0.0), isnan(_2779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2779, float2(0.0), isnan(_2779)), level(0.0)).x;
    float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _244 = log2(_242);
    float _246 = in.m_63.z;
    float _248 = in.m_63.x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = in.m_63.y;
    float _260 = 1.0 / _252;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _276 = _274 != 0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _280 = 1.0 + _278;
    float _282 = _244 * _148;
    bool _284 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _292 = _288 || _290;
    float _294 = 1.0 / _256;
    float _296 = _204 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _200 + _298;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _310 = _306 || _308;
    float _312 = fma(_202, (*spvDescriptorSet0.vp_c10)._m0[5].x, _296);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _200 + _314;
    float _318 = exp2(_282);
    float _320 = _246 * 2.0;
    float _322 = _300 * _260;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = _200 + _324;
    float _328 = _258 + _246;
    float _330 = 1.0 / _264;
    float _332 = _316 * _294;
    float _334 = _328 + (-1.0);
    float _336 = _248 + _258;
    float _338 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].z, _312);
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _342 = _248 + _246;
    float _344 = 1.0 / _280;
    float _346 = _248 * 2.0;
    float _348 = -_318;
    float _350 = _348 + 1.0;
    float _352 = _342 + (-1.0);
    float _354 = _336 + (-1.0);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = _310 ? _350 : 0.0;
    float _362 = floor(_320);
    float _364 = _258 * 2.0;
    float _366 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _368 = _326 * _330;
    bool _370 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_200);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_200);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _338 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _398 = floor(_346);
    float _400 = _222;
    float _402 = _258;
    if (_292)
    {
        float _404 = _360 * _344;
        _152 = _404;
    }
    float _406 = _152;
    float _408 = _246 + (-0.5);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    float _414 = floor(_364);
    bool _416 = _362 >= 0.0;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _430 = _362 > 0.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    int _436 = _424 ? 0 : 1;
    float _438 = fma(_428, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _440 = _398 >= 0.0;
    bool _442 = isnan(_398);
    bool _444 = _440 || _442;
    bool _446 = isnan(0.0);
    bool _448 = _444 || _446;
    float _450 = fma(_434, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _456 = _398 > 0.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    int _462 = _448 ? 0 : 1;
    float _464 = -_380;
    float _466 = _464 + 1.0;
    float _468 = fma(_454, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _470 = _414 > 0.0;
    float _472 = fma(_460, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _474 = _414 >= 0.0;
    bool _476 = isnan(_414);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = fma(_412, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = _394 * _466;
    float _492 = -_394;
    float _494 = _492 + 1.0;
    float _496 = fma(_488, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _498 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _500 = isnan(_200);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    bool _510 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _512 = isnan(_200);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _522;
    float _526 = -_520;
    float _528 = _526 + 1.0;
    float _530 = _520 * _494;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = fma(_524, _368, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = _508 * _528;
    float _540 = -_508;
    float _542 = _540 + 1.0;
    float _544 = fma(_534, _368, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _546 = _482 ? 0 : 1;
    float _548 = _484 * _538;
    float _550 = _450 * _538;
    float _552 = _472 * _538;
    float _554 = fma(_358, _368, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _556 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].x, _548);
    float _558 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].y, _550);
    float _560 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    bool _562 = !_268;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_438, _530, _556);
    float _568 = fma(_496, _530, _558);
    int _570 = ~_546;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = fma(_468, _530, _560);
    int _578 = abs(_564);
    float _580 = _396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _582 = in.m_65.x;
    float _584 = in.m_65.y;
    float _586 = in.m_65.z;
    int _588 = _574;
    int _590 = 2;
    if (!_470)
    {
        int _592 = ~_546;
        int _594 = _592 + 1;
        _588 = _594;
    }
    int _596 = _588;
    float _598 = _396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _600 = ~_436;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    float _606 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].x, _580);
    int _608 = ~_462;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = fma(_554, _490, _576);
    int _616 = _604;
    int _618 = _612;
    if (!_430)
    {
        int _620 = ~_436;
        int _622 = _620 + 1;
        _616 = _622;
    }
    int _624 = _616;
    float _626 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].z, _606);
    if (!_456)
    {
        int _628 = ~_462;
        int _630 = _628 + 1;
        _618 = _630;
    }
    int _632 = _618;
    float _634 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].x, _598);
    float _636 = float(_578);
    float _638 = _626 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _640 = float(_624);
    float _642 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].z, _634);
    bool _644 = !_272;
    int _646 = _644 ? 0 : 1;
    float _648 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].z, _614);
    float _650 = _636 * _640;
    int _652 = abs(_646);
    float _654 = _642 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _656 = fma(_544, _490, _566);
    float _658 = fma(_536, _490, _568);
    float _660 = _650 * (-2.0);
    float _662 = 1.0 / _654;
    float _664 = _638 + _654;
    bool _666 = !_276;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_382, _660, _382);
    float _672 = fma(_660, _582, _582);
    float _674 = _248 + (-0.5);
    float _676 = float(_652);
    float _678 = _258 + (-0.5);
    float _680 = float(_632);
    float _682 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].x, _672);
    int _684 = abs(_668);
    float _686 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].x, _656);
    float _688 = _676 * _680;
    float _690 = in.m_67.x;
    float _692 = in.m_67.y;
    float _694 = in.m_67.z;
    float _696 = fma(_670, _406, _682);
    float _698 = float(_596);
    float _700 = _688 * (-2.0);
    float _702 = float(_684);
    float _704 = _664 * _662;
    float _706 = _704 * 0.5;
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_700, _584, _584);
    float _716 = fma(_340, _700, _340);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[30].w, _718);
    float _722 = _702 * _698;
    float _724 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].y, _714);
    float _726 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].y, _658);
    float _728 = 1.0 / _720;
    float _730 = _722 * (-2.0);
    float _732 = fma(_716, _406, _724);
    float _734 = _696 * 0.15915493667125701904296875;
    float _736 = fma(_730, _586, _586);
    float _738 = _732 * 0.15915493667125701904296875;
    float _740 = fma(_366, _730, _366);
    float _742 = _734 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _748 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _750 = _686 * _690;
    float _752 = _726 * _692;
    float _754 = fma(_740, _406, _746);
    float _756 = _396 + _748;
    float _758 = _750 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _766 = _728 * _764;
    float _768 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _770 = _754 * 0.15915493667125701904296875;
    float _772 = _756 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _774 = _648 * _694;
    float _776 = _758 * _760;
    float _778 = _768 * _762;
    bool _780 = _766 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _782 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    bool _784 = _766 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _786 = _734 * 6.283185482025146484375;
    float _788 = cos(_786);
    bool _790 = !_780;
    int _792 = _790 ? 0 : 1;
    float _794 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].z, _782);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _798 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _800 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _802 = isnan(0.5);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _808 = _804 || _806;
    float _810 = _794 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _812 = _738 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _798 * _796;
    if (!_780)
    {
        _590 = 1;
    }
    int _818 = _590;
    int _820 = _818;
    if (!_784)
    {
        _820 = _792;
    }
    int _822 = _820;
    float _824 = _738 * 6.283185482025146484375;
    float _826 = cos(_824);
    int _828 = _822 << 6;
    int _830 = _828 + 96;
    uint _833 = uint(int(uint(_830) >> uint(2)));
    uint _835 = uint(int(uint(int(_833)) >> uint(2)));
    int _837 = int(_833) & 3;
    float _839 = (*spvDescriptorSet0.vp_c15)._m0[int(_835)][_837];
    int _841 = int(_833) + 1;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    int _845 = _841 & 3;
    float _847 = (*spvDescriptorSet0.vp_c15)._m0[int(_843)][_845];
    float _849 = _770 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = _756 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _855 = _788 * _814;
    float _857 = _744 * _814;
    float _859 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[127].x, _853);
    int _861 = _828 + 48;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    uint _865 = uint(int(uint(int(_863)) >> uint(2)));
    int _867 = int(_863) & 3;
    float _869 = (*spvDescriptorSet0.vp_c15)._m0[int(_865)][_867];
    int _871 = int(_863) + 1;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    int _875 = _871 & 3;
    float _877 = (*spvDescriptorSet0.vp_c15)._m0[int(_873)][_875];
    float _879 = _770 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].z, _859);
    float _885 = _744 * _826;
    float _887 = _788 * _826;
    float _889 = _883 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _891 = _788 * _851;
    float _893 = _744 * _851;
    float _895 = trunc(_810);
    int _897 = int(_895);
    float _899 = _826 * _851;
    float _901 = _814 * _851;
    float _903 = _893 * _778;
    int _905 = _828 + 64;
    uint _907 = uint(int(uint(_905) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    float _923 = -_855;
    float _925 = fma(_881, _885, _923);
    float _927 = -_885;
    float _929 = fma(_881, _855, _927);
    float _931 = _891 * _778;
    float _933 = fma(_881, _887, _857);
    float _935 = -_778;
    float _937 = _881 * _935;
    float _939 = trunc(_889);
    int _941 = int(_939);
    float _943 = fma(_881, _857, _887);
    float _945 = fma(_933, _776, _931);
    float _947 = fma(_899, _776, _937);
    int _949 = _828 + 104;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.vp_c15)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    float _967 = fma(_925, _776, _903);
    float _969 = fma(_929, _816, _945);
    float _971 = fma(_901, _816, _947);
    int _973 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _975 = _897 + _973;
    int _977 = _975 + 1;
    float _979 = fma(_943, _816, _967);
    float _981 = _969 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _983 = _969 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _985 = _828 + 72;
    uint _987 = uint(int(uint(_985) >> uint(2)));
    uint _989 = uint(int(uint(int(_987)) >> uint(2)));
    int _991 = int(_987) & 3;
    float _993 = (*spvDescriptorSet0.vp_c15)._m0[int(_989)][_991];
    int _995 = int(_987) + 1;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    int _999 = _995 & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    bool _1003 = _977 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1005 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[10].x, _981);
    float _1007 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[8].x, _983);
    int _1009 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1011 = _941 + _1009;
    int _1013 = _1011 + 1;
    float _1015 = _756 * _847;
    float _1017 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1005);
    float _1019 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1007);
    int _1021 = _828 + 56;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    int _1031 = int(_1023) + 1;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    int _1035 = _1031 & 3;
    float _1037 = (*spvDescriptorSet0.vp_c15)._m0[int(_1033)][_1035];
    int _1039 = _977 | _1013;
    float _1041 = _222 + _1017;
    float _1043 = _220 + _1019;
    float _1045 = fma(_220, _839, _1015);
    bool _1047 = _1039 < 0;
    bool _1049 = _1047 || _1003;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1053 = _1041 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1043 + _1055;
    int _1059 = _828 + 80;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    bool _1077 = _1013 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1079 = _1077 || _1049;
    float _1081 = _1053 * _1053;
    float _1083 = _969 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1085 = fma(_1057, _1057, _1081);
    float _1087 = _756 * _877;
    float _1089 = fma(_971, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1083);
    float _1091 = sqrt(_1085);
    float _1093 = fma(_220, _869, _1087);
    float _1095 = fma(_979, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1089);
    float _1097 = _756 * _921;
    uint _1099 = as_type<uint>(_969);
    int _1101 = as_type<int>(_913);
    int _1103 = as_type<int>(_1045);
    int _1105 = as_type<int>(_1089);
    float _1107 = _1041;
    float _1109 = _1057;
    float _1111 = _971;
    if (!_1079)
    {
        int _1113 = _1013 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1115 = _1113 + _977;
        _1099 = uint(_1115);
    }
    uint _1117 = _1099;
    float _1119 = fma(_220, _913, _1097);
    float _1121 = _1083;
    float _1123 = _1119;
    float _1125 = as_type<float>(_1117);
    if (!_1079)
    {
        float _1127 = floor(_810);
        _1121 = _1127;
    }
    float _1129 = _1121;
    if (!_1079)
    {
        uint _1131 = uint(int(uint(int(_1117)) >> uint(2)));
        _1101 = int(_1131);
    }
    int _1133 = _1101;
    float _1135 = fma(_222, _957, _1045);
    float _1137 = as_type<float>(_1133);
    if (!_1079)
    {
        int _1139 = int(_1117) << 2;
        _1103 = _1139;
    }
    int _1141 = _1103;
    bool _1143 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1145 = _1135 + _965;
    if (!_1079)
    {
        int _1147 = 12 & _1141;
        _1105 = _1147;
    }
    int _1149 = _1105;
    float _1151 = fma(_222, _993, _1119);
    int _1153 = as_type<int>(_993);
    if (!_1079)
    {
        int _1155 = _1133 << 4;
        int _1157 = _1155 + _1149;
        _1153 = _1157;
    }
    int _1159 = _1153;
    float _1161 = 1.0 / _1145;
    float _1163 = _396 + _1095;
    float _1165 = _1151 + _1001;
    float _1167 = fma(_222, _1029, _1093);
    if (!_1143)
    {
        _1137 = _1043;
    }
    float _1169 = _1137;
    float _1171 = _1169;
    if (!_1143)
    {
        _1123 = _1163;
    }
    float _1173 = _1123;
    float _1175 = _1167 + _1037;
    bool _1177 = !_1143;
    float _1179 = _1173;
    float _1181 = _1075;
    if (!_1177)
    {
        float _1183 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1187 = _1091 + _1185;
        float _1189 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = rsqrt(_1085);
        float _1193 = _1187 * _1183;
        float _1195 = _1193 * 0.15915493667125701904296875;
        float _1197 = _1195 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        float _1201 = _1195 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = _1199 + (-1.0);
        float _1207 = _1205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = fma(_1203, _1189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1211 = fma(_1163, _1199, _1207);
        float _1213 = _1191 * _1209;
        float _1215 = fma(_1057, _1213, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1217 = fma(_1053, _1213, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1107 = _1217;
        _1171 = _1215;
        _1179 = _1211;
    }
    float _1219 = _1107;
    float _1221 = _1171;
    float _1223 = _1179;
    float _1225 = _1223;
    float _1227 = _1221;
    if (_808)
    {
        _1109 = _1219;
    }
    float _1229 = _1109;
    float _1231 = _1229;
    if (!_808)
    {
        float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1235 = _396 + _1233;
        float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1239 = _220 + _1237;
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1243 = -_220;
        float _1245 = _1243 + _1221;
        float _1247 = _1235 * _1235;
        float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1251 = _222 + _1249;
        float _1253 = fma(_1239, _1239, _1247);
        float _1255 = -_396;
        float _1257 = _1255 + _1223;
        float _1259 = fma(_1251, _1251, _1253);
        float _1261 = sqrt(_1259);
        float _1263 = precise::min(_1261, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1265 = _1263 * _1241;
        float _1267 = -_222;
        float _1269 = _1267 + _1219;
        float _1271 = fma(_1257, _1265, _396);
        float _1273 = fma(_1245, _1265, _220);
        float _1275 = fma(_1269, _1265, _222);
        _1225 = _1271;
        _1227 = _1273;
        _1231 = _1275;
    }
    float _1277 = _1225;
    float _1279 = _1227;
    float _1281 = _1231;
    int _1283 = _828 + 88;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.vp_c15)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    float _1301 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1303 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = _1175 * _1161;
    float _1309 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1301);
    float _1311 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1313 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1315 = _1043;
    if (!_1079)
    {
        int _1317 = _1159 + 400;
        uint _1319 = uint(int(uint(_1317) >> uint(2)));
        uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
        int _1323 = int(_1319) & 3;
        float _1325 = (*spvDescriptorSet0.vp_c15)._m0[int(_1321)][_1323];
        _1315 = _1325;
    }
    float _1327 = _1315;
    float _1329 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1309);
    bool _1331 = _1307 >= 0.0;
    float _1333 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1311);
    float _1335 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1313);
    float _1337 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1339 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1341 = _1165 * _1161;
    bool _1343 = _1307 <= 1.0;
    bool _1345 = _1343 && _1331;
    float _1347 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1349 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1337);
    float _1351 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1353 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1355 = _1341 >= 0.0;
    bool _1357 = _1355 && _1345;
    float _1359 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1349);
    float _1361 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1351);
    float _1363 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1367 = _1341 <= 1.0;
    bool _1369 = _1367 && _1357;
    float _1371 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1375 = _756 * _1075;
    float _1377 = -_1365;
    float _1379 = fma(_1377, _1363, 1.0);
    float _1381 = _1093;
    if (!_1079)
    {
        float _1383 = floor(_889);
        _1381 = _1383;
    }
    float _1385 = _1381;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1373);
    float _1389 = fma(_220, _1067, _1375);
    float _1391 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1393 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1395 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1391);
    float _1397 = log2(_1379);
    float _1399 = _1387;
    if (_1369)
    {
        float _1401 = float(_822);
        _1181 = _1401;
    }
    float _1403 = _1181;
    float _1405 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1393);
    float _1407 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1409 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1405);
    float _1411 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1407);
    float _1413 = 1.0 / _1387;
    float _1415 = fma(_222, _1291, _1389);
    if (!_1079)
    {
        float _1417 = -_1385;
        float _1419 = _889 + _1417;
        _1111 = _1419;
    }
    float _1421 = _1111;
    float _1423 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    float _1425 = _1415 + _1299;
    float _1427 = _1375;
    float _1429 = _1423;
    if (_1369)
    {
        float _1431 = rint(_1403);
        float _1433 = precise::max(_1431, 0.0);
        uint _1435 = uint(_1433);
        uint _1437 = clamp(_1435, 0u, 65535u);
        _1427 = as_type<float>(_1437);
    }
    float _1439 = _1427;
    float _1441 = _1425 * _1161;
    float _1443 = _1397 * 0.693147182464599609375;
    float _1445 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1447 = _1443;
    if (!_1079)
    {
        float _1449 = -_1129;
        float _1451 = _810 + _1449;
        _1447 = _1451;
    }
    float _1453 = _1447;
    float _1455 = _1425;
    if (!_1079)
    {
        float _1457 = rint(_1327);
        float _1459 = precise::max(_1457, 0.0);
        uint _1461 = uint(_1459);
        uint _1463 = clamp(_1461, 0u, 65535u);
        _1455 = as_type<float>(_1463);
    }
    float _1465 = _1455;
    float _1467 = _1411 * _1413;
    float _1469 = _1423 * _1413;
    float _1471 = fma(_1467, 0.5, 0.5);
    float _1473 = fma(_1469, -0.5, 0.5);
    float _1475 = _810;
    float _1477 = _1413;
    if (_1369)
    {
        float3 _4770 = float3(_1307, _1341, float(as_type<int>(_1439)));
        float3 _4774 = select(_4770, float3(0.0), isnan(_4770));
        float _1479 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4774.xy, uint(rint(_4774.z)), _1441, level(0.0));
        _1475 = _1479;
    }
    float _1481 = _1475;
    float3 _4784 = float3(_1471, _1473, _1445);
    float _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4784, float3(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4784, float3(0.0), isnan(_4784)), level(0.0)).x;
    float3 _4793 = float3(_1471, _1473, _1445);
    float4 _1486 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4793, float3(0.0), isnan(_4793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4793, float3(0.0), isnan(_4793)), level(0.0)).xyzw;
    float _1488 = _1486.x;
    float _1490 = _1486.y;
    float _1492 = _1486.z;
    float _1494 = _1486.w;
    float _1496 = _1363;
    if (!_1079)
    {
        float3 _4816 = float3(_1453, _1421, float(as_type<int>(_1465)));
        float3 _4818 = select(_4816, float3(0.0), isnan(_4816));
        float _1498 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4818.xy, uint(rint(_4818.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4818.xy, uint(rint(_4818.z)), level(0.0)).x;
        _1496 = _1498;
    }
    float _1500 = _1496;
    if (_1079)
    {
        _1477 = 1.0;
    }
    float _1502 = _1477;
    float _1504 = _1502;
    if (!_1079)
    {
        int _1506 = int(_1117) << 4;
        int _1508 = _1506 + 2048;
        uint _1510 = uint(int(uint(_1508) >> uint(2)));
        uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
        int _1514 = int(_1510) & 3;
        float _1516 = (*spvDescriptorSet0.vp_c15)._m0[int(_1512)][_1514];
        int _1518 = int(_1510) + 1;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        int _1522 = _1518 & 3;
        float _1524 = (*spvDescriptorSet0.vp_c15)._m0[int(_1520)][_1522];
        int _1526 = _1508 + 8;
        uint _1528 = uint(int(uint(_1526) >> uint(2)));
        uint _1530 = uint(int(uint(int(_1528)) >> uint(2)));
        int _1532 = int(_1528) & 3;
        float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
        int _1536 = int(_1528) + 1;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        int _1540 = _1536 & 3;
        float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
        float _1544 = _756 * _1524;
        float _1546 = fma(_220, _1516, _1544);
        float _1548 = fma(_222, _1534, _1546);
        float _1550 = _1548 + _1542;
        float _1552 = precise::clamp(_1550, 0.0, 1.0);
        float _1554 = -_1552;
        float _1556 = _1554 + _1500;
        float _1558 = fma(_1556, 500.0, 1.5);
        float _1560 = exp2(_1558);
        float _1562 = 0.0 + _1560;
        float _1564 = precise::clamp(_1562, 0.0, 1.0);
        _1125 = as_type<float>(_1508);
        _1504 = _1564;
    }
    float _1566 = _1125;
    float _1568 = _1504;
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1572 = _1277 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1576 = _1279 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1580 = _1281 + _1578;
    float _1582 = _1572 * _1572;
    float _1584 = fma(_1576, _1576, _1582);
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = fma(_1580, _1580, _1584);
    float _1590 = rsqrt(_1588);
    float _1592 = sqrt(_1588);
    float _1594 = _1576 * _1590;
    float _1596 = _1580 * _1590;
    float _1598 = _1572 * _1590;
    float _1600 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 + _1606;
    float _1610 = sqrt(_1608);
    bool _1612 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1610 + _1614;
    float _1618 = _220;
    float _1620 = _1616;
    float _1622 = _1586;
    float _1624 = _1590;
    float _1626 = _1600;
    float _1628 = _1604;
    float _1630 = _1606;
    if (_1612)
    {
        float _1632 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1632;
    }
    float _1634 = _1618;
    if (_1612)
    {
        float _1636 = _1616 * _1634;
        _1620 = _1636;
    }
    float _1638 = _1620;
    float _1640 = precise::max(0.0, _1586);
    float _1642 = _1640;
    if (_1612)
    {
        float _1644 = rsqrt(_1608);
        _1622 = _1644;
    }
    float _1646 = _1622;
    float _1648 = _1646;
    if (_1612)
    {
        float _1650 = _1638 * 0.15915493667125701904296875;
        _400 = _1650;
    }
    float _1652 = _400;
    float _1654 = -_1598;
    float _1656 = -_1640;
    float _1658 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1656);
    if (_1612)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1660;
    }
    float _1662 = _1642;
    float _1664 = _1566;
    float _1666 = _1662;
    if (_1612)
    {
        float _1668 = _1652 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = _1638;
    if (_1612)
    {
        float _1676 = _1652 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1672;
    if (_1612)
    {
        float _1684 = fma(_1672, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1666 = _1684;
    }
    float _1686 = _1666;
    float _1688 = _1686;
    if (_1612)
    {
        float _1690 = _1646 * _1686;
        _1682 = _1690;
    }
    float _1692 = _1682;
    if (!_1612)
    {
        _1648 = _1658;
    }
    float _1694 = _1648;
    float _1696 = _1694;
    if (_1612)
    {
        float _1698 = _1680 + (-1.0);
        _1624 = _1698;
    }
    float _1700 = _1624;
    float _1702 = _1700;
    if (_1612)
    {
        float _1704 = _1600 * _1692;
        _1626 = _1704;
    }
    float _1706 = _1626;
    if (_1612)
    {
        float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1708;
    }
    float _1710 = _1688;
    if (!_1612)
    {
        _1702 = _1602;
    }
    float _1712 = _1702;
    float _1714 = _1712;
    if (_1612)
    {
        float _1716 = _1602 * _1692;
        _1714 = _1716;
    }
    float _1718 = _1714;
    if (_1612)
    {
        float _1720 = _1706 * _1706;
        _1628 = _1720;
    }
    float _1722 = _1628;
    if (_1612)
    {
        float _1724 = fma(_1658, _1680, _1710);
        _1696 = _1724;
    }
    float _1726 = _1696;
    if (_1612)
    {
        float _1728 = _1718 * _1718;
        _1630 = _1728;
    }
    float _1730 = _1630;
    float _1732 = fma(_1726, _1726, _1722);
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1736 = fma(_1592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1734);
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = _1732 + _1730;
    float _1742 = -_1738;
    float _1744 = _1742 + 1.0;
    float _1746 = rsqrt(_1740);
    float _1748 = abs(_1744);
    float _1750 = log2(_1748);
    float _1752 = _1746 * _1706;
    float _1754 = _1746 * _1726;
    float _1756 = _1746 * _1718;
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = _1754 + 1.0;
    float _1762 = -_1758;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = -_1756;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1772 = exp2(_1766);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = fma(_1770, 0.5, 0.5);
    float _1778 = fma(_1776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = sqrt(_1774);
    float _1782 = fma(_1776, _1778, -0.212114393711090087890625);
    float _1784 = fma(_1776, _1782, 1.570728778839111328125);
    float _1786 = -_1754;
    float _1788 = fma(_1772, _1760, _1786);
    float _1790 = fma(_1788, 0.5, 0.5);
    float _1792 = _1780 * 0.636619746685028076171875;
    float _1794 = -_1784;
    float _1796 = fma(_1792, _1794, 1.0);
    float2 _5282 = float2(_1796, _1790);
    float3 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5282, float2(0.0), isnan(_5282)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5282, float2(0.0), isnan(_5282)), level(0.0)).xyz;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1810 = in.m_71.y;
    float _1812 = abs(_766);
    float _1814 = log2(_1812);
    bool _1816 = _258 > 0.5;
    float _1818 = _1808 * _248;
    float _1820 = in.m_71.x;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1824 = _1822 != 0;
    float _1826 = -_240;
    float _1828 = _1826 + 1.0;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1832 = _1830 != 0;
    out.m_73.x = _1279;
    out.m_73.y = _1277;
    out.m_73.z = _1281;
    float _1834 = trunc(_1818);
    int _1836 = int(_1834);
    bool _1838 = _710 != 0.0;
    bool _1840 = isnan(_710);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan(0.0);
    bool _1846 = _1842 || _1844;
    bool _1848 = _248 > 0.5;
    bool _1850 = _1848 && _1832;
    bool _1852 = _708 == 0.0;
    bool _1854 = !_1846;
    bool _1856 = _1852 && _1854;
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1860 = _712 == 0.0;
    bool _1862 = _1860 && _1856;
    float _1864 = -_1810;
    float _1866 = _1864 + 1.0;
    int _1868 = _1836 << 4;
    int _1870 = _1868 + 1712;
    float _1872 = _1810;
    if (_1824)
    {
        float _1874 = _1816 ? _1866 : _1810;
        _1872 = _1874;
    }
    float _1876 = _1872;
    int _1878 = _1870 + 8;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
    int _1884 = int(_1880) & 3;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[int(_1882)][_1884];
    float _1888 = in.m_75.x;
    float _1890 = in.m_75.y;
    float _1892 = in.m_75.z;
    float _1894 = 0.0;
    if (_1832)
    {
        _1894 = _1820;
    }
    float _1896 = _1894;
    float _1898 = _1896;
    if (!_1832)
    {
        _402 = _1820;
    }
    float _1900 = _402;
    float _1902 = _1900;
    if (_1850)
    {
        float _1904 = -_1896;
        float _1906 = _1904 + 1.0;
        _1898 = _1906;
    }
    float _1908 = _1898;
    uint _1910 = uint(int(uint(_1870) >> uint(2)));
    uint _1912 = uint(int(uint(int(_1910)) >> uint(2)));
    int _1914 = int(_1910) & 3;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[int(_1912)][_1914];
    int _1918 = int(_1910) + 1;
    uint _1920 = uint(int(uint(_1918) >> uint(2)));
    int _1922 = _1918 & 3;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[int(_1920)][_1922];
    float _1926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1832)
    {
        _1902 = _1908;
    }
    float _1930 = _1902;
    float _1932 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1934 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1936 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1938 = _1932 * _1858;
    float _1940 = _1890;
    float _1942 = _1888;
    float _1944 = _1892;
    if (!_1862)
    {
        float _1946 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1890);
        _1940 = _1946;
    }
    float _1948 = _1940;
    if (!_1862)
    {
        float _1950 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1888);
        _1942 = _1950;
    }
    float _1952 = _1942;
    if (!_1862)
    {
        float _1954 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1892);
        _1944 = _1954;
    }
    float _1956 = _1944;
    float _1958 = _891 * _1948;
    float _1960 = -_1948;
    float _1962 = _881 * _1960;
    float _1964 = _893 * _1948;
    float _1966 = fma(_933, _1952, _1958);
    float _1968 = fma(_899, _1952, _1962);
    float _1970 = _1936 * _1926;
    float _1972 = fma(_925, _1952, _1964);
    float _1974 = fma(_929, _1956, _1966);
    float _1976 = fma(_901, _1956, _1968);
    float _1978 = fma(_943, _1956, _1972);
    float _1980 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1982 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1984 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_77.x = _1970;
    out.m_77.y = _1938;
    float _1986 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1980);
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1982);
    float _1990 = fma(_1976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1984);
    float _1992 = _1886 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1994 = exp2(_1934);
    float _1996 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2000 = _1924 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2002 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2008 = precise::clamp(_2006, 0.0, 1.0);
    out.m_79.x = _2002;
    out.m_79.y = _2004;
    out.m_79.z = _1996;
    out.m_79.w = _1928;
    float _2010 = fma(_2008, -2.0, 3.0);
    float _2012 = _2008 * _2008;
    float _2014 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1986);
    bool _2016 = _766 <= 8000.0;
    bool _2018 = isnan(_766);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(8000.0);
    bool _2024 = _2020 || _2022;
    float _2026 = float(_2024);
    float _2028 = _2012 * _2010;
    float _2030 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1988);
    float _2032 = fma(_1978, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1990);
    float _2034 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2036 = -_2028;
    float _2038 = _2036 + 1.0;
    float _2040 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _2030;
    out.m_81.y = _2032;
    out.m_81.z = _2014;
    float _2042 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2028);
    float _2044 = exp2(_2034);
    float _2046 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2040);
    float _2048 = _2026 * _2042;
    float _2050 = _2026;
    float _2052 = _1411;
    if (!_1369)
    {
        _2050 = 1.0;
    }
    float _2054 = _2050;
    float _2056 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2058 = _2054;
    if (_1369)
    {
        bool _2060 = _1481 >= _1441;
        bool _2062 = isnan(_1481);
        bool _2064 = _2060 || _2062;
        bool _2066 = isnan(_1441);
        bool _2068 = _2064 || _2066;
        float _2070 = float(_2068);
        _2058 = _2070;
    }
    float _2072 = _2058;
    float _2074 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _2076 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2056);
    float _2078 = _1828 * _2074;
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    float _2082 = _2072 * _1568;
    float _2084 = _2076 + _1387;
    bool _2086 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2088 = isnan(_1592);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2094 = _2090 || _2092;
    out.gl_Position.x = _1411;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _2076;
    out.gl_Position.w = _1387;
    float _2096 = -_2044;
    float _2098 = _2096 + 1.0;
    float _2100 = _2084 * 0.5;
    float _2102 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2104 = -_2080;
    float _2106 = fma(_2104, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_85.z = _2100;
    out.m_85.w = _1387;
    float _2108 = _2102 * _1483;
    float _2110 = -_2082;
    float _2112 = fma(_2110, _2106, 1.0);
    float _2114 = precise::clamp(_2112, 0.0, 1.0);
    float _2116 = -_2102;
    float _2118 = _2116 + 1.0;
    float _2120 = _1494 * _2108;
    float _2122 = _2114 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2124 = _1494 * _2118;
    float _2126 = _2114;
    float _2128 = _2076;
    float _2130 = _2120;
    if (!_2094)
    {
        _2126 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2132 = _2126;
    float _2134 = _2132;
    float _2136 = _2132;
    if (!_2094)
    {
        _1399 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2138 = _1399;
    out.m_87.x = _2122;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2094)
    {
        _2128 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2144 = _2128;
    float _2146 = _2144;
    float _2148 = _2144;
    if (!_2094)
    {
        _1429 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2150 = _1429;
    float _2152 = _2150;
    float _2154 = _2150;
    if (!_2094)
    {
        _2052 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2156 = _2052;
    float _2158 = _1806 * _2108;
    float _2160 = fma(_1802, _2120, _1488);
    float _2162 = fma(_1804, _2120, _1490);
    float _2164 = _2156;
    float _2166 = _2156;
    if (!_2094)
    {
        _2130 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2168 = _2130;
    float _2170 = fma(_1494, _2158, _1492);
    out.m_89.x = _2160;
    out.m_89.y = _2162;
    out.m_89.z = _2170;
    out.m_89.w = _2124;
    bool _2172 = !_2094;
    float _2174 = _2168;
    float _2176 = _2168;
    if (!_2172)
    {
        bool _2178 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2180 = isnan(_1592);
        bool _2182 = _2178 || _2180;
        bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2186 = _2182 || _2184;
        if (!_2186)
        {
            float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2190 = _1592 + _2188;
            float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2194 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2192;
            float _2196 = 1.0 / _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2212 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2218 = _2190 * _2196;
            float _2220 = precise::clamp(_2218, 0.0, 1.0);
            float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2226 = fma(_2220, _2200, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2228 = fma(_2220, _2224, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2230 = fma(_2220, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2232 = fma(_2220, _2208, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2234 = fma(_2220, _2212, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2236 = fma(_2220, _2216, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2142 = _2228;
            _2166 = _2234;
            _2136 = _2226;
            _2154 = _2232;
            _2148 = _2230;
            _2176 = _2236;
            _2238 = true;
        }
        else
        {
            bool _2240 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2242 = isnan(_1592);
            bool _2244 = _2240 || _2242;
            bool _2246 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2248 = _2244 || _2246;
            if (!_2248)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2250 = _2134;
            _2136 = _2250;
            if (!_2248)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2252 = _2140;
            _2142 = _2252;
            if (!_2248)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2254 = _2146;
            _2148 = _2254;
            if (!_2248)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2256 = _2152;
            _2154 = _2256;
            if (!_2248)
            {
                _2164 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2258 = _2164;
            _2166 = _2258;
            if (!_2248)
            {
                _2174 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2260 = _2174;
            bool _2262 = !_2248;
            _2176 = _2260;
            if (!_2262)
            {
                bool _2264 = _1592 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2266 = isnan(_1592);
                bool _2268 = _2264 || _2266;
                bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2272 = _2268 || _2270;
                if (!_2272)
                {
                    float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2276 = _1592 + _2274;
                    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2280 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2278;
                    float _2282 = 1.0 / _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2304 = _2276 * _2282;
                    float _2306 = precise::clamp(_2304, 0.0, 1.0);
                    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2312 = fma(_2306, _2286, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2314 = fma(_2306, _2310, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2316 = fma(_2306, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2318 = fma(_2306, _2294, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2320 = fma(_2306, _2298, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2322 = fma(_2306, _2302, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2142 = _2314;
                    _2166 = _2320;
                    _2136 = _2312;
                    _2154 = _2318;
                    _2148 = _2316;
                    _2176 = _2322;
                    _2238 = true;
                }
                else
                {
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2166 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2176 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2238 = false;
    float _2324 = _2142;
    float _2326 = _2166;
    float _2328 = _2136;
    float _2330 = _2154;
    float _2332 = _2148;
    float _2334 = _2176;
    float _2336 = fma(_2032, -0.5, 0.5);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = -_2324;
    float _2342 = _2340 + _2326;
    float _2344 = -_2328;
    float _2346 = _2344 + _2330;
    float _2348 = -_2332;
    float _2350 = _2348 + _2334;
    bool _2352 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2354 = fma(_2338, _2342, _2324);
    float _2356 = fma(_2338, _2346, _2328);
    float _2358 = fma(_2338, _2350, _2332);
    float _2360 = _2354 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _2362 = fma(_2356, 0.298911988735198974609375, _2360);
    float _2364 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2366 = fma(_2358, 0.114477999508380889892578125, _2362);
    out.m_59.x = _2364;
    float _2368 = -_2366;
    float _2370 = _2356 + _2368;
    float _2372 = -_2366;
    float _2374 = _2354 + _2372;
    float _2376 = -_2366;
    float _2378 = _2358 + _2376;
    out.m_93.x = 0.0;
    float _2380 = fma(_2370, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    float _2382 = fma(_2374, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    float _2384 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2366);
    out.m_95.x = _2380;
    out.m_95.y = _2382;
    out.m_95.z = _2384;
    if (!_2352)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2386 = -_1277;
    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2390 = -_1279;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2394 = -_1281;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2398 = _2388 * _2388;
    float _2400 = fma(_2392, _2392, _2398);
    float _2402 = fma(_2396, _2396, _2400);
    float _2404 = rsqrt(_2402);
    float _2406 = _2388 * _2404;
    float _2408 = _2392 * _2404;
    float _2410 = _2396 * _2404;
    float _2412 = sqrt(_2402);
    float _2414 = -_1598;
    float _2416 = _2414 + _2406;
    float _2418 = -_1594;
    float _2420 = _2418 + _2408;
    float _2422 = -_1596;
    float _2424 = _2422 + _2410;
    float _2426 = _2416 * _2416;
    float _2428 = fma(_2420, _2420, _2426);
    float _2430 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = fma(_2424, _2424, _2428);
    float _2436 = _2432 * _2432;
    float _2438 = -_2412;
    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2442 = _2436 + (-1.0);
    float _2444 = rsqrt(_2434);
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = abs(_2448);
    float _2452 = log2(_2450);
    float _2454 = _2416 * _2444;
    float _2456 = _2420 * _2444;
    float _2458 = _2424 * _2444;
    float _2460 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2462 = _2032 * _2454;
    float _2464 = _2032 * _2406;
    float _2466 = fma(_2030, _2456, _2462);
    float _2468 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2470 = fma(_2030, _2408, _2464);
    float _2472 = fma(_2014, _2458, _2466);
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2014, _2410, _2470);
    float _2478 = precise::clamp(_2476, 0.0, 1.0);
    float _2480 = exp2(_2468);
    float _2482 = _2474 * _2474;
    float _2484 = fma(_2482, _2442, 1.0);
    float _2486 = -_2406;
    float _2488 = -_2460;
    float _2490 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2488);
    float _2492 = _2484 * _2484;
    float _2494 = -_2410;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2490);
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2500 = _2496 + _2498;
    float _2502 = 1.0 / _2492;
    float _2504 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = _2480 * _2506;
    float _2510 = _2478 * _2508;
    float _2512 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2514 = _2436 * _2502;
    float _2516 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2520 = _2510 * _2514;
    out.m_91.x = _2512;
    out.m_91.y = _2516;
    out.m_91.z = _2518;
    float _2522 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2524 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2526 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2522;
    out.m_93.y = _2524;
    out.m_93.z = _2526;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

