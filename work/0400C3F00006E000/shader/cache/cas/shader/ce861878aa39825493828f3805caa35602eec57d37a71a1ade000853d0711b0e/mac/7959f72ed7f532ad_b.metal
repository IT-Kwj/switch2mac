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
    float4 m_77 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
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
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2948 = false;
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
        float _3293 = as_type<float>(_132);
        out.gl_Position.z = _3293;
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
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_59.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3363 = as_type<float>(_170);
        out.gl_Position.z = _3363;
    }
    if (_162)
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
    float2 _3490 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3490, float2(0.0), isnan(_3490)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3490, float2(0.0), isnan(_3490)), level(0.0)).x;
    float _244 = in.m_63.y;
    float _246 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _248 = in.m_63.x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = in.m_63.z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _262 = 1.0 / _252;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _266 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _246);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _202 + _268;
    float _272 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _274 = 1.0 / _256;
    bool _276 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _284 = _280 || _282;
    float _286 = _272 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = _244 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _290 = _244 * 2.0;
    float _292 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _294 = int(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _298 = 1.0 + _296;
    float _300 = fma(_288, -2.0, _260);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _202 + _302;
    float _306 = _248 * 2.0;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _310 = _248 + _244;
    float _312 = _304 * _262;
    float _314 = floor(_290);
    float _316 = -_264;
    float _318 = fma(_308, 2.0, _316);
    float _320 = _258 * 2.0;
    float _322 = _310 + (-1.0);
    float _324 = _248 + _258;
    float _326 = _270 * _274;
    float _328 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _332 = log2(_330);
    float _334 = _244 + _258;
    float _336 = _324 + (-1.0);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _340 = float(_294);
    float _342 = _334 + (-1.0);
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _346 = floor(_306);
    bool _348 = _314 > 0.0;
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _352 = _314 >= 0.0;
    bool _354 = isnan(_314);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = _340 * _150;
    float _364 = -_150;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[76].x, _318);
    float _368 = floor(_320);
    float _370 = _332 * _150;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _300);
    float _386 = fma(_374, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_378, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _390 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _392 = int(_390);
    bool _394 = _346 > 0.0;
    float _396 = fma(_382, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _398 = _346 >= 0.0;
    bool _400 = isnan(_346);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    float _408 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _410 = _258 + (-0.5);
    int _412 = _360 ? 0 : 1;
    float _414 = exp2(_370);
    bool _416 = _368 > 0.0;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    bool _422 = _368 >= 0.0;
    bool _424 = isnan(_368);
    bool _426 = _422 || _424;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = fma(_420, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _442 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_202);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_434, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _456 = fma(_438, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = float(_392);
    float _460 = 1.0 / _298;
    float _462 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _408);
    bool _464 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_202);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _478 = -_414;
    float _480 = _478 + 1.0;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _484 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _486 = isnan(_202);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = 1.0 / _458;
    float _498 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _462);
    float _500 = _284 ? _480 : 0.0;
    float _502 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[78].z, _338);
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = -_494;
    float _516 = _514 + 1.0;
    float _518 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _520 = _406 ? 0 : 1;
    float _522 = _498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _524 = _474 * _516;
    float _526 = -_474;
    float _528 = _526 + 1.0;
    float _530 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _502);
    int _532 = ~_520;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _518);
    int _540 = _536;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_394)
    {
        int _544 = ~_520;
        int _546 = _544 + 1;
        _540 = _546;
    }
    int _548 = _540;
    float _550 = _452 * _528;
    float _552 = _496 * _150;
    if (_512)
    {
        float _554 = _500 * _460;
        _152 = _554;
    }
    float _556 = _152;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _568 = _566 != 0;
    float _570 = in.m_65.x;
    float _572 = in.m_65.y;
    float _574 = in.m_65.z;
    int _576 = _430 ? 0 : 1;
    float _578 = _440 * _550;
    float _580 = float(_548);
    float _582 = 1.0 / _522;
    bool _584 = !_564;
    int _586 = _584 ? 0 : 1;
    float _588 = _386 * _550;
    bool _590 = !_560;
    int _592 = _590 ? 0 : 1;
    float _594 = _454 * _550;
    bool _596 = !_568;
    int _598 = _596 ? 0 : 1;
    float _600 = _286 + _476;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _612 = _610 != 0;
    int _614 = ~_576;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (!_416)
    {
        int _622 = ~_576;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    bool _628 = !_604;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_608;
    int _634 = _632 ? 0 : 1;
    int _636 = abs(_630);
    float _638 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _640 = abs(_634);
    bool _642 = !_612;
    int _644 = _642 ? 0 : 1;
    float _646 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _638);
    float _648 = float(_640);
    float _650 = float(_626);
    float _652 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _646);
    float _654 = float(_636);
    float _656 = _648 * _580;
    int _658 = ~_412;
    int _660 = _658 + 1;
    int _662 = _660 + 1;
    float _664 = _652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _666 = _662;
    if (!_348)
    {
        int _668 = ~_412;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _656 * (-2.0);
    int _676 = abs(_644);
    float _678 = _654 * _650;
    float _680 = _664 + _522;
    float _682 = _244 + (-0.5);
    float _684 = fma(_674, _572, _572);
    float _686 = float(_672);
    float _688 = _680 * _582;
    float _690 = _688 * 0.5;
    float _692 = float(_676);
    float _694 = fma(_350, _674, _350);
    float _696 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _698 = _678 * (-2.0);
    float _700 = _692 * _686;
    float _702 = fma(_694, _556, _696);
    float _704 = fma(_328, _698, _328);
    float _706 = _248 + (-0.5);
    float _708 = in.m_67.x;
    float _710 = in.m_67.y;
    float _712 = in.m_67.z;
    float _714 = fma(_698, _570, _570);
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _718 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _716);
    float _720 = _700 * (-2.0);
    float _722 = _702 * 0.15915493667125701904296875;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].x, _714);
    float _726 = -_452;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _718;
    float _732 = in.m_69.x;
    float _734 = in.m_69.y;
    float _736 = in.m_69.z;
    float _738 = fma(_704, _556, _724);
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].x, _578);
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].y, _588);
    float _744 = fma(_720, _574, _574);
    float _746 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _748 = fma(_456, _524, _740);
    float _750 = fma(_344, _720, _344);
    float _752 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[196].z, _744);
    float _754 = fma(_396, _524, _746);
    float _756 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].x, _748);
    float _758 = fma(_388, _524, _742);
    float _760 = fma(_750, _556, _752);
    float _762 = _738 * 0.15915493667125701904296875;
    float _764 = _722 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].y, _758);
    float _770 = _756 * _708;
    float _772 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].z, _754);
    float _774 = _760 * 0.15915493667125701904296875;
    float _776 = _768 * _710;
    float _778 = _772 * _712;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _782 = _730 * _780;
    float _784 = _722 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _790 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    bool _794 = _782 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _796 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _798 = _782 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    float _802 = _762 * 6.283185482025146484375;
    float _804 = sin(_802);
    float _806 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _790 * _788;
    bool _810 = !_794;
    int _812 = _810 ? 0 : 1;
    float _814 = _796 * _792;
    float _816 = _806 * _800;
    float _818 = _600 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _820 = _774 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _600 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _826 = 2;
    if (!_794)
    {
        _826 = 1;
    }
    int _828 = _826;
    float _830 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _818);
    int _832 = _828;
    if (!_798)
    {
        _832 = _812;
    }
    int _834 = _832;
    float _836 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _824);
    bool _838 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _840 = isnan(0.5);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _846 = _842 || _844;
    float _848 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _830);
    float _850 = _762 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _804 * _766;
    float _856 = _804 * _786;
    int _858 = _834 << 6;
    float _860 = _848 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _862 = _774 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _804 * _822;
    float _868 = _866 * _808;
    float _870 = _852 * _766;
    float _872 = _852 * _786;
    float _874 = _852 * _822;
    float _876 = _786 * _822;
    float _878 = _766 * _822;
    float _880 = trunc(_860);
    int _882 = int(_880);
    float _884 = _874 * _808;
    float _886 = -_870;
    float _888 = fma(_864, _856, _886);
    float _890 = -_856;
    float _892 = fma(_864, _870, _890);
    float _894 = fma(_864, _872, _854);
    float _896 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _836);
    float _898 = fma(_864, _854, _872);
    float _900 = -_808;
    float _902 = _864 * _900;
    int _904 = _858 + 96;
    uint _907 = uint(int(uint(_904) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    float _923 = _896 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _925 = fma(_894, _816, _884);
    float _927 = fma(_876, _816, _902);
    float _929 = trunc(_923);
    int _931 = int(_929);
    float _933 = fma(_892, _814, _925);
    float _935 = fma(_888, _816, _868);
    int _937 = _858 + 104;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[int(_949)][_951];
    float _955 = fma(_878, _814, _927);
    float _957 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _959 = fma(_898, _814, _935);
    float _961 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _963 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _965 = _882 + _963;
    int _967 = _965 + 1;
    float _969 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _957);
    int _971 = _858 + 48;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    uint _975 = uint(int(uint(int(_973)) >> uint(2)));
    int _977 = int(_973) & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    int _981 = int(_973) + 1;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    int _985 = _981 & 3;
    float _987 = (*spvDescriptorSet0.vp_c15)._m0[int(_983)][_985];
    float _989 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _961);
    float _991 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    bool _993 = _967 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _995 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _997 = _931 + _995;
    int _999 = _997 + 1;
    float _1001 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1003 = _991 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1005 = _858 + 64;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = _967 | _999;
    float _1025 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1027 = _224 + _1003;
    bool _1029 = _1023 < 0;
    bool _1031 = _1029 || _993;
    float _1033 = _222 + _1025;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1037 = _1027 + _1035;
    int _1039 = _858 + 56;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.vp_c15)._m0[int(_1043)][_1045];
    int _1049 = int(_1041) + 1;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    int _1053 = _1049 & 3;
    float _1055 = (*spvDescriptorSet0.vp_c15)._m0[int(_1051)][_1053];
    bool _1057 = _999 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1031;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1063 = _1033 + _1061;
    float _1065 = _1037 * _1037;
    float _1067 = fma(_1063, _1063, _1065);
    int _1069 = _858 + 72;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.vp_c15)._m0[int(_1081)][_1083];
    float _1087 = sqrt(_1067);
    int _1089 = _967;
    float _1091 = _1027;
    float _1093 = _1037;
    if (!_1059)
    {
        int _1095 = _999 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1097 = _1095 + _967;
        _1089 = _1097;
    }
    int _1099 = _1089;
    float _1101 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1103 = _858 + 80;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.vp_c15)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
    float _1121 = _600 * _921;
    float _1123 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1101);
    float _1125 = _933;
    int _1127 = as_type<int>(_921);
    float _1129 = _1121;
    if (!_1059)
    {
        float _1131 = floor(_860);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = fma(_222, _913, _1121);
    if (!_1059)
    {
        int _1137 = _1099 << 2;
        _1127 = _1137;
    }
    int _1139 = _1127;
    float _1141 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1123);
    float _1143 = fma(_224, _945, _1135);
    int _1145 = _1139;
    float _1147 = _945;
    float _1149 = _1087;
    if (!_1059)
    {
        int _1151 = 12 & _1139;
        _1145 = _1151;
    }
    int _1153 = _1145;
    bool _1155 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = _1143 + _953;
    float _1159 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1161 = _600 * _987;
    float _1163 = 1.0 / _1157;
    float _1165 = _286 + _1159;
    float _1167 = fma(_222, _979, _1161);
    float _1169 = _600 * _1021;
    int _1171 = as_type<int>(_1167);
    float _1173 = _1165;
    float _1175 = _1157;
    if (!_1155)
    {
        _1147 = _1033;
    }
    float _1177 = _1147;
    float _1179 = fma(_222, _1013, _1169);
    float _1181 = fma(_224, _1047, _1167);
    float _1183 = _1177;
    if (!_1059)
    {
        uint _1185 = uint(int(uint(_1099) >> uint(2)));
        _1171 = int(_1185);
    }
    int _1187 = _1171;
    float _1189 = _1181 + _1055;
    int _1191 = _1187;
    if (!_1059)
    {
        int _1193 = _1187 << 4;
        int _1195 = _1193 + _1153;
        _1191 = _1195;
    }
    int _1197 = _1191;
    float _1199 = fma(_224, _1077, _1179);
    float _1201 = _1199 + _1085;
    bool _1203 = !_1155;
    if (!_1203)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1087 + _1207;
        float _1211 = _1165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1213 = rsqrt(_1067);
        float _1215 = _1209 * _1205;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1213 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1063, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1037, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = fma(_1165, _1225, _1237);
        _1173 = _1239;
        _1091 = _1235;
        _1183 = _1233;
        _1175 = _1217;
        _1149 = _1209;
    }
    float _1241 = _1173;
    float _1243 = _1091;
    float _1245 = _1183;
    float _1247 = _1175;
    float _1249 = _1149;
    float _1251 = _1247;
    float _1253 = _1249;
    float _1255 = _1245;
    if (_846)
    {
        _1251 = _1241;
    }
    float _1257 = _1251;
    float _1259 = _1257;
    if (_846)
    {
        _1253 = _1243;
    }
    float _1261 = _1253;
    float _1263 = _1261;
    if (!_846)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _286 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _222 + _1269;
        float _1273 = -_286;
        float _1275 = _1273 + _1241;
        float _1277 = -_222;
        float _1279 = _1277 + _1245;
        float _1281 = _1267 * _1267;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1285 = _224 + _1283;
        float _1287 = fma(_1271, _1271, _1281);
        float _1289 = fma(_1285, _1285, _1287);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = sqrt(_1289);
        float _1295 = precise::min(_1293, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1291;
        float _1299 = -_224;
        float _1301 = _1299 + _1243;
        float _1303 = fma(_1275, _1297, _286);
        float _1305 = fma(_1279, _1297, _222);
        float _1307 = fma(_1301, _1297, _224);
        _1259 = _1303;
        _1255 = _1305;
        _1263 = _1307;
    }
    float _1309 = _1259;
    float _1311 = _1255;
    float _1313 = _1263;
    int _1315 = _858 + 88;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1337 = _1189 * _1163;
    float _1339 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1341 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1343 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1335);
    float _1345 = _1201 * _1163;
    float _1347 = _1141;
    if (!_1059)
    {
        int _1349 = _1197 + 400;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
        int _1355 = int(_1351) & 3;
        float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
        _1347 = _1357;
    }
    float _1359 = _1347;
    float _1361 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1339);
    float _1363 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1341);
    bool _1365 = _1337 >= 0.0;
    float _1367 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1343);
    float _1369 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1371 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1361);
    float _1373 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1375 = _1337 <= 1.0;
    bool _1377 = _1375 && _1365;
    float _1379 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1381 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1369);
    float _1383 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1385 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1387 = _1345 >= 0.0;
    bool _1389 = _1387 && _1377;
    float _1391 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1393 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1395 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1381);
    float _1397 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1385);
    bool _1399 = _1345 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = -_1393;
    float _1405 = fma(_1403, _1391, 1.0);
    float _1407 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1409 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1397);
    float _1411 = _1055;
    if (!_1059)
    {
        float _1413 = floor(_923);
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1409);
    float _1423 = _600 * _1119;
    float _1425 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1419);
    float _1427 = 1.0 / _1421;
    float _1429 = _1423;
    if (_1401)
    {
        float _1431 = float(_834);
        _1093 = _1431;
    }
    float _1433 = _1093;
    float _1435 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1437 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1425);
    float _1439 = fma(_222, _1111, _1423);
    float _1441 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1435);
    float _1443 = log2(_1405);
    float _1445 = _1437;
    if (!_1059)
    {
        float _1447 = -_1415;
        float _1449 = _923 + _1447;
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1441);
    float _1455 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1437);
    float _1457 = fma(_224, _1323, _1439);
    if (!_1059)
    {
        float _1459 = -_1133;
        float _1461 = _860 + _1459;
        _1445 = _1461;
    }
    float _1463 = _1445;
    float _1465 = _1455 * _1427;
    float _1467 = _1457 + _1331;
    float _1469 = _1419;
    if (_1401)
    {
        float _1471 = rint(_1433);
        float _1473 = precise::max(_1471, 0.0);
        uint _1475 = uint(_1473);
        uint _1477 = clamp(_1475, 0u, 65535u);
        _1469 = as_type<float>(_1477);
    }
    float _1479 = _1469;
    float _1481 = _1467 * _1163;
    float _1483 = _1443 * 0.693147182464599609375;
    float _1485 = _1453 * _1427;
    float _1487 = fma(_1465, -0.5, 0.5);
    float _1489 = _1465;
    if (!_1059)
    {
        float _1491 = rint(_1359);
        float _1493 = precise::max(_1491, 0.0);
        uint _1495 = uint(_1493);
        uint _1497 = clamp(_1495, 0u, 65535u);
        _1489 = as_type<float>(_1497);
    }
    float _1499 = _1489;
    float _1501 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1503 = fma(_1485, 0.5, 0.5);
    float _1505 = _1467;
    if (_1401)
    {
        float3 _5523 = float3(_1337, _1345, float(as_type<int>(_1479)));
        float3 _5527 = select(_5523, float3(0.0), isnan(_5523));
        float _1507 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5527.xy, uint(rint(_5527.z)), _1481, level(0.0));
        _1505 = _1507;
    }
    float _1509 = _1505;
    float3 _5537 = float3(_1503, _1487, _1501);
    float _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5537, float3(0.0), isnan(_5537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5537, float3(0.0), isnan(_5537)), level(0.0)).x;
    float3 _5546 = float3(_1503, _1487, _1501);
    float4 _1514 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5546, float3(0.0), isnan(_5546)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5546, float3(0.0), isnan(_5546)), level(0.0)).xyzw;
    float _1516 = _1514.x;
    float _1518 = _1514.y;
    float _1520 = _1514.z;
    float _1522 = _1514.w;
    float _1524 = _1451;
    if (!_1059)
    {
        float3 _5569 = float3(_1463, _1451, float(as_type<int>(_1499)));
        float3 _5571 = select(_5569, float3(0.0), isnan(_5569));
        float _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5571.xy, uint(rint(_5571.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5571.xy, uint(rint(_5571.z)), level(0.0)).x;
        _1524 = _1526;
    }
    float _1528 = _1524;
    float _1530 = float(uint(_294));
    float _1532 = trunc(_552);
    int _1534 = int(_1532);
    bool _1536 = _294 == 0;
    int _1538 = abs(_592);
    int _1540 = abs(_598);
    float _1542 = 1.0 / _1530;
    float _1544 = float(uint(_1534));
    int _1546 = as_type<int>(_1542) + (-2);
    float _1548 = as_type<float>(_1546) * _1544;
    float _1550 = trunc(_1548);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = ~_294;
    int _1558 = _1556 + 1;
    int _1560 = ~_294;
    int _1562 = _1560 + 1;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = float(_116);
    bool _1570 = !_1566;
    float _1572 = _1570 ? 7.345489978790283203125 : 1.0;
    float _1574 = 1.0 / _1568;
    int _1576 = _1558 * int(_1554);
    int _1578 = _1576 + _1534;
    float _1580 = _1572 * _248;
    float _1582 = float(uint(_1578));
    float _1584 = as_type<float>(_1546) * _1582;
    float _1586 = floor(_1580);
    float _1588 = trunc(_1584);
    float _1590 = precise::max(_1588, 0.0);
    uint _1592 = uint(_1590);
    float _1594 = -_1586;
    float _1596 = _1580 + _1594;
    float _1598 = _1596 * _340;
    float _1600 = _362 * _1574;
    int _1602 = int(_1554) + int(_1592);
    float _1604 = float(_1534);
    float _1606 = trunc(_1598);
    int _1608 = int(_1606);
    int _1610 = _1562 * _1602;
    int _1612 = _1610 + _1534;
    bool _1614 = _1604 >= _340;
    bool _1616 = isnan(_1604);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan(_340);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    bool _1626 = uint(_1612) >= uint(_294);
    float _1628 = trunc(_1600);
    int _1630 = int(_1628);
    bool _1632 = !_1626;
    int _1634 = _1632 ? 0 : (-1);
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1638 = _1636 != 0;
    int _1640 = ~_1602;
    int _1642 = _1640 + _1634;
    int _1644 = _1642 + 1;
    float _1646 = trunc(_1624);
    int _1648 = int(_1646);
    bool _1650 = !_1638;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1656 = _1654 != 0;
    int _1658 = _294 * _1644;
    int _1660 = _1658 + _1534;
    int _1662 = _294 + (-1);
    int _1664 = abs(_1652);
    bool _1666 = !_1536;
    int _1668 = _1666 ? _1660 : (-1);
    float _1670 = as_type<float>(_1540);
    float _1672 = _1530;
    if (_1059)
    {
        _542 = 1.0;
    }
    float _1674 = _542;
    int _1676 = ~_1648;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1668 * _1680;
    int _1684 = abs(_586);
    int _1686 = _1648 * _1662;
    int _1688 = _1686 + _1682;
    bool _1690 = !_1656;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = _1688 * _1684;
    int _1696 = _1608 * _1664;
    int _1698 = _1696 + _1534;
    int _1700 = abs(_1692);
    int _1702 = _1630 * _1538;
    int _1704 = _1702 + _1694;
    int _1706 = _1698 * _1540;
    int _1708 = _1706 + _1704;
    int _1710 = _1608 * _1700;
    int _1712 = _1710 + _1708;
    int _1714 = ~_294;
    int _1716 = _1714 + 1;
    float _1718 = float(uint(_1712));
    float _1720 = as_type<float>(_1546) * _1718;
    float _1722 = trunc(_1720);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    int _1728 = _1716 * int(_1726);
    int _1730 = _1728 + _1712;
    float _1732 = float(uint(_1730));
    float _1734 = as_type<float>(_1546) * _1732;
    float _1736 = trunc(_1734);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = int(_1726) + int(_1740);
    float _1744 = _1674;
    float _1746 = _1509;
    float _1748 = _1511;
    if (!_1059)
    {
        int _1750 = _1099 << 4;
        int _1752 = _1750 + 2048;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        uint _1756 = uint(int(uint(int(_1754)) >> uint(2)));
        int _1758 = int(_1754) & 3;
        float _1760 = (*spvDescriptorSet0.vp_c15)._m0[int(_1756)][_1758];
        int _1762 = int(_1754) + 1;
        uint _1764 = uint(int(uint(_1762) >> uint(2)));
        int _1766 = _1762 & 3;
        float _1768 = (*spvDescriptorSet0.vp_c15)._m0[int(_1764)][_1766];
        int _1770 = _1752 + 8;
        uint _1772 = uint(int(uint(_1770) >> uint(2)));
        uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
        int _1776 = int(_1772) & 3;
        float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
        int _1780 = int(_1772) + 1;
        uint _1782 = uint(int(uint(_1780) >> uint(2)));
        int _1784 = _1780 & 3;
        float _1786 = (*spvDescriptorSet0.vp_c15)._m0[int(_1782)][_1784];
        float _1788 = _600 * _1768;
        float _1790 = fma(_222, _1760, _1788);
        float _1792 = fma(_224, _1778, _1790);
        float _1794 = _1792 + _1786;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        float _1798 = -_1796;
        float _1800 = _1798 + _1528;
        float _1802 = fma(_1800, 500.0, 1.5);
        float _1804 = exp2(_1802);
        float _1806 = 0.0 + _1804;
        float _1808 = precise::clamp(_1806, 0.0, 1.0);
        _1744 = _1808;
    }
    float _1810 = _1744;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1814 = _1309 + _1812;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1818 = _1311 + _1816;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1822 = _1313 + _1820;
    float _1824 = _1814 * _1814;
    float _1826 = fma(_1818, _1818, _1824);
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1830 = fma(_1822, _1822, _1826);
    float _1832 = rsqrt(_1830);
    float _1834 = sqrt(_1830);
    float _1836 = _1818 * _1832;
    float _1838 = _1822 * _1832;
    float _1840 = _1814 * _1832;
    float _1842 = precise::max(0.0, _1828);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1848 = _1844 * _1844;
    float _1850 = _1846 * _1846;
    float _1852 = -_1840;
    float _1854 = -_1842;
    float _1856 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1854);
    float _1858 = _1848 + _1850;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1528;
    float _1870 = _1842;
    float _1872 = _1828;
    float _1874 = _1866;
    float _1876 = _1844;
    float _1878 = _1846;
    float _1880 = _1848;
    float _1882 = _1850;
    if (_1862)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1884;
    }
    float _1886 = _1868;
    if (_1862)
    {
        float _1888 = _1856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = _1890;
    if (_1862)
    {
        float _1894 = rsqrt(_1858);
        _1872 = _1894;
    }
    float _1896 = _1872;
    float _1898 = _1896;
    if (_1862)
    {
        float _1900 = _1866 * _1886;
        _1874 = _1900;
    }
    float _1902 = _1874;
    if (_1862)
    {
        float _1904 = _1902 * 0.15915493667125701904296875;
        _1670 = _1904;
    }
    float _1906 = _1670;
    float _1908 = _222;
    if (_1862)
    {
        float _1910 = _1906 * 6.283185482025146484375;
        float _1912 = sin(_1910);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1902;
    if (_1862)
    {
        float _1918 = _1906 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1916 = _1920;
    }
    float _1922 = _1916;
    float _1924 = _1914;
    if (_1862)
    {
        float _1926 = fma(_1914, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1892 = _1926;
    }
    float _1928 = _1892;
    float _1930 = _1928;
    if (_1862)
    {
        float _1932 = _1896 * _1928;
        _1672 = _1932;
    }
    float _1934 = _1672;
    if (!_1862)
    {
        _1898 = _1856;
    }
    float _1936 = _1898;
    float _1938 = _1936;
    if (_1862)
    {
        float _1940 = _1922 + (-1.0);
        _1924 = _1940;
    }
    float _1942 = _1924;
    if (_1862)
    {
        float _1944 = _1844 * _1934;
        _1876 = _1944;
    }
    float _1946 = _1876;
    if (_1862)
    {
        float _1948 = _1846 * _1934;
        _1878 = _1948;
    }
    float _1950 = _1878;
    if (_1862)
    {
        float _1952 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1930 = _1952;
    }
    float _1954 = _1930;
    if (_1862)
    {
        float _1956 = _1946 * _1946;
        _1880 = _1956;
    }
    float _1958 = _1880;
    if (_1862)
    {
        float _1960 = _1950 * _1950;
        _1882 = _1960;
    }
    float _1962 = _1882;
    if (_1862)
    {
        float _1964 = fma(_1856, _1922, _1954);
        _1938 = _1964;
    }
    float _1966 = _1938;
    float _1968 = fma(_1966, _1966, _1958);
    float _1970 = _1968 + _1962;
    float _1972 = rsqrt(_1970);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = -_1978;
    float _1982 = _1980 + 1.0;
    float _1984 = abs(_1982);
    float _1986 = log2(_1984);
    float _1988 = _1972 * _1946;
    float _1990 = _1972 * _1966;
    float _1992 = _1972 * _1950;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1996 = -_1994;
    float _1998 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1996);
    float _2000 = -_1992;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1998);
    float _2004 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2006 = fma(_2002, -0.5, 0.5);
    float _2008 = fma(_2002, 0.5, 0.5);
    float _2010 = exp2(_2004);
    float _2012 = fma(_2008, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2014 = fma(_2008, _2012, -0.212114393711090087890625);
    float _2016 = _1990 + 1.0;
    float _2018 = sqrt(_2006);
    float _2020 = fma(_2008, _2014, 1.570728778839111328125);
    float _2022 = -_1990;
    float _2024 = fma(_2010, _2016, _2022);
    int _2026 = ~_294;
    int _2028 = _2026 + 1;
    float _2030 = float(uint(_1698));
    float _2032 = fma(_2024, 0.5, 0.5);
    float _2034 = _2018 * 0.636619746685028076171875;
    float _2036 = -_2020;
    float _2038 = fma(_2034, _2036, 1.0);
    float2 _6308 = float2(_2038, _2032);
    float3 _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6308, float2(0.0), isnan(_6308)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6308, float2(0.0), isnan(_6308)), level(0.0)).xyz;
    float _2044 = _2042.x;
    float _2046 = _2042.y;
    float _2048 = _2042.z;
    float _2050 = as_type<float>(_1546) * _2030;
    int _2052 = _2028 * _1742;
    int _2054 = _2052 + _1712;
    int _2056 = ~_294;
    int _2058 = _2056 + 1;
    float _2060 = in.m_71.x;
    bool _2062 = _244 > 0.5;
    float _2064 = abs(_782);
    float _2066 = log2(_2064);
    bool _2068 = uint(_2054) >= uint(_294);
    float _2070 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2072 = ~_294;
    int _2074 = _2072 + 1;
    float _2076 = -_242;
    float _2078 = _2076 + 1.0;
    bool _2080 = !_2068;
    int _2082 = _2080 ? 0 : (-1);
    out.m_73.x = _1311;
    out.m_73.y = _1309;
    out.m_73.z = _1313;
    float _2084 = trunc(_2050);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    int _2090 = ~_1742;
    int _2092 = _2090 + _2082;
    int _2094 = _2092 + 1;
    bool _2096 = _782 <= 8000.0;
    bool _2098 = isnan(_782);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(8000.0);
    bool _2104 = _2100 || _2102;
    float _2106 = float(_2104);
    int _2108 = _294 * _2094;
    int _2110 = _2108 + _1712;
    float _2112 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = exp2(_2070);
    bool _2116 = !_1536;
    int _2118 = _2116 ? _2110 : (-1);
    int _2120 = _2118 >> 31;
    int _2122 = _2074 * int(_2088);
    int _2124 = _2122 + _1698;
    int _2126 = _2118 & 3;
    bool _2128 = _2126 != 0;
    int _2130 = _2120 & 3;
    float _2132 = float(uint(_2124));
    int _2134 = _2118 + _2130;
    int _2136 = _2118 & 3;
    bool _2138 = _2136 != 0;
    float _2140 = as_type<float>(_1546) * _2132;
    int _2142 = _2134 >> 2;
    float _2144 = -_2114;
    float _2146 = _2144 + 1.0;
    bool _2148 = uint(_2126) > 1u;
    int _2150 = _2142 << 4;
    int _2152 = _2150 + 368;
    float _2154 = trunc(_2140);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    int _2160 = _2138 ? 0 : 1;
    float _2162 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    uint _2164 = uint(int(uint(_2152) >> uint(2)));
    uint _2166 = uint(int(uint(int(_2164)) >> uint(2)));
    int _2168 = int(_2164) & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    int _2172 = int(_2164) + 1;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    int _2176 = _2172 & 3;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[int(_2174)][_2176];
    bool _2180 = _2126 != 3;
    int _2182 = ~_2160;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2186;
    float _2190 = _2060;
    float _2192 = _2106;
    if (!_2148)
    {
        int _2194 = ~_2160;
        int _2196 = _2194 + 1;
        _2188 = _2196;
    }
    int _2198 = _2188;
    bool _2200 = uint(_2126) >= 2u;
    float _2202 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2204 = int(_2202);
    int _2206 = abs(_2198);
    int _2208 = int(_2088) + int(_2158);
    int _2210 = _2152 + 8;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    uint _2214 = uint(int(uint(int(_2212)) >> uint(2)));
    int _2216 = int(_2212) & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = int(_2212) + 1;
    uint _2222 = uint(int(uint(_2220) >> uint(2)));
    int _2224 = _2220 & 3;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[int(_2222)][_2224];
    int _2228 = _2200 ? 0 : 1;
    int _2230 = _2058 * _2208;
    int _2232 = _2230 + _1698;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    bool _2238 = uint(_2232) >= uint(_294);
    bool _2240 = !_2128;
    int _2242 = _2240 ? 0 : 1;
    bool _2244 = _2126 != 3;
    float _2246 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _2248 = !_2244;
    int _2250 = _2248 ? 0 : (-1);
    bool _2252 = !_2238;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2258 = _2256 != 0;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2262 = _2260 != 0;
    float _2264 = _2246 * _248;
    int _2266 = ~_2228;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = abs(_2242);
    int _2274 = _2270;
    if (_2180)
    {
        int _2276 = ~_2228;
        int _2278 = _2276 + 1;
        _2274 = _2278;
    }
    int _2280 = _2274;
    float _2282 = trunc(_2264);
    int _2284 = int(_2282);
    int _2286 = ~_2208;
    int _2288 = _2286 + _2254;
    int _2290 = _2288 + 1;
    int _2292 = abs(_2280);
    int _2294 = _294 * _2290;
    int _2296 = _2294 + _1698;
    int _2298 = ~_2206;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    int _2304 = abs(_2250);
    int _2306 = ~_2272;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2302 * as_type<int>(_2178);
    bool _2314 = !_2262;
    int _2316 = _2314 ? 0 : 1;
    int _2318 = _2310 * as_type<int>(_2170);
    int _2320 = _2318 + _2312;
    int _2322 = ~_2292;
    int _2324 = _2322 + 1;
    int _2326 = _2324 + 1;
    float _2328 = in.m_71.y;
    float _2330 = float(uint(_2204));
    int _2332 = abs(_2316);
    int _2334 = _2326 * as_type<int>(_2218);
    int _2336 = _2334 + _2320;
    int _2338 = ~_2304;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    float _2344 = 1.0 / _2330;
    int _2346 = ~_2332;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    int _2352 = _2342 * as_type<int>(_2226);
    int _2354 = _2352 + _2336;
    bool _2356 = !_1536;
    int _2358 = _2356 ? _2296 : (-1);
    int _2360 = abs(_2204);
    int _2362 = _2354 * _2350;
    int _2364 = _2284 << 4;
    int _2366 = _2364 + 1712;
    float _2368 = float(uint(_2360));
    int _2370 = _2358 * _2332;
    int _2372 = _2370 + _2362;
    uint _2374 = uint(int(uint(_2366) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    bool _2390 = _248 > 0.5;
    bool _2392 = _2390 && _2236;
    float _2394 = in.m_75.x;
    float _2396 = in.m_75.y;
    float _2398 = in.m_75.z;
    float _2400 = 1.0 / _2368;
    int _2402 = as_type<int>(_2344) + (-2);
    float _2404 = -_2328;
    float _2406 = _2404 + 1.0;
    float _2408 = float(uint(_2372));
    int _2410 = _2366 + 8;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    float _2420 = _2328;
    if (_2236)
    {
        _1129 = _2060;
    }
    float _2422 = _1129;
    float _2424 = as_type<float>(_2402) * _2408;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2430 = ~_2204;
    int _2432 = _2430 + 1;
    float _2434 = _2422;
    if (_2392)
    {
        float _2436 = -_2422;
        float _2438 = _2436 + 1.0;
        _2434 = _2438;
    }
    float _2440 = _2434;
    int _2442 = abs(_2372);
    float _2444 = trunc(_2424);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    bool _2450 = _734 != 0.0;
    bool _2452 = isnan(_734);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2462 = as_type<int>(_2400) + (-2);
    float _2464 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2466 = float(uint(_2442));
    bool _2468 = _732 == 0.0;
    bool _2470 = !_2458;
    bool _2472 = _2468 && _2470;
    if (_2236)
    {
        _2190 = _2440;
    }
    float _2474 = _2190;
    float _2476 = as_type<float>(_2462) * _2466;
    int _2478 = ~_2360;
    int _2480 = _2478 + 1;
    bool _2482 = _736 == 0.0;
    bool _2484 = _2482 && _2472;
    int _2486 = _2432 * int(_2448);
    int _2488 = _2486 + _2372;
    if (_2258)
    {
        float _2490 = _2062 ? _2406 : _2328;
        _2420 = _2490;
    }
    float _2492 = _2420;
    float _2494 = trunc(_2476);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2502 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2504 = _2398;
    float _2506 = _2394;
    float _2508 = _2396;
    if (!_2484)
    {
        float _2510 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2398);
        _2504 = _2510;
    }
    float _2512 = _2504;
    if (!_2484)
    {
        float _2514 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2394);
        _2506 = _2514;
    }
    float _2516 = _2506;
    float _2518 = float(uint(_2488));
    float _2520 = exp2(_2112);
    if (!_2484)
    {
        float _2522 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2396);
        _2508 = _2522;
    }
    float _2524 = _2508;
    float _2526 = _2380 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2528 = as_type<float>(_2402) * _2518;
    int _2530 = _2480 * int(_2498);
    int _2532 = _2530 + _2442;
    float _2534 = _2388 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_77.x = _2502;
    out.m_77.y = _2460;
    out.m_77.z = _2464;
    float _2536 = _2418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2538 = float(uint(_2532));
    float _2540 = trunc(_2528);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2548 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = as_type<float>(_2462) * _2538;
    float _2552 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    int _2556 = ~_2204;
    int _2558 = _2556 + 1;
    float _2560 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2562 = -_864;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2566 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2568 = trunc(_2550);
    float _2570 = precise::max(_2568, 0.0);
    uint _2572 = uint(_2570);
    float _2574 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2576 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2578 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2580 = -_864;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2560);
    int _2584 = int(_2448) + int(_2544);
    out.m_79.x = _2566;
    out.m_79.y = _2574;
    out.m_79.z = _2576;
    out.m_79.w = _2546;
    float _2586 = -_864;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2578);
    float _2590 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2592 = _892 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2594 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2588);
    float _2596 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2592);
    int _2598 = int(_2498) + int(_2572);
    int _2600 = ~_2360;
    int _2602 = _2600 + 1;
    float _2604 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2582);
    float _2606 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2564);
    float _2608 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2590);
    float _2610 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2612 = _2602 * _2598;
    int _2614 = _2612 + _2442;
    float _2616 = _2604 * _2524;
    int _2618 = _2372 ^ _2204;
    int _2620 = _2558 * _2584;
    int _2622 = _2620 + _2372;
    float _2624 = _2594 * _2524;
    bool _2626 = uint(_2614) >= uint(_2360);
    float _2628 = _2606 * _2524;
    float _2630 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2608);
    float _2632 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2610);
    bool _2634 = !_2626;
    int _2636 = _2634 ? 0 : (-1);
    float _2638 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2640 = uint(int(uint(_2618) >> uint(31)));
    float _2642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2644 = uint(_2622) >= uint(_2204);
    float _2646 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2632);
    int _2648 = ~_2636;
    int _2650 = _2598 + _2648;
    int _2652 = _2650 + 1;
    float _2654 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2638);
    int _2656 = ~int(_2640);
    int _2658 = _2656 + 1;
    float _2660 = _892 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2662 = _892 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2664 = _2652 ^ _2658;
    float _2666 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2660);
    bool _2668 = !_2644;
    int _2670 = _2668 ? 0 : (-1);
    float _2672 = fma(_2554, -2.0, 3.0);
    float _2674 = _2554 * _2554;
    bool _2676 = _2204 == 0;
    float _2678 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2662);
    int _2680 = ~_2658;
    int _2682 = _2680 + _2664;
    int _2684 = _2682 + 1;
    float _2686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2688 = _2674 * _2672;
    int _2690 = ~_2584;
    int _2692 = _2690 + _2670;
    int _2694 = _2692 + 1;
    float _2696 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2698 = !_2676;
    int _2700 = _2698 ? _2684 : (-1);
    float _2702 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2654);
    bool _2704 = _2204 == 0;
    int _2706 = _2204 * _2694;
    int _2708 = _2706 + _2372;
    float _2710 = float(_2700);
    float _2712 = fma(_2630, _2516, _2624);
    float _2714 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2716 = fma(_2696, _2492, -0.5);
    bool _2718 = !_2704;
    int _2720 = _2718 ? _2708 : (-1);
    float _2722 = -_384;
    float _2724 = fma(_2696, _2710, _2722);
    float _2726 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2728 = -_2688;
    float _2730 = _2728 + 1.0;
    float _2732 = float(_2720);
    float _2734 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2736 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    float _2738 = fma(_2730, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2688);
    float _2740 = fma(_2646, _2516, _2616);
    float _2742 = fma(_2734, _2474, -0.5);
    float _2744 = fma(_2734, _2732, _366);
    float _2746 = _2106 * _2738;
    float _2748 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2736);
    float _2750 = fma(_2702, _2516, _2628);
    float _2752 = fma(_530, _2742, _2744);
    float _2754 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2756 = fma(_538, _2716, _2724);
    float _2758 = fma(_2714, _2512, _2712);
    float _2760 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2748);
    float _2762 = _2078 * _2754;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _2760 + _1421;
    if (!_1401)
    {
        _2192 = 1.0;
    }
    float _2768 = _2192;
    float _2770 = _2162 * _1511;
    float _2772 = _2768;
    float _2774 = _2770;
    if (_1401)
    {
        bool _2776 = _1509 >= _1481;
        bool _2778 = isnan(_1509);
        bool _2780 = _2776 || _2778;
        bool _2782 = isnan(_1481);
        bool _2784 = _2780 || _2782;
        float _2786 = float(_2784);
        _2772 = _2786;
    }
    float _2788 = _2772;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2790 = _2766 * 0.5;
    float _2792 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2678);
    float _2794 = _2788 * _1810;
    float _2796 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2596);
    float _2798 = _1522 * _2770;
    float _2800 = -_2162;
    float _2802 = _2800 + 1.0;
    float _2804 = fma(_2792, _2512, _2740);
    float _2806 = _2048 * _2770;
    out.m_83.z = _2790;
    out.m_83.w = _1421;
    float _2808 = -_2764;
    float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2812 = _2752 + 0.5;
    float _2814 = _2756 + 0.5;
    float _2816 = fma(_2796, _2512, _2750);
    float _2818 = -_2794;
    float _2820 = fma(_2818, _2810, 1.0);
    float _2822 = precise::clamp(_2820, 0.0, 1.0);
    float _2824 = fma(_2044, _2798, _1516);
    float _2826 = fma(_2046, _2798, _1518);
    float _2828 = _1522 * _2802;
    float _2830 = fma(_1522, _2806, _1520);
    float _2832 = _2822 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2812;
    out.m_85.y = _2814;
    bool _2834 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2836 = isnan(_1834);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2842 = _2838 || _2840;
    out.gl_Position.x = _1453;
    out.gl_Position.y = _1455;
    out.gl_Position.z = _2760;
    out.gl_Position.w = _1421;
    out.m_87.x = _2832;
    out.m_89.x = _2824;
    out.m_89.y = _2826;
    out.m_89.z = _2830;
    out.m_89.w = _2828;
    float _2844 = _1421;
    float _2846 = _2822;
    float _2848 = _2798;
    if (!_2842)
    {
        _1746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2850 = _1746;
    out.m_91.x = _2758;
    out.m_91.y = _2804;
    out.m_91.z = _2816;
    float _2852 = _2850;
    float _2854 = _2850;
    if (!_2842)
    {
        _2844 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2856 = _2844;
    float _2858 = _2856;
    float _2860 = _2856;
    if (!_2842)
    {
        _1748 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2862 = _1748;
    float _2864 = _2862;
    float _2866 = _2862;
    if (!_2842)
    {
        _2846 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2868 = _2846;
    float _2870 = _2868;
    float _2872 = _2868;
    if (!_2842)
    {
        _2848 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2874 = _2848;
    float _2876 = _2874;
    float _2878 = _2874;
    if (!_2842)
    {
        _2774 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2880 = _2774;
    bool _2882 = !_2842;
    float _2884 = _2880;
    float _2886 = _2880;
    if (!_2882)
    {
        bool _2888 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2890 = isnan(_1834);
        bool _2892 = _2888 || _2890;
        bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2896 = _2892 || _2894;
        if (!_2896)
        {
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2900 = _1834 + _2898;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2904 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2902;
            float _2906 = 1.0 / _2904;
            float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2928 = _2900 * _2906;
            float _2930 = precise::clamp(_2928, 0.0, 1.0);
            float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2936 = fma(_2930, _2910, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2938 = fma(_2930, _2934, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2940 = fma(_2930, _2914, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2942 = fma(_2930, _2918, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2944 = fma(_2930, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2946 = fma(_2930, _2926, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2860 = _2936;
            _2878 = _2944;
            _2854 = _2938;
            _2872 = _2942;
            _2866 = _2940;
            _2886 = _2946;
            _2948 = true;
        }
        else
        {
            bool _2950 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2952 = isnan(_1834);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2958 = _2954 || _2956;
            if (!_2958)
            {
                _2852 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2960 = _2852;
            _2854 = _2960;
            if (!_2958)
            {
                _2858 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2962 = _2858;
            _2860 = _2962;
            if (!_2958)
            {
                _2864 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2964 = _2864;
            _2866 = _2964;
            if (!_2958)
            {
                _2870 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2966 = _2870;
            _2872 = _2966;
            if (!_2958)
            {
                _2876 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2968 = _2876;
            _2878 = _2968;
            if (!_2958)
            {
                _2884 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2970 = _2884;
            bool _2972 = !_2958;
            _2886 = _2970;
            if (!_2972)
            {
                bool _2974 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2976 = isnan(_1834);
                bool _2978 = _2974 || _2976;
                bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2982 = _2978 || _2980;
                if (!_2982)
                {
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2986 = _1834 + _2984;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2988;
                    float _2992 = 1.0 / _2990;
                    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3014 = _2986 * _2992;
                    float _3016 = precise::clamp(_3014, 0.0, 1.0);
                    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3022 = fma(_3016, _2996, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3024 = fma(_3016, _3020, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3026 = fma(_3016, _3000, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3028 = fma(_3016, _3004, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3030 = fma(_3016, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3032 = fma(_3016, _3012, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2860 = _3022;
                    _2878 = _3030;
                    _2854 = _3024;
                    _2872 = _3028;
                    _2866 = _3026;
                    _2886 = _3032;
                    _2948 = true;
                }
                else
                {
                    _2860 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2878 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2854 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2872 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2866 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2886 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2948 = false;
    float _3034 = _2860;
    float _3036 = _2878;
    float _3038 = _2854;
    float _3040 = _2872;
    float _3042 = _2866;
    float _3044 = _2886;
    float _3046 = fma(_2804, -0.5, 0.5);
    float _3048 = precise::clamp(_3046, 0.0, 1.0);
    float _3050 = -_3034;
    float _3052 = _3050 + _3036;
    float _3054 = -_3038;
    float _3056 = _3054 + _3040;
    float _3058 = -_3042;
    float _3060 = _3058 + _3044;
    bool _3062 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3064 = fma(_3048, _3052, _3034);
    float _3066 = fma(_3048, _3056, _3038);
    float _3068 = fma(_3048, _3060, _3042);
    float _3070 = _3064 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3072 = fma(_3066, 0.298911988735198974609375, _3070);
    float _3074 = fma(_3068, 0.114477999508380889892578125, _3072);
    out.m_95.x = 0.0;
    float _3076 = -_3074;
    float _3078 = _3066 + _3076;
    float _3080 = -_3074;
    float _3082 = _3064 + _3080;
    float _3084 = -_3074;
    float _3086 = _3068 + _3084;
    float _3088 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3090 = fma(_3078, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    float _3092 = fma(_3082, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    float _3094 = fma(_3086, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    out.m_59.x = _3088;
    out.m_97.x = _3090;
    out.m_97.y = _3092;
    out.m_97.z = _3094;
    if (!_3062)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3096 = -_1309;
    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3100 = -_1311;
    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3104 = -_1313;
    float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3108 = _3098 * _3098;
    float _3110 = fma(_3102, _3102, _3108);
    float _3112 = fma(_3106, _3106, _3110);
    float _3114 = rsqrt(_3112);
    float _3116 = sqrt(_3112);
    float _3118 = _3098 * _3114;
    float _3120 = _3102 * _3114;
    float _3122 = _3106 * _3114;
    float _3124 = -_1840;
    float _3126 = _3124 + _3118;
    float _3128 = -_1836;
    float _3130 = _3128 + _3120;
    float _3132 = -_1838;
    float _3134 = _3132 + _3122;
    float _3136 = _3126 * _3126;
    float _3138 = -_3116;
    float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3142 = fma(_3130, _3130, _3136);
    float _3144 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3146 = precise::clamp(_3144, 0.0, 1.0);
    float _3148 = fma(_3134, _3134, _3142);
    float _3150 = abs(_3146);
    float _3152 = log2(_3150);
    float _3154 = rsqrt(_3148);
    float _3156 = _3152 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3158 = exp2(_3156);
    float _3160 = _3126 * _3154;
    float _3162 = _3130 * _3154;
    float _3164 = _3134 * _3154;
    float _3166 = _2804 * _3160;
    float _3168 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3170 = precise::clamp(_3168, 0.0, 1.0);
    float _3172 = _2804 * _3118;
    float _3174 = fma(_2758, _3162, _3166);
    float _3176 = _3170 * _3170;
    float _3178 = fma(_2758, _3120, _3172);
    float _3180 = fma(_2816, _3164, _3174);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    float _3184 = _3176 + (-1.0);
    float _3186 = fma(_2816, _3122, _3178);
    float _3188 = precise::clamp(_3186, 0.0, 1.0);
    float _3190 = _3182 * _3182;
    float _3192 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3194 = fma(_3190, _3184, 1.0);
    float _3196 = -_3118;
    float _3198 = -_3192;
    float _3200 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3198);
    float _3202 = _3194 * _3194;
    float _3204 = -_3122;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3200);
    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3210 = _3206 + _3208;
    float _3212 = 1.0 / _3202;
    float _3214 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3216 = precise::clamp(_3214, 0.0, 1.0);
    float _3218 = _3158 * _3216;
    float _3220 = _3188 * _3218;
    float _3222 = _3176 * _3212;
    float _3224 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3226 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3228 = _3220 * _3222;
    float _3230 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3232 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3234 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3236 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3224;
    out.m_93.y = _3226;
    out.m_93.z = _3230;
    out.m_95.x = _3232;
    out.m_95.y = _3234;
    out.m_95.z = _3236;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2948 = false;
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
        float _3293 = as_type<float>(_132);
        out.gl_Position.z = _3293;
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
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_59.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3363 = as_type<float>(_170);
        out.gl_Position.z = _3363;
    }
    if (_162)
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
    float2 _3490 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3490, float2(0.0), isnan(_3490)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3490, float2(0.0), isnan(_3490)), level(0.0)).x;
    float _244 = in.m_63.y;
    float _246 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _248 = in.m_63.x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = in.m_63.z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _262 = 1.0 / _252;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _266 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _246);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _202 + _268;
    float _272 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _274 = 1.0 / _256;
    bool _276 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _284 = _280 || _282;
    float _286 = _272 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = _244 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _290 = _244 * 2.0;
    float _292 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _294 = int(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _298 = 1.0 + _296;
    float _300 = fma(_288, -2.0, _260);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _202 + _302;
    float _306 = _248 * 2.0;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _310 = _248 + _244;
    float _312 = _304 * _262;
    float _314 = floor(_290);
    float _316 = -_264;
    float _318 = fma(_308, 2.0, _316);
    float _320 = _258 * 2.0;
    float _322 = _310 + (-1.0);
    float _324 = _248 + _258;
    float _326 = _270 * _274;
    float _328 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _332 = log2(_330);
    float _334 = _244 + _258;
    float _336 = _324 + (-1.0);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _340 = float(_294);
    float _342 = _334 + (-1.0);
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _346 = floor(_306);
    bool _348 = _314 > 0.0;
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _352 = _314 >= 0.0;
    bool _354 = isnan(_314);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = _340 * _150;
    float _364 = -_150;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[76].x, _318);
    float _368 = floor(_320);
    float _370 = _332 * _150;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _300);
    float _386 = fma(_374, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_378, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _390 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _392 = int(_390);
    bool _394 = _346 > 0.0;
    float _396 = fma(_382, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _398 = _346 >= 0.0;
    bool _400 = isnan(_346);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    float _408 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _410 = _258 + (-0.5);
    int _412 = _360 ? 0 : 1;
    float _414 = exp2(_370);
    bool _416 = _368 > 0.0;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    bool _422 = _368 >= 0.0;
    bool _424 = isnan(_368);
    bool _426 = _422 || _424;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = fma(_420, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _442 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_202);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_434, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _456 = fma(_438, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = float(_392);
    float _460 = 1.0 / _298;
    float _462 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _408);
    bool _464 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_202);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _478 = -_414;
    float _480 = _478 + 1.0;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _484 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _486 = isnan(_202);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = 1.0 / _458;
    float _498 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _462);
    float _500 = _284 ? _480 : 0.0;
    float _502 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[78].z, _338);
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = -_494;
    float _516 = _514 + 1.0;
    float _518 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _520 = _406 ? 0 : 1;
    float _522 = _498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _524 = _474 * _516;
    float _526 = -_474;
    float _528 = _526 + 1.0;
    float _530 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _502);
    int _532 = ~_520;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _518);
    int _540 = _536;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_394)
    {
        int _544 = ~_520;
        int _546 = _544 + 1;
        _540 = _546;
    }
    int _548 = _540;
    float _550 = _452 * _528;
    float _552 = _496 * _150;
    if (_512)
    {
        float _554 = _500 * _460;
        _152 = _554;
    }
    float _556 = _152;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _568 = _566 != 0;
    float _570 = in.m_65.x;
    float _572 = in.m_65.y;
    float _574 = in.m_65.z;
    int _576 = _430 ? 0 : 1;
    float _578 = _440 * _550;
    float _580 = float(_548);
    float _582 = 1.0 / _522;
    bool _584 = !_564;
    int _586 = _584 ? 0 : 1;
    float _588 = _386 * _550;
    bool _590 = !_560;
    int _592 = _590 ? 0 : 1;
    float _594 = _454 * _550;
    bool _596 = !_568;
    int _598 = _596 ? 0 : 1;
    float _600 = _286 + _476;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _612 = _610 != 0;
    int _614 = ~_576;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (!_416)
    {
        int _622 = ~_576;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    bool _628 = !_604;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_608;
    int _634 = _632 ? 0 : 1;
    int _636 = abs(_630);
    float _638 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _640 = abs(_634);
    bool _642 = !_612;
    int _644 = _642 ? 0 : 1;
    float _646 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _638);
    float _648 = float(_640);
    float _650 = float(_626);
    float _652 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _646);
    float _654 = float(_636);
    float _656 = _648 * _580;
    int _658 = ~_412;
    int _660 = _658 + 1;
    int _662 = _660 + 1;
    float _664 = _652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _666 = _662;
    if (!_348)
    {
        int _668 = ~_412;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _656 * (-2.0);
    int _676 = abs(_644);
    float _678 = _654 * _650;
    float _680 = _664 + _522;
    float _682 = _244 + (-0.5);
    float _684 = fma(_674, _572, _572);
    float _686 = float(_672);
    float _688 = _680 * _582;
    float _690 = _688 * 0.5;
    float _692 = float(_676);
    float _694 = fma(_350, _674, _350);
    float _696 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _698 = _678 * (-2.0);
    float _700 = _692 * _686;
    float _702 = fma(_694, _556, _696);
    float _704 = fma(_328, _698, _328);
    float _706 = _248 + (-0.5);
    float _708 = in.m_67.x;
    float _710 = in.m_67.y;
    float _712 = in.m_67.z;
    float _714 = fma(_698, _570, _570);
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _718 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _716);
    float _720 = _700 * (-2.0);
    float _722 = _702 * 0.15915493667125701904296875;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].x, _714);
    float _726 = -_452;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _718;
    float _732 = in.m_69.x;
    float _734 = in.m_69.y;
    float _736 = in.m_69.z;
    float _738 = fma(_704, _556, _724);
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].x, _578);
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].y, _588);
    float _744 = fma(_720, _574, _574);
    float _746 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _748 = fma(_456, _524, _740);
    float _750 = fma(_344, _720, _344);
    float _752 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[196].z, _744);
    float _754 = fma(_396, _524, _746);
    float _756 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].x, _748);
    float _758 = fma(_388, _524, _742);
    float _760 = fma(_750, _556, _752);
    float _762 = _738 * 0.15915493667125701904296875;
    float _764 = _722 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].y, _758);
    float _770 = _756 * _708;
    float _772 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].z, _754);
    float _774 = _760 * 0.15915493667125701904296875;
    float _776 = _768 * _710;
    float _778 = _772 * _712;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _782 = _730 * _780;
    float _784 = _722 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _790 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    bool _794 = _782 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _796 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _798 = _782 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    float _802 = _762 * 6.283185482025146484375;
    float _804 = sin(_802);
    float _806 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _790 * _788;
    bool _810 = !_794;
    int _812 = _810 ? 0 : 1;
    float _814 = _796 * _792;
    float _816 = _806 * _800;
    float _818 = _600 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _820 = _774 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _600 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _826 = 2;
    if (!_794)
    {
        _826 = 1;
    }
    int _828 = _826;
    float _830 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _818);
    int _832 = _828;
    if (!_798)
    {
        _832 = _812;
    }
    int _834 = _832;
    float _836 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _824);
    bool _838 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _840 = isnan(0.5);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _846 = _842 || _844;
    float _848 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _830);
    float _850 = _762 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _804 * _766;
    float _856 = _804 * _786;
    int _858 = _834 << 6;
    float _860 = _848 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _862 = _774 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _804 * _822;
    float _868 = _866 * _808;
    float _870 = _852 * _766;
    float _872 = _852 * _786;
    float _874 = _852 * _822;
    float _876 = _786 * _822;
    float _878 = _766 * _822;
    float _880 = trunc(_860);
    int _882 = int(_880);
    float _884 = _874 * _808;
    float _886 = -_870;
    float _888 = fma(_864, _856, _886);
    float _890 = -_856;
    float _892 = fma(_864, _870, _890);
    float _894 = fma(_864, _872, _854);
    float _896 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _836);
    float _898 = fma(_864, _854, _872);
    float _900 = -_808;
    float _902 = _864 * _900;
    int _904 = _858 + 96;
    uint _907 = uint(int(uint(_904) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    float _923 = _896 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _925 = fma(_894, _816, _884);
    float _927 = fma(_876, _816, _902);
    float _929 = trunc(_923);
    int _931 = int(_929);
    float _933 = fma(_892, _814, _925);
    float _935 = fma(_888, _816, _868);
    int _937 = _858 + 104;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[int(_949)][_951];
    float _955 = fma(_878, _814, _927);
    float _957 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _959 = fma(_898, _814, _935);
    float _961 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _963 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _965 = _882 + _963;
    int _967 = _965 + 1;
    float _969 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _957);
    int _971 = _858 + 48;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    uint _975 = uint(int(uint(int(_973)) >> uint(2)));
    int _977 = int(_973) & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    int _981 = int(_973) + 1;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    int _985 = _981 & 3;
    float _987 = (*spvDescriptorSet0.vp_c15)._m0[int(_983)][_985];
    float _989 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _961);
    float _991 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    bool _993 = _967 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _995 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _997 = _931 + _995;
    int _999 = _997 + 1;
    float _1001 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1003 = _991 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1005 = _858 + 64;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = _967 | _999;
    float _1025 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1027 = _224 + _1003;
    bool _1029 = _1023 < 0;
    bool _1031 = _1029 || _993;
    float _1033 = _222 + _1025;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1037 = _1027 + _1035;
    int _1039 = _858 + 56;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.vp_c15)._m0[int(_1043)][_1045];
    int _1049 = int(_1041) + 1;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    int _1053 = _1049 & 3;
    float _1055 = (*spvDescriptorSet0.vp_c15)._m0[int(_1051)][_1053];
    bool _1057 = _999 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1031;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1063 = _1033 + _1061;
    float _1065 = _1037 * _1037;
    float _1067 = fma(_1063, _1063, _1065);
    int _1069 = _858 + 72;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.vp_c15)._m0[int(_1081)][_1083];
    float _1087 = sqrt(_1067);
    int _1089 = _967;
    float _1091 = _1027;
    float _1093 = _1037;
    if (!_1059)
    {
        int _1095 = _999 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1097 = _1095 + _967;
        _1089 = _1097;
    }
    int _1099 = _1089;
    float _1101 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1103 = _858 + 80;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.vp_c15)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
    float _1121 = _600 * _921;
    float _1123 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1101);
    float _1125 = _933;
    int _1127 = as_type<int>(_921);
    float _1129 = _1121;
    if (!_1059)
    {
        float _1131 = floor(_860);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = fma(_222, _913, _1121);
    if (!_1059)
    {
        int _1137 = _1099 << 2;
        _1127 = _1137;
    }
    int _1139 = _1127;
    float _1141 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1123);
    float _1143 = fma(_224, _945, _1135);
    int _1145 = _1139;
    float _1147 = _945;
    float _1149 = _1087;
    if (!_1059)
    {
        int _1151 = 12 & _1139;
        _1145 = _1151;
    }
    int _1153 = _1145;
    bool _1155 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = _1143 + _953;
    float _1159 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1161 = _600 * _987;
    float _1163 = 1.0 / _1157;
    float _1165 = _286 + _1159;
    float _1167 = fma(_222, _979, _1161);
    float _1169 = _600 * _1021;
    int _1171 = as_type<int>(_1167);
    float _1173 = _1165;
    float _1175 = _1157;
    if (!_1155)
    {
        _1147 = _1033;
    }
    float _1177 = _1147;
    float _1179 = fma(_222, _1013, _1169);
    float _1181 = fma(_224, _1047, _1167);
    float _1183 = _1177;
    if (!_1059)
    {
        uint _1185 = uint(int(uint(_1099) >> uint(2)));
        _1171 = int(_1185);
    }
    int _1187 = _1171;
    float _1189 = _1181 + _1055;
    int _1191 = _1187;
    if (!_1059)
    {
        int _1193 = _1187 << 4;
        int _1195 = _1193 + _1153;
        _1191 = _1195;
    }
    int _1197 = _1191;
    float _1199 = fma(_224, _1077, _1179);
    float _1201 = _1199 + _1085;
    bool _1203 = !_1155;
    if (!_1203)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1087 + _1207;
        float _1211 = _1165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1213 = rsqrt(_1067);
        float _1215 = _1209 * _1205;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1213 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1063, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1037, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = fma(_1165, _1225, _1237);
        _1173 = _1239;
        _1091 = _1235;
        _1183 = _1233;
        _1175 = _1217;
        _1149 = _1209;
    }
    float _1241 = _1173;
    float _1243 = _1091;
    float _1245 = _1183;
    float _1247 = _1175;
    float _1249 = _1149;
    float _1251 = _1247;
    float _1253 = _1249;
    float _1255 = _1245;
    if (_846)
    {
        _1251 = _1241;
    }
    float _1257 = _1251;
    float _1259 = _1257;
    if (_846)
    {
        _1253 = _1243;
    }
    float _1261 = _1253;
    float _1263 = _1261;
    if (!_846)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _286 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _222 + _1269;
        float _1273 = -_286;
        float _1275 = _1273 + _1241;
        float _1277 = -_222;
        float _1279 = _1277 + _1245;
        float _1281 = _1267 * _1267;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1285 = _224 + _1283;
        float _1287 = fma(_1271, _1271, _1281);
        float _1289 = fma(_1285, _1285, _1287);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = sqrt(_1289);
        float _1295 = precise::min(_1293, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1291;
        float _1299 = -_224;
        float _1301 = _1299 + _1243;
        float _1303 = fma(_1275, _1297, _286);
        float _1305 = fma(_1279, _1297, _222);
        float _1307 = fma(_1301, _1297, _224);
        _1259 = _1303;
        _1255 = _1305;
        _1263 = _1307;
    }
    float _1309 = _1259;
    float _1311 = _1255;
    float _1313 = _1263;
    int _1315 = _858 + 88;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1337 = _1189 * _1163;
    float _1339 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1341 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1343 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1335);
    float _1345 = _1201 * _1163;
    float _1347 = _1141;
    if (!_1059)
    {
        int _1349 = _1197 + 400;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
        int _1355 = int(_1351) & 3;
        float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
        _1347 = _1357;
    }
    float _1359 = _1347;
    float _1361 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1339);
    float _1363 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1341);
    bool _1365 = _1337 >= 0.0;
    float _1367 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1343);
    float _1369 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1371 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1361);
    float _1373 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1375 = _1337 <= 1.0;
    bool _1377 = _1375 && _1365;
    float _1379 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1381 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1369);
    float _1383 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1385 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1387 = _1345 >= 0.0;
    bool _1389 = _1387 && _1377;
    float _1391 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1393 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1395 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1381);
    float _1397 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1385);
    bool _1399 = _1345 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = -_1393;
    float _1405 = fma(_1403, _1391, 1.0);
    float _1407 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1409 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1397);
    float _1411 = _1055;
    if (!_1059)
    {
        float _1413 = floor(_923);
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1409);
    float _1423 = _600 * _1119;
    float _1425 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1419);
    float _1427 = 1.0 / _1421;
    float _1429 = _1423;
    if (_1401)
    {
        float _1431 = float(_834);
        _1093 = _1431;
    }
    float _1433 = _1093;
    float _1435 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1437 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1425);
    float _1439 = fma(_222, _1111, _1423);
    float _1441 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1435);
    float _1443 = log2(_1405);
    float _1445 = _1437;
    if (!_1059)
    {
        float _1447 = -_1415;
        float _1449 = _923 + _1447;
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1441);
    float _1455 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1437);
    float _1457 = fma(_224, _1323, _1439);
    if (!_1059)
    {
        float _1459 = -_1133;
        float _1461 = _860 + _1459;
        _1445 = _1461;
    }
    float _1463 = _1445;
    float _1465 = _1455 * _1427;
    float _1467 = _1457 + _1331;
    float _1469 = _1419;
    if (_1401)
    {
        float _1471 = rint(_1433);
        float _1473 = precise::max(_1471, 0.0);
        uint _1475 = uint(_1473);
        uint _1477 = clamp(_1475, 0u, 65535u);
        _1469 = as_type<float>(_1477);
    }
    float _1479 = _1469;
    float _1481 = _1467 * _1163;
    float _1483 = _1443 * 0.693147182464599609375;
    float _1485 = _1453 * _1427;
    float _1487 = fma(_1465, -0.5, 0.5);
    float _1489 = _1465;
    if (!_1059)
    {
        float _1491 = rint(_1359);
        float _1493 = precise::max(_1491, 0.0);
        uint _1495 = uint(_1493);
        uint _1497 = clamp(_1495, 0u, 65535u);
        _1489 = as_type<float>(_1497);
    }
    float _1499 = _1489;
    float _1501 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1503 = fma(_1485, 0.5, 0.5);
    float _1505 = _1467;
    if (_1401)
    {
        float3 _5523 = float3(_1337, _1345, float(as_type<int>(_1479)));
        float3 _5527 = select(_5523, float3(0.0), isnan(_5523));
        float _1507 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5527.xy, uint(rint(_5527.z)), _1481, level(0.0));
        _1505 = _1507;
    }
    float _1509 = _1505;
    float3 _5537 = float3(_1503, _1487, _1501);
    float _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5537, float3(0.0), isnan(_5537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5537, float3(0.0), isnan(_5537)), level(0.0)).x;
    float3 _5546 = float3(_1503, _1487, _1501);
    float4 _1514 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5546, float3(0.0), isnan(_5546)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5546, float3(0.0), isnan(_5546)), level(0.0)).xyzw;
    float _1516 = _1514.x;
    float _1518 = _1514.y;
    float _1520 = _1514.z;
    float _1522 = _1514.w;
    float _1524 = _1451;
    if (!_1059)
    {
        float3 _5569 = float3(_1463, _1451, float(as_type<int>(_1499)));
        float3 _5571 = select(_5569, float3(0.0), isnan(_5569));
        float _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5571.xy, uint(rint(_5571.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5571.xy, uint(rint(_5571.z)), level(0.0)).x;
        _1524 = _1526;
    }
    float _1528 = _1524;
    float _1530 = float(uint(_294));
    float _1532 = trunc(_552);
    int _1534 = int(_1532);
    bool _1536 = _294 == 0;
    int _1538 = abs(_592);
    int _1540 = abs(_598);
    float _1542 = 1.0 / _1530;
    float _1544 = float(uint(_1534));
    int _1546 = as_type<int>(_1542) + (-2);
    float _1548 = as_type<float>(_1546) * _1544;
    float _1550 = trunc(_1548);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = ~_294;
    int _1558 = _1556 + 1;
    int _1560 = ~_294;
    int _1562 = _1560 + 1;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = float(_116);
    bool _1570 = !_1566;
    float _1572 = _1570 ? 7.345489978790283203125 : 1.0;
    float _1574 = 1.0 / _1568;
    int _1576 = _1558 * int(_1554);
    int _1578 = _1576 + _1534;
    float _1580 = _1572 * _248;
    float _1582 = float(uint(_1578));
    float _1584 = as_type<float>(_1546) * _1582;
    float _1586 = floor(_1580);
    float _1588 = trunc(_1584);
    float _1590 = precise::max(_1588, 0.0);
    uint _1592 = uint(_1590);
    float _1594 = -_1586;
    float _1596 = _1580 + _1594;
    float _1598 = _1596 * _340;
    float _1600 = _362 * _1574;
    int _1602 = int(_1554) + int(_1592);
    float _1604 = float(_1534);
    float _1606 = trunc(_1598);
    int _1608 = int(_1606);
    int _1610 = _1562 * _1602;
    int _1612 = _1610 + _1534;
    bool _1614 = _1604 >= _340;
    bool _1616 = isnan(_1604);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan(_340);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    bool _1626 = uint(_1612) >= uint(_294);
    float _1628 = trunc(_1600);
    int _1630 = int(_1628);
    bool _1632 = !_1626;
    int _1634 = _1632 ? 0 : (-1);
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1638 = _1636 != 0;
    int _1640 = ~_1602;
    int _1642 = _1640 + _1634;
    int _1644 = _1642 + 1;
    float _1646 = trunc(_1624);
    int _1648 = int(_1646);
    bool _1650 = !_1638;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1656 = _1654 != 0;
    int _1658 = _294 * _1644;
    int _1660 = _1658 + _1534;
    int _1662 = _294 + (-1);
    int _1664 = abs(_1652);
    bool _1666 = !_1536;
    int _1668 = _1666 ? _1660 : (-1);
    float _1670 = as_type<float>(_1540);
    float _1672 = _1530;
    if (_1059)
    {
        _542 = 1.0;
    }
    float _1674 = _542;
    int _1676 = ~_1648;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1668 * _1680;
    int _1684 = abs(_586);
    int _1686 = _1648 * _1662;
    int _1688 = _1686 + _1682;
    bool _1690 = !_1656;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = _1688 * _1684;
    int _1696 = _1608 * _1664;
    int _1698 = _1696 + _1534;
    int _1700 = abs(_1692);
    int _1702 = _1630 * _1538;
    int _1704 = _1702 + _1694;
    int _1706 = _1698 * _1540;
    int _1708 = _1706 + _1704;
    int _1710 = _1608 * _1700;
    int _1712 = _1710 + _1708;
    int _1714 = ~_294;
    int _1716 = _1714 + 1;
    float _1718 = float(uint(_1712));
    float _1720 = as_type<float>(_1546) * _1718;
    float _1722 = trunc(_1720);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    int _1728 = _1716 * int(_1726);
    int _1730 = _1728 + _1712;
    float _1732 = float(uint(_1730));
    float _1734 = as_type<float>(_1546) * _1732;
    float _1736 = trunc(_1734);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = int(_1726) + int(_1740);
    float _1744 = _1674;
    float _1746 = _1509;
    float _1748 = _1511;
    if (!_1059)
    {
        int _1750 = _1099 << 4;
        int _1752 = _1750 + 2048;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        uint _1756 = uint(int(uint(int(_1754)) >> uint(2)));
        int _1758 = int(_1754) & 3;
        float _1760 = (*spvDescriptorSet0.vp_c15)._m0[int(_1756)][_1758];
        int _1762 = int(_1754) + 1;
        uint _1764 = uint(int(uint(_1762) >> uint(2)));
        int _1766 = _1762 & 3;
        float _1768 = (*spvDescriptorSet0.vp_c15)._m0[int(_1764)][_1766];
        int _1770 = _1752 + 8;
        uint _1772 = uint(int(uint(_1770) >> uint(2)));
        uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
        int _1776 = int(_1772) & 3;
        float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
        int _1780 = int(_1772) + 1;
        uint _1782 = uint(int(uint(_1780) >> uint(2)));
        int _1784 = _1780 & 3;
        float _1786 = (*spvDescriptorSet0.vp_c15)._m0[int(_1782)][_1784];
        float _1788 = _600 * _1768;
        float _1790 = fma(_222, _1760, _1788);
        float _1792 = fma(_224, _1778, _1790);
        float _1794 = _1792 + _1786;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        float _1798 = -_1796;
        float _1800 = _1798 + _1528;
        float _1802 = fma(_1800, 500.0, 1.5);
        float _1804 = exp2(_1802);
        float _1806 = 0.0 + _1804;
        float _1808 = precise::clamp(_1806, 0.0, 1.0);
        _1744 = _1808;
    }
    float _1810 = _1744;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1814 = _1309 + _1812;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1818 = _1311 + _1816;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1822 = _1313 + _1820;
    float _1824 = _1814 * _1814;
    float _1826 = fma(_1818, _1818, _1824);
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1830 = fma(_1822, _1822, _1826);
    float _1832 = rsqrt(_1830);
    float _1834 = sqrt(_1830);
    float _1836 = _1818 * _1832;
    float _1838 = _1822 * _1832;
    float _1840 = _1814 * _1832;
    float _1842 = precise::max(0.0, _1828);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1848 = _1844 * _1844;
    float _1850 = _1846 * _1846;
    float _1852 = -_1840;
    float _1854 = -_1842;
    float _1856 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1854);
    float _1858 = _1848 + _1850;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1528;
    float _1870 = _1842;
    float _1872 = _1828;
    float _1874 = _1866;
    float _1876 = _1844;
    float _1878 = _1846;
    float _1880 = _1848;
    float _1882 = _1850;
    if (_1862)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1884;
    }
    float _1886 = _1868;
    if (_1862)
    {
        float _1888 = _1856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = _1890;
    if (_1862)
    {
        float _1894 = rsqrt(_1858);
        _1872 = _1894;
    }
    float _1896 = _1872;
    float _1898 = _1896;
    if (_1862)
    {
        float _1900 = _1866 * _1886;
        _1874 = _1900;
    }
    float _1902 = _1874;
    if (_1862)
    {
        float _1904 = _1902 * 0.15915493667125701904296875;
        _1670 = _1904;
    }
    float _1906 = _1670;
    float _1908 = _222;
    if (_1862)
    {
        float _1910 = _1906 * 6.283185482025146484375;
        float _1912 = sin(_1910);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1902;
    if (_1862)
    {
        float _1918 = _1906 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1916 = _1920;
    }
    float _1922 = _1916;
    float _1924 = _1914;
    if (_1862)
    {
        float _1926 = fma(_1914, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1892 = _1926;
    }
    float _1928 = _1892;
    float _1930 = _1928;
    if (_1862)
    {
        float _1932 = _1896 * _1928;
        _1672 = _1932;
    }
    float _1934 = _1672;
    if (!_1862)
    {
        _1898 = _1856;
    }
    float _1936 = _1898;
    float _1938 = _1936;
    if (_1862)
    {
        float _1940 = _1922 + (-1.0);
        _1924 = _1940;
    }
    float _1942 = _1924;
    if (_1862)
    {
        float _1944 = _1844 * _1934;
        _1876 = _1944;
    }
    float _1946 = _1876;
    if (_1862)
    {
        float _1948 = _1846 * _1934;
        _1878 = _1948;
    }
    float _1950 = _1878;
    if (_1862)
    {
        float _1952 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1930 = _1952;
    }
    float _1954 = _1930;
    if (_1862)
    {
        float _1956 = _1946 * _1946;
        _1880 = _1956;
    }
    float _1958 = _1880;
    if (_1862)
    {
        float _1960 = _1950 * _1950;
        _1882 = _1960;
    }
    float _1962 = _1882;
    if (_1862)
    {
        float _1964 = fma(_1856, _1922, _1954);
        _1938 = _1964;
    }
    float _1966 = _1938;
    float _1968 = fma(_1966, _1966, _1958);
    float _1970 = _1968 + _1962;
    float _1972 = rsqrt(_1970);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = -_1978;
    float _1982 = _1980 + 1.0;
    float _1984 = abs(_1982);
    float _1986 = log2(_1984);
    float _1988 = _1972 * _1946;
    float _1990 = _1972 * _1966;
    float _1992 = _1972 * _1950;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1996 = -_1994;
    float _1998 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1996);
    float _2000 = -_1992;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1998);
    float _2004 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2006 = fma(_2002, -0.5, 0.5);
    float _2008 = fma(_2002, 0.5, 0.5);
    float _2010 = exp2(_2004);
    float _2012 = fma(_2008, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2014 = fma(_2008, _2012, -0.212114393711090087890625);
    float _2016 = _1990 + 1.0;
    float _2018 = sqrt(_2006);
    float _2020 = fma(_2008, _2014, 1.570728778839111328125);
    float _2022 = -_1990;
    float _2024 = fma(_2010, _2016, _2022);
    int _2026 = ~_294;
    int _2028 = _2026 + 1;
    float _2030 = float(uint(_1698));
    float _2032 = fma(_2024, 0.5, 0.5);
    float _2034 = _2018 * 0.636619746685028076171875;
    float _2036 = -_2020;
    float _2038 = fma(_2034, _2036, 1.0);
    float2 _6308 = float2(_2038, _2032);
    float3 _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6308, float2(0.0), isnan(_6308)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6308, float2(0.0), isnan(_6308)), level(0.0)).xyz;
    float _2044 = _2042.x;
    float _2046 = _2042.y;
    float _2048 = _2042.z;
    float _2050 = as_type<float>(_1546) * _2030;
    int _2052 = _2028 * _1742;
    int _2054 = _2052 + _1712;
    int _2056 = ~_294;
    int _2058 = _2056 + 1;
    float _2060 = in.m_71.x;
    bool _2062 = _244 > 0.5;
    float _2064 = abs(_782);
    float _2066 = log2(_2064);
    bool _2068 = uint(_2054) >= uint(_294);
    float _2070 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2072 = ~_294;
    int _2074 = _2072 + 1;
    float _2076 = -_242;
    float _2078 = _2076 + 1.0;
    bool _2080 = !_2068;
    int _2082 = _2080 ? 0 : (-1);
    out.m_73.x = _1311;
    out.m_73.y = _1309;
    out.m_73.z = _1313;
    float _2084 = trunc(_2050);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    int _2090 = ~_1742;
    int _2092 = _2090 + _2082;
    int _2094 = _2092 + 1;
    bool _2096 = _782 <= 8000.0;
    bool _2098 = isnan(_782);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(8000.0);
    bool _2104 = _2100 || _2102;
    float _2106 = float(_2104);
    int _2108 = _294 * _2094;
    int _2110 = _2108 + _1712;
    float _2112 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = exp2(_2070);
    bool _2116 = !_1536;
    int _2118 = _2116 ? _2110 : (-1);
    int _2120 = _2118 >> 31;
    int _2122 = _2074 * int(_2088);
    int _2124 = _2122 + _1698;
    int _2126 = _2118 & 3;
    bool _2128 = _2126 != 0;
    int _2130 = _2120 & 3;
    float _2132 = float(uint(_2124));
    int _2134 = _2118 + _2130;
    int _2136 = _2118 & 3;
    bool _2138 = _2136 != 0;
    float _2140 = as_type<float>(_1546) * _2132;
    int _2142 = _2134 >> 2;
    float _2144 = -_2114;
    float _2146 = _2144 + 1.0;
    bool _2148 = uint(_2126) > 1u;
    int _2150 = _2142 << 4;
    int _2152 = _2150 + 368;
    float _2154 = trunc(_2140);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    int _2160 = _2138 ? 0 : 1;
    float _2162 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    uint _2164 = uint(int(uint(_2152) >> uint(2)));
    uint _2166 = uint(int(uint(int(_2164)) >> uint(2)));
    int _2168 = int(_2164) & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    int _2172 = int(_2164) + 1;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    int _2176 = _2172 & 3;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[int(_2174)][_2176];
    bool _2180 = _2126 != 3;
    int _2182 = ~_2160;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2186;
    float _2190 = _2060;
    float _2192 = _2106;
    if (!_2148)
    {
        int _2194 = ~_2160;
        int _2196 = _2194 + 1;
        _2188 = _2196;
    }
    int _2198 = _2188;
    bool _2200 = uint(_2126) >= 2u;
    float _2202 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2204 = int(_2202);
    int _2206 = abs(_2198);
    int _2208 = int(_2088) + int(_2158);
    int _2210 = _2152 + 8;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    uint _2214 = uint(int(uint(int(_2212)) >> uint(2)));
    int _2216 = int(_2212) & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = int(_2212) + 1;
    uint _2222 = uint(int(uint(_2220) >> uint(2)));
    int _2224 = _2220 & 3;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[int(_2222)][_2224];
    int _2228 = _2200 ? 0 : 1;
    int _2230 = _2058 * _2208;
    int _2232 = _2230 + _1698;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    bool _2238 = uint(_2232) >= uint(_294);
    bool _2240 = !_2128;
    int _2242 = _2240 ? 0 : 1;
    bool _2244 = _2126 != 3;
    float _2246 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _2248 = !_2244;
    int _2250 = _2248 ? 0 : (-1);
    bool _2252 = !_2238;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2258 = _2256 != 0;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2262 = _2260 != 0;
    float _2264 = _2246 * _248;
    int _2266 = ~_2228;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = abs(_2242);
    int _2274 = _2270;
    if (_2180)
    {
        int _2276 = ~_2228;
        int _2278 = _2276 + 1;
        _2274 = _2278;
    }
    int _2280 = _2274;
    float _2282 = trunc(_2264);
    int _2284 = int(_2282);
    int _2286 = ~_2208;
    int _2288 = _2286 + _2254;
    int _2290 = _2288 + 1;
    int _2292 = abs(_2280);
    int _2294 = _294 * _2290;
    int _2296 = _2294 + _1698;
    int _2298 = ~_2206;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    int _2304 = abs(_2250);
    int _2306 = ~_2272;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2302 * as_type<int>(_2178);
    bool _2314 = !_2262;
    int _2316 = _2314 ? 0 : 1;
    int _2318 = _2310 * as_type<int>(_2170);
    int _2320 = _2318 + _2312;
    int _2322 = ~_2292;
    int _2324 = _2322 + 1;
    int _2326 = _2324 + 1;
    float _2328 = in.m_71.y;
    float _2330 = float(uint(_2204));
    int _2332 = abs(_2316);
    int _2334 = _2326 * as_type<int>(_2218);
    int _2336 = _2334 + _2320;
    int _2338 = ~_2304;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    float _2344 = 1.0 / _2330;
    int _2346 = ~_2332;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    int _2352 = _2342 * as_type<int>(_2226);
    int _2354 = _2352 + _2336;
    bool _2356 = !_1536;
    int _2358 = _2356 ? _2296 : (-1);
    int _2360 = abs(_2204);
    int _2362 = _2354 * _2350;
    int _2364 = _2284 << 4;
    int _2366 = _2364 + 1712;
    float _2368 = float(uint(_2360));
    int _2370 = _2358 * _2332;
    int _2372 = _2370 + _2362;
    uint _2374 = uint(int(uint(_2366) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    bool _2390 = _248 > 0.5;
    bool _2392 = _2390 && _2236;
    float _2394 = in.m_75.x;
    float _2396 = in.m_75.y;
    float _2398 = in.m_75.z;
    float _2400 = 1.0 / _2368;
    int _2402 = as_type<int>(_2344) + (-2);
    float _2404 = -_2328;
    float _2406 = _2404 + 1.0;
    float _2408 = float(uint(_2372));
    int _2410 = _2366 + 8;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    float _2420 = _2328;
    if (_2236)
    {
        _1129 = _2060;
    }
    float _2422 = _1129;
    float _2424 = as_type<float>(_2402) * _2408;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2430 = ~_2204;
    int _2432 = _2430 + 1;
    float _2434 = _2422;
    if (_2392)
    {
        float _2436 = -_2422;
        float _2438 = _2436 + 1.0;
        _2434 = _2438;
    }
    float _2440 = _2434;
    int _2442 = abs(_2372);
    float _2444 = trunc(_2424);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    bool _2450 = _734 != 0.0;
    bool _2452 = isnan(_734);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2462 = as_type<int>(_2400) + (-2);
    float _2464 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2466 = float(uint(_2442));
    bool _2468 = _732 == 0.0;
    bool _2470 = !_2458;
    bool _2472 = _2468 && _2470;
    if (_2236)
    {
        _2190 = _2440;
    }
    float _2474 = _2190;
    float _2476 = as_type<float>(_2462) * _2466;
    int _2478 = ~_2360;
    int _2480 = _2478 + 1;
    bool _2482 = _736 == 0.0;
    bool _2484 = _2482 && _2472;
    int _2486 = _2432 * int(_2448);
    int _2488 = _2486 + _2372;
    if (_2258)
    {
        float _2490 = _2062 ? _2406 : _2328;
        _2420 = _2490;
    }
    float _2492 = _2420;
    float _2494 = trunc(_2476);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2502 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2504 = _2398;
    float _2506 = _2394;
    float _2508 = _2396;
    if (!_2484)
    {
        float _2510 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2398);
        _2504 = _2510;
    }
    float _2512 = _2504;
    if (!_2484)
    {
        float _2514 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2394);
        _2506 = _2514;
    }
    float _2516 = _2506;
    float _2518 = float(uint(_2488));
    float _2520 = exp2(_2112);
    if (!_2484)
    {
        float _2522 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2396);
        _2508 = _2522;
    }
    float _2524 = _2508;
    float _2526 = _2380 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2528 = as_type<float>(_2402) * _2518;
    int _2530 = _2480 * int(_2498);
    int _2532 = _2530 + _2442;
    float _2534 = _2388 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_77.x = _2502;
    out.m_77.y = _2460;
    out.m_77.z = _2464;
    float _2536 = _2418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2538 = float(uint(_2532));
    float _2540 = trunc(_2528);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2548 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = as_type<float>(_2462) * _2538;
    float _2552 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    int _2556 = ~_2204;
    int _2558 = _2556 + 1;
    float _2560 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2562 = -_864;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2566 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2568 = trunc(_2550);
    float _2570 = precise::max(_2568, 0.0);
    uint _2572 = uint(_2570);
    float _2574 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2576 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2578 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2580 = -_864;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2560);
    int _2584 = int(_2448) + int(_2544);
    out.m_79.x = _2566;
    out.m_79.y = _2574;
    out.m_79.z = _2576;
    out.m_79.w = _2546;
    float _2586 = -_864;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2578);
    float _2590 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2592 = _892 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2594 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2588);
    float _2596 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2592);
    int _2598 = int(_2498) + int(_2572);
    int _2600 = ~_2360;
    int _2602 = _2600 + 1;
    float _2604 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2582);
    float _2606 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2564);
    float _2608 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2590);
    float _2610 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2612 = _2602 * _2598;
    int _2614 = _2612 + _2442;
    float _2616 = _2604 * _2524;
    int _2618 = _2372 ^ _2204;
    int _2620 = _2558 * _2584;
    int _2622 = _2620 + _2372;
    float _2624 = _2594 * _2524;
    bool _2626 = uint(_2614) >= uint(_2360);
    float _2628 = _2606 * _2524;
    float _2630 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2608);
    float _2632 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2610);
    bool _2634 = !_2626;
    int _2636 = _2634 ? 0 : (-1);
    float _2638 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2640 = uint(int(uint(_2618) >> uint(31)));
    float _2642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2644 = uint(_2622) >= uint(_2204);
    float _2646 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2632);
    int _2648 = ~_2636;
    int _2650 = _2598 + _2648;
    int _2652 = _2650 + 1;
    float _2654 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2638);
    int _2656 = ~int(_2640);
    int _2658 = _2656 + 1;
    float _2660 = _892 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2662 = _892 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2664 = _2652 ^ _2658;
    float _2666 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2660);
    bool _2668 = !_2644;
    int _2670 = _2668 ? 0 : (-1);
    float _2672 = fma(_2554, -2.0, 3.0);
    float _2674 = _2554 * _2554;
    bool _2676 = _2204 == 0;
    float _2678 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2662);
    int _2680 = ~_2658;
    int _2682 = _2680 + _2664;
    int _2684 = _2682 + 1;
    float _2686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2688 = _2674 * _2672;
    int _2690 = ~_2584;
    int _2692 = _2690 + _2670;
    int _2694 = _2692 + 1;
    float _2696 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2698 = !_2676;
    int _2700 = _2698 ? _2684 : (-1);
    float _2702 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2654);
    bool _2704 = _2204 == 0;
    int _2706 = _2204 * _2694;
    int _2708 = _2706 + _2372;
    float _2710 = float(_2700);
    float _2712 = fma(_2630, _2516, _2624);
    float _2714 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2716 = fma(_2696, _2492, -0.5);
    bool _2718 = !_2704;
    int _2720 = _2718 ? _2708 : (-1);
    float _2722 = -_384;
    float _2724 = fma(_2696, _2710, _2722);
    float _2726 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2728 = -_2688;
    float _2730 = _2728 + 1.0;
    float _2732 = float(_2720);
    float _2734 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2736 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    float _2738 = fma(_2730, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2688);
    float _2740 = fma(_2646, _2516, _2616);
    float _2742 = fma(_2734, _2474, -0.5);
    float _2744 = fma(_2734, _2732, _366);
    float _2746 = _2106 * _2738;
    float _2748 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2736);
    float _2750 = fma(_2702, _2516, _2628);
    float _2752 = fma(_530, _2742, _2744);
    float _2754 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2756 = fma(_538, _2716, _2724);
    float _2758 = fma(_2714, _2512, _2712);
    float _2760 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2748);
    float _2762 = _2078 * _2754;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _2760 + _1421;
    if (!_1401)
    {
        _2192 = 1.0;
    }
    float _2768 = _2192;
    float _2770 = _2162 * _1511;
    float _2772 = _2768;
    float _2774 = _2770;
    if (_1401)
    {
        bool _2776 = _1509 >= _1481;
        bool _2778 = isnan(_1509);
        bool _2780 = _2776 || _2778;
        bool _2782 = isnan(_1481);
        bool _2784 = _2780 || _2782;
        float _2786 = float(_2784);
        _2772 = _2786;
    }
    float _2788 = _2772;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2790 = _2766 * 0.5;
    float _2792 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2678);
    float _2794 = _2788 * _1810;
    float _2796 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2596);
    float _2798 = _1522 * _2770;
    float _2800 = -_2162;
    float _2802 = _2800 + 1.0;
    float _2804 = fma(_2792, _2512, _2740);
    float _2806 = _2048 * _2770;
    out.m_83.z = _2790;
    out.m_83.w = _1421;
    float _2808 = -_2764;
    float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2812 = _2752 + 0.5;
    float _2814 = _2756 + 0.5;
    float _2816 = fma(_2796, _2512, _2750);
    float _2818 = -_2794;
    float _2820 = fma(_2818, _2810, 1.0);
    float _2822 = precise::clamp(_2820, 0.0, 1.0);
    float _2824 = fma(_2044, _2798, _1516);
    float _2826 = fma(_2046, _2798, _1518);
    float _2828 = _1522 * _2802;
    float _2830 = fma(_1522, _2806, _1520);
    float _2832 = _2822 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2812;
    out.m_85.y = _2814;
    bool _2834 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2836 = isnan(_1834);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2842 = _2838 || _2840;
    out.gl_Position.x = _1453;
    out.gl_Position.y = _1455;
    out.gl_Position.z = _2760;
    out.gl_Position.w = _1421;
    out.m_87.x = _2832;
    out.m_89.x = _2824;
    out.m_89.y = _2826;
    out.m_89.z = _2830;
    out.m_89.w = _2828;
    float _2844 = _1421;
    float _2846 = _2822;
    float _2848 = _2798;
    if (!_2842)
    {
        _1746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2850 = _1746;
    out.m_91.x = _2758;
    out.m_91.y = _2804;
    out.m_91.z = _2816;
    float _2852 = _2850;
    float _2854 = _2850;
    if (!_2842)
    {
        _2844 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2856 = _2844;
    float _2858 = _2856;
    float _2860 = _2856;
    if (!_2842)
    {
        _1748 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2862 = _1748;
    float _2864 = _2862;
    float _2866 = _2862;
    if (!_2842)
    {
        _2846 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2868 = _2846;
    float _2870 = _2868;
    float _2872 = _2868;
    if (!_2842)
    {
        _2848 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2874 = _2848;
    float _2876 = _2874;
    float _2878 = _2874;
    if (!_2842)
    {
        _2774 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2880 = _2774;
    bool _2882 = !_2842;
    float _2884 = _2880;
    float _2886 = _2880;
    if (!_2882)
    {
        bool _2888 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2890 = isnan(_1834);
        bool _2892 = _2888 || _2890;
        bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2896 = _2892 || _2894;
        if (!_2896)
        {
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2900 = _1834 + _2898;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2904 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2902;
            float _2906 = 1.0 / _2904;
            float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2928 = _2900 * _2906;
            float _2930 = precise::clamp(_2928, 0.0, 1.0);
            float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2936 = fma(_2930, _2910, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2938 = fma(_2930, _2934, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2940 = fma(_2930, _2914, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2942 = fma(_2930, _2918, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2944 = fma(_2930, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2946 = fma(_2930, _2926, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2860 = _2936;
            _2878 = _2944;
            _2854 = _2938;
            _2872 = _2942;
            _2866 = _2940;
            _2886 = _2946;
            _2948 = true;
        }
        else
        {
            bool _2950 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2952 = isnan(_1834);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2958 = _2954 || _2956;
            if (!_2958)
            {
                _2852 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2960 = _2852;
            _2854 = _2960;
            if (!_2958)
            {
                _2858 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2962 = _2858;
            _2860 = _2962;
            if (!_2958)
            {
                _2864 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2964 = _2864;
            _2866 = _2964;
            if (!_2958)
            {
                _2870 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2966 = _2870;
            _2872 = _2966;
            if (!_2958)
            {
                _2876 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2968 = _2876;
            _2878 = _2968;
            if (!_2958)
            {
                _2884 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2970 = _2884;
            bool _2972 = !_2958;
            _2886 = _2970;
            if (!_2972)
            {
                bool _2974 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2976 = isnan(_1834);
                bool _2978 = _2974 || _2976;
                bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2982 = _2978 || _2980;
                if (!_2982)
                {
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2986 = _1834 + _2984;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2988;
                    float _2992 = 1.0 / _2990;
                    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3014 = _2986 * _2992;
                    float _3016 = precise::clamp(_3014, 0.0, 1.0);
                    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3022 = fma(_3016, _2996, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3024 = fma(_3016, _3020, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3026 = fma(_3016, _3000, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3028 = fma(_3016, _3004, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3030 = fma(_3016, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3032 = fma(_3016, _3012, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2860 = _3022;
                    _2878 = _3030;
                    _2854 = _3024;
                    _2872 = _3028;
                    _2866 = _3026;
                    _2886 = _3032;
                    _2948 = true;
                }
                else
                {
                    _2860 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2878 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2854 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2872 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2866 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2886 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2948 = false;
    float _3034 = _2860;
    float _3036 = _2878;
    float _3038 = _2854;
    float _3040 = _2872;
    float _3042 = _2866;
    float _3044 = _2886;
    float _3046 = fma(_2804, -0.5, 0.5);
    float _3048 = precise::clamp(_3046, 0.0, 1.0);
    float _3050 = -_3034;
    float _3052 = _3050 + _3036;
    float _3054 = -_3038;
    float _3056 = _3054 + _3040;
    float _3058 = -_3042;
    float _3060 = _3058 + _3044;
    bool _3062 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3064 = fma(_3048, _3052, _3034);
    float _3066 = fma(_3048, _3056, _3038);
    float _3068 = fma(_3048, _3060, _3042);
    float _3070 = _3064 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3072 = fma(_3066, 0.298911988735198974609375, _3070);
    float _3074 = fma(_3068, 0.114477999508380889892578125, _3072);
    out.m_95.x = 0.0;
    float _3076 = -_3074;
    float _3078 = _3066 + _3076;
    float _3080 = -_3074;
    float _3082 = _3064 + _3080;
    float _3084 = -_3074;
    float _3086 = _3068 + _3084;
    float _3088 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3090 = fma(_3078, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    float _3092 = fma(_3082, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    float _3094 = fma(_3086, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    out.m_59.x = _3088;
    out.m_97.x = _3090;
    out.m_97.y = _3092;
    out.m_97.z = _3094;
    if (!_3062)
    {
        return out;
    }
    float _3096 = -_1309;
    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3100 = -_1311;
    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3104 = -_1313;
    float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3108 = _3098 * _3098;
    float _3110 = fma(_3102, _3102, _3108);
    float _3112 = fma(_3106, _3106, _3110);
    float _3114 = rsqrt(_3112);
    float _3116 = sqrt(_3112);
    float _3118 = _3098 * _3114;
    float _3120 = _3102 * _3114;
    float _3122 = _3106 * _3114;
    float _3124 = -_1840;
    float _3126 = _3124 + _3118;
    float _3128 = -_1836;
    float _3130 = _3128 + _3120;
    float _3132 = -_1838;
    float _3134 = _3132 + _3122;
    float _3136 = _3126 * _3126;
    float _3138 = -_3116;
    float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3142 = fma(_3130, _3130, _3136);
    float _3144 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3146 = precise::clamp(_3144, 0.0, 1.0);
    float _3148 = fma(_3134, _3134, _3142);
    float _3150 = abs(_3146);
    float _3152 = log2(_3150);
    float _3154 = rsqrt(_3148);
    float _3156 = _3152 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3158 = exp2(_3156);
    float _3160 = _3126 * _3154;
    float _3162 = _3130 * _3154;
    float _3164 = _3134 * _3154;
    float _3166 = _2804 * _3160;
    float _3168 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3170 = precise::clamp(_3168, 0.0, 1.0);
    float _3172 = _2804 * _3118;
    float _3174 = fma(_2758, _3162, _3166);
    float _3176 = _3170 * _3170;
    float _3178 = fma(_2758, _3120, _3172);
    float _3180 = fma(_2816, _3164, _3174);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    float _3184 = _3176 + (-1.0);
    float _3186 = fma(_2816, _3122, _3178);
    float _3188 = precise::clamp(_3186, 0.0, 1.0);
    float _3190 = _3182 * _3182;
    float _3192 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3194 = fma(_3190, _3184, 1.0);
    float _3196 = -_3118;
    float _3198 = -_3192;
    float _3200 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3198);
    float _3202 = _3194 * _3194;
    float _3204 = -_3122;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3200);
    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3210 = _3206 + _3208;
    float _3212 = 1.0 / _3202;
    float _3214 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3216 = precise::clamp(_3214, 0.0, 1.0);
    float _3218 = _3158 * _3216;
    float _3220 = _3188 * _3218;
    float _3222 = _3176 * _3212;
    float _3224 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3226 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3228 = _3220 * _3222;
    float _3230 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3232 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3234 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3236 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3224;
    out.m_93.y = _3226;
    out.m_93.z = _3230;
    out.m_95.x = _3232;
    out.m_95.y = _3234;
    out.m_95.z = _3236;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2948 = false;
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
        float _3293 = as_type<float>(_132);
        out.gl_Position.z = _3293;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_61.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_116);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_59.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3363 = as_type<float>(_170);
        out.gl_Position.z = _3363;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float2 _3490 = float2(_236, _240);
    float _242 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3490, float2(0.0), isnan(_3490)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3490, float2(0.0), isnan(_3490)), level(0.0)).x;
    float _244 = in.m_63.y;
    float _246 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _248 = in.m_63.x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = in.m_63.z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _262 = 1.0 / _252;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _266 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _246);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _202 + _268;
    float _272 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _274 = 1.0 / _256;
    bool _276 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _284 = _280 || _282;
    float _286 = _272 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _288 = _244 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _290 = _244 * 2.0;
    float _292 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _294 = int(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _298 = 1.0 + _296;
    float _300 = fma(_288, -2.0, _260);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _202 + _302;
    float _306 = _248 * 2.0;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _310 = _248 + _244;
    float _312 = _304 * _262;
    float _314 = floor(_290);
    float _316 = -_264;
    float _318 = fma(_308, 2.0, _316);
    float _320 = _258 * 2.0;
    float _322 = _310 + (-1.0);
    float _324 = _248 + _258;
    float _326 = _270 * _274;
    float _328 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _332 = log2(_330);
    float _334 = _244 + _258;
    float _336 = _324 + (-1.0);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _340 = float(_294);
    float _342 = _334 + (-1.0);
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _346 = floor(_306);
    bool _348 = _314 > 0.0;
    float _350 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _352 = _314 >= 0.0;
    bool _354 = isnan(_314);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = _340 * _150;
    float _364 = -_150;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[76].x, _318);
    float _368 = floor(_320);
    float _370 = _332 * _150;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _300);
    float _386 = fma(_374, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = fma(_378, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _390 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _392 = int(_390);
    bool _394 = _346 > 0.0;
    float _396 = fma(_382, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _398 = _346 >= 0.0;
    bool _400 = isnan(_346);
    bool _402 = _398 || _400;
    bool _404 = isnan(0.0);
    bool _406 = _402 || _404;
    float _408 = _286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _410 = _258 + (-0.5);
    int _412 = _360 ? 0 : 1;
    float _414 = exp2(_370);
    bool _416 = _368 > 0.0;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    bool _422 = _368 >= 0.0;
    bool _424 = isnan(_368);
    bool _426 = _422 || _424;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = fma(_420, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _442 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_202);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_434, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _456 = fma(_438, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = float(_392);
    float _460 = 1.0 / _298;
    float _462 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[11].x, _408);
    bool _464 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_202);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _478 = -_414;
    float _480 = _478 + 1.0;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _484 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _486 = isnan(_202);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = 1.0 / _458;
    float _498 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[11].z, _462);
    float _500 = _284 ? _480 : 0.0;
    float _502 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[78].z, _338);
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = -_494;
    float _516 = _514 + 1.0;
    float _518 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _520 = _406 ? 0 : 1;
    float _522 = _498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _524 = _474 * _516;
    float _526 = -_474;
    float _528 = _526 + 1.0;
    float _530 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _502);
    int _532 = ~_520;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _518);
    int _540 = _536;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_394)
    {
        int _544 = ~_520;
        int _546 = _544 + 1;
        _540 = _546;
    }
    int _548 = _540;
    float _550 = _452 * _528;
    float _552 = _496 * _150;
    if (_512)
    {
        float _554 = _500 * _460;
        _152 = _554;
    }
    float _556 = _152;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _568 = _566 != 0;
    float _570 = in.m_65.x;
    float _572 = in.m_65.y;
    float _574 = in.m_65.z;
    int _576 = _430 ? 0 : 1;
    float _578 = _440 * _550;
    float _580 = float(_548);
    float _582 = 1.0 / _522;
    bool _584 = !_564;
    int _586 = _584 ? 0 : 1;
    float _588 = _386 * _550;
    bool _590 = !_560;
    int _592 = _590 ? 0 : 1;
    float _594 = _454 * _550;
    bool _596 = !_568;
    int _598 = _596 ? 0 : 1;
    float _600 = _286 + _476;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _608 = _606 != 0;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _612 = _610 != 0;
    int _614 = ~_576;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (!_416)
    {
        int _622 = ~_576;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    bool _628 = !_604;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_608;
    int _634 = _632 ? 0 : 1;
    int _636 = abs(_630);
    float _638 = _286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _640 = abs(_634);
    bool _642 = !_612;
    int _644 = _642 ? 0 : 1;
    float _646 = fma(_222, (*spvDescriptorSet0.vp_c8)._m0[10].x, _638);
    float _648 = float(_640);
    float _650 = float(_626);
    float _652 = fma(_224, (*spvDescriptorSet0.vp_c8)._m0[10].z, _646);
    float _654 = float(_636);
    float _656 = _648 * _580;
    int _658 = ~_412;
    int _660 = _658 + 1;
    int _662 = _660 + 1;
    float _664 = _652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _666 = _662;
    if (!_348)
    {
        int _668 = ~_412;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _656 * (-2.0);
    int _676 = abs(_644);
    float _678 = _654 * _650;
    float _680 = _664 + _522;
    float _682 = _244 + (-0.5);
    float _684 = fma(_674, _572, _572);
    float _686 = float(_672);
    float _688 = _680 * _582;
    float _690 = _688 * 0.5;
    float _692 = float(_676);
    float _694 = fma(_350, _674, _350);
    float _696 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].y, _684);
    float _698 = _678 * (-2.0);
    float _700 = _692 * _686;
    float _702 = fma(_694, _556, _696);
    float _704 = fma(_328, _698, _328);
    float _706 = _248 + (-0.5);
    float _708 = in.m_67.x;
    float _710 = in.m_67.y;
    float _712 = in.m_67.z;
    float _714 = fma(_698, _570, _570);
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _718 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _716);
    float _720 = _700 * (-2.0);
    float _722 = _702 * 0.15915493667125701904296875;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].x, _714);
    float _726 = -_452;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _718;
    float _732 = in.m_69.x;
    float _734 = in.m_69.y;
    float _736 = in.m_69.z;
    float _738 = fma(_704, _556, _724);
    float _740 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].x, _578);
    float _742 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].y, _588);
    float _744 = fma(_720, _574, _574);
    float _746 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _748 = fma(_456, _524, _740);
    float _750 = fma(_344, _720, _344);
    float _752 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[196].z, _744);
    float _754 = fma(_396, _524, _746);
    float _756 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].x, _748);
    float _758 = fma(_388, _524, _742);
    float _760 = fma(_750, _556, _752);
    float _762 = _738 * 0.15915493667125701904296875;
    float _764 = _722 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].y, _758);
    float _770 = _756 * _708;
    float _772 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[145].z, _754);
    float _774 = _760 * 0.15915493667125701904296875;
    float _776 = _768 * _710;
    float _778 = _772 * _712;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _782 = _730 * _780;
    float _784 = _722 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _734);
    float _790 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _736);
    bool _794 = _782 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _796 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _798 = _782 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _800 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _732);
    float _802 = _762 * 6.283185482025146484375;
    float _804 = sin(_802);
    float _806 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _790 * _788;
    bool _810 = !_794;
    int _812 = _810 ? 0 : 1;
    float _814 = _796 * _792;
    float _816 = _806 * _800;
    float _818 = _600 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _820 = _774 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _600 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _826 = 2;
    if (!_794)
    {
        _826 = 1;
    }
    int _828 = _826;
    float _830 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[126].x, _818);
    int _832 = _828;
    if (!_798)
    {
        _832 = _812;
    }
    int _834 = _832;
    float _836 = fma(_222, (*spvDescriptorSet0.vp_c15)._m0[127].x, _824);
    bool _838 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _840 = isnan(0.5);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _846 = _842 || _844;
    float _848 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[126].z, _830);
    float _850 = _762 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _804 * _766;
    float _856 = _804 * _786;
    int _858 = _834 << 6;
    float _860 = _848 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _862 = _774 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _804 * _822;
    float _868 = _866 * _808;
    float _870 = _852 * _766;
    float _872 = _852 * _786;
    float _874 = _852 * _822;
    float _876 = _786 * _822;
    float _878 = _766 * _822;
    float _880 = trunc(_860);
    int _882 = int(_880);
    float _884 = _874 * _808;
    float _886 = -_870;
    float _888 = fma(_864, _856, _886);
    float _890 = -_856;
    float _892 = fma(_864, _870, _890);
    float _894 = fma(_864, _872, _854);
    float _896 = fma(_224, (*spvDescriptorSet0.vp_c15)._m0[127].z, _836);
    float _898 = fma(_864, _854, _872);
    float _900 = -_808;
    float _902 = _864 * _900;
    int _904 = _858 + 96;
    uint _907 = uint(int(uint(_904) >> uint(2)));
    uint _909 = uint(int(uint(int(_907)) >> uint(2)));
    int _911 = int(_907) & 3;
    float _913 = (*spvDescriptorSet0.vp_c15)._m0[int(_909)][_911];
    int _915 = int(_907) + 1;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    int _919 = _915 & 3;
    float _921 = (*spvDescriptorSet0.vp_c15)._m0[int(_917)][_919];
    float _923 = _896 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _925 = fma(_894, _816, _884);
    float _927 = fma(_876, _816, _902);
    float _929 = trunc(_923);
    int _931 = int(_929);
    float _933 = fma(_892, _814, _925);
    float _935 = fma(_888, _816, _868);
    int _937 = _858 + 104;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.vp_c15)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[int(_949)][_951];
    float _955 = fma(_878, _814, _927);
    float _957 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _959 = fma(_898, _814, _935);
    float _961 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _963 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _965 = _882 + _963;
    int _967 = _965 + 1;
    float _969 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[26].x, _957);
    int _971 = _858 + 48;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    uint _975 = uint(int(uint(int(_973)) >> uint(2)));
    int _977 = int(_973) & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    int _981 = int(_973) + 1;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    int _985 = _981 & 3;
    float _987 = (*spvDescriptorSet0.vp_c15)._m0[int(_983)][_985];
    float _989 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[24].x, _961);
    float _991 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    bool _993 = _967 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _995 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _997 = _931 + _995;
    int _999 = _997 + 1;
    float _1001 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1003 = _991 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1005 = _858 + 64;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.vp_c15)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = _967 | _999;
    float _1025 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1027 = _224 + _1003;
    bool _1029 = _1023 < 0;
    bool _1031 = _1029 || _993;
    float _1033 = _222 + _1025;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1037 = _1027 + _1035;
    int _1039 = _858 + 56;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.vp_c15)._m0[int(_1043)][_1045];
    int _1049 = int(_1041) + 1;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    int _1053 = _1049 & 3;
    float _1055 = (*spvDescriptorSet0.vp_c15)._m0[int(_1051)][_1053];
    bool _1057 = _999 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1059 = _1057 || _1031;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1063 = _1033 + _1061;
    float _1065 = _1037 * _1037;
    float _1067 = fma(_1063, _1063, _1065);
    int _1069 = _858 + 72;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.vp_c15)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.vp_c15)._m0[int(_1081)][_1083];
    float _1087 = sqrt(_1067);
    int _1089 = _967;
    float _1091 = _1027;
    float _1093 = _1037;
    if (!_1059)
    {
        int _1095 = _999 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1097 = _1095 + _967;
        _1089 = _1097;
    }
    int _1099 = _1089;
    float _1101 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1103 = _858 + 80;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.vp_c15)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
    float _1121 = _600 * _921;
    float _1123 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1101);
    float _1125 = _933;
    int _1127 = as_type<int>(_921);
    float _1129 = _1121;
    if (!_1059)
    {
        float _1131 = floor(_860);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = fma(_222, _913, _1121);
    if (!_1059)
    {
        int _1137 = _1099 << 2;
        _1127 = _1137;
    }
    int _1139 = _1127;
    float _1141 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1123);
    float _1143 = fma(_224, _945, _1135);
    int _1145 = _1139;
    float _1147 = _945;
    float _1149 = _1087;
    if (!_1059)
    {
        int _1151 = 12 & _1139;
        _1145 = _1151;
    }
    int _1153 = _1145;
    bool _1155 = _1087 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = _1143 + _953;
    float _1159 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1161 = _600 * _987;
    float _1163 = 1.0 / _1157;
    float _1165 = _286 + _1159;
    float _1167 = fma(_222, _979, _1161);
    float _1169 = _600 * _1021;
    int _1171 = as_type<int>(_1167);
    float _1173 = _1165;
    float _1175 = _1157;
    if (!_1155)
    {
        _1147 = _1033;
    }
    float _1177 = _1147;
    float _1179 = fma(_222, _1013, _1169);
    float _1181 = fma(_224, _1047, _1167);
    float _1183 = _1177;
    if (!_1059)
    {
        uint _1185 = uint(int(uint(_1099) >> uint(2)));
        _1171 = int(_1185);
    }
    int _1187 = _1171;
    float _1189 = _1181 + _1055;
    int _1191 = _1187;
    if (!_1059)
    {
        int _1193 = _1187 << 4;
        int _1195 = _1193 + _1153;
        _1191 = _1195;
    }
    int _1197 = _1191;
    float _1199 = fma(_224, _1077, _1179);
    float _1201 = _1199 + _1085;
    bool _1203 = !_1155;
    if (!_1203)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1087 + _1207;
        float _1211 = _1165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1213 = rsqrt(_1067);
        float _1215 = _1209 * _1205;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1213 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1063, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1037, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = fma(_1165, _1225, _1237);
        _1173 = _1239;
        _1091 = _1235;
        _1183 = _1233;
        _1175 = _1217;
        _1149 = _1209;
    }
    float _1241 = _1173;
    float _1243 = _1091;
    float _1245 = _1183;
    float _1247 = _1175;
    float _1249 = _1149;
    float _1251 = _1247;
    float _1253 = _1249;
    float _1255 = _1245;
    if (_846)
    {
        _1251 = _1241;
    }
    float _1257 = _1251;
    float _1259 = _1257;
    if (_846)
    {
        _1253 = _1243;
    }
    float _1261 = _1253;
    float _1263 = _1261;
    if (!_846)
    {
        float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1267 = _286 + _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1271 = _222 + _1269;
        float _1273 = -_286;
        float _1275 = _1273 + _1241;
        float _1277 = -_222;
        float _1279 = _1277 + _1245;
        float _1281 = _1267 * _1267;
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1285 = _224 + _1283;
        float _1287 = fma(_1271, _1271, _1281);
        float _1289 = fma(_1285, _1285, _1287);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = sqrt(_1289);
        float _1295 = precise::min(_1293, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1291;
        float _1299 = -_224;
        float _1301 = _1299 + _1243;
        float _1303 = fma(_1275, _1297, _286);
        float _1305 = fma(_1279, _1297, _222);
        float _1307 = fma(_1301, _1297, _224);
        _1259 = _1303;
        _1255 = _1305;
        _1263 = _1307;
    }
    float _1309 = _1259;
    float _1311 = _1255;
    float _1313 = _1263;
    int _1315 = _858 + 88;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1335 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1337 = _1189 * _1163;
    float _1339 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1341 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1333);
    float _1343 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1335);
    float _1345 = _1201 * _1163;
    float _1347 = _1141;
    if (!_1059)
    {
        int _1349 = _1197 + 400;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
        int _1355 = int(_1351) & 3;
        float _1357 = (*spvDescriptorSet0.vp_c15)._m0[int(_1353)][_1355];
        _1347 = _1357;
    }
    float _1359 = _1347;
    float _1361 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1339);
    float _1363 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1341);
    bool _1365 = _1337 >= 0.0;
    float _1367 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1343);
    float _1369 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1371 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1361);
    float _1373 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1375 = _1337 <= 1.0;
    bool _1377 = _1375 && _1365;
    float _1379 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1381 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1369);
    float _1383 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1385 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1387 = _1345 >= 0.0;
    bool _1389 = _1387 && _1377;
    float _1391 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1393 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1395 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1381);
    float _1397 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1385);
    bool _1399 = _1345 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = -_1393;
    float _1405 = fma(_1403, _1391, 1.0);
    float _1407 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1409 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1397);
    float _1411 = _1055;
    if (!_1059)
    {
        float _1413 = floor(_923);
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1409);
    float _1423 = _600 * _1119;
    float _1425 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1419);
    float _1427 = 1.0 / _1421;
    float _1429 = _1423;
    if (_1401)
    {
        float _1431 = float(_834);
        _1093 = _1431;
    }
    float _1433 = _1093;
    float _1435 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1437 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1425);
    float _1439 = fma(_222, _1111, _1423);
    float _1441 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1435);
    float _1443 = log2(_1405);
    float _1445 = _1437;
    if (!_1059)
    {
        float _1447 = -_1415;
        float _1449 = _923 + _1447;
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1441);
    float _1455 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1437);
    float _1457 = fma(_224, _1323, _1439);
    if (!_1059)
    {
        float _1459 = -_1133;
        float _1461 = _860 + _1459;
        _1445 = _1461;
    }
    float _1463 = _1445;
    float _1465 = _1455 * _1427;
    float _1467 = _1457 + _1331;
    float _1469 = _1419;
    if (_1401)
    {
        float _1471 = rint(_1433);
        float _1473 = precise::max(_1471, 0.0);
        uint _1475 = uint(_1473);
        uint _1477 = clamp(_1475, 0u, 65535u);
        _1469 = as_type<float>(_1477);
    }
    float _1479 = _1469;
    float _1481 = _1467 * _1163;
    float _1483 = _1443 * 0.693147182464599609375;
    float _1485 = _1453 * _1427;
    float _1487 = fma(_1465, -0.5, 0.5);
    float _1489 = _1465;
    if (!_1059)
    {
        float _1491 = rint(_1359);
        float _1493 = precise::max(_1491, 0.0);
        uint _1495 = uint(_1493);
        uint _1497 = clamp(_1495, 0u, 65535u);
        _1489 = as_type<float>(_1497);
    }
    float _1499 = _1489;
    float _1501 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1503 = fma(_1485, 0.5, 0.5);
    float _1505 = _1467;
    if (_1401)
    {
        float3 _5523 = float3(_1337, _1345, float(as_type<int>(_1479)));
        float3 _5527 = select(_5523, float3(0.0), isnan(_5523));
        float _1507 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5527.xy, uint(rint(_5527.z)), _1481, level(0.0));
        _1505 = _1507;
    }
    float _1509 = _1505;
    float3 _5537 = float3(_1503, _1487, _1501);
    float _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5537, float3(0.0), isnan(_5537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5537, float3(0.0), isnan(_5537)), level(0.0)).x;
    float3 _5546 = float3(_1503, _1487, _1501);
    float4 _1514 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5546, float3(0.0), isnan(_5546)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5546, float3(0.0), isnan(_5546)), level(0.0)).xyzw;
    float _1516 = _1514.x;
    float _1518 = _1514.y;
    float _1520 = _1514.z;
    float _1522 = _1514.w;
    float _1524 = _1451;
    if (!_1059)
    {
        float3 _5569 = float3(_1463, _1451, float(as_type<int>(_1499)));
        float3 _5571 = select(_5569, float3(0.0), isnan(_5569));
        float _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5571.xy, uint(rint(_5571.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5571.xy, uint(rint(_5571.z)), level(0.0)).x;
        _1524 = _1526;
    }
    float _1528 = _1524;
    float _1530 = float(uint(_294));
    float _1532 = trunc(_552);
    int _1534 = int(_1532);
    bool _1536 = _294 == 0;
    int _1538 = abs(_592);
    int _1540 = abs(_598);
    float _1542 = 1.0 / _1530;
    float _1544 = float(uint(_1534));
    int _1546 = as_type<int>(_1542) + (-2);
    float _1548 = as_type<float>(_1546) * _1544;
    float _1550 = trunc(_1548);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = ~_294;
    int _1558 = _1556 + 1;
    int _1560 = ~_294;
    int _1562 = _1560 + 1;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = float(_116);
    bool _1570 = !_1566;
    float _1572 = _1570 ? 7.345489978790283203125 : 1.0;
    float _1574 = 1.0 / _1568;
    int _1576 = _1558 * int(_1554);
    int _1578 = _1576 + _1534;
    float _1580 = _1572 * _248;
    float _1582 = float(uint(_1578));
    float _1584 = as_type<float>(_1546) * _1582;
    float _1586 = floor(_1580);
    float _1588 = trunc(_1584);
    float _1590 = precise::max(_1588, 0.0);
    uint _1592 = uint(_1590);
    float _1594 = -_1586;
    float _1596 = _1580 + _1594;
    float _1598 = _1596 * _340;
    float _1600 = _362 * _1574;
    int _1602 = int(_1554) + int(_1592);
    float _1604 = float(_1534);
    float _1606 = trunc(_1598);
    int _1608 = int(_1606);
    int _1610 = _1562 * _1602;
    int _1612 = _1610 + _1534;
    bool _1614 = _1604 >= _340;
    bool _1616 = isnan(_1604);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan(_340);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    bool _1626 = uint(_1612) >= uint(_294);
    float _1628 = trunc(_1600);
    int _1630 = int(_1628);
    bool _1632 = !_1626;
    int _1634 = _1632 ? 0 : (-1);
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1638 = _1636 != 0;
    int _1640 = ~_1602;
    int _1642 = _1640 + _1634;
    int _1644 = _1642 + 1;
    float _1646 = trunc(_1624);
    int _1648 = int(_1646);
    bool _1650 = !_1638;
    int _1652 = _1650 ? 0 : 1;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1656 = _1654 != 0;
    int _1658 = _294 * _1644;
    int _1660 = _1658 + _1534;
    int _1662 = _294 + (-1);
    int _1664 = abs(_1652);
    bool _1666 = !_1536;
    int _1668 = _1666 ? _1660 : (-1);
    float _1670 = as_type<float>(_1540);
    float _1672 = _1530;
    if (_1059)
    {
        _542 = 1.0;
    }
    float _1674 = _542;
    int _1676 = ~_1648;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1668 * _1680;
    int _1684 = abs(_586);
    int _1686 = _1648 * _1662;
    int _1688 = _1686 + _1682;
    bool _1690 = !_1656;
    int _1692 = _1690 ? 0 : 1;
    int _1694 = _1688 * _1684;
    int _1696 = _1608 * _1664;
    int _1698 = _1696 + _1534;
    int _1700 = abs(_1692);
    int _1702 = _1630 * _1538;
    int _1704 = _1702 + _1694;
    int _1706 = _1698 * _1540;
    int _1708 = _1706 + _1704;
    int _1710 = _1608 * _1700;
    int _1712 = _1710 + _1708;
    int _1714 = ~_294;
    int _1716 = _1714 + 1;
    float _1718 = float(uint(_1712));
    float _1720 = as_type<float>(_1546) * _1718;
    float _1722 = trunc(_1720);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    int _1728 = _1716 * int(_1726);
    int _1730 = _1728 + _1712;
    float _1732 = float(uint(_1730));
    float _1734 = as_type<float>(_1546) * _1732;
    float _1736 = trunc(_1734);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = int(_1726) + int(_1740);
    float _1744 = _1674;
    float _1746 = _1509;
    float _1748 = _1511;
    if (!_1059)
    {
        int _1750 = _1099 << 4;
        int _1752 = _1750 + 2048;
        uint _1754 = uint(int(uint(_1752) >> uint(2)));
        uint _1756 = uint(int(uint(int(_1754)) >> uint(2)));
        int _1758 = int(_1754) & 3;
        float _1760 = (*spvDescriptorSet0.vp_c15)._m0[int(_1756)][_1758];
        int _1762 = int(_1754) + 1;
        uint _1764 = uint(int(uint(_1762) >> uint(2)));
        int _1766 = _1762 & 3;
        float _1768 = (*spvDescriptorSet0.vp_c15)._m0[int(_1764)][_1766];
        int _1770 = _1752 + 8;
        uint _1772 = uint(int(uint(_1770) >> uint(2)));
        uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
        int _1776 = int(_1772) & 3;
        float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
        int _1780 = int(_1772) + 1;
        uint _1782 = uint(int(uint(_1780) >> uint(2)));
        int _1784 = _1780 & 3;
        float _1786 = (*spvDescriptorSet0.vp_c15)._m0[int(_1782)][_1784];
        float _1788 = _600 * _1768;
        float _1790 = fma(_222, _1760, _1788);
        float _1792 = fma(_224, _1778, _1790);
        float _1794 = _1792 + _1786;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        float _1798 = -_1796;
        float _1800 = _1798 + _1528;
        float _1802 = fma(_1800, 500.0, 1.5);
        float _1804 = exp2(_1802);
        float _1806 = 0.0 + _1804;
        float _1808 = precise::clamp(_1806, 0.0, 1.0);
        _1744 = _1808;
    }
    float _1810 = _1744;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1814 = _1309 + _1812;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1818 = _1311 + _1816;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1822 = _1313 + _1820;
    float _1824 = _1814 * _1814;
    float _1826 = fma(_1818, _1818, _1824);
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1830 = fma(_1822, _1822, _1826);
    float _1832 = rsqrt(_1830);
    float _1834 = sqrt(_1830);
    float _1836 = _1818 * _1832;
    float _1838 = _1822 * _1832;
    float _1840 = _1814 * _1832;
    float _1842 = precise::max(0.0, _1828);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1848 = _1844 * _1844;
    float _1850 = _1846 * _1846;
    float _1852 = -_1840;
    float _1854 = -_1842;
    float _1856 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1854);
    float _1858 = _1848 + _1850;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1528;
    float _1870 = _1842;
    float _1872 = _1828;
    float _1874 = _1866;
    float _1876 = _1844;
    float _1878 = _1846;
    float _1880 = _1848;
    float _1882 = _1850;
    if (_1862)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1884;
    }
    float _1886 = _1868;
    if (_1862)
    {
        float _1888 = _1856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = _1890;
    if (_1862)
    {
        float _1894 = rsqrt(_1858);
        _1872 = _1894;
    }
    float _1896 = _1872;
    float _1898 = _1896;
    if (_1862)
    {
        float _1900 = _1866 * _1886;
        _1874 = _1900;
    }
    float _1902 = _1874;
    if (_1862)
    {
        float _1904 = _1902 * 0.15915493667125701904296875;
        _1670 = _1904;
    }
    float _1906 = _1670;
    float _1908 = _222;
    if (_1862)
    {
        float _1910 = _1906 * 6.283185482025146484375;
        float _1912 = sin(_1910);
        _1908 = _1912;
    }
    float _1914 = _1908;
    float _1916 = _1902;
    if (_1862)
    {
        float _1918 = _1906 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1916 = _1920;
    }
    float _1922 = _1916;
    float _1924 = _1914;
    if (_1862)
    {
        float _1926 = fma(_1914, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1892 = _1926;
    }
    float _1928 = _1892;
    float _1930 = _1928;
    if (_1862)
    {
        float _1932 = _1896 * _1928;
        _1672 = _1932;
    }
    float _1934 = _1672;
    if (!_1862)
    {
        _1898 = _1856;
    }
    float _1936 = _1898;
    float _1938 = _1936;
    if (_1862)
    {
        float _1940 = _1922 + (-1.0);
        _1924 = _1940;
    }
    float _1942 = _1924;
    if (_1862)
    {
        float _1944 = _1844 * _1934;
        _1876 = _1944;
    }
    float _1946 = _1876;
    if (_1862)
    {
        float _1948 = _1846 * _1934;
        _1878 = _1948;
    }
    float _1950 = _1878;
    if (_1862)
    {
        float _1952 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1930 = _1952;
    }
    float _1954 = _1930;
    if (_1862)
    {
        float _1956 = _1946 * _1946;
        _1880 = _1956;
    }
    float _1958 = _1880;
    if (_1862)
    {
        float _1960 = _1950 * _1950;
        _1882 = _1960;
    }
    float _1962 = _1882;
    if (_1862)
    {
        float _1964 = fma(_1856, _1922, _1954);
        _1938 = _1964;
    }
    float _1966 = _1938;
    float _1968 = fma(_1966, _1966, _1958);
    float _1970 = _1968 + _1962;
    float _1972 = rsqrt(_1970);
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = -_1978;
    float _1982 = _1980 + 1.0;
    float _1984 = abs(_1982);
    float _1986 = log2(_1984);
    float _1988 = _1972 * _1946;
    float _1990 = _1972 * _1966;
    float _1992 = _1972 * _1950;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1996 = -_1994;
    float _1998 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1996);
    float _2000 = -_1992;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1998);
    float _2004 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2006 = fma(_2002, -0.5, 0.5);
    float _2008 = fma(_2002, 0.5, 0.5);
    float _2010 = exp2(_2004);
    float _2012 = fma(_2008, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2014 = fma(_2008, _2012, -0.212114393711090087890625);
    float _2016 = _1990 + 1.0;
    float _2018 = sqrt(_2006);
    float _2020 = fma(_2008, _2014, 1.570728778839111328125);
    float _2022 = -_1990;
    float _2024 = fma(_2010, _2016, _2022);
    int _2026 = ~_294;
    int _2028 = _2026 + 1;
    float _2030 = float(uint(_1698));
    float _2032 = fma(_2024, 0.5, 0.5);
    float _2034 = _2018 * 0.636619746685028076171875;
    float _2036 = -_2020;
    float _2038 = fma(_2034, _2036, 1.0);
    float2 _6308 = float2(_2038, _2032);
    float3 _2042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6308, float2(0.0), isnan(_6308)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6308, float2(0.0), isnan(_6308)), level(0.0)).xyz;
    float _2044 = _2042.x;
    float _2046 = _2042.y;
    float _2048 = _2042.z;
    float _2050 = as_type<float>(_1546) * _2030;
    int _2052 = _2028 * _1742;
    int _2054 = _2052 + _1712;
    int _2056 = ~_294;
    int _2058 = _2056 + 1;
    float _2060 = in.m_71.x;
    bool _2062 = _244 > 0.5;
    float _2064 = abs(_782);
    float _2066 = log2(_2064);
    bool _2068 = uint(_2054) >= uint(_294);
    float _2070 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2072 = ~_294;
    int _2074 = _2072 + 1;
    float _2076 = -_242;
    float _2078 = _2076 + 1.0;
    bool _2080 = !_2068;
    int _2082 = _2080 ? 0 : (-1);
    out.m_73.x = _1311;
    out.m_73.y = _1309;
    out.m_73.z = _1313;
    float _2084 = trunc(_2050);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    int _2090 = ~_1742;
    int _2092 = _2090 + _2082;
    int _2094 = _2092 + 1;
    bool _2096 = _782 <= 8000.0;
    bool _2098 = isnan(_782);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(8000.0);
    bool _2104 = _2100 || _2102;
    float _2106 = float(_2104);
    int _2108 = _294 * _2094;
    int _2110 = _2108 + _1712;
    float _2112 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = exp2(_2070);
    bool _2116 = !_1536;
    int _2118 = _2116 ? _2110 : (-1);
    int _2120 = _2118 >> 31;
    int _2122 = _2074 * int(_2088);
    int _2124 = _2122 + _1698;
    int _2126 = _2118 & 3;
    bool _2128 = _2126 != 0;
    int _2130 = _2120 & 3;
    float _2132 = float(uint(_2124));
    int _2134 = _2118 + _2130;
    int _2136 = _2118 & 3;
    bool _2138 = _2136 != 0;
    float _2140 = as_type<float>(_1546) * _2132;
    int _2142 = _2134 >> 2;
    float _2144 = -_2114;
    float _2146 = _2144 + 1.0;
    bool _2148 = uint(_2126) > 1u;
    int _2150 = _2142 << 4;
    int _2152 = _2150 + 368;
    float _2154 = trunc(_2140);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    int _2160 = _2138 ? 0 : 1;
    float _2162 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    uint _2164 = uint(int(uint(_2152) >> uint(2)));
    uint _2166 = uint(int(uint(int(_2164)) >> uint(2)));
    int _2168 = int(_2164) & 3;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[int(_2166)][_2168];
    int _2172 = int(_2164) + 1;
    uint _2174 = uint(int(uint(_2172) >> uint(2)));
    int _2176 = _2172 & 3;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[int(_2174)][_2176];
    bool _2180 = _2126 != 3;
    int _2182 = ~_2160;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2186;
    float _2190 = _2060;
    float _2192 = _2106;
    if (!_2148)
    {
        int _2194 = ~_2160;
        int _2196 = _2194 + 1;
        _2188 = _2196;
    }
    int _2198 = _2188;
    bool _2200 = uint(_2126) >= 2u;
    float _2202 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2204 = int(_2202);
    int _2206 = abs(_2198);
    int _2208 = int(_2088) + int(_2158);
    int _2210 = _2152 + 8;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    uint _2214 = uint(int(uint(int(_2212)) >> uint(2)));
    int _2216 = int(_2212) & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = int(_2212) + 1;
    uint _2222 = uint(int(uint(_2220) >> uint(2)));
    int _2224 = _2220 & 3;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[int(_2222)][_2224];
    int _2228 = _2200 ? 0 : 1;
    int _2230 = _2058 * _2208;
    int _2232 = _2230 + _1698;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    bool _2238 = uint(_2232) >= uint(_294);
    bool _2240 = !_2128;
    int _2242 = _2240 ? 0 : 1;
    bool _2244 = _2126 != 3;
    float _2246 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _2248 = !_2244;
    int _2250 = _2248 ? 0 : (-1);
    bool _2252 = !_2238;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2258 = _2256 != 0;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2262 = _2260 != 0;
    float _2264 = _2246 * _248;
    int _2266 = ~_2228;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    int _2272 = abs(_2242);
    int _2274 = _2270;
    if (_2180)
    {
        int _2276 = ~_2228;
        int _2278 = _2276 + 1;
        _2274 = _2278;
    }
    int _2280 = _2274;
    float _2282 = trunc(_2264);
    int _2284 = int(_2282);
    int _2286 = ~_2208;
    int _2288 = _2286 + _2254;
    int _2290 = _2288 + 1;
    int _2292 = abs(_2280);
    int _2294 = _294 * _2290;
    int _2296 = _2294 + _1698;
    int _2298 = ~_2206;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    int _2304 = abs(_2250);
    int _2306 = ~_2272;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2302 * as_type<int>(_2178);
    bool _2314 = !_2262;
    int _2316 = _2314 ? 0 : 1;
    int _2318 = _2310 * as_type<int>(_2170);
    int _2320 = _2318 + _2312;
    int _2322 = ~_2292;
    int _2324 = _2322 + 1;
    int _2326 = _2324 + 1;
    float _2328 = in.m_71.y;
    float _2330 = float(uint(_2204));
    int _2332 = abs(_2316);
    int _2334 = _2326 * as_type<int>(_2218);
    int _2336 = _2334 + _2320;
    int _2338 = ~_2304;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    float _2344 = 1.0 / _2330;
    int _2346 = ~_2332;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    int _2352 = _2342 * as_type<int>(_2226);
    int _2354 = _2352 + _2336;
    bool _2356 = !_1536;
    int _2358 = _2356 ? _2296 : (-1);
    int _2360 = abs(_2204);
    int _2362 = _2354 * _2350;
    int _2364 = _2284 << 4;
    int _2366 = _2364 + 1712;
    float _2368 = float(uint(_2360));
    int _2370 = _2358 * _2332;
    int _2372 = _2370 + _2362;
    uint _2374 = uint(int(uint(_2366) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    bool _2390 = _248 > 0.5;
    bool _2392 = _2390 && _2236;
    float _2394 = in.m_75.x;
    float _2396 = in.m_75.y;
    float _2398 = in.m_75.z;
    float _2400 = 1.0 / _2368;
    int _2402 = as_type<int>(_2344) + (-2);
    float _2404 = -_2328;
    float _2406 = _2404 + 1.0;
    float _2408 = float(uint(_2372));
    int _2410 = _2366 + 8;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    float _2420 = _2328;
    if (_2236)
    {
        _1129 = _2060;
    }
    float _2422 = _1129;
    float _2424 = as_type<float>(_2402) * _2408;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2430 = ~_2204;
    int _2432 = _2430 + 1;
    float _2434 = _2422;
    if (_2392)
    {
        float _2436 = -_2422;
        float _2438 = _2436 + 1.0;
        _2434 = _2438;
    }
    float _2440 = _2434;
    int _2442 = abs(_2372);
    float _2444 = trunc(_2424);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    bool _2450 = _734 != 0.0;
    bool _2452 = isnan(_734);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2462 = as_type<int>(_2400) + (-2);
    float _2464 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2466 = float(uint(_2442));
    bool _2468 = _732 == 0.0;
    bool _2470 = !_2458;
    bool _2472 = _2468 && _2470;
    if (_2236)
    {
        _2190 = _2440;
    }
    float _2474 = _2190;
    float _2476 = as_type<float>(_2462) * _2466;
    int _2478 = ~_2360;
    int _2480 = _2478 + 1;
    bool _2482 = _736 == 0.0;
    bool _2484 = _2482 && _2472;
    int _2486 = _2432 * int(_2448);
    int _2488 = _2486 + _2372;
    if (_2258)
    {
        float _2490 = _2062 ? _2406 : _2328;
        _2420 = _2490;
    }
    float _2492 = _2420;
    float _2494 = trunc(_2476);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2502 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2504 = _2398;
    float _2506 = _2394;
    float _2508 = _2396;
    if (!_2484)
    {
        float _2510 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2398);
        _2504 = _2510;
    }
    float _2512 = _2504;
    if (!_2484)
    {
        float _2514 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2394);
        _2506 = _2514;
    }
    float _2516 = _2506;
    float _2518 = float(uint(_2488));
    float _2520 = exp2(_2112);
    if (!_2484)
    {
        float _2522 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2396);
        _2508 = _2522;
    }
    float _2524 = _2508;
    float _2526 = _2380 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2528 = as_type<float>(_2402) * _2518;
    int _2530 = _2480 * int(_2498);
    int _2532 = _2530 + _2442;
    float _2534 = _2388 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_77.x = _2502;
    out.m_77.y = _2460;
    out.m_77.z = _2464;
    float _2536 = _2418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2538 = float(uint(_2532));
    float _2540 = trunc(_2528);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2548 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = as_type<float>(_2462) * _2538;
    float _2552 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    int _2556 = ~_2204;
    int _2558 = _2556 + 1;
    float _2560 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2562 = -_864;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2566 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2568 = trunc(_2550);
    float _2570 = precise::max(_2568, 0.0);
    uint _2572 = uint(_2570);
    float _2574 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2576 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2578 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2580 = -_864;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2560);
    int _2584 = int(_2448) + int(_2544);
    out.m_79.x = _2566;
    out.m_79.y = _2574;
    out.m_79.z = _2576;
    out.m_79.w = _2546;
    float _2586 = -_864;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2578);
    float _2590 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2592 = _892 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2594 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2588);
    float _2596 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2592);
    int _2598 = int(_2498) + int(_2572);
    int _2600 = ~_2360;
    int _2602 = _2600 + 1;
    float _2604 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2582);
    float _2606 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2564);
    float _2608 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2590);
    float _2610 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2612 = _2602 * _2598;
    int _2614 = _2612 + _2442;
    float _2616 = _2604 * _2524;
    int _2618 = _2372 ^ _2204;
    int _2620 = _2558 * _2584;
    int _2622 = _2620 + _2372;
    float _2624 = _2594 * _2524;
    bool _2626 = uint(_2614) >= uint(_2360);
    float _2628 = _2606 * _2524;
    float _2630 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2608);
    float _2632 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2610);
    bool _2634 = !_2626;
    int _2636 = _2634 ? 0 : (-1);
    float _2638 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2640 = uint(int(uint(_2618) >> uint(31)));
    float _2642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2644 = uint(_2622) >= uint(_2204);
    float _2646 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2632);
    int _2648 = ~_2636;
    int _2650 = _2598 + _2648;
    int _2652 = _2650 + 1;
    float _2654 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2638);
    int _2656 = ~int(_2640);
    int _2658 = _2656 + 1;
    float _2660 = _892 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2662 = _892 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2664 = _2652 ^ _2658;
    float _2666 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2660);
    bool _2668 = !_2644;
    int _2670 = _2668 ? 0 : (-1);
    float _2672 = fma(_2554, -2.0, 3.0);
    float _2674 = _2554 * _2554;
    bool _2676 = _2204 == 0;
    float _2678 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2662);
    int _2680 = ~_2658;
    int _2682 = _2680 + _2664;
    int _2684 = _2682 + 1;
    float _2686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2688 = _2674 * _2672;
    int _2690 = ~_2584;
    int _2692 = _2690 + _2670;
    int _2694 = _2692 + 1;
    float _2696 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2698 = !_2676;
    int _2700 = _2698 ? _2684 : (-1);
    float _2702 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2654);
    bool _2704 = _2204 == 0;
    int _2706 = _2204 * _2694;
    int _2708 = _2706 + _2372;
    float _2710 = float(_2700);
    float _2712 = fma(_2630, _2516, _2624);
    float _2714 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2716 = fma(_2696, _2492, -0.5);
    bool _2718 = !_2704;
    int _2720 = _2718 ? _2708 : (-1);
    float _2722 = -_384;
    float _2724 = fma(_2696, _2710, _2722);
    float _2726 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2728 = -_2688;
    float _2730 = _2728 + 1.0;
    float _2732 = float(_2720);
    float _2734 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2736 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    float _2738 = fma(_2730, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2688);
    float _2740 = fma(_2646, _2516, _2616);
    float _2742 = fma(_2734, _2474, -0.5);
    float _2744 = fma(_2734, _2732, _366);
    float _2746 = _2106 * _2738;
    float _2748 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2736);
    float _2750 = fma(_2702, _2516, _2628);
    float _2752 = fma(_530, _2742, _2744);
    float _2754 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2756 = fma(_538, _2716, _2724);
    float _2758 = fma(_2714, _2512, _2712);
    float _2760 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2748);
    float _2762 = _2078 * _2754;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _2760 + _1421;
    if (!_1401)
    {
        _2192 = 1.0;
    }
    float _2768 = _2192;
    float _2770 = _2162 * _1511;
    float _2772 = _2768;
    float _2774 = _2770;
    if (_1401)
    {
        bool _2776 = _1509 >= _1481;
        bool _2778 = isnan(_1509);
        bool _2780 = _2776 || _2778;
        bool _2782 = isnan(_1481);
        bool _2784 = _2780 || _2782;
        float _2786 = float(_2784);
        _2772 = _2786;
    }
    float _2788 = _2772;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _2790 = _2766 * 0.5;
    float _2792 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2678);
    float _2794 = _2788 * _1810;
    float _2796 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2596);
    float _2798 = _1522 * _2770;
    float _2800 = -_2162;
    float _2802 = _2800 + 1.0;
    float _2804 = fma(_2792, _2512, _2740);
    float _2806 = _2048 * _2770;
    out.m_83.z = _2790;
    out.m_83.w = _1421;
    float _2808 = -_2764;
    float _2810 = fma(_2808, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2812 = _2752 + 0.5;
    float _2814 = _2756 + 0.5;
    float _2816 = fma(_2796, _2512, _2750);
    float _2818 = -_2794;
    float _2820 = fma(_2818, _2810, 1.0);
    float _2822 = precise::clamp(_2820, 0.0, 1.0);
    float _2824 = fma(_2044, _2798, _1516);
    float _2826 = fma(_2046, _2798, _1518);
    float _2828 = _1522 * _2802;
    float _2830 = fma(_1522, _2806, _1520);
    float _2832 = _2822 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2812;
    out.m_85.y = _2814;
    bool _2834 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2836 = isnan(_1834);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2842 = _2838 || _2840;
    out.gl_Position.x = _1453;
    out.gl_Position.y = _1455;
    out.gl_Position.z = _2760;
    out.gl_Position.w = _1421;
    out.m_87.x = _2832;
    out.m_89.x = _2824;
    out.m_89.y = _2826;
    out.m_89.z = _2830;
    out.m_89.w = _2828;
    float _2844 = _1421;
    float _2846 = _2822;
    float _2848 = _2798;
    if (!_2842)
    {
        _1746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2850 = _1746;
    out.m_91.x = _2758;
    out.m_91.y = _2804;
    out.m_91.z = _2816;
    float _2852 = _2850;
    float _2854 = _2850;
    if (!_2842)
    {
        _2844 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2856 = _2844;
    float _2858 = _2856;
    float _2860 = _2856;
    if (!_2842)
    {
        _1748 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2862 = _1748;
    float _2864 = _2862;
    float _2866 = _2862;
    if (!_2842)
    {
        _2846 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2868 = _2846;
    float _2870 = _2868;
    float _2872 = _2868;
    if (!_2842)
    {
        _2848 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2874 = _2848;
    float _2876 = _2874;
    float _2878 = _2874;
    if (!_2842)
    {
        _2774 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2880 = _2774;
    bool _2882 = !_2842;
    float _2884 = _2880;
    float _2886 = _2880;
    if (!_2882)
    {
        bool _2888 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2890 = isnan(_1834);
        bool _2892 = _2888 || _2890;
        bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2896 = _2892 || _2894;
        if (!_2896)
        {
            float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2900 = _1834 + _2898;
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2904 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2902;
            float _2906 = 1.0 / _2904;
            float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2928 = _2900 * _2906;
            float _2930 = precise::clamp(_2928, 0.0, 1.0);
            float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2936 = fma(_2930, _2910, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2938 = fma(_2930, _2934, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2940 = fma(_2930, _2914, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2942 = fma(_2930, _2918, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2944 = fma(_2930, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2946 = fma(_2930, _2926, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2860 = _2936;
            _2878 = _2944;
            _2854 = _2938;
            _2872 = _2942;
            _2866 = _2940;
            _2886 = _2946;
            _2948 = true;
        }
        else
        {
            bool _2950 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2952 = isnan(_1834);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2958 = _2954 || _2956;
            if (!_2958)
            {
                _2852 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2960 = _2852;
            _2854 = _2960;
            if (!_2958)
            {
                _2858 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2962 = _2858;
            _2860 = _2962;
            if (!_2958)
            {
                _2864 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2964 = _2864;
            _2866 = _2964;
            if (!_2958)
            {
                _2870 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2966 = _2870;
            _2872 = _2966;
            if (!_2958)
            {
                _2876 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2968 = _2876;
            _2878 = _2968;
            if (!_2958)
            {
                _2884 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2970 = _2884;
            bool _2972 = !_2958;
            _2886 = _2970;
            if (!_2972)
            {
                bool _2974 = _1834 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2976 = isnan(_1834);
                bool _2978 = _2974 || _2976;
                bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2982 = _2978 || _2980;
                if (!_2982)
                {
                    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2986 = _1834 + _2984;
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2988;
                    float _2992 = 1.0 / _2990;
                    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2996 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3014 = _2986 * _2992;
                    float _3016 = precise::clamp(_3014, 0.0, 1.0);
                    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3022 = fma(_3016, _2996, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3024 = fma(_3016, _3020, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3026 = fma(_3016, _3000, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3028 = fma(_3016, _3004, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3030 = fma(_3016, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3032 = fma(_3016, _3012, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2860 = _3022;
                    _2878 = _3030;
                    _2854 = _3024;
                    _2872 = _3028;
                    _2866 = _3026;
                    _2886 = _3032;
                    _2948 = true;
                }
                else
                {
                    _2860 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2878 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2854 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2872 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2866 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2886 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2948 = false;
    float _3034 = _2860;
    float _3036 = _2878;
    float _3038 = _2854;
    float _3040 = _2872;
    float _3042 = _2866;
    float _3044 = _2886;
    float _3046 = fma(_2804, -0.5, 0.5);
    float _3048 = precise::clamp(_3046, 0.0, 1.0);
    float _3050 = -_3034;
    float _3052 = _3050 + _3036;
    float _3054 = -_3038;
    float _3056 = _3054 + _3040;
    float _3058 = -_3042;
    float _3060 = _3058 + _3044;
    bool _3062 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3064 = fma(_3048, _3052, _3034);
    float _3066 = fma(_3048, _3056, _3038);
    float _3068 = fma(_3048, _3060, _3042);
    float _3070 = _3064 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3072 = fma(_3066, 0.298911988735198974609375, _3070);
    float _3074 = fma(_3068, 0.114477999508380889892578125, _3072);
    out.m_95.x = 0.0;
    float _3076 = -_3074;
    float _3078 = _3066 + _3076;
    float _3080 = -_3074;
    float _3082 = _3064 + _3080;
    float _3084 = -_3074;
    float _3086 = _3068 + _3084;
    float _3088 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3090 = fma(_3078, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    float _3092 = fma(_3082, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    float _3094 = fma(_3086, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3074);
    out.m_59.x = _3088;
    out.m_97.x = _3090;
    out.m_97.y = _3092;
    out.m_97.z = _3094;
    if (!_3062)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3096 = -_1309;
    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3100 = -_1311;
    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3104 = -_1313;
    float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3108 = _3098 * _3098;
    float _3110 = fma(_3102, _3102, _3108);
    float _3112 = fma(_3106, _3106, _3110);
    float _3114 = rsqrt(_3112);
    float _3116 = sqrt(_3112);
    float _3118 = _3098 * _3114;
    float _3120 = _3102 * _3114;
    float _3122 = _3106 * _3114;
    float _3124 = -_1840;
    float _3126 = _3124 + _3118;
    float _3128 = -_1836;
    float _3130 = _3128 + _3120;
    float _3132 = -_1838;
    float _3134 = _3132 + _3122;
    float _3136 = _3126 * _3126;
    float _3138 = -_3116;
    float _3140 = _3138 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3142 = fma(_3130, _3130, _3136);
    float _3144 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3146 = precise::clamp(_3144, 0.0, 1.0);
    float _3148 = fma(_3134, _3134, _3142);
    float _3150 = abs(_3146);
    float _3152 = log2(_3150);
    float _3154 = rsqrt(_3148);
    float _3156 = _3152 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3158 = exp2(_3156);
    float _3160 = _3126 * _3154;
    float _3162 = _3130 * _3154;
    float _3164 = _3134 * _3154;
    float _3166 = _2804 * _3160;
    float _3168 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _3170 = precise::clamp(_3168, 0.0, 1.0);
    float _3172 = _2804 * _3118;
    float _3174 = fma(_2758, _3162, _3166);
    float _3176 = _3170 * _3170;
    float _3178 = fma(_2758, _3120, _3172);
    float _3180 = fma(_2816, _3164, _3174);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    float _3184 = _3176 + (-1.0);
    float _3186 = fma(_2816, _3122, _3178);
    float _3188 = precise::clamp(_3186, 0.0, 1.0);
    float _3190 = _3182 * _3182;
    float _3192 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3194 = fma(_3190, _3184, 1.0);
    float _3196 = -_3118;
    float _3198 = -_3192;
    float _3200 = fma(_3196, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3198);
    float _3202 = _3194 * _3194;
    float _3204 = -_3122;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3200);
    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3210 = _3206 + _3208;
    float _3212 = 1.0 / _3202;
    float _3214 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3216 = precise::clamp(_3214, 0.0, 1.0);
    float _3218 = _3158 * _3216;
    float _3220 = _3188 * _3218;
    float _3222 = _3176 * _3212;
    float _3224 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3226 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3228 = _3220 * _3222;
    float _3230 = _3220 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _3232 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3234 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3236 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3224;
    out.m_93.y = _3226;
    out.m_93.z = _3230;
    out.m_95.x = _3232;
    out.m_95.y = _3234;
    out.m_95.z = _3236;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

