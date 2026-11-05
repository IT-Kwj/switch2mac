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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3476 = false;
    bool _2247 = false;
    bool _863 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_58.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3761 = as_type<float>(_128);
        out.gl_Position.z = _3761;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3831 = as_type<float>(_166);
        out.gl_Position.z = _3831;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_65.w;
    float _170 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_63.x;
    float _184 = in.m_63.y;
    float _186 = in.m_63.z;
    float _188 = in.m_58.x;
    float _190 = in.m_58.y;
    float _192 = in.m_58.z;
    float _194 = 0.0;
    float _196 = _170;
    if (!_180)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    bool _210 = !_180;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _170 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _170);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_180;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _170 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _196 = _266;
    }
    float _268 = _196;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _182, _272);
    float _280 = fma(_268, _184, _274);
    float _282 = fma(_268, _186, _276);
    float _284 = fma(_278, _168, _188);
    float _286 = fma(_280, _168, _190);
    float _288 = fma(_282, _168, _192);
    bool _290 = !_270;
    float _308;
    if (!_290)
    {
        float _292 = in.m_67.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_112);
        float _314 = 1.0 / _312;
        float _316 = _146 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _326;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _350;
    float _354 = 1.0 / _330;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _318 + _356;
    float _360 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _362 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _364 = 1.0 / _334;
    float _366 = _358 * _340;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _318 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _374 = _318 + _372;
    bool _376 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_318);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _390 = 1.0 / _338;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _318 + _392;
    float _396 = _370 * _354;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _400 = _318 + _398;
    float _402 = 1.0 / _348;
    float _404 = _374 * _364;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    bool _410 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _412 = isnan(_318);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = 1.0 / _352;
    float _428 = _394 * _390;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _432 = _318 + _430;
    float _434 = fma(_424, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_408, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _438 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _440 = isnan(_318);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _450;
    float _454 = 1.0 / _344;
    float _456 = _400 * _402;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = in.m_67.x;
    float _464 = fma(_452, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = fma(_460, _396, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = _432 * _426;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = fma(_476, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _492 = fma(_480, _396, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_484, _396, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _500;
    float _504 = _322 * _454;
    bool _506 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _508 = isnan(_318);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_502, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = -_420;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _530 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _532 = isnan(_318);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = fma(_468, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = _448 * _524;
    float _546 = -_448;
    float _548 = _546 + 1.0;
    bool _550 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _552 = isnan(_318);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _360 * _462;
    float _564 = _362 * _462;
    float _566 = _516 * _548;
    float _568 = -_516;
    float _570 = _568 + 1.0;
    bool _572 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _574 = isnan(_318);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = fma(_488, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _586 = fma(_528, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _588 = _540 * _570;
    float _590 = -_540;
    float _592 = _590 + 1.0;
    bool _594 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _596 = isnan(_318);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = trunc(_562);
    int _608 = int(_606);
    float _610 = -_560;
    float _612 = _610 + 1.0;
    float _614 = _560 * _592;
    float _616 = -_582;
    float _618 = _616 + 1.0;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _582 * _612;
    float _626 = trunc(_564);
    int _628 = int(_626);
    float _630 = _604 * _618;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _632;
    float _636 = _386 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = -_386;
    float _644 = _642 + 1.0;
    float _646 = fma(_634, _504, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _648;
    float _652 = _434 * _636;
    float _654 = _464 * _636;
    float _656 = _490 * _636;
    float _658 = fma(_640, _504, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _660 = fma(_650, _504, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    int _664 = _608 << 4;
    int _666 = _664 + 1712;
    float _668 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].y, _654);
    int _670 = _628 << 4;
    int _672 = _670 + 1968;
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    uint _677 = uint(int(uint(_666) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[int(_687)][_689];
    float _693 = fma(_470, _630, _662);
    float _695 = fma(_492, _630, _668);
    float _697 = fma(_494, _630, _674);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _703 = fma(_436, _624, _693);
    float _705 = fma(_518, _624, _695);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    uint _711 = uint(int(uint(_672) >> uint(2)));
    uint _713 = uint(int(uint(int(_711)) >> uint(2)));
    int _715 = int(_711) & 3;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[int(_713)][_715];
    int _719 = int(_711) + 1;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    int _723 = _719 & 3;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[int(_721)][_723];
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _731 = fma(_520, _624, _697);
    float _733 = fma(_709, _456, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _735 = fma(_701, _456, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _737 = fma(_729, _456, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _739 = fma(_542, _614, _703);
    float _741 = fma(_584, _614, _705);
    int _743 = _666 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[int(_747)][_749];
    float _753 = in.m_65.x;
    float _755 = in.m_65.y;
    float _757 = in.m_65.z;
    float _759 = fma(_586, _614, _731);
    float _761 = fma(_658, _588, _741);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _763;
    int _767 = _672 + 8;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[int(_771)][_773];
    float _777 = fma(_646, _588, _739);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _783;
    float _787 = fma(_660, _588, _759);
    float _789 = fma(_765, _472, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _791 = fma(_737, _566, _761);
    float _793 = fma(_781, _472, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _795 = fma(_733, _566, _777);
    float _797 = fma(_785, _472, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _799 = fma(_735, _566, _787);
    float _801 = fma(_789, _544, _791);
    float _803 = fma(_793, _544, _795);
    float _805 = fma(_797, _544, _799);
    float _807 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].y, _801);
    float _809 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].x, _803);
    float _811 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].z, _805);
    float _813 = _807 * _755;
    float _815 = _809 * _753;
    float _817 = _811 * _757;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _821 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _823 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _825 = _725 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _717 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _829 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _835 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _839 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _775 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _843 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _845 = !_388;
    float _861;
    if (!_845)
    {
        float _847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _849 = _462 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _853 = _851 * _847;
        float _855 = floor(_853);
        float _857 = -_855;
        float _859 = _853 + _857;
        _861 = _859;
        _863 = true;
    }
    else
    {
        float _865 = float(_112);
        float _867 = 1.0 / _865;
        float _869 = _146 * _867;
        _861 = _869;
    }
    _863 = false;
    float _871 = _861;
    float _873 = _462 * 2.0;
    float _875 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _877 = log2(_875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _891 = 1.0 / _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _897 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _899;
    float _903 = floor(_873);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _909 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _913 = _911 != 0;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _917 = _915 != 0;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _921 = _919 != 0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _927 = 1.0 / _885;
    float _929 = _901 * _891;
    float _931 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _909);
    bool _933 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _941 = _937 || _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _943;
    float _947 = 1.0 / _889;
    float _949 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _951 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _953 = _903 > 0.0;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _959 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _949);
    float _961 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _951);
    bool _963 = _903 >= 0.0;
    bool _965 = isnan(_903);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    float _973 = 1.0 / _895;
    float _975 = in.m_67.y;
    float _977 = _957 * _927;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _983 = _971 ? 0 : 1;
    float _985 = 1.0 / _907;
    float _987 = in.m_67.z;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _993 = _945 * _947;
    bool _995 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _997 = isnan(_871);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / _981;
    float _1009 = _925 * _973;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1011;
    float _1015 = -_1005;
    float _1017 = _1015 + 1.0;
    bool _1019 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(1.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = 1.0 / _991;
    float _1031 = _877 * _146;
    float _1033 = _975 * 2.0;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1035;
    float _1039 = exp2(_1031);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1043 = 1.0 + _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1049 = _987 * 2.0;
    float _1051 = _1037 * _985;
    float _1053 = _1047 * _1007;
    float _1055 = 1.0 / _1043;
    float _1057 = _975 + _987;
    float _1059 = _1013 * _1029;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1063 = _871 + _1061;
    float _1065 = _1057 + (-1.0);
    float _1067 = fma(_929, _1063, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1069 = -_1039;
    float _1071 = _1069 + 1.0;
    float _1073 = _462 + _987;
    float _1075 = floor(_1049);
    float _1077 = _987 + (-0.5);
    float _1079 = _1073 + (-1.0);
    float _1081 = _462 + _975;
    float _1083 = floor(_1033);
    float _1085 = _941 ? _1071 : 0.0;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1091 = _1081 + (-1.0);
    if (_1027)
    {
        float _1093 = _1085 * _1055;
        _148 = _1093;
    }
    float _1095 = _148;
    float _1097 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1099 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1101 = isnan(_871);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    bool _1111 = _1075 > 0.0;
    float _1113 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _931);
    bool _1115 = _1075 >= 0.0;
    bool _1117 = isnan(_1075);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    float _1125 = -_1109;
    float _1127 = _1125 + 1.0;
    bool _1129 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1131 = isnan(_871);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1143 = _871 + _1141;
    int _1145 = _1123 ? 0 : 1;
    bool _1147 = _1083 > 0.0;
    float _1149 = _1139 * _1127;
    bool _1151 = _1083 >= 0.0;
    bool _1153 = isnan(_1083);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    float _1161 = -_1139;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_1009, _1143, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1167 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1169 = isnan(_871);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1175 = _1171 || _1173;
    float _1177 = float(_1175);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1181 = _871 + _1179;
    bool _1183 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1185 = isnan(_871);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _959);
    float _1197 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _1199 = _1177 * _1163;
    float _1201 = -_1177;
    float _1203 = _1201 + 1.0;
    bool _1205 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1207 = isnan(_871);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -_1193;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_993, _1181, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1223 = _1193 * _1203;
    bool _1225 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1227 = isnan(_871);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_1215;
    float _1239 = _1237 + 1.0;
    float _1241 = _1215 * _1219;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1245 = _871 + _1243;
    float _1247 = _1005 * _1239;
    bool _1249 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1251 = isnan(_871);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = _1235 * _1017;
    float _1263 = -_1235;
    float _1265 = _1263 + 1.0;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1269 = _871 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1273 = _871 + _1271;
    float _1275 = fma(_977, _1245, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1279 = _871 + _1277;
    float _1281 = _1259 * _1265;
    float _1283 = fma(_1053, _1269, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1285 = fma(_1059, _1273, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1287 = _1159 ? 0 : 1;
    float _1289 = _1067 * _1281;
    float _1291 = abs(_1197);
    bool _1293 = _1291 > 0.001000000047497451305389404296875;
    float _1295 = -_1259;
    float _1297 = _1295 + 1.0;
    int _1299 = ~_1287;
    int _1301 = _1299 + 1;
    int _1303 = _1301 + 1;
    float _1305 = fma(_1051, _1279, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1307 = _1293 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1289);
    int _1311 = _1303;
    float _1313 = _1195;
    if (!_1147)
    {
        int _1315 = ~_1287;
        int _1317 = _1315 + 1;
        _1311 = _1317;
    }
    int _1319 = _1311;
    bool _1321 = !_917;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = fma(_1165, _1261, _1309);
    float _1327 = _1197 + _1307;
    bool _1329 = !_913;
    int _1331 = _1329 ? 0 : 1;
    int _1333 = abs(_1323);
    float _1335 = fma(_1221, _1247, _1325);
    int _1337 = abs(_1331);
    bool _1339 = !_921;
    int _1341 = _1339 ? 0 : 1;
    float _1343 = fma(_1275, _1241, _1335);
    int _1345 = ~_983;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1305, _1223, _1343);
    int _1353 = _1349;
    float _1355 = _1327;
    if (!_953)
    {
        int _1357 = ~_983;
        int _1359 = _1357 + 1;
        _1353 = _1359;
    }
    int _1361 = _1353;
    int _1363 = abs(_1341);
    float _1365 = fma(_1283, _1199, _1351);
    float _1367 = float(_1333);
    float _1369 = rsqrt(_1113);
    float _1371 = float(_1361);
    float _1373 = fma(_1285, _1149, _1365);
    float _1375 = abs(_1195);
    float _1377 = abs(_1327);
    float _1379 = precise::max(_1375, _1377);
    int _1381 = ~_1145;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = _1367 * _1371;
    int _1389 = _1385;
    if (!_1111)
    {
        int _1391 = ~_1145;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    float _1397 = _1387 * (-2.0);
    bool _1399 = _1379 >= 16.0;
    float _1401 = fma(_1087, _1397, _1087);
    float _1403 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1405 = float(_1337);
    float _1407 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1409 = float(_1395);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1415 = float(_1363);
    float _1417 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1373);
    float _1419 = _975 + (-0.5);
    float _1421 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1423 = _1405 * _1409;
    float _1425 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1429 = float(_1319);
    float _1431 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1421);
    float _1433 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1435 = _1423 * (-2.0);
    float _1437 = fma(_1401, _1095, _1427);
    float _1439 = _1415 * _1429;
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1431);
    float _1443 = _284 * _1433;
    float _1445 = fma(_1097, _1435, _1097);
    float _1447 = _1439 * (-2.0);
    float _1449 = in.m_69.y;
    float _1451 = _1441 * _1443;
    float _1453 = _462 + (-0.5);
    float _1455 = _1403 * _1403;
    float _1457 = fma(_1451, _1447, _1451);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1461 = fma(_1089, _1447, _1089);
    if (_1399)
    {
        float _1463 = _1195 * 0.0625;
        _1313 = _1463;
    }
    float _1465 = _1313;
    float _1467 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1457);
    float _1469 = fma(_1445, _1095, _1459);
    float _1471 = in.m_71.x;
    float _1473 = in.m_71.y;
    float _1475 = in.m_71.z;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1479 = _1477 != 0;
    float _1481 = fma(_1461, _1095, _1467);
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1485 = _1483 != 0;
    float _1487 = _1469 * 0.15915493667125701904296875;
    bool _1489 = _975 > 0.5;
    float _1491 = fma(_1407, _1407, _1455);
    float _1493 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1495 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1497 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1499 = _1489;
    if (_1399)
    {
        float _1501 = _1327 * 0.0625;
        _1355 = _1501;
    }
    float _1503 = _1355;
    float _1505 = abs(_1465);
    bool _1507 = _1505 != 0.0;
    bool _1509 = isnan(_1505);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.0);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1425, _1425, _1491);
    float _1519 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1493);
    float _1521 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1495);
    float _1523 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1497);
    float _1525 = -_1449;
    float _1527 = _1525 + 1.0;
    float _1529 = abs(_1503);
    bool _1531 = _1529 == 0.0;
    bool _1533 = !_1515;
    bool _1535 = _1531 && _1533;
    float _1537 = rsqrt(_1517);
    float _1539 = _1481 * 0.15915493667125701904296875;
    float _1541 = _1437 * 0.15915493667125701904296875;
    float _1543 = _1449;
    float _1545 = _1541;
    if (_1479)
    {
        float _1547 = _1489 ? _1527 : _1449;
        _1543 = _1547;
    }
    float _1549 = _1543;
    float _1551 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1553 = abs(_1503);
    bool _1555 = _1553 == 0.0;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1473);
    float _1559 = _1487 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    bool _1563 = _462 > 0.5;
    bool _1565 = _1563 && _1485;
    float _1567 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1471);
    int _1571 = as_type<int>(_1557);
    if (_1535)
    {
        bool _1573 = as_type<int>(_1503) >= 0;
        _1499 = _1573;
    }
    bool _1575 = _1499;
    float _1577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1475);
    float _1579 = _1567 * _1569;
    float _1581 = _1487 * 6.283185482025146484375;
    float _1583 = cos(_1581);
    float _1585 = _897 * _1557;
    int _1587 = _1575 ? (-1) : 0;
    if (_1535)
    {
        int _1589 = _1575 ? 0 : 1078530011;
        _1571 = _1589;
    }
    int _1591 = _1571;
    float _1593 = _1551 * _1577;
    float _1595 = _1407 * _1537;
    float _1597 = _1403 * _1537;
    float _1599 = _1425 * _1537;
    float _1601 = _1539 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = _1539 * 6.283185482025146484375;
    float _1607 = cos(_1605);
    float _1609 = _1541 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1541 * 6.283185482025146484375;
    float _1615 = cos(_1613);
    int _1617 = as_type<int>(_1537);
    if (_1535)
    {
        int _1619 = int(0x80000000) & as_type<int>(_1465);
        int _1621 = _1591 | _1619;
        _1545 = as_type<float>(_1621);
    }
    float _1623 = _1545;
    bool _1625 = !_1515;
    bool _1627 = _1625 && _1555;
    float _1629 = _1623;
    float _1631 = _1623;
    if (!_1627)
    {
        float _1633 = abs(_1465);
        bool _1635 = _1633 != as_type<float>(0x7f800000u /* inf */);
        bool _1637 = isnan(_1633);
        bool _1639 = _1635 || _1637;
        bool _1641 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1643 = _1639 || _1641;
        float _1645 = abs(_1503);
        bool _1647 = _1645 == as_type<float>(0x7f800000u /* inf */);
        float _1649 = abs(_1503);
        bool _1651 = _1649 == as_type<float>(0x7f800000u /* inf */);
        bool _1653 = !_1643;
        bool _1655 = _1651 && _1653;
        if (_1655)
        {
            bool _1657 = as_type<int>(_1503) >= 0;
            _1587 = _1657 ? (-1) : 0;
        }
        int _1659 = _1587;
        if (_1655)
        {
            _1617 = 1075235812;
        }
        int _1661 = _1617;
        int _1663 = _1661;
        if (_1655)
        {
            int _1665 = ~_1659;
            int _1667 = (_1665 != 0) ? _1661 : 1061752795;
            _1663 = _1667;
        }
        int _1669 = _1663;
        if (_1655)
        {
            int _1671 = int(0x80000000) & as_type<int>(_1465);
            int _1673 = _1669 | _1671;
            _1629 = as_type<float>(_1673);
        }
        float _1675 = _1629;
        bool _1677 = !_1643;
        bool _1679 = _1677 && _1647;
        _1631 = _1675;
        if (!_1679)
        {
            float _1681 = abs(_1465);
            float _1683 = abs(_1503);
            float _1685 = precise::max(_1681, _1683);
            float _1687 = abs(_1465);
            float _1689 = abs(_1503);
            float _1691 = precise::min(_1687, _1689);
            float _1693 = 1.0 / _1685;
            float _1695 = abs(_1465);
            float _1697 = abs(_1503);
            bool _1699 = _1695 > _1697;
            bool _1701 = as_type<int>(_1503) >= 0;
            float _1703 = _1691 * _1693;
            float _1705 = _1703 * _1703;
            float _1707 = _1705 + 11.33538818359375;
            float _1709 = fma(_1705, _1707, 28.84246826171875);
            float _1711 = fma(_1705, _1709, 19.6966705322265625);
            float _1713 = fma(_1705, -0.82336294651031494140625, -5.674867153167724609375);
            float _1715 = abs(_1465);
            float _1717 = abs(_1503);
            float _1719 = _1715 + _1717;
            int _1721 = as_type<int>(_1465) & int(0x80000000);
            float _1723 = fma(_1705, _1713, -6.565555095672607421875);
            float _1725 = 1.0 / _1711;
            bool _1727 = _1719 > as_type<float>(0x7f800000u /* inf */);
            bool _1729 = isnan(_1719);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1735 = _1731 || _1733;
            float _1737 = _1705 * _1723;
            float _1739 = _1703 * _1737;
            float _1741 = fma(_1739, _1725, _1703);
            float _1743 = _1741;
            _1631 = _1719;
            if (_1699)
            {
                float _1745 = -_1741;
                float _1747 = _1745 + 1.57079637050628662109375;
                _1743 = _1747;
            }
            float _1749 = _1743;
            int _1751 = as_type<int>(_1749);
            if (!_1701)
            {
                float _1753 = -_1749;
                float _1755 = _1753 + 3.1415927410125732421875;
                _1751 = as_type<int>(_1755);
            }
            int _1757 = _1751;
            if (!_1735)
            {
                int _1759 = _1721 | _1757;
                _1631 = as_type<float>(_1759);
            }
        }
    }
    float _1761 = _1631;
    float _1763 = _1561 * _1611;
    float _1765 = _1583 * _1615;
    float _1767 = _1583 * _1607;
    float _1769 = _1761 * (-0.15915493667125701904296875);
    float _1771 = _1583 * _1611;
    float _1773 = _1561 * _1615;
    float _1775 = fma(_1603, _1765, _1763);
    float _1777 = _1767 * _1585;
    float _1779 = _1769 * 6.283185482025146484375;
    float _1781 = cos(_1779);
    float _1783 = _1561 * _1607;
    float _1785 = _1615 * _1607;
    float _1787 = _1611 * _1607;
    float _1789 = fma(_1603, _1763, _1765);
    float _1791 = -_1773;
    float _1793 = fma(_1603, _1771, _1791);
    float _1795 = -_1585;
    float _1797 = _1603 * _1795;
    float _1799 = fma(_1775, _1579, _1777);
    float _1801 = _1769 * 6.283185482025146484375;
    float _1803 = sin(_1801);
    float _1805 = -_1771;
    float _1807 = fma(_1603, _1773, _1805);
    float _1809 = _1783 * _1585;
    float _1811 = fma(_1785, _1579, _1797);
    float _1813 = fma(_1793, _1593, _1799);
    bool _1815 = _1473 != 0.0;
    bool _1817 = isnan(_1473);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1807, _1579, _1809);
    float _1827 = fma(_1787, _1593, _1811);
    float _1829 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1831 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1833 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1835 = fma(_1789, _1593, _1825);
    float _1837 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1829);
    float _1839 = -_1781;
    float _1841 = _1839 + 1.0;
    float _1843 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1831);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1833);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1837);
    float _1849 = _1599 * _1599;
    float _1851 = _1599 * _1803;
    float _1853 = _1595 * _1841;
    float _1855 = in.m_69.x;
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1843);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1845);
    float _1861 = fma(_1841, _1849, _1781);
    float _1863 = -_1851;
    float _1865 = fma(_1597, _1853, _1863);
    float _1867 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1869 = in.m_73.x;
    float _1871 = in.m_73.y;
    float _1873 = in.m_73.z;
    float _1875 = _1595 * _1803;
    float _1877 = _1597 * _1841;
    float _1879 = fma(_1595, _1853, _1781);
    float _1881 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1883 = _1867 * _1865;
    float _1885 = _1597 * _1803;
    float _1887 = fma(_1599, _1877, _1875);
    bool _1889 = _1471 == 0.0;
    bool _1891 = !_1823;
    bool _1893 = _1889 && _1891;
    float _1895 = fma(_1881, _1879, _1883);
    float _1897 = -_1885;
    float _1899 = fma(_1599, _1853, _1897);
    float _1901 = _1867 * _1887;
    bool _1903 = _1475 == 0.0;
    bool _1905 = _1903 && _1893;
    float _1907 = fma(_1599, _1853, _1885);
    float _1909 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1911 = fma(_1881, _1899, _1901);
    float _1913 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1519);
    float _1915 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1523);
    float _1917 = fma(_1909, _1907, _1895);
    float _1919 = fma(_1909, _1861, _1911);
    float _1921 = _1913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1923 = _1915 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1925 = _1887;
    float _1927 = _1911;
    float _1929 = _1807;
    float _1931 = _1923;
    if (_1485)
    {
        _1925 = _1855;
    }
    float _1933 = _1925;
    float _1935 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1521);
    float _1937 = _1933;
    if (!_1485)
    {
        _1927 = _1855;
    }
    float _1939 = _1927;
    float _1941 = _1921 + _1917;
    float _1943 = _1923 + _1919;
    float _1945 = _1869;
    float _1947 = _1871;
    float _1949 = _1873;
    float _1951 = _1939;
    if (!_1905)
    {
        float _1953 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1869);
        _1945 = _1953;
    }
    float _1955 = _1945;
    if (!_1905)
    {
        float _1957 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1871);
        _1947 = _1957;
    }
    float _1959 = _1947;
    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1963 = _1941 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1967 = _1943 + _1965;
    if (!_1905)
    {
        float _1969 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1873);
        _1949 = _1969;
    }
    float _1971 = _1949;
    float _1973 = fma(_1597, _1853, _1851);
    float _1975 = _1963 * _1963;
    float _1977 = _1967 * _1967;
    float _1979 = fma(_1597, _1877, _1781);
    float _1981 = -_1875;
    float _1983 = fma(_1599, _1877, _1981);
    float _1985 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1987 = _1975 + _1977;
    float _1989 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1991 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1993 = _1975;
    float _1995 = _1977;
    if (_1565)
    {
        float _1997 = -_1933;
        float _1999 = _1997 + 1.0;
        _1937 = _1999;
    }
    float _2001 = _1937;
    float _2003 = sqrt(_1987);
    float _2005 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2007 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2009 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2011 = -_1603;
    float _2013 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1985);
    float _2015 = -_1603;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1989);
    float _2019 = -_1603;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1991);
    if (_1485)
    {
        _1951 = _2001;
    }
    float _2023 = _1951;
    float _2025 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2005);
    float _2027 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2007);
    float _2029 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2009);
    float _2031 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2033 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2035 = _1867 * _1979;
    float _2037 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2039 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2031);
    float _2041 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2033);
    bool _2043 = _2003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2037);
    float _2047 = fma(_1881, _1973, _2035);
    float _2049 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2013);
    float _2051 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2017);
    float _2053 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2021);
    float _2055 = fma(_1909, _1983, _2047);
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2059 = _1935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2061 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2025);
    float _2063 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2027);
    float _2065 = _2059 + _2055;
    float _2067 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2029);
    float _2069 = _2055;
    float _2071 = _2025;
    float _2073 = _2063;
    if (!_2043)
    {
        _2069 = _1977;
    }
    float _2075 = _2069;
    float _2077 = _2075;
    if (!_2043)
    {
        _1929 = _1975;
    }
    float _2079 = _1929;
    float _2081 = _2079;
    if (!_2043)
    {
        _1993 = _1941;
    }
    float _2083 = _1993;
    float _2085 = _2083;
    if (!_2043)
    {
        _1995 = _1943;
    }
    float _2087 = _1995;
    float _2089 = _2087;
    if (!_2043)
    {
        _2071 = _2065;
    }
    float _2091 = _2071;
    bool _2093 = !_2043;
    float _2095 = _2091;
    if (!_2093)
    {
        float _2097 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2101 = _2003 + _2099;
        float _2103 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2105 = rsqrt(_1987);
        float _2107 = _2101 * _2097;
        float _2109 = _2107 * 0.15915493667125701904296875;
        float _2111 = _2109 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        float _2115 = _2109 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = fma(_2113, _2103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2121 = _2105 * _2119;
        float _2123 = _2117 + (-1.0);
        float _2125 = fma(_1963, _2121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2127 = fma(_1967, _2121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2129 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2133 = _2125 + _2131;
        float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2137 = _2127 + _2135;
        float _2139 = fma(_2065, _2117, _2129);
        float _2141 = _2133 * _2133;
        float _2143 = _2137 * _2137;
        _2095 = _2139;
        _2081 = _2141;
        _2077 = _2143;
        _2089 = _2127;
        _2085 = _2125;
    }
    float _2145 = _2095;
    float _2147 = _2081;
    float _2149 = _2077;
    float _2151 = _2089;
    float _2153 = _2085;
    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2157 = _2145 + _2155;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2161 = _2049 * _1959;
    float _2163 = _2051 * _1959;
    float _2165 = fma(_2157, _2157, _2147);
    float _2167 = _2053 * _1959;
    float _2169 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2039);
    float _2171 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2041);
    float _2173 = _2165 + _2149;
    float _2175 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2045);
    float _2177 = fma(_2061, _1955, _2161);
    float _2179 = fma(_2063, _1955, _2163);
    float _2181 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2183 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2185 = sqrt(_2173);
    float _2187 = fma(_2067, _1955, _2167);
    float _2189 = _2181 * _2057;
    float _2191 = fma(_2169, _1971, _2177);
    float _2193 = fma(_2171, _1971, _2179);
    float _2195 = _2183 * _2159;
    float _2197 = fma(_2175, _1971, _2187);
    out.m_75.x = _831;
    out.m_75.y = _829;
    out.m_75.z = _839;
    out.m_75.w = _819;
    out.m_77.x = _835;
    out.m_77.y = _833;
    out.m_77.z = _843;
    bool _2199 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2201 = isnan(_2185);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2207 = _2203 || _2205;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    out.m_81.x = _2189;
    out.m_81.y = _2195;
    out.m_83.x = _2191;
    out.m_83.y = _2193;
    out.m_83.z = _2197;
    float _2209 = _2171;
    uint _2211 = as_type<uint>(_2153);
    if (!_2207)
    {
        _2209 = 1.0;
    }
    float _2213 = _2209;
    bool _2215 = !_2207;
    float _2217 = _2213;
    if (!_2215)
    {
        bool _2219 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2221 = isnan(_2185);
        bool _2223 = _2219 || _2221;
        bool _2225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2227 = _2223 || _2225;
        if (!_2227)
        {
            float _2229 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2231 = _2185 + _2229;
            float _2233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2235 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2233;
            float _2237 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2239 = _2237 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2241 = 1.0 / _2235;
            float _2243 = _2231 * _2241;
            float _2245 = fma(_2243, _2239, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2217 = _2245;
            _2247 = true;
        }
        else
        {
            bool _2249 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2251 = isnan(_2185);
            bool _2253 = _2249 || _2251;
            bool _2255 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2257 = _2253 || _2255;
            if (!_2257)
            {
                float _2259 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2261 = _2185 + _2259;
                float _2263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2265 = _2263 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2267 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2269 = _2267 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2271 = 1.0 / _2265;
                float _2273 = _2261 * _2271;
                float _2275 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2217 = _2275;
                _2247 = true;
            }
            else
            {
                _2217 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2247 = false;
    float _2277 = _2217;
    float _2279 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2281 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2283 = floor(_2279);
    float _2285 = floor(_2281);
    float _2287 = -_2283;
    float _2289 = _2279 + _2287;
    float _2291 = -_2285;
    float _2293 = _2281 + _2291;
    float2 _7248 = float2(_2289, _2293);
    float _2295 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7248, float2(0.0), isnan(_7248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7248, float2(0.0), isnan(_7248)), level(0.0)).x;
    float _2297 = _2059 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2299 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2301 = _2151 + _2299;
    float _2303 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2297);
    float _2305 = fma(_2301, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2307 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2303);
    float _2309 = _2059 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2311 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2313 = _2307 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2315 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2309);
    float _2317 = _2059 + _2311;
    float _2319 = 1.0 / _2313;
    float _2321 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2315);
    float _2323 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2325 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2327 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2323);
    float _2329 = _2325 + _2313;
    float _2331 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2327);
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2335 = _2329 * _2319;
    float _2337 = _2335 * 0.5;
    float _2339 = trunc(_2333);
    int _2341 = int(_2339);
    float _2343 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2345 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2343);
    float _2347 = 1.0 / _2345;
    bool _2349 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2351 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan(0.5);
    bool _2357 = _2353 || _2355;
    int _2359 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2361 = _2341 + _2359;
    int _2363 = _2361 + 1;
    float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2367 = _2347 * _2365;
    float _2369 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2371 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _2373 = 2;
    float _2375 = _2277;
    if (_2357)
    {
        _2371 = _2305;
    }
    float _2377 = _2371;
    bool _2379 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2381 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2369);
    bool _2383 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2385 = !_2379;
    int _2387 = _2385 ? 0 : 1;
    float _2389 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2381);
    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2393 = _2377;
    if (!_2379)
    {
        _2373 = 1;
    }
    int _2395 = _2373;
    float _2397 = trunc(_2391);
    int _2399 = int(_2397);
    int _2401 = _2395;
    if (!_2383)
    {
        _2401 = _2387;
    }
    int _2403 = _2401;
    bool _2405 = _2363 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2407 = _2403 << 6;
    int _2409 = _2407 + 48;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    uint _2413 = uint(int(uint(int(_2411)) >> uint(2)));
    int _2415 = int(_2411) & 3;
    float _2417 = (*spvDescriptorSet0.vp_c15)._m0[int(_2413)][_2415];
    int _2419 = int(_2411) + 1;
    uint _2421 = uint(int(uint(_2419) >> uint(2)));
    int _2423 = _2419 & 3;
    float _2425 = (*spvDescriptorSet0.vp_c15)._m0[int(_2421)][_2423];
    int _2427 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2429 = _2399 + _2427;
    int _2431 = _2429 + 1;
    int _2433 = _2407 + 56;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    uint _2437 = uint(int(uint(int(_2435)) >> uint(2)));
    int _2439 = int(_2435) & 3;
    float _2441 = (*spvDescriptorSet0.vp_c15)._m0[int(_2437)][_2439];
    int _2443 = int(_2435) + 1;
    uint _2445 = uint(int(uint(_2443) >> uint(2)));
    int _2447 = _2443 & 3;
    float _2449 = (*spvDescriptorSet0.vp_c15)._m0[int(_2445)][_2447];
    float _2451 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2453 = _2153 + _2451;
    int _2455 = _2363 | _2431;
    float _2457 = fma(_2453, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _2459 = _2455 < 0;
    bool _2461 = _2459 || _2405;
    int _2463 = _2407 + 64;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    uint _2467 = uint(int(uint(int(_2465)) >> uint(2)));
    int _2469 = int(_2465) & 3;
    float _2471 = (*spvDescriptorSet0.vp_c15)._m0[int(_2467)][_2469];
    int _2473 = int(_2465) + 1;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    int _2477 = _2473 & 3;
    float _2479 = (*spvDescriptorSet0.vp_c15)._m0[int(_2475)][_2477];
    float _2481 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2483 = _2145 + _2481;
    float _2485 = _2453;
    float _2487 = _2483;
    float _2489 = as_type<float>(_2403);
    if (_2357)
    {
        _2485 = _2457;
    }
    float _2491 = _2485;
    bool _2493 = _2431 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2495 = _2493 || _2461;
    float _2497 = fma(_2483, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2499 = _2407 + 72;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    uint _2503 = uint(int(uint(int(_2501)) >> uint(2)));
    int _2505 = int(_2501) & 3;
    float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
    int _2509 = int(_2501) + 1;
    uint _2511 = uint(int(uint(_2509) >> uint(2)));
    int _2513 = _2509 & 3;
    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[int(_2511)][_2513];
    float _2517 = _2491;
    if (_2357)
    {
        _2487 = _2497;
    }
    float _2519 = _2487;
    int _2521 = _2407 + 96;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    uint _2525 = uint(int(uint(int(_2523)) >> uint(2)));
    int _2527 = int(_2523) & 3;
    float _2529 = (*spvDescriptorSet0.vp_c15)._m0[int(_2525)][_2527];
    int _2531 = int(_2523) + 1;
    uint _2533 = uint(int(uint(_2531) >> uint(2)));
    int _2535 = _2531 & 3;
    float _2537 = (*spvDescriptorSet0.vp_c15)._m0[int(_2533)][_2535];
    int _2539 = _2407 + 104;
    uint _2541 = uint(int(uint(_2539) >> uint(2)));
    uint _2543 = uint(int(uint(int(_2541)) >> uint(2)));
    int _2545 = int(_2541) & 3;
    float _2547 = (*spvDescriptorSet0.vp_c15)._m0[int(_2543)][_2545];
    int _2549 = int(_2541) + 1;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    int _2553 = _2549 & 3;
    float _2555 = (*spvDescriptorSet0.vp_c15)._m0[int(_2551)][_2553];
    float _2557 = _2519;
    if (!_2357)
    {
        float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2561 = _2059 + _2559;
        float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2565 = _1921 + _2563;
        float _2567 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2569 = -_1923;
        float _2571 = _2569 + _2305;
        float _2573 = _2561 * _2561;
        float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2577 = _1923 + _2575;
        float _2579 = fma(_2565, _2565, _2573);
        float _2581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2583 = fma(_2577, _2577, _2579);
        float _2585 = sqrt(_2583);
        float _2587 = _2567 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2589 = precise::min(_2585, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2591 = _2589 * _2581;
        float _2593 = -_2059;
        float _2595 = _2593 + _2497;
        float _2597 = _2587 * _2591;
        float _2599 = -_1921;
        float _2601 = _2599 + _2457;
        float _2603 = fma(_2595, _2597, _2059);
        float _2605 = fma(_2601, _2597, _1921);
        float _2607 = fma(_2571, _2597, _1923);
        _2557 = _2603;
        _2517 = _2605;
        _2211 = as_type<uint>(_2597);
        _2393 = _2607;
    }
    float _2609 = _2557;
    float _2611 = _2517;
    uint _2613 = _2211;
    float _2615 = _2393;
    float _2617 = _2317 * _2537;
    uint _2619 = _2613;
    if (!_2495)
    {
        int _2621 = _2431 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2623 = _2621 + _2363;
        _2619 = uint(_2623);
    }
    uint _2625 = _2619;
    float _2627 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2629 = _2317 * _2479;
    float _2631 = fma(_1921, _2529, _2617);
    float _2633 = _2317 * _2425;
    float _2635 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2627);
    int _2637 = as_type<int>(_2627);
    if (!_2495)
    {
        uint _2639 = uint(int(uint(int(_2625)) >> uint(2)));
        _2637 = int(_2639);
    }
    int _2641 = _2637;
    float _2643 = fma(_1923, _2547, _2631);
    float _2645 = fma(_1921, _2417, _2633);
    float _2647 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2635);
    int _2649 = _2407 + 80;
    uint _2651 = uint(int(uint(_2649) >> uint(2)));
    uint _2653 = uint(int(uint(int(_2651)) >> uint(2)));
    int _2655 = int(_2651) & 3;
    float _2657 = (*spvDescriptorSet0.vp_c15)._m0[int(_2653)][_2655];
    int _2659 = int(_2651) + 1;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    int _2663 = _2659 & 3;
    float _2665 = (*spvDescriptorSet0.vp_c15)._m0[int(_2661)][_2663];
    float _2667 = _2643 + _2555;
    int _2669 = as_type<int>(_2643);
    if (!_2495)
    {
        int _2671 = int(_2625) << 2;
        _2669 = _2671;
    }
    int _2673 = _2669;
    float _2675 = _2647 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2677 = fma(_1921, _2471, _2629);
    float _2679 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _2681 = _2673;
    if (!_2495)
    {
        int _2683 = 12 & _2673;
        _2681 = _2683;
    }
    int _2685 = _2681;
    float _2687 = 1.0 / _2667;
    float _2689 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2691 = _2407 + 88;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    uint _2695 = uint(int(uint(int(_2693)) >> uint(2)));
    int _2697 = int(_2693) & 3;
    float _2699 = (*spvDescriptorSet0.vp_c15)._m0[int(_2695)][_2697];
    int _2701 = int(_2693) + 1;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    int _2705 = _2701 & 3;
    float _2707 = (*spvDescriptorSet0.vp_c15)._m0[int(_2703)][_2705];
    if (!_2495)
    {
        int _2709 = _2641 << 4;
        int _2711 = _2709 + _2685;
        _2375 = as_type<float>(_2711);
    }
    float _2713 = _2375;
    float _2715 = fma(_1923, _2441, _2645);
    float _2717 = -_2689;
    float _2719 = fma(_2717, _2679, 1.0);
    float _2721 = fma(_1923, _2507, _2677);
    float _2723 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2725 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2727 = _2715 + _2449;
    float _2729 = _2713;
    if (!_2495)
    {
        int _2731 = as_type<int>(_2713) + 400;
        uint _2733 = uint(int(uint(_2731) >> uint(2)));
        uint _2735 = uint(int(uint(int(_2733)) >> uint(2)));
        int _2737 = int(_2733) & 3;
        float _2739 = (*spvDescriptorSet0.vp_c15)._m0[int(_2735)][_2737];
        _2729 = _2739;
    }
    float _2741 = _2729;
    float _2743 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2745 = _2721 + _2515;
    float _2747 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2723);
    float _2749 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2725);
    float _2751 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2743);
    float _2753 = _2727 * _2687;
    float _2755 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2747);
    float _2757 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2749);
    float _2759 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2751);
    float _2761 = _2061;
    float _2763 = _2753;
    if (!_2495)
    {
        float _2765 = floor(_2391);
        _2761 = _2765;
    }
    float _2767 = _2761;
    bool _2769 = _2753 >= 0.0;
    float _2771 = _2755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2773 = _2745 * _2687;
    float _2775 = _2759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2777 = _2753 <= 1.0;
    bool _2779 = _2777 && _2769;
    float _2781 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2783 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2785 = log2(_2719);
    bool _2787 = _2773 >= 0.0;
    bool _2789 = _2787 && _2779;
    float _2791 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2781);
    float _2793 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2795 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2797 = _2773 <= 1.0;
    bool _2799 = _2797 && _2789;
    float _2801 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2791);
    float _2803 = as_type<float>(_2431);
    if (!_2495)
    {
        float _2805 = floor(_2333);
        _2803 = _2805;
    }
    float _2807 = _2803;
    float _2809 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2795);
    float _2811 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2801);
    float _2813 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2793);
    float _2815 = _2767;
    float _2817 = _2811;
    if (!_2495)
    {
        float _2819 = -_2767;
        float _2821 = _2391 + _2819;
        _2815 = _2821;
    }
    float _2823 = _2815;
    float _2825 = _2317 * _2665;
    float _2827 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2809);
    float _2829 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2813);
    float _2831 = 1.0 / _2811;
    float _2833 = fma(_1921, _2657, _2825);
    if (_2799)
    {
        float _2835 = float(_2403);
        _2489 = _2835;
    }
    float _2837 = _2489;
    float _2839 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2829);
    float _2841 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2827);
    float _2843 = _2785 * 0.693147182464599609375;
    float _2845 = fma(_1923, _2699, _2833);
    float _2847 = _2795;
    float _2849 = _2837;
    float _2851 = _2841;
    if (_2799)
    {
        float _2853 = rint(_2837);
        float _2855 = precise::max(_2853, 0.0);
        uint _2857 = uint(_2855);
        uint _2859 = clamp(_2857, 0u, 65535u);
        _2847 = as_type<float>(_2859);
    }
    float _2861 = _2847;
    float _2863 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2865 = _2845 + _2707;
    float _2867 = _2807;
    if (!_2495)
    {
        float _2869 = -_2807;
        float _2871 = _2333 + _2869;
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = _2865 * _2687;
    float _2877 = _2825;
    if (!_2495)
    {
        float _2879 = rint(_2741);
        float _2881 = precise::max(_2879, 0.0);
        uint _2883 = uint(_2881);
        uint _2885 = clamp(_2883, 0u, 65535u);
        _2877 = as_type<float>(_2885);
    }
    float _2887 = _2877;
    float _2889 = _2839 * _2831;
    float _2891 = _2841 * _2831;
    float _2893 = fma(_2889, 0.5, 0.5);
    float _2895 = fma(_2891, -0.5, 0.5);
    float _2897 = _2861;
    if (_2799)
    {
        float3 _8279 = float3(_2753, _2773, float(as_type<int>(_2861)));
        float3 _8283 = select(_8279, float3(0.0), isnan(_8279));
        float _2899 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8283.xy, uint(rint(_8283.z)), _2875, level(0.0));
        _2897 = _2899;
    }
    float _2901 = _2897;
    float3 _8293 = float3(_2893, _2895, _2863);
    float _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8293, float3(0.0), isnan(_8293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8293, float3(0.0), isnan(_8293)), level(0.0)).x;
    float3 _8302 = float3(_2893, _2895, _2863);
    float4 _2906 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8302, float3(0.0), isnan(_8302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8302, float3(0.0), isnan(_8302)), level(0.0)).xyzw;
    float _2908 = _2906.x;
    float _2910 = _2906.y;
    float _2912 = _2906.z;
    float _2914 = _2906.w;
    float _2916 = _2873;
    if (!_2495)
    {
        float3 _8325 = float3(_2873, _2823, float(as_type<int>(_2887)));
        float3 _8327 = select(_8325, float3(0.0), isnan(_8325));
        float _2918 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8327.xy, uint(rint(_8327.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8327.xy, uint(rint(_8327.z)), level(0.0)).x;
        _2916 = _2918;
    }
    float _2920 = _2916;
    if (_2495)
    {
        _2849 = 1.0;
    }
    float _2922 = _2849;
    float _2924 = _2922;
    if (!_2495)
    {
        int _2926 = int(_2625) << 4;
        int _2928 = _2926 + 2048;
        uint _2930 = uint(int(uint(_2928) >> uint(2)));
        uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
        int _2934 = int(_2930) & 3;
        float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
        int _2938 = int(_2930) + 1;
        uint _2940 = uint(int(uint(_2938) >> uint(2)));
        int _2942 = _2938 & 3;
        float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
        int _2946 = _2928 + 8;
        uint _2948 = uint(int(uint(_2946) >> uint(2)));
        uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
        int _2952 = int(_2948) & 3;
        float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
        int _2956 = int(_2948) + 1;
        uint _2958 = uint(int(uint(_2956) >> uint(2)));
        int _2960 = _2956 & 3;
        float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
        float _2964 = _2317 * _2944;
        float _2966 = fma(_1921, _2936, _2964);
        float _2968 = fma(_1923, _2954, _2966);
        float _2970 = _2968 + _2962;
        float _2972 = precise::clamp(_2970, 0.0, 1.0);
        float _2974 = -_2972;
        float _2976 = _2974 + _2920;
        float _2978 = fma(_2976, 500.0, 1.5);
        float _2980 = exp2(_2978);
        float _2982 = 0.0 + _2980;
        float _2984 = precise::clamp(_2982, 0.0, 1.0);
        _2924 = _2984;
    }
    float _2986 = _2924;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2990 = _2609 + _2988;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2994 = _2611 + _2992;
    float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2998 = _2615 + _2996;
    float _3000 = _2990 * _2990;
    float _3002 = fma(_2994, _2994, _3000);
    float _3004 = fma(_2998, _2998, _3002);
    float _3006 = rsqrt(_3004);
    float _3008 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3010 = _2994 * _3008;
    float _3012 = _2998 * _3008;
    float _3014 = _3010 * _3010;
    float _3016 = _3012 * _3012;
    float _3018 = _3014 + _3016;
    float _3020 = sqrt(_3018);
    bool _3022 = _3020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3026 = _3020 + _3024;
    float _3028 = _2998;
    float _3030 = _3026;
    float _3032 = _2990;
    if (_3022)
    {
        float _3034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3028 = _3034;
    }
    float _3036 = _3028;
    if (_3022)
    {
        float _3038 = rsqrt(_3018);
        _1931 = _3038;
    }
    float _3040 = _1931;
    float _3042 = _3040;
    if (_3022)
    {
        float _3044 = _3026 * _3036;
        _3030 = _3044;
    }
    float _3046 = _3030;
    if (_3022)
    {
        float _3048 = _3046 * 0.15915493667125701904296875;
        _2763 = _3048;
    }
    float _3050 = _2763;
    float _3052 = _3006;
    float _3054 = _3050;
    if (_3022)
    {
        float _3056 = _3050 * 6.283185482025146484375;
        float _3058 = sin(_3056);
        _3052 = _3058;
    }
    float _3060 = _3052;
    float _3062 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3064 = precise::max(0.0, _3062);
    float _3066 = _3002;
    float _3068 = _3064;
    float _3070 = _3062;
    if (_3022)
    {
        float _3072 = _3050 * 6.283185482025146484375;
        float _3074 = cos(_3072);
        _3066 = _3074;
    }
    float _3076 = _3066;
    float _3078 = -_3008;
    float _3080 = -_3064;
    float _3082 = fma(_2990, _3078, _3080);
    if (!_3022)
    {
        _3068 = _3012;
    }
    float _3084 = _3068;
    float _3086 = _3084;
    if (_3022)
    {
        float _3088 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3070 = _3088;
    }
    float _3090 = _3070;
    float _3092 = _3090;
    float _3094 = _3060;
    if (_3022)
    {
        float _3096 = fma(_3060, _3090, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3092 = _3096;
    }
    float _3098 = _3092;
    float _3100 = _3098;
    if (!_3022)
    {
        _3094 = _3010;
    }
    float _3102 = _3094;
    float _3104 = _3102;
    float _3106 = _3076;
    if (_3022)
    {
        float _3108 = _3076 + (-1.0);
        _3032 = _3108;
    }
    float _3110 = _3032;
    if (_3022)
    {
        float _3112 = _3040 * _3098;
        _2073 = _3112;
    }
    float _3114 = _2073;
    if (!_3022)
    {
        _3100 = _3082;
    }
    float _3116 = _3100;
    float _3118 = _3116;
    if (_3022)
    {
        float _3120 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3054 = _3120;
    }
    float _3122 = _3054;
    if (_3022)
    {
        float _3124 = _3010 * _3114;
        _3104 = _3124;
    }
    float _3126 = _3104;
    if (!_3022)
    {
        _3042 = _3014;
    }
    float _3128 = _3042;
    float _3130 = _3128;
    if (_3022)
    {
        float _3132 = _3012 * _3114;
        _3086 = _3132;
    }
    float _3134 = _3086;
    if (_3022)
    {
        float _3136 = fma(_3082, _3076, _3122);
        _3118 = _3136;
    }
    float _3138 = _3118;
    if (_3022)
    {
        float _3140 = _3126 * _3126;
        _3130 = _3140;
    }
    float _3142 = _3130;
    if (!_3022)
    {
        _3106 = _3016;
    }
    float _3144 = _3106;
    float _3146 = _3144;
    if (_3022)
    {
        float _3148 = _3134 * _3134;
        _3146 = _3148;
    }
    float _3150 = _3146;
    float _3152 = sqrt(_3004);
    float _3154 = fma(_3138, _3138, _3142);
    float _3156 = _3154 + _3150;
    float _3158 = rsqrt(_3156);
    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3162 = fma(_3152, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3160);
    float _3164 = precise::clamp(_3162, 0.0, 1.0);
    float _3166 = -_3164;
    float _3168 = _3166 + 1.0;
    float _3170 = _3158 * _3126;
    float _3172 = _3158 * _3138;
    float _3174 = _3158 * _3134;
    float _3176 = abs(_3168);
    float _3178 = log2(_3176);
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3182 = -_3180;
    float _3184 = fma(_3172, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3182);
    float _3186 = -_3174;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3184);
    float _3190 = fma(_3188, -0.5, 0.5);
    float _3192 = fma(_3188, 0.5, 0.5);
    float _3194 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3196 = fma(_3192, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3198 = sqrt(_3190);
    float _3200 = fma(_3192, _3196, -0.212114393711090087890625);
    float _3202 = _3172 + 1.0;
    float _3204 = fma(_3192, _3200, 1.570728778839111328125);
    float _3206 = exp2(_3194);
    float _3208 = _3198 * 0.636619746685028076171875;
    float _3210 = -_3204;
    float _3212 = fma(_3208, _3210, 1.0);
    float _3214 = -_3172;
    float _3216 = fma(_3206, _3202, _3214);
    float _3218 = fma(_3216, 0.5, 0.5);
    float2 _8798 = float2(_3212, _3218);
    float3 _3222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8798, float2(0.0), isnan(_8798)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8798, float2(0.0), isnan(_8798)), level(0.0)).xyz;
    float _3224 = _3222.x;
    float _3226 = _3222.y;
    float _3228 = _3222.z;
    float _3230 = abs(_2367);
    float _3232 = log2(_3230);
    float _3234 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3236 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3238 = _2367 <= 8000.0;
    bool _3240 = isnan(_2367);
    bool _3242 = _3238 || _3240;
    bool _3244 = isnan(8000.0);
    bool _3246 = _3242 || _3244;
    float _3248 = float(_3246);
    float _3250 = -_2295;
    float _3252 = _3250 + 1.0;
    float _3254 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3236);
    float _3256 = exp2(_3234);
    float _3258 = _2811 * 0.5;
    float _3260 = _2839 + _2811;
    float _3262 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3254);
    float _3264 = _3260 * 0.5;
    float _3266 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3268 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3262);
    float _3270 = exp2(_3266);
    out.gl_Position.x = _2839;
    out.gl_Position.y = _2841;
    out.gl_Position.z = _3268;
    out.gl_Position.w = _2811;
    float _3272 = -_3256;
    float _3274 = _3272 + 1.0;
    float _3276 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3278 = _3276 * _2903;
    float _3280 = _2914 * _3278;
    float _3282 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = fma(_2841, -0.5, _3258);
    float _3288 = _3258;
    float _3290 = _3268;
    float _3292 = _3280;
    if (!_2799)
    {
        _3288 = 1.0;
    }
    float _3294 = _3288;
    float _3296 = fma(_3284, -2.0, 3.0);
    float _3298 = _3284 * _3284;
    float _3300 = _3294;
    if (_2799)
    {
        bool _3302 = _2901 >= _2875;
        bool _3304 = isnan(_2901);
        bool _3306 = _3302 || _3304;
        bool _3308 = isnan(_2875);
        bool _3310 = _3306 || _3308;
        float _3312 = float(_3310);
        _3300 = _3312;
    }
    float _3314 = _3300;
    bool _3316 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3318 = isnan(_3152);
    bool _3320 = _3316 || _3318;
    bool _3322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3324 = _3320 || _3322;
    float _3326 = _3298 * _3296;
    float _3328 = _3314 * _2986;
    float _3330 = -_3326;
    float _3332 = _3330 + 1.0;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3326);
    float _3336 = _3268 + _2811;
    float _3338 = _3248 * _3334;
    float _3340 = _3336 * 0.5;
    if (!_3324)
    {
        _2817 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3342 = _2817;
    float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3346 = _3342;
    float _3348 = _3342;
    if (!_3324)
    {
        _3290 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3350 = _3290;
    out.m_85.x = _3264;
    out.m_85.y = _3286;
    out.m_85.z = _3340;
    out.m_85.w = _2811;
    float _3352 = _3350;
    float _3354 = _3350;
    if (!_3324)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3356 = _2851;
    float _3358 = _3252 * _3344;
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = -_3360;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3366 = -_3276;
    float _3368 = _3366 + 1.0;
    float _3370 = -_3328;
    float _3372 = fma(_3370, _3364, 1.0);
    float _3374 = precise::clamp(_3372, 0.0, 1.0);
    float _3376 = _2914 * _3368;
    float _3378 = _3368;
    float _3380 = _3374;
    float _3382 = _3356;
    float _3384 = _3356;
    if (!_3324)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3386 = _3378;
    float _3388 = _3374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3390 = _3386;
    float _3392 = _3386;
    if (!_3324)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3394 = _3380;
    out.m_87.x = _3388;
    float _3396 = _3228 * _3278;
    float _3398 = fma(_3224, _3280, _2908);
    float _3400 = fma(_3226, _3280, _2910);
    float _3402 = _3394;
    float _3404 = _3394;
    if (!_3324)
    {
        _3292 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3406 = _3292;
    float _3408 = fma(_2914, _3396, _2912);
    out.m_89.x = _3398;
    out.m_89.y = _3400;
    out.m_89.z = _3408;
    out.m_89.w = _3376;
    bool _3410 = !_3324;
    float _3412 = _3406;
    float _3414 = _3406;
    if (!_3410)
    {
        bool _3416 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3418 = isnan(_3152);
        bool _3420 = _3416 || _3418;
        bool _3422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3424 = _3420 || _3422;
        if (!_3424)
        {
            float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3428 = _3152 + _3426;
            float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3430;
            float _3434 = 1.0 / _3432;
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3442 = _3440 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3456 = _3428 * _3434;
            float _3458 = precise::clamp(_3456, 0.0, 1.0);
            float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3464 = fma(_3458, _3438, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3466 = fma(_3458, _3462, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3468 = fma(_3458, _3442, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3470 = fma(_3458, _3446, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3472 = fma(_3458, _3450, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3474 = fma(_3458, _3454, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3354 = _3466;
            _3404 = _3472;
            _3348 = _3464;
            _3414 = _3470;
            _3384 = _3468;
            _3392 = _3474;
            _3476 = true;
        }
        else
        {
            bool _3478 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3480 = isnan(_3152);
            bool _3482 = _3478 || _3480;
            bool _3484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3486 = _3482 || _3484;
            if (!_3486)
            {
                _3346 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3488 = _3346;
            _3348 = _3488;
            if (!_3486)
            {
                _3352 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3490 = _3352;
            _3354 = _3490;
            if (!_3486)
            {
                _3382 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3492 = _3382;
            _3384 = _3492;
            if (!_3486)
            {
                _3412 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3494 = _3412;
            _3414 = _3494;
            if (!_3486)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3496 = _3402;
            _3404 = _3496;
            if (!_3486)
            {
                _3390 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3498 = _3390;
            bool _3500 = !_3486;
            _3392 = _3498;
            if (!_3500)
            {
                bool _3502 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3504 = isnan(_3152);
                bool _3506 = _3502 || _3504;
                bool _3508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3510 = _3506 || _3508;
                if (!_3510)
                {
                    float _3512 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3514 = _3152 + _3512;
                    float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3518 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3516;
                    float _3520 = 1.0 / _3518;
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3524 = _3522 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3542 = _3514 * _3520;
                    float _3544 = precise::clamp(_3542, 0.0, 1.0);
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3550 = fma(_3544, _3524, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3552 = fma(_3544, _3548, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3554 = fma(_3544, _3528, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3556 = fma(_3544, _3532, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3558 = fma(_3544, _3536, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3560 = fma(_3544, _3540, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3354 = _3552;
                    _3404 = _3558;
                    _3348 = _3550;
                    _3414 = _3556;
                    _3384 = _3554;
                    _3392 = _3560;
                    _3476 = true;
                }
                else
                {
                    _3354 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3348 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3414 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3384 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3392 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3476 = false;
    float _3562 = _3354;
    float _3564 = _3404;
    float _3566 = _3348;
    float _3568 = _3414;
    float _3570 = _3384;
    float _3572 = _3392;
    float _3574 = fma(_2193, -0.5, 0.5);
    float _3576 = precise::clamp(_3574, 0.0, 1.0);
    float _3578 = -_3562;
    float _3580 = _3578 + _3564;
    float _3582 = -_3566;
    float _3584 = _3582 + _3568;
    float _3586 = -_3570;
    float _3588 = _3586 + _3572;
    bool _3590 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3592 = fma(_3576, _3580, _3562);
    float _3594 = fma(_3576, _3584, _3566);
    float _3596 = fma(_3576, _3588, _3570);
    float _3598 = _3592 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3600 = fma(_3594, 0.298911988735198974609375, _3598);
    float _3602 = fma(_3596, 0.114477999508380889892578125, _3600);
    float _3604 = -_3602;
    float _3606 = _3592 + _3604;
    float _3608 = -_3602;
    float _3610 = _3594 + _3608;
    float _3612 = -_3602;
    float _3614 = _3596 + _3612;
    float _3616 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3618 = fma(_3606, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    float _3620 = fma(_3610, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    float _3622 = fma(_3614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    out.m_61.x = _3616;
    out.m_93.x = _3620;
    out.m_93.y = _3618;
    out.m_93.z = _3622;
    if (!_3590)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3624 = -_2609;
    float _3626 = _3624 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3628 = -_2611;
    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3632 = -_2615;
    float _3634 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3636 = _3626 * _3626;
    float _3638 = fma(_3630, _3630, _3636);
    float _3640 = fma(_3634, _3634, _3638);
    float _3642 = sqrt(_3640);
    float _3644 = rsqrt(_3640);
    float _3646 = -_3642;
    float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3650 = _3648 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3652 = precise::clamp(_3650, 0.0, 1.0);
    float _3654 = _3630 * _3644;
    float _3656 = _3626 * _3644;
    float _3658 = abs(_3652);
    float _3660 = log2(_3658);
    float _3662 = _3634 * _3644;
    float _3664 = _3654 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3666 = _2193 * _3656;
    float _3668 = -_3656;
    float _3670 = -_3664;
    float _3672 = fma(_3668, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3670);
    float _3674 = fma(_2191, _3654, _3666);
    float _3676 = -_3662;
    float _3678 = fma(_3676, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3672);
    float _3680 = fma(_2197, _3662, _3674);
    float _3682 = precise::clamp(_3680, 0.0, 1.0);
    float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3686 = _3678 + _3684;
    float _3688 = _3660 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3690 = _3686 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3692 = precise::clamp(_3690, 0.0, 1.0);
    float _3694 = exp2(_3688);
    float _3696 = _3694 * _3692;
    float _3698 = _3682 * _3696;
    float _3700 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3702 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3704 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3700;
    out.m_91.y = _3702;
    out.m_91.z = _3704;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3476 = false;
    bool _2247 = false;
    bool _863 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_58.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3761 = as_type<float>(_128);
        out.gl_Position.z = _3761;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3831 = as_type<float>(_166);
        out.gl_Position.z = _3831;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_65.w;
    float _170 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_63.x;
    float _184 = in.m_63.y;
    float _186 = in.m_63.z;
    float _188 = in.m_58.x;
    float _190 = in.m_58.y;
    float _192 = in.m_58.z;
    float _194 = 0.0;
    float _196 = _170;
    if (!_180)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    bool _210 = !_180;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _170 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _170);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_180;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _170 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _196 = _266;
    }
    float _268 = _196;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _182, _272);
    float _280 = fma(_268, _184, _274);
    float _282 = fma(_268, _186, _276);
    float _284 = fma(_278, _168, _188);
    float _286 = fma(_280, _168, _190);
    float _288 = fma(_282, _168, _192);
    bool _290 = !_270;
    float _308;
    if (!_290)
    {
        float _292 = in.m_67.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_112);
        float _314 = 1.0 / _312;
        float _316 = _146 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _326;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _350;
    float _354 = 1.0 / _330;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _318 + _356;
    float _360 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _362 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _364 = 1.0 / _334;
    float _366 = _358 * _340;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _318 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _374 = _318 + _372;
    bool _376 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_318);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _390 = 1.0 / _338;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _318 + _392;
    float _396 = _370 * _354;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _400 = _318 + _398;
    float _402 = 1.0 / _348;
    float _404 = _374 * _364;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    bool _410 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _412 = isnan(_318);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = 1.0 / _352;
    float _428 = _394 * _390;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _432 = _318 + _430;
    float _434 = fma(_424, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_408, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _438 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _440 = isnan(_318);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _450;
    float _454 = 1.0 / _344;
    float _456 = _400 * _402;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = in.m_67.x;
    float _464 = fma(_452, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = fma(_460, _396, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = _432 * _426;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = fma(_476, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _492 = fma(_480, _396, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_484, _396, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _500;
    float _504 = _322 * _454;
    bool _506 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _508 = isnan(_318);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_502, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = -_420;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _530 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _532 = isnan(_318);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = fma(_468, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = _448 * _524;
    float _546 = -_448;
    float _548 = _546 + 1.0;
    bool _550 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _552 = isnan(_318);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _360 * _462;
    float _564 = _362 * _462;
    float _566 = _516 * _548;
    float _568 = -_516;
    float _570 = _568 + 1.0;
    bool _572 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _574 = isnan(_318);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = fma(_488, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _586 = fma(_528, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _588 = _540 * _570;
    float _590 = -_540;
    float _592 = _590 + 1.0;
    bool _594 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _596 = isnan(_318);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = trunc(_562);
    int _608 = int(_606);
    float _610 = -_560;
    float _612 = _610 + 1.0;
    float _614 = _560 * _592;
    float _616 = -_582;
    float _618 = _616 + 1.0;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _582 * _612;
    float _626 = trunc(_564);
    int _628 = int(_626);
    float _630 = _604 * _618;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _632;
    float _636 = _386 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = -_386;
    float _644 = _642 + 1.0;
    float _646 = fma(_634, _504, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _648;
    float _652 = _434 * _636;
    float _654 = _464 * _636;
    float _656 = _490 * _636;
    float _658 = fma(_640, _504, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _660 = fma(_650, _504, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    int _664 = _608 << 4;
    int _666 = _664 + 1712;
    float _668 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].y, _654);
    int _670 = _628 << 4;
    int _672 = _670 + 1968;
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    uint _677 = uint(int(uint(_666) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[int(_687)][_689];
    float _693 = fma(_470, _630, _662);
    float _695 = fma(_492, _630, _668);
    float _697 = fma(_494, _630, _674);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _703 = fma(_436, _624, _693);
    float _705 = fma(_518, _624, _695);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    uint _711 = uint(int(uint(_672) >> uint(2)));
    uint _713 = uint(int(uint(int(_711)) >> uint(2)));
    int _715 = int(_711) & 3;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[int(_713)][_715];
    int _719 = int(_711) + 1;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    int _723 = _719 & 3;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[int(_721)][_723];
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _731 = fma(_520, _624, _697);
    float _733 = fma(_709, _456, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _735 = fma(_701, _456, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _737 = fma(_729, _456, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _739 = fma(_542, _614, _703);
    float _741 = fma(_584, _614, _705);
    int _743 = _666 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[int(_747)][_749];
    float _753 = in.m_65.x;
    float _755 = in.m_65.y;
    float _757 = in.m_65.z;
    float _759 = fma(_586, _614, _731);
    float _761 = fma(_658, _588, _741);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _763;
    int _767 = _672 + 8;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[int(_771)][_773];
    float _777 = fma(_646, _588, _739);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _783;
    float _787 = fma(_660, _588, _759);
    float _789 = fma(_765, _472, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _791 = fma(_737, _566, _761);
    float _793 = fma(_781, _472, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _795 = fma(_733, _566, _777);
    float _797 = fma(_785, _472, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _799 = fma(_735, _566, _787);
    float _801 = fma(_789, _544, _791);
    float _803 = fma(_793, _544, _795);
    float _805 = fma(_797, _544, _799);
    float _807 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].y, _801);
    float _809 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].x, _803);
    float _811 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].z, _805);
    float _813 = _807 * _755;
    float _815 = _809 * _753;
    float _817 = _811 * _757;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _821 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _823 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _825 = _725 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _717 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _829 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _835 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _839 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _775 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _843 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _845 = !_388;
    float _861;
    if (!_845)
    {
        float _847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _849 = _462 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _853 = _851 * _847;
        float _855 = floor(_853);
        float _857 = -_855;
        float _859 = _853 + _857;
        _861 = _859;
        _863 = true;
    }
    else
    {
        float _865 = float(_112);
        float _867 = 1.0 / _865;
        float _869 = _146 * _867;
        _861 = _869;
    }
    _863 = false;
    float _871 = _861;
    float _873 = _462 * 2.0;
    float _875 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _877 = log2(_875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _891 = 1.0 / _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _897 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _899;
    float _903 = floor(_873);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _909 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _913 = _911 != 0;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _917 = _915 != 0;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _921 = _919 != 0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _927 = 1.0 / _885;
    float _929 = _901 * _891;
    float _931 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _909);
    bool _933 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _941 = _937 || _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _943;
    float _947 = 1.0 / _889;
    float _949 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _951 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _953 = _903 > 0.0;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _959 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _949);
    float _961 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _951);
    bool _963 = _903 >= 0.0;
    bool _965 = isnan(_903);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    float _973 = 1.0 / _895;
    float _975 = in.m_67.y;
    float _977 = _957 * _927;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _983 = _971 ? 0 : 1;
    float _985 = 1.0 / _907;
    float _987 = in.m_67.z;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _993 = _945 * _947;
    bool _995 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _997 = isnan(_871);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / _981;
    float _1009 = _925 * _973;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1011;
    float _1015 = -_1005;
    float _1017 = _1015 + 1.0;
    bool _1019 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(1.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = 1.0 / _991;
    float _1031 = _877 * _146;
    float _1033 = _975 * 2.0;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1035;
    float _1039 = exp2(_1031);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1043 = 1.0 + _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1049 = _987 * 2.0;
    float _1051 = _1037 * _985;
    float _1053 = _1047 * _1007;
    float _1055 = 1.0 / _1043;
    float _1057 = _975 + _987;
    float _1059 = _1013 * _1029;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1063 = _871 + _1061;
    float _1065 = _1057 + (-1.0);
    float _1067 = fma(_929, _1063, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1069 = -_1039;
    float _1071 = _1069 + 1.0;
    float _1073 = _462 + _987;
    float _1075 = floor(_1049);
    float _1077 = _987 + (-0.5);
    float _1079 = _1073 + (-1.0);
    float _1081 = _462 + _975;
    float _1083 = floor(_1033);
    float _1085 = _941 ? _1071 : 0.0;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1091 = _1081 + (-1.0);
    if (_1027)
    {
        float _1093 = _1085 * _1055;
        _148 = _1093;
    }
    float _1095 = _148;
    float _1097 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1099 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1101 = isnan(_871);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    bool _1111 = _1075 > 0.0;
    float _1113 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _931);
    bool _1115 = _1075 >= 0.0;
    bool _1117 = isnan(_1075);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    float _1125 = -_1109;
    float _1127 = _1125 + 1.0;
    bool _1129 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1131 = isnan(_871);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1143 = _871 + _1141;
    int _1145 = _1123 ? 0 : 1;
    bool _1147 = _1083 > 0.0;
    float _1149 = _1139 * _1127;
    bool _1151 = _1083 >= 0.0;
    bool _1153 = isnan(_1083);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    float _1161 = -_1139;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_1009, _1143, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1167 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1169 = isnan(_871);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1175 = _1171 || _1173;
    float _1177 = float(_1175);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1181 = _871 + _1179;
    bool _1183 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1185 = isnan(_871);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _959);
    float _1197 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _1199 = _1177 * _1163;
    float _1201 = -_1177;
    float _1203 = _1201 + 1.0;
    bool _1205 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1207 = isnan(_871);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -_1193;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_993, _1181, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1223 = _1193 * _1203;
    bool _1225 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1227 = isnan(_871);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_1215;
    float _1239 = _1237 + 1.0;
    float _1241 = _1215 * _1219;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1245 = _871 + _1243;
    float _1247 = _1005 * _1239;
    bool _1249 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1251 = isnan(_871);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = _1235 * _1017;
    float _1263 = -_1235;
    float _1265 = _1263 + 1.0;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1269 = _871 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1273 = _871 + _1271;
    float _1275 = fma(_977, _1245, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1279 = _871 + _1277;
    float _1281 = _1259 * _1265;
    float _1283 = fma(_1053, _1269, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1285 = fma(_1059, _1273, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1287 = _1159 ? 0 : 1;
    float _1289 = _1067 * _1281;
    float _1291 = abs(_1197);
    bool _1293 = _1291 > 0.001000000047497451305389404296875;
    float _1295 = -_1259;
    float _1297 = _1295 + 1.0;
    int _1299 = ~_1287;
    int _1301 = _1299 + 1;
    int _1303 = _1301 + 1;
    float _1305 = fma(_1051, _1279, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1307 = _1293 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1289);
    int _1311 = _1303;
    float _1313 = _1195;
    if (!_1147)
    {
        int _1315 = ~_1287;
        int _1317 = _1315 + 1;
        _1311 = _1317;
    }
    int _1319 = _1311;
    bool _1321 = !_917;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = fma(_1165, _1261, _1309);
    float _1327 = _1197 + _1307;
    bool _1329 = !_913;
    int _1331 = _1329 ? 0 : 1;
    int _1333 = abs(_1323);
    float _1335 = fma(_1221, _1247, _1325);
    int _1337 = abs(_1331);
    bool _1339 = !_921;
    int _1341 = _1339 ? 0 : 1;
    float _1343 = fma(_1275, _1241, _1335);
    int _1345 = ~_983;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1305, _1223, _1343);
    int _1353 = _1349;
    float _1355 = _1327;
    if (!_953)
    {
        int _1357 = ~_983;
        int _1359 = _1357 + 1;
        _1353 = _1359;
    }
    int _1361 = _1353;
    int _1363 = abs(_1341);
    float _1365 = fma(_1283, _1199, _1351);
    float _1367 = float(_1333);
    float _1369 = rsqrt(_1113);
    float _1371 = float(_1361);
    float _1373 = fma(_1285, _1149, _1365);
    float _1375 = abs(_1195);
    float _1377 = abs(_1327);
    float _1379 = precise::max(_1375, _1377);
    int _1381 = ~_1145;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = _1367 * _1371;
    int _1389 = _1385;
    if (!_1111)
    {
        int _1391 = ~_1145;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    float _1397 = _1387 * (-2.0);
    bool _1399 = _1379 >= 16.0;
    float _1401 = fma(_1087, _1397, _1087);
    float _1403 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1405 = float(_1337);
    float _1407 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1409 = float(_1395);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1415 = float(_1363);
    float _1417 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1373);
    float _1419 = _975 + (-0.5);
    float _1421 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1423 = _1405 * _1409;
    float _1425 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1429 = float(_1319);
    float _1431 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1421);
    float _1433 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1435 = _1423 * (-2.0);
    float _1437 = fma(_1401, _1095, _1427);
    float _1439 = _1415 * _1429;
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1431);
    float _1443 = _284 * _1433;
    float _1445 = fma(_1097, _1435, _1097);
    float _1447 = _1439 * (-2.0);
    float _1449 = in.m_69.y;
    float _1451 = _1441 * _1443;
    float _1453 = _462 + (-0.5);
    float _1455 = _1403 * _1403;
    float _1457 = fma(_1451, _1447, _1451);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1461 = fma(_1089, _1447, _1089);
    if (_1399)
    {
        float _1463 = _1195 * 0.0625;
        _1313 = _1463;
    }
    float _1465 = _1313;
    float _1467 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1457);
    float _1469 = fma(_1445, _1095, _1459);
    float _1471 = in.m_71.x;
    float _1473 = in.m_71.y;
    float _1475 = in.m_71.z;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1479 = _1477 != 0;
    float _1481 = fma(_1461, _1095, _1467);
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1485 = _1483 != 0;
    float _1487 = _1469 * 0.15915493667125701904296875;
    bool _1489 = _975 > 0.5;
    float _1491 = fma(_1407, _1407, _1455);
    float _1493 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1495 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1497 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1499 = _1489;
    if (_1399)
    {
        float _1501 = _1327 * 0.0625;
        _1355 = _1501;
    }
    float _1503 = _1355;
    float _1505 = abs(_1465);
    bool _1507 = _1505 != 0.0;
    bool _1509 = isnan(_1505);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.0);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1425, _1425, _1491);
    float _1519 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1493);
    float _1521 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1495);
    float _1523 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1497);
    float _1525 = -_1449;
    float _1527 = _1525 + 1.0;
    float _1529 = abs(_1503);
    bool _1531 = _1529 == 0.0;
    bool _1533 = !_1515;
    bool _1535 = _1531 && _1533;
    float _1537 = rsqrt(_1517);
    float _1539 = _1481 * 0.15915493667125701904296875;
    float _1541 = _1437 * 0.15915493667125701904296875;
    float _1543 = _1449;
    float _1545 = _1541;
    if (_1479)
    {
        float _1547 = _1489 ? _1527 : _1449;
        _1543 = _1547;
    }
    float _1549 = _1543;
    float _1551 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1553 = abs(_1503);
    bool _1555 = _1553 == 0.0;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1473);
    float _1559 = _1487 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    bool _1563 = _462 > 0.5;
    bool _1565 = _1563 && _1485;
    float _1567 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1471);
    int _1571 = as_type<int>(_1557);
    if (_1535)
    {
        bool _1573 = as_type<int>(_1503) >= 0;
        _1499 = _1573;
    }
    bool _1575 = _1499;
    float _1577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1475);
    float _1579 = _1567 * _1569;
    float _1581 = _1487 * 6.283185482025146484375;
    float _1583 = cos(_1581);
    float _1585 = _897 * _1557;
    int _1587 = _1575 ? (-1) : 0;
    if (_1535)
    {
        int _1589 = _1575 ? 0 : 1078530011;
        _1571 = _1589;
    }
    int _1591 = _1571;
    float _1593 = _1551 * _1577;
    float _1595 = _1407 * _1537;
    float _1597 = _1403 * _1537;
    float _1599 = _1425 * _1537;
    float _1601 = _1539 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = _1539 * 6.283185482025146484375;
    float _1607 = cos(_1605);
    float _1609 = _1541 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1541 * 6.283185482025146484375;
    float _1615 = cos(_1613);
    int _1617 = as_type<int>(_1537);
    if (_1535)
    {
        int _1619 = int(0x80000000) & as_type<int>(_1465);
        int _1621 = _1591 | _1619;
        _1545 = as_type<float>(_1621);
    }
    float _1623 = _1545;
    bool _1625 = !_1515;
    bool _1627 = _1625 && _1555;
    float _1629 = _1623;
    float _1631 = _1623;
    if (!_1627)
    {
        float _1633 = abs(_1465);
        bool _1635 = _1633 != as_type<float>(0x7f800000u /* inf */);
        bool _1637 = isnan(_1633);
        bool _1639 = _1635 || _1637;
        bool _1641 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1643 = _1639 || _1641;
        float _1645 = abs(_1503);
        bool _1647 = _1645 == as_type<float>(0x7f800000u /* inf */);
        float _1649 = abs(_1503);
        bool _1651 = _1649 == as_type<float>(0x7f800000u /* inf */);
        bool _1653 = !_1643;
        bool _1655 = _1651 && _1653;
        if (_1655)
        {
            bool _1657 = as_type<int>(_1503) >= 0;
            _1587 = _1657 ? (-1) : 0;
        }
        int _1659 = _1587;
        if (_1655)
        {
            _1617 = 1075235812;
        }
        int _1661 = _1617;
        int _1663 = _1661;
        if (_1655)
        {
            int _1665 = ~_1659;
            int _1667 = (_1665 != 0) ? _1661 : 1061752795;
            _1663 = _1667;
        }
        int _1669 = _1663;
        if (_1655)
        {
            int _1671 = int(0x80000000) & as_type<int>(_1465);
            int _1673 = _1669 | _1671;
            _1629 = as_type<float>(_1673);
        }
        float _1675 = _1629;
        bool _1677 = !_1643;
        bool _1679 = _1677 && _1647;
        _1631 = _1675;
        if (!_1679)
        {
            float _1681 = abs(_1465);
            float _1683 = abs(_1503);
            float _1685 = precise::max(_1681, _1683);
            float _1687 = abs(_1465);
            float _1689 = abs(_1503);
            float _1691 = precise::min(_1687, _1689);
            float _1693 = 1.0 / _1685;
            float _1695 = abs(_1465);
            float _1697 = abs(_1503);
            bool _1699 = _1695 > _1697;
            bool _1701 = as_type<int>(_1503) >= 0;
            float _1703 = _1691 * _1693;
            float _1705 = _1703 * _1703;
            float _1707 = _1705 + 11.33538818359375;
            float _1709 = fma(_1705, _1707, 28.84246826171875);
            float _1711 = fma(_1705, _1709, 19.6966705322265625);
            float _1713 = fma(_1705, -0.82336294651031494140625, -5.674867153167724609375);
            float _1715 = abs(_1465);
            float _1717 = abs(_1503);
            float _1719 = _1715 + _1717;
            int _1721 = as_type<int>(_1465) & int(0x80000000);
            float _1723 = fma(_1705, _1713, -6.565555095672607421875);
            float _1725 = 1.0 / _1711;
            bool _1727 = _1719 > as_type<float>(0x7f800000u /* inf */);
            bool _1729 = isnan(_1719);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1735 = _1731 || _1733;
            float _1737 = _1705 * _1723;
            float _1739 = _1703 * _1737;
            float _1741 = fma(_1739, _1725, _1703);
            float _1743 = _1741;
            _1631 = _1719;
            if (_1699)
            {
                float _1745 = -_1741;
                float _1747 = _1745 + 1.57079637050628662109375;
                _1743 = _1747;
            }
            float _1749 = _1743;
            int _1751 = as_type<int>(_1749);
            if (!_1701)
            {
                float _1753 = -_1749;
                float _1755 = _1753 + 3.1415927410125732421875;
                _1751 = as_type<int>(_1755);
            }
            int _1757 = _1751;
            if (!_1735)
            {
                int _1759 = _1721 | _1757;
                _1631 = as_type<float>(_1759);
            }
        }
    }
    float _1761 = _1631;
    float _1763 = _1561 * _1611;
    float _1765 = _1583 * _1615;
    float _1767 = _1583 * _1607;
    float _1769 = _1761 * (-0.15915493667125701904296875);
    float _1771 = _1583 * _1611;
    float _1773 = _1561 * _1615;
    float _1775 = fma(_1603, _1765, _1763);
    float _1777 = _1767 * _1585;
    float _1779 = _1769 * 6.283185482025146484375;
    float _1781 = cos(_1779);
    float _1783 = _1561 * _1607;
    float _1785 = _1615 * _1607;
    float _1787 = _1611 * _1607;
    float _1789 = fma(_1603, _1763, _1765);
    float _1791 = -_1773;
    float _1793 = fma(_1603, _1771, _1791);
    float _1795 = -_1585;
    float _1797 = _1603 * _1795;
    float _1799 = fma(_1775, _1579, _1777);
    float _1801 = _1769 * 6.283185482025146484375;
    float _1803 = sin(_1801);
    float _1805 = -_1771;
    float _1807 = fma(_1603, _1773, _1805);
    float _1809 = _1783 * _1585;
    float _1811 = fma(_1785, _1579, _1797);
    float _1813 = fma(_1793, _1593, _1799);
    bool _1815 = _1473 != 0.0;
    bool _1817 = isnan(_1473);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1807, _1579, _1809);
    float _1827 = fma(_1787, _1593, _1811);
    float _1829 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1831 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1833 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1835 = fma(_1789, _1593, _1825);
    float _1837 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1829);
    float _1839 = -_1781;
    float _1841 = _1839 + 1.0;
    float _1843 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1831);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1833);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1837);
    float _1849 = _1599 * _1599;
    float _1851 = _1599 * _1803;
    float _1853 = _1595 * _1841;
    float _1855 = in.m_69.x;
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1843);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1845);
    float _1861 = fma(_1841, _1849, _1781);
    float _1863 = -_1851;
    float _1865 = fma(_1597, _1853, _1863);
    float _1867 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1869 = in.m_73.x;
    float _1871 = in.m_73.y;
    float _1873 = in.m_73.z;
    float _1875 = _1595 * _1803;
    float _1877 = _1597 * _1841;
    float _1879 = fma(_1595, _1853, _1781);
    float _1881 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1883 = _1867 * _1865;
    float _1885 = _1597 * _1803;
    float _1887 = fma(_1599, _1877, _1875);
    bool _1889 = _1471 == 0.0;
    bool _1891 = !_1823;
    bool _1893 = _1889 && _1891;
    float _1895 = fma(_1881, _1879, _1883);
    float _1897 = -_1885;
    float _1899 = fma(_1599, _1853, _1897);
    float _1901 = _1867 * _1887;
    bool _1903 = _1475 == 0.0;
    bool _1905 = _1903 && _1893;
    float _1907 = fma(_1599, _1853, _1885);
    float _1909 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1911 = fma(_1881, _1899, _1901);
    float _1913 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1519);
    float _1915 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1523);
    float _1917 = fma(_1909, _1907, _1895);
    float _1919 = fma(_1909, _1861, _1911);
    float _1921 = _1913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1923 = _1915 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1925 = _1887;
    float _1927 = _1911;
    float _1929 = _1807;
    float _1931 = _1923;
    if (_1485)
    {
        _1925 = _1855;
    }
    float _1933 = _1925;
    float _1935 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1521);
    float _1937 = _1933;
    if (!_1485)
    {
        _1927 = _1855;
    }
    float _1939 = _1927;
    float _1941 = _1921 + _1917;
    float _1943 = _1923 + _1919;
    float _1945 = _1869;
    float _1947 = _1871;
    float _1949 = _1873;
    float _1951 = _1939;
    if (!_1905)
    {
        float _1953 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1869);
        _1945 = _1953;
    }
    float _1955 = _1945;
    if (!_1905)
    {
        float _1957 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1871);
        _1947 = _1957;
    }
    float _1959 = _1947;
    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1963 = _1941 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1967 = _1943 + _1965;
    if (!_1905)
    {
        float _1969 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1873);
        _1949 = _1969;
    }
    float _1971 = _1949;
    float _1973 = fma(_1597, _1853, _1851);
    float _1975 = _1963 * _1963;
    float _1977 = _1967 * _1967;
    float _1979 = fma(_1597, _1877, _1781);
    float _1981 = -_1875;
    float _1983 = fma(_1599, _1877, _1981);
    float _1985 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1987 = _1975 + _1977;
    float _1989 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1991 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1993 = _1975;
    float _1995 = _1977;
    if (_1565)
    {
        float _1997 = -_1933;
        float _1999 = _1997 + 1.0;
        _1937 = _1999;
    }
    float _2001 = _1937;
    float _2003 = sqrt(_1987);
    float _2005 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2007 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2009 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2011 = -_1603;
    float _2013 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1985);
    float _2015 = -_1603;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1989);
    float _2019 = -_1603;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1991);
    if (_1485)
    {
        _1951 = _2001;
    }
    float _2023 = _1951;
    float _2025 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2005);
    float _2027 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2007);
    float _2029 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2009);
    float _2031 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2033 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2035 = _1867 * _1979;
    float _2037 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2039 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2031);
    float _2041 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2033);
    bool _2043 = _2003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2037);
    float _2047 = fma(_1881, _1973, _2035);
    float _2049 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2013);
    float _2051 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2017);
    float _2053 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2021);
    float _2055 = fma(_1909, _1983, _2047);
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2059 = _1935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2061 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2025);
    float _2063 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2027);
    float _2065 = _2059 + _2055;
    float _2067 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2029);
    float _2069 = _2055;
    float _2071 = _2025;
    float _2073 = _2063;
    if (!_2043)
    {
        _2069 = _1977;
    }
    float _2075 = _2069;
    float _2077 = _2075;
    if (!_2043)
    {
        _1929 = _1975;
    }
    float _2079 = _1929;
    float _2081 = _2079;
    if (!_2043)
    {
        _1993 = _1941;
    }
    float _2083 = _1993;
    float _2085 = _2083;
    if (!_2043)
    {
        _1995 = _1943;
    }
    float _2087 = _1995;
    float _2089 = _2087;
    if (!_2043)
    {
        _2071 = _2065;
    }
    float _2091 = _2071;
    bool _2093 = !_2043;
    float _2095 = _2091;
    if (!_2093)
    {
        float _2097 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2101 = _2003 + _2099;
        float _2103 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2105 = rsqrt(_1987);
        float _2107 = _2101 * _2097;
        float _2109 = _2107 * 0.15915493667125701904296875;
        float _2111 = _2109 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        float _2115 = _2109 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = fma(_2113, _2103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2121 = _2105 * _2119;
        float _2123 = _2117 + (-1.0);
        float _2125 = fma(_1963, _2121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2127 = fma(_1967, _2121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2129 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2133 = _2125 + _2131;
        float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2137 = _2127 + _2135;
        float _2139 = fma(_2065, _2117, _2129);
        float _2141 = _2133 * _2133;
        float _2143 = _2137 * _2137;
        _2095 = _2139;
        _2081 = _2141;
        _2077 = _2143;
        _2089 = _2127;
        _2085 = _2125;
    }
    float _2145 = _2095;
    float _2147 = _2081;
    float _2149 = _2077;
    float _2151 = _2089;
    float _2153 = _2085;
    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2157 = _2145 + _2155;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2161 = _2049 * _1959;
    float _2163 = _2051 * _1959;
    float _2165 = fma(_2157, _2157, _2147);
    float _2167 = _2053 * _1959;
    float _2169 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2039);
    float _2171 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2041);
    float _2173 = _2165 + _2149;
    float _2175 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2045);
    float _2177 = fma(_2061, _1955, _2161);
    float _2179 = fma(_2063, _1955, _2163);
    float _2181 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2183 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2185 = sqrt(_2173);
    float _2187 = fma(_2067, _1955, _2167);
    float _2189 = _2181 * _2057;
    float _2191 = fma(_2169, _1971, _2177);
    float _2193 = fma(_2171, _1971, _2179);
    float _2195 = _2183 * _2159;
    float _2197 = fma(_2175, _1971, _2187);
    out.m_75.x = _831;
    out.m_75.y = _829;
    out.m_75.z = _839;
    out.m_75.w = _819;
    out.m_77.x = _835;
    out.m_77.y = _833;
    out.m_77.z = _843;
    bool _2199 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2201 = isnan(_2185);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2207 = _2203 || _2205;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    out.m_81.x = _2189;
    out.m_81.y = _2195;
    out.m_83.x = _2191;
    out.m_83.y = _2193;
    out.m_83.z = _2197;
    float _2209 = _2171;
    uint _2211 = as_type<uint>(_2153);
    if (!_2207)
    {
        _2209 = 1.0;
    }
    float _2213 = _2209;
    bool _2215 = !_2207;
    float _2217 = _2213;
    if (!_2215)
    {
        bool _2219 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2221 = isnan(_2185);
        bool _2223 = _2219 || _2221;
        bool _2225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2227 = _2223 || _2225;
        if (!_2227)
        {
            float _2229 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2231 = _2185 + _2229;
            float _2233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2235 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2233;
            float _2237 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2239 = _2237 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2241 = 1.0 / _2235;
            float _2243 = _2231 * _2241;
            float _2245 = fma(_2243, _2239, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2217 = _2245;
            _2247 = true;
        }
        else
        {
            bool _2249 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2251 = isnan(_2185);
            bool _2253 = _2249 || _2251;
            bool _2255 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2257 = _2253 || _2255;
            if (!_2257)
            {
                float _2259 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2261 = _2185 + _2259;
                float _2263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2265 = _2263 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2267 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2269 = _2267 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2271 = 1.0 / _2265;
                float _2273 = _2261 * _2271;
                float _2275 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2217 = _2275;
                _2247 = true;
            }
            else
            {
                _2217 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2247 = false;
    float _2277 = _2217;
    float _2279 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2281 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2283 = floor(_2279);
    float _2285 = floor(_2281);
    float _2287 = -_2283;
    float _2289 = _2279 + _2287;
    float _2291 = -_2285;
    float _2293 = _2281 + _2291;
    float2 _7248 = float2(_2289, _2293);
    float _2295 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7248, float2(0.0), isnan(_7248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7248, float2(0.0), isnan(_7248)), level(0.0)).x;
    float _2297 = _2059 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2299 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2301 = _2151 + _2299;
    float _2303 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2297);
    float _2305 = fma(_2301, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2307 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2303);
    float _2309 = _2059 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2311 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2313 = _2307 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2315 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2309);
    float _2317 = _2059 + _2311;
    float _2319 = 1.0 / _2313;
    float _2321 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2315);
    float _2323 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2325 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2327 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2323);
    float _2329 = _2325 + _2313;
    float _2331 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2327);
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2335 = _2329 * _2319;
    float _2337 = _2335 * 0.5;
    float _2339 = trunc(_2333);
    int _2341 = int(_2339);
    float _2343 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2345 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2343);
    float _2347 = 1.0 / _2345;
    bool _2349 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2351 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan(0.5);
    bool _2357 = _2353 || _2355;
    int _2359 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2361 = _2341 + _2359;
    int _2363 = _2361 + 1;
    float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2367 = _2347 * _2365;
    float _2369 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2371 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _2373 = 2;
    float _2375 = _2277;
    if (_2357)
    {
        _2371 = _2305;
    }
    float _2377 = _2371;
    bool _2379 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2381 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2369);
    bool _2383 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2385 = !_2379;
    int _2387 = _2385 ? 0 : 1;
    float _2389 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2381);
    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2393 = _2377;
    if (!_2379)
    {
        _2373 = 1;
    }
    int _2395 = _2373;
    float _2397 = trunc(_2391);
    int _2399 = int(_2397);
    int _2401 = _2395;
    if (!_2383)
    {
        _2401 = _2387;
    }
    int _2403 = _2401;
    bool _2405 = _2363 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2407 = _2403 << 6;
    int _2409 = _2407 + 48;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    uint _2413 = uint(int(uint(int(_2411)) >> uint(2)));
    int _2415 = int(_2411) & 3;
    float _2417 = (*spvDescriptorSet0.vp_c15)._m0[int(_2413)][_2415];
    int _2419 = int(_2411) + 1;
    uint _2421 = uint(int(uint(_2419) >> uint(2)));
    int _2423 = _2419 & 3;
    float _2425 = (*spvDescriptorSet0.vp_c15)._m0[int(_2421)][_2423];
    int _2427 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2429 = _2399 + _2427;
    int _2431 = _2429 + 1;
    int _2433 = _2407 + 56;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    uint _2437 = uint(int(uint(int(_2435)) >> uint(2)));
    int _2439 = int(_2435) & 3;
    float _2441 = (*spvDescriptorSet0.vp_c15)._m0[int(_2437)][_2439];
    int _2443 = int(_2435) + 1;
    uint _2445 = uint(int(uint(_2443) >> uint(2)));
    int _2447 = _2443 & 3;
    float _2449 = (*spvDescriptorSet0.vp_c15)._m0[int(_2445)][_2447];
    float _2451 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2453 = _2153 + _2451;
    int _2455 = _2363 | _2431;
    float _2457 = fma(_2453, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _2459 = _2455 < 0;
    bool _2461 = _2459 || _2405;
    int _2463 = _2407 + 64;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    uint _2467 = uint(int(uint(int(_2465)) >> uint(2)));
    int _2469 = int(_2465) & 3;
    float _2471 = (*spvDescriptorSet0.vp_c15)._m0[int(_2467)][_2469];
    int _2473 = int(_2465) + 1;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    int _2477 = _2473 & 3;
    float _2479 = (*spvDescriptorSet0.vp_c15)._m0[int(_2475)][_2477];
    float _2481 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2483 = _2145 + _2481;
    float _2485 = _2453;
    float _2487 = _2483;
    float _2489 = as_type<float>(_2403);
    if (_2357)
    {
        _2485 = _2457;
    }
    float _2491 = _2485;
    bool _2493 = _2431 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2495 = _2493 || _2461;
    float _2497 = fma(_2483, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2499 = _2407 + 72;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    uint _2503 = uint(int(uint(int(_2501)) >> uint(2)));
    int _2505 = int(_2501) & 3;
    float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
    int _2509 = int(_2501) + 1;
    uint _2511 = uint(int(uint(_2509) >> uint(2)));
    int _2513 = _2509 & 3;
    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[int(_2511)][_2513];
    float _2517 = _2491;
    if (_2357)
    {
        _2487 = _2497;
    }
    float _2519 = _2487;
    int _2521 = _2407 + 96;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    uint _2525 = uint(int(uint(int(_2523)) >> uint(2)));
    int _2527 = int(_2523) & 3;
    float _2529 = (*spvDescriptorSet0.vp_c15)._m0[int(_2525)][_2527];
    int _2531 = int(_2523) + 1;
    uint _2533 = uint(int(uint(_2531) >> uint(2)));
    int _2535 = _2531 & 3;
    float _2537 = (*spvDescriptorSet0.vp_c15)._m0[int(_2533)][_2535];
    int _2539 = _2407 + 104;
    uint _2541 = uint(int(uint(_2539) >> uint(2)));
    uint _2543 = uint(int(uint(int(_2541)) >> uint(2)));
    int _2545 = int(_2541) & 3;
    float _2547 = (*spvDescriptorSet0.vp_c15)._m0[int(_2543)][_2545];
    int _2549 = int(_2541) + 1;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    int _2553 = _2549 & 3;
    float _2555 = (*spvDescriptorSet0.vp_c15)._m0[int(_2551)][_2553];
    float _2557 = _2519;
    if (!_2357)
    {
        float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2561 = _2059 + _2559;
        float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2565 = _1921 + _2563;
        float _2567 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2569 = -_1923;
        float _2571 = _2569 + _2305;
        float _2573 = _2561 * _2561;
        float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2577 = _1923 + _2575;
        float _2579 = fma(_2565, _2565, _2573);
        float _2581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2583 = fma(_2577, _2577, _2579);
        float _2585 = sqrt(_2583);
        float _2587 = _2567 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2589 = precise::min(_2585, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2591 = _2589 * _2581;
        float _2593 = -_2059;
        float _2595 = _2593 + _2497;
        float _2597 = _2587 * _2591;
        float _2599 = -_1921;
        float _2601 = _2599 + _2457;
        float _2603 = fma(_2595, _2597, _2059);
        float _2605 = fma(_2601, _2597, _1921);
        float _2607 = fma(_2571, _2597, _1923);
        _2557 = _2603;
        _2517 = _2605;
        _2211 = as_type<uint>(_2597);
        _2393 = _2607;
    }
    float _2609 = _2557;
    float _2611 = _2517;
    uint _2613 = _2211;
    float _2615 = _2393;
    float _2617 = _2317 * _2537;
    uint _2619 = _2613;
    if (!_2495)
    {
        int _2621 = _2431 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2623 = _2621 + _2363;
        _2619 = uint(_2623);
    }
    uint _2625 = _2619;
    float _2627 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2629 = _2317 * _2479;
    float _2631 = fma(_1921, _2529, _2617);
    float _2633 = _2317 * _2425;
    float _2635 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2627);
    int _2637 = as_type<int>(_2627);
    if (!_2495)
    {
        uint _2639 = uint(int(uint(int(_2625)) >> uint(2)));
        _2637 = int(_2639);
    }
    int _2641 = _2637;
    float _2643 = fma(_1923, _2547, _2631);
    float _2645 = fma(_1921, _2417, _2633);
    float _2647 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2635);
    int _2649 = _2407 + 80;
    uint _2651 = uint(int(uint(_2649) >> uint(2)));
    uint _2653 = uint(int(uint(int(_2651)) >> uint(2)));
    int _2655 = int(_2651) & 3;
    float _2657 = (*spvDescriptorSet0.vp_c15)._m0[int(_2653)][_2655];
    int _2659 = int(_2651) + 1;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    int _2663 = _2659 & 3;
    float _2665 = (*spvDescriptorSet0.vp_c15)._m0[int(_2661)][_2663];
    float _2667 = _2643 + _2555;
    int _2669 = as_type<int>(_2643);
    if (!_2495)
    {
        int _2671 = int(_2625) << 2;
        _2669 = _2671;
    }
    int _2673 = _2669;
    float _2675 = _2647 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2677 = fma(_1921, _2471, _2629);
    float _2679 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _2681 = _2673;
    if (!_2495)
    {
        int _2683 = 12 & _2673;
        _2681 = _2683;
    }
    int _2685 = _2681;
    float _2687 = 1.0 / _2667;
    float _2689 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2691 = _2407 + 88;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    uint _2695 = uint(int(uint(int(_2693)) >> uint(2)));
    int _2697 = int(_2693) & 3;
    float _2699 = (*spvDescriptorSet0.vp_c15)._m0[int(_2695)][_2697];
    int _2701 = int(_2693) + 1;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    int _2705 = _2701 & 3;
    float _2707 = (*spvDescriptorSet0.vp_c15)._m0[int(_2703)][_2705];
    if (!_2495)
    {
        int _2709 = _2641 << 4;
        int _2711 = _2709 + _2685;
        _2375 = as_type<float>(_2711);
    }
    float _2713 = _2375;
    float _2715 = fma(_1923, _2441, _2645);
    float _2717 = -_2689;
    float _2719 = fma(_2717, _2679, 1.0);
    float _2721 = fma(_1923, _2507, _2677);
    float _2723 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2725 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2727 = _2715 + _2449;
    float _2729 = _2713;
    if (!_2495)
    {
        int _2731 = as_type<int>(_2713) + 400;
        uint _2733 = uint(int(uint(_2731) >> uint(2)));
        uint _2735 = uint(int(uint(int(_2733)) >> uint(2)));
        int _2737 = int(_2733) & 3;
        float _2739 = (*spvDescriptorSet0.vp_c15)._m0[int(_2735)][_2737];
        _2729 = _2739;
    }
    float _2741 = _2729;
    float _2743 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2745 = _2721 + _2515;
    float _2747 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2723);
    float _2749 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2725);
    float _2751 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2743);
    float _2753 = _2727 * _2687;
    float _2755 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2747);
    float _2757 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2749);
    float _2759 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2751);
    float _2761 = _2061;
    float _2763 = _2753;
    if (!_2495)
    {
        float _2765 = floor(_2391);
        _2761 = _2765;
    }
    float _2767 = _2761;
    bool _2769 = _2753 >= 0.0;
    float _2771 = _2755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2773 = _2745 * _2687;
    float _2775 = _2759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2777 = _2753 <= 1.0;
    bool _2779 = _2777 && _2769;
    float _2781 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2783 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2785 = log2(_2719);
    bool _2787 = _2773 >= 0.0;
    bool _2789 = _2787 && _2779;
    float _2791 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2781);
    float _2793 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2795 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2797 = _2773 <= 1.0;
    bool _2799 = _2797 && _2789;
    float _2801 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2791);
    float _2803 = as_type<float>(_2431);
    if (!_2495)
    {
        float _2805 = floor(_2333);
        _2803 = _2805;
    }
    float _2807 = _2803;
    float _2809 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2795);
    float _2811 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2801);
    float _2813 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2793);
    float _2815 = _2767;
    float _2817 = _2811;
    if (!_2495)
    {
        float _2819 = -_2767;
        float _2821 = _2391 + _2819;
        _2815 = _2821;
    }
    float _2823 = _2815;
    float _2825 = _2317 * _2665;
    float _2827 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2809);
    float _2829 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2813);
    float _2831 = 1.0 / _2811;
    float _2833 = fma(_1921, _2657, _2825);
    if (_2799)
    {
        float _2835 = float(_2403);
        _2489 = _2835;
    }
    float _2837 = _2489;
    float _2839 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2829);
    float _2841 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2827);
    float _2843 = _2785 * 0.693147182464599609375;
    float _2845 = fma(_1923, _2699, _2833);
    float _2847 = _2795;
    float _2849 = _2837;
    float _2851 = _2841;
    if (_2799)
    {
        float _2853 = rint(_2837);
        float _2855 = precise::max(_2853, 0.0);
        uint _2857 = uint(_2855);
        uint _2859 = clamp(_2857, 0u, 65535u);
        _2847 = as_type<float>(_2859);
    }
    float _2861 = _2847;
    float _2863 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2865 = _2845 + _2707;
    float _2867 = _2807;
    if (!_2495)
    {
        float _2869 = -_2807;
        float _2871 = _2333 + _2869;
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = _2865 * _2687;
    float _2877 = _2825;
    if (!_2495)
    {
        float _2879 = rint(_2741);
        float _2881 = precise::max(_2879, 0.0);
        uint _2883 = uint(_2881);
        uint _2885 = clamp(_2883, 0u, 65535u);
        _2877 = as_type<float>(_2885);
    }
    float _2887 = _2877;
    float _2889 = _2839 * _2831;
    float _2891 = _2841 * _2831;
    float _2893 = fma(_2889, 0.5, 0.5);
    float _2895 = fma(_2891, -0.5, 0.5);
    float _2897 = _2861;
    if (_2799)
    {
        float3 _8279 = float3(_2753, _2773, float(as_type<int>(_2861)));
        float3 _8283 = select(_8279, float3(0.0), isnan(_8279));
        float _2899 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8283.xy, uint(rint(_8283.z)), _2875, level(0.0));
        _2897 = _2899;
    }
    float _2901 = _2897;
    float3 _8293 = float3(_2893, _2895, _2863);
    float _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8293, float3(0.0), isnan(_8293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8293, float3(0.0), isnan(_8293)), level(0.0)).x;
    float3 _8302 = float3(_2893, _2895, _2863);
    float4 _2906 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8302, float3(0.0), isnan(_8302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8302, float3(0.0), isnan(_8302)), level(0.0)).xyzw;
    float _2908 = _2906.x;
    float _2910 = _2906.y;
    float _2912 = _2906.z;
    float _2914 = _2906.w;
    float _2916 = _2873;
    if (!_2495)
    {
        float3 _8325 = float3(_2873, _2823, float(as_type<int>(_2887)));
        float3 _8327 = select(_8325, float3(0.0), isnan(_8325));
        float _2918 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8327.xy, uint(rint(_8327.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8327.xy, uint(rint(_8327.z)), level(0.0)).x;
        _2916 = _2918;
    }
    float _2920 = _2916;
    if (_2495)
    {
        _2849 = 1.0;
    }
    float _2922 = _2849;
    float _2924 = _2922;
    if (!_2495)
    {
        int _2926 = int(_2625) << 4;
        int _2928 = _2926 + 2048;
        uint _2930 = uint(int(uint(_2928) >> uint(2)));
        uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
        int _2934 = int(_2930) & 3;
        float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
        int _2938 = int(_2930) + 1;
        uint _2940 = uint(int(uint(_2938) >> uint(2)));
        int _2942 = _2938 & 3;
        float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
        int _2946 = _2928 + 8;
        uint _2948 = uint(int(uint(_2946) >> uint(2)));
        uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
        int _2952 = int(_2948) & 3;
        float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
        int _2956 = int(_2948) + 1;
        uint _2958 = uint(int(uint(_2956) >> uint(2)));
        int _2960 = _2956 & 3;
        float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
        float _2964 = _2317 * _2944;
        float _2966 = fma(_1921, _2936, _2964);
        float _2968 = fma(_1923, _2954, _2966);
        float _2970 = _2968 + _2962;
        float _2972 = precise::clamp(_2970, 0.0, 1.0);
        float _2974 = -_2972;
        float _2976 = _2974 + _2920;
        float _2978 = fma(_2976, 500.0, 1.5);
        float _2980 = exp2(_2978);
        float _2982 = 0.0 + _2980;
        float _2984 = precise::clamp(_2982, 0.0, 1.0);
        _2924 = _2984;
    }
    float _2986 = _2924;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2990 = _2609 + _2988;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2994 = _2611 + _2992;
    float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2998 = _2615 + _2996;
    float _3000 = _2990 * _2990;
    float _3002 = fma(_2994, _2994, _3000);
    float _3004 = fma(_2998, _2998, _3002);
    float _3006 = rsqrt(_3004);
    float _3008 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3010 = _2994 * _3008;
    float _3012 = _2998 * _3008;
    float _3014 = _3010 * _3010;
    float _3016 = _3012 * _3012;
    float _3018 = _3014 + _3016;
    float _3020 = sqrt(_3018);
    bool _3022 = _3020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3026 = _3020 + _3024;
    float _3028 = _2998;
    float _3030 = _3026;
    float _3032 = _2990;
    if (_3022)
    {
        float _3034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3028 = _3034;
    }
    float _3036 = _3028;
    if (_3022)
    {
        float _3038 = rsqrt(_3018);
        _1931 = _3038;
    }
    float _3040 = _1931;
    float _3042 = _3040;
    if (_3022)
    {
        float _3044 = _3026 * _3036;
        _3030 = _3044;
    }
    float _3046 = _3030;
    if (_3022)
    {
        float _3048 = _3046 * 0.15915493667125701904296875;
        _2763 = _3048;
    }
    float _3050 = _2763;
    float _3052 = _3006;
    float _3054 = _3050;
    if (_3022)
    {
        float _3056 = _3050 * 6.283185482025146484375;
        float _3058 = sin(_3056);
        _3052 = _3058;
    }
    float _3060 = _3052;
    float _3062 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3064 = precise::max(0.0, _3062);
    float _3066 = _3002;
    float _3068 = _3064;
    float _3070 = _3062;
    if (_3022)
    {
        float _3072 = _3050 * 6.283185482025146484375;
        float _3074 = cos(_3072);
        _3066 = _3074;
    }
    float _3076 = _3066;
    float _3078 = -_3008;
    float _3080 = -_3064;
    float _3082 = fma(_2990, _3078, _3080);
    if (!_3022)
    {
        _3068 = _3012;
    }
    float _3084 = _3068;
    float _3086 = _3084;
    if (_3022)
    {
        float _3088 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3070 = _3088;
    }
    float _3090 = _3070;
    float _3092 = _3090;
    float _3094 = _3060;
    if (_3022)
    {
        float _3096 = fma(_3060, _3090, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3092 = _3096;
    }
    float _3098 = _3092;
    float _3100 = _3098;
    if (!_3022)
    {
        _3094 = _3010;
    }
    float _3102 = _3094;
    float _3104 = _3102;
    float _3106 = _3076;
    if (_3022)
    {
        float _3108 = _3076 + (-1.0);
        _3032 = _3108;
    }
    float _3110 = _3032;
    if (_3022)
    {
        float _3112 = _3040 * _3098;
        _2073 = _3112;
    }
    float _3114 = _2073;
    if (!_3022)
    {
        _3100 = _3082;
    }
    float _3116 = _3100;
    float _3118 = _3116;
    if (_3022)
    {
        float _3120 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3054 = _3120;
    }
    float _3122 = _3054;
    if (_3022)
    {
        float _3124 = _3010 * _3114;
        _3104 = _3124;
    }
    float _3126 = _3104;
    if (!_3022)
    {
        _3042 = _3014;
    }
    float _3128 = _3042;
    float _3130 = _3128;
    if (_3022)
    {
        float _3132 = _3012 * _3114;
        _3086 = _3132;
    }
    float _3134 = _3086;
    if (_3022)
    {
        float _3136 = fma(_3082, _3076, _3122);
        _3118 = _3136;
    }
    float _3138 = _3118;
    if (_3022)
    {
        float _3140 = _3126 * _3126;
        _3130 = _3140;
    }
    float _3142 = _3130;
    if (!_3022)
    {
        _3106 = _3016;
    }
    float _3144 = _3106;
    float _3146 = _3144;
    if (_3022)
    {
        float _3148 = _3134 * _3134;
        _3146 = _3148;
    }
    float _3150 = _3146;
    float _3152 = sqrt(_3004);
    float _3154 = fma(_3138, _3138, _3142);
    float _3156 = _3154 + _3150;
    float _3158 = rsqrt(_3156);
    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3162 = fma(_3152, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3160);
    float _3164 = precise::clamp(_3162, 0.0, 1.0);
    float _3166 = -_3164;
    float _3168 = _3166 + 1.0;
    float _3170 = _3158 * _3126;
    float _3172 = _3158 * _3138;
    float _3174 = _3158 * _3134;
    float _3176 = abs(_3168);
    float _3178 = log2(_3176);
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3182 = -_3180;
    float _3184 = fma(_3172, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3182);
    float _3186 = -_3174;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3184);
    float _3190 = fma(_3188, -0.5, 0.5);
    float _3192 = fma(_3188, 0.5, 0.5);
    float _3194 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3196 = fma(_3192, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3198 = sqrt(_3190);
    float _3200 = fma(_3192, _3196, -0.212114393711090087890625);
    float _3202 = _3172 + 1.0;
    float _3204 = fma(_3192, _3200, 1.570728778839111328125);
    float _3206 = exp2(_3194);
    float _3208 = _3198 * 0.636619746685028076171875;
    float _3210 = -_3204;
    float _3212 = fma(_3208, _3210, 1.0);
    float _3214 = -_3172;
    float _3216 = fma(_3206, _3202, _3214);
    float _3218 = fma(_3216, 0.5, 0.5);
    float2 _8798 = float2(_3212, _3218);
    float3 _3222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8798, float2(0.0), isnan(_8798)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8798, float2(0.0), isnan(_8798)), level(0.0)).xyz;
    float _3224 = _3222.x;
    float _3226 = _3222.y;
    float _3228 = _3222.z;
    float _3230 = abs(_2367);
    float _3232 = log2(_3230);
    float _3234 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3236 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3238 = _2367 <= 8000.0;
    bool _3240 = isnan(_2367);
    bool _3242 = _3238 || _3240;
    bool _3244 = isnan(8000.0);
    bool _3246 = _3242 || _3244;
    float _3248 = float(_3246);
    float _3250 = -_2295;
    float _3252 = _3250 + 1.0;
    float _3254 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3236);
    float _3256 = exp2(_3234);
    float _3258 = _2811 * 0.5;
    float _3260 = _2839 + _2811;
    float _3262 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3254);
    float _3264 = _3260 * 0.5;
    float _3266 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3268 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3262);
    float _3270 = exp2(_3266);
    out.gl_Position.x = _2839;
    out.gl_Position.y = _2841;
    out.gl_Position.z = _3268;
    out.gl_Position.w = _2811;
    float _3272 = -_3256;
    float _3274 = _3272 + 1.0;
    float _3276 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3278 = _3276 * _2903;
    float _3280 = _2914 * _3278;
    float _3282 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = fma(_2841, -0.5, _3258);
    float _3288 = _3258;
    float _3290 = _3268;
    float _3292 = _3280;
    if (!_2799)
    {
        _3288 = 1.0;
    }
    float _3294 = _3288;
    float _3296 = fma(_3284, -2.0, 3.0);
    float _3298 = _3284 * _3284;
    float _3300 = _3294;
    if (_2799)
    {
        bool _3302 = _2901 >= _2875;
        bool _3304 = isnan(_2901);
        bool _3306 = _3302 || _3304;
        bool _3308 = isnan(_2875);
        bool _3310 = _3306 || _3308;
        float _3312 = float(_3310);
        _3300 = _3312;
    }
    float _3314 = _3300;
    bool _3316 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3318 = isnan(_3152);
    bool _3320 = _3316 || _3318;
    bool _3322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3324 = _3320 || _3322;
    float _3326 = _3298 * _3296;
    float _3328 = _3314 * _2986;
    float _3330 = -_3326;
    float _3332 = _3330 + 1.0;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3326);
    float _3336 = _3268 + _2811;
    float _3338 = _3248 * _3334;
    float _3340 = _3336 * 0.5;
    if (!_3324)
    {
        _2817 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3342 = _2817;
    float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3346 = _3342;
    float _3348 = _3342;
    if (!_3324)
    {
        _3290 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3350 = _3290;
    out.m_85.x = _3264;
    out.m_85.y = _3286;
    out.m_85.z = _3340;
    out.m_85.w = _2811;
    float _3352 = _3350;
    float _3354 = _3350;
    if (!_3324)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3356 = _2851;
    float _3358 = _3252 * _3344;
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = -_3360;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3366 = -_3276;
    float _3368 = _3366 + 1.0;
    float _3370 = -_3328;
    float _3372 = fma(_3370, _3364, 1.0);
    float _3374 = precise::clamp(_3372, 0.0, 1.0);
    float _3376 = _2914 * _3368;
    float _3378 = _3368;
    float _3380 = _3374;
    float _3382 = _3356;
    float _3384 = _3356;
    if (!_3324)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3386 = _3378;
    float _3388 = _3374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3390 = _3386;
    float _3392 = _3386;
    if (!_3324)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3394 = _3380;
    out.m_87.x = _3388;
    float _3396 = _3228 * _3278;
    float _3398 = fma(_3224, _3280, _2908);
    float _3400 = fma(_3226, _3280, _2910);
    float _3402 = _3394;
    float _3404 = _3394;
    if (!_3324)
    {
        _3292 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3406 = _3292;
    float _3408 = fma(_2914, _3396, _2912);
    out.m_89.x = _3398;
    out.m_89.y = _3400;
    out.m_89.z = _3408;
    out.m_89.w = _3376;
    bool _3410 = !_3324;
    float _3412 = _3406;
    float _3414 = _3406;
    if (!_3410)
    {
        bool _3416 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3418 = isnan(_3152);
        bool _3420 = _3416 || _3418;
        bool _3422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3424 = _3420 || _3422;
        if (!_3424)
        {
            float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3428 = _3152 + _3426;
            float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3430;
            float _3434 = 1.0 / _3432;
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3442 = _3440 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3456 = _3428 * _3434;
            float _3458 = precise::clamp(_3456, 0.0, 1.0);
            float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3464 = fma(_3458, _3438, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3466 = fma(_3458, _3462, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3468 = fma(_3458, _3442, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3470 = fma(_3458, _3446, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3472 = fma(_3458, _3450, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3474 = fma(_3458, _3454, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3354 = _3466;
            _3404 = _3472;
            _3348 = _3464;
            _3414 = _3470;
            _3384 = _3468;
            _3392 = _3474;
            _3476 = true;
        }
        else
        {
            bool _3478 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3480 = isnan(_3152);
            bool _3482 = _3478 || _3480;
            bool _3484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3486 = _3482 || _3484;
            if (!_3486)
            {
                _3346 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3488 = _3346;
            _3348 = _3488;
            if (!_3486)
            {
                _3352 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3490 = _3352;
            _3354 = _3490;
            if (!_3486)
            {
                _3382 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3492 = _3382;
            _3384 = _3492;
            if (!_3486)
            {
                _3412 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3494 = _3412;
            _3414 = _3494;
            if (!_3486)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3496 = _3402;
            _3404 = _3496;
            if (!_3486)
            {
                _3390 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3498 = _3390;
            bool _3500 = !_3486;
            _3392 = _3498;
            if (!_3500)
            {
                bool _3502 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3504 = isnan(_3152);
                bool _3506 = _3502 || _3504;
                bool _3508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3510 = _3506 || _3508;
                if (!_3510)
                {
                    float _3512 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3514 = _3152 + _3512;
                    float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3518 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3516;
                    float _3520 = 1.0 / _3518;
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3524 = _3522 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3542 = _3514 * _3520;
                    float _3544 = precise::clamp(_3542, 0.0, 1.0);
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3550 = fma(_3544, _3524, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3552 = fma(_3544, _3548, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3554 = fma(_3544, _3528, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3556 = fma(_3544, _3532, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3558 = fma(_3544, _3536, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3560 = fma(_3544, _3540, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3354 = _3552;
                    _3404 = _3558;
                    _3348 = _3550;
                    _3414 = _3556;
                    _3384 = _3554;
                    _3392 = _3560;
                    _3476 = true;
                }
                else
                {
                    _3354 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3348 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3414 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3384 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3392 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3476 = false;
    float _3562 = _3354;
    float _3564 = _3404;
    float _3566 = _3348;
    float _3568 = _3414;
    float _3570 = _3384;
    float _3572 = _3392;
    float _3574 = fma(_2193, -0.5, 0.5);
    float _3576 = precise::clamp(_3574, 0.0, 1.0);
    float _3578 = -_3562;
    float _3580 = _3578 + _3564;
    float _3582 = -_3566;
    float _3584 = _3582 + _3568;
    float _3586 = -_3570;
    float _3588 = _3586 + _3572;
    bool _3590 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3592 = fma(_3576, _3580, _3562);
    float _3594 = fma(_3576, _3584, _3566);
    float _3596 = fma(_3576, _3588, _3570);
    float _3598 = _3592 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3600 = fma(_3594, 0.298911988735198974609375, _3598);
    float _3602 = fma(_3596, 0.114477999508380889892578125, _3600);
    float _3604 = -_3602;
    float _3606 = _3592 + _3604;
    float _3608 = -_3602;
    float _3610 = _3594 + _3608;
    float _3612 = -_3602;
    float _3614 = _3596 + _3612;
    float _3616 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3618 = fma(_3606, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    float _3620 = fma(_3610, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    float _3622 = fma(_3614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    out.m_61.x = _3616;
    out.m_93.x = _3620;
    out.m_93.y = _3618;
    out.m_93.z = _3622;
    if (!_3590)
    {
        return out;
    }
    float _3624 = -_2609;
    float _3626 = _3624 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3628 = -_2611;
    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3632 = -_2615;
    float _3634 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3636 = _3626 * _3626;
    float _3638 = fma(_3630, _3630, _3636);
    float _3640 = fma(_3634, _3634, _3638);
    float _3642 = sqrt(_3640);
    float _3644 = rsqrt(_3640);
    float _3646 = -_3642;
    float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3650 = _3648 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3652 = precise::clamp(_3650, 0.0, 1.0);
    float _3654 = _3630 * _3644;
    float _3656 = _3626 * _3644;
    float _3658 = abs(_3652);
    float _3660 = log2(_3658);
    float _3662 = _3634 * _3644;
    float _3664 = _3654 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3666 = _2193 * _3656;
    float _3668 = -_3656;
    float _3670 = -_3664;
    float _3672 = fma(_3668, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3670);
    float _3674 = fma(_2191, _3654, _3666);
    float _3676 = -_3662;
    float _3678 = fma(_3676, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3672);
    float _3680 = fma(_2197, _3662, _3674);
    float _3682 = precise::clamp(_3680, 0.0, 1.0);
    float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3686 = _3678 + _3684;
    float _3688 = _3660 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3690 = _3686 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3692 = precise::clamp(_3690, 0.0, 1.0);
    float _3694 = exp2(_3688);
    float _3696 = _3694 * _3692;
    float _3698 = _3682 * _3696;
    float _3700 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3702 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3704 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3700;
    out.m_91.y = _3702;
    out.m_91.z = _3704;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3476 = false;
    bool _2247 = false;
    bool _863 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_58.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3761 = as_type<float>(_128);
        out.gl_Position.z = _3761;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3831 = as_type<float>(_166);
        out.gl_Position.z = _3831;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_65.w;
    float _170 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_63.x;
    float _184 = in.m_63.y;
    float _186 = in.m_63.z;
    float _188 = in.m_58.x;
    float _190 = in.m_58.y;
    float _192 = in.m_58.z;
    float _194 = 0.0;
    float _196 = _170;
    if (!_180)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    bool _210 = !_180;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _170 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _170);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_180;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _170 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _196 = _266;
    }
    float _268 = _196;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _182, _272);
    float _280 = fma(_268, _184, _274);
    float _282 = fma(_268, _186, _276);
    float _284 = fma(_278, _168, _188);
    float _286 = fma(_280, _168, _190);
    float _288 = fma(_282, _168, _192);
    bool _290 = !_270;
    float _308;
    if (!_290)
    {
        float _292 = in.m_67.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_112);
        float _314 = 1.0 / _312;
        float _316 = _146 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _326;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _350;
    float _354 = 1.0 / _330;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _318 + _356;
    float _360 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _362 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _364 = 1.0 / _334;
    float _366 = _358 * _340;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _318 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _374 = _318 + _372;
    bool _376 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _378 = isnan(_318);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    bool _388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _390 = 1.0 / _338;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _318 + _392;
    float _396 = _370 * _354;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _400 = _318 + _398;
    float _402 = 1.0 / _348;
    float _404 = _374 * _364;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    bool _410 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _412 = isnan(_318);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = 1.0 / _352;
    float _428 = _394 * _390;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _432 = _318 + _430;
    float _434 = fma(_424, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_408, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _438 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _440 = isnan(_318);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _450;
    float _454 = 1.0 / _344;
    float _456 = _400 * _402;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = in.m_67.x;
    float _464 = fma(_452, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = fma(_460, _396, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = _432 * _426;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = fma(_476, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _492 = fma(_480, _396, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _494 = fma(_484, _396, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _500;
    float _504 = _322 * _454;
    bool _506 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _508 = isnan(_318);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = fma(_498, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_502, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = -_420;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _530 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _532 = isnan(_318);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = fma(_468, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _544 = _448 * _524;
    float _546 = -_448;
    float _548 = _546 + 1.0;
    bool _550 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _552 = isnan(_318);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _360 * _462;
    float _564 = _362 * _462;
    float _566 = _516 * _548;
    float _568 = -_516;
    float _570 = _568 + 1.0;
    bool _572 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _574 = isnan(_318);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = fma(_488, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _586 = fma(_528, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _588 = _540 * _570;
    float _590 = -_540;
    float _592 = _590 + 1.0;
    bool _594 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _596 = isnan(_318);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = trunc(_562);
    int _608 = int(_606);
    float _610 = -_560;
    float _612 = _610 + 1.0;
    float _614 = _560 * _592;
    float _616 = -_582;
    float _618 = _616 + 1.0;
    float _620 = -_604;
    float _622 = _620 + 1.0;
    float _624 = _582 * _612;
    float _626 = trunc(_564);
    int _628 = int(_626);
    float _630 = _604 * _618;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _632;
    float _636 = _386 * _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = -_386;
    float _644 = _642 + 1.0;
    float _646 = fma(_634, _504, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _648;
    float _652 = _434 * _636;
    float _654 = _464 * _636;
    float _656 = _490 * _636;
    float _658 = fma(_640, _504, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _660 = fma(_650, _504, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    int _664 = _608 << 4;
    int _666 = _664 + 1712;
    float _668 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].y, _654);
    int _670 = _628 << 4;
    int _672 = _670 + 1968;
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[143].z, _656);
    uint _677 = uint(int(uint(_666) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[int(_687)][_689];
    float _693 = fma(_470, _630, _662);
    float _695 = fma(_492, _630, _668);
    float _697 = fma(_494, _630, _674);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _703 = fma(_436, _624, _693);
    float _705 = fma(_518, _624, _695);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    uint _711 = uint(int(uint(_672) >> uint(2)));
    uint _713 = uint(int(uint(int(_711)) >> uint(2)));
    int _715 = int(_711) & 3;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[int(_713)][_715];
    int _719 = int(_711) + 1;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    int _723 = _719 & 3;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[int(_721)][_723];
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _731 = fma(_520, _624, _697);
    float _733 = fma(_709, _456, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _735 = fma(_701, _456, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _737 = fma(_729, _456, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _739 = fma(_542, _614, _703);
    float _741 = fma(_584, _614, _705);
    int _743 = _666 + 8;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    uint _747 = uint(int(uint(int(_745)) >> uint(2)));
    int _749 = int(_745) & 3;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[int(_747)][_749];
    float _753 = in.m_65.x;
    float _755 = in.m_65.y;
    float _757 = in.m_65.z;
    float _759 = fma(_586, _614, _731);
    float _761 = fma(_658, _588, _741);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _763;
    int _767 = _672 + 8;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    uint _771 = uint(int(uint(int(_769)) >> uint(2)));
    int _773 = int(_769) & 3;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[int(_771)][_773];
    float _777 = fma(_646, _588, _739);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _783;
    float _787 = fma(_660, _588, _759);
    float _789 = fma(_765, _472, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _791 = fma(_737, _566, _761);
    float _793 = fma(_781, _472, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _795 = fma(_733, _566, _777);
    float _797 = fma(_785, _472, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _799 = fma(_735, _566, _787);
    float _801 = fma(_789, _544, _791);
    float _803 = fma(_793, _544, _795);
    float _805 = fma(_797, _544, _799);
    float _807 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].y, _801);
    float _809 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].x, _803);
    float _811 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[150].z, _805);
    float _813 = _807 * _755;
    float _815 = _809 * _753;
    float _817 = _811 * _757;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _821 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _823 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _825 = _725 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _717 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _829 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _835 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _839 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _775 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _843 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _845 = !_388;
    float _861;
    if (!_845)
    {
        float _847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _849 = _462 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _853 = _851 * _847;
        float _855 = floor(_853);
        float _857 = -_855;
        float _859 = _853 + _857;
        _861 = _859;
        _863 = true;
    }
    else
    {
        float _865 = float(_112);
        float _867 = 1.0 / _865;
        float _869 = _146 * _867;
        _861 = _869;
    }
    _863 = false;
    float _871 = _861;
    float _873 = _462 * 2.0;
    float _875 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _877 = log2(_875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _891 = 1.0 / _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _897 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _899;
    float _903 = floor(_873);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _909 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _913 = _911 != 0;
    int _915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _917 = _915 != 0;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _921 = _919 != 0;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _927 = 1.0 / _885;
    float _929 = _901 * _891;
    float _931 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _909);
    bool _933 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _935 = isnan(0.0);
    bool _937 = _933 || _935;
    bool _939 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _941 = _937 || _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _943;
    float _947 = 1.0 / _889;
    float _949 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _951 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _953 = _903 > 0.0;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _959 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _949);
    float _961 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _951);
    bool _963 = _903 >= 0.0;
    bool _965 = isnan(_903);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    float _973 = 1.0 / _895;
    float _975 = in.m_67.y;
    float _977 = _957 * _927;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _983 = _971 ? 0 : 1;
    float _985 = 1.0 / _907;
    float _987 = in.m_67.z;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _993 = _945 * _947;
    bool _995 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _997 = isnan(_871);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = 1.0 / _981;
    float _1009 = _925 * _973;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1011;
    float _1015 = -_1005;
    float _1017 = _1015 + 1.0;
    bool _1019 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(1.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = 1.0 / _991;
    float _1031 = _877 * _146;
    float _1033 = _975 * 2.0;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1035;
    float _1039 = exp2(_1031);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1043 = 1.0 + _1041;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1049 = _987 * 2.0;
    float _1051 = _1037 * _985;
    float _1053 = _1047 * _1007;
    float _1055 = 1.0 / _1043;
    float _1057 = _975 + _987;
    float _1059 = _1013 * _1029;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1063 = _871 + _1061;
    float _1065 = _1057 + (-1.0);
    float _1067 = fma(_929, _1063, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1069 = -_1039;
    float _1071 = _1069 + 1.0;
    float _1073 = _462 + _987;
    float _1075 = floor(_1049);
    float _1077 = _987 + (-0.5);
    float _1079 = _1073 + (-1.0);
    float _1081 = _462 + _975;
    float _1083 = floor(_1033);
    float _1085 = _941 ? _1071 : 0.0;
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1089 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1091 = _1081 + (-1.0);
    if (_1027)
    {
        float _1093 = _1085 * _1055;
        _148 = _1093;
    }
    float _1095 = _148;
    float _1097 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1099 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1101 = isnan(_871);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    bool _1111 = _1075 > 0.0;
    float _1113 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _931);
    bool _1115 = _1075 >= 0.0;
    bool _1117 = isnan(_1075);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    float _1125 = -_1109;
    float _1127 = _1125 + 1.0;
    bool _1129 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1131 = isnan(_871);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1143 = _871 + _1141;
    int _1145 = _1123 ? 0 : 1;
    bool _1147 = _1083 > 0.0;
    float _1149 = _1139 * _1127;
    bool _1151 = _1083 >= 0.0;
    bool _1153 = isnan(_1083);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    float _1161 = -_1139;
    float _1163 = _1161 + 1.0;
    float _1165 = fma(_1009, _1143, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1167 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1169 = isnan(_871);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1175 = _1171 || _1173;
    float _1177 = float(_1175);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1181 = _871 + _1179;
    bool _1183 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1185 = isnan(_871);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _959);
    float _1197 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _1199 = _1177 * _1163;
    float _1201 = -_1177;
    float _1203 = _1201 + 1.0;
    bool _1205 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1207 = isnan(_871);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = -_1193;
    float _1219 = _1217 + 1.0;
    float _1221 = fma(_993, _1181, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1223 = _1193 * _1203;
    bool _1225 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1227 = isnan(_871);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -_1215;
    float _1239 = _1237 + 1.0;
    float _1241 = _1215 * _1219;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1245 = _871 + _1243;
    float _1247 = _1005 * _1239;
    bool _1249 = _871 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1251 = isnan(_871);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = _1235 * _1017;
    float _1263 = -_1235;
    float _1265 = _1263 + 1.0;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1269 = _871 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1273 = _871 + _1271;
    float _1275 = fma(_977, _1245, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1279 = _871 + _1277;
    float _1281 = _1259 * _1265;
    float _1283 = fma(_1053, _1269, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1285 = fma(_1059, _1273, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1287 = _1159 ? 0 : 1;
    float _1289 = _1067 * _1281;
    float _1291 = abs(_1197);
    bool _1293 = _1291 > 0.001000000047497451305389404296875;
    float _1295 = -_1259;
    float _1297 = _1295 + 1.0;
    int _1299 = ~_1287;
    int _1301 = _1299 + 1;
    int _1303 = _1301 + 1;
    float _1305 = fma(_1051, _1279, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1307 = _1293 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1289);
    int _1311 = _1303;
    float _1313 = _1195;
    if (!_1147)
    {
        int _1315 = ~_1287;
        int _1317 = _1315 + 1;
        _1311 = _1317;
    }
    int _1319 = _1311;
    bool _1321 = !_917;
    int _1323 = _1321 ? 0 : 1;
    float _1325 = fma(_1165, _1261, _1309);
    float _1327 = _1197 + _1307;
    bool _1329 = !_913;
    int _1331 = _1329 ? 0 : 1;
    int _1333 = abs(_1323);
    float _1335 = fma(_1221, _1247, _1325);
    int _1337 = abs(_1331);
    bool _1339 = !_921;
    int _1341 = _1339 ? 0 : 1;
    float _1343 = fma(_1275, _1241, _1335);
    int _1345 = ~_983;
    int _1347 = _1345 + 1;
    int _1349 = _1347 + 1;
    float _1351 = fma(_1305, _1223, _1343);
    int _1353 = _1349;
    float _1355 = _1327;
    if (!_953)
    {
        int _1357 = ~_983;
        int _1359 = _1357 + 1;
        _1353 = _1359;
    }
    int _1361 = _1353;
    int _1363 = abs(_1341);
    float _1365 = fma(_1283, _1199, _1351);
    float _1367 = float(_1333);
    float _1369 = rsqrt(_1113);
    float _1371 = float(_1361);
    float _1373 = fma(_1285, _1149, _1365);
    float _1375 = abs(_1195);
    float _1377 = abs(_1327);
    float _1379 = precise::max(_1375, _1377);
    int _1381 = ~_1145;
    int _1383 = _1381 + 1;
    int _1385 = _1383 + 1;
    float _1387 = _1367 * _1371;
    int _1389 = _1385;
    if (!_1111)
    {
        int _1391 = ~_1145;
        int _1393 = _1391 + 1;
        _1389 = _1393;
    }
    int _1395 = _1389;
    float _1397 = _1387 * (-2.0);
    bool _1399 = _1379 >= 16.0;
    float _1401 = fma(_1087, _1397, _1087);
    float _1403 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1405 = float(_1337);
    float _1407 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1409 = float(_1395);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1415 = float(_1363);
    float _1417 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1373);
    float _1419 = _975 + (-0.5);
    float _1421 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1423 = _1405 * _1409;
    float _1425 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1429 = float(_1319);
    float _1431 = fma(_1407, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1421);
    float _1433 = fma(_1417, _1413, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1435 = _1423 * (-2.0);
    float _1437 = fma(_1401, _1095, _1427);
    float _1439 = _1415 * _1429;
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1431);
    float _1443 = _284 * _1433;
    float _1445 = fma(_1097, _1435, _1097);
    float _1447 = _1439 * (-2.0);
    float _1449 = in.m_69.y;
    float _1451 = _1441 * _1443;
    float _1453 = _462 + (-0.5);
    float _1455 = _1403 * _1403;
    float _1457 = fma(_1451, _1447, _1451);
    float _1459 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1461 = fma(_1089, _1447, _1089);
    if (_1399)
    {
        float _1463 = _1195 * 0.0625;
        _1313 = _1463;
    }
    float _1465 = _1313;
    float _1467 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1457);
    float _1469 = fma(_1445, _1095, _1459);
    float _1471 = in.m_71.x;
    float _1473 = in.m_71.y;
    float _1475 = in.m_71.z;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1479 = _1477 != 0;
    float _1481 = fma(_1461, _1095, _1467);
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1485 = _1483 != 0;
    float _1487 = _1469 * 0.15915493667125701904296875;
    bool _1489 = _975 > 0.5;
    float _1491 = fma(_1407, _1407, _1455);
    float _1493 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1495 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1497 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1499 = _1489;
    if (_1399)
    {
        float _1501 = _1327 * 0.0625;
        _1355 = _1501;
    }
    float _1503 = _1355;
    float _1505 = abs(_1465);
    bool _1507 = _1505 != 0.0;
    bool _1509 = isnan(_1505);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.0);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1425, _1425, _1491);
    float _1519 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1493);
    float _1521 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1495);
    float _1523 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1497);
    float _1525 = -_1449;
    float _1527 = _1525 + 1.0;
    float _1529 = abs(_1503);
    bool _1531 = _1529 == 0.0;
    bool _1533 = !_1515;
    bool _1535 = _1531 && _1533;
    float _1537 = rsqrt(_1517);
    float _1539 = _1481 * 0.15915493667125701904296875;
    float _1541 = _1437 * 0.15915493667125701904296875;
    float _1543 = _1449;
    float _1545 = _1541;
    if (_1479)
    {
        float _1547 = _1489 ? _1527 : _1449;
        _1543 = _1547;
    }
    float _1549 = _1543;
    float _1551 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1553 = abs(_1503);
    bool _1555 = _1553 == 0.0;
    float _1557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1473);
    float _1559 = _1487 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    bool _1563 = _462 > 0.5;
    bool _1565 = _1563 && _1485;
    float _1567 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1471);
    int _1571 = as_type<int>(_1557);
    if (_1535)
    {
        bool _1573 = as_type<int>(_1503) >= 0;
        _1499 = _1573;
    }
    bool _1575 = _1499;
    float _1577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1475);
    float _1579 = _1567 * _1569;
    float _1581 = _1487 * 6.283185482025146484375;
    float _1583 = cos(_1581);
    float _1585 = _897 * _1557;
    int _1587 = _1575 ? (-1) : 0;
    if (_1535)
    {
        int _1589 = _1575 ? 0 : 1078530011;
        _1571 = _1589;
    }
    int _1591 = _1571;
    float _1593 = _1551 * _1577;
    float _1595 = _1407 * _1537;
    float _1597 = _1403 * _1537;
    float _1599 = _1425 * _1537;
    float _1601 = _1539 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = _1539 * 6.283185482025146484375;
    float _1607 = cos(_1605);
    float _1609 = _1541 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1541 * 6.283185482025146484375;
    float _1615 = cos(_1613);
    int _1617 = as_type<int>(_1537);
    if (_1535)
    {
        int _1619 = int(0x80000000) & as_type<int>(_1465);
        int _1621 = _1591 | _1619;
        _1545 = as_type<float>(_1621);
    }
    float _1623 = _1545;
    bool _1625 = !_1515;
    bool _1627 = _1625 && _1555;
    float _1629 = _1623;
    float _1631 = _1623;
    if (!_1627)
    {
        float _1633 = abs(_1465);
        bool _1635 = _1633 != as_type<float>(0x7f800000u /* inf */);
        bool _1637 = isnan(_1633);
        bool _1639 = _1635 || _1637;
        bool _1641 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1643 = _1639 || _1641;
        float _1645 = abs(_1503);
        bool _1647 = _1645 == as_type<float>(0x7f800000u /* inf */);
        float _1649 = abs(_1503);
        bool _1651 = _1649 == as_type<float>(0x7f800000u /* inf */);
        bool _1653 = !_1643;
        bool _1655 = _1651 && _1653;
        if (_1655)
        {
            bool _1657 = as_type<int>(_1503) >= 0;
            _1587 = _1657 ? (-1) : 0;
        }
        int _1659 = _1587;
        if (_1655)
        {
            _1617 = 1075235812;
        }
        int _1661 = _1617;
        int _1663 = _1661;
        if (_1655)
        {
            int _1665 = ~_1659;
            int _1667 = (_1665 != 0) ? _1661 : 1061752795;
            _1663 = _1667;
        }
        int _1669 = _1663;
        if (_1655)
        {
            int _1671 = int(0x80000000) & as_type<int>(_1465);
            int _1673 = _1669 | _1671;
            _1629 = as_type<float>(_1673);
        }
        float _1675 = _1629;
        bool _1677 = !_1643;
        bool _1679 = _1677 && _1647;
        _1631 = _1675;
        if (!_1679)
        {
            float _1681 = abs(_1465);
            float _1683 = abs(_1503);
            float _1685 = precise::max(_1681, _1683);
            float _1687 = abs(_1465);
            float _1689 = abs(_1503);
            float _1691 = precise::min(_1687, _1689);
            float _1693 = 1.0 / _1685;
            float _1695 = abs(_1465);
            float _1697 = abs(_1503);
            bool _1699 = _1695 > _1697;
            bool _1701 = as_type<int>(_1503) >= 0;
            float _1703 = _1691 * _1693;
            float _1705 = _1703 * _1703;
            float _1707 = _1705 + 11.33538818359375;
            float _1709 = fma(_1705, _1707, 28.84246826171875);
            float _1711 = fma(_1705, _1709, 19.6966705322265625);
            float _1713 = fma(_1705, -0.82336294651031494140625, -5.674867153167724609375);
            float _1715 = abs(_1465);
            float _1717 = abs(_1503);
            float _1719 = _1715 + _1717;
            int _1721 = as_type<int>(_1465) & int(0x80000000);
            float _1723 = fma(_1705, _1713, -6.565555095672607421875);
            float _1725 = 1.0 / _1711;
            bool _1727 = _1719 > as_type<float>(0x7f800000u /* inf */);
            bool _1729 = isnan(_1719);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1735 = _1731 || _1733;
            float _1737 = _1705 * _1723;
            float _1739 = _1703 * _1737;
            float _1741 = fma(_1739, _1725, _1703);
            float _1743 = _1741;
            _1631 = _1719;
            if (_1699)
            {
                float _1745 = -_1741;
                float _1747 = _1745 + 1.57079637050628662109375;
                _1743 = _1747;
            }
            float _1749 = _1743;
            int _1751 = as_type<int>(_1749);
            if (!_1701)
            {
                float _1753 = -_1749;
                float _1755 = _1753 + 3.1415927410125732421875;
                _1751 = as_type<int>(_1755);
            }
            int _1757 = _1751;
            if (!_1735)
            {
                int _1759 = _1721 | _1757;
                _1631 = as_type<float>(_1759);
            }
        }
    }
    float _1761 = _1631;
    float _1763 = _1561 * _1611;
    float _1765 = _1583 * _1615;
    float _1767 = _1583 * _1607;
    float _1769 = _1761 * (-0.15915493667125701904296875);
    float _1771 = _1583 * _1611;
    float _1773 = _1561 * _1615;
    float _1775 = fma(_1603, _1765, _1763);
    float _1777 = _1767 * _1585;
    float _1779 = _1769 * 6.283185482025146484375;
    float _1781 = cos(_1779);
    float _1783 = _1561 * _1607;
    float _1785 = _1615 * _1607;
    float _1787 = _1611 * _1607;
    float _1789 = fma(_1603, _1763, _1765);
    float _1791 = -_1773;
    float _1793 = fma(_1603, _1771, _1791);
    float _1795 = -_1585;
    float _1797 = _1603 * _1795;
    float _1799 = fma(_1775, _1579, _1777);
    float _1801 = _1769 * 6.283185482025146484375;
    float _1803 = sin(_1801);
    float _1805 = -_1771;
    float _1807 = fma(_1603, _1773, _1805);
    float _1809 = _1783 * _1585;
    float _1811 = fma(_1785, _1579, _1797);
    float _1813 = fma(_1793, _1593, _1799);
    bool _1815 = _1473 != 0.0;
    bool _1817 = isnan(_1473);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1807, _1579, _1809);
    float _1827 = fma(_1787, _1593, _1811);
    float _1829 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1831 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1833 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1835 = fma(_1789, _1593, _1825);
    float _1837 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1829);
    float _1839 = -_1781;
    float _1841 = _1839 + 1.0;
    float _1843 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1831);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1833);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1837);
    float _1849 = _1599 * _1599;
    float _1851 = _1599 * _1803;
    float _1853 = _1595 * _1841;
    float _1855 = in.m_69.x;
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1843);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1845);
    float _1861 = fma(_1841, _1849, _1781);
    float _1863 = -_1851;
    float _1865 = fma(_1597, _1853, _1863);
    float _1867 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1869 = in.m_73.x;
    float _1871 = in.m_73.y;
    float _1873 = in.m_73.z;
    float _1875 = _1595 * _1803;
    float _1877 = _1597 * _1841;
    float _1879 = fma(_1595, _1853, _1781);
    float _1881 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1883 = _1867 * _1865;
    float _1885 = _1597 * _1803;
    float _1887 = fma(_1599, _1877, _1875);
    bool _1889 = _1471 == 0.0;
    bool _1891 = !_1823;
    bool _1893 = _1889 && _1891;
    float _1895 = fma(_1881, _1879, _1883);
    float _1897 = -_1885;
    float _1899 = fma(_1599, _1853, _1897);
    float _1901 = _1867 * _1887;
    bool _1903 = _1475 == 0.0;
    bool _1905 = _1903 && _1893;
    float _1907 = fma(_1599, _1853, _1885);
    float _1909 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1911 = fma(_1881, _1899, _1901);
    float _1913 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1519);
    float _1915 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1523);
    float _1917 = fma(_1909, _1907, _1895);
    float _1919 = fma(_1909, _1861, _1911);
    float _1921 = _1913 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1923 = _1915 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1925 = _1887;
    float _1927 = _1911;
    float _1929 = _1807;
    float _1931 = _1923;
    if (_1485)
    {
        _1925 = _1855;
    }
    float _1933 = _1925;
    float _1935 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1521);
    float _1937 = _1933;
    if (!_1485)
    {
        _1927 = _1855;
    }
    float _1939 = _1927;
    float _1941 = _1921 + _1917;
    float _1943 = _1923 + _1919;
    float _1945 = _1869;
    float _1947 = _1871;
    float _1949 = _1873;
    float _1951 = _1939;
    if (!_1905)
    {
        float _1953 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1869);
        _1945 = _1953;
    }
    float _1955 = _1945;
    if (!_1905)
    {
        float _1957 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1871);
        _1947 = _1957;
    }
    float _1959 = _1947;
    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1963 = _1941 + _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1967 = _1943 + _1965;
    if (!_1905)
    {
        float _1969 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1873);
        _1949 = _1969;
    }
    float _1971 = _1949;
    float _1973 = fma(_1597, _1853, _1851);
    float _1975 = _1963 * _1963;
    float _1977 = _1967 * _1967;
    float _1979 = fma(_1597, _1877, _1781);
    float _1981 = -_1875;
    float _1983 = fma(_1599, _1877, _1981);
    float _1985 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1987 = _1975 + _1977;
    float _1989 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1991 = _1767 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1993 = _1975;
    float _1995 = _1977;
    if (_1565)
    {
        float _1997 = -_1933;
        float _1999 = _1997 + 1.0;
        _1937 = _1999;
    }
    float _2001 = _1937;
    float _2003 = sqrt(_1987);
    float _2005 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2007 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2009 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2011 = -_1603;
    float _2013 = fma(_2011, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1985);
    float _2015 = -_1603;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1989);
    float _2019 = -_1603;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1991);
    if (_1485)
    {
        _1951 = _2001;
    }
    float _2023 = _1951;
    float _2025 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2005);
    float _2027 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2007);
    float _2029 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2009);
    float _2031 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2033 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2035 = _1867 * _1979;
    float _2037 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2039 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2031);
    float _2041 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2033);
    bool _2043 = _2003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2045 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2037);
    float _2047 = fma(_1881, _1973, _2035);
    float _2049 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2013);
    float _2051 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2017);
    float _2053 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2021);
    float _2055 = fma(_1909, _1983, _2047);
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2059 = _1935 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2061 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2025);
    float _2063 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2027);
    float _2065 = _2059 + _2055;
    float _2067 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2029);
    float _2069 = _2055;
    float _2071 = _2025;
    float _2073 = _2063;
    if (!_2043)
    {
        _2069 = _1977;
    }
    float _2075 = _2069;
    float _2077 = _2075;
    if (!_2043)
    {
        _1929 = _1975;
    }
    float _2079 = _1929;
    float _2081 = _2079;
    if (!_2043)
    {
        _1993 = _1941;
    }
    float _2083 = _1993;
    float _2085 = _2083;
    if (!_2043)
    {
        _1995 = _1943;
    }
    float _2087 = _1995;
    float _2089 = _2087;
    if (!_2043)
    {
        _2071 = _2065;
    }
    float _2091 = _2071;
    bool _2093 = !_2043;
    float _2095 = _2091;
    if (!_2093)
    {
        float _2097 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2101 = _2003 + _2099;
        float _2103 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2105 = rsqrt(_1987);
        float _2107 = _2101 * _2097;
        float _2109 = _2107 * 0.15915493667125701904296875;
        float _2111 = _2109 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        float _2115 = _2109 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = fma(_2113, _2103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2121 = _2105 * _2119;
        float _2123 = _2117 + (-1.0);
        float _2125 = fma(_1963, _2121, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2127 = fma(_1967, _2121, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2129 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2133 = _2125 + _2131;
        float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2137 = _2127 + _2135;
        float _2139 = fma(_2065, _2117, _2129);
        float _2141 = _2133 * _2133;
        float _2143 = _2137 * _2137;
        _2095 = _2139;
        _2081 = _2141;
        _2077 = _2143;
        _2089 = _2127;
        _2085 = _2125;
    }
    float _2145 = _2095;
    float _2147 = _2081;
    float _2149 = _2077;
    float _2151 = _2089;
    float _2153 = _2085;
    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2157 = _2145 + _2155;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2161 = _2049 * _1959;
    float _2163 = _2051 * _1959;
    float _2165 = fma(_2157, _2157, _2147);
    float _2167 = _2053 * _1959;
    float _2169 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2039);
    float _2171 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2041);
    float _2173 = _2165 + _2149;
    float _2175 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2045);
    float _2177 = fma(_2061, _1955, _2161);
    float _2179 = fma(_2063, _1955, _2163);
    float _2181 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2183 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2185 = sqrt(_2173);
    float _2187 = fma(_2067, _1955, _2167);
    float _2189 = _2181 * _2057;
    float _2191 = fma(_2169, _1971, _2177);
    float _2193 = fma(_2171, _1971, _2179);
    float _2195 = _2183 * _2159;
    float _2197 = fma(_2175, _1971, _2187);
    out.m_75.x = _831;
    out.m_75.y = _829;
    out.m_75.z = _839;
    out.m_75.w = _819;
    out.m_77.x = _835;
    out.m_77.y = _833;
    out.m_77.z = _843;
    bool _2199 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2201 = isnan(_2185);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2207 = _2203 || _2205;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    out.m_81.x = _2189;
    out.m_81.y = _2195;
    out.m_83.x = _2191;
    out.m_83.y = _2193;
    out.m_83.z = _2197;
    float _2209 = _2171;
    uint _2211 = as_type<uint>(_2153);
    if (!_2207)
    {
        _2209 = 1.0;
    }
    float _2213 = _2209;
    bool _2215 = !_2207;
    float _2217 = _2213;
    if (!_2215)
    {
        bool _2219 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2221 = isnan(_2185);
        bool _2223 = _2219 || _2221;
        bool _2225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2227 = _2223 || _2225;
        if (!_2227)
        {
            float _2229 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2231 = _2185 + _2229;
            float _2233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2235 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2233;
            float _2237 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2239 = _2237 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2241 = 1.0 / _2235;
            float _2243 = _2231 * _2241;
            float _2245 = fma(_2243, _2239, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2217 = _2245;
            _2247 = true;
        }
        else
        {
            bool _2249 = _2185 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2251 = isnan(_2185);
            bool _2253 = _2249 || _2251;
            bool _2255 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2257 = _2253 || _2255;
            if (!_2257)
            {
                float _2259 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2261 = _2185 + _2259;
                float _2263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2265 = _2263 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2267 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2269 = _2267 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2271 = 1.0 / _2265;
                float _2273 = _2261 * _2271;
                float _2275 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2217 = _2275;
                _2247 = true;
            }
            else
            {
                _2217 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2247 = false;
    float _2277 = _2217;
    float _2279 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2281 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2283 = floor(_2279);
    float _2285 = floor(_2281);
    float _2287 = -_2283;
    float _2289 = _2279 + _2287;
    float _2291 = -_2285;
    float _2293 = _2281 + _2291;
    float2 _7248 = float2(_2289, _2293);
    float _2295 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7248, float2(0.0), isnan(_7248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7248, float2(0.0), isnan(_7248)), level(0.0)).x;
    float _2297 = _2059 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2299 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2301 = _2151 + _2299;
    float _2303 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2297);
    float _2305 = fma(_2301, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2307 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2303);
    float _2309 = _2059 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2311 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2313 = _2307 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2315 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2309);
    float _2317 = _2059 + _2311;
    float _2319 = 1.0 / _2313;
    float _2321 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2315);
    float _2323 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2325 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2327 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2323);
    float _2329 = _2325 + _2313;
    float _2331 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2327);
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2335 = _2329 * _2319;
    float _2337 = _2335 * 0.5;
    float _2339 = trunc(_2333);
    int _2341 = int(_2339);
    float _2343 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2345 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2343);
    float _2347 = 1.0 / _2345;
    bool _2349 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2351 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan(0.5);
    bool _2357 = _2353 || _2355;
    int _2359 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2361 = _2341 + _2359;
    int _2363 = _2361 + 1;
    float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2367 = _2347 * _2365;
    float _2369 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2371 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _2373 = 2;
    float _2375 = _2277;
    if (_2357)
    {
        _2371 = _2305;
    }
    float _2377 = _2371;
    bool _2379 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2381 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2369);
    bool _2383 = _2367 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2385 = !_2379;
    int _2387 = _2385 ? 0 : 1;
    float _2389 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2381);
    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2393 = _2377;
    if (!_2379)
    {
        _2373 = 1;
    }
    int _2395 = _2373;
    float _2397 = trunc(_2391);
    int _2399 = int(_2397);
    int _2401 = _2395;
    if (!_2383)
    {
        _2401 = _2387;
    }
    int _2403 = _2401;
    bool _2405 = _2363 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2407 = _2403 << 6;
    int _2409 = _2407 + 48;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    uint _2413 = uint(int(uint(int(_2411)) >> uint(2)));
    int _2415 = int(_2411) & 3;
    float _2417 = (*spvDescriptorSet0.vp_c15)._m0[int(_2413)][_2415];
    int _2419 = int(_2411) + 1;
    uint _2421 = uint(int(uint(_2419) >> uint(2)));
    int _2423 = _2419 & 3;
    float _2425 = (*spvDescriptorSet0.vp_c15)._m0[int(_2421)][_2423];
    int _2427 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2429 = _2399 + _2427;
    int _2431 = _2429 + 1;
    int _2433 = _2407 + 56;
    uint _2435 = uint(int(uint(_2433) >> uint(2)));
    uint _2437 = uint(int(uint(int(_2435)) >> uint(2)));
    int _2439 = int(_2435) & 3;
    float _2441 = (*spvDescriptorSet0.vp_c15)._m0[int(_2437)][_2439];
    int _2443 = int(_2435) + 1;
    uint _2445 = uint(int(uint(_2443) >> uint(2)));
    int _2447 = _2443 & 3;
    float _2449 = (*spvDescriptorSet0.vp_c15)._m0[int(_2445)][_2447];
    float _2451 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2453 = _2153 + _2451;
    int _2455 = _2363 | _2431;
    float _2457 = fma(_2453, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _2459 = _2455 < 0;
    bool _2461 = _2459 || _2405;
    int _2463 = _2407 + 64;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    uint _2467 = uint(int(uint(int(_2465)) >> uint(2)));
    int _2469 = int(_2465) & 3;
    float _2471 = (*spvDescriptorSet0.vp_c15)._m0[int(_2467)][_2469];
    int _2473 = int(_2465) + 1;
    uint _2475 = uint(int(uint(_2473) >> uint(2)));
    int _2477 = _2473 & 3;
    float _2479 = (*spvDescriptorSet0.vp_c15)._m0[int(_2475)][_2477];
    float _2481 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2483 = _2145 + _2481;
    float _2485 = _2453;
    float _2487 = _2483;
    float _2489 = as_type<float>(_2403);
    if (_2357)
    {
        _2485 = _2457;
    }
    float _2491 = _2485;
    bool _2493 = _2431 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2495 = _2493 || _2461;
    float _2497 = fma(_2483, _2277, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    int _2499 = _2407 + 72;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    uint _2503 = uint(int(uint(int(_2501)) >> uint(2)));
    int _2505 = int(_2501) & 3;
    float _2507 = (*spvDescriptorSet0.vp_c15)._m0[int(_2503)][_2505];
    int _2509 = int(_2501) + 1;
    uint _2511 = uint(int(uint(_2509) >> uint(2)));
    int _2513 = _2509 & 3;
    float _2515 = (*spvDescriptorSet0.vp_c15)._m0[int(_2511)][_2513];
    float _2517 = _2491;
    if (_2357)
    {
        _2487 = _2497;
    }
    float _2519 = _2487;
    int _2521 = _2407 + 96;
    uint _2523 = uint(int(uint(_2521) >> uint(2)));
    uint _2525 = uint(int(uint(int(_2523)) >> uint(2)));
    int _2527 = int(_2523) & 3;
    float _2529 = (*spvDescriptorSet0.vp_c15)._m0[int(_2525)][_2527];
    int _2531 = int(_2523) + 1;
    uint _2533 = uint(int(uint(_2531) >> uint(2)));
    int _2535 = _2531 & 3;
    float _2537 = (*spvDescriptorSet0.vp_c15)._m0[int(_2533)][_2535];
    int _2539 = _2407 + 104;
    uint _2541 = uint(int(uint(_2539) >> uint(2)));
    uint _2543 = uint(int(uint(int(_2541)) >> uint(2)));
    int _2545 = int(_2541) & 3;
    float _2547 = (*spvDescriptorSet0.vp_c15)._m0[int(_2543)][_2545];
    int _2549 = int(_2541) + 1;
    uint _2551 = uint(int(uint(_2549) >> uint(2)));
    int _2553 = _2549 & 3;
    float _2555 = (*spvDescriptorSet0.vp_c15)._m0[int(_2551)][_2553];
    float _2557 = _2519;
    if (!_2357)
    {
        float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2561 = _2059 + _2559;
        float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2565 = _1921 + _2563;
        float _2567 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2569 = -_1923;
        float _2571 = _2569 + _2305;
        float _2573 = _2561 * _2561;
        float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2577 = _1923 + _2575;
        float _2579 = fma(_2565, _2565, _2573);
        float _2581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2583 = fma(_2577, _2577, _2579);
        float _2585 = sqrt(_2583);
        float _2587 = _2567 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2589 = precise::min(_2585, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2591 = _2589 * _2581;
        float _2593 = -_2059;
        float _2595 = _2593 + _2497;
        float _2597 = _2587 * _2591;
        float _2599 = -_1921;
        float _2601 = _2599 + _2457;
        float _2603 = fma(_2595, _2597, _2059);
        float _2605 = fma(_2601, _2597, _1921);
        float _2607 = fma(_2571, _2597, _1923);
        _2557 = _2603;
        _2517 = _2605;
        _2211 = as_type<uint>(_2597);
        _2393 = _2607;
    }
    float _2609 = _2557;
    float _2611 = _2517;
    uint _2613 = _2211;
    float _2615 = _2393;
    float _2617 = _2317 * _2537;
    uint _2619 = _2613;
    if (!_2495)
    {
        int _2621 = _2431 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2623 = _2621 + _2363;
        _2619 = uint(_2623);
    }
    uint _2625 = _2619;
    float _2627 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2629 = _2317 * _2479;
    float _2631 = fma(_1921, _2529, _2617);
    float _2633 = _2317 * _2425;
    float _2635 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2627);
    int _2637 = as_type<int>(_2627);
    if (!_2495)
    {
        uint _2639 = uint(int(uint(int(_2625)) >> uint(2)));
        _2637 = int(_2639);
    }
    int _2641 = _2637;
    float _2643 = fma(_1923, _2547, _2631);
    float _2645 = fma(_1921, _2417, _2633);
    float _2647 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2635);
    int _2649 = _2407 + 80;
    uint _2651 = uint(int(uint(_2649) >> uint(2)));
    uint _2653 = uint(int(uint(int(_2651)) >> uint(2)));
    int _2655 = int(_2651) & 3;
    float _2657 = (*spvDescriptorSet0.vp_c15)._m0[int(_2653)][_2655];
    int _2659 = int(_2651) + 1;
    uint _2661 = uint(int(uint(_2659) >> uint(2)));
    int _2663 = _2659 & 3;
    float _2665 = (*spvDescriptorSet0.vp_c15)._m0[int(_2661)][_2663];
    float _2667 = _2643 + _2555;
    int _2669 = as_type<int>(_2643);
    if (!_2495)
    {
        int _2671 = int(_2625) << 2;
        _2669 = _2671;
    }
    int _2673 = _2669;
    float _2675 = _2647 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2677 = fma(_1921, _2471, _2629);
    float _2679 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _2681 = _2673;
    if (!_2495)
    {
        int _2683 = 12 & _2673;
        _2681 = _2683;
    }
    int _2685 = _2681;
    float _2687 = 1.0 / _2667;
    float _2689 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _2691 = _2407 + 88;
    uint _2693 = uint(int(uint(_2691) >> uint(2)));
    uint _2695 = uint(int(uint(int(_2693)) >> uint(2)));
    int _2697 = int(_2693) & 3;
    float _2699 = (*spvDescriptorSet0.vp_c15)._m0[int(_2695)][_2697];
    int _2701 = int(_2693) + 1;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    int _2705 = _2701 & 3;
    float _2707 = (*spvDescriptorSet0.vp_c15)._m0[int(_2703)][_2705];
    if (!_2495)
    {
        int _2709 = _2641 << 4;
        int _2711 = _2709 + _2685;
        _2375 = as_type<float>(_2711);
    }
    float _2713 = _2375;
    float _2715 = fma(_1923, _2441, _2645);
    float _2717 = -_2689;
    float _2719 = fma(_2717, _2679, 1.0);
    float _2721 = fma(_1923, _2507, _2677);
    float _2723 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2725 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2727 = _2715 + _2449;
    float _2729 = _2713;
    if (!_2495)
    {
        int _2731 = as_type<int>(_2713) + 400;
        uint _2733 = uint(int(uint(_2731) >> uint(2)));
        uint _2735 = uint(int(uint(int(_2733)) >> uint(2)));
        int _2737 = int(_2733) & 3;
        float _2739 = (*spvDescriptorSet0.vp_c15)._m0[int(_2735)][_2737];
        _2729 = _2739;
    }
    float _2741 = _2729;
    float _2743 = _2609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2745 = _2721 + _2515;
    float _2747 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2723);
    float _2749 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2725);
    float _2751 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2743);
    float _2753 = _2727 * _2687;
    float _2755 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2747);
    float _2757 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2749);
    float _2759 = fma(_2615, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2751);
    float _2761 = _2061;
    float _2763 = _2753;
    if (!_2495)
    {
        float _2765 = floor(_2391);
        _2761 = _2765;
    }
    float _2767 = _2761;
    bool _2769 = _2753 >= 0.0;
    float _2771 = _2755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2773 = _2745 * _2687;
    float _2775 = _2759 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2777 = _2753 <= 1.0;
    bool _2779 = _2777 && _2769;
    float _2781 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2783 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2785 = log2(_2719);
    bool _2787 = _2773 >= 0.0;
    bool _2789 = _2787 && _2779;
    float _2791 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2781);
    float _2793 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2795 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2797 = _2773 <= 1.0;
    bool _2799 = _2797 && _2789;
    float _2801 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2791);
    float _2803 = as_type<float>(_2431);
    if (!_2495)
    {
        float _2805 = floor(_2333);
        _2803 = _2805;
    }
    float _2807 = _2803;
    float _2809 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2795);
    float _2811 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2801);
    float _2813 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2793);
    float _2815 = _2767;
    float _2817 = _2811;
    if (!_2495)
    {
        float _2819 = -_2767;
        float _2821 = _2391 + _2819;
        _2815 = _2821;
    }
    float _2823 = _2815;
    float _2825 = _2317 * _2665;
    float _2827 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2809);
    float _2829 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2813);
    float _2831 = 1.0 / _2811;
    float _2833 = fma(_1921, _2657, _2825);
    if (_2799)
    {
        float _2835 = float(_2403);
        _2489 = _2835;
    }
    float _2837 = _2489;
    float _2839 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2829);
    float _2841 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2827);
    float _2843 = _2785 * 0.693147182464599609375;
    float _2845 = fma(_1923, _2699, _2833);
    float _2847 = _2795;
    float _2849 = _2837;
    float _2851 = _2841;
    if (_2799)
    {
        float _2853 = rint(_2837);
        float _2855 = precise::max(_2853, 0.0);
        uint _2857 = uint(_2855);
        uint _2859 = clamp(_2857, 0u, 65535u);
        _2847 = as_type<float>(_2859);
    }
    float _2861 = _2847;
    float _2863 = _2843 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2865 = _2845 + _2707;
    float _2867 = _2807;
    if (!_2495)
    {
        float _2869 = -_2807;
        float _2871 = _2333 + _2869;
        _2867 = _2871;
    }
    float _2873 = _2867;
    float _2875 = _2865 * _2687;
    float _2877 = _2825;
    if (!_2495)
    {
        float _2879 = rint(_2741);
        float _2881 = precise::max(_2879, 0.0);
        uint _2883 = uint(_2881);
        uint _2885 = clamp(_2883, 0u, 65535u);
        _2877 = as_type<float>(_2885);
    }
    float _2887 = _2877;
    float _2889 = _2839 * _2831;
    float _2891 = _2841 * _2831;
    float _2893 = fma(_2889, 0.5, 0.5);
    float _2895 = fma(_2891, -0.5, 0.5);
    float _2897 = _2861;
    if (_2799)
    {
        float3 _8279 = float3(_2753, _2773, float(as_type<int>(_2861)));
        float3 _8283 = select(_8279, float3(0.0), isnan(_8279));
        float _2899 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8283.xy, uint(rint(_8283.z)), _2875, level(0.0));
        _2897 = _2899;
    }
    float _2901 = _2897;
    float3 _8293 = float3(_2893, _2895, _2863);
    float _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8293, float3(0.0), isnan(_8293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8293, float3(0.0), isnan(_8293)), level(0.0)).x;
    float3 _8302 = float3(_2893, _2895, _2863);
    float4 _2906 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8302, float3(0.0), isnan(_8302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8302, float3(0.0), isnan(_8302)), level(0.0)).xyzw;
    float _2908 = _2906.x;
    float _2910 = _2906.y;
    float _2912 = _2906.z;
    float _2914 = _2906.w;
    float _2916 = _2873;
    if (!_2495)
    {
        float3 _8325 = float3(_2873, _2823, float(as_type<int>(_2887)));
        float3 _8327 = select(_8325, float3(0.0), isnan(_8325));
        float _2918 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8327.xy, uint(rint(_8327.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8327.xy, uint(rint(_8327.z)), level(0.0)).x;
        _2916 = _2918;
    }
    float _2920 = _2916;
    if (_2495)
    {
        _2849 = 1.0;
    }
    float _2922 = _2849;
    float _2924 = _2922;
    if (!_2495)
    {
        int _2926 = int(_2625) << 4;
        int _2928 = _2926 + 2048;
        uint _2930 = uint(int(uint(_2928) >> uint(2)));
        uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
        int _2934 = int(_2930) & 3;
        float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
        int _2938 = int(_2930) + 1;
        uint _2940 = uint(int(uint(_2938) >> uint(2)));
        int _2942 = _2938 & 3;
        float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
        int _2946 = _2928 + 8;
        uint _2948 = uint(int(uint(_2946) >> uint(2)));
        uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
        int _2952 = int(_2948) & 3;
        float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
        int _2956 = int(_2948) + 1;
        uint _2958 = uint(int(uint(_2956) >> uint(2)));
        int _2960 = _2956 & 3;
        float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
        float _2964 = _2317 * _2944;
        float _2966 = fma(_1921, _2936, _2964);
        float _2968 = fma(_1923, _2954, _2966);
        float _2970 = _2968 + _2962;
        float _2972 = precise::clamp(_2970, 0.0, 1.0);
        float _2974 = -_2972;
        float _2976 = _2974 + _2920;
        float _2978 = fma(_2976, 500.0, 1.5);
        float _2980 = exp2(_2978);
        float _2982 = 0.0 + _2980;
        float _2984 = precise::clamp(_2982, 0.0, 1.0);
        _2924 = _2984;
    }
    float _2986 = _2924;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2990 = _2609 + _2988;
    float _2992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2994 = _2611 + _2992;
    float _2996 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2998 = _2615 + _2996;
    float _3000 = _2990 * _2990;
    float _3002 = fma(_2994, _2994, _3000);
    float _3004 = fma(_2998, _2998, _3002);
    float _3006 = rsqrt(_3004);
    float _3008 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3010 = _2994 * _3008;
    float _3012 = _2998 * _3008;
    float _3014 = _3010 * _3010;
    float _3016 = _3012 * _3012;
    float _3018 = _3014 + _3016;
    float _3020 = sqrt(_3018);
    bool _3022 = _3020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3026 = _3020 + _3024;
    float _3028 = _2998;
    float _3030 = _3026;
    float _3032 = _2990;
    if (_3022)
    {
        float _3034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3028 = _3034;
    }
    float _3036 = _3028;
    if (_3022)
    {
        float _3038 = rsqrt(_3018);
        _1931 = _3038;
    }
    float _3040 = _1931;
    float _3042 = _3040;
    if (_3022)
    {
        float _3044 = _3026 * _3036;
        _3030 = _3044;
    }
    float _3046 = _3030;
    if (_3022)
    {
        float _3048 = _3046 * 0.15915493667125701904296875;
        _2763 = _3048;
    }
    float _3050 = _2763;
    float _3052 = _3006;
    float _3054 = _3050;
    if (_3022)
    {
        float _3056 = _3050 * 6.283185482025146484375;
        float _3058 = sin(_3056);
        _3052 = _3058;
    }
    float _3060 = _3052;
    float _3062 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3064 = precise::max(0.0, _3062);
    float _3066 = _3002;
    float _3068 = _3064;
    float _3070 = _3062;
    if (_3022)
    {
        float _3072 = _3050 * 6.283185482025146484375;
        float _3074 = cos(_3072);
        _3066 = _3074;
    }
    float _3076 = _3066;
    float _3078 = -_3008;
    float _3080 = -_3064;
    float _3082 = fma(_2990, _3078, _3080);
    if (!_3022)
    {
        _3068 = _3012;
    }
    float _3084 = _3068;
    float _3086 = _3084;
    if (_3022)
    {
        float _3088 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3070 = _3088;
    }
    float _3090 = _3070;
    float _3092 = _3090;
    float _3094 = _3060;
    if (_3022)
    {
        float _3096 = fma(_3060, _3090, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3092 = _3096;
    }
    float _3098 = _3092;
    float _3100 = _3098;
    if (!_3022)
    {
        _3094 = _3010;
    }
    float _3102 = _3094;
    float _3104 = _3102;
    float _3106 = _3076;
    if (_3022)
    {
        float _3108 = _3076 + (-1.0);
        _3032 = _3108;
    }
    float _3110 = _3032;
    if (_3022)
    {
        float _3112 = _3040 * _3098;
        _2073 = _3112;
    }
    float _3114 = _2073;
    if (!_3022)
    {
        _3100 = _3082;
    }
    float _3116 = _3100;
    float _3118 = _3116;
    if (_3022)
    {
        float _3120 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3054 = _3120;
    }
    float _3122 = _3054;
    if (_3022)
    {
        float _3124 = _3010 * _3114;
        _3104 = _3124;
    }
    float _3126 = _3104;
    if (!_3022)
    {
        _3042 = _3014;
    }
    float _3128 = _3042;
    float _3130 = _3128;
    if (_3022)
    {
        float _3132 = _3012 * _3114;
        _3086 = _3132;
    }
    float _3134 = _3086;
    if (_3022)
    {
        float _3136 = fma(_3082, _3076, _3122);
        _3118 = _3136;
    }
    float _3138 = _3118;
    if (_3022)
    {
        float _3140 = _3126 * _3126;
        _3130 = _3140;
    }
    float _3142 = _3130;
    if (!_3022)
    {
        _3106 = _3016;
    }
    float _3144 = _3106;
    float _3146 = _3144;
    if (_3022)
    {
        float _3148 = _3134 * _3134;
        _3146 = _3148;
    }
    float _3150 = _3146;
    float _3152 = sqrt(_3004);
    float _3154 = fma(_3138, _3138, _3142);
    float _3156 = _3154 + _3150;
    float _3158 = rsqrt(_3156);
    float _3160 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3162 = fma(_3152, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3160);
    float _3164 = precise::clamp(_3162, 0.0, 1.0);
    float _3166 = -_3164;
    float _3168 = _3166 + 1.0;
    float _3170 = _3158 * _3126;
    float _3172 = _3158 * _3138;
    float _3174 = _3158 * _3134;
    float _3176 = abs(_3168);
    float _3178 = log2(_3176);
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3182 = -_3180;
    float _3184 = fma(_3172, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3182);
    float _3186 = -_3174;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3184);
    float _3190 = fma(_3188, -0.5, 0.5);
    float _3192 = fma(_3188, 0.5, 0.5);
    float _3194 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3196 = fma(_3192, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3198 = sqrt(_3190);
    float _3200 = fma(_3192, _3196, -0.212114393711090087890625);
    float _3202 = _3172 + 1.0;
    float _3204 = fma(_3192, _3200, 1.570728778839111328125);
    float _3206 = exp2(_3194);
    float _3208 = _3198 * 0.636619746685028076171875;
    float _3210 = -_3204;
    float _3212 = fma(_3208, _3210, 1.0);
    float _3214 = -_3172;
    float _3216 = fma(_3206, _3202, _3214);
    float _3218 = fma(_3216, 0.5, 0.5);
    float2 _8798 = float2(_3212, _3218);
    float3 _3222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8798, float2(0.0), isnan(_8798)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8798, float2(0.0), isnan(_8798)), level(0.0)).xyz;
    float _3224 = _3222.x;
    float _3226 = _3222.y;
    float _3228 = _3222.z;
    float _3230 = abs(_2367);
    float _3232 = log2(_3230);
    float _3234 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3236 = _2771 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3238 = _2367 <= 8000.0;
    bool _3240 = isnan(_2367);
    bool _3242 = _3238 || _3240;
    bool _3244 = isnan(8000.0);
    bool _3246 = _3242 || _3244;
    float _3248 = float(_3246);
    float _3250 = -_2295;
    float _3252 = _3250 + 1.0;
    float _3254 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3236);
    float _3256 = exp2(_3234);
    float _3258 = _2811 * 0.5;
    float _3260 = _2839 + _2811;
    float _3262 = fma(_2675, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3254);
    float _3264 = _3260 * 0.5;
    float _3266 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3268 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3262);
    float _3270 = exp2(_3266);
    out.gl_Position.x = _2839;
    out.gl_Position.y = _2841;
    out.gl_Position.z = _3268;
    out.gl_Position.w = _2811;
    float _3272 = -_3256;
    float _3274 = _3272 + 1.0;
    float _3276 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3278 = _3276 * _2903;
    float _3280 = _2914 * _3278;
    float _3282 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = fma(_2841, -0.5, _3258);
    float _3288 = _3258;
    float _3290 = _3268;
    float _3292 = _3280;
    if (!_2799)
    {
        _3288 = 1.0;
    }
    float _3294 = _3288;
    float _3296 = fma(_3284, -2.0, 3.0);
    float _3298 = _3284 * _3284;
    float _3300 = _3294;
    if (_2799)
    {
        bool _3302 = _2901 >= _2875;
        bool _3304 = isnan(_2901);
        bool _3306 = _3302 || _3304;
        bool _3308 = isnan(_2875);
        bool _3310 = _3306 || _3308;
        float _3312 = float(_3310);
        _3300 = _3312;
    }
    float _3314 = _3300;
    bool _3316 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3318 = isnan(_3152);
    bool _3320 = _3316 || _3318;
    bool _3322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3324 = _3320 || _3322;
    float _3326 = _3298 * _3296;
    float _3328 = _3314 * _2986;
    float _3330 = -_3326;
    float _3332 = _3330 + 1.0;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3326);
    float _3336 = _3268 + _2811;
    float _3338 = _3248 * _3334;
    float _3340 = _3336 * 0.5;
    if (!_3324)
    {
        _2817 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3342 = _2817;
    float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3346 = _3342;
    float _3348 = _3342;
    if (!_3324)
    {
        _3290 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3350 = _3290;
    out.m_85.x = _3264;
    out.m_85.y = _3286;
    out.m_85.z = _3340;
    out.m_85.w = _2811;
    float _3352 = _3350;
    float _3354 = _3350;
    if (!_3324)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3356 = _2851;
    float _3358 = _3252 * _3344;
    float _3360 = precise::clamp(_3358, 0.0, 1.0);
    float _3362 = -_3360;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3366 = -_3276;
    float _3368 = _3366 + 1.0;
    float _3370 = -_3328;
    float _3372 = fma(_3370, _3364, 1.0);
    float _3374 = precise::clamp(_3372, 0.0, 1.0);
    float _3376 = _2914 * _3368;
    float _3378 = _3368;
    float _3380 = _3374;
    float _3382 = _3356;
    float _3384 = _3356;
    if (!_3324)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3386 = _3378;
    float _3388 = _3374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3390 = _3386;
    float _3392 = _3386;
    if (!_3324)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3394 = _3380;
    out.m_87.x = _3388;
    float _3396 = _3228 * _3278;
    float _3398 = fma(_3224, _3280, _2908);
    float _3400 = fma(_3226, _3280, _2910);
    float _3402 = _3394;
    float _3404 = _3394;
    if (!_3324)
    {
        _3292 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3406 = _3292;
    float _3408 = fma(_2914, _3396, _2912);
    out.m_89.x = _3398;
    out.m_89.y = _3400;
    out.m_89.z = _3408;
    out.m_89.w = _3376;
    bool _3410 = !_3324;
    float _3412 = _3406;
    float _3414 = _3406;
    if (!_3410)
    {
        bool _3416 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3418 = isnan(_3152);
        bool _3420 = _3416 || _3418;
        bool _3422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3424 = _3420 || _3422;
        if (!_3424)
        {
            float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3428 = _3152 + _3426;
            float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3430;
            float _3434 = 1.0 / _3432;
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3442 = _3440 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3456 = _3428 * _3434;
            float _3458 = precise::clamp(_3456, 0.0, 1.0);
            float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3464 = fma(_3458, _3438, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3466 = fma(_3458, _3462, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3468 = fma(_3458, _3442, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3470 = fma(_3458, _3446, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3472 = fma(_3458, _3450, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3474 = fma(_3458, _3454, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3354 = _3466;
            _3404 = _3472;
            _3348 = _3464;
            _3414 = _3470;
            _3384 = _3468;
            _3392 = _3474;
            _3476 = true;
        }
        else
        {
            bool _3478 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3480 = isnan(_3152);
            bool _3482 = _3478 || _3480;
            bool _3484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3486 = _3482 || _3484;
            if (!_3486)
            {
                _3346 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3488 = _3346;
            _3348 = _3488;
            if (!_3486)
            {
                _3352 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3490 = _3352;
            _3354 = _3490;
            if (!_3486)
            {
                _3382 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3492 = _3382;
            _3384 = _3492;
            if (!_3486)
            {
                _3412 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3494 = _3412;
            _3414 = _3494;
            if (!_3486)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3496 = _3402;
            _3404 = _3496;
            if (!_3486)
            {
                _3390 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3498 = _3390;
            bool _3500 = !_3486;
            _3392 = _3498;
            if (!_3500)
            {
                bool _3502 = _3152 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3504 = isnan(_3152);
                bool _3506 = _3502 || _3504;
                bool _3508 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3510 = _3506 || _3508;
                if (!_3510)
                {
                    float _3512 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3514 = _3152 + _3512;
                    float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3518 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3516;
                    float _3520 = 1.0 / _3518;
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3524 = _3522 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3542 = _3514 * _3520;
                    float _3544 = precise::clamp(_3542, 0.0, 1.0);
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3550 = fma(_3544, _3524, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3552 = fma(_3544, _3548, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3554 = fma(_3544, _3528, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3556 = fma(_3544, _3532, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3558 = fma(_3544, _3536, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3560 = fma(_3544, _3540, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3354 = _3552;
                    _3404 = _3558;
                    _3348 = _3550;
                    _3414 = _3556;
                    _3384 = _3554;
                    _3392 = _3560;
                    _3476 = true;
                }
                else
                {
                    _3354 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3348 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3414 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3384 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3392 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3476 = false;
    float _3562 = _3354;
    float _3564 = _3404;
    float _3566 = _3348;
    float _3568 = _3414;
    float _3570 = _3384;
    float _3572 = _3392;
    float _3574 = fma(_2193, -0.5, 0.5);
    float _3576 = precise::clamp(_3574, 0.0, 1.0);
    float _3578 = -_3562;
    float _3580 = _3578 + _3564;
    float _3582 = -_3566;
    float _3584 = _3582 + _3568;
    float _3586 = -_3570;
    float _3588 = _3586 + _3572;
    bool _3590 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3592 = fma(_3576, _3580, _3562);
    float _3594 = fma(_3576, _3584, _3566);
    float _3596 = fma(_3576, _3588, _3570);
    float _3598 = _3592 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3600 = fma(_3594, 0.298911988735198974609375, _3598);
    float _3602 = fma(_3596, 0.114477999508380889892578125, _3600);
    float _3604 = -_3602;
    float _3606 = _3592 + _3604;
    float _3608 = -_3602;
    float _3610 = _3594 + _3608;
    float _3612 = -_3602;
    float _3614 = _3596 + _3612;
    float _3616 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3618 = fma(_3606, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    float _3620 = fma(_3610, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    float _3622 = fma(_3614, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3602);
    out.m_61.x = _3616;
    out.m_93.x = _3620;
    out.m_93.y = _3618;
    out.m_93.z = _3622;
    if (!_3590)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3624 = -_2609;
    float _3626 = _3624 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3628 = -_2611;
    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3632 = -_2615;
    float _3634 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3636 = _3626 * _3626;
    float _3638 = fma(_3630, _3630, _3636);
    float _3640 = fma(_3634, _3634, _3638);
    float _3642 = sqrt(_3640);
    float _3644 = rsqrt(_3640);
    float _3646 = -_3642;
    float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3650 = _3648 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3652 = precise::clamp(_3650, 0.0, 1.0);
    float _3654 = _3630 * _3644;
    float _3656 = _3626 * _3644;
    float _3658 = abs(_3652);
    float _3660 = log2(_3658);
    float _3662 = _3634 * _3644;
    float _3664 = _3654 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3666 = _2193 * _3656;
    float _3668 = -_3656;
    float _3670 = -_3664;
    float _3672 = fma(_3668, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3670);
    float _3674 = fma(_2191, _3654, _3666);
    float _3676 = -_3662;
    float _3678 = fma(_3676, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3672);
    float _3680 = fma(_2197, _3662, _3674);
    float _3682 = precise::clamp(_3680, 0.0, 1.0);
    float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3686 = _3678 + _3684;
    float _3688 = _3660 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3690 = _3686 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3692 = precise::clamp(_3690, 0.0, 1.0);
    float _3694 = exp2(_3688);
    float _3696 = _3694 * _3692;
    float _3698 = _3682 * _3696;
    float _3700 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3702 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3704 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3700;
    out.m_91.y = _3702;
    out.m_91.z = _3704;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

