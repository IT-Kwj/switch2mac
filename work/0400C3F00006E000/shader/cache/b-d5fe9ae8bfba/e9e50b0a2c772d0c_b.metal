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
    float4 m_99 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
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
    float4 m_77 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3068 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_56.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_134);
        out.gl_Position.z = _3353;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_61.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_172);
        out.gl_Position.z = _3422;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_63.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = in.m_56.x;
    float _208 = in.m_56.y;
    float _210 = in.m_56.z;
    float _212 = _208 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _214 = _208 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].x, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].x, _214);
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[4].z, _216);
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[6].z, _218);
    float _224 = _220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _226 = _222 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _228 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _232 = floor(_228);
    float _234 = floor(_230);
    float _236 = -_232;
    float _238 = _228 + _236;
    float _240 = -_234;
    float _242 = _230 + _240;
    float2 _3549 = float2(_238, _242);
    float _244 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3549, float2(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3549, float2(0.0), isnan(_3549)), level(0.0)).x;
    float _246 = in.m_63.x;
    float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _250 = log2(_248);
    float _252 = in.m_63.y;
    float _254 = _208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = in.m_63.z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _204 + _268;
    float _272 = 1.0 / _258;
    float _274 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _276 = _250 * _152;
    float _278 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _280 = int(_278);
    float _282 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _284 = _246 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _286 = _246 * 2.0;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _290 = -_266;
    float _292 = fma(_284, 2.0, _290);
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _296 = _252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _298 = _270 * _272;
    float _300 = 1.0 / _262;
    float _302 = _246 + _252;
    float _304 = fma(_296, -2.0, _294);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _308 = 1.0 + _306;
    float _310 = _302 + (-1.0);
    float _312 = float(_280);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _204 + _314;
    float _318 = floor(_286);
    float _320 = _246 + _264;
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _324 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _304);
    float _326 = _320 + (-1.0);
    float _328 = exp2(_276);
    float _330 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _332 = _252 + _264;
    float _334 = _316 * _300;
    float _336 = _332 + (-1.0);
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _340 = int(_338);
    bool _342 = _318 > 0.0;
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _346 = _318 >= 0.0;
    bool _348 = isnan(_318);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = _264 * 2.0;
    float _358 = 1.0 / _312;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _362 = _360 != 0;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _370 = _368 != 0;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    bool _376 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(1.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    bool _386 = !_366;
    int _388 = _386 ? 0 : 1;
    float _390 = 1.0 / _308;
    float _392 = _252 * 2.0;
    bool _394 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _402 = _398 || _400;
    float _404 = float(_340);
    bool _406 = !_362;
    float _408 = _406 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _410 = floor(_392);
    float _412 = _404 * _152;
    float _414 = _358 * _152;
    float _416 = -_152;
    float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[76].x, _292);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    bool _428 = !_370;
    int _430 = _428 ? 0 : 1;
    float _432 = floor(_356);
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _436 = _402 ? _374 : 0.0;
    float _438 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[78].z, _288);
    bool _440 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_204);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _434);
    float _454 = fma(_422, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _456 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _438);
    bool _458 = _410 > 0.0;
    float _460 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _452);
    bool _462 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _464 = isnan(_204);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = _408;
    if (_384)
    {
        float _476 = _436 * _390;
        _156 = _476;
    }
    float _478 = _156;
    bool _480 = _410 >= 0.0;
    bool _482 = isnan(_410);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].z, _274);
    bool _492 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _494 = isnan(_204);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _504;
    float _508 = -_472;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _516 = _432 >= 0.0;
    bool _518 = isnan(_432);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_506, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = -_502;
    float _530 = _528 + 1.0;
    float _532 = fma(_426, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _534 = _502 * _510;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = _450 * _530;
    float _546 = fma(_514, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = fma(_538, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_542, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _552 = _532 * _544;
    int _554 = _488 ? 0 : 1;
    float _556 = _526 * _544;
    float _558 = -_450;
    float _560 = _558 + 1.0;
    int _562 = _354 ? 0 : 1;
    float _564 = _454 * _544;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _556);
    bool _580 = _432 > 0.0;
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    float _584 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _586 = !_568;
    int _588 = _586 ? 0 : 1;
    float _590 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _564);
    int _592 = _524 ? 0 : 1;
    float _594 = _584 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _596 = ~_562;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = fma(_546, _534, _590);
    int _604 = abs(_588);
    float _606 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _594);
    int _608 = _600;
    if (!_342)
    {
        int _610 = ~_562;
        int _612 = _610 + 1;
        _608 = _612;
    }
    int _614 = _608;
    float _616 = fma(_548, _534, _578);
    float _618 = in.m_65.x;
    float _620 = in.m_65.y;
    float _622 = in.m_65.z;
    int _624 = ~_592;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].z, _606);
    float _632 = fma(_550, _534, _582);
    int _634 = _628;
    if (!_580)
    {
        int _636 = ~_592;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = _630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _644 = ~_554;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].y, _616);
    int _652 = _648;
    if (!_458)
    {
        int _654 = ~_554;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    float _660 = _584 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _662 = float(_604);
    float _664 = 1.0 / _642;
    float _666 = float(_640);
    float _668 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _660);
    float _670 = _584 + _282;
    float _672 = _662 * _666;
    bool _674 = !_572;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].z, _668);
    float _680 = _672 * (-2.0);
    int _682 = abs(_676);
    float _684 = _678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _686 = !_576;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_322, _680, _322);
    float _692 = _684 + _642;
    float _694 = float(_614);
    float _696 = fma(_680, _618, _618);
    float _698 = float(_682);
    float _700 = _246 + (-0.5);
    int _702 = abs(_688);
    float _704 = _692 * _664;
    float _706 = _704 * 0.5;
    float _708 = in.m_67.x;
    float _710 = in.m_67.y;
    float _712 = in.m_67.z;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    float _716 = _698 * _694;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[30].w, _718);
    float _722 = float(_658);
    float _724 = fma(_690, _478, _714);
    float _726 = float(_702);
    float _728 = _716 * (-2.0);
    float _730 = _252 + (-0.5);
    float _732 = in.m_69.x;
    float _734 = in.m_69.y;
    float _736 = in.m_69.z;
    float _738 = 1.0 / _720;
    float _740 = fma(_728, _620, _620);
    float _742 = _726 * _722;
    float _744 = fma(_344, _728, _344);
    float _746 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].z, _632);
    float _748 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _750 = _742 * (-2.0);
    float _752 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].x, _602);
    float _754 = _724 * 0.15915493667125701904296875;
    float _756 = fma(_744, _478, _748);
    float _758 = fma(_750, _622, _622);
    float _760 = _264 + (-0.5);
    float _762 = fma(_330, _750, _330);
    float _764 = _752 * _708;
    float _766 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].z, _758);
    float _768 = _650 * _710;
    float _770 = _756 * 0.15915493667125701904296875;
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = fma(_762, _478, _766);
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _778 = _738 * _776;
    float _780 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _754 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _788 = _774 * 0.15915493667125701904296875;
    bool _790 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    bool _794 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _796 = _786 * _780;
    bool _798 = !_790;
    int _800 = _798 ? 0 : 1;
    float _802 = _754 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _746 * _712;
    float _808 = _792 * _772;
    float _810 = _670 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    float _814 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _816 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _818 = isnan(0.5);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _824 = _820 || _822;
    float _826 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _810);
    float _828 = _770 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _812 * _814;
    int _834 = 2;
    if (!_790)
    {
        _834 = 1;
    }
    int _836 = _834;
    float _838 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].z, _826);
    int _840 = _836;
    if (!_794)
    {
        _840 = _800;
    }
    int _842 = _840;
    float _844 = _770 * 6.283185482025146484375;
    float _846 = cos(_844);
    int _848 = _842 << 6;
    float _850 = _838 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _852 = _788 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _670 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _858 = _804 * _830;
    float _860 = _784 * _830;
    float _862 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _856);
    float _864 = _788 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _784 * _846;
    float _870 = _804 * _846;
    float _872 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].z, _862);
    float _874 = _804 * _854;
    float _876 = _846 * _854;
    float _878 = _784 * _854;
    float _880 = _830 * _854;
    float _882 = _874 * _796;
    float _884 = _872 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _886 = _878 * _796;
    int _888 = _848 + 48;
    uint _891 = uint(int(uint(_888) >> uint(2)));
    uint _893 = uint(int(uint(int(_891)) >> uint(2)));
    int _895 = int(_891) & 3;
    float _897 = (*spvDescriptorSet0.vp_c15)._m0[int(_893)][_895];
    int _899 = int(_891) + 1;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    int _903 = _899 & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    float _907 = -_858;
    float _909 = fma(_866, _868, _907);
    float _911 = -_868;
    float _913 = fma(_866, _858, _911);
    float _915 = fma(_866, _870, _860);
    float _917 = -_796;
    float _919 = _866 * _917;
    float _921 = trunc(_884);
    int _923 = int(_921);
    float _925 = fma(_866, _860, _870);
    float _927 = fma(_915, _808, _882);
    int _929 = _848 + 96;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    float _947 = fma(_876, _808, _919);
    float _949 = fma(_909, _808, _886);
    float _951 = fma(_913, _832, _927);
    float _953 = trunc(_850);
    int _955 = int(_953);
    float _957 = fma(_880, _832, _947);
    float _959 = _951 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _961 = _848 + 64;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    uint _965 = uint(int(uint(int(_963)) >> uint(2)));
    int _967 = int(_963) & 3;
    float _969 = (*spvDescriptorSet0.vp_c15)._m0[int(_965)][_967];
    int _971 = int(_963) + 1;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    int _975 = _971 & 3;
    float _977 = (*spvDescriptorSet0.vp_c15)._m0[int(_973)][_975];
    float _979 = _951 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _981 = fma(_925, _832, _949);
    float _983 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[10].x, _959);
    float _985 = _951 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _987 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _989 = _923 + _987;
    int _991 = _989 + 1;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[8].x, _979);
    float _995 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[10].z, _983);
    int _997 = _848 + 104;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    float _1015 = _226 + _995;
    int _1017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1019 = _955 + _1017;
    int _1021 = _1019 + 1;
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[8].z, _993);
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1015 + _1025;
    int _1029 = _848 + 56;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    uint _1033 = uint(int(uint(int(_1031)) >> uint(2)));
    int _1035 = int(_1031) & 3;
    float _1037 = (*spvDescriptorSet0.vp_c15)._m0[int(_1033)][_1035];
    int _1039 = int(_1031) + 1;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    int _1043 = _1039 & 3;
    float _1045 = (*spvDescriptorSet0.vp_c15)._m0[int(_1041)][_1043];
    int _1047 = _1021 | _991;
    float _1049 = _224 + _1023;
    float _1051 = _1027 * _1027;
    bool _1053 = _1021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1049 + _1055;
    int _1059 = _848 + 72;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    bool _1077 = _1047 < 0;
    bool _1079 = _1077 || _1053;
    float _1081 = fma(_1057, _1057, _1051);
    bool _1083 = _991 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1085 = _1083 || _1079;
    float _1087 = sqrt(_1081);
    int _1089 = _848 + 80;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c15)._m0[int(_1101)][_1103];
    float _1107 = _670 * _905;
    float _1109 = fma(_224, _897, _1107);
    float _1111 = _670 * _945;
    float _1113 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[9].x, _985);
    int _1115 = as_type<int>(_951);
    int _1117 = as_type<int>(_1113);
    float _1119 = _1109;
    float _1121 = _1015;
    float _1123 = _1081;
    float _1125 = as_type<float>(_1021);
    if (!_1085)
    {
        int _1127 = _991 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1129 = _1127 + _1021;
        _1115 = _1129;
    }
    int _1131 = _1115;
    float _1133 = _957;
    if (!_1085)
    {
        float _1135 = floor(_850);
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_224, _937, _1111);
    bool _1141 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1143 = _670 * _977;
    float _1145 = fma(_224, _969, _1143);
    int _1147 = as_type<int>(_969);
    float _1149 = _1145;
    if (!_1085)
    {
        int _1151 = _1131 << 2;
        _1147 = _1151;
    }
    int _1153 = _1147;
    float _1155 = fma(_226, _1005, _1139);
    int _1157 = as_type<int>(_1005);
    if (!_1085)
    {
        uint _1159 = uint(int(uint(_1131) >> uint(2)));
        _1157 = int(_1159);
    }
    int _1161 = _1157;
    float _1163 = _1155 + _1013;
    float _1165 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1113);
    int _1167 = _1161;
    if (!_1085)
    {
        int _1169 = 12 & _1153;
        _1117 = _1169;
    }
    int _1171 = _1117;
    float _1173 = fma(_226, _1037, _1109);
    float _1175 = _584 + _1165;
    float _1177 = 1.0 / _1163;
    float _1179 = _1175;
    float _1181 = _1105;
    if (!_1085)
    {
        int _1183 = _1161 << 4;
        int _1185 = _1183 + _1171;
        _1167 = _1185;
    }
    int _1187 = _1167;
    float _1189 = _1173 + _1045;
    if (!_1141)
    {
        _1119 = _1049;
    }
    float _1191 = _1119;
    float _1193 = fma(_226, _1067, _1145);
    float _1195 = _1193 + _1075;
    bool _1197 = !_1141;
    float _1199 = _1191;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1205 = _1087 + _1203;
        float _1207 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = rsqrt(_1081);
        float _1211 = _1205 * _1201;
        float _1213 = _1211 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1221, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1227 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1209 * _1225;
        float _1231 = fma(_1175, _1217, _1227);
        float _1233 = fma(_1057, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1027, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1179 = _1231;
        _1121 = _1235;
        _1199 = _1233;
        _1149 = _1227;
        _1123 = _1209;
    }
    float _1237 = _1179;
    float _1239 = _1121;
    float _1241 = _1199;
    float _1243 = _1149;
    float _1245 = _1123;
    float _1247 = _1243;
    float _1249 = _1245;
    float _1251 = _1241;
    if (_824)
    {
        _1247 = _1237;
    }
    float _1253 = _1247;
    float _1255 = _1253;
    if (_824)
    {
        _1249 = _1239;
    }
    float _1257 = _1249;
    float _1259 = _1257;
    if (!_824)
    {
        float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1263 = _584 + _1261;
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1267 = _224 + _1265;
        float _1269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1271 = -_584;
        float _1273 = _1271 + _1237;
        float _1275 = _1263 * _1263;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1279 = _226 + _1277;
        float _1281 = -_224;
        float _1283 = _1281 + _1241;
        float _1285 = fma(_1267, _1267, _1275);
        float _1287 = -_226;
        float _1289 = _1287 + _1239;
        float _1291 = fma(_1279, _1279, _1285);
        float _1293 = sqrt(_1291);
        float _1295 = precise::min(_1293, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1269;
        float _1299 = fma(_1273, _1297, _584);
        float _1301 = fma(_1283, _1297, _224);
        float _1303 = fma(_1289, _1297, _226);
        _1255 = _1299;
        _1251 = _1301;
        _1259 = _1303;
    }
    float _1305 = _1255;
    float _1307 = _1251;
    float _1309 = _1259;
    int _1311 = _848 + 88;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1333 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1335 = _1189 * _1177;
    float _1337 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1329);
    float _1339 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1331);
    float _1341 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1333);
    float _1343 = _1239;
    if (!_1085)
    {
        int _1345 = _1187 + 400;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
        _1343 = _1353;
    }
    float _1355 = _1343;
    float _1357 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1337);
    bool _1359 = _1335 >= 0.0;
    float _1361 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1339);
    float _1363 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1365 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1341);
    float _1367 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = _1195 * _1177;
    bool _1371 = _1335 <= 1.0;
    bool _1373 = _1371 && _1359;
    float _1375 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1377 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1363);
    float _1379 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1387 = _1369 >= 0.0;
    bool _1389 = _1387 && _1373;
    float _1391 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1377);
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    float _1395 = -_1385;
    float _1397 = fma(_1395, _1383, 1.0);
    bool _1399 = _1369 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1405 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1393);
    float _1407 = _1067;
    if (!_1085)
    {
        float _1409 = floor(_884);
        _1407 = _1409;
    }
    float _1411 = _1407;
    float _1413 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1417 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1405);
    float _1419 = _670 * _1105;
    float _1421 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1423 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1415);
    float _1425 = log2(_1397);
    float _1427 = fma(_224, _1097, _1419);
    if (_1401)
    {
        float _1429 = float(_842);
        _1181 = _1429;
    }
    float _1431 = _1181;
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1421);
    float _1435 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1423);
    float _1437 = 1.0 / _1417;
    float _1439 = _1431;
    if (!_1085)
    {
        float _1441 = -_1411;
        float _1443 = _884 + _1441;
        _1125 = _1443;
    }
    float _1445 = _1125;
    float _1447 = fma(_226, _1319, _1427);
    float _1449 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1433);
    float _1451 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1435);
    float _1453 = _1447 + _1327;
    float _1455 = _1419;
    float _1457 = _1449;
    if (_1401)
    {
        float _1459 = rint(_1431);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        uint _1465 = clamp(_1463, 0u, 65535u);
        _1455 = as_type<float>(_1465);
    }
    float _1467 = _1455;
    float _1469 = _1425 * 0.693147182464599609375;
    float _1471 = _1453 * _1177;
    float _1473 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1475 = _1433;
    float _1477 = _1473;
    if (!_1085)
    {
        float _1479 = rint(_1355);
        float _1481 = precise::max(_1479, 0.0);
        uint _1483 = uint(_1481);
        uint _1485 = clamp(_1483, 0u, 65535u);
        _1475 = as_type<float>(_1485);
    }
    float _1487 = _1475;
    float _1489 = _1449 * _1437;
    float _1491 = _1451 * _1437;
    if (!_1085)
    {
        float _1493 = -_1137;
        float _1495 = _850 + _1493;
        _1439 = _1495;
    }
    float _1497 = _1439;
    float _1499 = fma(_1489, 0.5, 0.5);
    float _1501 = fma(_1491, -0.5, 0.5);
    float _1503 = _1453;
    if (_1401)
    {
        float3 _5573 = float3(_1335, _1369, float(as_type<int>(_1467)));
        float3 _5577 = select(_5573, float3(0.0), isnan(_5573));
        float _1505 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5577.xy, uint(rint(_5577.z)), _1471, level(0.0));
        _1503 = _1505;
    }
    float _1507 = _1503;
    float3 _5587 = float3(_1499, _1501, _1473);
    float _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5587, float3(0.0), isnan(_5587)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5587, float3(0.0), isnan(_5587)), level(0.0)).x;
    float3 _5596 = float3(_1499, _1501, _1473);
    float4 _1512 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _1514 = _1512.x;
    float _1516 = _1512.y;
    float _1518 = _1512.z;
    float _1520 = _1512.w;
    float _1522 = _1445;
    if (!_1085)
    {
        float3 _5619 = float3(_1497, _1445, float(as_type<int>(_1487)));
        float3 _5621 = select(_5619, float3(0.0), isnan(_5619));
        float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5621.xy, uint(rint(_5621.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5621.xy, uint(rint(_5621.z)), level(0.0)).x;
        _1522 = _1524;
    }
    float _1526 = _1522;
    float _1528 = float(uint(_340));
    float _1530 = trunc(_414);
    int _1532 = int(_1530);
    float _1534 = float(_118);
    int _1536 = abs(_388);
    int _1538 = abs(_430);
    float _1540 = 1.0 / _1528;
    float _1542 = float(uint(_1532));
    int _1544 = as_type<int>(_1540) + (-2);
    float _1546 = as_type<float>(_1544) * _1542;
    float _1548 = trunc(_1546);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = ~_340;
    int _1556 = _1554 + 1;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1560 = _1558 != 0;
    float _1562 = 1.0 / _1534;
    bool _1564 = !_1560;
    float _1566 = _1564 ? 7.345489978790283203125 : 1.0;
    int _1568 = _1556 * int(_1552);
    int _1570 = _1568 + _1532;
    float _1572 = float(uint(_1570));
    float _1574 = as_type<float>(_1544) * _1572;
    float _1576 = _1566 * _246;
    int _1578 = ~_340;
    int _1580 = _1578 + 1;
    float _1582 = trunc(_1574);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = floor(_1576);
    int _1590 = int(_1552) + int(_1586);
    float _1592 = float(_1532);
    int _1594 = _1580 * _1590;
    int _1596 = _1594 + _1532;
    bool _1598 = _1592 >= _404;
    bool _1600 = isnan(_1592);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_404);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = -_1588;
    float _1612 = _1576 + _1610;
    float _1614 = _412 * _1562;
    bool _1616 = uint(_1596) >= uint(_340);
    float _1618 = _1612 * _404;
    float _1620 = trunc(_1608);
    int _1622 = int(_1620);
    int _1624 = ~_340;
    int _1626 = _1624 + 1;
    bool _1628 = !_1616;
    int _1630 = _1628 ? 0 : (-1);
    bool _1632 = _340 == 0;
    int _1634 = ~_1590;
    int _1636 = _1634 + _1630;
    int _1638 = _1636 + 1;
    float _1640 = trunc(_1618);
    int _1642 = int(_1640);
    int _1644 = _340 * _1638;
    int _1646 = _1644 + _1532;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1650 = _1648 != 0;
    int _1652 = _340 + (-1);
    float _1654 = trunc(_1614);
    int _1656 = int(_1654);
    int _1658 = ~_1622;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    bool _1664 = !_1632;
    int _1666 = _1664 ? _1646 : (-1);
    bool _1668 = !_1650;
    int _1670 = _1668 ? 0 : 1;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1674 = _1672 != 0;
    int _1676 = _1666 * _1662;
    int _1678 = abs(_1670);
    int _1680 = abs(as_type<int>(_408));
    int _1682 = _1622 * _1652;
    int _1684 = _1682 + _1676;
    int _1686 = _1642 * _1678;
    int _1688 = _1686 + _1532;
    bool _1690 = !_1674;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = _1684 * _1536;
    int _1696 = abs(_1692);
    int _1698 = _1656 * _1680;
    int _1700 = _1698 + _1694;
    int _1702 = _1688 * _1538;
    int _1704 = _1702 + _1700;
    int _1706 = _1642 * _1696;
    int _1708 = _1706 + _1704;
    int _1710 = ~_340;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1708));
    float _1716 = as_type<float>(_1544) * _1714;
    float _1718 = trunc(_1716);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1712 * int(_1722);
    int _1726 = _1724 + _1708;
    float _1728 = float(uint(_1726));
    float _1730 = as_type<float>(_1544) * _1728;
    float _1732 = trunc(_1730);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = int(_1722) + int(_1736);
    int _1740 = _1626 * _1738;
    int _1742 = _1740 + _1708;
    bool _1744 = uint(_1742) >= uint(_340);
    bool _1746 = !_1744;
    int _1748 = _1746 ? 0 : (-1);
    int _1750 = ~_1738;
    int _1752 = _1750 + _1748;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_1738);
    float _1758 = as_type<float>(_1742);
    int _1760 = _1688;
    if (_1085)
    {
        _1756 = 1.0;
    }
    float _1762 = _1756;
    int _1764 = _340 * _1754;
    int _1766 = _1764 + _1708;
    float _1768 = _1762;
    float _1770 = _1507;
    if (!_1085)
    {
        int _1772 = _1131 << 4;
        int _1774 = _1772 + 2048;
        uint _1776 = uint(int(uint(_1774) >> uint(2)));
        uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
        int _1780 = int(_1776) & 3;
        float _1782 = (*spvDescriptorSet0.vp_c15)._m0[int(_1778)][_1780];
        int _1784 = int(_1776) + 1;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        int _1788 = _1784 & 3;
        float _1790 = (*spvDescriptorSet0.vp_c15)._m0[int(_1786)][_1788];
        int _1792 = _1774 + 8;
        uint _1794 = uint(int(uint(_1792) >> uint(2)));
        uint _1796 = uint(int(uint(int(_1794)) >> uint(2)));
        int _1798 = int(_1794) & 3;
        float _1800 = (*spvDescriptorSet0.vp_c15)._m0[int(_1796)][_1798];
        int _1802 = int(_1794) + 1;
        uint _1804 = uint(int(uint(_1802) >> uint(2)));
        int _1806 = _1802 & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        float _1810 = _670 * _1790;
        float _1812 = fma(_224, _1782, _1810);
        float _1814 = fma(_226, _1800, _1812);
        float _1816 = _1814 + _1808;
        float _1818 = precise::clamp(_1816, 0.0, 1.0);
        float _1820 = -_1818;
        float _1822 = _1820 + _1526;
        float _1824 = fma(_1822, 500.0, 1.5);
        float _1826 = exp2(_1824);
        float _1828 = 0.0 + _1826;
        float _1830 = precise::clamp(_1828, 0.0, 1.0);
        _1768 = _1830;
    }
    float _1832 = _1768;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1836 = _1305 + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = _1307 + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1844 = _1309 + _1842;
    float _1846 = _1836 * _1836;
    float _1848 = in.m_71.x;
    float _1850 = fma(_1840, _1840, _1846);
    float _1852 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1854 = fma(_1844, _1844, _1850);
    float _1856 = precise::max(0.0, _1852);
    float _1858 = rsqrt(_1854);
    float _1860 = sqrt(_1854);
    float _1862 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1864 = _1840 * _1862;
    float _1866 = _1844 * _1862;
    float _1868 = -_1862;
    float _1870 = -_1856;
    float _1872 = fma(_1836, _1868, _1870);
    float _1874 = _1864 * _1864;
    float _1876 = _1866 * _1866;
    float _1878 = _1874 + _1876;
    float _1880 = sqrt(_1878);
    bool _1882 = _1880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = _1880 + _1884;
    float _1888 = _414;
    float _1890 = _1836;
    float _1892 = _1886;
    float _1894 = _1864;
    float _1896 = _1874;
    float _1898 = _1872;
    float _1900 = _1876;
    float _1902 = _1848;
    if (_1882)
    {
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1904;
    }
    float _1906 = _1888;
    if (_1882)
    {
        float _1908 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1908;
    }
    float _1910 = _1890;
    float _1912 = _1906;
    float _1914 = _1910;
    if (_1882)
    {
        float _1916 = _1886 * _1906;
        _1892 = _1916;
    }
    float _1918 = _1892;
    if (_1882)
    {
        float _1920 = rsqrt(_1878);
        _1912 = _1920;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    if (_1882)
    {
        float _1926 = _1918 * 0.15915493667125701904296875;
        _1758 = _1926;
    }
    float _1928 = _1758;
    float _1930 = _226;
    if (_1882)
    {
        float _1932 = _1928 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = in.m_71.y;
    float _1940 = _1918;
    if (_1882)
    {
        float _1942 = _1928 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = _1936;
    if (_1882)
    {
        float _1950 = fma(_1936, _1910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = _1952;
    if (_1882)
    {
        float _1956 = _1922 * _1952;
        _1954 = _1956;
    }
    float _1958 = _1954;
    if (_1882)
    {
        float _1960 = _1946 + (-1.0);
        _1914 = _1960;
    }
    float _1962 = _1914;
    float _1964 = _1962;
    if (_1882)
    {
        float _1966 = _1864 * _1958;
        _1894 = _1966;
    }
    float _1968 = _1894;
    if (_1882)
    {
        float _1970 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1970;
    }
    float _1972 = _1924;
    if (!_1882)
    {
        _1964 = _1866;
    }
    float _1974 = _1964;
    float _1976 = _1974;
    if (_1882)
    {
        float _1978 = _1866 * _1958;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1882)
    {
        float _1982 = _1968 * _1968;
        _1896 = _1982;
    }
    float _1984 = _1896;
    if (_1882)
    {
        float _1986 = fma(_1872, _1946, _1972);
        _1898 = _1986;
    }
    float _1988 = _1898;
    if (_1882)
    {
        float _1990 = _1980 * _1980;
        _1900 = _1990;
    }
    float _1992 = _1900;
    float _1994 = fma(_1988, _1988, _1984);
    float _1996 = float(uint(_1688));
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2000 = fma(_1860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1998);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = _1994 + _1992;
    float _2006 = -_2002;
    float _2008 = _2006 + 1.0;
    float _2010 = rsqrt(_2004);
    float _2012 = _2010 * _1968;
    float _2014 = _2010 * _1988;
    float _2016 = _2010 * _1980;
    float _2018 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2020 = abs(_2008);
    float _2022 = log2(_2020);
    float _2024 = -_2018;
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2024);
    float _2028 = -_2016;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2026);
    float _2032 = fma(_2030, -0.5, 0.5);
    float _2034 = fma(_2030, 0.5, 0.5);
    float _2036 = as_type<float>(_1544) * _1996;
    float _2038 = fma(_2034, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2040 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2042 = sqrt(_2032);
    float _2044 = fma(_2034, _2038, -0.212114393711090087890625);
    float _2046 = _2014 + 1.0;
    float _2048 = fma(_2034, _2044, 1.570728778839111328125);
    int _2050 = ~_340;
    int _2052 = _2050 + 1;
    float _2054 = exp2(_2040);
    float _2056 = _2042 * 0.636619746685028076171875;
    float _2058 = trunc(_2036);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = -_2048;
    float _2066 = fma(_2056, _2064, 1.0);
    float _2068 = -_2014;
    float _2070 = fma(_2054, _2046, _2068);
    bool _2072 = !_1632;
    int _2074 = _2072 ? _1766 : (-1);
    float _2076 = in.m_63.w;
    float _2078 = fma(_2070, 0.5, 0.5);
    int _2080 = _2074 >> 31;
    float2 _6410 = float2(_2066, _2078);
    float3 _2084 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6410, float2(0.0), isnan(_6410)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6410, float2(0.0), isnan(_6410)), level(0.0)).xyz;
    float _2086 = _2084.x;
    float _2088 = _2084.y;
    float _2090 = _2084.z;
    int _2092 = _2080 & 3;
    int _2094 = _2052 * int(_2062);
    int _2096 = _2094 + _1688;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2100 = _2098 != 0;
    float _2102 = -_1938;
    float _2104 = _2102 + 1.0;
    int _2106 = _2074 + _2092;
    float _2108 = -_244;
    float _2110 = _2108 + 1.0;
    float _2112 = float(uint(_2096));
    out.m_73.x = _1307;
    out.m_73.y = _1305;
    out.m_73.z = _1309;
    int _2114 = _2106 >> 2;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2118 = _2116 != 0;
    float _2120 = as_type<float>(_1544) * _2112;
    int _2122 = _2114 << 4;
    int _2124 = _2122 + 368;
    float _2126 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2128 = trunc(_2120);
    float _2130 = precise::max(_2128, 0.0);
    uint _2132 = uint(_2130);
    uint _2134 = uint(int(uint(_2124) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[int(_2144)][_2146];
    bool _2150 = _2076 > 0.5;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2154 = _2152 != 0;
    int _2156 = _2150 ? as_type<int>(_2104) : as_type<int>(_1938);
    bool _2158 = _252 > 0.5;
    float _2160 = _2126 * _246;
    float _2162 = _2154 ? as_type<float>(_2156) : _1938;
    float _2164 = _1938;
    bool _2166 = _2150;
    int _2168 = _2074;
    if (_2100)
    {
        float _2170 = _2158 ? _2104 : _1938;
        _2164 = _2170;
    }
    float _2172 = _2164;
    int _2174 = _2074 & 3;
    bool _2176 = _2174 != 0;
    float _2178 = trunc(_2160);
    int _2180 = int(_2178);
    if (_2118)
    {
        bool _2182 = _246 > 0.5;
        _2166 = _2182;
    }
    bool _2184 = _2166;
    int _2186 = _2124 + 8;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2074 & 3;
    bool _2206 = _2204 != 0;
    if (_2118)
    {
        float _2208 = -_1848;
        float _2210 = _2208 + 1.0;
        _2168 = as_type<int>(_2210);
    }
    int _2212 = _2168;
    bool _2214 = uint(_2174) > 1u;
    if (!_2118)
    {
        _474 = _1848;
    }
    float _2216 = _474;
    int _2218 = int(_2062) + int(_2132);
    int _2220 = ~_340;
    int _2222 = _2220 + 1;
    float _2224 = _2216;
    if (_2118)
    {
        float _2226 = _2184 ? as_type<float>(_2212) : _1848;
        _2224 = _2226;
    }
    float _2228 = _2224;
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2232 = _2230 != 0;
    int _2234 = _2222 * _2218;
    int _2236 = _2234 + _1688;
    int _2238 = _2206 ? 0 : 1;
    int _2240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2242 = _2240 != 0;
    int _2244 = ~_2238;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = _2248;
    if (!_2214)
    {
        int _2252 = ~_2238;
        int _2254 = _2252 + 1;
        _2250 = _2254;
    }
    int _2256 = _2250;
    bool _2258 = uint(_2236) >= uint(_340);
    bool _2260 = !_2176;
    int _2262 = _2260 ? 0 : 1;
    bool _2264 = _2174 != 3;
    int _2266 = abs(_2256);
    bool _2268 = !_2258;
    int _2270 = _2268 ? 0 : (-1);
    bool _2272 = uint(_2174) >= 2u;
    bool _2274 = _2258;
    if (_2232)
    {
        bool _2276 = _264 > 0.5;
        _2274 = _2276;
    }
    bool _2278 = _2274;
    int _2280 = abs(_2262);
    int _2282 = _2272 ? 0 : 1;
    int _2284 = ~_2266;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    bool _2290 = _2174 != 3;
    int _2292 = ~_2218;
    int _2294 = _2292 + _2270;
    int _2296 = _2294 + 1;
    int _2298 = _2288 * as_type<int>(_2148);
    int _2300 = ~_2282;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    if (_2264)
    {
        int _2308 = ~_2282;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    int _2314 = _340 * _2296;
    int _2316 = _2314 + _1688;
    int _2318 = ~_2280;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2326 = int(_2324);
    int _2328 = _2180 << 4;
    int _2330 = _2328 + 1712;
    float _2332 = in.m_75.x;
    float _2334 = in.m_75.y;
    float _2336 = in.m_75.z;
    int _2338 = abs(_2312);
    int _2340 = _2322 * as_type<int>(_2140);
    int _2342 = _2340 + _2298;
    bool _2344 = _734 != 0.0;
    bool _2346 = isnan(_734);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    int _2354 = _2330 + 8;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    bool _2364 = !_2290;
    int _2366 = _2364 ? 0 : (-1);
    if (_2232)
    {
        float _2368 = -_1848;
        float _2370 = _2368 + 1.0;
        _1760 = as_type<int>(_2370);
    }
    int _2372 = _1760;
    bool _2374 = _732 == 0.0;
    bool _2376 = !_2352;
    bool _2378 = _2374 && _2376;
    bool _2380 = !_2242;
    int _2382 = _2380 ? 0 : 1;
    uint _2384 = uint(int(uint(_2330) >> uint(2)));
    uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
    int _2388 = int(_2384) & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = int(_2384) + 1;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    int _2396 = _2392 & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    int _2400 = abs(_2366);
    int _2402 = ~_2338;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    bool _2408 = _736 == 0.0;
    bool _2410 = _2408 && _2378;
    int _2412 = abs(_2382);
    int _2414 = _2406 * as_type<int>(_2194);
    int _2416 = _2414 + _2342;
    int _2418 = ~_2400;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    float _2424 = as_type<float>(_2372);
    float _2426 = as_type<float>(_2400);
    if (_2232)
    {
        float _2428 = _2278 ? as_type<float>(_2372) : _1848;
        _1902 = _2428;
    }
    float _2430 = _1902;
    int _2432 = _2422 * as_type<int>(_2202);
    int _2434 = _2432 + _2416;
    int _2436 = ~_2412;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    bool _2442 = !_1632;
    int _2444 = _2442 ? _2316 : (-1);
    if (_2410)
    {
        _2424 = _2332;
    }
    float _2446 = _2424;
    int _2448 = _2434 * _2440;
    float _2450 = float(uint(_2326));
    float _2452 = _2446;
    if (_2410)
    {
        _2426 = _2446;
    }
    float _2454 = _2426;
    float _2456 = _2454;
    if (!_2410)
    {
        _2452 = _2332;
    }
    float _2458 = _2452;
    int _2460 = _2444 * _2412;
    int _2462 = _2460 + _2448;
    int _2464 = abs(_2326);
    float _2466 = in.m_77.x;
    float _2468 = in.m_77.y;
    float _2470 = in.m_77.z;
    float _2472 = in.m_77.w;
    float _2474 = 1.0 / _2450;
    if (!_2410)
    {
        float _2476 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2456 = _2476;
    }
    float _2478 = _2456;
    float _2480 = float(uint(_2464));
    float _2482 = float(uint(_2462));
    float _2484 = 1.0 / _2480;
    int _2486 = abs(_2462);
    float _2488 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2490 = _2362;
    if (_2410)
    {
        _2490 = _2334;
    }
    float _2492 = _2490;
    float _2494 = _2492;
    if (!_2410)
    {
        float _2496 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2334);
        _2494 = _2496;
    }
    float _2498 = _2494;
    if (_2410)
    {
        _1477 = _2336;
    }
    float _2500 = _1477;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2504 = as_type<int>(_2474) + (-2);
    float _2506 = _2488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2508 = float(uint(_2486));
    float _2510 = _2390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2512 = _2398 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2514 = as_type<float>(_2504) * _2482;
    float _2516 = _2500;
    if (!_2410)
    {
        float _2518 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2336);
        _2516 = _2518;
    }
    float _2520 = _2516;
    float _2522 = _2470 * _2458;
    int _2524 = as_type<int>(_2484) + (-2);
    float _2526 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2530 = -_2522;
    float _2532 = fma(_2466, _2336, _2530);
    float _2534 = trunc(_2514);
    float _2536 = precise::max(_2534, 0.0);
    uint _2538 = uint(_2536);
    float _2540 = _2468 * _2336;
    float _2542 = as_type<float>(_2524) * _2508;
    out.m_79.x = _2526;
    out.m_79.y = _2528;
    out.m_79.z = _2506;
    out.m_79.w = _2502;
    float _2544 = _2466 * _2334;
    float _2546 = -_2544;
    float _2548 = fma(_2468, _2458, _2546);
    float _2550 = abs(_778);
    float _2552 = log2(_2550);
    float _2554 = -_2540;
    float _2556 = fma(_2470, _2334, _2554);
    int _2558 = ~_2326;
    int _2560 = _2558 + 1;
    int _2562 = ~_2464;
    int _2564 = _2562 + 1;
    float _2566 = _2556 * _2472;
    float _2568 = _2532 * _2472;
    float _2570 = trunc(_2542);
    float _2572 = precise::max(_2570, 0.0);
    uint _2574 = uint(_2572);
    float _2576 = _2548 * _2472;
    int _2578 = _2560 * int(_2538);
    int _2580 = _2578 + _2462;
    float _2582 = -_2498;
    float _2584 = _866 * _2582;
    float _2586 = -_2468;
    float _2588 = _866 * _2586;
    float _2590 = -_2568;
    float _2592 = _866 * _2590;
    float _2594 = _874 * _2498;
    float _2596 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2598 = float(uint(_2580));
    float _2600 = fma(_876, _2478, _2584);
    float _2602 = fma(_876, _2466, _2588);
    float _2604 = fma(_876, _2566, _2592);
    float _2606 = _878 * _2468;
    float _2608 = as_type<float>(_2504) * _2598;
    float _2610 = exp2(_2596);
    int _2612 = _2564 * int(_2574);
    int _2614 = _2612 + _2486;
    float _2616 = _874 * _2468;
    float _2618 = _878 * _2498;
    float _2620 = _874 * _2568;
    float _2622 = fma(_915, _2478, _2594);
    float _2624 = float(uint(_2614));
    float _2626 = fma(_909, _2478, _2618);
    float _2628 = trunc(_2608);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = fma(_915, _2466, _2616);
    float _2636 = fma(_909, _2466, _2606);
    float _2638 = as_type<float>(_2524) * _2624;
    float _2640 = _878 * _2568;
    float _2642 = fma(_915, _2566, _2620);
    float _2644 = fma(_880, _2470, _2602);
    float _2646 = trunc(_2638);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    float _2652 = fma(_909, _2566, _2640);
    float _2654 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    int _2658 = ~_2326;
    int _2660 = _2658 + 1;
    float _2662 = fma(_913, _2520, _2622);
    float _2664 = fma(_913, _2470, _2634);
    float _2666 = fma(_925, _2470, _2636);
    float _2668 = _2656 * _2656;
    int _2670 = int(_2538) + int(_2632);
    float _2672 = fma(_880, _2576, _2604);
    float _2674 = fma(_913, _2576, _2642);
    float _2676 = fma(_925, _2576, _2652);
    float _2678 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2680 = fma(_880, _2520, _2600);
    int _2682 = int(_2574) + int(_2650);
    float _2684 = fma(_2656, -2.0, 3.0);
    int _2686 = ~_2464;
    int _2688 = _2686 + 1;
    int _2690 = _2660 * _2670;
    int _2692 = _2690 + _2462;
    float _2694 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2696 = _2668 * _2684;
    float _2698 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2700 = uint(_2692) >= uint(_2326);
    float _2702 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2704 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2678);
    int _2706 = _2688 * _2682;
    int _2708 = _2706 + _2486;
    bool _2710 = !_2700;
    int _2712 = _2710 ? 0 : (-1);
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2716 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2698);
    int _2718 = _2462 ^ _2326;
    float _2720 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2702);
    int _2722 = ~_2670;
    int _2724 = _2722 + _2712;
    int _2726 = _2724 + 1;
    float _2728 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2694);
    bool _2730 = uint(_2708) >= uint(_2464);
    float _2732 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2716);
    uint _2734 = uint(int(uint(_2718) >> uint(31)));
    int _2736 = _2326 * _2726;
    int _2738 = _2736 + _2462;
    bool _2740 = !_2730;
    int _2742 = _2740 ? 0 : (-1);
    float _2744 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2746 = _2326 == 0;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2750 = ~_2742;
    int _2752 = _2682 + _2750;
    int _2754 = _2752 + 1;
    float _2756 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2744);
    int _2758 = ~int(_2734);
    int _2760 = _2758 + 1;
    float _2762 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2764 = !_2746;
    int _2766 = _2764 ? _2738 : (-1);
    float _2768 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2770 = _2754 ^ _2760;
    float _2772 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2762);
    float _2774 = float(_2766);
    float _2776 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2778 = _2326 == 0;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2782 = ~_2760;
    int _2784 = _2782 + _2770;
    int _2786 = _2784 + 1;
    float _2788 = fma(_2776, _2228, -0.5);
    float _2790 = fma(_2776, _2774, _418);
    float _2792 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2794 = !_2778;
    int _2796 = _2794 ? _2786 : (-1);
    float _2798 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2768);
    float _2800 = fma(_456, _2788, _2790);
    float _2802 = fma(_2792, _2172, -0.5);
    float _2804 = float(_2796);
    float _2806 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2808 = _2800 + 0.5;
    float _2810 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2812 = _778 <= 8000.0;
    bool _2814 = isnan(_778);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan(8000.0);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = -_324;
    float _2826 = fma(_2792, _2804, _2824);
    float _2828 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2720);
    float _2830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2832 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2756);
    float _2834 = fma(_460, _2802, _2826);
    float _2836 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2704);
    float _2838 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2728);
    float _2840 = -_2696;
    float _2842 = _2840 + 1.0;
    float _2844 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2772);
    float _2846 = _2806 * _2780;
    float _2848 = exp2(_2810);
    float _2850 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2838);
    float _2852 = fma(_2842, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2696);
    float _2854 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2798);
    float _2856 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2858 = _2850 + _1417;
    float _2860 = _2822 * _2852;
    float _2862 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2864 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2866 = _2858 * 0.5;
    float _2868 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2870 = _2834 + 0.5;
    float _2872 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2874 = _2110 * _2868;
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = -_2848;
    float _2880 = _2878 + 1.0;
    float _2882 = fma(_925, _2520, _2626);
    float _2884 = _2876;
    if (!_1401)
    {
        _1457 = 1.0;
    }
    float _2886 = _1457;
    float _2888 = _2880 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2890 = _2886;
    if (_1401)
    {
        bool _2892 = _1507 >= _1471;
        bool _2894 = isnan(_1507);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan(_1471);
        bool _2900 = _2896 || _2898;
        float _2902 = float(_2900);
        _2890 = _2902;
    }
    float _2904 = _2890;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2906 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2856);
    float _2908 = _2888 * _1509;
    float _2910 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2862);
    float _2912 = _2904 * _1832;
    float _2914 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2864);
    float _2916 = _1520 * _2908;
    float _2918 = _2090 * _2908;
    float _2920 = -_2888;
    float _2922 = _2920 + 1.0;
    float _2924 = _2872 * _2830;
    float _2926 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2906);
    float _2928 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2910);
    float _2930 = -_2876;
    float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2934 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2914);
    float _2936 = fma(_2086, _2916, _1514);
    float _2938 = -_2912;
    float _2940 = fma(_2938, _2932, 1.0);
    float _2942 = precise::clamp(_2940, 0.0, 1.0);
    float _2944 = fma(_2088, _2916, _1516);
    float _2946 = _1520 * _2922;
    float _2948 = fma(_1520, _2918, _1518);
    float _2950 = _2942 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2836;
    out.m_83.y = _2732;
    out.m_83.z = _2828;
    bool _2952 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2954 = isnan(_1860);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2960 = _2956 || _2958;
    out.m_85.x = _2832;
    out.m_85.y = _2844;
    out.m_85.z = _2854;
    out.m_87.x = _2808;
    out.m_87.y = _2870;
    out.m_87.z = _2846;
    out.m_87.w = _2924;
    out.gl_Position.x = _1449;
    out.gl_Position.y = _1451;
    out.gl_Position.z = _2850;
    out.gl_Position.w = _1417;
    float _2962 = _2908;
    float _2964 = _2942;
    float _2966 = _2922;
    float _2968 = _2916;
    if (!_2960)
    {
        _1770 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _1770;
    out.m_89.z = _2866;
    out.m_89.w = _1417;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2960)
    {
        _2884 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2976 = _2884;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2960)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2982 = _2962;
    out.m_91.x = _2950;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2960)
    {
        _2964 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2988 = _2964;
    float _2990 = _2988;
    float _2992 = _2988;
    if (!_2960)
    {
        _2966 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2994 = _2966;
    out.m_93.x = _2936;
    out.m_93.y = _2944;
    out.m_93.z = _2948;
    out.m_93.w = _2946;
    float _2996 = _2994;
    float _2998 = _2994;
    if (!_2960)
    {
        _2968 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3000 = _2968;
    out.m_95.x = _2926;
    out.m_95.y = _2928;
    out.m_95.z = _2934;
    bool _3002 = !_2960;
    float _3004 = _3000;
    float _3006 = _3000;
    if (!_3002)
    {
        bool _3008 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3010 = isnan(_1860);
        bool _3012 = _3008 || _3010;
        bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3016 = _3012 || _3014;
        if (!_3016)
        {
            float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3020 = _1860 + _3018;
            float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3024 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3022;
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3030 = 1.0 / _3024;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3048 = _3020 * _3030;
            float _3050 = precise::clamp(_3048, 0.0, 1.0);
            float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3056 = fma(_3050, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3058 = fma(_3050, _3054, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3060 = fma(_3050, _3034, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3062 = fma(_3050, _3038, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3064 = fma(_3050, _3042, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3066 = fma(_3050, _3046, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2980 = _3056;
            _2998 = _3064;
            _2974 = _3060;
            _2992 = _3062;
            _2986 = _3058;
            _3006 = _3066;
            _3068 = true;
        }
        else
        {
            bool _3070 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3072 = isnan(_1860);
            bool _3074 = _3070 || _3072;
            bool _3076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3078 = _3074 || _3076;
            if (!_3078)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3080 = _2972;
            _2974 = _3080;
            if (!_3078)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3082 = _2978;
            _2980 = _3082;
            if (!_3078)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3084 = _2984;
            _2986 = _3084;
            if (!_3078)
            {
                _2990 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3086 = _2990;
            _2992 = _3086;
            if (!_3078)
            {
                _2996 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3088 = _2996;
            _2998 = _3088;
            if (!_3078)
            {
                _3004 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3090 = _3004;
            bool _3092 = !_3078;
            _3006 = _3090;
            if (!_3092)
            {
                bool _3094 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3096 = isnan(_1860);
                bool _3098 = _3094 || _3096;
                bool _3100 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3102 = _3098 || _3100;
                if (!_3102)
                {
                    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3106 = _1860 + _3104;
                    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3110 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3108;
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3116 = 1.0 / _3110;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3132 = _3130 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3134 = _3106 * _3116;
                    float _3136 = precise::clamp(_3134, 0.0, 1.0);
                    float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3142 = fma(_3136, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3144 = fma(_3136, _3140, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3146 = fma(_3136, _3120, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3148 = fma(_3136, _3124, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3150 = fma(_3136, _3128, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3152 = fma(_3136, _3132, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2980 = _3142;
                    _2998 = _3150;
                    _2974 = _3146;
                    _2992 = _3148;
                    _2986 = _3144;
                    _3006 = _3152;
                    _3068 = true;
                }
                else
                {
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2998 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2992 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3006 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3068 = false;
    float _3154 = _2980;
    float _3156 = _2998;
    float _3158 = _2974;
    float _3160 = _2992;
    float _3162 = _2986;
    float _3164 = _3006;
    float _3166 = fma(_2928, -0.5, 0.5);
    float _3168 = precise::clamp(_3166, 0.0, 1.0);
    float _3170 = -_3154;
    float _3172 = _3170 + _3156;
    float _3174 = -_3158;
    float _3176 = _3174 + _3160;
    float _3178 = -_3162;
    float _3180 = _3178 + _3164;
    bool _3182 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3184 = fma(_3168, _3172, _3154);
    float _3186 = fma(_3168, _3176, _3158);
    float _3188 = fma(_3168, _3180, _3162);
    float _3190 = _3184 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _3192 = fma(_3186, 0.298911988735198974609375, _3190);
    float _3194 = fma(_3188, 0.114477999508380889892578125, _3192);
    float _3196 = -_3194;
    float _3198 = _3186 + _3196;
    float _3200 = -_3194;
    float _3202 = _3184 + _3200;
    float _3204 = -_3194;
    float _3206 = _3188 + _3204;
    float _3208 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3210 = fma(_3198, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3212 = fma(_3202, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3214 = fma(_3206, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    out.m_59.x = _3208;
    out.m_99.x = _3210;
    out.m_99.y = _3212;
    out.m_99.z = _3214;
    if (!_3182)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3216 = -_1305;
    float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3220 = -_1307;
    float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3224 = -_1309;
    float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3228 = _3218 * _3218;
    float _3230 = fma(_3222, _3222, _3228);
    float _3232 = fma(_3226, _3226, _3230);
    float _3234 = sqrt(_3232);
    float _3236 = rsqrt(_3232);
    float _3238 = -_3234;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3242 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3244 = precise::clamp(_3242, 0.0, 1.0);
    float _3246 = _3222 * _3236;
    float _3248 = _3218 * _3236;
    float _3250 = abs(_3244);
    float _3252 = log2(_3250);
    float _3254 = _3226 * _3236;
    float _3256 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3258 = _2928 * _3248;
    float _3260 = -_3248;
    float _3262 = -_3256;
    float _3264 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3262);
    float _3266 = fma(_2926, _3246, _3258);
    float _3268 = -_3254;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3264);
    float _3272 = fma(_2934, _3254, _3266);
    float _3274 = precise::clamp(_3272, 0.0, 1.0);
    float _3276 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3278 = _3270 + _3276;
    float _3280 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3282 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = exp2(_3280);
    float _3288 = _3286 * _3284;
    float _3290 = _3274 * _3288;
    float _3292 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3296 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _3292;
    out.m_97.y = _3294;
    out.m_97.z = _3296;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3068 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_56.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_134);
        out.gl_Position.z = _3353;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_61.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_172);
        out.gl_Position.z = _3422;
    }
    if (_166)
    {
        return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_63.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = in.m_56.x;
    float _208 = in.m_56.y;
    float _210 = in.m_56.z;
    float _212 = _208 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _214 = _208 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].x, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].x, _214);
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[4].z, _216);
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[6].z, _218);
    float _224 = _220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _226 = _222 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _228 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _232 = floor(_228);
    float _234 = floor(_230);
    float _236 = -_232;
    float _238 = _228 + _236;
    float _240 = -_234;
    float _242 = _230 + _240;
    float2 _3549 = float2(_238, _242);
    float _244 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3549, float2(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3549, float2(0.0), isnan(_3549)), level(0.0)).x;
    float _246 = in.m_63.x;
    float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _250 = log2(_248);
    float _252 = in.m_63.y;
    float _254 = _208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = in.m_63.z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _204 + _268;
    float _272 = 1.0 / _258;
    float _274 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _276 = _250 * _152;
    float _278 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _280 = int(_278);
    float _282 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _284 = _246 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _286 = _246 * 2.0;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _290 = -_266;
    float _292 = fma(_284, 2.0, _290);
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _296 = _252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _298 = _270 * _272;
    float _300 = 1.0 / _262;
    float _302 = _246 + _252;
    float _304 = fma(_296, -2.0, _294);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _308 = 1.0 + _306;
    float _310 = _302 + (-1.0);
    float _312 = float(_280);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _204 + _314;
    float _318 = floor(_286);
    float _320 = _246 + _264;
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _324 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _304);
    float _326 = _320 + (-1.0);
    float _328 = exp2(_276);
    float _330 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _332 = _252 + _264;
    float _334 = _316 * _300;
    float _336 = _332 + (-1.0);
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _340 = int(_338);
    bool _342 = _318 > 0.0;
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _346 = _318 >= 0.0;
    bool _348 = isnan(_318);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = _264 * 2.0;
    float _358 = 1.0 / _312;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _362 = _360 != 0;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _370 = _368 != 0;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    bool _376 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(1.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    bool _386 = !_366;
    int _388 = _386 ? 0 : 1;
    float _390 = 1.0 / _308;
    float _392 = _252 * 2.0;
    bool _394 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _402 = _398 || _400;
    float _404 = float(_340);
    bool _406 = !_362;
    float _408 = _406 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _410 = floor(_392);
    float _412 = _404 * _152;
    float _414 = _358 * _152;
    float _416 = -_152;
    float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[76].x, _292);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    bool _428 = !_370;
    int _430 = _428 ? 0 : 1;
    float _432 = floor(_356);
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _436 = _402 ? _374 : 0.0;
    float _438 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[78].z, _288);
    bool _440 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_204);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _434);
    float _454 = fma(_422, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _456 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _438);
    bool _458 = _410 > 0.0;
    float _460 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _452);
    bool _462 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _464 = isnan(_204);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = _408;
    if (_384)
    {
        float _476 = _436 * _390;
        _156 = _476;
    }
    float _478 = _156;
    bool _480 = _410 >= 0.0;
    bool _482 = isnan(_410);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].z, _274);
    bool _492 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _494 = isnan(_204);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _504;
    float _508 = -_472;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _516 = _432 >= 0.0;
    bool _518 = isnan(_432);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_506, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = -_502;
    float _530 = _528 + 1.0;
    float _532 = fma(_426, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _534 = _502 * _510;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = _450 * _530;
    float _546 = fma(_514, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = fma(_538, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_542, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _552 = _532 * _544;
    int _554 = _488 ? 0 : 1;
    float _556 = _526 * _544;
    float _558 = -_450;
    float _560 = _558 + 1.0;
    int _562 = _354 ? 0 : 1;
    float _564 = _454 * _544;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _556);
    bool _580 = _432 > 0.0;
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    float _584 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _586 = !_568;
    int _588 = _586 ? 0 : 1;
    float _590 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _564);
    int _592 = _524 ? 0 : 1;
    float _594 = _584 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _596 = ~_562;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = fma(_546, _534, _590);
    int _604 = abs(_588);
    float _606 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _594);
    int _608 = _600;
    if (!_342)
    {
        int _610 = ~_562;
        int _612 = _610 + 1;
        _608 = _612;
    }
    int _614 = _608;
    float _616 = fma(_548, _534, _578);
    float _618 = in.m_65.x;
    float _620 = in.m_65.y;
    float _622 = in.m_65.z;
    int _624 = ~_592;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].z, _606);
    float _632 = fma(_550, _534, _582);
    int _634 = _628;
    if (!_580)
    {
        int _636 = ~_592;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = _630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _644 = ~_554;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].y, _616);
    int _652 = _648;
    if (!_458)
    {
        int _654 = ~_554;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    float _660 = _584 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _662 = float(_604);
    float _664 = 1.0 / _642;
    float _666 = float(_640);
    float _668 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _660);
    float _670 = _584 + _282;
    float _672 = _662 * _666;
    bool _674 = !_572;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].z, _668);
    float _680 = _672 * (-2.0);
    int _682 = abs(_676);
    float _684 = _678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _686 = !_576;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_322, _680, _322);
    float _692 = _684 + _642;
    float _694 = float(_614);
    float _696 = fma(_680, _618, _618);
    float _698 = float(_682);
    float _700 = _246 + (-0.5);
    int _702 = abs(_688);
    float _704 = _692 * _664;
    float _706 = _704 * 0.5;
    float _708 = in.m_67.x;
    float _710 = in.m_67.y;
    float _712 = in.m_67.z;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    float _716 = _698 * _694;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[30].w, _718);
    float _722 = float(_658);
    float _724 = fma(_690, _478, _714);
    float _726 = float(_702);
    float _728 = _716 * (-2.0);
    float _730 = _252 + (-0.5);
    float _732 = in.m_69.x;
    float _734 = in.m_69.y;
    float _736 = in.m_69.z;
    float _738 = 1.0 / _720;
    float _740 = fma(_728, _620, _620);
    float _742 = _726 * _722;
    float _744 = fma(_344, _728, _344);
    float _746 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].z, _632);
    float _748 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _750 = _742 * (-2.0);
    float _752 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].x, _602);
    float _754 = _724 * 0.15915493667125701904296875;
    float _756 = fma(_744, _478, _748);
    float _758 = fma(_750, _622, _622);
    float _760 = _264 + (-0.5);
    float _762 = fma(_330, _750, _330);
    float _764 = _752 * _708;
    float _766 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].z, _758);
    float _768 = _650 * _710;
    float _770 = _756 * 0.15915493667125701904296875;
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = fma(_762, _478, _766);
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _778 = _738 * _776;
    float _780 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _754 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _788 = _774 * 0.15915493667125701904296875;
    bool _790 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    bool _794 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _796 = _786 * _780;
    bool _798 = !_790;
    int _800 = _798 ? 0 : 1;
    float _802 = _754 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _746 * _712;
    float _808 = _792 * _772;
    float _810 = _670 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    float _814 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _816 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _818 = isnan(0.5);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _824 = _820 || _822;
    float _826 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _810);
    float _828 = _770 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _812 * _814;
    int _834 = 2;
    if (!_790)
    {
        _834 = 1;
    }
    int _836 = _834;
    float _838 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].z, _826);
    int _840 = _836;
    if (!_794)
    {
        _840 = _800;
    }
    int _842 = _840;
    float _844 = _770 * 6.283185482025146484375;
    float _846 = cos(_844);
    int _848 = _842 << 6;
    float _850 = _838 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _852 = _788 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _670 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _858 = _804 * _830;
    float _860 = _784 * _830;
    float _862 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _856);
    float _864 = _788 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _784 * _846;
    float _870 = _804 * _846;
    float _872 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].z, _862);
    float _874 = _804 * _854;
    float _876 = _846 * _854;
    float _878 = _784 * _854;
    float _880 = _830 * _854;
    float _882 = _874 * _796;
    float _884 = _872 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _886 = _878 * _796;
    int _888 = _848 + 48;
    uint _891 = uint(int(uint(_888) >> uint(2)));
    uint _893 = uint(int(uint(int(_891)) >> uint(2)));
    int _895 = int(_891) & 3;
    float _897 = (*spvDescriptorSet0.vp_c15)._m0[int(_893)][_895];
    int _899 = int(_891) + 1;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    int _903 = _899 & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    float _907 = -_858;
    float _909 = fma(_866, _868, _907);
    float _911 = -_868;
    float _913 = fma(_866, _858, _911);
    float _915 = fma(_866, _870, _860);
    float _917 = -_796;
    float _919 = _866 * _917;
    float _921 = trunc(_884);
    int _923 = int(_921);
    float _925 = fma(_866, _860, _870);
    float _927 = fma(_915, _808, _882);
    int _929 = _848 + 96;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    float _947 = fma(_876, _808, _919);
    float _949 = fma(_909, _808, _886);
    float _951 = fma(_913, _832, _927);
    float _953 = trunc(_850);
    int _955 = int(_953);
    float _957 = fma(_880, _832, _947);
    float _959 = _951 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _961 = _848 + 64;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    uint _965 = uint(int(uint(int(_963)) >> uint(2)));
    int _967 = int(_963) & 3;
    float _969 = (*spvDescriptorSet0.vp_c15)._m0[int(_965)][_967];
    int _971 = int(_963) + 1;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    int _975 = _971 & 3;
    float _977 = (*spvDescriptorSet0.vp_c15)._m0[int(_973)][_975];
    float _979 = _951 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _981 = fma(_925, _832, _949);
    float _983 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[10].x, _959);
    float _985 = _951 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _987 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _989 = _923 + _987;
    int _991 = _989 + 1;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[8].x, _979);
    float _995 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[10].z, _983);
    int _997 = _848 + 104;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    float _1015 = _226 + _995;
    int _1017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1019 = _955 + _1017;
    int _1021 = _1019 + 1;
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[8].z, _993);
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1015 + _1025;
    int _1029 = _848 + 56;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    uint _1033 = uint(int(uint(int(_1031)) >> uint(2)));
    int _1035 = int(_1031) & 3;
    float _1037 = (*spvDescriptorSet0.vp_c15)._m0[int(_1033)][_1035];
    int _1039 = int(_1031) + 1;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    int _1043 = _1039 & 3;
    float _1045 = (*spvDescriptorSet0.vp_c15)._m0[int(_1041)][_1043];
    int _1047 = _1021 | _991;
    float _1049 = _224 + _1023;
    float _1051 = _1027 * _1027;
    bool _1053 = _1021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1049 + _1055;
    int _1059 = _848 + 72;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    bool _1077 = _1047 < 0;
    bool _1079 = _1077 || _1053;
    float _1081 = fma(_1057, _1057, _1051);
    bool _1083 = _991 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1085 = _1083 || _1079;
    float _1087 = sqrt(_1081);
    int _1089 = _848 + 80;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c15)._m0[int(_1101)][_1103];
    float _1107 = _670 * _905;
    float _1109 = fma(_224, _897, _1107);
    float _1111 = _670 * _945;
    float _1113 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[9].x, _985);
    int _1115 = as_type<int>(_951);
    int _1117 = as_type<int>(_1113);
    float _1119 = _1109;
    float _1121 = _1015;
    float _1123 = _1081;
    float _1125 = as_type<float>(_1021);
    if (!_1085)
    {
        int _1127 = _991 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1129 = _1127 + _1021;
        _1115 = _1129;
    }
    int _1131 = _1115;
    float _1133 = _957;
    if (!_1085)
    {
        float _1135 = floor(_850);
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_224, _937, _1111);
    bool _1141 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1143 = _670 * _977;
    float _1145 = fma(_224, _969, _1143);
    int _1147 = as_type<int>(_969);
    float _1149 = _1145;
    if (!_1085)
    {
        int _1151 = _1131 << 2;
        _1147 = _1151;
    }
    int _1153 = _1147;
    float _1155 = fma(_226, _1005, _1139);
    int _1157 = as_type<int>(_1005);
    if (!_1085)
    {
        uint _1159 = uint(int(uint(_1131) >> uint(2)));
        _1157 = int(_1159);
    }
    int _1161 = _1157;
    float _1163 = _1155 + _1013;
    float _1165 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1113);
    int _1167 = _1161;
    if (!_1085)
    {
        int _1169 = 12 & _1153;
        _1117 = _1169;
    }
    int _1171 = _1117;
    float _1173 = fma(_226, _1037, _1109);
    float _1175 = _584 + _1165;
    float _1177 = 1.0 / _1163;
    float _1179 = _1175;
    float _1181 = _1105;
    if (!_1085)
    {
        int _1183 = _1161 << 4;
        int _1185 = _1183 + _1171;
        _1167 = _1185;
    }
    int _1187 = _1167;
    float _1189 = _1173 + _1045;
    if (!_1141)
    {
        _1119 = _1049;
    }
    float _1191 = _1119;
    float _1193 = fma(_226, _1067, _1145);
    float _1195 = _1193 + _1075;
    bool _1197 = !_1141;
    float _1199 = _1191;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1205 = _1087 + _1203;
        float _1207 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = rsqrt(_1081);
        float _1211 = _1205 * _1201;
        float _1213 = _1211 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1221, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1227 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1209 * _1225;
        float _1231 = fma(_1175, _1217, _1227);
        float _1233 = fma(_1057, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1027, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1179 = _1231;
        _1121 = _1235;
        _1199 = _1233;
        _1149 = _1227;
        _1123 = _1209;
    }
    float _1237 = _1179;
    float _1239 = _1121;
    float _1241 = _1199;
    float _1243 = _1149;
    float _1245 = _1123;
    float _1247 = _1243;
    float _1249 = _1245;
    float _1251 = _1241;
    if (_824)
    {
        _1247 = _1237;
    }
    float _1253 = _1247;
    float _1255 = _1253;
    if (_824)
    {
        _1249 = _1239;
    }
    float _1257 = _1249;
    float _1259 = _1257;
    if (!_824)
    {
        float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1263 = _584 + _1261;
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1267 = _224 + _1265;
        float _1269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1271 = -_584;
        float _1273 = _1271 + _1237;
        float _1275 = _1263 * _1263;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1279 = _226 + _1277;
        float _1281 = -_224;
        float _1283 = _1281 + _1241;
        float _1285 = fma(_1267, _1267, _1275);
        float _1287 = -_226;
        float _1289 = _1287 + _1239;
        float _1291 = fma(_1279, _1279, _1285);
        float _1293 = sqrt(_1291);
        float _1295 = precise::min(_1293, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1269;
        float _1299 = fma(_1273, _1297, _584);
        float _1301 = fma(_1283, _1297, _224);
        float _1303 = fma(_1289, _1297, _226);
        _1255 = _1299;
        _1251 = _1301;
        _1259 = _1303;
    }
    float _1305 = _1255;
    float _1307 = _1251;
    float _1309 = _1259;
    int _1311 = _848 + 88;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1333 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1335 = _1189 * _1177;
    float _1337 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1329);
    float _1339 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1331);
    float _1341 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1333);
    float _1343 = _1239;
    if (!_1085)
    {
        int _1345 = _1187 + 400;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
        _1343 = _1353;
    }
    float _1355 = _1343;
    float _1357 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1337);
    bool _1359 = _1335 >= 0.0;
    float _1361 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1339);
    float _1363 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1365 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1341);
    float _1367 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = _1195 * _1177;
    bool _1371 = _1335 <= 1.0;
    bool _1373 = _1371 && _1359;
    float _1375 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1377 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1363);
    float _1379 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1387 = _1369 >= 0.0;
    bool _1389 = _1387 && _1373;
    float _1391 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1377);
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    float _1395 = -_1385;
    float _1397 = fma(_1395, _1383, 1.0);
    bool _1399 = _1369 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1405 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1393);
    float _1407 = _1067;
    if (!_1085)
    {
        float _1409 = floor(_884);
        _1407 = _1409;
    }
    float _1411 = _1407;
    float _1413 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1417 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1405);
    float _1419 = _670 * _1105;
    float _1421 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1423 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1415);
    float _1425 = log2(_1397);
    float _1427 = fma(_224, _1097, _1419);
    if (_1401)
    {
        float _1429 = float(_842);
        _1181 = _1429;
    }
    float _1431 = _1181;
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1421);
    float _1435 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1423);
    float _1437 = 1.0 / _1417;
    float _1439 = _1431;
    if (!_1085)
    {
        float _1441 = -_1411;
        float _1443 = _884 + _1441;
        _1125 = _1443;
    }
    float _1445 = _1125;
    float _1447 = fma(_226, _1319, _1427);
    float _1449 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1433);
    float _1451 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1435);
    float _1453 = _1447 + _1327;
    float _1455 = _1419;
    float _1457 = _1449;
    if (_1401)
    {
        float _1459 = rint(_1431);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        uint _1465 = clamp(_1463, 0u, 65535u);
        _1455 = as_type<float>(_1465);
    }
    float _1467 = _1455;
    float _1469 = _1425 * 0.693147182464599609375;
    float _1471 = _1453 * _1177;
    float _1473 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1475 = _1433;
    float _1477 = _1473;
    if (!_1085)
    {
        float _1479 = rint(_1355);
        float _1481 = precise::max(_1479, 0.0);
        uint _1483 = uint(_1481);
        uint _1485 = clamp(_1483, 0u, 65535u);
        _1475 = as_type<float>(_1485);
    }
    float _1487 = _1475;
    float _1489 = _1449 * _1437;
    float _1491 = _1451 * _1437;
    if (!_1085)
    {
        float _1493 = -_1137;
        float _1495 = _850 + _1493;
        _1439 = _1495;
    }
    float _1497 = _1439;
    float _1499 = fma(_1489, 0.5, 0.5);
    float _1501 = fma(_1491, -0.5, 0.5);
    float _1503 = _1453;
    if (_1401)
    {
        float3 _5573 = float3(_1335, _1369, float(as_type<int>(_1467)));
        float3 _5577 = select(_5573, float3(0.0), isnan(_5573));
        float _1505 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5577.xy, uint(rint(_5577.z)), _1471, level(0.0));
        _1503 = _1505;
    }
    float _1507 = _1503;
    float3 _5587 = float3(_1499, _1501, _1473);
    float _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5587, float3(0.0), isnan(_5587)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5587, float3(0.0), isnan(_5587)), level(0.0)).x;
    float3 _5596 = float3(_1499, _1501, _1473);
    float4 _1512 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _1514 = _1512.x;
    float _1516 = _1512.y;
    float _1518 = _1512.z;
    float _1520 = _1512.w;
    float _1522 = _1445;
    if (!_1085)
    {
        float3 _5619 = float3(_1497, _1445, float(as_type<int>(_1487)));
        float3 _5621 = select(_5619, float3(0.0), isnan(_5619));
        float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5621.xy, uint(rint(_5621.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5621.xy, uint(rint(_5621.z)), level(0.0)).x;
        _1522 = _1524;
    }
    float _1526 = _1522;
    float _1528 = float(uint(_340));
    float _1530 = trunc(_414);
    int _1532 = int(_1530);
    float _1534 = float(_118);
    int _1536 = abs(_388);
    int _1538 = abs(_430);
    float _1540 = 1.0 / _1528;
    float _1542 = float(uint(_1532));
    int _1544 = as_type<int>(_1540) + (-2);
    float _1546 = as_type<float>(_1544) * _1542;
    float _1548 = trunc(_1546);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = ~_340;
    int _1556 = _1554 + 1;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1560 = _1558 != 0;
    float _1562 = 1.0 / _1534;
    bool _1564 = !_1560;
    float _1566 = _1564 ? 7.345489978790283203125 : 1.0;
    int _1568 = _1556 * int(_1552);
    int _1570 = _1568 + _1532;
    float _1572 = float(uint(_1570));
    float _1574 = as_type<float>(_1544) * _1572;
    float _1576 = _1566 * _246;
    int _1578 = ~_340;
    int _1580 = _1578 + 1;
    float _1582 = trunc(_1574);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = floor(_1576);
    int _1590 = int(_1552) + int(_1586);
    float _1592 = float(_1532);
    int _1594 = _1580 * _1590;
    int _1596 = _1594 + _1532;
    bool _1598 = _1592 >= _404;
    bool _1600 = isnan(_1592);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_404);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = -_1588;
    float _1612 = _1576 + _1610;
    float _1614 = _412 * _1562;
    bool _1616 = uint(_1596) >= uint(_340);
    float _1618 = _1612 * _404;
    float _1620 = trunc(_1608);
    int _1622 = int(_1620);
    int _1624 = ~_340;
    int _1626 = _1624 + 1;
    bool _1628 = !_1616;
    int _1630 = _1628 ? 0 : (-1);
    bool _1632 = _340 == 0;
    int _1634 = ~_1590;
    int _1636 = _1634 + _1630;
    int _1638 = _1636 + 1;
    float _1640 = trunc(_1618);
    int _1642 = int(_1640);
    int _1644 = _340 * _1638;
    int _1646 = _1644 + _1532;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1650 = _1648 != 0;
    int _1652 = _340 + (-1);
    float _1654 = trunc(_1614);
    int _1656 = int(_1654);
    int _1658 = ~_1622;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    bool _1664 = !_1632;
    int _1666 = _1664 ? _1646 : (-1);
    bool _1668 = !_1650;
    int _1670 = _1668 ? 0 : 1;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1674 = _1672 != 0;
    int _1676 = _1666 * _1662;
    int _1678 = abs(_1670);
    int _1680 = abs(as_type<int>(_408));
    int _1682 = _1622 * _1652;
    int _1684 = _1682 + _1676;
    int _1686 = _1642 * _1678;
    int _1688 = _1686 + _1532;
    bool _1690 = !_1674;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = _1684 * _1536;
    int _1696 = abs(_1692);
    int _1698 = _1656 * _1680;
    int _1700 = _1698 + _1694;
    int _1702 = _1688 * _1538;
    int _1704 = _1702 + _1700;
    int _1706 = _1642 * _1696;
    int _1708 = _1706 + _1704;
    int _1710 = ~_340;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1708));
    float _1716 = as_type<float>(_1544) * _1714;
    float _1718 = trunc(_1716);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1712 * int(_1722);
    int _1726 = _1724 + _1708;
    float _1728 = float(uint(_1726));
    float _1730 = as_type<float>(_1544) * _1728;
    float _1732 = trunc(_1730);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = int(_1722) + int(_1736);
    int _1740 = _1626 * _1738;
    int _1742 = _1740 + _1708;
    bool _1744 = uint(_1742) >= uint(_340);
    bool _1746 = !_1744;
    int _1748 = _1746 ? 0 : (-1);
    int _1750 = ~_1738;
    int _1752 = _1750 + _1748;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_1738);
    float _1758 = as_type<float>(_1742);
    int _1760 = _1688;
    if (_1085)
    {
        _1756 = 1.0;
    }
    float _1762 = _1756;
    int _1764 = _340 * _1754;
    int _1766 = _1764 + _1708;
    float _1768 = _1762;
    float _1770 = _1507;
    if (!_1085)
    {
        int _1772 = _1131 << 4;
        int _1774 = _1772 + 2048;
        uint _1776 = uint(int(uint(_1774) >> uint(2)));
        uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
        int _1780 = int(_1776) & 3;
        float _1782 = (*spvDescriptorSet0.vp_c15)._m0[int(_1778)][_1780];
        int _1784 = int(_1776) + 1;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        int _1788 = _1784 & 3;
        float _1790 = (*spvDescriptorSet0.vp_c15)._m0[int(_1786)][_1788];
        int _1792 = _1774 + 8;
        uint _1794 = uint(int(uint(_1792) >> uint(2)));
        uint _1796 = uint(int(uint(int(_1794)) >> uint(2)));
        int _1798 = int(_1794) & 3;
        float _1800 = (*spvDescriptorSet0.vp_c15)._m0[int(_1796)][_1798];
        int _1802 = int(_1794) + 1;
        uint _1804 = uint(int(uint(_1802) >> uint(2)));
        int _1806 = _1802 & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        float _1810 = _670 * _1790;
        float _1812 = fma(_224, _1782, _1810);
        float _1814 = fma(_226, _1800, _1812);
        float _1816 = _1814 + _1808;
        float _1818 = precise::clamp(_1816, 0.0, 1.0);
        float _1820 = -_1818;
        float _1822 = _1820 + _1526;
        float _1824 = fma(_1822, 500.0, 1.5);
        float _1826 = exp2(_1824);
        float _1828 = 0.0 + _1826;
        float _1830 = precise::clamp(_1828, 0.0, 1.0);
        _1768 = _1830;
    }
    float _1832 = _1768;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1836 = _1305 + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = _1307 + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1844 = _1309 + _1842;
    float _1846 = _1836 * _1836;
    float _1848 = in.m_71.x;
    float _1850 = fma(_1840, _1840, _1846);
    float _1852 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1854 = fma(_1844, _1844, _1850);
    float _1856 = precise::max(0.0, _1852);
    float _1858 = rsqrt(_1854);
    float _1860 = sqrt(_1854);
    float _1862 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1864 = _1840 * _1862;
    float _1866 = _1844 * _1862;
    float _1868 = -_1862;
    float _1870 = -_1856;
    float _1872 = fma(_1836, _1868, _1870);
    float _1874 = _1864 * _1864;
    float _1876 = _1866 * _1866;
    float _1878 = _1874 + _1876;
    float _1880 = sqrt(_1878);
    bool _1882 = _1880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = _1880 + _1884;
    float _1888 = _414;
    float _1890 = _1836;
    float _1892 = _1886;
    float _1894 = _1864;
    float _1896 = _1874;
    float _1898 = _1872;
    float _1900 = _1876;
    float _1902 = _1848;
    if (_1882)
    {
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1904;
    }
    float _1906 = _1888;
    if (_1882)
    {
        float _1908 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1908;
    }
    float _1910 = _1890;
    float _1912 = _1906;
    float _1914 = _1910;
    if (_1882)
    {
        float _1916 = _1886 * _1906;
        _1892 = _1916;
    }
    float _1918 = _1892;
    if (_1882)
    {
        float _1920 = rsqrt(_1878);
        _1912 = _1920;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    if (_1882)
    {
        float _1926 = _1918 * 0.15915493667125701904296875;
        _1758 = _1926;
    }
    float _1928 = _1758;
    float _1930 = _226;
    if (_1882)
    {
        float _1932 = _1928 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = in.m_71.y;
    float _1940 = _1918;
    if (_1882)
    {
        float _1942 = _1928 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = _1936;
    if (_1882)
    {
        float _1950 = fma(_1936, _1910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = _1952;
    if (_1882)
    {
        float _1956 = _1922 * _1952;
        _1954 = _1956;
    }
    float _1958 = _1954;
    if (_1882)
    {
        float _1960 = _1946 + (-1.0);
        _1914 = _1960;
    }
    float _1962 = _1914;
    float _1964 = _1962;
    if (_1882)
    {
        float _1966 = _1864 * _1958;
        _1894 = _1966;
    }
    float _1968 = _1894;
    if (_1882)
    {
        float _1970 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1970;
    }
    float _1972 = _1924;
    if (!_1882)
    {
        _1964 = _1866;
    }
    float _1974 = _1964;
    float _1976 = _1974;
    if (_1882)
    {
        float _1978 = _1866 * _1958;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1882)
    {
        float _1982 = _1968 * _1968;
        _1896 = _1982;
    }
    float _1984 = _1896;
    if (_1882)
    {
        float _1986 = fma(_1872, _1946, _1972);
        _1898 = _1986;
    }
    float _1988 = _1898;
    if (_1882)
    {
        float _1990 = _1980 * _1980;
        _1900 = _1990;
    }
    float _1992 = _1900;
    float _1994 = fma(_1988, _1988, _1984);
    float _1996 = float(uint(_1688));
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2000 = fma(_1860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1998);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = _1994 + _1992;
    float _2006 = -_2002;
    float _2008 = _2006 + 1.0;
    float _2010 = rsqrt(_2004);
    float _2012 = _2010 * _1968;
    float _2014 = _2010 * _1988;
    float _2016 = _2010 * _1980;
    float _2018 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2020 = abs(_2008);
    float _2022 = log2(_2020);
    float _2024 = -_2018;
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2024);
    float _2028 = -_2016;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2026);
    float _2032 = fma(_2030, -0.5, 0.5);
    float _2034 = fma(_2030, 0.5, 0.5);
    float _2036 = as_type<float>(_1544) * _1996;
    float _2038 = fma(_2034, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2040 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2042 = sqrt(_2032);
    float _2044 = fma(_2034, _2038, -0.212114393711090087890625);
    float _2046 = _2014 + 1.0;
    float _2048 = fma(_2034, _2044, 1.570728778839111328125);
    int _2050 = ~_340;
    int _2052 = _2050 + 1;
    float _2054 = exp2(_2040);
    float _2056 = _2042 * 0.636619746685028076171875;
    float _2058 = trunc(_2036);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = -_2048;
    float _2066 = fma(_2056, _2064, 1.0);
    float _2068 = -_2014;
    float _2070 = fma(_2054, _2046, _2068);
    bool _2072 = !_1632;
    int _2074 = _2072 ? _1766 : (-1);
    float _2076 = in.m_63.w;
    float _2078 = fma(_2070, 0.5, 0.5);
    int _2080 = _2074 >> 31;
    float2 _6410 = float2(_2066, _2078);
    float3 _2084 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6410, float2(0.0), isnan(_6410)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6410, float2(0.0), isnan(_6410)), level(0.0)).xyz;
    float _2086 = _2084.x;
    float _2088 = _2084.y;
    float _2090 = _2084.z;
    int _2092 = _2080 & 3;
    int _2094 = _2052 * int(_2062);
    int _2096 = _2094 + _1688;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2100 = _2098 != 0;
    float _2102 = -_1938;
    float _2104 = _2102 + 1.0;
    int _2106 = _2074 + _2092;
    float _2108 = -_244;
    float _2110 = _2108 + 1.0;
    float _2112 = float(uint(_2096));
    out.m_73.x = _1307;
    out.m_73.y = _1305;
    out.m_73.z = _1309;
    int _2114 = _2106 >> 2;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2118 = _2116 != 0;
    float _2120 = as_type<float>(_1544) * _2112;
    int _2122 = _2114 << 4;
    int _2124 = _2122 + 368;
    float _2126 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2128 = trunc(_2120);
    float _2130 = precise::max(_2128, 0.0);
    uint _2132 = uint(_2130);
    uint _2134 = uint(int(uint(_2124) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[int(_2144)][_2146];
    bool _2150 = _2076 > 0.5;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2154 = _2152 != 0;
    int _2156 = _2150 ? as_type<int>(_2104) : as_type<int>(_1938);
    bool _2158 = _252 > 0.5;
    float _2160 = _2126 * _246;
    float _2162 = _2154 ? as_type<float>(_2156) : _1938;
    float _2164 = _1938;
    bool _2166 = _2150;
    int _2168 = _2074;
    if (_2100)
    {
        float _2170 = _2158 ? _2104 : _1938;
        _2164 = _2170;
    }
    float _2172 = _2164;
    int _2174 = _2074 & 3;
    bool _2176 = _2174 != 0;
    float _2178 = trunc(_2160);
    int _2180 = int(_2178);
    if (_2118)
    {
        bool _2182 = _246 > 0.5;
        _2166 = _2182;
    }
    bool _2184 = _2166;
    int _2186 = _2124 + 8;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2074 & 3;
    bool _2206 = _2204 != 0;
    if (_2118)
    {
        float _2208 = -_1848;
        float _2210 = _2208 + 1.0;
        _2168 = as_type<int>(_2210);
    }
    int _2212 = _2168;
    bool _2214 = uint(_2174) > 1u;
    if (!_2118)
    {
        _474 = _1848;
    }
    float _2216 = _474;
    int _2218 = int(_2062) + int(_2132);
    int _2220 = ~_340;
    int _2222 = _2220 + 1;
    float _2224 = _2216;
    if (_2118)
    {
        float _2226 = _2184 ? as_type<float>(_2212) : _1848;
        _2224 = _2226;
    }
    float _2228 = _2224;
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2232 = _2230 != 0;
    int _2234 = _2222 * _2218;
    int _2236 = _2234 + _1688;
    int _2238 = _2206 ? 0 : 1;
    int _2240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2242 = _2240 != 0;
    int _2244 = ~_2238;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = _2248;
    if (!_2214)
    {
        int _2252 = ~_2238;
        int _2254 = _2252 + 1;
        _2250 = _2254;
    }
    int _2256 = _2250;
    bool _2258 = uint(_2236) >= uint(_340);
    bool _2260 = !_2176;
    int _2262 = _2260 ? 0 : 1;
    bool _2264 = _2174 != 3;
    int _2266 = abs(_2256);
    bool _2268 = !_2258;
    int _2270 = _2268 ? 0 : (-1);
    bool _2272 = uint(_2174) >= 2u;
    bool _2274 = _2258;
    if (_2232)
    {
        bool _2276 = _264 > 0.5;
        _2274 = _2276;
    }
    bool _2278 = _2274;
    int _2280 = abs(_2262);
    int _2282 = _2272 ? 0 : 1;
    int _2284 = ~_2266;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    bool _2290 = _2174 != 3;
    int _2292 = ~_2218;
    int _2294 = _2292 + _2270;
    int _2296 = _2294 + 1;
    int _2298 = _2288 * as_type<int>(_2148);
    int _2300 = ~_2282;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    if (_2264)
    {
        int _2308 = ~_2282;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    int _2314 = _340 * _2296;
    int _2316 = _2314 + _1688;
    int _2318 = ~_2280;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2326 = int(_2324);
    int _2328 = _2180 << 4;
    int _2330 = _2328 + 1712;
    float _2332 = in.m_75.x;
    float _2334 = in.m_75.y;
    float _2336 = in.m_75.z;
    int _2338 = abs(_2312);
    int _2340 = _2322 * as_type<int>(_2140);
    int _2342 = _2340 + _2298;
    bool _2344 = _734 != 0.0;
    bool _2346 = isnan(_734);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    int _2354 = _2330 + 8;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    bool _2364 = !_2290;
    int _2366 = _2364 ? 0 : (-1);
    if (_2232)
    {
        float _2368 = -_1848;
        float _2370 = _2368 + 1.0;
        _1760 = as_type<int>(_2370);
    }
    int _2372 = _1760;
    bool _2374 = _732 == 0.0;
    bool _2376 = !_2352;
    bool _2378 = _2374 && _2376;
    bool _2380 = !_2242;
    int _2382 = _2380 ? 0 : 1;
    uint _2384 = uint(int(uint(_2330) >> uint(2)));
    uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
    int _2388 = int(_2384) & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = int(_2384) + 1;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    int _2396 = _2392 & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    int _2400 = abs(_2366);
    int _2402 = ~_2338;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    bool _2408 = _736 == 0.0;
    bool _2410 = _2408 && _2378;
    int _2412 = abs(_2382);
    int _2414 = _2406 * as_type<int>(_2194);
    int _2416 = _2414 + _2342;
    int _2418 = ~_2400;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    float _2424 = as_type<float>(_2372);
    float _2426 = as_type<float>(_2400);
    if (_2232)
    {
        float _2428 = _2278 ? as_type<float>(_2372) : _1848;
        _1902 = _2428;
    }
    float _2430 = _1902;
    int _2432 = _2422 * as_type<int>(_2202);
    int _2434 = _2432 + _2416;
    int _2436 = ~_2412;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    bool _2442 = !_1632;
    int _2444 = _2442 ? _2316 : (-1);
    if (_2410)
    {
        _2424 = _2332;
    }
    float _2446 = _2424;
    int _2448 = _2434 * _2440;
    float _2450 = float(uint(_2326));
    float _2452 = _2446;
    if (_2410)
    {
        _2426 = _2446;
    }
    float _2454 = _2426;
    float _2456 = _2454;
    if (!_2410)
    {
        _2452 = _2332;
    }
    float _2458 = _2452;
    int _2460 = _2444 * _2412;
    int _2462 = _2460 + _2448;
    int _2464 = abs(_2326);
    float _2466 = in.m_77.x;
    float _2468 = in.m_77.y;
    float _2470 = in.m_77.z;
    float _2472 = in.m_77.w;
    float _2474 = 1.0 / _2450;
    if (!_2410)
    {
        float _2476 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2456 = _2476;
    }
    float _2478 = _2456;
    float _2480 = float(uint(_2464));
    float _2482 = float(uint(_2462));
    float _2484 = 1.0 / _2480;
    int _2486 = abs(_2462);
    float _2488 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2490 = _2362;
    if (_2410)
    {
        _2490 = _2334;
    }
    float _2492 = _2490;
    float _2494 = _2492;
    if (!_2410)
    {
        float _2496 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2334);
        _2494 = _2496;
    }
    float _2498 = _2494;
    if (_2410)
    {
        _1477 = _2336;
    }
    float _2500 = _1477;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2504 = as_type<int>(_2474) + (-2);
    float _2506 = _2488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2508 = float(uint(_2486));
    float _2510 = _2390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2512 = _2398 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2514 = as_type<float>(_2504) * _2482;
    float _2516 = _2500;
    if (!_2410)
    {
        float _2518 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2336);
        _2516 = _2518;
    }
    float _2520 = _2516;
    float _2522 = _2470 * _2458;
    int _2524 = as_type<int>(_2484) + (-2);
    float _2526 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2530 = -_2522;
    float _2532 = fma(_2466, _2336, _2530);
    float _2534 = trunc(_2514);
    float _2536 = precise::max(_2534, 0.0);
    uint _2538 = uint(_2536);
    float _2540 = _2468 * _2336;
    float _2542 = as_type<float>(_2524) * _2508;
    out.m_79.x = _2526;
    out.m_79.y = _2528;
    out.m_79.z = _2506;
    out.m_79.w = _2502;
    float _2544 = _2466 * _2334;
    float _2546 = -_2544;
    float _2548 = fma(_2468, _2458, _2546);
    float _2550 = abs(_778);
    float _2552 = log2(_2550);
    float _2554 = -_2540;
    float _2556 = fma(_2470, _2334, _2554);
    int _2558 = ~_2326;
    int _2560 = _2558 + 1;
    int _2562 = ~_2464;
    int _2564 = _2562 + 1;
    float _2566 = _2556 * _2472;
    float _2568 = _2532 * _2472;
    float _2570 = trunc(_2542);
    float _2572 = precise::max(_2570, 0.0);
    uint _2574 = uint(_2572);
    float _2576 = _2548 * _2472;
    int _2578 = _2560 * int(_2538);
    int _2580 = _2578 + _2462;
    float _2582 = -_2498;
    float _2584 = _866 * _2582;
    float _2586 = -_2468;
    float _2588 = _866 * _2586;
    float _2590 = -_2568;
    float _2592 = _866 * _2590;
    float _2594 = _874 * _2498;
    float _2596 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2598 = float(uint(_2580));
    float _2600 = fma(_876, _2478, _2584);
    float _2602 = fma(_876, _2466, _2588);
    float _2604 = fma(_876, _2566, _2592);
    float _2606 = _878 * _2468;
    float _2608 = as_type<float>(_2504) * _2598;
    float _2610 = exp2(_2596);
    int _2612 = _2564 * int(_2574);
    int _2614 = _2612 + _2486;
    float _2616 = _874 * _2468;
    float _2618 = _878 * _2498;
    float _2620 = _874 * _2568;
    float _2622 = fma(_915, _2478, _2594);
    float _2624 = float(uint(_2614));
    float _2626 = fma(_909, _2478, _2618);
    float _2628 = trunc(_2608);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = fma(_915, _2466, _2616);
    float _2636 = fma(_909, _2466, _2606);
    float _2638 = as_type<float>(_2524) * _2624;
    float _2640 = _878 * _2568;
    float _2642 = fma(_915, _2566, _2620);
    float _2644 = fma(_880, _2470, _2602);
    float _2646 = trunc(_2638);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    float _2652 = fma(_909, _2566, _2640);
    float _2654 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    int _2658 = ~_2326;
    int _2660 = _2658 + 1;
    float _2662 = fma(_913, _2520, _2622);
    float _2664 = fma(_913, _2470, _2634);
    float _2666 = fma(_925, _2470, _2636);
    float _2668 = _2656 * _2656;
    int _2670 = int(_2538) + int(_2632);
    float _2672 = fma(_880, _2576, _2604);
    float _2674 = fma(_913, _2576, _2642);
    float _2676 = fma(_925, _2576, _2652);
    float _2678 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2680 = fma(_880, _2520, _2600);
    int _2682 = int(_2574) + int(_2650);
    float _2684 = fma(_2656, -2.0, 3.0);
    int _2686 = ~_2464;
    int _2688 = _2686 + 1;
    int _2690 = _2660 * _2670;
    int _2692 = _2690 + _2462;
    float _2694 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2696 = _2668 * _2684;
    float _2698 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2700 = uint(_2692) >= uint(_2326);
    float _2702 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2704 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2678);
    int _2706 = _2688 * _2682;
    int _2708 = _2706 + _2486;
    bool _2710 = !_2700;
    int _2712 = _2710 ? 0 : (-1);
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2716 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2698);
    int _2718 = _2462 ^ _2326;
    float _2720 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2702);
    int _2722 = ~_2670;
    int _2724 = _2722 + _2712;
    int _2726 = _2724 + 1;
    float _2728 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2694);
    bool _2730 = uint(_2708) >= uint(_2464);
    float _2732 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2716);
    uint _2734 = uint(int(uint(_2718) >> uint(31)));
    int _2736 = _2326 * _2726;
    int _2738 = _2736 + _2462;
    bool _2740 = !_2730;
    int _2742 = _2740 ? 0 : (-1);
    float _2744 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2746 = _2326 == 0;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2750 = ~_2742;
    int _2752 = _2682 + _2750;
    int _2754 = _2752 + 1;
    float _2756 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2744);
    int _2758 = ~int(_2734);
    int _2760 = _2758 + 1;
    float _2762 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2764 = !_2746;
    int _2766 = _2764 ? _2738 : (-1);
    float _2768 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2770 = _2754 ^ _2760;
    float _2772 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2762);
    float _2774 = float(_2766);
    float _2776 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2778 = _2326 == 0;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2782 = ~_2760;
    int _2784 = _2782 + _2770;
    int _2786 = _2784 + 1;
    float _2788 = fma(_2776, _2228, -0.5);
    float _2790 = fma(_2776, _2774, _418);
    float _2792 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2794 = !_2778;
    int _2796 = _2794 ? _2786 : (-1);
    float _2798 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2768);
    float _2800 = fma(_456, _2788, _2790);
    float _2802 = fma(_2792, _2172, -0.5);
    float _2804 = float(_2796);
    float _2806 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2808 = _2800 + 0.5;
    float _2810 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2812 = _778 <= 8000.0;
    bool _2814 = isnan(_778);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan(8000.0);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = -_324;
    float _2826 = fma(_2792, _2804, _2824);
    float _2828 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2720);
    float _2830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2832 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2756);
    float _2834 = fma(_460, _2802, _2826);
    float _2836 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2704);
    float _2838 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2728);
    float _2840 = -_2696;
    float _2842 = _2840 + 1.0;
    float _2844 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2772);
    float _2846 = _2806 * _2780;
    float _2848 = exp2(_2810);
    float _2850 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2838);
    float _2852 = fma(_2842, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2696);
    float _2854 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2798);
    float _2856 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2858 = _2850 + _1417;
    float _2860 = _2822 * _2852;
    float _2862 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2864 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2866 = _2858 * 0.5;
    float _2868 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2870 = _2834 + 0.5;
    float _2872 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2874 = _2110 * _2868;
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = -_2848;
    float _2880 = _2878 + 1.0;
    float _2882 = fma(_925, _2520, _2626);
    float _2884 = _2876;
    if (!_1401)
    {
        _1457 = 1.0;
    }
    float _2886 = _1457;
    float _2888 = _2880 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2890 = _2886;
    if (_1401)
    {
        bool _2892 = _1507 >= _1471;
        bool _2894 = isnan(_1507);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan(_1471);
        bool _2900 = _2896 || _2898;
        float _2902 = float(_2900);
        _2890 = _2902;
    }
    float _2904 = _2890;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2906 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2856);
    float _2908 = _2888 * _1509;
    float _2910 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2862);
    float _2912 = _2904 * _1832;
    float _2914 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2864);
    float _2916 = _1520 * _2908;
    float _2918 = _2090 * _2908;
    float _2920 = -_2888;
    float _2922 = _2920 + 1.0;
    float _2924 = _2872 * _2830;
    float _2926 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2906);
    float _2928 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2910);
    float _2930 = -_2876;
    float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2934 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2914);
    float _2936 = fma(_2086, _2916, _1514);
    float _2938 = -_2912;
    float _2940 = fma(_2938, _2932, 1.0);
    float _2942 = precise::clamp(_2940, 0.0, 1.0);
    float _2944 = fma(_2088, _2916, _1516);
    float _2946 = _1520 * _2922;
    float _2948 = fma(_1520, _2918, _1518);
    float _2950 = _2942 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2836;
    out.m_83.y = _2732;
    out.m_83.z = _2828;
    bool _2952 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2954 = isnan(_1860);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2960 = _2956 || _2958;
    out.m_85.x = _2832;
    out.m_85.y = _2844;
    out.m_85.z = _2854;
    out.m_87.x = _2808;
    out.m_87.y = _2870;
    out.m_87.z = _2846;
    out.m_87.w = _2924;
    out.gl_Position.x = _1449;
    out.gl_Position.y = _1451;
    out.gl_Position.z = _2850;
    out.gl_Position.w = _1417;
    float _2962 = _2908;
    float _2964 = _2942;
    float _2966 = _2922;
    float _2968 = _2916;
    if (!_2960)
    {
        _1770 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _1770;
    out.m_89.z = _2866;
    out.m_89.w = _1417;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2960)
    {
        _2884 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2976 = _2884;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2960)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2982 = _2962;
    out.m_91.x = _2950;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2960)
    {
        _2964 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2988 = _2964;
    float _2990 = _2988;
    float _2992 = _2988;
    if (!_2960)
    {
        _2966 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2994 = _2966;
    out.m_93.x = _2936;
    out.m_93.y = _2944;
    out.m_93.z = _2948;
    out.m_93.w = _2946;
    float _2996 = _2994;
    float _2998 = _2994;
    if (!_2960)
    {
        _2968 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3000 = _2968;
    out.m_95.x = _2926;
    out.m_95.y = _2928;
    out.m_95.z = _2934;
    bool _3002 = !_2960;
    float _3004 = _3000;
    float _3006 = _3000;
    if (!_3002)
    {
        bool _3008 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3010 = isnan(_1860);
        bool _3012 = _3008 || _3010;
        bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3016 = _3012 || _3014;
        if (!_3016)
        {
            float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3020 = _1860 + _3018;
            float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3024 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3022;
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3030 = 1.0 / _3024;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3048 = _3020 * _3030;
            float _3050 = precise::clamp(_3048, 0.0, 1.0);
            float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3056 = fma(_3050, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3058 = fma(_3050, _3054, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3060 = fma(_3050, _3034, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3062 = fma(_3050, _3038, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3064 = fma(_3050, _3042, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3066 = fma(_3050, _3046, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2980 = _3056;
            _2998 = _3064;
            _2974 = _3060;
            _2992 = _3062;
            _2986 = _3058;
            _3006 = _3066;
            _3068 = true;
        }
        else
        {
            bool _3070 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3072 = isnan(_1860);
            bool _3074 = _3070 || _3072;
            bool _3076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3078 = _3074 || _3076;
            if (!_3078)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3080 = _2972;
            _2974 = _3080;
            if (!_3078)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3082 = _2978;
            _2980 = _3082;
            if (!_3078)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3084 = _2984;
            _2986 = _3084;
            if (!_3078)
            {
                _2990 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3086 = _2990;
            _2992 = _3086;
            if (!_3078)
            {
                _2996 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3088 = _2996;
            _2998 = _3088;
            if (!_3078)
            {
                _3004 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3090 = _3004;
            bool _3092 = !_3078;
            _3006 = _3090;
            if (!_3092)
            {
                bool _3094 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3096 = isnan(_1860);
                bool _3098 = _3094 || _3096;
                bool _3100 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3102 = _3098 || _3100;
                if (!_3102)
                {
                    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3106 = _1860 + _3104;
                    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3110 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3108;
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3116 = 1.0 / _3110;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3132 = _3130 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3134 = _3106 * _3116;
                    float _3136 = precise::clamp(_3134, 0.0, 1.0);
                    float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3142 = fma(_3136, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3144 = fma(_3136, _3140, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3146 = fma(_3136, _3120, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3148 = fma(_3136, _3124, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3150 = fma(_3136, _3128, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3152 = fma(_3136, _3132, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2980 = _3142;
                    _2998 = _3150;
                    _2974 = _3146;
                    _2992 = _3148;
                    _2986 = _3144;
                    _3006 = _3152;
                    _3068 = true;
                }
                else
                {
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2998 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2992 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3006 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3068 = false;
    float _3154 = _2980;
    float _3156 = _2998;
    float _3158 = _2974;
    float _3160 = _2992;
    float _3162 = _2986;
    float _3164 = _3006;
    float _3166 = fma(_2928, -0.5, 0.5);
    float _3168 = precise::clamp(_3166, 0.0, 1.0);
    float _3170 = -_3154;
    float _3172 = _3170 + _3156;
    float _3174 = -_3158;
    float _3176 = _3174 + _3160;
    float _3178 = -_3162;
    float _3180 = _3178 + _3164;
    bool _3182 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3184 = fma(_3168, _3172, _3154);
    float _3186 = fma(_3168, _3176, _3158);
    float _3188 = fma(_3168, _3180, _3162);
    float _3190 = _3184 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _3192 = fma(_3186, 0.298911988735198974609375, _3190);
    float _3194 = fma(_3188, 0.114477999508380889892578125, _3192);
    float _3196 = -_3194;
    float _3198 = _3186 + _3196;
    float _3200 = -_3194;
    float _3202 = _3184 + _3200;
    float _3204 = -_3194;
    float _3206 = _3188 + _3204;
    float _3208 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3210 = fma(_3198, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3212 = fma(_3202, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3214 = fma(_3206, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    out.m_59.x = _3208;
    out.m_99.x = _3210;
    out.m_99.y = _3212;
    out.m_99.z = _3214;
    if (!_3182)
    {
        return out;
    }
    float _3216 = -_1305;
    float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3220 = -_1307;
    float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3224 = -_1309;
    float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3228 = _3218 * _3218;
    float _3230 = fma(_3222, _3222, _3228);
    float _3232 = fma(_3226, _3226, _3230);
    float _3234 = sqrt(_3232);
    float _3236 = rsqrt(_3232);
    float _3238 = -_3234;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3242 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3244 = precise::clamp(_3242, 0.0, 1.0);
    float _3246 = _3222 * _3236;
    float _3248 = _3218 * _3236;
    float _3250 = abs(_3244);
    float _3252 = log2(_3250);
    float _3254 = _3226 * _3236;
    float _3256 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3258 = _2928 * _3248;
    float _3260 = -_3248;
    float _3262 = -_3256;
    float _3264 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3262);
    float _3266 = fma(_2926, _3246, _3258);
    float _3268 = -_3254;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3264);
    float _3272 = fma(_2934, _3254, _3266);
    float _3274 = precise::clamp(_3272, 0.0, 1.0);
    float _3276 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3278 = _3270 + _3276;
    float _3280 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3282 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = exp2(_3280);
    float _3288 = _3286 * _3284;
    float _3290 = _3274 * _3288;
    float _3292 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3296 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _3292;
    out.m_97.y = _3294;
    out.m_97.z = _3296;
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
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3068 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_56.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_134);
        out.gl_Position.z = _3353;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_61.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_172);
        out.gl_Position.z = _3422;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_63.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = in.m_56.x;
    float _208 = in.m_56.y;
    float _210 = in.m_56.z;
    float _212 = _208 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _214 = _208 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[4].x, _212);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[6].x, _214);
    float _220 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[4].z, _216);
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[6].z, _218);
    float _224 = _220 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _226 = _222 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _228 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _232 = floor(_228);
    float _234 = floor(_230);
    float _236 = -_232;
    float _238 = _228 + _236;
    float _240 = -_234;
    float _242 = _230 + _240;
    float2 _3549 = float2(_238, _242);
    float _244 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3549, float2(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3549, float2(0.0), isnan(_3549)), level(0.0)).x;
    float _246 = in.m_63.x;
    float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _250 = log2(_248);
    float _252 = in.m_63.y;
    float _254 = _208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = in.m_63.z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _204 + _268;
    float _272 = 1.0 / _258;
    float _274 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _276 = _250 * _152;
    float _278 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _280 = int(_278);
    float _282 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _284 = _246 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _286 = _246 * 2.0;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _290 = -_266;
    float _292 = fma(_284, 2.0, _290);
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _296 = _252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _298 = _270 * _272;
    float _300 = 1.0 / _262;
    float _302 = _246 + _252;
    float _304 = fma(_296, -2.0, _294);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _308 = 1.0 + _306;
    float _310 = _302 + (-1.0);
    float _312 = float(_280);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _204 + _314;
    float _318 = floor(_286);
    float _320 = _246 + _264;
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _324 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _304);
    float _326 = _320 + (-1.0);
    float _328 = exp2(_276);
    float _330 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _332 = _252 + _264;
    float _334 = _316 * _300;
    float _336 = _332 + (-1.0);
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _340 = int(_338);
    bool _342 = _318 > 0.0;
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _346 = _318 >= 0.0;
    bool _348 = isnan(_318);
    bool _350 = _346 || _348;
    bool _352 = isnan(0.0);
    bool _354 = _350 || _352;
    float _356 = _264 * 2.0;
    float _358 = 1.0 / _312;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _362 = _360 != 0;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _370 = _368 != 0;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    bool _376 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _378 = isnan(1.0);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _384 = _380 || _382;
    bool _386 = !_366;
    int _388 = _386 ? 0 : 1;
    float _390 = 1.0 / _308;
    float _392 = _252 * 2.0;
    bool _394 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _402 = _398 || _400;
    float _404 = float(_340);
    bool _406 = !_362;
    float _408 = _406 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _410 = floor(_392);
    float _412 = _404 * _152;
    float _414 = _358 * _152;
    float _416 = -_152;
    float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[76].x, _292);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    bool _428 = !_370;
    int _430 = _428 ? 0 : 1;
    float _432 = floor(_356);
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _436 = _402 ? _374 : 0.0;
    float _438 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[78].z, _288);
    bool _440 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_204);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _434);
    float _454 = fma(_422, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _456 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _438);
    bool _458 = _410 > 0.0;
    float _460 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _452);
    bool _462 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _464 = isnan(_204);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = _408;
    if (_384)
    {
        float _476 = _436 * _390;
        _156 = _476;
    }
    float _478 = _156;
    bool _480 = _410 >= 0.0;
    bool _482 = isnan(_410);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].z, _274);
    bool _492 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _494 = isnan(_204);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _504;
    float _508 = -_472;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _516 = _432 >= 0.0;
    bool _518 = isnan(_432);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = fma(_506, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = -_502;
    float _530 = _528 + 1.0;
    float _532 = fma(_426, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _534 = _502 * _510;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = _450 * _530;
    float _546 = fma(_514, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = fma(_538, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_542, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _552 = _532 * _544;
    int _554 = _488 ? 0 : 1;
    float _556 = _526 * _544;
    float _558 = -_450;
    float _560 = _558 + 1.0;
    int _562 = _354 ? 0 : 1;
    float _564 = _454 * _544;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _556);
    bool _580 = _432 > 0.0;
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    float _584 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _586 = !_568;
    int _588 = _586 ? 0 : 1;
    float _590 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _564);
    int _592 = _524 ? 0 : 1;
    float _594 = _584 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _596 = ~_562;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = fma(_546, _534, _590);
    int _604 = abs(_588);
    float _606 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _594);
    int _608 = _600;
    if (!_342)
    {
        int _610 = ~_562;
        int _612 = _610 + 1;
        _608 = _612;
    }
    int _614 = _608;
    float _616 = fma(_548, _534, _578);
    float _618 = in.m_65.x;
    float _620 = in.m_65.y;
    float _622 = in.m_65.z;
    int _624 = ~_592;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].z, _606);
    float _632 = fma(_550, _534, _582);
    int _634 = _628;
    if (!_580)
    {
        int _636 = ~_592;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = _630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _644 = ~_554;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].y, _616);
    int _652 = _648;
    if (!_458)
    {
        int _654 = ~_554;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    float _660 = _584 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _662 = float(_604);
    float _664 = 1.0 / _642;
    float _666 = float(_640);
    float _668 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _660);
    float _670 = _584 + _282;
    float _672 = _662 * _666;
    bool _674 = !_572;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].z, _668);
    float _680 = _672 * (-2.0);
    int _682 = abs(_676);
    float _684 = _678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _686 = !_576;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_322, _680, _322);
    float _692 = _684 + _642;
    float _694 = float(_614);
    float _696 = fma(_680, _618, _618);
    float _698 = float(_682);
    float _700 = _246 + (-0.5);
    int _702 = abs(_688);
    float _704 = _692 * _664;
    float _706 = _704 * 0.5;
    float _708 = in.m_67.x;
    float _710 = in.m_67.y;
    float _712 = in.m_67.z;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _696);
    float _716 = _698 * _694;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[30].w, _718);
    float _722 = float(_658);
    float _724 = fma(_690, _478, _714);
    float _726 = float(_702);
    float _728 = _716 * (-2.0);
    float _730 = _252 + (-0.5);
    float _732 = in.m_69.x;
    float _734 = in.m_69.y;
    float _736 = in.m_69.z;
    float _738 = 1.0 / _720;
    float _740 = fma(_728, _620, _620);
    float _742 = _726 * _722;
    float _744 = fma(_344, _728, _344);
    float _746 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].z, _632);
    float _748 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _750 = _742 * (-2.0);
    float _752 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[145].x, _602);
    float _754 = _724 * 0.15915493667125701904296875;
    float _756 = fma(_744, _478, _748);
    float _758 = fma(_750, _622, _622);
    float _760 = _264 + (-0.5);
    float _762 = fma(_330, _750, _330);
    float _764 = _752 * _708;
    float _766 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].z, _758);
    float _768 = _650 * _710;
    float _770 = _756 * 0.15915493667125701904296875;
    float _772 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = fma(_762, _478, _766);
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _778 = _738 * _776;
    float _780 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _754 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _788 = _774 * 0.15915493667125701904296875;
    bool _790 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    bool _794 = _778 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _796 = _786 * _780;
    bool _798 = !_790;
    int _800 = _798 ? 0 : 1;
    float _802 = _754 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _746 * _712;
    float _808 = _792 * _772;
    float _810 = _670 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    float _814 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _816 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _818 = isnan(0.5);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _824 = _820 || _822;
    float _826 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _810);
    float _828 = _770 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _812 * _814;
    int _834 = 2;
    if (!_790)
    {
        _834 = 1;
    }
    int _836 = _834;
    float _838 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].z, _826);
    int _840 = _836;
    if (!_794)
    {
        _840 = _800;
    }
    int _842 = _840;
    float _844 = _770 * 6.283185482025146484375;
    float _846 = cos(_844);
    int _848 = _842 << 6;
    float _850 = _838 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _852 = _788 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _670 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _858 = _804 * _830;
    float _860 = _784 * _830;
    float _862 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _856);
    float _864 = _788 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _784 * _846;
    float _870 = _804 * _846;
    float _872 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].z, _862);
    float _874 = _804 * _854;
    float _876 = _846 * _854;
    float _878 = _784 * _854;
    float _880 = _830 * _854;
    float _882 = _874 * _796;
    float _884 = _872 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _886 = _878 * _796;
    int _888 = _848 + 48;
    uint _891 = uint(int(uint(_888) >> uint(2)));
    uint _893 = uint(int(uint(int(_891)) >> uint(2)));
    int _895 = int(_891) & 3;
    float _897 = (*spvDescriptorSet0.vp_c15)._m0[int(_893)][_895];
    int _899 = int(_891) + 1;
    uint _901 = uint(int(uint(_899) >> uint(2)));
    int _903 = _899 & 3;
    float _905 = (*spvDescriptorSet0.vp_c15)._m0[int(_901)][_903];
    float _907 = -_858;
    float _909 = fma(_866, _868, _907);
    float _911 = -_868;
    float _913 = fma(_866, _858, _911);
    float _915 = fma(_866, _870, _860);
    float _917 = -_796;
    float _919 = _866 * _917;
    float _921 = trunc(_884);
    int _923 = int(_921);
    float _925 = fma(_866, _860, _870);
    float _927 = fma(_915, _808, _882);
    int _929 = _848 + 96;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c15)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    float _947 = fma(_876, _808, _919);
    float _949 = fma(_909, _808, _886);
    float _951 = fma(_913, _832, _927);
    float _953 = trunc(_850);
    int _955 = int(_953);
    float _957 = fma(_880, _832, _947);
    float _959 = _951 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _961 = _848 + 64;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    uint _965 = uint(int(uint(int(_963)) >> uint(2)));
    int _967 = int(_963) & 3;
    float _969 = (*spvDescriptorSet0.vp_c15)._m0[int(_965)][_967];
    int _971 = int(_963) + 1;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    int _975 = _971 & 3;
    float _977 = (*spvDescriptorSet0.vp_c15)._m0[int(_973)][_975];
    float _979 = _951 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _981 = fma(_925, _832, _949);
    float _983 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[10].x, _959);
    float _985 = _951 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _987 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _989 = _923 + _987;
    int _991 = _989 + 1;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[8].x, _979);
    float _995 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[10].z, _983);
    int _997 = _848 + 104;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
    int _1003 = int(_999) & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = int(_999) + 1;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    int _1011 = _1007 & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    float _1015 = _226 + _995;
    int _1017 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1019 = _955 + _1017;
    int _1021 = _1019 + 1;
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[8].z, _993);
    float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1027 = _1015 + _1025;
    int _1029 = _848 + 56;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    uint _1033 = uint(int(uint(int(_1031)) >> uint(2)));
    int _1035 = int(_1031) & 3;
    float _1037 = (*spvDescriptorSet0.vp_c15)._m0[int(_1033)][_1035];
    int _1039 = int(_1031) + 1;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    int _1043 = _1039 & 3;
    float _1045 = (*spvDescriptorSet0.vp_c15)._m0[int(_1041)][_1043];
    int _1047 = _1021 | _991;
    float _1049 = _224 + _1023;
    float _1051 = _1027 * _1027;
    bool _1053 = _1021 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1057 = _1049 + _1055;
    int _1059 = _848 + 72;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c15)._m0[int(_1071)][_1073];
    bool _1077 = _1047 < 0;
    bool _1079 = _1077 || _1053;
    float _1081 = fma(_1057, _1057, _1051);
    bool _1083 = _991 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1085 = _1083 || _1079;
    float _1087 = sqrt(_1081);
    int _1089 = _848 + 80;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c15)._m0[int(_1101)][_1103];
    float _1107 = _670 * _905;
    float _1109 = fma(_224, _897, _1107);
    float _1111 = _670 * _945;
    float _1113 = fma(_957, (*spvDescriptorSet0.vp_c10)._m0[9].x, _985);
    int _1115 = as_type<int>(_951);
    int _1117 = as_type<int>(_1113);
    float _1119 = _1109;
    float _1121 = _1015;
    float _1123 = _1081;
    float _1125 = as_type<float>(_1021);
    if (!_1085)
    {
        int _1127 = _991 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1129 = _1127 + _1021;
        _1115 = _1129;
    }
    int _1131 = _1115;
    float _1133 = _957;
    if (!_1085)
    {
        float _1135 = floor(_850);
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = fma(_224, _937, _1111);
    bool _1141 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1143 = _670 * _977;
    float _1145 = fma(_224, _969, _1143);
    int _1147 = as_type<int>(_969);
    float _1149 = _1145;
    if (!_1085)
    {
        int _1151 = _1131 << 2;
        _1147 = _1151;
    }
    int _1153 = _1147;
    float _1155 = fma(_226, _1005, _1139);
    int _1157 = as_type<int>(_1005);
    if (!_1085)
    {
        uint _1159 = uint(int(uint(_1131) >> uint(2)));
        _1157 = int(_1159);
    }
    int _1161 = _1157;
    float _1163 = _1155 + _1013;
    float _1165 = fma(_981, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1113);
    int _1167 = _1161;
    if (!_1085)
    {
        int _1169 = 12 & _1153;
        _1117 = _1169;
    }
    int _1171 = _1117;
    float _1173 = fma(_226, _1037, _1109);
    float _1175 = _584 + _1165;
    float _1177 = 1.0 / _1163;
    float _1179 = _1175;
    float _1181 = _1105;
    if (!_1085)
    {
        int _1183 = _1161 << 4;
        int _1185 = _1183 + _1171;
        _1167 = _1185;
    }
    int _1187 = _1167;
    float _1189 = _1173 + _1045;
    if (!_1141)
    {
        _1119 = _1049;
    }
    float _1191 = _1119;
    float _1193 = fma(_226, _1067, _1145);
    float _1195 = _1193 + _1075;
    bool _1197 = !_1141;
    float _1199 = _1191;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1205 = _1087 + _1203;
        float _1207 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = rsqrt(_1081);
        float _1211 = _1205 * _1201;
        float _1213 = _1211 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1221, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1227 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1209 * _1225;
        float _1231 = fma(_1175, _1217, _1227);
        float _1233 = fma(_1057, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1027, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1179 = _1231;
        _1121 = _1235;
        _1199 = _1233;
        _1149 = _1227;
        _1123 = _1209;
    }
    float _1237 = _1179;
    float _1239 = _1121;
    float _1241 = _1199;
    float _1243 = _1149;
    float _1245 = _1123;
    float _1247 = _1243;
    float _1249 = _1245;
    float _1251 = _1241;
    if (_824)
    {
        _1247 = _1237;
    }
    float _1253 = _1247;
    float _1255 = _1253;
    if (_824)
    {
        _1249 = _1239;
    }
    float _1257 = _1249;
    float _1259 = _1257;
    if (!_824)
    {
        float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1263 = _584 + _1261;
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1267 = _224 + _1265;
        float _1269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1271 = -_584;
        float _1273 = _1271 + _1237;
        float _1275 = _1263 * _1263;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1279 = _226 + _1277;
        float _1281 = -_224;
        float _1283 = _1281 + _1241;
        float _1285 = fma(_1267, _1267, _1275);
        float _1287 = -_226;
        float _1289 = _1287 + _1239;
        float _1291 = fma(_1279, _1279, _1285);
        float _1293 = sqrt(_1291);
        float _1295 = precise::min(_1293, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1269;
        float _1299 = fma(_1273, _1297, _584);
        float _1301 = fma(_1283, _1297, _224);
        float _1303 = fma(_1289, _1297, _226);
        _1255 = _1299;
        _1251 = _1301;
        _1259 = _1303;
    }
    float _1305 = _1255;
    float _1307 = _1251;
    float _1309 = _1259;
    int _1311 = _848 + 88;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1333 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1335 = _1189 * _1177;
    float _1337 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1329);
    float _1339 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1331);
    float _1341 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1333);
    float _1343 = _1239;
    if (!_1085)
    {
        int _1345 = _1187 + 400;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
        int _1351 = int(_1347) & 3;
        float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
        _1343 = _1353;
    }
    float _1355 = _1343;
    float _1357 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1337);
    bool _1359 = _1335 >= 0.0;
    float _1361 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1339);
    float _1363 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1365 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1341);
    float _1367 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = _1195 * _1177;
    bool _1371 = _1335 <= 1.0;
    bool _1373 = _1371 && _1359;
    float _1375 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1377 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1363);
    float _1379 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1387 = _1369 >= 0.0;
    bool _1389 = _1387 && _1373;
    float _1391 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1377);
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    float _1395 = -_1385;
    float _1397 = fma(_1395, _1383, 1.0);
    bool _1399 = _1369 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1405 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1393);
    float _1407 = _1067;
    if (!_1085)
    {
        float _1409 = floor(_884);
        _1407 = _1409;
    }
    float _1411 = _1407;
    float _1413 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1417 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1405);
    float _1419 = _670 * _1105;
    float _1421 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1423 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1415);
    float _1425 = log2(_1397);
    float _1427 = fma(_224, _1097, _1419);
    if (_1401)
    {
        float _1429 = float(_842);
        _1181 = _1429;
    }
    float _1431 = _1181;
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1421);
    float _1435 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1423);
    float _1437 = 1.0 / _1417;
    float _1439 = _1431;
    if (!_1085)
    {
        float _1441 = -_1411;
        float _1443 = _884 + _1441;
        _1125 = _1443;
    }
    float _1445 = _1125;
    float _1447 = fma(_226, _1319, _1427);
    float _1449 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1433);
    float _1451 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1435);
    float _1453 = _1447 + _1327;
    float _1455 = _1419;
    float _1457 = _1449;
    if (_1401)
    {
        float _1459 = rint(_1431);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        uint _1465 = clamp(_1463, 0u, 65535u);
        _1455 = as_type<float>(_1465);
    }
    float _1467 = _1455;
    float _1469 = _1425 * 0.693147182464599609375;
    float _1471 = _1453 * _1177;
    float _1473 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1475 = _1433;
    float _1477 = _1473;
    if (!_1085)
    {
        float _1479 = rint(_1355);
        float _1481 = precise::max(_1479, 0.0);
        uint _1483 = uint(_1481);
        uint _1485 = clamp(_1483, 0u, 65535u);
        _1475 = as_type<float>(_1485);
    }
    float _1487 = _1475;
    float _1489 = _1449 * _1437;
    float _1491 = _1451 * _1437;
    if (!_1085)
    {
        float _1493 = -_1137;
        float _1495 = _850 + _1493;
        _1439 = _1495;
    }
    float _1497 = _1439;
    float _1499 = fma(_1489, 0.5, 0.5);
    float _1501 = fma(_1491, -0.5, 0.5);
    float _1503 = _1453;
    if (_1401)
    {
        float3 _5573 = float3(_1335, _1369, float(as_type<int>(_1467)));
        float3 _5577 = select(_5573, float3(0.0), isnan(_5573));
        float _1505 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5577.xy, uint(rint(_5577.z)), _1471, level(0.0));
        _1503 = _1505;
    }
    float _1507 = _1503;
    float3 _5587 = float3(_1499, _1501, _1473);
    float _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5587, float3(0.0), isnan(_5587)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5587, float3(0.0), isnan(_5587)), level(0.0)).x;
    float3 _5596 = float3(_1499, _1501, _1473);
    float4 _1512 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _1514 = _1512.x;
    float _1516 = _1512.y;
    float _1518 = _1512.z;
    float _1520 = _1512.w;
    float _1522 = _1445;
    if (!_1085)
    {
        float3 _5619 = float3(_1497, _1445, float(as_type<int>(_1487)));
        float3 _5621 = select(_5619, float3(0.0), isnan(_5619));
        float _1524 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5621.xy, uint(rint(_5621.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5621.xy, uint(rint(_5621.z)), level(0.0)).x;
        _1522 = _1524;
    }
    float _1526 = _1522;
    float _1528 = float(uint(_340));
    float _1530 = trunc(_414);
    int _1532 = int(_1530);
    float _1534 = float(_118);
    int _1536 = abs(_388);
    int _1538 = abs(_430);
    float _1540 = 1.0 / _1528;
    float _1542 = float(uint(_1532));
    int _1544 = as_type<int>(_1540) + (-2);
    float _1546 = as_type<float>(_1544) * _1542;
    float _1548 = trunc(_1546);
    float _1550 = precise::max(_1548, 0.0);
    uint _1552 = uint(_1550);
    int _1554 = ~_340;
    int _1556 = _1554 + 1;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1560 = _1558 != 0;
    float _1562 = 1.0 / _1534;
    bool _1564 = !_1560;
    float _1566 = _1564 ? 7.345489978790283203125 : 1.0;
    int _1568 = _1556 * int(_1552);
    int _1570 = _1568 + _1532;
    float _1572 = float(uint(_1570));
    float _1574 = as_type<float>(_1544) * _1572;
    float _1576 = _1566 * _246;
    int _1578 = ~_340;
    int _1580 = _1578 + 1;
    float _1582 = trunc(_1574);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = floor(_1576);
    int _1590 = int(_1552) + int(_1586);
    float _1592 = float(_1532);
    int _1594 = _1580 * _1590;
    int _1596 = _1594 + _1532;
    bool _1598 = _1592 >= _404;
    bool _1600 = isnan(_1592);
    bool _1602 = _1598 || _1600;
    bool _1604 = isnan(_404);
    bool _1606 = _1602 || _1604;
    float _1608 = float(_1606);
    float _1610 = -_1588;
    float _1612 = _1576 + _1610;
    float _1614 = _412 * _1562;
    bool _1616 = uint(_1596) >= uint(_340);
    float _1618 = _1612 * _404;
    float _1620 = trunc(_1608);
    int _1622 = int(_1620);
    int _1624 = ~_340;
    int _1626 = _1624 + 1;
    bool _1628 = !_1616;
    int _1630 = _1628 ? 0 : (-1);
    bool _1632 = _340 == 0;
    int _1634 = ~_1590;
    int _1636 = _1634 + _1630;
    int _1638 = _1636 + 1;
    float _1640 = trunc(_1618);
    int _1642 = int(_1640);
    int _1644 = _340 * _1638;
    int _1646 = _1644 + _1532;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1650 = _1648 != 0;
    int _1652 = _340 + (-1);
    float _1654 = trunc(_1614);
    int _1656 = int(_1654);
    int _1658 = ~_1622;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    bool _1664 = !_1632;
    int _1666 = _1664 ? _1646 : (-1);
    bool _1668 = !_1650;
    int _1670 = _1668 ? 0 : 1;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1674 = _1672 != 0;
    int _1676 = _1666 * _1662;
    int _1678 = abs(_1670);
    int _1680 = abs(as_type<int>(_408));
    int _1682 = _1622 * _1652;
    int _1684 = _1682 + _1676;
    int _1686 = _1642 * _1678;
    int _1688 = _1686 + _1532;
    bool _1690 = !_1674;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = _1684 * _1536;
    int _1696 = abs(_1692);
    int _1698 = _1656 * _1680;
    int _1700 = _1698 + _1694;
    int _1702 = _1688 * _1538;
    int _1704 = _1702 + _1700;
    int _1706 = _1642 * _1696;
    int _1708 = _1706 + _1704;
    int _1710 = ~_340;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1708));
    float _1716 = as_type<float>(_1544) * _1714;
    float _1718 = trunc(_1716);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1712 * int(_1722);
    int _1726 = _1724 + _1708;
    float _1728 = float(uint(_1726));
    float _1730 = as_type<float>(_1544) * _1728;
    float _1732 = trunc(_1730);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = int(_1722) + int(_1736);
    int _1740 = _1626 * _1738;
    int _1742 = _1740 + _1708;
    bool _1744 = uint(_1742) >= uint(_340);
    bool _1746 = !_1744;
    int _1748 = _1746 ? 0 : (-1);
    int _1750 = ~_1738;
    int _1752 = _1750 + _1748;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_1738);
    float _1758 = as_type<float>(_1742);
    int _1760 = _1688;
    if (_1085)
    {
        _1756 = 1.0;
    }
    float _1762 = _1756;
    int _1764 = _340 * _1754;
    int _1766 = _1764 + _1708;
    float _1768 = _1762;
    float _1770 = _1507;
    if (!_1085)
    {
        int _1772 = _1131 << 4;
        int _1774 = _1772 + 2048;
        uint _1776 = uint(int(uint(_1774) >> uint(2)));
        uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
        int _1780 = int(_1776) & 3;
        float _1782 = (*spvDescriptorSet0.vp_c15)._m0[int(_1778)][_1780];
        int _1784 = int(_1776) + 1;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        int _1788 = _1784 & 3;
        float _1790 = (*spvDescriptorSet0.vp_c15)._m0[int(_1786)][_1788];
        int _1792 = _1774 + 8;
        uint _1794 = uint(int(uint(_1792) >> uint(2)));
        uint _1796 = uint(int(uint(int(_1794)) >> uint(2)));
        int _1798 = int(_1794) & 3;
        float _1800 = (*spvDescriptorSet0.vp_c15)._m0[int(_1796)][_1798];
        int _1802 = int(_1794) + 1;
        uint _1804 = uint(int(uint(_1802) >> uint(2)));
        int _1806 = _1802 & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        float _1810 = _670 * _1790;
        float _1812 = fma(_224, _1782, _1810);
        float _1814 = fma(_226, _1800, _1812);
        float _1816 = _1814 + _1808;
        float _1818 = precise::clamp(_1816, 0.0, 1.0);
        float _1820 = -_1818;
        float _1822 = _1820 + _1526;
        float _1824 = fma(_1822, 500.0, 1.5);
        float _1826 = exp2(_1824);
        float _1828 = 0.0 + _1826;
        float _1830 = precise::clamp(_1828, 0.0, 1.0);
        _1768 = _1830;
    }
    float _1832 = _1768;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1836 = _1305 + _1834;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = _1307 + _1838;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1844 = _1309 + _1842;
    float _1846 = _1836 * _1836;
    float _1848 = in.m_71.x;
    float _1850 = fma(_1840, _1840, _1846);
    float _1852 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1854 = fma(_1844, _1844, _1850);
    float _1856 = precise::max(0.0, _1852);
    float _1858 = rsqrt(_1854);
    float _1860 = sqrt(_1854);
    float _1862 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1864 = _1840 * _1862;
    float _1866 = _1844 * _1862;
    float _1868 = -_1862;
    float _1870 = -_1856;
    float _1872 = fma(_1836, _1868, _1870);
    float _1874 = _1864 * _1864;
    float _1876 = _1866 * _1866;
    float _1878 = _1874 + _1876;
    float _1880 = sqrt(_1878);
    bool _1882 = _1880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1886 = _1880 + _1884;
    float _1888 = _414;
    float _1890 = _1836;
    float _1892 = _1886;
    float _1894 = _1864;
    float _1896 = _1874;
    float _1898 = _1872;
    float _1900 = _1876;
    float _1902 = _1848;
    if (_1882)
    {
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1904;
    }
    float _1906 = _1888;
    if (_1882)
    {
        float _1908 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1908;
    }
    float _1910 = _1890;
    float _1912 = _1906;
    float _1914 = _1910;
    if (_1882)
    {
        float _1916 = _1886 * _1906;
        _1892 = _1916;
    }
    float _1918 = _1892;
    if (_1882)
    {
        float _1920 = rsqrt(_1878);
        _1912 = _1920;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    if (_1882)
    {
        float _1926 = _1918 * 0.15915493667125701904296875;
        _1758 = _1926;
    }
    float _1928 = _1758;
    float _1930 = _226;
    if (_1882)
    {
        float _1932 = _1928 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1930 = _1934;
    }
    float _1936 = _1930;
    float _1938 = in.m_71.y;
    float _1940 = _1918;
    if (_1882)
    {
        float _1942 = _1928 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = _1936;
    if (_1882)
    {
        float _1950 = fma(_1936, _1910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = _1952;
    if (_1882)
    {
        float _1956 = _1922 * _1952;
        _1954 = _1956;
    }
    float _1958 = _1954;
    if (_1882)
    {
        float _1960 = _1946 + (-1.0);
        _1914 = _1960;
    }
    float _1962 = _1914;
    float _1964 = _1962;
    if (_1882)
    {
        float _1966 = _1864 * _1958;
        _1894 = _1966;
    }
    float _1968 = _1894;
    if (_1882)
    {
        float _1970 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1970;
    }
    float _1972 = _1924;
    if (!_1882)
    {
        _1964 = _1866;
    }
    float _1974 = _1964;
    float _1976 = _1974;
    if (_1882)
    {
        float _1978 = _1866 * _1958;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1882)
    {
        float _1982 = _1968 * _1968;
        _1896 = _1982;
    }
    float _1984 = _1896;
    if (_1882)
    {
        float _1986 = fma(_1872, _1946, _1972);
        _1898 = _1986;
    }
    float _1988 = _1898;
    if (_1882)
    {
        float _1990 = _1980 * _1980;
        _1900 = _1990;
    }
    float _1992 = _1900;
    float _1994 = fma(_1988, _1988, _1984);
    float _1996 = float(uint(_1688));
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2000 = fma(_1860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1998);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = _1994 + _1992;
    float _2006 = -_2002;
    float _2008 = _2006 + 1.0;
    float _2010 = rsqrt(_2004);
    float _2012 = _2010 * _1968;
    float _2014 = _2010 * _1988;
    float _2016 = _2010 * _1980;
    float _2018 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2020 = abs(_2008);
    float _2022 = log2(_2020);
    float _2024 = -_2018;
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2024);
    float _2028 = -_2016;
    float _2030 = fma(_2028, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2026);
    float _2032 = fma(_2030, -0.5, 0.5);
    float _2034 = fma(_2030, 0.5, 0.5);
    float _2036 = as_type<float>(_1544) * _1996;
    float _2038 = fma(_2034, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2040 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2042 = sqrt(_2032);
    float _2044 = fma(_2034, _2038, -0.212114393711090087890625);
    float _2046 = _2014 + 1.0;
    float _2048 = fma(_2034, _2044, 1.570728778839111328125);
    int _2050 = ~_340;
    int _2052 = _2050 + 1;
    float _2054 = exp2(_2040);
    float _2056 = _2042 * 0.636619746685028076171875;
    float _2058 = trunc(_2036);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = -_2048;
    float _2066 = fma(_2056, _2064, 1.0);
    float _2068 = -_2014;
    float _2070 = fma(_2054, _2046, _2068);
    bool _2072 = !_1632;
    int _2074 = _2072 ? _1766 : (-1);
    float _2076 = in.m_63.w;
    float _2078 = fma(_2070, 0.5, 0.5);
    int _2080 = _2074 >> 31;
    float2 _6410 = float2(_2066, _2078);
    float3 _2084 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6410, float2(0.0), isnan(_6410)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6410, float2(0.0), isnan(_6410)), level(0.0)).xyz;
    float _2086 = _2084.x;
    float _2088 = _2084.y;
    float _2090 = _2084.z;
    int _2092 = _2080 & 3;
    int _2094 = _2052 * int(_2062);
    int _2096 = _2094 + _1688;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2100 = _2098 != 0;
    float _2102 = -_1938;
    float _2104 = _2102 + 1.0;
    int _2106 = _2074 + _2092;
    float _2108 = -_244;
    float _2110 = _2108 + 1.0;
    float _2112 = float(uint(_2096));
    out.m_73.x = _1307;
    out.m_73.y = _1305;
    out.m_73.z = _1309;
    int _2114 = _2106 >> 2;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2118 = _2116 != 0;
    float _2120 = as_type<float>(_1544) * _2112;
    int _2122 = _2114 << 4;
    int _2124 = _2122 + 368;
    float _2126 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2128 = trunc(_2120);
    float _2130 = precise::max(_2128, 0.0);
    uint _2132 = uint(_2130);
    uint _2134 = uint(int(uint(_2124) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[int(_2144)][_2146];
    bool _2150 = _2076 > 0.5;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2154 = _2152 != 0;
    int _2156 = _2150 ? as_type<int>(_2104) : as_type<int>(_1938);
    bool _2158 = _252 > 0.5;
    float _2160 = _2126 * _246;
    float _2162 = _2154 ? as_type<float>(_2156) : _1938;
    float _2164 = _1938;
    bool _2166 = _2150;
    int _2168 = _2074;
    if (_2100)
    {
        float _2170 = _2158 ? _2104 : _1938;
        _2164 = _2170;
    }
    float _2172 = _2164;
    int _2174 = _2074 & 3;
    bool _2176 = _2174 != 0;
    float _2178 = trunc(_2160);
    int _2180 = int(_2178);
    if (_2118)
    {
        bool _2182 = _246 > 0.5;
        _2166 = _2182;
    }
    bool _2184 = _2166;
    int _2186 = _2124 + 8;
    uint _2188 = uint(int(uint(_2186) >> uint(2)));
    uint _2190 = uint(int(uint(int(_2188)) >> uint(2)));
    int _2192 = int(_2188) & 3;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[int(_2190)][_2192];
    int _2196 = int(_2188) + 1;
    uint _2198 = uint(int(uint(_2196) >> uint(2)));
    int _2200 = _2196 & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = _2074 & 3;
    bool _2206 = _2204 != 0;
    if (_2118)
    {
        float _2208 = -_1848;
        float _2210 = _2208 + 1.0;
        _2168 = as_type<int>(_2210);
    }
    int _2212 = _2168;
    bool _2214 = uint(_2174) > 1u;
    if (!_2118)
    {
        _474 = _1848;
    }
    float _2216 = _474;
    int _2218 = int(_2062) + int(_2132);
    int _2220 = ~_340;
    int _2222 = _2220 + 1;
    float _2224 = _2216;
    if (_2118)
    {
        float _2226 = _2184 ? as_type<float>(_2212) : _1848;
        _2224 = _2226;
    }
    float _2228 = _2224;
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2232 = _2230 != 0;
    int _2234 = _2222 * _2218;
    int _2236 = _2234 + _1688;
    int _2238 = _2206 ? 0 : 1;
    int _2240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2242 = _2240 != 0;
    int _2244 = ~_2238;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    int _2250 = _2248;
    if (!_2214)
    {
        int _2252 = ~_2238;
        int _2254 = _2252 + 1;
        _2250 = _2254;
    }
    int _2256 = _2250;
    bool _2258 = uint(_2236) >= uint(_340);
    bool _2260 = !_2176;
    int _2262 = _2260 ? 0 : 1;
    bool _2264 = _2174 != 3;
    int _2266 = abs(_2256);
    bool _2268 = !_2258;
    int _2270 = _2268 ? 0 : (-1);
    bool _2272 = uint(_2174) >= 2u;
    bool _2274 = _2258;
    if (_2232)
    {
        bool _2276 = _264 > 0.5;
        _2274 = _2276;
    }
    bool _2278 = _2274;
    int _2280 = abs(_2262);
    int _2282 = _2272 ? 0 : 1;
    int _2284 = ~_2266;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    bool _2290 = _2174 != 3;
    int _2292 = ~_2218;
    int _2294 = _2292 + _2270;
    int _2296 = _2294 + 1;
    int _2298 = _2288 * as_type<int>(_2148);
    int _2300 = ~_2282;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    if (_2264)
    {
        int _2308 = ~_2282;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    int _2314 = _340 * _2296;
    int _2316 = _2314 + _1688;
    int _2318 = ~_2280;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2326 = int(_2324);
    int _2328 = _2180 << 4;
    int _2330 = _2328 + 1712;
    float _2332 = in.m_75.x;
    float _2334 = in.m_75.y;
    float _2336 = in.m_75.z;
    int _2338 = abs(_2312);
    int _2340 = _2322 * as_type<int>(_2140);
    int _2342 = _2340 + _2298;
    bool _2344 = _734 != 0.0;
    bool _2346 = isnan(_734);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    int _2354 = _2330 + 8;
    uint _2356 = uint(int(uint(_2354) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    bool _2364 = !_2290;
    int _2366 = _2364 ? 0 : (-1);
    if (_2232)
    {
        float _2368 = -_1848;
        float _2370 = _2368 + 1.0;
        _1760 = as_type<int>(_2370);
    }
    int _2372 = _1760;
    bool _2374 = _732 == 0.0;
    bool _2376 = !_2352;
    bool _2378 = _2374 && _2376;
    bool _2380 = !_2242;
    int _2382 = _2380 ? 0 : 1;
    uint _2384 = uint(int(uint(_2330) >> uint(2)));
    uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
    int _2388 = int(_2384) & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = int(_2384) + 1;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    int _2396 = _2392 & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    int _2400 = abs(_2366);
    int _2402 = ~_2338;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    bool _2408 = _736 == 0.0;
    bool _2410 = _2408 && _2378;
    int _2412 = abs(_2382);
    int _2414 = _2406 * as_type<int>(_2194);
    int _2416 = _2414 + _2342;
    int _2418 = ~_2400;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    float _2424 = as_type<float>(_2372);
    float _2426 = as_type<float>(_2400);
    if (_2232)
    {
        float _2428 = _2278 ? as_type<float>(_2372) : _1848;
        _1902 = _2428;
    }
    float _2430 = _1902;
    int _2432 = _2422 * as_type<int>(_2202);
    int _2434 = _2432 + _2416;
    int _2436 = ~_2412;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    bool _2442 = !_1632;
    int _2444 = _2442 ? _2316 : (-1);
    if (_2410)
    {
        _2424 = _2332;
    }
    float _2446 = _2424;
    int _2448 = _2434 * _2440;
    float _2450 = float(uint(_2326));
    float _2452 = _2446;
    if (_2410)
    {
        _2426 = _2446;
    }
    float _2454 = _2426;
    float _2456 = _2454;
    if (!_2410)
    {
        _2452 = _2332;
    }
    float _2458 = _2452;
    int _2460 = _2444 * _2412;
    int _2462 = _2460 + _2448;
    int _2464 = abs(_2326);
    float _2466 = in.m_77.x;
    float _2468 = in.m_77.y;
    float _2470 = in.m_77.z;
    float _2472 = in.m_77.w;
    float _2474 = 1.0 / _2450;
    if (!_2410)
    {
        float _2476 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2458);
        _2456 = _2476;
    }
    float _2478 = _2456;
    float _2480 = float(uint(_2464));
    float _2482 = float(uint(_2462));
    float _2484 = 1.0 / _2480;
    int _2486 = abs(_2462);
    float _2488 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2490 = _2362;
    if (_2410)
    {
        _2490 = _2334;
    }
    float _2492 = _2490;
    float _2494 = _2492;
    if (!_2410)
    {
        float _2496 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2334);
        _2494 = _2496;
    }
    float _2498 = _2494;
    if (_2410)
    {
        _1477 = _2336;
    }
    float _2500 = _1477;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2504 = as_type<int>(_2474) + (-2);
    float _2506 = _2488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2508 = float(uint(_2486));
    float _2510 = _2390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2512 = _2398 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2514 = as_type<float>(_2504) * _2482;
    float _2516 = _2500;
    if (!_2410)
    {
        float _2518 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2336);
        _2516 = _2518;
    }
    float _2520 = _2516;
    float _2522 = _2470 * _2458;
    int _2524 = as_type<int>(_2484) + (-2);
    float _2526 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2530 = -_2522;
    float _2532 = fma(_2466, _2336, _2530);
    float _2534 = trunc(_2514);
    float _2536 = precise::max(_2534, 0.0);
    uint _2538 = uint(_2536);
    float _2540 = _2468 * _2336;
    float _2542 = as_type<float>(_2524) * _2508;
    out.m_79.x = _2526;
    out.m_79.y = _2528;
    out.m_79.z = _2506;
    out.m_79.w = _2502;
    float _2544 = _2466 * _2334;
    float _2546 = -_2544;
    float _2548 = fma(_2468, _2458, _2546);
    float _2550 = abs(_778);
    float _2552 = log2(_2550);
    float _2554 = -_2540;
    float _2556 = fma(_2470, _2334, _2554);
    int _2558 = ~_2326;
    int _2560 = _2558 + 1;
    int _2562 = ~_2464;
    int _2564 = _2562 + 1;
    float _2566 = _2556 * _2472;
    float _2568 = _2532 * _2472;
    float _2570 = trunc(_2542);
    float _2572 = precise::max(_2570, 0.0);
    uint _2574 = uint(_2572);
    float _2576 = _2548 * _2472;
    int _2578 = _2560 * int(_2538);
    int _2580 = _2578 + _2462;
    float _2582 = -_2498;
    float _2584 = _866 * _2582;
    float _2586 = -_2468;
    float _2588 = _866 * _2586;
    float _2590 = -_2568;
    float _2592 = _866 * _2590;
    float _2594 = _874 * _2498;
    float _2596 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2598 = float(uint(_2580));
    float _2600 = fma(_876, _2478, _2584);
    float _2602 = fma(_876, _2466, _2588);
    float _2604 = fma(_876, _2566, _2592);
    float _2606 = _878 * _2468;
    float _2608 = as_type<float>(_2504) * _2598;
    float _2610 = exp2(_2596);
    int _2612 = _2564 * int(_2574);
    int _2614 = _2612 + _2486;
    float _2616 = _874 * _2468;
    float _2618 = _878 * _2498;
    float _2620 = _874 * _2568;
    float _2622 = fma(_915, _2478, _2594);
    float _2624 = float(uint(_2614));
    float _2626 = fma(_909, _2478, _2618);
    float _2628 = trunc(_2608);
    float _2630 = precise::max(_2628, 0.0);
    uint _2632 = uint(_2630);
    float _2634 = fma(_915, _2466, _2616);
    float _2636 = fma(_909, _2466, _2606);
    float _2638 = as_type<float>(_2524) * _2624;
    float _2640 = _878 * _2568;
    float _2642 = fma(_915, _2566, _2620);
    float _2644 = fma(_880, _2470, _2602);
    float _2646 = trunc(_2638);
    float _2648 = precise::max(_2646, 0.0);
    uint _2650 = uint(_2648);
    float _2652 = fma(_909, _2566, _2640);
    float _2654 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    int _2658 = ~_2326;
    int _2660 = _2658 + 1;
    float _2662 = fma(_913, _2520, _2622);
    float _2664 = fma(_913, _2470, _2634);
    float _2666 = fma(_925, _2470, _2636);
    float _2668 = _2656 * _2656;
    int _2670 = int(_2538) + int(_2632);
    float _2672 = fma(_880, _2576, _2604);
    float _2674 = fma(_913, _2576, _2642);
    float _2676 = fma(_925, _2576, _2652);
    float _2678 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2680 = fma(_880, _2520, _2600);
    int _2682 = int(_2574) + int(_2650);
    float _2684 = fma(_2656, -2.0, 3.0);
    int _2686 = ~_2464;
    int _2688 = _2686 + 1;
    int _2690 = _2660 * _2670;
    int _2692 = _2690 + _2462;
    float _2694 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2696 = _2668 * _2684;
    float _2698 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2700 = uint(_2692) >= uint(_2326);
    float _2702 = _2664 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2704 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2678);
    int _2706 = _2688 * _2682;
    int _2708 = _2706 + _2486;
    bool _2710 = !_2700;
    int _2712 = _2710 ? 0 : (-1);
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2716 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2698);
    int _2718 = _2462 ^ _2326;
    float _2720 = fma(_2644, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2702);
    int _2722 = ~_2670;
    int _2724 = _2722 + _2712;
    int _2726 = _2724 + 1;
    float _2728 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2694);
    bool _2730 = uint(_2708) >= uint(_2464);
    float _2732 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2716);
    uint _2734 = uint(int(uint(_2718) >> uint(31)));
    int _2736 = _2326 * _2726;
    int _2738 = _2736 + _2462;
    bool _2740 = !_2730;
    int _2742 = _2740 ? 0 : (-1);
    float _2744 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2746 = _2326 == 0;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2750 = ~_2742;
    int _2752 = _2682 + _2750;
    int _2754 = _2752 + 1;
    float _2756 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2744);
    int _2758 = ~int(_2734);
    int _2760 = _2758 + 1;
    float _2762 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2764 = !_2746;
    int _2766 = _2764 ? _2738 : (-1);
    float _2768 = _2674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2770 = _2754 ^ _2760;
    float _2772 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2762);
    float _2774 = float(_2766);
    float _2776 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2778 = _2326 == 0;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2782 = ~_2760;
    int _2784 = _2782 + _2770;
    int _2786 = _2784 + 1;
    float _2788 = fma(_2776, _2228, -0.5);
    float _2790 = fma(_2776, _2774, _418);
    float _2792 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2794 = !_2778;
    int _2796 = _2794 ? _2786 : (-1);
    float _2798 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2768);
    float _2800 = fma(_456, _2788, _2790);
    float _2802 = fma(_2792, _2172, -0.5);
    float _2804 = float(_2796);
    float _2806 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2808 = _2800 + 0.5;
    float _2810 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2812 = _778 <= 8000.0;
    bool _2814 = isnan(_778);
    bool _2816 = _2812 || _2814;
    bool _2818 = isnan(8000.0);
    bool _2820 = _2816 || _2818;
    float _2822 = float(_2820);
    float _2824 = -_324;
    float _2826 = fma(_2792, _2804, _2824);
    float _2828 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2720);
    float _2830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2832 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2756);
    float _2834 = fma(_460, _2802, _2826);
    float _2836 = fma(_2666, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2704);
    float _2838 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2728);
    float _2840 = -_2696;
    float _2842 = _2840 + 1.0;
    float _2844 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2772);
    float _2846 = _2806 * _2780;
    float _2848 = exp2(_2810);
    float _2850 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2838);
    float _2852 = fma(_2842, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2696);
    float _2854 = fma(_2676, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2798);
    float _2856 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2858 = _2850 + _1417;
    float _2860 = _2822 * _2852;
    float _2862 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2864 = _2662 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2866 = _2858 * 0.5;
    float _2868 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2870 = _2834 + 0.5;
    float _2872 = _2162 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2874 = _2110 * _2868;
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = -_2848;
    float _2880 = _2878 + 1.0;
    float _2882 = fma(_925, _2520, _2626);
    float _2884 = _2876;
    if (!_1401)
    {
        _1457 = 1.0;
    }
    float _2886 = _1457;
    float _2888 = _2880 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2890 = _2886;
    if (_1401)
    {
        bool _2892 = _1507 >= _1471;
        bool _2894 = isnan(_1507);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan(_1471);
        bool _2900 = _2896 || _2898;
        float _2902 = float(_2900);
        _2890 = _2902;
    }
    float _2904 = _2890;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2906 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2856);
    float _2908 = _2888 * _1509;
    float _2910 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2862);
    float _2912 = _2904 * _1832;
    float _2914 = fma(_2680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2864);
    float _2916 = _1520 * _2908;
    float _2918 = _2090 * _2908;
    float _2920 = -_2888;
    float _2922 = _2920 + 1.0;
    float _2924 = _2872 * _2830;
    float _2926 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2906);
    float _2928 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2910);
    float _2930 = -_2876;
    float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2934 = fma(_2882, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2914);
    float _2936 = fma(_2086, _2916, _1514);
    float _2938 = -_2912;
    float _2940 = fma(_2938, _2932, 1.0);
    float _2942 = precise::clamp(_2940, 0.0, 1.0);
    float _2944 = fma(_2088, _2916, _1516);
    float _2946 = _1520 * _2922;
    float _2948 = fma(_1520, _2918, _1518);
    float _2950 = _2942 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_83.x = _2836;
    out.m_83.y = _2732;
    out.m_83.z = _2828;
    bool _2952 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2954 = isnan(_1860);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2960 = _2956 || _2958;
    out.m_85.x = _2832;
    out.m_85.y = _2844;
    out.m_85.z = _2854;
    out.m_87.x = _2808;
    out.m_87.y = _2870;
    out.m_87.z = _2846;
    out.m_87.w = _2924;
    out.gl_Position.x = _1449;
    out.gl_Position.y = _1451;
    out.gl_Position.z = _2850;
    out.gl_Position.w = _1417;
    float _2962 = _2908;
    float _2964 = _2942;
    float _2966 = _2922;
    float _2968 = _2916;
    if (!_2960)
    {
        _1770 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _1770;
    out.m_89.z = _2866;
    out.m_89.w = _1417;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2960)
    {
        _2884 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2976 = _2884;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2960)
    {
        _2962 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2982 = _2962;
    out.m_91.x = _2950;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2960)
    {
        _2964 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2988 = _2964;
    float _2990 = _2988;
    float _2992 = _2988;
    if (!_2960)
    {
        _2966 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2994 = _2966;
    out.m_93.x = _2936;
    out.m_93.y = _2944;
    out.m_93.z = _2948;
    out.m_93.w = _2946;
    float _2996 = _2994;
    float _2998 = _2994;
    if (!_2960)
    {
        _2968 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3000 = _2968;
    out.m_95.x = _2926;
    out.m_95.y = _2928;
    out.m_95.z = _2934;
    bool _3002 = !_2960;
    float _3004 = _3000;
    float _3006 = _3000;
    if (!_3002)
    {
        bool _3008 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3010 = isnan(_1860);
        bool _3012 = _3008 || _3010;
        bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3016 = _3012 || _3014;
        if (!_3016)
        {
            float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3020 = _1860 + _3018;
            float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3024 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3022;
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3030 = 1.0 / _3024;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3048 = _3020 * _3030;
            float _3050 = precise::clamp(_3048, 0.0, 1.0);
            float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3056 = fma(_3050, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3058 = fma(_3050, _3054, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3060 = fma(_3050, _3034, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3062 = fma(_3050, _3038, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3064 = fma(_3050, _3042, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3066 = fma(_3050, _3046, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2980 = _3056;
            _2998 = _3064;
            _2974 = _3060;
            _2992 = _3062;
            _2986 = _3058;
            _3006 = _3066;
            _3068 = true;
        }
        else
        {
            bool _3070 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3072 = isnan(_1860);
            bool _3074 = _3070 || _3072;
            bool _3076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3078 = _3074 || _3076;
            if (!_3078)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3080 = _2972;
            _2974 = _3080;
            if (!_3078)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3082 = _2978;
            _2980 = _3082;
            if (!_3078)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3084 = _2984;
            _2986 = _3084;
            if (!_3078)
            {
                _2990 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3086 = _2990;
            _2992 = _3086;
            if (!_3078)
            {
                _2996 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3088 = _2996;
            _2998 = _3088;
            if (!_3078)
            {
                _3004 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3090 = _3004;
            bool _3092 = !_3078;
            _3006 = _3090;
            if (!_3092)
            {
                bool _3094 = _1860 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3096 = isnan(_1860);
                bool _3098 = _3094 || _3096;
                bool _3100 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3102 = _3098 || _3100;
                if (!_3102)
                {
                    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3106 = _1860 + _3104;
                    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3110 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3108;
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3116 = 1.0 / _3110;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3130 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3132 = _3130 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3134 = _3106 * _3116;
                    float _3136 = precise::clamp(_3134, 0.0, 1.0);
                    float _3138 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3142 = fma(_3136, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3144 = fma(_3136, _3140, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3146 = fma(_3136, _3120, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3148 = fma(_3136, _3124, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3150 = fma(_3136, _3128, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3152 = fma(_3136, _3132, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2980 = _3142;
                    _2998 = _3150;
                    _2974 = _3146;
                    _2992 = _3148;
                    _2986 = _3144;
                    _3006 = _3152;
                    _3068 = true;
                }
                else
                {
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2998 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2992 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3006 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3068 = false;
    float _3154 = _2980;
    float _3156 = _2998;
    float _3158 = _2974;
    float _3160 = _2992;
    float _3162 = _2986;
    float _3164 = _3006;
    float _3166 = fma(_2928, -0.5, 0.5);
    float _3168 = precise::clamp(_3166, 0.0, 1.0);
    float _3170 = -_3154;
    float _3172 = _3170 + _3156;
    float _3174 = -_3158;
    float _3176 = _3174 + _3160;
    float _3178 = -_3162;
    float _3180 = _3178 + _3164;
    bool _3182 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3184 = fma(_3168, _3172, _3154);
    float _3186 = fma(_3168, _3176, _3158);
    float _3188 = fma(_3168, _3180, _3162);
    float _3190 = _3184 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _3192 = fma(_3186, 0.298911988735198974609375, _3190);
    float _3194 = fma(_3188, 0.114477999508380889892578125, _3192);
    float _3196 = -_3194;
    float _3198 = _3186 + _3196;
    float _3200 = -_3194;
    float _3202 = _3184 + _3200;
    float _3204 = -_3194;
    float _3206 = _3188 + _3204;
    float _3208 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3210 = fma(_3198, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3212 = fma(_3202, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3214 = fma(_3206, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    out.m_59.x = _3208;
    out.m_99.x = _3210;
    out.m_99.y = _3212;
    out.m_99.z = _3214;
    if (!_3182)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3216 = -_1305;
    float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3220 = -_1307;
    float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3224 = -_1309;
    float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3228 = _3218 * _3218;
    float _3230 = fma(_3222, _3222, _3228);
    float _3232 = fma(_3226, _3226, _3230);
    float _3234 = sqrt(_3232);
    float _3236 = rsqrt(_3232);
    float _3238 = -_3234;
    float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3242 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3244 = precise::clamp(_3242, 0.0, 1.0);
    float _3246 = _3222 * _3236;
    float _3248 = _3218 * _3236;
    float _3250 = abs(_3244);
    float _3252 = log2(_3250);
    float _3254 = _3226 * _3236;
    float _3256 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3258 = _2928 * _3248;
    float _3260 = -_3248;
    float _3262 = -_3256;
    float _3264 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3262);
    float _3266 = fma(_2926, _3246, _3258);
    float _3268 = -_3254;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3264);
    float _3272 = fma(_2934, _3254, _3266);
    float _3274 = precise::clamp(_3272, 0.0, 1.0);
    float _3276 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3278 = _3270 + _3276;
    float _3280 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3282 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = exp2(_3280);
    float _3288 = _3286 * _3284;
    float _3290 = _3274 * _3288;
    float _3292 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3296 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _3292;
    out.m_97.y = _3294;
    out.m_97.z = _3296;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

