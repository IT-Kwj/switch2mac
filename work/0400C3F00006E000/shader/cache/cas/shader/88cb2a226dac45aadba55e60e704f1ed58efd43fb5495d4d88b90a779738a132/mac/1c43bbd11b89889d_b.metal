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
    float4 m_85 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2380 = false;
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
        float _2665 = as_type<float>(_134);
        out.gl_Position.z = _2665;
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
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2735 = as_type<float>(_172);
        out.gl_Position.z = _2735;
    }
    if (_164)
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
    float2 _2862 = float2(_238, _242);
    float _244 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2862, float2(0.0), isnan(_2862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2862, float2(0.0), isnan(_2862)), level(0.0)).x;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = in.m_63.z;
    float _252 = _208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _254 = in.m_63.x;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = in.m_63.y;
    float _266 = 1.0 / _258;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _270 = 1.0 + _268;
    float _272 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].x, _252);
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _284 = _282 != 0;
    float _286 = _248 * _152;
    bool _288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _296 = _292 || _294;
    float _298 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].z, _272);
    float _300 = 1.0 / _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _204 + _302;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _314 = _310 || _312;
    float _316 = _298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _318 = _250 * 2.0;
    float _320 = exp2(_286);
    float _322 = _304 * _266;
    float _324 = _254 * 2.0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _204 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = _264 + _250;
    float _336 = _264 * 2.0;
    float _338 = 1.0 / _270;
    float _340 = _328 * _300;
    float _342 = _334 + (-1.0);
    float _344 = _254 + _264;
    float _346 = fma(_332, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = floor(_318);
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _352 = -_320;
    float _354 = _352 + 1.0;
    float _356 = floor(_324);
    float _358 = _254 + _250;
    float _360 = _314 ? _354 : 0.0;
    float _362 = _358 + (-1.0);
    float _364 = _344 + (-1.0);
    float _366 = floor(_336);
    int _368 = 2;
    int _370 = as_type<int>(_250);
    int _372 = as_type<int>(_254);
    if (_296)
    {
        float _374 = _360 * _338;
        _154 = _374;
    }
    float _376 = _154;
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _380 = _348 >= 0.0;
    bool _382 = isnan(_348);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    bool _396 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _398 = isnan(_204);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _356 >= 0.0;
    bool _410 = isnan(_356);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    bool _422 = _356 > 0.0;
    float _424 = fma(_394, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _426 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_204);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    int _438 = _388 ? 0 : 1;
    int _440 = _416 ? 0 : 1;
    float _442 = -_436;
    float _444 = _442 + 1.0;
    bool _446 = _366 > 0.0;
    bool _448 = _366 >= 0.0;
    bool _450 = isnan(_366);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = -_406;
    float _460 = _458 + 1.0;
    bool _462 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_204);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _478 = _348 > 0.0;
    float _480 = fma(_420, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _482 = _436 * _460;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = _472 * _444;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = -_472;
    float _496 = _494 + 1.0;
    float _498 = fma(_476, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _500 = _346 * _488;
    float _502 = fma(_486, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = fma(_492, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _506 = _480 * _488;
    float _508 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    bool _510 = !_276;
    int _512 = _510 ? 0 : 1;
    float _514 = _424 * _488;
    int _516 = ~_438;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    int _524 = _520;
    if (!_478)
    {
        int _526 = ~_438;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    int _534 = abs(_512);
    float _536 = _316 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _538 = in.m_65.x;
    float _540 = in.m_65.y;
    float _542 = in.m_65.z;
    int _544 = ~_440;
    int _546 = _544 + 1;
    int _548 = _546 + 1;
    float _550 = fma(_502, _482, _508);
    float _552 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _536);
    int _554 = _548;
    if (!_422)
    {
        int _556 = ~_440;
        int _558 = _556 + 1;
        _554 = _558;
    }
    int _560 = _554;
    float _562 = _316 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _564 = float(_534);
    float _566 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].z, _552);
    float _568 = float(_530);
    float _570 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _562);
    float _572 = fma(_504, _482, _532);
    float _574 = _566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _576 = !_284;
    int _578 = _576 ? 0 : 1;
    float _580 = _564 * _568;
    float _582 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].z, _570);
    float _584 = 1.0 / _574;
    bool _586 = !_280;
    int _588 = _586 ? 0 : 1;
    float _590 = _580 * (-2.0);
    float _592 = _582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _594 = fma(_498, _482, _522);
    int _596 = abs(_588);
    float _598 = fma(_390, _590, _390);
    int _600 = abs(_578);
    float _602 = _592 + _574;
    float _604 = fma(_590, _538, _538);
    int _606 = _456 ? 0 : 1;
    float _608 = _254 + (-0.5);
    float _610 = float(_596);
    float _612 = in.m_67.x;
    float _614 = in.m_67.y;
    float _616 = in.m_67.z;
    float _618 = float(_560);
    float _620 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _604);
    float _622 = _602 * _584;
    float _624 = _622 * 0.5;
    int _626 = ~_606;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = _610 * _618;
    int _634 = _630;
    if (!_446)
    {
        int _636 = ~_606;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _642);
    float _646 = fma(_598, _376, _620);
    float _648 = float(_640);
    float _650 = _632 * (-2.0);
    float _652 = float(_600);
    float _654 = 1.0 / _644;
    float _656 = _264 + (-0.5);
    float _658 = fma(_650, _540, _540);
    float _660 = in.m_69.x;
    float _662 = in.m_69.y;
    float _664 = in.m_69.z;
    float _666 = _652 * _648;
    float _668 = fma(_350, _650, _350);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _672 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].x, _594);
    float _674 = _666 * (-2.0);
    float _676 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _678 = fma(_668, _376, _670);
    float _680 = _250 + (-0.5);
    float _682 = fma(_674, _542, _542);
    float _684 = fma(_378, _674, _378);
    float _686 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].z, _572);
    float _688 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].y, _550);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].z, _682);
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _694 = _654 * _692;
    float _696 = _646 * 0.15915493667125701904296875;
    float _698 = _678 * 0.15915493667125701904296875;
    float _700 = _672 * _612;
    float _702 = fma(_684, _376, _690);
    float _704 = _316 + _676;
    float _706 = _696 * 6.283185482025146484375;
    float _708 = sin(_706);
    float _710 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _712 = _702 * 0.15915493667125701904296875;
    bool _714 = _694 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _716 = _704 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _718 = _688 * _614;
    bool _720 = _694 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _722 = _696 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _716);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _660);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _662);
    float _732 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _686 * _616;
    float _736 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].z, _726);
    float _738 = _728 * _710;
    float _740 = _698 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _730 * _732;
    bool _746 = !_714;
    int _748 = _746 ? 0 : 1;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _752 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_714)
    {
        _368 = 1;
    }
    int _754 = _368;
    float _756 = _704 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _758 = _754;
    if (!_720)
    {
        _758 = _748;
    }
    int _760 = _758;
    float _762 = _698 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = _750 * _752;
    float _768 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _756);
    int _770 = _760 << 6;
    float _772 = _736 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _782 = _778 || _780;
    float _784 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].z, _768);
    float _786 = _712 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _724 * _742;
    float _792 = _708 * _742;
    float _794 = _784 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _796 = _712 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _708 * _764;
    float _802 = _724 * _764;
    float _804 = _724 * _788;
    float _806 = _764 * _788;
    float _808 = _708 * _788;
    float _810 = _742 * _788;
    float _812 = _804 * _744;
    int _814 = _770 + 48;
    uint _817 = uint(int(uint(_814) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[int(_827)][_829];
    float _833 = trunc(_772);
    int _835 = int(_833);
    float _837 = _808 * _744;
    float _839 = -_790;
    float _841 = fma(_798, _800, _839);
    float _843 = -_800;
    float _845 = fma(_798, _790, _843);
    float _847 = fma(_798, _802, _792);
    float _849 = -_744;
    float _851 = _798 * _849;
    float _853 = fma(_798, _792, _802);
    int _855 = _770 + 96;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    float _873 = fma(_847, _738, _812);
    float _875 = trunc(_794);
    int _877 = int(_875);
    float _879 = fma(_806, _738, _851);
    float _881 = fma(_841, _738, _837);
    float _883 = fma(_845, _766, _873);
    float _885 = fma(_810, _766, _879);
    int _887 = _770 + 104;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = _883 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _907 = _883 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _909 = fma(_853, _766, _881);
    int _911 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _913 = _835 + _911;
    int _915 = _913 + 1;
    float _917 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[10].x, _905);
    float _919 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[8].x, _907);
    float _921 = _883 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _923 = _770 + 64;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    uint _927 = uint(int(uint(int(_925)) >> uint(2)));
    int _929 = int(_925) & 3;
    float _931 = (*spvDescriptorSet0.vp_c15)._m0[int(_927)][_929];
    int _933 = int(_925) + 1;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    int _937 = _933 & 3;
    float _939 = (*spvDescriptorSet0.vp_c15)._m0[int(_935)][_937];
    float _941 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[10].z, _917);
    float _943 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[8].z, _919);
    int _945 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _947 = _877 + _945;
    int _949 = _947 + 1;
    float _951 = _226 + _941;
    float _953 = _224 + _943;
    bool _955 = _915 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _957 = _770 + 56;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    uint _961 = uint(int(uint(int(_959)) >> uint(2)));
    int _963 = int(_959) & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    int _967 = int(_959) + 1;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    int _971 = _967 & 3;
    float _973 = (*spvDescriptorSet0.vp_c15)._m0[int(_969)][_971];
    int _975 = _915 | _949;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _979 = _951 + _977;
    bool _981 = _975 < 0;
    bool _983 = _981 || _955;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _987 = _953 + _985;
    float _989 = _979 * _979;
    int _991 = _770 + 72;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    uint _995 = uint(int(uint(int(_993)) >> uint(2)));
    int _997 = int(_993) & 3;
    float _999 = (*spvDescriptorSet0.vp_c15)._m0[int(_995)][_997];
    int _1001 = int(_993) + 1;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    int _1005 = _1001 & 3;
    float _1007 = (*spvDescriptorSet0.vp_c15)._m0[int(_1003)][_1005];
    bool _1009 = _949 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1011 = _1009 || _983;
    float _1013 = fma(_987, _987, _989);
    float _1015 = sqrt(_1013);
    int _1017 = _770 + 80;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
    int _1023 = int(_1019) & 3;
    float _1025 = (*spvDescriptorSet0.vp_c15)._m0[int(_1021)][_1023];
    int _1027 = int(_1019) + 1;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    int _1031 = _1027 & 3;
    float _1033 = (*spvDescriptorSet0.vp_c15)._m0[int(_1029)][_1031];
    float _1035 = _704 * _831;
    uint _1037 = as_type<uint>(_883);
    int _1039 = as_type<int>(_1035);
    float _1041 = _951;
    float _1043 = _979;
    if (!_1011)
    {
        int _1045 = _949 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1047 = _1045 + _915;
        _1037 = uint(_1047);
    }
    uint _1049 = _1037;
    float _1051 = _704 * _871;
    float _1053 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[9].x, _921);
    float _1055 = _885;
    float _1057 = as_type<float>(_1049);
    if (!_1011)
    {
        float _1059 = floor(_772);
        _1055 = _1059;
    }
    float _1061 = _1055;
    float _1063 = fma(_224, _863, _1051);
    float _1065 = fma(_224, _823, _1035);
    float _1067 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1053);
    bool _1069 = _1015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = fma(_226, _895, _1063);
    float _1073 = _1071;
    if (!_1011)
    {
        uint _1075 = uint(int(uint(int(_1049)) >> uint(2)));
        _1039 = int(_1075);
    }
    int _1077 = _1039;
    float _1079 = _316 + _1067;
    float _1081 = _1071 + _903;
    float _1083 = _704 * _939;
    float _1085 = 1.0 / _1081;
    float _1087 = fma(_224, _931, _1083);
    int _1089 = as_type<int>(_931);
    int _1091 = _1077;
    float _1093 = _1087;
    if (!_1011)
    {
        int _1095 = int(_1049) << 2;
        _1089 = _1095;
    }
    int _1097 = _1089;
    float _1099 = fma(_226, _965, _1065);
    int _1101 = _1097;
    float _1103 = _1033;
    if (!_1011)
    {
        int _1105 = 12 & _1097;
        _1101 = _1105;
    }
    int _1107 = _1101;
    float _1109 = _1099 + _973;
    float _1111 = as_type<float>(_1107);
    if (!_1011)
    {
        int _1113 = _1077 << 4;
        int _1115 = _1113 + _1107;
        _1091 = _1115;
    }
    int _1117 = _1091;
    if (!_1069)
    {
        _1111 = _953;
    }
    float _1119 = _1111;
    float _1121 = fma(_226, _999, _1087);
    float _1123 = _1119;
    if (!_1069)
    {
        _1093 = _1079;
    }
    float _1125 = _1093;
    float _1127 = _1121 + _1007;
    bool _1129 = !_1069;
    float _1131 = _1125;
    if (!_1129)
    {
        float _1133 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1137 = _1015 + _1135;
        float _1139 = rsqrt(_1013);
        float _1141 = _1137 * _1133;
        float _1143 = _1079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = _1141 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1145 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 + (-1.0);
        float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = fma(_1153, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = fma(_1079, _1149, _1157);
        float _1163 = _1139 * _1159;
        float _1165 = fma(_987, _1163, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_979, _1163, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1041 = _1167;
        _1131 = _1161;
        _1123 = _1165;
        _1073 = _1145;
    }
    float _1169 = _1041;
    float _1171 = _1131;
    float _1173 = _1123;
    float _1175 = _1073;
    float _1177 = _1175;
    float _1179 = _1171;
    float _1181 = _1173;
    if (_782)
    {
        _1043 = _1169;
    }
    float _1183 = _1043;
    float _1185 = _1183;
    if (!_782)
    {
        float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1189 = _316 + _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1193 = _224 + _1191;
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1197 = -_316;
        float _1199 = _1197 + _1171;
        float _1201 = _1189 * _1189;
        float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1205 = _226 + _1203;
        float _1207 = -_224;
        float _1209 = _1207 + _1173;
        float _1211 = fma(_1193, _1193, _1201);
        float _1213 = fma(_1205, _1205, _1211);
        float _1215 = sqrt(_1213);
        float _1217 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1219 = _1217 * _1195;
        float _1221 = -_226;
        float _1223 = _1221 + _1169;
        float _1225 = fma(_1199, _1219, _316);
        float _1227 = fma(_1209, _1219, _224);
        float _1229 = fma(_1223, _1219, _226);
        _1177 = _1223;
        _1179 = _1225;
        _1181 = _1227;
        _1185 = _1229;
    }
    float _1231 = _1177;
    float _1233 = _1179;
    float _1235 = _1181;
    float _1237 = _1185;
    float _1239 = _1231;
    if (!_1011)
    {
        int _1241 = _1117 + 400;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
        int _1247 = int(_1243) & 3;
        float _1249 = (*spvDescriptorSet0.vp_c15)._m0[int(_1245)][_1247];
        _1239 = _1249;
    }
    float _1251 = _1239;
    float _1253 = _1109 * _1085;
    float _1255 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1257 = _1127 * _1085;
    float _1259 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1261 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1255);
    bool _1265 = _1253 >= 0.0;
    int _1267 = _770 + 88;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    uint _1271 = uint(int(uint(int(_1269)) >> uint(2)));
    int _1273 = int(_1269) & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    int _1277 = int(_1269) + 1;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    int _1281 = _1277 & 3;
    float _1283 = (*spvDescriptorSet0.vp_c15)._m0[int(_1279)][_1281];
    float _1285 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1259);
    float _1287 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1263);
    float _1289 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1261);
    float _1291 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1297 = _1253 <= 1.0;
    bool _1299 = _1297 && _1265;
    float _1301 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1289);
    float _1303 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1291);
    float _1305 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1311 = _1257 >= 0.0;
    bool _1313 = _1311 && _1299;
    float _1315 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1307);
    float _1319 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1321 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1323 = _1257 <= 1.0;
    bool _1325 = _1323 && _1313;
    float _1327 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1317);
    float _1331 = -_1321;
    float _1333 = fma(_1331, _1319, 1.0);
    float _1335 = _965;
    if (!_1011)
    {
        float _1337 = floor(_794);
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1343 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1329);
    float _1345 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = _704 * _1033;
    float _1349 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1341);
    float _1351 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    float _1353 = 1.0 / _1343;
    if (_1325)
    {
        float _1355 = float(_760);
        _1103 = _1355;
    }
    float _1357 = _1103;
    float _1359 = fma(_224, _1025, _1347);
    float _1361 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1349);
    float _1363 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1351);
    float _1365 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1361);
    float _1367 = log2(_1333);
    float _1369 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1363);
    float _1371 = _1341;
    float _1373 = _1357;
    float _1375 = _1365;
    if (_1325)
    {
        float _1377 = rint(_1357);
        float _1379 = precise::max(_1377, 0.0);
        uint _1381 = uint(_1379);
        uint _1383 = clamp(_1381, 0u, 65535u);
        _1371 = as_type<float>(_1383);
    }
    float _1385 = _1371;
    float _1387 = fma(_226, _1275, _1359);
    float _1389 = _1275;
    if (!_1011)
    {
        float _1391 = -_1339;
        float _1393 = _794 + _1391;
        _1389 = _1393;
    }
    float _1395 = _1389;
    float _1397 = _1365 * _1353;
    float _1399 = _1369 * _1353;
    float _1401 = _1387 + _1283;
    float _1403 = _1251;
    if (!_1011)
    {
        float _1405 = rint(_1251);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        uint _1411 = clamp(_1409, 0u, 65535u);
        _1403 = as_type<float>(_1411);
    }
    float _1413 = _1403;
    float _1415 = _1367 * 0.693147182464599609375;
    float _1417 = _1401 * _1085;
    float _1419 = fma(_1397, 0.5, 0.5);
    float _1421 = fma(_1399, -0.5, 0.5);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1425 = _1415;
    if (!_1011)
    {
        float _1427 = -_1061;
        float _1429 = _772 + _1427;
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = _1085;
    if (_1325)
    {
        float3 _4767 = float3(_1253, _1257, float(as_type<int>(_1385)));
        float3 _4771 = select(_4767, float3(0.0), isnan(_4767));
        float _1435 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4771.xy, uint(rint(_4771.z)), _1417, level(0.0));
        _1433 = _1435;
    }
    float _1437 = _1433;
    float3 _4781 = float3(_1419, _1421, _1423);
    float _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4781, float3(0.0), isnan(_4781)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4781, float3(0.0), isnan(_4781)), level(0.0)).x;
    float3 _4790 = float3(_1419, _1421, _1423);
    float4 _1442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).xyzw;
    float _1444 = _1442.x;
    float _1446 = _1442.y;
    float _1448 = _1442.z;
    float _1450 = _1442.w;
    float _1452 = _953;
    if (!_1011)
    {
        float3 _4813 = float3(_1431, _1395, float(as_type<int>(_1413)));
        float3 _4815 = select(_4813, float3(0.0), isnan(_4813));
        float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4815.xy, uint(rint(_4815.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4815.xy, uint(rint(_4815.z)), level(0.0)).x;
        _1452 = _1454;
    }
    float _1456 = _1452;
    if (_1011)
    {
        _1373 = 1.0;
    }
    float _1458 = _1373;
    float _1460 = _1458;
    if (!_1011)
    {
        int _1462 = int(_1049) << 4;
        int _1464 = _1462 + 2048;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
        int _1470 = int(_1466) & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        int _1474 = int(_1466) + 1;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        int _1478 = _1474 & 3;
        float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
        int _1482 = _1464 + 8;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
        int _1488 = int(_1484) & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        int _1492 = int(_1484) + 1;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        int _1496 = _1492 & 3;
        float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
        float _1500 = _704 * _1480;
        float _1502 = fma(_224, _1472, _1500);
        float _1504 = fma(_226, _1490, _1502);
        float _1506 = _1504 + _1498;
        float _1508 = precise::clamp(_1506, 0.0, 1.0);
        float _1510 = -_1508;
        float _1512 = _1510 + _1456;
        float _1514 = fma(_1512, 500.0, 1.5);
        float _1516 = exp2(_1514);
        float _1518 = 0.0 + _1516;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1057 = as_type<float>(_1464);
        _1460 = _1520;
    }
    float _1522 = _1057;
    float _1524 = _1460;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1528 = _1233 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1235 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1536 = _1237 + _1534;
    float _1538 = _1528 * _1528;
    float _1540 = fma(_1532, _1532, _1538);
    float _1542 = fma(_1536, _1536, _1540);
    float _1544 = rsqrt(_1542);
    float _1546 = sqrt(_1542);
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1532 * _1548;
    float _1552 = _1536 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 + _1556;
    float _1560 = sqrt(_1558);
    bool _1562 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1560 + _1564;
    float _1568 = _1385;
    float _1570 = _1558;
    float _1572 = _1566;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1548;
    float _1580 = _1550;
    float _1582 = _1554;
    float _1584 = _1556;
    if (_1562)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1586;
    }
    float _1588 = _1568;
    if (_1562)
    {
        float _1590 = rsqrt(_1558);
        _1570 = _1590;
    }
    float _1592 = _1570;
    if (_1562)
    {
        float _1594 = _1566 * _1588;
        _1572 = _1594;
    }
    float _1596 = _1572;
    if (_1562)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _1574 = _1598;
    }
    float _1600 = _1574;
    float _1602 = _1253;
    if (_1562)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1588;
    if (_1562)
    {
        float _1616 = _1600 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = -_1548;
    float _1624 = -_1612;
    float _1626 = fma(_1528, _1622, _1624);
    float _1628 = _1626;
    if (_1562)
    {
        float _1630 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1630;
    }
    float _1632 = _1576;
    float _1634 = _1608;
    float _1636 = _1632;
    if (_1562)
    {
        float _1638 = fma(_1608, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = _1640;
    if (_1562)
    {
        float _1644 = _1620 + (-1.0);
        _1636 = _1644;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (_1562)
    {
        float _1650 = _1592 * _1640;
        _1578 = _1650;
    }
    float _1652 = _1578;
    if (_1562)
    {
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1654;
    }
    float _1656 = _1642;
    if (_1562)
    {
        float _1658 = _1550 * _1652;
        _1580 = _1658;
    }
    float _1660 = _1580;
    if (!_1562)
    {
        _1648 = _1552;
    }
    float _1662 = _1648;
    float _1664 = _1662;
    if (_1562)
    {
        float _1666 = _1552 * _1652;
        _1664 = _1666;
    }
    float _1668 = _1664;
    if (_1562)
    {
        float _1670 = fma(_1626, _1620, _1656);
        _1628 = _1670;
    }
    float _1672 = _1628;
    if (_1562)
    {
        float _1674 = _1660 * _1660;
        _1582 = _1674;
    }
    float _1676 = _1582;
    if (_1562)
    {
        float _1678 = _1668 * _1668;
        _1584 = _1678;
    }
    float _1680 = _1584;
    float _1682 = fma(_1672, _1672, _1676);
    float _1684 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1686 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1684);
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = _1682 + _1680;
    float _1692 = -_1688;
    float _1694 = _1692 + 1.0;
    float _1696 = rsqrt(_1690);
    float _1698 = abs(_1694);
    float _1700 = log2(_1698);
    float _1702 = _1696 * _1660;
    float _1704 = _1696 * _1672;
    float _1706 = _1696 * _1668;
    float _1708 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = -_1708;
    float _1712 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1710);
    float _1714 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1716 = -_1706;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1712);
    float _1720 = exp2(_1714);
    float _1722 = fma(_1718, -0.5, 0.5);
    float _1724 = fma(_1718, 0.5, 0.5);
    float _1726 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = sqrt(_1722);
    float _1730 = fma(_1724, _1726, -0.212114393711090087890625);
    float _1732 = _1704 + 1.0;
    float _1734 = fma(_1724, _1730, 1.570728778839111328125);
    float _1736 = -_1704;
    float _1738 = fma(_1720, _1732, _1736);
    float _1740 = fma(_1738, 0.5, 0.5);
    float _1742 = _1728 * 0.636619746685028076171875;
    float _1744 = -_1734;
    float _1746 = fma(_1742, _1744, 1.0);
    float2 _5265 = float2(_1746, _1740);
    float3 _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5265, float2(0.0), isnan(_5265)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5265, float2(0.0), isnan(_5265)), level(0.0)).xyz;
    float _1752 = _1750.x;
    float _1754 = _1750.y;
    float _1756 = _1750.z;
    float _1758 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1760 = in.m_71.y;
    float _1762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1764 = _662 != 0.0;
    bool _1766 = isnan(_662);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(0.0);
    bool _1772 = _1768 || _1770;
    float _1774 = _1758 * _254;
    float _1776 = in.m_63.w;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1780 = _1778 != 0;
    float _1782 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1786 = _1784 != 0;
    float _1788 = in.m_71.x;
    float _1790 = trunc(_1774);
    int _1792 = int(_1790);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1796 = _1794 != 0;
    float _1798 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1782);
    float _1800 = in.m_73.x;
    float _1802 = in.m_73.y;
    float _1804 = in.m_73.z;
    bool _1806 = _660 == 0.0;
    bool _1808 = !_1772;
    bool _1810 = _1806 && _1808;
    float _1812 = -_244;
    float _1814 = _1812 + 1.0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1798);
    bool _1822 = _664 == 0.0;
    bool _1824 = _1822 && _1810;
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_75.x = _1235;
    out.m_75.y = _1233;
    out.m_75.z = _1237;
    float _1828 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    int _1830 = _1792 << 4;
    int _1832 = _1830 + 1712;
    float _1834 = -_1760;
    float _1836 = _1834 + 1.0;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1840 = _1776 > 0.5;
    uint _1842 = uint(int(uint(_1832) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    int _1850 = int(_1842) + 1;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    int _1854 = _1850 & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = _1840 ? as_type<int>(_1836) : as_type<int>(_1760);
    bool _1860 = _264 > 0.5;
    float _1862 = _1818 ? as_type<float>(_1858) : _1760;
    int _1864 = _1832 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    float _1874 = _1760;
    bool _1876 = _1860;
    bool _1878 = _1818;
    float _1880 = _1788;
    float _1882 = _1776;
    if (_1780)
    {
        float _1884 = _1860 ? _1836 : _1760;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (_1786)
    {
        bool _1888 = _250 > 0.5;
        _1876 = _1888;
    }
    bool _1890 = _1876;
    if (_1796)
    {
        float _1892 = -_1788;
        float _1894 = _1892 + 1.0;
        _370 = as_type<int>(_1894);
    }
    int _1896 = _370;
    if (_1796)
    {
        bool _1898 = _254 > 0.5;
        _1878 = _1898;
    }
    bool _1900 = _1878;
    if (_1786)
    {
        float _1902 = -_1788;
        float _1904 = _1902 + 1.0;
        _372 = as_type<int>(_1904);
    }
    int _1906 = _372;
    float _1908 = 0.0;
    if (!_1796)
    {
        _1908 = _1788;
    }
    float _1910 = _1908;
    float _1912 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1914 = 0.0;
    float _1916 = _1910;
    if (_1824)
    {
        _1914 = _1800;
    }
    float _1918 = _1914;
    float _1920 = _1918;
    if (_1796)
    {
        float _1922 = _1900 ? as_type<float>(_1896) : _1788;
        _1916 = _1922;
    }
    float _1924 = _1916;
    if (_1786)
    {
        float _1926 = _1890 ? as_type<float>(_1906) : _1788;
        _1880 = _1926;
    }
    float _1928 = _1880;
    if (_1824)
    {
        _1882 = _1918;
    }
    float _1930 = _1882;
    float _1932 = _1930;
    if (!_1824)
    {
        _1920 = _1800;
    }
    float _1934 = _1920;
    float _1936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1938 = 0.0;
    if (_1824)
    {
        _1938 = _1802;
    }
    float _1940 = _1938;
    float _1942 = _1940;
    if (!_1824)
    {
        float _1944 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1934);
        _1932 = _1944;
    }
    float _1946 = _1932;
    float _1948 = 0.0;
    if (_1824)
    {
        _1948 = _1804;
    }
    float _1950 = _1948;
    float _1952 = abs(_694);
    float _1954 = log2(_1952);
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1958 = 0.0;
    float _1960 = _1950;
    if (_1824)
    {
        _1958 = _1950;
    }
    float _1962 = _1958;
    float _1964 = _1962;
    if (!_1824)
    {
        _1960 = _1804;
    }
    float _1966 = _1960;
    if (!_1824)
    {
        float _1968 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1966);
        _1964 = _1968;
    }
    float _1970 = _1964;
    bool _1972 = _694 <= 8000.0;
    bool _1974 = isnan(_694);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(8000.0);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    float _1984 = _1848 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1986 = _1856 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1988 = in.m_77.x;
    float _1990 = in.m_77.y;
    float _1992 = in.m_77.z;
    float _1994 = in.m_77.w;
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2000 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1984;
    if (_1824)
    {
        _2002 = _1940;
    }
    float _2004 = _2002;
    float _2006 = _2004;
    if (!_1824)
    {
        _1942 = _1802;
    }
    float _2008 = _1942;
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2012 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2014 = _1912 * _1936;
    float _2016 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1824)
    {
        float _2018 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2018;
    }
    float _2020 = _2006;
    float _2022 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_79.x = _2000;
    out.m_79.y = _1996;
    out.m_79.z = _2010;
    out.m_79.w = _1956;
    float _2024 = _2012 * _1826;
    float _2026 = _2016 * _1838;
    float _2028 = _2022 * _1762;
    float _2030 = _1990 * _1966;
    out.m_81.x = _2028;
    out.m_81.y = _2024;
    out.m_81.z = _2026;
    out.m_81.w = _2014;
    float _2032 = -_2030;
    float _2034 = fma(_1992, _2008, _2032);
    float _2036 = -_1990;
    float _2038 = _798 * _2036;
    float _2040 = _1992 * _1934;
    float _2042 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2044 = _1988 * _2008;
    float _2046 = fma(_806, _1988, _2038);
    float _2048 = -_2040;
    float _2050 = fma(_1988, _1966, _2048);
    float _2052 = -_2044;
    float _2054 = fma(_1990, _1934, _2052);
    float _2056 = _2034 * _1994;
    float _2058 = _2050 * _1994;
    float _2060 = exp2(_2042);
    float _2062 = _2054 * _1994;
    float _2064 = -_2020;
    float _2066 = _798 * _2064;
    float _2068 = -_2058;
    float _2070 = _798 * _2068;
    float _2072 = _804 * _1990;
    float _2074 = _804 * _2020;
    float _2076 = fma(_806, _1946, _2066);
    float _2078 = fma(_806, _2056, _2070);
    float _2080 = _804 * _2058;
    float _2082 = _808 * _1990;
    float _2084 = fma(_847, _1946, _2074);
    float _2086 = fma(_847, _1988, _2072);
    float _2088 = fma(_847, _2056, _2080);
    float _2090 = _808 * _2058;
    float _2092 = fma(_810, _1970, _2076);
    float _2094 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = fma(_841, _1988, _2082);
    float _2100 = fma(_841, _2056, _2090);
    float _2102 = fma(_845, _1992, _2086);
    float _2104 = fma(_810, _1992, _2046);
    float _2106 = fma(_853, _1992, _2098);
    float _2108 = fma(_845, _1970, _2084);
    float _2110 = fma(_2096, -2.0, 3.0);
    float _2112 = fma(_810, _2062, _2078);
    float _2114 = fma(_845, _2062, _2088);
    float _2116 = fma(_853, _2062, _2100);
    float _2118 = _2096 * _2096;
    float _2120 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2122 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2124 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2126 = _2118 * _2110;
    float _2128 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2120);
    float _2130 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2132 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2122);
    float _2134 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2136 = _808 * _2020;
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2124);
    float _2140 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2130);
    float _2142 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2128);
    float _2144 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2134);
    float _2146 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2132);
    float _2148 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2150 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2152 = fma(_841, _1946, _2136);
    float _2154 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2156 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2140);
    float _2158 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2138);
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2144);
    float _2162 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2148);
    float _2164 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2150);
    float _2166 = fma(_853, _1970, _2152);
    float _2168 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2154);
    float _2170 = -_2126;
    float _2172 = _2170 + 1.0;
    out.m_83.x = _2158;
    out.m_83.y = _2142;
    out.m_83.z = _2146;
    float _2174 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2168);
    float _2176 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2126);
    float _2180 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    float _2182 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2162);
    float _2184 = _1982 * _2178;
    float _2186 = exp2(_2176);
    float _2188 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2180);
    float _2190 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2164);
    float _2192 = _1828 + _1343;
    float _2194 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2196 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2188);
    float _2198 = _2192 * 0.5;
    float _2200 = _2192;
    if (!_1325)
    {
        _2200 = 1.0;
    }
    float _2202 = _2200;
    float _2204 = _1814 * _2194;
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    float _2208 = _2202;
    if (_1325)
    {
        bool _2210 = _1437 >= _1417;
        bool _2212 = isnan(_1437);
        bool _2214 = _2210 || _2212;
        bool _2216 = isnan(_1417);
        bool _2218 = _2214 || _2216;
        float _2220 = float(_2218);
        _2208 = _2220;
    }
    float _2222 = _2208;
    out.m_87.x = _2156;
    out.m_87.y = _2160;
    out.m_87.z = _2196;
    float _2224 = -_2206;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2228 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2230 = isnan(_1546);
    bool _2232 = _2228 || _2230;
    bool _2234 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2236 = _2232 || _2234;
    float _2238 = _2222 * _1524;
    float _2240 = -_2186;
    float _2242 = _2240 + 1.0;
    out.gl_Position.x = _1365;
    out.gl_Position.y = _1369;
    out.gl_Position.z = _1828;
    out.gl_Position.w = _1343;
    float _2244 = -_2238;
    float _2246 = fma(_2244, _2226, 1.0);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.z = _2198;
    out.m_89.w = _1343;
    float _2252 = _2248 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2254 = _2250 * _1439;
    float _2256 = -_2250;
    float _2258 = _2256 + 1.0;
    out.m_91.x = _2182;
    out.m_91.y = _2190;
    out.m_91.z = _2174;
    float _2260 = _2258;
    float _2262 = _2248;
    float _2264 = _2254;
    if (!_2236)
    {
        _1375 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2266 = _1375;
    float _2268 = _1450 * _2254;
    float _2270 = _1450 * _2258;
    out.m_93.x = _2252;
    float _2272 = _2268;
    float _2274 = _2266;
    float _2276 = _2266;
    if (!_2236)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2278 = _2260;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2236)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2284 = _2262;
    float _2286 = _1756 * _2254;
    float _2288 = fma(_1752, _2268, _1444);
    float _2290 = fma(_1754, _2268, _1446);
    float _2292 = _2286;
    float _2294 = _2284;
    float _2296 = _2284;
    if (!_2236)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2298 = _2264;
    float _2300 = fma(_1450, _2286, _1448);
    float _2302 = _2298;
    float _2304 = _2298;
    if (!_2236)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2306 = _2292;
    float _2308 = _2306;
    float _2310 = _2306;
    if (!_2236)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2312 = _2272;
    out.m_95.x = _2288;
    out.m_95.y = _2290;
    out.m_95.z = _2300;
    out.m_95.w = _2270;
    bool _2314 = !_2236;
    float _2316 = _2312;
    float _2318 = _2312;
    if (!_2314)
    {
        bool _2320 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2322 = isnan(_1546);
        bool _2324 = _2320 || _2322;
        bool _2326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2328 = _2324 || _2326;
        if (!_2328)
        {
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2332 = _1546 + _2330;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2336 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2334;
            float _2338 = 1.0 / _2336;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2360 = _2332 * _2338;
            float _2362 = precise::clamp(_2360, 0.0, 1.0);
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2368 = fma(_2362, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2370 = fma(_2362, _2366, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2372 = fma(_2362, _2346, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2374 = fma(_2362, _2350, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2376 = fma(_2362, _2354, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2378 = fma(_2362, _2358, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2282 = _2370;
            _2304 = _2376;
            _2276 = _2368;
            _2310 = _2374;
            _2296 = _2372;
            _2318 = _2378;
            _2380 = true;
        }
        else
        {
            bool _2382 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2384 = isnan(_1546);
            bool _2386 = _2382 || _2384;
            bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2390 = _2386 || _2388;
            if (!_2390)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2392 = _2274;
            _2276 = _2392;
            if (!_2390)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2394 = _2280;
            _2282 = _2394;
            if (!_2390)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2396 = _2294;
            _2296 = _2396;
            if (!_2390)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2398 = _2308;
            _2310 = _2398;
            if (!_2390)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2400 = _2302;
            _2304 = _2400;
            if (!_2390)
            {
                _2316 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2402 = _2316;
            bool _2404 = !_2390;
            _2318 = _2402;
            if (!_2404)
            {
                bool _2406 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2408 = isnan(_1546);
                bool _2410 = _2406 || _2408;
                bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2414 = _2410 || _2412;
                if (!_2414)
                {
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2418 = _1546 + _2416;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2422 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2420;
                    float _2424 = 1.0 / _2422;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2446 = _2418 * _2424;
                    float _2448 = precise::clamp(_2446, 0.0, 1.0);
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2454 = fma(_2448, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2456 = fma(_2448, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2458 = fma(_2448, _2432, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2460 = fma(_2448, _2436, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2462 = fma(_2448, _2440, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2464 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2282 = _2456;
                    _2304 = _2462;
                    _2276 = _2454;
                    _2310 = _2460;
                    _2296 = _2458;
                    _2318 = _2464;
                    _2380 = true;
                }
                else
                {
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2318 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2380 = false;
    float _2466 = _2282;
    float _2468 = _2304;
    float _2470 = _2276;
    float _2472 = _2310;
    float _2474 = _2296;
    float _2476 = _2318;
    float _2478 = fma(_2190, -0.5, 0.5);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = -_2466;
    float _2484 = _2482 + _2468;
    float _2486 = -_2470;
    float _2488 = _2486 + _2472;
    float _2490 = -_2474;
    float _2492 = _2490 + _2476;
    bool _2494 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2496 = fma(_2480, _2484, _2466);
    float _2498 = fma(_2480, _2488, _2470);
    float _2500 = fma(_2480, _2492, _2474);
    float _2502 = _2496 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2504 = fma(_2498, 0.298911988735198974609375, _2502);
    float _2506 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2508 = fma(_2500, 0.114477999508380889892578125, _2504);
    out.m_59.x = _2506;
    float _2510 = -_2508;
    float _2512 = _2498 + _2510;
    float _2514 = -_2508;
    float _2516 = _2496 + _2514;
    float _2518 = -_2508;
    float _2520 = _2500 + _2518;
    float _2522 = fma(_2512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    float _2524 = fma(_2516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    float _2526 = fma(_2520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    out.m_99.x = _2522;
    out.m_99.y = _2524;
    out.m_99.z = _2526;
    if (!_2494)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2528 = -_1233;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2532 = -_1235;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2536 = -_1237;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2540 = _2530 * _2530;
    float _2542 = fma(_2534, _2534, _2540);
    float _2544 = fma(_2538, _2538, _2542);
    float _2546 = sqrt(_2544);
    float _2548 = rsqrt(_2544);
    float _2550 = -_2546;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = _2534 * _2548;
    float _2560 = _2530 * _2548;
    float _2562 = abs(_2556);
    float _2564 = log2(_2562);
    float _2566 = _2538 * _2548;
    float _2568 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2570 = _2190 * _2560;
    float _2572 = -_2560;
    float _2574 = -_2568;
    float _2576 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2574);
    float _2578 = fma(_2182, _2558, _2570);
    float _2580 = -_2566;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2576);
    float _2584 = fma(_2174, _2566, _2578);
    float _2586 = precise::clamp(_2584, 0.0, 1.0);
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2590 = _2582 + _2588;
    float _2592 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = exp2(_2592);
    float _2600 = _2598 * _2596;
    float _2602 = _2586 * _2600;
    float _2604 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2606 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2608 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2604;
    out.m_97.y = _2606;
    out.m_97.z = _2608;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2380 = false;
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
        float _2665 = as_type<float>(_134);
        out.gl_Position.z = _2665;
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
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2735 = as_type<float>(_172);
        out.gl_Position.z = _2735;
    }
    if (_164)
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
    float2 _2862 = float2(_238, _242);
    float _244 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2862, float2(0.0), isnan(_2862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2862, float2(0.0), isnan(_2862)), level(0.0)).x;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = in.m_63.z;
    float _252 = _208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _254 = in.m_63.x;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = in.m_63.y;
    float _266 = 1.0 / _258;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _270 = 1.0 + _268;
    float _272 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].x, _252);
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _284 = _282 != 0;
    float _286 = _248 * _152;
    bool _288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _296 = _292 || _294;
    float _298 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].z, _272);
    float _300 = 1.0 / _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _204 + _302;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _314 = _310 || _312;
    float _316 = _298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _318 = _250 * 2.0;
    float _320 = exp2(_286);
    float _322 = _304 * _266;
    float _324 = _254 * 2.0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _204 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = _264 + _250;
    float _336 = _264 * 2.0;
    float _338 = 1.0 / _270;
    float _340 = _328 * _300;
    float _342 = _334 + (-1.0);
    float _344 = _254 + _264;
    float _346 = fma(_332, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = floor(_318);
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _352 = -_320;
    float _354 = _352 + 1.0;
    float _356 = floor(_324);
    float _358 = _254 + _250;
    float _360 = _314 ? _354 : 0.0;
    float _362 = _358 + (-1.0);
    float _364 = _344 + (-1.0);
    float _366 = floor(_336);
    int _368 = 2;
    int _370 = as_type<int>(_250);
    int _372 = as_type<int>(_254);
    if (_296)
    {
        float _374 = _360 * _338;
        _154 = _374;
    }
    float _376 = _154;
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _380 = _348 >= 0.0;
    bool _382 = isnan(_348);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    bool _396 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _398 = isnan(_204);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _356 >= 0.0;
    bool _410 = isnan(_356);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    bool _422 = _356 > 0.0;
    float _424 = fma(_394, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _426 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_204);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    int _438 = _388 ? 0 : 1;
    int _440 = _416 ? 0 : 1;
    float _442 = -_436;
    float _444 = _442 + 1.0;
    bool _446 = _366 > 0.0;
    bool _448 = _366 >= 0.0;
    bool _450 = isnan(_366);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = -_406;
    float _460 = _458 + 1.0;
    bool _462 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_204);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _478 = _348 > 0.0;
    float _480 = fma(_420, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _482 = _436 * _460;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = _472 * _444;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = -_472;
    float _496 = _494 + 1.0;
    float _498 = fma(_476, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _500 = _346 * _488;
    float _502 = fma(_486, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = fma(_492, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _506 = _480 * _488;
    float _508 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    bool _510 = !_276;
    int _512 = _510 ? 0 : 1;
    float _514 = _424 * _488;
    int _516 = ~_438;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    int _524 = _520;
    if (!_478)
    {
        int _526 = ~_438;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    int _534 = abs(_512);
    float _536 = _316 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _538 = in.m_65.x;
    float _540 = in.m_65.y;
    float _542 = in.m_65.z;
    int _544 = ~_440;
    int _546 = _544 + 1;
    int _548 = _546 + 1;
    float _550 = fma(_502, _482, _508);
    float _552 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _536);
    int _554 = _548;
    if (!_422)
    {
        int _556 = ~_440;
        int _558 = _556 + 1;
        _554 = _558;
    }
    int _560 = _554;
    float _562 = _316 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _564 = float(_534);
    float _566 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].z, _552);
    float _568 = float(_530);
    float _570 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _562);
    float _572 = fma(_504, _482, _532);
    float _574 = _566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _576 = !_284;
    int _578 = _576 ? 0 : 1;
    float _580 = _564 * _568;
    float _582 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].z, _570);
    float _584 = 1.0 / _574;
    bool _586 = !_280;
    int _588 = _586 ? 0 : 1;
    float _590 = _580 * (-2.0);
    float _592 = _582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _594 = fma(_498, _482, _522);
    int _596 = abs(_588);
    float _598 = fma(_390, _590, _390);
    int _600 = abs(_578);
    float _602 = _592 + _574;
    float _604 = fma(_590, _538, _538);
    int _606 = _456 ? 0 : 1;
    float _608 = _254 + (-0.5);
    float _610 = float(_596);
    float _612 = in.m_67.x;
    float _614 = in.m_67.y;
    float _616 = in.m_67.z;
    float _618 = float(_560);
    float _620 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _604);
    float _622 = _602 * _584;
    float _624 = _622 * 0.5;
    int _626 = ~_606;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = _610 * _618;
    int _634 = _630;
    if (!_446)
    {
        int _636 = ~_606;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _642);
    float _646 = fma(_598, _376, _620);
    float _648 = float(_640);
    float _650 = _632 * (-2.0);
    float _652 = float(_600);
    float _654 = 1.0 / _644;
    float _656 = _264 + (-0.5);
    float _658 = fma(_650, _540, _540);
    float _660 = in.m_69.x;
    float _662 = in.m_69.y;
    float _664 = in.m_69.z;
    float _666 = _652 * _648;
    float _668 = fma(_350, _650, _350);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _672 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].x, _594);
    float _674 = _666 * (-2.0);
    float _676 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _678 = fma(_668, _376, _670);
    float _680 = _250 + (-0.5);
    float _682 = fma(_674, _542, _542);
    float _684 = fma(_378, _674, _378);
    float _686 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].z, _572);
    float _688 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].y, _550);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].z, _682);
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _694 = _654 * _692;
    float _696 = _646 * 0.15915493667125701904296875;
    float _698 = _678 * 0.15915493667125701904296875;
    float _700 = _672 * _612;
    float _702 = fma(_684, _376, _690);
    float _704 = _316 + _676;
    float _706 = _696 * 6.283185482025146484375;
    float _708 = sin(_706);
    float _710 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _712 = _702 * 0.15915493667125701904296875;
    bool _714 = _694 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _716 = _704 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _718 = _688 * _614;
    bool _720 = _694 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _722 = _696 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _716);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _660);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _662);
    float _732 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _686 * _616;
    float _736 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].z, _726);
    float _738 = _728 * _710;
    float _740 = _698 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _730 * _732;
    bool _746 = !_714;
    int _748 = _746 ? 0 : 1;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _752 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_714)
    {
        _368 = 1;
    }
    int _754 = _368;
    float _756 = _704 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _758 = _754;
    if (!_720)
    {
        _758 = _748;
    }
    int _760 = _758;
    float _762 = _698 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = _750 * _752;
    float _768 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _756);
    int _770 = _760 << 6;
    float _772 = _736 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _782 = _778 || _780;
    float _784 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].z, _768);
    float _786 = _712 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _724 * _742;
    float _792 = _708 * _742;
    float _794 = _784 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _796 = _712 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _708 * _764;
    float _802 = _724 * _764;
    float _804 = _724 * _788;
    float _806 = _764 * _788;
    float _808 = _708 * _788;
    float _810 = _742 * _788;
    float _812 = _804 * _744;
    int _814 = _770 + 48;
    uint _817 = uint(int(uint(_814) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[int(_827)][_829];
    float _833 = trunc(_772);
    int _835 = int(_833);
    float _837 = _808 * _744;
    float _839 = -_790;
    float _841 = fma(_798, _800, _839);
    float _843 = -_800;
    float _845 = fma(_798, _790, _843);
    float _847 = fma(_798, _802, _792);
    float _849 = -_744;
    float _851 = _798 * _849;
    float _853 = fma(_798, _792, _802);
    int _855 = _770 + 96;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    float _873 = fma(_847, _738, _812);
    float _875 = trunc(_794);
    int _877 = int(_875);
    float _879 = fma(_806, _738, _851);
    float _881 = fma(_841, _738, _837);
    float _883 = fma(_845, _766, _873);
    float _885 = fma(_810, _766, _879);
    int _887 = _770 + 104;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = _883 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _907 = _883 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _909 = fma(_853, _766, _881);
    int _911 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _913 = _835 + _911;
    int _915 = _913 + 1;
    float _917 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[10].x, _905);
    float _919 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[8].x, _907);
    float _921 = _883 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _923 = _770 + 64;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    uint _927 = uint(int(uint(int(_925)) >> uint(2)));
    int _929 = int(_925) & 3;
    float _931 = (*spvDescriptorSet0.vp_c15)._m0[int(_927)][_929];
    int _933 = int(_925) + 1;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    int _937 = _933 & 3;
    float _939 = (*spvDescriptorSet0.vp_c15)._m0[int(_935)][_937];
    float _941 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[10].z, _917);
    float _943 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[8].z, _919);
    int _945 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _947 = _877 + _945;
    int _949 = _947 + 1;
    float _951 = _226 + _941;
    float _953 = _224 + _943;
    bool _955 = _915 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _957 = _770 + 56;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    uint _961 = uint(int(uint(int(_959)) >> uint(2)));
    int _963 = int(_959) & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    int _967 = int(_959) + 1;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    int _971 = _967 & 3;
    float _973 = (*spvDescriptorSet0.vp_c15)._m0[int(_969)][_971];
    int _975 = _915 | _949;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _979 = _951 + _977;
    bool _981 = _975 < 0;
    bool _983 = _981 || _955;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _987 = _953 + _985;
    float _989 = _979 * _979;
    int _991 = _770 + 72;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    uint _995 = uint(int(uint(int(_993)) >> uint(2)));
    int _997 = int(_993) & 3;
    float _999 = (*spvDescriptorSet0.vp_c15)._m0[int(_995)][_997];
    int _1001 = int(_993) + 1;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    int _1005 = _1001 & 3;
    float _1007 = (*spvDescriptorSet0.vp_c15)._m0[int(_1003)][_1005];
    bool _1009 = _949 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1011 = _1009 || _983;
    float _1013 = fma(_987, _987, _989);
    float _1015 = sqrt(_1013);
    int _1017 = _770 + 80;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
    int _1023 = int(_1019) & 3;
    float _1025 = (*spvDescriptorSet0.vp_c15)._m0[int(_1021)][_1023];
    int _1027 = int(_1019) + 1;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    int _1031 = _1027 & 3;
    float _1033 = (*spvDescriptorSet0.vp_c15)._m0[int(_1029)][_1031];
    float _1035 = _704 * _831;
    uint _1037 = as_type<uint>(_883);
    int _1039 = as_type<int>(_1035);
    float _1041 = _951;
    float _1043 = _979;
    if (!_1011)
    {
        int _1045 = _949 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1047 = _1045 + _915;
        _1037 = uint(_1047);
    }
    uint _1049 = _1037;
    float _1051 = _704 * _871;
    float _1053 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[9].x, _921);
    float _1055 = _885;
    float _1057 = as_type<float>(_1049);
    if (!_1011)
    {
        float _1059 = floor(_772);
        _1055 = _1059;
    }
    float _1061 = _1055;
    float _1063 = fma(_224, _863, _1051);
    float _1065 = fma(_224, _823, _1035);
    float _1067 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1053);
    bool _1069 = _1015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = fma(_226, _895, _1063);
    float _1073 = _1071;
    if (!_1011)
    {
        uint _1075 = uint(int(uint(int(_1049)) >> uint(2)));
        _1039 = int(_1075);
    }
    int _1077 = _1039;
    float _1079 = _316 + _1067;
    float _1081 = _1071 + _903;
    float _1083 = _704 * _939;
    float _1085 = 1.0 / _1081;
    float _1087 = fma(_224, _931, _1083);
    int _1089 = as_type<int>(_931);
    int _1091 = _1077;
    float _1093 = _1087;
    if (!_1011)
    {
        int _1095 = int(_1049) << 2;
        _1089 = _1095;
    }
    int _1097 = _1089;
    float _1099 = fma(_226, _965, _1065);
    int _1101 = _1097;
    float _1103 = _1033;
    if (!_1011)
    {
        int _1105 = 12 & _1097;
        _1101 = _1105;
    }
    int _1107 = _1101;
    float _1109 = _1099 + _973;
    float _1111 = as_type<float>(_1107);
    if (!_1011)
    {
        int _1113 = _1077 << 4;
        int _1115 = _1113 + _1107;
        _1091 = _1115;
    }
    int _1117 = _1091;
    if (!_1069)
    {
        _1111 = _953;
    }
    float _1119 = _1111;
    float _1121 = fma(_226, _999, _1087);
    float _1123 = _1119;
    if (!_1069)
    {
        _1093 = _1079;
    }
    float _1125 = _1093;
    float _1127 = _1121 + _1007;
    bool _1129 = !_1069;
    float _1131 = _1125;
    if (!_1129)
    {
        float _1133 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1137 = _1015 + _1135;
        float _1139 = rsqrt(_1013);
        float _1141 = _1137 * _1133;
        float _1143 = _1079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = _1141 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1145 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 + (-1.0);
        float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = fma(_1153, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = fma(_1079, _1149, _1157);
        float _1163 = _1139 * _1159;
        float _1165 = fma(_987, _1163, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_979, _1163, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1041 = _1167;
        _1131 = _1161;
        _1123 = _1165;
        _1073 = _1145;
    }
    float _1169 = _1041;
    float _1171 = _1131;
    float _1173 = _1123;
    float _1175 = _1073;
    float _1177 = _1175;
    float _1179 = _1171;
    float _1181 = _1173;
    if (_782)
    {
        _1043 = _1169;
    }
    float _1183 = _1043;
    float _1185 = _1183;
    if (!_782)
    {
        float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1189 = _316 + _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1193 = _224 + _1191;
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1197 = -_316;
        float _1199 = _1197 + _1171;
        float _1201 = _1189 * _1189;
        float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1205 = _226 + _1203;
        float _1207 = -_224;
        float _1209 = _1207 + _1173;
        float _1211 = fma(_1193, _1193, _1201);
        float _1213 = fma(_1205, _1205, _1211);
        float _1215 = sqrt(_1213);
        float _1217 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1219 = _1217 * _1195;
        float _1221 = -_226;
        float _1223 = _1221 + _1169;
        float _1225 = fma(_1199, _1219, _316);
        float _1227 = fma(_1209, _1219, _224);
        float _1229 = fma(_1223, _1219, _226);
        _1177 = _1223;
        _1179 = _1225;
        _1181 = _1227;
        _1185 = _1229;
    }
    float _1231 = _1177;
    float _1233 = _1179;
    float _1235 = _1181;
    float _1237 = _1185;
    float _1239 = _1231;
    if (!_1011)
    {
        int _1241 = _1117 + 400;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
        int _1247 = int(_1243) & 3;
        float _1249 = (*spvDescriptorSet0.vp_c15)._m0[int(_1245)][_1247];
        _1239 = _1249;
    }
    float _1251 = _1239;
    float _1253 = _1109 * _1085;
    float _1255 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1257 = _1127 * _1085;
    float _1259 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1261 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1255);
    bool _1265 = _1253 >= 0.0;
    int _1267 = _770 + 88;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    uint _1271 = uint(int(uint(int(_1269)) >> uint(2)));
    int _1273 = int(_1269) & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    int _1277 = int(_1269) + 1;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    int _1281 = _1277 & 3;
    float _1283 = (*spvDescriptorSet0.vp_c15)._m0[int(_1279)][_1281];
    float _1285 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1259);
    float _1287 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1263);
    float _1289 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1261);
    float _1291 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1297 = _1253 <= 1.0;
    bool _1299 = _1297 && _1265;
    float _1301 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1289);
    float _1303 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1291);
    float _1305 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1311 = _1257 >= 0.0;
    bool _1313 = _1311 && _1299;
    float _1315 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1307);
    float _1319 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1321 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1323 = _1257 <= 1.0;
    bool _1325 = _1323 && _1313;
    float _1327 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1317);
    float _1331 = -_1321;
    float _1333 = fma(_1331, _1319, 1.0);
    float _1335 = _965;
    if (!_1011)
    {
        float _1337 = floor(_794);
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1343 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1329);
    float _1345 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = _704 * _1033;
    float _1349 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1341);
    float _1351 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    float _1353 = 1.0 / _1343;
    if (_1325)
    {
        float _1355 = float(_760);
        _1103 = _1355;
    }
    float _1357 = _1103;
    float _1359 = fma(_224, _1025, _1347);
    float _1361 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1349);
    float _1363 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1351);
    float _1365 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1361);
    float _1367 = log2(_1333);
    float _1369 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1363);
    float _1371 = _1341;
    float _1373 = _1357;
    float _1375 = _1365;
    if (_1325)
    {
        float _1377 = rint(_1357);
        float _1379 = precise::max(_1377, 0.0);
        uint _1381 = uint(_1379);
        uint _1383 = clamp(_1381, 0u, 65535u);
        _1371 = as_type<float>(_1383);
    }
    float _1385 = _1371;
    float _1387 = fma(_226, _1275, _1359);
    float _1389 = _1275;
    if (!_1011)
    {
        float _1391 = -_1339;
        float _1393 = _794 + _1391;
        _1389 = _1393;
    }
    float _1395 = _1389;
    float _1397 = _1365 * _1353;
    float _1399 = _1369 * _1353;
    float _1401 = _1387 + _1283;
    float _1403 = _1251;
    if (!_1011)
    {
        float _1405 = rint(_1251);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        uint _1411 = clamp(_1409, 0u, 65535u);
        _1403 = as_type<float>(_1411);
    }
    float _1413 = _1403;
    float _1415 = _1367 * 0.693147182464599609375;
    float _1417 = _1401 * _1085;
    float _1419 = fma(_1397, 0.5, 0.5);
    float _1421 = fma(_1399, -0.5, 0.5);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1425 = _1415;
    if (!_1011)
    {
        float _1427 = -_1061;
        float _1429 = _772 + _1427;
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = _1085;
    if (_1325)
    {
        float3 _4767 = float3(_1253, _1257, float(as_type<int>(_1385)));
        float3 _4771 = select(_4767, float3(0.0), isnan(_4767));
        float _1435 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4771.xy, uint(rint(_4771.z)), _1417, level(0.0));
        _1433 = _1435;
    }
    float _1437 = _1433;
    float3 _4781 = float3(_1419, _1421, _1423);
    float _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4781, float3(0.0), isnan(_4781)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4781, float3(0.0), isnan(_4781)), level(0.0)).x;
    float3 _4790 = float3(_1419, _1421, _1423);
    float4 _1442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).xyzw;
    float _1444 = _1442.x;
    float _1446 = _1442.y;
    float _1448 = _1442.z;
    float _1450 = _1442.w;
    float _1452 = _953;
    if (!_1011)
    {
        float3 _4813 = float3(_1431, _1395, float(as_type<int>(_1413)));
        float3 _4815 = select(_4813, float3(0.0), isnan(_4813));
        float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4815.xy, uint(rint(_4815.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4815.xy, uint(rint(_4815.z)), level(0.0)).x;
        _1452 = _1454;
    }
    float _1456 = _1452;
    if (_1011)
    {
        _1373 = 1.0;
    }
    float _1458 = _1373;
    float _1460 = _1458;
    if (!_1011)
    {
        int _1462 = int(_1049) << 4;
        int _1464 = _1462 + 2048;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
        int _1470 = int(_1466) & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        int _1474 = int(_1466) + 1;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        int _1478 = _1474 & 3;
        float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
        int _1482 = _1464 + 8;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
        int _1488 = int(_1484) & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        int _1492 = int(_1484) + 1;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        int _1496 = _1492 & 3;
        float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
        float _1500 = _704 * _1480;
        float _1502 = fma(_224, _1472, _1500);
        float _1504 = fma(_226, _1490, _1502);
        float _1506 = _1504 + _1498;
        float _1508 = precise::clamp(_1506, 0.0, 1.0);
        float _1510 = -_1508;
        float _1512 = _1510 + _1456;
        float _1514 = fma(_1512, 500.0, 1.5);
        float _1516 = exp2(_1514);
        float _1518 = 0.0 + _1516;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1057 = as_type<float>(_1464);
        _1460 = _1520;
    }
    float _1522 = _1057;
    float _1524 = _1460;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1528 = _1233 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1235 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1536 = _1237 + _1534;
    float _1538 = _1528 * _1528;
    float _1540 = fma(_1532, _1532, _1538);
    float _1542 = fma(_1536, _1536, _1540);
    float _1544 = rsqrt(_1542);
    float _1546 = sqrt(_1542);
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1532 * _1548;
    float _1552 = _1536 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 + _1556;
    float _1560 = sqrt(_1558);
    bool _1562 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1560 + _1564;
    float _1568 = _1385;
    float _1570 = _1558;
    float _1572 = _1566;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1548;
    float _1580 = _1550;
    float _1582 = _1554;
    float _1584 = _1556;
    if (_1562)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1586;
    }
    float _1588 = _1568;
    if (_1562)
    {
        float _1590 = rsqrt(_1558);
        _1570 = _1590;
    }
    float _1592 = _1570;
    if (_1562)
    {
        float _1594 = _1566 * _1588;
        _1572 = _1594;
    }
    float _1596 = _1572;
    if (_1562)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _1574 = _1598;
    }
    float _1600 = _1574;
    float _1602 = _1253;
    if (_1562)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1588;
    if (_1562)
    {
        float _1616 = _1600 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = -_1548;
    float _1624 = -_1612;
    float _1626 = fma(_1528, _1622, _1624);
    float _1628 = _1626;
    if (_1562)
    {
        float _1630 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1630;
    }
    float _1632 = _1576;
    float _1634 = _1608;
    float _1636 = _1632;
    if (_1562)
    {
        float _1638 = fma(_1608, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = _1640;
    if (_1562)
    {
        float _1644 = _1620 + (-1.0);
        _1636 = _1644;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (_1562)
    {
        float _1650 = _1592 * _1640;
        _1578 = _1650;
    }
    float _1652 = _1578;
    if (_1562)
    {
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1654;
    }
    float _1656 = _1642;
    if (_1562)
    {
        float _1658 = _1550 * _1652;
        _1580 = _1658;
    }
    float _1660 = _1580;
    if (!_1562)
    {
        _1648 = _1552;
    }
    float _1662 = _1648;
    float _1664 = _1662;
    if (_1562)
    {
        float _1666 = _1552 * _1652;
        _1664 = _1666;
    }
    float _1668 = _1664;
    if (_1562)
    {
        float _1670 = fma(_1626, _1620, _1656);
        _1628 = _1670;
    }
    float _1672 = _1628;
    if (_1562)
    {
        float _1674 = _1660 * _1660;
        _1582 = _1674;
    }
    float _1676 = _1582;
    if (_1562)
    {
        float _1678 = _1668 * _1668;
        _1584 = _1678;
    }
    float _1680 = _1584;
    float _1682 = fma(_1672, _1672, _1676);
    float _1684 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1686 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1684);
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = _1682 + _1680;
    float _1692 = -_1688;
    float _1694 = _1692 + 1.0;
    float _1696 = rsqrt(_1690);
    float _1698 = abs(_1694);
    float _1700 = log2(_1698);
    float _1702 = _1696 * _1660;
    float _1704 = _1696 * _1672;
    float _1706 = _1696 * _1668;
    float _1708 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = -_1708;
    float _1712 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1710);
    float _1714 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1716 = -_1706;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1712);
    float _1720 = exp2(_1714);
    float _1722 = fma(_1718, -0.5, 0.5);
    float _1724 = fma(_1718, 0.5, 0.5);
    float _1726 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = sqrt(_1722);
    float _1730 = fma(_1724, _1726, -0.212114393711090087890625);
    float _1732 = _1704 + 1.0;
    float _1734 = fma(_1724, _1730, 1.570728778839111328125);
    float _1736 = -_1704;
    float _1738 = fma(_1720, _1732, _1736);
    float _1740 = fma(_1738, 0.5, 0.5);
    float _1742 = _1728 * 0.636619746685028076171875;
    float _1744 = -_1734;
    float _1746 = fma(_1742, _1744, 1.0);
    float2 _5265 = float2(_1746, _1740);
    float3 _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5265, float2(0.0), isnan(_5265)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5265, float2(0.0), isnan(_5265)), level(0.0)).xyz;
    float _1752 = _1750.x;
    float _1754 = _1750.y;
    float _1756 = _1750.z;
    float _1758 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1760 = in.m_71.y;
    float _1762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1764 = _662 != 0.0;
    bool _1766 = isnan(_662);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(0.0);
    bool _1772 = _1768 || _1770;
    float _1774 = _1758 * _254;
    float _1776 = in.m_63.w;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1780 = _1778 != 0;
    float _1782 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1786 = _1784 != 0;
    float _1788 = in.m_71.x;
    float _1790 = trunc(_1774);
    int _1792 = int(_1790);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1796 = _1794 != 0;
    float _1798 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1782);
    float _1800 = in.m_73.x;
    float _1802 = in.m_73.y;
    float _1804 = in.m_73.z;
    bool _1806 = _660 == 0.0;
    bool _1808 = !_1772;
    bool _1810 = _1806 && _1808;
    float _1812 = -_244;
    float _1814 = _1812 + 1.0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1798);
    bool _1822 = _664 == 0.0;
    bool _1824 = _1822 && _1810;
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_75.x = _1235;
    out.m_75.y = _1233;
    out.m_75.z = _1237;
    float _1828 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    int _1830 = _1792 << 4;
    int _1832 = _1830 + 1712;
    float _1834 = -_1760;
    float _1836 = _1834 + 1.0;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1840 = _1776 > 0.5;
    uint _1842 = uint(int(uint(_1832) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    int _1850 = int(_1842) + 1;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    int _1854 = _1850 & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = _1840 ? as_type<int>(_1836) : as_type<int>(_1760);
    bool _1860 = _264 > 0.5;
    float _1862 = _1818 ? as_type<float>(_1858) : _1760;
    int _1864 = _1832 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    float _1874 = _1760;
    bool _1876 = _1860;
    bool _1878 = _1818;
    float _1880 = _1788;
    float _1882 = _1776;
    if (_1780)
    {
        float _1884 = _1860 ? _1836 : _1760;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (_1786)
    {
        bool _1888 = _250 > 0.5;
        _1876 = _1888;
    }
    bool _1890 = _1876;
    if (_1796)
    {
        float _1892 = -_1788;
        float _1894 = _1892 + 1.0;
        _370 = as_type<int>(_1894);
    }
    int _1896 = _370;
    if (_1796)
    {
        bool _1898 = _254 > 0.5;
        _1878 = _1898;
    }
    bool _1900 = _1878;
    if (_1786)
    {
        float _1902 = -_1788;
        float _1904 = _1902 + 1.0;
        _372 = as_type<int>(_1904);
    }
    int _1906 = _372;
    float _1908 = 0.0;
    if (!_1796)
    {
        _1908 = _1788;
    }
    float _1910 = _1908;
    float _1912 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1914 = 0.0;
    float _1916 = _1910;
    if (_1824)
    {
        _1914 = _1800;
    }
    float _1918 = _1914;
    float _1920 = _1918;
    if (_1796)
    {
        float _1922 = _1900 ? as_type<float>(_1896) : _1788;
        _1916 = _1922;
    }
    float _1924 = _1916;
    if (_1786)
    {
        float _1926 = _1890 ? as_type<float>(_1906) : _1788;
        _1880 = _1926;
    }
    float _1928 = _1880;
    if (_1824)
    {
        _1882 = _1918;
    }
    float _1930 = _1882;
    float _1932 = _1930;
    if (!_1824)
    {
        _1920 = _1800;
    }
    float _1934 = _1920;
    float _1936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1938 = 0.0;
    if (_1824)
    {
        _1938 = _1802;
    }
    float _1940 = _1938;
    float _1942 = _1940;
    if (!_1824)
    {
        float _1944 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1934);
        _1932 = _1944;
    }
    float _1946 = _1932;
    float _1948 = 0.0;
    if (_1824)
    {
        _1948 = _1804;
    }
    float _1950 = _1948;
    float _1952 = abs(_694);
    float _1954 = log2(_1952);
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1958 = 0.0;
    float _1960 = _1950;
    if (_1824)
    {
        _1958 = _1950;
    }
    float _1962 = _1958;
    float _1964 = _1962;
    if (!_1824)
    {
        _1960 = _1804;
    }
    float _1966 = _1960;
    if (!_1824)
    {
        float _1968 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1966);
        _1964 = _1968;
    }
    float _1970 = _1964;
    bool _1972 = _694 <= 8000.0;
    bool _1974 = isnan(_694);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(8000.0);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    float _1984 = _1848 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1986 = _1856 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1988 = in.m_77.x;
    float _1990 = in.m_77.y;
    float _1992 = in.m_77.z;
    float _1994 = in.m_77.w;
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2000 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1984;
    if (_1824)
    {
        _2002 = _1940;
    }
    float _2004 = _2002;
    float _2006 = _2004;
    if (!_1824)
    {
        _1942 = _1802;
    }
    float _2008 = _1942;
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2012 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2014 = _1912 * _1936;
    float _2016 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1824)
    {
        float _2018 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2018;
    }
    float _2020 = _2006;
    float _2022 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_79.x = _2000;
    out.m_79.y = _1996;
    out.m_79.z = _2010;
    out.m_79.w = _1956;
    float _2024 = _2012 * _1826;
    float _2026 = _2016 * _1838;
    float _2028 = _2022 * _1762;
    float _2030 = _1990 * _1966;
    out.m_81.x = _2028;
    out.m_81.y = _2024;
    out.m_81.z = _2026;
    out.m_81.w = _2014;
    float _2032 = -_2030;
    float _2034 = fma(_1992, _2008, _2032);
    float _2036 = -_1990;
    float _2038 = _798 * _2036;
    float _2040 = _1992 * _1934;
    float _2042 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2044 = _1988 * _2008;
    float _2046 = fma(_806, _1988, _2038);
    float _2048 = -_2040;
    float _2050 = fma(_1988, _1966, _2048);
    float _2052 = -_2044;
    float _2054 = fma(_1990, _1934, _2052);
    float _2056 = _2034 * _1994;
    float _2058 = _2050 * _1994;
    float _2060 = exp2(_2042);
    float _2062 = _2054 * _1994;
    float _2064 = -_2020;
    float _2066 = _798 * _2064;
    float _2068 = -_2058;
    float _2070 = _798 * _2068;
    float _2072 = _804 * _1990;
    float _2074 = _804 * _2020;
    float _2076 = fma(_806, _1946, _2066);
    float _2078 = fma(_806, _2056, _2070);
    float _2080 = _804 * _2058;
    float _2082 = _808 * _1990;
    float _2084 = fma(_847, _1946, _2074);
    float _2086 = fma(_847, _1988, _2072);
    float _2088 = fma(_847, _2056, _2080);
    float _2090 = _808 * _2058;
    float _2092 = fma(_810, _1970, _2076);
    float _2094 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = fma(_841, _1988, _2082);
    float _2100 = fma(_841, _2056, _2090);
    float _2102 = fma(_845, _1992, _2086);
    float _2104 = fma(_810, _1992, _2046);
    float _2106 = fma(_853, _1992, _2098);
    float _2108 = fma(_845, _1970, _2084);
    float _2110 = fma(_2096, -2.0, 3.0);
    float _2112 = fma(_810, _2062, _2078);
    float _2114 = fma(_845, _2062, _2088);
    float _2116 = fma(_853, _2062, _2100);
    float _2118 = _2096 * _2096;
    float _2120 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2122 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2124 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2126 = _2118 * _2110;
    float _2128 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2120);
    float _2130 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2132 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2122);
    float _2134 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2136 = _808 * _2020;
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2124);
    float _2140 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2130);
    float _2142 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2128);
    float _2144 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2134);
    float _2146 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2132);
    float _2148 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2150 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2152 = fma(_841, _1946, _2136);
    float _2154 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2156 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2140);
    float _2158 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2138);
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2144);
    float _2162 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2148);
    float _2164 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2150);
    float _2166 = fma(_853, _1970, _2152);
    float _2168 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2154);
    float _2170 = -_2126;
    float _2172 = _2170 + 1.0;
    out.m_83.x = _2158;
    out.m_83.y = _2142;
    out.m_83.z = _2146;
    float _2174 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2168);
    float _2176 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2126);
    float _2180 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    float _2182 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2162);
    float _2184 = _1982 * _2178;
    float _2186 = exp2(_2176);
    float _2188 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2180);
    float _2190 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2164);
    float _2192 = _1828 + _1343;
    float _2194 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2196 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2188);
    float _2198 = _2192 * 0.5;
    float _2200 = _2192;
    if (!_1325)
    {
        _2200 = 1.0;
    }
    float _2202 = _2200;
    float _2204 = _1814 * _2194;
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    float _2208 = _2202;
    if (_1325)
    {
        bool _2210 = _1437 >= _1417;
        bool _2212 = isnan(_1437);
        bool _2214 = _2210 || _2212;
        bool _2216 = isnan(_1417);
        bool _2218 = _2214 || _2216;
        float _2220 = float(_2218);
        _2208 = _2220;
    }
    float _2222 = _2208;
    out.m_87.x = _2156;
    out.m_87.y = _2160;
    out.m_87.z = _2196;
    float _2224 = -_2206;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2228 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2230 = isnan(_1546);
    bool _2232 = _2228 || _2230;
    bool _2234 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2236 = _2232 || _2234;
    float _2238 = _2222 * _1524;
    float _2240 = -_2186;
    float _2242 = _2240 + 1.0;
    out.gl_Position.x = _1365;
    out.gl_Position.y = _1369;
    out.gl_Position.z = _1828;
    out.gl_Position.w = _1343;
    float _2244 = -_2238;
    float _2246 = fma(_2244, _2226, 1.0);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.z = _2198;
    out.m_89.w = _1343;
    float _2252 = _2248 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2254 = _2250 * _1439;
    float _2256 = -_2250;
    float _2258 = _2256 + 1.0;
    out.m_91.x = _2182;
    out.m_91.y = _2190;
    out.m_91.z = _2174;
    float _2260 = _2258;
    float _2262 = _2248;
    float _2264 = _2254;
    if (!_2236)
    {
        _1375 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2266 = _1375;
    float _2268 = _1450 * _2254;
    float _2270 = _1450 * _2258;
    out.m_93.x = _2252;
    float _2272 = _2268;
    float _2274 = _2266;
    float _2276 = _2266;
    if (!_2236)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2278 = _2260;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2236)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2284 = _2262;
    float _2286 = _1756 * _2254;
    float _2288 = fma(_1752, _2268, _1444);
    float _2290 = fma(_1754, _2268, _1446);
    float _2292 = _2286;
    float _2294 = _2284;
    float _2296 = _2284;
    if (!_2236)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2298 = _2264;
    float _2300 = fma(_1450, _2286, _1448);
    float _2302 = _2298;
    float _2304 = _2298;
    if (!_2236)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2306 = _2292;
    float _2308 = _2306;
    float _2310 = _2306;
    if (!_2236)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2312 = _2272;
    out.m_95.x = _2288;
    out.m_95.y = _2290;
    out.m_95.z = _2300;
    out.m_95.w = _2270;
    bool _2314 = !_2236;
    float _2316 = _2312;
    float _2318 = _2312;
    if (!_2314)
    {
        bool _2320 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2322 = isnan(_1546);
        bool _2324 = _2320 || _2322;
        bool _2326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2328 = _2324 || _2326;
        if (!_2328)
        {
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2332 = _1546 + _2330;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2336 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2334;
            float _2338 = 1.0 / _2336;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2360 = _2332 * _2338;
            float _2362 = precise::clamp(_2360, 0.0, 1.0);
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2368 = fma(_2362, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2370 = fma(_2362, _2366, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2372 = fma(_2362, _2346, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2374 = fma(_2362, _2350, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2376 = fma(_2362, _2354, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2378 = fma(_2362, _2358, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2282 = _2370;
            _2304 = _2376;
            _2276 = _2368;
            _2310 = _2374;
            _2296 = _2372;
            _2318 = _2378;
            _2380 = true;
        }
        else
        {
            bool _2382 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2384 = isnan(_1546);
            bool _2386 = _2382 || _2384;
            bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2390 = _2386 || _2388;
            if (!_2390)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2392 = _2274;
            _2276 = _2392;
            if (!_2390)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2394 = _2280;
            _2282 = _2394;
            if (!_2390)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2396 = _2294;
            _2296 = _2396;
            if (!_2390)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2398 = _2308;
            _2310 = _2398;
            if (!_2390)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2400 = _2302;
            _2304 = _2400;
            if (!_2390)
            {
                _2316 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2402 = _2316;
            bool _2404 = !_2390;
            _2318 = _2402;
            if (!_2404)
            {
                bool _2406 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2408 = isnan(_1546);
                bool _2410 = _2406 || _2408;
                bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2414 = _2410 || _2412;
                if (!_2414)
                {
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2418 = _1546 + _2416;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2422 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2420;
                    float _2424 = 1.0 / _2422;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2446 = _2418 * _2424;
                    float _2448 = precise::clamp(_2446, 0.0, 1.0);
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2454 = fma(_2448, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2456 = fma(_2448, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2458 = fma(_2448, _2432, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2460 = fma(_2448, _2436, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2462 = fma(_2448, _2440, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2464 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2282 = _2456;
                    _2304 = _2462;
                    _2276 = _2454;
                    _2310 = _2460;
                    _2296 = _2458;
                    _2318 = _2464;
                    _2380 = true;
                }
                else
                {
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2318 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2380 = false;
    float _2466 = _2282;
    float _2468 = _2304;
    float _2470 = _2276;
    float _2472 = _2310;
    float _2474 = _2296;
    float _2476 = _2318;
    float _2478 = fma(_2190, -0.5, 0.5);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = -_2466;
    float _2484 = _2482 + _2468;
    float _2486 = -_2470;
    float _2488 = _2486 + _2472;
    float _2490 = -_2474;
    float _2492 = _2490 + _2476;
    bool _2494 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2496 = fma(_2480, _2484, _2466);
    float _2498 = fma(_2480, _2488, _2470);
    float _2500 = fma(_2480, _2492, _2474);
    float _2502 = _2496 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2504 = fma(_2498, 0.298911988735198974609375, _2502);
    float _2506 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2508 = fma(_2500, 0.114477999508380889892578125, _2504);
    out.m_59.x = _2506;
    float _2510 = -_2508;
    float _2512 = _2498 + _2510;
    float _2514 = -_2508;
    float _2516 = _2496 + _2514;
    float _2518 = -_2508;
    float _2520 = _2500 + _2518;
    float _2522 = fma(_2512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    float _2524 = fma(_2516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    float _2526 = fma(_2520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    out.m_99.x = _2522;
    out.m_99.y = _2524;
    out.m_99.z = _2526;
    if (!_2494)
    {
        return out;
    }
    float _2528 = -_1233;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2532 = -_1235;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2536 = -_1237;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2540 = _2530 * _2530;
    float _2542 = fma(_2534, _2534, _2540);
    float _2544 = fma(_2538, _2538, _2542);
    float _2546 = sqrt(_2544);
    float _2548 = rsqrt(_2544);
    float _2550 = -_2546;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = _2534 * _2548;
    float _2560 = _2530 * _2548;
    float _2562 = abs(_2556);
    float _2564 = log2(_2562);
    float _2566 = _2538 * _2548;
    float _2568 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2570 = _2190 * _2560;
    float _2572 = -_2560;
    float _2574 = -_2568;
    float _2576 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2574);
    float _2578 = fma(_2182, _2558, _2570);
    float _2580 = -_2566;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2576);
    float _2584 = fma(_2174, _2566, _2578);
    float _2586 = precise::clamp(_2584, 0.0, 1.0);
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2590 = _2582 + _2588;
    float _2592 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = exp2(_2592);
    float _2600 = _2598 * _2596;
    float _2602 = _2586 * _2600;
    float _2604 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2606 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2608 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2604;
    out.m_97.y = _2606;
    out.m_97.z = _2608;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2380 = false;
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
        float _2665 = as_type<float>(_134);
        out.gl_Position.z = _2665;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_61.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_59.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2735 = as_type<float>(_172);
        out.gl_Position.z = _2735;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float2 _2862 = float2(_238, _242);
    float _244 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2862, float2(0.0), isnan(_2862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2862, float2(0.0), isnan(_2862)), level(0.0)).x;
    float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _248 = log2(_246);
    float _250 = in.m_63.z;
    float _252 = _208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _254 = in.m_63.x;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = in.m_63.y;
    float _266 = 1.0 / _258;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _270 = 1.0 + _268;
    float _272 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[5].x, _252);
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _284 = _282 != 0;
    float _286 = _248 * _152;
    bool _288 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _290 = isnan(1.0);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _296 = _292 || _294;
    float _298 = fma(_210, (*spvDescriptorSet0.vp_c10)._m0[5].z, _272);
    float _300 = 1.0 / _262;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _204 + _302;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _314 = _310 || _312;
    float _316 = _298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _318 = _250 * 2.0;
    float _320 = exp2(_286);
    float _322 = _304 * _266;
    float _324 = _254 * 2.0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _204 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = _264 + _250;
    float _336 = _264 * 2.0;
    float _338 = 1.0 / _270;
    float _340 = _328 * _300;
    float _342 = _334 + (-1.0);
    float _344 = _254 + _264;
    float _346 = fma(_332, _322, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = floor(_318);
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _352 = -_320;
    float _354 = _352 + 1.0;
    float _356 = floor(_324);
    float _358 = _254 + _250;
    float _360 = _314 ? _354 : 0.0;
    float _362 = _358 + (-1.0);
    float _364 = _344 + (-1.0);
    float _366 = floor(_336);
    int _368 = 2;
    int _370 = as_type<int>(_250);
    int _372 = as_type<int>(_254);
    if (_296)
    {
        float _374 = _360 * _338;
        _154 = _374;
    }
    float _376 = _154;
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _380 = _348 >= 0.0;
    bool _382 = isnan(_348);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _392;
    bool _396 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _398 = isnan(_204);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    bool _408 = _356 >= 0.0;
    bool _410 = isnan(_356);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    bool _422 = _356 > 0.0;
    float _424 = fma(_394, _322, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _426 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_204);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    int _438 = _388 ? 0 : 1;
    int _440 = _416 ? 0 : 1;
    float _442 = -_436;
    float _444 = _442 + 1.0;
    bool _446 = _366 > 0.0;
    bool _448 = _366 >= 0.0;
    bool _450 = isnan(_366);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = -_406;
    float _460 = _458 + 1.0;
    bool _462 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _464 = isnan(_204);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _478 = _348 > 0.0;
    float _480 = fma(_420, _322, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _482 = _436 * _460;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = _472 * _444;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = -_472;
    float _496 = _494 + 1.0;
    float _498 = fma(_476, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _500 = _346 * _488;
    float _502 = fma(_486, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = fma(_492, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _506 = _480 * _488;
    float _508 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    bool _510 = !_276;
    int _512 = _510 ? 0 : 1;
    float _514 = _424 * _488;
    int _516 = ~_438;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    int _524 = _520;
    if (!_478)
    {
        int _526 = ~_438;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    float _532 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    int _534 = abs(_512);
    float _536 = _316 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _538 = in.m_65.x;
    float _540 = in.m_65.y;
    float _542 = in.m_65.z;
    int _544 = ~_440;
    int _546 = _544 + 1;
    int _548 = _546 + 1;
    float _550 = fma(_502, _482, _508);
    float _552 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].x, _536);
    int _554 = _548;
    if (!_422)
    {
        int _556 = ~_440;
        int _558 = _556 + 1;
        _554 = _558;
    }
    int _560 = _554;
    float _562 = _316 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _564 = float(_534);
    float _566 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].z, _552);
    float _568 = float(_530);
    float _570 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].x, _562);
    float _572 = fma(_504, _482, _532);
    float _574 = _566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _576 = !_284;
    int _578 = _576 ? 0 : 1;
    float _580 = _564 * _568;
    float _582 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].z, _570);
    float _584 = 1.0 / _574;
    bool _586 = !_280;
    int _588 = _586 ? 0 : 1;
    float _590 = _580 * (-2.0);
    float _592 = _582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _594 = fma(_498, _482, _522);
    int _596 = abs(_588);
    float _598 = fma(_390, _590, _390);
    int _600 = abs(_578);
    float _602 = _592 + _574;
    float _604 = fma(_590, _538, _538);
    int _606 = _456 ? 0 : 1;
    float _608 = _254 + (-0.5);
    float _610 = float(_596);
    float _612 = in.m_67.x;
    float _614 = in.m_67.y;
    float _616 = in.m_67.z;
    float _618 = float(_560);
    float _620 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _604);
    float _622 = _602 * _584;
    float _624 = _622 * 0.5;
    int _626 = ~_606;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = _610 * _618;
    int _634 = _630;
    if (!_446)
    {
        int _636 = ~_606;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _644 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[30].w, _642);
    float _646 = fma(_598, _376, _620);
    float _648 = float(_640);
    float _650 = _632 * (-2.0);
    float _652 = float(_600);
    float _654 = 1.0 / _644;
    float _656 = _264 + (-0.5);
    float _658 = fma(_650, _540, _540);
    float _660 = in.m_69.x;
    float _662 = in.m_69.y;
    float _664 = in.m_69.z;
    float _666 = _652 * _648;
    float _668 = fma(_350, _650, _350);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _672 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].x, _594);
    float _674 = _666 * (-2.0);
    float _676 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _678 = fma(_668, _376, _670);
    float _680 = _250 + (-0.5);
    float _682 = fma(_674, _542, _542);
    float _684 = fma(_378, _674, _378);
    float _686 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].z, _572);
    float _688 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[145].y, _550);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].z, _682);
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _694 = _654 * _692;
    float _696 = _646 * 0.15915493667125701904296875;
    float _698 = _678 * 0.15915493667125701904296875;
    float _700 = _672 * _612;
    float _702 = fma(_684, _376, _690);
    float _704 = _316 + _676;
    float _706 = _696 * 6.283185482025146484375;
    float _708 = sin(_706);
    float _710 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _712 = _702 * 0.15915493667125701904296875;
    bool _714 = _694 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _716 = _704 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _718 = _688 * _614;
    bool _720 = _694 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _722 = _696 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].x, _716);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _660);
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _662);
    float _732 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _686 * _616;
    float _736 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].z, _726);
    float _738 = _728 * _710;
    float _740 = _698 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _730 * _732;
    bool _746 = !_714;
    int _748 = _746 ? 0 : 1;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _664);
    float _752 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (!_714)
    {
        _368 = 1;
    }
    int _754 = _368;
    float _756 = _704 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _758 = _754;
    if (!_720)
    {
        _758 = _748;
    }
    int _760 = _758;
    float _762 = _698 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = _750 * _752;
    float _768 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].x, _756);
    int _770 = _760 << 6;
    float _772 = _736 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _782 = _778 || _780;
    float _784 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].z, _768);
    float _786 = _712 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _724 * _742;
    float _792 = _708 * _742;
    float _794 = _784 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _796 = _712 * 6.283185482025146484375;
    float _798 = sin(_796);
    float _800 = _708 * _764;
    float _802 = _724 * _764;
    float _804 = _724 * _788;
    float _806 = _764 * _788;
    float _808 = _708 * _788;
    float _810 = _742 * _788;
    float _812 = _804 * _744;
    int _814 = _770 + 48;
    uint _817 = uint(int(uint(_814) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[int(_827)][_829];
    float _833 = trunc(_772);
    int _835 = int(_833);
    float _837 = _808 * _744;
    float _839 = -_790;
    float _841 = fma(_798, _800, _839);
    float _843 = -_800;
    float _845 = fma(_798, _790, _843);
    float _847 = fma(_798, _802, _792);
    float _849 = -_744;
    float _851 = _798 * _849;
    float _853 = fma(_798, _792, _802);
    int _855 = _770 + 96;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    float _873 = fma(_847, _738, _812);
    float _875 = trunc(_794);
    int _877 = int(_875);
    float _879 = fma(_806, _738, _851);
    float _881 = fma(_841, _738, _837);
    float _883 = fma(_845, _766, _873);
    float _885 = fma(_810, _766, _879);
    int _887 = _770 + 104;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = _883 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _907 = _883 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _909 = fma(_853, _766, _881);
    int _911 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _913 = _835 + _911;
    int _915 = _913 + 1;
    float _917 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[10].x, _905);
    float _919 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[8].x, _907);
    float _921 = _883 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _923 = _770 + 64;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    uint _927 = uint(int(uint(int(_925)) >> uint(2)));
    int _929 = int(_925) & 3;
    float _931 = (*spvDescriptorSet0.vp_c15)._m0[int(_927)][_929];
    int _933 = int(_925) + 1;
    uint _935 = uint(int(uint(_933) >> uint(2)));
    int _937 = _933 & 3;
    float _939 = (*spvDescriptorSet0.vp_c15)._m0[int(_935)][_937];
    float _941 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[10].z, _917);
    float _943 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[8].z, _919);
    int _945 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _947 = _877 + _945;
    int _949 = _947 + 1;
    float _951 = _226 + _941;
    float _953 = _224 + _943;
    bool _955 = _915 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _957 = _770 + 56;
    uint _959 = uint(int(uint(_957) >> uint(2)));
    uint _961 = uint(int(uint(int(_959)) >> uint(2)));
    int _963 = int(_959) & 3;
    float _965 = (*spvDescriptorSet0.vp_c15)._m0[int(_961)][_963];
    int _967 = int(_959) + 1;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    int _971 = _967 & 3;
    float _973 = (*spvDescriptorSet0.vp_c15)._m0[int(_969)][_971];
    int _975 = _915 | _949;
    float _977 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _979 = _951 + _977;
    bool _981 = _975 < 0;
    bool _983 = _981 || _955;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _987 = _953 + _985;
    float _989 = _979 * _979;
    int _991 = _770 + 72;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    uint _995 = uint(int(uint(int(_993)) >> uint(2)));
    int _997 = int(_993) & 3;
    float _999 = (*spvDescriptorSet0.vp_c15)._m0[int(_995)][_997];
    int _1001 = int(_993) + 1;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    int _1005 = _1001 & 3;
    float _1007 = (*spvDescriptorSet0.vp_c15)._m0[int(_1003)][_1005];
    bool _1009 = _949 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1011 = _1009 || _983;
    float _1013 = fma(_987, _987, _989);
    float _1015 = sqrt(_1013);
    int _1017 = _770 + 80;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
    int _1023 = int(_1019) & 3;
    float _1025 = (*spvDescriptorSet0.vp_c15)._m0[int(_1021)][_1023];
    int _1027 = int(_1019) + 1;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    int _1031 = _1027 & 3;
    float _1033 = (*spvDescriptorSet0.vp_c15)._m0[int(_1029)][_1031];
    float _1035 = _704 * _831;
    uint _1037 = as_type<uint>(_883);
    int _1039 = as_type<int>(_1035);
    float _1041 = _951;
    float _1043 = _979;
    if (!_1011)
    {
        int _1045 = _949 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1047 = _1045 + _915;
        _1037 = uint(_1047);
    }
    uint _1049 = _1037;
    float _1051 = _704 * _871;
    float _1053 = fma(_885, (*spvDescriptorSet0.vp_c10)._m0[9].x, _921);
    float _1055 = _885;
    float _1057 = as_type<float>(_1049);
    if (!_1011)
    {
        float _1059 = floor(_772);
        _1055 = _1059;
    }
    float _1061 = _1055;
    float _1063 = fma(_224, _863, _1051);
    float _1065 = fma(_224, _823, _1035);
    float _1067 = fma(_909, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1053);
    bool _1069 = _1015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = fma(_226, _895, _1063);
    float _1073 = _1071;
    if (!_1011)
    {
        uint _1075 = uint(int(uint(int(_1049)) >> uint(2)));
        _1039 = int(_1075);
    }
    int _1077 = _1039;
    float _1079 = _316 + _1067;
    float _1081 = _1071 + _903;
    float _1083 = _704 * _939;
    float _1085 = 1.0 / _1081;
    float _1087 = fma(_224, _931, _1083);
    int _1089 = as_type<int>(_931);
    int _1091 = _1077;
    float _1093 = _1087;
    if (!_1011)
    {
        int _1095 = int(_1049) << 2;
        _1089 = _1095;
    }
    int _1097 = _1089;
    float _1099 = fma(_226, _965, _1065);
    int _1101 = _1097;
    float _1103 = _1033;
    if (!_1011)
    {
        int _1105 = 12 & _1097;
        _1101 = _1105;
    }
    int _1107 = _1101;
    float _1109 = _1099 + _973;
    float _1111 = as_type<float>(_1107);
    if (!_1011)
    {
        int _1113 = _1077 << 4;
        int _1115 = _1113 + _1107;
        _1091 = _1115;
    }
    int _1117 = _1091;
    if (!_1069)
    {
        _1111 = _953;
    }
    float _1119 = _1111;
    float _1121 = fma(_226, _999, _1087);
    float _1123 = _1119;
    if (!_1069)
    {
        _1093 = _1079;
    }
    float _1125 = _1093;
    float _1127 = _1121 + _1007;
    bool _1129 = !_1069;
    float _1131 = _1125;
    if (!_1129)
    {
        float _1133 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1137 = _1015 + _1135;
        float _1139 = rsqrt(_1013);
        float _1141 = _1137 * _1133;
        float _1143 = _1079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1145 = _1141 * 0.15915493667125701904296875;
        float _1147 = _1145 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1145 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 + (-1.0);
        float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = fma(_1153, _1143, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = fma(_1079, _1149, _1157);
        float _1163 = _1139 * _1159;
        float _1165 = fma(_987, _1163, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_979, _1163, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1041 = _1167;
        _1131 = _1161;
        _1123 = _1165;
        _1073 = _1145;
    }
    float _1169 = _1041;
    float _1171 = _1131;
    float _1173 = _1123;
    float _1175 = _1073;
    float _1177 = _1175;
    float _1179 = _1171;
    float _1181 = _1173;
    if (_782)
    {
        _1043 = _1169;
    }
    float _1183 = _1043;
    float _1185 = _1183;
    if (!_782)
    {
        float _1187 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1189 = _316 + _1187;
        float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1193 = _224 + _1191;
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1197 = -_316;
        float _1199 = _1197 + _1171;
        float _1201 = _1189 * _1189;
        float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1205 = _226 + _1203;
        float _1207 = -_224;
        float _1209 = _1207 + _1173;
        float _1211 = fma(_1193, _1193, _1201);
        float _1213 = fma(_1205, _1205, _1211);
        float _1215 = sqrt(_1213);
        float _1217 = precise::min(_1215, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1219 = _1217 * _1195;
        float _1221 = -_226;
        float _1223 = _1221 + _1169;
        float _1225 = fma(_1199, _1219, _316);
        float _1227 = fma(_1209, _1219, _224);
        float _1229 = fma(_1223, _1219, _226);
        _1177 = _1223;
        _1179 = _1225;
        _1181 = _1227;
        _1185 = _1229;
    }
    float _1231 = _1177;
    float _1233 = _1179;
    float _1235 = _1181;
    float _1237 = _1185;
    float _1239 = _1231;
    if (!_1011)
    {
        int _1241 = _1117 + 400;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
        int _1247 = int(_1243) & 3;
        float _1249 = (*spvDescriptorSet0.vp_c15)._m0[int(_1245)][_1247];
        _1239 = _1249;
    }
    float _1251 = _1239;
    float _1253 = _1109 * _1085;
    float _1255 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1257 = _1127 * _1085;
    float _1259 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1261 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1255);
    bool _1265 = _1253 >= 0.0;
    int _1267 = _770 + 88;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    uint _1271 = uint(int(uint(int(_1269)) >> uint(2)));
    int _1273 = int(_1269) & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    int _1277 = int(_1269) + 1;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    int _1281 = _1277 & 3;
    float _1283 = (*spvDescriptorSet0.vp_c15)._m0[int(_1279)][_1281];
    float _1285 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1259);
    float _1287 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1263);
    float _1289 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1261);
    float _1291 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1297 = _1253 <= 1.0;
    bool _1299 = _1297 && _1265;
    float _1301 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1289);
    float _1303 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1291);
    float _1305 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1311 = _1257 >= 0.0;
    bool _1313 = _1311 && _1299;
    float _1315 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    float _1317 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1307);
    float _1319 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1321 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1323 = _1257 <= 1.0;
    bool _1325 = _1323 && _1313;
    float _1327 = _1315 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1317);
    float _1331 = -_1321;
    float _1333 = fma(_1331, _1319, 1.0);
    float _1335 = _965;
    if (!_1011)
    {
        float _1337 = floor(_794);
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1343 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1329);
    float _1345 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = _704 * _1033;
    float _1349 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1341);
    float _1351 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    float _1353 = 1.0 / _1343;
    if (_1325)
    {
        float _1355 = float(_760);
        _1103 = _1355;
    }
    float _1357 = _1103;
    float _1359 = fma(_224, _1025, _1347);
    float _1361 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1349);
    float _1363 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1351);
    float _1365 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1361);
    float _1367 = log2(_1333);
    float _1369 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1363);
    float _1371 = _1341;
    float _1373 = _1357;
    float _1375 = _1365;
    if (_1325)
    {
        float _1377 = rint(_1357);
        float _1379 = precise::max(_1377, 0.0);
        uint _1381 = uint(_1379);
        uint _1383 = clamp(_1381, 0u, 65535u);
        _1371 = as_type<float>(_1383);
    }
    float _1385 = _1371;
    float _1387 = fma(_226, _1275, _1359);
    float _1389 = _1275;
    if (!_1011)
    {
        float _1391 = -_1339;
        float _1393 = _794 + _1391;
        _1389 = _1393;
    }
    float _1395 = _1389;
    float _1397 = _1365 * _1353;
    float _1399 = _1369 * _1353;
    float _1401 = _1387 + _1283;
    float _1403 = _1251;
    if (!_1011)
    {
        float _1405 = rint(_1251);
        float _1407 = precise::max(_1405, 0.0);
        uint _1409 = uint(_1407);
        uint _1411 = clamp(_1409, 0u, 65535u);
        _1403 = as_type<float>(_1411);
    }
    float _1413 = _1403;
    float _1415 = _1367 * 0.693147182464599609375;
    float _1417 = _1401 * _1085;
    float _1419 = fma(_1397, 0.5, 0.5);
    float _1421 = fma(_1399, -0.5, 0.5);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1425 = _1415;
    if (!_1011)
    {
        float _1427 = -_1061;
        float _1429 = _772 + _1427;
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = _1085;
    if (_1325)
    {
        float3 _4767 = float3(_1253, _1257, float(as_type<int>(_1385)));
        float3 _4771 = select(_4767, float3(0.0), isnan(_4767));
        float _1435 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4771.xy, uint(rint(_4771.z)), _1417, level(0.0));
        _1433 = _1435;
    }
    float _1437 = _1433;
    float3 _4781 = float3(_1419, _1421, _1423);
    float _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4781, float3(0.0), isnan(_4781)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4781, float3(0.0), isnan(_4781)), level(0.0)).x;
    float3 _4790 = float3(_1419, _1421, _1423);
    float4 _1442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).xyzw;
    float _1444 = _1442.x;
    float _1446 = _1442.y;
    float _1448 = _1442.z;
    float _1450 = _1442.w;
    float _1452 = _953;
    if (!_1011)
    {
        float3 _4813 = float3(_1431, _1395, float(as_type<int>(_1413)));
        float3 _4815 = select(_4813, float3(0.0), isnan(_4813));
        float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4815.xy, uint(rint(_4815.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4815.xy, uint(rint(_4815.z)), level(0.0)).x;
        _1452 = _1454;
    }
    float _1456 = _1452;
    if (_1011)
    {
        _1373 = 1.0;
    }
    float _1458 = _1373;
    float _1460 = _1458;
    if (!_1011)
    {
        int _1462 = int(_1049) << 4;
        int _1464 = _1462 + 2048;
        uint _1466 = uint(int(uint(_1464) >> uint(2)));
        uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
        int _1470 = int(_1466) & 3;
        float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
        int _1474 = int(_1466) + 1;
        uint _1476 = uint(int(uint(_1474) >> uint(2)));
        int _1478 = _1474 & 3;
        float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
        int _1482 = _1464 + 8;
        uint _1484 = uint(int(uint(_1482) >> uint(2)));
        uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
        int _1488 = int(_1484) & 3;
        float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
        int _1492 = int(_1484) + 1;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        int _1496 = _1492 & 3;
        float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
        float _1500 = _704 * _1480;
        float _1502 = fma(_224, _1472, _1500);
        float _1504 = fma(_226, _1490, _1502);
        float _1506 = _1504 + _1498;
        float _1508 = precise::clamp(_1506, 0.0, 1.0);
        float _1510 = -_1508;
        float _1512 = _1510 + _1456;
        float _1514 = fma(_1512, 500.0, 1.5);
        float _1516 = exp2(_1514);
        float _1518 = 0.0 + _1516;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        _1057 = as_type<float>(_1464);
        _1460 = _1520;
    }
    float _1522 = _1057;
    float _1524 = _1460;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1528 = _1233 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1532 = _1235 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1536 = _1237 + _1534;
    float _1538 = _1528 * _1528;
    float _1540 = fma(_1532, _1532, _1538);
    float _1542 = fma(_1536, _1536, _1540);
    float _1544 = rsqrt(_1542);
    float _1546 = sqrt(_1542);
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1532 * _1548;
    float _1552 = _1536 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 + _1556;
    float _1560 = sqrt(_1558);
    bool _1562 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1560 + _1564;
    float _1568 = _1385;
    float _1570 = _1558;
    float _1572 = _1566;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1548;
    float _1580 = _1550;
    float _1582 = _1554;
    float _1584 = _1556;
    if (_1562)
    {
        float _1586 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1586;
    }
    float _1588 = _1568;
    if (_1562)
    {
        float _1590 = rsqrt(_1558);
        _1570 = _1590;
    }
    float _1592 = _1570;
    if (_1562)
    {
        float _1594 = _1566 * _1588;
        _1572 = _1594;
    }
    float _1596 = _1572;
    if (_1562)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _1574 = _1598;
    }
    float _1600 = _1574;
    float _1602 = _1253;
    if (_1562)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1588;
    if (_1562)
    {
        float _1616 = _1600 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = -_1548;
    float _1624 = -_1612;
    float _1626 = fma(_1528, _1622, _1624);
    float _1628 = _1626;
    if (_1562)
    {
        float _1630 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1576 = _1630;
    }
    float _1632 = _1576;
    float _1634 = _1608;
    float _1636 = _1632;
    if (_1562)
    {
        float _1638 = fma(_1608, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = _1640;
    if (_1562)
    {
        float _1644 = _1620 + (-1.0);
        _1636 = _1644;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (_1562)
    {
        float _1650 = _1592 * _1640;
        _1578 = _1650;
    }
    float _1652 = _1578;
    if (_1562)
    {
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1654;
    }
    float _1656 = _1642;
    if (_1562)
    {
        float _1658 = _1550 * _1652;
        _1580 = _1658;
    }
    float _1660 = _1580;
    if (!_1562)
    {
        _1648 = _1552;
    }
    float _1662 = _1648;
    float _1664 = _1662;
    if (_1562)
    {
        float _1666 = _1552 * _1652;
        _1664 = _1666;
    }
    float _1668 = _1664;
    if (_1562)
    {
        float _1670 = fma(_1626, _1620, _1656);
        _1628 = _1670;
    }
    float _1672 = _1628;
    if (_1562)
    {
        float _1674 = _1660 * _1660;
        _1582 = _1674;
    }
    float _1676 = _1582;
    if (_1562)
    {
        float _1678 = _1668 * _1668;
        _1584 = _1678;
    }
    float _1680 = _1584;
    float _1682 = fma(_1672, _1672, _1676);
    float _1684 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1686 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1684);
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = _1682 + _1680;
    float _1692 = -_1688;
    float _1694 = _1692 + 1.0;
    float _1696 = rsqrt(_1690);
    float _1698 = abs(_1694);
    float _1700 = log2(_1698);
    float _1702 = _1696 * _1660;
    float _1704 = _1696 * _1672;
    float _1706 = _1696 * _1668;
    float _1708 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = -_1708;
    float _1712 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1710);
    float _1714 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1716 = -_1706;
    float _1718 = fma(_1716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1712);
    float _1720 = exp2(_1714);
    float _1722 = fma(_1718, -0.5, 0.5);
    float _1724 = fma(_1718, 0.5, 0.5);
    float _1726 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1728 = sqrt(_1722);
    float _1730 = fma(_1724, _1726, -0.212114393711090087890625);
    float _1732 = _1704 + 1.0;
    float _1734 = fma(_1724, _1730, 1.570728778839111328125);
    float _1736 = -_1704;
    float _1738 = fma(_1720, _1732, _1736);
    float _1740 = fma(_1738, 0.5, 0.5);
    float _1742 = _1728 * 0.636619746685028076171875;
    float _1744 = -_1734;
    float _1746 = fma(_1742, _1744, 1.0);
    float2 _5265 = float2(_1746, _1740);
    float3 _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5265, float2(0.0), isnan(_5265)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5265, float2(0.0), isnan(_5265)), level(0.0)).xyz;
    float _1752 = _1750.x;
    float _1754 = _1750.y;
    float _1756 = _1750.z;
    float _1758 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1760 = in.m_71.y;
    float _1762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1764 = _662 != 0.0;
    bool _1766 = isnan(_662);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(0.0);
    bool _1772 = _1768 || _1770;
    float _1774 = _1758 * _254;
    float _1776 = in.m_63.w;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1780 = _1778 != 0;
    float _1782 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1786 = _1784 != 0;
    float _1788 = in.m_71.x;
    float _1790 = trunc(_1774);
    int _1792 = int(_1790);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1796 = _1794 != 0;
    float _1798 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1782);
    float _1800 = in.m_73.x;
    float _1802 = in.m_73.y;
    float _1804 = in.m_73.z;
    bool _1806 = _660 == 0.0;
    bool _1808 = !_1772;
    bool _1810 = _1806 && _1808;
    float _1812 = -_244;
    float _1814 = _1812 + 1.0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    float _1820 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1798);
    bool _1822 = _664 == 0.0;
    bool _1824 = _1822 && _1810;
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_75.x = _1235;
    out.m_75.y = _1233;
    out.m_75.z = _1237;
    float _1828 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    int _1830 = _1792 << 4;
    int _1832 = _1830 + 1712;
    float _1834 = -_1760;
    float _1836 = _1834 + 1.0;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1840 = _1776 > 0.5;
    uint _1842 = uint(int(uint(_1832) >> uint(2)));
    uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
    int _1846 = int(_1842) & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    int _1850 = int(_1842) + 1;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    int _1854 = _1850 & 3;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[int(_1852)][_1854];
    int _1858 = _1840 ? as_type<int>(_1836) : as_type<int>(_1760);
    bool _1860 = _264 > 0.5;
    float _1862 = _1818 ? as_type<float>(_1858) : _1760;
    int _1864 = _1832 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    float _1874 = _1760;
    bool _1876 = _1860;
    bool _1878 = _1818;
    float _1880 = _1788;
    float _1882 = _1776;
    if (_1780)
    {
        float _1884 = _1860 ? _1836 : _1760;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (_1786)
    {
        bool _1888 = _250 > 0.5;
        _1876 = _1888;
    }
    bool _1890 = _1876;
    if (_1796)
    {
        float _1892 = -_1788;
        float _1894 = _1892 + 1.0;
        _370 = as_type<int>(_1894);
    }
    int _1896 = _370;
    if (_1796)
    {
        bool _1898 = _254 > 0.5;
        _1878 = _1898;
    }
    bool _1900 = _1878;
    if (_1786)
    {
        float _1902 = -_1788;
        float _1904 = _1902 + 1.0;
        _372 = as_type<int>(_1904);
    }
    int _1906 = _372;
    float _1908 = 0.0;
    if (!_1796)
    {
        _1908 = _1788;
    }
    float _1910 = _1908;
    float _1912 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1914 = 0.0;
    float _1916 = _1910;
    if (_1824)
    {
        _1914 = _1800;
    }
    float _1918 = _1914;
    float _1920 = _1918;
    if (_1796)
    {
        float _1922 = _1900 ? as_type<float>(_1896) : _1788;
        _1916 = _1922;
    }
    float _1924 = _1916;
    if (_1786)
    {
        float _1926 = _1890 ? as_type<float>(_1906) : _1788;
        _1880 = _1926;
    }
    float _1928 = _1880;
    if (_1824)
    {
        _1882 = _1918;
    }
    float _1930 = _1882;
    float _1932 = _1930;
    if (!_1824)
    {
        _1920 = _1800;
    }
    float _1934 = _1920;
    float _1936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1938 = 0.0;
    if (_1824)
    {
        _1938 = _1802;
    }
    float _1940 = _1938;
    float _1942 = _1940;
    if (!_1824)
    {
        float _1944 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1934);
        _1932 = _1944;
    }
    float _1946 = _1932;
    float _1948 = 0.0;
    if (_1824)
    {
        _1948 = _1804;
    }
    float _1950 = _1948;
    float _1952 = abs(_694);
    float _1954 = log2(_1952);
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1958 = 0.0;
    float _1960 = _1950;
    if (_1824)
    {
        _1958 = _1950;
    }
    float _1962 = _1958;
    float _1964 = _1962;
    if (!_1824)
    {
        _1960 = _1804;
    }
    float _1966 = _1960;
    if (!_1824)
    {
        float _1968 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1966);
        _1964 = _1968;
    }
    float _1970 = _1964;
    bool _1972 = _694 <= 8000.0;
    bool _1974 = isnan(_694);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(8000.0);
    bool _1980 = _1976 || _1978;
    float _1982 = float(_1980);
    float _1984 = _1848 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1986 = _1856 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1988 = in.m_77.x;
    float _1990 = in.m_77.y;
    float _1992 = in.m_77.z;
    float _1994 = in.m_77.w;
    float _1996 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1998 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2000 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1984;
    if (_1824)
    {
        _2002 = _1940;
    }
    float _2004 = _2002;
    float _2006 = _2004;
    if (!_1824)
    {
        _1942 = _1802;
    }
    float _2008 = _1942;
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2012 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2014 = _1912 * _1936;
    float _2016 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1824)
    {
        float _2018 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2018;
    }
    float _2020 = _2006;
    float _2022 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_79.x = _2000;
    out.m_79.y = _1996;
    out.m_79.z = _2010;
    out.m_79.w = _1956;
    float _2024 = _2012 * _1826;
    float _2026 = _2016 * _1838;
    float _2028 = _2022 * _1762;
    float _2030 = _1990 * _1966;
    out.m_81.x = _2028;
    out.m_81.y = _2024;
    out.m_81.z = _2026;
    out.m_81.w = _2014;
    float _2032 = -_2030;
    float _2034 = fma(_1992, _2008, _2032);
    float _2036 = -_1990;
    float _2038 = _798 * _2036;
    float _2040 = _1992 * _1934;
    float _2042 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2044 = _1988 * _2008;
    float _2046 = fma(_806, _1988, _2038);
    float _2048 = -_2040;
    float _2050 = fma(_1988, _1966, _2048);
    float _2052 = -_2044;
    float _2054 = fma(_1990, _1934, _2052);
    float _2056 = _2034 * _1994;
    float _2058 = _2050 * _1994;
    float _2060 = exp2(_2042);
    float _2062 = _2054 * _1994;
    float _2064 = -_2020;
    float _2066 = _798 * _2064;
    float _2068 = -_2058;
    float _2070 = _798 * _2068;
    float _2072 = _804 * _1990;
    float _2074 = _804 * _2020;
    float _2076 = fma(_806, _1946, _2066);
    float _2078 = fma(_806, _2056, _2070);
    float _2080 = _804 * _2058;
    float _2082 = _808 * _1990;
    float _2084 = fma(_847, _1946, _2074);
    float _2086 = fma(_847, _1988, _2072);
    float _2088 = fma(_847, _2056, _2080);
    float _2090 = _808 * _2058;
    float _2092 = fma(_810, _1970, _2076);
    float _2094 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2096 = precise::clamp(_2094, 0.0, 1.0);
    float _2098 = fma(_841, _1988, _2082);
    float _2100 = fma(_841, _2056, _2090);
    float _2102 = fma(_845, _1992, _2086);
    float _2104 = fma(_810, _1992, _2046);
    float _2106 = fma(_853, _1992, _2098);
    float _2108 = fma(_845, _1970, _2084);
    float _2110 = fma(_2096, -2.0, 3.0);
    float _2112 = fma(_810, _2062, _2078);
    float _2114 = fma(_845, _2062, _2088);
    float _2116 = fma(_853, _2062, _2100);
    float _2118 = _2096 * _2096;
    float _2120 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2122 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2124 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2126 = _2118 * _2110;
    float _2128 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2120);
    float _2130 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2132 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2122);
    float _2134 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2136 = _808 * _2020;
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2124);
    float _2140 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2130);
    float _2142 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2128);
    float _2144 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2134);
    float _2146 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2132);
    float _2148 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2150 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2152 = fma(_841, _1946, _2136);
    float _2154 = _2108 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2156 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2140);
    float _2158 = fma(_2106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2138);
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2144);
    float _2162 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2148);
    float _2164 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2150);
    float _2166 = fma(_853, _1970, _2152);
    float _2168 = fma(_2092, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2154);
    float _2170 = -_2126;
    float _2172 = _2170 + 1.0;
    out.m_83.x = _2158;
    out.m_83.y = _2142;
    out.m_83.z = _2146;
    float _2174 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2168);
    float _2176 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2126);
    float _2180 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    float _2182 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2162);
    float _2184 = _1982 * _2178;
    float _2186 = exp2(_2176);
    float _2188 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2180);
    float _2190 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2164);
    float _2192 = _1828 + _1343;
    float _2194 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2196 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2188);
    float _2198 = _2192 * 0.5;
    float _2200 = _2192;
    if (!_1325)
    {
        _2200 = 1.0;
    }
    float _2202 = _2200;
    float _2204 = _1814 * _2194;
    float _2206 = precise::clamp(_2204, 0.0, 1.0);
    float _2208 = _2202;
    if (_1325)
    {
        bool _2210 = _1437 >= _1417;
        bool _2212 = isnan(_1437);
        bool _2214 = _2210 || _2212;
        bool _2216 = isnan(_1417);
        bool _2218 = _2214 || _2216;
        float _2220 = float(_2218);
        _2208 = _2220;
    }
    float _2222 = _2208;
    out.m_87.x = _2156;
    out.m_87.y = _2160;
    out.m_87.z = _2196;
    float _2224 = -_2206;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2228 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2230 = isnan(_1546);
    bool _2232 = _2228 || _2230;
    bool _2234 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2236 = _2232 || _2234;
    float _2238 = _2222 * _1524;
    float _2240 = -_2186;
    float _2242 = _2240 + 1.0;
    out.gl_Position.x = _1365;
    out.gl_Position.y = _1369;
    out.gl_Position.z = _1828;
    out.gl_Position.w = _1343;
    float _2244 = -_2238;
    float _2246 = fma(_2244, _2226, 1.0);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_89.z = _2198;
    out.m_89.w = _1343;
    float _2252 = _2248 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2254 = _2250 * _1439;
    float _2256 = -_2250;
    float _2258 = _2256 + 1.0;
    out.m_91.x = _2182;
    out.m_91.y = _2190;
    out.m_91.z = _2174;
    float _2260 = _2258;
    float _2262 = _2248;
    float _2264 = _2254;
    if (!_2236)
    {
        _1375 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2266 = _1375;
    float _2268 = _1450 * _2254;
    float _2270 = _1450 * _2258;
    out.m_93.x = _2252;
    float _2272 = _2268;
    float _2274 = _2266;
    float _2276 = _2266;
    if (!_2236)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2278 = _2260;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2236)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2284 = _2262;
    float _2286 = _1756 * _2254;
    float _2288 = fma(_1752, _2268, _1444);
    float _2290 = fma(_1754, _2268, _1446);
    float _2292 = _2286;
    float _2294 = _2284;
    float _2296 = _2284;
    if (!_2236)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2298 = _2264;
    float _2300 = fma(_1450, _2286, _1448);
    float _2302 = _2298;
    float _2304 = _2298;
    if (!_2236)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2306 = _2292;
    float _2308 = _2306;
    float _2310 = _2306;
    if (!_2236)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2312 = _2272;
    out.m_95.x = _2288;
    out.m_95.y = _2290;
    out.m_95.z = _2300;
    out.m_95.w = _2270;
    bool _2314 = !_2236;
    float _2316 = _2312;
    float _2318 = _2312;
    if (!_2314)
    {
        bool _2320 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2322 = isnan(_1546);
        bool _2324 = _2320 || _2322;
        bool _2326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2328 = _2324 || _2326;
        if (!_2328)
        {
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2332 = _1546 + _2330;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2336 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2334;
            float _2338 = 1.0 / _2336;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2360 = _2332 * _2338;
            float _2362 = precise::clamp(_2360, 0.0, 1.0);
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2368 = fma(_2362, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2370 = fma(_2362, _2366, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2372 = fma(_2362, _2346, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2374 = fma(_2362, _2350, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2376 = fma(_2362, _2354, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2378 = fma(_2362, _2358, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2282 = _2370;
            _2304 = _2376;
            _2276 = _2368;
            _2310 = _2374;
            _2296 = _2372;
            _2318 = _2378;
            _2380 = true;
        }
        else
        {
            bool _2382 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2384 = isnan(_1546);
            bool _2386 = _2382 || _2384;
            bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2390 = _2386 || _2388;
            if (!_2390)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2392 = _2274;
            _2276 = _2392;
            if (!_2390)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2394 = _2280;
            _2282 = _2394;
            if (!_2390)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2396 = _2294;
            _2296 = _2396;
            if (!_2390)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2398 = _2308;
            _2310 = _2398;
            if (!_2390)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2400 = _2302;
            _2304 = _2400;
            if (!_2390)
            {
                _2316 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2402 = _2316;
            bool _2404 = !_2390;
            _2318 = _2402;
            if (!_2404)
            {
                bool _2406 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2408 = isnan(_1546);
                bool _2410 = _2406 || _2408;
                bool _2412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2414 = _2410 || _2412;
                if (!_2414)
                {
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2418 = _1546 + _2416;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2422 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2420;
                    float _2424 = 1.0 / _2422;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2446 = _2418 * _2424;
                    float _2448 = precise::clamp(_2446, 0.0, 1.0);
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2454 = fma(_2448, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2456 = fma(_2448, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2458 = fma(_2448, _2432, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2460 = fma(_2448, _2436, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2462 = fma(_2448, _2440, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2464 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2282 = _2456;
                    _2304 = _2462;
                    _2276 = _2454;
                    _2310 = _2460;
                    _2296 = _2458;
                    _2318 = _2464;
                    _2380 = true;
                }
                else
                {
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2318 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2380 = false;
    float _2466 = _2282;
    float _2468 = _2304;
    float _2470 = _2276;
    float _2472 = _2310;
    float _2474 = _2296;
    float _2476 = _2318;
    float _2478 = fma(_2190, -0.5, 0.5);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = -_2466;
    float _2484 = _2482 + _2468;
    float _2486 = -_2470;
    float _2488 = _2486 + _2472;
    float _2490 = -_2474;
    float _2492 = _2490 + _2476;
    bool _2494 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2496 = fma(_2480, _2484, _2466);
    float _2498 = fma(_2480, _2488, _2470);
    float _2500 = fma(_2480, _2492, _2474);
    float _2502 = _2496 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2504 = fma(_2498, 0.298911988735198974609375, _2502);
    float _2506 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2508 = fma(_2500, 0.114477999508380889892578125, _2504);
    out.m_59.x = _2506;
    float _2510 = -_2508;
    float _2512 = _2498 + _2510;
    float _2514 = -_2508;
    float _2516 = _2496 + _2514;
    float _2518 = -_2508;
    float _2520 = _2500 + _2518;
    float _2522 = fma(_2512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    float _2524 = fma(_2516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    float _2526 = fma(_2520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2508);
    out.m_99.x = _2522;
    out.m_99.y = _2524;
    out.m_99.z = _2526;
    if (!_2494)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2528 = -_1233;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2532 = -_1235;
    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2536 = -_1237;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2540 = _2530 * _2530;
    float _2542 = fma(_2534, _2534, _2540);
    float _2544 = fma(_2538, _2538, _2542);
    float _2546 = sqrt(_2544);
    float _2548 = rsqrt(_2544);
    float _2550 = -_2546;
    float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = _2534 * _2548;
    float _2560 = _2530 * _2548;
    float _2562 = abs(_2556);
    float _2564 = log2(_2562);
    float _2566 = _2538 * _2548;
    float _2568 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2570 = _2190 * _2560;
    float _2572 = -_2560;
    float _2574 = -_2568;
    float _2576 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2574);
    float _2578 = fma(_2182, _2558, _2570);
    float _2580 = -_2566;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2576);
    float _2584 = fma(_2174, _2566, _2578);
    float _2586 = precise::clamp(_2584, 0.0, 1.0);
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2590 = _2582 + _2588;
    float _2592 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2594 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = exp2(_2592);
    float _2600 = _2598 * _2596;
    float _2602 = _2586 * _2600;
    float _2604 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2606 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2608 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2604;
    out.m_97.y = _2606;
    out.m_97.z = _2608;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

