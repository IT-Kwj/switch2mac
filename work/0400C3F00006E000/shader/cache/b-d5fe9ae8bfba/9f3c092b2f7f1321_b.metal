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
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_28Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_93 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_117 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_97 [[user(locn5)]];
    float4 m_109 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_101 [[user(locn8)]];
    float4 m_107 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_115 [[user(locn12)]];
    float4 m_113 [[user(locn13)]];
    float4 m_111 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_87 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_77 [[attribute(11)]];
    float4 m_89 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
    float4 m_99 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_117 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3290 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _131 = in.m_58.w;
    float _133 = trunc(_131);
    int _136 = int(_133);
    bool _140 = _136 >= 1;
    float _142 = 0.0;
    float _144 = as_type<float>(_136);
    if (!_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _142;
    if (!_140)
    {
        out.m_61.x = 0.0;
    }
    int _148 = 0;
    if (!_140)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    int _154 = _152;
    if (!_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3576 = as_type<float>(_152);
        out.gl_Position.z = _3576;
    }
    if (!_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_63.w;
    float _158 = float(_136);
    float _160 = -_156;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _164 = _156 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _172 = _168 || _170;
    bool _174 = _162 >= _158;
    bool _176 = !_172;
    bool _178 = _174 || _176;
    float _180 = _162;
    if (_178)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _144;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _154 = as_type<int>(_184);
    }
    int _186 = _154;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3640 = as_type<float>(_186);
        out.gl_Position.z = _3640;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    float _194 = 1.0 / _158;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_67.x;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = in.m_71.x;
    float _212 = in.m_71.y;
    float _214 = in.m_71.z;
    float _216 = _188 * _188;
    float _218 = _190 * _190;
    float _220 = _192 * _192;
    float _222 = fma(_198, _198, _216);
    float _224 = fma(_200, _200, _218);
    float _226 = fma(_202, _202, _220);
    float _228 = fma(_204, _204, _222);
    float _230 = fma(_206, _206, _224);
    float _232 = fma(_208, _208, _226);
    float _234 = sqrt(_228);
    float _236 = sqrt(_230);
    float _238 = sqrt(_232);
    bool _240 = _234 > 0.0;
    bool _242 = _236 > 0.0;
    float _244 = _200 * _212;
    float _246 = fma(_198, _210, _244);
    float _248 = _228;
    float _250 = _230;
    float _252 = _234;
    if (_240)
    {
        float _254 = rsqrt(_228);
        _248 = _254;
    }
    float _256 = _248;
    float _258 = 0.0;
    if (!_240)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    bool _262 = _238 > 0.0;
    float _264 = _190 * _212;
    float _266 = _206 * _212;
    float _268 = fma(_202, _214, _246);
    float _270 = 0.0;
    float _272 = _260;
    if (!_242)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _274;
    if (_242)
    {
        float _280 = rsqrt(_230);
        _276 = _280;
    }
    float _282 = _276;
    float _284 = fma(_188, _210, _264);
    float _286 = fma(_204, _210, _266);
    float _288 = 0.0;
    float _290 = _284;
    if (!_240)
    {
        _288 = 0.0;
    }
    float _292 = _288;
    float _294 = _162 * _194;
    float _296 = fma(_192, _214, _284);
    float _298 = 0.0;
    float _300 = _292;
    if (!_240)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = fma(_208, _214, _286);
    float _306 = 0.0;
    float _308 = _302;
    if (_262)
    {
        float _310 = rsqrt(_232);
        _306 = _310;
    }
    float _312 = _306;
    if (!_262)
    {
        _250 = 0.0;
        _290 = 0.0;
    }
    float _314 = _250;
    float _316 = _290;
    float _318 = 0.0;
    float _320 = _316;
    float _322 = _314;
    if (!_242)
    {
        _318 = 0.0;
    }
    float _324 = _318;
    float _326 = _324;
    if (_240)
    {
        float _328 = _256 * _188;
        _272 = _328;
    }
    float _330 = _272;
    float _332 = 0.0;
    if (!_242)
    {
        _332 = 0.0;
    }
    float _334 = _332;
    float _336 = _334;
    if (_240)
    {
        float _338 = _256 * _198;
        _300 = _338;
    }
    float _340 = _300;
    if (!_262)
    {
        _252 = 0.0;
    }
    float _342 = _252;
    float _344 = _342;
    if (_240)
    {
        float _346 = _256 * _204;
        _308 = _346;
    }
    float _348 = _308;
    if (_242)
    {
        float _350 = _282 * _190;
        _278 = _350;
    }
    float _352 = _278;
    if (_242)
    {
        float _354 = _282 * _200;
        _326 = _354;
    }
    float _356 = _326;
    if (_242)
    {
        float _358 = _282 * _206;
        _336 = _358;
    }
    float _360 = _336;
    if (_262)
    {
        float _362 = _312 * _192;
        _320 = _362;
    }
    float _364 = _320;
    if (_262)
    {
        float _366 = _312 * _202;
        _344 = _366;
    }
    float _368 = _344;
    if (_262)
    {
        float _370 = _312 * _208;
        _322 = _370;
    }
    float _372 = _322;
    bool _374 = !_196;
    float _392;
    if (!_374)
    {
        float _376 = in.m_73.x;
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _380 = _376 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _294;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_58.x;
    float _400 = in.m_58.y;
    float _402 = in.m_58.z;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _406 = -_294;
    float _408 = _406 + 1.0;
    float _410 = in.m_75.y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _396 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = in.m_73.y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _418;
    float _428 = in.m_73.z;
    float _430 = in.m_73.w;
    float _432 = in.m_73.x;
    float _434 = _294 * _404;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _408 * _404;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = 1.0 / _424;
    float _444 = in.m_67.w;
    bool _446 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_396);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = precise::min(_436, _440);
    float _460 = _200 * _400;
    float _462 = _206 * _400;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _464;
    float _468 = fma(_198, _398, _460);
    float _470 = fma(_204, _398, _462);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _396 + _472;
    float _476 = fma(_202, _402, _468);
    float _478 = _400 + _410;
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _494 = _492 != 0;
    float _496 = fma(_208, _402, _470);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = _474 * _426;
    float _504 = _420 + _428;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = _396 + _506;
    float _510 = 1.0 / _466;
    float _512 = _504 + (-1.0);
    bool _514 = !_486;
    int _516 = _514 ? 0 : 1;
    float _518 = _432 + _428;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _522 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _534 = _532 != 0;
    float _536 = _414 * _442;
    float _538 = _482 * _162;
    float _540 = _518 + (-1.0);
    float _542 = _512;
    float _544 = _482;
    if (_500)
    {
        _542 = _420;
    }
    float _546 = _542;
    float _548 = exp2(_538);
    float _550 = _546;
    if (!_500)
    {
        _550 = _432;
    }
    float _552 = _550;
    float _554 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_500)
    {
        _544 = _432;
    }
    float _556 = _544;
    float _558 = _508 * _510;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _566 = in.m_69.w;
    float _568 = _556;
    if (!_500)
    {
        _568 = _428;
    }
    float _570 = _568;
    float _572 = 1.0 / _562;
    float _574 = fma(_564, -2.0, _520);
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _578 = _570 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _580 = -_548;
    float _582 = _580 + 1.0;
    bool _584 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _592 = _588 || _590;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _610 = -_576;
    float _612 = fma(_578, 2.0, _610);
    float _614 = _432 + _420;
    float _616 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[88].z, _594);
    float _618 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[88].w, _606);
    float _620 = fma(_608, _420, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _622 = _604 ? _582 : 0.0;
    float _624 = _614 + (-1.0);
    float _626 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _616);
    float _628 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _618);
    float _630 = _620 * _162;
    float _632 = -_162;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[86].x, _612);
    float _636 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _574);
    float _638 = _626;
    if (_592)
    {
        float _640 = _622 * _572;
        _180 = _640;
    }
    float _642 = _180;
    float _644 = _428 * 2.0;
    float _646 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _656 = floor(_644);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _658;
    float _662 = fma(_650, _502, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _664;
    bool _668 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _670 = isnan(_396);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _684 = _420 * 2.0;
    float _686 = fma(_660, _502, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _692 = fma(_666, _502, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _694 = -_678;
    float _696 = _694 + 1.0;
    float _698 = _432 * 2.0;
    float _700 = fma(_682, _536, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _702 = fma(_654, _536, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _704 = fma(_690, _536, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _706 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _708 = isnan(_396);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = floor(_684);
    bool _720 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_396);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _456 * _696;
    float _734 = -_456;
    float _736 = _734 + 1.0;
    bool _738 = !_494;
    int _740 = _738 ? 0 : 1;
    float _742 = _476 + _444;
    bool _744 = _656 > 0.0;
    float _746 = _730 * _736;
    float _748 = floor(_698);
    float _750 = -_730;
    float _752 = _750 + 1.0;
    float _754 = _496 + _566;
    bool _756 = _656 >= 0.0;
    bool _758 = isnan(_656);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = _716 * _752;
    bool _768 = !_490;
    int _770 = _768 ? 0 : 1;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _772;
    float _776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _778 = _686 * _766;
    int _780 = _764 ? 0 : 1;
    float _782 = _642 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _784 = _718 >= 0.0;
    bool _786 = isnan(_718);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _662 * _766;
    float _796 = _692 * _766;
    bool _798 = _718 > 0.0;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _802 = _748 >= 0.0;
    bool _804 = isnan(_748);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = fma(_774, _558, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _814 = _642 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _816 = ~_780;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = -_716;
    float _824 = _822 + 1.0;
    bool _826 = !_534;
    int _828 = _826 ? 0 : 1;
    float _830 = _782 * _776;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    int _834 = _820;
    if (!_744)
    {
        int _836 = ~_780;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = fma(_432, 6.283185482025146484375, _630);
    int _844 = _792 ? 0 : 1;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _846;
    int _850 = _810 ? 0 : 1;
    float _852 = fma(_702, _746, _832);
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _860 = _858 != 0;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _864 = _862 != 0;
    float _866 = fma(_848, _558, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _868 = _748 > 0.0;
    float _870 = _814 * _800;
    float _872 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _778);
    int _874 = ~_850;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[203].x, _830);
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _884;
    float _888 = fma(_700, _746, _872);
    bool _890 = !_860;
    int _892 = _890 ? 0 : 1;
    float _894 = in.m_77.x;
    float _896 = in.m_77.y;
    float _898 = in.m_77.z;
    float _900 = fma(_886, _558, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _902 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[203].z, _870);
    int _904 = _878;
    if (!_868)
    {
        int _906 = ~_850;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = floor(_880);
    float _914 = in.m_79.x;
    float _916 = in.m_79.y;
    float _918 = in.m_79.z;
    int _920 = abs(_892);
    float _922 = fma(_866, _732, _888);
    int _924 = ~_844;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = _902 + 0.25;
    int _932 = _928;
    if (!_798)
    {
        int _934 = ~_844;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = _880 + 0.25;
    float _942 = floor(_902);
    bool _944 = !_856;
    int _946 = _944 ? 0 : 1;
    float _948 = fma(_704, _746, _882);
    float _950 = float(_910);
    float _952 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].x, _922);
    float _954 = float(_920);
    float _956 = _842 * 0.15915493667125701904296875;
    float _958 = float(_840);
    float _960 = -_912;
    float _962 = _880 + _960;
    float _964 = floor(_930);
    int _966 = abs(_946);
    float _968 = _954 * _950;
    float _970 = _880 * 6.283185482025146484375;
    float _972 = _952 * _894;
    bool _974 = _962 >= 0.5;
    bool _976 = isnan(_962);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.5);
    bool _982 = _978 || _980;
    float _984 = _968 * (-2.0);
    float _986 = -_942;
    float _988 = _902 + _986;
    float _990 = floor(_940);
    float _992 = _970 * 0.15915493667125701904296875;
    float _994 = fma(_522, _984, _522);
    float _996 = fma(_984, _916, _916);
    float _998 = _420 + (-0.5);
    int _1000 = abs(_770);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _742 + _1002;
    float _1006 = -_964;
    float _1008 = _930 + _1006;
    bool _1010 = _988 >= 0.5;
    bool _1012 = isnan(_988);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(0.5);
    bool _1018 = _1014 || _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1022 = _478 + _1020;
    float _1024 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].y, _996);
    float _1026 = float(_966);
    float _1028 = _992 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    float _1032 = _902 * 6.283185482025146484375;
    bool _1034 = !_982;
    float _1036 = _1034 ? 0.5 : (-0.5);
    float _1038 = -_990;
    float _1040 = _940 + _1038;
    float _1042 = _1022 * _1022;
    float _1044 = float(_1000);
    float _1046 = _1026 * _958;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1050 = _1048 * 2.0;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _754 + _1052;
    float _1056 = fma(_1004, _1004, _1042);
    bool _1058 = !_530;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _1044 * _1050;
    float _1064 = _1032 * 0.15915493667125701904296875;
    float _1066 = fma(_1054, _1054, _1056);
    int _1068 = abs(_516);
    float _1070 = fma(_994, _642, _1024);
    int _1072 = abs(_1060);
    float _1074 = _1046 * (-2.0);
    bool _1076 = !_1018;
    float _1078 = _1076 ? 0.5 : (-0.5);
    float _1080 = _1064 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    bool _1084 = _1040 > 0.5;
    float _1086 = fma(_812, _732, _852);
    float _1088 = float(_1072);
    float _1090 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1092 = _1090 * 2.0;
    float _1094 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1096 = float(_1068);
    float _1098 = _1070 * 0.15915493667125701904296875;
    float _1100 = rsqrt(_1066);
    bool _1102 = !_526;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = _1088 * _1092;
    int _1108 = abs(_740);
    float _1110 = fma(_1096, _1094, _1062);
    int _1112 = abs(_1104);
    float _1114 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1116 = _1040;
    float _1118 = _1008;
    if (_1084)
    {
        float _1120 = -_1040;
        float _1122 = _1120 + 1.0;
        _1116 = _1122;
    }
    float _1124 = _1116;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1128 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1130 = fma(_1124, 4.0, -1.0);
    float _1132 = float(_1112);
    float _1134 = _754 * _754;
    float _1136 = float(_1108);
    float _1138 = _1126 * _1100;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1142 = fma(_1132, _1128, _1106);
    bool _1144 = _1008 > 0.5;
    float _1146 = _1022 * _1138;
    float _1148 = fma(_1136, _1140, _1110);
    float _1150 = _1004 * _1138;
    int _1152 = abs(_828);
    float _1154 = -_1146;
    float _1156 = _1022 + _1154;
    float _1158 = fma(_1148, 3.1415927410125732421875, _914);
    float _1160 = -_1150;
    float _1162 = _1004 + _1160;
    bool _1164 = !_864;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = _1156 * _1156;
    float _1170 = fma(_1158, _1074, _1158);
    float _1172 = _1054 * _1138;
    float _1174 = _956 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1162, _1162, _1168);
    if (_1144)
    {
        float _1180 = -_1008;
        float _1182 = _1180 + 1.0;
        _1118 = _1182;
    }
    float _1184 = _1118;
    float _1186 = fma(_646, _1074, _646);
    int _1188 = abs(_1166);
    float _1190 = _432 + (-0.5);
    float _1192 = fma(_1184, 4.0, -1.0);
    float _1194 = float(_1152);
    float _1196 = -_1172;
    float _1198 = _1054 + _1196;
    float _1200 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1202 = float(_938);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1170);
    float _1206 = float(_1188);
    float _1208 = fma(_1194, _1200, _1142);
    float _1210 = in.m_81.y;
    float _1212 = fma(_1186, _642, _1204);
    float _1214 = _428 + (-0.5);
    float _1216 = _1206 * _1202;
    float _1218 = fma(_1208, 3.1415927410125732421875, _918);
    float _1220 = fma(_742, _742, _1134);
    float _1222 = fma(_1198, _1198, _1178);
    float _1224 = _1216 * (-2.0);
    float _1226 = _1212 * 0.15915493667125701904296875;
    float _1228 = sqrt(_1220);
    float _1230 = in.m_81.z;
    float _1232 = fma(_1218, _1224, _1218);
    float _1234 = fma(_554, _1224, _554);
    float _1236 = -_458;
    float _1238 = _1236 + 1.0;
    float _1240 = abs(_1176);
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1244 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1232);
    float _1246 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1086);
    float _1248 = sqrt(_1222);
    float _1250 = in.m_81.x;
    float _1252 = fma(_1234, _642, _1244);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1242);
    float _1256 = _1246 * _896;
    float _1258 = fma(_900, _732, _948);
    float _1260 = _1252 * 0.15915493667125701904296875;
    float _1262 = -_1254;
    float _1264 = _1262 + _1210;
    float _1266 = _1098 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1256 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1272 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1258);
    float _1274 = _698 + (-1.0);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1264);
    float _1278 = _1272 * _898;
    float _1280 = _1274 * _1228;
    float _1282 = _1098 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1100 * _1248;
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1230);
    float _1292 = _1280 * 0.75;
    float _1294 = _1270 * _1286;
    float _1296 = _1114 * _1286;
    float _1298 = _1288 * _1286;
    float _1300 = _1226 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1294 * _1276;
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1250);
    float _1308 = _1298 * _1290;
    float _1310 = _1296 * _1306;
    float _1312 = _1226 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1260 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1302 * _1284;
    float _1322 = _1302 * _1268;
    float _1324 = _1260 * 6.283185482025146484375;
    float _1326 = sin(_1324);
    float _1328 = _1314 * _1268;
    float _1330 = _1314 * _1284;
    float _1332 = _1302 * _1318;
    float _1334 = _1314 * _1318;
    float _1336 = _1284 * _1318;
    float _1338 = _1268 * _1318;
    float _1340 = _1332 * _1304;
    float _1342 = _1292 * 0.15915493667125701904296875;
    float _1344 = _1334 * _1304;
    float _1346 = fma(_1326, _1320, _1328);
    float _1348 = -_1322;
    float _1350 = fma(_1326, _1330, _1348);
    float _1352 = -_1330;
    float _1354 = fma(_1326, _1322, _1352);
    float _1356 = -_1304;
    float _1358 = _1326 * _1356;
    float _1360 = fma(_1346, _1310, _1340);
    float _1362 = fma(_1326, _1328, _1320);
    float _1364 = _1342 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1336, _1310, _1358);
    float _1370 = fma(_1354, _1308, _1360);
    float _1372 = fma(_1350, _1310, _1344);
    float _1374 = fma(_1338, _1308, _1368);
    float _1376 = _1370 * _356;
    float _1378 = fma(_1362, _1308, _1372);
    float _1380 = _1342 * 6.283185482025146484375;
    float _1382 = cos(_1380);
    float _1384 = _1370 * _360;
    float _1386 = fma(_1374, _340, _1376);
    float _1388 = _1370 * _352;
    float _1390 = fma(_1374, _348, _1384);
    float _1392 = fma(_1378, _368, _1386);
    float _1394 = fma(_1374, _330, _1388);
    float _1396 = fma(_1378, _372, _1390);
    float _1398 = _1392 * _1366;
    float _1400 = fma(_1378, _364, _1394);
    float _1402 = _1392 * _1382;
    float _1404 = -_1398;
    float _1406 = fma(_1396, _1382, _1404);
    float _1408 = fma(_1396, _1366, _1402);
    float _1410 = _754 + _1406;
    float _1412 = _478 + _1400;
    float _1414 = _742 + _1408;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1410 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1422 = _1414 + _1420;
    float _1424 = _1418 * _1418;
    float _1426 = fma(_1422, _1422, _1424);
    float _1428 = sqrt(_1426);
    bool _1430 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = 0.0;
    float _1434 = _1410;
    float _1436 = _1414;
    int _1438 = as_type<int>(_1406);
    float _1440 = _1246;
    if (!_1430)
    {
        _1432 = _1412;
    }
    float _1442 = _1432;
    bool _1444 = !_1430;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1428 + _1450;
        float _1454 = rsqrt(_1426);
        float _1456 = _1452 * _1448;
        float _1458 = _1412 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = _1456 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = fma(_1468, _1458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = _1454 * _1472;
        float _1478 = fma(_1412, _1464, _1474);
        float _1480 = fma(_1422, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1418, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1434 = _1482;
        _1436 = _1480;
        _1438 = as_type<int>(_1460);
        _1446 = _1478;
    }
    float _1484 = _1434;
    float _1486 = _1436;
    int _1488 = _1438;
    float _1490 = _1446;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1494 = _1484 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1498 = _1486 + _1496;
    float _1500 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1502 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5576 = float2(_1502, _1500);
    float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5576, float2(0.0), isnan(_5576)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5576, float2(0.0), isnan(_5576)), level(0.0)).x;
    float _1506 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1508 = -_1150;
    float _1510 = _742 + _1508;
    float _1512 = -_1172;
    float _1514 = _754 + _1512;
    float _1516 = fma(_1504, 100.0, _478);
    float _1518 = -_1146;
    float _1520 = _1518 + _1516;
    float _1522 = _1520 + _1506;
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1524);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1526);
    float _1532 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1528);
    float _1534 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1530);
    float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1538 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1540 = trunc(_1536);
    int _1542 = int(_1540);
    float _1544 = trunc(_1538);
    int _1546 = int(_1544);
    int _1548 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1550 = _1542 + _1548;
    int _1552 = _1550 + 1;
    bool _1554 = _1552 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1556 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1558 = _1546 + _1556;
    int _1560 = _1558 + 1;
    int _1562 = _1552 | _1560;
    bool _1564 = _1562 < 0;
    bool _1566 = _1564 || _1554;
    bool _1568 = _1560 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1570 = _1568 || _1566;
    int _1572 = _1552;
    int _1574 = _1560;
    int _1576 = _1562;
    int _1578 = _1488;
    float _1580 = _1486;
    float _1582 = _1484;
    float _1584 = _1522;
    if (!_1570)
    {
        int _1586 = _1560 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1588 = _1586 + _1552;
        _1572 = _1588;
    }
    int _1590 = _1572;
    float _1592 = _1534;
    if (!_1570)
    {
        float _1594 = floor(_1538);
        _1592 = _1594;
    }
    float _1596 = _1592;
    if (!_1570)
    {
        int _1598 = _1590 << 2;
        _1574 = _1598;
    }
    int _1600 = _1574;
    int _1602 = _1600;
    if (!_1570)
    {
        uint _1605 = uint(int(uint(_1590) >> uint(2)));
        _1576 = int(_1605);
    }
    int _1607 = _1576;
    if (!_1570)
    {
        int _1609 = 12 & _1600;
        _1602 = _1609;
    }
    int _1611 = _1602;
    if (!_1570)
    {
        int _1613 = _1607 << 4;
        int _1615 = _1613 + _1611;
        _1578 = _1615;
    }
    int _1617 = _1578;
    float _1619 = as_type<float>(_1611);
    if (!_1570)
    {
        float _1621 = floor(_1536);
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = as_type<float>(_1607);
    if (!_1570)
    {
        int _1627 = _1617 + 400;
        uint _1629 = uint(int(uint(_1627) >> uint(2)));
        uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
        int _1633 = int(_1629) & 3;
        float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
        _1625 = _1635;
    }
    float _1637 = _1625;
    if (!_1570)
    {
        float _1639 = -_1596;
        float _1641 = _1538 + _1639;
        _1440 = _1641;
    }
    float _1643 = _1440;
    float _1645 = _1623;
    if (!_1570)
    {
        float _1647 = -_1623;
        float _1649 = _1536 + _1647;
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = _1637;
    if (!_1570)
    {
        float _1655 = rint(_1637);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        uint _1661 = clamp(_1659, 0u, 65535u);
        _1653 = as_type<float>(_1661);
    }
    float _1663 = _1653;
    float _1665 = _1643;
    if (!_1570)
    {
        float3 _5850 = float3(_1651, _1643, float(as_type<int>(_1663)));
        float3 _5854 = select(_5850, float3(0.0), isnan(_5850));
        float _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5854.xy, uint(rint(_5854.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5854.xy, uint(rint(_5854.z)), level(0.0)).x;
        _1665 = _1667;
    }
    float _1669 = _1665;
    float _1671 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = -_478;
    float _1675 = _1673 + _1490;
    float _1677 = -_742;
    float _1679 = _1677 + _1486;
    float _1681 = -_754;
    float _1683 = _1681 + _1484;
    float _1685 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1687 = _1675 * _1675;
    float _1689 = fma(_1504, 100.0, _1490);
    float _1691 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1685);
    float _1693 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1695 = fma(_1679, _1679, _1687);
    float _1697 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1699 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1693);
    float _1701 = fma(_1683, _1683, _1695);
    float _1703 = 1.0 / _1697;
    float _1705 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1699);
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1709 = sqrt(_1701);
    float _1711 = _1707 + _1697;
    float _1713 = _1711 * _1703;
    float _1715 = _1713 * 0.5;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1719 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1717);
    float _1721 = 1.0 / _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1725 = _1721 * _1723;
    bool _1727 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1729 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1731 = !_1727;
    int _1733 = _1731 ? 0 : 1;
    int _1735 = 2;
    if (!_1727)
    {
        _1735 = 1;
    }
    int _1737 = _1735;
    int _1739 = _1737;
    if (!_1729)
    {
        _1739 = _1733;
    }
    int _1741 = _1739;
    bool _1743 = _1709 > 0.0;
    int _1745 = _1741 << 6;
    int _1747 = _1745 + 96;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = _1745 + 48;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    uint _1769 = uint(int(uint(int(_1767)) >> uint(2)));
    int _1771 = int(_1767) & 3;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[int(_1769)][_1771];
    int _1775 = int(_1767) + 1;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    int _1779 = _1775 & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    int _1783 = _1745 + 56;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
    int _1789 = int(_1785) & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    int _1793 = int(_1785) + 1;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    int _1797 = _1793 & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = _1745 + 64;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = _1745 + 72;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
    int _1825 = int(_1821) & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = int(_1821) + 1;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    int _1833 = _1829 & 3;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
    int _1837 = _1745 + 80;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
    int _1855 = _1745 + 88;
    uint _1857 = uint(int(uint(_1855) >> uint(2)));
    uint _1859 = uint(int(uint(int(_1857)) >> uint(2)));
    int _1861 = int(_1857) & 3;
    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[int(_1859)][_1861];
    int _1865 = int(_1857) + 1;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    int _1869 = _1865 & 3;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[int(_1867)][_1869];
    float _1873 = _1522 * _1763;
    float _1875 = fma(_1510, _1755, _1873);
    int _1877 = _1745 + 104;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = _1522 * _1781;
    float _1897 = _1781;
    if (!_1743)
    {
        _1897 = _1689;
    }
    float _1899 = _1897;
    bool _1901 = !_1743;
    float _1903 = _1899;
    float _1905 = _1835;
    if (!_1901)
    {
        float _1907 = _296 * _296;
        float _1909 = rsqrt(_1701);
        float _1911 = fma(_268, _268, _1907);
        float _1913 = fma(_304, _304, _1911);
        float _1915 = sqrt(_1913);
        float _1917 = _1679 * _1909;
        float _1919 = _1675 * _1909;
        float _1921 = _1683 * _1909;
        bool _1923 = _1915 > 0.0;
        float _1925 = _1909;
        if (!_1923)
        {
            _1925 = _1689;
        }
        float _1927 = _1925;
        bool _1929 = !_1923;
        _1903 = _1927;
        if (!_1929)
        {
            float _1931 = rsqrt(_1913);
            float _1933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1935 = _296 * _1931;
            float _1937 = _268 * _1931;
            float _1939 = _1919 * _1935;
            float _1941 = _304 * _1931;
            float _1943 = fma(_1917, _1937, _1939);
            float _1945 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1947 = fma(_1921, _1941, _1943);
            float _1949 = _1947 * _1945;
            float _1951 = fma(_268, _1949, _1486);
            float _1953 = fma(_296, _1949, _1689);
            float _1955 = fma(_304, _1949, _1484);
            _1580 = _1951;
            _1903 = _1953;
            _1582 = _1955;
        }
    }
    float _1957 = _1580;
    float _1959 = _1903;
    float _1961 = _1582;
    float _1963 = fma(_1514, _1885, _1875);
    bool _1965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1967 = isnan(0.5);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1973 = _1969 || _1971;
    float _1975 = _1522 * _1817;
    float _1977 = _1522 * _1853;
    float _1979 = _1963 + _1893;
    float _1981 = fma(_1510, _1773, _1895);
    float _1983 = fma(_1510, _1809, _1975);
    float _1985 = fma(_1510, _1845, _1977);
    float _1987 = 1.0 / _1979;
    float _1989 = fma(_1514, _1791, _1981);
    float _1991 = fma(_1514, _1827, _1983);
    float _1993 = fma(_1514, _1863, _1985);
    float _1995 = -_1150;
    float _1997 = _1995 + _1957;
    float _1999 = _1989 + _1799;
    float _2001 = -_1146;
    float _2003 = _2001 + _1959;
    float _2005 = -_1172;
    float _2007 = _2005 + _1961;
    float _2009 = _1991 + _1835;
    float _2011 = _1993 + _1871;
    float _2013 = _2003;
    float _2015 = _1997;
    float _2017 = _2007;
    float _2019 = _1999;
    float _2021 = _1985;
    bool _2023 = _1973;
    int _2025 = as_type<int>(_1961);
    if (!_1973)
    {
        float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2029 = _1520 + _2027;
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2033 = _1510 + _2031;
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2037 = -_754;
        float _2039 = _2037 + _1961;
        float _2041 = _2029 * _2029;
        float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2045 = _1514 + _2043;
        float _2047 = -_742;
        float _2049 = _2047 + _1957;
        float _2051 = fma(_2033, _2033, _2041);
        float _2053 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = fma(_2045, _2045, _2051);
        float _2057 = sqrt(_2055);
        float _2059 = 1.0 / _1286;
        float _2061 = _2053 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2063 = precise::min(_2057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2035;
        float _2067 = -_1516;
        float _2069 = _2067 + _1959;
        float _2071 = _2065 * _2059;
        float _2073 = _2061 * _2071;
        float _2075 = _2039 * _2071;
        float _2077 = fma(_2069, _2073, _1520);
        float _2079 = fma(_2049, _2073, _1510);
        float _2081 = fma(_2061, _2075, _1514);
        _2013 = _2077;
        _2015 = _2079;
        _2017 = _2081;
    }
    float _2083 = _2013;
    float _2085 = _2015;
    float _2087 = _2017;
    float _2089 = _1999 * _1987;
    float _2091 = _2009 * _1987;
    float _2093 = _2011 * _1987;
    if (_1570)
    {
        _2019 = 1.0;
    }
    float _2095 = _2019;
    float _2097 = _2095;
    if (!_1570)
    {
        int _2099 = _1590 << 4;
        int _2101 = _2099 + 2048;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        uint _2105 = uint(int(uint(int(_2103)) >> uint(2)));
        int _2107 = int(_2103) & 3;
        float _2109 = (*spvDescriptorSet0.vp_c15)._m0[int(_2105)][_2107];
        int _2111 = int(_2103) + 1;
        uint _2113 = uint(int(uint(_2111) >> uint(2)));
        int _2115 = _2111 & 3;
        float _2117 = (*spvDescriptorSet0.vp_c15)._m0[int(_2113)][_2115];
        int _2119 = _2101 + 8;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        int _2129 = int(_2121) + 1;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        int _2133 = _2129 & 3;
        float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
        float _2137 = _1522 * _2117;
        float _2139 = fma(_1510, _2109, _2137);
        float _2141 = fma(_1514, _2127, _2139);
        float _2143 = _2141 + _2135;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        float _2147 = -_2145;
        float _2149 = _2147 + _1669;
        float _2151 = fma(_2149, 500.0, 1.5);
        float _2153 = exp2(_2151);
        float _2155 = 0.0 + _2153;
        float _2157 = precise::clamp(_2155, 0.0, 1.0);
        _1584 = _2137;
        _2097 = _2157;
    }
    float _2159 = _1584;
    float _2161 = _2097;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2165 = _2083 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2085 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2173 = _2087 + _2171;
    float _2175 = _2165 * _2165;
    float _2177 = fma(_2169, _2169, _2175);
    float _2179 = fma(_2173, _2173, _2177);
    float _2181 = rsqrt(_2179);
    float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2185 = _2169 * _2183;
    float _2187 = _2173 * _2183;
    float _2189 = _2185 * _2185;
    float _2191 = _2187 * _2187;
    float _2193 = _2189 + _2191;
    float _2195 = sqrt(_2193);
    bool _2197 = _2195 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2201 = _2195 + _2199;
    float _2203 = _2181;
    float _2205 = _2201;
    float _2207 = _2165;
    float _2209 = _2159;
    if (_2197)
    {
        float _2211 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2203 = _2211;
    }
    float _2213 = _2203;
    if (_2197)
    {
        float _2215 = rsqrt(_2193);
        _1905 = _2215;
    }
    float _2217 = _1905;
    float _2219 = _2217;
    if (_2197)
    {
        float _2221 = _2201 * _2213;
        _2205 = _2221;
    }
    float _2223 = _2205;
    if (_2197)
    {
        float _2225 = _2223 * 0.15915493667125701904296875;
        _2021 = _2225;
    }
    float _2227 = _2021;
    float _2229 = _2173;
    float _2231 = _2227;
    if (_2197)
    {
        float _2233 = _2227 * 6.283185482025146484375;
        float _2235 = sin(_2233);
        _2229 = _2235;
    }
    float _2237 = _2229;
    float _2239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2241 = precise::max(0.0, _2239);
    float _2243 = _2213;
    float _2245 = _2241;
    if (_2197)
    {
        float _2247 = _2227 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = -_2183;
    float _2255 = -_2241;
    float _2257 = fma(_2165, _2253, _2255);
    if (_2197)
    {
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2207 = _2259;
    }
    float _2261 = _2207;
    float _2263 = _2261;
    if (!_2197)
    {
        _2231 = _2189;
    }
    float _2265 = _2231;
    float _2267 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2269 = _2237;
    float _2271 = _2265;
    if (_2197)
    {
        float _2273 = fma(_2237, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2263 = _2273;
    }
    float _2275 = _2263;
    float _2277 = _2275;
    if (!_2197)
    {
        _2269 = _2187;
    }
    float _2279 = _2269;
    float _2281 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2267);
    float _2283 = _2279;
    float _2285 = _2251;
    if (_2197)
    {
        float _2287 = _2251 + (-1.0);
        _2245 = _2287;
    }
    float _2289 = _2245;
    float _2291 = _2289;
    if (_2197)
    {
        float _2293 = _2217 * _2275;
        _2209 = _2293;
    }
    float _2295 = _2209;
    if (!_2197)
    {
        _2219 = _2185;
    }
    float _2297 = _2219;
    float _2299 = _2297;
    if (_2197)
    {
        float _2301 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (_2197)
    {
        float _2305 = _2185 * _2295;
        _2299 = _2305;
    }
    float _2307 = _2299;
    if (!_2197)
    {
        _2277 = _2257;
    }
    float _2309 = _2277;
    float _2311 = _2309;
    if (_2197)
    {
        float _2313 = _2187 * _2295;
        _2283 = _2313;
    }
    float _2315 = _2283;
    if (_2197)
    {
        float _2317 = fma(_2257, _2251, _2303);
        _2311 = _2317;
    }
    float _2319 = _2311;
    if (_2197)
    {
        float _2321 = _2307 * _2307;
        _2271 = _2321;
    }
    float _2323 = _2271;
    if (!_2197)
    {
        _2285 = _2191;
    }
    float _2325 = _2285;
    float _2327 = _2325;
    if (_2197)
    {
        float _2329 = _2315 * _2315;
        _2327 = _2329;
    }
    float _2331 = _2327;
    float _2333 = sqrt(_2179);
    float _2335 = fma(_2319, _2319, _2323);
    float _2337 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2339 = _2089 >= 0.0;
    float _2341 = _2335 + _2331;
    float _2343 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2345 = rsqrt(_2341);
    float _2347 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2343);
    bool _2349 = _2089 <= 1.0;
    bool _2351 = _2349 && _2339;
    float _2353 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2355 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2347);
    bool _2357 = _2091 >= 0.0;
    bool _2359 = _2357 && _2351;
    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2363 = fma(_2333, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2361);
    float _2365 = precise::clamp(_2363, 0.0, 1.0);
    float _2367 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2369 = floor(_2353);
    float _2371 = -_2365;
    float _2373 = _2371 + 1.0;
    bool _2375 = _2091 <= 1.0;
    bool _2377 = _2375 && _2359;
    float _2379 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2381 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2383 = _2345 * _2307;
    float _2385 = -_2379;
    float _2387 = fma(_2385, _2337, 1.0);
    float _2389 = _2345 * _2319;
    float _2391 = abs(_2373);
    float _2393 = log2(_2391);
    float _2395 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2397 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2399 = _2345 * _2315;
    float _2401 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2403 = -_2395;
    float _2405 = fma(_2389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2403);
    float _2407 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2397);
    float _2409 = -_2369;
    float _2411 = _2353 + _2409;
    float _2413 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2401);
    float _2415 = floor(_2381);
    float _2417 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2407);
    float _2419 = -_2399;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2405);
    float _2423 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2413);
    float _2425 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2281);
    float _2427 = _2417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2429 = _2423 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2431 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2433 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2435 = _2425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2437 = log2(_2387);
    float _2439 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2441 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2433);
    float _2443 = fma(_2421, -0.5, 0.5);
    float _2445 = fma(_2421, 0.5, 0.5);
    float _2447 = -_2415;
    float _2449 = _2381 + _2447;
    float _2451 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2441);
    float _2453 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2439);
    float _2455 = exp2(_2431);
    float _2457 = fma(_2445, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2451);
    float _2461 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2453);
    float _2463 = fma(_2445, _2457, -0.212114393711090087890625);
    float _2465 = sqrt(_2443);
    float _2467 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2469 = fma(_2445, _2463, 1.570728778839111328125);
    float _2471 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2467);
    float _2473 = _2467;
    if (_2377)
    {
        float _2475 = float(_1741);
        _2473 = _2475;
    }
    float _2477 = _2473;
    float _2479 = _2389 + 1.0;
    float _2481 = 1.0 / _2459;
    float _2483 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2471);
    float _2485 = -_2389;
    float _2487 = fma(_2455, _2479, _2485);
    float _2489 = _2437 * 0.693147182464599609375;
    float _2491 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2461);
    float _2493 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2483);
    float _2495 = fma(_2487, 0.5, 0.5);
    float _2497 = _2477;
    if (_2377)
    {
        float _2499 = rint(_2477);
        float _2501 = precise::max(_2499, 0.0);
        uint _2503 = uint(_2501);
        uint _2505 = clamp(_2503, 0u, 65535u);
        _2497 = as_type<float>(_2505);
    }
    float _2507 = _2497;
    float _2509 = _2465 * 0.636619746685028076171875;
    float _2511 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7226 = float2(_2411, _2449);
    float _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7226, float2(0.0), isnan(_7226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7226, float2(0.0), isnan(_7226)), level(0.0)).x;
    float _2515 = -_2469;
    float _2517 = fma(_2509, _2515, 1.0);
    float _2519 = _2491 * _2481;
    float _2521 = _2493 * _2481;
    float _2523 = fma(_2519, 0.5, 0.5);
    float _2525 = fma(_2521, -0.5, 0.5);
    float _2527 = _2463;
    if (_2377)
    {
        float3 _7255 = float3(_2089, _2091, float(as_type<int>(_2507)));
        float3 _7257 = select(_7255, float3(0.0), isnan(_7255));
        float _2529 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7257.xy, uint(rint(_7257.z)), _2093, level(0.0));
        _2527 = _2529;
    }
    float _2531 = _2527;
    float3 _7267 = float3(_2523, _2525, _2511);
    float _2533 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7267, float3(0.0), isnan(_7267)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7267, float3(0.0), isnan(_7267)), level(0.0)).x;
    float3 _7276 = float3(_2523, _2525, _2511);
    float4 _2536 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7276, float3(0.0), isnan(_7276)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7276, float3(0.0), isnan(_7276)), level(0.0)).xyzw;
    float _2538 = _2536.x;
    float _2540 = _2536.y;
    float _2542 = _2536.z;
    float _2544 = _2536.w;
    float2 _7292 = float2(_2517, _2495);
    float3 _2548 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7292, float2(0.0), isnan(_7292)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7292, float2(0.0), isnan(_7292)), level(0.0)).xyz;
    float _2550 = _2548.x;
    float _2552 = _2548.y;
    float _2554 = _2548.z;
    float _2556 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2560 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2562 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2564 = _2556 * _432;
    bool _2566 = _428 > 0.5;
    float _2568 = _2560 * _432;
    float _2570 = in.m_83.x;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2574 = _2572 != 0;
    float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2580 = _2578 != 0;
    float _2582 = in.m_83.y;
    bool _2584 = _420 > 0.5;
    float _2586 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2562);
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2590 = _2588 != 0;
    out.m_85.x = _2085;
    out.m_85.y = _2083;
    out.m_85.z = _2087;
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2594 = trunc(_2564);
    int _2596 = int(_2594);
    float _2598 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2586);
    float _2600 = _1689;
    bool _2602 = _2590;
    if (_2574)
    {
        float _2604 = in.m_73.z;
        _2600 = _2604;
    }
    float _2606 = _2600;
    float _2608 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2598);
    if (_2580)
    {
        bool _2610 = _432 > 0.5;
        _2023 = _2610;
    }
    bool _2612 = _2023;
    float _2614 = trunc(_2568);
    int _2616 = int(_2614);
    float _2618 = _2608 + _2459;
    float _2620 = _2618 * 0.5;
    float _2622 = _2570;
    if (_2580)
    {
        float _2624 = -_2570;
        float _2626 = _2624 + 1.0;
        _2025 = as_type<int>(_2626);
    }
    int _2628 = _2025;
    int _2630 = _2596 << 4;
    int _2632 = _2630 + 1968;
    float _2634 = -_2582;
    float _2636 = _2634 + 1.0;
    float _2638 = as_type<float>(_2596);
    float _2640 = _2582;
    if (!_2580)
    {
        _2638 = _2570;
    }
    float _2642 = _2638;
    uint _2644 = uint(int(uint(_2632) >> uint(2)));
    uint _2646 = uint(int(uint(int(_2644)) >> uint(2)));
    int _2648 = int(_2644) & 3;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[int(_2646)][_2648];
    int _2652 = int(_2644) + 1;
    uint _2654 = uint(int(uint(_2652) >> uint(2)));
    int _2656 = _2652 & 3;
    float _2658 = (*spvDescriptorSet0.vp_c9)._m0[int(_2654)][_2656];
    float _2660 = _2642;
    if (_2580)
    {
        float _2662 = _2612 ? as_type<float>(_2628) : _2570;
        _2660 = _2662;
    }
    float _2664 = _2660;
    int _2666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2668 = _2666 != 0;
    int _2670 = _2616 << 4;
    int _2672 = _2670 + 1712;
    int _2674 = _2566 ? as_type<int>(_2636) : as_type<int>(_2582);
    int _2676 = _2632 + 8;
    uint _2678 = uint(int(uint(_2676) >> uint(2)));
    uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
    int _2682 = int(_2678) & 3;
    float _2684 = (*spvDescriptorSet0.vp_c9)._m0[int(_2680)][_2682];
    bool _2686 = _430 > 0.5;
    float _2688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2692 = _2690 != 0;
    int _2694 = _2584 ? as_type<int>(_2636) : as_type<int>(_2582);
    float _2696 = _2590 ? as_type<float>(_2674) : _2582;
    int _2698 = _2672 + 8;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    uint _2702 = uint(int(uint(int(_2700)) >> uint(2)));
    int _2704 = int(_2700) & 3;
    float _2706 = (*spvDescriptorSet0.vp_c9)._m0[int(_2702)][_2704];
    float _2708 = _2692 ? as_type<float>(_2694) : _2582;
    int _2710 = _2694;
    float _2712 = _2606;
    float _2714 = _2664;
    if (_2574)
    {
        float _2716 = -_2570;
        float _2718 = _2716 + 1.0;
        _2710 = as_type<int>(_2718);
    }
    int _2720 = _2710;
    int _2722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2724 = _2722 != 0;
    float _2726 = fma(_2696, _2592, -0.5);
    if (_2668)
    {
        float _2728 = _2686 ? _2636 : _2582;
        _2640 = _2728;
    }
    float _2730 = _2640;
    float _2732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2734 = -_1254;
    float _2736 = -_1210;
    bool _2738 = _2734 != _2736;
    bool _2740 = isnan(_2734);
    bool _2742 = _2738 || _2740;
    bool _2744 = isnan(_2736);
    bool _2746 = _2742 || _2744;
    uint _2748 = uint(int(uint(_2672) >> uint(2)));
    uint _2750 = uint(int(uint(int(_2748)) >> uint(2)));
    int _2752 = int(_2748) & 3;
    float _2754 = (*spvDescriptorSet0.vp_c9)._m0[int(_2750)][_2752];
    int _2756 = int(_2748) + 1;
    uint _2758 = uint(int(uint(_2756) >> uint(2)));
    int _2760 = _2756 & 3;
    float _2762 = (*spvDescriptorSet0.vp_c9)._m0[int(_2758)][_2760];
    float _2764 = -_636;
    float _2766 = fma(_628, _2726, _2764);
    int _2768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2770 = _2766;
    if (_2574)
    {
        bool _2772 = _2606 > 0.5;
        _2602 = _2772;
    }
    bool _2774 = _2602;
    float _2776 = _2730 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_2574)
    {
        _2712 = _2570;
    }
    float _2778 = _2712;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2782 = _2778;
    if (_2574)
    {
        float _2784 = _2774 ? as_type<float>(_2720) : _2570;
        _2782 = _2784;
    }
    float _2786 = _2782;
    float _2788 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2790 = in.m_87.x;
    float _2792 = in.m_87.y;
    float _2794 = in.m_87.z;
    bool _2796 = _1250 == 0.0;
    bool _2798 = !_2746;
    bool _2800 = _2796 && _2798;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2804 = _1230 == 0.0;
    bool _2806 = _2804 && _2800;
    float _2808 = _2658 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_2724)
    {
        float _2812 = -_2570;
        float _2814 = _2812 + 1.0;
        _2768 = as_type<int>(_2814);
    }
    int _2816 = _2768;
    float _2818 = _2650 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2820 = _2808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2724)
    {
        float _2822 = _2584 ? as_type<float>(_2816) : _2570;
        _2622 = _2822;
    }
    float _2824 = _2622;
    float _2826 = _2688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2828 = _2818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2830 = fma(_2826, _2824, -0.5);
    float _2832 = _2706 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2834 = _2684 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2836 = fma(_626, _2830, _634);
    float _2838 = in.m_89.x;
    float _2840 = in.m_89.y;
    float _2842 = in.m_89.z;
    float _2844 = in.m_89.w;
    float _2846 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2848 = _2834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2850 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2852 = _2850;
    float _2854 = _2848;
    if (_2806)
    {
        _2714 = _2792;
    }
    float _2856 = _2714;
    float _2858 = _2754 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2860 = _2762 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_91.x = _2828;
    out.m_91.y = _2820;
    out.m_91.z = _2848;
    float _2862 = _2856;
    if (_2806)
    {
        _638 = _2790;
    }
    float _2864 = _638;
    float _2866 = _2858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2868 = _2860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2870 = _2864;
    if (!_2806)
    {
        float _2872 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2790);
        _2870 = _2872;
    }
    float _2874 = _2870;
    out.m_93.x = _2866;
    out.m_93.y = _2868;
    out.m_93.z = _2846;
    out.m_93.w = _2810;
    float _2876 = _2786 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2878 = _2836 + 0.5;
    float _2880 = _2876 * _2576;
    float _2882 = _2850 * _2802;
    float _2884 = _2766 + 0.5;
    if (_2806)
    {
        _2770 = _2794;
    }
    float _2886 = _2770;
    float _2888 = _2776 * _2732;
    float _2890 = _2886;
    if (_2806)
    {
        _2852 = _2856;
    }
    float _2892 = _2852;
    float _2894 = _2788 * _2780;
    float _2896 = _2892;
    if (!_2806)
    {
        _2862 = _2792;
    }
    float _2898 = _2862;
    out.m_95.x = _2878;
    out.m_95.y = _2884;
    if (_2806)
    {
        _2854 = _2886;
    }
    float _2900 = _2854;
    float _2902 = _2900;
    if (!_2806)
    {
        _2890 = _2794;
    }
    float _2904 = _2890;
    if (!_2806)
    {
        float _2906 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2898);
        _2896 = _2906;
    }
    float _2908 = _2896;
    float _2910 = _2842 * _2790;
    float _2912 = _2838 * _2898;
    out.m_97.x = _2882;
    out.m_97.y = _2894;
    out.m_97.z = _2880;
    out.m_97.w = _2888;
    float _2914 = _2840 * _2904;
    float _2916 = -_2910;
    float _2918 = fma(_2838, _2904, _2916);
    if (!_2806)
    {
        float _2920 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2904);
        _2902 = _2920;
    }
    float _2922 = _2902;
    float _2924 = -_2912;
    float _2926 = fma(_2840, _2790, _2924);
    float _2928 = -_2914;
    float _2930 = fma(_2842, _2898, _2928);
    float _2932 = _2918 * _2844;
    float _2934 = -_2908;
    float _2936 = _1326 * _2934;
    float _2938 = _2926 * _2844;
    float _2940 = _2930 * _2844;
    float _2942 = _1332 * _2932;
    float _2944 = fma(_1336, _2874, _2936);
    float _2946 = -_2840;
    float _2948 = _1326 * _2946;
    float _2950 = -_2932;
    float _2952 = _1326 * _2950;
    float _2954 = _1332 * _2908;
    float _2956 = _1334 * _2908;
    float _2958 = fma(_1336, _2838, _2948);
    float _2960 = fma(_1336, _2940, _2952);
    float _2962 = _1332 * _2840;
    float _2964 = _1334 * _2840;
    float _2966 = _1334 * _2932;
    float _2968 = fma(_1346, _2874, _2954);
    float _2970 = fma(_1346, _2940, _2942);
    float _2972 = fma(_1346, _2838, _2962);
    float _2974 = fma(_1350, _2874, _2956);
    float _2976 = fma(_1350, _2838, _2964);
    float _2978 = fma(_1350, _2940, _2966);
    float _2980 = fma(_1354, _2922, _2968);
    float _2982 = fma(_1354, _2938, _2970);
    float _2984 = fma(_1354, _2842, _2972);
    float _2986 = fma(_1338, _2922, _2944);
    float _2988 = fma(_1338, _2842, _2958);
    float _2990 = fma(_1362, _2922, _2974);
    float _2992 = fma(_1362, _2842, _2976);
    float _2994 = fma(_1338, _2938, _2960);
    float _2996 = fma(_1362, _2938, _2978);
    float _2998 = _2980 * _356;
    float _3000 = _2980 * _352;
    float _3002 = _2980 * _360;
    float _3004 = _2982 * _360;
    float _3006 = _2984 * _356;
    float _3008 = _2984 * _352;
    float _3010 = _2982 * _352;
    float _3012 = _2984 * _360;
    float _3014 = fma(_2994, _348, _3004);
    float _3016 = fma(_2988, _330, _3008);
    float _3018 = fma(_2994, _330, _3010);
    float _3020 = fma(_2988, _348, _3012);
    float _3022 = fma(_2988, _340, _3006);
    float _3024 = fma(_2986, _330, _3000);
    float _3026 = fma(_2996, _372, _3014);
    float _3028 = fma(_2986, _348, _3002);
    float _3030 = fma(_2992, _364, _3016);
    float _3032 = fma(_2992, _372, _3020);
    float _3034 = fma(_2990, _364, _3024);
    float _3036 = fma(_2990, _372, _3028);
    float _3038 = _2982 * _356;
    float _3040 = abs(_1725);
    float _3042 = log2(_3040);
    float _3044 = fma(_2996, _364, _3018);
    float _3046 = fma(_2994, _340, _3038);
    float _3048 = fma(_2986, _340, _2998);
    float _3050 = fma(_2992, _368, _3022);
    float _3052 = in.m_99.x;
    float _3054 = fma(_2996, _368, _3046);
    float _3056 = fma(_2990, _368, _3048);
    float _3058 = in.m_99.y;
    bool _3060 = _1725 <= 8000.0;
    bool _3062 = isnan(_1725);
    bool _3064 = _3060 || _3062;
    bool _3066 = isnan(8000.0);
    bool _3068 = _3064 || _3066;
    float _3070 = float(_3068);
    out.m_101.x = _3054;
    out.m_101.y = _3044;
    out.m_101.z = _3026;
    float _3072 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3074 = in.m_99.z;
    float _3076 = exp2(_3072);
    float _3078 = in.m_99.w;
    out.m_103.x = _3050;
    out.m_103.y = _3030;
    out.m_103.z = _3032;
    out.m_105.x = _3052;
    out.m_105.y = _3058;
    float _3080 = fma(_3076, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3082 = precise::clamp(_3080, 0.0, 1.0);
    float _3084 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_107.x = _3056;
    out.m_107.y = _3034;
    out.m_107.z = _3036;
    float _3086 = fma(_3082, -2.0, 3.0);
    float _3088 = _3082 * _3082;
    float _3090 = exp2(_3084);
    out.m_105.z = _3074;
    float _3092 = _3088 * _3086;
    out.m_105.w = _3078;
    float _3094 = -_3092;
    float _3096 = _3094 + 1.0;
    out.gl_Position.x = _2491;
    out.gl_Position.y = _2493;
    out.gl_Position.z = _2608;
    out.gl_Position.w = _2459;
    float _3098 = fma(_3096, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3092);
    float _3100 = _3070 * _3098;
    float _3102 = _3070;
    if (!_2377)
    {
        _3102 = 1.0;
    }
    float _3104 = _3102;
    float _3106 = -_3090;
    float _3108 = _3106 + 1.0;
    out.m_109.z = _2620;
    out.m_109.w = _2459;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3112 = _3108 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3114 = -_2513;
    float _3116 = _3114 + 1.0;
    float _3118 = _3116 * _3110;
    float _3120 = precise::clamp(_3118, 0.0, 1.0);
    float _3122 = _3104;
    float _3124 = _2533;
    if (_2377)
    {
        bool _3126 = _2531 >= _2093;
        bool _3128 = isnan(_2531);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan(_2093);
        bool _3134 = _3130 || _3132;
        float _3136 = float(_3134);
        _3122 = _3136;
    }
    float _3138 = _3122;
    float _3140 = _3112 * _2533;
    float _3142 = -_3112;
    float _3144 = _3142 + 1.0;
    bool _3146 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3148 = isnan(_2333);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3154 = _3150 || _3152;
    float _3156 = _3138 * _2161;
    float _3158 = -_3120;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3162 = _2544 * _3140;
    float _3164 = _2554 * _3140;
    float _3166 = _2544 * _3144;
    float _3168 = -_3156;
    float _3170 = fma(_3168, _3160, 1.0);
    float _3172 = precise::clamp(_3170, 0.0, 1.0);
    float _3174 = fma(_2550, _3162, _2538);
    float _3176 = fma(_2552, _3162, _2540);
    float _3178 = fma(_2544, _3164, _2542);
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3182 = _3140;
    float _3184 = _3164;
    float _3186 = _3160;
    float _3188 = _3162;
    float _3190 = _3172;
    if (!_3154)
    {
        _3182 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3192 = _3182;
    out.m_111.x = _3174;
    out.m_111.y = _3176;
    out.m_111.z = _3178;
    out.m_111.w = _3166;
    float _3194 = _3192;
    float _3196 = _3192;
    if (!_3154)
    {
        _3184 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3198 = _3184;
    float _3200 = _3198;
    float _3202 = _3198;
    if (!_3154)
    {
        _3124 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3204 = _3124;
    out.m_113.x = _3180;
    float _3206 = _3204;
    float _3208 = _3204;
    if (!_3154)
    {
        _3186 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3210 = _3186;
    float _3212 = _3210;
    float _3214 = _3210;
    if (!_3154)
    {
        _3188 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3216 = _3188;
    float _3218 = _3216;
    float _3220 = _3216;
    if (!_3154)
    {
        _3190 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3222 = _3190;
    bool _3224 = !_3154;
    float _3226 = _3222;
    float _3228 = _3222;
    if (!_3224)
    {
        bool _3230 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3232 = isnan(_2333);
        bool _3234 = _3230 || _3232;
        bool _3236 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3238 = _3234 || _3236;
        if (!_3238)
        {
            float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3242 = _2333 + _3240;
            float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3246 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3244;
            float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3252 = 1.0 / _3246;
            float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3258 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3266 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3268 = _3266 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3270 = _3242 * _3252;
            float _3272 = precise::clamp(_3270, 0.0, 1.0);
            float _3274 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3276 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3278 = fma(_3272, _3250, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3280 = fma(_3272, _3276, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3282 = fma(_3272, _3256, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3284 = fma(_3272, _3260, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3286 = fma(_3272, _3264, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3288 = fma(_3272, _3268, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3202 = _3278;
            _3220 = _3286;
            _3196 = _3282;
            _3214 = _3284;
            _3208 = _3280;
            _3228 = _3288;
            _3290 = true;
        }
        else
        {
            bool _3292 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3294 = isnan(_2333);
            bool _3296 = _3292 || _3294;
            bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3300 = _3296 || _3298;
            if (!_3300)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3302 = _3194;
            _3196 = _3302;
            if (!_3300)
            {
                _3200 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3304 = _3200;
            _3202 = _3304;
            if (!_3300)
            {
                _3206 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3306 = _3206;
            _3208 = _3306;
            if (!_3300)
            {
                _3212 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3308 = _3212;
            _3214 = _3308;
            if (!_3300)
            {
                _3218 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3310 = _3218;
            _3220 = _3310;
            if (!_3300)
            {
                _3226 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3312 = _3226;
            bool _3314 = !_3300;
            _3228 = _3312;
            if (!_3314)
            {
                bool _3316 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3318 = isnan(_2333);
                bool _3320 = _3316 || _3318;
                bool _3322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3324 = _3320 || _3322;
                if (!_3324)
                {
                    float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3328 = _2333 + _3326;
                    float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3332 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3330;
                    float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3338 = 1.0 / _3332;
                    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3356 = _3328 * _3338;
                    float _3358 = precise::clamp(_3356, 0.0, 1.0);
                    float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3362 = _3360 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3364 = fma(_3358, _3336, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3366 = fma(_3358, _3362, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3368 = fma(_3358, _3342, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3370 = fma(_3358, _3346, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3372 = fma(_3358, _3350, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3374 = fma(_3358, _3354, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3202 = _3364;
                    _3220 = _3372;
                    _3196 = _3368;
                    _3214 = _3370;
                    _3208 = _3366;
                    _3228 = _3374;
                    _3290 = true;
                }
                else
                {
                    _3202 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3220 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3214 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3208 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3228 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3290 = false;
    float _3376 = _3202;
    float _3378 = _3220;
    float _3380 = _3196;
    float _3382 = _3214;
    float _3384 = _3208;
    float _3386 = _3228;
    float _3388 = fma(_3034, -0.5, 0.5);
    float _3390 = precise::clamp(_3388, 0.0, 1.0);
    float _3392 = -_3376;
    float _3394 = _3392 + _3378;
    float _3396 = -_3380;
    float _3398 = _3396 + _3382;
    float _3400 = -_3384;
    float _3402 = _3400 + _3386;
    bool _3404 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3406 = fma(_3390, _3394, _3376);
    float _3408 = fma(_3390, _3398, _3380);
    float _3410 = fma(_3390, _3402, _3384);
    float _3412 = _3406 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3414 = fma(_3408, 0.298911988735198974609375, _3412);
    float _3416 = fma(_3410, 0.114477999508380889892578125, _3414);
    out.m_115.x = 0.0;
    float _3418 = -_3416;
    float _3420 = _3408 + _3418;
    float _3422 = -_3416;
    float _3424 = _3406 + _3422;
    float _3426 = -_3416;
    float _3428 = _3410 + _3426;
    float _3430 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3432 = fma(_3420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    float _3434 = fma(_3424, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    float _3436 = fma(_3428, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    out.m_113.w = _3430;
    out.m_117.x = _3432;
    out.m_117.y = _3434;
    out.m_117.z = _3436;
    if (!_3404)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3438 = -_2083;
    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3442 = -_2085;
    float _3444 = _3442 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3446 = -_2087;
    float _3448 = _3446 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3450 = _3440 * _3440;
    float _3452 = fma(_3444, _3444, _3450);
    float _3454 = fma(_3448, _3448, _3452);
    float _3456 = sqrt(_3454);
    float _3458 = rsqrt(_3454);
    float _3460 = -_3456;
    float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3464 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3466 = precise::clamp(_3464, 0.0, 1.0);
    float _3468 = _3444 * _3458;
    float _3470 = _3440 * _3458;
    float _3472 = abs(_3466);
    float _3474 = log2(_3472);
    float _3476 = _3448 * _3458;
    float _3478 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3480 = _3034 * _3470;
    float _3482 = -_3470;
    float _3484 = -_3478;
    float _3486 = fma(_3482, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3484);
    float _3488 = fma(_3056, _3468, _3480);
    float _3490 = -_3476;
    float _3492 = fma(_3490, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3486);
    float _3494 = fma(_3036, _3476, _3488);
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3500 = _3492 + _3498;
    float _3502 = _3474 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3504 = _3500 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3506 = precise::clamp(_3504, 0.0, 1.0);
    float _3508 = exp2(_3502);
    float _3510 = _3508 * _3506;
    float _3512 = _3496 * _3510;
    float _3514 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3516 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3518 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_115.x = _3514;
    out.m_115.y = _3516;
    out.m_115.z = _3518;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_117 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3290 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _131 = in.m_58.w;
    float _133 = trunc(_131);
    int _136 = int(_133);
    bool _140 = _136 >= 1;
    float _142 = 0.0;
    float _144 = as_type<float>(_136);
    if (!_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _142;
    if (!_140)
    {
        out.m_61.x = 0.0;
    }
    int _148 = 0;
    if (!_140)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    int _154 = _152;
    if (!_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3576 = as_type<float>(_152);
        out.gl_Position.z = _3576;
    }
    if (!_140)
    {
        return out;
    }
    float _156 = in.m_63.w;
    float _158 = float(_136);
    float _160 = -_156;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _164 = _156 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _172 = _168 || _170;
    bool _174 = _162 >= _158;
    bool _176 = !_172;
    bool _178 = _174 || _176;
    float _180 = _162;
    if (_178)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _144;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _154 = as_type<int>(_184);
    }
    int _186 = _154;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3640 = as_type<float>(_186);
        out.gl_Position.z = _3640;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    float _194 = 1.0 / _158;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_67.x;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = in.m_71.x;
    float _212 = in.m_71.y;
    float _214 = in.m_71.z;
    float _216 = _188 * _188;
    float _218 = _190 * _190;
    float _220 = _192 * _192;
    float _222 = fma(_198, _198, _216);
    float _224 = fma(_200, _200, _218);
    float _226 = fma(_202, _202, _220);
    float _228 = fma(_204, _204, _222);
    float _230 = fma(_206, _206, _224);
    float _232 = fma(_208, _208, _226);
    float _234 = sqrt(_228);
    float _236 = sqrt(_230);
    float _238 = sqrt(_232);
    bool _240 = _234 > 0.0;
    bool _242 = _236 > 0.0;
    float _244 = _200 * _212;
    float _246 = fma(_198, _210, _244);
    float _248 = _228;
    float _250 = _230;
    float _252 = _234;
    if (_240)
    {
        float _254 = rsqrt(_228);
        _248 = _254;
    }
    float _256 = _248;
    float _258 = 0.0;
    if (!_240)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    bool _262 = _238 > 0.0;
    float _264 = _190 * _212;
    float _266 = _206 * _212;
    float _268 = fma(_202, _214, _246);
    float _270 = 0.0;
    float _272 = _260;
    if (!_242)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _274;
    if (_242)
    {
        float _280 = rsqrt(_230);
        _276 = _280;
    }
    float _282 = _276;
    float _284 = fma(_188, _210, _264);
    float _286 = fma(_204, _210, _266);
    float _288 = 0.0;
    float _290 = _284;
    if (!_240)
    {
        _288 = 0.0;
    }
    float _292 = _288;
    float _294 = _162 * _194;
    float _296 = fma(_192, _214, _284);
    float _298 = 0.0;
    float _300 = _292;
    if (!_240)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = fma(_208, _214, _286);
    float _306 = 0.0;
    float _308 = _302;
    if (_262)
    {
        float _310 = rsqrt(_232);
        _306 = _310;
    }
    float _312 = _306;
    if (!_262)
    {
        _250 = 0.0;
        _290 = 0.0;
    }
    float _314 = _250;
    float _316 = _290;
    float _318 = 0.0;
    float _320 = _316;
    float _322 = _314;
    if (!_242)
    {
        _318 = 0.0;
    }
    float _324 = _318;
    float _326 = _324;
    if (_240)
    {
        float _328 = _256 * _188;
        _272 = _328;
    }
    float _330 = _272;
    float _332 = 0.0;
    if (!_242)
    {
        _332 = 0.0;
    }
    float _334 = _332;
    float _336 = _334;
    if (_240)
    {
        float _338 = _256 * _198;
        _300 = _338;
    }
    float _340 = _300;
    if (!_262)
    {
        _252 = 0.0;
    }
    float _342 = _252;
    float _344 = _342;
    if (_240)
    {
        float _346 = _256 * _204;
        _308 = _346;
    }
    float _348 = _308;
    if (_242)
    {
        float _350 = _282 * _190;
        _278 = _350;
    }
    float _352 = _278;
    if (_242)
    {
        float _354 = _282 * _200;
        _326 = _354;
    }
    float _356 = _326;
    if (_242)
    {
        float _358 = _282 * _206;
        _336 = _358;
    }
    float _360 = _336;
    if (_262)
    {
        float _362 = _312 * _192;
        _320 = _362;
    }
    float _364 = _320;
    if (_262)
    {
        float _366 = _312 * _202;
        _344 = _366;
    }
    float _368 = _344;
    if (_262)
    {
        float _370 = _312 * _208;
        _322 = _370;
    }
    float _372 = _322;
    bool _374 = !_196;
    float _392;
    if (!_374)
    {
        float _376 = in.m_73.x;
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _380 = _376 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _294;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_58.x;
    float _400 = in.m_58.y;
    float _402 = in.m_58.z;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _406 = -_294;
    float _408 = _406 + 1.0;
    float _410 = in.m_75.y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _396 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = in.m_73.y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _418;
    float _428 = in.m_73.z;
    float _430 = in.m_73.w;
    float _432 = in.m_73.x;
    float _434 = _294 * _404;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _408 * _404;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = 1.0 / _424;
    float _444 = in.m_67.w;
    bool _446 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_396);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = precise::min(_436, _440);
    float _460 = _200 * _400;
    float _462 = _206 * _400;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _464;
    float _468 = fma(_198, _398, _460);
    float _470 = fma(_204, _398, _462);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _396 + _472;
    float _476 = fma(_202, _402, _468);
    float _478 = _400 + _410;
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _494 = _492 != 0;
    float _496 = fma(_208, _402, _470);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = _474 * _426;
    float _504 = _420 + _428;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = _396 + _506;
    float _510 = 1.0 / _466;
    float _512 = _504 + (-1.0);
    bool _514 = !_486;
    int _516 = _514 ? 0 : 1;
    float _518 = _432 + _428;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _522 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _534 = _532 != 0;
    float _536 = _414 * _442;
    float _538 = _482 * _162;
    float _540 = _518 + (-1.0);
    float _542 = _512;
    float _544 = _482;
    if (_500)
    {
        _542 = _420;
    }
    float _546 = _542;
    float _548 = exp2(_538);
    float _550 = _546;
    if (!_500)
    {
        _550 = _432;
    }
    float _552 = _550;
    float _554 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_500)
    {
        _544 = _432;
    }
    float _556 = _544;
    float _558 = _508 * _510;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _566 = in.m_69.w;
    float _568 = _556;
    if (!_500)
    {
        _568 = _428;
    }
    float _570 = _568;
    float _572 = 1.0 / _562;
    float _574 = fma(_564, -2.0, _520);
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _578 = _570 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _580 = -_548;
    float _582 = _580 + 1.0;
    bool _584 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _592 = _588 || _590;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _610 = -_576;
    float _612 = fma(_578, 2.0, _610);
    float _614 = _432 + _420;
    float _616 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[88].z, _594);
    float _618 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[88].w, _606);
    float _620 = fma(_608, _420, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _622 = _604 ? _582 : 0.0;
    float _624 = _614 + (-1.0);
    float _626 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _616);
    float _628 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _618);
    float _630 = _620 * _162;
    float _632 = -_162;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[86].x, _612);
    float _636 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _574);
    float _638 = _626;
    if (_592)
    {
        float _640 = _622 * _572;
        _180 = _640;
    }
    float _642 = _180;
    float _644 = _428 * 2.0;
    float _646 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _656 = floor(_644);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _658;
    float _662 = fma(_650, _502, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _664;
    bool _668 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _670 = isnan(_396);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _684 = _420 * 2.0;
    float _686 = fma(_660, _502, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _692 = fma(_666, _502, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _694 = -_678;
    float _696 = _694 + 1.0;
    float _698 = _432 * 2.0;
    float _700 = fma(_682, _536, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _702 = fma(_654, _536, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _704 = fma(_690, _536, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _706 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _708 = isnan(_396);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = floor(_684);
    bool _720 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_396);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _456 * _696;
    float _734 = -_456;
    float _736 = _734 + 1.0;
    bool _738 = !_494;
    int _740 = _738 ? 0 : 1;
    float _742 = _476 + _444;
    bool _744 = _656 > 0.0;
    float _746 = _730 * _736;
    float _748 = floor(_698);
    float _750 = -_730;
    float _752 = _750 + 1.0;
    float _754 = _496 + _566;
    bool _756 = _656 >= 0.0;
    bool _758 = isnan(_656);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = _716 * _752;
    bool _768 = !_490;
    int _770 = _768 ? 0 : 1;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _772;
    float _776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _778 = _686 * _766;
    int _780 = _764 ? 0 : 1;
    float _782 = _642 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _784 = _718 >= 0.0;
    bool _786 = isnan(_718);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _662 * _766;
    float _796 = _692 * _766;
    bool _798 = _718 > 0.0;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _802 = _748 >= 0.0;
    bool _804 = isnan(_748);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = fma(_774, _558, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _814 = _642 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _816 = ~_780;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = -_716;
    float _824 = _822 + 1.0;
    bool _826 = !_534;
    int _828 = _826 ? 0 : 1;
    float _830 = _782 * _776;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    int _834 = _820;
    if (!_744)
    {
        int _836 = ~_780;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = fma(_432, 6.283185482025146484375, _630);
    int _844 = _792 ? 0 : 1;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _846;
    int _850 = _810 ? 0 : 1;
    float _852 = fma(_702, _746, _832);
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _860 = _858 != 0;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _864 = _862 != 0;
    float _866 = fma(_848, _558, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _868 = _748 > 0.0;
    float _870 = _814 * _800;
    float _872 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _778);
    int _874 = ~_850;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[203].x, _830);
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _884;
    float _888 = fma(_700, _746, _872);
    bool _890 = !_860;
    int _892 = _890 ? 0 : 1;
    float _894 = in.m_77.x;
    float _896 = in.m_77.y;
    float _898 = in.m_77.z;
    float _900 = fma(_886, _558, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _902 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[203].z, _870);
    int _904 = _878;
    if (!_868)
    {
        int _906 = ~_850;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = floor(_880);
    float _914 = in.m_79.x;
    float _916 = in.m_79.y;
    float _918 = in.m_79.z;
    int _920 = abs(_892);
    float _922 = fma(_866, _732, _888);
    int _924 = ~_844;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = _902 + 0.25;
    int _932 = _928;
    if (!_798)
    {
        int _934 = ~_844;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = _880 + 0.25;
    float _942 = floor(_902);
    bool _944 = !_856;
    int _946 = _944 ? 0 : 1;
    float _948 = fma(_704, _746, _882);
    float _950 = float(_910);
    float _952 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].x, _922);
    float _954 = float(_920);
    float _956 = _842 * 0.15915493667125701904296875;
    float _958 = float(_840);
    float _960 = -_912;
    float _962 = _880 + _960;
    float _964 = floor(_930);
    int _966 = abs(_946);
    float _968 = _954 * _950;
    float _970 = _880 * 6.283185482025146484375;
    float _972 = _952 * _894;
    bool _974 = _962 >= 0.5;
    bool _976 = isnan(_962);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.5);
    bool _982 = _978 || _980;
    float _984 = _968 * (-2.0);
    float _986 = -_942;
    float _988 = _902 + _986;
    float _990 = floor(_940);
    float _992 = _970 * 0.15915493667125701904296875;
    float _994 = fma(_522, _984, _522);
    float _996 = fma(_984, _916, _916);
    float _998 = _420 + (-0.5);
    int _1000 = abs(_770);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _742 + _1002;
    float _1006 = -_964;
    float _1008 = _930 + _1006;
    bool _1010 = _988 >= 0.5;
    bool _1012 = isnan(_988);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(0.5);
    bool _1018 = _1014 || _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1022 = _478 + _1020;
    float _1024 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].y, _996);
    float _1026 = float(_966);
    float _1028 = _992 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    float _1032 = _902 * 6.283185482025146484375;
    bool _1034 = !_982;
    float _1036 = _1034 ? 0.5 : (-0.5);
    float _1038 = -_990;
    float _1040 = _940 + _1038;
    float _1042 = _1022 * _1022;
    float _1044 = float(_1000);
    float _1046 = _1026 * _958;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1050 = _1048 * 2.0;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _754 + _1052;
    float _1056 = fma(_1004, _1004, _1042);
    bool _1058 = !_530;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _1044 * _1050;
    float _1064 = _1032 * 0.15915493667125701904296875;
    float _1066 = fma(_1054, _1054, _1056);
    int _1068 = abs(_516);
    float _1070 = fma(_994, _642, _1024);
    int _1072 = abs(_1060);
    float _1074 = _1046 * (-2.0);
    bool _1076 = !_1018;
    float _1078 = _1076 ? 0.5 : (-0.5);
    float _1080 = _1064 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    bool _1084 = _1040 > 0.5;
    float _1086 = fma(_812, _732, _852);
    float _1088 = float(_1072);
    float _1090 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1092 = _1090 * 2.0;
    float _1094 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1096 = float(_1068);
    float _1098 = _1070 * 0.15915493667125701904296875;
    float _1100 = rsqrt(_1066);
    bool _1102 = !_526;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = _1088 * _1092;
    int _1108 = abs(_740);
    float _1110 = fma(_1096, _1094, _1062);
    int _1112 = abs(_1104);
    float _1114 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1116 = _1040;
    float _1118 = _1008;
    if (_1084)
    {
        float _1120 = -_1040;
        float _1122 = _1120 + 1.0;
        _1116 = _1122;
    }
    float _1124 = _1116;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1128 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1130 = fma(_1124, 4.0, -1.0);
    float _1132 = float(_1112);
    float _1134 = _754 * _754;
    float _1136 = float(_1108);
    float _1138 = _1126 * _1100;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1142 = fma(_1132, _1128, _1106);
    bool _1144 = _1008 > 0.5;
    float _1146 = _1022 * _1138;
    float _1148 = fma(_1136, _1140, _1110);
    float _1150 = _1004 * _1138;
    int _1152 = abs(_828);
    float _1154 = -_1146;
    float _1156 = _1022 + _1154;
    float _1158 = fma(_1148, 3.1415927410125732421875, _914);
    float _1160 = -_1150;
    float _1162 = _1004 + _1160;
    bool _1164 = !_864;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = _1156 * _1156;
    float _1170 = fma(_1158, _1074, _1158);
    float _1172 = _1054 * _1138;
    float _1174 = _956 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1162, _1162, _1168);
    if (_1144)
    {
        float _1180 = -_1008;
        float _1182 = _1180 + 1.0;
        _1118 = _1182;
    }
    float _1184 = _1118;
    float _1186 = fma(_646, _1074, _646);
    int _1188 = abs(_1166);
    float _1190 = _432 + (-0.5);
    float _1192 = fma(_1184, 4.0, -1.0);
    float _1194 = float(_1152);
    float _1196 = -_1172;
    float _1198 = _1054 + _1196;
    float _1200 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1202 = float(_938);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1170);
    float _1206 = float(_1188);
    float _1208 = fma(_1194, _1200, _1142);
    float _1210 = in.m_81.y;
    float _1212 = fma(_1186, _642, _1204);
    float _1214 = _428 + (-0.5);
    float _1216 = _1206 * _1202;
    float _1218 = fma(_1208, 3.1415927410125732421875, _918);
    float _1220 = fma(_742, _742, _1134);
    float _1222 = fma(_1198, _1198, _1178);
    float _1224 = _1216 * (-2.0);
    float _1226 = _1212 * 0.15915493667125701904296875;
    float _1228 = sqrt(_1220);
    float _1230 = in.m_81.z;
    float _1232 = fma(_1218, _1224, _1218);
    float _1234 = fma(_554, _1224, _554);
    float _1236 = -_458;
    float _1238 = _1236 + 1.0;
    float _1240 = abs(_1176);
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1244 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1232);
    float _1246 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1086);
    float _1248 = sqrt(_1222);
    float _1250 = in.m_81.x;
    float _1252 = fma(_1234, _642, _1244);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1242);
    float _1256 = _1246 * _896;
    float _1258 = fma(_900, _732, _948);
    float _1260 = _1252 * 0.15915493667125701904296875;
    float _1262 = -_1254;
    float _1264 = _1262 + _1210;
    float _1266 = _1098 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1256 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1272 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1258);
    float _1274 = _698 + (-1.0);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1264);
    float _1278 = _1272 * _898;
    float _1280 = _1274 * _1228;
    float _1282 = _1098 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1100 * _1248;
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1230);
    float _1292 = _1280 * 0.75;
    float _1294 = _1270 * _1286;
    float _1296 = _1114 * _1286;
    float _1298 = _1288 * _1286;
    float _1300 = _1226 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1294 * _1276;
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1250);
    float _1308 = _1298 * _1290;
    float _1310 = _1296 * _1306;
    float _1312 = _1226 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1260 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1302 * _1284;
    float _1322 = _1302 * _1268;
    float _1324 = _1260 * 6.283185482025146484375;
    float _1326 = sin(_1324);
    float _1328 = _1314 * _1268;
    float _1330 = _1314 * _1284;
    float _1332 = _1302 * _1318;
    float _1334 = _1314 * _1318;
    float _1336 = _1284 * _1318;
    float _1338 = _1268 * _1318;
    float _1340 = _1332 * _1304;
    float _1342 = _1292 * 0.15915493667125701904296875;
    float _1344 = _1334 * _1304;
    float _1346 = fma(_1326, _1320, _1328);
    float _1348 = -_1322;
    float _1350 = fma(_1326, _1330, _1348);
    float _1352 = -_1330;
    float _1354 = fma(_1326, _1322, _1352);
    float _1356 = -_1304;
    float _1358 = _1326 * _1356;
    float _1360 = fma(_1346, _1310, _1340);
    float _1362 = fma(_1326, _1328, _1320);
    float _1364 = _1342 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1336, _1310, _1358);
    float _1370 = fma(_1354, _1308, _1360);
    float _1372 = fma(_1350, _1310, _1344);
    float _1374 = fma(_1338, _1308, _1368);
    float _1376 = _1370 * _356;
    float _1378 = fma(_1362, _1308, _1372);
    float _1380 = _1342 * 6.283185482025146484375;
    float _1382 = cos(_1380);
    float _1384 = _1370 * _360;
    float _1386 = fma(_1374, _340, _1376);
    float _1388 = _1370 * _352;
    float _1390 = fma(_1374, _348, _1384);
    float _1392 = fma(_1378, _368, _1386);
    float _1394 = fma(_1374, _330, _1388);
    float _1396 = fma(_1378, _372, _1390);
    float _1398 = _1392 * _1366;
    float _1400 = fma(_1378, _364, _1394);
    float _1402 = _1392 * _1382;
    float _1404 = -_1398;
    float _1406 = fma(_1396, _1382, _1404);
    float _1408 = fma(_1396, _1366, _1402);
    float _1410 = _754 + _1406;
    float _1412 = _478 + _1400;
    float _1414 = _742 + _1408;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1410 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1422 = _1414 + _1420;
    float _1424 = _1418 * _1418;
    float _1426 = fma(_1422, _1422, _1424);
    float _1428 = sqrt(_1426);
    bool _1430 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = 0.0;
    float _1434 = _1410;
    float _1436 = _1414;
    int _1438 = as_type<int>(_1406);
    float _1440 = _1246;
    if (!_1430)
    {
        _1432 = _1412;
    }
    float _1442 = _1432;
    bool _1444 = !_1430;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1428 + _1450;
        float _1454 = rsqrt(_1426);
        float _1456 = _1452 * _1448;
        float _1458 = _1412 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = _1456 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = fma(_1468, _1458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = _1454 * _1472;
        float _1478 = fma(_1412, _1464, _1474);
        float _1480 = fma(_1422, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1418, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1434 = _1482;
        _1436 = _1480;
        _1438 = as_type<int>(_1460);
        _1446 = _1478;
    }
    float _1484 = _1434;
    float _1486 = _1436;
    int _1488 = _1438;
    float _1490 = _1446;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1494 = _1484 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1498 = _1486 + _1496;
    float _1500 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1502 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5576 = float2(_1502, _1500);
    float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5576, float2(0.0), isnan(_5576)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5576, float2(0.0), isnan(_5576)), level(0.0)).x;
    float _1506 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1508 = -_1150;
    float _1510 = _742 + _1508;
    float _1512 = -_1172;
    float _1514 = _754 + _1512;
    float _1516 = fma(_1504, 100.0, _478);
    float _1518 = -_1146;
    float _1520 = _1518 + _1516;
    float _1522 = _1520 + _1506;
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1524);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1526);
    float _1532 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1528);
    float _1534 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1530);
    float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1538 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1540 = trunc(_1536);
    int _1542 = int(_1540);
    float _1544 = trunc(_1538);
    int _1546 = int(_1544);
    int _1548 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1550 = _1542 + _1548;
    int _1552 = _1550 + 1;
    bool _1554 = _1552 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1556 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1558 = _1546 + _1556;
    int _1560 = _1558 + 1;
    int _1562 = _1552 | _1560;
    bool _1564 = _1562 < 0;
    bool _1566 = _1564 || _1554;
    bool _1568 = _1560 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1570 = _1568 || _1566;
    int _1572 = _1552;
    int _1574 = _1560;
    int _1576 = _1562;
    int _1578 = _1488;
    float _1580 = _1486;
    float _1582 = _1484;
    float _1584 = _1522;
    if (!_1570)
    {
        int _1586 = _1560 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1588 = _1586 + _1552;
        _1572 = _1588;
    }
    int _1590 = _1572;
    float _1592 = _1534;
    if (!_1570)
    {
        float _1594 = floor(_1538);
        _1592 = _1594;
    }
    float _1596 = _1592;
    if (!_1570)
    {
        int _1598 = _1590 << 2;
        _1574 = _1598;
    }
    int _1600 = _1574;
    int _1602 = _1600;
    if (!_1570)
    {
        uint _1605 = uint(int(uint(_1590) >> uint(2)));
        _1576 = int(_1605);
    }
    int _1607 = _1576;
    if (!_1570)
    {
        int _1609 = 12 & _1600;
        _1602 = _1609;
    }
    int _1611 = _1602;
    if (!_1570)
    {
        int _1613 = _1607 << 4;
        int _1615 = _1613 + _1611;
        _1578 = _1615;
    }
    int _1617 = _1578;
    float _1619 = as_type<float>(_1611);
    if (!_1570)
    {
        float _1621 = floor(_1536);
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = as_type<float>(_1607);
    if (!_1570)
    {
        int _1627 = _1617 + 400;
        uint _1629 = uint(int(uint(_1627) >> uint(2)));
        uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
        int _1633 = int(_1629) & 3;
        float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
        _1625 = _1635;
    }
    float _1637 = _1625;
    if (!_1570)
    {
        float _1639 = -_1596;
        float _1641 = _1538 + _1639;
        _1440 = _1641;
    }
    float _1643 = _1440;
    float _1645 = _1623;
    if (!_1570)
    {
        float _1647 = -_1623;
        float _1649 = _1536 + _1647;
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = _1637;
    if (!_1570)
    {
        float _1655 = rint(_1637);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        uint _1661 = clamp(_1659, 0u, 65535u);
        _1653 = as_type<float>(_1661);
    }
    float _1663 = _1653;
    float _1665 = _1643;
    if (!_1570)
    {
        float3 _5850 = float3(_1651, _1643, float(as_type<int>(_1663)));
        float3 _5854 = select(_5850, float3(0.0), isnan(_5850));
        float _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5854.xy, uint(rint(_5854.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5854.xy, uint(rint(_5854.z)), level(0.0)).x;
        _1665 = _1667;
    }
    float _1669 = _1665;
    float _1671 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = -_478;
    float _1675 = _1673 + _1490;
    float _1677 = -_742;
    float _1679 = _1677 + _1486;
    float _1681 = -_754;
    float _1683 = _1681 + _1484;
    float _1685 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1687 = _1675 * _1675;
    float _1689 = fma(_1504, 100.0, _1490);
    float _1691 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1685);
    float _1693 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1695 = fma(_1679, _1679, _1687);
    float _1697 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1699 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1693);
    float _1701 = fma(_1683, _1683, _1695);
    float _1703 = 1.0 / _1697;
    float _1705 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1699);
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1709 = sqrt(_1701);
    float _1711 = _1707 + _1697;
    float _1713 = _1711 * _1703;
    float _1715 = _1713 * 0.5;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1719 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1717);
    float _1721 = 1.0 / _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1725 = _1721 * _1723;
    bool _1727 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1729 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1731 = !_1727;
    int _1733 = _1731 ? 0 : 1;
    int _1735 = 2;
    if (!_1727)
    {
        _1735 = 1;
    }
    int _1737 = _1735;
    int _1739 = _1737;
    if (!_1729)
    {
        _1739 = _1733;
    }
    int _1741 = _1739;
    bool _1743 = _1709 > 0.0;
    int _1745 = _1741 << 6;
    int _1747 = _1745 + 96;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = _1745 + 48;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    uint _1769 = uint(int(uint(int(_1767)) >> uint(2)));
    int _1771 = int(_1767) & 3;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[int(_1769)][_1771];
    int _1775 = int(_1767) + 1;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    int _1779 = _1775 & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    int _1783 = _1745 + 56;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
    int _1789 = int(_1785) & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    int _1793 = int(_1785) + 1;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    int _1797 = _1793 & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = _1745 + 64;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = _1745 + 72;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
    int _1825 = int(_1821) & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = int(_1821) + 1;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    int _1833 = _1829 & 3;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
    int _1837 = _1745 + 80;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
    int _1855 = _1745 + 88;
    uint _1857 = uint(int(uint(_1855) >> uint(2)));
    uint _1859 = uint(int(uint(int(_1857)) >> uint(2)));
    int _1861 = int(_1857) & 3;
    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[int(_1859)][_1861];
    int _1865 = int(_1857) + 1;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    int _1869 = _1865 & 3;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[int(_1867)][_1869];
    float _1873 = _1522 * _1763;
    float _1875 = fma(_1510, _1755, _1873);
    int _1877 = _1745 + 104;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = _1522 * _1781;
    float _1897 = _1781;
    if (!_1743)
    {
        _1897 = _1689;
    }
    float _1899 = _1897;
    bool _1901 = !_1743;
    float _1903 = _1899;
    float _1905 = _1835;
    if (!_1901)
    {
        float _1907 = _296 * _296;
        float _1909 = rsqrt(_1701);
        float _1911 = fma(_268, _268, _1907);
        float _1913 = fma(_304, _304, _1911);
        float _1915 = sqrt(_1913);
        float _1917 = _1679 * _1909;
        float _1919 = _1675 * _1909;
        float _1921 = _1683 * _1909;
        bool _1923 = _1915 > 0.0;
        float _1925 = _1909;
        if (!_1923)
        {
            _1925 = _1689;
        }
        float _1927 = _1925;
        bool _1929 = !_1923;
        _1903 = _1927;
        if (!_1929)
        {
            float _1931 = rsqrt(_1913);
            float _1933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1935 = _296 * _1931;
            float _1937 = _268 * _1931;
            float _1939 = _1919 * _1935;
            float _1941 = _304 * _1931;
            float _1943 = fma(_1917, _1937, _1939);
            float _1945 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1947 = fma(_1921, _1941, _1943);
            float _1949 = _1947 * _1945;
            float _1951 = fma(_268, _1949, _1486);
            float _1953 = fma(_296, _1949, _1689);
            float _1955 = fma(_304, _1949, _1484);
            _1580 = _1951;
            _1903 = _1953;
            _1582 = _1955;
        }
    }
    float _1957 = _1580;
    float _1959 = _1903;
    float _1961 = _1582;
    float _1963 = fma(_1514, _1885, _1875);
    bool _1965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1967 = isnan(0.5);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1973 = _1969 || _1971;
    float _1975 = _1522 * _1817;
    float _1977 = _1522 * _1853;
    float _1979 = _1963 + _1893;
    float _1981 = fma(_1510, _1773, _1895);
    float _1983 = fma(_1510, _1809, _1975);
    float _1985 = fma(_1510, _1845, _1977);
    float _1987 = 1.0 / _1979;
    float _1989 = fma(_1514, _1791, _1981);
    float _1991 = fma(_1514, _1827, _1983);
    float _1993 = fma(_1514, _1863, _1985);
    float _1995 = -_1150;
    float _1997 = _1995 + _1957;
    float _1999 = _1989 + _1799;
    float _2001 = -_1146;
    float _2003 = _2001 + _1959;
    float _2005 = -_1172;
    float _2007 = _2005 + _1961;
    float _2009 = _1991 + _1835;
    float _2011 = _1993 + _1871;
    float _2013 = _2003;
    float _2015 = _1997;
    float _2017 = _2007;
    float _2019 = _1999;
    float _2021 = _1985;
    bool _2023 = _1973;
    int _2025 = as_type<int>(_1961);
    if (!_1973)
    {
        float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2029 = _1520 + _2027;
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2033 = _1510 + _2031;
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2037 = -_754;
        float _2039 = _2037 + _1961;
        float _2041 = _2029 * _2029;
        float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2045 = _1514 + _2043;
        float _2047 = -_742;
        float _2049 = _2047 + _1957;
        float _2051 = fma(_2033, _2033, _2041);
        float _2053 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = fma(_2045, _2045, _2051);
        float _2057 = sqrt(_2055);
        float _2059 = 1.0 / _1286;
        float _2061 = _2053 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2063 = precise::min(_2057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2035;
        float _2067 = -_1516;
        float _2069 = _2067 + _1959;
        float _2071 = _2065 * _2059;
        float _2073 = _2061 * _2071;
        float _2075 = _2039 * _2071;
        float _2077 = fma(_2069, _2073, _1520);
        float _2079 = fma(_2049, _2073, _1510);
        float _2081 = fma(_2061, _2075, _1514);
        _2013 = _2077;
        _2015 = _2079;
        _2017 = _2081;
    }
    float _2083 = _2013;
    float _2085 = _2015;
    float _2087 = _2017;
    float _2089 = _1999 * _1987;
    float _2091 = _2009 * _1987;
    float _2093 = _2011 * _1987;
    if (_1570)
    {
        _2019 = 1.0;
    }
    float _2095 = _2019;
    float _2097 = _2095;
    if (!_1570)
    {
        int _2099 = _1590 << 4;
        int _2101 = _2099 + 2048;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        uint _2105 = uint(int(uint(int(_2103)) >> uint(2)));
        int _2107 = int(_2103) & 3;
        float _2109 = (*spvDescriptorSet0.vp_c15)._m0[int(_2105)][_2107];
        int _2111 = int(_2103) + 1;
        uint _2113 = uint(int(uint(_2111) >> uint(2)));
        int _2115 = _2111 & 3;
        float _2117 = (*spvDescriptorSet0.vp_c15)._m0[int(_2113)][_2115];
        int _2119 = _2101 + 8;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        int _2129 = int(_2121) + 1;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        int _2133 = _2129 & 3;
        float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
        float _2137 = _1522 * _2117;
        float _2139 = fma(_1510, _2109, _2137);
        float _2141 = fma(_1514, _2127, _2139);
        float _2143 = _2141 + _2135;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        float _2147 = -_2145;
        float _2149 = _2147 + _1669;
        float _2151 = fma(_2149, 500.0, 1.5);
        float _2153 = exp2(_2151);
        float _2155 = 0.0 + _2153;
        float _2157 = precise::clamp(_2155, 0.0, 1.0);
        _1584 = _2137;
        _2097 = _2157;
    }
    float _2159 = _1584;
    float _2161 = _2097;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2165 = _2083 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2085 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2173 = _2087 + _2171;
    float _2175 = _2165 * _2165;
    float _2177 = fma(_2169, _2169, _2175);
    float _2179 = fma(_2173, _2173, _2177);
    float _2181 = rsqrt(_2179);
    float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2185 = _2169 * _2183;
    float _2187 = _2173 * _2183;
    float _2189 = _2185 * _2185;
    float _2191 = _2187 * _2187;
    float _2193 = _2189 + _2191;
    float _2195 = sqrt(_2193);
    bool _2197 = _2195 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2201 = _2195 + _2199;
    float _2203 = _2181;
    float _2205 = _2201;
    float _2207 = _2165;
    float _2209 = _2159;
    if (_2197)
    {
        float _2211 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2203 = _2211;
    }
    float _2213 = _2203;
    if (_2197)
    {
        float _2215 = rsqrt(_2193);
        _1905 = _2215;
    }
    float _2217 = _1905;
    float _2219 = _2217;
    if (_2197)
    {
        float _2221 = _2201 * _2213;
        _2205 = _2221;
    }
    float _2223 = _2205;
    if (_2197)
    {
        float _2225 = _2223 * 0.15915493667125701904296875;
        _2021 = _2225;
    }
    float _2227 = _2021;
    float _2229 = _2173;
    float _2231 = _2227;
    if (_2197)
    {
        float _2233 = _2227 * 6.283185482025146484375;
        float _2235 = sin(_2233);
        _2229 = _2235;
    }
    float _2237 = _2229;
    float _2239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2241 = precise::max(0.0, _2239);
    float _2243 = _2213;
    float _2245 = _2241;
    if (_2197)
    {
        float _2247 = _2227 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = -_2183;
    float _2255 = -_2241;
    float _2257 = fma(_2165, _2253, _2255);
    if (_2197)
    {
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2207 = _2259;
    }
    float _2261 = _2207;
    float _2263 = _2261;
    if (!_2197)
    {
        _2231 = _2189;
    }
    float _2265 = _2231;
    float _2267 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2269 = _2237;
    float _2271 = _2265;
    if (_2197)
    {
        float _2273 = fma(_2237, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2263 = _2273;
    }
    float _2275 = _2263;
    float _2277 = _2275;
    if (!_2197)
    {
        _2269 = _2187;
    }
    float _2279 = _2269;
    float _2281 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2267);
    float _2283 = _2279;
    float _2285 = _2251;
    if (_2197)
    {
        float _2287 = _2251 + (-1.0);
        _2245 = _2287;
    }
    float _2289 = _2245;
    float _2291 = _2289;
    if (_2197)
    {
        float _2293 = _2217 * _2275;
        _2209 = _2293;
    }
    float _2295 = _2209;
    if (!_2197)
    {
        _2219 = _2185;
    }
    float _2297 = _2219;
    float _2299 = _2297;
    if (_2197)
    {
        float _2301 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (_2197)
    {
        float _2305 = _2185 * _2295;
        _2299 = _2305;
    }
    float _2307 = _2299;
    if (!_2197)
    {
        _2277 = _2257;
    }
    float _2309 = _2277;
    float _2311 = _2309;
    if (_2197)
    {
        float _2313 = _2187 * _2295;
        _2283 = _2313;
    }
    float _2315 = _2283;
    if (_2197)
    {
        float _2317 = fma(_2257, _2251, _2303);
        _2311 = _2317;
    }
    float _2319 = _2311;
    if (_2197)
    {
        float _2321 = _2307 * _2307;
        _2271 = _2321;
    }
    float _2323 = _2271;
    if (!_2197)
    {
        _2285 = _2191;
    }
    float _2325 = _2285;
    float _2327 = _2325;
    if (_2197)
    {
        float _2329 = _2315 * _2315;
        _2327 = _2329;
    }
    float _2331 = _2327;
    float _2333 = sqrt(_2179);
    float _2335 = fma(_2319, _2319, _2323);
    float _2337 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2339 = _2089 >= 0.0;
    float _2341 = _2335 + _2331;
    float _2343 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2345 = rsqrt(_2341);
    float _2347 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2343);
    bool _2349 = _2089 <= 1.0;
    bool _2351 = _2349 && _2339;
    float _2353 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2355 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2347);
    bool _2357 = _2091 >= 0.0;
    bool _2359 = _2357 && _2351;
    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2363 = fma(_2333, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2361);
    float _2365 = precise::clamp(_2363, 0.0, 1.0);
    float _2367 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2369 = floor(_2353);
    float _2371 = -_2365;
    float _2373 = _2371 + 1.0;
    bool _2375 = _2091 <= 1.0;
    bool _2377 = _2375 && _2359;
    float _2379 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2381 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2383 = _2345 * _2307;
    float _2385 = -_2379;
    float _2387 = fma(_2385, _2337, 1.0);
    float _2389 = _2345 * _2319;
    float _2391 = abs(_2373);
    float _2393 = log2(_2391);
    float _2395 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2397 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2399 = _2345 * _2315;
    float _2401 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2403 = -_2395;
    float _2405 = fma(_2389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2403);
    float _2407 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2397);
    float _2409 = -_2369;
    float _2411 = _2353 + _2409;
    float _2413 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2401);
    float _2415 = floor(_2381);
    float _2417 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2407);
    float _2419 = -_2399;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2405);
    float _2423 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2413);
    float _2425 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2281);
    float _2427 = _2417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2429 = _2423 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2431 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2433 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2435 = _2425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2437 = log2(_2387);
    float _2439 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2441 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2433);
    float _2443 = fma(_2421, -0.5, 0.5);
    float _2445 = fma(_2421, 0.5, 0.5);
    float _2447 = -_2415;
    float _2449 = _2381 + _2447;
    float _2451 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2441);
    float _2453 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2439);
    float _2455 = exp2(_2431);
    float _2457 = fma(_2445, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2451);
    float _2461 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2453);
    float _2463 = fma(_2445, _2457, -0.212114393711090087890625);
    float _2465 = sqrt(_2443);
    float _2467 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2469 = fma(_2445, _2463, 1.570728778839111328125);
    float _2471 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2467);
    float _2473 = _2467;
    if (_2377)
    {
        float _2475 = float(_1741);
        _2473 = _2475;
    }
    float _2477 = _2473;
    float _2479 = _2389 + 1.0;
    float _2481 = 1.0 / _2459;
    float _2483 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2471);
    float _2485 = -_2389;
    float _2487 = fma(_2455, _2479, _2485);
    float _2489 = _2437 * 0.693147182464599609375;
    float _2491 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2461);
    float _2493 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2483);
    float _2495 = fma(_2487, 0.5, 0.5);
    float _2497 = _2477;
    if (_2377)
    {
        float _2499 = rint(_2477);
        float _2501 = precise::max(_2499, 0.0);
        uint _2503 = uint(_2501);
        uint _2505 = clamp(_2503, 0u, 65535u);
        _2497 = as_type<float>(_2505);
    }
    float _2507 = _2497;
    float _2509 = _2465 * 0.636619746685028076171875;
    float _2511 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7226 = float2(_2411, _2449);
    float _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7226, float2(0.0), isnan(_7226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7226, float2(0.0), isnan(_7226)), level(0.0)).x;
    float _2515 = -_2469;
    float _2517 = fma(_2509, _2515, 1.0);
    float _2519 = _2491 * _2481;
    float _2521 = _2493 * _2481;
    float _2523 = fma(_2519, 0.5, 0.5);
    float _2525 = fma(_2521, -0.5, 0.5);
    float _2527 = _2463;
    if (_2377)
    {
        float3 _7255 = float3(_2089, _2091, float(as_type<int>(_2507)));
        float3 _7257 = select(_7255, float3(0.0), isnan(_7255));
        float _2529 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7257.xy, uint(rint(_7257.z)), _2093, level(0.0));
        _2527 = _2529;
    }
    float _2531 = _2527;
    float3 _7267 = float3(_2523, _2525, _2511);
    float _2533 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7267, float3(0.0), isnan(_7267)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7267, float3(0.0), isnan(_7267)), level(0.0)).x;
    float3 _7276 = float3(_2523, _2525, _2511);
    float4 _2536 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7276, float3(0.0), isnan(_7276)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7276, float3(0.0), isnan(_7276)), level(0.0)).xyzw;
    float _2538 = _2536.x;
    float _2540 = _2536.y;
    float _2542 = _2536.z;
    float _2544 = _2536.w;
    float2 _7292 = float2(_2517, _2495);
    float3 _2548 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7292, float2(0.0), isnan(_7292)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7292, float2(0.0), isnan(_7292)), level(0.0)).xyz;
    float _2550 = _2548.x;
    float _2552 = _2548.y;
    float _2554 = _2548.z;
    float _2556 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2560 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2562 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2564 = _2556 * _432;
    bool _2566 = _428 > 0.5;
    float _2568 = _2560 * _432;
    float _2570 = in.m_83.x;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2574 = _2572 != 0;
    float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2580 = _2578 != 0;
    float _2582 = in.m_83.y;
    bool _2584 = _420 > 0.5;
    float _2586 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2562);
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2590 = _2588 != 0;
    out.m_85.x = _2085;
    out.m_85.y = _2083;
    out.m_85.z = _2087;
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2594 = trunc(_2564);
    int _2596 = int(_2594);
    float _2598 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2586);
    float _2600 = _1689;
    bool _2602 = _2590;
    if (_2574)
    {
        float _2604 = in.m_73.z;
        _2600 = _2604;
    }
    float _2606 = _2600;
    float _2608 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2598);
    if (_2580)
    {
        bool _2610 = _432 > 0.5;
        _2023 = _2610;
    }
    bool _2612 = _2023;
    float _2614 = trunc(_2568);
    int _2616 = int(_2614);
    float _2618 = _2608 + _2459;
    float _2620 = _2618 * 0.5;
    float _2622 = _2570;
    if (_2580)
    {
        float _2624 = -_2570;
        float _2626 = _2624 + 1.0;
        _2025 = as_type<int>(_2626);
    }
    int _2628 = _2025;
    int _2630 = _2596 << 4;
    int _2632 = _2630 + 1968;
    float _2634 = -_2582;
    float _2636 = _2634 + 1.0;
    float _2638 = as_type<float>(_2596);
    float _2640 = _2582;
    if (!_2580)
    {
        _2638 = _2570;
    }
    float _2642 = _2638;
    uint _2644 = uint(int(uint(_2632) >> uint(2)));
    uint _2646 = uint(int(uint(int(_2644)) >> uint(2)));
    int _2648 = int(_2644) & 3;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[int(_2646)][_2648];
    int _2652 = int(_2644) + 1;
    uint _2654 = uint(int(uint(_2652) >> uint(2)));
    int _2656 = _2652 & 3;
    float _2658 = (*spvDescriptorSet0.vp_c9)._m0[int(_2654)][_2656];
    float _2660 = _2642;
    if (_2580)
    {
        float _2662 = _2612 ? as_type<float>(_2628) : _2570;
        _2660 = _2662;
    }
    float _2664 = _2660;
    int _2666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2668 = _2666 != 0;
    int _2670 = _2616 << 4;
    int _2672 = _2670 + 1712;
    int _2674 = _2566 ? as_type<int>(_2636) : as_type<int>(_2582);
    int _2676 = _2632 + 8;
    uint _2678 = uint(int(uint(_2676) >> uint(2)));
    uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
    int _2682 = int(_2678) & 3;
    float _2684 = (*spvDescriptorSet0.vp_c9)._m0[int(_2680)][_2682];
    bool _2686 = _430 > 0.5;
    float _2688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2692 = _2690 != 0;
    int _2694 = _2584 ? as_type<int>(_2636) : as_type<int>(_2582);
    float _2696 = _2590 ? as_type<float>(_2674) : _2582;
    int _2698 = _2672 + 8;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    uint _2702 = uint(int(uint(int(_2700)) >> uint(2)));
    int _2704 = int(_2700) & 3;
    float _2706 = (*spvDescriptorSet0.vp_c9)._m0[int(_2702)][_2704];
    float _2708 = _2692 ? as_type<float>(_2694) : _2582;
    int _2710 = _2694;
    float _2712 = _2606;
    float _2714 = _2664;
    if (_2574)
    {
        float _2716 = -_2570;
        float _2718 = _2716 + 1.0;
        _2710 = as_type<int>(_2718);
    }
    int _2720 = _2710;
    int _2722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2724 = _2722 != 0;
    float _2726 = fma(_2696, _2592, -0.5);
    if (_2668)
    {
        float _2728 = _2686 ? _2636 : _2582;
        _2640 = _2728;
    }
    float _2730 = _2640;
    float _2732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2734 = -_1254;
    float _2736 = -_1210;
    bool _2738 = _2734 != _2736;
    bool _2740 = isnan(_2734);
    bool _2742 = _2738 || _2740;
    bool _2744 = isnan(_2736);
    bool _2746 = _2742 || _2744;
    uint _2748 = uint(int(uint(_2672) >> uint(2)));
    uint _2750 = uint(int(uint(int(_2748)) >> uint(2)));
    int _2752 = int(_2748) & 3;
    float _2754 = (*spvDescriptorSet0.vp_c9)._m0[int(_2750)][_2752];
    int _2756 = int(_2748) + 1;
    uint _2758 = uint(int(uint(_2756) >> uint(2)));
    int _2760 = _2756 & 3;
    float _2762 = (*spvDescriptorSet0.vp_c9)._m0[int(_2758)][_2760];
    float _2764 = -_636;
    float _2766 = fma(_628, _2726, _2764);
    int _2768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2770 = _2766;
    if (_2574)
    {
        bool _2772 = _2606 > 0.5;
        _2602 = _2772;
    }
    bool _2774 = _2602;
    float _2776 = _2730 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_2574)
    {
        _2712 = _2570;
    }
    float _2778 = _2712;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2782 = _2778;
    if (_2574)
    {
        float _2784 = _2774 ? as_type<float>(_2720) : _2570;
        _2782 = _2784;
    }
    float _2786 = _2782;
    float _2788 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2790 = in.m_87.x;
    float _2792 = in.m_87.y;
    float _2794 = in.m_87.z;
    bool _2796 = _1250 == 0.0;
    bool _2798 = !_2746;
    bool _2800 = _2796 && _2798;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2804 = _1230 == 0.0;
    bool _2806 = _2804 && _2800;
    float _2808 = _2658 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_2724)
    {
        float _2812 = -_2570;
        float _2814 = _2812 + 1.0;
        _2768 = as_type<int>(_2814);
    }
    int _2816 = _2768;
    float _2818 = _2650 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2820 = _2808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2724)
    {
        float _2822 = _2584 ? as_type<float>(_2816) : _2570;
        _2622 = _2822;
    }
    float _2824 = _2622;
    float _2826 = _2688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2828 = _2818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2830 = fma(_2826, _2824, -0.5);
    float _2832 = _2706 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2834 = _2684 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2836 = fma(_626, _2830, _634);
    float _2838 = in.m_89.x;
    float _2840 = in.m_89.y;
    float _2842 = in.m_89.z;
    float _2844 = in.m_89.w;
    float _2846 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2848 = _2834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2850 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2852 = _2850;
    float _2854 = _2848;
    if (_2806)
    {
        _2714 = _2792;
    }
    float _2856 = _2714;
    float _2858 = _2754 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2860 = _2762 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_91.x = _2828;
    out.m_91.y = _2820;
    out.m_91.z = _2848;
    float _2862 = _2856;
    if (_2806)
    {
        _638 = _2790;
    }
    float _2864 = _638;
    float _2866 = _2858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2868 = _2860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2870 = _2864;
    if (!_2806)
    {
        float _2872 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2790);
        _2870 = _2872;
    }
    float _2874 = _2870;
    out.m_93.x = _2866;
    out.m_93.y = _2868;
    out.m_93.z = _2846;
    out.m_93.w = _2810;
    float _2876 = _2786 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2878 = _2836 + 0.5;
    float _2880 = _2876 * _2576;
    float _2882 = _2850 * _2802;
    float _2884 = _2766 + 0.5;
    if (_2806)
    {
        _2770 = _2794;
    }
    float _2886 = _2770;
    float _2888 = _2776 * _2732;
    float _2890 = _2886;
    if (_2806)
    {
        _2852 = _2856;
    }
    float _2892 = _2852;
    float _2894 = _2788 * _2780;
    float _2896 = _2892;
    if (!_2806)
    {
        _2862 = _2792;
    }
    float _2898 = _2862;
    out.m_95.x = _2878;
    out.m_95.y = _2884;
    if (_2806)
    {
        _2854 = _2886;
    }
    float _2900 = _2854;
    float _2902 = _2900;
    if (!_2806)
    {
        _2890 = _2794;
    }
    float _2904 = _2890;
    if (!_2806)
    {
        float _2906 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2898);
        _2896 = _2906;
    }
    float _2908 = _2896;
    float _2910 = _2842 * _2790;
    float _2912 = _2838 * _2898;
    out.m_97.x = _2882;
    out.m_97.y = _2894;
    out.m_97.z = _2880;
    out.m_97.w = _2888;
    float _2914 = _2840 * _2904;
    float _2916 = -_2910;
    float _2918 = fma(_2838, _2904, _2916);
    if (!_2806)
    {
        float _2920 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2904);
        _2902 = _2920;
    }
    float _2922 = _2902;
    float _2924 = -_2912;
    float _2926 = fma(_2840, _2790, _2924);
    float _2928 = -_2914;
    float _2930 = fma(_2842, _2898, _2928);
    float _2932 = _2918 * _2844;
    float _2934 = -_2908;
    float _2936 = _1326 * _2934;
    float _2938 = _2926 * _2844;
    float _2940 = _2930 * _2844;
    float _2942 = _1332 * _2932;
    float _2944 = fma(_1336, _2874, _2936);
    float _2946 = -_2840;
    float _2948 = _1326 * _2946;
    float _2950 = -_2932;
    float _2952 = _1326 * _2950;
    float _2954 = _1332 * _2908;
    float _2956 = _1334 * _2908;
    float _2958 = fma(_1336, _2838, _2948);
    float _2960 = fma(_1336, _2940, _2952);
    float _2962 = _1332 * _2840;
    float _2964 = _1334 * _2840;
    float _2966 = _1334 * _2932;
    float _2968 = fma(_1346, _2874, _2954);
    float _2970 = fma(_1346, _2940, _2942);
    float _2972 = fma(_1346, _2838, _2962);
    float _2974 = fma(_1350, _2874, _2956);
    float _2976 = fma(_1350, _2838, _2964);
    float _2978 = fma(_1350, _2940, _2966);
    float _2980 = fma(_1354, _2922, _2968);
    float _2982 = fma(_1354, _2938, _2970);
    float _2984 = fma(_1354, _2842, _2972);
    float _2986 = fma(_1338, _2922, _2944);
    float _2988 = fma(_1338, _2842, _2958);
    float _2990 = fma(_1362, _2922, _2974);
    float _2992 = fma(_1362, _2842, _2976);
    float _2994 = fma(_1338, _2938, _2960);
    float _2996 = fma(_1362, _2938, _2978);
    float _2998 = _2980 * _356;
    float _3000 = _2980 * _352;
    float _3002 = _2980 * _360;
    float _3004 = _2982 * _360;
    float _3006 = _2984 * _356;
    float _3008 = _2984 * _352;
    float _3010 = _2982 * _352;
    float _3012 = _2984 * _360;
    float _3014 = fma(_2994, _348, _3004);
    float _3016 = fma(_2988, _330, _3008);
    float _3018 = fma(_2994, _330, _3010);
    float _3020 = fma(_2988, _348, _3012);
    float _3022 = fma(_2988, _340, _3006);
    float _3024 = fma(_2986, _330, _3000);
    float _3026 = fma(_2996, _372, _3014);
    float _3028 = fma(_2986, _348, _3002);
    float _3030 = fma(_2992, _364, _3016);
    float _3032 = fma(_2992, _372, _3020);
    float _3034 = fma(_2990, _364, _3024);
    float _3036 = fma(_2990, _372, _3028);
    float _3038 = _2982 * _356;
    float _3040 = abs(_1725);
    float _3042 = log2(_3040);
    float _3044 = fma(_2996, _364, _3018);
    float _3046 = fma(_2994, _340, _3038);
    float _3048 = fma(_2986, _340, _2998);
    float _3050 = fma(_2992, _368, _3022);
    float _3052 = in.m_99.x;
    float _3054 = fma(_2996, _368, _3046);
    float _3056 = fma(_2990, _368, _3048);
    float _3058 = in.m_99.y;
    bool _3060 = _1725 <= 8000.0;
    bool _3062 = isnan(_1725);
    bool _3064 = _3060 || _3062;
    bool _3066 = isnan(8000.0);
    bool _3068 = _3064 || _3066;
    float _3070 = float(_3068);
    out.m_101.x = _3054;
    out.m_101.y = _3044;
    out.m_101.z = _3026;
    float _3072 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3074 = in.m_99.z;
    float _3076 = exp2(_3072);
    float _3078 = in.m_99.w;
    out.m_103.x = _3050;
    out.m_103.y = _3030;
    out.m_103.z = _3032;
    out.m_105.x = _3052;
    out.m_105.y = _3058;
    float _3080 = fma(_3076, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3082 = precise::clamp(_3080, 0.0, 1.0);
    float _3084 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_107.x = _3056;
    out.m_107.y = _3034;
    out.m_107.z = _3036;
    float _3086 = fma(_3082, -2.0, 3.0);
    float _3088 = _3082 * _3082;
    float _3090 = exp2(_3084);
    out.m_105.z = _3074;
    float _3092 = _3088 * _3086;
    out.m_105.w = _3078;
    float _3094 = -_3092;
    float _3096 = _3094 + 1.0;
    out.gl_Position.x = _2491;
    out.gl_Position.y = _2493;
    out.gl_Position.z = _2608;
    out.gl_Position.w = _2459;
    float _3098 = fma(_3096, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3092);
    float _3100 = _3070 * _3098;
    float _3102 = _3070;
    if (!_2377)
    {
        _3102 = 1.0;
    }
    float _3104 = _3102;
    float _3106 = -_3090;
    float _3108 = _3106 + 1.0;
    out.m_109.z = _2620;
    out.m_109.w = _2459;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3112 = _3108 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3114 = -_2513;
    float _3116 = _3114 + 1.0;
    float _3118 = _3116 * _3110;
    float _3120 = precise::clamp(_3118, 0.0, 1.0);
    float _3122 = _3104;
    float _3124 = _2533;
    if (_2377)
    {
        bool _3126 = _2531 >= _2093;
        bool _3128 = isnan(_2531);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan(_2093);
        bool _3134 = _3130 || _3132;
        float _3136 = float(_3134);
        _3122 = _3136;
    }
    float _3138 = _3122;
    float _3140 = _3112 * _2533;
    float _3142 = -_3112;
    float _3144 = _3142 + 1.0;
    bool _3146 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3148 = isnan(_2333);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3154 = _3150 || _3152;
    float _3156 = _3138 * _2161;
    float _3158 = -_3120;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3162 = _2544 * _3140;
    float _3164 = _2554 * _3140;
    float _3166 = _2544 * _3144;
    float _3168 = -_3156;
    float _3170 = fma(_3168, _3160, 1.0);
    float _3172 = precise::clamp(_3170, 0.0, 1.0);
    float _3174 = fma(_2550, _3162, _2538);
    float _3176 = fma(_2552, _3162, _2540);
    float _3178 = fma(_2544, _3164, _2542);
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3182 = _3140;
    float _3184 = _3164;
    float _3186 = _3160;
    float _3188 = _3162;
    float _3190 = _3172;
    if (!_3154)
    {
        _3182 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3192 = _3182;
    out.m_111.x = _3174;
    out.m_111.y = _3176;
    out.m_111.z = _3178;
    out.m_111.w = _3166;
    float _3194 = _3192;
    float _3196 = _3192;
    if (!_3154)
    {
        _3184 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3198 = _3184;
    float _3200 = _3198;
    float _3202 = _3198;
    if (!_3154)
    {
        _3124 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3204 = _3124;
    out.m_113.x = _3180;
    float _3206 = _3204;
    float _3208 = _3204;
    if (!_3154)
    {
        _3186 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3210 = _3186;
    float _3212 = _3210;
    float _3214 = _3210;
    if (!_3154)
    {
        _3188 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3216 = _3188;
    float _3218 = _3216;
    float _3220 = _3216;
    if (!_3154)
    {
        _3190 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3222 = _3190;
    bool _3224 = !_3154;
    float _3226 = _3222;
    float _3228 = _3222;
    if (!_3224)
    {
        bool _3230 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3232 = isnan(_2333);
        bool _3234 = _3230 || _3232;
        bool _3236 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3238 = _3234 || _3236;
        if (!_3238)
        {
            float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3242 = _2333 + _3240;
            float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3246 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3244;
            float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3252 = 1.0 / _3246;
            float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3258 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3266 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3268 = _3266 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3270 = _3242 * _3252;
            float _3272 = precise::clamp(_3270, 0.0, 1.0);
            float _3274 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3276 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3278 = fma(_3272, _3250, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3280 = fma(_3272, _3276, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3282 = fma(_3272, _3256, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3284 = fma(_3272, _3260, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3286 = fma(_3272, _3264, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3288 = fma(_3272, _3268, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3202 = _3278;
            _3220 = _3286;
            _3196 = _3282;
            _3214 = _3284;
            _3208 = _3280;
            _3228 = _3288;
            _3290 = true;
        }
        else
        {
            bool _3292 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3294 = isnan(_2333);
            bool _3296 = _3292 || _3294;
            bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3300 = _3296 || _3298;
            if (!_3300)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3302 = _3194;
            _3196 = _3302;
            if (!_3300)
            {
                _3200 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3304 = _3200;
            _3202 = _3304;
            if (!_3300)
            {
                _3206 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3306 = _3206;
            _3208 = _3306;
            if (!_3300)
            {
                _3212 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3308 = _3212;
            _3214 = _3308;
            if (!_3300)
            {
                _3218 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3310 = _3218;
            _3220 = _3310;
            if (!_3300)
            {
                _3226 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3312 = _3226;
            bool _3314 = !_3300;
            _3228 = _3312;
            if (!_3314)
            {
                bool _3316 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3318 = isnan(_2333);
                bool _3320 = _3316 || _3318;
                bool _3322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3324 = _3320 || _3322;
                if (!_3324)
                {
                    float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3328 = _2333 + _3326;
                    float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3332 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3330;
                    float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3338 = 1.0 / _3332;
                    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3356 = _3328 * _3338;
                    float _3358 = precise::clamp(_3356, 0.0, 1.0);
                    float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3362 = _3360 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3364 = fma(_3358, _3336, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3366 = fma(_3358, _3362, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3368 = fma(_3358, _3342, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3370 = fma(_3358, _3346, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3372 = fma(_3358, _3350, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3374 = fma(_3358, _3354, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3202 = _3364;
                    _3220 = _3372;
                    _3196 = _3368;
                    _3214 = _3370;
                    _3208 = _3366;
                    _3228 = _3374;
                    _3290 = true;
                }
                else
                {
                    _3202 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3220 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3214 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3208 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3228 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3290 = false;
    float _3376 = _3202;
    float _3378 = _3220;
    float _3380 = _3196;
    float _3382 = _3214;
    float _3384 = _3208;
    float _3386 = _3228;
    float _3388 = fma(_3034, -0.5, 0.5);
    float _3390 = precise::clamp(_3388, 0.0, 1.0);
    float _3392 = -_3376;
    float _3394 = _3392 + _3378;
    float _3396 = -_3380;
    float _3398 = _3396 + _3382;
    float _3400 = -_3384;
    float _3402 = _3400 + _3386;
    bool _3404 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3406 = fma(_3390, _3394, _3376);
    float _3408 = fma(_3390, _3398, _3380);
    float _3410 = fma(_3390, _3402, _3384);
    float _3412 = _3406 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3414 = fma(_3408, 0.298911988735198974609375, _3412);
    float _3416 = fma(_3410, 0.114477999508380889892578125, _3414);
    out.m_115.x = 0.0;
    float _3418 = -_3416;
    float _3420 = _3408 + _3418;
    float _3422 = -_3416;
    float _3424 = _3406 + _3422;
    float _3426 = -_3416;
    float _3428 = _3410 + _3426;
    float _3430 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3432 = fma(_3420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    float _3434 = fma(_3424, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    float _3436 = fma(_3428, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    out.m_113.w = _3430;
    out.m_117.x = _3432;
    out.m_117.y = _3434;
    out.m_117.z = _3436;
    if (!_3404)
    {
        return out;
    }
    float _3438 = -_2083;
    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3442 = -_2085;
    float _3444 = _3442 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3446 = -_2087;
    float _3448 = _3446 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3450 = _3440 * _3440;
    float _3452 = fma(_3444, _3444, _3450);
    float _3454 = fma(_3448, _3448, _3452);
    float _3456 = sqrt(_3454);
    float _3458 = rsqrt(_3454);
    float _3460 = -_3456;
    float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3464 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3466 = precise::clamp(_3464, 0.0, 1.0);
    float _3468 = _3444 * _3458;
    float _3470 = _3440 * _3458;
    float _3472 = abs(_3466);
    float _3474 = log2(_3472);
    float _3476 = _3448 * _3458;
    float _3478 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3480 = _3034 * _3470;
    float _3482 = -_3470;
    float _3484 = -_3478;
    float _3486 = fma(_3482, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3484);
    float _3488 = fma(_3056, _3468, _3480);
    float _3490 = -_3476;
    float _3492 = fma(_3490, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3486);
    float _3494 = fma(_3036, _3476, _3488);
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3500 = _3492 + _3498;
    float _3502 = _3474 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3504 = _3500 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3506 = precise::clamp(_3504, 0.0, 1.0);
    float _3508 = exp2(_3502);
    float _3510 = _3508 * _3506;
    float _3512 = _3496 * _3510;
    float _3514 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3516 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3518 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_115.x = _3514;
    out.m_115.y = _3516;
    out.m_115.z = _3518;
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
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_117 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3290 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _131 = in.m_58.w;
    float _133 = trunc(_131);
    int _136 = int(_133);
    bool _140 = _136 >= 1;
    float _142 = 0.0;
    float _144 = as_type<float>(_136);
    if (!_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _142;
    if (!_140)
    {
        out.m_61.x = 0.0;
    }
    int _148 = 0;
    if (!_140)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    int _154 = _152;
    if (!_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3576 = as_type<float>(_152);
        out.gl_Position.z = _3576;
    }
    if (!_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_63.w;
    float _158 = float(_136);
    float _160 = -_156;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _164 = _156 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _172 = _168 || _170;
    bool _174 = _162 >= _158;
    bool _176 = !_172;
    bool _178 = _174 || _176;
    float _180 = _162;
    if (_178)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _144;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _154 = as_type<int>(_184);
    }
    int _186 = _154;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3640 = as_type<float>(_186);
        out.gl_Position.z = _3640;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    float _194 = 1.0 / _158;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_67.x;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = in.m_71.x;
    float _212 = in.m_71.y;
    float _214 = in.m_71.z;
    float _216 = _188 * _188;
    float _218 = _190 * _190;
    float _220 = _192 * _192;
    float _222 = fma(_198, _198, _216);
    float _224 = fma(_200, _200, _218);
    float _226 = fma(_202, _202, _220);
    float _228 = fma(_204, _204, _222);
    float _230 = fma(_206, _206, _224);
    float _232 = fma(_208, _208, _226);
    float _234 = sqrt(_228);
    float _236 = sqrt(_230);
    float _238 = sqrt(_232);
    bool _240 = _234 > 0.0;
    bool _242 = _236 > 0.0;
    float _244 = _200 * _212;
    float _246 = fma(_198, _210, _244);
    float _248 = _228;
    float _250 = _230;
    float _252 = _234;
    if (_240)
    {
        float _254 = rsqrt(_228);
        _248 = _254;
    }
    float _256 = _248;
    float _258 = 0.0;
    if (!_240)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    bool _262 = _238 > 0.0;
    float _264 = _190 * _212;
    float _266 = _206 * _212;
    float _268 = fma(_202, _214, _246);
    float _270 = 0.0;
    float _272 = _260;
    if (!_242)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _274;
    if (_242)
    {
        float _280 = rsqrt(_230);
        _276 = _280;
    }
    float _282 = _276;
    float _284 = fma(_188, _210, _264);
    float _286 = fma(_204, _210, _266);
    float _288 = 0.0;
    float _290 = _284;
    if (!_240)
    {
        _288 = 0.0;
    }
    float _292 = _288;
    float _294 = _162 * _194;
    float _296 = fma(_192, _214, _284);
    float _298 = 0.0;
    float _300 = _292;
    if (!_240)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = fma(_208, _214, _286);
    float _306 = 0.0;
    float _308 = _302;
    if (_262)
    {
        float _310 = rsqrt(_232);
        _306 = _310;
    }
    float _312 = _306;
    if (!_262)
    {
        _250 = 0.0;
        _290 = 0.0;
    }
    float _314 = _250;
    float _316 = _290;
    float _318 = 0.0;
    float _320 = _316;
    float _322 = _314;
    if (!_242)
    {
        _318 = 0.0;
    }
    float _324 = _318;
    float _326 = _324;
    if (_240)
    {
        float _328 = _256 * _188;
        _272 = _328;
    }
    float _330 = _272;
    float _332 = 0.0;
    if (!_242)
    {
        _332 = 0.0;
    }
    float _334 = _332;
    float _336 = _334;
    if (_240)
    {
        float _338 = _256 * _198;
        _300 = _338;
    }
    float _340 = _300;
    if (!_262)
    {
        _252 = 0.0;
    }
    float _342 = _252;
    float _344 = _342;
    if (_240)
    {
        float _346 = _256 * _204;
        _308 = _346;
    }
    float _348 = _308;
    if (_242)
    {
        float _350 = _282 * _190;
        _278 = _350;
    }
    float _352 = _278;
    if (_242)
    {
        float _354 = _282 * _200;
        _326 = _354;
    }
    float _356 = _326;
    if (_242)
    {
        float _358 = _282 * _206;
        _336 = _358;
    }
    float _360 = _336;
    if (_262)
    {
        float _362 = _312 * _192;
        _320 = _362;
    }
    float _364 = _320;
    if (_262)
    {
        float _366 = _312 * _202;
        _344 = _366;
    }
    float _368 = _344;
    if (_262)
    {
        float _370 = _312 * _208;
        _322 = _370;
    }
    float _372 = _322;
    bool _374 = !_196;
    float _392;
    if (!_374)
    {
        float _376 = in.m_73.x;
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _380 = _376 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        _392 = _294;
    }
    _394 = false;
    float _396 = _392;
    float _398 = in.m_58.x;
    float _400 = in.m_58.y;
    float _402 = in.m_58.z;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _406 = -_294;
    float _408 = _406 + 1.0;
    float _410 = in.m_75.y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _396 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = in.m_73.y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _418;
    float _428 = in.m_73.z;
    float _430 = in.m_73.w;
    float _432 = in.m_73.x;
    float _434 = _294 * _404;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _408 * _404;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = 1.0 / _424;
    float _444 = in.m_67.w;
    bool _446 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_396);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = precise::min(_436, _440);
    float _460 = _200 * _400;
    float _462 = _206 * _400;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _464;
    float _468 = fma(_198, _398, _460);
    float _470 = fma(_204, _398, _462);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _396 + _472;
    float _476 = fma(_202, _402, _468);
    float _478 = _400 + _410;
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _494 = _492 != 0;
    float _496 = fma(_208, _402, _470);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = _474 * _426;
    float _504 = _420 + _428;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = _396 + _506;
    float _510 = 1.0 / _466;
    float _512 = _504 + (-1.0);
    bool _514 = !_486;
    int _516 = _514 ? 0 : 1;
    float _518 = _432 + _428;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _522 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _534 = _532 != 0;
    float _536 = _414 * _442;
    float _538 = _482 * _162;
    float _540 = _518 + (-1.0);
    float _542 = _512;
    float _544 = _482;
    if (_500)
    {
        _542 = _420;
    }
    float _546 = _542;
    float _548 = exp2(_538);
    float _550 = _546;
    if (!_500)
    {
        _550 = _432;
    }
    float _552 = _550;
    float _554 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_500)
    {
        _544 = _432;
    }
    float _556 = _544;
    float _558 = _508 * _510;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _566 = in.m_69.w;
    float _568 = _556;
    if (!_500)
    {
        _568 = _428;
    }
    float _570 = _568;
    float _572 = 1.0 / _562;
    float _574 = fma(_564, -2.0, _520);
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _578 = _570 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _580 = -_548;
    float _582 = _580 + 1.0;
    bool _584 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _592 = _588 || _590;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _610 = -_576;
    float _612 = fma(_578, 2.0, _610);
    float _614 = _432 + _420;
    float _616 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[88].z, _594);
    float _618 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[88].w, _606);
    float _620 = fma(_608, _420, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _622 = _604 ? _582 : 0.0;
    float _624 = _614 + (-1.0);
    float _626 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _616);
    float _628 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _618);
    float _630 = _620 * _162;
    float _632 = -_162;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[86].x, _612);
    float _636 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _574);
    float _638 = _626;
    if (_592)
    {
        float _640 = _622 * _572;
        _180 = _640;
    }
    float _642 = _180;
    float _644 = _428 * 2.0;
    float _646 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _656 = floor(_644);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _658;
    float _662 = fma(_650, _502, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _664;
    bool _668 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _670 = isnan(_396);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _684 = _420 * 2.0;
    float _686 = fma(_660, _502, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _692 = fma(_666, _502, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _694 = -_678;
    float _696 = _694 + 1.0;
    float _698 = _432 * 2.0;
    float _700 = fma(_682, _536, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _702 = fma(_654, _536, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _704 = fma(_690, _536, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _706 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _708 = isnan(_396);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = floor(_684);
    bool _720 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_396);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _456 * _696;
    float _734 = -_456;
    float _736 = _734 + 1.0;
    bool _738 = !_494;
    int _740 = _738 ? 0 : 1;
    float _742 = _476 + _444;
    bool _744 = _656 > 0.0;
    float _746 = _730 * _736;
    float _748 = floor(_698);
    float _750 = -_730;
    float _752 = _750 + 1.0;
    float _754 = _496 + _566;
    bool _756 = _656 >= 0.0;
    bool _758 = isnan(_656);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = _716 * _752;
    bool _768 = !_490;
    int _770 = _768 ? 0 : 1;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _772;
    float _776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _778 = _686 * _766;
    int _780 = _764 ? 0 : 1;
    float _782 = _642 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _784 = _718 >= 0.0;
    bool _786 = isnan(_718);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _662 * _766;
    float _796 = _692 * _766;
    bool _798 = _718 > 0.0;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _802 = _748 >= 0.0;
    bool _804 = isnan(_748);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = fma(_774, _558, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _814 = _642 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _816 = ~_780;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = -_716;
    float _824 = _822 + 1.0;
    bool _826 = !_534;
    int _828 = _826 ? 0 : 1;
    float _830 = _782 * _776;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    int _834 = _820;
    if (!_744)
    {
        int _836 = ~_780;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = fma(_432, 6.283185482025146484375, _630);
    int _844 = _792 ? 0 : 1;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _846;
    int _850 = _810 ? 0 : 1;
    float _852 = fma(_702, _746, _832);
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _860 = _858 != 0;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _864 = _862 != 0;
    float _866 = fma(_848, _558, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _868 = _748 > 0.0;
    float _870 = _814 * _800;
    float _872 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].x, _778);
    int _874 = ~_850;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[203].x, _830);
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _884;
    float _888 = fma(_700, _746, _872);
    bool _890 = !_860;
    int _892 = _890 ? 0 : 1;
    float _894 = in.m_77.x;
    float _896 = in.m_77.y;
    float _898 = in.m_77.z;
    float _900 = fma(_886, _558, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _902 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[203].z, _870);
    int _904 = _878;
    if (!_868)
    {
        int _906 = ~_850;
        int _908 = _906 + 1;
        _904 = _908;
    }
    int _910 = _904;
    float _912 = floor(_880);
    float _914 = in.m_79.x;
    float _916 = in.m_79.y;
    float _918 = in.m_79.z;
    int _920 = abs(_892);
    float _922 = fma(_866, _732, _888);
    int _924 = ~_844;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = _902 + 0.25;
    int _932 = _928;
    if (!_798)
    {
        int _934 = ~_844;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = _880 + 0.25;
    float _942 = floor(_902);
    bool _944 = !_856;
    int _946 = _944 ? 0 : 1;
    float _948 = fma(_704, _746, _882);
    float _950 = float(_910);
    float _952 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].x, _922);
    float _954 = float(_920);
    float _956 = _842 * 0.15915493667125701904296875;
    float _958 = float(_840);
    float _960 = -_912;
    float _962 = _880 + _960;
    float _964 = floor(_930);
    int _966 = abs(_946);
    float _968 = _954 * _950;
    float _970 = _880 * 6.283185482025146484375;
    float _972 = _952 * _894;
    bool _974 = _962 >= 0.5;
    bool _976 = isnan(_962);
    bool _978 = _974 || _976;
    bool _980 = isnan(0.5);
    bool _982 = _978 || _980;
    float _984 = _968 * (-2.0);
    float _986 = -_942;
    float _988 = _902 + _986;
    float _990 = floor(_940);
    float _992 = _970 * 0.15915493667125701904296875;
    float _994 = fma(_522, _984, _522);
    float _996 = fma(_984, _916, _916);
    float _998 = _420 + (-0.5);
    int _1000 = abs(_770);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _742 + _1002;
    float _1006 = -_964;
    float _1008 = _930 + _1006;
    bool _1010 = _988 >= 0.5;
    bool _1012 = isnan(_988);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(0.5);
    bool _1018 = _1014 || _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1022 = _478 + _1020;
    float _1024 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].y, _996);
    float _1026 = float(_966);
    float _1028 = _992 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    float _1032 = _902 * 6.283185482025146484375;
    bool _1034 = !_982;
    float _1036 = _1034 ? 0.5 : (-0.5);
    float _1038 = -_990;
    float _1040 = _940 + _1038;
    float _1042 = _1022 * _1022;
    float _1044 = float(_1000);
    float _1046 = _1026 * _958;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1050 = _1048 * 2.0;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _754 + _1052;
    float _1056 = fma(_1004, _1004, _1042);
    bool _1058 = !_530;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _1044 * _1050;
    float _1064 = _1032 * 0.15915493667125701904296875;
    float _1066 = fma(_1054, _1054, _1056);
    int _1068 = abs(_516);
    float _1070 = fma(_994, _642, _1024);
    int _1072 = abs(_1060);
    float _1074 = _1046 * (-2.0);
    bool _1076 = !_1018;
    float _1078 = _1076 ? 0.5 : (-0.5);
    float _1080 = _1064 * 6.283185482025146484375;
    float _1082 = sin(_1080);
    bool _1084 = _1040 > 0.5;
    float _1086 = fma(_812, _732, _852);
    float _1088 = float(_1072);
    float _1090 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1092 = _1090 * 2.0;
    float _1094 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1096 = float(_1068);
    float _1098 = _1070 * 0.15915493667125701904296875;
    float _1100 = rsqrt(_1066);
    bool _1102 = !_526;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = _1088 * _1092;
    int _1108 = abs(_740);
    float _1110 = fma(_1096, _1094, _1062);
    int _1112 = abs(_1104);
    float _1114 = _972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1116 = _1040;
    float _1118 = _1008;
    if (_1084)
    {
        float _1120 = -_1040;
        float _1122 = _1120 + 1.0;
        _1116 = _1122;
    }
    float _1124 = _1116;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1128 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1130 = fma(_1124, 4.0, -1.0);
    float _1132 = float(_1112);
    float _1134 = _754 * _754;
    float _1136 = float(_1108);
    float _1138 = _1126 * _1100;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1142 = fma(_1132, _1128, _1106);
    bool _1144 = _1008 > 0.5;
    float _1146 = _1022 * _1138;
    float _1148 = fma(_1136, _1140, _1110);
    float _1150 = _1004 * _1138;
    int _1152 = abs(_828);
    float _1154 = -_1146;
    float _1156 = _1022 + _1154;
    float _1158 = fma(_1148, 3.1415927410125732421875, _914);
    float _1160 = -_1150;
    float _1162 = _1004 + _1160;
    bool _1164 = !_864;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = _1156 * _1156;
    float _1170 = fma(_1158, _1074, _1158);
    float _1172 = _1054 * _1138;
    float _1174 = _956 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1162, _1162, _1168);
    if (_1144)
    {
        float _1180 = -_1008;
        float _1182 = _1180 + 1.0;
        _1118 = _1182;
    }
    float _1184 = _1118;
    float _1186 = fma(_646, _1074, _646);
    int _1188 = abs(_1166);
    float _1190 = _432 + (-0.5);
    float _1192 = fma(_1184, 4.0, -1.0);
    float _1194 = float(_1152);
    float _1196 = -_1172;
    float _1198 = _1054 + _1196;
    float _1200 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1202 = float(_938);
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1170);
    float _1206 = float(_1188);
    float _1208 = fma(_1194, _1200, _1142);
    float _1210 = in.m_81.y;
    float _1212 = fma(_1186, _642, _1204);
    float _1214 = _428 + (-0.5);
    float _1216 = _1206 * _1202;
    float _1218 = fma(_1208, 3.1415927410125732421875, _918);
    float _1220 = fma(_742, _742, _1134);
    float _1222 = fma(_1198, _1198, _1178);
    float _1224 = _1216 * (-2.0);
    float _1226 = _1212 * 0.15915493667125701904296875;
    float _1228 = sqrt(_1220);
    float _1230 = in.m_81.z;
    float _1232 = fma(_1218, _1224, _1218);
    float _1234 = fma(_554, _1224, _554);
    float _1236 = -_458;
    float _1238 = _1236 + 1.0;
    float _1240 = abs(_1176);
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1244 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1232);
    float _1246 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1086);
    float _1248 = sqrt(_1222);
    float _1250 = in.m_81.x;
    float _1252 = fma(_1234, _642, _1244);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1242);
    float _1256 = _1246 * _896;
    float _1258 = fma(_900, _732, _948);
    float _1260 = _1252 * 0.15915493667125701904296875;
    float _1262 = -_1254;
    float _1264 = _1262 + _1210;
    float _1266 = _1098 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = _1256 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1272 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1258);
    float _1274 = _698 + (-1.0);
    float _1276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1264);
    float _1278 = _1272 * _898;
    float _1280 = _1274 * _1228;
    float _1282 = _1098 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1100 * _1248;
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1230);
    float _1292 = _1280 * 0.75;
    float _1294 = _1270 * _1286;
    float _1296 = _1114 * _1286;
    float _1298 = _1288 * _1286;
    float _1300 = _1226 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1294 * _1276;
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1250);
    float _1308 = _1298 * _1290;
    float _1310 = _1296 * _1306;
    float _1312 = _1226 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1260 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1302 * _1284;
    float _1322 = _1302 * _1268;
    float _1324 = _1260 * 6.283185482025146484375;
    float _1326 = sin(_1324);
    float _1328 = _1314 * _1268;
    float _1330 = _1314 * _1284;
    float _1332 = _1302 * _1318;
    float _1334 = _1314 * _1318;
    float _1336 = _1284 * _1318;
    float _1338 = _1268 * _1318;
    float _1340 = _1332 * _1304;
    float _1342 = _1292 * 0.15915493667125701904296875;
    float _1344 = _1334 * _1304;
    float _1346 = fma(_1326, _1320, _1328);
    float _1348 = -_1322;
    float _1350 = fma(_1326, _1330, _1348);
    float _1352 = -_1330;
    float _1354 = fma(_1326, _1322, _1352);
    float _1356 = -_1304;
    float _1358 = _1326 * _1356;
    float _1360 = fma(_1346, _1310, _1340);
    float _1362 = fma(_1326, _1328, _1320);
    float _1364 = _1342 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1336, _1310, _1358);
    float _1370 = fma(_1354, _1308, _1360);
    float _1372 = fma(_1350, _1310, _1344);
    float _1374 = fma(_1338, _1308, _1368);
    float _1376 = _1370 * _356;
    float _1378 = fma(_1362, _1308, _1372);
    float _1380 = _1342 * 6.283185482025146484375;
    float _1382 = cos(_1380);
    float _1384 = _1370 * _360;
    float _1386 = fma(_1374, _340, _1376);
    float _1388 = _1370 * _352;
    float _1390 = fma(_1374, _348, _1384);
    float _1392 = fma(_1378, _368, _1386);
    float _1394 = fma(_1374, _330, _1388);
    float _1396 = fma(_1378, _372, _1390);
    float _1398 = _1392 * _1366;
    float _1400 = fma(_1378, _364, _1394);
    float _1402 = _1392 * _1382;
    float _1404 = -_1398;
    float _1406 = fma(_1396, _1382, _1404);
    float _1408 = fma(_1396, _1366, _1402);
    float _1410 = _754 + _1406;
    float _1412 = _478 + _1400;
    float _1414 = _742 + _1408;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1410 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1422 = _1414 + _1420;
    float _1424 = _1418 * _1418;
    float _1426 = fma(_1422, _1422, _1424);
    float _1428 = sqrt(_1426);
    bool _1430 = _1428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = 0.0;
    float _1434 = _1410;
    float _1436 = _1414;
    int _1438 = as_type<int>(_1406);
    float _1440 = _1246;
    if (!_1430)
    {
        _1432 = _1412;
    }
    float _1442 = _1432;
    bool _1444 = !_1430;
    float _1446 = _1442;
    if (!_1444)
    {
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1452 = _1428 + _1450;
        float _1454 = rsqrt(_1426);
        float _1456 = _1452 * _1448;
        float _1458 = _1412 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = _1456 * 0.15915493667125701904296875;
        float _1462 = _1460 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = _1460 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 + (-1.0);
        float _1472 = fma(_1468, _1458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = _1454 * _1472;
        float _1478 = fma(_1412, _1464, _1474);
        float _1480 = fma(_1422, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1482 = fma(_1418, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1434 = _1482;
        _1436 = _1480;
        _1438 = as_type<int>(_1460);
        _1446 = _1478;
    }
    float _1484 = _1434;
    float _1486 = _1436;
    int _1488 = _1438;
    float _1490 = _1446;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1494 = _1484 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1498 = _1486 + _1496;
    float _1500 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1502 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5576 = float2(_1502, _1500);
    float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5576, float2(0.0), isnan(_5576)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5576, float2(0.0), isnan(_5576)), level(0.0)).x;
    float _1506 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1508 = -_1150;
    float _1510 = _742 + _1508;
    float _1512 = -_1172;
    float _1514 = _754 + _1512;
    float _1516 = fma(_1504, 100.0, _478);
    float _1518 = -_1146;
    float _1520 = _1518 + _1516;
    float _1522 = _1520 + _1506;
    float _1524 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1524);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1526);
    float _1532 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1528);
    float _1534 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1530);
    float _1536 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1538 = _1534 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1540 = trunc(_1536);
    int _1542 = int(_1540);
    float _1544 = trunc(_1538);
    int _1546 = int(_1544);
    int _1548 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1550 = _1542 + _1548;
    int _1552 = _1550 + 1;
    bool _1554 = _1552 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1556 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1558 = _1546 + _1556;
    int _1560 = _1558 + 1;
    int _1562 = _1552 | _1560;
    bool _1564 = _1562 < 0;
    bool _1566 = _1564 || _1554;
    bool _1568 = _1560 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1570 = _1568 || _1566;
    int _1572 = _1552;
    int _1574 = _1560;
    int _1576 = _1562;
    int _1578 = _1488;
    float _1580 = _1486;
    float _1582 = _1484;
    float _1584 = _1522;
    if (!_1570)
    {
        int _1586 = _1560 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1588 = _1586 + _1552;
        _1572 = _1588;
    }
    int _1590 = _1572;
    float _1592 = _1534;
    if (!_1570)
    {
        float _1594 = floor(_1538);
        _1592 = _1594;
    }
    float _1596 = _1592;
    if (!_1570)
    {
        int _1598 = _1590 << 2;
        _1574 = _1598;
    }
    int _1600 = _1574;
    int _1602 = _1600;
    if (!_1570)
    {
        uint _1605 = uint(int(uint(_1590) >> uint(2)));
        _1576 = int(_1605);
    }
    int _1607 = _1576;
    if (!_1570)
    {
        int _1609 = 12 & _1600;
        _1602 = _1609;
    }
    int _1611 = _1602;
    if (!_1570)
    {
        int _1613 = _1607 << 4;
        int _1615 = _1613 + _1611;
        _1578 = _1615;
    }
    int _1617 = _1578;
    float _1619 = as_type<float>(_1611);
    if (!_1570)
    {
        float _1621 = floor(_1536);
        _1619 = _1621;
    }
    float _1623 = _1619;
    float _1625 = as_type<float>(_1607);
    if (!_1570)
    {
        int _1627 = _1617 + 400;
        uint _1629 = uint(int(uint(_1627) >> uint(2)));
        uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
        int _1633 = int(_1629) & 3;
        float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
        _1625 = _1635;
    }
    float _1637 = _1625;
    if (!_1570)
    {
        float _1639 = -_1596;
        float _1641 = _1538 + _1639;
        _1440 = _1641;
    }
    float _1643 = _1440;
    float _1645 = _1623;
    if (!_1570)
    {
        float _1647 = -_1623;
        float _1649 = _1536 + _1647;
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = _1637;
    if (!_1570)
    {
        float _1655 = rint(_1637);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        uint _1661 = clamp(_1659, 0u, 65535u);
        _1653 = as_type<float>(_1661);
    }
    float _1663 = _1653;
    float _1665 = _1643;
    if (!_1570)
    {
        float3 _5850 = float3(_1651, _1643, float(as_type<int>(_1663)));
        float3 _5854 = select(_5850, float3(0.0), isnan(_5850));
        float _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5854.xy, uint(rint(_5854.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5854.xy, uint(rint(_5854.z)), level(0.0)).x;
        _1665 = _1667;
    }
    float _1669 = _1665;
    float _1671 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = -_478;
    float _1675 = _1673 + _1490;
    float _1677 = -_742;
    float _1679 = _1677 + _1486;
    float _1681 = -_754;
    float _1683 = _1681 + _1484;
    float _1685 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1687 = _1675 * _1675;
    float _1689 = fma(_1504, 100.0, _1490);
    float _1691 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1685);
    float _1693 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1695 = fma(_1679, _1679, _1687);
    float _1697 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1699 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1693);
    float _1701 = fma(_1683, _1683, _1695);
    float _1703 = 1.0 / _1697;
    float _1705 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1699);
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1709 = sqrt(_1701);
    float _1711 = _1707 + _1697;
    float _1713 = _1711 * _1703;
    float _1715 = _1713 * 0.5;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1719 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1717);
    float _1721 = 1.0 / _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1725 = _1721 * _1723;
    bool _1727 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1729 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1731 = !_1727;
    int _1733 = _1731 ? 0 : 1;
    int _1735 = 2;
    if (!_1727)
    {
        _1735 = 1;
    }
    int _1737 = _1735;
    int _1739 = _1737;
    if (!_1729)
    {
        _1739 = _1733;
    }
    int _1741 = _1739;
    bool _1743 = _1709 > 0.0;
    int _1745 = _1741 << 6;
    int _1747 = _1745 + 96;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = _1745 + 48;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    uint _1769 = uint(int(uint(int(_1767)) >> uint(2)));
    int _1771 = int(_1767) & 3;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[int(_1769)][_1771];
    int _1775 = int(_1767) + 1;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    int _1779 = _1775 & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    int _1783 = _1745 + 56;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
    int _1789 = int(_1785) & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    int _1793 = int(_1785) + 1;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    int _1797 = _1793 & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = _1745 + 64;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = _1745 + 72;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
    int _1825 = int(_1821) & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = int(_1821) + 1;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    int _1833 = _1829 & 3;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
    int _1837 = _1745 + 80;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    uint _1841 = uint(int(uint(int(_1839)) >> uint(2)));
    int _1843 = int(_1839) & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    int _1847 = int(_1839) + 1;
    uint _1849 = uint(int(uint(_1847) >> uint(2)));
    int _1851 = _1847 & 3;
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
    int _1855 = _1745 + 88;
    uint _1857 = uint(int(uint(_1855) >> uint(2)));
    uint _1859 = uint(int(uint(int(_1857)) >> uint(2)));
    int _1861 = int(_1857) & 3;
    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[int(_1859)][_1861];
    int _1865 = int(_1857) + 1;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    int _1869 = _1865 & 3;
    float _1871 = (*spvDescriptorSet0.vp_c15)._m0[int(_1867)][_1869];
    float _1873 = _1522 * _1763;
    float _1875 = fma(_1510, _1755, _1873);
    int _1877 = _1745 + 104;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = _1522 * _1781;
    float _1897 = _1781;
    if (!_1743)
    {
        _1897 = _1689;
    }
    float _1899 = _1897;
    bool _1901 = !_1743;
    float _1903 = _1899;
    float _1905 = _1835;
    if (!_1901)
    {
        float _1907 = _296 * _296;
        float _1909 = rsqrt(_1701);
        float _1911 = fma(_268, _268, _1907);
        float _1913 = fma(_304, _304, _1911);
        float _1915 = sqrt(_1913);
        float _1917 = _1679 * _1909;
        float _1919 = _1675 * _1909;
        float _1921 = _1683 * _1909;
        bool _1923 = _1915 > 0.0;
        float _1925 = _1909;
        if (!_1923)
        {
            _1925 = _1689;
        }
        float _1927 = _1925;
        bool _1929 = !_1923;
        _1903 = _1927;
        if (!_1929)
        {
            float _1931 = rsqrt(_1913);
            float _1933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1935 = _296 * _1931;
            float _1937 = _268 * _1931;
            float _1939 = _1919 * _1935;
            float _1941 = _304 * _1931;
            float _1943 = fma(_1917, _1937, _1939);
            float _1945 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1947 = fma(_1921, _1941, _1943);
            float _1949 = _1947 * _1945;
            float _1951 = fma(_268, _1949, _1486);
            float _1953 = fma(_296, _1949, _1689);
            float _1955 = fma(_304, _1949, _1484);
            _1580 = _1951;
            _1903 = _1953;
            _1582 = _1955;
        }
    }
    float _1957 = _1580;
    float _1959 = _1903;
    float _1961 = _1582;
    float _1963 = fma(_1514, _1885, _1875);
    bool _1965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1967 = isnan(0.5);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1973 = _1969 || _1971;
    float _1975 = _1522 * _1817;
    float _1977 = _1522 * _1853;
    float _1979 = _1963 + _1893;
    float _1981 = fma(_1510, _1773, _1895);
    float _1983 = fma(_1510, _1809, _1975);
    float _1985 = fma(_1510, _1845, _1977);
    float _1987 = 1.0 / _1979;
    float _1989 = fma(_1514, _1791, _1981);
    float _1991 = fma(_1514, _1827, _1983);
    float _1993 = fma(_1514, _1863, _1985);
    float _1995 = -_1150;
    float _1997 = _1995 + _1957;
    float _1999 = _1989 + _1799;
    float _2001 = -_1146;
    float _2003 = _2001 + _1959;
    float _2005 = -_1172;
    float _2007 = _2005 + _1961;
    float _2009 = _1991 + _1835;
    float _2011 = _1993 + _1871;
    float _2013 = _2003;
    float _2015 = _1997;
    float _2017 = _2007;
    float _2019 = _1999;
    float _2021 = _1985;
    bool _2023 = _1973;
    int _2025 = as_type<int>(_1961);
    if (!_1973)
    {
        float _2027 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2029 = _1520 + _2027;
        float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2033 = _1510 + _2031;
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2037 = -_754;
        float _2039 = _2037 + _1961;
        float _2041 = _2029 * _2029;
        float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2045 = _1514 + _2043;
        float _2047 = -_742;
        float _2049 = _2047 + _1957;
        float _2051 = fma(_2033, _2033, _2041);
        float _2053 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = fma(_2045, _2045, _2051);
        float _2057 = sqrt(_2055);
        float _2059 = 1.0 / _1286;
        float _2061 = _2053 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2063 = precise::min(_2057, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2035;
        float _2067 = -_1516;
        float _2069 = _2067 + _1959;
        float _2071 = _2065 * _2059;
        float _2073 = _2061 * _2071;
        float _2075 = _2039 * _2071;
        float _2077 = fma(_2069, _2073, _1520);
        float _2079 = fma(_2049, _2073, _1510);
        float _2081 = fma(_2061, _2075, _1514);
        _2013 = _2077;
        _2015 = _2079;
        _2017 = _2081;
    }
    float _2083 = _2013;
    float _2085 = _2015;
    float _2087 = _2017;
    float _2089 = _1999 * _1987;
    float _2091 = _2009 * _1987;
    float _2093 = _2011 * _1987;
    if (_1570)
    {
        _2019 = 1.0;
    }
    float _2095 = _2019;
    float _2097 = _2095;
    if (!_1570)
    {
        int _2099 = _1590 << 4;
        int _2101 = _2099 + 2048;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        uint _2105 = uint(int(uint(int(_2103)) >> uint(2)));
        int _2107 = int(_2103) & 3;
        float _2109 = (*spvDescriptorSet0.vp_c15)._m0[int(_2105)][_2107];
        int _2111 = int(_2103) + 1;
        uint _2113 = uint(int(uint(_2111) >> uint(2)));
        int _2115 = _2111 & 3;
        float _2117 = (*spvDescriptorSet0.vp_c15)._m0[int(_2113)][_2115];
        int _2119 = _2101 + 8;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        int _2129 = int(_2121) + 1;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        int _2133 = _2129 & 3;
        float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
        float _2137 = _1522 * _2117;
        float _2139 = fma(_1510, _2109, _2137);
        float _2141 = fma(_1514, _2127, _2139);
        float _2143 = _2141 + _2135;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        float _2147 = -_2145;
        float _2149 = _2147 + _1669;
        float _2151 = fma(_2149, 500.0, 1.5);
        float _2153 = exp2(_2151);
        float _2155 = 0.0 + _2153;
        float _2157 = precise::clamp(_2155, 0.0, 1.0);
        _1584 = _2137;
        _2097 = _2157;
    }
    float _2159 = _1584;
    float _2161 = _2097;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2165 = _2083 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2085 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2173 = _2087 + _2171;
    float _2175 = _2165 * _2165;
    float _2177 = fma(_2169, _2169, _2175);
    float _2179 = fma(_2173, _2173, _2177);
    float _2181 = rsqrt(_2179);
    float _2183 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2185 = _2169 * _2183;
    float _2187 = _2173 * _2183;
    float _2189 = _2185 * _2185;
    float _2191 = _2187 * _2187;
    float _2193 = _2189 + _2191;
    float _2195 = sqrt(_2193);
    bool _2197 = _2195 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2201 = _2195 + _2199;
    float _2203 = _2181;
    float _2205 = _2201;
    float _2207 = _2165;
    float _2209 = _2159;
    if (_2197)
    {
        float _2211 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2203 = _2211;
    }
    float _2213 = _2203;
    if (_2197)
    {
        float _2215 = rsqrt(_2193);
        _1905 = _2215;
    }
    float _2217 = _1905;
    float _2219 = _2217;
    if (_2197)
    {
        float _2221 = _2201 * _2213;
        _2205 = _2221;
    }
    float _2223 = _2205;
    if (_2197)
    {
        float _2225 = _2223 * 0.15915493667125701904296875;
        _2021 = _2225;
    }
    float _2227 = _2021;
    float _2229 = _2173;
    float _2231 = _2227;
    if (_2197)
    {
        float _2233 = _2227 * 6.283185482025146484375;
        float _2235 = sin(_2233);
        _2229 = _2235;
    }
    float _2237 = _2229;
    float _2239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2241 = precise::max(0.0, _2239);
    float _2243 = _2213;
    float _2245 = _2241;
    if (_2197)
    {
        float _2247 = _2227 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = -_2183;
    float _2255 = -_2241;
    float _2257 = fma(_2165, _2253, _2255);
    if (_2197)
    {
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2207 = _2259;
    }
    float _2261 = _2207;
    float _2263 = _2261;
    if (!_2197)
    {
        _2231 = _2189;
    }
    float _2265 = _2231;
    float _2267 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2269 = _2237;
    float _2271 = _2265;
    if (_2197)
    {
        float _2273 = fma(_2237, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2263 = _2273;
    }
    float _2275 = _2263;
    float _2277 = _2275;
    if (!_2197)
    {
        _2269 = _2187;
    }
    float _2279 = _2269;
    float _2281 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2267);
    float _2283 = _2279;
    float _2285 = _2251;
    if (_2197)
    {
        float _2287 = _2251 + (-1.0);
        _2245 = _2287;
    }
    float _2289 = _2245;
    float _2291 = _2289;
    if (_2197)
    {
        float _2293 = _2217 * _2275;
        _2209 = _2293;
    }
    float _2295 = _2209;
    if (!_2197)
    {
        _2219 = _2185;
    }
    float _2297 = _2219;
    float _2299 = _2297;
    if (_2197)
    {
        float _2301 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2291 = _2301;
    }
    float _2303 = _2291;
    if (_2197)
    {
        float _2305 = _2185 * _2295;
        _2299 = _2305;
    }
    float _2307 = _2299;
    if (!_2197)
    {
        _2277 = _2257;
    }
    float _2309 = _2277;
    float _2311 = _2309;
    if (_2197)
    {
        float _2313 = _2187 * _2295;
        _2283 = _2313;
    }
    float _2315 = _2283;
    if (_2197)
    {
        float _2317 = fma(_2257, _2251, _2303);
        _2311 = _2317;
    }
    float _2319 = _2311;
    if (_2197)
    {
        float _2321 = _2307 * _2307;
        _2271 = _2321;
    }
    float _2323 = _2271;
    if (!_2197)
    {
        _2285 = _2191;
    }
    float _2325 = _2285;
    float _2327 = _2325;
    if (_2197)
    {
        float _2329 = _2315 * _2315;
        _2327 = _2329;
    }
    float _2331 = _2327;
    float _2333 = sqrt(_2179);
    float _2335 = fma(_2319, _2319, _2323);
    float _2337 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2339 = _2089 >= 0.0;
    float _2341 = _2335 + _2331;
    float _2343 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2345 = rsqrt(_2341);
    float _2347 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2343);
    bool _2349 = _2089 <= 1.0;
    bool _2351 = _2349 && _2339;
    float _2353 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2355 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2347);
    bool _2357 = _2091 >= 0.0;
    bool _2359 = _2357 && _2351;
    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2363 = fma(_2333, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2361);
    float _2365 = precise::clamp(_2363, 0.0, 1.0);
    float _2367 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2369 = floor(_2353);
    float _2371 = -_2365;
    float _2373 = _2371 + 1.0;
    bool _2375 = _2091 <= 1.0;
    bool _2377 = _2375 && _2359;
    float _2379 = _2367 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2381 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2383 = _2345 * _2307;
    float _2385 = -_2379;
    float _2387 = fma(_2385, _2337, 1.0);
    float _2389 = _2345 * _2319;
    float _2391 = abs(_2373);
    float _2393 = log2(_2391);
    float _2395 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2397 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2399 = _2345 * _2315;
    float _2401 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2403 = -_2395;
    float _2405 = fma(_2389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2403);
    float _2407 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2397);
    float _2409 = -_2369;
    float _2411 = _2353 + _2409;
    float _2413 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2401);
    float _2415 = floor(_2381);
    float _2417 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2407);
    float _2419 = -_2399;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2405);
    float _2423 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2413);
    float _2425 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2281);
    float _2427 = _2417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2429 = _2423 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2431 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2433 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2435 = _2425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2437 = log2(_2387);
    float _2439 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2441 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2433);
    float _2443 = fma(_2421, -0.5, 0.5);
    float _2445 = fma(_2421, 0.5, 0.5);
    float _2447 = -_2415;
    float _2449 = _2381 + _2447;
    float _2451 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2441);
    float _2453 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2439);
    float _2455 = exp2(_2431);
    float _2457 = fma(_2445, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2451);
    float _2461 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2453);
    float _2463 = fma(_2445, _2457, -0.212114393711090087890625);
    float _2465 = sqrt(_2443);
    float _2467 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2469 = fma(_2445, _2463, 1.570728778839111328125);
    float _2471 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2467);
    float _2473 = _2467;
    if (_2377)
    {
        float _2475 = float(_1741);
        _2473 = _2475;
    }
    float _2477 = _2473;
    float _2479 = _2389 + 1.0;
    float _2481 = 1.0 / _2459;
    float _2483 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2471);
    float _2485 = -_2389;
    float _2487 = fma(_2455, _2479, _2485);
    float _2489 = _2437 * 0.693147182464599609375;
    float _2491 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2461);
    float _2493 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2483);
    float _2495 = fma(_2487, 0.5, 0.5);
    float _2497 = _2477;
    if (_2377)
    {
        float _2499 = rint(_2477);
        float _2501 = precise::max(_2499, 0.0);
        uint _2503 = uint(_2501);
        uint _2505 = clamp(_2503, 0u, 65535u);
        _2497 = as_type<float>(_2505);
    }
    float _2507 = _2497;
    float _2509 = _2465 * 0.636619746685028076171875;
    float _2511 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7226 = float2(_2411, _2449);
    float _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7226, float2(0.0), isnan(_7226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7226, float2(0.0), isnan(_7226)), level(0.0)).x;
    float _2515 = -_2469;
    float _2517 = fma(_2509, _2515, 1.0);
    float _2519 = _2491 * _2481;
    float _2521 = _2493 * _2481;
    float _2523 = fma(_2519, 0.5, 0.5);
    float _2525 = fma(_2521, -0.5, 0.5);
    float _2527 = _2463;
    if (_2377)
    {
        float3 _7255 = float3(_2089, _2091, float(as_type<int>(_2507)));
        float3 _7257 = select(_7255, float3(0.0), isnan(_7255));
        float _2529 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7257.xy, uint(rint(_7257.z)), _2093, level(0.0));
        _2527 = _2529;
    }
    float _2531 = _2527;
    float3 _7267 = float3(_2523, _2525, _2511);
    float _2533 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7267, float3(0.0), isnan(_7267)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7267, float3(0.0), isnan(_7267)), level(0.0)).x;
    float3 _7276 = float3(_2523, _2525, _2511);
    float4 _2536 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7276, float3(0.0), isnan(_7276)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7276, float3(0.0), isnan(_7276)), level(0.0)).xyzw;
    float _2538 = _2536.x;
    float _2540 = _2536.y;
    float _2542 = _2536.z;
    float _2544 = _2536.w;
    float2 _7292 = float2(_2517, _2495);
    float3 _2548 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7292, float2(0.0), isnan(_7292)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7292, float2(0.0), isnan(_7292)), level(0.0)).xyz;
    float _2550 = _2548.x;
    float _2552 = _2548.y;
    float _2554 = _2548.z;
    float _2556 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2560 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2562 = _2427 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2564 = _2556 * _432;
    bool _2566 = _428 > 0.5;
    float _2568 = _2560 * _432;
    float _2570 = in.m_83.x;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2574 = _2572 != 0;
    float _2576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2580 = _2578 != 0;
    float _2582 = in.m_83.y;
    bool _2584 = _420 > 0.5;
    float _2586 = fma(_2429, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2562);
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2590 = _2588 != 0;
    out.m_85.x = _2085;
    out.m_85.y = _2083;
    out.m_85.z = _2087;
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2594 = trunc(_2564);
    int _2596 = int(_2594);
    float _2598 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2586);
    float _2600 = _1689;
    bool _2602 = _2590;
    if (_2574)
    {
        float _2604 = in.m_73.z;
        _2600 = _2604;
    }
    float _2606 = _2600;
    float _2608 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2598);
    if (_2580)
    {
        bool _2610 = _432 > 0.5;
        _2023 = _2610;
    }
    bool _2612 = _2023;
    float _2614 = trunc(_2568);
    int _2616 = int(_2614);
    float _2618 = _2608 + _2459;
    float _2620 = _2618 * 0.5;
    float _2622 = _2570;
    if (_2580)
    {
        float _2624 = -_2570;
        float _2626 = _2624 + 1.0;
        _2025 = as_type<int>(_2626);
    }
    int _2628 = _2025;
    int _2630 = _2596 << 4;
    int _2632 = _2630 + 1968;
    float _2634 = -_2582;
    float _2636 = _2634 + 1.0;
    float _2638 = as_type<float>(_2596);
    float _2640 = _2582;
    if (!_2580)
    {
        _2638 = _2570;
    }
    float _2642 = _2638;
    uint _2644 = uint(int(uint(_2632) >> uint(2)));
    uint _2646 = uint(int(uint(int(_2644)) >> uint(2)));
    int _2648 = int(_2644) & 3;
    float _2650 = (*spvDescriptorSet0.vp_c9)._m0[int(_2646)][_2648];
    int _2652 = int(_2644) + 1;
    uint _2654 = uint(int(uint(_2652) >> uint(2)));
    int _2656 = _2652 & 3;
    float _2658 = (*spvDescriptorSet0.vp_c9)._m0[int(_2654)][_2656];
    float _2660 = _2642;
    if (_2580)
    {
        float _2662 = _2612 ? as_type<float>(_2628) : _2570;
        _2660 = _2662;
    }
    float _2664 = _2660;
    int _2666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2668 = _2666 != 0;
    int _2670 = _2616 << 4;
    int _2672 = _2670 + 1712;
    int _2674 = _2566 ? as_type<int>(_2636) : as_type<int>(_2582);
    int _2676 = _2632 + 8;
    uint _2678 = uint(int(uint(_2676) >> uint(2)));
    uint _2680 = uint(int(uint(int(_2678)) >> uint(2)));
    int _2682 = int(_2678) & 3;
    float _2684 = (*spvDescriptorSet0.vp_c9)._m0[int(_2680)][_2682];
    bool _2686 = _430 > 0.5;
    float _2688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2692 = _2690 != 0;
    int _2694 = _2584 ? as_type<int>(_2636) : as_type<int>(_2582);
    float _2696 = _2590 ? as_type<float>(_2674) : _2582;
    int _2698 = _2672 + 8;
    uint _2700 = uint(int(uint(_2698) >> uint(2)));
    uint _2702 = uint(int(uint(int(_2700)) >> uint(2)));
    int _2704 = int(_2700) & 3;
    float _2706 = (*spvDescriptorSet0.vp_c9)._m0[int(_2702)][_2704];
    float _2708 = _2692 ? as_type<float>(_2694) : _2582;
    int _2710 = _2694;
    float _2712 = _2606;
    float _2714 = _2664;
    if (_2574)
    {
        float _2716 = -_2570;
        float _2718 = _2716 + 1.0;
        _2710 = as_type<int>(_2718);
    }
    int _2720 = _2710;
    int _2722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2724 = _2722 != 0;
    float _2726 = fma(_2696, _2592, -0.5);
    if (_2668)
    {
        float _2728 = _2686 ? _2636 : _2582;
        _2640 = _2728;
    }
    float _2730 = _2640;
    float _2732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2734 = -_1254;
    float _2736 = -_1210;
    bool _2738 = _2734 != _2736;
    bool _2740 = isnan(_2734);
    bool _2742 = _2738 || _2740;
    bool _2744 = isnan(_2736);
    bool _2746 = _2742 || _2744;
    uint _2748 = uint(int(uint(_2672) >> uint(2)));
    uint _2750 = uint(int(uint(int(_2748)) >> uint(2)));
    int _2752 = int(_2748) & 3;
    float _2754 = (*spvDescriptorSet0.vp_c9)._m0[int(_2750)][_2752];
    int _2756 = int(_2748) + 1;
    uint _2758 = uint(int(uint(_2756) >> uint(2)));
    int _2760 = _2756 & 3;
    float _2762 = (*spvDescriptorSet0.vp_c9)._m0[int(_2758)][_2760];
    float _2764 = -_636;
    float _2766 = fma(_628, _2726, _2764);
    int _2768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2770 = _2766;
    if (_2574)
    {
        bool _2772 = _2606 > 0.5;
        _2602 = _2772;
    }
    bool _2774 = _2602;
    float _2776 = _2730 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_2574)
    {
        _2712 = _2570;
    }
    float _2778 = _2712;
    float _2780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2782 = _2778;
    if (_2574)
    {
        float _2784 = _2774 ? as_type<float>(_2720) : _2570;
        _2782 = _2784;
    }
    float _2786 = _2782;
    float _2788 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2790 = in.m_87.x;
    float _2792 = in.m_87.y;
    float _2794 = in.m_87.z;
    bool _2796 = _1250 == 0.0;
    bool _2798 = !_2746;
    bool _2800 = _2796 && _2798;
    float _2802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2804 = _1230 == 0.0;
    bool _2806 = _2804 && _2800;
    float _2808 = _2658 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_2724)
    {
        float _2812 = -_2570;
        float _2814 = _2812 + 1.0;
        _2768 = as_type<int>(_2814);
    }
    int _2816 = _2768;
    float _2818 = _2650 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2820 = _2808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2724)
    {
        float _2822 = _2584 ? as_type<float>(_2816) : _2570;
        _2622 = _2822;
    }
    float _2824 = _2622;
    float _2826 = _2688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2828 = _2818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2830 = fma(_2826, _2824, -0.5);
    float _2832 = _2706 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2834 = _2684 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2836 = fma(_626, _2830, _634);
    float _2838 = in.m_89.x;
    float _2840 = in.m_89.y;
    float _2842 = in.m_89.z;
    float _2844 = in.m_89.w;
    float _2846 = _2832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2848 = _2834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2850 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2852 = _2850;
    float _2854 = _2848;
    if (_2806)
    {
        _2714 = _2792;
    }
    float _2856 = _2714;
    float _2858 = _2754 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2860 = _2762 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_91.x = _2828;
    out.m_91.y = _2820;
    out.m_91.z = _2848;
    float _2862 = _2856;
    if (_2806)
    {
        _638 = _2790;
    }
    float _2864 = _638;
    float _2866 = _2858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2868 = _2860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2870 = _2864;
    if (!_2806)
    {
        float _2872 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2790);
        _2870 = _2872;
    }
    float _2874 = _2870;
    out.m_93.x = _2866;
    out.m_93.y = _2868;
    out.m_93.z = _2846;
    out.m_93.w = _2810;
    float _2876 = _2786 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2878 = _2836 + 0.5;
    float _2880 = _2876 * _2576;
    float _2882 = _2850 * _2802;
    float _2884 = _2766 + 0.5;
    if (_2806)
    {
        _2770 = _2794;
    }
    float _2886 = _2770;
    float _2888 = _2776 * _2732;
    float _2890 = _2886;
    if (_2806)
    {
        _2852 = _2856;
    }
    float _2892 = _2852;
    float _2894 = _2788 * _2780;
    float _2896 = _2892;
    if (!_2806)
    {
        _2862 = _2792;
    }
    float _2898 = _2862;
    out.m_95.x = _2878;
    out.m_95.y = _2884;
    if (_2806)
    {
        _2854 = _2886;
    }
    float _2900 = _2854;
    float _2902 = _2900;
    if (!_2806)
    {
        _2890 = _2794;
    }
    float _2904 = _2890;
    if (!_2806)
    {
        float _2906 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2898);
        _2896 = _2906;
    }
    float _2908 = _2896;
    float _2910 = _2842 * _2790;
    float _2912 = _2838 * _2898;
    out.m_97.x = _2882;
    out.m_97.y = _2894;
    out.m_97.z = _2880;
    out.m_97.w = _2888;
    float _2914 = _2840 * _2904;
    float _2916 = -_2910;
    float _2918 = fma(_2838, _2904, _2916);
    if (!_2806)
    {
        float _2920 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2904);
        _2902 = _2920;
    }
    float _2922 = _2902;
    float _2924 = -_2912;
    float _2926 = fma(_2840, _2790, _2924);
    float _2928 = -_2914;
    float _2930 = fma(_2842, _2898, _2928);
    float _2932 = _2918 * _2844;
    float _2934 = -_2908;
    float _2936 = _1326 * _2934;
    float _2938 = _2926 * _2844;
    float _2940 = _2930 * _2844;
    float _2942 = _1332 * _2932;
    float _2944 = fma(_1336, _2874, _2936);
    float _2946 = -_2840;
    float _2948 = _1326 * _2946;
    float _2950 = -_2932;
    float _2952 = _1326 * _2950;
    float _2954 = _1332 * _2908;
    float _2956 = _1334 * _2908;
    float _2958 = fma(_1336, _2838, _2948);
    float _2960 = fma(_1336, _2940, _2952);
    float _2962 = _1332 * _2840;
    float _2964 = _1334 * _2840;
    float _2966 = _1334 * _2932;
    float _2968 = fma(_1346, _2874, _2954);
    float _2970 = fma(_1346, _2940, _2942);
    float _2972 = fma(_1346, _2838, _2962);
    float _2974 = fma(_1350, _2874, _2956);
    float _2976 = fma(_1350, _2838, _2964);
    float _2978 = fma(_1350, _2940, _2966);
    float _2980 = fma(_1354, _2922, _2968);
    float _2982 = fma(_1354, _2938, _2970);
    float _2984 = fma(_1354, _2842, _2972);
    float _2986 = fma(_1338, _2922, _2944);
    float _2988 = fma(_1338, _2842, _2958);
    float _2990 = fma(_1362, _2922, _2974);
    float _2992 = fma(_1362, _2842, _2976);
    float _2994 = fma(_1338, _2938, _2960);
    float _2996 = fma(_1362, _2938, _2978);
    float _2998 = _2980 * _356;
    float _3000 = _2980 * _352;
    float _3002 = _2980 * _360;
    float _3004 = _2982 * _360;
    float _3006 = _2984 * _356;
    float _3008 = _2984 * _352;
    float _3010 = _2982 * _352;
    float _3012 = _2984 * _360;
    float _3014 = fma(_2994, _348, _3004);
    float _3016 = fma(_2988, _330, _3008);
    float _3018 = fma(_2994, _330, _3010);
    float _3020 = fma(_2988, _348, _3012);
    float _3022 = fma(_2988, _340, _3006);
    float _3024 = fma(_2986, _330, _3000);
    float _3026 = fma(_2996, _372, _3014);
    float _3028 = fma(_2986, _348, _3002);
    float _3030 = fma(_2992, _364, _3016);
    float _3032 = fma(_2992, _372, _3020);
    float _3034 = fma(_2990, _364, _3024);
    float _3036 = fma(_2990, _372, _3028);
    float _3038 = _2982 * _356;
    float _3040 = abs(_1725);
    float _3042 = log2(_3040);
    float _3044 = fma(_2996, _364, _3018);
    float _3046 = fma(_2994, _340, _3038);
    float _3048 = fma(_2986, _340, _2998);
    float _3050 = fma(_2992, _368, _3022);
    float _3052 = in.m_99.x;
    float _3054 = fma(_2996, _368, _3046);
    float _3056 = fma(_2990, _368, _3048);
    float _3058 = in.m_99.y;
    bool _3060 = _1725 <= 8000.0;
    bool _3062 = isnan(_1725);
    bool _3064 = _3060 || _3062;
    bool _3066 = isnan(8000.0);
    bool _3068 = _3064 || _3066;
    float _3070 = float(_3068);
    out.m_101.x = _3054;
    out.m_101.y = _3044;
    out.m_101.z = _3026;
    float _3072 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3074 = in.m_99.z;
    float _3076 = exp2(_3072);
    float _3078 = in.m_99.w;
    out.m_103.x = _3050;
    out.m_103.y = _3030;
    out.m_103.z = _3032;
    out.m_105.x = _3052;
    out.m_105.y = _3058;
    float _3080 = fma(_3076, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3082 = precise::clamp(_3080, 0.0, 1.0);
    float _3084 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_107.x = _3056;
    out.m_107.y = _3034;
    out.m_107.z = _3036;
    float _3086 = fma(_3082, -2.0, 3.0);
    float _3088 = _3082 * _3082;
    float _3090 = exp2(_3084);
    out.m_105.z = _3074;
    float _3092 = _3088 * _3086;
    out.m_105.w = _3078;
    float _3094 = -_3092;
    float _3096 = _3094 + 1.0;
    out.gl_Position.x = _2491;
    out.gl_Position.y = _2493;
    out.gl_Position.z = _2608;
    out.gl_Position.w = _2459;
    float _3098 = fma(_3096, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3092);
    float _3100 = _3070 * _3098;
    float _3102 = _3070;
    if (!_2377)
    {
        _3102 = 1.0;
    }
    float _3104 = _3102;
    float _3106 = -_3090;
    float _3108 = _3106 + 1.0;
    out.m_109.z = _2620;
    out.m_109.w = _2459;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3112 = _3108 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3114 = -_2513;
    float _3116 = _3114 + 1.0;
    float _3118 = _3116 * _3110;
    float _3120 = precise::clamp(_3118, 0.0, 1.0);
    float _3122 = _3104;
    float _3124 = _2533;
    if (_2377)
    {
        bool _3126 = _2531 >= _2093;
        bool _3128 = isnan(_2531);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan(_2093);
        bool _3134 = _3130 || _3132;
        float _3136 = float(_3134);
        _3122 = _3136;
    }
    float _3138 = _3122;
    float _3140 = _3112 * _2533;
    float _3142 = -_3112;
    float _3144 = _3142 + 1.0;
    bool _3146 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3148 = isnan(_2333);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3154 = _3150 || _3152;
    float _3156 = _3138 * _2161;
    float _3158 = -_3120;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3162 = _2544 * _3140;
    float _3164 = _2554 * _3140;
    float _3166 = _2544 * _3144;
    float _3168 = -_3156;
    float _3170 = fma(_3168, _3160, 1.0);
    float _3172 = precise::clamp(_3170, 0.0, 1.0);
    float _3174 = fma(_2550, _3162, _2538);
    float _3176 = fma(_2552, _3162, _2540);
    float _3178 = fma(_2544, _3164, _2542);
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3182 = _3140;
    float _3184 = _3164;
    float _3186 = _3160;
    float _3188 = _3162;
    float _3190 = _3172;
    if (!_3154)
    {
        _3182 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3192 = _3182;
    out.m_111.x = _3174;
    out.m_111.y = _3176;
    out.m_111.z = _3178;
    out.m_111.w = _3166;
    float _3194 = _3192;
    float _3196 = _3192;
    if (!_3154)
    {
        _3184 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3198 = _3184;
    float _3200 = _3198;
    float _3202 = _3198;
    if (!_3154)
    {
        _3124 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3204 = _3124;
    out.m_113.x = _3180;
    float _3206 = _3204;
    float _3208 = _3204;
    if (!_3154)
    {
        _3186 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3210 = _3186;
    float _3212 = _3210;
    float _3214 = _3210;
    if (!_3154)
    {
        _3188 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3216 = _3188;
    float _3218 = _3216;
    float _3220 = _3216;
    if (!_3154)
    {
        _3190 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3222 = _3190;
    bool _3224 = !_3154;
    float _3226 = _3222;
    float _3228 = _3222;
    if (!_3224)
    {
        bool _3230 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3232 = isnan(_2333);
        bool _3234 = _3230 || _3232;
        bool _3236 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3238 = _3234 || _3236;
        if (!_3238)
        {
            float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3242 = _2333 + _3240;
            float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3246 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3244;
            float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3252 = 1.0 / _3246;
            float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3258 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3266 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3268 = _3266 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3270 = _3242 * _3252;
            float _3272 = precise::clamp(_3270, 0.0, 1.0);
            float _3274 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3276 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3278 = fma(_3272, _3250, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3280 = fma(_3272, _3276, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3282 = fma(_3272, _3256, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3284 = fma(_3272, _3260, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3286 = fma(_3272, _3264, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3288 = fma(_3272, _3268, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3202 = _3278;
            _3220 = _3286;
            _3196 = _3282;
            _3214 = _3284;
            _3208 = _3280;
            _3228 = _3288;
            _3290 = true;
        }
        else
        {
            bool _3292 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3294 = isnan(_2333);
            bool _3296 = _3292 || _3294;
            bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3300 = _3296 || _3298;
            if (!_3300)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3302 = _3194;
            _3196 = _3302;
            if (!_3300)
            {
                _3200 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3304 = _3200;
            _3202 = _3304;
            if (!_3300)
            {
                _3206 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3306 = _3206;
            _3208 = _3306;
            if (!_3300)
            {
                _3212 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3308 = _3212;
            _3214 = _3308;
            if (!_3300)
            {
                _3218 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3310 = _3218;
            _3220 = _3310;
            if (!_3300)
            {
                _3226 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3312 = _3226;
            bool _3314 = !_3300;
            _3228 = _3312;
            if (!_3314)
            {
                bool _3316 = _2333 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3318 = isnan(_2333);
                bool _3320 = _3316 || _3318;
                bool _3322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3324 = _3320 || _3322;
                if (!_3324)
                {
                    float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3328 = _2333 + _3326;
                    float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3332 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3330;
                    float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3338 = 1.0 / _3332;
                    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3356 = _3328 * _3338;
                    float _3358 = precise::clamp(_3356, 0.0, 1.0);
                    float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3362 = _3360 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3364 = fma(_3358, _3336, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3366 = fma(_3358, _3362, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3368 = fma(_3358, _3342, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3370 = fma(_3358, _3346, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3372 = fma(_3358, _3350, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3374 = fma(_3358, _3354, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3202 = _3364;
                    _3220 = _3372;
                    _3196 = _3368;
                    _3214 = _3370;
                    _3208 = _3366;
                    _3228 = _3374;
                    _3290 = true;
                }
                else
                {
                    _3202 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3220 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3214 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3208 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3228 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3290 = false;
    float _3376 = _3202;
    float _3378 = _3220;
    float _3380 = _3196;
    float _3382 = _3214;
    float _3384 = _3208;
    float _3386 = _3228;
    float _3388 = fma(_3034, -0.5, 0.5);
    float _3390 = precise::clamp(_3388, 0.0, 1.0);
    float _3392 = -_3376;
    float _3394 = _3392 + _3378;
    float _3396 = -_3380;
    float _3398 = _3396 + _3382;
    float _3400 = -_3384;
    float _3402 = _3400 + _3386;
    bool _3404 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3406 = fma(_3390, _3394, _3376);
    float _3408 = fma(_3390, _3398, _3380);
    float _3410 = fma(_3390, _3402, _3384);
    float _3412 = _3406 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3414 = fma(_3408, 0.298911988735198974609375, _3412);
    float _3416 = fma(_3410, 0.114477999508380889892578125, _3414);
    out.m_115.x = 0.0;
    float _3418 = -_3416;
    float _3420 = _3408 + _3418;
    float _3422 = -_3416;
    float _3424 = _3406 + _3422;
    float _3426 = -_3416;
    float _3428 = _3410 + _3426;
    float _3430 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3432 = fma(_3420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    float _3434 = fma(_3424, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    float _3436 = fma(_3428, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3416);
    out.m_113.w = _3430;
    out.m_117.x = _3432;
    out.m_117.y = _3434;
    out.m_117.z = _3436;
    if (!_3404)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3438 = -_2083;
    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3442 = -_2085;
    float _3444 = _3442 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3446 = -_2087;
    float _3448 = _3446 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3450 = _3440 * _3440;
    float _3452 = fma(_3444, _3444, _3450);
    float _3454 = fma(_3448, _3448, _3452);
    float _3456 = sqrt(_3454);
    float _3458 = rsqrt(_3454);
    float _3460 = -_3456;
    float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3464 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3466 = precise::clamp(_3464, 0.0, 1.0);
    float _3468 = _3444 * _3458;
    float _3470 = _3440 * _3458;
    float _3472 = abs(_3466);
    float _3474 = log2(_3472);
    float _3476 = _3448 * _3458;
    float _3478 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3480 = _3034 * _3470;
    float _3482 = -_3470;
    float _3484 = -_3478;
    float _3486 = fma(_3482, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3484);
    float _3488 = fma(_3056, _3468, _3480);
    float _3490 = -_3476;
    float _3492 = fma(_3490, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3486);
    float _3494 = fma(_3036, _3476, _3488);
    float _3496 = precise::clamp(_3494, 0.0, 1.0);
    float _3498 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3500 = _3492 + _3498;
    float _3502 = _3474 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3504 = _3500 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3506 = precise::clamp(_3504, 0.0, 1.0);
    float _3508 = exp2(_3502);
    float _3510 = _3508 * _3506;
    float _3512 = _3496 * _3510;
    float _3514 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3516 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3518 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_115.x = _3514;
    out.m_115.y = _3516;
    out.m_115.z = _3518;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

