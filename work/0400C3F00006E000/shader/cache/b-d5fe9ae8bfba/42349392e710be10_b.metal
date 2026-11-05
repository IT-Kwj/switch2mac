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
    float4 m_59 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_69 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2024 = false;
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
    float _126 = as_type<float>(_118);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2310 = as_type<float>(_134);
        out.gl_Position.z = _2310;
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
    if (_148)
    {
        float _154 = float(_118);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
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
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_170);
        out.gl_Position.z = _2379;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_63.w;
    float _174 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_61.x;
    float _188 = in.m_61.y;
    float _190 = in.m_61.z;
    float _192 = in.m_56.x;
    float _194 = in.m_56.y;
    float _196 = in.m_56.z;
    float _198 = 0.0;
    float _200 = _174;
    if (!_184)
    {
        float _202 = _174 * _174;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_184)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_184;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _174 * _220;
        float _230 = exp2(_228);
        float _232 = _226 * 0.693147182464599609375;
        float _234 = 1.0 / _232;
        float _236 = 1.0 / _224;
        float _238 = _230 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _234, _174);
        float _244 = _242 * _236;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_184;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _174 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    float _274 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_272, _188, _274);
    float _282 = fma(_272, _186, _276);
    float _284 = fma(_272, _190, _278);
    float _286 = fma(_280, _172, _194);
    float _288 = fma(_282, _172, _192);
    float _290 = fma(_284, _172, _196);
    float _292 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _296 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _292);
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _294);
    float _300 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _304 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _306 = _302 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _308 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _310 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _312 = floor(_308);
    float _314 = floor(_310);
    float _316 = -_312;
    float _318 = _308 + _316;
    float _320 = -_314;
    float _322 = _310 + _320;
    float2 _2628 = float2(_318, _322);
    float _324 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2628, float2(0.0), isnan(_2628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2628, float2(0.0), isnan(_2628)), level(0.0)).x;
    float _326 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _328 = in.m_63.x;
    float _330 = in.m_63.y;
    float _332 = in.m_63.z;
    float _334 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _326);
    float _336 = in.m_65.x;
    float _338 = in.m_65.y;
    float _340 = in.m_65.z;
    float _342 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _334);
    float _344 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _346 = _344 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _348 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _346);
    float _350 = fma(_306, (*spvDescriptorSet0.vp_c8)._m0[11].z, _348);
    float _352 = _344 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _354 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = _350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _360 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _352);
    float _362 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _364 = 1.0 / _358;
    float _366 = fma(_306, (*spvDescriptorSet0.vp_c8)._m0[10].z, _360);
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _370 = _368 + _358;
    float _372 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _370 * _364;
    float _376 = _374 * 0.5;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[30].w, _378);
    float _382 = 1.0 / _380;
    float _384 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _386 = _344 + _384;
    float _388 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _338);
    float _392 = _386 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _394 = _386 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _396 = _390 * _362;
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _340);
    float _400 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[127].x, _394);
    float _402 = _396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _406 = _382 * _404;
    float _408 = _396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _410 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[127].z, _400);
    bool _412 = _406 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _414 = _410 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _416 = _406 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _418 = !_412;
    int _420 = _418 ? 0 : 1;
    float _422 = trunc(_414);
    int _424 = int(_422);
    int _426 = 2;
    float _428 = _344;
    float _430 = _414;
    if (!_412)
    {
        _426 = 1;
    }
    int _432 = _426;
    int _434 = _432;
    if (!_416)
    {
        _434 = _420;
    }
    int _436 = _434;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _336);
    int _440 = _436 << 6;
    float _442 = _438 * _388;
    float _444 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[126].x, _392);
    float _446 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _448 = _440 + 96;
    uint _451 = uint(int(uint(_448) >> uint(2)));
    uint _453 = uint(int(uint(int(_451)) >> uint(2)));
    int _455 = int(_451) & 3;
    float _457 = (*spvDescriptorSet0.vp_c15)._m0[int(_453)][_455];
    int _459 = int(_451) + 1;
    uint _461 = uint(int(uint(_459) >> uint(2)));
    int _463 = _459 & 3;
    float _465 = (*spvDescriptorSet0.vp_c15)._m0[int(_461)][_463];
    float _467 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[10].x, _402);
    float _469 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[126].z, _444);
    float _471 = _398 * _446;
    float _473 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[8].x, _408);
    int _475 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _477 = _424 + _475;
    int _479 = _477 + 1;
    float _481 = _469 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[10].z, _467);
    int _485 = _440 + 104;
    uint _487 = uint(int(uint(_485) >> uint(2)));
    uint _489 = uint(int(uint(int(_487)) >> uint(2)));
    int _491 = int(_487) & 3;
    float _493 = (*spvDescriptorSet0.vp_c15)._m0[int(_489)][_491];
    int _495 = int(_487) + 1;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    int _499 = _495 & 3;
    float _501 = (*spvDescriptorSet0.vp_c15)._m0[int(_497)][_499];
    float _503 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[8].z, _473);
    float _505 = trunc(_481);
    int _507 = int(_505);
    float _509 = _306 + _483;
    float _511 = _304 + _503;
    float _513 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _515 = _509 + _513;
    int _517 = _440 + 48;
    uint _519 = uint(int(uint(_517) >> uint(2)));
    uint _521 = uint(int(uint(int(_519)) >> uint(2)));
    int _523 = int(_519) & 3;
    float _525 = (*spvDescriptorSet0.vp_c15)._m0[int(_521)][_523];
    int _527 = int(_519) + 1;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    int _531 = _527 & 3;
    float _533 = (*spvDescriptorSet0.vp_c15)._m0[int(_529)][_531];
    float _535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _537 = _511 + _535;
    float _539 = _515 * _515;
    float _541 = fma(_537, _537, _539);
    int _543 = _440 + 64;
    uint _545 = uint(int(uint(_543) >> uint(2)));
    uint _547 = uint(int(uint(int(_545)) >> uint(2)));
    int _549 = int(_545) & 3;
    float _551 = (*spvDescriptorSet0.vp_c15)._m0[int(_547)][_549];
    int _553 = int(_545) + 1;
    uint _555 = uint(int(uint(_553) >> uint(2)));
    int _557 = _553 & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _563 = _507 + _561;
    int _565 = _563 + 1;
    float _567 = sqrt(_541);
    bool _569 = _565 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _571 = _440 + 56;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    uint _575 = uint(int(uint(int(_573)) >> uint(2)));
    int _577 = int(_573) & 3;
    float _579 = (*spvDescriptorSet0.vp_c15)._m0[int(_575)][_577];
    int _581 = int(_573) + 1;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    int _585 = _581 & 3;
    float _587 = (*spvDescriptorSet0.vp_c15)._m0[int(_583)][_585];
    int _589 = _565 | _479;
    bool _591 = _589 < 0;
    bool _593 = _591 || _569;
    float _595 = _396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _597 = _440 + 72;
    uint _599 = uint(int(uint(_597) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.vp_c15)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.vp_c15)._m0[int(_609)][_611];
    bool _615 = _479 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _617 = _615 || _593;
    float _619 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[9].x, _595);
    bool _621 = _567 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _623 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[9].z, _619);
    int _625 = _440 + 80;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.vp_c15)._m0[int(_637)][_639];
    float _643 = _386 * _465;
    float _645 = _344 + _623;
    float _647 = fma(_304, _457, _643);
    int _649 = as_type<int>(_643);
    int _651 = as_type<int>(_465);
    int _653 = as_type<int>(_537);
    float _655 = _509;
    if (!_617)
    {
        int _657 = _479 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _659 = _657 + _565;
        _649 = _659;
    }
    int _661 = _649;
    float _663 = fma(_306, _493, _647);
    if (!_621)
    {
        _428 = _509;
    }
    float _665 = _428;
    float _667 = _665;
    if (!_617)
    {
        int _669 = _661 << 2;
        _651 = _669;
    }
    int _671 = _651;
    float _673 = _663 + _501;
    float _675 = _386 * _533;
    int _677 = _671;
    float _679 = _533;
    if (!_617)
    {
        int _681 = 12 & _671;
        _677 = _681;
    }
    int _683 = _677;
    float _685 = 1.0 / _673;
    float _687 = fma(_304, _525, _675);
    float _689 = _687;
    if (!_621)
    {
        _679 = _645;
    }
    float _691 = _679;
    float _693 = _386 * _559;
    float _695 = fma(_304, _551, _693);
    int _697 = as_type<int>(_551);
    float _699 = _691;
    if (!_617)
    {
        uint _701 = uint(int(uint(_661) >> uint(2)));
        _697 = int(_701);
    }
    int _703 = _697;
    float _705 = fma(_306, _579, _687);
    if (!_621)
    {
        _689 = _511;
    }
    float _707 = _689;
    float _709 = fma(_306, _605, _695);
    bool _711 = !_621;
    float _713 = _707;
    if (!_711)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _719 = _567 + _717;
        float _721 = _645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _723 = rsqrt(_541);
        float _725 = _719 * _715;
        float _727 = _725 * 0.15915493667125701904296875;
        float _729 = _727 * 6.283185482025146484375;
        float _731 = cos(_729);
        float _733 = _727 * 6.283185482025146484375;
        float _735 = sin(_733);
        float _737 = _731 + (-1.0);
        float _739 = _737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = fma(_735, _721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _743 = fma(_645, _731, _739);
        float _745 = _723 * _741;
        float _747 = fma(_537, _745, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _749 = fma(_515, _745, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _699 = _743;
        _713 = _747;
        _667 = _749;
    }
    float _751 = _699;
    float _753 = _713;
    float _755 = _667;
    if (!_617)
    {
        int _757 = _703 << 4;
        int _759 = _757 + _683;
        _653 = _759;
    }
    int _761 = _653;
    float _763 = _751 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _765 = _440 + 88;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    float _783 = _705 + _587;
    float _785 = _709 + _613;
    float _787 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _789 = _751 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _791 = _751 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _793 = _783 * _685;
    float _795 = _751 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _797 = _763;
    if (!_617)
    {
        int _799 = _761 + 400;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        uint _803 = uint(int(uint(int(_801)) >> uint(2)));
        int _805 = int(_801) & 3;
        float _807 = (*spvDescriptorSet0.vp_c15)._m0[int(_803)][_805];
        _797 = _807;
    }
    float _809 = _797;
    float _811 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[1].x, _789);
    float _813 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[0].x, _791);
    bool _815 = _793 >= 0.0;
    float _817 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[3].x, _795);
    float _819 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _811);
    float _821 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _813);
    float _823 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _787);
    float _825 = _785 * _685;
    float _827 = _819 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _829 = _793 <= 1.0;
    bool _831 = _829 && _815;
    float _833 = _821 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _835 = _823 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _837 = _827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _839 = _825 >= 0.0;
    bool _841 = _839 && _831;
    float _843 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _845 = _835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _847 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _817);
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _837);
    bool _851 = _825 <= 1.0;
    bool _853 = _851 && _841;
    float _855 = -_845;
    float _857 = fma(_855, _843, 1.0);
    float _859 = _847 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _861 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = _386 * _641;
    float _865 = _827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = _827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _871 = fma(_304, _633, _863);
    float _873 = log2(_857);
    float _875 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _877 = _867;
    float _879 = _825;
    float _881 = _869;
    if (_853)
    {
        float _883 = float(_436);
        _655 = _883;
    }
    float _885 = _655;
    float _887 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _867);
    float _889 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _875);
    float _891 = 1.0 / _869;
    float _893 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _887);
    float _895 = fma(_306, _773, _871);
    float _897 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _889);
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _893);
    float _901 = _587;
    float _903 = _781;
    float _905 = _899;
    if (!_617)
    {
        float _907 = floor(_481);
        _901 = _907;
    }
    float _909 = _901;
    float _911 = _895 + _781;
    float _913 = _873 * 0.693147182464599609375;
    float _915 = _911 * _685;
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _919 = _471;
    if (!_617)
    {
        float _921 = floor(_414);
        _919 = _921;
    }
    float _923 = _919;
    float _925 = _897 * _891;
    float _927 = _899 * _891;
    float _929 = fma(_925, 0.5, 0.5);
    float _931 = fma(_927, -0.5, 0.5);
    float _933 = _885;
    float _935 = _929;
    if (_853)
    {
        float _937 = rint(_885);
        float _939 = precise::max(_937, 0.0);
        uint _941 = uint(_939);
        uint _943 = clamp(_941, 0u, 65535u);
        _933 = as_type<float>(_943);
    }
    float _945 = _933;
    if (!_617)
    {
        float _947 = -_909;
        float _949 = _481 + _947;
        _903 = _949;
    }
    float _951 = _903;
    float _953 = _911;
    if (!_617)
    {
        float _955 = rint(_809);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        uint _961 = clamp(_959, 0u, 65535u);
        _953 = as_type<float>(_961);
    }
    float _963 = _953;
    if (!_617)
    {
        float _965 = -_923;
        float _967 = _414 + _965;
        _430 = _967;
    }
    float _969 = _430;
    float _971 = _923;
    if (_853)
    {
        float3 _3748 = float3(_793, _825, float(as_type<int>(_945)));
        float3 _3752 = select(_3748, float3(0.0), isnan(_3748));
        float _973 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3752.xy, uint(rint(_3752.z)), _915, level(0.0));
        _971 = _973;
    }
    float _975 = _971;
    float3 _3762 = float3(_929, _931, _917);
    float _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3762, float3(0.0), isnan(_3762)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3762, float3(0.0), isnan(_3762)), level(0.0)).x;
    float3 _3771 = float3(_929, _931, _917);
    float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3771, float3(0.0), isnan(_3771)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3771, float3(0.0), isnan(_3771)), level(0.0)).xyzw;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _980.w;
    float _990 = _951;
    float _992 = _963;
    if (!_617)
    {
        float3 _3795 = float3(_951, _969, float(as_type<int>(_963)));
        float3 _3797 = select(_3795, float3(0.0), isnan(_3795));
        float _994 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3797.xy, uint(rint(_3797.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3797.xy, uint(rint(_3797.z)), level(0.0)).x;
        _990 = _994;
    }
    float _996 = _990;
    if (_617)
    {
        _877 = 1.0;
    }
    float _998 = _877;
    float _1000 = _998;
    float _1002 = _996;
    if (!_617)
    {
        int _1004 = _661 << 4;
        int _1006 = _1004 + 2048;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
        int _1012 = int(_1008) & 3;
        float _1014 = (*spvDescriptorSet0.vp_c15)._m0[int(_1010)][_1012];
        int _1016 = int(_1008) + 1;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        int _1020 = _1016 & 3;
        float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
        int _1024 = _1006 + 8;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
        int _1030 = int(_1026) & 3;
        float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
        int _1034 = int(_1026) + 1;
        uint _1036 = uint(int(uint(_1034) >> uint(2)));
        int _1038 = _1034 & 3;
        float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
        float _1042 = _386 * _1022;
        float _1044 = fma(_304, _1014, _1042);
        float _1046 = fma(_306, _1032, _1044);
        float _1048 = _1046 + _1040;
        float _1050 = precise::clamp(_1048, 0.0, 1.0);
        float _1052 = -_1050;
        float _1054 = _1052 + _996;
        float _1056 = fma(_1054, 500.0, 1.5);
        float _1058 = exp2(_1056);
        float _1060 = 0.0 + _1058;
        float _1062 = precise::clamp(_1060, 0.0, 1.0);
        _1000 = _1062;
    }
    float _1064 = _1000;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _751 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _753 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _755 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = _1094 + _1096;
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1100 + _1104;
    float _1108 = _1084;
    float _1110 = _1106;
    float _1112 = _1068;
    if (_1102)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1114;
    }
    float _1116 = _1108;
    if (_1102)
    {
        float _1118 = rsqrt(_1098);
        _992 = _1118;
    }
    float _1120 = _992;
    float _1122 = _1120;
    if (_1102)
    {
        float _1124 = _1106 * _1116;
        _1110 = _1124;
    }
    float _1126 = _1110;
    if (_1102)
    {
        float _1128 = _1126 * 0.15915493667125701904296875;
        _1002 = _1128;
    }
    float _1130 = _1002;
    float _1132 = _1076;
    if (_1102)
    {
        float _1134 = _1130 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _1132 = _1136;
    }
    float _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1142 = precise::max(0.0, _1140);
    float _1144 = _1116;
    float _1146 = _1142;
    if (_1102)
    {
        float _1148 = _1130 * 6.283185482025146484375;
        float _1150 = cos(_1148);
        _1144 = _1150;
    }
    float _1152 = _1144;
    float _1154 = -_1088;
    float _1156 = -_1142;
    float _1158 = fma(_1068, _1154, _1156);
    if (_1102)
    {
        float _1160 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1160;
    }
    float _1162 = _1112;
    float _1164 = _1162;
    float _1166 = _1138;
    if (_1102)
    {
        float _1168 = fma(_1138, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1168;
    }
    float _1170 = _1164;
    float _1172 = _1170;
    if (!_1102)
    {
        _1166 = _1090;
    }
    float _1174 = _1166;
    float _1176 = _1174;
    float _1178 = _1152;
    if (_1102)
    {
        float _1180 = _1152 + (-1.0);
        _1146 = _1180;
    }
    float _1182 = _1146;
    float _1184 = _1182;
    if (_1102)
    {
        float _1186 = _1120 * _1170;
        _935 = _1186;
    }
    float _1188 = _935;
    if (!_1102)
    {
        _1172 = _1158;
    }
    float _1190 = _1172;
    float _1192 = _1190;
    if (_1102)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _1194;
    }
    float _1196 = _879;
    if (_1102)
    {
        float _1198 = _1090 * _1188;
        _1176 = _1198;
    }
    float _1200 = _1176;
    if (!_1102)
    {
        _1184 = _1092;
    }
    float _1202 = _1184;
    float _1204 = _1202;
    if (_1102)
    {
        float _1206 = _1092 * _1188;
        _1204 = _1206;
    }
    float _1208 = _1204;
    if (!_1102)
    {
        _1122 = _1094;
    }
    float _1210 = _1122;
    float _1212 = _1210;
    if (_1102)
    {
        float _1214 = fma(_1158, _1152, _1196);
        _1192 = _1214;
    }
    float _1216 = _1192;
    if (_1102)
    {
        float _1218 = _1200 * _1200;
        _1212 = _1218;
    }
    float _1220 = _1212;
    if (!_1102)
    {
        _1178 = _1096;
    }
    float _1222 = _1178;
    float _1224 = _1222;
    if (_1102)
    {
        float _1226 = _1208 * _1208;
        _1224 = _1226;
    }
    float _1228 = _1224;
    float _1230 = fma(_1216, _1216, _1220);
    float _1232 = _1230 + _1228;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1236 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1234);
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = -_1238;
    float _1242 = _1240 + 1.0;
    float _1244 = rsqrt(_1232);
    float _1246 = abs(_1242);
    float _1248 = log2(_1246);
    float _1250 = _1244 * _1200;
    float _1252 = _1244 * _1216;
    float _1254 = _1244 * _1208;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1258 = -_1256;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1258);
    float _1262 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1264 = -_1254;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1260);
    float _1268 = exp2(_1262);
    float _1270 = fma(_1266, -0.5, 0.5);
    float _1272 = fma(_1266, 0.5, 0.5);
    float _1274 = fma(_1272, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1276 = sqrt(_1270);
    float _1278 = fma(_1272, _1274, -0.212114393711090087890625);
    float _1280 = _1252 + 1.0;
    float _1282 = fma(_1272, _1278, 1.570728778839111328125);
    float _1284 = -_1252;
    float _1286 = fma(_1268, _1280, _1284);
    float _1288 = fma(_1286, 0.5, 0.5);
    float _1290 = _1276 * 0.636619746685028076171875;
    float _1292 = -_1282;
    float _1294 = fma(_1290, _1292, 1.0);
    float2 _4269 = float2(_1294, _1288);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4269, float2(0.0), isnan(_4269)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4269, float2(0.0), isnan(_4269)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = in.m_67.x;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1310 = in.m_69.x;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1320 = _1318 != 0;
    float _1322 = in.m_67.y;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1326 = _1324 != 0;
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1330 = in.m_69.y;
    float _1332 = _827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = in.m_69.w;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1340 = in.m_69.z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1346 = as_type<int>(_1288);
    float _1348 = _1306;
    float _1350 = _1342;
    if (_1314)
    {
        float _1352 = -_1306;
        float _1354 = _1352 + 1.0;
        _1346 = as_type<int>(_1354);
    }
    int _1356 = _1346;
    float _1358 = 0.0;
    if (!_1314)
    {
        _1358 = _1306;
    }
    float _1360 = _1358;
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1366 = false;
    float _1368 = _1360;
    float _1370 = _1364;
    float _1372 = _1310;
    if (_1314)
    {
        bool _1374 = _1310 > 0.5;
        _1366 = _1374;
    }
    bool _1376 = _1366;
    float _1378 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1342);
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1384 = _1380;
    if (_1314)
    {
        float _1386 = _1376 ? as_type<float>(_1356) : _1306;
        _1368 = _1386;
    }
    float _1388 = _1368;
    float _1390 = -_1322;
    float _1392 = _1390 + 1.0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1396 = _1394 != 0;
    float _1398 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1364);
    bool _1400 = _1330 > 0.5;
    float _1402 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1404 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1406 = _1334 > 0.5;
    float _1408 = exp2(_1316);
    int _1410 = _1400 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1414 = fma(_1404, _1388, -0.5);
    bool _1416 = _1340 > 0.5;
    float _1418 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1420 = _1326 ? as_type<float>(_1410) : _1322;
    float _1422 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1412);
    int _1424 = _1406 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1426 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1430 = _1428 != 0;
    out.m_71.y = _1322;
    int _1432 = _1416 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1436 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1440 = _1438 != 0;
    float _1442 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1426);
    float _1444 = _1430 ? as_type<float>(_1432) : _1322;
    float _1446 = fma(_1402, -2.0, _1434);
    float _1448 = -_1336;
    float _1450 = fma(_1436, 2.0, _1448);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1454 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1444, _1362, -0.5);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1460 = _1458 != 0;
    float _1462 = fma(_1454, _1420, -0.5);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1466 = _1460 ? as_type<float>(_1424) : _1322;
    float _1468 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1446);
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1472 = _1464;
    int _1474 = as_type<int>(_1468);
    float _1476 = _1340;
    float _1478 = _1330;
    if (_1320)
    {
        _1470 = _1310;
    }
    float _1480 = _1470;
    float _1482 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1464);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1486 = _1480;
    if (!_1320)
    {
        _1486 = _1340;
    }
    float _1488 = _1486;
    int _1490 = 0;
    if (_1440)
    {
        float _1492 = -_1306;
        float _1494 = _1492 + 1.0;
        _1490 = as_type<int>(_1494);
    }
    int _1496 = _1490;
    float _1498 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1482);
    float _1500 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1502 = _338 != 0.0;
    bool _1504 = isnan(_338);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1514 = -_1468;
    float _1516 = fma(_1498, _1462, _1514);
    float _1518 = fma(_1466, _1500, -0.5);
    float _1520 = in.m_73.x;
    float _1522 = in.m_73.y;
    float _1524 = in.m_73.z;
    float _1526 = as_type<float>(_1496);
    if (!_1320)
    {
        _1472 = _1330;
    }
    float _1528 = _1472;
    float _1530 = -_1484;
    float _1532 = fma(_1512, 2.0, _1530);
    float _1534 = _1528;
    if (_1320)
    {
        _1534 = _1310;
    }
    float _1536 = _1534;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1540 = _336 == 0.0;
    bool _1542 = !_1510;
    bool _1544 = _1540 && _1542;
    if (_1396)
    {
        float _1546 = -_1306;
        float _1548 = _1546 + 1.0;
        _1474 = as_type<int>(_1548);
    }
    int _1550 = _1474;
    float _1552 = 0.0;
    if (!_1396)
    {
        _1552 = _1306;
    }
    float _1554 = _1552;
    float _1556 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1538);
    bool _1558 = _340 == 0.0;
    bool _1560 = _1558 && _1544;
    float _1562 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1564 = _1554;
    if (_1396)
    {
        float _1566 = _1416 ? as_type<float>(_1550) : _1306;
        _1564 = _1566;
    }
    float _1568 = _1564;
    float _1570 = -_152;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1532);
    if (_1440)
    {
        float _1574 = _1400 ? as_type<float>(_1496) : _1306;
        _1348 = _1574;
    }
    float _1576 = _1348;
    float _1578 = -_1338;
    float _1580 = fma(_1562, 2.0, _1578);
    if (!_1320)
    {
        _1526 = _1340;
    }
    float _1582 = _1526;
    float _1584 = in.m_75.x;
    float _1586 = in.m_75.y;
    float _1588 = in.m_75.z;
    float _1590 = in.m_75.w;
    float _1592 = _1582;
    if (_1320)
    {
        _1592 = _1330;
    }
    float _1594 = _1592;
    float _1596 = fma(_1418, _1568, -0.5);
    if (_1320)
    {
        _1476 = _1330;
    }
    float _1598 = _1476;
    float _1600 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1602 = _1600;
    if (!_1320)
    {
        _1478 = _1310;
    }
    float _1604 = _1478;
    float _1606 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1380);
    float _1608 = -_1408;
    float _1610 = _1608 + 1.0;
    if (_1560)
    {
        _1350 = _1520;
    }
    float _1612 = _1350;
    float _1614 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1616 = 0.0;
    float _1618 = _1612;
    if (_1560)
    {
        _1616 = _1522;
    }
    float _1620 = _1616;
    float _1622 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1606);
    float _1624 = _1620;
    if (_1560)
    {
        _1370 = _1612;
    }
    float _1626 = _1370;
    float _1628 = _1604 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1630 = _1626;
    if (!_1560)
    {
        _1618 = _1520;
    }
    float _1632 = _1618;
    float _1634 = -_324;
    float _1636 = _1634 + 1.0;
    float _1638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1560)
    {
        _1384 = _1620;
    }
    float _1640 = _1384;
    out.gl_Position.x = _897;
    out.gl_Position.y = _899;
    out.gl_Position.z = _1600;
    out.gl_Position.w = _869;
    float _1642 = _1640;
    if (!_1560)
    {
        _1624 = _1522;
    }
    float _1644 = _1624;
    if (!_1560)
    {
        float _1646 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1632);
        _1630 = _1646;
    }
    float _1648 = _1630;
    float _1650 = -_152;
    float _1652 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1450);
    float _1654 = 0.0;
    if (_1560)
    {
        _1654 = _1524;
    }
    float _1656 = _1654;
    float _1658 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1664 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1666 = _1656;
    if (_1560)
    {
        _1372 = _1656;
    }
    float _1668 = _1372;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    float _1672 = fma(_1614, -2.0, _1662);
    float _1674 = _1668;
    if (!_1560)
    {
        _1666 = _1524;
    }
    float _1676 = _1666;
    float _1678 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1660);
    float _1680 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1664);
    float _1682 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1560)
    {
        float _1684 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1642 = _1684;
    }
    float _1686 = _1642;
    float _1688 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1398);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1670);
    float _1692 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1678);
    float _1694 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1680);
    float _1696 = fma(_1682, _1576, -0.5);
    if (!_1560)
    {
        float _1698 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1676);
        _1674 = _1698;
    }
    float _1700 = _1674;
    float _1702 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1556);
    float _1704 = fma(_1688, _1414, _1652);
    float _1706 = -_152;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1580);
    float _1710 = _1588 * _1632;
    out.m_77.x = _1690;
    out.m_77.y = _1692;
    out.m_77.z = _1694;
    float _1712 = _1586 * _1676;
    float _1714 = fma(_1702, _1596, _1708);
    float _1716 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1378);
    float _1718 = abs(_406);
    float _1720 = log2(_1718);
    float _1722 = -_1712;
    float _1724 = fma(_1588, _1644, _1722);
    float _1726 = _1704 + 0.5;
    float _1728 = _1714 + 0.5;
    float _1730 = _1724 * _1590;
    float _1732 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1736 = -_1710;
    float _1738 = fma(_1584, _1676, _1736);
    float _1740 = _1584 * _1644;
    float _1742 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_79.w = _1734;
    float _1744 = -_1740;
    float _1746 = fma(_1586, _1632, _1744);
    float _1748 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1672);
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1752 = _1738 * _1590;
    float _1754 = _1746 * _1590;
    float _1756 = -_1748;
    float _1758 = fma(_1622, _1518, _1756);
    float _1760 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1422);
    float _1762 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1764 = fma(_1628, -2.0, _1750);
    float _1766 = _1516 + 0.5;
    float _1768 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1762);
    float _1770 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1772 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1764);
    float _1774 = _1758 + 0.5;
    float _1776 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1778 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1780 = -_1772;
    float _1782 = fma(_1760, _1456, _1780);
    float _1784 = exp2(_1770);
    out.m_81.x = _1726;
    out.m_81.y = _1766;
    out.m_81.z = _1728;
    out.m_81.w = _1774;
    float _1786 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1788 = _406 <= 8000.0;
    bool _1790 = isnan(_406);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(8000.0);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1776);
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1778);
    float _1804 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1786);
    float _1806 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1732);
    float _1808 = fma(_1716, _1696, _1572);
    float _1810 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1802);
    float _1812 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1742);
    out.m_83.x = _753;
    out.m_83.y = _751;
    out.m_83.z = _755;
    float _1814 = _1808 + 0.5;
    float _1816 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1818 = precise::clamp(_1816, 0.0, 1.0);
    float _1820 = _1782 + 0.5;
    float _1822 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1804);
    float _1824 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1800);
    float _1826 = fma(_1818, -2.0, 3.0);
    float _1828 = _1818 * _1818;
    float _1830 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1768);
    float _1832 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1812);
    out.m_85.x = _1822;
    out.m_85.y = _1824;
    out.m_85.z = _1810;
    float _1834 = _1828 * _1826;
    float _1836 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1806);
    out.m_87.x = _1814;
    out.m_87.y = _1820;
    float _1838 = -_1834;
    float _1840 = _1838 + 1.0;
    out.m_89.x = _1830;
    out.m_89.y = _1836;
    out.m_89.z = _1832;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1834);
    float _1844 = _1600 + _869;
    float _1846 = _1822;
    if (!_853)
    {
        _1846 = 1.0;
    }
    float _1848 = _1846;
    float _1850 = _1798 * _1842;
    float _1852 = _1844 * 0.5;
    float _1854 = _1848;
    if (_853)
    {
        bool _1856 = _975 >= _915;
        bool _1858 = isnan(_975);
        bool _1860 = _1856 || _1858;
        bool _1862 = isnan(_915);
        bool _1864 = _1860 || _1862;
        float _1866 = float(_1864);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1872 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1874 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1876 = isnan(_1086);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1882 = _1878 || _1880;
    out.m_91.z = _1852;
    out.m_91.w = _869;
    float _1884 = _1870 * _977;
    float _1886 = _1636 * _1872;
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = _1868 * _1064;
    float _1892 = -_1870;
    float _1894 = _1892 + 1.0;
    float _1896 = _988 * _1884;
    float _1898 = -_1888;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1902 = _988 * _1894;
    float _1904 = -_1890;
    float _1906 = fma(_1904, _1900, 1.0);
    float _1908 = precise::clamp(_1906, 0.0, 1.0);
    float _1910 = _1870;
    float _1912 = _1908;
    float _1914 = _1894;
    if (!_1882)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1916 = _1910;
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1920 = _1916;
    float _1922 = _1916;
    if (!_1882)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1924 = _1912;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1882)
    {
        _881 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1930 = _881;
    out.m_93.x = _1918;
    float _1932 = _1930;
    float _1934 = _1930;
    if (!_1882)
    {
        _1602 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1936 = _1602;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1882)
    {
        _905 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1942 = _905;
    float _1944 = _1942;
    float _1946 = _1942;
    if (!_1882)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1948 = _1914;
    float _1950 = _1304 * _1884;
    float _1952 = fma(_1300, _1896, _982);
    float _1954 = fma(_1302, _1896, _984);
    float _1956 = fma(_988, _1950, _986);
    out.m_95.x = _1952;
    out.m_95.y = _1954;
    out.m_95.z = _1956;
    out.m_95.w = _1902;
    bool _1958 = !_1882;
    float _1960 = _1948;
    float _1962 = _1948;
    if (!_1958)
    {
        bool _1964 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1966 = isnan(_1086);
        bool _1968 = _1964 || _1966;
        bool _1970 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1972 = _1968 || _1970;
        if (!_1972)
        {
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1976 = _1086 + _1974;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1980 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1978;
            float _1982 = 1.0 / _1980;
            float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1986 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2004 = _1976 * _1982;
            float _2006 = precise::clamp(_2004, 0.0, 1.0);
            float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2012 = fma(_2006, _1986, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2014 = fma(_2006, _2010, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2016 = fma(_2006, _1990, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2018 = fma(_2006, _1994, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2020 = fma(_2006, _1998, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2022 = fma(_2006, _2002, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1928 = _2014;
            _1946 = _2020;
            _1922 = _2012;
            _1940 = _2018;
            _1934 = _2016;
            _1962 = _2022;
            _2024 = true;
        }
        else
        {
            bool _2026 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2028 = isnan(_1086);
            bool _2030 = _2026 || _2028;
            bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2034 = _2030 || _2032;
            if (!_2034)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2036 = _1920;
            _1922 = _2036;
            if (!_2034)
            {
                _1926 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2038 = _1926;
            _1928 = _2038;
            if (!_2034)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2040 = _1932;
            _1934 = _2040;
            if (!_2034)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2042 = _1938;
            _1940 = _2042;
            if (!_2034)
            {
                _1944 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2044 = _1944;
            _1946 = _2044;
            if (!_2034)
            {
                _1960 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2046 = _1960;
            bool _2048 = !_2034;
            _1962 = _2046;
            if (!_2048)
            {
                bool _2050 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2052 = isnan(_1086);
                bool _2054 = _2050 || _2052;
                bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2058 = _2054 || _2056;
                if (!_2058)
                {
                    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2062 = _1086 + _2060;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2064;
                    float _2068 = 1.0 / _2066;
                    float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2090 = _2062 * _2068;
                    float _2092 = precise::clamp(_2090, 0.0, 1.0);
                    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2098 = fma(_2092, _2072, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2100 = fma(_2092, _2096, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2102 = fma(_2092, _2076, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2104 = fma(_2092, _2080, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2106 = fma(_2092, _2084, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2108 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1928 = _2100;
                    _1946 = _2106;
                    _1922 = _2098;
                    _1940 = _2104;
                    _1934 = _2102;
                    _1962 = _2108;
                    _2024 = true;
                }
                else
                {
                    _1928 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1946 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1962 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2024 = false;
    float _2110 = _1928;
    float _2112 = _1946;
    float _2114 = _1922;
    float _2116 = _1940;
    float _2118 = _1934;
    float _2120 = _1962;
    float _2122 = fma(_1836, -0.5, 0.5);
    float _2124 = precise::clamp(_2122, 0.0, 1.0);
    float _2126 = -_2110;
    float _2128 = _2126 + _2112;
    float _2130 = -_2114;
    float _2132 = _2130 + _2116;
    float _2134 = -_2118;
    float _2136 = _2134 + _2120;
    bool _2138 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2140 = fma(_2124, _2128, _2110);
    float _2142 = fma(_2124, _2132, _2114);
    float _2144 = fma(_2124, _2136, _2118);
    float _2146 = _2140 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2148 = fma(_2142, 0.298911988735198974609375, _2146);
    float _2150 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2152 = fma(_2144, 0.114477999508380889892578125, _2148);
    out.m_93.w = _2150;
    float _2154 = -_2152;
    float _2156 = _2142 + _2154;
    float _2158 = -_2152;
    float _2160 = _2140 + _2158;
    float _2162 = -_2152;
    float _2164 = _2144 + _2162;
    out.m_97.x = 0.0;
    float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    float _2168 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    float _2170 = fma(_2164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    out.m_99.x = _2166;
    out.m_99.y = _2168;
    out.m_99.z = _2170;
    if (!_2138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2172 = -_751;
    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2176 = -_753;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2180 = -_755;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = sqrt(_2188);
    float _2192 = rsqrt(_2188);
    float _2194 = -_2190;
    float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2198 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2200 = precise::clamp(_2198, 0.0, 1.0);
    float _2202 = _2178 * _2192;
    float _2204 = _2174 * _2192;
    float _2206 = abs(_2200);
    float _2208 = log2(_2206);
    float _2210 = _2182 * _2192;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2214 = _1836 * _2204;
    float _2216 = -_2204;
    float _2218 = -_2212;
    float _2220 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2218);
    float _2222 = fma(_1830, _2202, _2214);
    float _2224 = -_2210;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2220);
    float _2228 = fma(_1832, _2210, _2222);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2234 = _2226 + _2232;
    float _2236 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2238 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = exp2(_2236);
    float _2244 = _2242 * _2240;
    float _2246 = _2230 * _2244;
    float _2248 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2252 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2248;
    out.m_97.y = _2250;
    out.m_97.z = _2252;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2024 = false;
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
    float _126 = as_type<float>(_118);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2310 = as_type<float>(_134);
        out.gl_Position.z = _2310;
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
    if (_148)
    {
        float _154 = float(_118);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
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
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_170);
        out.gl_Position.z = _2379;
    }
    if (_162)
    {
        return out;
    }
    float _172 = in.m_63.w;
    float _174 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_61.x;
    float _188 = in.m_61.y;
    float _190 = in.m_61.z;
    float _192 = in.m_56.x;
    float _194 = in.m_56.y;
    float _196 = in.m_56.z;
    float _198 = 0.0;
    float _200 = _174;
    if (!_184)
    {
        float _202 = _174 * _174;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_184)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_184;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _174 * _220;
        float _230 = exp2(_228);
        float _232 = _226 * 0.693147182464599609375;
        float _234 = 1.0 / _232;
        float _236 = 1.0 / _224;
        float _238 = _230 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _234, _174);
        float _244 = _242 * _236;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_184;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _174 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    float _274 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_272, _188, _274);
    float _282 = fma(_272, _186, _276);
    float _284 = fma(_272, _190, _278);
    float _286 = fma(_280, _172, _194);
    float _288 = fma(_282, _172, _192);
    float _290 = fma(_284, _172, _196);
    float _292 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _296 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _292);
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _294);
    float _300 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _304 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _306 = _302 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _308 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _310 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _312 = floor(_308);
    float _314 = floor(_310);
    float _316 = -_312;
    float _318 = _308 + _316;
    float _320 = -_314;
    float _322 = _310 + _320;
    float2 _2628 = float2(_318, _322);
    float _324 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2628, float2(0.0), isnan(_2628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2628, float2(0.0), isnan(_2628)), level(0.0)).x;
    float _326 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _328 = in.m_63.x;
    float _330 = in.m_63.y;
    float _332 = in.m_63.z;
    float _334 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _326);
    float _336 = in.m_65.x;
    float _338 = in.m_65.y;
    float _340 = in.m_65.z;
    float _342 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _334);
    float _344 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _346 = _344 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _348 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _346);
    float _350 = fma(_306, (*spvDescriptorSet0.vp_c8)._m0[11].z, _348);
    float _352 = _344 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _354 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = _350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _360 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _352);
    float _362 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _364 = 1.0 / _358;
    float _366 = fma(_306, (*spvDescriptorSet0.vp_c8)._m0[10].z, _360);
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _370 = _368 + _358;
    float _372 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _370 * _364;
    float _376 = _374 * 0.5;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[30].w, _378);
    float _382 = 1.0 / _380;
    float _384 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _386 = _344 + _384;
    float _388 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _338);
    float _392 = _386 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _394 = _386 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _396 = _390 * _362;
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _340);
    float _400 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[127].x, _394);
    float _402 = _396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _406 = _382 * _404;
    float _408 = _396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _410 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[127].z, _400);
    bool _412 = _406 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _414 = _410 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _416 = _406 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _418 = !_412;
    int _420 = _418 ? 0 : 1;
    float _422 = trunc(_414);
    int _424 = int(_422);
    int _426 = 2;
    float _428 = _344;
    float _430 = _414;
    if (!_412)
    {
        _426 = 1;
    }
    int _432 = _426;
    int _434 = _432;
    if (!_416)
    {
        _434 = _420;
    }
    int _436 = _434;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _336);
    int _440 = _436 << 6;
    float _442 = _438 * _388;
    float _444 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[126].x, _392);
    float _446 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _448 = _440 + 96;
    uint _451 = uint(int(uint(_448) >> uint(2)));
    uint _453 = uint(int(uint(int(_451)) >> uint(2)));
    int _455 = int(_451) & 3;
    float _457 = (*spvDescriptorSet0.vp_c15)._m0[int(_453)][_455];
    int _459 = int(_451) + 1;
    uint _461 = uint(int(uint(_459) >> uint(2)));
    int _463 = _459 & 3;
    float _465 = (*spvDescriptorSet0.vp_c15)._m0[int(_461)][_463];
    float _467 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[10].x, _402);
    float _469 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[126].z, _444);
    float _471 = _398 * _446;
    float _473 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[8].x, _408);
    int _475 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _477 = _424 + _475;
    int _479 = _477 + 1;
    float _481 = _469 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[10].z, _467);
    int _485 = _440 + 104;
    uint _487 = uint(int(uint(_485) >> uint(2)));
    uint _489 = uint(int(uint(int(_487)) >> uint(2)));
    int _491 = int(_487) & 3;
    float _493 = (*spvDescriptorSet0.vp_c15)._m0[int(_489)][_491];
    int _495 = int(_487) + 1;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    int _499 = _495 & 3;
    float _501 = (*spvDescriptorSet0.vp_c15)._m0[int(_497)][_499];
    float _503 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[8].z, _473);
    float _505 = trunc(_481);
    int _507 = int(_505);
    float _509 = _306 + _483;
    float _511 = _304 + _503;
    float _513 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _515 = _509 + _513;
    int _517 = _440 + 48;
    uint _519 = uint(int(uint(_517) >> uint(2)));
    uint _521 = uint(int(uint(int(_519)) >> uint(2)));
    int _523 = int(_519) & 3;
    float _525 = (*spvDescriptorSet0.vp_c15)._m0[int(_521)][_523];
    int _527 = int(_519) + 1;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    int _531 = _527 & 3;
    float _533 = (*spvDescriptorSet0.vp_c15)._m0[int(_529)][_531];
    float _535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _537 = _511 + _535;
    float _539 = _515 * _515;
    float _541 = fma(_537, _537, _539);
    int _543 = _440 + 64;
    uint _545 = uint(int(uint(_543) >> uint(2)));
    uint _547 = uint(int(uint(int(_545)) >> uint(2)));
    int _549 = int(_545) & 3;
    float _551 = (*spvDescriptorSet0.vp_c15)._m0[int(_547)][_549];
    int _553 = int(_545) + 1;
    uint _555 = uint(int(uint(_553) >> uint(2)));
    int _557 = _553 & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _563 = _507 + _561;
    int _565 = _563 + 1;
    float _567 = sqrt(_541);
    bool _569 = _565 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _571 = _440 + 56;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    uint _575 = uint(int(uint(int(_573)) >> uint(2)));
    int _577 = int(_573) & 3;
    float _579 = (*spvDescriptorSet0.vp_c15)._m0[int(_575)][_577];
    int _581 = int(_573) + 1;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    int _585 = _581 & 3;
    float _587 = (*spvDescriptorSet0.vp_c15)._m0[int(_583)][_585];
    int _589 = _565 | _479;
    bool _591 = _589 < 0;
    bool _593 = _591 || _569;
    float _595 = _396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _597 = _440 + 72;
    uint _599 = uint(int(uint(_597) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.vp_c15)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.vp_c15)._m0[int(_609)][_611];
    bool _615 = _479 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _617 = _615 || _593;
    float _619 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[9].x, _595);
    bool _621 = _567 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _623 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[9].z, _619);
    int _625 = _440 + 80;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.vp_c15)._m0[int(_637)][_639];
    float _643 = _386 * _465;
    float _645 = _344 + _623;
    float _647 = fma(_304, _457, _643);
    int _649 = as_type<int>(_643);
    int _651 = as_type<int>(_465);
    int _653 = as_type<int>(_537);
    float _655 = _509;
    if (!_617)
    {
        int _657 = _479 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _659 = _657 + _565;
        _649 = _659;
    }
    int _661 = _649;
    float _663 = fma(_306, _493, _647);
    if (!_621)
    {
        _428 = _509;
    }
    float _665 = _428;
    float _667 = _665;
    if (!_617)
    {
        int _669 = _661 << 2;
        _651 = _669;
    }
    int _671 = _651;
    float _673 = _663 + _501;
    float _675 = _386 * _533;
    int _677 = _671;
    float _679 = _533;
    if (!_617)
    {
        int _681 = 12 & _671;
        _677 = _681;
    }
    int _683 = _677;
    float _685 = 1.0 / _673;
    float _687 = fma(_304, _525, _675);
    float _689 = _687;
    if (!_621)
    {
        _679 = _645;
    }
    float _691 = _679;
    float _693 = _386 * _559;
    float _695 = fma(_304, _551, _693);
    int _697 = as_type<int>(_551);
    float _699 = _691;
    if (!_617)
    {
        uint _701 = uint(int(uint(_661) >> uint(2)));
        _697 = int(_701);
    }
    int _703 = _697;
    float _705 = fma(_306, _579, _687);
    if (!_621)
    {
        _689 = _511;
    }
    float _707 = _689;
    float _709 = fma(_306, _605, _695);
    bool _711 = !_621;
    float _713 = _707;
    if (!_711)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _719 = _567 + _717;
        float _721 = _645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _723 = rsqrt(_541);
        float _725 = _719 * _715;
        float _727 = _725 * 0.15915493667125701904296875;
        float _729 = _727 * 6.283185482025146484375;
        float _731 = cos(_729);
        float _733 = _727 * 6.283185482025146484375;
        float _735 = sin(_733);
        float _737 = _731 + (-1.0);
        float _739 = _737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = fma(_735, _721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _743 = fma(_645, _731, _739);
        float _745 = _723 * _741;
        float _747 = fma(_537, _745, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _749 = fma(_515, _745, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _699 = _743;
        _713 = _747;
        _667 = _749;
    }
    float _751 = _699;
    float _753 = _713;
    float _755 = _667;
    if (!_617)
    {
        int _757 = _703 << 4;
        int _759 = _757 + _683;
        _653 = _759;
    }
    int _761 = _653;
    float _763 = _751 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _765 = _440 + 88;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    float _783 = _705 + _587;
    float _785 = _709 + _613;
    float _787 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _789 = _751 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _791 = _751 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _793 = _783 * _685;
    float _795 = _751 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _797 = _763;
    if (!_617)
    {
        int _799 = _761 + 400;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        uint _803 = uint(int(uint(int(_801)) >> uint(2)));
        int _805 = int(_801) & 3;
        float _807 = (*spvDescriptorSet0.vp_c15)._m0[int(_803)][_805];
        _797 = _807;
    }
    float _809 = _797;
    float _811 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[1].x, _789);
    float _813 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[0].x, _791);
    bool _815 = _793 >= 0.0;
    float _817 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[3].x, _795);
    float _819 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _811);
    float _821 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _813);
    float _823 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _787);
    float _825 = _785 * _685;
    float _827 = _819 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _829 = _793 <= 1.0;
    bool _831 = _829 && _815;
    float _833 = _821 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _835 = _823 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _837 = _827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _839 = _825 >= 0.0;
    bool _841 = _839 && _831;
    float _843 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _845 = _835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _847 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _817);
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _837);
    bool _851 = _825 <= 1.0;
    bool _853 = _851 && _841;
    float _855 = -_845;
    float _857 = fma(_855, _843, 1.0);
    float _859 = _847 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _861 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = _386 * _641;
    float _865 = _827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = _827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _871 = fma(_304, _633, _863);
    float _873 = log2(_857);
    float _875 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _877 = _867;
    float _879 = _825;
    float _881 = _869;
    if (_853)
    {
        float _883 = float(_436);
        _655 = _883;
    }
    float _885 = _655;
    float _887 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _867);
    float _889 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _875);
    float _891 = 1.0 / _869;
    float _893 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _887);
    float _895 = fma(_306, _773, _871);
    float _897 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _889);
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _893);
    float _901 = _587;
    float _903 = _781;
    float _905 = _899;
    if (!_617)
    {
        float _907 = floor(_481);
        _901 = _907;
    }
    float _909 = _901;
    float _911 = _895 + _781;
    float _913 = _873 * 0.693147182464599609375;
    float _915 = _911 * _685;
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _919 = _471;
    if (!_617)
    {
        float _921 = floor(_414);
        _919 = _921;
    }
    float _923 = _919;
    float _925 = _897 * _891;
    float _927 = _899 * _891;
    float _929 = fma(_925, 0.5, 0.5);
    float _931 = fma(_927, -0.5, 0.5);
    float _933 = _885;
    float _935 = _929;
    if (_853)
    {
        float _937 = rint(_885);
        float _939 = precise::max(_937, 0.0);
        uint _941 = uint(_939);
        uint _943 = clamp(_941, 0u, 65535u);
        _933 = as_type<float>(_943);
    }
    float _945 = _933;
    if (!_617)
    {
        float _947 = -_909;
        float _949 = _481 + _947;
        _903 = _949;
    }
    float _951 = _903;
    float _953 = _911;
    if (!_617)
    {
        float _955 = rint(_809);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        uint _961 = clamp(_959, 0u, 65535u);
        _953 = as_type<float>(_961);
    }
    float _963 = _953;
    if (!_617)
    {
        float _965 = -_923;
        float _967 = _414 + _965;
        _430 = _967;
    }
    float _969 = _430;
    float _971 = _923;
    if (_853)
    {
        float3 _3748 = float3(_793, _825, float(as_type<int>(_945)));
        float3 _3752 = select(_3748, float3(0.0), isnan(_3748));
        float _973 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3752.xy, uint(rint(_3752.z)), _915, level(0.0));
        _971 = _973;
    }
    float _975 = _971;
    float3 _3762 = float3(_929, _931, _917);
    float _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3762, float3(0.0), isnan(_3762)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3762, float3(0.0), isnan(_3762)), level(0.0)).x;
    float3 _3771 = float3(_929, _931, _917);
    float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3771, float3(0.0), isnan(_3771)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3771, float3(0.0), isnan(_3771)), level(0.0)).xyzw;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _980.w;
    float _990 = _951;
    float _992 = _963;
    if (!_617)
    {
        float3 _3795 = float3(_951, _969, float(as_type<int>(_963)));
        float3 _3797 = select(_3795, float3(0.0), isnan(_3795));
        float _994 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3797.xy, uint(rint(_3797.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3797.xy, uint(rint(_3797.z)), level(0.0)).x;
        _990 = _994;
    }
    float _996 = _990;
    if (_617)
    {
        _877 = 1.0;
    }
    float _998 = _877;
    float _1000 = _998;
    float _1002 = _996;
    if (!_617)
    {
        int _1004 = _661 << 4;
        int _1006 = _1004 + 2048;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
        int _1012 = int(_1008) & 3;
        float _1014 = (*spvDescriptorSet0.vp_c15)._m0[int(_1010)][_1012];
        int _1016 = int(_1008) + 1;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        int _1020 = _1016 & 3;
        float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
        int _1024 = _1006 + 8;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
        int _1030 = int(_1026) & 3;
        float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
        int _1034 = int(_1026) + 1;
        uint _1036 = uint(int(uint(_1034) >> uint(2)));
        int _1038 = _1034 & 3;
        float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
        float _1042 = _386 * _1022;
        float _1044 = fma(_304, _1014, _1042);
        float _1046 = fma(_306, _1032, _1044);
        float _1048 = _1046 + _1040;
        float _1050 = precise::clamp(_1048, 0.0, 1.0);
        float _1052 = -_1050;
        float _1054 = _1052 + _996;
        float _1056 = fma(_1054, 500.0, 1.5);
        float _1058 = exp2(_1056);
        float _1060 = 0.0 + _1058;
        float _1062 = precise::clamp(_1060, 0.0, 1.0);
        _1000 = _1062;
    }
    float _1064 = _1000;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _751 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _753 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _755 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = _1094 + _1096;
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1100 + _1104;
    float _1108 = _1084;
    float _1110 = _1106;
    float _1112 = _1068;
    if (_1102)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1114;
    }
    float _1116 = _1108;
    if (_1102)
    {
        float _1118 = rsqrt(_1098);
        _992 = _1118;
    }
    float _1120 = _992;
    float _1122 = _1120;
    if (_1102)
    {
        float _1124 = _1106 * _1116;
        _1110 = _1124;
    }
    float _1126 = _1110;
    if (_1102)
    {
        float _1128 = _1126 * 0.15915493667125701904296875;
        _1002 = _1128;
    }
    float _1130 = _1002;
    float _1132 = _1076;
    if (_1102)
    {
        float _1134 = _1130 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _1132 = _1136;
    }
    float _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1142 = precise::max(0.0, _1140);
    float _1144 = _1116;
    float _1146 = _1142;
    if (_1102)
    {
        float _1148 = _1130 * 6.283185482025146484375;
        float _1150 = cos(_1148);
        _1144 = _1150;
    }
    float _1152 = _1144;
    float _1154 = -_1088;
    float _1156 = -_1142;
    float _1158 = fma(_1068, _1154, _1156);
    if (_1102)
    {
        float _1160 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1160;
    }
    float _1162 = _1112;
    float _1164 = _1162;
    float _1166 = _1138;
    if (_1102)
    {
        float _1168 = fma(_1138, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1168;
    }
    float _1170 = _1164;
    float _1172 = _1170;
    if (!_1102)
    {
        _1166 = _1090;
    }
    float _1174 = _1166;
    float _1176 = _1174;
    float _1178 = _1152;
    if (_1102)
    {
        float _1180 = _1152 + (-1.0);
        _1146 = _1180;
    }
    float _1182 = _1146;
    float _1184 = _1182;
    if (_1102)
    {
        float _1186 = _1120 * _1170;
        _935 = _1186;
    }
    float _1188 = _935;
    if (!_1102)
    {
        _1172 = _1158;
    }
    float _1190 = _1172;
    float _1192 = _1190;
    if (_1102)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _1194;
    }
    float _1196 = _879;
    if (_1102)
    {
        float _1198 = _1090 * _1188;
        _1176 = _1198;
    }
    float _1200 = _1176;
    if (!_1102)
    {
        _1184 = _1092;
    }
    float _1202 = _1184;
    float _1204 = _1202;
    if (_1102)
    {
        float _1206 = _1092 * _1188;
        _1204 = _1206;
    }
    float _1208 = _1204;
    if (!_1102)
    {
        _1122 = _1094;
    }
    float _1210 = _1122;
    float _1212 = _1210;
    if (_1102)
    {
        float _1214 = fma(_1158, _1152, _1196);
        _1192 = _1214;
    }
    float _1216 = _1192;
    if (_1102)
    {
        float _1218 = _1200 * _1200;
        _1212 = _1218;
    }
    float _1220 = _1212;
    if (!_1102)
    {
        _1178 = _1096;
    }
    float _1222 = _1178;
    float _1224 = _1222;
    if (_1102)
    {
        float _1226 = _1208 * _1208;
        _1224 = _1226;
    }
    float _1228 = _1224;
    float _1230 = fma(_1216, _1216, _1220);
    float _1232 = _1230 + _1228;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1236 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1234);
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = -_1238;
    float _1242 = _1240 + 1.0;
    float _1244 = rsqrt(_1232);
    float _1246 = abs(_1242);
    float _1248 = log2(_1246);
    float _1250 = _1244 * _1200;
    float _1252 = _1244 * _1216;
    float _1254 = _1244 * _1208;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1258 = -_1256;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1258);
    float _1262 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1264 = -_1254;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1260);
    float _1268 = exp2(_1262);
    float _1270 = fma(_1266, -0.5, 0.5);
    float _1272 = fma(_1266, 0.5, 0.5);
    float _1274 = fma(_1272, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1276 = sqrt(_1270);
    float _1278 = fma(_1272, _1274, -0.212114393711090087890625);
    float _1280 = _1252 + 1.0;
    float _1282 = fma(_1272, _1278, 1.570728778839111328125);
    float _1284 = -_1252;
    float _1286 = fma(_1268, _1280, _1284);
    float _1288 = fma(_1286, 0.5, 0.5);
    float _1290 = _1276 * 0.636619746685028076171875;
    float _1292 = -_1282;
    float _1294 = fma(_1290, _1292, 1.0);
    float2 _4269 = float2(_1294, _1288);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4269, float2(0.0), isnan(_4269)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4269, float2(0.0), isnan(_4269)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = in.m_67.x;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1310 = in.m_69.x;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1320 = _1318 != 0;
    float _1322 = in.m_67.y;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1326 = _1324 != 0;
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1330 = in.m_69.y;
    float _1332 = _827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = in.m_69.w;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1340 = in.m_69.z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1346 = as_type<int>(_1288);
    float _1348 = _1306;
    float _1350 = _1342;
    if (_1314)
    {
        float _1352 = -_1306;
        float _1354 = _1352 + 1.0;
        _1346 = as_type<int>(_1354);
    }
    int _1356 = _1346;
    float _1358 = 0.0;
    if (!_1314)
    {
        _1358 = _1306;
    }
    float _1360 = _1358;
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1366 = false;
    float _1368 = _1360;
    float _1370 = _1364;
    float _1372 = _1310;
    if (_1314)
    {
        bool _1374 = _1310 > 0.5;
        _1366 = _1374;
    }
    bool _1376 = _1366;
    float _1378 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1342);
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1384 = _1380;
    if (_1314)
    {
        float _1386 = _1376 ? as_type<float>(_1356) : _1306;
        _1368 = _1386;
    }
    float _1388 = _1368;
    float _1390 = -_1322;
    float _1392 = _1390 + 1.0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1396 = _1394 != 0;
    float _1398 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1364);
    bool _1400 = _1330 > 0.5;
    float _1402 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1404 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1406 = _1334 > 0.5;
    float _1408 = exp2(_1316);
    int _1410 = _1400 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1414 = fma(_1404, _1388, -0.5);
    bool _1416 = _1340 > 0.5;
    float _1418 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1420 = _1326 ? as_type<float>(_1410) : _1322;
    float _1422 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1412);
    int _1424 = _1406 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1426 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1430 = _1428 != 0;
    out.m_71.y = _1322;
    int _1432 = _1416 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1436 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1440 = _1438 != 0;
    float _1442 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1426);
    float _1444 = _1430 ? as_type<float>(_1432) : _1322;
    float _1446 = fma(_1402, -2.0, _1434);
    float _1448 = -_1336;
    float _1450 = fma(_1436, 2.0, _1448);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1454 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1444, _1362, -0.5);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1460 = _1458 != 0;
    float _1462 = fma(_1454, _1420, -0.5);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1466 = _1460 ? as_type<float>(_1424) : _1322;
    float _1468 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1446);
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1472 = _1464;
    int _1474 = as_type<int>(_1468);
    float _1476 = _1340;
    float _1478 = _1330;
    if (_1320)
    {
        _1470 = _1310;
    }
    float _1480 = _1470;
    float _1482 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1464);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1486 = _1480;
    if (!_1320)
    {
        _1486 = _1340;
    }
    float _1488 = _1486;
    int _1490 = 0;
    if (_1440)
    {
        float _1492 = -_1306;
        float _1494 = _1492 + 1.0;
        _1490 = as_type<int>(_1494);
    }
    int _1496 = _1490;
    float _1498 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1482);
    float _1500 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1502 = _338 != 0.0;
    bool _1504 = isnan(_338);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1514 = -_1468;
    float _1516 = fma(_1498, _1462, _1514);
    float _1518 = fma(_1466, _1500, -0.5);
    float _1520 = in.m_73.x;
    float _1522 = in.m_73.y;
    float _1524 = in.m_73.z;
    float _1526 = as_type<float>(_1496);
    if (!_1320)
    {
        _1472 = _1330;
    }
    float _1528 = _1472;
    float _1530 = -_1484;
    float _1532 = fma(_1512, 2.0, _1530);
    float _1534 = _1528;
    if (_1320)
    {
        _1534 = _1310;
    }
    float _1536 = _1534;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1540 = _336 == 0.0;
    bool _1542 = !_1510;
    bool _1544 = _1540 && _1542;
    if (_1396)
    {
        float _1546 = -_1306;
        float _1548 = _1546 + 1.0;
        _1474 = as_type<int>(_1548);
    }
    int _1550 = _1474;
    float _1552 = 0.0;
    if (!_1396)
    {
        _1552 = _1306;
    }
    float _1554 = _1552;
    float _1556 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1538);
    bool _1558 = _340 == 0.0;
    bool _1560 = _1558 && _1544;
    float _1562 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1564 = _1554;
    if (_1396)
    {
        float _1566 = _1416 ? as_type<float>(_1550) : _1306;
        _1564 = _1566;
    }
    float _1568 = _1564;
    float _1570 = -_152;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1532);
    if (_1440)
    {
        float _1574 = _1400 ? as_type<float>(_1496) : _1306;
        _1348 = _1574;
    }
    float _1576 = _1348;
    float _1578 = -_1338;
    float _1580 = fma(_1562, 2.0, _1578);
    if (!_1320)
    {
        _1526 = _1340;
    }
    float _1582 = _1526;
    float _1584 = in.m_75.x;
    float _1586 = in.m_75.y;
    float _1588 = in.m_75.z;
    float _1590 = in.m_75.w;
    float _1592 = _1582;
    if (_1320)
    {
        _1592 = _1330;
    }
    float _1594 = _1592;
    float _1596 = fma(_1418, _1568, -0.5);
    if (_1320)
    {
        _1476 = _1330;
    }
    float _1598 = _1476;
    float _1600 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1602 = _1600;
    if (!_1320)
    {
        _1478 = _1310;
    }
    float _1604 = _1478;
    float _1606 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1380);
    float _1608 = -_1408;
    float _1610 = _1608 + 1.0;
    if (_1560)
    {
        _1350 = _1520;
    }
    float _1612 = _1350;
    float _1614 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1616 = 0.0;
    float _1618 = _1612;
    if (_1560)
    {
        _1616 = _1522;
    }
    float _1620 = _1616;
    float _1622 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1606);
    float _1624 = _1620;
    if (_1560)
    {
        _1370 = _1612;
    }
    float _1626 = _1370;
    float _1628 = _1604 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1630 = _1626;
    if (!_1560)
    {
        _1618 = _1520;
    }
    float _1632 = _1618;
    float _1634 = -_324;
    float _1636 = _1634 + 1.0;
    float _1638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1560)
    {
        _1384 = _1620;
    }
    float _1640 = _1384;
    out.gl_Position.x = _897;
    out.gl_Position.y = _899;
    out.gl_Position.z = _1600;
    out.gl_Position.w = _869;
    float _1642 = _1640;
    if (!_1560)
    {
        _1624 = _1522;
    }
    float _1644 = _1624;
    if (!_1560)
    {
        float _1646 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1632);
        _1630 = _1646;
    }
    float _1648 = _1630;
    float _1650 = -_152;
    float _1652 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1450);
    float _1654 = 0.0;
    if (_1560)
    {
        _1654 = _1524;
    }
    float _1656 = _1654;
    float _1658 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1664 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1666 = _1656;
    if (_1560)
    {
        _1372 = _1656;
    }
    float _1668 = _1372;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    float _1672 = fma(_1614, -2.0, _1662);
    float _1674 = _1668;
    if (!_1560)
    {
        _1666 = _1524;
    }
    float _1676 = _1666;
    float _1678 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1660);
    float _1680 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1664);
    float _1682 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1560)
    {
        float _1684 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1642 = _1684;
    }
    float _1686 = _1642;
    float _1688 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1398);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1670);
    float _1692 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1678);
    float _1694 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1680);
    float _1696 = fma(_1682, _1576, -0.5);
    if (!_1560)
    {
        float _1698 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1676);
        _1674 = _1698;
    }
    float _1700 = _1674;
    float _1702 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1556);
    float _1704 = fma(_1688, _1414, _1652);
    float _1706 = -_152;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1580);
    float _1710 = _1588 * _1632;
    out.m_77.x = _1690;
    out.m_77.y = _1692;
    out.m_77.z = _1694;
    float _1712 = _1586 * _1676;
    float _1714 = fma(_1702, _1596, _1708);
    float _1716 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1378);
    float _1718 = abs(_406);
    float _1720 = log2(_1718);
    float _1722 = -_1712;
    float _1724 = fma(_1588, _1644, _1722);
    float _1726 = _1704 + 0.5;
    float _1728 = _1714 + 0.5;
    float _1730 = _1724 * _1590;
    float _1732 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1736 = -_1710;
    float _1738 = fma(_1584, _1676, _1736);
    float _1740 = _1584 * _1644;
    float _1742 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_79.w = _1734;
    float _1744 = -_1740;
    float _1746 = fma(_1586, _1632, _1744);
    float _1748 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1672);
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1752 = _1738 * _1590;
    float _1754 = _1746 * _1590;
    float _1756 = -_1748;
    float _1758 = fma(_1622, _1518, _1756);
    float _1760 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1422);
    float _1762 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1764 = fma(_1628, -2.0, _1750);
    float _1766 = _1516 + 0.5;
    float _1768 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1762);
    float _1770 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1772 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1764);
    float _1774 = _1758 + 0.5;
    float _1776 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1778 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1780 = -_1772;
    float _1782 = fma(_1760, _1456, _1780);
    float _1784 = exp2(_1770);
    out.m_81.x = _1726;
    out.m_81.y = _1766;
    out.m_81.z = _1728;
    out.m_81.w = _1774;
    float _1786 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1788 = _406 <= 8000.0;
    bool _1790 = isnan(_406);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(8000.0);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1776);
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1778);
    float _1804 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1786);
    float _1806 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1732);
    float _1808 = fma(_1716, _1696, _1572);
    float _1810 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1802);
    float _1812 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1742);
    out.m_83.x = _753;
    out.m_83.y = _751;
    out.m_83.z = _755;
    float _1814 = _1808 + 0.5;
    float _1816 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1818 = precise::clamp(_1816, 0.0, 1.0);
    float _1820 = _1782 + 0.5;
    float _1822 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1804);
    float _1824 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1800);
    float _1826 = fma(_1818, -2.0, 3.0);
    float _1828 = _1818 * _1818;
    float _1830 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1768);
    float _1832 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1812);
    out.m_85.x = _1822;
    out.m_85.y = _1824;
    out.m_85.z = _1810;
    float _1834 = _1828 * _1826;
    float _1836 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1806);
    out.m_87.x = _1814;
    out.m_87.y = _1820;
    float _1838 = -_1834;
    float _1840 = _1838 + 1.0;
    out.m_89.x = _1830;
    out.m_89.y = _1836;
    out.m_89.z = _1832;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1834);
    float _1844 = _1600 + _869;
    float _1846 = _1822;
    if (!_853)
    {
        _1846 = 1.0;
    }
    float _1848 = _1846;
    float _1850 = _1798 * _1842;
    float _1852 = _1844 * 0.5;
    float _1854 = _1848;
    if (_853)
    {
        bool _1856 = _975 >= _915;
        bool _1858 = isnan(_975);
        bool _1860 = _1856 || _1858;
        bool _1862 = isnan(_915);
        bool _1864 = _1860 || _1862;
        float _1866 = float(_1864);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1872 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1874 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1876 = isnan(_1086);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1882 = _1878 || _1880;
    out.m_91.z = _1852;
    out.m_91.w = _869;
    float _1884 = _1870 * _977;
    float _1886 = _1636 * _1872;
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = _1868 * _1064;
    float _1892 = -_1870;
    float _1894 = _1892 + 1.0;
    float _1896 = _988 * _1884;
    float _1898 = -_1888;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1902 = _988 * _1894;
    float _1904 = -_1890;
    float _1906 = fma(_1904, _1900, 1.0);
    float _1908 = precise::clamp(_1906, 0.0, 1.0);
    float _1910 = _1870;
    float _1912 = _1908;
    float _1914 = _1894;
    if (!_1882)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1916 = _1910;
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1920 = _1916;
    float _1922 = _1916;
    if (!_1882)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1924 = _1912;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1882)
    {
        _881 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1930 = _881;
    out.m_93.x = _1918;
    float _1932 = _1930;
    float _1934 = _1930;
    if (!_1882)
    {
        _1602 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1936 = _1602;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1882)
    {
        _905 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1942 = _905;
    float _1944 = _1942;
    float _1946 = _1942;
    if (!_1882)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1948 = _1914;
    float _1950 = _1304 * _1884;
    float _1952 = fma(_1300, _1896, _982);
    float _1954 = fma(_1302, _1896, _984);
    float _1956 = fma(_988, _1950, _986);
    out.m_95.x = _1952;
    out.m_95.y = _1954;
    out.m_95.z = _1956;
    out.m_95.w = _1902;
    bool _1958 = !_1882;
    float _1960 = _1948;
    float _1962 = _1948;
    if (!_1958)
    {
        bool _1964 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1966 = isnan(_1086);
        bool _1968 = _1964 || _1966;
        bool _1970 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1972 = _1968 || _1970;
        if (!_1972)
        {
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1976 = _1086 + _1974;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1980 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1978;
            float _1982 = 1.0 / _1980;
            float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1986 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2004 = _1976 * _1982;
            float _2006 = precise::clamp(_2004, 0.0, 1.0);
            float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2012 = fma(_2006, _1986, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2014 = fma(_2006, _2010, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2016 = fma(_2006, _1990, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2018 = fma(_2006, _1994, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2020 = fma(_2006, _1998, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2022 = fma(_2006, _2002, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1928 = _2014;
            _1946 = _2020;
            _1922 = _2012;
            _1940 = _2018;
            _1934 = _2016;
            _1962 = _2022;
            _2024 = true;
        }
        else
        {
            bool _2026 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2028 = isnan(_1086);
            bool _2030 = _2026 || _2028;
            bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2034 = _2030 || _2032;
            if (!_2034)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2036 = _1920;
            _1922 = _2036;
            if (!_2034)
            {
                _1926 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2038 = _1926;
            _1928 = _2038;
            if (!_2034)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2040 = _1932;
            _1934 = _2040;
            if (!_2034)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2042 = _1938;
            _1940 = _2042;
            if (!_2034)
            {
                _1944 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2044 = _1944;
            _1946 = _2044;
            if (!_2034)
            {
                _1960 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2046 = _1960;
            bool _2048 = !_2034;
            _1962 = _2046;
            if (!_2048)
            {
                bool _2050 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2052 = isnan(_1086);
                bool _2054 = _2050 || _2052;
                bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2058 = _2054 || _2056;
                if (!_2058)
                {
                    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2062 = _1086 + _2060;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2064;
                    float _2068 = 1.0 / _2066;
                    float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2090 = _2062 * _2068;
                    float _2092 = precise::clamp(_2090, 0.0, 1.0);
                    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2098 = fma(_2092, _2072, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2100 = fma(_2092, _2096, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2102 = fma(_2092, _2076, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2104 = fma(_2092, _2080, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2106 = fma(_2092, _2084, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2108 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1928 = _2100;
                    _1946 = _2106;
                    _1922 = _2098;
                    _1940 = _2104;
                    _1934 = _2102;
                    _1962 = _2108;
                    _2024 = true;
                }
                else
                {
                    _1928 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1946 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1962 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2024 = false;
    float _2110 = _1928;
    float _2112 = _1946;
    float _2114 = _1922;
    float _2116 = _1940;
    float _2118 = _1934;
    float _2120 = _1962;
    float _2122 = fma(_1836, -0.5, 0.5);
    float _2124 = precise::clamp(_2122, 0.0, 1.0);
    float _2126 = -_2110;
    float _2128 = _2126 + _2112;
    float _2130 = -_2114;
    float _2132 = _2130 + _2116;
    float _2134 = -_2118;
    float _2136 = _2134 + _2120;
    bool _2138 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2140 = fma(_2124, _2128, _2110);
    float _2142 = fma(_2124, _2132, _2114);
    float _2144 = fma(_2124, _2136, _2118);
    float _2146 = _2140 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2148 = fma(_2142, 0.298911988735198974609375, _2146);
    float _2150 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2152 = fma(_2144, 0.114477999508380889892578125, _2148);
    out.m_93.w = _2150;
    float _2154 = -_2152;
    float _2156 = _2142 + _2154;
    float _2158 = -_2152;
    float _2160 = _2140 + _2158;
    float _2162 = -_2152;
    float _2164 = _2144 + _2162;
    out.m_97.x = 0.0;
    float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    float _2168 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    float _2170 = fma(_2164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    out.m_99.x = _2166;
    out.m_99.y = _2168;
    out.m_99.z = _2170;
    if (!_2138)
    {
        return out;
    }
    float _2172 = -_751;
    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2176 = -_753;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2180 = -_755;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = sqrt(_2188);
    float _2192 = rsqrt(_2188);
    float _2194 = -_2190;
    float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2198 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2200 = precise::clamp(_2198, 0.0, 1.0);
    float _2202 = _2178 * _2192;
    float _2204 = _2174 * _2192;
    float _2206 = abs(_2200);
    float _2208 = log2(_2206);
    float _2210 = _2182 * _2192;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2214 = _1836 * _2204;
    float _2216 = -_2204;
    float _2218 = -_2212;
    float _2220 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2218);
    float _2222 = fma(_1830, _2202, _2214);
    float _2224 = -_2210;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2220);
    float _2228 = fma(_1832, _2210, _2222);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2234 = _2226 + _2232;
    float _2236 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2238 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = exp2(_2236);
    float _2244 = _2242 * _2240;
    float _2246 = _2230 * _2244;
    float _2248 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2252 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2248;
    out.m_97.y = _2250;
    out.m_97.z = _2252;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2024 = false;
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
    float _126 = as_type<float>(_118);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2310 = as_type<float>(_134);
        out.gl_Position.z = _2310;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _154 = float(_118);
        _126 = _154;
    }
    float _156 = _126;
    bool _158 = _152 >= _156;
    bool _160 = !_148;
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
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_170);
        out.gl_Position.z = _2379;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_63.w;
    float _174 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_61.x;
    float _188 = in.m_61.y;
    float _190 = in.m_61.z;
    float _192 = in.m_56.x;
    float _194 = in.m_56.y;
    float _196 = in.m_56.z;
    float _198 = 0.0;
    float _200 = _174;
    if (!_184)
    {
        float _202 = _174 * _174;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_184)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_184;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _174 * _220;
        float _230 = exp2(_228);
        float _232 = _226 * 0.693147182464599609375;
        float _234 = 1.0 / _232;
        float _236 = 1.0 / _224;
        float _238 = _230 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _234, _174);
        float _244 = _242 * _236;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_184;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _174 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    float _274 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_272, _188, _274);
    float _282 = fma(_272, _186, _276);
    float _284 = fma(_272, _190, _278);
    float _286 = fma(_280, _172, _194);
    float _288 = fma(_282, _172, _192);
    float _290 = fma(_284, _172, _196);
    float _292 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _296 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _292);
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _294);
    float _300 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _304 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _306 = _302 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _308 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _310 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _312 = floor(_308);
    float _314 = floor(_310);
    float _316 = -_312;
    float _318 = _308 + _316;
    float _320 = -_314;
    float _322 = _310 + _320;
    float2 _2628 = float2(_318, _322);
    float _324 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2628, float2(0.0), isnan(_2628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2628, float2(0.0), isnan(_2628)), level(0.0)).x;
    float _326 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _328 = in.m_63.x;
    float _330 = in.m_63.y;
    float _332 = in.m_63.z;
    float _334 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _326);
    float _336 = in.m_65.x;
    float _338 = in.m_65.y;
    float _340 = in.m_65.z;
    float _342 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _334);
    float _344 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _346 = _344 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _348 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _346);
    float _350 = fma(_306, (*spvDescriptorSet0.vp_c8)._m0[11].z, _348);
    float _352 = _344 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _354 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = _350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _360 = fma(_304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _352);
    float _362 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _364 = 1.0 / _358;
    float _366 = fma(_306, (*spvDescriptorSet0.vp_c8)._m0[10].z, _360);
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _370 = _368 + _358;
    float _372 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _370 * _364;
    float _376 = _374 * 0.5;
    float _378 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[30].w, _378);
    float _382 = 1.0 / _380;
    float _384 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _386 = _344 + _384;
    float _388 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _338);
    float _392 = _386 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _394 = _386 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _396 = _390 * _362;
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _340);
    float _400 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[127].x, _394);
    float _402 = _396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _406 = _382 * _404;
    float _408 = _396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _410 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[127].z, _400);
    bool _412 = _406 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _414 = _410 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _416 = _406 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _418 = !_412;
    int _420 = _418 ? 0 : 1;
    float _422 = trunc(_414);
    int _424 = int(_422);
    int _426 = 2;
    float _428 = _344;
    float _430 = _414;
    if (!_412)
    {
        _426 = 1;
    }
    int _432 = _426;
    int _434 = _432;
    if (!_416)
    {
        _434 = _420;
    }
    int _436 = _434;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _336);
    int _440 = _436 << 6;
    float _442 = _438 * _388;
    float _444 = fma(_304, (*spvDescriptorSet0.vp_c15)._m0[126].x, _392);
    float _446 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _448 = _440 + 96;
    uint _451 = uint(int(uint(_448) >> uint(2)));
    uint _453 = uint(int(uint(int(_451)) >> uint(2)));
    int _455 = int(_451) & 3;
    float _457 = (*spvDescriptorSet0.vp_c15)._m0[int(_453)][_455];
    int _459 = int(_451) + 1;
    uint _461 = uint(int(uint(_459) >> uint(2)));
    int _463 = _459 & 3;
    float _465 = (*spvDescriptorSet0.vp_c15)._m0[int(_461)][_463];
    float _467 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[10].x, _402);
    float _469 = fma(_306, (*spvDescriptorSet0.vp_c15)._m0[126].z, _444);
    float _471 = _398 * _446;
    float _473 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[8].x, _408);
    int _475 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _477 = _424 + _475;
    int _479 = _477 + 1;
    float _481 = _469 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[10].z, _467);
    int _485 = _440 + 104;
    uint _487 = uint(int(uint(_485) >> uint(2)));
    uint _489 = uint(int(uint(int(_487)) >> uint(2)));
    int _491 = int(_487) & 3;
    float _493 = (*spvDescriptorSet0.vp_c15)._m0[int(_489)][_491];
    int _495 = int(_487) + 1;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    int _499 = _495 & 3;
    float _501 = (*spvDescriptorSet0.vp_c15)._m0[int(_497)][_499];
    float _503 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[8].z, _473);
    float _505 = trunc(_481);
    int _507 = int(_505);
    float _509 = _306 + _483;
    float _511 = _304 + _503;
    float _513 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _515 = _509 + _513;
    int _517 = _440 + 48;
    uint _519 = uint(int(uint(_517) >> uint(2)));
    uint _521 = uint(int(uint(int(_519)) >> uint(2)));
    int _523 = int(_519) & 3;
    float _525 = (*spvDescriptorSet0.vp_c15)._m0[int(_521)][_523];
    int _527 = int(_519) + 1;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    int _531 = _527 & 3;
    float _533 = (*spvDescriptorSet0.vp_c15)._m0[int(_529)][_531];
    float _535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _537 = _511 + _535;
    float _539 = _515 * _515;
    float _541 = fma(_537, _537, _539);
    int _543 = _440 + 64;
    uint _545 = uint(int(uint(_543) >> uint(2)));
    uint _547 = uint(int(uint(int(_545)) >> uint(2)));
    int _549 = int(_545) & 3;
    float _551 = (*spvDescriptorSet0.vp_c15)._m0[int(_547)][_549];
    int _553 = int(_545) + 1;
    uint _555 = uint(int(uint(_553) >> uint(2)));
    int _557 = _553 & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _563 = _507 + _561;
    int _565 = _563 + 1;
    float _567 = sqrt(_541);
    bool _569 = _565 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _571 = _440 + 56;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    uint _575 = uint(int(uint(int(_573)) >> uint(2)));
    int _577 = int(_573) & 3;
    float _579 = (*spvDescriptorSet0.vp_c15)._m0[int(_575)][_577];
    int _581 = int(_573) + 1;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    int _585 = _581 & 3;
    float _587 = (*spvDescriptorSet0.vp_c15)._m0[int(_583)][_585];
    int _589 = _565 | _479;
    bool _591 = _589 < 0;
    bool _593 = _591 || _569;
    float _595 = _396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _597 = _440 + 72;
    uint _599 = uint(int(uint(_597) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.vp_c15)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.vp_c15)._m0[int(_609)][_611];
    bool _615 = _479 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _617 = _615 || _593;
    float _619 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[9].x, _595);
    bool _621 = _567 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _623 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[9].z, _619);
    int _625 = _440 + 80;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.vp_c15)._m0[int(_637)][_639];
    float _643 = _386 * _465;
    float _645 = _344 + _623;
    float _647 = fma(_304, _457, _643);
    int _649 = as_type<int>(_643);
    int _651 = as_type<int>(_465);
    int _653 = as_type<int>(_537);
    float _655 = _509;
    if (!_617)
    {
        int _657 = _479 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _659 = _657 + _565;
        _649 = _659;
    }
    int _661 = _649;
    float _663 = fma(_306, _493, _647);
    if (!_621)
    {
        _428 = _509;
    }
    float _665 = _428;
    float _667 = _665;
    if (!_617)
    {
        int _669 = _661 << 2;
        _651 = _669;
    }
    int _671 = _651;
    float _673 = _663 + _501;
    float _675 = _386 * _533;
    int _677 = _671;
    float _679 = _533;
    if (!_617)
    {
        int _681 = 12 & _671;
        _677 = _681;
    }
    int _683 = _677;
    float _685 = 1.0 / _673;
    float _687 = fma(_304, _525, _675);
    float _689 = _687;
    if (!_621)
    {
        _679 = _645;
    }
    float _691 = _679;
    float _693 = _386 * _559;
    float _695 = fma(_304, _551, _693);
    int _697 = as_type<int>(_551);
    float _699 = _691;
    if (!_617)
    {
        uint _701 = uint(int(uint(_661) >> uint(2)));
        _697 = int(_701);
    }
    int _703 = _697;
    float _705 = fma(_306, _579, _687);
    if (!_621)
    {
        _689 = _511;
    }
    float _707 = _689;
    float _709 = fma(_306, _605, _695);
    bool _711 = !_621;
    float _713 = _707;
    if (!_711)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _717 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _719 = _567 + _717;
        float _721 = _645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _723 = rsqrt(_541);
        float _725 = _719 * _715;
        float _727 = _725 * 0.15915493667125701904296875;
        float _729 = _727 * 6.283185482025146484375;
        float _731 = cos(_729);
        float _733 = _727 * 6.283185482025146484375;
        float _735 = sin(_733);
        float _737 = _731 + (-1.0);
        float _739 = _737 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = fma(_735, _721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _743 = fma(_645, _731, _739);
        float _745 = _723 * _741;
        float _747 = fma(_537, _745, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _749 = fma(_515, _745, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _699 = _743;
        _713 = _747;
        _667 = _749;
    }
    float _751 = _699;
    float _753 = _713;
    float _755 = _667;
    if (!_617)
    {
        int _757 = _703 << 4;
        int _759 = _757 + _683;
        _653 = _759;
    }
    int _761 = _653;
    float _763 = _751 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _765 = _440 + 88;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.vp_c15)._m0[int(_769)][_771];
    int _775 = int(_767) + 1;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    int _779 = _775 & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    float _783 = _705 + _587;
    float _785 = _709 + _613;
    float _787 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _789 = _751 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _791 = _751 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _793 = _783 * _685;
    float _795 = _751 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _797 = _763;
    if (!_617)
    {
        int _799 = _761 + 400;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        uint _803 = uint(int(uint(int(_801)) >> uint(2)));
        int _805 = int(_801) & 3;
        float _807 = (*spvDescriptorSet0.vp_c15)._m0[int(_803)][_805];
        _797 = _807;
    }
    float _809 = _797;
    float _811 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[1].x, _789);
    float _813 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[0].x, _791);
    bool _815 = _793 >= 0.0;
    float _817 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[3].x, _795);
    float _819 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[1].z, _811);
    float _821 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[0].z, _813);
    float _823 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[2].z, _787);
    float _825 = _785 * _685;
    float _827 = _819 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _829 = _793 <= 1.0;
    bool _831 = _829 && _815;
    float _833 = _821 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _835 = _823 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _837 = _827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _839 = _825 >= 0.0;
    bool _841 = _839 && _831;
    float _843 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _845 = _835 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _847 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[3].z, _817);
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _837);
    bool _851 = _825 <= 1.0;
    bool _853 = _851 && _841;
    float _855 = -_845;
    float _857 = fma(_855, _843, 1.0);
    float _859 = _847 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _861 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = _386 * _641;
    float _865 = _827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = _827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _869 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _871 = fma(_304, _633, _863);
    float _873 = log2(_857);
    float _875 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _877 = _867;
    float _879 = _825;
    float _881 = _869;
    if (_853)
    {
        float _883 = float(_436);
        _655 = _883;
    }
    float _885 = _655;
    float _887 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _867);
    float _889 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _875);
    float _891 = 1.0 / _869;
    float _893 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _887);
    float _895 = fma(_306, _773, _871);
    float _897 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[4].w, _889);
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[5].w, _893);
    float _901 = _587;
    float _903 = _781;
    float _905 = _899;
    if (!_617)
    {
        float _907 = floor(_481);
        _901 = _907;
    }
    float _909 = _901;
    float _911 = _895 + _781;
    float _913 = _873 * 0.693147182464599609375;
    float _915 = _911 * _685;
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _919 = _471;
    if (!_617)
    {
        float _921 = floor(_414);
        _919 = _921;
    }
    float _923 = _919;
    float _925 = _897 * _891;
    float _927 = _899 * _891;
    float _929 = fma(_925, 0.5, 0.5);
    float _931 = fma(_927, -0.5, 0.5);
    float _933 = _885;
    float _935 = _929;
    if (_853)
    {
        float _937 = rint(_885);
        float _939 = precise::max(_937, 0.0);
        uint _941 = uint(_939);
        uint _943 = clamp(_941, 0u, 65535u);
        _933 = as_type<float>(_943);
    }
    float _945 = _933;
    if (!_617)
    {
        float _947 = -_909;
        float _949 = _481 + _947;
        _903 = _949;
    }
    float _951 = _903;
    float _953 = _911;
    if (!_617)
    {
        float _955 = rint(_809);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        uint _961 = clamp(_959, 0u, 65535u);
        _953 = as_type<float>(_961);
    }
    float _963 = _953;
    if (!_617)
    {
        float _965 = -_923;
        float _967 = _414 + _965;
        _430 = _967;
    }
    float _969 = _430;
    float _971 = _923;
    if (_853)
    {
        float3 _3748 = float3(_793, _825, float(as_type<int>(_945)));
        float3 _3752 = select(_3748, float3(0.0), isnan(_3748));
        float _973 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3752.xy, uint(rint(_3752.z)), _915, level(0.0));
        _971 = _973;
    }
    float _975 = _971;
    float3 _3762 = float3(_929, _931, _917);
    float _977 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3762, float3(0.0), isnan(_3762)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3762, float3(0.0), isnan(_3762)), level(0.0)).x;
    float3 _3771 = float3(_929, _931, _917);
    float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3771, float3(0.0), isnan(_3771)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3771, float3(0.0), isnan(_3771)), level(0.0)).xyzw;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _980.w;
    float _990 = _951;
    float _992 = _963;
    if (!_617)
    {
        float3 _3795 = float3(_951, _969, float(as_type<int>(_963)));
        float3 _3797 = select(_3795, float3(0.0), isnan(_3795));
        float _994 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3797.xy, uint(rint(_3797.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3797.xy, uint(rint(_3797.z)), level(0.0)).x;
        _990 = _994;
    }
    float _996 = _990;
    if (_617)
    {
        _877 = 1.0;
    }
    float _998 = _877;
    float _1000 = _998;
    float _1002 = _996;
    if (!_617)
    {
        int _1004 = _661 << 4;
        int _1006 = _1004 + 2048;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
        int _1012 = int(_1008) & 3;
        float _1014 = (*spvDescriptorSet0.vp_c15)._m0[int(_1010)][_1012];
        int _1016 = int(_1008) + 1;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        int _1020 = _1016 & 3;
        float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
        int _1024 = _1006 + 8;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
        int _1030 = int(_1026) & 3;
        float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
        int _1034 = int(_1026) + 1;
        uint _1036 = uint(int(uint(_1034) >> uint(2)));
        int _1038 = _1034 & 3;
        float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
        float _1042 = _386 * _1022;
        float _1044 = fma(_304, _1014, _1042);
        float _1046 = fma(_306, _1032, _1044);
        float _1048 = _1046 + _1040;
        float _1050 = precise::clamp(_1048, 0.0, 1.0);
        float _1052 = -_1050;
        float _1054 = _1052 + _996;
        float _1056 = fma(_1054, 500.0, 1.5);
        float _1058 = exp2(_1056);
        float _1060 = 0.0 + _1058;
        float _1062 = precise::clamp(_1060, 0.0, 1.0);
        _1000 = _1062;
    }
    float _1064 = _1000;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _751 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _753 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _755 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = _1094 + _1096;
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1106 = _1100 + _1104;
    float _1108 = _1084;
    float _1110 = _1106;
    float _1112 = _1068;
    if (_1102)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1114;
    }
    float _1116 = _1108;
    if (_1102)
    {
        float _1118 = rsqrt(_1098);
        _992 = _1118;
    }
    float _1120 = _992;
    float _1122 = _1120;
    if (_1102)
    {
        float _1124 = _1106 * _1116;
        _1110 = _1124;
    }
    float _1126 = _1110;
    if (_1102)
    {
        float _1128 = _1126 * 0.15915493667125701904296875;
        _1002 = _1128;
    }
    float _1130 = _1002;
    float _1132 = _1076;
    if (_1102)
    {
        float _1134 = _1130 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _1132 = _1136;
    }
    float _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1142 = precise::max(0.0, _1140);
    float _1144 = _1116;
    float _1146 = _1142;
    if (_1102)
    {
        float _1148 = _1130 * 6.283185482025146484375;
        float _1150 = cos(_1148);
        _1144 = _1150;
    }
    float _1152 = _1144;
    float _1154 = -_1088;
    float _1156 = -_1142;
    float _1158 = fma(_1068, _1154, _1156);
    if (_1102)
    {
        float _1160 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1160;
    }
    float _1162 = _1112;
    float _1164 = _1162;
    float _1166 = _1138;
    if (_1102)
    {
        float _1168 = fma(_1138, _1162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1164 = _1168;
    }
    float _1170 = _1164;
    float _1172 = _1170;
    if (!_1102)
    {
        _1166 = _1090;
    }
    float _1174 = _1166;
    float _1176 = _1174;
    float _1178 = _1152;
    if (_1102)
    {
        float _1180 = _1152 + (-1.0);
        _1146 = _1180;
    }
    float _1182 = _1146;
    float _1184 = _1182;
    if (_1102)
    {
        float _1186 = _1120 * _1170;
        _935 = _1186;
    }
    float _1188 = _935;
    if (!_1102)
    {
        _1172 = _1158;
    }
    float _1190 = _1172;
    float _1192 = _1190;
    if (_1102)
    {
        float _1194 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _1194;
    }
    float _1196 = _879;
    if (_1102)
    {
        float _1198 = _1090 * _1188;
        _1176 = _1198;
    }
    float _1200 = _1176;
    if (!_1102)
    {
        _1184 = _1092;
    }
    float _1202 = _1184;
    float _1204 = _1202;
    if (_1102)
    {
        float _1206 = _1092 * _1188;
        _1204 = _1206;
    }
    float _1208 = _1204;
    if (!_1102)
    {
        _1122 = _1094;
    }
    float _1210 = _1122;
    float _1212 = _1210;
    if (_1102)
    {
        float _1214 = fma(_1158, _1152, _1196);
        _1192 = _1214;
    }
    float _1216 = _1192;
    if (_1102)
    {
        float _1218 = _1200 * _1200;
        _1212 = _1218;
    }
    float _1220 = _1212;
    if (!_1102)
    {
        _1178 = _1096;
    }
    float _1222 = _1178;
    float _1224 = _1222;
    if (_1102)
    {
        float _1226 = _1208 * _1208;
        _1224 = _1226;
    }
    float _1228 = _1224;
    float _1230 = fma(_1216, _1216, _1220);
    float _1232 = _1230 + _1228;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1236 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1234);
    float _1238 = precise::clamp(_1236, 0.0, 1.0);
    float _1240 = -_1238;
    float _1242 = _1240 + 1.0;
    float _1244 = rsqrt(_1232);
    float _1246 = abs(_1242);
    float _1248 = log2(_1246);
    float _1250 = _1244 * _1200;
    float _1252 = _1244 * _1216;
    float _1254 = _1244 * _1208;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1258 = -_1256;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1258);
    float _1262 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1264 = -_1254;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1260);
    float _1268 = exp2(_1262);
    float _1270 = fma(_1266, -0.5, 0.5);
    float _1272 = fma(_1266, 0.5, 0.5);
    float _1274 = fma(_1272, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1276 = sqrt(_1270);
    float _1278 = fma(_1272, _1274, -0.212114393711090087890625);
    float _1280 = _1252 + 1.0;
    float _1282 = fma(_1272, _1278, 1.570728778839111328125);
    float _1284 = -_1252;
    float _1286 = fma(_1268, _1280, _1284);
    float _1288 = fma(_1286, 0.5, 0.5);
    float _1290 = _1276 * 0.636619746685028076171875;
    float _1292 = -_1282;
    float _1294 = fma(_1290, _1292, 1.0);
    float2 _4269 = float2(_1294, _1288);
    float3 _1298 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4269, float2(0.0), isnan(_4269)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4269, float2(0.0), isnan(_4269)), level(0.0)).xyz;
    float _1300 = _1298.x;
    float _1302 = _1298.y;
    float _1304 = _1298.z;
    float _1306 = in.m_67.x;
    float _1308 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1310 = in.m_69.x;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1320 = _1318 != 0;
    float _1322 = in.m_67.y;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1326 = _1324 != 0;
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1330 = in.m_69.y;
    float _1332 = _827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = in.m_69.w;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1340 = in.m_69.z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1346 = as_type<int>(_1288);
    float _1348 = _1306;
    float _1350 = _1342;
    if (_1314)
    {
        float _1352 = -_1306;
        float _1354 = _1352 + 1.0;
        _1346 = as_type<int>(_1354);
    }
    int _1356 = _1346;
    float _1358 = 0.0;
    if (!_1314)
    {
        _1358 = _1306;
    }
    float _1360 = _1358;
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1366 = false;
    float _1368 = _1360;
    float _1370 = _1364;
    float _1372 = _1310;
    if (_1314)
    {
        bool _1374 = _1310 > 0.5;
        _1366 = _1374;
    }
    bool _1376 = _1366;
    float _1378 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1342);
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1384 = _1380;
    if (_1314)
    {
        float _1386 = _1376 ? as_type<float>(_1356) : _1306;
        _1368 = _1386;
    }
    float _1388 = _1368;
    float _1390 = -_1322;
    float _1392 = _1390 + 1.0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1396 = _1394 != 0;
    float _1398 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1364);
    bool _1400 = _1330 > 0.5;
    float _1402 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1404 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1406 = _1334 > 0.5;
    float _1408 = exp2(_1316);
    int _1410 = _1400 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1414 = fma(_1404, _1388, -0.5);
    bool _1416 = _1340 > 0.5;
    float _1418 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1420 = _1326 ? as_type<float>(_1410) : _1322;
    float _1422 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1412);
    int _1424 = _1406 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1426 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1430 = _1428 != 0;
    out.m_71.y = _1322;
    int _1432 = _1416 ? as_type<int>(_1392) : as_type<int>(_1322);
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1436 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1440 = _1438 != 0;
    float _1442 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1426);
    float _1444 = _1430 ? as_type<float>(_1432) : _1322;
    float _1446 = fma(_1402, -2.0, _1434);
    float _1448 = -_1336;
    float _1450 = fma(_1436, 2.0, _1448);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1454 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = fma(_1444, _1362, -0.5);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1460 = _1458 != 0;
    float _1462 = fma(_1454, _1420, -0.5);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1466 = _1460 ? as_type<float>(_1424) : _1322;
    float _1468 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1446);
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1472 = _1464;
    int _1474 = as_type<int>(_1468);
    float _1476 = _1340;
    float _1478 = _1330;
    if (_1320)
    {
        _1470 = _1310;
    }
    float _1480 = _1470;
    float _1482 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1464);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1486 = _1480;
    if (!_1320)
    {
        _1486 = _1340;
    }
    float _1488 = _1486;
    int _1490 = 0;
    if (_1440)
    {
        float _1492 = -_1306;
        float _1494 = _1492 + 1.0;
        _1490 = as_type<int>(_1494);
    }
    int _1496 = _1490;
    float _1498 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1482);
    float _1500 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1502 = _338 != 0.0;
    bool _1504 = isnan(_338);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1514 = -_1468;
    float _1516 = fma(_1498, _1462, _1514);
    float _1518 = fma(_1466, _1500, -0.5);
    float _1520 = in.m_73.x;
    float _1522 = in.m_73.y;
    float _1524 = in.m_73.z;
    float _1526 = as_type<float>(_1496);
    if (!_1320)
    {
        _1472 = _1330;
    }
    float _1528 = _1472;
    float _1530 = -_1484;
    float _1532 = fma(_1512, 2.0, _1530);
    float _1534 = _1528;
    if (_1320)
    {
        _1534 = _1310;
    }
    float _1536 = _1534;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1540 = _336 == 0.0;
    bool _1542 = !_1510;
    bool _1544 = _1540 && _1542;
    if (_1396)
    {
        float _1546 = -_1306;
        float _1548 = _1546 + 1.0;
        _1474 = as_type<int>(_1548);
    }
    int _1550 = _1474;
    float _1552 = 0.0;
    if (!_1396)
    {
        _1552 = _1306;
    }
    float _1554 = _1552;
    float _1556 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1538);
    bool _1558 = _340 == 0.0;
    bool _1560 = _1558 && _1544;
    float _1562 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1564 = _1554;
    if (_1396)
    {
        float _1566 = _1416 ? as_type<float>(_1550) : _1306;
        _1564 = _1566;
    }
    float _1568 = _1564;
    float _1570 = -_152;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1532);
    if (_1440)
    {
        float _1574 = _1400 ? as_type<float>(_1496) : _1306;
        _1348 = _1574;
    }
    float _1576 = _1348;
    float _1578 = -_1338;
    float _1580 = fma(_1562, 2.0, _1578);
    if (!_1320)
    {
        _1526 = _1340;
    }
    float _1582 = _1526;
    float _1584 = in.m_75.x;
    float _1586 = in.m_75.y;
    float _1588 = in.m_75.z;
    float _1590 = in.m_75.w;
    float _1592 = _1582;
    if (_1320)
    {
        _1592 = _1330;
    }
    float _1594 = _1592;
    float _1596 = fma(_1418, _1568, -0.5);
    if (_1320)
    {
        _1476 = _1330;
    }
    float _1598 = _1476;
    float _1600 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1602 = _1600;
    if (!_1320)
    {
        _1478 = _1310;
    }
    float _1604 = _1478;
    float _1606 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1380);
    float _1608 = -_1408;
    float _1610 = _1608 + 1.0;
    if (_1560)
    {
        _1350 = _1520;
    }
    float _1612 = _1350;
    float _1614 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1616 = 0.0;
    float _1618 = _1612;
    if (_1560)
    {
        _1616 = _1522;
    }
    float _1620 = _1616;
    float _1622 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1606);
    float _1624 = _1620;
    if (_1560)
    {
        _1370 = _1612;
    }
    float _1626 = _1370;
    float _1628 = _1604 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1630 = _1626;
    if (!_1560)
    {
        _1618 = _1520;
    }
    float _1632 = _1618;
    float _1634 = -_324;
    float _1636 = _1634 + 1.0;
    float _1638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1560)
    {
        _1384 = _1620;
    }
    float _1640 = _1384;
    out.gl_Position.x = _897;
    out.gl_Position.y = _899;
    out.gl_Position.z = _1600;
    out.gl_Position.w = _869;
    float _1642 = _1640;
    if (!_1560)
    {
        _1624 = _1522;
    }
    float _1644 = _1624;
    if (!_1560)
    {
        float _1646 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1632);
        _1630 = _1646;
    }
    float _1648 = _1630;
    float _1650 = -_152;
    float _1652 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1450);
    float _1654 = 0.0;
    if (_1560)
    {
        _1654 = _1524;
    }
    float _1656 = _1654;
    float _1658 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1664 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1666 = _1656;
    if (_1560)
    {
        _1372 = _1656;
    }
    float _1668 = _1372;
    float _1670 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    float _1672 = fma(_1614, -2.0, _1662);
    float _1674 = _1668;
    if (!_1560)
    {
        _1666 = _1524;
    }
    float _1676 = _1666;
    float _1678 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1660);
    float _1680 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1664);
    float _1682 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1560)
    {
        float _1684 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1642 = _1684;
    }
    float _1686 = _1642;
    float _1688 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1398);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1670);
    float _1692 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1678);
    float _1694 = fma(_1588, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1680);
    float _1696 = fma(_1682, _1576, -0.5);
    if (!_1560)
    {
        float _1698 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1676);
        _1674 = _1698;
    }
    float _1700 = _1674;
    float _1702 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1556);
    float _1704 = fma(_1688, _1414, _1652);
    float _1706 = -_152;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1580);
    float _1710 = _1588 * _1632;
    out.m_77.x = _1690;
    out.m_77.y = _1692;
    out.m_77.z = _1694;
    float _1712 = _1586 * _1676;
    float _1714 = fma(_1702, _1596, _1708);
    float _1716 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1378);
    float _1718 = abs(_406);
    float _1720 = log2(_1718);
    float _1722 = -_1712;
    float _1724 = fma(_1588, _1644, _1722);
    float _1726 = _1704 + 0.5;
    float _1728 = _1714 + 0.5;
    float _1730 = _1724 * _1590;
    float _1732 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1736 = -_1710;
    float _1738 = fma(_1584, _1676, _1736);
    float _1740 = _1584 * _1644;
    float _1742 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_79.w = _1734;
    float _1744 = -_1740;
    float _1746 = fma(_1586, _1632, _1744);
    float _1748 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1672);
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1752 = _1738 * _1590;
    float _1754 = _1746 * _1590;
    float _1756 = -_1748;
    float _1758 = fma(_1622, _1518, _1756);
    float _1760 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1422);
    float _1762 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1764 = fma(_1628, -2.0, _1750);
    float _1766 = _1516 + 0.5;
    float _1768 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1762);
    float _1770 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1772 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1764);
    float _1774 = _1758 + 0.5;
    float _1776 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1778 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1780 = -_1772;
    float _1782 = fma(_1760, _1456, _1780);
    float _1784 = exp2(_1770);
    out.m_81.x = _1726;
    out.m_81.y = _1766;
    out.m_81.z = _1728;
    out.m_81.w = _1774;
    float _1786 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1788 = _406 <= 8000.0;
    bool _1790 = isnan(_406);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(8000.0);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1776);
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1778);
    float _1804 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1786);
    float _1806 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1732);
    float _1808 = fma(_1716, _1696, _1572);
    float _1810 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1802);
    float _1812 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1742);
    out.m_83.x = _753;
    out.m_83.y = _751;
    out.m_83.z = _755;
    float _1814 = _1808 + 0.5;
    float _1816 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1818 = precise::clamp(_1816, 0.0, 1.0);
    float _1820 = _1782 + 0.5;
    float _1822 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1804);
    float _1824 = fma(_1754, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1800);
    float _1826 = fma(_1818, -2.0, 3.0);
    float _1828 = _1818 * _1818;
    float _1830 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1768);
    float _1832 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1812);
    out.m_85.x = _1822;
    out.m_85.y = _1824;
    out.m_85.z = _1810;
    float _1834 = _1828 * _1826;
    float _1836 = fma(_1700, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1806);
    out.m_87.x = _1814;
    out.m_87.y = _1820;
    float _1838 = -_1834;
    float _1840 = _1838 + 1.0;
    out.m_89.x = _1830;
    out.m_89.y = _1836;
    out.m_89.z = _1832;
    float _1842 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1834);
    float _1844 = _1600 + _869;
    float _1846 = _1822;
    if (!_853)
    {
        _1846 = 1.0;
    }
    float _1848 = _1846;
    float _1850 = _1798 * _1842;
    float _1852 = _1844 * 0.5;
    float _1854 = _1848;
    if (_853)
    {
        bool _1856 = _975 >= _915;
        bool _1858 = isnan(_975);
        bool _1860 = _1856 || _1858;
        bool _1862 = isnan(_915);
        bool _1864 = _1860 || _1862;
        float _1866 = float(_1864);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1872 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _1874 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1876 = isnan(_1086);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1882 = _1878 || _1880;
    out.m_91.z = _1852;
    out.m_91.w = _869;
    float _1884 = _1870 * _977;
    float _1886 = _1636 * _1872;
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = _1868 * _1064;
    float _1892 = -_1870;
    float _1894 = _1892 + 1.0;
    float _1896 = _988 * _1884;
    float _1898 = -_1888;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1902 = _988 * _1894;
    float _1904 = -_1890;
    float _1906 = fma(_1904, _1900, 1.0);
    float _1908 = precise::clamp(_1906, 0.0, 1.0);
    float _1910 = _1870;
    float _1912 = _1908;
    float _1914 = _1894;
    if (!_1882)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1916 = _1910;
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1920 = _1916;
    float _1922 = _1916;
    if (!_1882)
    {
        _1912 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1924 = _1912;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1882)
    {
        _881 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1930 = _881;
    out.m_93.x = _1918;
    float _1932 = _1930;
    float _1934 = _1930;
    if (!_1882)
    {
        _1602 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1936 = _1602;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1882)
    {
        _905 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1942 = _905;
    float _1944 = _1942;
    float _1946 = _1942;
    if (!_1882)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1948 = _1914;
    float _1950 = _1304 * _1884;
    float _1952 = fma(_1300, _1896, _982);
    float _1954 = fma(_1302, _1896, _984);
    float _1956 = fma(_988, _1950, _986);
    out.m_95.x = _1952;
    out.m_95.y = _1954;
    out.m_95.z = _1956;
    out.m_95.w = _1902;
    bool _1958 = !_1882;
    float _1960 = _1948;
    float _1962 = _1948;
    if (!_1958)
    {
        bool _1964 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1966 = isnan(_1086);
        bool _1968 = _1964 || _1966;
        bool _1970 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1972 = _1968 || _1970;
        if (!_1972)
        {
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1976 = _1086 + _1974;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1980 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1978;
            float _1982 = 1.0 / _1980;
            float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1986 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1990 = _1988 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1994 = _1992 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2004 = _1976 * _1982;
            float _2006 = precise::clamp(_2004, 0.0, 1.0);
            float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2012 = fma(_2006, _1986, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2014 = fma(_2006, _2010, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2016 = fma(_2006, _1990, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2018 = fma(_2006, _1994, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2020 = fma(_2006, _1998, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2022 = fma(_2006, _2002, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1928 = _2014;
            _1946 = _2020;
            _1922 = _2012;
            _1940 = _2018;
            _1934 = _2016;
            _1962 = _2022;
            _2024 = true;
        }
        else
        {
            bool _2026 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2028 = isnan(_1086);
            bool _2030 = _2026 || _2028;
            bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2034 = _2030 || _2032;
            if (!_2034)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2036 = _1920;
            _1922 = _2036;
            if (!_2034)
            {
                _1926 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2038 = _1926;
            _1928 = _2038;
            if (!_2034)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2040 = _1932;
            _1934 = _2040;
            if (!_2034)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2042 = _1938;
            _1940 = _2042;
            if (!_2034)
            {
                _1944 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2044 = _1944;
            _1946 = _2044;
            if (!_2034)
            {
                _1960 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2046 = _1960;
            bool _2048 = !_2034;
            _1962 = _2046;
            if (!_2048)
            {
                bool _2050 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2052 = isnan(_1086);
                bool _2054 = _2050 || _2052;
                bool _2056 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2058 = _2054 || _2056;
                if (!_2058)
                {
                    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2062 = _1086 + _2060;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2066 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2064;
                    float _2068 = 1.0 / _2066;
                    float _2070 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2076 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2080 = _2078 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2084 = _2082 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2086 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2088 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2090 = _2062 * _2068;
                    float _2092 = precise::clamp(_2090, 0.0, 1.0);
                    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2098 = fma(_2092, _2072, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2100 = fma(_2092, _2096, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2102 = fma(_2092, _2076, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2104 = fma(_2092, _2080, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2106 = fma(_2092, _2084, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2108 = fma(_2092, _2088, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1928 = _2100;
                    _1946 = _2106;
                    _1922 = _2098;
                    _1940 = _2104;
                    _1934 = _2102;
                    _1962 = _2108;
                    _2024 = true;
                }
                else
                {
                    _1928 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1946 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1962 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2024 = false;
    float _2110 = _1928;
    float _2112 = _1946;
    float _2114 = _1922;
    float _2116 = _1940;
    float _2118 = _1934;
    float _2120 = _1962;
    float _2122 = fma(_1836, -0.5, 0.5);
    float _2124 = precise::clamp(_2122, 0.0, 1.0);
    float _2126 = -_2110;
    float _2128 = _2126 + _2112;
    float _2130 = -_2114;
    float _2132 = _2130 + _2116;
    float _2134 = -_2118;
    float _2136 = _2134 + _2120;
    bool _2138 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2140 = fma(_2124, _2128, _2110);
    float _2142 = fma(_2124, _2132, _2114);
    float _2144 = fma(_2124, _2136, _2118);
    float _2146 = _2140 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2148 = fma(_2142, 0.298911988735198974609375, _2146);
    float _2150 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2152 = fma(_2144, 0.114477999508380889892578125, _2148);
    out.m_93.w = _2150;
    float _2154 = -_2152;
    float _2156 = _2142 + _2154;
    float _2158 = -_2152;
    float _2160 = _2140 + _2158;
    float _2162 = -_2152;
    float _2164 = _2144 + _2162;
    out.m_97.x = 0.0;
    float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    float _2168 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    float _2170 = fma(_2164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2152);
    out.m_99.x = _2166;
    out.m_99.y = _2168;
    out.m_99.z = _2170;
    if (!_2138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2172 = -_751;
    float _2174 = _2172 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2176 = -_753;
    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2180 = -_755;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = sqrt(_2188);
    float _2192 = rsqrt(_2188);
    float _2194 = -_2190;
    float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2198 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2200 = precise::clamp(_2198, 0.0, 1.0);
    float _2202 = _2178 * _2192;
    float _2204 = _2174 * _2192;
    float _2206 = abs(_2200);
    float _2208 = log2(_2206);
    float _2210 = _2182 * _2192;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2214 = _1836 * _2204;
    float _2216 = -_2204;
    float _2218 = -_2212;
    float _2220 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2218);
    float _2222 = fma(_1830, _2202, _2214);
    float _2224 = -_2210;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2220);
    float _2228 = fma(_1832, _2210, _2222);
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2234 = _2226 + _2232;
    float _2236 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2238 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = exp2(_2236);
    float _2244 = _2242 * _2240;
    float _2246 = _2230 * _2244;
    float _2248 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2252 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2248;
    out.m_97.y = _2250;
    out.m_97.z = _2252;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

