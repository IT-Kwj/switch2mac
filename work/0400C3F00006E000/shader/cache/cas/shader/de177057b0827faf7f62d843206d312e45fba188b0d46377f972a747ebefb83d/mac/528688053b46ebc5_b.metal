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
    float4 m_77 [[user(locn0)]];
    float4 m_89 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2406 = false;
    bool _1182 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_58.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_61.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_124);
        out.gl_Position.z = _2750;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_63.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_110);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _126 = as_type<int>(_162);
    }
    int _164 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_164);
        out.gl_Position.z = _2820;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_65.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _142 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_65.x;
    float _200 = in.m_65.y;
    float _202 = in.m_65.z;
    float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _206 = log2(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _210 = _196 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = _196 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _232;
    float _236 = 1.0 / _222;
    float _238 = _206 * _142;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _196 + _240;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _246 = _244 != 0;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _254 = _252 != 0;
    float _256 = 1.0 / _218;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _196 + _258;
    bool _262 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _264 = isnan(0.0);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _270 = _266 || _268;
    float _272 = _200 + _202;
    float _274 = _202 + _198;
    float _276 = _202 + (-0.5);
    float _278 = _202 * 2.0;
    float _280 = exp2(_238);
    float _282 = _242 * _236;
    float _284 = _272 + (-1.0);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _288 = 1.0 + _286;
    bool _290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _298 = _294 || _296;
    float _300 = 1.0 / _230;
    float _302 = _260 * _256;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _196 + _304;
    float _308 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _310 = !_246;
    int _312 = _310 ? 0 : 1;
    float _314 = 1.0 / _234;
    float _316 = _200 + (-0.5);
    float _318 = -_280;
    float _320 = _318 + 1.0;
    bool _322 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_196);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _270 ? _320 : 0.0;
    float _336 = floor(_278);
    float _338 = _200 + _198;
    float _340 = _200 * 2.0;
    float _342 = _210 * _300;
    float _344 = _338 + (-1.0);
    float _346 = 1.0 / _226;
    float _348 = _214 * _314;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = 1.0 / _288;
    float _364 = _198 + (-0.5);
    float _366 = _198 * 2.0;
    bool _368 = _336 > 0.0;
    float _370 = fma(_352, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _372 = _336 >= 0.0;
    bool _374 = isnan(_336);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = floor(_366);
    float _386 = _306 * _346;
    float _388 = _274 + (-1.0);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _404 = floor(_340);
    float _406 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _408 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _410 = isnan(_196);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    if (_298)
    {
        float _420 = _334 * _362;
        _146 = _420;
    }
    float _422 = _146;
    float _424 = fma(_392, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = fma(_356, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = -_418;
    float _430 = _428 + 1.0;
    bool _432 = _384 > 0.0;
    float _434 = fma(_396, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _436 = _384 >= 0.0;
    bool _438 = isnan(_384);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = fma(_400, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _448 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _450 = isnan(_196);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _468 = _380 ? 0 : 1;
    float _470 = _458 * _430;
    bool _472 = _404 > 0.0;
    float _474 = -_458;
    float _476 = _474 + 1.0;
    bool _478 = _404 >= 0.0;
    bool _480 = isnan(_404);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _488;
    bool _492 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_196);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _504;
    bool _508 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_196);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_490, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_462, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = fma(_506, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = _502 * _476;
    bool _536 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_196);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -_502;
    float _550 = _548 + 1.0;
    float _552 = -_518;
    float _554 = _552 + 1.0;
    float _556 = fma(_528, _342, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _558 = fma(_466, _342, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _560 = fma(_532, _342, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _562 = _518 * _550;
    float _564 = _546 * _554;
    float _566 = -_546;
    float _568 = _566 + 1.0;
    float _570 = in.m_67.x;
    float _572 = in.m_67.y;
    float _574 = in.m_67.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _584;
    int _588 = abs(_312);
    float _590 = fma(_578, _348, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _592 = fma(_582, _348, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _594 = ~_468;
    int _596 = _594 + 1;
    int _598 = _596 + 1;
    float _600 = fma(_586, _348, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _602 = _332 * _568;
    int _604 = _598;
    if (!_368)
    {
        int _606 = ~_468;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = -_332;
    float _614 = _612 + 1.0;
    float _616 = float(_588);
    float _618 = _370 * _602;
    float _620 = float(_610);
    float _622 = _382 * _602;
    float _624 = _424 * _602;
    int _626 = _444 ? 0 : 1;
    float _628 = _616 * _620;
    bool _630 = !_250;
    int _632 = _630 ? 0 : 1;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    int _636 = ~_626;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = _628 * (-2.0);
    int _644 = abs(_632);
    float _646 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    int _648 = _640;
    float _650 = _622;
    if (!_432)
    {
        int _652 = ~_626;
        int _654 = _652 + 1;
        _648 = _654;
    }
    int _656 = _648;
    float _658 = fma(_642, _570, _570);
    bool _660 = !_254;
    int _662 = _660 ? 0 : 1;
    float _664 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _666 = float(_644);
    float _668 = fma(_406, _642, _406);
    float _670 = float(_656);
    float _672 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[196].x, _658);
    int _674 = _486 ? 0 : 1;
    float _676 = fma(_426, _564, _634);
    int _678 = abs(_662);
    float _680 = _666 * _670;
    int _682 = ~_674;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = fma(_668, _422, _672);
    int _690 = _686;
    if (!_472)
    {
        int _692 = ~_674;
        int _694 = _692 + 1;
        _690 = _694;
    }
    int _696 = _690;
    float _698 = _680 * (-2.0);
    float _700 = _688 * 0.15915493667125701904296875;
    float _702 = float(_696);
    float _704 = fma(_434, _564, _646);
    float _706 = float(_678);
    float _708 = fma(_698, _572, _572);
    float _710 = fma(_308, _698, _308);
    float _712 = fma(_446, _564, _664);
    float _714 = fma(_520, _562, _676);
    float _716 = _706 * _702;
    float _718 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[196].y, _708);
    float _720 = in.m_69.x;
    float _722 = in.m_69.y;
    float _724 = in.m_69.z;
    float _726 = fma(_522, _562, _704);
    float _728 = _716 * (-2.0);
    float _730 = fma(_710, _422, _718);
    float _732 = fma(_524, _562, _712);
    float _734 = fma(_558, _534, _726);
    float _736 = fma(_728, _574, _574);
    float _738 = _730 * 0.15915493667125701904296875;
    float _740 = fma(_402, _728, _402);
    float _742 = in.m_71.x;
    float _744 = in.m_71.y;
    float _746 = in.m_71.z;
    float _748 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _750 = fma(_556, _534, _714);
    float _752 = fma(_560, _534, _732);
    float _754 = fma(_592, _470, _734);
    float _756 = fma(_740, _422, _748);
    float _758 = fma(_590, _470, _750);
    float _760 = fma(_600, _470, _752);
    float _762 = _700 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _756 * 0.15915493667125701904296875;
    float _768 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].x, _758);
    float _770 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].y, _754);
    float _772 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].z, _760);
    float _774 = in.m_58.x;
    float _776 = in.m_58.y;
    float _778 = in.m_58.z;
    float _780 = _768 * _720;
    float _782 = _700 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _770 * _722;
    float _788 = _772 * _724;
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _792 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _796 = _738 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _742);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _746);
    bool _806 = _744 != 0.0;
    bool _808 = isnan(_744);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _790 * _800;
    float _818 = _792 * _802;
    float _820 = _794 * _804;
    float _822 = _766 * 6.283185482025146484375;
    float _824 = cos(_822);
    bool _826 = _742 == 0.0;
    bool _828 = !_814;
    bool _830 = _826 && _828;
    bool _832 = _746 == 0.0;
    bool _834 = _832 && _830;
    float _836 = _738 * 6.283185482025146484375;
    float _838 = sin(_836);
    float _840 = _764 * _798;
    float _842 = _784 * _798;
    float _844 = _766 * 6.283185482025146484375;
    float _846 = sin(_844);
    float _848 = _764 * _838;
    float _850 = _798 * _824;
    float _852 = _784 * _838;
    float _854 = _784 * _824;
    float _856 = _838 * _824;
    float _858 = _764 * _824;
    float _860 = _776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _862 = _854 * _818;
    float _864 = fma(_846, _842, _848);
    float _866 = -_852;
    float _868 = fma(_846, _840, _866);
    float _870 = fma(_846, _848, _842);
    float _872 = -_840;
    float _874 = fma(_846, _852, _872);
    float _876 = -_818;
    float _878 = _846 * _876;
    float _880 = fma(_864, _816, _862);
    float _882 = _858 * _818;
    float _884 = _776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = fma(_850, _816, _878);
    float _888 = fma(_874, _820, _880);
    float _890 = fma(_868, _816, _882);
    float _892 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _894 = fma(_856, _820, _886);
    float _896 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[6].x, _860);
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _902 = fma(_870, _820, _890);
    float _904 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _906 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].x, _900);
    float _912 = _904 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = _906 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _916 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[8].z, _908);
    float _918 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[10].z, _910);
    float _920 = _776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _922 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _924 = _912 + _916;
    float _926 = _914 + _918;
    float _928 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[5].x, _920);
    float _930 = in.m_73.x;
    float _932 = in.m_73.y;
    float _934 = in.m_73.z;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _924 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _926 + _940;
    float _944 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[5].z, _928);
    float _946 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].x, _922);
    float _948 = _938 * _938;
    float _950 = _942 * _942;
    float _952 = _944 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _954 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[9].z, _946);
    float _956 = _948 + _950;
    float _958 = sqrt(_956);
    float _960 = _932;
    float _962 = _930;
    float _964 = _934;
    float _966 = _856;
    float _968 = _774;
    float _970 = _944;
    float _972 = _778;
    float _974 = _926;
    if (!_834)
    {
        float _976 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _932);
        _960 = _976;
    }
    float _978 = _960;
    if (!_834)
    {
        float _980 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _930);
        _962 = _980;
    }
    float _982 = _962;
    if (!_834)
    {
        float _984 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[17].y, _934);
        _964 = _984;
    }
    float _986 = _964;
    float _988 = -_978;
    float _990 = _846 * _988;
    float _992 = _854 * _978;
    bool _994 = _958 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = _858 * _978;
    float _998 = fma(_850, _982, _990);
    float _1000 = fma(_864, _982, _992);
    float _1002 = fma(_868, _982, _996);
    float _1004 = _952 + _954;
    float _1006 = fma(_856, _986, _998);
    float _1008 = fma(_874, _986, _1000);
    float _1010 = fma(_870, _986, _1002);
    float _1012 = _998;
    if (!_994)
    {
        _1012 = _950;
    }
    float _1014 = _1012;
    float _1016 = _1014;
    if (!_994)
    {
        _966 = _948;
    }
    float _1018 = _966;
    float _1020 = _1018;
    if (!_994)
    {
        _968 = _924;
    }
    float _1022 = _968;
    float _1024 = _1022;
    if (!_994)
    {
        _970 = _926;
    }
    float _1026 = _970;
    float _1028 = _1026;
    if (!_994)
    {
        _972 = _1004;
    }
    float _1030 = _972;
    bool _1032 = !_994;
    float _1034 = _1030;
    if (!_1032)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1040 = _958 + _1038;
        float _1042 = rsqrt(_956);
        float _1044 = _1040 * _1036;
        float _1046 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1044 * 0.15915493667125701904296875;
        float _1050 = _1048 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = cos(_1054);
        float _1058 = fma(_1052, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1060 = _1042 * _1058;
        float _1062 = _1056 + (-1.0);
        float _1064 = fma(_938, _1060, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1066 = fma(_942, _1060, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1068 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1072 = _1064 + _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1076 = _1066 + _1074;
        float _1078 = fma(_1004, _1056, _1068);
        float _1080 = _1072 * _1072;
        float _1082 = _1076 * _1076;
        _1034 = _1078;
        _1020 = _1080;
        _1016 = _1082;
        _1024 = _1064;
        _1028 = _1066;
    }
    float _1084 = _1034;
    float _1086 = _1020;
    float _1088 = _1016;
    float _1090 = _1024;
    float _1092 = _1028;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1096 = _1084 + _1094;
    float _1098 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1100 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1102 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1104 = fma(_1096, _1096, _1086);
    float _1106 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1098);
    float _1108 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1100);
    float _1110 = _1104 + _1088;
    float _1112 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1102);
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1116 = sqrt(_1110);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1122 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1112);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1106);
    float _1134 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1108);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    out.m_77.x = _1126;
    out.m_77.y = _1128;
    out.m_77.z = _1130;
    out.m_77.w = _1124;
    bool _1136 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1138 = isnan(_1116);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1144 = _1140 || _1142;
    out.m_79.x = _1122;
    out.m_79.y = _1132;
    out.m_79.z = _1134;
    float _1146 = _1092;
    if (!_1144)
    {
        _974 = 1.0;
    }
    float _1148 = _974;
    bool _1150 = !_1144;
    float _1152 = _1148;
    if (!_1150)
    {
        bool _1154 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1156 = isnan(_1116);
        bool _1158 = _1154 || _1156;
        bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1162 = _1158 || _1160;
        if (!_1162)
        {
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = _1116 + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1170 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1168;
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1174 = _1172 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1176 = 1.0 / _1170;
            float _1178 = _1166 * _1176;
            float _1180 = fma(_1178, _1174, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1152 = _1180;
            _1182 = true;
        }
        else
        {
            bool _1184 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1186 = isnan(_1116);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1192 = _1188 || _1190;
            if (!_1192)
            {
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1116 + _1194;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1204 = _1202 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1206 = 1.0 / _1200;
                float _1208 = _1196 * _1206;
                float _1210 = fma(_1208, _1204, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1152 = _1210;
                _1182 = true;
            }
            else
            {
                _1152 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1182 = false;
    float _1212 = _1152;
    float _1214 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1216 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1218 = floor(_1214);
    float _1220 = floor(_1216);
    float _1222 = -_1218;
    float _1224 = _1214 + _1222;
    float _1226 = -_1220;
    float _1228 = _1216 + _1226;
    float2 _4535 = float2(_1224, _1228);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4535, float2(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4535, float2(0.0), isnan(_4535)), level(0.0)).x;
    float _1232 = _952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1236 = _1090 + _1234;
    float _1238 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1232);
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1242 = _1084 + _1240;
    float _1244 = fma(_1236, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1246 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = _952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1250 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    float _1260 = fma(_1242, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1262 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1264 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1248);
    float _1266 = 1.0 / _1262;
    float _1268 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1264);
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1272 = _1236;
    int _1274 = 2;
    float _1276 = _1242;
    if (_1258)
    {
        _1272 = _1244;
    }
    float _1278 = _1272;
    float _1280 = _1270 + _1262;
    float _1282 = _1280 * _1266;
    float _1284 = _1282 * 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = 1.0 / _1288;
    float _1292 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1294 = _952 + _1292;
    float _1296 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1300 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1296);
    float _1302 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1298);
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1306 = _1290 * _1304;
    float _1308 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1300);
    float _1310 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1302);
    bool _1312 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1314 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1316 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1318 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1320 = !_1312;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = trunc(_1314);
    int _1326 = int(_1324);
    float _1328 = _1278;
    if (!_1312)
    {
        _1274 = 1;
    }
    int _1330 = _1274;
    float _1332 = trunc(_1318);
    int _1334 = int(_1332);
    int _1336 = _1330;
    if (!_1316)
    {
        _1336 = _1322;
    }
    int _1338 = _1336;
    int _1340 = _1338 << 6;
    int _1342 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1344 = _1326 + _1342;
    int _1346 = _1344 + 1;
    int _1348 = _1340 + 48;
    uint _1351 = uint(int(uint(_1348) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.vp_c15)._m0[int(_1361)][_1363];
    bool _1367 = _1346 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1369 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1371 = _1334 + _1369;
    int _1373 = _1371 + 1;
    int _1375 = _1340 + 56;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    int _1393 = _1346 | _1373;
    bool _1395 = _1393 < 0;
    bool _1397 = _1395 || _1367;
    int _1399 = _1340 + 64;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1419 = _1092 + _1417;
    float _1421 = as_type<float>(_1338);
    if (_1258)
    {
        _1146 = _1260;
    }
    float _1423 = _1146;
    bool _1425 = _1373 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1427 = _1425 || _1397;
    float _1429 = fma(_1419, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1431 = _1340 + 72;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    int _1441 = int(_1433) + 1;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    int _1445 = _1441 & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    float _1449 = _1423;
    if (_1258)
    {
        _1276 = _1429;
    }
    float _1451 = _1276;
    int _1453 = _1340 + 96;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.vp_c15)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
    int _1471 = _1340 + 104;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.vp_c15)._m0[int(_1483)][_1485];
    float _1489 = _1451;
    int _1491 = as_type<int>(_1469);
    int _1493 = as_type<int>(_1487);
    if (!_1258)
    {
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1497 = _952 + _1495;
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1501 = _912 + _1499;
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1505 = _1497 * _1497;
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1509 = _914 + _1507;
        float _1511 = fma(_1501, _1501, _1505);
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1515 = fma(_1509, _1509, _1511);
        float _1517 = sqrt(_1515);
        float _1519 = _1503 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1521 = -_914;
        float _1523 = _1521 + _1429;
        float _1525 = precise::min(_1517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1527 = _1525 * _1513;
        float _1529 = -_952;
        float _1531 = _1529 + _1260;
        float _1533 = _1519 * _1527;
        float _1535 = -_912;
        float _1537 = _1535 + _1244;
        float _1539 = fma(_1531, _1533, _952);
        float _1541 = fma(_1537, _1533, _912);
        float _1543 = fma(_1523, _1533, _914);
        _1449 = _1539;
        _1328 = _1541;
        _1489 = _1543;
        _650 = _1513;
    }
    float _1545 = _1449;
    float _1547 = _1328;
    float _1549 = _1489;
    float _1551 = _650;
    float _1553 = _1294 * _1469;
    float _1555 = _1551;
    if (!_1427)
    {
        int _1557 = _1373 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1559 = _1557 + _1346;
        _1491 = _1559;
    }
    int _1561 = _1491;
    float _1563 = _1294 * _1415;
    float _1565 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1567 = fma(_912, _1461, _1553);
    float _1569 = _1294 * _1365;
    float _1571 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1573 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1565);
    float _1575 = fma(_914, _1479, _1567);
    float _1577 = fma(_912, _1357, _1569);
    float _1579 = fma(_912, _1407, _1563);
    int _1581 = _1340 + 80;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    uint _1585 = uint(int(uint(int(_1583)) >> uint(2)));
    int _1587 = int(_1583) & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    int _1591 = int(_1583) + 1;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    int _1595 = _1591 & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    float _1599 = _1575 + _1487;
    int _1601 = as_type<int>(_1575);
    if (!_1427)
    {
        int _1603 = _1561 << 2;
        _1601 = _1603;
    }
    int _1605 = _1601;
    float _1607 = fma(_914, _1383, _1577);
    int _1609 = _1605;
    if (!_1427)
    {
        uint _1611 = uint(int(uint(_1561) >> uint(2)));
        _1493 = int(_1611);
    }
    int _1613 = _1493;
    float _1615 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1573);
    if (!_1427)
    {
        int _1617 = 12 & _1605;
        _1609 = _1617;
    }
    int _1619 = _1609;
    float _1621 = 1.0 / _1599;
    int _1623 = _1340 + 88;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    float _1641 = fma(_914, _1439, _1579);
    float _1643 = as_type<float>(_1619);
    if (!_1427)
    {
        int _1645 = _1613 << 4;
        int _1647 = _1645 + _1619;
        _1643 = as_type<float>(_1647);
    }
    float _1649 = _1643;
    float _1651 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1653 = _1607 + _1391;
    float _1655 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1657 = _1641 + _1447;
    float _1659 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1661 = _1649;
    if (!_1427)
    {
        int _1663 = as_type<int>(_1649) + 400;
        uint _1665 = uint(int(uint(_1663) >> uint(2)));
        uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
        int _1669 = int(_1665) & 3;
        float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
        _1661 = _1671;
    }
    float _1673 = _1661;
    float _1675 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1651);
    float _1677 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1679 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1659);
    float _1681 = _1244;
    if (!_1427)
    {
        float _1683 = floor(_1318);
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1675);
    float _1689 = -_1677;
    float _1691 = fma(_1689, _1571, 1.0);
    float _1693 = _1653 * _1621;
    float _1695 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1679);
    float _1699 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1701 = _1657 * _1621;
    bool _1703 = _1693 >= 0.0;
    float _1705 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1707 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1711 = _1693 <= 1.0;
    bool _1713 = _1711 && _1703;
    float _1715 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1705);
    float _1717 = log2(_1691);
    float _1719 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1709);
    bool _1721 = _1701 >= 0.0;
    bool _1723 = _1721 && _1713;
    float _1725 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1719);
    bool _1731 = _1701 <= 1.0;
    bool _1733 = _1731 && _1723;
    float _1735 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = _1685;
    float _1739 = _1621;
    if (!_1427)
    {
        float _1741 = floor(_1314);
        _1555 = _1741;
    }
    float _1743 = _1555;
    float _1745 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1729);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1749 = _1745;
    if (!_1427)
    {
        float _1751 = -_1685;
        float _1753 = _1318 + _1751;
        _1737 = _1753;
    }
    float _1755 = _1737;
    float _1757 = _1294 * _1597;
    float _1759 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1761 = 1.0 / _1745;
    float _1763 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1765 = fma(_912, _1589, _1757);
    if (_1733)
    {
        float _1767 = float(_1338);
        _1421 = _1767;
    }
    float _1769 = _1421;
    float _1771 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1759);
    float _1773 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1763);
    float _1775 = fma(_914, _1631, _1765);
    float _1777 = _1717 * 0.693147182464599609375;
    float _1779 = _1735;
    float _1781 = _1773;
    if (_1733)
    {
        float _1783 = rint(_1769);
        float _1785 = precise::max(_1783, 0.0);
        uint _1787 = uint(_1785);
        uint _1789 = clamp(_1787, 0u, 65535u);
        _1779 = as_type<float>(_1789);
    }
    float _1791 = _1779;
    float _1793 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1771);
    float _1795 = _1775 + _1639;
    float _1797 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1799 = _1795 * _1621;
    float _1801 = _1673;
    float _1803 = _1793;
    if (!_1427)
    {
        float _1805 = rint(_1673);
        float _1807 = precise::max(_1805, 0.0);
        uint _1809 = uint(_1807);
        uint _1811 = clamp(_1809, 0u, 65535u);
        _1801 = as_type<float>(_1811);
    }
    float _1813 = _1801;
    float _1815 = _1773 * _1761;
    float _1817 = _1793 * _1761;
    float _1819 = _1761;
    float _1821 = _1817;
    if (!_1427)
    {
        float _1823 = -_1743;
        float _1825 = _1314 + _1823;
        _1819 = _1825;
    }
    float _1827 = _1819;
    float _1829 = fma(_1815, 0.5, 0.5);
    float _1831 = fma(_1817, -0.5, 0.5);
    float _1833 = _1791;
    float _1835 = _1829;
    if (_1733)
    {
        float3 _5566 = float3(_1693, _1701, float(as_type<int>(_1791)));
        float3 _5570 = select(_5566, float3(0.0), isnan(_5566));
        float _1837 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5570.xy, uint(rint(_5570.z)), _1799, level(0.0));
        _1833 = _1837;
    }
    float _1839 = _1833;
    float3 _5580 = float3(_1829, _1831, _1797);
    float _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5580, float3(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5580, float3(0.0), isnan(_5580)), level(0.0)).x;
    float3 _5589 = float3(_1829, _1831, _1797);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5589, float3(0.0), isnan(_5589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5589, float3(0.0), isnan(_5589)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float _1854 = _1827;
    if (!_1427)
    {
        float3 _5612 = float3(_1827, _1755, float(as_type<int>(_1813)));
        float3 _5614 = select(_5612, float3(0.0), isnan(_5612));
        float _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5614.xy, uint(rint(_5614.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5614.xy, uint(rint(_5614.z)), level(0.0)).x;
        _1854 = _1856;
    }
    float _1858 = _1854;
    if (_1427)
    {
        _1739 = 1.0;
    }
    float _1860 = _1739;
    float _1862 = _1860;
    if (!_1427)
    {
        int _1864 = _1561 << 4;
        int _1866 = _1864 + 2048;
        uint _1868 = uint(int(uint(_1866) >> uint(2)));
        uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
        int _1872 = int(_1868) & 3;
        float _1874 = (*spvDescriptorSet0.vp_c15)._m0[int(_1870)][_1872];
        int _1876 = int(_1868) + 1;
        uint _1878 = uint(int(uint(_1876) >> uint(2)));
        int _1880 = _1876 & 3;
        float _1882 = (*spvDescriptorSet0.vp_c15)._m0[int(_1878)][_1880];
        int _1884 = _1866 + 8;
        uint _1886 = uint(int(uint(_1884) >> uint(2)));
        uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
        int _1890 = int(_1886) & 3;
        float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
        int _1894 = int(_1886) + 1;
        uint _1896 = uint(int(uint(_1894) >> uint(2)));
        int _1898 = _1894 & 3;
        float _1900 = (*spvDescriptorSet0.vp_c15)._m0[int(_1896)][_1898];
        float _1902 = _1294 * _1882;
        float _1904 = fma(_912, _1874, _1902);
        float _1906 = fma(_914, _1892, _1904);
        float _1908 = _1906 + _1900;
        float _1910 = precise::clamp(_1908, 0.0, 1.0);
        float _1912 = -_1910;
        float _1914 = _1912 + _1858;
        float _1916 = fma(_1914, 500.0, 1.5);
        float _1918 = exp2(_1916);
        float _1920 = 0.0 + _1918;
        float _1922 = precise::clamp(_1920, 0.0, 1.0);
        _1821 = _1874;
        _1862 = _1922;
    }
    float _1924 = _1821;
    float _1926 = _1862;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1930 = _1545 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1934 = _1547 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1549 + _1936;
    float _1940 = _1930 * _1930;
    float _1942 = fma(_1934, _1934, _1940);
    float _1944 = fma(_1938, _1938, _1942);
    float _1946 = rsqrt(_1944);
    float _1948 = sqrt(_1944);
    float _1950 = _1934 * _1946;
    float _1952 = _1938 * _1946;
    float _1954 = _1930 * _1946;
    float _1956 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1958 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1960 = _1956 * _1956;
    float _1962 = _1958 * _1958;
    float _1964 = _1960 + _1962;
    float _1966 = sqrt(_1964);
    bool _1968 = _1966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1972 = _1966 + _1970;
    float _1974 = _1813;
    float _1976 = _1972;
    float _1978 = _1924;
    float _1980 = _1946;
    if (_1968)
    {
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1974 = _1982;
    }
    float _1984 = _1974;
    float _1986 = _1984;
    if (_1968)
    {
        float _1988 = _1972 * _1984;
        _1976 = _1988;
    }
    float _1990 = _1976;
    if (_1968)
    {
        float _1992 = rsqrt(_1964);
        _1986 = _1992;
    }
    float _1994 = _1986;
    float _1996 = _1994;
    if (_1968)
    {
        float _1998 = _1990 * 0.15915493667125701904296875;
        _1978 = _1998;
    }
    float _2000 = _1978;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2004 = _1693;
    float _2006 = _2000;
    if (_1968)
    {
        float _2008 = _2000 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        _2004 = _2010;
    }
    float _2012 = _2004;
    float _2014 = precise::max(0.0, _2002);
    float _2016 = _1858;
    if (_1968)
    {
        float _2018 = _2000 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = -_1954;
    float _2026 = -_2014;
    float _2028 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2026);
    float _2030 = _2028;
    if (_1968)
    {
        float _2032 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1980 = _2032;
    }
    float _2034 = _1980;
    float _2036 = _2012;
    float _2038 = _2034;
    if (_1968)
    {
        float _2040 = fma(_2012, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2036 = _2040;
    }
    float _2042 = _2036;
    float _2044 = _2042;
    if (_1968)
    {
        float _2046 = _1994 * _2042;
        _1835 = _2046;
    }
    float _2048 = _1835;
    if (!_1968)
    {
        _2044 = _1956;
    }
    float _2050 = _2044;
    float _2052 = _2050;
    float _2054 = _2022;
    if (_1968)
    {
        float _2056 = _2022 + (-1.0);
        _2038 = _2056;
    }
    float _2058 = _2038;
    float _2060 = _2058;
    if (_1968)
    {
        float _2062 = _1956 * _2048;
        _2052 = _2062;
    }
    float _2064 = _2052;
    if (!_1968)
    {
        _1996 = _1960;
    }
    float _2066 = _1996;
    float _2068 = _2066;
    if (_1968)
    {
        float _2070 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2070;
    }
    float _2072 = _2006;
    if (!_1968)
    {
        _2060 = _1958;
    }
    float _2074 = _2060;
    float _2076 = _2074;
    if (_1968)
    {
        float _2078 = _1958 * _2048;
        _2076 = _2078;
    }
    float _2080 = _2076;
    if (_1968)
    {
        float _2082 = _2064 * _2064;
        _2068 = _2082;
    }
    float _2084 = _2068;
    if (_1968)
    {
        float _2086 = fma(_2028, _2022, _2072);
        _2030 = _2086;
    }
    float _2088 = _2030;
    if (!_1968)
    {
        _2054 = _1962;
    }
    float _2090 = _2054;
    float _2092 = _2090;
    if (_1968)
    {
        float _2094 = _2080 * _2080;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = fma(_2088, _2088, _2084);
    float _2100 = _2098 + _2096;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2104 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2102);
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = -_2106;
    float _2110 = _2108 + 1.0;
    float _2112 = rsqrt(_2100);
    float _2114 = _2112 * _2064;
    float _2116 = _2112 * _2088;
    float _2118 = _2112 * _2080;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2122 = abs(_2110);
    float _2124 = log2(_2122);
    float _2126 = -_2120;
    float _2128 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2126);
    float _2130 = -_2118;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2128);
    float _2134 = fma(_2132, -0.5, 0.5);
    float _2136 = fma(_2132, 0.5, 0.5);
    float _2138 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2142 = sqrt(_2134);
    float _2144 = fma(_2136, _2138, -0.212114393711090087890625);
    float _2146 = _2116 + 1.0;
    float _2148 = fma(_2136, _2144, 1.570728778839111328125);
    float _2150 = exp2(_2140);
    float _2152 = _2142 * 0.636619746685028076171875;
    float _2154 = -_2116;
    float _2156 = fma(_2150, _2146, _2154);
    float _2158 = -_2148;
    float _2160 = fma(_2152, _2158, 1.0);
    float _2162 = fma(_2156, 0.5, 0.5);
    float2 _6090 = float2(_2160, _2162);
    float3 _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6090, float2(0.0), isnan(_6090)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6090, float2(0.0), isnan(_6090)), level(0.0)).xyz;
    float _2168 = _2166.x;
    float _2170 = _2166.y;
    float _2172 = _2166.z;
    float _2174 = abs(_1306);
    float _2176 = log2(_2174);
    float _2178 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2180 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2182 = -_1230;
    float _2184 = _2182 + 1.0;
    out.m_81.x = _1547;
    out.m_81.y = _1545;
    out.m_81.z = _1549;
    float _2186 = exp2(_2178);
    bool _2188 = _1306 <= 8000.0;
    bool _2190 = isnan(_1306);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan(8000.0);
    bool _2196 = _2192 || _2194;
    float _2198 = float(_2196);
    float _2200 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2180);
    float _2202 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2200);
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2206 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2202);
    float _2208 = exp2(_2204);
    out.gl_Position.x = _1773;
    out.gl_Position.y = _1793;
    out.gl_Position.z = _2206;
    out.gl_Position.w = _1745;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2212 = precise::clamp(_2210, 0.0, 1.0);
    float _2214 = fma(_2212, -2.0, 3.0);
    float _2216 = _2212 * _2212;
    float _2218 = _2216 * _2214;
    float _2220 = -_2218;
    float _2222 = _2220 + 1.0;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2218);
    float _2226 = _2198 * _2224;
    float _2228 = _2198;
    float _2230 = _2206;
    if (!_1733)
    {
        _2228 = 1.0;
    }
    float _2232 = _2228;
    float _2234 = _2232;
    if (_1733)
    {
        bool _2236 = _1839 >= _1799;
        bool _2238 = isnan(_1839);
        bool _2240 = _2236 || _2238;
        bool _2242 = isnan(_1799);
        bool _2244 = _2240 || _2242;
        float _2246 = float(_2244);
        _2234 = _2246;
    }
    float _2248 = _2234;
    float _2250 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2252 = -_2186;
    float _2254 = _2252 + 1.0;
    bool _2256 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2258 = isnan(_1948);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2264 = _2260 || _2262;
    float _2266 = _2184 * _2250;
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    float _2270 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2272 = _2248 * _1926;
    float _2274 = -_2268;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2278 = _2270 * _1841;
    float _2280 = -_2272;
    float _2282 = fma(_2280, _2276, 1.0);
    float _2284 = precise::clamp(_2282, 0.0, 1.0);
    float _2286 = _1852 * _2278;
    float _2288 = -_2270;
    float _2290 = _2288 + 1.0;
    float _2292 = _2290;
    float _2294 = _2284;
    if (!_2264)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2296 = _1749;
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2300 = _2296;
    float _2302 = _2296;
    if (!_2264)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2304 = _1803;
    float _2306 = _1852 * _2290;
    float _2308 = _2304;
    float _2310 = _2304;
    if (!_2264)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2312 = _2230;
    out.m_83.x = _2298;
    float _2314 = _2312;
    float _2316 = _2312;
    if (!_2264)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2318 = _1781;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2264)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2324 = _2292;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2264)
    {
        _2294 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2330 = _2294;
    float _2332 = _2172 * _2278;
    float _2334 = fma(_2168, _2286, _1846);
    float _2336 = fma(_2170, _2286, _1848);
    float _2338 = fma(_1852, _2332, _1850);
    out.m_85.x = _2334;
    out.m_85.y = _2336;
    out.m_85.z = _2338;
    out.m_85.w = _2306;
    bool _2340 = !_2264;
    float _2342 = _2330;
    float _2344 = _2330;
    if (!_2340)
    {
        bool _2346 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2348 = isnan(_1948);
        bool _2350 = _2346 || _2348;
        bool _2352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2354 = _2350 || _2352;
        if (!_2354)
        {
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2358 = _1948 + _2356;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2362 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2360;
            float _2364 = 1.0 / _2362;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2382 = _2358 * _2364;
            float _2384 = precise::clamp(_2382, 0.0, 1.0);
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2396 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2398 = fma(_2384, _2392, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2400 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2402 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2404 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2310 = _2398;
            _2328 = _2402;
            _2302 = _2396;
            _2322 = _2400;
            _2316 = _2394;
            _2344 = _2404;
            _2406 = true;
        }
        else
        {
            bool _2408 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2410 = isnan(_1948);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2416 = _2412 || _2414;
            if (!_2416)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2418 = _2300;
            _2302 = _2418;
            if (!_2416)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2420 = _2308;
            _2310 = _2420;
            if (!_2416)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2422 = _2314;
            _2316 = _2422;
            if (!_2416)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2424 = _2320;
            _2322 = _2424;
            if (!_2416)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2426 = _2326;
            _2328 = _2426;
            if (!_2416)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2428 = _2342;
            bool _2430 = !_2416;
            _2344 = _2428;
            if (!_2430)
            {
                bool _2432 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2434 = isnan(_1948);
                bool _2436 = _2432 || _2434;
                bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2440 = _2436 || _2438;
                if (!_2440)
                {
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2444 = _1948 + _2442;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2448 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2446;
                    float _2450 = 1.0 / _2448;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2468 = _2444 * _2450;
                    float _2470 = precise::clamp(_2468, 0.0, 1.0);
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2482 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2484 = fma(_2470, _2478, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2486 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2488 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2490 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2310 = _2484;
                    _2328 = _2488;
                    _2302 = _2482;
                    _2322 = _2486;
                    _2316 = _2480;
                    _2344 = _2490;
                    _2406 = true;
                }
                else
                {
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2406 = false;
    float _2492 = _2310;
    float _2494 = _2328;
    float _2496 = _2302;
    float _2498 = _2322;
    float _2500 = _2316;
    float _2502 = _2344;
    float _2504 = fma(_1132, -0.5, 0.5);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = -_2492;
    float _2510 = _2508 + _2494;
    float _2512 = -_2496;
    float _2514 = _2512 + _2498;
    float _2516 = -_2500;
    float _2518 = _2516 + _2502;
    bool _2520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2522 = fma(_2506, _2510, _2492);
    float _2524 = fma(_2506, _2514, _2496);
    float _2526 = fma(_2506, _2518, _2500);
    float _2528 = _2522 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2530 = fma(_2524, 0.298911988735198974609375, _2528);
    float _2532 = fma(_2526, 0.114477999508380889892578125, _2530);
    out.m_87.x = 0.0;
    float _2534 = -_2532;
    float _2536 = _2524 + _2534;
    float _2538 = -_2532;
    float _2540 = _2522 + _2538;
    float _2542 = -_2532;
    float _2544 = _2526 + _2542;
    float _2546 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2548 = fma(_2536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    float _2550 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    out.m_89.x = 0.0;
    out.m_83.w = _2546;
    out.m_91.x = _2548;
    out.m_91.y = _2550;
    out.m_91.z = _2552;
    if (!_2520)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2554 = -_1545;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2558 = -_1547;
    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2562 = -_1549;
    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = sqrt(_2570);
    float _2576 = _2556 * _2572;
    float _2578 = _2560 * _2572;
    float _2580 = _2564 * _2572;
    float _2582 = -_1954;
    float _2584 = _2582 + _2576;
    float _2586 = -_1950;
    float _2588 = _2586 + _2578;
    float _2590 = -_1952;
    float _2592 = _2590 + _2580;
    float _2594 = _2584 * _2584;
    float _2596 = -_2574;
    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2600 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = fma(_2588, _2588, _2594);
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2608 = precise::clamp(_2606, 0.0, 1.0);
    float _2610 = _2602 * _2602;
    float _2612 = fma(_2592, _2592, _2604);
    float _2614 = _2610 + (-1.0);
    float _2616 = abs(_2608);
    float _2618 = log2(_2616);
    float _2620 = rsqrt(_2612);
    float _2622 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2624 = exp2(_2622);
    float _2626 = _2584 * _2620;
    float _2628 = _2588 * _2620;
    float _2630 = _2592 * _2620;
    float _2632 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2634 = _1132 * _2626;
    float _2636 = _1132 * _2576;
    float _2638 = fma(_1122, _2628, _2634);
    float _2640 = fma(_1122, _2578, _2636);
    float _2642 = fma(_1134, _2630, _2638);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = fma(_1134, _2580, _2640);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = _2644 * _2644;
    float _2652 = fma(_2650, _2614, 1.0);
    float _2654 = -_2576;
    float _2656 = -_2632;
    float _2658 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2656);
    float _2660 = _2652 * _2652;
    float _2662 = -_2580;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2658);
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2668 = _2664 + _2666;
    float _2670 = 1.0 / _2660;
    float _2672 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2674 = precise::clamp(_2672, 0.0, 1.0);
    float _2676 = _2624 * _2674;
    float _2678 = _2648 * _2676;
    float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2682 = _2610 * _2670;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2686 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2688 = _2678 * _2682;
    out.m_87.x = _2680;
    out.m_87.y = _2684;
    out.m_87.z = _2686;
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2692 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2690;
    out.m_89.y = _2692;
    out.m_89.z = _2694;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2406 = false;
    bool _1182 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_58.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_61.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_124);
        out.gl_Position.z = _2750;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_63.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_110);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _126 = as_type<int>(_162);
    }
    int _164 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_164);
        out.gl_Position.z = _2820;
    }
    if (_156)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_65.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _142 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_65.x;
    float _200 = in.m_65.y;
    float _202 = in.m_65.z;
    float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _206 = log2(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _210 = _196 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = _196 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _232;
    float _236 = 1.0 / _222;
    float _238 = _206 * _142;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _196 + _240;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _246 = _244 != 0;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _254 = _252 != 0;
    float _256 = 1.0 / _218;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _196 + _258;
    bool _262 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _264 = isnan(0.0);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _270 = _266 || _268;
    float _272 = _200 + _202;
    float _274 = _202 + _198;
    float _276 = _202 + (-0.5);
    float _278 = _202 * 2.0;
    float _280 = exp2(_238);
    float _282 = _242 * _236;
    float _284 = _272 + (-1.0);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _288 = 1.0 + _286;
    bool _290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _298 = _294 || _296;
    float _300 = 1.0 / _230;
    float _302 = _260 * _256;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _196 + _304;
    float _308 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _310 = !_246;
    int _312 = _310 ? 0 : 1;
    float _314 = 1.0 / _234;
    float _316 = _200 + (-0.5);
    float _318 = -_280;
    float _320 = _318 + 1.0;
    bool _322 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_196);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _270 ? _320 : 0.0;
    float _336 = floor(_278);
    float _338 = _200 + _198;
    float _340 = _200 * 2.0;
    float _342 = _210 * _300;
    float _344 = _338 + (-1.0);
    float _346 = 1.0 / _226;
    float _348 = _214 * _314;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = 1.0 / _288;
    float _364 = _198 + (-0.5);
    float _366 = _198 * 2.0;
    bool _368 = _336 > 0.0;
    float _370 = fma(_352, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _372 = _336 >= 0.0;
    bool _374 = isnan(_336);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = floor(_366);
    float _386 = _306 * _346;
    float _388 = _274 + (-1.0);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _404 = floor(_340);
    float _406 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _408 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _410 = isnan(_196);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    if (_298)
    {
        float _420 = _334 * _362;
        _146 = _420;
    }
    float _422 = _146;
    float _424 = fma(_392, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = fma(_356, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = -_418;
    float _430 = _428 + 1.0;
    bool _432 = _384 > 0.0;
    float _434 = fma(_396, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _436 = _384 >= 0.0;
    bool _438 = isnan(_384);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = fma(_400, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _448 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _450 = isnan(_196);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _468 = _380 ? 0 : 1;
    float _470 = _458 * _430;
    bool _472 = _404 > 0.0;
    float _474 = -_458;
    float _476 = _474 + 1.0;
    bool _478 = _404 >= 0.0;
    bool _480 = isnan(_404);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _488;
    bool _492 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_196);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _504;
    bool _508 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_196);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_490, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_462, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = fma(_506, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = _502 * _476;
    bool _536 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_196);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -_502;
    float _550 = _548 + 1.0;
    float _552 = -_518;
    float _554 = _552 + 1.0;
    float _556 = fma(_528, _342, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _558 = fma(_466, _342, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _560 = fma(_532, _342, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _562 = _518 * _550;
    float _564 = _546 * _554;
    float _566 = -_546;
    float _568 = _566 + 1.0;
    float _570 = in.m_67.x;
    float _572 = in.m_67.y;
    float _574 = in.m_67.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _584;
    int _588 = abs(_312);
    float _590 = fma(_578, _348, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _592 = fma(_582, _348, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _594 = ~_468;
    int _596 = _594 + 1;
    int _598 = _596 + 1;
    float _600 = fma(_586, _348, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _602 = _332 * _568;
    int _604 = _598;
    if (!_368)
    {
        int _606 = ~_468;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = -_332;
    float _614 = _612 + 1.0;
    float _616 = float(_588);
    float _618 = _370 * _602;
    float _620 = float(_610);
    float _622 = _382 * _602;
    float _624 = _424 * _602;
    int _626 = _444 ? 0 : 1;
    float _628 = _616 * _620;
    bool _630 = !_250;
    int _632 = _630 ? 0 : 1;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    int _636 = ~_626;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = _628 * (-2.0);
    int _644 = abs(_632);
    float _646 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    int _648 = _640;
    float _650 = _622;
    if (!_432)
    {
        int _652 = ~_626;
        int _654 = _652 + 1;
        _648 = _654;
    }
    int _656 = _648;
    float _658 = fma(_642, _570, _570);
    bool _660 = !_254;
    int _662 = _660 ? 0 : 1;
    float _664 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _666 = float(_644);
    float _668 = fma(_406, _642, _406);
    float _670 = float(_656);
    float _672 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[196].x, _658);
    int _674 = _486 ? 0 : 1;
    float _676 = fma(_426, _564, _634);
    int _678 = abs(_662);
    float _680 = _666 * _670;
    int _682 = ~_674;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = fma(_668, _422, _672);
    int _690 = _686;
    if (!_472)
    {
        int _692 = ~_674;
        int _694 = _692 + 1;
        _690 = _694;
    }
    int _696 = _690;
    float _698 = _680 * (-2.0);
    float _700 = _688 * 0.15915493667125701904296875;
    float _702 = float(_696);
    float _704 = fma(_434, _564, _646);
    float _706 = float(_678);
    float _708 = fma(_698, _572, _572);
    float _710 = fma(_308, _698, _308);
    float _712 = fma(_446, _564, _664);
    float _714 = fma(_520, _562, _676);
    float _716 = _706 * _702;
    float _718 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[196].y, _708);
    float _720 = in.m_69.x;
    float _722 = in.m_69.y;
    float _724 = in.m_69.z;
    float _726 = fma(_522, _562, _704);
    float _728 = _716 * (-2.0);
    float _730 = fma(_710, _422, _718);
    float _732 = fma(_524, _562, _712);
    float _734 = fma(_558, _534, _726);
    float _736 = fma(_728, _574, _574);
    float _738 = _730 * 0.15915493667125701904296875;
    float _740 = fma(_402, _728, _402);
    float _742 = in.m_71.x;
    float _744 = in.m_71.y;
    float _746 = in.m_71.z;
    float _748 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _750 = fma(_556, _534, _714);
    float _752 = fma(_560, _534, _732);
    float _754 = fma(_592, _470, _734);
    float _756 = fma(_740, _422, _748);
    float _758 = fma(_590, _470, _750);
    float _760 = fma(_600, _470, _752);
    float _762 = _700 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _756 * 0.15915493667125701904296875;
    float _768 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].x, _758);
    float _770 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].y, _754);
    float _772 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].z, _760);
    float _774 = in.m_58.x;
    float _776 = in.m_58.y;
    float _778 = in.m_58.z;
    float _780 = _768 * _720;
    float _782 = _700 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _770 * _722;
    float _788 = _772 * _724;
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _792 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _796 = _738 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _742);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _746);
    bool _806 = _744 != 0.0;
    bool _808 = isnan(_744);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _790 * _800;
    float _818 = _792 * _802;
    float _820 = _794 * _804;
    float _822 = _766 * 6.283185482025146484375;
    float _824 = cos(_822);
    bool _826 = _742 == 0.0;
    bool _828 = !_814;
    bool _830 = _826 && _828;
    bool _832 = _746 == 0.0;
    bool _834 = _832 && _830;
    float _836 = _738 * 6.283185482025146484375;
    float _838 = sin(_836);
    float _840 = _764 * _798;
    float _842 = _784 * _798;
    float _844 = _766 * 6.283185482025146484375;
    float _846 = sin(_844);
    float _848 = _764 * _838;
    float _850 = _798 * _824;
    float _852 = _784 * _838;
    float _854 = _784 * _824;
    float _856 = _838 * _824;
    float _858 = _764 * _824;
    float _860 = _776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _862 = _854 * _818;
    float _864 = fma(_846, _842, _848);
    float _866 = -_852;
    float _868 = fma(_846, _840, _866);
    float _870 = fma(_846, _848, _842);
    float _872 = -_840;
    float _874 = fma(_846, _852, _872);
    float _876 = -_818;
    float _878 = _846 * _876;
    float _880 = fma(_864, _816, _862);
    float _882 = _858 * _818;
    float _884 = _776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = fma(_850, _816, _878);
    float _888 = fma(_874, _820, _880);
    float _890 = fma(_868, _816, _882);
    float _892 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _894 = fma(_856, _820, _886);
    float _896 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[6].x, _860);
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _902 = fma(_870, _820, _890);
    float _904 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _906 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].x, _900);
    float _912 = _904 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = _906 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _916 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[8].z, _908);
    float _918 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[10].z, _910);
    float _920 = _776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _922 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _924 = _912 + _916;
    float _926 = _914 + _918;
    float _928 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[5].x, _920);
    float _930 = in.m_73.x;
    float _932 = in.m_73.y;
    float _934 = in.m_73.z;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _924 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _926 + _940;
    float _944 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[5].z, _928);
    float _946 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].x, _922);
    float _948 = _938 * _938;
    float _950 = _942 * _942;
    float _952 = _944 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _954 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[9].z, _946);
    float _956 = _948 + _950;
    float _958 = sqrt(_956);
    float _960 = _932;
    float _962 = _930;
    float _964 = _934;
    float _966 = _856;
    float _968 = _774;
    float _970 = _944;
    float _972 = _778;
    float _974 = _926;
    if (!_834)
    {
        float _976 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _932);
        _960 = _976;
    }
    float _978 = _960;
    if (!_834)
    {
        float _980 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _930);
        _962 = _980;
    }
    float _982 = _962;
    if (!_834)
    {
        float _984 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[17].y, _934);
        _964 = _984;
    }
    float _986 = _964;
    float _988 = -_978;
    float _990 = _846 * _988;
    float _992 = _854 * _978;
    bool _994 = _958 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = _858 * _978;
    float _998 = fma(_850, _982, _990);
    float _1000 = fma(_864, _982, _992);
    float _1002 = fma(_868, _982, _996);
    float _1004 = _952 + _954;
    float _1006 = fma(_856, _986, _998);
    float _1008 = fma(_874, _986, _1000);
    float _1010 = fma(_870, _986, _1002);
    float _1012 = _998;
    if (!_994)
    {
        _1012 = _950;
    }
    float _1014 = _1012;
    float _1016 = _1014;
    if (!_994)
    {
        _966 = _948;
    }
    float _1018 = _966;
    float _1020 = _1018;
    if (!_994)
    {
        _968 = _924;
    }
    float _1022 = _968;
    float _1024 = _1022;
    if (!_994)
    {
        _970 = _926;
    }
    float _1026 = _970;
    float _1028 = _1026;
    if (!_994)
    {
        _972 = _1004;
    }
    float _1030 = _972;
    bool _1032 = !_994;
    float _1034 = _1030;
    if (!_1032)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1040 = _958 + _1038;
        float _1042 = rsqrt(_956);
        float _1044 = _1040 * _1036;
        float _1046 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1044 * 0.15915493667125701904296875;
        float _1050 = _1048 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = cos(_1054);
        float _1058 = fma(_1052, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1060 = _1042 * _1058;
        float _1062 = _1056 + (-1.0);
        float _1064 = fma(_938, _1060, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1066 = fma(_942, _1060, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1068 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1072 = _1064 + _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1076 = _1066 + _1074;
        float _1078 = fma(_1004, _1056, _1068);
        float _1080 = _1072 * _1072;
        float _1082 = _1076 * _1076;
        _1034 = _1078;
        _1020 = _1080;
        _1016 = _1082;
        _1024 = _1064;
        _1028 = _1066;
    }
    float _1084 = _1034;
    float _1086 = _1020;
    float _1088 = _1016;
    float _1090 = _1024;
    float _1092 = _1028;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1096 = _1084 + _1094;
    float _1098 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1100 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1102 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1104 = fma(_1096, _1096, _1086);
    float _1106 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1098);
    float _1108 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1100);
    float _1110 = _1104 + _1088;
    float _1112 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1102);
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1116 = sqrt(_1110);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1122 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1112);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1106);
    float _1134 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1108);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    out.m_77.x = _1126;
    out.m_77.y = _1128;
    out.m_77.z = _1130;
    out.m_77.w = _1124;
    bool _1136 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1138 = isnan(_1116);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1144 = _1140 || _1142;
    out.m_79.x = _1122;
    out.m_79.y = _1132;
    out.m_79.z = _1134;
    float _1146 = _1092;
    if (!_1144)
    {
        _974 = 1.0;
    }
    float _1148 = _974;
    bool _1150 = !_1144;
    float _1152 = _1148;
    if (!_1150)
    {
        bool _1154 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1156 = isnan(_1116);
        bool _1158 = _1154 || _1156;
        bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1162 = _1158 || _1160;
        if (!_1162)
        {
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = _1116 + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1170 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1168;
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1174 = _1172 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1176 = 1.0 / _1170;
            float _1178 = _1166 * _1176;
            float _1180 = fma(_1178, _1174, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1152 = _1180;
            _1182 = true;
        }
        else
        {
            bool _1184 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1186 = isnan(_1116);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1192 = _1188 || _1190;
            if (!_1192)
            {
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1116 + _1194;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1204 = _1202 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1206 = 1.0 / _1200;
                float _1208 = _1196 * _1206;
                float _1210 = fma(_1208, _1204, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1152 = _1210;
                _1182 = true;
            }
            else
            {
                _1152 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1182 = false;
    float _1212 = _1152;
    float _1214 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1216 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1218 = floor(_1214);
    float _1220 = floor(_1216);
    float _1222 = -_1218;
    float _1224 = _1214 + _1222;
    float _1226 = -_1220;
    float _1228 = _1216 + _1226;
    float2 _4535 = float2(_1224, _1228);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4535, float2(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4535, float2(0.0), isnan(_4535)), level(0.0)).x;
    float _1232 = _952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1236 = _1090 + _1234;
    float _1238 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1232);
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1242 = _1084 + _1240;
    float _1244 = fma(_1236, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1246 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = _952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1250 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    float _1260 = fma(_1242, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1262 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1264 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1248);
    float _1266 = 1.0 / _1262;
    float _1268 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1264);
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1272 = _1236;
    int _1274 = 2;
    float _1276 = _1242;
    if (_1258)
    {
        _1272 = _1244;
    }
    float _1278 = _1272;
    float _1280 = _1270 + _1262;
    float _1282 = _1280 * _1266;
    float _1284 = _1282 * 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = 1.0 / _1288;
    float _1292 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1294 = _952 + _1292;
    float _1296 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1300 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1296);
    float _1302 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1298);
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1306 = _1290 * _1304;
    float _1308 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1300);
    float _1310 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1302);
    bool _1312 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1314 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1316 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1318 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1320 = !_1312;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = trunc(_1314);
    int _1326 = int(_1324);
    float _1328 = _1278;
    if (!_1312)
    {
        _1274 = 1;
    }
    int _1330 = _1274;
    float _1332 = trunc(_1318);
    int _1334 = int(_1332);
    int _1336 = _1330;
    if (!_1316)
    {
        _1336 = _1322;
    }
    int _1338 = _1336;
    int _1340 = _1338 << 6;
    int _1342 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1344 = _1326 + _1342;
    int _1346 = _1344 + 1;
    int _1348 = _1340 + 48;
    uint _1351 = uint(int(uint(_1348) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.vp_c15)._m0[int(_1361)][_1363];
    bool _1367 = _1346 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1369 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1371 = _1334 + _1369;
    int _1373 = _1371 + 1;
    int _1375 = _1340 + 56;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    int _1393 = _1346 | _1373;
    bool _1395 = _1393 < 0;
    bool _1397 = _1395 || _1367;
    int _1399 = _1340 + 64;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1419 = _1092 + _1417;
    float _1421 = as_type<float>(_1338);
    if (_1258)
    {
        _1146 = _1260;
    }
    float _1423 = _1146;
    bool _1425 = _1373 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1427 = _1425 || _1397;
    float _1429 = fma(_1419, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1431 = _1340 + 72;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    int _1441 = int(_1433) + 1;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    int _1445 = _1441 & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    float _1449 = _1423;
    if (_1258)
    {
        _1276 = _1429;
    }
    float _1451 = _1276;
    int _1453 = _1340 + 96;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.vp_c15)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
    int _1471 = _1340 + 104;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.vp_c15)._m0[int(_1483)][_1485];
    float _1489 = _1451;
    int _1491 = as_type<int>(_1469);
    int _1493 = as_type<int>(_1487);
    if (!_1258)
    {
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1497 = _952 + _1495;
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1501 = _912 + _1499;
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1505 = _1497 * _1497;
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1509 = _914 + _1507;
        float _1511 = fma(_1501, _1501, _1505);
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1515 = fma(_1509, _1509, _1511);
        float _1517 = sqrt(_1515);
        float _1519 = _1503 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1521 = -_914;
        float _1523 = _1521 + _1429;
        float _1525 = precise::min(_1517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1527 = _1525 * _1513;
        float _1529 = -_952;
        float _1531 = _1529 + _1260;
        float _1533 = _1519 * _1527;
        float _1535 = -_912;
        float _1537 = _1535 + _1244;
        float _1539 = fma(_1531, _1533, _952);
        float _1541 = fma(_1537, _1533, _912);
        float _1543 = fma(_1523, _1533, _914);
        _1449 = _1539;
        _1328 = _1541;
        _1489 = _1543;
        _650 = _1513;
    }
    float _1545 = _1449;
    float _1547 = _1328;
    float _1549 = _1489;
    float _1551 = _650;
    float _1553 = _1294 * _1469;
    float _1555 = _1551;
    if (!_1427)
    {
        int _1557 = _1373 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1559 = _1557 + _1346;
        _1491 = _1559;
    }
    int _1561 = _1491;
    float _1563 = _1294 * _1415;
    float _1565 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1567 = fma(_912, _1461, _1553);
    float _1569 = _1294 * _1365;
    float _1571 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1573 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1565);
    float _1575 = fma(_914, _1479, _1567);
    float _1577 = fma(_912, _1357, _1569);
    float _1579 = fma(_912, _1407, _1563);
    int _1581 = _1340 + 80;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    uint _1585 = uint(int(uint(int(_1583)) >> uint(2)));
    int _1587 = int(_1583) & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    int _1591 = int(_1583) + 1;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    int _1595 = _1591 & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    float _1599 = _1575 + _1487;
    int _1601 = as_type<int>(_1575);
    if (!_1427)
    {
        int _1603 = _1561 << 2;
        _1601 = _1603;
    }
    int _1605 = _1601;
    float _1607 = fma(_914, _1383, _1577);
    int _1609 = _1605;
    if (!_1427)
    {
        uint _1611 = uint(int(uint(_1561) >> uint(2)));
        _1493 = int(_1611);
    }
    int _1613 = _1493;
    float _1615 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1573);
    if (!_1427)
    {
        int _1617 = 12 & _1605;
        _1609 = _1617;
    }
    int _1619 = _1609;
    float _1621 = 1.0 / _1599;
    int _1623 = _1340 + 88;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    float _1641 = fma(_914, _1439, _1579);
    float _1643 = as_type<float>(_1619);
    if (!_1427)
    {
        int _1645 = _1613 << 4;
        int _1647 = _1645 + _1619;
        _1643 = as_type<float>(_1647);
    }
    float _1649 = _1643;
    float _1651 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1653 = _1607 + _1391;
    float _1655 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1657 = _1641 + _1447;
    float _1659 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1661 = _1649;
    if (!_1427)
    {
        int _1663 = as_type<int>(_1649) + 400;
        uint _1665 = uint(int(uint(_1663) >> uint(2)));
        uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
        int _1669 = int(_1665) & 3;
        float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
        _1661 = _1671;
    }
    float _1673 = _1661;
    float _1675 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1651);
    float _1677 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1679 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1659);
    float _1681 = _1244;
    if (!_1427)
    {
        float _1683 = floor(_1318);
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1675);
    float _1689 = -_1677;
    float _1691 = fma(_1689, _1571, 1.0);
    float _1693 = _1653 * _1621;
    float _1695 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1679);
    float _1699 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1701 = _1657 * _1621;
    bool _1703 = _1693 >= 0.0;
    float _1705 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1707 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1711 = _1693 <= 1.0;
    bool _1713 = _1711 && _1703;
    float _1715 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1705);
    float _1717 = log2(_1691);
    float _1719 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1709);
    bool _1721 = _1701 >= 0.0;
    bool _1723 = _1721 && _1713;
    float _1725 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1719);
    bool _1731 = _1701 <= 1.0;
    bool _1733 = _1731 && _1723;
    float _1735 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = _1685;
    float _1739 = _1621;
    if (!_1427)
    {
        float _1741 = floor(_1314);
        _1555 = _1741;
    }
    float _1743 = _1555;
    float _1745 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1729);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1749 = _1745;
    if (!_1427)
    {
        float _1751 = -_1685;
        float _1753 = _1318 + _1751;
        _1737 = _1753;
    }
    float _1755 = _1737;
    float _1757 = _1294 * _1597;
    float _1759 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1761 = 1.0 / _1745;
    float _1763 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1765 = fma(_912, _1589, _1757);
    if (_1733)
    {
        float _1767 = float(_1338);
        _1421 = _1767;
    }
    float _1769 = _1421;
    float _1771 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1759);
    float _1773 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1763);
    float _1775 = fma(_914, _1631, _1765);
    float _1777 = _1717 * 0.693147182464599609375;
    float _1779 = _1735;
    float _1781 = _1773;
    if (_1733)
    {
        float _1783 = rint(_1769);
        float _1785 = precise::max(_1783, 0.0);
        uint _1787 = uint(_1785);
        uint _1789 = clamp(_1787, 0u, 65535u);
        _1779 = as_type<float>(_1789);
    }
    float _1791 = _1779;
    float _1793 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1771);
    float _1795 = _1775 + _1639;
    float _1797 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1799 = _1795 * _1621;
    float _1801 = _1673;
    float _1803 = _1793;
    if (!_1427)
    {
        float _1805 = rint(_1673);
        float _1807 = precise::max(_1805, 0.0);
        uint _1809 = uint(_1807);
        uint _1811 = clamp(_1809, 0u, 65535u);
        _1801 = as_type<float>(_1811);
    }
    float _1813 = _1801;
    float _1815 = _1773 * _1761;
    float _1817 = _1793 * _1761;
    float _1819 = _1761;
    float _1821 = _1817;
    if (!_1427)
    {
        float _1823 = -_1743;
        float _1825 = _1314 + _1823;
        _1819 = _1825;
    }
    float _1827 = _1819;
    float _1829 = fma(_1815, 0.5, 0.5);
    float _1831 = fma(_1817, -0.5, 0.5);
    float _1833 = _1791;
    float _1835 = _1829;
    if (_1733)
    {
        float3 _5566 = float3(_1693, _1701, float(as_type<int>(_1791)));
        float3 _5570 = select(_5566, float3(0.0), isnan(_5566));
        float _1837 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5570.xy, uint(rint(_5570.z)), _1799, level(0.0));
        _1833 = _1837;
    }
    float _1839 = _1833;
    float3 _5580 = float3(_1829, _1831, _1797);
    float _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5580, float3(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5580, float3(0.0), isnan(_5580)), level(0.0)).x;
    float3 _5589 = float3(_1829, _1831, _1797);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5589, float3(0.0), isnan(_5589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5589, float3(0.0), isnan(_5589)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float _1854 = _1827;
    if (!_1427)
    {
        float3 _5612 = float3(_1827, _1755, float(as_type<int>(_1813)));
        float3 _5614 = select(_5612, float3(0.0), isnan(_5612));
        float _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5614.xy, uint(rint(_5614.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5614.xy, uint(rint(_5614.z)), level(0.0)).x;
        _1854 = _1856;
    }
    float _1858 = _1854;
    if (_1427)
    {
        _1739 = 1.0;
    }
    float _1860 = _1739;
    float _1862 = _1860;
    if (!_1427)
    {
        int _1864 = _1561 << 4;
        int _1866 = _1864 + 2048;
        uint _1868 = uint(int(uint(_1866) >> uint(2)));
        uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
        int _1872 = int(_1868) & 3;
        float _1874 = (*spvDescriptorSet0.vp_c15)._m0[int(_1870)][_1872];
        int _1876 = int(_1868) + 1;
        uint _1878 = uint(int(uint(_1876) >> uint(2)));
        int _1880 = _1876 & 3;
        float _1882 = (*spvDescriptorSet0.vp_c15)._m0[int(_1878)][_1880];
        int _1884 = _1866 + 8;
        uint _1886 = uint(int(uint(_1884) >> uint(2)));
        uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
        int _1890 = int(_1886) & 3;
        float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
        int _1894 = int(_1886) + 1;
        uint _1896 = uint(int(uint(_1894) >> uint(2)));
        int _1898 = _1894 & 3;
        float _1900 = (*spvDescriptorSet0.vp_c15)._m0[int(_1896)][_1898];
        float _1902 = _1294 * _1882;
        float _1904 = fma(_912, _1874, _1902);
        float _1906 = fma(_914, _1892, _1904);
        float _1908 = _1906 + _1900;
        float _1910 = precise::clamp(_1908, 0.0, 1.0);
        float _1912 = -_1910;
        float _1914 = _1912 + _1858;
        float _1916 = fma(_1914, 500.0, 1.5);
        float _1918 = exp2(_1916);
        float _1920 = 0.0 + _1918;
        float _1922 = precise::clamp(_1920, 0.0, 1.0);
        _1821 = _1874;
        _1862 = _1922;
    }
    float _1924 = _1821;
    float _1926 = _1862;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1930 = _1545 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1934 = _1547 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1549 + _1936;
    float _1940 = _1930 * _1930;
    float _1942 = fma(_1934, _1934, _1940);
    float _1944 = fma(_1938, _1938, _1942);
    float _1946 = rsqrt(_1944);
    float _1948 = sqrt(_1944);
    float _1950 = _1934 * _1946;
    float _1952 = _1938 * _1946;
    float _1954 = _1930 * _1946;
    float _1956 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1958 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1960 = _1956 * _1956;
    float _1962 = _1958 * _1958;
    float _1964 = _1960 + _1962;
    float _1966 = sqrt(_1964);
    bool _1968 = _1966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1972 = _1966 + _1970;
    float _1974 = _1813;
    float _1976 = _1972;
    float _1978 = _1924;
    float _1980 = _1946;
    if (_1968)
    {
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1974 = _1982;
    }
    float _1984 = _1974;
    float _1986 = _1984;
    if (_1968)
    {
        float _1988 = _1972 * _1984;
        _1976 = _1988;
    }
    float _1990 = _1976;
    if (_1968)
    {
        float _1992 = rsqrt(_1964);
        _1986 = _1992;
    }
    float _1994 = _1986;
    float _1996 = _1994;
    if (_1968)
    {
        float _1998 = _1990 * 0.15915493667125701904296875;
        _1978 = _1998;
    }
    float _2000 = _1978;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2004 = _1693;
    float _2006 = _2000;
    if (_1968)
    {
        float _2008 = _2000 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        _2004 = _2010;
    }
    float _2012 = _2004;
    float _2014 = precise::max(0.0, _2002);
    float _2016 = _1858;
    if (_1968)
    {
        float _2018 = _2000 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = -_1954;
    float _2026 = -_2014;
    float _2028 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2026);
    float _2030 = _2028;
    if (_1968)
    {
        float _2032 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1980 = _2032;
    }
    float _2034 = _1980;
    float _2036 = _2012;
    float _2038 = _2034;
    if (_1968)
    {
        float _2040 = fma(_2012, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2036 = _2040;
    }
    float _2042 = _2036;
    float _2044 = _2042;
    if (_1968)
    {
        float _2046 = _1994 * _2042;
        _1835 = _2046;
    }
    float _2048 = _1835;
    if (!_1968)
    {
        _2044 = _1956;
    }
    float _2050 = _2044;
    float _2052 = _2050;
    float _2054 = _2022;
    if (_1968)
    {
        float _2056 = _2022 + (-1.0);
        _2038 = _2056;
    }
    float _2058 = _2038;
    float _2060 = _2058;
    if (_1968)
    {
        float _2062 = _1956 * _2048;
        _2052 = _2062;
    }
    float _2064 = _2052;
    if (!_1968)
    {
        _1996 = _1960;
    }
    float _2066 = _1996;
    float _2068 = _2066;
    if (_1968)
    {
        float _2070 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2070;
    }
    float _2072 = _2006;
    if (!_1968)
    {
        _2060 = _1958;
    }
    float _2074 = _2060;
    float _2076 = _2074;
    if (_1968)
    {
        float _2078 = _1958 * _2048;
        _2076 = _2078;
    }
    float _2080 = _2076;
    if (_1968)
    {
        float _2082 = _2064 * _2064;
        _2068 = _2082;
    }
    float _2084 = _2068;
    if (_1968)
    {
        float _2086 = fma(_2028, _2022, _2072);
        _2030 = _2086;
    }
    float _2088 = _2030;
    if (!_1968)
    {
        _2054 = _1962;
    }
    float _2090 = _2054;
    float _2092 = _2090;
    if (_1968)
    {
        float _2094 = _2080 * _2080;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = fma(_2088, _2088, _2084);
    float _2100 = _2098 + _2096;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2104 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2102);
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = -_2106;
    float _2110 = _2108 + 1.0;
    float _2112 = rsqrt(_2100);
    float _2114 = _2112 * _2064;
    float _2116 = _2112 * _2088;
    float _2118 = _2112 * _2080;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2122 = abs(_2110);
    float _2124 = log2(_2122);
    float _2126 = -_2120;
    float _2128 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2126);
    float _2130 = -_2118;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2128);
    float _2134 = fma(_2132, -0.5, 0.5);
    float _2136 = fma(_2132, 0.5, 0.5);
    float _2138 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2142 = sqrt(_2134);
    float _2144 = fma(_2136, _2138, -0.212114393711090087890625);
    float _2146 = _2116 + 1.0;
    float _2148 = fma(_2136, _2144, 1.570728778839111328125);
    float _2150 = exp2(_2140);
    float _2152 = _2142 * 0.636619746685028076171875;
    float _2154 = -_2116;
    float _2156 = fma(_2150, _2146, _2154);
    float _2158 = -_2148;
    float _2160 = fma(_2152, _2158, 1.0);
    float _2162 = fma(_2156, 0.5, 0.5);
    float2 _6090 = float2(_2160, _2162);
    float3 _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6090, float2(0.0), isnan(_6090)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6090, float2(0.0), isnan(_6090)), level(0.0)).xyz;
    float _2168 = _2166.x;
    float _2170 = _2166.y;
    float _2172 = _2166.z;
    float _2174 = abs(_1306);
    float _2176 = log2(_2174);
    float _2178 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2180 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2182 = -_1230;
    float _2184 = _2182 + 1.0;
    out.m_81.x = _1547;
    out.m_81.y = _1545;
    out.m_81.z = _1549;
    float _2186 = exp2(_2178);
    bool _2188 = _1306 <= 8000.0;
    bool _2190 = isnan(_1306);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan(8000.0);
    bool _2196 = _2192 || _2194;
    float _2198 = float(_2196);
    float _2200 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2180);
    float _2202 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2200);
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2206 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2202);
    float _2208 = exp2(_2204);
    out.gl_Position.x = _1773;
    out.gl_Position.y = _1793;
    out.gl_Position.z = _2206;
    out.gl_Position.w = _1745;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2212 = precise::clamp(_2210, 0.0, 1.0);
    float _2214 = fma(_2212, -2.0, 3.0);
    float _2216 = _2212 * _2212;
    float _2218 = _2216 * _2214;
    float _2220 = -_2218;
    float _2222 = _2220 + 1.0;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2218);
    float _2226 = _2198 * _2224;
    float _2228 = _2198;
    float _2230 = _2206;
    if (!_1733)
    {
        _2228 = 1.0;
    }
    float _2232 = _2228;
    float _2234 = _2232;
    if (_1733)
    {
        bool _2236 = _1839 >= _1799;
        bool _2238 = isnan(_1839);
        bool _2240 = _2236 || _2238;
        bool _2242 = isnan(_1799);
        bool _2244 = _2240 || _2242;
        float _2246 = float(_2244);
        _2234 = _2246;
    }
    float _2248 = _2234;
    float _2250 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2252 = -_2186;
    float _2254 = _2252 + 1.0;
    bool _2256 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2258 = isnan(_1948);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2264 = _2260 || _2262;
    float _2266 = _2184 * _2250;
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    float _2270 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2272 = _2248 * _1926;
    float _2274 = -_2268;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2278 = _2270 * _1841;
    float _2280 = -_2272;
    float _2282 = fma(_2280, _2276, 1.0);
    float _2284 = precise::clamp(_2282, 0.0, 1.0);
    float _2286 = _1852 * _2278;
    float _2288 = -_2270;
    float _2290 = _2288 + 1.0;
    float _2292 = _2290;
    float _2294 = _2284;
    if (!_2264)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2296 = _1749;
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2300 = _2296;
    float _2302 = _2296;
    if (!_2264)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2304 = _1803;
    float _2306 = _1852 * _2290;
    float _2308 = _2304;
    float _2310 = _2304;
    if (!_2264)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2312 = _2230;
    out.m_83.x = _2298;
    float _2314 = _2312;
    float _2316 = _2312;
    if (!_2264)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2318 = _1781;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2264)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2324 = _2292;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2264)
    {
        _2294 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2330 = _2294;
    float _2332 = _2172 * _2278;
    float _2334 = fma(_2168, _2286, _1846);
    float _2336 = fma(_2170, _2286, _1848);
    float _2338 = fma(_1852, _2332, _1850);
    out.m_85.x = _2334;
    out.m_85.y = _2336;
    out.m_85.z = _2338;
    out.m_85.w = _2306;
    bool _2340 = !_2264;
    float _2342 = _2330;
    float _2344 = _2330;
    if (!_2340)
    {
        bool _2346 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2348 = isnan(_1948);
        bool _2350 = _2346 || _2348;
        bool _2352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2354 = _2350 || _2352;
        if (!_2354)
        {
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2358 = _1948 + _2356;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2362 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2360;
            float _2364 = 1.0 / _2362;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2382 = _2358 * _2364;
            float _2384 = precise::clamp(_2382, 0.0, 1.0);
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2396 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2398 = fma(_2384, _2392, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2400 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2402 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2404 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2310 = _2398;
            _2328 = _2402;
            _2302 = _2396;
            _2322 = _2400;
            _2316 = _2394;
            _2344 = _2404;
            _2406 = true;
        }
        else
        {
            bool _2408 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2410 = isnan(_1948);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2416 = _2412 || _2414;
            if (!_2416)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2418 = _2300;
            _2302 = _2418;
            if (!_2416)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2420 = _2308;
            _2310 = _2420;
            if (!_2416)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2422 = _2314;
            _2316 = _2422;
            if (!_2416)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2424 = _2320;
            _2322 = _2424;
            if (!_2416)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2426 = _2326;
            _2328 = _2426;
            if (!_2416)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2428 = _2342;
            bool _2430 = !_2416;
            _2344 = _2428;
            if (!_2430)
            {
                bool _2432 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2434 = isnan(_1948);
                bool _2436 = _2432 || _2434;
                bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2440 = _2436 || _2438;
                if (!_2440)
                {
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2444 = _1948 + _2442;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2448 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2446;
                    float _2450 = 1.0 / _2448;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2468 = _2444 * _2450;
                    float _2470 = precise::clamp(_2468, 0.0, 1.0);
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2482 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2484 = fma(_2470, _2478, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2486 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2488 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2490 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2310 = _2484;
                    _2328 = _2488;
                    _2302 = _2482;
                    _2322 = _2486;
                    _2316 = _2480;
                    _2344 = _2490;
                    _2406 = true;
                }
                else
                {
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2406 = false;
    float _2492 = _2310;
    float _2494 = _2328;
    float _2496 = _2302;
    float _2498 = _2322;
    float _2500 = _2316;
    float _2502 = _2344;
    float _2504 = fma(_1132, -0.5, 0.5);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = -_2492;
    float _2510 = _2508 + _2494;
    float _2512 = -_2496;
    float _2514 = _2512 + _2498;
    float _2516 = -_2500;
    float _2518 = _2516 + _2502;
    bool _2520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2522 = fma(_2506, _2510, _2492);
    float _2524 = fma(_2506, _2514, _2496);
    float _2526 = fma(_2506, _2518, _2500);
    float _2528 = _2522 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2530 = fma(_2524, 0.298911988735198974609375, _2528);
    float _2532 = fma(_2526, 0.114477999508380889892578125, _2530);
    out.m_87.x = 0.0;
    float _2534 = -_2532;
    float _2536 = _2524 + _2534;
    float _2538 = -_2532;
    float _2540 = _2522 + _2538;
    float _2542 = -_2532;
    float _2544 = _2526 + _2542;
    float _2546 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2548 = fma(_2536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    float _2550 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    out.m_89.x = 0.0;
    out.m_83.w = _2546;
    out.m_91.x = _2548;
    out.m_91.y = _2550;
    out.m_91.z = _2552;
    if (!_2520)
    {
        return out;
    }
    float _2554 = -_1545;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2558 = -_1547;
    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2562 = -_1549;
    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = sqrt(_2570);
    float _2576 = _2556 * _2572;
    float _2578 = _2560 * _2572;
    float _2580 = _2564 * _2572;
    float _2582 = -_1954;
    float _2584 = _2582 + _2576;
    float _2586 = -_1950;
    float _2588 = _2586 + _2578;
    float _2590 = -_1952;
    float _2592 = _2590 + _2580;
    float _2594 = _2584 * _2584;
    float _2596 = -_2574;
    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2600 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = fma(_2588, _2588, _2594);
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2608 = precise::clamp(_2606, 0.0, 1.0);
    float _2610 = _2602 * _2602;
    float _2612 = fma(_2592, _2592, _2604);
    float _2614 = _2610 + (-1.0);
    float _2616 = abs(_2608);
    float _2618 = log2(_2616);
    float _2620 = rsqrt(_2612);
    float _2622 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2624 = exp2(_2622);
    float _2626 = _2584 * _2620;
    float _2628 = _2588 * _2620;
    float _2630 = _2592 * _2620;
    float _2632 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2634 = _1132 * _2626;
    float _2636 = _1132 * _2576;
    float _2638 = fma(_1122, _2628, _2634);
    float _2640 = fma(_1122, _2578, _2636);
    float _2642 = fma(_1134, _2630, _2638);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = fma(_1134, _2580, _2640);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = _2644 * _2644;
    float _2652 = fma(_2650, _2614, 1.0);
    float _2654 = -_2576;
    float _2656 = -_2632;
    float _2658 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2656);
    float _2660 = _2652 * _2652;
    float _2662 = -_2580;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2658);
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2668 = _2664 + _2666;
    float _2670 = 1.0 / _2660;
    float _2672 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2674 = precise::clamp(_2672, 0.0, 1.0);
    float _2676 = _2624 * _2674;
    float _2678 = _2648 * _2676;
    float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2682 = _2610 * _2670;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2686 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2688 = _2678 * _2682;
    out.m_87.x = _2680;
    out.m_87.y = _2684;
    out.m_87.z = _2686;
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2692 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2690;
    out.m_89.y = _2692;
    out.m_89.z = _2694;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2406 = false;
    bool _1182 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_58.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_61.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_124);
        out.gl_Position.z = _2750;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_63.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_110);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _126 = as_type<int>(_162);
    }
    int _164 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_164);
        out.gl_Position.z = _2820;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_65.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _142 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_65.x;
    float _200 = in.m_65.y;
    float _202 = in.m_65.z;
    float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _206 = log2(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _210 = _196 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = _196 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _232;
    float _236 = 1.0 / _222;
    float _238 = _206 * _142;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _196 + _240;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _246 = _244 != 0;
    int _248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _250 = _248 != 0;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _254 = _252 != 0;
    float _256 = 1.0 / _218;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _196 + _258;
    bool _262 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _264 = isnan(0.0);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _270 = _266 || _268;
    float _272 = _200 + _202;
    float _274 = _202 + _198;
    float _276 = _202 + (-0.5);
    float _278 = _202 * 2.0;
    float _280 = exp2(_238);
    float _282 = _242 * _236;
    float _284 = _272 + (-1.0);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _288 = 1.0 + _286;
    bool _290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _292 = isnan(1.0);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _298 = _294 || _296;
    float _300 = 1.0 / _230;
    float _302 = _260 * _256;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _196 + _304;
    float _308 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _310 = !_246;
    int _312 = _310 ? 0 : 1;
    float _314 = 1.0 / _234;
    float _316 = _200 + (-0.5);
    float _318 = -_280;
    float _320 = _318 + 1.0;
    bool _322 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_196);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _270 ? _320 : 0.0;
    float _336 = floor(_278);
    float _338 = _200 + _198;
    float _340 = _200 * 2.0;
    float _342 = _210 * _300;
    float _344 = _338 + (-1.0);
    float _346 = 1.0 / _226;
    float _348 = _214 * _314;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = 1.0 / _288;
    float _364 = _198 + (-0.5);
    float _366 = _198 * 2.0;
    bool _368 = _336 > 0.0;
    float _370 = fma(_352, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _372 = _336 >= 0.0;
    bool _374 = isnan(_336);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = fma(_360, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = floor(_366);
    float _386 = _306 * _346;
    float _388 = _274 + (-1.0);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _404 = floor(_340);
    float _406 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _408 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _410 = isnan(_196);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    if (_298)
    {
        float _420 = _334 * _362;
        _146 = _420;
    }
    float _422 = _146;
    float _424 = fma(_392, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = fma(_356, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _428 = -_418;
    float _430 = _428 + 1.0;
    bool _432 = _384 > 0.0;
    float _434 = fma(_396, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _436 = _384 >= 0.0;
    bool _438 = isnan(_384);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = fma(_400, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _448 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _450 = isnan(_196);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _468 = _380 ? 0 : 1;
    float _470 = _458 * _430;
    bool _472 = _404 > 0.0;
    float _474 = -_458;
    float _476 = _474 + 1.0;
    bool _478 = _404 >= 0.0;
    bool _480 = isnan(_404);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _488;
    bool _492 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_196);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _504;
    bool _508 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_196);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_490, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_462, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = fma(_506, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = _502 * _476;
    bool _536 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_196);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -_502;
    float _550 = _548 + 1.0;
    float _552 = -_518;
    float _554 = _552 + 1.0;
    float _556 = fma(_528, _342, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _558 = fma(_466, _342, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _560 = fma(_532, _342, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _562 = _518 * _550;
    float _564 = _546 * _554;
    float _566 = -_546;
    float _568 = _566 + 1.0;
    float _570 = in.m_67.x;
    float _572 = in.m_67.y;
    float _574 = in.m_67.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _584;
    int _588 = abs(_312);
    float _590 = fma(_578, _348, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _592 = fma(_582, _348, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _594 = ~_468;
    int _596 = _594 + 1;
    int _598 = _596 + 1;
    float _600 = fma(_586, _348, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _602 = _332 * _568;
    int _604 = _598;
    if (!_368)
    {
        int _606 = ~_468;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = -_332;
    float _614 = _612 + 1.0;
    float _616 = float(_588);
    float _618 = _370 * _602;
    float _620 = float(_610);
    float _622 = _382 * _602;
    float _624 = _424 * _602;
    int _626 = _444 ? 0 : 1;
    float _628 = _616 * _620;
    bool _630 = !_250;
    int _632 = _630 ? 0 : 1;
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    int _636 = ~_626;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = _628 * (-2.0);
    int _644 = abs(_632);
    float _646 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _622);
    int _648 = _640;
    float _650 = _622;
    if (!_432)
    {
        int _652 = ~_626;
        int _654 = _652 + 1;
        _648 = _654;
    }
    int _656 = _648;
    float _658 = fma(_642, _570, _570);
    bool _660 = !_254;
    int _662 = _660 ? 0 : 1;
    float _664 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _624);
    float _666 = float(_644);
    float _668 = fma(_406, _642, _406);
    float _670 = float(_656);
    float _672 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[196].x, _658);
    int _674 = _486 ? 0 : 1;
    float _676 = fma(_426, _564, _634);
    int _678 = abs(_662);
    float _680 = _666 * _670;
    int _682 = ~_674;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = fma(_668, _422, _672);
    int _690 = _686;
    if (!_472)
    {
        int _692 = ~_674;
        int _694 = _692 + 1;
        _690 = _694;
    }
    int _696 = _690;
    float _698 = _680 * (-2.0);
    float _700 = _688 * 0.15915493667125701904296875;
    float _702 = float(_696);
    float _704 = fma(_434, _564, _646);
    float _706 = float(_678);
    float _708 = fma(_698, _572, _572);
    float _710 = fma(_308, _698, _308);
    float _712 = fma(_446, _564, _664);
    float _714 = fma(_520, _562, _676);
    float _716 = _706 * _702;
    float _718 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[196].y, _708);
    float _720 = in.m_69.x;
    float _722 = in.m_69.y;
    float _724 = in.m_69.z;
    float _726 = fma(_522, _562, _704);
    float _728 = _716 * (-2.0);
    float _730 = fma(_710, _422, _718);
    float _732 = fma(_524, _562, _712);
    float _734 = fma(_558, _534, _726);
    float _736 = fma(_728, _574, _574);
    float _738 = _730 * 0.15915493667125701904296875;
    float _740 = fma(_402, _728, _402);
    float _742 = in.m_71.x;
    float _744 = in.m_71.y;
    float _746 = in.m_71.z;
    float _748 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _750 = fma(_556, _534, _714);
    float _752 = fma(_560, _534, _732);
    float _754 = fma(_592, _470, _734);
    float _756 = fma(_740, _422, _748);
    float _758 = fma(_590, _470, _750);
    float _760 = fma(_600, _470, _752);
    float _762 = _700 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _756 * 0.15915493667125701904296875;
    float _768 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].x, _758);
    float _770 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].y, _754);
    float _772 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[148].z, _760);
    float _774 = in.m_58.x;
    float _776 = in.m_58.y;
    float _778 = in.m_58.z;
    float _780 = _768 * _720;
    float _782 = _700 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _770 * _722;
    float _788 = _772 * _724;
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _792 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _796 = _738 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _742);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _746);
    bool _806 = _744 != 0.0;
    bool _808 = isnan(_744);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _790 * _800;
    float _818 = _792 * _802;
    float _820 = _794 * _804;
    float _822 = _766 * 6.283185482025146484375;
    float _824 = cos(_822);
    bool _826 = _742 == 0.0;
    bool _828 = !_814;
    bool _830 = _826 && _828;
    bool _832 = _746 == 0.0;
    bool _834 = _832 && _830;
    float _836 = _738 * 6.283185482025146484375;
    float _838 = sin(_836);
    float _840 = _764 * _798;
    float _842 = _784 * _798;
    float _844 = _766 * 6.283185482025146484375;
    float _846 = sin(_844);
    float _848 = _764 * _838;
    float _850 = _798 * _824;
    float _852 = _784 * _838;
    float _854 = _784 * _824;
    float _856 = _838 * _824;
    float _858 = _764 * _824;
    float _860 = _776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _862 = _854 * _818;
    float _864 = fma(_846, _842, _848);
    float _866 = -_852;
    float _868 = fma(_846, _840, _866);
    float _870 = fma(_846, _848, _842);
    float _872 = -_840;
    float _874 = fma(_846, _852, _872);
    float _876 = -_818;
    float _878 = _846 * _876;
    float _880 = fma(_864, _816, _862);
    float _882 = _858 * _818;
    float _884 = _776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = fma(_850, _816, _878);
    float _888 = fma(_874, _820, _880);
    float _890 = fma(_868, _816, _882);
    float _892 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _894 = fma(_856, _820, _886);
    float _896 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[6].x, _860);
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _902 = fma(_870, _820, _890);
    float _904 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[4].z, _892);
    float _906 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].x, _900);
    float _912 = _904 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = _906 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _916 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[8].z, _908);
    float _918 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[10].z, _910);
    float _920 = _776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _922 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _924 = _912 + _916;
    float _926 = _914 + _918;
    float _928 = fma(_774, (*spvDescriptorSet0.vp_c10)._m0[5].x, _920);
    float _930 = in.m_73.x;
    float _932 = in.m_73.y;
    float _934 = in.m_73.z;
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _924 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _926 + _940;
    float _944 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[5].z, _928);
    float _946 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].x, _922);
    float _948 = _938 * _938;
    float _950 = _942 * _942;
    float _952 = _944 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _954 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[9].z, _946);
    float _956 = _948 + _950;
    float _958 = sqrt(_956);
    float _960 = _932;
    float _962 = _930;
    float _964 = _934;
    float _966 = _856;
    float _968 = _774;
    float _970 = _944;
    float _972 = _778;
    float _974 = _926;
    if (!_834)
    {
        float _976 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _932);
        _960 = _976;
    }
    float _978 = _960;
    if (!_834)
    {
        float _980 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _930);
        _962 = _980;
    }
    float _982 = _962;
    if (!_834)
    {
        float _984 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[17].y, _934);
        _964 = _984;
    }
    float _986 = _964;
    float _988 = -_978;
    float _990 = _846 * _988;
    float _992 = _854 * _978;
    bool _994 = _958 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _996 = _858 * _978;
    float _998 = fma(_850, _982, _990);
    float _1000 = fma(_864, _982, _992);
    float _1002 = fma(_868, _982, _996);
    float _1004 = _952 + _954;
    float _1006 = fma(_856, _986, _998);
    float _1008 = fma(_874, _986, _1000);
    float _1010 = fma(_870, _986, _1002);
    float _1012 = _998;
    if (!_994)
    {
        _1012 = _950;
    }
    float _1014 = _1012;
    float _1016 = _1014;
    if (!_994)
    {
        _966 = _948;
    }
    float _1018 = _966;
    float _1020 = _1018;
    if (!_994)
    {
        _968 = _924;
    }
    float _1022 = _968;
    float _1024 = _1022;
    if (!_994)
    {
        _970 = _926;
    }
    float _1026 = _970;
    float _1028 = _1026;
    if (!_994)
    {
        _972 = _1004;
    }
    float _1030 = _972;
    bool _1032 = !_994;
    float _1034 = _1030;
    if (!_1032)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1040 = _958 + _1038;
        float _1042 = rsqrt(_956);
        float _1044 = _1040 * _1036;
        float _1046 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1044 * 0.15915493667125701904296875;
        float _1050 = _1048 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = cos(_1054);
        float _1058 = fma(_1052, _1046, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1060 = _1042 * _1058;
        float _1062 = _1056 + (-1.0);
        float _1064 = fma(_938, _1060, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1066 = fma(_942, _1060, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1068 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1072 = _1064 + _1070;
        float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1076 = _1066 + _1074;
        float _1078 = fma(_1004, _1056, _1068);
        float _1080 = _1072 * _1072;
        float _1082 = _1076 * _1076;
        _1034 = _1078;
        _1020 = _1080;
        _1016 = _1082;
        _1024 = _1064;
        _1028 = _1066;
    }
    float _1084 = _1034;
    float _1086 = _1020;
    float _1088 = _1016;
    float _1090 = _1024;
    float _1092 = _1028;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1096 = _1084 + _1094;
    float _1098 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1100 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1102 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1104 = fma(_1096, _1096, _1086);
    float _1106 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1098);
    float _1108 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1100);
    float _1110 = _1104 + _1088;
    float _1112 = fma(_1006, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1102);
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1116 = sqrt(_1110);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1122 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1112);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1132 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1106);
    float _1134 = fma(_1010, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1108);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    out.m_77.x = _1126;
    out.m_77.y = _1128;
    out.m_77.z = _1130;
    out.m_77.w = _1124;
    bool _1136 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1138 = isnan(_1116);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1144 = _1140 || _1142;
    out.m_79.x = _1122;
    out.m_79.y = _1132;
    out.m_79.z = _1134;
    float _1146 = _1092;
    if (!_1144)
    {
        _974 = 1.0;
    }
    float _1148 = _974;
    bool _1150 = !_1144;
    float _1152 = _1148;
    if (!_1150)
    {
        bool _1154 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1156 = isnan(_1116);
        bool _1158 = _1154 || _1156;
        bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1162 = _1158 || _1160;
        if (!_1162)
        {
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = _1116 + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1170 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1168;
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1174 = _1172 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1176 = 1.0 / _1170;
            float _1178 = _1166 * _1176;
            float _1180 = fma(_1178, _1174, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1152 = _1180;
            _1182 = true;
        }
        else
        {
            bool _1184 = _1116 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1186 = isnan(_1116);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1192 = _1188 || _1190;
            if (!_1192)
            {
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1116 + _1194;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1204 = _1202 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1206 = 1.0 / _1200;
                float _1208 = _1196 * _1206;
                float _1210 = fma(_1208, _1204, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1152 = _1210;
                _1182 = true;
            }
            else
            {
                _1152 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1182 = false;
    float _1212 = _1152;
    float _1214 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1216 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1218 = floor(_1214);
    float _1220 = floor(_1216);
    float _1222 = -_1218;
    float _1224 = _1214 + _1222;
    float _1226 = -_1220;
    float _1228 = _1216 + _1226;
    float2 _4535 = float2(_1224, _1228);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4535, float2(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4535, float2(0.0), isnan(_4535)), level(0.0)).x;
    float _1232 = _952 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1236 = _1090 + _1234;
    float _1238 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1232);
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1242 = _1084 + _1240;
    float _1244 = fma(_1236, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1246 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1238);
    float _1248 = _952 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1250 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    float _1260 = fma(_1242, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1262 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1264 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1248);
    float _1266 = 1.0 / _1262;
    float _1268 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1264);
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1272 = _1236;
    int _1274 = 2;
    float _1276 = _1242;
    if (_1258)
    {
        _1272 = _1244;
    }
    float _1278 = _1272;
    float _1280 = _1270 + _1262;
    float _1282 = _1280 * _1266;
    float _1284 = _1282 * 0.5;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1288 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
    float _1290 = 1.0 / _1288;
    float _1292 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1294 = _952 + _1292;
    float _1296 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1298 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1300 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1296);
    float _1302 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1298);
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1306 = _1290 * _1304;
    float _1308 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1300);
    float _1310 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1302);
    bool _1312 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1314 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1316 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1318 = _1310 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1320 = !_1312;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = trunc(_1314);
    int _1326 = int(_1324);
    float _1328 = _1278;
    if (!_1312)
    {
        _1274 = 1;
    }
    int _1330 = _1274;
    float _1332 = trunc(_1318);
    int _1334 = int(_1332);
    int _1336 = _1330;
    if (!_1316)
    {
        _1336 = _1322;
    }
    int _1338 = _1336;
    int _1340 = _1338 << 6;
    int _1342 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1344 = _1326 + _1342;
    int _1346 = _1344 + 1;
    int _1348 = _1340 + 48;
    uint _1351 = uint(int(uint(_1348) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.vp_c15)._m0[int(_1361)][_1363];
    bool _1367 = _1346 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1369 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1371 = _1334 + _1369;
    int _1373 = _1371 + 1;
    int _1375 = _1340 + 56;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
    int _1381 = int(_1377) & 3;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
    int _1385 = int(_1377) + 1;
    uint _1387 = uint(int(uint(_1385) >> uint(2)));
    int _1389 = _1385 & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    int _1393 = _1346 | _1373;
    bool _1395 = _1393 < 0;
    bool _1397 = _1395 || _1367;
    int _1399 = _1340 + 64;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c15)._m0[int(_1411)][_1413];
    float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1419 = _1092 + _1417;
    float _1421 = as_type<float>(_1338);
    if (_1258)
    {
        _1146 = _1260;
    }
    float _1423 = _1146;
    bool _1425 = _1373 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1427 = _1425 || _1397;
    float _1429 = fma(_1419, _1212, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1431 = _1340 + 72;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    int _1441 = int(_1433) + 1;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    int _1445 = _1441 & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    float _1449 = _1423;
    if (_1258)
    {
        _1276 = _1429;
    }
    float _1451 = _1276;
    int _1453 = _1340 + 96;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.vp_c15)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
    int _1471 = _1340 + 104;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.vp_c15)._m0[int(_1483)][_1485];
    float _1489 = _1451;
    int _1491 = as_type<int>(_1469);
    int _1493 = as_type<int>(_1487);
    if (!_1258)
    {
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1497 = _952 + _1495;
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1501 = _912 + _1499;
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1505 = _1497 * _1497;
        float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1509 = _914 + _1507;
        float _1511 = fma(_1501, _1501, _1505);
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1515 = fma(_1509, _1509, _1511);
        float _1517 = sqrt(_1515);
        float _1519 = _1503 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1521 = -_914;
        float _1523 = _1521 + _1429;
        float _1525 = precise::min(_1517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1527 = _1525 * _1513;
        float _1529 = -_952;
        float _1531 = _1529 + _1260;
        float _1533 = _1519 * _1527;
        float _1535 = -_912;
        float _1537 = _1535 + _1244;
        float _1539 = fma(_1531, _1533, _952);
        float _1541 = fma(_1537, _1533, _912);
        float _1543 = fma(_1523, _1533, _914);
        _1449 = _1539;
        _1328 = _1541;
        _1489 = _1543;
        _650 = _1513;
    }
    float _1545 = _1449;
    float _1547 = _1328;
    float _1549 = _1489;
    float _1551 = _650;
    float _1553 = _1294 * _1469;
    float _1555 = _1551;
    if (!_1427)
    {
        int _1557 = _1373 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1559 = _1557 + _1346;
        _1491 = _1559;
    }
    int _1561 = _1491;
    float _1563 = _1294 * _1415;
    float _1565 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1567 = fma(_912, _1461, _1553);
    float _1569 = _1294 * _1365;
    float _1571 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1573 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1565);
    float _1575 = fma(_914, _1479, _1567);
    float _1577 = fma(_912, _1357, _1569);
    float _1579 = fma(_912, _1407, _1563);
    int _1581 = _1340 + 80;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    uint _1585 = uint(int(uint(int(_1583)) >> uint(2)));
    int _1587 = int(_1583) & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    int _1591 = int(_1583) + 1;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    int _1595 = _1591 & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    float _1599 = _1575 + _1487;
    int _1601 = as_type<int>(_1575);
    if (!_1427)
    {
        int _1603 = _1561 << 2;
        _1601 = _1603;
    }
    int _1605 = _1601;
    float _1607 = fma(_914, _1383, _1577);
    int _1609 = _1605;
    if (!_1427)
    {
        uint _1611 = uint(int(uint(_1561) >> uint(2)));
        _1493 = int(_1611);
    }
    int _1613 = _1493;
    float _1615 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1573);
    if (!_1427)
    {
        int _1617 = 12 & _1605;
        _1609 = _1617;
    }
    int _1619 = _1609;
    float _1621 = 1.0 / _1599;
    int _1623 = _1340 + 88;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    uint _1627 = uint(int(uint(int(_1625)) >> uint(2)));
    int _1629 = int(_1625) & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    int _1633 = int(_1625) + 1;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    int _1637 = _1633 & 3;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
    float _1641 = fma(_914, _1439, _1579);
    float _1643 = as_type<float>(_1619);
    if (!_1427)
    {
        int _1645 = _1613 << 4;
        int _1647 = _1645 + _1619;
        _1643 = as_type<float>(_1647);
    }
    float _1649 = _1643;
    float _1651 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1653 = _1607 + _1391;
    float _1655 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1657 = _1641 + _1447;
    float _1659 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1661 = _1649;
    if (!_1427)
    {
        int _1663 = as_type<int>(_1649) + 400;
        uint _1665 = uint(int(uint(_1663) >> uint(2)));
        uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
        int _1669 = int(_1665) & 3;
        float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
        _1661 = _1671;
    }
    float _1673 = _1661;
    float _1675 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1651);
    float _1677 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1679 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1659);
    float _1681 = _1244;
    if (!_1427)
    {
        float _1683 = floor(_1318);
        _1681 = _1683;
    }
    float _1685 = _1681;
    float _1687 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1675);
    float _1689 = -_1677;
    float _1691 = fma(_1689, _1571, 1.0);
    float _1693 = _1653 * _1621;
    float _1695 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1679);
    float _1699 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1701 = _1657 * _1621;
    bool _1703 = _1693 >= 0.0;
    float _1705 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1707 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1709 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1711 = _1693 <= 1.0;
    bool _1713 = _1711 && _1703;
    float _1715 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1705);
    float _1717 = log2(_1691);
    float _1719 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1709);
    bool _1721 = _1701 >= 0.0;
    bool _1723 = _1721 && _1713;
    float _1725 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1729 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1719);
    bool _1731 = _1701 <= 1.0;
    bool _1733 = _1731 && _1723;
    float _1735 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = _1685;
    float _1739 = _1621;
    if (!_1427)
    {
        float _1741 = floor(_1314);
        _1555 = _1741;
    }
    float _1743 = _1555;
    float _1745 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1729);
    float _1747 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1727);
    float _1749 = _1745;
    if (!_1427)
    {
        float _1751 = -_1685;
        float _1753 = _1318 + _1751;
        _1737 = _1753;
    }
    float _1755 = _1737;
    float _1757 = _1294 * _1597;
    float _1759 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1761 = 1.0 / _1745;
    float _1763 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1747);
    float _1765 = fma(_912, _1589, _1757);
    if (_1733)
    {
        float _1767 = float(_1338);
        _1421 = _1767;
    }
    float _1769 = _1421;
    float _1771 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1759);
    float _1773 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1763);
    float _1775 = fma(_914, _1631, _1765);
    float _1777 = _1717 * 0.693147182464599609375;
    float _1779 = _1735;
    float _1781 = _1773;
    if (_1733)
    {
        float _1783 = rint(_1769);
        float _1785 = precise::max(_1783, 0.0);
        uint _1787 = uint(_1785);
        uint _1789 = clamp(_1787, 0u, 65535u);
        _1779 = as_type<float>(_1789);
    }
    float _1791 = _1779;
    float _1793 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1771);
    float _1795 = _1775 + _1639;
    float _1797 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1799 = _1795 * _1621;
    float _1801 = _1673;
    float _1803 = _1793;
    if (!_1427)
    {
        float _1805 = rint(_1673);
        float _1807 = precise::max(_1805, 0.0);
        uint _1809 = uint(_1807);
        uint _1811 = clamp(_1809, 0u, 65535u);
        _1801 = as_type<float>(_1811);
    }
    float _1813 = _1801;
    float _1815 = _1773 * _1761;
    float _1817 = _1793 * _1761;
    float _1819 = _1761;
    float _1821 = _1817;
    if (!_1427)
    {
        float _1823 = -_1743;
        float _1825 = _1314 + _1823;
        _1819 = _1825;
    }
    float _1827 = _1819;
    float _1829 = fma(_1815, 0.5, 0.5);
    float _1831 = fma(_1817, -0.5, 0.5);
    float _1833 = _1791;
    float _1835 = _1829;
    if (_1733)
    {
        float3 _5566 = float3(_1693, _1701, float(as_type<int>(_1791)));
        float3 _5570 = select(_5566, float3(0.0), isnan(_5566));
        float _1837 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5570.xy, uint(rint(_5570.z)), _1799, level(0.0));
        _1833 = _1837;
    }
    float _1839 = _1833;
    float3 _5580 = float3(_1829, _1831, _1797);
    float _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5580, float3(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5580, float3(0.0), isnan(_5580)), level(0.0)).x;
    float3 _5589 = float3(_1829, _1831, _1797);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5589, float3(0.0), isnan(_5589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5589, float3(0.0), isnan(_5589)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float _1854 = _1827;
    if (!_1427)
    {
        float3 _5612 = float3(_1827, _1755, float(as_type<int>(_1813)));
        float3 _5614 = select(_5612, float3(0.0), isnan(_5612));
        float _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5614.xy, uint(rint(_5614.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5614.xy, uint(rint(_5614.z)), level(0.0)).x;
        _1854 = _1856;
    }
    float _1858 = _1854;
    if (_1427)
    {
        _1739 = 1.0;
    }
    float _1860 = _1739;
    float _1862 = _1860;
    if (!_1427)
    {
        int _1864 = _1561 << 4;
        int _1866 = _1864 + 2048;
        uint _1868 = uint(int(uint(_1866) >> uint(2)));
        uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
        int _1872 = int(_1868) & 3;
        float _1874 = (*spvDescriptorSet0.vp_c15)._m0[int(_1870)][_1872];
        int _1876 = int(_1868) + 1;
        uint _1878 = uint(int(uint(_1876) >> uint(2)));
        int _1880 = _1876 & 3;
        float _1882 = (*spvDescriptorSet0.vp_c15)._m0[int(_1878)][_1880];
        int _1884 = _1866 + 8;
        uint _1886 = uint(int(uint(_1884) >> uint(2)));
        uint _1888 = uint(int(uint(int(_1886)) >> uint(2)));
        int _1890 = int(_1886) & 3;
        float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
        int _1894 = int(_1886) + 1;
        uint _1896 = uint(int(uint(_1894) >> uint(2)));
        int _1898 = _1894 & 3;
        float _1900 = (*spvDescriptorSet0.vp_c15)._m0[int(_1896)][_1898];
        float _1902 = _1294 * _1882;
        float _1904 = fma(_912, _1874, _1902);
        float _1906 = fma(_914, _1892, _1904);
        float _1908 = _1906 + _1900;
        float _1910 = precise::clamp(_1908, 0.0, 1.0);
        float _1912 = -_1910;
        float _1914 = _1912 + _1858;
        float _1916 = fma(_1914, 500.0, 1.5);
        float _1918 = exp2(_1916);
        float _1920 = 0.0 + _1918;
        float _1922 = precise::clamp(_1920, 0.0, 1.0);
        _1821 = _1874;
        _1862 = _1922;
    }
    float _1924 = _1821;
    float _1926 = _1862;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1930 = _1545 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1934 = _1547 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1549 + _1936;
    float _1940 = _1930 * _1930;
    float _1942 = fma(_1934, _1934, _1940);
    float _1944 = fma(_1938, _1938, _1942);
    float _1946 = rsqrt(_1944);
    float _1948 = sqrt(_1944);
    float _1950 = _1934 * _1946;
    float _1952 = _1938 * _1946;
    float _1954 = _1930 * _1946;
    float _1956 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1958 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1960 = _1956 * _1956;
    float _1962 = _1958 * _1958;
    float _1964 = _1960 + _1962;
    float _1966 = sqrt(_1964);
    bool _1968 = _1966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1972 = _1966 + _1970;
    float _1974 = _1813;
    float _1976 = _1972;
    float _1978 = _1924;
    float _1980 = _1946;
    if (_1968)
    {
        float _1982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1974 = _1982;
    }
    float _1984 = _1974;
    float _1986 = _1984;
    if (_1968)
    {
        float _1988 = _1972 * _1984;
        _1976 = _1988;
    }
    float _1990 = _1976;
    if (_1968)
    {
        float _1992 = rsqrt(_1964);
        _1986 = _1992;
    }
    float _1994 = _1986;
    float _1996 = _1994;
    if (_1968)
    {
        float _1998 = _1990 * 0.15915493667125701904296875;
        _1978 = _1998;
    }
    float _2000 = _1978;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2004 = _1693;
    float _2006 = _2000;
    if (_1968)
    {
        float _2008 = _2000 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        _2004 = _2010;
    }
    float _2012 = _2004;
    float _2014 = precise::max(0.0, _2002);
    float _2016 = _1858;
    if (_1968)
    {
        float _2018 = _2000 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = -_1954;
    float _2026 = -_2014;
    float _2028 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[24].y, _2026);
    float _2030 = _2028;
    if (_1968)
    {
        float _2032 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1980 = _2032;
    }
    float _2034 = _1980;
    float _2036 = _2012;
    float _2038 = _2034;
    if (_1968)
    {
        float _2040 = fma(_2012, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2036 = _2040;
    }
    float _2042 = _2036;
    float _2044 = _2042;
    if (_1968)
    {
        float _2046 = _1994 * _2042;
        _1835 = _2046;
    }
    float _2048 = _1835;
    if (!_1968)
    {
        _2044 = _1956;
    }
    float _2050 = _2044;
    float _2052 = _2050;
    float _2054 = _2022;
    if (_1968)
    {
        float _2056 = _2022 + (-1.0);
        _2038 = _2056;
    }
    float _2058 = _2038;
    float _2060 = _2058;
    if (_1968)
    {
        float _2062 = _1956 * _2048;
        _2052 = _2062;
    }
    float _2064 = _2052;
    if (!_1968)
    {
        _1996 = _1960;
    }
    float _2066 = _1996;
    float _2068 = _2066;
    if (_1968)
    {
        float _2070 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2070;
    }
    float _2072 = _2006;
    if (!_1968)
    {
        _2060 = _1958;
    }
    float _2074 = _2060;
    float _2076 = _2074;
    if (_1968)
    {
        float _2078 = _1958 * _2048;
        _2076 = _2078;
    }
    float _2080 = _2076;
    if (_1968)
    {
        float _2082 = _2064 * _2064;
        _2068 = _2082;
    }
    float _2084 = _2068;
    if (_1968)
    {
        float _2086 = fma(_2028, _2022, _2072);
        _2030 = _2086;
    }
    float _2088 = _2030;
    if (!_1968)
    {
        _2054 = _1962;
    }
    float _2090 = _2054;
    float _2092 = _2090;
    if (_1968)
    {
        float _2094 = _2080 * _2080;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = fma(_2088, _2088, _2084);
    float _2100 = _2098 + _2096;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2104 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2102);
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = -_2106;
    float _2110 = _2108 + 1.0;
    float _2112 = rsqrt(_2100);
    float _2114 = _2112 * _2064;
    float _2116 = _2112 * _2088;
    float _2118 = _2112 * _2080;
    float _2120 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2122 = abs(_2110);
    float _2124 = log2(_2122);
    float _2126 = -_2120;
    float _2128 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2126);
    float _2130 = -_2118;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2128);
    float _2134 = fma(_2132, -0.5, 0.5);
    float _2136 = fma(_2132, 0.5, 0.5);
    float _2138 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2140 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2142 = sqrt(_2134);
    float _2144 = fma(_2136, _2138, -0.212114393711090087890625);
    float _2146 = _2116 + 1.0;
    float _2148 = fma(_2136, _2144, 1.570728778839111328125);
    float _2150 = exp2(_2140);
    float _2152 = _2142 * 0.636619746685028076171875;
    float _2154 = -_2116;
    float _2156 = fma(_2150, _2146, _2154);
    float _2158 = -_2148;
    float _2160 = fma(_2152, _2158, 1.0);
    float _2162 = fma(_2156, 0.5, 0.5);
    float2 _6090 = float2(_2160, _2162);
    float3 _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6090, float2(0.0), isnan(_6090)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6090, float2(0.0), isnan(_6090)), level(0.0)).xyz;
    float _2168 = _2166.x;
    float _2170 = _2166.y;
    float _2172 = _2166.z;
    float _2174 = abs(_1306);
    float _2176 = log2(_2174);
    float _2178 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2180 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2182 = -_1230;
    float _2184 = _2182 + 1.0;
    out.m_81.x = _1547;
    out.m_81.y = _1545;
    out.m_81.z = _1549;
    float _2186 = exp2(_2178);
    bool _2188 = _1306 <= 8000.0;
    bool _2190 = isnan(_1306);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan(8000.0);
    bool _2196 = _2192 || _2194;
    float _2198 = float(_2196);
    float _2200 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2180);
    float _2202 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2200);
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2206 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2202);
    float _2208 = exp2(_2204);
    out.gl_Position.x = _1773;
    out.gl_Position.y = _1793;
    out.gl_Position.z = _2206;
    out.gl_Position.w = _1745;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2212 = precise::clamp(_2210, 0.0, 1.0);
    float _2214 = fma(_2212, -2.0, 3.0);
    float _2216 = _2212 * _2212;
    float _2218 = _2216 * _2214;
    float _2220 = -_2218;
    float _2222 = _2220 + 1.0;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2218);
    float _2226 = _2198 * _2224;
    float _2228 = _2198;
    float _2230 = _2206;
    if (!_1733)
    {
        _2228 = 1.0;
    }
    float _2232 = _2228;
    float _2234 = _2232;
    if (_1733)
    {
        bool _2236 = _1839 >= _1799;
        bool _2238 = isnan(_1839);
        bool _2240 = _2236 || _2238;
        bool _2242 = isnan(_1799);
        bool _2244 = _2240 || _2242;
        float _2246 = float(_2244);
        _2234 = _2246;
    }
    float _2248 = _2234;
    float _2250 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2252 = -_2186;
    float _2254 = _2252 + 1.0;
    bool _2256 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2258 = isnan(_1948);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2264 = _2260 || _2262;
    float _2266 = _2184 * _2250;
    float _2268 = precise::clamp(_2266, 0.0, 1.0);
    float _2270 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2272 = _2248 * _1926;
    float _2274 = -_2268;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2278 = _2270 * _1841;
    float _2280 = -_2272;
    float _2282 = fma(_2280, _2276, 1.0);
    float _2284 = precise::clamp(_2282, 0.0, 1.0);
    float _2286 = _1852 * _2278;
    float _2288 = -_2270;
    float _2290 = _2288 + 1.0;
    float _2292 = _2290;
    float _2294 = _2284;
    if (!_2264)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2296 = _1749;
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2300 = _2296;
    float _2302 = _2296;
    if (!_2264)
    {
        _1803 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2304 = _1803;
    float _2306 = _1852 * _2290;
    float _2308 = _2304;
    float _2310 = _2304;
    if (!_2264)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2312 = _2230;
    out.m_83.x = _2298;
    float _2314 = _2312;
    float _2316 = _2312;
    if (!_2264)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2318 = _1781;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2264)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2324 = _2292;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2264)
    {
        _2294 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2330 = _2294;
    float _2332 = _2172 * _2278;
    float _2334 = fma(_2168, _2286, _1846);
    float _2336 = fma(_2170, _2286, _1848);
    float _2338 = fma(_1852, _2332, _1850);
    out.m_85.x = _2334;
    out.m_85.y = _2336;
    out.m_85.z = _2338;
    out.m_85.w = _2306;
    bool _2340 = !_2264;
    float _2342 = _2330;
    float _2344 = _2330;
    if (!_2340)
    {
        bool _2346 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2348 = isnan(_1948);
        bool _2350 = _2346 || _2348;
        bool _2352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2354 = _2350 || _2352;
        if (!_2354)
        {
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2358 = _1948 + _2356;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2362 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2360;
            float _2364 = 1.0 / _2362;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2372 = _2370 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2382 = _2358 * _2364;
            float _2384 = precise::clamp(_2382, 0.0, 1.0);
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2394 = fma(_2384, _2368, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2396 = fma(_2384, _2388, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2398 = fma(_2384, _2392, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2400 = fma(_2384, _2372, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2402 = fma(_2384, _2376, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2404 = fma(_2384, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2310 = _2398;
            _2328 = _2402;
            _2302 = _2396;
            _2322 = _2400;
            _2316 = _2394;
            _2344 = _2404;
            _2406 = true;
        }
        else
        {
            bool _2408 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2410 = isnan(_1948);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2416 = _2412 || _2414;
            if (!_2416)
            {
                _2300 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2418 = _2300;
            _2302 = _2418;
            if (!_2416)
            {
                _2308 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2420 = _2308;
            _2310 = _2420;
            if (!_2416)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2422 = _2314;
            _2316 = _2422;
            if (!_2416)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2424 = _2320;
            _2322 = _2424;
            if (!_2416)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2426 = _2326;
            _2328 = _2426;
            if (!_2416)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2428 = _2342;
            bool _2430 = !_2416;
            _2344 = _2428;
            if (!_2430)
            {
                bool _2432 = _1948 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2434 = isnan(_1948);
                bool _2436 = _2432 || _2434;
                bool _2438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2440 = _2436 || _2438;
                if (!_2440)
                {
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2444 = _1948 + _2442;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2448 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2446;
                    float _2450 = 1.0 / _2448;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2468 = _2444 * _2450;
                    float _2470 = precise::clamp(_2468, 0.0, 1.0);
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2482 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2484 = fma(_2470, _2478, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2486 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2488 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2490 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2310 = _2484;
                    _2328 = _2488;
                    _2302 = _2482;
                    _2322 = _2486;
                    _2316 = _2480;
                    _2344 = _2490;
                    _2406 = true;
                }
                else
                {
                    _2310 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2302 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2406 = false;
    float _2492 = _2310;
    float _2494 = _2328;
    float _2496 = _2302;
    float _2498 = _2322;
    float _2500 = _2316;
    float _2502 = _2344;
    float _2504 = fma(_1132, -0.5, 0.5);
    float _2506 = precise::clamp(_2504, 0.0, 1.0);
    float _2508 = -_2492;
    float _2510 = _2508 + _2494;
    float _2512 = -_2496;
    float _2514 = _2512 + _2498;
    float _2516 = -_2500;
    float _2518 = _2516 + _2502;
    bool _2520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2522 = fma(_2506, _2510, _2492);
    float _2524 = fma(_2506, _2514, _2496);
    float _2526 = fma(_2506, _2518, _2500);
    float _2528 = _2522 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2530 = fma(_2524, 0.298911988735198974609375, _2528);
    float _2532 = fma(_2526, 0.114477999508380889892578125, _2530);
    out.m_87.x = 0.0;
    float _2534 = -_2532;
    float _2536 = _2524 + _2534;
    float _2538 = -_2532;
    float _2540 = _2522 + _2538;
    float _2542 = -_2532;
    float _2544 = _2526 + _2542;
    float _2546 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2548 = fma(_2536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    float _2550 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2532);
    out.m_89.x = 0.0;
    out.m_83.w = _2546;
    out.m_91.x = _2548;
    out.m_91.y = _2550;
    out.m_91.z = _2552;
    if (!_2520)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2554 = -_1545;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2558 = -_1547;
    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2562 = -_1549;
    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = sqrt(_2570);
    float _2576 = _2556 * _2572;
    float _2578 = _2560 * _2572;
    float _2580 = _2564 * _2572;
    float _2582 = -_1954;
    float _2584 = _2582 + _2576;
    float _2586 = -_1950;
    float _2588 = _2586 + _2578;
    float _2590 = -_1952;
    float _2592 = _2590 + _2580;
    float _2594 = _2584 * _2584;
    float _2596 = -_2574;
    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2600 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = fma(_2588, _2588, _2594);
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2608 = precise::clamp(_2606, 0.0, 1.0);
    float _2610 = _2602 * _2602;
    float _2612 = fma(_2592, _2592, _2604);
    float _2614 = _2610 + (-1.0);
    float _2616 = abs(_2608);
    float _2618 = log2(_2616);
    float _2620 = rsqrt(_2612);
    float _2622 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2624 = exp2(_2622);
    float _2626 = _2584 * _2620;
    float _2628 = _2588 * _2620;
    float _2630 = _2592 * _2620;
    float _2632 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2634 = _1132 * _2626;
    float _2636 = _1132 * _2576;
    float _2638 = fma(_1122, _2628, _2634);
    float _2640 = fma(_1122, _2578, _2636);
    float _2642 = fma(_1134, _2630, _2638);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = fma(_1134, _2580, _2640);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = _2644 * _2644;
    float _2652 = fma(_2650, _2614, 1.0);
    float _2654 = -_2576;
    float _2656 = -_2632;
    float _2658 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2656);
    float _2660 = _2652 * _2652;
    float _2662 = -_2580;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2658);
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2668 = _2664 + _2666;
    float _2670 = 1.0 / _2660;
    float _2672 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2674 = precise::clamp(_2672, 0.0, 1.0);
    float _2676 = _2624 * _2674;
    float _2678 = _2648 * _2676;
    float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2682 = _2610 * _2670;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2686 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2688 = _2678 * _2682;
    out.m_87.x = _2680;
    out.m_87.y = _2684;
    out.m_87.z = _2686;
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2692 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2690;
    out.m_89.y = _2692;
    out.m_89.z = _2694;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

