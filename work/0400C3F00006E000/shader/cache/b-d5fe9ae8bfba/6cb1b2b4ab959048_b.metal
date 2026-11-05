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
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_89 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_97 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_103 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_107 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
    float4 m_79 [[attribute(11)]];
    float4 m_81 [[attribute(13)]];
    float4 m_73 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2834 = false;
    bool _342 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_56.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3199 = as_type<float>(_142);
        out.gl_Position.z = _3199;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_180);
        out.gl_Position.z = _3269;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_63.y;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_63.z;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _182 * _182;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = _186 * _186;
    float _206 = in.m_65.x;
    float _208 = fma(_188, _188, _196);
    float _210 = in.m_63.x;
    float _212 = fma(_190, _190, _204);
    float _214 = in.m_67.x;
    float _216 = fma(_192, _192, _208);
    float _218 = fma(_194, _194, _212);
    float _220 = sqrt(_216);
    float _222 = sqrt(_218);
    bool _224 = _220 > 0.0;
    float _226 = _182 * _200;
    float _228 = fma(_198, _210, _226);
    bool _230 = _222 > 0.0;
    float _232 = _188 * _200;
    float _234 = _192 * _200;
    float _236 = fma(_186, _202, _228);
    float _238 = 0.0;
    if (_224)
    {
        float _240 = rsqrt(_216);
        _238 = _240;
    }
    float _242 = _238;
    float _244 = fma(_198, _206, _232);
    float _246 = fma(_198, _214, _234);
    float _248 = 0.0;
    if (!_224)
    {
        _248 = 0.0;
    }
    float _250 = _248;
    float _252 = fma(_190, _202, _244);
    float _254 = 0.0;
    float _256 = _250;
    if (!_224)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = fma(_194, _202, _246);
    float _262 = _218;
    float _264 = _258;
    if (_230)
    {
        float _266 = rsqrt(_218);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    float _272 = 0.0;
    if (!_230)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _274 = _270;
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _274;
    float _282 = _276;
    if (!_224)
    {
        _278 = 0.0;
    }
    float _284 = _278;
    float _286 = 0.0;
    float _288 = _284;
    if (!_230)
    {
        _286 = 0.0;
    }
    float _290 = _286;
    float _292 = _290;
    if (_224)
    {
        float _294 = _242 * _188;
        _256 = _294;
    }
    float _296 = _256;
    if (_224)
    {
        float _298 = _242 * _182;
        _264 = _298;
    }
    float _300 = _264;
    float _302 = _300;
    if (_224)
    {
        float _304 = _242 * _192;
        _288 = _304;
    }
    float _306 = _288;
    float _308 = _306;
    if (_230)
    {
        float _310 = _268 * _190;
        _292 = _310;
    }
    float _312 = _292;
    if (_230)
    {
        float _314 = _268 * _186;
        _280 = _314;
    }
    float _316 = _280;
    if (_230)
    {
        float _318 = _268 * _194;
        _282 = _318;
    }
    float _320 = _282;
    bool _322 = !_184;
    float _340;
    if (!_322)
    {
        float _324 = in.m_71.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_126);
        float _346 = 1.0 / _344;
        float _348 = _160 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = in.m_56.x;
    float _354 = in.m_56.y;
    float _356 = in.m_56.z;
    float _358 = in.m_65.w;
    float _360 = in.m_67.w;
    float _362 = _188 * _354;
    float _364 = _192 * _354;
    float _366 = fma(_206, _352, _362);
    float _368 = fma(_214, _352, _364);
    float _370 = fma(_190, _356, _366);
    float _372 = fma(_194, _356, _368);
    float _374 = _370 + _358;
    float _376 = _372 + _360;
    float _378 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _382 = floor(_378);
    float _384 = floor(_380);
    float _386 = -_382;
    float _388 = _378 + _386;
    float _390 = -_384;
    float _392 = _380 + _390;
    float2 _3574 = float2(_388, _392);
    float _394 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3574, float2(0.0), isnan(_3574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3574, float2(0.0), isnan(_3574)), level(0.0)).x;
    float _396 = _182 * _354;
    float _398 = in.m_71.y;
    float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _402 = log2(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = in.m_71.z;
    float _410 = fma(_210, _352, _396);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = in.m_73.x;
    float _418 = in.m_73.y;
    float _420 = fma(_186, _356, _410);
    float _422 = 1.0 / _406;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _426 = _350 + _424;
    float _428 = in.m_75.x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[194].w * 0.01745329238474369049072265625;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _350 + _436;
    float _440 = _402 * _160;
    float _442 = in.m_71.x;
    float _444 = 1.0 / _432;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _456 = _454 != 0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _350 + _458;
    float _462 = in.m_63.w;
    bool _464 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _466 = isnan(_350);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _426 * _422;
    float _478 = _398 + _408;
    float _480 = exp2(_440);
    bool _482 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _484 = isnan(_350);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = _478 + (-1.0);
    float _496 = _434 * _418;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _500 = 1.0 + _498;
    float _502 = _408 * 2.0;
    bool _504 = _428 > 0.0;
    float _506 = 1.0 / _414;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _510 = _398 * 2.0;
    bool _512 = _428 >= 0.0;
    bool _514 = isnan(_428);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = _438 * _444;
    float _524 = fma(_160, 0.85000002384185791015625, _496);
    float _526 = 1.0 / _500;
    float _528 = _442 + _408;
    int _530 = _520 ? 0 : 1;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    bool _536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = _528 + (-1.0);
    int _548 = ~_530;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    float _558 = floor(_510);
    float _560 = _442 * 2.0;
    int _562 = _552;
    if (!_504)
    {
        int _564 = ~_530;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = _442 + _398;
    bool _572 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = _460 * _506;
    float _584 = _570 + (-1.0);
    float _586 = floor(_502);
    float _588 = _580 ? _534 : 0.0;
    float _590 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _592 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_544)
    {
        float _598 = _588 * _526;
        _162 = _598;
    }
    float _600 = _162;
    float _602 = floor(_560);
    bool _604 = _558 > 0.0;
    float _606 = _236 * _236;
    bool _608 = _558 >= 0.0;
    bool _610 = isnan(_558);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _626 = !_452;
    int _628 = _626 ? 0 : 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _630;
    bool _634 = _586 >= 0.0;
    bool _636 = isnan(_586);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_252, _252, _606);
    bool _646 = !_448;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(_556, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _652 = !_456;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_260, _260, _644);
    float _658 = fma(_632, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _660 = _602 >= 0.0;
    bool _662 = isnan(_602);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = fma(_620, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = rsqrt(_656);
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _684 = _682 != 0;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _690 = fma(_596, _522, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _692 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _694 = isnan(_350);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _524 * 0.15915493667125701904296875;
    float _706 = fma(_688, _522, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _708 = fma(_624, _522, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _710 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _712 = isnan(_350);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_702;
    float _724 = _722 + 1.0;
    float _726 = _420 + _462;
    int _728 = _642 ? 0 : 1;
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = _720 * _724;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _740;
    float _744 = _492 * _732;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _746;
    float _750 = -_492;
    float _752 = _750 + 1.0;
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _756 = fma(_738, _582, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _758 = fma(_742, _582, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _760 = _474 * _752;
    float _762 = -_474;
    float _764 = _762 + 1.0;
    float _766 = fma(_748, _582, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _768 = _668 ? 0 : 1;
    float _770 = _658 * _760;
    float _772 = _650 * _760;
    float _774 = _670 * _760;
    bool _776 = _602 > 0.0;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].y, _770);
    float _780 = float(_568);
    float _782 = _704 * 6.283185482025146484375;
    float _784 = sin(_782);
    bool _786 = _586 > 0.0;
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].x, _772);
    float _790 = _600 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _792 = fma(_706, _744, _778);
    float _794 = _236 * _672;
    float _796 = fma(_690, _744, _788);
    float _798 = _790 * _754;
    bool _800 = !_676;
    int _802 = _800 ? 0 : 1;
    float _804 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].z, _774);
    bool _806 = !_680;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_756, _734, _796);
    bool _812 = _416 >= 0.00999999977648258209228515625;
    bool _814 = isnan(_416);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.00999999977648258209228515625);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = _252 * _672;
    int _826 = abs(_802);
    float _828 = fma(_708, _744, _804);
    int _830 = ~_768;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = _794 * _300;
    int _838 = _834;
    if (!_776)
    {
        int _840 = ~_768;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_758, _734, _792);
    int _848 = abs(_808);
    float _850 = _780 * _822;
    int _852 = ~_728;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = fma(_824, _296, _836);
    int _860 = _856;
    if (!_786)
    {
        int _862 = ~_728;
        int _864 = _862 + 1;
        _860 = _864;
    }
    int _866 = _860;
    float _868 = _784 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    int _870 = _616 ? 0 : 1;
    float _872 = _260 * _672;
    bool _874 = !_684;
    int _876 = _874 ? 0 : 1;
    float _878 = _850 * _868;
    float _880 = float(_844);
    float _882 = _726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _884 = float(_848);
    float _886 = fma(_872, _306, _858);
    float _888 = float(_866);
    float _890 = fma(_766, _734, _828);
    int _892 = ~_870;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _884 * _880;
    int _900 = _896;
    if (!_604)
    {
        int _902 = ~_870;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = _726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _910 = abs(_876);
    float _912 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[11].x, _882);
    float _914 = float(_906);
    float _916 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _918 = float(_910);
    float _920 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[11].z, _912);
    float _922 = float(_826);
    float _924 = in.m_77.x;
    float _926 = in.m_77.y;
    float _928 = in.m_77.z;
    float _930 = abs(_886);
    bool _932 = _930 > 0.99989998340606689453125;
    float _934 = _918 * _914;
    float _936 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[10].z, _916);
    float _938 = _922 * _888;
    float _940 = _920 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _942 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _798);
    float _944 = _936 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _946 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].x, _810);
    float _948 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].y, _846);
    float _950 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].z, _890);
    float _952 = _944 + _940;
    float _954 = _942 + 0.25;
    float _956 = floor(_942);
    float _958 = _936;
    if (_932)
    {
        float _960 = fma(_316, 0.001000000047497451305389404296875, _300);
        _302 = _960;
    }
    float _962 = _302;
    float _964 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (!_932)
    {
        _958 = _296;
    }
    float _966 = _958;
    float _968 = _966;
    if (_932)
    {
        float _970 = fma(_312, 0.001000000047497451305389404296875, _296);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = _898 * (-2.0);
    float _976 = _726 + _964;
    float _978 = _934 * (-2.0);
    float _980 = floor(_954);
    float _982 = fma(_508, _974, _508);
    float _984 = _878 * 0.01745329238474369049072265625;
    float _986 = fma(_978, _928, _928);
    float _988 = _408 + (-0.5);
    float _990 = fma(_974, _926, _926);
    float _992 = _398 + (-0.5);
    if (_932)
    {
        float _994 = fma(_320, 0.001000000047497451305389404296875, _306);
        _308 = _994;
    }
    float _996 = _308;
    float _998 = -_956;
    float _1000 = _942 + _998;
    float _1002 = _942 * 6.283185482025146484375;
    float _1004 = _984 * 0.15915493667125701904296875;
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _986);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    float _1010 = _1002 * 0.15915493667125701904296875;
    int _1012 = abs(_628);
    float _1014 = 1.0 / _940;
    float _1016 = -_980;
    float _1018 = _954 + _1016;
    float _1020 = _976 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1022 = _1000 >= 0.5;
    bool _1024 = isnan(_1000);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.5);
    bool _1030 = _1026 || _1028;
    float _1032 = _976 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1034 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1020);
    int _1036 = abs(_648);
    float _1038 = _1010 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = float(_1012);
    float _1044 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1034);
    int _1046 = abs(_654);
    float _1048 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1032);
    float _1050 = fma(_982, _600, _1008);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1054 = !_1030;
    float _1056 = _1054 ? 0.5 : (-0.5);
    float _1058 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1048);
    bool _1060 = _1018 > 0.5;
    float _1062 = _952 * _1014;
    float _1064 = _1062 * 0.5;
    float _1066 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1068 = _1066 * 2.0;
    float _1070 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1072 = fma(_590, _978, _590);
    float _1074 = _1042 * _1068;
    float _1076 = float(_1036);
    float _1078 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1080 = _1004 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = _938 * (-2.0);
    float _1086 = -_996;
    float _1088 = _794 * _1086;
    float _1090 = _1018;
    int _1092 = as_type<int>(_1014);
    int _1094 = as_type<int>(_1058);
    float _1096 = _1070;
    if (_1060)
    {
        float _1098 = -_1018;
        float _1100 = _1098 + 1.0;
        _1090 = _1100;
    }
    float _1102 = _1090;
    float _1104 = fma(_1076, _1078, _1074);
    float _1106 = -_962;
    float _1108 = _824 * _1106;
    float _1110 = in.m_79.x;
    float _1112 = in.m_79.y;
    float _1114 = in.m_79.z;
    float _1116 = fma(_1102, 4.0, -1.0);
    float _1118 = float(_1046);
    float _1120 = _1004 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -_962;
    float _1126 = -_1088;
    float _1128 = fma(_872, _1124, _1126);
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1132 = fma(_592, _1084, _592);
    float _1134 = fma(_1072, _600, _1006);
    float _1136 = fma(_1118, _1130, _1104);
    float _1138 = _442 + (-0.5);
    float _1140 = trunc(_1052);
    int _1142 = int(_1140);
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1146 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1144);
    float _1148 = fma(_1136, 3.1415927410125732421875, _924);
    float _1150 = -_972;
    float _1152 = _872 * _1150;
    float _1154 = _1050 * 0.15915493667125701904296875;
    float _1156 = -_972;
    float _1158 = -_1108;
    float _1160 = fma(_794, _1156, _1158);
    float _1162 = fma(_1148, _1084, _1148);
    float _1164 = -_996;
    float _1166 = -_1152;
    float _1168 = fma(_824, _1164, _1166);
    float _1170 = trunc(_1070);
    int _1172 = int(_1170);
    float _1174 = in.m_75.z;
    float _1176 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1162);
    float _1178 = _1168 * _1168;
    float _1180 = _1134 * 0.15915493667125701904296875;
    float _1182 = in.m_75.y;
    float _1184 = _948 * _1112;
    float _1186 = fma(_1128, _1128, _1178);
    float _1188 = 1.0 / _1146;
    int _1190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1192 = _1142 + _1190;
    int _1194 = _1192 + 1;
    float _1196 = _946 * _1110;
    float _1198 = fma(_1132, _600, _1176);
    float _1200 = _1082 * _428;
    float _1202 = _1122 * _428;
    bool _1204 = _1194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1206 = _1198 * 0.15915493667125701904296875;
    int _1208 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1210 = _1172 + _1208;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1160, _1160, _1186);
    float _1216 = _1154 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _950 * _1114;
    int _1222 = _1194 | _1212;
    float _1224 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1226 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1232 = _1188 * _1230;
    bool _1234 = _1222 < 0;
    bool _1236 = _1234 || _1204;
    float _1238 = _1154 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = -_1200;
    float _1244 = fma(_1122, _1174, _1242);
    float _1246 = fma(_1082, _1174, _1202);
    bool _1248 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1182);
    bool _1252 = _1212 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1254 = _1252 || _1236;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1246);
    bool _1258 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1260 = _1180 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    float _1264 = _1224 * _1250;
    bool _1266 = !_1248;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = _1226 * _1256;
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1244);
    float _1274 = _1206 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    int _1278 = 2;
    if (!_1248)
    {
        _1278 = 1;
    }
    int _1280 = _1278;
    int _1282 = _1280;
    if (!_1254)
    {
        int _1284 = _1212 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1286 = _1284 + _1194;
        _1092 = _1286;
    }
    int _1288 = _1092;
    float _1290 = _1228 * _1272;
    if (!_1258)
    {
        _1282 = _1268;
    }
    int _1292 = _1282;
    bool _1294 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1302 = _1298 || _1300;
    float _1304 = _1206 * 6.283185482025146484375;
    float _1306 = cos(_1304);
    int _1308 = _1292 << 6;
    float _1310 = _1240 * _1262;
    float _1312 = _1218 * _1262;
    float _1314 = as_type<float>(_1292);
    if (!_1254)
    {
        int _1316 = _1288 << 2;
        _1094 = _1316;
    }
    int _1318 = _1094;
    int _1320 = _1308 + 96;
    uint _1323 = uint(int(uint(_1320) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.vp_c15)._m0[int(_1325)][_1327];
    int _1331 = int(_1323) + 1;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    int _1335 = _1331 & 3;
    float _1337 = (*spvDescriptorSet0.vp_c15)._m0[int(_1333)][_1335];
    float _1339 = rsqrt(_1214);
    float _1341 = _1276 * _1262;
    float _1343 = _1276 * _1240;
    float _1345 = _1276 * _1218;
    int _1347 = _1318;
    if (!_1254)
    {
        int _1349 = 12 & _1318;
        _1347 = _1349;
    }
    int _1351 = _1347;
    float _1353 = _1180 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = _1306 * _1262;
    float _1359 = _1306 * _1240;
    float _1361 = _1306 * _1218;
    float _1363 = _1357 * _824;
    float _1365 = _1357 * _872;
    float _1367 = _1357 * _794;
    float _1369 = _1128 * _1339;
    int _1371 = _1308 + 48;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c15)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    float _1389 = _1160 * _1339;
    float _1391 = _1168 * _1339;
    float _1393 = fma(_1355, _1359, _1345);
    float _1395 = -_1343;
    float _1397 = fma(_1355, _1361, _1395);
    float _1399 = fma(_1355, _1345, _1359);
    float _1401 = -_1355;
    float _1403 = fma(_1401, _1369, _1363);
    float _1405 = -_1361;
    float _1407 = fma(_1355, _1343, _1405);
    float _1409 = _794 * _1389;
    float _1411 = _1393 * _824;
    float _1413 = _824 * _1391;
    int _1415 = _1308 + 104;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.vp_c15)._m0[int(_1419)][_1421];
    int _1425 = int(_1417) + 1;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    int _1429 = _1425 & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    float _1433 = _1397 * _824;
    float _1435 = -_1409;
    float _1437 = fma(_872, _1391, _1435);
    float _1439 = fma(_1310, _1369, _1411);
    float _1441 = -_1413;
    float _1443 = fma(_794, _1369, _1441);
    float _1445 = -_1355;
    float _1447 = fma(_1445, _1389, _1365);
    float _1449 = _1393 * _872;
    float _1451 = _1397 * _872;
    float _1453 = fma(_1312, _1369, _1433);
    float _1455 = fma(_1407, _1437, _1439);
    float _1457 = fma(_1310, _1389, _1449);
    float _1459 = fma(_1312, _1389, _1451);
    float _1461 = fma(_1341, _1443, _1447);
    float _1463 = fma(_1341, _1437, _1403);
    float _1465 = fma(_1399, _1437, _1453);
    float _1467 = fma(_1407, _1443, _1457);
    int _1469 = _1308 + 64;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
    float _1487 = fma(_1399, _1443, _1459);
    float _1489 = _1264 * _1461;
    float _1491 = _1264 * _1463;
    int _1493 = as_type<int>(_1459);
    float _1495 = as_type<float>(_1351);
    if (!_1254)
    {
        uint _1497 = uint(int(uint(_1288) >> uint(2)));
        _1493 = int(_1497);
    }
    int _1499 = _1493;
    float _1501 = _976 * _1337;
    float _1503 = fma(_1270, _1467, _1489);
    float _1505 = fma(_1270, _1455, _1491);
    int _1507 = _1308 + 56;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
    int _1513 = int(_1509) & 3;
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
    int _1517 = int(_1509) + 1;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    int _1521 = _1517 & 3;
    float _1523 = (*spvDescriptorSet0.vp_c15)._m0[int(_1519)][_1521];
    if (!_1254)
    {
        int _1525 = _1499 << 4;
        int _1527 = _1525 + _1351;
        _1495 = as_type<float>(_1527);
    }
    float _1529 = _1495;
    float _1531 = fma(_1290, _1487, _1503);
    float _1533 = fma(_1290, _1465, _1505);
    float _1535 = _872 * _1369;
    float _1537 = fma(_374, _1329, _1501);
    float _1539 = _376 + _1531;
    float _1541 = _374 + _1533;
    int _1543 = _1308 + 72;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    uint _1547 = uint(int(uint(int(_1545)) >> uint(2)));
    int _1549 = int(_1545) & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = int(_1545) + 1;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    int _1557 = _1553 & 3;
    float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
    float _1561 = _976 * _1387;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1565 = _1539 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1569 = _1541 + _1567;
    float _1571 = -_1535;
    float _1573 = fma(_824, _1389, _1571);
    float _1575 = _1393 * _794;
    float _1577 = _1565 * _1565;
    float _1579 = -_1355;
    float _1581 = fma(_1579, _1391, _1367);
    int _1583 = _1308 + 80;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.vp_c15)._m0[int(_1587)][_1589];
    int _1593 = int(_1585) + 1;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    int _1597 = _1593 & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    float _1601 = _1397 * _794;
    float _1603 = fma(_1569, _1569, _1577);
    float _1605 = fma(_1310, _1391, _1575);
    float _1607 = fma(_1341, _1573, _1581);
    float _1609 = fma(_1312, _1391, _1601);
    float _1611 = sqrt(_1603);
    float _1613 = fma(_1407, _1573, _1605);
    int _1615 = _1308 + 88;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = fma(_376, _1423, _1537);
    float _1635 = _1264 * _1607;
    float _1637 = fma(_374, _1379, _1561);
    float _1639 = fma(_1399, _1573, _1609);
    float _1641 = _1633 + _1431;
    float _1643 = fma(_1270, _1613, _1635);
    float _1645 = _1561;
    float _1647 = _1539;
    if (!_1254)
    {
        float _1649 = floor(_1052);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = _1529;
    if (!_1254)
    {
        int _1655 = as_type<int>(_1529) + 400;
        uint _1657 = uint(int(uint(_1655) >> uint(2)));
        uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
        int _1661 = int(_1657) & 3;
        float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
        _1653 = _1663;
    }
    float _1665 = _1653;
    float _1667 = fma(_1290, _1639, _1643);
    bool _1669 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1671 = _1633;
    float _1673 = _1667;
    if (!_1254)
    {
        float _1675 = floor(_1070);
        _1671 = _1675;
    }
    float _1677 = _1671;
    float _1679 = _976 * _1485;
    float _1681 = _726 + _1667;
    float _1683 = fma(_374, _1477, _1679);
    float _1685 = 1.0 / _1641;
    float _1687 = fma(_376, _1515, _1637);
    float _1689 = _1683;
    float _1691 = _1679;
    float _1693 = _1651;
    if (!_1669)
    {
        _1673 = _1539;
    }
    float _1695 = _1673;
    float _1697 = fma(_376, _1551, _1683);
    float _1699 = _1687 + _1523;
    float _1701 = _1697;
    float _1703 = _1695;
    if (!_1669)
    {
        _1689 = _1681;
    }
    float _1705 = _1689;
    float _1707 = _1697 + _1559;
    float _1709 = _1705;
    if (!_1669)
    {
        _1701 = _1541;
    }
    float _1711 = _1701;
    bool _1713 = !_1669;
    float _1715 = _1711;
    if (!_1713)
    {
        float _1717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1721 = _1611 + _1719;
        float _1723 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1725 = rsqrt(_1603);
        float _1727 = _1721 * _1717;
        float _1729 = _1727 * 0.15915493667125701904296875;
        float _1731 = _1729 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1729 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        float _1739 = _1733 + (-1.0);
        float _1741 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1743 = fma(_1737, _1723, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1745 = fma(_1681, _1733, _1741);
        float _1747 = _1725 * _1743;
        float _1749 = fma(_1569, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1751 = fma(_1565, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1709 = _1745;
        _1715 = _1749;
        _1703 = _1751;
    }
    float _1753 = _1709;
    float _1755 = _1715;
    float _1757 = _1703;
    float _1759 = _1753;
    float _1761 = _1755;
    float _1763 = _1757;
    if (!_1302)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1767 = _726 + _1765;
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1771 = _374 + _1769;
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1775 = -_726;
        float _1777 = _1775 + _1753;
        float _1779 = _1767 * _1767;
        float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1783 = _376 + _1781;
        float _1785 = -_374;
        float _1787 = _1785 + _1755;
        float _1789 = -_376;
        float _1791 = _1789 + _1757;
        float _1793 = fma(_1771, _1771, _1779);
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1797 = fma(_1783, _1783, _1793);
        float _1799 = sqrt(_1797);
        float _1801 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1803 = precise::min(_1799, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1805 = _1803 * _1795;
        float _1807 = _1801 * _1805;
        float _1809 = fma(_1777, _1807, _726);
        float _1811 = fma(_1787, _1807, _374);
        float _1813 = fma(_1791, _1807, _376);
        _1759 = _1809;
        _1761 = _1811;
        _1763 = _1813;
        _1691 = _1777;
    }
    float _1815 = _1759;
    float _1817 = _1761;
    float _1819 = _1763;
    float _1821 = _1691;
    float _1823 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1699 * _1685;
    float _1829 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1831 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1823);
    float _1833 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1825);
    float _1835 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1837 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1829);
    float _1839 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1831);
    bool _1841 = _1827 >= 0.0;
    float _1843 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1845 = _1707 * _1685;
    float _1847 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1849 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    bool _1851 = _1827 <= 1.0;
    bool _1853 = _1851 && _1841;
    float _1855 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1835);
    float _1857 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1863 = _1845 >= 0.0;
    bool _1865 = _1863 && _1853;
    float _1867 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    float _1869 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1871 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1873 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1875 = _1821;
    if (!_1254)
    {
        float _1877 = rint(_1665);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        uint _1883 = clamp(_1881, 0u, 65535u);
        _1875 = as_type<float>(_1883);
    }
    float _1885 = _1875;
    bool _1887 = _1845 <= 1.0;
    bool _1889 = _1887 && _1865;
    float _1891 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1869);
    float _1893 = -_1873;
    float _1895 = fma(_1893, _1871, 1.0);
    float _1897 = _976 * _1599;
    float _1899 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1903 = _1897;
    if (!_1254)
    {
        float _1905 = -_1651;
        float _1907 = _1052 + _1905;
        _1693 = _1907;
    }
    float _1909 = _1693;
    float _1911 = fma(_374, _1591, _1897);
    float _1913 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1915 = log2(_1895);
    float _1917 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1901);
    float _1921 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1891);
    if (_1889)
    {
        float _1923 = float(_1292);
        _1314 = _1923;
    }
    float _1925 = _1314;
    float _1927 = fma(_376, _1623, _1911);
    float _1929 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1917);
    float _1931 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1919);
    float _1933 = 1.0 / _1921;
    float _1935 = _1927 + _1631;
    float _1937 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1929);
    float _1939 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1931);
    float _1941 = _1925;
    float _1943 = _1937;
    if (!_1254)
    {
        float _1945 = -_1677;
        float _1947 = _1070 + _1945;
        _1903 = _1947;
    }
    float _1949 = _1903;
    float _1951 = _1935 * _1685;
    float _1953 = _1901;
    float _1955 = _1949;
    if (_1889)
    {
        float _1957 = rint(_1925);
        float _1959 = precise::max(_1957, 0.0);
        uint _1961 = uint(_1959);
        uint _1963 = clamp(_1961, 0u, 65535u);
        _1953 = as_type<float>(_1963);
    }
    float _1965 = _1953;
    float _1967 = _1915 * 0.693147182464599609375;
    float _1969 = _1937 * _1933;
    float _1971 = _1939 * _1933;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1975 = fma(_1969, 0.5, 0.5);
    float _1977 = fma(_1971, -0.5, 0.5);
    float _1979 = _1885;
    float _1981 = _1933;
    if (!_1254)
    {
        float3 _6052 = float3(_1909, _1949, float(as_type<int>(_1885)));
        float3 _6056 = select(_6052, float3(0.0), isnan(_6052));
        float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6056.xy, uint(rint(_6056.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6056.xy, uint(rint(_6056.z)), level(0.0)).x;
        _1979 = _1983;
    }
    float _1985 = _1979;
    float _1987 = _1845;
    if (_1889)
    {
        float3 _6071 = float3(_1827, _1845, float(as_type<int>(_1965)));
        float3 _6073 = select(_6071, float3(0.0), isnan(_6071));
        float _1989 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6073.xy, uint(rint(_6073.z)), _1951, level(0.0));
        _1987 = _1989;
    }
    float _1991 = _1987;
    float3 _6083 = float3(_1975, _1977, _1973);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6083, float3(0.0), isnan(_6083)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6083, float3(0.0), isnan(_6083)), level(0.0)).x;
    float3 _6092 = float3(_1975, _1977, _1973);
    float4 _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6092, float3(0.0), isnan(_6092)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6092, float3(0.0), isnan(_6092)), level(0.0)).xyzw;
    float _1998 = _1996.x;
    float _2000 = _1996.y;
    float _2002 = _1996.z;
    float _2004 = _1996.w;
    bool _2006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2008 = isnan(0.5);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2014 = _2010 || _2012;
    if (_1254)
    {
        _1981 = 1.0;
    }
    float _2016 = _1981;
    float _2018 = _2016;
    if (_2014)
    {
        _1096 = 1.0;
    }
    float _2020 = _1096;
    float _2022 = _2020;
    if (_2014)
    {
        _1941 = 1.0;
    }
    float _2024 = _1941;
    float _2026 = _2024;
    float _2028 = _1991;
    if (!_2014)
    {
        float _2030 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2036 = _2032 * 6.283185482025146484375;
        float _2038 = cos(_2036);
        float _2040 = _2034 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2038;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = fma(_1232, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _1955 = _2040;
        _2026 = _2076;
    }
    float _2078 = _1955;
    float _2080 = _2026;
    float _2082 = _2078;
    if (!_2014)
    {
        float _2084 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2090 = _2086 * 6.283185482025146484375;
        float _2092 = cos(_2090);
        float _2094 = _2088 * 0.15915493667125701904296875;
        float _2096 = _2086 * 6.283185482025146484375;
        float _2098 = sin(_2096);
        float _2100 = 1.0 / _2092;
        float _2102 = _2094 * 6.283185482025146484375;
        float _2104 = cos(_2102);
        float _2106 = _2098 * _2100;
        float _2108 = _2094 * 6.283185482025146484375;
        float _2110 = sin(_2108);
        float _2112 = _2104 * _2106;
        float _2114 = 1.0 / _2112;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2118 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2116;
        float _2120 = 1.0 / _2118;
        float _2122 = _2110 * _2114;
        float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2126 = fma(_1232, _2122, _2124);
        float _2128 = _2126 * _2120;
        float _2130 = precise::clamp(_2128, 0.0, 1.0);
        float _2132 = -_2130;
        float _2134 = _2132 + 1.0;
        _2082 = _2112;
        _2022 = _2134;
    }
    float _2136 = _2082;
    float _2138 = _2022;
    if (!_1254)
    {
        int _2140 = _1288 << 4;
        int _2142 = _2140 + 2048;
        uint _2144 = uint(int(uint(_2142) >> uint(2)));
        uint _2146 = uint(int(uint(int(_2144)) >> uint(2)));
        int _2148 = int(_2144) & 3;
        float _2150 = (*spvDescriptorSet0.vp_c15)._m0[int(_2146)][_2148];
        int _2152 = int(_2144) + 1;
        uint _2154 = uint(int(uint(_2152) >> uint(2)));
        int _2156 = _2152 & 3;
        float _2158 = (*spvDescriptorSet0.vp_c15)._m0[int(_2154)][_2156];
        int _2160 = _2142 + 8;
        uint _2162 = uint(int(uint(_2160) >> uint(2)));
        uint _2164 = uint(int(uint(int(_2162)) >> uint(2)));
        int _2166 = int(_2162) & 3;
        float _2168 = (*spvDescriptorSet0.vp_c15)._m0[int(_2164)][_2166];
        int _2170 = int(_2162) + 1;
        uint _2172 = uint(int(uint(_2170) >> uint(2)));
        int _2174 = _2170 & 3;
        float _2176 = (*spvDescriptorSet0.vp_c15)._m0[int(_2172)][_2174];
        float _2178 = _976 * _2158;
        float _2180 = fma(_374, _2150, _2178);
        float _2182 = fma(_376, _2168, _2180);
        float _2184 = _2182 + _2176;
        float _2186 = precise::clamp(_2184, 0.0, 1.0);
        float _2188 = -_2186;
        float _2190 = _2188 + _1985;
        float _2192 = fma(_2190, 500.0, 1.5);
        float _2194 = exp2(_2192);
        float _2196 = 0.0 + _2194;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        _2018 = _2198;
    }
    float _2200 = _2018;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2204 = _1815 + _2202;
    float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2208 = _1817 + _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2212 = _1819 + _2210;
    float _2214 = _2204 * _2204;
    float _2216 = fma(_2208, _2208, _2214);
    float _2218 = fma(_2212, _2212, _2216);
    float _2220 = rsqrt(_2218);
    float _2222 = sqrt(_2218);
    float _2224 = _2208 * _2220;
    float _2226 = _2212 * _2220;
    float _2228 = _2204 * _2220;
    float _2230 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2232 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2234 = _2230 * _2230;
    float _2236 = _2232 * _2232;
    float _2238 = _2234 + _2236;
    float _2240 = sqrt(_2238);
    bool _2242 = _2240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2246 = _2240 + _2244;
    float _2248 = _2136;
    float _2250 = _2238;
    float _2252 = _2246;
    float _2254 = _2220;
    float _2256 = _2230;
    float _2258 = _2232;
    float _2260 = _2234;
    float _2262 = _2236;
    if (_2242)
    {
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2248 = _2264;
    }
    float _2266 = _2248;
    if (_2242)
    {
        float _2268 = rsqrt(_2238);
        _2250 = _2268;
    }
    float _2270 = _2250;
    if (_2242)
    {
        float _2272 = _2246 * _2266;
        _2252 = _2272;
    }
    float _2274 = _2252;
    if (_2242)
    {
        float _2276 = _2274 * 0.15915493667125701904296875;
        _1647 = _2276;
    }
    float _2278 = _1647;
    float _2280 = _1973;
    if (_2242)
    {
        float _2282 = _2278 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2290 = precise::max(0.0, _2288);
    float _2292 = _2266;
    float _2294 = _2290;
    if (_2242)
    {
        float _2296 = _2278 * 6.283185482025146484375;
        float _2298 = cos(_2296);
        _2292 = _2298;
    }
    float _2300 = _2292;
    float _2302 = -_2228;
    float _2304 = -_2290;
    float _2306 = fma(_2302, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2304);
    if (_2242)
    {
        float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2254 = _2308;
    }
    float _2310 = _2254;
    float _2312 = _2286;
    float _2314 = _2310;
    if (_2242)
    {
        float _2316 = fma(_2286, _2310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2312 = _2316;
    }
    float _2318 = _2312;
    float _2320 = _2318;
    if (!_2242)
    {
        _2314 = _2306;
    }
    float _2322 = _2314;
    float _2324 = _2322;
    if (_2242)
    {
        float _2326 = _2300 + (-1.0);
        _2294 = _2326;
    }
    float _2328 = _2294;
    float _2330 = _2328;
    if (_2242)
    {
        float _2332 = _2270 * _2318;
        _2320 = _2332;
    }
    float _2334 = _2320;
    if (_2242)
    {
        float _2336 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2336;
    }
    float _2338 = _2330;
    if (_2242)
    {
        float _2340 = _2230 * _2334;
        _2256 = _2340;
    }
    float _2342 = _2256;
    if (_2242)
    {
        float _2344 = _2232 * _2334;
        _2258 = _2344;
    }
    float _2346 = _2258;
    if (_2242)
    {
        float _2348 = fma(_2306, _2300, _2338);
        _2324 = _2348;
    }
    float _2350 = _2324;
    if (_2242)
    {
        float _2352 = _2342 * _2342;
        _2260 = _2352;
    }
    float _2354 = _2260;
    if (_2242)
    {
        float _2356 = _2346 * _2346;
        _2262 = _2356;
    }
    float _2358 = _2262;
    float _2360 = fma(_2350, _2350, _2354);
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2364 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2362);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2360 + _2358;
    float _2370 = -_2366;
    float _2372 = _2370 + 1.0;
    float _2374 = rsqrt(_2368);
    float _2376 = abs(_2372);
    float _2378 = log2(_2376);
    float _2380 = _2374 * _2342;
    float _2382 = _2374 * _2350;
    float _2384 = _2374 * _2346;
    float _2386 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2388 = -_2386;
    float _2390 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2388);
    float _2392 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2394 = -_2384;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2390);
    float _2398 = exp2(_2392);
    float _2400 = fma(_2396, -0.5, 0.5);
    float _2402 = fma(_2396, 0.5, 0.5);
    float _2404 = fma(_2402, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2406 = sqrt(_2400);
    float _2408 = fma(_2402, _2404, -0.212114393711090087890625);
    float _2410 = _2382 + 1.0;
    float _2412 = fma(_2402, _2408, 1.570728778839111328125);
    float _2414 = -_2382;
    float _2416 = fma(_2398, _2410, _2414);
    float _2418 = fma(_2416, 0.5, 0.5);
    float _2420 = _2406 * 0.636619746685028076171875;
    float _2422 = -_2412;
    float _2424 = fma(_2420, _2422, 1.0);
    float2 _6720 = float2(_2424, _2418);
    float3 _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6720, float2(0.0), isnan(_6720)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6720, float2(0.0), isnan(_6720)), level(0.0)).xyz;
    float _2430 = _2428.x;
    float _2432 = _2428.y;
    float _2434 = _2428.z;
    float _2436 = in.m_81.x;
    float _2438 = abs(_1232);
    float _2440 = log2(_2438);
    bool _2442 = _398 > 0.5;
    float _2444 = in.m_81.y;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2452 = in.m_83.x;
    bool _2454 = _442 > 0.5;
    bool _2456 = _2454 && _2448;
    float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2460 = -_394;
    float _2462 = _2460 + 1.0;
    out.m_85.x = _1817;
    out.m_85.y = _1815;
    out.m_85.z = _1819;
    int _2464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2466 = _2464 != 0;
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2474 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2482 = _2436;
    if (_2448)
    {
        _2480 = _2436;
    }
    float _2484 = _2480;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2488 = -_2444;
    float _2490 = _2488 + 1.0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2494 = _2484;
    float _2496 = _2444;
    if (_2456)
    {
        float _2498 = -_2484;
        float _2500 = _2498 + 1.0;
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2506 = exp2(_2450);
    if (_2466)
    {
        float _2508 = _2442 ? _2490 : _2444;
        _2496 = _2508;
    }
    float _2510 = _2496;
    out.m_87.x = _2492;
    out.m_87.y = _2474;
    out.m_87.z = _2476;
    out.m_87.w = _2472;
    if (_2448)
    {
        _2482 = _2502;
    }
    float _2512 = _2482;
    bool _2514 = _1182 != 0.0;
    bool _2516 = isnan(_1182);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan(0.0);
    bool _2522 = _2518 || _2520;
    float _2524 = in.m_83.y;
    bool _2526 = _1232 <= 8000.0;
    bool _2528 = isnan(_1232);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(8000.0);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2540 = _1246 == 0.0;
    bool _2542 = !_2522;
    bool _2544 = _2540 && _2542;
    float _2546 = in.m_83.z;
    bool _2548 = _1244 == 0.0;
    bool _2550 = _2548 && _2544;
    float _2552 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2554 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2558 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2562 = _1122 * _2452;
    float _2564 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2566 = exp2(_2554);
    float _2568 = _2560 * _2458;
    float _2570 = _1082 * _2452;
    float _2572 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _2558;
    out.m_89.y = _2552;
    out.m_89.z = _2564;
    float _2574 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2576 = _2524;
    if (!_2550)
    {
        float _2578 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2524);
        _2576 = _2578;
    }
    float _2580 = _2576;
    float _2582 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2584 = in.m_73.w;
    float _2586 = _2574 * _2538;
    float _2588 = fma(_1082, _2546, _2562);
    float _2590 = _1607 * _2580;
    float _2592 = -_2570;
    float _2594 = fma(_1122, _2546, _2592);
    float _2596 = _2588;
    float _2598 = _2594;
    if (!_2550)
    {
        float _2600 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2588);
        _2596 = _2600;
    }
    float _2602 = _2596;
    float _2604 = _1463 * _2580;
    float _2606 = _1461 * _2580;
    if (!_2550)
    {
        float _2608 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2594);
        _2598 = _2608;
    }
    float _2610 = _2598;
    float _2612 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = fma(_1467, _2602, _2606);
    float _2618 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2582);
    float _2620 = fma(_1455, _2602, _2604);
    float _2622 = fma(_1487, _2610, _2616);
    float _2624 = fma(_2614, -2.0, 3.0);
    float _2626 = _2614 * _2614;
    float _2628 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2618);
    float _2630 = fma(_1613, _2602, _2590);
    out.m_91.x = _2586;
    out.m_91.y = _2568;
    float _2632 = _2626 * _2624;
    float _2634 = _2628 + _1921;
    float _2636 = fma(_1465, _2610, _2620);
    out.gl_Position.x = _1937;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _2628;
    out.gl_Position.w = _1921;
    float _2638 = fma(_1639, _2610, _2630);
    float _2640 = _2634 * 0.5;
    out.m_93.w = _2584;
    out.m_95.z = _2640;
    out.m_95.w = _1921;
    out.m_97.x = _2636;
    out.m_97.y = _2638;
    out.m_97.z = _2622;
    float _2642 = -_2632;
    float _2644 = _2642 + 1.0;
    if (!_1889)
    {
        _1943 = 1.0;
    }
    float _2646 = _1943;
    float _2648 = _2646;
    if (_1889)
    {
        bool _2650 = _1991 >= _1951;
        bool _2652 = isnan(_1991);
        bool _2654 = _2650 || _2652;
        bool _2656 = isnan(_1951);
        bool _2658 = _2654 || _2656;
        float _2660 = float(_2658);
        _2648 = _2660;
    }
    float _2662 = _2648;
    float _2664 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2632);
    float _2666 = -_2506;
    float _2668 = _2666 + 1.0;
    bool _2670 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2672 = isnan(_2222);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2678 = _2674 || _2676;
    float _2680 = _2536 * _2664;
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2684 = _2662 * _2200;
    float _2686 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2688 = _2682 * _1993;
    float _2690 = -_2682;
    float _2692 = _2690 + 1.0;
    float _2694 = _2462 * _2686;
    float _2696 = precise::clamp(_2694, 0.0, 1.0);
    float _2698 = _2004 * _2688;
    float _2700 = _2004 * _2692;
    float _2702 = _2692;
    float _2704 = _2682;
    float _2706 = _2698;
    if (!_2678)
    {
        _2028 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2708 = _2028;
    float _2710 = -_2696;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2714 = _2708;
    float _2716 = _2708;
    if (!_2678)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2718 = _2702;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2678)
    {
        _2704 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2724 = _2704;
    float _2726 = -_2684;
    float _2728 = fma(_2726, _2712, 1.0);
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    float _2732 = _2730 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2734 = _2080 * _2138;
    out.m_99.x = _2732;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2738 = _2734;
    float _2740 = _2732;
    float _2742 = _2724;
    float _2744 = _2724;
    if (!_2678)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2746 = _2738;
    float _2748 = _2746;
    float _2750 = _2746;
    if (!_2678)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2752 = _2740;
    float _2754 = _2434 * _2688;
    float _2756 = fma(_2430, _2698, _1998);
    float _2758 = fma(_2432, _2698, _2000);
    float _2760 = _2752;
    float _2762 = _2752;
    if (!_2678)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2706;
    float _2766 = fma(_2004, _2754, _2002);
    out.m_101.x = _2756;
    out.m_101.y = _2758;
    out.m_101.z = _2766;
    out.m_101.w = _2700;
    bool _2768 = !_2678;
    float _2770 = _2764;
    float _2772 = _2764;
    if (!_2768)
    {
        bool _2774 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2776 = isnan(_2222);
        bool _2778 = _2774 || _2776;
        bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2782 = _2778 || _2780;
        if (!_2782)
        {
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2786 = _2222 + _2784;
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2790 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2788;
            float _2792 = 1.0 / _2790;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2814 = _2786 * _2792;
            float _2816 = precise::clamp(_2814, 0.0, 1.0);
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2822 = fma(_2816, _2796, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2824 = fma(_2816, _2820, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2826 = fma(_2816, _2800, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2828 = fma(_2816, _2804, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2830 = fma(_2816, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2832 = fma(_2816, _2812, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2772 = _2824;
            _2762 = _2830;
            _2716 = _2822;
            _2744 = _2828;
            _2722 = _2826;
            _2750 = _2832;
            _2834 = true;
        }
        else
        {
            bool _2836 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2838 = isnan(_2222);
            bool _2840 = _2836 || _2838;
            bool _2842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2844 = _2840 || _2842;
            if (!_2844)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2846 = _2714;
            _2716 = _2846;
            if (!_2844)
            {
                _2770 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2848 = _2770;
            _2772 = _2848;
            if (!_2844)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2850 = _2720;
            _2722 = _2850;
            if (!_2844)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2852 = _2742;
            _2744 = _2852;
            if (!_2844)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2854 = _2760;
            _2762 = _2854;
            if (!_2844)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2856 = _2748;
            bool _2858 = !_2844;
            _2750 = _2856;
            if (!_2858)
            {
                bool _2860 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2862 = isnan(_2222);
                bool _2864 = _2860 || _2862;
                bool _2866 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2868 = _2864 || _2866;
                if (!_2868)
                {
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2872 = _2222 + _2870;
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2874;
                    float _2878 = 1.0 / _2876;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2900 = _2872 * _2878;
                    float _2902 = precise::clamp(_2900, 0.0, 1.0);
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2908 = fma(_2902, _2882, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2910 = fma(_2902, _2906, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2912 = fma(_2902, _2886, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2914 = fma(_2902, _2890, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2916 = fma(_2902, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2918 = fma(_2902, _2898, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2772 = _2910;
                    _2762 = _2916;
                    _2716 = _2908;
                    _2744 = _2914;
                    _2722 = _2912;
                    _2750 = _2918;
                    _2834 = true;
                }
                else
                {
                    _2772 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2834 = false;
    float _2920 = _2772;
    float _2922 = _2762;
    float _2924 = _2716;
    float _2926 = _2744;
    float _2928 = _2722;
    float _2930 = _2750;
    float _2932 = fma(_2638, -0.5, 0.5);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = -_2920;
    float _2938 = _2936 + _2922;
    float _2940 = _2736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2942 = -_2924;
    float _2944 = _2942 + _2926;
    float _2946 = fma(_2934, _2938, _2920);
    out.m_103.x = 0.0;
    float _2948 = -_2928;
    float _2950 = _2948 + _2930;
    float _2952 = fma(_2934, _2944, _2924);
    float _2954 = _2946 * 0.586610972881317138671875;
    out.m_59.x = _2940;
    bool _2956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2958 = fma(_2934, _2950, _2928);
    float _2960 = fma(_2952, 0.298911988735198974609375, _2954);
    bool _2962 = _2080 > 0.0;
    bool _2964 = isnan(_2080);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan(0.0);
    bool _2970 = _2966 || _2968;
    float _2972 = fma(_2958, 0.114477999508380889892578125, _2960);
    out.m_105.x = 0.0;
    bool _2974 = _2138 <= 0.0;
    bool _2976 = !_2970;
    bool _2978 = _2974 || _2976;
    float _2980 = -_2972;
    float _2982 = _2952 + _2980;
    float _2984 = -_2972;
    float _2986 = _2946 + _2984;
    float _2988 = -_2972;
    float _2990 = _2958 + _2988;
    float _2992 = fma(_2982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    float _2994 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    float _2996 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    bool _2998 = !_2956;
    if (!_2998)
    {
        float _3000 = -_1815;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3004 = -_1817;
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3008 = -_1819;
        float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3012 = _3002 * _3002;
        float _3014 = fma(_3006, _3006, _3012);
        float _3016 = fma(_3010, _3010, _3014);
        float _3018 = rsqrt(_3016);
        float _3020 = _3002 * _3018;
        float _3022 = _3006 * _3018;
        float _3024 = _3010 * _3018;
        float _3026 = sqrt(_3016);
        float _3028 = -_2228;
        float _3030 = _3028 + _3020;
        float _3032 = -_2224;
        float _3034 = _3032 + _3022;
        float _3036 = -_2226;
        float _3038 = _3036 + _3024;
        float _3040 = _3030 * _3030;
        float _3042 = fma(_3034, _3034, _3040);
        float _3044 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3046 = precise::clamp(_3044, 0.0, 1.0);
        float _3048 = fma(_3038, _3038, _3042);
        float _3050 = _3046 * _3046;
        float _3052 = -_3026;
        float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3056 = _3050 + (-1.0);
        float _3058 = rsqrt(_3048);
        float _3060 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3062 = precise::clamp(_3060, 0.0, 1.0);
        float _3064 = abs(_3062);
        float _3066 = log2(_3064);
        float _3068 = _3030 * _3058;
        float _3070 = _3034 * _3058;
        float _3072 = _3038 * _3058;
        float _3074 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3076 = _2638 * _3068;
        float _3078 = fma(_2636, _3070, _3076);
        float _3080 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3082 = fma(_2622, _3072, _3078);
        float _3084 = precise::clamp(_3082, 0.0, 1.0);
        float _3086 = exp2(_3080);
        float _3088 = _3084 * _3084;
        float _3090 = fma(_3088, _3056, 1.0);
        float _3092 = -_3020;
        float _3094 = -_3074;
        float _3096 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3094);
        float _3098 = _2638 * _3020;
        float _3100 = _3090 * _3090;
        float _3102 = -_3024;
        float _3104 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3096);
        float _3106 = fma(_2636, _3022, _3098);
        float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3110 = _3104 + _3108;
        float _3112 = 1.0 / _3100;
        float _3114 = fma(_2622, _3024, _3106);
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        float _3118 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = _3086 * _3120;
        float _3124 = _3116 * _3122;
        float _3126 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3128 = _3050 * _3112;
        float _3130 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3132 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3134 = _3124 * _3128;
        out.m_103.x = _3126;
        out.m_103.y = _3130;
        out.m_103.z = _3132;
        float _3136 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3138 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3140 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3136;
        out.m_105.y = _3138;
        out.m_105.z = _3140;
    }
    out.m_107.x = _2992;
    out.m_107.y = _2994;
    out.m_107.z = _2996;
    if (!_2978)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3142 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3142;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2834 = false;
    bool _342 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_56.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3199 = as_type<float>(_142);
        out.gl_Position.z = _3199;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_180);
        out.gl_Position.z = _3269;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_63.y;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_63.z;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _182 * _182;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = _186 * _186;
    float _206 = in.m_65.x;
    float _208 = fma(_188, _188, _196);
    float _210 = in.m_63.x;
    float _212 = fma(_190, _190, _204);
    float _214 = in.m_67.x;
    float _216 = fma(_192, _192, _208);
    float _218 = fma(_194, _194, _212);
    float _220 = sqrt(_216);
    float _222 = sqrt(_218);
    bool _224 = _220 > 0.0;
    float _226 = _182 * _200;
    float _228 = fma(_198, _210, _226);
    bool _230 = _222 > 0.0;
    float _232 = _188 * _200;
    float _234 = _192 * _200;
    float _236 = fma(_186, _202, _228);
    float _238 = 0.0;
    if (_224)
    {
        float _240 = rsqrt(_216);
        _238 = _240;
    }
    float _242 = _238;
    float _244 = fma(_198, _206, _232);
    float _246 = fma(_198, _214, _234);
    float _248 = 0.0;
    if (!_224)
    {
        _248 = 0.0;
    }
    float _250 = _248;
    float _252 = fma(_190, _202, _244);
    float _254 = 0.0;
    float _256 = _250;
    if (!_224)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = fma(_194, _202, _246);
    float _262 = _218;
    float _264 = _258;
    if (_230)
    {
        float _266 = rsqrt(_218);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    float _272 = 0.0;
    if (!_230)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _274 = _270;
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _274;
    float _282 = _276;
    if (!_224)
    {
        _278 = 0.0;
    }
    float _284 = _278;
    float _286 = 0.0;
    float _288 = _284;
    if (!_230)
    {
        _286 = 0.0;
    }
    float _290 = _286;
    float _292 = _290;
    if (_224)
    {
        float _294 = _242 * _188;
        _256 = _294;
    }
    float _296 = _256;
    if (_224)
    {
        float _298 = _242 * _182;
        _264 = _298;
    }
    float _300 = _264;
    float _302 = _300;
    if (_224)
    {
        float _304 = _242 * _192;
        _288 = _304;
    }
    float _306 = _288;
    float _308 = _306;
    if (_230)
    {
        float _310 = _268 * _190;
        _292 = _310;
    }
    float _312 = _292;
    if (_230)
    {
        float _314 = _268 * _186;
        _280 = _314;
    }
    float _316 = _280;
    if (_230)
    {
        float _318 = _268 * _194;
        _282 = _318;
    }
    float _320 = _282;
    bool _322 = !_184;
    float _340;
    if (!_322)
    {
        float _324 = in.m_71.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_126);
        float _346 = 1.0 / _344;
        float _348 = _160 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = in.m_56.x;
    float _354 = in.m_56.y;
    float _356 = in.m_56.z;
    float _358 = in.m_65.w;
    float _360 = in.m_67.w;
    float _362 = _188 * _354;
    float _364 = _192 * _354;
    float _366 = fma(_206, _352, _362);
    float _368 = fma(_214, _352, _364);
    float _370 = fma(_190, _356, _366);
    float _372 = fma(_194, _356, _368);
    float _374 = _370 + _358;
    float _376 = _372 + _360;
    float _378 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _382 = floor(_378);
    float _384 = floor(_380);
    float _386 = -_382;
    float _388 = _378 + _386;
    float _390 = -_384;
    float _392 = _380 + _390;
    float2 _3574 = float2(_388, _392);
    float _394 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3574, float2(0.0), isnan(_3574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3574, float2(0.0), isnan(_3574)), level(0.0)).x;
    float _396 = _182 * _354;
    float _398 = in.m_71.y;
    float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _402 = log2(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = in.m_71.z;
    float _410 = fma(_210, _352, _396);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = in.m_73.x;
    float _418 = in.m_73.y;
    float _420 = fma(_186, _356, _410);
    float _422 = 1.0 / _406;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _426 = _350 + _424;
    float _428 = in.m_75.x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[194].w * 0.01745329238474369049072265625;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _350 + _436;
    float _440 = _402 * _160;
    float _442 = in.m_71.x;
    float _444 = 1.0 / _432;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _456 = _454 != 0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _350 + _458;
    float _462 = in.m_63.w;
    bool _464 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _466 = isnan(_350);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _426 * _422;
    float _478 = _398 + _408;
    float _480 = exp2(_440);
    bool _482 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _484 = isnan(_350);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = _478 + (-1.0);
    float _496 = _434 * _418;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _500 = 1.0 + _498;
    float _502 = _408 * 2.0;
    bool _504 = _428 > 0.0;
    float _506 = 1.0 / _414;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _510 = _398 * 2.0;
    bool _512 = _428 >= 0.0;
    bool _514 = isnan(_428);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = _438 * _444;
    float _524 = fma(_160, 0.85000002384185791015625, _496);
    float _526 = 1.0 / _500;
    float _528 = _442 + _408;
    int _530 = _520 ? 0 : 1;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    bool _536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = _528 + (-1.0);
    int _548 = ~_530;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    float _558 = floor(_510);
    float _560 = _442 * 2.0;
    int _562 = _552;
    if (!_504)
    {
        int _564 = ~_530;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = _442 + _398;
    bool _572 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = _460 * _506;
    float _584 = _570 + (-1.0);
    float _586 = floor(_502);
    float _588 = _580 ? _534 : 0.0;
    float _590 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _592 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_544)
    {
        float _598 = _588 * _526;
        _162 = _598;
    }
    float _600 = _162;
    float _602 = floor(_560);
    bool _604 = _558 > 0.0;
    float _606 = _236 * _236;
    bool _608 = _558 >= 0.0;
    bool _610 = isnan(_558);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _626 = !_452;
    int _628 = _626 ? 0 : 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _630;
    bool _634 = _586 >= 0.0;
    bool _636 = isnan(_586);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_252, _252, _606);
    bool _646 = !_448;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(_556, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _652 = !_456;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_260, _260, _644);
    float _658 = fma(_632, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _660 = _602 >= 0.0;
    bool _662 = isnan(_602);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = fma(_620, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = rsqrt(_656);
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _684 = _682 != 0;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _690 = fma(_596, _522, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _692 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _694 = isnan(_350);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _524 * 0.15915493667125701904296875;
    float _706 = fma(_688, _522, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _708 = fma(_624, _522, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _710 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _712 = isnan(_350);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_702;
    float _724 = _722 + 1.0;
    float _726 = _420 + _462;
    int _728 = _642 ? 0 : 1;
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = _720 * _724;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _740;
    float _744 = _492 * _732;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _746;
    float _750 = -_492;
    float _752 = _750 + 1.0;
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _756 = fma(_738, _582, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _758 = fma(_742, _582, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _760 = _474 * _752;
    float _762 = -_474;
    float _764 = _762 + 1.0;
    float _766 = fma(_748, _582, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _768 = _668 ? 0 : 1;
    float _770 = _658 * _760;
    float _772 = _650 * _760;
    float _774 = _670 * _760;
    bool _776 = _602 > 0.0;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].y, _770);
    float _780 = float(_568);
    float _782 = _704 * 6.283185482025146484375;
    float _784 = sin(_782);
    bool _786 = _586 > 0.0;
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].x, _772);
    float _790 = _600 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _792 = fma(_706, _744, _778);
    float _794 = _236 * _672;
    float _796 = fma(_690, _744, _788);
    float _798 = _790 * _754;
    bool _800 = !_676;
    int _802 = _800 ? 0 : 1;
    float _804 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].z, _774);
    bool _806 = !_680;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_756, _734, _796);
    bool _812 = _416 >= 0.00999999977648258209228515625;
    bool _814 = isnan(_416);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.00999999977648258209228515625);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = _252 * _672;
    int _826 = abs(_802);
    float _828 = fma(_708, _744, _804);
    int _830 = ~_768;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = _794 * _300;
    int _838 = _834;
    if (!_776)
    {
        int _840 = ~_768;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_758, _734, _792);
    int _848 = abs(_808);
    float _850 = _780 * _822;
    int _852 = ~_728;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = fma(_824, _296, _836);
    int _860 = _856;
    if (!_786)
    {
        int _862 = ~_728;
        int _864 = _862 + 1;
        _860 = _864;
    }
    int _866 = _860;
    float _868 = _784 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    int _870 = _616 ? 0 : 1;
    float _872 = _260 * _672;
    bool _874 = !_684;
    int _876 = _874 ? 0 : 1;
    float _878 = _850 * _868;
    float _880 = float(_844);
    float _882 = _726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _884 = float(_848);
    float _886 = fma(_872, _306, _858);
    float _888 = float(_866);
    float _890 = fma(_766, _734, _828);
    int _892 = ~_870;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _884 * _880;
    int _900 = _896;
    if (!_604)
    {
        int _902 = ~_870;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = _726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _910 = abs(_876);
    float _912 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[11].x, _882);
    float _914 = float(_906);
    float _916 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _918 = float(_910);
    float _920 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[11].z, _912);
    float _922 = float(_826);
    float _924 = in.m_77.x;
    float _926 = in.m_77.y;
    float _928 = in.m_77.z;
    float _930 = abs(_886);
    bool _932 = _930 > 0.99989998340606689453125;
    float _934 = _918 * _914;
    float _936 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[10].z, _916);
    float _938 = _922 * _888;
    float _940 = _920 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _942 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _798);
    float _944 = _936 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _946 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].x, _810);
    float _948 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].y, _846);
    float _950 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].z, _890);
    float _952 = _944 + _940;
    float _954 = _942 + 0.25;
    float _956 = floor(_942);
    float _958 = _936;
    if (_932)
    {
        float _960 = fma(_316, 0.001000000047497451305389404296875, _300);
        _302 = _960;
    }
    float _962 = _302;
    float _964 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (!_932)
    {
        _958 = _296;
    }
    float _966 = _958;
    float _968 = _966;
    if (_932)
    {
        float _970 = fma(_312, 0.001000000047497451305389404296875, _296);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = _898 * (-2.0);
    float _976 = _726 + _964;
    float _978 = _934 * (-2.0);
    float _980 = floor(_954);
    float _982 = fma(_508, _974, _508);
    float _984 = _878 * 0.01745329238474369049072265625;
    float _986 = fma(_978, _928, _928);
    float _988 = _408 + (-0.5);
    float _990 = fma(_974, _926, _926);
    float _992 = _398 + (-0.5);
    if (_932)
    {
        float _994 = fma(_320, 0.001000000047497451305389404296875, _306);
        _308 = _994;
    }
    float _996 = _308;
    float _998 = -_956;
    float _1000 = _942 + _998;
    float _1002 = _942 * 6.283185482025146484375;
    float _1004 = _984 * 0.15915493667125701904296875;
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _986);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    float _1010 = _1002 * 0.15915493667125701904296875;
    int _1012 = abs(_628);
    float _1014 = 1.0 / _940;
    float _1016 = -_980;
    float _1018 = _954 + _1016;
    float _1020 = _976 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1022 = _1000 >= 0.5;
    bool _1024 = isnan(_1000);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.5);
    bool _1030 = _1026 || _1028;
    float _1032 = _976 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1034 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1020);
    int _1036 = abs(_648);
    float _1038 = _1010 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = float(_1012);
    float _1044 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1034);
    int _1046 = abs(_654);
    float _1048 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1032);
    float _1050 = fma(_982, _600, _1008);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1054 = !_1030;
    float _1056 = _1054 ? 0.5 : (-0.5);
    float _1058 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1048);
    bool _1060 = _1018 > 0.5;
    float _1062 = _952 * _1014;
    float _1064 = _1062 * 0.5;
    float _1066 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1068 = _1066 * 2.0;
    float _1070 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1072 = fma(_590, _978, _590);
    float _1074 = _1042 * _1068;
    float _1076 = float(_1036);
    float _1078 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1080 = _1004 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = _938 * (-2.0);
    float _1086 = -_996;
    float _1088 = _794 * _1086;
    float _1090 = _1018;
    int _1092 = as_type<int>(_1014);
    int _1094 = as_type<int>(_1058);
    float _1096 = _1070;
    if (_1060)
    {
        float _1098 = -_1018;
        float _1100 = _1098 + 1.0;
        _1090 = _1100;
    }
    float _1102 = _1090;
    float _1104 = fma(_1076, _1078, _1074);
    float _1106 = -_962;
    float _1108 = _824 * _1106;
    float _1110 = in.m_79.x;
    float _1112 = in.m_79.y;
    float _1114 = in.m_79.z;
    float _1116 = fma(_1102, 4.0, -1.0);
    float _1118 = float(_1046);
    float _1120 = _1004 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -_962;
    float _1126 = -_1088;
    float _1128 = fma(_872, _1124, _1126);
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1132 = fma(_592, _1084, _592);
    float _1134 = fma(_1072, _600, _1006);
    float _1136 = fma(_1118, _1130, _1104);
    float _1138 = _442 + (-0.5);
    float _1140 = trunc(_1052);
    int _1142 = int(_1140);
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1146 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1144);
    float _1148 = fma(_1136, 3.1415927410125732421875, _924);
    float _1150 = -_972;
    float _1152 = _872 * _1150;
    float _1154 = _1050 * 0.15915493667125701904296875;
    float _1156 = -_972;
    float _1158 = -_1108;
    float _1160 = fma(_794, _1156, _1158);
    float _1162 = fma(_1148, _1084, _1148);
    float _1164 = -_996;
    float _1166 = -_1152;
    float _1168 = fma(_824, _1164, _1166);
    float _1170 = trunc(_1070);
    int _1172 = int(_1170);
    float _1174 = in.m_75.z;
    float _1176 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1162);
    float _1178 = _1168 * _1168;
    float _1180 = _1134 * 0.15915493667125701904296875;
    float _1182 = in.m_75.y;
    float _1184 = _948 * _1112;
    float _1186 = fma(_1128, _1128, _1178);
    float _1188 = 1.0 / _1146;
    int _1190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1192 = _1142 + _1190;
    int _1194 = _1192 + 1;
    float _1196 = _946 * _1110;
    float _1198 = fma(_1132, _600, _1176);
    float _1200 = _1082 * _428;
    float _1202 = _1122 * _428;
    bool _1204 = _1194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1206 = _1198 * 0.15915493667125701904296875;
    int _1208 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1210 = _1172 + _1208;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1160, _1160, _1186);
    float _1216 = _1154 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _950 * _1114;
    int _1222 = _1194 | _1212;
    float _1224 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1226 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1232 = _1188 * _1230;
    bool _1234 = _1222 < 0;
    bool _1236 = _1234 || _1204;
    float _1238 = _1154 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = -_1200;
    float _1244 = fma(_1122, _1174, _1242);
    float _1246 = fma(_1082, _1174, _1202);
    bool _1248 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1182);
    bool _1252 = _1212 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1254 = _1252 || _1236;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1246);
    bool _1258 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1260 = _1180 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    float _1264 = _1224 * _1250;
    bool _1266 = !_1248;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = _1226 * _1256;
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1244);
    float _1274 = _1206 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    int _1278 = 2;
    if (!_1248)
    {
        _1278 = 1;
    }
    int _1280 = _1278;
    int _1282 = _1280;
    if (!_1254)
    {
        int _1284 = _1212 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1286 = _1284 + _1194;
        _1092 = _1286;
    }
    int _1288 = _1092;
    float _1290 = _1228 * _1272;
    if (!_1258)
    {
        _1282 = _1268;
    }
    int _1292 = _1282;
    bool _1294 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1302 = _1298 || _1300;
    float _1304 = _1206 * 6.283185482025146484375;
    float _1306 = cos(_1304);
    int _1308 = _1292 << 6;
    float _1310 = _1240 * _1262;
    float _1312 = _1218 * _1262;
    float _1314 = as_type<float>(_1292);
    if (!_1254)
    {
        int _1316 = _1288 << 2;
        _1094 = _1316;
    }
    int _1318 = _1094;
    int _1320 = _1308 + 96;
    uint _1323 = uint(int(uint(_1320) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.vp_c15)._m0[int(_1325)][_1327];
    int _1331 = int(_1323) + 1;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    int _1335 = _1331 & 3;
    float _1337 = (*spvDescriptorSet0.vp_c15)._m0[int(_1333)][_1335];
    float _1339 = rsqrt(_1214);
    float _1341 = _1276 * _1262;
    float _1343 = _1276 * _1240;
    float _1345 = _1276 * _1218;
    int _1347 = _1318;
    if (!_1254)
    {
        int _1349 = 12 & _1318;
        _1347 = _1349;
    }
    int _1351 = _1347;
    float _1353 = _1180 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = _1306 * _1262;
    float _1359 = _1306 * _1240;
    float _1361 = _1306 * _1218;
    float _1363 = _1357 * _824;
    float _1365 = _1357 * _872;
    float _1367 = _1357 * _794;
    float _1369 = _1128 * _1339;
    int _1371 = _1308 + 48;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c15)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    float _1389 = _1160 * _1339;
    float _1391 = _1168 * _1339;
    float _1393 = fma(_1355, _1359, _1345);
    float _1395 = -_1343;
    float _1397 = fma(_1355, _1361, _1395);
    float _1399 = fma(_1355, _1345, _1359);
    float _1401 = -_1355;
    float _1403 = fma(_1401, _1369, _1363);
    float _1405 = -_1361;
    float _1407 = fma(_1355, _1343, _1405);
    float _1409 = _794 * _1389;
    float _1411 = _1393 * _824;
    float _1413 = _824 * _1391;
    int _1415 = _1308 + 104;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.vp_c15)._m0[int(_1419)][_1421];
    int _1425 = int(_1417) + 1;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    int _1429 = _1425 & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    float _1433 = _1397 * _824;
    float _1435 = -_1409;
    float _1437 = fma(_872, _1391, _1435);
    float _1439 = fma(_1310, _1369, _1411);
    float _1441 = -_1413;
    float _1443 = fma(_794, _1369, _1441);
    float _1445 = -_1355;
    float _1447 = fma(_1445, _1389, _1365);
    float _1449 = _1393 * _872;
    float _1451 = _1397 * _872;
    float _1453 = fma(_1312, _1369, _1433);
    float _1455 = fma(_1407, _1437, _1439);
    float _1457 = fma(_1310, _1389, _1449);
    float _1459 = fma(_1312, _1389, _1451);
    float _1461 = fma(_1341, _1443, _1447);
    float _1463 = fma(_1341, _1437, _1403);
    float _1465 = fma(_1399, _1437, _1453);
    float _1467 = fma(_1407, _1443, _1457);
    int _1469 = _1308 + 64;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
    float _1487 = fma(_1399, _1443, _1459);
    float _1489 = _1264 * _1461;
    float _1491 = _1264 * _1463;
    int _1493 = as_type<int>(_1459);
    float _1495 = as_type<float>(_1351);
    if (!_1254)
    {
        uint _1497 = uint(int(uint(_1288) >> uint(2)));
        _1493 = int(_1497);
    }
    int _1499 = _1493;
    float _1501 = _976 * _1337;
    float _1503 = fma(_1270, _1467, _1489);
    float _1505 = fma(_1270, _1455, _1491);
    int _1507 = _1308 + 56;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
    int _1513 = int(_1509) & 3;
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
    int _1517 = int(_1509) + 1;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    int _1521 = _1517 & 3;
    float _1523 = (*spvDescriptorSet0.vp_c15)._m0[int(_1519)][_1521];
    if (!_1254)
    {
        int _1525 = _1499 << 4;
        int _1527 = _1525 + _1351;
        _1495 = as_type<float>(_1527);
    }
    float _1529 = _1495;
    float _1531 = fma(_1290, _1487, _1503);
    float _1533 = fma(_1290, _1465, _1505);
    float _1535 = _872 * _1369;
    float _1537 = fma(_374, _1329, _1501);
    float _1539 = _376 + _1531;
    float _1541 = _374 + _1533;
    int _1543 = _1308 + 72;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    uint _1547 = uint(int(uint(int(_1545)) >> uint(2)));
    int _1549 = int(_1545) & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = int(_1545) + 1;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    int _1557 = _1553 & 3;
    float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
    float _1561 = _976 * _1387;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1565 = _1539 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1569 = _1541 + _1567;
    float _1571 = -_1535;
    float _1573 = fma(_824, _1389, _1571);
    float _1575 = _1393 * _794;
    float _1577 = _1565 * _1565;
    float _1579 = -_1355;
    float _1581 = fma(_1579, _1391, _1367);
    int _1583 = _1308 + 80;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.vp_c15)._m0[int(_1587)][_1589];
    int _1593 = int(_1585) + 1;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    int _1597 = _1593 & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    float _1601 = _1397 * _794;
    float _1603 = fma(_1569, _1569, _1577);
    float _1605 = fma(_1310, _1391, _1575);
    float _1607 = fma(_1341, _1573, _1581);
    float _1609 = fma(_1312, _1391, _1601);
    float _1611 = sqrt(_1603);
    float _1613 = fma(_1407, _1573, _1605);
    int _1615 = _1308 + 88;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = fma(_376, _1423, _1537);
    float _1635 = _1264 * _1607;
    float _1637 = fma(_374, _1379, _1561);
    float _1639 = fma(_1399, _1573, _1609);
    float _1641 = _1633 + _1431;
    float _1643 = fma(_1270, _1613, _1635);
    float _1645 = _1561;
    float _1647 = _1539;
    if (!_1254)
    {
        float _1649 = floor(_1052);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = _1529;
    if (!_1254)
    {
        int _1655 = as_type<int>(_1529) + 400;
        uint _1657 = uint(int(uint(_1655) >> uint(2)));
        uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
        int _1661 = int(_1657) & 3;
        float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
        _1653 = _1663;
    }
    float _1665 = _1653;
    float _1667 = fma(_1290, _1639, _1643);
    bool _1669 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1671 = _1633;
    float _1673 = _1667;
    if (!_1254)
    {
        float _1675 = floor(_1070);
        _1671 = _1675;
    }
    float _1677 = _1671;
    float _1679 = _976 * _1485;
    float _1681 = _726 + _1667;
    float _1683 = fma(_374, _1477, _1679);
    float _1685 = 1.0 / _1641;
    float _1687 = fma(_376, _1515, _1637);
    float _1689 = _1683;
    float _1691 = _1679;
    float _1693 = _1651;
    if (!_1669)
    {
        _1673 = _1539;
    }
    float _1695 = _1673;
    float _1697 = fma(_376, _1551, _1683);
    float _1699 = _1687 + _1523;
    float _1701 = _1697;
    float _1703 = _1695;
    if (!_1669)
    {
        _1689 = _1681;
    }
    float _1705 = _1689;
    float _1707 = _1697 + _1559;
    float _1709 = _1705;
    if (!_1669)
    {
        _1701 = _1541;
    }
    float _1711 = _1701;
    bool _1713 = !_1669;
    float _1715 = _1711;
    if (!_1713)
    {
        float _1717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1721 = _1611 + _1719;
        float _1723 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1725 = rsqrt(_1603);
        float _1727 = _1721 * _1717;
        float _1729 = _1727 * 0.15915493667125701904296875;
        float _1731 = _1729 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1729 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        float _1739 = _1733 + (-1.0);
        float _1741 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1743 = fma(_1737, _1723, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1745 = fma(_1681, _1733, _1741);
        float _1747 = _1725 * _1743;
        float _1749 = fma(_1569, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1751 = fma(_1565, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1709 = _1745;
        _1715 = _1749;
        _1703 = _1751;
    }
    float _1753 = _1709;
    float _1755 = _1715;
    float _1757 = _1703;
    float _1759 = _1753;
    float _1761 = _1755;
    float _1763 = _1757;
    if (!_1302)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1767 = _726 + _1765;
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1771 = _374 + _1769;
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1775 = -_726;
        float _1777 = _1775 + _1753;
        float _1779 = _1767 * _1767;
        float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1783 = _376 + _1781;
        float _1785 = -_374;
        float _1787 = _1785 + _1755;
        float _1789 = -_376;
        float _1791 = _1789 + _1757;
        float _1793 = fma(_1771, _1771, _1779);
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1797 = fma(_1783, _1783, _1793);
        float _1799 = sqrt(_1797);
        float _1801 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1803 = precise::min(_1799, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1805 = _1803 * _1795;
        float _1807 = _1801 * _1805;
        float _1809 = fma(_1777, _1807, _726);
        float _1811 = fma(_1787, _1807, _374);
        float _1813 = fma(_1791, _1807, _376);
        _1759 = _1809;
        _1761 = _1811;
        _1763 = _1813;
        _1691 = _1777;
    }
    float _1815 = _1759;
    float _1817 = _1761;
    float _1819 = _1763;
    float _1821 = _1691;
    float _1823 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1699 * _1685;
    float _1829 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1831 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1823);
    float _1833 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1825);
    float _1835 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1837 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1829);
    float _1839 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1831);
    bool _1841 = _1827 >= 0.0;
    float _1843 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1845 = _1707 * _1685;
    float _1847 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1849 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    bool _1851 = _1827 <= 1.0;
    bool _1853 = _1851 && _1841;
    float _1855 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1835);
    float _1857 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1863 = _1845 >= 0.0;
    bool _1865 = _1863 && _1853;
    float _1867 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    float _1869 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1871 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1873 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1875 = _1821;
    if (!_1254)
    {
        float _1877 = rint(_1665);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        uint _1883 = clamp(_1881, 0u, 65535u);
        _1875 = as_type<float>(_1883);
    }
    float _1885 = _1875;
    bool _1887 = _1845 <= 1.0;
    bool _1889 = _1887 && _1865;
    float _1891 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1869);
    float _1893 = -_1873;
    float _1895 = fma(_1893, _1871, 1.0);
    float _1897 = _976 * _1599;
    float _1899 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1903 = _1897;
    if (!_1254)
    {
        float _1905 = -_1651;
        float _1907 = _1052 + _1905;
        _1693 = _1907;
    }
    float _1909 = _1693;
    float _1911 = fma(_374, _1591, _1897);
    float _1913 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1915 = log2(_1895);
    float _1917 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1901);
    float _1921 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1891);
    if (_1889)
    {
        float _1923 = float(_1292);
        _1314 = _1923;
    }
    float _1925 = _1314;
    float _1927 = fma(_376, _1623, _1911);
    float _1929 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1917);
    float _1931 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1919);
    float _1933 = 1.0 / _1921;
    float _1935 = _1927 + _1631;
    float _1937 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1929);
    float _1939 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1931);
    float _1941 = _1925;
    float _1943 = _1937;
    if (!_1254)
    {
        float _1945 = -_1677;
        float _1947 = _1070 + _1945;
        _1903 = _1947;
    }
    float _1949 = _1903;
    float _1951 = _1935 * _1685;
    float _1953 = _1901;
    float _1955 = _1949;
    if (_1889)
    {
        float _1957 = rint(_1925);
        float _1959 = precise::max(_1957, 0.0);
        uint _1961 = uint(_1959);
        uint _1963 = clamp(_1961, 0u, 65535u);
        _1953 = as_type<float>(_1963);
    }
    float _1965 = _1953;
    float _1967 = _1915 * 0.693147182464599609375;
    float _1969 = _1937 * _1933;
    float _1971 = _1939 * _1933;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1975 = fma(_1969, 0.5, 0.5);
    float _1977 = fma(_1971, -0.5, 0.5);
    float _1979 = _1885;
    float _1981 = _1933;
    if (!_1254)
    {
        float3 _6052 = float3(_1909, _1949, float(as_type<int>(_1885)));
        float3 _6056 = select(_6052, float3(0.0), isnan(_6052));
        float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6056.xy, uint(rint(_6056.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6056.xy, uint(rint(_6056.z)), level(0.0)).x;
        _1979 = _1983;
    }
    float _1985 = _1979;
    float _1987 = _1845;
    if (_1889)
    {
        float3 _6071 = float3(_1827, _1845, float(as_type<int>(_1965)));
        float3 _6073 = select(_6071, float3(0.0), isnan(_6071));
        float _1989 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6073.xy, uint(rint(_6073.z)), _1951, level(0.0));
        _1987 = _1989;
    }
    float _1991 = _1987;
    float3 _6083 = float3(_1975, _1977, _1973);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6083, float3(0.0), isnan(_6083)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6083, float3(0.0), isnan(_6083)), level(0.0)).x;
    float3 _6092 = float3(_1975, _1977, _1973);
    float4 _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6092, float3(0.0), isnan(_6092)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6092, float3(0.0), isnan(_6092)), level(0.0)).xyzw;
    float _1998 = _1996.x;
    float _2000 = _1996.y;
    float _2002 = _1996.z;
    float _2004 = _1996.w;
    bool _2006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2008 = isnan(0.5);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2014 = _2010 || _2012;
    if (_1254)
    {
        _1981 = 1.0;
    }
    float _2016 = _1981;
    float _2018 = _2016;
    if (_2014)
    {
        _1096 = 1.0;
    }
    float _2020 = _1096;
    float _2022 = _2020;
    if (_2014)
    {
        _1941 = 1.0;
    }
    float _2024 = _1941;
    float _2026 = _2024;
    float _2028 = _1991;
    if (!_2014)
    {
        float _2030 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2036 = _2032 * 6.283185482025146484375;
        float _2038 = cos(_2036);
        float _2040 = _2034 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2038;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = fma(_1232, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _1955 = _2040;
        _2026 = _2076;
    }
    float _2078 = _1955;
    float _2080 = _2026;
    float _2082 = _2078;
    if (!_2014)
    {
        float _2084 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2090 = _2086 * 6.283185482025146484375;
        float _2092 = cos(_2090);
        float _2094 = _2088 * 0.15915493667125701904296875;
        float _2096 = _2086 * 6.283185482025146484375;
        float _2098 = sin(_2096);
        float _2100 = 1.0 / _2092;
        float _2102 = _2094 * 6.283185482025146484375;
        float _2104 = cos(_2102);
        float _2106 = _2098 * _2100;
        float _2108 = _2094 * 6.283185482025146484375;
        float _2110 = sin(_2108);
        float _2112 = _2104 * _2106;
        float _2114 = 1.0 / _2112;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2118 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2116;
        float _2120 = 1.0 / _2118;
        float _2122 = _2110 * _2114;
        float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2126 = fma(_1232, _2122, _2124);
        float _2128 = _2126 * _2120;
        float _2130 = precise::clamp(_2128, 0.0, 1.0);
        float _2132 = -_2130;
        float _2134 = _2132 + 1.0;
        _2082 = _2112;
        _2022 = _2134;
    }
    float _2136 = _2082;
    float _2138 = _2022;
    if (!_1254)
    {
        int _2140 = _1288 << 4;
        int _2142 = _2140 + 2048;
        uint _2144 = uint(int(uint(_2142) >> uint(2)));
        uint _2146 = uint(int(uint(int(_2144)) >> uint(2)));
        int _2148 = int(_2144) & 3;
        float _2150 = (*spvDescriptorSet0.vp_c15)._m0[int(_2146)][_2148];
        int _2152 = int(_2144) + 1;
        uint _2154 = uint(int(uint(_2152) >> uint(2)));
        int _2156 = _2152 & 3;
        float _2158 = (*spvDescriptorSet0.vp_c15)._m0[int(_2154)][_2156];
        int _2160 = _2142 + 8;
        uint _2162 = uint(int(uint(_2160) >> uint(2)));
        uint _2164 = uint(int(uint(int(_2162)) >> uint(2)));
        int _2166 = int(_2162) & 3;
        float _2168 = (*spvDescriptorSet0.vp_c15)._m0[int(_2164)][_2166];
        int _2170 = int(_2162) + 1;
        uint _2172 = uint(int(uint(_2170) >> uint(2)));
        int _2174 = _2170 & 3;
        float _2176 = (*spvDescriptorSet0.vp_c15)._m0[int(_2172)][_2174];
        float _2178 = _976 * _2158;
        float _2180 = fma(_374, _2150, _2178);
        float _2182 = fma(_376, _2168, _2180);
        float _2184 = _2182 + _2176;
        float _2186 = precise::clamp(_2184, 0.0, 1.0);
        float _2188 = -_2186;
        float _2190 = _2188 + _1985;
        float _2192 = fma(_2190, 500.0, 1.5);
        float _2194 = exp2(_2192);
        float _2196 = 0.0 + _2194;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        _2018 = _2198;
    }
    float _2200 = _2018;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2204 = _1815 + _2202;
    float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2208 = _1817 + _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2212 = _1819 + _2210;
    float _2214 = _2204 * _2204;
    float _2216 = fma(_2208, _2208, _2214);
    float _2218 = fma(_2212, _2212, _2216);
    float _2220 = rsqrt(_2218);
    float _2222 = sqrt(_2218);
    float _2224 = _2208 * _2220;
    float _2226 = _2212 * _2220;
    float _2228 = _2204 * _2220;
    float _2230 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2232 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2234 = _2230 * _2230;
    float _2236 = _2232 * _2232;
    float _2238 = _2234 + _2236;
    float _2240 = sqrt(_2238);
    bool _2242 = _2240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2246 = _2240 + _2244;
    float _2248 = _2136;
    float _2250 = _2238;
    float _2252 = _2246;
    float _2254 = _2220;
    float _2256 = _2230;
    float _2258 = _2232;
    float _2260 = _2234;
    float _2262 = _2236;
    if (_2242)
    {
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2248 = _2264;
    }
    float _2266 = _2248;
    if (_2242)
    {
        float _2268 = rsqrt(_2238);
        _2250 = _2268;
    }
    float _2270 = _2250;
    if (_2242)
    {
        float _2272 = _2246 * _2266;
        _2252 = _2272;
    }
    float _2274 = _2252;
    if (_2242)
    {
        float _2276 = _2274 * 0.15915493667125701904296875;
        _1647 = _2276;
    }
    float _2278 = _1647;
    float _2280 = _1973;
    if (_2242)
    {
        float _2282 = _2278 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2290 = precise::max(0.0, _2288);
    float _2292 = _2266;
    float _2294 = _2290;
    if (_2242)
    {
        float _2296 = _2278 * 6.283185482025146484375;
        float _2298 = cos(_2296);
        _2292 = _2298;
    }
    float _2300 = _2292;
    float _2302 = -_2228;
    float _2304 = -_2290;
    float _2306 = fma(_2302, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2304);
    if (_2242)
    {
        float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2254 = _2308;
    }
    float _2310 = _2254;
    float _2312 = _2286;
    float _2314 = _2310;
    if (_2242)
    {
        float _2316 = fma(_2286, _2310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2312 = _2316;
    }
    float _2318 = _2312;
    float _2320 = _2318;
    if (!_2242)
    {
        _2314 = _2306;
    }
    float _2322 = _2314;
    float _2324 = _2322;
    if (_2242)
    {
        float _2326 = _2300 + (-1.0);
        _2294 = _2326;
    }
    float _2328 = _2294;
    float _2330 = _2328;
    if (_2242)
    {
        float _2332 = _2270 * _2318;
        _2320 = _2332;
    }
    float _2334 = _2320;
    if (_2242)
    {
        float _2336 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2336;
    }
    float _2338 = _2330;
    if (_2242)
    {
        float _2340 = _2230 * _2334;
        _2256 = _2340;
    }
    float _2342 = _2256;
    if (_2242)
    {
        float _2344 = _2232 * _2334;
        _2258 = _2344;
    }
    float _2346 = _2258;
    if (_2242)
    {
        float _2348 = fma(_2306, _2300, _2338);
        _2324 = _2348;
    }
    float _2350 = _2324;
    if (_2242)
    {
        float _2352 = _2342 * _2342;
        _2260 = _2352;
    }
    float _2354 = _2260;
    if (_2242)
    {
        float _2356 = _2346 * _2346;
        _2262 = _2356;
    }
    float _2358 = _2262;
    float _2360 = fma(_2350, _2350, _2354);
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2364 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2362);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2360 + _2358;
    float _2370 = -_2366;
    float _2372 = _2370 + 1.0;
    float _2374 = rsqrt(_2368);
    float _2376 = abs(_2372);
    float _2378 = log2(_2376);
    float _2380 = _2374 * _2342;
    float _2382 = _2374 * _2350;
    float _2384 = _2374 * _2346;
    float _2386 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2388 = -_2386;
    float _2390 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2388);
    float _2392 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2394 = -_2384;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2390);
    float _2398 = exp2(_2392);
    float _2400 = fma(_2396, -0.5, 0.5);
    float _2402 = fma(_2396, 0.5, 0.5);
    float _2404 = fma(_2402, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2406 = sqrt(_2400);
    float _2408 = fma(_2402, _2404, -0.212114393711090087890625);
    float _2410 = _2382 + 1.0;
    float _2412 = fma(_2402, _2408, 1.570728778839111328125);
    float _2414 = -_2382;
    float _2416 = fma(_2398, _2410, _2414);
    float _2418 = fma(_2416, 0.5, 0.5);
    float _2420 = _2406 * 0.636619746685028076171875;
    float _2422 = -_2412;
    float _2424 = fma(_2420, _2422, 1.0);
    float2 _6720 = float2(_2424, _2418);
    float3 _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6720, float2(0.0), isnan(_6720)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6720, float2(0.0), isnan(_6720)), level(0.0)).xyz;
    float _2430 = _2428.x;
    float _2432 = _2428.y;
    float _2434 = _2428.z;
    float _2436 = in.m_81.x;
    float _2438 = abs(_1232);
    float _2440 = log2(_2438);
    bool _2442 = _398 > 0.5;
    float _2444 = in.m_81.y;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2452 = in.m_83.x;
    bool _2454 = _442 > 0.5;
    bool _2456 = _2454 && _2448;
    float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2460 = -_394;
    float _2462 = _2460 + 1.0;
    out.m_85.x = _1817;
    out.m_85.y = _1815;
    out.m_85.z = _1819;
    int _2464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2466 = _2464 != 0;
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2474 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2482 = _2436;
    if (_2448)
    {
        _2480 = _2436;
    }
    float _2484 = _2480;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2488 = -_2444;
    float _2490 = _2488 + 1.0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2494 = _2484;
    float _2496 = _2444;
    if (_2456)
    {
        float _2498 = -_2484;
        float _2500 = _2498 + 1.0;
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2506 = exp2(_2450);
    if (_2466)
    {
        float _2508 = _2442 ? _2490 : _2444;
        _2496 = _2508;
    }
    float _2510 = _2496;
    out.m_87.x = _2492;
    out.m_87.y = _2474;
    out.m_87.z = _2476;
    out.m_87.w = _2472;
    if (_2448)
    {
        _2482 = _2502;
    }
    float _2512 = _2482;
    bool _2514 = _1182 != 0.0;
    bool _2516 = isnan(_1182);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan(0.0);
    bool _2522 = _2518 || _2520;
    float _2524 = in.m_83.y;
    bool _2526 = _1232 <= 8000.0;
    bool _2528 = isnan(_1232);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(8000.0);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2540 = _1246 == 0.0;
    bool _2542 = !_2522;
    bool _2544 = _2540 && _2542;
    float _2546 = in.m_83.z;
    bool _2548 = _1244 == 0.0;
    bool _2550 = _2548 && _2544;
    float _2552 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2554 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2558 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2562 = _1122 * _2452;
    float _2564 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2566 = exp2(_2554);
    float _2568 = _2560 * _2458;
    float _2570 = _1082 * _2452;
    float _2572 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _2558;
    out.m_89.y = _2552;
    out.m_89.z = _2564;
    float _2574 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2576 = _2524;
    if (!_2550)
    {
        float _2578 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2524);
        _2576 = _2578;
    }
    float _2580 = _2576;
    float _2582 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2584 = in.m_73.w;
    float _2586 = _2574 * _2538;
    float _2588 = fma(_1082, _2546, _2562);
    float _2590 = _1607 * _2580;
    float _2592 = -_2570;
    float _2594 = fma(_1122, _2546, _2592);
    float _2596 = _2588;
    float _2598 = _2594;
    if (!_2550)
    {
        float _2600 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2588);
        _2596 = _2600;
    }
    float _2602 = _2596;
    float _2604 = _1463 * _2580;
    float _2606 = _1461 * _2580;
    if (!_2550)
    {
        float _2608 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2594);
        _2598 = _2608;
    }
    float _2610 = _2598;
    float _2612 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = fma(_1467, _2602, _2606);
    float _2618 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2582);
    float _2620 = fma(_1455, _2602, _2604);
    float _2622 = fma(_1487, _2610, _2616);
    float _2624 = fma(_2614, -2.0, 3.0);
    float _2626 = _2614 * _2614;
    float _2628 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2618);
    float _2630 = fma(_1613, _2602, _2590);
    out.m_91.x = _2586;
    out.m_91.y = _2568;
    float _2632 = _2626 * _2624;
    float _2634 = _2628 + _1921;
    float _2636 = fma(_1465, _2610, _2620);
    out.gl_Position.x = _1937;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _2628;
    out.gl_Position.w = _1921;
    float _2638 = fma(_1639, _2610, _2630);
    float _2640 = _2634 * 0.5;
    out.m_93.w = _2584;
    out.m_95.z = _2640;
    out.m_95.w = _1921;
    out.m_97.x = _2636;
    out.m_97.y = _2638;
    out.m_97.z = _2622;
    float _2642 = -_2632;
    float _2644 = _2642 + 1.0;
    if (!_1889)
    {
        _1943 = 1.0;
    }
    float _2646 = _1943;
    float _2648 = _2646;
    if (_1889)
    {
        bool _2650 = _1991 >= _1951;
        bool _2652 = isnan(_1991);
        bool _2654 = _2650 || _2652;
        bool _2656 = isnan(_1951);
        bool _2658 = _2654 || _2656;
        float _2660 = float(_2658);
        _2648 = _2660;
    }
    float _2662 = _2648;
    float _2664 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2632);
    float _2666 = -_2506;
    float _2668 = _2666 + 1.0;
    bool _2670 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2672 = isnan(_2222);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2678 = _2674 || _2676;
    float _2680 = _2536 * _2664;
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2684 = _2662 * _2200;
    float _2686 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2688 = _2682 * _1993;
    float _2690 = -_2682;
    float _2692 = _2690 + 1.0;
    float _2694 = _2462 * _2686;
    float _2696 = precise::clamp(_2694, 0.0, 1.0);
    float _2698 = _2004 * _2688;
    float _2700 = _2004 * _2692;
    float _2702 = _2692;
    float _2704 = _2682;
    float _2706 = _2698;
    if (!_2678)
    {
        _2028 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2708 = _2028;
    float _2710 = -_2696;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2714 = _2708;
    float _2716 = _2708;
    if (!_2678)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2718 = _2702;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2678)
    {
        _2704 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2724 = _2704;
    float _2726 = -_2684;
    float _2728 = fma(_2726, _2712, 1.0);
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    float _2732 = _2730 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2734 = _2080 * _2138;
    out.m_99.x = _2732;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2738 = _2734;
    float _2740 = _2732;
    float _2742 = _2724;
    float _2744 = _2724;
    if (!_2678)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2746 = _2738;
    float _2748 = _2746;
    float _2750 = _2746;
    if (!_2678)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2752 = _2740;
    float _2754 = _2434 * _2688;
    float _2756 = fma(_2430, _2698, _1998);
    float _2758 = fma(_2432, _2698, _2000);
    float _2760 = _2752;
    float _2762 = _2752;
    if (!_2678)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2706;
    float _2766 = fma(_2004, _2754, _2002);
    out.m_101.x = _2756;
    out.m_101.y = _2758;
    out.m_101.z = _2766;
    out.m_101.w = _2700;
    bool _2768 = !_2678;
    float _2770 = _2764;
    float _2772 = _2764;
    if (!_2768)
    {
        bool _2774 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2776 = isnan(_2222);
        bool _2778 = _2774 || _2776;
        bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2782 = _2778 || _2780;
        if (!_2782)
        {
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2786 = _2222 + _2784;
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2790 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2788;
            float _2792 = 1.0 / _2790;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2814 = _2786 * _2792;
            float _2816 = precise::clamp(_2814, 0.0, 1.0);
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2822 = fma(_2816, _2796, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2824 = fma(_2816, _2820, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2826 = fma(_2816, _2800, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2828 = fma(_2816, _2804, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2830 = fma(_2816, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2832 = fma(_2816, _2812, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2772 = _2824;
            _2762 = _2830;
            _2716 = _2822;
            _2744 = _2828;
            _2722 = _2826;
            _2750 = _2832;
            _2834 = true;
        }
        else
        {
            bool _2836 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2838 = isnan(_2222);
            bool _2840 = _2836 || _2838;
            bool _2842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2844 = _2840 || _2842;
            if (!_2844)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2846 = _2714;
            _2716 = _2846;
            if (!_2844)
            {
                _2770 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2848 = _2770;
            _2772 = _2848;
            if (!_2844)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2850 = _2720;
            _2722 = _2850;
            if (!_2844)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2852 = _2742;
            _2744 = _2852;
            if (!_2844)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2854 = _2760;
            _2762 = _2854;
            if (!_2844)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2856 = _2748;
            bool _2858 = !_2844;
            _2750 = _2856;
            if (!_2858)
            {
                bool _2860 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2862 = isnan(_2222);
                bool _2864 = _2860 || _2862;
                bool _2866 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2868 = _2864 || _2866;
                if (!_2868)
                {
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2872 = _2222 + _2870;
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2874;
                    float _2878 = 1.0 / _2876;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2900 = _2872 * _2878;
                    float _2902 = precise::clamp(_2900, 0.0, 1.0);
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2908 = fma(_2902, _2882, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2910 = fma(_2902, _2906, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2912 = fma(_2902, _2886, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2914 = fma(_2902, _2890, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2916 = fma(_2902, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2918 = fma(_2902, _2898, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2772 = _2910;
                    _2762 = _2916;
                    _2716 = _2908;
                    _2744 = _2914;
                    _2722 = _2912;
                    _2750 = _2918;
                    _2834 = true;
                }
                else
                {
                    _2772 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2834 = false;
    float _2920 = _2772;
    float _2922 = _2762;
    float _2924 = _2716;
    float _2926 = _2744;
    float _2928 = _2722;
    float _2930 = _2750;
    float _2932 = fma(_2638, -0.5, 0.5);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = -_2920;
    float _2938 = _2936 + _2922;
    float _2940 = _2736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2942 = -_2924;
    float _2944 = _2942 + _2926;
    float _2946 = fma(_2934, _2938, _2920);
    out.m_103.x = 0.0;
    float _2948 = -_2928;
    float _2950 = _2948 + _2930;
    float _2952 = fma(_2934, _2944, _2924);
    float _2954 = _2946 * 0.586610972881317138671875;
    out.m_59.x = _2940;
    bool _2956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2958 = fma(_2934, _2950, _2928);
    float _2960 = fma(_2952, 0.298911988735198974609375, _2954);
    bool _2962 = _2080 > 0.0;
    bool _2964 = isnan(_2080);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan(0.0);
    bool _2970 = _2966 || _2968;
    float _2972 = fma(_2958, 0.114477999508380889892578125, _2960);
    out.m_105.x = 0.0;
    bool _2974 = _2138 <= 0.0;
    bool _2976 = !_2970;
    bool _2978 = _2974 || _2976;
    float _2980 = -_2972;
    float _2982 = _2952 + _2980;
    float _2984 = -_2972;
    float _2986 = _2946 + _2984;
    float _2988 = -_2972;
    float _2990 = _2958 + _2988;
    float _2992 = fma(_2982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    float _2994 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    float _2996 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    bool _2998 = !_2956;
    if (!_2998)
    {
        float _3000 = -_1815;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3004 = -_1817;
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3008 = -_1819;
        float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3012 = _3002 * _3002;
        float _3014 = fma(_3006, _3006, _3012);
        float _3016 = fma(_3010, _3010, _3014);
        float _3018 = rsqrt(_3016);
        float _3020 = _3002 * _3018;
        float _3022 = _3006 * _3018;
        float _3024 = _3010 * _3018;
        float _3026 = sqrt(_3016);
        float _3028 = -_2228;
        float _3030 = _3028 + _3020;
        float _3032 = -_2224;
        float _3034 = _3032 + _3022;
        float _3036 = -_2226;
        float _3038 = _3036 + _3024;
        float _3040 = _3030 * _3030;
        float _3042 = fma(_3034, _3034, _3040);
        float _3044 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3046 = precise::clamp(_3044, 0.0, 1.0);
        float _3048 = fma(_3038, _3038, _3042);
        float _3050 = _3046 * _3046;
        float _3052 = -_3026;
        float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3056 = _3050 + (-1.0);
        float _3058 = rsqrt(_3048);
        float _3060 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3062 = precise::clamp(_3060, 0.0, 1.0);
        float _3064 = abs(_3062);
        float _3066 = log2(_3064);
        float _3068 = _3030 * _3058;
        float _3070 = _3034 * _3058;
        float _3072 = _3038 * _3058;
        float _3074 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3076 = _2638 * _3068;
        float _3078 = fma(_2636, _3070, _3076);
        float _3080 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3082 = fma(_2622, _3072, _3078);
        float _3084 = precise::clamp(_3082, 0.0, 1.0);
        float _3086 = exp2(_3080);
        float _3088 = _3084 * _3084;
        float _3090 = fma(_3088, _3056, 1.0);
        float _3092 = -_3020;
        float _3094 = -_3074;
        float _3096 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3094);
        float _3098 = _2638 * _3020;
        float _3100 = _3090 * _3090;
        float _3102 = -_3024;
        float _3104 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3096);
        float _3106 = fma(_2636, _3022, _3098);
        float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3110 = _3104 + _3108;
        float _3112 = 1.0 / _3100;
        float _3114 = fma(_2622, _3024, _3106);
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        float _3118 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = _3086 * _3120;
        float _3124 = _3116 * _3122;
        float _3126 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3128 = _3050 * _3112;
        float _3130 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3132 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3134 = _3124 * _3128;
        out.m_103.x = _3126;
        out.m_103.y = _3130;
        out.m_103.z = _3132;
        float _3136 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3138 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3140 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3136;
        out.m_105.y = _3138;
        out.m_105.z = _3140;
    }
    out.m_107.x = _2992;
    out.m_107.y = _2994;
    out.m_107.z = _2996;
    if (!_2978)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3142 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3142;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2834 = false;
    bool _342 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_56.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3199 = as_type<float>(_142);
        out.gl_Position.z = _3199;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_180);
        out.gl_Position.z = _3269;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_63.y;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_63.z;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _182 * _182;
    float _198 = in.m_69.x;
    float _200 = in.m_69.y;
    float _202 = in.m_69.z;
    float _204 = _186 * _186;
    float _206 = in.m_65.x;
    float _208 = fma(_188, _188, _196);
    float _210 = in.m_63.x;
    float _212 = fma(_190, _190, _204);
    float _214 = in.m_67.x;
    float _216 = fma(_192, _192, _208);
    float _218 = fma(_194, _194, _212);
    float _220 = sqrt(_216);
    float _222 = sqrt(_218);
    bool _224 = _220 > 0.0;
    float _226 = _182 * _200;
    float _228 = fma(_198, _210, _226);
    bool _230 = _222 > 0.0;
    float _232 = _188 * _200;
    float _234 = _192 * _200;
    float _236 = fma(_186, _202, _228);
    float _238 = 0.0;
    if (_224)
    {
        float _240 = rsqrt(_216);
        _238 = _240;
    }
    float _242 = _238;
    float _244 = fma(_198, _206, _232);
    float _246 = fma(_198, _214, _234);
    float _248 = 0.0;
    if (!_224)
    {
        _248 = 0.0;
    }
    float _250 = _248;
    float _252 = fma(_190, _202, _244);
    float _254 = 0.0;
    float _256 = _250;
    if (!_224)
    {
        _254 = 0.0;
    }
    float _258 = _254;
    float _260 = fma(_194, _202, _246);
    float _262 = _218;
    float _264 = _258;
    if (_230)
    {
        float _266 = rsqrt(_218);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    float _272 = 0.0;
    if (!_230)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _274 = _270;
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _274;
    float _282 = _276;
    if (!_224)
    {
        _278 = 0.0;
    }
    float _284 = _278;
    float _286 = 0.0;
    float _288 = _284;
    if (!_230)
    {
        _286 = 0.0;
    }
    float _290 = _286;
    float _292 = _290;
    if (_224)
    {
        float _294 = _242 * _188;
        _256 = _294;
    }
    float _296 = _256;
    if (_224)
    {
        float _298 = _242 * _182;
        _264 = _298;
    }
    float _300 = _264;
    float _302 = _300;
    if (_224)
    {
        float _304 = _242 * _192;
        _288 = _304;
    }
    float _306 = _288;
    float _308 = _306;
    if (_230)
    {
        float _310 = _268 * _190;
        _292 = _310;
    }
    float _312 = _292;
    if (_230)
    {
        float _314 = _268 * _186;
        _280 = _314;
    }
    float _316 = _280;
    if (_230)
    {
        float _318 = _268 * _194;
        _282 = _318;
    }
    float _320 = _282;
    bool _322 = !_184;
    float _340;
    if (!_322)
    {
        float _324 = in.m_71.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        float _344 = float(_126);
        float _346 = 1.0 / _344;
        float _348 = _160 * _346;
        _340 = _348;
    }
    _342 = false;
    float _350 = _340;
    float _352 = in.m_56.x;
    float _354 = in.m_56.y;
    float _356 = in.m_56.z;
    float _358 = in.m_65.w;
    float _360 = in.m_67.w;
    float _362 = _188 * _354;
    float _364 = _192 * _354;
    float _366 = fma(_206, _352, _362);
    float _368 = fma(_214, _352, _364);
    float _370 = fma(_190, _356, _366);
    float _372 = fma(_194, _356, _368);
    float _374 = _370 + _358;
    float _376 = _372 + _360;
    float _378 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _382 = floor(_378);
    float _384 = floor(_380);
    float _386 = -_382;
    float _388 = _378 + _386;
    float _390 = -_384;
    float _392 = _380 + _390;
    float2 _3574 = float2(_388, _392);
    float _394 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3574, float2(0.0), isnan(_3574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3574, float2(0.0), isnan(_3574)), level(0.0)).x;
    float _396 = _182 * _354;
    float _398 = in.m_71.y;
    float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _402 = log2(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _404;
    float _408 = in.m_71.z;
    float _410 = fma(_210, _352, _396);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _412;
    float _416 = in.m_73.x;
    float _418 = in.m_73.y;
    float _420 = fma(_186, _356, _410);
    float _422 = 1.0 / _406;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _426 = _350 + _424;
    float _428 = in.m_75.x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[194].w * 0.01745329238474369049072265625;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _438 = _350 + _436;
    float _440 = _402 * _160;
    float _442 = in.m_71.x;
    float _444 = 1.0 / _432;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _456 = _454 != 0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _350 + _458;
    float _462 = in.m_63.w;
    bool _464 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _466 = isnan(_350);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _426 * _422;
    float _478 = _398 + _408;
    float _480 = exp2(_440);
    bool _482 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _484 = isnan(_350);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = _478 + (-1.0);
    float _496 = _434 * _418;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _500 = 1.0 + _498;
    float _502 = _408 * 2.0;
    bool _504 = _428 > 0.0;
    float _506 = 1.0 / _414;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _510 = _398 * 2.0;
    bool _512 = _428 >= 0.0;
    bool _514 = isnan(_428);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = _438 * _444;
    float _524 = fma(_160, 0.85000002384185791015625, _496);
    float _526 = 1.0 / _500;
    float _528 = _442 + _408;
    int _530 = _520 ? 0 : 1;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    bool _536 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = _528 + (-1.0);
    int _548 = ~_530;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    float _558 = floor(_510);
    float _560 = _442 * 2.0;
    int _562 = _552;
    if (!_504)
    {
        int _564 = ~_530;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = _442 + _398;
    bool _572 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = _460 * _506;
    float _584 = _570 + (-1.0);
    float _586 = floor(_502);
    float _588 = _580 ? _534 : 0.0;
    float _590 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _592 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (_544)
    {
        float _598 = _588 * _526;
        _162 = _598;
    }
    float _600 = _162;
    float _602 = floor(_560);
    bool _604 = _558 > 0.0;
    float _606 = _236 * _236;
    bool _608 = _558 >= 0.0;
    bool _610 = isnan(_558);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _626 = !_452;
    int _628 = _626 ? 0 : 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _630;
    bool _634 = _586 >= 0.0;
    bool _636 = isnan(_586);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_252, _252, _606);
    bool _646 = !_448;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(_556, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _652 = !_456;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_260, _260, _644);
    float _658 = fma(_632, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _660 = _602 >= 0.0;
    bool _662 = isnan(_602);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = fma(_620, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = rsqrt(_656);
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _684 = _682 != 0;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _690 = fma(_596, _522, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _692 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _694 = isnan(_350);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _524 * 0.15915493667125701904296875;
    float _706 = fma(_688, _522, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _708 = fma(_624, _522, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _710 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _712 = isnan(_350);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -_702;
    float _724 = _722 + 1.0;
    float _726 = _420 + _462;
    int _728 = _642 ? 0 : 1;
    float _730 = -_720;
    float _732 = _730 + 1.0;
    float _734 = _720 * _724;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _740;
    float _744 = _492 * _732;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _746;
    float _750 = -_492;
    float _752 = _750 + 1.0;
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _756 = fma(_738, _582, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _758 = fma(_742, _582, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _760 = _474 * _752;
    float _762 = -_474;
    float _764 = _762 + 1.0;
    float _766 = fma(_748, _582, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _768 = _668 ? 0 : 1;
    float _770 = _658 * _760;
    float _772 = _650 * _760;
    float _774 = _670 * _760;
    bool _776 = _602 > 0.0;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].y, _770);
    float _780 = float(_568);
    float _782 = _704 * 6.283185482025146484375;
    float _784 = sin(_782);
    bool _786 = _586 > 0.0;
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].x, _772);
    float _790 = _600 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _792 = fma(_706, _744, _778);
    float _794 = _236 * _672;
    float _796 = fma(_690, _744, _788);
    float _798 = _790 * _754;
    bool _800 = !_676;
    int _802 = _800 ? 0 : 1;
    float _804 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[143].z, _774);
    bool _806 = !_680;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_756, _734, _796);
    bool _812 = _416 >= 0.00999999977648258209228515625;
    bool _814 = isnan(_416);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.00999999977648258209228515625);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = _252 * _672;
    int _826 = abs(_802);
    float _828 = fma(_708, _744, _804);
    int _830 = ~_768;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = _794 * _300;
    int _838 = _834;
    if (!_776)
    {
        int _840 = ~_768;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_758, _734, _792);
    int _848 = abs(_808);
    float _850 = _780 * _822;
    int _852 = ~_728;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = fma(_824, _296, _836);
    int _860 = _856;
    if (!_786)
    {
        int _862 = ~_728;
        int _864 = _862 + 1;
        _860 = _864;
    }
    int _866 = _860;
    float _868 = _784 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    int _870 = _616 ? 0 : 1;
    float _872 = _260 * _672;
    bool _874 = !_684;
    int _876 = _874 ? 0 : 1;
    float _878 = _850 * _868;
    float _880 = float(_844);
    float _882 = _726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _884 = float(_848);
    float _886 = fma(_872, _306, _858);
    float _888 = float(_866);
    float _890 = fma(_766, _734, _828);
    int _892 = ~_870;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _884 * _880;
    int _900 = _896;
    if (!_604)
    {
        int _902 = ~_870;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = _726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _910 = abs(_876);
    float _912 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[11].x, _882);
    float _914 = float(_906);
    float _916 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _918 = float(_910);
    float _920 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[11].z, _912);
    float _922 = float(_826);
    float _924 = in.m_77.x;
    float _926 = in.m_77.y;
    float _928 = in.m_77.z;
    float _930 = abs(_886);
    bool _932 = _930 > 0.99989998340606689453125;
    float _934 = _918 * _914;
    float _936 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[10].z, _916);
    float _938 = _922 * _888;
    float _940 = _920 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _942 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _798);
    float _944 = _936 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _946 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].x, _810);
    float _948 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].y, _846);
    float _950 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[146].z, _890);
    float _952 = _944 + _940;
    float _954 = _942 + 0.25;
    float _956 = floor(_942);
    float _958 = _936;
    if (_932)
    {
        float _960 = fma(_316, 0.001000000047497451305389404296875, _300);
        _302 = _960;
    }
    float _962 = _302;
    float _964 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    if (!_932)
    {
        _958 = _296;
    }
    float _966 = _958;
    float _968 = _966;
    if (_932)
    {
        float _970 = fma(_312, 0.001000000047497451305389404296875, _296);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = _898 * (-2.0);
    float _976 = _726 + _964;
    float _978 = _934 * (-2.0);
    float _980 = floor(_954);
    float _982 = fma(_508, _974, _508);
    float _984 = _878 * 0.01745329238474369049072265625;
    float _986 = fma(_978, _928, _928);
    float _988 = _408 + (-0.5);
    float _990 = fma(_974, _926, _926);
    float _992 = _398 + (-0.5);
    if (_932)
    {
        float _994 = fma(_320, 0.001000000047497451305389404296875, _306);
        _308 = _994;
    }
    float _996 = _308;
    float _998 = -_956;
    float _1000 = _942 + _998;
    float _1002 = _942 * 6.283185482025146484375;
    float _1004 = _984 * 0.15915493667125701904296875;
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _986);
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    float _1010 = _1002 * 0.15915493667125701904296875;
    int _1012 = abs(_628);
    float _1014 = 1.0 / _940;
    float _1016 = -_980;
    float _1018 = _954 + _1016;
    float _1020 = _976 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1022 = _1000 >= 0.5;
    bool _1024 = isnan(_1000);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.5);
    bool _1030 = _1026 || _1028;
    float _1032 = _976 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1034 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1020);
    int _1036 = abs(_648);
    float _1038 = _1010 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = float(_1012);
    float _1044 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1034);
    int _1046 = abs(_654);
    float _1048 = fma(_374, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1032);
    float _1050 = fma(_982, _600, _1008);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1054 = !_1030;
    float _1056 = _1054 ? 0.5 : (-0.5);
    float _1058 = fma(_376, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1048);
    bool _1060 = _1018 > 0.5;
    float _1062 = _952 * _1014;
    float _1064 = _1062 * 0.5;
    float _1066 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1068 = _1066 * 2.0;
    float _1070 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1072 = fma(_590, _978, _590);
    float _1074 = _1042 * _1068;
    float _1076 = float(_1036);
    float _1078 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1080 = _1004 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    float _1084 = _938 * (-2.0);
    float _1086 = -_996;
    float _1088 = _794 * _1086;
    float _1090 = _1018;
    int _1092 = as_type<int>(_1014);
    int _1094 = as_type<int>(_1058);
    float _1096 = _1070;
    if (_1060)
    {
        float _1098 = -_1018;
        float _1100 = _1098 + 1.0;
        _1090 = _1100;
    }
    float _1102 = _1090;
    float _1104 = fma(_1076, _1078, _1074);
    float _1106 = -_962;
    float _1108 = _824 * _1106;
    float _1110 = in.m_79.x;
    float _1112 = in.m_79.y;
    float _1114 = in.m_79.z;
    float _1116 = fma(_1102, 4.0, -1.0);
    float _1118 = float(_1046);
    float _1120 = _1004 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -_962;
    float _1126 = -_1088;
    float _1128 = fma(_872, _1124, _1126);
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1132 = fma(_592, _1084, _592);
    float _1134 = fma(_1072, _600, _1006);
    float _1136 = fma(_1118, _1130, _1104);
    float _1138 = _442 + (-0.5);
    float _1140 = trunc(_1052);
    int _1142 = int(_1140);
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1146 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1144);
    float _1148 = fma(_1136, 3.1415927410125732421875, _924);
    float _1150 = -_972;
    float _1152 = _872 * _1150;
    float _1154 = _1050 * 0.15915493667125701904296875;
    float _1156 = -_972;
    float _1158 = -_1108;
    float _1160 = fma(_794, _1156, _1158);
    float _1162 = fma(_1148, _1084, _1148);
    float _1164 = -_996;
    float _1166 = -_1152;
    float _1168 = fma(_824, _1164, _1166);
    float _1170 = trunc(_1070);
    int _1172 = int(_1170);
    float _1174 = in.m_75.z;
    float _1176 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1162);
    float _1178 = _1168 * _1168;
    float _1180 = _1134 * 0.15915493667125701904296875;
    float _1182 = in.m_75.y;
    float _1184 = _948 * _1112;
    float _1186 = fma(_1128, _1128, _1178);
    float _1188 = 1.0 / _1146;
    int _1190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1192 = _1142 + _1190;
    int _1194 = _1192 + 1;
    float _1196 = _946 * _1110;
    float _1198 = fma(_1132, _600, _1176);
    float _1200 = _1082 * _428;
    float _1202 = _1122 * _428;
    bool _1204 = _1194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1206 = _1198 * 0.15915493667125701904296875;
    int _1208 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1210 = _1172 + _1208;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1160, _1160, _1186);
    float _1216 = _1154 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _950 * _1114;
    int _1222 = _1194 | _1212;
    float _1224 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1226 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1232 = _1188 * _1230;
    bool _1234 = _1222 < 0;
    bool _1236 = _1234 || _1204;
    float _1238 = _1154 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = -_1200;
    float _1244 = fma(_1122, _1174, _1242);
    float _1246 = fma(_1082, _1174, _1202);
    bool _1248 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1182);
    bool _1252 = _1212 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1254 = _1252 || _1236;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1246);
    bool _1258 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1260 = _1180 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    float _1264 = _1224 * _1250;
    bool _1266 = !_1248;
    int _1268 = _1266 ? 0 : 1;
    float _1270 = _1226 * _1256;
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1244);
    float _1274 = _1206 * 6.283185482025146484375;
    float _1276 = sin(_1274);
    int _1278 = 2;
    if (!_1248)
    {
        _1278 = 1;
    }
    int _1280 = _1278;
    int _1282 = _1280;
    if (!_1254)
    {
        int _1284 = _1212 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1286 = _1284 + _1194;
        _1092 = _1286;
    }
    int _1288 = _1092;
    float _1290 = _1228 * _1272;
    if (!_1258)
    {
        _1282 = _1268;
    }
    int _1292 = _1282;
    bool _1294 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1296 = isnan(0.5);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1302 = _1298 || _1300;
    float _1304 = _1206 * 6.283185482025146484375;
    float _1306 = cos(_1304);
    int _1308 = _1292 << 6;
    float _1310 = _1240 * _1262;
    float _1312 = _1218 * _1262;
    float _1314 = as_type<float>(_1292);
    if (!_1254)
    {
        int _1316 = _1288 << 2;
        _1094 = _1316;
    }
    int _1318 = _1094;
    int _1320 = _1308 + 96;
    uint _1323 = uint(int(uint(_1320) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.vp_c15)._m0[int(_1325)][_1327];
    int _1331 = int(_1323) + 1;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    int _1335 = _1331 & 3;
    float _1337 = (*spvDescriptorSet0.vp_c15)._m0[int(_1333)][_1335];
    float _1339 = rsqrt(_1214);
    float _1341 = _1276 * _1262;
    float _1343 = _1276 * _1240;
    float _1345 = _1276 * _1218;
    int _1347 = _1318;
    if (!_1254)
    {
        int _1349 = 12 & _1318;
        _1347 = _1349;
    }
    int _1351 = _1347;
    float _1353 = _1180 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = _1306 * _1262;
    float _1359 = _1306 * _1240;
    float _1361 = _1306 * _1218;
    float _1363 = _1357 * _824;
    float _1365 = _1357 * _872;
    float _1367 = _1357 * _794;
    float _1369 = _1128 * _1339;
    int _1371 = _1308 + 48;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    uint _1375 = uint(int(uint(int(_1373)) >> uint(2)));
    int _1377 = int(_1373) & 3;
    float _1379 = (*spvDescriptorSet0.vp_c15)._m0[int(_1375)][_1377];
    int _1381 = int(_1373) + 1;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    int _1385 = _1381 & 3;
    float _1387 = (*spvDescriptorSet0.vp_c15)._m0[int(_1383)][_1385];
    float _1389 = _1160 * _1339;
    float _1391 = _1168 * _1339;
    float _1393 = fma(_1355, _1359, _1345);
    float _1395 = -_1343;
    float _1397 = fma(_1355, _1361, _1395);
    float _1399 = fma(_1355, _1345, _1359);
    float _1401 = -_1355;
    float _1403 = fma(_1401, _1369, _1363);
    float _1405 = -_1361;
    float _1407 = fma(_1355, _1343, _1405);
    float _1409 = _794 * _1389;
    float _1411 = _1393 * _824;
    float _1413 = _824 * _1391;
    int _1415 = _1308 + 104;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.vp_c15)._m0[int(_1419)][_1421];
    int _1425 = int(_1417) + 1;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    int _1429 = _1425 & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    float _1433 = _1397 * _824;
    float _1435 = -_1409;
    float _1437 = fma(_872, _1391, _1435);
    float _1439 = fma(_1310, _1369, _1411);
    float _1441 = -_1413;
    float _1443 = fma(_794, _1369, _1441);
    float _1445 = -_1355;
    float _1447 = fma(_1445, _1389, _1365);
    float _1449 = _1393 * _872;
    float _1451 = _1397 * _872;
    float _1453 = fma(_1312, _1369, _1433);
    float _1455 = fma(_1407, _1437, _1439);
    float _1457 = fma(_1310, _1389, _1449);
    float _1459 = fma(_1312, _1389, _1451);
    float _1461 = fma(_1341, _1443, _1447);
    float _1463 = fma(_1341, _1437, _1403);
    float _1465 = fma(_1399, _1437, _1453);
    float _1467 = fma(_1407, _1443, _1457);
    int _1469 = _1308 + 64;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
    float _1487 = fma(_1399, _1443, _1459);
    float _1489 = _1264 * _1461;
    float _1491 = _1264 * _1463;
    int _1493 = as_type<int>(_1459);
    float _1495 = as_type<float>(_1351);
    if (!_1254)
    {
        uint _1497 = uint(int(uint(_1288) >> uint(2)));
        _1493 = int(_1497);
    }
    int _1499 = _1493;
    float _1501 = _976 * _1337;
    float _1503 = fma(_1270, _1467, _1489);
    float _1505 = fma(_1270, _1455, _1491);
    int _1507 = _1308 + 56;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
    int _1513 = int(_1509) & 3;
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
    int _1517 = int(_1509) + 1;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    int _1521 = _1517 & 3;
    float _1523 = (*spvDescriptorSet0.vp_c15)._m0[int(_1519)][_1521];
    if (!_1254)
    {
        int _1525 = _1499 << 4;
        int _1527 = _1525 + _1351;
        _1495 = as_type<float>(_1527);
    }
    float _1529 = _1495;
    float _1531 = fma(_1290, _1487, _1503);
    float _1533 = fma(_1290, _1465, _1505);
    float _1535 = _872 * _1369;
    float _1537 = fma(_374, _1329, _1501);
    float _1539 = _376 + _1531;
    float _1541 = _374 + _1533;
    int _1543 = _1308 + 72;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    uint _1547 = uint(int(uint(int(_1545)) >> uint(2)));
    int _1549 = int(_1545) & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = int(_1545) + 1;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    int _1557 = _1553 & 3;
    float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
    float _1561 = _976 * _1387;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1565 = _1539 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1569 = _1541 + _1567;
    float _1571 = -_1535;
    float _1573 = fma(_824, _1389, _1571);
    float _1575 = _1393 * _794;
    float _1577 = _1565 * _1565;
    float _1579 = -_1355;
    float _1581 = fma(_1579, _1391, _1367);
    int _1583 = _1308 + 80;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.vp_c15)._m0[int(_1587)][_1589];
    int _1593 = int(_1585) + 1;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    int _1597 = _1593 & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    float _1601 = _1397 * _794;
    float _1603 = fma(_1569, _1569, _1577);
    float _1605 = fma(_1310, _1391, _1575);
    float _1607 = fma(_1341, _1573, _1581);
    float _1609 = fma(_1312, _1391, _1601);
    float _1611 = sqrt(_1603);
    float _1613 = fma(_1407, _1573, _1605);
    int _1615 = _1308 + 88;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = fma(_376, _1423, _1537);
    float _1635 = _1264 * _1607;
    float _1637 = fma(_374, _1379, _1561);
    float _1639 = fma(_1399, _1573, _1609);
    float _1641 = _1633 + _1431;
    float _1643 = fma(_1270, _1613, _1635);
    float _1645 = _1561;
    float _1647 = _1539;
    if (!_1254)
    {
        float _1649 = floor(_1052);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = _1529;
    if (!_1254)
    {
        int _1655 = as_type<int>(_1529) + 400;
        uint _1657 = uint(int(uint(_1655) >> uint(2)));
        uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
        int _1661 = int(_1657) & 3;
        float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
        _1653 = _1663;
    }
    float _1665 = _1653;
    float _1667 = fma(_1290, _1639, _1643);
    bool _1669 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1671 = _1633;
    float _1673 = _1667;
    if (!_1254)
    {
        float _1675 = floor(_1070);
        _1671 = _1675;
    }
    float _1677 = _1671;
    float _1679 = _976 * _1485;
    float _1681 = _726 + _1667;
    float _1683 = fma(_374, _1477, _1679);
    float _1685 = 1.0 / _1641;
    float _1687 = fma(_376, _1515, _1637);
    float _1689 = _1683;
    float _1691 = _1679;
    float _1693 = _1651;
    if (!_1669)
    {
        _1673 = _1539;
    }
    float _1695 = _1673;
    float _1697 = fma(_376, _1551, _1683);
    float _1699 = _1687 + _1523;
    float _1701 = _1697;
    float _1703 = _1695;
    if (!_1669)
    {
        _1689 = _1681;
    }
    float _1705 = _1689;
    float _1707 = _1697 + _1559;
    float _1709 = _1705;
    if (!_1669)
    {
        _1701 = _1541;
    }
    float _1711 = _1701;
    bool _1713 = !_1669;
    float _1715 = _1711;
    if (!_1713)
    {
        float _1717 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1721 = _1611 + _1719;
        float _1723 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1725 = rsqrt(_1603);
        float _1727 = _1721 * _1717;
        float _1729 = _1727 * 0.15915493667125701904296875;
        float _1731 = _1729 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1729 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        float _1739 = _1733 + (-1.0);
        float _1741 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1743 = fma(_1737, _1723, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1745 = fma(_1681, _1733, _1741);
        float _1747 = _1725 * _1743;
        float _1749 = fma(_1569, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1751 = fma(_1565, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1709 = _1745;
        _1715 = _1749;
        _1703 = _1751;
    }
    float _1753 = _1709;
    float _1755 = _1715;
    float _1757 = _1703;
    float _1759 = _1753;
    float _1761 = _1755;
    float _1763 = _1757;
    if (!_1302)
    {
        float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1767 = _726 + _1765;
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1771 = _374 + _1769;
        float _1773 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1775 = -_726;
        float _1777 = _1775 + _1753;
        float _1779 = _1767 * _1767;
        float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1783 = _376 + _1781;
        float _1785 = -_374;
        float _1787 = _1785 + _1755;
        float _1789 = -_376;
        float _1791 = _1789 + _1757;
        float _1793 = fma(_1771, _1771, _1779);
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1797 = fma(_1783, _1783, _1793);
        float _1799 = sqrt(_1797);
        float _1801 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1803 = precise::min(_1799, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1805 = _1803 * _1795;
        float _1807 = _1801 * _1805;
        float _1809 = fma(_1777, _1807, _726);
        float _1811 = fma(_1787, _1807, _374);
        float _1813 = fma(_1791, _1807, _376);
        _1759 = _1809;
        _1761 = _1811;
        _1763 = _1813;
        _1691 = _1777;
    }
    float _1815 = _1759;
    float _1817 = _1761;
    float _1819 = _1763;
    float _1821 = _1691;
    float _1823 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1699 * _1685;
    float _1829 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1831 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1823);
    float _1833 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1825);
    float _1835 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1837 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1829);
    float _1839 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1831);
    bool _1841 = _1827 >= 0.0;
    float _1843 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1833);
    float _1845 = _1707 * _1685;
    float _1847 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1849 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1837);
    bool _1851 = _1827 <= 1.0;
    bool _1853 = _1851 && _1841;
    float _1855 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1835);
    float _1857 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1863 = _1845 >= 0.0;
    bool _1865 = _1863 && _1853;
    float _1867 = fma(_1819, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    float _1869 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1871 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1873 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1875 = _1821;
    if (!_1254)
    {
        float _1877 = rint(_1665);
        float _1879 = precise::max(_1877, 0.0);
        uint _1881 = uint(_1879);
        uint _1883 = clamp(_1881, 0u, 65535u);
        _1875 = as_type<float>(_1883);
    }
    float _1885 = _1875;
    bool _1887 = _1845 <= 1.0;
    bool _1889 = _1887 && _1865;
    float _1891 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1869);
    float _1893 = -_1873;
    float _1895 = fma(_1893, _1871, 1.0);
    float _1897 = _976 * _1599;
    float _1899 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1903 = _1897;
    if (!_1254)
    {
        float _1905 = -_1651;
        float _1907 = _1052 + _1905;
        _1693 = _1907;
    }
    float _1909 = _1693;
    float _1911 = fma(_374, _1591, _1897);
    float _1913 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1915 = log2(_1895);
    float _1917 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1901);
    float _1921 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1891);
    if (_1889)
    {
        float _1923 = float(_1292);
        _1314 = _1923;
    }
    float _1925 = _1314;
    float _1927 = fma(_376, _1623, _1911);
    float _1929 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1917);
    float _1931 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1919);
    float _1933 = 1.0 / _1921;
    float _1935 = _1927 + _1631;
    float _1937 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1929);
    float _1939 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1931);
    float _1941 = _1925;
    float _1943 = _1937;
    if (!_1254)
    {
        float _1945 = -_1677;
        float _1947 = _1070 + _1945;
        _1903 = _1947;
    }
    float _1949 = _1903;
    float _1951 = _1935 * _1685;
    float _1953 = _1901;
    float _1955 = _1949;
    if (_1889)
    {
        float _1957 = rint(_1925);
        float _1959 = precise::max(_1957, 0.0);
        uint _1961 = uint(_1959);
        uint _1963 = clamp(_1961, 0u, 65535u);
        _1953 = as_type<float>(_1963);
    }
    float _1965 = _1953;
    float _1967 = _1915 * 0.693147182464599609375;
    float _1969 = _1937 * _1933;
    float _1971 = _1939 * _1933;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1975 = fma(_1969, 0.5, 0.5);
    float _1977 = fma(_1971, -0.5, 0.5);
    float _1979 = _1885;
    float _1981 = _1933;
    if (!_1254)
    {
        float3 _6052 = float3(_1909, _1949, float(as_type<int>(_1885)));
        float3 _6056 = select(_6052, float3(0.0), isnan(_6052));
        float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6056.xy, uint(rint(_6056.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6056.xy, uint(rint(_6056.z)), level(0.0)).x;
        _1979 = _1983;
    }
    float _1985 = _1979;
    float _1987 = _1845;
    if (_1889)
    {
        float3 _6071 = float3(_1827, _1845, float(as_type<int>(_1965)));
        float3 _6073 = select(_6071, float3(0.0), isnan(_6071));
        float _1989 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6073.xy, uint(rint(_6073.z)), _1951, level(0.0));
        _1987 = _1989;
    }
    float _1991 = _1987;
    float3 _6083 = float3(_1975, _1977, _1973);
    float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6083, float3(0.0), isnan(_6083)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6083, float3(0.0), isnan(_6083)), level(0.0)).x;
    float3 _6092 = float3(_1975, _1977, _1973);
    float4 _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6092, float3(0.0), isnan(_6092)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6092, float3(0.0), isnan(_6092)), level(0.0)).xyzw;
    float _1998 = _1996.x;
    float _2000 = _1996.y;
    float _2002 = _1996.z;
    float _2004 = _1996.w;
    bool _2006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2008 = isnan(0.5);
    bool _2010 = _2006 || _2008;
    bool _2012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2014 = _2010 || _2012;
    if (_1254)
    {
        _1981 = 1.0;
    }
    float _2016 = _1981;
    float _2018 = _2016;
    if (_2014)
    {
        _1096 = 1.0;
    }
    float _2020 = _1096;
    float _2022 = _2020;
    if (_2014)
    {
        _1941 = 1.0;
    }
    float _2024 = _1941;
    float _2026 = _2024;
    float _2028 = _1991;
    if (!_2014)
    {
        float _2030 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2036 = _2032 * 6.283185482025146484375;
        float _2038 = cos(_2036);
        float _2040 = _2034 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2038;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2072 = fma(_1232, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        _1955 = _2040;
        _2026 = _2076;
    }
    float _2078 = _1955;
    float _2080 = _2026;
    float _2082 = _2078;
    if (!_2014)
    {
        float _2084 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2086 = _2084 * 0.15915493667125701904296875;
        float _2088 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2090 = _2086 * 6.283185482025146484375;
        float _2092 = cos(_2090);
        float _2094 = _2088 * 0.15915493667125701904296875;
        float _2096 = _2086 * 6.283185482025146484375;
        float _2098 = sin(_2096);
        float _2100 = 1.0 / _2092;
        float _2102 = _2094 * 6.283185482025146484375;
        float _2104 = cos(_2102);
        float _2106 = _2098 * _2100;
        float _2108 = _2094 * 6.283185482025146484375;
        float _2110 = sin(_2108);
        float _2112 = _2104 * _2106;
        float _2114 = 1.0 / _2112;
        float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2118 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2116;
        float _2120 = 1.0 / _2118;
        float _2122 = _2110 * _2114;
        float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2126 = fma(_1232, _2122, _2124);
        float _2128 = _2126 * _2120;
        float _2130 = precise::clamp(_2128, 0.0, 1.0);
        float _2132 = -_2130;
        float _2134 = _2132 + 1.0;
        _2082 = _2112;
        _2022 = _2134;
    }
    float _2136 = _2082;
    float _2138 = _2022;
    if (!_1254)
    {
        int _2140 = _1288 << 4;
        int _2142 = _2140 + 2048;
        uint _2144 = uint(int(uint(_2142) >> uint(2)));
        uint _2146 = uint(int(uint(int(_2144)) >> uint(2)));
        int _2148 = int(_2144) & 3;
        float _2150 = (*spvDescriptorSet0.vp_c15)._m0[int(_2146)][_2148];
        int _2152 = int(_2144) + 1;
        uint _2154 = uint(int(uint(_2152) >> uint(2)));
        int _2156 = _2152 & 3;
        float _2158 = (*spvDescriptorSet0.vp_c15)._m0[int(_2154)][_2156];
        int _2160 = _2142 + 8;
        uint _2162 = uint(int(uint(_2160) >> uint(2)));
        uint _2164 = uint(int(uint(int(_2162)) >> uint(2)));
        int _2166 = int(_2162) & 3;
        float _2168 = (*spvDescriptorSet0.vp_c15)._m0[int(_2164)][_2166];
        int _2170 = int(_2162) + 1;
        uint _2172 = uint(int(uint(_2170) >> uint(2)));
        int _2174 = _2170 & 3;
        float _2176 = (*spvDescriptorSet0.vp_c15)._m0[int(_2172)][_2174];
        float _2178 = _976 * _2158;
        float _2180 = fma(_374, _2150, _2178);
        float _2182 = fma(_376, _2168, _2180);
        float _2184 = _2182 + _2176;
        float _2186 = precise::clamp(_2184, 0.0, 1.0);
        float _2188 = -_2186;
        float _2190 = _2188 + _1985;
        float _2192 = fma(_2190, 500.0, 1.5);
        float _2194 = exp2(_2192);
        float _2196 = 0.0 + _2194;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        _2018 = _2198;
    }
    float _2200 = _2018;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2204 = _1815 + _2202;
    float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2208 = _1817 + _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2212 = _1819 + _2210;
    float _2214 = _2204 * _2204;
    float _2216 = fma(_2208, _2208, _2214);
    float _2218 = fma(_2212, _2212, _2216);
    float _2220 = rsqrt(_2218);
    float _2222 = sqrt(_2218);
    float _2224 = _2208 * _2220;
    float _2226 = _2212 * _2220;
    float _2228 = _2204 * _2220;
    float _2230 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2232 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2234 = _2230 * _2230;
    float _2236 = _2232 * _2232;
    float _2238 = _2234 + _2236;
    float _2240 = sqrt(_2238);
    bool _2242 = _2240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2246 = _2240 + _2244;
    float _2248 = _2136;
    float _2250 = _2238;
    float _2252 = _2246;
    float _2254 = _2220;
    float _2256 = _2230;
    float _2258 = _2232;
    float _2260 = _2234;
    float _2262 = _2236;
    if (_2242)
    {
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2248 = _2264;
    }
    float _2266 = _2248;
    if (_2242)
    {
        float _2268 = rsqrt(_2238);
        _2250 = _2268;
    }
    float _2270 = _2250;
    if (_2242)
    {
        float _2272 = _2246 * _2266;
        _2252 = _2272;
    }
    float _2274 = _2252;
    if (_2242)
    {
        float _2276 = _2274 * 0.15915493667125701904296875;
        _1647 = _2276;
    }
    float _2278 = _1647;
    float _2280 = _1973;
    if (_2242)
    {
        float _2282 = _2278 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    float _2288 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2290 = precise::max(0.0, _2288);
    float _2292 = _2266;
    float _2294 = _2290;
    if (_2242)
    {
        float _2296 = _2278 * 6.283185482025146484375;
        float _2298 = cos(_2296);
        _2292 = _2298;
    }
    float _2300 = _2292;
    float _2302 = -_2228;
    float _2304 = -_2290;
    float _2306 = fma(_2302, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2304);
    if (_2242)
    {
        float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2254 = _2308;
    }
    float _2310 = _2254;
    float _2312 = _2286;
    float _2314 = _2310;
    if (_2242)
    {
        float _2316 = fma(_2286, _2310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2312 = _2316;
    }
    float _2318 = _2312;
    float _2320 = _2318;
    if (!_2242)
    {
        _2314 = _2306;
    }
    float _2322 = _2314;
    float _2324 = _2322;
    if (_2242)
    {
        float _2326 = _2300 + (-1.0);
        _2294 = _2326;
    }
    float _2328 = _2294;
    float _2330 = _2328;
    if (_2242)
    {
        float _2332 = _2270 * _2318;
        _2320 = _2332;
    }
    float _2334 = _2320;
    if (_2242)
    {
        float _2336 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2330 = _2336;
    }
    float _2338 = _2330;
    if (_2242)
    {
        float _2340 = _2230 * _2334;
        _2256 = _2340;
    }
    float _2342 = _2256;
    if (_2242)
    {
        float _2344 = _2232 * _2334;
        _2258 = _2344;
    }
    float _2346 = _2258;
    if (_2242)
    {
        float _2348 = fma(_2306, _2300, _2338);
        _2324 = _2348;
    }
    float _2350 = _2324;
    if (_2242)
    {
        float _2352 = _2342 * _2342;
        _2260 = _2352;
    }
    float _2354 = _2260;
    if (_2242)
    {
        float _2356 = _2346 * _2346;
        _2262 = _2356;
    }
    float _2358 = _2262;
    float _2360 = fma(_2350, _2350, _2354);
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2364 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2362);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2360 + _2358;
    float _2370 = -_2366;
    float _2372 = _2370 + 1.0;
    float _2374 = rsqrt(_2368);
    float _2376 = abs(_2372);
    float _2378 = log2(_2376);
    float _2380 = _2374 * _2342;
    float _2382 = _2374 * _2350;
    float _2384 = _2374 * _2346;
    float _2386 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2388 = -_2386;
    float _2390 = fma(_2382, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2388);
    float _2392 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2394 = -_2384;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2390);
    float _2398 = exp2(_2392);
    float _2400 = fma(_2396, -0.5, 0.5);
    float _2402 = fma(_2396, 0.5, 0.5);
    float _2404 = fma(_2402, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2406 = sqrt(_2400);
    float _2408 = fma(_2402, _2404, -0.212114393711090087890625);
    float _2410 = _2382 + 1.0;
    float _2412 = fma(_2402, _2408, 1.570728778839111328125);
    float _2414 = -_2382;
    float _2416 = fma(_2398, _2410, _2414);
    float _2418 = fma(_2416, 0.5, 0.5);
    float _2420 = _2406 * 0.636619746685028076171875;
    float _2422 = -_2412;
    float _2424 = fma(_2420, _2422, 1.0);
    float2 _6720 = float2(_2424, _2418);
    float3 _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6720, float2(0.0), isnan(_6720)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6720, float2(0.0), isnan(_6720)), level(0.0)).xyz;
    float _2430 = _2428.x;
    float _2432 = _2428.y;
    float _2434 = _2428.z;
    float _2436 = in.m_81.x;
    float _2438 = abs(_1232);
    float _2440 = log2(_2438);
    bool _2442 = _398 > 0.5;
    float _2444 = in.m_81.y;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2452 = in.m_83.x;
    bool _2454 = _442 > 0.5;
    bool _2456 = _2454 && _2448;
    float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2460 = -_394;
    float _2462 = _2460 + 1.0;
    out.m_85.x = _1817;
    out.m_85.y = _1815;
    out.m_85.z = _1819;
    int _2464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2466 = _2464 != 0;
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2474 = _2468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2482 = _2436;
    if (_2448)
    {
        _2480 = _2436;
    }
    float _2484 = _2480;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2488 = -_2444;
    float _2490 = _2488 + 1.0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2494 = _2484;
    float _2496 = _2444;
    if (_2456)
    {
        float _2498 = -_2484;
        float _2500 = _2498 + 1.0;
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2506 = exp2(_2450);
    if (_2466)
    {
        float _2508 = _2442 ? _2490 : _2444;
        _2496 = _2508;
    }
    float _2510 = _2496;
    out.m_87.x = _2492;
    out.m_87.y = _2474;
    out.m_87.z = _2476;
    out.m_87.w = _2472;
    if (_2448)
    {
        _2482 = _2502;
    }
    float _2512 = _2482;
    bool _2514 = _1182 != 0.0;
    bool _2516 = isnan(_1182);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan(0.0);
    bool _2522 = _2518 || _2520;
    float _2524 = in.m_83.y;
    bool _2526 = _1232 <= 8000.0;
    bool _2528 = isnan(_1232);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan(8000.0);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2540 = _1246 == 0.0;
    bool _2542 = !_2522;
    bool _2544 = _2540 && _2542;
    float _2546 = in.m_83.z;
    bool _2548 = _1244 == 0.0;
    bool _2550 = _2548 && _2544;
    float _2552 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2554 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2558 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2562 = _1122 * _2452;
    float _2564 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2566 = exp2(_2554);
    float _2568 = _2560 * _2458;
    float _2570 = _1082 * _2452;
    float _2572 = _1847 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _2558;
    out.m_89.y = _2552;
    out.m_89.z = _2564;
    float _2574 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2576 = _2524;
    if (!_2550)
    {
        float _2578 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2524);
        _2576 = _2578;
    }
    float _2580 = _2576;
    float _2582 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2584 = in.m_73.w;
    float _2586 = _2574 * _2538;
    float _2588 = fma(_1082, _2546, _2562);
    float _2590 = _1607 * _2580;
    float _2592 = -_2570;
    float _2594 = fma(_1122, _2546, _2592);
    float _2596 = _2588;
    float _2598 = _2594;
    if (!_2550)
    {
        float _2600 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2588);
        _2596 = _2600;
    }
    float _2602 = _2596;
    float _2604 = _1463 * _2580;
    float _2606 = _1461 * _2580;
    if (!_2550)
    {
        float _2608 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2594);
        _2598 = _2608;
    }
    float _2610 = _2598;
    float _2612 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = fma(_1467, _2602, _2606);
    float _2618 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2582);
    float _2620 = fma(_1455, _2602, _2604);
    float _2622 = fma(_1487, _2610, _2616);
    float _2624 = fma(_2614, -2.0, 3.0);
    float _2626 = _2614 * _2614;
    float _2628 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2618);
    float _2630 = fma(_1613, _2602, _2590);
    out.m_91.x = _2586;
    out.m_91.y = _2568;
    float _2632 = _2626 * _2624;
    float _2634 = _2628 + _1921;
    float _2636 = fma(_1465, _2610, _2620);
    out.gl_Position.x = _1937;
    out.gl_Position.y = _1939;
    out.gl_Position.z = _2628;
    out.gl_Position.w = _1921;
    float _2638 = fma(_1639, _2610, _2630);
    float _2640 = _2634 * 0.5;
    out.m_93.w = _2584;
    out.m_95.z = _2640;
    out.m_95.w = _1921;
    out.m_97.x = _2636;
    out.m_97.y = _2638;
    out.m_97.z = _2622;
    float _2642 = -_2632;
    float _2644 = _2642 + 1.0;
    if (!_1889)
    {
        _1943 = 1.0;
    }
    float _2646 = _1943;
    float _2648 = _2646;
    if (_1889)
    {
        bool _2650 = _1991 >= _1951;
        bool _2652 = isnan(_1991);
        bool _2654 = _2650 || _2652;
        bool _2656 = isnan(_1951);
        bool _2658 = _2654 || _2656;
        float _2660 = float(_2658);
        _2648 = _2660;
    }
    float _2662 = _2648;
    float _2664 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2632);
    float _2666 = -_2506;
    float _2668 = _2666 + 1.0;
    bool _2670 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2672 = isnan(_2222);
    bool _2674 = _2670 || _2672;
    bool _2676 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2678 = _2674 || _2676;
    float _2680 = _2536 * _2664;
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2684 = _2662 * _2200;
    float _2686 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2688 = _2682 * _1993;
    float _2690 = -_2682;
    float _2692 = _2690 + 1.0;
    float _2694 = _2462 * _2686;
    float _2696 = precise::clamp(_2694, 0.0, 1.0);
    float _2698 = _2004 * _2688;
    float _2700 = _2004 * _2692;
    float _2702 = _2692;
    float _2704 = _2682;
    float _2706 = _2698;
    if (!_2678)
    {
        _2028 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2708 = _2028;
    float _2710 = -_2696;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2714 = _2708;
    float _2716 = _2708;
    if (!_2678)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2718 = _2702;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2678)
    {
        _2704 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2724 = _2704;
    float _2726 = -_2684;
    float _2728 = fma(_2726, _2712, 1.0);
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    float _2732 = _2730 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2734 = _2080 * _2138;
    out.m_99.x = _2732;
    float _2736 = _2734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2738 = _2734;
    float _2740 = _2732;
    float _2742 = _2724;
    float _2744 = _2724;
    if (!_2678)
    {
        _2738 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2746 = _2738;
    float _2748 = _2746;
    float _2750 = _2746;
    if (!_2678)
    {
        _2740 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2752 = _2740;
    float _2754 = _2434 * _2688;
    float _2756 = fma(_2430, _2698, _1998);
    float _2758 = fma(_2432, _2698, _2000);
    float _2760 = _2752;
    float _2762 = _2752;
    if (!_2678)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2706;
    float _2766 = fma(_2004, _2754, _2002);
    out.m_101.x = _2756;
    out.m_101.y = _2758;
    out.m_101.z = _2766;
    out.m_101.w = _2700;
    bool _2768 = !_2678;
    float _2770 = _2764;
    float _2772 = _2764;
    if (!_2768)
    {
        bool _2774 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2776 = isnan(_2222);
        bool _2778 = _2774 || _2776;
        bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2782 = _2778 || _2780;
        if (!_2782)
        {
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2786 = _2222 + _2784;
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2790 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2788;
            float _2792 = 1.0 / _2790;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2814 = _2786 * _2792;
            float _2816 = precise::clamp(_2814, 0.0, 1.0);
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2822 = fma(_2816, _2796, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2824 = fma(_2816, _2820, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2826 = fma(_2816, _2800, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2828 = fma(_2816, _2804, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2830 = fma(_2816, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2832 = fma(_2816, _2812, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2772 = _2824;
            _2762 = _2830;
            _2716 = _2822;
            _2744 = _2828;
            _2722 = _2826;
            _2750 = _2832;
            _2834 = true;
        }
        else
        {
            bool _2836 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2838 = isnan(_2222);
            bool _2840 = _2836 || _2838;
            bool _2842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2844 = _2840 || _2842;
            if (!_2844)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2846 = _2714;
            _2716 = _2846;
            if (!_2844)
            {
                _2770 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2848 = _2770;
            _2772 = _2848;
            if (!_2844)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2850 = _2720;
            _2722 = _2850;
            if (!_2844)
            {
                _2742 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2852 = _2742;
            _2744 = _2852;
            if (!_2844)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2854 = _2760;
            _2762 = _2854;
            if (!_2844)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2856 = _2748;
            bool _2858 = !_2844;
            _2750 = _2856;
            if (!_2858)
            {
                bool _2860 = _2222 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2862 = isnan(_2222);
                bool _2864 = _2860 || _2862;
                bool _2866 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2868 = _2864 || _2866;
                if (!_2868)
                {
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2872 = _2222 + _2870;
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2876 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2874;
                    float _2878 = 1.0 / _2876;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2900 = _2872 * _2878;
                    float _2902 = precise::clamp(_2900, 0.0, 1.0);
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2908 = fma(_2902, _2882, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2910 = fma(_2902, _2906, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2912 = fma(_2902, _2886, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2914 = fma(_2902, _2890, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2916 = fma(_2902, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2918 = fma(_2902, _2898, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2772 = _2910;
                    _2762 = _2916;
                    _2716 = _2908;
                    _2744 = _2914;
                    _2722 = _2912;
                    _2750 = _2918;
                    _2834 = true;
                }
                else
                {
                    _2772 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2744 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2834 = false;
    float _2920 = _2772;
    float _2922 = _2762;
    float _2924 = _2716;
    float _2926 = _2744;
    float _2928 = _2722;
    float _2930 = _2750;
    float _2932 = fma(_2638, -0.5, 0.5);
    float _2934 = precise::clamp(_2932, 0.0, 1.0);
    float _2936 = -_2920;
    float _2938 = _2936 + _2922;
    float _2940 = _2736 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2942 = -_2924;
    float _2944 = _2942 + _2926;
    float _2946 = fma(_2934, _2938, _2920);
    out.m_103.x = 0.0;
    float _2948 = -_2928;
    float _2950 = _2948 + _2930;
    float _2952 = fma(_2934, _2944, _2924);
    float _2954 = _2946 * 0.586610972881317138671875;
    out.m_59.x = _2940;
    bool _2956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2958 = fma(_2934, _2950, _2928);
    float _2960 = fma(_2952, 0.298911988735198974609375, _2954);
    bool _2962 = _2080 > 0.0;
    bool _2964 = isnan(_2080);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan(0.0);
    bool _2970 = _2966 || _2968;
    float _2972 = fma(_2958, 0.114477999508380889892578125, _2960);
    out.m_105.x = 0.0;
    bool _2974 = _2138 <= 0.0;
    bool _2976 = !_2970;
    bool _2978 = _2974 || _2976;
    float _2980 = -_2972;
    float _2982 = _2952 + _2980;
    float _2984 = -_2972;
    float _2986 = _2946 + _2984;
    float _2988 = -_2972;
    float _2990 = _2958 + _2988;
    float _2992 = fma(_2982, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    float _2994 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    float _2996 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2972);
    bool _2998 = !_2956;
    if (!_2998)
    {
        float _3000 = -_1815;
        float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3004 = -_1817;
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3008 = -_1819;
        float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3012 = _3002 * _3002;
        float _3014 = fma(_3006, _3006, _3012);
        float _3016 = fma(_3010, _3010, _3014);
        float _3018 = rsqrt(_3016);
        float _3020 = _3002 * _3018;
        float _3022 = _3006 * _3018;
        float _3024 = _3010 * _3018;
        float _3026 = sqrt(_3016);
        float _3028 = -_2228;
        float _3030 = _3028 + _3020;
        float _3032 = -_2224;
        float _3034 = _3032 + _3022;
        float _3036 = -_2226;
        float _3038 = _3036 + _3024;
        float _3040 = _3030 * _3030;
        float _3042 = fma(_3034, _3034, _3040);
        float _3044 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3046 = precise::clamp(_3044, 0.0, 1.0);
        float _3048 = fma(_3038, _3038, _3042);
        float _3050 = _3046 * _3046;
        float _3052 = -_3026;
        float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3056 = _3050 + (-1.0);
        float _3058 = rsqrt(_3048);
        float _3060 = _3054 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3062 = precise::clamp(_3060, 0.0, 1.0);
        float _3064 = abs(_3062);
        float _3066 = log2(_3064);
        float _3068 = _3030 * _3058;
        float _3070 = _3034 * _3058;
        float _3072 = _3038 * _3058;
        float _3074 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3076 = _2638 * _3068;
        float _3078 = fma(_2636, _3070, _3076);
        float _3080 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3082 = fma(_2622, _3072, _3078);
        float _3084 = precise::clamp(_3082, 0.0, 1.0);
        float _3086 = exp2(_3080);
        float _3088 = _3084 * _3084;
        float _3090 = fma(_3088, _3056, 1.0);
        float _3092 = -_3020;
        float _3094 = -_3074;
        float _3096 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3094);
        float _3098 = _2638 * _3020;
        float _3100 = _3090 * _3090;
        float _3102 = -_3024;
        float _3104 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3096);
        float _3106 = fma(_2636, _3022, _3098);
        float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3110 = _3104 + _3108;
        float _3112 = 1.0 / _3100;
        float _3114 = fma(_2622, _3024, _3106);
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        float _3118 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = _3086 * _3120;
        float _3124 = _3116 * _3122;
        float _3126 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3128 = _3050 * _3112;
        float _3130 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3132 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3134 = _3124 * _3128;
        out.m_103.x = _3126;
        out.m_103.y = _3130;
        out.m_103.z = _3132;
        float _3136 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3138 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3140 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3136;
        out.m_105.y = _3138;
        out.m_105.z = _3140;
    }
    out.m_107.x = _2992;
    out.m_107.y = _2994;
    out.m_107.z = _2996;
    if (!_2978)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3142 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3142;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

