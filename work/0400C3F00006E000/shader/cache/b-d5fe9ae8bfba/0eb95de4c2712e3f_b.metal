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
    float4 m_81 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_97 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1934 = false;
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
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2241 = as_type<float>(_134);
        out.gl_Position.z = _2241;
    }
    if (!_120)
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
    if (_148)
    {
        float _154 = float(_116);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
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
        _136 = as_type<int>(_166);
    }
    int _168 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_168);
        out.gl_Position.z = _2309;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_63.w;
    float _172 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_61.x;
    float _186 = in.m_61.y;
    float _188 = in.m_61.z;
    float _190 = in.m_56.x;
    float _192 = in.m_56.y;
    float _194 = in.m_56.z;
    float _196 = 0.0;
    float _198 = _172;
    if (!_182)
    {
        float _200 = _172 * _172;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _204;
    if (!_182)
    {
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_182;
    float _214 = _210;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _172 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _172);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _244;
    }
    float _246 = _214;
    bool _248 = !_182;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _172 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _198 = _268;
    }
    float _270 = _198;
    float _272 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_270, _186, _272);
    float _280 = fma(_270, _184, _274);
    float _282 = fma(_270, _188, _276);
    float _284 = fma(_278, _170, _192);
    float _286 = fma(_280, _170, _190);
    float _288 = fma(_282, _170, _194);
    float _290 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _290);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _294);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _296);
    float _302 = _298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _304 = _300 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _308 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _310 = floor(_306);
    float _312 = floor(_308);
    float _314 = -_310;
    float _316 = _306 + _314;
    float _318 = -_312;
    float _320 = _308 + _318;
    float2 _2558 = float2(_316, _320);
    float _322 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2558, float2(0.0), isnan(_2558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2558, float2(0.0), isnan(_2558)), level(0.0)).x;
    float _324 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = in.m_63.x;
    float _328 = in.m_63.y;
    float _330 = in.m_63.z;
    float _332 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _334 = in.m_65.x;
    float _336 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _338 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _340 = in.m_65.y;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = in.m_65.z;
    float _346 = _342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _348 = _342 + _338;
    float _350 = fma(_302, (*spvDescriptorSet0.vp_c8)._m0[11].x, _346);
    float _352 = _348 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _354 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].z, _350);
    float _356 = _342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _364 = fma(_302, (*spvDescriptorSet0.vp_c8)._m0[10].x, _356);
    float _366 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _370 = 1.0 / _362;
    float _372 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].z, _364);
    float _374 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _378 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[127].x, _352);
    float _380 = _372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _382 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[127].z, _378);
    float _384 = _380 + _362;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _388 = _382 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _390 = _386 * _368;
    float _392 = _348 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _394 = _384 * _370;
    float _396 = _394 * 0.5;
    float _398 = trunc(_388);
    int _400 = int(_398);
    float _402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[30].w, _402);
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _340);
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _410 = _406 * _374;
    float _412 = 1.0 / _404;
    float _414 = _408 * _376;
    float _416 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[126].x, _392);
    float _418 = _410 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _422 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[126].z, _416);
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].x, _418);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].x, _420);
    int _428 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _430 = _400 + _428;
    int _432 = _430 + 1;
    float _434 = _422 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _424);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _426);
    float _440 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _442 = trunc(_434);
    int _444 = int(_442);
    float _446 = _302 + _436;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _450 = _412 * _448;
    float _452 = _304 + _438;
    float _454 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].x, _440);
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _458 = _446 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _462 = _452 + _460;
    bool _464 = _450 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _466 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _454);
    bool _468 = _450 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _470 = _462 * _462;
    bool _472 = !_464;
    int _474 = _472 ? 0 : 1;
    float _476 = _342 + _466;
    float _478 = fma(_458, _458, _470);
    int _480 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _482 = _444 + _480;
    int _484 = _482 + 1;
    float _486 = sqrt(_478);
    int _488 = _484 | _432;
    int _490 = 2;
    int _492 = _488;
    float _494 = _342;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    int _498 = _432;
    int _500 = as_type<int>(_452);
    float _502 = _466;
    float _504 = _458;
    float _506 = _434;
    float _508 = _304;
    if (!_464)
    {
        _490 = 1;
    }
    int _510 = _490;
    int _512 = _510;
    if (!_468)
    {
        _512 = _474;
    }
    int _514 = _512;
    bool _516 = _484 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _518 = _514 << 6;
    bool _520 = _488 < 0;
    bool _522 = _520 || _516;
    int _524 = _518 + 96;
    uint _527 = uint(int(uint(_524) >> uint(2)));
    uint _529 = uint(int(uint(int(_527)) >> uint(2)));
    int _531 = int(_527) & 3;
    float _533 = (*spvDescriptorSet0.vp_c15)._m0[int(_529)][_531];
    int _535 = int(_527) + 1;
    uint _537 = uint(int(uint(_535) >> uint(2)));
    int _539 = _535 & 3;
    float _541 = (*spvDescriptorSet0.vp_c15)._m0[int(_537)][_539];
    bool _543 = _432 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _545 = _543 || _522;
    bool _547 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _549 = _518 + 48;
    uint _551 = uint(int(uint(_549) >> uint(2)));
    uint _553 = uint(int(uint(int(_551)) >> uint(2)));
    int _555 = int(_551) & 3;
    float _557 = (*spvDescriptorSet0.vp_c15)._m0[int(_553)][_555];
    int _559 = int(_551) + 1;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    int _563 = _559 & 3;
    float _565 = (*spvDescriptorSet0.vp_c15)._m0[int(_561)][_563];
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _573 = _571 != 0;
    bool _575 = !_569;
    int _577 = _575 ? 0 : 1;
    if (!_545)
    {
        int _579 = _432 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _581 = _579 + _484;
        _492 = _581;
    }
    int _583 = _492;
    int _585 = _518 + 56;
    uint _587 = uint(int(uint(_585) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.vp_c15)._m0[int(_589)][_591];
    int _595 = int(_587) + 1;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    int _599 = _595 & 3;
    float _601 = (*spvDescriptorSet0.vp_c15)._m0[int(_597)][_599];
    if (!_547)
    {
        _494 = _446;
    }
    float _603 = _494;
    float _605 = _603;
    if (!_547)
    {
        _496 = _452;
    }
    float _607 = _496;
    float _609 = _607;
    if (!_545)
    {
        int _611 = _583 << 2;
        _498 = _611;
    }
    int _613 = _498;
    bool _615 = !_573;
    int _617 = _615 ? 0 : 1;
    int _619 = _518 + 64;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c15)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.vp_c15)._m0[int(_631)][_633];
    int _637 = _613;
    if (!_545)
    {
        uint _639 = uint(int(uint(_583) >> uint(2)));
        _500 = int(_639);
    }
    int _641 = _500;
    if (!_545)
    {
        int _643 = 12 & _613;
        _637 = _643;
    }
    int _645 = _637;
    if (!_547)
    {
        _502 = _476;
    }
    float _647 = _502;
    int _649 = _518 + 72;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.vp_c15)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[int(_661)][_663];
    int _667 = _518 + 104;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.vp_c15)._m0[int(_671)][_673];
    int _677 = int(_669) + 1;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    int _681 = _677 & 3;
    float _683 = (*spvDescriptorSet0.vp_c15)._m0[int(_679)][_681];
    float _685 = _348 * _541;
    bool _687 = !_547;
    float _689 = _647;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _486 + _693;
        float _697 = _476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_478);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = fma(_476, _707, _715);
        float _721 = _699 * _717;
        float _723 = fma(_458, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_462, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _719;
        _605 = _723;
        _609 = _725;
    }
    float _727 = _689;
    float _729 = _605;
    float _731 = _609;
    float _733 = _727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _735 = fma(_302, _533, _685);
    if (!_545)
    {
        int _737 = _641 << 4;
        int _739 = _737 + _645;
        _504 = as_type<float>(_739);
    }
    float _741 = _504;
    float _743 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[2].x, _733);
    float _747 = fma(_304, _675, _735);
    float _749 = _348 * _565;
    int _751 = _518 + 80;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.vp_c15)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.vp_c15)._m0[int(_763)][_765];
    float _769 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[2].z, _745);
    float _771 = _747 + _683;
    float _773 = _348 * _635;
    float _775 = fma(_302, _557, _749);
    float _777 = _769 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _779 = 1.0 / _771;
    float _781 = fma(_302, _627, _773);
    float _783 = _741;
    if (!_545)
    {
        int _785 = as_type<int>(_741) + 400;
        uint _787 = uint(int(uint(_785) >> uint(2)));
        uint _789 = uint(int(uint(int(_787)) >> uint(2)));
        int _791 = int(_787) & 3;
        float _793 = (*spvDescriptorSet0.vp_c15)._m0[int(_789)][_791];
        _783 = _793;
    }
    float _795 = _783;
    float _797 = fma(_304, _593, _775);
    float _799 = _777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _801 = fma(_304, _657, _781);
    float _803 = _797 + _601;
    float _805 = _727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _807 = _801 + _665;
    int _809 = _518 + 88;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.vp_c15)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.vp_c15)._m0[int(_821)][_823];
    float _827 = _727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _829 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _805);
    float _831 = _727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _833 = -_799;
    float _835 = fma(_833, _743, 1.0);
    float _837 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _827);
    float _839 = _803 * _779;
    float _841 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _829);
    float _843 = _807 * _779;
    float _845 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[1].z, _837);
    float _847 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[3].x, _831);
    bool _849 = _839 >= 0.0;
    float _851 = _841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _855 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[3].z, _847);
    bool _857 = _839 <= 1.0;
    bool _859 = _857 && _849;
    float _861 = 0.0;
    float _863 = _847;
    float _865 = _843;
    if (!_545)
    {
        float _867 = floor(_388);
        _861 = _867;
    }
    float _869 = _861;
    float _871 = _853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _873 = _855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _875 = _843 >= 0.0;
    bool _877 = _875 && _859;
    float _879 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _871);
    float _881 = _853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _883 = _843 <= 1.0;
    bool _885 = _883 && _877;
    float _887 = _799;
    float _889 = _881;
    if (!_545)
    {
        float _891 = floor(_434);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _879);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].w, _895);
    float _899 = log2(_835);
    float _901 = _348 * _767;
    float _903 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _881);
    float _905 = _901;
    float _907 = _897;
    if (_885)
    {
        float _909 = float(_514);
        _889 = _909;
    }
    float _911 = _889;
    float _913 = fma(_302, _759, _901);
    float _915 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _903);
    float _917 = 1.0 / _897;
    float _919 = _853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_545)
    {
        float _921 = -_893;
        float _923 = _434 + _921;
        _506 = _923;
    }
    float _925 = _506;
    float _927 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _919);
    float _929 = _795;
    if (!_545)
    {
        float _931 = rint(_795);
        float _933 = precise::max(_931, 0.0);
        uint _935 = uint(_933);
        uint _937 = clamp(_935, 0u, 65535u);
        _929 = as_type<float>(_937);
    }
    float _939 = _929;
    float _941 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _927);
    float _943 = fma(_304, _817, _913);
    float _945 = _817;
    if (!_545)
    {
        float _947 = -_869;
        float _949 = _388 + _947;
        _945 = _949;
    }
    float _951 = _945;
    float _953 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].w, _915);
    float _955 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].w, _941);
    float _957 = _943 + _825;
    float _959 = _899 * 0.693147182464599609375;
    float _961 = _919;
    float _963 = _955;
    if (_885)
    {
        float _965 = rint(_911);
        float _967 = precise::max(_965, 0.0);
        uint _969 = uint(_967);
        uint _971 = clamp(_969, 0u, 65535u);
        _961 = as_type<float>(_971);
    }
    float _973 = _961;
    float _975 = _953 * _917;
    float _977 = _955 * _917;
    float _979 = _957 * _779;
    float _981 = _959 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _983 = fma(_975, 0.5, 0.5);
    float _985 = fma(_977, -0.5, 0.5);
    float _987 = _939;
    float _989 = _917;
    float _991 = _977;
    if (!_545)
    {
        float3 _3701 = float3(_925, _951, float(as_type<int>(_939)));
        float3 _3705 = select(_3701, float3(0.0), isnan(_3701));
        float _993 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3705.xy, uint(rint(_3705.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3705.xy, uint(rint(_3705.z)), level(0.0)).x;
        _987 = _993;
    }
    float _995 = _987;
    float _997 = _869;
    if (_885)
    {
        float3 _3720 = float3(_839, _843, float(as_type<int>(_973)));
        float3 _3722 = select(_3720, float3(0.0), isnan(_3720));
        float _999 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3722.xy, uint(rint(_3722.z)), _979, level(0.0));
        _997 = _999;
    }
    float _1001 = _997;
    float3 _3732 = float3(_983, _985, _981);
    float _1003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3732, float3(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3732, float3(0.0), isnan(_3732)), level(0.0)).x;
    float3 _3741 = float3(_983, _985, _981);
    float4 _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3741, float3(0.0), isnan(_3741)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3741, float3(0.0), isnan(_3741)), level(0.0)).xyzw;
    float _1008 = _1006.x;
    float _1010 = _1006.y;
    float _1012 = _1006.z;
    float _1014 = _1006.w;
    bool _1016 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1018 = isnan(0.5);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1024 = _1020 || _1022;
    if (_545)
    {
        _989 = 1.0;
    }
    float _1026 = _989;
    float _1028 = _1026;
    if (_1024)
    {
        _905 = 1.0;
    }
    float _1030 = _905;
    float _1032 = _1030;
    if (_1024)
    {
        _863 = 1.0;
    }
    float _1034 = _863;
    float _1036 = _1034;
    if (!_1024)
    {
        float _1038 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1040 = _1038 * 0.15915493667125701904296875;
        float _1042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1044 = _1040 * 6.283185482025146484375;
        float _1046 = cos(_1044);
        float _1048 = _1042 * 0.15915493667125701904296875;
        float _1050 = _1040 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = 1.0 / _1046;
        float _1056 = _1048 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1052 * _1054;
        float _1062 = _1048 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1058 * _1060;
        float _1068 = 1.0 / _1066;
        float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1072 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1070;
        float _1074 = 1.0 / _1072;
        float _1076 = _1064 * _1068;
        float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1080 = fma(_450, _1076, _1078);
        float _1082 = _1080 * _1074;
        float _1084 = precise::clamp(_1082, 0.0, 1.0);
        _991 = _1054;
        _865 = _1048;
        _1036 = _1084;
    }
    float _1086 = _991;
    float _1088 = _865;
    float _1090 = _1036;
    float _1092 = _1086;
    float _1094 = _1088;
    if (!_1024)
    {
        float _1096 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1102 = _1098 * 6.283185482025146484375;
        float _1104 = cos(_1102);
        float _1106 = _1100 * 0.15915493667125701904296875;
        float _1108 = _1098 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        float _1112 = 1.0 / _1104;
        float _1114 = _1106 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1110 * _1112;
        float _1120 = _1106 * 6.283185482025146484375;
        float _1122 = sin(_1120);
        float _1124 = _1116 * _1118;
        float _1126 = 1.0 / _1124;
        float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1130 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1128;
        float _1132 = 1.0 / _1130;
        float _1134 = _1122 * _1126;
        float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1138 = fma(_450, _1134, _1136);
        float _1140 = _1138 * _1132;
        float _1142 = precise::clamp(_1140, 0.0, 1.0);
        float _1144 = -_1142;
        float _1146 = _1144 + 1.0;
        _1092 = _1098;
        _1094 = _1124;
        _1032 = _1146;
    }
    float _1148 = _1092;
    float _1150 = _1094;
    float _1152 = _1032;
    float _1154 = _1148;
    float _1156 = _1150;
    if (!_545)
    {
        int _1158 = _583 << 4;
        int _1160 = _1158 + 2048;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
        int _1166 = int(_1162) & 3;
        float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
        int _1170 = int(_1162) + 1;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        int _1174 = _1170 & 3;
        float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
        int _1178 = _1160 + 8;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
        int _1184 = int(_1180) & 3;
        float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
        int _1188 = int(_1180) + 1;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        int _1192 = _1188 & 3;
        float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
        float _1196 = _348 * _1176;
        float _1198 = fma(_302, _1168, _1196);
        float _1200 = fma(_304, _1186, _1198);
        float _1202 = _1200 + _1194;
        float _1204 = precise::clamp(_1202, 0.0, 1.0);
        float _1206 = -_1204;
        float _1208 = _1206 + _995;
        float _1210 = fma(_1208, 500.0, 1.5);
        float _1212 = exp2(_1210);
        float _1214 = 0.0 + _1212;
        float _1216 = precise::clamp(_1214, 0.0, 1.0);
        _1154 = _1212;
        _1028 = _1216;
    }
    float _1218 = _1154;
    float _1220 = _1028;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _727 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1228 = _729 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _731 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1228, _1228, _1234);
    float _1238 = fma(_1232, _1232, _1236);
    float _1240 = rsqrt(_1238);
    float _1242 = sqrt(_1238);
    float _1244 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1246 = _1228 * _1244;
    float _1248 = _1232 * _1244;
    float _1250 = _1246 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 + _1252;
    float _1256 = sqrt(_1254);
    bool _1258 = _1256 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = _1256 + _1260;
    float _1264 = _1240;
    float _1266 = _1218;
    float _1268 = _1262;
    float _1270 = _1224;
    if (_1258)
    {
        float _1272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1264 = _1272;
    }
    float _1274 = _1264;
    if (_1258)
    {
        float _1276 = rsqrt(_1254);
        _1266 = _1276;
    }
    float _1278 = _1266;
    float _1280 = _1278;
    if (_1258)
    {
        float _1282 = _1262 * _1274;
        _1268 = _1282;
    }
    float _1284 = _1268;
    if (_1258)
    {
        float _1286 = _1284 * 0.15915493667125701904296875;
        _1156 = _1286;
    }
    float _1288 = _1156;
    float _1290 = _1232;
    if (_1258)
    {
        float _1292 = _1288 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1300 = precise::max(0.0, _1298);
    float _1302 = _1274;
    float _1304 = _1300;
    if (_1258)
    {
        float _1306 = _1288 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        _1302 = _1308;
    }
    float _1310 = _1302;
    float _1312 = -_1244;
    float _1314 = -_1300;
    float _1316 = fma(_1224, _1312, _1314);
    if (_1258)
    {
        float _1318 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1318;
    }
    float _1320 = _1270;
    float _1322 = _1320;
    float _1324 = _1296;
    if (_1258)
    {
        float _1326 = fma(_1296, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1326;
    }
    float _1328 = _1322;
    float _1330 = _1328;
    if (!_1258)
    {
        _1324 = _1246;
    }
    float _1332 = _1324;
    float _1334 = _1332;
    float _1336 = _1310;
    if (_1258)
    {
        float _1338 = _1310 + (-1.0);
        _1304 = _1338;
    }
    float _1340 = _1304;
    float _1342 = 0.0;
    float _1344 = _1340;
    if (_1258)
    {
        float _1346 = _1278 * _1328;
        _1342 = _1346;
    }
    float _1348 = _1342;
    if (!_1258)
    {
        _1330 = _1316;
    }
    float _1350 = _1330;
    float _1352 = _1350;
    if (_1258)
    {
        float _1354 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _508 = _1354;
    }
    float _1356 = _508;
    if (_1258)
    {
        float _1358 = _1246 * _1348;
        _1334 = _1358;
    }
    float _1360 = _1334;
    if (!_1258)
    {
        _1344 = _1248;
    }
    float _1362 = _1344;
    float _1364 = _1362;
    if (_1258)
    {
        float _1366 = _1248 * _1348;
        _1364 = _1366;
    }
    float _1368 = _1364;
    if (!_1258)
    {
        _1280 = _1250;
    }
    float _1370 = _1280;
    float _1372 = _1370;
    if (_1258)
    {
        float _1374 = fma(_1316, _1310, _1356);
        _1352 = _1374;
    }
    float _1376 = _1352;
    if (_1258)
    {
        float _1378 = _1360 * _1360;
        _1372 = _1378;
    }
    float _1380 = _1372;
    if (!_1258)
    {
        _1336 = _1252;
    }
    float _1382 = _1336;
    float _1384 = _1382;
    if (_1258)
    {
        float _1386 = _1368 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = fma(_1376, _1376, _1380);
    float _1392 = _1390 + _1388;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1396 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1394);
    float _1398 = precise::clamp(_1396, 0.0, 1.0);
    float _1400 = -_1398;
    float _1402 = _1400 + 1.0;
    float _1404 = rsqrt(_1392);
    float _1406 = abs(_1402);
    float _1408 = log2(_1406);
    float _1410 = _1404 * _1360;
    float _1412 = _1404 * _1376;
    float _1414 = _1404 * _1368;
    float _1416 = _1410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1418 = -_1416;
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1418);
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1420);
    float _1428 = exp2(_1422);
    float _1430 = fma(_1426, -0.5, 0.5);
    float _1432 = fma(_1426, 0.5, 0.5);
    float _1434 = fma(_1432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1436 = sqrt(_1430);
    float _1438 = fma(_1432, _1434, -0.212114393711090087890625);
    float _1440 = _1412 + 1.0;
    float _1442 = fma(_1432, _1438, 1.570728778839111328125);
    float _1444 = -_1412;
    float _1446 = fma(_1428, _1440, _1444);
    float _1448 = fma(_1446, 0.5, 0.5);
    float _1450 = _1436 * 0.636619746685028076171875;
    float _1452 = -_1442;
    float _1454 = fma(_1450, _1452, 1.0);
    float2 _4396 = float2(_1454, _1448);
    float3 _1458 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).xyz;
    float _1460 = _1458.x;
    float _1462 = _1458.y;
    float _1464 = _1458.z;
    float _1466 = in.m_67.x;
    float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _1470 = _152 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _1472 = _340 != 0.0;
    bool _1474 = isnan(_340);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    float _1482 = in.m_69.x;
    float _1484 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1486 = _334 == 0.0;
    bool _1488 = !_1480;
    bool _1490 = _1486 && _1488;
    float _1492 = in.m_67.y;
    float _1494 = abs(_450);
    float _1496 = log2(_1494);
    float _1498 = _853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1500 = in.m_71.x;
    float _1502 = in.m_71.y;
    float _1504 = in.m_71.z;
    bool _1506 = _344 == 0.0;
    bool _1508 = _1506 && _1490;
    float _1510 = -_322;
    float _1512 = _1510 + 1.0;
    int _1514 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1516 = _1514 != 0;
    float _1518 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1498);
    float _1520 = _1470 * _1468;
    float _1522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1524 = in.m_69.y;
    int _1526 = abs(_577);
    float _1528 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1518);
    bool _1530 = _450 <= 8000.0;
    bool _1532 = isnan(_450);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(8000.0);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    out.m_73.y = _340;
    float _1542 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1520);
    float _1544 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1546 = exp2(_1484);
    float _1548 = float(_1526);
    out.m_73.x = _334;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1556 = _1554 != 0;
    float _1558 = _1542 * 6.283185482025146484375;
    bool _1560 = _1466 > 0.5;
    bool _1562 = _1560 && _1552;
    float _1564 = floor(_1542);
    bool _1566 = _1492 > 0.5;
    float _1568 = _1558 * 0.15915493667125701904296875;
    float _1570 = _1502;
    float _1572 = _1500;
    float _1574 = _1504;
    float _1576 = _1558;
    if (!_1508)
    {
        float _1578 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1502);
        _1570 = _1578;
    }
    float _1580 = _1570;
    if (!_1508)
    {
        float _1582 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1500);
        _1572 = _1582;
    }
    float _1584 = _1572;
    if (!_1508)
    {
        float _1586 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1504);
        _1574 = _1586;
    }
    float _1588 = _1574;
    float _1590 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1592 = 0.0;
    if (_1552)
    {
        _1592 = _1482;
    }
    float _1594 = _1592;
    float _1596 = -_1524;
    float _1598 = _1596 + 1.0;
    float _1600 = _1594;
    float _1602 = _1524;
    if (!_1552)
    {
        _1576 = _1482;
    }
    float _1604 = _1576;
    float _1606 = _1568 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    float _1610 = _1604;
    if (_1562)
    {
        float _1612 = -_1594;
        float _1614 = _1612 + 1.0;
        _1600 = _1614;
    }
    float _1616 = _1600;
    if (_1556)
    {
        float _1618 = _1566 ? _1598 : _1524;
        _1602 = _1618;
    }
    float _1620 = _1602;
    float _1622 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1624 = -_1564;
    float _1626 = _1542 + _1624;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1552)
    {
        _1610 = _1616;
    }
    float _1630 = _1610;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1634 = -_1626;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1638 = _1626 < 0.5;
    float _1640 = float(_1638);
    float _1642 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1644 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1622);
    float _1646 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1648 = exp2(_1544);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1652 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1656 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1652 * _1522;
    float _1662 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1646 * _1632;
    float _1666 = fma(_1608, 0.5, 0.5);
    float _1668 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1590);
    out.m_75.x = _1658;
    out.m_75.y = _1662;
    out.m_75.z = _1656;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1642);
    out.m_77.x = _1660;
    out.m_77.y = _1664;
    float _1672 = -_1640;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1676 = -_1666;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1686 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1668);
    float _1688 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1644);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1670);
    bool _1692 = !_1516;
    int _1694 = _1692 ? 0 : 1;
    float _1696 = fma(_1648, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1702 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1704 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1706 = fma(_1698, -2.0, 3.0);
    float _1708 = _1698 * _1698;
    float _1710 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1712 = abs(_1694);
    float _1714 = abs(_1636);
    float _1716 = _1548 * _1714;
    float _1718 = _1708 * _1706;
    float _1720 = in.m_79.x;
    float _1722 = -_1546;
    float _1724 = _1722 + 1.0;
    float _1726 = -_1718;
    float _1728 = _1726 + 1.0;
    out.m_81.x = _1702;
    out.m_81.y = _1704;
    out.m_81.z = _1710;
    out.m_81.w = _1700;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1718);
    out.m_73.z = _344;
    float _1732 = _1540 * _1730;
    out.m_83.x = _1686;
    out.m_83.y = _1688;
    out.m_83.z = _1690;
    float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _729;
    out.m_85.y = _727;
    out.m_85.z = _731;
    float _1736 = float(_1712);
    float _1738 = _1512 * _1734;
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    int _1742 = abs(_617);
    float _1744 = _1090 * _1152;
    float _1746 = fma(_1736, _1678, _1716);
    float _1748 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1528);
    float _1750 = float(_1742);
    float _1752 = -_1740;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1758 = _1748 + _897;
    out.gl_Position.x = _953;
    out.gl_Position.y = _955;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _897;
    float _1760 = abs(_1674);
    float _1762 = fma(_1750, _1760, _1746);
    float _1764 = _1758 * 0.5;
    out.m_87.x = _1720;
    float _1766 = _1762 * _1756;
    out.m_89.z = _1764;
    out.m_89.w = _897;
    float _1768 = _897;
    float _1770 = _1764;
    if (!_885)
    {
        _963 = 1.0;
    }
    float _1772 = _963;
    float _1774 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1776 = _1772;
    if (_885)
    {
        bool _1778 = _1001 >= _979;
        bool _1780 = isnan(_1001);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan(_979);
        bool _1786 = _1782 || _1784;
        float _1788 = float(_1786);
        _1776 = _1788;
    }
    float _1790 = _1776;
    bool _1792 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1794 = isnan(_1242);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1800 = _1796 || _1798;
    float _1802 = _1774 * _1003;
    float _1804 = -_1774;
    float _1806 = _1804 + 1.0;
    float _1808 = _1790 * _1220;
    float _1810 = _1014 * _1802;
    float _1812 = _1014 * _1806;
    float _1814 = -_1808;
    float _1816 = fma(_1814, _1754, 1.0);
    float _1818 = precise::clamp(_1816, 0.0, 1.0);
    float _1820 = _1818 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1822 = _1818;
    float _1824 = _1806;
    float _1826 = _1810;
    if (!_1800)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1828 = _1768;
    float _1830 = _1828;
    float _1832 = _1828;
    if (!_1800)
    {
        _1770 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1834 = _1770;
    out.m_91.x = _1820;
    float _1836 = _1834;
    float _1838 = _1834;
    if (!_1800)
    {
        _907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1840 = _907;
    float _1842 = _1840;
    float _1844 = _1840;
    if (!_1800)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1846 = _1822;
    float _1848 = _1846;
    float _1850 = _1846;
    if (!_1800)
    {
        _1824 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1852 = _1824;
    float _1854 = _1464 * _1802;
    float _1856 = fma(_1460, _1810, _1008);
    float _1858 = fma(_1462, _1810, _1010);
    float _1860 = _1852;
    float _1862 = _1852;
    if (!_1800)
    {
        _1826 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1864 = _1826;
    float _1866 = fma(_1014, _1854, _1012);
    out.m_93.x = _1856;
    out.m_93.y = _1858;
    out.m_93.z = _1866;
    out.m_93.w = _1812;
    bool _1868 = !_1800;
    float _1870 = _1864;
    float _1872 = _1864;
    if (!_1868)
    {
        bool _1874 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1876 = isnan(_1242);
        bool _1878 = _1874 || _1876;
        bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1882 = _1878 || _1880;
        if (!_1882)
        {
            float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1886 = _1242 + _1884;
            float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1890 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1888;
            float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1896 = 1.0 / _1890;
            float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1914 = _1886 * _1896;
            float _1916 = precise::clamp(_1914, 0.0, 1.0);
            float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1922 = fma(_1916, _1894, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1924 = fma(_1916, _1920, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1926 = fma(_1916, _1900, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1928 = fma(_1916, _1904, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1930 = fma(_1916, _1908, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1932 = fma(_1916, _1912, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1838 = _1926;
            _1850 = _1930;
            _1832 = _1922;
            _1872 = _1928;
            _1844 = _1924;
            _1862 = _1932;
            _1934 = true;
        }
        else
        {
            bool _1936 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1938 = isnan(_1242);
            bool _1940 = _1936 || _1938;
            bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1944 = _1940 || _1942;
            if (!_1944)
            {
                _1830 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1946 = _1830;
            _1832 = _1946;
            if (!_1944)
            {
                _1836 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1948 = _1836;
            _1838 = _1948;
            if (!_1944)
            {
                _1842 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1950 = _1842;
            _1844 = _1950;
            if (!_1944)
            {
                _1870 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1952 = _1870;
            _1872 = _1952;
            if (!_1944)
            {
                _1848 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1954 = _1848;
            _1850 = _1954;
            if (!_1944)
            {
                _1860 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1956 = _1860;
            bool _1958 = !_1944;
            _1862 = _1956;
            if (!_1958)
            {
                bool _1960 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1962 = isnan(_1242);
                bool _1964 = _1960 || _1962;
                bool _1966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1968 = _1964 || _1966;
                if (!_1968)
                {
                    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1972 = _1242 + _1970;
                    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1976 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1974;
                    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1982 = 1.0 / _1976;
                    float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1986 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2000 = _1972 * _1982;
                    float _2002 = precise::clamp(_2000, 0.0, 1.0);
                    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2008 = fma(_2002, _1980, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2010 = fma(_2002, _2006, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2012 = fma(_2002, _1986, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2014 = fma(_2002, _1990, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2016 = fma(_2002, _1994, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2018 = fma(_2002, _1998, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1838 = _2012;
                    _1850 = _2016;
                    _1832 = _2008;
                    _1872 = _2014;
                    _1844 = _2010;
                    _1862 = _2018;
                    _1934 = true;
                }
                else
                {
                    _1838 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1850 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1832 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1872 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1844 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1862 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1934 = false;
    float _2020 = _1838;
    float _2022 = _1850;
    float _2024 = _1832;
    float _2026 = _1872;
    float _2028 = _1844;
    float _2030 = _1862;
    float _2032 = fma(_1688, -0.5, 0.5);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = -_2020;
    float _2038 = _2036 + _2022;
    float _2040 = -_2024;
    float _2042 = _2040 + _2026;
    out.m_95.x = 0.0;
    float _2044 = fma(_2034, _2038, _2020);
    float _2046 = _1766 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2048 = fma(_2034, _2042, _2024);
    float _2050 = -_2028;
    float _2052 = _2050 + _2030;
    float _2054 = _2044 * 0.586610972881317138671875;
    bool _2056 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _2046;
    float _2058 = fma(_2034, _2052, _2028);
    float _2060 = fma(_2048, 0.298911988735198974609375, _2054);
    bool _2062 = _1090 > 0.0;
    bool _2064 = isnan(_1090);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(0.0);
    bool _2070 = _2066 || _2068;
    float _2072 = fma(_2058, 0.114477999508380889892578125, _2060);
    bool _2074 = _1152 <= 0.0;
    bool _2076 = !_2070;
    bool _2078 = _2074 || _2076;
    float _2080 = -_2072;
    float _2082 = _2048 + _2080;
    float _2084 = -_2072;
    float _2086 = _2044 + _2084;
    float _2088 = -_2072;
    float _2090 = _2058 + _2088;
    float _2092 = fma(_2082, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    float _2094 = fma(_2086, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    float _2096 = fma(_2090, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    bool _2098 = !_2056;
    if (!_2098)
    {
        float _2100 = -_727;
        float _2102 = _2100 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2104 = -_729;
        float _2106 = _2104 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2108 = -_731;
        float _2110 = _2108 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2112 = _2102 * _2102;
        float _2114 = fma(_2106, _2106, _2112);
        float _2116 = fma(_2110, _2110, _2114);
        float _2118 = sqrt(_2116);
        float _2120 = rsqrt(_2116);
        float _2122 = -_2118;
        float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2126 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2128 = precise::clamp(_2126, 0.0, 1.0);
        float _2130 = _2106 * _2120;
        float _2132 = _2102 * _2120;
        float _2134 = abs(_2128);
        float _2136 = log2(_2134);
        float _2138 = _2110 * _2120;
        float _2140 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2142 = _1688 * _2132;
        float _2144 = -_2132;
        float _2146 = -_2140;
        float _2148 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2146);
        float _2150 = fma(_1686, _2130, _2142);
        float _2152 = -_2138;
        float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2148);
        float _2156 = fma(_1690, _2138, _2150);
        float _2158 = precise::clamp(_2156, 0.0, 1.0);
        float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2162 = _2154 + _2160;
        float _2164 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2166 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2168 = precise::clamp(_2166, 0.0, 1.0);
        float _2170 = exp2(_2164);
        float _2172 = _2170 * _2168;
        float _2174 = _2158 * _2172;
        float _2176 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2178 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2180 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2176;
        out.m_95.y = _2178;
        out.m_95.z = _2180;
    }
    out.m_97.x = _2092;
    out.m_97.y = _2094;
    out.m_97.z = _2096;
    if (!_2078)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2182;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1934 = false;
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
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2241 = as_type<float>(_134);
        out.gl_Position.z = _2241;
    }
    if (!_120)
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
    if (_148)
    {
        float _154 = float(_116);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
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
        _136 = as_type<int>(_166);
    }
    int _168 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_168);
        out.gl_Position.z = _2309;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_63.w;
    float _172 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_61.x;
    float _186 = in.m_61.y;
    float _188 = in.m_61.z;
    float _190 = in.m_56.x;
    float _192 = in.m_56.y;
    float _194 = in.m_56.z;
    float _196 = 0.0;
    float _198 = _172;
    if (!_182)
    {
        float _200 = _172 * _172;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _204;
    if (!_182)
    {
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_182;
    float _214 = _210;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _172 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _172);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _244;
    }
    float _246 = _214;
    bool _248 = !_182;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _172 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _198 = _268;
    }
    float _270 = _198;
    float _272 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_270, _186, _272);
    float _280 = fma(_270, _184, _274);
    float _282 = fma(_270, _188, _276);
    float _284 = fma(_278, _170, _192);
    float _286 = fma(_280, _170, _190);
    float _288 = fma(_282, _170, _194);
    float _290 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _290);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _294);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _296);
    float _302 = _298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _304 = _300 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _308 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _310 = floor(_306);
    float _312 = floor(_308);
    float _314 = -_310;
    float _316 = _306 + _314;
    float _318 = -_312;
    float _320 = _308 + _318;
    float2 _2558 = float2(_316, _320);
    float _322 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2558, float2(0.0), isnan(_2558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2558, float2(0.0), isnan(_2558)), level(0.0)).x;
    float _324 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = in.m_63.x;
    float _328 = in.m_63.y;
    float _330 = in.m_63.z;
    float _332 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _334 = in.m_65.x;
    float _336 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _338 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _340 = in.m_65.y;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = in.m_65.z;
    float _346 = _342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _348 = _342 + _338;
    float _350 = fma(_302, (*spvDescriptorSet0.vp_c8)._m0[11].x, _346);
    float _352 = _348 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _354 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].z, _350);
    float _356 = _342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _364 = fma(_302, (*spvDescriptorSet0.vp_c8)._m0[10].x, _356);
    float _366 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _370 = 1.0 / _362;
    float _372 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].z, _364);
    float _374 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _378 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[127].x, _352);
    float _380 = _372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _382 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[127].z, _378);
    float _384 = _380 + _362;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _388 = _382 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _390 = _386 * _368;
    float _392 = _348 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _394 = _384 * _370;
    float _396 = _394 * 0.5;
    float _398 = trunc(_388);
    int _400 = int(_398);
    float _402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[30].w, _402);
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _340);
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _410 = _406 * _374;
    float _412 = 1.0 / _404;
    float _414 = _408 * _376;
    float _416 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[126].x, _392);
    float _418 = _410 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _422 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[126].z, _416);
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].x, _418);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].x, _420);
    int _428 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _430 = _400 + _428;
    int _432 = _430 + 1;
    float _434 = _422 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _424);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _426);
    float _440 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _442 = trunc(_434);
    int _444 = int(_442);
    float _446 = _302 + _436;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _450 = _412 * _448;
    float _452 = _304 + _438;
    float _454 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].x, _440);
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _458 = _446 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _462 = _452 + _460;
    bool _464 = _450 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _466 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _454);
    bool _468 = _450 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _470 = _462 * _462;
    bool _472 = !_464;
    int _474 = _472 ? 0 : 1;
    float _476 = _342 + _466;
    float _478 = fma(_458, _458, _470);
    int _480 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _482 = _444 + _480;
    int _484 = _482 + 1;
    float _486 = sqrt(_478);
    int _488 = _484 | _432;
    int _490 = 2;
    int _492 = _488;
    float _494 = _342;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    int _498 = _432;
    int _500 = as_type<int>(_452);
    float _502 = _466;
    float _504 = _458;
    float _506 = _434;
    float _508 = _304;
    if (!_464)
    {
        _490 = 1;
    }
    int _510 = _490;
    int _512 = _510;
    if (!_468)
    {
        _512 = _474;
    }
    int _514 = _512;
    bool _516 = _484 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _518 = _514 << 6;
    bool _520 = _488 < 0;
    bool _522 = _520 || _516;
    int _524 = _518 + 96;
    uint _527 = uint(int(uint(_524) >> uint(2)));
    uint _529 = uint(int(uint(int(_527)) >> uint(2)));
    int _531 = int(_527) & 3;
    float _533 = (*spvDescriptorSet0.vp_c15)._m0[int(_529)][_531];
    int _535 = int(_527) + 1;
    uint _537 = uint(int(uint(_535) >> uint(2)));
    int _539 = _535 & 3;
    float _541 = (*spvDescriptorSet0.vp_c15)._m0[int(_537)][_539];
    bool _543 = _432 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _545 = _543 || _522;
    bool _547 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _549 = _518 + 48;
    uint _551 = uint(int(uint(_549) >> uint(2)));
    uint _553 = uint(int(uint(int(_551)) >> uint(2)));
    int _555 = int(_551) & 3;
    float _557 = (*spvDescriptorSet0.vp_c15)._m0[int(_553)][_555];
    int _559 = int(_551) + 1;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    int _563 = _559 & 3;
    float _565 = (*spvDescriptorSet0.vp_c15)._m0[int(_561)][_563];
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _573 = _571 != 0;
    bool _575 = !_569;
    int _577 = _575 ? 0 : 1;
    if (!_545)
    {
        int _579 = _432 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _581 = _579 + _484;
        _492 = _581;
    }
    int _583 = _492;
    int _585 = _518 + 56;
    uint _587 = uint(int(uint(_585) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.vp_c15)._m0[int(_589)][_591];
    int _595 = int(_587) + 1;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    int _599 = _595 & 3;
    float _601 = (*spvDescriptorSet0.vp_c15)._m0[int(_597)][_599];
    if (!_547)
    {
        _494 = _446;
    }
    float _603 = _494;
    float _605 = _603;
    if (!_547)
    {
        _496 = _452;
    }
    float _607 = _496;
    float _609 = _607;
    if (!_545)
    {
        int _611 = _583 << 2;
        _498 = _611;
    }
    int _613 = _498;
    bool _615 = !_573;
    int _617 = _615 ? 0 : 1;
    int _619 = _518 + 64;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c15)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.vp_c15)._m0[int(_631)][_633];
    int _637 = _613;
    if (!_545)
    {
        uint _639 = uint(int(uint(_583) >> uint(2)));
        _500 = int(_639);
    }
    int _641 = _500;
    if (!_545)
    {
        int _643 = 12 & _613;
        _637 = _643;
    }
    int _645 = _637;
    if (!_547)
    {
        _502 = _476;
    }
    float _647 = _502;
    int _649 = _518 + 72;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.vp_c15)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[int(_661)][_663];
    int _667 = _518 + 104;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.vp_c15)._m0[int(_671)][_673];
    int _677 = int(_669) + 1;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    int _681 = _677 & 3;
    float _683 = (*spvDescriptorSet0.vp_c15)._m0[int(_679)][_681];
    float _685 = _348 * _541;
    bool _687 = !_547;
    float _689 = _647;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _486 + _693;
        float _697 = _476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_478);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = fma(_476, _707, _715);
        float _721 = _699 * _717;
        float _723 = fma(_458, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_462, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _719;
        _605 = _723;
        _609 = _725;
    }
    float _727 = _689;
    float _729 = _605;
    float _731 = _609;
    float _733 = _727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _735 = fma(_302, _533, _685);
    if (!_545)
    {
        int _737 = _641 << 4;
        int _739 = _737 + _645;
        _504 = as_type<float>(_739);
    }
    float _741 = _504;
    float _743 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[2].x, _733);
    float _747 = fma(_304, _675, _735);
    float _749 = _348 * _565;
    int _751 = _518 + 80;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.vp_c15)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.vp_c15)._m0[int(_763)][_765];
    float _769 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[2].z, _745);
    float _771 = _747 + _683;
    float _773 = _348 * _635;
    float _775 = fma(_302, _557, _749);
    float _777 = _769 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _779 = 1.0 / _771;
    float _781 = fma(_302, _627, _773);
    float _783 = _741;
    if (!_545)
    {
        int _785 = as_type<int>(_741) + 400;
        uint _787 = uint(int(uint(_785) >> uint(2)));
        uint _789 = uint(int(uint(int(_787)) >> uint(2)));
        int _791 = int(_787) & 3;
        float _793 = (*spvDescriptorSet0.vp_c15)._m0[int(_789)][_791];
        _783 = _793;
    }
    float _795 = _783;
    float _797 = fma(_304, _593, _775);
    float _799 = _777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _801 = fma(_304, _657, _781);
    float _803 = _797 + _601;
    float _805 = _727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _807 = _801 + _665;
    int _809 = _518 + 88;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.vp_c15)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.vp_c15)._m0[int(_821)][_823];
    float _827 = _727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _829 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _805);
    float _831 = _727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _833 = -_799;
    float _835 = fma(_833, _743, 1.0);
    float _837 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _827);
    float _839 = _803 * _779;
    float _841 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _829);
    float _843 = _807 * _779;
    float _845 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[1].z, _837);
    float _847 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[3].x, _831);
    bool _849 = _839 >= 0.0;
    float _851 = _841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _855 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[3].z, _847);
    bool _857 = _839 <= 1.0;
    bool _859 = _857 && _849;
    float _861 = 0.0;
    float _863 = _847;
    float _865 = _843;
    if (!_545)
    {
        float _867 = floor(_388);
        _861 = _867;
    }
    float _869 = _861;
    float _871 = _853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _873 = _855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _875 = _843 >= 0.0;
    bool _877 = _875 && _859;
    float _879 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _871);
    float _881 = _853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _883 = _843 <= 1.0;
    bool _885 = _883 && _877;
    float _887 = _799;
    float _889 = _881;
    if (!_545)
    {
        float _891 = floor(_434);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _879);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].w, _895);
    float _899 = log2(_835);
    float _901 = _348 * _767;
    float _903 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _881);
    float _905 = _901;
    float _907 = _897;
    if (_885)
    {
        float _909 = float(_514);
        _889 = _909;
    }
    float _911 = _889;
    float _913 = fma(_302, _759, _901);
    float _915 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _903);
    float _917 = 1.0 / _897;
    float _919 = _853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_545)
    {
        float _921 = -_893;
        float _923 = _434 + _921;
        _506 = _923;
    }
    float _925 = _506;
    float _927 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _919);
    float _929 = _795;
    if (!_545)
    {
        float _931 = rint(_795);
        float _933 = precise::max(_931, 0.0);
        uint _935 = uint(_933);
        uint _937 = clamp(_935, 0u, 65535u);
        _929 = as_type<float>(_937);
    }
    float _939 = _929;
    float _941 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _927);
    float _943 = fma(_304, _817, _913);
    float _945 = _817;
    if (!_545)
    {
        float _947 = -_869;
        float _949 = _388 + _947;
        _945 = _949;
    }
    float _951 = _945;
    float _953 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].w, _915);
    float _955 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].w, _941);
    float _957 = _943 + _825;
    float _959 = _899 * 0.693147182464599609375;
    float _961 = _919;
    float _963 = _955;
    if (_885)
    {
        float _965 = rint(_911);
        float _967 = precise::max(_965, 0.0);
        uint _969 = uint(_967);
        uint _971 = clamp(_969, 0u, 65535u);
        _961 = as_type<float>(_971);
    }
    float _973 = _961;
    float _975 = _953 * _917;
    float _977 = _955 * _917;
    float _979 = _957 * _779;
    float _981 = _959 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _983 = fma(_975, 0.5, 0.5);
    float _985 = fma(_977, -0.5, 0.5);
    float _987 = _939;
    float _989 = _917;
    float _991 = _977;
    if (!_545)
    {
        float3 _3701 = float3(_925, _951, float(as_type<int>(_939)));
        float3 _3705 = select(_3701, float3(0.0), isnan(_3701));
        float _993 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3705.xy, uint(rint(_3705.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3705.xy, uint(rint(_3705.z)), level(0.0)).x;
        _987 = _993;
    }
    float _995 = _987;
    float _997 = _869;
    if (_885)
    {
        float3 _3720 = float3(_839, _843, float(as_type<int>(_973)));
        float3 _3722 = select(_3720, float3(0.0), isnan(_3720));
        float _999 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3722.xy, uint(rint(_3722.z)), _979, level(0.0));
        _997 = _999;
    }
    float _1001 = _997;
    float3 _3732 = float3(_983, _985, _981);
    float _1003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3732, float3(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3732, float3(0.0), isnan(_3732)), level(0.0)).x;
    float3 _3741 = float3(_983, _985, _981);
    float4 _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3741, float3(0.0), isnan(_3741)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3741, float3(0.0), isnan(_3741)), level(0.0)).xyzw;
    float _1008 = _1006.x;
    float _1010 = _1006.y;
    float _1012 = _1006.z;
    float _1014 = _1006.w;
    bool _1016 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1018 = isnan(0.5);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1024 = _1020 || _1022;
    if (_545)
    {
        _989 = 1.0;
    }
    float _1026 = _989;
    float _1028 = _1026;
    if (_1024)
    {
        _905 = 1.0;
    }
    float _1030 = _905;
    float _1032 = _1030;
    if (_1024)
    {
        _863 = 1.0;
    }
    float _1034 = _863;
    float _1036 = _1034;
    if (!_1024)
    {
        float _1038 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1040 = _1038 * 0.15915493667125701904296875;
        float _1042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1044 = _1040 * 6.283185482025146484375;
        float _1046 = cos(_1044);
        float _1048 = _1042 * 0.15915493667125701904296875;
        float _1050 = _1040 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = 1.0 / _1046;
        float _1056 = _1048 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1052 * _1054;
        float _1062 = _1048 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1058 * _1060;
        float _1068 = 1.0 / _1066;
        float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1072 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1070;
        float _1074 = 1.0 / _1072;
        float _1076 = _1064 * _1068;
        float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1080 = fma(_450, _1076, _1078);
        float _1082 = _1080 * _1074;
        float _1084 = precise::clamp(_1082, 0.0, 1.0);
        _991 = _1054;
        _865 = _1048;
        _1036 = _1084;
    }
    float _1086 = _991;
    float _1088 = _865;
    float _1090 = _1036;
    float _1092 = _1086;
    float _1094 = _1088;
    if (!_1024)
    {
        float _1096 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1102 = _1098 * 6.283185482025146484375;
        float _1104 = cos(_1102);
        float _1106 = _1100 * 0.15915493667125701904296875;
        float _1108 = _1098 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        float _1112 = 1.0 / _1104;
        float _1114 = _1106 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1110 * _1112;
        float _1120 = _1106 * 6.283185482025146484375;
        float _1122 = sin(_1120);
        float _1124 = _1116 * _1118;
        float _1126 = 1.0 / _1124;
        float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1130 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1128;
        float _1132 = 1.0 / _1130;
        float _1134 = _1122 * _1126;
        float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1138 = fma(_450, _1134, _1136);
        float _1140 = _1138 * _1132;
        float _1142 = precise::clamp(_1140, 0.0, 1.0);
        float _1144 = -_1142;
        float _1146 = _1144 + 1.0;
        _1092 = _1098;
        _1094 = _1124;
        _1032 = _1146;
    }
    float _1148 = _1092;
    float _1150 = _1094;
    float _1152 = _1032;
    float _1154 = _1148;
    float _1156 = _1150;
    if (!_545)
    {
        int _1158 = _583 << 4;
        int _1160 = _1158 + 2048;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
        int _1166 = int(_1162) & 3;
        float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
        int _1170 = int(_1162) + 1;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        int _1174 = _1170 & 3;
        float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
        int _1178 = _1160 + 8;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
        int _1184 = int(_1180) & 3;
        float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
        int _1188 = int(_1180) + 1;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        int _1192 = _1188 & 3;
        float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
        float _1196 = _348 * _1176;
        float _1198 = fma(_302, _1168, _1196);
        float _1200 = fma(_304, _1186, _1198);
        float _1202 = _1200 + _1194;
        float _1204 = precise::clamp(_1202, 0.0, 1.0);
        float _1206 = -_1204;
        float _1208 = _1206 + _995;
        float _1210 = fma(_1208, 500.0, 1.5);
        float _1212 = exp2(_1210);
        float _1214 = 0.0 + _1212;
        float _1216 = precise::clamp(_1214, 0.0, 1.0);
        _1154 = _1212;
        _1028 = _1216;
    }
    float _1218 = _1154;
    float _1220 = _1028;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _727 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1228 = _729 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _731 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1228, _1228, _1234);
    float _1238 = fma(_1232, _1232, _1236);
    float _1240 = rsqrt(_1238);
    float _1242 = sqrt(_1238);
    float _1244 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1246 = _1228 * _1244;
    float _1248 = _1232 * _1244;
    float _1250 = _1246 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 + _1252;
    float _1256 = sqrt(_1254);
    bool _1258 = _1256 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = _1256 + _1260;
    float _1264 = _1240;
    float _1266 = _1218;
    float _1268 = _1262;
    float _1270 = _1224;
    if (_1258)
    {
        float _1272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1264 = _1272;
    }
    float _1274 = _1264;
    if (_1258)
    {
        float _1276 = rsqrt(_1254);
        _1266 = _1276;
    }
    float _1278 = _1266;
    float _1280 = _1278;
    if (_1258)
    {
        float _1282 = _1262 * _1274;
        _1268 = _1282;
    }
    float _1284 = _1268;
    if (_1258)
    {
        float _1286 = _1284 * 0.15915493667125701904296875;
        _1156 = _1286;
    }
    float _1288 = _1156;
    float _1290 = _1232;
    if (_1258)
    {
        float _1292 = _1288 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1300 = precise::max(0.0, _1298);
    float _1302 = _1274;
    float _1304 = _1300;
    if (_1258)
    {
        float _1306 = _1288 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        _1302 = _1308;
    }
    float _1310 = _1302;
    float _1312 = -_1244;
    float _1314 = -_1300;
    float _1316 = fma(_1224, _1312, _1314);
    if (_1258)
    {
        float _1318 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1318;
    }
    float _1320 = _1270;
    float _1322 = _1320;
    float _1324 = _1296;
    if (_1258)
    {
        float _1326 = fma(_1296, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1326;
    }
    float _1328 = _1322;
    float _1330 = _1328;
    if (!_1258)
    {
        _1324 = _1246;
    }
    float _1332 = _1324;
    float _1334 = _1332;
    float _1336 = _1310;
    if (_1258)
    {
        float _1338 = _1310 + (-1.0);
        _1304 = _1338;
    }
    float _1340 = _1304;
    float _1342 = 0.0;
    float _1344 = _1340;
    if (_1258)
    {
        float _1346 = _1278 * _1328;
        _1342 = _1346;
    }
    float _1348 = _1342;
    if (!_1258)
    {
        _1330 = _1316;
    }
    float _1350 = _1330;
    float _1352 = _1350;
    if (_1258)
    {
        float _1354 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _508 = _1354;
    }
    float _1356 = _508;
    if (_1258)
    {
        float _1358 = _1246 * _1348;
        _1334 = _1358;
    }
    float _1360 = _1334;
    if (!_1258)
    {
        _1344 = _1248;
    }
    float _1362 = _1344;
    float _1364 = _1362;
    if (_1258)
    {
        float _1366 = _1248 * _1348;
        _1364 = _1366;
    }
    float _1368 = _1364;
    if (!_1258)
    {
        _1280 = _1250;
    }
    float _1370 = _1280;
    float _1372 = _1370;
    if (_1258)
    {
        float _1374 = fma(_1316, _1310, _1356);
        _1352 = _1374;
    }
    float _1376 = _1352;
    if (_1258)
    {
        float _1378 = _1360 * _1360;
        _1372 = _1378;
    }
    float _1380 = _1372;
    if (!_1258)
    {
        _1336 = _1252;
    }
    float _1382 = _1336;
    float _1384 = _1382;
    if (_1258)
    {
        float _1386 = _1368 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = fma(_1376, _1376, _1380);
    float _1392 = _1390 + _1388;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1396 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1394);
    float _1398 = precise::clamp(_1396, 0.0, 1.0);
    float _1400 = -_1398;
    float _1402 = _1400 + 1.0;
    float _1404 = rsqrt(_1392);
    float _1406 = abs(_1402);
    float _1408 = log2(_1406);
    float _1410 = _1404 * _1360;
    float _1412 = _1404 * _1376;
    float _1414 = _1404 * _1368;
    float _1416 = _1410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1418 = -_1416;
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1418);
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1420);
    float _1428 = exp2(_1422);
    float _1430 = fma(_1426, -0.5, 0.5);
    float _1432 = fma(_1426, 0.5, 0.5);
    float _1434 = fma(_1432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1436 = sqrt(_1430);
    float _1438 = fma(_1432, _1434, -0.212114393711090087890625);
    float _1440 = _1412 + 1.0;
    float _1442 = fma(_1432, _1438, 1.570728778839111328125);
    float _1444 = -_1412;
    float _1446 = fma(_1428, _1440, _1444);
    float _1448 = fma(_1446, 0.5, 0.5);
    float _1450 = _1436 * 0.636619746685028076171875;
    float _1452 = -_1442;
    float _1454 = fma(_1450, _1452, 1.0);
    float2 _4396 = float2(_1454, _1448);
    float3 _1458 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).xyz;
    float _1460 = _1458.x;
    float _1462 = _1458.y;
    float _1464 = _1458.z;
    float _1466 = in.m_67.x;
    float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _1470 = _152 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _1472 = _340 != 0.0;
    bool _1474 = isnan(_340);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    float _1482 = in.m_69.x;
    float _1484 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1486 = _334 == 0.0;
    bool _1488 = !_1480;
    bool _1490 = _1486 && _1488;
    float _1492 = in.m_67.y;
    float _1494 = abs(_450);
    float _1496 = log2(_1494);
    float _1498 = _853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1500 = in.m_71.x;
    float _1502 = in.m_71.y;
    float _1504 = in.m_71.z;
    bool _1506 = _344 == 0.0;
    bool _1508 = _1506 && _1490;
    float _1510 = -_322;
    float _1512 = _1510 + 1.0;
    int _1514 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1516 = _1514 != 0;
    float _1518 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1498);
    float _1520 = _1470 * _1468;
    float _1522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1524 = in.m_69.y;
    int _1526 = abs(_577);
    float _1528 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1518);
    bool _1530 = _450 <= 8000.0;
    bool _1532 = isnan(_450);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(8000.0);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    out.m_73.y = _340;
    float _1542 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1520);
    float _1544 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1546 = exp2(_1484);
    float _1548 = float(_1526);
    out.m_73.x = _334;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1556 = _1554 != 0;
    float _1558 = _1542 * 6.283185482025146484375;
    bool _1560 = _1466 > 0.5;
    bool _1562 = _1560 && _1552;
    float _1564 = floor(_1542);
    bool _1566 = _1492 > 0.5;
    float _1568 = _1558 * 0.15915493667125701904296875;
    float _1570 = _1502;
    float _1572 = _1500;
    float _1574 = _1504;
    float _1576 = _1558;
    if (!_1508)
    {
        float _1578 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1502);
        _1570 = _1578;
    }
    float _1580 = _1570;
    if (!_1508)
    {
        float _1582 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1500);
        _1572 = _1582;
    }
    float _1584 = _1572;
    if (!_1508)
    {
        float _1586 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1504);
        _1574 = _1586;
    }
    float _1588 = _1574;
    float _1590 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1592 = 0.0;
    if (_1552)
    {
        _1592 = _1482;
    }
    float _1594 = _1592;
    float _1596 = -_1524;
    float _1598 = _1596 + 1.0;
    float _1600 = _1594;
    float _1602 = _1524;
    if (!_1552)
    {
        _1576 = _1482;
    }
    float _1604 = _1576;
    float _1606 = _1568 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    float _1610 = _1604;
    if (_1562)
    {
        float _1612 = -_1594;
        float _1614 = _1612 + 1.0;
        _1600 = _1614;
    }
    float _1616 = _1600;
    if (_1556)
    {
        float _1618 = _1566 ? _1598 : _1524;
        _1602 = _1618;
    }
    float _1620 = _1602;
    float _1622 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1624 = -_1564;
    float _1626 = _1542 + _1624;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1552)
    {
        _1610 = _1616;
    }
    float _1630 = _1610;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1634 = -_1626;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1638 = _1626 < 0.5;
    float _1640 = float(_1638);
    float _1642 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1644 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1622);
    float _1646 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1648 = exp2(_1544);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1652 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1656 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1652 * _1522;
    float _1662 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1646 * _1632;
    float _1666 = fma(_1608, 0.5, 0.5);
    float _1668 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1590);
    out.m_75.x = _1658;
    out.m_75.y = _1662;
    out.m_75.z = _1656;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1642);
    out.m_77.x = _1660;
    out.m_77.y = _1664;
    float _1672 = -_1640;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1676 = -_1666;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1686 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1668);
    float _1688 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1644);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1670);
    bool _1692 = !_1516;
    int _1694 = _1692 ? 0 : 1;
    float _1696 = fma(_1648, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1702 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1704 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1706 = fma(_1698, -2.0, 3.0);
    float _1708 = _1698 * _1698;
    float _1710 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1712 = abs(_1694);
    float _1714 = abs(_1636);
    float _1716 = _1548 * _1714;
    float _1718 = _1708 * _1706;
    float _1720 = in.m_79.x;
    float _1722 = -_1546;
    float _1724 = _1722 + 1.0;
    float _1726 = -_1718;
    float _1728 = _1726 + 1.0;
    out.m_81.x = _1702;
    out.m_81.y = _1704;
    out.m_81.z = _1710;
    out.m_81.w = _1700;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1718);
    out.m_73.z = _344;
    float _1732 = _1540 * _1730;
    out.m_83.x = _1686;
    out.m_83.y = _1688;
    out.m_83.z = _1690;
    float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _729;
    out.m_85.y = _727;
    out.m_85.z = _731;
    float _1736 = float(_1712);
    float _1738 = _1512 * _1734;
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    int _1742 = abs(_617);
    float _1744 = _1090 * _1152;
    float _1746 = fma(_1736, _1678, _1716);
    float _1748 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1528);
    float _1750 = float(_1742);
    float _1752 = -_1740;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1758 = _1748 + _897;
    out.gl_Position.x = _953;
    out.gl_Position.y = _955;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _897;
    float _1760 = abs(_1674);
    float _1762 = fma(_1750, _1760, _1746);
    float _1764 = _1758 * 0.5;
    out.m_87.x = _1720;
    float _1766 = _1762 * _1756;
    out.m_89.z = _1764;
    out.m_89.w = _897;
    float _1768 = _897;
    float _1770 = _1764;
    if (!_885)
    {
        _963 = 1.0;
    }
    float _1772 = _963;
    float _1774 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1776 = _1772;
    if (_885)
    {
        bool _1778 = _1001 >= _979;
        bool _1780 = isnan(_1001);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan(_979);
        bool _1786 = _1782 || _1784;
        float _1788 = float(_1786);
        _1776 = _1788;
    }
    float _1790 = _1776;
    bool _1792 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1794 = isnan(_1242);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1800 = _1796 || _1798;
    float _1802 = _1774 * _1003;
    float _1804 = -_1774;
    float _1806 = _1804 + 1.0;
    float _1808 = _1790 * _1220;
    float _1810 = _1014 * _1802;
    float _1812 = _1014 * _1806;
    float _1814 = -_1808;
    float _1816 = fma(_1814, _1754, 1.0);
    float _1818 = precise::clamp(_1816, 0.0, 1.0);
    float _1820 = _1818 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1822 = _1818;
    float _1824 = _1806;
    float _1826 = _1810;
    if (!_1800)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1828 = _1768;
    float _1830 = _1828;
    float _1832 = _1828;
    if (!_1800)
    {
        _1770 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1834 = _1770;
    out.m_91.x = _1820;
    float _1836 = _1834;
    float _1838 = _1834;
    if (!_1800)
    {
        _907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1840 = _907;
    float _1842 = _1840;
    float _1844 = _1840;
    if (!_1800)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1846 = _1822;
    float _1848 = _1846;
    float _1850 = _1846;
    if (!_1800)
    {
        _1824 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1852 = _1824;
    float _1854 = _1464 * _1802;
    float _1856 = fma(_1460, _1810, _1008);
    float _1858 = fma(_1462, _1810, _1010);
    float _1860 = _1852;
    float _1862 = _1852;
    if (!_1800)
    {
        _1826 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1864 = _1826;
    float _1866 = fma(_1014, _1854, _1012);
    out.m_93.x = _1856;
    out.m_93.y = _1858;
    out.m_93.z = _1866;
    out.m_93.w = _1812;
    bool _1868 = !_1800;
    float _1870 = _1864;
    float _1872 = _1864;
    if (!_1868)
    {
        bool _1874 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1876 = isnan(_1242);
        bool _1878 = _1874 || _1876;
        bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1882 = _1878 || _1880;
        if (!_1882)
        {
            float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1886 = _1242 + _1884;
            float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1890 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1888;
            float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1896 = 1.0 / _1890;
            float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1914 = _1886 * _1896;
            float _1916 = precise::clamp(_1914, 0.0, 1.0);
            float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1922 = fma(_1916, _1894, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1924 = fma(_1916, _1920, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1926 = fma(_1916, _1900, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1928 = fma(_1916, _1904, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1930 = fma(_1916, _1908, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1932 = fma(_1916, _1912, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1838 = _1926;
            _1850 = _1930;
            _1832 = _1922;
            _1872 = _1928;
            _1844 = _1924;
            _1862 = _1932;
            _1934 = true;
        }
        else
        {
            bool _1936 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1938 = isnan(_1242);
            bool _1940 = _1936 || _1938;
            bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1944 = _1940 || _1942;
            if (!_1944)
            {
                _1830 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1946 = _1830;
            _1832 = _1946;
            if (!_1944)
            {
                _1836 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1948 = _1836;
            _1838 = _1948;
            if (!_1944)
            {
                _1842 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1950 = _1842;
            _1844 = _1950;
            if (!_1944)
            {
                _1870 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1952 = _1870;
            _1872 = _1952;
            if (!_1944)
            {
                _1848 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1954 = _1848;
            _1850 = _1954;
            if (!_1944)
            {
                _1860 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1956 = _1860;
            bool _1958 = !_1944;
            _1862 = _1956;
            if (!_1958)
            {
                bool _1960 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1962 = isnan(_1242);
                bool _1964 = _1960 || _1962;
                bool _1966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1968 = _1964 || _1966;
                if (!_1968)
                {
                    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1972 = _1242 + _1970;
                    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1976 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1974;
                    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1982 = 1.0 / _1976;
                    float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1986 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2000 = _1972 * _1982;
                    float _2002 = precise::clamp(_2000, 0.0, 1.0);
                    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2008 = fma(_2002, _1980, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2010 = fma(_2002, _2006, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2012 = fma(_2002, _1986, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2014 = fma(_2002, _1990, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2016 = fma(_2002, _1994, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2018 = fma(_2002, _1998, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1838 = _2012;
                    _1850 = _2016;
                    _1832 = _2008;
                    _1872 = _2014;
                    _1844 = _2010;
                    _1862 = _2018;
                    _1934 = true;
                }
                else
                {
                    _1838 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1850 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1832 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1872 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1844 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1862 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1934 = false;
    float _2020 = _1838;
    float _2022 = _1850;
    float _2024 = _1832;
    float _2026 = _1872;
    float _2028 = _1844;
    float _2030 = _1862;
    float _2032 = fma(_1688, -0.5, 0.5);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = -_2020;
    float _2038 = _2036 + _2022;
    float _2040 = -_2024;
    float _2042 = _2040 + _2026;
    out.m_95.x = 0.0;
    float _2044 = fma(_2034, _2038, _2020);
    float _2046 = _1766 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2048 = fma(_2034, _2042, _2024);
    float _2050 = -_2028;
    float _2052 = _2050 + _2030;
    float _2054 = _2044 * 0.586610972881317138671875;
    bool _2056 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _2046;
    float _2058 = fma(_2034, _2052, _2028);
    float _2060 = fma(_2048, 0.298911988735198974609375, _2054);
    bool _2062 = _1090 > 0.0;
    bool _2064 = isnan(_1090);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(0.0);
    bool _2070 = _2066 || _2068;
    float _2072 = fma(_2058, 0.114477999508380889892578125, _2060);
    bool _2074 = _1152 <= 0.0;
    bool _2076 = !_2070;
    bool _2078 = _2074 || _2076;
    float _2080 = -_2072;
    float _2082 = _2048 + _2080;
    float _2084 = -_2072;
    float _2086 = _2044 + _2084;
    float _2088 = -_2072;
    float _2090 = _2058 + _2088;
    float _2092 = fma(_2082, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    float _2094 = fma(_2086, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    float _2096 = fma(_2090, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    bool _2098 = !_2056;
    if (!_2098)
    {
        float _2100 = -_727;
        float _2102 = _2100 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2104 = -_729;
        float _2106 = _2104 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2108 = -_731;
        float _2110 = _2108 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2112 = _2102 * _2102;
        float _2114 = fma(_2106, _2106, _2112);
        float _2116 = fma(_2110, _2110, _2114);
        float _2118 = sqrt(_2116);
        float _2120 = rsqrt(_2116);
        float _2122 = -_2118;
        float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2126 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2128 = precise::clamp(_2126, 0.0, 1.0);
        float _2130 = _2106 * _2120;
        float _2132 = _2102 * _2120;
        float _2134 = abs(_2128);
        float _2136 = log2(_2134);
        float _2138 = _2110 * _2120;
        float _2140 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2142 = _1688 * _2132;
        float _2144 = -_2132;
        float _2146 = -_2140;
        float _2148 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2146);
        float _2150 = fma(_1686, _2130, _2142);
        float _2152 = -_2138;
        float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2148);
        float _2156 = fma(_1690, _2138, _2150);
        float _2158 = precise::clamp(_2156, 0.0, 1.0);
        float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2162 = _2154 + _2160;
        float _2164 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2166 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2168 = precise::clamp(_2166, 0.0, 1.0);
        float _2170 = exp2(_2164);
        float _2172 = _2170 * _2168;
        float _2174 = _2158 * _2172;
        float _2176 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2178 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2180 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2176;
        out.m_95.y = _2178;
        out.m_95.z = _2180;
    }
    out.m_97.x = _2092;
    out.m_97.y = _2094;
    out.m_97.z = _2096;
    if (!_2078)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2182;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1934 = false;
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
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2241 = as_type<float>(_134);
        out.gl_Position.z = _2241;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_61.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_148)
    {
        float _154 = float(_116);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
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
        _136 = as_type<int>(_166);
    }
    int _168 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_168);
        out.gl_Position.z = _2309;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_63.w;
    float _172 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_61.x;
    float _186 = in.m_61.y;
    float _188 = in.m_61.z;
    float _190 = in.m_56.x;
    float _192 = in.m_56.y;
    float _194 = in.m_56.z;
    float _196 = 0.0;
    float _198 = _172;
    if (!_182)
    {
        float _200 = _172 * _172;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    float _206 = _204;
    if (!_182)
    {
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_182;
    float _214 = _210;
    if (!_212)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _172 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _172);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _244;
    }
    float _246 = _214;
    bool _248 = !_182;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _172 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _198 = _268;
    }
    float _270 = _198;
    float _272 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_270, _186, _272);
    float _280 = fma(_270, _184, _274);
    float _282 = fma(_270, _188, _276);
    float _284 = fma(_278, _170, _192);
    float _286 = fma(_280, _170, _190);
    float _288 = fma(_282, _170, _194);
    float _290 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _290);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _294);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _296);
    float _302 = _298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _304 = _300 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _308 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _310 = floor(_306);
    float _312 = floor(_308);
    float _314 = -_310;
    float _316 = _306 + _314;
    float _318 = -_312;
    float _320 = _308 + _318;
    float2 _2558 = float2(_316, _320);
    float _322 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2558, float2(0.0), isnan(_2558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2558, float2(0.0), isnan(_2558)), level(0.0)).x;
    float _324 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = in.m_63.x;
    float _328 = in.m_63.y;
    float _330 = in.m_63.z;
    float _332 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _334 = in.m_65.x;
    float _336 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _338 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _340 = in.m_65.y;
    float _342 = _336 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _344 = in.m_65.z;
    float _346 = _342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _348 = _342 + _338;
    float _350 = fma(_302, (*spvDescriptorSet0.vp_c8)._m0[11].x, _346);
    float _352 = _348 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _354 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].z, _350);
    float _356 = _342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _364 = fma(_302, (*spvDescriptorSet0.vp_c8)._m0[10].x, _356);
    float _366 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _370 = 1.0 / _362;
    float _372 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].z, _364);
    float _374 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _378 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[127].x, _352);
    float _380 = _372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _382 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[127].z, _378);
    float _384 = _380 + _362;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _388 = _382 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _390 = _386 * _368;
    float _392 = _348 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _394 = _384 * _370;
    float _396 = _394 * 0.5;
    float _398 = trunc(_388);
    int _400 = int(_398);
    float _402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c8)._m0[30].w, _402);
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _340);
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _410 = _406 * _374;
    float _412 = 1.0 / _404;
    float _414 = _408 * _376;
    float _416 = fma(_302, (*spvDescriptorSet0.vp_c15)._m0[126].x, _392);
    float _418 = _410 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _420 = _410 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _422 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[126].z, _416);
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].x, _418);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].x, _420);
    int _428 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _430 = _400 + _428;
    int _432 = _430 + 1;
    float _434 = _422 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _424);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _426);
    float _440 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _442 = trunc(_434);
    int _444 = int(_442);
    float _446 = _302 + _436;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _450 = _412 * _448;
    float _452 = _304 + _438;
    float _454 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].x, _440);
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _458 = _446 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _462 = _452 + _460;
    bool _464 = _450 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _466 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _454);
    bool _468 = _450 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _470 = _462 * _462;
    bool _472 = !_464;
    int _474 = _472 ? 0 : 1;
    float _476 = _342 + _466;
    float _478 = fma(_458, _458, _470);
    int _480 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _482 = _444 + _480;
    int _484 = _482 + 1;
    float _486 = sqrt(_478);
    int _488 = _484 | _432;
    int _490 = 2;
    int _492 = _488;
    float _494 = _342;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    int _498 = _432;
    int _500 = as_type<int>(_452);
    float _502 = _466;
    float _504 = _458;
    float _506 = _434;
    float _508 = _304;
    if (!_464)
    {
        _490 = 1;
    }
    int _510 = _490;
    int _512 = _510;
    if (!_468)
    {
        _512 = _474;
    }
    int _514 = _512;
    bool _516 = _484 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _518 = _514 << 6;
    bool _520 = _488 < 0;
    bool _522 = _520 || _516;
    int _524 = _518 + 96;
    uint _527 = uint(int(uint(_524) >> uint(2)));
    uint _529 = uint(int(uint(int(_527)) >> uint(2)));
    int _531 = int(_527) & 3;
    float _533 = (*spvDescriptorSet0.vp_c15)._m0[int(_529)][_531];
    int _535 = int(_527) + 1;
    uint _537 = uint(int(uint(_535) >> uint(2)));
    int _539 = _535 & 3;
    float _541 = (*spvDescriptorSet0.vp_c15)._m0[int(_537)][_539];
    bool _543 = _432 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _545 = _543 || _522;
    bool _547 = _486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _549 = _518 + 48;
    uint _551 = uint(int(uint(_549) >> uint(2)));
    uint _553 = uint(int(uint(int(_551)) >> uint(2)));
    int _555 = int(_551) & 3;
    float _557 = (*spvDescriptorSet0.vp_c15)._m0[int(_553)][_555];
    int _559 = int(_551) + 1;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    int _563 = _559 & 3;
    float _565 = (*spvDescriptorSet0.vp_c15)._m0[int(_561)][_563];
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _573 = _571 != 0;
    bool _575 = !_569;
    int _577 = _575 ? 0 : 1;
    if (!_545)
    {
        int _579 = _432 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _581 = _579 + _484;
        _492 = _581;
    }
    int _583 = _492;
    int _585 = _518 + 56;
    uint _587 = uint(int(uint(_585) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.vp_c15)._m0[int(_589)][_591];
    int _595 = int(_587) + 1;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    int _599 = _595 & 3;
    float _601 = (*spvDescriptorSet0.vp_c15)._m0[int(_597)][_599];
    if (!_547)
    {
        _494 = _446;
    }
    float _603 = _494;
    float _605 = _603;
    if (!_547)
    {
        _496 = _452;
    }
    float _607 = _496;
    float _609 = _607;
    if (!_545)
    {
        int _611 = _583 << 2;
        _498 = _611;
    }
    int _613 = _498;
    bool _615 = !_573;
    int _617 = _615 ? 0 : 1;
    int _619 = _518 + 64;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c15)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.vp_c15)._m0[int(_631)][_633];
    int _637 = _613;
    if (!_545)
    {
        uint _639 = uint(int(uint(_583) >> uint(2)));
        _500 = int(_639);
    }
    int _641 = _500;
    if (!_545)
    {
        int _643 = 12 & _613;
        _637 = _643;
    }
    int _645 = _637;
    if (!_547)
    {
        _502 = _476;
    }
    float _647 = _502;
    int _649 = _518 + 72;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    uint _653 = uint(int(uint(int(_651)) >> uint(2)));
    int _655 = int(_651) & 3;
    float _657 = (*spvDescriptorSet0.vp_c15)._m0[int(_653)][_655];
    int _659 = int(_651) + 1;
    uint _661 = uint(int(uint(_659) >> uint(2)));
    int _663 = _659 & 3;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[int(_661)][_663];
    int _667 = _518 + 104;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    uint _671 = uint(int(uint(int(_669)) >> uint(2)));
    int _673 = int(_669) & 3;
    float _675 = (*spvDescriptorSet0.vp_c15)._m0[int(_671)][_673];
    int _677 = int(_669) + 1;
    uint _679 = uint(int(uint(_677) >> uint(2)));
    int _681 = _677 & 3;
    float _683 = (*spvDescriptorSet0.vp_c15)._m0[int(_679)][_681];
    float _685 = _348 * _541;
    bool _687 = !_547;
    float _689 = _647;
    if (!_687)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _693 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _695 = _486 + _693;
        float _697 = _476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = rsqrt(_478);
        float _701 = _695 * _691;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = cos(_705);
        float _709 = _703 * 6.283185482025146484375;
        float _711 = sin(_709);
        float _713 = _707 + (-1.0);
        float _715 = _713 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = fma(_711, _697, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _719 = fma(_476, _707, _715);
        float _721 = _699 * _717;
        float _723 = fma(_458, _721, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _725 = fma(_462, _721, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _689 = _719;
        _605 = _723;
        _609 = _725;
    }
    float _727 = _689;
    float _729 = _605;
    float _731 = _609;
    float _733 = _727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _735 = fma(_302, _533, _685);
    if (!_545)
    {
        int _737 = _641 << 4;
        int _739 = _737 + _645;
        _504 = as_type<float>(_739);
    }
    float _741 = _504;
    float _743 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[2].x, _733);
    float _747 = fma(_304, _675, _735);
    float _749 = _348 * _565;
    int _751 = _518 + 80;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.vp_c15)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.vp_c15)._m0[int(_763)][_765];
    float _769 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[2].z, _745);
    float _771 = _747 + _683;
    float _773 = _348 * _635;
    float _775 = fma(_302, _557, _749);
    float _777 = _769 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _779 = 1.0 / _771;
    float _781 = fma(_302, _627, _773);
    float _783 = _741;
    if (!_545)
    {
        int _785 = as_type<int>(_741) + 400;
        uint _787 = uint(int(uint(_785) >> uint(2)));
        uint _789 = uint(int(uint(int(_787)) >> uint(2)));
        int _791 = int(_787) & 3;
        float _793 = (*spvDescriptorSet0.vp_c15)._m0[int(_789)][_791];
        _783 = _793;
    }
    float _795 = _783;
    float _797 = fma(_304, _593, _775);
    float _799 = _777 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _801 = fma(_304, _657, _781);
    float _803 = _797 + _601;
    float _805 = _727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _807 = _801 + _665;
    int _809 = _518 + 88;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.vp_c15)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.vp_c15)._m0[int(_821)][_823];
    float _827 = _727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _829 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _805);
    float _831 = _727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _833 = -_799;
    float _835 = fma(_833, _743, 1.0);
    float _837 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _827);
    float _839 = _803 * _779;
    float _841 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _829);
    float _843 = _807 * _779;
    float _845 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[1].z, _837);
    float _847 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[3].x, _831);
    bool _849 = _839 >= 0.0;
    float _851 = _841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _855 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[3].z, _847);
    bool _857 = _839 <= 1.0;
    bool _859 = _857 && _849;
    float _861 = 0.0;
    float _863 = _847;
    float _865 = _843;
    if (!_545)
    {
        float _867 = floor(_388);
        _861 = _867;
    }
    float _869 = _861;
    float _871 = _853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _873 = _855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _875 = _843 >= 0.0;
    bool _877 = _875 && _859;
    float _879 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _871);
    float _881 = _853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _883 = _843 <= 1.0;
    bool _885 = _883 && _877;
    float _887 = _799;
    float _889 = _881;
    if (!_545)
    {
        float _891 = floor(_434);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[7].z, _879);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].w, _895);
    float _899 = log2(_835);
    float _901 = _348 * _767;
    float _903 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _881);
    float _905 = _901;
    float _907 = _897;
    if (_885)
    {
        float _909 = float(_514);
        _889 = _909;
    }
    float _911 = _889;
    float _913 = fma(_302, _759, _901);
    float _915 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[4].z, _903);
    float _917 = 1.0 / _897;
    float _919 = _853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_545)
    {
        float _921 = -_893;
        float _923 = _434 + _921;
        _506 = _923;
    }
    float _925 = _506;
    float _927 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _919);
    float _929 = _795;
    if (!_545)
    {
        float _931 = rint(_795);
        float _933 = precise::max(_931, 0.0);
        uint _935 = uint(_933);
        uint _937 = clamp(_935, 0u, 65535u);
        _929 = as_type<float>(_937);
    }
    float _939 = _929;
    float _941 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[5].z, _927);
    float _943 = fma(_304, _817, _913);
    float _945 = _817;
    if (!_545)
    {
        float _947 = -_869;
        float _949 = _388 + _947;
        _945 = _949;
    }
    float _951 = _945;
    float _953 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].w, _915);
    float _955 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].w, _941);
    float _957 = _943 + _825;
    float _959 = _899 * 0.693147182464599609375;
    float _961 = _919;
    float _963 = _955;
    if (_885)
    {
        float _965 = rint(_911);
        float _967 = precise::max(_965, 0.0);
        uint _969 = uint(_967);
        uint _971 = clamp(_969, 0u, 65535u);
        _961 = as_type<float>(_971);
    }
    float _973 = _961;
    float _975 = _953 * _917;
    float _977 = _955 * _917;
    float _979 = _957 * _779;
    float _981 = _959 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _983 = fma(_975, 0.5, 0.5);
    float _985 = fma(_977, -0.5, 0.5);
    float _987 = _939;
    float _989 = _917;
    float _991 = _977;
    if (!_545)
    {
        float3 _3701 = float3(_925, _951, float(as_type<int>(_939)));
        float3 _3705 = select(_3701, float3(0.0), isnan(_3701));
        float _993 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3705.xy, uint(rint(_3705.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3705.xy, uint(rint(_3705.z)), level(0.0)).x;
        _987 = _993;
    }
    float _995 = _987;
    float _997 = _869;
    if (_885)
    {
        float3 _3720 = float3(_839, _843, float(as_type<int>(_973)));
        float3 _3722 = select(_3720, float3(0.0), isnan(_3720));
        float _999 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3722.xy, uint(rint(_3722.z)), _979, level(0.0));
        _997 = _999;
    }
    float _1001 = _997;
    float3 _3732 = float3(_983, _985, _981);
    float _1003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3732, float3(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3732, float3(0.0), isnan(_3732)), level(0.0)).x;
    float3 _3741 = float3(_983, _985, _981);
    float4 _1006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3741, float3(0.0), isnan(_3741)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3741, float3(0.0), isnan(_3741)), level(0.0)).xyzw;
    float _1008 = _1006.x;
    float _1010 = _1006.y;
    float _1012 = _1006.z;
    float _1014 = _1006.w;
    bool _1016 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1018 = isnan(0.5);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1024 = _1020 || _1022;
    if (_545)
    {
        _989 = 1.0;
    }
    float _1026 = _989;
    float _1028 = _1026;
    if (_1024)
    {
        _905 = 1.0;
    }
    float _1030 = _905;
    float _1032 = _1030;
    if (_1024)
    {
        _863 = 1.0;
    }
    float _1034 = _863;
    float _1036 = _1034;
    if (!_1024)
    {
        float _1038 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1040 = _1038 * 0.15915493667125701904296875;
        float _1042 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1044 = _1040 * 6.283185482025146484375;
        float _1046 = cos(_1044);
        float _1048 = _1042 * 0.15915493667125701904296875;
        float _1050 = _1040 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = 1.0 / _1046;
        float _1056 = _1048 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1052 * _1054;
        float _1062 = _1048 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1058 * _1060;
        float _1068 = 1.0 / _1066;
        float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1072 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1070;
        float _1074 = 1.0 / _1072;
        float _1076 = _1064 * _1068;
        float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1080 = fma(_450, _1076, _1078);
        float _1082 = _1080 * _1074;
        float _1084 = precise::clamp(_1082, 0.0, 1.0);
        _991 = _1054;
        _865 = _1048;
        _1036 = _1084;
    }
    float _1086 = _991;
    float _1088 = _865;
    float _1090 = _1036;
    float _1092 = _1086;
    float _1094 = _1088;
    if (!_1024)
    {
        float _1096 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1102 = _1098 * 6.283185482025146484375;
        float _1104 = cos(_1102);
        float _1106 = _1100 * 0.15915493667125701904296875;
        float _1108 = _1098 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        float _1112 = 1.0 / _1104;
        float _1114 = _1106 * 6.283185482025146484375;
        float _1116 = cos(_1114);
        float _1118 = _1110 * _1112;
        float _1120 = _1106 * 6.283185482025146484375;
        float _1122 = sin(_1120);
        float _1124 = _1116 * _1118;
        float _1126 = 1.0 / _1124;
        float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1130 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1128;
        float _1132 = 1.0 / _1130;
        float _1134 = _1122 * _1126;
        float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1138 = fma(_450, _1134, _1136);
        float _1140 = _1138 * _1132;
        float _1142 = precise::clamp(_1140, 0.0, 1.0);
        float _1144 = -_1142;
        float _1146 = _1144 + 1.0;
        _1092 = _1098;
        _1094 = _1124;
        _1032 = _1146;
    }
    float _1148 = _1092;
    float _1150 = _1094;
    float _1152 = _1032;
    float _1154 = _1148;
    float _1156 = _1150;
    if (!_545)
    {
        int _1158 = _583 << 4;
        int _1160 = _1158 + 2048;
        uint _1162 = uint(int(uint(_1160) >> uint(2)));
        uint _1164 = uint(int(uint(int(_1162)) >> uint(2)));
        int _1166 = int(_1162) & 3;
        float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
        int _1170 = int(_1162) + 1;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        int _1174 = _1170 & 3;
        float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
        int _1178 = _1160 + 8;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
        int _1184 = int(_1180) & 3;
        float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
        int _1188 = int(_1180) + 1;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        int _1192 = _1188 & 3;
        float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
        float _1196 = _348 * _1176;
        float _1198 = fma(_302, _1168, _1196);
        float _1200 = fma(_304, _1186, _1198);
        float _1202 = _1200 + _1194;
        float _1204 = precise::clamp(_1202, 0.0, 1.0);
        float _1206 = -_1204;
        float _1208 = _1206 + _995;
        float _1210 = fma(_1208, 500.0, 1.5);
        float _1212 = exp2(_1210);
        float _1214 = 0.0 + _1212;
        float _1216 = precise::clamp(_1214, 0.0, 1.0);
        _1154 = _1212;
        _1028 = _1216;
    }
    float _1218 = _1154;
    float _1220 = _1028;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1224 = _727 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1228 = _729 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1232 = _731 + _1230;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1228, _1228, _1234);
    float _1238 = fma(_1232, _1232, _1236);
    float _1240 = rsqrt(_1238);
    float _1242 = sqrt(_1238);
    float _1244 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1246 = _1228 * _1244;
    float _1248 = _1232 * _1244;
    float _1250 = _1246 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 + _1252;
    float _1256 = sqrt(_1254);
    bool _1258 = _1256 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = _1256 + _1260;
    float _1264 = _1240;
    float _1266 = _1218;
    float _1268 = _1262;
    float _1270 = _1224;
    if (_1258)
    {
        float _1272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1264 = _1272;
    }
    float _1274 = _1264;
    if (_1258)
    {
        float _1276 = rsqrt(_1254);
        _1266 = _1276;
    }
    float _1278 = _1266;
    float _1280 = _1278;
    if (_1258)
    {
        float _1282 = _1262 * _1274;
        _1268 = _1282;
    }
    float _1284 = _1268;
    if (_1258)
    {
        float _1286 = _1284 * 0.15915493667125701904296875;
        _1156 = _1286;
    }
    float _1288 = _1156;
    float _1290 = _1232;
    if (_1258)
    {
        float _1292 = _1288 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1300 = precise::max(0.0, _1298);
    float _1302 = _1274;
    float _1304 = _1300;
    if (_1258)
    {
        float _1306 = _1288 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        _1302 = _1308;
    }
    float _1310 = _1302;
    float _1312 = -_1244;
    float _1314 = -_1300;
    float _1316 = fma(_1224, _1312, _1314);
    if (_1258)
    {
        float _1318 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1318;
    }
    float _1320 = _1270;
    float _1322 = _1320;
    float _1324 = _1296;
    if (_1258)
    {
        float _1326 = fma(_1296, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1326;
    }
    float _1328 = _1322;
    float _1330 = _1328;
    if (!_1258)
    {
        _1324 = _1246;
    }
    float _1332 = _1324;
    float _1334 = _1332;
    float _1336 = _1310;
    if (_1258)
    {
        float _1338 = _1310 + (-1.0);
        _1304 = _1338;
    }
    float _1340 = _1304;
    float _1342 = 0.0;
    float _1344 = _1340;
    if (_1258)
    {
        float _1346 = _1278 * _1328;
        _1342 = _1346;
    }
    float _1348 = _1342;
    if (!_1258)
    {
        _1330 = _1316;
    }
    float _1350 = _1330;
    float _1352 = _1350;
    if (_1258)
    {
        float _1354 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _508 = _1354;
    }
    float _1356 = _508;
    if (_1258)
    {
        float _1358 = _1246 * _1348;
        _1334 = _1358;
    }
    float _1360 = _1334;
    if (!_1258)
    {
        _1344 = _1248;
    }
    float _1362 = _1344;
    float _1364 = _1362;
    if (_1258)
    {
        float _1366 = _1248 * _1348;
        _1364 = _1366;
    }
    float _1368 = _1364;
    if (!_1258)
    {
        _1280 = _1250;
    }
    float _1370 = _1280;
    float _1372 = _1370;
    if (_1258)
    {
        float _1374 = fma(_1316, _1310, _1356);
        _1352 = _1374;
    }
    float _1376 = _1352;
    if (_1258)
    {
        float _1378 = _1360 * _1360;
        _1372 = _1378;
    }
    float _1380 = _1372;
    if (!_1258)
    {
        _1336 = _1252;
    }
    float _1382 = _1336;
    float _1384 = _1382;
    if (_1258)
    {
        float _1386 = _1368 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = fma(_1376, _1376, _1380);
    float _1392 = _1390 + _1388;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1396 = fma(_1242, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1394);
    float _1398 = precise::clamp(_1396, 0.0, 1.0);
    float _1400 = -_1398;
    float _1402 = _1400 + 1.0;
    float _1404 = rsqrt(_1392);
    float _1406 = abs(_1402);
    float _1408 = log2(_1406);
    float _1410 = _1404 * _1360;
    float _1412 = _1404 * _1376;
    float _1414 = _1404 * _1368;
    float _1416 = _1410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1418 = -_1416;
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1418);
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1424 = -_1414;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1420);
    float _1428 = exp2(_1422);
    float _1430 = fma(_1426, -0.5, 0.5);
    float _1432 = fma(_1426, 0.5, 0.5);
    float _1434 = fma(_1432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1436 = sqrt(_1430);
    float _1438 = fma(_1432, _1434, -0.212114393711090087890625);
    float _1440 = _1412 + 1.0;
    float _1442 = fma(_1432, _1438, 1.570728778839111328125);
    float _1444 = -_1412;
    float _1446 = fma(_1428, _1440, _1444);
    float _1448 = fma(_1446, 0.5, 0.5);
    float _1450 = _1436 * 0.636619746685028076171875;
    float _1452 = -_1442;
    float _1454 = fma(_1450, _1452, 1.0);
    float2 _4396 = float2(_1454, _1448);
    float3 _1458 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).xyz;
    float _1460 = _1458.x;
    float _1462 = _1458.y;
    float _1464 = _1458.z;
    float _1466 = in.m_67.x;
    float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _1470 = _152 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _1472 = _340 != 0.0;
    bool _1474 = isnan(_340);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    float _1482 = in.m_69.x;
    float _1484 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1486 = _334 == 0.0;
    bool _1488 = !_1480;
    bool _1490 = _1486 && _1488;
    float _1492 = in.m_67.y;
    float _1494 = abs(_450);
    float _1496 = log2(_1494);
    float _1498 = _853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1500 = in.m_71.x;
    float _1502 = in.m_71.y;
    float _1504 = in.m_71.z;
    bool _1506 = _344 == 0.0;
    bool _1508 = _1506 && _1490;
    float _1510 = -_322;
    float _1512 = _1510 + 1.0;
    int _1514 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1516 = _1514 != 0;
    float _1518 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1498);
    float _1520 = _1470 * _1468;
    float _1522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1524 = in.m_69.y;
    int _1526 = abs(_577);
    float _1528 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1518);
    bool _1530 = _450 <= 8000.0;
    bool _1532 = isnan(_450);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(8000.0);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    out.m_73.y = _340;
    float _1542 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1520);
    float _1544 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1546 = exp2(_1484);
    float _1548 = float(_1526);
    out.m_73.x = _334;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1556 = _1554 != 0;
    float _1558 = _1542 * 6.283185482025146484375;
    bool _1560 = _1466 > 0.5;
    bool _1562 = _1560 && _1552;
    float _1564 = floor(_1542);
    bool _1566 = _1492 > 0.5;
    float _1568 = _1558 * 0.15915493667125701904296875;
    float _1570 = _1502;
    float _1572 = _1500;
    float _1574 = _1504;
    float _1576 = _1558;
    if (!_1508)
    {
        float _1578 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1502);
        _1570 = _1578;
    }
    float _1580 = _1570;
    if (!_1508)
    {
        float _1582 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1500);
        _1572 = _1582;
    }
    float _1584 = _1572;
    if (!_1508)
    {
        float _1586 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1504);
        _1574 = _1586;
    }
    float _1588 = _1574;
    float _1590 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1592 = 0.0;
    if (_1552)
    {
        _1592 = _1482;
    }
    float _1594 = _1592;
    float _1596 = -_1524;
    float _1598 = _1596 + 1.0;
    float _1600 = _1594;
    float _1602 = _1524;
    if (!_1552)
    {
        _1576 = _1482;
    }
    float _1604 = _1576;
    float _1606 = _1568 * 6.283185482025146484375;
    float _1608 = cos(_1606);
    float _1610 = _1604;
    if (_1562)
    {
        float _1612 = -_1594;
        float _1614 = _1612 + 1.0;
        _1600 = _1614;
    }
    float _1616 = _1600;
    if (_1556)
    {
        float _1618 = _1566 ? _1598 : _1524;
        _1602 = _1618;
    }
    float _1620 = _1602;
    float _1622 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1624 = -_1564;
    float _1626 = _1542 + _1624;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1552)
    {
        _1610 = _1616;
    }
    float _1630 = _1610;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1634 = -_1626;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1638 = _1626 < 0.5;
    float _1640 = float(_1638);
    float _1642 = _1580 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1644 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1622);
    float _1646 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1648 = exp2(_1544);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1652 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1656 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1658 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1652 * _1522;
    float _1662 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1646 * _1632;
    float _1666 = fma(_1608, 0.5, 0.5);
    float _1668 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1590);
    out.m_75.x = _1658;
    out.m_75.y = _1662;
    out.m_75.z = _1656;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1642);
    out.m_77.x = _1660;
    out.m_77.y = _1664;
    float _1672 = -_1640;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1676 = -_1666;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1686 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1668);
    float _1688 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1644);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1670);
    bool _1692 = !_1516;
    int _1694 = _1692 ? 0 : 1;
    float _1696 = fma(_1648, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1698 = precise::clamp(_1696, 0.0, 1.0);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1702 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1704 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1706 = fma(_1698, -2.0, 3.0);
    float _1708 = _1698 * _1698;
    float _1710 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1712 = abs(_1694);
    float _1714 = abs(_1636);
    float _1716 = _1548 * _1714;
    float _1718 = _1708 * _1706;
    float _1720 = in.m_79.x;
    float _1722 = -_1546;
    float _1724 = _1722 + 1.0;
    float _1726 = -_1718;
    float _1728 = _1726 + 1.0;
    out.m_81.x = _1702;
    out.m_81.y = _1704;
    out.m_81.z = _1710;
    out.m_81.w = _1700;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1718);
    out.m_73.z = _344;
    float _1732 = _1540 * _1730;
    out.m_83.x = _1686;
    out.m_83.y = _1688;
    out.m_83.z = _1690;
    float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _729;
    out.m_85.y = _727;
    out.m_85.z = _731;
    float _1736 = float(_1712);
    float _1738 = _1512 * _1734;
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    int _1742 = abs(_617);
    float _1744 = _1090 * _1152;
    float _1746 = fma(_1736, _1678, _1716);
    float _1748 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1528);
    float _1750 = float(_1742);
    float _1752 = -_1740;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1758 = _1748 + _897;
    out.gl_Position.x = _953;
    out.gl_Position.y = _955;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _897;
    float _1760 = abs(_1674);
    float _1762 = fma(_1750, _1760, _1746);
    float _1764 = _1758 * 0.5;
    out.m_87.x = _1720;
    float _1766 = _1762 * _1756;
    out.m_89.z = _1764;
    out.m_89.w = _897;
    float _1768 = _897;
    float _1770 = _1764;
    if (!_885)
    {
        _963 = 1.0;
    }
    float _1772 = _963;
    float _1774 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1776 = _1772;
    if (_885)
    {
        bool _1778 = _1001 >= _979;
        bool _1780 = isnan(_1001);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan(_979);
        bool _1786 = _1782 || _1784;
        float _1788 = float(_1786);
        _1776 = _1788;
    }
    float _1790 = _1776;
    bool _1792 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1794 = isnan(_1242);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1800 = _1796 || _1798;
    float _1802 = _1774 * _1003;
    float _1804 = -_1774;
    float _1806 = _1804 + 1.0;
    float _1808 = _1790 * _1220;
    float _1810 = _1014 * _1802;
    float _1812 = _1014 * _1806;
    float _1814 = -_1808;
    float _1816 = fma(_1814, _1754, 1.0);
    float _1818 = precise::clamp(_1816, 0.0, 1.0);
    float _1820 = _1818 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1822 = _1818;
    float _1824 = _1806;
    float _1826 = _1810;
    if (!_1800)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1828 = _1768;
    float _1830 = _1828;
    float _1832 = _1828;
    if (!_1800)
    {
        _1770 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1834 = _1770;
    out.m_91.x = _1820;
    float _1836 = _1834;
    float _1838 = _1834;
    if (!_1800)
    {
        _907 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1840 = _907;
    float _1842 = _1840;
    float _1844 = _1840;
    if (!_1800)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1846 = _1822;
    float _1848 = _1846;
    float _1850 = _1846;
    if (!_1800)
    {
        _1824 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1852 = _1824;
    float _1854 = _1464 * _1802;
    float _1856 = fma(_1460, _1810, _1008);
    float _1858 = fma(_1462, _1810, _1010);
    float _1860 = _1852;
    float _1862 = _1852;
    if (!_1800)
    {
        _1826 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1864 = _1826;
    float _1866 = fma(_1014, _1854, _1012);
    out.m_93.x = _1856;
    out.m_93.y = _1858;
    out.m_93.z = _1866;
    out.m_93.w = _1812;
    bool _1868 = !_1800;
    float _1870 = _1864;
    float _1872 = _1864;
    if (!_1868)
    {
        bool _1874 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1876 = isnan(_1242);
        bool _1878 = _1874 || _1876;
        bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1882 = _1878 || _1880;
        if (!_1882)
        {
            float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1886 = _1242 + _1884;
            float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1890 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1888;
            float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1896 = 1.0 / _1890;
            float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1900 = _1898 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1904 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1908 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1914 = _1886 * _1896;
            float _1916 = precise::clamp(_1914, 0.0, 1.0);
            float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1922 = fma(_1916, _1894, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1924 = fma(_1916, _1920, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1926 = fma(_1916, _1900, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1928 = fma(_1916, _1904, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1930 = fma(_1916, _1908, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1932 = fma(_1916, _1912, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1838 = _1926;
            _1850 = _1930;
            _1832 = _1922;
            _1872 = _1928;
            _1844 = _1924;
            _1862 = _1932;
            _1934 = true;
        }
        else
        {
            bool _1936 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1938 = isnan(_1242);
            bool _1940 = _1936 || _1938;
            bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1944 = _1940 || _1942;
            if (!_1944)
            {
                _1830 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1946 = _1830;
            _1832 = _1946;
            if (!_1944)
            {
                _1836 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1948 = _1836;
            _1838 = _1948;
            if (!_1944)
            {
                _1842 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1950 = _1842;
            _1844 = _1950;
            if (!_1944)
            {
                _1870 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1952 = _1870;
            _1872 = _1952;
            if (!_1944)
            {
                _1848 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1954 = _1848;
            _1850 = _1954;
            if (!_1944)
            {
                _1860 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1956 = _1860;
            bool _1958 = !_1944;
            _1862 = _1956;
            if (!_1958)
            {
                bool _1960 = _1242 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1962 = isnan(_1242);
                bool _1964 = _1960 || _1962;
                bool _1966 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1968 = _1964 || _1966;
                if (!_1968)
                {
                    float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1972 = _1242 + _1970;
                    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1976 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1974;
                    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1982 = 1.0 / _1976;
                    float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1986 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2000 = _1972 * _1982;
                    float _2002 = precise::clamp(_2000, 0.0, 1.0);
                    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2008 = fma(_2002, _1980, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2010 = fma(_2002, _2006, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2012 = fma(_2002, _1986, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2014 = fma(_2002, _1990, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2016 = fma(_2002, _1994, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2018 = fma(_2002, _1998, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1838 = _2012;
                    _1850 = _2016;
                    _1832 = _2008;
                    _1872 = _2014;
                    _1844 = _2010;
                    _1862 = _2018;
                    _1934 = true;
                }
                else
                {
                    _1838 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1850 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1832 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1872 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1844 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1862 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1934 = false;
    float _2020 = _1838;
    float _2022 = _1850;
    float _2024 = _1832;
    float _2026 = _1872;
    float _2028 = _1844;
    float _2030 = _1862;
    float _2032 = fma(_1688, -0.5, 0.5);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = -_2020;
    float _2038 = _2036 + _2022;
    float _2040 = -_2024;
    float _2042 = _2040 + _2026;
    out.m_95.x = 0.0;
    float _2044 = fma(_2034, _2038, _2020);
    float _2046 = _1766 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2048 = fma(_2034, _2042, _2024);
    float _2050 = -_2028;
    float _2052 = _2050 + _2030;
    float _2054 = _2044 * 0.586610972881317138671875;
    bool _2056 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _2046;
    float _2058 = fma(_2034, _2052, _2028);
    float _2060 = fma(_2048, 0.298911988735198974609375, _2054);
    bool _2062 = _1090 > 0.0;
    bool _2064 = isnan(_1090);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan(0.0);
    bool _2070 = _2066 || _2068;
    float _2072 = fma(_2058, 0.114477999508380889892578125, _2060);
    bool _2074 = _1152 <= 0.0;
    bool _2076 = !_2070;
    bool _2078 = _2074 || _2076;
    float _2080 = -_2072;
    float _2082 = _2048 + _2080;
    float _2084 = -_2072;
    float _2086 = _2044 + _2084;
    float _2088 = -_2072;
    float _2090 = _2058 + _2088;
    float _2092 = fma(_2082, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    float _2094 = fma(_2086, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    float _2096 = fma(_2090, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2072);
    bool _2098 = !_2056;
    if (!_2098)
    {
        float _2100 = -_727;
        float _2102 = _2100 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2104 = -_729;
        float _2106 = _2104 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2108 = -_731;
        float _2110 = _2108 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2112 = _2102 * _2102;
        float _2114 = fma(_2106, _2106, _2112);
        float _2116 = fma(_2110, _2110, _2114);
        float _2118 = sqrt(_2116);
        float _2120 = rsqrt(_2116);
        float _2122 = -_2118;
        float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2126 = _2124 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2128 = precise::clamp(_2126, 0.0, 1.0);
        float _2130 = _2106 * _2120;
        float _2132 = _2102 * _2120;
        float _2134 = abs(_2128);
        float _2136 = log2(_2134);
        float _2138 = _2110 * _2120;
        float _2140 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2142 = _1688 * _2132;
        float _2144 = -_2132;
        float _2146 = -_2140;
        float _2148 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2146);
        float _2150 = fma(_1686, _2130, _2142);
        float _2152 = -_2138;
        float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2148);
        float _2156 = fma(_1690, _2138, _2150);
        float _2158 = precise::clamp(_2156, 0.0, 1.0);
        float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2162 = _2154 + _2160;
        float _2164 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2166 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2168 = precise::clamp(_2166, 0.0, 1.0);
        float _2170 = exp2(_2164);
        float _2172 = _2170 * _2168;
        float _2174 = _2158 * _2172;
        float _2176 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2178 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2180 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2176;
        out.m_95.y = _2178;
        out.m_95.z = _2180;
    }
    out.m_97.x = _2092;
    out.m_97.y = _2094;
    out.m_97.z = _2096;
    if (!_2078)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2182;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

